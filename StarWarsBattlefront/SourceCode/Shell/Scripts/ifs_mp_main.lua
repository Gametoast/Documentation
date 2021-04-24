-- MP's "main" screen, with options to go to all the rest of the screens

-- Layout for this screen's buttons. Note: do *NOT* delete this out of
-- memory, as it's used during the 

ifs_mp_main_vbutton_layout = {
--	yTop = 110,
	ySpacing = 5,
	width = 275,
	font = "gamefont_medium",
	buttonlist = { 
		{ tag = "fastclient", string = "common.mp.fastclient", },
		{ tag = "client", string = "common.join", }, -- was "common.mp.client",
		{ tag = "host", string = "ifs.profile.create", }, -- was common.mp.host
		{ tag = "joinip", string = "common.mp.joinip", },
 		{ tag = "friends", string = "common.mp.friends", },
 		{ tag = "download", string = "common.mp.downloadable", },
 		{ tag = "recent", string = "common.mp.recent", },
 		{ tag = "signout", string = "common.mp.signout", },
	},
	title = "common.mp.title",
	rotY = 45,
}

function ifs_mp_fnForceOk()
	return 1
end

-- Helper function, starts the process of hosting, with a flag for
-- dedicated hosting
function ifs_mp_fnStartHosting(this, bDedicated)
--	this.bDedicated = bDedicated
--	ifs_mp_gameopts.bDedicated = bDedicated -- copy setting

	ScriptCB_SetAmHost(1)
	if(gPlatformStr == "PC" ) then	
		print("I Want to host a multiplayer PC game")
		ScriptCB_SetGameName(ScriptCB_ununicode("Default Game Name"))
		ifs_missionselect_pcMulti.fnDone = ifs_mp_fnMissionsDone
		ifs_missionselect_pcMulti.bForMP = 1
		ScriptCB_SetMetagameRulesOn(nil) -- for ingame
		ifs_movietrans_PushScreen(ifs_missionselect_pcMulti)	
	else
		
	--	ScriptCB_SetDedicated(bDedicated)
		
		local LoginIdx = ifs_login_listbox_layout.SelectedIdx
		if((not LoginIdx) or (LoginIdx < 1)) then
			LoginIdx = 1
		end
		
		ifs_vkeyboard.CurString = ScriptCB_GetCurrentProfileNetName()
		ifs_vkeyboard.bCursorOnAccept = 1 -- start cursor on Accept
		
		--			IFText_fnSetString(ifs_vkeyboard.title,"ifs.mp.create.entername")
		IFText_fnSetString(ifs_vkeyboard.title,"ifs.vkeyboard.title_gamename")
		vkeyboard_specs.fnDone = ifs_mp_fnKeyboardDone
		vkeyboard_specs.fnIsOk = ifs_login_fnIsAcceptable -- reuse this

		local w,h = ScriptCB_GetSafeScreenInfo() -- of the usable screen
		vkeyboard_specs.MaxWidth = (w * 0.5)
		vkeyboard_specs.MaxLen = 32

		if(gOnlineServiceStr == "XLive") then
			ifs_mp_fnKeyboardDone() -- act like we went thru this
		else
			ifs_movietrans_PushScreen(ifs_vkeyboard)
		end
	end
end

function ifs_mp_fnMissionsDone()
	if(ifs_missionselect.SelectedMap) then
		ifs_movietrans_PushScreen(ifs_mp_gameopts)
	end
end

-- Yep, this really does nothing...
function ifs_mp_DoNothing()
end

