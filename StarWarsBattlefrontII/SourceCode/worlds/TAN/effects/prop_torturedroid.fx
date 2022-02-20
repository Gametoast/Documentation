ParticleEmitter("Sparks")
{
	MaxParticles(-2.0000,-1.0000);
	StartDelay(0.0000,0.0000);
	BurstDelay(1.0000, 1.0000);
	BurstCount(10.0000,20.0000);
	MaxLodDist(50.0000);
	MinLodDist(10.0000);
	BoundingRadius(5.0);
	SoundName("com_amb_spark_c")
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
			PositionY(-0.1000,0.2000);
			PositionZ(-0.1000,0.1000);
		}
		Offset()
		{
			PositionX(-0.5000,-0.5000);
			PositionY(1.5000,1.5000);
			PositionZ(0.0000,0.0000);
		}
		PositionScale(0.0000,0.0000);
		VelocityScale(10.0000,25.0000);
		InheritVelocityFactor(0.0000,0.0000);
		Size(0, 0.0100, 0.0300);
		Red(0, 255.0000, 255.0000);
		Green(0, 184.0000, 200.0000);
		Blue(0, 17.0000, 32.0000);
		Alpha(0, 0.0000, 0.0000);
		StartRotation(0, 0.0000, 0.0000);
		RotationVelocity(0, 0.0000, 0.0000);
		FadeInTime(0.0000);
	}
	Transformer()
	{
		LifeTime(0.2500);
		Position()
		{
			LifeTime(0.7500)
			Accelerate(0.0000, -5.0000, 0.0000);
		}
		Size(0)
		{
			LifeTime(0.2000)
			Scale(1.0000);
		}
		Color(0)
		{
			LifeTime(0.0100)
			Reach(255.0000,244.0000,147.0000,128.0000);
			Next()
			{
				LifeTime(0.6900)
				Reach(242.0000,121.0000,0.0000,128.0000);
				Next()
				{
					LifeTime(0.1000)
					Reach(242.0000,36.0000,0.0000,0.0000);
				}
			}
		}
	}
	Geometry()
	{
		BlendMode("ADDITIVE");
		Type("SPARK");
		SparkLength(0.0300);
		Texture("com_sfx_laser_orange");
	}
	ParticleEmitter("Sparks")
	{
		MaxParticles(-2.0000,-1.0000);
		StartDelay(0.0000,0.0000);
		BurstDelay(1.2000, 1.2000);
		BurstCount(10.0000,20.0000);
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
				PositionX(-0.1000,0.1000);
				PositionY(-0.1000,0.2000);
				PositionZ(-0.1000,0.1000);
			}
			Offset()
			{
				PositionX(0.5000,0.5000);
				PositionY(1.0000,1.0000);
				PositionZ(0.0000,0.0000);
			}
			PositionScale(0.0000,0.0000);
			VelocityScale(20.0000,40.0000);
			InheritVelocityFactor(0.0000,0.0000);
			Size(0, 0.0100, 0.0300);
			Red(0, 255.0000, 255.0000);
			Green(0, 184.0000, 200.0000);
			Blue(0, 17.0000, 32.0000);
			Alpha(0, 0.0000, 0.0000);
			StartRotation(0, 0.0000, 0.0000);
			RotationVelocity(0, 0.0000, 0.0000);
			FadeInTime(0.0000);
		}
		Transformer()
		{
			LifeTime(0.2500);
			Position()
			{
				LifeTime(0.7500)
				Accelerate(0.0000, -5.0000, 0.0000);
			}
			Size(0)
			{
				LifeTime(0.2000)
				Scale(1.0000);
			}
			Color(0)
			{
				LifeTime(0.0100)
				Reach(255.0000,244.0000,147.0000,128.0000);
				Next()
				{
					LifeTime(0.6900)
					Reach(242.0000,121.0000,0.0000,128.0000);
					Next()
					{
						LifeTime(0.1000)
						Reach(242.0000,36.0000,0.0000,0.0000);
					}
				}
			}
		}
		Geometry()
		{
			BlendMode("ADDITIVE");
			Type("SPARK");
			SparkLength(0.0300);
			Texture("com_sfx_laser_orange");
		}
		ParticleEmitter("Sparks")
		{
			MaxParticles(-2.0000,-1.0000);
			StartDelay(0.0000,0.0000);
			BurstDelay(1.3000, 1.3000);
			BurstCount(10.0000,20.0000);
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
					PositionX(-0.1000,0.1000);
					PositionY(-0.1000,0.2000);
					PositionZ(-0.1000,0.1000);
				}
				Offset()
				{
					PositionX(0.2500,0.2500);
					PositionY(0.7500,0.7500);
					PositionZ(0.0000,0.0000);
				}
				PositionScale(0.0000,0.0000);
				VelocityScale(20.0000,40.0000);
				InheritVelocityFactor(0.0000,0.0000);
				Size(0, 0.0100, 0.0300);
				Red(0, 255.0000, 255.0000);
				Green(0, 184.0000, 200.0000);
				Blue(0, 17.0000, 32.0000);
				Alpha(0, 0.0000, 0.0000);
				StartRotation(0, 0.0000, 0.0000);
				RotationVelocity(0, 0.0000, 0.0000);
				FadeInTime(0.0000);
			}
			Transformer()
			{
				LifeTime(0.2500);
				Position()
				{
					LifeTime(0.7500)
					Accelerate(0.0000, -5.0000, 0.0000);
				}
				Size(0)
				{
					LifeTime(0.2000)
					Scale(1.0000);
				}
				Color(0)
				{
					LifeTime(0.0100)
					Reach(255.0000,244.0000,147.0000,128.0000);
					Next()
					{
						LifeTime(0.6900)
						Reach(242.0000,121.0000,0.0000,128.0000);
						Next()
						{
							LifeTime(0.1000)
							Reach(242.0000,36.0000,0.0000,0.0000);
						}
					}
				}
			}
			Geometry()
			{
				BlendMode("ADDITIVE");
				Type("SPARK");
				SparkLength(0.0300);
				Texture("com_sfx_laser_orange");
			}
			ParticleEmitter("Sparks")
			{
				MaxParticles(-2.0000,-1.0000);
				StartDelay(0.0000,0.0000);
				BurstDelay(0.6000, 0.6000);
				BurstCount(10.0000,20.0000);
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
						PositionX(-0.1000,0.1000);
						PositionY(-0.1000,0.2000);
						PositionZ(-0.1000,0.1000);
					}
					Offset()
					{
						PositionX(0.0000,0.0000);
						PositionY(0.7500,0.7500);
						PositionZ(0.0000,0.0000);
					}
					PositionScale(0.0000,0.0000);
					VelocityScale(20.0000,40.0000);
					InheritVelocityFactor(0.0000,0.0000);
					Size(0, 0.0100, 0.0300);
					Red(0, 255.0000, 255.0000);
					Green(0, 184.0000, 200.0000);
					Blue(0, 17.0000, 32.0000);
					Alpha(0, 0.0000, 0.0000);
					StartRotation(0, 0.0000, 0.0000);
					RotationVelocity(0, 0.0000, 0.0000);
					FadeInTime(0.0000);
				}
				Transformer()
				{
					LifeTime(0.2500);
					Position()
					{
						LifeTime(0.7500)
						Accelerate(0.0000, -5.0000, 0.0000);
					}
					Size(0)
					{
						LifeTime(0.2000)
						Scale(1.0000);
					}
					Color(0)
					{
						LifeTime(0.0100)
						Reach(255.0000,244.0000,147.0000,128.0000);
						Next()
						{
							LifeTime(0.6900)
							Reach(242.0000,121.0000,0.0000,128.0000);
							Next()
							{
								LifeTime(0.1000)
								Reach(242.0000,36.0000,0.0000,0.0000);
							}
						}
					}
				}
				Geometry()
				{
					BlendMode("ADDITIVE");
					Type("SPARK");
					SparkLength(0.0300);
					Texture("com_sfx_laser_orange");
				}
				ParticleEmitter("BlackSmoke")
				{
					MaxParticles(-1.0000,-1.0000);
					StartDelay(0.0000,0.0000);
					BurstDelay(0.5000, 0.7000);
					BurstCount(1.0000,1.0000);
					MaxLodDist(50.0000);
					MinLodDist(10.0000);
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
							PositionX(-0.1000,0.1000);
							PositionY(0.0000,0.2000);
							PositionZ(-0.1000,0.1000);
						}
						Offset()
						{
							PositionX(-0.5000,0.5000);
							PositionY(0.5000,0.5000);
							PositionZ(-0.5000,0.5000);
						}
						PositionScale(0.0000,0.0000);
						VelocityScale(0.0000,0.0000);
						InheritVelocityFactor(0.0000,0.0000);
						Size(0, 0.5000, 1.0000);
						Red(0, 255.0000, 255.0000);
						Green(0, 255.0000, 255.0000);
						Blue(0, 255.0000, 255.0000);
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
							LifeTime(1.0000)
							Scale(3.0000);
							Next()
							{
								LifeTime(2.0000)
								Scale(2.0000);
							}
						}
						Color(0)
						{
							LifeTime(0.5000)
							Reach(200.0000,200.0000,200.0000,32.0000);
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
						Texture("com_sfx_smoke3");
					}
				}
			}
		}
	}
}
