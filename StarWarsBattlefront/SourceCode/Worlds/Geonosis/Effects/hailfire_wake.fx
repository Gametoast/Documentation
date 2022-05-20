ParticleEmitter("Hailfire_Wake")
{
	MaxParticles(-1.0000,-1.0000);
	StartDelay(0.0000,0.0000);
	BurstDelay(0.0300, 0.0500);
	BurstCount(3.0000,3.0000);
	MaxLodDist(50.0000);
	MinLodDist(10.0000);
	SoundName("")
	Size(1.0000, 1.0000);
	Hue(255.0000, 255.0000);
	Saturation(255.0000, 255.0000);
	Value(255.0000, 255.0000);
	Alpha(255.0000, 255.0000);
	Spawner()
	{
		Spread()
		{
			PositionX(-0.2000,0.2000);
			PositionY(0.0000,0.3000);
			PositionZ(-0.2000,0.2000);
		}
		Offset()
		{
			PositionX(0.0000,0.0000);
			PositionY(0.0000,0.0000);
			PositionZ(0.0000,0.0000);
		}
		PositionScale(0.5000,0.5000);
		VelocityScale(5.0000,5.0000);
		InheritVelocityFactor(0.0000,0.0000);
		Size(0, 0.7000, 0.9000);
		Hue(0, 14.0000, 18.0000);
		Saturation(0, 160.0000, 200.0000);
		Value(0, 90.0000, 130.0000);
		Alpha(0, 30.0000, 80.0000);
		StartRotation(0, 0.0000, 360.0000);
		RotationVelocity(0, -100.0000, 100.0000);
		FadeInTime(0.0000);
	}
	Transformer()
	{
		LifeTime(2.0000);
		Position()
		{
			LifeTime(1.5000)
			Scale(0.0000);
		}
		Size(0)
		{
			LifeTime(2.0000)
			Scale(2.0000);
		}
		Color(0)
		{
			LifeTime(2.0000)
			Reach(16.0000,180.0000,110.0000,0.0000);
		}
	}
	Geometry()
	{
		BlendMode("NORMAL");
		Type("PARTICLE");
		Texture("whitesmoke");
	}
}
