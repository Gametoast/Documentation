ParticleEmitter("Smoke")
{
	MaxParticles(3.0000,3.0000);
	StartDelay(0.0000,0.0000);
	BurstDelay(0.0500, 0.0500);
	BurstCount(3.0000,3.0000);
	MaxLodDist(50.0000);
	MinLodDist(10.0000);
	BoundingRadius(30.0);
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
			PositionX(-0.5000,0.5000);
			PositionY(0.5000,1.0000);
			PositionZ(-0.5000,0.5000);
		}
		Offset()
		{
			PositionX(0.0000,0.0000);
			PositionY(0.0000,0.0000);
			PositionZ(0.0000,0.0000);
		}
		PositionScale(0.2000,0.2000);
		VelocityScale(0.5000,0.5000);
		InheritVelocityFactor(0.0000,0.0000);
		Size(0, 0.2000, 0.4500);
		Red(0, 255.0000, 255.0000);
		Green(0, 255.0000, 255.0000);
		Blue(0, 255.0000, 255.0000);
		Alpha(0, 0.0000, 0.0000);
		StartRotation(0, -90.0000, 0.0000);
		RotationVelocity(0, -100.0000, 100.0000);
		FadeInTime(0.0000);
	}
	Transformer()
	{
		LifeTime(0.5000);
		Position()
		{
			LifeTime(2.0000)
			Scale(0.0000);
		}
		Size(0)
		{
			LifeTime(0.5000)
			Scale(3.0000);
		}
		Color(0)
		{
			LifeTime(0.0500)
			Reach(185.0000,158.0000,139.0000,255.0000);
			Next()
			{
				LifeTime(0.4500)
				Reach(185.0000,158.0000,139.0000,0.0000);
			}
		}
	}
	Geometry()
	{
		BlendMode("NORMAL");
		Type("PARTICLE");
		Texture("thicksmoke3");
	}
	ParticleEmitter("Fire")
	{
		MaxParticles(8.0000,8.0000);
		StartDelay(0.0000,0.0000);
		BurstDelay(0.0500, 0.0500);
		BurstCount(8.0000,8.0000);
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
				PositionX(-0.5000,0.5000);
				PositionY(0.5000,1.0000);
				PositionZ(-0.5000,0.5000);
			}
			Offset()
			{
				PositionX(0.0000,0.0000);
				PositionY(0.0000,0.0000);
				PositionZ(0.0000,0.0000);
			}
			PositionScale(0.0000,0.0000);
			VelocityScale(1.0000,2.0000);
			InheritVelocityFactor(0.0000,0.0000);
			Size(0, 0.0500, 0.1000);
			Red(0, 185.0000, 185.0000);
			Green(0, 158.0000, 158.0000);
			Blue(0, 139.0000, 139.0000);
			Alpha(0, 0.0000, 0.0000);
			StartRotation(0, 0.0000, 360.0000);
			RotationVelocity(0, -100.0000, 100.0000);
			FadeInTime(0.0000);
		}
		Transformer()
		{
			LifeTime(0.2500);
			Position()
			{
				LifeTime(0.5000)
				Scale(0.0000);
			}
			Size(0)
			{
				LifeTime(0.2500)
				Scale(5.0000);
			}
			Color(0)
			{
				LifeTime(0.0500)
				Reach(185.0000,158.0000,139.0000,255.0000);
				Next()
				{
					LifeTime(0.2000)
					Reach(185.0000,158.0000,139.0000,0.0000);
				}
			}
		}
		Geometry()
		{
			BlendMode("ADDITIVE");
			Type("PARTICLE");
			Texture("boom4");
		}
	}
}
