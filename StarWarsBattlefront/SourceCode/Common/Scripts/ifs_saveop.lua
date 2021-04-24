-- this is a blank screen that displays nothing but popups
-- that does all of our memory card save/load operations

----------------------------------------------------------------------------------------
-- the "save yes/no" prompt
----------------------------------------------------------------------------------------

function ifs_saveop_StartPromptSave()
--	print("ifs_saveop_StartPromptSave")

	-- set the load/save title text
	local savename = ifs_saveop.saveName or ""
	if(ScriptCB_GetPlatform() == "PS2") then
		IFText_fnSetUString(Popup_LoadSave2.title,ScriptCB_usprintf("ifs.loadsave_ps2.save20",savename))
	elseif(ScriptCB_GetPlatform() == "PC") then
		IFText_fnSetUString(Popup_LoadSave2.title,ScriptCB_usprintf("ifs.loadsave_pc.save20",savename))
	else
		IFText_fnSetUString(Popup_LoadSave2.title,ScriptCB_usprintf("ifs.loadsave_xbox.save20",savename))
	end
	
	-- set the button text
	IFText_fnSetString(Popup_LoadSave2.buttons.A.label,"ifs.loadsave_ps2.save")
	IFText_fnSetString(Popup_LoadSave2.buttons.B.label,"ifs.loadsave_ps2.continuenosave")
	-- set the button visiblity
	
	--print("no Popup_LoadSave2")
	--Popup_LoadSave2:fnActivate(1)
	
	--IFObj_fnSetVis(Popup_LoadSave2.buttons.A.label,1)	
	--IFObj_fnSetVis(Popup_LoadSave2.buttons.B.label,1)	
	--IFObj_fnSetVis(Popup_LoadSave2.buttons.C.label,nil)	
	--Popup_LoadSave2_ResizeButtons()
	--Popup_LoadSave2_SelectButton(1)
	--IFObj_fnSetVis(Popup_LoadSave2,not ScriptCB_IsErrorBoxOpen())

	Popup_LoadSave2.fnAccept = ifs_saveop_SavePromptAccept	
	Popup_LoadSave2.fnAccept(1)
end

function ifs_saveop_SavePromptAccept(fRet)
	local this = ifs_saveop
	
	Popup_LoadSave2.fnAccept = nil
	Popup_LoadSave2:fnActivate(nil)

	if(fRet < 1.5) then
        ifelm_shellscreen_fnPlaySound(this.acceptSound)
--		print("ifs_saveop_SavePromptDone(A - Save)")
		-- yes, save, so continue
		this.bPromptSave = nil
		ifs_saveop_DoOps()
	else
        ifelm_shellscreen_fnPlaySound(this.cancelSound)
--		print("ifs_saveop_SavePromptDone(B - Continue wihtout saving)")
		-- no, don't save.  cancel
		
		ifs_saveop_Cancel()
	end	
end

----------------------------------------------------------------------------------------
-- the "delete yes/no" prompt
----------------------------------------------------------------------------------------

function ifs_saveop_StartPromptDelete()
--	print("ifs_saveop_StartPromptDelete")
	-- show the yes/no popup
	Popup_YesNo.CurButton = "yes" -- default
	Popup_YesNo.fnDone = ifs_saveop_DeletePromptDone
	if(ScriptCB_GetPlatform() == "PS2") then
		IFText_fnSetString(Popup_YesNo.title,"ifs.loadsave_ps2.save21")
	elseif(ScriptCB_GetPlatform() == "PC") then
		IFText_fnSetString(Popup_YesNo.title,"ifs.loadsave_pc.save21")
	else
		IFText_fnSetString(Popup_YesNo.title,"ifs.loadsave_xbox.save21")
	end
	Popup_YesNo:fnActivate(1)
end

function ifs_saveop_DeletePromptDone(bResult)
	local this = ifs_saveop
	if(bResult) then
--		print("ifs_saveop_DeletePromptDone(yes)")
		-- yes, delete, so continue
		this.bPromptDelete = nil
		ifs_saveop_DoOps()
	else
--		print("ifs_saveop_DeletePromptDone(no)")
		-- no, don't save.  cancel
		ifs_saveop_Cancel()
	end	
end

----------------------------------------------------------------------------------------
-- Pre ops
----------------------------------------------------------------------------------------

