
function ifs_opt_pcvideo_fnUpdateStrings(this)

	if(ScriptCB_GetShellActive()) then
		-- set the resolution box
		local idx = ifs_opt_pcvideo_reslistbox_layout.SelectedIdx
		if (idx) then
			local len = getn(ifs_opt_pcvideo_reslistbox_contents)
			if(idx < 1) then idx = 1 end
			if(idx > len) then idx = len end
			local res = ifs_opt_pcvideo_reslistbox_contents[idx]
			RoundIFButtonLabel_fnSetString(this.buttons.resolution,res.name)
		end

		-- set the antialiasing box
		idx = ifs_opt_pcvideo_fsaalistbox_layout.SelectedIdx
		if (idx) then
			len = getn(ifs_opt_pcvideo_fsaalistbox_contents)
			if(idx < 1) then idx = 1 end
			if(idx > len) then idx = len end
			local fsaaItem = ifs_opt_pcvideo_fsaalistbox_contents[idx]
			RoundIFButtonLabel_fnSetUString(this.buttons.multisample, fsaaItem.name)
		end

		if(this.iTextureDetail == 0) then
			RoundIFButtonLabel_fnSetString(this.buttons.texturedetail,"ifs.VideoOpt.low")
			elseif(this.iTextureDetail == 1) then
			RoundIFButtonLabel_fnSetString(this.buttons.texturedetail,"ifs.VideoOpt.med")
		else
			RoundIFButtonLabel_fnSetString(this.buttons.texturedetail,"ifs.VideoOpt.high")
		end

--		if(this.iTextureQuality == 0) then
--			RoundIFButtonLabel_fnSetString(this.buttons.texturequality,"ifs.VideoOpt.compressed")
--			elseif(this.iTextureQuality == 1) then
--			RoundIFButtonLabel_fnSetString(this.buttons.texturequality,"ifs.VideoOpt.16bit")
--		else
--			RoundIFButtonLabel_fnSetString(this.buttons.texturequality,"ifs.VideoOpt.32bit")
--		end 
		
--		if(this.iMultiSample == 0 ) then
--			RoundIFButtonLabel_fnSetString(this.buttons.multisample,"ifs.VideoOpt.multisample1")
--		else
--			RoundIFButtonLabel_fnSetString(this.buttons.multisample,format("ifs.VideoOpt.multisample%d", this.iMultiSample)) 		
--		end

--		if(this.bWindowed) then
 --			RoundIFButtonLabel_fnSetString(this.buttons.windowed,"common.on")
--		else
 --			RoundIFButtonLabel_fnSetString(this.buttons.windowed,"common.off")
 --		end
 		 		
 		if(this.bVsync) then
 			RoundIFButtonLabel_fnSetString(this.buttons.vsync,"common.on")
		else
 			RoundIFButtonLabel_fnSetString(this.buttons.vsync,"common.off")
 		end
 	end
 	
	--brightness slider
	this.sliders.brightness.thumbposn = ((this.fBrightness - this.fBrightnessMin) / (this.fBrightnessMax-this.fBrightnessMin))
	HSlider_MoveThumb(this.sliders.brightness)
	--RoundIFButtonLabel_fnSetUString(this.buttons.brightness,ScriptCB_tounicode(format("%d",this.fBrightness)))

	--contrast slider
	this.sliders.contrast.thumbposn = ((this.fContrast - this.fContrastMin) / (this.fContrastMax - this.fContrastMin))
	HSlider_MoveThumb(this.sliders.contrast)
	--RoundIFButtonLabel_fnSetUString(this.buttons.contrast,ScriptCB_tounicode(format("%d",this.fContrast)))

	--lod distance slider
	this.sliders.loddistance.thumbposn = ((this.fLODDistance - this.fLODDistanceMin) / (this.fLODDistanceMax - this.fLODDistanceMin))
	HSlider_MoveThumb(this.sliders.loddistance)
	--RoundIFButtonLabel_fnSetUString(this.buttons.loddistance,ScriptCB_tounicode(format("%d",this.fLODDistance)))

	--view distance slider
	this.sliders.viewdistance.thumbposn = ((this.fViewDistance - this.fViewDistanceMin) / (this.fViewDistanceMax - this.fViewDistanceMin))
	HSlider_MoveThumb(this.sliders.viewdistance)
	--RoundIFButtonLabel_fnSetUString(this.buttons.viewdistance,ScriptCB_tounicode(format("%d",this.fViewDistance)))

		if(this.iTerrainQuality == 0) then
 			RoundIFButtonLabel_fnSetString(this.buttons.terrainquality,"ifs.VideoOpt.low")
		elseif(this.iTerrainQuality == 1) then
 			RoundIFButtonLabel_fnSetString(this.buttons.terrainquality,"ifs.VideoOpt.med")
 		else
 			RoundIFButtonLabel_fnSetString(this.buttons.terrainquality,"ifs.VideoOpt.high")
 		end
 	
		if(this.iWaterQuality == 0) then
 			RoundIFButtonLabel_fnSetString(this.buttons.waterquality,"ifs.VideoOpt.low")
		elseif(this.iWaterQuality == 1) then
 			RoundIFButtonLabel_fnSetString(this.buttons.waterquality,"ifs.VideoOpt.med")
 		else
 			RoundIFButtonLabel_fnSetString(this.buttons.waterquality,"ifs.VideoOpt.high")
 		end

 		if(this.iParticleQuality == 0) then
 			RoundIFButtonLabel_fnSetString(this.buttons.particlequality,"ifs.VideoOpt.low")
		elseif(this.iParticleQuality == 1) then
 			RoundIFButtonLabel_fnSetString(this.buttons.particlequality,"ifs.VideoOpt.med")
 		else
 			RoundIFButtonLabel_fnSetString(this.buttons.particlequality,"ifs.VideoOpt.high")
 		end
	 	
		if (this.iShadowQuality == 0) then
 			RoundIFButtonLabel_fnSetString(this.buttons.shadowquality,"common.off")
		elseif (this.iShadowQuality == 1) then
 			RoundIFButtonLabel_fnSetString(this.buttons.shadowquality,"ifs.VideoOpt.low")
		else
 			RoundIFButtonLabel_fnSetString(this.buttons.shadowquality,"ifs.VideoOpt.high")
 		end
	 	
		if (this.iSpecularQuality == 0) then
 			RoundIFButtonLabel_fnSetString(this.buttons.specularquality,"common.off")
		elseif (this.iSpecularQuality == 1) then
 			RoundIFButtonLabel_fnSetString(this.buttons.specularquality,"ifs.VideoOpt.low")
		else
 			RoundIFButtonLabel_fnSetString(this.buttons.specularquality,"ifs.VideoOpt.high")
 		end
 		
		if(this.bBumpMapping) then
 			RoundIFButtonLabel_fnSetString(this.buttons.bumpmapping,"common.on")
		else
 			RoundIFButtonLabel_fnSetString(this.buttons.bumpmapping,"common.off")
 		end
 		
		if(this.bMotionBlur) then
 			RoundIFButtonLabel_fnSetString(this.buttons.motionblur,"common.on")
		else
 			RoundIFButtonLabel_fnSetString(this.buttons.motionblur,"common.off")
 		end
	 	
		if(this.bDistortion) then
 			RoundIFButtonLabel_fnSetString(this.buttons.distortion,"common.on")
		else
 			RoundIFButtonLabel_fnSetString(this.buttons.distortion,"common.off")
 		end
