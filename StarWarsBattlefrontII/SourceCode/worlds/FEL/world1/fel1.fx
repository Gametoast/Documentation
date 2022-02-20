Effect("ColorControl")
{
	Enable(1);
	XBOX()
	{
		GammaBrightness(0.48);
		GammaContrast(0.54);
	}
	PC()
	{
		GammaBrightness(0.48);
		GammaContrast(0.55);
	}

}


Effect("hdr")
{
	Enable(1)
	DownSizeFactor(0.25)
	NumBloomPasses(3)
	MaxTotalWeight(1.0)
	GlowThreshold(0.5)

	GlowFactor(1.0)
	
}



Effect("Blur")
{
	PS2()
	{
		Enable(1);
		Mode(1)
		ConstantBlend(0.35)
		DownSizeFactor(0.35)
	}
	PC()
	{
		Enable(0);
		Mode(1)
		ConstantBlend(0.3)
		DownSizeFactor(0.25)
	}
	XBOX()
	{
		Enable(1);
		Mode(1)
		ConstantBlend(0.3)
		DownSizeFactor(0.25)
	}
}


Effect("Godray")
{
	Enable(1);
	MaxGodraysInWorld(100);
	PS2()
	{
		MaxGodraysOnScreen(3);
	}
	PC()
	{
		MaxGodraysOnScreen(10);
	}
	XBOX()
	{
		MaxGodraysOnScreen(3);
	}
	OffsetAngle(0.000000);
	DustVelocity(0.1, -0.2, 0.0);
	MaxViewDistance(30);
}


Effect("Precipitation")
{
	Enable(1);
	Type("Quads");
	Texture("fx_pollen");
	ParticleSize(0.015);
	Color(215, 255, 225);
	Range(15.0);
	Velocity(-0.3);
	VelocityRange(1);
	PS2()
	{
		ParticleDensity(18.0);
	}
	XBOX()
	{
		ParticleDensity(20.0);
	}
	PC()
	{
		ParticleDensity(50.0);
	}
	ParticleDensityRange(0.0);
	CameraCrossVelocityScale(0.5);
	CameraAxialVelocityScale(1.0);
	AlphaMinMax(0.5, 0.9);
	RotationRange(25);
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
		Tile(2.0,2.0);
		Velocity(0.0,0.0);
		LODDecimation(8);
		MainTexture("fel1_water");
		MinDiffuseColor(32, 40, 32, 188);
		MaxDiffuseColor(128, 130, 128, 188);
		BorderDiffuseColor(160, 160, 160, 255);
		SpecularColor(192, 222, 192, 152);
		SpeckleSpecularColor(200, 200, 200, 150);
		SpeckleAmbientColor(50, 50, 50, 80);
		SpeckleTextures("water_specularmask_",25, 4.0);
		SpeckleTile(5.0, 5.0);
		SpeckleScrollSpeed(0.11,0.11);
		SpeckleCoordShift(5.0,5.0);
		LightAzimAndElev(1.0,0.0);
		OscillationEnable(0);
	}


	// XBOX parameters
	XBOX()
	{
		Tile(2.0,2.0);
		NormalMapTextures("water_normalmap_",16,8.0);
		LODDecimation(1);
		RefractionColor(5, 217, 255, 255);
		ReflectionColor(255,255,255,255);
		UnderwaterColor(61, 124, 144, 128);
		FresnelMinMax(0.3,0.4);
		Velocity(0.01, 0.001);
		OscillationEnable(0);

	}

	// PC parameters
	PC()
	{
		Tile(2.0,2.0);
		MainTexture("fel1_water");
		LODDecimation(1);
		RefractionColor(5, 217, 255, 255);
		ReflectionColor(57,90,138,255);
		UnderwaterColor(61, 124, 144, 128);
		FresnelMinMax(0.3,0.4);
		FarSceneRange(1500)

		NormalMapTextures("water_normalmap_",16,8.0);
		BumpMapTextures("water_bumpmap_",16,8.0);
		SpecularMaskTextures("water_specularmask_",25, 4);
		SpecularMaskTile(3.0, 3.0);
		SpecularMaskScrollSpeed(0.0,0.0);
		Velocity(0.01,0.01);
		OscillationEnable(0);

	}
	
}


Effect("FogCloud")
{
	Enable(1);
	Texture("fx_fluffy.tga");
	Range(30.0, 60.0);
	Color(168, 172, 180, 128);
	Velocity(5.0, 0.0);
	Rotation(0.0);
	Height(10.0);
	ParticleSize(20.0);
	ParticleDensity(30.0);
}



Effect("MotionBlur")
{
	Enable(1);
}

Effect("ScopeBlur")
{
	Enable(1);
}


SunFlare()
{
	Angle(120.000000, 60.000000);
	Color(215, 215, 255);
	Size(5.0);
	FlareOutSize(20.0);
	NumFlareOuts(50);
	InitialFlareOutAlpha(70);
	HaloInnerRing(9.0, 60, 60, 255, 200);
	HaloMiddleRing(20.0, 40, 40, 255, 100);
	HaloOutterRing(40.0, 10, 10, 128, 0);
	SpikeColor(200,200,245,128);
	SpikeSize(16.0);
}

Effect("Shadow")

{

	Enable(1)               
    	BlurEnable(0)         
     	Intensity(0.1)          

}

