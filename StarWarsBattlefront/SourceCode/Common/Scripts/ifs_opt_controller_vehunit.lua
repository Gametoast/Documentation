-- Ps2 controller setup for Vehicle/Unit mode



gButtonFunctionStrings = {
	-- GLOBAL_FUNCTION_LABEL (index implies Function_ID)
	--INFANTRY LINGO	(add 19*0)
	"ifs.controls.General.Crouch",				-- 1
	"ifs.controls.General.Jump",				-- 2 
	"ifs.controls.General.Primary",				-- 3
	"ifs.controls.General.Secondary",			-- 4
	"ifs.controls.General.PrimaryNext",			-- 5
	"ifs.controls.General.SecondaryNext",		-- 6
	"ifs.controls.General.Enter",				-- 7
	"ifs.controls.General.Zoom",				-- 8
	"ifs.controls.General.Reload",				-- 9
	"ifs.controls.General.SquadCommands",        -- 10
	"ifs.controls.General.SquadUp",				-- 11
	"ifs.controls.General.SquadDown",			-- 12
	"ifs.controls.General.SquadLeft",			-- 13
	"ifs.controls.General.SquadRight",			-- 14
	"ifs.controls.General.FirstThirdPerson",	-- 15
	--Axis stuff
	"ifs.controls.General.Move_Strafe",			-- 16
	"ifs.controls.General.Move_Turn",			-- 17
	"ifs.controls.General.FreeLook",			-- 18
	"ifs.controls.General.Look_Strafe",			-- 19
	
	--VEHICLE LINGO --Same controls, just different names (just add 19*1)
	"ifs.controls.General.None",				-- 1	--There is no Crouching for vehicles
	"ifs.controls.General.Land_Takeoff", -- 2	--There is no Jump for vehicles  (may break the gunship)
	"ifs.controls.General.Primary",				-- 3	
	"ifs.controls.General.Secondary",			-- 4
	"ifs.controls.General.NextPosition",		-- 5
	"ifs.controls.General.None",				-- 6	--Eventually may get changed to switch position previous
	"ifs.controls.General.Exit",				-- 7
	"ifs.controls.General.Zoom",				-- 8
	"ifs.controls.General.Reload",				-- 9
	"ifs.controls.General.SquadCommands",        -- 10
	"ifs.controls.General.SquadUp",				-- 11
	"ifs.controls.General.SquadDown",			-- 12
	"ifs.controls.General.SquadLeft",			-- 13
	"ifs.controls.General.SquadRight",			-- 14
	"ifs.controls.General.FirstThirdPerson",	-- 15
	--Axis stuff
	"ifs.controls.General.Throttle_Strafe",		-- 16
	"ifs.controls.General.Throttle_Turn",		-- 17
	"ifs.controls.General.Pitch_Turn",			-- 18
	"ifs.controls.General.Pitch_Strafe",		-- 19
	
		--FLYER LINGO --Same controls, just different names (just add 19*2)
	"ifs.controls.General.None",				-- 1	--There is no Crouching for flyers
	"ifs.controls.General.Land_Takeoff",			-- 2
	"ifs.controls.General.Primary",				-- 3	
	"ifs.controls.General.Secondary",			-- 4
	"ifs.controls.General.NextPosition",		-- 5
	"ifs.controls.General.None",				-- 6	--Eventually may get changed to switch position previous
	"ifs.controls.General.Exit",				-- 7
	"ifs.controls.General.Zoom",				-- 8
	"ifs.controls.General.Reload",				-- 9
	"ifs.controls.General.SquadCommands",        -- 10
	"ifs.controls.General.SquadUp",				-- 11
	"ifs.controls.General.SquadDown",			-- 12
	"ifs.controls.General.SquadLeft",			-- 13
	"ifs.controls.General.SquadRight",			-- 14
	"ifs.controls.General.FirstThirdPerson",	-- 15
	--Axis stuff, has no strafe
	"ifs.controls.General.Throttle_Only",		-- 16
	"ifs.controls.General.Throttle_Turn",		-- 17
	"ifs.controls.General.Pitch_Turn",			-- 18
	"ifs.controls.General.Pitch_Only",		-- 19
	
}

