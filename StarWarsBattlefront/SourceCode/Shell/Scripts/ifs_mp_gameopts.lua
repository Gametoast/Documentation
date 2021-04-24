-- Generalized mission select screen. Done to unify the varions
-- screens 

function ifs_mp_gameopts_fnSetupDefaults(this)

	-- Get defaults first time thru
--	if(not this.bGotDefaults) then
--		this.bGotDefaults = 1
		this.iNumPlayers,this.iMaxPlayers,this.iNumBots,this.iMaxBots,this.iTeamDmg,this.iAutoAim,this.bShowNames,this.bAutoAssignTeams,this.iStartCnt,this.bHeroesEnabled,this.iDifficulty,this.iMaxDedicatedPlayers,this.iMaxDedicatedBots = ScriptCB_GetNetGameDefaults()
		this.bIsPrivate = nil -- default: public
		this.bIsRankedGame = 1
		this.iRankMin = 200
		this.iRankMax = 2000
		this.EntryDedicated = this.bDedicated
		
		if(not this.bFirstTime) then
			this.bFirstTime = 1
			this.iNumPlayers = this.iMaxPlayers
			this.iNumBots = this.iMaxBots
		end
--	end
end

-- Sets up the screen for the Era mode, or not.
function ifs_mp_gameopts_fnSetMapMode(this,v)
	this.bMapMode = v

	IFObj_fnSetVis(this.buttons, not v)

	gCurHiliteListbox = nil -- cancel hilight in listbox
	gCurHiliteButton = this.buttons[this.CurButton]
end

-- Sets the the text for the options.
function ifs_mp_gameopts_fnSetOptionText(this)
	
	-- show/hide some buttons
	--this.buttons.startcnt.hidden = not this.bDedicated
	--ShowHideVerticalButtons(this.buttons,ifs_mp_gameopts_vbutton_layout)
	
	--set the text	
	local NewStr = ""
	local OnStr = ScriptCB_getlocalizestr("common.on")
	local OffStr = ScriptCB_getlocalizestr("common.off")

	NewStr = ScriptCB_usprintf("ifs.mp.createopts.maxplayers",
				ScriptCB_tounicode(format("%d",this.iNumPlayers)))
	RoundIFButtonLabel_fnSetUString(this.buttons.players,NewStr)

	NewStr = ScriptCB_usprintf("ifs.mp.createopts.numbots",
				ScriptCB_tounicode(format("%d",this.iNumBots)))
	RoundIFButtonLabel_fnSetUString(this.buttons.bots,NewStr)

	NewStr = ScriptCB_usprintf("ifs.mp.createopts.startcnt",
				ScriptCB_tounicode(format("%d",this.iStartCnt)))
	RoundIFButtonLabel_fnSetUString(this.buttons.startcnt,NewStr)

--	NewStr = ScriptCB_usprintf("ifs.mp.createopts.teamdamage",
--				ScriptCB_tounicode(format("%d",this.iTeamDmg)))
--	RoundIFButtonLabel_fnSetUString(this.buttons.teamdmg,NewStr)
 	if(this.iTeamDmg < 1) then
		NewStr = ScriptCB_usprintf("ifs.mp.createopts.teamdamage",OffStr)
	else
		NewStr = ScriptCB_usprintf("ifs.mp.createopts.teamdamage",OnStr)
	end
	RoundIFButtonLabel_fnSetUString(this.buttons.teamdmg,NewStr)

--	NewStr = ScriptCB_usprintf("ifs.mp.createopts.autoaim",
--				ScriptCB_tounicode(format("%d",this.iAutoAim)))
--	RoundIFButtonLabel_fnSetUString(this.buttons.autoaim,NewStr)
 	if(this.iAutoAim < 1) then
		NewStr = ScriptCB_usprintf("ifs.mp.createopts.autoaim",OffStr)
	else
		NewStr = ScriptCB_usprintf("ifs.mp.createopts.autoaim",OnStr)
	end
	RoundIFButtonLabel_fnSetUString(this.buttons.autoaim,NewStr)
 
 	if(this.bIsPrivate) then
		RoundIFButtonLabel_fnSetString(this.buttons.pubpriv,"ifs.mp.createopts.pubpriv_priv")
	else
		RoundIFButtonLabel_fnSetString(this.buttons.pubpriv,"ifs.mp.createopts.pubpriv_pub")
	end

