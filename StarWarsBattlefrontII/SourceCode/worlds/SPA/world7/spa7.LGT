
Light("sun", 46456228)
{
	Rotation(0.852115, 0.412787, -0.274115, -0.168414);
	Position(-17.993217, 1118.124756, -107.688354);
	Type(1);
	Color(0.913726, 0.913726, 0.894118);
	CastShadow();
	Static();
	CastSpecular(1);
	PS2BlendMode(0);
	TileUV(1.000000,1.000000);
	OffsetUV(0.000000,0.000000);
}

Light("cis_dirlight2", 698457436)
{
	Rotation(0.703857, 0.710341, 0.000000, 0.000000);
	Position(-370.753143, 659.269836, 908.129089);
	Type(1);
	Color(0.458824, 0.458824, 0.458824);
	CastShadow();
	Static();
	Region("cis_reg2");
	PS2BlendMode(0);
	TileUV(1.000000,1.000000);
	OffsetUV(0.000000,0.000000);
}

Light("rep_dirlight1", 1460895573)
{
	Rotation(0.738370, 0.674396, 0.000000, 0.000000);
	Position(-741.258972, 667.336792, -1861.760010);
	Type(1);
	Color(0.462745, 0.450980, 0.450980);
	CastShadow();
	Static();
	Region("rep_reg1");
	PS2BlendMode(0);
	TileUV(1.000000,1.000000);
	OffsetUV(0.000000,0.000000);
}

Light("cis_dirlight1", 1623861919)
{
	Rotation(0.745058, 0.667000, 0.000000, 0.000000);
	Position(-245.935883, 651.209167, 1004.576233);
	Type(1);
	Color(0.458824, 0.458824, 0.478431);
	CastShadow();
	Static();
	Region("cis_reg1");
	PS2BlendMode(0);
	TileUV(1.000000,1.000000);
	OffsetUV(0.000000,0.000000);
}

Light("Back", 1944427468)
{
	Rotation(0.725289, 0.219830, 0.647753, 0.078158);
	Position(-88.467918, 582.826477, 542.817444);
	Type(1);
	Color(0.729412, 0.729412, 0.713726);
	Static();
	PS2BlendMode(0);
	TileUV(1.000000,1.000000);
	OffsetUV(0.000000,0.000000);
}

GlobalLights()
{
	EditorGlobalDirIconSize(15);
	Light1("sun");
	Light2("back");
	Top(60, 60, 60);
	Bottom(92, 92, 70);
}
