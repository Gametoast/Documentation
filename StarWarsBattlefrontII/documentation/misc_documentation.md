# Texture Munge

## Parameters

Below is complete list of all the texture munge parameters will a brief description. A more detailed description of more complicated parameters can be found in the next section.

| Option | Platform | Description |
| --- | --- | --- |
| -maps &lt;int&gt; | Any | Restricts number of mipmaps to N. 0 extracts all mipmaps down to 1x1. Default is 4 on PS2, 0 on other systems |
| -bordercolor &lt;hexcolor&gt; | Any | All mipmaps will set the color of a 1 pixel wide border on all sides to the given color, specified in HTML style hex RGB format (i.e. ff8000 is orange, 000080 is dark blue, etc.) |
| -borderalpha &lt;hex&gt; | Any | All mipmaps will set the alpha of a 1 pixel wide border on all sides to the given alpha, specified in hex format (00 is min, ff is max (255), 80 is half) |
| -ubordercolor &lt;hexcolor&gt; | Any | As –bordercolor, but only left and right edges. |
| -vbordercolor &lt;hexcolor&gt; | Any | As –bordercolor, but only top and bottom edges. |
| -uborderalpha &lt;hex&gt; | Any | As –borderalpha, but only left and right edges. |
| -vborderalpha &lt;hex&gt; | Any | As –borderalpha, but only top and bottom edges. |
| -saturation &lt;float&gt; | Any | Adjust the saturation of this image. 0.0 converts to grayscale, 0.5 is default, 1.0 fully saturates all pixels. |
| -32bit | PS2 | Export non-palettized 8bit per channel image. |
| -8bit | PS2 | Export 256 color palettized image (the default). |
| -4bit | PS2 | Export 16 color palettized image. |
| -compress | PS2 | Convert this image to a grayscale detail map plus a half size color map – a form of compression. |
| -dither &lt;float&gt; | PS2 | Set the level for dithering between palette colors to produce colors not in the palette. Default 0.5. |
| -nodither | PS2 | Alias for –dither 0.0, i.e. no dithering. |
| -forcemip &lt;hexcolor&gt; | PS2 | Force all mipmaps to the given color, causing them to fade to a constant color at the mip distance. Always use –maps 2 with this option. |
| -mipdistance &lt;float&gt; | PS2 | Set the distance at which this texture will use mipmaps. Default is -1.0 which tells the game engine to use the game engine default distance. |
| -cubemap | PC/Xbox | Convert this image to a cube map. The input texture should be 4 faces wide by 3 faces tall with the center row and first column making up the faces of a cube unwrapped into a cross shape. |
| -volume | PC/Xbox | Convert this image into a volume map. Use the -depth option to specify the number of layers in the map. The input image should be height\*depth pixels tall, with the top layer in the first row and the bottom layer in the last row. |
| -depth &lt;int&gt; | PC/Xbox | Specify the number of layers in a volume map. |
| -bumpmap | PC/Xbox | Treat the input texture as a grayscale height map to be converted into an RGB normal map. Only RGB or RGBA output formats will work. (see below). If the input texture and output format both have an alpha channel, it will be copied. |
| -hiqbumpmap | PC/Xbox | As –bumpmap, but uses a different algorithm that does not introduce a pixel offset, but can lose some single pixel details. |
| -overridenzto1 | PC/Xbox | For bumpmaps, override the blue channel (the normal z component) to one for use with certain shaders. (see below) |
| -bumpscale &lt;float&gt; | PC/Xbox | For bumpmaps, scale the heightmap by the given factor when generating the normal map. |
| -format &lt;string&gt;-forceformat &lt;string&gt; | PC/Xbox | Set the output format of this texture. See below for a list of all valid formats for each platform. |
| -detailbias &lt;int&gt; | PC | When selecting what resolution to keep as the highest mipmap based on the user&#39;s graphics settings, bias this texture toward higher resolutions. 0 is default, 7 will essentially guarantee no reduction of resolution for large images. See below for a full description. |

##

## Parameter Details

### -format &lt;string&gt;

