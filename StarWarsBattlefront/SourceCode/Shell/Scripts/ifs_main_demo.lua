
-- Callback for the "not enough profiles" (QA bug 793) error
function ifs_main_demo_CantEnterSplitOk()
	local this = ifs_main_demo
	IFObj_fnSetVis(this.buttons,1)
end

function ifs_main_demo_fnMissionsDone()
	local defaultLevel = "end1a"
	ScriptCB_SetMissionNames(defaultLevel,false)
	ifs_missionselect.SelectedMap = "end1a"
	ScriptCB_PushScreen("ifs_instant_side") 
--	ScriptCB_EnterMission()
end

-- Gotta have a function, or it'll double-back out of missionselect -
-- NM 5/5/04
function ifs_main_demo_fnMissionsCancel() 
end

ifsmain_demo_vbutton_layout = {
--	yTop = -70, -- auto-calc'd now
	xWidth = 400,
	width = 400,
	xSpacing = 6,
	yHeight = 45,
	ySpacing = 0,
	font = "gamefont_large",
	buttonlist = { 
		{ tag = "sp", string = "ifs.main.sp", },
		{ tag = "mp", string = "ifs.main.mp", },
		{ tag = "split", string = "ifs.main.split", },
		{ tag = "opts", string = "ifs.main.options", },
		{ tag = "rules", string = "ifs.main.rules", },
		{ tag = "quit", string = "common.quit2windows", },
	},
}

function ifs_main_demo_OnLoginDone()
	local this = ifs_main_demo
	
	-- where did we want to go?
	ScriptCB_PushScreen(this.nextScreen)
end

function ifs_main_demo_GotoLoginScreen(this,afterScreen)
	-- this is where we go when we're done with the login screen
	this.nextScreen = afterScreen
	-- this is what gets called by the login screen to say its done
	ifs_login.fnDone = ifs_main_demo_OnLoginDone
	-- go there

	--e3 hackery 
	if(gPlatformStr == "PC") then --skip login screen on PC
		ifs_main_demo_OnLoginDone()
	else
		ScriptCB_PushScreen("ifs_login")
	end
end

ifs_main_demo = NewIFShellScreen {
	buttons = NewIFContainer {
		ScreenRelativeX = 0.5, -- center
		ScreenRelativeY = 0.5, -- top
		y = 40, -- offset slightly down
	},

-- 	title2 = NewIFText {
-- 		string = "[Back] -> normal main menu (for now)",
-- 		font = "gamefont_medium",
-- 		textw = 460,
-- 		y = -70,
-- 		ScreenRelativeX = 0.5, -- center
-- 		ScreenRelativeY = 1.0, -- top
-- 	},

	Enter = function(this, bFwd)
		gIFShellScreenTemplate_fnEnter(this, bFwd) -- call default enter function
		this.bAcceptPressed = nil

		if(bFwd) then
			ifelem_shellscreen_fnStartMovie("shell", 1)
		end
		
		if(bFwd and ScriptCB_InNetGame()) then
			--ScriptCB_SndBusFade("music", 0.5, 0.0) -- fade out music
			-- Note: ps2 could go to ifs_mpps2_netconfig here, but I'd
			-- rather assume they want to use the previous netconfig. If they
			-- back all the way out to here, they can select another manually.
			-- Hopefully that'll let us get thru Sony
			ifs_main_demo_GotoLoginScreen(this,"ifs_mp_main_demo")
		elseif(bFwd and ScriptCB_IsMetagameStateSaved()) then
			ifs_main_demo_GotoLoginScreen(this,"ifs_sp")
		elseif (bFwd and ScriptCB_IsSPStateSaved()) then
			ifs_main_demo_GotoLoginScreen(this,"ifs_sp")
		end
		
		this.buttons.mp.hidden = 1
		this.buttons.split.hidden = (gPlatformStr == "PC")
		this.buttons.quit.hidden = (gPlatformStr == "XBox")
		ShowHideVerticalButtons(this.buttons,ifsmain_demo_vbutton_layout)
	end,

	Exit = function(this, bFwd)
		this.bAcceptPressed = nil
--		ifelem_shellscreen_fnStopMovie()
	end,

	Input_Accept = function(this) 
		if(this.CurButton == "sp") then
			ifs_sp.bForSplitScreen = nil
			ifs_difficulty_demo.fnDone = ifs_main_demo_fnMissionsDone
			ifs_main_demo_GotoLoginScreen(this,"ifs_difficulty_demo")
			
		elseif (this.CurButton == "mp") then
			ifs_sp.bForSplitScreen = nil
			--ScriptCB_SndBusFade("music", 0.5, 0.0) -- fade out music
			if(gPlatformStr == "PS2") then
				ifs_main_demo_GotoLoginScreen(this,"ifs_mpps2_netconfig")
			else
				ifs_main_demo_GotoLoginScreen(this,"ifs_mp")
			end
		elseif (this.CurButton == "split") then
			ifs_sp.bForSplitScreen = 1
			ScriptCB_PushScreen("ifs_split_profile")
		elseif (this.CurButton == "opts") then
			ifs_main_demo_GotoLoginScreen(this,"ifs_opt_contmain")
		elseif (this.CurButton == "rules") then
			ScriptCB_PushScreen("ifs_rules")
		elseif (this.CurButton == "quit") then
			if(gPlatformStr == "PC") then
				ScriptCB_QuitToWindows()
			else
				ScriptCB_PushScreen("ifs_postdemo")
			end
		end
	end,
}


ifs_main_demo.CurButton = AddVerticalButtons(ifs_main_demo.buttons,ifsmain_demo_vbutton_layout)
AddIFScreen(ifs_main_demo,"ifs_main_demo")