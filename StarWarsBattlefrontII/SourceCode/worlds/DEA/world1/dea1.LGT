

Light("projet_LGT4", 335992909)
{
	Rotation(0.691936, -0.714968, -0.064607, 0.076623);
	Position(-42.308197, 41.548565, 171.503357);
	Type(1);
	Color(1.000000, 0.000000, 0.000000);
	Static();
	Texture("fx_grate_01", 0);
	PS2Overbright(1);
	Region("redlight4");
	PS2BlendMode(2);
	TileUV(4.000000,4.000000);
	OffsetUV(0.000000,0.000000);
}

Light("projet_LGT1", 335992909)
{
	Rotation(0.691936, -0.714968, -0.064607, 0.076623);
	Position(-27.735128, 43.548565, 150.525818);
	Type(1);
	Color(1.000000, 0.000000, 0.000000);
	Texture("fx_grate_01", 0);
	PS2Overbright(1);
	Region("redlight1");
	PS2BlendMode(2);
	TileUV(4.000000,4.000000);
	OffsetUV(0.000000,0.000000);
}

Light("projet_LGT2", 335992909)
{
	Rotation(0.691936, -0.714968, -0.064607, 0.076623);
	Position(-5.982450, 45.548565, 171.897980);
	Type(1);
	Color(1.000000, 0.000000, 0.000000);
	Texture("fx_grate_01", 0);
	PS2Overbright(1);
	Region("redlight2");
	PS2BlendMode(2);
	TileUV(4.000000,4.000000);
	OffsetUV(0.000000,0.000000);
}

Light("projet_LGT3", 335992909)
{
	Rotation(0.691936, -0.714968, -0.064607, 0.076623);
	Position(-25.735128, 43.548565, 202.255798);
	Type(1);
	Color(1.000000, 0.000000, 0.000000);
	Static();
	Texture("fx_grate_01", 0);
	PS2Overbright(1);
	Region("redlight3");
	PS2BlendMode(2);
	TileUV(4.000000,4.000000);
	OffsetUV(0.000000,0.000000);
}




Light("red_spot03", 1893915624)
{
	Rotation(0.639586, -0.727806, 0.185870, 0.163340);
	Position(-151.393906, 52.331436, 53.386688);
	Type(3);
	Color(1.000000, 0.000000, 0.000000);
	Texture("fx_grate_01", 1);
	Range(6.000000);
	Cone(0.785398, 1.047198);
	PS2BlendMode(0);
	Bidirectional(0);
}

Light("sun", 2245214928)
{
	Rotation(0.933611, 0.325035, -0.066549, -0.135453);
	Position(-170.997482, 338.054504, -27.825470);
	Type(1);
	Color(0.880520, 0.880025, 0.900784);
	CastShadow();
	Static();
	CastSpecular(1);
	PS2BlendMode(0);
	TileUV(1.000000,1.000000);
	OffsetUV(0.000000,0.000000);
}

Light("red_spot01", 2332114643)
{
	Rotation(0.659819, -0.750829, -0.022466, -0.019743);
	Position(-156.922745, 55.676506, 76.414108);
	Type(3);
	Color(1.000000, 0.000000, 0.000000);
	Static();
	Texture("fx_grate_01", 1);
	Range(9.000000);
	Cone(0.959931, 1.134464);
	PS2BlendMode(0);
	Bidirectional(0);
}

Light("Light 79", 2853139957)
{
	Rotation(0.607885, -0.766131, 0.163420, 0.129665);
	Position(-157.979813, 55.702560, 53.233921);
	Type(3);
	Color(1.000000, 0.000000, 0.000000);
	Static();
	Texture("fx_grate_01", 1);
	Range(6.000000);
	Cone(1.047198, 1.134464);
	PS2BlendMode(0);
	Bidirectional(0);
}



Light("hanger-7", 3476073778)
{
	Rotation(1.000000, 0.000000, 0.000000, 0.000000);
	Position(-139.764969, 50.074394, 9.239863);
	Type(2);
	Color(0.470588, 0.470588, 1.000000);
	Static();
	PS2Overbright(1);
	Range(8.000000);
}




Light("hangerred-1", 3813596169)
{
	Rotation(1.000000, 0.000000, 0.000000, 0.000000);
	Position(-134.823578, 63.310314, 16.431465);
	Type(2);
	Color(1.000000, 0.650000, 0.650000);
	Static();
	PS2Overbright(1);
	Range(5.000000);
}


Light("red_spot02", 4204004699)
{
	Rotation(0.613229, -0.788898, -0.031481, -0.024471);
	Position(-145.974609, 50.446850, 53.615421);
	Type(3);
	Color(1.000000, 0.000000, 0.000000);
	Static();
	Texture("fx_grate_01", 1);
	Range(5.000000);
	Cone(0.959931, 1.047198);
	PS2BlendMode(0);
	Bidirectional(0);
}





GlobalLights()
{
	EditorGlobalDirIconSize(5);
	Light1("sun");
	Light2("");
	Top(50, 50, 60);
	Bottom(45, 45, 45);
}
