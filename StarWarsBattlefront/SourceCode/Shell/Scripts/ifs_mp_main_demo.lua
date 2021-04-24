-- E3 main menu screen. Severely-stripped down version of ifs_mp_main

-- Layout for this screen's buttons. Note: do *NOT* delete this out of
-- memory, as it's used during the 

ifs_mp_main_e3_vbutton_layout = {
--	yTop = 110,
	yHeight = 50,
	ySpacing = 0,
	width = 400,
	font = "gamefont_large",
	buttonlist = { 
		{ tag = "fastclient", string = "CONNECT", },
--		{ tag = "client", string = "common.mp.client", },
		{ tag = "host", string = "common.mp.host", },
--		{ tag = "joinip", string = "common.mp.joinip", },
 		{ tag = "dedicated", string = "common.mp.dedicated", },
--  		{ tag = "friends", string = "common.mp.friends", },
--  		{ tag = "recent", string = "common.mp.recent", },
--  		{ tag = "options", string = "common.mp.options", },
--  		{ tag = "stats", string = "common.mp.stats", },
	},
}

function ifs_mpe3_fnForceOk()
	return 1
end

-- Helper function, starts the process of hosting, with a flag for
-- dedicated hosting
function ifs_mpe3_fnStartHostingDS(this, bDedicated)
--	this.bDedicated = bDedicated
--	ifs_mp_gameopts.bDedicated = bDedicated -- copy setting

	ScriptCB_SetAmHost(1)
	ScriptCB_SetDedicated(bDedicated)
	
	local LoginIdx = ifs_login_listbox_layout.SelectedIdx
	if((not LoginIdx) or (LoginIdx < 1)) then
		LoginIdx = 1
	end
	
	ifs_vkeyboard.CurString = ScriptCB_tounicode("E3 session")
	ifs_vkeyboard.bCursorOnAccept = 1 -- start cursor on Accept
	
	--			IFText_fnSetString(ifs_vkeyboard.title,"ifs.mp.create.entername")
	vkeyboard_specs.fnDone = ifs_mpe3_fnKeyboardDone
	vkeyboard_specs.fnIsOk = ifs_login_fnIsAcceptable -- reuse this

	ScriptCB_SetGameName(ScriptCB_ununicode(ifs_vkeyboard.CurString))
	ifs_vkeyboard.CurString = "" -- clear
	if(bDedicated) then
		ifs_missionselect.fnDone = ifs_mpe3_fnDSMissionsDone
	else
		ifs_missionselect.fnDone = ifs_mpe3_fnMissionsDone
	end
	ifs_missionselect.bForMP = 1

	ScriptCB_SetMetagameRulesOn(nil) -- for ingame

	if(gPlatformStr == "XBox") then
		ScriptCB_SetMissionNames(gE3_XBox_HostMapList,nil)
	else
		ScriptCB_SetMissionNames(gE3_PS2_HostMapList,nil)
	end

-- 	ScriptCB_PushScreen("ifs_missionselect")
-- end

-- function ifs_mpe3_fnMissionsDone()
-- 	if(ifs_missionselect.SelectedMap) then
-- 		local this = ifs_mp_main_e3
	this.iNumPlayers,this.iMaxPlayers,this.iNumBots,this.iMaxBots,this.iTeamDmg,this.iAutoAim,this.bShowNames,this.bAutoAssignTeams,this.iStartCnt = ScriptCB_GetNetGameDefaults()
	
	this.bHeroesEnabled = nil
	
	ScriptCB_SetNetGameDefaults(this.iNumPlayers,this.iNumBots,this.iTeamDmg,this.AutoAim,this.bIsPrivate,this.bShowNames,this.bAutoAssignTeams,this.iStartCnt,this.bHeroesEnabled)

	ifs_mp_lobbyds.bAutoLaunch = 1
	ifs_mp_lobby.bAutoLaunch = 1
	ScriptCB_PushScreen("ifs_mp_lobby")
end