end


function ifs_opt_pcvideo_ChangeSetting(this,next)
	-- bools
	if (this.CurButton == "bumpmapping" ) then
	
		this.bBumpMapping = not this.bBumpMapping
		if( ScriptCB_IsPCVideoFixedFunction()  ) then
			this.bBumpMapping = nil
		end
--	elseif (this.CurButton == "windowed" ) then
--	
--		this.bWindowed = not this.bWindowed
	elseif (this.CurButton == "vsync" ) then
	
		this.bVsync = not this.bVsync
		
	elseif (this.CurButton == "motionblur") then
	
		this.bMotionBlur = not this.bMotionBlur
	
	elseif (this.CurButton == "distortion") then
	
		this.bDistortion = not this.bDistortion
	
	elseif (this.CurButton == "brightness") then
	
		-- brightness slider		
		if(next == 1) then
			this.fBrightness = min(this.fBrightness + this.fBrightnessStep, this.fBrightnessMax)
		else
			this.fBrightness = max(this.fBrightness - this.fBrightnessStep, this.fBrightnessMin)
		end
		-- update the values in real time
		ScriptCB_SetPCBrightnessContrast(this.fBrightness, this.fContrast)
	
	elseif (this.CurButton == "contrast") then
	
		-- contrast slider		
		if(next == 1) then
			this.fContrast = min(this.fContrast + this.fContrastStep, this.fContrastMax)
		else
			this.fContrast = max(this.fContrast - this.fContrastStep, this.fContrastMin)
		end
		-- update the values in real time
		ScriptCB_SetPCBrightnessContrast(this.fBrightness, this.fContrast)

	elseif (this.CurButton == "viewdistance") then
		-- view distance slider		
		if(next == 1) then
			this.fViewDistance = min(this.fViewDistance + this.fViewDistanceStep, this.fViewDistanceMax)
		else
			this.fViewDistance = max(this.fViewDistance - this.fViewDistanceStep, this.fViewDistanceMin)
		end

	elseif (this.CurButton == "loddistance") then
	
		-- lod distance slider		
		if(next == 1) then
			this.fLODDistance = min(this.fLODDistance + this.fLODDistanceStep, this.fLODDistanceMax)
		else
			this.fLODDistance = max(this.fLODDistance - this.fLODDistanceStep, this.fLODDistanceMin)
		end

	elseif (this.CurButton == "resolution") then

	elseif (this.CurButton == "multisample") then
	
	else
	
		-- 3 way options
		local curSetting = 0
		if(this.CurButton == "texturedetail") then
			curSetting = this.iTextureDetail
--		elseif(this.CurButton == "texturequality") then
--			curSetting = this.iTextureQuality
		elseif(this.CurButton == "waterquality") then
			curSetting = this.iWaterQuality
		elseif(this.CurButton == "terrainquality") then
			curSetting = this.iTerrainQuality
		elseif(this.CurButton == "particlequality") then
			curSetting = this.iParticleQuality
		elseif(this.CurButton == "shadowquality") then
			curSetting = this.iShadowQuality
		elseif(this.CurButton == "specularquality") then
			curSetting = this.iSpecularQuality
		end
		
		-- rotate it
		if( next == 1 ) then
			curSetting = curSetting + 1
			if(curSetting > 2) then
				curSetting = 0
			end
		else
			curSetting = curSetting - 1
			if(curSetting < 0) then
				curSetting = 2
			end
		end
		
		
		-- store it
		if(this.CurButton == "texturedetail") then
			this.iTextureDetail = curSetting
			
--		elseif(this.CurButton == "texturequality") then
--			this.iTextureQuality = curSetting
		elseif(this.CurButton == "waterquality") then
			--if( ScriptCB_IsPCVideoFixedFunction() and curSetting > 0 ) then
			--	curSetting = 0
			--end
			this.iWaterQuality = curSetting
		elseif(this.CurButton == "terrainquality") then
			if( ScriptCB_IsPCVideoFixedFunction() and curSetting > 1 ) then
				curSetting = 0
			end
			this.iTerrainQuality = curSetting
		elseif(this.CurButton == "particlequality") then
			this.iParticleQuality = curSetting
		elseif(this.CurButton == "shadowquality") then
			if( ScriptCB_IsPCVideoFixedFunction() and curSetting > 1 ) then
				curSetting = 0
			end
			this.iShadowQuality = curSetting
		elseif(this.CurButton == "specularquality") then
			if (not ScriptCB_IsPCVideoFixedFunction() and curSetting ~= 2) then
				curSetting = 2
			end
			this.iSpecularQuality = curSetting
		end
	end
end


-- Helper function. Given a layout (x,y,width, height), returns a
-- fully-built item.
function ifs_opt_pcvideo_reslistbox_CreateItem(layout)
	-- Make a coordinate system pegged to the top-left of where the cursor would go.
	local Temp = NewIFContainer { x = layout.x - 0.5 * layout.width, y=layout.y}
	Temp.label = NewIFText{ x = 10, y = -10, halign = "left", font = "gamefont_small", textw = layout.width - 32, flashy = 0,}
	return Temp
end

-- Helper function. For a destination item (previously created w/
-- CreateItem), fills it in with data, which may be nil (==blank it)
function ifs_opt_pcvideo_reslistbox_PopulateItem(Dest,Data)
	if(Data) then
		IFText_fnSetString(Dest.label,Data.name)
		IFObj_fnSetVis(Dest.label,1)
	else
		-- Blank the data
		IFText_fnSetString(Dest.label,"")
		IFObj_fnSetVis(Dest.label,nil)
	end
end

ifs_opt_pcvideo_reslistbox_contents = {
}
ifs_opt_pcvideo_reslistbox_layout = {
	showcount = 10, -- max of the visible ones above
	yHeight = 22,
	ySpacing  = 0,
	width = 280,
	x = 0,
	slider = 1,
	CreateFn = ifs_opt_pcvideo_reslistbox_CreateItem,
	PopulateFn = ifs_opt_pcvideo_reslistbox_PopulateItem,
	flashy = 0,
}

