
-- Callback for the "not enough profiles" (QA bug 793) error
function ifs_main_CantEnterSplitOk()
	local this = ifs_main
	IFObj_fnSetVis(this.buttons,1)
end

ifsmain_vbutton_layout = {
--	yTop = -70, -- auto-calc'd now
	xWidth = 250, -- Set to 250 NM 8/13/04 to fit the "profile management" spam
	width = 250,
	xSpacing = 6,
	ySpacing = 5,
	font = "gamefont_medium",
	buttonlist = { 
		{ tag = "sp", string = "ifs.main.sp", },
		{ tag = "mp", string = "ifs.main.mp", },
		{ tag = "split", string = "ifs.main.split", },
		{ tag = "tutorials", string = "ifs.main.tutorials", },
		{ tag = "opts", string = "ifs.main.options", },
		{ tag = "back2", string = "ifs.main.profiles", },
		{ tag = "quit", string = "common.quit2windows", },
	},
	title = "ifs.main.title",
}

-- 
function ifs_main_fnQuitPopupDone(bResult)
	local this = ifs_main
	IFObj_fnSetVis(this.buttons,1)

	if(bResult) then
		ScriptCB_QuitToWindows()
	end
end

-- Callback from the 'No network adaptor' popup
function ifs_main_fnPostNoNetHW()
	local this = ifs_main
	local fAnimTime = 0.3
	AnimationMgr_AddAnimation(this.buttons,
														{ fTotalTime = fAnimTime, fStartAlpha = 0, fEndAlpha = 1,})
end

----------------------------------------------------------------------------------------
-- try to exit backwards.  if the current profile is dirty, warn and prompt a save
----------------------------------------------------------------------------------------

function ifs_main_TryToBackup()
--	print("ifs_main_TryToBackup")
	
	-- is the current profile dirty?
	if(ScriptCB_IsCurProfileDirty()) then
--		print("profile dirty, prompting save")
		
		-- hide this screen
		IFObj_fnSetVis(ifs_main.buttons,nil)
		
		-- set the load/save title text
		IFText_fnSetString(Popup_LoadSave2.title,"ifs.loadsave_ps2.save24")
		
		-- set the button text
		IFText_fnSetString(Popup_LoadSave2.buttons.A.label,"ifs.loadsave_ps2.saveandexit")
		IFText_fnSetString(Popup_LoadSave2.buttons.B.label,"ifs.loadsave_ps2.exitnosave")
		IFText_fnSetString(Popup_LoadSave2.buttons.C.label,"ifs.loadsave_ps2.cancel")
		-- set the button visiblity
		Popup_LoadSave2:fnActivate(1)
		IFObj_fnSetVis(Popup_LoadSave2.buttons.A.label,1)
		IFObj_fnSetVis(Popup_LoadSave2.buttons.B.label,1)
		IFObj_fnSetVis(Popup_LoadSave2.buttons.C.label,1)
		Popup_LoadSave2_ResizeButtons()
		Popup_LoadSave2_SelectButton(1)
		IFObj_fnSetVis(Popup_LoadSave2,1)
		Popup_LoadSave2.fnAccept = ifs_main_SaveDirtyAccept
		return
	end
	
	-- not dirty, backup
--	print("profile not dirty, backing up")
	ScriptCB_Logout()
	ifs_login.EnterDoNothing = nil
	ScriptCB_PopScreen()
	
end

function ifs_main_SaveDirtyAccept(fRet)
	Popup_LoadSave2.fnAccept = nil
	Popup_LoadSave2:fnActivate(nil)

	-- show this screen
	IFObj_fnSetVis(ifs_main.buttons,1)

	if(fRet < 1.5) then
--		print("ifs_main_SaveDirtyAccept(A - Save)")
		ifs_main_SaveAndBackup()
	elseif(fRet < 2.5) then
--		print("ifs_main_SaveDirtyAccept(B - Exit without saving)")
		ScriptCB_Logout()
		ifs_login.EnterDoNothing = nil		
		ScriptCB_PopScreen()
	else
--		print("ifs_main_SaveDirtyAccept(C - Cancel)")
		-- do nothing, just stay in ifs_main
	end	
end

