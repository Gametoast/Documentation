-- Gamespy list of friends

-- Helper function. Given a layout (x,y,width, height), returns a
-- fully-built item.
function GSFriends_Listbox_CreateItem(layout)
	-- Make a coordinate system pegged to the top-left of where the cursor would go.
	local Temp = NewIFContainer { x = layout.x - 0.5 * layout.width, y=layout.y - 10}
--	Temp.indexfield = NewIFText{ x = 10, y = 0, halign = "left", font = "gamefont_medium", nocreatebackground=1,}
	Temp.namefield = NewIFText{ x = 56, y = 0, textw = 220, halign = "left", font = "gamefont_medium", nocreatebackground=1,}

	local IconSize = 0.9 * layout.height

	Temp.StateIcon = NewIFImage{ x = 15, y = 6, texture = "lobby_icons", 
		localpos_l = 0, localpos_t = 0, 
		localpos_b = IconSize, localpos_r = IconSize,
	} -- y-pos is to get it centered in bar

	Temp.VoiceIcon = NewIFImage{ 
		x = layout.width - 25 - IconSize, y = 6,
		texture = "lobby_icons", 
		localpos_l = 0, localpos_t = 0, 
		localpos_b = IconSize, localpos_r = IconSize,
	} -- y-pos is to get it centered in bar

	return Temp
end

-- Helper function. For a destination item (previously created w/
-- CreateItem), fills it in with data, which may be nil (==blank it)
function GSFriends_Listbox_PopulateItem(Dest,Data)
	-- If we need to zap the glyphcache, do so.
	if(gBlankListbox) then
		IFText_fnSetString(Dest.namefield,"")

	elseif (Data) then
		-- Have data. Apply it.
		IFText_fnSetString(Dest.namefield,Data.name)
	end

	-- Show entry if Data != nil
	IFObj_fnSetVis(Dest,Data)
end

gsfriends_listbox_layout = {
	showcount = 6,
--	yTop = -130 + 13,  -- auto-calc'd now
	yHeight = 26,
	ySpacing  = 0,
--	width = 260,
	x = 0,
	slider = 1,
	CreateFn = GSFriends_Listbox_CreateItem,
	PopulateFn = GSFriends_Listbox_PopulateItem,
}

gsfriends_listbox_contents = {
	-- Filled in from C++ now. NM 8/7/03
	-- Stubbed to show the format it wants.
--	{ indexstr = "1", namestr = "Alpha"},
--	{ indexstr = "2", namestr = "Bravo"},
}

gsfriends_vbutton_layout = {
	yTop = 10,
	yHeight = 30,
	ySpacing = 0,
	width = 480,
	font = "gamefont_medium",
	buttonlist = {
-- 		{ tag = "INVITE", string = "ifs.xfriendslist.invite" },
-- 		{ tag = "UNINVITE", string = "ifs.xfriendslist.uninvite" },
-- 		{ tag = "ADD", string = "ifs.onlinelobby.addfriend" },
-- 		{ tag = "JOIN", string = "ifs.xfriendslist.joingame" },
-- 		{ tag = "ACCEPT", string = "ifs.xfriendslist.accept" },
-- 		{ tag = "DECLINE", string = "ifs.xfriendslist.decline" },
-- 		{ tag = "NEVER", string = "ifs.xfriendslist.never" },
-- 		{ tag = "YESINVITE", string = "ifs.xfriendslist.yesinvite" },
-- 		{ tag = "NOINVITE", string = "ifs.xfriendslist.noinvite" },
-- 		{ tag = "FEEDBACK", string = "ifs.xfriendslist.feedback" },
		{ tag = "REMOVE", string = "ifs.xfriendslist.remove" },
		{ tag = "BACK", string = "common.back" },
	},
	nocreatebackground=1,
}

-- Callbacks from the busy popup

-- Returns -1, 0, or 1, depending on error, busy, or success
function ifs_mpgs_joinpopup_fnCheckDone()
--	local this = ifs_mpgs_friends
	ScriptCB_UpdateQuickmatch() -- think...
		
	return ScriptCB_IsQuickmatchDone()
end

function ifs_mpgs_joinpopup_fnOnSuccess()
	local this = ifs_mpgs_friends

	local fAnimTime = 0.2
	AnimationMgr_AddAnimation(this.infobox,
														{ fTotalTime = fAnimTime, fStartAlpha = 0, fEndAlpha = 1,})

	Popup_Busy:fnActivate(nil)
	ScriptCB_LaunchQuickmatch()
    ifs_movietrans_PushScreen(ifs_mp_lobby)
