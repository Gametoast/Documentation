ParticleEmitter("Foam")
{
	MaxParticles(-1.0000,-1.0000);
	StartDelay(0.0000,0.0000);
	BurstDelay(0.1000, 0.1000);
	BurstCount(1.0000,1.0000);
	MaxLodDist(50.0000);
	MinLodDist(10.0000);
	BoundingRadius(25.0);
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
			PositionY(0.0000,0.0000);
			PositionZ(0.0000,0.0000);
		}
		PositionScale(0.0000,0.0000);
		VelocityScale(0.1000,0.3500);
		InheritVelocityFactor(0.0000,0.0000);
		Size(0, 1.0000, 1.9000);
		Red(0, 255.0000, 255.0000);
		Green(0, 255.0000, 255.0000);
		Blue(0, 255.0000, 255.0000);
		Alpha(0, 0.0000, 0.0000);
		StartRotation(0, 4.0000, 4.9000);
		RotationVelocity(0, 0.0000, 0.0000);
		FadeInTime(0.0000);
	}
	Transformer()
	{
		LifeTime(2.0000);
		Position()
		{
			LifeTime(0.2000)
		}
		Size(0)
		{
			LifeTime(2.0000)
			Scale(3.0000);
		}
		Color(0)
		{
			LifeTime(0.2500)
			Reach(255.0000,255.0000,255.0000,64.0000);
			Next()
			{
				LifeTime(1.7500)
				Reach(255.0000,255.0000,255.0000,0.0000);
			}
		}
	}
	Geometry()
	{
		BlendMode("NORMAL");
		Type("BILLBOARD");
		Texture("com_sfx_waterfoam1");
	}
	ParticleEmitter("WaterFountain")
	{
		MaxParticles(-1.0000,-1.0000);
		StartDelay(0.0000,0.0000);
		BurstDelay(0.0500, 0.0500);
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
				PositionX(-0.2500,0.2500);
				PositionY(3.5600,4.0000);
				PositionZ(-0.2500,0.2500);
			}
			Offset()
			{
				PositionX(-0.2500,0.2500);
				PositionY(0.0000,0.1000);
				PositionZ(-0.2500,0.2500);
			}
			PositionScale(0.0000,0.0000);
			VelocityScale(3.2500,3.2500);
			InheritVelocityFactor(0.0000,0.0000);
			Size(0, 0.8000, 1.0000);
			Red(0, 200.0000, 200.0000);
			Green(0, 200.0000, 200.0000);
			Blue(0, 200.0000, 200.0000);
			Alpha(0, 255.0000, 255.0000);
			StartRotation(0, 0.0000, 0.0000);
			RotationVelocity(0, 0.0000, 0.0000);
			FadeInTime(0.0000);
		}
		Transformer()
		{
			LifeTime(1.9000);
			Position()
			{
				LifeTime(3.0000)
				Accelerate(0.0000, -45.0000, 0.0000);
			}
			Size(0)
			{
				LifeTime(3.0000)
				Scale(10.0000);
			}
			Color(0)
			{
				LifeTime(3.0000)
				Reach(200.0000,200.0000,200.0000,255.0000);
				Next()
				{
					LifeTime(4.0000)
					Move(0.0000,0.0000,0.0000,-170.0000);
				}
			}
		}
		Geometry()
		{
			BlendMode("NORMAL");
			Type("PARTICLE");
			Texture("com_sfx_waterspray1");
		}
		ParticleEmitter("WaterFountain")
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
				Spread()
				{
					PositionX(-0.3000,0.3000);
					PositionY(3.5000,4.0000);
					PositionZ(-0.3000,0.3000);
				}
				Offset()
				{
					PositionX(-0.3000,0.3000);
					PositionY(0.0000,0.1000);
					PositionZ(-0.3000,0.3000);
				}
				PositionScale(0.0000,0.0000);
				VelocityScale(3.5000,3.5000);
				InheritVelocityFactor(0.0000,0.0000);
				Size(0, 0.6000, 0.9000);
				Red(0, 200.0000, 200.0000);
				Green(0, 200.0000, 200.0000);
				Blue(0, 200.0000, 200.0000);
				Alpha(0, 64.0000, 64.0000);
				StartRotation(0, -180.0000, 0.0000);
				RotationVelocity(0, 0.0000, 0.0000);
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
					LifeTime(1.6000)
					Reach(200.0000,200.0000,200.0000,5.0000);
				}
			}
			Geometry()
			{
				BlendMode("ADDITIVE");
				Type("PARTICLE");
				Texture("com_sfx_dirt1");
			}
			ParticleEmitter("WaterFountain")
			{
				MaxParticles(-1.0000,-1.0000);
				StartDelay(0.0000,0.0000);
				BurstDelay(0.5000, 0.5000);
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
					Size(0, 3.0000, 5.0000);
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
						Reach(255.0000,255.0000,255.0000,48.0000);
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
					Texture("com_sfx_smoke3");
				}
				ParticleEmitter("flyerspray")
				{
					MaxParticles(-1.0000,-1.0000);
					StartDelay(0.0000,0.0000);
					BurstDelay(0.2000, 0.2000);
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
							PositionY(0.0000,0.0000);
							PositionZ(0.0000,0.0000);
						}
						PositionScale(0.2500,0.2500);
						VelocityScale(2.0000,2.0000);
						InheritVelocityFactor(0.0000,0.0000);
						Size(0, 0.5000, 0.8500);
						Red(0, 250.0000, 250.0000);
						Green(0, 250.0000, 250.0000);
						Blue(0, 255.0000, 255.0000);
						Alpha(0, 0.0000, 0.0000);
						StartRotation(0, 0.0000, 0.0000);
						RotationVelocity(0, 0.0000, 0.0000);
						FadeInTime(0.0000);
					}
					Transformer()
					{
						LifeTime(1.0000);
						Position()
						{
							LifeTime(0.0000)
						}
						Size(0)
						{
							LifeTime(1.0000)
							Scale(7.5000);
						}
						Color(0)
						{
							LifeTime(0.5000)
							Move(0.0000,0.0000,0.0000,48.0000);
							Next()
							{
								LifeTime(0.5000)
								Move(0.0000,0.0000,0.0000,-48.0000);
							}
						}
					}
					Geometry()
					{
						BlendMode("ADDITIVE");
						Type("BILLBOARD");
						Texture("com_sfx_flashring1");
					}
					ParticleEmitter("Hailfire_Wake")
					{
						MaxParticles(-1.0000,-1.0000);
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
							Circle()
							{
								PositionX(-0.4000,0.4000);
								PositionY(0.0500,0.1000);
								PositionZ(-0.4000,0.4000);
							}
							Offset()
							{
								PositionX(-0.5000,0.5000);
								PositionY(0.0000,0.0000);
								PositionZ(-0.5000,0.5000);
							}
							PositionScale(1.0000,1.0000);
							VelocityScale(2.0000,2.5000);
							InheritVelocityFactor(0.0000,0.0000);
							Size(0, 0.8000, 1.0000);
							Red(0, 236.0000, 236.0000);
							Green(0, 245.0000, 245.0000);
							Blue(0, 255.0000, 255.0000);
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
								Accelerate(0.0000, -2.0000, 0.0000);
							}
							Size(0)
							{
								LifeTime(2.0000)
								Scale(4.0000);
							}
							Color(0)
							{
								LifeTime(0.2000)
								Reach(236.0000,245.0000,255.0000,32.0000);
								Next()
								{
									LifeTime(0.8000)
									Reach(236.0000,245.0000,255.0000,0.0000);
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
}
