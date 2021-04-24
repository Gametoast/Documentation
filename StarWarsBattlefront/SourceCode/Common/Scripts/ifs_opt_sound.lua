-- Helper function, sets text of

function ifs_opt_sound_fnUpdateSliders(this)

	--	print("curbutton=",this.CurButton )
	local VolMusic, VolSfx, VolVoice, MaxVol, VolMaster = ScriptCB_GetVolumes()

	this.sliders.master.thumbposn = (VolMaster / MaxVol)
	HSlider_MoveThumb(this.sliders.master)
	this.sliders.music.thumbposn = (VolMusic / MaxVol)
	HSlider_MoveThumb(this.sliders.music)
	this.sliders.sfx.thumbposn = (VolSfx / MaxVol)
	HSlider_MoveThumb(this.sliders.sfx)
	this.sliders.voice.thumbposn = (VolVoice / MaxVol)
	HSlider_MoveThumb(this.sliders.voice)

	if(MaxVol == 10) then
		-- #%)(#%( rounding errors on PS2. This is a shortcut that seems to work
		-- better than divide by 10, multiply by 100
        RoundIFButtonLabel_fnSetUString(this.buttons.master, ScriptCB_tounicode(format("%d%%",VolMaster * 10)))
		RoundIFButtonLabel_fnSetUString(this.buttons.music, ScriptCB_tounicode(format("%d%%",VolMusic * 10)))
		RoundIFButtonLabel_fnSetUString(this.buttons.sfx,   ScriptCB_tounicode(format("%d%%",VolSfx * 10)))
		RoundIFButtonLabel_fnSetUString(this.buttons.voice, ScriptCB_tounicode(format("%d%%",VolVoice * 10)))
	else
        RoundIFButtonLabel_fnSetUString(this.buttons.master, ScriptCB_tounicode(format("%d%%",(VolMaster / MaxVol) * 100)))
		RoundIFButtonLabel_fnSetUString(this.buttons.music, ScriptCB_tounicode(format("%d%%",VolMusic / MaxVol * 100)))
		RoundIFButtonLabel_fnSetUString(this.buttons.sfx,   ScriptCB_tounicode(format("%d%%",VolSfx / MaxVol * 100)))
		RoundIFButtonLabel_fnSetUString(this.buttons.voice, ScriptCB_tounicode(format("%d%%",VolVoice / MaxVol * 100)))
	end

end

function ifs_opt_sound_fnIsASlider(button)	
    return (button == "master" or 
            button == "music"  or 
            button == "sfx"    or
            button == "voice")
end

function ifs_opt_sound_SetAlpha(cpointer, val)
	if (ScriptCB_IFObj_GetAlpha(cpointer) ~= val) then
		ScriptCB_IFObj_SetAlpha(cpointer, val)
--		print("ifs_opt_sound_SetAlpha(", cpointer, val)
	end
end

function ifs_opt_sound_getBarSize(this)
    -- Ask game for screen size, used to make sliders
	local w
	local h
	w,h = ScriptCB_GetSafeScreenInfo()

	this.sliders.ScreenRelativeX = this.buttonlabels.ScreenRelativeX

	local SizeOfBar = 0.75 - this.buttonlabels.ScreenRelativeX

	return w * SizeOfBar
end

