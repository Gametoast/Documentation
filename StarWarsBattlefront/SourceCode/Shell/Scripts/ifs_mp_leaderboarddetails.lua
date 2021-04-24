-- XBox Live leader board details


-- Helper function. Given a layout (x,y,width, height), returns a
-- fully-built item.
function ifs_mp_leaderboarddetails_TwoColumn_Listbox_CreateItem(layout)
	-- Make a coordinate system pegged to the top-left of where the cursor would go.
	local Temp = NewIFContainer { x = layout.x - 0.5 * layout.width, y=layout.y - 10}
	Temp.sectionTitle = NewIFText{ nocreatebackground=1, clip = "character", x = (layout.width * 0.5), y = 0, textw = layout.width, halign = "hcenter", font = "gamefont_small", ColorR= 223, ColorG = 32, ColorB = 32,}

	Temp.sectionTitle.x =  Temp.sectionTitle.x - Temp.sectionTitle.textw*0.5
	
	local sidePadding = 10
	local centerPadding = 30
	local listBoxWidth = leaderboarddetails_listbox_layout.width

	Temp.name1 = NewIFText{ nocreatebackground=1, clip = "character", x = sidePadding, y = 0, textw = 0.25*listBoxWidth, halign = "left", font = "gamefont_small",}
	Temp.value1 = NewIFText{ nocreatebackground=1, clip = "character", x = 0.5*listBoxWidth-0.5*centerPadding-0.25*listBoxWidth, y = 0, textw = 0.25*listBoxWidth, halign = "right", font = "gamefont_small",ColorR= 255, ColorG = 255, ColorB = 255,}
	Temp.name2 = NewIFText{ nocreatebackground=1, clip = "character", x = 0.5*listBoxWidth+0.5*centerPadding, y = 0, textw = 0.25*listBoxWidth, halign = "left", font = "gamefont_small",}
	Temp.value2 = NewIFText{ nocreatebackground=1, clip = "character", x = listBoxWidth-sidePadding-0.25*listBoxWidth, y = 0, textw = 0.25*listBoxWidth, halign = "right", font = "gamefont_small",ColorR= 255, ColorG = 255, ColorB = 255,}

	return Temp
end



-- Helper function. For a destination item (previously created w/
-- CreateItem), fills it in with data, which may be nil (==blank it)
function ifs_mp_leaderboarddetails_TwoColumn_Listbox_PopulateItem(Dest,Data)
	if(Data) then
		-- Contents to show. Do so.

		if( Data.sectionTitle and Data.name ) then
			if( Data.name == "" ) then
				value = ScriptCB_tounicode("")
			else
				value = ScriptCB_getlocalizestr(Data.name)
			end
		elseif( leaderboarddetails_data[Data.value] ) then
			value = leaderboarddetails_data[Data.value]	
		elseif( leaderboarddetails_data[ifs_mp_leaderboarddetails.CurButton][Data.value] ) then
			value = leaderboarddetails_data[ifs_mp_leaderboarddetails.CurButton][Data.value]		
		else
			value = ScriptCB_getlocalizestr("ifs.stats.notavailable")
		end



		if( Data.sectionTitle ) then
				
			IFText_fnSetUString(Dest.sectionTitle, value)		
			IFObj_fnSetVis(Dest.sectionTitle, 1)
			IFObj_fnSetVis(Dest.name1, nil)
			IFObj_fnSetVis(Dest.value1, nil)
			IFObj_fnSetVis(Dest.name2, nil)
			IFObj_fnSetVis(Dest.value2, nil)
		else
			local fieldCount = getn(Data)
			local i

			IFObj_fnSetVis(Dest.name1, nil)
			IFObj_fnSetVis(Dest.value1, nil)
			IFObj_fnSetVis(Dest.name2, nil)
			IFObj_fnSetVis(Dest.value2, nil)
			IFObj_fnSetVis(Dest.sectionTitle, nil)
		
			-- Now do the real work
			for i = 1,fieldCount do

				local tag = format("name%d",i)
				IFText_fnSetString(Dest[tag],Data[i].name)
				IFObj_fnSetVis(Dest[tag], 1)
				tag = format("value%d",i)
				IFObj_fnSetVis(Dest[tag], 1)
				if( leaderboarddetails_data[ifs_mp_leaderboarddetails.CurButton][Data[i].value] ) then
					IFText_fnSetUString(Dest[tag],leaderboarddetails_data[ifs_mp_leaderboarddetails.CurButton][Data[i].value])
				else
					IFText_fnSetString(Dest[tag], "ifs.stats.notavailable")
				end
				
			end


		end

	end
	IFObj_fnSetVis(Dest,Data) -- Show if there are contents

