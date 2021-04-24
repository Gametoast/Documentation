
-- Screens to show, with time per screen
gPostdemoScreenList = {
	{ texture = "postdemo_bg", time = 20, },
}


ifs_postdemo = NewIFShellScreen {
	-- # of seconds before we go into demomode. XBox TCR C1-6 says
	-- this must be no larger than 120 seconds
	Timer = 0, -- how long the current page has before it's advanced
	OnPage = 0, -- start before first page
	nologo = 1,
	bNohelptext = 1,
    movieIntro      = nil,
    movieBackground = nil,

	ShowTexture = NewIFImage { 
		ScreenRelativeX = 0,
		ScreenRelativeY = 0,
		UseSafezone = 0,

		texture = "opaque_black", 
		localpos_l = 0,
		localpos_t = 0,
		-- Size, UVs aren't fully specified here, but in NewIFShellScreen()
	},

	ShowTexture2 = NewIFImage { 
		ScreenRelativeX = 0,
		ScreenRelativeY = 0,
		UseSafezone = 0,

		texture = "opaque_black", 
		localpos_l = 0,
		localpos_t = 0,
		-- Size, UVs aren't fully specified here, but in NewIFShellScreen()
	},

	Enter = function(this, bFwd)
		gIFShellScreenTemplate_fnEnter(this, bFwd)
		ifelem_shellscreen_fnStopMovie() -- Ensure it's off
	end,

	Update = function(this, fDt)
		-- Call base class functionality
		gIFShellScreenTemplate_fnUpdate(this, fDt)

		this.Timer = this.Timer - fDt
		if(this.Timer < 0) then
			this.OnPage = this.OnPage + 1

			-- Advance to next screen
			if(this.OnPage > getn(gPostdemoScreenList)) then
				ScriptCB_QuitToWindows()
			else
				if(this.OnPage > 1) then
					IFImage_fnSetTexture(this.ShowTexture, gPostdemoScreenList[this.OnPage - 1].texture)
				end

				IFImage_fnSetTexture(this.ShowTexture2, gPostdemoScreenList[this.OnPage].texture)
				AnimationMgr_AddAnimation(this.ShowTexture , { fTotalTime = 0.25, fStartAlpha = 1, fEndAlpha = 0,})
				AnimationMgr_AddAnimation(this.ShowTexture2, { fTotalTime = 0.4, fStartAlpha = 0, fEndAlpha = 1,})

				this.Timer = gPostdemoScreenList[this.OnPage].time
			end
		end
	end,

	-- Start actually works on this screen
	Input_Start = function(this)
	end,

	-- Overrides for most input handlers, as we want to do nothing
	-- when this happens on this screen.
	Input_Accept = function(this) 
	end,
	Input_Back = function(this)
  end,
	Input_GeneralLeft = function(this)
	end,
	Input_GeneralRight = function(this)
	end,
	Input_GeneralUp = function(this)
	end,
	Input_GeneralDown = function(this)
	end,
}

function ifs_postdemo_fnBuildScreen(this)
	-- Ask game for screen size, fill in values
	local r
	local b
	local v
	r,b,v=ScriptCB_GetScreenInfo()
	this.ShowTexture.localpos_r = r
	this.ShowTexture.localpos_b = b
	this.ShowTexture.uvs_b = v
	this.ShowTexture2.localpos_r = r
	this.ShowTexture2.localpos_b = b
	this.ShowTexture2.uvs_b = v
end

ifs_postdemo_fnBuildScreen(ifs_postdemo) -- programatic chunks
ifs_postdemo_fnBuildScreen = nil
AddIFScreen(ifs_postdemo,"ifs_postdemo")
