ParticleEmitter("Distortion")
{
	MaxParticles(-1.0000,-1.0000);
	StartDelay(0.0000,0.0000);
	BurstDelay(0.2500, 0.2500);
	BurstCount(1.0000,1.0000);
	MaxLodDist(1000.0000);
	MinLodDist(800.0000);
	BoundingRadius(15.0);
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
			PositionX(-0.1000,0.1000);
			PositionY(-0.1000,0.1000);
			PositionZ(-0.1000,0.1000);
		}
		PositionScale(0.0000,0.0000);
		VelocityScale(1.0000,1.0000);
		InheritVelocityFactor(0.0000,0.0000);
		Size(0, 0.5000, 0.5000);
		Red(0, 240.0000, 240.0000);
		Green(0, 255.0000, 255.0000);
		Blue(0, 240.0000, 240.0000);
		Alpha(0, 0.0000, 0.0000);
		StartRotation(0, 0.0000, 360.0000);
		RotationVelocity(0, 0.0000, 0.0000);
		FadeInTime(0.0000);
	}
	Transformer()
	{
		LifeTime(0.2500);
		Position()
		{
			LifeTime(0.5000)
		}
		Size(0)
		{
			LifeTime(0.2500)
			Scale(3.0000);
		}
		Color(0)
		{
			LifeTime(0.1000)
			Reach(240.0000,255.0000,240.0000,150.0000);
			Next()
			{
				LifeTime(0.1500)
				Reach(255.0000,255.0000,255.0000,0.0000);
			}
		}
	}
	Geometry()
	{
		BlendMode("BLUR");
		BlurValue(0.1000);
		BlurRes(1.0000);
		Type("PARTICLE");
		Texture("com_sfx_waterfoam1");
	}
	ParticleEmitter("GreenSmoke")
	{
		MaxParticles(-1.0000,-1.0000);
		StartDelay(0.0000,0.0000);
		BurstDelay(0.0500, 0.0500);
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
				PositionZ(-1.0000,-1.0000);
			}
			Offset()
			{
				PositionX(0.0000,0.0000);
				PositionY(0.0000,0.0000);
				PositionZ(-3.0000,-3.0000);
			}
			PositionScale(0.0000,0.0000);
			VelocityScale(5.0000,5.0000);
			InheritVelocityFactor(0.0000,0.0000);
			Size(0, 0.0100, 0.0600);
			Hue(0, 55.0000, 75.0000);
			Saturation(0, 100.0000, 150.0000);
			Value(0, 100.0000, 150.0000);
			Alpha(0, 0.0000, 0.0000);
			StartRotation(0, 0.0000, 360.0000);
			RotationVelocity(0, 0.0000, 0.0000);
			FadeInTime(0.0000);
		}
		Transformer()
		{
			LifeTime(0.2500);
			Position()
			{
				LifeTime(0.2500)
			}
			Size(0)
			{
				LifeTime(0.2500)
				Scale(1.5000);
			}
			Color(0)
			{
				LifeTime(0.1000)
				Move(0.0000,0.0000,0.0000,128.0000);
				Next()
				{
					LifeTime(0.2000)
					Move(0.0000,0.0000,0.0000,-128.0000);
				}
			}
		}
		Geometry()
		{
			BlendMode("ADDITIVE");
			Type("SPARK");
			SparkLength(1.0000);
			Texture("com_sfx_waterfoam1");
		}
		ParticleEmitter("Blast_Ring")
		{
			MaxParticles(-1.0000,-1.0000);
			StartDelay(0.0150,0.0150);
			BurstDelay(0.0250, 0.0250);
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
					PositionY(0.0000,0.0000);
					PositionZ(-1.0000,-1.0000);
				}
				Offset()
				{
					PositionX(0.0000,0.0000);
					PositionY(0.0000,0.0000);
					PositionZ(0.0000,0.0000);
				}
				PositionScale(0.0000,0.0000);
				VelocityScale(4.0000,4.0000);
				InheritVelocityFactor(0.0000,0.0000);
				Size(0, 0.0500, 0.0500);
				Hue(0, 55.0000, 75.0000);
				Saturation(0, 85.0000, 125.0000);
				Value(0, 50.0000, 100.0000);
				Alpha(0, 0.0000, 0.0000);
				StartRotation(0, 0.0000, 0.0000);
				RotationVelocity(0, 0.0000, 0.0000);
				FadeInTime(0.0000);
			}
			Transformer()
			{
				LifeTime(0.4000);
				Position()
				{
					LifeTime(3.0000)
				}
				Size(0)
				{
					LifeTime(0.4000)
					Scale(10.0000);
				}
				Color(0)
				{
					LifeTime(0.0500)
					Move(0.0000,0.0000,0.0000,200.0000);
					Next()
					{
						LifeTime(0.3000)
						Move(0.0000,0.0000,0.0000,-200.0000);
					}
				}
			}
			Geometry()
			{
				BlendMode("ADDITIVE");
				Type("GEOMETRY");
				Model("geo_blast_ring");
			}
			ParticleEmitter("Blast_Ring")
			{
				MaxParticles(-1.0000,-1.0000);
				StartDelay(0.0000,0.0000);
				BurstDelay(0.0500, 0.0500);
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
						PositionY(0.0000,0.0000);
						PositionZ(-1.0000,-1.0000);
					}
					Offset()
					{
						PositionX(0.0000,0.0000);
						PositionY(0.0000,0.0000);
						PositionZ(0.0000,0.0000);
					}
					PositionScale(0.0000,0.0000);
					VelocityScale(4.0000,4.0000);
					InheritVelocityFactor(0.0000,0.0000);
					Size(0, 0.1000, 0.1000);
					Hue(0, 55.0000, 75.0000);
					Saturation(0, 85.0000, 125.0000);
					Value(0, 150.0000, 200.0000);
					Alpha(0, 0.0000, 0.0000);
					StartRotation(0, 0.0000, 0.0000);
					RotationVelocity(0, 0.0000, 0.0000);
					FadeInTime(0.0000);
				}
				Transformer()
				{
					LifeTime(0.4000);
					Position()
					{
						LifeTime(3.0000)
					}
					Size(0)
					{
						LifeTime(0.4000)
						Scale(10.0000);
					}
					Color(0)
					{
						LifeTime(0.0500)
						Move(0.0000,0.0000,0.0000,255.0000);
						Next()
						{
							LifeTime(0.3000)
							Move(0.0000,0.0000,0.0000,-255.0000);
						}
					}
				}
				Geometry()
				{
					BlendMode("ADDITIVE");
					Type("GEOMETRY");
					Model("geo_blast_ring");
				}
			}
		}
	}
}
