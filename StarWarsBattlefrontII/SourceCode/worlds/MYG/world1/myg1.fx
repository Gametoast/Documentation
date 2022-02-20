

Effect("Precipitation")
{
	Enable(1);
	Type("Quads");
	Texture("fx_silt");
	ParticleSize(0.03);
	Color(220, 220, 230);
	Range(15.0);
	Velocity(-0.05);
	VelocityRange(1.25);
	PS2()
	{
		ParticleDensity(50.0);
	}
	XBOX()
	{
		ParticleDensity(500.0);
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

effect("hdr")
{
	enable(1)
}