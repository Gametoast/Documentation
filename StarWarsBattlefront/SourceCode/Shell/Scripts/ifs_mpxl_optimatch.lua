-- Generalized mission select screen. Done to unify the varions
-- screens 

ifs_mpxl_optimatch_vbutton_layout = {
--	yTop = 40, -- auto-calc'd now to be centered vertically
	ySpacing  = 5,
--	width = 350, 	-- Calculated below as a % of screen size
	font = "gamefont_medium",
	buttonlist = { 
		{ tag = "players", string2 = "ifs.mp.createopts.maxplayers", },
		{ tag = "bots", string2 = "ifs.mp.createopts.numbots", },
		{ tag = "teamdmg", string2 = "ifs.mp.createopts.teamdamage", },
		{ tag = "autoaim", string2 = "ifs.mp.createopts.autoaim", },
		{ tag = "shownames", string2 = "ifs.mp.createopts.shownames", },
		{ tag = "hero", string2 = "ifs.mp.createopts.heroes", },
		{ tag = "autoassign", string2 = "ifs.mp.createopts.autoassign_on", },
		{ tag = "difficulty", string2 = "ifs.difficulty.title", },
		{ tag = "dedicated", string2 = "ifs.mp.createopts.dedicated" },
		{ tag = "era", string2 = "ifs.mp.optimatch.era" },
	},
	title = "ifs.mp.optimatch.title",
	rotY = 40,
}

-- snip, gOptiOpts


-- Sets the the text for the options.
function ifs_mpxl_optimatch_fnSetOptionText(this)
	
	-- Get some common varbs

	local NewUStr = ""
	local TempUStr
	local OnUStr = ScriptCB_getlocalizestr("common.on")
	local OffUStr = ScriptCB_getlocalizestr("common.off")
	local AnyUStr = ScriptCB_getlocalizestr("ifs.mp.optimatch.any")

	if(gOptiOpts.iNumPlayers >= 0) then
		TempUStr = ScriptCB_tounicode(format("%d",gOptiOpts.iNumPlayers))
	else
		TempUStr = AnyUStr
	end
	NewUStr = ScriptCB_usprintf("ifs.mp.createopts.maxplayers",TempUStr)
	RoundIFButtonLabel_fnSetUString(this.buttons.players,NewUStr)

	if(gOptiOpts.iNumBots >= 0) then
		TempUStr = ScriptCB_tounicode(format("%d",gOptiOpts.iNumBots))
	else
		TempUStr = AnyUStr
	end
	NewUStr = ScriptCB_usprintf("ifs.mp.createopts.numbots",TempUStr)
	RoundIFButtonLabel_fnSetUString(this.buttons.bots,NewUStr)

 	if(gOptiOpts.iTeamDmg < 0) then
		NewUStr = ScriptCB_usprintf("ifs.mp.createopts.teamdamage",AnyUStr)
	elseif (gOptiOpts.iTeamDmg < 1) then
		NewUStr = ScriptCB_usprintf("ifs.mp.createopts.teamdamage",OffUStr)
	else
		NewUStr = ScriptCB_usprintf("ifs.mp.createopts.teamdamage",OnUStr)
	end
	RoundIFButtonLabel_fnSetUString(this.buttons.teamdmg,NewUStr)

 	if(gOptiOpts.iAutoAim < 0) then
		NewUStr = ScriptCB_usprintf("ifs.mp.createopts.autoaim",AnyUStr)
	elseif (gOptiOpts.iAutoAim < 1) then
		NewUStr = ScriptCB_usprintf("ifs.mp.createopts.autoaim",OffUStr)
	else
		NewUStr = ScriptCB_usprintf("ifs.mp.createopts.autoaim",OnUStr)
	end
	RoundIFButtonLabel_fnSetUString(this.buttons.autoaim,NewUStr)

	if(gOptiOpts.iShowNames < 0) then
		NewUStr = ScriptCB_usprintf("ifs.mp.createopts.shownames",AnyUStr)
	elseif (gOptiOpts.iShowNames < 1) then
		NewUStr = ScriptCB_usprintf("ifs.mp.createopts.shownames",OffUStr)
	else
		NewUStr = ScriptCB_usprintf("ifs.mp.createopts.shownames",OnUStr)
	end
	RoundIFButtonLabel_fnSetUString(this.buttons.shownames,NewUStr)

 	if(gOptiOpts.iHeroesEnabled < 0) then
		NewUStr = ScriptCB_usprintf("ifs.mp.optimatch.heroes",AnyUStr)
	elseif (gOptiOpts.iHeroesEnabled < 1) then
		NewUStr = ScriptCB_usprintf("ifs.mp.optimatch.heroes",OffUStr)
	else
		NewUStr = ScriptCB_usprintf("ifs.mp.optimatch.heroes",OnUStr)
	end
	RoundIFButtonLabel_fnSetUString(this.buttons.hero,NewUStr)

	if(gOptiOpts.iAutoAssignTeams < 0) then
		RoundIFButtonLabel_fnSetString(this.buttons.autoassign,"ifs.mp.optimatch.autoassign_any")
	elseif (gOptiOpts.iAutoAssignTeams < 1) then
		RoundIFButtonLabel_fnSetString(this.buttons.autoassign,"ifs.mp.createopts.autoassign_off")
	else
		RoundIFButtonLabel_fnSetString(this.buttons.autoassign,"ifs.mp.createopts.autoassign_on")
	end

	if(gOptiOpts.iDedicated < 0) then
		NewUStr = ScriptCB_usprintf("ifs.mp.createopts.dedicated",AnyUStr)
	elseif (gOptiOpts.iDedicated < 1) then
		NewUStr = ScriptCB_usprintf("ifs.mp.createopts.dedicated",OffUStr)
	else
		NewUStr = ScriptCB_usprintf("ifs.mp.createopts.dedicated",OnUStr)
	end
	RoundIFButtonLabel_fnSetUString(this.buttons.dedicated,NewUStr)

	if(gOptiOpts.iDifficulty < 0) then
		NewUStr = ScriptCB_usprintf("ifs.mp.createopts.difficulty",AnyUStr)
	elseif (gOptiOpts.iDifficulty==1) then
		NewUStr = ScriptCB_usprintf("ifs.mp.createopts.difficulty",ScriptCB_getlocalizestr("ifs.difficulty.easy"))
	elseif (gOptiOpts.iDifficulty==2) then
		NewUStr = ScriptCB_usprintf("ifs.mp.createopts.difficulty",ScriptCB_getlocalizestr("ifs.difficulty.medium"))
	else
		NewUStr = ScriptCB_usprintf("ifs.mp.createopts.difficulty",ScriptCB_getlocalizestr("ifs.difficulty.hard"))
	end
	RoundIFButtonLabel_fnSetUString(this.buttons.difficulty,NewUStr)

	-- snip
	if(gOptiOpts.iEra < 0) then
		NewUStr = ScriptCB_usprintf("ifs.mp.optimatch.era",AnyUStr)
	elseif (gOptiOpts.iEra==0) then
		NewUStr = ScriptCB_usprintf("ifs.mp.optimatch.era",ScriptCB_getlocalizestr("common.era.cw"))
	elseif (gOptiOpts.iEra==1) then
		NewUStr = ScriptCB_usprintf("ifs.mp.optimatch.era",ScriptCB_getlocalizestr("common.era.gcw"))
	else
		NewUStr = ScriptCB_usprintf("ifs.mp.optimatch.era",ScriptCB_getlocalizestr("ifs.mp.optimatch.both"))
	end
	RoundIFButtonLabel_fnSetUString(this.buttons.era,NewUStr)