function ifs_opt_sound_updateLogo(this)
	if (gPlatformStr == "PC") then
		local shellActive = ScriptCB_GetShellActive()    
		if (shellActive) then
			local EAXversion  = ScriptCB_GetEAXVersion()
			
			-- display eax logo
			if (EAXversion < 3) then
				IFImage_fnSetTexture(this.soundlogo, "eax_logo")
			else
				IFImage_fnSetTexture(this.soundlogo, "eaxhd_logo")
			end
			
			-- if EAX is enabled 
			if (EAXversion > 0) then 
				if (this.soundlogo.cpointer) then
					ifs_opt_sound_SetAlpha(this.soundlogo.cpointer, 1)   -- bright
				end
				
				if (EAXversion >= 3) then
					IFObj_fnSetAlpha(this.logoInfos.envmorphing, 1)
					--IFObj_fnSetAlpha(this.logoInfos.envpanning,  1)
					-- don't support environmental panning
					IFObj_fnSetVis(this.logoInfos.envpanning,  nil)
				end
				
				if (EAXversion >= 2) then
					IFObj_fnSetAlpha(this.logoInfos.occulsion,   1)
				end
				
				if (EAXversion >= 1) then
					IFObj_fnSetAlpha(this.logoInfos.reverb,      1)
				end
				
			else
				if (this.soundlogo.cpointer) then
					ifs_opt_sound_SetAlpha(this.soundlogo.cpointer, 0.3) -- dim
				end
				
				IFObj_fnSetAlpha(this.logoInfos.envmorphing, 0.3)
				--IFObj_fnSetAlpha(this.logoInfos.envpanning,  0.3)
				-- don't support environmental panning
				IFObj_fnSetVis(this.logoInfos.envpanning,  nil)
				IFObj_fnSetAlpha(this.logoInfos.occulsion,   0.3)
				IFObj_fnSetAlpha(this.logoInfos.reverb,      0.3)
			end
		else
			IFObj_fnSetVis(this.soundlogo,             nil)
			IFObj_fnSetVis(this.logoInfos.envmorphing, nil)
			IFObj_fnSetVis(this.logoInfos.envpanning,  nil)
			IFObj_fnSetVis(this.logoInfos.occulsion,   nil)
			IFObj_fnSetVis(this.logoInfos.reverb,      nil)
		end
	else
		IFObj_fnSetVis(this.soundlogo, nil)
	end
end

function ifs_opt_sound_closeShellSound(this)
	-- movie player depends upon the sound engine
	ScriptCB_CloseMovie()
end

function ifs_opt_sound_restoreShellSound(bgMovie)
	-- read sound data
	ReadDataFileInGame("sound\\shell.lvl")

	-- open voice over stream
	gVoiceOverStream = OpenAudioStream("sound\\shell.lvl", "shell_vo")
	-- open music stream
	gMusicStream     = OpenAudioStream("sound\\shell.lvl", "shell_music")
	
	-- open movie stream    
	ScriptCB_OpenMovie(gMovieStream, "")
	ScriptCB_SetMovieAudioBus("shellmovies")
	
	-- set playback interval to 0
	ScriptCB_SetShellMusicInterval()
	
	-- restart background movie 
	if (bgMovie) then
		ifelem_shellscreen_fnStartMovie(bgMovie, 0, nil, 1)
	end
end