function ifs_main_SaveAndBackup()
--	print("ifs_main_SaveAndBackup")
	
	ifs_saveop.doOp = "SaveProfile"
	ifs_saveop.OnSuccess = ifs_main_SaveProfileSuccess
	ifs_saveop.OnCancel = ifs_main_SaveProfileCancel
	ifs_saveop.saveName = ScriptCB_GetProfileName(1)
	ifs_saveop.saveProfileNum = 1
	ifs_saveop.NoPromptSave = 1
	ifs_movietrans_PushScreen(ifs_saveop)	
	
end

function ifs_main_SaveProfileSuccess()
--	print("ifs_main_SaveProfileSuccess")
	
	ScriptCB_Logout()
	ifs_login.EnterDoNothing = nil

	-- pop to login
	ScriptCB_PopScreen("ifs_login")
end

function ifs_main_SaveProfileCancel()
--	print("ifs_main_SaveProfileCancel")
	
	-- back to the "its dirty, save?" prompt when we enter
	ifs_main.TryToBackup = 1
	-- pop ifs_saveop, return to ifs_main
	ScriptCB_PopScreen()
end

----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------


--function ifs_main_OnLoginDone()
--	print("ifs_main_OnLoginDone")
--	local this = ifs_main
--	
--	-- where did we want to go?
--	ifs_movietrans_PushScreen(this.gotoAfterLogin)
--end

function ifs_main_GotoLoginScreen(this, afterScreen)
--	-- this is where we go when we're done with the login screen
--	this.gotoAfterLogin = afterScreen
--	-- this is what gets called by the login screen to say its done
--	ifs_login.fnDone = ifs_main_OnLoginDone
--	-- go there
--	ifs_movietrans_PushScreen(ifs_login)
	
	ifs_movietrans_PushScreen(afterScreen)
end

-- Helper function, called from several pages. Updates the silent login box
function ifs_XLive_fnUpdateSilentLoginBox(this)
	this.fSilentLoginTimer = 0.5 -- reset timer

	local ShowUStr,bSmallFont = ScriptCB_XL_GetSilentLoginState()
	if(bSmallFont) then
		if(ScriptCB_GetLanguage() == "english") then
			IFText_fnSetFont(this.LoginInfoWindow.ShowText,"gamefont_small")
		else
			IFText_fnSetFont(this.LoginInfoWindow.ShowText,"gamefont_tiny")
		end
	else
		IFText_fnSetFont(this.LoginInfoWindow.ShowText,"gamefont_medium")
	end
	IFText_fnSetUString(this.LoginInfoWindow.ShowText,ShowUStr)
end


