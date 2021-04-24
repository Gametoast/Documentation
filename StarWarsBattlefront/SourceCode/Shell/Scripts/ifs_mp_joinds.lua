-- Multiplayer game name screen.

-- Callback function when the virtual keyboard is done
function ifs_mp_joinds_fnKeyboardDone()
	if(strlen(ifs_vkeyboard.CurString) > 1) then
		-- Hack! Netcode should be unicoded
		ScriptCB_SetGameName(ScriptCB_ununicode(ifs_vkeyboard.CurString))
		ifs_vkeyboard.CurString = "" -- clear
		ScriptCB_SetIFScreen("ifs_mp_createoptsds")
		vkeyboard_specs.fnDone = nil -- clear our registration there
	else
	end
end

-- Helper function. Given a layout (x,y,width, height), returns a
-- fully-built item.
function Mp_joinds_Listbox_CreateItem(layout)
	-- Make a coordinate system pegged to the top-left of where the cursor would go.
	local Temp = NewIFContainer { x = layout.x - 0.5 * layout.width, y=layout.y - 10}
	Temp.indexfield = NewIFText{ x = 10, y = 0, halign = "left", font = "gamefont_medium",}
	Temp.namefield = NewIFText{ x = 56, y = 0, textw = 220, halign = "left", font = "gamefont_medium",}
	return Temp
end

-- Helper function. For a destination item (previously created w/
-- CreateItem), fills it in with data, which may be nil (==blank it)
function Mp_joinds_Listbox_PopulateItem(Dest,Data)
	if(Data) then
		-- Blank the data
		IFText_fnSetString(Dest.indexfield,Data.indexstr)
		IFText_fnSetString(Dest.namefield,Data.namestr)
	else
		-- Blank the data
		IFText_fnSetString(Dest.indexfield,"")
		IFText_fnSetString(Dest.namefield,"")
	end
end

mp_joinds_listbox_layout = {
	showcount = 10,
--	yTop = -130 + 13,  -- auto-calc'd now
	yHeight = 26,
	ySpacing  = 0,
	width = 260,
	x = 0,
	slider = 1,
	CreateFn = Mp_joinds_Listbox_CreateItem,
	PopulateFn = Mp_joinds_Listbox_PopulateItem,
}

mp_joinds_listbox_contents = {
	-- Filled in from C++ now. NM 8/7/03
	-- Stubbed to show the format it wants.
--	{ indexstr = "1", namestr = "Alpha"},
--	{ indexstr = "2", namestr = "Bravo"},
}

ifs_mp_joinds = NewIFShellScreen {
	nologo = 1,
	bg_texture = "iface_bgmeta_space",
    movieIntro      = nil,
    movieBackground = nil,

	title = NewIFText {
		string = "ifs.mp.dssessionlist.title",
		font = "gamefont_large",
		y = 0,
		textw = 460,
		texth = 80,
		ScreenRelativeX = 0.4, -- left of center
		ScreenRelativeY = 0, -- top
	},

	listbox = NewButtonWindow { ZPos = 200, x=0, y = 0,
		ScreenRelativeX = 0.5, -- center
		ScreenRelativeY = 0.5, -- middle of screen
		width = 310, height = mp_joinds_listbox_layout.showcount * (mp_joinds_listbox_layout.yHeight + mp_joinds_listbox_layout.ySpacing) + 30
	},
	
	buttons = NewIFContainer {
		ScreenRelativeX = 1.0, -- right
		ScreenRelativeY = 0, -- top
		y = 20, -- pixels down from the top
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

		-- Reset listbox, show it. [Remember, Lua starts at 1!]
		mp_joinds_listbox_layout.FirstShownIdx = 1
		mp_joinds_listbox_layout.SelectedIdx = 1
		mp_joinds_listbox_layout.CursorIdx = 1
		ScriptCB_BeginDSSessionList()
		ListManager_fnFillContents(this.listbox,mp_joinds_listbox_contents,mp_joinds_listbox_layout)
	end,

	Input_Accept = function(this)
		-- If base class handled this work, then we're done
		if(gShellScreen_fnDefaultInputAccept(this)) then
			return
		end

		ScriptCB_LaunchDSSessionList()

		ifs_vkeyboard.CurString = "" -- clear
		vkeyboard_specs.fnDone = ifs_mp_joinds_fnKeyboardDone
		vkeyboard_specs.fnIsOk = ifs_login_fnIsAcceptable -- reuse this
		local w,h = ScriptCB_GetSafeScreenInfo() -- of the usable screen
		vkeyboard_specs.MaxWidth = (w * 0.5)
		vkeyboard_specs.MaxLen = 32
		IFText_fnSetString(ifs_vkeyboard.title,"")
		ifs_movietrans_PushScreen(ifs_vkeyboard)
	end,

-- 	Input_GeneralUp = function(this)
-- 		ListManager_fnNavUp(this.listbox,mp_joinds_listbox_contents,mp_joinds_listbox_layout)
-- 	end,

-- 	Input_GeneralDown = function(this)
-- 		ListManager_fnNavDown(this.listbox,mp_joinds_listbox_contents,mp_joinds_listbox_layout)
-- 	end,

	Input_LTrigger = function(this)
		ListManager_fnPageUp(this.listbox,mp_joinds_listbox_contents,mp_joinds_listbox_layout)
	end,

	Input_RTrigger = function(this)
		ListManager_fnPageDown(this.listbox,mp_joinds_listbox_contents,mp_joinds_listbox_layout)
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
		-- print("Brad, call SessionListUpdate from here, do client/server switch in C")
		ScriptCB_UpdateDSSessionList()
	end,

	-- Callback from C when the list has changed.
	RepaintListbox = function(this)
		ListManager_fnFillContents(this.listbox,mp_joinds_listbox_contents,mp_joinds_listbox_layout)
	end,
}

local ifs_mp_joinds_vbutton_layout = {
	yTop = 0,
	yHeight = 40,
	ySpacing  = 5,
	width = 160,
	font = "gamefont_medium",
	buttonlist = { 
		{ tag = "launch", string = "common.mp.connect", },
	},
}

-- Do programatic work to set up this screen
ifs_mp_joinds.CurButton = AddVerticalButtons(ifs_mp_joinds.buttons,ifs_mp_joinds_vbutton_layout)
ifs_mp_joinds.buttons.launch.x = -0.5 * ifs_mp_joinds_vbutton_layout.width
ListManager_fnInitList(ifs_mp_joinds.listbox,mp_joinds_listbox_layout)

--ScriptCB_GetSessionListPlayerlist()

AddIFScreen(ifs_mp_joinds,"ifs_mp_joinds")
