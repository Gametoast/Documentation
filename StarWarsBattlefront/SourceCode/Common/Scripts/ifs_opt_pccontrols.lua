-- this file overrides the controller screen in the default build with the PC controls options menu



-- This is the input popup stuff
gButtonFunctionStrings = {
	-- GLOBAL_FUNCTION_LABEL (index implies Function_ID)
	"ifs.controls.General.Crouch",				-- 1
	"ifs.controls.General.Jump",				-- 2 [or 9]
	"ifs.controls.General.Primary",				-- 3
	"ifs.controls.General.Secondary",			-- 4
	"ifs.controls.General.PrimaryNext",			-- 5
	"ifs.controls.General.SecondaryNext",		-- 6
	"ifs.controls.General.Action",				-- 7
	"ifs.controls.General.Zoom",				-- 8
	"ifs.controls.General.Land_Takeoff",		-- 9 [alt from 2, auto-switched for flyer]
	"ifs.controls.General.RollLeft",			-- 10
	"ifs.controls.General.RollRight",			-- 11
	"ifs.controls.General.Reload",				-- 12
	"ifs.controls.General.SquadUp",				-- 13
	"ifs.controls.General.SquadLeft",			-- 14
	"ifs.controls.General.SquadDown",			-- 15
	"ifs.controls.General.SquadRight",			-- 16
	"ifs.controls.General.FirstThirdPerson",	-- 17
	"ifs.controls.General.Move_Strafe",			-- 18
	"ifs.controls.General.Move_Turn",			-- 19
	"ifs.controls.General.FreeLook",			-- 20
	"ifs.controls.General.Throttle_Roll",		-- 21
	"ifs.controls.General.Pitch_Turn",			-- 22
}

-----------------------------------
-- key press popup

ifs_opt_pckeyboard_Popup_KeyPress = NewPopup {		
	ScreenRelativeX = 0.5, -- centered onscreen
	ScreenRelativeY = 0.5,
	height = 100,
	width = 180,
	ZPos = 50,

	title = NewIFText {
		string = "ifs.GameOpt.pc_keybindpopup",
		font = "gamefont_medium",
		textw = 160,
		texth = 80,
		y = -40,
		inert = 1,
		nocreatebackground = 1,
	},

	buttons = NewIFContainer {
	},

	Input_GeneralUp = function(this)
	end,
	Input_GeneralDown = function(this)
	end,
	Input_GeneralLeft = function(this)
	end,
	Input_GeneralRight = function(this)
	end,
	
	Enter = function(this)
--		print("Entered the enter function")
		this.gDelay = 0.35
	end,
	
	Input_Back = function(this)
	end,

	Update = function(this, fDt)
		gIFShellScreenTemplate_fnUpdate(this, fDt)  -- call base class
		this.gDelay = this.gDelay - fDt
		
		if (this.gDelay > 0.0) then
			return
		end
		
		rtype = ScriptCB_SetBinding(ifs_opt_pckeyboard_listbox_layout.SelectedIdx)
		if(rtype == 1) then
--			print("Detected Input")
			ifs_opt_pccontrols.RepaintListbox(ifs_opt_pccontrols)
			gPopup_fnInput_Back(this)
		end
	end
}
--AddVerticalButtons(ifs_opt_pckeyboard_Popup_KeyPress.buttons,Vertical_YesNoButtons_layout)
CreatePopupInC(ifs_opt_pckeyboard_Popup_KeyPress,"ifs_opt_pckeyboard_Popup_KeyPress")

-- End of popup Input stuff

-- Helper functions for Input stuff

