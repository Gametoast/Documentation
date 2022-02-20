
Light("sun", 2147344384)
{
	Rotation(0.503390, 0.262188, 0.621679, -0.539788);
	Position(23.231430, 297.386780, 223.929001);
	Type(1);
	Color(0.501961, 0.501961, 0.529412);
	CastShadow();
	CastSpecular(1);
	PS2BlendMode(0);
	TileUV(1.000000,1.000000);
	OffsetUV(0.000000,0.000000);
}

GlobalLights()
{
	EditorGlobalDirIconSize(10);
	Light1("sun");
	Light2("");
	Top(100, 100, 100);
	Bottom(50, 50, 55);
}