-- Helper function. Given a layout (x,y,width, height), returns a
-- fully-built item.
function ifs_opt_pcvideo_fsaalistbox_CreateItem(layout)
	-- Make a coordinate system pegged to the top-left of where the cursor would go.
	local Temp = NewIFContainer { x = layout.x - 0.5 * layout.width, y=layout.y}
	Temp.label = NewIFText{ x = 10, y = -10, halign = "left", font = "gamefont_small", textw = layout.width - 32, flashy = 0,}
	return Temp
end

-- Helper function. For a destination item (previously created w/
-- CreateItem), fills it in with data, which may be nil (==blank it)
function ifs_opt_pcvideo_fsaalistbox_PopulateItem(Dest,Data)
	if(Data) then
		IFText_fnSetUString(Dest.label,Data.name)
		IFObj_fnSetVis(Dest.label,1)
	else
		-- Blank the data
		IFText_fnSetString(Dest.label,"")
		IFObj_fnSetVis(Dest.label,nil)
	end
end

ifs_opt_pcvideo_fsaalistbox_contents = {
}
ifs_opt_pcvideo_fsaalistbox_layout = {
	showcount = 10, -- max of the visible ones above
	yHeight = 22,
	ySpacing  = 0,
	width = 280,
	x = 0,
	slider = 1,
	CreateFn = ifs_opt_pcvideo_fsaalistbox_CreateItem,
	PopulateFn = ifs_opt_pcvideo_fsaalistbox_PopulateItem,
	flashy = 0,
}