ifs_main = NewIFShellScreen {
	bNohelptext_backPC = 1,

	buttons = NewIFContainer {
		ScreenRelativeX = 0.5, -- center
		ScreenRelativeY = 0.65, -- top
		y = 30, -- offset slightly down
		x = -30,
		rotY = -30,
		rotX = -20,
		rotZ = 1,
	},
		
	movieIntro      = "ifs_main_intro",
	movieBackground = "ifs_main",
	music           = "shell_soundtrack",

	Enter = function(this, bFwd)
--		print("ifs_main.Enter(",bFwd,")")
		gIFShellScreenTemplate_fnEnter(this, bFwd) -- call default enter function
		
		if(gPlatformStr == "PC") then
			this.buttons.tutorials.hidden = 1
		end
		-- if we should attempt to back up, do it
		if(this.TryToBackup) then
			this.TryToBackup = nil
			ifs_main_TryToBackup()
			return
		end
		
		-- if we ever enter going backwards, clear these vars
		if(not bFwd) then
			ScriptCB_SetSplitscreen( nil )
			ScriptCB_SetInNetGame( nil )
		end
		
		--if we're booting from NTGUI, skip forward
		if(ScriptCB_SkipToNTGUI()) then
--			ifs_main_GotoLoginScreen(this, ifs_mpps2_netconfig)
			ifs_main_GotoLoginScreen(this, ifs_mp)
		end

		if(not bFwd) then
			ScriptCB_UnbindController(2)
			ScriptCB_UnbindController(3)
			ScriptCB_UnbindController(4)
		end
		
		if(bFwd and ScriptCB_IsSpecialJoinPending()) then
			ifs_main_GotoLoginScreen(this, ifs_mp)
		elseif (bFwd and ScriptCB_IsCmdlineJoinPending()) then
			ifs_mp_lobby_quick.bCmdlineJoinPending = 1
			ifs_main_GotoLoginScreen(this, ifs_mp)
		elseif (bFwd and ScriptCB_InMultiplayer()) then
			--ScriptCB_SndBusFade("music", 0.5, 0.0) -- fade out music
			-- Note: ps2 could go to ifs_mpps2_netconfig here, but I'd
			-- rather assume they want to use the previous netconfig. If they
			-- back all the way out to here, they can select another manually.
			-- Hopefully that'll let us get thru Sony
			ifs_main_GotoLoginScreen(this, ifs_mp)
		elseif(bFwd and ScriptCB_IsMetagameStateSaved()) then
			if(ScriptCB_WasSplitscreen and ScriptCB_WasSplitscreen()) then
				ScriptCB_SetSplitscreen(1)
			end
			ifs_main_GotoLoginScreen(this, ifs_sp)
		elseif (bFwd and ScriptCB_IsSPStateSaved()) then
			if(ScriptCB_WasSplitscreen and ScriptCB_WasSplitscreen()) then
				ScriptCB_SetSplitscreen(1)
			end
			ifs_main_GotoLoginScreen(this, ifs_sp)
		else
			-- Staying here... make sure other controllers are unbound, 
			-- [Fix for 7005 - NM 7/24/004]
			ScriptCB_UnbindController(2)
			ScriptCB_UnbindController(3)
			ScriptCB_UnbindController(4)
		end

		this.buttons.quit.hidden = (gPlatformStr ~= "PC")
		this.buttons.back2.hidden = (gPlatformStr ~= "PC")
		this.buttons.split.hidden = (gPlatformStr == "PC")
		this.buttons.tutorials.hidden = (gPlatformStr == "PC")

		ShowHideVerticalButtons(this.buttons,ifsmain_vbutton_layout)

		if(gPlatformStr == "XBox") then
			ifs_XLive_fnUpdateSilentLoginBox(this)
		end

		IFObj_fnSetVis(this.LoginInfoWindow, (gPlatformStr == "XBox"))
	end,

	Exit = function(this, bFwd)
		if (not bFwd) then
			ifelm_shellscreen_fnPlaySound(this.exitSound)
		end
	end,

	iNumControllers = 8, -- default value for all platforms, XBox will change this
	fSplitColor = 255,
	fLogTimer = 0.5,
	Update = function(this, fDt)
		-- Call base class functionality
		gIFShellScreenTemplate_fnUpdate(this, fDt)

		if(gPlatformStr ~= "PC") then
			local iNumControllers = ScriptCB_GetNumControllers()
			if(this.iNumControllers ~= iNumControllers) then
				this.iNumControllers = iNumControllers
				if(this.iNumControllers < 2) then
					this.fSplitColor = 110
					-- Move off option if on it.
					if(this.CurButton == "split") then
						this:Input_GeneralUp()
					end
				else
					this.fSplitColor = 255
				end
			end -- # of controllers changed since last frame

			ScriptCB_IFFlashyText_SetTextColor(this.buttons.split.label.cpointer, this.fSplitColor , this.fSplitColor , this.fSplitColor)
		end -- XBox-only code

		if(gPlatformStr == "XBox") then
			this.fSilentLoginTimer = this.fSilentLoginTimer - fDt
			if(this.fSilentLoginTimer < 0) then
				ifs_XLive_fnUpdateSilentLoginBox(this)
			end
		end

	end,

	Input_Back = function(this)
		-- if going backwards (to the login screen), log out
		ifs_main_TryToBackup()
	end,

	Input_Accept = function(this)
		-- If base class handled this work, then we're done
		if(gShellScreen_fnDefaultInputAccept(this)) then
			return
		end

		if(this.CurButton) then
			ifelm_shellscreen_fnPlaySound(this.acceptSound)
		end

--		print("  ***  ifs_main::Input_Accept. Cur = ",this.CurButton)
		if(this.CurButton == "sp") then
			ifs_sp.bForSplitScreen = nil
			ScriptCB_SetSplitscreen( nil )
			ScriptCB_SetInNetGame( nil )
			ifs_main_GotoLoginScreen(this, ifs_sp)
						
		elseif (this.CurButton == "mp") then

			local bPresent = 1
			if(ScriptCB_IsNetHWPresent) then
				bPresent = ScriptCB_IsNetHWPresent()
			end
			if(not bPresent) then
				Popup_Ok_Large.fnDone = ifs_main_fnPostNoNetHW
				IFText_fnSetString(Popup_Ok_Large.title,"ifs.mp.no_net_adaptor")
				Popup_Ok_Large:fnActivate(1)
				local fAnimTime = 0.2
				AnimationMgr_AddAnimation(this.buttons,
																	{ fTotalTime = fAnimTime, fStartAlpha = 1, fEndAlpha = 0,})
			else
				ifs_sp.bForSplitScreen = nil
				ScriptCB_SetSplitscreen( nil )
				--ScriptCB_SndBusFade("music", 0.5, 0.0) -- fade out music
				
				--			if(gPlatformStr == "PS2") then
				--				ifs_main_GotoLoginScreen(this, ifs_mpps2_netconfig)
				--			else
				ifs_main_GotoLoginScreen(this, ifs_mp)
				--			end
			end -- Has network adaptor
		elseif (this.CurButton == "split") then
			ifs_sp.bForSplitScreen = 1
			ScriptCB_SetSplitscreen( 1 )
			ifs_movietrans_PushScreen(ifs_split_profile)
		elseif (this.CurButton == "tutorials") then
			ifs_movietrans_PushScreen(ifs_tutorials)
		elseif (this.CurButton == "opts") then
			ifs_main_GotoLoginScreen(this, ifs_opt_contmain)
		elseif (this.CurButton == "quit") then
			Popup_YesNo.CurButton = "no" -- default
			Popup_YesNo.fnDone = ifs_main_fnQuitPopupDone
			IFText_fnSetString(Popup_YesNo.title,"ifs.main.askquit")
			IFObj_fnSetVis(this.buttons,nil)
			Popup_YesNo:fnActivate(1)
		elseif (this.CurButton == "back2") then
			-- Why we need another button to go back is beyond me.
			ifs_main_TryToBackup()
		end
	end,

	-- Gotta skip over splitscreen option if there's not enough controllers.
	Input_GeneralUp = function(this)
		-- If base class handled this work, then we're done
		if(gShellScreen_fnDefaultInputUp(this)) then
			return
		end

		gDefault_Input_GeneralUp(this)
		if((this.CurButton == "split") and (this.iNumControllers < 2)) then
			gDefault_Input_GeneralUp(this) -- move cursor off item
		end
	end,

	Input_GeneralDown = function(this)
		-- If base class handled this work, then we're done
		if(gShellScreen_fnDefaultInputDown(this)) then
			return
		end

		gDefault_Input_GeneralDown(this)
		if((this.CurButton == "split") and (this.iNumControllers < 2)) then
			gDefault_Input_GeneralDown(this) -- move cursor off item
		end
	end,
}

