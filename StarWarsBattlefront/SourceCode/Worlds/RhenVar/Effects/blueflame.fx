ParticleEmitter("BlackSmoke")
{
	MaxParticles(20000.0000,20000.0000);
	StartDelay(0.0000,0.0000);
	BurstDelay(0.5000, 0.5000);
	BurstCount(1.0000,1.0000);
	MaxLodDist(1000.0000);
	MinLodDist(800.0000);
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
			PositionX(-0.1000,0.1000);
			PositionY(0.2000,0.5000);
			PositionZ(-0.1000,0.1000);
		}
		Offset()
		{
			PositionX(-0.5000,0.5000);
			PositionY(1.0000,1.5000);
			PositionZ(-0.5000,0.5000);
		}
		PositionScale(4.0000,4.0000);
		VelocityScale(0.5000,1.0000);
		InheritVelocityFactor(0.0000,0.0000);
		Size(0, 1.6000, 3.6000);
		Red(0, 10.0000, 10.0000);
		Green(0, 50.0000, 50.0000);
		Blue(0, 200.0000, 200.0000);
		Alpha(0, 0.0000, 0.0000);
		StartRotation(0, -70.0000, 0.0000);
		RotationVelocity(0, -40.0000, 0.0000);
		FadeInTime(0.0000);
	}
	Transformer()
	{
		LifeTime(2.0000);
		Position()
		{
			LifeTime(2.0000)
			Accelerate(0.0000, 5.0000, 0.0000);
		}
		Size(0)
		{
			LifeTime(2.0000)
			Scale(3.0000);
		}
		Color(0)
		{
			LifeTime(0.5000)
			Reach(10.0000,50.0000,200.0000,180.0000);
			Next()
			{
				LifeTime(1.5000)
				Reach(0.0000,0.0000,0.0000,0.0000);
			}
		}
	}
	Geometry()
	{
		BlendMode("ADDITIVE");
		Type("PARTICLE");
		Texture("underlitesmoke1");
	}
	ParticleEmitter("Embers")
	{
		MaxParticles(-1.0000,-1.0000);
		StartDelay(0.0000,0.0000);
		BurstDelay(0.1000, 0.3000);
		BurstCount(1.0000,1.5500);
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
				PositionX(-0.3000,0.3000);
				PositionY(1.0000,2.5000);
				PositionZ(-0.3000,0.3000);
			}
			Offset()
			{
				PositionX(-1.0000,1.0000);
				PositionY(0.0000,0.5000);
				PositionZ(-1.0000,1.0000);
			}
			PositionScale(0.0000,0.3000);
			VelocityScale(0.2000,0.8000);
			InheritVelocityFactor(0.0000,0.0000);
			Size(0, 0.0800, 0.1800);
			Red(0, 200.0000, 200.0000);
			Green(0, 200.0000, 200.0000);
			Blue(0, 255.0000, 255.0000);
			Alpha(0, 0.0000, 0.0000);
			StartRotation(0, 0.0000, 360.0000);
			RotationVelocity(0, -20.0000, 20.0000);
			FadeInTime(0.0000);
		}
		Transformer()
		{
			LifeTime(6.0000);
			Position()
			{
				LifeTime(6.0000)
				Accelerate(0.0000, 4.0000, 0.0000);
			}
			Size(0)
			{
				LifeTime(6.0000)
				Scale(0.0500);
			}
			Color(0)
			{
				LifeTime(0.5000)
				Move(0.0000,0.0000,255.0000,255.0000);
				Next()
				{
					LifeTime(5.5000)
					Reach(0.0000,0.0000,0.0000,0.0000);
				}
			}
		}
		Geometry()
		{
			BlendMode("ADDITIVE");
			Type("PARTICLE");
			Texture("lightflare");
		}
		ParticleEmitter("Flame1")
		{
			MaxParticles(-1.0000,-1.0000);
			StartDelay(0.0000,0.0000);
			BurstDelay(0.1000, 0.1000);
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
					PositionX(0.0000,0.0000);
					PositionY(1.0000,2.0000);
					PositionZ(0.0000,0.0000);
				}
				Offset()
				{
					PositionX(-0.2000,0.2000);
					PositionY(0.0000,0.0000);
					PositionZ(-0.2000,0.2000);
				}
				PositionScale(0.2000,0.2000);
				VelocityScale(2.0000,4.0000);
				InheritVelocityFactor(0.0000,0.0000);
				Size(0, 1.2000, 1.6000);
				Red(0, 255.0000, 255.0000);
				Green(0, 255.0000, 255.0000);
				Blue(0, 255.0000, 255.0000);
				Alpha(0, 0.0000, 0.0000);
				StartRotation(0, 0.0000, 20.0000);
				RotationVelocity(0, -80.0000, 0.0000);
				FadeInTime(0.0000);
			}
			Transformer()
			{
				LifeTime(1.0000);
				Position()
				{
					LifeTime(1.0000)
					Reach(0.0000, 0.0000, 0.0000);
				}
				Size(0)
				{
					LifeTime(1.0000)
					Scale(0.2500);
				}
				Color(0)
				{
					LifeTime(0.1000)
					Reach(255.0000,255.0000,255.0000,120.0000);
					Next()
					{
						LifeTime(0.6000)
						Reach(100.0000,100.0000,100.0000,0.0000);
					}
				}
			}
			Geometry()
			{
				BlendMode("ADDITIVE");
				Type("PARTICLE");
				Texture("flames_blue");
			}
			ParticleEmitter("Flame1")
			{
				MaxParticles(-1.0000,-1.0000);
				StartDelay(0.0000,0.0000);
				BurstDelay(0.0250, 0.0250);
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
					Circle()
					{
						PositionX(0.0000,0.0000);
						PositionY(1.0000,2.0000);
						PositionZ(0.0000,0.0000);
					}
					Offset()
					{
						PositionX(-0.7000,0.7000);
						PositionY(0.0000,0.0000);
						PositionZ(-0.7000,0.7000);
					}
					PositionScale(0.2000,0.2000);
					VelocityScale(2.0000,3.0000);
					InheritVelocityFactor(0.0000,0.0000);
					Size(0, 0.8000, 1.1000);
					Red(0, 255.0000, 255.0000);
					Green(0, 255.0000, 255.0000);
					Blue(0, 255.0000, 255.0000);
					Alpha(0, 0.0000, 0.0000);
					StartRotation(0, 0.0000, 20.0000);
					RotationVelocity(0, -80.0000, 0.0000);
					FadeInTime(0.0000);
				}
				Transformer()
				{
					LifeTime(1.0000);
					Position()
					{
						LifeTime(1.0000)
						Reach(0.0000, 0.0000, 0.0000);
					}
					Size(0)
					{
						LifeTime(1.0000)
						Scale(0.2500);
					}
					Color(0)
					{
						LifeTime(0.1000)
						Reach(255.0000,255.0000,255.0000,120.0000);
						Next()
						{
							LifeTime(0.6000)
							Reach(100.0000,100.0000,100.0000,0.0000);
						}
					}
				}
				Geometry()
				{
					BlendMode("ADDITIVE");
					Type("PARTICLE");
					Texture("flames_blue");
				}
			}
		}
	}
}