function ifs_saveop_StartPreOp()
--	print("ifs_saveop_StartPreOp")

	-- show the load save popup
	Popup_LoadSave2:fnActivate(1)

	-- start it
	local opStr
	if(ifs_saveop.bDoPreLoadOps) then
		opStr = ScriptCB_getlocalizestr("ifs.loadsave_ps2.errPrefixLoad")
	elseif(ifs_saveop.bDoPreDeleteOps) then
		opStr = ScriptCB_getlocalizestr("ifs.loadsave_ps2.errPrefixDelete")
	else
		opStr = ScriptCB_getlocalizestr("ifs.loadsave_ps2.errPrefixSave")
	end
	
	-- however since the monkeys at QA don't always like the right message to
	-- display,  sometimes we should force the "save failed" message when its
	-- really loading...
	if(ifs_saveop.ForceSaveFailedMessage) then
--		print("ifs_saveop_StartPreOp ForceSaveFailedMessage")
		opStr = ScriptCB_getlocalizestr("ifs.loadsave_ps2.errPrefixSave")
	end
	
	-- if we're loading the filelist, don't show any error messages.  japan didn't like this.
	local silentFail = (ifs_saveop.doOp == "LoadFileList")
	
	-- if this is true, we don't update the file list
	local noFileList = (ifs_saveop.doOp == "PreNetLoad") or (ifs_saveop.doOp=="SavePatch")
	
	-- if this is true, it doesn't do the free space check.  this allows us to overwrite.
	local noSpaceCheck = (ifs_saveop.doOp=="SavePatch") or (ifs_saveop.doOp == "SaveMetagame" and ifs_saveop.metagame1) or (ifs_saveop.doOp == "SaveProfile" and ScriptCB_DoesProfileExistOnCard(ifs_saveop.saveProfileNum))
	
	-- if this is true, use the IMC dashboard message instead of the in game one
	local useIMCMsg = (ifs_saveop.doOp == "StartGC")
	
	ScriptCB_StartPreOp(ifs_saveop.bDoPreLoadOps or ifs_saveop.bDoPreDeleteOps,opStr,silentFail,noFileList,noSpaceCheck,useIMCMsg)
	
end

function ifs_saveop_PreOpDone(bSuccess)
--	print("ifs_saveop_PreOpDone(",bSuccess,")")
	local this = ifs_saveop	
	
	-- hide the load/save popup
	Popup_LoadSave2:fnActivate(nil)
	
	-- done good?
	if(bSuccess) then
		this.bDoPreLoadOps = nil
		this.bDoPreDeleteOps = nil
		this.bDoPreSaveOps = nil
		-- start the op
		ifs_saveop_DoOps()
	else
		-- cancel
		--ifs_saveop_Cancel()
		--go back to the saveprompt screen
		--ifs_saveop_StartPromptSave()
		this.FromOverwrite = nil
		this.bFromCancel = 1
		this.Enter(this,1)
	end	
end

----------------------------------------------------------------------------------------
-- operation: Do the initial check of the save device (just after the start screen)
----------------------------------------------------------------------------------------

function ifs_saveop_StartInitialMemcardCheck()
	local this = ifs_saveop
--	print("ifs_saveop_StartInitialMemcardCheck")	
	
	-- show the load save popup
	Popup_LoadSave2:fnActivate(1)
	
	-- start it
	ScriptCB_StartInitialMemcardCheck()	
end

function ifs_saveop_InitialMemcardCheckDone(bSuccess)
	local this = ifs_saveop
--	print("ifs_saveop_InitialMemcardCheckDone")	
	
	-- hide the load/save popup
	Popup_LoadSave2:fnActivate(nil)

	-- op succeeded
	if(bSuccess) then
		ifs_saveop_Success()
	else
		ifs_saveop_Cancel()
	end
end

----------------------------------------------------------------------------------------
-- operation: Load the list of all files on the device
----------------------------------------------------------------------------------------

function ifs_saveop_StartLoadFileList()
--	print("ifs_saveop_StartLoadFileList")
	-- the file list is loaded in the preop, so we don't need to do anything
	ifs_saveop_LoadFileListDone()
end

function ifs_saveop_LoadFileListDone()
	local this = ifs_saveop
--	print("ifs_saveop_LoadFileListDone")	
	
	-- op succeeded
	ifs_saveop_Success()
end


----------------------------------------------------------------------------------------
-- operation: load the profile (or two) from the device
----------------------------------------------------------------------------------------

function ifs_saveop_StartLoadProfile()
	local this = ifs_saveop
--	print("ifs_saveop_StartLoadProfile")
	
	-- show the load save popup
	Popup_LoadSave2:fnActivate(1)
	
	-- start the file load
	ScriptCB_StartLoadProfile(this.profile1,this.profile2)
