ParticleEmitter("Foam")
{
	MaxParticles(-1.0000,-1.0000);
	StartDelay(0.0000,0.0000);
	BurstDelay(0.1000, 0.1000);
	BurstCount(2.0000,2.0000);
	MaxLodDist(1000.0000);
	MinLodDist(800.0000);
	BoundingRadius(25.0);
	SoundName("mus_amb_lava_distant")
	Size(1.0000, 1.0000);
	Hue(255.0000, 255.0000);
	Saturation(255.0000, 255.0000);
	Value(255.0000, 255.0000);
	Alpha(255.0000, 255.0000);
	Spawner()
	{
		Circle()
		{
			PositionX(-1.0000,1.0000);
			PositionY(0.0000,0.0000);
			PositionZ(-1.0000,1.0000);
		}
		Offset()
		{
			PositionX(0.0000,0.0000);
			PositionY(0.0000,0.0000);
			PositionZ(0.0000,0.0000);
		}
		PositionScale(0.0000,0.0000);
		VelocityScale(0.1000,0.3500);
		InheritVelocityFactor(0.0000,0.0000);
		Size(0, 1.0000, 1.9000);
		Red(0, 128.0000, 255.0000);
		Green(0, 0.0000, 128.0000);
		Blue(0, 0.0000, 64.0000);
		Alpha(0, 0.0000, 0.0000);
		StartRotation(0, 4.0000, 4.9000);
		RotationVelocity(0, 0.0000, 0.0000);
		FadeInTime(0.0000);
	}
	Transformer()
	{
		LifeTime(2.0000);
		Position()
		{
			LifeTime(0.2000)
		}
		Size(0)
		{
			LifeTime(2.0000)
			Scale(3.0000);
		}
		Color(0)
		{
			LifeTime(0.2500)
			Move(0.0000,0.0000,0.0000,128.0000);
			Next()
			{
				LifeTime(1.7500)
				Move(0.0000,0.0000,0.0000,-128.0000);
			}
		}
	}
	Geometry()
	{
		BlendMode("ADDITIVE");
		Type("BILLBOARD");
		Texture("com_sfx_waterfoam1");
	}
	ParticleEmitter("WaterFountain")
	{
		MaxParticles(-1.0000,-1.0000);
		StartDelay(0.0000,0.0000);
		BurstDelay(0.0750, 0.0750);
		BurstCount(1.0000,1.0000);
		MaxLodDist(50.0000);
		MinLodDist(10.0000);
		BoundingRadius(5.0);
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
				PositionX(-0.2500,0.2500);
				PositionY(2.0000,4.0000);
				PositionZ(-0.2500,0.2500);
			}
			Offset()
			{
				PositionX(-0.2500,0.2500);
				PositionY(0.0000,0.1000);
				PositionZ(-0.2500,0.2500);
			}
			PositionScale(0.0000,0.0000);
			VelocityScale(3.2500,3.2500);
			InheritVelocityFactor(0.0000,0.0000);
			Size(0, 2.0000, 3.0000);
			Red(0, 230.0000, 235.0000);
			Green(0, 119.0000, 165.0000);
			Blue(0, 61.0000, 61.0000);
			Alpha(0, 255.0000, 255.0000);
			StartRotation(0, 0.0000, 360.0000);
			RotationVelocity(0, -10.0000, 10.0000);
			FadeInTime(0.0000);
		}
		Transformer()
		{
			LifeTime(1.7500);
			Position()
			{
				LifeTime(3.0000)
				Accelerate(0.0000, -45.0000, 0.0000);
			}
			Size(0)
			{
				LifeTime(3.0000)
				Scale(5.0000);
			}
			Color(0)
			{
				LifeTime(1.7500)
				Move(20.0000,0.0000,0.0000,0.0000);
			}
		}
		Geometry()
		{
			BlendMode("ADDITIVE");
			Type("PARTICLE");
			Texture("com_sfx_dirt2");
		}
	}
}