-- Updates buttons, hilighlights, etc. To be called when something changes.
function ifs_opt_sound_fnUpdateButtons(this)
	local OutputMode = ScriptCB_GetOutputMode()
	local MixConfig  = ScriptCB_GetMixConfig()
	
	-- setup the other text
	-- see enum SpeakerConfig in sndenginebase.h for values
	if (OutputMode == 1) then
		RoundIFButtonLabel_fnSetString(this.buttons.output, "ifs.soundopt.outputmode.mono")
	elseif (OutputMode == 2) then
		RoundIFButtonLabel_fnSetString(this.buttons.output, "ifs.soundopt.outputmode.headphones")
	elseif (OutputMode == 3) then
		RoundIFButtonLabel_fnSetString(this.buttons.output, "ifs.soundopt.outputmode.stereo")
	elseif (OutputMode == 4) then
		if (MixConfig == 1 or gPlatformStr == "PS2") then
			RoundIFButtonLabel_fnSetString(this.buttons.output, "ifs.soundopt.outputmode.dolby")
		else
			RoundIFButtonLabel_fnSetString(this.buttons.output, "ifs.soundopt.outputmode.surround")
		end
	elseif (OutputMode == 5) then
		RoundIFButtonLabel_fnSetString(this.buttons.output, "ifs.soundopt.outputmode.4point0")
	elseif (OutputMode == 6) then
		RoundIFButtonLabel_fnSetString(this.buttons.output, "ifs.soundopt.outputmode.5point1")
	elseif (OutputMode == 7) then
		RoundIFButtonLabel_fnSetString(this.buttons.output, "ifs.soundopt.outputmode.7point1")
	end
	
	-- highlight / dim bass management option
    if ((MixConfig == 2) and (OutputMode >= 6)) then
		ifs_opt_sound_SetAlpha(this.buttons.bassmang.label.cpointer, 1.0)
		this.buttons.bassmang.hidden = nil
	else
		ifs_opt_sound_SetAlpha(this.buttons.bassmang.label.cpointer, 0.5)
		this.buttons.bassmang.hidden = 1
	end
	
	-- highlight / dim effects depending on support
	local hweffects, hwmixing = ScriptCB_HWSupport()
	if ( (MixConfig == 2 and hweffects) or MixConfig == 1 ) then
		ifs_opt_sound_SetAlpha(this.buttons.effects.label.cpointer, 1.0)
		this.buttons.effects.hidden = nil
	else
		ifs_opt_sound_SetAlpha(this.buttons.effects.label.cpointer, 0.5)
		this.buttons.effects.hidden = 1
	end
	
	-- highlight / dim mixing configuration depending on support
	if (hwmixing) then
		ifs_opt_sound_SetAlpha(this.buttons.mixconfig.label.cpointer, 1.0)
		this.buttons.mixconfig.hidden = nil
	else
		ifs_opt_sound_SetAlpha(this.buttons.mixconfig.label.cpointer, 0.5)
		this.buttons.mixconfig.hidden = 1
	end

	-- see enum MixConfig in win/sndengine.h for values
	if (MixConfig == 1 or MixConfig == 3) then
		RoundIFButtonLabel_fnSetString(this.buttons.mixconfig, "ifs.soundopt.mixconfig.software")
	elseif (MixConfig == 2) then
		RoundIFButtonLabel_fnSetString(this.buttons.mixconfig, "ifs.soundopt.mixconfig.hardware")
	elseif (MixConfig == 4) then
		RoundIFButtonLabel_fnSetString(this.buttons.mixconfig, "ifs.soundopt.mixconfig.disabled")
	end

	if (ScriptCB_EffectsEnabled()) then
		RoundIFButtonLabel_fnSetString(this.buttons.effects, "ifs.soundopt.effects.on")
	else
		RoundIFButtonLabel_fnSetString(this.buttons.effects, "ifs.soundopt.effects.off")
	end
	
	if (ScriptCB_GetBassManagement()) then
		RoundIFButtonLabel_fnSetString(this.buttons.bassmang, "ifs.soundopt.effects.on")
	else
		RoundIFButtonLabel_fnSetString(this.buttons.bassmang, "ifs.soundopt.effects.off")
	end

	ifs_opt_sound_updateLogo(this)

end

