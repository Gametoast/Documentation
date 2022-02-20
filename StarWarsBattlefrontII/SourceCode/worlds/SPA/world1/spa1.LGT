
Light("sun", 46456228)
{
	Rotation(0.366618, -0.206797, -0.804925, 0.418237);
	Position(-41.448708, 239.182831, 737.676392);
	Type(1);
	Color(0.921569, 0.960784, 0.921569);
	CastShadow();
	Static();
	CastSpecular(1);
	PS2BlendMode(0);
	TileUV(1.000000,1.000000);
	OffsetUV(0.000000,0.000000);
}

Light("Back", 1982329593)
{
	Rotation(0.764910, 0.440615, 0.378702, 0.278131);
	Position(-282.308990, 350.845032, 455.838043);
	Type(1);
	Color(0.549020, 0.549020, 0.615686);
	Static();
	PS2BlendMode(0);
	TileUV(1.000000,1.000000);
	OffsetUV(0.000000,0.000000);
}

Light("imp_dirlight1", 2178551547)
{
	Rotation(0.710893, 0.703300, 0.000000, 0.000000);
	Position(740.202759, 235.179779, 94.401894);
	Type(1);
	Color(0.556863, 0.560784, 0.560784);
	CastShadow();
	Static();
	Region("imp_reglight1");
	PS2BlendMode(0);
	TileUV(1.000000,1.000000);
	OffsetUV(0.000000,0.000000);
}

Light("all_dirlight1", 3994780019)
{
	Rotation(0.736736, 0.676193, 0.000000, 0.000000);
	Position(-1968.503296, -112.736145, 230.055817);
	Type(1);
	Color(0.517647, 0.517647, 0.517647);
	CastShadow();
	Static();
	Region("all_reglight1");
	PS2BlendMode(0);
	TileUV(1.000000,1.000000);
	OffsetUV(0.000000,0.000000);
}

GlobalLights()
{
	EditorGlobalDirIconSize(10);
	Light1("Sun");
	Light2("Back");
	Top(60, 60, 60);
	Bottom(98, 130, 98);
}
