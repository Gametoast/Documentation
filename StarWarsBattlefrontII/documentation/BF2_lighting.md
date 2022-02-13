**Battlefront 2 Lighting System**

This document explains the key features to understanding lighting parameters and their affect on the rendering system.

# Getting Light Into The Game

There are two ways in which a light can be placed into a game 1) through an attached odf 2) by placing a light in the editor. The preferred method for added lights is through the editor so we have all the lighting information in one place. If you need a light to be animated then it is better to attach the light to animatable object.

## Attached Lights

In order to create a light in the game there must be an associated light ODF. The ODF holds all the parameters for a light. Lights can then be attached to hard points by using attached ODFs. Light ODFs are also responsible for putting a light beam or light flare on a light. The follow lists all the different type of light parameters that can be used. Parameters and values are in ODF format (ie. Parameter = Value).

| **Parameter** | **Value** | **Description** |
| --- | --- | --- |
| Color | "<red[0-255]> <green[0-255]> <blue[0-255]>" | Color of the light |
| OmniRadius | <radius in meters, 0.0 disables> | Sets the radius of the point light |
| FlareIntensity | <intensity[0.0-1.0], 0.0 disables> | Sets the flare brightness relative to the light. Flares have some performance cost, so disable when possible. |
| FlickerType | <value>0 or None1 or Strobe2 or StrobeRandom3 or StrobeFade4 or Pulse5 or Flicker |
no flickeron/off regularly every <period> secondson/off randomly 0 to <period> secondson and fade out every <period> secondsfade up/down every <period> secondsrandomly chooses an intensity every <period> seconds |
| FlickerPeriod | <period in seconds> | Controls the period for the flicker type |
| ConeLength | <length in meters, 0.0 disables> | Sets the length to the inner arc of vertices (start of fade) |
| ConeInitialWidth | <width> or "<width x> <width z>" for oblong head | Also controls the size of flare when looking at it from the side. |
| ConeWidth | <width> or <width x> <width z>" for oblong tail | Also controls the size of the flare when looking directly down the axis. |
| ConeFadeLength | <length in meters> | Sets the additional length to the outer 0 alpha arc of vertices. Large compared to ConeWidth produces rounder fadeout. Small compared to ConeWidth produces squarer fade out |
| ConeFadeFactor | <fade [0.0-1.0]> | Sets the alpha of the inner arc of vertices |
| HaloRadius | <radius in meters, 0.0 disables> | Sets the radius of the inner ring of vertices (start of fade) |
| HaloFadeLength | <length in meters> | Sets the additional radius to the outer 0 alpha ring of vertices |
| HaloFadeFactor | <fade [0.0-1.0]> | Sets the alpha of the inner ring of vertices |

Below are some examples of various types of lights and effects along with the light ODF parameters. These examples only show snippets of the ODF parameters, such as color and radius, can be set to whatever the user desires.

| **Example 1** |
| --- |
| …FlareIntensity = 1.0BeamIntensity = 0.0OmniLightRadius = 0.0ConeLength = 1.0ConeWidth = 5.0ConeInitialWidth = 1.0… |
| Turns off the light beam and light, but leaves a flare. The ConeInitialWidth and ConeWidth parameters control the size of the flare when looking at it from the side versus directly down the axis, respectively. |

| **Example 2** |
| --- |
| …ConeLength = 10.0ConeFadeFactor = 0.3ConeFadeLength = 0.6… |
| Creates a beam with a very diffuse rounded end. You probably want to decrease the fade factor a bit if you make the fade length small. |

| **Example 3** |
| --- |
| …ConeLength = 10.0ConeFadeFactor = 0.05ConeFadeLength = 0.05… |
| Creates a beam with a very square bottom edge. You probably want to decrease the fade factor a bit if you make the fade length small. |

| **Example 4** |
| --- |
| …ConeWidth = "2.0 4.0"ConeInitialWidth = "0.5 1.0"… |
| Specifies an oblong light beam which has aspect ratio 2.0. If you only specify one value, you'll get a circular source or cone. |

## Editor Lights

There are 4 types of lights: abmient (includes top and bottom), directional light, point light, and spot light. There are some common parameters to all lights types and each type has additional parameters that affect only that type.

![](images/lighting_ze1.png)

### Light Parameters

| **Editor Parameters** |
| --- |
| **Name** | **Description** |
| Dir Light Icon Size | the size of the directional light icon |
| --- | --- |
| Spot/Omni Icons | whether or not to display in wireframe or solid mode |
| --- | --- |
| Show Real Lighting | turns lighting on and off |
| --- | --- |

