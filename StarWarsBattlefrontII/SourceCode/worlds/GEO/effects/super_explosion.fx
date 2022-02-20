ParticleEmitter("Explosion")
{
	MaxParticles(5.0000,5.0000);
	StartDelay(0.0000,0.0000);
	BurstDelay(0.0010, 0.0010);
	BurstCount(5.0000,5.0000);
	MaxLodDist(50.0000);
	MinLodDist(10.0000);
	BoundingRadius(200.0);
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
			PositionX(-10.0000,10.0000);
			PositionY(-10.0000,10.0000);
			PositionZ(-10.0000,10.0000);
		}
		Offset()
		{
			PositionX(0.0000,0.0000);
			PositionY(0.0000,0.0000);
			PositionZ(0.0000,0.0000);
		}
		PositionScale(9.6000,9.6000);
		VelocityScale(4.5000,12.0000);
		InheritVelocityFactor(0.0000,0.0000);
		Size(0, 19.2000, 38.4000);
		Red(0, 255.0000, 255.0000);
		Green(0, 255.0000, 255.0000);
		Blue(0, 255.0000, 255.0000);
		Alpha(0, 255.0000, 255.0000);
		StartRotation(0, 0.0000, 360.0000);
		RotationVelocity(0, -100.0000, 100.0000);
		FadeInTime(0.0000);
	}
	Transformer()
	{
		LifeTime(4.5000);
		Position()
		{
			LifeTime(2.2500)
		}
		Size(0)
		{
			LifeTime(3.3750)
		}
		Color(0)
		{
			LifeTime(3.3750)
			Reach(255.0000,255.0000,255.0000,255.0000);
		}
	}
	Geometry()
	{
		BlendMode("NORMAL");
		Type("EMITTER");
		Texture("explode3");
		ParticleEmitter("Smoke")
		{
			MaxParticles(4.0000,4.0000);
			StartDelay(0.0000,0.0000);
			BurstDelay(0.0750, 0.0750);
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
				Circle()
				{
					PositionX(-24.0000,24.0000);
					PositionY(-24.0000,24.0000);
					PositionZ(-24.0000,24.0000);
				}
				Offset()
				{
					PositionX(0.0000,0.0000);
					PositionY(0.0000,0.0000);
					PositionZ(0.0000,0.0000);
				}
				PositionScale(0.0000,0.0000);
				VelocityScale(0.7500,0.7500);
				InheritVelocityFactor(0.2500,0.2500);
				Size(0, 9.6000, 14.4000);
				Hue(0, 16.0000, 96.0000);
				Saturation(0, 0.0000, 0.0000);
				Value(0, 200.0000, 200.0000);
				Alpha(0, 0.0000, 128.0000);
				StartRotation(0, 0.0000, 360.0000);
				RotationVelocity(0, -20.0000, 20.0000);
				FadeInTime(0.0000);
			}
			Transformer()
			{
				LifeTime(3.3750);
				Position()
				{
					LifeTime(3.3750)
					Scale(0.0000);
				}
				Size(0)
				{
					LifeTime(0.5625)
					Scale(2.5000);
					Next()
					{
						LifeTime(2.8125)
						Scale(2.5000);
					}
				}
				Color(0)
				{
					LifeTime(0.2250)
					Move(0.0000,0.0000,0.0000,128.0000);
					Next()
					{
						LifeTime(3.1500)
						Move(0.0000,-100.0000,0.0000,-255.0000);
					}
				}
			}
			Geometry()
			{
				BlendMode("NORMAL");
				Type("PARTICLE");
				Texture("com_sfx_smoke3");
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
							PositionX(-63.0000,63.0000);
							PositionY(-63.0000,63.0000);
							PositionZ(-63.0000,63.0000);
						}
						Offset()
						{
							PositionX(-3.1520,3.1520);
							PositionY(-3.1520,3.1520);
							PositionZ(-3.1520,3.1520);
						}
						PositionScale(0.0000,0.0000);
						VelocityScale(3.9375,3.9375);
						InheritVelocityFactor(0.2000,0.2000);
						Size(0, 25.2006, 35.2806);
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
						LifeTime(3.3750);
						Position()
						{
							LifeTime(3.3750)
							Scale(0.0000);
						}
						Size(0)
						{
							LifeTime(4.5000)
							Scale(6.0000);
						}
						Color(0)
						{
							LifeTime(0.2250)
							Move(0.0000,0.0000,0.0000,255.0000);
							Next()
							{
								LifeTime(3.1500)
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
			ParticleEmitter("Flames")
			{
				MaxParticles(4.0000,4.0000);
				StartDelay(0.0000,0.0000);
				BurstDelay(0.0750, 0.0750);
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
					Circle()
					{
						PositionX(-19.2000,19.2000);
						PositionY(-19.2000,19.2000);
						PositionZ(-19.2000,19.2000);
					}
					Offset()
					{
						PositionX(-2.4000,2.4000);
						PositionY(-2.4000,2.4000);
						PositionZ(-2.4000,2.4000);
					}
					PositionScale(0.0000,0.0000);
					VelocityScale(1.5000,1.5000);
					InheritVelocityFactor(0.2500,0.2500);
					Size(0, 1.9200, 3.8400);
					Red(0, 255.0000, 255.0000);
					Green(0, 204.0000, 233.0000);
					Blue(0, 98.0000, 185.0000);
					Alpha(0, 0.0000, 128.0000);
					StartRotation(0, 0.0000, 255.0000);
					RotationVelocity(0, -40.0000, 40.0000);
					FadeInTime(0.0000);
				}
				Transformer()
				{
					LifeTime(2.2500);
					Position()
					{
						LifeTime(2.2500)
						Scale(0.0000);
					}
					Size(0)
					{
						LifeTime(0.2250)
						Scale(4.0000);
						Next()
						{
							LifeTime(2.0250)
							Scale(3.0000);
						}
					}
					Color(0)
					{
						LifeTime(0.2250)
						Move(0.0000,-40.0000,-50.0000,128.0000);
						Next()
						{
							LifeTime(1.1250)
							Move(128.0000,-40.0000,-50.0000,-128.0000);
							Next()
							{
								LifeTime(0.9000)
								Move(128.0000,-50.0000,-50.0000,-128.0000);
							}
						}
					}
				}
				Geometry()
				{
					BlendMode("ADDITIVE");
					Type("PARTICLE");
					Texture("com_sfx_explosion1");
					ParticleEmitter("BlackSmoke")
					{
						MaxParticles(3.0000,3.0000);
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
								PositionX(-50.4000,50.4000);
								PositionY(-50.4000,50.4000);
								PositionZ(-50.4000,50.4000);
							}
							Offset()
							{
								PositionX(-2.5216,2.5216);
								PositionY(-2.5216,2.5216);
								PositionZ(-2.5216,2.5216);
							}
							PositionScale(0.0000,0.0000);
							VelocityScale(5.6250,5.6250);
							InheritVelocityFactor(0.1000,0.1000);
							Size(0, 10.0800, 20.1600);
							Red(0, 254.0000, 255.0000);
							Green(0, 172.0000, 179.0000);
							Blue(0, 75.0000, 89.0000);
							Alpha(0, 0.0000, 0.0000);
							StartRotation(0, -20.0000, 20.0000);
							RotationVelocity(0, -20.0000, 20.0000);
							FadeInTime(0.0000);
						}
						Transformer()
						{
							LifeTime(2.8125);
							Position()
							{
								LifeTime(3.3750)
								Scale(0.0000);
							}
							Size(0)
							{
								LifeTime(2.8125)
								Scale(5.0000);
							}
							Color(0)
							{
								LifeTime(0.0225)
								Move(0.0000,0.0000,0.0000,48.0000);
								Next()
								{
									LifeTime(2.7900)
									Move(0.0000,0.0000,0.0000,-64.0000);
								}
							}
						}
						Geometry()
						{
							BlendMode("ADDITIVE");
							Type("PARTICLE");
							Texture("thicksmoke3");
						}
					}
				}
			}
		}
	}
	ParticleEmitter("Flames")
	{
		MaxParticles(8.0000,8.0000);
		StartDelay(0.0000,0.0000);
		BurstDelay(0.0010, 0.0010);
		BurstCount(8.0000,8.0000);
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
			Circle()
			{
				PositionX(-20.0000,20.0000);
				PositionY(-20.0000,20.0000);
				PositionZ(-20.0000,20.0000);
			}
			Offset()
			{
				PositionX(-1.9200,1.9200);
				PositionY(-1.9200,1.9200);
				PositionZ(-1.9200,1.9200);
			}
			PositionScale(0.0000,0.0000);
			VelocityScale(10.0000,10.0000);
			InheritVelocityFactor(0.0000,0.0000);
			Size(0, 1.4400, 2.8800);
			Red(0, 255.0000, 255.0000);
			Green(0, 204.0000, 233.0000);
			Blue(0, 98.0000, 185.0000);
			Alpha(0, 0.0000, 0.0000);
			StartRotation(0, 0.0000, 255.0000);
			RotationVelocity(0, -40.0000, 40.0000);
			FadeInTime(0.0000);
		}
		Transformer()
		{
			LifeTime(2.2500);
			Position()
			{
				LifeTime(2.2500)
				Scale(0.0000);
			}
			Size(0)
			{
				LifeTime(0.2250)
				Scale(4.0000);
				Next()
				{
					LifeTime(2.0250)
					Scale(3.0000);
				}
			}
			Color(0)
			{
				LifeTime(0.2250)
				Move(0.0000,-40.0000,-50.0000,255.0000);
				Next()
				{
					LifeTime(1.1250)
					Move(128.0000,-40.0000,-50.0000,-128.0000);
					Next()
					{
						LifeTime(0.9000)
						Move(128.0000,-50.0000,-50.0000,-128.0000);
					}
				}
			}
		}
		Geometry()
		{
			BlendMode("ADDITIVE");
			Type("PARTICLE");
			Texture("com_sfx_explosion2");
			ParticleEmitter("BlackSmoke")
			{
				MaxParticles(3.0000,3.0000);
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
						PositionX(-50.4000,50.4000);
						PositionY(-50.4000,50.4000);
						PositionZ(-50.4000,50.4000);
					}
					Offset()
					{
						PositionX(-2.5216,2.5216);
						PositionY(-2.5216,2.5216);
						PositionZ(-2.5216,2.5216);
					}
					PositionScale(0.0000,0.0000);
					VelocityScale(5.6250,5.6250);
					InheritVelocityFactor(0.1000,0.1000);
					Size(0, 10.0800, 20.1600);
					Red(0, 254.0000, 255.0000);
					Green(0, 172.0000, 179.0000);
					Blue(0, 75.0000, 89.0000);
					Alpha(0, 0.0000, 0.0000);
					StartRotation(0, -20.0000, 20.0000);
					RotationVelocity(0, -20.0000, 20.0000);
					FadeInTime(0.0000);
				}
				Transformer()
				{
					LifeTime(2.8125);
					Position()
					{
						LifeTime(3.3750)
						Scale(0.0000);
					}
					Size(0)
					{
						LifeTime(2.8125)
						Scale(5.0000);
					}
					Color(0)
					{
						LifeTime(0.0225)
						Move(0.0000,0.0000,0.0000,48.0000);
						Next()
						{
							LifeTime(2.7900)
							Move(0.0000,0.0000,0.0000,-64.0000);
						}
					}
				}
				Geometry()
				{
					BlendMode("ADDITIVE");
					Type("PARTICLE");
					Texture("thicksmoke3");
				}
			}
		}
		ParticleEmitter("Flare")
		{
			MaxParticles(10.0000,10.0000);
			StartDelay(0.0000,0.0000);
			BurstDelay(0.0000, 0.0000);
			BurstCount(10.0000,10.0000);
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
				Size(0, 64.0000, 64.0000);
				Red(0, 255.0000, 255.0000);
				Green(0, 200.0000, 255.0000);
				Blue(0, 100.0000, 220.0000);
				Alpha(0, 32.0000, 32.0000);
				StartRotation(0, 1.0000, 3.0000);
				RotationVelocity(0, 0.0000, 0.0000);
				FadeInTime(0.0000);
			}
			Transformer()
			{
				LifeTime(2.2500);
				Position()
				{
					LifeTime(2.2500)
				}
				Size(0)
				{
					LifeTime(0.2250)
				}
				Color(0)
				{
					LifeTime(2.2500)
					Move(0.0000,0.0000,0.0000,-32.0000);
				}
			}
			Geometry()
			{
				BlendMode("ADDITIVE");
				Type("BILLBOARD");
				Texture("com_sfx_flashball2");
			}
			ParticleEmitter("Embers")
			{
				MaxParticles(10.0000,10.0000);
				StartDelay(0.0000,0.0000);
				BurstDelay(0.0010, 0.0010);
				BurstCount(10.0000,10.0000);
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
						PositionX(-5.0000,5.0000);
						PositionY(-5.0000,5.0000);
						PositionZ(-5.0000,5.0000);
					}
					Offset()
					{
						PositionX(0.0000,0.0000);
						PositionY(0.0000,0.0000);
						PositionZ(0.0000,0.0000);
					}
					PositionScale(0.0000,0.0000);
					VelocityScale(5.0000,10.0000);
					InheritVelocityFactor(0.0000,0.0000);
					Size(0, 9.6000, 16.0000);
					Red(0, 255.0000, 255.0000);
					Green(0, 189.0000, 255.0000);
					Blue(0, 89.0000, 128.0000);
					Alpha(0, 255.0000, 255.0000);
					StartRotation(0, 0.0000, 360.0000);
					RotationVelocity(0, -90.0000, 90.0000);
					FadeInTime(0.0000);
				}
				Transformer()
				{
					LifeTime(2.2500);
					Position()
					{
						LifeTime(4.5000)
					}
					Size(0)
					{
						LifeTime(2.2500)
						Scale(1.5000);
					}
					Color(0)
					{
						LifeTime(2.2500)
						Reach(193.0000,116.0000,0.0000,0.0000);
					}
				}
				Geometry()
				{
					BlendMode("ADDITIVE");
					Type("PARTICLE");
					Texture("com_sfx_dirt1");
				}
			}
		}
	}
}