-- Callback function when the virtual keyboard is done
function ifs_mp_fnKeyboardDone()
	if(strlen(ifs_vkeyboard.CurString) > 1) then

		-- Hack! Netcode should be unicoded
		ScriptCB_SetGameName(ScriptCB_ununicode(ifs_vkeyboard.CurString))
		ifs_vkeyboard.CurString = "" -- clear
		ifs_missionselect.fnDone = ifs_mp_fnMissionsDone
		if(gOnlineServiceStr == "XLive") then
			-- So that we don't go back two screens on exiting.
			ifs_missionselect.fnCancel = ifs_mp_DoNothing
		else
			ifs_missionselect.fnCancel = nil
		end
		ifs_missionselect.bForMP = 1
		ScriptCB_SetMetagameRulesOn(nil) -- for ingame
		
		if(ifs_sp.bForSplitScreen) then
			ifs_movietrans_PushScreen(ifs_split_map)
		else
			ifs_movietrans_PushScreen(ifs_missionselect)
		end
		
		vkeyboard_specs.fnDone = nil -- clear our registration there
	else
	end
end

-- Callbacks from the "Really signout?" popup. If bResult is true,
-- they selected 'yes'
function ifs_xlive_main_fnLogoutPopupDone(bResult)
	local this = ifs_mp_main
	if(bResult) then
		-- They really want to kill the login
		if(gPlatformStr == "XBox") then
			ScriptCB_CancelLogin()
		end

		ScriptCB_PopScreen() -- default action
	end
	IFObj_fnSetVis(this.buttons, 1) -- always re-enable screen
end

-- Callbacks from the "No sessions found, create one?" popup. If
-- bResult is true, they selected 'yes'
function ifs_xlive_main_fnAskCreateDone(bResult)
	local this = ifs_mp_main
	if(bResult) then
		ifs_mp_fnStartHosting(this, nil)
	end
	IFObj_fnSetVis(this.buttons, 1) -- always re-enable screen
end

-- Callbacks from the busy popup

-- Returns -1, 0, or 1, depending on error, busy, or success
function ifs_main_quickmatch_fnCheckDone()
--	local this = ifs_main_quickmatch
	ScriptCB_UpdateQuickmatch() -- think...

	return ScriptCB_IsQuickmatchDone()
end

function ifs_main_quickmatch_fnOnSuccess()
	local this = ifs_mp_main
	print(" ** ifs_main_quickmatch_fnOnSuccess")
	Popup_Busy:fnActivate(nil)
	ScriptCB_LaunchQuickmatch()
	ifs_missionselect.bForMP = 1
	if(ScriptCB_AreMetagameRulesOn()) then
		ifs_movietrans_PushScreen(ifs_meta_top)
	else
		ifs_movietrans_PushScreen(ifs_mp_lobby_quick)
	end
end

function ifs_main_quickmatch_fnOnFail()
	print("Quickmatch search failed")

	Popup_Busy:fnActivate(nil)
	print(" ** ifs_main_quickmatch_fnOnFail")
	Popup_YesNo.CurButton = "no" -- default
	Popup_YesNo.fnDone = ifs_xlive_main_fnAskCreateDone
	IFText_fnSetString(Popup_YesNo.title,"ifs.quickopti.nonefound")
	Popup_YesNo:fnActivate(1)
end

function ifs_mp_main_fnPostOKPopup()
	local this = ifs_mp_main
	IFObj_fnSetVis(this.buttons, 1)
end

function ifs_main_specialmatch_fnOnFail()
	print("Special search failed")

	Popup_Busy:fnActivate(nil)
	print(" ** ifs_main_specialmatch_fnOnFail")
	Popup_Ok_Large.fnDone = ifs_mp_main_fnPostOKPopup
	if(gPlatformStr == "PC") then
		IFText_fnSetString(Popup_Ok_Large.title,"ifs.mp.joinerrors.cantfind")
	else
		IFText_fnSetString(Popup_Ok_Large.title,"xlive.errors.sessionnotavailable")
	end

	Popup_Ok_Large:fnActivate(1)
end

-- User hit cancel. Do what they want.
function ifs_main_quickmatch_fnOnCancel()
	local this = ifs_mp_main

	-- Stop logging in.
	ScriptCB_CancelQuickmatch()

	-- Get rid of popup, turn this screen back on
	Popup_Busy:fnActivate(nil)
	print(" ** ifs_main_quickmatch_fnOnCancel")
	IFObj_fnSetVis(this.buttons, 1)
end

