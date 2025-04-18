SWBF Mod Tools

**EDITING THE SKY**

The sky is controlled by the ModID.SKY file located in the DataModID\\Worlds\\ModID\\World1 folder for each project. The sky file is a text file that can be edited with a text editor. Objects in the sky are not restricted to any formal outline; an unlimited number of objects can be placed in the sky in a variety of differet ways. What ultimately is important is objects placed in the sky appear in front of objects that are to appear in the background, and the Geonosis sky used as the template sky is a good demonstration of that.  
The default sky file contents appear below.
```C#
SkyInfo()
{
    ObjectVisibility(40.000000, 80.000000, 1600.000000);
    FogColor(252, 252, 252);
    FogRange(0.000000, 3000.000000);
    NearSceneRange(50.0, 220.0, 60.0, 300.0);
    FarSceneRange(450.000000, 1000.0);
    AmbientColor(120, 101, 76);
    TopDirectionalAmbientColor(120, 101, 76);
    BottomDirectionalAmbientColor(126, 70, 35);
    CharacterAmbientColor(209,156,73);
    VehicleAmbientColor(189, 136, 53);
    Enable(1559);
    FogRamp(3);
}

SunInfo()
{
    Angle(140.000005, -10.000011);
    Color(120, 120, 120);
    Texture("");
    Degree(90.000011);
    BackAngle(180.000022, 0.000000);
    BackColor(128, 128, 128);
    BackDegree(0.000000);
}

DomeInfo()
{
    Texture("SKY_Geonosis.tga");
    Angle(190.000005);
    Ambient(128.000038, 128.000038, 128.000038);
    Filter(1);
    Threshold(150);
    Intensity(50);
    Softness(1);
    SoftnessParam(60);

    PC()
    {
        TerrainBumpTexture("geo1_bump", 1.0);
    }
    DomeModel()
    {
        Geometry("geo_sky_dome");
    }
    DomeModel()
    {
        Geometry("geo_sky_arena");
        Offset(-20.0);
        MovementScale(0.995);
    }
    DomeModel()
    {
        Geometry("geo_sky_spire");
        Offset(-20.0);
        MovementScale(0.995);
    }
    DomeModel()
    {
        Geometry("geo_sky_dome_rim");
        Offset(10.0);
        MovementScale(0.995);
    }
    LowResTerrain()
    {
        Texture("geo1");
        PatchResolution(7);
        FogNear(300.0);
        FogFar(700.0);
        FogColor(142,82,38, 128);
        DetailTexture("geo1_far_detail");
        DetailTextureScale(0.25);
    }
}

//Big rep flyer
SkyObject()
{
    Geometry("rep_fly_assault_DOME");
    NumObjects(2);
    Height(200, 300);
    VelocityZ(20, 50);
    Distance(1500);
    InDirectionFactor(2);
}

//Rep fighters
SkyObject()
{
    Geometry("rep_fly_gunship_DOME");
    NumObjects(20);
    Height(80, 140);
    VelocityZ(80, 120);
    VelocityY(-10, 10);
    Distance(600);
    InDirectionFactor(0.5);
}

//CIS fighters
SkyObject()
{
    Geometry("cis_fly_droidfighter_DOME");
    NumObjects(20);
    Height(80, 140);
    VelocityZ(80, 100);
    VelocityY(-10, 10);
    Distance(300);
    InDirectionFactor(0.5);
}

//CIS rockets
SkyObject()
{
    Geometry("cis_fly_techounion_DOME");
    NumObjects(8);
    Height(0, 0);
    VelocityY(10, 12);
    Acceleration(0.0, 2.0, 0.0);
    Distance(1000);
    LifeTime(80.0);
}
```

SKYINFO  
The SkyInfo properties define the global sky properties.These are mostly self-explanatory and their settings adjusted to see the effects in game. Again the sky files provided with the assets for the worlds that shipped with the game are a great resource for sky file settings and their effects.

SUNINFO  
The SunInfo defines the actual sun object properties. No texture is used for the sun in the template, but one could be.

DOMEINFO  
DomeInfo defines the actual dome and objects contained by the dome object. One object is mandatory, and that is the dome itself. The dome geometry shape is not limited to a spherical shape, it could just as easy be a cube. The dome model gemoetry is exported from Softimage XSI. In the template sky there are objects for the arena and the spire in the background. These are separate objects but they could have just as easily been a static part of the sky texture. When lifting off in a flyer, having the objects in front of the sky texture provides a different sense of perspective on the object while rising. If the objects were in the sky texture they would not change as the camera position rose above the world. With them as objects in front of the sky texture their MovementScale can be adjusted to provide a sense of closeness to the object as the camera peers over it.  
LowResTerrain is the texture displayed for objects outside of the near visbility range. A good way to create a texture for this is using the ADVANCED IMAGE controls in Zeroeditor. In the Advanced Image Controls panel there is a button labeled Save HiRes Map. This button will save a huge image (4096x4096) of the terrain that can then be scaled down to 512x512 in order to maintain the image quality.

SKYBOJECTS  
SkyObjects are objects that appear in the sky and not the dome. Specifically these are the capital ships and fighters that can be seen flying throughout the sky. These make use of special dome models that have less complex geometry and therefore utilize little memory. These objects must be included in the mission lua in order to load.