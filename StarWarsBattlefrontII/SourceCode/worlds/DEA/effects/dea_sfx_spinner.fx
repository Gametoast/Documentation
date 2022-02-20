ParticleEmitter("BaseFlare1Bottom")
{
	MaxParticles(-1.0000,-1.0000);
	StartDelay(0.0000,0.0000);
	BurstDelay(0.0500, 0.0500);
	BurstCount(1.0000,1.0000);
	MaxLodDist(2100.0000);
	MinLodDist(2000.0000);
	BoundingRadius(30.0);
	SoundName("")
	NoRegisterStep();
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
			PositionY(-2.4000,-2.4000);
			PositionZ(-1.8000,-1.8000);
		}
		PositionScale(0.0000,0.0000);
		VelocityScale(0.0000,0.0000);
		InheritVelocityFactor(0.0000,0.0000);
		Size(0, 0.7500, 1.0000);
		Hue(0, 130.0000, 160.0000);
		Saturation(0, 100.0000, 100.0000);
		Value(0, 255.0000, 255.0000);
		Alpha(0, 0.0000, 0.0000);
		StartRotation(0, 0.0000, 360.0000);
		RotationVelocity(0, -255.0000, 257.0000);
		FadeInTime(0.0000);
	}
	Transformer()
	{
		LifeTime(0.1000);
		Position()
		{
			LifeTime(0.5000)
		}
		Size(0)
		{
			LifeTime(0.5000)
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
	ParticleEmitter("BaseFlare1BottomBeam")
	{
		MaxParticles(-1.0000,-1.0000);
		StartDelay(0.0000,0.0000);
		BurstDelay(0.0500, 0.0500);
		BurstCount(1.0000,1.0000);
		MaxLodDist(2100.0000);
		MinLodDist(2000.0000);
		BoundingRadius(5.0);
		SoundName("")
		NoRegisterStep();
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
				PositionY(0.5000,0.5000);
				PositionZ(0.4000,0.4000);
			}
			Offset()
			{
				PositionX(0.0000,0.0000);
				PositionY(-2.4000,-2.4000);
				PositionZ(-1.8000,-1.8000);
			}
			PositionScale(0.0000,0.0000);
			VelocityScale(15.0000,20.0000);
			InheritVelocityFactor(0.0000,0.0000);
			Size(0, 0.1000, 0.3000);
			Hue(0, 130.0000, 160.0000);
			Saturation(0, 100.0000, 100.0000);
			Value(0, 255.0000, 255.0000);
			Alpha(0, 0.0000, 0.0000);
			StartRotation(0, 0.0000, 360.0000);
			RotationVelocity(0, -255.0000, 257.0000);
			FadeInTime(0.0000);
		}
		Transformer()
		{
			LifeTime(0.2500);
			Position()
			{
				LifeTime(0.5000)
			}
			Size(0)
			{
				LifeTime(0.5000)
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
			Type("SPARK");
			SparkLength(0.0500);
			Texture("com_sfx_laser_blue");
		}
		ParticleEmitter("BaseFlare1BottomRing")
		{
			MaxParticles(-1.0000,-1.0000);
			StartDelay(0.0000,0.0000);
			BurstDelay(0.0500, 0.0500);
			BurstCount(1.0000,1.0000);
			MaxLodDist(2100.0000);
			MinLodDist(2000.0000);
			BoundingRadius(5.0);
			SoundName("")
			NoRegisterStep();
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
					PositionY(-2.4000,-2.4000);
					PositionZ(-1.8000,-1.8000);
				}
				PositionScale(0.0000,0.0000);
				VelocityScale(0.0000,0.0000);
				InheritVelocityFactor(0.0000,0.0000);
				Size(0, 2.5000, 2.5000);
				Hue(0, 130.0000, 160.0000);
				Saturation(0, 100.0000, 100.0000);
				Value(0, 255.0000, 255.0000);
				Alpha(0, 0.0000, 0.0000);
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
				}
				Size(0)
				{
					LifeTime(0.5000)
					Scale(1.0000);
				}
				Color(0)
				{
					LifeTime(0.0100)
					Move(0.0000,0.0000,0.0000,4.0000);
				}
			}
			Geometry()
			{
				BlendMode("ADDITIVE");
				Type("PARTICLE");
				Texture("com_sfx_flashring2");
			}
			ParticleEmitter("BaseFlare1Top")
			{
				MaxParticles(-1.0000,-1.0000);
				StartDelay(0.0000,0.0000);
				BurstDelay(0.0500, 0.0500);
				BurstCount(1.0000,1.0000);
				MaxLodDist(2100.0000);
				MinLodDist(2000.0000);
				BoundingRadius(5.0);
				SoundName("")
				NoRegisterStep();
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
						PositionY(8.6000,8.6000);
						PositionZ(-1.8000,-1.8000);
					}
					PositionScale(0.0000,0.0000);
					VelocityScale(0.0000,0.0000);
					InheritVelocityFactor(0.0000,0.0000);
					Size(0, 0.7500, 1.0000);
					Hue(0, 130.0000, 160.0000);
					Saturation(0, 100.0000, 100.0000);
					Value(0, 255.0000, 255.0000);
					Alpha(0, 0.0000, 0.0000);
					StartRotation(0, 0.0000, 360.0000);
					RotationVelocity(0, -255.0000, 257.0000);
					FadeInTime(0.0000);
				}
				Transformer()
				{
					LifeTime(0.1000);
					Position()
					{
						LifeTime(0.5000)
					}
					Size(0)
					{
						LifeTime(0.5000)
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
				ParticleEmitter("BaseFlare1TopBeam")
				{
					MaxParticles(-1.0000,-1.0000);
					StartDelay(0.0000,0.0000);
					BurstDelay(0.0500, 0.0500);
					BurstCount(1.0000,1.0000);
					MaxLodDist(2100.0000);
					MinLodDist(2000.0000);
					BoundingRadius(5.0);
					SoundName("")
					NoRegisterStep();
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
							PositionY(-0.5000,-0.5000);
							PositionZ(0.4000,0.4000);
						}
						Offset()
						{
							PositionX(0.0000,0.0000);
							PositionY(8.6000,8.6000);
							PositionZ(-1.8000,-1.8000);
						}
						PositionScale(0.0000,0.0000);
						VelocityScale(15.0000,20.0000);
						InheritVelocityFactor(0.0000,0.0000);
						Size(0, 0.1000, 0.3000);
						Hue(0, 130.0000, 160.0000);
						Saturation(0, 100.0000, 100.0000);
						Value(0, 255.0000, 255.0000);
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
							LifeTime(0.5000)
						}
						Size(0)
						{
							LifeTime(0.5000)
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
						Type("SPARK");
						SparkLength(0.0500);
						Texture("com_sfx_laser_blue");
					}
					ParticleEmitter("BaseFlare1TopRing")
					{
						MaxParticles(-1.0000,-1.0000);
						StartDelay(0.0000,0.0000);
						BurstDelay(0.0500, 0.0500);
						BurstCount(1.0000,1.0000);
						MaxLodDist(2100.0000);
						MinLodDist(2000.0000);
						BoundingRadius(5.0);
						SoundName("")
						NoRegisterStep();
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
								PositionY(8.6000,8.6000);
								PositionZ(-1.8000,-1.8000);
							}
							PositionScale(0.0000,0.0000);
							VelocityScale(0.0000,0.0000);
							InheritVelocityFactor(0.0000,0.0000);
							Size(0, 2.5000, 2.5000);
							Hue(0, 130.0000, 160.0000);
							Saturation(0, 100.0000, 100.0000);
							Value(0, 255.0000, 255.0000);
							Alpha(0, 0.0000, 0.0000);
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
							}
							Size(0)
							{
								LifeTime(0.5000)
								Scale(1.0000);
							}
							Color(0)
							{
								LifeTime(0.0100)
								Move(0.0000,0.0000,0.0000,4.0000);
							}
						}
						Geometry()
						{
							BlendMode("ADDITIVE");
							Type("PARTICLE");
							Texture("com_sfx_flashring2");
						}
						ParticleEmitter("BaseFlare2Bottom")
						{
							MaxParticles(-1.0000,-1.0000);
							StartDelay(0.0000,0.0000);
							BurstDelay(0.0500, 0.0500);
							BurstCount(1.0000,1.0000);
							MaxLodDist(2100.0000);
							MinLodDist(2000.0000);
							BoundingRadius(5.0);
							SoundName("")
							NoRegisterStep();
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
									PositionX(1.5000,1.5000);
									PositionY(-2.4000,-2.4000);
									PositionZ(0.9000,0.9000);
								}
								PositionScale(0.0000,0.0000);
								VelocityScale(0.0000,0.0000);
								InheritVelocityFactor(0.0000,0.0000);
								Size(0, 0.7500, 1.0000);
								Hue(0, 130.0000, 160.0000);
								Saturation(0, 100.0000, 100.0000);
								Value(0, 255.0000, 255.0000);
								Alpha(0, 0.0000, 0.0000);
								StartRotation(0, 0.0000, 360.0000);
								RotationVelocity(0, -255.0000, 257.0000);
								FadeInTime(0.0000);
							}
							Transformer()
							{
								LifeTime(0.1000);
								Position()
								{
									LifeTime(0.5000)
								}
								Size(0)
								{
									LifeTime(0.5000)
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
							ParticleEmitter("BaseFlare2BottomBeam")
							{
								MaxParticles(-1.0000,-1.0000);
								StartDelay(0.0000,0.0000);
								BurstDelay(0.0500, 0.0500);
								BurstCount(1.0000,1.0000);
								MaxLodDist(2100.0000);
								MinLodDist(2000.0000);
								BoundingRadius(5.0);
								SoundName("")
								NoRegisterStep();
								Size(1.0000, 1.0000);
								Hue(255.0000, 255.0000);
								Saturation(255.0000, 255.0000);
								Value(255.0000, 255.0000);
								Alpha(255.0000, 255.0000);
								Spawner()
								{
									Spread()
									{
										PositionX(-0.4000,-0.4000);
										PositionY(0.5000,0.5000);
										PositionZ(-0.2000,-0.2000);
									}
									Offset()
									{
										PositionX(1.5000,1.5000);
										PositionY(-2.4000,-2.4000);
										PositionZ(0.9000,0.9000);
									}
									PositionScale(0.0000,0.0000);
									VelocityScale(15.0000,15.5000);
									InheritVelocityFactor(0.0000,0.0000);
									Size(0, 0.1000, 0.3000);
									Hue(0, 130.0000, 160.0000);
									Saturation(0, 100.0000, 100.0000);
									Value(0, 255.0000, 255.0000);
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
										LifeTime(0.5000)
									}
									Size(0)
									{
										LifeTime(0.5000)
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
									Type("SPARK");
									SparkLength(0.0500);
									Texture("com_sfx_laser_blue");
								}
								ParticleEmitter("BaseFlare2BottomRing")
								{
									MaxParticles(-1.0000,-1.0000);
									StartDelay(0.0000,0.0000);
									BurstDelay(0.0500, 0.0500);
									BurstCount(1.0000,1.0000);
									MaxLodDist(2100.0000);
									MinLodDist(2000.0000);
									BoundingRadius(5.0);
									SoundName("")
									NoRegisterStep();
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
											PositionX(1.5000,1.5000);
											PositionY(-2.4000,-2.4000);
											PositionZ(0.9000,0.9000);
										}
										PositionScale(0.0000,0.0000);
										VelocityScale(0.0000,0.0000);
										InheritVelocityFactor(0.0000,0.0000);
										Size(0, 2.5000, 2.5000);
										Hue(0, 130.0000, 160.0000);
										Saturation(0, 100.0000, 100.0000);
										Value(0, 255.0000, 255.0000);
										Alpha(0, 0.0000, 0.0000);
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
										}
										Size(0)
										{
											LifeTime(0.5000)
											Scale(1.0000);
										}
										Color(0)
										{
											LifeTime(0.0100)
											Move(0.0000,0.0000,0.0000,4.0000);
										}
									}
									Geometry()
									{
										BlendMode("ADDITIVE");
										Type("PARTICLE");
										Texture("com_sfx_flashring2");
									}
									ParticleEmitter("BaseFlare2Top")
									{
										MaxParticles(-1.0000,-1.0000);
										StartDelay(0.0000,0.0000);
										BurstDelay(0.0500, 0.0500);
										BurstCount(1.0000,1.0000);
										MaxLodDist(2100.0000);
										MinLodDist(2000.0000);
										BoundingRadius(5.0);
										SoundName("")
										NoRegisterStep();
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
												PositionX(1.5000,1.5000);
												PositionY(8.6000,8.6000);
												PositionZ(0.9000,0.9000);
											}
											PositionScale(0.0000,0.0000);
											VelocityScale(0.0000,0.0000);
											InheritVelocityFactor(0.0000,0.0000);
											Size(0, 0.7500, 1.0000);
											Hue(0, 130.0000, 160.0000);
											Saturation(0, 100.0000, 100.0000);
											Value(0, 255.0000, 255.0000);
											Alpha(0, 0.0000, 0.0000);
											StartRotation(0, 0.0000, 360.0000);
											RotationVelocity(0, -255.0000, 257.0000);
											FadeInTime(0.0000);
										}
										Transformer()
										{
											LifeTime(0.1000);
											Position()
											{
												LifeTime(0.5000)
											}
											Size(0)
											{
												LifeTime(0.5000)
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
										ParticleEmitter("BaseFlare2TopBeam")
										{
											MaxParticles(-1.0000,-1.0000);
											StartDelay(0.0000,0.0000);
											BurstDelay(0.0500, 0.0500);
											BurstCount(1.0000,1.0000);
											MaxLodDist(2100.0000);
											MinLodDist(2000.0000);
											BoundingRadius(5.0);
											SoundName("")
											NoRegisterStep();
											Size(1.0000, 1.0000);
											Hue(255.0000, 255.0000);
											Saturation(255.0000, 255.0000);
											Value(255.0000, 255.0000);
											Alpha(255.0000, 255.0000);
											Spawner()
											{
												Spread()
												{
													PositionX(-0.4000,-0.4000);
													PositionY(-0.5000,-0.5000);
													PositionZ(-0.2000,-0.2000);
												}
												Offset()
												{
													PositionX(1.5000,1.5000);
													PositionY(8.6000,8.6000);
													PositionZ(0.9000,0.9000);
												}
												PositionScale(0.0000,0.0000);
												VelocityScale(15.0000,20.0000);
												InheritVelocityFactor(0.0000,0.0000);
												Size(0, 0.1000, 0.3000);
												Hue(0, 130.0000, 160.0000);
												Saturation(0, 100.0000, 100.0000);
												Value(0, 255.0000, 255.0000);
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
													LifeTime(0.5000)
												}
												Size(0)
												{
													LifeTime(0.5000)
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
												Type("SPARK");
												SparkLength(0.0500);
												Texture("com_sfx_laser_blue");
											}
											ParticleEmitter("BaseFlare2TopRing")
											{
												MaxParticles(-1.0000,-1.0000);
												StartDelay(0.0000,0.0000);
												BurstDelay(0.0500, 0.0500);
												BurstCount(1.0000,1.0000);
												MaxLodDist(2100.0000);
												MinLodDist(2000.0000);
												BoundingRadius(5.0);
												SoundName("")
												NoRegisterStep();
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
														PositionX(1.5000,1.5000);
														PositionY(8.6000,8.6000);
														PositionZ(0.9000,0.9000);
													}
													PositionScale(0.0000,0.0000);
													VelocityScale(0.0000,0.0000);
													InheritVelocityFactor(0.0000,0.0000);
													Size(0, 2.5000, 2.5000);
													Hue(0, 130.0000, 160.0000);
													Saturation(0, 100.0000, 100.0000);
													Value(0, 255.0000, 255.0000);
													Alpha(0, 0.0000, 0.0000);
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
													}
													Size(0)
													{
														LifeTime(0.5000)
														Scale(1.0000);
													}
													Color(0)
													{
														LifeTime(0.0100)
														Move(0.0000,0.0000,0.0000,4.0000);
													}
												}
												Geometry()
												{
													BlendMode("ADDITIVE");
													Type("PARTICLE");
													Texture("com_sfx_flashring2");
												}
												ParticleEmitter("BaseFlare3Bottom")
												{
													MaxParticles(-1.0000,-1.0000);
													StartDelay(0.0000,0.0000);
													BurstDelay(0.0500, 0.0500);
													BurstCount(1.0000,1.0000);
													MaxLodDist(2100.0000);
													MinLodDist(2000.0000);
													BoundingRadius(5.0);
													SoundName("")
													NoRegisterStep();
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
															PositionX(-1.5000,-1.5000);
															PositionY(-2.4000,-2.4000);
															PositionZ(0.9000,0.9000);
														}
														PositionScale(0.0000,0.0000);
														VelocityScale(0.0000,0.0000);
														InheritVelocityFactor(0.0000,0.0000);
														Size(0, 0.7500, 1.0000);
														Hue(0, 130.0000, 160.0000);
														Saturation(0, 100.0000, 100.0000);
														Value(0, 255.0000, 255.0000);
														Alpha(0, 0.0000, 0.0000);
														StartRotation(0, 0.0000, 360.0000);
														RotationVelocity(0, -255.0000, 257.0000);
														FadeInTime(0.0000);
													}
													Transformer()
													{
														LifeTime(0.1000);
														Position()
														{
															LifeTime(0.5000)
														}
														Size(0)
														{
															LifeTime(0.5000)
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
													ParticleEmitter("BaseFlare3BottomBeam")
													{
														MaxParticles(-1.0000,-1.0000);
														StartDelay(0.0000,0.0000);
														BurstDelay(0.0500, 0.0500);
														BurstCount(1.0000,1.0000);
														MaxLodDist(2100.0000);
														MinLodDist(2000.0000);
														BoundingRadius(5.0);
														SoundName("")
														NoRegisterStep();
														Size(1.0000, 1.0000);
														Hue(255.0000, 255.0000);
														Saturation(255.0000, 255.0000);
														Value(255.0000, 255.0000);
														Alpha(255.0000, 255.0000);
														Spawner()
														{
															Spread()
															{
																PositionX(0.4000,0.4000);
																PositionY(0.5000,0.5000);
																PositionZ(-0.2000,-0.2000);
															}
															Offset()
															{
																PositionX(-1.5000,-1.5000);
																PositionY(-2.4000,-2.4000);
																PositionZ(0.9000,0.9000);
															}
															PositionScale(0.0000,0.0000);
															VelocityScale(15.0000,20.0000);
															InheritVelocityFactor(0.0000,0.0000);
															Size(0, 0.1000, 0.3000);
															Hue(0, 130.0000, 160.0000);
															Saturation(0, 100.0000, 100.0000);
															Value(0, 255.0000, 255.0000);
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
																LifeTime(0.5000)
															}
															Size(0)
															{
																LifeTime(0.5000)
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
															Type("SPARK");
															SparkLength(0.0500);
															Texture("com_sfx_laser_blue");
														}
														ParticleEmitter("BaseFlare3BottomRing")
														{
															MaxParticles(-1.0000,-1.0000);
															StartDelay(0.0000,0.0000);
															BurstDelay(0.0500, 0.0500);
															BurstCount(1.0000,1.0000);
															MaxLodDist(2100.0000);
															MinLodDist(2000.0000);
															BoundingRadius(5.0);
															SoundName("")
															NoRegisterStep();
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
																	PositionX(-1.5000,-1.5000);
																	PositionY(-2.4000,-2.4000);
																	PositionZ(0.9000,0.9000);
																}
																PositionScale(0.0000,0.0000);
																VelocityScale(0.0000,0.0000);
																InheritVelocityFactor(0.0000,0.0000);
																Size(0, 2.5000, 2.5000);
																Hue(0, 130.0000, 160.0000);
																Saturation(0, 100.0000, 100.0000);
																Value(0, 255.0000, 255.0000);
																Alpha(0, 0.0000, 0.0000);
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
																}
																Size(0)
																{
																	LifeTime(0.5000)
																	Scale(1.0000);
																}
																Color(0)
																{
																	LifeTime(0.0100)
																	Move(0.0000,0.0000,0.0000,4.0000);
																}
															}
															Geometry()
															{
																BlendMode("ADDITIVE");
																Type("PARTICLE");
																Texture("com_sfx_flashring2");
															}
															ParticleEmitter("BaseFlare3Top")
															{
																MaxParticles(-1.0000,-1.0000);
																StartDelay(0.0000,0.0000);
																BurstDelay(0.0500, 0.0500);
																BurstCount(1.0000,1.0000);
																MaxLodDist(2100.0000);
																MinLodDist(2000.0000);
																BoundingRadius(5.0);
																SoundName("")
																NoRegisterStep();
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
																		PositionX(-1.5000,-1.5000);
																		PositionY(8.6000,8.6000);
																		PositionZ(0.9000,0.9000);
																	}
																	PositionScale(0.0000,0.0000);
																	VelocityScale(0.0000,0.0000);
																	InheritVelocityFactor(0.0000,0.0000);
																	Size(0, 0.7500, 1.0000);
																	Hue(0, 130.0000, 160.0000);
																	Saturation(0, 100.0000, 100.0000);
																	Value(0, 255.0000, 255.0000);
																	Alpha(0, 0.0000, 0.0000);
																	StartRotation(0, 0.0000, 360.0000);
																	RotationVelocity(0, -255.0000, 257.0000);
																	FadeInTime(0.0000);
																}
																Transformer()
																{
																	LifeTime(0.1000);
																	Position()
																	{
																		LifeTime(0.5000)
																	}
																	Size(0)
																	{
																		LifeTime(0.5000)
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
																ParticleEmitter("BaseFlare3TopBeam")
																{
																	MaxParticles(-1.0000,-1.0000);
																	StartDelay(0.0000,0.0000);
																	BurstDelay(0.0500, 0.0500);
																	BurstCount(1.0000,1.0000);
																	MaxLodDist(2100.0000);
																	MinLodDist(2000.0000);
																	BoundingRadius(5.0);
																	SoundName("")
																	NoRegisterStep();
																	Size(1.0000, 1.0000);
																	Hue(255.0000, 255.0000);
																	Saturation(255.0000, 255.0000);
																	Value(255.0000, 255.0000);
																	Alpha(255.0000, 255.0000);
																	Spawner()
																	{
																		Spread()
																		{
																			PositionX(0.4000,0.4000);
																			PositionY(-0.5000,-0.5000);
																			PositionZ(-0.2000,-0.2000);
																		}
																		Offset()
																		{
																			PositionX(-1.5000,-1.5000);
																			PositionY(8.6000,8.6000);
																			PositionZ(0.9000,0.9000);
																		}
																		PositionScale(0.0000,0.0000);
																		VelocityScale(15.0000,20.0000);
																		InheritVelocityFactor(0.0000,0.0000);
																		Size(0, 0.1000, 0.3000);
																		Hue(0, 130.0000, 160.0000);
																		Saturation(0, 100.0000, 100.0000);
																		Value(0, 255.0000, 255.0000);
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
																			LifeTime(0.5000)
																		}
																		Size(0)
																		{
																			LifeTime(0.5000)
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
																		Type("SPARK");
																		SparkLength(0.0500);
																		Texture("com_sfx_laser_blue");
																	}
																	ParticleEmitter("BaseFlare3TopRing")
																	{
																		MaxParticles(-1.0000,-1.0000);
																		StartDelay(0.0000,0.0000);
																		BurstDelay(0.0500, 0.0500);
																		BurstCount(1.0000,1.0000);
																		MaxLodDist(2100.0000);
																		MinLodDist(2000.0000);
																		BoundingRadius(5.0);
																		SoundName("")
																		NoRegisterStep();
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
																				PositionX(-1.5000,-1.5000);
																				PositionY(8.6000,8.6000);
																				PositionZ(0.9000,0.9000);
																			}
																			PositionScale(0.0000,0.0000);
																			VelocityScale(0.0000,0.0000);
																			InheritVelocityFactor(0.0000,0.0000);
																			Size(0, 2.5000, 2.5000);
																			Hue(0, 130.0000, 160.0000);
																			Saturation(0, 100.0000, 100.0000);
																			Value(0, 255.0000, 255.0000);
																			Alpha(0, 0.0000, 0.0000);
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
																			}
																			Size(0)
																			{
																				LifeTime(0.5000)
																				Scale(1.0000);
																			}
																			Color(0)
																			{
																				LifeTime(0.0100)
																				Move(0.0000,0.0000,0.0000,4.0000);
																			}
																		}
																		Geometry()
																		{
																			BlendMode("ADDITIVE");
																			Type("PARTICLE");
																			Texture("com_sfx_flashring2");
																		}
																		ParticleEmitter("LaserFlareTop")
																		{
																			MaxParticles(-1.0000,-1.0000);
																			StartDelay(0.0000,0.0000);
																			BurstDelay(0.0500, 0.0500);
																			BurstCount(1.0000,1.0000);
																			MaxLodDist(2100.0000);
																			MinLodDist(2000.0000);
																			BoundingRadius(5.0);
																			SoundName("")
																			NoRegisterStep();
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
																					PositionY(6.7000,6.7000);
																					PositionZ(0.0000,0.0000);
																				}
																				PositionScale(0.0000,0.0000);
																				VelocityScale(0.0000,0.0000);
																				InheritVelocityFactor(0.0000,0.0000);
																				Size(0, 2.0000, 2.2500);
																				Hue(0, 130.0000, 160.0000);
																				Saturation(0, 100.0000, 100.0000);
																				Value(0, 255.0000, 255.0000);
																				Alpha(0, 0.0000, 0.0000);
																				StartRotation(0, 0.0000, 360.0000);
																				RotationVelocity(0, -255.0000, 257.0000);
																				FadeInTime(0.0000);
																			}
																			Transformer()
																			{
																				LifeTime(0.1000);
																				Position()
																				{
																					LifeTime(0.5000)
																				}
																				Size(0)
																				{
																					LifeTime(0.5000)
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
																			ParticleEmitter("LaserFlareTopBeam")
																			{
																				MaxParticles(-1.0000,-1.0000);
																				StartDelay(0.0000,0.0000);
																				BurstDelay(0.0500, 0.0500);
																				BurstCount(1.0000,1.0000);
																				MaxLodDist(2100.0000);
																				MinLodDist(2000.0000);
																				BoundingRadius(5.0);
																				SoundName("")
																				NoRegisterStep();
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
																						PositionY(-1.0000,-1.0000);
																						PositionZ(0.0000,0.0000);
																					}
																					Offset()
																					{
																						PositionX(0.0000,0.0000);
																						PositionY(5.0000,5.0000);
																						PositionZ(0.0000,0.0000);
																					}
																					PositionScale(0.0000,0.0000);
																					VelocityScale(20.0000,20.0000);
																					InheritVelocityFactor(0.0000,0.0000);
																					Size(0, 0.4000, 0.5000);
																					Hue(0, 130.0000, 160.0000);
																					Saturation(0, 100.0000, 100.0000);
																					Value(0, 255.0000, 255.0000);
																					Alpha(0, 0.0000, 0.0000);
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
																					}
																					Size(0)
																					{
																						LifeTime(0.5000)
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
																					Type("SPARK");
																					SparkLength(0.1000);
																					Texture("com_sfx_laser_blue");
																				}
																				ParticleEmitter("LaserFlareBottom")
																				{
																					MaxParticles(-1.0000,-1.0000);
																					StartDelay(0.0000,0.0000);
																					BurstDelay(0.0500, 0.0500);
																					BurstCount(1.0000,1.0000);
																					MaxLodDist(2100.0000);
																					MinLodDist(2000.0000);
																					BoundingRadius(5.0);
																					SoundName("")
																					NoRegisterStep();
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
																							PositionY(-0.5000,-0.5000);
																							PositionZ(0.0000,0.0000);
																						}
																						PositionScale(0.0000,0.0000);
																						VelocityScale(0.0000,0.0000);
																						InheritVelocityFactor(0.0000,0.0000);
																						Size(0, 2.0000, 2.2500);
																						Hue(0, 130.0000, 160.0000);
																						Saturation(0, 100.0000, 100.0000);
																						Value(0, 255.0000, 255.0000);
																						Alpha(0, 0.0000, 0.0000);
																						StartRotation(0, 0.0000, 360.0000);
																						RotationVelocity(0, -255.0000, 257.0000);
																						FadeInTime(0.0000);
																					}
																					Transformer()
																					{
																						LifeTime(0.1000);
																						Position()
																						{
																							LifeTime(0.5000)
																						}
																						Size(0)
																						{
																							LifeTime(0.5000)
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
																					ParticleEmitter("LaserFlareBottomBeam")
																					{
																						MaxParticles(-1.0000,-1.0000);
																						StartDelay(0.0000,0.0000);
																						BurstDelay(0.0500, 0.0500);
																						BurstCount(1.0000,1.0000);
																						MaxLodDist(2100.0000);
																						MinLodDist(2000.0000);
																						BoundingRadius(5.0);
																						SoundName("")
																						NoRegisterStep();
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
																								PositionY(1.0000,1.0000);
																								PositionZ(0.0000,0.0000);
																							}
																							Offset()
																							{
																								PositionX(0.0000,0.0000);
																								PositionY(1.5000,2.0000);
																								PositionZ(0.0000,0.0000);
																							}
																							PositionScale(0.0000,0.0000);
																							VelocityScale(20.0000,20.0000);
																							InheritVelocityFactor(0.0000,0.0000);
																							Size(0, 0.4000, 0.5000);
																							Hue(0, 130.0000, 160.0000);
																							Saturation(0, 100.0000, 100.0000);
																							Value(0, 255.0000, 255.0000);
																							Alpha(0, 0.0000, 0.0000);
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
																							}
																							Size(0)
																							{
																								LifeTime(0.5000)
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
																							Type("SPARK");
																							SparkLength(0.1000);
																							Texture("com_sfx_laser_blue");
																						}
																						ParticleEmitter("LargeLaserRing")
																						{
																							MaxParticles(-1.0000,-1.0000);
																							StartDelay(0.0000,0.0000);
																							BurstDelay(0.0500, 0.0500);
																							BurstCount(1.0000,1.0000);
																							MaxLodDist(2100.0000);
																							MinLodDist(2000.0000);
																							BoundingRadius(5.0);
																							SoundName("")
																							NoRegisterStep();
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
																									PositionY(3.0000,3.0000);
																									PositionZ(0.0000,0.0000);
																								}
																								PositionScale(0.0000,0.0000);
																								VelocityScale(0.0000,0.0000);
																								InheritVelocityFactor(0.0000,0.0000);
																								Size(0, 10.0000, 10.0000);
																								Hue(0, 130.0000, 160.0000);
																								Saturation(0, 100.0000, 100.0000);
																								Value(0, 255.0000, 255.0000);
																								Alpha(0, 0.0000, 0.0000);
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
																								}
																								Size(0)
																								{
																									LifeTime(0.5000)
																									Scale(1.0000);
																								}
																								Color(0)
																								{
																									LifeTime(0.0100)
																									Move(0.0000,0.0000,0.0000,16.0000);
																								}
																							}
																							Geometry()
																							{
																								BlendMode("ADDITIVE");
																								Type("PARTICLE");
																								Texture("com_sfx_flashring1");
																							}
																							ParticleEmitter("LargeLaserFlare")
																							{
																								MaxParticles(-1.0000,-1.0000);
																								StartDelay(0.0000,0.0000);
																								BurstDelay(0.0500, 0.0500);
																								BurstCount(1.0000,1.0000);
																								MaxLodDist(2100.0000);
																								MinLodDist(2000.0000);
																								BoundingRadius(5.0);
																								SoundName("")
																								NoRegisterStep();
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
																										PositionY(3.0000,3.0000);
																										PositionZ(0.0000,0.0000);
																									}
																									PositionScale(0.0000,0.0000);
																									VelocityScale(0.0000,0.0000);
																									InheritVelocityFactor(0.0000,0.0000);
																									Size(0, 5.0000, 5.0000);
																									Hue(0, 130.0000, 160.0000);
																									Saturation(0, 100.0000, 100.0000);
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
																										LifeTime(0.5000)
																									}
																									Size(0)
																									{
																										LifeTime(0.5000)
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
																								ParticleEmitter("LargeLaserPointFlare")
																								{
																									MaxParticles(-1.0000,-1.0000);
																									StartDelay(0.0000,0.0000);
																									BurstDelay(0.0500, 0.0500);
																									BurstCount(1.0000,1.0000);
																									MaxLodDist(2100.0000);
																									MinLodDist(2000.0000);
																									BoundingRadius(5.0);
																									SoundName("")
																									NoRegisterStep();
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
																											PositionY(3.0000,3.0000);
																											PositionZ(0.0000,0.0000);
																										}
																										PositionScale(0.0000,0.0000);
																										VelocityScale(0.0000,0.0000);
																										InheritVelocityFactor(0.0000,0.0000);
																										Size(0, 14.0000, 16.0000);
																										Hue(0, 130.0000, 160.0000);
																										Saturation(0, 100.0000, 100.0000);
																										Value(0, 255.0000, 255.0000);
																										Alpha(0, 0.0000, 0.0000);
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
																										}
																										Size(0)
																										{
																											LifeTime(0.5000)
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
																										Texture("com_sfx_flare1");
																									}
																									ParticleEmitter("LaserFlareSparks")
																									{
																										MaxParticles(-1.0000,-1.0000);
																										StartDelay(0.0000,0.0000);
																										BurstDelay(0.0500, 0.0500);
																										BurstCount(2.0000,2.0000);
																										MaxLodDist(2100.0000);
																										MinLodDist(2000.0000);
																										BoundingRadius(5.0);
																										SoundName("")
																										NoRegisterStep();
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
																												PositionY(3.0000,3.0000);
																												PositionZ(0.0000,0.0000);
																											}
																											PositionScale(0.0000,0.0000);
																											VelocityScale(0.0000,0.0000);
																											InheritVelocityFactor(0.0000,0.0000);
																											Size(0, 1.0000, 1.5000);
																											Hue(0, 130.0000, 160.0000);
																											Saturation(0, 100.0000, 100.0000);
																											Value(0, 255.0000, 255.0000);
																											Alpha(0, 0.0000, 0.0000);
																											StartRotation(0, 0.0000, 360.0000);
																											RotationVelocity(0, 0.0000, 0.0000);
																											FadeInTime(0.0000);
																										}
																										Transformer()
																										{
																											LifeTime(0.2000);
																											Position()
																											{
																												LifeTime(0.5000)
																											}
																											Size(0)
																											{
																												LifeTime(0.1000)
																												Scale(6.0000);
																											}
																											Color(0)
																											{
																												LifeTime(0.0100)
																												Move(0.0000,0.0000,0.0000,96.0000);
																												Next()
																												{
																													LifeTime(0.1900)
																													Move(0.0000,0.0000,0.0000,-128.0000);
																												}
																											}
																										}
																										Geometry()
																										{
																											BlendMode("ADDITIVE");
																											Type("PARTICLE");
																											Texture("com_sfx_dirt2");
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
