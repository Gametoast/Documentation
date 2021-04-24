-- Multiplayer list of sessions screen. For XBox Optimatch or Gamespy
-- "pick a game to join" screen.

gMPSessionList_Listbox_ColumnInfo = {
	{ width = 50, tag = "gamename", string = "ifs.mp.sessionlist.gamename", maxchars = 20, }, -- Server name -- 0.28*layout.width-5
	{ width = 60, tag = "numplayers", string = "ifs.mp.sessionlist.numplayers", maxchars = 2, }, -- # players -- 50
	{ width = 50, tag = "mapname", string = "ifs.onlinelobby.map", maxchars = -1, }, -- mapname -- 0.23*layout.width-5
	{ width = 50, tag = "era", string = "ifs.meta.Configs.era", maxchars = -1, }, -- era -- 0.19*layout.width-5
	{ width = 40, tag = "ping", string = "ifs.mp.sessionlist.ping", maxchars = 4, },  -- ping -- 40
	{ width = 200, tag = "servertypeLabel", string = "ifs.mp.sessionlist.servertype", maxchars = -1,}, -- rest of space goes to 'server type
}

-- Helper function. Given a layout (x,y,width, height), returns a
-- fully-built item.
function MPSessionList_Listbox_CreateItem(layout)
	-- Make a coordinate system pegged to the top-left of where the cursor would go.
	local tinyH=ScriptCB_GetFontHeight("gamefont_tiny")
	local Temp = NewIFContainer { 
		x = layout.x - 0.5 * layout.width, y=layout.y,
	}

	local XPos = 5
	local YPos = layout.height * -0.5 + 3
	local ColumnWidth = gMPSessionList_Listbox_ColumnInfo[1].width
	Temp.namefield = NewIFText { 
		x = XPos, y = YPos, 
		textw = ColumnWidth, texth = layout.height,
		halign = "left", font = "gamefont_super_tiny", nocreatebackground=1, 
	}
	XPos = XPos + ColumnWidth

	ColumnWidth = gMPSessionList_Listbox_ColumnInfo[2].width
	Temp.numplayers = NewIFText { 
		x = XPos, y = YPos, 
		textw = ColumnWidth, texth = layout.height,
		halign = "left", font = "gamefont_super_tiny", nocreatebackground=1, 
	}
	XPos = XPos + ColumnWidth

	ColumnWidth = gMPSessionList_Listbox_ColumnInfo[3].width
	Temp.map = NewIFText { 
		x = XPos, y = YPos, 
		textw = ColumnWidth, texth = layout.height,
		halign = "left", font = "gamefont_super_tiny", nocreatebackground=1, 
	}
	XPos = XPos + ColumnWidth

	ColumnWidth = gMPSessionList_Listbox_ColumnInfo[4].width
	Temp.eraname = NewIFText { 
		x = XPos, y = YPos, 
		textw = ColumnWidth, texth = layout.height,
		halign = "left", font = "gamefont_super_tiny", nocreatebackground=1, 
	}
	XPos = XPos + ColumnWidth

	ColumnWidth = gMPSessionList_Listbox_ColumnInfo[5].width
	Temp.pingtext = NewIFText { 
		x = XPos, y = YPos, 
		textw = ColumnWidth, texth = layout.height,
		halign = "left", font = "gamefont_super_tiny", nocreatebackground=1, 
		string = "456",
	}
	XPos = XPos + ColumnWidth

	ColumnWidth = layout.width - 15 - XPos -- allocate 'rest' to server type
	gMPSessionList_Listbox_ColumnInfo[6].width = ColumnWidth -- and store for later
	Temp.servertype = NewIFText { 
		x = XPos, y = YPos, 
		textw = ColumnWidth, texth = layout.height,
		halign = "left", font = "gamefont_super_tiny", nocreatebackground=1, 
	}
	XPos = XPos + ColumnWidth
	
	Temp.lockicon = NewIFImage { texture = "lock_icon", 
		localpos_l = layout.width-tinyH-1, 
		localpos_t = 6-10, 
		localpos_r = layout.width-1,
		localpos_b = tinyH+4-10 }
	Temp.mapname = ""
	return Temp
end

mpsessioninfo = {
	era = "common.era.cw",
	map = "",
}

mpsession_mapnames = {
	BES = "bespin",
	KAS = "kashyyyk",
	NAB = "naboo",
	RHN = "rhenvar",
	TAT = "tatooine",
	END = "endor",
	GEO = "geonosis",
	HOT = "hoth",
	KAM = "kamino",
	YAV = "yavin",
}

-- Helper function. For a destination item (previously created w/
-- CreateItem), fills it in with data, which may be nil (==blank it)
function MPSessionList_Listbox_PopulateItem(Dest,Data)

	if(gBlankListbox) then
		IFText_fnSetString(Dest.namefield,"")
		IFText_fnSetString(Dest.numplayers,"")
		IFText_fnSetString(Dest.map,"")
		IFText_fnSetString(Dest.eraname,"")
		IFText_fnSetString(Dest.pingtext,"")
		IFText_fnSetString(Dest.servertype,"")
		IFObj_fnSetVis(Dest.lockicon,nil) -- turn off locked icon
	elseif (Data) then
--		IFText_fnSetString(Dest.indexfield,Data.indexstr)
--		IFText_fnSetString(Dest.mapname,Data.mapname)
--		IFText_fnSetString(Dest.minmaxrank,Data.minmaxrank)
--		IFText_fnSetString(Dest.rankedgame,Data.rankedgame)
--		IFText_fnSetString(Dest.gametype,Data.gametype)
		IFText_fnSetString(Dest.numplayers,Data.numplayers)
		IFText_fnSetString(Dest.namefield,Data.namestr)

		if(Data.bWrongVer) then
			IFImage_fnSetTexture(Dest.lockicon, "version_icon")
			IFObj_fnSetVis(Dest.lockicon,1)
		elseif (Data.bLocked) then
			IFImage_fnSetTexture(Dest.lockicon, "lock_icon")
			IFObj_fnSetVis(Dest.lockicon,1)
		else
			IFObj_fnSetVis(Dest.lockicon,nil) -- turn off icon
		end

		if(Data.pingint) then
			IFText_fnSetString(Dest.pingtext,format("%d", Data.pingint))
		else
		end
--		IFObj_fnSetVis(Dest.pingtext,Data.pingtext) -- on/off with data

-- 		IFObj_fnSetVis(Dest.map,nil) -- off until proven otherwise
-- 		IFObj_fnSetVis(Dest.eraname,nil) -- off until proven otherwise

 		local MapStr = strupper(Data.mapname)
		local SideChar = strsub(MapStr,-1) -- last char of mapname : 'A' 'C' 'I' or 'R'
		local DisplayUStr,iSource = missionlist_GetLocalizedMapName(Data.mapname)
		
		if(iSource ~= 2) then
			IFObj_fnSetColor(Dest.map, 255, 255, 255)
		else
			DisplayUStr = ScriptCB_usprintf("ifs.mp.sessionlist.map_missing", DisplayUStr)
			IFObj_fnSetColor(Dest.map, 255, 255, 0)
		end
		IFText_fnSetUString(Dest.map, DisplayUStr)	

		if((SideChar=="A") or (SideChar=="I")) then
			ShowStr = "common.era.gcw"
		elseif ((SideChar == "C") or (SideChar == "R")) then
			ShowStr = "common.era.cw"
		else
			ShowStr = SideChar
		end
		IFText_fnSetString(Dest.eraname, ShowStr)

		if(Data.servertype) then
			if(Data.servertype == 1) then
				IFText_fnSetString(Dest.servertype,"ifs.mp.sessionlist.servertypes.pc")
			elseif(Data.servertype == 2) then
				IFText_fnSetString(Dest.servertype,"ifs.mp.sessionlist.servertypes.pcdedicated")
			elseif(Data.servertype == 3) then
				IFText_fnSetString(Dest.servertype,"ifs.mp.sessionlist.servertypes.ps2")
			elseif(Data.servertype == 4) then
				IFText_fnSetString(Dest.servertype,"ifs.mp.sessionlist.servertypes.ps2dedicated")
			elseif(Data.servertype == 5) then
				IFText_fnSetString(Dest.servertype,"ifs.mp.sessionlist.servertypes.xbox")
			elseif(Data.servertype == 6) then
				IFText_fnSetString(Dest.servertype,"ifs.mp.sessionlist.servertypes.xboxdedicated")
			else
				IFText_fnSetString(Dest.servertype,"") -- blank the data
			end
		end
		Dest.mapname = Data.mapname
	end

	-- Show it if data is present, hide if no data
	IFObj_fnSetVis(Dest,Data)
end

mpsessionlist_listbox_layout = {
	showcount = 6,
--	yTop = -130 + 13,  -- auto-calc'd now
	yHeight = 20,
	ySpacing  = 0,
--	width = 260,
	x = 0,
	slider = 1,
	CreateFn = MPSessionList_Listbox_CreateItem,
	PopulateFn = MPSessionList_Listbox_PopulateItem,
}

mpsessionlist_listbox_contents = {
	-- Filled in from C++ now. NM 8/7/03
	-- Stubbed to show the format it wants.
--	{ indexstr = "1", namestr = "Alpha"},
--	{ indexstr = "2", namestr = "Bravo"},
}

-- Helper function. Given a layout (x,y,width, height), returns a
-- fully-built item.
function MPSessionList_ServerInfo_CreateItem(layout)
	-- Make a coordinate system pegged to the top-left of where the cursor would go.
	local tinyH=ScriptCB_GetFontHeight("gamefont_tiny")
	local Temp = NewIFContainer { 
		x = layout.x - 0.5 * layout.width, y=layout.y,
	}

	local YPos = layout.height * -0.5 + 3
	Temp.text = NewIFText { 
		x = 10, y = YPos, 
		textw = layout.width - 20, texth = layout.height,
		halign = "left", font = "gamefont_super_tiny", nocreatebackground=1, 
	}

	return Temp
end

-- Helper function. For a destination item (previously created w/
-- CreateItem), fills it in with data, which may be nil (==blank it)
function MPSessionList_ServerInfo_PopulateItem(Dest,Data)
	if(gBlankListbox) then
		IFText_fnSetString(Dest.text,"")
	elseif (Data) then
		IFText_fnSetUString(Dest.text,Data.text)
		IFObj_fnSetVis(Dest.text,1)
	else
		IFObj_fnSetVis(Dest.text,nil)
	end
end

mpsessionlist_serverinfo_layout = {
	showcount = 6,
--	yTop = -130 + 13,  -- auto-calc'd now
	yHeight = 20,
	ySpacing  = 0,
--	width = 260,
	x = 0,
	slider = 1,
	CreateFn = MPSessionList_ServerInfo_CreateItem,
	PopulateFn = MPSessionList_ServerInfo_PopulateItem,
}

