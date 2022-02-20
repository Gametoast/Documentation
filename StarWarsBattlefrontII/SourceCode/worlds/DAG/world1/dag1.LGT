
Light("sun", 1088704931)
{
	Rotation(0.188633, 0.660042, -0.670627, 0.281107);
	Position(40.088379, 51.649284, 102.503418);
	Type(1);
	Color(0.392157, 0.470588, 0.588235);
	CastShadow();
	CastSpecular(1);
	Static();
	PS2BlendMode(0);
	TileUV(1.000000,1.000000);
	OffsetUV(0.000000,0.000000);
}

Light("Light 4", 2124152563)
{
	Rotation(1.000000, 0.000000, 0.000000, 0.000000);
	Position(25.201946, 5.753900, -143.757034);
	Type(2);
	Color(0.713726, 0.894118, 0.886275);
	Static();
	Range(5.000000);
}

Light("Light 3", 3894116623)
{
	Rotation(1.000000, 0.000000, 0.000000, 0.000000);
	Position(32.194351, 4.460019, -143.926697);
	Type(2);
	Color(0.694118, 0.921569, 0.945098);
	Static();
	Range(5.000000);
}

Light("Light 2", 3897961781)
{
	Rotation(1.000000, 0.000000, 0.000000, 0.000000);
	Position(39.874371, 3.223464, -140.039368);
	Type(2);
	Color(0.662745, 0.886275, 0.913726);
	Static();
	Range(5.000000);
}

GlobalLights()
{
	EditorGlobalDirIconSize(15);
	Light1("sun");
	Light2("");
	Top(101, 114, 127);
	Bottom(70, 90, 115);
}
