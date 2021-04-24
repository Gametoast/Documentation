
--This is the PC version of the charselect, which includes elements of the spawndisplay
-- all the if mode stuff has been removed, as there is no splitscreen for PC

-- Helper function. Builds the chunks for this screen programatically
-- (i.e. based on screensize). It makes and shoves things into the
-- 'this.Info' block, which is a container aligned to the right-middle
-- of the screen. Thus, within its space, x=0 is the right edge,
-- x=-100 is to its left. y=0 is the middle of the screen, y=-100 is
-- above that, y=100 is below.

function ifs_pc_SpawnSelect_fnBuildScreen(this, mode)

	-- Make a container that's aligned to the left-top of the screen
	-- to shove our stuff into
	this.Info = NewIFContainer {
		ScreenRelativeX = 0.0,
		ScreenRelativeY = 0.0,
		inert = 1, -- delete from Lua memory once pushed to C
	}

	this.BotInfo = NewIFContainer {
		ScreenRelativeX = 1.0,
		ScreenRelativeY = 1.0,
		inert = 1, -- delete from Lua memory once pushed to C
	}

	local w,h = ScriptCB_GetSafeScreenInfo() -- of the usable screen
	local numSlots = 4 -- 0 to 5 (6 total) --REDUCED BY 1
	local boxw, boxh, texth
	-- Scale a box based on screensize
	boxw = w * 0.35
	boxh = h * 0.05--could be too small
	local textheight = boxh * 1.6
	local sideh =	h * 0.15
	local sidew =   w * 0.1    
	
	local okcancelw = w * 0.2
	local okcancelh = h * 0.12
	
	
	local fontsize = "gamefont_tiny"
	
	local barw = boxw * 1.3

	local SideXOffset = w * .1
	local SideYOffest = h * .125

	local SlotUnitNameOffsetX = w * .05 --will need the icon offset eventually
	local SlotYOffset = h * .015 + sideh --will need to add the SideIcons offset eventually
	
	SlotYOffset = sideh/2
	local SlotTextOffsetX = SlotUnitNameOffsetX + 20

	local popupWidth  = w * .3
	local popupHeight = h * .15
	local leftsideRot = 35
--Make two buttons for the two sides, (a frame and an bitmap for each)
	--These are the frames
	
	Icon0PosX = w/2 - sidew/2
	Icon1PosX = w/2 + sidew/2
	
	this.Info.SideIcon0 = NewBorderRect 
	{
			ZPos = 190, -- behind most
			x = w/2, 
			y = SideYOffest,
			width = sidew*2,
			height = sideh,
			alpha = 0,	-- invisible hotspot, here we come.
	}
	this.Info.SideIcon1 = NewBorderRect 
	{
			ZPos = 190, -- behind most
			x = w/2, 
			y = SideYOffest,
			width = sidew * 2,
			height = sideh,
			alpha = 0,
	}
--The two bitmaps
--	this.Info.SideImage0 = NewIFImage 
--	{
-- 			ZPos = 180, 
-- 			x = Icon0PosX, 
-- 			y = SideYOffest, -- inertUVs = 1,
-- 			alpha = 255,
-- 			localpos_l = -sidew/4, localpos_t = -sideh/4,
-- 			localpos_r =  sidew/4, localpos_b =  sideh/4,
--			--texture = "CharSelectImp_BG",
--			ColorR = 0, ColorG = 0, ColorB = 0, -- black
-- 	}
 	
-- 	this.Info.SideImage1 = NewIFImage 
--	{
-- 			ZPos = 180, 
-- 			x = Icon1PosX, 
-- 			y = SideYOffest, -- inertUVs = 1,
-- 			alpha = 255,
-- 			localpos_l = -sidew/4, localpos_t = -sideh/4,
-- 			localpos_r =  sidew/4, localpos_b =  sideh/4,
--			--texture = "CharSelectImp_BG",
--			ColorR = 0, ColorG = 0, ColorB = 0, -- black
-- 	}
	
	this.Info.SideModel0 = NewIFModel {
		x = Icon0PosX, y = SideYOffest,
		scale = LargeScale,
		OmegaY = 0.2,
		lighting = 1,
		ColorR = 76, ColorG = 180, ColorB = 255,
	}
	this.Info.SideModel1 = NewIFModel {
		x = Icon1PosX, y = SideYOffest,
		scale = LargeScale,
		OmegaY = 0.2,
		lighting = 1,
		ColorR = 76, ColorG = 180, ColorB = 255,
	}
	
	


		
