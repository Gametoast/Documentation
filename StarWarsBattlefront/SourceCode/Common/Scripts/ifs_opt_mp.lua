-- Online options

ifs_opt_mp_vbutton_layout = {
	yHeight = 50,
	ySpacing  = 0,
	width = 310,
	font = "gamefont_medium",
--	RightJustify = 1,
	buttonlist = {
		-- Title is for the left column, string the right-hand option
		{ tag = "appear",    title = "ifs.onlineopt.appear", string = "ifs.onlineopt.online" },
		{ tag = "voicemask", title = "ifs.onlineopt.voicemask", string = "common.no" },
		{ tag = "voicevol",  title = "ifs.onlineopt.voicetotvvolume", string = "10" },
		{ tag = "players", title = "ifs.onlineopt.hostbandwidth", string = "128k" },
		{ tag = "turns", title = "ifs.onlineopt.tps", string = "20" },
		{ tag = "icon", title = "ifs.onlineopt.icon", string = "common.off" },   -- display network performance icon 
		{ tag = "allregions", title = "ifs.onlineopt.allregions", string = "common.yes" },
		{ tag = "prompt",  title = "ifs.onlineopt.autologin", string = "" },
		{ tag = "voicerecord",   title = "ifs.onlineopt.voicerecordvol", string = "10" },
		{ tag = "voiceplayback", title = "ifs.onlineopt.voiceplaybackvol", string = "10" },
		{ tag = "voiceenable",   title = "ifs.onlineopt.voiceenable", string = "common.off" },
		-- Delete these before we go live
--		{ tag = "journal",   title = "common.mp.journal", string = "common.ok", },
	},
	nocreatebackground = 1,
}

function ifs_mp_opt_fnBadHostPopupDone(bResult)
	local this = ifs_opt_mp
	
	IFObj_fnSetVis(this.buttons, 1)
	IFObj_fnSetVis(this.buttonlabels, 1)

	if(bResult) then
		ifs_opt_mp_SaveAndPop()
	end
end

-- Read current options, adjust text to fit
function ifs_opt_mp_fnUpdateStrings(this)
	this.bAppearOffline,this.bVoiceMask,this.iTVVoiceVol,this.iVoiceRecordVol,this.iVoicePlayVol,this.iNumPlayers,this.iTurnsPerSecond,this.icon,this.bAllRegions = ScriptCB_GetOnlineOpts()

	if(this.bAppearOffline) then
		RoundIFButtonLabel_fnSetString(this.buttons.appear,"ifs.onlineopt.offline")
	else
		RoundIFButtonLabel_fnSetString(this.buttons.appear,"ifs.onlineopt.online")
	end

 	if(this.bVoiceMask) then
 		RoundIFButtonLabel_fnSetString(this.buttons.voicemask,"common.yes")
 	else
 		RoundIFButtonLabel_fnSetString(this.buttons.voicemask,"common.no")
 	end
    
 	if(this.bAllRegions) then
 		RoundIFButtonLabel_fnSetString(this.buttons.allregions,"common.yes")
 	else
 		RoundIFButtonLabel_fnSetString(this.buttons.allregions,"common.no")
 	end

	if (ScriptCB_GetVoiceEnable()) then
        	RoundIFButtonLabel_fnSetString(this.buttons.voiceenable,"common.on")
	else
        	RoundIFButtonLabel_fnSetString(this.buttons.voiceenable,"common.off")
	end

	--RoundIFButtonLabel_fnSetString(this.buttons.voicevol,format("%d",this.iTVVoiceVol))
    if (this.iTVVoiceVol == 0) then
        RoundIFButtonLabel_fnSetString(this.buttons.voicevol,"common.off")
    else
        RoundIFButtonLabel_fnSetString(this.buttons.voicevol,"common.on")
    end
    RoundIFButtonLabel_fnSetString(this.buttons.voicerecord,format("%d",this.iVoiceRecordVol))
    RoundIFButtonLabel_fnSetString(this.buttons.voiceplayback,format("%d",this.iVoicePlayVol))
    
	local NewStr = ""
	