ifs_opt_pcvideo = NewIFShellScreen {
	nologo = 1,
    movieIntro      = nil, -- played before the screen is displayed
    movieBackground = nil, -- played while the screen is displayed
	bNohelptext_backPC = 1,
	title = NewIFText {
		string = "ifs.VideoOpt.title",
		font = "gamefont_large",
		y = -30,
		textw = 460, -- center on screen. Fixme: do real centering!
		ScreenRelativeX = 0.5, -- center
		ScreenRelativeY = 0, -- top
		inert = 1, -- delete out of Lua mem when pushed to C
		nocreatebackground = 1,
	},

	
	reslistbox = NewButtonWindow { ZPos = 200, x=0, y = 40,
		ScreenRelativeX = 0.5,
		ScreenRelativeY = 0,
		width = ifs_opt_pcvideo_reslistbox_layout.width + 35,
		height = ifs_opt_pcvideo_reslistbox_layout.showcount * (ifs_opt_pcvideo_reslistbox_layout.yHeight + ifs_opt_pcvideo_reslistbox_layout.ySpacing) + 30
	},
	res_menu_state = 0,

	fsaalistbox = NewButtonWindow { ZPos = 200, x=0, y = 40,
		ScreenRelativeX = 0.5,
		ScreenRelativeY = 0,
		width = ifs_opt_pcvideo_fsaalistbox_layout.width + 35,
		height = ifs_opt_pcvideo_fsaalistbox_layout.showcount * (ifs_opt_pcvideo_fsaalistbox_layout.yHeight + ifs_opt_pcvideo_fsaalistbox_layout.ySpacing) + 30
	},
	fsaa_menu_state = 0,

	-- When entering this screen, check if we need to save (triggered
	-- by a subscreen or something). If so, start that process.
	Enter = function(this, bFwd)
		ScriptCB_MarkCurrentProfile()
		this.bResetProfile = nil

		gIFShellScreenTemplate_fnEnter(this, bFwd) -- call default enter function
		
		-- hide or grey out some options that aren't available on this graphics card
		if(ScriptCB_IsPCVideoFixedFunction() ) then	
			this.buttons.bumpmapping.hidden = 1
			this.buttonlabels.bumpmapping.hidden = 1
		else
			this.buttons.specularquality.hidden = 1
			this.buttonlabels.specularquality.hidden = 1
		end
		-- hide some options if we're in game
		if(not ScriptCB_GetShellActive()) then
			this.buttons.resolution.hidden = 1
			this.buttons.texturedetail.hidden = 1
--			this.buttons.texturequality.hidden = 1
			this.buttons.multisample.hidden = 1
--			this.buttons.windowed.hidden = 1
			this.buttons.vsync.hidden = 1
			this.buttonlabels.resolution.hidden = 1
			this.buttonlabels.texturedetail.hidden = 1
			this.buttonlabels.multisample.hidden = 1
--			this.buttonlabels.texturequality.hidden = 1
--			this.buttonlabels.windowed.hidden = 1
			this.buttonlabels.vsync.hidden = 1
		end
		
		ShowHideVerticalText(this.buttonlabels,ifs_opt_pcvideo_vbutton_layout)
		ShowHideVerticalButtons(this.buttons,ifs_opt_pcvideo_vbutton_layout)

		-- fill the resolution content list here
		-- initially hide the listbox
		this.res_menu_state = 0
		IFObj_fnSetVis(this.reslistbox,nil)
		-- init only if we're in the shell
		if(ScriptCB_GetShellActive()) then
			local index = ScriptCB_FillResolutionTable()
			print("res index = ", index);
			
			-- fill the listbox with resolutions
			ifs_opt_pcvideo_reslistbox_layout.SelectedIdx = index
			ifs_opt_pcvideo_reslistbox_layout.CursorIdx = index
			ifs_opt_pcvideo_reslistbox_layout.FirstShownIdx = index
			ListManager_fnFillContents(this.reslistbox,ifs_opt_pcvideo_reslistbox_contents,ifs_opt_pcvideo_reslistbox_layout)
			-- center the listbox over the resolution button text
			IFObj_fnSetPos(this.reslistbox,ifs_opt_pcvideo_reslistbox_layout.width/2+15,this.buttons.resolution.y + this.reslistbox.height/2 - 25)

			-- store the selected resolution
			local resItem = ifs_opt_pcvideo_reslistbox_contents[index]
			-- store the selected res
			this.resX = resItem.resX
			this.resY = resItem.resY
			print("Res = ", this.resX, " x ", this.resY);
		end

		-- fill the antialiasing content list here
		-- initially hide the listbox
		this.fsaa_menu_state = 0
		IFObj_fnSetVis(this.fsaalistbox,nil)
		-- init only if we're in the shell
--		if (ScriptCB_GetShellActive()) then
			local index = ScriptCB_FillMultisampleTable()
			print("fsaa index = ", index);
			
			-- fill the listbox with multisample modes
			ifs_opt_pcvideo_fsaalistbox_layout.SelectedIdx = index
			ifs_opt_pcvideo_fsaalistbox_layout.CursorIdx = index
			ifs_opt_pcvideo_fsaalistbox_layout.FirstShownIdx = index
			ListManager_fnFillContents(this.fsaalistbox,ifs_opt_pcvideo_fsaalistbox_contents,ifs_opt_pcvideo_fsaalistbox_layout)
			-- center the listbox over the multisample button text
			IFObj_fnSetPos(this.fsaalistbox,ifs_opt_pcvideo_fsaalistbox_layout.width/2+15,this.buttons.multisample.y + this.fsaalistbox.height/2 - 25)

			-- store the selected multisample modes
			local fsaaItem = ifs_opt_pcvideo_fsaalistbox_contents[index]
			-- store the selected multisample mode
			this.iMultiSample = fsaaItem.multisampleType
			this.iMultiSampleQuality = fsaaItem.multisampleQuality
			print("Multisample = ", this.iMultiSample, " ", this.iMultiSampleQuality);
--		end

		--get all the other video options
		this.iTextureDetail, this.iTextureQuality,
		this.fBrightness, this.fContrast, this.fViewDistance, this.fLODDistance,
		this.iWaterQuality, this.iTerrainQuality, this.iParticleQuality, this.iShadowQuality, this.iSpecularQuality, 
		this.bBumpMapping, this.bMotionBlur, this.bDistortion, this.bWindowed, this.bVsync = ScriptCB_GetPCVideoOptions()

		this.fBrightnessStep = 0.02
		this.fBrightnessMin = 0.2
		this.fBrightnessMax = 0.8
		this.fContrastStep = 0.02
		this.fContrastMin = 0.2
		this.fContrastMax = 0.8
		-- store the original brightness and contrast values, in case we cancel.
		-- need to do this since these are changed in real time
		this.fOriginalBrightness = this.fBrightness
		this.fOriginalContrast = this.fContrast

		-- lod and view distance sliders
		this.fLODDistanceStep = 0.02
		this.fLODDistanceMin = 0.0
		this.fLODDistanceMax = 1.0
		this.fViewDistanceStep = 0.02
		this.fViewDistanceMin = 0.0
		this.fViewDistanceMax = 1.0

		AnimationMgr_AddAnimation(this.buttonlabels, {fStartAlpha = 0, fEndAlpha = 1,})
		
		this.iTextureQuality = 0
		
		ShowHideVerticalText(this.buttonlabels,ifs_opt_pcvideo_vbutton_layout)
		ShowHideVerticalButtons(this.buttons,ifs_opt_pcvideo_vbutton_layout)	
		
--		if(ScriptCB_IsPCVideoFixedFunction() ) then	
--			ScriptCB_IFObj_SetColor(this.buttons.bumpmapping.cpointer, 100, 100, 100)
--		else
--			ScriptCB_IFObj_SetColor(this.buttons.specularquality.cpointer, 100, 100, 100)
--		end

		
		ifs_opt_pcvideo_fnUpdateStrings(this)
	end, -- function Enter()
	
	Exit = function(this)
		if( this.bResetProfile ) then
			ScriptCB_ReloadMarkedProfile()
		end
		if(gCurHiliteButton) then
			IFButton_fnSelect(gCurHiliteButton,nil)
		end
	end,

	Input_Accept = function(this) 
		-- If base class handled this work, then we're done
		if(gShellScreen_fnDefaultInputAccept(this,1)) then
			return
		end

		if(gMouseListBox) then
			gMouseListBox.Layout.SelectedIdx = gMouseListBox.Layout.CursorIdx
			ListManager_fnFillContents(gMouseListBox,gMouseListBox.Contents,gMouseListBox.Layout)
		end
--  		print("ifs_opt_pcvideo Input_Accept. gMouseOverHorz = ",gMouseOverHorz)
--  		if(gMouseOverHorz) then
--  			print("  gMouseOverHorz.MousePercentage = ",gMouseOverHorz.MousePercentage)
--  			print("  gMouseOverHorz.tag = ",gMouseOverHorz.tag)
--  		end

		if((gMouseOverHorz) and (gMouseOverHorz.MousePercentage)) then
			-- Convert slider percentage into 0..10 scale used on this screen
			local NewVal = gMouseOverHorz.MousePercentage

			if(gMouseOverHorz.tag == "brightness") then
				this.fBrightness = this.fBrightnessMin + NewVal * (this.fBrightnessMax - this.fBrightnessMin)
				ScriptCB_SetPCBrightnessContrast(this.fBrightness, this.fContrast)
			elseif (gMouseOverHorz.tag == "contrast") then
				this.fContrast = this.fContrastMin + NewVal * (this.fContrastMax - this.fContrastMin)
				ScriptCB_SetPCBrightnessContrast(this.fBrightness, this.fContrast)
			elseif (gMouseOverHorz.tag == "viewdistance") then
				this.fViewDistance = this.fViewDistanceMin + NewVal * (this.fViewDistanceMax - this.fViewDistanceMin)
--				print("this.fViewDistance = ",this.fViewDistance)
			elseif (gMouseOverHorz.tag == "loddistance") then
				this.fLODDistance = this.fLODDistanceMin + NewVal * (this.fLODDistanceMax - this.fLODDistanceMin)
			end

			ifs_opt_pcvideo_fnUpdateStrings(this)

			return
		end
		
		if (this.res_menu_state ~= 0 and ifs_opt_pcvideo_reslistbox_layout.SelectedIdx) then

			-- the resolution popup is visible, so select the resolution
			local idx = ifs_opt_pcvideo_reslistbox_layout.SelectedIdx
			local res = ifs_opt_pcvideo_reslistbox_contents[idx]
			--store the selected res
			this.resX = res.resX
			this.resY = res.resY
			print("Res = ", this.resX, " x ", this.resY);
			print("Multisample = ", this.iMultiSample, " ", this.iMultiSampleQuality);
			local fsaaItem

			-- hide the listbox
			IFObj_fnSetVis(this.reslistbox,nil)
			-- show the other buttons
			IFObj_fnSetVis(this.buttons,1)
			IFObj_fnSetVis(this.sliders,1)
			-- back to main screen mode
			this.res_menu_state = 0

			for idx, fsaaItem in ifs_opt_pcvideo_fsaalistbox_contents do
				if (IsVideoModeSupported(this.resX, this.resY, fsaaItem.multisampleType, fsaaItem.multisampleQuality)) then
					ScriptCB_IFObj_SetColor(this.fsaalistbox[idx].cpointer, 255, 255, 255)
				else
					ScriptCB_IFObj_SetColor(this.fsaalistbox[idx].cpointer, 255, 0, 0)
					print("Multisample not supported: ", fsaaItem.multisampleType, " ", fsaaItem.multisampleQuality);
				end
			end
			
			fsaaItem = ifs_opt_pcvideo_fsaalistbox_contents[ifs_opt_pcvideo_fsaalistbox_layout.SelectedIdx]
			if (not IsVideoModeSupported(this.resX, this.resY, fsaaItem.multisampleType, fsaaItem.multisampleQuality)) then
				this.iMultiSample, this.iMultiSampleQuality = GetMaxMultisamplingModeForScreenSize(this.resX, this.resY);
				local selectIdx = 1
				if (this.iMultiSample ~= nil) then
					for idx, fsaaItem in ifs_opt_pcvideo_fsaalistbox_contents do
						if (fsaaItem.multisampleType == this.iMultiSample and fsaaItem.multisampleQuality == this.iMultiSampleQuality) then
							selectIdx = idx
							break
						end
					end
				else
					fsaaItem = ifs_opt_pcvideo_fsaalistbox_contents[selectIdx]
					this.iMultiSample = fsaaItem.multisampleType
					this.iMultiSampleQuality = fsaaItem.multisampleQuality
				end
				ifs_opt_pcvideo_fsaalistbox_layout.SelectedIdx = selectIdx

			print("Multisample -> ", this.iMultiSample, " ", this.iMultiSampleQuality);
			end

			-- update the button text
			ifs_opt_pcvideo_fnUpdateStrings(this)

		elseif (this.fsaa_menu_state ~= 0 and ifs_opt_pcvideo_fsaalistbox_layout.SelectedIdx) then

			-- the multisample popup is visible, so select the multisample mode
			local idx = ifs_opt_pcvideo_fsaalistbox_layout.SelectedIdx
			local fsaaItem = ifs_opt_pcvideo_fsaalistbox_contents[idx]
			--store the selected multisample mode
			this.iMultiSample = fsaaItem.multisampleType
			this.iMultiSampleQuality = fsaaItem.multisampleQuality
			print("Res = ", this.resX, " x ", this.resY);
			print("Multisample = ", this.iMultiSample, " ", this.iMultiSampleQuality);
			local resItem

			-- hide the listbox
			IFObj_fnSetVis(this.fsaalistbox,nil)
			-- show the other buttons
			IFObj_fnSetVis(this.buttons,1)
			IFObj_fnSetVis(this.sliders,1)
			-- back to main screen mode
			this.fsaa_menu_state = 0

			for idx, resItem in ifs_opt_pcvideo_reslistbox_contents do
				if (IsVideoModeSupported(resItem.resX, resItem.resY, this.iMultiSample, this.iMultiSampleQuality)) then
					ScriptCB_IFObj_SetColor(this.reslistbox[idx].cpointer, 255, 255, 255)
				else
					ScriptCB_IFObj_SetColor(this.reslistbox[idx].cpointer, 255, 0, 0)
					print("Res not supported: ", resItem.resX, " x ", resItem.resY);
				end
			end
			if (not IsVideoModeSupported(this.resX, this.resY, this.iMultiSample, this.iMultiSampleQuality)) then
				this.resX, this.resY = GetMaxScreenSizeForMultisamplingMode(this.iMultiSample, this.iMultiSampleQuality);
				local selectIdx = 0
				if (this.resX ~= nil) then
					for idx, resItem in ifs_opt_pcvideo_reslistbox_contents do
						if (resItem.resX == this.resX and resItem.resY == this.resY) then
							selectIdx = idx
							break
						end
					end
				else
					resItem = ifs_opt_pcvideo_reslistbox_contents[selectIdx]
					this.resX = fsaaItem.resX
					this.resY = fsaaItem.resY
				end
				ifs_opt_pcvideo_reslistbox_layout.SelectedIdx = selectIdx

				print("Res -> ", this.resX, " x ", this.resY);
			end

			-- update the button text
			ifs_opt_pcvideo_fnUpdateStrings(this)

		else	-- if one of the popups isn't shown
			-- if we're on the 'cancel' button, then bail
			if (this.CurButton == "cancel") then
				this.bResetProfile = 1

				-- reset the brightness and contrast
				ScriptCB_SetPCBrightnessContrast(this.fOriginalBrightness, this.fOriginalContrast)
				-- bail			
				ScriptCB_SndPlaySound("shell_menu_exit");
				ScriptCB_PopScreen()
				
				--if we selected the apply button
			elseif (this.CurButton == "apply") then
				
				ScriptCB_SndPlaySound("shell_menu_enter");
				-- apply all the changes, then bail
				if(ScriptCB_GetShellActive()) then
					-- only change resolutions in the shell
					ScriptCB_SetResolution(this.resX,this.resY)
				end
				-- change other options all the time
				ScriptCB_SetPCVideoOptions(this.iTextureDetail, this.iTextureQuality, this.iMultiSample, this.iMultiSampleQuality, this.iWaterQuality, this.iTerrainQuality, this.iParticleQuality, this.iShadowQuality, this.iSpecularQuality, this.bBumpMapping, this.bMotionBlur, this.bDistortion, this.bWindowed, this.fBrightness, this.fContrast, this.fViewDistance, this.fLODDistance, this.bVsync)
				this.fOriginalBrightness = this.fBrightness
				this.fOriginalContrast = this.fContrast
				-- done
				ScriptCB_PopScreen()
				
			elseif (this.CurButton == "autodetect") then
				
				ScriptCB_SndPlaySound("shell_menu_enter");
				
				-- get the autodetected options
				local autodetect = {}
				autodetect.resIndex, autodetect.fsaaIndex, autodetect.iTextureDetail, autodetect.iTextureQuality, 
				autodetect.fBrightness, autodetect.fContrast, autodetect.fViewDistance, autodetect.fLODDistance,
				autodetect.iWaterQuality, autodetect.iTerrainQuality, autodetect.iParticleQuality, autodetect.iShadowQuality, autodetect.iSpecularQuality,
				autodetect.bBumpMapping, autodetect.bMotionBlur, autodetect.bDistortion, 
				autodetect.bWindowed, autodetect.bVsync = ScriptCB_GetAutodetectPCVideoOptions()

				this.resX, this.resY = ScriptCB_GetIdealResolution()
				--go from res to index?
				for idx, resItem in ifs_opt_pcvideo_reslistbox_contents do
					if (resItem.resX == this.resX and resItem.resY == this.resY) then
						autodetect.resIndex = idx
		
						break
					end
				end
				
				-- set only the visible options
				if( not this.buttonlabels.texturedetail.hidden ) then this.iTextureDetail = autodetect.iTextureDetail end
--				if( not this.buttonlabels.texturequality.hidden ) then this.iTextureQuality = autodetect.iTextureQuality end
				if( not this.buttonlabels.brightness.hidden ) then this.fBrightness = autodetect.fBrightness end
				if( not this.buttonlabels.contrast.hidden ) then this.fContrast = autodetect.fContrast end
				if( not this.buttonlabels.viewdistance.hidden ) then this.fViewDistance = autodetect.fViewDistance end		
				if( not this.buttonlabels.loddistance.hidden ) then this.fLODDistance = autodetect.fLODDistance end		
				if( not this.buttonlabels.waterquality.hidden ) then this.iWaterQuality = autodetect.iWaterQuality end		
				if( not this.buttonlabels.terrainquality.hidden ) then this.iTerrainQuality = autodetect.iTerrainQuality end	
				if( not this.buttonlabels.particlequality.hidden ) then this.iParticleQuality = autodetect.iParticleQuality end
				if( not this.buttonlabels.shadowquality.hidden ) then this.iShadowQuality = autodetect.iShadowQuality end				
				if( not this.buttonlabels.specularquality.hidden ) then this.iSpecularQuality = autodetect.iSpecularQuality end				
				if( not this.buttonlabels.bumpmapping.hidden ) then this.bBumpMapping = autodetect.bBumpMapping end		
				if( not this.buttonlabels.motionblur.hidden ) then this.bMotionBlur = autodetect.bMotionBlur end		
				if( not this.buttonlabels.distortion.hidden ) then this.bDistortion = autodetect.bDistortion end		
			--	if( not this.buttonlabels.windowed.hidden ) then this.bWindowed = autodetect.bWindowed end			
				if( not this.buttonlabels.vsync.hidden ) then this.bVsync = autodetect.bVsync end				


				if( not this.buttonlabels.resolution.hidden ) then
					ifs_opt_pcvideo_reslistbox_layout.SelectedIdx = autodetect.resIndex
					ifs_opt_pcvideo_reslistbox_layout.CursorIdx = autodetect.resIndex
					ifs_opt_pcvideo_reslistbox_layout.FirstShownIdx = autodetect.resIndex
					-- store the selected resolution
					local resItem = ifs_opt_pcvideo_reslistbox_contents[autodetect.resIndex]
					this.resX = resItem.resX
					this.resY = resItem.resY
				end

				if( not this.buttonlabels.multisample.hidden ) then
					ifs_opt_pcvideo_fsaalistbox_layout.SelectedIdx = autodetect.fsaaIndex
					ifs_opt_pcvideo_fsaalistbox_layout.CursorIdx = autodetect.fsaaIndex
					ifs_opt_pcvideo_fsaalistbox_layout.FirstShownIdx = autodetect.fsaaIndex
					-- store the selected resolution
					local fsaaItem = ifs_opt_pcvideo_fsaalistbox_contents[autodetect.fsaaIndex]
					this.iMultiSample = fsaaItem.multisampleType
					this.iMultiSampleQuality = fsaaItem.multisampleQuality
				end

				-- all other options
				ifs_opt_pcvideo_fnUpdateStrings(this)
				
				-- if we're on the resolution box:
			elseif (this.CurButton == "resolution") then
				
				ScriptCB_SndPlaySound("shell_menu_ok");
				-- go into listbox mode
				this.res_menu_state = 1

				-- show the listbox
				IFObj_fnSetVis(this.reslistbox,1)
				local idx = ifs_opt_pcvideo_reslistbox_layout.SelectedIdx
				this.reslistbox.SelectedIdx = idx
				this.reslistbox.CursorIdx = idx 
				this.reslistbox.FirstShownIdx = idx
				ListManager_fnFillContents(this.reslistbox,ifs_opt_pcvideo_reslistbox_contents,ifs_opt_pcvideo_reslistbox_layout)	
				-- hide the other buttons
				IFObj_fnSetVis(this.buttons,nil)
				IFObj_fnSetVis(this.sliders,nil)

			elseif (this.CurButton == "multisample") then
				
				ScriptCB_SndPlaySound("shell_menu_ok");
				-- go into listbox mode
				this.fsaa_menu_state = 1

				-- show the listbox
				IFObj_fnSetVis(this.fsaalistbox,1)
				local idx = ifs_opt_pcvideo_fsaalistbox_layout.SelectedIdx
				this.fsaalistbox.SelectedIdx = idx
				this.fsaalistbox.CursorIdx = idx 
				this.fsaalistbox.FirstShownIdx = idx
				-- hide the other buttons
				IFObj_fnSetVis(this.buttons,nil)
				IFObj_fnSetVis(this.sliders,nil)

			else -- we've just changed an option
				
				-- Sliders special-cased above
				if((this.CurButton ~= "brightness") and (this.CurButton ~= "contrast") and
					 (this.CurButton ~= "viewdistance") and (this.CurButton ~= "loddistance")) then
					ScriptCB_SndPlaySound("shell_menu_ok");
					-- just change one of the other settings
					ifs_opt_pcvideo_ChangeSetting(this,1)
					ifs_opt_pcvideo_fnUpdateStrings(this)
				end
			end
		end
	end,

	Input_Back = function(this)
	    ScriptCB_SndPlaySound("shell_menu_exit")
		if (this.res_menu_state ~= 0) then

			-- hide the listbox
			IFObj_fnSetVis(this.reslistbox,nil)
			-- show the other buttons
			IFObj_fnSetVis(this.buttons,1)
			IFObj_fnSetVis(this.sliders,1)
			-- back to main screen mode
			this.res_menu_state = 0

		elseif (this.fsaa_menu_state ~= 0) then

			-- hide the listbox
			IFObj_fnSetVis(this.fsaalistbox,nil)
			-- show the other buttons
			IFObj_fnSetVis(this.buttons,1)
			IFObj_fnSetVis(this.sliders,1)
			-- back to main screen mode
			this.fsaa_menu_state = 0

		else
		
			-- bail			
			ScriptCB_SndPlaySound("shell_menu_exit")
			-- apply all the changes, then bail
			if(ScriptCB_GetShellActive()) then
				-- only change resolutions in the shell
				ScriptCB_SetResolution(this.resX,this.resY)
			end
				-- change other options all the time
			ScriptCB_SetPCVideoOptions(this.iTextureDetail, this.iTextureQuality, this.iMultiSample, this.iMultiSampleQuality, this.iWaterQuality, this.iTerrainQuality, this.iParticleQuality, this.iShadowQuality, this.iSpecularQuality, this.bBumpMapping, this.bMotionBlur, this.bDistortion, this.bWindowed, this.fBrightness, this.fContrast, this.fViewDistance, this.fLODDistance, this.bVsync)
			this.fOriginalBrightness = this.fBrightness
			this.fOriginalContrast = this.fContrast
			-- done

			ScriptCB_PopScreen()
		
		end
	end,

	Input_GeneralRight = function(this)
    	if (this.res_menu_state == 0 and this.fsaa_menu_state == 0) then
		    ScriptCB_SndPlaySound("shell_menu_ok");
			ifs_opt_pcvideo_ChangeSetting(this,1)
			ifs_opt_pcvideo_fnUpdateStrings(this)
		end
	end,

	Input_GeneralLeft = function(this)
    ScriptCB_SndPlaySound("shell_menu_ok");
    	if (this.res_menu_state == 0 and this.fsaa_menu_state == 0) then
			ifs_opt_pcvideo_ChangeSetting(this,0)
			ifs_opt_pcvideo_fnUpdateStrings(this)
		end
	end,

	Input_GeneralUp = function(this)
		-- If base class handled this work, then we're done
		if(gShellScreen_fnDefaultInputUp(this)) then
			return
		end

		-- if we're in the listbox
		if (this.res_menu_state ~= 0) then
--			ListManager_fnNavUp(this.reslistbox,ifs_opt_pcvideo_reslistbox_contents,ifs_opt_pcvideo_reslistbox_layout)
		elseif (this.fsaa_menu_state ~= 0) then
--			ListManager_fnNavUp(this.fsaalistbox,ifs_opt_pcvideo_fsaalistbox_contents,ifs_opt_pcvideo_fsaalistbox_layout)
		else
			-- update the general buttons
			gDefault_Input_GeneralUp(this)
			ifs_opt_pcvideo_fnUpdateStrings(this)
		end
	end,

	Input_GeneralDown = function(this)
		-- If base class handled this work, then we're done
		if(gShellScreen_fnDefaultInputDown(this)) then
			return
		end

		-- if we're in the listbox
		if (this.res_menu_state ~= 0) then
--			ListManager_fnNavDown(this.reslistbox,ifs_opt_pcvideo_reslistbox_contents,ifs_opt_pcvideo_reslistbox_layout)
		elseif (this.fsaa_menu_state ~= 0) then
--			ListManager_fnNavDown(this.fsaalistbox,ifs_opt_pcvideo_fsaalistbox_contents,ifs_opt_pcvideo_fsaalistbox_layout)
		else
			-- update general buttons
			gDefault_Input_GeneralDown(this)
			ifs_opt_pcvideo_fnUpdateStrings(this)
		end
	end,

	Update = function(this, fDt)
 		gIFShellScreenTemplate_fnUpdate(this, fDt)  -- always call base class

		HSlider_fnSetAlpha(this.sliders.brightness,0.5) -- dim unselected one
		HSlider_fnSetAlpha(this.sliders.contrast,0.5) -- dim unselected one	
		HSlider_fnSetAlpha(this.sliders.loddistance,0.5) -- dim unselected one		
		HSlider_fnSetAlpha(this.sliders.viewdistance,0.5) -- dim unselected one		
		if(gMouseOverHorz) then
			HSlider_fnSetAlpha(gMouseOverHorz,1.0) -- brite selected one
		end
		
		if( (this.CurButton == "brightness") or ( this.CurButton == "contrast") or  ( this.CurButton == "viewdistance") or  ( this.CurButton == "loddistance") ) then
			HSlider_fnSetAlpha(this.sliders[this.CurButton],1.0) -- brite selected one
		end
	end,
}

