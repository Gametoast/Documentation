-- Code, data for a rounded interface button (BorderRect)
--
-- [Requires ifelem_button.lua to be already loaded, executed]
--
-- Broken off from interface_util.lua for better encapsulation


-- fnSetSize for a BorderRect's Skin. Pulled out so its
-- implementation could be properly shared (refcounted) among all
-- instances. Bugs: 32x32 is the smallest size possible
function BorderRectSkin_fnSetSize(this,w,h)
	-- Massive duplication. Sorry. :(
 	local x1 = (w * -0.5)
 	local x2 = (w * -0.5) + 16
 	local x3 = (w *  0.5) - 16
 	local x4 = (w *  0.5)

 	local y1 = (h * -0.5)
 	local y2 = (h * -0.5) + 16
 	local y3 = (h *  0.5) - 16
 	local y4 = (h *  0.5)

	if(this.ChunkTL) then IFImage_fnSetTexturePos(this.ChunkTL,x1,y1,x2,y2) end
	if(this.ChunkTC) then IFImage_fnSetTexturePos(this.ChunkTC,x2,y1,x3,y2) end
	if(this.ChunkTR) then IFImage_fnSetTexturePos(this.ChunkTR,x3,y1,x4,y2) end
	if(this.ChunkCL) then IFImage_fnSetTexturePos(this.ChunkCL,x1,y2,x2,y3) end
	if(this.ChunkC) then IFImage_fnSetTexturePos(this.ChunkC ,x2,y2,x3,y3) end
	if(this.ChunkCR) then IFImage_fnSetTexturePos(this.ChunkCR,x3,y2,x4,y3) end
 	if(this.ChunkBL) then IFImage_fnSetTexturePos(this.ChunkBL,x1,y3,x2,y4) end
 	if(this.ChunkBC) then IFImage_fnSetTexturePos(this.ChunkBC,x2,y3,x3,y4) end
 	if(this.ChunkBR) then IFImage_fnSetTexturePos(this.ChunkBR,x3,y3,x4,y4) end
end

-- fnSelect for a BorderRect's Skin. Pulled out so its
-- implementation could be properly shared (refcounted) among all
-- instances
function BorderRect_fnSetTexture(this,NewTexture,NewAlpha)
	-- Massive duplication. Sorry. :(
	if(this.ChunkTL) then IFImage_fnSetTexture(this.ChunkTL,NewTexture,NewAlpha) end
	if(this.ChunkTC) then IFImage_fnSetTexture(this.ChunkTC,NewTexture,NewAlpha) end
	if(this.ChunkTR) then IFImage_fnSetTexture(this.ChunkTR,NewTexture,NewAlpha) end
	if(this.ChunkCL) then IFImage_fnSetTexture(this.ChunkCL,NewTexture,NewAlpha) end
	if(this.ChunkC)  then IFImage_fnSetTexture(this.ChunkC ,NewTexture,NewAlpha) end
	if(this.ChunkCR) then IFImage_fnSetTexture(this.ChunkCR,NewTexture,NewAlpha) end
	if(this.ChunkBL) then IFImage_fnSetTexture(this.ChunkBL,NewTexture,NewAlpha) end
	if(this.ChunkBC) then IFImage_fnSetTexture(this.ChunkBC,NewTexture,NewAlpha) end
	if(this.ChunkBR) then IFImage_fnSetTexture(this.ChunkBR,NewTexture,NewAlpha) end
end

function BorderRectSkin_fnHilight(this,on,fDt,w,h)
	BorderRectSkin_fnSetSize(this,w,h) -- Off? Revert to standard size.
end


-- Like NewIFButton, but puts a nice fancy skin on it.
--
-- NOTE: We canNOT do the "local temp = createObj(gIFRoundButtonTemplate , Template)"
-- approach here, as that'll create just one skin & label, which is
-- shared among all instances. This approach here uses a bit more
-- memory, but should work more reliably - NM 6/25/03

function NewBorderRect(Template)

	local temp = Template --createObj(gIFRoundButtonTemplate , Template)

	-- 8 chunks for the pieces of the texture. Note: no texture is specified,
	-- as that's done in fnSelect

 	temp.ChunkTL = NewIFImage { uvs_l = 0.00, uvs_t = 0.00, uvs_r = 0.25, uvs_b = 0.25, 
 		inert_all = 1, ZPos = 190, texture = "opaque_rect"}
 	temp.ChunkTC = NewIFImage { uvs_l = 0.25, uvs_t = 0.00, uvs_r = 0.75, uvs_b = 0.25, 
 		inert_all = 1, ZPos = 190, texture = "opaque_rect"}
 	temp.ChunkTR = NewIFImage { uvs_l = 0.75, uvs_t = 0.00, uvs_r = 1.00, uvs_b = 0.25, 
 		inert_all = 1, ZPos = 190, texture = "opaque_rect"}
	
	temp.ChunkCL = NewIFImage { uvs_l = 0.00, uvs_t = 0.25, uvs_r = 0.25, uvs_b = 0.75, 
		inert_all = 1, ZPos = 190, texture = "opaque_rect"}
	temp.ChunkC  = NewIFImage { uvs_l = 0.25, uvs_t = 0.25, uvs_r = 0.75, uvs_b = 0.75, 
		inert_all = 1, ZPos = 190, texture = "opaque_rect"}
	temp.ChunkCR = NewIFImage { uvs_l = 0.75, uvs_t = 0.25, uvs_r = 1.00, uvs_b = 0.75, 
		inert_all = 1, ZPos = 190, texture = "opaque_rect"}
	
	temp.ChunkBL = NewIFImage { uvs_l = 0.00, uvs_t = 0.75, uvs_r = 0.25, uvs_b = 1.00, 
		inert_all = 1, ZPos = 190, texture = "opaque_rect"}
 	temp.ChunkBC = NewIFImage { uvs_l = 0.25, uvs_t = 0.75, uvs_r = 0.75, uvs_b = 1.00, 
 		inert_all = 1, ZPos = 190, texture = "opaque_rect"}
	temp.ChunkBR = NewIFImage { uvs_l = 0.75, uvs_t = 0.75, uvs_r = 1.00, uvs_b = 1.00, 
		inert_all = 1, ZPos = 190, texture = "opaque_rect"}

	if(Template.width) then
		BorderRectSkin_fnSetSize(temp,Template.width,Template.height)
	end

	-- Make an item from this expanded template
	return NewIFContainer(temp)
end
