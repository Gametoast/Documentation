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
	TextureScale(1.5, 1.5);
	TextureVelocity(0.0, -0.1, 0.0);
	TextureJitterSpeed(0.05);
}
Effect("Precipitation")
{
	Enable(1);
	Type("Streaks");
	ParticleSize(0.02);
	Range(12.5);
	Color(137, 140, 145);
	Velocity(9.0);
	VelocityRange(1.0);
	ParticleDensity(50.0);
	ParticleDensityRange(0.0);
	StreakLength(1.5);
	CameraCrossVelocityScale(0.2);
	CameraAxialVelocityScale(1.0);

	GroundEffect("rainsplash");
	GroundEffectsPerSec(8);
	GroundEffectSpread(8);

	PS2()
	{
		AlphaMinMax(0.6, 0.9);
	}
	XBOX()
	{
		AlphaMinMax(0.3, 0.45);
	}
	PC()
	{
		AlphaMinMax(0.3, 0.45);
	}
}

Effect("Lightning")
{
	Enable(1);
	Color(255, 255, 255);
	SunlightFadeFactor(0.1);
	SkyDomeDarkenFactor(0.4);
	BrightnessMin(1.0);
	FadeTime(0.2);
	TimeBetweenFlashesMinMax(3.0, 5.0);
	TimeBetweenSubFlashesMinMax(0.01, 0.5);
	NumSubFlashesMinMax(2, 5);
	HorizonAngleMinMax(30, 60);
	SoundCrack("yav_amb_thunder");
	SoundSubCrack("yav_amb_thundersub");
}

Effect("FogCloud")
{
	Enable(1);
	Texture("fluffy");
	Range(60.0, 100.0);
	Color(168, 172, 180, 128);
	Velocity(5.0, 0.0);
	Rotation(0.1);
	Height(16.0);
	ParticleSize(28.0);
	ParticleDensity(60.0);
}
LightningBolt("skybolt")
{
	Texture("lightning");
	Width(30.0);
	FadeTime(0.5);
	BreakDistance(20.0);
	TextureSize(30.0);
	SpreadFactor(20.0);
	MaxBranches(2.0);
	BranchFactor(0.5);
	BranchSpreadFactor(8);
	BranchLength(80.0);
	InterpolationSpeed(0.4);
	NumChildren(1);
	ChildBreakDistance(15.0);
	ChildTextureSize(8.0);
	ChildWidth(1.0);
	ChildSpreadFactor(10.0);
	Color(255,255,255,255);
	ChildColor(255,255,255,150);
}

Effect("Blur")
{
	Enable(1);
	Mode(1)
	ConstantBlend(0.4)
	DownSizeFactor(0.2500)
}


