-- Code, data for a generic InterFace Button (IFButton).
--
-- This is fairly basic, will be extended by other classes
-- (e.g. RoundIFButton)
--
-- Broken off from interface_util.lua for better encapsulation

-- Override for setsize -- does so for self, calls it on kids (if present)
function IFButton_fnSetSize(this,w,h)
	this.width = w
	this.height = h
	
	if(this.label) then
		RoundIFButtonLabel_fnSetSize(this.label,w,h)
	end
	if(this.skin) then
		RoundIFButtonSkin_fnSetSize(this.skin,w,h)
	end
end -- function gIFButtonTemplate_fnSetSize

-- Override for setsize -- does so for self, calls it on kids (if present)
function IFButton_fnSelect(this,on,labelonly)
	local NewTexture

	if(on) then
		NewTexture = "btn_on_pieces"
	else
		NewTexture = "btn_off_pieces"
	end

	if((this.skin) and (not labelonly)) then
		RoundIFButtonSkin_fnSelect(this.skin,NewTexture,NewSkinAlpha)

		-- Always resize to last expected size (in case we made it bigger while selected)
		if(not on) then
			RoundIFButtonSkin_fnSetSize(this.skin,this.width,this.height)
		end
	end
	if(this.label) then
		RoundIFButtonLabel_fnSelect(this.label, on)
	end
end -- function gIFButtonTemplate_fnSelect

-- fnHilight for a IFButton -- updates its hilighted state based
-- on dt . 
function IFButton_fnHilight(this,on,dt)
	dt = dt or 0.03333333 -- default: 30fps if not specified

	-- Get width, height to pass to kids
	local w = this.width
	local h = this.height

	-- Pass to kids by default, if they (and those functions) exist
--	if((this.label) and (this.label.fnHilight)) then
--		this.label:fnHilight(on,dt,w,h)
--	end
	if(this.skin) then
		RoundIFButtonSkin_fnHilight(this.skin,on,dt,w,h)
	end

	if(this.label) then
		RoundIFButtonLabel_fnHilight(this.label,on,dt,w,h)
	end

end

function NewIFButton(Template)
	local temp = Template;
	temp.type = temp.type or "button"
	temp = createObj(gIFObjTemplate , temp)

	-- Now, do the extra work of the sub-items
--	temp.state = temp.state or "selected"
	local BtnW = Template.btnw or 160
	local BtnH = Template.btnh or 40
--	local Font = Template.font or gIFTextTemplate.font

	IFButton_fnSetSize(temp,BtnW,BtnH)

	return temp
end

-- Utility function for Josh to call from C.
function SetCurButton(NameStr)
	--print("SetCurButton(",NameStr)
	if(gCurHiliteButton) then
		IFButton_fnSelect(gCurHiliteButton,nil) -- Deactivate old button
	end

	if(gCurPopup) then
		gCurPopup.CurButton = NameStr
		if(NameStr) then
			gCurHiliteButton = gCurPopup.buttons[NameStr]
		else
			gCurHiliteButton = nil
		end
--		assert(gCurPopup.CurButton)
	else
		gCurScreenTable.CurButton = NameStr
		if(NameStr) then
			gCurHiliteButton = gCurScreenTable.buttons[NameStr]
		else
			gCurHiliteButton = nil
		--assert(gCurScreenTable.CurButton)
		end
	end

	if(gCurHiliteButton) then
		IFButton_fnSelect(gCurHiliteButton,1) -- show new one.
	end
end

-- Utility function for Josh to call from C.
function SetCurButtonTable(this)
	if(gCurHiliteButton) then
		IFButton_fnSelect(gCurHiliteButton,nil) -- Deactivate old button
	end

	if(this.tag) then
		if(gCurPopup) then
			gCurPopup.CurButton = this.tag
			assert(gCurPopup.CurButton)
		else
			gCurScreenTable.CurButton = this.tag
			assert(gCurScreenTable.CurButton)
		end
		--print("SetCurButtonTable(",this.tag)

	end
	gCurHiliteButton = this

	if(gCurHiliteButton) then
		IFButton_fnSelect(gCurHiliteButton,1) -- show new one.
	end
end


-- Current hilighted button. Used to bounce it. May be nil.
gCurHiliteButton = nill