-- Helper function, starts the process of hosting, with a flag for
-- dedicated hosting
function ifs_mpe3_fnStartHosting(this, bDedicated)
--	this.bDedicated = bDedicated
--	ifs_mp_gameopts.bDedicated = bDedicated -- copy setting

	ScriptCB_SetAmHost(1)
	ScriptCB_SetDedicated(bDedicated)
	
	local LoginIdx = ifs_login_listbox_layout.SelectedIdx
	if((not LoginIdx) or (LoginIdx < 1)) then
		LoginIdx = 1
	end
	
	ifs_vkeyboard.CurString = ScriptCB_tounicode("E3 session")
	ifs_vkeyboard.bCursorOnAccept = 1 -- start cursor on Accept
	
	--			IFText_fnSetString(ifs_vkeyboard.title,"ifs.mp.create.entername")
	vkeyboard_specs.fnDone = ifs_mpe3_fnKeyboardDone
	vkeyboard_specs.fnIsOk = ifs_login_fnIsAcceptable -- reuse this

	ScriptCB_SetGameName(ScriptCB_ununicode(ifs_vkeyboard.CurString))
	ifs_vkeyboard.CurString = "" -- clear
	if(bDedicated) then
		ifs_missionselect.fnDone = ifs_mpe3_fnDSMissionsDone
	else
		ifs_missionselect.fnDone = ifs_mpe3_fnMissionsDone
	end
	ifs_missionselect.bForMP = 1

	ScriptCB_SetMetagameRulesOn(nil) -- for ingame

	if(gPlatformStr == "XBox") then
		ScriptCB_SetMissionNames(gE3_XBox_HostMapList,nil)
	else
		ScriptCB_SetMissionNames(gE3_PS2_HostMapList,nil)
	end

 	ScriptCB_PushScreen("ifs_missionselect")
 end

function ifs_mpe3_fnMissionsDone()
 	if(ifs_missionselect.SelectedMap) then
 		local this = ifs_mp_main_e3
		this.iNumPlayers,this.iMaxPlayers,this.iNumBots,this.iMaxBots,this.iTeamDmg,this.iAutoAim,this.bShowNames,this.bAutoAssignTeams,this.iStartCnt = ScriptCB_GetNetGameDefaults()
		
		this.bHeroesEnabled = nil
		
		ScriptCB_SetNetGameDefaults(this.iNumPlayers,this.iNumBots,this.iTeamDmg,this.iAutoAim,this.bIsPrivate,this.bShowNames,this.bAutoAssignTeams,this.iStartCnt,this.bHeroesEnabled)

		ifs_mp_lobbyds.bAutoLaunch = 1
		ifs_mp_lobby.bAutoLaunch = 1
		ScriptCB_PushScreen("ifs_mp_lobby")
	end
end


function ifs_mpe3_fnDSMissionsDone()
	if(ifs_missionselect.SelectedMap) then
		local this = ifs_mp_main_e3
		this.iNumPlayers,this.iMaxPlayers,this.iNumBots,this.iMaxBots,this.iTeamDmg,this.iAutoAim,this.bShowNames,this.bAutoAssignTeams,this.iStartCnt = ScriptCB_GetNetGameDefaults()

		this.bHeroesEnabled = nil

		ScriptCB_SetNetGameDefaults(this.iNumPlayers,this.iNumBots,this.iTeamDmg,this.iAutoAim,this.bIsPrivate,this.bShowNames,this.bAutoAssignTeams,this.iStartCnt,this.bHeroesEnabled)
		ScriptCB_PushScreen("ifs_mp_lobbyds")
	end
end

-- Callback function when the virtual keyboard is done
function ifs_mpe3_fnKeyboardDone()
	if(strlen(ifs_vkeyboard.CurString) > 1) then

		-- Hack! Netcode should be unicoded
		ScriptCB_SetGameName(ScriptCB_ununicode(ifs_vkeyboard.CurString))
		ifs_vkeyboard.CurString = "" -- clear
		ifs_missionselect.fnDone = ifs_mpe3_fnMissionsDone
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

function ifs_mpe3_fnJoinIPKeyboardDone()
	if(strlen(ifs_vkeyboard.CurString) > 8) then
		local this = ifs_mp_main_e3
		this.bJoinIPOnEntry = 1
		ScriptCB_PopScreen() -- back to ifs_mp_main_e3

	end
