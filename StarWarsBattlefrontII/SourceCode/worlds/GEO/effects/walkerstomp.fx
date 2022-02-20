ParticleEmitter("WalkerStomp")
{
	MaxParticles(20.0000,20.0000);
	StartDelay(0.0000,0.0000);
	BurstDelay(0.0000, 0.0000);
	BurstCount(3.0000,3.0000);
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
			PositionX(-0.5000,0.5000);
			PositionY(0.0000,0.5000);
			PositionZ(-0.5000,0.5000);
		}
		Offset()
		{
			PositionX(0.0000,0.0000);
			PositionY(0.0000,0.0000);
			PositionZ(0.0000,0.0000);
		}
		PositionScale(0.5000,0.5000);
		VelocityScale(1.0000,6.0000);
		InheritVelocityFactor(0.0000,0.0000);
		Size(0, 0.0100, 0.0300);
		Hue(0, 16.0000, 16.0000);
		Saturation(0, 192.0000, 192.0000);
		Value(0, 90.0000, 90.0000);
		Alpha(0, 100.0000, 200.0000);
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
			Reach(16.0000,128.0000,90.0000,255.0000);
		}
	}
	Geometry()
	{
		BlendMode("NORMAL");
		Type("PARTICLE");
		Texture("com_sfx_dirt1");
	}
	ParticleEmitter("Smoke")
	{
		MaxParticles(30.0000,30.0000);
		StartDelay(0.0000,0.0000);
		BurstDelay(0.0000, 0.0000);
		BurstCount(30.0000,30.0000);
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
			Size(0, 0.5000, 0.6000);
			Hue(0, 16.0000, 16.0000);
			Saturation(0, 160.0000, 160.0000);
			Value(0, 140.0000, 140.0000);
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
				Reach(16.0000,192.0000,140.0000,0.0000);
			}
		}
		Geometry()
		{
			BlendMode("NORMAL");
			Type("PARTICLE");
			Texture("com_sfx_dirt2");
		}
	}
}