ifs_opt_sound = NewIFShellScreen {
	nologo = 1,
	movieIntro      = nil, -- played before the screen is displayed
	movieBackground = nil, -- played while the screen is displayed
	bNohelptext_backPC = 1,
	title = NewIFText {
		string = "ifs.SoundOpt.title",
		font = "gamefont_large",
		y = 0,
		textw = 460, -- center on screen. Fixme: do real centering!
		ScreenRelativeX = 0.5, -- center
		ScreenRelativeY = 0, -- top
		inert = 1, -- delete out of Lua mem when pushed to C
		nocreatebackground = 1,
	},

	-- Note: this ScreenRelativeX is used to determine the size of
	-- the sliders
	buttonlabels = NewIFContainer {
		ScreenRelativeX = 0.4, -- right-justified to this
		ScreenRelativeY = 0,
	},

	buttons = NewIFContainer {
		ScreenRelativeX = 1, -- text right-justified within this
		ScreenRelativeY = 0,
	},

	sliders = NewIFContainer {
--		ScreenRelativeX = 0.4, -- auto-copied from buttonlabels
		ScreenRelativeY = 0,
	},
	
	soundlogo = NewIFImage {
		-- IFObj
		ScreenRelativeX = 0.2,
		ScreenRelativeY = 0.72,
		UseSafezone     = 0,
		
		-- IFImage 
		localpos_l      = 0,
		localpos_t      = 0,
		localpos_r      = 212,
		localpos_b      = 66,
	},
	
	logoInfos = NewIFContainer {
	    font = "gamefont_small",
	    ScreenRelativeX = 0.5,
	    ScreenRelativeY = 0.70
	},

	bNohelptext_accept = 1, -- we have our own, renamed version

	-- When entering this screen, check if we need to save (triggered
	-- by a subscreen or something). If so, start that process.
	Enter = function(this, bFwd)
		ScriptCB_MarkCurrentProfile()		
		this.bResetProfile = nil
		
		-- set label visiblity 
		local shellActive = ScriptCB_GetShellActive()
		local isPC        = (gPlatformStr == "PC")

		this.buttonlabels.output.hidden    = (gPlatformStr == "XBox") or (isPC and not shellActive)
		this.buttonlabels.mixconfig.hidden = not isPC or not shellActive
		this.buttonlabels.effects.hidden   = not isPC or not shellActive
		this.buttonlabels.reset.hidden     = not isPC or not shellActive
		
		-- hide some of the labels
		if (this.buttonlabels.output.hidden) then
			IFObj_fnSetVis(this.buttonlabels.output,    nil)
			IFObj_fnSetVis(this.buttons.output,         nil)
		end
		if (this.buttonlabels.mixconfig.hidden) then
			IFObj_fnSetVis(this.buttonlabels.mixconfig, nil)
			IFObj_fnSetVis(this.buttons.mixconfig,      nil)
		end
		if (this.buttonlabels.effects.hidden) then
			IFObj_fnSetVis(this.buttonlabels.effects,   nil)
			IFObj_fnSetVis(this.buttons.effects,        nil)
		end
		if (this.buttonlabels.reset.hidden) then
			IFObj_fnSetVis(this.buttonlabels.reset,     nil)
			IFObj_fnSetVis(this.buttons.reset,          nil)
		end
		
		-- make sure music is constantly playing
		ScriptCB_SetShellMusicInterval(0.0)
		if (not shellActive) then
			-- turn off in game buses
			ScriptCB_SndBusFade("soundfx",     0.0, 0.0);
			ScriptCB_SndBusFade("ambience",    0.0, 0.0);
			ScriptCB_SndBusFade("voiceover",   0.0, 0.0);
			-- fade in music bus as we need to hear it for the music slider
			ScriptCB_SndBusFade("ingame",      0.5, 1.0);           
		end

		ifs_opt_sound_updateLogo(this)
		
		gIFShellScreenTemplate_fnEnter(this, bFwd) -- call default enter function
		AnimationMgr_AddAnimation(this.buttonlabels, {fStartAlpha = 0, fEndAlpha = 1,})
		AnimationMgr_AddAnimation(this.sliders,      {fStartAlpha = 0, fEndAlpha = 1,})
		AnimationMgr_AddAnimation(this.soundlogo,    {fStartAlpha = 0, fEndAlpha = 1,})
		
		ifs_opt_sound_fnUpdateButtons(this)
		ifs_opt_sound_fnUpdateSliders(this)
		-- reset the current button to the first item
		this.CurButton = "master"

	end, -- function Enter()
    
	Exit = function(this, bFwd)
	
		if( this.bResetProfile ) then
			ScriptCB_ReloadMarkedProfile()
		end
		if(gCurHiliteButton) then
			IFButton_fnSelect(gCurHiliteButton,nil)
		end

		-- set label visiblity 
		local shellActive = ScriptCB_GetShellActive()
        
		if (not shellActive) then
			-- turn on in game subbuses
			ScriptCB_SndBusFade("soundfx",     1.0, 1.0);
			ScriptCB_SndBusFade("ambience",    1.0, 1.0);
			ScriptCB_SndBusFade("voiceover",   1.0, 1.0);
			-- fade out music bus  
			ScriptCB_SndBusFade("ingame",      0.5, 0.0);
		end
		-- reset music play interval
		ScriptCB_SetShellMusicInterval(10.0)
	end,

	Input_Accept = function(this) 
 		local mixConfig = ScriptCB_GetMixConfig()
		local effects   = ScriptCB_EffectsEnabled()
    
		if(this.CurButton == "_back"  ) then
			this.bResetProfile = 1
			if (ScriptCB_GetMixConfigChanged()) then
				ifs_opt_sound_closeShellSound() 
				ifs_opt_sound_restoreShellSound(ifs_opt_contmain.movieBackground)
			end
			
			this:Input_Back()
			return
		end
		
		if(this.CurButton == "_ok" ) then -- Make PC work better - NM 8/5/04
			this.bResetProfile = nil
			this:Input_Back()
			return
		end
		
		if (this.CurButton == "reset" ) then
			ScriptCB_ResetSoundToDefault()
			
			if (ScriptCB_GetMixConfigChanged()) then
				ifs_opt_sound_closeShellSound() 
				ifs_opt_sound_restoreShellSound(ifs_opt_contmain.movieBackground)
			end
		end
		
		-- Only the PC needs to handle this input (consoles are L/R/U/D + Back) - NM 8/3/04
		if(gPlatformStr ~= "PC" ) then
			return
		end

		-- 		print("ifs_opt_sound Input_Accept. gMouseOverHorz = ",gMouseOverHorz)
		-- 		if(gMouseOverHorz) then
		-- 			print("  gMouseOverHorz.MousePercentage = ",gMouseOverHorz.MousePercentage)
		-- 		end

		if((gMouseOverHorz) and (gMouseOverHorz.MousePercentage)) then
			-- Convert mouse percentage into 0..10 scale used on this screen
			local VolMusic, VolSfx, VolVoice, MaxVol, VolMaster = ScriptCB_GetVolumes()
			local NewVal = floor(MaxVol * gMouseOverHorz.MousePercentage + 0.5)
			NewVal = max(0,NewVal)
			NewVal = min(MaxVol,NewVal)

			if(gMouseOverHorz.tag == "music") then
				VolMusic = NewVal
			elseif (gMouseOverHorz.tag == "sfx") then
				VolSfx = NewVal
			elseif (gMouseOverHorz.tag == "voice") then
				VolVoice = NewVal
			elseif (gMouseOverHorz.tag == "master") then
				VolMaster = NewVal
			end

			-- update bus gains		
			ScriptCB_SetVolumes(VolMusic, VolSfx, VolVoice, VolMaster)
			ifs_opt_sound_fnUpdateSliders(this)
			
			if (gMouseOverHorz.tag == "sfx") then
				ScriptCB_ShellPlayDelayedStream("shell_auditionSFX", 0, 0.0, "soundfx", 0)
			elseif (gMouseOverHorz.tag == "voice") then
				ScriptCB_ShellPlayDelayedStream("shell_auditionVO",  0, 0.0, "voiceover", 0)
			end

			ifs_opt_sound_fnUpdateButtons(this)
			return
		end

		ifs_opt_sound_fnUpdateSliders(this)
		
		print("opt_sound, CurButton = ",this.CurButton)
		if (this.CurButton == "output") then
			ifelm_shellscreen_fnPlaySound(this.acceptSound)
			ScriptCB_NextOutputMode()
		elseif (this.CurButton == "mixconfig") then
			ifelm_shellscreen_fnPlaySound(this.acceptSound)
			ScriptCB_NextMixConfig()
		elseif (this.CurButton == "effects") then
			ifelm_shellscreen_fnPlaySound(this.acceptSound)
			ScriptCB_ToggleEffects()
		end
		
		if (ScriptCB_GetMixConfigChanged()) then
			ifs_opt_sound_closeShellSound() 
			ifs_opt_sound_restoreShellSound(ifs_opt_contmain.movieBackground)
		end
		
		if (this.CurButton == "bassmang") then
			ifelm_shellscreen_fnPlaySound(this.acceptSound)
			if (ScriptCB_GetBassManagement()) then
				ScriptCB_SetBassManagement(nil)
			else
				ScriptCB_SetBassManagement(1)
			end
		end
		ifs_opt_sound_fnUpdateButtons(this)
	end,

	Input_Back = function(this)
		ScriptCB_PopScreen()
	end,

	Input_GeneralLeft = function(this)
		local VolMusic, VolSfx, VolVoice, MaxVol, VolMaster = ScriptCB_GetVolumes()

		if (this.CurButton == "master") then
			VolMaster = max(VolMaster - 1, 0)
			elseif(this.CurButton == "music") then
			VolMusic = max(VolMusic - 1, 0)
		elseif (this.CurButton == "sfx") then
			VolSfx = max(VolSfx - 1, 0)
		elseif (this.CurButton == "voice") then
			VolVoice = max(VolVoice - 1, 0)
		elseif (this.CurButton == "mixconfig") then
			ifelm_shellscreen_fnPlaySound(this.acceptSound)
			ScriptCB_PreviousMixConfig()
		elseif (this.CurButton == "output") then
			ifelm_shellscreen_fnPlaySound(this.acceptSound)
			ScriptCB_PreviousOutputMode()
		elseif (this.CurButton == "effects") then 
			ifelm_shellscreen_fnPlaySound(this.acceptSound)
			ScriptCB_ToggleEffects()
		end
		
		if (ScriptCB_GetMixConfigChanged()) then
			ifs_opt_sound_closeShellSound() 
			ifs_opt_sound_restoreShellSound(ifs_opt_contmain.movieBackground)
		end

		-- update bus gains		
		ScriptCB_SetVolumes(VolMusic, VolSfx, VolVoice, VolMaster)
		
		-- play audition SFX / voice
		if (this.CurButton == "sfx") then
			ScriptCB_ShellPlayDelayedStream("shell_auditionSFX", 0, 0.0, "soundfx", 0)
		elseif (this.CurButton == "voice") then
			ScriptCB_ShellPlayDelayedStream("shell_auditionVO",  0, 0.0, "voiceover", 0)
		end
		
		if (this.CurButton == "bassmang") then
			if (ScriptCB_GetBassManagement()) then
				ScriptCB_SetBassManagement(nil)
			else
				ScriptCB_SetBassManagement(1)
			end
		end
		
		ifs_opt_sound_fnUpdateButtons(this)
		ifs_opt_sound_fnUpdateSliders(this)
	end,

	Input_GeneralRight = function(this)
		local VolMusic, VolSfx, VolVoice, MaxVol, VolMaster = ScriptCB_GetVolumes()

		if (this.CurButton == "master") then
			VolMaster = min(VolMaster + 1, MaxVol)
			elseif(this.CurButton == "music") then
			VolMusic = min(VolMusic + 1, MaxVol)
		elseif (this.CurButton == "sfx") then
			VolSfx = min(VolSfx + 1, MaxVol)
		elseif (this.CurButton == "voice") then
			VolVoice = min(VolVoice + 1, MaxVol)
		elseif (this.CurButton == "output") then
			ifelm_shellscreen_fnPlaySound(this.acceptSound)
			ScriptCB_NextOutputMode()
		elseif (this.CurButton == "mixconfig") then
			ifelm_shellscreen_fnPlaySound(this.acceptSound)
			ScriptCB_NextMixConfig()
		elseif (this.CurButton == "effects") then
			ifelm_shellscreen_fnPlaySound(this.acceptSound)
			ScriptCB_ToggleEffects()
		end
		
		if (ScriptCB_GetMixConfigChanged()) then
			ifs_opt_sound_closeShellSound() 
			ifs_opt_sound_restoreShellSound(ifs_opt_contmain.movieBackground)
		end
		
		-- update bus gains     
		ScriptCB_SetVolumes(VolMusic, VolSfx, VolVoice, VolMaster)
		
		-- play audition SFX / voice
		if (this.CurButton == "sfx") then
			ScriptCB_ShellPlayDelayedStream("shell_auditionSFX", 0, 0.0, "soundfx", 0)
		elseif (this.CurButton == "voice") then
			ScriptCB_ShellPlayDelayedStream("shell_auditionVO",  0, 0.0, "voiceover", 0)
		end
		
		if (this.CurButton == "bassmang") then
			if (ScriptCB_GetBassManagement()) then
				ScriptCB_SetBassManagement(nil)
			else
				ScriptCB_SetBassManagement(1)
			end
		end

		ifs_opt_sound_fnUpdateButtons(this)
		ifs_opt_sound_fnUpdateSliders(this)
	end,

	Input_GeneralUp = function(this)
		-- If base class handled this work, then we're done
		if(gShellScreen_fnDefaultInputUp(this)) then
			return
		end

		-- if this is a slider
		if (this.CurButton) then
			if (ifs_opt_sound_fnIsASlider(this.CurButton)) then
				HSlider_fnSetAlpha(this.sliders[this.CurButton],0.4) -- dim unselected one
			end
		end
		
		-- Call default function
		gDefault_Input_GeneralUp(this)
		
		-- if this is a slider
		if (ifs_opt_sound_fnIsASlider(this.CurButton)) then
			HSlider_fnSetAlpha(this.sliders[this.CurButton],1.0) -- brite selected one
		end
		ifs_opt_sound_fnUpdateButtons(this)
	end,

	Input_GeneralDown = function(this)
		-- If base class handled this work, then we're done
		if(gShellScreen_fnDefaultInputDown(this)) then
			return
		end

		-- if this is a slider
		if (this.CurButton) then
			if (ifs_opt_sound_fnIsASlider(this.CurButton)) then
				HSlider_fnSetAlpha(this.sliders[this.CurButton],0.4) -- dim unselected one
			end
		end
		
		-- Call default function
		gDefault_Input_GeneralDown(this)
		
		-- if this is a slider
		if (ifs_opt_sound_fnIsASlider(this.CurButton)) then
			HSlider_fnSetAlpha(this.sliders[this.CurButton],1.0) -- brite selected one
		end
		ifs_opt_sound_fnUpdateButtons(this)
	end,
	
		
	Update = function(this, fDt)
 		gIFShellScreenTemplate_fnUpdate(this, fDt)  -- always call base class

		HSlider_fnSetAlpha(this.sliders.master, 0.5)
		HSlider_fnSetAlpha(this.sliders.music,0.5) -- dim unselected one
		HSlider_fnSetAlpha(this.sliders.sfx,0.5) -- dim unselected one	
		HSlider_fnSetAlpha(this.sliders.voice,0.5) -- dim unselected one		
		if(gMouseOverHorz) then
			HSlider_fnSetAlpha(gMouseOverHorz,1.0) -- brite selected one
		end
        
		if (this.CurButton ~= nil) then	    
			if (ifs_opt_sound_fnIsASlider(this.CurButton)) then
				HSlider_fnSetAlpha(this.sliders[this.CurButton],1.0) -- brite selected one
			end            
		end
		
	end
}

