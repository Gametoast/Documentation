-- Internal mode definitions for this screen, stored in this.ModeT/.ModeB
-- 
-- -1: "loading profile list" - everything hidden
-- 0: 'Press Start' mode
-- 1: In listbox at left (profile)
-- 2: On team(side) select buttons at right
-- 3: Ready
-- 4: load profiles popup is active, so hide everything

-- Helper function. Given a layout (x,y,width, height), returns a
-- fully-built item.
function ifs_split_profile_listbox_CreateItem(layout)
	-- Make a coordinate system pegged to the top-left of where the cursor would go.
	local Temp = NewIFContainer { x = layout.x - 0.5 * layout.width, y=layout.y - 10}
	Temp.NameStr = NewIFText{ x = 10, y = 0, halign = "left", font = "gamefont_medium", textw = 220, nocreatebackground=1, startdelay=random()*0.5, }
	return Temp
end

-- Helper function. For a destination item (previously created w/
-- CreateItem), fills it in with data, which may be nil (==blank it)
function ifs_split_profile_listbox_PopulateItem(Dest,Data)
	if(Data) then
		-- Blank the data
		IFText_fnSetUString(Dest.NameStr,Data.showstr)
		IFObj_fnSetVis(Dest.NameStr,1)
	else
		-- Blank the data
		IFText_fnSetString(Dest.NameStr,"")
		IFObj_fnSetVis(Dest.NameStr,nil)
	end
end


ifs_split_profile_listbox_contents = {
}

-- Duplicated layout items, as the selected item in each listbox will
-- be placed in it.
ifs_split_profile_listbox_layoutT = {
	showcount = 4,
	yHeight = 26, -- per item
	ySpacing = 0,
	width = ifs_login_listbox_layout.width, -- copy from login screen
	slider = 1,
	CreateFn = ifs_split_profile_listbox_CreateItem,
	PopulateFn = ifs_split_profile_listbox_PopulateItem,
}
ifs_split_profile_listbox_layoutB = {
	showcount = 4,
	yHeight = 26, -- per item
	ySpacing = 0,
	width = ifs_login_listbox_layout.width, -- copy from login screen
	slider = 1,
	bInstance2 = 1, -- Use alternate cursor hilight object
	CreateFn = ifs_split_profile_listbox_CreateItem,
	PopulateFn = ifs_split_profile_listbox_PopulateItem,
}

-- Sets the hilight on the listbox, create button given a hilight
function ifs_split_profile_SetHilight(this,aListIndex)
	if(aListIndex) then
		-- Deactivate 'create' button, if applicable.
		if(gCurHiliteButton) then
			IFButton_fnSelect(gCurHiliteButton,nil) -- Deactivate old button
			gCurHiliteButton = nil
			this.CurButton = nil
		end
	else
		-- Not in listindex. Focus is on the create buttons
		this.CurButton = "new"
		gCurHiliteButton = this.buttons[this.CurButton]
		IFButton_fnSelect(gCurHiliteButton,1) -- Activate button
	end

	-- Top player inherits from login screen
	print("set bottom selectedIdx to nil")
	ifs_split_profile_listbox_layoutB.SelectedIdx = nil
	ifs_split_profile_listbox_layoutB.CursorIdx = nil
	ListManager_fnFillContents(this.ProfileT.listbox,ifs_split_profile_listbox_contents,ifs_split_profile_listbox_layoutT)
	ListManager_fnFillContents(this.ProfileB.listbox,ifs_split_profile_listbox_contents,ifs_split_profile_listbox_layoutB)
end