end

function ifs_mpgs_joinpopup_fnOnFail()
	print("Join failed")

	Popup_Busy:fnActivate(nil)
	Popup_YesNo.CurButton = "no" -- default
	Popup_YesNo.fnDone = ifs_xlive_main_fnAskCreateDone
	IFText_fnSetString(Popup_YesNo.title,"ifs.quickopti.nonefound")

	local this = ifs_mpgs_friends
	ifs_mpgs_friends_fnShowListbox(this,1,nil) -- back to listbox
	local fAnimTime = 0.2
	AnimationMgr_AddAnimation(this.infobox,
														{ fTotalTime = fAnimTime, fStartAlpha = 0, fEndAlpha = 1,})

	Popup_YesNo:fnActivate(1)

	-- If we were in a session, gotta rearrange screen stack.
	if(this.bWasInSession) then
		ScriptCB_PopScreen("ifs_mp_main") -- back to here
        ifs_movietrans_PushScreen(ifs_mpgs_friends)
		this.bWasInSession = nil
	end
end

-- User hit cancel. Do what they want.
function ifs_mpgs_joinpopup_fnOnCancel()
	local this = ifs_mpgs_friends

	-- Stop logging in.
	ScriptCB_CancelQuickmatch()

	-- Get rid of popup, turn this screen back on
	Popup_Busy:fnActivate(nil)
	IFObj_fnSetVis(this.buttons, 1)

	ifs_mpgs_friends_fnShowListbox(this,nil)
	local fAnimTime = 0.2
	AnimationMgr_AddAnimation(this.infobox,
														{ fTotalTime = fAnimTime, fStartAlpha = 0, fEndAlpha = 1,})
	AnimationMgr_AddAnimation(this.listbox,
														{ fTotalTime = fAnimTime, fStartAlpha = 0, fEndAlpha = 0,})

	-- If we were in a session, gotta rearrange screen stack.
	if(this.bWasInSession) then
		ScriptCB_PopScreen("ifs_mp_main") -- back to here
        ifs_movietrans_PushScreen(ifs_mpgs_friends)
		this.bWasInSession = nil
	end

end

-- (Optional) prompting is done, join is committed. Start it.
function ifs_mpgs_fnStartJoin(this)
	ScriptCB_SetAmHost(nil)
	ScriptCB_SetHostLimit(100)
	ScriptCB_SetDedicated(nil)
	ScriptCB_DoFriendAction(this.CurButton,this.bRecentMode)

	local fAnimTime = 0.2
	AnimationMgr_AddAnimation(this.buttons,
														{ fTotalTime = fAnimTime, fStartAlpha = 1, fEndAlpha = 0,})
	AnimationMgr_AddAnimation(this.infobox,
														{ fTotalTime = fAnimTime, fStartAlpha = 1, fEndAlpha = 0,})
	this.bShowListbox = 1

	Popup_Busy.fnCheckDone = ifs_mpgs_joinpopup_fnCheckDone
	Popup_Busy.fnOnSuccess = ifs_mpgs_joinpopup_fnOnSuccess
	Popup_Busy.fnOnFail = ifs_mpgs_joinpopup_fnOnFail
	Popup_Busy.fnOnCancel = ifs_mpgs_joinpopup_fnOnCancel
	IFText_fnSetString(Popup_Busy.title,"ifs.subHardDrive.busy")
	Popup_Busy:fnActivate(1)
end

-- Shows or hides buttons. If bShowListbox is true, it'll show the
-- listbox, else the buttons will be visible. If bImmediate is true,
-- it'll set them visible now, else it'll do a fancy fade.
function ifs_mpgs_friends_fnShowListbox(this,bShowListbox,bImmediate)

	if(bImmediate) then
		IFObj_fnSetVis(this.listbox, bShowListbox)
		IFObj_fnSetVis(this.buttons, not bShowListbox)
	else
		-- Do fades only if changed
		if(this.bShowListbox ~= bShowListbox) then
			local fAnimTime = 0.2
			local A1,A2
			if(bShowListbox) then
				A1 = 0.0
				A2 = 1.0
			else
				A1 = 1.0
				A2 = 0.0
			end
			AnimationMgr_AddAnimation(this.listbox,
																{ fTotalTime = fAnimTime, fStartAlpha = A1, fEndAlpha = A2,})
			AnimationMgr_AddAnimation(this.buttons,
																{ fTotalTime = fAnimTime, fStartAlpha = A2, fEndAlpha = A1,})

			-- Always show things after fades triggered
			IFObj_fnSetVis(this.listbox, 1)
			IFObj_fnSetVis(this.buttons, 1)
		end
	end

	-- Always store current state
	this.bShowListbox = bShowListbox
