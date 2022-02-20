ParticleEmitter("Water_Norm")
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
			PositionX(-0.0100,0.0100);
			PositionY(0.7500,1.0000);
			PositionZ(-0.2000,-0.2000);
		}
		Offset()
		{
			PositionX(0.0000,0.0000);
			PositionY(1.0000,1.0000);
			PositionZ(5.0000,5.0000);
		}
		PositionScale(0.5000,0.5000);
		VelocityScale(10.0000,10.0000);
		InheritVelocityFactor(0.0000,0.0000);
		Size(0, 0.5000, 0.7500);
		Hue(0, 0.0000, 0.0000);
		Saturation(0, 0.0000, 0.0000);
		Value(0, 255.0000, 255.0000);
		Alpha(0, 0.0000, 0.0000);
		StartRotation(0, 0.0000, 360.0000);
		RotationVelocity(0, -40.0000, 0.0000);
		FadeInTime(0.0000);
	}
	Transformer()
	{
		LifeTime(1.0000);
		Position()
		{
			LifeTime(1.0000)
			Accelerate(0.0000, -20.0000, 0.0000);
		}
		Size(0)
		{
			LifeTime(6.0000)
			Scale(2.0000);
		}
		Color(0)
		{
			LifeTime(0.0500)
			Move(0.0000,0.0000,0.0000,32.0000);
			Next()
			{
				LifeTime(1.0000)
				Move(0.0000,0.0000,0.0000,0.0000);
			}
		}
	}
	Geometry()
	{
		BlendMode("NORMAL");
		Type("PARTICLE");
		Texture("com_sfx_waterfoam1");
	}
	ParticleEmitter("Water_Add")
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
				PositionX(-0.0100,0.0100);
				PositionY(0.7500,1.0000);
				PositionZ(-0.2000,-0.2000);
			}
			Offset()
			{
				PositionX(0.0000,0.0000);
				PositionY(1.0000,1.0000);
				PositionZ(5.0000,5.0000);
			}
			PositionScale(0.5000,0.5000);
			VelocityScale(10.0000,10.0000);
			InheritVelocityFactor(0.0000,0.0000);
			Size(0, 0.5000, 0.7500);
			Hue(0, 0.0000, 0.0000);
			Saturation(0, 0.0000, 0.0000);
			Value(0, 255.0000, 255.0000);
			Alpha(0, 0.0000, 0.0000);
			StartRotation(0, 0.0000, 360.0000);
			RotationVelocity(0, -40.0000, 0.0000);
			FadeInTime(0.0000);
		}
		Transformer()
		{
			LifeTime(1.0000);
			Position()
			{
				LifeTime(1.0000)
				Accelerate(0.0000, -20.0000, 0.0000);
			}
			Size(0)
			{
				LifeTime(6.0000)
				Scale(2.0000);
			}
			Color(0)
			{
				LifeTime(0.0500)
				Move(0.0000,0.0000,0.0000,32.0000);
				Next()
				{
					LifeTime(1.0000)
					Move(0.0000,0.0000,0.0000,0.0000);
				}
			}
		}
		Geometry()
		{
			BlendMode("ADDITIVE");
			Type("PARTICLE");
			Texture("com_sfx_dirt1");
		}
		ParticleEmitter("Water_Norm")
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
					PositionX(-0.2000,-0.2000);
					PositionY(0.7500,1.0000);
					PositionZ(-0.0100,0.0100);
				}
				Offset()
				{
					PositionX(5.0000,5.0000);
					PositionY(1.0000,1.0000);
					PositionZ(0.0000,0.0000);
				}
				PositionScale(0.5000,0.5000);
				VelocityScale(10.0000,10.0000);
				InheritVelocityFactor(0.0000,0.0000);
				Size(0, 0.5000, 0.7500);
				Hue(0, 0.0000, 0.0000);
				Saturation(0, 0.0000, 0.0000);
				Value(0, 255.0000, 255.0000);
				Alpha(0, 0.0000, 0.0000);
				StartRotation(0, 0.0000, 360.0000);
				RotationVelocity(0, -40.0000, 0.0000);
				FadeInTime(0.0000);
			}
			Transformer()
			{
				LifeTime(1.0000);
				Position()
				{
					LifeTime(1.0000)
					Accelerate(0.0000, -20.0000, 0.0000);
				}
				Size(0)
				{
					LifeTime(6.0000)
					Scale(2.0000);
				}
				Color(0)
				{
					LifeTime(0.0500)
					Move(0.0000,0.0000,0.0000,32.0000);
					Next()
					{
						LifeTime(1.0000)
						Move(0.0000,0.0000,0.0000,0.0000);
					}
				}
			}
			Geometry()
			{
				BlendMode("NORMAL");
				Type("PARTICLE");
				Texture("com_sfx_waterfoam1");
			}
			ParticleEmitter("Water_Add")
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
						PositionX(-0.2000,-0.2000);
						PositionY(0.7500,1.0000);
						PositionZ(-0.0100,0.0100);
					}
					Offset()
					{
						PositionX(5.0000,5.0000);
						PositionY(1.0000,1.0000);
						PositionZ(0.0000,0.0000);
					}
					PositionScale(0.5000,0.5000);
					VelocityScale(10.0000,10.0000);
					InheritVelocityFactor(0.0000,0.0000);
					Size(0, 0.5000, 0.7500);
					Hue(0, 0.0000, 0.0000);
					Saturation(0, 0.0000, 0.0000);
					Value(0, 255.0000, 255.0000);
					Alpha(0, 0.0000, 0.0000);
					StartRotation(0, 0.0000, 360.0000);
					RotationVelocity(0, -40.0000, 0.0000);
					FadeInTime(0.0000);
				}
				Transformer()
				{
					LifeTime(1.0000);
					Position()
					{
						LifeTime(1.0000)
						Accelerate(0.0000, -20.0000, 0.0000);
					}
					Size(0)
					{
						LifeTime(6.0000)
						Scale(2.0000);
					}
					Color(0)
					{
						LifeTime(0.0500)
						Move(0.0000,0.0000,0.0000,32.0000);
						Next()
						{
							LifeTime(1.0000)
							Move(0.0000,0.0000,0.0000,0.0000);
						}
					}
				}
				Geometry()
				{
					BlendMode("ADDITIVE");
					Type("PARTICLE");
					Texture("com_sfx_dirt1");
				}
				ParticleEmitter("Water_Norm")
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
							PositionX(-0.0100,0.0100);
							PositionY(0.7500,1.0000);
							PositionZ(0.2000,0.2000);
						}
						Offset()
						{
							PositionX(0.0000,0.0000);
							PositionY(1.0000,1.0000);
							PositionZ(-5.0000,-5.0000);
						}
						PositionScale(0.5000,0.5000);
						VelocityScale(10.0000,10.0000);
						InheritVelocityFactor(0.0000,0.0000);
						Size(0, 0.5000, 0.7500);
						Hue(0, 0.0000, 0.0000);
						Saturation(0, 0.0000, 0.0000);
						Value(0, 255.0000, 255.0000);
						Alpha(0, 0.0000, 0.0000);
						StartRotation(0, 0.0000, 360.0000);
						RotationVelocity(0, -40.0000, 0.0000);
						FadeInTime(0.0000);
					}
					Transformer()
					{
						LifeTime(1.0000);
						Position()
						{
							LifeTime(1.0000)
							Accelerate(0.0000, -20.0000, 0.0000);
						}
						Size(0)
						{
							LifeTime(6.0000)
							Scale(2.0000);
						}
						Color(0)
						{
							LifeTime(0.0500)
							Move(0.0000,0.0000,0.0000,32.0000);
							Next()
							{
								LifeTime(1.0000)
								Move(0.0000,0.0000,0.0000,0.0000);
							}
						}
					}
					Geometry()
					{
						BlendMode("NORMAL");
						Type("PARTICLE");
						Texture("com_sfx_waterfoam1");
					}
					ParticleEmitter("Water_Add")
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
								PositionX(-0.0100,0.0100);
								PositionY(0.7500,1.0000);
								PositionZ(0.2000,0.2000);
							}
							Offset()
							{
								PositionX(0.0000,0.0000);
								PositionY(1.0000,1.0000);
								PositionZ(-5.0000,-5.0000);
							}
							PositionScale(0.5000,0.5000);
							VelocityScale(10.0000,10.0000);
							InheritVelocityFactor(0.0000,0.0000);
							Size(0, 0.5000, 0.7500);
							Hue(0, 0.0000, 0.0000);
							Saturation(0, 0.0000, 0.0000);
							Value(0, 255.0000, 255.0000);
							Alpha(0, 0.0000, 0.0000);
							StartRotation(0, 0.0000, 360.0000);
							RotationVelocity(0, -40.0000, 0.0000);
							FadeInTime(0.0000);
						}
						Transformer()
						{
							LifeTime(1.0000);
							Position()
							{
								LifeTime(1.0000)
								Accelerate(0.0000, -20.0000, 0.0000);
							}
							Size(0)
							{
								LifeTime(6.0000)
								Scale(2.0000);
							}
							Color(0)
							{
								LifeTime(0.0500)
								Move(0.0000,0.0000,0.0000,32.0000);
								Next()
								{
									LifeTime(1.0000)
									Move(0.0000,0.0000,0.0000,0.0000);
								}
							}
						}
						Geometry()
						{
							BlendMode("ADDITIVE");
							Type("PARTICLE");
							Texture("com_sfx_dirt1");
						}
						ParticleEmitter("Water_Norm")
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
									PositionX(0.2000,0.2000);
									PositionY(0.7500,1.0000);
									PositionZ(-0.0100,0.0100);
								}
								Offset()
								{
									PositionX(-5.0000,-5.0000);
									PositionY(1.0000,1.0000);
									PositionZ(0.0000,0.0000);
								}
								PositionScale(0.5000,0.5000);
								VelocityScale(10.0000,10.0000);
								InheritVelocityFactor(0.0000,0.0000);
								Size(0, 0.5000, 0.7500);
								Hue(0, 0.0000, 0.0000);
								Saturation(0, 0.0000, 0.0000);
								Value(0, 255.0000, 255.0000);
								Alpha(0, 0.0000, 0.0000);
								StartRotation(0, 0.0000, 360.0000);
								RotationVelocity(0, -40.0000, 0.0000);
								FadeInTime(0.0000);
							}
							Transformer()
							{
								LifeTime(1.0000);
								Position()
								{
									LifeTime(1.0000)
									Accelerate(0.0000, -20.0000, 0.0000);
								}
								Size(0)
								{
									LifeTime(6.0000)
									Scale(2.0000);
								}
								Color(0)
								{
									LifeTime(0.0500)
									Move(0.0000,0.0000,0.0000,32.0000);
									Next()
									{
										LifeTime(1.0000)
										Move(0.0000,0.0000,0.0000,0.0000);
									}
								}
							}
							Geometry()
							{
								BlendMode("NORMAL");
								Type("PARTICLE");
								Texture("com_sfx_waterfoam1");
							}
							ParticleEmitter("Water_Add")
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
										PositionX(0.2000,0.2000);
										PositionY(0.7500,1.0000);
										PositionZ(-0.0100,0.0100);
									}
									Offset()
									{
										PositionX(-5.0000,-5.0000);
										PositionY(1.0000,1.0000);
										PositionZ(0.0000,0.0000);
									}
									PositionScale(0.5000,0.5000);
									VelocityScale(10.0000,10.0000);
									InheritVelocityFactor(0.0000,0.0000);
									Size(0, 0.5000, 0.7500);
									Hue(0, 0.0000, 0.0000);
									Saturation(0, 0.0000, 0.0000);
									Value(0, 255.0000, 255.0000);
									Alpha(0, 0.0000, 0.0000);
									StartRotation(0, 0.0000, 360.0000);
									RotationVelocity(0, -40.0000, 0.0000);
									FadeInTime(0.0000);
								}
								Transformer()
								{
									LifeTime(1.0000);
									Position()
									{
										LifeTime(1.0000)
										Accelerate(0.0000, -20.0000, 0.0000);
									}
									Size(0)
									{
										LifeTime(6.0000)
										Scale(2.0000);
									}
									Color(0)
									{
										LifeTime(0.0500)
										Move(0.0000,0.0000,0.0000,32.0000);
										Next()
										{
											LifeTime(1.0000)
											Move(0.0000,0.0000,0.0000,0.0000);
										}
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
			}
		}
	}
}
