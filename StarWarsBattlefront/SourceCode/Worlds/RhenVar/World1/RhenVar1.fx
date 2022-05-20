Effect("ColorControl")
{
	Enable(1);
	WorldBrightness(0.46);
	WorldContrast(0.48);
	WorldSaturation(0.65);

	PC()
	{
		GammaBrightness(0.6);
		GammaContrast(0.7);
		GammaHue(0.0);
		GammaColorBalance(0.5);
	}
}

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
	TextureScale(0.75, 0.1875);
	TextureVelocity(0.0, -0.1, 0.0);
	TextureJitterSpeed(0.05);
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

	// PS2 parameters
	PS2() 
	{
		LODDecimation(8);
		Velocity(0.1,0.02);
		MainTexture("Rhn_water.tga");
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
		DiffuseColor(128, 130, 128, 64);
		NormalMapTextures("water_normalmap_",16,8.0);
	}


	// PC parameters
	PC()
	{
		Velocity(0.01,0.002);
		MainTexture("yav_water.tga");
		SpecularMaskTile(4.0,4.0);
		SpecularMaskScrollSpeed(0.2,0.0);
		LODDecimation(1);
		DiffuseColor(128, 130, 128, 64);
		NormalMapTextures("water_normalmap_",16,8.0);
		BumpMapTextures("water_bumpmap_",16,8.0);
		SpecularMaskTextures("water_specularmask_",25, 2);
	}

}
Effect("Blur")
{
	Enable(1);
	Mode(1)
	ConstantBlend(0.45)
	DownSizeFactor(0.2500)
}