mpsessionlist_serverinfo_contents = {
	-- Filled in from C++ - NM 10/5/04
}


-- Helper function. Given a layout (x,y,width, height), returns a
-- fully-built item.
function MPSessionList_PlayerList_CreateItem(layout)
	-- Make a coordinate system pegged to the top-left of where the cursor would go.
	local tinyH=ScriptCB_GetFontHeight("gamefont_tiny")
	local Temp = NewIFContainer { 
		x = layout.x - 0.5 * layout.width, y=layout.y,
	}

	local YPos = layout.height * -0.5 + 3
	local XPos = 10
	Temp.text = NewIFText { 
		x = XPos, y = YPos, 
		textw = layout.width * 0.65 - 10, texth = layout.height,
		halign = "left", font = "gamefont_super_tiny", nocreatebackground=1, 
	}

	XPos = XPos + layout.width * 0.65
	Temp.kills = NewIFText { 
		x = XPos, y = YPos, 
		textw = layout.width * 0.1, texth = layout.height,
		halign = "left", font = "gamefont_super_tiny", nocreatebackground=1, 
	}

	XPos = XPos + layout.width * 0.1
	Temp.deaths = NewIFText { 
		x = XPos, y = YPos, 
		textw = layout.width * 0.1, texth = layout.height,
		halign = "left", font = "gamefont_super_tiny", nocreatebackground=1, 
	}

	XPos = XPos + layout.width * 0.1
	Temp.cps = NewIFText { 
		x = XPos, y = YPos, 
		textw = layout.width * 0.1, texth = layout.height,
		halign = "left", font = "gamefont_super_tiny", nocreatebackground=1, 
	}

	return Temp
end

-- Helper function. For a destination item (previously created w/
-- CreateItem), fills it in with data, which may be nil (==blank it)
function MPSessionList_PlayerList_PopulateItem(Dest,Data)
	if(gBlankListbox) then
		-- Just wipe out the contents
		IFText_fnSetString(Dest.text,"")
		IFText_fnSetString(Dest.kills,"")
		IFText_fnSetString(Dest.deaths,"")
		IFText_fnSetString(Dest.cps,"")
	elseif (Data) then
		IFText_fnSetUString(Dest.text,Data.text)
		if(Data.kills) then
			IFText_fnSetString(Dest.kills,format("%s",Data.kills))
			IFText_fnSetString(Dest.deaths,format("%s",Data.deaths))
			IFText_fnSetString(Dest.cps,format("%s",Data.cps))
		end
		IFObj_fnSetVis(Dest,1)
	else
		IFObj_fnSetVis(Dest,nil)
	end
end

mpsessionlist_playerlist_layout = {
	showcount = 6,
--	yTop = -130 + 13,  -- auto-calc'd now
	yHeight = 20,
	ySpacing  = 0,
--	width = 260,
	x = 0,
	slider = 1,
	CreateFn = MPSessionList_PlayerList_CreateItem,
	PopulateFn = MPSessionList_PlayerList_PopulateItem,
}

mpsessionlist_playerlist_contents = {
	-- Filled in from C++ - NM 10/5/04
}

-- Helper function. Given a layout (x,y,width, height), returns a
-- fully-built item.
function MPSessionList_Servertypelist_CreateItem(layout)
	-- Make a coordinate system pegged to the top-left of where the cursor would go.
	local tinyH=ScriptCB_GetFontHeight("gamefont_tiny")
	local Temp = NewIFContainer { 
		x = layout.x - 0.5 * layout.width, y=layout.y,
	}

	local YPos = layout.height * -0.5 + 3
	Temp.text = NewIFText { 
		x = 10, y = YPos, 
		textw = layout.width - 20, texth = layout.height,
		halign = "left", font = "gamefont_super_tiny", nocreatebackground=1, 
	}

	return Temp
end

-- Helper function. For a destination item (previously created w/
-- CreateItem), fills it in with data, which may be nil (==blank it)
function MPSessionList_Servertypelist_PopulateItem(Dest,Data)
	if(gBlankListbox) then
		IFText_fnSetString(Dest.text,"")
	elseif (Data) then
		IFText_fnSetString(Dest.text,Data.text)
		IFObj_fnSetVis(Dest.text,1)
	else
		IFObj_fnSetVis(Dest.text,nil)
	end
end

mpsessionlist_servertypelist_layout = {
	showcount = 3,
--	yTop = -130 + 13,  -- auto-calc'd now
	yHeight = 15,
	ySpacing  = 0,
--	width = 260,
	x = 0,
--	slider = 1, -- not with 3 items
	CreateFn = MPSessionList_Servertypelist_CreateItem,
	PopulateFn = MPSessionList_Servertypelist_PopulateItem,
}

mpsessionlist_servertypelist_contents = {
	{ text = "ifs.gsprofile.all", },
	{ text = "ifs.mp.sessionlist.servertypes.pc", },
	{ text = "ifs.mp.sessionlist.servertypes.pcdedicated", },
}


-- Helper function. Given a layout (x,y,width, height), returns a
-- fully-built item.
function MPSessionList_Eratypelist_CreateItem(layout)
	-- Make a coordinate system pegged to the top-left of where the cursor would go.
	local tinyH=ScriptCB_GetFontHeight("gamefont_tiny")
	local Temp = NewIFContainer { 
		x = layout.x - 0.5 * layout.width, y=layout.y,
	}

	local YPos = layout.height * -0.5 + 3
	Temp.text = NewIFText { 
		x = 10, y = YPos, 
		textw = layout.width - 20, texth = layout.height,
		halign = "left", font = "gamefont_super_tiny", nocreatebackground=1, 
	}

	return Temp
end

-- Helper function. For a destination item (previously created w/
-- CreateItem), fills it in with data, which may be nil (==blank it)
function MPSessionList_Eratypelist_PopulateItem(Dest,Data)
	if(gBlankListbox) then
		IFText_fnSetString(Dest.text,"")
	elseif (Data) then
		IFText_fnSetString(Dest.text,Data.text)
		IFObj_fnSetVis(Dest.text,1)
	else
		IFObj_fnSetVis(Dest.text,nil)
	end
end

mpsessionlist_eratypelist_layout = {
	showcount = 3,
--	yTop = -130 + 13,  -- auto-calc'd now
	yHeight = 15,
	ySpacing  = 0,
--	width = 260,
	x = 0,
--	slider = 1, -- not with 3 items
	CreateFn = MPSessionList_Eratypelist_CreateItem,
	PopulateFn = MPSessionList_Eratypelist_PopulateItem,
}

mpsessionlist_eratypelist_contents = {
	{ text = "ifs.gsprofile.all", },
	{ text = "common.era.cw", },
	{ text = "common.era.gcw", },
}


-- Helper function. Given a layout (x,y,width, height), returns a
-- fully-built item.
function MPSessionList_Maplist_CreateItem(layout)
	-- Make a coordinate system pegged to the top-left of where the cursor would go.
	local tinyH=ScriptCB_GetFontHeight("gamefont_tiny")
	local Temp = NewIFContainer { 
		x = layout.x - 0.5 * layout.width, y=layout.y,
	}

	local YPos = layout.height * -0.5 + 3
	Temp.text = NewIFText { 
		x = 10, y = YPos, 
		textw = layout.width - 20, texth = layout.height,
		halign = "left", font = "gamefont_super_tiny", nocreatebackground=1, 
	}

	return Temp
end

-- Helper function. For a destination item (previously created w/
-- CreateItem), fills it in with data, which may be nil (==blank it)
function MPSessionList_Maplist_PopulateItem(Dest,Data)
	if(gBlankListbox) then
		IFText_fnSetString(Dest.text,"")
	elseif (Data) then
		IFText_fnSetString(Dest.text,Data.showstr)
		IFObj_fnSetVis(Dest.text,1)
	else
		IFObj_fnSetVis(Dest.text,nil)
	end
end

-- Filled in below
mpsessionlist_maplist_contents = {
	{ showstr = "ifs.gsprofile.all", mapluafile = "ifs.gsprofile.all"},
}

mpsessionlist_maplist_layout = {
	showcount = 3,
--	yTop = -130 + 13,  -- auto-calc'd now
	yHeight = 15,
	ySpacing  = 0,
--	width = 260,
	x = 0,
	slider = 1, -- not with 3 items
	CreateFn = MPSessionList_Maplist_CreateItem,
	PopulateFn = MPSessionList_Maplist_PopulateItem,
}


-- Callbacks from the busy popup
-- Returns -1, 0, or 1, depending on error, busy, or success
function ifs_sessionlist_joinpopup_fnCheckDone()
--	local this = ifs_sessionlist_joinpopup
	ScriptCB_UpdateJoin() -- think...

	return ScriptCB_IsJoinDone()
end

function ifs_sessionlist_joinpopup_fnOnSuccess()
	--
	-- show listbox again, just in case we cancel on the next screen
	local this = ifs_mp_sessionlist
	ifs_mp_sessionlist_fnShowHideInterface(this,nil)
	ifs_sessionlist_joinpopup_fnShowListbox(this,1)

	Popup_Busy:fnActivate(nil)
	
	ScriptCB_LaunchJoin()
	if(ScriptCB_AreMetagameRulesOn()) then
		ifs_movietrans_PushScreen(ifs_meta_top)
	else
		--ifs_movietrans_PushScreen(ifs_mp_lobby)
		-- go to the quick lunch lobby
		ifs_movietrans_PushScreen(ifs_mp_lobby_quick)
	end
end

function ifs_sessionlist_joinpopup_fnOnFail()
	print("Join failed")

	local this = ifs_mp_sessionlist
	ifs_mp_sessionlist_fnShowHideInterface(this,nil)
	ifs_sessionlist_joinpopup_fnShowListbox(this,1)

 	Popup_Busy:fnActivate(nil)
	ScriptCB_SetInNetGame(nil)
	ScriptCB_CancelSessionList()
	ScriptCB_BeginSessionList()
-- 	Popup_YesNo.CurButton = "no" -- default
-- 	Popup_YesNo.fnDone = ifs_xlive_main_fnAskCreateDone
-- 	IFText_fnSetString(Popup_YesNo.title,"ifs.quickopti.nonefound")
-- 	Popup_YesNo:fnActivate(1)
end

-- User hit cancel. Do what they want.
function ifs_sessionlist_joinpopup_fnOnCancel()
	print("Join canceled")
	local this = ifs_mp_sessionlist

	-- Stop logging in.
	ScriptCB_CancelJoin()
	ifs_mp_sessionlist_fnShowHideInterface(this,nil)

	-- Get rid of popup, turn this screen back on
	Popup_Busy:fnActivate(nil)
	ifs_sessionlist_joinpopup_fnShowListbox(this,1)
	ScriptCB_SetInNetGame(nil)
	ScriptCB_CancelSessionList()
	ScriptCB_BeginSessionList()
