
-----------------------------------------------------------------------
-- new patch has been downloaded, you can't pass
-----------------------------------------------------------------------

function ifs_mpps2_patch_NewPatch()

	-- set this so we can never get past this until we reboot
	ScriptCB_SetHasNewPatch()

	Popup_Ok.fnDone = ifs_mpps2_patch_NewPatch_ok
	IFText_fnSetString(Popup_Ok.title,"ifs.patch.restart")
	Popup_Ok:fnActivate(1)
end

function ifs_mpps2_patch_NewPatch_ok()
	ScriptCB_PopScreen()
end

-----------------------------------------------------------------------
-- callbacks and popups for the initial check (is there a new patch?)
-----------------------------------------------------------------------

-- start the patch check
function ifs_mpps2_patch_InitialCheck()
	print("ifs_mpps2_patch_InitialCheck")
	ScriptCB_StartPS2PatchCheck(nil)		
	-- And show the popup.
	Popup_Busy.fnCheckDone =	ifs_mpps2_patch_busypopup_fnCheckDone
	Popup_Busy.fnOnSuccess =	ifs_mpps2_patch_busypopup_fnOnSuccess
	Popup_Busy.fnOnFail =		ifs_mpps2_patch_busypopup_fnOnFail
	Popup_Busy.fnOnCancel =		ifs_mpps2_patch_busypopup_fnOnCancel
-- to allow this you've got to stop the patch thread
--	Popup_Busy.bNoCancel = nil
	Popup_Busy.fTimeout = 600 -- seconds
	IFText_fnSetString(Popup_Busy.title,"ifs.patch.checking")
	Popup_Busy:fnActivate(1)
end

-- Returns -1, 0, or 1, depending on error, busy, or success
function ifs_mpps2_patch_busypopup_fnCheckDone()
	return ScriptCB_IsPS2PatchCheckDone()
end

function ifs_mpps2_patch_busypopup_fnOnSuccess()

	-- we actually can't ever get to this function, since the QPatch cycle will never "succeed"
	print("ifs_mpps2_patch_busypopup_fnOnSuccess shouldn't get here!")
	assert(false)
	
end

function ifs_mpps2_patch_busypopup_fnOnFail()
	print("ifs_mpps2_patch_busypopup_fnOnFail")
	local this = ifs_mpps2_patch
	Popup_Busy:fnActivate(nil)
	
	-- we failed, so get the error message, and show it on the screen.
	local errStr1,errCode = ScriptCB_GetPS2PatchCheckError()
	print("errCode = ",errCode)
	
	-- no update required?
	if(errCode == 4) then
		-- if we've gotten a patch but haven't rebooted, don't let them continue
		if(ScriptCB_HasNewPatch()) then
			ifs_mpps2_patch_NewPatch()
			return
		end		
		-- otherwise continue silently
		ScriptCB_DoneCheckPatch()
		ifs_movietrans_PushScreen(ifs_mpgs_login)
		return
	end
	
	-- anything else should be considered an available patch
	ifs_mpps2_patch_DownloadPrompt()
end

function ifs_mpps2_patch_busypopup_fnOnCancel()
	print("ifs_mpps2_patch_busypopup_fnOnCancel")
	local this = ifs_mpps2_patch
	Popup_Busy:fnActivate(nil)
	ScriptCB_PopScreen()
end

-----------------------------------------------------------------------
-- there is a new patch available, do you want to download it now?
-----------------------------------------------------------------------

function ifs_mpps2_patch_DownloadPrompt()
	print("ifs_mpps2_patch_promptDownload")
	-- show the yes/no popup
	Popup_YesNo_Large.CurButton = "yes" -- default
	Popup_YesNo_Large.fnDone = ifs_mpps2_patch_DownloadPromptDone
	IFText_fnSetFont(Popup_YesNo_Large.title,"gamefont_tiny")
	IFText_fnSetString(Popup_YesNo_Large.title,"ifs.patch.isnewpatch")
	Popup_YesNo_Large:fnActivate(1)
end

function ifs_mpps2_patch_DownloadPromptDone(bResult)
	IFText_fnSetFont(Popup_YesNo_Large.title,"gamefont_medium")
	if(bResult) then
		print("ifs_mpps2_patch_DownloadPromptDone(yes)")
		-- yes, start the download
		ifs_mpps2_patch_StartDownload()		
	else
		print("ifs_mpps2_patch_DownloadPromptDone(no)")
		-- no, don't save.  cancel.  pop.
		ScriptCB_PopScreen();
	end	
end

-----------------------------------------------------------------------
-- main screen
-----------------------------------------------------------------------

