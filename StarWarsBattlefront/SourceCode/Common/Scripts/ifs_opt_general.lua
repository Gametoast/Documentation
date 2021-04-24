-- Helper function, sets text of

function ifs_opt_general_fnUpdateStrings(this)

	-- Hacklet? If this is a huge string, then switch to a smaller font.
	local PerspStr
 	if(ScriptCB_IsFirstPersonView()) then
		PerspStr = "ifs.GameOpt.cam_cockpit"
 	else
		PerspStr = "ifs.GameOpt.cam_forward"
 	end
	IFText_fnSetFont(this.buttons.persp.label,"gamefont_medium")
	RoundIFButtonLabel_fnSetString(this.buttons.persp,PerspStr)
	if(ScriptCB_IFText_GetTextExtent(this.buttons.persp.label.cpointer) > 150) then
		IFText_fnSetFont(this.buttons.persp.label,"gamefont_small")
		RoundIFButtonLabel_fnSetString(this.buttons.persp,PerspStr)
	end

--	local SplitStr
--	if(ScriptCB_IsHorizontalSplitScreen()) then
--		SplitStr = "ifs.GameOpt.split_horizontal"
--	else
--		SplitStr = "ifs.GameOpt.split_vertical"
--	end
--	IFText_fnSetFont(this.buttons.split.label,"gamefont_medium")
--	RoundIFButtonLabel_fnSetString(this.buttons.split,SplitStr)
--	if(ScriptCB_IFText_GetTextExtent(this.buttons.split.label.cpointer) > 150) then
--		IFText_fnSetFont(this.buttons.split.label,"gamefont_small")
--		RoundIFButtonLabel_fnSetString(this.buttons.split,SplitStr)
--	end

 --	if(ScriptCB_IsRumbleOn()) then
 --		RoundIFButtonLabel_fnSetString(this.buttons.rumble,"common.yes")
 --	else
 --		RoundIFButtonLabel_fnSetString(this.buttons.rumble,"common.no")
 --	end

	local ff = ScriptCB_GetFriendlyFire();
	--RoundIFButtonLabel_fnSetUString(this.buttons.friendlyfire,ScriptCB_tounicode(format("%d",ff).."%%"))
 	if(ff<1) then
 		RoundIFButtonLabel_fnSetString(this.buttons.friendlyfire,"common.off")
 	else
 		RoundIFButtonLabel_fnSetString(this.buttons.friendlyfire,"common.on")
 	end

 --	if(ScriptCB_IsAutoAimOn()) then
 --		RoundIFButtonLabel_fnSetString(this.buttons.autoaim,"common.on")
 --	else
 --		RoundIFButtonLabel_fnSetString(this.buttons.autoaim,"common.off")
 --	end

 	if(ScriptCB_AreHeroesOn()) then
 		RoundIFButtonLabel_fnSetString(this.buttons.hero,"common.on")
 	else
 		RoundIFButtonLabel_fnSetString(this.buttons.hero,"common.off")
 	end

 	if(ScriptCB_GetDifficulty() == 1) then
 		RoundIFButtonLabel_fnSetString(this.buttons.diff,"ifs.difficulty.easy")
 	elseif(ScriptCB_GetDifficulty() == 2) then
 		RoundIFButtonLabel_fnSetString(this.buttons.diff,"ifs.difficulty.medium")
	else
 		RoundIFButtonLabel_fnSetString(this.buttons.diff,"ifs.difficulty.hard")
 	end
	
	if (gPlatformStr ~= "PC") then
		
		if(ScriptCB_IsToolTipOn()) then
			RoundIFButtonLabel_fnSetString(this.buttons.ttstate,"ifs.GameOpt.tt_on");
			IFObj_fnSetVis(this.buttons.ttreset,nil)
		elseif(ScriptCB_IsToolTipAuto()) then
			RoundIFButtonLabel_fnSetString(this.buttons.ttstate,"ifs.GameOpt.tt_auto");
			IFObj_fnSetVis(this.buttons.ttreset,1.0)
		else
			RoundIFButtonLabel_fnSetString(this.buttons.ttstate,"ifs.GameOpt.tt_off");
			IFObj_fnSetVis(this.buttons.ttreset,nil)
		end

	end
	if(this.Helptext_Accept) then
		if(this.CurButton == "ttreset") then
			IFText_fnSetString(this.Helptext_Accept.helpstr,"common.select")
		else
			IFText_fnSetString(this.Helptext_Accept.helpstr,"common.change")
		end
		gIFShellScreenTemplate_fnMoveIcon(this.Helptext_Accept)
	end
end

