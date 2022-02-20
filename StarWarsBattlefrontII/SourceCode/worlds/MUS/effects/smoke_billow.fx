ParticleEmitter("Smoke")
{
	MaxParticles(-1.0000,-1.0000);
	StartDelay(0.0000,0.0000);
	BurstDelay(2.0000, 3.0000);
	BurstCount(1.0000,1.0000);
	MaxLodDist(1000.0000);
	MinLodDist(800.0000);
	BoundingRadius(40.0);
	SoundName("")
	NoRegisterStep();
	Size(1.0000, 1.0000);
	Hue(255.0000, 255.0000);
	Saturation(255.0000, 255.0000);
	Value(255.0000, 255.0000);
	Alpha(255.0000, 255.0000);
	Spawner()
	{
		Spread()
		{
			PositionX(-0.0300,0.0300);
			PositionY(0.4800,0.6400);
			PositionZ(-0.0300,0.0300);
		}
		Offset()
		{
			PositionX(0.0000,0.0000);
			PositionY(0.0000,0.0000);
			PositionZ(0.0000,0.0000);
		}
		PositionScale(0.0000,0.0000);
		VelocityScale(0.2500,0.2500);
		InheritVelocityFactor(0.0000,0.0000);
		Size(0, 1.0000, 1.5000);
		Red(0, 175.0000, 175.0000);
		Green(0, 117.0000, 117.0000);
		Blue(0, 78.0000, 78.0000);
		Alpha(0, 0.0000, 0.0000);
		StartRotation(0, -30.0000, 30.0000);
		RotationVelocity(0, 0.0000, 0.0000);
		FadeInTime(0.0000);
	}
	Transformer()
	{
		LifeTime(60.0000);
		Position()
		{
			LifeTime(60.0000)
			Accelerate(0.3200, -0.0160, 0.0000);
		}
		Size(0)
		{
			LifeTime(60.0000)
			Scale(2.0000);
		}
		Color(0)
		{
			LifeTime(6.0000)
			Move(0.0000,0.0000,0.0000,170.0000);
			Next()
			{
				LifeTime(54.0000)
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
		MaxParticles(-1.0000,-1.0000);
		StartDelay(0.0000,0.0000);
		BurstDelay(2.0000, 3.0000);
		BurstCount(1.0000,1.0000);
		MaxLodDist(1000.0000);
		MinLodDist(800.0000);
		BoundingRadius(5.0);
		SoundName("")
		NoRegisterStep();
		Size(1.0000, 1.0000);
		Hue(255.0000, 255.0000);
		Saturation(255.0000, 255.0000);
		Value(255.0000, 255.0000);
		Alpha(255.0000, 255.0000);
		Spawner()
		{
			Spread()
			{
				PositionX(-0.0500,0.0500);
				PositionY(0.4800,0.6400);
				PositionZ(-0.0500,0.0500);
			}
			Offset()
			{
				PositionX(-0.4800,0.4800);
				PositionY(-0.1600,0.1600);
				PositionZ(-0.4800,0.4800);
			}
			PositionScale(0.0000,0.0000);
			VelocityScale(0.3000,0.3000);
			InheritVelocityFactor(0.0000,0.0000);
			Size(0, 0.7500, 1.3500);
			Red(0, 175.0000, 175.0000);
			Green(0, 117.0000, 117.0000);
			Blue(0, 78.0000, 78.0000);
			Alpha(0, 0.0000, 0.0000);
			StartRotation(0, -40.0000, 40.0000);
			RotationVelocity(0, 0.0000, 0.0000);
			FadeInTime(0.0000);
		}
		Transformer()
		{
			LifeTime(60.0000);
			Position()
			{
				LifeTime(60.0000)
				Accelerate(0.3200, -0.0160, 0.0000);
			}
			Size(0)
			{
				LifeTime(60.0000)
				Scale(2.0000);
			}
			Color(0)
			{
				LifeTime(6.0000)
				Move(0.0000,0.0000,0.0000,170.0000);
				Next()
				{
					LifeTime(54.0000)
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
