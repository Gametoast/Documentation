ParticleEmitter("FlyerSpray")
{
	MaxParticles(30.0000,30.0000);
	StartDelay(0.0000,0.0000);
	BurstDelay(0.1000, 0.1000);
	BurstCount(5.0000,5.0000);
	MaxLodDist(50.0000);
	MinLodDist(10.0000);
	BoundingRadius(5.0);
	SoundName("")
	Size(1.0000, 1.0000);
	Red(255.0000, 255.0000);
	Green(255.0000, 255.0000);
	Blue(255.0000, 255.0000);
	Alpha(255.0000, 255.0000);
	Spawner()
	{
		Spread()
		{
			PositionX(-1.0000,1.0000);
			PositionY(-0.0300,0.1000);
			PositionZ(-1.0000,1.0000);
		}
		Offset()
		{
			PositionX(0.0000,0.0000);
			PositionY(0.0000,1.0000);
			PositionZ(0.0000,0.0000);
		}
		PositionScale(1.0000,1.0000);
		VelocityScale(6.0000,6.0000);
		InheritVelocityFactor(0.0000,0.0000);
		Size(0, 4.0000, 5.0000);
		Red(0, 255.0000, 255.0000);
		Green(0, 252.0000, 252.0000);
		Blue(0, 249.0000, 249.0000);
		Alpha(0, 0.0000, 0.0000);
		StartRotation(0, 0.0000, 360.0000);
		RotationVelocity(0, -100.0000, 100.0000);
		FadeInTime(0.0000);
	}
	Transformer()
	{
		LifeTime(1.0000);
		Position()
		{
			LifeTime(2.0000)
			Accelerate(0.0000, 5.0000, 0.0000);
		}
		Size(0)
		{
			LifeTime(3.0000)
			Scale(4.0000);
		}
		Color(0)
		{
			LifeTime(0.1000)
			Move(0.0000,0.0000,0.0000,32.0000);
			Next()
			{
				LifeTime(0.9000)
				Move(0.0000,0.0000,0.0000,-32.0000);
			}
		}
	}
	Geometry()
	{
		BlendMode("NORMAL");
		Type("PARTICLE");
		Texture("com_sfx_smoke4");
	}
}