--	if(this.PasswordStr) then
--		local i
--		local ShowStr = ""
--		for i=1,strlen(this.PasswordStr) do
--			ShowStr = ShowStr .. "*"
--		end
--		local ShowUStr = ScriptCB_tounicode(ShowStr)
--		NewStr = ScriptCB_usprintf("ifs.mp.createopts.password",ShowUStr)
--	else
--		NewStr = ScriptCB_usprintf("ifs.mp.createopts.password",OffStr)
--	end
--	RoundIFButtonLabel_fnSetUString(this.buttons.pass,NewStr)

	if(this.bShowNames) then
		NewStr = ScriptCB_usprintf("ifs.mp.createopts.shownames",OnStr)
	else
		NewStr = ScriptCB_usprintf("ifs.mp.createopts.shownames",OffStr)
	end
	RoundIFButtonLabel_fnSetUString(this.buttons.shownames,NewStr)

 	if(this.bHeroesEnabled) then
		RoundIFButtonLabel_fnSetString(this.buttons.hero,"ifs.mp.createopts.heroenable")
	else
		RoundIFButtonLabel_fnSetString(this.buttons.hero,"ifs.mp.createopts.herodisable")
	end

	if(this.bAutoAssignTeams) then
		RoundIFButtonLabel_fnSetString(this.buttons.autoassign,"ifs.mp.createopts.autoassign_on")
	else
		RoundIFButtonLabel_fnSetString(this.buttons.autoassign,"ifs.mp.createopts.autoassign_off")
	end

	if(this.bDedicated) then
		NewStr = ScriptCB_usprintf("ifs.mp.createopts.dedicated",OnStr)
	else
		NewStr = ScriptCB_usprintf("ifs.mp.createopts.dedicated",OffStr)
	end
	RoundIFButtonLabel_fnSetUString(this.buttons.dedicated,NewStr)

-- 	NewStr = ScriptCB_usprintf("ifs.mp.createopts.minrank",
-- 				ScriptCB_tounicode(format("%d",this.iRankMin)))
-- 	RoundIFButtonLabel_fnSetUString(this.buttons.rankmin,NewStr)

-- 	NewStr = ScriptCB_usprintf("ifs.mp.createopts.maxrank",
-- 				ScriptCB_tounicode(format("%d",this.iRankMax)))
-- 	RoundIFButtonLabel_fnSetUString(this.buttons.rankmax,NewStr)

-- 	if(this.bIsRankedGame) then
-- 		NewStr = ScriptCB_usprintf("ifs.mp.createopts.rankedgame",OnStr)
-- 	else
-- 		NewStr = ScriptCB_usprintf("ifs.mp.createopts.rankedgame",OffStr)
-- 	end
-- 	RoundIFButtonLabel_fnSetUString(this.buttons.rankedgame,NewStr)

	local EasyStr = ScriptCB_getlocalizestr("ifs.difficulty.easy")
	local MediumStr = ScriptCB_getlocalizestr("ifs.difficulty.medium")
	local HardStr = ScriptCB_getlocalizestr("ifs.difficulty.hard")
	if(this.iDifficulty==1) then
		NewStr = ScriptCB_usprintf("ifs.mp.createopts.difficulty",EasyStr)
	elseif(this.iDifficulty==2) then
		NewStr = ScriptCB_usprintf("ifs.mp.createopts.difficulty",MediumStr)
	else
		NewStr = ScriptCB_usprintf("ifs.mp.createopts.difficulty",HardStr)
	end
	RoundIFButtonLabel_fnSetUString(this.buttons.difficulty,NewStr)

end

-- Callback function when the virtual keyboard is done
function ifs_mp_gameopts_fnKeyboardDone()
--	print("ifs_mp_gameopts_fnKeyboardDone()")
	local this = ifs_mp_gameopts
	this.PasswordStr = ScriptCB_ununicode(ifs_vkeyboard.CurString)
	ScriptCB_PopScreen()
	ifs_mp_gameopts_fnSetOptionText(this)
	
