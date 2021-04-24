-- Ingame pause menu

ifspausemenu_vbutton_layout = {
	ySpacing = 5,
	width = 260,
	font = "gamefont_medium",
	buttonlist = { 
		{ tag = "resume", string = "common.resume", },
		{ tag = "freecam", string = "game.pause.freecam", },
		{ tag = "lobby", string = "game.pause.playerlist", },
		{ tag = "opts", string = "ifs.main.options", },
		{ tag = "console", string = "Fake Console", },
		{ tag = "suicide", string = "game.pause.suicide", },
		{ tag = "friends", string = "ifs.onlinelobby.friendslist", },
		{ tag = "recent", string = "common.mp.recent", },
		{ tag = "restart", string = "common.restart", },
		{ tag = "quit", string = "common.quit", },
		{ tag = "exit", string = "common.quit2windows", },
	},
	title = "game.pause.title",
}

ifspausemenu_split_vbutton_layout = {
	ySpacing = 5,
	width = 220,
	font = "gamefont_small",
	buttonlist = { 
		{ tag = "resume", string = "common.resume", },
		{ tag = "freecam", string = "game.pause.freecam", },
		{ tag = "lobby", string = "game.pause.playerlist", },
		{ tag = "opts", string = "ifs.main.options", },
		{ tag = "console", string = "Fake Console", },
		{ tag = "suicide", string = "game.pause.suicide", },
		{ tag = "friends", string = "ifs.onlinelobby.friendslist", },
		{ tag = "restart", string = "common.restart", },
		{ tag = "quit", string = "common.quit", },
		{ tag = "exit", string = "common.quit2windows", },
	},
	title = "game.pause.title",
}

-- Turns pieces on/off as requested
function ifs_pausemenu_fnSetPieceVis(this, bVis)
--	print("ifs_pausemenu_fnSetPieceVis, before title. this = ", this)
	--IFObj_fnSetVis(this.title,bVis)
--	print("ifs_pausemenu_fnSetPieceVis, before buttons")
	IFObj_fnSetVis(this.buttons,bVis)
--	print("ifs_pausemenu_fnSetPieceVis done")
end

-- Sets text for the camera entry to the right settings
function ifs_pausemenu_fnUpdateFreecamText(this)
	if(this.buttons.freecam) then
		if(this.bChaseCam) then
			RoundIFButtonLabel_fnSetString(this.buttons.freecam,"game.pause.followcam")
		else
			RoundIFButtonLabel_fnSetString(this.buttons.freecam,"game.pause.freecam")
		end
	end
end

-- Callback for when the "really quit?" popup is over.  If bResult is
-- true, user wanted to quit
function ifs_pausemenu_fnQuitPopupDone(bResult)
	local this = ifs_pausemenu

	if(bResult) then
		ifelm_shellscreen_fnPlaySound(this.acceptSound)
		ScriptCB_QuitToShell()
	else
		ifelm_shellscreen_fnPlaySound(this.cancelSound)
		ifs_pausemenu_fnSetPieceVis(this, 1)	
	end
	Popup_YesNo.fnDone = nil
end

function ifs_pausemenu2_fnQuitPopupDone(bResult)
	local this = ifs_pausemenu2

	if(bResult) then
		ifelm_shellscreen_fnPlaySound(this.acceptSound)
		ScriptCB_QuitToShell()
	else
		ifelm_shellscreen_fnPlaySound(this.cancelSound)
		ifs_pausemenu_fnSetPieceVis(this,1) -- restore screen on 'no' only
	end
	Popup_YesNo.fnDone = nil
end

-- Callback for when the "really quit?" popup is over.  If bResult is
-- true, user wanted to quit
function ifs_pausemenu_fnExitPopupDone(bResult)
	local this = ifs_pausemenu

	if(bResult) then
		ifelm_shellscreen_fnPlaySound(this.acceptSound)
		ScriptCB_QuitToWindows()
	else
		ifelm_shellscreen_fnPlaySound(this.cancelSound)
		ifs_pausemenu_fnSetPieceVis(this,1) -- restore screen on 'no' only
	end
	Popup_YesNo.fnDone = nil