end

-- Moves a tri-stated value one position left (in -1, 0, Max). Returns
-- the new value.
function ifs_mpxl_optimatch_fnTriValLeft(Cur,Max)
	local New
	if(Cur > 0) then
		New = 0
	elseif (Cur == 0) then
		New = -1
	else
		New = Max
	end

	return New
end

-- Moves a tri-stated value one position left (in -1, 0, Max). Returns
-- the new value.
function ifs_mpxl_optimatch_fnTriValRight(Cur,Max)
	local New
	if(Cur == -1) then
		New = 0
	elseif (Cur == 0) then
		New = Max
	else
		New = -1
	end

	return New
end


ifs_mpxl_optimatch = NewIFShellScreen {
	nologo = 1,
	bg_texture = "iface_bgmeta_space",
	movieIntro      = nil,
	movieBackground = nil,
	
	-- auto launch game server
	bAutoLaunch = nil,
	

--	title = NewIFText {
--		string = "ifs.mp.createopts.title",
--		font = "gamefont_large",
--		textw = 460,
--		y = 0,
--		ScreenRelativeX = 0.5, -- center
--		ScreenRelativeY = 0, -- top
--	},

	buttons = NewIFContainer {
		ScreenRelativeX = 0.7, -- right column onscreen
		ScreenRelativeY = 0.5,
		y = 20,
	},

	fnDone = nil, -- Callback function to do something when the user is done
	-- Sub-mode for full/era switch is on.
	bMapMode = nil,
	iMaxPlayers = 32,
	
	Enter = function(this, bFwd)
		gIFShellScreenTemplate_fnEnter(this, bFwd) -- call base class

		ifs_mpxl_optimatch.bAutoLaunch = nil
		
		-- Added chunk for error handling...
		if(not bFwd) then
			local ErrorLevel,ErrorMessage = ScriptCB_GetError()
			if(ErrorLevel >= 6) then -- session or login error, must keep going further
				ScriptCB_PopScreen()
			end
		end

		if(bFwd) then
			this.SelectedMap = nil -- clear this

			this.CurButton = ShowHideVerticalButtons(this.buttons,ifs_mpxl_optimatch_vbutton_layout)
			SetCurButton(this.CurButton)

			ScriptCB_XL_GetOptiOpts()

			-- Also read in max players & bots
			local Junk1, Junk2
			Junk1,this.iMaxPlayers,Junk2,this.iMaxBots = ScriptCB_GetNetGameDefaults()

			this.SelectedMap = nil -- clear this
		end
		ifs_mpxl_optimatch_fnSetOptionText(this)
	end,

	Exit = function(this, bFwd)
		if(not bFwd) then
			this.SelectedMap = nil -- clear this
		end
	end,

	Input_Accept = function(this)
		ScriptCB_SndPlaySound("shell_menu_enter")

		ScriptCB_XL_SetOptiOpts()
		ifs_movietrans_PushScreen(ifs_mp_sessionlist)
	end, -- end of Input_Accept

	Input_Back = function(this)
		ScriptCB_PopScreen()
	end,

	Input_GeneralUp = function(this)
		gDefault_Input_GeneralUp(this)
	end,

	Input_GeneralDown = function(this)
		gDefault_Input_GeneralDown(this)
	end,

	Input_LTrigger = function(this)
		if(this.CurButton == "players") then
			gOptiOpts.iNumPlayers = max(2,gOptiOpts.iNumPlayers - 10)
			ifelm_shellscreen_fnPlaySound(this.selectSound)
		elseif (this.CurButton == "bots") then
			gOptiOpts.iNumBots = max(0,gOptiOpts.iNumBots - 10)
			ifelm_shellscreen_fnPlaySound(this.selectSound)
		end
		ifs_mpxl_optimatch_fnSetOptionText(this)
	end,

	Input_RTrigger = function(this)
		if(this.CurButton == "players") then
			gOptiOpts.iNumPlayers = min(gOptiOpts.iNumPlayers+10,this.iMaxPlayers)
			ifelm_shellscreen_fnPlaySound(this.selectSound)
		elseif (this.CurButton == "bots") then
			gOptiOpts.iNumBots = min(gOptiOpts.iNumBots+10,this.iMaxBots)
			ifelm_shellscreen_fnPlaySound(this.selectSound)
		end
		ifs_mpxl_optimatch_fnSetOptionText(this)
	end,

	Input_GeneralLeft = function(this)
		if(this.CurButton == "players") then
			if(gOptiOpts.iNumPlayers > 2) then
				gOptiOpts.iNumPlayers = gOptiOpts.iNumPlayers - 1
			elseif (gOptiOpts.iNumPlayers > 0) then
				gOptiOpts.iNumPlayers = -1
			else
				gOptiOpts.iNumPlayers = this.iMaxPlayers
			end
		elseif (this.CurButton == "bots") then
			if(gOptiOpts.iNumBots > 0) then
				gOptiOpts.iNumBots = gOptiOpts.iNumBots -1
			elseif (gOptiOpts.iNumBots == 0) then
				gOptiOpts.iNumBots = -1
			else
				gOptiOpts.iNumBots = this.iMaxBots
			end
		elseif (this.CurButton == "teamdmg") then
			gOptiOpts.iTeamDmg = ifs_mpxl_optimatch_fnTriValLeft(gOptiOpts.iTeamDmg, 100)
		elseif (this.CurButton == "autoaim") then
			gOptiOpts.iAutoAim = ifs_mpxl_optimatch_fnTriValLeft(gOptiOpts.iAutoAim, 100)
		elseif (this.CurButton == "shownames") then
			gOptiOpts.iShowNames = ifs_mpxl_optimatch_fnTriValLeft(gOptiOpts.iShowNames, 1)
		elseif (this.CurButton == "hero") then
			gOptiOpts.iHeroesEnabled = ifs_mpxl_optimatch_fnTriValLeft(gOptiOpts.iHeroesEnabled, 1)
		elseif (this.CurButton == "autoassign") then
			gOptiOpts.iAutoAssignTeams = ifs_mpxl_optimatch_fnTriValLeft(gOptiOpts.iAutoAssignTeams, 1)
		elseif (this.CurButton == "dedicated") then
			gOptiOpts.iDedicated = ifs_mpxl_optimatch_fnTriValLeft(gOptiOpts.iDedicated, 1)
		elseif (this.CurButton == "era") then
			gOptiOpts.iEra = gOptiOpts.iEra - 1
			if(gOptiOpts.iEra < -1) then
				gOptiOpts.iEra = 2
			end
		elseif (this.CurButton == "difficulty") then
			gOptiOpts.iDifficulty = gOptiOpts.iDifficulty-1
			if(gOptiOpts.iDifficulty == 0) then
				gOptiOpts.iDifficulty = -1
			elseif (gOptiOpts.iDifficulty == -2) then
				gOptiOpts.iDifficulty = 3
			end
		end
		ifelm_shellscreen_fnPlaySound(this.selectSound)
		ifs_mpxl_optimatch_fnSetOptionText(this)
	end,

	Input_GeneralRight = function(this)
		if(this.CurButton == "players") then
			if(gOptiOpts.iNumPlayers < 0) then
				gOptiOpts.iNumPlayers = 2
			elseif (gOptiOpts.iNumPlayers == this.iMaxPlayers) then
				gOptiOpts.iNumPlayers = -1
			else
				gOptiOpts.iNumPlayers = gOptiOpts.iNumPlayers+1
			end
		elseif (this.CurButton == "bots") then
			if(gOptiOpts.iNumBots < this.iMaxBots) then
				gOptiOpts.iNumBots = gOptiOpts.iNumBots+1
			elseif (gOptiOpts.iNumBots == this.iMaxBots) then
				gOptiOpts.iNumBots = -1
			end
		elseif (this.CurButton == "teamdmg") then
			gOptiOpts.iTeamDmg = ifs_mpxl_optimatch_fnTriValRight(gOptiOpts.iTeamDmg, 100)
		elseif (this.CurButton == "autoaim") then
			gOptiOpts.iAutoAim = ifs_mpxl_optimatch_fnTriValRight(gOptiOpts.iAutoAim, 100)
		elseif (this.CurButton == "shownames") then
			gOptiOpts.iShowNames = ifs_mpxl_optimatch_fnTriValRight(gOptiOpts.iShowNames, 1)
		elseif (this.CurButton == "hero") then
			gOptiOpts.iHeroesEnabled = ifs_mpxl_optimatch_fnTriValRight(gOptiOpts.iHeroesEnabled, 1)
		elseif (this.CurButton == "autoassign") then
			gOptiOpts.iAutoAssignTeams = ifs_mpxl_optimatch_fnTriValRight(gOptiOpts.iAutoAssignTeams, 1)
		elseif (this.CurButton == "dedicated") then
			gOptiOpts.iDedicated = ifs_mpxl_optimatch_fnTriValRight(gOptiOpts.iDedicated, 1)
		elseif (this.CurButton == "era") then
			gOptiOpts.iEra = gOptiOpts.iEra + 1
			if(gOptiOpts.iEra > 2) then
				gOptiOpts.iEra = -1
			end
		elseif (this.CurButton == "difficulty") then
			gOptiOpts.iDifficulty = gOptiOpts.iDifficulty + 1
			if(gOptiOpts.iDifficulty > 3) then
				gOptiOpts.iDifficulty = -1
			elseif (gOptiOpts.iDifficulty == 0) then
				gOptiOpts.iDifficulty = 1
			end
		end
		ifelm_shellscreen_fnPlaySound(this.selectSound)
		ifs_mpxl_optimatch_fnSetOptionText(this)
	end,
}



-- Helper function, builds this screen.
function ifs_mpxl_optimatch_fnBuildScreen(this)
	local w,h = ScriptCB_GetSafeScreenInfo() -- of the usable screen

	if(ScriptCB_GetLanguage() ~= "english") then
		ifs_mpxl_optimatch_vbutton_layout.font = "gamefont_small"
	end

	ifs_mpxl_optimatch_vbutton_layout.width = w * 0.85
	this.CurButton = AddVerticalButtons(this.buttons,ifs_mpxl_optimatch_vbutton_layout)

end


ifs_mpxl_optimatch_fnBuildScreen(ifs_mpxl_optimatch)
ifs_mpxl_optimatch_fnBuildScreen = nil -- clear out of memory to save space
AddIFScreen(ifs_mpxl_optimatch,"ifs_mpxl_optimatch")
