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
		Tile(2.0,2.0);
		Velocity(0.05,0.05);
		LODDecimation(8);
		MainTexture("kas2_water");
		MinDiffuseColor(32, 40, 32, 188);
		MaxDiffuseColor(128, 130, 128, 188);
		BorderDiffuseColor(160, 160, 160, 255);
		SpecularColor(192, 192, 192, 152);
		SpeckleSpecularColor(200, 200, 200, 150);
		SpeckleAmbientColor(50, 50, 50, 80);
		SpeckleTextures("water_specularmask_",25, 4.0);
		SpeckleTile(5.0, 5.0);
		SpeckleScrollSpeed(0.11,0.11);
		SpeckleCoordShift(5.0,5.0);
		LightAzimAndElev(1.0,0.0);
	}


	// XBOX parameters
	XBOX()
	{
		Tile(3.0,3.0);
		NormalMapTextures("water_normalmap_",16,8.0);
		LODDecimation(1);
		RefractionColor(5, 217, 255, 255);
		ReflectionColor(255,255,255,255);
		UnderwaterColor(61, 124, 144, 128);
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
		SpecularMaskTile(3.0, 3.0);
		SpecularMaskScrollSpeed(0.0,0.0);
		Velocity(0.01,0.01);

	}
	
}

SunFlare()
{
	Angle(120.000000, 150.000000);
	Color(255, 255, 255);
	Size(5.0);
	FlareOutSize(40.0);
	NumFlareOuts(40);
	InitialFlareOutAlpha(70);
	HaloInnerRing(0.0, 255, 255, 255, 255);
	HaloMiddleRing(10.0, 255, 200, 0, 200);
	HaloOutterRing(45.0, 255, 127, 0, 0);
	SpikeColor(230,230,0,128);
	SpikeSize(9.0);
}

Effect("Blur")
{
	Enable(1);
	Mode(1)
	ConstantBlend(0.3)
	DownSizeFactor(0.2500)
}