end

-- Callbacks from the busy popup
-- Returns -1, 0, or 1, depending on error, busy, or success
function ifs_sessionlist_rejoinpopup_fnCheckDone()
--	local this = ifs_sessionlist_joinpopup
	ScriptCB_UpdateSessionList()  -- think...
	return 0 -- still busy
end

function ifs_sessionlist_rejoinpopup_fnOnSuccess()
	print("reJoin success")
	local this = ifs_mp_sessionlist
	Popup_Busy:fnActivate(nil)
end

function ifs_sessionlist_rejoinpopup_fnOnFail()
	print("reJoin failed")

	local this = ifs_mp_sessionlist
	ifs_mp_sessionlist_fnShowHideInterface(this,nil)
	ifs_sessionlist_joinpopup_fnShowListbox(this,1)

 	Popup_Busy:fnActivate(nil)
	ScriptCB_SetInNetGame(nil)
	ScriptCB_CancelSessionList()
	ScriptCB_BeginSessionList()
-- 	Popup_YesNo.CurButton = "no" -- default
-- 	Popup_YesNo.fnDone = ifs_xlive_main_fnAskCreateDone
-- 	IFText_fnSetString(Popup_YesNo.title,"ifs.quickopti.nonefound")
-- 	Popup_YesNo:fnActivate(1)
end

-- User hit cancel. Do what they want.
function ifs_sessionlist_rejoinpopup_fnOnCancel()
	local this = ifs_mp_sessionlist

	print("reJoin cancel")
	ScriptCB_SetInNetGame(nil) 
	ScriptCB_CancelSessionList()

	-- Get rid of popup, turn this screen back on
	Popup_Busy:fnActivate(nil)
	ifs_mp_sessionlist_fnShowHideInterface(this,nil)
	ifs_sessionlist_joinpopup_fnShowListbox(this,1)
	ScriptCB_SetInNetGame(nil)
	ScriptCB_CancelSessionList()
	ScriptCB_BeginSessionList()
end


-- Callbacks from the busy popup
-- Returns -1, 0, or 1, depending on error, busy, or success
function ifs_sessionlist_optisearch_fnCheckDone()
--	local this = ifs_sessionlist_joinpopup
	ScriptCB_UpdateSessionList()  -- think...
	return 0 -- still busy
end

function ifs_sessionlist_optisearch_fnOnSuccess()
	print("optisearch success")
	local this = ifs_mp_sessionlist
	ifs_mp_sessionlist_fnShowHideInterface(this,nil)
	ifs_sessionlist_joinpopup_fnShowListbox(this,1)
	Popup_Busy:fnActivate(nil)
end

-- Callbacks from the "No sessions found, create one?" popup. If
-- bResult is true, they selected 'yes'
function ifs_mp_sessionlist_fnAskCreateDone(bResult)
	local this = ifs_mp_sessionlist
	ifs_mp_sessionlist_fnShowHideInterface(this,nil)
	ifs_sessionlist_joinpopup_fnShowListbox(this,1)

	if(bResult) then
		ifs_mp_main.bHostOnEnter = 1
	end
	ScriptCB_PopScreen("ifs_mp_main")
end

function ifs_sessionlist_optisearch_fnOnFail()
	print("optisearch OnFail")

	local this = ifs_mp_sessionlist
 	Popup_Busy:fnActivate(nil)

 	Popup_YesNo.CurButton = "no" -- default
 	Popup_YesNo.fnDone = ifs_mp_sessionlist_fnAskCreateDone
 	IFText_fnSetString(Popup_YesNo.title,"ifs.quickopti.nonefound")
 	Popup_YesNo:fnActivate(1)

end

-- User hit cancel. Do what they want.
function ifs_sessionlist_optisearch_fnOnCancel()
	print("optisearch cancel")
	local this = ifs_mp_sessionlist
	ifs_mp_sessionlist_fnShowHideInterface(this,nil)
	ifs_sessionlist_joinpopup_fnShowListbox(this,1)

	-- Get rid of popup, back out
	Popup_Busy:fnActivate(nil)
	ScriptCB_PopScreen()
end

-- Callbacks from the busy popup
-- Returns -1, 0, or 1, depending on error, busy, or success
function ifs_sessionlist_refresh_fnCheckDone()
--	local this = ifs_sessionlist_joinpopup

	-- Jump to top of listbox as long as we're up.
	if(getn(mpsessionlist_listbox_contents) > 0) then
		mpsessionlist_listbox_layout.SelectedIdx = 1
	end
	ScriptCB_UpdateSessionList()  -- think...

	if((gOnlineServiceStr ~= "LAN") and (ScriptCB_GetSessionListPercent)) then
		local iPercentDone = ScriptCB_GetSessionListPercent()
		if(iPercentDone > 100) then
			return 1
		end
		local ShowStr = format("%d%%", iPercentDone)
		IFText_fnSetString(Popup_Busy.BusyTimeStr,ShowStr)
	end

	return 0 -- still busy
end

function ifs_sessionlist_refresh_fnOnSuccess()
	print("refresh success")
	local this = ifs_mp_sessionlist
	ifs_mp_sessionlist_fnShowHideInterface(this,nil)
	ifs_sessionlist_joinpopup_fnShowListbox(this,1)
	Popup_Busy:fnActivate(nil)
end

function ifs_sessionlist_refresh_fnOnFail()
	print("refresh failed")
	local this = ifs_mp_sessionlist
	ifs_mp_sessionlist_fnShowHideInterface(this,nil)
	ifs_sessionlist_joinpopup_fnShowListbox(this,1)
	Popup_Busy:fnActivate(nil)
	if(ScriptCB_PauseSessionList) then
		ScriptCB_PauseSessionList()
	end
end

-- User hit cancel. Do what they want.
function ifs_sessionlist_refresh_fnOnCancel()
	print("refresh cancel")
	local this = ifs_mp_sessionlist
	ifs_mp_sessionlist_fnShowHideInterface(this,nil)
	ifs_sessionlist_joinpopup_fnShowListbox(this,1)
	Popup_Busy:fnActivate(nil)
	if(ScriptCB_PauseSessionList) then
		ScriptCB_PauseSessionList()
	end
end

-- "Server is running the wrong version" popup has been dismissed
function ifs_mp_sessionlist_fnWrongVerOk()
	local this = ifs_mp_sessionlist
	ifs_mp_sessionlist_fnShowHideInterface(this,nil)
end

function ifs_mp_sessionlist_fnBadNetworkPopupDone(bResult)
	local this = ifs_mp_sessionlist

	if(bResult) then
		ifs_mp_sessionlist_fnStartJoin(this)
	else
		ifs_mp_sessionlist_fnShowHideInterface(this,nil)
		ifs_sessionlist_joinpopup_fnShowListbox(this,1)
	end
end

function ifs_mp_sessionlist_fnBadNetworkPopupDonePassword(bResult)
	local this = ifs_mp_sessionlist

	if(bResult) then
		ifs_mp_sessionlist_fnStartJoin(this,this.LastPasswordStr)
	else
		ifs_mp_sessionlist_fnShowHideInterface(this,nil)
		ifs_sessionlist_joinpopup_fnShowListbox(this,1)
	end
end

function ifs_sessionlist_ClearSessionInfo()
	mpsessioninfo.era = "common.era.cw"
	mpsessioninfo.map = ""
end

-- Helper function: filters have changed. [Re]apply them.
function ifs_mp_sessionlist_fnApplyFilters(this)
	local Selection
	local sNameFilter, sPlayersFilter, sMapFilter, sEraFilter, sPingFilter, sTypeFilter

	-- DEBUG code - temp init of values
	sNameFilter = IFEditbox_fnGetString(this.DropBoxes.filter_gamename)
	sPlayersFilter = IFEditbox_fnGetString(this.DropBoxes.filter_numplayers)
	sPingFilter = IFEditbox_fnGetString(this.DropBoxes.filter_ping)
	
	Selection = mpsessionlist_maplist_contents[mpsessionlist_maplist_layout.SelectedIdx]
	sMapFilter = Selection.mapluafile

	Selection = mpsessionlist_eratypelist_contents[mpsessionlist_eratypelist_layout.SelectedIdx]
	sEraFilter = Selection.text

	Selection = mpsessionlist_servertypelist_contents[mpsessionlist_servertypelist_layout.SelectedIdx]
	sTypeFilter = Selection.text

	if(ScriptCB_ApplyFilters) then
		ScriptCB_ApplyFilters(sNameFilter, sPlayersFilter, sMapFilter, sEraFilter, sPingFilter, sTypeFilter)
	end
end

-- Helper function - reads selections from the filter dropboxes,
-- updates their text
function ifs_mp_sessionlist_fnUpdateFilterText(this)
	local Selection
	
	Selection = mpsessionlist_maplist_contents[mpsessionlist_maplist_layout.SelectedIdx]
	IFText_fnSetString(this.DropBoxes.filter_mapname.showtext,Selection.showstr)

	Selection = mpsessionlist_eratypelist_contents[mpsessionlist_eratypelist_layout.SelectedIdx]
	IFText_fnSetString(this.DropBoxes.filter_era.showtext,Selection.text)

	Selection = mpsessionlist_servertypelist_contents[mpsessionlist_servertypelist_layout.SelectedIdx]
	IFText_fnSetString(this.DropBoxes.filter_servertypeLabel.showtext,Selection.text)

	ifs_mp_sessionlist_fnApplyFilters(this)
end

-- Helper function. Turns listbox on/off, as requested
function ifs_sessionlist_joinpopup_fnShowListbox(this,bVis)
	local A1,A2
	if(bVis) then
		A1 = 0
		A2 = 1
	else
		A1 = 1
		A2 = 0
	end

	AnimationMgr_AddAnimation(this.listbox,{ fTotalTime = 0.2, fStartAlpha = A1, fEndAlpha = A2, })
	AnimationMgr_AddAnimation(this.serverinfo,{ fTotalTime = 0.2, fStartAlpha = A1, fEndAlpha = A2, })
	AnimationMgr_AddAnimation(this.playerlist,{ fTotalTime = 0.2, fStartAlpha = A1, fEndAlpha = A2, })
	AnimationMgr_AddAnimation(this.DropBoxes,{ fTotalTime = 0.2, fStartAlpha = A1, fEndAlpha = A2, })
	AnimationMgr_AddAnimation(this.filtertitle,{ fTotalTime = 0.2, fStartAlpha = A1, fEndAlpha = A2, })
	AnimationMgr_AddAnimation(this.refreshbutton,{ fTotalTime = 0.2, fStartAlpha = A1, fEndAlpha = A2, })
	AnimationMgr_AddAnimation(this.donebutton,{ fTotalTime = 0.2, fStartAlpha = A1, fEndAlpha = A2, })

