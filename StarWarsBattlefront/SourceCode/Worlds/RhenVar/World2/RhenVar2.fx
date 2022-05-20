Effect("ColorControl")
{
	Enable(1);
	WorldBrightness(0.46);
	WorldContrast(0.48);
	WorldSaturation(0.65);

	PC()
	{
		GammaBrightness(0.6);
		GammaContrast(0.7);
		GammaHue(0.0);
		GammaColorBalance(0.5);
	}
}

Effect("Godray")
{
	Enable(1);

	MaxGodraysInWorld(300);
	MaxGodraysOnScreen(8);

	MaxViewDistance(80.0);
	FadeViewDistance(70.0);
	MaxLength(40.0);
	OffsetAngle(0.0);

	MinRaysPerGodray(3);
	MaxRaysPerGodray(6);
	RadiusForMaxRays(2.0);

	Texture("fx_godray");
	TextureScale(0.75, 0.1875);
	TextureVelocity(0.0, -0.1, 0.0);
	TextureJitterSpeed(0.05);
}

Effect("FogCloud")
{
	Enable(1);
	Texture("fluffy");
	Range(90.0, 120.0);
	Color(168, 172, 180, 128);
	Velocity(5.0, 0.0);
	Rotation(0.1);
	Height(16.0);
	ParticleSize(28.0);
	ParticleDensity(60.0);
}
Effect("Blur")
{
	Enable(1);
	Mode(1)
	ConstantBlend(0.3)
	DownSizeFactor(0.2500)
}










