--
-- -------------------------------------------------------------------
--

-- 'Lobby popups for  picked a player' popup

LobbyOpts_layout = {
-- 	yTop = -25, -- auto-calc'd now.
	yHeight = 30,
	ySpacing  = 5,
	width = 300,
	font = "gamefont_small",
	buttonlist = { 
		-- Options for the session as a whole
--		{ tag = "launch", string = "common.mp.launch", },
--		{ tag = "friends", string = "ifs.onlinelobby.friendslist", },
--		{ tag = "recent", string = "ifs.onlinelobby.recentlist", },
--		{ tag = "options", string = "ifs.onlinelobby.gameoptions", },
--		{ tag = "leave", string = "ifs.onlinelobby.leave", },
--		{ tag = "lock", string = "ifs.onlinelobby.locksession", },

		-- Options for just the selected player (which must have bOnlyForPlayer =
		-- 1 in them)
		{ bOnlyForPlayer = 1, tag = "mute", string = "ifs.onlinelobby.unmuted", },
		{ bOnlyForPlayer = 1, tag = "friend", string = "ifs.onlinelobby.addfriend", },
		{ bOnlyForPlayer = 1, tag = "delfriend", string = "ifs.xfriendslist.remove", },
		{ bOnlyForPlayer = 1, tag = "feedback", string = "ifs.onlinelobby.sendfeedback", },
		{ bOnlyForPlayer = 1, tag = "team", string = "ifs.onlinelobby.changeteam", },
		{ bOnlyForPlayer = 1, tag = "boot", string = "ifs.onlinelobby.boot", },

		{ tag = "back", string = "common.back", },
		{ bOnlyForPlayer = 1, tag = "back2", string = "common.back", }, -- Cannot have 2 buttons w/ same tag. NM 4/27/04
	},
	flashy = 0,
}

-- Does any work to activate this
function gPopup_LobbyOpts_fnActivate(this,vis)
--	ifs_meta_main:fnActivateInfoWindow(not vis)
	this:fnDefaultActivate(vis)

	this.bIsActivated = vis

	local A1,A2

	if(vis) then
		A1,A2 = 1.0,0.0
		ScriptCB_BeginFriends()

		-- Turn buttons on/off as appropriate.
		-- First step: turn on/off items based on Player/Global mode. Will
		-- adjust individual ones below.
		local NumButtons = getn(LobbyOpts_layout.buttonlist)
		local i
		for i = 1,NumButtons do
			local Tag = LobbyOpts_layout.buttonlist[i].tag
			this.buttons[Tag].hidden = LobbyOpts_layout.buttonlist[i].bOnlyForPlayer ~= this.bOnlyForPlayer
		end

		-- Now, adjust buttons present only for the per-player menu
		if(this.bOnlyForPlayer) then

			if(ScriptCB_GetAmHost()) then
				this.buttons.boot.hidden = this.bIsMe -- can't kick self
				--this.buttons.team.hidden = nil
			else
				-- Not host. Set client options
				this.buttons.boot.hidden = ScriptCB_IsInShell()
								
				--this.buttons.boot.hidden = not this.bIsMe -- can only adjust for self
				this.buttons.boot.string = "ifs.onlinelobby.vote"
				
				if( this.bIsMe ) then
					this.buttons.boot.hidden = 1  -- can't kick self
				end

				-- won't boot if players are different team
				if( not Popup_LobbyOpts.bIsSameTeam ) then
					this.buttons.boot.hidden = 1  -- can't kick other team
				end				
			end
			
			-- can you boot this person?
			if(not this.bCanBoot) then
				this.buttons.boot.hidden = 1
			end

			-- temp allow boot self.
			-- this.buttons.boot.hidden = nil
			
			
			-- boot was moved onto the main screen.  leave all the logic
			-- here though since they're going to change their minds.
			this.buttons.boot.hidden = 1
			--
			--

			
			-- can only adjust for self
			this.buttons.team.hidden = not this.bIsMe
			if(ScriptCB_GetAutoAssignTeams()) then
				this.buttons.team.hidden = 1
			end

			-- Giz wants team selection hidden 100% of the time - NM 7/5/04
			-- Don't undo this without looking at bug 6094
			this.buttons.team.hidden = 1
				
			this.buttons.mute.hidden = (gPlatformStr ~= "XBox") or this.bIsMe -- Can't mute yourself

			-- Add to Friends, Feedback available for non-me in XLive
			-- [If already a friend, separate option is available]
			this.buttons.friend.hidden = (gOnlineServiceStr ~= "XLive") or this.bIsMe or this.bIsFriend
			this.buttons.delfriend.hidden = (gOnlineServiceStr ~= "XLive") or this.bIsMe or (not this.bIsFriend)

			-- Not quite the same as a friend.
			this.buttons.feedback.hidden = (not (gOnlineServiceStr == "XLive")) or this.bIsMe

			-- Adjust mute text depending on setting
			if(this.bIsMuted) then
				RoundIFButtonLabel_fnSetString(this.buttons.mute,"ifs.onlinelobby.delmute")
			else
				RoundIFButtonLabel_fnSetString(this.buttons.mute,"ifs.onlinelobby.addmute")
			end
		else
			-- Must be in the session options. Adjust buttons as needed
			this.buttons.launch.hidden = (not ScriptCB_GetShellActive()) or 
				((not ScriptCB_GetAmHost()) and (not ScriptCB_HasServerLaunched()))
			this.buttons.lock.hidden = (not ScriptCB_GetShellActive()) or (not ScriptCB_GetAmHost())

			this.buttons.friends.hidden = (gOnlineServiceStr ~= "XLive") or gE3Build