end

function ifs_saveop_LoadProfileDone(bSuccess)
	local this = ifs_saveop
--	print("ifs_saveop_LoadProfileDone(",bSuccess,")")
	
	-- hide the load/save popup
	Popup_LoadSave2:fnActivate(nil)

	-- op succeeded
	if(bSuccess) then
		ifs_saveop_Success()
	else
		ifs_saveop_Cancel()
	end
end

----------------------------------------------------------------------------------------
-- operation: save the current profile
----------------------------------------------------------------------------------------

function ifs_saveop_StartSaveProfile()
	local this = ifs_saveop
--	print("ifs_saveop_StartSaveProfile")
	
	-- show the load save popup
	Popup_LoadSave2:fnActivate(1)
	
	-- make sure they specified which profile to save
	if(not this.saveProfileNum) then
--		print("ifs_saveop.saveProfileNum not specified in ifs_saveop_StartSaveProfile")
		assert(0)
	end
	
	-- start the file load
	ScriptCB_StartSaveProfile(this.saveProfileNum)
end

function ifs_saveop_SaveProfileDone(bSuccess)
	local this = ifs_saveop
--	print("ifs_saveop_SaveProfileDone")
	
	-- hide the load/save popup
	Popup_LoadSave2:fnActivate(nil)

	-- op succeeded
	if(bSuccess) then
		ifs_saveop_Success()
	else
		ifs_saveop_Cancel()
		--go back to the saveprompt screen
		--ifs_saveop_StartPromptSave()
		--this.bFromCancel = 1
		--this.Enter(this,1)
	end
end

------------------------------
-- overwrite callback

function ifs_saveop_StartPromptProfileOverwrite()
--	print("ifs_saveop_StartPromptProfileOverwrite")
	
	-- mark the memory card to ensure that it doesn't change
	ScriptCB_MarkMemoryCard()
	
	-- pc don't ask no questions
	if(ScriptCB_GetPlatform()=="PC") then
		ifs_saveop_ProfileOverwritePromptDone(1)
		return
	end
	
	-- is this filename in the file list?
	if( not ScriptCB_DoesProfileExistOnCard(ifs_saveop.saveProfileNum) ) then
		-- nope, just skip the confirmation
		ifs_saveop_ProfileOverwritePromptDone(1)
		return		
	end
	
	-- show the yes/no popup
	Popup_YesNo.CurButton = "no" -- default
	Popup_YesNo.fnDone = ifs_saveop_ProfileOverwritePromptDone
	local savename = ifs_saveop.saveName or ""
	local prompt = ScriptCB_usprintf("ifs.loadsave_ps2.save26",savename)
	IFText_fnSetUString(Popup_YesNo.title,prompt)
	Popup_YesNo:fnActivate(1)
end

function ifs_saveop_ProfileOverwritePromptDone(bResult)
	local this = ifs_saveop
	if(bResult) then
--		print("ifs_saveop_ProfileOverwritePromptDone(yes)")
		-- yes, overwrite, continue
		
		-- has the memory card been changed?
		-- if yes, recheck the overwrite
		if(not ScriptCB_CheckMemoryCardMark()) then
--			print("memory card mark not found, reprompting overwrite")
			this.RePromptOverwrite = 1
		end
		
		-- reenter
		this.FromOverwrite = 1
		this.Enter(this,1)
	else
--		print("ifs_saveop_ProfileOverwritePromptDone(no)")
		-- no, don't save.  back to "save?" prompt
		this.FromOverwrite = nil
		this.bFromCancel = 1
		this.Enter(this,1)		
	end	
end


----------------------------------------------------------------------------------------
-- operation: delete the profile
----------------------------------------------------------------------------------------

function ifs_saveop_StartDeleteProfile()
	local this = ifs_saveop
--	print("ifs_saveop_StartDeleteProfile")
	
	-- show the load save popup
	Popup_LoadSave2:fnActivate(1)
	
	-- start the file load
	ScriptCB_StartDeleteProfile(this.profile1)
end

function ifs_saveop_DeleteProfileDone(bSuccess)
	local this = ifs_saveop
--	print("ifs_saveop_DeleteProfileDone")
	
	-- hide the load/save popup
	Popup_LoadSave2:fnActivate(nil)

	-- op succeeded
	if(bSuccess) then
		ifs_saveop_Success()
	else
		ifs_saveop_Cancel()
		--ifs_saveop_StartPromptDelete()
	end
