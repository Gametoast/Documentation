Effect("ColorControl")
{
	Enable(1);
	XBOX()
	{
		GammaBrightness(0.49);
		GammaContrast(0.54);
		GammaCorrection(0.52);

	}
	PC()
	{
		GammaBrightness(0.48);
		GammaContrast(0.55);
	}
}

Effect("hdr")
{
	Enable(1)
	DownSizeFactor(0.25)
	NumBloomPasses(3)
	MaxTotalWeight(1.0)
	GlowThreshold(0.5)

	GlowFactor(1.0)


}

Effect("blur")
{
	Enable(0);
		Mode(1)
		ConstantBlend(0.25)
		DownSizeFactor(0.25)
}

Effect("Shadow")
{
	Enable(1)
	BlurEnable(0)
	Intensity(0.4)
}

Effect("MotionBlur")
{
	Enable(1);
}


SunFlare()
{
	Angle(121.000000, -70.000000);
	Color(140, 140, 184);
	Size(9.0);
	FlareOutSize(10.0);
	NumFlareOuts(6);
	InitialFlareOutAlpha(35);
	HaloInnerRing(10, 60, 60, 255, 160);
	HaloMiddleRing(20, 140, 140, 255, 80);
	HaloOutterRing(40, 210, 210, 255, 0);
	SpikeColor(120,120,255,128);
	SpikeSize(16.0);
}