--renaming things so that they actually convey some meaning..functype_t? wtf is that?
contents_functype_infantry_button = {
	{ showidx = 0, },
	{ showidx = 1, }, --showstr = "ifs.controls.General.Crouch", },
	{ showidx = 2, }, --showstr = "ifs.controls.General.Jump", },
	{ showidx = 3, }, --showstr = "ifs.controls.General.Primary", },
	{ showidx = 4, }, --showstr = "ifs.controls.General.Secondary", },
	{ showidx = 5, }, --showstr = "ifs.controls.General.PrimaryNext", },
	{ showidx = 6, }, --showstr = "ifs.controls.General.SecondaryNext", },
	{ showidx = 7, }, --showstr = "ifs.controls.General.Action", },
	{ showidx = 8, }, --showstr = "ifs.controls.General.Zoom", },
	{ showidx = 9, }, --showstr = "ifs.controls.General.Reload", },
	{ showidx = 15, }, --showstr = "ifs.controls.General.FirstThirdPerson", },
}	
--Eventually may prove unneccesary if people decide do do things with the xtra buttons
contents_functype_vehicle_button = {
	{ showidx = 0, },
	--{ showidx = 1, }, --showstr = "ifs.controls.General.Crouch", }, no crouching allowed
	{ showidx = 2, }, --showstr = "ifs.controls.General.Jump", },  no jumping allowed
	{ showidx = 3, }, --showstr = "ifs.controls.General.Primary", },
	{ showidx = 4, }, --showstr = "ifs.controls.General.Secondary", },
	{ showidx = 5, }, --showstr = "ifs.controls.General.PrimaryNext", },
	--{ showidx = 6, }, --showstr = "ifs.controls.General.SecondaryNext", },	currently no switch previous
	{ showidx = 7, }, --showstr = "ifs.controls.General.Action", },
	{ showidx = 8, }, --showstr = "ifs.controls.General.Zoom", },
	{ showidx = 9, }, --showstr = "ifs.controls.General.Reload", },
	{ showidx = 15, }, --showstr = "ifs.controls.General.FirstThirdPerson", },
}	
--PS2 version
contents_functype_vehicle_buttonPS2 = {
	{ showidx = 0, },
	--{ showidx = 1, }, --showstr = "ifs.controls.General.Crouch", }, no crouching allowed
	{ showidx = 2, }, --showstr = "ifs.controls.General.Jump", },  no jumping allowed
	{ showidx = 3, }, --showstr = "ifs.controls.General.Primary", },
	{ showidx = 4, }, --showstr = "ifs.controls.General.Secondary", },
	{ showidx = 5, }, --showstr = "ifs.controls.General.PrimaryNext", },
	--{ showidx = 6, }, --showstr = "ifs.controls.General.SecondaryNext", },	currently no switch previous
	{ showidx = 7, }, --showstr = "ifs.controls.General.Action", },
	{ showidx = 8, }, --showstr = "ifs.controls.General.Zoom", },
	{ showidx = 9, }, --showstr = "ifs.controls.General.Reload", },
	--{ showidx = 15, }, --showstr = "ifs.controls.General.FirstThirdPerson", },
}	

--Eventually may prove unneccesary if people decide do do things with the xtra buttons
contents_functype_flyer_button = {
	{ showidx = 0, },
	--{ showidx = 1, }, --showstr = "ifs.controls.General.Crouch", }, no crouching allowed
	{ showidx = 2, }, --showstr = "ifs.controls.General.Jump", },  --takeoffs allowed
	{ showidx = 3, }, --showstr = "ifs.controls.General.Primary", },
	{ showidx = 4, }, --showstr = "ifs.controls.General.Secondary", },
	{ showidx = 5, }, --showstr = "ifs.controls.General.PrimaryNext", },
	--{ showidx = 6, }, --showstr = "ifs.controls.General.SecondaryNext", },	currently no switch previous
	{ showidx = 7, }, --showstr = "ifs.controls.General.Action", },
	{ showidx = 8, }, --showstr = "ifs.controls.General.Zoom", },
	{ showidx = 9, }, --showstr = "ifs.controls.General.Reload", },
	{ showidx = 15, }, --showstr = "ifs.controls.General.FirstThirdPerson", },
}	
contents_functype_flyer_buttonPS2 = {
	{ showidx = 0, },
	--{ showidx = 1, }, --showstr = "ifs.controls.General.Crouch", }, no crouching allowed
	{ showidx = 2, }, --showstr = "ifs.controls.General.Jump", },  --takeoffs allowed
	{ showidx = 3, }, --showstr = "ifs.controls.General.Primary", },
	{ showidx = 4, }, --showstr = "ifs.controls.General.Secondary", },
	{ showidx = 5, }, --showstr = "ifs.controls.General.PrimaryNext", },
	--{ showidx = 6, }, --showstr = "ifs.controls.General.SecondaryNext", },	currently no switch previous
	{ showidx = 7, }, --showstr = "ifs.controls.General.Action", },
	{ showidx = 8, }, --showstr = "ifs.controls.General.Zoom", },
	{ showidx = 9, }, --showstr = "ifs.controls.General.Reload", },
	--{ showidx = 15, }, --showstr = "ifs.controls.General.FirstThirdPerson", },
}	



contents_functype_infantry_stick = {	
	{ showidx = 16, }, --showstr = "ifs.controls.General.Move_Strafe", },
	{ showidx = 17, }, --showstr = "ifs.controls.General.Move_Turn", },
	{ showidx = 18, }, --showstr = "iifs.controls.General.FreeLook, },
	{ showidx = 19, }, --showstr = "iifs.controls.General.Look_Strafe, },
}

contents_functype_vehicle_stick = {
	{ showidx = 16, }, --showstr = "ifs.controls.General.Throttle_Strafe", },
	{ showidx = 17, }, --showstr = "ifs.controls.General.Throttle_Turn", },
	{ showidx = 18, }, --showstr = "iifs.controls.General.Pitch_Turn, },
	{ showidx = 19, }, --showstr = "iifs.controls.General.Pitch_Strafe, },
}

contents_functype_flyer_stick = {
	{ showidx = 16, }, --showstr = "ifs.controls.General.Throttle_Strafe", },
	{ showidx = 17, }, --showstr = "ifs.controls.General.Throttle_Turn", },
	{ showidx = 18, }, --showstr = "iifs.controls.General.Pitch_Turn, },
	{ showidx = 19, }, --showstr = "iifs.controls.General.Pitch_Strafe, },
}


contents_functype_t = {
	{ showidx = 0, },
	{ showidx = 1, }, --showstr = "ifs.controls.General.Crouch", },
	{ showidx = 2, }, --showstr = "ifs.controls.General.Jump", },
	{ showidx = 3, }, --showstr = "ifs.controls.General.Primary", },
	{ showidx = 4, }, --showstr = "ifs.controls.General.Secondary", },
	{ showidx = 5, }, --showstr = "ifs.controls.General.PrimaryNext", },
	{ showidx = 6, }, --showstr = "ifs.controls.General.SecondaryNext", },
	{ showidx = 7, }, --showstr = "ifs.controls.General.Action", },
	{ showidx = 8, }, --showstr = "ifs.controls.General.Zoom", },
