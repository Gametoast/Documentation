
Light("sun", 2147348480)
{
	Rotation(-0.409077, -0.872693, 0.262547, -0.046180);
	Position(-0.621802, -0.000795, 0.000000);
	Type(1);
	Color(0.862745, 0.862745, 0.862745);
	CastShadow();
	Static();
	PS2BlendMode(0);
	CastSpecular(1);
	TileUV(1.000000,1.000000);
	OffsetUV(0.000000,0.000000);
}

Light("arden11", 2382315401)
{
	Rotation(0.723956, 0.689906, 0.000000, 0.000000);
	Position(114.252220, -32.664917, -161.031937);
	Type(3);
	Color(0.968628, 0.866667, 0.658824);
	Static();
	PS2Overbright(1);
	Range(15.000000);
	Cone(0.698132, 1.047198);
	PS2BlendMode(0);
	Bidirectional(0);
}

Light("Light 1", 3287291452)
{
	Rotation(0.872981, 0.475536, -0.056391, -0.092749);
	Position(31.851360, -55.997898, -73.289841);
	Type(3);
	Color(0.000000, 0.000000, 1.000000);
	Static();
	Range(5.000000);
	Cone(0.785398, 0.872665);
	PS2BlendMode(0);
	Bidirectional(0);
}

GlobalLights()
{
	Light1("Sun");
	Light2("");
	Top(100, 80, 50);
	Bottom(90, 60, 30);
}
