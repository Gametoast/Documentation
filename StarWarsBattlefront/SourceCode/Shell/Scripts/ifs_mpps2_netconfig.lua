-- Multiplayer list of sessions screen. For XBox Optimatch or Gamespy
-- "pick a game to join" screen.

---------------------------------------------------------------------------------------
-- show/hide everything on this screen
---------------------------------------------------------------------------------------

function ifs_mpps2_netconfig_ShowHide(vis)
--	IFObj_fnSetVis(ifs_mpps2_netconfig.title,vis)
	IFObj_fnSetVis(ifs_mpps2_netconfig.listbox,vis)
	IFObj_fnSetVis(ifs_mpps2_netconfig.Helptext_AddEdit,vis)
	
	-- why don't these hide the two help buttons?
	IFObj_fnSetVis(ifs_mpps2_netconfig.Helptext_Back,vis)
	IFObj_fnSetVis(ifs_mpps2_netconfig.Helptext_Accept,vis)
end

---------------------------------------------------------------------------------------
-- update the list of net configs from the memory card
---------------------------------------------------------------------------------------

function ifs_mpps2_netconfig_StartMemcardUpdate(this)
	print("ifs_mpps2_netconfig_StartMemcardUpdate")
	-- and hide the entire screen
	ifs_mpps2_netconfig_ShowHide(nil)
	-- and show the popup.
	Popup_Busy.fnCheckDone = ifs_mpps2_netconfig_MemcardUpdate_fnCheckDone
	Popup_Busy.fnOnSuccess = ifs_mpps2_netconfig_MemcardUpdate_fnOnSuccess
	Popup_Busy.fnOnCancel = ifs_mpps2_netconfig_MemcardUpdate_fnOnSuccess
	Popup_Busy.fnOnFail =	ifs_mpps2_netconfig_MemcardUpdate_fnOnFail
	Popup_Busy.bNoCancel = 1
	IFText_fnSetFont(Popup_Busy.title,"gamefont_tiny")
	IFText_fnSetString(Popup_Busy.title,"ifs.loadsave_ps2.save19")
	Popup_Busy:fnActivate(1)
end

-- Returns -1, 0, or 1, depending on error, busy, or success
function ifs_mpps2_netconfig_MemcardUpdate_fnCheckDone()
	print("ifs_mpps2_netconfig_MemcardUpdate_fnCheckDone")
	
	-- do the update (1 means force update)
	local magicErrorRet = ScriptCB_UpdateNetConfigs(1)

	-- always done.  this isn't actually async.
	
	-- mark the memory card so the user can't change it
	ScriptCB_MarkMemoryCard()
	
	-- did we find a magic error config?  this just means they made it on another
	-- console, and it got dropped from the list.
	if(magicErrorRet) then
		return -1
	else
		return 1
	end
end

function ifs_mpps2_netconfig_MemcardUpdate_fnOnSuccess()
	print("ifs_mpps2_netconfig_MemcardUpdate_fnOnSuccess()")

	IFText_fnSetFont(Popup_Busy.title,"gamefont_medium")
	Popup_Busy:fnActivate(nil)

	-- show the screen
	ifs_mpps2_netconfig_ShowHide(1)
	-- reenter it
	ifs_mpps2_netconfig.JustUpdated = 1
	ifs_mpps2_netconfig.Enter(ifs_mpps2_netconfig,1)
end

function ifs_mpps2_netconfig_MemcardUpdate_fnOnFail()
	print("ifs_mpps2_netconfig_MemcardUpdate_fnOnFail()")
	IFText_fnSetFont(Popup_Busy.title,"gamefont_medium")
	Popup_Busy:fnActivate(nil)
	
	-- show an ok box that says they found a different config
	Popup_Ok.fnDone = ifs_mpps2_netconfig_MemcardUpdate_FailOk
	IFText_fnSetFont(Popup_Ok.title,"gamefont_tiny")
	IFText_fnSetString(Popup_Ok.title,"ifs.mp.netconfig.magicerror")
	Popup_Ok:fnActivate(1)
end

