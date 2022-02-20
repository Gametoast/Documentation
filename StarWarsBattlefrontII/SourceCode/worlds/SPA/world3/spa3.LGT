
Light("sun", 46456228)
{
	Rotation(0.767368, 0.458429, 0.302045, 0.331296);
	Position(719.241455, 523.072388, -645.470703);
	Type(1);
	Color(0.905882, 0.945098, 0.905882);
	CastShadow();
	Static();
	CastSpecular(1);
	PS2BlendMode(0);
	TileUV(1.000000,1.000000);
	OffsetUV(0.000000,0.000000);
}

Light("cis_dirlt2", 361003921)
{
	Rotation(0.738636, 0.674111, 0.000000, 0.000000);
	Position(150.049988, 109.057281, -917.534302);
	Type(1);
	Color(0.768628, 0.768628, 0.768628);
	CastShadow();
	Static();
	Region("cis_reg2");
	PS2BlendMode(0);
	TileUV(1.000000,1.000000);
	OffsetUV(0.000000,0.000000);
}

Light("Back", 1945705495)
{
	Rotation(0.745207, 0.146451, -0.650357, 0.015905);
	Position(676.836426, 593.175232, -377.879486);
	Type(1);
	Color(0.847059, 0.854902, 0.847059);
	Static();
	PS2BlendMode(0);
	TileUV(1.000000,1.000000);
	OffsetUV(0.000000,0.000000);
}

Light("cis_dirlt1", 2602471517)
{
	Rotation(0.674963, 0.737852, 0.000000, 0.000000);
	Position(34.937000, 112.912987, -808.133667);
	Type(1);
	Color(0.764706, 0.764706, 0.764706);
	CastShadow();
	Static();
	PS2BlendMode(0);
	TileUV(1.000000,1.000000);
	OffsetUV(0.000000,0.000000);
}

Light("rep_dirlt1", 4093490700)
{
	Rotation(0.717909, 0.696160, 0.000000, 0.000000);
	Position(1346.548950, -62.918957, -532.478577);
	Type(1);
	Color(0.756863, 0.756863, 0.733333);
	CastShadow();
	Static();
	Region("rep_reg1");
	PS2BlendMode(0);
	TileUV(1.000000,1.000000);
	OffsetUV(0.000000,0.000000);
}

GlobalLights()
{
	EditorGlobalDirIconSize(5);
	Light1("Sun");
	Light2("back");
	Top(71, 71, 80);
	Bottom(90, 100, 90);
}