end

function ifs_mp_leaderboarddetails_OneColumn_Listbox_CreateItem(layout)
	-- Make a coordinate system pegged to the top-left of where the cursor would go.
	local Temp = NewIFContainer { x = layout.x - 0.5 * layout.width, y=layout.y - 10}
	Temp.sectionTitle = NewIFText{ nocreatebackground=1, clip = "character", x = (layout.width * 0.5), y = 0, textw = layout.width, halign = "hcenter", font = "gamefont_small", ColorR= 223, ColorG = 32, ColorB = 32,}

	Temp.sectionTitle.x =  Temp.sectionTitle.x - Temp.sectionTitle.textw*0.5
	
	local listBoxWidth = leaderboarddetails_listbox_layout.width
	local sidePadding = 0.1*listBoxWidth

	Temp.name1 = NewIFText{ nocreatebackground=1, clip = "character", x = sidePadding, y = 0, textw = 0.5*listBoxWidth - sidePadding, halign = "left", font = "gamefont_small",}
	Temp.value1 = NewIFText{ nocreatebackground=1, clip = "character", x = listBoxWidth - 0.5*listBoxWidth, y = 0, textw = 0.5*listBoxWidth - sidePadding, halign = "right", font = "gamefont_small",ColorR= 255, ColorG = 255, ColorB = 255,}

	return Temp
end


function ifs_mp_leaderboarddetails_OneColumn_Listbox_PopulateItem(Dest,Data)
	if(Data) then
		-- Contents to show. Do so.
--		IFText_fnSetUString(Dest.rankfield,Data.rankfield)
--		IFText_fnSetUString(Dest.namefield,Data.namefield)
--		IFText_fnSetUString(Dest.ratingfield,Data.ratingfield)

		local value
		
		if( Data.sectionTitle and Data.name ) then
			if( Data.name == "" ) then
				value = ScriptCB_tounicode("")
			else
				value = ScriptCB_getlocalizestr(Data.name)
			end
		elseif( leaderboarddetails_data[Data.value] ) then
			value = leaderboarddetails_data[Data.value]	
		elseif( leaderboarddetails_data[ifs_mp_leaderboarddetails.CurButton][Data.value] ) then
			value = leaderboarddetails_data[ifs_mp_leaderboarddetails.CurButton][Data.value]		
		else
			value = ScriptCB_getlocalizestr("ifs.stats.notavailable")
		end

		if( Data.sectionTitle ) then
		
			IFText_fnSetUString(Dest.sectionTitle, value)		
			IFObj_fnSetVis(Dest.sectionTitle, 1)
			IFObj_fnSetVis(Dest.name1, nil)
			IFObj_fnSetVis(Dest.value1, nil)
		else

			IFObj_fnSetVis(Dest.sectionTitle, nil)
			IFText_fnSetString(Dest["name1"],Data.name)
			IFObj_fnSetVis(Dest["name1"], 1)
			IFObj_fnSetVis(Dest["value1"], 1)
			IFText_fnSetUString(Dest["value1"], value)
		end

	end
	IFObj_fnSetVis(Dest,Data) -- Show if there are contents

end



leaderboarddetails_hbutton_layout = {
	yTop = 10,
	yHeight = 30,
	xSpacing = 2,
	xWidth = 110,
	font = "gamefont_medium",
	buttonlist = {
		{ tag = "overall", string = "ifs.stats.overall" },
		{ tag = "alliance", string = "common.sides.all.name" },
		{ tag = "imperial", string = "common.sides.imp.name" },
		{ tag = "republic", string = "common.sides.rep.name" },
		{ tag = "cis", string = "common.sides.cis.name" },
	},
}

leaderboarddetails_listbox_layout = {
	showcount = 18,
--	yTop = -130 + 13,
	yHeight = 24,
	ySpacing  = 2,
	width = 430,
	x = 0,
	slider = 1,
	scrollby = 1,
	CreateFn = ifs_mp_leaderboarddetails_OneColumn_Listbox_CreateItem,
	PopulateFn = ifs_mp_leaderboarddetails_OneColumn_Listbox_PopulateItem,
}


