Effect("ColorControl")
{
	Enable(1);
	XBOX()
	{
		GammaBrightness(0.5);
		GammaContrast(0.56);
		GammaCorrection(0.55);
	}
	PC()
	{
		GammaBrightness(0.5);
		GammaContrast(0.55);
	}
}

Effect("hdr")
{
	Enable(1)
	DownSizeFactor(0.25)
	NumBloomPasses(4)
	MaxTotalWeight(1.0)
	GlowThreshold(0.5)
	GlowFactor(1.0)

	PS2()
	{
		MaxTotalWeight(1.1)
	}
	
}

Effect("blur")
{
	Enable(0);
		Mode(1)
		ConstantBlend(0.35)
		DownSizeFactor(0.25)
}


Effect("Water")
{

	// general parameters
	PatchDivisions(6,6);

	// ocean parameters
	OceanEnable(0);

	// water event parameters
	WaterRingColor(148, 30, 0,255);
	WaterWakeColor(192, 70, 20,255);
	WaterSplashColor((192, 70, 20,255);

	// PS2 parameters
	PS2()
	{
		Tile(2.0,2.0);
		Velocity(0.001,0.001);
		LODDecimation(3);
		MainTexture("dea1_water");
		MinDiffuseColor(70, 50,40, 100);
		MaxDiffuseColor(85, 60, 50, 200);
		BorderDiffuseColor(85, 60, 50, 200);
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
		Velocity(0.02,0.02);
		LODDecimation(1);
		MainTexture("dea1_water");

		RefractionColor(90, 45, 0, 200);
		ReflectionColor(100,50,20,150);
		UnderwaterColor(42, 22, 0, 210);
		FresnelMinMax(0.1,0.4)

		NormalMapTextures("water_normalmap_",16,8.0);
		BumpMapTextures("water_bumpmap_",16,8.0);
		SpecularMaskTextures("water_specularmask_",25,4);
		SpecularMaskTile(2.0,2.0);
		SpecularMaskScrollSpeed(0.01,0.01);
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


SunFlare()
{
	Angle(110.000000, -30.000000);
	Color(255, 255, 255);
	Size(5.0);
	FlareOutSize(20.0);
	NumFlareOuts(40);
	InitialFlareOutAlpha(70);
	SpikeColor(230,230,0,128);
	SpikeSize(20.0);

	PS2()
	{
		HaloInnerRing(0.0, 255, 255, 255, 255);
		HaloMiddleRing(10.0, 255, 200, 0, 255);
		HaloOutterRing(30.0, 255, 127, 0, 0);
	}
	PC()
	{
		HaloInnerRing(0.0, 255, 255, 255, 255);
		HaloMiddleRing(10.0, 246, 237, 144, 128);
		HaloOutterRing(30.0, 130, 76, 0, 0);
	}
	XBOX()
	{
		HaloInnerRing(0.0, 255, 255, 255, 255);
		HaloMiddleRing(10.0, 246, 237, 144, 128);
		HaloOutterRing(30.0, 130, 76, 0, 0);
	}
}

