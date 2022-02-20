ParticleEmitter("BlackSmoke")
{
    SoundName("com_amb_fire")
    MaxParticles(20000.0000,20000.0000);
    StartDelay(0.0000,0.0000);
    BurstDelay(0.5000, 0.5000);
    BurstCount(1.0000,1.0000);
    MaxLodDist(1000.0000);
    MinLodDist(800.0000);
    Size(1.0000, 1.0000);
    Hue(255.0000, 255.0000);
    Saturation(255.0000, 255.0000);
    Value(255.0000, 255.0000);
    Alpha(255.0000, 255.0000);
    Spawner()
    {
        Spread()
        {
            PositionX(-0.0500,0.0500);
            PositionY(0.1000,0.2500);
            PositionZ(-0.0500,0.0500);
        }
        Offset()
        {
            PositionX(-0.2500,0.2500);
            PositionY(0.5000,0.7500);
            PositionZ(-0.2500,0.2500);
        }
        PositionScale(0.5000,0.5000);
        VelocityScale(0.0000,0.0000);
        InheritVelocityFactor(0.0000,0.0000);
        Size(0, 0.2500, 0.5000);
        Red(0, 200.0000, 200.0000);
        Green(0, 200.0000, 200.0000);
        Blue(0, 200.0000, 200.0000);
        Alpha(0, 0.0000, 0.0000);
        StartRotation(0, -70.0000, 0.0000);
        RotationVelocity(0, -40.0000, 0.0000);
        FadeInTime(0.0000);
    }
    Transformer()
    {
        LifeTime(2.0000);
        Position()
        {
            LifeTime(2.0000)
            Accelerate(0.0000, 2.5000, 0.0000);
        }
        Size(0)
        {
            LifeTime(2.0000)
            Scale(3.0000);
        }
        Color(0)
        {
            LifeTime(0.5000)
            Reach(128.0000,128.0000,128.0000,48.0000);
            Next()
            {
                LifeTime(1.5000)
                Reach(0.0000,0.0000,0.0000,0.0000);
            }
        }
    }
    Geometry()
    {
        BlendMode("NORMAL");
        Type("PARTICLE");
        Texture("underlitesmoke1");
    }
    ParticleEmitter("Embers")
    {
        MaxParticles(-1.0000,-1.0000);
        StartDelay(0.0000,0.0000);
        BurstDelay(0.2500, 0.7500);
        BurstCount(1.0000,1.5500);
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
                PositionX(-0.1500,0.1500);
                PositionY(0.5000,1.2500);
                PositionZ(-0.1500,0.1500);
            }
            Offset()
            {
                PositionX(-0.2500,0.2500);
                PositionY(0.0000,0.2500);
                PositionZ(-0.2500,0.2500);
            }
            PositionScale(0.0000,0.1500);
            VelocityScale(0.1000,0.4000);
            InheritVelocityFactor(0.0000,0.0000);
            Size(0, 0.0250, 0.0750);
            Red(0, 255.0000, 255.0000);
            Green(0, 191.0000, 202.5700);
            Blue(0, 50.0000, 135.0000);
            Alpha(0, 0.0000, 0.0000);
            StartRotation(0, 0.0000, 360.0000);
            RotationVelocity(0, -20.0000, 20.0000);
            FadeInTime(0.0000);
        }
        Transformer()
        {
            LifeTime(6.0000);
            Position()
            {
                LifeTime(6.0000)
                Accelerate(0.0000, 1.0000, 0.0000);
            }
            Size(0)
            {
                LifeTime(6.0000)
                Scale(0.0500);
            }
            Color(0)
            {
                LifeTime(0.5000)
                Move(255.0000,191.0000,50.0000,255.0000);
                Next()
                {
                    LifeTime(5.5000)
                    Reach(0.0000,0.0000,0.0000,0.0000);
                }
            }
        }
        Geometry()
        {
            BlendMode("ADDITIVE");
            Type("PARTICLE");
            Texture("hotspot");
        }
        ParticleEmitter("Flame1")
        {
            MaxParticles(-1.0000,-1.0000);
            StartDelay(0.0000,0.0000);
            BurstDelay(0.1000, 0.1000);
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
                    PositionX(0.0000,0.0000);
                    PositionY(0.5000,1.0000);
                    PositionZ(0.0000,0.0000);
                }
                Offset()
                {
                    PositionX(-0.1000,0.1000);
                    PositionY(0.0000,0.0000);
                    PositionZ(-0.1000,0.1000);
                }
                PositionScale(0.1000,0.1000);
                VelocityScale(1.0000,2.0000);
                InheritVelocityFactor(0.0000,0.0000);
                Size(0, 0.1500, 0.2000);
                Red(0, 255.0000, 255.0000);
                Green(0, 255.0000, 255.0000);
                Blue(0, 255.0000, 255.0000);
                Alpha(0, 0.0000, 0.0000);
                StartRotation(0, 0.0000, 20.0000);
                RotationVelocity(0, -80.0000, 0.0000);
                FadeInTime(0.0000);
            }
            Transformer()
            {
                LifeTime(1.0000);
                Position()
                {
                    LifeTime(1.0000)
                    Reach(0.0000, 0.0000, 0.0000);
                }
                Size(0)
                {
                    LifeTime(1.0000)
                    Scale(0.2500);
                }
                Color(0)
                {
                    LifeTime(0.1000)
                    Reach(255.0000,255.0000,255.0000,180.0000);
                    Next()
                    {
                        LifeTime(0.6000)
                        Reach(100.0000,0.0000,0.0000,0.0000);
                    }
                }
            }
            Geometry()
            {
                BlendMode("ADDITIVE");
                Type("PARTICLE");
                Texture("flames1");
            }
            ParticleEmitter("Flame2")
            {
                MaxParticles(-1.0000,-1.0000);
                StartDelay(0.0000,0.0000);
                BurstDelay(0.1000, 0.1000);
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
                        PositionX(0.0000,0.0000);
                        PositionY(0.5000,0.8000);
                        PositionZ(0.0000,0.0000);
                    }
                    Offset()
                    {
                        PositionX(-0.1000,0.1000);
                        PositionY(0.0000,0.0000);
                        PositionZ(-0.1000,0.1000);
                    }
                    PositionScale(0.1000,0.1000);
                    VelocityScale(1.0000,2.0000);
                    InheritVelocityFactor(0.0000,0.0000);
                    Size(0, 0.2000, 0.2500);
                    Red(0, 255.0000, 255.0000);
                    Green(0, 255.0000, 255.0000);
                    Blue(0, 255.0000, 255.0000);
                    Alpha(0, 0.0000, 0.0000);
                    StartRotation(0, 0.0000, 20.0000);
                    RotationVelocity(0, -80.0000, 0.0000);
                    FadeInTime(0.0000);
                }
                Transformer()
                {
                    LifeTime(1.0000);
                    Position()
                    {
                        LifeTime(1.0000)
                        Reach(0.0000, 0.0000, 0.0000);
                    }
                    Size(0)
                    {
                        LifeTime(1.0000)
                        Scale(0.2500);
                    }
                    Color(0)
                    {
                        LifeTime(0.1000)
                        Reach(255.0000,255.0000,255.0000,180.0000);
                        Next()
                        {
                            LifeTime(0.6000)
                            Reach(100.0000,0.0000,0.0000,0.0000);
                        }
                    }
                }
                Geometry()
                {
                    BlendMode("ADDITIVE");
                    Type("PARTICLE");
                    Texture("flames2");
                }
                ParticleEmitter("Flame3")
                {
                    MaxParticles(-1.0000,-1.0000);
                    StartDelay(0.0000,0.0000);
                    BurstDelay(0.1000, 0.1000);
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
                            PositionX(0.0000,0.0000);
                            PositionY(0.2500,1.0000);
                            PositionZ(0.0000,0.0000);
                        }
                        Offset()
                        {
                            PositionX(-0.1000,0.1000);
                            PositionY(0.0000,0.0000);
                            PositionZ(-0.1000,0.1000);
                        }
                        PositionScale(0.1000,0.1000);
                        VelocityScale(1.0000,2.0000);
                        InheritVelocityFactor(0.0000,0.0000);
                        Size(0, 0.2500, 0.3000);
                        Red(0, 255.0000, 255.0000);
                        Green(0, 255.0000, 255.0000);
                        Blue(0, 255.0000, 255.0000);
                        Alpha(0, 0.0000, 0.0000);
                        StartRotation(0, 0.0000, 20.0000);
                        RotationVelocity(0, -80.0000, 0.0000);
                        FadeInTime(0.0000);
                    }
                    Transformer()
                    {
                        LifeTime(1.0000);
                        Position()
                        {
                            LifeTime(1.0000)
                            Reach(0.0000, 0.0000, 0.0000);
                        }
                        Size(0)
                        {
                            LifeTime(1.0000)
                            Scale(0.2500);
                        }
                        Color(0)
                        {
                            LifeTime(0.1000)
                            Reach(255.0000,255.0000,255.0000,180.0000);
                            Next()
                            {
                                LifeTime(0.6000)
                                Reach(100.0000,0.0000,0.0000,0.0000);
                            }
                        }
                    }
                    Geometry()
                    {
                        BlendMode("ADDITIVE");
                        Type("PARTICLE");
                        Texture("flames3");
                    }
                }
            }
        }
    }
}
