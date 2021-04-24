-- Generalized mission select screen. Done to unify the varions
-- screens 






-- Callback function when the virtual keyboard is done
function ifs_pc_mp_fnKeyboardDone()
	if(strlen(ifs_vkeyboard.CurString) > 1) then

		-- Hack! Netcode should be unicoded
		ScriptCB_SetGameName(ScriptCB_ununicode(ifs_vkeyboard.CurString))
		ifs_vkeyboard.CurString = "" -- clear
		--ifs_missionselect.bForMP = 1
		--ScriptCB_SetMetagameRulesOn(nil) -- for ingame
		ScriptCB_PopScreen()
		vkeyboard_specs.fnDone = nil -- clear our registration there
	else
	end
end

-- Helper function. Given a layout (x,y,width, height), returns a
-- fully-built item.
function pcMissionSelectListboxL_CreateItem(layout)
	-- Make a coordinate system pegged to the top-left of where the cursor would go.
	local Temp = NewIFContainer { 
		x = layout.x - 0.5 * layout.width, 
		y = layout.y,
	}

	local HAlign = "left"
	local XPos = 5
	local WidthAdj = -5
--	if(ScriptCB_GetLanguage() ~= "english") then
--		HAlign = "hcenter"
--		XPos = 8
--		WidthAdj = -20
--	end

	Temp.map = NewIFText { 
		x = XPos,
		y = layout.height * -0.5 + 2,
		halign = HAlign, valign = "vcenter",
		font = "gamefont_tiny", 
		textw = layout.width + WidthAdj, texth = layout.height,
		startdelay=random()*0.5, nocreatebackground=1, 
	}

	return Temp
end

-- Helper function. Given a layout (x,y,width, height), returns a
-- fully-built item.
function pcMissionSelectListboxR_CreateItem(layout)
	-- Make a coordinate system pegged to the top-left of where the cursor would go.
	local Temp = NewIFContainer { 
		x = layout.x - 0.5 * layout.width, 
		y = layout.y,
	}

	local HAlign = "left"
	local XPos = 5
	local WidthAdj = -5
--	if(ScriptCB_GetLanguage() ~= "english") then
--		HAlign = "hcenter"
--		XPos = 8
--		WidthAdj = -20
--	end

	Temp.map = NewIFText { 
		x = XPos,
		y = layout.height * -0.5 + 2,
		halign = HAlign, valign = "vcenter",
		font = "gamefont_tiny", 
		textw = layout.width + WidthAdj, texth = layout.height,
		startdelay=random()*0.5, 
		nocreatebackground=1, 
	}
	
	-- the icon
	local iconSize = layout.height * 0.65
	Temp.icon1 = NewIFImage {
 		ZPos = 0, 
 		x = layout.width - iconSize * 1.3, 
 		y = -4,
 		localpos_l = 0, localpos_t = 0,
 		localpos_r = iconSize, localpos_b = iconSize,
		texture = "imp_icon",
	}
	Temp.icon2 = NewIFImage {
 		ZPos = 0, 
 		x = layout.width - iconSize * 2.5,
 		y = -4,
 		localpos_l = 0, localpos_t = 0,
 		localpos_r = iconSize, localpos_b = iconSize,
		texture = "imp_icon",
	}	

	return Temp
end

-- Helper function. For a destination item (previously created w/
-- CreateItem), fills it in with data, which may be nil (==blank it)
function pcMissionSelectListboxL_PopulateItem(Dest,Data)
	if(Data) then
		-- Show the data
		local DisplayUStr,iSource = missionlist_GetLocalizedMapName(Data.mapluafile)
		IFText_fnSetUString(Dest.map,DisplayUStr)
	end

	IFObj_fnSetVis(Dest.map,Data)

end

-- Helper function. For a destination item (previously created w/
-- CreateItem), fills it in with data, which may be nil (==blank it)
function pcMissionSelectListboxR_PopulateItem(Dest,Data)
	if(Data) then
		-- Update contents
		local DisplayUStr,iSource = missionlist_GetLocalizedMapName(Data.Map)
		IFText_fnSetUString(Dest.map,DisplayUStr)

		-- set the icon texture
		if (Data.SideChar == "a" or Data.SideChar == "i") then
			IFImage_fnSetTexture(Dest.icon1,"imp_icon")
			IFImage_fnSetTexture(Dest.icon2,"all_icon")
			IFObj_fnSetVis(Dest.icon1,1)
			IFObj_fnSetVis(Dest.icon2,1)
		elseif (Data.SideChar == "c" or Data.SideChar == "r") then
			IFImage_fnSetTexture(Dest.icon1,"rep_icon")
			IFImage_fnSetTexture(Dest.icon2,"cis_icon")
			IFObj_fnSetVis(Dest.icon1,1)
			IFObj_fnSetVis(Dest.icon2,1)
		else
			IFObj_fnSetVis(Dest.icon1,nil)
			IFObj_fnSetVis(Dest.icon2,nil)
		end
	end

	-- Turn on/off depending on whether data's there or not
	IFObj_fnSetVis(Dest,Data)
end

pc_missionselect_name_listboxL_layout = {
	showcount = 10,
--	yTop = -130 + 13, -- auto-calc'd now
	yHeight = 26,
	ySpacing  = 0,
--	width = 260,
	x = 0,
	slider = 1,
	CreateFn = pcMissionSelectListboxL_CreateItem,
	PopulateFn = pcMissionSelectListboxL_PopulateItem,
}

pc_missionselect_name_listboxR_layout = {
	showcount = 7,
--	yTop = -130 + 13, -- auto-calc'd now
	yHeight = 26,
	ySpacing  = 0,
--	width = 260,
	x = 0,
	slider = 1,
	CreateFn = pcMissionSelectListboxR_CreateItem,
	PopulateFn = pcMissionSelectListboxR_PopulateItem,
}

function ifs_missionselect_pcMulti_fnShowHideListboxes(this,bShowThem)
	local A1,A2
	local fAnimTime = 0.3

	if(bShowThem) then
		A1 = 0
		A2 = 1
		if(gPlatformStr == "PC") then
			this.AddDelContainer.add.bHidden = 1
			this.AddDelContainer.del.bHidden = 1
		end
	else
		A1 = 1
		A2 = 0
		if(gPlatformStr == "PC") then
			this.AddDelContainer.add.bHidden = nil
			this.AddDelContainer.del.bHidden = nil
		end
	end

	if(gPlatformStr == "PC") then
		AnimationMgr_AddAnimation(this.AddDelContainer, { fStartAlpha = A1, fEndAlpha = A2,})
	end

	AnimationMgr_AddAnimation(this.listboxL, { fStartAlpha = A1, fEndAlpha = A2,})
	AnimationMgr_AddAnimation(this.listboxR, { fStartAlpha = A1, fEndAlpha = A2,})
end

function ifs_missionselect_pcMulti_fnFullPopupDone()
	local this = ifs_missionselect_pcMulti
	ifs_missionselect_pcMulti_fnShowHideListboxes(this,1)
end


-- Flips map order
function ifs_missionselect_pcMulti_fnToggleOrder(this)
	this.bRandomOrder = not this.bRandomOrder
	if(this.bRandomOrder) then
		RoundIFButtonLabel_fnSetString(this.OrderButton,"ifs.missionselect.random")
	else
		RoundIFButtonLabel_fnSetString(this.OrderButton,"ifs.missionselect.inorder")
	end
end

