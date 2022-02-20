Effect("ColorControl")
{
	Enable(1);
	XBOX()
	{
		GammaBrightness(0.53);
		GammaContrast(0.61);
	}

}

Effect("Godray")
{
	Enable(1);
	MaxGodraysInWorld(5000);
	MaxGodraysOnScreen(10);
	OffsetAngle(0.000000);
	DustVelocity(0.0, -0.1, 0.0);
	MaxViewDistance(150);
	MaxViewDistance(130);
}

Effect("Blur")
{
	Enable(1);
	Mode(1)
	ConstantBlend(0.3)
	DownSizeFactor(0.25)
}

Effect("hdr")
{
	Enable(1)
	DownSizeFactor(0.25)
	NumBloomPasses(5)
	MaxTotalWeight(1.0)
	GlowThreshold(0.2)

	GlowFactor(0.5)


}

Effect("MotionBlur")
{
	Enable(1);
}

Effect("ScopeBlur")
{
	Enable(1);
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
	OscillationEnable(0);
	
	DisableLowRes();

	// PS2 parameters
	PS2() 
	{
		Velocity(0.1,0.02);
		LODDecimation(8);
		MainTexture("tat3_water.tga");
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

	// XBOX parameters
	XBOX()
	{
		Velocity(0.01,0.002);
		LODDecimation(1);
		RefractionColor(50, 67, 69, 255);
		ReflectionColor(150,150,150,150);
		UnderwaterColor(128, 130, 128, 64);
		FresnelMinMax(0.2,0.7)
		NormalMapTextures("water_normalmap_",16,8.0);
	}


	// PC parameters
	PC()
	{
		Velocity(0.01,0.02);
		MainTexture("tat3_water.tga");
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

}


