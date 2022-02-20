Effect("SpaceDust")
{
	Enable(1);

	Texture("spacedust1");

	SpawnDistance(150.0);
	MaxRandomSideOffset(70.0);
	CenterDeadZoneRadius(20.0);

	MinParticleScale(0.1);
	MaxParticleScale(0.5);

	SpawnDelay(0.02);
	ReferenceSpeed(35.0);

	DustParticleSpeed(100.0);

	SpeedParticleMinLength(2.0);
	SpeedParticleMaxLength(12.0);

	ParticleLengthMinSpeed(35.0);
	ParticleLengthMaxSpeed(170.0);
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

Effect("Blur")
{
	PS2()
	{
		Enable(0);
		MinMaxDepth(0.95,1.0);
	}	
	PC()
	{
		Enable(0);
		Mode(1)
		ConstantBlend(0.3)
		DownSizeFactor(0.2500)
	}
	XBOX()
	{
		Enable(0);
		Mode(1)
		ConstantBlend(0.45)
		DownSizeFactor(0.2500)
	}
}

effect("hdr")
{
	enable(1)
	DownSizeFactor(0.5)
	NumBloomPasses(4)
	MaxTotalWeight(1.05)
	GlowThreshold(0.7)
	GlowFactor(1.0)

}

SunFlare()
{
	Angle(95.000000, -35.000000);
	Color(200,200,255);
	Size(3.0);
	SpikeSize(24.0);
	SpikeColor(200,200,255,128);
	NumFlareOuts(30);
	InitialFlareOutAlpha(50);


	PS2()
	{
		FlareOutSize(2.0);
		HaloInnerRing(0.0, 255, 255, 255, 255);
		HaloMiddleRing(1.0, 255, 200, 0, 255);
		HaloOutterRing(10.0, 255, 127, 0, 0);
	}
	PC()
	{
		FlareOutSize(8.0);
		HaloInnerRing(0.0, 255, 255, 255, 255);
		HaloMiddleRing(1.0, 255, 200, 0, 128);
		HaloOutterRing(15.0, 255, 127, 0, 0);
	}
	XBOX()
	{
		FlareOutSize(8.0);
		HaloInnerRing(0.0, 255, 255, 255, 255);
		HaloMiddleRing(1.0, 255, 200, 0, 128);
		HaloOutterRing(15.0, 255, 127, 0, 0);
	}
}
