Effect("HeatShimmer")
{
	Enable(1);
	WorldHeight(15.0);
	GeometryHeight(10.0);
	ScrollSpeed(0.09);

	PS2()
	{
		Tessellation(10,20);
		DistortionScale(0.03);
	}


	XBOX()
	{
		Tessellation(2);
		BumpMap("shimmer_waves",1.0,1.0);
		DistortionScale(2.0);
	}

	PC()
	{
		Tessellation(2);
		BumpMap("shimmer_waves",1.0,1.0);
		DistortionScale(0.002);
	}

}



SunFlare()
{
	Angle(125.000000, 120.000000);
	Color(255, 255, 255);
	Size(5.0);
	FlareOutSize(8.0);
	NumFlareOuts(30);
	InitialFlareOutAlpha(70);
	HaloInnerRing(0.0, 255, 255, 255, 255);
	HaloMiddleRing(3.0, 255, 200, 0, 150);
	HaloOutterRing(30.0, 115, 148, 182, 0);
	SpikeColor(255,230,0,128);
	SpikeSize(20.0);
}

SunFlare()
{
	Angle(130.000000, 130.000000);
	Color(255, 150, 150);
	Size(4.0);
	FlareOutSize(8.0);
	NumFlareOuts(30);
	InitialFlareOutAlpha(70);
	HaloInnerRing(0.0, 255, 255, 255, 255);
	HaloMiddleRing(3.0, 255, 200, 0, 150);
	HaloOutterRing(30.0, 115, 148, 182, 0);
	SpikeColor(150,100,0,128);
	SpikeSize(20.0);

}
Effect("Blur")
{
	Enable(1);
	Mode(1)
	ConstantBlend(0.35)
	DownSizeFactor(0.2500)
}