function ifs_mpps2_netconfig_MemcardUpdate_FailOk()
	IFText_fnSetFont(Popup_Ok.title,"gamefont_medium")

	-- show the screen
	ifs_mpps2_netconfig_ShowHide(1)
	-- reenter it
	ifs_mpps2_netconfig.JustUpdated = 1
	ifs_mpps2_netconfig.Enter(ifs_mpps2_netconfig,1)
end

---------------------------------------------------------------------------------------
-- the memory card has been changed since we loaded the list, so show a message and reload
---------------------------------------------------------------------------------------

function ifs_mpps2_netconfig_MarkChanged()
	-- hide the entire screen
	ifs_mpps2_netconfig_ShowHide(nil)

	Popup_Ok.fnDone = ifs_mpps2_netconfig_MarkChangedOk
	IFText_fnSetFont(Popup_Ok.title,"gamefont_tiny")
	IFText_fnSetString(Popup_Ok.title,"ifs.mp.netconfig.markchanged")
	Popup_Ok:fnActivate(1)
end

function ifs_mpps2_netconfig_MarkChangedOk()
	-- show the entire screen
	ifs_mpps2_netconfig_ShowHide(1)
	
	-- reload the list
	ifs_mpps2_netconfig_StartMemcardUpdate()
end

---------------------------------------------------------------------------------------
-- do the load preop before the connect sockets busy
---------------------------------------------------------------------------------------

function ifs_mpps2_netconfig_StartLoadPreop()
	print("ifs_mpps2_netconfig_StartLoadPreop")
	
	ifs_saveop.doOp = "PreNetLoad"
	ifs_saveop.OnSuccess = ifs_mpps2_netconfig_LoadPreopSuccess
	ifs_saveop.OnCancel = ifs_mpps2_netconfig_LoadPreopCancel
	
	-- don't turn on network cable checking
	ifs_mpps2_netconfig.GoingToSaveop = 1
	
	ifs_movietrans_PushScreen(ifs_saveop);	
end

function ifs_mpps2_netconfig_LoadPreopSuccess()
	print("ifs_mpps2_netconfig_LoadPreopSuccess")

	-- start the connect
	ifs_mpps2_netconfig.ConnectOnEnter = 1
	
	-- pop ifs_saveop, reenter ifs_mpps2_netconfig
	ScriptCB_PopScreen()
	
end

function ifs_mpps2_netconfig_LoadPreopCancel()
	-- ok, continue
	print("ifs_mpps2_netconfig_LoadPreopCancel")
	
	-- pop ifs_saveop, reenter ifs_mpps2_netconfig
	ifs_mpps2_netconfig.FromLoadCancel = 1
	ScriptCB_PopScreen()
end



---------------------------------------------------------------------------------------
-- busy popup for the ConnectSockets() fsm
---------------------------------------------------------------------------------------

function ifs_mpps2_netconfig_StartConnect(this)
	-- start the connect
	local config = ps2netconfig_listbox_contents[ps2netconfig_listbox_layout.SelectedIdx]
	ScriptCB_ConnectUsingEntry(ps2netconfig_listbox_layout.SelectedIdx,config.combostr)
	-- and hide the entire screen
	ifs_mpps2_netconfig_ShowHide(nil)
	-- and show the popup.
	Popup_Busy.fnCheckDone =	ifs_mpps2_netconfig_busypopup_fnCheckDone
	Popup_Busy.fnOnSuccess =	ifs_mpps2_netconfig_busypopup_fnOnSuccess
	Popup_Busy.fnOnFail =		ifs_mpps2_netconfig_busypopup_fnOnFail
	Popup_Busy.fnOnCancel =		ifs_mpps2_netconfig_busypopup_fnOnCancel
--	Popup_Busy.bNoCancel = 1 -- no cancel button
	Popup_Busy.bNoCancel = not ScriptCB_CancelConnectSockets -- yes cancel button
	Popup_Busy.fTimeout = 60 -- seconds
	IFText_fnSetString(Popup_Busy.title,"ifs.mp.netconfig.connecting")
	Popup_Busy:fnActivate(1)
end


