-- General handler for a "Error" dialog. 

-- Does any work to activate this. Vis is nil if off, or a float in
-- the following list (out of FLGuiManager.h)

-- 	enum eErrorSeverity {
-- 		ERROR_NONE = 0,				// no error
-- 		OLD_ERROR_PAD_MISSING = 1, // Pauses SP, dialog in MP
-- 		ERROR_WARNING = 2,			// no ui steps required
-- 		ERROR_DELAY = 3,			// no ui steps required, but add a delay to return
-- 		ERROR_SUBSCREEN = 4,		// error in subscreen, bail one screen
-- 		ERROR_IGNORE_OR_REBOOT = 5,	// optional reboot to dashboard
-- 		ERROR_LEAVE_SESSION = 6,	// must leave the current session
-- 		ERROR_LOGOFF = 7,			// must disconnect
-- 		ERROR_LOGOFF_CABLE = 8,		// cable out, must disconnect
-- 		ERROR_LOGOFF_OR_REBOOT = 9,	// must logoff, optional reboot to dashboard
-- 		ERROR_REBOOT = 10,			// must reboot to dashboard
-- 		ERROR_PAD_MISSING = 11,		// Pauses SP, dialog in MP
--		ERROR_MISSING_DC = 12,		// client missing a downloadable content map in MP
-- 	};

-- The OK button is shown for anything ERROR_SUBSCREEN or higher

function gPopup_Error_fnActivate(this,vis)
	if(vis) then
--		print("Error_fnActivate. vis = ", vis)

		-- Hide busy popup if present.
		if(Popup_Busy) then
			ScriptCB_IFObj_SetAlpha(Popup_Busy.cpointer,0.0) -- show it
		end

		if(Popup_LobbyOpts and (Popup_LobbyOpts.bIsActivated)) then
			Popup_LobbyOpts:fnActivate(nil)
		end

		this.bShowButtons = (vis > 3)
		if(this.bShowButtons) then
			this.bShowOk = (vis == 4) or ((vis >=6) and (vis <= 8)) or (vis == 10) or (vis == 11) or (vis == 12)

			if(this.bShowOk) then
				IFButton_fnSelect(this.buttons.no,nil)
				this.CurButton = "yes"
				IFButton_fnSelect(this.buttons.yes,1)
				this.buttons.no.hidden = 1
				RoundIFButtonLabel_fnSetString(this.buttons.yes,"common.ok")
			else
				IFButton_fnSelect(this.buttons.yes,nil)
				this.CurButton = "no"
				IFButton_fnSelect(this.buttons.no,1)
				this.buttons.no.hidden = nil
				RoundIFButtonLabel_fnSetString(this.buttons.yes,"common.yes")
			end

			ShowHideHorizontalButtons(this.buttons,Horiz_YesNoButtons_layout_Wider)
			gCurHiliteButton = this.buttons[this.CurButton]
			IFObj_fnSetVis(this.buttons,(vis ~= 11))
		else
			this.CurButton = "no"
--			IFButton_fnSelect(this.buttons[this.CurButton],nil)
--			gCurHiliteButton = nil
			IFObj_fnSetVis(this.buttons,nil)
		end

	end

	-- Hack workaround for bug 6841 - turn off second "no controllers" message
	-- if present
	if((ifs_boot) and (ifs_boot.title)) then
		IFObj_fnSetVis(ifs_boot.title, not vis)
	end

end

-- Handle the user hitting accept (back uses defaults). Close this popup,
-- let things know who won
function gPopup_Error_fnInput_Accept(this)
	if(this.bShowButtons) then
		local ErrorLevel,ErrorMessage = ScriptCB_GetError()
		print("In gPopup_Error_fnInput_Accept")
		-- Default: hide this.

		local bUserHitYes = (this.CurButton == "yes") -- or 'Ok', same thing
		ScriptCB_CloseErrorBox(bUserHitYes)

		-- Call callback if applicable, w/ result (nil = no, other = yes)
		ScriptCB_SndPlaySound("shell_menu_ok")
		if(this.fnDone) then
			this.fnDone()
		end

		if(gCurScreenTable and (gCurScreenTable.fnPostError)) then
			gCurScreenTable.fnPostError(gCurScreenTable,bUserHitYes,ErrorLevel,ErrorMessage)
--		else
--			print("Uhoh, current screen has no post-error handler!")
		end

	end
end

Popup_Error = NewPopup {
	ScreenRelativeX = 0.5, -- centered onscreen
	ScreenRelativeY = 0.5,
	height = 270,
	width = 440,
	ZPos = 50,

	title = NewIFText {
		font = "gamefont_medium",
		textw = 415,
		texth = 170,
		y = -115,
		nocreatebackground = 1,
	},

	buttons = NewIFContainer {
		y = 95,
	},

	fnSetMode = gPopup_Error_fnSetMode,
	fnActivate = gPopup_Error_fnActivate,
	Input_Accept = gPopup_Error_fnInput_Accept,
	Input_Back = function(this)
		this.CurButton = "no"
		gPopup_Error_fnInput_Accept(this)
	end,
	Input_GeneralUp = function(this)
	end,
	Input_GeneralDown = function(this)
	end,

	Update = function(this, fDt)
		gIFShellScreenTemplate_fnUpdate(this, fDt)
		ScriptCB_UpdateLobby(nil)
	end,
}

Horiz_YesNoButtons_layout_Wider = {
--	xLeft = -80,
	yTop = 0,
	xWidth = 160,
	xSpacing = 10,
	height = 45,
	font = "gamefont_medium",
	flashy = 0,
	buttonlist = { 
		{ tag = "yes", string = "common.yes", },
		{ tag = "no", string = "common.no", },
	},
	nocreatebackground = 1,
}

Popup_Error.CurButton = AddHorizontalButtons(Popup_Error.buttons,Horiz_YesNoButtons_layout_Wider)
--AddVerticalButtons(Popup_Error.buttons,OkButton_layout)
gButtonWindow_fnSetTexture(Popup_Error,"opaque_rect")

CreatePopupInC(Popup_Error,"Popup_Error")
