
Light("sun", 89781608)
{
	Rotation(-0.356158, -0.710844, -0.288990, 0.533310);
	Position(99.292732, 0.000000, -350.210693);
	Type(1);
	Color(0.921569, 0.921569, 0.921569);
	CastShadow();
	CastSpecular(1);
	Static();
	PS2BlendMode(0);
}

GlobalLights()
{
	EditorGlobalDirIconSize(35);
	Light1("Sun");
	Light2("");
	Top(110, 110, 110);
	Bottom(85, 85, 85);
}
