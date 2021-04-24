ifs_mp_vbutton_layout = {
--	yTop = -50,
	xWidth = 400,
	width = 400,
	ySpacing  = 5,
	font = "gamefont_large",
	buttonlist = { 
		{ tag = "wan", string = "ifs.mp.connection.gamespy", }, -- or XBox XLive
		{ tag = "lan", string = "ifs.mp.connection.lan", }, -- or XBox Direct Connect
		{ tag = "direct", string = "ifs.mp.connection.direct", }, -- == XBox XLive
--		{ tag = "split", string = "ifs.mp.connection.split", },
	},
	title = "ifs.mp.connection.title",
	rotY = 45,
}

function ifs_mp_fnCheckCable(this)
	this.fCableCheckTimer = 0.75 -- reset timer

	-- only do the fading/greying for XBOX
	this.bCablePresent = ScriptCB_IsNetCableIn() or (ScriptCB_GetPlatform() ~= "XBox")

	if(this.bCablePresent) then
		-- it's present
		IFObj_fnSetAlpha(this.buttons.lan,1.0)
	else
		IFObj_fnSetAlpha(this.buttons.lan,0.4)
		-- Move off option if on it.
		if(this.CurButton == "lan") then
			this:Input_GeneralDown()
		end
	end
end

ifs_mp = NewIFShellScreen {
 	nologo = 1,
 	bg_texture = "iface_bgmeta_space",
    movieIntro      = nil,
    movieBackground = nil,
    -- music           = "STOP",
    -- exitSound       = "",
    
   	bPatchCheckStatus = 0,


	newVersion = NewIFText {
		font = "gamefont_small",
		textw = 500,
		texth = 100,
		ScreenRelativeX = 0.5,
		ScreenRelativeY = 0.8,
		flashy = 0,
	},

	IPAddr = NewIFText {
--		string = "ifs.mp.connection.title",
		font = "gamefont_small",
		textw = 460,
		halign = "left",
		ScreenRelativeX = 0.0, -- left
		ScreenRelativeY = 0.0,
		nocreatebackground = 1,
	},

	BuildStr = NewIFText {
--		string = ScriptCB_GetBuildStr(),
		font = "gamefont_small",
		textw = 460,
		x = -460,
		halign = "right",
		ScreenRelativeX = 1.0, -- right
		ScreenRelativeY = 0.0,
		nocreatebackground = 1,
	},

	buttons = NewIFContainer {
		ScreenRelativeX = 0.6, -- center
		ScreenRelativeY = 0.5, -- top
		y = 20, -- offset slightly down
	},

	fCableCheckTimer = 0.75,	
	Update = function(this, fDt)
		gIFShellScreenTemplate_fnUpdate(this, fDt) -- always call base class default behavior

		local patchCheckStatus = ScriptCB_CheckForPatch(2)
		if (patchCheckStatus ~= this.bPatchCheckStatus) then
			-- show the status change
			print("new patch status ", patchCheckStatus)
			this.bPatchCheckStatus = patchCheckStatus
			if(this.bPatchCheckStatus == 2) then
				IFText_fnSetString(this.newVersion,"ifs.mp.newversion")
			end
		end

		this.fCableCheckTimer = this.fCableCheckTimer - fDt
		if(this.fCableCheckTimer < 0) then
			ifs_mp_fnCheckCable(this)
		end		
	end,

	Enter = function(this,bFwd)
		gIFShellScreenTemplate_fnEnter(this, bFwd)
		
		-- done the NTGUI skip, so clear the flag
		ScriptCB_ResetSkipToNTGUI()

		ScriptCB_SetNoticeNoCable(nil)
		-- Backing into this screen? Always clear error 
		if(not bFwd) then
			ScriptCB_ClearError()
		end

		-- Set "wan" string to XLive if required
		if(ScriptCB_GetOnlineService() == "XLive") then
			RoundIFButtonLabel_fnSetString(this.buttons.wan, "ifs.mp.connection.xlive")
		end

		ifelem_shellscreen_fnStopMovie()
		
		-- no ps2 for you
		IFText_fnSetString(this.IPAddr,"IP: " .. ScriptCB_GetIPAddr())
		IFText_fnSetString(this.BuildStr,ScriptCB_GetBuildStr())
		
		ifs_mp_fnCheckCable(this)						
		if (bFwd) then
			if (ScriptCB_IsCmdlineJoinPending()) then
				gOnlineServiceStr = ScriptCB_GetOnlineService()
				ScriptCB_SetConnectType("wan")
				ifs_movietrans_PushScreen(ifs_mpgs_login)
			elseif (ScriptCB_IsSpecialJoinPending()) then
				if(gOnlineServiceStr == "XLive") then
					ifs_movietrans_PushScreen(ifs_mpxl_login)
				else
					if(ScriptCB_GetConnectType() == "LAN") then
						gOnlineServiceStr = "LAN" -- like we'd pressed that.
						ScriptCB_StartLogin()
					end
					ifs_movietrans_PushScreen(ifs_mp_main)
					-- Whine like crazy
					ScriptCB_SetNoticeNoCable(1)
				end
			elseif (ScriptCB_InMultiplayer()) then
				if(ScriptCB_GetConnectType() == "LAN") then
					gOnlineServiceStr = "LAN" -- like we'd pressed that.
				elseif (ScriptCB_GetConnectType() == "Direct") then
					gOnlineServiceStr =  "Direct"
				else
					gOnlineServiceStr = ScriptCB_GetOnlineService()
				end
				
				-- ScriptCB_SetConnectType(ScriptCB_GetConnectType())
				if(gOnlineServiceStr == "XLive") then
					ifs_movietrans_PushScreen(ifs_mpxl_login)
				else
					-- Whine like crazy
					ScriptCB_SetNoticeNoCable(1)
			--		ScriptCB_StartLogin()
					ifs_movietrans_PushScreen(ifs_mp_main)
				end
			end
		end

		ShowHideVerticalButtons(this.buttons,ifs_mp_vbutton_layout)
		
		ScriptCB_CheckForPatch(1)
		this.bPatchCheckStatus = 0
	end,
	
	Exit = function(this, bFwd)
		ScriptCB_CheckForPatch(3)
		IFText_fnSetString(this.newVersion,"")
		
		if (bFwd) then 
--			ScriptCB_SetNoticeNoCable(1)
		else
-- 			if(not (ScriptCB_GetPlatform() == "PS2")) then
-- 				ScriptCB_SetNoticeNoCable(1)
-- 			end
		end

		if(gCurHiliteButton) then
			IFButton_fnSelect(gCurHiliteButton,nil)
		end		
	end,

	Input_Accept = function(this) 
		-- If base class handled this work, then we're done
		if(gShellScreen_fnDefaultInputAccept(this)) then
			return
		end

		if(this.CurButton == "lan") then
			ScriptCB_SetConnectType(this.CurButton)
			ifelm_shellscreen_fnPlaySound(this.acceptSound)
			-- Hack? Set current service appropriately
			gOnlineServiceStr = "LAN"
			if(ScriptCB_GetPlatform() == "PS2") then
				ifs_movietrans_PushScreen(ifs_mpps2_netconfig)
			else
				-- Whine like crazy
				ScriptCB_SetNoticeNoCable(1)
-- we don't need to login for LAN right?
--				ScriptCB_StartLogin()
				ifs_movietrans_PushScreen(ifs_mp_main)				
			end
		elseif (this.CurButton == "direct") then
			ScriptCB_SetConnectType(this.CurButton)
			ifelm_shellscreen_fnPlaySound(this.acceptSound)
			-- Hack? Set current service appropriately
			gOnlineServiceStr = "Direct"
			if(ScriptCB_GetPlatform() == "PS2") then
				ifs_movietrans_PushScreen(ifs_mpps2_netconfig)
			else
				ifs_movietrans_PushScreen(ifs_mp_main)
			end
		elseif (this.CurButton == "wan") then
			ScriptCB_SetConnectType(this.CurButton)
			ifelm_shellscreen_fnPlaySound(this.acceptSound)
			-- Reacquire default from exe
			gOnlineServiceStr = ScriptCB_GetOnlineService()
			if(gOnlineServiceStr == "XLive") then
				ifs_movietrans_PushScreen(ifs_mpxl_login)
			elseif (gOnlineServiceStr == "GameSpy") then
				if(ScriptCB_GetPlatform()=="PS2") then
--					ifs_movietrans_PushScreen(ifs_mpps2_dnas)
					ifs_movietrans_PushScreen(ifs_mpps2_netconfig)
				else
					ifs_movietrans_PushScreen(ifs_mpgs_login)
				end
			else
				if(ScriptCB_GetPlatform() == "PS2") then
					ifs_movietrans_PushScreen(ifs_mpps2_netconfig)
				else
					ifs_movietrans_PushScreen(ifs_mp_main)
				end
			end
		end
	end,

	-- Gotta skip over lan options if we have no network cable
	Input_GeneralUp = function(this)
		-- If base class handled this work, then we're done
		if(gShellScreen_fnDefaultInputUp(this)) then
			return
		end
		gDefault_Input_GeneralUp(this)
		if((this.CurButton == "lan") and (not this.bCablePresent)) then
			gDefault_Input_GeneralUp(this) -- move cursor off item
		end
	end,

	Input_GeneralDown = function(this)
		-- If base class handled this work, then we're done
		if(gShellScreen_fnDefaultInputDown(this)) then
			return
		end
		gDefault_Input_GeneralDown(this)
		if((this.CurButton == "lan") and (not this.bCablePresent)) then
			gDefault_Input_GeneralDown(this) -- move cursor off item
		end
	end,
}


-- Does any programatic work to build this screen
function ifs_mp_fnBuildScreen(this)

	this.CurButton = AddVerticalButtons(this.buttons,ifs_mp_vbutton_layout)
end

ifs_mp_fnBuildScreen(ifs_mp)
ifs_mp_fnBuildScreen = nil

AddIFScreen(ifs_mp,"ifs_mp")
