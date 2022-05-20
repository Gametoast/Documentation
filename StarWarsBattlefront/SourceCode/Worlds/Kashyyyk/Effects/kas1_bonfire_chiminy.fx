ParticleEmitter("BlackSmoke")
{
	MaxParticles(-1.0000,-1.0000);
	StartDelay(0.0000,0.0000);
	BurstDelay(0.2500, 0.4000);
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
		Spread()
		{
			PositionX(0.0000,0.0000);
			PositionY(0.2500,2.0000);
			PositionZ(0.0000,0.0000);
		}
		Offset()
		{
			PositionX(-0.2500,0.2500);
			PositionY(0.0000,0.0000);
			PositionZ(-0.2500,0.2500);
		}
		PositionScale(0.0000,0.0000);
		VelocityScale(1.5000,1.5000);
		InheritVelocityFactor(0.0000,0.0000);
		Size(0, 0.1000, 1.6000);
		Hue(0, 127.5000, 127.5000);
		Saturation(0, 0.0000, 0.0000);
		Value(0, 255.0000, 255.0000);
		Alpha(0, 0.0000, 50.0000);
		StartRotation(0, 0.0000, 360.0000);
		RotationVelocity(0, -40.0000, 0.0000);
		FadeInTime(0.0000);
	}
	Transformer()
	{
		LifeTime(2.5000);
		Position()
		{
			LifeTime(2.5000)
			Accelerate(0.0000, -0.0500, 0.0000);
		}
		Size(0)
		{
			LifeTime(2.5000)
			Scale(3.0000);
		}
		Color(0)
		{
			LifeTime(1.2500)
			Move(127.5000,0.0000,200.0000,120.0000);
			Next()
			{
				LifeTime(1.2500)
				Move(0.0000,0.0000,0.0000,-170.0000);
			}
		}
	}
	Geometry()
	{
		BlendMode("NORMAL");
		Type("PARTICLE");
		Texture("thicksmoke2");
	}
	ParticleEmitter("BlackSmoke")
	{
		MaxParticles(-1.0000,-1.0000);
		StartDelay(0.0000,0.0000);
		BurstDelay(0.2500, 0.4000);
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
				PositionY(0.2500,2.0000);
				PositionZ(0.0000,0.0000);
			}
			Offset()
			{
				PositionX(-0.2500,0.2500);
				PositionY(10.0000,10.0000);
				PositionZ(-0.2500,0.2500);
			}
			PositionScale(0.0000,0.0000);
			VelocityScale(1.5000,1.5000);
			InheritVelocityFactor(0.0000,0.0000);
			Size(0, 0.1000, 1.6000);
			Hue(0, 127.5000, 127.5000);
			Saturation(0, 0.0000, 0.0000);
			Value(0, 255.0000, 255.0000);
			Alpha(0, 0.0000, 50.0000);
			StartRotation(0, 0.0000, 360.0000);
			RotationVelocity(0, -40.0000, 0.0000);
			FadeInTime(0.0000);
		}
		Transformer()
		{
			LifeTime(2.5000);
			Position()
			{
				LifeTime(2.5000)
				Accelerate(0.0000, -0.0500, 0.0000);
			}
			Size(0)
			{
				LifeTime(2.5000)
				Scale(3.0000);
			}
			Color(0)
			{
				LifeTime(1.2500)
				Move(127.5000,0.0000,200.0000,120.0000);
				Next()
				{
					LifeTime(1.2500)
					Move(0.0000,0.0000,0.0000,-170.0000);
				}
			}
		}
		Geometry()
		{
			BlendMode("NORMAL");
			Type("PARTICLE");
			Texture("thicksmoke2");
		}
		ParticleEmitter("Flame_Emitter")
		{
			MaxParticles(-1.0000,-1.0000);
			StartDelay(0.0000,0.0000);
			BurstDelay(0.0800, 0.0800);
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
					PositionX(-0.2500,0.2500);
					PositionY(-0.2500,0.2500);
					PositionZ(-0.2500,0.2500);
				}
				PositionScale(0.0000,0.0000);
				VelocityScale(1.0000,5.0000);
				InheritVelocityFactor(0.0000,0.0000);
				Size(0, 0.5000, 1.2500);
				Red(0, 255.0000, 255.0000);
				Green(0, 255.0000, 255.0000);
				Blue(0, 255.0000, 255.0000);
				Alpha(0, 0.0000, 0.0000);
				StartRotation(0, 0.0000, 0.0000);
				RotationVelocity(0, -40.0000, 40.0000);
				FadeInTime(0.0000);
			}
			Transformer()
			{
				LifeTime(0.5000);
				Position()
				{
					LifeTime(0.5000)
				}
				Size(0)
				{
					LifeTime(0.5000)
					Scale(0.5000);
				}
				Color(0)
				{
					LifeTime(0.1000)
					Reach(255.0000,255.0000,255.0000,255.0000);
					Next()
					{
						LifeTime(0.5000)
						Reach(200.0000,0.0000,0.0000,0.0000);
					}
				}
			}
			Geometry()
			{
				BlendMode("ADDITIVE");
				Type("PARTICLE");
				Texture("flames1");
			}
			ParticleEmitter("Flame_Emitter")
			{
				MaxParticles(-1.0000,-1.0000);
				StartDelay(0.0000,0.0000);
				BurstDelay(0.0900, 0.0900);
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
						PositionX(-0.2500,0.2500);
						PositionY(-0.2500,0.2500);
						PositionZ(-0.2500,0.2500);
					}
					PositionScale(0.0000,0.0000);
					VelocityScale(1.0000,5.0000);
					InheritVelocityFactor(0.0000,0.0000);
					Size(0, 0.5000, 1.2500);
					Red(0, 255.0000, 255.0000);
					Green(0, 255.0000, 255.0000);
					Blue(0, 255.0000, 255.0000);
					Alpha(0, 0.0000, 0.0000);
					StartRotation(0, 0.0000, 0.0000);
					RotationVelocity(0, -40.0000, 40.0000);
					FadeInTime(0.0000);
				}
				Transformer()
				{
					LifeTime(0.5000);
					Position()
					{
						LifeTime(0.5000)
					}
					Size(0)
					{
						LifeTime(0.5000)
						Scale(0.5000);
					}
					Color(0)
					{
						LifeTime(0.1000)
						Reach(255.0000,255.0000,255.0000,255.0000);
						Next()
						{
							LifeTime(0.5000)
							Reach(200.0000,0.0000,0.0000,0.0000);
						}
					}
				}
				Geometry()
				{
					BlendMode("ADDITIVE");
					Type("PARTICLE");
					Texture("flames2");
				}
				ParticleEmitter("Flame_Emitter")
				{
					MaxParticles(-1.0000,-1.0000);
					StartDelay(0.0000,0.0000);
					BurstDelay(0.1000, 0.1000);
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
							PositionX(-0.2500,0.2500);
							PositionY(-0.2500,0.2500);
							PositionZ(-0.2500,0.2500);
						}
						PositionScale(0.0000,0.0000);
						VelocityScale(1.0000,5.0000);
						InheritVelocityFactor(0.0000,0.0000);
						Size(0, 0.5000, 1.2500);
						Red(0, 255.0000, 255.0000);
						Green(0, 255.0000, 255.0000);
						Blue(0, 255.0000, 255.0000);
						Alpha(0, 0.0000, 0.0000);
						StartRotation(0, 0.0000, 0.0000);
						RotationVelocity(0, -40.0000, 40.0000);
						FadeInTime(0.0000);
					}
					Transformer()
					{
						LifeTime(0.5000);
						Position()
						{
							LifeTime(0.5000)
						}
						Size(0)
						{
							LifeTime(0.5000)
							Scale(0.5000);
						}
						Color(0)
						{
							LifeTime(0.1000)
							Reach(255.0000,255.0000,255.0000,255.0000);
							Next()
							{
								LifeTime(0.5000)
								Reach(200.0000,0.0000,0.0000,0.0000);
							}
						}
					}
					Geometry()
					{
						BlendMode("ADDITIVE");
						Type("PARTICLE");
						Texture("flames3");
					}
				}
			}
		}
	}
}