-- Returns -1, 0, or 1, depending on error, busy, or success
function ifs_mpps2_netconfig_busypopup_fnCheckDone()
	-- cycle the connect status
	local status = ScriptCB_GetConnectSocketsStatus()
	
	-- if it returns -100 this means that the PPPoE connect failed, so show
	-- the message for that when we fail.
	ifs_mpps2_netconfig.ErrorWasPPPoE = (status == -100)	
	
	-- but reset this to -1 since the callback can't handle that
	if(status < 0) then
		status = -1
	end	
	return status
end

function ifs_mpps2_netconfig_busypopup_fnOnSuccess()
	print("ifs_mpps2_netconfig_busypopup_fnOnSuccess()")

	local this = ifs_mpps2_netconfig
	Popup_Busy:fnActivate(nil)
	ifs_mpps2_netconfig_ShowHide(1)	
	-- done, goto gamespy login

	if (gOnlineServiceStr == "GameSpy") then
		ifs_movietrans_PushScreen(ifs_mpps2_dnas)
	else
		ifs_movietrans_PushScreen(ifs_mp_main)
	end
end

function ifs_mpps2_netconfig_busypopup_fnOnFail()
	local this = ifs_mpps2_netconfig
	Popup_Busy:fnActivate(nil)

    ifelm_shellscreen_fnPlaySound(this.errorSound)
	local wasPPPoE = ScriptCB_CancelConnectSockets()
	
	-- if it was a PPPoE error, show that message, otherwise just fail
	if(this.ErrorWasPPPoE or wasPPPoE) then
		ErrorWasPPPoE = nil
		-- show an ok box with the error text
		Popup_Ok.fnDone = ifs_mpps2_netconfig_PPPoE_ok
		IFText_fnSetFont(Popup_Ok.title,"gamefont_tiny")
		IFText_fnSetString(Popup_Ok.title,"ifs.mp.netconfig.pppoe_error")
		Popup_Ok:fnActivate(1)
	else	
		ifs_mpps2_netconfig_ShowHide(1)
	end
end

function ifs_mpps2_netconfig_PPPoE_ok()
	-- reset the font
	IFText_fnSetFont(Popup_Ok.title,"gamefont_medium")
	-- done
	ifs_mpps2_netconfig_ShowHide(1)
end

function ifs_mpps2_netconfig_busypopup_fnOnCancel()
	local this = ifs_mpps2_netconfig
	Popup_Busy:fnActivate(nil)
	ifs_mpps2_netconfig_ShowHide(1)
	ScriptCB_CancelConnectSockets()
    ifelm_shellscreen_fnPlaySound(this.cancelSound)
end

---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------


-- Helper function. Given a layout (x,y,width, height), returns a
-- fully-built item.
function PS2NetConfig_Listbox_CreateItem(layout)
	-- Make a coordinate system pegged to the top-left of where the cursor would go.
	local Temp = NewIFContainer { 
		x = layout.x - 0.5 * layout.width, 
		y = layout.y - (layout.height * 0.5) + 8,
	}

	local heightper = layout.height / 4
	local widthper = 0.95 * layout.width

	Temp.manufacturerentry = NewIFText{ 
		x = 15, y = 0 * heightper,
		textw = widthper, texth = heightper, 
		halign = "left", font = "gamefont_tiny",
		nocreatebackground = 1,
	}
	Temp.deviceentry = NewIFText{ 
		x = 15, y = 1 * heightper, 
		textw = widthper, texth = heightper, 
		halign = "left", font = "gamefont_tiny", 
		nocreatebackground = 1,
	}
	Temp.commententry = NewIFText{ 
		x = 15, y = 2 * heightper,
		textw = widthper, texth = 2 * heightper, 
		halign = "left", font = "gamefont_tiny", 
		nocreatebackground = 1,
	}

	return Temp
end

-- Helper function, sets a textitem to the specified string. Sets
-- font small if necessary
function PS2NetConfig_Listbox_SetText(TextItem,ShowStr)
--	if(strlen(ShowStr) > 100) then
		IFText_fnSetFont(TextItem,"gamefont_tiny")
--	else
--		IFText_fnSetFont(TextItem,"gamefont_medium")
--	end
	IFText_fnSetString(TextItem,ShowStr)
end

