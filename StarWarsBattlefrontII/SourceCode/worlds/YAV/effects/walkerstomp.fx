
ParticleEmitter("WalkerStomp")
{
	MaxParticles(10);
	StartDelay(0);
	BurstDelay(0.0, 0.0);
	BurstCount(1);

	Spawner()
	{
		Spread()
		{
			PositionX(-0.3, -.3);
			PositionY(0.0, 0.8);
			PositionZ(-0.2, 1);
		}

		Offset();
		{
			PositionX(0);
			PositionY(0);
			PositionZ(0);
		}
		PositionScale(1.0);
		VelocityScale(6.0);
		Size(0,  0.5, 0.6);
		Hue(0,  20, 20);
		Saturation(0,  73, 73);
		Value(0,  56, 56);
		Alpha(0,  255, 255);
		StartRotation(0,   0, 360);
		RotationVelocity(0,   -100, 100);
	}

	Transformer()
	{
		LifeTime(1);
		Position()
		{
			LifeTime(1);
			Accelerate(0, -10, 0);
		}

		Size(0)
		{
			LifeTime(1);
			Scale(2.0);
		}

		Color(0)
		{
			LifeTime(1);
			Reach(20,73,56,255);
		}
	}

	Geometry()
	{
		Texture("dirtspray");
	}
	
	
	ParticleEmitter("Smoke")
	{
		MaxParticles(40);
		StartDelay(0);
		BurstDelay(0.0, 0.0);
		BurstCount(10);
	
		Spawner()
		{
			Spread()
			{
				PositionX(-1, 1);
				PositionY(0.0, 0.5);
				PositionZ(-0.4, 1);
			}
	
			Offset();
			{
				PositionX(0);
				PositionY(0);
				PositionZ(0);
			}
			PositionScale(0.5);
			VelocityScale(4.0);
			Size(0,  0.5, 1.0);
			Hue(0,  56, 56);
			Saturation(0,  45, 45);
			Value(0,  53, 53);
			Alpha(0,  90, 90);
			StartRotation(0,   0, 360);
			RotationVelocity(0,   -100, 100);
		}
	
		Transformer()
		{
			LifeTime(1);
			Position()
			{
				LifeTime(1);
				Scale(0.1);
			}
	
			Size(0)
			{
				LifeTime(1);
				Scale(3.0);
			}
	
			Color(0)
			{
				LifeTime(1);
				Reach(56,45,53,0);
			}
		}
	
		Geometry()
		{
			Texture("whitesmoke");
		}
	}
}