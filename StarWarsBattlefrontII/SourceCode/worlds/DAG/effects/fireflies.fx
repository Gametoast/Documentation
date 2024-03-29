ParticleEmitter("Flare")
{
	MaxParticles(-1.0000,-1.0000);
	StartDelay(0.0000,0.0000);
	BurstDelay(0.1000, 0.2000);
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
		Spread()
		{
			PositionX(-1.0000,1.0000);
			PositionY(-1.0000,1.0000);
			PositionZ(-1.0000,1.0000);
		}
		Offset()
		{
			PositionX(-4.0000,4.0000);
			PositionY(0.0000,3.0000);
			PositionZ(-4.0000,4.0000);
		}
		PositionScale(0.0000,0.0000);
		VelocityScale(0.2500,1.2500);
		InheritVelocityFactor(0.0000,0.0000);
		Size(0, 0.1000, 0.1000);
		Hue(0, 16.0000, 48.0000);
		Saturation(0, 255.0000, 255.0000);
		Value(0, 255.0000, 255.0000);
		Alpha(0, 0.0000, 0.0000);
		StartRotation(0, 1.0000, 1.0000);
		RotationVelocity(0, 0.0000, 0.0000);
		FadeInTime(0.0000);
	}
	Transformer()
	{
		LifeTime(10.0000);
		Position()
		{
			LifeTime(1.0000)
		}
		Size(0)
		{
			LifeTime(0.2000)
			Scale(1.0000);
		}
		Color(0)
		{
			LifeTime(0.1000)
			Move(0.0000,0.0000,0.0000,255.0000);
			Next()
			{
				LifeTime(0.0500)
				Move(0.0000,0.0000,0.0000,0.0000);
				Next()
				{
					LifeTime(3.0000)
					Move(0.0000,0.0000,0.0000,-255.0000);
				}
			}
		}
	}
	Geometry()
	{
		BlendMode("ADDITIVE");
		Type("PARTICLE");
		Texture("com_sfx_flashball3");
	}
}