-- Helper function. Given a layout (x,y,width, height), returns a
-- fully-built item.
function ifs_opt_pckeyboard_Listbox_CreateItem(layout)
	-- Make a coordinate system pegged to the top-left of where the cursor would go.
	local Temp = NewIFContainer {
		x = layout.x - 0.5 * layout.width, y=layout.y - 10
	}

	-- Changed to shrink text NM 8/25/04 - Squad commands are too long
	-- in Spanish to fit w/o having to really shrink things. Bug 9153
	local UseFont = "gamefont_tiny"
	local UseHScale = 1
	local UseVScale = 1
	if(ScriptCB_GetLanguage() ~= "english") then
		UseHScale = 0.85
		UseVScale = 1
	end

	Temp.actionStr = NewIFText{
		x = 10, y = 0, textw = 0.4 * layout.width, 
		valign = "vcenter", halign = "left", 
		font = UseFont,
		--ColorR= 255, ColorG = 255, ColorB = 255,
		flashy = 0,
		texth = layout.height,
		HScale = UseHScale,
		VScale = UseVScale,
	}
	Temp.keyStr = NewIFText{ 
		x = layout.width*.4, y = 0, 
		textw = 0.6 * layout.width, 
		valign = "vcenter", halign = "left", 
		font = UseFont,
		ColorR= 255, ColorG = 255, ColorB = 255,
		flashy = 0,
		texth = layout.height,
		HScale = UseHScale,
		VScale = UseVScale,
	}

		
	return Temp
end
-- Helper function. For a destination item (previously created w/
-- CreateItem), fills it in with data, which may be nil (==blank it)
function ifs_opt_pckeyboard_Listbox_PopulateItem(Dest,Data)
	if(Data) then
		IFText_fnSetUString(Dest.actionStr,Data.actionStr)
		IFText_fnSetUString(Dest.keyStr,Data.keyStr)
	end

	IFObj_fnSetVis(Dest,Data) -- Show if there are contents
end

--NOTE TO SELF:  Move this down
ifs_opt_pckeyboard_listbox_layout = {
	showcount = 20,
--	yTop = -130 + 13,
	yHeight = 23,
	ySpacing  = 0,
	width = 430,
	x = 0,
	slider = 1,
	CreateFn = ifs_opt_pckeyboard_Listbox_CreateItem,
	PopulateFn = ifs_opt_pckeyboard_Listbox_PopulateItem,
	font = "gamefont_tiny",
	
}
-- this creates the table _listbox_contents below, adding all the action/key pairs
function ifs_opt_pckeyboard_CreateListboxContents(contents)
	for index, value in gButtonFunctionStrings do
		if index then
			contents[index] = { }
			contents[index].actionStr = value
			contents[index].keyStr = "R"
		end
	end
end
ifs_opt_pckeyboard_listbox_contents = {
--	{ actionStr = "Fire", keyStr = "Ctrl"},
}
--End of Helper functions for Input stuff


function ifs_opt_pccontrols_fnUpdateStrings(this)
	--update slider position
	local mouseSens, mouseSensStep, mouseSensMax = ScriptCB_GetMouseSensitivity()
	this.sliders.mousesens.thumbposn = (mouseSens / mouseSensMax)
	HSlider_MoveThumb(this.sliders.mousesens)
	RoundIFButtonLabel_fnSetUString(this.buttons.mousesens,ScriptCB_tounicode(format("%d",mouseSens)))

	local joysense, joysenseStep, joysenseMax = ScriptCB_GetJoySensitivity()
--	print("joysense, joysenseStep, joysenseMax ",joysense,joysenseStep,joysenseMax)
	
	this.sliders.joysens.thumbposn = (joysense / joysenseMax)
	HSlider_MoveThumb(this.sliders.joysens)
	RoundIFButtonLabel_fnSetUString(this.buttons.joysens,ScriptCB_tounicode(format("%d",joysense)))
	
	local flip = ScriptCB_GetYAxisFlip()
	
	if ( flip == 1 ) then      
		RoundIFButtonLabel_fnSetString(this.buttons.invert, "common.yes" )
	else	
		RoundIFButtonLabel_fnSetString(this.buttons.invert, "common.no" )
	end
	
	local mode = ScriptCB_GetControlMode()
