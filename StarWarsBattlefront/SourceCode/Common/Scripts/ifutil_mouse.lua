
function HandleMouse_Text(this,MouseX,MouseY,ScreenX,ScreenY)
	--print("In HandleMouse_Text. Values=",MouseX,MouseY,ScreenX,ScreenY)
	return nil
end

function HandleMouse_Model(this,MouseX,MouseY,ScreenX,ScreenY)
	return nil
end

function HandleMouse_Galaxy(this,MouseX,MouseY,ScreenX,ScreenY)
	local left = ScreenX - 50
	local right = 50 + ScreenX
	
	local top = ScreenY - 50
	local bottom = 50 + ScreenY
	
	if( MouseX < left or MouseX > right ) then
		return nil
	end
	if( MouseY < top or MouseY > bottom ) then
		return nil
	end
	
	-- Mouse is over this model. Call a function on the current screen
	if( (gCurScreenTable.MouseOverModel) and (this.tag ~= nil) ) then
		-- print("In HandleMouse_Model. Values=",MouseX,MouseY,ScreenX,ScreenY)
		gCurScreenTable.MouseOverModel( gCurScreenTable, this )
	end

	return 1
end

function HandleMouse_Button(this,MouseX,MouseY,ScreenX,ScreenY)
	--print("In HandleMouse_Btn. Values=",MouseX,MouseY,ScreenX,ScreenY)

	if( this.alpha == 0 or this.hidden == 1 ) then
		return nil
	end
	
	local bHit = ScriptCB_IFObj_MouseOver(this.label.cpointer, MouseX, MouseY)
	if(not bHit) then
		return nil
	end

	--	print("In HandleMouse_Btn. LTRB=",left,top,right,bottom, this.label.halign,this.label.valign, this.width, this.height, this.label.texth )
	SetCurButtonTable(this)
	if(gCurPopup) then
	else
		if(gCurScreenTable.UpdateButtons) then
			gCurScreenTable.UpdateButtons(gCurScreenTable)
		end
	end

	return 1 -- yes, did hit
end

function HandleMouse_ButtonWindow(this,MouseX,MouseY,ScreenX,ScreenY)
	--print("In HandleMouse_Btn. Values=",MouseX,MouseY,ScreenX,ScreenY)

	if( this.alpha == 0 or this.hidden == 1 ) then
		return nil
	end

	local bHit = ScriptCB_IFObj_MouseOver(this.cpointer, MouseX, MouseY)
	if(not bHit) then
		return nil
	end

	gMouseOverButtonWindow = this
	return 1 -- yes, did hit
end


function HandleMouse_Editbox(this,MouseX,MouseY,ScreenX,ScreenY)
  --	print("In HandleMouse_Editbox. Values=",MouseX,MouseY,ScreenX,ScreenY)
	if( this.alpha == 0 ) then
		return nil
	end

	local bHit = ScriptCB_IFObj_MouseOver(this.cpointer, MouseX, MouseY)
	if(not bHit) then
		return nil
	end

	gCurEditbox = this
	gCurEditbox.bMouseover = 1
	return 1 -- yes, did hit
end

function HandleMouse_Image(this,MouseX,MouseY,ScreenX,ScreenY)
  --	print("In HandleMouse_Image. Values=",MouseX,MouseY,ScreenX,ScreenY)
  
	if( this.alpha == 0 ) then
		return nil
	end

	local bHit = ScriptCB_IFObj_MouseOver(this.cpointer, MouseX, MouseY)
	if(not bHit) then
		return nil
	end

	--print("In HandleMouseRecurse Values=",left,right,top,bottom )
	
	if(this.tag) then
		SetCurButton(this.tag)
		if(gCurScreenTable.UpdateButtons) then
			gCurScreenTable.UpdateButtons(gCurScreenTable)
		end
		if(gCurScreenTable.UpdateUI) then
			gCurScreenTable.UpdateUI(gCurScreenTable)
		end
		if(gCurScreenTable.UpdateUIMouseOver) then
			gCurScreenTable.UpdateUIMouseOver(gCurScreenTable, this)
		end		
	end
	return 1 -- yes, did hit
end

