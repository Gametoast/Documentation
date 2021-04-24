-- Helper function. Given a layout (x,y,width, height), returns a
-- fully-built item.


--ifslogin_vbutton_layout = {
--	yTop = 0,
--	yHeight = 40,
--	ySpacing  = 5,
--	width = 300,
--	font = "gamefont_medium",
--	title = "ifs.profile.selection", --temp, needs to get set '_titlebar_'
--	buttonlist = { 
--		{ tag = "new", string = "ifs.profile.create", },
--		{ tag = "delete", string = "ifs.profile.delete", },
--	}, 	
--	--flashy = 0,
--}


function ifs_login_listbox_CreateItem(layout)
	-- Make a coordinate system pegged to the top-left of where the cursor would go.
	local Temp = NewIFContainer { x = layout.x - 0.5 * layout.width, y=layout.y}
	Temp.NameStr = NewIFText{ x = 10, y = -10, halign = "left", font = "gamefont_medium", textw = 220, nocreatebackground = 1, startdelay=random()*0.5, }
	return Temp
end

-- Helper function. For a destination item (previously created w/
-- CreateItem), fills it in with data, which may be nil (==blank it)
function ifs_login_listbox_PopulateItem(Dest,Data)
	if(Data) then
		-- Show this entry
		IFText_fnSetUString(Dest.NameStr,Data.showstr)
		IFObj_fnSetVis(Dest.NameStr,1)
	else
		-- Blank this entry
		IFText_fnSetString(Dest.NameStr,"")
		IFObj_fnSetVis(Dest.NameStr,nil)
	end
end


ifs_login_listbox_contents = {
}

loginshowcount = 5
ifs_login_listbox_layout = {
	showcount = 5,
	yHeight = 34,
	ySpacing  = 0,
	width = 260,
	x = 0,
	slider = 1,
--	bgwindow =1,
--	dropdown = 1,
	CreateFn = ifs_login_listbox_CreateItem,
	PopulateFn = ifs_login_listbox_PopulateItem,
	
}

function ifs_login_fnQuitPopupDone(bResult)

	if(bResult) then
		ScriptCB_QuitToWindows()
	end
end

-- Sets the hilight on the listbox, create button given a hilight
function ifs_login_SetHilight(this,aListIndex)
	if(gE3Build or aListIndex) then
		-- Deactivate 'create' button, if applicable.
		if(gCurHiliteButton) then
			IFButton_fnSelect(gCurHiliteButton,nil) -- Deactivate old button
			gCurHiliteButton = nil
			this.CurButton = nil
			print("Zapping cur button w/ hilight ",aListIndex)
		end
	else
		-- Not in listindex. Focus is on the create buttons
-- 		this.CurButton = "new"
-- 		gCurHiliteButton = this.buttons[this.CurButton]
-- 		IFButton_fnSelect(gCurHiliteButton,1) -- Activate button
	end

	if(ScriptCB_GetPlatform() ~= "PC") then
		IFObj_fnSetVis(this.Helptext_Delete,aListIndex and (not gE3Build) and (not gDemoBuild))
		IFObj_fnSetVis(this.Helptext_Accept2,1)
	end

	ifs_login_listbox_layout.SelectedIdx = aListIndex
	ifs_login_listbox_layout.CursorIdx = aListIndex
	ListManager_fnFillContents(this.listbox,ifs_login_listbox_contents,ifs_login_listbox_layout)

end

function ifs_login_fnNotUniqueOk()
	-- Re-enable parts of vkeyboard we disabled
--	IFObj_fnSetVis(ifs_vkeyboard.title,1)
	IFObj_fnSetVis(ifs_vkeyboard.deletegroup,1)
	IFObj_fnSetVis(ifs_vkeyboard.modegroup,1)
--	IFObj_fnSetVis(ifs_vkeyboard.Helptext_Accept2,1)
	IFObj_fnSetVis(ifs_vkeyboard.buttons,1)
end

-- Callback function from VK - returns 2 values, whether the current
-- string is allowed to be entered, and a localize database key string
-- as to why it's not acceptable.
function ifs_login_fnIsAcceptable()
	return (strlen(ifs_vkeyboard.CurString) > 2),"ifs.vkeyboard.tooshort"