leaderboarddetails_playerinfolistbox_layout = {
	showcount = 4,
	yTop = 20,
	yHeight = 20,
	ySpacing  = 6,
	width = 430,
	x = 0,
	scrollby = 1,
	CreateFn = ifs_mp_leaderboarddetails_TwoColumn_Listbox_CreateItem,
	PopulateFn = ifs_mp_leaderboarddetails_TwoColumn_Listbox_PopulateItem,
}


leaderboarddetails_listbox_contents = {}
leaderboarddetails_playerinfolistbox_contents = {}


leaderboarddetails_playerinfolistbox_contents_twocolumn = {

	{ value = "name", sectionTitle = 1 },
	{ { name = "ifs.stats.level", value = "level" }, { name = "ifs.stats.title", value = "title" } },

}

leaderboarddetails_playerinfolistbox_contents_onecolumn = {

	{ value = "name", sectionTitle = 1 },
	{ name = "ifs.stats.level", value = "level" },
	{ name = "ifs.stats.title", value = "title" }, 

}

leaderboarddetails_listbox_contents_onecolumn = {

	{ name = "ifs.stats.generaltitle", sectionTitle = 1 },
	{ name = "ifs.stats.experience", value = "experience" }, 
	{ name = "ifs.stats.skill", value = "skill" },
	{ name = "ifs.stats.totalTimePlayed", value = "totalTimePlayed" }, 
	{ name = "ifs.stats.lastgameplayed", value = "lastGamePlayed" },
	{ name = "", sectionTitle = 1 },
	
	{ name = "ifs.stats.statstitle", sectionTitle = 1 },
	{ name = "ifs.stats.headshots", value = "headShots" }, 
	{ name = "ifs.stats.accuracy", value = "accuracy" },
	{ name = "ifs.stats.narrowescapes", value = "narrowEscapes" }, 
	{ name = "ifs.stats.commandpostpoints", value = "captures" },
	{ name = "ifs.stats.wins", value = "wins" }, 
	{ name = "ifs.stats.losses", value = "losses" },
	{ name = "ifs.stats.kills", value = "kills" }, 
	{ name = "ifs.stats.deaths", value = "deaths" },
	{ name = "ifs.stats.vehiclesdestroyed", value = "vehiclesDestroyed" }, 
	{ name = "ifs.stats.livingstreak", value = "livingStreak" },
	{ name = "", sectionTitle = 1 },
	
	{ name = "ifs.stats.awards", sectionTitle = 1 },
	{ name = "ifs.stats.tankbuster", value = "tankBuster" }, 
	{ name = "ifs.stats.killingspree", value = "killingSpree" },
	{ name = "ifs.stats.camper", value = "camper" }, 
	{ name = "ifs.stats.survivalist", value = "survivalist" },
	{ name = "ifs.stats.traitor", value = "traitor" }, 
	{ name = "ifs.stats.publicenemy", value = "publicEnemy" },
	{ name = "ifs.stats.meat", value = "meat" }, 
	{ name = "ifs.stats.deadeye", value = "deadEye" },
	{ name = "ifs.stats.pointman", value = "pointMan" },
	
}

leaderboarddetails_listbox_contents_onecolumn_gamespy = {

	{ name = "", sectionTitle = 1 },
	
	{ name = "ifs.stats.favoritestitle", sectionTitle = 1 },
	{ name = "ifs.stats.favclass", value = "favoriteClass" }, 
	{ name = "ifs.stats.favweapon", value = "favoriteWeapon" },
	{ name = "ifs.stats.favvehicle", value = "favoriteVehicle" },
	{ name = "", sectionTitle = 1 },
	
	{ name = "ifs.stats.misctitle", sectionTitle = 1 },
	{ name = "ifs.stats.nemesis", value = "nemesis" }, 
	{ name = "ifs.stats.nemesisdeaths", value = "nemesisDeaths" }, 
	{ name = "ifs.stats.bait", value = "bait" },
	{ name = "ifs.stats.baitkills", value = "baitKills" },

}