-- Helper function. For a destination item (previously created w/
-- CreateItem), fills it in with data, which may be nil (==blank it)
function PS2NetConfig_Listbox_PopulateItem(Dest,Data)
	if(Data) then
		PS2NetConfig_Listbox_SetText(Dest.manufacturerentry,Data.ManufacturerStr)
		PS2NetConfig_Listbox_SetText(Dest.deviceentry,Data.DeviceStr)
		PS2NetConfig_Listbox_SetText(Dest.commententry,Data.CommentStr)
	end

	-- Show it if data is present, hide if no data
	IFObj_fnSetVis(Dest,Data)
end

ps2netconfig_listbox_layout = {
--	showcount = 10, -- auto-calc'd now
--	yTop = -130 + 13,  -- auto-calc'd now
	yHeight = 100,
	ySpacing  = 0,
--	width = 260,
	x = 0,
	slider = 1,
	CreateFn = PS2NetConfig_Listbox_CreateItem,
	PopulateFn = PS2NetConfig_Listbox_PopulateItem,
}

ps2netconfig_listbox_contents = {
	-- Filled in from C++ now. NM 4/28/04
--	{ ManufacturerStr = "Manufacturer 4", DeviceStr = "Device 2", CommentStr = "Comment 2", },
}

-- Helper function. Turns listbox on/off, as requested
function ifs_mpps2_netconfig_joinpopup_fnShowListbox(this,bVis)
	if(bVis) then
		AnimationMgr_AddAnimation(this.listbox,
															{ fTotalTime = 0.2, fStartAlpha = 0, fEndAlpha = 1, })
	else
		AnimationMgr_AddAnimation(this.listbox,
															{ fTotalTime = 0.2, fStartAlpha = 1, fEndAlpha = 0, })
	end
end

-- Callbacks from the busy popup
-- Returns -1, 0, or 1, depending on error, busy, or success
function ifs_mpps2_netconfig_joinpopup_fnCheckDone()
--	local this = ifs_mpps2_netconfig_joinpopup
	ScriptCB_UpdateJoin() -- think...

	return ScriptCB_IsJoinDone()
end

function ifs_mpps2_netconfig_joinpopup_fnOnSuccess()
	local this = ifs_mpps2_netconfig
	Popup_Busy:fnActivate(nil)
	ScriptCB_LaunchJoin()
	if(ScriptCB_AreMetagameRulesOn()) then
        ifs_movietrans_PushScreen(ifs_meta_top)
	else
        ifs_movietrans_PushScreen(ifs_mp_lobby)
	end
end

function ifs_mpps2_netconfig_joinpopup_fnOnFail()
	print("Join failed")

	local this = ifs_mpps2_netconfig
	ifs_mpps2_netconfig_joinpopup_fnShowListbox(this,1)

-- 	Popup_Busy:fnActivate(nil)
-- 	Popup_YesNo.CurButton = "no" -- default
-- 	Popup_YesNo.fnDone = ifs_xlive_main_fnAskCreateDone
-- 	IFText_fnSetString(Popup_YesNo.title,"ifs.quickopti.nonefound")
-- 	Popup_YesNo:fnActivate(1)
end

-- User hit cancel. Do what they want.
function ifs_mpps2_netconfig_joinpopup_fnOnCancel()
	local this = ifs_mpps2_netconfig

	-- Stop logging in.
	ScriptCB_CancelJoin()

	-- Get rid of popup, turn this screen back on
	Popup_Busy:fnActivate(nil)
	ifs_mpps2_netconfig_joinpopup_fnShowListbox(this,1)
end