function ifs_mpps2_patch_StartDownload()
	print("ifs_mpps2_patch_StartDownload")
	ScriptCB_StartPS2PatchCheck(1)
	-- And show the popup.
	Popup_Busy.fnCheckDone =	ifs_mpps2_patch_Download_CheckDone
	Popup_Busy.fnOnSuccess =	ifs_mpps2_patch_Download_OnFail -- we can't succeed, so this doesn't matter
	Popup_Busy.fnOnFail =		ifs_mpps2_patch_Download_OnFail
	Popup_Busy.fnOnCancel =		ifs_mpps2_patch_Download_OnCancel
-- to allow this you've got to stop the patch thread
--	Popup_Busy.bNoCancel = nil
	Popup_Busy.fTimeout = 6000 -- seconds
	IFText_fnSetString(Popup_Busy.title,"ifs.patch.checking")
	Popup_Busy:fnActivate(1)
end

function ifs_mpps2_patch_Download_CheckDone()
	return ScriptCB_IsPS2PatchCheckDone()
end

function ifs_mpps2_patch_Download_OnFail()
	print("ifs_mpps2_patch_Download_OnFail")
	local this = ifs_mpps2_patch
	Popup_Busy:fnActivate(nil)
	
	-- we failed, so get the error message, and show it on the screen.
	local errStr1,errCode = ScriptCB_GetPS2PatchCheckError()
	print("errCode = ",errCode)
	
	-- no update required?
	if(errCode == 4) then
		-- continue silently
		ScriptCB_DoneCheckPatch()
		ifs_movietrans_PushScreen(ifs_mpgs_login)
		return
	end
	
	-- did we get the new patch?
	if(errCode == 5) then
		ifs_mpps2_patch_NewPatch()
		return
	end
	
	-- else error
	Popup_Ok.fnDone = ifs_mpps2_patch_Download_errorok
	IFText_fnSetString(Popup_Ok.title,errStr1)
	Popup_Ok:fnActivate(1)	
end

function ifs_mpps2_patch_Download_errorok()
	ScriptCB_PopScreen()
end

function ifs_mpps2_patch_Download_OnCancel()
	print("ifs_mpps2_patch_Download_OnCancel")
	Popup_Busy:fnActivate(nil)
	ScriptCB_PopScreen()
end


-----------------------------------------------------------------------
-- main screen
-----------------------------------------------------------------------

ifs_mpps2_patch = NewIFShellScreen {
 	nologo = 1,
 	bNohelptext = 1,
 	bg_texture = "iface_bgmeta_space",
    movieIntro      = nil,
    movieBackground = nil,
 	
	buttons = NewIFContainer {
		ScreenRelativeX = 0.5,
		ScreenRelativeY = 0.8,
	},

	errorText = NewIFText {
		font = "gamefont_medium",
		textw = 400,
		texth = 400,
		y = -80,
		ScreenRelativeX = 0.5,
		ScreenRelativeY = 0.5,
		flashy=0,
	},
 	

	Enter = function(this,bFwd)
		gIFShellScreenTemplate_fnEnter(this, bFwd)

		-- Backing into this screen? Don't stay here.
		if(not bFwd) then
			ScriptCB_PopScreen()
			return
		end
		
		-- if we've already got a patch, but haven't rebooted, go there
		if(ScriptCB_HasNewPatch()) then
			ifs_mpps2_patch_NewPatch()
			return
		end
		
		-- should we even check?
		if(not ScriptCB_ShouldCheckPatch()) then
		    ifs_movietrans_PushScreen(ifs_mpgs_login)
			return
		end
		
		-- hide the error text until we get an error
		this.errorVisible = nil
		IFObj_fnSetVis(this.errorText,nil)
		IFObj_fnSetVis(this.buttons,nil)
		
		-- coming forward, start the initial patch stuff (no download, just check)
		ifs_mpps2_patch_InitialCheck()
	end,
	
	Input_Accept = function(this)
		-- if we're on the error mode, then quit when we get a button press
		if(this.errorVisible) then

			if(this.CurButton == "ok") then
				ScriptCB_PopScreen()
--			elseif (this.CurButton == "skip") then
--				ScriptCB_DoneCheckPatch()
--                ifs_movietrans_PushScreen(ifs_mpgs_login)
			end
		end
	end,

}

ifs_mpps2_patch_button_layout = {
	yTop = 15,
	yHeight = 25,
	ySpacing  = 5,
	width = 100,
	font = "gamefont_medium",
	buttonlist = { 
--		{ tag = "skip", string = "skip it", },
		{ tag = "ok", string = "common.ok", },
	},
	nocreatebackground = 1,
}
ifs_mpps2_patch.CurButton = AddVerticalButtons(ifs_mpps2_patch.buttons,ifs_mpps2_patch_button_layout)
AddIFScreen(ifs_mpps2_patch,"ifs_mpps2_patch")
