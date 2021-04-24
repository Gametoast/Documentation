-- List manager for Lua. Handles the overall setup of them, with
-- functions for managing them.


-- Creates the entry items for a list (cursor, etc) to destination
-- container, 'Dest'. 
--
-- Layout has the following items in it:
--  .showcount : max # of items to show at once
--  .scrollby : [OPTIONAL] how much the list scrolls at once
--  .yTop : y-coord of top item
--  .yHeight : y-height of each item
--  .ySpacing : gutter between items
--  .width : width of each item
--  .x : x-coord of each entry
--  .slider : bool, if non-nil, adds in a vertical slider at right
--  .CreateFn -- see below
--
-- CreateFn is called for each item, with a table specifying
-- .x,.y,.width,.height for that item. It is to return a fully-built
-- item, but with blank contents (e.g. empty strings, etc)
--
function ListManager_fnInitList(Dest,Layout)
	local i
	local yHeight = Layout.yHeight
	local ySpacing = Layout.ySpacing

	-- Store type for later
	Dest.type = "listbox"

	-- Auto-calculate this as needed
	if(not Layout.yTop) then
		Layout.yTop = ((Layout.showcount * (yHeight + ySpacing)) * -0.5) + (yHeight * 0.5)
	end
	local yTop = Layout.yTop

	local width = Layout.width or 100
	local XPos = Layout.x or 0
	if(Layout.slider) then
		XPos = XPos - 10 -- slide left when a slider's in place
	end

	Layout.FirstShownIdx = Layout.FirstShownIdx or 0
	Layout.SelectedIdx = Layout.SelectedIdx or 0
	Layout.CursorIdx = Layout.SelectedIdx
	Layout.scrollby = Layout.scrollby or max(1,floor(Layout.showcount * 0.5))

	-- Make cursor
	Dest.cursor = NewButtonWindow { 
		ZPos = 100, 
		x2=XPos, y = yTop, 
		width = width, w = width, height = yHeight + 10, h = yHeight + 10 
	}
	Dest.cursor:fnSetTexture("listbox_cursor")

	if(gPlatformStr == "PC") then
		Dest.hilight = NewButtonWindow { 
			ZPos = 100, 
			x2=XPos, y = yTop, 
			width = width, w = width, height = yHeight + 10, h = yHeight + 10 
		}
		Dest.hilight:fnSetTexture("listbox_hilight")
	end

	if(Layout.slider) then
		Layout.slider_top = yTop - yHeight * 0.5
		Layout.slider_bot = yTop - yHeight * 0.5 + Layout.showcount * (yHeight + ySpacing)
		Dest.sliderbg = NewIFImage { 
			x=XPos + width * 0.5, y = 0, 
			ZPos = 160,
			localpos_l = 0, localpos_r = 16,
			localpos_t = Layout.slider_top,
			localpos_b = Layout.slider_bot,
			texture = "slider_bg",
			bHotspot = 1,
			fHotspotX = 0,
			fHotspotW = 16,
			fHotspotY = yTop - yHeight * 0.5,
			fHotspotH = Layout.showcount * (yHeight + ySpacing),
		}

		Dest.sliderfg = NewIFImage { ZPos = 159, x=XPos + width * 0.5, y = 0, 
			localpos_l = 0, localpos_r = 16, 
			localpos_t = Layout.slider_top,
			localpos_b = Layout.slider_bot,
			texture = "slider_fg"
		}
	end

	-- Make all the items
	for i = 1,Layout.showcount do
		Dest[i] = Layout.CreateFn { 
			x=XPos, y=yTop, width = width, height = yHeight
		}

		Dest[i].bHotspot = 1
		Dest[i].fHotspotX = 0
		Dest[i].fHotspotW = width
		Dest[i].fHotspotY = -0.5 * yHeight
		Dest[i].fHotspotH = yHeight

		yTop = yTop + yHeight + ySpacing
	end

end

