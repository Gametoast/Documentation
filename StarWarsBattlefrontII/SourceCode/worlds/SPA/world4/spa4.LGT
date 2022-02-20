
Light("sun", 89781608)
{
	Rotation(-0.326196, 0.404389, -0.626334, 0.581228);
	Position(-523.603271, -11.860817, 722.878418);
	Type(1);
	Color(0.909804, 0.870588, 0.870588);
	CastShadow();
	Static();
	CastSpecular(1);
	PS2BlendMode(0);
	TileUV(1.000000,1.000000);
	OffsetUV(0.000000,0.000000);
}

Light("cis_dirlight1", 1939865257)
{
	Rotation(0.703857, 0.710341, 0.000000, 0.000000);
	Position(-130.922775, -317.422577, 1833.648804);
	Type(1);
	Color(0.772549, 0.772549, 0.796079);
	CastShadow();
	Static();
	Region("cis_reg1");
	PS2BlendMode(0);
	TileUV(1.000000,1.000000);
	OffsetUV(0.000000,0.000000);
}

Light("imp_dirlight1", 3976856956)
{
	Rotation(0.703857, 0.710341, 0.000000, 0.000000);
	Position(-852.570007, -70.416870, 394.667877);
	Type(1);
	Color(0.717647, 0.717647, 0.717647);
	CastShadow();
	Static();
	Region("imp_reg1");
	PS2BlendMode(0);
	TileUV(1.000000,1.000000);
	OffsetUV(0.000000,0.000000);
}

Light("Back", 4132120606)
{
	Rotation(0.868671, 0.202814, -0.435041, -0.122640);
	Position(-575.911682, 1.246750, 897.810425);
	Type(1);
	Color(0.529412, 0.478431, 0.478431);
	Static();
	PS2BlendMode(0);
	TileUV(1.000000,1.000000);
	OffsetUV(0.000000,0.000000);
}

GlobalLights()
{
	EditorGlobalDirIconSize(10);
	Light1("Sun");
	Light2("Back");
	Top(56, 56, 56);
	Bottom(155, 87, 87);
}