end

-- Callback for when the "really quit?" popup is over.  If bResult is
-- true, user wanted to quit
function ifs_pausemenu_fnSuicidePopupDone(bResult)
	local this = ifs_pausemenu
	ifs_pausemenu_fnSetPieceVis(this,1) -- always restore screen

	if(bResult) then
		ifelm_shellscreen_fnPlaySound(this.acceptSound)
		ScriptCB_PlayerSuicide(0) -- top player
		ScriptCB_Unpause()
	else
		ifelm_shellscreen_fnPlaySound(this.cancelSound)
	end

	Popup_YesNo.fnDone = nil
end

-- Callback for when the "really quit?" popup is over.  If bResult is
-- true, user wanted to quit
function ifs_pausemenu2_fnSuicidePopupDone(bResult)
	local this = ifs_pausemenu2
	ifs_pausemenu_fnSetPieceVis(this,1) -- always restore screen

	if(bResult) then
		ifelm_shellscreen_fnPlaySound(this.acceptSound)
		ScriptCB_PlayerSuicide(1) -- bottom player
		ScriptCB_Unpause()
	else
		ifelm_shellscreen_fnPlaySound(this.cancelSound)
	end

	Popup_YesNo.fnDone = nil
end

-- Callback for when the "really restart?" popup is over.  If bResult is
-- true, user wanted to restart
function ifs_pausemenu_fnRestartPopupDone(bResult)
	local this = ifs_pausemenu

	if(bResult) then
		ifelm_shellscreen_fnPlaySound(this.acceptSound)
		ScriptCB_RestartMission()
	else
		ifelm_shellscreen_fnPlaySound(this.cancelSound)
		ifs_pausemenu_fnSetPieceVis(this,1) -- restore screen on 'no' only
	end

	Popup_YesNo.fnDone = nil
end

function ifs_pausemenu2_fnRestartPopupDone(bResult)
	local this = ifs_pausemenu2

	if(bResult) then
		ifelm_shellscreen_fnPlaySound(this.acceptSound)
		ScriptCB_RestartMission()
	else
		ifelm_shellscreen_fnPlaySound(this.cancelSound)
		ifs_pausemenu_fnSetPieceVis(this,1) -- restore screen on 'no' only
	end

	Popup_YesNo.fnDone = nil
end

