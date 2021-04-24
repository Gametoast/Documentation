
xlvoicemail_vbutton_layout = {
--	yTop = 10,
	ySpacing = 5,
	width = 300,
	font = "gamefont_medium",
	buttonlist = {
		{ tag = "play", string = "ifs.xvoicemail.play" },
		{ tag = "stop", string = "ifs.xvoicemail.stop" },
		{ tag = "feedback", string = "ifs.xfriendslist.feedback" },
		{ tag = "delete", string = "ifs.Profile.delete" },
		{ tag = "block", string = "ifs.xvoicemail.block" },
--		{ tag = "record", string = "ifs.xvoicemail.record" },
	},
	title = "ifs.xvoicemail.title",
}

-- Callbacks from the "never accept friends requests" popup. If
-- bResult is true, user selected 'yes'
function ifs_mpxl_voicemail_fnAskedBlock(bResult)
	local this = ifs_mpxl_voicemail

	-- Always turn screen back on
	local fAnimTime = 0.2
	AnimationMgr_AddAnimation(this.buttons,
														{ fTotalTime = fAnimTime, fStartAlpha = 0, fEndAlpha = 1,})

	if(bResult) then
		ScriptCB_XL_DeleteVoicemail(1, xlfriends_listbox_layout.SelectedIdx) -- 1 == permanently
		ScriptCB_PopScreen()
	end
end

ifs_mpxl_voicemail = NewIFShellScreen {
	nologo = 1,
	bg_texture = "iface_bgmeta_space",
	movieIntro      = nil, -- played before the screen is displayed
	movieBackground = nil, -- played while the screen is displayed

	buttons = NewIFContainer {
		ScreenRelativeX = 0.5, -- center
		ScreenRelativeY = 0.5, -- top
	},

	Enter = function(this, bFwd)
		-- Always call base class
		gIFShellScreenTemplate_fnEnter(this, bFwd)

		-- Added chunk for error handling...
		if(not bFwd) then
			local ErrorLevel,ErrorMessage = ScriptCB_GetError()
			if(ErrorLevel >= 6) then -- session or login error, must keep going further
				ScriptCB_PopScreen()
			end
		end

		if(bFwd) then
			ScriptCB_XL_EnableVoicemail(1)
		end

	end,

	Exit = function(this, bFwd)
		if(not bFwd) then
			ScriptCB_XL_EnableVoicemail(nil)
		end
	end,

	Update = function(this, fDt)
		-- Call default base class's update function (make button bounce)
		gIFShellScreenTemplate_fnUpdate(this,fDt)

		ScriptCB_XL_UpdateVoicemail()
	end,


	Input_Accept = function(this)
		if(this.CurButton == "record") then
			ifelm_shellscreen_fnPlaySound(this.acceptSound)
			ScriptCB_XL_RecordVoicemail()
		elseif (this.CurButton == "play") then
			ifelm_shellscreen_fnPlaySound(this.acceptSound)
			ScriptCB_XL_PlayVoicemail()
		elseif (this.CurButton == "stop") then
			ifelm_shellscreen_fnPlaySound(this.acceptSound)
			ScriptCB_XL_StopVoicemail()
		elseif (this.CurButton == "feedback") then
			ifelm_shellscreen_fnPlaySound(this.acceptSound)
			ifs_mpxl_feedback.bVoicemailOnly = 1
			ifs_movietrans_PushScreen(ifs_mpxl_feedback)
		elseif (this.CurButton == "delete") then
			ifelm_shellscreen_fnPlaySound(this.acceptSound)
			ScriptCB_XL_DeleteVoicemail(nil, xlfriends_listbox_layout.SelectedIdx) -- nil == just this one, not permanent
			ScriptCB_PopScreen()
		elseif (this.CurButton == "block") then
			ifelm_shellscreen_fnPlaySound(this.acceptSound)
			Popup_YesNo_Large.CurButton = "no" -- default
			IFText_fnSetString(Popup_YesNo_Large.title,"ifs.xvoicemail.block_prompt")
			Popup_YesNo_Large.fnDone = ifs_mpxl_voicemail_fnAskedBlock
			Popup_YesNo_Large:fnActivate(1)
			local fAnimTime = 0.2
			AnimationMgr_AddAnimation(this.buttons,
																{ fTotalTime = fAnimTime, fStartAlpha = 1, fEndAlpha = 0,})
		end
	end,

	-- No L/R functionality possible on this screen (gotta have stubs
	-- here, or the base class will override)
	Input_GeneralLeft = function(this)
	end,
	Input_GeneralRight = function(this)
	end,

	Update = function(this, fDt)
		-- Call default base class's update function (make button bounce)
		gIFShellScreenTemplate_fnUpdate(this,fDt)
	end,
}


-- Do programatic work to set up this screen
function ifs_mpxl_voicemail_fnBuildScreen(this)
	local w,h = ScriptCB_GetSafeScreenInfo() -- of the usable screen

	this.CurButton = AddVerticalButtons(this.buttons,xlvoicemail_vbutton_layout)
end

ifs_mpxl_voicemail_fnBuildScreen(ifs_mpxl_voicemail)
ifs_mpxl_voicemail_fnBuildScreen = nil

AddIFScreen(ifs_mpxl_voicemail,"ifs_mpxl_voicemail")
