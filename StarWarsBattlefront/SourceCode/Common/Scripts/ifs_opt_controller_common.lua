
-- Only this file should need to change for the various platforms

-- *****************
--       DATA
-- *****************

Platform_btn_map = {
	--  BUTTONNAME  FUNCTIONTYPE    COORDS         	HILIGHTTEXTURE        HALFDIMENSIONS    LEFT  	RIGHT  UP    	DOWN    FUNCTION_ID LINE
-- white button CROUCH/PRONE 1
	 { name="ltrig2",  type=1,   x=63.5, 	y=7,   	hiTex="btn_circle",     w=16, h=16,	conL=10,	conR=0,	conU=16,conD=10,     func=2,  	lx1=135, 	ly1=60, 	lx2= 72,  	ly2=20, }, -- 1
-- left trigger SECONDARY 2
	 { name="ltrig1",  type=1,   x=-85,   	y=-105,	hiTex="btn_R1",         w=32, h=32,	conL=0,	conR=15,conU=11,conD=7,     func=2,  	lx1=-120, 	ly1=-110,  	lx2=-75,  	ly2=-90, }, -- 2

-- d pad SQUAD COMMANDS 3-6
	 { name="dpadu",   type=1,   x=-43, 	y=-17,	hiTex="",        w=16, h=16,	conL=0,	conR=10,conU=4,	conD=5,     func=2,  	lx1= -135, 	ly1= 65, 	lx2= -34,  	ly2= -12, }, -- 3
	 { name="dpadl",   type=1,   x=-58,   	y=-3,	hiTex="",        w=14, h=14,	conL=0,	conR=1,	conU=9,	conD=3,     func=2,  	lx1= -135, 	ly1= 45, 	lx2= -37,  	ly2= 3, }, -- 4
	 { name="dpadd",   type=1,   x=-43, 	y=10,	hiTex="",        w=16, h=16,	conL=0,	conR=10,conU=3,	conD=6,     func=2,  	lx1= -135, 	ly1= 85, 	lx2= -16,  	ly2= 25, }, -- 5
	 { name="dpadr",   type=1,   x=-28,   	y=-3,	hiTex="",        w=14, h=14,	conL=0,	conR=19,conU=5,	conD=17,    func=2,  	lx1= -135, 	ly1= 105, 	lx2= -3,  	ly2= 3, }, -- 6

-- left stick MOVEMENT 7
	 { name="lang",    type=3,   x=-89,   	y=-53.5, hiTex="btn_stick",      w=38, h=38,	conL=0,	conR=14,conU=2,	conD=18,    func=2,  	lx1=-135, 	ly1= -75, 	lx2= -70, 	ly2= -40, }, -- 7
-- select MAP 8
	 { name="bsel",    type=1,   x=-99,  	y=-15,	hiTex="btn_circle",   	w=11, h=11,	conL=0,	conR=12,conU=7,conD=9,     func=2,  	lx1= -140, 	ly1= -10, 	lx2= -100, 	ly2= -10, }, -- 8
-- start PAUSE/MENU 9
	 { name="bstr",    type=1,   x=-85,   	y=0,	hiTex="btn_circle",    	w=11, h=11,	conL=0,	conR=1,	conU=8,	conD=19,     func=2,  	lx1= -130, 	ly1= 17, 	lx2= -80, 	ly2= 17, }, -- 9
-- right stick LOOK/AIM 10
	 { name="rang",    type=3,   x= 15,   	y=-14,	hiTex="btn_stick",      w=38, h=38,	conL=7,	conR=1,	conU=18,conD=19,    func=2,  	lx1= -135, 	ly1= 80, 	lx2= 34,  	ly2= 25, }, -- 10
-- X button RELOAD 11
	 { name="bsqr",    type=1,   x= 44, 	y=-44,	hiTex="btn_circle",     w=16, h=16,	conL=2,	conR=0,	conU=15,conD=15,    func=2,  	lx1= 100, 	ly1=-141,  	lx2= 50,  	ly2=-45, }, -- 11
-- A button JUMP 12
	 { name="bcrs",    type=1,   x= 62,   	y=-24,	hiTex="btn_circle",     w=16, h=16,	conL=18,	conR=0,	conU=13,conD=16,    func=2,  	lx1= 125, 	ly1= -10,  	lx2= 70,  	ly2= -18, }, -- 12
-- B button MODE CHANGE 13
	 { name="bcir",    type=1,   x= 79,   	y=-43,	hiTex="btn_circle",     w=16, h=16,	conL=18,	conR=0,	conU=14,conD=12,    func=2,  	lx1= 135, 	ly1= -44,  	lx2= 90, 	ly2= -36, }, -- 13
-- Y button ACTION 14
	 { name="btri",    type=1,   x= 62,	y=-64,	hiTex="btn_circle",     w=16, h=16,	conL=7,	conR=0,	conU=15,conD=13,    func=2,  	lx1= 120, 	ly1=-78,  	lx2= 70,  	ly2=-55, }, -- 14
-- right trigger PRIMARY 15
	 { name="rtrig1",  type=1,   x= 55,	y=-105,	hiTex="btn_R1",         w=32, h=32,	conL=2,	conR=0,	conU=11,conD=14,    func=2,  	lx1= 120, 	ly1=-110,  	lx2= 75,  	ly2=-90, }, -- 15
-- black button JUMP 16
	 { name="rtrig2",  type=1,   x= 83,	y=-10,	hiTex="btn_circle",     w=16, h=16,	conL=10,	conR=0,	conU=12,conD=1,    func=2,  	lx1=130, 	ly1=25, 	lx2=92,  	ly2=5, }, -- 16
-- config FLIP Y AXIS 17
	 { name="yflip",   type=5,   x= 0,	y=435,	hiTex="btn_R2",         w=20, h=20,	conL=0,	conR=0,	conU=19,conD=20,    func=2,  	lx1=0, 		ly1=135, 	lx2=0, 		ly2=135, }, -- 17
-- left stick depress NOTHING 18
	 { name="l3",      type=1,   x=-84,	y=-51,	hiTex="btn_l3r3",     	w=28, h=28,	conL=0,	conR=13,conU=7,	conD=10,     func=2,  	lx1=-135, 	ly1= -40, 	lx2= -70, 	ly2= -40, }, -- 18
-- right stick depress ZOOM 19
	 { name="r3",      type=1,   x= 19,	y=-12,	hiTex="btn_l3r3",      	w=28, h=28,	conL=7,	conR=1,	conU=10,conD=17,   func=2,  	lx1= -135, 	ly1= 113, 	lx2= 34,  	ly2= 25, }, -- 19
-- config LOOK SENSITIVITY 20
	 { name="lookslide",   type=5,   x= 0,	y=170,	hiTex="btn_R2",           	w=0, h=0,	conL=0,	conR=0,	conU=17,conD=21,   func=2,  	lx1=0, 		ly1=167, 	lx2=0, 		ly2=167, }, -- 20
-- config RESET DEFAULT 21
	 { name="reset",   type=5,   x= 0,	y=205, 	hiTex="btn_R2",           	w=0, h=0,	conL=0,	conR=0,	conU=20,conD=0,    func=2,  	lx1=0, 		ly1=202, 	lx2=0, 		ly2=202, }, -- 21
}
