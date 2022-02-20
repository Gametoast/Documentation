

Effect("Precipitation")
{
	Enable(1);
	Type("Quads");
	Texture("fx_ember");
	ParticleSize(0.025);
	Color(255, 255, 255);
	Range(15.0);
	Velocity(-0.3);
	VelocityRange(1);
	PS2()
	{
		ParticleDensity(20.0);
	}
	XBOX()
	{
		ParticleDensity(20.0);
	}
	PC()
	{
		ParticleDensity(20.0);
	}
	ParticleDensityRange(0.0);
	CameraCrossVelocityScale(0.5);
	CameraAxialVelocityScale(1.0);
	AlphaMinMax(0.5, 0.9);
	RotationRange(25);
}

Effect("MotionBlur")
{
	Enable(1);
}

Effect("ScopeBlur")
{
	Enable(1);
}
Effect("hdr")
{
	Enable(1)
}