leaderboarddetails_listbox_contents_twocolumn = {

	{ name = "ifs.stats.generaltitle", sectionTitle = 1 },
	{ { name = "ifs.stats.experience", value = "experience" }, { name = "ifs.stats.skill", value = "skill" } },
	{ { name = "ifs.stats.totalTimePlayed", value = "totalTimePlayed" }, { name = "ifs.stats.lastgameplayed", value = "lastGamePlayed" } },
	{ name = "", sectionTitle = 1 },
	
	{ name = "ifs.stats.statstitle", sectionTitle = 1 },
	{ { name = "ifs.stats.headshots", value = "headShots" }, { name = "ifs.stats.accuracy", value = "accuracy" } },
	{ { name = "ifs.stats.narrowescapes", value = "narrowEscapes" }, { name = "ifs.stats.commandpostpoints", value = "captures" } },
	{ { name = "ifs.stats.wins", value = "wins" }, { name = "ifs.stats.losses", value = "losses" } },
	{ { name = "ifs.stats.kills", value = "kills" }, { name = "ifs.stats.deaths", value = "deaths" } },
	{ { name = "ifs.stats.vehiclesdestroyed", value = "vehiclesDestroyed" }, { name = "ifs.stats.livingstreak", value = "livingStreak" } },
	{ name = "", sectionTitle = 1 },
	
	{ name = "ifs.stats.awards", sectionTitle = 1 },
	{ { name = "ifs.stats.tankbuster", value = "tankBuster" }, { name = "ifs.stats.killingspree", value = "killingSpree" } },
	{ { name = "ifs.stats.camper", value = "camper" }, { name = "ifs.stats.survivalist", value = "survivalist" } },
	{ { name = "ifs.stats.traitor", value = "traitor" }, { name = "ifs.stats.publicenemy", value = "publicEnemy" } },
	{ { name = "ifs.stats.meat", value = "meat" }, { name = "ifs.stats.deadeye", value = "deadEye" } },
	{ { name = "ifs.stats.pointman", value = "pointMan" }, },
	
}


leaderboarddetails_listbox_contents_twocolumn_gamespy = {

	{ name = "", sectionTitle = 1 },
	
	{ name = "ifs.stats.favoritestitle", sectionTitle = 1 },
	{ { name = "ifs.stats.favclass", value = "favoriteClass" }, { name = "ifs.stats.favWeapon", value = "favoriteWeapon" } },
	{ { name = "ifs.stats.favvehicle", value = "favoriteVehicle" } },
	{ name = "", sectionTitle = 1 },
	
	{ name = "ifs.stats.misctitle", sectionTitle = 1 },
	{ { name = "ifs.stats.nemesis", value = "nemesis" }, { name = "ifs.stats.bait", value = "bait" } },

}

-- data will be fill out by a callback function
leaderboarddetails_data = {
--	alliance = { },
--	republic = { },
--	imperial = { },
--	cis = { },
--	overall = { },
}