--	{ showidx = 9, }, --showstr = "ifs.controls.General.Land_Takeoff", }, -- == Jump, auto-switched
-- 	{ showidx = 10, }, --showstr = "ifs.controls.General.RollLeft", }, -- No defined button
-- 	{ showidx = 11, }, --showstr = "ifs.controls.General.RollRight", },
	{ showidx = 12, }, --showstr = "ifs.controls.General.Reload", },
	{ showidx = 17, }, --showstr = "ifs.controls.General.FirstThirdPerson", },
}

contents_functype_d = {
	{ showidx = 0, },
	{ showidx = 1, }, --showstr = "ifs.controls.General.Crouch", },
	{ showidx = 2, }, --showstr = "ifs.controls.General.Jump", },
	{ showidx = 3, }, --showstr = "ifs.controls.General.Primary", },
	{ showidx = 4, }, --showstr = "ifs.controls.General.Secondary", },
	{ showidx = 5, }, --showstr = "ifs.controls.General.SwitchSeats", },
	{ showidx = 6, }, --showstr = "ifs.controls.General.SwitchSeats", },
	{ showidx = 7, }, --showstr = "ifs.controls.General.Action", },
	{ showidx = 8, }, --showstr = "ifs.controls.General.Zoom", },
--	{ showidx = 9, }, --showstr = "ifs.controls.General.Land_Takeoff", },
	{ showidx = 12, }, --showstr = "ifs.controls.General.Reload", },
-- 	{ showidx = 13, }, --showstr = "ifs.controls.General.SquadUp", },
-- 	{ showidx = 14, }, --showstr = "ifs.controls.General.SquadLeft", },
-- 	{ showidx = 15, }, --showstr = "ifs.controls.General.SquadDown", },
-- 	{ showidx = 16, }, --showstr = "ifs.controls.General.SquadRight", },
}

contents_functype_b = {
	{ showidx = 0, },
	{ showidx = 1, }, --showstr = "ifs.controls.General.Crouch", },
	{ showidx = 2, }, --showstr = "ifs.controls.General.Jump", },
	{ showidx = 3, }, --showstr = "ifs.controls.General.Primary", },
	{ showidx = 4, }, --showstr = "ifs.controls.General.Secondary", },
	{ showidx = 5, }, --showstr = "ifs.controls.General.SwitchSeats", },
	{ showidx = 6, }, --showstr = "ifs.controls.General.SwitchSeats", },
	{ showidx = 7, }, --showstr = "ifs.controls.General.Action", },
	{ showidx = 8, }, --showstr = "ifs.controls.General.Zoom", },
--	{ showidx = 9, }, --showstr = "ifs.controls.General.Land_Takeoff", },
	{ showidx = 12, }, --showstr = "ifs.controls.General.Reload", },
-- 	{ showidx = 13, }, --showstr = "ifs.controls.General.SquadUp", },
-- 	{ showidx = 14, }, --showstr = "ifs.controls.General.SquadLeft", },
-- 	{ showidx = 15, }, --showstr = "ifs.controls.General.SquadDown", },
-- 	{ showidx = 16, }, --showstr = "ifs.controls.General.SquadRight", },
}

contents_functype_avh = {
	{ showidx = 16, }, --showstr = "ifs.controls.General.Move_Strafe", },
	{ showidx = 17, }, --showstr = "ifs.controls.General.Move_Turn", },
	{ showidx = 18, }, --showstr = "ifs.controls.General.FreeLook", },
	
}

contents_functype_afly = {
	{ showidx = 21, }, -- "ifs.controls.General.Throttle_Roll", },
	{ showidx = 22, }, -- "ifs.controls.General.Pitch_Turn", },

-- 	{ showidx = 18, }, --showstr = "ifs.controls.General.Move_Strafe", },
-- 	{ showidx = 19, }, --showstr = "ifs.controls.General.Move_Turn", },
-- 	{ showidx = 20, }, --showstr = "ifs.controls.General.FreeLook", },
}

-- *******************************
-- UTILITY FUNCTIONS FOR THIS MENU
-- *******************************

-- Shows/hides all lines on this screen. ShowTable is an optional
-- parameter, shown even if the rest aren't.
function ifs_opt_controller_SetLineVisibility(this,vis,ShowTable)
	local k,v
	for k,v in Platform_btn_map do
		local UseVis = vis
		if((k == 3) or (k == 5) or (k == 6)) then
			UseVis = nil
		end

		if(v.type == 99) then
--			IFObj_fnSetVis(this.lines[k],nil)
		elseif (v.type ~= 5) then
			IFObj_fnSetVis(this.lines[k],UseVis)
			--				this.lines[k]
		end
	end

	-- Dim controller a bit when items aren't visible
	local ContAlpha = 1.0
	if(not vis) then
		ContAlpha = 0.6
	end
	IFObj_fnSetAlpha(this.controller,ContAlpha)

	if((ShowTable) and (not vis)) then
		IFObj_fnSetVis(ShowTable,1)
	end
end