ifs_pausemenu = NewIFShellScreen {
	nologo = 1,
	movieIntro      = nil, -- played before the screen is displayed
	movieBackground = nil, -- played while the screen is displayed
	bFriendsIcon = 1,

--	title = NewIFText {
--		string = "game.pause.title",
--		font = "gamefont_large",
--		textw = 460,
--		y = 10,
--		ScreenRelativeX = 0.5, -- center
--		ScreenRelativeY = 0, -- top
--	},

	buttons = NewIFContainer {
		ScreenRelativeX = 0.6, -- center
		ScreenRelativeY = 0.5, -- center
		y = 20, -- a little down from center
		rotY = 25,
	},

	Enter = function(this, bFwd)
		gIFShellScreenTemplate_fnEnter(this, bFwd)
		
		-- if we're returning from the below, bail right back to the game
		if((not bFwd) and this.PopAfterPlayerList) then
			this.PopAfterPlayerList = nil
			ScriptCB_ResetSkipToPlayerList()
			ScriptCB_Unpause()
			return
		end
		-- if we're in a net game and the user hits 'tab', jump right to the player list
		if(bFwd and ScriptCB_SkipToPlayerList() and ScriptCB_InNetGame()) then
			this.PopAfterPlayerList = 1
			ifs_movietrans_PushScreen(ifs_mp_lobby)
			return
		end
		this.PopAfterPlayerList = nil
		ScriptCB_ResetSkipToPlayerList()

		ifs_pausemenu_fnUpdateFreecamText(this)
		if((this.CurButton) and (this.buttons[this.CurButton])) then
			IFButton_fnSelect(this.buttons[this.CurButton],nil) -- Deactivate old button
		end

		-- Refresh which buttons are shown
		this.buttons.lobby.hidden = gDemoBuild or (not ScriptCB_InNetGame())
		
		if(ScriptCB_AreMetagameRulesOn()) then
			this.buttons.restart.hidden = 1
		else
			this.buttons.restart.hidden = ScriptCB_InNetGame()
		end

		this.buttons.exit.hidden = (gPlatformStr ~= "PC" or ScriptCB_InNetGame()) 
		this.buttons.freecam.hidden = gDemoBuild or gFinalBuild

		local bShowFriends = ((gPlatformStr == "XBox") and (ScriptCB_XL_IsLoggedIn(1))) -- only visible if successfully signed in

		this.buttons.friends.hidden = not bShowFriends
		if(this.buttons.recent) then
			this.buttons.recent.hidden = not ((ScriptCB_InNetGame()) and (gOnlineServiceStr == "XLive"))
		end
		this.buttons.console.hidden = gDemoBuild or gFinalBuild

		if(ScriptCB_IsDedicated()) then
			this.buttons.freecam.hidden = 1
--			this.buttons.lobby.hidden = 1 -- Disabled NM 7/22/04 - I think we need to show this
			this.buttons.opts.hidden = 1
			this.buttons.suicide.hidden = 1
			this.CurButton = ShowHideVerticalButtons(this.buttons,ifspausemenu_vbutton_layout)
		elseif(not ScriptCB_IsSplitscreen()) then
			this.CurButton = ShowHideVerticalButtons(this.buttons,ifspausemenu_vbutton_layout)
		else
			this.buttons.lobby.hidden    = 1
			this.buttons.exit.hidden     = 1
			this.CurButton = ShowHideVerticalButtons(this.buttons,ifspausemenu_split_vbutton_layout)
		end

		if (bFwd) then
			ifelm_shellscreen_fnPlaySound(this.acceptSound)
		end

		SetCurButton(this.CurButton)

		-- Move friends icon if appropriate
		if(bShowFriends) then
			local XPos = ScriptCB_IFText_GetTextExtent(this.buttons.friends.label.cpointer) + 30
			local YPos = this.buttons.friends.y - 15
			IFObj_fnSetPos(this.buttons.FriendIcon,XPos,YPos)
		else
			IFObj_fnSetVis(this.buttons.FriendIcon, nil) -- just hide it.
		end
	end,

	Input_Accept = function(this) 
		-- If base class handled this work, then we're done
		if(gShellScreen_fnDefaultInputAccept(this)) then
			return
		end

		ifelm_shellscreen_fnPlaySound(this.acceptSound)

		if(this.CurButton == "resume") then
			ScriptCB_Unpause()
		elseif ((this.CurButton == "quit") and (not Popup_YesNo.fnDone)) then
			-- this hack
			ScriptCB_SetQuitPlayer(1)
			
			Popup_YesNo.CurButton = "no" -- default
			Popup_YesNo.fnDone = ifs_pausemenu_fnQuitPopupDone
			if(ScriptCB_GetAmHost()) then
				if (ScriptCB_AreMetagameRulesOn()) then
					IFText_fnSetString(Popup_YesNo.title,"ifs.pause.warn_quit_meta")
				else				
					IFText_fnSetString(Popup_YesNo.title,"ifs.pause.warn_host_quit")
				end					
			elseif (ScriptCB_AreMetagameRulesOn()) then
				IFText_fnSetString(Popup_YesNo.title,"ifs.pause.warn_quit_meta")
			else
				IFText_fnSetString(Popup_YesNo.title,"ifs.pause.warn_quit")
			end
			ifs_pausemenu_fnSetPieceVis(this, nil)
			Popup_YesNo:fnActivate(1)
		elseif (this.CurButton == "freecam") then
			this.bChaseCam = not this.bChaseCam
			ScriptCB_Freecamera()
			ifs_pausemenu_fnUpdateFreecamText(this)
		elseif (this.CurButton == "exit") then
			Popup_YesNo.CurButton = "no" -- default
			Popup_YesNo.fnDone = ifs_pausemenu_fnExitPopupDone
			IFText_fnSetString(Popup_YesNo.title,"ifs.main.askquit")
			ifs_pausemenu_fnSetPieceVis(this, nil)
			Popup_YesNo:fnActivate(1)
		elseif (this.CurButton == "lobby") then
			ifs_movietrans_PushScreen(ifs_mp_lobby)
		elseif (this.CurButton == "opts") then
			ifs_movietrans_PushScreen(ifs_opt_contmain)
		elseif (this.CurButton == "friends") then
			if(gPlatformStr == "XBox") then
				ifs_mpxl_friends.bRecentMode = nil
				ifs_movietrans_PushScreen(ifs_mpxl_friends)
			end
		elseif (this.CurButton == "recent") then
			ifelm_shellscreen_fnPlaySound("shell_menu_accept")    
			ifs_mpxl_friends.bRecentMode = 1
			ifs_movietrans_PushScreen(ifs_mpxl_friends)
		elseif (this.CurButton == "stats") then
			ifs_movietrans_PushScreen(ifs_teamstats)
		elseif (this.CurButton == "console") then
			ifs_movietrans_PushScreen(ifs_fakeconsole)
		elseif ((this.CurButton == "restart") and (not Popup_YesNo.fnDone)) then
			Popup_YesNo.CurButton = "no" -- default
			Popup_YesNo.fnDone = ifs_pausemenu_fnRestartPopupDone
			IFText_fnSetString(Popup_YesNo.title,"ifs.pause.warn_restart")
			ifs_pausemenu_fnSetPieceVis(this, nil)
			Popup_YesNo:fnActivate(1)
		elseif ((this.CurButton == "suicide")  and (not Popup_YesNo.fnDone)) then
			Popup_YesNo.CurButton = "no" -- default
			Popup_YesNo.fnDone = ifs_pausemenu_fnSuicidePopupDone
			IFText_fnSetString(Popup_YesNo.title,"game.pause.suicide_prompt")
			ifs_pausemenu_fnSetPieceVis(this, nil)
			Popup_YesNo:fnActivate(1)
		end
	end,

	-- Override default behavior
	Input_Back = function(this)
		ifelm_shellscreen_fnPlaySound(this.exitSound)
		ScriptCB_Unpause()
	end,
}

