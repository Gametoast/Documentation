ParticleEmitter("FlyerSpray")
{
	MaxParticles(100.00,100.00);
	StartDelay(0.00,0.00);
	BurstDelay(0.03, 0.06);
	BurstCount(10.00,10.00);
	Size(1.00, 1.00);
	Hue(255.00, 255.00);
	Saturation(255.00, 255.00);
	Value(255.00, 255.00);
	Alpha(255.00, 255.00);
	Spawner()
	{
		Rotator()
		{
			StartX(-1.00,1.00);
			StartMoveX(-0.03,0.10);
			MoveX(-1.00,1.00);
			StartY(0.00,1.00);
			StartMoveY(0.07,0.07);
			MoveY(0.00,0.00);
			StartZ(0.00,1.00);
			StartMoveZ(0.09,0.09);
			MoveZ(1.20,1.20);
		}
		Offset()
		{
			PositionX(0.00,0.00);
			PositionY(0.00,0.00);
			PositionZ(0.00,0.00);
		}
		PositionScale(1.00,1.00);
		VelocityScale(6.00,6.00);
		Size(0, 0.70, 1.00);
		Hue(0, 150.00, 150.00);
		Saturation(0, 32.00, 64.00);
		Value(0, 255.00, 255.00);
		Alpha(0, 50.00, 100.00);
		StartRotation(0, 0.00, 360.00);
		RotationVelocity(0, -100.00, 100.00);
		FadeInTime(0.00);
	}
	Transformer()
	{
		LifeTime(3.00);
		Position()
		{
			LifeTime(2.00)
			Scale(0.00);
		}
		Size(0)
		{
			LifeTime(3.00)
			Scale(4.00);
		}
		Color(0)
		{
			LifeTime(3.00)
			Reach(150.00,0.00,255.00,0.00);
		}
	}
	Geometry()
	{
		Texture("whitesmoke");
		BlendMode("NORMAL");
		Type("PARTICLE");
	}
	ParticleEmitter("SnowChunks")
	{
		MaxParticles(50.00,50.00);
		StartDelay(0.00,0.00);
		BurstDelay(0.02, 0.04);
		BurstCount(1.00,1.00);
		Size(1.00, 1.00);
		Hue(255.00, 255.00);
		Saturation(255.00, 255.00);
		Value(255.00, 255.00);
		Alpha(255.00, 255.00);
		Spawner()
		{
			Spread()
			{
				PositionX(-1.00,1.00);
				PositionY(0.00,0.10);
				PositionZ(-1.00,1.00);
			}
			Offset()
			{
				PositionX(0.00,0.00);
				PositionY(0.00,0.00);
				PositionZ(0.00,0.00);
			}
			PositionScale(1.00,1.00);
			VelocityScale(9.00,9.00);
			Size(0, 0.20, 0.50);
			Hue(0, 150.00, 150.00);
			Saturation(0, 32.00, 64.00);
			Value(0, 255.00, 255.00);
			Alpha(0, 30.00, 50.00);
			StartRotation(0, 0.00, 360.00);
			RotationVelocity(0, -100.00, 100.00);
			FadeInTime(0.00);
		}
		Transformer()
		{
			LifeTime(2.00);
			Position()
			{
				LifeTime(2.00)
				Accelerate(0.00, -10.00, 0.00);
			}
			Size(0)
			{
				LifeTime(2.00)
				Scale(2.00);
			}
			Color(0)
			{
				LifeTime(2.00)
				Reach(150.00,0.00,255.00,255.00);
			}
		}
		Geometry()
		{
			Texture("dirtspray");
			BlendMode("NORMAL");
			Type("PARTICLE");
		}
	}
}
