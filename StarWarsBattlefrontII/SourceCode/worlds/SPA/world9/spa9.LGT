
Light("sun", 46456228)
{
	Rotation(-0.082415, -0.475761, -0.842723, 0.238068);
	Position(-1106.324707, 54.778625, 122.580566);
	Type(1);
	Color(0.894118, 0.894118, 0.909804);
	CastShadow();
	Static();
	CastSpecular(1);
	PS2BlendMode(0);
	TileUV(1.000000,1.000000);
	OffsetUV(0.000000,0.000000);
}

Light("Back", 211750191)
{
	Rotation(0.980030, 0.198850, 0.000000, 0.000000);
	Position(-1049.978882, -0.000031, 352.612213);
	Type(1);
	Color(0.760784, 0.733333, 0.486275);
	Static();
	PS2BlendMode(0);
	TileUV(1.000000,1.000000);
	OffsetUV(0.000000,0.000000);
}

Light("all_dirlight1", 3120033393)
{
	Rotation(0.703845, 0.710353, 0.000000, 0.000000);
	Position(-4.106231, 0.000000, 931.307800);
	Type(1);
	Color(0.458824, 0.458824, 0.458824);
	CastShadow();
	Static();
	Region("all_reg1");
	PS2BlendMode(0);
	TileUV(1.000000,1.000000);
	OffsetUV(0.000000,0.000000);
}

Light("imp_dirlight1", 3252804160)
{
	Rotation(0.757385, 0.652986, 0.000000, 0.000000);
	Position(8.088340, 0.000000, -1486.871826);
	Type(1);
	Color(0.537255, 0.537255, 0.588235);
	CastShadow();
	Static();
	Region("imp_reg1");
	PS2BlendMode(0);
	TileUV(1.000000,1.000000);
	OffsetUV(0.000000,0.000000);
}

GlobalLights()
{
	EditorGlobalDirIconSize(15);
	Light1("sun");
	Light2("back");
	Top(65, 61, 61);
	Bottom(60, 60, 81);
}
