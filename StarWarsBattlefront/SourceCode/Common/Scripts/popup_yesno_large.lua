-- General handler for a Yes/No 


Popup_YesNo_Large = NewPopup {
	ScreenRelativeX = 0.5, -- centered onscreen
	ScreenRelativeY = 0.5,
	height = 220,
	width = 440,
	ZPos = 50,

	title = NewIFText {
		font = "gamefont_medium",
		textw = 410,
		texth = 160,
		y = -100,
		flashy = 0,
	},

	buttons = NewIFContainer {
		y = 80,
	},

	fnSetMode = gPopup_YesNo_fnSetMode,
	fnActivate = gPopup_YesNo_fnActivate,
	Input_Accept = gPopup_YesNo_fnInput_Accept,
	-- Be more XBox-compliant
	Input_Back = function(this)
		this.CurButton = "no"
        ifelm_shellscreen_fnPlaySound("shell_menu_cancel")
		gPopup_YesNo_fnInput_Accept(this)
	end,
}

AddHorizontalButtons(Popup_YesNo_Large.buttons,Horiz_YesNoButtons_layout)

CreatePopupInC(Popup_YesNo_Large,"Popup_YesNo_Large")
