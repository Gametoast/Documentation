
Light("Light 4", 600568176)
{
	Rotation(0.916936, -0.042542, -0.377468, 0.122216);
	Position(115.869743, 58.496964, -168.884567);
	Type(1);
	Color(0.854902, 0.850980, 0.678431);
	Static();
	Region("window_light");
	PS2BlendMode(0);
	TileUV(1.000000,1.000000);
	OffsetUV(0.000000,0.000000);
}

Light("sun", 2147307520)
{
	Rotation(0.690367, 0.690315, -0.153075, -0.153076);
	Position(0.000000, 0.000000, 0.000000);
	Type(1);
	Color(0.254902, 0.333333, 0.411765);
	CastShadow();
	CastSpecular(1);
	Static();
	PS2BlendMode(0);
	TileUV(1.000000,1.000000);
	OffsetUV(0.000000,0.000000);
}

Light("Light 3", 2748246027)
{
	Rotation(0.658174, 0.122572, 0.725878, -0.157746);
	Position(89.931023, 56.006535, -160.518997);
	Type(2);
	Color(0.172549, 0.756863, 0.788235);
	Static();
	Range(8.000000);
}

Light("Light 2", 4147354565)
{
	Rotation(-0.194171, 0.037309, -0.962649, 0.184967);
	Position(109.753609, 55.245552, -141.996887);
	Type(2);
	Color(0.415686, 0.780392, 0.800000);
	Static();
	Range(8.000000);
}

GlobalLights()
{
	Light1("Sun");
	Light2("");
	Top(100, 100, 100);
	Bottom(88, 88, 88);
}
