ParticleEmitter("waterfall_spray")
{
	MaxParticles(-1.0000,-1.0000);
	StartDelay(0.0000,0.0000);
	BurstDelay(0.0000, 0.1000);
	BurstCount(1.0000,1.0000);
	MaxLodDist(50.0000);
	MinLodDist(10.0000);
	BoundingRadius(30.0);
	SoundName("")
	Size(1.0000, 1.0000);
	Red(255.0000, 255.0000);
	Green(255.0000, 255.0000);
	Blue(255.0000, 255.0000);
	Alpha(255.0000, 255.0000);
	Spawner()
	{
		Spread()
		{
			PositionX(-0.3000,0.3000);
			PositionY(-10.0000,-1.0000);
			PositionZ(2.0000,2.0000);
		}
		Offset()
		{
			PositionX(-0.1000,0.1000);
			PositionY(-0.1000,0.1000);
			PositionZ(-0.1000,0.1000);
		}
		PositionScale(0.0000,0.0000);
		VelocityScale(3.0000,3.0000);
		InheritVelocityFactor(0.0000,0.0000);
		Size(0, 3.0000, 3.0500);
		Red(0, 209.0000, 228.0000);
		Green(0, 214.0000, 233.0000);
		Blue(0, 214.0000, 233.0000);
		Alpha(0, 128.0000, 255.0000);
		StartRotation(0, 0.0000, 360.0000);
		RotationVelocity(0, 0.0000, 0.0000);
		FadeInTime(0.0000);
	}
	Transformer()
	{
		LifeTime(2.0000);
		Position()
		{
			LifeTime(1.5000)
			Accelerate(0.0000, -40.0000, 2.0000);
		}
		Size(0)
		{
			LifeTime(1.0000)
			Scale(2.0000);
		}
		Color(0)
		{
			LifeTime(0.5000)
			Reach(201.0000,214.0000,213.0000,255.0000);
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
