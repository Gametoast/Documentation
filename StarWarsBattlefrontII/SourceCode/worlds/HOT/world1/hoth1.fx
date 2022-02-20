Effect("ColorControl")
{
	Enable(0);
	WorldBrightness(0.46);
	WorldContrast(0.48);
	WorldSaturation(0.65);
}

Effect("Wind")
{
	Enable(1);
	Velocity(4.0, 0.3);
	VelocityRange(1.0);
	VelocityChangeRate(0.2);
	//Effect("rainsplash");
	//GroundEffectsPerSec(20);
	//GroundEffectSpread(10);
}

Effect("Precipitation")
{
	Enable(1);
	Type("Quads");
	Texture("fx_snow");
	ParticleSize(0.015);
	Color(255, 255, 255);
	Range(15.0);
	Velocity(2.0);
	VelocityRange(0.8);
	PS2()
	{
		ParticleDensity(80.0);
	}
	XBOX()
	{
		ParticleDensity(100.0);
	}
	PC()
	{
		ParticleDensity(100.0);
	}
	ParticleDensityRange(0.0);
	CameraCrossVelocityScale(1.0);
	CameraAxialVelocityScale(1.0);
	AlphaMinMax(0.3, 0.45);
	RotationRange(2.0);
}

Effect("Godray")
{
	Enable(0);

	MaxGodraysInWorld(10);
	MaxGodraysOnScreen(4);

	MaxViewDistance(80.0);
	FadeViewDistance(70.0);
	MaxLength(40.0);
	OffsetAngle(0.0);

	MinRaysPerGodray(3);
	MaxRaysPerGodray(6);
	RadiusForMaxRays(2.0);

	//Texture("fx_godray");
	TextureScale(0.75, 0.1875);
	TextureVelocity(0.0, -0.1, 0.0);
	TextureJitterSpeed(0.05);
}

Effect("FogCloud")
{
	Enable(0);
	//Texture("whitedust");
	Range(90.0, 120.0);
	Color(168, 172, 180, 128);
	Velocity(5.0, 0.0);
	Rotation(0.1);
	Height(16.0);
	ParticleSize(28.0);
	ParticleDensity(60.0);
}

Effect("Blur")
{
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
		ConstantBlend(0.3)
		DownSizeFactor(0.2500)
	}
}

effect("hdr")
{
	enable(1)
	DownSizeFactor(0.5)
	NumBloomPasses(4)
	MaxTotalWeight(1.05)
	GlowThreshold(0.7)
	GlowFactor(1.0)

}

Effect("WorldShadowMap")
{
	PS2()
	{
		Enable(0);
		//Texture("hoth_shadow");
		TextureScale(200.0);
		AnimationFrequency(0.1);
		AnimationAmplitude0(2.0, 0.0);
		AnimationAmplitude1(0.05,-0.1);
	}
}

SunFlare()
{
	Angle(115.000000, -20.000000);
	Color(255, 255, 255);
	Size(5.0);
	FlareOutSize(20.0);
	NumFlareOuts(40);
	InitialFlareOutAlpha(70);
	HaloInnerRing(0.0, 255, 255, 255, 255);
	HaloMiddleRing(10.0, 255, 200, 0, 255);
	HaloOutterRing(30.0, 255, 127, 0, 0);
	SpikeColor(230,230,0,128);
	SpikeSize(20.0);
}