-- Helper function: turns pieces on/off as requested
function ifs_split_profile_fnSetPieceVis(this)
	-- Back shows for all (but -1 and 4)
	if(this.ModeT == -1 or this.ModeT == 4) then
		IFObj_fnSetVis(this.BackGroupT,nil)
		IFObj_fnSetVis(this.BackGroupB,nil)
	else
		if(this.ModeT == 0) then
			IFObj_fnSetVis(this.BackGroupT,this.ModeB == 0)
		else
			IFObj_fnSetVis(this.BackGroupT,(this.ModeT > 0.5))
		end

		if(this.ModeB > 0.5) then
			IFObj_fnSetVis(this.BackGroupB,1)
		else
			IFObj_fnSetVis(this.BackGroupB,nil)
		end
	end

	IFObj_fnSetVis(this.AcceptGroupT,(this.ModeT == 1) or (this.ModeT == 2))
	IFObj_fnSetVis(this.AcceptGroupB,(this.ModeB == 1) or (this.ModeB == 2))

	-- Mode 0 is the "press start to join" mode
	IFObj_fnSetVis(this.pressstartT,(this.ModeT == 0))
	IFObj_fnSetVis(this.pressstartB,(this.ModeB == 0))

	-- Modes 1/2 are the lisbox/team(side) buttons
	IFObj_fnSetVis(this.ProfileT,(this.ModeT == 1))
	IFObj_fnSetVis(this.ProfileB,(this.ModeB == 1))

	IFObj_fnSetVis(this.SideSelectT,(this.ModeT == 2))
	IFObj_fnSetVis(this.SideSelectB,(this.ModeB == 2))

	-- Set up listboxes.
	if(this.ModeT == 1) then
		ListManager_fnFillContents(this.ProfileT.listbox,ifs_split_profile_listbox_contents,ifs_split_profile_listbox_layoutT) -- sets selected listbox item
	else
		gCurHiliteListbox = nil
	end

	if(this.ModeB == 1) then
		ListManager_fnFillContents(this.ProfileB.listbox,ifs_split_profile_listbox_contents,ifs_split_profile_listbox_layoutB) -- sets selected listbox item
	else
		gCurHiliteListbox2 = nil
	end

	-- Set up team(side) buttons
	if(this.ModeT == 2) then
		if(this.SideT == "a") then
			IFButton_fnSelect(this.SideSelectT.buttons["b"],nil)
		else
			IFButton_fnSelect(this.SideSelectT.buttons["a"],nil)
		end
		gCurHiliteButton = this.SideSelectT.buttons[this.SideT]
		IFButton_fnSelect(gCurHiliteButton,1)
	else
		gCurHiliteButton = nil
	end

	if(this.ModeB == 2) then
		if(this.SideB == "a") then
			IFButton_fnSelect(this.SideSelectB.buttons["b"],nil)
		else
			IFButton_fnSelect(this.SideSelectB.buttons["a"],nil)
		end
		gCurHiliteButton2 = this.SideSelectB.buttons[this.SideB]
		IFButton_fnSelect(gCurHiliteButton2,1)
	else
		gCurHiliteButton2 = nil
	end

	-- Mode 3 is the "ready" stage
	IFObj_fnSetVis(this.ReadyT,(this.ModeT == 3))
	IFObj_fnSetVis(this.ReadyB,(this.ModeB == 3))
	

	-- if we're in mode 3, gray out our selected profile in the other guy's listbox
	local cnt
	local lstart = ifs_split_profile_listbox_layoutB.FirstShownIdx
	local lend = min(getn(ifs_split_profile_listbox_contents), lstart - 1 + ifs_split_profile_listbox_layoutB.showcount)
	for cnt = lstart,lend do
		-- top player, color bottom listbox
		local selIdx = ifs_split_profile_listbox_layoutT.SelectedIdx
		if(selIdx and selIdx==cnt and this.ModeT >= 3) then
			IFObj_fnSetColor(this.ProfileB.listbox[cnt-lstart+1],128,128,128)
		else
			IFObj_fnSetColor(this.ProfileB.listbox[cnt-lstart+1],255,255,255)
		end
	end

	lstart = ifs_split_profile_listbox_layoutT.FirstShownIdx
	lend = min(getn(ifs_split_profile_listbox_contents), lstart - 1 + ifs_split_profile_listbox_layoutT.showcount)
	for cnt = lstart,lend do
		-- bottom player, color top listbox
		local selIdx = ifs_split_profile_listbox_layoutB.SelectedIdx
		if(selIdx and selIdx==cnt and this.ModeB >= 3) then
			IFObj_fnSetColor(this.ProfileT.listbox[cnt-lstart+1],128,128,128)
		else
			IFObj_fnSetColor(this.ProfileT.listbox[cnt-lstart+1],255,255,255)
		end
	end


	IFObj_fnSetVis(this.pressstart,(this.ModeT == 3) and (this.ModeB == 3))
	
	
	-- Mode 4 has nothing visible	
	--
	
	
    --ifelm_shellscreen_fnPlaySound("shell_select_change")
end

-- called when we're done loading the file list form the SaveDevice
function ifs_split_profile_fnLoadFileListDone(this)
	this.EverLoaded = 1
	--Popup_LoadSave:fnActivate(nil)
	ifs_split_profile_fnSetPieceVis(this, 1)
	-- reenter this screen
	this.Enter(this,1)
end

function ifs_split_profile_fnRegetListbox(this)
	-- Reset listbox, show it. [Remember, Lua starts at 1!]
	local MaxCount = ScriptCB_GetLoginList("ifs_split_profile_listbox_contents", 1)
	local ListCount = getn(ifs_split_profile_listbox_contents)
	
	if(not ListCount) then
		print("ERROR: not ListCount")
		assert(false)
	end
	
	if(ListCount < 2) then
		print("ERROR: ScriptCB_GetLoginList returned <2 profiles in splitscreen")
		assert(false)
	end

	ifs_split_profile_listbox_layoutT.FirstShownIdx = 1 -- top
	ifs_split_profile_listbox_layoutB.FirstShownIdx = 1 -- top
	
	if(not ifs_split_profile_listbox_layoutT.SelectedIdx) then
		ifs_split_profile_listbox_layoutT.SelectedIdx = 1
	end
	if(not ifs_split_profile_listbox_layoutB.SelectedIdx) then
		ifs_split_profile_listbox_layoutB.SelectedIdx = 2
	end

	if(ifs_split_profile_listbox_layoutT.SelectedIdx > ifs_split_profile_listbox_layoutT.showcount) then
		ifs_split_profile_listbox_layoutT.FirstShownIdx = 
			max(1, 
					ifs_split_profile_listbox_layoutT.SelectedIdx - ifs_split_profile_listbox_layoutT.showcount + 1)
	end

	if(ifs_split_profile_listbox_layoutB.SelectedIdx > ifs_split_profile_listbox_layoutB.showcount) then
		ifs_split_profile_listbox_layoutB.FirstShownIdx = 
			max(1, 
					ifs_split_profile_listbox_layoutB.SelectedIdx - ifs_split_profile_listbox_layoutB.showcount + 1)
	end

	ifs_split_profile_SetHilight(this,1)
	ListManager_fnFillContents(this.ProfileT.listbox,ifs_split_profile_listbox_contents,ifs_split_profile_listbox_layoutT)
	ListManager_fnFillContents(this.ProfileB.listbox,ifs_split_profile_listbox_contents,ifs_split_profile_listbox_layoutB)
