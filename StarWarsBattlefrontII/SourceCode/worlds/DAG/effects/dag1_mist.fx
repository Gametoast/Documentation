ParticleEmitter("DryIce")
{
	MaxParticles(-1.0000,-1.0000);
	StartDelay(0.0000,0.0000);
	BurstDelay(1.5000, 1.5000);
	BurstCount(1.0000,1.0000);
	MaxLodDist(1000.0000);
	MinLodDist(800.0000);
	BoundingRadius(30.0);
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
			PositionX(-0.1000,0.1000);
			PositionY(0.0000,0.0000);
			PositionZ(-0.1000,0.1000);
		}
		Offset()
		{
			PositionX(-8.0000,8.0000);
			PositionY(0.0000,0.0000);
			PositionZ(-6.0000,-6.0000);
		}
		PositionScale(0.0000,0.0000);
		VelocityScale(0.0000,0.0000);
		InheritVelocityFactor(0.0000,0.0000);
		Size(0, 2.0000, 2.5000);
		Red(0, 255.0000, 255.0000);
		Green(0, 255.0000, 255.0000);
		Blue(0, 255.0000, 255.0000);
		Alpha(0, 0.0000, 0.0000);
		StartRotation(0, 0.0000, 0.0000);
		RotationVelocity(0, 0.0000, 0.0000);
		FadeInTime(0.0000);
	}
	Transformer()
	{
		LifeTime(8.0000);
		Position()
		{
			LifeTime(8.0000)
		}
		Size(0)
		{
			LifeTime(1.0000)
			Scale(2.0000);
			Next()
			{
				LifeTime(2.0000)
				Scale(2.0000);
			}
		}
		Color(0)
		{
			LifeTime(1.0000)
			Move(0.0000,0.0000,0.0000,160.0000);
			Next()
			{
				LifeTime(7.0000)
				Move(0.0000,0.0000,0.0000,-160.0000);
			}
		}
	}
	Geometry()
	{
		BlendMode("NORMAL");
		Type("PARTICLE");
		Texture("dag1_mist");
	}
	ParticleEmitter("DryIce")
	{
		MaxParticles(-1.0000,-1.0000);
		StartDelay(0.0000,0.0000);
		BurstDelay(1.5000, 1.5000);
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
				PositionX(-0.1000,0.1000);
				PositionY(0.0000,0.0000);
				PositionZ(-0.1000,0.1000);
			}
			Offset()
			{
				PositionX(-8.0000,8.0000);
				PositionY(0.0000,0.0000);
				PositionZ(-2.0000,-2.0000);
			}
			PositionScale(0.0000,0.0000);
			VelocityScale(0.0000,0.0000);
			InheritVelocityFactor(0.0000,0.0000);
			Size(0, 2.0000, 2.5000);
			Red(0, 255.0000, 255.0000);
			Green(0, 255.0000, 255.0000);
			Blue(0, 255.0000, 255.0000);
			Alpha(0, 0.0000, 0.0000);
			StartRotation(0, 0.0000, 0.0000);
			RotationVelocity(0, 0.0000, 0.0000);
			FadeInTime(0.0000);
		}
		Transformer()
		{
			LifeTime(8.0000);
			Position()
			{
				LifeTime(8.0000)
			}
			Size(0)
			{
				LifeTime(1.0000)
				Scale(2.0000);
				Next()
				{
					LifeTime(2.0000)
					Scale(2.0000);
				}
			}
			Color(0)
			{
				LifeTime(1.0000)
				Move(0.0000,0.0000,0.0000,160.0000);
				Next()
				{
					LifeTime(7.0000)
					Move(0.0000,0.0000,0.0000,-160.0000);
				}
			}
		}
		Geometry()
		{
			BlendMode("NORMAL");
			Type("PARTICLE");
			Texture("dag1_mist");
		}
		ParticleEmitter("DryIce")
		{
			MaxParticles(-1.0000,-1.0000);
			StartDelay(0.0000,0.0000);
			BurstDelay(1.5000, 1.5000);
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
					PositionX(-0.1000,0.1000);
					PositionY(0.0000,0.0000);
					PositionZ(-0.1000,0.1000);
				}
				Offset()
				{
					PositionX(-8.0000,8.0000);
					PositionY(0.0000,0.0000);
					PositionZ(2.0000,2.0000);
				}
				PositionScale(0.0000,0.0000);
				VelocityScale(0.0000,0.0000);
				InheritVelocityFactor(0.0000,0.0000);
				Size(0, 2.0000, 2.5000);
				Red(0, 255.0000, 255.0000);
				Green(0, 255.0000, 255.0000);
				Blue(0, 255.0000, 255.0000);
				Alpha(0, 0.0000, 0.0000);
				StartRotation(0, 0.0000, 0.0000);
				RotationVelocity(0, 0.0000, 0.0000);
				FadeInTime(0.0000);
			}
			Transformer()
			{
				LifeTime(8.0000);
				Position()
				{
					LifeTime(8.0000)
				}
				Size(0)
				{
					LifeTime(1.0000)
					Scale(2.0000);
					Next()
					{
						LifeTime(2.0000)
						Scale(2.0000);
					}
				}
				Color(0)
				{
					LifeTime(1.0000)
					Move(0.0000,0.0000,0.0000,160.0000);
					Next()
					{
						LifeTime(7.0000)
						Move(0.0000,0.0000,0.0000,-160.0000);
					}
				}
			}
			Geometry()
			{
				BlendMode("NORMAL");
				Type("PARTICLE");
				Texture("dag1_mist");
			}
			ParticleEmitter("DryIce")
			{
				MaxParticles(-1.0000,-1.0000);
				StartDelay(0.0000,0.0000);
				BurstDelay(1.5000, 1.5000);
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
						PositionX(-0.1000,0.1000);
						PositionY(0.0000,0.0000);
						PositionZ(-0.1000,0.1000);
					}
					Offset()
					{
						PositionX(-8.0000,8.0000);
						PositionY(0.0000,0.0000);
						PositionZ(6.0000,6.0000);
					}
					PositionScale(0.0000,0.0000);
					VelocityScale(0.0000,0.0000);
					InheritVelocityFactor(0.0000,0.0000);
					Size(0, 2.0000, 2.5000);
					Red(0, 255.0000, 255.0000);
					Green(0, 255.0000, 255.0000);
					Blue(0, 255.0000, 255.0000);
					Alpha(0, 0.0000, 0.0000);
					StartRotation(0, 0.0000, 0.0000);
					RotationVelocity(0, 0.0000, 0.0000);
					FadeInTime(0.0000);
				}
				Transformer()
				{
					LifeTime(8.0000);
					Position()
					{
						LifeTime(8.0000)
					}
					Size(0)
					{
						LifeTime(1.0000)
						Scale(2.0000);
						Next()
						{
							LifeTime(2.0000)
							Scale(2.0000);
						}
					}
					Color(0)
					{
						LifeTime(1.0000)
						Move(0.0000,0.0000,0.0000,160.0000);
						Next()
						{
							LifeTime(7.0000)
							Move(0.0000,0.0000,0.0000,-160.0000);
						}
					}
				}
				Geometry()
				{
					BlendMode("NORMAL");
					Type("PARTICLE");
					Texture("dag1_mist");
				}
			}
		}
	}
}