-- Helper function. Moves the cursor to the right location
function ifs_opt_controller_fnMoveCursor(this)
	local CurItem = Platform_btn_map[this.cont_element_idx]

	-- Constant, extra width per box
	local kBOX_EXTRA_WIDTH = 6
	local BoxW
	local BoxH

	local fLeft, fTop, fRight, fBot
	local CurText, BoxCenterY

	if(this.lines[this.cont_element_idx]) then
		CurText = this.lines[this.cont_element_idx].label
		-- BoxCenterY, BoxH are calc'd below
	elseif (CurItem.name == "yflip") then
		BoxCenterY = this.flipStatus.y + 13
		CurText = this.flipStatus
		BoxH = 26
	elseif (CurItem.name == "lookslide") then
		BoxCenterY = this.SensitivityText.y + 13
		CurText = this.SensitivityText
		BoxH = 26
	elseif (CurItem.name == "reset") then
		BoxCenterY = this.ResetText.y + 13
		CurText = this.ResetText
		BoxH = 26
	end

	fLeft, fTop, fRight, fBot = ScriptCB_IFText_GetDisplayRect(CurText.cpointer)
	--	print("Disp fLeft, fTop, fRight, fBot = ",fLeft, fTop, fRight, fBot)
	BoxW = fRight - fLeft + kBOX_EXTRA_WIDTH + kBOX_EXTRA_WIDTH

	if(this.lines[this.cont_element_idx]) then
		BoxCenterY = CurItem.ly1 + 4
		BoxH = fBot - fTop
	end

	this.cursor.width = BoxW 
	this.cursor.w = BoxW
	this.cursor.height = BoxH
	this.cursor.h = BoxH

	-- bottom center items are at lx1 == 0
	if(CurItem.lx1 == 0) then
		IFObj_fnSetPos(this.cursor,CurItem.lx1, BoxCenterY)
	elseif (CurItem.lx1 < CurItem.lx2) then
		-- right side of screen
		IFObj_fnSetPos(this.cursor,CurItem.lx1 - (this.cursor.width * 0.5) + kBOX_EXTRA_WIDTH, BoxCenterY)
	else
		-- Left side of screen
		IFObj_fnSetPos(this.cursor,CurItem.lx1 + (this.cursor.width * 0.5) - kBOX_EXTRA_WIDTH, BoxCenterY)
	end
end

-- Helper function for navigation - moves off the current button and
-- onto the next. Handles cursor, etc.
function ifs_opt_controller_fnSetNextButton(this,Next)
	IFObj_fnSetAlpha(this.buttons[this.CurButton],0.1)
	this.CurButton = Next
	IFObj_fnSetAlpha(this.buttons[this.CurButton],1.0)
	this.cont_element_idx = this.CurButton
	ifs_opt_controller_fnMoveCursor(this)
end

-- Callback for when the "really reset to defaults?" popup is over.
-- If bResult is true, user wanted to do that.
function ifs_opt_controller_fnResetPopupDone(bResult)
	local this = ifs_opt_controller
	AnimationMgr_AddAnimation(this.controller, {fTotalTime = 0.3, fStartAlpha = 0.4, fEndAlpha = 1,})
	if(bResult) then
		ScriptCB_ResetControlsToDefault()
	end

	local this = ifs_opt_controller
	-- Always refresh all buttons, turn everything back on.
	ifs_opt_controller_SetLineVisibility(this,1)
	ifs_opt_controller_GetAllEntries(this)
	Popup_YesNo.fnDone = nil
end

-- Helper function. Given a layout (x,y,width, height), returns a
-- fully-built item.
function ifs_controller_listbox_CreateItem(layout)
	-- Make a coordinate system pegged to the top-left of where the cursor would go.
	local Temp = NewIFContainer { 
		x = layout.x - 0.5 * layout.width, 
		y=layout.y - 0.5 * layout.height + 1,
	}
	Temp.FunctionStr = NewIFText{ 
		x = 10, y = 0, 
		valign = "vcenter", halign = "left", 
		font = "gamefont_tiny",
		textw = layout.width - 32, texth = layout.height,
		nocreatebackground = 1,
	}
	return Temp
end

-- Helper function. For a destination item (previously created w/
-- CreateItem), fills it in with data, which may be nil (==blank it)
function ifs_controller_listbox_PopulateItem(Dest,Data)
	if(Data) then
		if(Data.showidx == 0) then
			IFText_fnSetString(Dest.FunctionStr,"ifs.controls.General.none")
		else
			local ShowIdx = Data.showidx
			if(ShowIdx > 0) then
				ShowIdx = ShowIdx + 19* gControlMode
			end
			IFText_fnSetString(Dest.FunctionStr,gButtonFunctionStrings[ShowIdx])
		end
		IFObj_fnSetVis(Dest.FunctionStr,1)
	else
		-- Blank the data
		IFText_fnSetString(Dest.FunctionStr,"")
		IFObj_fnSetVis(Dest.FunctionStr,nil)
	end
end

ifs_controller_listbox_layout = {
	showcount = 5, -- max of the visible ones above
	yHeight = 40,
	ySpacing  = 0,
	width = 180,
	x = 0,
	slider = 1,
	CreateFn = ifs_controller_listbox_CreateItem,
	PopulateFn = ifs_controller_listbox_PopulateItem,
	nocreatebackground = 1,
}

