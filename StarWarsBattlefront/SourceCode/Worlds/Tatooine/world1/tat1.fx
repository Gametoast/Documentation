Effect("HeatShimmer")
{
	Enable(1);
	WorldHeight(15.0);
	GeometryHeight(8.0);
	ScrollSpeed(0.08);

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
	Angle(115.000000, -55.000000);
	Color(200, 0, 0);
	Size(5.0);
	FlareOutSize(8.0);
	NumFlareOuts(30);
	InitialFlareOutAlpha(50);
	HaloInnerRing(0.0, 255, 255, 255, 255);
	HaloMiddleRing(8.0, 255, 200, 0, 128);
	HaloOutterRing(30.0, 120, 139, 120, 0);
	SpikeColor(150,80,0,128);
	SpikeSize(10.0);

}

SunFlare()
{
	Angle(110.000000, -45.000000);
	Color(255, 200, 200);
	Size(4.0);
	FlareOutSize(8.0);
	NumFlareOuts(30);
	InitialFlareOutAlpha(50);
	HaloInnerRing(0.0, 255, 255, 255, 255);
	HaloMiddleRing(3.0, 255, 200, 0, 128);
	HaloOutterRing(15.0, 255, 127, 0, 0);
	SpikeColor(255,230,0,128);
	SpikeSize(10.0);


}
Effect("Blur")
{
	Enable(1);
	Mode(1)
	ConstantBlend(0.35)
	DownSizeFactor(0.2500)
}