ifs_mp_leaderboarddetails = NewIFShellScreen {
	nologo = 1,
	movieIntro      = nil,
	movieBackground = nil,

	buttons = NewIFContainer {
		ScreenRelativeX = 0.5, -- center
		ScreenRelativeY = 0, -- top
		y = 50,
	},	

	-- Accept button bumps the page
	Input_Accept = function(this)
		-- If base class handled this work, then we're done
		if(gShellScreen_fnDefaultInputAccept(this)) then
			return
		end

		Popup_YesNo.fnDone = ifs_leaderboarddetails_fnResetStatsDone
		IFText_fnSetString(Popup_YesNo.title, "ifs.stats.askreset")
		Popup_YesNo:fnActivate(1)

	end,

	Enter = function(this)

		IFObj_fnSetVis(this.buttons, nil)
		IFObj_fnSetVis(this.listbox, nil)
		IFObj_fnSetVis(this.playerinfolistbox, nil)
		IFObj_fnSetVis(this.title, nil)
		IFObj_fnSetVis(this.Helptext_Back, nil)
	
		-- start the leader board player download
		if( ScriptCB_DownloadLeaderBoardData(ifs_mp_leaderboarddetails.playerName) == -1 ) then
		
			Popup_Ok.fnDone = ifs_leaderboarddetails_fnExitScreen
			IFText_fnSetString(Popup_Ok.title, "ifs.stats.error.usernotfound")
			Popup_Ok:fnActivate(1)	
		
		else

			Popup_Busy.fnCheckDone = ifs_leaderboarddetails_fnCheckDone
			Popup_Busy.fnOnSuccess = ifs_leaderboarddetails_fnOnSuccess
			Popup_Busy.fnOnFail = ifs_leaderboarddetails_fnOnFail
			Popup_Busy.fnOnCancel = ifs_leaderboarddetails_fnOnCancel
			Popup_Busy.bNoCancel = nil
			Popup_Busy.fTimeout = 10 -- seconds
			IFText_fnSetString(Popup_Busy.title,"ifs.stats.downloading")
			Popup_Busy:fnActivate(1)	
		end

	end,


	Input_GeneralUp = function(this)
		-- If base class handled this work, then we're done
		if(gShellScreen_fnDefaultInputUp(this)) then
			return
		end

		leaderboarddetails_listbox_layout.SelectedIdx = leaderboarddetails_listbox_layout.FirstShownIdx
		ListManager_fnNavUp(this.listbox,leaderboarddetails_listbox_contents,leaderboarddetails_listbox_layout)
	end,

	Input_GeneralDown = function(this)
		-- If base class handled this work, then we're done
		if(gShellScreen_fnDefaultInputDown(this)) then
			return
		end

		leaderboarddetails_listbox_layout.SelectedIdx = leaderboarddetails_listbox_layout.FirstShownIdx + leaderboarddetails_listbox_layout.showcount-1
		ListManager_fnNavDown(this.listbox,leaderboarddetails_listbox_contents,leaderboarddetails_listbox_layout)
	end,

	Input_LTrigger = function(this)
		leaderboarddetails_listbox_layout.SelectedIdx = leaderboarddetails_listbox_layout.FirstShownIdx
		ListManager_fnPageUp(this.listbox,leaderboarddetails_listbox_contents,leaderboarddetails_listbox_layout)
	end,
	Input_RTrigger = function(this)
		leaderboarddetails_listbox_layout.SelectedIdx = leaderboarddetails_listbox_layout.FirstShownIdx + leaderboarddetails_listbox_layout.showcount-1
		ListManager_fnPageDown(this.listbox,leaderboarddetails_listbox_contents,leaderboarddetails_listbox_layout)
	end,

	Input_GeneralLeft = function(this)	
		ScriptCB_SndPlaySound("shell_select_change");
		gDefault_Input_GeneralLeft(this)		
		this.RepaintListbox(this)	
	end,
	Input_GeneralRight = function(this)
		ScriptCB_SndPlaySound("shell_select_change");
		gDefault_Input_GeneralRight(this)
		this.RepaintListbox(this)		
	end,

	bCursorOnLeft = 1,

	Update = function(this, fDt)
 		-- Call default base class's update function (make button bounce)
 		gIFShellScreenTemplate_fnUpdate(this,fDt)
		
		if(gPlatformStr == "PC") then
			if( gMouseListBox ) then
				if( gMouseListBox == this.LeftList ) then
					this.bCursorOnLeft = 1
				else
					this.bCursorOnLeft = nil
				end
				this.RepaintListbox( this, this.bCursorOnLeft )
			end		
		end
		
 	end,


	-- Callback (from C++) to repaint the listbox with the current contents
	-- in the global leaderboarddetails_listbox_layout
 	RepaintListbox = function(this)
 		leaderboarddetails_listbox_layout.CursorIdx = nil
		leaderboarddetails_playerinfolistbox_layout.CursorIdx = nil
		
 		ListManager_fnFillContents(this.listbox,leaderboarddetails_listbox_contents,leaderboarddetails_listbox_layout)
 		ListManager_fnFillContents(this.playerinfolistbox,leaderboarddetails_playerinfolistbox_contents,leaderboarddetails_playerinfolistbox_layout)
	end,	




}

----------- reset stats popup functions ----------------------

function ifs_leaderboarddetails_fnResetStatsDone(bResult)

	Popup_YesNo:fnActivate(nil)	
	
	if(bResult) then
		ScriptCB_ResetLeaderBoardPlayerData(ifs_mp_leaderboarddetails.playerName)
		ifs_mp_leaderboarddetails.Enter(ifs_mp_leaderboarddetails)
	end
	
end

