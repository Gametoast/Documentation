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
		Spread()
		{
			PositionX(-1.00,1.00);
			PositionY(0.03,0.03);
			PositionZ(-1.00,1.00);
		}
		Offset()
		{
			PositionX(0.00,0.00);
			PositionY(0.00,0.00);
			PositionZ(0.00,0.00);
		}
		PositionScale(1.00,1.00);
		VelocityScale(6.00,6.00);
		Size(0, 1.00, 1.50);
		Hue(0, 16.00, 16.00);
		Saturation(0, 192.00, 192.00);
		Value(0, 128.00, 128.00);
		Alpha(0, 50.00, 80.00);
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
			Reach(16.00,128.00,128.00,0.00);
		}
	}
	Geometry()
	{
		Texture("whitesmoke");
		BlendMode("NORMAL");
		Type("PARTICLE");
	}
}