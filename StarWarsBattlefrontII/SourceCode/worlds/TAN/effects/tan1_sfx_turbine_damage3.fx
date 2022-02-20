ParticleEmitter("Console")
{
	MaxParticles(0.0000,0.0000);
	StartDelay(0.0000,0.0000);
	BurstDelay(1.0000, 1.0000);
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
		Hue(0, 0.0000, 0.0000);
		Saturation(0, 0.0000, 0.0000);
		Value(0, 255.0000, 255.0000);
		Alpha(0, 255.0000, 255.0000);
		StartRotation(0, 0.0000, 0.0000);
		RotationVelocity(0, 0.0000, 0.0000);
		FadeInTime(0.0000);
	}
	Transformer()
	{
		LifeTime(1.0000);
		Position()
		{
			LifeTime(1.0000)
		}
		Size(0)
		{
			LifeTime(1.0000)
		}
		Color(0)
		{
			LifeTime(0.0000)
			Move(0.0000,0.0000,0.0000,0.0000);
		}
	}
	Geometry()
	{
		BlendMode("NORMAL");
		Type("GEOMETRY");
		Model("tan4_prop_Console");
	}
	ParticleEmitter("TurbineLightning1")
	{
		MaxParticles(-1.0000,-1.0000);
		StartDelay(0.0000,1.0000);
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
				PositionX(0.0000,0.0000);
				PositionY(0.0000,0.0000);
				PositionZ(0.0000,0.0000);
			}
			Offset()
			{
				PositionX(0.6000,0.6000);
				PositionY(0.5000,0.5000);
				PositionZ(-0.5000,-0.5000);
			}
			PositionScale(0.0000,0.0000);
			VelocityScale(0.0000,0.0000);
			InheritVelocityFactor(0.0000,0.0000);
			Size(0, 0.3000, 0.4000);
			Hue(0, 80.0000, 100.0000);
			Saturation(0, 50.0000, 80.0000);
			Value(0, 128.0000, 255.0000);
			Alpha(0, 0.0000, 0.0000);
			StartRotation(0, 0.0000, 360.0000);
			RotationVelocity(0, -20.0000, 20.0000);
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
				Reach(1.0500);
			}
			Color(0)
			{
				LifeTime(0.0010)
				Move(0.0000,0.0000,0.0000,255.0000);
			}
		}
		Geometry()
		{
			BlendMode("ADDITIVE");
			Type("GEOMETRY");
			Model("com_sfx_lightningball1");
		}
		ParticleEmitter("TurbineLightning2")
		{
			MaxParticles(-1.0000,-1.0000);
			StartDelay(0.0000,1.0000);
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
					PositionX(0.0000,0.0000);
					PositionY(0.0000,0.0000);
					PositionZ(0.0000,0.0000);
				}
				Offset()
				{
					PositionX(0.6000,0.6000);
					PositionY(0.5000,0.5000);
					PositionZ(-0.5000,-0.5000);
				}
				PositionScale(0.0000,0.0000);
				VelocityScale(0.0000,0.0000);
				InheritVelocityFactor(0.0000,0.0000);
				Size(0, 0.3000, 0.4000);
				Hue(0, 80.0000, 100.0000);
				Saturation(0, 50.0000, 80.0000);
				Value(0, 128.0000, 255.0000);
				Alpha(0, 0.0000, 0.0000);
				StartRotation(0, 0.0000, 360.0000);
				RotationVelocity(0, -20.0000, 20.0000);
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
					Reach(1.1000);
				}
				Color(0)
				{
					LifeTime(0.0010)
					Move(0.0000,0.0000,0.0000,255.0000);
				}
			}
			Geometry()
			{
				BlendMode("ADDITIVE");
				Type("GEOMETRY");
				Model("com_sfx_lightningball2");
			}
			ParticleEmitter("TurbineLightning3")
			{
				MaxParticles(-1.0000,-1.0000);
				StartDelay(0.0000,1.0000);
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
						PositionX(0.0000,0.0000);
						PositionY(0.0000,0.0000);
						PositionZ(0.0000,0.0000);
					}
					Offset()
					{
						PositionX(0.6000,0.6000);
						PositionY(0.5000,0.5000);
						PositionZ(-0.5000,-0.5000);
					}
					PositionScale(0.0000,0.0000);
					VelocityScale(0.0000,0.0000);
					InheritVelocityFactor(0.0000,0.0000);
					Size(0, 0.3000, 0.4000);
					Hue(0, 80.0000, 100.0000);
					Saturation(0, 50.0000, 80.0000);
					Value(0, 128.0000, 255.0000);
					Alpha(0, 0.0000, 0.0000);
					StartRotation(0, 0.0000, 360.0000);
					RotationVelocity(0, -20.0000, 20.0000);
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
						Reach(1.0500);
					}
					Color(0)
					{
						LifeTime(0.0010)
						Move(0.0000,0.0000,0.0000,255.0000);
					}
				}
				Geometry()
				{
					BlendMode("ADDITIVE");
					Type("GEOMETRY");
					Model("com_sfx_lightningball3");
				}
				ParticleEmitter("Laser")
				{
					MaxParticles(-1.0000,-1.0000);
					StartDelay(0.0000,0.0000);
					BurstDelay(0.0250, 0.0250);
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
							PositionX(0.0000,0.0000);
							PositionY(0.0000,1.0000);
							PositionZ(0.0000,0.0000);
						}
						Offset()
						{
							PositionX(0.7000,0.7000);
							PositionY(-0.5500,-0.5500);
							PositionZ(-0.5000,-0.5000);
						}
						PositionScale(0.0000,0.0000);
						VelocityScale(80.0000,80.0000);
						InheritVelocityFactor(0.2500,0.2500);
						Size(0, 0.6000, 0.6000);
						Hue(0, 0.0000, 0.0000);
						Saturation(0, 0.0000, 0.0000);
						Value(0, 255.0000, 255.0000);
						Alpha(0, 255.0000, 255.0000);
						StartRotation(0, 0.0000, 0.0000);
						RotationVelocity(0, 0.0000, 0.0000);
						FadeInTime(0.0000);
					}
					Transformer()
					{
						LifeTime(0.1000);
						Position()
						{
							LifeTime(0.1000)
							Accelerate(0.0000, 0.0000, 0.0000);
						}
						Size(0)
						{
							LifeTime(1.0000)
							Scale(1.0000);
						}
						Color(0)
						{
							LifeTime(0.0100)
							Move(0.0000,0.0000,0.0000,0.0000);
						}
					}
					Geometry()
					{
						BlendMode("ADDITIVE");
						Type("SPARK");
						SparkLength(0.0500);
						Texture("com_sfx_laser_green");
					}
					ParticleEmitter("LaserGlow")
					{
						MaxParticles(-1.0000,-1.0000);
						StartDelay(0.0000,0.0000);
						BurstDelay(0.0500, 0.0500);
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
								PositionX(0.0000,0.0000);
								PositionY(0.0000,0.0000);
								PositionZ(0.0000,0.0000);
							}
							Offset()
							{
								PositionX(0.6000,0.6000);
								PositionY(0.5000,0.5000);
								PositionZ(-0.5000,-0.5000);
							}
							PositionScale(0.0000,0.0000);
							VelocityScale(0.0000,0.0000);
							InheritVelocityFactor(0.2500,0.2500);
							Size(0, 2.0000, 3.0000);
							Hue(0, 80.0000, 110.0000);
							Saturation(0, 100.0000, 255.0000);
							Value(0, 255.0000, 255.0000);
							Alpha(0, 0.0000, 0.0000);
							StartRotation(0, 0.0000, 360.0000);
							RotationVelocity(0, 0.0000, 0.0000);
							FadeInTime(0.0000);
						}
						Transformer()
						{
							LifeTime(0.1000);
							Position()
							{
								LifeTime(0.1000)
								Accelerate(0.0000, 0.0000, 0.0000);
							}
							Size(0)
							{
								LifeTime(0.1000)
								Scale(1.0000);
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
							Type("PARTICLE");
							Texture("com_sfx_flashball2");
						}
						ParticleEmitter("LaserSide")
						{
							MaxParticles(-1.0000,-1.0000);
							StartDelay(0.0000,0.0000);
							BurstDelay(0.0250, 0.0250);
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
									PositionX(0.0000,0.0000);
									PositionY(1.0000,1.0000);
									PositionZ(0.0000,0.0000);
								}
								Offset()
								{
									PositionX(0.6000,0.6000);
									PositionY(-2.5000,-2.5000);
									PositionZ(-0.5000,-0.5000);
								}
								PositionScale(0.0000,0.0000);
								VelocityScale(2.0000,2.0000);
								InheritVelocityFactor(0.2500,0.2500);
								Size(0, 3.0000, 3.0000);
								Hue(0, 80.0000, 90.0000);
								Saturation(0, 100.0000, 150.0000);
								Value(0, 255.0000, 255.0000);
								Alpha(0, 0.0000, 0.0000);
								StartRotation(0, 5.0000, 5.9000);
								RotationVelocity(0, 0.0000, 0.0000);
								FadeInTime(0.0000);
							}
							Transformer()
							{
								LifeTime(0.1000);
								Position()
								{
									LifeTime(0.1000)
									Accelerate(0.0000, 0.0000, 0.0000);
								}
								Size(0)
								{
									LifeTime(0.1000)
									Scale(0.8000);
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
								Type("BILLBOARD");
								Texture("com_sfx_flashring1");
							}
							ParticleEmitter("LaserSide")
							{
								MaxParticles(-1.0000,-1.0000);
								StartDelay(0.0000,0.0000);
								BurstDelay(0.0250, 0.0250);
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
										PositionX(0.0000,0.0000);
										PositionY(-1.0000,-1.0000);
										PositionZ(0.0000,0.0000);
									}
									Offset()
									{
										PositionX(0.6000,0.6000);
										PositionY(3.5000,3.5000);
										PositionZ(-0.5000,-0.5000);
									}
									PositionScale(0.0000,0.0000);
									VelocityScale(2.0000,2.0000);
									InheritVelocityFactor(0.2500,0.2500);
									Size(0, 3.0000, 3.0000);
									Hue(0, 80.0000, 90.0000);
									Saturation(0, 100.0000, 150.0000);
									Value(0, 255.0000, 255.0000);
									Alpha(0, 0.0000, 0.0000);
									StartRotation(0, 5.0000, 5.9000);
									RotationVelocity(0, 0.0000, 0.0000);
									FadeInTime(0.0000);
								}
								Transformer()
								{
									LifeTime(0.1000);
									Position()
									{
										LifeTime(0.1000)
										Accelerate(0.0000, 0.0000, 0.0000);
									}
									Size(0)
									{
										LifeTime(0.1000)
										Scale(0.8000);
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
									Type("BILLBOARD");
									Texture("com_sfx_flashring1");
								}
								ParticleEmitter("Lightning1")
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
											PositionX(2.0000,3.0000);
											PositionY(7.0000,8.0000);
											PositionZ(4.0000,5.0000);
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
												PositionX(2.0000,3.0000);
												PositionY(7.0000,8.0000);
												PositionZ(4.0000,5.0000);
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
													PositionX(2.0000,3.0000);
													PositionY(7.0000,8.0000);
													PositionZ(4.0000,5.0000);
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
												MaxParticles(-1.0000,-1.0000);
												StartDelay(1.0000,1.5000);
												BurstDelay(1.0000, 1.5000);
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
														PositionX(2.5000,2.5000);
														PositionY(7.5000,7.5000);
														PositionZ(4.5000,4.5000);
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
													MaxParticles(-1.0000,-1.0000);
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
															PositionX(2.0000,3.0000);
															PositionY(7.0000,8.0000);
															PositionZ(4.0000,5.0000);
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
							}
						}
					}
				}
			}
		}
	}
}
