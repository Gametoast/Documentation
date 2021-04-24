-- Multiplayer game name screen.

-- Helper function. Given a layout (x,y,width, height), returns a
-- fully-built item.
function Teamstats_Listbox_CreateItem(layout)

	local insidewidth = layout.width - 10;
	-- Make a coordinate system pegged to the top-left of where the cursor would go.
	local Temp = NewIFContainer {
		x = layout.x - 0.5 * insidewidth, y=layout.y,
		bInertPos = 1,
	}
	Temp.labelstr = NewIFText {
		HScale = 0.8,
		VScale = 1,
		x = 2, y = -10, textw = 0.65 * insidewidth, 
		texth = ScriptCB_GetFontHeight("gamefont_medium"),
		clip = "character",
		halign = "left", font = "gamefont_medium",
		ColorR= 255, ColorG = 255, ColorB = 255,
		style = "normal",
		bInertPos = 1,
		nocreatebackground = 1,
		startdelay = random() * 0.15,
		inert_all = 1,
	}

	local WidthPer = insidewidth * 0.133
	Temp.val1str = NewIFText{
		HScale = 0.8,
		VScale = 1,
		x = insidewidth - WidthPer * 3, y = -10, 
		textw = WidthPer, halign = "right", font = "gamefont_medium",		
		ColorR= 255, ColorG = 255, ColorB = 255,
		style = "normal",
		bInertPos = 1,
		nocreatebackground = 1,
		startdelay = random() * 0.15,
		inert_all = 1,
	}
	Temp.val2str = NewIFText{
		HScale = 0.8,
		VScale = 1,
		x = insidewidth - WidthPer * 2, y = -10, 
		textw = WidthPer, halign = "right", font = "gamefont_medium",
		ColorR= 255, ColorG = 255, ColorB = 255,
		style = "normal",
		bInertPos = 1,
		nocreatebackground = 1,
		startdelay = random() * 0.15,
		inert_all = 1,
	}
	Temp.val3str = NewIFText{ 
		HScale = 0.8,
		VScale = 1,
		x = insidewidth - WidthPer * 1, y = -10, 
		textw = WidthPer, halign = "right", font = "gamefont_medium",
		ColorR= 255, ColorG = 255, ColorB = 255,
		style = "normal",
		bInertPos = 1,
		nocreatebackground = 1,
		startdelay = random() * 0.15,
		inert_all = 1,
	}
	return Temp
end

-- Helper function. For a destination item (previously created w/
-- CreateItem), fills it in with data, which may be nil (==blank it)
function Teamstats_Listbox_PopulateItem(Dest,Data)
	if(Data) then
		-- force the name into word clipping
		if(Dest.labelstr.cpointer) then
			ScriptCB_IFText_SetTextBreak(Dest.labelstr.cpointer,"none")
		end
		-- Contents to show. Do so.
		IFText_fnSetUString(Dest.labelstr,Data.labelustr)
		IFText_fnSetString(Dest.val1str,Data.val1str)
		IFText_fnSetString(Dest.val2str,Data.val2str)
		IFText_fnSetString(Dest.val3str,Data.val3str)

-- 		IFText_fnSetString(Dest.labelstr,"WWWWWWWWWWWWWWM")
-- 		IFText_fnSetString(Dest.val1str,"11111")
-- 		IFText_fnSetString(Dest.val2str,"22222")
-- 		IFText_fnSetString(Dest.val3str,"33333")

		if(Data.ColorR) then
			IFObj_fnSetColor(Dest.labelstr,Data.ColorR,Data.ColorG,Data.ColorB)
			IFObj_fnSetColor(Dest.val1str,Data.ColorR,Data.ColorG,Data.ColorB)
			IFObj_fnSetColor(Dest.val2str,Data.ColorR,Data.ColorG,Data.ColorB)
			IFObj_fnSetColor(Dest.val3str,Data.ColorR,Data.ColorG,Data.ColorB)
		end
	end

	IFObj_fnSetVis(Dest,Data) -- Show if there are contents
	
	-- if the cpp == -1, then don't show this entry (its padding)
	if(Data and Data.val3str == "-1") then
		IFObj_fnSetVis(Dest,nil)
	end
	
end

teamstats_listbox_layoutL = {
--	showcount = 20, -- filled in from code later
--	yTop = -130 + 13,
	yHeight = 27,
	ySpacing  = 0,
-- 	width = 430, -- filled in from code later
	x = 0,
--	slider = 1,
	CreateFn = Teamstats_Listbox_CreateItem,
	PopulateFn = Teamstats_Listbox_PopulateItem,
}

teamstats_listbox_layoutR = {
--	showcount = 20, -- filled in from code later
--	yTop = -130 + 13,
	yHeight = 27,
	ySpacing  = 0,
-- 	width = 430, -- filled in from code later
	x = 0,
--	slider = 1,
	CreateFn = Teamstats_Listbox_CreateItem,
	PopulateFn = Teamstats_Listbox_PopulateItem,
}

