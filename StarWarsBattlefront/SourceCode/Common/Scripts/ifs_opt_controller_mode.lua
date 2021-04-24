-- Top page for the options pages hierarchy

ifs_opt_controlmode_vbutton_layout = {
	ySpacing  = 5,
	width = 380,
	font = "gamefont_large",
	buttonlist = { 
		{ tag = "soldier", string = "ifs.Controls.Soldier.title", },
		{ tag = "vehicle", string = "ifs.Controls.Vehicle.title", },  
		{ tag = "flyer", string = "ifs.Controls.Flyer.title", },	
	},
	title = "ifs.controls.controlmodes",
	rotY = 40,
}

ifs_opt_contmode = NewIFShellScreen {
	nologo     = 1,
	enterSound = "",
	exitSound  = "",

	buttons = NewIFContainer {
		ScreenRelativeX = 0.6, -- center
		ScreenRelativeY = 0.5, -- top
		y = 20, -- go slightly down from center
	},

	Input_Accept = function(this) 
		-- If base class handled this work, then we're done
		if(gShellScreen_fnDefaultInputAccept(this)) then
			return
		end

		ifelm_shellscreen_fnPlaySound(this.acceptSound)       
		
		local controlstring = "ifs_opt_controller"
		if (gPlatformStr == "PC") then
			controlstring = "ifs_opt_pccontrols"
			ScriptCB_PushScreen( controlstring )
		elseif (this.CurButton == "soldier") then
			ScriptCB_SetControlMode(0)
			ScriptCB_PushScreen(controlstring )
		elseif (this.CurButton == "vehicle") then
			ScriptCB_SetControlMode(1)
			ScriptCB_PushScreen(controlstring )
		elseif (this.CurButton == "flyer") then
			ScriptCB_SetControlMode(2)
			ScriptCB_PushScreen(controlstring )
		end
	end,
	
}

ifs_opt_contmode.CurButton = AddVerticalButtons(ifs_opt_contmode.buttons,ifs_opt_controlmode_vbutton_layout)
AddIFScreen(ifs_opt_contmode,"ifs_opt_contmode")