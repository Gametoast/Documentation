ParticleEmitter("WalkerStomp")
{
	MaxParticles(5.0000,5.0000);
	StartDelay(0.0000,0.0000);
	BurstDelay(0.0000, 0.0000);
	BurstCount(1.0000,1.0000);
	MaxLodDist(50.0000);
	MinLodDist(10.0000);
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
			PositionX(-0.5000,0.5000);
			PositionY(0.5000,1.0000);
			PositionZ(-0.5000,0.5000);
		}
		Offset()
		{
			PositionX(0.0000,0.0000);
			PositionY(0.0000,0.0000);
			PositionZ(0.0000,0.0000);
		}
		PositionScale(1.0000,1.0000);
		VelocityScale(4.0000,6.0000);
		InheritVelocityFactor(0.0000,0.0000);
		Size(0, 0.3000, 0.7000);
		Red(0, 0.0000, 128.0000);
		Green(0, 64.0000, 100.0000);
		Blue(0, 0.0000, 0.0000);
		Alpha(0, 128.0000, 128.0000);
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
			Accelerate(0.0000, -10.0000, 0.0000);
		}
		Size(0)
		{
			LifeTime(1.0000)
			Scale(3.0000);
		}
		Color(0)
		{
			LifeTime(1.0000)
			Reach(100.0000,100.0000,100.0000,0.0000);
		}
	}
	Geometry()
	{
		BlendMode("NORMAL");
		Type("PARTICLE");
		Texture("dirt");
	}
	ParticleEmitter("Smoke")
	{
		MaxParticles(10.0000,10.0000);
		StartDelay(0.0000,0.0000);
		BurstDelay(0.0000, 0.0000);
		BurstCount(5.0000,5.0000);
		MaxLodDist(50.0000);
		MinLodDist(10.0000);
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
				PositionY(0.0000,0.2000);
				PositionZ(-1.0000,1.0000);
			}
			Offset()
			{
				PositionX(0.0000,0.0000);
				PositionY(0.2000,0.2000);
				PositionZ(0.0000,0.0000);
			}
			PositionScale(1.0000,1.0000);
			VelocityScale(4.0000,4.0000);
			InheritVelocityFactor(0.0000,0.0000);
			Size(0, 0.5000, 1.0000);
			Red(0, 128.0000, 128.0000);
			Green(0, 99.0000, 120.0000);
			Blue(0, 0.0000, 0.0000);
			Alpha(0, 30.0000, 40.0000);
			StartRotation(0, 0.0000, 360.0000);
			RotationVelocity(0, -100.0000, 100.0000);
			FadeInTime(0.0000);
		}
		Transformer()
		{
			LifeTime(1.5000);
			Position()
			{
				LifeTime(2.0000)
				Accelerate(0.0000, -2.0000, 0.0000);
			}
			Size(0)
			{
				LifeTime(1.5000)
				Scale(3.0000);
			}
			Color(0)
			{
				LifeTime(1.5000)
				Reach(100.0000,100.0000,100.0000,0.0000);
			}
		}
		Geometry()
		{
			BlendMode("NORMAL");
			Type("PARTICLE");
			Texture("thicksmoke2");
		}
	}
}
