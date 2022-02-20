ParticleEmitter("Dust")
{
	MaxParticles(-1.0000,-1.0000);
	StartDelay(0.0000,0.0000);
	BurstDelay(0.4000, 0.4000);
	BurstCount(1.0000,1.0000);
	MaxLodDist(50.0000);
	MinLodDist(10.0000);
	BoundingRadius(5.0);
	SoundName("com_amb_steam_slow")
	Size(1.0000, 1.0000);
	Red(255.0000, 255.0000);
	Green(255.0000, 255.0000);
	Blue(255.0000, 255.0000);
	Alpha(255.0000, 255.0000);
	Spawner()
	{
		Circle()
		{
			PositionX(-1.0000,1.0000);
			PositionY(1.0000,2.0000);
			PositionZ(-1.0000,1.0000);
		}
		Offset()
		{
			PositionX(-0.5000,0.5000);
			PositionY(0.0000,0.0000);
			PositionZ(-0.5000,0.5000);
		}
		PositionScale(0.0000,0.0000);
		VelocityScale(2.0000,3.0000);
		InheritVelocityFactor(0.0000,0.0000);
		Size(0, 1.0000, 2.0000);
		Hue(0, 1.0000, 20.0000);
		Saturation(0, 100.0000, 255.0000);
		Value(0, 50.0000, 200.0000);
		Alpha(0, 0.0000, 16.0000);
		StartRotation(0, 0.0000, 360.0000);
		RotationVelocity(0, -80.0000, 80.0000);
		FadeInTime(0.0000);
	}
	Transformer()
	{
		LifeTime(5.0000);
		Position()
		{
			LifeTime(5.0000)
			Scale(0.0000);
		}
		Size(0)
		{
			LifeTime(5.0000)
			Scale(8.0000);
		}
		Color(0)
		{
			LifeTime(1.0000)
			Move(0.0000,0.0000,0.0000,32.0000);
			Next()
			{
				LifeTime(3.0000)
				Move(0.0000,0.0000,0.0000,-48.0000);
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