ifs_mp_main = NewIFShellScreen {
	nologo = 1,
	bg_texture = "iface_bgmeta_space",
	movieIntro      = nil,
	movieBackground = nil,
	bFriendsIcon = 1,

	bAutoLaunch = nil,
	
--	title = NewIFText {
--		string = "common.mp.title",
--		font = "gamefont_large",
--		textw = 460,
--		y = 0,
--		ScreenRelativeX = 0.5, -- center
--		ScreenRelativeY = 0, -- top
--	},

	buttons = NewIFContainer {
		ScreenRelativeX = 0.5, -- center
		ScreenRelativeY = 0.5, -- center
		y = 20, -- go slightly down from center
		x = -20,
	},
		
	Enter = function(this, bFwd)
		-- Call default Enter function
		gIFShellScreenTemplate_fnEnter(this, bFwd)

		-- right align the ok button	
		gIFShellScreenTemplate_fnMoveClickableButton(this.JoinIPBtn,this.JoinIPBtn.label,0)
		
--		print("gOnlineServiceStr ===========" ,gOnlineServiceStr) 
		-- Force a refresh of this
		ScriptCB_SetNetLoginName(ScriptCB_GetCurrentProfileNetName())

		if(this.JoinIPBox) then -- hidden until button is selected
			IFObj_fnSetVis(this.JoinIPBox, nil)
			IFObj_fnSetVis(this.JoinIPBtn, nil)
			this.bJoinIPBoxVis = nil
		end

		-- Added chunk for error handling...
		if(not bFwd) then
			local ErrorLevel,ErrorMessage = ScriptCB_GetError()
			print("ifs_mp_main, ErrorLevel = ",ErrorLevel)
			if(ErrorLevel >= 7) then -- login error, must keep going further
				ScriptCB_PopScreen()
			else
				-- In-session error that requires leaving it. We know we're
				-- out of it now, can do things normally.
				ScriptCB_ClearError()
			end
		end
		
		-- set the title to the current connection type
		if(gOnlineServiceStr == "Direct") then
			IFText_fnSetString(this.buttons._titlebar_,"ifs.mp.connection.direct")
		elseif(gOnlineServiceStr == "LAN") then
			IFText_fnSetString(this.buttons._titlebar_,"ifs.mp.connection.lan")
		elseif(gOnlineServiceStr == "GameSpy") then
			IFText_fnSetString(this.buttons._titlebar_,"ifs.mp.connection.gamespy")
		end
		

		-- always re-enable screen on entry (by default). Might be turned off below
		print("turning on this.buttons")
		IFObj_fnSetVis(this.buttons, 1) 
	--	if(this.Helptext_Back) then
	--		print("turning on helptext back and accept")
	--		IFObj_fnSetVis(this.Helptext_Back, 1)
	--		IFObj_fnSetVis(this.Helptext_Accept, 1)
	--	end
	--	print("done turning on helptext back and accept")
		local bForXLive = (gOnlineServiceStr == "XLive")
		this.buttons.friends.hidden = not bForXLive
		this.buttons.fastclient.hidden = not bForXLive
		this.buttons.recent.hidden = not bForXLive
--		this.buttons.stats.hidden = not bForXLive
		this.buttons.joinip.hidden = (gOnlineServiceStr ~= "Direct")
		this.buttons.download.hidden = (not bForXLive) or ScriptCB_HideDownloadableContent()
		this.buttons.signout.hidden = not bForXLive

		if(gPlatformStr == "XBox") then
			if(not bForXLive) then
				IFText_fnSetString(this.buttons.client.label,"common.mp.client_lan") -- search
			else
				IFText_fnSetString(this.buttons.client.label,"common.mp.client")
			end
			IFText_fnSetString(this.buttons.host.label,"common.mp.host")
		end

		if(gOnlineServiceStr == "XLive") then
			ifs_XLive_fnUpdateSilentLoginBox(this)
		end

		--print("turning on helptext back and accept")
		IFObj_fnSetVis(this.LoginInfoWindow, (gOnlineServiceStr == "XLive"))

		this.buttons.client.hidden = (gOnlineServiceStr == "Direct")

		if(bFwd) then
			this.CurButton = ShowHideVerticalButtons(this.buttons,ifs_mp_main_vbutton_layout)
		else
			-- Just in case we're backing into this screen.
			ShowHideVerticalButtons(this.buttons,ifs_mp_main_vbutton_layout)

			if(ifs_mp_main.bHostOnEnter) then
				ifs_mp_fnStartHosting(this, nil)
				ifs_mp_main.bHostOnEnter = nil
			end
		end
		SetCurButton(this.CurButton)
		ifs_mp_main.bHostOnEnter = nil
		
		-- Move friends icon if appropriate
		if(gOnlineServiceStr == "XLive") then
			local XPos = ScriptCB_IFText_GetTextExtent(this.buttons.friends.label.cpointer) + 30
			local YPos = this.buttons.friends.y - 15
			IFObj_fnSetPos(this.buttons.FriendIcon,XPos,YPos)
			IFObj_fnSetVis(this.buttons.FriendIcon, 1)
		else
			IFObj_fnSetVis(this.buttons.FriendIcon, nil) -- just hide it.
		end

		local bSetFlow = nil
		local bSpecialJoinPending = ScriptCB_IsSpecialJoinPending()

		if(bFwd) then -- if entering this screen from main menu, start network
			ScriptCB_OpenNetShell(1)
			-- If we have a special join ready, then ignore auto-rejoin info.
			if (ScriptCB_InNetGame() and (not bSpecialJoinPending)) then
				if (ScriptCB_NetWasHost()) then
					if (ScriptCB_NetWasDedicated()) then
						if( ( ScriptCB_NetWasDedicatedQuit() == 0 ) or			-- pause menu disactivated
							( ScriptCB_NetWasDedicatedQuit() == 1 ) ) then		-- pause menu activated but didn't select quit
							-- not quit from dedicated server
							ScriptCB_SetAmHost(1)
							ScriptCB_SetDedicated(1)
							ifs_movietrans_PushScreen(ifs_mp_lobbyds);
							bSetFlow = 1
						end
					else
						ScriptCB_SetAmHost(1)
						ScriptCB_SetDedicated(nil)
						--ifs_movietrans_PushScreen(ifs_mp_lobby);
						bSetFlow = 1
						ifs_mp_main.bAutoLaunch = 1
						IFObj_fnSetVis(this.buttons, nil)
						if(this.Helptext_Back) then
							IFObj_fnSetVis(this.Helptext_Back, nil)
						end
						if(this.Helptext_Accept) then
							IFObj_fnSetVis(this.Helptext_Accept, nil)
						end
						IFObj_fnSetVis(this.LoginInfoWindow, nil)
						ScriptCB_BeginLobby()						
					end
				elseif (ScriptCB_NetWasClient()) then
					-- todo make a special session list for autojoining last game
					ScriptCB_SetAmHost(nil)
					ScriptCB_SetHostLimit(100)
					ScriptCB_SetDedicated(nil)
					ifs_movietrans_PushScreen(ifs_mp_sessionlist)     
					bSetFlow = 1
				end
			end
		end

		print(" ** Before special join!")

		local CmdlinePending = ScriptCB_IsCmdlineJoinPending()
		if(CmdlinePending) then
			this.bJoinIPOnEntry = 1
			ifs_vkeyboard = ifs_vkeyboard or {}
			ifs_vkeyboard.CurString = CmdlinePending
		end

		-- See if we need to do a JoinIP (or an XLive join friend)
		if((not bSetFlow) and ((this.bJoinIPOnEntry) or (bSpecialJoinPending))) then
			print(" ** Begin special join!")
			ScriptCB_SetAmHost(nil)
			ScriptCB_SetHostLimit(100)
			ScriptCB_SetDedicated(nil)
			if(this.bJoinIPOnEntry) then
				ScriptCB_BeginJoinIP(ifs_vkeyboard.CurString)
			else
				ScriptCB_BeginJoinSpecial()
			end
			IFObj_fnSetVis(this.buttons, nil)

			Popup_Busy.fnCheckDone = ifs_main_quickmatch_fnCheckDone
			Popup_Busy.fnOnSuccess = ifs_main_quickmatch_fnOnSuccess
			Popup_Busy.fnOnFail = ifs_main_specialmatch_fnOnFail
			Popup_Busy.fnOnCancel = ifs_main_quickmatch_fnOnCancel
			Popup_Busy.bNoCancel = nil
			Popup_Busy.fTimeout = 15 -- seconds
--			IFText_fnSetString(Popup_Busy.title,"ifs.subHardDrive.busy")
			IFText_fnSetString(Popup_Busy.title,"common.mp.joining")
			Popup_Busy:fnActivate(1)
			print(" ** Special join - popup open")

			this.bJoinIPOnEntry = nil
		end

		print(" ** Special join - post startup")

		-- Also stop the movie (if going)
		ifelem_shellscreen_fnStopMovie()
	end,

	Update = function(this, fDt)
		-- Call default base class's update function (make button bounce)
		gIFShellScreenTemplate_fnUpdate(this,fDt)
		
		if( ifs_mp_main.bAutoLaunch ) then
			ScriptCB_UpdateLobby(nil)
	
--			print("Autolaunching...")
			ScriptCB_LaunchLobby()
		end
	end,

	Exit = function(this, bFwd)
		if(bFwd) then
			-- going to a sub-page of this. Don't need to do anything
		else
			-- if leaving this screen towards the main menu, close network
			-- [Except for XLive and its silent login nonsense]
			if(gPlatformStr ~= "XBox") then
				ScriptCB_CancelLogin()
			end

			ScriptCB_CloseNetShell(1)
		end
		if(gCurHiliteButton) then
			IFButton_fnSelect(gCurHiliteButton,nil)
		end
	end,

	Input_Accept = function(this) 
		-- If base class handled this work, then we're done
		if(gShellScreen_fnDefaultInputAccept(this)) then
			return
		end

		ifelm_shellscreen_fnPlaySound(this.acceptSound)
		if(this.CurButton == "host") then
			ScriptCB_ClearPrevSessionId()
			ifs_mp_fnStartHosting(this, nil)
		elseif (this.CurButton == "fastclient") then
			ScriptCB_SetAmHost(nil)
			ScriptCB_SetHostLimit(100)
			ScriptCB_SetDedicated(nil)
			ScriptCB_BeginQuickmatch()
			IFObj_fnSetVis(this.buttons, nil)

			Popup_Busy.fnCheckDone = ifs_main_quickmatch_fnCheckDone
			Popup_Busy.fnOnSuccess = ifs_main_quickmatch_fnOnSuccess
			Popup_Busy.fnOnFail = ifs_main_quickmatch_fnOnFail
			Popup_Busy.fnOnCancel = ifs_main_quickmatch_fnOnCancel
			Popup_Busy.bNoCancel = nil -- allow cancel button
			Popup_Busy.fTimeout = 15 -- seconds
--			IFText_fnSetString(Popup_Busy.title,"ifs.subHardDrive.busy")
			IFText_fnSetString(Popup_Busy.title,"common.mp.joining")
			Popup_Busy:fnActivate(1)
		elseif (this.CurButton == "client") then
			ScriptCB_SetAmHost(nil)
			ScriptCB_SetHostLimit(100)
			ScriptCB_SetDedicated(nil)
			ifs_missionselect.bForMP = 1
			if(gOnlineServiceStr == "XLive") then
				ifs_movietrans_PushScreen(ifs_mpxl_optimatch)
			else
				ifs_movietrans_PushScreen(ifs_mp_sessionlist)
			end
			--		elseif (this.CurButton == "dedicated") then
			--			ifs_mp_fnStartHosting(this,1)
		elseif (this.CurButton == "joinip" or this.CurButton=="launch") then
			if(not this.bJoinIPBoxVis) then
				local JoinIP = ScriptCB_GetProfileJoinIP()
				if( JoinIP ) then
					print("JoinIP = ", JoinIP)
					IFEditbox_fnSetString(this.JoinIPBox.ipedit,JoinIP)
				end
				
				IFObj_fnSetVis(this.JoinIPBox, this.bJoinIPBoxVis)
				IFObj_fnSetVis(this.JoinIPBtn, this.bJoinIPBoxVis)
				this.bJoinIPBoxVis = 1
			else
				-- box was visible. Now try and join
				this.bJoinIPBoxVis = nil
				ScriptCB_SetConnectType("direct")
				gOnlineServiceStr  = "Direct"
				local JoinIPStr = IFEditbox_fnGetString(this.JoinIPBox.ipedit)
				ScriptCB_SetProfileJoinIP(JoinIPStr)

				local PassStr = IFEditbox_fnGetString(this.JoinIPBox.passedit)

				ScriptCB_SetAmHost(nil)
				ScriptCB_SetHostLimit(100)
				ScriptCB_SetDedicated(nil)
				ScriptCB_BeginJoinIP(JoinIPStr,PassStr)
				IFObj_fnSetVis(this.buttons, nil)

				Popup_Busy.fnCheckDone = ifs_main_quickmatch_fnCheckDone
				Popup_Busy.fnOnSuccess = ifs_main_quickmatch_fnOnSuccess
				Popup_Busy.fnOnFail = ifs_main_specialmatch_fnOnFail
				Popup_Busy.fnOnCancel = ifs_main_quickmatch_fnOnCancel
				Popup_Busy.bNoCancel = nil
				Popup_Busy.fTimeout = 15 -- seconds
--			IFText_fnSetString(Popup_Busy.title,"ifs.subHardDrive.busy")
				IFText_fnSetString(Popup_Busy.title,"common.mp.joining")
				Popup_Busy:fnActivate(1)
			end

			IFObj_fnSetVis(this.JoinIPBox, this.bJoinIPBoxVis)
			IFObj_fnSetVis(this.JoinIPBtn, this.bJoinIPBoxVis)

		elseif (this.CurButton == "download") then
			ScriptCB_RebootToDownloaderXBE()
			--this function doesn't return.
		elseif (this.CurButton == "friends") then
			if(gOnlineServiceStr == "XLive") then
				ifs_mpxl_friends.bRecentMode = nil
				ifs_movietrans_PushScreen(ifs_mpxl_friends)
			else
				ifs_movietrans_PushScreen(ifs_mpgs_friends)
			end
		elseif (this.CurButton == "recent") then
			ifs_mpxl_friends.bRecentMode = 1
			ifs_movietrans_PushScreen(ifs_mpxl_friends)
		elseif (this.CurButton == "signout") then
			Popup_YesNo.CurButton = "no" -- default
			Popup_YesNo.fnDone = ifs_xlive_main_fnLogoutPopupDone
			IFText_fnSetString(Popup_YesNo.title,"ifs.pickacct.asksignout")
			IFObj_fnSetVis(this.buttons, nil) -- re-enable screen
			Popup_YesNo:fnActivate(1)
		end
	end,

	Input_Back = function(this)
		local bAskSignout = ((gOnlineServiceStr == "GameSpy") and (ScriptCB_IsLoginDone() > 0))

		if(bAskSignout) then
			-- Need to pop up "really signout" dialog

			Popup_YesNo.CurButton = "no" -- default
			Popup_YesNo.fnDone = ifs_xlive_main_fnLogoutPopupDone
			IFText_fnSetString(Popup_YesNo.title,"ifs.pickacct.asksignout")
			IFObj_fnSetVis(this.buttons, nil) -- re-enable screen
			Popup_YesNo:fnActivate(1)
		else -- not XLive, no need to "sign out"
			ScriptCB_PopScreen() -- default action
		end
	end,

	Input_KeyDown = function(this, iKey)

		if(gCurEditbox) then
			if((iKey == 10) or (iKey == 13)) then -- handle Enter different
				gCurEditbox = nil
				this.CurButton = "joinip"
				this:Input_Accept()
			elseif (iKey == 9) then
				-- Handle tab key
				if(gCurEditbox) then
					IFEditbox_fnHilight(gCurEditbox, nil)
				end
				if(gCurEditbox == this.JoinIPBox.ipedit) then
					gCurEditbox = this.JoinIPBox.passedit
				elseif (gCurEditbox == this.JoinIPBox.passedit) then
					gCurEditbox = this.JoinIPBox.ipedit
				end
				if(gCurEditbox) then
					IFEditbox_fnHilight(gCurEditbox, 1)
				end
			else
				IFEditbox_fnAddChar(gCurEditbox, iKey)
			end
		end
	end,

	fnPostError = function(this,bUserHitYes,ErrorLevel,ErrorMessage)
		print("ifs_mp_main fnPostError(..,",bUserHitYes,ErrorLevel)
		if(ErrorLevel >= 6) then
			ScriptCB_PopScreen()
		end

		if((ErrorLevel == 5) and (bUserHitYes) and (gPlatformStr == "XBox")) then
			ScriptCB_XB_Reboot("XLD_LAUNCH_DASHBOARD_ACCOUNT_MANAGEMENT")
		end

	end,

}