ifs_opt_pcvideo_vbutton_layout = {
	yTop = 30,
	yHeight = 25,
	ySpacing  = 0,
	
	width = 400,
	font = "gamefont_tiny",
	LeftJustify = 1,	--buttons
	RightJustifyT = 1,	--text
	flashy = 0,
	
	buttonlist = {
		-- Title is for the left column, string the option (filled in by code later)
		{ tag = "brightness", title = "ifs.videoopt.brightness", string = "" },
		{ tag = "contrast", title = "ifs.videoopt.contrast", string = "" },	
		{ tag = "viewdistance", title = "ifs.videopt.viewdistance", string = "" },
		{ tag = "loddistance", title = "ifs.videopt.loddistance", string = "" },
		{ tag = "vsync", title = "ifs.videopt.vsync", string = "" },
		{ tag = "resolution", title = "ifs.videopt.resolution", string = "", },
--	{ tag = "windowed", title = "ifs.videopt.windowed", string = "" },
		{ tag = "multisample", title = "ifs.videopt.multisample", string = ""},
		{ tag = "texturedetail", title = "ifs.videoopt.texturedetail", string = "" },
--		{ tag = "texturequality", title = "ifs.videoopt.texturequality", string = "" },
		{ tag = "terrainquality", title = "ifs.videoopt.terrainquality", string = "" },
		{ tag = "waterquality", title = "ifs.videoopt.waterquality", string = "" },
		{ tag = "particlequality", title = "ifs.videopt.particlequality", string = "" },
		{ tag = "shadowquality", title = "ifs.videopt.shadows", string = "" },
		{ tag = "specularquality", title = "ifs.videopt.specularquality", string = "" },
		{ tag = "bumpmapping", title = "ifs.videopt.bumpmapping", string = "" },
		{ tag = "motionblur", title = "ifs.videoopt.motionblur", string = "" },
		{ tag = "distortion", title = "ifs.videoopt.distortion", string = "" },
--		{ tag = "autodetect", title = "", string = "ifs.videoopt.autodetect" },
--		{ tag = "apply", title = "", string = "ifs.videoopt.apply" },
--		{ tag = "cancel", title = "", string = "ifs.videoopt.cancel" },
	},
}