ifs_opt_general = NewIFShellScreen {
	nologo = 1,
    movieIntro      = nil, -- played before the screen is displayed
    movieBackground = nil, -- played while the screen is displayed
	bNohelptext_backPC = 1,
	
	title = NewIFText {
		string = "ifs.GameOpt.title",
		font = "gamefont_large",
		y = 10,
		textw = 460, -- center on screen. Fixme: do real centering!
		ScreenRelativeX = 0.5, -- center
		ScreenRelativeY = 0, -- top
		inert = 1, -- delete out of Lua mem when pushed to C
		nocreatebackground = 1,
	},

	-- When entering this screen, check if we need to save (triggered
	-- by a subscreen or something). If so, start that process.
	Enter = function(this, bFwd)
		this.bResetProfile = nil --default to not resetting the profile
		ScriptCB_MarkCurrentProfile()
		
		
		gIFShellScreenTemplate_fnEnter(this, bFwd) -- call default enter function
		AnimationMgr_AddAnimation(this.buttonlabels, {fStartAlpha = 0, fEndAlpha = 1,})
		ifs_opt_general_fnUpdateStrings(this)
		
		-- For foreign languages, 'reset tooltips' may need a switch to a
		-- smaller font
		IFText_fnSetFont(this.buttons.ttreset.label,"gamefont_medium")
		RoundIFButtonLabel_fnSetString(this.buttons.ttreset,"ifs.gameopt.ttreset")
		if(ScriptCB_IFText_GetTextExtent(this.buttons.ttreset.label.cpointer) > 200) then
			IFText_fnSetFont(this.buttons.ttreset.label,"gamefont_small")
			RoundIFButtonLabel_fnSetString(this.buttons.ttreset,"ifs.gameopt.ttreset")
		end
		
		-- if we're in the game, hide the "hero" option, since we can't change that mid game
		this.buttonlabels.hero.hidden = not ScriptCB_GetShellActive() or gDemoBuild
		this.buttons.hero.hidden = not ScriptCB_GetShellActive() or gDemoBuild
		this.buttonlabels.friendlyfire.hidden = not ScriptCB_GetShellActive() or gDemoBuild
		this.buttons.friendlyfire.hidden = not ScriptCB_GetShellActive() or gDemoBuild	
--		this.buttonlabels.split.hidden = not (ScriptCB_GetPlatform() == "XBox") or not ScriptCB_GetShellActive() or gDemoBuild
--		this.buttons.split.hidden = not (ScriptCB_GetPlatform() == "XBox") or not ScriptCB_GetShellActive() or gDemoBuild
			
		this.buttonlabels.ttstate.hidden = 1
		this.buttons.ttreset.hidden = 1
		-- hide autoaim in MP
	--	this.buttonlabels.autoaim.hidden = ScriptCB_IsNetworkOn()
	--	this.buttons.autoaim.hidden = ScriptCB_IsNetworkOn()
		

	
		ShowHideVerticalText(this.buttonlabels,ifs_opt_general_vbutton_layout)
		ShowHideVerticalButtons(this.buttons,ifs_opt_general_vbutton_layout)	
		
		local k,v
		for k,v in ifs_opt_general_vbutton_layout.buttonlist do
			local Tag = v.tag
			IFObj_fnSetPos(this.buttonlabels[Tag],0,nil) -- x=0, y=<current>
		end

--		this.buttonlabels.rumble.hidden = (ScriptCB_GetPlatform() == "PC")
--		this.buttons.autoaim.hidden = 1 --(ScriptCB_GetPlatform() == "PC")
		
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
		--if(gShellScreen_fnDefaultInputAccept(this)) then
		--	return
		--end

		ifelm_shellscreen_fnPlaySound(this.acceptSound);
		if(this.CurButton == "persp") then
			ScriptCB_SetFirstPersonView(not ScriptCB_IsFirstPersonView())
--		elseif (this.CurButton == "split") then
--			ScriptCB_SetHorizontalSplitScreen(not ScriptCB_IsHorizontalSplitScreen())
--		elseif (this.CurButton == "rumble") then
--			ScriptCB_SetRumbleOn(not ScriptCB_IsRumbleOn())
		elseif (this.CurButton == "friendlyfire") then
			--ScriptCB_SetFriendlyFire(min(250,ScriptCB_GetFriendlyFire()+10))
			ScriptCB_SetFriendlyFire(100 - ScriptCB_GetFriendlyFire())
		elseif (this.CurButton == "autoaim") then
			ScriptCB_SetAutoAimOn(not ScriptCB_IsAutoAimOn())
		elseif (this.CurButton == "hero") then
			ScriptCB_SetHeroesOn(not ScriptCB_AreHeroesOn())
		elseif (this.CurButton == "diff") then
			ScriptCB_SetDifficulty(mod(ScriptCB_GetDifficulty(),3)+1)
		elseif (this.CurButton == "ttstate") then
			ScriptCB_NextToolTipState();
		elseif (this.CurButton == "ttreset") then
			ScriptCB_ResetToolTips();
		elseif (this.CurButton == "reset") then
			ScriptCB_ResetGameOptionsToDefault();
 		elseif (this.CurButton == "_back") then
 			this.bResetProfile = 1
 			this:Input_Back(1)
 		elseif (this.CurButton == "_ok") then
 			this:Input_Back(1)
 		end
		ifs_opt_general_fnUpdateStrings(this)
	end,

	Input_GeneralLeft = function(this)
		if(this.CurButton == "persp") then
			ScriptCB_SetFirstPersonView(not ScriptCB_IsFirstPersonView())
--		elseif (this.CurButton == "split") then
--			ScriptCB_SetHorizontalSplitScreen(not ScriptCB_IsHorizontalSplitScreen())
--		elseif (this.CurButton == "rumble") then
--			ScriptCB_SetRumbleOn(not ScriptCB_IsRumbleOn())
		elseif (this.CurButton == "friendlyfire") then
			--ScriptCB_SetFriendlyFire(max(0,ScriptCB_GetFriendlyFire()-10))
			ScriptCB_SetFriendlyFire(100-ScriptCB_GetFriendlyFire())
		elseif (this.CurButton == "autoaim") then
			ScriptCB_SetAutoAimOn(not ScriptCB_IsAutoAimOn())
		elseif (this.CurButton == "hero") then
			ScriptCB_SetHeroesOn(not ScriptCB_AreHeroesOn())
		elseif (this.CurButton == "diff") then
			ScriptCB_SetDifficulty(mod(ScriptCB_GetDifficulty()+1,3)+1)
		elseif (this.CurButton == "ttstate") then
			ScriptCB_PrevToolTipState();
		end
		ifs_opt_general_fnUpdateStrings(this)
		
		if (not (this.CurButton == "ttreset" or 
		         this.CurButton == "back")) then
            ifelm_shellscreen_fnPlaySound(this.acceptSound)
		end
	end,

	Input_Back = function(this)
		ScriptCB_PopScreen()
	end,

	Input_GeneralRight = function(this)
		if(this.CurButton == "persp") then
			ScriptCB_SetFirstPersonView(not ScriptCB_IsFirstPersonView())
--		elseif (this.CurButton == "split") then
--			ScriptCB_SetHorizontalSplitScreen(not ScriptCB_IsHorizontalSplitScreen())
--		elseif (this.CurButton == "rumble") then
--			ScriptCB_SetRumbleOn(not ScriptCB_IsRumbleOn())
		elseif (this.CurButton == "friendlyfire") then
			--ScriptCB_SetFriendlyFire(min(250,ScriptCB_GetFriendlyFire()+10))
			ScriptCB_SetFriendlyFire(100-ScriptCB_GetFriendlyFire())
		elseif (this.CurButton == "autoaim") then
			ScriptCB_SetAutoAimOn(not ScriptCB_IsAutoAimOn())
		elseif (this.CurButton == "hero") then
			ScriptCB_SetHeroesOn(not ScriptCB_AreHeroesOn())
		elseif (this.CurButton == "diff") then
			ScriptCB_SetDifficulty(mod(ScriptCB_GetDifficulty(),3)+1)
		elseif (this.CurButton == "ttstate") then
			ScriptCB_NextToolTipState();
		end
		ifs_opt_general_fnUpdateStrings(this)
		
		if (not (this.CurButton == "ttreset" or 
		         this.CurButton == "back")) then
            ifelm_shellscreen_fnPlaySound(this.acceptSound)
		end
	end,

	Input_GeneralUp = function(this)
		-- If base class handled this work, then we're done
		if(gShellScreen_fnDefaultInputUp(this)) then
			return
		end

		gDefault_Input_GeneralUp(this)
		ifs_opt_general_fnUpdateStrings(this)
	end,

	Input_GeneralDown = function(this)
		-- If base class handled this work, then we're done
		if(gShellScreen_fnDefaultInputDown(this)) then
			return
		end

		gDefault_Input_GeneralDown(this)
		ifs_opt_general_fnUpdateStrings(this)
	end,
}

