-- Utility functions for the StarWars: Frontline interface. These
-- functions are used for the shell and ingame interfaces. Shell-only
-- stuff should go in shell\scripts\shell_util.lua ]

-- From luabook1.pdf -- from a template of new values (init), and a
-- generic template (old), creates a proper merge of the values, with
-- preference given to new values, if they conflict. Returns the
-- merge.
function createObj (old, init)
	local new = init or {}
	local k,v
	for k,v in old do
		if not new[k] then new[k] = v end
	end
	return new
end

-- -------------------------------------------------------------------
-- Templates for the various classes. These contain default values for
-- all of the values and accessor function(s). Individual
-- implementations of each one can specify any to all of the
-- parameters; values are copied over from the template only if not
-- present in the new implementation.

-- Helper functions
function gIFObjTemplate_fnSetSize(this,w,h)
	this.width = w
	this.height = h
end

-- Sets the position. Pass nil for either arg to use current value instead
function IFObj_fnSetZPos(this, aVal)
	if(this.cpointer) then
		ScriptCB_IFObj_SetZOrder(this.cpointer,aVal)
	end
	this.ZPos = aVal
end

-- Sets the position. Pass nil for either arg to use current value instead
function IFObj_fnSetPos(this,x,y,z)
	this.x = x or this.x or 0.0
	this.y = y or this.y or 0.0
	this.z = z or this.z
	if(this.cpointer) then
		ScriptCB_IFObj_SetPos(this.cpointer,this.x,this.y,this.z)
	end
end

function IFObj_fnSetVis(this,v)
--	this.vis = v
	if(this.cpointer) then
		ScriptCB_IFObj_SetVis(this.cpointer,v)
	end
end

function IFObj_fnGetVis(this)
	if(this.cpointer) then
		return ScriptCB_IFObj_GetVis(this.cpointer)
	end
	return 1 -- always on if not yet created
end

-- Sets the color, pushes thru to C++ as needed. Pass nil for any/all
-- values to use current.
function IFObj_fnSetColor(this,R,G,B)
	if(this.cpointer) then
		ScriptCB_IFObj_SetColor(this.cpointer,R,G,B)
	else
		this.ColorR = R or this.ColorR
		this.ColorG = G or this.ColorG
		this.ColorB = B or this.ColorB
	end
end

-- Sets the color, pushes thru to C++ as needed
function IFObj_fnSetAlpha(this,a)
	if(this.cpointer) then
		ScriptCB_IFObj_SetAlpha(this.cpointer,a)
	else
		this.alpha = a
	end
end

