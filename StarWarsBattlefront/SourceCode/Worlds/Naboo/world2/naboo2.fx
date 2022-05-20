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

Effect("Water")
{

	// general parameters
	PatchDivisions(3,3);

	// ocean parameters
	OceanEnable(0);

	// water event parameters
	WaterRingColor(148, 170, 192,255);
	WaterWakeColor(192, 192, 192,255);
	WaterSplashColor((192, 192, 192,255);

	

	// PS2 parameters
	PS2()
	{
		Tile(2.0,2.0);
		Velocity(0.05,0.05);
		LODDecimation(3);
		MainTexture("nab2_water");
		MinDiffuseColor(32, 40, 32, 128);
		MaxDiffuseColor(128, 130, 128, 128);
		BorderDiffuseColor(160, 160, 160, 255);
		SpecularColor(192, 192, 192, 102);
		SpeckleSpecularColor(200, 200, 200, 100);
		SpeckleAmbientColor(50, 50, 50, 50);
		SpeckleTextures("water_specularmask_",25, 4.0);
		SpeckleTile(2.0, 2.0);
		SpeckleScrollSpeed(0.02,0.02);
		SpeckleCoordShift(10.0,10.0);
		LightAzimAndElev(1.0,0.0);
	}


	// XBOX parameters
	XBOX()
	{
		Tile(2.0,2.0);
		Velocity(0.04,0.008);
		LODDecimation(1);
		RefractionColor(90 112, 90, 150);
		ReflectionColor(200,200,200,200);
		UnderwaterColor(32, 40, 32, 180);
		FresnelMinMax(0.2,0.5)
		NormalMapTextures("water_normalmap_",16,8.0);
	}

	// PC parameters
	PC()
	{
		Tile(2.0,2.0);
		Velocity(0.05,0.05);
		LODDecimation(1);
		MainTexture("nab2_water.tga");

		RefractionColor(90 112, 90, 150);
		ReflectionColor(200,200,200,200);
		UnderwaterColor(32, 40, 32, 180);
		FresnelMinMax(0.2,0.5)

		NormalMapTextures("water_normalmap_",16,8.0);
		BumpMapTextures("water_bumpmap_",16,8.0);
		SpecularMaskTextures("water_specularmask_",25, 4);
		SpecularMaskTile(2.0,2.0);
		SpecularMaskScrollSpeed(0.02,0.02);

	}
}

SunFlare()
{
	Angle(110.000000, -30.000000);
	Color(255, 255, 255);
	Size(5.0);
	FlareOutSize(20.0);
	NumFlareOuts(40);
	InitialFlareOutAlpha(70);
	HaloInnerRing(0.0, 255, 255, 255, 255);
	HaloMiddleRing(10.0, 246, 237, 144, 128);
	HaloOutterRing(30.0, 130, 76, 0, 0);
	SpikeColor(230,230,0,128);
	SpikeSize(20.0);
}
Effect("Blur")
{
	Enable(1);
	Mode(1)
	ConstantBlend(0.4)
	DownSizeFactor(0.2500)
}


