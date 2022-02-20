
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
}

Effect("hdr")
{
	Enable(1)
}