--			this.buttons.recent.hidden = (gOnlineServiceStr ~= "XLive") or gE3Build

			if(this.bE3Mode) then
				this.buttons.lock.hidden = 1
				this.buttons.options.hidden = 1
			end

		end

		-- Now, clear hilighting of buttons to default, count how many are visible
		local tag
		local VisCount = 0
		for i = 1,NumButtons do
			IFButton_fnSelect(this.buttons[LobbyOpts_layout.buttonlist[i].tag], nil)
			if(not this.buttons[LobbyOpts_layout.buttonlist[i].tag].hidden) then
				VisCount = VisCount + 1
			end
		end

		local HeightPer = (LobbyOpts_layout.yHeight + LobbyOpts_layout.ySpacing)
		local TotalHeight = (HeightPer * VisCount) + 90

		gButtonWindow_fnSetSize(this,this.width,TotalHeight)

		LobbyOpts_layout.yTop = (this.height * 0.5) - (HeightPer * VisCount) -- bottom aligned

		this.CurButton = ShowHideVerticalButtons(this.buttons,LobbyOpts_layout)
		SetCurButton(this.CurButton)
		IFObj_fnSetPos(this.title,this.title.x,(TotalHeight * -0.5) + 15)


		-- Move friends icon if appropriate
		if((gOnlineServiceStr == "XLive") and (not this.bOnlyForPlayer)) then
			local XPos = (ScriptCB_IFText_GetTextExtent(this.buttons.friends.label.cpointer) * 0.5) + 20
			local YPos = this.buttons.friends.y - 12
			IFObj_fnSetPos(this.buttons.FriendIcon,XPos,YPos)
			IFObj_fnSetVis(this.buttons.FriendIcon, 1) -- visible
		else
			IFObj_fnSetVis(this.buttons.FriendIcon, nil) -- just hide it.
		end

		if(ifs_mp_lobby.Helptext_Accept) then
			IFText_fnSetString(ifs_mp_lobby.Helptext_Accept.helpstr,"common.accept")
			gIFShellScreenTemplate_fnMoveIcon(ifs_mp_lobby.Helptext_Accept)
		end
	else
		-- vis = false. Back to the original mode
		ScriptCB_CancelFriends()
		A1,A2 = 0.0,1.0
		if(ifs_mp_lobby.Helptext_Accept) then
			IFText_fnSetString(ifs_mp_lobby.Helptext_Accept.helpstr,"ifs.onlinelobby.playeropts")
			gIFShellScreenTemplate_fnMoveIcon(ifs_mp_lobby.Helptext_Accept)
		end
	end

	-- Animation on the "Session Options" vs "Accept" text
	local fAnimTime = 0.25


--	AnimationMgr_AddAnimation(ifs_mp_lobby.Helptext_Misc2, { fTotalTime = fAnimTime, fStartAlpha = A1, fEndAlpha = A2,})
	AnimationMgr_AddAnimation(ifs_mp_lobby.Helptext_Misc, { fTotalTime = fAnimTime, fStartAlpha = A1, fEndAlpha = A2,})

end