function HandleMouse_Listbox(this,MouseX,MouseY,ScreenX,ScreenY)
  if(not this.Contents) then
		return nil
	end

	local ItemCount = getn(this.Contents)
	if( ItemCount == 0) then
		return nil
	end

	if( this.alpha == 0 or this.hidden == 1 ) then
		return nil
	end

	if(this.sliderbg) then
		local bHitSlider,fHitX,fHitY = ScriptCB_IFObj_MouseOver(this.sliderbg.cpointer, MouseX, MouseY)
		if(bHitSlider) then
			gMouseListBoxSlider = this
			gMouseListBoxSlider.fHitX = fHitX
			gMouseListBoxSlider.fHitY = fHitY
--			print(" HitSlider", fHitX, fHitY)
			return 1 -- yes, did hit
		end
	end -- check for a collision w/ slider

	local i
	for i=1,this.Layout.showcount do
		local bHit = ScriptCB_IFObj_MouseOver(this[i].cpointer, MouseX, MouseY)
		if(bHit) then
			local NewIdx = this.Layout.FirstShownIdx + i - 1
			if((this.Layout.CursorIdx ~= NewIdx) and (NewIdx <= getn(this.Contents))) then
				if(not this.Layout and not this.Layout.noChangeSound) then
					ScriptCB_SndPlaySound("shell_select_change")
				end
				this.Layout.CursorIdx = NewIdx
				
				--print( "+++this.Layout.CursorIdx = ", this.Layout.CursorIdx )
				
				-- Repaint self
				ListManager_fnFillContents(this,this.Contents,this.Layout)
				if(gCurScreenTable.UpdateUI) then
					gCurScreenTable.UpdateUI(gCurScreenTable)
				end
				if(gCurScreenTable.fnClearButtonHilight) then
					gCurScreenTable.fnClearButtonHilight(gCurScreenTable)
				end
			elseif (NewIdx > getn(this.Contents)) then
				-- Moved off the list. Clear cursor if applicable
				if(this.Layout.CursorIdx) then
					this.Layout.CursorIdx = nil
					ListManager_fnFillContents(this,this.Contents,this.Layout)
				end
			end

			gMouseListBox = this
			return 1 -- yes, did hit
		end
	end
end


function HandleMouse_HSlider(this,MouseX,MouseY,ScreenX,ScreenY)
	-- width : overall width in pixels (of the background)
	-- height : overall height in pixels
	-- thumbwidth : width % the thumb (FG) (default 0.1, 10%)
	-- thumbposn : position of the slider in 0..1 scale (clamped to right side)
	
	local VisWidth = this.width * (1.0 + this.thumbwidth)
	local ClickWidth = this.width * (1.0 + (this.thumbwidth * 0.5))
	left = ScreenX - this.width * 0.5 
	right = left + VisWidth
	top = ScreenY - this.height * 0.5
	bottom = top + this.height 
	
	--	print("In HandleMouse_HSlider Values=",left,right,top,bottom )
	
	if(( MouseX < left or MouseX > right ) or (MouseY < top or MouseY > bottom)) then
		return nil
	end

	-- Store where the mouse percentage is. Screen will parse it out later if
	-- the user actually clicks.
	this.MousePercentage = (MouseX - left) / ClickWidth
	-- And clamp from 0..1 range
	this.MousePercentage = max(0,this.MousePercentage)
	this.MousePercentage = min(1.0,this.MousePercentage)

	gMouseOverHorz = this
	return 1 -- yes, did hit
end

function HandleMouseRecurse(this,MouseX,MouseY,ScreenX,ScreenY)
	-- If this item has a screen pin, set x/y from there
	
	if( this.bHidden or not IFObj_fnGetVis(this) ) then
		return nil
	end
	
	if(this.ScreenRelativeX) then
		ScreenX = (gSafeW * this.ScreenRelativeX) + ((gScrnW - gSafeW) * 0.5)
		ScreenY = (gSafeH * this.ScreenRelativeY) + ((gScrnH - gSafeH) * 0.5)
	end

	-- If we know a base position, recurse down from here.
	-- Bugs: doesn't do rotating objects.
	if(ScreenX) then
		ScreenX = ScreenX + (this.x or 0)
		ScreenY = ScreenY + (this.y or 0)
	end

	-- Do specific leaf-node subtypes here.	
	if((this.type == "text") and 
		 HandleMouse_Text(this,MouseX,MouseY,ScreenX,ScreenY)) then
		return
	elseif ((this.type == "button") and
					HandleMouse_Button(this,MouseX,MouseY,ScreenX,ScreenY)) then
		return
	elseif (((this.type == "image") or (this.type == "maskimage")) and 
					HandleMouse_Image(this,MouseX,MouseY,ScreenX,ScreenY)) then
		return
	elseif ((this.type == "model") and
					HandleMouse_Model(this,MouseX,MouseY,ScreenX,ScreenY)) then
		return
	elseif ((this.type == "listbox") and
					HandleMouse_Listbox(this,MouseX,MouseY,ScreenX,ScreenY)) then
		return
	elseif ((this.type == "hslider") and
					HandleMouse_HSlider(this,MouseX,MouseY,ScreenX,ScreenY)) then
		return
	elseif ((this.type == "galaxy") and 
					HandleMouse_Galaxy(this,MouseX,MouseY,ScreenX,ScreenY)) then
		return
	elseif ((this.type == "editbox") and 
					HandleMouse_Editbox(this,MouseX,MouseY,ScreenX,ScreenY)) then
		return
	elseif ((this.type == "buttonwindow") and
					HandleMouse_ButtonWindow(this,MouseX,MouseY,ScreenX,ScreenY)) then
 		return
	end

	-- Leaf case not handled above. Recurse down all subtables.
	local k,v
	for k,v in this do
		if(type(v) == "table") then
			-- Recurse into this table
			HandleMouseRecurse(v,MouseX,MouseY,ScreenX,ScreenY)
		end -- v is a table
	end