end

-- Callbacks from the "This will leave your current session" popup. If
-- bResult is true, user selected 'yes'
function ifs_mpgs_friends_fnAskedJoin(bResult)
	local this = ifs_mpgs_friends

	-- Always restore infobox
	local fAnimTime = 0.2
	AnimationMgr_AddAnimation(this.infobox,
														{ fTotalTime = fAnimTime, fStartAlpha = 0, fEndAlpha = 1,})

	if(bResult) then
		-- Exit out of current game...
		ScriptCB_CancelLobby()
		-- and try to join new one
		ifs_mpgs_fnStartJoin(this)
	else
		-- User hit no. Put buttons back
		local fAnimTime = 0.2
		AnimationMgr_AddAnimation(this.buttons,
															{ fTotalTime = fAnimTime, fStartAlpha = 0, fEndAlpha = 1,})
		IFObj_fnSetVis(this.buttons, 1)
	end
end

-- Callbacks from the "Remove from friendslist" popup. If bResult is
-- true, user selected 'yes'
function ifs_mpgs_friends_fnAskedRemove(bResult)
	local this = ifs_mpgs_friends

	local fAnimTime = 0.2
	AnimationMgr_AddAnimation(this.infobox,
														{ fTotalTime = fAnimTime, fStartAlpha = 0, fEndAlpha = 1,})

	if(bResult) then
		ScriptCB_DoFriendAction(this.CurButton,this.bRecentMode)
		ifs_mpgs_friends_fnShowListbox(this,1,nil) -- back to listbox
	else
		-- User hit no. Put buttons back
		local fAnimTime = 0.2
		AnimationMgr_AddAnimation(this.buttons,
															{ fTotalTime = fAnimTime, fStartAlpha = 0, fEndAlpha = 1,})
		IFObj_fnSetVis(this.buttons, 1)
	end
end

-- Callbacks from the "never accept friends requests" popup. If
-- bResult is true, user selected 'yes'
function ifs_mpgs_friends_fnAskedNever(bResult)
	local this = ifs_mpgs_friends
	
	if(bResult) then
		ScriptCB_DoFriendAction(this.CurButton,this.bRecentMode)
		ifs_mpgs_friends_fnShowListbox(this,1,nil) -- back to listbox
	else
		-- User hit no. Put buttons back
		local fAnimTime = 0.2
		AnimationMgr_AddAnimation(this.buttons,
															{ fTotalTime = fAnimTime, fStartAlpha = 0, fEndAlpha = 1,})
		IFObj_fnSetVis(this.buttons, 1)
	end
end