A full list of format strings and properties follows below.

Note that many PC cards do not support all of the luminosity and alpha only textures such as A8, L8, or A8L8 in game.

The size of a texture will be width\*height\*bits\_per\_pixel/8. For a 256x256 texture, this ranges from 32kb for 4bpp DXT1 compressed to 256kb for 32bpp A8R8G8B8 format.

| **Special Format** | **Platform** | **Description** |
| --- | --- | --- |
| Detail | Any | Interpret input texture as a grayscale detail map. If the input texture is all black or all white and has an alpha channel, get the detail map from the alpha channel, otherwise use the luminosity of the color channel. Output in a format appropriate for each platform. Detail maps should have average value about 128. |
| Terrain\_Detail | Any | As Detail, but interpret as terrain detail map. |
| Bump | PC/Xbox | Interpret input texture color as normals and choose an output format appropriate for a bumpmap without an alpha channel. Use with –bumpmap option to convert a grayscale heightmap and output as a bumpmap. |
| Terrain\_Bump | PC/Xbox | As Bump, but output in a format appropriate for terrain bump mapping. |
| Bump\_Alpha | PC/Xbox | As Bump, but if the input texture has an alpha channel, keep it in the output texture. |
| Terrain\_Bump\_Alpha | PC/Xbox | As Bump\_Alpha but output in a format appropriate for terrain bump mapping. |
| Compressed\_Alpha | PC/Xbox | Choose a format of minimal size appropriate for input texture. If the input texture has 1 bit or no alpha, use DXT1, else if the input texture is grayscale, use a luminosity format, else use DXT3. |
| Compressed | PC/Xbox | Force the input alpha to 1 bit, and choose an appropriate format. If the texture is grayscale, use L8, otherwise DXT1. |
| DXT1 | PC/Xbox | 4 bits per channel, block compressed to 4 bits per pixel. 0 or 1 bit alpha per pixel. |
| DXT3 | PC/Xbox | 4 bits per channel, block compressed to 8 bits per pixel with 4 bit alpha per pixel. |
| A8R8G8B8 | PC/Xbox | 32 bits per pixel, 8 bit color, 8 bit alpha. |
| X8R8G8B8 | PC/Xbox | 32 bits per pixel, 8 bit color, no alpha. |
| A4R4G4B4 | PC/Xbox | 16 bits per pixel, 4 bit color and alpha. |
| A1R5G5B5 | PC/Xbox | 16 bits per pixel, 5 bit color and 1 bit alpha. |
| R5G6B5 | PC/Xbox | 16 bits per pixel, 5+ bit color, no alpha. |
| X1R5G5B5 | PC/Xbox | 16 bits per pixel, 5 bit color, no alpha. |
| A8L8 | Xbox/(PC) | 16 bits per pixel, 8 bit gray with 8 bit alpha. |
| A8 | Xbox/(PC) | 8 bits per pixel, 8 bit alpha, color forced to white. |
| L8 | Xbox/(PC) | 8 bits per pixel, 8 bit gray, no alpha. |
| A4L4 | Xbox/(PC) | 8 bits per pixel, 4 bit gray, 4 bit alpha. |

### -detailbias &lt;int&gt;

On the PC, this option controls how the texture is reduced if the user sets texture quality to low or medium.

Textures are capped to a maximum byte size based on the texture quality – 128K for medium, 64K for low quality. Setting the bias will raise the cap for this texture by a factor of 2 for each detail bias step.

-detailbias 7 will keep any but the largest textures from resizing down.

The following chart summarizes the results of this operation for square textures. Non-square textures are handled according to total size, so a 64x256 will resize down as many steps as a 128x128.


 | Low (bias 0) | Low (bias 1) | Low(bias 2) | Low(3) | Low(4) | Low(5) |
| --- | --- | --- | --- | --- | --- | --- |
| **Format** |
 | Med (bias 0) | Med(bias 1) | Med(2)  | Med(3) | Med(4)  |
