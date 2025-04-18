ParticleEmitter("LaserBeam")
{
	MaxParticles(-1.0000,-1.0000);
	StartDelay(0.0000,0.0000);
	BurstDelay(0.0100, 0.0100);
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
		Circle()
		{
			PositionX(0.0000,0.0000);
			PositionY(-1.0000,-1.0000);
			PositionZ(0.0000,0.0000);
		}
		Offset()
		{
			PositionX(-0.0500,0.0500);
			PositionY(2.9000,2.9000);
			PositionZ(-0.0500,0.0500);
		}
		PositionScale(0.0000,0.0000);
		VelocityScale(30.0000,30.0000);
		InheritVelocityFactor(0.0000,0.0000);
		Size(0, 0.1000, 0.1000);
		Hue(0, 20.0000, 30.0000);
		Saturation(0, 255.0000, 255.0000);
		Value(0, 255.0000, 255.0000);
		Alpha(0, 255.0000, 255.0000);
		StartRotation(0, 1.0000, 1.0000);
		RotationVelocity(0, 0.0000, 0.0000);
		FadeInTime(0.0000);
	}
	Transformer()
	{
		LifeTime(0.1000);
		Position()
		{
			LifeTime(1.0000)
		}
		Size(0)
		{
			LifeTime(0.2000)
			Scale(1.0000);
		}
		Color(0)
		{
			LifeTime(0.3000)
			Move(0.0000,0.0000,0.0000,0.0000);
		}
	}
	Geometry()
	{
		BlendMode("ADDITIVE");
		Type("SPARK");
		SparkLength(0.0300);
		Texture("com_sfx_flashball3");
	}
	ParticleEmitter("Streams")
	{
		MaxParticles(-1.0000,-1.0000);
		StartDelay(0.0000,0.0000);
		BurstDelay(0.0100, 0.0100);
		BurstCount(1.0000,1.0000);
		MaxLodDist(1000.0000);
		MinLodDist(800.0000);
		BoundingRadius(30.0);
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
				PositionY(1.0000,1.0000);
				PositionZ(0.0000,0.0000);
			}
			Offset()
			{
				PositionX(-0.5000,0.5000);
				PositionY(3.1000,3.1000);
				PositionZ(-0.5000,0.5000);
			}
			PositionScale(0.0000,0.0000);
			VelocityScale(50.0000,60.0000);
			InheritVelocityFactor(0.0000,0.0000);
			Size(0, 0.1000, 0.6000);
			Hue(0, 10.0000, 20.0000);
			Saturation(0, 200.0000, 255.0000);
			Value(0, 255.0000, 255.0000);
			Alpha(0, 0.0000, 64.0000);
			StartRotation(0, 128.0000, 128.0000);
			RotationVelocity(0, 0.0000, 1.0000);
			FadeInTime(0.0000);
		}
		Transformer()
		{
			LifeTime(0.0250);
			Position()
			{
				LifeTime(1.0000)
			}
			Size(0)
			{
				LifeTime(1.0000)
			}
			Color(0)
			{
				LifeTime(0.0010)
				Move(0.0000,0.0000,0.0000,32.0000);
			}
		}
		Geometry()
		{
			BlendMode("ADDITIVE");
			Type("SPARK");
			SparkLength(0.0500);
			Texture("com_sfx_laser_blue");
			ParticleEmitter("BlackSmoke")
			{
				MaxParticles(4.0000,4.0000);
				StartDelay(0.0000,0.0000);
				BurstDelay(0.0250, 0.0250);
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
						PositionX(-2.6250,2.6250);
						PositionY(-2.6250,2.6250);
						PositionZ(-2.6250,2.6250);
					}
					Offset()
					{
						PositionX(-0.1313,0.1313);
						PositionY(-0.1313,0.1313);
						PositionZ(-0.1313,0.1313);
					}
					PositionScale(0.0000,0.0000);
					VelocityScale(2.6250,2.6250);
					InheritVelocityFactor(0.2000,0.2000);
					Size(0, 1.3125, 1.8375);
					Hue(0, 12.0000, 20.0000);
					Saturation(0, 5.0000, 10.0000);
					Value(0, 200.0000, 220.0000);
					Alpha(0, 0.0000, 0.0000);
					StartRotation(0, -20.0000, 20.0000);
					RotationVelocity(0, -20.0000, 20.0000);
					FadeInTime(0.0000);
				}
				Transformer()
				{
					LifeTime(1.5000);
					Position()
					{
						LifeTime(1.5000)
						Scale(0.0000);
					}
					Size(0)
					{
						LifeTime(2.0000)
						Scale(6.0000);
					}
					Color(0)
					{
						LifeTime(0.1000)
						Move(0.0000,0.0000,0.0000,255.0000);
						Next()
						{
							LifeTime(1.4000)
							Move(0.0000,0.0000,0.0000,-255.0000);
						}
					}
				}
				Geometry()
				{
					BlendMode("NORMAL");
					Type("PARTICLE");
					Texture("thicksmoke3");
				}
			}
		}
		ParticleEmitter("LaserFlareBottom")
		{
			MaxParticles(-1.0000,-1.0000);
			StartDelay(0.0000,0.0000);
			BurstDelay(0.0500, 0.1000);
			BurstCount(1.0000,1.0000);
			MaxLodDist(1000.0000);
			MinLodDist(800.0000);
			BoundingRadius(55.0);
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
					PositionY(0.0000,0.0000);
					PositionZ(0.0000,0.0000);
				}
				Offset()
				{
					PositionX(0.0000,0.0000);
					PositionY(0.7500,0.7500);
					PositionZ(0.0000,0.0000);
				}
				PositionScale(0.0000,0.0000);
				VelocityScale(0.0000,0.0000);
				InheritVelocityFactor(0.0000,0.0000);
				Size(0, 1.0000, 2.0000);
				Hue(0, 0.0000, 10.0000);
				Saturation(0, 148.0000, 148.7500);
				Value(0, 240.0000, 240.0000);
				Alpha(0, 255.0000, 255.0000);
				StartRotation(0, 0.0000, 360.0000);
				RotationVelocity(0, 0.0000, 0.0000);
				FadeInTime(0.0000);
			}
			Transformer()
			{
				LifeTime(0.1000);
				Position()
				{
					LifeTime(1.0000)
				}
				Size(0)
				{
					LifeTime(0.2000)
					Scale(1.0000);
				}
				Color(0)
				{
					LifeTime(0.1000)
					Move(127.5000,0.0000,0.0000,-255.0000);
				}
			}
			Geometry()
			{
				BlendMode("ADDITIVE");
				Type("PARTICLE");
				Texture("com_sfx_flashball3");
			}
			ParticleEmitter("LaserFlareTop")
			{
				MaxParticles(-1.0000,-1.0000);
				StartDelay(0.0000,0.0000);
				BurstDelay(0.0500, 0.1000);
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
						PositionX(0.0000,0.0000);
						PositionY(0.0000,0.0000);
						PositionZ(0.0000,0.0000);
					}
					Offset()
					{
						PositionX(0.0000,0.0000);
						PositionY(3.5000,3.5000);
						PositionZ(0.0000,0.0000);
					}
					PositionScale(0.0000,0.0000);
					VelocityScale(0.0000,0.0000);
					InheritVelocityFactor(0.0000,0.0000);
					Size(0, 1.0000, 2.0000);
					Hue(0, 0.0000, 10.0000);
					Saturation(0, 148.0000, 148.7500);
					Value(0, 240.0000, 240.0000);
					Alpha(0, 255.0000, 255.0000);
					StartRotation(0, 0.0000, 360.0000);
					RotationVelocity(0, 0.0000, 0.0000);
					FadeInTime(0.0000);
				}
				Transformer()
				{
					LifeTime(0.1000);
					Position()
					{
						LifeTime(1.0000)
					}
					Size(0)
					{
						LifeTime(0.2000)
						Scale(1.0000);
					}
					Color(0)
					{
						LifeTime(0.1000)
						Move(79.7746,255.0000,122.0000,-255.0000);
					}
				}
				Geometry()
				{
					BlendMode("ADDITIVE");
					Type("PARTICLE");
					Texture("com_sfx_flashball3");
				}
			}
		}
	}
}