ifs_mpgs_friends = NewIFShellScreen {
	nologo = 1,
	bg_texture = "iface_bgmeta_space",
    movieIntro      = nil, -- played before the screen is displayed
    movieBackground = nil, -- played while the screen is displayed

	title = NewIFText {
		string = "ifs.xfriendslist.title",
		font = "gamefont_large",
		y = 0,
		textw = 460,
		ScreenRelativeX = 0.5, -- center
		ScreenRelativeY = 0, -- top
		nocreatebackground=1,
	},

	buttons = NewIFContainer {
		ScreenRelativeX = 0.5, -- center
		ScreenRelativeY = 0, -- top
		y = 50,
	},

	Enter = function(this, bFwd)
		-- Always call base class
		gIFShellScreenTemplate_fnEnter(this, bFwd)

		-- Added chunk for error handling...
		if(not bFwd) then
			local ErrorLevel,ErrorMessage = ScriptCB_GetError()
			if(ErrorLevel >= 6) then -- session or login error, must keep going further
				ScriptCB_PopScreen()
			end
		end

		print("ifs_mpgs_friends Enter. RecentMode = ",this.bRecentMode)
		if(this.bRecentMode) then
			IFText_fnSetString(this.title,"common.mp.recent")
		else
			IFText_fnSetString(this.title,"ifs.xfriendslist.title")
		end

		-- Reset listbox, show it. [Remember, Lua starts at 1!]
		gsfriends_listbox_layout.FirstShownIdx = 1
		gsfriends_listbox_layout.SelectedIdx = 1
		gsfriends_listbox_layout.CursorIdx = 1
		ScriptCB_BeginFriends(this.bRecentMode)
		ListManager_fnFillContents(this.listbox,friends_listbox_contents,gsfriends_listbox_layout)
		IFText_fnSetUString(this.infobox.text,ScriptCB_GetFriendStateStr(this.bRecentMode))

		ifs_mpgs_friends_fnShowListbox(this,1,1)
	end,

	Exit = function(this, bFwd)
		ScriptCB_CancelFriends(this.bRecentMode)
		gBlankListbox = 1
		ListManager_fnFillContents(this.listbox,friends_listbox_contents,gsfriends_listbox_layout)
		IFText_fnSetString(this.infobox.text,"")
		friends_listbox_contents = nil
		gBlankListbox = nil
	end,

	Input_Accept = function(this)
		if(getn(friends_listbox_contents) < 1) then
			return
		end

		if(this.bShowListbox) then
			-- Set hidden flag for all buttons
			local k,v
			for k,v in gsfriends_vbutton_layout.buttonlist do
				this.buttons[v.tag].hidden = 1
			end
			-- Then, enable only the buttons the game says should be on
			local tButtonlist = ScriptCB_GetFriendActions(this.bRecentMode)
			for k,v in tButtonlist do
				print("k =",k)
				if((k ~= nil) and this.buttons[k]) then
					this.buttons[k].hidden = nil
				end
			end
		
			-- Update list of what's visible
			local NewButton = ShowHideVerticalButtons(this.buttons,gsfriends_vbutton_layout)
			SetCurButton(NewButton)
			ifs_mpgs_friends_fnShowListbox(this,nil,nil)
		else
			-- On buttons. Do them.
			if(this.CurButton == "FEEDBACK") then
				local Selection = friends_listbox_contents[gsfriends_listbox_layout.SelectedIdx]
				ifs_mpgs_feedback.TargetName = Selection.name
                ifs_movietrans_PushScreen(ifs_mpgs_feedback)
			elseif ((this.CurButton == "REMOVE") or (this.CurButton == "NEVER")) then
				-- These two are considered "Destructive" actions -- must ask
				-- for confirmation first

				Popup_YesNo.CurButton = "no" -- default

				local Key
				if(this.CurButton == "REMOVE") then
					Popup_YesNo.fnDone = ifs_mpgs_friends_fnAskedRemove
					Key = "ifs.xfriendslist.removeprompt"
				else
					Popup_YesNo.fnDone = ifs_mpgs_friends_fnAskedNever
					Key = "ifs.xfriendslist.neverprompt"
				end
				
				local Selection = friends_listbox_contents[gsfriends_listbox_layout.SelectedIdx]
				local ShowUStr = ScriptCB_usprintf(Key,ScriptCB_tounicode(Selection.name))
				IFText_fnSetUString(Popup_YesNo.title,ShowUStr)

				Popup_YesNo:fnActivate(1)
				local fAnimTime = 0.2
				AnimationMgr_AddAnimation(this.buttons,
																	{ fTotalTime = fAnimTime, fStartAlpha = 1, fEndAlpha = 0,})
				AnimationMgr_AddAnimation(this.infobox,
																	{ fTotalTime = fAnimTime, fStartAlpha = 1, fEndAlpha = 0,})

			elseif (this.CurButton == "JOIN") then
				-- Flow is different depending on whether we're in a session or
				-- not. Store flag for later
				this.bWasInSession = ScriptCB_InNetSession()
				if(this.bWasInSession) then
					-- Must prompt that this'll leave current session.
					Popup_YesNo.CurButton = "no" -- default
					Popup_YesNo.fnDone = ifs_mpgs_friends_fnAskedJoin
					IFText_fnSetString(Popup_YesNo.title,"ifs.xfriendslist.willexitsession")
					Popup_YesNo:fnActivate(1)
					local fAnimTime = 0.2
					AnimationMgr_AddAnimation(this.buttons,
																		{ fTotalTime = fAnimTime, fStartAlpha = 1, fEndAlpha = 0,})
					AnimationMgr_AddAnimation(this.infobox,
																		{ fTotalTime = fAnimTime, fStartAlpha = 1, fEndAlpha = 0,})
				else
					-- Not in session. No prompt necessary
					ifs_mpgs_fnStartJoin(this)
				end
				-- end of "JOIN"
			else
				-- Simple action that can be done asap
				ScriptCB_DoFriendAction(this.CurButton,this.bRecentMode)
				ifs_mpgs_friends_fnShowListbox(this,1,nil) -- back to listbox
			end

		end


	end,

	Input_Back = function(this)
		if(this.bShowListbox) then
			ScriptCB_PopScreen()
		else
			ScriptCB_SndPlaySound("shell_menu_exit")
			ifs_mpgs_friends_fnShowListbox(this,1,nil)
		end
	end,

	Input_GeneralUp = function(this)
		if(this.bShowListbox) then
			ListManager_fnNavUp(this.listbox,friends_listbox_contents,gsfriends_listbox_layout)
			IFText_fnSetUString(this.infobox.text,ScriptCB_GetFriendStateStr(this.bRecentMode))
		else
			gDefault_Input_GeneralUp(this)
		end
	end,

	Input_GeneralDown = function(this)
		if(this.bShowListbox) then
			ListManager_fnNavDown(this.listbox,friends_listbox_contents,gsfriends_listbox_layout)
			IFText_fnSetUString(this.infobox.text,ScriptCB_GetFriendStateStr(this.bRecentMode))
		else
			gDefault_Input_GeneralDown(this)
		end
	end,

	Input_LTrigger = function(this)
		if(this.bShowListbox) then
			ListManager_fnPageUp(this.listbox,friends_listbox_contents,gsfriends_listbox_layout)
			IFText_fnSetUString(this.infobox.text,ScriptCB_GetFriendStateStr(this.bRecentMode))
		end
	end,

	Input_RTrigger = function(this)
		if(this.bShowListbox) then
			ListManager_fnPageDown(this.listbox,friends_listbox_contents,gsfriends_listbox_layout)
			IFText_fnSetUString(this.infobox.text,ScriptCB_GetFriendStateStr(this.bRecentMode))
		end
	end,

	-- No L/R functionality possible on this screen (gotta have stubs
	-- here, or the base class will override)
	Input_GeneralLeft = function(this)
	end,
	Input_GeneralRight = function(this)
	end,

	Update = function(this, fDt)
		-- Call default base class's update function (make button bounce)
		gIFShellScreenTemplate_fnUpdate(this,fDt)

		-- Lobby might be active (if we entered thru it). Update it.
		ScriptCB_UpdateLobby(nil)

		-- print("Brad, call FriendsUpdate from here, do client/server switch in C")
		ScriptCB_UpdateFriends(this.bRecentMode)
	end,

	-- Brad, call this function from C (with LuaScript::CallTableProcWThis() ) to
	-- refresh the listbox contents. The contents should be in the lua global
	-- gsfriends_listbox_contents
	RepaintListbox = function(this)
		ListManager_fnFillContents(this.listbox,friends_listbox_contents,gsfriends_listbox_layout)
		IFText_fnSetUString(this.infobox.text,ScriptCB_GetFriendStateStr(this.bRecentMode))
	end,
}