gIFObjTemplate = {
	x = 0,
	y = 0,
--	width = 0,
--	height = 0,
--	alpha = 1,

	-- Disabled by default (so as to not propagate down), but presented
	-- here for completion. These values allow items, if their parent
	-- is an IFScreen, to set their screen positioning. [Must set both
	-- X & Y if you want to set either. Default is topleft]

	-- ScreenRelativeX = 0, -- 0 = left, 0.5 = center, 1 = right
	-- ScreenRelativeY = 0, -- 0 = top, 0.5 = center, 1 = bottom
	-- UseSafezone = 1, -- 0 or 1, NOT nil/1. [Otherwise, can't test for presence]

	-- Other items
	-- ZPos = 128, -- 0 = on top of all, 255 = behind all.
	--	vis = 1, -- 1 = enabled, 0 = hidden

	-- If set to 1, this object will be deleted from lua after creating the
	-- C++ version of it. That should save a small amount of memory, but
	-- prevent any further changing of it from the lua side.
	-- inert = nil,

	-- Colors. 
--	ColorR = 255,
--	ColorG = 255,
--	ColorB = 255,
}

function IFText_fnSetString(this,str)
	if(this.cpointer) then
		ScriptCB_IFText_SetString(this.cpointer,str)
		this.string = nil
		this.ustring = nil
		this.font = nil
	else
		this.string = str
	end
end

function IFText_fnSetUString(this,str)
	if(this.cpointer) then
		ScriptCB_IFText_SetUString(this.cpointer,str)
		this.string = nil
		this.ustring = nil
		this.font = nil
	else
		this.ustring = str
	end
end

function IFText_fnSetFont(this,fontname)
	if(this.cpointer) then
		ScriptCB_IFText_SetFont(this.cpointer,fontname)
		this.string = nil
		this.ustring = nil
		this.font = nil
	else
		this.font = str
	end
end

function IFText_fnSetStyle(this,style)
	if(this.cpointer) then
		ScriptCB_IFText_SetTextStyle(this.cpointer,style)
		this.style = nil
	else
		this.style = style
	end
end

function IFText_fnSetScale(this,HScale,VScale)
	if(this.cpointer) then
		ScriptCB_IFText_SetTextScale(this.cpointer,HScale, VScale)
		this.HScale = nil
		this.VScale = nil
	else
		this.HScale = HScale
		this.VScale = VScale
	end
end

function IFFlashyText_fnSetup(this,delay,flipped,width,xflipped,tail)
	if(this.cpointer) then
		ScriptCB_IFFlashyText_Setup(this.cpointer,delay,flipped,width,xflipped,tail)
	end
end

gIFTextTemplate = {
--	type = "text",
	string = "",
	font = "gamefont_small",
	halign = "hcenter", -- horizontal alignment : "left" "hcenter" "right"
	valign = "top", -- one of "top" "vcenter" "bottom"
	textw = 100, -- width onscreen
	texth = 30, -- height onscreen
	style = "glow",
	flashy = 1,     -- intbool: whether its flashy text on creation.  0=no, other-non-nil=yes
	startdelay = 0, -- float: start delay for the flashy animation
	bg_flipped = nil, -- bool: is the bg triangle upside down
	bg_xflipped = nil, -- bool: is the bg triangle upside down
	bg_width = 0,  -- the width of the background image (-1 means use text width)
	bg_tail = 0,  -- widen the background by this much on the right side (works even if the above is -1)
	bgleft = "buttonleft",
	bgmid = "buttonmid",
	bgright = "buttonright",
}
-- this is the global flashy speed for vertical buttons and text, the
-- delay per element as you go down.
flashySpeed = 0.02

-- Sets the localpos_*, pushes it thru to C++ once the name is set
-- (i.e. created in C++). Pass nil for any or all params to use current
function IFImage_fnSetTexturePos(this,l,t,r,b)
	this.localpos_l = l or this.localpos_l
	this.localpos_t = t or this.localpos_t
	this.localpos_r = r or this.localpos_r
	this.localpos_b = b or this.localpos_b
	if(this.cpointer) then
		ScriptCB_IFImage_SetRect(this.cpointer,this.localpos_l,this.localpos_t,this.localpos_r,this.localpos_b)
	end
end -- fnSetTexturePos

-- Sets the UV coords, pushes it thru to C++ once the name is set
-- (i.e. created in C++). Pass nil for any or all params to use current
function IFImage_fnSetUVs(this,l,t,r,b,diag)
	this.uvs_l = l or this.uvs_l
	this.uvs_t = t or this.uvs_t
	this.uvs_r = r or this.uvs_r
	this.uvs_b = b or this.uvs_b
	this.uvs_diag = diag
	if(this.cpointer) then
		ScriptCB_IFImage_SetTexCoords(this.cpointer,this.uvs_l,this.uvs_t,this.uvs_r,this.uvs_b,this.uvs_diag)
	end
end -- fnSetUVs

-- Sets the texture, pushes it thru to C++ once the name is set
-- (i.e. created in C++) [Can also set alpha, if specified, as buttons
-- want to do both operations]
function IFImage_fnSetTexture(this, tex, a)
	this.texture = tex
	if(alpha) then
		this.alpha = a
	end
	if(this.cpointer) then
		ScriptCB_IFImage_SetTexture(this.cpointer,this.texture)
		this.texture = nil
		if(a) then
			ScriptCB_IFObj_SetAlpha(this.cpointer,a)
		end
	end
end -- fnSetTexture

-- Sets the model msh for the specified model, pushes to C as appropriate
function IFModel_fnSetMsh(this, ModelStr)
	if(this.cpointer) then
		this.model = nil
		ScriptCB_IFModel_SetModel(this.cpointer,ModelStr)
	else
		this.model = ModelStr
	end
end

-- Sets the OmegaY for the specified model, pushes to C as appropriate
function IFModel_fnSetOmegaY(this, fOY)
	if(this.cpointer) then
		this.OmegaY = nil
		ScriptCB_IFModel_SetOmegaY(this.cpointer,fOY)
	else
		this.OmegaY = fOy
	end
end

-- Sets the Scale for the specified model, pushes to C as appropriate
function IFModel_fnSetScale(this, fScale)
	if(this.cpointer) then
		this.scale = nil
		ScriptCB_IFModel_SetScale(this.cpointer,fScale)
	else
		this.scale = fScale
	end
end

gIFImageTemplate = {
--	texture = "blank", -- Ought to be specified, will show nothing if invalid
	localpos_l = 0,
	localpos_t = 0,
	localpos_r = 100,
	localpos_b = 100,

	uvs_l = 0,
	uvs_t = 0,
	uvs_r = 1,
	uvs_b = 1,
	uvs_diag = nil, -- swap the uvs along the diagonal
}

gIFModelTemplate = {
	-- Defaults. Probably need overriding anyhow.
	scale = 0.5,
	depth = 2.6,
	lighting = nil,
}


-- -------------------------------------------------------------------
-- Constructors for various classes. All of these take a table, 'arg'
-- and fills in any missing (but required) components.

function NewIFObj(Template)
	local temp = Template
	temp.x = temp.x or 0
	temp.y = temp.y or 0
	return temp -- createObj(gIFObjTemplate,Template)
end

-- More complex base types are built by calling the constructors of
-- each sub-type, MOST complex to LEAST. (Remember, the createObj
-- fills in values not specified (yet), so things like the type string
-- need to be inherited from the most complex one)
function NewIFText(Template)
	local temp = createObj(gIFTextTemplate, Template)
	temp.type = "text"

	-- Hack? If this is flagged as centered, and didn't specify an x/y position,
	-- then auto-calculate that for it.
	if((temp.halign == "hcenter") and not temp.x) then
		temp.x = temp.textw * -0.5
	end
	if((temp.valign == "vcenter") and not temp.y) then
		temp.y = temp.texth * -0.5
	end

	return createObj(gIFObjTemplate, temp)
end

function NewIFImage(Template)
	local temp = createObj(gIFImageTemplate, Template)
	temp.type = temp.type or "image"
	if(temp.AutoHotspot) then
 		temp.tag = temp.tag or temp.AutoHotspot
 		temp.AutoHotspot = nil
 		temp.bHotspot = 1
		temp.fHotspotW = abs(temp.localpos_r - temp.localpos_l)
		temp.fHotspotH = abs(temp.localpos_b - temp.localpos_t)
		temp.fHotspotX = min(temp.localpos_r,temp.localpos_l)
		temp.fHotspotY = min(temp.localpos_t,temp.localpos_b)
	end
	return createObj(gIFObjTemplate, temp)
end

function NewIFModel(Template)
	local temp = createObj(gIFModelTemplate, Template)
	temp.type = temp.type or "model"
	temp.fnSetSize = IFModel_fnSetScale
	return createObj(gIFObjTemplate, temp)
end

function NewIFContainer(Template)
	local temp = createObj(gIFObjTemplate, Template)
	temp.type = temp.type or "container"
	return temp
end

-- -------------------------------------------------------------------
-- Replicators for various classes. All of these take a table, 'obj'
-- and creates a C++ class hierarchy from them.

-- For a currently open object, push the IFObject components
function AddIFObjectBase(obj)
	-- Gets the pointer to the object, stores it for later
	obj.cpointer = ScriptCB_IFObj_GetCPointer()

	ScriptCB_IFObj_SetPos(obj.x or 0.0, obj.y or 0.0, obj.z or 0.0)
	if(obj.bInertPos) then
		obj.x = nil
		obj.y = nil
		obj.bInertPos = nil
	end
	
	-- rotate?
	if(obj.rotX or obj.rotY or obj.rotZ) then
		ScriptCB_IFObj_SetRotation(obj.rotX or 0, obj.rotY or 0, obj.rotZ or 0)
		obj.rotX = nil
		obj.rotY = nil
		obj.rotZ = nil
	end

	if(obj.alpha) then
		ScriptCB_IFObj_SetAlpha(obj.alpha)
	end

	if(obj.ScreenRelativeX) then
		ScriptCB_IFObj_SetScreenPosition(obj.ScreenRelativeX,obj.ScreenRelativeY)
	end
	if(obj.UseSafezone) then
		ScriptCB_IFObj_SetUseSafezone(obj.UseSafezone)
	end
	if(obj.ZPos) then
		ScriptCB_IFObj_SetZOrder(obj.ZPos)
--		obj.ZPos = nil
	end
	if(obj.ColorR) then
		ScriptCB_IFObj_SetColor(obj.ColorR,obj.ColorG,obj.ColorB)
	end

	if (obj.bHotspot) then
		if (obj.fHotspotW and obj.fHotspotH) then
			if (obj.fHotspotX and obj.fHotspotY) then
				ScriptCB_IFObj_CreateHotSpot(obj.cpointer, obj.fHotspotX, obj.fHotspotY, obj.fHotspotX + obj.fHotspotW, obj.fHotspotY + obj.fHotspotH)
			else
				ScriptCB_IFObj_CreateHotSpot(obj.cpointer, obj.fHotspotW, obj.fHotspotH)
			end
		elseif (obj.fHotspotBorder) then
			ScriptCB_IFObj_CreateHotSpot(obj.cpointer, obj.fHotspotBorder)
		else
			ScriptCB_IFObj_CreateHotSpot(obj.cpointer)
		end
		obj.bHotspot = nil
		obj.fHotspotW = nil
		obj.fHotspotH = nil
		obj.fHotspotX = nil
		obj.fHotspotY = nil
		obj.fHotspotBorder = nil
	end
end

function AddIFText(obj, name)
	if(obj.flashy and (not (obj.flashy == 0))) then
		ScriptCB_AddIFFlashyText(name)
		ScriptCB_IFFlashyText_Setup(obj.startdelay,obj.bg_flipped,obj.bg_width,obj.bg_xflipped,obj.bg_tail)
		--obj.bg_width = nil
		if(not obj.nocreatebackground) then
			ScriptCB_IFFlashyText_SetBackground(obj.bgleft,obj.bgmid,obj.bgright)
		end
		obj.nocreatebackground = nil
		obj.bgleft = nil
		obj.bgmid = nil
		obj.bgright = nil
		ScriptCB_IFFlashyText_SetBackgroundSize(obj.bgoffsetx,obj.bgoffsety,obj.bgexpandx,obj.bgexpandy)
		obj.bgoffsetx = nil
		obj.bgoffsety = nil
		obj.bgexpandx = nil
		obj.bgexpandy = nil
		ScriptCB_IFFlashyText_SetBackgroundRightJustify(obj.rightjustifybackground)
		obj.rightjustifybackground = nil
		if(obj.textcolorr) then
			ScriptCB_IFFlashyText_SetTextColor(obj.textcolorr,obj.textcolorg,obj.textcolorb)
		end
		obj.textcolorr = nil
		obj.textcolorg = nil
		obj.textcolorb = nil
	else
		ScriptCB_AddIFText(name)
	end
	AddIFObjectBase(obj)
	ScriptCB_IFText_SetFont(obj.font)
	ScriptCB_IFText_SetJustify(obj.halign,obj.valign)
	ScriptCB_IFText_SetTextBox(obj.textw,obj.texth)

	if(obj.leading) then
		ScriptCB_IFText_SetLeading(obj.leading)
	end

	if(obj.HScale) then
		ScriptCB_IFText_SetTextScale(obj.HScale,obj.VScale)
		obj.HScale = nil
		obj.VScale = nil
	end


	-- Must set text last (only position, alpha, color ok to set after this)
	if(obj.ustring) then
		ScriptCB_IFText_SetUString(obj.ustring)
	elseif (obj.string) then
		ScriptCB_IFText_SetString(obj.string)
	end

	if(obj.style) then
		ScriptCB_IFText_SetTextStyle(obj.style)
	end

	if(not obj.ColorR) then
-- 		-- Defaults for any w/o explicit color setting
-- 		ColorR = 194, --136,
-- 		ColorG = 42, --25,
-- 		ColorB = 38, --14,
--		ScriptCB_IFObj_SetColor(76,180,255)
		ScriptCB_IFObj_SetColor(255,255,255)
	end

	if(obj.inert_all) then
		obj.string = nil
		obj.ustring = nil
		obj.font = nil
		--		obj.textw = nil
		--		obj.texth = nil
		obj.x = nil
		obj.y = nil
		obj.inert_all = nil
		obj.type = nil
		--don't inert this since we need to know it later (to start the flashiness)
		--	obj.flashy = nil 
		obj.startdelay = nil
		obj.bg_flipped = nil
		obj.bg_xflipped = nil
		obj.bg_tail = nil
	end -- obj.inert_all is present

	ScriptCB_EndIFObj(name)
end

function AddIFImage(obj, name)
	if(obj.type == "image") then
		ScriptCB_AddIFImage(name)
	else
		ScriptCB_AddIFMaskImage(name)
	end
	AddIFObjectBase(obj)
	if(obj.texture) then
		ScriptCB_IFImage_SetTexture(obj.texture)
--		obj.texture = nil
	end
	ScriptCB_IFImage_SetRect(obj.localpos_l,obj.localpos_t,obj.localpos_r,obj.localpos_b)
	ScriptCB_IFImage_SetTexCoords(obj.uvs_l,obj.uvs_t,obj.uvs_r,obj.uvs_b,obj.uvs_diag)

	if((obj.inertUVs) or (obj.inert_all)) then
		obj.uvs_l = nil
		obj.uvs_t = nil
		obj.uvs_r = nil
		obj.uvs_b = nil
		obj.inertUVs = nil
	end
	if(obj.inert_all) then
		obj.texture = nil
		obj.inert_all = nil
		obj.x = nil
		obj.y = nil
		obj.type = nil
		obj.localpos_l = nil
		obj.localpos_t = nil
		obj.localpos_r = nil
		obj.localpos_b = nil
	end

	if(obj.type == "maskimage") then
		if(obj.masktexture) then
			ScriptCB_IFMaskImage_SetMaskTexture(obj.masktexture)
		end
	end

	ScriptCB_EndIFObj(name)
end


function AddIFModel(obj, name)
	ScriptCB_AddIFModel(name)
	AddIFObjectBase(obj)
	if(obj.model) then
		ScriptCB_IFModel_SetModel(obj.model)
	end

	if(obj.scale) then
		ScriptCB_IFModel_SetScale(obj.scale)
	end
	if(obj.depth) then
		ScriptCB_IFModel_SetDepth(obj.depth)
	end
	if(obj.OmegaY) then
		ScriptCB_IFModel_SetOmegaY(obj.OmegaY)
	end
	if(obj.lighting) then
		ScriptCB_IFModel_SetLighting(obj.lighting)
	end

	ScriptCB_EndIFObj(name)
end

-- Trims unneded items from the specified container
function DoPostDelete(c)

	if(nil) then
	-- Release lua objects once created in C++, if requested.
	local k,v
	for k,v in c do
		if(type(v) == "table") then
			if(v.inert) then
				c[k] = nil
			else
				if(v.type ~= "image") then
					v.x = nil
					v.y = nil
				end
				v.type = nil -- always release
				local SmallV = createObj(v)
				c[k] = nil
				c[k] = SmallV
			end -- not inert
		end -- v is a table
	end -- loop over c
	end
end

function AddIFObjContainer(c, name)
	-- Sanity-check!
	if(c == nil) then
--		print("Uhoh... attempting to add nil container " .. name)
		return
	end

	-- Set a name on this item so that it can be looked up later
	-- by button navigation items, etc. Don't override existing name
	-- if already present.
--	c.name = c.name or name

	-- Do specific leaf-node subtypes here.
	if(c.type == "text") then
		AddIFText(c, name)
		return
	elseif ((c.type == "image") or (c.type == "maskimage")) then
		AddIFImage(c, name)
		return
	elseif (c.type == "model") then
		AddIFModel(c, name)
		return
	end

	-- All IFObject params must be pushed, FIRST, then all child objects
	-- in order to set everything up. [IFScreens don't need the root obj
	-- [re]created]
	if(c.type ~= "screen") then
		ScriptCB_AddIFContainer(name)
		AddIFObjectBase(c) -- common stuff
		ScriptCB_EndIFObj(name) -- close it off
	end
	
-- 	if((c.type == "container") or (c.type == "button") or (c.type == "galaxy") or
-- 					(c.type == "listbox") or (c.type == "screen") or (c.type == "hslider") or
-- 						(c.type == "editbox")) then
-- 	else
-- 		print("Uhoh, type = ", c.type)
-- 	end

-- 	assert(((c.type == "container") or (c.type == "button") or (c.type == "galaxy") or
-- 					(c.type == "listbox") or (c.type == "screen") or (c.type == "hslider") or
-- 						(c.type == "editbox")), 
-- 				 "This is a container")

	local k,v
	for k,v in c do
		if(type(v) == "table") then
			local newname = name .. "." .. k;
			AddIFObjContainer(v, newname)
		end -- v is a table
	end

	-- Release this container once created in C++, if requested.
	c.inert_all = nil
	if(c.inert) then
		c = nil
	end
end



function AddIFScreen(table, name)
	assert((table.type == "screen"), "This is a screen")

	ScriptCB_AddIFScreen(name)
	AddIFObjContainer(table, name)
	if(table.Viewport) then
		ScriptCB_SetIFScreenViewport(name,table.Viewport)
	end
	ScriptCB_EndIFScreen(name)
	table.ScreenName = name
end

-- Creates a popup in C, given a table and a string name
function CreatePopupInC(table, name)
	assert((table.type ~= "screen"), "This isn't a screen")
	table.name = name -- so it can be found later

	AddIFObjContainer(table,name)
end

-- Trims unneded items from the specified container
function DoPostDelete(c)
	-- Release lua objects once created in C++, if requested.
	local new = {}

	local k,v
	for k,v in c do
		if(type(v) == "table") then
			if(not v.inert) then
				new[k] = DoPostDelete(v)
			end
		else -- v isn't a table. Copy over.
			new[k] = v
		end -- v is a table
	end -- loop over c

	return new
end

-- -------------------------------------------------------------------
-- Utility functions


-- Adds a set of vertical buttons to the destination container,
-- 'dest'.  The layout is specified in the table 'layout', with the
-- actual buttons in 'layout.buttonlist'. Defaults are provided for
-- the layout table if not specified. Sets current button to first.
--
-- Members of layout may include:
--   yTop (float) : y-position of top element (auto-centered if omitted)
--   yHeight (float) : vertical height of each button
--   ySpace (float) : vertical spacing between elements
--   width (float) : width of each button
--   font (float) : font to be used each button
--   [to be added]
function AddVerticalButtons(dest,layout)
	-- Fill in defaults for the layout table if needed
	local Font = layout.font or "gamefont_small"
	-- set layout yHeight if not specified
	layout.yHeight = layout.yHeight or ScriptCB_GetFontHeight(Font)
	local yHeight = layout.yHeight
	local ySpacing = layout.ySpacing or 10
	local width = layout.width or 100
	local bFlatButton = layout.FlatButtons
	local xStart = layout.xStart or 0
	
	if(layout.RightJustify) then
		layout.noflashycenter = 1
	end
	

	local i
	local Count = getn(layout.buttonlist)
	local yTop = layout.yTop or ((Count * (yHeight + ySpacing)) * -0.5)

	-- Quick first pass: make sure tagnames are set for all of the items, fill in
	-- defaults if not. (Needed for linking)
	-- also calculate the max width of all buttons for the background
	local bgwidth = 0
	local maxbgwidth = 0
	for i = 1,Count do
		layout.buttonlist[i].tag = layout.buttonlist[i].tag or format("vbutton%d",i)
		-- max width
        local w = layout.buttonlist[i].width or width
        bgwidth = max(bgwidth,w)
	end
	--save the start value for later (ShowHide...)
	layout.maxBGWidth = bgwidth
	--if count is odd, start it further out since the very last one will be shorter
	if( mod(Count,2) == 1 ) then
		bgwidth = bgwidth + yHeight + ySpacing
	end
	
	-- is there a title bar?
	if( layout.title ) then	
		local ypos = yTop - 1.75 * (yHeight + ySpacing)

		dest["_titlebar_"] = NewIFText { 
			y = ypos, 
			x = (yHeight + ySpacing) * 0.5 + xStart,
			font = Font, 
			textw = width, texth = yHeight, 
			halign = "left",
			valign = "vcenter",
			string = layout.title,
			flashy = layout.flashy,
			startdelay = 0.0,
			bg_width = bgwidth - 1.25 * (yHeight - ySpacing),
			bgleft = "headerbuttonleft",
			bgmid = "headerbuttonmid",
			bgright = "headerbuttonright",
			bgoffsetx = -(yHeight + ySpacing) * 0.825,
			bgoffsety = 0,
			bgexpandx = -(yHeight + ySpacing) * 0.325,
			bgexpandy = (yHeight + ySpacing) * 0.25,
			ColorR = 255,
			ColorG = 255,
			ColorB = 255,
			textcolorr = 0,
			textcolorg = 0,
			textcolorb = 0,
			bInertPos = 1,
			rotY = layout.rotY,
			rotX = layout.rotX,
			rotZ = layout.rotZ,
		}	
	end

	-- Now do the real work
	for i = 1,Count do
		if(layout.buttonlist[i]) then
			local label = layout.buttonlist[i].tag

			local width2 = layout.buttonlist[i].width or width
			
			
			local half = floor(Count/2)
			local flipped = i > half;

			-- 		if(bFlatButton) then
			-- 			dest[label] = NewFlatIFButton { y = yTop, btnw = width2, btnh = yHeight, font = Font}
			-- 		else
			dest[label] = NewRoundIFButton { 
				x = xStart,
				y = yTop, 
				btnw = width2, 
				btnh = yHeight,
				font = Font, 
				bg_flipped = flipped, 
				startdelay = i*flashySpeed, 
				bg_width = bgwidth, 
				flashy = layout.flashy,
				nocreatebackground = layout.nocreatebackground,
				rightjustifybackground = layout.RightJustify,
				--bInertPos = 1,
				rotY = layout.rotY,
				rotX = layout.rotX,
				rotZ = layout.rotZ,
			}

			dest[label].label.bHotspot = 1
			dest[label].label.fHotspotW = width2
			dest[label].label.fHotspotH = yHeight

			--		end
			if(i < half) then
			    bgwidth = bgwidth + yHeight + ySpacing
			elseif(i > half) then
			    bgwidth = bgwidth - yHeight - ySpacing
			end
			maxbgwidth = max(maxbgwidth,bgwidth)
			
			
			dest[label].font = nil
			RoundIFButtonLabel_fnSetString(dest[label],layout.buttonlist[i].string)
			dest[label].tag = layout.buttonlist[i].tag

			-- Right justify if requested
			if(layout.RightJustify) then
				dest[label].x = width * -0.5
				dest[label].label.halign = "right"
			elseif( (not (layout.flashy==0)) or layout.LeftJustify) then
				dest[label].label.x = 0
				dest[label].label.halign = "left"
			end

			-- Activate the top button, nothing else.
			IFButton_fnSelect(dest[label],i == 1)

			-- Set up relative links for up/down. Turned to full links later.
			if(i > 1) then
				dest[label].link_up = layout.buttonlist[i - 1].tag
			else
				dest[label].link_up = layout.buttonlist[Count].tag
			end
			if(i < Count) then
				dest[label].link_down = layout.buttonlist[i + 1].tag
			else
				dest[label].link_down = layout.buttonlist[1].tag
			end

			if(layout.buttonlist[i].hidden) then
				IFObj_fnSetVis(dest[label],nil)
			else
				if(layout.buttonlist[i].yAdd) then
					yTop = yTop + layout.buttonlist[i].yAdd
				end
				yTop = yTop + yHeight + ySpacing
			end
		end
	end
	
	-- if the layout is flashy, center the entire thing (unless we specify not to)
	if(not (layout.flashy==0)) then
		if(not layout.noflashycenter) then
			dest.x = -maxbgwidth * 0.5
		end
	end
	

	-- Returns the first button, so caller can archive it (or toss it
	-- away, no big deal)
	dest.TagOfFirst = layout.buttonlist[1].tag
	return layout.buttonlist[1].tag
end




-- Utility function - based on the .hidden flag in buttons (already
-- created), shows/hides buttons. Adjusts spacing too. Returns tag of
-- first selectable button.
function ShowHideVerticalButtons(dest,layout, hideall)
	local yHeight = layout.yHeight or 40
	local ySpacing = layout.ySpacing or 10
	local width = layout.width or 100

	local i,VisCount
	local Count = getn(layout.buttonlist)
	local TagOfFirst = nil

	if(hideall) then 
		for i = 1,Count do
			local label = layout.buttonlist[i].tag
			if(hideall == 1) then
--				print("Hiding all")
				dest[label].hidden = 1
			else
--				print("UnHiding All")
				dest[label].hidden = nil
			end
		end
	end
	
	VisCount = 0
	for i = 1,Count do
		local label = layout.buttonlist[i].tag
		if(not dest[label].hidden) then
			VisCount = VisCount + 1
		end
	end

--	print("VisCount=",VisCount)

	local yTop = layout.yTop or ((VisCount * (yHeight + ySpacing)) * -0.5)

	local xPos = 0
	-- Right justify if requested
	if(layout.RightJustify) then
		xPos = width * -0.5
	end
	
	-- max background width
	local bgwidth = layout.maxBGWidth
	
	
	-- is there a title bar?
	if( layout.title ) then	
		local ypos = yTop - 1.75 * (yHeight + ySpacing)
		local lxpos = (yHeight + ySpacing) * 0.5
		IFObj_fnSetPos(dest["_titlebar_"], xPos + lxpos, ypos)
		if( not (layout.flashy==0) ) then
			IFFlashyText_fnSetup(dest["_titlebar_"], 0, nil, bgwidth - 1.25*(yHeight-ySpacing),nil,0)
		end
	end

	--
	local cnt = 1
	for i = 1,Count do
		local label = layout.buttonlist[i].tag
		if(dest[label].hidden) then
			IFObj_fnSetVis(dest[label], nil)
		else
			-- not hidden. Show it
			TagOfFirst = TagOfFirst or label -- note which was the first

			IFObj_fnSetVis(dest[label], 1)
			IFObj_fnSetPos(dest[label], xPos, yTop)
			yTop = yTop + yHeight + ySpacing

			-- resize the flashy text element
			if( not (layout.flashy==0)) then
				local half = floor(VisCount/2)
				IFFlashyText_fnSetup(dest[label].label, cnt*0.1, cnt>half, bgwidth, nil, 0)
				if(cnt < half) then
				    bgwidth = bgwidth + yHeight + ySpacing
				elseif(cnt > half) then
					bgwidth = bgwidth - yHeight - ySpacing
				end
			end
			cnt = cnt + 1
			
		end -- showing this one
	end

	return TagOfFirst
end

-- Same as AddVerticalButtons, but a horizontal arrangement
function AddHorizontalButtons(dest,layout)
	-- Fill in defaults for the layout table if needed
	local xWidth = layout.xWidth or 40
	local xSpacing = layout.xSpacing or 10
	local height = layout.height or 40
	local Font = layout.font or "gamefont_small"
	local yTop = layout.yTop or 0
	local xLeft
	local i
	local zPos = layout.ZPos or 200
	local Count = getn(layout.buttonlist)

	if(layout.xLeft) then
		xLeft = layout.xLeft
	else
		xLeft = ((Count - 1) * (xWidth + xSpacing)) * -0.5
	end

	-- Quick first pass: make sure tagnames are set for all of the items, fill in
	-- defaults if not. (Needed for linking)
	for i = 1,Count do
		layout.buttonlist[i].tag = layout.buttonlist[i].tag or format("hbutton%d",i)
	end

	local bgLeft = nil
	local bgMid = nil
	local bgRight = nil
	if( layout.allTitles ) then
		bgLeft = "headerbuttonleft"
		bgMid= "headerbuttonmid"
		bgRight = "headerbuttonright"
	end
	-- Now do the real work
	for i = 1,Count do
		local label = layout.buttonlist[i].tag
		
		dest[label] = NewRoundIFButton 
		{ x = xLeft, y = yTop, btnw = xWidth, btnh = height, font = Font, nocreatebackground = layout.nocreatebackground, ZPos = zPos,  
			bgleft = bgLeft,
			bgmid = bgMid,
			bgright = bgRight,
		} --bInertPos = 1,}

		dest[label].label.bHotspot = 1
		dest[label].label.fHotspotW = dest[label].btnw
		dest[label].label.fHotspotH = dest[label].btnh
		--dest[label].label.fHotspotX = dest[label].x
		--dest[label].label.fHotspotY = dest[label].y
		dest[label].label.flashy = nil
		dest[label].flashy = nil
		dest[label].Flashy = nil

		dest[label].font = nil
		RoundIFButtonLabel_fnSetString(dest[label],layout.buttonlist[i].string)
		dest[label].tag = layout.buttonlist[i].tag

		-- Activate the top button, nothing else.
		IFButton_fnSelect(dest[label],i == 1)

		-- Set up relative links for left/right. Turned to full links later.
		if(i > 1) then
			dest[label].link_left = layout.buttonlist[i - 1].tag
		else
			dest[label].link_left = layout.buttonlist[Count].tag
		end
		if(i < Count) then
			dest[label].link_right = layout.buttonlist[i + 1].tag
		else
			dest[label].link_right = layout.buttonlist[1].tag
		end

		xLeft = xLeft + xWidth + xSpacing
	end

	-- Returns the first button, so caller can archive it (or toss it
	-- away, no big deal)
	return layout.buttonlist[1].tag