-- Handle the user hitting accept (back uses defaults). Close this popup,
-- let main gameplay decide what to do next.
function gPopup_LobbyOpts_fnInput_Accept(this)
	-- Cancel it before we do anything else
	this:fnActivate(nil)

	if (this.CurButton == "back" or this.CurButton == "back2") then
		ifelm_shellscreen_fnPlaySound("shell_menu_exit")
	end

	if((this.CurButton ~= "back") and (this.CurButton ~= "back2")) then
		local Selection = ifs_mp_lobby_listbox_contents[lobby_listbox_layout.SelectedIdx]
		
		if(this.CurButton == "launch") then
			ifelm_shellscreen_fnPlaySound("shell_menu_accept")
			ScriptCB_LaunchLobby()
		elseif (this.CurButton == "friends") then
			if(gOnlineServiceStr == "XLive") then 
				ifelm_shellscreen_fnPlaySound("shell_menu_accept")
				ifs_mpxl_friends.bRecentMode = nil
				ifs_movietrans_PushScreen(ifs_mpxl_friends)
			end
		elseif (this.CurButton == "recent") then
			ifelm_shellscreen_fnPlaySound("shell_menu_accept")    
			ifs_mpxl_friends.bRecentMode = 1
			ifs_movietrans_PushScreen(ifs_mpxl_friends)
		elseif (this.CurButton == "options") then
			ifelm_shellscreen_fnPlaySound("shell_menu_accept")
			ifs_movietrans_PushScreen(ifs_opt_mp)
		elseif (this.CurButton == "feedback") then
			ifelm_shellscreen_fnPlaySound("shell_menu_accept")
			ifs_mpxl_feedback.TargetName = Selection.namestr
			ifs_mpxl_feedback.bVoicemailOnly = nil
			ifs_movietrans_PushScreen(ifs_mpxl_feedback)
		else
			ifelm_shellscreen_fnPlaySound("shell_select_change")
			ScriptCB_LobbyAction(Selection.namestr,this.CurButton)
		end
	end

	-- finished callback function	
	if(this.fnDone) then
		this.fnDone()
		fnDone = nil;
	end
end

function Popup_LobbyOpts_fnUpdate(this,fDt)
	-- Call base class
	gIFShellScreenTemplate_fnUpdate(this,fDt)
end

Popup_LobbyOpts = NewPopup {
	ScreenRelativeX = 0.5, -- centered onscreen
	ScreenRelativeY = 0.4,
	height = 240,
	width = 330,
	ZPos = 50,

	title = NewIFText {
		string = "ifs.onlinelobby.options",
		font = "gamefont_medium",
		textw = 160,
		texth = 80,
		y = -110,
		inert = 1,
		nocreatebackground = 1,
	},

	buttons = NewIFContainer {
	},

	fnActivate = gPopup_LobbyOpts_fnActivate,
	Input_Accept = gPopup_LobbyOpts_fnInput_Accept,
    
	Input_Back = function(this)
		ifelm_shellscreen_fnPlaySound("shell_menu_exit")
		gPopup_fnInput_Back(this)
	end,
    
	Update = Popup_LobbyOpts_fnUpdate,
}

-- Helper function, makes items
function Popup_LobbyOpts_fnBuildPopup(this)
	this.title.textw = this.width - 32
	this.title.x = this.title.textw * -0.5
	this.title.y = (this.height * -0.5) + 16
	gButtonWindow_fnSetTexture(this,"opaque_rect")
	
	LobbyOpts_layout.yTop = (this.height * 0.5) - 
		((LobbyOpts_layout.yHeight + LobbyOpts_layout.ySpacing) * getn(LobbyOpts_layout.buttonlist))

	AddVerticalButtons(this.buttons,LobbyOpts_layout)

	local IconSize = 32
	this.buttons.FriendIcon = NewIFImage { 
		texture = "lobby_icons", 
		localpos_l = 0, localpos_t = 0, 
		localpos_b = IconSize, localpos_r = IconSize,
		bInertPos = 1,
		ZPos = 10, -- on top of almost everything
	}
	this.nextFriendIconUpdate = 0 -- update ASAP on entry
end

Popup_LobbyOpts_fnBuildPopup(Popup_LobbyOpts)
Popup_LobbyOpts_fnBuildPopup = nil -- dump out of memory
CreatePopupInC(Popup_LobbyOpts,"Popup_LobbyOpts")

