-- Horizontal slider for Lua. Handles the overall setup of them, with
-- functions for managing them.

-- Given an item previously created w/ NewHSlider(), reads the
-- thumbwidth/thumbposn out of it, moves the thumb. 
function HSlider_MoveThumb(this)
	-- Clamp values to right/left edge
	local ThumbL = max((this.width * -0.5), (this.width * -0.5) + (this.width * this.thumbposn))
	local ThumbR = ThumbL + (this.width * this.thumbwidth)
	IFImage_fnSetTexturePos(this.sliderfg,ThumbL,nil,ThumbR,nil)

	local ExtraWidth = this.width + (this.width * this.thumbwidth)
	local BGL = this.width * -0.5
	local BGR = (this.width * 0.5) + (this.width * this.thumbwidth)
	IFImage_fnSetTexturePos(this.sliderbg,BGL,nil,BGR,nil)
end

function HSlider_fnSetAlpha(this,a)
	IFObj_fnSetAlpha(this.sliderbg,a)
	IFObj_fnSetAlpha(this.sliderfg,a)
end

-- Creates a new HSlider. This item is centered around the center of
-- what's passed in. Values in Template to be filled out:
--
-- width : overall width in pixels (of the background)
-- height : overall height in pixels
-- thumbwidth : width % the thumb (FG) (default 0.1, 10%)
-- thumbposn : position of the slider in 0..1 scale (clamped to right side)

function NewHSlider(Template)
	-- Fill in defaults in case parent didn't.
	Template.width = Template.width or 100
	Template.height = Template.height or 16
	Template.thumbwidth = Template.thumbpercentage or 0.1
	Template.thumbposn = Template.thumbposn or 0

	local temp = NewIFContainer {
		x = Template.x,
		y = Template.y,
		ZPos = Template.ZPos,

		sliderbg = NewIFImage { ZPos = 160, 
			localpos_l = Template.width * -0.5, localpos_r = Template.width * 0.5,
			localpos_t = Template.height * -0.5, localpos_b = Template.height * 0.5,
			texture = "slider_bg"
		},

		sliderfg = NewIFImage { ZPos = 159,
			localpos_l = 0, localpos_r = 0,
			localpos_t = Template.height * -0.5, localpos_b = Template.height * 0.5,
			texture = "slider_fg"
		},
	}

	temp.width = Template.width
	temp.height = Template.height
	temp.thumbwidth = Template.thumbwidth
	temp.thumbposn = Template.thumbposn
	temp.type = "hslider"

	-- Move the slider asap
	HSlider_MoveThumb(temp)

	return temp
end




