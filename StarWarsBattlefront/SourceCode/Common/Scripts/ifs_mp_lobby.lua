-- Multiplayer lobby


-- Helper function. Given a layout (x,y,width, height), returns a
-- fully-built item.
function ifs_mp_lobby_Listbox_CreateItem(layout)
	-- Make a coordinate system pegged to the top-left of where the cursor would go.
	local Temp = NewIFContainer { x = layout.x - 0.5 * layout.width, y=layout.y}

	-- Note: +16 is necessary for the ultra-wide XLive gamertags to fit.
	-- NM 7/8/04
	local TeamPos = 0.5 * layout.width + 16

	local PingWidth = 50
	local PingPos = layout.width - 15 - PingWidth
	local BandwidthWidth = 120
	local BandwidthPos = PingPos - BandwidthWidth
	local QOSWidth = 40
	local QOSPos = layout.width - 15 - QOSWidth -- enough for the right border

	local QOSHeight = 0.8 * layout.height

	Temp.namefield = NewIFText{ 
		x = 10, y = -10, textw = TeamPos - 10, 
		halign = "left", font = "gamefont_medium", nocreatebackground=1,
		inert_all = 1,
	}

	Temp.teamfield = NewIFText{ 
		x = TeamPos, y = -10, textw = PingPos - TeamPos, 
		halign = "left", font = "gamefont_medium", nocreatebackground=1,
		inert_all = 1,
	}

	Temp.pingfield = NewIFText{ 
		x = PingPos, y = -10, textw = 100, 
		halign = "left", font = "gamefont_medium", nocreatebackground=1,
		inert_all = 1,
	}
	Temp.killsfield = NewIFText{ 
		x = BandwidthPos, y = -10, textw = 120, 
		halign = "left", font = "gamefont_medium", nocreatebackground=1,
		inert_all = 1,
	}

	if(layout.bTitles) then
		Temp.qosfield = NewIFText{
			x = QOSPos - 20, y = -10, textw = 120, 
			halign = "left", font = "gamefont_medium", nocreatebackground=1,
			inert_all = 1,
		}
	else
		local IconSize = 0.9 * layout.height
		Temp.StateIcon = NewIFImage{ x = QOSPos - IconSize * 2.2, y = 3, texture = "lobby_icons", 
			localpos_l = 0, localpos_t = -10, 
			localpos_b = IconSize-10, localpos_r = IconSize,
			bInertPos = 1,
			inert_all = 1,
		} -- y-pos is to get it centered in bar

		Temp.VoiceIcon = NewIFImage { 
			x = QOSPos - IconSize * 1.1, y = 3,
			texture = "lobby_icons", 
			localpos_l = 0, localpos_t = -10, 
			localpos_b = IconSize-10, localpos_r = IconSize,
			bInertPos = 1,
			inert_all = 1,
		} -- y-pos is to get it centered in bar

		Temp.qosfield = NewIFImage{ x = QOSPos, y = 6, texture = "ping_icon", localpos_t = -10, localpos_b = QOSHeight-10, localpos_r = QOSWidth, } -- y-pos is to get it centered in bar
	end

	return Temp
end

function ifs_mp_lobby_Listbox_fnShowHideIdiot(Dest,bIdiotMode)
	IFObj_fnSetVis(Dest.pingfield,not bIdiotMode)
	IFObj_fnSetVis(Dest.killsfield,(not bIdiotMode) and (gPlatformStr == "PC"))
	IFObj_fnSetVis(Dest.qosfield,bIdiotMode)
end

-- Helper function. For a destination item (previously created w/
-- CreateItem), fills it in with data, which may be nil (==blank it)
function ifs_mp_lobby_Listbox_PopulateItem(Dest,Data)

	-- If we need to zap the glyphcache, do so.
	if(gBlankListbox) then
		IFText_fnSetString(Dest.namefield,"")
		IFText_fnSetString(Dest.teamfield,"")
		IFText_fnSetString(Dest.pingfield,"")
		IFText_fnSetString(Dest.killsfield,"")
	elseif (Data) then
		-- Have data, time to draw. Do so.
		IFText_fnSetString(Dest.namefield,Data.namestr)