end

-- Callbacks from the "Really signout?" popup. If bResult is true,
-- they selected 'yes'
function ifs_xlive_main_fnLogoutPopupDone(bResult)
	local this = ifs_mp_main_e3
	if(bResult) then
		ScriptCB_PopScreen() -- default action
	end
	IFObj_fnSetVis(this.buttons, 1) -- always re-enable screen
end

-- Callbacks from the "No sessions found, create one?" popup. If
-- bResult is true, they selected 'yes'
function ifs_xlive_main_fnAskCreateDone(bResult)
	local this = ifs_mp_main_e3
	if(bResult) then
		ifs_mpe3_fnStartHosting(this, nil)
	end
	IFObj_fnSetVis(this.buttons, 1) -- always re-enable screen
end

-- Callbacks from the busy popup

-- Returns -1, 0, or 1, depending on error, busy, or success
function ifs_mp_main_quickmatch_fnCheckDone()
--	local this = ifs_mp_main_quickmatch
	ScriptCB_UpdateQuickmatch() -- think...

	return ScriptCB_IsQuickmatchDone()
end

function ifs_mp_main_quickmatch_fnOnSuccess()
	local this = ifs_mp_main_e3
	Popup_Busy:fnActivate(nil)
	ScriptCB_LaunchQuickmatch()
	if(ScriptCB_AreMetagameRulesOn()) then
		ScriptCB_PushScreen("ifs_meta_top")
	else
		ScriptCB_PushScreen("ifs_mp_lobby")
	end
end

function ifs_mp_main_quickmatch_fnOnFail()
	print("Quickmatch search failed")

	ifs_mp_lobby.bHideOnEntry = nil

	Popup_Busy:fnActivate(nil)
	Popup_YesNo.CurButton = "no" -- default
	Popup_YesNo.fnDone = ifs_xlive_main_fnAskCreateDone
	IFText_fnSetString(Popup_YesNo.title,"ifs.quickopti.nonefound")
	Popup_YesNo:fnActivate(1)
end

-- User hit cancel. Do what they want.
function ifs_mp_main_quickmatch_fnOnCancel()
	local this = ifs_mp_main_e3

	-- Stop logging in.
	ScriptCB_CancelQuickmatch()

	ifs_mp_lobby.bHideOnEntry = nil

	-- Get rid of popup, turn this screen back on
	Popup_Busy:fnActivate(nil)
	IFObj_fnSetVis(this.buttons, 1)
end