end

function ifs_login_fnDifficultyDone()
	-- reenter ifs_login, but go right to SaveAndExit
	ifs_login.SaveAndExit = 1
	ifs_difficulty.LogoutOnCancel = nil
	ScriptCB_PopScreen() -- back to this screen, ifs_login
end

-- Callback function when the virtual keyboard is done
function ifs_login_fnKeyboardDone()
	if(strlen(ifs_vkeyboard.CurString) > 2) then
		local UCurString = ifs_vkeyboard.CurString

		if(ScriptCB_IsUniqueLoginName(UCurString)) then
			ScriptCB_AddProfile(UCurString)
            -- sound changed mix configuration, we'll have to reopen the 
            -- movie and music
            if (ScriptCB_GetMixConfigChanged()) then
                ifs_opt_sound_closeShellSound() 
                ifs_opt_sound_restoreShellSound()
            end
			
			gSelection = {}
			gSelection.showstr = UCurString
			--			RoundIFButtonLabel_fnSetUString(ifs_login.buttons["dropdown"], ScriptCB_UnicodeStrCat( ScriptCB_tounicode("CURRENT PROFILE:")  ,UCurString ) ) 
			
			ifs_vkeyboard.CurString = "" -- clear
			vkeyboard_specs.fnDone = nil -- clear our registration there
			ifs_difficulty.fnDone = ifs_login_fnDifficultyDone
			ifs_difficulty.LogoutOnCancel = 1
			ifs_movietrans_PushScreen(ifs_difficulty)
			gSelection.showstr = UCurString
		else
			-- Hide chunks of vkeyboard
			--			IFObj_fnSetVis(ifs_vkeyboard.title,nil)
			IFObj_fnSetVis(ifs_vkeyboard.deletegroup,nil)
			IFObj_fnSetVis(ifs_vkeyboard.modegroup,nil)
			--			IFObj_fnSetVis(ifs_vkeyboard.Helptext_Accept2,nil)
			IFObj_fnSetVis(ifs_vkeyboard.buttons,nil)

			Popup_Ok.fnDone = ifs_login_fnNotUniqueOk
			IFText_fnSetString(Popup_Ok.title,"ifs.Profile.dupname")
			Popup_Ok:fnActivate(1)
		end
	end
end

-- Helper function: turns pieces on/off as requested
function ifs_login_fnSetPieceVis(this,bNormalVis)
	
	if( gButtonMode == 1) then 
		IFObj_fnSetVis(this.listbox,nil)
	else
		print("OK, Show the listbox")
		IFObj_fnSetVis(this.listbox,bNormalVis)
	end
	
	if(bNormalVis) then
		ifs_login_fnRegetListbox(this)
		if(this.ListFull) then
			IFObj_fnSetVis(this.buttons,nil)
		end
	end

end

function ifs_login_fnRegetListbox(this)
	-- Reset listbox, show it. [Remember, Lua starts at 1!]
	local MaxCount = ScriptCB_GetLoginList("ifs_login_listbox_contents")
	local ListCount = getn(ifs_login_listbox_contents)

	this.ListFull = (ListCount >= MaxCount)

	ifs_login_listbox_layout.FirstShownIdx = 1 -- top
	if(ListCount > 0) then
		-- Auto-select first item
		ifs_login_SetHilight(this,1)
	else
		-- Auto-select 'create' button
		ifs_login_SetHilight(this,nil)
	end
	ListManager_fnFillContents(this.listbox,ifs_login_listbox_contents,ifs_login_listbox_layout)
end

----------------------------------------------------------------------------------------
-- switch between the two visible modes of this screen (select-from-list and create)
----------------------------------------------------------------------------------------