--		IFText_fnSetString(Dest.namefield,"WWWWWWWWWWWWWWM") -- space test

		
		if(Data.iTeam < 0.5) then
			IFText_fnSetUString(Dest.teamfield,ScriptCB_GetTeamName(1))
		else
			IFText_fnSetUString(Dest.teamfield,ScriptCB_GetTeamName(2))
		end
		if(Data.ColorR) then
			IFObj_fnSetColor(Dest.teamfield,Data.ColorR,Data.ColorG,Data.ColorB)
		end

		if(ifs_mp_lobby.bIdiotMode) then
			local U1 = (5 - Data.iQOS) * 0.2
			IFImage_fnSetUVs(Dest.qosfield,U1,nil,U1 + 0.2,nil)
		else
			IFText_fnSetString(Dest.pingfield,Data.pingstr)
			IFText_fnSetString(Dest.killsfield,Data.killsstr)
		end
		
		if(Data.VoiceIcon) then
			local UVs = gXLFriendsEnum2UVs[Data.VoiceIcon+1] -- lua counts from 1
			IFImage_fnSetUVs(Dest.VoiceIcon,UVs.u,UVs.v,UVs.u+0.25,UVs.v+0.25)
		end
		IFObj_fnSetVis(Dest.VoiceIcon,Data.VoiceIcon)

		if(Data.StateIcon) then
			local UVs = gXLFriendsEnum2UVs[Data.StateIcon+1] -- lua counts from 1
			IFImage_fnSetUVs(Dest.StateIcon,UVs.u,UVs.v,UVs.u+0.25,UVs.v+0.25)
		end
		IFObj_fnSetVis(Dest.StateIcon,Data.StateIcon)

		ifs_mp_lobby_Listbox_fnShowHideIdiot(Dest,ifs_mp_lobby.bIdiotMode)
	end -- Data exists

	-- Show entry if Data != nil
	IFObj_fnSetVis(Dest,Data)
end

lobby_listbox_layout = {
	showcount = 10,
--	yTop = -130 + 13,  -- auto-calc'd now
	yHeight = 26,
	ySpacing  = 0,
	width = 430,
	x = 0,
	slider = 1,
	CreateFn = ifs_mp_lobby_Listbox_CreateItem,
	PopulateFn = ifs_mp_lobby_Listbox_PopulateItem,
}

ifs_mp_lobby_listbox_contents = {
	-- Filled in from C++ now. NM 8/7/03
	-- Stubbed to show the format it wants.
--	{ indexstr = "1", namestr = "Alpha"},
--	{ indexstr = "2", namestr = "Bravo"},
}

-- Callbacks from the busy popup
-- Returns -1, 0, or 1, depending on error, busy, or success
function ifs_mplobby_leavepopup_fnCheckDone()
--	local this = ifs_sessionlist_joinpopup
	ScriptCB_UpdateLeave() -- think...

	return ScriptCB_IsLeaveDone()
end

function ifs_mplobby_leavepopup_fnOnSuccess()
	local this = ifs_mp_lobby
	Popup_Busy:fnActivate(nil)
	ifs_mp_lobby_fnShowHideItems(this,1)
	ScriptCB_PopScreen("ifs_mp_main")
end

function ifs_mplobby_leavepopup_fnOnFail()
	-- This shouldn't happen, but go back in any case
	local this = ifs_mp_lobby
	Popup_Busy:fnActivate(nil)
	ifs_mp_lobby_fnShowHideItems(this,1)
	ScriptCB_PopScreen("ifs_mp_main")
end

function ifs_mplobby_leavepopup_fnOnCancel()
	-- Shouldn't happen!
	ifs_mp_lobby_fnShowHideItems(this,1)
end

-- Callback after the "really leave session?" popup is done.
-- If bResult is true, then the user hit yes, else no.
function ifs_mp_lobby_fnLeavePopupDone(bResult)
	local this = ifs_mp_lobby

	if(bResult) then
		-- User does want to leave. Start the process.
		ScriptCB_BeginLeave()

		-- And show the popup.
		Popup_Busy.fnCheckDone = ifs_mplobby_leavepopup_fnCheckDone
		Popup_Busy.fnOnSuccess = ifs_mplobby_leavepopup_fnOnSuccess
		Popup_Busy.fnOnFail = ifs_mplobby_leavepopup_fnOnFail
		Popup_Busy.fnOnCancel = ifs_mplobby_leavepopup_fnOnCancel
		Popup_Busy.bNoCancel = 1 -- no cancel button
		Popup_Busy.fTimeout = 5 -- seconds
		IFText_fnSetString(Popup_Busy.title,"common.mp.leaving")
		Popup_Busy:fnActivate(1)

	else
		ifs_mp_lobby_fnShowHideItems(this,1)
	end
