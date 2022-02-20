
Light("sun", 3250612360)
{
	Rotation(0.509371, 0.498417, -0.692326, -0.113167);
	Position(36.612625, 97.940849, 44.779686);
	Type(1);
	Color(0.811765, 0.811765, 0.811765);
	CastShadow();
	PS2BlendMode(0);
	CastSpecular(1);
	TileUV(1.000000,1.000000);
	OffsetUV(0.000000,0.000000);
}

GlobalLights()
{
	EditorGlobalDirIconSize(10);
	Light1("Sun");
	Light2("light 2");
	Top(191, 191, 191);
	Bottom(88, 97, 97);
}
