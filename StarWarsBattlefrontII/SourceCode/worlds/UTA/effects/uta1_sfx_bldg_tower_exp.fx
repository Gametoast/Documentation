ParticleEmitter("Explosion_Base")
{
	MaxParticles(20.0000,20.0000);
	StartDelay(1.2500,1.2500);
	BurstDelay(0.1000, 0.1000);
	BurstCount(20.0000,20.0000);
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
			PositionX(-1.0000,1.0000);
			PositionY(0.0000,0.0000);
			PositionZ(-1.0000,1.0000);
		}
		Offset()
		{
			PositionX(0.0000,0.0000);
			PositionY(1.0000,1.0000);
			PositionZ(0.0000,0.0000);
		}
		PositionScale(6.0000,6.0000);
		VelocityScale(5.0000,5.0000);
		InheritVelocityFactor(0.0000,0.0000);
		Size(0, 1.0000, 2.0000);
		Red(0, 255.0000, 255.0000);
		Green(0, 255.0000, 255.0000);
		Blue(0, 255.0000, 255.0000);
		Alpha(0, 255.0000, 255.0000);
		StartRotation(0, 0.0000, 0.0000);
		RotationVelocity(0, 0.0000, 0.0000);
		FadeInTime(0.0000);
	}
	Transformer()
	{
		LifeTime(4.0000);
		Position()
		{
			LifeTime(4.0000)
		}
		Size(0)
		{
			LifeTime(4.0000)
			Scale(1.0000);
		}
		Color(0)
		{
			LifeTime(0.0625)
			Reach(255.0000,255.0000,255.0000,255.0000);
		}
	}
	Geometry()
	{
		BlendMode("ADDITIVE");
		Type("EMITTER");
		Texture("flare0");
		ParticleEmitter("BlackSmoke")
		{
			MaxParticles(6.0000,6.0000);
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
				VelocityScale(0.5000,0.5000);
				InheritVelocityFactor(0.2000,0.2000);
				Size(0, 1.0000, 1.5000);
				Hue(0, 12.0000, 20.0000);
				Saturation(0, 10.0000, 25.0000);
				Value(0, 80.0000, 200.0000);
				Alpha(0, 0.0000, 128.0000);
				StartRotation(0, -20.0000, 20.0000);
				RotationVelocity(0, -90.0000, 90.0000);
				FadeInTime(0.0000);
			}
			Transformer()
			{
				LifeTime(4.0000);
				Position()
				{
					LifeTime(4.0000)
				}
				Size(0)
				{
					LifeTime(3.0000)
					Scale(5.0000);
				}
				Color(0)
				{
					LifeTime(1.0000)
					Move(0.0000,0.0000,0.0000,128.0000);
					Next()
					{
						LifeTime(3.0000)
						Move(0.0000,0.0000,0.0000,-255.0000);
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
	ParticleEmitter("Explosion_Bottom_Smoke")
	{
		MaxParticles(6.0000,6.0000);
		StartDelay(0.0000,0.0000);
		BurstDelay(0.1000, 0.1000);
		BurstCount(6.0000,6.0000);
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
				PositionX(-0.0500,0.0500);
				PositionY(0.0000,0.0000);
				PositionZ(-0.0500,0.0500);
			}
			Offset()
			{
				PositionX(0.0000,0.0000);
				PositionY(12.0000,12.0000);
				PositionZ(0.0000,0.0000);
			}
			PositionScale(5.0000,5.0000);
			VelocityScale(0.0500,0.0510);
			InheritVelocityFactor(0.0000,0.0000);
			Size(0, 1.5000, 1.5000);
			Red(0, 255.0000, 255.0000);
			Green(0, 255.0000, 255.0000);
			Blue(0, 255.0000, 255.0000);
			Alpha(0, 255.0000, 255.0000);
			StartRotation(0, 0.0000, 0.0000);
			RotationVelocity(0, 0.0000, 0.0000);
			FadeInTime(0.0000);
		}
		Transformer()
		{
			LifeTime(1.8750);
			Position()
			{
				LifeTime(0.3125)
			}
			Size(0)
			{
				LifeTime(1.8750)
				Scale(0.1000);
			}
			Color(0)
			{
				LifeTime(0.0625)
				Reach(255.0000,255.0000,255.0000,255.0000);
			}
		}
		Geometry()
		{
			BlendMode("ADDITIVE");
			Type("EMITTER");
			Texture("flare0");
			ParticleEmitter("BlackSmoke")
			{
				MaxParticles(8.0000,8.0000);
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
						PositionX(-0.0500,0.0500);
						PositionY(-0.0500,0.0500);
						PositionZ(-0.0500,0.0500);
					}
					Offset()
					{
						PositionX(-0.0750,0.0750);
						PositionY(-0.0750,0.0750);
						PositionZ(-0.0750,0.0750);
					}
					PositionScale(0.0000,0.0000);
					VelocityScale(20.0000,30.0000);
					InheritVelocityFactor(0.6000,0.6000);
					Size(0, 2.0000, 6.0000);
					Hue(0, 12.0000, 20.0000);
					Saturation(0, 10.0000, 25.0000);
					Value(0, 80.0000, 200.0000);
					Alpha(0, 0.0000, 0.0000);
					StartRotation(0, -20.0000, 20.0000);
					RotationVelocity(0, -20.0000, 20.0000);
					FadeInTime(0.0000);
				}
				Transformer()
				{
					LifeTime(1.8750);
					Position()
					{
						LifeTime(1.8750)
						Scale(0.0000);
					}
					Size(0)
					{
						LifeTime(2.5000)
						Scale(3.0000);
					}
					Color(0)
					{
						LifeTime(0.1250)
						Move(0.0000,0.0000,0.0000,255.0000);
						Next()
						{
							LifeTime(1.7500)
							Move(0.0000,0.0000,0.0000,-255.0000);
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
		ParticleEmitter("Explosion_Bottom_Flash")
		{
			MaxParticles(18.0000,18.0000);
			StartDelay(0.0000,0.0000);
			BurstDelay(0.1000, 0.1000);
			BurstCount(18.0000,18.0000);
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
					PositionX(-0.0500,0.0500);
					PositionY(0.0000,0.0000);
					PositionZ(-0.0500,0.0500);
				}
				Offset()
				{
					PositionX(0.0000,0.0000);
					PositionY(12.0000,12.0000);
					PositionZ(0.0000,0.0000);
				}
				PositionScale(5.0000,5.0000);
				VelocityScale(0.0500,0.0500);
				InheritVelocityFactor(0.0000,0.0000);
				Size(0, 3.0000, 7.0000);
				Red(0, 255.0000, 255.0000);
				Green(0, 218.0000, 239.0000);
				Blue(0, 106.0000, 202.0000);
				Alpha(0, 128.0000, 255.0000);
				StartRotation(0, 0.0000, 360.0000);
				RotationVelocity(0, -20.0000, 20.0000);
				FadeInTime(0.0000);
			}
			Transformer()
			{
				LifeTime(1.8750);
				Position()
				{
					LifeTime(0.3125)
				}
				Size(0)
				{
					LifeTime(1.8750)
					Scale(0.1000);
				}
				Color(0)
				{
					LifeTime(1.0000)
					Move(0.0000,0.0000,0.0000,-255.0000);
				}
			}
			Geometry()
			{
				BlendMode("ADDITIVE");
				Type("PARTICLE");
				Texture("com_sfx_flashball2");
				ParticleEmitter("BlackSmoke")
				{
					MaxParticles(8.0000,8.0000);
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
							PositionX(-0.0500,0.0500);
							PositionY(-0.0500,0.0500);
							PositionZ(-0.0500,0.0500);
						}
						Offset()
						{
							PositionX(-0.0750,0.0750);
							PositionY(-0.0750,0.0750);
							PositionZ(-0.0750,0.0750);
						}
						PositionScale(0.0000,0.0000);
						VelocityScale(20.0000,30.0000);
						InheritVelocityFactor(0.2000,0.2000);
						Size(0, 0.7500, 1.0500);
						Hue(0, 12.0000, 20.0000);
						Saturation(0, 10.0000, 25.0000);
						Value(0, 80.0000, 200.0000);
						Alpha(0, 0.0000, 0.0000);
						StartRotation(0, -20.0000, 20.0000);
						RotationVelocity(0, -20.0000, 20.0000);
						FadeInTime(0.0000);
					}
					Transformer()
					{
						LifeTime(1.8750);
						Position()
						{
							LifeTime(1.8750)
							Scale(0.0000);
						}
						Size(0)
						{
							LifeTime(2.5000)
							Scale(6.0000);
						}
						Color(0)
						{
							LifeTime(0.1250)
							Move(0.0000,0.0000,0.0000,255.0000);
							Next()
							{
								LifeTime(1.7500)
								Move(0.0000,0.0000,0.0000,-255.0000);
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
			ParticleEmitter("Explosion_Middle_Smoke")
			{
				MaxParticles(6.0000,6.0000);
				StartDelay(0.1000,0.1000);
				BurstDelay(0.1000, 0.1000);
				BurstCount(6.0000,6.0000);
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
						PositionX(-0.0500,0.0500);
						PositionY(0.0000,0.0000);
						PositionZ(-0.0500,0.0500);
					}
					Offset()
					{
						PositionX(0.0000,0.0000);
						PositionY(18.0000,18.0000);
						PositionZ(0.0000,0.0000);
					}
					PositionScale(2.0000,2.0000);
					VelocityScale(1.0000,1.0010);
					InheritVelocityFactor(0.0000,0.0000);
					Size(0, 0.5000, 1.0000);
					Red(0, 255.0000, 255.0000);
					Green(0, 255.0000, 255.0000);
					Blue(0, 255.0000, 255.0000);
					Alpha(0, 255.0000, 255.0000);
					StartRotation(0, 0.0000, 0.0000);
					RotationVelocity(0, 0.0000, 0.0000);
					FadeInTime(0.0000);
				}
				Transformer()
				{
					LifeTime(1.8750);
					Position()
					{
						LifeTime(0.3125)
					}
					Size(0)
					{
						LifeTime(1.8750)
						Scale(0.1000);
					}
					Color(0)
					{
						LifeTime(0.0625)
						Reach(255.0000,255.0000,255.0000,255.0000);
					}
				}
				Geometry()
				{
					BlendMode("ADDITIVE");
					Type("EMITTER");
					Texture("flare0");
					ParticleEmitter("BlackSmoke")
					{
						MaxParticles(8.0000,8.0000);
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
								PositionX(-0.0500,0.0500);
								PositionY(-0.0500,0.0500);
								PositionZ(-0.0500,0.0500);
							}
							Offset()
							{
								PositionX(-0.0750,0.0750);
								PositionY(-0.0750,0.0750);
								PositionZ(-0.0750,0.0750);
							}
							PositionScale(0.0000,0.0000);
							VelocityScale(20.0000,30.0000);
							InheritVelocityFactor(0.2000,0.2000);
							Size(0, 2.0000, 6.0000);
							Hue(0, 12.0000, 20.0000);
							Saturation(0, 10.0000, 25.0000);
							Value(0, 80.0000, 200.0000);
							Alpha(0, 0.0000, 0.0000);
							StartRotation(0, -20.0000, 20.0000);
							RotationVelocity(0, -20.0000, 20.0000);
							FadeInTime(0.0000);
						}
						Transformer()
						{
							LifeTime(1.8750);
							Position()
							{
								LifeTime(1.8750)
								Scale(0.0000);
							}
							Size(0)
							{
								LifeTime(2.5000)
								Scale(3.0000);
							}
							Color(0)
							{
								LifeTime(0.1250)
								Move(0.0000,0.0000,0.0000,255.0000);
								Next()
								{
									LifeTime(1.7500)
									Move(0.0000,0.0000,0.0000,-255.0000);
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
				ParticleEmitter("Explosion_Middle_Flash")
				{
					MaxParticles(18.0000,18.0000);
					StartDelay(0.1000,0.1000);
					BurstDelay(0.1000, 0.1000);
					BurstCount(18.0000,18.0000);
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
							PositionX(-0.0500,0.0500);
							PositionY(0.0000,0.0000);
							PositionZ(-0.0500,0.0500);
						}
						Offset()
						{
							PositionX(0.0000,0.0000);
							PositionY(18.0000,18.0000);
							PositionZ(0.0000,0.0000);
						}
						PositionScale(1.5000,1.5000);
						VelocityScale(0.0500,0.1000);
						InheritVelocityFactor(0.0000,0.0000);
						Size(0, 4.0000, 7.0000);
						Red(0, 255.0000, 255.0000);
						Green(0, 179.0000, 245.0000);
						Blue(0, 64.0000, 191.0000);
						Alpha(0, 128.0000, 255.0000);
						StartRotation(0, 0.0000, 360.0000);
						RotationVelocity(0, -20.0000, 20.0000);
						FadeInTime(0.0000);
					}
					Transformer()
					{
						LifeTime(1.8750);
						Position()
						{
							LifeTime(0.3125)
						}
						Size(0)
						{
							LifeTime(1.8750)
							Scale(0.1000);
						}
						Color(0)
						{
							LifeTime(1.0000)
							Move(0.0000,0.0000,0.0000,-255.0000);
						}
					}
					Geometry()
					{
						BlendMode("ADDITIVE");
						Type("PARTICLE");
						Texture("com_sfx_flashball2");
						ParticleEmitter("BlackSmoke")
						{
							MaxParticles(8.0000,8.0000);
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
									PositionX(-0.0500,0.0500);
									PositionY(-0.0500,0.0500);
									PositionZ(-0.0500,0.0500);
								}
								Offset()
								{
									PositionX(-0.0750,0.0750);
									PositionY(-0.0750,0.0750);
									PositionZ(-0.0750,0.0750);
								}
								PositionScale(0.0000,0.0000);
								VelocityScale(20.0000,30.0000);
								InheritVelocityFactor(0.2000,0.2000);
								Size(0, 0.7500, 1.0500);
								Hue(0, 12.0000, 20.0000);
								Saturation(0, 10.0000, 25.0000);
								Value(0, 80.0000, 200.0000);
								Alpha(0, 0.0000, 0.0000);
								StartRotation(0, -20.0000, 20.0000);
								RotationVelocity(0, -20.0000, 20.0000);
								FadeInTime(0.0000);
							}
							Transformer()
							{
								LifeTime(1.8750);
								Position()
								{
									LifeTime(1.8750)
									Scale(0.0000);
								}
								Size(0)
								{
									LifeTime(2.5000)
									Scale(6.0000);
								}
								Color(0)
								{
									LifeTime(0.1250)
									Move(0.0000,0.0000,0.0000,255.0000);
									Next()
									{
										LifeTime(1.7500)
										Move(0.0000,0.0000,0.0000,-255.0000);
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
					ParticleEmitter("Shockwave")
					{
						MaxParticles(1.0000,1.0000);
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
							Spread()
							{
								PositionX(0.0000,0.0000);
								PositionY(0.0000,0.0000);
								PositionZ(0.0000,0.0000);
							}
							Offset()
							{
								PositionX(0.0000,0.0000);
								PositionY(12.0000,12.0000);
								PositionZ(0.0000,0.0000);
							}
							PositionScale(0.0000,0.0000);
							VelocityScale(0.0000,0.0000);
							InheritVelocityFactor(0.0000,0.0000);
							Size(0, 2.0000, 2.0000);
							Red(0, 255.0000, 255.0000);
							Green(0, 255.0000, 255.0000);
							Blue(0, 255.0000, 255.0000);
							Alpha(0, 32.0000, 32.0000);
							StartRotation(0, 0.0000, 0.0000);
							RotationVelocity(0, 0.0000, 0.0000);
							FadeInTime(0.0000);
						}
						Transformer()
						{
							LifeTime(0.7500);
							Position()
							{
								LifeTime(1.0000)
							}
							Size(0)
							{
								LifeTime(0.5000)
								Scale(10.0000);
								Next()
								{
									LifeTime(0.2500)
									Scale(1.5000);
								}
							}
							Color(0)
							{
								LifeTime(0.7500)
								Reach(255.0000,255.0000,255.0000,0.0000);
							}
						}
						Geometry()
						{
							BlendMode("ADDITIVE");
							Type("BILLBOARD");
							Texture("com_sfx_flashring1");
						}
						ParticleEmitter("Shockwave")
						{
							MaxParticles(1.0000,1.0000);
							StartDelay(0.1000,0.1000);
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
								Spread()
								{
									PositionX(0.0000,0.0000);
									PositionY(0.0000,0.0000);
									PositionZ(0.0000,0.0000);
								}
								Offset()
								{
									PositionX(0.0000,0.0000);
									PositionY(18.0000,18.0000);
									PositionZ(0.0000,0.0000);
								}
								PositionScale(0.0000,0.0000);
								VelocityScale(0.0000,0.0000);
								InheritVelocityFactor(0.0000,0.0000);
								Size(0, 2.0000, 2.0000);
								Red(0, 255.0000, 255.0000);
								Green(0, 255.0000, 255.0000);
								Blue(0, 255.0000, 255.0000);
								Alpha(0, 32.0000, 32.0000);
								StartRotation(0, 0.0000, 0.0000);
								RotationVelocity(0, 0.0000, 0.0000);
								FadeInTime(0.0000);
							}
							Transformer()
							{
								LifeTime(0.7500);
								Position()
								{
									LifeTime(1.0000)
								}
								Size(0)
								{
									LifeTime(0.5000)
									Scale(10.0000);
									Next()
									{
										LifeTime(0.2500)
										Scale(1.5000);
									}
								}
								Color(0)
								{
									LifeTime(0.7500)
									Reach(255.0000,255.0000,255.0000,0.0000);
								}
							}
							Geometry()
							{
								BlendMode("ADDITIVE");
								Type("BILLBOARD");
								Texture("com_sfx_flashring1");
							}
							ParticleEmitter("Sparks")
							{
								MaxParticles(100.0000,100.0000);
								StartDelay(0.0000,0.0000);
								BurstDelay(0.0000, 0.0000);
								BurstCount(10.0000,10.0000);
								MaxLodDist(10000.0000);
								MinLodDist(8000.0000);
								BoundingRadius(5.0);
								SoundName("")
								Size(1.0000, 1.0000);
								Red(255.0000, 255.0000);
								Green(255.0000, 255.0000);
								Blue(255.0000, 255.0000);
								Alpha(255.0000, 255.0000);
								Spawner()
								{
									Circle()
									{
										PositionX(-1.0000,1.0000);
										PositionY(-0.2500,1.0000);
										PositionZ(-1.0000,1.0000);
									}
									Offset()
									{
										PositionX(0.0000,0.0000);
										PositionY(14.0000,14.0000);
										PositionZ(0.0000,0.0000);
									}
									PositionScale(3.0000,3.0000);
									VelocityScale(2.5000,4.5000);
									InheritVelocityFactor(0.0000,0.0000);
									Size(0, 0.0250, 0.0500);
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
									LifeTime(3.0000);
									Position()
									{
										LifeTime(2.0000)
										Accelerate(0.0000, -7.5000, 0.0000);
									}
									Size(0)
									{
										LifeTime(3.0000)
										Scale(0.0000);
									}
									Color(0)
									{
										LifeTime(3.0000)
										Move(0.0000,0.0000,0.0000,0.0000);
									}
								}
								Geometry()
								{
									BlendMode("ADDITIVE");
									Type("SPARK");
									SparkLength(0.0300);
									Texture("com_sfx_laser_orange");
								}
							}
						}
					}
				}
			}
		}
	}
}
