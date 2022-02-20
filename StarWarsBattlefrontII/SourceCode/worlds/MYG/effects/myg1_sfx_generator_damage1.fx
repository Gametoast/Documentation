ParticleEmitter("Lightning1")
{
	MaxParticles(-1.0000,-1.0000);
	StartDelay(0.0000,1.0000);
	BurstDelay(0.5000, 1.0000);
	BurstCount(1.0000,1.0000);
	MaxLodDist(2200.0000);
	MinLodDist(2000.0000);
	BoundingRadius(5.0);
	SoundName("ball_sparks")
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
		Size(0, 0.2000, 0.7000);
		Hue(0, 140.0000, 170.0000);
		Saturation(0, 0.0000, 100.0000);
		Value(0, 255.0000, 255.0000);
		Alpha(0, 0.0000, 0.0000);
		StartRotation(0, 0.0000, 360.0000);
		RotationVelocity(0, -180.0000, 180.0000);
		FadeInTime(0.0000);
	}
	Transformer()
	{
		LifeTime(0.0500);
		Position()
		{
			LifeTime(1.0000)
		}
		Size(0)
		{
			LifeTime(0.1000)
		}
		Color(0)
		{
			LifeTime(0.0100)
			Move(0.0000,0.0000,0.0000,255.0000);
		}
	}
	Geometry()
	{
		BlendMode("ADDITIVE");
		Type("GEOMETRY");
		Model("com_sfx_lightningball1");
	}
	ParticleEmitter("Lightning2")
	{
		MaxParticles(-1.0000,-1.0000);
		StartDelay(0.0000,1.0000);
		BurstDelay(0.5000, 1.0000);
		BurstCount(1.0000,1.0000);
		MaxLodDist(2200.0000);
		MinLodDist(2000.0000);
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
			Size(0, 0.2000, 0.7000);
			Hue(0, 140.0000, 170.0000);
			Saturation(0, 0.0000, 100.0000);
			Value(0, 255.0000, 255.0000);
			Alpha(0, 0.0000, 0.0000);
			StartRotation(0, 0.0000, 360.0000);
			RotationVelocity(0, -180.0000, 180.0000);
			FadeInTime(0.0000);
		}
		Transformer()
		{
			LifeTime(0.0500);
			Position()
			{
				LifeTime(1.0000)
			}
			Size(0)
			{
				LifeTime(0.1000)
			}
			Color(0)
			{
				LifeTime(0.0100)
				Move(0.0000,0.0000,0.0000,255.0000);
			}
		}
		Geometry()
		{
			BlendMode("ADDITIVE");
			Type("GEOMETRY");
			Model("com_sfx_lightningball2");
		}
		ParticleEmitter("Lightning3")
		{
			MaxParticles(0.0000,0.0000);
			StartDelay(0.0000,1.0000);
			BurstDelay(0.5000, 1.0000);
			BurstCount(1.0000,1.0000);
			MaxLodDist(2200.0000);
			MinLodDist(2000.0000);
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
				Size(0, 0.2000, 0.7000);
				Hue(0, 140.0000, 170.0000);
				Saturation(0, 0.0000, 100.0000);
				Value(0, 255.0000, 255.0000);
				Alpha(0, 0.0000, 0.0000);
				StartRotation(0, 0.0000, 360.0000);
				RotationVelocity(0, -180.0000, 180.0000);
				FadeInTime(0.0000);
			}
			Transformer()
			{
				LifeTime(0.0500);
				Position()
				{
					LifeTime(1.0000)
				}
				Size(0)
				{
					LifeTime(0.1000)
				}
				Color(0)
				{
					LifeTime(0.0100)
					Move(0.0000,0.0000,0.0000,255.0000);
				}
			}
			Geometry()
			{
				BlendMode("ADDITIVE");
				Type("GEOMETRY");
				Model("com_sfx_lightningball3");
			}
			ParticleEmitter("Sparks")
			{
				MaxParticles(0.0000,0.0000);
				StartDelay(1.0000,3.0000);
				BurstDelay(1.0000, 3.0000);
				BurstCount(20.0000,20.0000);
				MaxLodDist(2100.0000);
				MinLodDist(2000.0000);
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
					VelocityScale(5.0000,30.0000);
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
					LifeTime(0.5000);
					Position()
					{
						LifeTime(0.5000)
						Accelerate(0.0000, -20.0000, 0.0000);
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
				ParticleEmitter("Smoke")
				{
					MaxParticles(0.0000,0.0000);
					StartDelay(0.0000,0.0000);
					BurstDelay(0.1000, 0.1000);
					BurstCount(1.0000,1.0000);
					MaxLodDist(2100.0000);
					MinLodDist(2000.0000);
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
							PositionY(0.0000,0.0000);
							PositionZ(0.0000,0.0000);
						}
						PositionScale(0.0000,0.0000);
						VelocityScale(0.0000,0.0000);
						InheritVelocityFactor(0.2500,0.2500);
						Size(0, 1.0000, 1.1000);
						Hue(0, 24.0000, 24.0000);
						Saturation(0, 10.0000, 10.0000);
						Value(0, 200.0000, 200.0000);
						Alpha(0, 0.0000, 0.0000);
						StartRotation(0, 0.0000, 360.0000);
						RotationVelocity(0, -100.0000, 100.0000);
						FadeInTime(0.0000);
					}
					Transformer()
					{
						LifeTime(1.0000);
						Position()
						{
							LifeTime(1.0000)
							Accelerate(0.0000, 10.0000, 0.0000);
						}
						Size(0)
						{
							LifeTime(1.0000)
							Scale(5.0000);
						}
						Color(0)
						{
							LifeTime(0.2500)
							Move(0.0000,0.0000,0.0000,32.0000);
							Next()
							{
								LifeTime(0.7500)
								Move(0.0000,0.0000,0.0000,-32.0000);
							}
						}
					}
					Geometry()
					{
						BlendMode("NORMAL");
						Type("PARTICLE");
						Texture("com_sfx_smoke3");
					}
				}
			}
		}
	}
}
