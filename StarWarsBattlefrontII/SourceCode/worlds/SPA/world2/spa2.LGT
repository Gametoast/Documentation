
Light("sun", 46456228)
{
	Rotation(0.621853, 0.585122, 0.188335, 0.485242);
	Position(-132.244141, 786.957520, 449.144196);
	Type(1);
	Color(0.976471, 0.972549, 0.968628);
	CastShadow();
	Static();
	CastSpecular(1);
	PS2BlendMode(0);
	TileUV(1.000000,1.000000);
	OffsetUV(0.000000,0.000000);
}

Light("rep_lightdir1", 145767002)
{
	Rotation(0.703857, 0.710341, 0.000000, 0.000000);
	Position(-1388.152710, 937.149414, -1158.751221);
	Type(1);
	Color(0.447059, 0.447059, 0.447059);
	CastShadow();
	Static();
	Region("rep_lightreg1");
	PS2BlendMode(0);
	TileUV(1.000000,1.000000);
	OffsetUV(0.000000,0.000000);
}

Light("cis_dirlight1", 2585692445)
{
	Rotation(0.667428, 0.744541, -0.014079, -0.000767);
	Position(-275.384674, 644.790710, 995.734009);
	Type(1);
	Color(0.450980, 0.450980, 0.474510);
	Static();
	Region("cis_reg1");
	PS2BlendMode(0);
	TileUV(1.000000,1.000000);
	OffsetUV(0.000000,0.000000);
}

Light("Back", 2811533614)
{
	Rotation(0.899032, 0.263690, -0.346603, 0.045771);
	Position(-117.594803, 783.004333, 533.801208);
	Type(1);
	Color(0.392157, 0.407843, 0.509804);
	Static();
	PS2BlendMode(0);
	TileUV(1.000000,1.000000);
	OffsetUV(0.000000,0.000000);
}

GlobalLights()
{
	EditorGlobalDirIconSize(20);
	Light1("sun");
	Light2("back");
	Top(20, 20, 20);
	Bottom(97, 97, 128);
}
