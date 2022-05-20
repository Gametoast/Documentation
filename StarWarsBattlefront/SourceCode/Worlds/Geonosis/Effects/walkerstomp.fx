ParticleEmitter("WalkerStomp")
{
	MaxParticles(20.00,20.00);
	StartDelay(0.00,0.00);
	BurstDelay(0.00, 0.00);
	BurstCount(3.00,3.00);
	Size(1.00, 1.00);
	Hue(255.00, 255.00);
	Saturation(255.00, 255.00);
	Value(255.00, 255.00);
	Alpha(255.00, 255.00);
	Spawner()
	{
		Circle()
		{
			PositionX(-1.00,1.00);
			PositionY(0.00,2.00);
			PositionZ(-0.20,1.00);
		}
		Offset()
		{
			PositionX(0.00,0.00);
			PositionY(0.00,0.00);
			PositionZ(0.00,0.00);
		}
		PositionScale(1.00,1.00);
		VelocityScale(2.00,2.00);
		Size(0, 0.10, 0.30);
		Hue(0, 16.00, 16.00);
		Saturation(0, 192.00, 192.00);
		Value(0, 90.00, 90.00);
		Alpha(0, 100.00, 200.00);
		StartRotation(0, 0.00, 360.00);
		RotationVelocity(0, -100.00, 100.00);
		FadeInTime(0.00);
	}
	Transformer()
	{
		LifeTime(1.00);
		Position()
		{
			LifeTime(1.00)
			Accelerate(0.00, -10.00, 0.00);
		}
		Size(0)
		{
			LifeTime(1.00)
			Scale(2.00);
		}
		Color(0)
		{
			LifeTime(1.00)
			Reach(16.00,128.00,90.00,255.00);
		}
	}
	Geometry()
	{
		Texture("dirtspray");
		BlendMode("NORMAL");
		Type("PARTICLE");
	}
	ParticleEmitter("Smoke")
	{
		MaxParticles(50.00,50.00);
		StartDelay(0.00,0.00);
		BurstDelay(0.00, 0.00);
		BurstCount(50.00,50.00);
		Size(1.00, 1.00);
		Hue(255.00, 255.00);
		Saturation(255.00, 255.00);
		Value(255.00, 255.00);
		Alpha(255.00, 255.00);
		Spawner()
		{
			Circle()
			{
				PositionX(-1.00,1.00);
				PositionY(0.00,0.20);
				PositionZ(-0.40,1.00);
			}
			Offset()
			{
				PositionX(0.00,0.00);
				PositionY(0.00,0.00);
				PositionZ(0.00,0.00);
			}
			PositionScale(0.50,0.50);
			VelocityScale(2.00,2.00);
			Size(0, 0.30, 0.40);
			Hue(0, 16.00, 16.00);
			Saturation(0, 160.00, 160.00);
			Value(0, 140.00, 140.00);
			Alpha(0, 50.00, 80.00);
			StartRotation(0, 0.00, 360.00);
			RotationVelocity(0, -100.00, 100.00);
			FadeInTime(0.00);
		}
		Transformer()
		{
			LifeTime(1.00);
			Position()
			{
				LifeTime(1.00)
				Scale(0.00);
			}
			Size(0)
			{
				LifeTime(1.00)
				Scale(3.00);
			}
			Color(0)
			{
				LifeTime(1.00)
				Reach(16.00,192.00,140.00,0.00);
			}
		}
		Geometry()
		{
			Texture("whitesmoke");
			BlendMode("NORMAL");
			Type("PARTICLE");
		}
	}
}