end

-- Utility function - based on the .hidden flag in buttons (already
-- created), shows/hides buttons. Adjusts spacing too. Returns tag of
-- first selectable button.
function ShowHideHorizontalButtons(dest,layout)
--	print("dest=", dest, "layout =", layout)

	-- Fill in defaults for the layout table if needed
	local xWidth = layout.xWidth or 40
	local xSpacing = layout.xSpacing or 10
	local height = layout.height or 40
	local Font = layout.font or "gamefont_small"
	local yTop = layout.yTop or 0
	local xLeft
	local i
	local Count = getn(layout.buttonlist)

	VisCount = 0
	for i = 1,Count do
		local label = layout.buttonlist[i].tag
		if(not dest[label].hidden) then
			VisCount = VisCount + 1
		end
	end

	if(layout.xLeft) then
		xLeft = layout.xLeft
	else
		xLeft = ((VisCount - 1) * (xWidth + xSpacing)) * -0.5
	end

	for i = 1,Count do
		local label = layout.buttonlist[i].tag
		if(dest[label].hidden) then
			IFObj_fnSetVis(dest[label], nil)
		else
			-- not hidden. Show it
			TagOfFirst = TagOfFirst or label -- note which was the first

			IFObj_fnSetVis(dest[label], 1)
			IFObj_fnSetPos(dest[label], xLeft, yTop)
			xLeft = xLeft + xWidth + xSpacing
		end -- showing this one
	end

	return TagOfFirst