| DXT1  | 256  | 256 | 512 | 512 | 1024 | 1024 |
| DXTn/L8 | 128 | 256 | 256 | 512 | 512 | 1024 |
| 16bit  | 128 | 128 | 256 | 256 | 512 | 512 |
| 32bit | 64 | 128 | 128 | 256 | 256 | 512 |

## Bump Map Options

Every bump map needs to have an option file.  Each bump map should have the following options:

-format bump (or terrain\_bump, or bump\_alpha, or terrain\_bump\_alpha)

If the input image file is a grayscale height map, as opposed to a normal map generated by some tool, it should also specify:

-bumpmap or –hiqbumpmap

-bumpscale &lt;value&gt; to set the steepness of the bumps (6.0 is a good starting value)

One more note about bump mapping: a lot of the time a diffuse texture will have shadowing burned into the texture.  Ideally, for bump mapped materials, you should try to remove any shadowing from the diffuse texture, since the bump mapping will put in shadows dynamically.

# Model Munge

## Parameters

Below is complete list of all the texture munge parameters will a brief description. A more detailed description can be found in the next section.

| Option | Platform | Description |
| --- | --- | --- |
| -keep &lt;string&gt; | Any | Keep the named node as a hardpoint in the exported skeleton. |
| -keepall | Any | Keep all nodes as hardpoints. |
| -keepmaterial &lt;string&gt; | Any | Do not combine geometry attached to the named node with other geometry, so that it may be accessed in game to set material properties, such as texture scrolling, dynamically. |
| -righthanded-lefthanded | Any | For historical reasons, msh files are stored in lefthanded format, and must be mirrored along the Z axis to make them right-handed. **–righthanded is now the default.** |
| -scale &lt;float&gt; | Any | Rescale this model by the given factor when exporting. Default is 1.0 (no change). |
| -maxbones &lt;int&gt; | Any | If this model is skinned, split the skinned segments up so that no segment accesses too many bones. Default is 32 on PS2 or Xbox, 16 on PC. |
| -lodgroup &lt;string&gt; | Any | Set the LOD group of this model to one of: model, bigmodel, soldier, or hugemodel. Default is model. |
| -lodbias &lt;float&gt; | Any | Set a bias on the distance at which this model will LOD. Larger numbers will cause the model to remain detailed at larger distances. Default is 1.0 (no bias). |
| -nocollision | Any | Do not export collision geometry for this model. |
| -nogamemodel | Any | Do not export LODing data for this model. |
| -hiresshadow &lt;int&gt; | Any | Generate a shadow volume directly from object geometry for the given LOD or 0 if no int is given. |
| -shadowon | PS2 | Export any shadow volumes this model has. Default on the PS2 is no shadow volumes. On the Xbox and PC, shadow volumes are always exported. |
| -softskinshadow | Xbox/PC | If the model has a skinned shadow volume, export full 3 bone skinning weights. This is expensive at run time. Default behavior is to reduce all shadow volumes to hard skinning (1 bone per vertex). |
| -hardskinonly | Any | Force all skinned segments to 1 bone hard skinning. |
| -softskin | Any | Export full 3 bone soft skinning weights for segments which are not explicitly hardskinned.Default behavior is hard skinning on PS2 or Xbox, and both on PC (hard skinning for fixed function, soft skinning for vertex shader enabled cards) |
| -donotmergeskins | Any | If this option is not set, any model with at least one skinned segment will have all non-skinned segments merged together into one hard skinned segment for performance reasons. |
| -vertexlighting | Any | If this model has any geometry with vertex colors, interpret them as burned in vertex lighting. Default behavior is to interpret them as a modifier to the diffuse color of the object. |
| -additiveemissive | Any | Interpret any materials in this model with the lit checkbox unchecked as additive blended. |
| -bump &lt;string&gt; &lt;…&gt; | Xbox/PC | Any normal materials with a diffuse texture listed by name after –bump will be converted to use bump mapping using the texture &lt;diffusetex&gt;\_bump |
| -boundingboxscale &lt;float&gt; | Any | Adjust the scale of the bounding box for this model by the given factor. |
| -boundingboxoffsetx &lt;float&gt;-boundingboxoffsety &lt;float&gt;-boundingboxoffsetz&lt;float&gt;-boundingboxoffsetnz &lt;float&gt; | Any | Adjust the location of the bounding box for this model by the given translation. To set a negative offset for z, use –boundingboxoffsetnz. |
| -kcollision | Any |
 |