----------- downloading popup functions ----------------------

-- Returns -1, 0, or 1, depending on error, busy, or success
function ifs_leaderboarddetails_fnCheckDone()
	local this = ifs_mp_leaderboarddetails
	return ScriptCB_LeaderBoardDownloadDone()
end

function ifs_leaderboarddetails_fnOnSuccess()
	local this = ifs_mp_leaderboarddetails
	
	ScriptCB_GetLeaderBoardPlayerData(leaderboarddetails_data)

	Popup_Busy:fnActivate(nil)
	IFObj_fnSetVis(this.buttons, 1)
	IFObj_fnSetVis(this.listbox, 1)
	IFObj_fnSetVis(this.playerinfolistbox, 1)
	IFObj_fnSetVis(this.title, 1)
	IFObj_fnSetVis(this.Helptext_Back, 1)

	-- Reset listbox, show it. [Remember, Lua starts at 1!]
	leaderboarddetails_listbox_layout.FirstShownIdx = 1
	leaderboarddetails_listbox_layout.SelectedIdx = 1
	this.RepaintListbox(this)
	
	
	-- Activate the overall button
--	IFButton_fnSelect(leaderboarddetails_hbutton_layout.buttonlist,1)
end

function ifs_leaderboarddetails_fnOnFail()
	Popup_Busy:fnActivate(nil)
	Popup_Ok.fnDone = ifs_leaderboarddetails_fnExitScreen
	IFText_fnSetString(Popup_Ok.title, "ifs.stats.error.notavailable")
	Popup_Ok:fnActivate(1)	
end

-- User hit cancel. Do what they want.
function ifs_leaderboarddetails_fnOnCancel()
	local this = ifs_mp_leaderboarddetails

	-- Stop logging in.
	ScriptCB_CancelLeaderBoardPlayerData()

	-- Get rid of popup, turn this screen back on
	Popup_Busy:fnActivate(nil)
	ScriptCB_PopScreen() -- default action

end


function ifs_leaderboarddetails_fnExitScreen()
	local this = fis_mp_leaderboarddetails
	
	Popup_Busy:fnActivate(nil)
	Popup_Ok:fnActivate(nil)
	ScriptCB_PopScreen()
end
	

--------------------------------------------------------------



