-- Code, data for a rounded interface button (RoundIFButton)
--
-- [Requires ifelem_button.lua to be already loaded, executed]
--
-- Broken off from interface_util.lua for better encapsulation


-- fnSetSize for a RoundIFButton's Skin. Pulled out so its
-- implementation could be properly shared (refcounted) among all
-- instances. Bugs: 32x32 is the smallest size possible
function RoundIFButtonSkin_fnSetSize(this,w,h)
	-- Massive duplication. Sorry. :(
--  	local x1 = (w * -0.5)
-- -- 	local x2 = (w * -0.5) + 16
-- -- 	local x3 = (w *  0.5) - 16
--  	local x4 = (w *  0.5)

--  	local y1 = (h * -0.5)
-- -- 	local y2 = (h * -0.5) + 16
-- -- 	local y3 = (h *  0.5) - 16
--  	local y4 = (h *  0.5)

-- 	if(this.ChunkTL) then IFImage_fnSetTexturePos(this.ChunkTL,x1,y1,x2,y2) end
-- 	if(this.ChunkTC) then IFImage_fnSetTexturePos(this.ChunkTC,x2,y1,x3,y2) end
-- 	if(this.ChunkTR) then IFImage_fnSetTexturePos(this.ChunkTR,x3,y1,x4,y2) end
-- 	if(this.ChunkCL) then IFImage_fnSetTexturePos(this.ChunkCL,x1,y2,x2,y3) end
-- 	if(this.ChunkC ) then IFImage_fnSetTexturePos(this.ChunkC ,x1,y1,x4,y4) end
-- 	if(this.ChunkCR) then IFImage_fnSetTexturePos(this.ChunkCR,x3,y2,x4,y3) end
-- 	if(this.ChunkBL) then IFImage_fnSetTexturePos(this.ChunkBL,x1,y3,x2,y4) end
-- 	if(this.ChunkBC) then IFImage_fnSetTexturePos(this.ChunkBC,x2,y3,x3,y4) end
-- 	if(this.ChunkBR) then IFImage_fnSetTexturePos(this.ChunkBR,x3,y3,x4,y4) end
end

-- fnSelect for a RoundIFButton's Skin. Pulled out so its
-- implementation could be properly shared (refcounted) among all
-- instances
function RoundIFButtonSkin_fnSelect(this,NewTexture,NewAlpha)
	-- Massive duplication. Sorry. :(
-- 	if(this.ChunkTL) then IFImage_fnSetTexture(this.ChunkTL,NewTexture,NewAlpha) end
-- 	if(this.ChunkTC) then IFImage_fnSetTexture(this.ChunkTC,NewTexture,NewAlpha) end
-- 	if(this.ChunkTR) then IFImage_fnSetTexture(this.ChunkTR,NewTexture,NewAlpha) end
-- 	if(this.ChunkCL) then IFImage_fnSetTexture(this.ChunkCL,NewTexture,NewAlpha) end
-- 	if(this.ChunkC) then IFImage_fnSetTexture(this.ChunkC,NewTexture,NewAlpha) end
-- 	if(this.ChunkCR) then IFImage_fnSetTexture(this.ChunkCR,NewTexture,NewAlpha) end
-- 	if(this.ChunkBL) then IFImage_fnSetTexture(this.ChunkBL,NewTexture,NewAlpha) end
-- 	if(this.ChunkBC) then IFImage_fnSetTexture(this.ChunkBC,NewTexture,NewAlpha) end
-- 	if(this.ChunkBR) then IFImage_fnSetTexture(this.ChunkBR,NewTexture,NewAlpha) end
end

-- fnSetSize for a RoundIFButton's Label. Pulled out so its
-- implementation could be properly shared (refcounted) among all
-- instances
function RoundIFButtonLabel_fnSetSize(this,w,h)
	this.x = w * -0.5
	this.y = h * -0.5
	this.textw = w
	this.texth = h
end

-- fnSelect for a RoundIFButton's Label. Pulled out so its
-- implementation could be properly shared (refcounted) among all
-- instances
function RoundIFButtonLabel_fnSelect(this,on)
	if(on) then
		
		if(not this.bManagedColor) then
--			IFObj_fnSetColor(this,140,180,255) -- Photoshop-safe color
			IFObj_fnSetColor(this,255,255,255) -- Photoshop-safe color
		end
		IFText_fnSetStyle(this,"selected")
	else
		if(not this.bManagedColor) then
--			IFObj_fnSetColor(this,50,70,180) -- Photoshop-safe color
--			IFObj_fnSetColor(this,140,180,255) -- Photoshop-safe color
			IFObj_fnSetColor(this,255,255,255) -- Photoshop-safe color
		end
		IFObj_fnSetAlpha(this,1)
		IFText_fnSetStyle(this,"normal")
	end
end

function RoundIFButtonLabel_fnSetString(this,str)
	IFText_fnSetString(this.label,str)
end

function RoundIFButtonLabel_fnSetUString(this,str)
	IFText_fnSetUString(this.label,str)
end

-- fnHilight for a RoundIFButton's skin -- updates its hilighted state
-- based on dt . Pulled out so its implementation could be properly
-- shared (refcounted) among all instances

gButton_CurSizeAdd = 0.5
gButton_CurDir = 2

function RoundIFButtonLabel_fnHilight(this,on,fDt,w,h)
	if(on) then
 		gButton_CurSizeAdd = gButton_CurSizeAdd + fDt * gButton_CurDir
		if(gButton_CurSizeAdd > 1) then
 			gButton_CurSizeAdd = 1
			gButton_CurDir = -abs(gButton_CurDir)
		elseif (gButton_CurSizeAdd < 0.3) then
 			gButton_CurSizeAdd = 0.3
			gButton_CurDir = abs(gButton_CurDir)
		end

		IFObj_fnSetAlpha(this,gButton_CurSizeAdd)
	end
end

function RoundIFButtonSkin_fnHilight(this,on,fDt,w,h)
-- 	local ButtonSpeed = this.ButtonSpeed or 20
-- --	local ButtonDir = this.ButtonSpeed or 20
-- --	local ButtonAddScale = this.ButtonAddScale or 1
-- 	local ButtonMaxScale = this.ButtonMaxScale or 5
-- 	local ButtonMinScale = this.ButtonMinScale or 0

-- 	if(on) then
-- 		gButton_CurSizeAdd = gButton_CurSizeAdd + fDt * gButton_CurDir
-- 		if(gButton_CurSizeAdd > ButtonMaxScale) then
-- 			gButton_CurDir = -ButtonSpeed
-- 		elseif (gButton_CurSizeAdd < ButtonMinScale) then
-- 			gButton_CurDir = ButtonSpeed
-- 		end
-- 		RoundIFButtonSkin_fnSetSize(this,w+gButton_CurSizeAdd,h+gButton_CurSizeAdd)
-- 	else
-- 		RoundIFButtonSkin_fnSetSize(this,w,h) -- Off? Revert to standard size.
-- 	end
end


-- Like NewIFButton, but puts a nice fancy skin on it.
--
-- NOTE: We canNOT do the "local temp = createObj(gIFRoundButtonTemplate , Template)"
-- approach here, as that'll create just one skin & label, which is
-- shared among all instances. This approach here uses a bit more
-- memory, but should work more reliably - NM 6/25/03

function NewRoundIFButton(Template)

	local temp = Template --createObj(gIFRoundButtonTemplate , Template)

 	temp.label = NewIFText {
		valign = "vcenter",
		inert_all = 1,
		font = Template.font,
		startdelay = Template.startdelay,
		bg_flipped = Template.bg_flipped,
		bg_xflipped = Template.bg_xflipped,
		bg_width = Template.bg_width,
		bg_tail = Template.bg_tail,
		flashy = Template.flashy,
		nocreatebackground = Template.nocreatebackground,		
		rightjustifybackground = Template.rightjustifybackground,
	} -- end of label

	-- Make a button from this expanded template
	return NewIFButton(temp)
end


-- Like NewRoundIFButton, but puts a nice fancy skin on it, makes it clickable
--
-- Most of the RoundButton accessors will work fine on what's created
-- by this.

function NewClickableIFButton(Template)
	local temp = Template --createObj(gIFRoundButtonTemplate , Template)
	
	if(not temp.bg_width and not temp.bg_tail) then
		temp.bg_tail = 20
	end

 	temp.label = NewIFText {
		valign = "vcenter",
		halign = "left",
		inert_all = 1,
		font = Template.font,
		startdelay = Template.startdelay,
		bg_flipped = Template.bg_flipped,
		bg_xflipped = Template.bg_xflipped,
		bg_width = Template.bg_width,
		bg_tail = Template.bg_tail,
		flashy = Template.flashy,
		nocreatebackground = Template.nocreatebackground,		
		rightjustifybackground = Template.rightjustifybackground,
		string = Template.string,
		ustring = Template.ustring,
	} -- end of label
	
	temp.label.bHotspot = 1
	temp.label.fHotspotW = Template.btnw
	temp.label.fHotspotH = Template.btnh

	if(temp.label.bg_xflipped ) then
		temp.label.bgmid   =  "BackButton_Mid"
		temp.label.bgright = "BackButton_Left"
		temp.label.bgleft  = "BackButton_Right"
	else
		temp.label.bgmid   =  "BackButton_Mid"
		temp.label.bgleft  = "BackButton_Left"
		temp.label.bgright = "BackButton_Right"
	end
	temp.label.bgoffsetx   =  -22
	-- Make a button from this expanded template
	return NewIFButton(temp)
end