end

-- Helper function, shows/hides the interface items on this page
function ifs_mp_sessionlist_fnShowHideInterface(this, bHideInterface)
	IFObj_fnSetVis(this.listbox, not bHideInterface)
	IFObj_fnSetVis(this.DropBoxes, not bHideInterface)
	IFObj_fnSetVis(this.ResortButtons, not bHideInterface)
	IFObj_fnSetVis(this.serverinfo, not bHideInterface)
	IFObj_fnSetVis(this.playerlist, (not bHideInterface) and (gOnlineServiceStr ~= "LAN"))
	IFObj_fnSetVis(this.title, not bHideInterface)
	IFObj_fnSetVis(this.filtertitle, not bHideInterface)
	IFObj_fnSetVis(this.refreshbutton, not bHideInterface)
	IFObj_fnSetVis(this.donebutton, not bHideInterface)
end

-- Shows a specified dropbox. If sWhich is nil, none are shown
function ifs_mp_sessionlist_fnShowDropbox(this, sWhich)

	-- Turn off everything by default
	IFObj_fnSetVis(this.maplistbox, nil)
	IFObj_fnSetVis(this.eralistbox, nil)
	IFObj_fnSetVis(this.serverlistbox, nil)
	IFObj_fnSetVis(this.DropBoxes, 1)
	IFObj_fnSetVis(this.ResortButtons, 1)
	IFObj_fnSetVis(this.listbox, 1)

	if(not sWhich) then
		this.bDropBoxesOpen = nil
		ifs_mp_sessionlist_fnUpdateFilterText(this) -- in case anything changed
		return
	end

	-- If we got here, hide main listbox to give space to read things
	-- [Map overlaps the main list, which causes dueling cursors]. This
	-- seems quirky, but seems to work better than anything else 
	IFObj_fnSetVis(this.DropBoxes, nil)
	IFObj_fnSetVis(this.ResortButtons, nil)
	IFObj_fnSetVis(this.listbox, nil)
	this.bDropBoxesOpen = 1

	if (sWhich == "era") then
		IFObj_fnSetVis(this.eralistbox, 1)
	elseif (sWhich == "map") then
		IFObj_fnSetVis(this.maplistbox, 1)
	elseif (sWhich == "servertype") then
		IFObj_fnSetVis(this.serverlistbox, 1)
	end
end


-- Starts the join. PasswordStr may be nil
function ifs_mp_sessionlist_fnStartJoin(this,PasswordStr)
	ifs_mp_sessionlist_fnShowHideInterface(this,1)
	ifs_sessionlist_joinpopup_fnShowListbox(this,nil)
	
	Popup_Busy.fnCheckDone = ifs_sessionlist_joinpopup_fnCheckDone
	Popup_Busy.fnOnSuccess = ifs_sessionlist_joinpopup_fnOnSuccess
	Popup_Busy.fnOnFail = ifs_sessionlist_joinpopup_fnOnFail
	Popup_Busy.fnOnCancel = ifs_sessionlist_joinpopup_fnOnCancel
	Popup_Busy.bNoCancel = nil -- allow cancel button
	Popup_Busy.fTimeout = 60 -- seconds
	IFText_fnSetString(Popup_Busy.title,"common.mp.joining")
	Popup_Busy:fnActivate(1)
	
	ScriptCB_BeginJoin(PasswordStr)
end

-- Callback function when the virtual keyboard is done
function ifs_mp_sessionlist_fnKeyboardDone()
--	print("ifs_mp_gameopts_fnKeyboardDone()")
	local this = ifs_mp_sessionlist
	this.LastPasswordStr = ScriptCB_ununicode(ifs_vkeyboard.CurString)
	this.bPasswordJoinOnEnter = 1
	ScriptCB_PopScreen()
--	vkeyboard_specs.fnDone = nil -- clear our registration there
end

-- Callback function from VK - returns 2 values, whether the current
-- string is allowed to be entered, and a localize database key string
-- as to why it's not acceptable.
function ifs_mp_sessionlist_fnIsAcceptable()
--	print("ifs_mp_gameopts_fnIsAcceptable()")
	return 1,""
end

-- Reads this.iSortMode, sets text to match
function ifs_mp_sessionlist_UpdateSortModeText(this)
	local C1 = 0
	local C2 = 0
	local C3 = 0
	local C4 = 0

	if(this.bShowRefresh) then
		if(this.iSortMode == 1) then
			C1 = 255
		elseif (this.iSortMode == 2) then
			C2 = 255
		elseif (this.iSortMode == 3) then
			C3 = 255
		elseif (this.iSortMode == 4) then
			C4 = 255
		end
	end

--	ScriptCB_IFFlashyText_SetTextColor(this.ResortButtons.numplayersLabel.cpointer, C1, C1, C1)
--	ScriptCB_IFFlashyText_SetTextColor(this.ResortButtons.namefieldLabel.cpointer , C2, C2, C2)
--	ScriptCB_IFFlashyText_SetTextColor(this.ResortButtons.servertypeLabel.cpointer, C3, C3, C3)
--	ScriptCB_IFFlashyText_SetTextColor(this.ResortButtons.pingLabel.cpointer      , C4, C4, C4)
end

function ifs_mp_sessionlist_fnDoRefresh(this)
	if(this.bShowRefresh) then -- XLive doesn't do refresh/resort
		ScriptCB_CancelSessionList()
		ifs_sessionlist_ClearSessionInfo()
		ListManager_fnFillContents(this.listbox,mpsessionlist_listbox_contents,mpsessionlist_listbox_layout)
		ifs_mp_sessionlist_fnShowHideInterface(this,1)
		ifs_sessionlist_joinpopup_fnShowListbox(this,nil)
		ScriptCB_SetInNetGame(nil)
		ScriptCB_BeginSessionList()

		if(gOnlineServiceStr == "LAN") then
			Popup_Busy.bCallerSetsString = nil
			Popup_Busy.fTimeout = 3 -- seconds
			IFText_fnSetString(Popup_Busy.BusyTimeStr,"")
		else
			Popup_Busy.bCallerSetsString = 1 -- we'll manage the text ourselves
			Popup_Busy.fTimeout = 15 -- seconds
			IFText_fnSetString(Popup_Busy.BusyTimeStr,"0%") -- pre-fill the string
		end

		Popup_Busy.fnCheckDone = ifs_sessionlist_refresh_fnCheckDone
		Popup_Busy.fnOnSuccess = ifs_sessionlist_refresh_fnOnSuccess
		Popup_Busy.fnOnFail = ifs_sessionlist_refresh_fnOnFail
		Popup_Busy.fnOnCancel = ifs_sessionlist_refresh_fnOnCancel
		Popup_Busy.bNoCancel = nil -- allow cancel button
		IFText_fnSetString(Popup_Busy.title,"ifs.subHardDrive.busy")
		Popup_Busy:fnActivate(1)
	end
end

-- Helper function, shows/hides stats as appropriate
function ifs_mp_sessionlist_fnShowStats(this)
	if((this.iNumSessions > 0) and (gOnlineServiceStr == "GameSpy")) then
		local ShowUStr = ScriptCB_usprintf("ifs.mp.sessionlist.totalservers", 
																			 ScriptCB_tounicode(format("%d",this.iNumSessions)))
		IFText_fnSetUString(this.listbox.SessionCount, ShowUStr)

		ShowUStr = ScriptCB_usprintf("ifs.mp.sessionlist.totalplayers", 
																 ScriptCB_tounicode(format("%d/%d",this.iNumPlayers,this.iMaxPlayers)))
		IFText_fnSetUString(this.listbox.PlayerCount, ShowUStr)
		IFObj_fnSetVis(this.listbox.SessionCount, 1)
		IFObj_fnSetVis(this.listbox.PlayerCount, 1)
	else
		IFObj_fnSetVis(this.listbox.SessionCount, nil)
		IFObj_fnSetVis(this.listbox.PlayerCount, nil)
	end
end


