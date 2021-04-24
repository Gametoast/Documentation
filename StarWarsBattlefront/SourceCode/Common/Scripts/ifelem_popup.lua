-- Template for a popup: a window which is overlayed over part of the
-- screen, but isn't attached to that screen (and could be shared
-- between multiple screens if desired).
--
-- This will set handlers for the buttons (if not specified in the
-- passed-in template) to handle up/down/left/right by navigating
-- local buttons.

-- Requires: ifelem_buttonwindow to be present.

-- Handles the turning on/off of a popup.
function gPopup_fnActivate(this,v)
	if(v) then
		gCurPopup = this
		if(not this.Open) then
			if(this.Enter) then
				this.Enter(this)
			end
			this.Open = 1
			this.LastButton = gCurHiliteButton
			gCurHiliteButton = nil
			IFObj_fnSetVis(this,1)
			ScriptCB_OpenPopup(this.name)
		end
	else
		gCurPopup = nil
		if(this.Open) then
			this.Open = nil
			IFObj_fnSetVis(this,nil)
			-- Restore hot button from entry
			gCurHiliteButton = this.LastButton 
			this.LastButton = nil
			ScriptCB_ClosePopup()
		end
	end
end

-- Returns whether a popup is active or not
function gPopup_fnIsActive(this)
	return this.Open
end

-- Default 'back' handler: just close it. 
function gPopup_fnInput_Back(this)
	assert(this.Open)
	this:fnActivate(nil) -- don't go away mad, just go away
end

function PopupHandleMouse(this, fMouseX, fMouseY)
	gHandleMouse(this,fMouseX,fMouseY)
end

function NewPopup(Template)
	-- Do this ahead of NewButtonWindow
	Template.fnActivate = Template.fnActivate or gPopup_fnActivate
	local temp = NewButtonWindow(Template)

	-- Set functions, if not set already
	temp.fnIsActive = gPopup_fnIsActive
	-- Provide another access point for the default (flat namespaces here in Lua)
	temp.fnDefaultActivate = gPopup_fnActivate
	if(gIFShellScreenTemplate_fnUpdate) then
		temp.Update = Template.Update or gIFShellScreenTemplate_fnUpdate
	end
	temp.Input_GeneralUp    = Template.Input_GeneralUp or gDefault_Input_GeneralUp
	temp.Input_GeneralRight = Template.Input_GeneralRight or gDefault_Input_GeneralRight
	temp.Input_GeneralDown  = Template.Input_GeneralDown or gDefault_Input_GeneralDown
	temp.Input_GeneralLeft  = Template.Input_GeneralLeft or gDefault_Input_GeneralLeft
	temp.Input_Back = temp.Input_Back or gPopup_fnInput_Back
	temp.HandleMouse = Template.HandleMouse or PopupHandleMouse
	return temp
end