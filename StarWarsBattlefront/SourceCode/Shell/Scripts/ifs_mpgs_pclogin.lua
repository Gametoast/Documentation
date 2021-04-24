-- Functions for the Gamespy login screen

-- This is so fundamentally different from the XLive flow that the two
-- are split off.

ifs_mpgs_login_vbutton_layout = {
	yHeight = 40,
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
		{ tag = "prompt",  title = "ifs.gsprofile.autologin", string = "" , yAdd = 10,},
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

-- Returns 1 if the specifed string starts with valid chars, nil if
-- not.
function ifs_mpgs_login_fnCheckString2(Str)
	-- Make sure all chars are gamespy-legal
	if(ScriptCB_IsLegalGamespyString) then
		return ScriptCB_IsLegalGamespyString(Str)
	end

	-- fallback
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
	this.iPromptType = 0 -- back to prompt mode
	ifs_mpgs_login_fnSetPieceVis(this, nil, 1, nil) -- fade to listbox/buttons

	ScriptCB_SetGSProfileInfo(this.NickStr,this.EmailStr,this.PasswordStr,this.iSaveType,this.iPromptType)
	ifs_mpgs_fnUpdateButtonText(this)
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
	ScriptCB_SetGSProfileInfo(this.NickStr,this.EmailStr,this.PasswordStr,this.iSaveType, this.iPromptType)
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
	
	IFEditbox_fnSetString(this.nickedit, this.NickStr)

	if(strlen(this.EmailStr) >= 40) then 
		IFEditbox_fnSetScale(this.emailedit,0.75,1)
	else
		IFEditbox_fnSetScale(this.emailedit,1,1)
	end
	IFEditbox_fnSetString(this.emailedit, this.EmailStr)
	IFEditbox_fnSetString(this.passedit, this.PasswordStr)


-- 	IFText_fnSetFont(this.buttons.nick.label,this.UseFont)
-- 	if(strlen(this.NickStr) < 1) then
-- 		RoundIFButtonLabel_fnSetString(this.buttons.nick,"ifs.gsprofile.notspecified")
-- 	else
-- 		if(strlen(this.NickStr) > 15) then
-- 			IFText_fnSetFont(this.buttons.nick.label,this.UseFont)
-- 		end
-- 		RoundIFButtonLabel_fnSetString(this.buttons.nick,this.NickStr)
-- 	end

-- 	IFText_fnSetFont(this.buttons.email.label,this.UseFont)
-- 	if(strlen(this.EmailStr) < 1) then
-- 		RoundIFButtonLabel_fnSetString(this.buttons.email,"ifs.gsprofile.notspecified")
-- 	else
-- 		if(strlen(this.EmailStr) > 15) then
-- 			IFText_fnSetFont(this.buttons.email.label,"gamefont_tiny")
-- 		end
-- 		RoundIFButtonLabel_fnSetString(this.buttons.email,this.EmailStr)
-- 	end

-- 	if(strlen(this.PasswordStr) < 1) then
-- 		RoundIFButtonLabel_fnSetString(this.buttons.pass,"ifs.gsprofile.notspecified")
-- 	else
-- 		local ShowStr = strrep("*", strlen(this.PasswordStr))	
-- 		RoundIFButtonLabel_fnSetString(this.buttons.pass,ShowStr)
-- 	end

 	if(this.iSaveType == 0) then
 		RoundIFButtonLabel_fnSetString(this.buttons.save,"ifs.gsprofile.none")
 	elseif (this.iSaveType == 1) then
 		RoundIFButtonLabel_fnSetString(this.buttons.save,"ifs.gsprofile.nopassword")
 	else
 		RoundIFButtonLabel_fnSetString(this.buttons.save,"ifs.gsprofile.all")
 	end

 	if(this.iPromptType == 0) then
 		RoundIFButtonLabel_fnSetString(this.buttons.prompt,"ifs.gsprofile.prompt")
 	elseif (this.iPromptType == 1) then
 		RoundIFButtonLabel_fnSetString(this.buttons.prompt,"common.always")
 	else
 		RoundIFButtonLabel_fnSetString(this.buttons.prompt,"common.never")
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
		IFObj_fnSetVis(this.nickedit,bShowEntries)
		IFObj_fnSetVis(this.emailedit,bShowEntries)
		IFObj_fnSetVis(this.passedit,bShowEntries)

		IFObj_fnSetAlpha(this.buttonlabels,1)
		IFObj_fnSetAlpha(this.buttons,1)
		IFObj_fnSetAlpha(this.nickedit,1)
		IFObj_fnSetAlpha(this.emailedit,1)
		IFObj_fnSetAlpha(this.passedit,1)
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
			AnimationMgr_AddAnimation(this.nickedit,
																{ fTotalTime = fAnimTime, fStartAlpha = A1, fEndAlpha = A2,})
			AnimationMgr_AddAnimation(this.emailedit,
																{ fTotalTime = fAnimTime, fStartAlpha = A1, fEndAlpha = A2,})
			AnimationMgr_AddAnimation(this.passedit,
																{ fTotalTime = fAnimTime, fStartAlpha = A1, fEndAlpha = A2,})

			IFObj_fnSetVis(this.buttonlabels,1)
			IFObj_fnSetVis(this.buttons,1)
			IFObj_fnSetVis(this.nickedit,1)
			IFObj_fnSetVis(this.emailedit,1)
			IFObj_fnSetVis(this.passedit,1)
			if(this.Helptext_Accept) then
				AnimationMgr_AddAnimation(this.Helptext_Accept,
																	{ fTotalTime = fAnimTime, fStartAlpha = A1, fEndAlpha = A2,})
				IFObj_fnSetVis(this.Helptext_Accept,1)
			end
		end

	end

	-- Always turn these off.
	IFObj_fnSetVis(this.buttons.nick, nil)
	IFObj_fnSetVis(this.buttons.email, nil)
	IFObj_fnSetVis(this.buttons.pass, nil)

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

-- Returns true if the login info looks ok (to allow the 'always'
-- login type)

function ifs_mpgs_login_fnLoginInfoLooksOk(this)
	if((strlen(this.NickStr) < 1) or 
		 (strlen(this.EmailStr) < 1) or 
			 (strlen(this.PasswordStr) < 1) or
			 (not ifs_mpgs_login_fnCheckString(this.NickStr)) or 
			 (not ifs_mpgs_login_fnCheckString(this.EmailStr)) or 
			 (not ifs_mpgs_login_fnCheckString(this.PasswordStr)) or
			 (not ifs_mpgs_login_fnCheckString2(this.NickStr)) or 
			 (not ifs_mpgs_login_fnCheckString2(this.EmailStr)) or 
			 (not ifs_mpgs_login_fnCheckString2(this.PasswordStr))) then
		return nil -- problem
	end

	return 1 -- looks ok.
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

	bg_texture = "iface_bgmeta_space",
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
		ScreenRelativeX = 0.2, -- right-justified to this
		ScreenRelativeY = 0.5,
	},

	buttons = NewIFContainer {
		ScreenRelativeX = 0.215, -- text left-justified within this
		ScreenRelativeY = 0.5,
	},

	bStartedList = nil,
	
	Enter = function(this, bFwd)
		gIFShellScreenTemplate_fnEnter(this, bFwd) -- Call base class

		ifs_mpgs_login_fnSetPieceVis(this,1,1) -- force on by default

		-- Added chunk for error handling...
		if(not bFwd) then
			local ErrorLevel,ErrorMessage = ScriptCB_GetError()
			if(ErrorLevel >= 7) then -- session or login error, must keep going further
				ScriptCB_CancelLogin()
				ScriptCB_ClearError()
			end
		end

		-- returning from a profile save? (also returning from a cancel save)
		if(this.bReturningFromSave) then
			print("ifs_mpgs_login.Enter bReturningFromSave")
			this.bReturningFromSave = nil
			--start the login process
			ifs_mpgs_login_fnSetPieceVis(this, nil, nil, nil) -- fade out all
			ifs_mpgs_login_fnStartLogin(this,this.CurButton == "create")
			return
		end		

		if(bFwd) then
			this.NickStr,this.EmailStr,this.PasswordStr,this.iSaveType,this.iPromptType = ScriptCB_GetGSProfileInfo()
			this.iPromptType = this.iPromptType or 0 -- default to 'prompt' if old executable

			-- Only show 'always' if the parameters look valid
			if((this.iPromptType == 1) and
				 (not ifs_mpgs_login_fnLoginInfoLooksOk(this))) then
				this.iPromptType = 0 -- fallback to 'prompt'
			end

			local CmdNickStr,CmdEmailStr,CmdPassStr = ScriptCB_GetCmdlineLogin()
			CmdNickStr = CmdNickStr or ""
			CmdEmailStr = CmdEmailStr or ""
			CmdPassStr = CmdPassStr or ""
			if((strlen(CmdNickStr) > 1) and
				 (strlen(CmdEmailStr) > 1) and
					 (strlen(CmdPassStr) > 1)) then
				this.NickStr = CmdNickStr
				this.EmailStr = CmdEmailStr
				this.PasswordStr = CmdPassStr
				ifs_mpgs_fnSensitiveInfoDone(1) -- start a login
				ifs_mpgs_fnUpdateButtonText(this)
				return -- wait for login to finish before jumping on.
			end

			if(ScriptCB_InNetGame()) then
				ifs_movietrans_PushScreen(ifs_mp_main)
			else
				if (this.iPromptType == 2) then 
					-- never login is their pref
					ifs_movietrans_PushScreen(ifs_mp_main)
				elseif (this.iPromptType == 1) then
					-- always login is their pref
					ifs_mpgs_fnSensitiveInfoDone(1)
				else
					if (strlen(this.NickStr) < 1) then
						-- Need to ask them if they want to 
						-- Default nickname: what they punched in at the login screen.
						this.NickStr = ScriptCB_ununicode(ScriptCB_GetCurrentProfileName())
						
						Popup_YesNo_Large.CurButton = "yes" -- default
						Popup_YesNo_Large.fnDone = ifs_mpgs_fnAskedCreateDone
						IFText_fnSetString(Popup_YesNo_Large.title,"ifs.gsprofile.askcreate")
						Popup_YesNo_Large:fnActivate(1)
						ifs_mpgs_login_fnSetPieceVis(this,1,nil,nil) -- force off by default
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

		-- Always copy out editbox strings before we get to code below

		this.NickStr = IFEditbox_fnGetString(this.nickedit)
		this.EmailStr = IFEditbox_fnGetString(this.emailedit)
		this.PasswordStr = IFEditbox_fnGetString(this.passedit)
		ScriptCB_SetGSProfileInfo(this.NickStr,this.EmailStr,this.PasswordStr,this.iSaveType,this.iPromptType)