ifs_pausemenu2 = NewIFShellScreen2 {
	nologo = 1,
	bFriendsIcon = 1,

--	title = NewIFText {
--		string = "game.pause.title",
--		font = "gamefont_medium",
--		textw = 460,
--		y = 0,
--		ScreenRelativeX = 0.5, -- center
--		ScreenRelativeY = 0, -- top
--	},

	buttons = NewIFContainer {
		ScreenRelativeX = 0.6, -- center
		ScreenRelativeY = 0.5, -- center
		y = 20, -- a little down from center
		rotY = 25,
	},

	Enter = function(this, bFwd)
		gIFShellScreenTemplate_fnEnter(this, bFwd)
		
		IFButton_fnSelect(this.buttons[this.CurButton],nil) -- Deactivate old button
		
		local bShowFriends = ((gPlatformStr == "XBox") and (ScriptCB_XL_IsLoggedIn(1))) -- only visible if successfully signed in

		this.buttons.freecam.hidden  = 1
		this.buttons.lobby.hidden    = 1
		this.buttons.friends.hidden = not bShowFriends
		this.buttons.console.hidden  = 1
		this.buttons.lobby.hidden	 = 1
		this.buttons.restart.hidden  = ScriptCB_AreMetagameRulesOn()
		this.buttons.exit.hidden	 = 1
		this.CurButton = ShowHideVerticalButtons(this.buttons,ifspausemenu_split_vbutton_layout)
		local EntryHilight = gCurHiliteButton
		SetCurButton(this.CurButton)
		gCurHiliteButton2 = gCurHiliteButton
		gCurHiliteButton = EntryHilight

		if (bFwd) then
			ifelm_shellscreen_fnPlaySound(this.acceptSound)
		end

		-- Move friends icon if appropriate
		if(bShowFriends) then
			local XPos = ScriptCB_IFText_GetTextExtent(this.buttons.friends.label.cpointer) + 30
			local YPos = this.buttons.friends.y - 15
			IFObj_fnSetPos(this.buttons.FriendIcon,XPos,YPos)
		else
			IFObj_fnSetVis(this.buttons.FriendIcon, nil) -- just hide it.
		end

	end,

	Input_Accept = function(this)
		-- If base class handled this work, then we're done
		if(gShellScreen_fnDefaultInputAccept(this)) then
			return
		end

		ifelm_shellscreen_fnPlaySound(this.acceptSound)

		if(this.CurButton == "resume") then
			ScriptCB_Unpause(1)
		elseif ((this.CurButton == "quit") and (not Popup_YesNo.fnDone)) then
			-- this hack
			ScriptCB_SetQuitPlayer(2)
			
			Popup_YesNo.CurButton = "no" -- default
			Popup_YesNo.fnDone = ifs_pausemenu2_fnQuitPopupDone
			if(ScriptCB_AreMetagameRulesOn()) then
				IFText_fnSetString(Popup_YesNo.title,"ifs.pause.warn_quit_meta")
			else
				IFText_fnSetString(Popup_YesNo.title,"ifs.pause.warn_quit")
			end
			ifs_pausemenu_fnSetPieceVis(this, nil)
			Popup_YesNo:fnActivate(1)
		elseif (this.CurButton == "exit") then
			ScriptCB_QuitToWindows()
		elseif (this.CurButton == "friends") then
			if(gPlatformStr == "XBox") then
				ifs_mpxl_friends.bRecentMode = nil
				ifs_movietrans_PushScreen(ifs_mpxl_friends)
			end
		elseif (this.CurButton == "freecam") then
			this.bChaseCam = not this.bChaseCam
			ScriptCB_Freecamera()
			ifs_pausemenu_fnUpdateFreecamText(this)
		elseif (this.CurButton == "lobby") then
			ifs_movietrans_PushScreen(ifs_pause_lobby)
		elseif (this.CurButton == "opts") then
			ifs_movietrans_PushScreen(ifs_opt_contmain)
		elseif ((this.CurButton == "restart")  and (not Popup_YesNo.fnDone)) then
			Popup_YesNo.CurButton = "no" -- default
			Popup_YesNo.fnDone = ifs_pausemenu2_fnRestartPopupDone
			IFText_fnSetString(Popup_YesNo.title,"ifs.pause.warn_restart")
			ifs_pausemenu_fnSetPieceVis(this, nil)
			Popup_YesNo:fnActivate(1)
		elseif ((this.CurButton == "suicide")  and (not Popup_YesNo.fnDone)) then
			Popup_YesNo.CurButton = "no" -- default
			Popup_YesNo.fnDone = ifs_pausemenu2_fnSuicidePopupDone
			IFText_fnSetString(Popup_YesNo.title,"game.pause.suicide_prompt")
			ifs_pausemenu_fnSetPieceVis(this, nil)
			Popup_YesNo:fnActivate(1)
		end
	end,

	-- Override default behavior
	Input_Back = function(this)
		ifelm_shellscreen_fnPlaySound(this.exitSound)
		ScriptCB_Unpause(1)
	end,
}

if(not ScriptCB_IsSplitscreen()) then
	ifs_pausemenu.CurButton = AddVerticalButtons(ifs_pausemenu.buttons,ifspausemenu_vbutton_layout)
	AddIFScreen(ifs_pausemenu,"ifs_pausemenu", 1)

	ifs_pausemenu2 = nil -- flush from memory
else
	-- is splitscreen. Rearrange things
--	ifs_pausemenu.title.y = 0
--	ifs_pausemenu.title.font = "gamefont_medium"

	ifs_pausemenu.CurButton = AddVerticalButtons(ifs_pausemenu.buttons,ifspausemenu_split_vbutton_layout)
	ifs_pausemenu.Viewport = 0
	AddIFScreen(ifs_pausemenu,"ifs_pausemenu")

	ifs_pausemenu2.CurButton = AddVerticalButtons(ifs_pausemenu2.buttons,ifspausemenu_split_vbutton_layout)
	ifs_pausemenu2.Viewport = 1
	AddIFScreen(ifs_pausemenu2,"ifs_pausemenu2")
end