ifs_opt_general_vbutton_layout = {
	yTop = 150,

	yHeight = 35,
	ySpacing  = 5, --3, --if we uncomment the split screen option
	width = 350,
	font = "gamefont_medium",
	LeftJustify = 1,
	RightJustifyT = 1,
	flashy = 0,
	buttonlist = {
		-- Title is for the left column, string the option (filled in by code later)
		{ tag = "persp", title = "ifs.gameopt.camera", string = "", },
--		{ tag = "split", title = "ifs.gameopt.splitscreen", string = "", },
--		{ tag = "rumble", title = "ifs.gameopt.rumble", string = "" },
		{ tag = "friendlyfire", title = "ifs.gameopt.friendlyfire", string = "" },
--		{ tag = "autoaim", title = "ifs.gameopt.autoaim", string = "" },
		{ tag = "hero", title = "ifs.gameopt.hero", string = "" },
		{ tag = "diff", title = "ifs.gameopt.diff", string = "" },
		{ tag = "ttstate", title = "ifs.gameopt.ttstate", string = "" },
		{ tag = "ttreset", title = "", string = "ifs.gameopt.ttreset" },
		{ tag = "reset", title = "", string = "common.reset" },
--		{ tag = "side_header", title = "ifs.meta.options.side_header", string = "ifs.meta.options.side_title", yAdd = -20},
--		{ tag = "side_text", title = "ifs.meta.options.side_text", string = "ifs.meta.options.side_text", },
--		{ tag = "back", title = "", string = "common.accept", width = 200},
	},
	nocreatebackground = 1,
}

