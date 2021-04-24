-- Functions for the Gamespy login screen

-- This is so fundamentally different from the XLive flow that the two
-- are split off.

ifs_mpgs_login_vbutton_layout = {
	yHeight = 35,
	ySpacing  = 0,
	width = 350,
	font = "gamefont_medium",
	LeftJustify = 1,
	buttonlist = {
		-- Title is for the left column, string the value on the right,
		-- which is filled in via code later
		{ tag = "nick",  title = "ifs.gsprofile.nick",     string = "",},
		{ tag = "email", title = "ifs.gsprofile.email",    string = "" },
		{ tag = "pass",  title = "ifs.gsprofile.password", string = "" },
		{ tag = "save",  title = "ifs.gsprofile.saveinprofile", string = "" , yAdd = 10,},
		{ tag = "login", title = "", string = "ifs.gsprofile.login" },
		{ tag = "create", title = "", string = "ifs.gsprofile.create" },
		{ tag = "nologin", title = "", string = "ifs.gsprofile.nologin"},
	},
	nocreatebackground = 1,
	noflashycenter=1,
}

-- Returns 1 if the specifed string starts with valid chars, nil if
-- not.
function ifs_mpgs_login_fnCheckString(Str)
	local FirstChar = strsub(Str,1,1)
	if((FirstChar == "@") or (FirstChar == "+") or (FirstChar == ":") or (FirstChar == "#")) then
		return nil
	end

	return 1
end

-- Callbacks from the busy popup

-- Returns -1, 0, or 1, depending on error, busy, or success
function ifs_mpgs_login_fnCheckDone()
--	local this = ifs_mpgs_login
	return ScriptCB_IsLoginDone()
end

function ifs_mpgs_login_fnOnSuccess()
	local this = ifs_mpgs_login
--	print("Closing busy popup due to success")
	Popup_Busy:fnActivate(nil)
	-- Fixme! Go to XLive choice instead
	ifs_movietrans_PushScreen(ifs_mp_main)
end

function ifs_mpgs_fnPostPassMismatch()
	local this = ifs_mpgs_login
	ifs_mpgs_login_fnSetPieceVis(this, nil, 1, nil) -- fade to listbox/buttons
end

function ifs_mpgs_login_fnOnFail()
	local this = ifs_mpgs_login
--	print("Closing busy popup due to fail")
	Popup_Busy:fnActivate(nil)
--	print("Error in logging on!\n")
	ifs_mpgs_login_fnSetPieceVis(this, nil, 1, nil) -- fade to listbox/buttons
-- 	local ErrorLevel,ErrorMessage = ScriptCB_QueryNetError("login")
-- 	ScriptCB_OpenErrorBox(ErrorLevel,ErrorMessage)
end

-- User hit cancel. Do what they want.
function ifs_mpgs_login_fnOnCancel()
	local this = ifs_mpgs_login

	ifelm_shellscreen_fnPlaySound(this.cancelSound)
	-- Stop logging in.
	ScriptCB_CancelLogin()

	-- Get rid of popup, turn this screen back on
--	print("Closing busy popup due to cancel")
	Popup_Busy:fnActivate(nil)
	ifs_mpgs_login_fnSetPieceVis(this, nil, 1, nil) -- fade to listbox/buttons
end

-- Callbacks from the "Create an account?" popup. If bResult is true,
-- they selected 'yes'
function ifs_mpgs_fnAskedCreateDone(bResult)
	local this = ifs_mpgs_login
	if(not bResult) then
		ScriptCB_SetIFScreen("ifs_mp_main")
	else
		ifs_mpgs_login_fnSetPieceVis(this,nil,1,nil) -- fade in info
	end
end

-- Callbacks from the "This will send sensitive info?" popup. If
-- bResult is true, they selected 'yes'
function ifs_mpgs_fnSensitiveInfoDone(bResult)
	local this = ifs_mpgs_login
	ifs_mpgs_login_fnSetPieceVis(this,nil,1,nil) -- fade in info

	if(bResult) then
		if(ScriptCB_IsCurProfileDirty()) then
			--					print("Fading out to save...")
			ifs_mpgs_login_fnSetPieceVis(this, nil, nil, nil) -- fade out all\
			--Popup_LoadSave:fnActivate(1)
			--ScriptCB_StartSaveProfile()
			ifs_mpgs_login_StartSaveProfile()
		else
			ifs_mpgs_login_fnStartLogin(this,this.CurButton == "create")
		end
	end
