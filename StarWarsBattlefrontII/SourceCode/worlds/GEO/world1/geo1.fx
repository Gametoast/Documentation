Effect("FogCloud")
{
	Enable(1);
	Texture("brownmist");
	Range(90.0, 120.0);
	Color(168, 172, 180, 128);
	Velocity(5.0, 0.0);
	Rotation(0.1);
	Height(16.0);
	ParticleSize(28.0);
	ParticleDensity(100.0);
}

Effect("Blur")
{
	PS2()
	{
		Enable(1);
		MinMaxDepth(0.95,1.0);
	}
	PC()
	{
		Enable(1);
		Mode(1)
		ConstantBlend(0.3)
		DownSizeFactor(0.2500)
	}
	XBOX()
	{
		Enable(1);
		Mode(1)
		ConstantBlend(0.4)
		DownSizeFactor(0.2500)
	}
}

Effect("hdr")

{

            Enable(1)

}


Effect("MotionBlur")
{
	Enable(1);
}

Effect("ScopeBlur")
{
	Enable(1);
}

Effect("Godray")
{
	Enable(1);

	MaxGodraysInWorld(50);
	MaxGodraysOnScreen(8);

	MaxViewDistance(80.0);
	FadeViewDistance(70.0);
	MaxLength(20.0);
	OffsetAngle(-40.0);

	MinRaysPerGodray(6);
	MaxRaysPerGodray(12);
	RadiusForMaxRays(2.0);

	Texture("fx_godray");
	TextureScale(1.5, 1.5);
	TextureVelocity(0.0, -0.1, 0.0);
	TextureJitterSpeed(1.0);
}




