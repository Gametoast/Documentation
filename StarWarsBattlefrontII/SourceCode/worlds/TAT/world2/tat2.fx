Effect("ColorControl")
{
	PC()
	{
		GammaBrightness(0.6);
		GammaContrast(0.7);
		GammaHue(0.0);
		GammaColorBalance(0.5);
	}
	XBOX()
	{
		Enable(1);
		GammaBrightness(0.46);
		GammaContrast(0.48);
	}
}

Effect("Shadow")
{
	Enable(1)
	BlurEnable(0)
	Intensity(0.35)
}

SunFlare()
{
	Angle(125.000000, 120.000000);
	Color(255, 255, 255);
	Size(5.0);
	SpikeColor(255,230,0,128);
	SpikeSize(20.0);

	PS2()
	{
		FlareOutSize(7.0);
		NumFlareOuts(40);
		HaloInnerRing(0.0, 255, 255, 255, 255);
		HaloMiddleRing(3.0, 255, 200, 0, 255);
		HaloOutterRing(10.0, 255, 127, 0, 0);
	}
	PC()
	{
		FlareOutSize(8.0);
		NumFlareOuts(30);
		HaloInnerRing(0.0, 255, 255, 255, 255);
		HaloMiddleRing(3.0, 255, 200, 0, 150);
		HaloOutterRing(30.0, 115, 148, 182, 0);
	}
	XBOX()
	{
		FlareOutSize(8.0);
		NumFlareOuts(30);
		HaloInnerRing(0.0, 255, 255, 255, 255);
		HaloMiddleRing(3.0, 255, 200, 0, 150);
		HaloOutterRing(30.0, 115, 148, 182, 0);
	}
}

SunFlare()
{
	Angle(130.000000, 130.000000);
	Color(255, 150, 150);
	Size(4.0);
	InitialFlareOutAlpha(70);
	SpikeColor(150,100,0,128);
	SpikeSize(20.0);

	PS2()
	{
		FlareOutSize(5.0);
		NumFlareOuts(40);
		HaloInnerRing(0.0, 255, 255, 255, 255);
		HaloMiddleRing(3.0, 255, 200, 0, 255);
		HaloOutterRing(10.0, 255, 127, 0, 0);
	}
	PC()
	{
		FlareOutSize(8.0);
		NumFlareOuts(30);
		HaloInnerRing(0.0, 255, 255, 255, 255);
		HaloMiddleRing(3.0, 255, 200, 0, 150);
		HaloOutterRing(30.0, 115, 148, 182, 0);
	}
	XBOX()
	{
		FlareOutSize(8.0);
		NumFlareOuts(30);
		HaloInnerRing(0.0, 255, 255, 255, 255);
		HaloMiddleRing(3.0, 255, 200, 0, 150);
		HaloOutterRing(30.0, 115, 148, 182, 0);
	}
}
