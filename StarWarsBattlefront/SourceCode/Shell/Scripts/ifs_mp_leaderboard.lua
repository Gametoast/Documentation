-- XBox Live leader board

-- Helper function. Given a layout (x,y,width, height), returns a
-- fully-built item.


function ifs_mp_leaderboard_Listbox_CreateItem(layout)
	-- Make a coordinate system pegged to the top-left of where the cursor would go.
	local Temp = NewIFContainer { x = layout.x - 0.5 * layout.width, y=layout.y - 10}
	Temp.rankfield = NewIFText{ clip = "character", x = 10, y = 0, textw = 60, halign = "left", font = "gamefont_small",}
	Temp.levelfield = NewIFText{ clip = "character", x = Temp.rankfield.textw, y = 0, textw = 60, halign = "left", font = "gamefont_small",}
	Temp.titlefield = NewIFText{ clip = "character", x = Temp.levelfield.textw, y = 0, textw = 60, halign = "left", font = "gamefont_small",}
	Temp.namefield = NewIFText{ clip = "character", x = layout.width * 0.5 - 200, y = 0, textw = 400, halign = "hcenter", font = "gamefont_small",}
	Temp.ratingfield = NewIFText{ clip = "character", x = layout.width - 70, y = 0, textw = 60, halign = "right", font = "gamefont_small",}
	return Temp
end



-- Helper function. For a destination item (previously created w/
-- CreateItem), fills it in with data, which may be nil (==blank it)
function ifs_mp_leaderboard_Listbox_PopulateItem(Dest,Data)
	if(Data) then
		-- Contents to show. Do so.
--		IFText_fnSetUString(Dest.rankfield,Data.rankfield)
--		IFText_fnSetUString(Dest.namefield,Data.namefield)
--		IFText_fnSetUString(Dest.ratingfield,Data.ratingfield)

		IFText_fnSetString(Dest.rankfield,Data.rankfield)
		IFText_fnSetString(Dest.namefield,Data.namefield)
		IFText_fnSetString(Dest.ratingfield,Data.ratingfield)

	end

	IFObj_fnSetVis(Dest,Data) -- Show if there are contents
end

leaderboard_listbox_layout = {
	showcount = 18,
--	yTop = -130 + 13,
	yHeight = 24,
	ySpacing  = 2,
	width = 430,
	x = 0,
--	slider = 1,
	CreateFn = ifs_mp_leaderboard_Listbox_CreateItem,
	PopulateFn = ifs_mp_leaderboard_Listbox_PopulateItem,
}

leaderboard_listbox_contents = {
	-- Filled in from C++
	-- Stubbed to show the format it wants.
--	{ labelustr = "Player 1", contentsstr = "5"},
-- **OR**
--	{ labelustr = " Favorite Vehicle", contentsustr = "AT-ST"}, 

	{ rankfield = "1", levelfield = "1", titlefield = "", namefield = "sammy davis", ratingfield = "12345" },
	{ rankfield = "2", levelfield = "1", titlefield = "", namefield = "sammy davis", ratingfield = "12345" },
	{ rankfield = "3", levelfield = "1", titlefield = "", namefield = "sammy davis", ratingfield = "12345" },
	{ rankfield = "4", levelfield = "1", titlefield = "", namefield = "sammy davis", ratingfield = "12345" },
	{ rankfield = "5", levelfield = "1", titlefield = "", namefield = "sammy davis", ratingfield = "12345" },
	{ rankfield = "6", levelfield = "1", titlefield = "", namefield = "sammy davis", ratingfield = "12345" },
	{ rankfield = "7", levelfield = "1", titlefield = "", namefield = "sammy davis", ratingfield = "12345" },
	{ rankfield = "8", levelfield = "1", titlefield = "", namefield = "sammy davis", ratingfield = "12345" },
	{ rankfield = "9", levelfield = "1", titlefield = "", namefield = "sammy davis", ratingfield = "12345" },
	{ rankfield = "10", levelfield = "1", titlefield = "", namefield = "sammy davis", ratingfield = "12345" },
	{ rankfield = "11", levelfield = "1", titlefield = "", namefield = "sammy davis", ratingfield = "12345" },
	{ rankfield = "12", levelfield = "1", titlefield = "", namefield = "sammy davis", ratingfield = "12345" },
	{ rankfield = "13", levelfield = "1", titlefield = "", namefield = "sammy davis", ratingfield = "12345" },
	{ rankfield = "14", levelfield = "1", titlefield = "", namefield = "sammy davis", ratingfield = "12345" },
}