--	print("Mode=",mode)
	if( mode == 0 ) then
		IFObj_fnSetAlpha(this.RInfo.InfantryTab,1.0)
		IFObj_fnSetAlpha(this.RInfo.VehicleTab,.4)
		IFObj_fnSetAlpha(this.RInfo.FlyerTab,.4)
		
		IFObj_fnSetColor(this.buttons.soldier,100 , 100, 255)
		IFObj_fnSetColor(this.buttons.vehicle,200 , 200, 200)
		IFObj_fnSetColor(this.buttons.flyer,200 , 200, 200)
		
	elseif (mode == 1) then
	--	IFObj_fnSetColor(this.RInfo.InfantryTab, 100 , 100, 100)
		IFObj_fnSetAlpha(this.RInfo.InfantryTab,.4)
		IFObj_fnSetAlpha(this.RInfo.VehicleTab,1.0)
		IFObj_fnSetAlpha(this.RInfo.FlyerTab,.4)
		
		IFObj_fnSetColor(this.buttons.vehicle,100 , 100, 255)
		IFObj_fnSetColor(this.buttons.soldier,200 , 200, 200)
		IFObj_fnSetColor(this.buttons.flyer,200 , 200, 200)
	else
		IFObj_fnSetAlpha(this.RInfo.InfantryTab,.4)
		IFObj_fnSetAlpha(this.RInfo.VehicleTab,.4)
		IFObj_fnSetAlpha(this.RInfo.FlyerTab,1.0)
		
		IFObj_fnSetColor(this.buttons.flyer,100 , 100, 255)
		IFObj_fnSetColor(this.buttons.vehicle,200 , 200, 200)
		IFObj_fnSetColor(this.buttons.soldier,200 , 200, 200)
	end
	
end

function ifs_opt_pccontrols_fnChangeMouseSensitivity(this,delta)
	local mouseSens, mouseSensStep, mouseSensMax = ScriptCB_GetMouseSensitivity()
	mouseSens = mouseSens + mouseSensStep * delta
	
	mouseSens = max(mouseSens,0)
	mouseSens = min(mouseSens,mouseSensMax)
	ScriptCB_SetMouseSensitivity(mouseSens)
end

function ifs_opt_pccontrols_fnChangeJoySensitivity(this,delta)
	local joySens, joySensStep, joySensMax = ScriptCB_GetJoySensitivity()
	joySens = joySens + joySensStep * delta
	joySens = max(joySens,0)
	joySens = min(joySens,joySensMax)
--	print( "New Sensitivity=", joySens )
	ScriptCB_SetControlScale(joySens)
end