function ifs_teamstats_fnFillContents(this,noAnimate)
	-- Reset listbox, show it. [Remember, Lua starts at 1!]
	local playerIdxL,playerIdxR
	playerIdxR = ScriptCB_GetTeamstats(1)
	playerIdxL = ScriptCB_GetTeamstats(0)
	if(this.SetCursorToPlayer) then
		if(playerIdxL >= 0) then
			this.bCursorOnLeft = 1
			teamstats_listbox_layoutL.CursorIdx = playerIdxL + 1
			teamstats_listbox_layoutL.SelectedIdx = playerIdxL + 1
			teamstats_listbox_layoutL.FirstShownIdx = max(playerIdxL-4,1)
			teamstats_listbox_layoutR.CursorIdx = nil
			teamstats_listbox_layoutR.SelectedIdx = nil
			teamstats_listbox_layoutR.FirstShownIdx = max(playerIdxL-4,1)
		end
		if(playerIdxR >= 0) then
			this.bCursorOnLeft = nil
			teamstats_listbox_layoutL.CursorIdx = nil
			teamstats_listbox_layoutL.SelectedIdx = nil
			teamstats_listbox_layoutL.FirstShownIdx = max(playerIdxR-4,1)
			teamstats_listbox_layoutR.CursorIdx = playerIdxR + 1
			teamstats_listbox_layoutR.SelectedIdx = playerIdxR + 1
			teamstats_listbox_layoutR.FirstShownIdx = max(playerIdxR-4,1)
		end
	end
	
	-- and set the colors of each side
	this.playerTeam = 1
	if(playerIdxR>=0) then
		this.playerTeam = 2
	end
	
	-- set the title text, icons, models
	ScriptCB_TeamStatsSetTitles(this.playerTeam)

	if(not noAnimate) then
		-- animate the models	
		local w,h = ScriptCB_GetSafeScreenInfo()
		local fw,fh = ScriptCB_GetScreenInfo()
		local es = fw/800
		local xs,xe
		local spinL,spinR
		xs=0; xe=0; ys=0; sa=0; spinL=1
		if(this.returnAnim == 1) then
			xs = -w*0.15
			ys = -h*0.30
			sa = 0.4
			spinL = 20
		end
		AnimationMgr_AddAnimation(this.LeftModel,{ fTotalTime = 0.4,fStartAlpha = sa, fEndAlpha = 0.2,
				fStartX=xs,fStartY=ys,fEndX=0,fEndY=0,
				fStartW=0.5*es,fStartH=0.5*es,fEndW=es,fEndH=es,})
		xs=0; xe=0; ys=0; sa=0; spinR=1
		if(this.returnAnim == 2) then
			xs = w*0.15
			ys = -h*0.30
			sa = 0.4
			spinR = 20
		end
		AnimationMgr_AddAnimation(this.RightModel,{ fTotalTime = 0.4,fStartAlpha = sa, fEndAlpha = 0.2,
				fStartX=xs,fStartY=ys,fEndX=0,fEndY=0,
				fStartW=0.5*es,fStartH=0.5*es,fEndW=es,fEndH=es,})
		this.returnAnim = nil
		-- make them spin fast while moving
		ScriptCB_IFModel_SetOmegaY(this.LeftModel.cpointer,spinL)
		ScriptCB_IFModel_SetOmegaY(this.RightModel.cpointer,spinR)
		this.IconModelFastMode = 1
	else
		AnimationMgr_AddAnimation(this.LeftModel,{ fTotalTime = 0.1,fStartAlpha = 0.2, fEndAlpha = 0.2, })
		AnimationMgr_AddAnimation(this.RightModel,{ fTotalTime = 0.1,fStartAlpha = 0.2, fEndAlpha = 0.2, })
	end			

	-- fill them	
	ListManager_fnFillContents(this.LeftList,teamstats_listbox_contentsL,teamstats_listbox_layoutL)
	ScriptCB_GetTeamstats(1)
	ListManager_fnFillContents(this.RightList,teamstats_listbox_contentsR,teamstats_listbox_layoutR)
end

-- Helper function, blanks out the onscreen contents. Used to keep the
-- glyphcache from overloading.
function ifs_teamstats_fnBlankContents(this)
	local i,Max

	local BlankUStr = ScriptCB_tounicode("")

	Max = getn(teamstats_listbox_contentsL)
	for i=1,Max do
		teamstats_listbox_contentsL[i].labelustr = BlankUStr
		teamstats_listbox_contentsL[i].val1str = ""
		teamstats_listbox_contentsL[i].val2str = ""
		teamstats_listbox_contentsL[i].val3str = ""
	end

	Max = getn(teamstats_listbox_contentsR)
	for i=1,Max do
		teamstats_listbox_contentsR[i].labelustr = BlankUStr
		teamstats_listbox_contentsR[i].val1str = ""
		teamstats_listbox_contentsR[i].val2str = ""
		teamstats_listbox_contentsR[i].val3str = ""
	end

	-- Repaint
	ListManager_fnFillContents(this.LeftList,teamstats_listbox_contentsL,teamstats_listbox_layoutL)
	ListManager_fnFillContents(this.RightList,teamstats_listbox_contentsR,teamstats_listbox_layoutR)
