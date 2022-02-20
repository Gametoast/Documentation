
Light("sun", 89781608)
{
	Rotation(0.040389, 0.534307, -0.767016, 0.352946);
	Position(-1554.192017, 216.946091, 1545.875610);
	Type(1);
	Color(0.854902, 0.870588, 0.949020);
	CastShadow();
	Static();
	CastSpecular(1);
	PS2BlendMode(0);
	TileUV(1.000000,1.000000);
	OffsetUV(0.000000,0.000000);
}

Light("rep_dirlight1", 1136837258)
{
	Rotation(0.667351, 0.742808, 0.023801, -0.048089);
	Position(-481.250092, 11.926228, 1166.604614);
	Type(1);
	Color(0.513726, 0.513726, 0.513726);
	CastShadow();
	Static();
	Region("rep_reg1");
	PS2BlendMode(0);
	TileUV(1.000000,1.000000);
	OffsetUV(0.000000,0.000000);
}

Light("cis_dirlight1", 3218227112)
{
	Rotation(0.716788, 0.697228, 0.000000, 0.000000);
	Position(-936.737244, -139.803589, -324.872620);
	Type(1);
	Color(0.513726, 0.513726, 0.513726);
	CastShadow();
	Static();
	Region("cis_reg1");
	PS2BlendMode(0);
	TileUV(1.000000,1.000000);
	OffsetUV(0.000000,0.000000);
}

Light("Back", 3384108175)
{
	Rotation(0.931675, 0.282562, -0.202440, -0.105839);
	Position(-1586.034790, 337.632446, 1529.426758);
	Type(1);
	Color(0.517647, 0.541176, 0.517647);
	Static();
	PS2BlendMode(0);
	TileUV(1.000000,1.000000);
	OffsetUV(0.000000,0.000000);
}

GlobalLights()
{
	EditorGlobalDirIconSize(15);
	Light1("Sun");
	Light2("back");
	Top(20, 20, 32);
	Bottom(92, 92, 100);
}