-- Sets up the map preview based on the current selection
function ifs_missionselect_pcMulti_fnSetMapPreview(this)
	print("ifs_missionselect_pcMulti_fnSetMapPreview")
	local movieName = nil
	local movieFile = nil

	local num = pc_missionselect_name_listboxL_layout.SelectedIdx or 1
	local Selection = missionselect_listbox_contents[num]
	movieName = Selection.mapluafile
	if(Selection.dnldable) then
		movieFile = movieName
	end
	
	if (movieName and movieName ~= "TEST") then
		--ifelem_shellscreen_fnStartMovie(movieName.."fly", nil, this.movieX,this.movieY,this.movieW,this.movieH)
		this.movieName = movieName
		this.movieTime = 0.5
		this.movieFile = movieFile
	else
		ifelem_shellscreen_fnStopMovie()		
	end
	IFObj_fnSetVis(this.Map,nil)
end

-- Helper function, manages the state of the 'Delete' button
function ifs_missionselect_pcMulti_fnUpdateDelButton(this)
	local bShouldBeOn = (this.iPage == 0) and (not this.bOnLeft) and (not this.bOnButtons) and (getn(gPickedMapList) > 0)
	
	if(ScriptCB_GetPlatform() == "PC") then
		bShouldBeOn = nil
	end

end

-- Sets the current button to the specified table (which can be nil)
function ifs_missionselect_pcMulti_fnSetCurButton(this,tNewButton,ButtonStr)

	-- Always deselect old button if set
	if(gCurHiliteButton) then
		IFButton_fnSelect(gCurHiliteButton,nil)
	end

	if(tNewButton) then
		this.CurButton = ButtonStr
		this.bOnButtons = 1
		gCurHiliteButton = tNewButton
		IFButton_fnSelect(gCurHiliteButton,1)
		pc_missionselect_name_listboxR_layout.CursorIdx = nil
		pc_missionselect_name_listboxL_layout.CursorIdx = nil
		ListManager_fnFillContents(this.listboxR,gPickedMapList,pc_missionselect_name_listboxR_layout)
		ListManager_fnFillContents(this.listboxL,missionselect_listbox_contents,pc_missionselect_name_listboxL_layout)
	else
		this.bOnButtons = nil
		gCurHiliteButton = nil
		if(ScriptCB_GetPlatform() ~= "PC") then
			this.CurButton = "a"
		end
	end
end

-- Sets up the screen for the specified page
function ifs_missionselect_pcMulti_fnSetPage(this,iNewPage)
	-- Early exit if changing to same page
	if(this.iPage == iNewPage) then
		return
	end
	local iLastPage = this.iPage

	-- Page 2 isn't allowed anymore - NM 4/5/04
	assert(iNewPage ~= 2)

	-- Turn off items as appropriate when leaving a page
	if(iLastPage == 0) then
		-- Listboxes will always be off on the other pages
		AnimationMgr_AddAnimation(this.listboxL, { fStartAlpha = 1, fEndAlpha = 0.0,})
		AnimationMgr_AddAnimation(this.listboxR, { fStartAlpha = 1, fEndAlpha = 0.5,})
		this.listboxL.bHidden = 1
		this.listboxR.bHidden = 1
		this.OrderButton.bHidden = 1
		this.LaunchButton.bHidden = 1
--		this.LanButton.bHidden = 1
--		this.EditGameName.bHidden = 1
--		this.EditPass.bHidden = 1
		this.EditContainer.bHidden = 1
		this.OptionButton.bHidden = 1
		AnimationMgr_AddAnimation(this.Map, { fStartAlpha = 1, fEndAlpha = 0.5,})
		AnimationMgr_AddAnimation(this.OrderButton, { fStartAlpha = 1, fEndAlpha = 0,})
		AnimationMgr_AddAnimation(this.LaunchButton, { fStartAlpha = 1, fEndAlpha = 0,})
--		AnimationMgr_AddAnimation(this.LanButton, { fStartAlpha = 1, fEndAlpha = 0,})
--		AnimationMgr_AddAnimation(this.EditGameName, { fStartAlpha = 1, fEndAlpha = 0,})
--		AnimationMgr_AddAnimation(this.EditPass, { fStartAlpha = 1, fEndAlpha = 0,})
		AnimationMgr_AddAnimation(this.EditContainer, { fStartAlpha = 1, fEndAlpha = 0,})
		AnimationMgr_AddAnimation(this.OptionButton, { fStartAlpha = 1, fEndAlpha = 0,})

		if(gPlatformStr == "PC") then
			this.AddDelContainer.add.bHidden = 1
			this.AddDelContainer.del.bHidden = 1
			AnimationMgr_AddAnimation(this.AddDelContainer, { fStartAlpha = 1, fEndAlpha = 0,})
		end

		-- Also, update title
--		AnimationMgr_AddAnimation(this.titleL, { fStartAlpha = 1, fEndAlpha = 0,})
--		AnimationMgr_AddAnimation(this.titleR, { fStartAlpha = 1, fEndAlpha = 0,})
	elseif (iLastPage == 1) then
		-- Fade off buttons if they won't be on anymore
		if(iNewPage == 0) then
			AnimationMgr_AddAnimation(this.buttons, { fStartAlpha = 1, fEndAlpha = 0,})
			this.buttons.bHidden = 1
		end
	elseif (iLastPage == 2) then
		-- Fade off buttons if they won't be on anymore
		if(iNewPage == 0) then
			AnimationMgr_AddAnimation(this.buttons, { fStartAlpha = 1, fEndAlpha = 0,})
			this.buttons.bHidden = 1
		end
	end

	-- Set the new page
	this.iPage = iNewPage

	-- Turn off items as appropriate when leaving a page
	if(iNewPage == 0) then
		-- Listboxes will always be on for this page
		AnimationMgr_AddAnimation(this.listboxL, { fStartAlpha = 0, fEndAlpha = 1,})
		AnimationMgr_AddAnimation(this.listboxR, { fStartAlpha = 0.5, fEndAlpha = 1,})
		this.listboxL.bHidden = nil
		this.listboxR.bHidden = nil
		AnimationMgr_AddAnimation(this.Map, { fStartAlpha = 0, fEndAlpha = 1,})
		AnimationMgr_AddAnimation(this.OrderButton, { fStartAlpha = 0, fEndAlpha = 1,})
		AnimationMgr_AddAnimation(this.LaunchButton, { fStartAlpha = 0, fEndAlpha = 1,})
--		AnimationMgr_AddAnimation(this.LanButton, { fStartAlpha = 0, fEndAlpha = 1,})
--		AnimationMgr_AddAnimation(this.EditGameName, { fStartAlpha = 0, fEndAlpha = 1,})
--		AnimationMgr_AddAnimation(this.EditPass, { fStartAlpha = 0, fEndAlpha = 1,})
		AnimationMgr_AddAnimation(this.EditContainer, { fStartAlpha = 0, fEndAlpha = 1,})
		AnimationMgr_AddAnimation(this.OptionButton, { fStartAlpha = 0, fEndAlpha = 1,})
		-- Also, update title
--		AnimationMgr_AddAnimation(this.titleL, { fStartAlpha = 0, fEndAlpha = 1,})
--		AnimationMgr_AddAnimation(this.titleR, { fStartAlpha = 0, fEndAlpha = 1,})
		this.OrderButton.bHidden = nil
		this.LaunchButton.bHidden = nil
