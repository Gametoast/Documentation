
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
		Hue(0,  16, 16);
		Saturation(0,  192, 192);
		Value(0,  128, 128);
		Alpha(0,  224, 224);
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
			Reach(16,128,128,0);
		}
	}

	Geometry()
	{
		Texture("whitesmoke");
	}

}
