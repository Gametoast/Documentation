-- Interface screen for the metagame. Going to get kinda big, as it
-- does most of the work

-- Helper function. Builds the chunks for this screen programatically
-- (i.e. based on screensize). It makes and shoves things into the
-- 'this.Info' block, which is a container aligned to the right-middle
-- of the screen. Thus, within its space, x=0 is the right edge,
-- x=-100 is to its left. y=0 is the middle of the screen, y=-100 is
-- above that, y=100 is below.

function ifs_charselect_fnBuildScreen(this, mode)
	local w,h = ScriptCB_GetSafeScreenInfo() -- of the usable screen

	if (mode == 1 and ScriptCB_IsHorizontalSplitScreen()) then
		-- Make a box that's aligned to the center of the screen
		-- to shove our stuff into
		this.Info = NewIFContainer {
			ScreenRelativeX = 0.5,
			ScreenRelativeY = 0.5,
			x = 0.0, y =-24.0, z = -100.0,
			rotX = 24.0,
			inert = 1, -- delete from Lua memory once pushed to C
		}
	else
		-- Make a box that's aligned to the top-right of the screen
		-- to shove our stuff into
		this.Info = NewIFContainer {
			ScreenRelativeX = 1.0,
			ScreenRelativeY = 0.0,
			rotY = -42.0,
			inert = 1, -- delete from Lua memory once pushed to C
		}
	end

	local boxw, boxh
	local jvfontsize, jvtitlesize, yoffset1, yoffset2
	-- Scale a box based on screensize
	if ( mode == 0 ) then
		boxw = w * 0.38
		boxh = h * 0.6
		jvfontsize = "gamefont_small"
		jvtitlesize = "gamefont_medium"
		yoffset1 = 16
		yoffset2 = 47
	else
		boxw = w * 0.4
		boxh = h * 0.4
		jvtitlesize = "gamefont_tiny"
		jvfontsize = "gamefont_tiny"
		yoffset1 = 32
		yoffset2 = 12
	end
	
	--this.Info.CharBG = NewIFImage 
	--{
 	--		ZPos = 200, x = 0, y = 0, -- inertUVs = 1,
 	--		alpha = 128,
 	--		localpos_l = -w, localpos_t = -h,
 	--		localpos_r =  w, localpos_b =  h,
	--		--texture = "CharSelectImp_BG",
	--		ColorR = 0, ColorG = 0, ColorB = 0, -- black
 	--}
 		
	--this.Info.CharBG = NewIFImage {
 	--		ZPos = 255, x = -360, y = 160, -- inertUVs = 1,
 	--		alpha = 1,
 	--		localpos_l = -180, localpos_t = -92,
 	--		localpos_r =  180, localpos_b =  92,
	--		--texture = "CharSelectImp_BG",
 	--	}
 		
	--this.Info.BoxBG = NewBorderRect {
	--	ZPos = 190, -- behind most
	--	x = boxw * -0.5, -- center-x position
	--	y = 0, -- center-y
	--	width = boxw,
	--	height = boxh,
	--}
	
	local titleBarHeight = 30
	local windowY = titleBarHeight + 0.2*(h-titleBarHeight)
	local windowHeight = 0.6*(h - titleBarHeight)

	-- windowWidth changed from 0.5 to 0.55 to fit REALLY LONG weapon
	-- names in German. Do *NOT* change this w/o retesting German,
	-- especially the Imperial Stormtrooper. - NM 7/9/04
	local windowWidth = w*0.55
	local windowX = -windowWidth*0.5 + 5

	if( mode == 1 ) then
		windowY = titleBarHeight
		windowHeight = 0.33*(h - titleBarHeight)
		if (ScriptCB_IsHorizontalSplitScreen()) then
			windowX = 0.0
			windowHeight = 0.5*(h - titleBarHeight)
		end
	end


	this.Info.Window = NewButtonWindow 
	{
		x=windowX,
		y=windowHeight*0.5 + windowY,
		width = windowWidth,
		height = windowHeight,
		titleText = "",
	}


