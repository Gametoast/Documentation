
LoadSave2_button_layout = {
	yTop = 50,
	ySpacing  = 5,
	width = 280,
	font = "gamefont_small",
	buttonlist = { 
		{ tag = "C", string = "common.no", },
		{ tag = "B", string = "common.no", },
		{ tag = "A", string = "common.yes", },
	},
	nocreatebackground = 1,
}


-- Does any work to activate this
function gPopup_LoadSave2_fnActivate(this,vis)
	this:fnDefaultActivate(vis)
	if(vis) then
		-- Default: no is selected.
		IFButton_fnSelect(this.buttons.A,nil)
		IFButton_fnSelect(this.buttons.B,nil)
		IFButton_fnSelect(this.buttons.C,1)
		this.CurButton = "A"
		gCurHiliteButton = this.buttons.A
		
		-- accept input from all controllers
		if(ifs_saveop.saveProfileNum) then
			ScriptCB_ReadAllControllers(1,1) -- second param: don't allow binding on 2nd controller
		end
	else
		-- no input for you
		if(ifs_saveop.saveProfileNum) then
			ScriptCB_ReadAllControllers(nil)
		end
	end
	-- hide the popup initially
	IFObj_fnSetVis(this,nil)
end

function Popup_LoadSave2_ResizeButtons()
	local this = Popup_LoadSave2
	this.buttons.C.hidden = not IFObj_fnGetVis(this.buttons.C.label)
	this.buttons.B.hidden = not IFObj_fnGetVis(this.buttons.B.label)
	this.buttons.A.hidden = not IFObj_fnGetVis(this.buttons.A.label)
	ShowHideVerticalButtons(this.buttons,LoadSave2_button_layout)
end

function Popup_LoadSave2_SelectButton(fBtn)
	local this = Popup_LoadSave2
	
	if(fBtn == 1) then
		this.CurButton = "A"
	elseif(fBtn == 2) then
		this.CurButton = "B"
	elseif(fBtn == 3) then
		this.CurButton = "C"
	end
	
	-- deselect all buttons on entry
	IFButton_fnSelect(this.buttons.A,nil)
	IFButton_fnSelect(this.buttons.B,nil)
	IFButton_fnSelect(this.buttons.C,nil)
	-- Select right button.
	if(this.buttons and this.CurButton and this.buttons[this.CurButton]) then
		IFButton_fnSelect(this.buttons[this.CurButton],1)
		gCurHiliteButton = this.buttons[this.CurButton]
	end
		
end

-- Handle the user hitting accept. Pass on to game.
function gPopup_LoadSave2_fnInput_Accept(this, iJoystick)
	if(ifs_saveop.saveProfileNum and ifs_saveop.saveProfileNum~=iJoystick+1) then
		print("gPopup_LoadSave2_fnInput_Accept on wrong joystick num.  got",iJoystick+1,"want",ifs_saveop.saveProfileNum)
	else
		ifelm_shellscreen_fnPlaySound("shell_menu_accept")
		local fn = this.fnAccept or ScriptCB_LoadSavePopupResult
		
		if(this.CurButton == "A") then
			fn(1)
		elseif (this.CurButton == "B") then
			fn(2)
		elseif (this.CurButton == "C") then
			fn(3)
		else
			print("Unusual button for popup_LoadSave2,",this.CurButton)
		end
	end
end

function gPopup_LoadSave2_fnInput_Back(this)
end

function gPopup_LoadSave2_fnInput_GeneralUp(this,iJoystick)
	if(ifs_saveop.saveProfileNum and ifs_saveop.saveProfileNum~=iJoystick+1) then
		print("gPopup_LoadSave2_fnInput_GeneralUp on wrong joystick num.  got",iJoystick+1,"want",ifs_saveop.saveProfileNum)
	else
		gDefault_Input_GeneralUp(this,iJoystick)
	end
end
function gPopup_LoadSave2_fnInput_GeneralDown(this,iJoystick)
	if(ifs_saveop.saveProfileNum and ifs_saveop.saveProfileNum~=iJoystick+1) then
		print("gPopup_LoadSave2_fnInput_GeneralDown on wrong joystick num.  got",iJoystick+1,"want",ifs_saveop.saveProfileNum)
	else
		gDefault_Input_GeneralDown(this,iJoystick)
	end
end

Popup_LoadSave2 = NewPopup {
	ScreenRelativeX = 0.5, -- centered onscreen
	ScreenRelativeY = 0.5,
	height = 280,
	width = 460,
	ZPos = 50,

	title = NewIFText {
		font = "gamefont_small",
		textw = 440,
		texth = 240,
		y = -120,
		inert = 1,
		--nocreatebackground = 1,
		flashy = 0,
	},

	buttons = NewIFContainer {
		--ScreenRelativeX = 0.5,
		--ScreenRelativeY = 1.0,
		y = 20,
	},

	fnActivate = gPopup_LoadSave2_fnActivate,
	Input_Accept = gPopup_LoadSave2_fnInput_Accept,
	Input_Back = gPopup_LoadSave2_fnInput_Back,
	Input_GeneralUp = gPopup_LoadSave2_fnInput_GeneralUp,
	Input_GeneralDown = gPopup_LoadSave2_fnInput_GeneralDown,
}

AddVerticalButtons(Popup_LoadSave2.buttons,LoadSave2_button_layout)

CreatePopupInC(Popup_LoadSave2,"Popup_LoadSave2")
