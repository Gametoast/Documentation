**Battlefront 2 Material System**

This document explains the key features to understanding material parameters and their affect on the rendering system. In order to use any of these materials you first select the polygons that you want to tag in XSI and then select EditFlags. You should a dialog box similar to the one shown below.

![](RackMultipart20220212-4-17326en_html_effbb3c539fafbf5.gif)

# Common Parameters

## Per-Pixel Lighting (Xbox/PC)

If this flag is selected all the lighting computations will be performed per-pixel instead of per-vertex. This flag will give much nicer results because the lighting is not dependent on the tessellation of the mesh. This flag has some cost to it (don&#39;t over-use it).

## Specular Enable

This flag allows specular lighting on an object. In order to adjust the specular power or specular color, associate the selected polygons with a XSI Phong material. The color of the material effects the specular color and the specular decay controls how big the specular spot is. The larger the specular decay the samller the spot will be. If there is an alpha channel in the diffuse texture then it serves as a gloss map (which attenuates the specular per pixel).

## Hard Edged Transparency

Hard edged transparency enables alpha testing and does not write pixels whose alpha is below a certain value.

## Additive Transparency

Additive transparency will perform an add operation into the frame buffer instead of a blend. This means if you have a bunch of additive objects in front of each other the objects will get successively brighter.

## Transparency

This property tells the system that the polygons are transparent and the alpha channel controls the transparency. If the polygons are marked as single-sided then they are back faced culled. Polygons that are marked as double-sided are never culled.

## Lighting

This property controls whether or not a set of polygons gets lit. If tagged as &quot;Normal&quot; then the object will be lit. If it is tagged as emissive it will not be lit.

Add some comments about GLOW

# Render Types

## Normal

The normal render type is the basic material. It supports an optional detail map along with a tile value for the detail map. Detail mapping will give the object the appearance of more texture resolution when close to the camera. It is useful for simulating finely, rough surface such as cement or rocks. The detail map should have an average intensity of about 0.5, which insures that the overall brightness of the object will not be affected.

## Environment Map

The environment map render type adds support for a reflection map to give a shiny appearance on a surface. If an environment map is not specified then it will choose an environment map dynamically at run time. If the object does not move you should provide an environment map.

## Bump Map

A bump mapped object gives the object the appearance of more depth. Bump mapping an object is useful for surfaces that have grooves such as tree bark and brick. The bump map uses the same texture coordinates as the diffuse map. The bump map must have the same alpha channel as the diffuse map. This render type also supports a detail map that can be tiled.

## Bump Detail Map

A bump detail map provides all the same functionality as a bump map however the bump map can be tiled.

## Bump Environment Map

Same as a bump map, but provides an optional environment map.

## Bump Detail Environment Map

Same as bump detail map, but provides an optional environment map.

## Refraction

The refraction render type behaves as a transparent material except the transparency is distorted. The alpha channel of the diffuse texture is used to control the opacity while the bump map controls how much to distort the scene behind the object along with the distortion scale. Since polygons tagged as refraction distorts the scene behind it, it suffers from the same sorting issues as a transparent object. A refraction object can have an optional environment map associated with it.

## Scrolling

Scrolls the diffuse texture according to the scroll speeds specified. The scroll is unidirectional. If you want to scroll in the other direction, just flip the texture coordinates.

## Blink

The render type is used for blinking the diffuse color. The blink will oscillate between the original intensity and the min value specified according to the blink speed.

## Animated

This render type is used for animated textures. All the frames must be on the same texture. Your UV&#39;s should be mapped to the first cell (not the entire texture). Each individual cell is always square and is determined automatically from the number of frames. The number of frames must be a perfect square (ie. 1,2,9,16,25,36…).