function ifs_opt_controller_CreateElements(this)
	local k,v
	for k,v in Platform_btn_map do
	
		if(v.type ~= 99) then

			-- add one element to ifs_opt_controller.buttons
			this.buttons[k]    = NewIFImage { texture = v.hiTex }  --"planet_1_static" }
			this.buttons[k].x  = v.x
			this.buttons[k].y	= v.y
			IFImage_fnSetTexturePos(this.buttons[k],0,0,v.w,v.h)
			IFObj_fnSetAlpha(this.buttons[k],0.1)

			-- don't create it for the special case y-flip item
			if( v.type ~= 5 ) then
				this.lines[k] = NewSegmentLine( v.lx1,v.ly1,v.lx2,v.ly2,"")
			end
		end

	end
	this.CurButton = 1
	IFObj_fnSetAlpha(this.buttons[this.CurButton],1.0)

	-- Ask game for screen size, fill in values
	local r,b,v,widescreen = ScriptCB_GetScreenInfo()
	this.bgTexture.localpos_r = r*widescreen
	this.bgTexture.localpos_b = b
	this.bgTexture.uvs_b = v

	ListManager_fnInitList(this.listbox,ifs_controller_listbox_layout)
	if(gPlatformStr == "XBox") then
		this.flipStatus.y = 113
		this.SensitivityText.y = 143
		this.ResetText.y = 173
	end

	if(this.Helptext_Accept) then
		IFText_fnSetString(this.Helptext_Accept.helpstr,"common.change")
	end
end