end



-- Adds a set of vertical text to the destination container, 'dest'.
-- The layout is specified in the table 'layout', with the actual text
-- in 'layout.buttonlist'. Defaults are provided for the layout table
-- if not specified. 
--
-- Members of layout may include:
--   yTop (float) : y-position of top element (auto-centered if omitted)
--   yHeight (float) : vertical height of each button
--   ySpace (float) : vertical spacing between elements
--   width (float) : width of each button
--   font (float) : font to be used each button
--   [to be added]
function AddVerticalText(dest,layout)
	-- Fill in defaults for the layout table if needed
	local yHeight = layout.yHeight or 40
	local ySpacing = layout.ySpacing or 10
	local width = layout.width or 100
	local Font = layout.font or "gamefont_small"
	local bFlatButton = layout.FlatButtons
	local xStart = layout.xStart or nil

	local i
	local Count = getn(layout.buttonlist)
	local yTop = layout.yTop or ((Count * (yHeight + ySpacing)) * -0.5)

	-- calculate the max width of all buttons for the background
	local bgwidth = 0
	local maxbgwidth = 0
	for i = 1,Count do
        bgwidth = max(bgwidth, layout.buttonlist[i].width or width )
	end
	--save the start value for later (ShowHide...)
	layout.maxBGWidthT = bgwidth
	--if count is odd, start it further out since the very last one will be shorter
	if( mod(Count,2) == 1 ) then
		bgwidth = bgwidth + yHeight + ySpacing
	end

	-- Now do the real work
	for i = 1,Count do
		local label = layout.buttonlist[i].tag

		local half = floor(Count/2)-1
		local flipped = i > half;

		-- Right justify if requested
		local lhalign = "left"
		if(layout.RightJustifyT) then
			lhalign = "right"
		end

		dest[label] = NewIFText 
		{ 
			y = yTop + yHeight * -0.5, 
			x = xStart,
			font = Font, 
			textw = width, texth = yHeight, 
			halign = lhalign, valign = "vcenter", 
			string = layout.buttonlist[i].title,
			bg_flipped = flipped, 
			startdelay = i*flashySpeed, 
			bg_width = bgwidth, 
			flashy = layout.flashy,
			nocreatebackground = layout.nocreatebackground,
			rightjustifybackground = layout.RightJustify,	
			bInertPos = 1,
			rotY = layout.rotY,
			rotX = layout.rotX,
			rotZ = layout.rotZ,
		}

		if(i < half) then
			bgwidth = bgwidth + yHeight + ySpacing
		elseif(i > half) then
			bgwidth = bgwidth - yHeight - ySpacing
		end
		maxbgwidth = max(maxbgwidth,bgwidth)

		
		if(layout.buttonlist[i].yAdd) then
			yTop = yTop + layout.buttonlist[i].yAdd
		end

		yTop = yTop + yHeight + ySpacing
	end

	-- Returns the first button, so caller can archive it (or toss it
	-- away, no big deal)
	return layout.buttonlist[1].tag
