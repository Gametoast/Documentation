ParticleEmitter("Dust")
{
	MaxParticles(-1.0000,-1.0000);
	StartDelay(0.0000,0.0000);
	BurstDelay(1.0000, 1.0000);
	BurstCount(2.0000,2.0000);
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
		Circle()
		{
			PositionX(-1.0000,1.0000);
			PositionY(-0.2500,0.2500);
			PositionZ(-1.0000,1.0000);
		}
		Offset()
		{
			PositionX(-20.0000,20.0000);
			PositionY(0.0000,0.0000);
			PositionZ(-20.0000,20.0000);
		}
		PositionScale(0.0000,0.0000);
		VelocityScale(0.0000,0.0000);
		InheritVelocityFactor(0.2500,0.2500);
		Size(0, 5.0000, 9.0000);
		Hue(0, 0.0000, 0.0000);
		Saturation(0, 0.0000, 0.0000);
		Value(0, 200.0000, 255.0000);
		Alpha(0, 0.0000, 0.0000);
		StartRotation(0, 0.0000, 0.0000);
		RotationVelocity(0, 0.0000, 0.0000);
		FadeInTime(0.0000);
	}
	Transformer()
	{
		LifeTime(10.0000);
		Position()
		{
			LifeTime(10.0000)
			Accelerate(0.0000, -0.5000, 0.0000);
		}
		Size(0)
		{
			LifeTime(10.0000)
			Scale(2.0000);
		}
		Color(0)
		{
			LifeTime(5.0000)
			Move(0.0000,0.0000,0.0000,16.0000);
			Next()
			{
				LifeTime(5.0000)
				Move(0.0000,0.0000,0.0000,-16.0000);
			}
		}
	}
	Geometry()
	{
		BlendMode("ADDITIVE");
		Type("PARTICLE");
		Texture("com_sfx_dirt2");
	}
	ParticleEmitter("Rays")
	{
		MaxParticles(-1.0000,-1.0000);
		StartDelay(0.0000,0.0000);
		BurstDelay(1.0000, 1.0000);
		BurstCount(4.0000,4.0000);
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
			Circle()
			{
				PositionX(-1.0000,1.0000);
				PositionY(-0.2500,0.2500);
				PositionZ(-1.0000,1.0000);
			}
			Offset()
			{
				PositionX(-20.0000,20.0000);
				PositionY(0.0000,0.0000);
				PositionZ(-20.0000,20.0000);
			}
			PositionScale(0.0000,0.0000);
			VelocityScale(0.0000,0.0000);
			InheritVelocityFactor(0.2500,0.2500);
			Size(0, 8.0000, 12.0000);
			Hue(0, 0.0000, 0.0000);
			Saturation(0, 0.0000, 0.0000);
			Value(0, 200.0000, 255.0000);
			Alpha(0, 0.0000, 0.0000);
			StartRotation(0, 20.0000, 20.0000);
			RotationVelocity(0, 0.0000, 0.0000);
			FadeInTime(0.0000);
		}
		Transformer()
		{
			LifeTime(10.0000);
			Position()
			{
				LifeTime(10.0000)
				Accelerate(0.0000, -0.5000, 0.0000);
			}
			Size(0)
			{
				LifeTime(10.0000)
				Scale(2.0000);
			}
			Color(0)
			{
				LifeTime(5.0000)
				Move(0.0000,0.0000,0.0000,24.0000);
				Next()
				{
					LifeTime(5.0000)
					Move(0.0000,0.0000,0.0000,-24.0000);
				}
			}
		}
		Geometry()
		{
			BlendMode("ADDITIVE");
			Type("PARTICLE");
			Texture("cor_sfx_rays");
		}
	}
}
