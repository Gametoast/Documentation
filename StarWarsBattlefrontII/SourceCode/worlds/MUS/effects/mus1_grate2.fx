ParticleEmitter("Mist")
{
	MaxParticles(-1.0000,-1.0000);
	StartDelay(0.0000,0.0000);
	BurstDelay(1.0000, 1.0000);
	BurstCount(1.0000,1.0000);
	MaxLodDist(1000.0000);
	MinLodDist(800.0000);
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
			PositionX(-1.5000,1.5000);
			PositionY(0.0000,0.0000);
			PositionZ(-1.5000,0.0000);
		}
		PositionScale(0.0000,0.0000);
		VelocityScale(0.0000,0.0000);
		InheritVelocityFactor(0.0000,0.0000);
		Size(0, 2.0000, 3.0000);
		Red(0, 255.0000, 255.0000);
		Green(0, 255.0000, 255.0000);
		Blue(0, 255.0000, 255.0000);
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
			LifeTime(8.0000)
			Accelerate(0.0000, 0.0500, 0.0000);
		}
		Size(0)
		{
			LifeTime(4.0000)
			Scale(1.5000);
		}
		Color(0)
		{
			LifeTime(1.0000)
			Move(0.0000,0.0000,0.0000,16.0000);
			Next()
			{
				LifeTime(3.0000)
				Move(0.0000,0.0000,0.0000,-16.0000);
			}
		}
	}
	Geometry()
	{
		BlendMode("ADDITIVE");
		Type("PARTICLE");
		Texture("com_sfx_smoke3");
	}
	ParticleEmitter("Mist")
	{
		MaxParticles(-1.0000,-1.0000);
		StartDelay(0.0000,0.0000);
		BurstDelay(1.0000, 1.0000);
		BurstCount(1.0000,1.0000);
		MaxLodDist(1000.0000);
		MinLodDist(800.0000);
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
				PositionX(-1.5000,1.5000);
				PositionY(0.0000,0.0000);
				PositionZ(0.0000,1.5000);
			}
			PositionScale(0.0000,0.0000);
			VelocityScale(0.0000,0.0000);
			InheritVelocityFactor(0.0000,0.0000);
			Size(0, 2.0000, 3.0000);
			Red(0, 255.0000, 255.0000);
			Green(0, 255.0000, 255.0000);
			Blue(0, 255.0000, 255.0000);
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
				LifeTime(8.0000)
				Accelerate(0.0000, 0.0500, 0.0000);
			}
			Size(0)
			{
				LifeTime(4.0000)
				Scale(1.5000);
			}
			Color(0)
			{
				LifeTime(1.0000)
				Move(0.0000,0.0000,0.0000,16.0000);
				Next()
				{
					LifeTime(3.0000)
					Move(0.0000,0.0000,0.0000,-16.0000);
				}
			}
		}
		Geometry()
		{
			BlendMode("ADDITIVE");
			Type("PARTICLE");
			Texture("com_sfx_smoke3");
		}
		ParticleEmitter("Smoke_Blur")
		{
			MaxParticles(-1.0000,-1.0000);
			StartDelay(0.0000,0.0000);
			BurstDelay(0.2500, 0.2500);
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
					PositionY(0.1000,0.4000);
					PositionZ(0.0000,0.0000);
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
				Size(0, 1.0000, 2.0000);
				Red(0, 255.0000, 255.0000);
				Green(0, 255.0000, 255.0000);
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
				}
				Size(0)
				{
					LifeTime(2.0000)
					Scale(4.0000);
				}
				Color(0)
				{
					LifeTime(0.2000)
					Move(0.0000,0.0000,0.0000,255.0000);
					Next()
					{
						LifeTime(0.8000)
						Move(0.0000,0.0000,0.0000,-255.0000);
					}
				}
			}
			Geometry()
			{
				BlendMode("BLUR");
				BlurValue(0.1000);
				BlurRes(1.0000);
				Type("PARTICLE");
				Texture("com_sfx_waterfoam1");
			}
		}
	}
}