-- Does any programatic work to build this screen
function ifs_mp_main_fnBuildScreen(this)
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

	if(gOnlineServiceStr == "XLive") then
		ifs_mp_main_vbutton_layout.font = "gamefont_small"
	end

	this.CurButton = AddVerticalButtons(this.buttons,ifs_mp_main_vbutton_layout)

	if(gOnlineServiceStr == "XLive") then
		-- Move buttons left to make space for the 'who's signed in' button
		this.buttons.x = this.buttons.x - 65
		-- And the 'download content' button is HUGE (especially in German). It's
		-- in the middle of the triangle, so give it more space.
		this.buttons.download.label.textw = this.buttons.download.label.textw + 50 
	end

	if(gPlatformStr == "PC") then
		local EditBoxW = 375
		local EditBoxH = 40
		local EditBoxYSpace = 15

		this.JoinIPBox = NewIFContainer
		{
			ScreenRelativeX = 0.5, -- right
			ScreenRelativeY = 0.65, -- a bit below buttons
			rotY = 35,

			iptitle = NewIFText {
				string ="common.mp.joinip_prompt",
				font = "gamefont_small",
				textw = 250,
				x = -260 + EditBoxW * -0.5,
				y = -12,
				halign = "right",
				nocreatebackground = 1,
			},

			ipedit = NewEditbox {
				width = EditBoxW,
				height = EditBoxH,
				font = "gamefont_medium",
				--		string = "Player 1",
				MaxLen = EditBoxW - 30,
				MaxChars = 19,
			},

			passtitle = NewIFText {
				string ="ifs.gsprofile.password",
				font = "gamefont_small",
				textw = 250,
				x = -260 + EditBoxW * -0.5,
				y = -12 + EditBoxH + EditBoxYSpace,
				halign = "right",
				nocreatebackground = 1,
			},

			passedit = NewEditbox {
				width = EditBoxW,
				height = EditBoxH,
				font = "gamefont_medium",
				--		string = "Player 1",
				MaxLen = EditBoxW - 30,
				MaxChars = 25,
				y = EditBoxH + EditBoxYSpace,
				bPasswordMode = 1,
			},
		}
		
		
		local BackButtonW = 100
		local w,h = ScriptCB_GetSafeScreenInfo()
		this.JoinIPBtn = NewClickableIFButton
		{ 
			ScreenRelativeX = 1,
			ScreenRelativeY = 1,
			y = -15, 
			btnw = BackButtonW, 
			btnh =  ScriptCB_GetFontHeight("gamefont_medium"),
			font = "gamefont_medium", 
			bg_tail = 20,
			nocreatebackground = 1,
			tag = "launch",
			string = "common.ok",
		}
		

	end

end

ifs_mp_main_fnBuildScreen(ifs_mp_main)
ifs_mp_main_fnBuildScreen = nil
AddIFScreen(ifs_mp_main,"ifs_mp_main")