end

function ifs_mpgs_login_fnPostKeyboard(this)
	-- Push strings thru to game
	ScriptCB_SetGSProfileInfo(this.NickStr,this.EmailStr,this.PasswordStr,this.iSaveType)
	ScriptCB_PopScreen() -- back to this screen, ifs_mpgs_login
end

-- Callback function when the virtual keyboard is done
function ifs_mpgs_login_fnKeyboardDone_Nick()
	local this = ifs_mpgs_login
	this.NickStr = ScriptCB_ununicode(ifs_vkeyboard.CurString)
	ifs_mpgs_login_fnPostKeyboard(this)
end

function ifs_mpgs_login_fnEmailIsAcceptable()
	local this = ifs_mpgs_login
	this.EmailStr = ScriptCB_ununicode(ifs_vkeyboard.CurString)

	-- Check if this is a valid email address.
	local bValidEmail = nil
	local iAtSign = strfind(this.EmailStr,"@",1,1)
	if(iAtSign) then
		local iDot = strfind(this.EmailStr,".",iAtSign+1,1)
		if(iDot) then
			bValidEmail = (strlen(this.EmailStr) - iDot) > 1
		end
	end

	if(not bValidEmail) then
		this.EmailStr = ""
	end

	return bValidEmail,"ifs.gsprofile.bademail"
end


-- Callback function when the virtual keyboard is done
function ifs_mpgs_login_fnKeyboardDone_Email()
	local this = ifs_mpgs_login

	this.EmailStr = ScriptCB_ununicode(ifs_vkeyboard.CurString)

	if(not gFinalBuild) then
		local iAtSign = strfind(this.EmailStr,"@",1,1)
		if(not iAtSign) then
			this.EmailStr = this.EmailStr .. "@pandemicstudios.com"
		end
	end

	-- Check if this is a valid email address.
	local bValidEmail = nil
	local iAtSign = strfind(this.EmailStr,"@",1,1)
	if(iAtSign) then
		local iDot = strfind(this.EmailStr,".",iAtSign+1,1)
		if(iDot) then
			bValidEmail = (strlen(this.EmailStr) - iDot) > 1
		end
	end

--	print("bValidEmail =", bValidEmail)
	if(bValidEmail) then
		ifs_mpgs_login_fnPostKeyboard(this)
	else
	end
end

-- Callback function when the virtual keyboard is done
function ifs_mpgs_login_fnKeyboardDone_Pass()
	local this = ifs_mpgs_login
	this.PasswordStr = ScriptCB_ununicode(ifs_vkeyboard.CurString)
	vkeyboard_specs.bPasswordMode = nil
	ifs_mpgs_login_fnPostKeyboard(this)
end

-- Helper function, sets all the button text to what the current values
-- say they should be.
function ifs_mpgs_fnUpdateButtonText(this)
--	this.NickStr,this.EmailStr,this.PasswordStr
	
	IFText_fnSetFont(this.buttons.nick.label,this.UseFont)
	if(strlen(this.NickStr) < 1) then
		RoundIFButtonLabel_fnSetString(this.buttons.nick,"ifs.gsprofile.notspecified")
	else
		if(strlen(this.NickStr) > 15) then
			IFText_fnSetFont(this.buttons.nick.label,this.UseFont)
		end
		RoundIFButtonLabel_fnSetString(this.buttons.nick,this.NickStr)
	end

	IFText_fnSetFont(this.buttons.email.label,this.UseFont)
	if(strlen(this.EmailStr) < 1) then
		RoundIFButtonLabel_fnSetString(this.buttons.email,"ifs.gsprofile.notspecified")
	else
		if(strlen(this.EmailStr) > 15) then
			IFText_fnSetFont(this.buttons.email.label,"gamefont_tiny")
		end
		RoundIFButtonLabel_fnSetString(this.buttons.email,this.EmailStr)
	end

	if(strlen(this.PasswordStr) < 1) then
		RoundIFButtonLabel_fnSetString(this.buttons.pass,"ifs.gsprofile.notspecified")
	else
		local ShowStr = strrep("*", strlen(this.PasswordStr))	
		RoundIFButtonLabel_fnSetString(this.buttons.pass,ShowStr)
	end

	if(this.iSaveType == 0) then
		RoundIFButtonLabel_fnSetString(this.buttons.save,"ifs.gsprofile.none")
	elseif (this.iSaveType == 1) then
		RoundIFButtonLabel_fnSetString(this.buttons.save,"ifs.gsprofile.nopassword")
	else
		RoundIFButtonLabel_fnSetString(this.buttons.save,"ifs.gsprofile.all")
	end