| -donotmergecollision | Any |
 |
| -removeverticesonmerge | Any |

# In-Game Console Commands

The new command console commands are:

Lighting.SunColor &lt;red&gt; &lt;green&gt; &lt;blue&gt;

Lighting.SunDirection &lt;heightangle&gt; &lt;directionangle&gt;

Lighting.ShadowColor &lt;red&gt; &lt;green&gt; &lt;blue&gt;

For static/buildings:

Lighting.AmbientColor &lt;red&gt; &lt;green&gt; &lt;blue&gt;

For dynamic/characters:

Lighting.TopAmbientColor &lt;red&gt; &lt;green&gt; &lt;blue&gt;

Lighting.BottomAmbientColor &lt;red&gt; &lt;green&gt; &lt;blue&gt;

Any of these can be used without any parameters to just print the current value.

I added console command for all the parameters above so you can tweak the parameters on the fly here are the commands

Blur.Enable

Blur.MinDepth

Blur.MaxDepth

ColorControl.Enable

ColorControl.GammaContrast

ColorControl.GammaBrightness

ColorControl.WorldContrast

ColorControl.WorldBrightness

ColorControl.WorldSaturation

# ODF Parameters

## Ordnance Collision

Add this line to an odf and the ordnances will ignore the collision:

OrdnanceCollision =       &quot;none&quot;

## Water Effects

For Soldiers, the water effect will happen whenever a foot of a soldier goes into the water.  Add the following line to a soldier odf:

FootWaterSplashEffect = &quot;particle effect name&quot;

For Hover Vehicles, the water effect will happen whenever a hover goes on the water.  Add the following line to a hover odf:

WaterEffect = &quot;particle effect name&quot;

I finished adding the code for the water effects.  You can add water effects to soldiers, explosions, and bullets

For Soldiers, the water effect will happen whenever a soldier falls into water such as jumping.  Add the following line to a soldier odf:

WaterSplashEffect = &quot;particle effect name&quot;

For explosions, the particle effect will happen at the surface of the water whenever an explosion happens underneath the water.  Add the following line to an explosion odf:

WaterEffect = &quot;particle effect name&quot;

For bullets, the particle effect will happen at the surface of the water whenever a bullet hits the water.  Add the following line to a bullet odf:

ImpactEffectWater = &quot;particle effect name&quot;

# Effects in the world ENVFX file

## Blur

I added parameters so you can tweak the xbox parameters for color and bluring
```C#
Effect("Blur")
{
    Enable(0);                                     // enables/disables blur effect
    MinMaxDepth(0.95,1.0);                         // the distance where blurring starts and stops
}
```
## Color Control
```C#
Effect("ColorControl")
{
    Enable(1);                      // enables/disables color adjustments
    GammaContrast(0.53);            // changes the gamma curve to introduce more contrast effects everything on screen (including interface)
    GammaBrightness(0.5);           // changes the gamma curve to add more brightness
    WorldContrast(0.5);             // changes the contrast of the world (excludes interface)
    WorldBrightness(0.5);           // changes the brightness of the world (excludes interface)
    WorldSaturation(0.5);           // changes the saturation of the world (excludes interface)
}
```
notes:

0.5 is neutral for all color controls

changing the gamma controls is free (but changes the interface images as well), changing the world controls is a lot more expensive

if you don&#39;t want to change the world controls set them to 0.5 this effectively turns them off

## Sun Flare

