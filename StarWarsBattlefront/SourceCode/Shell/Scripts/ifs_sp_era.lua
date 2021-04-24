--function ifs_sp_era_fnDidDifficulty()
--	ScriptCB_SetIFScreen("ifs_sp_briefing")
--end

ifs_sp_era = NewIFShellScreen {
	movieIntro      = nil,
	movieBackground = nil,
    
--	title = NewIFText {
--		string = "ifs.sp.pick_era",
--		font = "gamefont_large",
--		textw = 460,
--		ScreenRelativeX = 0.5, -- center
--		ScreenRelativeY = 0.5, -- top
--	},

	buttons = NewIFContainer {
		ScreenRelativeX = 0.5, -- center
		ScreenRelativeY = 0.5, -- top
		y = 20, -- go slightly down from center
	},

	Enter = function(this, bFwd)
		gIFShellScreenTemplate_fnEnter(this, bFwd) -- call default enter function

		if(bFwd and ScriptCB_IsSPStateSaved()) then
            ifs_movietrans_PushScreen(ifs_sp_briefing)
		end
	end,

	Input_Accept = function(this)
		-- If base class handled this work, then we're done
		if(gShellScreen_fnDefaultInputAccept(this)) then
			return
		end

		ifelm_shellscreen_fnPlaySound(this.acceptSound)
		ifs_sp_briefing.era = this.CurButton
		if( bFwd ) then
			ScriptCB_PushScreen("ifs_sp_briefing")
		else
			ifs_movietrans_PushScreen(ifs_sp_briefing)
		end
	end,
}

ifs_sp_era_vbutton_layout = {
--	yTop = -70,
	xWidth = 350,
	width = 350,
	xSpacing = 10,
	ySpacing = 5,
	font = "gamefont_medium",
	buttonlist = { 
		{ tag = "new", string = "common.era.cw", },
		{ tag = "classic", string = "common.era.gcw", },
	},
	title = "ifs.sp.pick_era",
    	rotY = 35,
}

ifs_sp_era.CurButton = AddVerticalButtons(ifs_sp_era.buttons,ifs_sp_era_vbutton_layout)
AddIFScreen(ifs_sp_era,"ifs_sp_era")