--	vkeyboard_specs.fnDone = nil -- clear our registration there
end

-- Callback function from VK - returns 2 values, whether the current
-- string is allowed to be entered, and a localize database key string
-- as to why it's not acceptable.
function ifs_mp_gameopts_fnIsAcceptable()
--	print("ifs_mp_gameopts_fnIsAcceptable()")
	return 1,""
end

-- Helper function, updates helptext
function ifs_mp_gameopts_fnUpdateHelptext(this)
	if(this.Helptext_Accept) then
		--if (this.CurButton == "pass") then
		--	IFText_fnSetString(this.Helptext_Accept.helpstr,"common.change")
		--else
			IFText_fnSetString(this.Helptext_Accept.helpstr,"ifs.onlinelobby.launch")
		--end

		gIFShellScreenTemplate_fnMoveIcon(this.Helptext_Accept)
	end
end

ifs_mp_gameopts = NewIFShellScreen {
	nologo = 1,
	bg_texture = "iface_bgmeta_space",
    movieIntro      = nil,
    movieBackground = nil,
	bNohelptext_backPC = 1,
	-- auto launch game server
	bAutoLaunch = nil,
	
	-- the limits on the min/max rank values	
	rankLimitsMin = 200,
	rankLimitsMax = 2000,

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
	
	Enter = function(this, bFwd)
		gIFShellScreenTemplate_fnEnter(this, bFwd) -- call base class
		
		ifs_mp_gameopts_fnSetupDefaults(this)

		ifs_mp_gameopts.bAutoLaunch = nil
		if(gPlatformStr == "PC") then
			this.buttons.autoaim.hidden = 1
		end
	
		-- Added chunk for error handling...
		if(not bFwd) then
			local ErrorLevel,ErrorMessage = ScriptCB_GetError()
			if(ErrorLevel >= 6) then -- session or login error, must keep going further
				ScriptCB_PopScreen()
			end
		end

		if(bFwd) then
			this.SelectedMap = nil -- clear this

			local bForXLive = (gOnlineServiceStr == "XLive")
			this.buttons.pubpriv.hidden = not bForXLive
			local bPS2orPC = (gPlatformStr == "PS2") or (gPlatformStr == "PC")
	--		this.buttons.pass.hidden = not bPS2orPC
--			print("bForXLive =",bForXLive, "bPS2orPC =", bPS2orPC)

			this.CurButton = ShowHideVerticalButtons(this.buttons,ifs_mp_gameopts_vbutton_layout)
			SetCurButton(this.CurButton)
			ifs_mp_gameopts_fnUpdateHelptext(this)

			-- Get defaults first time thru
--			if(not this.bGotDefaults) then
--				this.bGotDefaults = 1
--				this.iNumPlayers,this.iMaxPlayers,this.iNumBots,this.iMaxBots,this.iTeamDmg,this.iAutoAim,this.bShowNames,this.bAutoAssignTeams,this.iStartCnt,this.bHeroesEnabled,this.iDifficulty,this.iMaxDedicatedPlayers,this.iMaxDedicatedBots = ScriptCB_GetNetGameDefaults()
--
--				this.bIsPrivate = nil -- default: public
--				this.bIsRankedGame = 1
--				this.iRankMin = 200
--				this.iRankMax = 2000
--				this.bHeroesEnabled = nil
--			else
--				local tmpNumPlayers
--				local tmpNumBots
--				local tmpMaxBots
--				local tmpTeamDmg
--				local tmpAutoAim
--				local tmpShowNames
--				local tmpAutoAssignTeams
--				local tmpStartCnt
--				local tmpHeroesEnabled
--				local tmpDifficulty
--				local tmpMaxDedicatedBots
--				tmpNumPlayers,this.iMaxPlayers,tmpNumBots,tmpiMaxBots,tmpTeamDmg,tmpAutoAim,tmpShowNames,tmpAssignTeams,tmpStartCnt,tmpHeroesEnabled,tmpDifficulty,this.iMaxDedicatedPlayers,tmpMaxDedicatedBots = ScriptCB_GetNetGameDefaults()
--			end
--			if(this.bDedicated) then
--				this.iNumPlayers = min(this.iNumPlayers,this.iMaxDedicatedPlayers)
--				this.iNumBots = min(this.iNumBots,this.iMaxDedicatedBots)
--			else
--				this.iNumPlayers = min(this.iNumPlayers,this.iMaxPlayers)
--				this.iNumBots = min(this.iNumBots,this.iMaxBots)
--			end

			this.PasswordStr = nil -- none			
			ifs_mp_gameopts_fnSetOptionText(this)
			
			ifs_mp_gameopts_fnSetMapMode(this,nil) -- default internal mode.
			this.SelectedMap = nil -- clear this
		end
	end,

	Exit = function(this, bFwd)
		if(not bFwd) then
			this.SelectedMap = nil -- clear this
		end
		if(gCurHiliteButton) then
			IFButton_fnSelect(gCurHiliteButton,nil)
		end
	end,

	Input_Accept = function(this)
		-- If base class handled this work, then we're done
		if(gShellScreen_fnDefaultInputAccept(this)) then
			return
		end

		ScriptCB_SndPlaySound("shell_menu_enter")

		--if (this.CurButton == "pass") then
		--	if(this.PasswordStr) then
		--		ifs_vkeyboard.CurString = ScriptCB_tounicode(this.PasswordStr)
		--	else
		--		ifs_vkeyboard.CurString = ScriptCB_tounicode("")
		--	end

		--	ifs_vkeyboard.bCursorOnLetters = 1 -- start cursor in top-left
		--	vkeyboard_specs.bPasswordMode = 1

		--	IFText_fnSetString(ifs_vkeyboard.title,"ifs.vkeyboard.title_password")
		--	ifs_movietrans_PushScreen(ifs_vkeyboard)
		--	vkeyboard_specs.fnDone = ifs_mp_gameopts_fnKeyboardDone
		--	vkeyboard_specs.fnIsOk = ifs_mp_gameopts_fnIsAcceptable
			
		--	local w,h = ScriptCB_GetSafeScreenInfo() -- of the usable screen
		--	vkeyboard_specs.MaxWidth = (w * 0.5)
		--	vkeyboard_specs.MaxLen = 16
		if ( this.CurButton == "_ok") then
			ScriptCB_SetNetGameDefaults(this.iNumPlayers,this.iNumBots,this.iTeamDmg,this.iAutoAim,this.bIsPrivate,this.bShowNames,this.bAutoAssignTeams,this.iStartCnt,this.bHeroesEnabled,this.iDifficulty,this.PasswordStr)
			ScriptCB_SetDedicated(this.bDedicated)
			ScriptCB_SetCanSwitchSides( not this.bAutoAssignTeams )
			print("Trying to pop back to mission select")
			ScriptCB_PopScreen()	
		elseif ( this.CurButton == "_back") then
			print("Trying to pop back to mission select")
			this:Input_Back(this)
		else
			this:Input_GeneralRight(1)
		end
	end, -- end of Input_Accept

	Update = function(this, fDt)
		-- Call default base class's update function (make button bounce)
		gIFShellScreenTemplate_fnUpdate(this,fDt)
		
--		if( ifs_mp_gameopts.bAutoLaunch ) then
--			ScriptCB_UpdateLobby(nil)
--	
--			print("Autolaunching...")
--			ScriptCB_LaunchLobby()
--		end
	end,

	Input_Misc = function(this)
		this:Input_GeneralLeft(1)
	end,
	Input_Back = function(this)
		--if(nil) then -- not this.bMapMode) then -- First sub-part
		--	ifs_mp_gameopts_fnSetMapMode(this,1) -- default internal mode.
		--else
		--	ScriptCB_PopScreen("ifs_mp_main")
		--end

		this.bDedicated = this.EntryDedicated
		ScriptCB_PopScreen()
		---umm.....yeah...sorta a hack for this screen, need to redirect mouse input
	--	
	end,

	Input_GeneralUp = function(this)
		-- If base class handled this work, then we're done
		if(gShellScreen_fnDefaultInputUp(this)) then
			return
		end

		gDefault_Input_GeneralUp(this)
		ifs_mp_gameopts_fnUpdateHelptext(this)
	end,

	Input_GeneralDown = function(this)
		-- If base class handled this work, then we're done
		if(gShellScreen_fnDefaultInputDown(this)) then
			return
		end

		gDefault_Input_GeneralDown(this)
		ifs_mp_gameopts_fnUpdateHelptext(this)
	end,

	Input_LTrigger = function(this)
		if(this.CurButton == "players") then
			this.iNumPlayers = max(2,this.iNumPlayers - 10)
		elseif (this.CurButton == "bots") then
			this.iNumBots = max(0,this.iNumBots - 10)