-- Helper function. Given a layout (x,y,width, height), returns a
-- fully-built item.
function reslistbox_CreateItem(layout)
	-- Make a coordinate system pegged to the top-left of where the cursor would go.
	local Temp = NewIFContainer { x = layout.x - 0.5 * layout.width, y=layout.y - 10}
	Temp.NameStr = NewIFText{ x = 10, y = 0, halign = "left", font = "gamefont_medium", textw = 100,}
	return Temp
end

-- Helper function. For a destination item (previously created w/
-- CreateItem), fills it in with data, which may be nil (==blank it)
function reslistbox_PopulateItem(Dest,Data)
	if(Data) then
		-- Show this entry
		IFText_fnSetUString(Dest.NameStr,Data.showstr)
		IFObj_fnSetVis(Dest.NameStr,1)
	else
		-- Blank this entry
		IFText_fnSetString(Dest.NameStr,"")
		IFObj_fnSetVis(Dest.NameStr,nil)
	end
end

reslistbox_contents = {
}

reslistbox_layout = {
	showcount = 20,
	yHeight = 24,
	ySpacing  = 0,
	width = 200,
	--x = -200,
	--slider = 1,
	flashy = 0,
	CreateFn = reslistbox_CreateItem,
	PopulateFn = reslistbox_PopulateItem,
}