ifs_mp_leaderboard = NewIFShellScreen {
	nologo = 1,
	bNohelptext_accept = 1,
	movieIntro      = nil,
	movieBackground = nil,

	bCursorOnLeft = 1,

	Enter = function(this)
		-- Reset listbox, show it. [Remember, Lua starts at 1!]
		leaderboard_listbox_layout.FirstShownIdx = 1
		leaderboard_listbox_layout.SelectedIdx = 1
		leaderboard_listbox_layout.CursorIdx = 1

		this.iCurStatsPage = 1 -- Default to first page of stats
--		ScriptCB_GetStats(this.iCurStatsPage)
		ListManager_fnFillContents(this.listbox,leaderboard_listbox_contents,leaderboard_listbox_layout)
	end,


	-- Accept button bumps the page
	Input_Accept = function(this)
		-- If base class handled this work, then we're done
		if(gShellScreen_fnDefaultInputAccept(this)) then
			return
		end

--		if(this.bCursorOnLeft) then
--			ifs_personalstats.fTeam = 1
--			ifs_personalstats.fIdx = teamstats_listbox_layoutL.SelectedIdx
--		else
--			ifs_personalstats.fTeam = 2
--			ifs_personalstats.fIdx = teamstats_listbox_layoutR.SelectedIdx
--		end
--      ifs_movietrans_PushScreen(ifs_personalstats)
--		ScriptCB_SndPlaySound("shell_menu_enter");
--		this.fCurIdleTime = this.fMAX_IDLE_TIME 

        ifs_movietrans_PushScreen(ifs_mp_leaderboarddetails)
		ScriptCB_SndPlaySound("shell_menu_enter");

	end,

	--Back button quits stats
--	Input_Back = function(this)
--	end,

	-- No U/D/L/R functionality possible on this screen (gotta have stubs
	-- here, or the base class will override)

	Input_GeneralUp = function(this)
		-- If base class handled this work, then we're done
		if(gShellScreen_fnDefaultInputUp(this)) then
			return
		end
		if(gPlatformStr ~= "PC") then
			ListManager_fnNavUp(this.listbox,leaderboard_listbox_contents,leaderboard_listbox_layout)
		end
	end,

	Input_GeneralDown = function(this)
		-- If base class handled this work, then we're done
		if(gShellScreen_fnDefaultInputDown(this)) then
			return
		end
		if(gPlatformStr ~= "PC") then
			ListManager_fnNavDown(this.listbox,leaderboard_listbox_contents,leaderboard_listbox_layout)
		end
		--validate the cursor position (make sure we're not on a null entry)
--		ifs_teamstats_fnValidateCursor(this)
	end,

	Input_LTrigger = function(this)
		ListManager_fnPageUp(this.listbox,leaderboard_listbox_contents,leaderboard_listbox_layout)
	end,
	Input_RTrigger = function(this)
		ListManager_fnPageDown(this.listbox,leaderboard_listbox_contents,leaderboard_listbox_layout)
		--validate the cursor position (make sure we're not on a null entry)
--		ifs_teamstats_fnValidateCursor(this)
	end,

	Input_GeneralLeft = function(this)
--		ifs_teamstats_fnFlipLeftRight(this)
		ScriptCB_SndPlaySound("shell_select_change");
	end,
	Input_GeneralRight = function(this)
--		ifs_teamstats_fnFlipLeftRight(this)
		ScriptCB_SndPlaySound("shell_select_change");
	end,

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
	-- in the global leaderboard_listbox_layout
-- 	RepaintListbox = function(this)
-- 		ListManager_fnFillContents(this.listbox,leaderboard_listbox_contents,leaderboard_listbox_layout)
--	end,	


}

-- Helper function, sets up parts of this screen that need any
-- programmatic work (i.e. scaling to screensize)
function ifs_mp_leaderboard_fnInitScreen(this)
	-- Inset slightly from fulls screen size
	local screenWidth,screenHeight = ScriptCB_GetSafeScreenInfo()


	local ScreenTitleY = 0
	local ColumnTitleY = ScreenTitleY + 40
	local ListBoxY = ColumnTitleY + 30
	local BottomBarY = screenHeight - 40
	ifs_mp_leaderboard.ColumnRankingWidth = 0.25*screenWidth;
	ifs_mp_leaderboard.ColumnNameWidth = 0.48*screenWidth;
	ifs_mp_leaderboard.ColumnRatingWidth = 0.25*screenWidth;

	
	-- top row contains the title
	this.title = NewIFText {
		string = "ifs.stats.title",
		font = "gamefont_large",
		y = ScreenTitleY,
		textw = 460, -- center on screen. Fixme: do real centering!
		ScreenRelativeX = 0.5, -- center
		ScreenRelativeY = 0, -- top
		ColorR= 255, ColorG = 255, ColorB = 255, -- Something that's readable!
	}

	-- setup the field titles
	this.rankTitle = NewIFText {
		ZPos = 200,
		string = "ifs.stats.rank",
		font = "gamefont_medium",
		halign = "hcenter",
		valign = "vcenter",
		x = 0,
		y = ColumnTitleY,
		ScreenRelativeX = 0.12, -- center
		ScreenRelativeY = 0.0, -- top
		ColorR= 255, ColorG = 255, ColorB = 255, -- Something that's readable!
	}
	

	this.nameTitle = NewIFText {
		ZPos = 200,
		string = "ifs.stats.name",
		font = "gamefont_medium",
		halign = "hcenter",
		valign = "vcenter",
		x = 0,
		y = ColumnTitleY,
		ScreenRelativeX = 0.5, -- center
		ScreenRelativeY = 0.0, -- top
		ColorR= 255, ColorG = 255, ColorB = 255, -- Something that's readable!
	}


	this.ratingTitle = NewIFText {
		ZPos = 200,
		string = "ifs.stats.rating",
		font = "gamefont_medium",
		halign = "hcenter",
		valign = "vcenter",
		x = 0,
		y = ColumnTitleY,
		ScreenRelativeX = 0.88, -- center
		ScreenRelativeY = 0.0, -- top
		ColorR= 255, ColorG = 255, ColorB = 255, -- Something that's readable!
	}

	this.rankTitle.x = this.rankTitle.x - this.rankTitle.textw*0.5
	this.nameTitle.x = this.nameTitle.x - this.nameTitle.textw*0.5
	this.ratingTitle.x = this.ratingTitle.x - this.ratingTitle.textw*0.5


	this.listbox = NewButtonWindow { 
		ZPos = 200,
		ScreenRelativeX = 0.5, -- center
		ScreenRelativeY = 0.0, -- middle of screen
		width = screenWidth,
		height = BottomBarY - ListBoxY,
		x = 0,
		y = (BottomBarY - ListBoxY)*0.5 + ListBoxY,
	}

	leaderboard_listbox_layout.width = screenWidth - 35
	leaderboard_listbox_layout.showcount = floor((this.listbox.height) / (leaderboard_listbox_layout.yHeight + leaderboard_listbox_layout.ySpacing)) - 1

	ListManager_fnInitList(ifs_mp_leaderboard.listbox,leaderboard_listbox_layout)





	
end

ifs_mp_leaderboard_fnInitScreen(ifs_mp_leaderboard)
ifs_mp_leaderboard_fnInitScreen = nil
AddIFScreen(ifs_mp_leaderboard,"ifs_mp_leaderboard")
