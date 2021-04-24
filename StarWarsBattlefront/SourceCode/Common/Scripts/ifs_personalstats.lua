-- Multiplayer game name screen.

-- Helper function. Given a layout (x,y,width, height), returns a
-- fully-built item.
function PersonalStats_Listbox_CreateItem(layout)
	-- Make a coordinate system pegged to the top-left of where the cursor would go.
	local Temp = NewIFContainer {
		x = layout.x - 0.5 * layout.width, y=layout.y - 10
	}
	local lfont = "gamefont_medium"
	if(layout.width < 1280) then
		lfont = "gamefont_small"
	end
	Temp.labelstr = NewIFText{
		x = -15, y = 0, textw = 0.5 * layout.width, halign = "right", font = lfont,
		ColorR= 255, ColorG = 255, ColorB = 255,
		style = "normal",
		nocreatebackground = 1,
		startdelay = random() * 0.25,
	}
	Temp.contentsstr = NewIFText{ 
		x = 15 + 0.5 * layout.width, y = 0, 
		textw = 0.5 * layout.width, halign = "left", font = lfont,
		ColorR= 255, ColorG = 255, ColorB = 255,
		style = "normal",
		nocreatebackground = 1,
		startdelay = random() * 0.25,
	}
	return Temp
end

-- Helper function. For a destination item (previously created w/
-- CreateItem), fills it in with data, which may be nil (==blank it)
function PersonalStats_Listbox_PopulateItem(Dest,Data)
	if(Data) then
		-- Contents to show. Do so.
		IFText_fnSetUString(Dest.labelstr,Data.labelustr)
		if(Data.contentsustr) then
			IFText_fnSetUString(Dest.contentsstr,Data.contentsustr)
		else
			IFText_fnSetString(Dest.contentsstr,Data.contentsstr)
		end
	end

	IFObj_fnSetVis(Dest,Data) -- Show if there are contents
end

PersonalStats_listbox_layout = {
	showcount = 20,
--	yTop = -130 + 13,
	yHeight = 26,
	ySpacing  = 5,
	width = 600,
	x = 0,
--	slider = 1,
	CreateFn = PersonalStats_Listbox_CreateItem,
	PopulateFn = PersonalStats_Listbox_PopulateItem,
	noChangeSound = 1,
}

stats_listbox_contents = {
	-- Filled in from C++
	-- Stubbed to show the format it wants.
--	{ labelustr = "Player 1", contentsstr = "5"},
-- **OR**
--	{ labelustr = " Favorite Vehicle", contentsustr = "AT-ST"}, 
}

-- Helper function, blanks out the onscreen contents. Used to keep the
-- glyphcache from overloading.
function ifs_personalstats_fnBlankContents(this)
	local i,Max

	local BlankUStr = ScriptCB_tounicode("")

	Max = getn(stats_listbox_contents)
	for i=1,Max do
		stats_listbox_contents[i].labelustr = BlankUStr
		if(stats_listbox_contents[i].contentsustr) then
			stats_listbox_contents[i].contentsustr = BlankUStr
		else
			stats_listbox_contents[i].contentsstr = ""
		end
	end

	ListManager_fnFillContents(this.listbox,stats_listbox_contents,PersonalStats_listbox_layout)
end