--	local barw = boxw * 1.3	
--	this.Info.UnitNameBar = NewIFText
--	{
--		x = barw * -0.5 - 84, -- center-x position
--		y = yoffset2, -- just touching box below (my height = 32, but is centered)
--		width = barw * 10,
--		font = jvtitlesize,
--		halign = "left",
--		valign = "top",
--		textw = barw *10 - 32, -- usable area for text
--		texth = boxh - 32,
--		ColorR = 255, ColorG = 255, ColorB = 255, -- white
--		nocreatebackground = 1,
--	}
--	


	this.Info.Window.BoxText = NewIFText {
		y =  -windowHeight*0.5 + 5, -- top-y position with valign=top below
		x = -windowWidth*0.5 + 10, -- rotating it pulls it away from screen-right, re-align it
		halign = "left",
		valign = "top",
		textw = windowWidth -10,
		texth = windowHeight,
		font = jvfontsize,
--		string = "This is a temp string. Reset it from code!",
		ColorR = 255, ColorG = 255, ColorB = 255, -- white
		flashy=0,
	}



--	this.Info.UnitNameBar = NewIFTitleBar {
--		yFlip = 1, -- Make corner chunks point down.
--		x = barw * -0.5, -- center-x position
--		y = (boxh * -0.5) - yoffset2, -- just touching box below (my height = 32, but is centered)
--		width = barw,
--		font = "gamefont_medium",
--	}

	-- Tweak helptext for splitscreen
	if(this.Helptext_Accept) then 
		if ( mode == 0 ) then
			this.Helptext_Back.helpstr.font = "gamefont_small"
			this.Helptext_Accept.helpstr.font = "gamefont_small"
		elseif (ScriptCB_IsHorizontalSplitScreen()) then
			this.Helptext_Back.helpstr.font = "gamefont_tiny"
			this.Helptext_Accept.helpstr.font = "gamefont_tiny"
			if(ScriptCB_GetLanguage() ~= "english") then
				this.Helptext_Back.y = this.Helptext_Accept.y - 20
			end
		else
			this.Helptext_Back.helpstr.font = "gamefont_tiny"
			this.Helptext_Accept.helpstr.font = "gamefont_tiny"
		end
		IFText_fnSetString(this.Helptext_Back.helpstr, "game.spawndisplay.characterdisplay.promptprev")
		IFText_fnSetString(this.Helptext_Accept.helpstr, "game.spawndisplay.characterdisplay.promptnext")
	end

	if(ScriptCB_GetLanguage() ~= "english") then
		this.Info.Window.titleBarElement.font = "gamefont_tiny"
	else
		this.Info.Window.titleBarElement.font = "gamefont_small"
	end

end

ifs_charselect1 = NewIFShellScreen {
	nologo = 1,

	-- Actual contents are created in ifs_charselect_fnBuildScreen

	-- Note: for now, the exe is handling all the inputs/events, so this
	-- screen has no Enter/Exit/Update/Input handlers. It does have an
	-- Input_Back handler to override the base class's default functionality
	-- (go to previous screen)
	Input_Back = function(this)
	end,
	Input_GeneralLeft = function(this,bFromAI)
	end,
	Input_GeneralRight = function(this,bFromAI)
	end,
	Input_GeneralUp = function(this,bFromAI)
	end,
	Input_GeneralDown = function(this,bFromAI)
	end,
	
}

ifs_charselect2 = NewIFShellScreen {
	nologo = 1,
	-- Actual contents are created in ifs_charselect_fnBuildScreen

	-- Note: for now, the exe is handling all the inputs/events, so this
	-- screen has no Enter/Exit/Update/Input handlers. It does have an
	-- Input_Back handler to override the base class's default functionality
	-- (go to previous screen)
	Input_Back = function(this)
	end,
	Input_GeneralLeft = function(this,bFromAI)
	end,
	Input_GeneralRight = function(this,bFromAI)
	end,
	Input_GeneralUp = function(this,bFromAI)
	end,
	Input_GeneralDown = function(this,bFromAI)
	end,
	
}

if(not ScriptCB_IsSplitscreen()) then

	--its not splitscreen do it normally
	ifs_charselect_fnBuildScreen(ifs_charselect1, 0)
	AddIFScreen(ifs_charselect1,"ifs_charselect1")
	ifs_charselect2 = nil -- flush from memory
else

	ifs_charselect_fnBuildScreen(ifs_charselect1, 1)
	ifs_charselect1.Viewport = 0
	AddIFScreen(ifs_charselect1,"ifs_charselect1")

	ifs_charselect_fnBuildScreen(ifs_charselect2, 1)
	ifs_charselect2.Viewport = 1
	AddIFScreen(ifs_charselect2,"ifs_charselect2")
end


ifs_charselect_fnBuildScreen = nil -- free up memory