ifs_mpps2_netconfig = NewIFShellScreen {
	nologo = 1,
	bg_texture = "iface_bgmeta_space",
    movieIntro      = nil,
    movieBackground = nil,
    music           = "STOP",
    exitSound       = "",
    
--	title = NewIFText {
--		string = "ifs.mp.netconfig.title",
--		font = "gamefont_large",
--		y = 10,
--		textw = 460, -- center on screen. Fixme: do real centering!
--		ScreenRelativeX = 0.5, -- center
--		ScreenRelativeY = 0, -- top
--		nocreatebackground = 1,
--	},

	buttons = NewIFContainer {
		ScreenRelativeX = 1.0, -- right
		ScreenRelativeY = 0, -- top
		y = 20, -- pixels down from the top
	},
	

	Helptext_AddEdit = NewIFContainer {
		ScreenRelativeX = 0.0, -- Left of center, but not in the normal 'back' position
		ScreenRelativeY = 1.0, -- bot
		y = -60,

		icon = NewIFImage { 
			ZPos = 200, -- behind most.
			texture = "btnmisc", 
			localpos_l = 0,
			localpos_t = -11,
			localpos_r = 20,
			localpos_b =  11,
			inert = 1, -- Delete this out of lua once created (we'll never touch it again)
		},

		helpstr = NewIFText {
			string = "ifs.mp.netconfig.addedit",
			font = "gamefont_medium",
			textw = 460,
			x = 25,
			y = -15,
			halign = "left",
			nocreatebackground = 1,
		},
	},	

	Enter = function(this, bFwd)
		print("ifs_mpps2_netconfig.Enter(",bFwd,")")
		-- Always call base class
		gIFShellScreenTemplate_fnEnter(this, bFwd)
		
		-- done the NTGUI skip, so clear the flag
		ScriptCB_ResetSkipToNTGUI()

        -- close streams
		ifelem_shellscreen_fnStopMovie()
        ScriptCB_CloseMovie()
        CloseAudioStream(gMusicStream)
        gMusicStream = 0
        
		-- Added chunk for error handling...
		if(not bFwd and not this.ConnectOnEnter and not this.FromLoadCancel) then
			local ErrorLevel,ErrorMessage = ScriptCB_GetError()
			print("Entering sessionlist, ErrorLevel = ",ErrorLevel)
			if(ErrorLevel >= 6) then -- session or login error, must keep going further
				ScriptCB_PopScreen()
			else
				ScriptCB_ClearError()
				
				-- never back into this screen
				ScriptCB_PopScreen()
			end
		end
		
		-- going forward?
		-- if we got here but don't need to be, jump ahead
		if(bFwd and not ScriptCB_NeedToSelectNetConfig()) then
			if (gOnlineServiceStr == "GameSpy") then
                --ifelm_shellscreen_fnPlaySound(this.acceptSound)
				ifs_movietrans_PushScreen(ifs_mpps2_dnas)
			else
                --ifelm_shellscreen_fnPlaySound(this.acceptSound)
				ifs_movietrans_PushScreen(ifs_mp_main)
			end
			return
		end

		ifs_mpps2_netconfig_joinpopup_fnShowListbox(this,1)

		-- Reset listbox, show it. [Remember, Lua starts at 1!]
		if(not this.ConnectOnEnter) then
			ps2netconfig_listbox_layout.FirstShownIdx = 1
			ps2netconfig_listbox_layout.SelectedIdx = 1
			ps2netconfig_listbox_layout.CursorIdx = 1
	--		ScriptCB_BeginSessionList()
		end
		ListManager_fnFillContents(this.listbox,ps2netconfig_listbox_contents,ps2netconfig_listbox_layout)

		-- did we just finish the preop
		if(this.ConnectOnEnter) then
			print("ifs_mpps2_netconfig.ConnectOnEnter")
			this.ConnectOnEnter = nil
			ifs_mpps2_netconfig_StartConnect()
			return
		end
		
        -- load the list of net configs
        -- do this last so everything formats ok
        if((bFwd or this.FromLoadCancel) and (not this.JustUpdated)) then
			print("(bFwd or this.FromLoadCancel) and (not this.JustUpdated)")
			this.FromLoadCancel = nil
			ifs_mpps2_netconfig_StartMemcardUpdate()
			return
        end        
        this.JustUpdated = nil

        print("done ifs_mpps2_netconfig.Enter()")
	
	end,

	Exit = function(this, bFwd)
		print("ifs_mpps2_netconfig.Exit(",bFwd,")")
		print("this.GoingToSaveop = ",this.GoingToSaveop)
		if (bFwd and (not this.GoingToSaveop)) then
			if(ScriptCB_SetNoticeNoCable) then
				ScriptCB_SetNoticeNoCable(1)
			end
		else
            ifelm_shellscreen_fnPlaySound("shell_menu_exit")
			if(ScriptCB_SetNoticeNoCable) then
				ScriptCB_SetNoticeNoCable(nil)
			end
			local ErrorLevel,ErrorMessage = ScriptCB_GetError()
			if (ErrorLevel == 6) then
				-- In-session error that requires leaving it. We know we're
				-- out of it now, can do things normally.
				ScriptCB_ClearError()
			end
            
            -- open streams 
            gMusicStream = OpenAudioStream("sound\\shell.lvl", "shell_music")
            ScriptCB_OpenMovie(gMovieStream, "")
		end
		this.GoingToSaveop = nil
	end,

	Input_Accept = function(this)
		-- Can join only when the list has data in it.
		if(getn(ps2netconfig_listbox_contents) > 0) then
			-- start a load preop, then do the connect
            ifelm_shellscreen_fnPlaySound(this.acceptSound)
			-- ifs_mpps2_netconfig_StartConnect()
			
			-- is our memory card mark still there?
			if(not ScriptCB_CheckMemoryCardMark()) then
				-- nope, so the user changed memory cards since we loaded the list.
				-- reload the list
				
				--ifs_mpps2_netconfig_StartMemcardUpdate()
				ifs_mpps2_netconfig_MarkChanged()
			else			
				-- memory card is still there, start the load
				ifs_mpps2_netconfig_StartLoadPreop()
			end
			return
        else
            ifelm_shellscreen_fnPlaySound(this.errorSound)
		end
	end,

	Input_Misc = function(this)
		-- add/edit button.  bail out of our elf and run ntgui
		ScriptCB_JumpToNTGUI()		
	end,

	Input_GeneralUp = function(this)
		ListManager_fnNavUp(this.listbox,ps2netconfig_listbox_contents,ps2netconfig_listbox_layout)
	end,

	Input_GeneralDown = function(this)
		ListManager_fnNavDown(this.listbox,ps2netconfig_listbox_contents,ps2netconfig_listbox_layout)
	end,

	Input_LTrigger = function(this)
		ListManager_fnPageUp(this.listbox,ps2netconfig_listbox_contents,ps2netconfig_listbox_layout)
	end,

	Input_RTrigger = function(this)
		ListManager_fnPageDown(this.listbox,ps2netconfig_listbox_contents,ps2netconfig_listbox_layout)
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
		--ScriptCB_UpdateNetConfigs()
	end,

	-- Callback from C to repaint the listbox. Done when the game notices
	-- the contents of that listbox have changed and it needs to trigger
	-- a repaint. The contents should be in the lua global
	-- ps2netconfig_listbox_contents
	RepaintListbox = function(this)
		ListManager_fnFillContents(this.listbox,ps2netconfig_listbox_contents,ps2netconfig_listbox_layout)
	end,
}


-- Do programatic work to set up this screen
function ifs_mpps2_netconfig_fnBuildScreen(this)
	local w,h = ScriptCB_GetSafeScreenInfo() -- of the usable screen

	local BoxW = w * 0.98

	local EntryHeight = ps2netconfig_listbox_layout.yHeight + ps2netconfig_listbox_layout.ySpacing

	ps2netconfig_listbox_layout.showcount = floor((h - 200) / EntryHeight)

	this.listbox = NewButtonWindow { ZPos = 200, x=0, y = 0,
		ScreenRelativeX = 0.5, -- center
		ScreenRelativeY = 0.40, -- middle of screen
		width = BoxW, 
		height = ps2netconfig_listbox_layout.showcount * EntryHeight + 30,
		titleText = "ifs.mp.netconfig.title"
	}
	ps2netconfig_listbox_layout.width = BoxW - 35	

	ListManager_fnInitList(this.listbox,ps2netconfig_listbox_layout)
end

ifs_mpps2_netconfig_fnBuildScreen(ifs_mpps2_netconfig)
ifs_mpps2_netconfig_fnBuildScreen = nil

AddIFScreen(ifs_mpps2_netconfig,"ifs_mpps2_netconfig")
