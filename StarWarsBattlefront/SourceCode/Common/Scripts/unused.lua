
function PrintIFText(obj,name,level)
	local prefix = ""
	for i = 0,level do
		prefix = prefix .. " "
	end
	print(prefix .. "[Text] " , name)
	print(prefix .. " x = ",obj.x)
	print(prefix .. " y = ",obj.y)
	print(prefix .. " string = ",obj.string)
end

function PrintIFImage(obj,name,level)
	local prefix = ""
	for i = 0,level do
		prefix = prefix .. " "
	end
	print(prefix .. "[Image] ", name)
	print(prefix .. " x = ",obj.x)
	print(prefix .. " y = ",obj.y)
	print(prefix .. " texture = ",obj.texture)
end

function PrintIFObjContainer(c, level, name)
	local prefix = ""
	for i = 1,level do
		prefix = prefix .. " "
	end

	if(c.type == "text") then
		PrintIFText(c,name,level)
		return
	elseif (c.type == "image") then
		PrintIFImage(c,name,level)
		return
	elseif (c.type == "button") then
  	print(prefix .. "[Button] ", name)
		print(prefix .. " x = ",c.x)
		print(prefix .. " y = ",c.y)
		PrintIFText(c.label,"label",level+1)
		PrintIFImage(c.skin,"skin",level+1)
		return
	end

	for k,v in c do
--		print("ParseIFObjContainer, for loop. k = ",k)
		if(type(v) == "table") then
			PrintIFObjContainer(v, level + 1, k)
		else
			print(prefix .. k, " = ", v);
		end
	end
end

-- -------------------------------------------------------------------
-- Button Activation/deactivation functions.

-- Takes a parameter, either nil (false) or not-nil (true), as to
-- whether this should be activated or not.
-- 
--

function BtnActivate(obj,On)
	local NewTexture
	local NewSkinAlpha
	local NewLabelAlpha
	if(On) then
		NewTexture = "button_on_bg"
		NewSkinAlpha = 1
		NewLabelAlpha = 1
	else
		NewTexture = "button_off_bg"
		NewSkinAlpha = 0.8
		NewLabelAlpha = 0.3
	end

	obj.skin.texture = NewTexture
	obj.skin.alpha = NewSkinAlpha
	obj.label.alpha = NewLabelAlpha

	-- if obj.name isn't set yet, assume we're at startup, and this
  -- isn't filled out yet. Else, if it is, assume we want to set it asap.
	if(obj.name) then
		local SkinName = obj.name .. ".skin"
		ScriptCB_IFImage_SetTexture(SkinName,obj.skin.texture)
		ScriptCB_IFObj_SetAlpha(SkinName,obj.skin.alpha)
		local LabelName = obj.name .. ".label"
		ScriptCB_IFObj_SetAlpha(LabelName,obj.label.alpha)
	end
end
