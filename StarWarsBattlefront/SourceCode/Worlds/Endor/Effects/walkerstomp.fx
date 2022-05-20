ParticleEmitter("Smoke")
{
	MaxParticles(40.0000,40.0000);
	StartDelay(0.0000,0.0000);
	BurstDelay(0.0000, 0.0000);
	BurstCount(10.0000,10.0000);
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
			PositionX(-1.0000,1.0000);
			PositionY(0.0000,0.5000);
			PositionZ(-0.4000,1.0000);
		}
		Offset()
		{
			PositionX(0.0000,0.0000);
			PositionY(0.0000,0.0000);
			PositionZ(0.0000,0.0000);
		}
		PositionScale(0.5000,0.5000);
		VelocityScale(4.0000,4.0000);
		InheritVelocityFactor(0.0000,0.0000);
		Size(0, 0.5000, 1.0000);
		Hue(0, 56.0000, 56.0000);
		Saturation(0, 45.0000, 45.0000);
		Value(0, 53.0000, 53.0000);
		Alpha(0, 90.0000, 90.0000);
		StartRotation(0, 0.0000, 360.0000);
		RotationVelocity(0, -100.0000, 100.0000);
		FadeInTime(0.0000);
	}
	Transformer()
	{
		LifeTime(1.0000);
		Position()
		{
			LifeTime(1.0000)
			Scale(0.0000);
		}
		Size(0)
		{
			LifeTime(1.0000)
			Scale(3.0000);
		}
		Color(0)
		{
			LifeTime(1.0000)
			Reach(56.0000,45.0000,53.0000,0.0000);
		}
	}
	Geometry()
	{
		BlendMode("NORMAL");
		Type("PARTICLE");
		Texture("whitesmoke");
	}
}