end

teamstats_listbox_contents = {}

teamstats_listbox_contentsL = {
	-- Filled in from C++
	-- Stubbed to show the format it wants.
--	{ labelustr = "Player 1", contentsstr = "5"},
-- **OR**
--	{ labelustr = " Favorite Vehicle", contentsustr = "AT-ST"}, 
}

teamstats_listbox_contentsR = {
	-- Filled in from C++
	-- Stubbed to show the format it wants.
--	{ labelustr = "Player 1", contentsstr = "5"},
-- **OR**
--	{ labelustr = " Favorite Vehicle", contentsustr = "AT-ST"}, 
}

function ifs_teamstats_fnFlipLeftRight(this)
	if(teamstats_listbox_layoutL.SelectedIdx) then
		this.bCursorOnLeft = nil
		teamstats_listbox_layoutR.SelectedIdx = teamstats_listbox_layoutL.SelectedIdx
		teamstats_listbox_layoutL.SelectedIdx = nil
	else
		this.bCursorOnLeft = 1
		teamstats_listbox_layoutL.SelectedIdx = teamstats_listbox_layoutR.SelectedIdx
		teamstats_listbox_layoutR.SelectedIdx = nil
	end

	ifs_teamstats_fnValidateCursor(this)
end

--validate the cursor position (make sure we're not on a null entry)
function ifs_teamstats_fnValidateCursor(this)
	local onLeft = nil
	if(teamstats_listbox_layoutL.SelectedIdx) then
		onLeft = 1		
	end
	this.bCursorOnLeft = onLeft
	local Pos = teamstats_listbox_layoutL.SelectedIdx or teamstats_listbox_layoutR.SelectedIdx
	if(onLeft) then
		Pos = ScriptCB_TeamStatsValidatePos( 0, Pos );
	else
		Pos = ScriptCB_TeamStatsValidatePos( 1, Pos );
	end
	
	--set the cursor to the validated position
	if(onLeft) then		
		teamstats_listbox_layoutL.CursorIdx = Pos
		teamstats_listbox_layoutR.CursorIdx = nil
		teamstats_listbox_layoutL.SelectedIdx = Pos
		teamstats_listbox_layoutR.SelectedIdx = nil
	else
		teamstats_listbox_layoutL.CursorIdx = nil
		teamstats_listbox_layoutR.CursorIdx = Pos
		teamstats_listbox_layoutL.SelectedIdx = nil
		teamstats_listbox_layoutR.SelectedIdx = Pos
	end
	ListManager_fnMoveCursor(this.LeftList,teamstats_listbox_layoutL)
	ListManager_fnMoveCursor(this.RightList,teamstats_listbox_layoutR)
end

function ifs_teamstats_fnNav(fn)
	local this = ifs_teamstats
	if(teamstats_listbox_layoutL.SelectedIdx) then
		teamstats_listbox_layoutR.SelectedIdx = teamstats_listbox_layoutL.SelectedIdx
		fn(this.LeftList,teamstats_listbox_contentsL,teamstats_listbox_layoutL)
		fn(this.RightList,teamstats_listbox_contentsR,teamstats_listbox_layoutR)
		teamstats_listbox_layoutR.SelectedIdx = nil
	else
		teamstats_listbox_layoutL.SelectedIdx = teamstats_listbox_layoutR.SelectedIdx
		fn(this.RightList,teamstats_listbox_contentsR,teamstats_listbox_layoutR)
		fn(this.LeftList,teamstats_listbox_contentsL,teamstats_listbox_layoutL)
		teamstats_listbox_layoutL.SelectedIdx = nil
	end
	ifs_teamstats_fnValidateCursor(this)
	this.fCurIdleTime = this.fMAX_IDLE_TIME 
end

ifs_teamstats = NewIFShellScreen {
	nologo = 1,
	fMAX_IDLE_TIME = 30.0,
	fCurIdleTime = 0,
	movieIntro      = nil, -- played before the screen is displayed
	movieBackground = nil, -- played while the screen is displayed
	bNohelptext_backPC = 1,

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
	
	quit = NewIFContainer
	{
		ScreenRelativeX = 0.0,
		ScreenRelativeY = 1.0,
		btn = NewClickableIFButton
		{ 
			x = 60,
			y = -15,
			btnw = 130, 
			btnh = 25,
			font = "gamefont_medium", 
			bg_tail = 20,
			tag = "quit",
			string = "ifs.stats.done",
			nocreatebackground = 1,
		}, -- end of btn
	},
	
	details = NewIFContainer
	{
		ScreenRelativeX = 0.5,
		ScreenRelativeY = 0.5,
		btn = NewClickableIFButton
		{ 
			x = 0,
			y = 0,
			btnw = 10, 
			btnh = ScriptCB_GetFontHeight("gamefont_small"),
			font = "gamefont_small", 
			tag = "details",
			string = "ifs.Stats.details",
			noTransitionFlash = 1,
		}, -- end of btn
	},
	
	awards = NewIFContainer
	{
		ScreenRelativeX = 1.0,
		ScreenRelativeY = 1.0,
		btn = NewClickableIFButton
		{ 
			x = 0,
			y = -15,
			btnw = 180, 
			btnh = ScriptCB_GetFontHeight("gamefont_small"),
			font = "gamefont_small", 
			tag = "awards",
			string = "ifs.Stats.awards",
			--rotY = -35,
			nocreatebackground=1,
		}, -- end of btn
	},
	


	bCursorOnLeft = 1,

	Enter = function(this, bFwd)
		gIFShellScreenTemplate_fnEnter(this, bFwd) -- call default enter function

		IFModel_fnSetMsh(this.LeftModel,"")
		IFModel_fnSetMsh(this.RightModel,"")		

		gIFShellScreenTemplate_fnMoveClickableButton(this.awards.btn,this.awards.btn.label,0)
		gIFShellScreenTemplate_fnCenterClickableButton(this.details.btn,this.details.btn.label,0,"ifs.Stats.details")
		
--		AnimationMgr_AddAnimation(this.buttons.LeftColumnHeader1, { fStartAlpha = 0, fEndAlpha = 1,})
--		AnimationMgr_AddAnimation(this.buttons.LeftColumnHeader2, { fStartAlpha = 0, fEndAlpha = 1,})
--		AnimationMgr_AddAnimation(this.buttons.LeftColumnHeader3, { fStartAlpha = 0, fEndAlpha = 1,})
--		AnimationMgr_AddAnimation(this.buttons.RightColumnHeader1, { fStartAlpha = 0, fEndAlpha = 1,})
--		AnimationMgr_AddAnimation(this.buttons.RightColumnHeader2, { fStartAlpha = 0, fEndAlpha = 1,})
--		AnimationMgr_AddAnimation(this.buttons.RightColumnHeader3, { fStartAlpha = 0, fEndAlpha = 1,})
		
		-- if we're in MP and the client never recieved stats, just skip the stats and go
		-- back to the shell now. [DISABLED NM 10/19/04 - gotta wait for server]
		if(nil and (not ScriptCB_ClientGotStats())) then
			ScriptCB_QuitFromStats()
			ScriptCB_SndPlaySound("shell_menu_exit");
			return
		end

		if(bFwd) then
			-- Horrible hack -- We need the memory on the PS2 for the stats,
			-- and the only way to get that now is to kick some screens out of
			-- memory.
			if(gPlatformStr == "PS2") then
				ifs_pausemenu = nil -- die if we ever exit out of here.
				ifs_opt_controller = nil -- we need memory, NOW
				ifs_mp_lobby = nil -- we need memory, NOW			
			end
			this.bCursorOnLeft = 1
			teamstats_listbox_layoutL.FirstShownIdx = 1
			teamstats_listbox_layoutR.FirstShownIdx = 1
			teamstats_listbox_layoutL.SelectedIdx = 1
			teamstats_listbox_layoutR.SelectedIdx = nil
			teamstats_listbox_layoutL.CursorIdx = 1
			teamstats_listbox_layoutR.CursorIdx = nil
			
			this.SetCursorToPlayer = 1
		end
		ifs_teamstats_fnFillContents(this,nil)
		this.SetCursorToPlayer = nil
		
		this.fCurIdleTime = this.fMAX_IDLE_TIME

		if(gE3Build) then
			if(ScriptCB_GetAmHost()) then
				gE3StatsTimeout = 15
			else
				gE3StatsTimeout = 20
			end
		else
			gE3StatsTimeout = 0 -- can quit right away
		end
		
		if(gPlatformStr == "PC") then --quickee hack for PC
			gE3StatsTimeout = 0 
		end

		if((ScriptCB_InNetGame()) and (ScriptCB_AreMetagameRulesOn()) and (ScriptCB_GetAmHost())) then
			this.fCurIdleTime = 0
			gE3StatsTimeout = 0
		end
	end,

	Exit = function(this, bFwd)
		-- Reduce lua memory, glyphcache usage
		ifs_teamstats_fnBlankContents(this)
		teamstats_listbox_contents = nil
		teamstats_listbox_contentsL = nil
		teamstats_listbox_contentsR = nil
		if(gCurHiliteButton) then
			IFButton_fnSelect(gCurHiliteButton,nil)
		end
	end,

	-- Accept button bumps the page
	Input_Accept = function(this)
		-- If base class handled this work, then we're done
		if(gShellScreen_fnDefaultInputAccept(this)) then
			-- check for a double click
			ScriptCB_ResetMouseMark()
			if(gMouseListBox) then
				if( gMouseListBox.Layout.SelectedIdx == gMouseListBox.Layout.CursorIdx and this.lastDoubleClickTime and ScriptCB_GetMissionTime()<this.lastDoubleClickTime+0.4) then
					this.lastDoubleClickTime = nil
					this.CurButton = "details"
				else
					this.lastDoubleClickTime = ScriptCB_GetMissionTime()
					return
				end
			else
				return
			end
		end

		this.fCurIdleTime = this.fMAX_IDLE_TIME 

		-- Todo: PC needs to read current listbox instead
		local Selection
		if(teamstats_listbox_layoutL.SelectedIdx) then
			ifs_personalstats.fTeam = 1
			ifs_personalstats.fIdx = teamstats_listbox_layoutL.SelectedIdx
			Selection = teamstats_listbox_contentsL[teamstats_listbox_layoutL.SelectedIdx]
		else
			ifs_personalstats.fTeam = 2
			ifs_personalstats.fIdx = teamstats_listbox_layoutR.SelectedIdx
			Selection = teamstats_listbox_contentsR[teamstats_listbox_layoutR.SelectedIdx]
		end
		if(Selection and this.CurButton == "details") then
			IFText_fnSetUString(ifs_personalstats.title2,Selection.labelustr)
			-- set the title text, icons, models
			ScriptCB_PersonalStatsSetTitles(this.playerTeam,ifs_personalstats.fTeam)
			-- animate the models
			local w,h = ScriptCB_GetSafeScreenInfo()
			local fw,fh = ScriptCB_GetScreenInfo()
			local es = fw/800
			local xs,xe
			local spin
			if(ifs_personalstats.fTeam==1) then
				xs = -w*0.25
				xe = -w*0.4
				this.returnAnim = 1
			else
				xs = w*0.25
				xe = w*0.4
				this.returnAnim = 2
			end
			AnimationMgr_AddAnimation(ifs_personalstats.IconModel,{ fTotalTime = 0.4, fStartAlpha = 0.2, fEndAlpha = 0.4,
					fStartX=xs,fStartY=0,fEndX=xe,fEndY=-h*0.30,
					fStartW=1*es,fStartH=1*es,fEndW=0.5*es,fEndH=0.5*es,})
			-- make it spin fast
			ScriptCB_IFModel_SetOmegaY(ifs_personalstats.IconModel.cpointer,20)
			ifs_personalstats.IconModelFastMode = 1
		end
		
		-- buttons?
		if(this.CurButton == "quit") then
			ScriptCB_QuitFromStats()
			ScriptCB_SndPlaySound("shell_menu_exit");
			return
		elseif(this.CurButton == "details") then
			ifs_movietrans_PushScreen(ifs_personalstats)
			ScriptCB_SndPlaySound("shell_menu_enter");
			return
		elseif(this.CurButton == "awards") then
			ifs_movietrans_PushScreen(ifs_awardstats)
			ScriptCB_SndPlaySound("shell_menu_enter");
			return
		elseif(this.CurButton == "_upL" or this.CurButton == "_upR") then
			ifs_teamstats_fnNav(ListManager_fnScrollUp)
			ListManager_fnFillContents(this.LeftList,teamstats_listbox_contentsL,teamstats_listbox_layoutL)
			ListManager_fnFillContents(this.RightList,teamstats_listbox_contentsR,teamstats_listbox_layoutR)			
		elseif(this.CurButton == "_downL" or this.CurButton == "_downR") then
			ifs_teamstats_fnNav(ListManager_fnScrollDown)
			ListManager_fnFillContents(this.LeftList,teamstats_listbox_contentsL,teamstats_listbox_layoutL)
			ListManager_fnFillContents(this.RightList,teamstats_listbox_contentsR,teamstats_listbox_layoutR)			
		elseif(this.CurButton == "_sortKillsL" or this.CurButton == "_sortKillsR") then
			ScriptCB_SndPlaySound("shell_select_change")
			ScriptCB_SetTeamStatsSortMode(0);
			ifs_teamstats_fnFillContents(this,1);
		elseif(this.CurButton == "_sortDeathsL" or this.CurButton == "_sortDeathsR") then
			ScriptCB_SndPlaySound("shell_select_change");
			ScriptCB_SetTeamStatsSortMode(1);
			ifs_teamstats_fnFillContents(this,1);
		elseif(this.CurButton == "_sortCppL" or this.CurButton == "_sortCppR") then
			ScriptCB_SndPlaySound("shell_select_change");
			ScriptCB_SetTeamStatsSortMode(2);
			ifs_teamstats_fnFillContents(this,1);
		elseif(this.CurButton == "_sortNameL" or this.CurButton == "_sortNameR") then
			ScriptCB_SndPlaySound("shell_select_change");
			ScriptCB_SetTeamStatsSortMode(3);
			ifs_teamstats_fnFillContents(this,1);
		end
		
	end,

	--Back button quits stats
	Input_Back = function(this)
		this.fCurIdleTime = this.fMAX_IDLE_TIME 
		if(not gE3StatsTimeout or gE3StatsTimeout < 0) then
			ScriptCB_QuitFromStats()
			ScriptCB_SndPlaySound("shell_menu_exit");
		end
	end,

	-- No U/D/L/R functionality possible on this screen (gotta have stubs
	-- here, or the base class will override)

	Input_GeneralUp = function(this)
		ifs_teamstats_fnNav(ListManager_fnNavUp)		
	end,
	Input_GeneralDown = function(this)
		ifs_teamstats_fnNav(ListManager_fnNavDown)
	end,

	Input_LTrigger = function(this)
		ifs_teamstats_fnNav(ListManager_fnPageUp)
	end,
	Input_RTrigger = function(this)
		ifs_teamstats_fnNav(ListManager_fnPageDown)
	end,

	Input_GeneralLeft = function(this)
		this.fCurIdleTime = this.fMAX_IDLE_TIME 
		ifs_teamstats_fnFlipLeftRight(this)
		ScriptCB_SndPlaySound("shell_select_change");
	end,
	Input_GeneralRight = function(this)
		this.fCurIdleTime = this.fMAX_IDLE_TIME 
		ifs_teamstats_fnFlipLeftRight(this)
		ScriptCB_SndPlaySound("shell_select_change");
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
				IFObj_fnSetVis(this.quit, 1) -- show quit button
				gE3StatsTimeout = 0 -- allow quit now
			else
				IFObj_fnSetVis(this.quit, nil) -- hidden
				gE3StatsTimeout = 1 -- keep clients from leaving
			end
		end
			
		if(gE3StatsTimeout) then
			gE3StatsTimeout = gE3StatsTimeout - fDt
		end

 		-- if the models are done animating, slow down the rotations
 		if(this.IconModelFastMode and not this.LeftModel.bAnimActive) then
 			this.IconModelFastMode = nil
			ScriptCB_IFModel_SetOmegaY(this.LeftModel.cpointer,0.3)
			ScriptCB_IFModel_SetOmegaY(this.RightModel.cpointer,0.25)
		end
		
		if(gPlatformStr == "PC") then
			if( gMouseListBox ) then
				if(ScriptCB_CheckMouseMark()) then
					if( gMouseListBox == this.LeftList ) then
						this.bCursorOnLeft = 1
						if( teamstats_listbox_layoutL.CursorIdx == teamstats_listbox_layoutL.SelectedIdx) then
							teamstats_listbox_layoutR.SelectedIdx = nil
						end
					else
						this.bCursorOnLeft = nil
						if( teamstats_listbox_layoutR.CursorIdx == teamstats_listbox_layoutR.SelectedIdx) then
							teamstats_listbox_layoutL.SelectedIdx = nil
						end
					end
					this.RepaintListbox( this, this.bCursorOnLeft )
				end
				ScriptCB_SetMouseMark()
			end	
		end
		-- if we've been sitting here for a while, bail to the teaser screen
		this.fCurIdleTime = this.fCurIdleTime - fDt
		if((this.fCurIdleTime < 0) and (not gE3StatsTimeout or gE3StatsTimeout < 0)) then
			this.fCurIdleTime = 100
			ScriptCB_QuitFromStats()
			ScriptCB_SndPlaySound("shell_menu_exit");
		end
		
		-- update the visibility of the up/down arrows
		IFObj_fnSetVis(this.buttons.LeftUpArrow,teamstats_listbox_layoutL.FirstShownIdx > 1)
		IFObj_fnSetVis(this.buttons.RightUpArrow,teamstats_listbox_layoutL.FirstShownIdx > 1)

		local num = max(getn(teamstats_listbox_contentsL),getn(teamstats_listbox_contentsR))
		IFObj_fnSetVis(this.buttons.LeftDownArrow,teamstats_listbox_layoutL.FirstShownIdx+teamstats_listbox_layoutL.showcount <= num)
		IFObj_fnSetVis(this.buttons.RightDownArrow,teamstats_listbox_layoutL.FirstShownIdx+teamstats_listbox_layoutL.showcount <= num)
		
		-- animate the up/down arrows
		IFObj_UpdateBlinkyAnim(this.buttons.LeftUpArrow,ScriptCB_IFObj_TestHotSpot(this.buttons.LeftUpArrow.cpointer),0.4,1,0.4,0.2)
		IFObj_UpdateBlinkyAnim(this.buttons.RightUpArrow,ScriptCB_IFObj_TestHotSpot(this.buttons.RightUpArrow.cpointer),0.4,1,0.4,0.2)
		IFObj_UpdateBlinkyAnim(this.buttons.LeftDownArrow,ScriptCB_IFObj_TestHotSpot(this.buttons.LeftDownArrow.cpointer),0.4,1,0.4,0.2)
		IFObj_UpdateBlinkyAnim(this.buttons.RightDownArrow,ScriptCB_IFObj_TestHotSpot(this.buttons.RightDownArrow.cpointer),0.4,1,0.4,0.2)
		-- animate the stat sort icons	
		IFObj_UpdateBlinkyAnim(this.buttons.LeftColumnHeader1,ScriptCB_IFObj_TestHotSpot(this.buttons.LeftColumnHeader1.cpointer),0.4,1,0.4,0.2)
		IFObj_UpdateBlinkyAnim(this.buttons.LeftColumnHeader2,ScriptCB_IFObj_TestHotSpot(this.buttons.LeftColumnHeader2.cpointer),0.4,1,0.4,0.2)
		IFObj_UpdateBlinkyAnim(this.buttons.LeftColumnHeader3,ScriptCB_IFObj_TestHotSpot(this.buttons.LeftColumnHeader3.cpointer),0.4,1,0.4,0.2)
		IFObj_UpdateBlinkyAnim(this.buttons.RightColumnHeader1,ScriptCB_IFObj_TestHotSpot(this.buttons.RightColumnHeader1.cpointer),0.4,1,0.4,0.2)
		IFObj_UpdateBlinkyAnim(this.buttons.RightColumnHeader2,ScriptCB_IFObj_TestHotSpot(this.buttons.RightColumnHeader2.cpointer),0.4,1,0.4,0.2)
		IFObj_UpdateBlinkyAnim(this.buttons.RightColumnHeader3,ScriptCB_IFObj_TestHotSpot(this.buttons.RightColumnHeader3.cpointer),0.4,1,0.4,0.2)
			
 	end,


	-- Callback (from C++) to repaint the listbox with the current contents
	-- in the global teamstats_listbox_contents
	RepaintListbox = function(this, bOnLeft)	
  		if( bOnLeft ) then
			teamstats_listbox_layoutR.CursorIdx = nil
		else
			teamstats_listbox_layoutL.CursorIdx = nil
		end
		ListManager_fnFillContents(this.LeftList,teamstats_listbox_contentsL,teamstats_listbox_layoutL)
		ListManager_fnFillContents(this.RightList,teamstats_listbox_contentsR,teamstats_listbox_layoutR)
		
--		print(teamstats_listbox_layoutR.SelectedIdx, teamstats_listbox_layoutL.SelectedIdx)
	 end,	

}

-- Helper function, sets up parts of this screen that need any
-- programmatic work (i.e. scaling to screensize)
function ifs_teamstats_fnBuildScreen(this)
	-- Ask game for screen size, fill in values
	local r, b, v, widescreen = ScriptCB_GetScreenInfo()
	this.bgTexture.localpos_l = 0
	this.bgTexture.localpos_t = 0
	this.bgTexture.localpos_r = r*widescreen
	this.bgTexture.localpos_b = b
	this.bgTexture.uvs_b = v

--	if(this.Helptext_Back) then
--		IFText_fnSetString(this.Helptext_Back.helpstr,"ifs.stats.done")
--	end
--	if(this.Helptext_Accept) then
--		IFText_fnSetString(this.Helptext_Accept.helpstr,"ifs.stats.details")
--	end

	-- Inset slightly from fulls screen size
	local fw,fh = ScriptCB_GetScreenInfo()
	local w,h = ScriptCB_GetSafeScreenInfo()
	h = h * 0.82

	this.listbox = NewButtonWindow { ZPos = 200, x=0, y = 0,
		ScreenRelativeX = 0.5, -- center
		ScreenRelativeY = 0.48, -- middle of screen
		width = w,
		height = h,
		noEnterAnimation = 1,
	}
	
	--details button is bottom center of the listbox
	this.details.btn.y = h*0.485 + 4

	-- Cut width in half for 2-column layout, make containers to drop them into
	w = w * 0.5
	this.LeftList = NewIFContainer {
		ScreenRelativeX = 0.5,
		ScreenRelativeY = 0.53,
		x =-w * 0.5
	}
	this.RightList = NewIFContainer {
		ScreenRelativeX = 0.5,
		ScreenRelativeY = 0.53,
		x = w * 0.5
	}
	
	local iconWidth = 30
	local iconHeight = 30
	local pos1 = w * 0.20 - iconWidth/2
	local pos2 = w * 0.32 - iconWidth/2
	local pos3 = w * 0.44 - iconWidth/2
	local ypos = -h/2
	
	this.LeftList.Title = NewIFText {
		string = "TITLE: 30",
		font = "gamefont_medium",
		flashy = 0,
		textw = w * 0.5,
		texth = iconHeight,
		halign = "left",
		x = -w/2 + 15,
		y = ypos,
	}		
	this.LeftModel = NewIFModel {
		ScreenRelativeX = 0.25,
		ScreenRelativeY = 0.5,
		x=0,y=0,scale = 1,
		OmegaY = 0.3,
		lighting = 1,
	}

	this.RightList.Title = NewIFText {
		string = "TITLE: 30",
		font = "gamefont_medium",
		flashy = 0,
		textw = w * 0.5,
		texth = iconHeight,
		halign = "left",
		x = -w/2 + 15,
		y = ypos,
	}		
	this.RightModel = NewIFModel {
		ScreenRelativeX = 0.75,
		ScreenRelativeY = 0.5,
		x=0,y=0,scale = 1,
		OmegaY = 0.25,
		lighting = 1,
	}

	teamstats_listbox_layoutL.width = w - 20
	teamstats_listbox_layoutR.width = w - 20
	local listh = h * 0.85
	teamstats_listbox_layoutL.showcount = floor(listh / (teamstats_listbox_layoutL.yHeight + teamstats_listbox_layoutL.ySpacing)) - 1
	teamstats_listbox_layoutR.showcount = teamstats_listbox_layoutL.showcount

	ListManager_fnInitList(ifs_teamstats.LeftList,teamstats_listbox_layoutL)
	ListManager_fnInitList(ifs_teamstats.RightList,teamstats_listbox_layoutR)
	

	this.buttons = NewIFContainer {
		ScreenRelativeX = 0.5,
		ScreenRelativeY = 0.5,
	}	
	-- make the up and down arrows
	local arrowsize = 30
	this.buttons.LeftUpArrow = NewIFImage 
	{
 		ZPos = 0, 
 		x = -w*0.5, 
 		y = -h/2 + arrowsize*2.5 - 10,
 		inertUVs = 1,alpha = 180,
 		localpos_l = -arrowsize/2, localpos_t = -arrowsize/2,
 		localpos_r =  arrowsize/2, localpos_b =  arrowsize/2, 		
		texture = "small_arrow",
		AutoHotspot = "_upL",
		uvs_diag = 1,
 	}
	this.buttons.RightUpArrow = NewIFImage 
	{
 		ZPos = 0, 
 		x = w*0.5, 
 		y = -h/2 + arrowsize*2.5 - 10,
 		inertUVs = 1,alpha = 180,
 		localpos_l = -arrowsize/2, localpos_t = -arrowsize/2,
 		localpos_r =  arrowsize/2, localpos_b =  arrowsize/2, 		
		texture = "small_arrow",
		AutoHotspot = "_upR",
		uvs_diag = 1,
 	}
	this.buttons.LeftDownArrow = NewIFImage 
	{
 		ZPos = 0, 
 		x = -w*0.5, 
 		y = h/2 - arrowsize*1.5 + 15,
 		inertUVs = 1,alpha = 180,
 		localpos_l = -arrowsize/2, localpos_t =  arrowsize/2,
 		localpos_r =  arrowsize/2, localpos_b = -arrowsize/2, 		
		texture = "small_arrow",
		AutoHotspot = "_downL",
		uvs_diag = 1,
 	}
	this.buttons.RightDownArrow = NewIFImage 
	{
 		ZPos = 0, 
 		x = w*0.5, 
 		y = h/2 - arrowsize*1.5 + 15,
 		inertUVs = 1,alpha = 180,
 		localpos_l = -arrowsize/2, localpos_t =  arrowsize/2,
 		localpos_r =  arrowsize/2, localpos_b = -arrowsize/2, 		
		texture = "small_arrow",
		AutoHotspot = "_downR",
		uvs_diag = 1,
 	}
	
	this.buttons.LeftColumnHeader1 = NewIFImage {
		x = pos1 - w/2, y = ypos + fh*0.03,
		texture = "stats_kills", -- .tga assumed
		localpos_r = iconWidth, localpos_b = iconHeight,
		AutoHotspot = "_sortKillsL",
	}
	this.buttons.LeftColumnHeader2 = NewIFImage {
		x = pos2 - w/2, y = ypos + fh*0.03,
		texture = "stats_deaths", -- .tga assumed
		localpos_r = iconWidth, localpos_b = iconHeight,
		AutoHotspot = "_sortDeathsL",
	}
	this.buttons.LeftColumnHeader3 = NewIFImage {
		x = pos3 - w/2, y = ypos + fh*0.03,
		texture = "stats_cpp", -- .tga assumed
		localpos_r = iconWidth, localpos_b = iconHeight,
		AutoHotspot = "_sortCppL",
	}

	this.buttons.RightColumnHeader1 = NewIFImage {
		x = pos1 + w/2, y = ypos + fh*0.03,
		texture = "stats_kills", -- .tga assumed
		localpos_r = iconWidth, localpos_b = iconHeight,
		AutoHotspot = "_sortKillsR",
	}
	this.buttons.RightColumnHeader2 = NewIFImage {
		x = pos2 + w/2, y = ypos + fh*0.03,
		texture = "stats_deaths", -- .tga assumed
		localpos_r = iconWidth, localpos_b = iconHeight,
		AutoHotspot = "_sortDeathsR",
	}
	this.buttons.RightColumnHeader3 = NewIFImage {
		x = pos3 + w/2, y = ypos + fh*0.03,
		texture = "stats_cpp", -- .tga assumed
		localpos_r = iconWidth, localpos_b = iconHeight,
		AutoHotspot = "_sortCppR",
	}
	
end


ifs_teamstats_fnBuildScreen(ifs_teamstats) -- programatic chunks
ifs_teamstats_fnBuildScreen = nil

AddIFScreen(ifs_teamstats,"ifs_teamstats")
