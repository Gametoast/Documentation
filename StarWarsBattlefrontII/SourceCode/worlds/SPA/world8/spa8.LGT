
Light("sun", 46456228)
{
	Rotation(-0.329871, 0.056084, -0.847853, 0.411321);
	Position(-1144.556885, 1118.124756, 85.428802);
	Type(1);
	Color(0.874510, 0.874510, 0.874510);
	CastShadow();
	Static();
	CastSpecular(1);
	PS2BlendMode(0);
	TileUV(1.000000,1.000000);
	OffsetUV(0.000000,0.000000);
}

Light("Back", 208219787)
{
	Rotation(0.661251, 0.525608, -0.092722, -0.527144);
	Position(278.364410, 807.518860, 545.296326);
	Type(1);
	Color(0.541176, 0.541176, 0.541176);
	Static();
	PS2BlendMode(0);
	TileUV(1.000000,1.000000);
	OffsetUV(0.000000,0.000000);
}

Light("imp_dirlight1", 2004376290)
{
	Rotation(0.682004, 0.731348, 0.000000, 0.000000);
	Position(-625.005737, 22.647369, -1380.508179);
	Type(1);
	Color(0.584314, 0.584314, 0.600000);
	CastShadow();
	Static();
	Region("imp_reg1");
	PS2BlendMode(0);
	TileUV(1.000000,1.000000);
	OffsetUV(0.000000,0.000000);
}

Light("all_dirlight1", 3772784891)
{
	Rotation(0.736010, 0.677033, 0.000000, 0.000000);
	Position(97.380600, -27.101757, 1215.053711);
	Type(1);
	Color(0.541176, 0.541176, 0.541176);
	CastShadow();
	Static();
	Region("all_reg1");
	PS2BlendMode(0);
	TileUV(1.000000,1.000000);
	OffsetUV(0.000000,0.000000);
}

GlobalLights()
{
	EditorGlobalDirIconSize(15);
	Light1("sun");
	Light2("back");
	Top(0, 0, 0);
	Bottom(85, 85, 95);
}
