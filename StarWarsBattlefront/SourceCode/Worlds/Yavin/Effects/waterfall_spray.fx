ParticleEmitter("waterfall_spray")
{
	MaxParticles(-1.00,-1.00);
	StartDelay(0.00,0.00);
	BurstDelay(0.00, 0.10);
	BurstCount(1.00,1.00);
	Size(1.00, 1.00);
	BoundingRadius(30.0);
	Red(255.00, 255.00);
	Green(255.00, 255.00);
	Blue(255.00, 255.00);
	Alpha(255.00, 255.00);
	Spawner()
	{
		Spread()
		{
			PositionX(-0.30,0.30);
			PositionY(-10.00,-1.00);
			PositionZ(2.00,2.00);
		}
		Offset()
		{
			PositionX(-0.10,0.10);
			PositionY(-0.10,0.10);
			PositionZ(-0.10,0.10);
		}
		PositionScale(0.00,0.00);
		VelocityScale(3.00,3.00);
		Size(0, 3.00, 3.05);
		Red(0, 209.00, 228.00);
		Green(0, 214.00, 233.00);
		Blue(0, 214.00, 233.00);
		Alpha(0, 128.00, 255.00);
		StartRotation(0, 270.00, 270.00);
		RotationVelocity(0, 30.00, 30.00);
		FadeInTime(0.00);
	}
	Transformer()
	{
		LifeTime(2.00);
		Position()
		{
			LifeTime(1.50)
			Accelerate(0.00, -40.00, 2.00);
		}
		Size(0)
		{
			LifeTime(1.00)
			Scale(2.00);
		}
		Color(0)
		{
			LifeTime(0.50)
			Reach(201.00,214.00,213.00,255.00);
			Next()
			{
				LifeTime(0.50)
				Reach(255.00,255.00,255.00,128.00);
				Next()
				{
					LifeTime(0.50)
					Reach(255.00,255.00,255.00,0.00);
				}
			}
		}
	}
	Geometry()
	{
		Texture("whitesmoke");
		BlendMode("NORMAL");
		Type("PARTICLE");
	}
}