ifs_personalstats = NewIFShellScreen {
	nologo = 1,
	fMAX_IDLE_TIME = 30.0,
	fCurIdleTime = 0,
	movieIntro      = nil, -- played before the screen is displayed
	movieBackground = nil, -- played while the screen is displayed

	title = NewIFText {
		string = "ifs.stats.personalstatstitle",
		font = "gamefont_medium",
		y = 0,
		textw = 460, -- center on screen. Fixme: do real centering!
		ScreenRelativeX = 0.5, -- center
		ScreenRelativeY = 0.1, -- top
		ColorR= 255, ColorG = 255, ColorB = 255, -- Something that's readable!
		style = "normal",
		nocreatebackground=1,
	},
	title2 = NewIFText {
		string = "namehere",
		font = "gamefont_medium",
		y = 30,
		textw = 460,
		ScreenRelativeX = 0.5, -- center
		ScreenRelativeY = 0.1, -- top
		ColorR= 255, ColorG = 255, ColorB = 255,
		style = "normal",
		nocreatebackground=1,
	},
	bgTexture = NewIFImage { 
		ZPos = 250,
		ScreenRelativeX = 0,
		ScreenRelativeY = 0,
		UseSafezone = 0,
		texture = "opaque_black", 
		localpos_l = 0,
		localpos_t = 0,
		-- Size, UVs aren't fully specified here, but in NewIFShellScreen()
	},

	Enter = function(this, bFwd)
		gIFShellScreenTemplate_fnEnter(this, bFwd) -- call default enter function

		ScriptCB_IFObj_CreateHotSpot(this.Helptext_Back.btn.label.cpointer)	

		-- Reset listbox, show it. [Remember, Lua starts at 1!]
		PersonalStats_listbox_layout.FirstShownIdx = 1
		PersonalStats_listbox_layout.SelectedIdx = nil -- not on anything
		PersonalStats_listbox_layout.CursorIdx = nil

		ScriptCB_GetPersonalStats(this.fTeam,this.fIdx)
		ListManager_fnFillContents(this.listbox,stats_listbox_contents,PersonalStats_listbox_layout)
		this.fCurIdleTime = this.fMAX_IDLE_TIME 

		if((ScriptCB_InNetGame()) and (ScriptCB_AreMetagameRulesOn()) and (ScriptCB_GetAmHost())) then
			this.fCurIdleTime = 0
			gE3StatsTimeout = 0
		end
	end,

	Exit = function(this, bFwd)
		-- Reduce lua memory, glyphcache usage
		ifs_personalstats_fnBlankContents(this)
		teamstats_listbox_contents = nil
		if(gCurHiliteButton) then
			IFButton_fnSelect(gCurHiliteButton,nil)
		end
	end,

	-- Accept button goes to award stats screen
	Input_Accept = function(this)
		-- If base class handled this work, then we're done
		if(gShellScreen_fnDefaultInputAccept(this)) then
			return
		end

		this.fCurIdleTime = this.fMAX_IDLE_TIME 
		
		if(this.CurButton == "_back") then
			ScriptCB_PopScreen()
			ScriptCB_SndPlaySound("shell_menu_exit")
		end
	end,

	-- Back button goes to team stats
	Input_Back = function(this)
		this.fCurIdleTime = this.fMAX_IDLE_TIME 
		ScriptCB_PopScreen()
		ScriptCB_SndPlaySound("shell_menu_exit");
	end,

	-- No U/D/L/R functionality possible on this screen (gotta have stubs
	-- here, or the base class will override)

	Input_GeneralUp = function(this)
		-- If base class handled this work, then we're done
		if(gShellScreen_fnDefaultInputUp(this)) then
			return
		end
		this.fCurIdleTime = this.fMAX_IDLE_TIME 
	end,
	Input_GeneralDown = function(this)
		-- If base class handled this work, then we're done
		if(gShellScreen_fnDefaultInputUp(this)) then
			return
		end
		this.fCurIdleTime = this.fMAX_IDLE_TIME 
	end,
	Input_GeneralLeft = function(this)
		this.fCurIdleTime = this.fMAX_IDLE_TIME 
	end,
	Input_GeneralRight = function(this)
		this.fCurIdleTime = this.fMAX_IDLE_TIME 
	end,

	Update = function(this, fDt)
 		-- Call default base class's update function (make button bounce)
 		gIFShellScreenTemplate_fnUpdate(this,fDt)

		-- If the host is busy, then wait on this screen
		if(ScriptCB_CanClientLeaveStats) then
			if(fDt > 0.5) then
				fDt = 0.5 -- clamp this to sane values
			end

			if(ScriptCB_CanClientLeaveStats()) then
				gE3StatsTimeout = 0 -- allow quit now
			else
				gE3StatsTimeout = 1 -- keep clients from leaving
			end
		end

		if(gE3StatsTimeout) then
			gE3StatsTimeout = gE3StatsTimeout - fDt
		end
		
 		-- if the models are done animating, slow down the rotations
 		if(this.IconModelFastMode and not this.IconModel.bAnimActive) then
 			this.IconModelFastMode = nil
			ScriptCB_IFModel_SetOmegaY(this.IconModel.cpointer,0.3)
		end

		PersonalStats_listbox_layout.SelectedIdx = nil -- not on anything
		PersonalStats_listbox_layout.CursorIdx = nil
 		ListManager_fnFillContents(this.listbox,stats_listbox_contents,PersonalStats_listbox_layout)

		-- if we've been sitting here for a while, bail to the teaser screen
		this.fCurIdleTime = this.fCurIdleTime - fDt
		if((this.fCurIdleTime < 0) and (not gE3StatsTimeout or gE3StatsTimeout < 0)) then
			this.fCurIdleTime = 100
			ScriptCB_QuitFromStats()
			ScriptCB_SndPlaySound("shell_menu_exit");
		end

 	end,

	-- Callback (from C++) to repaint the listbox with the current contents
	-- in the global stats_listbox_contents
-- 	RepaintListbox = function(this)
-- 		ListManager_fnFillContents(this.listbox,stats_listbox_contents,PersonalStats_listbox_layout)
--	end,
}

-- Helper function, sets up parts of this screen that need any
-- programmatic work (i.e. scaling to screensize)
function ifs_personalstats_fnBuildScreen(this)
	-- Ask game for screen size, fill in values
	local r,b,v,widescreen=ScriptCB_GetScreenInfo()
	this.bgTexture.localpos_l = 0
	this.bgTexture.localpos_t = 0
	this.bgTexture.localpos_r = r*widescreen
	this.bgTexture.localpos_b = b
	this.bgTexture.uvs_b = v

--	if(this.Helptext_Back) then
--		IFText_fnSetString(this.Helptext_Back.helpstr,"ifs.stats.back")
--	end
--	if(this.Helptext_Accept) then
--		IFText_fnSetString(this.Helptext_Accept.helpstr,"ifs.stats.awards")
--	end


	-- Inset slightly from fulls screen size
	local w,h = ScriptCB_GetSafeScreenInfo()
	h = h * 0.82

	this.listbox = NewButtonWindow { ZPos = 200, x=0, y = 0,
		ScreenRelativeX = 0.5, -- center
		ScreenRelativeY = 0.48, -- middle of screen
		width = w,
		height = h,
		noEnterAnimation = 1,
	}

	this.IconModel = NewIFModel {
		ScreenRelativeX = 0.5,
		ScreenRelativeY = 0.5,
		x=0,y=0,scale = 1,
		OmegaY = 0.3,
		lighting = 1,
	}
	
	

	PersonalStats_listbox_layout.width = w - 50
	PersonalStats_listbox_layout.showcount = floor(h / (PersonalStats_listbox_layout.yHeight + PersonalStats_listbox_layout.ySpacing)) - 1

	ListManager_fnInitList(ifs_personalstats.listbox,PersonalStats_listbox_layout)
end

ifs_personalstats_fnBuildScreen(ifs_personalstats) -- programatic chunks
ifs_personalstats_fnBuildScreen = nil

AddIFScreen(ifs_personalstats,"ifs_personalstats")