--Make two buttons for the Accept & Cancel button
--And the text that goes in them
	this.Info.Ok = NewBorderRect 
	{
			ZPos = 190, -- behind most
			--x = w - okcancelw + 80, 
			x= w/2,
			y = h - okcancelh + 50,
			width = okcancelw,
			height = okcancelh,
			alpha = 128,
			rotX = 45,
	}
	this.Info.TextOk = NewIFText --
	{
			--x = w - 1.5 * okcancelw + 80, 
			--y = h - 1.5 * okcancelh + 50, 
			x = w/2 - okcancelw/2,
			y = h - 1.5 * okcancelh + 50, 
			font = fontsize,
			halign = "hcenter",
			valign = "vcenter",
			
			--halign = "left",
			--valign = "top",
		
			textw = okcancelw , -- usable area for text
			texth = okcancelh  ,
			font = fontsize,
			string = "ifs.SpawnDisplay.Spawn",
			ColorR = 255, ColorG = 255, ColorB = 255, -- white
			flashy = 0,
			
	}
		
--	this.Info.Cancel = NewBorderRect 
--	{
--			ZPos = 190, -- behind most
--			x = 0, -- + w*.02 + , 
--			y = h,  -- okcancelh,
--			width = okcancelw,
--			height= okcancelh,
--			alpha = 128,
--	}
--	
--	this.Info.TextCancel = NewIFText --the Unit's name/soldiertype/title
--	{
--			x = 0, -- center-x position
--			y = h , -- just touching box below (my height = 32, but is centered)
--			width = barw * 10,
--			font = fontsize,
--			halign = "left",
--			valign = "top",
--			textw = okcancelw - 32, -- usable area for text
--			texth = okcancelh - 32 ,
--			font = fontsize,
--			string = "Cancel",
--			ColorR = 255, ColorG = 255, ColorB = 255, -- white
--	}
	
--Make a box for the mission briefing screen above the map -- Low priority
--Make several containers for each of the class slots (probably safe with seven)
--		each slot needs a frame, a unit title and unit text
	

		--a class slot should look like:
--		---------------------------------------------|
--		| --Icon	|	--SoldierType				 |
--		|			|	  -- Eq List				 |
--      ----------------------------------------------
	local i
	for i = 0,numSlots do
	
		local tag = format("SlotUnitName%d",i)
		
--		this.Info[tag] = NewIFText --the Unit's name/soldiertype/title
--		{
---			x = SlotTextOffsetX, --SlotUnitNameOffsetX , -- center-x position
---			y = SlotYOffset + i * ( boxh + textheight ), -- just touching box below (my height = 32, but is centered)
--			width = barw * 10,
----			font = fontsize,
--		halign = "left",
--			valign = "top",
--		--	textw = barw , -- usable area for text
--			texth = 32,  --boxh ,
--			font = fontsize,
--			string = "UnitTitle",
--			ColorR = 255, ColorG = 255, ColorB = 255, -- white
--			--flashy = 0,
--			rotY = 20,
--			bgleft = "headerbuttonleft",
--			bgmid = "headerbuttonmid",
--			bgright = "headerbuttonright",
--			
--			textw = boxw, -- usable area for text
--		}

	
		tag = format("SlotWindow%d",i)
