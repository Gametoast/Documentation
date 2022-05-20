Effect("ColorControl")
{
	Enable(1);
	XBOX()
	{
		GammaBrightness(0.46);
		GammaContrast(0.48);
	}
	PC()
	{
		GammaBrightness(0.46);
		GammaContrast(0.48);
	}
}

Effect("Godray")
{
	OffsetAngle(0.000000);
	DustVelocity(0.0, -0.1, 0.0);
}

Effect("FogCloud")
{
	Enable(0);
	Texture("fluffy");
	Range(90.0, 120.0);
	Color(168, 172, 180, 128);
	Velocity(5.0, 0.0);
	Rotation(0.1);
	Height(16.0);
	ParticleSize(28.0);
	ParticleDensity(60.0);
}


SunFlare()
{
	Angle(120.000000, 180.000000);
	Color(255, 255, 255);
	Size(5.0);
	FlareOutSize(20.0);
	NumFlareOuts(40);
	InitialFlareOutAlpha(70);
	HaloInnerRing(0.0, 255, 255, 255, 255);
	HaloMiddleRing(8.0, 252, 190, 50, 200);
	HaloOutterRing(30.0, 52, 43, 74, 0);
	SpikeColor(230,230,0,128);
	SpikeSize(20.0);
}
Effect("Blur")
{
	Enable(1);
	Mode(1)
	ConstantBlend(0.3)
	DownSizeFactor(0.2500)
}