-- Scrolls the list to ensure the Layout.SelectedIdx is onscreen
function ListManager_fnAutoscroll(Dest,Source,Layout,bNoRedraw)
	local bMovedIt

	if(Layout.SelectedIdx) then
		Layout.FirstShownIdx = Layout.FirstShownIdx or 1
		if(Layout.FirstShownIdx > Layout.SelectedIdx) then
			Layout.FirstShownIdx = Layout.SelectedIdx
			bMovedIt = 1
		end

		local Count = getn(Source)
		if((Count > 0) and (Layout.SelectedIdx > Count)) then
			Layout.SelectedIdx = Count
			Layout.CursorIdx = Count
			bMovedIt = 1
		end
		
		if((Layout.FirstShownIdx + Layout.showcount) <= Layout.SelectedIdx) then
			Layout.FirstShownIdx = max(Layout.SelectedIdx + 1 - Layout.showcount,1)
			bMovedIt = 1
		end
	end

	if((gPlatformStr ~= "PC") and (Layout.CursorIdx)) then -- cursor moves if it was present
		Layout.CursorIdx = Layout.SelectedIdx
	end

	if(bMovedIt and (not bNoRedraw)) then
		ListManager_fnFillContents(Dest,Source,Layout)
	end
	-- Always track cursor changes
	ListManager_fnMoveCursor(Dest,Layout)
end

-- Scrollbar has been clicked on. Move things
function ListManager_fnScrollbarClick(this)
	if((not this.fHitX) or (not this.fHitY)) then
		print("Uhoh, ScrollbarClick, but no idea where they clicked")
		return
	end

	local n = getn(this.Contents)
	local ClickPos = min(n,floor(this.fHitY * n + 1))
--	print("ScrollbarClick : ", this.fHitY , getn(this.Contents), ClickPos)

	-- Move if the new selection is outside of currently visible range
	-- TODO: preserve old selection if that is still visible.
	if((ClickPos < this.Layout.FirstShownIdx) or
		 ((this.Layout.FirstShownIdx + this.Layout.showcount) <= ClickPos)) then
		local EntrySelected = this.Layout.SelectedIdx
		this.Layout.SelectedIdx = ClickPos
		ListManager_fnAutoscroll(this,this.Contents,this.Layout)

		-- Try to keep selection onscreen as much as possible
		this.Layout.SelectedIdx = max(EntrySelected, this.Layout.FirstShownIdx)
		this.Layout.SelectedIdx = min(this.Layout.SelectedIdx, this.Layout.FirstShownIdx + this.Layout.showcount - 1)

		ListManager_fnMoveCursor(this,this.Layout)

	end
end

-- Adds items from the 'Source' table to container 'Dest' with the
-- specified Layout, and the callback 'AdderFn' to fill in a
-- specified item.
--
-- Layout should be the same Layout passed to ListManager_fnInitListExtras.
-- Extra parameters to use are:
--   .FirstShownIdx = offset of first item to show
--   .CursorIdx = absolute posn of cursor within list, nil if cursor hidden
--   .SelectedIdx = absolute posn of which item is selected, nil if no possible entries
--   .PopulateFn = (see below)
--
-- PopulateFn is called with the item (container, single item) created
-- by CreateFn, and a Layout, WHICH MAY BE NIL, or Source[i]. If nil
-- is passed, it wants the item reset to blank.

