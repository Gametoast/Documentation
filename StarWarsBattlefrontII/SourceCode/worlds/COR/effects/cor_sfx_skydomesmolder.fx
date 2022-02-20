ParticleEmitter("BlackSmoke")
{
	MaxParticles(-1.0000,-1.0000);
	StartDelay(1.0000,1.0000);
	BurstDelay(0.2000, 0.4000);
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
			PositionY(0.2500,0.4000);
			PositionZ(0.0000,0.0000);
		}
		Offset()
		{
			PositionX(-0.2000,0.2000);
			PositionY(-0.1000,0.1000);
			PositionZ(-0.2000,0.2000);
		}
		PositionScale(0.0000,0.0000);
		VelocityScale(1.0000,1.5000);
		InheritVelocityFactor(0.0000,0.0000);
		Size(0, 0.3000, 0.5000);
		Hue(0, 10.0000, 20.0000);
		Saturation(0, 255.0000, 255.0000);
		Value(0, 255.0000, 255.0000);
		Alpha(0, 0.0000, 0.0000);
		StartRotation(0, 0.0000, 360.0000);
		RotationVelocity(0, -40.0000, 0.0000);
		FadeInTime(0.0000);
	}
	Transformer()
	{
		LifeTime(7.0000);
		Position()
		{
			LifeTime(7.0000)
			Accelerate(0.0000, -0.0500, 0.0000);
		}
		Size(0)
		{
			LifeTime(6.0000)
			Scale(4.0000);
		}
		Color(0)
		{
			LifeTime(0.1000)
			Move(0.0000,0.0000,0.0000,255.0000);
			Next()
			{
				LifeTime(2.9000)
				Move(0.0000,0.0000,-128.0000,-64.0000);
				Next()
				{
					LifeTime(4.0000)
					Move(0.0000,0.0000,-128.0000,-192.0000);
				}
			}
		}
	}
	Geometry()
	{
		BlendMode("NORMAL");
		Type("PARTICLE");
		Texture("com_sfx_smoke3");
	}
	ParticleEmitter("Fire")
	{
		MaxParticles(-1.0000,-1.0000);
		StartDelay(1.0000,1.0000);
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
				PositionY(0.2500,0.4000);
				PositionZ(0.0000,0.0000);
			}
			Offset()
			{
				PositionX(-0.1000,0.1000);
				PositionY(-0.1000,0.1000);
				PositionZ(-0.1000,0.1000);
			}
			PositionScale(0.0000,0.0000);
			VelocityScale(0.7500,1.2500);
			InheritVelocityFactor(0.0000,0.0000);
			Size(0, 0.1000, 0.4000);
			Hue(0, 0.0000, 0.0000);
			Saturation(0, 0.0000, 200.0000);
			Value(0, 255.0000, 255.0000);
			Alpha(0, 0.0000, 0.0000);
			StartRotation(0, 0.0000, 360.0000);
			RotationVelocity(0, -40.0000, 0.0000);
			FadeInTime(0.0000);
		}
		Transformer()
		{
			LifeTime(3.0000);
			Position()
			{
				LifeTime(7.0000)
				Accelerate(0.0000, -0.0500, 0.0000);
			}
			Size(0)
			{
				LifeTime(6.0000)
				Scale(3.0000);
			}
			Color(0)
			{
				LifeTime(0.1000)
				Move(0.0000,0.0000,0.0000,255.0000);
				Next()
				{
					LifeTime(2.9000)
					Move(0.0000,0.0000,0.0000,-255.0000);
					Next()
					{
						LifeTime(4.0000)
						Move(0.0000,0.0000,-128.0000,-192.0000);
					}
				}
			}
		}
		Geometry()
		{
			BlendMode("ADDITIVE");
			Type("PARTICLE");
			Texture("com_sfx_explosion1");
		}
		ParticleEmitter("Glow")
		{
			MaxParticles(-1.0000,-1.0000);
			StartDelay(0.0000,0.0000);
			BurstDelay(2.0000, 2.0000);
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
				PositionScale(0.0000,0.0000);
				VelocityScale(0.0000,0.0000);
				InheritVelocityFactor(0.0000,0.0000);
				Size(0, 5.0000, 5.3000);
				Hue(0, 30.0000, 30.0000);
				Saturation(0, 130.0000, 130.0000);
				Value(0, 255.0000, 255.0000);
				Alpha(0, 0.0000, 0.0000);
				StartRotation(0, 0.0000, 0.0000);
				RotationVelocity(0, 0.0000, 0.0000);
				FadeInTime(0.0000);
			}
			Transformer()
			{
				LifeTime(4.0000);
				Position()
				{
					LifeTime(7.0000)
					Accelerate(0.0000, -0.0500, 0.0000);
				}
				Size(0)
				{
					LifeTime(6.0000)
					Scale(1.0000);
				}
				Color(0)
				{
					LifeTime(0.0100)
					Move(0.0000,0.0000,0.0000,16.0000);
					Next()
					{
						LifeTime(3.9000)
						Move(0.0000,0.0000,0.0000,0.0000);
					}
				}
			}
			Geometry()
			{
				BlendMode("ADDITIVE");
				Type("PARTICLE");
				Texture("com_sfx_flashball1");
			}
			ParticleEmitter("Glow")
			{
				MaxParticles(-1.0000,-1.0000);
				StartDelay(0.0000,0.0000);
				BurstDelay(2.0000, 2.0000);
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
					PositionScale(0.0000,0.0000);
					VelocityScale(0.0000,0.0000);
					InheritVelocityFactor(0.0000,0.0000);
					Size(0, 2.0000, 2.3000);
					Hue(0, 30.0000, 30.0000);
					Saturation(0, 200.0000, 200.0000);
					Value(0, 255.0000, 255.0000);
					Alpha(0, 0.0000, 0.0000);
					StartRotation(0, 0.0000, 0.0000);
					RotationVelocity(0, 0.0000, 0.0000);
					FadeInTime(0.0000);
				}
				Transformer()
				{
					LifeTime(4.0000);
					Position()
					{
						LifeTime(7.0000)
						Accelerate(0.0000, -0.0500, 0.0000);
					}
					Size(0)
					{
						LifeTime(6.0000)
						Scale(1.0000);
					}
					Color(0)
					{
						LifeTime(0.0100)
						Move(0.0000,0.0000,0.0000,24.0000);
						Next()
						{
							LifeTime(3.9000)
							Move(0.0000,0.0000,0.0000,0.0000);
						}
					}
				}
				Geometry()
				{
					BlendMode("ADDITIVE");
					Type("PARTICLE");
					Texture("com_sfx_flashball1");
				}
			}
		}
	}
}