--	NewStr = ScriptCB_usprintf("ifs.mp.createopts.maxplayers",
	if(gPlatformStr == "XBox") then
		if(this.iNumPlayers<1) then
			RoundIFButtonLabel_fnSetString(this.buttons.players,"ifs.onlineopt.bandwidth1")
		elseif(this.iNumPlayers<2) then
			RoundIFButtonLabel_fnSetString(this.buttons.players,"ifs.onlineopt.bandwidth2")
		elseif(this.iNumPlayers<3) then
			RoundIFButtonLabel_fnSetString(this.buttons.players,"ifs.onlineopt.bandwidth3")
		elseif(this.iNumPlayers<4) then
			RoundIFButtonLabel_fnSetString(this.buttons.players,"ifs.onlineopt.bandwidth4")
		elseif(this.iNumPlayers<5) then
			RoundIFButtonLabel_fnSetString(this.buttons.players,"ifs.onlineopt.bandwidth5")
		else
			RoundIFButtonLabel_fnSetString(this.buttons.players,"ifs.onlineopt.bandwidth6")
		end
	else
		if(this.iNumPlayers<1) then
			RoundIFButtonLabel_fnSetString(this.buttons.players,"128k")
		elseif(this.iNumPlayers<2) then
			RoundIFButtonLabel_fnSetString(this.buttons.players,"256k")
		elseif(this.iNumPlayers<3) then
			RoundIFButtonLabel_fnSetString(this.buttons.players,"384k")
		elseif(this.iNumPlayers<4) then
			RoundIFButtonLabel_fnSetString(this.buttons.players,"512k")
		elseif(this.iNumPlayers<5) then
			RoundIFButtonLabel_fnSetString(this.buttons.players,"768k")
		else
			RoundIFButtonLabel_fnSetString(this.buttons.players,"1M+")
		end
	end
	
	NewStr = ScriptCB_usprintf("ifs.onlineopt.hostbandwidth", ScriptCB_tounicode(""))
	IFText_fnSetUString(this.buttonlabels.players, NewStr)

	if (this.iTurnsPerSecond == 30) then
		RoundIFButtonLabel_fnSetString(this.buttons.turns,"30")
	elseif (this.iTurnsPerSecond == 15) then
		RoundIFButtonLabel_fnSetString(this.buttons.turns, "15")
	else
		this.iTurnsPerSecond = 20
		RoundIFButtonLabel_fnSetString(this.buttons.turns, "20")
	end
	
	if( this.icon == 1 ) then
		RoundIFButtonLabel_fnSetString(this.buttons.icon,"common.on")
	else
		RoundIFButtonLabel_fnSetString(this.buttons.icon,"common.off")
	end

	this.NickStr,this.EmailStr,this.PasswordStr,this.iSaveType,this.iPromptType = ScriptCB_GetGSProfileInfo()
	print("this.iPromptType = ", this.iPromptType)

 	if(this.iPromptType == 0) then
 		RoundIFButtonLabel_fnSetString(this.buttons.prompt,"ifs.gsprofile.prompt")
 	elseif (this.iPromptType == 1) then
 		RoundIFButtonLabel_fnSetString(this.buttons.prompt,"common.always")
 	else
 		RoundIFButtonLabel_fnSetString(this.buttons.prompt,"common.never")
 	end

end

ifs_opt_mp = NewIFShellScreen {

	nologo = 1,
	movieIntro      = nil, -- played before the screen is displayed
	movieBackground = nil, -- played while the screen is displayed
	bNohelptext_backPC = 1,
	bg_texture = "iface_bgmeta_space",

	-- display network performance icon 
	icon = 0,
	bAllRegions = true,
	iNumPlayers = 0,
	iTurnsPerSecond = 20,
	
	title = NewIFText {
		string = "ifs.onlineopt.title",
		font = "gamefont_large",
		textw = 460,
		y = 0,
		ScreenRelativeX = 0.5,
		ScreenRelativeY = 0.0,
		inert = 1,
		nocreatebackground = 1,
	},

	buttonlabels = NewIFContainer {
		ScreenRelativeX = 0.7,
		ScreenRelativeY = 0.5,
 		x = -5,
 		y = 20, -- go down a little to make space for title up top
	},

	buttons = NewIFContainer {
		ScreenRelativeX = 0.7,
		ScreenRelativeY = 0.5,
 		x = 5,
 		y = 20, -- go down a little to make space for title up top
	},

	-- Do any adjustments necessary on entering this screen
	Enter = function(this, bFwd)
		ScriptCB_MarkCurrentProfile()
		this.bReloadProfile = 1
		gIFShellScreenTemplate_fnEnter(this, bFwd) -- call default enter function
		
		if(this.PopOnEnter) then
			this.PopOnEnter = nil
			ScriptCB_PopScreen()
		end

		-- Added chunk for error handling...
		if(not bFwd) then
			local ErrorLevel,ErrorMessage = ScriptCB_GetError()
			if(ErrorLevel >= 6) then -- session or login error, must keep going further
				ScriptCB_PopScreen()
			end
		end

		-- enable local voice echo for test / auditioning
        --if (gPlatformStr ~= "PC") then
		    ScriptCB_SetVoiceLocalEchoEnable(1)
        --end

		-- Disable presence button if not on XLive
		local bIsXLive
        local bOnXbox
        if (gPlatformStr == "XBox") then
            bOnXbox = 1
        else
            bOnXbox = nil
        end
        
		if(gOnlineServiceStr ~= "XLive") then
			bIsXLive = nil
            if (bOnXbox) then
                SetCurButton("voicemask")
            else
			    SetCurButton("voicerecord")
            end
		else
			bIsXLive = 1
			SetCurButton("appear")
		end
		 
		-- ShowHideVerticalButtons|Text will break some of the formatting, so
		-- behave a lot like it. :(
		this.buttons.appear.hidden = not bIsXLive
		this.buttonlabels.appear.hidden = not bIsXLive
		IFObj_fnSetVis(this.buttons.appear, bIsXLive)
		IFObj_fnSetVis(this.buttonlabels.appear, bIsXLive)

        IFObj_fnSetVis(this.buttons.voicemask, bOnXbox)
        IFObj_fnSetVis(this.buttonlabels.voicemask, bOnXbox)
        IFObj_fnSetVis(this.buttons.voicevol, bOnXbox)
        IFObj_fnSetVis(this.buttonlabels.voicevol, bOnXbox)

        bOnXbox = bOnXbox or (gPlatformStr == "PC")
        IFObj_fnSetVis(this.buttons.voicerecord, not bOnXbox)
        IFObj_fnSetVis(this.buttonlabels.voicerecord, not bOnXbox)
        IFObj_fnSetVis(this.buttons.voiceplayback, not bOnXbox)
        IFObj_fnSetVis(this.buttonlabels.voiceplayback, not bOnXbox)
        
        local voiceEnableOpt = nil -- ScriptCB_GetShellActive() and (gPlatformStr == "PC")
        IFObj_fnSetVis(this.buttons.voiceenable, voiceEnableOpt)
        IFObj_fnSetVis(this.buttonlabels.voiceenable, voiceEnableOpt)

		-- Repaint screen w/ latest selections
		ifs_opt_mp_fnUpdateStrings(this)       
	end,
    
    Exit = function(this, bFwd)
        --if (gPlatformStr ~= "PC") then
            -- disable local voice echo 
            ScriptCB_SetVoiceLocalEchoEnable(0)
        --end
        if( this.bReloadProfile ) then
			ScriptCB_ReloadMarkedProfile()
        end
		if(gCurHiliteButton) then
			IFButton_fnSelect(gCurHiliteButton,nil)
		end
    end,

	Update = function(this, fDt)
		-- Call default base class's update function (make button bounce)
		gIFShellScreenTemplate_fnUpdate(this,fDt)
--        ifs_opt_mp_fnUpdateStrings(this)

		-- Lobby might be active (if we entered thru it). Update it.
		ScriptCB_UpdateLobby(nil)
	end,

	Input_Accept = function(this)
		-- If base class handled this work, then we're done
		if(gShellScreen_fnDefaultInputAccept(this)) then
			return
		end
		
	

		ifelm_shellscreen_fnPlaySound(this.acceptSound)
		if (this.CurButton == "journal") then
			ScriptCB_EnableJournal()

-- Chunk disabled NM 7/21/04 - don't toggle options again while accepting them
-- 		elseif (this.CurButton == "appear") then
-- 			this.bAppearOffline = not this.bAppearOffline
-- 		elseif (this.CurButton == "voicemask") then
-- 			this.bVoiceMask = not this.bVoiceMask
		end
	
	
		if(this.CurButton ~= "_ok" ) then 
			this:Input_GeneralRight()
			return
		end
		ScriptCB_SetOnlineOpts(this.bAppearOffline,this.bVoiceMask,this.iTVVoiceVol, this.iVoiceRecordVol, this.iVoicePlayVol, this.iNumPlayers, this.iTurnsPerSecond, this.icon,this.bAllRegions)
		-- Repaint screen w/ latest selections
		ifs_opt_mp_fnUpdateStrings(this)
		
		-- don't reload profile when we leave
		this.bReloadProfile = nil
        
--        ScriptCB_PopScreen()
		if(gPlatformStr == "XBox") then
			if(not ScriptCB_CanSupportMaxPlayers(this.iNumPlayers)) then
				IFObj_fnSetVis(this.buttons, nil)
				IFObj_fnSetVis(this.buttonlabels, nil)
		
				Popup_AB.CurButton = "no" -- default
				Popup_AB.fnDone = ifs_mp_opt_fnBadHostPopupDone
				IFText_fnSetString(Popup_AB.title,"ifs.mp.badhost")
				Popup_AB:fnActivate(1)
			else
				ifs_opt_mp_SaveAndPop()
			end
		else
			ifs_opt_mp_SaveAndPop()
		end
	end,
	
	Input_Back = function(this)
		if(gPlatformStr == "PC") then
			ScriptCB_PopScreen()
		elseif(gPlatformStr == "XBox") then
			if(not ScriptCB_CanSupportMaxPlayers(this.iNumPlayers)) then
				IFObj_fnSetVis(this.buttons, nil)
				IFObj_fnSetVis(this.buttonlabels, nil)
		
				Popup_AB.CurButton = "no" -- default
				Popup_AB.fnDone = ifs_mp_opt_fnBadHostPopupDone
				IFText_fnSetString(Popup_AB.title,"ifs.mp.badhost")
				Popup_AB:fnActivate(1)
			else
				ifs_opt_mp_SaveAndPop()
			end
		else
			ifs_opt_mp_SaveAndPop()
		end
	end,
	
	Input_Misc  = function(this)
		print("input Misc")
		this:Input_GeneralLeft()
	end,
	Input_GeneralLeft = function(this)
		if (this.CurButton == "appear") then
			this.bAppearOffline = not this.bAppearOffline
			ifelm_shellscreen_fnPlaySound(this.acceptSound)
		elseif (this.CurButton == "voicemask") then
			this.bVoiceMask = not this.bVoiceMask
			ifelm_shellscreen_fnPlaySound(this.acceptSound)
		elseif (this.CurButton == "allregions") then
			this.bAllRegions = not this.bAllRegions
			ifelm_shellscreen_fnPlaySound(this.acceptSound)
		elseif (this.CurButton == "voicevol") then
			--this.iTVVoiceVol = max(0, this.iTVVoiceVol - 1)
            this.iTVVoiceVol = 0
			ifelm_shellscreen_fnPlaySound(this.acceptSound)
		elseif (this.CurButton == "voicerecord") then
			this.iVoiceRecordVol = max(0, this.iVoiceRecordVol - 1)
		elseif (this.CurButton == "voiceplayback") then
			this.iVoicePlayVol = max(0, this.iVoicePlayVol - 1)
		elseif (this.CurButton == "players") then
			if(this.iNumPlayers<2) then
				this.iNumPlayers=0
			elseif(this.iNumPlayers<3) then
				this.iNumPlayers=1
			elseif(this.iNumPlayers<4) then
				this.iNumPlayers=2
			elseif(this.iNumPlayers<5) then
				this.iNumPlayers=3
			elseif(this.iNumPlayers<6) then
				this.iNumPlayers=4
			else
				this.iNumPlayers=5
			end
		elseif (this.CurButton == "turns") then
			if (this.iTurnsPerSecond == 30) then
				this.iTurnsPerSecond = 20
			elseif (this.iTurnsPerSecond == 20) then
				this.iTurnsPerSecond = 15
			end

		elseif (this.CurButton == "prompt") then
			this.NickStr,this.EmailStr,this.PasswordStr,this.iSaveType,this.iPromptType = ScriptCB_GetGSProfileInfo()

			print("Change prompt, pre = ", this.iPromptType)

			ifelm_shellscreen_fnPlaySound(this.acceptSound)
			this.iPromptType = this.iPromptType + 1
			if(this.iPromptType > 2) then
				this.iPromptType = 0
			end

			-- Only show 'always' if the parameters look valid
			if((this.iPromptType == 1) and ifs_mpgs_login_fnCheckString) then
				if((strlen(this.NickStr) < 1) or 
					 (strlen(this.EmailStr) < 1) or 
					 (strlen(this.PasswordStr) < 1) or
					 (not ifs_mpgs_login_fnCheckString(this.NickStr)) or 
					 (not ifs_mpgs_login_fnCheckString(this.EmailStr)) or 
					 (not ifs_mpgs_login_fnCheckString(this.PasswordStr)) or
					 (not ifs_mpgs_login_fnCheckString2(this.NickStr)) or 
					 (not ifs_mpgs_login_fnCheckString2(this.EmailStr)) or 
					 (not ifs_mpgs_login_fnCheckString2(this.PasswordStr))) then
					this.iPromptType = 2 -- skip to never
				end
			end

			print("Change prompt, post = ", this.iPromptType)

			ScriptCB_SetGSProfileInfo(this.NickStr,this.EmailStr,this.PasswordStr,this.iSaveType,this.iPromptType)
		elseif (this.CurButton == "icon") then
			this.icon = 1 - this.icon
		elseif (this.CurButton == "voiceenable") then
			ScriptCB_VoiceEnable(not ScriptCB_GetVoiceEnable())
		end

		ScriptCB_SetOnlineOpts(this.bAppearOffline,this.bVoiceMask,this.iTVVoiceVol, this.iVoiceRecordVol, this.iVoicePlayVol, this.iNumPlayers, this.iTurnsPerSecond, this.icon, this.bAllRegions)
		-- Repaint screen w/ latest selections
		ifs_opt_mp_fnUpdateStrings(this)
	end,

	Input_GeneralRight = function(this)		
		if (this.CurButton == "appear") then
			this.bAppearOffline = not this.bAppearOffline
			ifelm_shellscreen_fnPlaySound(this.acceptSound)
		elseif (this.CurButton == "voicemask") then
			this.bVoiceMask = not this.bVoiceMask
			ifelm_shellscreen_fnPlaySound(this.acceptSound)
		elseif (this.CurButton == "allregions") then
			this.bAllRegions = not this.bAllRegions
			ifelm_shellscreen_fnPlaySound(this.acceptSound)
		elseif (this.CurButton == "voicevol") then
			--this.iTVVoiceVol = min(10, this.iTVVoiceVol + 1)
            this.iTVVoiceVol = 10
			ifelm_shellscreen_fnPlaySound(this.acceptSound)
		elseif (this.CurButton == "voicerecord") then
			this.iVoiceRecordVol = min(10, this.iVoiceRecordVol + 1)
		elseif (this.CurButton == "voiceplayback") then
			this.iVoicePlayVol = min(10, this.iVoicePlayVol + 1)
		elseif (this.CurButton == "players") then
			if(this.iNumPlayers<1) then
				this.iNumPlayers=1
			elseif(this.iNumPlayers<2) then
				this.iNumPlayers=2
			elseif(this.iNumPlayers<3) then
				this.iNumPlayers=3
			elseif(this.iNumPlayers<4) then
				this.iNumPlayers=4
			elseif(this.iNumPlayers<5) then
				this.iNumPlayers=5
			else
				this.iNumPlayers=6
			end
		elseif (this.CurButton == "turns") then
			if (this.iTurnsPerSecond == 20) then
				this.iTurnsPerSecond = 30
			elseif (this.iTurnsPerSecond == 15) then
				this.iTurnsPerSecond = 20
			end
		elseif (this.CurButton == "prompt") then
			this.NickStr,this.EmailStr,this.PasswordStr,this.iSaveType,this.iPromptType = ScriptCB_GetGSProfileInfo()

			print("Change prompt, pre = ", this.iPromptType)

			ifelm_shellscreen_fnPlaySound(this.acceptSound)
			this.iPromptType = this.iPromptType + 1
			if(this.iPromptType > 2) then
				this.iPromptType = 0
			end

			-- Only show 'always' if the parameters look valid
			if((this.iPromptType == 1) and ifs_mpgs_login_fnCheckString) then
				if((strlen(this.NickStr) < 1) or 
					 (strlen(this.EmailStr) < 1) or 
					 (strlen(this.PasswordStr) < 1) or
					 (not ifs_mpgs_login_fnCheckString(this.NickStr)) or 
					 (not ifs_mpgs_login_fnCheckString(this.EmailStr)) or 
					 (not ifs_mpgs_login_fnCheckString(this.PasswordStr)) or
					 (not ifs_mpgs_login_fnCheckString2(this.NickStr)) or 
					 (not ifs_mpgs_login_fnCheckString2(this.EmailStr)) or 
					 (not ifs_mpgs_login_fnCheckString2(this.PasswordStr))) then
					this.iPromptType = 2 -- skip to never
				end
			end

			print("Change prompt, post = ", this.iPromptType)

			ScriptCB_SetGSProfileInfo(this.NickStr,this.EmailStr,this.PasswordStr,this.iSaveType,this.iPromptType)
		elseif (this.CurButton == "icon") then
			this.icon = 1 - this.icon
		elseif (this.CurButton == "voiceenable") then
			ScriptCB_VoiceEnable(not ScriptCB_GetVoiceEnable())
		end

		ScriptCB_SetOnlineOpts(this.bAppearOffline,this.bVoiceMask,this.iTVVoiceVol, this.iVoiceRecordVol, this.iVoicePlayVol, this.iNumPlayers, this.iTurnsPerSecond, this.icon, this.bAllRegions)
		-- Repaint screen w/ latest selections
		ifs_opt_mp_fnUpdateStrings(this)
	end,

}


----------------------------------------------------------------------------------------
-- when we're done with this screen, save any dirty profiles
----------------------------------------------------------------------------------------

function ifs_opt_mp_SaveAndPop()
	print("ifs_opt_mp_SaveAndPop")
	local this = ifs_opt_mp
	
	-- if we're in the game, don't try to save
	if(not ifs_saveop) then
		ScriptCB_PopScreen()
		return
	end
	
	ifs_saveop.doOp = "SaveProfile"
	ifs_saveop.OnSuccess = ifs_opt_mp_SaveProfile1Success
	ifs_saveop.OnCancel = ifs_opt_mp_SaveProfile1Cancel
	ifs_saveop.saveName = ScriptCB_GetProfileName(1)
	ifs_saveop.saveProfileNum = 1
	ifs_movietrans_PushScreen(ifs_saveop)	
end

function ifs_opt_mp_SaveProfile1Success()
	print("ifs_opt_mp_SaveProfile1Success")
	-- exit once we reenter
	ifs_opt_mp.PopOnEnter = 1
	ScriptCB_PopScreen()
end

function ifs_opt_mp_SaveProfile1Cancel()
	print("ifs_opt_mp_SaveProfile1Cancel")
	-- exit once we reenter
	ifs_opt_mp.PopOnEnter = 1
	ScriptCB_PopScreen()
end

----------------------------------------------------------------------------------------
-- done profile save
----------------------------------------------------------------------------------------


function ifs_opt_mp_fnBuildScreen(this)
	local w
	local h
	w,h = ScriptCB_GetSafeScreenInfo()
	ifs_opt_mp_vbutton_layout.width = w * this.buttonlabels.ScreenRelativeX

	AddVerticalText(this.buttonlabels,ifs_opt_mp_vbutton_layout)

	local k,v
	for k,v in this.buttonlabels do
		if(type(v) == "table") then
			v.x      = -(v.textw)
			v.halign = "right"
		end
	end

	ifs_opt_mp_vbutton_layout.width = w * (1.0 - this.buttonlabels.ScreenRelativeX)

	this.CurButton = AddVerticalButtons(this.buttons,ifs_opt_mp_vbutton_layout)
	this.buttons.x = 5 -- ifs_opt_mp_vbutton_layout.width * 0.25
	
	this.Background = NewIFImage 
	{
 			ZPos = 255, 
 			x = w/2,  --centered on the x
 			y = h/2, -- inertUVs = 1,
 			alpha = 10,
 			localpos_l = -w/1.5, localpos_t = -h/1.5,
 			localpos_r = w/1.5, localpos_b =  h/1.5,
			texture = "opaque_black",
			ColorR = 20, ColorG = 20, ColorB = 150, -- blue
 	}
 	
 	local BackButtonW = 130 -- made 130 to fix 6198 on PC - NM 8/18/04
	local BackButtonH = 25
	this.donebutton =	NewIFContainer
	{
		ScreenRelativeX = 1.0, -- right
		ScreenRelativeY = 1.0, -- bottom
		y = -15, -- just above bottom
		x = -BackButtonW,
		btn = NewClickableIFButton -- NewRoundIFButton 
		{ 
			btnw = BackButtonW, 
			btnh = BackButtonH,
			font = "gamefont_medium", 
			bg_width = BackButtonW, 
			tag = "_ok",
			nocreatebackground=1,
		}, -- end of btn
	}
	RoundIFButtonLabel_fnSetString(this.donebutton.btn,"common.accept")
	
	this.cancelbutton =	NewIFContainer
	{
		ScreenRelativeX = 0.0, -- right
		ScreenRelativeY = 1.0, -- bottom
		y = -15, -- just above bottom
		x = BackButtonW,
		btn = NewClickableIFButton -- NewRoundIFButton 
		{ 
			btnw = BackButtonW, 
			btnh = BackButtonH,
			font = "gamefont_medium", 
			bg_width = BackButtonW, 
			tag = "_back",
			nocreatebackground=1,			
		}, -- end of btn
	}
	RoundIFButtonLabel_fnSetString(this.cancelbutton.btn,"common.cancel")
	
	this.Background = NewIFImage 
	{
			ZPos = 255, 
			x = w/2,  --centered on the x
			y = h/2, -- inertUVs = 1,
			alpha = 10,
			localpos_l = -w/1.5, localpos_t = -h/1.5,
			localpos_r = w/1.5, localpos_b =  h/1.5,
			texture = "opaque_black",
			ColorR = 20, ColorG = 20, ColorB = 150, -- blue
	}
 	--this.Helptext_Back.helpstr.string = "common.cancel"	
end

ifs_opt_mp_fnBuildScreen(ifs_opt_mp)
ifs_opt_mp_fnBuildScreen = nil
AddIFScreen(ifs_opt_mp, "ifs_opt_mp")