end


function ifs_mpgs_login_fnStartLogin(this, bCreateMode)

--	print("Starting login...")

	ifelm_shellscreen_fnPlaySound(this.acceptSound)
	ScriptCB_StartLogin(this.NickStr,this.EmailStr,this.PasswordStr,bCreateMode)
	this.bStartedLogin = 1
	
	ifs_mpgs_login_fnSetPieceVis(this, nil, nil, nil) -- fade to blank for busy popup
	
	Popup_Busy.fnCheckDone = ifs_mpgs_login_fnCheckDone
	Popup_Busy.fnOnSuccess =  ifs_mpgs_login_fnOnSuccess
	Popup_Busy.fnOnFail =  ifs_mpgs_login_fnOnFail
	Popup_Busy.fnOnCancel =  ifs_mpgs_login_fnOnCancel
	Popup_Busy.bNoCancel = nil -- allow cancel button
	Popup_Busy.fTimeout = 30 -- seconds
	if(bCreateMode) then
		IFText_fnSetString(Popup_Busy.title,"common.mp.creating_gsid")
	else
		IFText_fnSetString(Popup_Busy.title,"common.mp.loggingin_gsid")
	end
--	print("Busy popup should be up!")
	Popup_Busy:fnActivate(1)
end

-- Callback (from C++) -- saving is done. Do something.
--function ifs_mpgs_login_fnSaveProfileDone(this)
--	print("Save profile is done...")
--	Popup_LoadSave:fnActivate(nil)

--	ifs_mpgs_login_fnSetPieceVis(this, nil, 1, nil) -- fade to listbox/buttons
--	ifs_mpgs_login_fnStartLogin(this)
--end

function ifs_mpgs_login_fnMustSpecifyOk()
	local this = ifs_mpgs_login
	ifs_mpgs_login_fnSetPieceVis(this, nil, 1, nil) -- fade in all
end

-- Helper function: turns pieces on/off as requested
function ifs_mpgs_login_fnSetPieceVis(this,bImmediate,bShowEntries)

--	print("mpgs login_fnSetPieceVis(..",bImmediate,bShowEntries)

	if(bImmediate) then
		IFObj_fnSetVis(this.buttonlabels,bShowEntries)
		IFObj_fnSetVis(this.buttons,bShowEntries)


		IFObj_fnSetAlpha(this.buttonlabels,1)
		IFObj_fnSetAlpha(this.buttons,1)
		if(this.Helptext_Accept) then
			IFObj_fnSetVis(this.Helptext_Accept,bShowEntries)
			IFObj_fnSetAlpha(this.Helptext_Accept,1)
		end
	else
		-- Not immediate. Do some fancy fades, if necessary
		local fAnimTime = 0.2
		local A1,A2 = 0,1

		if(this.bShowEntries ~= bShowEntries) then
			-- Gotta update listbox

			if(bShowEntries) then
--				ifs_mpgs_login_fnRepaintListbox(this)
			else
				A1,A2 = 1,0
			end

			AnimationMgr_AddAnimation(this.buttonlabels,
																{ fTotalTime = fAnimTime, fStartAlpha = A1, fEndAlpha = A2,})
			AnimationMgr_AddAnimation(this.buttons,
																{ fTotalTime = fAnimTime, fStartAlpha = A1, fEndAlpha = A2,})

			IFObj_fnSetVis(this.buttonlabels,1)
			IFObj_fnSetVis(this.buttons,1)
			if(this.Helptext_Accept) then
				AnimationMgr_AddAnimation(this.Helptext_Accept,
																	{ fTotalTime = fAnimTime, fStartAlpha = A1, fEndAlpha = A2,})
				IFObj_fnSetVis(this.Helptext_Accept,1)
			end
		end

	end

	-- Store latest state
	this.bShowEntries = bShowEntries
end


----------------------------------------------------------------------------------------
-- save the profile in slot 1
----------------------------------------------------------------------------------------

function ifs_mpgs_login_StartSaveProfile()
--	print("ifs_mpgs_login_StartSaveProfile")
	
	ifs_saveop.doOp = "SaveProfile"
	ifs_saveop.OnSuccess = ifs_mpgs_login_SaveProfileSuccess
	ifs_saveop.OnCancel = ifs_mpgs_login_SaveProfileCancel
	ifs_saveop.saveName = ScriptCB_GetCurrentProfileName()
	ifs_saveop.saveProfileNum = 1
	ifs_movietrans_PushScreen(ifs_saveop)
