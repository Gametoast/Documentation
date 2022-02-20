ParticleEmitter("Foam1")
{
	MaxParticles(-1.0000,-1.0000);
	StartDelay(0.0000,0.0000);
	BurstDelay(0.2500, 0.2500);
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
			PositionZ(1.0000,2.0000);
		}
		Offset()
		{
			PositionX(0.0000,0.0000);
			PositionY(-2.4000,-2.4000);
			PositionZ(0.0000,0.0000);
		}
		PositionScale(0.0000,0.0000);
		VelocityScale(0.1000,0.3500);
		InheritVelocityFactor(0.0000,0.0000);
		Size(0, 0.5000, 2.0000);
		Red(0, 255.0000, 255.0000);
		Green(0, 255.0000, 255.0000);
		Blue(0, 255.0000, 255.0000);
		Alpha(0, 0.0000, 0.0000);
		StartRotation(0, 4.0000, 4.8000);
		RotationVelocity(0, 0.0010, 0.0510);
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
			Reach(255.0000,255.0000,255.0000,200.0000);
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
	ParticleEmitter("Mist1")
	{
		MaxParticles(-1.0000,-1.0000);
		StartDelay(0.0000,0.0000);
		BurstDelay(0.1000, 0.1500);
		BurstCount(1.0000,1.0000);
		MaxLodDist(1000.0000);
		MinLodDist(800.0000);
		BoundingRadius(30.0);
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
				PositionY(0.5000,1.0000);
				PositionZ(-1.0000,1.0000);
			}
			Offset()
			{
				PositionX(-1.0000,1.0000);
				PositionY(-2.4000,-2.4000);
				PositionZ(-1.0000,1.0000);
			}
			PositionScale(0.0000,0.0000);
			VelocityScale(0.5000,1.5000);
			InheritVelocityFactor(0.0000,0.0000);
			Size(0, 1.0000, 1.4000);
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
			LifeTime(1.5000);
			Position()
			{
				LifeTime(1.5000)
			}
			Size(0)
			{
				LifeTime(1.5000)
				Scale(3.0000);
			}
			Color(0)
			{
				LifeTime(0.5000)
				Reach(231.0000,228.0000,228.0000,128.0000);
				Next()
				{
					LifeTime(0.5000)
					Reach(255.0000,255.0000,255.0000,128.0000);
					Next()
					{
						LifeTime(0.5000)
						Reach(255.0000,255.0000,255.0000,0.0000);
					}
				}
			}
		}
		Geometry()
		{
			BlendMode("NORMAL");
			Type("PARTICLE");
			Texture("com_sfx_smoke4");
		}
	}
}
