Effect("ColorControl")
{
	PS2()
	{
		Enable(1);
		WorldBrightness(0.46);
		WorldContrast(0.48);
		WorldSaturation(0.65);
	}
}

Effect("Wind")
{
	Enable(1);
	Velocity(1.0, 0.3);
	VelocityRange(1.0);
	VelocityChangeRate(0.1);
}

Effect("Precipitation")
{
	Enable(1);
	Type("Streaks");
	Range(12.5);
	Color(216, 220, 228);
	VelocityRange(1.0);
	ParticleDensityRange(0.0);
	CameraCrossVelocityScale(0.2);
	CameraAxialVelocityScale(1.0);

	GroundEffect("com_sfx_rainsplash");
	GroundEffectSpread(8);

	PS2()
	{
		AlphaMinMax(0.8, 1.0);
		ParticleSize(0.06);
		ParticleDensity(80.0);
		Velocity(8.0);
		StreakLength(1.7);
		GroundEffectsPerSec(7);
	}
	XBOX()
	{
		AlphaMinMax(0.2, 0.3);
		ParticleSize(0.02);
		ParticleDensity(256.0);
		Velocity(9.0);
		StreakLength(1.0);
		GroundEffectsPerSec(15);
	}
	PC()
	{
		AlphaMinMax(0.3, 0.45);
		ParticleSize(0.02);
		ParticleDensity(256.0);
		Velocity(9.0);
		StreakLength(1.0);
		GroundEffectsPerSec(15);
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
	SoundCrack("kam_amb_thunder");
	SoundSubCrack("kam_amb_thundersub");
}

Effect("Water")
{
	// general parameters

	Tile(4.0,4.0);
	MainTexture("kam1_water_2");

	FoamTexture("kam1_water");
	FoamTile(5.0,5.0);

	// ocean parameters
	OceanEnable(1);
	WindDirection(0.2,1.0);
	WindSpeed(25.0);

	// water event parameters
	WaterRingColor(148, 170, 192,255);
	WaterWakeColor(192, 192, 192,255);
	WaterSplashColor((192, 192, 192,255);

	// PS2 parameters
	PS2()
	{
		Velocity(0.01,0.05);
		PhillipsConstant(0.00001);
		PatchDivisions(16,16);
		LODDecimation(2);

		MinDiffuseColor(32, 40, 32, 255);
		MaxDiffuseColor(128, 130, 128, 255);
		BorderDiffuseColor(160, 160, 160, 255);
		SpecularColor(192, 192, 192, 192);
		SpeckleSpecularColor(160, 160, 160, 255);
		SpeckleAmbientColor(75, 75, 75, 255);
		SpeckleTextures("water_specles0", "water_specles1", "water_specles2", "water_specles3");
		SpeckleTile(5.0, 5.0);
		SpeckleBlendSpeed(4.0);
		SpeckleScrollSpeed(0.0,0.0);
		SpeckleCoordShift(10.0,10.0);
		LightAzimAndElev(1.0,0.0);
	}

	XBOX()
	{
		Velocity(0.001,0.005);
		PhillipsConstant(0.00001);
		PatchDivisions(16,16);
		LODDecimation(2);
	}

	PC()
	{
		Velocity(0.001,0.005);
		PhillipsConstant(0.00001);
		PatchDivisions(16,16);
		LODDecimation(2);
	}

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
	PC()
	{
		Enable(0);
		Mode(1)
		ConstantBlend(0.44)
		DownSizeFactor(0.2500)
	}
	XBOX()
	{
		Enable(0);
		Mode(1)
		ConstantBlend(0.44)
		DownSizeFactor(0.2500)
	}
}

Effect("hdr")
{
	Enable(1)
}
