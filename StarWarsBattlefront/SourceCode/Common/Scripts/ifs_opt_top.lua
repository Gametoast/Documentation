-- Top page for the options pages hierarchy

ifs_opt_top_vbutton_layout = {
--	yTop = 0,
	ySpacing  = 5,
	width = 360,
	font = "gamefont_large",
	buttonlist = { 
		{ tag = "general", string = "ifs.GameOpt.title", },
		{ tag = "pcvideo", string = "ifs.VideoOpt.title", },  -- PC only!
		{ tag = "sound", string = "ifs.SoundOpt.title", },
		{ tag = "cveh", string = "ifs.controls.Vehicle_Unit", },  -- XBOX/PS2 only!
		{ tag = "pccontrols", string = "ifs.GameOpt.pc_optionstitle", },  -- PC only!
		{ tag = "online", string = "ifs.onlineopt.title", },
		
		{ tag = "unlock", string = "ifs.unlock.title", },
		{ tag = "credits", string = "ifs.credits.title", },
	
	},
	title = "ifs.Main.options",
	rotY = 40,
}

-- Callback (from C++) -- saving is done. Re-enable buttons
--function ifs_opt_contmain_fnSaveProfileDone(this)
--	Popup_LoadSave:fnActivate(nil)
--	IFObj_fnSetVis(this.buttons,1)
--	
--	-- exit this screen
--	ScriptCB_PopScreen()
--end


----------------------------------------------------------------------------------------
-- save the profile in slot 1
----------------------------------------------------------------------------------------

function ifs_opt_top_StartSaveProfile()
	print("ifs_opt_top_StartSaveProfile")
	
	ifs_saveop.doOp = "SaveProfile"
	ifs_saveop.OnSuccess = ifs_opt_top_SaveProfileSuccess
	ifs_saveop.OnCancel = ifs_opt_top_SaveProfileCancel
	ifs_saveop.saveName = ScriptCB_GetProfileName(1)
	ifs_saveop.saveProfileNum = 1
    ifs_movietrans_PushScreen(ifs_saveop)
end

function ifs_opt_top_SaveProfileSuccess()
	print("ifs_opt_top_SaveProfileSuccess")
	local this = ifs_opt_contmain
	
	-- exit ifs_saveop
	ScriptCB_PopScreen()
	-- exit this screen
	ScriptCB_PopScreen()	
end

function ifs_opt_top_SaveProfileCancel()
	print("ifs_opt_top_SaveProfileCancel")
	local this = ifs_opt_contmain
	
	-- exit ifs_saveop
	ScriptCB_PopScreen()
	-- exit this screen
	ScriptCB_PopScreen()
end

----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------


ifs_opt_contmain = NewIFShellScreen {
	nologo = 1,
    movieIntro      = "ifs_opt_top_intro", -- played before the screen is displayed
    movieBackground = "ifs_opt_top",       -- played while the screen is displayed

--	title = NewIFText {
--		string = "ifs.Main.options",
--		font = "gamefont_large",
--		textw = 460, -- center on screen. Fixme: do real centering!
--		ScreenRelativeX = 0.5, -- center
--		ScreenRelativeY = 0, -- top
--		y = 10,
--		inert = 1, -- delete out of Lua mem when pushed to C
--	},

	buttons = NewIFContainer {
		ScreenRelativeX = 0.6, -- center
		ScreenRelativeY = 0.55, -- top
		y = 20, -- go slightly down from center
	},

	-- When entering this screen, check if we need to save (triggered
	-- by a subscreen or something). If so, start that process.
	Enter = function(this, bFwd)
		gIFShellScreenTemplate_fnEnter(this, bFwd) -- call default enter function
		
		-- hide some buttons
		this.buttons.pcvideo.hidden = (gPlatformStr ~= "PC")
		this.buttons.pccontrols.hidden = (gPlatformStr ~= "PC")
		this.buttons.cveh.hidden = (gPlatformStr == "PC")
		this.buttons.unlock.hidden = (gPlatformStr == "PC") or (not ScriptCB_GetShellActive())
		
		if( not ScriptCB_GetShellActive() ) then
			this.buttons.online.hidden =  (not ScriptCB_InNetGame())
		end
		
		this.buttons.credits.hidden = not ScriptCB_GetShellActive()
		this.buttons.sound.hidden = (ScriptCB_GetPausingViewport()~=0)

		this.CurButton = ShowHideVerticalButtons(this.buttons,ifs_opt_top_vbutton_layout)		
		SetCurButton(this.CurButton)
	end, -- function Enter()

	Input_Accept = function(this) 
		-- If base class handled this work, then we're done
		if(gShellScreen_fnDefaultInputAccept(this)) then
			return
		end

		ifelm_shellscreen_fnPlaySound(this.acceptSound)     
		
		--XBOX/PS2 only!
		--XBOX/PS2 only!
		
		if(this.CurButton == "cveh") then
			ifs_opt_controller.bFlyerMode = nil
			if( gPlatformStr == "PC" ) then
				ifs_movietrans_PushScreen(ifs_opt_pccontrols)
			else
				ifs_movietrans_PushScreen(ifs_opt_contmode)
			end
		elseif (this.CurButton == "cfly") then
			ifs_opt_controller.bFlyerMode = 1
			if( gPlatformStr == "PC" ) then
				ifs_movietrans_PushScreen(ifs_opt_pccontrols)
			else
				ifs_movietrans_PushScreen(ifs_opt_contmode)
			end
			--PC only!
		elseif (this.CurButton == "pccontrols") then
			ifs_movietrans_PushScreen(ifs_opt_pccontrols)   
		elseif (this.CurButton == "pcvideo") then
			ifs_movietrans_PushScreen(ifs_opt_pcvideo)
			
			--everybody!	
		elseif (this.CurButton == "general") then
			ifs_movietrans_PushScreen(ifs_opt_general)
		elseif (this.CurButton == "sound") then
			ifs_movietrans_PushScreen(ifs_opt_sound)
		elseif (this.CurButton == "online") then
			ifs_movietrans_PushScreen(ifs_opt_mp)
		elseif (this.CurButton == "unlock") then
			ifs_movietrans_PushScreen(ifs_unlockables)
		elseif (this.CurButton == "credits") then
			ifs_movietrans_PushScreen(ifs_credits)
		end
	end,
	
	Input_Back = function(this)
		
		-- trigger a save if the profile is dirty
		if(ScriptCB_IsCurProfileDirty()) then
			--IFObj_fnSetVis(this.buttons,nil)
			--Popup_LoadSave:fnActivate(1)
			--ScriptCB_StartSaveProfile()

			ifs_opt_top_StartSaveProfile()
		else
			--otherwise just exit
			ScriptCB_PopScreen()
		end		
		
	end,

--	fnSaveProfileDone = ifs_opt_contmain_fnSaveProfileDone,
}

ifs_opt_contmain.CurButton = AddVerticalButtons(ifs_opt_contmain.buttons,ifs_opt_top_vbutton_layout)
AddIFScreen(ifs_opt_contmain,"ifs_opt_contmain")