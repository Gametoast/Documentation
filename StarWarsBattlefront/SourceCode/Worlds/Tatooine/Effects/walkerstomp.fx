
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
		Size(0,  0.1, 0.3);
		Red(0, 195.00, 195.00);
		Green(0, 164.00, 164.00);
		Blue(0, 99.00, 99.00);
		Alpha(0, 250.00, 250.00);
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
			Reach(195,164,99,0);
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
			Red(0, 195.00, 195.00);
			Green(0, 164.00, 164.00);
			Blue(0, 99.00, 99.00);
			Alpha(0, 40.00, 40.00);
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
				Reach(195,164,99,0);
			}
		}
	
		Geometry()
		{
			Texture("whitesmoke");
		}
	}
}