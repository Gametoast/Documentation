function ifs_mp_lobby_quick_fnOnCancel()
	Popup_Busy:fnActivate(nil)
	ifs_mp_sessionlist.bForceRefresh = 1
	ScriptCB_SetInNetGame(nil)
	ScriptCB_PopScreen()
end
	
function ifs_mp_lobby_quick_fnOnSuccess()
	Popup_Busy:fnActivate(nil)
end
	
function ifs_mp_lobby_quick_fnCheckDone()
	return 0
end
	
ifs_mp_lobby_quick = NewIFShellScreen {

-- make it empty screen
--	title = NewIFText {
--		string = "ifs.mp.lobby_server",
--		font = "gamefont_large",
--		textw = 460,
--		texth = 80,
--		y = 0,
--		ScreenRelativeX = 0.5, -- 
--		ScreenRelativeY = 0, -- top
--	},
	
	bg_texture = "iface_bgmeta_space",
	launchflag		= nil,
	movieIntro      = nil,
	movieBackground = nil,
	bNohelptext_accept = 1,
	bNohelptext_back = 1,    
	bNohelptext_backPC = 1,    

	Enter = function(this, bFwd)
		-- Always call base class
		gIFShellScreenTemplate_fnEnter(this, bFwd)

		this.bAutoLaunch = 1
		
		-- Added chunk for error handling...
		if(not bFwd) then
			local ErrorLevel,ErrorMessage = ScriptCB_GetError()
			if(ErrorLevel >= 6) then -- session or login error, must keep going further
				ScriptCB_PopScreen()
			end
		end

		if(bFwd) then
			Popup_Busy.fnCheckDone = ifs_mp_lobby_quick_fnCheckDone
			Popup_Busy.fnOnSuccess = ifs_mp_lobby_quick_fnOnSuccess
			Popup_Busy.fnOnFail = ifs_mp_lobby_quick_fnOnCancel
			Popup_Busy.fnOnCancel = ifs_mp_lobby_quick_fnOnCancel
			Popup_Busy.bNoCancel = nil
			Popup_Busy.fTimeout = 60 -- seconds
--			IFText_fnSetString(Popup_Busy.title,"ifs.subHardDrive.busy")
			IFText_fnSetString(Popup_Busy.title,"common.mp.joining")
			Popup_Busy:fnActivate(1)

			ScriptCB_BeginLobby()
		else
			-- force an update, NOW. (we zapped everything leaving this screen, gotta
			-- restore it on re-entry)
			ScriptCB_UpdateLobby(1)
		end
	end,

	Exit = function(this, bFwd)
		if(bFwd) then -- going to sub-screen
		else
			ScriptCB_CancelLobby() -- going back to create opts (host) or sessionlist (client)
		end
	end,
	
	Update = function(this, fDt)
		-- Call default base class's update function (make button bounce)
		gIFShellScreenTemplate_fnUpdate(this,fDt)
		
		ScriptCB_UpdateLobby(nil)

		if(this.bAutoLaunch) then
--			print("Autolaunching...")
			ScriptCB_LaunchLobby()
		end
	end,

	Input_GeneralLeft = function(this)
	end,
	Input_GeneralRight = function(this)
	end,
	Input_GeneralUp = function(this)
	end,
	Input_GeneralDown = function(this)
	end,
	
	Input_Back = function(this)
	end,
	Input_Accept = function(this)
	end,

	fnPostError = function(this,bUserHitYes,ErrorLevel,ErrorMessage)
		print("ifs_mp_lobby_quick fnPostError(..,",bUserHitYes,ErrorLevel)

		if(ifs_mp_lobby_quick.bCmdlineJoinPending) then
			ifs_mp_lobby_quick.bCmdlineJoinPending = nil
			ScriptCB_ClearError()
			ScriptCB_PopScreen("ifs_mp_main") -- back to relatively safe place
			return
		end

		if(ErrorLevel >= 6) then
			ScriptCB_PopScreen()
		end

		if((ErrorLevel == 5) and (bUserHitYes) and (gPlatformStr == "XBox")) then
			ScriptCB_XB_Reboot("XLD_LAUNCH_DASHBOARD_ACCOUNT_MANAGEMENT")
		end

	end,
}

AddIFScreen(ifs_mp_lobby_quick,"ifs_mp_lobby_quick")