function ifs_opt_general_fnBuildScreen(this)
	local w
	local h
	w,h = ScriptCB_GetSafeScreenInfo()
	
	if((ScriptCB_GetLanguage() ~= "english") and (gPlatformStr ~= "PC")) then
		ifs_opt_general_vbutton_layout.font = "gamefont_small"
	end

	this.buttonlabels = NewIFContainer {
		ScreenRelativeX = 0.5,
		ScreenRelativeY = 0,
		x = -ifs_opt_general_vbutton_layout.width - 15,
	}

	this.buttons = NewIFContainer {
		ScreenRelativeX = 0.5,
		ScreenRelativeY = 0,
		x = 15,
	}


	AddVerticalText(this.buttonlabels,ifs_opt_general_vbutton_layout)
	this.CurButton = AddVerticalButtons(this.buttons,ifs_opt_general_vbutton_layout)
--	this.buttons.ttreset.label.textw = 330
--	this.buttons.ttreset.label.x = this.buttons.ttreset.label.x - (this.buttons.ttreset.label.textw - ifs_opt_general_vbutton_layout.width)
	
	
	this.Background = NewIFImage 
	{
 			ZPos = 255, 
 			x = w/2,  --centered on the x
 			y = h/2, -- inertUVs = 1,
 			alpha = 10,
 			localpos_l = -w/1.5, localpos_t = -h/1.5,
 			localpos_r = w/1.5, localpos_b =  h/1.5,
			texture = "opaque_black",
			ColorR = 20, ColorG = 20, ColorB = 150, -- blue
 	}
 	
 	local BackButtonW = 130 -- made 130 to fix 6198 on PC - NM 8/18/04
	local BackButtonH = 25
	this.donebutton =	NewIFContainer
	{
		ScreenRelativeX = 1.0, -- right
		ScreenRelativeY = 1.0, -- bottom
		y = -15, -- just above bottom
		x = -BackButtonW,
		btn = NewClickableIFButton -- NewRoundIFButton 
		{ 
			btnw = BackButtonW, 
			btnh = BackButtonH,
			font = "gamefont_medium", 
			bg_width = BackButtonW, 
			tag = "_ok",
			nocreatebackground=1,			
		}, -- end of btn
	}
	RoundIFButtonLabel_fnSetString(this.donebutton.btn,"common.accept")
	
	this.cancelbutton =	NewIFContainer
	{
		ScreenRelativeX = 0.0, -- right
		ScreenRelativeY = 1.0, -- bottom
		y = -15, -- just above bottom
		x = BackButtonW,
		btn = NewClickableIFButton -- NewRoundIFButton 
		{ 
			btnw = BackButtonW, 
			btnh = BackButtonH,
			font = "gamefont_medium", 
			bg_width = BackButtonW, 
			tag = "_back",
			nocreatebackground=1,
		}, -- end of btn
	}
	RoundIFButtonLabel_fnSetString(this.cancelbutton.btn,"common.cancel")
end

ifs_opt_general_fnBuildScreen(ifs_opt_general)
ifs_opt_general_fnBuildScreen = nil
AddIFScreen(ifs_opt_general,"ifs_opt_general")