-- pass true to go to create mode, nil to list mode
function ifs_login_SetCreateVis(vis)
	local this = ifs_login
	
	-- remember our mode
	this.bCreateMode = vis

	-- show these for create mode	
	IFObj_fnSetVis(this.NewBox,vis)

	-- show these for list mode
	IFObj_fnSetVis(this.TabBox,not vis)
	IFObj_fnSetVis(this.listbox,not vis)
	IFObj_fnSetVis(this.donebutton,not vis)
	
	-- set the text of the back button
	if(vis) then
		RoundIFButtonLabel_fnSetString(this.Helptext_Back.btn, "common.back")
		gCurEditbox = this.NewBox.nameedit
		IFEditbox_fnHilight(gCurEditbox, 1)
	else
		RoundIFButtonLabel_fnSetString(this.Helptext_Back.btn, "common.quit")
		gCurEditbox = nil
	end

	
end




----------------------------------------------------------------------------------------
-- load the profile list.  this is just the preop, since that refreshes the file list.
----------------------------------------------------------------------------------------

function ifs_login_StartLoadFileList()
	print("ifs_login_StartLoadFileList")
	
	ifs_saveop.doOp = "LoadFileList"
	ifs_saveop.OnSuccess = ifs_login_LoadFileListSuccess
	ifs_saveop.OnCancel = ifs_login_LoadFileListCancel
	ifs_movietrans_PushScreen(ifs_saveop);

end

function ifs_login_LoadFileListSuccess()
	-- good, continue
	print("ifs_login_LoadFileListSuccess")
	
	-- pop ifs_saveop, reenter ifs_login
	ifs_login.EnterDoNothing = 1
	ScriptCB_PopScreen()

end

function ifs_login_LoadFileListCancel()
	-- ok, continue
	print("ifs_login_LoadFileListCancel")
	-- need one of these
	ScriptCB_PopScreen()
	
	-- pop ifs_saveop, reenter ifs_login
	ifs_login.EnterDoNothing = 1
	ScriptCB_PopScreen()

end

----------------------------------------------------------------------------------------
-- load two profiles
----------------------------------------------------------------------------------------

gPrevMixConfig = nil
gPrevEffects   = nil

function ifs_login_StartLoadProfile(profile1,profile2)
	print("ifs_login_StartLoadProfile")
	   
	ifs_saveop.doOp = "LoadProfile"
	ifs_saveop.OnSuccess = ifs_login_LoadProfileSuccess
	ifs_saveop.OnCancel = ifs_login_LoadProfileCancel
	ifs_saveop.profile1 = profile1
	ifs_saveop.profile2 = profile2
    
    gPrevMixConfig = ScriptCB_GetMixConfig()
    gPrevEffects   = ScriptCB_EffectsEnabled()
    
	ifs_movietrans_PushScreen(ifs_saveop)
end

function ifs_login_LoadProfileSuccess()
	print("ifs_login_LoadProfileSuccess")
	-- pop ifs_saveop, reenter ifs_login but then save and exit
    
    -- sound changed mix configuration, we'll have to reopen the 
    -- movie and music
    if (ScriptCB_GetMixConfigChanged()) then
        ifs_opt_sound_closeShellSound() 
        ifs_opt_sound_restoreShellSound()
    end
    
	ifs_login.SaveAndExit = 1
	ScriptCB_PopScreen()
end

function ifs_login_LoadProfileCancel()
	print("ifs_login_LoadProfileCancel")
	-- pop ifs_saveop, reenter ifs_login and idle
	ifs_login.EnterDoNothing = 1
	ScriptCB_PopScreen()
end

----------------------------------------------------------------------------------------
-- delete a profile
----------------------------------------------------------------------------------------

function ifs_login_fnDeletePopupDone(bResult)
	local this = ifs_login
	if(bResult) then
		print("ifs_login_fnDeletePopupDone(true)")
		-- User does want to delete
		--local Selection = ifs_login_listbox_contents[ifs_login_listbox_layout.SelectedIdx]
		
		if(ifs_login_listbox_layout.SelectedIdx) then
			local gSelection = ifs_login_listbox_contents[ifs_login_listbox_layout.SelectedIdx]

			ifs_saveop.doOp = "DeleteProfile"
			ifs_saveop.OnSuccess = ifs_login_DeleteProfileSuccess
			ifs_saveop.OnCancel = ifs_login_DeleteProfileCancel
			ifs_saveop.profile1 = gSelection.showstr
			ifs_saveop.saveName = gSelection.showstr
			ifs_movietrans_PushScreen(ifs_saveop)
		end
		
