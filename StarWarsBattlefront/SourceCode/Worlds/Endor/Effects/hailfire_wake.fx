
ParticleEmitter("Hailfire_Wake")
{
	MaxParticles(999999999);
	StartDelay(0);
	BurstDelay(0.03, 0.05);
	BurstCount(3);

	Spawner()
	{
		Spread()
		{
			PositionX(-1, 1);
			PositionY(0.0, 0.8);
			PositionZ(-0.2, 0.0);
		}

		Offset();
		{
			PositionX(0);
			PositionY(0);
			PositionZ(0);
		}
			PositionScale(0.5);
		VelocityScale(4.0);
		Size(0,  0.8, 1.0);
		Hue(0,  14, 18);
		Saturation(0,  160, 200);
		Value(0,  90, 130);
		Alpha(0,  160, 160);
		StartRotation(0,   0, 360);
		RotationVelocity(0,   -100, 100);
	}

	Transformer()
	{
		LifeTime(2.0);
		Position()
		{
			LifeTime(1.5);
			Scale(0.08);
		}

		Size(0)
		{
			LifeTime(2.0);
			Scale(2.0);
		}

		Color(0)
		{
			LifeTime(2.0);
			Reach(16,180,110,0);
		}
	}

	Geometry()
	{
		Texture("whitesmoke");
		BlendMode("NORMAL");
	}
}