ifs_opt_controller = NewIFShellScreen {
	nologo = 1,
	movieIntro      = nil, -- played before the screen is displayed
	movieBackground = nil, -- played while the screen is displayed
    enterSound      = "",
    exitSound       = "",

	title = NewIFText {
--		string = "ifs.controls.Ps2controllervehunittitle",
		font = "gamefont_large",
		textw = 460,
		y = 0,
		ScreenRelativeX = 0.5, -- center
		ScreenRelativeY = 0, -- top
		--inert = 1,
		nocreatebackground = 1,
	},

	cursor = NewButtonWindow {
		ScreenRelativeX = 0.5,
		ScreenRelativeY = 0.45,
		width = 120, w = 120,
		height = 42, h = 42,
		ZPos = 181, -- Behind the text items
	},

	controller = NewIFImage {
		ScreenRelativeX = 0.5,
		ScreenRelativeY = 0.45,
		texture = "controller",
		localpos_l = -128,
		localpos_t = -128,
		localpos_r = 128,
		localpos_b = 128,
		ZPos = 240, -- behind most things
		--inert = 1,
	},

	flipStatus = NewIFText {
		ScreenRelativeX = 0.5,
		ScreenRelativeY = 0.45,
		ZPos = 100,
		string = "",
		font = "gamefont_small",
		textw = 380,
		y = 175 - 54,
		ColorR = 255, ColorB = 255, ColorG = 255,
		nocreatebackground = 1,
	},

 	SensitivityText = NewIFText {
 		ScreenRelativeX = 0.5,
 		ScreenRelativeY = 0.45,
 		ZPos = 100,
-- 		string = "ifs.controls.looksensitivity",
 		font = "gamefont_small",
 		textw = 380,
 		y = 175 - 27,
		ColorR = 255, ColorB = 255, ColorG = 255,
		nocreatebackground = 1,
 	},

	ResetText = NewIFText {
		ScreenRelativeX = 0.5,
		ScreenRelativeY = 0.45,
		ZPos = 100,
		string = "ifs.controls.reset",
		font = "gamefont_small",
		textw = 380,
		y = 175,
		ColorR = 255, ColorB = 255, ColorG = 255,
		nocreatebackground = 1,
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

		inert = 1, -- delete from lua memory once created.
	},
	
	buttons = NewIFContainer {
		ScreenRelativeX = 0.5, -- centre
		ScreenRelativeY = 0.45, -- centre
	},

	lines = NewIFContainer {
		ScreenRelativeX = 0.5, -- centre
		ScreenRelativeY = 0.45, -- centre
	},

	listbox = NewButtonWindow { ZPos = 200, x=0, y = 40,
		ScreenRelativeX = 0.5, -- center
		ScreenRelativeY = 0.45, -- middle of screen
		width = ifs_controller_listbox_layout.width + 35,
		height = ifs_controller_listbox_layout.showcount * (ifs_controller_listbox_layout.yHeight + ifs_controller_listbox_layout.ySpacing) + 30
	},

	cont_menu_state = 0,
	cont_element_idx = 1,
	CurButton=1,
		
	Enter = function(this)
		gIFShellScreenTemplate_fnEnter(this, bFwd)
		gControlMode = ScriptCB_GetControlMode()
		if(gPlatformStr == "XBox") then
			-- idx1 is XBox white button. Start in top-left
			ifs_opt_controller_fnSetNextButton(this,2)	
		else
			this.cont_element_idx=1 -- L2. Start in top-left
			this.CurButton = 1
		end
		
		
		if(gNoControllerChanges) then
			this.CurButton = 17 -- y-flip
			this.cont_element_idx = 17
			IFObj_fnSetVis(this.ResetText,nil)
			IFObj_fnSetVis(this.buttons[1], nil)
		end

		this.cont_menu_state=0
		
		IFObj_fnSetAlpha(this.buttons[this.CurButton],1.0)
		ifs_opt_controller_GetAllEntries(this)
		ifs_opt_controller_SetLineVisibility(this,1)
		IFObj_fnSetVis(this.listbox,nil)
		if( gControlMode == 0 ) then
			IFText_fnSetString(this.title,"ifs.Controls.Soldier.title")
			IFObj_fnSetVis( this.SensitivityText , 1)
		elseif( gControlMode == 1 ) then
			IFText_fnSetString(this.title,"ifs.Controls.Vehicle.title")
			IFObj_fnSetVis( this.SensitivityText , nil)
		elseif( gControlMode == 2 ) then
			IFText_fnSetString(this.title,"ifs.Controls.Flyer.title")
			IFObj_fnSetVis( this.SensitivityText , nil)
		end
	
		ifs_opt_controller_fnMoveCursor(this)	

		AnimationMgr_AddAnimation(this.Helptext_Back, {fStartAlpha = 0, fEndAlpha = 1,})
		AnimationMgr_AddAnimation(this.controller, {fStartAlpha = 0, fEndAlpha = 1,})
		AnimationMgr_AddAnimation(this.flipStatus, {fStartAlpha = 0, fEndAlpha = 1,})
		AnimationMgr_AddAnimation(this.ResetText, {fStartAlpha = 0, fEndAlpha = 1,})
		AnimationMgr_AddAnimation(this.buttons, {fStartAlpha = 0, fEndAlpha = 1,})
		AnimationMgr_AddAnimation(this.lines, {fStartAlpha = 0, fEndAlpha = 1,})

	end,

	Exit = function(this)
		IFObj_fnSetAlpha(this.buttons[this.CurButton],0.25)
	end,

	Input_Accept = function(this)
		-- If base class handled this work, then we're done
		if(gShellScreen_fnDefaultInputAccept(this)) then
			return
		end

		ifelm_shellscreen_fnPlaySound(this.acceptSound)
--Bring a Menu up
		if(this.cont_menu_state==0) then
			-- *
			-- Go from controller button selection to input option selection
			-- *

			local cont_menu_type = Platform_btn_map[this.cont_element_idx].type
			
			
			local CurFunc = Platform_btn_map[this.cont_element_idx].func
			local Button = Platform_btn_map[this.cont_element_idx]

			-- Special-case the bottom "buttons"
			if(cont_menu_type == 5) then
				if(Button.name == "yflip") then
					-- Negate this
					ScriptCB_SetYAxisFlip(1 - ScriptCB_GetYAxisFlip())
				elseif (Button.name == "reset") then
					-- Ask them first
					ifs_opt_controller_SetLineVisibility(this,nil)
					Popup_YesNo.CurButton = "no" -- default
					Popup_YesNo.fnDone = ifs_opt_controller_fnResetPopupDone
					IFText_fnSetString(Popup_YesNo.title,"ifs.controls.askreset")
					AnimationMgr_AddAnimation(this.controller, {fTotalTime = 0.3, fStartAlpha = 1, fEndAlpha = 0.4,})
					Popup_YesNo:fnActivate(1)
				end -- checking button name

				-- Always refresh all buttons
				ifs_opt_controller_GetAllEntries(this)
				ifs_opt_controller_fnMoveCursor(this)
				return
			end

			if(Platform_btn_map[this.cont_element_idx].name == "lang") then
				CurFunc = 16 + ScriptCB_GetFunctionIdForAnalogId(0, gControlMode)
			elseif (Platform_btn_map[this.cont_element_idx].name == "rang") then
				CurFunc = 16 + ScriptCB_GetFunctionIdForAnalogId(1, gControlMode)
			end

			if(cont_menu_type == 1) then
				if( gControlMode == 0 ) then --infantry mode, pass the infantry box
					ifs_controller_listbox_contents = contents_functype_infantry_button
				elseif (gControlMode == 1) then
					if(gPlatformStr == "PS2") then
						ifs_controller_listbox_contents = contents_functype_vehicle_buttonPS2
					else
						ifs_controller_listbox_contents = contents_functype_vehicle_button
					end
				else
					if(gPlatformStr == "PS2") then
						ifs_controller_listbox_contents = contents_functype_flyer_buttonPS2
					else
						ifs_controller_listbox_contents = contents_functype_flyer_button
					end
				end
			elseif (cont_menu_type == 3) then	
				if( gControlMode == 0 ) then --infantry mode, pass the infantry box
					ifs_controller_listbox_contents = contents_functype_infantry_stick
				elseif (gControlMode == 1) then
					ifs_controller_listbox_contents = contents_functype_vehicle_stick
				else
					ifs_controller_listbox_contents = contents_functype_flyer_stick
				end
			else
				print("Unknown type!")

			end

			local i
			local aListIndex = -1 --this is lua, start indices at 1!!!
			for i = 1,getn(ifs_controller_listbox_contents) do
				if(ifs_controller_listbox_contents[i].showidx == CurFunc) then
					aListIndex = i
				end
			end

			if(aListIndex < 0) then
--				print("Uhoh, couldn't find CurFunc ",CurFunc," in listbox list, idx =",this.cont_element_idx)
				aListIndex = 1 -- safety value
			end

			-- Auto-center the listbox on this.
			ifs_controller_listbox_layout.SelectedIdx = aListIndex
			ifs_controller_listbox_layout.CursorIdx = aListIndex
			local FirstIdx = max(aListIndex - (floor(ifs_controller_listbox_layout.showcount * 0.5)),1)
			ifs_controller_listbox_layout.FirstShownIdx = FirstIdx

			ListManager_fnFillContents(this.listbox,ifs_controller_listbox_contents,ifs_controller_listbox_layout)
		
			--Next round deal with the menu 
			this.cont_menu_state=1
			this.cont_element_idx = this.CurButton
			ifs_opt_controller_SetLineVisibility(this,nil,this.lines[this.CurButton])
			this.CurButton = 1
		
			--The position of the window depends on which side of the controller we are on
			if(Button.x < 0) then
				--Left side
				IFObj_fnSetPos(this.listbox,120,0)
			else
				--Right side
				IFObj_fnSetPos(this.listbox,-120,0)
			end

			IFObj_fnSetVis(this.listbox,1)
--			IFButton_fnSelect(this.cur_popup_functype[this.CurButton],1)
------------The Menu is Up, They've made a choice
		else 
			-- *
			-- Select input option and return to controller button selection
			-- *
			-- Unselect menu position, make menu disappear
			IFObj_fnSetVis(this.listbox,nil)
			this.cur_popup_functype = nil -- clear it out.

			local Selection = ifs_controller_listbox_contents[ifs_controller_listbox_layout.SelectedIdx]
			local ButtonIdx = Selection.showidx
--			print("ButtonIdx = ",ButtonIdx)
			
			-- Set the internal function_id representation for this choice
			ifs_opt_controller_SetEntry(this, this.cont_element_idx, ButtonIdx)

			-- Go back to the button selection			
			this.cont_menu_state=0
			this.CurButton = this.cont_element_idx
			IFObj_fnSetAlpha(this.buttons[this.CurButton],1.0)
			ifs_opt_controller_SetLineVisibility(this,1)
			ifs_opt_controller_fnMoveCursor(this)
		end		
	end,

	Input_Back = function(this)
		if(this.cont_menu_state==0) then
            ifelm_shellscreen_fnPlaySound("shell_menu_exit")
			ScriptCB_PopScreen()
		else
			IFObj_fnSetVis(this.listbox,nil)
			-- Go back to the button selection			
			this.cont_menu_state=0
			this.CurButton = this.cont_element_idx
			IFObj_fnSetAlpha(this.buttons[this.CurButton],1.0)
			ifs_opt_controller_SetLineVisibility(this,1)
            ifelm_shellscreen_fnPlaySound(this.cancelSound)
		end
	end,

	Input_GeneralUp = function(this)
		-- If base class handled this work, then we're done
		if(gShellScreen_fnDefaultInputUp(this)) then
			return
		end

		if(not gNoControllerChanges) then
			if(this.cont_menu_state==1) then
				ListManager_fnNavUp(this.listbox,ifs_controller_listbox_contents,ifs_controller_listbox_layout)
			
						
			elseif ((this.cont_menu_state==0) and (Platform_btn_map[this.CurButton].conU ~= 0)) then
                		ifelm_shellscreen_fnPlaySound(this.selectSound)
				
				if (( gControlMode > 0) and ( Platform_btn_map[this.CurButton].conU == 20 ) ) then
					ifs_opt_controller_fnSetNextButton(this,Platform_btn_map[20].conU)	
				else 
					ifs_opt_controller_fnSetNextButton(this,Platform_btn_map[this.CurButton].conU)	
				end
			end
		end
	end,

	Input_LTrigger = function(this)
		if(not gNoControllerChanges) then
			if(this.cont_menu_state==1) then
				ListManager_fnPageUp(this.listbox,ifs_controller_listbox_contents,ifs_controller_listbox_layout)
			end
		end
	end,
	
	Input_GeneralDown = function(this)
		-- If base class handled this work, then we're done
		if(gShellScreen_fnDefaultInputDown(this)) then
			return
		end

		if(not gNoControllerChanges) then
			if(this.cont_menu_state==1) then
				ListManager_fnNavDown(this.listbox,ifs_controller_listbox_contents,ifs_controller_listbox_layout)
			elseif ((this.cont_menu_state==0) and (Platform_btn_map[this.CurButton].conD ~= 0)) then
                ifelm_shellscreen_fnPlaySound(this.selectSound)
				if( ( gControlMode > 0) and ( Platform_btn_map[this.CurButton].conD == 20  ) ) then
					ifs_opt_controller_fnSetNextButton(this,Platform_btn_map[20].conD)	
				else
					ifs_opt_controller_fnSetNextButton(this,Platform_btn_map[this.CurButton].conD)	
				end
				
			end
		end
	end,

	Input_RTrigger = function(this)
		if(not gNoControllerChanges) then
			if(this.cont_menu_state==1) then
				ListManager_fnPageDown(this.listbox,ifs_controller_listbox_contents,ifs_controller_listbox_layout)
			end
		end
	end,

	Input_GeneralLeft = function(this)
		if(not gNoControllerChanges) then

			if((this.cont_menu_state==0) and (Platform_btn_map[this.CurButton].conL ~= 0)) then
			
				ifs_opt_controller_fnSetNextButton(this,Platform_btn_map[this.CurButton].conL)	
				
                ifelm_shellscreen_fnPlaySound(this.selectSound)
			else
				if((this.cont_menu_state==0) and (Platform_btn_map[this.CurButton].name == "lookslide")) then
					if(this.iControllerScale > 1) then
                        ifelm_shellscreen_fnPlaySound(this.selectSound)
						this.iControllerScale = this.iControllerScale - 1
						ScriptCB_SetControlScale(this.iControllerScale)
						ifs_opt_controller_UpdateSensitivity(this)
					end
				end
			end
		end
	 end,

	Input_GeneralRight = function(this)
		if(not gNoControllerChanges) then
			if((this.cont_menu_state==0) and (Platform_btn_map[this.CurButton].conR ~= 0)) then
				
					ifs_opt_controller_fnSetNextButton(this,Platform_btn_map[this.CurButton].conR)	
			
                ifelm_shellscreen_fnPlaySound(this.selectSound)
			else
				if((this.cont_menu_state==0) and (Platform_btn_map[this.CurButton].name == "lookslide")) then
					if(this.iControllerScale < 10) then
                        ifelm_shellscreen_fnPlaySound(this.selectSound)
						this.iControllerScale = this.iControllerScale + 1
						ScriptCB_SetControlScale(this.iControllerScale)
						ifs_opt_controller_UpdateSensitivity(this)
					end
				end
			end
		end
	 end,

	Update = function(this, fDt)
		gIFShellScreenTemplate_fnUpdate(this, fDt) -- call default

		-- Bounce cursor only if moving it around.
		if(this.cont_menu_state==0) then
			gButton_CurSizeAdd = gButton_CurSizeAdd + fDt * gButton_CurDir
			if(gButton_CurSizeAdd > 1) then
				gButton_CurSizeAdd = 1
				gButton_CurDir = -abs(gButton_CurDir)
			elseif (gButton_CurSizeAdd < 0.3) then
				gButton_CurSizeAdd = 0.3
				gButton_CurDir = abs(gButton_CurDir)
			end
			this.cursor:fnSetSize(this.cursor.w + 5 * gButton_CurSizeAdd, this.cursor.h + 2 * gButton_CurSizeAdd)
		end
	end,
}



