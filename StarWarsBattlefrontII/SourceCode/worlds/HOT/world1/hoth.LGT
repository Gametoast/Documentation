
Light("sun", 2147340288)
{
	Rotation(0.541757, 0.707105, -0.454425, 0.000000);
	Position(0.000000, 0.000000, 0.000000);
	Type(1);
	Color(1.000000, 1.000000, 1.000000);
	CastShadow();
	Static();
	PS2BlendMode(0);
	CastSpecular(1);
	TileUV(1.000000,1.000000);
	OffsetUV(0.000000,0.000000);
}

GlobalLights()
{
	Light1("Sun");
	Light2("");
	Top(170, 170, 170);
	Bottom(170, 170, 170);
}
