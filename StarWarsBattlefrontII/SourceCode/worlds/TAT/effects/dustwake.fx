ParticleEmitter("Smoke")
{
	MaxParticles(-1.0000,-1.0000);
	StartDelay(0.0000,0.0000);
	BurstDelay(0.0200, 0.0200);
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
			PositionY(0.5000,1.0000);
			PositionZ(-1.0000,1.0000);
		}
		Offset()
		{
			PositionX(-0.2500,0.2500);
			PositionY(0.0000,0.0000);
			PositionZ(-0.2500,0.2500);
		}
		PositionScale(0.0000,0.0000);
		VelocityScale(0.1000,0.6000);
		InheritVelocityFactor(0.2500,0.2500);
		Size(0, 0.1000, 0.2000);
		Red(0, 206.0000, 206.0000);
		Green(0, 166.0000, 166.0000);
		Blue(0, 117.0000, 117.0000);
		Alpha(0, 0.0000, 0.0000);
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
		}
		Size(0)
		{
			LifeTime(1.0000)
			Scale(5.0000);
		}
		Color(0)
		{
			LifeTime(0.2500)
			Reach(206.0000,166.0000,117.0000,32.0000);
			Next()
			{
				LifeTime(0.7500)
				Reach(206.0000,166.0000,117.0000,0.0000);
			}
		}
	}
	Geometry()
	{
		BlendMode("NORMAL");
		Type("PARTICLE");
		Texture("whitesmoke");
	}
}
