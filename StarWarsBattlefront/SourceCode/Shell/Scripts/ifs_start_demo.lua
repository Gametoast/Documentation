
ifs_start_demo = NewIFShellScreen {
	-- # of seconds before we go into demomode. XBox TCR C1-6 says
	-- this must be no larger than 120 seconds. 
	Demomode_Delay_DEFAULT = 999999,

	-- Current value for the delay. This is reset to Demomode_Delay_DEFAULT on
	-- screen entry, and when it hits zero, it launches
	Demomode_Delay = 1, -- Stub value, replaced in :Enter()

	bNohelptext = 1, -- turn off the bottom buttons

 	title = NewIFText {
 		string = "ifs.start.press_start",
 		font = "gamefont_large",
 		textw = 450,
		texth = 250,
 		ScreenRelativeX = 0.5, -- center
 		ScreenRelativeY = 0.5, -- top
		valign = "vcenter",
	},

 	titlebg = NewIFText {
 		string = "ifs.start.press_start",
 		font = "gamefont_large",
 		textw = 450,
		texth = 250,
 		ScreenRelativeX = 0.5, -- center
 		ScreenRelativeY = 0.5, -- top
		ColorR = 0, ColorG = 0, ColorB = 0,
		valign = "vcenter",
	},

	Enter = function(this, bFwd)
		-- Always call base class functionality
		gIFShellScreenTemplate_fnEnter(this, bFwd)
		
		-- Always reset demo timer
		this.Demomode_Delay = this.Demomode_Delay_DEFAULT
		this.fControllerCheck = -1 -- update string asap
		ScriptCB_srand() -- no params == off HW clock

		-- if we're PC, just skip this entire screen
		if( gPlatformStr == "PC" ) then
			if(bFwd) then
				ifelem_shellscreen_fnStartMovie("shell", 1)
				ScriptCB_PushScreen("ifs_main")
			else
				ScriptCB_PopScreen()
			end
		else --XBOX or PS2

			-- Need to go to demo screen? Jump there instead.
			if(bFwd) then
				if(ScriptCB_ShouldShowDemoPostscreen and ScriptCB_ShouldShowDemoPostscreen()) then
					ScriptCB_PushScreen("ifs_postdemo")
				else
					ifelem_shellscreen_fnStartMovie("shell", 1)
				end
			end

			-- Unbind all controllers.
			ScriptCB_UnbindController(1)
			ScriptCB_UnbindController(2)
			ScriptCB_UnbindController(3)
			ScriptCB_UnbindController(4)
		end
	end,

	-- Do nothing on this screen
	Input_Back = function(this)
	end,

	TitleAlpha = 1.0,
	TitleDir = -1.0,

	fControllerCheck = -1, -- force an update asap
	iLastControllers = -1,

	Update = function(this, fDt)
		-- Call base class functionality
		gIFShellScreenTemplate_fnUpdate(this, fDt)

		-- Do periodic check if controllers are present.
		this.fControllerCheck = this.fControllerCheck - fDt
		if(this.fControllerCheck < 0) then
			this.fControllerCheck = 0.25

			local iNumControllers = ScriptCB_GetNumControllers()
			if(this.iLastControllers ~= iNumControllers) then
				this.iLastControllers = iNumControllers

				if(iNumControllers > 0) then
					IFText_fnSetString(this.title,"ifs.start.press_start")
					IFText_fnSetString(this.titlebg,"ifs.start.press_start")
				else
					IFText_fnSetString(this.title,"ifs.start.nocontroller")
					IFText_fnSetString(this.titlebg,"ifs.start.nocontroller")
				end
			end
		end

		this.TitleAlpha = this.TitleAlpha + this.TitleDir * (fDt * 0.5)
		if(this.TitleAlpha < 0.4) then
			this.TitleAlpha = 0.4
			this.TitleDir = 1.0
		end
		if(this.TitleAlpha > 1.0) then
			this.TitleAlpha = 1.0
			this.TitleDir = -1.0
		end
		IFObj_fnSetAlpha(this.title,this.TitleAlpha)

		this.Demomode_Delay = this.Demomode_Delay - fDt
		if(this.Demomode_Delay < 0) then
			ifelem_shellscreen_fnStopMovie()
			-- Pick a random map to launch from SP list
			missionselect_listbox_contents = demomode_missionselect_listbox_contents

			local MapIdx = random(getn(missionselect_listbox_contents))
			local MapNameStr = missionselect_listbox_contents[MapIdx].mapluafile
			-- If it's got 4 sides, then randomize from them. Else, pick
			-- whatever exists.

			local RaceChar = ""
			if((missionselect_listbox_contents[MapIdx].side_a) and
				 (missionselect_listbox_contents[MapIdx].side_r)) then
				local Race = random()
				if(Race < 0.25) then
					RaceChar = "a"
				elseif (Race < 0.5) then
					RaceChar = "c"
				elseif (Race < 0.75) then
					RaceChar = "i"
				else
					RaceChar = "r"
				end
			else
				-- See which side it's got, set that.
				if(missionselect_listbox_contents[MapIdx].side_a) then
					RaceChar = "a"
				elseif (missionselect_listbox_contents[MapIdx].side_c) then
					RaceChar = "c"
				elseif (missionselect_listbox_contents[MapIdx].side_i) then
					RaceChar = "i"
				elseif (missionselect_listbox_contents[MapIdx].side_r) then
					RaceChar = "r"
				end
			end

			ScriptCB_SetTeamNames(gMissionSelectAttackerTeams[RaceChar], gMissionSelectDefenderTeams[RaceChar])

			MapNameStr = MapNameStr .. RaceChar
			ScriptCB_LaunchDemo(MapNameStr)
			this.Demomode_Delay = 9999999
		end
	end,

	-- Overrides for most input handlers, as we want to do nothing
	-- when this happens on this screen.
	Input_Accept = function(this) 
	end,
	Input_GeneralLeft = function(this,bFromAI)
	end,
	Input_GeneralRight = function(this,bFromAI)
	end,
	Input_GeneralUp = function(this,bFromAI)
	end,
	Input_GeneralDown = function(this,bFromAI)
	end,

	Input_Start = function(this)
		ScriptCB_PushScreen("ifs_main_demo")
	end,
}

-- Turn this into a dropshadow
ifs_start_demo.titlebg.x = ifs_start_demo.titlebg.x + 1
ifs_start_demo.titlebg.y = ifs_start_demo.titlebg.y + 1
AddIFScreen(ifs_start_demo,"ifs_start_demo")