Effect("ColorControl")
{
	Enable(1);
	WorldBrightness(0.5);
	WorldContrast(0.5);
	WorldSaturation(0.5);
	PC()
	{
		GammaBrightness(0.5);
		GammaContrast(0.5);
		GammaHue(0.5);
		GammaColorBalance(0.5);
	}
	XBOX()
	{
		GammaBrightness(0.5);
		GammaContrast(0.5);
		GammaHue(0.5);
		GammaColorBalance(0.5);
	}

}

Effect("Godray")
{
	Enable(1);
	MaxGodraysInWorld(5000);
	PS2()
	{
		MaxGodraysOnScreen(50);
	}
	PC()
	{
		MaxGodraysOnScreen(10);
	}
	XBOX()
	{
		MaxGodraysOnScreen(10);
	}
	OffsetAngle(0.000000);
	DustVelocity(0.0, -0.1, 0.0);
	MaxViewDistance(150);
	MaxViewDistance(130);
}

Effect("FogCloud")
{
	Enable(1);
	Texture("fluffy");
	Range(85.0, 110.0);
	Color(168, 172, 180, 128);
	Velocity(3.0, 0.0);
	Rotation(0.05);
	Height(16.0);
	ParticleSize(28.0);
	ParticleDensity(90.0);
}

Effect("Blur")
{
	PS2()
	{
		Enable(0);
		MinMaxDepth(0.95,1.0);
	}
	PC()
	{
		Enable(1);
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

Effect("MotionBlur")
{
	Enable(1);
}

Effect("ScopeBlur")
{
	Enable(1);
}

Effect("WorldShadowMap")
{
	Enable(1);
	Texture("end_canopy");
	LightName("sun");
	TextureScale(70.0);	
	AnimationFrequency(0.1);
	AnimationAmplitude0(2.0, 0.0);
	AnimationAmplitude1(0.05,-0.1);
}

SunFlare()
{
	Angle(120.000000, -30.000000);
	Color(255, 255, 255);
	Size(3.0);
	FlareOutSize(20.0);
	NumFlareOuts(20);
	InitialFlareOutAlpha(70);
	HaloInnerRing(0.0, 255, 255, 255, 255);
	HaloMiddleRing(10.0, 255, 200, 0, 255);
	HaloOutterRing(40.0, 255, 127, 0, 0);
	SpikeColor(230,230,0,128);
	SpikeSize(9.0);
}


