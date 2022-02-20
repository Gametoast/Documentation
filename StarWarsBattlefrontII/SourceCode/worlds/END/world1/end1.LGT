
Light("sun", 57142988)
{
	Rotation(0.704947, 0.504371, 0.055551, -0.495553);
	Position(435.707825, 164.430115, -105.622406);
	Type(1);
	Color(1.000000, 1.000000, 1.000000);
	CastShadow();
	CastSpecular(1);
	PS2BlendMode(0);
	TileUV(1.000000,1.000000);
	OffsetUV(0.000000,0.000000);
}

Light("bouncing", 3700990504)
{
	Rotation(-0.324517, -0.017191, -0.903244, -0.280259);
	Position(408.586823, 124.486755, -83.556847);
	Type(1);
	Color(0.300000, 0.320000, 0.300000);
	Static();
	PS2BlendMode(0);
	TileUV(1.000000,1.000000);
	OffsetUV(0.000000,0.000000);
}

GlobalLights()
{
	EditorGlobalDirIconSize(10);
	Light1("Sun");
	Light2("bouncing");
	Top(80, 80, 80);
	Bottom(70, 70, 70);
}