end

----------------------------------------------------------------------------------------
-- operation: load the metagame from the device
----------------------------------------------------------------------------------------

function ifs_saveop_StartLoadMetagame()
	local this = ifs_saveop
--	print("ifs_saveop_StartLoadMetagame")
	
	-- show the load save popup
	Popup_LoadSave2:fnActivate(1)
	
	-- start the file load
	if( ScriptCB_IsSplitscreen() == 1) then
		ScriptCB_StartLoadMetagameSplitScreen(this.metagame1)
	else
		ScriptCB_StartLoadMetagame(this.metagame1)
	end
	this.metagame1 = nil
end

function ifs_saveop_LoadMetagameDone(bSuccess)
	local this = ifs_saveop
--	print("ifs_saveop_LoadMetagameDone")
	
	-- hide the load/save popup
	Popup_LoadSave2:fnActivate(nil)

	-- op succeeded
	if(bSuccess) then
		ifs_saveop_Success()
	else
		ifs_saveop_Cancel()
	end
end

----------------------------------------------------------------------------------------
-- operation: save the current metagame
----------------------------------------------------------------------------------------

function ifs_saveop_StartSaveMetagame()
	local this = ifs_saveop
--	print("ifs_saveop_StartSaveMetagame")
	
	-- show the load save popup
	Popup_LoadSave2:fnActivate(1)
	
	-- start the file load
	if( ScriptCB_IsSplitscreen() == 1) then
		ScriptCB_StartSaveMetagameSplitScreen(this.metagame1)
	else
		ScriptCB_StartSaveMetagame(this.metagame1)
	end
end

function ifs_saveop_SaveMetagameDone(bSuccess)
	local this = ifs_saveop
--	print("ifs_saveop_SaveMetagameDone")
	
	-- hide the load/save popup
	Popup_LoadSave2:fnActivate(nil)

	-- op succeeded
	if(bSuccess) then
		ifs_saveop_Success()
	else
		this.bFromCancel = 1
		this.Enter(this,1)
	end
end

------------------------------
-- overwrite callback

function ifs_saveop_StartPromptMetaOverwrite()
--	print("ifs_saveop_StartPromptMetaOverwrite")
	local this = ifs_saveop
	
	-- is there a current metagame filename?
	local metagame_exist = nil
	if( this.metagame1 ) then
		if( ScriptCB_IsSplitscreen() == 1) then
			print("+++this.metagame1", this.metagame1)
			metagame_exist = ScriptCB_DoesMetagameExistOnCardSplitScreen(this.metagame1) 
		else
			metagame_exist = ScriptCB_DoesMetagameExistOnCard(this.metagame1)
		end	
	end
		
	if( (not this.metagame1) or (not metagame_exist) ) then
		-- nope, just skip the confirmation
		ifs_saveop_MetaOverwritePromptDone(1)
		return		
	end
	
	-- show the yes/no popup
	Popup_YesNo.CurButton = "no" -- default
	Popup_YesNo.fnDone = ifs_saveop_MetaOverwritePromptDone
	IFText_fnSetString(Popup_YesNo.title,"ifs.loadsave_ps2.save25")
	Popup_YesNo:fnActivate(1)
end

function ifs_saveop_MetaOverwritePromptDone(bResult)
	local this = ifs_saveop
	if(bResult) then
		print("ifs_saveop_MetaOverwritePromptDone(yes)")
		-- yes, overwrite, continue
		ifs_saveop_StartSaveMetagame()
	else
		print("ifs_saveop_MetaOverwritePromptDone(no)")
		-- no, don't save.  back to "save?" prompt
		this.bFromCancel = 1
		this.Enter(this,1)		
	end	
end

----------------------------------------------------------------------------------------
-- operation: delete the metagame
----------------------------------------------------------------------------------------

function ifs_saveop_StartDeleteMetagame()
	local this = ifs_saveop
	print("ifs_saveop_StartDeleteMetagame", this.metagame1)
	
	-- show the load save popup
	Popup_LoadSave2:fnActivate(1)
	
	-- start the file load
	if( ScriptCB_IsSplitscreen() == 1) then
		ScriptCB_StartDeleteMetagameSplitScreen(this.metagame1)
	else
		ScriptCB_StartDeleteMetagame(this.metagame1)
	end
	this.profile1 = nil
end