-- *******************************
-- UTILITY FUNCTIONS FOR THIS MENU
-- *******************************

function ifs_opt_controller_UpdateSensitivity(this)
	this.iControllerScale = ScriptCB_GetControlScale()
	local ScaleUStr = ScriptCB_usprintf("ifs.controls.looksensitivity",
																			ScriptCB_tounicode(format("%d",this.iControllerScale)))
	IFText_fnSetUString(this.SensitivityText,ScaleUStr)
end


function ifs_opt_controller_GetAllEntries(this)
	local k,v
	-- Updates stored label ID's and onscreen values based on internal values
	for k,v in Platform_btn_map do
		-- Make sure we're dealing with a normal button (not the special case y-flip)
		if((v.type ~= 5) and (v.type ~= 99)) then 
			-- Get the Global functionID assigned to this button
			v.func = ScriptCB_GetFunctionIdForButtonId(k)
			-- Set the internal string to match the functionID

			local ShowIdx = v.func
			--"ifs.controls.General.SquadRight",			-- 14
			--Hack for the squad controls
			if ( (ShowIdx > 10) and (ShowIdx < 15) ) then
				ShowIdx = 10
			end

			if(v.name == "lang") then
				--get(stick,mode)
				ShowIdx = 16 + ScriptCB_GetFunctionIdForAnalogId(0, gControlMode) + 19 * gControlMode
			elseif (v.name == "rang") then
				
				ShowIdx = 16 + ScriptCB_GetFunctionIdForAnalogId(1, gControlMode) + 19 * gControlMode
			else
				if(ShowIdx > 0) then
					ShowIdx = ShowIdx + 19* gControlMode
				end
			end
			
			if(ShowIdx > 0) then
				IFText_fnSetString(this.lines[k].label, gButtonFunctionStrings[ShowIdx])
			else
				IFText_fnSetString(this.lines[k].label, "ifs.controls.General.none")
			end
			--			end
		end
	end

	-- Hack, set text for Start/Back directly
	IFText_fnSetString(this.lines[8].label, "ifs.controls.General.Map")
	IFText_fnSetString(this.lines[9].label, "ifs.controls.General.Pause")
	
	-- Updates visual status of y-axis flip
	if(ScriptCB_GetYAxisFlip() == 1) then
		IFText_fnSetString(this.flipStatus,"ifs.controls.General.FlipYAxisOn")
	else
		IFText_fnSetString(this.flipStatus,"ifs.controls.General.FlipYAxisOff")	
	end

	ifs_opt_controller_UpdateSensitivity(this)