ifs_opt_pccontrols = NewIFShellScreen {
	nologo = 1,
    movieIntro      = nil, -- played before the screen is displayed
    movieBackground = nil, -- played while the screen is displayed
	bNohelptext_backPC = 1,
	  
	title = NewIFText {
		string = "ifs.GameOpt.pc_optionstitle",
		font = "gamefont_large",
		y = 05,
		textw = 460, -- center on screen. Fixme: do real centering!
		ScreenRelativeX = 0.5, -- center
		ScreenRelativeY = 0, -- top
		inert = 1, -- delete out of Lua mem when pushed to C
		nocreatebackground=1,
	},

	bindTitle = NewIFText {
		string = "ifs.GameOpt.pc_configbindings",
		font = "gamefont_large",
		y = 210,
		textw = 460, -- center on screen. Fixme: do real centering!
		ScreenRelativeX = 0.5, -- center
		ScreenRelativeY = 0, -- top
		inert = 1, -- delete out of Lua mem when pushed to C
		flashy=0,
	},
	
	buttonlabels = NewIFContainer {
		ScreenRelativeX = 0.15,
		ScreenRelativeY = 0,
	},
	buttons = NewIFContainer {
		ScreenRelativeX = 1,
		ScreenRelativeY = 0,
	},
	
--	hbuttons = NewIFContainer {
--		ScreenRelativeX = 0.15,
--		ScreenRelativeY = 0,
--	},
	
	sliders = NewIFContainer {
		ScreenRelativeX = 0.15,
		ScreenRelativeY = 0,
	},

	Enter = function(this, bFwd)
		ScriptCB_MarkCurrentProfile()
		this.bResetProfile = nil
	
		gIFShellScreenTemplate_fnEnter(this, bFwd) -- call default enter function
		AnimationMgr_AddAnimation(this.buttonlabels, {fStartAlpha = 0, fEndAlpha = 1,})
		
		ScriptCB_SetControlMode(0) --default to soldier first
		
		
		ifs_opt_pccontrols_fnUpdateStrings(this)
		
		-- Reset listbox, show it. [Remember, Lua starts at 1!]
		ifs_opt_pckeyboard_listbox_layout.FirstShownIdx = 1
		ifs_opt_pckeyboard_listbox_layout.SelectedIdx = 1
		ifs_opt_pckeyboard_listbox_layout.CursorIdx = 1
		ScriptCB_GetKeyBoardCmds()
		ListManager_fnFillContents(this.listbox,ifs_opt_pckeyboard_listbox_contents,ifs_opt_pckeyboard_listbox_layout)
	end, -- function Enter()
	
	Exit = function(this)
		if( this.bResetProfile ) then
			ScriptCB_ReloadMarkedProfile()
		end
		if(gCurHiliteButton) then
			IFButton_fnSelect(gCurHiliteButton,nil)
		end
	end,

	Input_Accept = function(this) 
		-- If base class handled this work, then we're done
		if(gShellScreen_fnDefaultInputAccept(this,1)) then
			return
		end

--		print("CurButton=", this.CurButton)
		if(this.CurButton == "cancel" ) then
			this.bResetProfile = 1		
			this:Input_Back()
			return
		end

		if(this.CurButton == "_back") then
			this:Input_Back()
			return
		end
		
		if((gMouseOverHorz) and (gMouseOverHorz.MousePercentage)) then
			-- Convert mouse percentage into 0..10 scale used on this screen

			if(gMouseOverHorz.tag == "mousesens") then
				local mouseSens, mouseSensStep, mouseSensMax = ScriptCB_GetMouseSensitivity()
				mouseSens = gMouseOverHorz.MousePercentage * mouseSensMax
				ScriptCB_SetMouseSensitivity(mouseSens)

			elseif (gMouseOverHorz.tag == "joysens") then
				local joysense, joysenseStep, joysenseMax = ScriptCB_GetJoySensitivity()
				joysense = gMouseOverHorz.MousePercentage * joysenseMax
				ScriptCB_SetControlScale(joysense)
			end

			ifs_opt_pccontrols_fnUpdateStrings(this)
			return
		end
			


		if( gMouseListBox ~= nil ) then  --Slight hack, could be dangerous if you add list boxes
			gMouseListBox.Layout.SelectedIdx = gMouseListBox.Layout.CursorIdx
			ListManager_fnFillContents(gMouseListBox,gMouseListBox.Contents,gMouseListBox.Layout)
			ifs_opt_pckeyboard_Popup_KeyPress:fnActivate(1)
		end
		ScriptCB_SndPlaySound("shell_menu_ok");
		if (this.CurButton == "mousesens") then
			ifs_opt_pccontrols_fnChangeMouseSensitivity(this,1.0)
		elseif (this.CurButton == "joysens") then	
			ifs_opt_pccontrols_fnChangeJoySensitivity(this,1.0)
		elseif (this.CurButton == "reset") then
--			print("Resetting Controls")
			ScriptCB_ResetControl()
			ifs_opt_pccontrols_fnUpdateStrings(this)
			this.RepaintListbox(this)
		elseif (this.CurButton == "invert") then
			local flip = ScriptCB_GetYAxisFlip()
			
			if ( flip == 1 ) then
				--was flipped, unflip
				ScriptCB_SetYAxisFlip( 0 )
				RoundIFButtonLabel_fnSetString(this.buttons.invert, "common.no" )
			else
				ScriptCB_SetYAxisFlip( 1 )
				RoundIFButtonLabel_fnSetString(this.buttons.invert, "common.yes" )
			end
		elseif (this.CurButton == "config") then
			ScriptCB_PushScreen("ifs_opt_pckeyboard") --("ifs_opt_pckeyboard")
		elseif (this.CurButton == "soldier") then
			ScriptCB_SetControlMode(0)
			this.RepaintListbox(this)
		elseif (this.CurButton == "vehicle") then
			ScriptCB_SetControlMode(1)
			this.RepaintListbox(this)
		elseif (this.CurButton == "flyer") then
			ScriptCB_SetControlMode(2)
			this.RepaintListbox(this)
		elseif (this.CurButton == "apply") then
			this.bResetProfile = nil
 			this:Input_Back(1)
 		end
		ifs_opt_pccontrols_fnUpdateStrings(this)
	end,

	Input_Back = function(this)
		ScriptCB_PopScreen()
	end,

	Input_GeneralLeft = function(this)
		if (this.CurButton == "mousesens") then
			ifs_opt_pccontrols_fnChangeMouseSensitivity(this,-1.0)
		elseif( this.CurButton == "joysens") then
			ifs_opt_pccontrols_fnChangeJoySensitivity(this,-1.0)
		elseif( this.CurButton == "invert") then
			this:Input_Accept(1)
		else
			gDefault_Input_GeneralLeft(this)
		end
		ifs_opt_pccontrols_fnUpdateStrings(this)
	end,

	Input_GeneralRight = function(this)
		if (this.CurButton == "mousesens") then
			ifs_opt_pccontrols_fnChangeMouseSensitivity(this,1.0)
		elseif( this.CurButton == "joysens") then
			ifs_opt_pccontrols_fnChangeJoySensitivity(this,1.0)
		elseif( this.CurButton == "invert") then
			this:Input_Accept(1)
		else
			gDefault_Input_GeneralRight(this)
		end
		ifs_opt_pccontrols_fnUpdateStrings(this)
	end,

	Input_GeneralUp = function(this)
		-- If base class handled this work, then we're done
		if(gShellScreen_fnDefaultInputUp(this)) then
			return
		end

		if(this.CurButton == "mousesens" )  then --hack
		--move onto the horizontal boxes
			--SetCurButton("soldier")
			SetCurButtonTable(this.buttons.soldier)
		elseif( gMouseListBox ~= nil) then  
			if( ifs_opt_pckeyboard_listbox_layout.CursorIdx ~= 1 ) then
				ListManager_fnNavUp(this.listbox,ifs_opt_pckeyboard_listbox_contents,ifs_opt_pckeyboard_listbox_layout)
			else
				gMouseListBox = nil
				SetCurButtonTable(this.buttons.invert)
			end
		elseif(this.CurButton == "soldier" or this.CurButton == "vehicle" or this.CurButton == "flyer") then
			SetCurButtonTable(this.buttons.apply)
		elseif(this.CurButton == "apply" or this.CurButton == "cancel" ) then
			--move onto the listbox
			SetCurButton(nil)
			gCurHiliteButton = nil
			ifs_opt_pckeyboard_listbox_layout.CursorIdx = 1
			ListManager_fnFillContents(this.listbox,ifs_opt_pckeyboard_listbox_contents,ifs_opt_pckeyboard_listbox_layout)
			gMouseListBox = this.listbox
		else
			gMouseListBox = nil
			gDefault_Input_GeneralUp(this)
		end
		ifs_opt_pccontrols_fnUpdateStrings(this)
	end,

	Input_GeneralDown = function(this)
		-- If base class handled this work, then we're done
		if(gShellScreen_fnDefaultInputDown(this)) then
			return
		end

		if(this.CurButton == "invert" )  then --hack
		--move onto the listbox
			SetCurButton(nil)
			ifs_opt_pckeyboard_listbox_layout.CursorIdx = 1
			ListManager_fnFillContents(this.listbox,ifs_opt_pckeyboard_listbox_contents,ifs_opt_pckeyboard_listbox_layout)
			gMouseListBox = this.listbox
		elseif(this.CurButton == "soldier" or this.CurButton == "vehicle" or this.CurButton == "flyer") then
			SetCurButtonTable(this.buttons.mousesens)
		elseif(this.CurButton == "apply" or this.CurButton == "cancel" ) then
			gMouseListBox = nil
			SetCurButtonTable(this.buttons.soldier)	
		elseif( gMouseListBox ~= nil ) then  --Slight hack, could be dangerous if you add list boxes
			local Count = getn(ifs_opt_pckeyboard_listbox_contents)
--			print("Count=", Count)
--			print("CursorIdx=",ifs_opt_pckeyboard_listbox_layout.CursorIdx)
			if ( Count == ifs_opt_pckeyboard_listbox_layout.CursorIdx ) then
				--its the last item in the listbox, move down to the accept button
				gMouseListBox = nil
				SetCurButtonTable(this.buttons.apply)
			else
				ListManager_fnNavDown(this.listbox,ifs_opt_pckeyboard_listbox_contents,ifs_opt_pckeyboard_listbox_layout)
			end
		else
			gDefault_Input_GeneralDown(this)
		end
		ifs_opt_pccontrols_fnUpdateStrings(this)
		
		
		
		
	end,
	
	-- Callback (from C++) to repaint the listbox with the current contents
	-- in the global stats_listbox_contents
 	RepaintListbox = function(this)
		ScriptCB_GetKeyBoardCmds()	
 		ListManager_fnFillContents(this.listbox,ifs_opt_pckeyboard_listbox_contents,ifs_opt_pckeyboard_listbox_layout)
	end,

	Update = function(this, fDt)
 		gIFShellScreenTemplate_fnUpdate(this, fDt)  -- always call base class

		HSlider_fnSetAlpha(this.sliders.mousesens,0.5) -- dim unselected one
		HSlider_fnSetAlpha(this.sliders.joysens,0.5) -- dim unselected one	
		if(gMouseOverHorz ) then
			HSlider_fnSetAlpha(gMouseOverHorz,1.0) -- brite selected one
		end
		
		if( (this.CurButton == "joysens") or ( this.CurButton == "mousesens") ) then
			HSlider_fnSetAlpha(this.sliders[this.CurButton],1.0) -- brite selected one
		end
	end,

}
ScriptCB_SetControlMode(0) --default to soldier first