--		RoundIFButtonLabel_fnSetUString(this.buttons["dropdown"],  ScriptCB_tounicode("CURRENT PROFILE: NONE") )  --hackery digiry doo
		
	else
		print("ifs_login_fnDeletePopupDone(false)")
		-- User hit no. Back to normal screen
		ifs_login_fnSetPieceVis(this, 1)
	end
end

function ifs_login_DeleteProfileSuccess()
	print("ifs_login_DeleteProfileSuccess")
	Popup_LoadSave2:fnActivate(nil)	
	-- pop ifs_saveop, reenter ifs_login
	ScriptCB_PopScreen()
end

function ifs_login_DeleteProfileCancel()
	print("ifs_login_DeleteProfileCancel")
	Popup_LoadSave2:fnActivate(nil)	
	-- pop ifs_saveop, reenter ifs_login
	ScriptCB_PopScreen()
end


----------------------------------------------------------------------------------------
-- when we're done with this screen, save any dirty profiles and push to ifs_main
----------------------------------------------------------------------------------------

function ifs_login_SaveAndExit()
	print("ifs_login_SaveAndExit")
	local this = ifs_login
	
	ifs_saveop.doOp = "SaveProfile"
	ifs_saveop.OnSuccess = ifs_login_SaveProfileSuccess
	ifs_saveop.OnCancel = ifs_login_SaveProfileCancel
	ifs_saveop.saveName = ScriptCB_GetCurrentProfileName()
	ifs_saveop.saveProfileNum = 1
	ifs_movietrans_PushScreen(ifs_saveop)	

	-- we need this, otherwise we call ifs_login.Enter(nil) twice.  why?  i dunno.  because lua is ghetto.
	this.EnterDoNothing = 1
end

function ifs_login_SaveProfileSuccess()
	print("ifs_login_SaveProfileSuccess")
	-- exit once we reenter
	ifs_login.EnterThenExit = 1	
	ScriptCB_PopScreen()
end

function ifs_login_SaveProfileCancel()
	print("ifs_login_SaveProfileCancel")
	-- exit once we reenter
	ifs_login.EnterThenExit = 1	
	ScriptCB_PopScreen()
end



----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------

-- this is called when the login process is done
-- takes the place of what used to be _PushScreen("ifs_main")
function ifs_login_Done()
	print("ifs_login_Done")
	-- we should have an exit callback set
	if(ifs_login.fnDone) then
		ifs_login.fnDone()
	else
		-- error
		print("ERROR login exit function (ifs_login.fnDone) not set")
	end
end

----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------