--		elseif (this.CurButton == "teamdmg") then
--			this.iTeamDmg = max(0,this.iTeamDmg - 100)
--		elseif (this.CurButton == "autoaim") then
--			this.iAutoAim = max(0,this.iAutoAim - 100)
		elseif (this.CurButton == "rankmin") then
			this.iRankMin = max(this.rankLimitsMin,this.iRankMin - 100)
		elseif (this.CurButton == "rankmax") then
			this.iRankMax = max(this.rankLimitsMin,this.iRankMax - 100)
			this.iRankMin = min(this.iRankMin,this.iRankMax)
		end
		ifs_mp_gameopts_fnSetOptionText(this)
	end,

	Input_RTrigger = function(this)
		if(this.CurButton == "players") then
			if(this.bDedicated) then
				this.iNumPlayers = min(this.iNumPlayers+10,this.iMaxDedicatedPlayers)
			else
				this.iNumPlayers = min(this.iNumPlayers+10,this.iMaxPlayers)
			end
		elseif (this.CurButton == "bots") then
			if(this.bDedicated) then
				this.iNumBots = min(this.iNumBots+10,this.iMaxDedicatedBots)
			else
				this.iNumBots = min(this.iNumBots+10,this.iMaxBots)
			end
--		elseif (this.CurButton == "teamdmg") then
--			this.iTeamDmg = min(250,this.iTeamDmg + 100)
--		elseif (this.CurButton == "autoaim") then
--			this.iAutoAim = min(250,this.iAutoAim + 100)
		elseif (this.CurButton == "rankmin") then
			this.iRankMin = min(this.rankLimitsMax,this.iRankMin + 100)
			this.iRankMax = max(this.iRankMin,this.iRankMax)
		elseif (this.CurButton == "rankmax") then
			this.iRankMax = min(this.rankLimitsMax,this.iRankMax + 100)
		end
		ifs_mp_gameopts_fnSetOptionText(this)
	end,

	Input_GeneralLeft = function(this)
		if(this.CurButton == "players") then
			--this.iNumPlayers = max(2,this.iNumPlayers - 1)
			if(this.iNumPlayers == 2) then
				if( this.bDedicated ) then
					this.iNumPlayers = this.iMaxDedicatedPlayers
				else
					this.iNumPlayers = this.iMaxPlayers
				end 
			else
				this.iNumPlayers= this.iNumPlayers - 1
			end
			
			
			this.iStartCnt = min(this.iNumPlayers,this.iStartCnt)
		elseif (this.CurButton == "bots") then
			--this.iNumBots = max(0,this.iNumBots - 1)
			if(this.iNumBots == 0) then
				if(this.bDedicated) then
					this.iNumBots =this.iMaxDedicatedBots
				else
					this.iNumBots =this.iMaxBots
				end
			else
				this.iNumBots = this.iNumBots - 1
			end
			
			
		elseif (this.CurButton == "teamdmg") then
			--this.iTeamDmg = max(0,this.iTeamDmg - 10)
			this.iTeamDmg = 100 - this.iTeamDmg
		elseif (this.CurButton == "autoaim") then
			--this.iAutoAim = max(0,this.iAutoAim - 10)
			this.iAutoAim = 100 - this.iAutoAim
		elseif (this.CurButton == "pubpriv") then
			this.bIsPrivate = not this.bIsPrivate
		elseif (this.CurButton == "shownames") then
			this.bShowNames = not this.bShowNames
		elseif (this.CurButton == "hero") then
			this.bHeroesEnabled = not this.bHeroesEnabled
		elseif (this.CurButton == "autoassign") then
			this.bAutoAssignTeams = not this.bAutoAssignTeams
		elseif (this.CurButton == "difficulty") then
			this.iDifficulty = this.iDifficulty-1
			if(this.iDifficulty<=0) then
				this.iDifficulty = 3
			end
		elseif (this.CurButton == "dedicated") then
			this.bDedicated = not this.bDedicated
			if(this.bDedicated) then
				this.iNumPlayers = min(this.iNumPlayers,this.iMaxDedicatedPlayers)
				this.iNumBots = min(this.iNumBots,this.iMaxDedicatedBots)
			else
				this.iNumPlayers = min(this.iNumPlayers,this.iMaxPlayers)
				this.iNumBots = min(this.iNumBots,this.iMaxBots)
			end
		elseif (this.CurButton == "startcnt") then
			this.iStartCnt = max(0,this.iStartCnt - 1)
		elseif (this.CurButton == "rankmin") then
			this.iRankMin = max(this.rankLimitsMin,this.iRankMin - 10)
		elseif (this.CurButton == "rankmax") then
			this.iRankMax = max(this.rankLimitsMin,this.iRankMax - 10)
			this.iRankMin = min(this.iRankMin,this.iRankMax)
		elseif (this.CurButton == "rankedgame") then
			this.bIsRankedGame = not this.bIsRankedGame
		end
		ifelm_shellscreen_fnPlaySound(this.selectSound)
		ifs_mp_gameopts_fnSetOptionText(this)
	end,

	Input_GeneralRight = function(this)
		if(this.CurButton == "players") then
			if(this.bDedicated) then
				--this.iNumPlayers = min(this.iNumPlayers+1,this.iMaxDedicatedPlayers)
				if( this.iNumPlayers == this.iMaxDedicatedPlayers ) then
					this.iNumPlayers = 2
				else
					this.iNumPlayers = this.iNumPlayers + 1
				end
			else
				--this.iNumPlayers = min(this.iNumPlayers+1,this.iMaxPlayers)
				if(this.iNumPlayers ==  this.iMaxPlayers ) then
					this.iNumPlayers = 2
				else
					this.iNumPlayers = this.iNumPlayers + 1
				end
				
			end
		elseif (this.CurButton == "bots") then
			if(this.bDedicated) then