function ListManager_fnFillContents(Dest,Source,Layout)
	-- Note how many items are in the list, total. (This may change,
	-- recalc every time.
	local i
	local SourceCount = getn(Source)
	ListManager_fnAutoscroll(Dest,Source,Layout,1) -- move if needed

	local FirstShownIdx = Layout.FirstShownIdx or 1

	Dest.Contents = Source
	Dest.Layout = Layout

	local NumToAdd = Layout.showcount
	if(NumToAdd > SourceCount) then
		NumToAdd = SourceCount
	end

	if((FirstShownIdx + NumToAdd) > SourceCount) then
		FirstShownIdx = SourceCount - NumToAdd + 1
		Layout.FirstShownIdx = FirstShownIdx
	end

	local i
	for i = 1,Layout.showcount do
		local DrawIdx = FirstShownIdx + i - 1
		if(DrawIdx > SourceCount) then
			-- Simple case first: off end of list. Tell populator to make it blank
			Layout.PopulateFn(Dest[i],nil)
		else
			Layout.PopulateFn(Dest[i],Source[DrawIdx])
		end
	end

	-- Make cursor follow items
	ListManager_fnMoveCursor(Dest,Layout)

	-- If there's a slider, then recalc it. MacOS got it wrong, proportional
	-- scrollbars are the way to go
	if(Dest.sliderfg) then
		local SliderHeight = Layout.slider_bot - Layout.slider_top

		-- Handle case when SourceCount < Layout.showcount 
		local ShownMax = Layout.showcount
		if(ShownMax > SourceCount) then
			ShownMax = SourceCount
		end

		local NewTop = Layout.slider_top + SliderHeight * ((FirstShownIdx - 1) / SourceCount)
		local NewBot = Layout.slider_top + SliderHeight * ((FirstShownIdx - 1 + ShownMax) / SourceCount)
		NewBot = max(NewBot, NewTop + 6) -- clamp to a min size

		IFImage_fnSetTexturePos(Dest.sliderfg,nil,NewTop,nil,NewBot)

	end

	if(Layout.CursorIdx) then
 	  gCurListboxLayout = Layout
	end

end

-- Redraws the cursor based on the current position (nil == off)
function ListManager_fnMoveCursor(Dest,Layout)
	if(Layout.SelectedIdx) then
		local CursorOffset = (Layout.SelectedIdx - Layout.FirstShownIdx) 
		local NewY = Layout.yTop + CursorOffset * (Layout.yHeight + Layout.ySpacing)

		IFObj_fnSetVis(Dest.cursor,1)
		IFObj_fnSetPos(Dest.cursor,Dest.cursor.x2, NewY + 4)
		if(Layout.bInstance2) then
			gCurHiliteListbox2 = Dest -- note which is active
		else
			gCurHiliteListbox = Dest -- note which is active
		end
	else
		IFObj_fnSetVis(Dest.cursor,nil)
		if(Layout.bInstance2) then
			gCurHiliteListbox2 = nil
		else
			gCurHiliteListbox = nil -- nothing is active
		end
	end

	-- Only on PC does Cursor vary from Selected. Show alternate cursor if
	-- appropriate.
	if(gPlatformStr == "PC") then
		local bShowHilight = nil
		if((Layout.CursorIdx) and (Layout.CursorIdx ~= Layout.SelectedIdx)) then
			local CursorOffset = (Layout.CursorIdx - Layout.FirstShownIdx)
			if((CursorOffset >= 0) and (CursorOffset < Layout.showcount)) then
				bShowHilight = 1
				local NewY = Layout.yTop + CursorOffset * (Layout.yHeight + Layout.ySpacing)
				IFObj_fnSetPos(Dest.hilight,Dest.hilight.x2, NewY + 4)
			end
		end

		IFObj_fnSetVis(Dest.hilight,bShowHilight)
	end
end

gListbox_CurSizeAdd = 1
gListbox_CurDir = 1

-- Time has elapsed on the current listbox. Animate its cursor
function ListManager_fnHilight(this,fDt)
	local ButtonSpeed = 1
--	local ButtonDir = this.ButtonSpeed or 20
--	local ButtonAddScale = this.ButtonAddScale or 1
	local ButtonMaxScale = 1.0
	local ButtonMinScale = 0.5

	if(this.cursor) then
		gListbox_CurSizeAdd = gListbox_CurSizeAdd + fDt * gListbox_CurDir
		if(gListbox_CurSizeAdd > ButtonMaxScale) then
			gListbox_CurSizeAdd = ButtonMaxScale
			gListbox_CurDir = -ButtonSpeed
		elseif (gListbox_CurSizeAdd < ButtonMinScale) then
			gListbox_CurSizeAdd = ButtonMinScale
			gListbox_CurDir = ButtonSpeed
		end
		IFObj_fnSetAlpha(this.cursor,gListbox_CurSizeAdd)
	end
end

-- Goes up on the listbox, if possible. May retrigger a redraw of items
-- if the list scrolled, which is why it needs to know things
function ListManager_fnNavUp(Dest,Source,Layout)
	ListManager_fnAutoscroll(Dest,Source,Layout) -- move cursor

	if(Layout.SelectedIdx > 1) then
		ifelm_shellscreen_fnPlaySound("shell_select_change")
		Layout.SelectedIdx = Layout.SelectedIdx - 1

		-- move internal position, redrawing if necessary
		ListManager_fnAutoscroll(Dest,Source,Layout)
	end
end

-- Goes up on the listbox, if possible. May retrigger a redraw of items
-- if the list scrolled, which is why it needs to know things
function ListManager_fnNavDown(Dest,Source,Layout)
	ListManager_fnAutoscroll(Dest,Source,Layout) -- move cursor

	local SourceCount = Layout.enablecount or getn(Source)
	if(Layout.SelectedIdx < SourceCount) then
		ifelm_shellscreen_fnPlaySound("shell_select_change")
		Layout.SelectedIdx = Layout.SelectedIdx + 1

		-- move internal position, redrawing if necessary
		ListManager_fnAutoscroll(Dest,Source,Layout)
	end
end

-- Goes up on the listbox, if possible. May retrigger a redraw of items
-- if the list scrolled, which is why it needs to know things
function ListManager_fnPageUp(Dest,Source,Layout)
	ListManager_fnAutoscroll(Dest,Source,Layout) -- move cursor

	if(Layout.SelectedIdx > 1) then
		ifelm_shellscreen_fnPlaySound("shell_select_change")

		local RelativePos = Layout.SelectedIdx - Layout.FirstShownIdx + 1

		-- Go to top of current page if in the middle of the current
		-- page, or up one whole page if at the top of the current
		if(RelativePos < 2) then
			Layout.SelectedIdx = max(1,Layout.SelectedIdx - Layout.showcount)
		else
			Layout.SelectedIdx = max(1,Layout.SelectedIdx - RelativePos + 1)
		end

		-- move internal position, redrawing if necessary
		ListManager_fnAutoscroll(Dest,Source,Layout)
	end
end

-- Goes up on the listbox, if possible. May retrigger a redraw of items
-- if the list scrolled, which is why it needs to know things
function ListManager_fnPageDown(Dest,Source,Layout)
	ListManager_fnAutoscroll(Dest,Source,Layout) -- move cursor

	local SourceCount = Layout.enablecount or getn(Source)
	if(Layout.SelectedIdx < SourceCount) then
		ifelm_shellscreen_fnPlaySound("shell_select_change")

		local RelativePos = Layout.SelectedIdx - Layout.FirstShownIdx + 1

		-- Go to bottom of current page if in the middle of the current
		-- page, or down one whole page if at the bottom of the current
		if(RelativePos >= Layout.showcount) then
			Layout.SelectedIdx = min(SourceCount,Layout.SelectedIdx + Layout.showcount)
		else
			Layout.SelectedIdx = min(SourceCount,Layout.SelectedIdx + (Layout.showcount - RelativePos))
		end

		-- move internal position, redraw if necessary
		ListManager_fnAutoscroll(Dest,Source,Layout)
	end
end


function ListManager_fnScrollUp(Dest,Source,Layout)
	if(Layout.FirstShownIdx > 1) then
		ifelm_shellscreen_fnPlaySound("shell_select_change")
		Layout.FirstShownIdx = Layout.FirstShownIdx - 1
		if(Layout.SelectedIdx and (Layout.SelectedIdx >= Layout.FirstShownIdx + Layout.showcount)) then
			Layout.SelectedIdx = Layout.SelectedIdx - 1
		end
	end
end

function ListManager_fnScrollDown(Dest,Source,Layout)
	local SourceCount = Layout.enablecount or getn(Source)
	if(Layout.FirstShownIdx <= SourceCount-Layout.showcount) then
		ifelm_shellscreen_fnPlaySound("shell_select_change")
		Layout.FirstShownIdx = Layout.FirstShownIdx + 1
		if(Layout.SelectedIdx and (Layout.SelectedIdx < Layout.FirstShownIdx)) then
			Layout.SelectedIdx = Layout.SelectedIdx + 1
		end
	end
end