-- Helper function. Given a layout (x,y,width, height), returns a
-- fully-built item.
function fsaalistbox_CreateItem(layout)
	-- Make a coordinate system pegged to the top-left of where the cursor would go.
	local Temp = NewIFContainer { x = layout.x - 0.5 * layout.width, y=layout.y - 10}
	Temp.NameStr = NewIFText{ x = 10, y = 0, halign = "left", font = "gamefont_medium", textw = 100,}
	return Temp
end

-- Helper function. For a destination item (previously created w/
-- CreateItem), fills it in with data, which may be nil (==blank it)
function fsaalistbox_PopulateItem(Dest,Data)
	if(Data) then
		-- Show this entry
		IFText_fnSetUString(Dest.NameStr,Data.showstr)
		IFObj_fnSetVis(Dest.NameStr,1)
	else
		-- Blank this entry
		IFText_fnSetString(Dest.NameStr,"")
		IFObj_fnSetVis(Dest.NameStr,nil)
	end
end

fsaalistbox_contents = {
}

fsaalistbox_layout = {
	showcount = 20,
	yHeight = 24,
	ySpacing  = 0,
	width = 200,
	--x = -200,
	--slider = 1,
	flashy = 0,
	CreateFn = fsaalistbox_CreateItem,
	PopulateFn = fsaalistbox_PopulateItem,
}

