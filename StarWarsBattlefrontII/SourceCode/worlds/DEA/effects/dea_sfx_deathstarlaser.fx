ParticleEmitter("BeamOuter1")
{
    MaxParticles(1.0000,1.0000);
    StartDelay(12.0000,12.0000);
    BurstDelay(0.0010, 0.0010);
    BurstCount(1.0000,1.0000);
    MaxLodDist(2000.0000);
    MinLodDist(1900.0000);
    BoundingRadius(30.0);
    SoundName("ds_beam_seq")
    NoRegisterStep();
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
        LifeTime(3.0000);
        Position()
        {
            LifeTime(1.0000)
        }
        Size(0)
        {
            LifeTime(0.5000)
            Scale(1.0000);
        }
        Color(0)
        {
            LifeTime(1.0000)
            Move(0.0000,0.0000,0.0000,255.0000);
            Next()
            {
                LifeTime(1.0000)
                Move(0.0000,0.0000,0.0000,0.0000);
                Next()
                {
                    LifeTime(1.0000)
                    Move(0.0000,0.0000,0.0000,-255.0000);
                }
            }
        }
    }
    Geometry()
    {
        BlendMode("ADDITIVE");
        Type("EMITTER");
        Texture("dea_sfx_laserbeam1");
        ParticleEmitter("Mesh")
        {
            MaxParticles(0.0000,0.0000);
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
                Spread()
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
                Hue(0, 0.0000, 0.0000);
                Saturation(0, 0.0000, 0.0000);
                Value(0, 255.0000, 255.0000);
                Alpha(0, 255.0000, 255.0000);
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
                    LifeTime(0.5000)
                    Scale(1.0000);
                }
                Color(0)
                {
                    LifeTime(1.0000)
                    Move(0.0000,0.0000,0.0000,0.0000);
                }
            }
            Geometry()
            {
                BlendMode("ADDITIVE");
                Type("GEOMETRY");
                Model("dea1_bldg_froom_spinner");
            }
            ParticleEmitter("BeamOuter1")
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
                    Spread()
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
                    Hue(0, 80.0000, 100.0000);
                    Saturation(0, 255.0000, 255.0000);
                    Value(0, 100.0000, 100.0000);
                    Alpha(0, 128.0000, 128.0000);
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
                        LifeTime(0.5000)
                        Scale(1.0000);
                    }
                    Color(0)
                    {
                        LifeTime(0.1000)
                        Move(0.0000,0.0000,0.0000,0.0000);
                    }
                }
                Geometry()
                {
                    BlendMode("ADDITIVE");
                    Type("GEOMETRY");
                    Model("dea_sfx_laserbeam_lg1");
                }
                ParticleEmitter("BeamOuter2")
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
                        Spread()
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
                        Hue(0, 60.0000, 80.0000);
                        Saturation(0, 255.0000, 255.0000);
                        Value(0, 255.0000, 255.0000);
                        Alpha(0, 128.0000, 128.0000);
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
                            LifeTime(0.5000)
                            Scale(1.0000);
                        }
                        Color(0)
                        {
                            LifeTime(1.0000)
                            Move(0.0000,0.0000,0.0000,0.0000);
                        }
                    }
                    Geometry()
                    {
                        BlendMode("ADDITIVE");
                        Type("GEOMETRY");
                        Model("dea_sfx_laserbeam_lg2");
                    }
                }
            }
        }
    }
    ParticleEmitter("BeamInner1")
    {
        MaxParticles(1.0000,1.0000);
        StartDelay(13.0000,13.0000);
        BurstDelay(0.0010, 0.0010);
        BurstCount(1.0000,1.0000);
        MaxLodDist(2000.0000);
        MinLodDist(1900.0000);
        BoundingRadius(5.0);
        SoundName("")
        NoRegisterStep();
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
            LifeTime(2.0000);
            Position()
            {
                LifeTime(1.0000)
            }
            Size(0)
            {
                LifeTime(0.5000)
                Scale(1.0000);
            }
            Color(0)
            {
                LifeTime(0.5000)
                Move(0.0000,0.0000,0.0000,255.0000);
                Next()
                {
                    LifeTime(1.0000)
                    Move(0.0000,0.0000,0.0000,0.0000);
                    Next()
                    {
                        LifeTime(0.5000)
                        Move(0.0000,0.0000,0.0000,-255.0000);
                    }
                }
            }
        }
        Geometry()
        {
            BlendMode("ADDITIVE");
            Type("EMITTER");
            Texture("dea_sfx_laserbeam1");
            ParticleEmitter("Mesh")
            {
                MaxParticles(0.0000,0.0000);
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
                    Spread()
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
                    Hue(0, 0.0000, 0.0000);
                    Saturation(0, 0.0000, 0.0000);
                    Value(0, 255.0000, 255.0000);
                    Alpha(0, 255.0000, 255.0000);
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
                        LifeTime(0.5000)
                        Scale(1.0000);
                    }
                    Color(0)
                    {
                        LifeTime(1.0000)
                        Move(0.0000,0.0000,0.0000,0.0000);
                    }
                }
                Geometry()
                {
                    BlendMode("ADDITIVE");
                    Type("GEOMETRY");
                    Model("dea1_bldg_froom_spinner");
                }
                ParticleEmitter("BeamInner1")
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
                        Spread()
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
                        Hue(0, 0.0000, 20.0000);
                        Saturation(0, 255.0000, 255.0000);
                        Value(0, 255.0000, 255.0000);
                        Alpha(0, 255.0000, 255.0000);
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
                            LifeTime(0.5000)
                            Scale(1.0000);
                        }
                        Color(0)
                        {
                            LifeTime(0.0100)
                            Move(0.0000,0.0000,0.0000,0.0000);
                        }
                    }
                    Geometry()
                    {
                        BlendMode("ADDITIVE");
                        Type("GEOMETRY");
                        Model("dea_sfx_laserbeam_sm1");
                    }
                    ParticleEmitter("BeamInner2")
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
                            Spread()
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
                            Hue(0, 0.0000, 20.0000);
                            Saturation(0, 255.0000, 255.0000);
                            Value(0, 255.0000, 255.0000);
                            Alpha(0, 255.0000, 255.0000);
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
                                LifeTime(0.5000)
                                Scale(1.0000);
                            }
                            Color(0)
                            {
                                LifeTime(0.0100)
                                Move(0.0000,0.0000,0.0000,0.0000);
                            }
                        }
                        Geometry()
                        {
                            BlendMode("ADDITIVE");
                            Type("GEOMETRY");
                            Model("dea_sfx_laserbeam_sm2");
                        }
                    }
                }
            }
        }
        ParticleEmitter("BeamMid1")
        {
            MaxParticles(1.0000,1.0000);
            StartDelay(13.0000,13.0000);
            BurstDelay(0.0010, 0.0010);
            BurstCount(1.0000,1.0000);
            MaxLodDist(2000.0000);
            MinLodDist(1900.0000);
            BoundingRadius(5.0);
            SoundName("")
            NoRegisterStep();
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
                LifeTime(2.0000);
                Position()
                {
                    LifeTime(1.0000)
                }
                Size(0)
                {
                    LifeTime(0.5000)
                    Scale(1.0000);
                }
                Color(0)
                {
                    LifeTime(0.5000)
                    Move(0.0000,0.0000,0.0000,255.0000);
                    Next()
                    {
                        LifeTime(1.0000)
                        Move(0.0000,0.0000,0.0000,0.0000);
                        Next()
                        {
                            LifeTime(0.5000)
                            Move(0.0000,0.0000,0.0000,-255.0000);
                        }
                    }
                }
            }
            Geometry()
            {
                BlendMode("ADDITIVE");
                Type("EMITTER");
                Texture("dea_sfx_laserbeam1");
                ParticleEmitter("Mesh")
                {
                    MaxParticles(0.0000,0.0000);
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
                        Spread()
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
                        Hue(0, 0.0000, 0.0000);
                        Saturation(0, 0.0000, 0.0000);
                        Value(0, 255.0000, 255.0000);
                        Alpha(0, 255.0000, 255.0000);
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
                            LifeTime(0.5000)
                            Scale(1.0000);
                        }
                        Color(0)
                        {
                            LifeTime(1.0000)
                            Move(0.0000,0.0000,0.0000,0.0000);
                        }
                    }
                    Geometry()
                    {
                        BlendMode("ADDITIVE");
                        Type("GEOMETRY");
                        Model("dea1_bldg_froom_spinner");
                    }
                    ParticleEmitter("BeamMid1")
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
                            Spread()
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
                            Hue(0, 0.0000, 20.0000);
                            Saturation(0, 255.0000, 255.0000);
                            Value(0, 255.0000, 255.0000);
                            Alpha(0, 128.0000, 128.0000);
                            StartRotation(0, 0.0000, 0.0000);
                            RotationVelocity(0, 0.0000, 0.0000);
                            FadeInTime(0.0000);
                        }
                        Transformer()
                        {
                            LifeTime(2.0000);
                            Position()
                            {
                                LifeTime(2.0000)
                            }
                            Size(0)
                            {
                                LifeTime(0.5000)
                                Scale(1.0000);
                            }
                            Color(0)
                            {
                                LifeTime(0.0100)
                                Move(0.0000,0.0000,0.0000,0.0000);
                            }
                        }
                        Geometry()
                        {
                            BlendMode("ADDITIVE");
                            Type("GEOMETRY");
                            Model("dea_sfx_laserbeam_md1");
                        }
                    }
                }
            }
            ParticleEmitter("EnergyDrawn")
            {
                MaxParticles(1.0000,1.0000);
                StartDelay(0.0000,0.0000);
                BurstDelay(5.0000, 5.0000);
                BurstCount(1.0000,1.0000);
                MaxLodDist(2000.0000);
                MinLodDist(1900.0000);
                BoundingRadius(5.0);
                SoundName("")
                NoRegisterStep();
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
                    LifeTime(15.0000);
                    Position()
                    {
                        LifeTime(1.0000)
                    }
                    Size(0)
                    {
                        LifeTime(0.5000)
                        Scale(1.0000);
                    }
                    Color(0)
                    {
                        LifeTime(8.0000)
                        Move(0.0000,0.0000,0.0000,255.0000);
                        Next()
                        {
                            LifeTime(2.0000)
                            Move(0.0000,0.0000,0.0000,0.0000);
                            Next()
                            {
                                LifeTime(2.0000)
                                Move(0.0000,0.0000,0.0000,-255.0000);
                            }
                        }
                    }
                }
                Geometry()
                {
                    BlendMode("ADDITIVE");
                    Type("EMITTER");
                    Texture("dea_sfx_laserbeam1");
                    ParticleEmitter("Mesh")
                    {
                        MaxParticles(0.0000,0.0000);
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
                            Spread()
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
                            Hue(0, 0.0000, 0.0000);
                            Saturation(0, 0.0000, 0.0000);
                            Value(0, 255.0000, 255.0000);
                            Alpha(0, 255.0000, 255.0000);
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
                                LifeTime(0.5000)
                                Scale(1.0000);
                            }
                            Color(0)
                            {
                                LifeTime(1.0000)
                                Move(0.0000,0.0000,0.0000,0.0000);
                            }
                        }
                        Geometry()
                        {
                            BlendMode("ADDITIVE");
                            Type("GEOMETRY");
                            Model("dea1_bldg_froom_spinner");
                        }
                        ParticleEmitter("DrawnEnergy")
                        {
                            MaxParticles(-1.0000,-1.0000);
                            StartDelay(0.0000,0.0000);
                            BurstDelay(0.0100, 0.0100);
                            BurstCount(1.0000,1.0000);
                            MaxLodDist(2000.0000);
                            MinLodDist(1900.0000);
                            BoundingRadius(5.0);
                            SoundName("")
                            NoRegisterStep();
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
                                    PositionY(-1.0000,1.0000);
                                    PositionZ(-1.0000,1.0000);
                                }
                                Offset()
                                {
                                    PositionX(-0.5000,-0.5000);
                                    PositionY(3.2000,3.2000);
                                    PositionZ(0.0000,0.0000);
                                }
                                PositionScale(2.0000,4.0000);
                                VelocityScale(0.0000,0.0000);
                                InheritVelocityFactor(0.0000,0.0000);
                                Size(0, 0.0100, 0.0100);
                                Hue(0, 150.0000, 180.0000);
                                Saturation(0, 255.0000, 255.0000);
                                Value(0, 255.0000, 255.0000);
                                Alpha(0, 0.0000, 0.0000);
                                StartRotation(0, 0.0000, 360.0000);
                                RotationVelocity(0, 0.0000, 0.0000);
                                FadeInTime(0.0000);
                            }
                            Transformer()
                            {
                                LifeTime(0.3000);
                                Position()
                                {
                                    LifeTime(0.3000)
                                    Accelerate(-55.0000, 0.0000, 0.0000);
                                }
                                Size(0)
                                {
                                    LifeTime(0.2500)
                                    Scale(5.0000);
                                }
                                Color(0)
                                {
                                    LifeTime(0.2500)
                                    Move(-50.0000,0.0000,0.0000,255.0000);
                                }
                            }
                            Geometry()
                            {
                                BlendMode("ADDITIVE");
                                Type("SPARK");
                                SparkLength(0.0500);
                                Texture("com_sfx_laser_blue");
                            }
                        }
                    }
                }
                ParticleEmitter("EnergyCollected")
                {
                    MaxParticles(1.0000,1.0000);
                    StartDelay(3.0000,3.0000);
                    BurstDelay(0.0010, 0.0010);
                    BurstCount(1.0000,1.0000);
                    MaxLodDist(2000.0000);
                    MinLodDist(1900.0000);
                    BoundingRadius(5.0);
                    SoundName("")
                    NoRegisterStep();
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
                        LifeTime(12.0000);
                        Position()
                        {
                            LifeTime(1.0000)
                        }
                        Size(0)
                        {
                            LifeTime(0.5000)
                            Scale(1.0000);
                        }
                        Color(0)
                        {
                            LifeTime(5.0000)
                            Move(0.0000,0.0000,0.0000,255.0000);
                            Next()
                            {
                                LifeTime(5.5000)
                                Move(0.0000,0.0000,0.0000,0.0000);
                                Next()
                                {
                                    LifeTime(0.5000)
                                    Move(0.0000,0.0000,0.0000,-255.0000);
                                }
                            }
                        }
                    }
                    Geometry()
                    {
                        BlendMode("ADDITIVE");
                        Type("EMITTER");
                        Texture("dea_sfx_laserbeam1");
                        ParticleEmitter("Mesh")
                        {
                            MaxParticles(0.0000,0.0000);
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
                                Spread()
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
                                Hue(0, 0.0000, 0.0000);
                                Saturation(0, 0.0000, 0.0000);
                                Value(0, 255.0000, 255.0000);
                                Alpha(0, 255.0000, 255.0000);
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
                                    LifeTime(0.5000)
                                    Scale(1.0000);
                                }
                                Color(0)
                                {
                                    LifeTime(1.0000)
                                    Move(0.0000,0.0000,0.0000,0.0000);
                                }
                            }
                            Geometry()
                            {
                                BlendMode("ADDITIVE");
                                Type("GEOMETRY");
                                Model("dea1_bldg_froom_spinner");
                            }
                            ParticleEmitter("EnergyCollected")
                            {
                                MaxParticles(-1.0000,-1.0000);
                                StartDelay(0.0000,0.0000);
                                BurstDelay(0.0500, 0.0500);
                                BurstCount(1.0000,1.0000);
                                MaxLodDist(50.0000);
                                MinLodDist(10.0000);
                                BoundingRadius(5.0);
                                SoundName("")
                                NoRegisterStep();
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
                                        PositionY(0.0000,0.0000);
                                        PositionZ(0.0000,0.0000);
                                    }
                                    Offset()
                                    {
                                        PositionX(-9.0000,-9.0000);
                                        PositionY(3.3000,3.3000);
                                        PositionZ(0.0000,0.0000);
                                    }
                                    PositionScale(0.0000,0.0000);
                                    VelocityScale(0.0000,0.0000);
                                    InheritVelocityFactor(0.0000,0.0000);
                                    Size(0, 10.0000, 18.0000);
                                    Hue(0, 150.0000, 180.0000);
                                    Saturation(0, 255.0000, 255.0000);
                                    Value(0, 100.0000, 100.0000);
                                    Alpha(0, 0.0000, 0.0000);
                                    StartRotation(0, 0.0000, 360.0000);
                                    RotationVelocity(0, 0.0000, 0.0000);
                                    FadeInTime(0.0000);
                                }
                                Transformer()
                                {
                                    LifeTime(0.5000);
                                    Position()
                                    {
                                        LifeTime(0.5000)
                                    }
                                    Size(0)
                                    {
                                        LifeTime(0.5000)
                                        Scale(0.1500);
                                    }
                                    Color(0)
                                    {
                                        LifeTime(0.3000)
                                        Move(0.0000,0.0000,0.0000,255.0000);
                                        Next()
                                        {
                                            LifeTime(0.2000)
                                            Move(-170.0000,0.0000,155.0000,0.0000);
                                        }
                                    }
                                }
                                Geometry()
                                {
                                    BlendMode("ADDITIVE");
                                    Type("PARTICLE");
                                    Texture("com_sfx_smoke2");
                                }
                            }
                        }
                    }
                    ParticleEmitter("EnergyRings")
                    {
                        MaxParticles(1.0000,1.0000);
                        StartDelay(0.0000,0.0000);
                        BurstDelay(0.0010, 0.0010);
                        BurstCount(1.0000,1.0000);
                        MaxLodDist(2000.0000);
                        MinLodDist(1900.0000);
                        BoundingRadius(5.0);
                        SoundName("")
                        NoRegisterStep();
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
                            LifeTime(15.0000);
                            Position()
                            {
                                LifeTime(1.0000)
                            }
                            Size(0)
                            {
                                LifeTime(0.5000)
                                Scale(1.0000);
                            }
                            Color(0)
                            {
                                LifeTime(3.0000)
                                Move(0.0000,0.0000,0.0000,255.0000);
                                Next()
                                {
                                    LifeTime(10.5000)
                                    Move(0.0000,0.0000,0.0000,0.0000);
                                    Next()
                                    {
                                        LifeTime(1.5000)
                                        Move(0.0000,0.0000,0.0000,-255.0000);
                                    }
                                }
                            }
                        }
                        Geometry()
                        {
                            BlendMode("ADDITIVE");
                            Type("EMITTER");
                            Texture("dea_sfx_laserbeam1");
                            ParticleEmitter("Mesh")
                            {
                                MaxParticles(0.0000,0.0000);
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
                                    Spread()
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
                                    Hue(0, 0.0000, 0.0000);
                                    Saturation(0, 0.0000, 0.0000);
                                    Value(0, 255.0000, 255.0000);
                                    Alpha(0, 255.0000, 255.0000);
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
                                        LifeTime(0.5000)
                                        Scale(1.0000);
                                    }
                                    Color(0)
                                    {
                                        LifeTime(1.0000)
                                        Move(0.0000,0.0000,0.0000,0.0000);
                                    }
                                }
                                Geometry()
                                {
                                    BlendMode("ADDITIVE");
                                    Type("GEOMETRY");
                                    Model("dea1_bldg_froom_spinner");
                                }
                                ParticleEmitter("EnergyRing")
                                {
                                    MaxParticles(-1.0000,-1.0000);
                                    StartDelay(0.0000,0.0000);
                                    BurstDelay(0.2500, 0.2500);
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
                                            PositionX(0.0000,0.0000);
                                            PositionY(0.0000,0.0000);
                                            PositionZ(0.0000,0.0000);
                                        }
                                        Offset()
                                        {
                                            PositionX(-9.0000,-9.0000);
                                            PositionY(3.3000,3.3000);
                                            PositionZ(0.0000,0.0000);
                                        }
                                        PositionScale(0.0000,0.0000);
                                        VelocityScale(0.0000,0.0000);
                                        InheritVelocityFactor(0.0000,0.0000);
                                        Size(0, 5.9000, 5.9000);
                                        Hue(0, 80.0000, 120.0000);
                                        Saturation(0, 255.0000, 255.0000);
                                        Value(0, 255.0000, 255.0000);
                                        Alpha(0, 0.0000, 0.0000);
                                        StartRotation(0, 5.0000, 5.9000);
                                        RotationVelocity(0, 0.0000, 0.0000);
                                        FadeInTime(0.0000);
                                    }
                                    Transformer()
                                    {
                                        LifeTime(3.0000);
                                        Position()
                                        {
                                            LifeTime(3.0000)
                                        }
                                        Size(0)
                                        {
                                            LifeTime(6.0000)
                                            Scale(1.0000);
                                        }
                                        Color(0)
                                        {
                                            LifeTime(0.1000)
                                            Move(0.0000,0.0000,0.0000,64.0000);
                                            Next()
                                            {
                                                LifeTime(2.9000)
                                                Move(0.0000,0.0000,0.0000,-128.0000);
                                            }
                                        }
                                    }
                                    Geometry()
                                    {
                                        BlendMode("ADDITIVE");
                                        Type("BILLBOARD");
                                        Texture("com_sfx_flashring1");
                                    }
                                }
                            }
                        }
                        ParticleEmitter("ChargeSparks")
                        {
                            MaxParticles(1.0000,1.0000);
                            StartDelay(10.0000,10.0000);
                            BurstDelay(0.0010, 0.0010);
                            BurstCount(1.0000,1.0000);
                            MaxLodDist(2000.0000);
                            MinLodDist(1900.0000);
                            BoundingRadius(5.0);
                            SoundName("")
                            NoRegisterStep();
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
                                LifeTime(4.0000);
                                Position()
                                {
                                    LifeTime(1.0000)
                                }
                                Size(0)
                                {
                                    LifeTime(0.5000)
                                    Scale(1.0000);
                                }
                                Color(0)
                                {
                                    LifeTime(2.0000)
                                    Move(0.0000,0.0000,0.0000,255.0000);
                                    Next()
                                    {
                                        LifeTime(0.5000)
                                        Move(0.0000,0.0000,0.0000,0.0000);
                                        Next()
                                        {
                                            LifeTime(0.5000)
                                            Move(0.0000,0.0000,0.0000,-255.0000);
                                        }
                                    }
                                }
                            }
                            Geometry()
                            {
                                BlendMode("ADDITIVE");
                                Type("EMITTER");
                                Texture("dea_sfx_laserbeam1");
                                ParticleEmitter("Mesh")
                                {
                                    MaxParticles(0.0000,0.0000);
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
                                        Spread()
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
                                        Hue(0, 0.0000, 0.0000);
                                        Saturation(0, 0.0000, 0.0000);
                                        Value(0, 255.0000, 255.0000);
                                        Alpha(0, 255.0000, 255.0000);
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
                                            LifeTime(0.5000)
                                            Scale(1.0000);
                                        }
                                        Color(0)
                                        {
                                            LifeTime(1.0000)
                                            Move(0.0000,0.0000,0.0000,0.0000);
                                        }
                                    }
                                    Geometry()
                                    {
                                        BlendMode("ADDITIVE");
                                        Type("GEOMETRY");
                                        Model("dea1_bldg_froom_spinner");
                                    }
                                    ParticleEmitter("ChargeSparks")
                                    {
                                        MaxParticles(-1.0000,-1.0000);
                                        StartDelay(0.0000,0.0000);
                                        BurstDelay(0.0050, 0.0050);
                                        BurstCount(1.0000,1.0000);
                                        MaxLodDist(1100.0000);
                                        MinLodDist(1000.0000);
                                        BoundingRadius(5.0);
                                        SoundName("big_sparks")
                                        NoRegisterStep();
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
                                                PositionY(-1.0000,1.0000);
                                                PositionZ(-1.0000,1.0000);
                                            }
                                            Offset()
                                            {
                                                PositionX(-9.0000,-9.0000);
                                                PositionY(3.3000,3.3000);
                                                PositionZ(0.0000,0.0000);
                                            }
                                            PositionScale(-2.0000,-2.0000);
                                            VelocityScale(5.0000,5.0000);
                                            InheritVelocityFactor(0.0000,0.0000);
                                            Size(0, 0.0100, 0.0200);
                                            Red(0, 255.0000, 255.0000);
                                            Green(0, 0.0000, 0.0000);
                                            Blue(0, 0.0000, 0.0000);
                                            Alpha(0, 0.0000, 0.0000);
                                            StartRotation(0, 0.0000, 0.0000);
                                            RotationVelocity(0, -2.0000, 0.0000);
                                            FadeInTime(0.0000);
                                        }
                                        Transformer()
                                        {
                                            LifeTime(0.2000);
                                            Position()
                                            {
                                                LifeTime(0.1000)
                                                Scale(0.0000);
                                            }
                                            Size(0)
                                            {
                                                LifeTime(0.4000)
                                                Scale(30.0000);
                                            }
                                            Color(0)
                                            {
                                                LifeTime(0.0100)
                                                Reach(255.0000,50.0000,0.0000,255.0000);
                                                Next()
                                                {
                                                    LifeTime(0.0900)
                                                    Reach(255.0000,225.0000,100.0000,255.0000);
                                                }
                                            }
                                        }
                                        Geometry()
                                        {
                                            BlendMode("ADDITIVE");
                                            Type("SPARK");
                                            SparkLength(1.0000);
                                            Texture("com_sfx_flashball1");
                                            ParticleEmitter("Smoke")
                                            {
                                                MaxParticles(15.0000,15.0000);
                                                StartDelay(0.0000,0.0000);
                                                BurstDelay(0.1000, 0.2000);
                                                BurstCount(1.0000,1.0000);
                                                MaxLodDist(1000.0000);
                                                MinLodDist(800.0000);
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
                                                        PositionX(0.0000,0.0000);
                                                        PositionY(0.0000,0.0000);
                                                        PositionZ(0.0000,0.0000);
                                                    }
                                                    PositionScale(0.0000,0.0000);
                                                    VelocityScale(0.1000,0.1000);
                                                    InheritVelocityFactor(0.0000,0.0000);
                                                    Size(0, 0.6000, 0.9000);
                                                    Red(0, 240.0000, 255.0000);
                                                    Green(0, 240.0000, 255.0000);
                                                    Blue(0, 240.0000, 255.0000);
                                                    Alpha(0, 0.0000, 0.0000);
                                                    StartRotation(0, -50.0000, 0.0000);
                                                    RotationVelocity(0, -50.0000, 50.0000);
                                                    FadeInTime(0.0000);
                                                }
                                                Transformer()
                                                {
                                                    LifeTime(10.0000);
                                                    Position()
                                                    {
                                                        LifeTime(3.0000)
                                                    }
                                                    Size(0)
                                                    {
                                                        LifeTime(3.0000)
                                                        Scale(3.0000);
                                                    }
                                                    Color(0)
                                                    {
                                                        LifeTime(0.5000)
                                                        Move(255.0000,255.0000,255.0000,255.0000);
                                                        Next()
                                                        {
                                                            LifeTime(10.0000)
                                                            Reach(255.0000,255.0000,255.0000,255.0000);
                                                            Next()
                                                            {
                                                                LifeTime(0.0000)
                                                                Reach(255.0000,255.0000,255.0000,0.0000);
                                                            }
                                                        }
                                                    }
                                                }
                                                Geometry()
                                                {
                                                    BlendMode("NORMAL");
                                                    Type("PARTICLE");
                                                    Texture("underlitesmoke2");
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            ParticleEmitter("ChargeGlow")
                            {
                                MaxParticles(1.0000,1.0000);
                                StartDelay(11.0000,11.0000);
                                BurstDelay(0.0010, 0.0010);
                                BurstCount(1.0000,1.0000);
                                MaxLodDist(2000.0000);
                                MinLodDist(1900.0000);
                                BoundingRadius(5.0);
                                SoundName("")
                                NoRegisterStep();
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
                                    LifeTime(4.0000);
                                    Position()
                                    {
                                        LifeTime(1.0000)
                                    }
                                    Size(0)
                                    {
                                        LifeTime(0.5000)
                                        Scale(1.0000);
                                    }
                                    Color(0)
                                    {
                                        LifeTime(1.0000)
                                        Move(0.0000,0.0000,0.0000,255.0000);
                                        Next()
                                        {
                                            LifeTime(1.5000)
                                            Move(0.0000,0.0000,0.0000,0.0000);
                                            Next()
                                            {
                                                LifeTime(0.5000)
                                                Move(0.0000,0.0000,0.0000,-255.0000);
                                            }
                                        }
                                    }
                                }
                                Geometry()
                                {
                                    BlendMode("ADDITIVE");
                                    Type("EMITTER");
                                    Texture("dea_sfx_laserbeam1");
                                    ParticleEmitter("Mesh")
                                    {
                                        MaxParticles(0.0000,0.0000);
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
                                            Spread()
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
                                            Hue(0, 0.0000, 0.0000);
                                            Saturation(0, 0.0000, 0.0000);
                                            Value(0, 255.0000, 255.0000);
                                            Alpha(0, 255.0000, 255.0000);
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
                                                LifeTime(0.5000)
                                                Scale(1.0000);
                                            }
                                            Color(0)
                                            {
                                                LifeTime(1.0000)
                                                Move(0.0000,0.0000,0.0000,0.0000);
                                            }
                                        }
                                        Geometry()
                                        {
                                            BlendMode("ADDITIVE");
                                            Type("GEOMETRY");
                                            Model("dea1_bldg_froom_spinner");
                                        }
                                        ParticleEmitter("ChargeGLOW")
                                        {
                                            MaxParticles(-1.0000,-1.0000);
                                            StartDelay(0.0000,0.0000);
                                            BurstDelay(0.1000, 0.1000);
                                            BurstCount(1.0000,1.0000);
                                            MaxLodDist(50.0000);
                                            MinLodDist(10.0000);
                                            BoundingRadius(5.0);
                                            SoundName("")
                                            NoRegisterStep();
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
                                                    PositionY(0.0000,0.0000);
                                                    PositionZ(0.0000,0.0000);
                                                }
                                                Offset()
                                                {
                                                    PositionX(-9.0000,-9.0000);
                                                    PositionY(3.3000,3.3000);
                                                    PositionZ(0.0000,0.0000);
                                                }
                                                PositionScale(0.0000,0.0000);
                                                VelocityScale(0.0000,0.0000);
                                                InheritVelocityFactor(0.0000,0.0000);
                                                Size(0, 5.0000, 5.0000);
                                                Hue(0, 20.0000, 40.0000);
                                                Saturation(0, 255.0000, 255.0000);
                                                Value(0, 100.0000, 100.0000);
                                                Alpha(0, 0.0000, 0.0000);
                                                StartRotation(0, 0.0000, 360.0000);
                                                RotationVelocity(0, 0.0000, 0.0000);
                                                FadeInTime(0.0000);
                                            }
                                            Transformer()
                                            {
                                                LifeTime(0.5000);
                                                Position()
                                                {
                                                    LifeTime(0.5000)
                                                }
                                                Size(0)
                                                {
                                                    LifeTime(0.5000)
                                                    Scale(1.0000);
                                                }
                                                Color(0)
                                                {
                                                    LifeTime(0.3000)
                                                    Move(0.0000,0.0000,0.0000,255.0000);
                                                    Next()
                                                    {
                                                        LifeTime(0.2000)
                                                        Move(-170.0000,0.0000,155.0000,0.0000);
                                                    }
                                                }
                                            }
                                            Geometry()
                                            {
                                                BlendMode("ADDITIVE");
                                                Type("PARTICLE");
                                                Texture("com_sfx_flashball2");
                                            }
                                        }
                                    }
                                }
                                ParticleEmitter("BigBeam")
                                {
                                    MaxParticles(1.0000,1.0000);
                                    StartDelay(13.5000,13.5000);
                                    BurstDelay(0.0100, 0.0100);
                                    BurstCount(1.0000,1.0000);
                                    MaxLodDist(2000.0000);
                                    MinLodDist(1900.0000);
                                    BoundingRadius(5.0);
                                    SoundName("")
                                    NoRegisterStep();
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
                                        LifeTime(2.0000);
                                        Position()
                                        {
                                            LifeTime(1.0000)
                                        }
                                        Size(0)
                                        {
                                            LifeTime(13.5000)
                                            Scale(1.0000);
                                            Next()
                                            {
                                                LifeTime(2.0000)
                                                Scale(0.1000);
                                            }
                                        }
                                        Color(0)
                                        {
                                            LifeTime(0.0100)
                                            Move(0.0000,0.0000,0.0000,255.0000);
                                            Next()
                                            {
                                                LifeTime(0.7500)
                                                Move(0.0000,0.0000,0.0000,0.0000);
                                                Next()
                                                {
                                                    LifeTime(0.4000)
                                                    Move(0.0000,0.0000,0.0000,-255.0000);
                                                }
                                            }
                                        }
                                    }
                                    Geometry()
                                    {
                                        BlendMode("ADDITIVE");
                                        Type("EMITTER");
                                        Texture("dea_sfx_laserbeam1");
                                        ParticleEmitter("JetExhaust")
                                        {
                                            MaxParticles(-1.0000,-1.0000);
                                            StartDelay(0.0000,0.0000);
                                            BurstDelay(0.0020, 0.0020);
                                            BurstCount(1.0000,1.0000);
                                            MaxLodDist(50.0000);
                                            MinLodDist(10.0000);
                                            BoundingRadius(10.0);
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
                                                    PositionX(-1.0000,-1.0000);
                                                    PositionY(0.0000,0.0000);
                                                    PositionZ(0.0000,0.0000);
                                                }
                                                Offset()
                                                {
                                                    PositionX(-12.0000,-12.0000);
                                                    PositionY(3.3000,3.3000);
                                                    PositionZ(0.0000,0.0000);
                                                }
                                                PositionScale(0.0000,0.0000);
                                                VelocityScale(2500.0000,2500.0000);
                                                InheritVelocityFactor(0.0000,0.0000);
                                                Size(0, 3.0000, 4.0000);
                                                Red(0, 255.0000, 255.0000);
                                                Green(0, 255.0000, 255.0000);
                                                Blue(0, 128.0000, 128.0000);
                                                Alpha(0, 180.0000, 180.0000);
                                                StartRotation(0, 0.0000, 360.0000);
                                                RotationVelocity(0, 0.0000, 0.0000);
                                                FadeInTime(0.0000);
                                            }
                                            Transformer()
                                            {
                                                LifeTime(0.2000);
                                                Position()
                                                {
                                                    LifeTime(0.2000)
                                                }
                                                Size(0)
                                                {
                                                    LifeTime(0.2000)
                                                    Scale(1.0000);
                                                }
                                                Color(0)
                                                {
                                                    LifeTime(0.2000)
                                                    Move(0.0000,0.0000,0.0000,-180.0000);
                                                }
                                            }
                                            Geometry()
                                            {
                                                BlendMode("ADDITIVE");
                                                Type("PARTICLE");
                                                Texture("com_sfx_flashball1");
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
