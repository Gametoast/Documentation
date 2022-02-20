ParticleEmitter("WaterFountain_Add")
{
	MaxParticles(75.0000,75.0000);
	StartDelay(0.0000,0.0000);
	BurstDelay(0.0500, 0.0500);
	BurstCount(3.0000,4.0000);
	MaxLodDist(1000.0000);
	MinLodDist(800.0000);
	BoundingRadius(25.0);
	SoundName("mus_amb_lava_exp")
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
			PositionX(-0.1000,0.1000);
			PositionY(1.2500,1.5000);
			PositionZ(-0.1000,0.1000);
		}
		Offset()
		{
			PositionX(-0.0750,0.0750);
			PositionY(0.0000,0.0300);
			PositionZ(-0.0750,0.0750);
		}
		PositionScale(0.0000,0.0000);
		VelocityScale(15.0000,15.0000);
		InheritVelocityFactor(0.0000,0.0000);
		Size(0, 2.5000, 3.5000);
		Red(0, 230.0000, 235.0000);
		Green(0, 119.0000, 165.0000);
		Blue(0, 61.0000, 61.0000);
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
			Accelerate(0.0000, -75.0000, 0.0000);
		}
		Size(0)
		{
			LifeTime(3.5000)
			Scale(2.0000);
		}
		Color(0)
		{
			LifeTime(2.0000)
			Move(0.0000,0.0000,0.0000,0.0000);
		}
	}
	Geometry()
	{
		BlendMode("ADDITIVE");
		Type("PARTICLE");
		Texture("com_sfx_dirt2");
	}
	ParticleEmitter("Foam")
	{
		MaxParticles(60.0000,60.0000);
		StartDelay(0.0000,0.0000);
		BurstDelay(0.1000, 0.1000);
		BurstCount(2.0000,2.0000);
		MaxLodDist(1000.0000);
		MinLodDist(800.0000);
		BoundingRadius(25.0);
		SoundName("")
		NoRegisterStep();
		Size(1.0000, 1.0000);
		Hue(255.0000, 255.0000);
		Saturation(255.0000, 255.0000);
		Value(255.0000, 255.0000);
		Alpha(255.0000, 255.0000);
		Spawner()
		{
			Circle()
			{
				PositionX(-1.0000,1.0000);
				PositionY(0.0000,0.0000);
				PositionZ(-1.0000,1.0000);
			}
			Offset()
			{
				PositionX(0.0000,0.0000);
				PositionY(0.0000,0.0000);
				PositionZ(0.0000,0.0000);
			}
			PositionScale(0.0000,0.0000);
			VelocityScale(0.1000,0.3500);
			InheritVelocityFactor(0.0000,0.0000);
			Size(0, 1.5000, 2.5000);
			Red(0, 128.0000, 255.0000);
			Green(0, 0.0000, 128.0000);
			Blue(0, 0.0000, 64.0000);
			Alpha(0, 0.0000, 0.0000);
			StartRotation(0, 4.0000, 4.9000);
			RotationVelocity(0, 0.0000, 0.0000);
			FadeInTime(0.0000);
		}
		Transformer()
		{
			LifeTime(2.0000);
			Position()
			{
				LifeTime(0.2000)
			}
			Size(0)
			{
				LifeTime(2.0000)
				Scale(3.0000);
			}
			Color(0)
			{
				LifeTime(0.2500)
				Move(0.0000,0.0000,0.0000,128.0000);
				Next()
				{
					LifeTime(1.7500)
					Move(0.0000,0.0000,0.0000,-128.0000);
				}
			}
		}
		Geometry()
		{
			BlendMode("ADDITIVE");
			Type("BILLBOARD");
			Texture("com_sfx_waterfoam1");
		}
		ParticleEmitter("Sparks")
		{
			MaxParticles(60.0000,60.0000);
			StartDelay(0.0000,0.0000);
			BurstDelay(0.0010, 0.0010);
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
					PositionX(-1.0000,1.0000);
					PositionY(0.0000,1.0000);
					PositionZ(-1.0000,1.0000);
				}
				Offset()
				{
					PositionX(0.0000,0.0000);
					PositionY(0.0000,0.0000);
					PositionZ(0.0000,0.0000);
				}
				PositionScale(0.1800,0.1800);
				VelocityScale(5.0000,20.0000);
				InheritVelocityFactor(0.0000,0.0000);
				Size(0, 0.0250, 0.0260);
				Red(0, 255.0000, 255.0000);
				Green(0, 184.0000, 184.0000);
				Blue(0, 32.0000, 32.0000);
				Alpha(0, 128.0000, 255.0000);
				StartRotation(0, 0.0000, 0.0000);
				RotationVelocity(0, 0.0000, 0.0000);
				FadeInTime(0.0000);
			}
			Transformer()
			{
				LifeTime(3.0000);
				Position()
				{
					LifeTime(3.0000)
					Accelerate(0.0000, -30.0000, 0.0000);
				}
				Size(0)
				{
					LifeTime(0.2500)
					Scale(1.0000);
				}
				Color(0)
				{
					LifeTime(2.0000)
					Move(0.0000,0.0000,0.0000,0.0000);
					Next()
					{
						LifeTime(1.0000)
						Move(0.0000,0.0000,0.0000,-255.0000);
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
			ParticleEmitter("WaterFountain")
			{
				MaxParticles(20.0000,20.0000);
				StartDelay(0.0000,0.0000);
				BurstDelay(0.0750, 0.0750);
				BurstCount(1.0000,1.0000);
				MaxLodDist(50.0000);
				MinLodDist(10.0000);
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
						PositionX(-0.2500,0.2500);
						PositionY(2.0000,4.0000);
						PositionZ(-0.2500,0.2500);
					}
					Offset()
					{
						PositionX(-0.2500,0.2500);
						PositionY(0.0000,0.1000);
						PositionZ(-0.2500,0.2500);
					}
					PositionScale(0.0000,0.0000);
					VelocityScale(3.2500,3.2500);
					InheritVelocityFactor(0.0000,0.0000);
					Size(0, 2.0000, 3.0000);
					Red(0, 230.0000, 235.0000);
					Green(0, 119.0000, 165.0000);
					Blue(0, 61.0000, 61.0000);
					Alpha(0, 255.0000, 255.0000);
					StartRotation(0, 0.0000, 360.0000);
					RotationVelocity(0, -10.0000, 10.0000);
					FadeInTime(0.0000);
				}
				Transformer()
				{
					LifeTime(1.7500);
					Position()
					{
						LifeTime(3.0000)
						Accelerate(0.0000, -45.0000, 0.0000);
					}
					Size(0)
					{
						LifeTime(3.0000)
						Scale(5.0000);
					}
					Color(0)
					{
						LifeTime(1.7500)
						Move(20.0000,0.0000,0.0000,0.0000);
					}
				}
				Geometry()
				{
					BlendMode("ADDITIVE");
					Type("PARTICLE");
					Texture("com_sfx_dirt2");
				}
			}
		}
	}
}
