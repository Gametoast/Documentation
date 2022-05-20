ParticleEmitter("WaterFountain_Normal")
{
	MaxParticles(-1.0000,-1.0000);
	StartDelay(0.0000,0.0000);
	BurstDelay(0.1500, 0.1500);
	BurstCount(1.0000,1.0000);
	MaxLodDist(50.0000);
	MinLodDist(10.0000);
	BoundingRadius(15.0);
    SoundName("waterspout")
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
			PositionY(3.5600,4.0000);
			PositionZ(0.0000,0.0000);
		}
		Offset()
		{
			PositionX(0.0000,0.0000);
			PositionY(0.0000,0.1000);
			PositionZ(0.0000,0.0000);
		}
		PositionScale(0.0000,0.0000);
		VelocityScale(3.0000,3.0000);
		InheritVelocityFactor(0.0000,0.0000);
		Size(0, 0.4000, 0.8000);
		Red(0, 200.0000, 200.0000);
		Green(0, 200.0000, 200.0000);
		Blue(0, 200.0000, 200.0000);
		Alpha(0, 0.0000, 0.0000);
		StartRotation(0, 0.0000, 0.0000);
		RotationVelocity(0, 0.0000, 0.0000);
		FadeInTime(0.0000);
	}
	Transformer()
	{
		LifeTime(1.8000);
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
			LifeTime(0.1000)
			Reach(200.0000,200.0000,200.0000,255.0000);
			Next()
			{
				LifeTime(1.7000)
				Reach(200.0000,200.0000,200.0000,255.0000);
			}
		}
	}
	Geometry()
	{
		BlendMode("NORMAL");
		Type("PARTICLE");
		Texture("water1");
	}
	ParticleEmitter("WaterFountain_Bubbles")
	{
		MaxParticles(-1.0000,-1.0000);
		StartDelay(0.0000,0.0000);
		BurstDelay(0.4000, 0.4000);
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
				PositionX(0.0000,0.0000);
				PositionY(3.5000,3.7500);
				PositionZ(0.0000,0.0000);
			}
			Offset()
			{
				PositionX(-0.3000,0.3000);
				PositionY(0.0000,0.1000);
				PositionZ(-0.3000,0.3000);
			}
			PositionScale(0.0000,0.0000);
			VelocityScale(3.2500,3.2500);
			InheritVelocityFactor(0.0000,0.0000);
			Size(0, 0.2000, 0.4000);
			Red(0, 255.0000, 255.0000);
			Green(0, 255.0000, 255.0000);
			Blue(0, 255.0000, 255.0000);
			Alpha(0, 0.0000, 0.0000);
			StartRotation(0, 0.0000, 360.0000);
			RotationVelocity(0, -50.0000, 50.0000);
			FadeInTime(0.0000);
		}
		Transformer()
		{
			LifeTime(1.6000);
			Position()
			{
				LifeTime(3.0000)
				Accelerate(0.0000, -45.0000, 0.0000);
			}
			Size(0)
			{
				LifeTime(1.6000)
				Scale(6.0000);
			}
			Color(0)
			{
				LifeTime(0.1000)
				Reach(255.0000,255.0000,255.0000,150.0000);
				Next()
				{
					LifeTime(1.5000)
					Reach(255.0000,255.0000,255.0000,0.0000);
				}
			}
		}
		Geometry()
		{
			BlendMode("ADDITIVE");
			Type("PARTICLE");
			Texture("dirt");
		}
		ParticleEmitter("WaterFountain_Mist")
		{
			MaxParticles(-1.0000,-1.0000);
			StartDelay(0.0000,0.0000);
			BurstDelay(1.0000, 1.0000);
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
					PositionX(-2.0000,2.0000);
					PositionY(5.0000,5.0000);
					PositionZ(-2.0000,2.0000);
				}
				Offset()
				{
					PositionX(-1.0000,1.0000);
					PositionY(0.0000,0.0000);
					PositionZ(-1.0000,1.0000);
				}
				PositionScale(0.0000,0.0000);
				VelocityScale(0.5000,0.5000);
				InheritVelocityFactor(0.0000,0.0000);
				Size(0, 1.0000, 3.0000);
				Red(0, 255.0000, 255.0000);
				Green(0, 255.0000, 255.0000);
				Blue(0, 255.0000, 255.0000);
				Alpha(0, 0.0000, 0.0000);
				StartRotation(0, -180.0000, 0.0000);
				RotationVelocity(0, 0.0000, 0.0000);
				FadeInTime(0.0000);
			}
			Transformer()
			{
				LifeTime(2.0000);
				Position()
				{
					LifeTime(2.0000)
					Accelerate(0.0000, -8.0000, 0.0000);
				}
				Size(0)
				{
					LifeTime(2.0000)
					Scale(3.0000);
				}
				Color(0)
				{
					LifeTime(1.0000)
					Reach(255.0000,255.0000,255.0000,64.0000);
					Next()
					{
						LifeTime(1.0000)
						Reach(255.0000,255.0000,255.0000,0.0000);
					}
				}
			}
			Geometry()
			{
				BlendMode("ADDITIVE");
				Type("PARTICLE");
				Texture("thicksmoke2");
			}
			ParticleEmitter("Drops")
			{
				MaxParticles(-1.0000,-1.0000);
				StartDelay(0.0000,0.0000);
				BurstDelay(0.1000, 0.1000);
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
					Circle()
					{
						PositionX(-1.0000,1.0000);
						PositionY(0.8000,1.0000);
						PositionZ(-1.0000,1.0000);
					}
					Offset()
					{
						PositionX(0.0000,0.0000);
						PositionY(0.0000,0.0000);
						PositionZ(0.0000,0.0000);
					}
					PositionScale(0.5000,0.5000);
					VelocityScale(1.0000,2.0000);
					InheritVelocityFactor(0.0000,0.0000);
					Size(0, 0.1000, 0.4000);
					Red(0, 150.0000, 150.0000);
					Green(0, 200.0000, 200.0000);
					Blue(0, 255.0000, 255.0000);
					Alpha(0, 0.0000, 0.0000);
					StartRotation(0, 0.0000, 360.0000);
					RotationVelocity(0, 0.0000, 0.0000);
					FadeInTime(0.0000);
				}
				Transformer()
				{
					LifeTime(1.0000);
					Position()
					{
						LifeTime(0.6000)
						Accelerate(0.0000, -6.0000, 0.0000);
					}
					Size(0)
					{
						LifeTime(0.6000)
						Scale(8.0000);
					}
					Color(0)
					{
						LifeTime(0.1000)
						Reach(150.0000,200.0000,255.0000,200.0000);
						Next()
						{
							LifeTime(0.9000)
							Reach(150.0000,200.0000,200.0000,0.0000);
						}
					}
				}
				Geometry()
				{
					BlendMode("ADDITIVE");
					Type("PARTICLE");
					Texture("dirt");
				}
			}
		}
	}
}
