ParticleEmitter("FlyerSpray")
{
	MaxParticles(100.0000,100.0000);
	StartDelay(0.0000,0.0000);
	BurstDelay(0.0300, 0.0600);
	BurstCount(10.0000,10.0000);
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
		Rotator()
		{
			StartX(-1.0000,1.0000);
			StartMoveX(0.0330,0.0330);
			MoveX(-1.0000,1.0000);
			StartY(0.0000,1.0000);
			StartMoveY(0.0730,0.0730);
			MoveY(0.0000,0.0000);
			StartZ(0.0000,1.0000);
			StartMoveZ(0.0930,0.0930);
			MoveZ(1.2000,1.2000);
		}
		Offset()
		{
			PositionX(0.0000,0.0000);
			PositionY(0.0000,0.0000);
			PositionZ(0.0000,0.0000);
		}
		PositionScale(1.0000,1.0000);
		VelocityScale(6.0000,6.0000);
		InheritVelocityFactor(0.0000,0.0000);
		Size(0, 0.7000, 1.0000);
		Red(0, 185.0000, 185.0000);
		Green(0, 192.0000, 192.0000);
		Blue(0, 194.0000, 194.0000);
		Alpha(0, 50.0000, 100.0000);
		StartRotation(0, 0.0000, 360.0000);
		RotationVelocity(0, -100.0000, 100.0000);
		FadeInTime(0.0000);
	}
	Transformer()
	{
		LifeTime(3.0000);
		Position()
		{
			LifeTime(2.0000)
			Scale(0.0000);
		}
		Size(0)
		{
			LifeTime(3.0000)
			Scale(4.0000);
		}
		Color(0)
		{
			LifeTime(3.0000)
			Reach(255.0000,255.0000,255.0000,0.0000);
		}
	}
	Geometry()
	{
		BlendMode("NORMAL");
		Type("PARTICLE");
		Texture("whitesmoke");
	}
	ParticleEmitter("SnowChunks")
	{
		MaxParticles(50.0000,50.0000);
		StartDelay(0.0000,0.0000);
		BurstDelay(0.0200, 0.0400);
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
				PositionY(0.0000,0.1000);
				PositionZ(-1.0000,1.0000);
			}
			Offset()
			{
				PositionX(0.0000,0.0000);
				PositionY(0.0000,0.0000);
				PositionZ(0.0000,0.0000);
			}
			PositionScale(1.0000,1.0000);
			VelocityScale(9.0000,9.0000);
			InheritVelocityFactor(0.0000,0.0000);
			Size(0, 0.2000, 0.5000);
			Red(0, 185.0000, 185.0000);
			Green(0, 192.0000, 192.0000);
			Blue(0, 194.0000, 194.0000);
			Alpha(0, 30.0000, 50.0000);
			StartRotation(0, 0.0000, 360.0000);
			RotationVelocity(0, -100.0000, 100.0000);
			FadeInTime(0.0000);
		}
		Transformer()
		{
			LifeTime(2.0000);
			Position()
			{
				LifeTime(2.0000)
				Accelerate(0.0000, -10.0000, 0.0000);
			}
			Size(0)
			{
				LifeTime(2.0000)
				Scale(2.0000);
			}
			Color(0)
			{
				LifeTime(2.0000)
				Reach(255.0000,255.0000,255.0000,255.0000);
			}
		}
		Geometry()
		{
			BlendMode("NORMAL");
			Type("PARTICLE");
			Texture("dirtspray");
		}
	}
}