-- Do programatic work to set up this screen
function ifs_mpgs_friends_fnBuildScreen(this)
	local w,h = ScriptCB_GetSafeScreenInfo() -- of the usable screen

	local BoxW = w * 0.65
	local BoxH = gsfriends_listbox_layout.showcount * (gsfriends_listbox_layout.yHeight + gsfriends_listbox_layout.ySpacing) + 30

	this.listbox = NewButtonWindow { ZPos = 200, 
		ScreenRelativeX = 0.5, -- center
		ScreenRelativeY = 0.0, -- top of screen
		y = 50 + (BoxH * 0.5), -- enough to be under the title
		
		width = BoxW, height = BoxH,
	}
	gsfriends_listbox_layout.width = BoxW - 35	

	ListManager_fnInitList(this.listbox,gsfriends_listbox_layout)

	-- Also, do the box at the bottom of the screen
	local BoxW = w * 0.95
	local BoxH = 110

	this.infobox = NewButtonWindow { ZPos = 200, 
		ScreenRelativeX = 0.5, -- center
		ScreenRelativeY = 1.0, -- middle of screen
		y = -(40 + (BoxH * 0.5)),
		
		width = BoxW, height = BoxH,
	}

	this.infobox.text = NewIFText{
		y = BoxH * -0.5 - 5, valign = "vcenter", -- centered around parent
		textw= BoxW - 32, texth = BoxH,
		font = "gamefont_medium",
--		string = "data here",
		nocreatebackground=1,
	}

	this.CurButton = AddVerticalButtons(this.buttons,gsfriends_vbutton_layout)

end

ifs_mpgs_friends_fnBuildScreen(ifs_mpgs_friends)
ifs_mpgs_friends_fnBuildScreen = nil

AddIFScreen(ifs_mpgs_friends,"ifs_mpgs_friends")