--{ tag = "soldier", string = "ifs.Controls.Soldier.title", },
--		{ tag = "vehicle", string = "ifs.Controls.Vehicle.title", },  
--		{ tag = "flyer", string = "ifs.Controls.Flyer.title", },	
vbutton_layout = {
	yTop = 120,
	yHeight = 20,
	ySpacing  = 5,
	width = 260,
	font = "gamefont_tiny",
	RightJustify = 1,
	flashy = 0,
	buttonlist = {
		-- Title is for the left column, string the option (filled in by code later)
		{ tag = "mousesens", title = "ifs.GameOpt.pc_mousesens", string = "" },
		{ tag = "joysens", title = "ifs.GameOpt.pc_joysens", string = "" },
		{ tag = "invert", title = "ifs.gameopt.pc_invert", string = "common.no" },
	},
}

hbutton_layout = {
	yTop = 60 ,
	xWidth = 200,
	xSpacing  = 0,	
	--font = "gamefont_medium",
	RightJustify = 1,
--	xLeft = 0, -- calculated below
	allTitles = 1,
	buttonlist = 
	{
		{ tag = "soldier", string = "", },
		{ tag = "vehicle", string = "", },  
		{ tag = "flyer",   string = "", },	
	},
}

AcceptCancel_button_layout = {
	yTop = 0 ,
	xWidth = 200,
	xSpacing  = 0,	
	--font = "gamefont_medium",
	RightJustify = 1,
	xLeft = 0,
	buttonlist = 
	{
		{ tag = "cancel", string = "common.cancel", },  
		{ tag = "reset", string = "common.reset", },  
		{ tag = "apply", string = "common.accept", },
		
	},
}

