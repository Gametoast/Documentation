ParticleEmitter("WaterFountain_Add")
{
	MaxParticles(60.0000,60.0000);
	StartDelay(0.0000,0.0000);
	BurstDelay(0.0500, 0.0500);
	BurstCount(1.0000,1.0000);
	MaxLodDist(50.0000);
	MinLodDist(10.0000);
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
			PositionX(-0.0200,0.0200);
			PositionY(0.5000,0.5000);
			PositionZ(-0.0200,0.0200);
		}
		Offset()
		{
			PositionX(-0.0300,0.0300);
			PositionY(0.0000,0.0120);
			PositionZ(-0.0300,0.0300);
		}
		PositionScale(0.0000,0.0000);
		VelocityScale(4.0000,4.1000);
		InheritVelocityFactor(0.0000,0.0000);
		Size(0, 0.2000, 0.3000);
		Red(0, 231.0000, 255.0000);
		Green(0, 147.0000, 169.0000);
		Blue(0, 33.0000, 77.0000);
		Alpha(0, 255.0000, 255.0000);
		StartRotation(0, 0.0000, 360.0000);
		RotationVelocity(0, -40.0000, 40.0000);
		FadeInTime(0.0000);
	}
	Transformer()
	{
		LifeTime(2.5000);
		Position()
		{
			LifeTime(3.7500)
			Accelerate(0.0000, -6.8000, 0.0000);
		}
		Size(0)
		{
			LifeTime(2.5000)
			Scale(2.5000);
		}
		Color(0)
		{
			LifeTime(2.0000)
			Move(0.0000,0.0000,0.0000,0.0000);
			Next()
			{
				LifeTime(0.5000)
				Move(0.0000,0.0000,0.0000,-255.0000);
			}
		}
	}
	Geometry()
	{
		BlendMode("ADDITIVE");
		Type("PARTICLE");
		Texture("com_sfx_dirt2");
	}
	ParticleEmitter("Sparks")
	{
		MaxParticles(60.0000,60.0000);
		StartDelay(0.0000,0.0000);
		BurstDelay(0.0010, 0.0010);
		BurstCount(1.0000,1.0000);
		MaxLodDist(50.0000);
		MinLodDist(10.0000);
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
				PositionX(-0.0240,0.0240);
				PositionY(0.0180,0.0450);
				PositionZ(-0.0240,0.0240);
			}
			Offset()
			{
				PositionX(0.0000,0.0000);
				PositionY(0.0000,0.0000);
				PositionZ(0.0000,0.0000);
			}
			PositionScale(0.1800,0.1800);
			VelocityScale(10.0000,47.5000);
			InheritVelocityFactor(0.0000,0.0000);
			Size(0, 0.0034, 0.0101);
			Red(0, 255.0000, 255.0000);
			Green(0, 184.0000, 184.0000);
			Blue(0, 32.0000, 32.0000);
			Alpha(0, 0.0000, 0.0000);
			StartRotation(0, 0.0000, 0.0000);
			RotationVelocity(0, 0.0000, 0.0000);
			FadeInTime(0.0000);
		}
		Transformer()
		{
			LifeTime(1.2500);
			Position()
			{
				LifeTime(0.9375)
				Accelerate(0.0000, -0.8438, 0.0000);
			}
			Size(0)
			{
				LifeTime(0.2500)
				Scale(1.0000);
			}
			Color(0)
			{
				LifeTime(0.0125)
				Reach(255.0000,244.0000,147.0000,128.0000);
				Next()
				{
					LifeTime(1.0000)
					Reach(242.0000,121.0000,0.0000,128.0000);
					Next()
					{
						LifeTime(0.1250)
						Reach(242.0000,36.0000,0.0000,0.0000);
					}
				}
			}
		}
		Geometry()
		{
			BlendMode("ADDITIVE");
			Type("SPARK");
			SparkLength(0.0500);
			Texture("com_sfx_laser_orange");
		}
	}
}