The sun flare is now in the game.  Here is a description of the tunable parameters.  They are located in yavin.fx.  The sky with the sun flare built in need to be taken out because it will make the sun really big with the new flare.

    Color(255, 255, 255): the color of the sun (the beams use this color as well)

    Size(5.0): the size of the sun

    FlareOutSize(40.0): the length of the light beams

    NumFlareOuts(40): this is a smoothing factor for the light beams (if the number is too low you will see steps in the beams).  Don&#39;t make this value too high because it will make the sun expensive to render.

    InitialFlareOutAlpha(70): this will control how dark the light beams are

    The halo around the sun consists of three rings.  You can make one ring fade into another one in order to get more color complexity.  The first number is the size of the ring and the rest is the color of the ring

    HaloInnerRing(0.0, 255, 255, 255, 255):

    HaloMiddleRing(5.0, 255, 150, 0, 128);

    HaloOutterRing(40.0, 255, 0, 0, 0);

    SpikeColor(230,230,0,128): the color of the sharp spike coming out the of the sun

## Water

Here is the description of the video options that you may need to tweak:

Tile =&gt; how much the main texture gets tiled (used on all qualities)

Velocity =&gt; how fast the main texture is moving (used on low quality)

RefractionColor =&gt; the color of the water (used on all qualities)

SpecularMaskTile =&gt; the tiled amount for the specular texures (used on low quality)

SpecularMaskScrollSpeed =&gt; the scroll speed for the specular textures (used on low quality)

Go through all the worlds with water on them (yav1, kas1, kas2, nab2) and try all three qualities for each world.  You can change the quality by pressing &quot;ESC&quot; and selecting &quot;Video Options&quot; then select the water quality you want.

# Lighting in the world SKY file

Lighting with the current engine works differently on the three supported platforms. It is important to understand the differences in order to get the best looking results.

## Ambient Light

Ambient light is used to brighten the overall scene. The ambient light should not be too bright because it causes the world to look more flat by removing depth cues in the lighting. Certain objects in the world can receive different ambient levels as well as there can be regions which override the ambient light.

### Character Ambient

### Vehicle Ambient

### World Ambient

I added a directional ambient feature to the PC and Xbox.  If it works out, Salah can add it to the PS2 version.  This is how it works:  in the sky file (in the sky info section) you can specify two new ambient colors: TopDirectionalAmbientColor() and BottomDirectionalAmbientColor().  These colors only affect objects that use the character ambient color.  If no directional ambient colors are specified everything will render the same as before.  The way the directional ambient works is the top parts of an object will use the top ambient color and the bottom parts will use the bottom ambient color.  All the other parts will use some blending of the two colors.  You can also override the directional ambient colors in shadow region in a similar manner you can override the character ambient color.  In the name of the shadow region you can specify &quot;colortop&quot; and &quot;colorbottom&quot;.  If you have any questions come see me.

## Static Lighting

