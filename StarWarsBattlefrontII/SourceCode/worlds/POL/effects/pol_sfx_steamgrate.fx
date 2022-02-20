ParticleEmitter("Steam")
{
	MaxParticles(-1.0000,-1.0000);
	StartDelay(0.0000,0.0000);
	BurstDelay(0.1000, 0.1000);
	BurstCount(1.0000,1.0000);
	MaxLodDist(50.0000);
	MinLodDist(10.0000);
	BoundingRadius(2.0);
	SoundName("com_amb_steam_slow")
	Size(1.0000, 1.0000);
	Hue(255.0000, 255.0000);
	Saturation(255.0000, 255.0000);
	Value(255.0000, 255.0000);
	Alpha(255.0000, 255.0000);
	Spawner()
	{
		Spread()
		{
			PositionX(0.0000,0.0000);
			PositionY(2.0000,2.0000);
			PositionZ(0.0000,0.0000);
		}
		Offset()
		{
			PositionX(-1.5000,1.5000);
			PositionY(0.0000,0.0000);
			PositionZ(-1.5000,1.5000);
		}
		PositionScale(0.0000,0.0000);
		VelocityScale(3.0000,3.7000);
		InheritVelocityFactor(0.0000,0.0000);
		Size(0, 2.5000, 3.0000);
		Hue(0, 150.0000, 180.0000);
		Saturation(0, 50.0000, 100.0000);
		Value(0, 60.0000, 255.0000);
		Alpha(0, 0.0000, 0.0000);
		StartRotation(0, 0.0000, 360.0000);
		RotationVelocity(0, -40.0000, 40.0000);
		FadeInTime(0.0000);
	}
	Transformer()
	{
		LifeTime(4.0000);
		Position()
		{
			LifeTime(4.0000)
			Scale(0.0000);
		}
		Size(0)
		{
			LifeTime(4.0000)
			Scale(5.0000);
		}
		Color(0)
		{
			LifeTime(0.0500)
			Move(0.0000,0.0000,0.0000,32.0000);
			Next()
			{
				LifeTime(3.9500)
				Move(0.0000,0.0000,0.0000,-96.0000);
			}
		}
	}
	Geometry()
	{
		BlendMode("ADDITIVE");
		Type("PARTICLE");
		Texture("com_sfx_waterfoam1");
	}
	ParticleEmitter("Steam")
	{
		MaxParticles(-1.0000,-1.0000);
		StartDelay(0.0000,0.0000);
		BurstDelay(0.0500, 0.0500);
		BurstCount(1.0000,1.0000);
		MaxLodDist(50.0000);
		MinLodDist(10.0000);
		BoundingRadius(2.0);
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
				PositionX(0.0000,0.0000);
				PositionY(1.0000,2.0000);
				PositionZ(0.0000,0.0000);
			}
			Offset()
			{
				PositionX(-2.0000,2.0000);
				PositionY(0.0000,0.0000);
				PositionZ(-2.0000,2.0000);
			}
			PositionScale(0.0000,0.0000);
			VelocityScale(0.5000,1.0000);
			InheritVelocityFactor(0.0000,0.0000);
			Size(0, 2.0000, 2.5000);
			Hue(0, 150.0000, 180.0000);
			Saturation(0, 50.0000, 100.0000);
			Value(0, 50.0000, 255.0000);
			Alpha(0, 0.0000, 0.0000);
			StartRotation(0, 0.0000, 360.0000);
			RotationVelocity(0, -40.0000, 40.0000);
			FadeInTime(0.0000);
		}
		Transformer()
		{
			LifeTime(2.0000);
			Position()
			{
				LifeTime(4.0000)
				Scale(0.0000);
			}
			Size(0)
			{
				LifeTime(4.0000)
				Scale(5.0000);
			}
			Color(0)
			{
				LifeTime(0.0500)
				Move(0.0000,0.0000,0.0000,18.0000);
				Next()
				{
					LifeTime(1.9500)
					Move(0.0000,0.0000,0.0000,-18.0000);
				}
			}
		}
		Geometry()
		{
			BlendMode("ADDITIVE");
			Type("PARTICLE");
			Texture("com_sfx_smoke3");
		}
	}
}
