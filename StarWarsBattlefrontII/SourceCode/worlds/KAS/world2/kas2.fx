


Effect("FogCloud")
{
	Enable(1);
	Texture("fluffy");
	Range(40.0, 80.0);
	Color(255, 255, 255, 75);
	Velocity(4.0, 0.0);
	Rotation(0.1);
	Height(9.0);
	ParticleSize(18.0);
	ParticleDensity(20.0);
}

Effect("Water")
{

	// general parameters
	PatchDivisions(4,4);

	// ocean parameters
	OceanEnable(0);

	// water event parameters
	WaterRingColor(148, 170, 192,255);
	WaterWakeColor(192, 192, 192,255);
	WaterSplashColor((192, 192, 192,255);

	

	// PS2 parameters
	PS2()
	{
		Tile(1.0,1.0);
		Velocity(0.00,0.00);
		LODDecimation(8);
		MainTexture("kas2_water");
		MinDiffuseColor(30,30,30, 255);
		MaxDiffuseColor(70, 70, 70, 255);
		BorderDiffuseColor(10, 10, 10, 255);
		SpecularColor(60, 60, 60, 152);
		SpeckleSpecularColor(80, 80, 80, 150);
		SpeckleAmbientColor(50, 50, 50, 80);
		SpeckleTextures("water_specularmask_",25, 4.0);
		SpeckleTile(8.0, 8.0);
		SpeckleScrollSpeed(0.0,0.0);
		SpeckleCoordShift(5.0,5.0);
		LightAzimAndElev(1.0,0.0);
	}


	// XBOX parameters
	XBOX()
	{
		Tile(2.0,2.0);
		NormalMapTextures("water_normalmap_",16,8.0);
		LODDecimation(1);
		RefractionColor(110, 135, 139, 255);
		ReflectionColor(110,135,139,255);
		UnderwaterColor(96, 96, 88, 128);
		FresnelMinMax(0.3,0.6);
		Velocity(0.04, 0.008);

	}

	// PC parameters
	PC()
	{
		Tile(2.0,2.0);
		MainTexture("kas2_water.tga");
		LODDecimation(1);
		RefractionColor(5, 217, 255, 255);
		ReflectionColor(57,90,138,255);
		UnderwaterColor(61, 124, 144, 128);
		FresnelMinMax(0.3,0.6);
		FarSceneRange(1500)

		NormalMapTextures("water_normalmap_",16,8.0);
		BumpMapTextures("water_bumpmap_",16,8.0);
		SpecularMaskTextures("water_specularmask_",25, 4);
		SpecularMaskTile(2.0, 2.0);
		SpecularMaskScrollSpeed(0.0,0.0);
		Velocity(0.01,0.01);

	}
	
}

Effect("hdr")
{
	Enable(1)
}





