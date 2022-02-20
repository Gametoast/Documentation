
Light("sun", 46456228)
{
	Rotation(-0.356425, -0.872668, 0.182287, -0.279613);
	Position(-169.251038, 237.094620, 27.337143);
	Type(1);
	Color(0.980784, 0.980784, 1.000000);
	CastShadow();
	Static();
	CastSpecular(1);
	PS2BlendMode(0);
	TileUV(1.000000,1.000000);
	OffsetUV(0.000000,0.000000);
}

Light("boucing light", 3228418799)
{
	Rotation(0.951232, -0.228002, -0.197174, -0.065538);
	Position(-30.724060, 71.772430, -371.806763);
	Type(1);
	Color(0.515686, 0.515686, 0.594118);
	Static();
	PS2BlendMode(0);
	TileUV(1.000000,1.000000);
	OffsetUV(0.000000,0.000000);
}

GlobalLights()
{
	EditorGlobalDirIconSize(20);
	Light1("sun");
	Light2("boucing light");
	Top(85, 85, 90);
	Bottom(95, 95, 100);
}
