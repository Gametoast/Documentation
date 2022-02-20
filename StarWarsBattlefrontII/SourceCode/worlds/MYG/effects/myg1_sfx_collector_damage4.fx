ParticleEmitter("BlackSmoke")
{
	MaxParticles(-1.0000,-1.0000);
	StartDelay(0.0000,0.0000);
	BurstDelay(0.0500, 0.0500);
	BurstCount(1.0000,1.0000);
	MaxLodDist(1000.0000);
	MinLodDist(800.0000);
	BoundingRadius(30.0);
	SoundName("com_amb_fire_large")
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
			PositionY(0.5000,1.0000);
			PositionZ(-0.1000,0.1000);
		}
		Offset()
		{
			PositionX(-0.5000,0.5000);
			PositionY(0.7500,1.0000);
			PositionZ(-0.5000,0.5000);
		}
		PositionScale(0.0000,0.0000);
		VelocityScale(1.5000,2.0000);
		InheritVelocityFactor(0.0000,0.0000);
		Size(0, 0.9000, 1.6500);
		Red(0, 255.0000, 255.0000);
		Green(0, 220.0000, 220.0000);
		Blue(0, 200.0000, 200.0000);
		Alpha(0, 0.0000, 0.0000);
		StartRotation(0, 200.0000, 240.0000);
		RotationVelocity(0, -40.0000, 0.0000);
		FadeInTime(0.0000);
	}
	Transformer()
	{
		LifeTime(1.5000);
		Position()
		{
			LifeTime(2.0000)
			Accelerate(0.0000, 3.0000, 0.0000);
		}
		Size(0)
		{
			LifeTime(1.0000)
			Scale(1.5000);
			Next()
			{
				LifeTime(2.0000)
				Scale(2.0000);
			}
		}
		Color(0)
		{
			LifeTime(0.2500)
			Move(0.0000,0.0000,0.0000,64.0000);
			Next()
			{
				LifeTime(1.2500)
				Move(0.0000,0.0000,0.0000,-192.0000);
			}
		}
	}
	Geometry()
	{
		BlendMode("NORMAL");
		Type("PARTICLE");
		Texture("com_sfx_smoke2");
	}
	ParticleEmitter("Ray")
	{
		MaxParticles(-1.0000,-1.0000);
		StartDelay(0.0000,0.0000);
		BurstDelay(0.5000, 2.5000);
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
				PositionY(-10.0000,0.0000);
				PositionZ(0.0000,0.0000);
			}
			PositionScale(0.0000,0.0000);
			VelocityScale(0.0000,0.0000);
			InheritVelocityFactor(0.0000,0.0000);
			Size(0, 1.0000, 1.0000);
			Red(0, 103.0000, 112.0000);
			Green(0, 73.0000, 113.0000);
			Blue(0, 3.0000, 33.0000);
			Alpha(0, 0.0000, 0.0000);
			StartRotation(0, 0.0000, 360.0000);
			RotationVelocity(0, -1.0000, 0.0000);
			FadeInTime(0.0000);
		}
		Transformer()
		{
			LifeTime(3.0000);
			Position()
			{
				LifeTime(1.0000)
			}
			Size(0)
			{
				LifeTime(0.1000)
				Scale(1.0000);
			}
			Color(0)
			{
				LifeTime(1.0000)
				Move(0.0000,0.0000,0.0000,64.0000);
				Next()
				{
					LifeTime(2.0000)
					Move(0.0000,0.0000,0.0000,-64.0000);
				}
			}
		}
		Geometry()
		{
			BlendMode("ADDITIVE");
			Type("GEOMETRY");
			Model("myg_sfx_collectorray");
		}
		ParticleEmitter("Ray2")
		{
			MaxParticles(-1.0000,-1.0000);
			StartDelay(0.0000,0.0000);
			BurstDelay(1.0000, 3.0000);
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
					PositionY(-15.0000,0.0000);
					PositionZ(0.0000,0.0000);
				}
				PositionScale(0.0000,0.0000);
				VelocityScale(0.0000,0.0000);
				InheritVelocityFactor(0.0000,0.0000);
				Size(0, 1.0000, 1.0000);
				Red(0, 112.0000, 113.0000);
				Green(0, 48.0000, 107.0000);
				Blue(0, 0.0000, 50.0000);
				Alpha(0, 0.0000, 0.0000);
				StartRotation(0, 0.0000, 360.0000);
				RotationVelocity(0, -1.0000, 0.0000);
				FadeInTime(0.0000);
			}
			Transformer()
			{
				LifeTime(3.0000);
				Position()
				{
					LifeTime(1.0000)
				}
				Size(0)
				{
					LifeTime(0.1000)
					Scale(1.0000);
				}
				Color(0)
				{
					LifeTime(1.0000)
					Move(0.0000,0.0000,0.0000,64.0000);
					Next()
					{
						LifeTime(2.0000)
						Move(0.0000,0.0000,0.0000,-64.0000);
					}
				}
			}
			Geometry()
			{
				BlendMode("ADDITIVE");
				Type("GEOMETRY");
				Model("myg_sfx_collectorray2");
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
						PositionY(20.0000,20.0000);
						PositionZ(0.0000,0.0000);
					}
					PositionScale(0.0000,0.0000);
					VelocityScale(0.0000,0.0000);
					InheritVelocityFactor(0.0000,0.0000);
					Size(0, 4.0000, 8.0000);
					Red(0, 183.0000, 183.0000);
					Green(0, 240.0000, 240.0000);
					Blue(0, 100.0000, 100.0000);
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
						Move(0.0000,0.0000,0.0000,-255.0000);
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
							PositionY(25.5000,25.5000);
							PositionZ(0.0000,0.0000);
						}
						PositionScale(0.0000,0.0000);
						VelocityScale(0.0000,0.0000);
						InheritVelocityFactor(0.0000,0.0000);
						Size(0, 4.0000, 8.0000);
						Red(0, 183.0000, 183.0000);
						Green(0, 240.0000, 240.0000);
						Blue(0, 100.0000, 100.0000);
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
							Move(15.0000,122.0000,0.0000,-255.0000);
						}
					}
					Geometry()
					{
						BlendMode("ADDITIVE");
						Type("PARTICLE");
						Texture("com_sfx_flashball3");
					}
					ParticleEmitter("LaserBeam")
					{
						MaxParticles(-1.0000,-1.0000);
						StartDelay(0.0000,0.0000);
						BurstDelay(0.0100, 0.0600);
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
								PositionY(25.5000,25.5000);
								PositionZ(-0.0500,0.0500);
							}
							PositionScale(0.0000,0.0000);
							VelocityScale(30.0000,30.0000);
							InheritVelocityFactor(0.0000,0.0000);
							Size(0, 0.5000, 1.5000);
							Red(0, 183.0000, 232.0000);
							Green(0, 238.0000, 240.0000);
							Blue(0, 100.0000, 102.0000);
							Alpha(0, 255.0000, 255.0000);
							StartRotation(0, 1.0000, 1.0000);
							RotationVelocity(0, 0.0000, 0.0000);
							FadeInTime(0.0000);
						}
						Transformer()
						{
							LifeTime(0.2500);
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
								Move(15.0000,122.0000,0.0000,0.0000);
							}
						}
						Geometry()
						{
							BlendMode("ADDITIVE");
							Type("SPARK");
							SparkLength(0.1000);
							Texture("com_sfx_flashball3");
						}
						ParticleEmitter("Lightning1")
						{
							MaxParticles(-1.0000,-1.0000);
							StartDelay(0.0000,1.0000);
							BurstDelay(0.5000, 1.5000);
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
									PositionZ(0.0000,0.0000);
								}
								Offset()
								{
									PositionX(0.0000,0.0000);
									PositionY(6.0000,6.0000);
									PositionZ(0.0000,0.0000);
								}
								PositionScale(0.0000,0.0000);
								VelocityScale(0.0000,0.0000);
								InheritVelocityFactor(0.0000,0.0000);
								Size(0, 1.5000, 1.7500);
								Hue(0, 140.0000, 170.0000);
								Saturation(0, 0.0000, 100.0000);
								Value(0, 255.0000, 255.0000);
								Alpha(0, 128.0000, 128.0000);
								StartRotation(0, 0.0000, 360.0000);
								RotationVelocity(0, -180.0000, 180.0000);
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
									LifeTime(0.1000)
								}
								Color(0)
								{
									LifeTime(0.0300)
									Move(0.0000,0.0000,0.0000,-255.0000);
									Next()
									{
										LifeTime(0.0500)
										Move(0.0000,0.0000,0.0000,128.0000);
									}
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
								BurstDelay(0.5000, 1.5000);
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
										PositionZ(0.0000,0.0000);
									}
									Offset()
									{
										PositionX(0.0000,0.0000);
										PositionY(6.0000,6.0000);
										PositionZ(0.0000,0.0000);
									}
									PositionScale(0.0000,0.0000);
									VelocityScale(0.0000,0.0000);
									InheritVelocityFactor(0.0000,0.0000);
									Size(0, 1.5000, 1.7500);
									Hue(0, 140.0000, 170.0000);
									Saturation(0, 0.0000, 150.0000);
									Value(0, 255.0000, 255.0000);
									Alpha(0, 128.0000, 128.0000);
									StartRotation(0, 0.0000, 360.0000);
									RotationVelocity(0, -180.0000, 180.0000);
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
										LifeTime(0.1000)
									}
									Color(0)
									{
										LifeTime(0.0300)
										Move(0.0000,0.0000,0.0000,-255.0000);
										Next()
										{
											LifeTime(0.0500)
											Move(0.0000,0.0000,0.0000,128.0000);
										}
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
									MaxParticles(-1.0000,-1.0000);
									StartDelay(0.0000,1.0000);
									BurstDelay(0.5000, 1.5000);
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
											PositionZ(0.0000,0.0000);
										}
										Offset()
										{
											PositionX(0.0000,0.0000);
											PositionY(6.0000,6.0000);
											PositionZ(0.0000,0.0000);
										}
										PositionScale(0.0000,0.0000);
										VelocityScale(0.0000,0.0000);
										InheritVelocityFactor(0.0000,0.0000);
										Size(0, 1.5000, 1.7500);
										Hue(0, 140.0000, 170.0000);
										Saturation(0, 0.0000, 150.0000);
										Value(0, 255.0000, 255.0000);
										Alpha(0, 128.0000, 128.0000);
										StartRotation(0, 0.0000, 360.0000);
										RotationVelocity(0, -180.0000, 180.0000);
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
											LifeTime(0.1000)
										}
										Color(0)
										{
											LifeTime(0.0300)
											Move(0.0000,0.0000,0.0000,-255.0000);
											Next()
											{
												LifeTime(0.0500)
												Move(0.0000,0.0000,0.0000,128.0000);
											}
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
										MaxParticles(-1.0000,-1.0000);
										StartDelay(0.0000,0.0000);
										BurstDelay(0.0100, 0.0100);
										BurstCount(1.0000,3.0000);
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
												PositionX(-1.0000,1.0000);
												PositionY(0.0000,1.0000);
												PositionZ(-1.0000,1.0000);
											}
											Offset()
											{
												PositionX(-3.0000,3.0000);
												PositionY(2.0000,5.0000);
												PositionZ(-3.0000,3.0000);
											}
											PositionScale(5.0000,5.0000);
											VelocityScale(50.0000,60.0000);
											InheritVelocityFactor(0.0000,0.0000);
											Size(0, 0.0500, 0.1000);
											Red(0, 255.0000, 255.0000);
											Green(0, 184.0000, 200.0000);
											Blue(0, 17.0000, 32.0000);
											Alpha(0, 0.0000, 128.0000);
											StartRotation(0, 0.0000, 0.0000);
											RotationVelocity(0, 0.0000, 0.0000);
											FadeInTime(0.0000);
										}
										Transformer()
										{
											LifeTime(0.1000);
											Position()
											{
												LifeTime(0.5000)
												Accelerate(0.0000, -20.0000, 0.0000);
											}
											Size(0)
											{
												LifeTime(0.2000)
												Scale(1.0000);
											}
											Color(0)
											{
												LifeTime(0.1000)
												Move(0.0000,0.0000,0.0000,128.0000);
												Next()
												{
													LifeTime(0.4000)
													Move(0.0000,0.0000,0.0000,-255.0000);
												}
											}
										}
										Geometry()
										{
											BlendMode("ADDITIVE");
											Type("SPARK");
											SparkLength(0.0100);
											Texture("com_sfx_laser_orange");
										}
										ParticleEmitter("Embers")
										{
											MaxParticles(-1.0000,-1.0000);
											StartDelay(0.0000,0.0000);
											BurstDelay(0.5000, 1.5000);
											BurstCount(1.0000,1.5500);
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
													PositionY(0.5000,2.5000);
													PositionZ(-0.3000,0.3000);
												}
												Offset()
												{
													PositionX(-0.5000,0.5000);
													PositionY(0.0000,0.5000);
													PositionZ(-0.5000,0.5000);
												}
												PositionScale(0.0000,0.3000);
												VelocityScale(0.1000,0.6000);
												InheritVelocityFactor(0.0000,0.0000);
												Size(0, 0.0500, 0.1500);
												Red(0, 255.0000, 255.0000);
												Green(0, 191.0000, 202.5700);
												Blue(0, 50.0000, 135.0000);
												Alpha(0, 0.0000, 0.0000);
												StartRotation(0, 0.0000, 360.0000);
												RotationVelocity(0, -20.0000, 20.0000);
												FadeInTime(0.0000);
											}
											Transformer()
											{
												LifeTime(4.0000);
												Position()
												{
													LifeTime(4.0000)
													Accelerate(0.0000, 1.0000, 0.0000);
												}
												Size(0)
												{
													LifeTime(6.0000)
													Scale(0.0500);
												}
												Color(0)
												{
													LifeTime(0.5000)
													Move(255.0000,191.0000,50.0000,255.0000);
													Next()
													{
														LifeTime(3.5000)
														Reach(0.0000,0.0000,0.0000,200.0000);
													}
												}
											}
											Geometry()
											{
												BlendMode("ADDITIVE");
												Type("PARTICLE");
												Texture("com_sfx_flames1");
											}
											ParticleEmitter("Flame1")
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
													Circle()
													{
														PositionX(-1.0000,1.0000);
														PositionY(2.0000,2.0000);
														PositionZ(-1.0000,1.0000);
													}
													Offset()
													{
														PositionX(0.0000,0.0000);
														PositionY(-8.0000,-5.0000);
														PositionZ(0.0000,0.0000);
													}
													PositionScale(12.0000,12.0000);
													VelocityScale(0.0000,0.0000);
													InheritVelocityFactor(0.0000,0.0000);
													Size(0, 3.0000, 5.0000);
													Red(0, 255.0000, 255.0000);
													Green(0, 255.0000, 255.0000);
													Blue(0, 255.0000, 255.0000);
													Alpha(0, 0.0000, 0.0000);
													StartRotation(0, 0.0000, 360.0000);
													RotationVelocity(0, -80.0000, 0.0000);
													FadeInTime(0.0000);
												}
												Transformer()
												{
													LifeTime(1.0000);
													Position()
													{
														LifeTime(1.0000)
														Accelerate(0.0000, 50.0000, 0.0000);
													}
													Size(0)
													{
														LifeTime(1.0000)
														Scale(0.2500);
													}
													Color(0)
													{
														LifeTime(0.1000)
														Reach(255.0000,255.0000,255.0000,180.0000);
														Next()
														{
															LifeTime(0.6000)
															Reach(100.0000,0.0000,0.0000,0.0000);
														}
													}
												}
												Geometry()
												{
													BlendMode("ADDITIVE");
													Type("PARTICLE");
													Texture("com_sfx_explosion4");
												}
												ParticleEmitter("Flame2")
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
														Circle()
														{
															PositionX(-1.0000,1.0000);
															PositionY(2.0000,2.0000);
															PositionZ(-1.0000,1.0000);
														}
														Offset()
														{
															PositionX(0.0000,0.0000);
															PositionY(-8.0000,-5.0000);
															PositionZ(0.0000,0.0000);
														}
														PositionScale(12.0000,12.0000);
														VelocityScale(0.0000,0.0000);
														InheritVelocityFactor(0.0000,0.0000);
														Size(0, 3.0000, 5.0000);
														Red(0, 255.0000, 255.0000);
														Green(0, 255.0000, 255.0000);
														Blue(0, 255.0000, 255.0000);
														Alpha(0, 0.0000, 0.0000);
														StartRotation(0, 0.0000, 360.0000);
														RotationVelocity(0, -80.0000, 0.0000);
														FadeInTime(0.0000);
													}
													Transformer()
													{
														LifeTime(1.0000);
														Position()
														{
															LifeTime(1.0000)
															Accelerate(0.0000, 50.0000, 0.0000);
														}
														Size(0)
														{
															LifeTime(1.0000)
															Scale(0.2500);
														}
														Color(0)
														{
															LifeTime(0.1000)
															Reach(255.0000,255.0000,255.0000,180.0000);
															Next()
															{
																LifeTime(0.6000)
																Reach(100.0000,0.0000,0.0000,0.0000);
															}
														}
													}
													Geometry()
													{
														BlendMode("ADDITIVE");
														Type("PARTICLE");
														Texture("com_sfx_explosion2");
													}
													ParticleEmitter("Flame3")
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
															Circle()
															{
																PositionX(-1.0000,1.0000);
																PositionY(2.0000,2.0000);
																PositionZ(-1.0000,1.0000);
															}
															Offset()
															{
																PositionX(0.0000,0.0000);
																PositionY(-8.0000,-5.0000);
																PositionZ(0.0000,0.0000);
															}
															PositionScale(12.0000,12.0000);
															VelocityScale(0.0000,0.0000);
															InheritVelocityFactor(0.0000,0.0000);
															Size(0, 3.0000, 5.0000);
															Red(0, 255.0000, 255.0000);
															Green(0, 255.0000, 255.0000);
															Blue(0, 255.0000, 255.0000);
															Alpha(0, 0.0000, 0.0000);
															StartRotation(0, 0.0000, 360.0000);
															RotationVelocity(0, -80.0000, 0.0000);
															FadeInTime(0.0000);
														}
														Transformer()
														{
															LifeTime(1.0000);
															Position()
															{
																LifeTime(1.0000)
																Accelerate(0.0000, 50.0000, 0.0000);
															}
															Size(0)
															{
																LifeTime(1.0000)
																Scale(0.2500);
															}
															Color(0)
															{
																LifeTime(0.1000)
																Reach(255.0000,255.0000,255.0000,180.0000);
																Next()
																{
																	LifeTime(0.6000)
																	Reach(100.0000,0.0000,0.0000,0.0000);
																}
															}
														}
														Geometry()
														{
															BlendMode("ADDITIVE");
															Type("PARTICLE");
															Texture("com_sfx_explosion1");
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
				}
			}
		}
	}
}
