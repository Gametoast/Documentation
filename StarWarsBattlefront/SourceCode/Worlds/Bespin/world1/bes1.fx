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
	Angle(100.000000, -45.000000);
	Color(255, 170, 100);
	Size(5.0);
	FlareOutSize(8.0);
	NumFlareOuts(40);
	InitialFlareOutAlpha(70);
	HaloInnerRing(0.0, 255, 255, 255, 255);
	HaloMiddleRing(3.0, 255, 170, 100, 200);
	HaloOutterRing(30.0, 255, 206, 166, 0);
	SpikeColor(255,206,166,128);
	SpikeSize(20.0);


}
Effect("Blur")
{
	Enable(1);
	Mode(1)
	ConstantBlend(0.3)
	DownSizeFactor(0.2500)
}