--	--	this.Info[tag] = NewBorderRect 
--	--	{
--	--		ZPos = 190, -- behind most
--	--		x = SlotUnitNameOffsetX +  65, 
--	--		y = SlotYOffset + i * ( boxh + textheight ) + boxh,
--	--		width = boxw,
--	--		height = textheight + boxh,
--	--		alpha = 128,
--	--	}

		this.Info[tag] = NewButtonWindow 
		{ 
			ZPos = 200, 
			x=SlotUnitNameOffsetX +  SlotUnitNameOffsetX * 2.5,
			y = SlotYOffset + i * ( boxh + textheight +  ScriptCB_GetFontHeight(fontsize)+10 ) + boxh ,
			--ScreenRelativeX = 0.0, -- center
			--ScreenRelativeY = 0.0, 
			width = boxw,
			height = textheight + boxh,
			titleText = "ifs.profile.list",
			rotY = leftsideRot,
			font = fontsize
		}
		
		this.Info[tag].bHotspot = 1
		this.Info[tag].fHotspotW = boxw
		this.Info[tag].fHotspotH = textheight + boxh
	
	
		this.Info[tag].InfoText = NewIFText  --the equipment/weapon text
	    {  
			--x = 0, --SlotTextOffsetX , 
			--y = 0, --SlotYOffset + i * ( boxh + textheight ) + ScriptCB_GetFontHeight(fontsize) + 30  ,
			
			
			width = barw * 10,
			
			halign = "hcenter",
			valign = "vcenter",
			textw = boxw, -- usable area for text
			texth = textheight,
			font = fontsize,
			string = "InfoText",
			ColorR = 255, ColorG = 255, ColorB = 255, -- white
			--rotY = 20,
			flashy = 0,
			--x = -boxw,
			--y = -textheight,
		}
	
	end
-- Now for a popup textbox (position is unimportant, gets set on the fly)
--	this.Info.PopupText = NewIFText  --the equipment/weapon text
--	{  
--		x = w - (popupWidth - 16), 
--		y = h - (popupHeight - 16),
--		halign = "left", --could be changed by code
--		valign = "top",
--		textw = popupWidth, -- usable area for text
--		texth = popupHeight,
--		font = fontsize,
--		string = "InfoText",
--		ColorR = 255, ColorG = 255, ColorB = 255, -- white
--		flashy = 0,
---		
--	}
--	this.Info.PopupBorder = NewBorderRect 
--	{
--			ZPos = 190, -- behind most
--			x = w - (popupWidth/2), 
--			y = h - (popupHeight/2),
--			width = popupWidth,
--			height = popupHeight,
--			alpha = 128,
--	}
	
	this.Info.PopupWindow = NewButtonWindow 
	{ 
		ZPos = 200, 
		x = w - (popupWidth/2), 
		y = h - (popupHeight/2),
		--ScreenRelativeX = 0.0, -- center
		--ScreenRelativeY = 0.0, 
		width = popupWidth,
		height = popupHeight,
		titleText = "",
		rotY = -20,
		font = fontsize
	}

	this.Info.PopupWindow.Text = NewIFText  --Spawnpoint text
	{  
		x = -(popupWidth - 16 )/2, 
		y = - (popupHeight - 16)/2,
		halign = "hcenter", --could be changed by code
		valign = "vcenter",
		textw = popupWidth - 16, -- usable area for text
		texth = popupHeight - 16,
		font = fontsize,
		string = "InfoText",
		ColorR = 255, ColorG = 255, ColorB = 255, -- white
		flashy = 0,
	}
	
	
	
	this.Info.ObjectiveWindow = NewButtonWindow 
	{ 
		ZPos = 1, 
		x = w - (popupWidth/2), 
		y = (popupHeight/2) + h*.05,
		--ScreenRelativeX = 0.0, -- center
		--ScreenRelativeY = 0.0, 
		width = popupWidth,
		height = popupHeight,
		titleText = "ObjectivesGoHere",
		rotY = -20,
		font = fontsize
		
	}

	this.Info.ObjectiveWindow.Text = NewIFText  --objective text
	{  
		x = -(popupWidth - 16 )/2, 
		y = - (popupHeight - 16)/2,
		halign = "top", --could be changed by code
		valign = "vcenter",
		textw = popupWidth - 16, -- usable area for text
		texth = popupHeight - 16,
		font = fontsize,
		string = "InfoText",
		ColorR = 255, ColorG = 255, ColorB = 255, -- white
		flashy = 0,
	}
	
