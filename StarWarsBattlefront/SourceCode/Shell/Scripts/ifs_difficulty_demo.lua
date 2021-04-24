
ifs_difficulty_demo = NewIFShellScreen {
	nologo = 1,
--	bg_texture = "iface_bgmeta_space",

	bg2 = NewIFImage { 
		ScreenRelativeX = 0,
		ScreenRelativeY = 0,
		UseSafezone = 0,
		ZPos = 255, -- behind all.

		texture = "iface_bgmeta_space", 
		localpos_l = 0,
		localpos_t = 0,
		-- Size, UVs aren't fully specified here, but in NewIFShellScreen()
		inert = 1, -- Delete this out of lua once created (we'll never touch it again)
	},

	title = NewIFText {
		string = "ifs.difficulty.title",
		font = "gamefont_large",
		textw = 460,
		y = 0,
		valign = "top",
		ScreenRelativeX = 0.5, -- center
		ScreenRelativeY = 0, -- top
		inert = 1,
	},

	buttons = NewIFContainer {
		ScreenRelativeX = 0.5, -- center
		ScreenRelativeY = 0.5, -- top
		y = 20, -- go slightly down from center
	},

	Enter = function(this, bFwd)
		gIFShellScreenTemplate_fnEnter(this, bFwd) -- call default enter function

		IFButton_fnSelect(gCurHiliteButton,nil)
		this.CurButton = format("%d",ScriptCB_GetDifficulty())
		gCurHiliteButton = this.buttons[this.CurButton]
		IFButton_fnSelect(gCurHiliteButton,1)

		IFObj_fnSetVis(this.bg2,not gCurMovie)
	end,

	Input_Accept = function(this)
		ScriptCB_SetDifficulty(this.CurButton)
		this.fnDone()
	end,
}

ifs_difficulty_demo_vbutton_layout = {
	xWidth = 400,
	width = 400,
	xSpacing = 10,
	yHeight = 50,
	ySpacing = 0,
	font = "gamefont_large",
	buttonlist = { 
		{ tag = "1", string = "ifs.difficulty.easy", },
		{ tag = "2", string = "ifs.difficulty.medium", },
		{ tag = "3", string = "ifs.difficulty.hard", },
	},
}

function ifs_difficulty_demo_fnBuildScreen(this)
	this.CurButton = AddVerticalButtons(this.buttons,ifs_difficulty_demo_vbutton_layout)
	local r
	local b
	local v
	r,b,v=ScriptCB_GetScreenInfo()
	this.bg2.localpos_r = r
	this.bg2.localpos_b = b
	this.bg2.uvs_b = v
end

ifs_difficulty_demo_fnBuildScreen(ifs_difficulty_demo)
ifs_difficulty_demo_fnBuildScreen = nil

AddIFScreen(ifs_difficulty_demo,"ifs_difficulty_demo")