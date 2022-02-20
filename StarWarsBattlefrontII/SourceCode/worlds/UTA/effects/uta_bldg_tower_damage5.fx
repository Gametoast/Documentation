ParticleEmitter("BlackSmoke_Top")
{
	MaxParticles(-1.0000,-1.0000);
	StartDelay(0.0000,0.0000);
	BurstDelay(0.1000, 0.3000);
	BurstCount(1.0000,1.0000);
	MaxLodDist(10000.0000);
	MinLodDist(8000.0000);
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
			PositionY(1.0000,2.0000);
			PositionZ(-1.0000,1.0000);
		}
		Offset()
		{
			PositionX(-3.0000,3.0000);
			PositionY(17.0000,17.0000);
			PositionZ(-3.0000,3.0000);
		}
		PositionScale(0.0000,0.0000);
		VelocityScale(0.1000,0.5000);
		InheritVelocityFactor(0.0000,0.0000);
		Size(0, 1.0000, 1.5000);
		Hue(0, 0.0000, 0.0000);
		Saturation(0, 0.0000, 0.0000);
		Value(0, 128.0000, 255.0000);
		Alpha(0, 0.0000, 0.0000);
		StartRotation(0, -70.0000, 0.0000);
		RotationVelocity(0, -40.0000, 0.0000);
		FadeInTime(0.0000);
	}
	Transformer()
	{
		LifeTime(10.0000);
		Position()
		{
			LifeTime(10.0000)
			Accelerate(0.0000, 1.0000, 0.0000);
		}
		Size(0)
		{
			LifeTime(10.0000)
			Scale(5.0000);
		}
		Color(0)
		{
			LifeTime(0.5000)
			Move(127.5000,0.0000,0.0000,200.0000);
			Next()
			{
				LifeTime(9.5000)
				Move(0.0000,0.0000,0.0000,-200.0000);
			}
		}
	}
	Geometry()
	{
		BlendMode("NORMAL");
		Type("PARTICLE");
		Texture("com_sfx_smoke2");
	}
	ParticleEmitter("BlackSmoke_Bottom")
	{
		MaxParticles(-1.0000,-1.0000);
		StartDelay(0.0000,0.0000);
		BurstDelay(0.1000, 0.3000);
		BurstCount(1.0000,1.0000);
		MaxLodDist(10000.0000);
		MinLodDist(8000.0000);
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
				PositionY(1.0000,2.0000);
				PositionZ(-1.0000,1.0000);
			}
			Offset()
			{
				PositionX(-3.0000,3.0000);
				PositionY(3.0000,3.0000);
				PositionZ(-3.0000,3.0000);
			}
			PositionScale(0.0000,0.0000);
			VelocityScale(0.1000,0.5000);
			InheritVelocityFactor(0.0000,0.0000);
			Size(0, 1.0000, 1.5000);
			Hue(0, 0.0000, 0.0000);
			Saturation(0, 0.0000, 0.0000);
			Value(0, 128.0000, 255.0000);
			Alpha(0, 0.0000, 0.0000);
			StartRotation(0, -70.0000, 0.0000);
			RotationVelocity(0, -40.0000, 0.0000);
			FadeInTime(0.0000);
		}
		Transformer()
		{
			LifeTime(10.0000);
			Position()
			{
				LifeTime(10.0000)
				Accelerate(0.0000, 1.0000, 0.0000);
			}
			Size(0)
			{
				LifeTime(10.0000)
				Scale(5.0000);
			}
			Color(0)
			{
				LifeTime(0.5000)
				Move(127.5000,0.0000,0.0000,200.0000);
				Next()
				{
					LifeTime(9.5000)
					Move(0.0000,0.0000,0.0000,-200.0000);
				}
			}
		}
		Geometry()
		{
			BlendMode("NORMAL");
			Type("PARTICLE");
			Texture("com_sfx_smoke2");
		}
		ParticleEmitter("Lightning_Top1")
		{
			MaxParticles(-1.0000,-1.0000);
			StartDelay(0.0000,1.0000);
			BurstDelay(0.5000, 1.5000);
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
					PositionY(19.0000,19.0000);
					PositionZ(0.0000,0.0000);
				}
				PositionScale(0.0000,0.0000);
				VelocityScale(0.0000,0.0000);
				InheritVelocityFactor(0.0000,0.0000);
				Size(0, 1.0000, 1.1000);
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
			ParticleEmitter("Lightning_Top2")
			{
				MaxParticles(-1.0000,-1.0000);
				StartDelay(0.0000,1.0000);
				BurstDelay(0.5000, 1.5000);
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
						PositionY(19.0000,19.0000);
						PositionZ(0.0000,0.0000);
					}
					PositionScale(0.0000,0.0000);
					VelocityScale(0.0000,0.0000);
					InheritVelocityFactor(0.0000,0.0000);
					Size(0, 1.0000, 1.1000);
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
				ParticleEmitter("Lightning_Top3")
				{
					MaxParticles(-1.0000,-1.0000);
					StartDelay(0.0000,1.0000);
					BurstDelay(0.5000, 1.5000);
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
							PositionY(19.0000,19.0000);
							PositionZ(0.0000,0.0000);
						}
						PositionScale(0.0000,0.0000);
						VelocityScale(0.0000,0.0000);
						InheritVelocityFactor(0.0000,0.0000);
						Size(0, 1.0000, 1.1000);
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
					ParticleEmitter("Lightning_Bottom1")
					{
						MaxParticles(-1.0000,-1.0000);
						StartDelay(0.0000,1.0000);
						BurstDelay(0.5000, 1.5000);
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
								PositionY(4.0000,4.0000);
								PositionZ(0.0000,0.0000);
							}
							PositionScale(0.0000,0.0000);
							VelocityScale(0.0000,0.0000);
							InheritVelocityFactor(0.0000,0.0000);
							Size(0, 1.0000, 1.1000);
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
						ParticleEmitter("Lightning_Bottom2")
						{
							MaxParticles(-1.0000,-1.0000);
							StartDelay(0.0000,1.0000);
							BurstDelay(0.5000, 1.5000);
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
									PositionY(4.0000,4.0000);
									PositionZ(0.0000,0.0000);
								}
								PositionScale(0.0000,0.0000);
								VelocityScale(0.0000,0.0000);
								InheritVelocityFactor(0.0000,0.0000);
								Size(0, 1.0000, 1.1000);
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
							ParticleEmitter("Lightning_Bottom3")
							{
								MaxParticles(-1.0000,-1.0000);
								StartDelay(0.0000,1.0000);
								BurstDelay(0.5000, 1.5000);
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
										PositionY(4.0000,4.0000);
										PositionZ(0.0000,0.0000);
									}
									PositionScale(0.0000,0.0000);
									VelocityScale(0.0000,0.0000);
									InheritVelocityFactor(0.0000,0.0000);
									Size(0, 1.0000, 1.1000);
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
								ParticleEmitter("Flame_Bottom1")
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
											PositionX(-40.0000,40.0000);
											PositionY(1.0000,2.0000);
											PositionZ(-40.0000,40.0000);
										}
										Offset()
										{
											PositionX(0.0000,0.0000);
											PositionY(3.0000,3.0000);
											PositionZ(0.0000,0.0000);
										}
										PositionScale(2.0000,3.0000);
										VelocityScale(0.0000,0.0000);
										InheritVelocityFactor(0.0000,0.0000);
										Size(0, 2.0000, 3.0000);
										Red(0, 255.0000, 255.0000);
										Green(0, 255.0000, 255.0000);
										Blue(0, 255.0000, 255.0000);
										Alpha(0, 0.0000, 0.0000);
										StartRotation(0, 0.0000, 20.0000);
										RotationVelocity(0, -80.0000, 0.0000);
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
											Scale(0.1000);
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
										Texture("com_sfx_flames1");
									}
									ParticleEmitter("Flame_Bottom2")
									{
										MaxParticles(-1.0000,-1.0000);
										StartDelay(0.0000,0.0000);
										BurstDelay(0.0400, 0.0400);
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
												PositionX(-40.0000,40.0000);
												PositionY(1.0000,2.0000);
												PositionZ(-40.0000,40.0000);
											}
											Offset()
											{
												PositionX(0.0000,0.0000);
												PositionY(3.0000,3.0000);
												PositionZ(0.0000,0.0000);
											}
											PositionScale(2.0000,3.0000);
											VelocityScale(0.0000,0.0000);
											InheritVelocityFactor(0.0000,0.0000);
											Size(0, 2.0000, 3.0000);
											Red(0, 255.0000, 255.0000);
											Green(0, 255.0000, 255.0000);
											Blue(0, 255.0000, 255.0000);
											Alpha(0, 0.0000, 0.0000);
											StartRotation(0, 0.0000, 20.0000);
											RotationVelocity(0, -80.0000, 0.0000);
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
												Scale(0.1000);
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
											Texture("com_sfx_flames2");
										}
										ParticleEmitter("Flame_Bottom3")
										{
											MaxParticles(-1.0000,-1.0000);
											StartDelay(0.0000,0.0000);
											BurstDelay(1.2000, 1.2000);
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
													PositionX(-40.0000,40.0000);
													PositionY(0.0000,0.0000);
													PositionZ(-40.0000,40.0000);
												}
												Offset()
												{
													PositionX(0.0000,0.0000);
													PositionY(3.0000,3.0000);
													PositionZ(0.0000,0.0000);
												}
												PositionScale(2.0000,3.0000);
												VelocityScale(0.0000,0.0000);
												InheritVelocityFactor(0.0000,0.0000);
												Size(0, 1.0000, 1.1000);
												Red(0, 255.0000, 255.0000);
												Green(0, 255.0000, 255.0000);
												Blue(0, 255.0000, 255.0000);
												Alpha(0, 0.0000, 0.0000);
												StartRotation(0, 0.0000, 20.0000);
												RotationVelocity(0, -80.0000, 0.0000);
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
												Texture("com_sfx_flames3");
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