ifs_mp_main_e3 = NewIFShellScreen {
	nologo = 1,
	bg_texture = "iface_bgmeta_space",

	title = NewIFText {
		string = "common.mp.title",
		font = "gamefont_large",
		textw = 460,
		y = 0,
		ScreenRelativeX = 0.5, -- center
		ScreenRelativeY = 0, -- top
	},

	buttons = NewIFContainer {
		ScreenRelativeX = 0.5, -- center
		ScreenRelativeY = 0.5, -- center
		y = 20, -- go slightly down from center
	},
		
	Enter = function(this, bFwd)
		-- Call default Enter function
		gIFShellScreenTemplate_fnEnter(this, bFwd)
		ScriptCB_SetConnectType("lan")
		gOnlineServiceStr = "LAN"

		ifs_missionselect.fnDone = nil
		vkeyboard_specs.fnDone = nil

		-- Redo buttons, adjust visibility.
		this.buttons.dedicated.hidden = (not gE3Host)
		if(bFwd) then
			this.CurButton = ShowHideVerticalButtons(this.buttons,ifs_mp_main_e3_vbutton_layout)
		end
		SetCurButton(this.CurButton)

		if(bFwd) then -- if entering this screen from main menu, start network
			ScriptCB_OpenNet()
			if (ScriptCB_InNetGame()) then
--				print(" + InNetGame")
				if (ScriptCB_NetWasHost()) then
--					print(" + NetWasHost")
					if (ScriptCB_NetWasDedicated()) then
						ScriptCB_SetAmHost(1)
						ScriptCB_SetDedicated(1)
						ifs_mp_lobbyds.bAutoLaunch = 1
						ScriptCB_PushScreen("ifs_mp_lobbyds");
					else
						ScriptCB_SetAmHost(1)
						ScriptCB_SetDedicated(nil)
						ifs_mp_lobby.bAutoLaunch = 1
						print("Should autolaunch...")
						ScriptCB_PushScreen("ifs_mp_lobby");
					end
				else
					-- Act like the client selected quickmatch
					SetCurButton("fastclient")
					ifs_mp_lobby.bHideOnEntry = 1
					this:Input_Accept()
				end
			else -- wasn't InNetGame
				-- Hardwire some things on initially:
--				ScriptCB_AddProfile("Player")
--				ScriptCB_SetNetLoginName(ScriptCB_tounicode("Player"))

				--local Selection = ifs_login_listbox_contents[ifs_login_listbox_layout.SelectedIdx]
				local loginStr = ScriptCB_GetCurrentProfileName()
				
				if(loginStr) then
					ScriptCB_SetNetLoginName(loginStr)
				else
					ScriptCB_AddProfile("Player")
					ScriptCB_SetNetLoginName(ScriptCB_tounicode("Player"))
				end

				ifs_mp_lobby.bAutoLaunch = nil
				ifs_mp_lobbyds.bAutoLaunch = nil

				if(gE3Host) then
					-- Act like they selected dedicated host automagically
					SetCurButton("dedicated")
					this:Input_Accept()
				end
			end
		else
			-- not bFwd
			if(not gE3Host) then
				-- Act like the client selected quickmatch
				SetCurButton("fastclient")
				ifs_mp_lobby.bHideOnEntry = 1
				this:Input_Accept()
			end
		end -- bFwd is true.

		IFObj_fnSetVis(this.buttons, 1) -- always re-enable screen on entry (by default)

		ifs_missionselect.bForE3 = 1

		-- Also stop the movie (if going)
		ifelem_shellscreen_fnStartMovie("shell", 1)
--		ifelem_shellscreen_fnStopMovie()
	end,

	Exit = function(this, bFwd)
		Popup_LobbyOpts.bE3Mode = bFwd
		ifs_mp_lobby.bE3Mode = bFwd
		if(bFwd) then
			ifelem_shellscreen_fnStopMovie()
		else
			-- if leaving this screen towards the main menu, close network
			ScriptCB_CancelLogin()
			ScriptCB_CloseNet()
			-- And restart the movie
			ifelem_shellscreen_fnStartMovie("shell", 1)
			ifs_missionselect.bForE3 = nil
		end
	end,

	Input_Accept = function(this) 
    if(this.CurButton == "host") then
			ifs_mpe3_fnStartHosting(this, nil)
		elseif (this.CurButton == "dedicated") then
			ifs_mpe3_fnStartHostingDS(this, 1)
    elseif(this.CurButton == "fastclient") then
			ScriptCB_SetAmHost(nil)
			ScriptCB_SetHostLimit(100)
			ScriptCB_SetDedicated(nil)
			ScriptCB_BeginQuickmatch()
			IFObj_fnSetVis(this.buttons, nil)

			Popup_Busy.fnCheckDone = ifs_mp_main_quickmatch_fnCheckDone
			Popup_Busy.fnOnSuccess = ifs_mp_main_quickmatch_fnOnSuccess
			Popup_Busy.fnOnFail = ifs_mp_main_quickmatch_fnOnFail
			Popup_Busy.fnOnCancel = ifs_mp_main_quickmatch_fnOnCancel
			IFText_fnSetString(Popup_Busy.title,"ifs.subHardDrive.busy")
			Popup_Busy:fnActivate(1)
		end
	end,

	fnPostError = function(this,bUserHitYes,ErrorLevel,ErrorMessage)
		print("ifs_mp_main_e3 fnPostError(..,",bUserHitYes,ErrorLevel)
		if(ErrorLevel >= 6) then
			ScriptCB_PopScreen()
		end
	end,
}

ifs_mp_main_e3.CurButton = AddVerticalButtons(ifs_mp_main_e3.buttons,ifs_mp_main_e3_vbutton_layout)
AddIFScreen(ifs_mp_main_e3,"ifs_mp_main_e3")