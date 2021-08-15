ParticleEmitter("POW!")
{
	MaxParticles(1.0000,1.0000);
	StartDelay(0.0000,0.0000);
	BurstDelay(0.0100, 0.0100);
	BurstCount(1.0000,1.0000);
	MaxLodDist(9100.0000);
	MinLodDist(9000.0000);
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
			PositionY(0.0000,0.0000);
			PositionZ(0.0000,0.0000);
		}
		PositionScale(0.0000,0.0000);
		VelocityScale(0.0000,0.0000);
		InheritVelocityFactor(0.0000,0.0000);
		Size(0, 1.0000, 1.0000);
		Red(0, 255.0000, 255.0000);
		Green(0, 255.0000, 255.0000);
		Blue(0, 255.0000, 255.0000);
		Alpha(0, 255.0000, 255.0000);
		StartRotation(0, -20.0000, 20.0000);
		RotationVelocity(0, -5.0000, 5.0000);
		FadeInTime(0.0000);
	}
	Transformer()
	{
		LifeTime(1.2000);
		Position()
		{
			LifeTime(1.2000)
		}
		Size(0)
		{
			LifeTime(0.1000)
			Scale(4.0000);
			Next()
			{
				LifeTime(0.1000)
				Scale(0.5000);
				Next()
				{
					LifeTime(0.1000)
					Scale(1.5000);
					Next()
					{
						LifeTime(0.1000)
						Scale(0.7500);
						Next()
						{
							LifeTime(0.1000)
							Scale(1.2000);
							Next()
							{
								LifeTime(0.1000)
								Scale(0.9500);
								Next()
								{
									LifeTime(0.5000)
									Scale(1.0000);
									Next()
									{
										LifeTime(0.1000)
										Scale(0.1000);
									}
								}
							}
						}
					}
				}
			}
		}
		Color(0)
		{
			LifeTime(2.0000)
			Move(0.0000,0.0000,0.0000,0.0000);
		}
	}
	Geometry()
	{
		BlendMode("NORMAL");
		Type("PARTICLE");
		Texture("com_sfx_f_zap");
	}
	ParticleEmitter("Confetti_Star")
	{
		MaxParticles(4.0000,4.0000);
		StartDelay(0.0000,0.0000);
		BurstDelay(0.0100, 0.0100);
		BurstCount(2.0000,2.0000);
		MaxLodDist(9100.0000);
		MinLodDist(9000.0000);
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
				PositionY(-1.0000,1.0000);
				PositionZ(-1.0000,1.0000);
			}
			Offset()
			{
				PositionX(0.0000,0.0000);
				PositionY(2.0000,2.0000);
				PositionZ(0.0000,0.0000);
			}
			PositionScale(1.0000,1.0000);
			VelocityScale(2.0000,4.0000);
			InheritVelocityFactor(0.0000,0.0000);
			Size(0, 0.2500, 0.5000);
			Hue(0, 0.0000, 255.0000);
			Saturation(0, 200.0000, 255.0000);
			Value(0, 255.0000, 255.0000);
			Alpha(0, 255.0000, 255.0000);
			StartRotation(0, 0.0000, 360.0000);
			RotationVelocity(0, -180.0000, 180.0000);
			FadeInTime(0.0000);
		}
		Transformer()
		{
			LifeTime(1.0000);
			Position()
			{
				LifeTime(1.0000)
				Scale(0.0000);
			}
			Size(0)
			{
				LifeTime(1.0000)
				Scale(2.0000);
			}
			Color(0)
			{
				LifeTime(1.0000)
				Move(0.0000,0.0000,0.0000,-255.0000);
			}
		}
		Geometry()
		{
			BlendMode("NORMAL");
			Type("PARTICLE");
			Texture("com_sfx_f_star");
		}
		ParticleEmitter("Confetti_Swirl")
		{
			MaxParticles(4.0000,4.0000);
			StartDelay(0.0000,0.0000);
			BurstDelay(0.0100, 0.0100);
			BurstCount(2.0000,2.0000);
			MaxLodDist(9100.0000);
			MinLodDist(9000.0000);
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
					PositionY(-1.0000,1.0000);
					PositionZ(-1.0000,1.0000);
				}
				Offset()
				{
					PositionX(0.0000,0.0000);
					PositionY(2.0000,2.0000);
					PositionZ(0.0000,0.0000);
				}
				PositionScale(1.0000,1.0000);
				VelocityScale(2.0000,4.0000);
				InheritVelocityFactor(0.0000,0.0000);
				Size(0, 0.2500, 0.5000);
				Hue(0, 0.0000, 255.0000);
				Saturation(0, 200.0000, 255.0000);
				Value(0, 255.0000, 255.0000);
				Alpha(0, 255.0000, 255.0000);
				StartRotation(0, 0.0000, 360.0000);
				RotationVelocity(0, -360.0000, 360.0000);
				FadeInTime(0.0000);
			}
			Transformer()
			{
				LifeTime(1.0000);
				Position()
				{
					LifeTime(1.0000)
					Scale(0.0000);
				}
				Size(0)
				{
					LifeTime(1.0000)
					Scale(2.0000);
				}
				Color(0)
				{
					LifeTime(1.0000)
					Move(0.0000,0.0000,0.0000,-255.0000);
				}
			}
			Geometry()
			{
				BlendMode("NORMAL");
				Type("PARTICLE");
				Texture("com_sfx_f_swirl");
			}
			ParticleEmitter("Confetti_Circle")
			{
				MaxParticles(4.0000,4.0000);
				StartDelay(0.0000,0.0000);
				BurstDelay(0.0100, 0.0100);
				BurstCount(2.0000,2.0000);
				MaxLodDist(9100.0000);
				MinLodDist(9000.0000);
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
						PositionY(-1.0000,1.0000);
						PositionZ(-1.0000,1.0000);
					}
					Offset()
					{
						PositionX(0.0000,0.0000);
						PositionY(2.0000,2.0000);
						PositionZ(0.0000,0.0000);
					}
					PositionScale(1.0000,1.0000);
					VelocityScale(2.0000,4.0000);
					InheritVelocityFactor(0.0000,0.0000);
					Size(0, 0.1000, 0.2000);
					Hue(0, 0.0000, 255.0000);
					Saturation(0, 200.0000, 255.0000);
					Value(0, 255.0000, 255.0000);
					Alpha(0, 255.0000, 255.0000);
					StartRotation(0, 0.0000, 360.0000);
					RotationVelocity(0, -360.0000, 360.0000);
					FadeInTime(0.0000);
				}
				Transformer()
				{
					LifeTime(1.0000);
					Position()
					{
						LifeTime(1.0000)
						Scale(0.0000);
					}
					Size(0)
					{
						LifeTime(1.0000)
						Scale(2.0000);
					}
					Color(0)
					{
						LifeTime(1.0000)
						Move(0.0000,0.0000,0.0000,-255.0000);
					}
				}
				Geometry()
				{
					BlendMode("NORMAL");
					Type("PARTICLE");
					Texture("com_sfx_f_circle");
				}
			}
		}
	}
}