ifs_login = NewIFShellScreen {
	bNohelptext = 1, -- we have our own
	movieIntro      = nil,         -- played before the screen is displayed
	movieBackground = "ifs_start", -- played while the screen is displayed
	music           = "shell_soundtrack",
    enterSound      = "",

--	title = NewIFText {
--		string = "ifs.profile.selection",
--		font = "gamefont_large",
--		y = 10,
--		textw = 460, -- center on screen. Fixme: do real centering!
--		ScreenRelativeX = 0.5, -- center
--		ScreenRelativeY = 0, -- top
--		nocreatebackground = 1, 
--	},

	bTryAutologin = 1, -- flag to try autologin
	Enter = function(this, bFwd)
		gIFShellScreenTemplate_fnEnter(this, bFwd) -- always call base class
		print("ifs_login.Enter(",bFwd,")")

		-- allow mouse input
		this.listbox.bHidden = nil

		
		ifs_login_SetCreateVis(nil)

		------------------------------
		-- handle element visibility
	
		-- Default: hide items on entry
	--	ifs_login_fnSetPieceVis(this, nil)
	--	gIFShellScreenTemplate_fnEnter(this, bFwd)
		
	--	local ListboxHeight = this.listbox.height * 0.5
	--	IFObj_fnSetPos(this.buttons,0, -(ListboxHeight + 75))
	--	gButtonMode = 1  --the listbox starts out hidden  
	--	IFObj_fnSetVis(this.buttons, not gE3Build)
		
	--	if(this.Entries) then
	--		print("this.Entries")
	--	end

		-- right align the done button	
		gIFShellScreenTemplate_fnMoveClickableButton(this.donebutton,this.donebutton.btn.label,0)

		-- done vis formatting stuff
		------------------------------

		-- should we jump forward (this is the result of SaveAndExit)
		if(this.EnterThenExit) then
			print("ifs_login.Enter: EnterThenExit")
			this.EnterThenExit = nil
			ifs_login_Done()
			return
		end
		
		-- should we jump right to saveandexit?
		if(this.SaveAndExit) then
			print("ifs_login.Enter: SaveAndExit")
			this.SaveAndExit = nil
			ifs_login_SaveAndExit()
		end


		-- returning from loadfilelist?
		if(this.EnterDoNothing) then
			print("ifs_login.EnterDoNothing, return")
			this.EnterDoNothing = nil
			-- show this screen
			ifs_login_fnSetPieceVis(this, 1)

			-- print("Platform, count = ",gPlatformStr,getn(ifs_login_listbox_contents))

			-- If there's a name on the commandline, try and log that player in
			-- immediately
			local CmdNickStr,CmdEmailStr,CmdPassStr = ScriptCB_GetCmdlineLogin()
			CmdNickStr = CmdNickStr or ""
			if(this.bTryAutologin and strlen(CmdNickStr) > 1) then
				local CmdNickUStr = ScriptCB_ustrupper(ScriptCB_tounicode(CmdNickStr))
				local i
				for i=1,getn(ifs_login_listbox_contents) do
					if(ScriptCB_ustrupper(ifs_login_listbox_contents[i].showstr) == CmdNickUStr) then
						ifs_login_listbox_layout.SelectedIdx = i
						ifs_login_listbox_layout.CursorIdx = i
						this.CurButton = "_ok"
						ListManager_fnFillContents(this.listbox,ifs_login_listbox_contents,ifs_login_listbox_layout)
						this.iForceLoginTime = 2
						this.iForceLoginIdx = i
						this.bTryAutologin = nil
--						
						return
					end
				end

			end

			IFEditbox_fnSetUString(this.NewBox.nameedit, ScriptCB_GetUniqueLoginName())

			return
		end


		-- if we got here its because we've come from another screen, either forwards or
		-- backwards.  all internal looping (load/save/delete) should be handled by now.
		------------------------------
		-- is the player logged in?

		local CurPlayerIdx = ScriptCB_IsPlayerLoggedIn()		
		if(CurPlayerIdx) then
			print("ifs_login.Enter already logged in.  go to SaveAndExit.")
			-- make sure that we always log out before coming backwards
			if(not bFwd) then
				print("ERROR: didn't log out before backing into ifs_login")
				assert(false)
			end
			
			-- if we're in the historical or metagame, we don't want to save here since
			-- we'll save when we get into the main screen.
			-- also don't save for netgame
			if(ScriptCB_IsMetagameStateSaved() or ScriptCB_IsSPStateSaved() or ScriptCB_InNetGame()) then
				ifs_login_Done()
				return
			end
			
			-- save it
			ifs_login_SaveAndExit()
			return
		end


		-------------------------------
		-- load the profile list

		ifs_login_StartLoadFileList()

		-- done enter
		---------------
	
	end,

 	Exit = function(this, bFwd)
		if(not bFwd) then
			--ScriptCB_Logout()
			
			-- if we're going backwards from here, and the skiptontgui flag is set,
			-- its possible that while in NTGUI they switched mem cards, so the profile
			-- isn't there anymore, so the autoload failed, and the skip stopped here.  now
			-- they want to back out from here without completing the skip, so we need to
			-- clear the skip flag.
			ScriptCB_ResetSkipToNTGUI()
						
		end
		
		-- no more mouse input
		this.listbox.bHidden = 1
	end,

	Update = function(this, fDt)
		-- Call base class functionality
		gIFShellScreenTemplate_fnUpdate(this, fDt)

		if(this.iForceLoginTime) then
			this.iForceLoginTime = this.iForceLoginTime - 1
			if(this.iForceLoginTime <= 0) then
				this.iForceLoginTime = nil
				ifs_login_StartLoadProfile(ifs_login_listbox_contents[this.iForceLoginIdx].showstr,nil)
			end
		end
	end,

	-- Override for the general back function, as we want to do nothing
	-- when this happens on this screen.
	Input_Back = function(this)
		if(this.bCreateMode) then
			ifs_login_SetCreateVis(nil)
		else
			Popup_YesNo.CurButton = "no" -- default
			Popup_YesNo.fnDone = ifs_login_fnQuitPopupDone
			IFText_fnSetString(Popup_YesNo.title,"ifs.main.askquit")
			Popup_YesNo:fnActivate(1)
		end
	end,

	Input_GeneralUp = function(this)
		-- If base class handled this work, then we're done
		if(gShellScreen_fnDefaultInputUp(this)) then
			return
		end

		if(gButtonMode == 1) then
			gDefault_Input_GeneralUp(this) -- do default behavior
		else
				ListManager_fnNavUp(this.listbox,ifs_login_listbox_contents,ifs_login_listbox_layout)
		end
	end,

	Input_LTrigger = function(this)
		if(gCurEditbox) then
			return
		end
		if(not gCurHiliteButton) then
			ListManager_fnPageUp(this.listbox,ifs_login_listbox_contents,ifs_login_listbox_layout)
		end
	end,

	Input_GeneralDown = function(this)
		-- If base class handled this work, then we're done
		if(gShellScreen_fnDefaultInputDown(this)) then
			return
		end

		if(gButtonMode == 1) then
			gDefault_Input_GeneralDown(this) -- do default behavior
		else
			ListManager_fnNavDown(this.listbox,ifs_login_listbox_contents,ifs_login_listbox_layout)
		end
	end,

	Input_RTrigger = function(this)
		if(gCurEditbox) then
			return
		end
		if(not gCurHiliteButton) then
			ListManager_fnPageDown(this.listbox,ifs_login_listbox_contents,ifs_login_listbox_layout)
		end
	end,

	-- Not possible on this screen
	Input_GeneralLeft = function(this)
  end,
	Input_GeneralRight = function(this)
  end,

	bStartedCreate = nil,
  Input_Accept = function(this)
		-- If base class handled this work, then we're done
		if(gShellScreen_fnDefaultInputAccept(this)) then
			if(gMouseListBox) then
				if( gMouseListBox.Layout.SelectedIdx == gMouseListBox.Layout.CursorIdx and this.lastDoubleClickTime and ScriptCB_GetMissionTime()<this.lastDoubleClickTime+0.4) then
					this.lastDoubleClickTime = nil
					this.CurButton = "_ok"
				else
					this.lastDoubleClickTime = ScriptCB_GetMissionTime()
					gMouseListBox.Layout.SelectedIdx = gMouseListBox.Layout.CursorIdx
					return 1 -- note we did all the work
				end
			else
				return
			end
		end

		if(this.CurButton == "_new") then
			local EnteredStr = IFEditbox_fnGetString(this.NewBox.nameedit)
			local trim = nil
			if(EnteredStr) then
				trim = ScriptCB_TrimLoginName(EnteredStr)
				EnteredStr = trim
			end
			if((not EnteredStr) or (strlen(EnteredStr) < 1)) then
				ScriptCB_SndPlaySound("shell_menu_error")
			else
				ifs_vkeyboard.CurString = ScriptCB_tounicode(EnteredStr)
				ifs_login_fnKeyboardDone()
			end
		elseif (this.CurButton == "delete") then
			if(ifs_login_listbox_layout.SelectedIdx) then
				local gSelection = ifs_login_listbox_contents[ifs_login_listbox_layout.SelectedIdx]
				if( gSelection ) then
					ScriptCB_SndPlaySound("shell_menu_enter")
					Popup_YesNo.CurButton = "no" -- default
					Popup_YesNo.fnDone = ifs_login_fnDeletePopupDone
					IFText_fnSetString(Popup_YesNo.title,"ifs.Profile.confirm_delete")
--					ifs_login_fnSetPieceVis(this, nil)
					Popup_YesNo:fnActivate(1)
				end
			end
		elseif (this.CurButton == "create") then
			-- switch to create mode
			ifs_login_SetCreateVis(1)
		
	--	elseif(this.CurButton == "dropdown") then
	--		
	--		ShowHideVerticalButtons(this.buttons,ePROCESSEDINPUT_PITCH_AXIS,1)
	--		gButtonMode = 0
	--		ifs_login_fnSetPieceVis(this, 1)
	--		--hide this button now?
		elseif (this.CurButton == "_ok") then --the only way to load a profile on the pc
			if(ifs_login_listbox_layout.SelectedIdx) then
				local gSelection = ifs_login_listbox_contents[ifs_login_listbox_layout.SelectedIdx]
				if(gSelection) then
					print("***load a profile on the pc:",gSelection.showstr)
					ScriptCB_SndPlaySound("shell_menu_enter")
					ifs_login_StartLoadProfile(gSelection.showstr,nil)
				else
					print("Yeah, you need to make a pop-up here")	
				end
			end
		else
			if(gButtonMode == 1) then
			
			else 
-- 				if(gOverSlider) then
					
-- 				elseif ( gMouseListBox ) then
-- 					print("They are trying to select something from the list")
-- 					gButtonMode = 1 
-- 					gSelection = ifs_login_listbox_contents[ifs_login_listbox_layout.SelectedIdx]
-- 					ShowHideVerticalButtons(this.buttons,ifslogin_vbutton_layout,0)
-- 					RoundIFButtonLabel_fnSetUString(this.buttons["dropdown"], ScriptCB_UnicodeStrCat( ScriptCB_tounicode("CURRENT PROFILE:")  ,gSelection.showstr) ) 
-- 					ifs_login_fnSetPieceVis(this, 1)	
-- 				else
-- 					print("They aren't over a list box and clicked the mouse button")
-- 					ShowHideVerticalButtons(this.buttons,ifslogin_vbutton_layout,0)
-- 					gButtonMode = 1
-- 					ifs_login_fnSetPieceVis(this, 1)	
-- 				end
			end
		end
	end,

	Input_Misc = function(this)
		if(gPlatformStr == "PC") then
			return
		end

		-- Can only delete when on listbox
		if((not this.CurButton) and (not gE3Build) and (not gDemoBuild)) then
			ScriptCB_SndPlaySound("shell_menu_enter")
			Popup_YesNo.CurButton = "no" -- default
			Popup_YesNo.fnDone = ifs_login_fnDeletePopupDone
			IFText_fnSetString(Popup_YesNo.title,"ifs.Profile.confirm_delete")
			ifs_login_fnSetPieceVis(this, nil)
			Popup_YesNo:fnActivate(1)
		end
	end,

	Input_KeyDown = function(this, iKey)

		if(gCurEditbox) then
			-- is this key allowed?
			local badchars = { 47, 92, 58, 42, 63, 34, 60, 62, 124, }
							-- '/' '\' ':' '*' '?' '"' '<' '>' '|'
			local n = getn(badchars)
			for i=1,n do
				if(badchars[i] == iKey) then
					ScriptCB_SndPlaySound("shell_menu_error")
					return
				end
			end
			
			
			if((iKey == 10) or (iKey == 13)) then -- handle Enter different
				gCurEditbox = nil
				this.CurButton = "_new"
				this:Input_Accept()			
			else
				IFEditbox_fnAddChar(gCurEditbox, iKey)
			end
		end
	end,

	-- Pull in utility functions
	fnLoadProfilesDone = ifs_login_fnLoadProfilesDone,
	fnLoadFileListDone = ifs_login_fnLoadFileListDone,
	fnSaveProfileDone = ifs_login_fnSaveProfileDone,
	fnDeleteProfileDone = ifs_login_fnDeleteProfileDone,
}