-- Helper function, sets up parts of this screen that need any
-- programmatic work (i.e. scaling to screensize)
function ifs_mp_leaderboarddetails_fnInitScreen(this)
	-- Inset slightly from fulls screen size
	local screenWidth,screenHeight = ScriptCB_GetSafeScreenInfo()


	-- set this to 1 to have all the stats in a single column
	local OneColumnStats = 1
	local OneColumnPersonalInfo = 1
	
	local ScreenTitleY = 0
	local PlayerInfoBoxY = ScreenTitleY + 25
	local PlayerInfoBoxHeight = 40
	
	if( OneColumnPersonalInfo == 1 ) then
		PlayerInfoBoxHeight = 100
	end
	
	local ButtonTabsY = PlayerInfoBoxY + PlayerInfoBoxHeight + 20
	local ListBoxY = ButtonTabsY + 10
	local BottomBarY = screenHeight - 40
	local PlayerNameY = PlayerInfoBoxY + 8
	local PlayerTitleY = PlayerNameY + 25
	local PlayerLevelY = PlayerTitleY


	-- top row contains the title
	 this.title = NewIFText {
		string = "ifs.stats.personalstatstitle",
		font = "gamefont_large",
		y = ScreenTitleY,
		textw = 460, -- center on screen. Fixme: do real centering!
		ScreenRelativeX = 0.5, -- center
		ScreenRelativeY = 0, -- top
		ColorR= 255, ColorG = 255, ColorB = 255, -- Something that's readable!
	}


	this.listbox = NewButtonWindow { 
		ZPos = 200,
		ScreenRelativeX = 0.5, -- center
		ScreenRelativeY = 0.0, -- middle of screen
		width = screenWidth,
		height = BottomBarY - ListBoxY,
		x = 0,
		y = (BottomBarY - ListBoxY)*0.5 + ListBoxY,
	}


	this.playerinfolistbox = NewButtonWindow { 
		ZPos = 200,
		ScreenRelativeX = 0.5, -- center
		ScreenRelativeY = 0.0, -- middle of screen
		width = screenWidth,
		height = PlayerInfoBoxHeight,
		x = 0,
		y = (PlayerInfoBoxHeight)*0.5 + PlayerInfoBoxY,
	}
	
	if( OneColumnStats == 1 ) then
	
		leaderboarddetails_listbox_contents = leaderboarddetails_listbox_contents_onecolumn
		leaderboarddetails_listbox_layout.CreateFn = ifs_mp_leaderboarddetails_OneColumn_Listbox_CreateItem
		leaderboarddetails_listbox_layout.PopulateFn = ifs_mp_leaderboarddetails_OneColumn_Listbox_PopulateItem
	
	else
	
		leaderboarddetails_listbox_contents = leaderboarddetails_listbox_contents_twocolumn
		leaderboarddetails_listbox_layout.CreateFn = ifs_mp_leaderboarddetails_TwoColumn_Listbox_CreateItem
		leaderboarddetails_listbox_layout.PopulateFn = ifs_mp_leaderboarddetails_TwoColumn_Listbox_PopulateItem
	
	end
	
	if( not (gOnlineServiceStr == "XLive") ) then
		ifs_mp_leaderboarddetails_AppendTable(leaderboarddetails_listbox_contents_onecolumn, leaderboarddetails_listbox_contents_onecolumn_gamespy)
		ifs_mp_leaderboarddetails_AppendTable(leaderboarddetails_listbox_contents_twocolumn, leaderboarddetails_listbox_contents_twocolumn_gamespy)
	end
	

	if( OneColumnPersonalInfo == 1 ) then
	
		leaderboarddetails_playerinfolistbox_contents = leaderboarddetails_playerinfolistbox_contents_onecolumn
		leaderboarddetails_playerinfolistbox_layout.CreateFn = ifs_mp_leaderboarddetails_OneColumn_Listbox_CreateItem
		leaderboarddetails_playerinfolistbox_layout.PopulateFn = ifs_mp_leaderboarddetails_OneColumn_Listbox_PopulateItem
	
	else
	
		leaderboarddetails_playerinfolistbox_contents = leaderboarddetails_playerinfolistbox_contents_twocolumn
		leaderboarddetails_playerinfolistbox_layout.CreateFn = ifs_mp_leaderboarddetails_TwoColumn_Listbox_CreateItem
		leaderboarddetails_playerinfolistbox_layout.PopulateFn = ifs_mp_leaderboarddetails_TwoColumn_Listbox_PopulateItem
	
	end



	leaderboarddetails_hbutton_layout.width = screenWidth - 35
	leaderboarddetails_hbutton_layout.yTop = -2.0*leaderboarddetails_hbutton_layout.yHeight + ListBoxY - 5
	this.CurButton = AddHorizontalButtons(this.buttons,leaderboarddetails_hbutton_layout)

	leaderboarddetails_listbox_layout.CursorIdx = nil
	leaderboarddetails_listbox_layout.width = screenWidth - 35
	leaderboarddetails_listbox_layout.showcount = floor((this.listbox.height) / (leaderboarddetails_listbox_layout.yHeight + leaderboarddetails_listbox_layout.ySpacing)) - 1
	ListManager_fnInitList(ifs_mp_leaderboarddetails.listbox,leaderboarddetails_listbox_layout)
	
	leaderboarddetails_playerinfolistbox_layout.CursorIdx = nil
	leaderboarddetails_playerinfolistbox_layout.width = screenWidth - 35
	leaderboarddetails_playerinfolistbox_layout.yTop = -0.5*PlayerInfoBoxHeight
	ListManager_fnInitList(ifs_mp_leaderboarddetails.playerinfolistbox,leaderboarddetails_playerinfolistbox_layout)
	

end

function ifs_mp_leaderboarddetails_AppendTable(table1, table2)

	local table1Len = getn(table1)
	local table2Len = getn(table2)
		
	for j=1,table2Len do
		table1[table1Len+j] = table2[j]	
		print("here", table1[table1Len+j])
		
	end
	
end

ifs_mp_leaderboarddetails_fnInitScreen(ifs_mp_leaderboarddetails)
ifs_mp_leaderboarddetails_fnInitScreen = nil
AddIFScreen(ifs_mp_leaderboarddetails,"ifs_mp_leaderboarddetails")
