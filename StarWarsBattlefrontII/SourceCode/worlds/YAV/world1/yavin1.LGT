
Light("sun", 46456228)
{
	Rotation(0.640832, 0.640834, -0.298890, -0.298893);
	Position(0.000000, 0.000000, 0.000000);
	Type(1);
	Color(0.784314, 0.784314, 0.784314);
	CastShadow();
	CastSpecular(1);
	Static();
}

GlobalLights()
{
	Light1("Sun");
	Light2("");
	Top(75, 83, 85);
	Bottom(42, 44, 20);
}
