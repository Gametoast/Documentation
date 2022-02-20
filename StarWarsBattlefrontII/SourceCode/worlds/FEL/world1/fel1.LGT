
Light("sun", 57142988)
{
	Rotation(0.650672, 0.395236, 0.187916, -0.620567);
	Position(150.334351, 106.886185, -114.662086);
	Type(1);
	Color(0.921569, 0.921569, 0.803922);
	CastShadow();
	CastSpecular(1);
	PS2BlendMode(0);
	TileUV(1.000000,1.000000);
	OffsetUV(0.000000,0.000000);
}

GlobalLights()
{
	EditorGlobalDirIconSize(10);
	Light1("Sun");
	Light2("");
	Top(50, 50, 40);
	Bottom(80, 80, 70);
}