end

-- Helper function, flips the side of the specified team, etc. Returns the new
-- side.
function ifs_split_profile_fnChangeSide(OldSelect,Buttons)
	local NewSelect
	if(OldSelect == "a") then
		NewSelect = "b"
	else
		NewSelect = "a"
	end

	IFButton_fnSelect(Buttons[OldSelect],nil)
	IFButton_fnSelect(Buttons[NewSelect],1)

	return NewSelect
end

ifssplit_profile_vbutton_layout = {
	yTop = 0,
	yHeight = 50,
	ySpacing  = 5,
	width = 160,
	font = "gamefont_medium",
	buttonlist = { 
		{ tag = "a", string = "", }, -- text filled in on screen entry
		{ tag = "b", string = "", },
	},
}



----------------------------------------------------------------------------------------
-- load the profile list.  this is just the preop, since that refreshes the file list.
----------------------------------------------------------------------------------------

function ifs_split_profile_StartLoadFileList()
	ifs_saveop.doOp = "LoadFileList"
	ifs_saveop.OnSuccess = ifs_split_profile_LoadFileListSuccess
	ifs_saveop.OnCancel = ifs_split_profile_LoadFileListCancel
	ifs_movietrans_PushScreen(ifs_saveop);
end

function ifs_split_profile_LoadFileListSuccess()
	-- good, continue
	print("ifs_split_profile_LoadFileListSuccess")
	
	-- don't reload when we get back to ifs_meta_load.Enter	
	ifs_split_profile.bFromLoadFileList = 1
	-- pop ifs_saveop, reenter ifs_split_profile	
	ScriptCB_PopScreen()	
end

function ifs_split_profile_LoadFileListCancel()
	-- ok, continue
	print("ifs_meta_load_LoadFileListCancel")
	
	-- skip forward to the file list screen anyway	
	-- don't reload when we get back to ifs_meta_load.Enter	
	ifs_split_profile.bFromLoadFileList = 1
	-- pop ifs_saveop, reenter ifs_split_profile	
	ScriptCB_PopScreen()	
	
end

----------------------------------------------------------------------------------------
-- load two profiles
----------------------------------------------------------------------------------------

function ifs_split_profile_StartLoadProfile(profile1,profile2)
	print("ifs_split_profile_StartLoadProfile")
	
	-- if both profiles are nil, skip it
	if((not profile1) and (not profile2)) then
		ifs_split_profile_LoadProfileSuccess()
		return
	end
	
	print("ifs_split_profile_StartLoadProfile SaveDevice")
	ifs_saveop.doOp = "LoadProfile"
	ifs_saveop.OnSuccess = ifs_split_profile_LoadProfileSuccess
	ifs_saveop.OnCancel = ifs_split_profile_LoadProfileCancel
	ifs_saveop.profile1 = profile1
	ifs_saveop.profile2 = profile2
	ifs_movietrans_PushScreen(ifs_saveop)
	
end

function ifs_split_profile_LoadProfileSuccess()
	print("ifs_split_profile_LoadProfileSuccess")
	local this = ifs_split_profile
	-- ok
	
	if(gDemoBuild) then
		local defaultLevel = "end1a"
		ScriptCB_SetMissionNames(defaultLevel,false)
		ScriptCB_EnterMission()
	else
		ifs_missionselect.bForMP = nil
        -- don't want movie transitions to the single player screen
        -- keep the splitscreen background active
        gMovieDisabled = 1
        ScriptCB_PushScreen("ifs_sp")
	end
end

function ifs_split_profile_LoadProfileCancel()
	print("ifs_split_profile_LoadProfileCancel")
	local this = ifs_split_profile
	-- error, should go back to the LoadFileList state	
	
	-- bail from ifs_saveop
	ScriptCB_PopScreen()
	
	ifs_split_profile_fnSetPieceVis(this, 1)
	--ifs_split_profile_fnRegetListbox(this)
	
end

----------------------------------------------------------------------------------------
-- the ok from when you enter without enough profiles.
----------------------------------------------------------------------------------------
--function ifs_split_profile_NotEnoughProfilesOk()
--	-- pop it
--	ScriptCB_PopScreen()
--end


----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------

