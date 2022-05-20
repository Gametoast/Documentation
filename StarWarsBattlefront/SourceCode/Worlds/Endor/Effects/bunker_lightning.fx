ParticleEmitter("Lightning1")
{
    MaxParticles(-1.0000,-1.0000);
    StartDelay(0.0000,0.0000);
    BurstDelay(1.0000, 1.0000);
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
        Circle()
        {
            PositionX(0.0000,0.0000);
            PositionY(0.0000,0.0000);
            PositionZ(0.0000,0.0000);
        }
        Offset()
        {
            PositionX(0.0000,0.0000);
            PositionY(0.0000,0.0000);
            PositionZ(0.0000,0.0000);
        }
        PositionScale(0.0000,0.0000);
        VelocityScale(0.0000,0.0000);
        InheritVelocityFactor(0.0000,0.0000);
        Size(0, 1.0000, 1.0000);
        Red(0, 255.0000, 255.0000);
        Green(0, 255.0000, 255.0000);
        Blue(0, 255.0000, 255.0000);
        Alpha(0, 0.0000, 0.0000);
        StartRotation(0, 0.0000, 0.0000);
        RotationVelocity(0, 0.0000, 0.0000);
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
            LifeTime(1.5000)
        }
        Color(0)
        {
            LifeTime(0.0100)
            Reach(255.0000,255.0000,255.0000,254.0000);
            Next()
            {
                LifeTime(0.0400)
                Reach(255.0000,255.0000,255.0000,0.0000);
                Next()
                {
                    LifeTime(0.0100)
                    Reach(255.0000,255.0000,255.0000,254.0000);
                    Next()
                    {
                        LifeTime(0.0400)
                        Reach(255.0000,255.0000,255.0000,0.0000);
                        Next()
                        {
                            LifeTime(0.0500)
                            Reach(255.0000,255.0000,255.0000,0.0000);
                            Next()
                            {
                                LifeTime(0.0100)
                                Reach(255.0000,255.0000,255.0000,254.0000);
                                Next()
                                {
                                    LifeTime(0.0400)
                                    Reach(255.0000,255.0000,255.0000,0.0000);
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    Geometry()
    {
        BlendMode("NORMAL");
        Type("GEOMETRY");
        Model("bunker_lightning1");
    }
    ParticleEmitter("Lightning2")
    {
        MaxParticles(-1.0000,-1.0000);
        StartDelay(0.0000,0.0000);
        BurstDelay(1.0000, 1.0000);
        BurstCount(1.0000,1.0000);
        MaxLodDist(50.0000);
        MinLodDist(10.0000);
        BoundingRadius(5.0);
        SoundName("com_amb_sparka")
        Size(1.0000, 1.0000);
        Hue(255.0000, 255.0000);
        Saturation(255.0000, 255.0000);
        Value(255.0000, 255.0000);
        Alpha(255.0000, 255.0000);
        Spawner()
        {
            Circle()
            {
                PositionX(0.0000,0.0000);
                PositionY(0.0000,0.0000);
                PositionZ(0.0000,0.0000);
            }
            Offset()
            {
                PositionX(0.0000,0.0000);
                PositionY(0.0000,0.0000);
                PositionZ(0.0000,0.0000);
            }
            PositionScale(0.0000,0.0000);
            VelocityScale(0.0000,0.0000);
            InheritVelocityFactor(0.0000,0.0000);
            Size(0, 1.0000, 1.0000);
            Red(0, 255.0000, 255.0000);
            Green(0, 255.0000, 255.0000);
            Blue(0, 255.0000, 255.0000);
            Alpha(0, 0.0000, 0.0000);
            StartRotation(0, 0.0000, 0.0000);
            RotationVelocity(0, 0.0000, 0.0000);
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
                LifeTime(1.5000)
            }
            Color(0)
            {
                LifeTime(0.0500)
                Reach(255.0000,255.0000,255.0000,0.0000);
                Next()
                {
                    LifeTime(0.0100)
                    Reach(255.0000,255.0000,255.0000,254.0000);
                    Next()
                    {
                        LifeTime(0.0400)
                        Reach(255.0000,255.0000,255.0000,0.0000);
                        Next()
                        {
                            LifeTime(0.0100)
                            Reach(255.0000,255.0000,255.0000,254.0000);
                            Next()
                            {
                                LifeTime(0.0400)
                                Reach(255.0000,255.0000,255.0000,0.0000);
                                Next()
                                {
                                    LifeTime(0.0100)
                                    Reach(255.0000,255.0000,255.0000,254.0000);
                                    Next()
                                    {
                                        LifeTime(0.0100)
                                        Reach(255.0000,255.0000,255.0000,254.0000);
                                        Next()
                                        {
                                            LifeTime(0.0400)
                                            Reach(255.0000,255.0000,255.0000,0.0000);
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        Geometry()
        {
            BlendMode("NORMAL");
            Type("GEOMETRY");
            Model("bunker_lightning2");
        }
        ParticleEmitter("Lightning3")
        {
            MaxParticles(-1.0000,-1.0000);
            StartDelay(0.2000,0.2000);
            BurstDelay(1.0000, 1.0000);
            BurstCount(1.0000,1.0000);
            MaxLodDist(50.0000);
            MinLodDist(10.0000);
            BoundingRadius(5.0);
            SoundName("com_amb_sparka")
            Size(1.0000, 1.0000);
            Hue(255.0000, 255.0000);
            Saturation(255.0000, 255.0000);
            Value(255.0000, 255.0000);
            Alpha(255.0000, 255.0000);
            Spawner()
            {
                Circle()
                {
                    PositionX(0.0000,0.0000);
                    PositionY(0.0000,0.0000);
                    PositionZ(0.0000,0.0000);
                }
                Offset()
                {
                    PositionX(0.0000,0.0000);
                    PositionY(0.0000,0.0000);
                    PositionZ(-5.2969,-5.2969);
                }
                PositionScale(0.0000,0.0000);
                VelocityScale(0.0000,0.0000);
                InheritVelocityFactor(0.0000,0.0000);
                Size(0, 1.0000, 1.0000);
                Red(0, 255.0000, 255.0000);
                Green(0, 255.0000, 255.0000);
                Blue(0, 255.0000, 255.0000);
                Alpha(0, 0.0000, 0.0000);
                StartRotation(0, 0.0000, 0.0000);
                RotationVelocity(0, 0.0000, 0.0000);
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
                    LifeTime(1.5000)
                }
                Color(0)
                {
                    LifeTime(0.0100)
                    Reach(255.0000,255.0000,255.0000,254.0000);
                    Next()
                    {
                        LifeTime(0.0400)
                        Reach(255.0000,255.0000,255.0000,0.0000);
                        Next()
                        {
                            LifeTime(0.0100)
                            Reach(255.0000,255.0000,255.0000,254.0000);
                            Next()
                            {
                                LifeTime(0.0400)
                                Reach(255.0000,255.0000,255.0000,0.0000);
                                Next()
                                {
                                    LifeTime(0.0500)
                                    Reach(255.0000,255.0000,255.0000,0.0000);
                                    Next()
                                    {
                                        LifeTime(0.0100)
                                        Reach(255.0000,255.0000,255.0000,254.0000);
                                        Next()
                                        {
                                            LifeTime(0.0400)
                                            Reach(255.0000,255.0000,255.0000,0.0000);
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            Geometry()
            {
                BlendMode("NORMAL");
                Type("GEOMETRY");
                Model("bunker_lightning3");
            }
            ParticleEmitter("Lightning4")
            {
                MaxParticles(-1.0000,-1.0000);
                StartDelay(0.2000,0.2000);
                BurstDelay(1.0000, 1.0000);
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
                    Circle()
                    {
                        PositionX(0.0000,0.0000);
                        PositionY(0.0000,0.0000);
                        PositionZ(0.0000,0.0000);
                    }
                    Offset()
                    {
                        PositionX(0.0000,0.0000);
                        PositionY(0.0000,0.0000);
                        PositionZ(-5.2969,-5.2969);
                    }
                    PositionScale(0.0000,0.0000);
                    VelocityScale(0.0000,0.0000);
                    InheritVelocityFactor(0.0000,0.0000);
                    Size(0, 1.0000, 1.0000);
                    Red(0, 255.0000, 255.0000);
                    Green(0, 255.0000, 255.0000);
                    Blue(0, 255.0000, 255.0000);
                    Alpha(0, 0.0000, 0.0000);
                    StartRotation(0, 0.0000, 0.0000);
                    RotationVelocity(0, 0.0000, 0.0000);
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
                        LifeTime(1.5000)
                    }
                    Color(0)
                    {
                        LifeTime(0.0500)
                        Reach(255.0000,255.0000,255.0000,0.0000);
                        Next()
                        {
                            LifeTime(0.0100)
                            Reach(255.0000,255.0000,255.0000,254.0000);
                            Next()
                            {
                                LifeTime(0.0400)
                                Reach(255.0000,255.0000,255.0000,0.0000);
                                Next()
                                {
                                    LifeTime(0.0100)
                                    Reach(255.0000,255.0000,255.0000,254.0000);
                                    Next()
                                    {
                                        LifeTime(0.0400)
                                        Reach(255.0000,255.0000,255.0000,0.0000);
                                        Next()
                                        {
                                            LifeTime(0.0100)
                                            Reach(255.0000,255.0000,255.0000,254.0000);
                                            Next()
                                            {
                                                LifeTime(0.0100)
                                                Reach(255.0000,255.0000,255.0000,254.0000);
                                                Next()
                                                {
                                                    LifeTime(0.0400)
                                                    Reach(255.0000,255.0000,255.0000,0.0000);
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                Geometry()
                {
                    BlendMode("NORMAL");
                    Type("GEOMETRY");
                    Model("bunker_lightning4");
                }
                ParticleEmitter("Lightning5")
                {
                    MaxParticles(-1.0000,-1.0000);
                    StartDelay(0.4000,0.4000);
                    BurstDelay(1.0000, 1.0000);
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
                        Circle()
                        {
                            PositionX(0.0000,0.0000);
                            PositionY(0.0000,0.0000);
                            PositionZ(0.0000,0.0000);
                        }
                        Offset()
                        {
                            PositionX(-0.2666,-0.2666);
                            PositionY(0.0160,0.0160);
                            PositionZ(-10.8840,-10.8840);
                        }
                        PositionScale(0.0000,0.0000);
                        VelocityScale(0.0000,0.0000);
                        InheritVelocityFactor(0.0000,0.0000);
                        Size(0, 0.8800, 0.8800);
                        Red(0, 255.0000, 255.0000);
                        Green(0, 255.0000, 255.0000);
                        Blue(0, 255.0000, 255.0000);
                        Alpha(0, 0.0000, 0.0000);
                        StartRotation(0, 0.0000, 0.0000);
                        RotationVelocity(0, 0.0000, 0.0000);
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
                            LifeTime(1.5000)
                        }
                        Color(0)
                        {
                            LifeTime(0.0100)
                            Reach(255.0000,255.0000,255.0000,254.0000);
                            Next()
                            {
                                LifeTime(0.0400)
                                Reach(255.0000,255.0000,255.0000,0.0000);
                                Next()
                                {
                                    LifeTime(0.0100)
                                    Reach(255.0000,255.0000,255.0000,254.0000);
                                    Next()
                                    {
                                        LifeTime(0.0400)
                                        Reach(255.0000,255.0000,255.0000,0.0000);
                                        Next()
                                        {
                                            LifeTime(0.0500)
                                            Reach(255.0000,255.0000,255.0000,0.0000);
                                            Next()
                                            {
                                                LifeTime(0.0100)
                                                Reach(255.0000,255.0000,255.0000,254.0000);
                                                Next()
                                                {
                                                    LifeTime(0.0400)
                                                    Reach(255.0000,255.0000,255.0000,0.0000);
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    Geometry()
                    {
                        BlendMode("NORMAL");
                        Type("GEOMETRY");
                        Model("bunker_lightning2");
                    }
                    ParticleEmitter("Lightning6")
                    {
                        MaxParticles(-1.0000,-1.0000);
                        StartDelay(0.4000,0.4000);
                        BurstDelay(1.0000, 1.0000);
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
                            Circle()
                            {
                                PositionX(0.0000,0.0000);
                                PositionY(0.0000,0.0000);
                                PositionZ(0.0000,0.0000);
                            }
                            Offset()
                            {
                                PositionX(-0.2666,-0.2666);
                                PositionY(0.0160,0.0160);
                                PositionZ(-10.8840,-10.8840);
                            }
                            PositionScale(0.0000,0.0000);
                            VelocityScale(0.0000,0.0000);
                            InheritVelocityFactor(0.0000,0.0000);
                            Size(0, 0.8800, 0.8800);
                            Red(0, 255.0000, 255.0000);
                            Green(0, 255.0000, 255.0000);
                            Blue(0, 255.0000, 255.0000);
                            Alpha(0, 0.0000, 0.0000);
                            StartRotation(0, 0.0000, 0.0000);
                            RotationVelocity(0, 0.0000, 0.0000);
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
                                LifeTime(1.5000)
                            }
                            Color(0)
                            {
                                LifeTime(0.0500)
                                Reach(255.0000,255.0000,255.0000,0.0000);
                                Next()
                                {
                                    LifeTime(0.0100)
                                    Reach(255.0000,255.0000,255.0000,254.0000);
                                    Next()
                                    {
                                        LifeTime(0.0400)
                                        Reach(255.0000,255.0000,255.0000,0.0000);
                                        Next()
                                        {
                                            LifeTime(0.0100)
                                            Reach(255.0000,255.0000,255.0000,254.0000);
                                            Next()
                                            {
                                                LifeTime(0.0400)
                                                Reach(255.0000,255.0000,255.0000,0.0000);
                                                Next()
                                                {
                                                    LifeTime(0.0100)
                                                    Reach(255.0000,255.0000,255.0000,254.0000);
                                                    Next()
                                                    {
                                                        LifeTime(0.0100)
                                                        Reach(255.0000,255.0000,255.0000,254.0000);
                                                        Next()
                                                        {
                                                            LifeTime(0.0400)
                                                            Reach(255.0000,255.0000,255.0000,0.0000);
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        Geometry()
                        {
                            BlendMode("NORMAL");
                            Type("GEOMETRY");
                            Model("bunker_lightning2");
                        }
                        ParticleEmitter("Lightning7")
                        {
                            MaxParticles(-1.0000,-1.0000);
                            StartDelay(0.6000,0.6000);
                            BurstDelay(1.0000, 1.0000);
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
                                Circle()
                                {
                                    PositionX(0.0000,0.0000);
                                    PositionY(0.0000,0.0000);
                                    PositionZ(0.0000,0.0000);
                                }
                                Offset()
                                {
                                    PositionX(-0.2666,-0.2666);
                                    PositionY(-0.4872,-0.4872);
                                    PositionZ(-16.0358,-16.0358);
                                }
                                PositionScale(0.0000,0.0000);
                                VelocityScale(0.0000,0.0000);
                                InheritVelocityFactor(0.0000,0.0000);
                                Size(0, 0.6800, 0.6800);
                                Red(0, 255.0000, 255.0000);
                                Green(0, 255.0000, 255.0000);
                                Blue(0, 255.0000, 255.0000);
                                Alpha(0, 0.0000, 0.0000);
                                StartRotation(0, 0.0000, 0.0000);
                                RotationVelocity(0, 0.0000, 0.0000);
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
                                    LifeTime(1.5000)
                                }
                                Color(0)
                                {
                                    LifeTime(0.0100)
                                    Reach(255.0000,255.0000,255.0000,254.0000);
                                    Next()
                                    {
                                        LifeTime(0.0400)
                                        Reach(255.0000,255.0000,255.0000,0.0000);
                                        Next()
                                        {
                                            LifeTime(0.0100)
                                            Reach(255.0000,255.0000,255.0000,254.0000);
                                            Next()
                                            {
                                                LifeTime(0.0400)
                                                Reach(255.0000,255.0000,255.0000,0.0000);
                                                Next()
                                                {
                                                    LifeTime(0.0500)
                                                    Reach(255.0000,255.0000,255.0000,0.0000);
                                                    Next()
                                                    {
                                                        LifeTime(0.0100)
                                                        Reach(255.0000,255.0000,255.0000,254.0000);
                                                        Next()
                                                        {
                                                            LifeTime(0.0400)
                                                            Reach(255.0000,255.0000,255.0000,0.0000);
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            Geometry()
                            {
                                BlendMode("NORMAL");
                                Type("GEOMETRY");
                                Model("bunker_lightning4");
                            }
                            ParticleEmitter("Lightning8")
                            {
                                MaxParticles(-1.0000,-1.0000);
                                StartDelay(0.6000,0.6000);
                                BurstDelay(1.0000, 1.0000);
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
                                    Circle()
                                    {
                                        PositionX(0.0000,0.0000);
                                        PositionY(0.0000,0.0000);
                                        PositionZ(0.0000,0.0000);
                                    }
                                    Offset()
                                    {
                                        PositionX(-0.2666,-0.2666);
                                        PositionY(-0.4872,-0.4872);
                                        PositionZ(-16.0358,-16.0358);
                                    }
                                    PositionScale(0.0000,0.0000);
                                    VelocityScale(0.0000,0.0000);
                                    InheritVelocityFactor(0.0000,0.0000);
                                    Size(0, 0.6800, 0.6800);
                                    Red(0, 255.0000, 255.0000);
                                    Green(0, 255.0000, 255.0000);
                                    Blue(0, 255.0000, 255.0000);
                                    Alpha(0, 0.0000, 0.0000);
                                    StartRotation(0, 0.0000, 0.0000);
                                    RotationVelocity(0, 0.0000, 0.0000);
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
                                        LifeTime(1.5000)
                                    }
                                    Color(0)
                                    {
                                        LifeTime(0.0500)
                                        Reach(255.0000,255.0000,255.0000,0.0000);
                                        Next()
                                        {
                                            LifeTime(0.0100)
                                            Reach(255.0000,255.0000,255.0000,254.0000);
                                            Next()
                                            {
                                                LifeTime(0.0400)
                                                Reach(255.0000,255.0000,255.0000,0.0000);
                                                Next()
                                                {
                                                    LifeTime(0.0100)
                                                    Reach(255.0000,255.0000,255.0000,254.0000);
                                                    Next()
                                                    {
                                                        LifeTime(0.0400)
                                                        Reach(255.0000,255.0000,255.0000,0.0000);
                                                        Next()
                                                        {
                                                            LifeTime(0.0100)
                                                            Reach(255.0000,255.0000,255.0000,254.0000);
                                                            Next()
                                                            {
                                                                LifeTime(0.0100)
                                                                Reach(255.0000,255.0000,255.0000,254.0000);
                                                                Next()
                                                                {
                                                                    LifeTime(0.0400)
                                                                    Reach(255.0000,255.0000,255.0000,0.0000);
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                Geometry()
                                {
                                    BlendMode("NORMAL");
                                    Type("GEOMETRY");
                                    Model("bunker_lightning3");
                                }
                                ParticleEmitter("Lightning9")
                                {
                                    MaxParticles(-1.0000,-1.0000);
                                    StartDelay(0.8000,0.8000);
                                    BurstDelay(1.0000, 1.0000);
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
                                        Circle()
                                        {
                                            PositionX(0.0000,0.0000);
                                            PositionY(0.0000,0.0000);
                                            PositionZ(0.0000,0.0000);
                                        }
                                        Offset()
                                        {
                                            PositionX(-0.2666,-0.2666);
                                            PositionY(-0.9340,-0.9340);
                                            PositionZ(-19.6638,-19.6638);
                                        }
                                        PositionScale(0.0000,0.0000);
                                        VelocityScale(0.0000,0.0000);
                                        InheritVelocityFactor(0.0000,0.0000);
                                        Size(0, 0.4800, 0.4800);
                                        Red(0, 255.0000, 255.0000);
                                        Green(0, 255.0000, 255.0000);
                                        Blue(0, 255.0000, 255.0000);
                                        Alpha(0, 0.0000, 0.0000);
                                        StartRotation(0, 0.0000, 0.0000);
                                        RotationVelocity(0, 0.0000, 0.0000);
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
                                            LifeTime(1.5000)
                                        }
                                        Color(0)
                                        {
                                            LifeTime(0.0100)
                                            Reach(255.0000,255.0000,255.0000,254.0000);
                                            Next()
                                            {
                                                LifeTime(0.0400)
                                                Reach(255.0000,255.0000,255.0000,0.0000);
                                                Next()
                                                {
                                                    LifeTime(0.0100)
                                                    Reach(255.0000,255.0000,255.0000,254.0000);
                                                    Next()
                                                    {
                                                        LifeTime(0.0400)
                                                        Reach(255.0000,255.0000,255.0000,0.0000);
                                                        Next()
                                                        {
                                                            LifeTime(0.0500)
                                                            Reach(255.0000,255.0000,255.0000,0.0000);
                                                            Next()
                                                            {
                                                                LifeTime(0.0100)
                                                                Reach(255.0000,255.0000,255.0000,254.0000);
                                                                Next()
                                                                {
                                                                    LifeTime(0.0400)
                                                                    Reach(255.0000,255.0000,255.0000,0.0000);
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    Geometry()
                                    {
                                        BlendMode("NORMAL");
                                        Type("GEOMETRY");
                                        Model("bunker_lightning1");
                                    }
                                    ParticleEmitter("Lightning10")
                                    {
                                        MaxParticles(-1.0000,-1.0000);
                                        StartDelay(0.8000,0.8000);
                                        BurstDelay(1.0000, 1.0000);
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
                                            Circle()
                                            {
                                                PositionX(0.0000,0.0000);
                                                PositionY(0.0000,0.0000);
                                                PositionZ(0.0000,0.0000);
                                            }
                                            Offset()
                                            {
                                                PositionX(-0.2666,-0.2666);
                                                PositionY(-0.9340,-0.9340);
                                                PositionZ(-19.6638,-19.6638);
                                            }
                                            PositionScale(0.0000,0.0000);
                                            VelocityScale(0.0000,0.0000);
                                            InheritVelocityFactor(0.0000,0.0000);
                                            Size(0, 0.4800, 0.4800);
                                            Red(0, 255.0000, 255.0000);
                                            Green(0, 255.0000, 255.0000);
                                            Blue(0, 255.0000, 255.0000);
                                            Alpha(0, 0.0000, 0.0000);
                                            StartRotation(0, 0.0000, 0.0000);
                                            RotationVelocity(0, 0.0000, 0.0000);
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
                                                LifeTime(1.5000)
                                            }
                                            Color(0)
                                            {
                                                LifeTime(0.0500)
                                                Reach(255.0000,255.0000,255.0000,0.0000);
                                                Next()
                                                {
                                                    LifeTime(0.0100)
                                                    Reach(255.0000,255.0000,255.0000,254.0000);
                                                    Next()
                                                    {
                                                        LifeTime(0.0400)
                                                        Reach(255.0000,255.0000,255.0000,0.0000);
                                                        Next()
                                                        {
                                                            LifeTime(0.0100)
                                                            Reach(255.0000,255.0000,255.0000,254.0000);
                                                            Next()
                                                            {
                                                                LifeTime(0.0400)
                                                                Reach(255.0000,255.0000,255.0000,0.0000);
                                                                Next()
                                                                {
                                                                    LifeTime(0.0100)
                                                                    Reach(255.0000,255.0000,255.0000,254.0000);
                                                                    Next()
                                                                    {
                                                                        LifeTime(0.0100)
                                                                        Reach(255.0000,255.0000,255.0000,254.0000);
                                                                        Next()
                                                                        {
                                                                            LifeTime(0.0400)
                                                                            Reach(255.0000,255.0000,255.0000,0.0000);
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                        Geometry()
                                        {
                                            BlendMode("NORMAL");
                                            Type("GEOMETRY");
                                            Model("bunker_lightning3");
                                        }
                                        ParticleEmitter("Lightning11")
                                        {
                                            MaxParticles(-1.0000,-1.0000);
                                            StartDelay(1.0000,1.0000);
                                            BurstDelay(1.0000, 1.0000);
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
                                                Circle()
                                                {
                                                    PositionX(0.0000,0.0000);
                                                    PositionY(0.0000,0.0000);
                                                    PositionZ(0.0000,0.0000);
                                                }
                                                Offset()
                                                {
                                                    PositionX(-0.2666,-0.2666);
                                                    PositionY(-1.3602,-1.3602);
                                                    PositionZ(-23.4906,-23.4906);
                                                }
                                                PositionScale(0.0000,0.0000);
                                                VelocityScale(0.0000,0.0000);
                                                InheritVelocityFactor(0.0000,0.0000);
                                                Size(0, 0.3300, 0.3300);
                                                Red(0, 255.0000, 255.0000);
                                                Green(0, 255.0000, 255.0000);
                                                Blue(0, 255.0000, 255.0000);
                                                Alpha(0, 0.0000, 0.0000);
                                                StartRotation(0, 0.0000, 0.0000);
                                                RotationVelocity(0, 0.0000, 0.0000);
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
                                                    LifeTime(1.5000)
                                                }
                                                Color(0)
                                                {
                                                    LifeTime(0.0100)
                                                    Reach(255.0000,255.0000,255.0000,254.0000);
                                                    Next()
                                                    {
                                                        LifeTime(0.0400)
                                                        Reach(255.0000,255.0000,255.0000,0.0000);
                                                        Next()
                                                        {
                                                            LifeTime(0.0100)
                                                            Reach(255.0000,255.0000,255.0000,254.0000);
                                                            Next()
                                                            {
                                                                LifeTime(0.0400)
                                                                Reach(255.0000,255.0000,255.0000,0.0000);
                                                                Next()
                                                                {
                                                                    LifeTime(0.0500)
                                                                    Reach(255.0000,255.0000,255.0000,0.0000);
                                                                    Next()
                                                                    {
                                                                        LifeTime(0.0100)
                                                                        Reach(255.0000,255.0000,255.0000,254.0000);
                                                                        Next()
                                                                        {
                                                                            LifeTime(0.0400)
                                                                            Reach(255.0000,255.0000,255.0000,0.0000);
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                            Geometry()
                                            {
                                                BlendMode("NORMAL");
                                                Type("GEOMETRY");
                                                Model("bunker_lightning1");
                                            }
                                            ParticleEmitter("Lightning12")
                                            {
                                                MaxParticles(-1.0000,-1.0000);
                                                StartDelay(1.0000,1.0000);
                                                BurstDelay(1.0000, 1.0000);
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
                                                    Circle()
                                                    {
                                                        PositionX(0.0000,0.0000);
                                                        PositionY(0.0000,0.0000);
                                                        PositionZ(0.0000,0.0000);
                                                    }
                                                    Offset()
                                                    {
                                                        PositionX(-0.2666,-0.2666);
                                                        PositionY(-1.3602,-1.3602);
                                                        PositionZ(-23.4906,-23.4906);
                                                    }
                                                    PositionScale(0.0000,0.0000);
                                                    VelocityScale(0.0000,0.0000);
                                                    InheritVelocityFactor(0.0000,0.0000);
                                                    Size(0, 0.3300, 0.3300);
                                                    Red(0, 255.0000, 255.0000);
                                                    Green(0, 255.0000, 255.0000);
                                                    Blue(0, 255.0000, 255.0000);
                                                    Alpha(0, 0.0000, 0.0000);
                                                    StartRotation(0, 0.0000, 0.0000);
                                                    RotationVelocity(0, 0.0000, 0.0000);
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
                                                        LifeTime(1.5000)
                                                    }
                                                    Color(0)
                                                    {
                                                        LifeTime(0.0500)
                                                        Reach(255.0000,255.0000,255.0000,0.0000);
                                                        Next()
                                                        {
                                                            LifeTime(0.0100)
                                                            Reach(255.0000,255.0000,255.0000,254.0000);
                                                            Next()
                                                            {
                                                                LifeTime(0.0400)
                                                                Reach(255.0000,255.0000,255.0000,0.0000);
                                                                Next()
                                                                {
                                                                    LifeTime(0.0100)
                                                                    Reach(255.0000,255.0000,255.0000,254.0000);
                                                                    Next()
                                                                    {
                                                                        LifeTime(0.0400)
                                                                        Reach(255.0000,255.0000,255.0000,0.0000);
                                                                        Next()
                                                                        {
                                                                            LifeTime(0.0100)
                                                                            Reach(255.0000,255.0000,255.0000,254.0000);
                                                                            Next()
                                                                            {
                                                                                LifeTime(0.0100)
                                                                                Reach(255.0000,255.0000,255.0000,254.0000);
                                                                                Next()
                                                                                {
                                                                                    LifeTime(0.0400)
                                                                                    Reach(255.0000,255.0000,255.0000,0.0000);
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                                Geometry()
                                                {
                                                    BlendMode("NORMAL");
                                                    Type("GEOMETRY");
                                                    Model("bunker_lightning4");
                                                }
                                                ParticleEmitter("Lightning13")
                                                {
                                                    MaxParticles(-1.0000,-1.0000);
                                                    StartDelay(1.2000,1.2000);
                                                    BurstDelay(1.0000, 1.0000);
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
                                                        Circle()
                                                        {
                                                            PositionX(0.0000,0.0000);
                                                            PositionY(0.0000,0.0000);
                                                            PositionZ(0.0000,0.0000);
                                                        }
                                                        Offset()
                                                        {
                                                            PositionX(-0.1866,-0.1866);
                                                            PositionY(-1.3602,-1.3602);
                                                            PositionZ(-27.1083,-27.1083);
                                                        }
                                                        PositionScale(0.0000,0.0000);
                                                        VelocityScale(0.0000,0.0000);
                                                        InheritVelocityFactor(0.0000,0.0000);
                                                        Size(0, 0.1600, 0.1600);
                                                        Red(0, 255.0000, 255.0000);
                                                        Green(0, 255.0000, 255.0000);
                                                        Blue(0, 255.0000, 255.0000);
                                                        Alpha(0, 0.0000, 0.0000);
                                                        StartRotation(0, 0.0000, 0.0000);
                                                        RotationVelocity(0, 0.0000, 0.0000);
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
                                                            LifeTime(1.5000)
                                                        }
                                                        Color(0)
                                                        {
                                                            LifeTime(0.0100)
                                                            Reach(255.0000,255.0000,255.0000,254.0000);
                                                            Next()
                                                            {
                                                                LifeTime(0.0400)
                                                                Reach(255.0000,255.0000,255.0000,0.0000);
                                                                Next()
                                                                {
                                                                    LifeTime(0.0100)
                                                                    Reach(255.0000,255.0000,255.0000,254.0000);
                                                                    Next()
                                                                    {
                                                                        LifeTime(0.0400)
                                                                        Reach(255.0000,255.0000,255.0000,0.0000);
                                                                        Next()
                                                                        {
                                                                            LifeTime(0.0500)
                                                                            Reach(255.0000,255.0000,255.0000,0.0000);
                                                                            Next()
                                                                            {
                                                                                LifeTime(0.0100)
                                                                                Reach(255.0000,255.0000,255.0000,254.0000);
                                                                                Next()
                                                                                {
                                                                                    LifeTime(0.0400)
                                                                                    Reach(255.0000,255.0000,255.0000,0.0000);
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                    Geometry()
                                                    {
                                                        BlendMode("NORMAL");
                                                        Type("GEOMETRY");
                                                        Model("bunker_lightning1");
                                                    }
                                                    ParticleEmitter("Lightning14")
                                                    {
                                                        MaxParticles(-1.0000,-1.0000);
                                                        StartDelay(1.2000,1.2000);
                                                        BurstDelay(1.0000, 1.0000);
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
                                                            Circle()
                                                            {
                                                                PositionX(0.0000,0.0000);
                                                                PositionY(0.0000,0.0000);
                                                                PositionZ(0.0000,0.0000);
                                                            }
                                                            Offset()
                                                            {
                                                                PositionX(-0.1866,-0.1866);
                                                                PositionY(-1.3602,-1.3602);
                                                                PositionZ(-27.1083,-27.1083);
                                                            }
                                                            PositionScale(0.0000,0.0000);
                                                            VelocityScale(0.0000,0.0000);
                                                            InheritVelocityFactor(0.0000,0.0000);
                                                            Size(0, 0.0000, 0.0000);
                                                            Red(0, 255.0000, 255.0000);
                                                            Green(0, 255.0000, 255.0000);
                                                            Blue(0, 255.0000, 255.0000);
                                                            Alpha(0, 0.0000, 0.0000);
                                                            StartRotation(0, 0.0000, 0.0000);
                                                            RotationVelocity(0, 0.0000, 0.0000);
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
                                                                LifeTime(1.5000)
                                                            }
                                                            Color(0)
                                                            {
                                                                LifeTime(0.0500)
                                                                Reach(255.0000,255.0000,255.0000,0.0000);
                                                                Next()
                                                                {
                                                                    LifeTime(0.0100)
                                                                    Reach(255.0000,255.0000,255.0000,254.0000);
                                                                    Next()
                                                                    {
                                                                        LifeTime(0.0400)
                                                                        Reach(255.0000,255.0000,255.0000,0.0000);
                                                                        Next()
                                                                        {
                                                                            LifeTime(0.0100)
                                                                            Reach(255.0000,255.0000,255.0000,254.0000);
                                                                            Next()
                                                                            {
                                                                                LifeTime(0.0400)
                                                                                Reach(255.0000,255.0000,255.0000,0.0000);
                                                                                Next()
                                                                                {
                                                                                    LifeTime(0.0100)
                                                                                    Reach(255.0000,255.0000,255.0000,254.0000);
                                                                                    Next()
                                                                                    {
                                                                                        LifeTime(0.0100)
                                                                                        Reach(255.0000,255.0000,255.0000,254.0000);
                                                                                        Next()
                                                                                        {
                                                                                            LifeTime(0.0400)
                                                                                            Reach(255.0000,255.0000,255.0000,0.0000);
                                                                                        }
                                                                                    }
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                        Geometry()
                                                        {
                                                            BlendMode("NORMAL");
                                                            Type("GEOMETRY");
                                                            Model("bunker_lightning1");
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