function ifs_opt_pccontrols_fnBuildScreen(this)
	-- Ask game for screen size, used to make sliders
	local w
	local h
	w,h = ScriptCB_GetSafeScreenInfo()
	aw,ah = ScriptCB_GetScreenInfo()
	
 	hbutton_layout.xWidth = w * .25
	hbutton_layout.xSpacing = w * .3 - hbutton_layout.xWidth
	hbutton_layout.xLeft = -w + hbutton_layout.xWidth/2
	
	local workingspace = (h*.95 )- 240 --save the bottom 5 percent for the accept / cancel butttons
	--adjust the working space because lists are always centered, stupid m*#&*#
	workingspace = (workingspace / 2 )
	
	this.listbox = NewButtonWindow
	{ ZPos = 200, x=0, y = 240 + workingspace,
		ScreenRelativeX = 0.5, -- center
		ScreenRelativeY = 0.0, -- Top of screen
		
		width = w,
		height = workingspace * 2 ,  

		--height = h,
	}
	
	--bg layer
	this.Info = NewIFContainer { --container for all the backgrounds
		ScreenRelativeX = 0.0,
		ScreenRelativeY = 0.0,
		inert = 1, -- delete from Lua memory once pushed to C
		ZPos = 255, 
	}
	this.Info.Background = NewButtonWindow 
	{
 			ZPos = 255, 
 			x = w/2,  --centered on the x
 			y = (h*1.1 + 60)/2 , -- inertUVs = 1,
 			alpha = 10,
 			width = w*1.05,
			height = (workingspace * 2)*1.2 +140 ,  
 			--localpos_l = -(w/2)*1.05, localpos_t = 0 ,
 			--localpos_r =  (w/2)*1.05, localpos_b = (workingspace * 2)*1.1 +140,
			--texture = "opaque_black",
			--ColorR = 20, ColorG = 20, ColorB = 150, -- blue
 	}
 	this.RInfo = NewIFContainer { --container for all the backgrounds
		ScreenRelativeX = 1.0,
		ScreenRelativeY = 0.0,
		inert = 1, -- delete from Lua memory once pushed to C
		ZPos = 255, 
	}
	
			
	local tabheight = 	this.Info.Background.y - this.Info.Background.height/2 - 22
 	this.RInfo.InfantryTab = NewIFText
	{
 			ZPos = 255, 
 			x = hbutton_layout.xLeft - hbutton_layout.xWidth/2,  --centered on the x
 			y = tabheight, -- inertUVs = 1,
 			alpha = 10,
			textw = hbutton_layout.xWidth , -- usable area for text
			texth = 40,
			string = "ifs.Controls.SoldierTab",
			bgleft = "headerbuttonleft",
			bgmid = "headerbuttonmid",
			bgright = "headerbuttonright",
			bg_width =  hbutton_layout.xWidth*.9
 	}
 	
 	local nextoffset = hbutton_layout.xSpacing + hbutton_layout.xWidth
 	this.RInfo.VehicleTab = NewIFText 
	{
 			ZPos = 255, 
 			x = hbutton_layout.xLeft - hbutton_layout.xWidth/2 +  nextoffset,  --centered on the x
 			y = tabheight, -- inertUVs = 1,
 			alpha = 10,
			bgleft = "headerbuttonleft",
			bgmid = "headerbuttonmid",
			bgright = "headerbuttonright",
			textw = hbutton_layout.xWidth , -- usable area for text
			texth = 40,
			string = "ifs.Controls.VehicleTab",
			bg_width =  hbutton_layout.xWidth*.9
 	}
 	nextoffset = nextoffset + hbutton_layout.xSpacing*2 + hbutton_layout.xWidth
 	this.RInfo.FlyerTab = NewIFText
	{
 			ZPos = 255, 
 			x = hbutton_layout.xLeft - hbutton_layout.xWidth/2 +  nextoffset,  --centered on the x
 			y = tabheight, -- inertUVs = 1,
 			alpha = 10,
			bgleft = "headerbuttonleft",
			bgmid = "headerbuttonmid",
			bgright = "headerbuttonright",
			textw = hbutton_layout.xWidth , -- usable area for text
			texth = 40  ,
			string = "ifs.Controls.FlyerTab",
			bg_width =  hbutton_layout.xWidth*.9
 	}
 	

	hbutton_layout.yTop = tabheight
	
	-- Made total width much larger for bug 9238 - NM 8/26/04
	AcceptCancel_button_layout.xWidth = w *.45
	AcceptCancel_button_layout.xSpacing = w*.4  - AcceptCancel_button_layout.xWidth
	AcceptCancel_button_layout.xLeft = -w + (AcceptCancel_button_layout.xSpacing + AcceptCancel_button_layout.xSpacing + AcceptCancel_button_layout.xWidth) * 0.5
	AcceptCancel_button_layout.yTop = h  --the default height + a little extra
	-- add buttons
	
	ifs_opt_pccontrols.CurButton = AddHorizontalButtons(this.buttons, hbutton_layout )
	
		
	this.buttons.soldier.label.fHotspotW = hbutton_layout.xWidth*1.5
	this.buttons.vehicle.label.fHotspotW = hbutton_layout.xWidth*1.5
	this.buttons.flyer.label.fHotspotW = hbutton_layout.xWidth*1.5
	
 
 	
	AddVerticalText(this.buttonlabels,vbutton_layout)
	AddVerticalButtons(this.buttons,vbutton_layout)
	AddHorizontalButtons(this.buttons, AcceptCancel_button_layout )
 
 	-- mouse sensativity slider
	this.sliders["mousesens"] = NewHSlider { 
		x = w * 0.4, y = this.buttons.mousesens.y+3, 
		width = w * 0.25, height = 24, thumbwidth = 10, 
	}
	this.sliders.mousesens.tag = "mousesens"
	
	this.sliders["joysens"] = NewHSlider { 
		x = w * 0.4, y = this.buttons.joysens.y+3, 
		width = w * 0.25, height = 24, thumbwidth = 10, 
	}
	this.sliders.joysens.tag = "joysens"
