Effect("Godray")
{
	Enable(1);

	MaxGodraysInWorld(300);
	MaxGodraysOnScreen(8);

	MaxViewDistance(80.0);
	FadeViewDistance(70.0);
	MaxLength(40.0);
	OffsetAngle(-30.0);

	MinRaysPerGodray(3);
	MaxRaysPerGodray(6);
	RadiusForMaxRays(2.0);

	Texture("fx_godray");
	TextureScale(1.5, 1.5);
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

Effect("Water")
{
	// general parameters
	PatchDivisions(8,8);
	Tile(2.0,2.0);

	// ocean parameters
	OceanEnable(0);

	// water event parameters
	WaterRingColor(148, 170, 192,255);
	WaterWakeColor(192, 192, 192,255);
	WaterSplashColor((192, 192, 192,255);
	
	DisableLowRes();

	// PS2 parameters
	PS2() 
	{
		Velocity(0.1,0.02);
		LODDecimation(8);
		MainTexture("yav_water.tga");
		MinDiffuseColor(32, 40, 32, 255);
		MaxDiffuseColor(128, 130, 128, 255);
		BorderDiffuseColor(160, 160, 160, 255);
		SpecularColor(192, 192, 192, 192);
		SpeckleSpecularColor(160, 160, 160, 255);
		SpeckleAmbientColor(0, 0, 0, 255);
		SpeckleTextures("water_specularmask_",25, 2.0);
		SpeckleTile(4.0, 4.0);
		SpeckleScrollSpeed(0.2,0.0);
		SpeckleCoordShift(10.0,10.0);
		LightAzimAndElev(1.0,0.0);
	}
	// PC parameters
	PC()
	{
		Velocity(0.01,0.02);
		MainTexture("yav_water.tga");
		LODDecimation(1);

		RefractionColor(101, 136, 140, 255);
		ReflectionColor(150,150,150,150);
		UnderwaterColor(128, 130, 128, 64);
		FresnelMinMax(0.2,0.7)

		NormalMapTextures("water_normalmap_",16,8.0);
		BumpMapTextures("water_bumpmap_",16,8.0);
		SpecularMaskTextures("water_specularmask_",25, 2.0);
		SpecularMaskTile(4.0,4.0);
		SpecularMaskScrollSpeed(0.0,0.0);
	}
	// XBOX parameters
	XBOX()
	{
		Velocity(0.01,0.002);
		LODDecimation(1);
		RefractionColor(128, 130, 128, 64);
		ReflectionColor(150,150,150,150);
		UnderwaterColor(128, 130, 128, 64);
		FresnelMinMax(0.2,0.7)
		NormalMapTextures("water_normalmap_",16,8.0);
	}
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
		ConstantBlend(0.45)
		DownSizeFactor(0.2500)
	}
}

SunFlare()
{
	Angle(120.000000, -30.000000);
	Color(255, 255, 255);
	Size(5.0);
	FlareOutSize(40.0);
	NumFlareOuts(40);
	InitialFlareOutAlpha(70);
	HaloInnerRing(0.0, 255, 255, 255, 255);
	PS2()
	{
		HaloMiddleRing(10.0, 255, 200, 0, 255);
	}
	PC()
	{
		HaloMiddleRing(10.0, 255, 200, 0, 128);
	}
	XBOX()
	{
		HaloMiddleRing(10.0, 255, 200, 0, 128);
	}
	HaloOutterRing(40.0, 255, 127, 0, 0);
	SpikeColor(230,230,0,128);
	SpikeSize(9.0);
}
