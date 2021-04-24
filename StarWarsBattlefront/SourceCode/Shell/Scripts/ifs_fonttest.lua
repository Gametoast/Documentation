
ifs_fonttest = NewIFShellScreen {
--	bg_texture = HackBGTextureOnPCOnly("atat_screen"),

	TestTiny = NewIFText { 
		ScreenRelativeX = 0,
		ScreenRelativeY = 0,
		x = 10, y = 0, halign = "left", valign = top,
		font = "gamefont_tiny", 
		string = "common.ok",
		texth = 130, textw = 700, 
		nocreatebackground = 1, startdelay=random()*0.5, 
	},

	TestSmall = NewIFText { 
		ScreenRelativeX = 0,
		ScreenRelativeY = 0,
		x = 10, y = 80, halign = "left", valign = top,
		font = "gamefont_small",
		string = "common.ok",
		texth = 130, textw = 700, 
		nocreatebackground = 1, startdelay=random()*0.5, 
	},

	TestMedium = NewIFText { 
		ScreenRelativeX = 0,
		ScreenRelativeY = 0,
		x = 10, y = 80+100, halign = "left", valign = top,
		font = "gamefont_medium",
		string = "common.ok",
		texth = 130, textw = 700, 
		nocreatebackground = 1, startdelay=random()*0.5, 
	},

	TestLarge = NewIFText { 
		ScreenRelativeX = 0,
		ScreenRelativeY = 0,
		x = 10, y = 80+100+130, halign = "left", valign = top,
		font = "gamefont_large",
		string = "common.ok",
		texth = 130, textw = 700, 
		nocreatebackground = 1, startdelay=random()*0.5, 
	},
}


AddIFScreen(ifs_fonttest,"ifs_fonttest")