ifs_opt_sound_vbutton_layout = {
	yTop = 55,
	yHeight = 35,
	ySpacing = 0,
	width = 300,
	sliderheight = 24,
	font = "gamefont_medium",
	RightJustify = 1,
	buttonlist = {
		-- Title is for the left column, string the % on the right,
		-- sliders created by code later
        { tag = "master",    title = "ifs.soundopt.mastervol",        string = "" },
		{ tag = "music",     title = "ifs.soundopt.musicvol",         string = "" },
		{ tag = "sfx",       title = "ifs.soundopt.sfxvol",           string = "" },
		{ tag = "voice",     title = "ifs.soundopt.speechvol",        string = "" },
        { tag = "bassmang",  title = "ifs.soundopt.bassmanagement",   string = "" },
		{ tag = "output",    title = "ifs.soundopt.outputmode.title", string = "" },
		{ tag = "mixconfig", title = "ifs.soundopt.mixconfig.title",  string = "" },
		{ tag = "effects",   title = "ifs.soundopt.effects.title",    string = "" },
		{ tag = "reset",     title = "",							  string = "common.reset", width =400},
	},
	--nocreatebackground = 1,
	flashy = 0,
}

function ifs_opt_sound_fnBuildSliders(this,layout,w,h)
	local yTop = layout.yTop or 0
	local yHeight = layout.yHeight or 40
	local ySpacing = layout.ySpacing or 10

	local screenw
	local screenh
	screenw,screenh = ScriptCB_GetSafeScreenInfo()

	this.sliders.x = w * (0.5) + 20 -- 100

	yTop = yTop + 3 -- make text centered w/ strings

	local i
	local Count = getn(layout.buttonlist)
	for i = 1,Count do
		if (ifs_opt_sound_fnIsASlider(layout.buttonlist[i].tag)) then
			local label = layout.buttonlist[i].tag
			this.sliders[label] = NewHSlider { y = yTop, width = w, height = layout.sliderheight, thumbwidth = 10, }
			this.sliders[label].tag = label
			HSlider_fnSetAlpha(this.sliders[label],0.4) -- dim unselected one
			yTop = yTop + yHeight + ySpacing
		else
			local label  = layout.buttonlist[i].tag
			local button = this.buttons[label]
			button.label.textw  = 500 -- I really want to see this text
			button.label.halign = "Left"
			if (gPlatformStr == "PC") then
				IFObj_fnSetPos(button, (screenw * 0.53 * -1.0), button.y)
			else
				IFObj_fnSetPos(button, button.x - (screenw * 0.43), button.y)
			end
		end
	end
	
