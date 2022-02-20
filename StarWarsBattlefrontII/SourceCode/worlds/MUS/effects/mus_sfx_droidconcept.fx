ParticleEmitter("DroidMesh")
{
	MaxParticles(-1.0000,-1.0000);
	StartDelay(0.0000,0.0000);
	BurstDelay(10.0001, 10.0001);
	BurstCount(2.0000,2.0000);
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
			PositionY(1.0000,1.0000);
			PositionZ(0.0000,0.0000);
		}
		PositionScale(0.0000,0.0000);
		VelocityScale(0.0000,0.0000);
		InheritVelocityFactor(0.0000,0.0000);
		Size(0, 1.0000, 1.0000);
		Red(0, 85.0000, 85.0000);
		Green(0, 170.0000, 170.0000);
		Blue(0, 255.0000, 255.0000);
		Alpha(0, 0.0000, 0.0000);
		StartRotation(0, 0.0000, 0.0000);
		RotationVelocity(0, 0.6300, 0.6300);
		FadeInTime(0.0000);
	}
	Transformer()
	{
		LifeTime(10.0000);
		Position()
		{
			LifeTime(0.9999)
		}
		Size(0)
		{
			LifeTime(0.1000)
			Scale(1.0000);
		}
		Color(0)
		{
			LifeTime(0.0001)
			Move(0.0000,0.0000,0.0000,255.0000);
		}
	}
	Geometry()
	{
		BlendMode("ADDITIVE");
		Type("GEOMETRY");
		Model("mus_sfx_droidconcept");
		ParticleEmitter("!Mesh")
		{
			MaxParticles(-1.0000,-1.0000);
			StartDelay(0.0000,0.0000);
			BurstDelay(10.0001, 10.0001);
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
				Size(0, 1.0000, 1.0000);
				Red(0, 255.0000, 255.0000);
				Green(0, 255.0000, 255.0000);
				Blue(0, 200.0000, 200.0000);
				Alpha(0, 0.0000, 0.0000);
				StartRotation(0, 0.0000, 0.0000);
				RotationVelocity(0, 0.0000, 0.0000);
				FadeInTime(0.0000);
			}
			Transformer()
			{
				LifeTime(10.0000);
				Position()
				{
					LifeTime(0.9999)
				}
				Size(0)
				{
					LifeTime(0.1000)
					Scale(1.0000);
				}
				Color(0)
				{
					LifeTime(0.0001)
					Move(0.0000,0.0000,0.0000,128.0000);
				}
			}
			Geometry()
			{
				BlendMode("ADDITIVE");
				Type("GEOMETRY");
				Model("mus_sfx_droidconcept");
			}
		}
	}
	ParticleEmitter("Border")
	{
		MaxParticles(-1.0000,-1.0000);
		StartDelay(0.0000,0.0000);
		BurstDelay(10.0000, 10.0000);
		BurstCount(2.0000,2.0000);
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
				PositionY(2.1000,2.1000);
				PositionZ(0.0000,0.0000);
			}
			PositionScale(0.0000,0.0000);
			VelocityScale(0.0000,0.0000);
			InheritVelocityFactor(0.0000,0.0000);
			Size(0, 3.0000, 3.0000);
			Red(0, 85.0000, 85.0000);
			Green(0, 170.0000, 170.0000);
			Blue(0, 255.0000, 255.0000);
			Alpha(0, 0.0000, 0.0000);
			StartRotation(0, 0.0000, 0.0000);
			RotationVelocity(0, 0.0000, 0.0000);
			FadeInTime(0.0000);
		}
		Transformer()
		{
			LifeTime(10.0000);
			Position()
			{
				LifeTime(10.0000)
			}
			Size(0)
			{
				LifeTime(0.1000)
				Scale(1.0000);
			}
			Color(0)
			{
				LifeTime(0.0001)
				Move(0.0000,0.0000,0.0000,128.0000);
			}
		}
		Geometry()
		{
			BlendMode("ADDITIVE");
			Type("PARTICLE");
			Texture("mus_sfx_droidconcept_border");
		}
		ParticleEmitter("Data")
		{
			MaxParticles(-1.0000,-1.0000);
			StartDelay(0.0000,0.0000);
			BurstDelay(0.5000, 0.5000);
			BurstCount(15.0000,25.0000);
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
					PositionY(2.1000,2.1000);
					PositionZ(0.0000,0.0000);
				}
				PositionScale(0.0000,0.0000);
				VelocityScale(0.0000,0.0000);
				InheritVelocityFactor(0.0000,0.0000);
				Size(0, 2.5000, 3.0000);
				Red(0, 85.0000, 85.0000);
				Green(0, 170.0000, 170.0000);
				Blue(0, 255.0000, 255.0000);
				Alpha(0, 0.0000, 0.0000);
				StartRotation(0, -720.0000, 0.0000);
				RotationVelocity(0, -180.0000, 180.0000);
				FadeInTime(0.0000);
			}
			Transformer()
			{
				LifeTime(1.0000);
				Position()
				{
					LifeTime(10.0000)
				}
				Size(0)
				{
					LifeTime(0.1000)
					Scale(1.0000);
				}
				Color(0)
				{
					LifeTime(0.0001)
					Move(0.0000,0.0000,0.0000,16.0000);
				}
			}
			Geometry()
			{
				BlendMode("ADDITIVE");
				Type("PARTICLE");
				Texture("mus_sfx_droidconcept_border2");
			}
			ParticleEmitter("Points")
			{
				MaxParticles(-1.0000,-1.0000);
				StartDelay(0.0000,0.0000);
				BurstDelay(0.1000, 0.6000);
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
						PositionY(2.1000,2.1000);
						PositionZ(0.0000,0.0000);
					}
					PositionScale(0.0000,0.0000);
					VelocityScale(0.0000,0.0000);
					InheritVelocityFactor(0.0000,0.0000);
					Size(0, 1.7500, 2.2500);
					Red(0, 200.0000, 200.0000);
					Green(0, 255.0000, 255.0000);
					Blue(0, 255.0000, 255.0000);
					Alpha(0, 0.0000, 0.0000);
					StartRotation(0, -720.0000, 0.0000);
					RotationVelocity(0, 10.0000, 10.0000);
					FadeInTime(0.0000);
				}
				Transformer()
				{
					LifeTime(0.5000);
					Position()
					{
						LifeTime(10.0000)
					}
					Size(0)
					{
						LifeTime(0.5000)
						Scale(1.0000);
					}
					Color(0)
					{
						LifeTime(0.0001)
						Move(0.0000,0.0000,0.0000,255.0000);
						Next()
						{
							LifeTime(0.5000)
							Move(0.0000,0.0000,0.0000,-255.0000);
						}
					}
				}
				Geometry()
				{
					BlendMode("ADDITIVE");
					Type("PARTICLE");
					Texture("mus_sfx_droidconcept_border4");
				}
				ParticleEmitter("Marks")
				{
					MaxParticles(-1.0000,-1.0000);
					StartDelay(0.0000,0.0000);
					BurstDelay(1.0000, 2.0000);
					BurstCount(1.0000,3.0000);
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
							PositionY(2.1000,2.1000);
							PositionZ(0.0000,0.0000);
						}
						PositionScale(0.0000,0.0000);
						VelocityScale(0.0000,0.0000);
						InheritVelocityFactor(0.0000,0.0000);
						Size(0, 1.5000, 2.5000);
						Hue(0, 0.0000, 20.0000);
						Saturation(0, 200.0000, 255.0000);
						Value(0, 255.0000, 255.0000);
						Alpha(0, 0.0000, 0.0000);
						StartRotation(0, -720.0000, 0.0000);
						RotationVelocity(0, 0.0000, 0.0000);
						FadeInTime(0.0000);
					}
					Transformer()
					{
						LifeTime(1.0000);
						Position()
						{
							LifeTime(10.0000)
						}
						Size(0)
						{
							LifeTime(0.1000)
							Scale(1.0000);
						}
						Color(0)
						{
							LifeTime(0.0001)
							Move(0.0000,0.0000,0.0000,255.0000);
							Next()
							{
								LifeTime(0.0500)
								Move(0.0000,0.0000,0.0000,0.0000);
								Next()
								{
									LifeTime(0.0100)
									Move(0.0000,0.0000,0.0000,-255.0000);
									Next()
									{
										LifeTime(0.0500)
										Move(0.0000,0.0000,0.0000,0.0000);
										Next()
										{
											LifeTime(0.0100)
											Move(0.0000,0.0000,0.0000,255.0000);
											Next()
											{
												LifeTime(0.0500)
												Move(0.0000,0.0000,0.0000,0.0000);
												Next()
												{
													LifeTime(0.0100)
													Move(0.0000,0.0000,0.0000,-255.0000);
													Next()
													{
														LifeTime(0.0500)
														Move(0.0000,0.0000,0.0000,0.0000);
														Next()
														{
															LifeTime(0.0100)
															Move(0.0000,0.0000,0.0000,255.0000);
														}
													}
												}
											}
										}
									}
								}
							}
						}
					}
					Geometry()
					{
						BlendMode("ADDITIVE");
						Type("PARTICLE");
						Texture("mus_sfx_droidconcept_border3");
					}
				}
			}
		}
	}
}