ifs_split_profile = NewIFShellScreen {
	nologo = 1,
	bNohelptext = 1, -- We do our own on this screen.
	movieIntro      = "ifs_split_profile_intro",
	movieBackground = "ifs_split_profile",

	bg_texture = HackBGTextureOnPCOnly("hoth_screen"),

	fnLoadFileListDone = ifs_split_profile_fnLoadFileListDone,

	title = NewIFText {
		string = "", --ifs.profile.title",
		font = "gamefont_large",
		textw = 460,
		y = -5,
		ScreenRelativeX = 0.5, -- center
		ScreenRelativeY = 0, -- top
		inert = 1,
		nocreatebackground=1,		
	},

	pressstart = NewIFText {
		string = "ifs.split.starttolaunch",
		font = "gamefont_medium",
		textw = 460,
		y = -8,
		ScreenRelativeX = 0.5, -- center
		ScreenRelativeY = 0.35, -- top half of screen
		nocreatebackground=1,
	},

	pressstartT = NewIFText {
		string = "ifs.split.starttojoin",
		font = "gamefont_medium",
		valign = "vcenter",
		textw = 460,
		texth = 120,
--		y = -8,
		ScreenRelativeX = 0.5, -- center
		ScreenRelativeY = 0.25, -- top
		nocreatebackground=1,
	},

	pressstartB = NewIFText {
		string = "ifs.split.starttojoin",
		font = "gamefont_medium",
		textw = 460,
		texth = 120,
		valign = "vcenter",
--		y = -8,
		ScreenRelativeX = 0.5, -- center
		ScreenRelativeY = 0.75, -- top
		nocreatebackground=1,
	},

	ReadyT = NewIFText {
		string = "ifs.split.ready",
		font = "gamefont_large",
		textw = 460,
		y = -8,
		ScreenRelativeX = 0.5, -- center
		ScreenRelativeY = 0.25, -- top
		nocreatebackground=1,
	},

	ReadyB = NewIFText {
		string = "ifs.split.ready",
		font = "gamefont_large",
		textw = 460,
		y = -8,
		ScreenRelativeX = 0.5, -- center
		ScreenRelativeY = 0.75, -- top
		nocreatebackground=1,
	},

	ProfileT = NewIFContainer {
		ScreenRelativeX = 0.5, -- left
		ScreenRelativeY = 0.0, -- top

		listbox = NewButtonWindow { ZPos = 200, x=0, y = 60,

			width = ifs_split_profile_listbox_layoutT.width + 35,
			height = ifs_split_profile_listbox_layoutT.showcount * (ifs_split_profile_listbox_layoutT.yHeight + ifs_split_profile_listbox_layoutT.ySpacing) + 30,
		},
	},

	ProfileB = NewIFContainer {
		ScreenRelativeX = 0.5, -- left
		ScreenRelativeY = 0.0, -- top

		listbox = NewButtonWindow { ZPos = 200, x=0, y = 60,
			width = ifs_split_profile_listbox_layoutB.width + 35, 
			height = ifs_split_profile_listbox_layoutB.showcount * (ifs_split_profile_listbox_layoutB.yHeight + ifs_split_profile_listbox_layoutB.ySpacing) + 30,
		},
	},

	SideSelectT = NewIFContainer {
		ScreenRelativeX = 0.5, -- left
		ScreenRelativeY = 0.0, -- top

		buttons = NewIFContainer {
		},
	},

	SideSelectB = NewIFContainer {
		ScreenRelativeX = 0.5, -- left
		ScreenRelativeY = 0.0, -- top

		buttons = NewIFContainer {
		},
	},

	BackGroupT = NewIFContainer {
		ScreenRelativeX = 0.0, -- left
		ScreenRelativeY = 0.5, -- mid
		y = -20, -- just above middle

		icon = NewIFImage { 
			ZPos = 200, -- behind most.

			texture = "btnb", 
			localpos_l = 0,
			localpos_t = -11,
			localpos_r = 20,
			localpos_b = 11,
			inert = 1, -- Delete this out of lua once created (we'll never touch it again)
		},

		helpstr = NewIFText {
			string = "common.back",
			font = "gamefont_medium",
			textw = 460,
			x = 25,
			y = -15,
			halign = "left",
			inert = 1, -- Delete this out of lua once created (we'll never touch it again)
			nocreatebackground=1,
		},
	},

	AcceptGroupT = NewIFContainer {
		ScreenRelativeX = 1.0, -- right
		ScreenRelativeY = 0.5, -- mid
		y = -20, -- just above middle

		icon = NewIFImage { 
			ZPos = 200, -- behind most.

			texture = "btna", 
			localpos_l = -10,
			localpos_t = -11,
			localpos_r =  10,
			localpos_b =  11,
		},

		helpstr = NewIFText {
			string = "common.accept",
			font = "gamefont_medium",
			textw = 460,
			x = -460,
			y = -15,
			halign = "right",
			nocreatebackground=1,
		},
	},

	BackGroupB = NewIFContainer {
		ScreenRelativeX = 0.0, -- left
		ScreenRelativeY = 1.0, -- bottom
		y = -20, -- just above bottom

		icon = NewIFImage { 
			ZPos = 200, -- behind most.

			texture = "btnb", 
			localpos_l = 0,
			localpos_t = -11,
			localpos_r = 20,
			localpos_b =  11,
			inert = 1, -- Delete this out of lua once created (we'll never touch it again)
		},

		helpstr = NewIFText {
			string = "common.back",
			font = "gamefont_medium",
			textw = 460,
			x = 25,
			y = -15,
			halign = "left",
			inert = 1, -- Delete this out of lua once created (we'll never touch it again)
			nocreatebackground=1,
		},
	},

	AcceptGroupB = NewIFContainer {
		ScreenRelativeX = 1.0, -- left
		ScreenRelativeY = 1.0, -- mid
		y = -20, -- just above middle

		icon = NewIFImage { 
			ZPos = 200, -- behind most.

			texture = "btna", 
			localpos_l = -10,
			localpos_t = -11,
			localpos_r =  10,
			localpos_b =  11,
		},

		helpstr = NewIFText {
			string = "common.accept",
			font = "gamefont_medium",
			textw = 460,
			x = -460,
			y = -15,
			halign = "right",
			nocreatebackground=1,
		},
	},

	Enter = function(this, bFwd)
		print("ifs_split_profile.Enter(",bFwd,")")		
		
		gIFShellScreenTemplate_fnEnter(this, bFwd)

		gIFShellScreenTemplate_fnMoveIcon(this.AcceptGroupB)
		gIFShellScreenTemplate_fnMoveIcon(this.AcceptGroupT)
		
		-- Added chunk for error handling...
		if(not bFwd) then
			local ErrorLevel,ErrorMessage = ScriptCB_GetError()
			if(ErrorLevel >= 6) then -- session or login error, must keep going further
				ScriptCB_PopScreen()
			end
		end

		-- Read out team names set by missionselect screen.
--		RoundIFButtonLabel_fnSetString(this.SideSelectT.buttons["a"],ifs_missionselect.Team1Name)
--		RoundIFButtonLabel_fnSetString(this.SideSelectB.buttons["a"],ifs_missionselect.Team1Name)
--		RoundIFButtonLabel_fnSetString(this.SideSelectT.buttons["b"],ifs_missionselect.Team2Name)
--		RoundIFButtonLabel_fnSetString(this.SideSelectB.buttons["b"],ifs_missionselect.Team2Name)

		-- if we've just loaded the file list, finish the enter
		if(this.bFromLoadFileList) then
			print("ifs_split_profile.bFromLoadFileList")
			this.bFromLoadFileList = nil			
			
			this.ModeT = 1
			this.ModeB = 0
			-- Top player inherits off login listbox
			local LoginIdx = ifs_login_listbox_layout.SelectedIdx
			if((not LoginIdx) or (LoginIdx < 1)) then
				LoginIdx = 1
			end

			ifs_split_profile_listbox_layoutT.SelectedIdx = LoginIdx
			ifs_split_profile_listbox_layoutT.CursorIdx = LoginIdx

			this.SideT = "a"
			this.SideB = "a"

			-- fill in the listbox
			ifs_split_profile_fnRegetListbox(this)
		
		-- otherwise start it
		elseif(bFwd) then
			print("bFwd")
			ifs_split_profile_StartLoadFileList()
			return			
		else
			-- if we're coming backwards, we should have left in state 4
			-- so go back to 3
			this.ModeT = 3
			this.ModeB = 3
		end

		ifs_split_profile_fnSetPieceVis(this,1)
		ScriptCB_ReadAllControllers(1) -- note we need this mode on this screen
	end,

	Exit = function(this, bFwd)
		ScriptCB_ReadAllControllers(nil) -- turn off once we're done with this screen
        gMovieDisabled = nil
	end,

	fControllerCheckTimer = 0,
	Update = function(this, fDt)
		-- Call base class functionality
		gIFShellScreenTemplate_fnUpdate(this, fDt)

		this.fControllerCheckTimer = this.fControllerCheckTimer - fDt
		if(this.fControllerCheckTimer < 0) then
			this.fControllerCheckTimer = 0.3 -- reset timer
			this.fNumControllers = ScriptCB_GetNumControllers()
			
			if(this.fNumControllers < 2) then
				if(gPlatformStr == "PS2") then
					local PortUStr = ScriptCB_tounicode(format("%d",ScriptCB_GetUnusedControllerPort()))
					local ShowUStr = ScriptCB_usprintf("ifs.split.insertcontrollerport", PortUStr)
					IFText_fnSetUString(this.pressstartB,ShowUStr)
				else
					IFText_fnSetString(this.pressstartB,"ifs.split.needs2controllers")
				end
			else
				IFText_fnSetString(this.pressstartB,"ifs.split.starttojoin")
			end
		end
	end,

	Input_GeneralUp = function(this, Joystick)
		if(Joystick < 0.5) then
			if(this.ModeT == 1) then

				-- Hack -- gotta try this twice, in case we stray onto the other's
				-- entry
				local EntryIdxT = ifs_split_profile_listbox_layoutT.SelectedIdx
				local EntryIdxB = ifs_split_profile_listbox_layoutB.SelectedIdx
				ListManager_fnNavUp(this.ProfileT.listbox,ifs_split_profile_listbox_contents,ifs_split_profile_listbox_layoutT)

--				if(ifs_split_profile_listbox_layoutT.SelectedIdx == EntryIdxB) then
--					ListManager_fnNavUp(this.ProfileT.listbox,ifs_split_profile_listbox_contents,ifs_split_profile_listbox_layoutT)
--				end
--				if(ifs_split_profile_listbox_layoutT.SelectedIdx == EntryIdxB) then
--					ifs_split_profile_listbox_layoutT.SelectedIdx = EntryIdxT
--					ifs_split_profile_listbox_layoutT.CursorIdx = EntryIdxT
--					ListManager_fnMoveCursor(this.ProfileT.listbox,ifs_split_profile_listbox_layoutT)
--				end


			elseif (this.ModeT == 2) then
				this.SideT = ifs_split_profile_fnChangeSide(this.SideT,this.SideSelectT.buttons)
			end
		elseif (Joystick < 1.5) then
			if(this.ModeB == 1) then

				-- Hack -- gotta try this twice, in case we stray onto the other's
				-- entry
				local EntryIdxT = ifs_split_profile_listbox_layoutT.SelectedIdx
				local EntryIdxB = ifs_split_profile_listbox_layoutB.SelectedIdx
				ListManager_fnNavUp(this.ProfileB.listbox,ifs_split_profile_listbox_contents,ifs_split_profile_listbox_layoutB)

--				if(ifs_split_profile_listbox_layoutB.SelectedIdx == EntryIdxT) then
--					ListManager_fnNavUp(this.ProfileB.listbox,ifs_split_profile_listbox_contents,ifs_split_profile_listbox_layoutB)
--				end
--				if(ifs_split_profile_listbox_layoutB.SelectedIdx == EntryIdxT) then
--					ifs_split_profile_listbox_layoutB.SelectedIdx = EntryIdxB
--					ifs_split_profile_listbox_layoutB.CursorIdx = EntryIdxB
--					ListManager_fnMoveCursor(this.ProfileB.listbox,ifs_split_profile_listbox_layoutB)
--				end

			elseif (this.ModeB == 2) then
				this.SideB = ifs_split_profile_fnChangeSide(this.SideB,this.SideSelectB.buttons)
			end
		end -- joystick 1

		-- Redo screen stuff as needed
		ifs_split_profile_fnSetPieceVis(this)
  end,

	Input_GeneralDown = function(this, Joystick)
		if(Joystick < 0.5) then
			if(this.ModeT == 1) then

				-- Hack -- gotta try this twice, in case we stray onto the other's
				-- entry
				local EntryIdxT = ifs_split_profile_listbox_layoutT.SelectedIdx
				local EntryIdxB = ifs_split_profile_listbox_layoutB.SelectedIdx
				ListManager_fnNavDown(this.ProfileT.listbox,ifs_split_profile_listbox_contents,ifs_split_profile_listbox_layoutT)

--				if(ifs_split_profile_listbox_layoutT.SelectedIdx == EntryIdxB) then
--					ListManager_fnNavDown(this.ProfileT.listbox,ifs_split_profile_listbox_contents,ifs_split_profile_listbox_layoutT)
--				end
--				if(ifs_split_profile_listbox_layoutT.SelectedIdx == EntryIdxB) then
--					ifs_split_profile_listbox_layoutT.SelectedIdx = EntryIdxT
--					ifs_split_profile_listbox_layoutT.CursorIdx = EntryIdxT
--					ListManager_fnMoveCursor(this.ProfileT.listbox,ifs_split_profile_listbox_layoutT)
--				end

			elseif (this.ModeT == 2) then
				this.SideT = ifs_split_profile_fnChangeSide(this.SideT,this.SideSelectT.buttons)
			end
		elseif (Joystick < 1.5) then
			if(this.ModeB == 1) then

				-- Hack -- gotta try this twice, in case we stray onto the other's
				-- entry
				local EntryIdxT = ifs_split_profile_listbox_layoutT.SelectedIdx
				local EntryIdxB = ifs_split_profile_listbox_layoutB.SelectedIdx
				ListManager_fnNavDown(this.ProfileB.listbox,ifs_split_profile_listbox_contents,ifs_split_profile_listbox_layoutB)

--				if(ifs_split_profile_listbox_layoutB.SelectedIdx == EntryIdxT) then
--					ListManager_fnNavDown(this.ProfileB.listbox,ifs_split_profile_listbox_contents,ifs_split_profile_listbox_layoutB)
--				end
--				if(ifs_split_profile_listbox_layoutB.SelectedIdx == EntryIdxT) then
--					ifs_split_profile_listbox_layoutB.SelectedIdx = EntryIdxB
--					ifs_split_profile_listbox_layoutB.CursorIdx = EntryIdxB
--					ListManager_fnMoveCursor(this.ProfileB.listbox,ifs_split_profile_listbox_layoutB)
--				end

			elseif (this.ModeB == 2) then
				this.SideB = ifs_split_profile_fnChangeSide(this.SideB,this.SideSelectB.buttons)
			end
		end -- joystick 1

		-- Redo screen stuff as needed
		ifs_split_profile_fnSetPieceVis(this)
  end,

	-- Left/Right useless on this screen
	Input_GeneralLeft = function(this, Joystick)
  end,

	Input_GeneralRight = function(this, Joystick)
  end,

	Input_Accept = function(this,Joystick)
		if(Joystick < 0.5) then
			if((this.ModeT == 1) or (this.ModeT == 2)) then
                ifelm_shellscreen_fnPlaySound(this.acceptSound)
				-- make sure we can select something
				local Selection = ifs_split_profile_listbox_contents[ifs_split_profile_listbox_layoutT.SelectedIdx]
				
				--make sure bottom hasn't already selected this one
				local EntryIdxT = ifs_split_profile_listbox_layoutT.SelectedIdx
				local EntryIdxB = ifs_split_profile_listbox_layoutB.SelectedIdx
				if(EntryIdxT == EntryIdxB and this.ModeB>=3) then
                    ifelm_shellscreen_fnPlaySound(this.errorSound)
				else
					if(Selection and Selection.showstr) then				
						this.ModeT = 3
					end
				end
			end
		elseif (Joystick < 1.5) then
			if((this.ModeB == 1) or (this.ModeB == 2)) then
                ifelm_shellscreen_fnPlaySound(this.acceptSound)
				-- make sure we can select something
				local Selection = ifs_split_profile_listbox_contents[ifs_split_profile_listbox_layoutB.SelectedIdx]
				--make sure bottom hasn't already selected this one
				local EntryIdxT = ifs_split_profile_listbox_layoutT.SelectedIdx
				local EntryIdxB = ifs_split_profile_listbox_layoutB.SelectedIdx
				if(EntryIdxT == EntryIdxB and this.ModeT>=3) then
                    ifelm_shellscreen_fnPlaySound(this.errorSound)
				else
					if(Selection and Selection.showstr) then				
						this.ModeB = 3
					end
				end
			end
		end -- joystick switching
		ifs_split_profile_fnSetPieceVis(this)
	end,

	Input_Back = function(this, Joystick)
		if(Joystick < 0.5) then
			if(this.ModeT == 1) then
				ScriptCB_UnbindController(2) -- don't care about the second controller anymore
				ScriptCB_ReadAllControllers(nil) -- turn off once we're done with this screen
				ScriptCB_PopScreen()
			elseif (this.ModeT > 0)  then
				this.ModeT = min(this.ModeT - 1,1)
                ifelm_shellscreen_fnPlaySound(this.exitSound)
			end
		elseif (Joystick < 1.5) then
			if (this.ModeB > 0) then
				this.ModeB = min(this.ModeB - 1,1)
                ifelm_shellscreen_fnPlaySound(this.exitSound)
				if(this.ModeB == 0) then
					ifs_split_profile_listbox_layoutB.SelectedIdx = nil
					ifs_split_profile_listbox_layoutB.CursorIdx = nil
					ScriptCB_UnbindController(2) -- don't care about the second controller anymore
				end
			end
		end

		-- Refresh screen
		ifs_split_profile_fnSetPieceVis(this)
	end,

	Input_Start = function(this, Joystick)
		print("ifs_split_profile.Input_Start(",Joystick,")")
        
		if(Joystick < 0.5) then
			print("this.ModeT = ",this.ModeT)
			if(this.ModeT == 0) then
                --ifelm_shellscreen_fnPlaySound(this.acceptSound)
				this.ModeT = 1
				local NewIdx = 1
				if(ifs_split_profile_listbox_layoutB.SelectedIdx) then
					if(ifs_split_profile_listbox_layoutB.SelectedIdx == 1) then
						NewIdx = 2
					end
				end
				ifs_split_profile_listbox_layoutT.SelectedIdx = NewIdx
				ifs_split_profile_listbox_layoutT.CursorIdx = NewIdx
				ListManager_fnMoveCursor(this.ProfileT.listbox,ifs_split_profile_listbox_layoutT)
			elseif (this.ModeT < 3) then
                --ifelm_shellscreen_fnPlaySound(this.acceptSound)
				this:Input_Accept(Joystick)
			elseif ((this.ModeT == 3) and (this.ModeB == 3)) then
                ifelm_shellscreen_fnPlaySound(this.acceptSound)
				print("this.ModeT==3 and this.ModeB==3, launching...")
				-- Launch time!

				ScriptCB_SetSplitscreen(1)
				
				print("set player sides 1")
				-- Push prefs on side also.
				if(this.SideT == "a") then
					ScriptCB_SetPlayerSide(1,0)
				else
					ScriptCB_SetPlayerSide(2,0)
				end
				print("set player side 2")
				if(this.SideB == "a") then
					ScriptCB_SetPlayerSide(1,1)
				else
					ScriptCB_SetPlayerSide(2,1)
				end
				
				print("load the two profiles")
				local Selection1 = ifs_split_profile_listbox_contents[ifs_split_profile_listbox_layoutT.SelectedIdx]				
				if(Selection1.memslot) then
					print("Player 1 wants the profile in Active ",Selection1.memslot,": ",ScriptCB_ununicode(Selection1.showstr))
				else
					print("Player 1 wants the profile on Memcard: ",ScriptCB_ununicode(Selection1.showstr))
				end
				
				local Selection2 = ifs_split_profile_listbox_contents[ifs_split_profile_listbox_layoutB.SelectedIdx]
				if(Selection2.memslot) then
					print("Player 2 wants the profile in Active ",Selection2.memslot,": ",ScriptCB_ununicode(Selection2.showstr))
				else
					print("Player 2 wants the profile on Memcard: ",ScriptCB_ununicode(Selection2.showstr))
				end
				
				-- if player1 wants active2, swap the active slots
				if(Selection1.memslot == 2 or Selection2.memslot == 1) then
					print("Swapping active profile slots")
					-- swap them in the game
					ScriptCB_SwapActiveProfileSlots()
					
					-- swap their indices in the list
					local p1 = ifs_split_profile_listbox_contents[1]
					if(p1.memslot) then
						p1.memslot = 3 - p1.memslot
					end
					local p2 = ifs_split_profile_listbox_contents[2]
					if(p2.memslot) then
						p2.memslot = 3 - p2.memslot
					end
				end
				
				
				-- get the names of the profiles to load off the (if its memcard, else nil)
				local load1 = nil
				local load2 = nil
				if(not Selection1.memslot) then
					load1 = Selection1.showstr
				end
				if(not Selection2.memslot) then
					load2 = Selection2.showstr
				end
				ifs_split_profile_StartLoadProfile(load1,load2)
				
				
				-- hide everything on this screen
				this.ModeT = 4
				this.ModeB = 4
			end -- top mode not 0
		elseif (Joystick < 1.5) then
			print("this.ModeB = ",this.ModeB)
			if(this.ModeB == 0) then
				ifelm_shellscreen_fnPlaySound(this.acceptSound)
				this.ModeB = 1
				local NewIdx = 1
				if(ifs_split_profile_listbox_layoutT.SelectedIdx) then
					if(ifs_split_profile_listbox_layoutT.SelectedIdx == 1) then
						NewIdx = 2
					end
				end
				ifs_split_profile_listbox_layoutB.SelectedIdx = NewIdx
				ifs_split_profile_listbox_layoutB.CursorIdx = NewIdx
				ifs_split_profile_listbox_layoutB.FirstShownIdx = 1 -- top
				if(ifs_split_profile_listbox_layoutB.SelectedIdx > ifs_split_profile_listbox_layoutB.showcount) then
					ifs_split_profile_listbox_layoutB.FirstShownIdx = 
						max(1, 
								ifs_split_profile_listbox_layoutB.SelectedIdx - ifs_split_profile_listbox_layoutB.showcount + 1)
				end
				ListManager_fnMoveCursor(this.ProfileB.listbox,ifs_split_profile_listbox_layoutB)
			else
                --ifelm_shellscreen_fnPlaySound(this.acceptSound)
				this:Input_Accept(Joystick)
			end
		end

		ifs_split_profile_fnSetPieceVis(this)			
	end,


	fnLoadProfilesDone = ifs_split_profile_fnLoadProfilesDone,
}



-- Helper function, adds in items, repositions them ons tartup
function ifssplit_profile_reposition_items(this)
	ListManager_fnInitList(this.ProfileT.listbox,ifs_split_profile_listbox_layoutT)
	ListManager_fnInitList(this.ProfileB.listbox,ifs_split_profile_listbox_layoutB)

	-- Ask game for screen size, use for values
	local r
	local b
	local v
	r,b,v=ScriptCB_GetSafeScreenInfo()

	this.midline = NewIFImage {
		texture = "gray_rect", 
		alpha = 0.8,
		localpos_l = -100,  localpos_t = b*0.5-2, 
		localpos_r = r+100, localpos_b = b*0.5+2,
		inertUVs = 1,
		ScreenRelativeX = 0,
		ScreenRelativeY = 0,
		ColorR = 192, ColorG = 192, ColorB = 255,		
	}


	-- Reposition boxes to be TL justified within the halves of the screen
--	this.ProfileT.listbox.x = (this.ProfileT.listbox.width) * 0.5
--	this.ProfileB.listbox.x = (this.ProfileB.listbox.width) * 0.5
	this.ProfileT.listbox.y = (this.ProfileT.listbox.height) * 0.5 + 10 + 20
	this.ProfileB.listbox.y = (b * 0.5) + ((this.ProfileB.listbox.height) * 0.5) + 20

	this.SideSelectT.CurButton = AddVerticalButtons(this.SideSelectT.buttons,ifssplit_profile_vbutton_layout)
	this.SideSelectB.CurButton = AddVerticalButtons(this.SideSelectB.buttons,ifssplit_profile_vbutton_layout)

	local BtnHeight = getn(ifssplit_profile_vbutton_layout.buttonlist) * 
		(ifssplit_profile_vbutton_layout.yHeight + ifssplit_profile_vbutton_layout.ySpacing)

	this.SideSelectT.buttons.y = (b * 0.25) - (BtnHeight * 0.5)
	this.SideSelectB.buttons.y = (b * 0.75) - (BtnHeight * 0.5)

	-- Set position on ready string
-- 	RightX = r - ifssplit_profile_vbutton_layout.width
-- 	this.ProfileT.acceptstr.x = RightX
-- 	this.ProfileB.acceptstr.x = RightX
-- 	this.ProfileT.acceptstr.y = (b * 0.25) + (BtnHeight * 0.5) - 20
-- 	this.ProfileB.acceptstr.y = (b * 0.75) + (BtnHeight * 0.5) - 20

end

-- Call function to create/resize/reposition items
ifssplit_profile_reposition_items(ifs_split_profile)
ifssplit_profile_reposition_items = nil -- clear that out of memory

AddIFScreen(ifs_split_profile,"ifs_split_profile")