-- General handler for a Yes/No 

-- Does any work to activate this
function gPopup_YesNo_fnActivate(this,vis)
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
end

-- Handle the user hitting accept (back uses defaults). Close this popup,
-- let things know who won
function gPopup_YesNo_fnInput_Accept(this,iJoystick)
	if(ifs_saveop and ifs_saveop.saveProfileNum and ifs_saveop.saveProfileNum~=iJoystick+1) then
		print("gPopup_LoadSave2_fnInput_Accept on wrong joystick num.  got",iJoystick+1,"want",ifs_saveop.saveProfileNum)
	else	
		-- only accept it if you actually hit a button
		if(this.CurButton) then
			-- Default: hide this.
			gPopup_YesNo_fnActivate(this,nil)

			-- Call callback if applicable, w/ result (nil = no, other = yes)
			ifelm_shellscreen_fnPlaySound("shell_menu_accept")
			if(this.fnDone) then
				this.fnDone(this.CurButton == "yes")
			--else
			--    ifelm_shellscreen_fnPlaySound("shell_menu_cancel")
			end
		end
	end
end

function gPopup_YesNo_fnInput_GeneralLeft(this,iJoystick)
	if(ifs_saveop and ifs_saveop.saveProfileNum and ifs_saveop.saveProfileNum~=iJoystick+1) then
		print("gPopup_YesNo_fnInput_GeneralLeft on wrong joystick num.  got",iJoystick+1,"want",ifs_saveop.saveProfileNum)
	else
		gDefault_Input_GeneralLeft(this,iJoystick)
	end
end
function gPopup_YesNo_fnInput_GeneralRight(this,iJoystick)
	if(ifs_saveop and ifs_saveop.saveProfileNum and ifs_saveop.saveProfileNum~=iJoystick+1) then
		print("gPopup_YesNo_fnInput_GeneralRight on wrong joystick num.  got",iJoystick+1,"want",ifs_saveop.saveProfileNum)
	else
		gDefault_Input_GeneralRight(this,iJoystick)
	end
end


Popup_YesNo = NewPopup {
	ScreenRelativeX = 0.5, -- centered onscreen
	ScreenRelativeY = 0.5,
	height = 180,
	width = 300,
	ZPos = 50,

	title = NewIFText {
--		string = "Busy w/ Memcard",
		font = "gamefont_medium",
		textw = 260,
		texth = 120,
		y = -80,
		flashy = 0,
	},

	buttons = NewIFContainer {
-- 		ScreenRelativeX = 0.5, -- centered onscreen
-- 		ScreenRelativeY = 0.5,
		y = 60,
	},

	fnSetMode = gPopup_YesNo_fnSetMode,
	fnActivate = gPopup_YesNo_fnActivate,
	Input_Accept = gPopup_YesNo_fnInput_Accept,
	Input_GeneralRight = gPopup_YesNo_fnInput_GeneralRight,
	Input_GeneralLeft = gPopup_YesNo_fnInput_GeneralLeft,
	
	
	-- allowing this violates all kinds of load save tcrs, both on xbox and ps2.  mostly because
	-- it isn't "positive confirmation" of a destructive action.  if it is needed other places we
	-- should special case it with a flag or something
	-- Be more XBox-compliant
	Input_Back = function(this)
	--	 this.CurButton = "no"
	--	 gPopup_YesNo_fnInput_Accept(this)
	end,
}

AddHorizontalButtons(Popup_YesNo.buttons,Horiz_YesNoButtons_layout)

CreatePopupInC(Popup_YesNo,"Popup_YesNo")