Statically lit objects take lighting from non-static lights (any light that isn&#39;t marked as static). However it is required that these objects are vertex lit offline. Below are the instructions on how to create a statically lit object in the game:

1. Open the mesh you want to statically light in XSI
2. Place exact replicas of the static lights in XSI using the same position and radius
3. Light the mesh using XSI.
4. Add the &quot;-vertexlighting&quot; option in the MSH option file that mesh
5. Add &quot;Static = 1&quot; in the light odf

Anything that is not tagged with &quot;-vertexlighting&quot; will now be affected by the light.

## Light ODF

In order to create a light in the game there must be an associated light ODF. The ODF holds all the parameters for a light. Lights can then be attached to hard points by using attached ODFs. Light ODFs are also responsible for putting a light beam or light flare on a light. The follow lists all the different type of light parameters that can be used. Parameters and values are in ODF format (ie. Parameter = Value).

| **Parameter** | **Value** | **Description** |
| --- | --- | --- |
| Color | &quot;&lt;red[0-255]&gt; &lt;green[0-255]&gt; &lt;blue[0-255]&gt;&quot; | Color of the light |
| OmniRadius | &lt;radius in meters, 0.0 disables&gt; | Sets the radius of the point light |
| FlareIntensity | &lt;intensity[0.0-1.0], 0.0 disables&gt; | Sets the flare brightness relative to the light. Flares have some performance cost, so disable when possible. |
| FlickerType | &lt;value&gt;0 or None1 or Strobe2 or StrobeRandom3 or StrobeFade4 or Pulse5 or Flicker |
no flickeron/off regularly every &lt;period&gt; secondson/off randomly 0 to &lt;period&gt; secondson and fade out every &lt;period&gt; secondsfade up/down every &lt;period&gt; secondsrandomly chooses an intensity every &lt;period&gt; seconds |
| FlickerPeriod | &lt;period in seconds&gt; | Controls the period for the flicker type |
| ConeLength | &lt;length in meters, 0.0 disables&gt; | Sets the length to the inner arc of vertices (start of fade) |
| ConeInitialWidth | &lt;width&gt; or &quot;&lt;width x&gt; &lt;width z&gt;&quot; for oblong head | Also controls the size of flare when looking at it from the side. |
| ConeWidth | &lt;width&gt; or &lt;width x&gt; &lt;width z&gt;&quot; for oblong tail | Also controls the size of the flare when looking directly down the axis. |
| ConeFadeLength | &lt;length in meters&gt; | Sets the additional length to the outer 0 alpha arc of vertices. Large compared to ConeWidth produces rounder fadeout. Small compared to ConeWidth produces squarer fade out |
| ConeFadeFactor | &lt;fade [0.0-1.0]&gt; | Sets the alpha of the inner arc of vertices |
| HaloRadius | &lt;radius in meters, 0.0 disables&gt; | Sets the radius of the inner ring of vertices (start of fade) |
| HaloFadeLength | &lt;length in meters&gt; | Sets the additional radius to the outer 0 alpha ring of vertices |
| HaloFadeFactor | &lt;fade [0.0-1.0]&gt; | Sets the alpha of the inner ring of vertices |

Below are some examples of various types of lights and effects along with the light ODF parameters. These examples only show snippets of the ODF parameters, such as color and radius, can be set to whatever the user desires.

**Example 1**
```
FlareIntensity = 1.0
BeamIntensity = 0.0
OmniLightRadius = 0.0
ConeLength = 1.0 
ConeWidth = 5.0
ConeInitialWidth = 1.0
```
 Turns off the light beam and light, but leaves a flare. The ConeInitialWidth and ConeWidth parameters control the size of the flare when looking at it from the side versus directly down the axis, respectively.

**Example 2**
```
ConeLength = 10.0
ConeFadeFactor = 0.3
ConeFadeLength = 0.6
```
Creates a beam with a very diffuse rounded end. You probably want to decrease the fade factor a bit if you make the fade length small.

**Example 3**
```
ConeLength = 10.0
ConeFadeFactor = 0.05
ConeFadeLength = 0.05
```
Creates a beam with a very square bottom edge. You probably want to decrease the fade factor a bit if you make the fade length small.

**Example 4**
```
ConeWidth = "2.0 4.0"
ConeInitialWidth = "0.5 1.0"
```
Specifies an oblong light beam which has aspect ratio 2.0. If you only specify one value, you&#39;ll get a circular source or cone.

# Console Commands in the Editor

## High Resolution Terrain Map

Editor.savehiresmap &lt;width&gt; &lt;height&gt;

This command allows arbitrary dimensions for saving a top down snapshot of the terrain.

# Regions in the Editor

## Shadow Regions

### Name Prefix: shadow

### Parameters: key=value, key matched to minimum number of characters
directional=&lt;float(0.0-1.0)&gt;

Set the intensity of the global directional light (sun light) in this region. Matches d=, di=, dir=, etc.
ambient=&lt;float(0.0-1.0)&gt;

Set the intensity of the global ambient light in this region, relative to the local ambient color. 0.0 means all local, 0.5 means a blend of half local, half global. Matches a=, am=, amb=, …
color=&lt;int(red)&gt;,&lt;int(green)&gt;,&lt;int(blue)&gt;

Set the local ambient color (top and bottom on xbox/pc) for this region. Matches c=, co=, col=, …
colortop=&lt;int(red)&gt;,&lt;int(green)&gt;,&lt;int(blue)&gt;

Set the local top ambient color for the xbox/pc for this region. Matches colort=, colorto=, …
colorbottom=&lt;int(red)&gt;,&lt;int(green)&gt;,&lt;int(blue)&gt;

Set the local bottom ambient color for the xbox/pc for this region. Matches colorb=, colorbo=, …

 Usage: Use box, cylinder, or sphere type.

 Results: Dynamic objects (characters, vehicles, and items) within the region will use the given lighting parameters instead of the global parameters. Lighting parameters will blend with the global parameters over a 5 meter radius on the outside edge of each region.

 Questions to: Jason Scanlin or David Givone.

## Reflection Regions

 Name Prefix: reflection
 Parameters: none

Usage: Use box or cylinder type; bottom plane represents reflection plane.

Results: Objects within region which support faked reflection will be rendered a second time, reflected by the bottom plane of the region.

Questions to: Jason Scanlin or David Givone.

## Rain Shadow Regions
Name Prefix: rainshadow
Parameters: none
Usage: Use box, cylinder, or sphere type.
Results: Within the region, precipitation effects (rain or snow) will be disabled. Since the precipitation effect works by tiling one box of simulated ain or snow around the camera, the precipitation will be turned off only on box boundaries, leaving some artifacts. The size of the boxes is determined by the PrecipitationEffect parameters in the envfx file for the world.

Questions to: Jason Scanlin.
## Fly/Danger Regions
 Name Prefix: danger
 Parameters: none
 Usage: Use any type.
 Results: Flyer AI will avoid these regions.
 Questions to: Greg Walker.

## Rumble Regions
 Name Prefix: rumble
 Parameters: &lt;string(rumbleclassname)&gt; &lt;string(effectname)&gt;
 Usage: Use any type. Name must be &quot;rumble&quot; only (&quot;rumble0&quot; or &quot;rumbleregion&quot; will not work!)
 Results: Create the given rumble effect and attached particle effects when the local player enters this region.
 Questions to: Josh Verrall

## Sound Trigger Regions
 Name Prefix: soundtrigger
 Parameters: &lt;string(propertyname)&gt;
 Usage: Use any type. Name must be &quot;soundtrigger&quot; only (&quot;soundtrigger0&quot; or &quot;soundtriggerregion&quot; will not work!).
 Results: Trigger a sound when a listener enters the region.
 Questions to: Stewart Miles

## Sound Space Regions
 Name Prefix: soundspace
 Parameters: &lt;string(soundspaceid)&gt;
 Usage: Use any type. Name must be &quot;soundspace&quot; only (&quot;soundspace0&quot; or &quot;soundspaceregion&quot; will not work!).
 Results: Change the sound space parameters when a listener enters the region.
 Questions to: Stewart Miles

## Static Sound Regions
 Name Prefix: soundstatic
 Parameters: &lt;string(soundid)&gt; &lt;float(distance\_divisor)&gt;
 Usage: Use any type. Name must be &quot;soundstatic&quot; only (&quot;soundstatic0&quot; or &quot;soundstaticregion&quot; will not work!).
 Results: Trigger a static sound when a listener enters the region.
 Questions to: Stewart Miles

## Sound Stream Regions
Name Prefix: soundstream
Parameters: &lt;string(soundid)&gt; &lt;float(distance\_divisor)&gt;
Usage: Use any type. Name must be &quot;soundstream&quot; only (&quot;soundstream0&quot; or &quot;soundstreamregion&quot; will not work!).
Results: Trigger a sound stream when a listener enters the region.
Questions to: Stewart Miles

## Foley FX Regions
Name Prefix: foleyfx
Parameters: &lt;string(groupid)&gt;
Usage: Use any type. Name must be &quot;foleyfx&quot; only (&quot;foleyfx0&quot; or &quot;foleyfxregion&quot; will not work!).
Results: Trigger a foley change when a listener enters the region.
Questions to: Stewart Miles

## Damage Regions
Name Prefix : damage
Parameters : key=value, key matched to minimum number of characters

**damagerate=&lt;float&gt;**
Damage per second applied to objects that enter the region

**personscale=&lt;float&gt;**
Scales the damage if the object in the region is a person

**animalscale=&lt;float&gt;**
Scales the damage if the object in the region is an animal

**droidscale=&lt;float&gt;**
Scales the damage if the object in the region is a droid

**vehiclescale=&lt;float&gt;**
Scales the damage if the object in the region is a vehicle

**buildingscale=&lt;float&gt;**
Scales the damage if the object in the region is a building

**buildingdeadscale=&lt;float&gt;**
Scales the damage if the object in the region is a dead building

**buildingunbuiltscale=&lt;float&gt;**
Scales the damage if the object in the region is an undamaged building

Usage: Use box, cylinder, or sphere type.
Results: Damage will be applied to objects within the region.
Questions to: Stewart Miles
# Materials in XSI

Below is a complete list of all the materials that artists can set through XSI along with which platforms support them. In order to use any of these materials you first select the polygons that you want to tag in XSI and then select EditFlags. Adjust the render type field for choosing the appropriate material.

## Normal

**Render Type:** Render Normal
**Data 0:** NOT USED
**Data 1:** NOT USED
**Texture 0:** diffuse texture
**Description:**
The simple default material.
**Comments:**

## Detail Mapped
**Render Type:** Render Detail
**Data 0:** detail tiling in the U direction
**Data 1:** detail tiling in the V direction
**Texture 0:** diffuse texture
**Texture 1:** detail map texture
**Description:**
Detail mapping an object will give the object the appearance of more texture resolution when close to the camera. It is useful for simulating finely, rough surface such as cement or rocks.
**Comments:**
The detail map should have an average intensity of about 0.5, which insures that the overall brightness of the object will not be affected.

## Bump Mapped
**Render Type:** Render Bumpmap
**Data 0:** NOT USED
**Data 1:** NOT USED
**Texture 1:** bump map texture
**Description:**
A bump mapped object gives the object the appearance of more depth. Bump mapping an object is useful for surfaces that have groves such as tree bark and brick.
**Comments:**

## Bump Mapped with Specular
**Render Type:** Render Bumpmap+Glossmap
**Data 0:** NOT USED
**Data 1:** NOT USED
**Texture 0:** diffuse texture (gloss map in alpha channel)
**Texture 1:** bump map texture (gloss map in alpha channel)
**Description:**
A bump mapping object with specular is useful for shiny surfaces (such as metal) with groves where you want the groves to be highlighted. The gloss map is useful to give the surface an uneven shine.
**Comments:**
In order to adjust the specular power associate the selected polygons with a XSI Phong material. The color of the material effects the specular color and the specular decay controls how big the specular spot is. The larger the specular decay the smaller the spot will be.

## Refraction
**Render Type:** Render Ice Refraction
**Data 0:** NOT USED
**Data 1:** NOT USED
**Texture 0:** diffuse texture
**Texture 1:** bump map
**Description:**
A refraction object behaves as transparent object except the transparency is distorted. The alpha channel of the diffuse texture is used to control the opacity while the bump map controls how much to distort an object.
**Comments:**
Since a refraction object distorts the scene behind it suffers from sorting issues.

## Scrolling
**Render Type:** Render Scrolling
**Data 0:** scroll speed in the U direction
**Data 1:** scroll speed in the V direction
**Texture 0:** diffuse texture
**Description:**
Scrolls the diffuse texture according to the scroll speeds.
**Comments:**

## Specular
**Render Type:** Render Glossmap
**Data 0:** NOT USED
**Data 1:** NOT USED
**Texture 0:** diffuse texture (gloss map in alpha channel)
**Description:**
A specular object is useful for creating shiny surfaces (such as metal). The gloss map is useful to give the surface an uneven shine.
**Comments:**
In order to adjust the specular power associate the selected polygons with a XSI Phong material. The color of the material effects the specular color and the specular decay controls how big the specular spot is. The larger the specular decay the smaller the spot will be. If there is no alpha channel in the texture then it is assumed to be 1 and gloss mapping will be turned off.
