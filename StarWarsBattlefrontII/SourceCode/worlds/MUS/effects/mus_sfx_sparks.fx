ParticleEmitter("Sparks")
{
	MaxParticles(20.0000,20.0000);
	StartDelay(0.0000,0.0000);
	BurstDelay(0.0100, 0.0100);
	BurstCount(1.0000,1.0000);
	MaxLodDist(1100.0000);
	MinLodDist(1000.0000);
	BoundingRadius(5.0);
	SoundName("com_amb_spark_c")
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
			PositionX(-1.0000,1.0000);
			PositionY(-7.0000,-6.0000);
			PositionZ(-1.0000,1.0000);
		}
		Offset()
		{
			PositionX(-0.5000,0.5000);
			PositionY(0.0000,0.0000);
			PositionZ(-0.1000,0.1000);
		}
		PositionScale(0.0000,0.0000);
		VelocityScale(1.0000,2.5000);
		InheritVelocityFactor(0.0000,0.0000);
		Size(0, 0.0100, 0.0300);
		Red(0, 255.0000, 255.0000);
		Green(0, 200.0000, 200.0000);
		Blue(0, 100.0000, 100.0000);
		Alpha(0, 0.0000, 0.0000);
		StartRotation(0, 0.0000, 0.0000);
		RotationVelocity(0, 0.0000, 0.0000);
		FadeInTime(0.0000);
	}
	Transformer()
	{
		LifeTime(1.0000);
		Position()
		{
			LifeTime(1.0000)
		}
		Size(0)
		{
			LifeTime(2.0000)
			Scale(2.0000);
		}
		Color(0)
		{
			LifeTime(0.0100)
			Move(0.0000,0.0000,0.0000,255.0000);
			Next()
			{
				LifeTime(1.9900)
				Move(0.0000,0.0000,0.0000,0.0000);
			}
		}
	}
	Geometry()
	{
		BlendMode("ADDITIVE");
		Type("SPARK");
		SparkLength(0.0300);
		Texture("com_sfx_laser_orange");
		ParticleEmitter("Smoke")
		{
			MaxParticles(15.0000,15.0000);
			StartDelay(0.0000,0.0000);
			BurstDelay(0.1000, 0.2000);
			BurstCount(1.0000,1.0000);
			MaxLodDist(1000.0000);
			MinLodDist(800.0000);
			BoundingRadius(5.0);
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
					PositionY(-1.0000,1.0000);
					PositionZ(-1.0000,1.0000);
				}
				Offset()
				{
					PositionX(0.0000,0.0000);
					PositionY(0.0000,0.0000);
					PositionZ(0.0000,0.0000);
				}
				PositionScale(0.0000,0.0000);
				VelocityScale(0.1000,0.1000);
				InheritVelocityFactor(0.0000,0.0000);
				Size(0, 0.6000, 0.9000);
				Red(0, 240.0000, 255.0000);
				Green(0, 240.0000, 255.0000);
				Blue(0, 240.0000, 255.0000);
				Alpha(0, 0.0000, 0.0000);
				StartRotation(0, -50.0000, 0.0000);
				RotationVelocity(0, -50.0000, 50.0000);
				FadeInTime(0.0000);
			}
			Transformer()
			{
				LifeTime(10.0000);
				Position()
				{
					LifeTime(3.0000)
				}
				Size(0)
				{
					LifeTime(3.0000)
					Scale(3.0000);
				}
				Color(0)
				{
					LifeTime(0.5000)
					Move(255.0000,255.0000,255.0000,255.0000);
					Next()
					{
						LifeTime(10.0000)
						Reach(255.0000,255.0000,255.0000,255.0000);
						Next()
						{
							LifeTime(0.0000)
							Reach(255.0000,255.0000,255.0000,0.0000);
						}
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
}