end

-- callback when the lobby options popup is done
function ifs_mp_lobby_fnLobbyOptionsPopupDone()
	local this = ifs_mp_lobby
	
	-- force a reget of the listbox to update any changes
	ifs_mp_lobby_SetHilight(this,lobby_listbox_layout.SelectedIdx)
end

-- Helper function: turns pieces on/off as requested
function ifs_mp_lobby_fnShowHideItems(this,bNormalVis)
	IFObj_fnSetVis(this.listbox,bNormalVis)
	IFObj_fnSetVis(this.columnheaders,bNormalVis)
--	IFObj_fnSetVis(this.buttons,bNormalVis and this.bShellActive)
end


-- Sets the hilight on the listbox, create button given a hilight
function ifs_mp_lobby_SetHilight(this,aListIndex)
	lobby_listbox_layout.SelectedIdx = aListIndex
--	lobby_listbox_layout.CursorIdx = aListIndex
	ListManager_fnFillContents(this.listbox,ifs_mp_lobby_listbox_contents,lobby_listbox_layout)
end

-- Sets the idiot mode
function ifs_mp_lobby_fnSetIdiotMode(this,bNewMode)
	this.bIdiotMode = bNewMode
	ifs_mp_lobby_Listbox_fnShowHideIdiot(this.columnheaders,this.bIdiotMode)
	ifs_mp_lobby_SetHilight(this,lobby_listbox_layout.SelectedIdx)
end


-- this recalculates the boot flag and the vote button visibility
function ifs_mp_lobby_CalcCanBoot()
	local this = ifs_mp_lobby

	-- default to visible
	this.BootVisible = 1

	if(lobby_listbox_layout.SelectedIdx) then
		-- the currently selected player
		local Selection = ifs_mp_lobby_listbox_contents[lobby_listbox_layout.SelectedIdx]
		if(not Selection) then
			return
		end
		local bIsMe = Selection.bIsLocal

		local muted,friend,bCanBoot = ScriptCB_GetLobbyPlayerFlags(Selection.namestr)

		if(ScriptCB_GetAmHost()) then
			this.BootVisible = not bIsMe -- can't kick self
		else
			-- Not host. Set client options
			this.BootVisible = not ScriptCB_IsInShell()
							
			if( bIsMe ) then
				this.BootVisible = nil  -- can't kick self
			end

			-- won't boot if players are different team
			local NumEntries = getn(ifs_mp_lobby_listbox_contents)
			local bIsSameTeam = nil
			for i = 1, NumEntries do
				if( ifs_mp_lobby_listbox_contents[i].bIsLocal and Selection.iTeam == ifs_mp_lobby_listbox_contents[i].iTeam ) then
					bIsSameTeam = 1
				end
            end			
			if( not bIsSameTeam ) then
				this.BootVisible = nil
			end			
		end
		
		-- global can you boot this person?
		if(not bCanBoot) then
			this.BootVisible = nil
		end
	else
		-- nobody home, hidden
		this.BootVisible = nil		
	end
	
	-- show/hide the boot button
	IFObj_fnSetVis(this.Helptext_Misc,this.BootVisible)
end



-- this recalculates the boot flag and the vote button visibility
function ifs_mp_lobby_CalcCanForceBoot()
	local this = ifs_mp_lobby

	-- default to visible
	this.ForceBootVisible = 1

	if(lobby_listbox_layout.SelectedIdx) then
		-- the currently selected player
		local Selection = ifs_mp_lobby_listbox_contents[lobby_listbox_layout.SelectedIdx]
		if(not Selection) then
			this.ForceBootVisible = nil
			return
		end

		local bIsMe = Selection.bIsLocal
		if(ScriptCB_GetAmHost()) then
			this.ForceBootVisible = not bIsMe -- can't kick self
		else
			this.ForceBootVisible = nil
		end
	else
		-- nobody home, hidden
		this.ForceBootVisible = nil		
	end
	
	-- show/hide the boot button
	IFObj_fnSetVis(this.Helptext_ForceBoot,this.ForceBootVisible)
end