end


-- Like ShowHideVerticalButtons, this does the parallel work for the
-- text items. It reads the hidden flag out of items, and hides/ moves
-- them as necessary
function ShowHideVerticalText(dest,layout)
	-- Fill in defaults for the layout table if needed
	local yHeight = layout.yHeight or 40
	local ySpacing = layout.ySpacing or 10
	local width = layout.width or 100
	local Font = layout.font or "gamefont_small"
	local bFlatButton = layout.FlatButtons
	local xStart = layout.xStart or 0

	local i,VisCount
	local Count = getn(layout.buttonlist)
	VisCount = 0
	for i = 1,Count do
		local label = layout.buttonlist[i].tag
		if(not dest[label].hidden) then
			VisCount = VisCount + 1
		end
	end
	local yTop = layout.yTop or ((VisCount * (yHeight + ySpacing)) * -0.5)

	-- max background width
	local bgwidth = layout.maxBGWidthT

	-- Now do the real work
	local cnt = 1
	for i = 1,Count do
		local label = layout.buttonlist[i].tag
		if(dest[label].hidden) then
			IFObj_fnSetVis(dest[label], nil)
		else
			-- not hidden. Show it

			IFObj_fnSetVis(dest[label], 1)
			IFObj_fnSetPos(dest[label], xStart, yTop + (gIFTextTemplate.texth) * -0.5)
			yTop = yTop + yHeight + ySpacing
			
			-- resize the flashy text element
			if( not (layout.flashy==0)) then
				local half = floor(VisCount/2)
				IFFlashyText_fnSetup(dest[label], cnt*0.2, cnt>half, bgwidth, nil, 0)
				if(cnt < half) then
				    bgwidth = bgwidth + yHeight + ySpacing
				elseif(cnt > half) then
					bgwidth = bgwidth - yHeight - ySpacing
				end
			end
			cnt = cnt + 1
			
		end
	end