end

function gHandleMouse(this, MouseX,MouseY,ScreenX,ScreenY)
	local EntryOverSlider = gMouseOverSlider
	local EntryOverHorz = gMouseOverHorz
	local EntryButton = this.CurButton
	local EntryButtonWindow = gMouseOverButtonWindow
	local EntryEditbox = gCurEditbox
	local EntryListBoxSlider = gMouseListBoxSlider
	local EntryMouseListBox = gMouseListBox
	if(EntryEditbox) then
		EntryEditbox.bMouseover = nil
	end

	-- Clear items 
	gMouseOverSlider = nil
	gMouseOverHorz = nil

	gMouseListBox = nil
	gMouseListBoxSlider = nil
	gCurEditbox = nil
	SetCurButton(nil)
	gMouseOverButtonWindow = nil
	-- call the recursive workhorse function
	HandleMouseRecurse(this,MouseX,MouseY,ScreenX,ScreenY)

	-- If something changed, then play sfx.
	-- Todo - maybe make this a bit better?
	if (((not EntryOverSlider) and gMouseOverSlider) or
			((not EntryOverHorz) and gMouseOverHorz) or
				((not EntryEditbox) and gCurEditbox) or
				((not EntryListBoxSlider) and gMouseListBoxSlider) or
				(EntryButtonWindow ~= gMouseOverButtonWindow) or
				(EntryButton ~= this.CurButton)) then
		
		if (this.CurButton or gCurEditbox or gMouseOverButtonWindow or gMouseOverSlider or gMouseListBoxSlider or gMouseOverHorz) then
			if(not this.Layout or not this.Layout.noChangeSound) then
				ScriptCB_SndPlaySound("shell_select_change")
			end
		end
	end

	-- Focus-follows-mouse is the OneTrueWay(tm). [Don't like it? Here's a nickel,
	-- kid, buy yourself a better computer]
	--
	-- But, since whiners complain, be sloppy about edit boxes. They'll keep
	-- focus until you go to another
	if((not gCurEditbox) and (EntryEditbox) and (EntryEditbox.bKeepsFocus) and 
		 ((not EntryEditbox.alpha) or (EntryEditbox.alpha > 0))) then
		gCurEditbox = EntryEditbox
	end

	if(gCurEditbox ~= EntryEditbox) then
		if(EntryEditbox) then
			IFEditbox_fnHilight(EntryEditbox, nil)
		end
		if(gCurEditbox) then
			IFEditbox_fnHilight(gCurEditbox, 1)
		end
	end

	if(EntryButtonWindow ~= gMouseOverButtonWindow) then
		if(EntryButtonWindow) then
			gButtonWindowSkin_fnSetTexture(EntryButtonWindow.skin,"border_3_pieces")
		end
		if(gMouseOverButtonWindow) then
			gButtonWindowSkin_fnSetTexture(gMouseOverButtonWindow.skin,"border_3a_pieces")
		end
	end

	-- If moved off this listbox this frame, then must clear cursor
	if((EntryMouseListBox) and (not gMouseListBox) and (EntryMouseListBox.Layout.CursorIdx)) then
		EntryMouseListBox.Layout.CursorIdx = nil
		ListManager_fnFillContents(EntryMouseListBox,EntryMouseListBox.Contents,EntryMouseListBox.Layout)
	end

end