--		this.LanButton.bHidden = 1
--		this.EditGameName.bHidden = nil
--		this.EditPass.bHidden = nil
		this.EditContainer.bHidden = nil
		this.OptionButton.bHidden = nil

		if(gPlatformStr == "PC") then
			this.AddDelContainer.add.bHidden = nil
			this.AddDelContainer.del.bHidden = nil
			AnimationMgr_AddAnimation(this.AddDelContainer, { fStartAlpha = 0, fEndAlpha = 1,})
		else
			this.bOnLeft = 1 -- default
		end

		this.bOnButtons = nil
		this.AttackerChar = nil
	elseif (iNewPage == 1) then
		-- Turn on buttons if they weren't on before
		if(iLastPage == 0) then
			AnimationMgr_AddAnimation(this.buttons, { fStartAlpha = 0, fEndAlpha = 1,})
			this.buttons.bHidden = nil
			-- also set the title bar of the era buttons to the mission name
			-- it probably ain't gonna fit for other languages
			if(ScriptCB_GetLanguage() == "english") then
				local Selection = missionselect_listbox_contents[pc_missionselect_name_listboxL_layout.SelectedIdx]
				IFText_fnSetString(this.buttons._titlebar_,Selection.showstr)
			end
		end
		this.listboxL.bHidden = 1
		this.listboxR.bHidden = 1
		this.OrderButton.bHidden = 1
		this.LaunchButton.bHidden = 1
--		this.LanButton.bHidden = 1
--		this.EditGameName.bHidden = 1
--		this.EditPass.bHidden = 1
		this.EditContainer.bHidden = 1
		this.OptionButton.bHidden = 1

		SetCurButton("new")

	elseif (iNewPage == 2) then
		-- Turn on buttons if they weren't on before
		if(iLastPage == 0) then
			AnimationMgr_AddAnimation(this.buttons, { fStartAlpha = 0, fEndAlpha = 1,})
			this.buttons.bHidden = nil
		end
		this.listboxL.bHidden = 1
		this.listboxR.bHidden = 1
		this.OrderButton.bHidden = 1
		this.LaunchButton.bHidden = 1
--		this.LanButton.bHidden = 1
--		this.EditGameName.bHidden = 1
--		this.EditPass.bHidden = 1
		this.EditContainer.bHidden = 1
		this.OptionButton.bHidden = 1
	end

	ifs_missionselect_pcMulti_fnUpdateDelButton(this)
end

-- Adds the currently selected map to the maplist.
function ifs_missionselect_pcMulti_fnAddMap(this)
	local Selection = missionselect_listbox_contents[pc_missionselect_name_listboxL_layout.SelectedIdx]

	-- Turn era into map for 2-way maps
	if((this.CurButton == "new") or (this.CurButton == "classic")) then
		-- Turn era into side character
		if(this.CurButton == "new") then
			if(Selection.side_c) then
				this.CurButton = "c"
			else
				this.CurButton = "r"
			end
		else
			if(Selection.side_a) then
				this.CurButton = "a"
			else
				this.CurButton = "i"
			end
		end
		this.AttackerChar = this.CurButton
	end

	local Key1 = "side_" .. this.CurButton .. "_team1"
	local Key2 = "side_" .. this.CurButton .. "_team2"

	local Team1Name = Selection[Key1] or gMissionSelectAttackerTeams[this.CurButton]
	local Team2Name = Selection[Key2] or gMissionSelectDefenderTeams[this.CurButton]

	ifs_missionselect_pcMulti_fnSetMapAndTeam(this,Selection,Team1Name,Team2Name)
	this.Team1Name = ScriptCB_getlocalizestr(Team1Name)
	this.Team2Name = ScriptCB_getlocalizestr(Team2Name)

	ifs_missionselect_pcMulti_fnSetPage(this,0)

	-- And, quick-move to launch button
	if(gPlatformStr ~= "PC") then
		this.bOnLeft = nil -- default
		this.bOnButtons = 1
		pc_missionselect_name_listboxR_layout.CursorIdx = nil
		ListManager_fnFillContents(this.listboxR,gPickedMapList,pc_missionselect_name_listboxR_layout)
		ifs_missionselect_pcMulti_fnSetCurButton(this,this.LaunchButton,"Launch")
	end
end

-- Utility function - based on the .hidden flag in buttons (already
-- created), shows/hides buttons. Adjusts spacing too. Returns tag of
-- first selectable button.
function ifs_missionselect_pcMulti_fnShowHideItems(dest,layout)
	local xWidth = layout.xWidth or 40
	local xSpacing = layout.xSpacing or 10
	local height = layout.height or 40
	local Font = layout.font or "gamefont_small"
	local yTop = layout.yTop or 0

	local i
	local Count = getn(layout.buttonlist)
	local TagOfFirst = nil

	-- Figure out how many are actually visible
	local ShowCount = 0
	for i = 1,Count do
		local label = layout.buttonlist[i].tag
		if(not dest[label].hidden) then
			ShowCount = ShowCount + 1
		end
	end

	local xLeft = ((ShowCount - 1) * (xWidth + xSpacing)) * -0.5

	for i = 1,Count do
		local label = layout.buttonlist[i].tag
		local label2 = layout.buttonlist[i].tag .. "_image"
		IFObj_fnSetVis(dest[label], not dest[label].hidden)
		IFObj_fnSetVis(dest[label2], not dest[label].hidden)

		dest[label].bHidden = dest[label].hidden
		dest[label2].bHidden = dest[label].hidden

		if(not dest[label].hidden) then
			-- not hidden. Show it
			TagOfFirst = TagOfFirst or label -- note which was the first

			IFObj_fnSetVis(dest[label], 1)
			IFObj_fnSetPos(dest[label], xLeft, yTop + 20)
			IFObj_fnSetVis(dest[label2], 1)
			IFObj_fnSetPos(dest[label2], xLeft, 0)

		 xLeft = xLeft + xWidth + xSpacing
		end -- showing this one
	end

	return ShowCount,TagOfFirst
end

-- Tthe side selection is implicit in the selection here, except for
-- the maps that only have one side, and you have to go back around
-- and handle them as special cases. 
function ifs_missionselect_pcMulti_fnSetMapAndTeam(this,Selection,Team1Str,Team2Str)
	local SelectedMap = Selection.mapluafile .. this.AttackerChar
	local Side = 1 -- 1 or 2
	local SideChar = this.CurButton -- 'a' 'c' 'i' or 'r'

	local Idx = getn(gPickedMapList) + 1
	gPickedMapList[Idx] = {
		Map = SelectedMap,
		dnldable = Selection.dnldable,
		Side = Side,
		SideChar = SideChar,
		Team1 = Team1Str,
		Team2 = Team2Str,
	}

	pc_missionselect_name_listboxR_layout.FirstShownIdx = pc_missionselect_name_listboxR_layout.FirstShownIdx or 1
	pc_missionselect_name_listboxR_layout.SelectedIdx = pc_missionselect_name_listboxR_layout.SelectedIdx or 1
	pc_missionselect_name_listboxR_layout.CursorIdx = nil

	ListManager_fnFillContents(this.listboxR,gPickedMapList,pc_missionselect_name_listboxR_layout)
	-- Hack - refresh the left column next to get the cursor back.
	ListManager_fnFillContents(this.listboxL,missionselect_listbox_contents,pc_missionselect_name_listboxL_layout)
end

function ifs_missionselect_pcMulti_fnFlipLeftRight(this)
	ifelm_shellscreen_fnPlaySound(this.selectSound)
	this.bOnLeft = not this.bOnLeft

	-- Move off buttons if on them
	if((this.bOnButtons) and (gPlatformStr ~= "PC")) then
		ifs_missionselect_fnSetCurButton(this,nil)
	end