end


-- Adds a set of vertical Options (text with a L/R arrow) to the
-- destination container, 'dest'.  The layout is specified in the
-- table 'layout', with the actual buttons in
-- 'layout.buttonlist'. Defaults are provided for the layout table if
-- not specified. Sets current button to first.
--
-- Members of layout may include:
--   yTop (float) : y-position of top element (auto-centered if omitted)
--   yHeight (float) : vertical height of each button
--   ySpace (float) : vertical spacing between elements
--   width (float) : width of each button
--   font (float) : font to be used each button
--   [to be added]
function AddVerticalOptions(dest,layout)
	-- Fill in defaults for the layout table if needed
	local yHeight = layout.yHeight or 40
	local ySpacing = layout.ySpacing or 10
	local width = layout.width or 100
	local HalfWidth = width * 0.5
	local Font = layout.font or "gamefont_small"

	local i
	local Count = getn(layout.buttonlist)
	local yTop = layout.yTop or ((VisCount * (yHeight + ySpacing)) * -0.5)

	-- Quick first pass: make sure tagnames are set for all of the items, fill in
	-- defaults if not. (Needed for linking)
	for i = 1,Count do
		layout.buttonlist[i].tag = layout.buttonlist[i].tag or format("hbutton%d",i)
	end

	-- Now do the real work
	for i = 1,Count do
		local label = layout.buttonlist[i].tag
		local yPos = yTop + (gIFTextTemplate.texth) * -0.5

		dest[label] = NewRoundIFButton { y = yPos, btnw = width, btnh = yHeight, font = Font,} --bInertPos = 1}
		dest[label].font = nil
		dest[label].label.valign = "vcenter"
		if(layout.buttonlist[i].string) then
			RoundIFButtonLabel_fnSetString(dest[label],layout.buttonlist[i].string)
		end

		-- Activate the top button, nothing else.
		IFButton_fnSelect(dest[label],i == 1)

		-- Set up relative links for up/down. Turned to full links later.
		if(i > 1) then
			dest[label].link_up = layout.buttonlist[i - 1].tag
		else
			dest[label].link_up = layout.buttonlist[Count].tag
		end
		if(i < Count) then
			dest[label].link_down = layout.buttonlist[i + 1].tag
		else
			dest[label].link_down = layout.buttonlist[1].tag
		end

		yPos = yPos - 6 -- better align arrows w/ text

 		label = layout.buttonlist[i].tag .. "_l"
 		dest[label] = NewIFImage { y = yPos, x = -HalfWidth,
 			texture = "arrow_l", localpos_l = -8, localpos_r = 8, localpos_t = 0, localpos_b = 16,
			inertUVs= 1
		}

 		label = layout.buttonlist[i].tag .. "_r"
 		dest[label] = NewIFImage { y = yPos, x = HalfWidth,
 			texture = "arrow_r", localpos_l = -8, localpos_r = 8, localpos_t = 0, localpos_b = 16,
			inertUVs= 1
		}

		if(layout.buttonlist[i].yAdd) then
			yTop = yTop + layout.buttonlist[i].yAdd
		end

		yTop = yTop + yHeight + ySpacing
	end

	-- Returns the first button, so caller can archive it (or toss it
	-- away, no big deal)
	return layout.buttonlist[1].tag
