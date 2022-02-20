ParticleEmitter("Shockwave")
{
    MaxParticles(1.0000,1.0000);
    StartDelay(0.0000,0.0000);
    BurstDelay(0.0010, 0.0010);
    BurstCount(1.0000,1.0000);
    MaxLodDist(2200.0000);
    MinLodDist(2000.0000);
    BoundingRadius(30.0);
    SoundName("com_weap_obj_med_exp defer")
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
        Size(0, 70.0000, 70.0000);
        Red(0, 255.0000, 255.0000);
        Green(0, 209.0000, 209.0000);
        Blue(0, 140.0000, 140.0000);
        Alpha(0, 128.0000, 128.0000);
        StartRotation(0, 0.0000, 5.0000);
        RotationVelocity(0, 0.0000, 0.0000);
        FadeInTime(0.0000);
    }
    Transformer()
    {
        LifeTime(0.8000);
        Position()
        {
            LifeTime(0.5000)
        }
        Size(0)
        {
            LifeTime(0.8000)
            Scale(6.0000);
        }
        Color(0)
        {
            LifeTime(0.8000)
            Move(0.0000,0.0000,0.0000,-128.0000);
        }
    }
    Geometry()
    {
        BlendMode("ADDITIVE");
        Type("BILLBOARD");
        Texture("com_sfx_flashring1");
    }
    ParticleEmitter("Shockwave")
    {
        MaxParticles(1.0000,1.0000);
        StartDelay(0.0000,0.0000);
        BurstDelay(0.5000, 0.5000);
        BurstCount(1.0000,1.0000);
        MaxLodDist(2200.0000);
        MinLodDist(2000.0000);
        BoundingRadius(30.0);
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
            Size(0, 60.0000, 60.0000);
            Red(0, 255.0000, 255.0000);
            Green(0, 255.0000, 255.0000);
            Blue(0, 255.0000, 255.0000);
            Alpha(0, 0.0000, 0.0000);
            StartRotation(0, 0.0000, 360.0000);
            RotationVelocity(0, 0.0000, 0.0000);
            FadeInTime(0.0000);
        }
        Transformer()
        {
            LifeTime(2.0000);
            Position()
            {
                LifeTime(0.5000)
            }
            Size(0)
            {
                LifeTime(2.0000)
                Scale(2.5000);
            }
            Color(0)
            {
                LifeTime(0.2000)
                Move(0.0000,-100.0000,-100.0000,255.0000);
                Next()
                {
                    LifeTime(1.8000)
                    Move(0.0000,0.0000,0.0000,-255.0000);
                }
            }
        }
        Geometry()
        {
            BlendMode("ADDITIVE");
            Type("PARTICLE");
            Texture("spa_sfx_shockwave1");
        }
        ParticleEmitter("Explosion")
        {
            MaxParticles(6.0000,6.0000);
            StartDelay(0.0000,0.0000);
            BurstDelay(0.0010, 0.0010);
            BurstCount(1.0000,1.0000);
            MaxLodDist(2100.0000);
            MinLodDist(2000.0000);
            BoundingRadius(30.0);
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
                    PositionX(-14.0000,14.0000);
                    PositionY(8.0000,14.0000);
                    PositionZ(-14.0000,14.0000);
                }
                Offset()
                {
                    PositionX(0.0000,0.0000);
                    PositionY(0.0000,0.0000);
                    PositionZ(0.0000,0.0000);
                }
                PositionScale(21.0000,21.0000);
                VelocityScale(4.5000,9.0000);
                InheritVelocityFactor(50.0000,50.0000);
                Size(0, 23.1000, 46.2000);
                Red(0, 255.0000, 255.0000);
                Green(0, 255.0000, 255.0000);
                Blue(0, 255.0000, 255.0000);
                Alpha(0, 255.0000, 255.0000);
                StartRotation(0, 0.0000, 360.0000);
                RotationVelocity(0, -100.0000, 100.0000);
                FadeInTime(0.0000);
            }
            Transformer()
            {
                LifeTime(4.0000);
                Position()
                {
                    LifeTime(3.0000)
                    Scale(0.0000);
                }
                Size(0)
                {
                    LifeTime(3.0000)
                }
                Color(0)
                {
                    LifeTime(3.0000)
                    Reach(255.0000,255.0000,255.0000,255.0000);
                }
            }
            Geometry()
            {
                BlendMode("NORMAL");
                Type("EMITTER");
                Texture("explode3");
                ParticleEmitter("Smoke")
                {
                    MaxParticles(4.0000,4.0000);
                    StartDelay(0.0000,0.0000);
                    BurstDelay(0.0750, 0.0750);
                    BurstCount(1.0000,1.0000);
                    MaxLodDist(1000.0000);
                    MinLodDist(800.0000);
                    BoundingRadius(30.0);
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
                            PositionX(-23.1000,23.1000);
                            PositionY(-23.1000,23.1000);
                            PositionZ(-23.1000,23.1000);
                        }
                        Offset()
                        {
                            PositionX(0.0000,0.0000);
                            PositionY(0.0000,0.0000);
                            PositionZ(0.0000,0.0000);
                        }
                        PositionScale(0.0000,0.0000);
                        VelocityScale(11.5500,11.5500);
                        InheritVelocityFactor(0.2500,0.2500);
                        Size(0, 10.5000, 14.0000);
                        Hue(0, 0.0000, 0.0000);
                        Saturation(0, 0.0000, 0.0000);
                        Value(0, 150.0000, 255.0000);
                        Alpha(0, 0.0000, 128.0000);
                        StartRotation(0, 0.0000, 360.0000);
                        RotationVelocity(0, -90.0000, 90.0000);
                        FadeInTime(0.0000);
                    }
                    Transformer()
                    {
                        LifeTime(3.0000);
                        Position()
                        {
                            LifeTime(3.0000)
                            Scale(0.0000);
                        }
                        Size(0)
                        {
                            LifeTime(0.5000)
                            Scale(2.5000);
                            Next()
                            {
                                LifeTime(2.5000)
                                Scale(2.5000);
                            }
                        }
                        Color(0)
                        {
                            LifeTime(0.2000)
                            Move(0.0000,0.0000,0.0000,55.0000);
                            Next()
                            {
                                LifeTime(2.8000)
                                Move(0.0000,0.0000,-20.0000,-255.0000);
                            }
                        }
                    }
                    Geometry()
                    {
                        BlendMode("NORMAL");
                        Type("PARTICLE");
                        Texture("com_sfx_smoke3");
                        ParticleEmitter("BlackSmoke")
                        {
                            MaxParticles(4.0000,4.0000);
                            StartDelay(0.0000,0.0000);
                            BurstDelay(0.0250, 0.0250);
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
                                    PositionX(-60.6376,60.6376);
                                    PositionY(-60.6376,60.6376);
                                    PositionZ(-60.6376,60.6376);
                                }
                                Offset()
                                {
                                    PositionX(-3.0340,3.0340);
                                    PositionY(-3.0340,3.0340);
                                    PositionZ(-3.0340,3.0340);
                                }
                                PositionScale(0.0000,0.0000);
                                VelocityScale(60.6376,60.6376);
                                InheritVelocityFactor(0.2000,0.2000);
                                Size(0, 30.3200, 42.4472);
                                Hue(0, 12.0000, 20.0000);
                                Saturation(0, 5.0000, 10.0000);
                                Value(0, 200.0000, 220.0000);
                                Alpha(0, 0.0000, 0.0000);
                                StartRotation(0, -20.0000, 20.0000);
                                RotationVelocity(0, -20.0000, 20.0000);
                                FadeInTime(0.0000);
                            }
                            Transformer()
                            {
                                LifeTime(3.0000);
                                Position()
                                {
                                    LifeTime(3.0000)
                                    Scale(0.0000);
                                }
                                Size(0)
                                {
                                    LifeTime(4.0000)
                                    Scale(6.0000);
                                }
                                Color(0)
                                {
                                    LifeTime(0.2000)
                                    Move(0.0000,0.0000,0.0000,255.0000);
                                    Next()
                                    {
                                        LifeTime(2.8000)
                                        Move(0.0000,0.0000,0.0000,-255.0000);
                                    }
                                }
                            }
                            Geometry()
                            {
                                BlendMode("NORMAL");
                                Type("PARTICLE");
                                Texture("thicksmoke3");
                            }
                        }
                    }
                    ParticleEmitter("Flames")
                    {
                        MaxParticles(4.0000,4.0000);
                        StartDelay(0.0000,0.0000);
                        BurstDelay(0.0750, 0.0750);
                        BurstCount(1.0000,1.0000);
                        MaxLodDist(1000.0000);
                        MinLodDist(800.0000);
                        BoundingRadius(30.0);
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
                                PositionX(-23.1000,23.1000);
                                PositionY(-23.1000,23.1000);
                                PositionZ(-23.1000,23.1000);
                            }
                            Offset()
                            {
                                PositionX(-2.3100,2.3100);
                                PositionY(-2.3100,2.3100);
                                PositionZ(-2.3100,2.3100);
                            }
                            PositionScale(0.0000,0.0000);
                            VelocityScale(23.1000,23.1000);
                            InheritVelocityFactor(0.2500,0.2500);
                            Size(0, 2.3100, 4.6200);
                            Red(0, 255.0000, 255.0000);
                            Green(0, 204.0000, 233.0000);
                            Blue(0, 98.0000, 185.0000);
                            Alpha(0, 0.0000, 128.0000);
                            StartRotation(0, 0.0000, 255.0000);
                            RotationVelocity(0, -160.0000, 160.0000);
                            FadeInTime(0.0000);
                        }
                        Transformer()
                        {
                            LifeTime(2.0000);
                            Position()
                            {
                                LifeTime(2.0000)
                                Scale(0.0000);
                            }
                            Size(0)
                            {
                                LifeTime(0.2000)
                                Scale(4.0000);
                                Next()
                                {
                                    LifeTime(1.8000)
                                    Scale(3.0000);
                                }
                            }
                            Color(0)
                            {
                                LifeTime(0.2000)
                                Move(0.0000,-40.0000,-50.0000,128.0000);
                                Next()
                                {
                                    LifeTime(1.0000)
                                    Move(128.0000,-40.0000,-50.0000,-128.0000);
                                    Next()
                                    {
                                        LifeTime(0.8000)
                                        Move(128.0000,-50.0000,-50.0000,-128.0000);
                                    }
                                }
                            }
                        }
                        Geometry()
                        {
                            BlendMode("ADDITIVE");
                            Type("PARTICLE");
                            Texture("com_sfx_explosion1");
                            ParticleEmitter("BlackSmoke")
                            {
                                MaxParticles(3.0000,3.0000);
                                StartDelay(0.0000,0.0000);
                                BurstDelay(0.0250, 0.0250);
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
                                        PositionX(-60.6376,60.6376);
                                        PositionY(-60.6376,60.6376);
                                        PositionZ(-60.6376,60.6376);
                                    }
                                    Offset()
                                    {
                                        PositionX(-3.0340,3.0340);
                                        PositionY(-3.0340,3.0340);
                                        PositionZ(-3.0340,3.0340);
                                    }
                                    PositionScale(0.0000,0.0000);
                                    VelocityScale(86.6252,86.6252);
                                    InheritVelocityFactor(0.1000,0.1000);
                                    Size(0, 12.1276, 24.2552);
                                    Red(0, 254.0000, 255.0000);
                                    Green(0, 172.0000, 179.0000);
                                    Blue(0, 75.0000, 89.0000);
                                    Alpha(0, 0.0000, 0.0000);
                                    StartRotation(0, -20.0000, 20.0000);
                                    RotationVelocity(0, -20.0000, 20.0000);
                                    FadeInTime(0.0000);
                                }
                                Transformer()
                                {
                                    LifeTime(2.5000);
                                    Position()
                                    {
                                        LifeTime(3.0000)
                                        Scale(0.0000);
                                    }
                                    Size(0)
                                    {
                                        LifeTime(2.5000)
                                        Scale(5.0000);
                                    }
                                    Color(0)
                                    {
                                        LifeTime(0.0200)
                                        Move(0.0000,0.0000,0.0000,48.0000);
                                        Next()
                                        {
                                            LifeTime(2.4800)
                                            Move(0.0000,0.0000,0.0000,-64.0000);
                                        }
                                    }
                                }
                                Geometry()
                                {
                                    BlendMode("ADDITIVE");
                                    Type("PARTICLE");
                                    Texture("thicksmoke3");
                                }
                            }
                        }
                    }
                }
            }
            ParticleEmitter("Explosion")
            {
                MaxParticles(6.0000,6.0000);
                StartDelay(0.0000,0.0000);
                BurstDelay(0.0010, 0.0010);
                BurstCount(1.0000,1.0000);
                MaxLodDist(2200.0000);
                MinLodDist(2000.0000);
                BoundingRadius(30.0);
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
                        PositionX(-14.0000,14.0000);
                        PositionY(8.0000,14.0000);
                        PositionZ(-14.0000,14.0000);
                    }
                    Offset()
                    {
                        PositionX(0.0000,0.0000);
                        PositionY(0.0000,0.0000);
                        PositionZ(0.0000,0.0000);
                    }
                    PositionScale(21.0000,21.0000);
                    VelocityScale(4.5000,9.0000);
                    InheritVelocityFactor(50.0000,50.0000);
                    Size(0, 23.1000, 46.2000);
                    Red(0, 255.0000, 255.0000);
                    Green(0, 255.0000, 255.0000);
                    Blue(0, 255.0000, 255.0000);
                    Alpha(0, 255.0000, 255.0000);
                    StartRotation(0, 0.0000, 360.0000);
                    RotationVelocity(0, -100.0000, 100.0000);
                    FadeInTime(0.0000);
                }
                Transformer()
                {
                    LifeTime(4.0000);
                    Position()
                    {
                        LifeTime(3.0000)
                        Scale(0.0000);
                    }
                    Size(0)
                    {
                        LifeTime(3.0000)
                    }
                    Color(0)
                    {
                        LifeTime(3.0000)
                        Reach(255.0000,255.0000,255.0000,255.0000);
                    }
                }
                Geometry()
                {
                    BlendMode("NORMAL");
                    Type("EMITTER");
                    Texture("explode3");
                    ParticleEmitter("Smoke")
                    {
                        MaxParticles(4.0000,4.0000);
                        StartDelay(0.0000,0.0000);
                        BurstDelay(0.0750, 0.0750);
                        BurstCount(1.0000,1.0000);
                        MaxLodDist(1000.0000);
                        MinLodDist(800.0000);
                        BoundingRadius(30.0);
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
                                PositionX(-23.1000,23.1000);
                                PositionY(-23.1000,23.1000);
                                PositionZ(-23.1000,23.1000);
                            }
                            Offset()
                            {
                                PositionX(0.0000,0.0000);
                                PositionY(0.0000,0.0000);
                                PositionZ(0.0000,0.0000);
                            }
                            PositionScale(0.0000,0.0000);
                            VelocityScale(11.5500,11.5500);
                            InheritVelocityFactor(0.2500,0.2500);
                            Size(0, 10.5000, 14.0000);
                            Hue(0, 0.0000, 0.0000);
                            Saturation(0, 0.0000, 0.0000);
                            Value(0, 128.0000, 255.0000);
                            Alpha(0, 0.0000, 128.0000);
                            StartRotation(0, 0.0000, 360.0000);
                            RotationVelocity(0, -90.0000, 90.0000);
                            FadeInTime(0.0000);
                        }
                        Transformer()
                        {
                            LifeTime(3.0000);
                            Position()
                            {
                                LifeTime(3.0000)
                                Scale(0.0000);
                            }
                            Size(0)
                            {
                                LifeTime(0.5000)
                                Scale(2.5000);
                                Next()
                                {
                                    LifeTime(2.5000)
                                    Scale(2.5000);
                                }
                            }
                            Color(0)
                            {
                                LifeTime(0.2000)
                                Move(0.0000,0.0000,0.0000,55.0000);
                                Next()
                                {
                                    LifeTime(2.8000)
                                    Move(0.0000,0.0000,-20.0000,-255.0000);
                                }
                            }
                        }
                        Geometry()
                        {
                            BlendMode("NORMAL");
                            Type("PARTICLE");
                            Texture("com_sfx_smoke3");
                            ParticleEmitter("BlackSmoke")
                            {
                                MaxParticles(4.0000,4.0000);
                                StartDelay(0.0000,0.0000);
                                BurstDelay(0.0250, 0.0250);
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
                                        PositionX(-60.6376,60.6376);
                                        PositionY(-60.6376,60.6376);
                                        PositionZ(-60.6376,60.6376);
                                    }
                                    Offset()
                                    {
                                        PositionX(-3.0340,3.0340);
                                        PositionY(-3.0340,3.0340);
                                        PositionZ(-3.0340,3.0340);
                                    }
                                    PositionScale(0.0000,0.0000);
                                    VelocityScale(60.6376,60.6376);
                                    InheritVelocityFactor(0.2000,0.2000);
                                    Size(0, 30.3200, 42.4472);
                                    Hue(0, 12.0000, 20.0000);
                                    Saturation(0, 5.0000, 10.0000);
                                    Value(0, 200.0000, 220.0000);
                                    Alpha(0, 0.0000, 0.0000);
                                    StartRotation(0, -20.0000, 20.0000);
                                    RotationVelocity(0, -20.0000, 20.0000);
                                    FadeInTime(0.0000);
                                }
                                Transformer()
                                {
                                    LifeTime(3.0000);
                                    Position()
                                    {
                                        LifeTime(3.0000)
                                        Scale(0.0000);
                                    }
                                    Size(0)
                                    {
                                        LifeTime(4.0000)
                                        Scale(6.0000);
                                    }
                                    Color(0)
                                    {
                                        LifeTime(0.2000)
                                        Move(0.0000,0.0000,0.0000,255.0000);
                                        Next()
                                        {
                                            LifeTime(2.8000)
                                            Move(0.0000,0.0000,0.0000,-255.0000);
                                        }
                                    }
                                }
                                Geometry()
                                {
                                    BlendMode("NORMAL");
                                    Type("PARTICLE");
                                    Texture("thicksmoke3");
                                }
                            }
                        }
                        ParticleEmitter("Flames")
                        {
                            MaxParticles(4.0000,4.0000);
                            StartDelay(0.0000,0.0000);
                            BurstDelay(0.0750, 0.0750);
                            BurstCount(1.0000,1.0000);
                            MaxLodDist(1000.0000);
                            MinLodDist(800.0000);
                            BoundingRadius(30.0);
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
                                    PositionX(-23.1000,23.1000);
                                    PositionY(-23.1000,23.1000);
                                    PositionZ(-23.1000,23.1000);
                                }
                                Offset()
                                {
                                    PositionX(-2.3100,2.3100);
                                    PositionY(-2.3100,2.3100);
                                    PositionZ(-2.3100,2.3100);
                                }
                                PositionScale(0.0000,0.0000);
                                VelocityScale(23.1000,23.1000);
                                InheritVelocityFactor(0.2500,0.2500);
                                Size(0, 2.3100, 4.6200);
                                Red(0, 255.0000, 255.0000);
                                Green(0, 204.0000, 233.0000);
                                Blue(0, 98.0000, 185.0000);
                                Alpha(0, 0.0000, 128.0000);
                                StartRotation(0, 0.0000, 255.0000);
                                RotationVelocity(0, -160.0000, 160.0000);
                                FadeInTime(0.0000);
                            }
                            Transformer()
                            {
                                LifeTime(2.0000);
                                Position()
                                {
                                    LifeTime(2.0000)
                                    Scale(0.0000);
                                }
                                Size(0)
                                {
                                    LifeTime(0.2000)
                                    Scale(4.0000);
                                    Next()
                                    {
                                        LifeTime(1.8000)
                                        Scale(3.0000);
                                    }
                                }
                                Color(0)
                                {
                                    LifeTime(0.2000)
                                    Move(0.0000,-40.0000,-50.0000,128.0000);
                                    Next()
                                    {
                                        LifeTime(1.0000)
                                        Move(128.0000,-40.0000,-50.0000,-128.0000);
                                        Next()
                                        {
                                            LifeTime(0.8000)
                                            Move(128.0000,-50.0000,-50.0000,-128.0000);
                                        }
                                    }
                                }
                            }
                            Geometry()
                            {
                                BlendMode("ADDITIVE");
                                Type("PARTICLE");
                                Texture("com_sfx_explosion1");
                                ParticleEmitter("BlackSmoke")
                                {
                                    MaxParticles(3.0000,3.0000);
                                    StartDelay(0.0000,0.0000);
                                    BurstDelay(0.0250, 0.0250);
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
                                            PositionX(-60.6376,60.6376);
                                            PositionY(-60.6376,60.6376);
                                            PositionZ(-60.6376,60.6376);
                                        }
                                        Offset()
                                        {
                                            PositionX(-3.0340,3.0340);
                                            PositionY(-3.0340,3.0340);
                                            PositionZ(-3.0340,3.0340);
                                        }
                                        PositionScale(0.0000,0.0000);
                                        VelocityScale(86.6252,86.6252);
                                        InheritVelocityFactor(0.1000,0.1000);
                                        Size(0, 12.1276, 24.2552);
                                        Red(0, 254.0000, 255.0000);
                                        Green(0, 172.0000, 179.0000);
                                        Blue(0, 75.0000, 89.0000);
                                        Alpha(0, 0.0000, 0.0000);
                                        StartRotation(0, -20.0000, 20.0000);
                                        RotationVelocity(0, -20.0000, 20.0000);
                                        FadeInTime(0.0000);
                                    }
                                    Transformer()
                                    {
                                        LifeTime(2.5000);
                                        Position()
                                        {
                                            LifeTime(3.0000)
                                            Scale(0.0000);
                                        }
                                        Size(0)
                                        {
                                            LifeTime(2.5000)
                                            Scale(5.0000);
                                        }
                                        Color(0)
                                        {
                                            LifeTime(0.0200)
                                            Move(0.0000,0.0000,0.0000,48.0000);
                                            Next()
                                            {
                                                LifeTime(2.4800)
                                                Move(0.0000,0.0000,0.0000,-64.0000);
                                            }
                                        }
                                    }
                                    Geometry()
                                    {
                                        BlendMode("ADDITIVE");
                                        Type("PARTICLE");
                                        Texture("thicksmoke3");
                                    }
                                }
                            }
                        }
                    }
                }
                ParticleEmitter("Flare")
                {
                    MaxParticles(6.0000,6.0000);
                    StartDelay(0.0000,0.0000);
                    BurstDelay(0.0000, 0.0000);
                    BurstCount(6.0000,6.0000);
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
                        InheritVelocityFactor(50.0000,50.0000);
                        Size(0, 50.0000, 50.0000);
                        Red(0, 255.0000, 255.0000);
                        Green(0, 240.0000, 240.0000);
                        Blue(0, 200.0000, 200.0000);
                        Alpha(0, 128.0000, 128.0000);
                        StartRotation(0, 1.0000, 3.0000);
                        RotationVelocity(0, 0.0000, 0.0000);
                        FadeInTime(0.0000);
                    }
                    Transformer()
                    {
                        LifeTime(3.5000);
                        Position()
                        {
                            LifeTime(2.0000)
                        }
                        Size(0)
                        {
                            LifeTime(2.5000)
                        }
                        Color(0)
                        {
                            LifeTime(1.5000)
                            Move(0.0000,0.0000,0.0000,-96.0000);
                            Next()
                            {
                                LifeTime(2.0000)
                                Move(0.0000,0.0000,0.0000,-48.0000);
                            }
                        }
                    }
                    Geometry()
                    {
                        BlendMode("ADDITIVE");
                        Type("BILLBOARD");
                        Texture("com_sfx_flashball2");
                    }
                    ParticleEmitter("Flare")
                    {
                        MaxParticles(2.0000,2.0000);
                        StartDelay(0.0000,0.0000);
                        BurstDelay(0.0000, 0.0000);
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
                            InheritVelocityFactor(50.0000,50.0000);
                            Size(0, 55.0000, 55.0000);
                            Red(0, 255.0000, 255.0000);
                            Green(0, 240.0000, 240.0000);
                            Blue(0, 200.0000, 200.0000);
                            Alpha(0, 255.0000, 255.0000);
                            StartRotation(0, 1.0000, 3.0000);
                            RotationVelocity(0, 0.0000, 0.0000);
                            FadeInTime(0.0000);
                        }
                        Transformer()
                        {
                            LifeTime(2.5000);
                            Position()
                            {
                                LifeTime(2.0000)
                            }
                            Size(0)
                            {
                                LifeTime(2.5000)
                            }
                            Color(0)
                            {
                                LifeTime(1.5000)
                                Move(0.0000,0.0000,0.0000,-192.0000);
                                Next()
                                {
                                    LifeTime(1.0000)
                                    Move(0.0000,0.0000,0.0000,-64.0000);
                                }
                            }
                        }
                        Geometry()
                        {
                            BlendMode("ADDITIVE");
                            Type("PARTICLE");
                            Texture("com_sfx_flashball2");
                        }
                        ParticleEmitter("Embers")
                        {
                            MaxParticles(6.0000,6.0000);
                            StartDelay(0.0000,0.0000);
                            BurstDelay(0.0010, 0.0010);
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
                                    PositionX(-3.5000,3.5000);
                                    PositionY(2.0000,3.5000);
                                    PositionZ(-3.5000,3.5000);
                                }
                                Offset()
                                {
                                    PositionX(0.0000,0.0000);
                                    PositionY(0.0000,0.0000);
                                    PositionZ(0.0000,0.0000);
                                }
                                PositionScale(17.5000,17.5000);
                                VelocityScale(4.5000,9.0000);
                                InheritVelocityFactor(50.0000,50.0000);
                                Size(0, 21.0000, 42.0000);
                                Red(0, 255.0000, 255.0000);
                                Green(0, 200.0000, 255.0000);
                                Blue(0, 150.0000, 200.0000);
                                Alpha(0, 255.0000, 255.0000);
                                StartRotation(0, 0.0000, 360.0000);
                                RotationVelocity(0, -10.0000, 10.0000);
                                FadeInTime(0.0000);
                            }
                            Transformer()
                            {
                                LifeTime(3.0000);
                                Position()
                                {
                                    LifeTime(4.0000)
                                    Scale(0.0000);
                                }
                                Size(0)
                                {
                                    LifeTime(5.0000)
                                    Scale(2.0000);
                                }
                                Color(0)
                                {
                                    LifeTime(1.0000)
                                    Move(0.0000,0.0000,0.0000,-20.0000);
                                    Next()
                                    {
                                        LifeTime(1.0000)
                                        Move(0.0000,-150.0000,-200.0000,-15.0000);
                                        Next()
                                        {
                                            LifeTime(1.0000)
                                            Move(0.0000,-100.0000,-100.0000,-220.0000);
                                        }
                                    }
                                }
                            }
                            Geometry()
                            {
                                BlendMode("ADDITIVE");
                                Type("PARTICLE");
                                Texture("com_sfx_dirt2");
                            }
                            ParticleEmitter("Sparks")
                            {
                                MaxParticles(20.0000,20.0000);
                                StartDelay(0.0000,0.0000);
                                BurstDelay(0.0010, 0.0010);
                                BurstCount(5.0000,5.0000);
                                MaxLodDist(50.0000);
                                MinLodDist(10.0000);
                                BoundingRadius(5.0);
                                SoundName("")
                                Size(1.0000, 1.0000);
                                Red(255.0000, 255.0000);
                                Green(255.0000, 255.0000);
                                Blue(255.0000, 255.0000);
                                Alpha(255.0000, 255.0000);
                                Spawner()
                                {
                                    Circle()
                                    {
                                        PositionX(-7.0000,7.0000);
                                        PositionY(3.0000,7.0000);
                                        PositionZ(-7.0000,7.0000);
                                    }
                                    Offset()
                                    {
                                        PositionX(0.0000,0.0000);
                                        PositionY(0.0000,0.0000);
                                        PositionZ(0.0000,0.0000);
                                    }
                                    PositionScale(21.0000,42.0000);
                                    VelocityScale(35.0000,245.0000);
                                    InheritVelocityFactor(50.0000,50.0000);
                                    Size(0, 0.3500, 1.0500);
                                    Red(0, 255.0000, 255.0000);
                                    Green(0, 255.0000, 255.0000);
                                    Blue(0, 255.0000, 255.0000);
                                    Alpha(0, 128.0000, 255.0000);
                                    StartRotation(0, 0.0000, 0.0000);
                                    RotationVelocity(0, 0.0000, 0.0000);
                                    FadeInTime(0.0000);
                                }
                                Transformer()
                                {
                                    LifeTime(6.0000);
                                    Position()
                                    {
                                        LifeTime(4.0000)
                                        Scale(0.0000);
                                    }
                                    Size(0)
                                    {
                                        LifeTime(6.0000)
                                        Scale(0.0000);
                                    }
                                    Color(0)
                                    {
                                        LifeTime(4.0000)
                                        Move(0.0000,0.0000,0.0000,0.0000);
                                        Next()
                                        {
                                            LifeTime(2.0000)
                                            Move(0.0000,0.0000,0.0000,-255.0000);
                                        }
                                    }
                                }
                                Geometry()
                                {
                                    BlendMode("ADDITIVE");
                                    Type("SPARK");
                                    SparkLength(0.1000);
                                    Texture("com_sfx_laser_orange");
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
