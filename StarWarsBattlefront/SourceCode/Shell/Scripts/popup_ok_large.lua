-- General handler for a "Ok" dialog

Popup_Ok_Large = NewPopup {
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
		y = 80,
	},

	fnSetMode = gPopup_Ok_fnSetMode,
	fnActivate = gPopup_Ok_fnActivate,
	Input_Accept = gPopup_Ok_fnInput_Accept,

	Input_Back = gPopup_Ok_fnInput_Accept,
}

AddVerticalButtons(Popup_Ok_Large.buttons,OkButton_layout)
Popup_Ok_Large.buttons.ok.x = 0
Popup_Ok_Large.buttons.ok.label.x = 0
Popup_Ok_Large.buttons.ok.label.halign = "hcenter"

CreatePopupInC(Popup_Ok_Large,"Popup_Ok_Large")