end

function ifs_opt_controller_SetEntry(this, buttonIdx, menuIdx)
	-- Sets internal function id based on buttonIndex, the menuIndex selected 
	-- and the type of menu (implied by buttonIndex)
	local type = Platform_btn_map[buttonIdx].type
	if(type == 3) then 
		--analog stick
		--set(stick,mode,function)
		if(Platform_btn_map[buttonIdx].name == "lang") then
			ScriptCB_SetFunctionIdForAnalogId(0, gControlMode, menuIdx - 16);
		else
			ScriptCB_SetFunctionIdForAnalogId(1, gControlMode, menuIdx - 16);
		end
	else
		--some type of digital button
		print("JV- SettingFunctionForButton: buttonIdx, Type, menuIdx=", buttonIdx,type,menuIdx)
		ScriptCB_SetFunctionIdForButtonId(buttonIdx, func_map_vehunit[type].functions[menuIdx])
	end
	
	-- Also update the onscreen text based on this change
	ifs_opt_controller_GetAllEntries(this)
end


-- *****************
--       DATA
-- *****************

-- Describes the mapping of text on the menus that pop up (these must match)
func_map_vehunit = {             -- 1=t  2=d  3=a  4=b
	-- NUMBERFUNCTIONS           LIST of GLOBAL_FUNCTION_LABEL
	
     {   num=13,      functions={1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}, }, --oh look its a 1 to 1 mapping...ugly stupid code.
     {   num=13,      functions={1,2,3,4,5,6,7,8,9,13,14,15,16}, },
     {   num=3,       functions={18,19,20}, },
     {   num=12,      functions={1,2,3,4,5,6,7,8,9,13,14,12,16}, },
}

vbutton_layout_functype_a_vehunit = {
	FlatButtons = 1,
	yTop = -30,
	yHeight = 16,
	ySpacing  = 2,
	width = 150,
	font = "gamefont_small",
	buttonlist = { 
		{ tag = 1, string = "ifs.controls.General.Move_Strafe", },
		{ tag = 2, string = "ifs.controls.General.Move_Turn", },
		{ tag = 3, string = "ifs.controls.General.FreeLook", },
	},
	nocreatebackground = 1,
}

 
-- *********************
-- INITIALIZATION SCRIPT
-- *********************
-- Call the creator when we parse this file for first time.
ifs_opt_controller_CreateElements(ifs_opt_controller)
ifs_opt_controller_CreateElements = nil

ifs_opt_controller.bg = nil -- wipe out the annoying background
AddIFScreen(ifs_opt_controller,"ifs_opt_controller")