| **Common Parameters** |
| --- |
| **Name** | **Description** |
| Casts Shadows | whether or not the light should cast shadows |
| --- | --- |
| Static | whether the light has been burned into ALL "-vertexlighting" objects (this is explained more in the section below) |
| --- | --- |
| Texture | a texture that acts as a mask for the light |
| --- | --- |
| Wrap Mode | the wrap mode for the texture |
| --- | --- |
| Blend Mode (PS2 only) | how the light texture should be blended |
| --- | --- |
| Color | the color of the light |
| --- | --- |

| **Directional Parameters** |
| --- |
| **Name** | **Description** |
| Bounding Region | the name of a region. Only objects in the region will be affected by the light. The name should be the region name you type in the "Type" edit box. If no name is specified it will affect all objects. |
| --- | --- |

| **Omni Parameters** |
| --- |
| **Name** | **Description** |
| Radius | the size of the omni light |
| --- | --- |

| **Spot Parameters** |
| --- |
| **Name** | **Description** |
| Range | the length of the spot light |
| --- | --- |
| Inner | the inner cone angle of the light |
| --- | --- |
| Outer | the outer cone angle of the light |
| --- | --- |
| Bidirectional | whether or not the spot light should have a double cone (useful for light becon |
| --- | --- |

### Global Light Settings

The global light settings are lights that are always present unless excluded by a "Shadow" region. The global light settings are described below.

| **Global Light Settings** |
| --- |
| **Name** | **Description** |
| Directional Light 1 | The name of the directional light that should be considered a global light |
| --- | --- |
| Directional Light 2 | the name of a second directional light that should be a global light |
| --- | --- |
| Top Ambient | The ambient color that comes from the top of the world |
| --- | --- |
| Bottom Ambient | the ambient color that comes from the bottom of the world |
| --- | --- |
| Environment Map | the environment/reflection map that environment mapped objects should use |
| --- | --- |

### Shadow Regions

A shadow region redefines how to interpret the global light settings. You can create a shadow region by placing a region and setting its type to "Shadow". The shadow region properties let you attenuate each directional light, set new ambient colors, and assign a new environment map for that region.

# Misc Topics

- Each object can only be affected by at most 1 ambient light, 2 directional lights, 4 omni lights (3 on PS2) and 1 spot light. If more lights affect an object then a heuristic is used to choose the "best" lights to use.
- Statically lit objects (any msh tagged with –vertexlighting) take lighting from non-static lights (any light that isn't marked as static). However it is required that these objects are vertex lit offline. Static lights include ambient light. Start by painting all vertices the ambient color and then selectively add areas of light.
- Shadowed lights should not overlap
- Areas that have local shadows should be more tessellated for better shadow fading

**Glow (or HDR)**

Glow will bloom bright light sources that you specifically tag under the lighting drop down box in the edit flags.  The HDR effect is off by default.  All parameters are adjustable from the console with the prefix "HDR." Below is a description of all the parameters along with their default values:
```C
Effect("HDR")
{
    Enable(0)               // whether or not the hdr effect should be enabled
    DownSizeFactor(0.25)    // what fraction of the back buffer to use when bloom (smaller means
                            // better framerate – don't go below 0.25)

    NumBloomPasses(5)       // the number of blur passes higher numbers means bigger blooms and
                            // is more costly

    MaxTotalWeight(1.2)     // the amount to over-brighten the glow areas

    GlowThreshold(0.5)      // value at which a pixel is considered to be blooming lower values

    // mean more pixels will be blooming
    GlowFactor(1.0)         // a factor used to dim the overall appearance of the bloom (probably
                            // better to use less bloom passes or less total weight)
}
```
**Attaching lights to materials**

This is used for when you want some emissive polygons to animate according to the light intensity.  In the mesh option file specify the following:

-attachlight "<nodename> <lightname>"

<nodename> is the name of the xsi node that contains the geometry you want to animate

<lightname> is the name of the light (you specify the name of the light in the light odf – see docs)

NOTE: the quotation marks are needed!

Removing/Adding light to a vertex lit object

This is used if you already vertex lit a mesh and you want to brighten/darken it.  You can specify how much light to add/subtract in the mesh option file using the following option:

-ambientlighting “r=<-1.0-1.0> g=<-1.0..1.0> b=<-1.0..1.0>“

The r,g,b parameters specify how much light to add/subtract from each color channel.

NOTE: the quotation marks are needed!

**Shadow parameters**

I added some parameters that globally effect shadows.  Below is a description of the parameters along with the default values:
```C
Effect("Shadow")
{
    Enable(1)               // whether or not shadows should be enabled
    BlurEnable(0)           // whether or not to blur the shadows
    Intensity(1.0)          // intensity of the shadow
}
```


**Blur**

Blur will be off by default now if you want to enable it add it to the .fx file.  It would be better if it was not used because it is expensive, not worth the cost and it is better to enable features such as HDR and soft shadows.  I'm considering removing it from the game because the HDR effect does similar processing.

#