--This is the selected icon that shows up by the class slot
	this.Info.SelectedImage = NewIFImage 
	{
 			ZPos = 180, 
 			x = 0, 
 			y = 0, -- inertUVs = 1,
 			alpha = 255,
 			localpos_l = -sidew/4, localpos_t = -sideh/4,
 			localpos_r =  sidew/4, localpos_b =  sideh/4,
			--texture = "CharSelectImp_BG",
			ColorR = 0, ColorG = 0, ColorB = 0, -- black
 	}
	
end

function ifs_pc_spawnselect_animateicons(which)
	local this = ifs_pc_SpawnSelect

	local w,h = ScriptCB_GetSafeScreenInfo()
	local SideYOffest = h * .13
	local Icon0PosX = w/2 - w*0.05
	local Icon1PosX = w/2 + w*0.05
	
	local resScale = w / 800

	if(which < 0.5) then
		AnimationMgr_AddAnimation(this.Info.SideModel0,{ fTotalTime = 0.25,fStartAlpha = 0.35, fEndAlpha = 1,
									fStartX = Icon1PosX,fEndX = Icon0PosX,
									fStartY = SideYOffest,fEndY = SideYOffest,
									fStartW = 0.25*resScale,fStartH = 0.25*resScale,fEndW   = 0.5*resScale,fEndH   = 0.5*resScale,})
		AnimationMgr_AddAnimation(this.Info.SideModel1,{ fTotalTime = 0.25,fStartAlpha = 1, fEndAlpha = 0.35,
									fStartX = Icon0PosX,fEndX = Icon1PosX,
									fStartY = SideYOffest,fEndY = SideYOffest,
									fStartW = 0.5*resScale,fStartH = 0.5*resScale,fEndW   = 0.25*resScale,fEndH   = 0.25*resScale,})
	else
		AnimationMgr_AddAnimation(this.Info.SideModel0,{ fTotalTime = 0.25,fStartAlpha = 1, fEndAlpha = 0.35,
									fStartX = Icon0PosX,fEndX = Icon1PosX,
									fStartY = SideYOffest,fEndY = SideYOffest,
									fStartW = 0.5*resScale,fStartH = 0.5*resScale,fEndW   = 0.25*resScale,fEndH   = 0.25*resScale,})
		AnimationMgr_AddAnimation(this.Info.SideModel1,{ fTotalTime = 0.25,fStartAlpha = 0.35, fEndAlpha = 1,
									fStartX = Icon1PosX,fEndX = Icon0PosX,
									fStartY = SideYOffest,fEndY = SideYOffest,
									fStartW = 0.25*resScale,fStartH = 0.25*resScale,fEndW   = 0.5*resScale,fEndH   = 0.5*resScale,})
	end
	
	-- make them spin fast for a bit
	ScriptCB_IFModel_SetOmegaY(this.Info.SideModel0.cpointer,-20)
	ScriptCB_IFModel_SetOmegaY(this.Info.SideModel1.cpointer,-20)
	this.IconModelFastMode = 1
end

ifs_pc_SpawnSelect = NewIFShellScreen 
{
	nologo = 1,
	bNohelptext_accept = 1, -- we have our own
	bNohelptext_backPC = 1,



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
	
	Update = function(this,fDt)
 		-- Call default base class's update function (make button bounce)
 		gIFShellScreenTemplate_fnUpdate(this,fDt)
 		-- if the models are done animating, slow down the rotations
 		if(this.IconModelFastMode and not this.Info.SideModel0.bAnimActive) then
			ScriptCB_IFModel_SetOmegaY(this.Info.SideModel0.cpointer,-0.3)
			ScriptCB_IFModel_SetOmegaY(this.Info.SideModel1.cpointer,-0.3)
			this.IconModelFastMode = nil
		end		
	end,
	
}
ifs_pc_SpawnSelect_fnBuildScreen(ifs_pc_SpawnSelect, 0)
AddIFScreen(ifs_pc_SpawnSelect,"ifs_pc_SpawnSelect")
ifs_pc_SpawnSelect_fnBuildScreen = nil