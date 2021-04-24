-- General handler for a "Busy..." dialog for the front end

-- Does any work to activate this
function gPopup_Busy_fnActivate(this,vis)
	this:fnDefaultActivate(vis)
	ScriptCB_IFObj_SetAlpha(Popup_Busy.cpointer,1.0) -- show it
	if(vis) then
		-- sanity check that required callbacks are set up
		assert(this.fnCheckDone)
		assert(this.fnOnSuccess)
		assert(this.fnOnFail)
		assert(this.fnOnCancel)

		this.fBusyTime = 0 -- Clear timer
		this.fBusyTimeFloor = -1 -- Clear timer for display

		-- 1 button, it's selected, hilighted, etc
		this.CurButton = "cancel"
		IFButton_fnSelect(this.buttons[this.CurButton],1)
		gCurHiliteButton = this.buttons[this.CurButton]

		IFObj_fnSetVis(this.buttons, not this.bNoCancel)
	else
		this.bCallerSetsString = nil -- reset this
	end
end

-- Handle the user hitting accept (back uses defaults). Close this popup,
-- let things know who won
function gPopup_Busy_fnInput_Accept(this)
	if(this.CurButton == "cancel") then
		if(not this.bNoCancel) then
			-- Default: hide this.
			gPopup_Busy_fnActivate(this,nil)
	
			-- Do callback
			if(this.fnOnCancel) then
				this.fnOnCancel()
			end
		end
	end
end

Popup_Busy = NewPopup {
	ScreenRelativeX = 0.5, -- centered onscreen
	ScreenRelativeY = 0.5,
	height = 200,
	width = 300,
	ZPos = 50,

	title = NewIFText {
		font = "gamefont_medium",
		textw = 280,
		texth = 120,
		y = -80,
		nocreatebackground = 1,
	},

	BusyTimeStr = NewIFText {
		font = "gamefont_medium",
		textw = 280,
		texth = 120,
		y = 0,
		nocreatebackground = 1,
	},

	buttons = NewIFContainer {
		y = 60,
	},

	fnSetMode = gPopup_Busy_fnSetMode,
	fnActivate = gPopup_Busy_fnActivate,
	Input_Accept = gPopup_Busy_fnInput_Accept,
	Input_Back = gPopup_Busy_fnInput_Accept,

	fBusyTime = 0, -- Clear timer
	fBusyTimeFloor = -1, -- Clear timer for display (floor of fBusyTime)

	Update = function(this, fDt)
		local IsDone = this.fnCheckDone()

		this.fBusyTime = this.fBusyTime + fDt
		-- force a press of the cancel button if it goes too long
		if((this.fTimeout) and (this.fBusyTime > this.fTimeout)) then
			IsDone = -1
			this.fTimeout = nil -- don't hammer on fnOnFail
		end

		if(IsDone > 0.5) then
			this.fnOnSuccess()
		elseif (IsDone < -0.5) then
			this.fnOnFail()
		else

			if(not this.bCallerSetsString) then
				local fTimeFloor = floor(this.fBusyTime)
				if(this.fBusyTimeFloor ~= fTimeFloor) then
					this.fBusyTimeFloor = fTimeFloor
					local TimeUStr = ScriptCB_usprintf("ifs.busytime",
																						 ScriptCB_tounicode(format("%d",this.fBusyTimeFloor)))
					IFText_fnSetUString(this.BusyTimeStr,TimeUStr)
				end -- # seconds different
			end -- we manage busy text
		end

	end,

	-- Must be specified by caller
	-- fnCheckDone() -- returns -1 (failure), 0 (pending), or 1 (success)
	-- fnOnSuccess() -- what to do when succeeds
	-- fnOnFail()
	-- fnOnCancel()
}

local CancelButton_layout = {
	yTop = 15,
	yHeight = 45,
	ySpacing  = 5,
	width = 180,
	font = "gamefont_medium",
	buttonlist = { 
		{ tag = "cancel", string = "common.cancel", },
	},
	nocreatebackground = 1,
}

AddVerticalButtons(Popup_Busy.buttons,CancelButton_layout)
Popup_Busy.buttons.cancel.x = 0
Popup_Busy.buttons.cancel.label.x = 0
Popup_Busy.buttons.cancel.label.halign = "hcenter"

CreatePopupInC(Popup_Busy,"Popup_Busy")
