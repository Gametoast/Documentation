-- General handler for a A/B box (same as Yes/No but with no displayed buttons) 

-- Does any work to activate this
function gPopup_AB_fnActivate(this,vis)
	this:fnDefaultActivate(vis)
	if(vis) then
		-- Default: "yes" is selected, if not already set
		this.CurButton = this.CurButton or "yes"

		-- A little extra work, but shouldn't be too bad: deselect all
		-- buttons on entry
		IFButton_fnSelect(this.buttons.no,nil)
		IFButton_fnSelect(this.buttons.yes,nil)

		-- Select right button.
		IFButton_fnSelect(this.buttons[this.CurButton],1)
		gCurHiliteButton = this.buttons[this.CurButton]
		
		-- accept input from all controllers
		if(ifs_saveop and ifs_saveop.saveProfileNum) then
			ScriptCB_ReadAllControllers(1)
		end
	else
		-- no input for you
		if(ifs_saveop and ifs_saveop.saveProfileNum) then
			ScriptCB_ReadAllControllers(nil)
		end
	end
	IFObj_fnSetVis(this.buttons, nil)
end

-- Handle the user hitting accept (back uses defaults). Close this popup,
-- let things know who won
function gPopup_AB_fnInput_Accept(this,iJoystick)
	-- Default: hide this.
	gPopup_AB_fnActivate(this,nil)

	-- Call callback if applicable, w/ result (nil = B, other = A)
	ifelm_shellscreen_fnPlaySound("shell_menu_accept")
	if(this.fnDone) then
		this.fnDone(this.CurButton == "yes")
	end
end

Popup_AB = NewPopup {
	ScreenRelativeX = 0.5, -- centered onscreen
	ScreenRelativeY = 0.5,
	height = 240,
	width = 400,
	ZPos = 50,

	title = NewIFText {
		font = "gamefont_medium",
		textw = 370,
		texth = 160,
		y = -110,
		flashy=0,
	},

	buttons = NewIFContainer {
		y = 60,
	},

	fnActivate = gPopup_AB_fnActivate,
	fnSetMode = gPopup_YesNo_fnSetMode,
	Input_GeneralLeft = function(this)
	end,
	Input_GeneralRight = function(this)
	end,
	
	Input_Accept = function(this)
		 this.CurButton = "yes"
		 gPopup_AB_fnInput_Accept(this)
	end,
	
	Input_Back = function(this)
		 this.CurButton = "no"
		 gPopup_AB_fnInput_Accept(this)
	end,
}

AddHorizontalButtons(Popup_AB.buttons,Horiz_YesNoButtons_layout)

CreatePopupInC(Popup_AB,"Popup_AB")
