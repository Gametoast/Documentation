function ifs_mp_lobbyds_fnMoveString(this)
	local w,h = ScriptCB_GetSafeScreenInfo()

	local newx = random(100) - 50 -- roughly center this
	local newy = random(h * 0.7) + (h * 0.15)

	IFObj_fnSetPos(this.title,this.title.textw * -0.5 + newx,newy)
	this.timer = 4.0
end


ifs_mp_lobbyds = NewIFShellScreen {
	title = NewIFText {
		string = "ifs.mp_lobbyds.title",
		font = "gamefont_large",
		textw = 460,
		texth = 80,
		y = 0,
		ScreenRelativeX = 0.5, -- 
		ScreenRelativeY = 0, -- top
	},

	timer = 3.0,
	launchflag = nil,
    movieIntro      = nil,
    movieBackground = nil,

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

		ScriptCB_BeginLobby()
		ifs_mp_lobbyds_fnMoveString(this)
		-- Call default Enter function (don't, as we don't have buttons)
--		gIFShellScreenTemplate_fnEnter(this, bFwd)
	end,

	Exit = function(this, bFwd)
		if(bFwd) then -- going to sub-screen
		else
			ScriptCB_CancelLobby() -- going back to create opts (host) or sessionlist (client)
		end
	end,
	
	Update = function(this, fDt)
		-- Call default base class's update function (make button bounce)
		gIFShellScreenTemplate_fnUpdate(this,fDt)
		
		this.timer = this.timer - fDt
		if(this.timer < 0) then
			ifs_mp_lobbyds_fnMoveString(this)
		end
		ScriptCB_UpdateLobby()

		if(this.bAutoLaunch) then
--			print("Autolaunching...")
			ScriptCB_LaunchLobby()
		end
	end,

	Input_GeneralLeft = function(this)
	end,
	Input_GeneralRight = function(this)
	end,
	Input_GeneralUp = function(this)
	end,
	Input_GeneralDown = function(this)
	end,

	RepaintListbox = function(this)
--		ListManager_fnFillContents(this.listbox,mp_lobby_listbox_contents,mplobby_listbox_layout)
	end,
}

AddIFScreen(ifs_mp_lobbyds,"ifs_mp_lobbyds")