ParticleEmitter("Smoke")
{
	MaxParticles(10000.0000,10000.0000);
	StartDelay(0.0000,0.0000);
	BurstDelay(0.2000, 0.4000);
	BurstCount(1.0000,1.0000);
	MaxLodDist(1000.0000);
	MinLodDist(800.0000);
	BoundingRadius(40.0);
	Size(1.0000, 1.0000);
	Hue(255.0000, 255.0000);
	Saturation(255.0000, 255.0000);
	Value(255.0000, 255.0000);
	Alpha(255.0000, 255.0000);
	Spawner()
	{
		Spread()
		{
			PositionX(-0.4000,0.4000);
			PositionY(3.0000,4.0000);
			PositionZ(-0.4000,0.4000);
		}
		Offset()
		{
			PositionX(0.0000,0.0000);
			PositionY(0.0000,0.0000);
			PositionZ(0.0000,0.0000);
		}
		PositionScale(0.0000,0.0000);
		VelocityScale(1.5000,1.5000);
		InheritVelocityFactor(0.0000,0.0000);
		Size(0, 5.0000, 7.7500);
		Red(0, 175.0000, 175.0000);
		Green(0, 117.0000, 117.0000);
		Blue(0, 78.0000, 78.0000);
		Alpha(0, 0.0000, 0.0000);
		StartRotation(0, -30.0000, 30.0000);
		RotationVelocity(0, -10.0000, 10.0000);
		FadeInTime(0.0000);
	}
	Transformer()
	{
		LifeTime(10.0000);
		Position()
		{
			LifeTime(3.0000)
			Accelerate(2.0000, -0.1000, 0.0000);
		}
		Size(0)
		{
			LifeTime(10.0000)
			Scale(3.0000);
		}
		Color(0)
		{
			LifeTime(1.0000)
			Move(0.0000,0.0000,0.0000,170.0000);
			Next()
			{
				LifeTime(9.0000)
				Reach(175.0000,117.0000,78.0000,0.0000);
			}
		}
	}
	Geometry()
	{
		BlendMode("NORMAL");
		Type("PARTICLE");
		Texture("underlitesmoke2");
	}
	ParticleEmitter("Smoke")
	{
		MaxParticles(10000.0000,10000.0000);
		StartDelay(0.0000,0.0000);
		BurstDelay(0.2000, 0.4000);
		BurstCount(1.0000,1.0000);
		MaxLodDist(1000.0000);
		MinLodDist(800.0000);
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
				PositionY(3.0000,4.0000);
				PositionZ(-1.0000,1.0000);
			}
			Offset()
			{
				PositionX(-3.0000,3.0000);
				PositionY(-1.0000,1.0000);
				PositionZ(-3.0000,3.0000);
			}
			PositionScale(0.0000,0.0000);
			VelocityScale(1.5000,1.5000);
			InheritVelocityFactor(0.0000,0.0000);
			Size(0, 2.0000, 4.7500);
			Red(0, 175.0000, 175.0000);
			Green(0, 117.0000, 117.0000);
			Blue(0, 78.0000, 78.0000);
			Alpha(0, 0.0000, 0.0000);
			StartRotation(0, -30.0000, 30.0000);
			RotationVelocity(0, -10.0000, 10.0000);
			FadeInTime(0.0000);
		}
		Transformer()
		{
			LifeTime(10.0000);
			Position()
			{
				LifeTime(3.0000)
				Accelerate(2.0000, -0.1000, 0.0000);
			}
			Size(0)
			{
				LifeTime(10.0000)
				Scale(4.0000);
			}
			Color(0)
			{
				LifeTime(1.0000)
				Move(0.0000,0.0000,0.0000,170.0000);
				Next()
				{
					LifeTime(9.0000)
					Reach(175.0000,117.0000,78.0000,0.0000);
				}
			}
		}
		Geometry()
		{
			BlendMode("NORMAL");
			Type("PARTICLE");
			Texture("underlitesmoke2");
		}
	}
}