-- 	this.Background = NewIFImage 
--	{
 --			ZPos = 255, 
 --			x = w/2,  --centered on the x
 --			y = h/2, -- inertUVs = 1,
 --			alpha = 10,
 --			localpos_l = -w/1.5, localpos_t = -h/1.5,
 --			localpos_r = w/1.5, localpos_b =  h/1.5,
--			texture = "opaque_black",
--			ColorR = 20, ColorG = 20, ColorB = 150, -- blue
 --	}
	--this.listbox.height = h - this.listbox.y/2 --hack i'm guessing the list box propagates centered, as its should be offscreen right now for a 8x6 but isnt
	ifs_opt_pckeyboard_listbox_layout.width = w - 50
	ifs_opt_pckeyboard_listbox_layout.showcount = floor(this.listbox.height / (ifs_opt_pckeyboard_listbox_layout.yHeight + ifs_opt_pckeyboard_listbox_layout.ySpacing)) - 1
	ListManager_fnInitList(ifs_opt_pccontrols.listbox,ifs_opt_pckeyboard_listbox_layout)
end



ifs_opt_pccontrols_fnBuildScreen(ifs_opt_pccontrols)
-- dump out of memory when done.
ifs_opt_pccontrols_fnBuildScreen = nil
vbutton_layout = nil

AddIFScreen(ifs_opt_pccontrols,"ifs_opt_pccontrols")