end


-- start the flashiness for all flashy text elements in this table.  works
-- recursively, so you can just pass in an entire screen here.
function IFFlashyText_StartFlashiness(this)

	-- Do specific leaf-node subtypes here.	
	if( this.flashy and (not (this.flashy == 0)) and (not this.noTransitionFlash) and this.cpointer ) then
		ScriptCB_IFFlashyText_StartFlashiness( this.cpointer )
		return
	end

	-- Leaf case not handled above. Recurse down all subtables.
	local k,v
	for k,v in this do
		if(type(v) == "table" and (not this.noTransitionFlash)) then
			-- Recurse into this table
			IFFlashyText_StartFlashiness(v)
		end -- v is a table
	end
end

-- start the flashiness for just one of the elements in the table
-- call this with a random number to flash one randomly
function IFFlashyText_FlashElementNum(this,cnt)

	-- Do specific leaf-node subtypes here.	
	if( this.flashy and (not (this.flashy == 0)) and this.cpointer ) then
		if(cnt == 0) then
			ScriptCB_IFFlashyText_StartFlashiness( this.cpointer )
		end
		return cnt - 1
	end

	-- Leaf case not handled above. Recurse down all subtables.
	local k,v
	for k,v in this do
		if(type(v) == "table") then
			-- Recurse into this table
			cnt = IFFlashyText_FlashElementNum(v,cnt)
		end -- v is a table
	end
	return cnt
end

-- start the flashiness for just one of the elements in the table
-- call this with a random number to flash one randomly
function IFFlashyText_DoRandomFlashiness(this)
	-- pick a random element number to flash
	local num = random(1,50)
	-- loop until we flash that one
	while (num > 0) do
		local numbefore = num
		num = IFFlashyText_FlashElementNum(this,num)
		if(num == numbefore) then
			return
		end
	end
end


-- call this constantly from update, with the bool isOn set to true when
-- its active
function IFObj_UpdateBlinkyAnim(obj,isOn,minAlpha,maxAlpha,timeUp,timeDn)
	if(not obj.bAnimActive) then
		if(isOn or obj.BlinkyAnimUp) then
			local st,en,tm
			if(obj.BlinkyAnimUp) then
				st = minAlpha
				en = maxAlpha
				tm = timeUp
			else
				st = maxAlpha
				en = minAlpha
				tm = timeDn
			end
			obj.BlinkyAnimUp = not obj.BlinkyAnimUp
			AnimationMgr_AddAnimation(obj,	{ fTotalTime = tm, fStartAlpha = st, fEndAlpha = en,})
		else
			obj.BlinkyAnimUp = nil
			IFObj_fnSetAlpha(obj,1)
		end
	end
end

