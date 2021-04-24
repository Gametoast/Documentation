-- Code, data for a flated interface button (FlatIFButton)
--
-- [Requires ifelem_button.lua to be already loaded, executed]
--
-- Broken off from interface_util.lua for better encapsulation


-- Like NewIFButton, but puts a nice fancy skin on it.
--
-- NOTE: We canNOT do the "local temp = createObj(gIFFlatButtonTemplate , Template)"
-- approach here, as that'll create just one skin & label, which is
-- shared among all instances. This approach here uses a bit more
-- memory, but should work more reliably - NM 6/25/03

function NewFlatIFButton(Template)
	local temp = Template --createObj(gIFFlatButtonTemplate , Template)

	temp.skin = NewIFContainer {
		ZPos = 130, -- Text will be at 128 by default, be a bit behind it

		-- 8 chunks for the pieces of the texture. Note: no texture is specified,
		-- as that's done in fnSelect
		ChunkC  = NewIFImage { inertUVs = 1},

-- 		fnSetSize = gFlatIFButtonSkin_fnSetSize,
-- 		fnSelect = gFlatIFButtonSkin_fnSelect,
-- 		fnHilight = gFlatIFButtonSkin_fnHilight,
		
	} -- end of skin

	temp.label = NewIFText {
		valign = "vcenter",

	} -- end of label

	-- Make a button from this expanded template
	return NewIFButton(temp)
end