function ifs_opt_pcvideo_fnBuildScreen(this,layout)
	-- Ask game for screen size, used to make sliders
	local w
	local h
	w,h = ScriptCB_GetSafeScreenInfo()
	
	-- resolution listbox
	--ifs_opt_pcvideo_reslistbox_layout.width = 200  --w * 0.3
	ListManager_fnInitList(this.reslistbox,ifs_opt_pcvideo_reslistbox_layout)
	--this.reslistbox.width = 200  --w * 0.3

	-- multisample listbox
	ListManager_fnInitList(this.fsaalistbox,ifs_opt_pcvideo_fsaalistbox_layout)

	-- add buttons
	this.buttonlabels = NewIFContainer {
		ScreenRelativeX = 0.5,
		ScreenRelativeY = 0,
		x = -layout.width - 15,
	}

	this.buttons = NewIFContainer {
		ScreenRelativeX = 0.5,
		ScreenRelativeY = 0,
		x = 15,
	}
	
	this.sliders = NewIFContainer {
		ScreenRelativeX = 0.5,
		ScreenRelativeY = 0,
		x = 15,
	}
	
	layout.ySpacing  = h*.007
	if ( h > 700 ) then
		layout.font = "gamefont_medium"
		layout.ySpacing  = h*.02
	end	
	layout.ySpacing = (h - 19*layout.yHeight)  /19
	
	AddVerticalText(this.buttonlabels,layout)
	this.CurButton = AddVerticalButtons(this.buttons,layout)
	
	local sliderWidth = 100
	-- brightness slider
	this.sliders.brightness = NewHSlider {
		x = sliderWidth/2, y = this.buttons.brightness.y+3, 
		width = sliderWidth, height = 24, thumbwidth = 10, 
	}
	this.sliders.brightness.tag = "brightness"
	
	-- contrast slider
	this.sliders.contrast = NewHSlider { 
		x = sliderWidth/2, y = this.buttons.contrast.y+3, 
		width = sliderWidth, height = 24, thumbwidth = 10, 
	}
	this.sliders.contrast.tag = "contrast"

	-- lod distance slider
	this.sliders.loddistance = NewHSlider {
		x = sliderWidth/2, y = this.buttons.loddistance.y+3, 
		width = sliderWidth, height = 24, thumbwidth = 10,
	}
	this.sliders.loddistance.tag = "loddistance"

	-- view distance slider
	this.sliders.viewdistance = NewHSlider {
		x = sliderWidth/2, y = this.buttons.viewdistance.y+3, 
		width = sliderWidth, height = 24, thumbwidth = 10,
	}
	this.sliders.viewdistance.tag = "viewdistance"
	
 	local BackButtonW = 100
	local BackButtonH = 25
	this.donebutton =	NewIFContainer
	{
		ScreenRelativeX = 1.0, -- right
		ScreenRelativeY = 1.0, -- bottom
		y = -15, -- just above bottom
		x = -BackButtonW,
		btn = NewClickableIFButton -- NewRoundIFButton 
		{ 
			btnw = BackButtonW, 
			btnh = BackButtonH,
			font = "gamefont_medium", 
			bg_width = BackButtonW, 
			tag = "apply",
			bg_xflipped = 1,
			nocreatebackground=1,			
		}, -- end of btn
	}
	RoundIFButtonLabel_fnSetString(this.donebutton.btn,"common.accept")
	
	this.cancelbutton =	NewIFContainer
	{
		ScreenRelativeX = 0.0, -- right
		ScreenRelativeY = 1.0, -- bottom
		y = -15, -- just above bottom
		x = BackButtonW,
		btn = NewClickableIFButton -- NewRoundIFButton 
		{ 
			btnw = BackButtonW, 
			btnh = BackButtonH,
			font = "gamefont_medium", 
			bg_width = BackButtonW, 
			
			tag = "cancel",
			nocreatebackground=1,			
		}, -- end of btn
	}
	RoundIFButtonLabel_fnSetString(this.cancelbutton.btn,"common.cancel")

	this.autodetectbutton =	NewIFContainer
	{
		ScreenRelativeX = 0.5,
		ScreenRelativeY = 1.0,
		y = -15,
		x = 0,
		btn = NewClickableIFButton
		{ 
			btnw = BackButtonW*2, 
			btnh = BackButtonH,
			font = "gamefont_medium",
			tag = "autodetect",
			nocreatebackground=1,			
		}, -- end of btn
	}
	RoundIFButtonLabel_fnSetString(this.autodetectbutton.btn,"ifs.videoopt.autodetect")
	
	
	this.Background = NewIFImage 
	{
 			ZPos = 255, 
 			x = w/2,  --centered on the x
 			y = h/2, -- inertUVs = 1,
 			alpha = 10,
 			localpos_l = -w/1.5, localpos_t = -h/1.5,
 			localpos_r = w/1.5, localpos_b =  h/1.5,
			texture = "opaque_black",
			ColorR = 20, ColorG = 20, ColorB = 150, -- blue
 	}
end


ifs_opt_pcvideo_fnBuildScreen(ifs_opt_pcvideo,ifs_opt_pcvideo_vbutton_layout)
ifs_opt_pcvideo_fnBuildScreen = nil

AddIFScreen(ifs_opt_pcvideo,"ifs_opt_pcvideo")