ifs_mp_lobby = NewIFShellScreen {
	nologo = 1,
	bg_texture = "iface_bgmeta_space",

	title = NewIFText {
--		string = "common.mp.lobby",
		font = "gamefont_large",
		y = 0,
		textw = 460, -- center on screen. Fixme: do real centering!
		ScreenRelativeX = 0.5, -- center
		ScreenRelativeY = 0, -- top
		nocreatebackground=1,
	},

	-- Vote helptext
	Helptext_Misc = NewIFContainer {
		ScreenRelativeX = 0.5, -- left
		ScreenRelativeY = 1.0, -- bottom
		y = -15, -- second row of items
		btn = NewClickableIFButton -- NewRoundIFButton 
		{ 
			btnw = 200, 
			btnh = ScriptCB_GetFontHeight("gamefont_small"),
			font = "gamefont_small",
			tag = "voteboot",
			string = "ifs.onlinelobby.vote",
			nocreatebackground = 1,
		},
	},

	-- Vote helptext
	Helptext_ForceBoot = NewIFContainer {
		ScreenRelativeX = 1.0, -- left
		ScreenRelativeY = 1.0, -- bottom
		y = -15, -- second row of items
		x = -100,
		btn = NewClickableIFButton -- NewRoundIFButton 
		{ 
			btnw = 200, 
			btnh = ScriptCB_GetFontHeight("gamefont_small"),
			font = "gamefont_small",
			tag = "forceboot",
			string = "ifs.onlinelobby.forceboot",
			nocreatebackground = 1,
		},
	},

	IPAddr = NewIFText {
--		string = "ifs.mp.connection.title",
		font = "gamefont_small",
		textw = 460,
		halign = "left",
		ScreenRelativeX = 0, -- left
		ScreenRelativeY = 1.0, -- near bottom
		y = -60,
		x = 25,
		nocreatebackground=1,
	},

	ServerName = NewIFText {
--		string = "ifs.mp.connection.title",
		font = "gamefont_small",
		textw = 460,
		halign = "left",
		ScreenRelativeX = 0, -- left
		ScreenRelativeY = 1.0, -- near bottom
		y = -82,
		x = 25,
		nocreatebackground=1,
	},

	launchflag = nil,
	
	Enter = function(this, bFwd)
		-- Always call base class
		gIFShellScreenTemplate_fnEnter(this, bFwd)

--		gIFShellScreenTemplate_fnMoveIcon(this.Helptext_Misc2)

		-- Added chunk for error handling...
		if(not bFwd) then
			local ErrorLevel,ErrorMessage = ScriptCB_GetError()
			if(ErrorLevel >= 6) then -- session or login error, must keep going further
				ScriptCB_PopScreen()
			end
		end

--		IFObj_fnSetVis(this.Helptext_Idiot,(gOnlineServiceStr ~= "XLive"))

		this.bShellActive = ScriptCB_GetShellActive()
		if(this.Helptext_Accept) then
			IFText_fnSetString(this.Helptext_Accept.helpstr,"ifs.onlinelobby.playeropts")
			gIFShellScreenTemplate_fnMoveIcon(this.Helptext_Accept)
		end

		if(gPlatformStr == "XBox") then
			IFText_fnSetString(this.title, "game.pause.playerlist")
		else
			this.bAmHost = ScriptCB_GetAmHost()
			if(this.bAmHost) then
				IFText_fnSetString(this.title, "ifs.mplobby.host_title")
			else
				IFText_fnSetString(this.title, "ifs.mplobby.client_title")
			end
		end

		ifs_mp_lobby_fnSetIdiotMode(this,(gOnlineServiceStr == "XLive"))
		
		-- Reset listbox, show it. [Remember, Lua starts at 1!]
		lobby_listbox_layout.FirstShownIdx = 1
		lobby_listbox_layout.SelectedIdx = 1
		lobby_listbox_layout.CursorIdx = 1
		if(bFwd) then
			ScriptCB_BeginLobby()
		else
			-- force an update, NOW. (we zapped everything leaving this screen, gotta
			-- restore it on re-entry)
			ScriptCB_UpdateLobby(1)
		end
		ListManager_fnFillContents(this.listbox,ifs_mp_lobby_listbox_contents,lobby_listbox_layout)

		ifs_mp_lobby_SetHilight(this,1)
		ifs_mp_lobby_fnShowHideItems(this,1)

		IFText_fnSetString(this.IPAddr,"IP: " .. ScriptCB_GetIPAddr())
		IFText_fnSetString(this.ServerName,ScriptCB_GetGameName())

		IFObj_fnSetVis(this.IPAddr,(gOnlineServiceStr ~= "XLive") and (not ifs_mp_lobby.bE3Mode) and (not gFinalBuild))
		IFObj_fnSetVis(this.ServerName,1)
--		IFObj_fnSetVis(this.Helptext_Misc2,not ifs_mp_lobby.bE3Mode)
		
		if((this.bAutoLaunch) or (this.bHideOnEntry)) then
			-- Hide everything ASAP
			IFObj_fnSetVis(this.title,nil)
--			IFObj_fnSetVis(this.Helptext_Misc2,nil)
			if(this.Helptext_Accept) then
				IFObj_fnSetVis(this.Helptext_Accept,nil)
			end
			if(this.Helptext_Back) then
				IFObj_fnSetVis(this.Helptext_Back,nil)
			end
			IFObj_fnSetVis(this.IPAddr,nil)
			IFObj_fnSetVis(this.ServerName,nil)
			IFObj_fnSetVis(this.listbox,nil)
			IFObj_fnSetVis(this.columnheaders,nil)

			this.bHideOnEntry = nil -- clear flag
		end
		
		-- set the visibility of the boot button
		ifs_mp_lobby_CalcCanBoot()
		ifs_mp_lobby_CalcCanForceBoot()
	end,

 	Exit = function(this, bFwd)
 		if(bFwd) then -- going to sub-screen
 		else
			ScriptCB_CancelLobby() -- going back to create opts (host) or sessionlist (client)
 		end

		-- Clear out glyph cache
		gBlankListbox = 1
		if(ifs_mp_lobby_listbox_contents) then
			ListManager_fnFillContents(this.listbox,ifs_mp_lobby_listbox_contents,lobby_listbox_layout)
		end
		gBlankListbox = nil
		ifs_mp_lobby_listbox_contents = {} -- clear this from memory also.
 	end,
	
	Input_Accept = function(this)	
		-- If base class handled this work, then we're done
		if(gShellScreen_fnDefaultInputAccept(this)) then
			ifs_mp_lobby_CalcCanBoot()		
			ifs_mp_lobby_CalcCanForceBoot()
			return
		end
		
		if(this.CurButton=="voteboot") then
			-- make sure this is updated
			ifs_mp_lobby_CalcCanBoot()

			local Selection = ifs_mp_lobby_listbox_contents[lobby_listbox_layout.SelectedIdx]
			if(this.BootVisible and Selection) then
				ScriptCB_LobbyAction(Selection.namestr,"boot")			
			end		
			-- hide the button, since we just voted
			ifs_mp_lobby_CalcCanBoot()
		end

		if(this.CurButton=="forceboot") then
			-- make sure this is updated
			ifs_mp_lobby_CalcCanForceBoot()

			local Selection = ifs_mp_lobby_listbox_contents[lobby_listbox_layout.SelectedIdx]
			if(this.ForceBootVisible and Selection) then
				ScriptCB_LobbyAction(Selection.namestr,"forceboot")			
			end		
			-- hide the button, since we just voted
			ifs_mp_lobby_CalcCanForceBoot()

                        -- make the screen go away so people won't accidentally click it twice
                   	ScriptCB_PopScreen()

		end

--		if(lobby_listbox_layout.SelectedIdx) then
--			local Selection = ifs_mp_lobby_listbox_contents[lobby_listbox_layout.SelectedIdx]
--			if(not Selection) then
--				return
--			end
--			IFText_fnSetString(Popup_LobbyOpts.title,Selection.namestr)
--			Popup_LobbyOpts.bIsMe = Selection.bIsLocal
--			
--			local NumEntries = getn(ifs_mp_lobby_listbox_contents)
--			Popup_LobbyOpts.bIsSameTeam = nil
--			for i = 1, NumEntries do
--				--print("+++i=", i, Selection.iTeam, ifs_mp_lobby_listbox_contents[i].bIsLocal, ifs_mp_lobby_listbox_contents[i].namestr, ifs_mp_lobby_listbox_contents[i].iTeam )
--				if( ifs_mp_lobby_listbox_contents[i].bIsLocal ) then
--					if( Selection.iTeam == ifs_mp_lobby_listbox_contents[i].iTeam ) then
--						--print("+++x=", i, Selection.iTeam, ifs_mp_lobby_listbox_contents[i].bIsLocal, ifs_mp_lobby_listbox_contents[i].namestr, ifs_mp_lobby_listbox_contents[i].iTeam )
--						Popup_LobbyOpts.bIsSameTeam = 1
--					end
--				end
--			end            
--            
--			ifelm_shellscreen_fnPlaySound(this.acceptSound)
--
--
--			-- Get their muted, friend flags.
--			-- also get the boot flag. says if we could boot this player if we wanted to.
--			-- this is not absolute, there are other conditions that could hide the "boot"
--			-- option. all this tells us is that someone else isn't currently nominated
--			-- for a boot
--			if(ScriptCB_GetLobbyPlayerFlags) then
--				Popup_LobbyOpts.bIsMuted, Popup_LobbyOpts.bIsFriend, Popup_LobbyOpts.bCanBoot = ScriptCB_GetLobbyPlayerFlags(Selection.namestr)
--			end
--			
--			Popup_LobbyOpts.bOnlyForPlayer = 1
--			Popup_LobbyOpts.fnDone = ifs_mp_lobby_fnLobbyOptionsPopupDone;
--			Popup_LobbyOpts:fnActivate(1)
--		end -- selectedidx is valid
	end,

	Input_Back = function(this)
		if(this.bShellActive) then
			ifelm_shellscreen_fnPlaySound(this.exitSound)
			-- Shell is active. Must prompt before backing out of screen
			ifs_mp_lobby_fnShowHideItems(this,nil)
			
			Popup_YesNo.CurButton = "no" -- default
			Popup_YesNo.fnDone = ifs_mp_lobby_fnLeavePopupDone
			if(this.bAmHost) then
				IFText_fnSetString(Popup_YesNo.title,"ifs.onlinelobby.cancelsession")
			else
				IFText_fnSetString(Popup_YesNo.title,"ifs.onlinelobby.leavesession")
			end
			ifs_mp_lobby_fnShowHideItems(this, nil)
			Popup_YesNo:fnActivate(1)
		else
			-- Game is active. Just back up to pausemenu
			ScriptCB_PopScreen()
		end
	end,

--	Input_Misc = function(this)
--		-- make sure this is updated
--		ifs_mp_lobby_CalcCanBoot()
--		if(this.BootVisible) then
--			local Selection = ifs_mp_lobby_listbox_contents[lobby_listbox_layout.SelectedIdx]
--			if(not Selection) then
--				return
--			end
--			ScriptCB_LobbyAction(Selection.namestr,"boot")			
--		end		
--	end,

	Input_Start = function(this)
--		if(lobby_listbox_layout.SelectedIdx ) then
--			local Selection = ifs_mp_lobby_listbox_contents[lobby_listbox_layout.SelectedIdx]
--			ScriptCB_VoteKick(Selection.namestr )
--			ifelm_shellscreen_fnPlaySound(this.acceptSound)
--		end
	end,

	Input_GeneralUp = function(this)
		if(lobby_listbox_layout.SelectedIdx) then
			ListManager_fnNavUp(this.listbox,ifs_mp_lobby_listbox_contents,lobby_listbox_layout)
		end
		ifs_mp_lobby_CalcCanBoot()
		ifs_mp_lobby_CalcCanForceBoot()
	end,

	Input_GeneralDown = function(this)
		if(lobby_listbox_layout.SelectedIdx) then
			ListManager_fnNavDown(this.listbox,ifs_mp_lobby_listbox_contents,lobby_listbox_layout)
		end
		ifs_mp_lobby_CalcCanBoot()
		ifs_mp_lobby_CalcCanForceBoot()
	end,

	Input_LTrigger = function(this)
		if(lobby_listbox_layout.SelectedIdx) then
			ListManager_fnPageUp(this.listbox,ifs_mp_lobby_listbox_contents,lobby_listbox_layout)
		end
		ifs_mp_lobby_CalcCanBoot()
		ifs_mp_lobby_CalcCanForceBoot()
 	end,

	Input_RTrigger = function(this)
		if(lobby_listbox_layout.SelectedIdx) then
			ListManager_fnPageDown(this.listbox,ifs_mp_lobby_listbox_contents,lobby_listbox_layout)
		end
		ifs_mp_lobby_CalcCanBoot()
		ifs_mp_lobby_CalcCanForceBoot()
 	end,

	-- No L/R functionality possible on this screen (gotta have stubs
	-- here, or the base class will override)

	Input_GeneralLeft = function(this)
--		ScriptCB_PreviousHost()
	end,
	Input_GeneralRight = function(this)
--		ScriptCB_NextHost()
	end,

	Update = function(this, fDt)
		-- Call default base class's update function (make button bounce)
		gIFShellScreenTemplate_fnUpdate(this,fDt)
		ScriptCB_UpdateLobby(nil)

		if(this.bAutoLaunch) then
--			print("Autolaunching...")
			ScriptCB_LaunchLobby()
		end
		
		-- bail?
		if(ScriptCB_SkipToPlayerList()) then
			if(ScriptCB_CheckPlayerListDone()) then
				ScriptCB_PopScreen()
				return
			end
		end
	end,

	-- Callback (from C++) to repaint the listbox with the current contents
	-- in the global ifs_mp_lobby_listbox_contents
	RepaintListbox = function(this)
		-- Sanity check
		if(not ifs_mp_lobby_listbox_contents) then
			return
		end

		local NumEntries = getn(ifs_mp_lobby_listbox_contents)
		if(NumEntries < 1) then
			lobby_listbox_layout.SelectedIdx = nil
		else
			if((not lobby_listbox_layout.SelectedIdx) or (lobby_listbox_layout.SelectedIdx < 1)) then
				lobby_listbox_layout.SelectedIdx = 1
			elseif (lobby_listbox_layout.SelectedIdx > NumEntries) then
				lobby_listbox_layout.SelectedIdx = NumEntries
			end
		end

--		lobby_listbox_layout.CursorIdx = lobby_listbox_layout.SelectedIdx 

		ListManager_fnFillContents(this.listbox,ifs_mp_lobby_listbox_contents,lobby_listbox_layout)
	end,
}