--	assert(not this.bOnButtons)

	if(this.bOnLeft) then
		pc_missionselect_name_listboxR_layout.CursorIdx = nil
		ListManager_fnFillContents(this.listboxR,gPickedMapList,pc_missionselect_name_listboxR_layout)
		pc_missionselect_name_listboxL_layout.CursorIdx = pc_missionselect_name_listboxL_layout.SelectedIdx
		ListManager_fnFillContents(this.listboxL,missionselect_listbox_contents,pc_missionselect_name_listboxL_layout)
	else
		-- On the right side
		pc_missionselect_name_listboxL_layout.CursorIdx = nil
		ListManager_fnFillContents(this.listboxL,missionselect_listbox_contents,pc_missionselect_name_listboxL_layout)
		pc_missionselect_name_listboxR_layout.CursorIdx = pc_missionselect_name_listboxR_layout.SelectedIdx
		ListManager_fnFillContents(this.listboxR,gPickedMapList,pc_missionselect_name_listboxR_layout)
	end
--	ifs_missionselect_pcMulti_fnSetMapPreview(this)
	ifs_missionselect_pcMulti_fnUpdateDelButton(this)
end

-- Helper function - returns a bool as to whether the selection has
-- multiple sides, and also the char of the last (only?) side noticed.
function ifs_missionselect_pcMulti_fnGetSides(Selection)
	local bMultipleSides
	local LastSideChar = nil
	
	if(Selection.side_a) then
		bMultipleSides = (LastSideChar ~= nil)
		LastSideChar = "a"
	end
	if(Selection.side_c) then
		bMultipleSides = (LastSideChar ~= nil)
		LastSideChar = "c"
	end
	if(Selection.side_i) then
		bMultipleSides = (LastSideChar ~= nil)
		LastSideChar = "i"
	end
	if(Selection.side_r) then
		bMultipleSides = (LastSideChar ~= nil)
		LastSideChar = "r"
	end

	return bMultipleSides,LastSideChar
end

function ifs_missionselect_pcMulti_fnLaunch(this)
	if(getn(gPickedMapList) > 0) then
	
		
		this.SelectedMap = 1
		ScriptCB_SetMissionNames(gPickedMapList,this.bRandomOrder)
		local password = IFEditbox_fnGetString(this.EditContainer.EditPass)
		ScriptCB_SetNetGameDefaults(ifs_mp_gameopts.iNumPlayers,ifs_mp_gameopts.iNumBots,ifs_mp_gameopts.iTeamDmg,ifs_mp_gameopts.iAutoAim,ifs_mp_gameopts.bIsPrivate,ifs_mp_gameopts.bShowNames,ifs_mp_gameopts.bAutoAssignTeams,ifs_mp_gameopts.iStartCnt,ifs_mp_gameopts.bHeroesEnabled,ifs_mp_gameopts.iDifficulty,password)
		ScriptCB_SetDedicated(ifs_mp_gameopts.bDedicated)
		
		ScriptCB_SetGameName(IFEditbox_fnGetString(this.EditContainer.EditGameName))
		
--		if(this.bLan) then
--			gOnlineServiceStr = "LAN"
--			ScriptCB_SetConnectType("lan")
--		else
--			gOnlineServiceStr = "GameSpy"
--		end
		
		if(this.bDedicated) then
			ifs_movietrans_PushScreen(ifs_mp_lobbyds)
		else
			ifs_mp_gameopts.bAutoLaunch = 1
			print("Calling BeginLobby" )
			ScriptCB_BeginLobby()
		end
	else
		ifelm_shellscreen_fnPlaySound(this.errorSound)
	end
end

-- pass the name of the downloadable content movie file to open it, or nil to open
-- the normal DVD flythrough movie file.
function ifs_missionselect_pcMulti_ChangeMovieFile(movieFile)
	print("ifs_missionselect_pcMulti_ChangeMovieFile(",movieFile,")")
	local this = ifs_missionselect_pcMulti
	
	-- don't change anything if its the same file
	if(movieFile == this.lastMovieFile) then
		return
	end
	-- remember this for next time
	this.lastMovieFile = movieFile
	
	-- close the last one
	ScriptCB_CloseMovie()
	
	-- set the DC directory, so we can find the correct movie file
	ScriptCB_SetDCMap(movieFile)
	
	-- open the new one
	local dcPrefix = "dc:"
	local pal = ""
	if(not movieFile) then
		dcPrefix = ""
		movieFile = "fly"
	end
	if (ScriptCB_IsPAL() == 1) then
		pal = "pal"
	end	
	-- downloadable pal looks like:     "dc:movies\\RHN3pal.mvs"
	-- downloadable content looks like: "dc:movies\\RHN3.mvs"
	-- normal pal looks like this:      "movies\\flypal.mvs"
	-- normal looks like this:          "movies\\fly.mvs"	
	ScriptCB_OpenMovie(dcPrefix .. "movies\\" .. movieFile .. pal .. ".mvs", "")
	
end