function ifs_saveop_DeleteMetagameDone(bSuccess)
	local this = ifs_saveop
	print("ifs_saveop_DeleteMetagameDone")
	
	-- hide the load/save popup
	Popup_LoadSave2:fnActivate(nil)

	-- op succeeded
	if(bSuccess) then
		ifs_saveop_Success()
	else
		ifs_saveop_Cancel()
		--ifs_saveop_StartPromptDelete()
	end
end


----------------------------------------------------------------------------------------
-- the main op functions.  switches to different modes of this screen.
----------------------------------------------------------------------------------------

function ifs_saveop_DoOps()
	local this = ifs_saveop
	
	print("ifs_saveop_DoOps ", this.doOp)
	
	-- if this is the initial memcard check, start it.  make sure we didn't specify
	-- any preops
	if( this.doOp == "InitialMemcardCheck" ) then
		-- don't specify these for this op
		assert( not this.bDoPreLoadOps )
		assert( not this.bDoPreDeleteOps )
		assert( not this.bDoPreSaveOps )		
		
		-- start it
		ifs_saveop_StartInitialMemcardCheck()
		return
	end
	
	-- if we're going to save, prompt yes/no first
	if( this.bPromptSave ) then
		print("ifs_saveop_DoOps PromptSave")
		ifs_saveop_StartPromptSave()
		return
	end

	-- if we're going to delete, prompt yes/no first
	if( this.bPromptDelete ) then
		print("ifs_saveop_DoOps PromptDelete")
		ifs_saveop_StartPromptDelete()
		return
	end
	
	-- if this is a load operation, start the pre-load checks
	if( this.bDoPreLoadOps ) then
		print("ifs_saveop_DoOps PreLoad")
		ifs_saveop_StartPreOp()
		return
	end
	
	-- if this is a delete operation, start the pre-delete checks
	if( this.bDoPreDeleteOps ) then
		print("ifs_saveop_DoOps PreDelete")
		ifs_saveop_StartPreOp()
		return
	end
	
	-- if this is a save operation, start the pre-save checks
	if( this.bDoPreSaveOps ) then
		print("ifs_saveop_DoOps PreSave")
		ifs_saveop_StartPreOp()
		return
	end
	
	-- save the patch.  all we wanted was the save preop
	if( this.doOp == "SavePatch" ) then
		ifs_saveop_Success()
		return
	end
	
	-- start a gc game.  all we wanted to do was the space check in the preop
	if( this.doOp == "StartGC" ) then
		ifs_saveop_Success()
		return
	end
	
	-- load the list of all files on the device?
	if( this.doOp == "LoadFileList" or this.doOp == "PreNetLoad" ) then
		ifs_saveop_StartLoadFileList()
		return
	end
	
	-- load the specified profile
	if( this.doOp == "LoadProfile" ) then
		ifs_saveop_StartLoadProfile()
		return
	end
	
	-- save the specified profile
	if( this.doOp == "SaveProfile" ) then
		if( this.FromOverwrite and not this.RePromptOverwrite) then
			this.FromOverwrite = nil
			ifs_saveop_StartSaveProfile()
		else
			this.RePromptOverwrite = nil
			ifs_saveop_StartPromptProfileOverwrite()
		end
		return
	end
	
	-- delete the specified profile
	if( this.doOp == "DeleteProfile" ) then
		ifs_saveop_StartDeleteProfile()
		return
	end	

	-- load the specified metagame
	if( this.doOp == "LoadMetagame" ) then
		ifs_saveop_StartLoadMetagame()
		return
	end
	
	-- save the specified metagame
	if( this.doOp == "SaveMetagame" ) then
		ifs_saveop_StartPromptMetaOverwrite()
		return
	end
	
	-- delete the specified metagame
	if( this.doOp == "DeleteMetagame" ) then
		ifs_saveop_StartDeleteMetagame()
		return
	end	

	-- we shouldn't ever get this far... you should call _Success() or _Cancel() from the Done callback
	assert(false)
	ScriptCB_PopScreen()
end

function ifs_saveop_Success()
	print("ifs_saveop_Success")
	ifs_saveop.doOp = nil
	ifs_saveop.profile1 = nil
	ifs_saveop.profile2 = nil
	
	if(ifs_saveop.OnSuccess) then
		ifs_saveop.OnSuccess()
	else
		print("ifs_saveop_Success no .OnSuccess specified")
	end
end

function ifs_saveop_Cancel()
	print("ifs_saveop_Cancel")
	ifs_saveop.doOp = nil

	if(ifs_saveop.OnCancel) then
		ifs_saveop.OnCancel()
	else
		print("ifs_saveop_Cancel no .OnCancel specified")
	end
