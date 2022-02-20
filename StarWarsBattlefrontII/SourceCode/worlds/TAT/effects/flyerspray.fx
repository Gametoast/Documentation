
ParticleEmitter("FlyerSpray")
{
	MaxParticles(240);
	StartDelay(0);
	BurstDelay(0.03, 0.06);
	BurstCount(10);

	Spawner()
	{
		Spread()
		{
			PositionX(-1, 1);
			PositionY(-0.03, 0.1);
			PositionZ(-1, 1);
		}

		Offset();
		{
			PositionX(0);
			PositionY(0);
			PositionZ(0);
		}
		PositionScale(1.0);
		VelocityScale(6.0);
		Size(0,  4.0, 5.0);
		Red(0, 255.00, 255.00);
		Green(0, 230.00, 230.00);
		Blue(0, 200.00, 200.00);
		Alpha(0, 10.00, 10.00);
		StartRotation(0,   0, 360);
		RotationVelocity(0,   -100, 100);
	}

	Transformer()
	{
		LifeTime(3);
		Position()
		{
			LifeTime(2);
			Scale(0.1);
		}

		Size(0)
		{
			LifeTime(3.0);
			Scale(4.0);
		}

		Color(0)
		{
			LifeTime(3.0);
			Reach(90,90,90,0);
		}
	}

	Geometry()
	{
		Texture("whitesmoke");
	}

}
