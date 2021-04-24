-- Window w/ vertical buttons template, associated code.

-- fnSetSize for a ButtonWindow's Skin. Pulled out so its
-- implementation could be properly shared (refcounted) among all
-- instances. Bugs: 32x32 is the smallest size possible
function gButtonWindowSkin_fnSetSize(this,w,h)
	-- Massive duplication. Sorry. :(
	local x1 = (w * -0.5)
	local x2 = (w * -0.5) + 16
	local x3 = (w *  0.5) - 16
	local x4 = (w *  0.5)

	local y1 = (h * -0.5)
	local y2 = (h * -0.5) + 16
	local y3 = (h *  0.5) - 16
	local y4 = (h *  0.5)

	if(y3 < y2) then
		y2 = 0
		y3 = 0
	end

	if(this.ChunkTL) then
		IFImage_fnSetTexturePos(this.ChunkTL,x1,y1,x2,y2)
	end
	if(this.ChunkTC) then
		IFImage_fnSetTexturePos(this.ChunkTC,x2,y1,x3,y2)
	end
	if(this.ChunkTR) then
		IFImage_fnSetTexturePos(this.ChunkTR,x3,y1,x4,y2)
	end
	if(this.ChunkCL) then
		IFImage_fnSetTexturePos(this.ChunkCL,x1,y2,x2,y3)
	end
	if(this.ChunkC) then
		IFImage_fnSetTexturePos (this.ChunkC,x2,y2,x3,y3)
	end
	if(this.ChunkCR) then
		IFImage_fnSetTexturePos(this.ChunkCR,x3,y2,x4,y3)
	end
	if(this.ChunkBL) then
		IFImage_fnSetTexturePos(this.ChunkBL,x1,y3,x2,y4)
	end
	if(this.ChunkBC) then
		IFImage_fnSetTexturePos(this.ChunkBC,x2,y3,x3,y4)
	end
	if(this.ChunkBR) then
		IFImage_fnSetTexturePos(this.ChunkBR,x3,y3,x4,y4)
	end
end

-- fnSetTexture for a ButtonWindow's Skin. Pulled out so its
-- implementation could be properly shared (refcounted) among all
-- instances
function gButtonWindowSkin_fnSetTexture(this,NewTexture,NewAlpha)
	-- Massive duplication. Sorry. :(
	if(this.ChunkTL) then
		IFImage_fnSetTexture(this.ChunkTL,NewTexture,NewAlpha)
	end
	if(this.ChunkTC) then
		IFImage_fnSetTexture(this.ChunkTC,NewTexture,NewAlpha)
	end
	if(this.ChunkTR) then
		IFImage_fnSetTexture(this.ChunkTR,NewTexture,NewAlpha)
	end
	if(this.ChunkCL) then
		IFImage_fnSetTexture(this.ChunkCL,NewTexture,NewAlpha)
	end
	if(this.ChunkC) then
		IFImage_fnSetTexture(this.ChunkC,NewTexture,NewAlpha)
	end
	if(this.ChunkCR) then
		IFImage_fnSetTexture(this.ChunkCR,NewTexture,NewAlpha)
	end
	if(this.ChunkBL) then
		IFImage_fnSetTexture(this.ChunkBL,NewTexture,NewAlpha)
	end
	if(this.ChunkBC) then
		IFImage_fnSetTexture(this.ChunkBC,NewTexture,NewAlpha)
	end
	if(this.ChunkBR) then
		IFImage_fnSetTexture(this.ChunkBR,NewTexture,NewAlpha)
	end
end

-- fnActivate for a ButtonWindow's Skin. Pulled out so its
-- implementation could be properly shared (refcounted) among all
-- instances
function gButtonWindowSkin_fnActivate(this)
--	print("Write me! (gButtonWindowSkin_fnActivate)")
end

-- Override for setsize -- does so for self, calls it on kids (if present)
function gButtonWindow_fnSetSize(this,w,h)
	this.width = w
	this.height = h
	
	if(this.label) then
		this.label:fnSetSize(w,h)
	end
	if(this.skin) then
		this.skin:fnSetSize(w,h)
	end
end -- function gButtonWindow_fnSetSize

-- Override for setsize -- does so for self, calls it on kids (if present)
function gButtonWindow_fnActivate(this,on)
	local NewTexture

	if(on) then
		NewTexture = this.onTexture
	else
		NewTexture = this.offTexture
	end

	-- Tell kids to do the heavy lifting
	if(this.skin) then
		this.skin:fnActivate(NewTexture,NewSkinAlpha)

		-- Always resize to last expected size (in case we made it bigger while selected)
		if(not on) then
			this.skin:fnSetSize(this.width,this.height)
		end

	end
end -- function gButtonWindow_fnSetSize

-- Override for setsize -- does so for self, calls it on kids (if present)
function gButtonWindow_fnSetTexture(this,NewTexture,NewAlpha)
	if(this.skin) then
		this.skin:fnSetTexture(NewTexture,NewAlpha)
	end
end

-- set the text for button window
function gButtonWindow_fnSetText(this,NewText)
	if(this.titleBarElement) then
		IFText_fnSetString( this.titleBarElement, NewText )
	end
end

-- Like NewIFButton, but puts a nice fancy skin on it.
--
-- NOTE: We canNOT do the "local temp = createObj(gIFRoundButtonTemplate , Template)"
-- approach here, as that'll create just one skin & label, which is
-- shared among all instances. This approach here uses a bit more
-- memory, but should work more reliably - NM 6/25/03

function NewButtonWindow(Template)

	local temp = Template --createObj(gIFRoundButtonTemplate , Template)

	temp.skin = NewIFContainer {
		ZPos = 135, -- Text will be at 128 by default, be a bit behind it

		-- 8 chunks for the pieces of the texture. Note: no texture is specified,
		-- as that's done in fnActivate
		ChunkTL = NewIFImage { uvs_l = 0.00, uvs_t = 0.00, uvs_r = 0.25, uvs_b = 0.25, inert_all = 1},
		ChunkTC = NewIFImage { uvs_l = 0.25, uvs_t = 0.00, uvs_r = 0.75, uvs_b = 0.25, inert_all = 1},
		ChunkTR = NewIFImage { uvs_l = 0.75, uvs_t = 0.00, uvs_r = 1.00, uvs_b = 0.25, inert_all = 1},

		ChunkCL = NewIFImage { uvs_l = 0.00, uvs_t = 0.25, uvs_r = 0.25, uvs_b = 0.75, inert_all = 1},
		ChunkC  = NewIFImage { uvs_l = 0.25, uvs_t = 0.25, uvs_r = 0.75, uvs_b = 0.75,              },
		ChunkCR = NewIFImage { uvs_l = 0.75, uvs_t = 0.25, uvs_r = 1.00, uvs_b = 0.75, inert_all = 1},

		ChunkBL = NewIFImage { uvs_l = 0.00, uvs_t = 0.75, uvs_r = 0.25, uvs_b = 1.00, inert_all = 1},
		ChunkBC = NewIFImage { uvs_l = 0.25, uvs_t = 0.75, uvs_r = 0.75, uvs_b = 1.00, inert_all = 1},
		ChunkBR = NewIFImage { uvs_l = 0.75, uvs_t = 0.75, uvs_r = 1.00, uvs_b = 1.00, inert_all = 1},

		fnSetSize = gButtonWindowSkin_fnSetSize,
		fnActivate = gButtonWindowSkin_fnActivate,
		fnSetTexture = gButtonWindowSkin_fnSetTexture,
	} -- end of skin

	temp.width = temp.width or 200
	temp.height = temp.height or 200

	local Font = Template.font or "gamefont_medium"
	local height = ScriptCB_GetFontHeight(Font)
	
	if(Template.titleText) then
		temp.titleBarElement = NewIFText { 
			x = (temp.width * -0.5) + 18,
			y = (temp.height * -0.5) - height - 5, 
			font = Font, 
			textw = temp.width, texth = height, 
			halign = "left",
			valign = "vcenter",
			string = Template.titleText,
			flashy = 1,
			startdelay = 0.0,
			bg_width = temp.width - 37,
			bgleft = "headerbuttonleft",
			bgmid = "headerbuttonmid",
			bgright = "headerbuttonright",
			bgoffsetx = -11,
			bgoffsety = 0,
			bgexpandx = 0,
			bgexpandy = 0,
			ColorR = 255,
			ColorG = 255,
			ColorB = 255,
			textcolorr = 0,
			textcolorg = 0,
			textcolorb = 0,
			bInertPos = 1,
			ZPos = 135,
			rotY = 0,
		}	
	end	


	temp.onTexture = temp.onTexture or "btn_on_pieces"
	temp.offTexture = temp.offTexture or "btn_off_pieces"

	-- Fill in an resizer function
	temp.fnSetSize = gButtonWindow_fnSetSize
	temp.fnSetTexture = gButtonWindow_fnSetTexture
	temp.fnActivate = Template.fnActivate or gButtonWindow_fnActivate

	temp:fnSetSize(temp.width,temp.height)
	-- Set default texture
	temp:fnSetTexture("border_3_pieces")

	temp.type = temp.type or "buttonwindow"

	-- Make a container from this expanded template
	return NewIFContainer(temp)
end