--				print("setting dedicated bots")
			--	this.iNumBots = min(this.iNumBots+1,this.iMaxDedicatedBots)
				if( this.iNumBots == this.iMaxDedicatedBots ) then
					this.iNumBots = 0
				else
					this.iNumBots = this.iNumBots + 1
				end
			else
--				print("setting non-dedicated bots")
			--	this.iNumBots = min(this.iNumBots+1,this.iMaxBots)
				if(this.iNumBots == this.iMaxBots ) then
					this.iNumBots = 0
				else
					this.iNumBots = this.iNumBots + 1
				end
				
			end
		elseif (this.CurButton == "teamdmg") then
			--this.iTeamDmg = min(250,this.iTeamDmg + 10)
			this.iTeamDmg = 100 - this.iTeamDmg
		elseif (this.CurButton == "autoaim") then
			--this.iAutoAim = min(250,this.iAutoAim + 10)
			this.iAutoAim = 100 - this.iAutoAim
		elseif (this.CurButton == "pubpriv") then
			this.bIsPrivate = not this.bIsPrivate
		elseif (this.CurButton == "shownames") then
			this.bShowNames = not this.bShowNames
		elseif (this.CurButton == "hero") then
			this.bHeroesEnabled = not this.bHeroesEnabled
		elseif (this.CurButton == "autoassign") then
			this.bAutoAssignTeams = not this.bAutoAssignTeams
		elseif (this.CurButton == "difficulty") then
			this.iDifficulty = this.iDifficulty+1
			if(this.iDifficulty>3) then
				this.iDifficulty = 1
			end
		elseif (this.CurButton == "dedicated") then
			this.bDedicated = not this.bDedicated
			if(this.bDedicated) then
				this.iNumPlayers = min(this.iNumPlayers,this.iMaxDedicatedPlayers)
				this.iNumBots = min(this.iNumBots,this.iMaxDedicatedBots)
			else
				this.iNumPlayers = min(this.iNumPlayers,this.iMaxPlayers)
				this.iNumBots = min(this.iNumBots,this.iMaxBots)
			end
		elseif (this.CurButton == "startcnt") then
			this.iStartCnt = min(this.iNumPlayers,this.iStartCnt + 1)
		elseif (this.CurButton == "rankmin") then
			this.iRankMin = min(this.rankLimitsMax,this.iRankMin + 10)
			this.iRankMax = max(this.iRankMin,this.iRankMax)
		elseif (this.CurButton == "rankmax") then
			this.iRankMax = min(this.rankLimitsMax,this.iRankMax + 10)
		elseif (this.CurButton == "rankedgame") then
			this.bIsRankedGame = not this.bIsRankedGame
		end
		ifelm_shellscreen_fnPlaySound(this.selectSound)
		ifs_mp_gameopts_fnSetOptionText(this)
	end,
}