end

----------------------------------------------------------------------------------------
-- the main screen
----------------------------------------------------------------------------------------

ifs_saveop = NewIFShellScreen {
	
	bNohelptext = 1,
    exitSound = "",
	
	Enter = function(this, bFwd)
		print("ifs_saveop.Enter(",bFwd,")")
		gIFShellScreenTemplate_fnEnter(this, bFwd) -- call default enter function
		
		-- if we back into this screen, keep going
		if(not bFwd) then
			print("backed into ifs_saveop, popping")
			ScriptCB_PopScreen()
			return
		end
		
		-- this is the result of the operation
		this.bSuccessValue = nil

		-- if its a profile save, and the current profile isn't dirty, skip it
		if( this.doOp == "SaveProfile" and not ScriptCB_IsProfileDirty(this.saveProfileNum) ) then
			print("ifs_saveop SaveProfile + not dirty.  bail.")
			ifs_saveop_Success()
			return
		end
		-- if its profile save, and profile two is dirty, and the last game wasn't split, don't save it
		if( this.doOp == "SaveProfile" and this.saveProfileNum==2 and not ScriptCB_WasSplitscreen()) then
			print("ifs_saveop SaveProfile 2 + player2 dirty + but not split.  bail")
			-- set player two as not dirty anymore
			ScriptCB_SetProfileNotDirty(2)
			-- done
			ifs_saveop_Success()
			return
		end
		

		-- should we prompt for "save yes/no"
		this.bPromptSave = (this.doOp == "SaveProfile") or (this.doOp == "SaveMetagame")
		-- unless we've said not to (or are recursing from the overwrite prompt)
		if( this.NoPromptSave or this.FromOverwrite) then
			this.bPromptSave = nil
		end
		
		-- if we're recursing into this screen from a canceled function, and we DONT prompt
		-- for save, and we're not recursing from the overwrite profile prompt, 
		-- then we should just cancel
		if( this.bFromCancel and (not this.bPromptSave) and (not this.FromOverwrite) ) then
			print("ifs_saveop.bFromCancel and (not this.bPromptSave), canceling")
			this.bFromCancel = 1
			ifs_saveop_Cancel()
			return
		end

		-- set which pre-ops we should do
		this.bDoPreLoadOps = (this.doOp == "LoadFileList") or (this.doOp == "PreNetLoad") or (this.doOp == "LoadProfile") or (this.doOp == "LoadMetagame")
		this.bDoPreDeleteOps = (this.doOp == "DeleteProfile") or (this.doOp == "DeleteMetagame") 
		this.bDoPreSaveOps = (this.doOp == "SaveProfile") or (this.doOp == "SaveMetagame") or (this.doOp == "SavePatch") or (this.doOp == "StartGC")
		
		-- start the ops
		ifs_saveop_DoOps()
	end,

	Exit = function(this, bFwd)
        if (gPrevMovie) then
            ifelem_shellscreen_fnStartMovie(gPrevMovie, 1, nil, 1)
            gPrevMovie = nil
        end
		this.NoPromptSave = nil
		this.profile1 = nil
		this.profile2 = nil
		this.metagame1 = nil		
		this.bFromCancel = nil
		this.FromOverwrite = nil
		this.ForceSaveFailedMessage = nil
		this.saveProfileNum = nil
		this.saveName = nil
		this.OnSuccess = nil
		this.OnCancel = nil
		this.doOp = nil
	end,

	Input_Accept = function(this)
	end,
	Input_Back = function(this)
	end,
	Input_GeneralUp = function(this)
	end,
	Input_GeneralRight = function(this)
	end,
	Input_GeneralDown = function(this)
	end,
	Input_GeneralLeft = function(this)
	end,
	Input_GeneralUp2 = function(this)
	end,
	Input_GeneralRight2 = function(this)
	end,
	Input_GeneralDown2 = function(this)
	end,
	Input_GeneralLeft2 = function(this)
	end,	

	fnPostError = function(this,bUserHitYes,ErrorLevel,ErrorMessage)
									print("Do Nothing")
		if(ScriptCB_IsPopupOpen()) then
			IFObj_fnSetVis(Popup_LoadSave2,1)
		end
--		print("ifs_mp_main fnPostError(..,",bUserHitYes,ErrorLevel)
--		if(ErrorLevel >= 6) then
--			ScriptCB_PopScreen()
--		end
	end,
}

AddIFScreen(ifs_saveop,"ifs_saveop")