function ifs_main_fnBuildScreen(this)

	if(HackBGTextureOnPCOnly) then
		this.bg_texture = HackBGTextureOnPCOnly("main")
	end


	this.CurButton = AddVerticalButtons(this.buttons,ifsmain_vbutton_layout)

	-- Even with the larger window, german needs more space. Too bad it
	-- has to come at the expense of readability. - NM 7/5/04
	if(ScriptCB_GetLanguage() == "german") then
		local k,v
		for k,v in ifsmain_vbutton_layout.buttonlist do
			local Tag = v.tag
			this.buttons[Tag].label.font = "gamefont_small"
		end
	elseif (ScriptCB_GetLanguage() == "italian") then
		this.buttons._titlebar_.font = "gamefont_small"
	end

	local InfoWindowW = 270
	local InfoWindowH = 75

	this.LoginInfoWindow = NewButtonWindow {
		ScreenRelativeY = 0.0, -- top
		ScreenRelativeX = 1.0, -- right
		x = InfoWindowW * -0.5,
		y = InfoWindowH * 0.5,
		width = InfoWindowW,
		height = InfoWindowH,
		ZPos = 200,
	}

	this.LoginInfoWindow.ShowText = NewIFText {
		font = "gamefont_medium",
		textw = InfoWindowW - 24,
		texth = InfoWindowH - 24,
		nocreatebackground = 1,		
		startdelay = random() * 0.5,
		valign = "vcenter",
	}


end

ifs_main_fnBuildScreen(ifs_main)
ifs_main_fnBuildScreen = nil
AddIFScreen(ifs_main,"ifs_main")
