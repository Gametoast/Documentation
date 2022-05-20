ParticleEmitter("Hailfire_Wake")
{
	MaxParticles(-1.0000,-1.0000);
	StartDelay(0.0000,0.0000);
	BurstDelay(0.1000, 0.1000);
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
			PositionX(0.0000,0.0000);
			PositionY(0.0000,0.8000);
			PositionZ(0.0000,0.0000);
		}
		Offset()
		{
			PositionX(0.0000,0.0000);
			PositionY(0.0000,0.0000);
			PositionZ(0.0000,0.0000);
		}
		PositionScale(0.5000,0.5000);
		VelocityScale(1.0000,1.0000);
		InheritVelocityFactor(0.0000,0.0000);
		Size(0, 0.3000, 0.5000);
		Red(0, 100.0000, 111.0000);
		Green(0, 85.0000, 123.0000);
		Blue(0, 60.0000, 100.0000);
		Alpha(0, 16.0000, 32.0000);
		StartRotation(0, 0.0000, 360.0000);
		RotationVelocity(0, -100.0000, 100.0000);
		FadeInTime(0.0000);
	}
	Transformer()
	{
		LifeTime(0.5000);
		Position()
		{
			LifeTime(1.5000)
			Scale(0.0000);
		}
		Size(0)
		{
			LifeTime(0.5000)
			Scale(3.0000);
		}
		Color(0)
		{
			LifeTime(0.5000)
			Move(0.0000,0.0000,0.0000,-32.0000);
		}
	}
	Geometry()
	{
		BlendMode("NORMAL");
		Type("PARTICLE");
		Texture("whitesmoke");
	}
	ParticleEmitter("Flare")
	{
		MaxParticles(-1.0000,-1.0000);
		StartDelay(0.0000,0.0000);
		BurstDelay(0.1000, 0.2000);
		BurstCount(1.0000,1.0000);
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
				PositionX(-0.5000,0.5000);
				PositionY(0.5000,2.0000);
				PositionZ(-0.5000,0.5000);
			}
			Offset()
			{
				PositionX(0.0000,0.0000);
				PositionY(0.0000,0.0000);
				PositionZ(0.0000,0.0000);
			}
			PositionScale(0.0000,0.0000);
			VelocityScale(1.0000,3.0000);
			InheritVelocityFactor(0.0000,0.0000);
			Size(0, 0.2000, 0.4000);
			Red(0, 54.0000, 86.0000);
			Green(0, 52.0000, 87.0000);
			Blue(0, 31.0000, 51.0000);
			Alpha(0, 0.0000, 0.0000);
			StartRotation(0, 0.0000, 360.0000);
			RotationVelocity(0, 0.0000, 0.0000);
			FadeInTime(0.0000);
		}
		Transformer()
		{
			LifeTime(0.4000);
			Position()
			{
				LifeTime(0.4000)
				Accelerate(0.0000, -7.0000, 0.0000);
			}
			Size(0)
			{
				LifeTime(0.2000)
				Scale(1.5000);
			}
			Color(0)
			{
				LifeTime(0.1000)
				Reach(255.0000,255.0000,200.0000,128.0000);
				Next()
				{
					LifeTime(0.3000)
					Reach(255.0000,255.0000,200.0000,0.0000);
				}
			}
		}
		Geometry()
		{
			BlendMode("NORMAL");
			Type("PARTICLE");
			Texture("dirt");
		}
	}
}
