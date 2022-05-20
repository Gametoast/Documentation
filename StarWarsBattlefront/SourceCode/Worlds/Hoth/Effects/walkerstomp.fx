ParticleEmitter("WalkerStomp")
{
	MaxParticles(10.0000,10.0000);
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
			PositionX(-1.0000,1.0000);
			PositionY(0.0000,0.8000);
			PositionZ(-0.2000,1.0000);
		}
		Offset()
		{
			PositionX(0.0000,0.0000);
			PositionY(0.0000,0.0000);
			PositionZ(0.0000,0.0000);
		}
		PositionScale(1.0000,1.0000);
		VelocityScale(4.0000,4.0000);
		InheritVelocityFactor(0.0000,0.0000);
		Size(0, 0.2000, 0.3000);
		Red(0, 185.0000, 185.0000);
		Green(0, 192.0000, 192.0000);
		Blue(0, 194.0000, 194.0000);
		Alpha(0, 255.0000, 255.0000);
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
			Scale(2.0000);
		}
		Color(0)
		{
			LifeTime(1.0000)
			Reach(255.0000,255.0000,255.0000,0.0000);
		}
	}
	Geometry()
	{
		BlendMode("NORMAL");
		Type("PARTICLE");
		Texture("dirtspray");
	}
	ParticleEmitter("Smoke")
	{
		MaxParticles(40.0000,40.0000);
		StartDelay(0.0000,0.0000);
		BurstDelay(0.0000, 0.0000);
		BurstCount(20.0000,20.0000);
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
			Circle()
			{
				PositionX(-1.0000,1.0000);
				PositionY(0.0000,0.2000);
				PositionZ(-0.4000,1.0000);
			}
			Offset()
			{
				PositionX(0.0000,0.0000);
				PositionY(0.0000,0.0000);
				PositionZ(0.0000,0.0000);
			}
			PositionScale(0.5000,0.5000);
			VelocityScale(2.0000,2.0000);
			InheritVelocityFactor(0.0000,0.0000);
			Size(0, 0.5000, 1.0000);
			Red(0, 185.0000, 185.0000);
			Green(0, 192.0000, 192.0000);
			Blue(0, 194.0000, 194.0000);
			Alpha(0, 50.0000, 100.0000);
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
				Scale(0.0000);
			}
			Size(0)
			{
				LifeTime(1.0000)
				Scale(3.0000);
			}
			Color(0)
			{
				LifeTime(1.0000)
				Reach(255.0000,255.0000,255.0000,0.0000);
			}
		}
		Geometry()
		{
			BlendMode("NORMAL");
			Type("PARTICLE");
			Texture("whitesmoke");
		}
	}
}