function ifs_login_fnBuildScreen(this)
	local w,h = ScriptCB_GetSafeScreenInfo() -- of the usable screen
	local aw,ah = ScriptCB_GetScreenInfo()
	this.listbox = NewButtonWindow 
	{ ZPos = 200, x=0, y = 0,
		ScreenRelativeX = 0.5, -- center
		ScreenRelativeY = 0.5, 
		width = ifs_login_listbox_layout.width + 35,
		height = ifs_login_listbox_layout.showcount * (ifs_login_listbox_layout.yHeight + ifs_login_listbox_layout.ySpacing) + 30,
		titleText = "ifs.profile.selection",
		rotY = -35,
	}
	this.buttons = NewIFContainer {
		ScreenRelativeX = 0.3, -- center
		ScreenRelativeY = 0.5, -- center
		y = 0,
		rotY =35
	}
-- 	ifs_login.CurButton = AddVerticalButtons(ifs_login.buttons,ifslogin_vbutton_layout)
-- 	IFButton_fnSelect(ifs_login.buttons.new,nil) -- turn off first item
-- 	ifs_login.CurButton = nil

	local BackButtonW = 100
	local BackButtonH = 25
	this.donebutton =	NewIFContainer
	{
		ScreenRelativeX = 1.0, -- right
		ScreenRelativeY = 1.0, -- bottom
		y = -15, -- just above bottom
		x = -BackButtonW + 25,
		btn = NewClickableIFButton -- NewRoundIFButton 
		{ 
			btnw = BackButtonW, 
			btnh = BackButtonH,
			font = "gamefont_medium", 
			--bg_width = BackButtonW, 
			bg_xflipped = 1, 
			nocreatebackground = 1,
			tag = "_ok",
			
		}, -- end of btn
	}

	RoundIFButtonLabel_fnSetString(this.donebutton.btn,"common.ok")

	ListManager_fnInitList(this.listbox,ifs_login_listbox_layout)

	local EditBoxW = 300
	
	this.NewBox = NewIFContainer
	{
		ScreenRelativeX = 0.5, -- right
		ScreenRelativeY = 0.5, -- bottom
		rotY = 35,

		nameedit = NewEditbox {
			width = EditBoxW,
			height = 40,
			font = "gamefont_medium",
			--		string = "Player 1",
			MaxLen = EditBoxW - 30,
			MaxChars = 15,
			bKeepsFocus = 1,
		},

		btn = NewClickableIFButton -- NewRoundIFButton 
		{ 
			y = 32,
			x = ScriptCB_GetFontHeight("gamefont_medium") + 8,
			btnw = EditBoxW, 
			btnh = BackButtonH,
			font = "gamefont_medium", 
			--bg_width = EditBoxW, 
			tag = "_new",
			string = "ifs.profile.create",			
		}, -- end of btn
	}

	local TabBoxW = this.listbox.width / 2
	local TabBtnW = this.listbox.width / 3
	local TabFont = "gamefont_tiny"
	this.TabBox = NewIFContainer
	{
		ScreenRelativeX = this.listbox.ScreenRelativeX,
		ScreenRelativeY = this.listbox.ScreenRelativeY,
		x = this.listbox.x,
		y = this.listbox.y + this.listbox.height/2 + 8,
		rotY = this.listbox.rotY,

		delbtn = NewClickableIFButton -- NewRoundIFButton 
		{ 
			x = 5 - TabBoxW / 2,
			btnw = TabBtnW,
			btnh = ScriptCB_GetFontHeight(TabFont),
			font = TabFont, 
			tag = "delete",
			string = "ifs.profile.delete",
		}, -- end of btn
		newbtn = NewClickableIFButton -- NewRoundIFButton 
		{ 
			x = 5 + TabBoxW / 2,
			btnw = TabBtnW, 
			btnh = ScriptCB_GetFontHeight(TabFont),
			font = TabFont, 
			tag = "create",
			string = "ifs.profile.create",
		}, -- end of btn
	}

--	this.NewBox.btn.x = EditBoxW * -0.5
end


ifs_login_fnBuildScreen( ifs_login )
ifs_login_fnBuildScreen = nil

AddIFScreen(ifs_login,"ifs_login")