end

function ifs_opt_sound_fnBuildScreen(this)

	local w
	local h
	w,h = ScriptCB_GetSafeScreenInfo()
	
	if((gPlatformStr == "PS2") or (gPlatformStr == "XBox")) then
		ifs_opt_sound_vbutton_layout.yHeight = 50
	end

	local BarW = ifs_opt_sound_getBarSize(this)
	
	AddVerticalText(ifs_opt_sound.buttonlabels,ifs_opt_sound_vbutton_layout)
	
	local k,v
	for k,v in ifs_opt_sound.buttonlabels do
		if(type(v) == "table") then
			v.x      = -(v.textw)
			v.halign = "right"
		end
	end

	ifs_opt_sound_vbutton_layout.width = 60
	ifs_opt_sound.CurButton = AddVerticalButtons(ifs_opt_sound.buttons,ifs_opt_sound_vbutton_layout)
	
	ifs_opt_sound_fnBuildSliders(ifs_opt_sound,ifs_opt_sound_vbutton_layout,BarW,h)

	-- Fixup vertical positioning/centering
--  	for k,v in ifs_opt_sound_vbutton_layout.buttonlist do
--  		local Tag = v.tag
--  		ifs_opt_sound.buttonlabels[Tag].valign = "vcenter"
--  		ifs_opt_sound.buttons[Tag].label.valign = "vcenter"
--  		ifs_opt_sound.buttonlabels[Tag].texth = ifs_opt_sound_vbutton_layout.yHeight
--  		ifs_opt_sound.buttons[Tag].label.texth = ifs_opt_sound_vbutton_layout.yHeight
--  	end

	if (gPlatformStr == "PC") then
	    this.logoInfos["envmorphing"] = NewIFText { y = 0,  font = "gamefont_small", textw = 300, texth = 50, halign = "left", valign = "vcenter", string = "ifs.soundopt.eax.envmorphing" }
	    this.logoInfos["occulsion"]   = NewIFText { y = 30, font = "gamefont_small", textw = 300, texth = 50, halign = "left", valign = "vcenter", string = "ifs.soundopt.eax.occlusion" }
	    this.logoInfos["reverb"]      = NewIFText { y = 60, font = "gamefont_small", textw = 300, texth = 50, halign = "left", valign = "vcenter", string = "ifs.soundopt.eax.reverb" }
        this.logoInfos["envpanning"]  = NewIFText { y = 90, font = "gamefont_small", textw = 300, texth = 50, halign = "left", valign = "vcenter", string = "ifs.soundopt.eax.envpanning" }
	end
	
	this.Background = NewIFImage 
	{
 			ZPos = 254, 
 			x = w/2,  --centered on the x
 			y = h/2, -- inertUVs = 1,
 			alpha = 10,
 			localpos_l = -w/1.5, localpos_t = -h/1.5,
 			localpos_r = w/1.5, localpos_b =  h/1.5,
			texture = "opaque_black",
			ColorR = 20, ColorG = 20, ColorB = 150, -- blue
 	}
 	
	local BackButtonW = 130 -- made 130 to fix 6198 on PC - NM 8/18/04
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
			tag = "_ok",
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
			tag = "_back",
			nocreatebackground=1,			
		}, -- end of btn
	}
	RoundIFButtonLabel_fnSetString(this.cancelbutton.btn,"common.cancel")
end

ifs_opt_sound_fnBuildScreen(ifs_opt_sound)
ifs_opt_sound_fnBuildSliders = nil -- dump out of memory when done.
ifs_opt_sound_fnBuildScreen = nil
ifs_opt_sound_vbutton_layout = nil

AddIFScreen(ifs_opt_sound,"ifs_opt_sound")