end

function ifs_mpgs_login_SaveProfileSuccess()
--	print("ifs_mpgs_login_SaveProfileSuccess")
	local this = ifs_mpgs_login
	this.bReturningFromSave = 1
	ScriptCB_PopScreen()
end

function ifs_mpgs_login_SaveProfileCancel()
--	print("ifs_mpgs_login_SaveProfileCancel")
	local this = ifs_mpgs_login
	this.bReturningFromSave = 1
	ScriptCB_PopScreen()
end

----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------



ifs_mpgs_login = NewIFShellScreen {

--  	title = NewIFText {
--  		string = "ifs.pickacct.account",
--  		font = "gamefont_large",
--  		textw = 460,
--  		y = 30,
--  		ScreenRelativeX = 0.5, -- center
--  		ScreenRelativeY = 0, -- top
-- 	},

	movieIntro      = nil,
	movieBackground = nil,

	Gamespy_Icon = NewIFImage {
		ScreenRelativeX = 1.0, -- right
		ScreenRelativeY = 0.0, -- top
		texture = "gamespy_logo_256x64",
		localpos_l = -256,
		localpos_t = 0,
		localpos_r = 0,
		localpos_b = 64,
	},

	Helptext_Gamespy = NewIFText {
		ScreenRelativeX = 0.5, -- center
		ScreenRelativeY = 1.0, -- bottom
		y = -95, -- just above bottom of screen
		font = "gamefont_small",
		textw = 460,
		texth = 75,
		valign = "vcenter",
		string = "ifs.gsprofile.howtomanage",
		nocreatebackground = 1,
	},

	-- Note: this ScreenRelativeX is used to determine the size of
	-- the sliders
	buttonlabels = NewIFContainer {
		ScreenRelativeX = 0.25, -- right-justified to this
		ScreenRelativeY = 0.5,
	},

	buttons = NewIFContainer {
		ScreenRelativeX = 0.28, -- text left-justified within this
		ScreenRelativeY = 0.5,
	},

	bStartedList = nil,
	
	Enter = function(this, bFwd)
		gIFShellScreenTemplate_fnEnter(this, bFwd) -- Call base class
		
		-- Added chunk for error handling...
		if(not bFwd) then
			local ErrorLevel,ErrorMessage = ScriptCB_GetError()
			if(ErrorLevel >= 7) then -- session or login error, must keep going further
				ScriptCB_CancelLogin()
				ScriptCB_ClearError()
			end
		end

		ifs_mpgs_login_fnSetPieceVis(this,1,1) -- force on by default

		-- returning from a profile save? (also returning from a cancel save)
		if(this.bReturningFromSave) then
--			print("ifs_mpgs_login.Enter bReturningFromSave")
			this.bReturningFromSave = nil
			--start the login process
			ifs_mpgs_login_fnSetPieceVis(this, nil, nil, nil) -- fade out all
			ifs_mpgs_login_fnStartLogin(this,this.CurButton == "create")
			return
		end		

		if(bFwd) then
			this.NickStr,this.EmailStr,this.PasswordStr,this.iSaveType = ScriptCB_GetGSProfileInfo()
			if(ScriptCB_InNetGame()) then
				ifs_movietrans_PushScreen(ifs_mp_main)
			else
				if(strlen(this.NickStr) < 1) then

					-- Default nickname: what they punched in at the login screen.
					this.NickStr = ScriptCB_ununicode(ScriptCB_GetCurrentProfileName())

					Popup_YesNo_Large.CurButton = "yes" -- default
					Popup_YesNo_Large.fnDone = ifs_mpgs_fnAskedCreateDone
					IFText_fnSetString(Popup_YesNo_Large.title,"ifs.gsprofile.askcreate")
					Popup_YesNo_Large:fnActivate(1)
					ifs_mpgs_login_fnSetPieceVis(this,1,nil,nil) -- force off by default
				else
					if(strlen(this.EmailStr) > 6) then
						SetCurButton("login")
					else
						SetCurButton("nologin")
					end
				end
			end
		end

		ifs_mpgs_fnUpdateButtonText(this)
	end,

 	Exit = function(this, bFwd)
 		if(bFwd) then 			-- Going to a subscreen

		else
			-- Backing out to parent screen. Shutdown XLive stuff
			if(this.bStartedLogin) then
				ScriptCB_CancelLogin()
				this.bStartedLogin = nil
			end
			-- Always reset NetLoginName to what was in profile, as we might
			-- have changed it to the selected user's gamertag as part of a
			-- login
			--local Selection = ifs_login_listbox_contents[ifs_login_listbox_layout.SelectedIdx]
			--ScriptCB_SetNetLoginName(Selection.showstr)
			ScriptCB_SetNetLoginName(ScriptCB_GetCurrentProfileName())
		end
	end,

	-- Not possible on this screen
	Input_GeneralLeft = function(this)
  end,
	Input_GeneralRight = function(this)
  end,

	Input_Accept = function(this)
		-- If base class handled this work, then we're done
		if(gShellScreen_fnDefaultInputAccept(this)) then
			return
		end

		if(this.CurButton == "nick") then
			ifelm_shellscreen_fnPlaySound(this.acceptSound)
			ifs_vkeyboard.CurString = ScriptCB_tounicode(this.NickStr)
			IFText_fnSetString(ifs_vkeyboard.title,"ifs.vkeyboard.title_nick")
			ifs_movietrans_PushScreen(ifs_vkeyboard)
			vkeyboard_specs.MaxLen = 20
			vkeyboard_specs.MaxWidth = 450
			vkeyboard_specs.bGamespyMode = 1
			ifs_vkeyboard.bCursorOnLetters = 1 -- start cursor in top-left
			vkeyboard_specs.fnDone = ifs_mpgs_login_fnKeyboardDone_Nick
			vkeyboard_specs.fnIsOk = ifs_login_fnIsAcceptable
		elseif (this.CurButton == "email") then
			ifelm_shellscreen_fnPlaySound(this.acceptSound)
			vkeyboard_specs.MaxLen = 50
			vkeyboard_specs.MaxWidth = 650
			vkeyboard_specs.bGamespyMode = 1
			ifs_vkeyboard.bCursorOnLetters = 1 -- start cursor in top-left
			ifs_vkeyboard.CurString = ScriptCB_tounicode(this.EmailStr)
			IFText_fnSetString(ifs_vkeyboard.title,"ifs.vkeyboard.title_email")
			ifs_movietrans_PushScreen(ifs_vkeyboard)
			vkeyboard_specs.fnDone = ifs_mpgs_login_fnKeyboardDone_Email
			vkeyboard_specs.fnIsOk = ifs_mpgs_login_fnEmailIsAcceptable
		elseif (this.CurButton == "pass") then
			ifelm_shellscreen_fnPlaySound(this.acceptSound)
			ifs_vkeyboard.CurString = ScriptCB_tounicode(this.PasswordStr)
			vkeyboard_specs.MaxLen = 30
			vkeyboard_specs.MaxWidth = 450
			vkeyboard_specs.bGamespyMode = 1
			vkeyboard_specs.bPasswordMode = 1
			ifs_vkeyboard.bCursorOnLetters = 1 -- start cursor in top-left
			IFText_fnSetString(ifs_vkeyboard.title,"ifs.vkeyboard.title_password")
			ifs_movietrans_PushScreen(ifs_vkeyboard)
			vkeyboard_specs.fnDone = ifs_mpgs_login_fnKeyboardDone_Pass
			vkeyboard_specs.fnIsOk = ifs_login_fnIsAcceptable
		elseif (this.CurButton == "save") then
			ifelm_shellscreen_fnPlaySound(this.acceptSound)
			this.iSaveType = this.iSaveType + 1
			if(this.iSaveType > 2) then
				this.iSaveType = 0
			end

			ScriptCB_SetGSProfileInfo(this.NickStr,this.EmailStr,this.PasswordStr,this.iSaveType)
			ifs_mpgs_fnUpdateButtonText(this)

		elseif ((this.CurButton == "login") or (this.CurButton == "create")) then
			ifelm_shellscreen_fnPlaySound(this.acceptSound)

			if((strlen(this.NickStr) < 1) or (strlen(this.EmailStr) < 1) or (strlen(this.PasswordStr) < 1)) then

				ifs_mpgs_login_fnSetPieceVis(this,nil,nil) -- fade out entries
				Popup_Ok.fnDone = ifs_mpgs_login_fnMustSpecifyOk
				IFText_fnSetString(Popup_Ok.title,"ifs.gsprofile.mustspecify")
				Popup_Ok:fnActivate(1)
			elseif ((not ifs_mpgs_login_fnCheckString(this.NickStr)) or 
							(not ifs_mpgs_login_fnCheckString(this.EmailStr)) or 
								(not ifs_mpgs_login_fnCheckString(this.PasswordStr)) ) then
				ifs_mpgs_login_fnSetPieceVis(this,nil,nil) -- fade out entries
				Popup_Ok.fnDone = ifs_mpgs_login_fnMustSpecifyOk
				IFText_fnSetString(Popup_Ok.title,"ifs.gsprofile.badchars")
				Popup_Ok:fnActivate(1)
			else
				-- Fix for 7323 - prompt that this'll send sensitive info
				Popup_YesNo_Large.CurButton = "no" -- default
				Popup_YesNo_Large.fnDone = ifs_mpgs_fnSensitiveInfoDone
				IFText_fnSetString(Popup_YesNo_Large.title,"ifs.gsprofile.warn_data")
				Popup_YesNo_Large:fnActivate(1)
				ifs_mpgs_login_fnSetPieceVis(this,1,nil,nil) -- force off by default
			end -- valid profile

		elseif (this.CurButton == "nologin") then
			ifelm_shellscreen_fnPlaySound(this.acceptSound)
			ifs_movietrans_PushScreen(ifs_mp_main)
		end

	end,

	Input_Back = function(this)
		if(this.bPasswordState) then
			this.bPasswordState = nil
			this.CurPassword = ""
			ifs_mpgs_login_fnSetPieceVis(this, nil, 1, nil) -- fade to listbox/buttons
		else
			ScriptCB_PopScreen() -- default action
		end
	end,

	-- Override default handler.
 	fnPostError = function(this,bUserHitYes,ErrorLevel,ErrorMessage)
-- 		print("MPGS Login fnPostError(..,",bUserHitYes,ErrorLevel)
		if(this.bStartedLogin) then
			ScriptCB_CancelLogin()
			ScriptCB_ClearError()
			this.bStartedLogin = nil
			ifs_mpgs_login_fnSetPieceVis(this,nil,1,nil) -- fade in info
			Popup_Busy:fnActivate(nil) -- in case it was up
		end

		if(ErrorLevel >= 8) then -- cable errors
			ScriptCB_PopScreen()
		end
 	end,

	fnSaveProfileDone = ifs_mpgs_login_fnSaveProfileDone,
}