-- Do programatic work to set up this screen
function ifs_mp_lobby_fnBuildScreen(this)
	local w,h = ScriptCB_GetSafeScreenInfo() -- of the usable screen
	lobby_listbox_layout.width = w - 50 -- enough for sliders, etc

	local HeightPer = lobby_listbox_layout.yHeight + lobby_listbox_layout.ySpacing
	lobby_listbox_layout.showcount = floor((h - 180) / HeightPer)

	this.listbox = NewButtonWindow { ZPos = 200, 
		x=0, y = -20,
		ScreenRelativeX = 0.5, -- center
		ScreenRelativeY = 0.5, -- middle of screen
		width = lobby_listbox_layout.width + 50,
		height = lobby_listbox_layout.showcount * HeightPer + 30,
	}

	ListManager_fnInitList(this.listbox,lobby_listbox_layout)

	-- Make column headers, fill them in
	this.columnheaders = ifs_mp_lobby_Listbox_CreateItem { 
		bTitles = 1, -- 
		width = lobby_listbox_layout.width,
		height = lobby_listbox_layout.yHeight,
		x = -10, -- account for scrollbar
		y = 0,
	}

	this.columnheaders.y = this.columnheaders.y - 20

	this.columnheaders.ScreenRelativeX = 0.5
	this.columnheaders.ScreenRelativeY = 0.5
	this.columnheaders.y = this.listbox.y - (this.listbox.height * 0.5) - 30
	IFText_fnSetString(this.columnheaders.namefield,"ifs.MPLobby.name_header")
	IFText_fnSetString(this.columnheaders.teamfield,"ifs.MPLobby.team_header")
	IFText_fnSetString(this.columnheaders.pingfield,"ifs.MPLobby.ping_header")
	IFText_fnSetString(this.columnheaders.killsfield,"ifs.Stats.kills")
	IFText_fnSetString(this.columnheaders.qosfield,"ifs.MPLobby.qos_header")

--	ScriptCB_GetLobbyPlayerlist()
end

ifs_mp_lobby_fnBuildScreen(ifs_mp_lobby)
ifs_mp_lobby_fnBuildScreen = nil -- dump out of memory once built to save
ifs_mp_lobby_vbutton_layout = nil -- dump out of memory once built to save

AddIFScreen(ifs_mp_lobby,"ifs_mp_lobby")
