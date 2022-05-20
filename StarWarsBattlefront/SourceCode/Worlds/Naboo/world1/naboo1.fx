
SunFlare()
{
	Angle(110.000000, -10.000000);
	Color(255, 255, 255);
	Size(5.0);
	FlareOutSize(20.0);
	NumFlareOuts(40);
	InitialFlareOutAlpha(70);
	HaloInnerRing(0.0, 255, 255, 255, 255);
	HaloMiddleRing(10.0, 246, 237, 144, 128);
	HaloOutterRing(30.0, 130, 76, 0, 0);
	SpikeColor(230,230,0,128);
	SpikeSize(20.0);

}
Effect("Blur")
{
	Enable(1);
	Mode(1)
	ConstantBlend(0.4)
	DownSizeFactor(0.2500)
}



