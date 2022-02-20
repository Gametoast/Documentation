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
	Angle(130.000000, 230.000000);
	Color(255, 255, 255);
	Size(2.0);
	FlareOutSize(25.0);
	NumFlareOuts(40);
	InitialFlareOutAlpha(50);
	HaloInnerRing(0.0, 255, 255, 255, 255);
	PS2()
	{
		HaloMiddleRing(1.0, 255, 200, 0, 255);
	}
	PC()
	{
		HaloMiddleRing(1.0, 255, 200, 0, 128);
	}
	XBOX()
	{
		HaloMiddleRing(1.0, 255, 200, 0, 128);
	}
	HaloOutterRing(20.0, 255, 127, 0, 0);
	SpikeColor(230,230,0,128);
	SpikeSize(14.0);
}
