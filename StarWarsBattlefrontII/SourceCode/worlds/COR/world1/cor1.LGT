
Light("sun", 1097130976)
{
	Rotation(-0.396709, -0.132737, -0.875473, 0.241971);
	Position(9.931580, 88.982986, 169.230515);
	Type(1);
	Color(0.690196, 0.741176, 0.815686);
	CastShadow();
	Static();
	PS2BlendMode(0);
	TileUV(1.000000,1.000000);
	OffsetUV(0.000000,0.000000);
	CastSpecular(1);
}

Light("STATUE1", 2048764699)
{
	Rotation(1.000000, 0.000000, 0.000000, 0.000000);
	Position(-32.271400, 5.400081, 151.216614);
	Type(2);
	Color(0.737255, 0.737255, 0.392157);
	Static();
	Range(5.000000);
}


Light("STATUE", 2888238877)
{
	Rotation(1.000000, 0.000000, 0.000000, 0.000000);
	Position(-31.888416, 4.691231, 137.368622);
	Type(2);
	Color(0.737255, 0.737255, 0.392157);
	Static();
	Range(5.000000);
}

Light("Back", 3658603926)
{
	Rotation(0.803575, 0.239570, -0.480029, 0.257893);
	Position(-143.754547, 74.915314, 124.489990);
	Type(1);
	Color(0.556863, 0.619608, 0.701961);
	Static();
	PS2BlendMode(0);
	TileUV(1.000000,1.000000);
	OffsetUV(0.000000,0.000000);
}

GlobalLights()
{
	EditorGlobalDirIconSize(20);
	Light1("SUN");
	Light2("BACK");
	Top(0, 0, 0);
	Bottom(0, 0, 0);
}