function ifs_mpgs_login_fnBuildScreen(this)
	local ScreenW,ScreenH = ScriptCB_GetSafeScreenInfo() -- of the usable screen

	local bNeedToShrink = (ScriptCB_GetLanguage() ~= "english")
	if(bNeedToShrink) then
		this.UseFont = "gamefont_tiny"
		this.Helptext_Gamespy.font = "gamefont_tiny"
		this.buttonlabels.ScreenRelativeX = 0.3
		this.buttons.ScreenRelativeX = 0.33
	else
		this.UseFont = "gamefont_medium"
	end

	ifs_mpgs_login_vbutton_layout.width = ScreenW * (1.0 - this.buttons.ScreenRelativeX)

	AddVerticalText(this.buttonlabels,ifs_mpgs_login_vbutton_layout)
	this.CurButton = AddVerticalButtons(this.buttons,ifs_mpgs_login_vbutton_layout)

	local LabelWidth = ScreenW * (this.buttonlabels.ScreenRelativeX)

	local k,v
	for k,v in ifs_mpgs_login_vbutton_layout.buttonlist do
		local Tag = v.tag

		this.buttonlabels[Tag].textw = LabelWidth
		this.buttonlabels[Tag].x = -LabelWidth
		this.buttonlabels[Tag].halign = "right"
		this.buttonlabels[Tag].texth = this.buttonlabels[Tag].texth + 10
		this.buttonlabels[Tag].y = this.buttonlabels[Tag].y - 5 -- account for +10 one line up

		this.buttons[Tag].label.texth = this.buttons[Tag].label.texth + 10
		this.buttons[Tag].y = this.buttons[Tag].y - 5

		if(bNeedToShrink) then
			this.buttonlabels[Tag].font = "gamefont_tiny"
			this.buttons[Tag].label.font = "gamefont_tiny"
		end
	end

end

ifs_mpgs_login_fnBuildScreen(ifs_mpgs_login)
ifs_mpgs_login_fnBuildScreen = nil

AddIFScreen(ifs_mpgs_login,"ifs_mpgs_login")