ifs_mp_sessionlist = NewIFShellScreen {
	nologo = 1,
	bg_texture = "iface_bgmeta_space",
	movieIntro      = nil,
	movieBackground = nil,
	iSortMode = 1,

	Helptext_Refresh = NewIFContainer {
		ScreenRelativeX = 0.0, -- left
		ScreenRelativeY = 1.0, -- bottom
		y = -50, -- top row of buttons
		x = 0,

		icon = NewIFImage { 
			ZPos = 200, -- behind most.

			texture = "btnmisc", 
			localpos_l = 0,
			localpos_t = -11,
			localpos_r = 20,
			localpos_b =  11,
		},

		helpstr = NewIFText {
			string = "ifs.mp.sessionlist.refresh",
			font = "gamefont_medium",
			textw = 460,
			x = 25,
			y = -15,
			halign = "left",
			nocreatebackground=1,			
		},
	},

	Helptext_SortMode = NewIFContainer {
		ScreenRelativeX = 1.0, -- right
		ScreenRelativeY = 1.0, -- bot
		y = -50,

		icon = NewIFImage { 
			ZPos = 200, -- behind most.

			texture = "btnmisc2", 
			localpos_l = -10,
			localpos_t = -11,
			localpos_r = 10,
			localpos_b = 11,
			inert = 1, -- Delete this out of lua once created (we'll never touch it again)
		},

		helpstr = NewIFText {
			string = "ifs.mp.sessionlist.sortby",
			font = "gamefont_medium",
			textw = 460,
			x = -460,
			y = -15,
			halign = "right",
			nocreatebackground = 1,
		},
	},

	title = NewIFText {
		string = "ifs.mp.sessionlist.title",
		font = "gamefont_small",
		y = -20,
		textw = 460, -- center on screen. Fixme: do real centering!
		ScreenRelativeX = 0.5, -- center
		ScreenRelativeY = 0, -- top
		nocreatebackground = 1, 
	},

	filtertitle = NewIFText {
		string = "ifs.onlinelobby.filters",
		font = "gamefont_tiny",
		y = 0,
		x = -15,
		textw = 460,
		halign = "left",
		ScreenRelativeX = 0, -- left
		ScreenRelativeY = 0, -- top
		nocreatebackground = 1, 
	},

	buttons = NewIFContainer {
		ScreenRelativeX = 1.0, -- right
		ScreenRelativeY = 0, -- top
		y = 20, -- pixels down from the top
	},

	Gamespy_IconL = NewIFImage {
		ScreenRelativeX = 1.0, -- right
		ScreenRelativeY = 0.0, -- top
		x = -30,
		y = 5,
		texture = "gamespy_logo_128x32l",
		localpos_l = -64,
		localpos_t = -32,
		localpos_r = 0,
		localpos_b = 0,
	},

	Gamespy_IconR = NewIFImage {
		ScreenRelativeX = 1.0, -- center
		ScreenRelativeY = 0.0, -- bottom
		x = -30,
		y = 5,
		texture = "gamespy_logo_128x32r",
		localpos_l = 0,
		localpos_t = -32,
		localpos_r = 64,
		localpos_b = 0,
	},

	bFirstTime = 1,
	Enter = function(this, bFwd)
		-- Always call base class
--		if ( gOnlineServiceStr == "GameSpy") then
--			IFObj_fnSetAlpha(this.buttons.gamespy,1.0)
--			IFObj_fnSetAlpha(this.buttons.lan,.4)
--		else 
--			IFObj_fnSetAlpha(this.buttons.gamespy,.4)
--			IFObj_fnSetAlpha(this.buttons.lan,1.0)
--		end
		gIFShellScreenTemplate_fnEnter(this, bFwd)
		missionselect_listbox_contents = mp_missionselect_listbox_contents

		if(this.bFirstTime) then
			this.bFirstTime = nil
			IFEditbox_fnSetString(this.DropBoxes.filter_numplayers,"0")
			IFEditbox_fnSetString(this.DropBoxes.filter_ping, "9999")
		end

		gIFShellScreenTemplate_fnMoveIcon(this.Helptext_SortMode)
		-- right align the done button	
		gIFShellScreenTemplate_fnMoveClickableButton(this.donebutton,this.donebutton.btn.label,0)

		IFObj_fnSetVis(this.PassBox, nil) -- off by default
		this.bPasswordMode = nil

		ifs_mp_sessionlist_fnShowDropbox(this, nil)
		ifs_mp_sessionlist_fnShowStats(this)

		local bIsGamespy = (gOnlineServiceStr == "GameSpy")
		IFObj_fnSetVis(this.Gamespy_IconL, bIsGamespy)
		IFObj_fnSetVis(this.Gamespy_IconR, bIsGamespy)
		this.bShowRefresh = (gOnlineServiceStr ~= "XLive")
		IFObj_fnSetVis(this.Helptext_Refresh, nil)
		IFObj_fnSetVis(this.Helptext_SortMode, nil)

		if(ScriptCB_GetSessionSortMode) then
			this.iSortMode = ScriptCB_GetSessionSortMode()
		end
		ifs_mp_sessionlist_UpdateSortModeText(this)

		-- Added chunk for error handling...
		if(not bFwd) then
			local ErrorLevel,ErrorMessage = ScriptCB_GetError()
			print("Entering sessionlist, ErrorLevel = ",ErrorLevel)
			if(ErrorLevel >= 6) then -- session or login error, must keep going further
				ScriptCB_PopScreen()
			else
				ScriptCB_ClearError()
			end
		end


		ifs_sessionlist_joinpopup_fnShowListbox(this,1)

		if(bFwd or this.bForceRefresh) then
			this.bForceRefresh = nil

			-- Blast list initially on entry
			ScriptCB_CancelSessionList()
			ifs_sessionlist_ClearSessionInfo()
			this.bInOptiSearch = nil

			-- Reset listbox, show it. [Remember, Lua starts at 1!]
			mpsessionlist_listbox_layout.FirstShownIdx = 1
			mpsessionlist_listbox_layout.SelectedIdx = 1
			mpsessionlist_listbox_layout.CursorIdx = nil
			
			ListManager_fnFillContents(this.listbox,mpsessionlist_listbox_contents,mpsessionlist_listbox_layout)

			mpsessionlist_serverinfo_layout.FirstShownIdx = 1
			mpsessionlist_serverinfo_layout.SelectedIdx = 1
			mpsessionlist_serverinfo_layout.CursorIdx = 1
			ListManager_fnFillContents(this.serverinfo,mpsessionlist_serverinfo_contents,mpsessionlist_serverinfo_layout)

			mpsessionlist_playerlist_layout.FirstShownIdx = 1
			mpsessionlist_playerlist_layout.SelectedIdx = 1
			mpsessionlist_playerlist_layout.CursorIdx = 1
			ListManager_fnFillContents(this.playerlist,mpsessionlist_playerlist_contents,mpsessionlist_playerlist_layout)

			if(not this.bCopiedMaplist) then
				this.bCopiedMaplist = 1
				-- Copy over maplist, with an 'all' as the first entry
				local i
				for i=1,getn(mp_missionselect_listbox_contents) do
					mpsessionlist_maplist_contents[i+1] = mp_missionselect_listbox_contents[i]
				end
			end

			mpsessionlist_maplist_layout.FirstShownIdx = 1
			mpsessionlist_maplist_layout.SelectedIdx = 1
			mpsessionlist_maplist_layout.CursorIdx = 1
			ListManager_fnFillContents(this.maplistbox,mpsessionlist_maplist_contents,mpsessionlist_maplist_layout)

			mpsessionlist_eratypelist_layout.FirstShownIdx = 1
			mpsessionlist_eratypelist_layout.SelectedIdx = 1
			mpsessionlist_eratypelist_layout.CursorIdx = 1
			ListManager_fnFillContents(this.eralistbox,mpsessionlist_eratypelist_contents,mpsessionlist_eratypelist_layout)

			mpsessionlist_servertypelist_layout.FirstShownIdx = 1
			mpsessionlist_servertypelist_layout.SelectedIdx = 1
			mpsessionlist_servertypelist_layout.CursorIdx = 1
			ListManager_fnFillContents(this.serverlistbox,mpsessionlist_servertypelist_contents,mpsessionlist_servertypelist_layout)

			ifs_mp_sessionlist_fnUpdateFilterText(this)

			local bHideInterface = ScriptCB_BeginSessionList()
			ifs_mp_sessionlist_fnShowHideInterface(this, bHideInterface)
			this.bWaitingForPrevSession = bHideInterface
			if(bHideInterface) then
				Popup_Busy.fnCheckDone = ifs_sessionlist_rejoinpopup_fnCheckDone
				Popup_Busy.fnOnSuccess = ifs_sessionlist_rejoinpopup_fnOnSuccess
				Popup_Busy.fnOnFail = ifs_sessionlist_rejoinpopup_fnOnFail
				Popup_Busy.fnOnCancel = ifs_sessionlist_rejoinpopup_fnOnCancel
				Popup_Busy.bNoCancel = nil -- allow cancel button
				Popup_Busy.fTimeout = 120 -- seconds
				IFText_fnSetString(Popup_Busy.title,"ifs.subHardDrive.busy")
				Popup_Busy:fnActivate(1)
			elseif (not this.bShowRefresh) then
				ifs_mp_sessionlist_fnShowHideInterface(this,1)
				ifs_sessionlist_joinpopup_fnShowListbox(this,nil)
				Popup_Busy.fnCheckDone = ifs_sessionlist_optisearch_fnCheckDone
				Popup_Busy.fnOnSuccess = ifs_sessionlist_optisearch_fnOnSuccess
				Popup_Busy.fnOnFail = ifs_sessionlist_optisearch_fnOnFail
				Popup_Busy.fnOnCancel = ifs_sessionlist_optisearch_fnOnCancel
				Popup_Busy.bNoCancel = nil -- allow cancel button
				Popup_Busy.fTimeout = 45 -- seconds
				IFText_fnSetString(Popup_Busy.title,"ifs.subHardDrive.busy")
				Popup_Busy:fnActivate(1)
				this.bInOptiSearch = 1
			elseif (gOnlineServiceStr ~= "LAN") then
				-- Normal entry to screen. Go busy for a few seconds
				ifs_mp_sessionlist_fnShowHideInterface(this,1)
				ifs_sessionlist_joinpopup_fnShowListbox(this,nil)
				Popup_Busy.bCallerSetsString = 1 -- we'll manage the text ourselves
				IFText_fnSetString(Popup_Busy.BusyTimeStr,"0%")
				Popup_Busy.fnCheckDone = ifs_sessionlist_refresh_fnCheckDone
				Popup_Busy.fnOnSuccess = ifs_sessionlist_refresh_fnOnSuccess
				Popup_Busy.fnOnFail = ifs_sessionlist_refresh_fnOnFail
				Popup_Busy.fnOnCancel = ifs_sessionlist_refresh_fnOnCancel
				Popup_Busy.bNoCancel = nil -- allow cancel button
				Popup_Busy.fTimeout = 15 -- seconds
				IFText_fnSetString(Popup_Busy.title,"ifs.subHardDrive.busy")
				Popup_Busy:fnActivate(1)
			end
		else
			-- backing into screen
			ListManager_fnFillContents(this.listbox,mpsessionlist_listbox_contents,mpsessionlist_listbox_layout)
			if(this.bPasswordJoinOnEnter) then
				if(gPlatformStr == "XBox") then
					if(ScriptCB_IsBadNetworkConnection()) then
						ifs_mp_sessionlist_fnShowHideInterface(this,1)
						ifs_sessionlist_joinpopup_fnShowListbox(this,nil)
						Popup_AB.CurButton = "no" -- default
						Popup_AB.fnDone = ifs_mp_sessionlist_fnBadNetworkPopupDonePassword
						IFText_fnSetString(Popup_AB.title,"ifs.mp.badconnection")
						Popup_AB:fnActivate(1)
					else
						ifs_mp_sessionlist_fnStartJoin(this,this.LastPasswordStr)
					end
				else
					ifs_mp_sessionlist_fnStartJoin(this,this.LastPasswordStr)
				end
			end
		end
		this.bPasswordJoinOnEnter = nil -- always clear this.

	end,

	Exit = function(this, bFwd)
		if (bFwd) then
			-- join ends the session list on fwd transition
		else
			ScriptCB_CancelSessionList()
			local ErrorLevel,ErrorMessage = ScriptCB_GetError()
			if (ErrorLevel == 6) then
				-- In-session error that requires leaving it. We know we're
				-- out of it now, can do things normally.
				ScriptCB_ClearError()
				IFText_fnSetString(this.serverinfo[4],NewStr)
			end
			if(gCurHiliteButton) then
				IFButton_fnSelect(gCurHiliteButton,nil)
			end			
			ifelm_shellscreen_fnPlaySound(this.exitSound)
		end
	end,

	LastPasswordStr = "",
	Input_Accept = function(this)
		
		if((not this.CurButton) and gMouseOverButtonWindow) then
			this.CurButton = gMouseOverButtonWindow.tag
		end
--		print("Input_Accept CurButton=",this.CurButton)

		if((this.bDropBoxesOpen) and (not gMouseListBox) and (not gMouseListBoxSlider)) then
			ifs_mp_sessionlist_fnShowDropbox(this, nil) -- click outside of boxes cancels them
		end

		-- If base class handled this work, then we're done
		if(gShellScreen_fnDefaultInputAccept(this)) then

			if((this.bDropBoxesOpen) and (not gMouseListBoxSlider)) then
				ifs_mp_sessionlist_fnShowDropbox(this, nil) -- click inside of boxes applies selection
				return
			end

			if(gMouseListBox) then
				--ScriptCB_SndPlaySound("shell_select_change")
				if( gMouseListBox.Layout.SelectedIdx == gMouseListBox.Layout.CursorIdx and this.lastDoubleClickTime and ScriptCB_GetMissionTime()<this.lastDoubleClickTime+0.4) then
					print("doing shortcut")
					this.lastDoubleClickTime = nil
					this.CurButton = "_ok"
				else
					this.lastDoubleClickTime = ScriptCB_GetMissionTime()
					gMouseListBox.Layout.SelectedIdx = gMouseListBox.Layout.CursorIdx
					return -- note we did all the work
				end
			else
				return
			end
		end

		if(this.bPasswordMode) then
			this.bPasswordMode = nil
			ifs_mp_sessionlist_fnShowHideInterface(this,nil)
			IFObj_fnSetVis(this.PassBox, nil)
			this.LastPasswordStr = IFEditbox_fnGetString(this.PassBox.passedit)
			ifs_mp_sessionlist_fnStartJoin(this,this.LastPasswordStr)
			return
		end


		if(this.CurButton == "lan" ) then
			ScriptCB_CancelSessionList()
			gOnlineServiceStr = "LAN"
			ScriptCB_SetConnectType("lan")
			this:Enter(1)
			this:Input_Misc()
		elseif (this.CurButton == "gamespy") then
			ScriptCB_CancelSessionList()
			gOnlineServiceStr = "GameSpy"
			ScriptCB_SetConnectType("wan")
			this:Enter(1)
		elseif (this.CurButton == "filter_mapname") then
			ifs_mp_sessionlist_fnShowDropbox(this,"map")
		elseif (this.CurButton == "filter_servertypeLabel") then
			ifs_mp_sessionlist_fnShowDropbox(this,"servertype")
		elseif (this.CurButton == "filter_era") then
			ifs_mp_sessionlist_fnShowDropbox(this,"era")
		elseif (this.CurButton == "_refresh") then
			ifs_mp_sessionlist_fnDoRefresh(this) -- this:Input_Misc()
			
--	1 = sort by num players
--  2 = sort by game name
--  3 = sort by server type
--  4 = sort by ping
--  5 = mapname
--  6 = era
		elseif (this.CurButton == "numplayers") then
			ScriptCB_SetSessionSortMode(1)
			ScriptCB_GetSessionList()
			--this:Input_Misc()
			this:RepaintListbox()
		elseif (this.CurButton == "ping") then
			ScriptCB_SetSessionSortMode(4)
			ScriptCB_GetSessionList()
			--this:Input_Misc()
			this:RepaintListbox()
		elseif (this.CurButton == "gamename") then
			ScriptCB_SetSessionSortMode(2)
			ScriptCB_GetSessionList()
			this:RepaintListbox()
		elseif (this.CurButton == "servertypeLabel") then	
			ScriptCB_SetSessionSortMode(3)
			ScriptCB_GetSessionList()
			this:RepaintListbox()
		elseif (this.CurButton == "mapname") then	
			ScriptCB_SetSessionSortMode(5)
			ScriptCB_GetSessionList()
			this:RepaintListbox()
		elseif (this.CurButton == "era") then	
			ScriptCB_SetSessionSortMode(6)
			ScriptCB_GetSessionList()
			this:RepaintListbox()
		elseif (this.CurButton == "_ok") then

			-- Can join only when the list has data in it.
			if(getn(mpsessionlist_listbox_contents) > 0) then
				if (ScriptCB_IsSessionReady()) then
					ifelm_shellscreen_fnPlaySound(this.acceptSound)

					local Selection = mpsessionlist_listbox_contents[mpsessionlist_listbox_layout.SelectedIdx]
					if (Selection.bWrongVer) then
						-- Wrong version. Can never join
						ifs_mp_sessionlist_fnShowHideInterface(this,1)
						Popup_Ok.fnDone = ifs_mp_sessionlist_fnWrongVerOk
						IFText_fnSetString(Popup_Ok.title,"ifs.onlinelobby.wrongver")
						Popup_Ok:fnActivate(1)

					elseif (Selection.bLocked) then
						if(gPlatformStr ~= "PC") then
							ifs_vkeyboard.CurString = ScriptCB_tounicode(this.LastPasswordStr)
							ifs_vkeyboard.bCursorOnLetters = 1 -- start cursor in top-left
							vkeyboard_specs.bPasswordMode = 1
							
							IFText_fnSetString(ifs_vkeyboard.title,"ifs.vkeyboard.title_password")
							ifs_movietrans_PushScreen(ifs_vkeyboard)
							vkeyboard_specs.fnDone = ifs_mp_sessionlist_fnKeyboardDone
							vkeyboard_specs.fnIsOk = ifs_mp_sessionlist_fnIsAcceptable
							
							local w,h = ScriptCB_GetSafeScreenInfo() -- of the usable screen
							vkeyboard_specs.MaxWidth = (w * 0.5)
							vkeyboard_specs.MaxLen = 16
						else
							this.bPasswordMode = 1
							ifs_mp_sessionlist_fnShowHideInterface(this,1)
							IFObj_fnSetVis(this.PassBox, 1)
						end
					else
						if(gPlatformStr == "XBox") then
							if(ScriptCB_IsBadNetworkConnection()) then
								ifs_mp_sessionlist_fnShowHideInterface(this,1)
								ifs_sessionlist_joinpopup_fnShowListbox(this,nil)
								Popup_AB.CurButton = "no" -- default
								Popup_AB.fnDone = ifs_mp_sessionlist_fnBadNetworkPopupDone
								IFText_fnSetString(Popup_AB.title,"ifs.mp.badconnection")
								Popup_AB:fnActivate(1)
							else
								ifs_mp_sessionlist_fnStartJoin(this)
							end
						else
							ifs_mp_sessionlist_fnStartJoin(this)
						end
					end
				else
					ifelm_shellscreen_fnPlaySound(this.errorSound)
					-- 				print("SessionNotReady")
				end
				-- 		else
				-- 			print("Session listbox contents too short")
			end
		end
	end,

	Input_Back = function(this)
		if(this.bPasswordMode) then
			ifs_mp_sessionlist_fnShowHideInterface(this,nil)
			IFObj_fnSetVis(this.PassBox, nil)
			this.bPasswordMode = nil
		else
			ScriptCB_PopScreen()
		end
	end,

	Input_KeyDown = function(this, iKey)
		if(gCurEditbox) then
			this.bKeyPressed = 1
			if((iKey == 10) or (iKey == 13)) then -- handle Enter different
				if(this.bPasswordMode) then
					ifs_mp_sessionlist_fnShowHideInterface(this,nil)
					IFObj_fnSetVis(this.PassBox, nil)
					this.bPasswordMode = nil
					this.LastPasswordStr = IFEditbox_fnGetString(this.PassBox.passedit)
					ifs_mp_sessionlist_fnStartJoin(this,this.LastPasswordStr)
				else
					-- not password mode
					ifs_mp_sessionlist_fnApplyFilters(this)
				end

--				gCurEditbox = nil
			else
				IFEditbox_fnAddChar(gCurEditbox, iKey)
			end
		end
	end,


	fnFindReady = function(this)
		if(this.bWaitingForPrevSession) then
			-- Only do this once on waiting for a previous session to be ready
			this.bWaitingForPrevSession = nil
			ifs_sessionlist_rejoinpopup_fnOnSuccess() -- fake it.
			ifs_mp_sessionlist_fnStartJoin(this)
			Popup_Busy.fTimeout = 120 -- seconds
		end
	end,

	Input_GeneralUp = function(this)
		-- If base class handled this work, then we're done
		if(gShellScreen_fnDefaultInputUp(this)) then
			return
		end
		if(gPlatformStr ~= "PC") then
			ListManager_fnNavUp(this.listbox,mpsessionlist_listbox_contents,mpsessionlist_listbox_layout)
		end
	end,

	Input_GeneralDown = function(this)
		-- If base class handled this work, then we're done
		if(gShellScreen_fnDefaultInputDown(this)) then
			return
		end
		if(gPlatformStr ~= "PC") then
			ListManager_fnNavDown(this.listbox,mpsessionlist_listbox_contents,mpsessionlist_listbox_layout)
		end
	end,

	Input_LTrigger = function(this)
		if(getn(mpsessionlist_listbox_contents) > 0) then
			ListManager_fnPageUp(this.listbox,mpsessionlist_listbox_contents,mpsessionlist_listbox_layout)
		end
	end,

	Input_RTrigger = function(this)
		if(getn(mpsessionlist_listbox_contents) > 0) then
			ListManager_fnPageDown(this.listbox,mpsessionlist_listbox_contents,mpsessionlist_listbox_layout)
		end
	end,

	-- No L/R functionality possible on this screen (gotta have stubs
	-- here, or the base class will override)
	Input_GeneralLeft = function(this)
	end,
	Input_GeneralRight = function(this)
	end,

	fExtraInfoTimer = 1.0,
	Update = function(this, fDt)
		-- Call default base class's update function (make button bounce)
		gIFShellScreenTemplate_fnUpdate(this,fDt)
		ScriptCB_UpdateSessionList()

		-- If the user moves off an edit box they typed in, then apply things
		local bLastEdit = this.bOverEdit
		if(gCurEditbox) then
			this.bOverEdit = 1
		else
			this.bOverEdit = nil
		end
		if(bLastEdit and this.bKeyPressed and (not this.bOverEdit)) then
			ifs_mp_sessionlist_fnApplyFilters(this)
			this.bKeyPressed = nil
		end

		this.fExtraInfoTimer = this.fExtraInfoTimer - fDt

		-- If the selection changes, then blank the extra info box.
		-- A future refresh should catch it.
		if(mpsessionlist_listbox_layout.SelectedIdx) then
			local Selection = mpsessionlist_listbox_contents[mpsessionlist_listbox_layout.SelectedIdx]
			local CurServerStr = "<undef>"
			if (Selection) then
				CurServerStr = Selection.namestr
			end

			if((this.sLastServerStr ~= CurServerStr) or (this.fExtraInfoTimer < 0)) then
				this.sLastServerStr = CurServerStr
				this.fExtraInfoTimer = 1.0

				if(ScriptCB_GetExtraSessionInfo) then
					ScriptCB_GetExtraSessionInfo()
				end
			end
		end
	end,

	-- Zaps the listbox to empty. Used to clean out lua memory, glyphcache
	ClearListbox = function(this)
		gBlankListbox = 1
		mpsessionlist_listbox_layout.CursorIdx = mpsessionlist_listbox_layout.SelectedIdx
		ListManager_fnFillContents(this.listbox,mpsessionlist_listbox_contents,mpsessionlist_listbox_layout)
		this.iNumSessions = 0
		this.iNumPlayers = 0
		this.iMaxPlayers = 0

		ifs_mp_sessionlist_fnShowStats(this)

		gBlankListbox = nil
		mpsessionlist_listbox_contents = {} -- clear out completely.
	end,

	-- Callback from C to repaint the listbox. Done when the game notices
	-- the contents of that listbox have changed and it needs to trigger
	-- a repaint. The contents should be in the lua global
	-- mpsessionlist_listbox_contents
	RepaintListbox = function(this)
		local NumEntries = getn(mpsessionlist_listbox_contents)

		if(not bNoCursorSnap) then
			if(NumEntries < 1) then
				mpsessionlist_listbox_layout.SelectedIdx = nil
			else
				if((not mpsessionlist_listbox_layout.SelectedIdx) or (mpsessionlist_listbox_layout.SelectedIdx < 1)) then
					mpsessionlist_listbox_layout.SelectedIdx = 1
				elseif (mpsessionlist_listbox_layout.SelectedIdx > NumEntries) then
					mpsessionlist_listbox_layout.SelectedIdx = NumEntries
				end
			end
		end

		if(this.bInOptiSearch) then
			ifs_sessionlist_optisearch_fnOnSuccess()
			this.bInOptiSearch = nil
		end

		mpsessionlist_listbox_layout.CursorIdx = mpsessionlist_listbox_layout.SelectedIdx
		ListManager_fnFillContents(this.listbox,mpsessionlist_listbox_contents,mpsessionlist_listbox_layout)
		ifs_mp_sessionlist_fnShowStats(this)
	end,

	-- Callback from C to repaint the extra session info about the selected
	-- session
	RepaintExtraInfo = function(this)
		NumEntries = getn(mpsessionlist_serverinfo_contents)
		if(not mpsessionlist_serverinfo_layout.SelectedIdx) then
			if(NumEntries > 0) then
				mpsessionlist_serverinfo_layout.SelectedIdx = 1
			end
		else
			if(NumEntries < 1) then
				mpsessionlist_serverinfo_layout.SelectedIdx = nil
			end
		end
		mpsessionlist_serverinfo_layout.CursorIdx = mpsessionlist_serverinfo_layout.SelectedIdx
		ListManager_fnFillContents(this.serverinfo,mpsessionlist_serverinfo_contents,mpsessionlist_serverinfo_layout)

		NumEntries = getn(mpsessionlist_playerlist_contents)
		if(not mpsessionlist_playerlist_layout.SelectedIdx) then
			if(NumEntries > 0) then
				mpsessionlist_playerlist_layout.SelectedIdx = 1
			end
		else
			if(NumEntries < 1) then
				mpsessionlist_playerlist_layout.SelectedIdx = nil
			end
		end
		mpsessionlist_playerlist_layout.CursorIdx = mpsessionlist_playerlist_layout.SelectedIdx
		ListManager_fnFillContents(this.playerlist,mpsessionlist_playerlist_contents,mpsessionlist_playerlist_layout)
	end,

	fnPostError = function(this,bUserHitYes,ErrorLevel,ErrorMessage)
		print("ifs_mp_sessionlist fnPostError(..,",bUserHitYes,ErrorLevel)
		if(ErrorLevel >= 6) then
			ScriptCB_PopScreen()
		end

		if((ErrorLevel == 5) and (bUserHitYes) and (gPlatformStr == "XBox")) then
			ScriptCB_XB_Reboot("XLD_LAUNCH_DASHBOARD_ACCOUNT_MANAGEMENT")
		end

	end,
}


--LAN_GameSpy_Button_Layout = {
--	yTop = 0 ,
--	xWidth = 200,
--	xSpacing  = 0,	
--	--font = "gamefont_medium",
--	RightJustify = 1,
--	xLeft = 0,
--	Flashy =1,
--	flashy = 1,
--	buttonlist = 
--	{
--		{ tag = "lan", string = "ifs.mp.lan", },  
--		{ tag = "gamespy", string = "ifs.mp.gamespy", },
--	},
--}

-- Do programatic work to set up this screen
function ifs_mp_sessionlist_fnBuildScreen(this)
	local i
	local XPos
	local w,h = ScriptCB_GetSafeScreenInfo() -- of the usable screen
	local DropBoxH = 30
	local DropBoxTotalH = DropBoxH + 10 -- space, including gutters

	this.title.textw = w
	this.title.x = w * -0.5
	local fTinyH=ScriptCB_GetFontHeight("gamefont_tiny")
	local fSuperTinyH=ScriptCB_GetFontHeight("gamefont_super_tiny")

	local BoxW = w * 0.98
	if(gPlatformStr == "PC") then
		BoxW = w * 1.08
	end

	-- Calculate widths of columns for main list

	gMPSessionList_Listbox_ColumnInfo[1].width = 0.27*BoxW - 5 -- Server name -- 
	gMPSessionList_Listbox_ColumnInfo[2].width = 60 -- # players -- 50
	gMPSessionList_Listbox_ColumnInfo[3].width = 0.22*BoxW - 5 -- mapname -- 
 	gMPSessionList_Listbox_ColumnInfo[4].width = 0.185*BoxW - 5 -- era -- 
	gMPSessionList_Listbox_ColumnInfo[5].width = 60 -- ping -- 30

	--
	-- Make main listbox
	--

	mpsessionlist_listbox_layout.yHeight = fSuperTinyH + 2
	mpsessionlist_listbox_layout.showcount = floor( (h*.35) / (mpsessionlist_listbox_layout.yHeight + mpsessionlist_listbox_layout.ySpacing) )
	local SessionBoxH = mpsessionlist_listbox_layout.showcount * (mpsessionlist_listbox_layout.yHeight + mpsessionlist_listbox_layout.ySpacing) + 30

	local smallH = ScriptCB_GetFontHeight("gamefont_small")
	this.listbox = NewButtonWindow { 
		ZPos = 200, x=0, y = 40+0.5*SessionBoxH + DropBoxTotalH,
		ScreenRelativeX = 0.5, -- center
		ScreenRelativeY = 0.0, -- top of screen
		width = BoxW, height = SessionBoxH,
		titleText = " ",
		font = "gamefont_tiny",
	}
	mpsessionlist_listbox_layout.width = BoxW - 35	
	ListManager_fnInitList(this.listbox,mpsessionlist_listbox_layout)

	-- Attach stats items to listbox
	this.listbox.SessionCount = NewIFText { 
		x = 10 + BoxW * -0.5, y = SessionBoxH * 0.5 - 2, 
		textw = BoxW * 0.5, texth = 15,
		halign = "left", valign = "top",
		font = "gamefont_super_tiny", nocreatebackground=1, 
	}

	-- Attach stats items to listbox
	this.listbox.PlayerCount = NewIFText { 
		x = 30, y = SessionBoxH * 0.5 - 2, 
		textw = BoxW * 0.5, texth = 15,
		halign = "left", valign = "top",
		font = "gamefont_super_tiny", nocreatebackground=1, 
	}

	--
	-- Make drop-listboxes (will be attached later)
	--

	mpsessionlist_maplist_layout.showcount = min(18,getn(mp_missionselect_listbox_contents) + 2)
	mpsessionlist_maplist_layout.width = gMPSessionList_Listbox_ColumnInfo[3].width + 10
	mpsessionlist_maplist_layout.totalheight = mpsessionlist_maplist_layout.showcount * (mpsessionlist_maplist_layout.yHeight + mpsessionlist_maplist_layout.ySpacing) + 30
	this.maplistbox = NewButtonWindow { ZPos = 200, x=0, y = 30,
		ScreenRelativeX = 0.5,
		ScreenRelativeY = 0,
		width = mpsessionlist_maplist_layout.width + 35,
		height = mpsessionlist_maplist_layout.totalheight,
	}
	ListManager_fnInitList(this.maplistbox,mpsessionlist_maplist_layout)

	mpsessionlist_eratypelist_layout.width = gMPSessionList_Listbox_ColumnInfo[4].width - 15
	mpsessionlist_eratypelist_layout.totalheight = mpsessionlist_eratypelist_layout.showcount * (mpsessionlist_eratypelist_layout.yHeight + mpsessionlist_eratypelist_layout.ySpacing) + 30
	this.eralistbox = NewButtonWindow { ZPos = 200, x=0, y = 30,
		ScreenRelativeX = 0.5,
		ScreenRelativeY = 0,
		width = mpsessionlist_eratypelist_layout.width + 15,
		height = mpsessionlist_eratypelist_layout.totalheight,
	}
	ListManager_fnInitList(this.eralistbox,mpsessionlist_eratypelist_layout)

	-- Must make main listbox first, to calculate width
	mpsessionlist_servertypelist_layout.width = gMPSessionList_Listbox_ColumnInfo[6].width + 10
	mpsessionlist_servertypelist_layout.totalheight = mpsessionlist_servertypelist_layout.showcount * (mpsessionlist_servertypelist_layout.yHeight + mpsessionlist_servertypelist_layout.ySpacing) + 30
	this.serverlistbox = NewButtonWindow { ZPos = 200, x=0, y = 30,
		ScreenRelativeX = 0.5,
		ScreenRelativeY = 0,
		width = mpsessionlist_servertypelist_layout.width + 15,
		height = mpsessionlist_servertypelist_layout.totalheight,
	}
	ListManager_fnInitList(this.serverlistbox,mpsessionlist_servertypelist_layout)

	--
	-- Make dropboxes
	--

	this.DropBoxes = NewIFContainer {
		ScreenRelativeX = 0.5,
		ScreenRelativeY = 0.0,
		y = 7 + 30,
	}
	XPos = BoxW * -0.5 + 10

	for i=1,getn(gMPSessionList_Listbox_ColumnInfo) do
		local NewLabel = "filter_" .. gMPSessionList_Listbox_ColumnInfo[i].tag

		if(gMPSessionList_Listbox_ColumnInfo[i].maxchars > 0) then
			this.DropBoxes[NewLabel] = NewEditbox {
				width = gMPSessionList_Listbox_ColumnInfo[i].width + 4,
				height = DropBoxH,
				font = "gamefont_super_tiny",
--				string = gMPSessionList_Listbox_ColumnInfo[i].tag,
				MaxLen = gMPSessionList_Listbox_ColumnInfo[i].width - 6,
				MaxChars = gMPSessionList_Listbox_ColumnInfo[i].maxchars,
			}
			this.DropBoxes[NewLabel].x = XPos + gMPSessionList_Listbox_ColumnInfo[i].width * 0.5
		else
			-- Make button w/ text field. Attach listbox
			 this.DropBoxes[NewLabel] = NewButtonWindow { 
				 width = gMPSessionList_Listbox_ColumnInfo[i].width, height = DropBoxH,
				 tag = NewLabel,

				 showtext = NewIFText {
					 x = 0, y = -6,
					 string = gMPSessionList_Listbox_ColumnInfo[i].tag,
					 font = "gamefont_super_tiny",
					 textw = gMPSessionList_Listbox_ColumnInfo[i].width - 10,
					 texth = DropBoxH,
					 nocreatebackground = 1, 
					 halign = "left",
				 },
			}
			this.DropBoxes[NewLabel].x = XPos + gMPSessionList_Listbox_ColumnInfo[i].width * 0.5
			this.DropBoxes[NewLabel].showtext.x = gMPSessionList_Listbox_ColumnInfo[i].width * -0.5 + 10

			this.DropBoxes[NewLabel].bHotspot = 1
			this.DropBoxes[NewLabel].fHotspotW = gMPSessionList_Listbox_ColumnInfo[i].width
			this.DropBoxes[NewLabel].fHotspotH = DropBoxH
			this.DropBoxes[NewLabel].fHotspotX = gMPSessionList_Listbox_ColumnInfo[i].width * -0.5
			this.DropBoxes[NewLabel].fHotspotY = DropBoxH * -0.5

			if (gMPSessionList_Listbox_ColumnInfo[i].tag == "era") then
				this.eralistbox.x = this.DropBoxes[NewLabel].x
				this.eralistbox.y = this.DropBoxes.y + mpsessionlist_eratypelist_layout.totalheight * 0.5 - 25
			elseif (gMPSessionList_Listbox_ColumnInfo[i].tag == "mapname") then
				this.maplistbox.x = this.DropBoxes[NewLabel].x
				this.maplistbox.y = this.DropBoxes.y + mpsessionlist_maplist_layout.totalheight * 0.5 - 25
			elseif (gMPSessionList_Listbox_ColumnInfo[i].tag == "servertypeLabel") then
				this.serverlistbox.x = this.DropBoxes[NewLabel].x
				this.serverlistbox.y = this.DropBoxes.y + mpsessionlist_servertypelist_layout.totalheight * 0.5 - 25
			end

		end

		XPos = XPos + gMPSessionList_Listbox_ColumnInfo[i].width
	end



	
	-- 
	-- Make clickable buttons to sort server list
	--

	local labelY = this.listbox.y-0.5*SessionBoxH-smallH-5
	this.ResortButtons = NewIFContainer {
		ScreenRelativeX = 0.5,
		ScreenRelativeY = 0.0,
		y = 7,
	}
  
	-- And all of the buttons, now
	XPos = BoxW * -0.5 + 10
	for i=1,getn(gMPSessionList_Listbox_ColumnInfo) do
		local NewLabel = gMPSessionList_Listbox_ColumnInfo[i].tag .. "Label"
		this.ResortButtons[NewLabel] = NewClickableIFButton {
			x = XPos,
			y = labelY + 3, 
			btnw = gMPSessionList_Listbox_ColumnInfo[i].width, 
			btnh = 25,
			tag = gMPSessionList_Listbox_ColumnInfo[i].tag,
			font = "gamefont_super_tiny", 
			string = gMPSessionList_Listbox_ColumnInfo[i].string, 
			nocreatebackground=1,
		}
		this.ResortButtons[NewLabel].x = XPos
		this.ResortButtons[NewLabel].label.x = 0
		this.ResortButtons[NewLabel].label.halign ="left"

		XPos = XPos + gMPSessionList_Listbox_ColumnInfo[i].width
	end


	--
	-- Build up ServerInfo listbox
	--

	mpsessionlist_serverinfo_layout.yHeight = fSuperTinyH + 2
	mpsessionlist_serverinfo_layout.showcount = floor( (h*.3) / (mpsessionlist_serverinfo_layout.yHeight + mpsessionlist_serverinfo_layout.ySpacing) )
	local InfoBoxH = mpsessionlist_serverinfo_layout.showcount * (mpsessionlist_serverinfo_layout.yHeight + mpsessionlist_serverinfo_layout.ySpacing) + 30
	local InfoBoxW = w * 0.5 + 10
	mpsessionlist_serverinfo_layout.width = InfoBoxW - 35

	this.serverinfo = NewButtonWindow { 
		ZPos = 200, 
		x=InfoBoxW * -0.5 - 20, y = 65+0.5*SessionBoxH + SessionBoxH + DropBoxTotalH,
		ScreenRelativeX = 0.5, -- center
		ScreenRelativeY = 0.0, -- top of screen
		width = InfoBoxW, height = InfoBoxH,
		font = "gamefont_super_tiny",
		titleText = "ifs.mp.sessionlist.gameinfo",
	}
	ListManager_fnInitList(this.serverinfo,mpsessionlist_serverinfo_layout)

	-- Pre-init stats
	this.iNumSessions = 0
	this.iNumPlayers = 0
	this.iMaxPlayers = 0

	--
	-- Build up Playerlist listbox
	--

	mpsessionlist_playerlist_layout.yHeight = fSuperTinyH + 2
	mpsessionlist_playerlist_layout.showcount = floor( (h*.3) / (mpsessionlist_playerlist_layout.yHeight + mpsessionlist_playerlist_layout.ySpacing) )
	local InfoBoxH = mpsessionlist_playerlist_layout.showcount * (mpsessionlist_playerlist_layout.yHeight + mpsessionlist_playerlist_layout.ySpacing) + 30
	local InfoBoxW = w * 0.5
	mpsessionlist_playerlist_layout.width = InfoBoxW - 35

	this.playerlist = NewButtonWindow { 
		ZPos = 200, 
		x=InfoBoxW * 0.5 + 20, y = 65+0.5*SessionBoxH + SessionBoxH + DropBoxTotalH,
		ScreenRelativeX = 0.5, -- center
		ScreenRelativeY = 0.0, -- top of screen
		width = InfoBoxW, height = InfoBoxH,
		font = "gamefont_super_tiny",
		titleText = "ifs.onlinelobby.players",
	}
	ListManager_fnInitList(this.playerlist,mpsessionlist_playerlist_layout)

	this.playerlist.iconkills = NewIFImage { 
		ZPos = 5,
		texture = "stats_kills", 
		x = InfoBoxW * 0.125,
		y = InfoBoxH * -0.5 - 2,
		localpos_l = 0,
		localpos_t = -18,
		localpos_r = 18,
		localpos_b = 0,
	}

	this.playerlist.icondeaths = NewIFImage { 
		ZPos = 5,
		texture = "stats_deaths", 
		x = InfoBoxW * 0.225,
		y = InfoBoxH * -0.5 - 2,
		localpos_l = 0,
		localpos_t = -18, 
		localpos_r = 18,
		localpos_b = 0,
	}

	this.playerlist.iconcps = NewIFImage { 
		ZPos = 5,
		texture = "stats_cpp", 
		x = InfoBoxW * 0.325,
		y = InfoBoxH * -0.5 - 2,
		localpos_l = 0,
		localpos_t = -18, 
		localpos_r = 18,
		localpos_b = 0,
	}
	
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
			tag = "_ok",
			nocreatebackground=1,			
		}, -- end of btn
	}

	RoundIFButtonLabel_fnSetString(this.donebutton.btn,"ifs.onlinelobby.launch")

	--
	-- Build up Edit box for password
	--

	if(gPlatformStr == "PC") then
		local EditBoxW = 500
		
		this.PassBox = NewIFContainer
		{
			ScreenRelativeX = 0.5, -- center
			ScreenRelativeY = 0.5, -- center

			title = NewIFText {
				string = "ifs.vkeyboard.title_password",
				font = "gamefont_large",
				y = -50,
				textw = EditBoxW,
				nocreatebackground = 1, 
				halign = "left",
			},

			passedit = NewEditbox {
				width = EditBoxW,
				height = 40,
				font = "gamefont_medium",
				--		string = "Player 1",
				MaxLen = EditBoxW - 30,
				MaxChars = 31,
				bPasswordMode = 1,
			},
		}
		this.PassBox.title.x = EditBoxW * -0.5
	end
	
	this.refreshbutton =	NewIFContainer
	{
		ScreenRelativeX = .5, -- left
		ScreenRelativeY = 1.0, -- bottom
		y = -15, -- just above bottom
		x = 0,
		btn = NewClickableIFButton -- NewRoundIFButton 
		{ 
			btnw = 150, -- made wider to fix 9173 - NM 8/25/04
			btnh = BackButtonH,
			font = "gamefont_medium", 
			halign = "hcenter",
			--bg_width = BackButtonW, 
			--bg_xflipped = 1, 
			tag = "_refresh",
			nocreatebackground=1,
			
		}, -- end of btn
	}

	RoundIFButtonLabel_fnSetString(this.refreshbutton.btn,"ifs.mp.sessionlist.refresh")

	mpsessionlist_serverinfo_layout.FirstShownIdx = 1
	mpsessionlist_serverinfo_layout.SelectedIdx = 1
	mpsessionlist_serverinfo_layout.CursorIdx = 1
	mpsessionlist_playerlist_layout.FirstShownIdx = 1
	mpsessionlist_playerlist_layout.SelectedIdx = 1
	mpsessionlist_playerlist_layout.CursorIdx = 1
	mpsessionlist_maplist_layout.FirstShownIdx = 1
	mpsessionlist_maplist_layout.SelectedIdx = 1
	mpsessionlist_maplist_layout.CursorIdx = 1
	mpsessionlist_eratypelist_layout.FirstShownIdx = 1
	mpsessionlist_eratypelist_layout.SelectedIdx = 1
	mpsessionlist_eratypelist_layout.CursorIdx = 1
	mpsessionlist_servertypelist_layout.FirstShownIdx = 1
	mpsessionlist_servertypelist_layout.SelectedIdx = 1
	mpsessionlist_servertypelist_layout.CursorIdx = 1

end

ifs_mp_sessionlist_fnBuildScreen(ifs_mp_sessionlist)
ifs_mp_sessionlist_fnBuildScreen = nil

AddIFScreen(ifs_mp_sessionlist,"ifs_mp_sessionlist")