-- 		if(this.CurButton == "nick") then
-- 			ifelm_shellscreen_fnPlaySound(this.acceptSound)
-- 			ifs_vkeyboard.CurString = ScriptCB_tounicode(this.NickStr)
-- 			IFText_fnSetString(ifs_vkeyboard.title,"ifs.vkeyboard.title_nick")
-- 			ifs_movietrans_PushScreen(ifs_vkeyboard)
-- 			vkeyboard_specs.MaxLen = 20
-- 			vkeyboard_specs.MaxWidth = 450
-- 			vkeyboard_specs.bGamespyMode = 1
-- 			ifs_vkeyboard.bCursorOnLetters = 1 -- start cursor in top-left
-- 			vkeyboard_specs.fnDone = ifs_mpgs_login_fnKeyboardDone_Nick
-- 			vkeyboard_specs.fnIsOk = ifs_login_fnIsAcceptable
-- 		elseif (this.CurButton == "email") then
-- 			ifelm_shellscreen_fnPlaySound(this.acceptSound)
-- 			vkeyboard_specs.MaxLen = 50
-- 			vkeyboard_specs.MaxWidth = 650
-- 			vkeyboard_specs.bGamespyMode = 1
-- 			ifs_vkeyboard.bCursorOnLetters = 1 -- start cursor in top-left
-- 			ifs_vkeyboard.CurString = ScriptCB_tounicode(this.EmailStr)
-- 			IFText_fnSetString(ifs_vkeyboard.title,"ifs.vkeyboard.title_email")
-- 			ifs_movietrans_PushScreen(ifs_vkeyboard)
-- 			vkeyboard_specs.fnDone = ifs_mpgs_login_fnKeyboardDone_Email
-- 			vkeyboard_specs.fnIsOk = ifs_mpgs_login_fnEmailIsAcceptable
-- 		elseif (this.CurButton == "pass") then
-- 			ifelm_shellscreen_fnPlaySound(this.acceptSound)
-- 			ifs_vkeyboard.CurString = ScriptCB_tounicode(this.PasswordStr)
-- 			vkeyboard_specs.MaxLen = 30
-- 			vkeyboard_specs.MaxWidth = 450
-- 			vkeyboard_specs.bGamespyMode = 1
-- 			vkeyboard_specs.bPasswordMode = 1
-- 			ifs_vkeyboard.bCursorOnLetters = 1 -- start cursor in top-left
-- 			IFText_fnSetString(ifs_vkeyboard.title,"ifs.vkeyboard.title_password")
-- 			ifs_movietrans_PushScreen(ifs_vkeyboard)
-- 			vkeyboard_specs.fnDone = ifs_mpgs_login_fnKeyboardDone_Pass
-- 			vkeyboard_specs.fnIsOk = ifs_login_fnIsAcceptable
--		else
		if (this.CurButton == "save") then
			ifelm_shellscreen_fnPlaySound(this.acceptSound)
			this.iSaveType = this.iSaveType + 1
			if(this.iSaveType > 2) then
				this.iSaveType = 0
			end

			ScriptCB_SetGSProfileInfo(this.NickStr,this.EmailStr,this.PasswordStr,this.iSaveType,this.iPromptType)
			ifs_mpgs_fnUpdateButtonText(this)
		elseif (this.CurButton == "prompt") then
			ifelm_shellscreen_fnPlaySound(this.acceptSound)
			this.iPromptType = this.iPromptType + 1
			if(this.iPromptType > 2) then
				this.iPromptType = 0
			end

			-- Only show 'always' if the parameters look valid
			if((this.iPromptType == 1) and
				 (not ifs_mpgs_login_fnLoginInfoLooksOk(this))) then
				this.iPromptType = 2 -- skip to never
			end

			ScriptCB_SetGSProfileInfo(this.NickStr,this.EmailStr,this.PasswordStr,this.iSaveType,this.iPromptType)
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
			elseif ((not ifs_mpgs_login_fnCheckString2(this.NickStr)) or 
							(not ifs_mpgs_login_fnCheckString2(this.EmailStr)) or 
								(not ifs_mpgs_login_fnCheckString2(this.PasswordStr)) ) then
				ifs_mpgs_login_fnSetPieceVis(this,nil,nil) -- fade out entries
				Popup_Ok_Large.fnDone = ifs_mpgs_login_fnMustSpecifyOk
				IFText_fnSetString(Popup_Ok_Large.title,"ifs.gsprofile.badchars2")
				Popup_Ok_Large:fnActivate(1)
			else
				-- Fix for 7323 - prompt that this'll send sensitive info
				if(gPlatformStr == "PC") then
					ifs_mpgs_fnSensitiveInfoDone(1)
				else
					Popup_YesNo_Large.CurButton = "no" -- default
					Popup_YesNo_Large.fnDone = ifs_mpgs_fnSensitiveInfoDone
					IFText_fnSetString(Popup_YesNo_Large.title,"ifs.gsprofile.warn_data")
					Popup_YesNo_Large:fnActivate(1)
					ifs_mpgs_login_fnSetPieceVis(this,1,nil,nil) -- force off by default
				end
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

	Input_KeyDown = function(this, iKey)
		if(gCurEditbox) then
			if((iKey == 10) or (iKey == 13)) then -- handle Enter different
				-- by doing nothing
			elseif (iKey == 9) then
				-- Handle tab key
				if(gCurEditbox) then
					IFEditbox_fnHilight(gCurEditbox, nil)
				end
				if(gCurEditbox == this.nickedit) then
					gCurEditbox = this.emailedit
				elseif (gCurEditbox == this.emailedit) then
					gCurEditbox = this.passedit
				elseif (gCurEditbox == this.passedit) then
					gCurEditbox = this.nickedit
				end
				if(gCurEditbox) then
					IFEditbox_fnHilight(gCurEditbox, 1)
				end
			else
				IFEditbox_fnAddChar(gCurEditbox, iKey)

				if (gCurEditbox == this.emailedit) then
					this.EmailStr = IFEditbox_fnGetString(this.emailedit)
					if(strlen(this.EmailStr) >= 40) then 
						IFEditbox_fnSetScale(this.emailedit,0.75,1)
					else
						IFEditbox_fnSetScale(this.emailedit,1,1)
					end
					IFEditbox_fnSetString(this.emailedit, this.EmailStr)
				end
			end
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

	local bNeedToShrink = nil -- (ScriptCB_GetLanguage() ~= "english")
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

	-- +20 is to fix bug 9176 - NM 8/25/04. [Goes into "safe" zone]
	local LabelWidth = ScreenW * (this.buttonlabels.ScreenRelativeX) + 20

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

	-- Hide the static texts, create editboxes in their place (more
	-- PC-friendly)
	IFObj_fnSetVis(this.buttons.nick, nil)
	IFObj_fnSetVis(this.buttons.email, nil)
	IFObj_fnSetVis(this.buttons.pass, nil)
	local EditBoxW = ifs_mpgs_login_vbutton_layout.width - 10
	this.nickedit = NewEditbox {
		ScreenRelativeX = this.buttons.ScreenRelativeX, -- text left-justified within this
		ScreenRelativeY = this.buttons.ScreenRelativeY,
		y = this.buttons.nick.y + 7,
		width = EditBoxW,
		height = ifs_mpgs_login_vbutton_layout.yHeight + 2,
		font = "gamefont_small",
		--		string = "Player 1",
--		MaxLen = EditBoxW,
		MaxChars = 20,
	}
	this.nickedit.x = EditBoxW * 0.5

	this.emailedit = NewEditbox {
		ScreenRelativeX = this.buttons.ScreenRelativeX, -- text left-justified within this
		ScreenRelativeY = this.buttons.ScreenRelativeY,
		y = this.buttons.email.y + 7,
		width = EditBoxW,
		height = ifs_mpgs_login_vbutton_layout.yHeight + 2,
		font = "gamefont_tiny",
		--		string = "Player 1",
--		MaxLen = EditBoxW,
		MaxChars = 50,
	}
	this.emailedit.x = EditBoxW * 0.5

	this.passedit = NewEditbox {
		ScreenRelativeX = this.buttons.ScreenRelativeX, -- text left-justified within this
		ScreenRelativeY = this.buttons.ScreenRelativeY,
		y = this.buttons.pass.y + 7,
		width = EditBoxW,
		height = ifs_mpgs_login_vbutton_layout.yHeight + 2,
		font = "gamefont_tiny",
		--		string = "Player 1",
--		MaxLen = EditBoxW,
		MaxChars = 30,
		bPasswordMode = 1,
	}
	this.passedit.x = EditBoxW * 0.5

end

ifs_mpgs_login_fnBuildScreen(ifs_mpgs_login)
ifs_mpgs_login_fnBuildScreen = nil

AddIFScreen(ifs_mpgs_login,"ifs_mpgs_login")
