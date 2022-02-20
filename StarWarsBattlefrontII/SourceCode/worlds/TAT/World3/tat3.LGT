
Light("sun", 46456228)
{
	Rotation(-0.327698, 0.327700, -0.626608, 0.626578);
	Position(-202.951584, 108.763077, -0.698416);
	Type(1);
	Color(0.519020, 0.519020, 0.597451);
	CastShadow();
	Static();
	CastSpecular(1);
	PS2BlendMode(0);
	TileUV(1.000000,1.000000);
	OffsetUV(0.000000,0.000000);
}

Light("bounce", 132763166)
{
	Rotation(0.668097, -0.179209, -0.701725, -0.170621);
	Position(126.772545, 0.000031, -108.321068);
	Type(1);
	Color(0.233333, 0.233333, 0.272549);
	Static();
	PS2BlendMode(0);
	TileUV(1.000000,1.000000);
	OffsetUV(0.000000,0.000000);
}

GlobalLights()
{
	EditorGlobalDirIconSize(20);
	Light1("Sun");
	Light2("bounce");
	Top(80, 80, 80);
	Bottom(90, 90, 90);
}