ifs_missionselect_pcMulti = NewIFShellScreen {
	nologo = 1,
	bg_texture = nil,
	movieBackground = nil,
	
	-- background image.  we need to make our own since we want to hide it when the movie is visible
	backImg = NewIFImage { 
		ScreenRelativeX = 0,
		ScreenRelativeY = 0,
		UseSafezone = 0,
		ZPos = 254, -- behind all. except the movie.
		texture = "his_brief_BG", 
		localpos_l = 0,
		localpos_t = 0,
		inert = 1, -- Delete this out of lua once created (we'll never touch it again)
	},

	buttons = NewIFContainer {
		ScreenRelativeX = 0.5, -- center
		ScreenRelativeY = 0.6, -- top
--		y = 20, -- go slightly down from center
	},

	fnDone = nil, -- Callback function to do something when the user is done
	-- Sub-mode for full/era switch is on.
	EraMode = nil,
	
	Enter = function(this, bFwd)
		gIFShellScreenTemplate_fnEnter(this, bFwd) -- call base class

		-- right align the launch button	
		gIFShellScreenTemplate_fnMoveClickableButton(this.LaunchButton,this.LaunchButton.label,0)
	
		
		-- stop the current movie
		ifelem_shellscreen_fnStopMovie()

		-- Determine how many missions can be queued.
		if(ScriptCB_GetMaxMissionQueue) then
			this.iMaxMissions = ScriptCB_GetMaxMissionQueue()
		else
			this.iMaxMissions = 32
		end

		-- Added chunk for error handling...
		if(not bFwd) then
			local ErrorLevel,ErrorMessage = ScriptCB_GetError()
			if(ErrorLevel >= 6) then -- session or login error, must keep going further
				ScriptCB_PopScreen()
			end
		end

		if(bFwd) then
			gPickedMapList = {}
			this.movieTime = 0.5

			-- set the default game name to player profile name
			local game_name = ScriptCB_GetCurrentProfileNetName()			
			ScriptCB_SetGameName(ScriptCB_ununicode(game_name))
			IFEditbox_fnSetUString(this.EditContainer.EditGameName, game_name)
			print( "++++set default game_name:", game_name, ScriptCB_ununicode(game_name) )

			--print("In the forward enter function of multimission select")
			ifs_mp_gameopts_fnSetupDefaults(ifs_mp_gameopts)
			
			if(this.bForMP) then
				missionselect_listbox_contents = mp_missionselect_listbox_contents
			else
				missionselect_listbox_contents = sp_missionselect_listbox_contents
			end

			this.iPage = 2
			ifs_missionselect_pcMulti_fnSetPage(this,0) -- default internal mode.
			this.buttons.fStartAlpha = 0
			this.buttons.fEndAlpha = 0
			IFObj_fnSetAlpha(this.buttons,0)
			ifs_missionselect_pcMulti_fnToggleOrder(this)
			ifs_missionselect_pcMulti_fnToggleOrder(this)

			--IFObj_fnSetAlpha(this.Helptext_Delete,0.25)
			IFButton_fnSelect(this.OrderButton,nil)
			IFButton_fnSelect(this.LaunchButton,nil)
--			IFButton_fnSelect(this.LanButton,nil)
--			IFButton_fnSelect(this.EditGameName,nil)
--			IFButton_fnSelect(this.EditPass,nil)
			IFButton_fnSelect(this.OptionButton,nil)
			

			this.SelectedMap = nil -- clear this
			gPickedMapList = {} -- clear this also.
			pc_missionselect_name_listboxR_layout.FirstShownIdx = 1
			pc_missionselect_name_listboxR_layout.SelectedIdx = 1
			pc_missionselect_name_listboxR_layout.CursorIdx = nil
			ListManager_fnFillContents(this.listboxR,gPickedMapList,pc_missionselect_name_listboxR_layout)

			-- Reset listboxL, show it. [Remember, Lua starts at 1!]
			pc_missionselect_name_listboxL_layout.FirstShownIdx = 1
			pc_missionselect_name_listboxL_layout.SelectedIdx = 1
			pc_missionselect_name_listboxL_layout.CursorIdx = 1
			ListManager_fnFillContents(this.listboxL,missionselect_listbox_contents,pc_missionselect_name_listboxL_layout)

			ifs_missionselect_pcMulti_fnSetMapPreview(this)

			ifs_missionselect_pcMulti_fnSetCurButton(this,nil)

			-- Hack - if just 1 map, fake a button press thru to second part
			if(getn(missionselect_listbox_contents) == 1) then
				this:Input_Accept()
			end
		else
			this.EraMode = nil
			ifs_missionselect_pcMulti_fnSetPage(this,0) -- default internal mode.
			AnimationMgr_AddAnimation(this.buttons, { fStartAlpha = 0, fEndAlpha = 0,})
			this.buttons.bHidden = 1
		end
	end,

	Exit = function(this, bFwd)
		if(not bFwd) then
			ifs_missionselect_pcMulti_fnSetPage(this,0) -- default internal mode.
			this.SelectedMap = nil -- clear this
		end
		if(gCurHiliteButton) then
			IFButton_fnSelect(gCurHiliteButton,nil)
		end
		-- stop the current movie
		ifelem_shellscreen_fnStopMovie()
		
		if(gPlatformStr == "XBox") then
			ScriptCB_CloseMovie();
			ScriptCB_OpenMovie(gMovieStream, "");
		end		
	end,
	
	Update = function(this, fDt)
		-- Call base class functionality
		gIFShellScreenTemplate_fnUpdate(this, fDt)
		
		--time to change movies?
		this.movieTime = this.movieTime - fDt
		if( this.movieName and this.movieTime<=0 ) then
			ifs_missionselect_pcMulti_ChangeMovieFile(this.movieFile)
    		ifelem_shellscreen_fnStartMovie(this.movieName.."fly", 1, nil, nil, this.movieX,this.movieY,this.movieW,this.movieH)
		    this.movieName = nil;
		end
		
		if( ifs_mp_gameopts.bAutoLaunch ) then
			ScriptCB_UpdateLobby(nil)
	
--			print("Autolaunching...")
			ScriptCB_LaunchLobby()
		end

		-- animate the left/right arrows?
		if(gPlatformStr == "PC") then
			IFObj_UpdateBlinkyAnim(this.AddDelContainer.add,ScriptCB_IFObj_TestHotSpot(this.AddDelContainer.add.cpointer),0.4,1,0.4,0.2)
			IFObj_UpdateBlinkyAnim(this.AddDelContainer.del,ScriptCB_IFObj_TestHotSpot(this.AddDelContainer.del.cpointer),0.4,1,0.4,0.2)
		end		
	end,
	
	Input_KeyDown = function(this, iKey)
		if(gCurEditbox) then
			if((iKey == 10) or (iKey == 13)) then -- handle Enter different
				-- by doing nothing
			elseif (iKey == 9) then
				-- Handle tab key
				if(gCurEditbox) then
					IFEditbox_fnHilight(gCurEditbox, nil)
				end
				if(gCurEditbox == this.EditContainer.EditGameName) then
					gCurEditbox = this.EditContainer.EditPass
				elseif (gCurEditbox == this.EditContainer.EditPass) then
					gCurEditbox = this.EditContainer.EditGameName
				end
				if(gCurEditbox) then
					IFEditbox_fnHilight(gCurEditbox, 1)
				end
			else
				IFEditbox_fnAddChar(gCurEditbox, iKey)
			end
		end
	end,

	Input_Accept = function(this)
		-- If base class handled this work, then we're done
		if(gShellScreen_fnDefaultInputAccept(this,1)) then
			return
		end

		if(gMouseListBox) then
			
			--ScriptCB_SndPlaySound("shell_select_change")
--			if( gMouseListBox.Layout.SelectedIdx == gMouseListBox.Layout.CursorIdx )then
			if( gMouseListBox.Layout.SelectedIdx == gMouseListBox.Layout.CursorIdx and this.lastDoubleClickTime and ScriptCB_GetMissionTime()<this.lastDoubleClickTime+0.4) then
				print("gMouseListbox = ",gMouseListBox)
				print("this.listboxL = ",this.listboxL)
				this.lastDoubleClickTime = nil
				if(gMouseListBox == this.listboxL) then
			
					this.CurButton = "_add"
				else
					this.CurButton = "_del"
				end
			else
				this.lastDoubleClickTime = ScriptCB_GetMissionTime()
				gMouseListBox.Layout.SelectedIdx = gMouseListBox.Layout.CursorIdx
				ListManager_fnFillContents(gMouseListBox,gMouseListBox.Contents,gMouseListBox.Layout)
				
				--start to play the movie
				ifs_missionselect_pcMulti_fnSetMapPreview(this)
				
				return 1 -- note we did all the work
			end
		end

		if(this.CurButton == "_del") then
			local Count = getn(gPickedMapList)
			if(Count > 0) then
				local i
				local j = 1
				local NewList = {}
				for i=1,Count do
					if(i ~= pc_missionselect_name_listboxR_layout.SelectedIdx) then
						NewList[j] = gPickedMapList[i]
						j = j + 1
					end
				end

				gPickedMapList = NewList
				ListManager_fnAutoscroll(this.listboxR,gPickedMapList,pc_missionselect_name_listboxR_layout)
				ListManager_fnFillContents(this.listboxR,gPickedMapList,pc_missionselect_name_listboxR_layout)
			end
			return
		end -- "_del" special processing
		
	

		local Selection = missionselect_listbox_contents[pc_missionselect_name_listboxL_layout.SelectedIdx]
		local bPC = (gPlatformStr == "PC")

		if(this.iPage == 0) then -- first sub-part

			if(this.CurButton == "cancel" ) then
				this:Input_Back()
				return
			end
			
			print("this.CurButton=",this.CurButton)
			if(this.CurButton == "Option") then
				ifs_movietrans_PushScreen(ifs_mp_gameopts)	
			elseif (this.CurButton == "" ) then
				--do nothing, say nothing, get Kryten!
			elseif(this.CurButton == "Order") then
				ifs_missionselect_pcMulti_fnToggleOrder(this)
				ifelm_shellscreen_fnPlaySound(this.acceptSound)
			elseif (this.CurButton == "Launch") then
				ifelm_shellscreen_fnPlaySound(this.acceptSound)
				ifs_missionselect_pcMulti_fnLaunch(this)
				this.bLan = nil
--			elseif (this.CurButton == "LaunchLan") then
--				ifelm_shellscreen_fnPlaySound(this.acceptSound)
--				this.bLan = 1
--				ifs_missionselect_pcMulti_fnLaunch(this)
--			elseif (this.CurButton == "EditGameName") then
----------------------Hack
--				ifs_vkeyboard.CurString = ScriptCB_GetCurrentProfileNetName()
--				ifs_vkeyboard.bCursorOnAccept = 1 -- start cursor on Accept
--				IFText_fnSetString(ifs_vkeyboard.title,"ifs.vkeyboard.title_gamename")
--				vkeyboard_specs.fnDone = ifs_pc_mp_fnKeyboardDone
--				vkeyboard_specs.fnIsOk = ifs_login_fnIsAcceptable -- reuse this
--				local w,h = ScriptCB_GetSafeScreenInfo() -- of the usable screen
--				ifs_movietrans_PushScreen(ifs_vkeyboard)
-----------------------			
			elseif (((not bPC) and (this.bOnLeft)) or (bPC and (this.CurButton == "_add"))) then
			
				print("@@@@@@@@@@@@@   @@@@  I think your on the left and adding a map")
				ifelm_shellscreen_fnPlaySound(this.acceptSound)
				if(getn(gPickedMapList) < this.iMaxMissions) then
					local bMultipleSides
					local LastSideChar
					bMultipleSides,LastSideChar = ifs_missionselect_pcMulti_fnGetSides(Selection)

					if(bMultipleSides) then
						ifs_missionselect_pcMulti_fnSetPage(this,1)
					else
						-- Only 1 side. Add it directly.
						local EntryButton = this.CurButton
						this.AttackerChar = LastSideChar
						this.CurButton = LastSideChar
						ifs_missionselect_pcMulti_fnAddMap(this)
						this.CurButton = EntryButton
					end
				else
					-- Mission list is full. Notify the user
					ifs_missionselect_pcMulti_fnShowHideListboxes(this,nil)
					Popup_Ok.fnDone = ifs_missionselect_pcMulti_fnFullPopupDone
					IFText_fnSetString(Popup_Ok.title,"ifs.missionselect.listfull")
					Popup_Ok:fnActivate(1)
				end

			else
				-- must be on right listbox
				ifelm_shellscreen_fnPlaySound(this.acceptSound)
				this.bOnButtons = 1
				pc_missionselect_name_listboxR_layout.CursorIdx = nil
				ListManager_fnFillContents(this.listboxR,gPickedMapList,pc_missionselect_name_listboxR_layout)
				if(gPlatformStr ~= "PC") then
					ifs_missionselect_fnSetCurButton(this,this.LaunchButton,"Launch")
				end
			end -- on right
		elseif (this.iPage == 1) then -- Second sub-part
			ifelm_shellscreen_fnPlaySound(this.acceptSound)
			this.AttackerChar = this.CurButton -- store for later

			-- Side select is ingame now - NM 4/5/04
			ifs_missionselect_pcMulti_fnAddMap(this)
--			ifs_missionselect_pcMulti_fnSetPage(this,2)
		elseif (this.iPage == 2) then -- Second sub-part
			ifelm_shellscreen_fnPlaySound(this.acceptSound)

			ifs_missionselect_pcMulti_fnAddMap(this)

--			this.fnDone()
		end -- done with sub-parts
	end, -- end of Input_Accept

	Input_Back = function(this)
		-- Hack - if just 1 map, then can't go back to the listboxL
		if(getn(missionselect_listbox_contents) == 1) then
			this.EraMode = nil
		end

		if(this.iPage == 0) then -- first sub-part
			if(this.fnCancel) then
				this.fnCancel()
			end
			ScriptCB_PopScreen()
		elseif (this.iPage == 1) then
			ifelm_shellscreen_fnPlaySound(this.exitSound)
			ifs_missionselect_pcMulti_fnSetPage(this,0)
		end
	end,
	
	-- Delete a map from selected list. Done by creating a new list, copying
	-- everything but the selected one over, swapping lists.
--	Input_Misc = function(this)
--		if((this.iPage == 0) and (not this.bOnLeft) and (not this.bOnButtons)) then
--			local Count = getn(gPickedMapList)
--			if(Count > 0) then
--				local i
--				local j = 1
--				local NewList = {}
--				for i=1,Count do
--					if(i ~= pc_missionselect_name_listboxR_layout.SelectedIdx) then
--						NewList[j] = gPickedMapList[i]
--						j = j + 1
--					end
--				end
--
--				gPickedMapList = NewList
--
--				ListManager_fnAutoscroll(this.listboxR,gPickedMapList,pc_missionselect_name_listboxR_layout)
--				ListManager_fnFillContents(this.listboxR,gPickedMapList,pc_missionselect_name_listboxR_layout)
--
--				--if(getn(NewList) < 1) then
--				--	AnimationMgr_AddAnimation(this.Helptext_Delete, { fStartAlpha = 1, fEndAlpha = 0.25,})
--				--end
--					--ifs_missionselect_pcMulti_fnSetMapPreview(this)
--			end -- count > 0 
--		end -- page, column valid
--	end,

	Input_GeneralUp = function(this)
		-- If base class handled this work, then we're done
		if(gShellScreen_fnDefaultInputUp(this)) then
			return
		end

		if(this.iPage == 0) then -- First sub-part
			if(this.bOnLeft) then
				-- In listbox
				if(gPlatformStr ~= "PC") then -- console hack
					ListManager_fnNavUp(this.listboxL,missionselect_listbox_contents,pc_missionselect_name_listboxL_layout)
				end
			else
				-- on the right
				if(this.bOnButtons) then
					ifelm_shellscreen_fnPlaySound(this.selectSound)
					if(this.CurButton == "Order") then
						ifs_missionselect_pcMulti_fnSetCurButton(this,nil)
						pc_missionselect_name_listboxR_layout.SelectedIdx = min(pc_missionselect_name_listboxR_layout.FirstShownIdx + pc_missionselect_name_listboxR_layout.showcount - 1, getn(gPickedMapList))
						if(pc_missionselect_name_listboxR_layout.SelectedIdx < 1) then
							pc_missionselect_name_listboxR_layout.SelectedIdx = 1
						end
						pc_missionselect_name_listboxR_layout.CursorIdx = pc_missionselect_name_listboxR_layout.SelectedIdx
						ListManager_fnFillContents(this.listboxR,gPickedMapList,pc_missionselect_name_listboxR_layout)
					else
						if(gPlatformStr ~= "PC") then
							ifs_missionselect_fnSetCurButton(this,this.OrderButton,"Order")
						end
					end

				else
					-- Not on buttons
					if(pc_missionselect_name_listboxR_layout.SelectedIdx == 1) then
						pc_missionselect_name_listboxR_layout.CursorIdx = nil
						ListManager_fnFillContents(this.listboxR,gPickedMapList,pc_missionselect_name_listboxR_layout)
						if(gPlatformStr ~= "PC") then
							ifs_missionselect_fnSetCurButton(this,this.LaunchButton,"Launch")
						end
						ifelm_shellscreen_fnPlaySound(this.selectSound)
					else
						-- on right
						if(gPlatformStr ~= "PC") then -- console hack
							ListManager_fnNavUp(this.listboxR,gPickedMapList,pc_missionselect_name_listboxR_layout)
						end
					end
				end
			end
--			ifs_missionselect_pcMulti_fnSetMapPreview(this)
		elseif (this.iPage == 1) then
			gDefault_Input_GeneralUp(this)
		end -- page == 0
		ifs_missionselect_pcMulti_fnUpdateDelButton(this)
	end,

	Input_GeneralDown = function(this)
		-- If base class handled this work, then we're done
		if(gShellScreen_fnDefaultInputDown(this)) then
			return
		end
		if(this.iPage == 0) then -- First sub-part
			if(this.bOnLeft) then
				if(gPlatformStr ~= "PC") then -- console hack
					ListManager_fnNavDown(this.listboxL,missionselect_listbox_contents,pc_missionselect_name_listboxL_layout)
				end
			else
				-- on the right
				if(this.bOnButtons) then
					ifelm_shellscreen_fnPlaySound(this.selectSound)
					if(this.CurButton == "Order") then
						if(gPlatformStr ~= "PC") then
							ifs_missionselect_fnSetCurButton(this,this.LaunchButton,"Launch")
						end
					else
						ifs_missionselect_pcMulti_fnSetCurButton(this,nil)
						pc_missionselect_name_listboxR_layout.SelectedIdx = pc_missionselect_name_listboxR_layout.FirstShownIdx
						
						pc_missionselect_name_listboxR_layout.CursorIdx = pc_missionselect_name_listboxR_layout.SelectedIdx
						ListManager_fnFillContents(this.listboxR,gPickedMapList,pc_missionselect_name_listboxR_layout)
					end
				else
					-- Not on buttons
					if(pc_missionselect_name_listboxR_layout.SelectedIdx >= getn(gPickedMapList)) then
						pc_missionselect_name_listboxR_layout.CursorIdx = nil
						ListManager_fnFillContents(this.listboxR,gPickedMapList,pc_missionselect_name_listboxR_layout)
						if(gPlatformStr ~= "PC") then
							ifs_missionselect_fnSetCurButton(this,this.OrderButton,"Order")
						end
						ifelm_shellscreen_fnPlaySound(this.selectSound)
					else
						if(gPlatformStr ~= "PC") then -- console hack
							ListManager_fnNavDown(this.listboxR,gPickedMapList,pc_missionselect_name_listboxR_layout)
						end
					end
				end -- not on buttons
			end
--			ifs_missionselect_pcMulti_fnSetMapPreview(this)
		elseif (this.iPage == 1) then
			gDefault_Input_GeneralDown(this)
		end
		ifs_missionselect_pcMulti_fnUpdateDelButton(this)
	end,

	Input_LTrigger = function(this)
		if(this.iPage == 0) then -- First sub-part
			if(this.bOnLeft) then
				ListManager_fnPageUp(this.listboxL,missionselect_listbox_contents,pc_missionselect_name_listboxL_layout)
			else
				ListManager_fnPageUp(this.listboxR,gPickedMapList,pc_missionselect_name_listboxR_layout)
			end
--			ifs_missionselect_pcMulti_fnSetMapPreview(this)
		end
	end,

	Input_RTrigger = function(this)
		if(this.iPage == 0) then -- First sub-part
			if(this.bOnLeft) then
				ListManager_fnPageDown(this.listboxL,missionselect_listbox_contents,pc_missionselect_name_listboxL_layout)
			else
				ListManager_fnPageDown(this.listboxR,gPickedMapList,pc_missionselect_name_listboxR_layout)
			end
--			ifs_missionselect_pcMulti_fnSetMapPreview(this)
		end
	end,

	Input_GeneralLeft = function(this)
		if(this.iPage == 0) then
			ifs_missionselect_pcMulti_fnFlipLeftRight(this)
		end
	end,

	Input_GeneralRight = function(this)
		if(this.iPage == 0) then
			ifs_missionselect_pcMulti_fnFlipLeftRight(this)
		end
	end,

	RepaintListbox = function(this, bOnLeft)
	end,	
	UpdateButtons = function(this) 
	end,
	UpdateUI = function(this)
	end,
	fnClearButtonHilight = function(this)
	end,
}

ifs_era_vbutton_layout = {
--	yTop = -70,
	xWidth = 350,
	width = 350,
	xSpacing = 10,
	ySpacing = 5,
	font = "gamefont_large",
	buttonlist = { 
		{ tag = "new", string = "common.era.cw", },
		{ tag = "classic", string = "common.era.gcw", },
	},
	title = "ifs.sp.pick_era",
    	rotY = 35,
}

function ifs_missionselect_pcMulti_fnBuildScreen(this)
	local w,h = ScriptCB_GetSafeScreenInfo() -- of the usable screen


--	if(ScriptCB_GetLanguage() ~= "english") then
--		pc_missionselect_name_listboxL_layout.yHeight = 45
--		pc_missionselect_name_listboxR_layout.yHeight = 45
--	end
	local ListEntryHeight = (pc_missionselect_name_listboxL_layout.yHeight + pc_missionselect_name_listboxL_layout.ySpacing)	
	
	pc_missionselect_name_listboxL_layout.width = (w * 0.48) - 35
	pc_missionselect_name_listboxR_layout.width = (w * 0.48) - 35

	
	pc_missionselect_name_listboxL_layout.showcount = 10 --min(16,max(4, floor((h - 160) / ListEntryHeight)))
	pc_missionselect_name_listboxR_layout.showcount = 10
	
--	pc_missionselect_name_listboxL_layout.showcount = min(16,max(4, floor((h - 160) / ListEntryHeight)))
--	pc_missionselect_name_listboxR_layout.showcount = pc_missionselect_name_listboxL_layout.showcount - 2

	local ListHeightR = pc_missionselect_name_listboxR_layout.showcount * ListEntryHeight + 30
	local ListHeightL = pc_missionselect_name_listboxL_layout.showcount * ListEntryHeight + 30

	--local ListHeightL = ListHeightR -- * 1.5

	this.listboxL = NewButtonWindow { 
		ZPos = 200, 
		x = pc_missionselect_name_listboxL_layout.width * 0.5 + 30 - w*0.5, 
		y = -30,
		ScreenRelativeX = 0.5, -- center of screen
		ScreenRelativeY = 0.5, -- middle, vertically
		width = pc_missionselect_name_listboxL_layout.width + 35,
		height = ListHeightL,
		rotY = 35,
		titleText = "ifs.missionselect.available"
	}

	this.listboxR = NewButtonWindow { 
		ZPos = 200, 
		x = -(pc_missionselect_name_listboxR_layout.width * 0.5+30) + w*0.5, 
		y = -30,
		ScreenRelativeX = 0.5, -- center of screen
		ScreenRelativeY = 0.5, -- middle, vertically
		width = pc_missionselect_name_listboxR_layout.width + 35,
		height = ListHeightR,
		rotY = -35,
		titleText = "ifs.missionselect.selected"
	}

	this.buttons = NewIFContainer {
		ScreenRelativeX = 0.25,
		ScreenRelativeY = 0.5,
	}

	local MapRadius = 50
	
	-- this isn't actually shown anymore...
	this.Map = NewIFMapPreview {
		ScreenRelativeX = 0.0,
		ScreenRelativeY = 0.0,
		x = w * 0.5, y = 35 + ListHeightR + MapRadius,
		width = MapRadius,
	}
	
	this.OrderButton = NewClickableIFButton {
		ScreenRelativeX = 0.5,
		ScreenRelativeY = 0.5,
		rotY = this.listboxR.rotY,
		x = this.listboxR.x + 23,
		y = this.listboxR.height / 2 - 19,
		btnw = this.listboxR.width,
		btnh = ScriptCB_GetFontHeight("gamefont_small"),
		font = "gamefont_small", 
		tag = "Order",
		string = "ifs.missionselect.inorder",
	}

	this.LaunchButton = NewClickableIFButton {
		ScreenRelativeX = 1.0,
		ScreenRelativeY = 1.0,
		x = -75,
		y = -15,
		btnw = 150, -- bumped from 100->150 NM 8/25/04 for bug 9174
		btnh = ScriptCB_GetFontHeight("gamefont_medium"),
		font = "gamefont_medium", 
		tag = "Launch",
		nocreatebackground = 1,
		string = "ifs.onlinelobby.launch",
	}

	this.OptionButton = NewRoundIFButton 
	{
		ScreenRelativeX = 0.5,
		ScreenRelativeY = 1.0,
		rotY = 0,
		y = -15,
		btnw = w * 0.44,
		btnh = ScriptCB_GetFontHeight("gamefont_tiny"),
		font = "gamefont_tiny",
		nocreatebackground = 1,
	}
	--this.OptionButton.x =  -- 1 - half of btnw's 36% of screen
	this.OptionButton.label.halign = "hcenter"
	this.OptionButton.label.valign = "vcenter"
	this.OptionButton.label.ColorR = 255
	this.OptionButton.label.ColorG = 255
	this.OptionButton.label.ColorB = 255
	this.OptionButton.font = nil
	this.OptionButton.label.bHotspot = 1
	this.OptionButton.label.fHotspotW = this.OptionButton.btnw
	this.OptionButton.label.fHotspotH = this.OptionButton.btnh
	this.OptionButton.tag = "Option"
	RoundIFButtonLabel_fnSetString(this.OptionButton,"ifs.missionselect.serveroptions")
	
	local EditBoxW = w * 0.30
	local TextFont = "gamefont_tiny"
	local EditBoxFont = "gamefont_small"
	local EditBoxH = ScriptCB_GetFontHeight(EditBoxFont) + 15
	
	local egt = "ifs.mp.sessionlist.gamename"
	-- this is dodgy
	if(ScriptCB_GetLanguage() == "spanish") then
		egt = "ifs.mp.create.entername"
	end

	this.EditContainer = NewIFContainer {
		ScreenRelativeX = 0.175,
		ScreenRelativeY = 0.77,
		rotY = 35,
		y = 0,
		
		EditGameText = NewIFText {
			halign = "right", valign = "vcenter",
			x = -EditBoxW,
			y = -EditBoxH + 14,
			font = TextFont, 
			textw = EditBoxW, texth = EditBoxH,
			flashy = 0,
			string = egt,
		},
		EditGameName = NewEditbox {
			width = EditBoxW,
			height = EditBoxH,
			font = EditBoxFont,
			MaxChars = 20,
			MaxLen = EditBoxW - 40,
		},
		EditPassText = NewIFText {
			x = -EditBoxW,
			y =  14,
			halign = "right", valign = "vcenter",
			font = TextFont, 
			textw = EditBoxW, texth = EditBoxH,
			flashy = 0,
			string = "ifs.gsprofile.password",
		},
		EditPass = NewEditbox {
			width = EditBoxW,
			height = EditBoxH,
			y = EditBoxH,
			font = EditBoxFont,
			MaxChars = 20,
			bPasswordMode = 1,
			MaxLen = EditBoxW - 40,
		},
	}
	this.EditContainer.EditGameName.x = EditBoxW * 0.5
	this.EditContainer.EditPass.x = EditBoxW * 0.5
	
	--size the background
	local wScreen,hScreen,vScreen,widescreen = ScriptCB_GetScreenInfo()
 	this.backImg.localpos_r = wScreen*widescreen
 	this.backImg.localpos_b = hScreen
 	this.backImg.uvs_b = vScreen
	-- calc the position of the movie preview window
	this.movieW = 510.0
	this.movieH = 400.0
	this.movieX = wScreen - 500.0
	this.movieY = hScreen - this.movieH + 24.0 - 20

	-- Also, add buttons
	print("this.Buttons=",this.buttons)
	print("eralayout=", ifs_sp_era_vbutton_layout)
	this.CurButton = AddVerticalButtons(this.buttons,ifs_era_vbutton_layout)

	ListManager_fnInitList(this.listboxL,pc_missionselect_name_listboxL_layout)
	ListManager_fnInitList(this.listboxR,pc_missionselect_name_listboxR_layout)

	if(gPlatformStr == "PC") then
		local AddDelButtonW = 40
		local AddDelButtonYSpace = 5
		local AddDelButtonH = 20

		this.AddDelContainer =	NewIFContainer {
			ScreenRelativeX = 0.5, -- center
			ScreenRelativeY = 0.5, -- center
			y = 0,
			x = 0,

			--add the left/right arrows
			add = NewIFImage 
			{
				y = -(AddDelButtonH + AddDelButtonYSpace),
				x = 1,
				btnw = AddDelButtonW, 
				btnh = AddDelButtonH,
				tag = "_add",
 				localpos_l = -AddDelButtonW/2, localpos_t = -AddDelButtonH/2,
 				localpos_r =  AddDelButtonW/2, localpos_b =  AddDelButtonH/2,
 				texture = "small_arrow",
 			},
			del = NewIFImage 
			{
				y = (AddDelButtonH + AddDelButtonYSpace),
				x = 0,
				btnw = AddDelButtonW, 
				btnh = AddDelButtonH,
				tag = "_del",
 				localpos_l =  AddDelButtonW/2, localpos_t = -AddDelButtonH/2,
 				localpos_r = -AddDelButtonW/2, localpos_b =  AddDelButtonH/2,
 				texture = "small_arrow",
 			},
		} -- end of button container
 		this.AddDelContainer.add.bHotspot = 1
		this.AddDelContainer.add.fHotspotW = AddDelButtonW
		this.AddDelContainer.add.fHotspotH = AddDelButtonH + 8
		this.AddDelContainer.add.fHotspotX = -AddDelButtonW/2
		this.AddDelContainer.add.fHotspotY = -AddDelButtonH/2 - 4
 		this.AddDelContainer.del.bHotspot = 1
		this.AddDelContainer.del.fHotspotW = AddDelButtonW
		this.AddDelContainer.del.fHotspotH = AddDelButtonH + 8
		this.AddDelContainer.del.fHotspotX = -AddDelButtonW/2
		this.AddDelContainer.del.fHotspotY = -AddDelButtonH/2 - 4
	end

--	if(ScriptCB_GetLanguage() ~= "english") then
--		this.listboxL.titleBarElement.font = "gamefont_tiny"
--		this.listboxR.titleBarElement.font = "gamefont_tiny"
--		this.listboxR.y = this.listboxR.y - 10
--	end
end

ifs_missionselect_pcMulti_fnBuildScreen(ifs_missionselect_pcMulti)
ifs_missionselect_pcMulti_fnBuildScreen = nil -- dump out of memory to save

AddIFScreen(ifs_missionselect_pcMulti,"ifs_missionselect_pcMulti")