ifs_mp_gameopts_vbutton_layout = {
--	yTop = 40, -- auto-calc'd now to be centered vertically
	ySpacing  = 5,
--	width = 350, 	-- Calculated below as a % of screen size
	font = "gamefont_medium",
	buttonlist = { 
		{ tag = "dedicated", string2 = "ifs.mp.createopts.dedicated" },
		{ tag = "players", string2 = "ifs.mp.createopts.maxplayers", },
		{ tag = "bots", string2 = "ifs.mp.createopts.numbots", },
		{ tag = "teamdmg", string2 = "ifs.mp.createopts.teamdamage", },
		{ tag = "autoaim", string2 = "ifs.mp.createopts.autoaim", },
		{ tag = "shownames", string2 = "ifs.mp.createopts.shownames", },
		{ tag = "hero", string2 = "ifs.mp.createopts.heroes", },
		{ tag = "autoassign", string2 = "ifs.mp.createopts.autoassign_on", },
		{ tag = "difficulty", string2 = "ifs.difficulty.title", },

		--moved temp so they can see them		
		
		{ tag = "startcnt", string2 = "ifs.mp.createopts.startcnt", },
		
-- 		{ tag = "rankmin", string2 = "ifs.mp.createopts.rankmin" },
-- 		{ tag = "rankmax", string2 = "ifs.mp.createopts.rankmax" },
-- 		{ tag = "rankedgame", string2 = "ifs.mp.createopts.rankedgame" },
		{ tag = "pubpriv", string2 = "ifs.mp.createopts.pubpriv_pub", },
--		{ tag = "pass", string2 = "", }, --No password for PC version
		
--		{ tag = "dedicated", string2 = "ifs.mp.createopts.dedicated" },
--		{ tag = "startcnt", string2 = "ifs.mp.createopts.startcnt", },
	},
	title = "ifs.mp.createopts.title",
	rotY = 40,
}

-- Helper function, builds this screen.
function ifs_mp_gameopts_fnBuildScreen(this)
	local w,h = ScriptCB_GetSafeScreenInfo() -- of the usable screen

	if(ScriptCB_GetLanguage() ~= "english") then
		ifs_mp_gameopts_vbutton_layout.font = "gamefont_small"
	end

	ifs_mp_gameopts_vbutton_layout.width = w * 0.85
	this.CurButton = AddVerticalButtons(this.buttons,ifs_mp_gameopts_vbutton_layout)
	
 	local BackButtonW = 100
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
			bg_xflipped = 1,
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


ifs_mp_gameopts_fnBuildScreen(ifs_mp_gameopts)
ifs_mp_gameopts_fnBuildScreen = nil -- clear out of memory to save space
AddIFScreen(ifs_mp_gameopts,"ifs_mp_gameopts")
