Hud Document from Psych0fred

originally posted at: 
http://www.secretsociety.com/forum/downloads/BF2Docs/HUD.txt


# HUD Configuration

## Supported viewports
--------------------

The first item of a HUD configuration file should specify information about the 
file like, the filename and which split screen modes the HUD supports.
```
FileInfo(filename)      - filename is the name of the file you want the editor 
                          to write out.

SplitMode(mode0, mode1) - mode is either "Horizontal" (top / bottom split 
                          screen) or "Vertical" (side by side split 
                          screen).  Only xbox supports the "Vertical" mode 
                          with two viewports.
                          
Widescreen(enable)      - when set to 1 the file will only be loaded when
                          widescreen is enabled, set to 0 to load file 
                          when widescreen isn't enabled
```                  
This will support vertical two player split screen...

SplitMode("Vertical")
Viewports(2)

This will support either vertical or horizontal split screen with 2 or 4 players
SplitMode("Vertical", "Horizontal")
Viewports(2, 4)


The second item of a HUD configuration file should always specify the number of 
viewports (players) the HUD supports. 

Viewports(numViewports0, numViewports1, numViewportsN)

For example to force the HUD configuration to be loaded for just one viewport use...

Viewports(1) 

To support 2 or 4 viewports use...

Viewports(2, 4) 


For example, in the file reticuledisplay.hud which supports any number of 
viewports and split screen mode the first lines are...
```C#
FileInfo("reticuledisplay")
{
    Viewports(1, 2, 4)
    SplitMode("Vertical", "Horizontal")
}
```
Another example would be a file which only supports one view configuration...
```C#
FileInfo("tooltips")
{
    Viewports(1)
}
```

## Common properties across all elements
-------------------------------------

All HUD elements have the following properties...
```
Position(x, y, z, rel) - position of the group (positive z is into the screen)
                         If rel is set to 1 the x and y coordinates are relative to 
                         the screen's width and height. When rel can be set to 
                         the following...
                         "Pixels"   - x, y pixel values
                         "Viewport" - x, y relative to the element's viewport 
                         "Frame"    - x, y relative to the element's container group
                         "Screen"   - x, y relative to the screen 
                         
Rotation(x, y, z)      - rotation of the element about the X, Y and Z axis in degrees
Scale(x, y, z)         - Scales the model, greater than 1 is larger, 
                         lesser than 1 is smaller
ZOrder(zorder)         - zorder determines how the element is sorted with 
                         overlapping elements.  zorder can be in the range 
                         0 (front) .. 255 (back)
Alpha(alpha)           - alpha can range between 0.0 (transparent) and 1.0 (opaque)
Color(r, g, b)         - color of the element, r - red, g - green, b - blue each
                         color value is in the range 0..255
ColorChange(r, g, b)   - color of the element when it receives the change event
ColorChangeRate(rate)  - rate color interpolation (0 stops interpolation, 
                         1 changes color immediately)
ColorPulseRate(rate)   - rate of color pulsing to the change color even when the 
                         element hasn't changed
UseChangeColor(use)    - set use to 1 to change the color when the change event
                         is received, set use to 0 to disable color change.
FadeInTime(time)       - time to fade in the element when it's activated
FadeHoldTime(time)     - time to wait at the maximum alpha value before fading out
FadeSustainTime(time)  - time to wait at maximum alpha after element has been 
                         disabled
FadeOutTime(time)      - time to fade out the element when it's deactivated
BlendMode(mode)        - blending mode can be either "Alpha" or "Additive"
EditOnly(editOnly)     - set editOnly to 1 if the element should only be displayed
                         when the /hud switch is specified on the command line
                         if the element should be displayed in non-HUD edit builds
                         set this to 0.
EventEnable(event)     - when the specified event occurs the element is activated
EventChange(event)     - when the specified event occurs the element performs a 
                         change operation (changing color, playing animation etc.)
EventDisable(event)    - when the specified event occurs the element is deactivated
EventFadeOut(event)    - the specified event is FIRED when the element starts 
                         to fade out after the hold time has elapsed.  
EventColor(event)      - specified event sets the color of the element
EventPulseRate(event)  - specified event sets the rate of pulsing of the element
AnimEnable(anim)       - procedural animation played when the element is activated
AnimDisable(anim)      - procedural animation played when the element is deactivated
AnimChange(anim)       - procedural animation played when the element is changed
ViewPort(num)          - force the element to a specific view port.  Full screen is 0
                         1..4 are the viewports for each specific player.  When
                         split screen is not enabled elements assigned to view ports
                         that are out of range will not be displayed.
Scalable(enable)       - PC ONLY : set enable to 1 to allow the application to scale 
                         this element, set enable to 0 to disable scaling.  This can
                         be useful to allow user scaling of elements like 
                         reticules for the PC.
```
## Text elements
-------------

Text elements have the following properties...
```
TextBox(w, h)           - Bounding box for text.  
                          w (width as fraction of the screen)  range 0..1
                          h (height as fraction of the screen) range 0..1
                          NOTE : if the text box is in a group the width and 
                          height is relative to the parent group's width and 
                          height.
Text(text)              - Sets the text, text should be a localization string  
TextFont(font)          - Font used to draw text of course
TextClip(clipStyle)     - Can only be set to "Character" at the moment   
TextAlignment(h, v)     - Horizontal and vertical alignment
                          h can be "Left", "Right" or "Center"
                          v can be "Top", "Bottom", "Center" or "Baseline"
TextScale(w, h)         - Scale factor for width and height of text values 
                          greater than 1 make the text larger   
TextCharacterSpacing(s) - Spacing between characters in pixels    
TextTabSpacing(s)       - Tab size in pixels.   
TextBreak(break)        - Text break algorithm for wrapping text in the text box
                          break can be 
                          "None" (no wrapping), 
                          "Word" (wrapping on word boundary), 
                          "No Reformat"   (multiple white space is converted to 
                                           one space with no wrapping)
                          "Word Reformat" (multiple white space is converted to 
                                           one space with wrapping on a word 
                                           boundary)
TextStyle(style)        - style can be set to "Normal", "Shadow" or "Selected"
EventText(event)        - the specified event changes the text in the text 
                          element
EventNumber(event)      - the specified event sets the text to a number
IntegerFormat(format)   - formatting string for integers (see printf)
FloatFormat(format)     - formatting string for integers (see printf)
NumberToTime(format)    - converts numbers passed to the text box via 
                          EventNumber into a time string the formatting 
                          is specified in the following printf'y way...
                          %d - days
                          %h - hours
                          %m - minutes
                          %s - seconds
                          so the number 185.235 with the format %m.%s 
                          would display 3.5 to format the seconds 
                          %02m.%02s would display 03.05
                          the formatting of the seconds field can 
                          be modified using the FloatFormat 
                          so if FloatFormat is set to %02.02f the
                          NumberToTime format %02m:%s would 
                          display 03:02.35
Percent(enable)         - 1 displays a value in the range 0..1 as 
                          a percentage 0% to 100%.  0 disables this 
                          formatting option.
InfiniteDashes(enable)  - 1 displays -- when number is infinite.  0
                          displays nothing when number is infinite.
```                          

Example...
```C#
Text()
{
    Position(0.0, 0.0, 0.0)
    Text("interface.weapon")
    TextAlignment("Left", "Top")
    TextScale(2.0, 2.0)
    TextFont("console")
    EventText("player1.weapon.text")
}
```

## Bitmap elements
---------------

Bitmap elements have the following properties...
```
Bitmap(textureName)              - Specifies the name of the texture to be 
                                   displayed in the bitmap element
BitmapStyle(style)               - Specifies the style of the bitmap
                                   style can be either "Normal" or "Shadow"
BitmapRect(w, h, halign, valign, rel) 
                                 - Sets up the bounding rectangle and the 
                                   positioning of the bitmap.  w is the width
                                   in pixels, h is the height in pixels,
                                   halign can be "Left", "Center" or "Right"
                                   valign can be "Top", "Center" or "Bottom".
                                   When rel can be set to the following...
                                   "Pixels"   - x, y pixel values
                                   "Viewport" - x, y relative to the element's viewport 
                                   "Frame"    - x, y relative to the element's container group
                                   "Screen"   - x, y relative to the screen 
                                   to the parent group's width and height.
TexCoords(l, t, r, b)            - Sets the texture coordinates l - left, 
                                   t - top, r - right, b - bottom.  Each 
                                   texture coordinate is in the range 0..1.
                                   The default is 0, 0, 1, 1
Mask(textureName)                - Specified the 1 bit texture to be used as a 
                                   mask this property can only be used with 
                                   BitmapMasked elements.
MaskTexCoords(l, t, r, b)        - Sets the texture coordinates for the mask 
                                   texture. l - left, t - top, r - right, 
                                   b - bottom.
Hardpoint(hardpointName)         - Sets the hardpoint used to position the model
EventBitmap(event)               - Sets the bitmap via an event
```                          
Example...
```C#
Bitmap()
{
    Position(0.0, 0.0, 0.0)
    Bitmap("rifle")
}

BitmapMasked()
{
    Position(50.0, 0.0, 0.0)
    Bitmap("map")
    Mask("circularmask")
    TexCoords(0, 0, 0.5, 1)
}
```

## 3D Model elements
-----------------

3D Model elements have the following properties...
```
Mesh(meshName)           - Specifies the name of the mesh to be displayed in the 
                           element
Lighting(enable)         - Sets whether lighting is enabled on the mesh. 
                           1 enable, 0 disable.
Depth(depth)             - Sets the depth, controls the perspective.  
                           The default value is 0.1 
EventMesh(event)         - event which changes the mesh displayed by the element
InheritMeshInfo(element) - inherits the MeshInfos from the specified element
MeshInfo(meshName)       - Section which defines position, rotation and scale of a 
                           specific mesh when assigned to this element.
```
Example ...
```C#
Model3D("healthitem")
{
    Position(100, 0, 0)
    Mesh("com_weap_inf_medkit")
    Lighting(1)
    
    MeshInfo("com_weap_inf_medkit")
    {
        Position(150, 0, 0, 0)
        Scale(1, 1, 1)
        Rotation(30, 0, 0)
        Depth(0.03)
    }
}
```


## Group elements
--------------

Group elements are areas which can contain other HUD elements or more group 
elements.  Coordinates of HUD elements added to a group element are 
relative to that group element's coordinates.   Group elements have the 
following additional properties...
```
Rect(w, h, halign, valign, rel)  - 
                              w is the width of the group element 
                              relative to the width of the screen (0..1).
                              h is the height of the group 
                              element relative to the height of the 
                              screen (0..1).  Elements added to the group 
                              that overlap the group's region are NOT 
                              clipped to the region.  This property 
                              is used by other group elements like 
                              BorderedBox and MultilineText.  halign can
                              be "left", "center" or "right".  valign can
                              be "top", "center" or "bottom".
                              When rel can be set to the following...
                             "Pixels"   - w, h pixel values
                             "Viewport" - w, h relative to the element's viewport 
                             "Frame"    - w, h relative to the element's container group
                             "Screen"   - w, h relative to the screen 
EventPosition(event)        - Event which updates the position of 
                              the element
PropagateAlpha(enable)      - set enable to 1 to propagate the groups 
                              alpha to children of the group
EventScale(event)           - Expects a vector3 event which
                              is used to scale the group.
EventRotation(event)        - Expects a vector3 event which rotates the group
```
Example...
```C#
// health / ammo group
Group()
{
    Position(10.0, 10.0, 0.0)
    ZOrder(0)
    Alpha(0.75)
    FadeInTime(1.0)
    FadeHoldTime(4.0)
    FadeOutTime(3.0)
    BlendMode("Alpha")
    EventActivate("player1.weapon.changed")
    EventActivate("player1.health.changed")
    Rect(1.0, 1.0)

    Text()
    {
        Position(0.0, 0.0, 0.0)
        Text("interface.health")
    }

    Bitmap()    
    {
        Position(20.0, 0.0, 0.0)
        Bitmap("healthbar")
    }

    Text()
    {
        Position(0.0, 10.0, 0.0)
        Text("interface.weapon.rifle")
    }

    Bitmap()
    {
        Position(20.0, 10.0, 0.0)
        Bitmap("weap_rifle")
    }   
}
```

## BorderedBoxes
-------------
```
A BorderedBox is a group element with a textured background with a border.
Rather than simply stretching the bitmap across the whole background,
it uses a border width and height to maintain a non-stretched border.
In this way, a small texture with a fine border can be used to make
large backgrounds in the HUD, while keeping the nice fine border.

Background(name)      - specified which texture to use for the background
Rect(width, height)   - specifies how big the box will be displayed, 
                        width and height are specified in relative screen 
                        coordinates (0..1)
Border(width, height) - specifies the thickness of the border in pixels
```
Example...
```C#
BorderedBox()
{
    Background("border_3_pieces")
    Rect(0.5, 1.0)
    Border(8, 8)
    EventEnable("player1.objectivelist.enable")
    EventDisable("player1.objectivelist.disable")
}
```

## MultilineText
-------------
```
A MultilineText is a group element which can display multiple lines of 
text.  MultilineText has all properties of Group elements with the 
addition of...

NumLines(lines)        - maximum number of lines that can be queued up in the box
DisplayTime(time)      - time in seconds to show a line before scrolling it off 
                         of the display
AlwaysScroll(enable)   - 1 to always scroll the text box even if it 
                         isn't full, or 0.
DisableOnEmpty(enable) - 1 to disable when the text box is empty, 0 
                         to leave text box enable state
AddToTop(enable)       - 1 to add new text to the top line of the box, 0
                         to add new text to the bottom line of the box
ScrollSpeed(speed)     - speed is the scrolling rate in lines per second
EventText(event)       - event which adds a line of text to the box
Format                 - text box element which is used to format text 
```
Example...
```C#
MultilineText()
{
    Position(0.25, 0.25, 0.0, 1)
    Rect(0.5, 0.5)
    NumLines(80)
    DisplayTime(3.0)
    AlwaysScroll(1)
    ScrollSpeed(0.5)
    EventText("player1.spawnDisplay.message")
    Format()
    {
        TextBox(0.5, 0.1)
        TextFont("gamefont_tiny")
        TextClip("Character")
        TextAlignment("Left", "Center")
        TextScale(1.0, 1.0)
    }
}
```

## BarBitmap
---------
```
Displays a bar using a bitmap.element.  BitmapBar has all the properties of
Bitmap elements with the addition of...

Value(value)               - initial value of the bar (defaults to 0)
MinValue(value)            - minimum value of the bar (defaults to 0)
MaxValue(value)            - maximum value of the bar (defaults to 1)
ScaleTexture(scale)        - set scale to 1 to keep the texture a constant size
                             when the size of the bar changes.  set scale to 0
                             to keep the UVs constant when the bar size changes.
ScaleSize(scale)           - set scale to 1 to scale the size of the bar, 0 
                             to keep the bar at a constant size and just change 
                             the texture coordinates
EventValue(event)          - event which sets the value of the bar
FlashyScale(scale)         - Y scale of the bar when flashy bit fades out
FlashyIncFadeOutTime(time) - Time taken to fade out flashy block when bar 
                             value increases, 0.0 disables flashyness on 
                             value increase
FlashyDecFadeOutTime(time) - Time taken to fade out flashy block when bar 
                             value decreases, 0.0 disables flashyness on 
                             value decrease

```
Example...
```C#
BarBitmap("player1weapon1ammobar")
{
    EventValue("player1.weapon1.totalAmmoFraction")
    Position(0.1, 0.1, 0.000000, 1)
    Bitmap("hud_ammobar")
    BitmapRect(0.1, 0.05, "Top", "Left", 1)
    TexCoords(0, 0, 1, 1)
    EventEnable("player1.weapon1.totalAmmoFraction")
    EventDisable("player1.weapon1.disable")
}
```

## BarSegmented
------------
Displays a bar made up of a specified number of bitmap elements (segments).
BarSegmented has all the properties of a Group element with the addition of...

Circular(enable)      - set enable to 1 to display a circular bar, 
                        set enable to 0 to display a linear bar
AngleStart(angle)     - start angle of a circular bar
AngleEnd(angle)       - end angle of a circular bar
NumSegments(segments) - number of bitmap elements used to build the bar
Segment               - bitmap element used to setup all of the bitmap 
                        elements (segments in the bar)
                        
Example...
```C#
BarSegmented("mycircularbar")
{
    Position(0.5, 0.5, 0.0, 1)
    Rect(0.25, 0.25)
    Circular(1)
    AngleStart(-150)
    AngleEnd(150)
    NumSegments(30)
    EventValue("player1.weapon1.totalClipFraction")
    EventEnable("player1.weapon1.totalClipFraction")
    EventDisable("player1.weapon1.disable")
    Segment("barsegment")
    {
        Bitmap("white")
        BitmapRect(0.1, 0.05, "Center", "Center", 1)
        TexCoords(0, 0, 1, 1)
    }
}
```

## ProceduralBarBitmap
-------------------
Displays a procedurally animated bitmap bar.  ProceduralBarBitmap has all of the 
properties of BarBitmap with the addition of...

GlowAlphaBase  - 
GlowAlphaScale - 
NoiseFreq      -
NoiseRoughness - 
GlowScaleSize  - 

Example...
```C#
Group("player1herobar")
{
    Position(0.3, 0.06, 0, 1)  
    EventEnable("player1.hero.healthFraction")
    EventDisable("player1.hero.disable")
    BarBitmap("player1herobarback")
    {
        EventValue("player1.energyFraction")
        Bitmap("greenlaser_l")
        BitmapRect(0.3, 0.03, "Left", "Top", 1)
        ScaleTexture(0) 
        ZOrder(253)
        Alpha(0.8)
        Color(255, 255, 255)
        EventEnable("initialize")
    }

    ProceduralBarBitmap("player1herobarglow")
    {
        EventValue("player1.energyFraction")
        Bitmap("lightsabreglow")
        BitmapRect(0.3, 0.03, "Left", "Top", 1)
        Scale(1.0, 1.0, 1.000000)
        ScaleTexture(0) 
        ZOrder(253)
        Alpha(0.3)
        Color(255, 255, 255)
        EventEnable("initialize")
    }
}
```

## Map
---
```
Battlefront's map / mini map.  The map's bounds are defined by either the 
box region "mapbounds" defined in the map's world file or the bounds defined 
by the command posts in the world.

The map has all of the default element and group properties with the addition of...

EventChangeMapMode(mapModeEvent)  - should be set to the event which changes the 
                                    map mode for a specific player e.g
                                    EventChangeMapMode("player1.mapMode")
EventToggleMapMode(mapModeEvent)  - should be set to the event which toggles the 
                                    map mode for a specific player e.g
                                    EventToggleMapMode("player1.mapModeToggle")
EventPostHide(postHideEvent)      - hides command posts when it receives this 
                                    event.  Should be set to the event for
                                    a specific player e.g 
                                    EventPostHide("player1.mapHideCPs")
EventPlayerIndex(event)           - Event which sets which local player is 
                                    displayed in this map display.  Should be
                                    set to a player's event e.g
                                    EventPlayerIndex("player1.index")
EventRefreshTarget(event)         - Event which refreshes a specific target e.g 
                                    EventRefreshTarget("player1.mapRefreshTarget")
EventRefreshPost(event)           - Event which refreshes a specific post e.g 
                                    EventRefreshPost("player1.mapRefreshPost")
EventRefreshMarker(event)         - Event which refreshes a specific marker e.g 
                                    EventRefreshMarker("player1.mapRefreshMarker")
BackgroundMaskShapeSmall(shape)   - Mask shape for the background of the 
                                    map when it's in small mode.  Can be
                                    either "Circle" or "Rectangle".
BackgroundMaskShapeLarge(shape)   - Mask shape for the background of the 
                                    map when it's in large mode. Can be
                                    either "Circle" or "Rectangle".
BackgroundMaskShapeSpawn(shape)   - Mask shape for the background of the 
                                    map when it's in large mode. Can be
                                    either "Circle" or "Rectangle".
TargetFireColor(color)            - Color of a target (player / vehicle) icon
                                    when it fires.
PostFlashRate(rate)               - Rate of command post flashing
PostFlashRadius(radius)           - Radius of command post when flashing
PostFlashColor(color)             - Flash color of flashing command post
PositionSmall(x, y, z, rel)       - Position of the map in small mode
PositionLarge(x, y, z, rel)       - Position of the map in large mode
PositionSpawn(x, y, z, rel)       - Position of the map in spawn mode
BackdropSmall                     - BitmapMasked element for the small map backdrop 
BackdropLarge                     - BitmapMasked element for the large map backdrop 
BackdropSpawn                     - BitmapMasked element for the spawn map backdrop 
PlayerSmall                       - Bitmap element for the small player icon
PlayerLarge                       - Bitmap element for the large player icon
PlayerSpawn                       - Bitmap element for the spawn player icon
PlayerFOVSmall                    - Model3D element for small player FOV
PlayerFOVLarge                    - Model3D element for large player FOV
PlayerFOVSpawn                    - Model3D element for spawn player FOV
PlayerDirectionSmall              - Model3D element for small player direction
PlayerDirectionLarge              - Model3D element for large player direction
PlayerDirectionSpawn              - Model3D element for spawn player direction
TargetSmall                       - Bitmap element for small target icons
TargetLarge                       - Bitmap element for large target icons
TargetSpawn                       - Bitmap element for spawn mode target icons
PostSmall                         - Bitmap element for small post icons
PostLarge                         - Bitmap element for large post icons
PostSpawn                         - Bitmap element for spawn mode post icons
PostTextSmall                     - Text element for small command post numbers
PostTextLarge                     - Text element for large command post numbers
PostTextSpawn                     - Text element for spawn mode command post numbers
PostSelectSmall                   - Bitmap element for small selected post icons
PostSelectLarge                   - Bitmap element for large selected post icons
PostSelectSpawn                   - Bitmap element for spawn mode selected post icons
MarkerSmall                       - Bitmap element for small marker icons
MarkerLarge                       - Bitmap element for large marker icons
MarkerSpawn                       - Bitmap element for spawn mode marker icons
NorthSmall                        - Bitmap element for small north icon
NorthLarge                        - Bitmap element for large north icon
NorthSpawn                        - Bitmap element for spawn north icon
PostNumbers(enable)               - Set enable to 1 to enable command post numbers
AllowMiniMap(enable)              - Set enable to 1 to allow the minimap, 0 to disable

For example...

```C#
Map("player1map")
{
    EventChangeMapMode("player1.mapMode")
    EventToggleMapMode("player1.mapModeToggle")
    EventPostHide("player1.mapHideCPs")
    EventRefreshTarget("player1.mapRefreshTarget")
    EventRefreshPost("player1.mapRefreshPost")
    EventRefreshMarker("player1.mapRefreshMarker")
    EventPlayerIndex("player1.index")
    EventDisable("player1.mapDisable")
    Position(0.3, 0.8, 0.0, 1)    
    TargetLarge("largetarget")
    {
        BitmapRect(30, 30, "Center", "Center")
    }
}
```


## Target
------
```
Battlefront's targeting / lock on display.  Has all of the default element and group 
properties with the addition of...

EventResetTargetCommon(event) - Event which resets a target, should be
                                set to "targetResetCommon"
EventResetTargetPlayer(event) - Event which resets a player specific target,
                                e.g "player1.targetResetPlayer"
EventPlayerIndex(event)       - Event which sets which local player is 
                                associated with this targetting display.  
                                Should be set to a player's event e.g
                                EventPlayerIndex("player1.index")
FourSegmentLockOn(enable)     - 4 bitmap elements are used for the lock on 
                                icon.
                                
AttackerOffScreen             - Bitmap element used to represent off 
                                screen attacker
AttackerOffScreenBehind       - Bitmap element used to represent off
                                screen attacker behind something
AttackerOnScreen              - Bitmap element used to represent on
                                screen attacker
AttackerOnScreenBehind        - Bitmap element used to represent on
                                screen attacker behind something
LockedOffScreen               - Bitmap element used to represent off 
                                screen locked target
LockedOffScreenBehind         - Bitmap element used to represent off
                                screen locked target behind something
LockedOnScreen                - Bitmap element used to represent on
                                screen locked target
LockedOnScreenBehind          - Bitmap element used to represent on
                                screen locked target behind something
HintOffScreen                 - Bitmap element used to represent off 
                                screen hint / target of oppotunity
HintOffScreenBehind           - Bitmap element used to represent off
                                screen hint / target of oppotunity
                                behind something
HintOnScreen                  - Bitmap element used to represent on
                                screen hint / target of oppotunity
HintOnScreenBehind            - Bitmap element used to represent on
                                screen hint / target of oppotunity
                                behind something
ObjectiveOffScreen            - Bitmap element used to represent off 
                                screen objective
ObjectiveOffScreenBehind      - Bitmap element used to represent off
                                screen objective behind something
ObjectiveOnScreen             - Bitmap element used to represent on
                                screen objective
ObjectiveOnScreenBehind       - Bitmap element used to represent on
                                screen objective behind something

Each of the bitmap elements within the Target also have the following 
properties...

ColorInterp(rate) - rate of interpolation of the color of the target
MinScale(scale)   - scale factor of the bitmap when it's close to the camera
MaxScale(scale)   - scale factor of the bitmap when it's far away from the camera
```
For example...
```C#
Target("player1target")
{
    EventEnable("player1.spawn")
    EventDisable("player1.die")
    EventPlayerIndex("player1.index")
    EventResetTargetCommon("targetResetCommon")
    EventResetTargetPlayer("player1.targetResetPlayer")
    
    AttackerOffScreen()
    {
        MinScale(1.000000)
        MaxScale(0.500000)
        Bitmap("hud_target_pointer")
        BitmapRect(32.000000, 32.000000, "Center", "Center", 0)
    }
    AttackerOffScreenBehind()
    {
        MinScale(1.000000)
        MaxScale(0.500000)
        Bitmap("hud_target_pointer")
        BitmapRect(32.000000, 32.000000, "Center", "Center", 0)
        Alpha(0.5)
    }
    AttackerOnScreen()
    {
        MinScale(1.000000)
        MaxScale(0.500000)
        Bitmap("hud_target_onscreen")
        BitmapRect(32.000000, 32.000000, "Center", "Center", 0)
    }
    AttackerOnScreenBehind()
    {
        MinScale(1.000000)
        MaxScale(0.500000)
        Bitmap("hud_target_onscreen")
        BitmapRect(32.000000, 32.000000, "Center", "Center", 0)
        Alpha(0.5)
    }
    LockedOffScreen()
    {
        MinScale(1.000000)
        MaxScale(0.500000)
        Bitmap("hud_target_pointer")
        BitmapRect(32.000000, 32.000000, "Center", "Center", 0)
    }
    LockedOffScreenBehind()
    {
        MinScale(1.000000)
        MaxScale(0.500000)
        Bitmap("hud_target_pointer")
        BitmapRect(32.000000, 32.000000, "Center", "Center", 0)
        Alpha(0.5)
    }
    LockedOnScreen()
    {
        MinScale(1.000000)
        MaxScale(0.500000)
        Bitmap("hud_target_onscreen")
        BitmapRect(32.000000, 32.000000, "Center", "Center", 0)
    }
    LockedOnScreenBehind()
    {
        MinScale(1.000000)
        MaxScale(0.500000)
        Bitmap("hud_target_onscreen")
        BitmapRect(32.000000, 32.000000, "Center", "Center", 0)
        Alpha(0.5)
    }
    HintOffScreen()
    {
        MinScale(1.000000)
        MaxScale(0.500000)
        Bitmap("hud_target_pointer")
        BitmapRect(32.000000, 32.000000, "Center", "Center", 0)
    }
    HintOffScreenBehind()
    {
        MinScale(1.000000)
        MaxScale(0.500000)
        Bitmap("hud_target_pointer")
        BitmapRect(32.000000, 32.000000, "Center", "Center", 0)
        Alpha(0.5)
    }
    HintOnScreen()
    {
        MinScale(1.000000)
        MaxScale(0.500000)
        Bitmap("hud_target_onscreen")
        BitmapRect(32.000000, 32.000000, "Center", "Center", 0)
    }
    HintOnScreenBehind()
    {
        MinScale(1.000000)
        MaxScale(0.500000)
        Bitmap("hud_target_onscreen")
        BitmapRect(32.000000, 32.000000, "Center", "Center", 0)
        Alpha(0.5)
    }
    ObjectiveOffScreen()
    {
        MinScale(1.000000)
        MaxScale(0.500000)
        Bitmap("hud_target_pointer")
        BitmapRect(32.000000, 32.000000, "Center", "Center", 0)
    }
    ObjectiveOffScreenBehind()
    {
        MinScale(1.000000)
        MaxScale(0.500000)
        Bitmap("hud_target_pointer")
        BitmapRect(32.000000, 32.000000, "Center", "Center", 0)
        Alpha(0.5)
    }
    ObjectiveOnScreen()
    {
        MinScale(1.000000)
        MaxScale(0.500000)
        Bitmap("hud_objective_icon")
        BitmapRect(32.000000, 32.000000, "Center", "Center", 0)
    }
    ObjectiveOnScreenBehind()
    {
        MinScale(1.000000)
        MaxScale(0.500000)
        Bitmap("hud_objective_icon")
        BitmapRect(32.000000, 32.000000, "Center", "Center", 0)
        Alpha(0.5)
    }
}
```

## VehicleSeating
--------------

Provides a vehicle seating display.  Has all of the default element and group properties
with the addition of...

EventPlayerIndex - Event which sets which local player is associated with this 
                   vehicle seating display.  Should be set to a player's event e.g
                   EventPlayerIndex("player1.index")
Backdrop         - Vehicle seating model.  Should have it's EventMesh property assigned 
                   to the appropriate vehicle seating mesh event 
                   e.g player1.vehicle.seatingMesh
Empty            - Model which is displayed for an empty seating position
Self             - Model which is displayed for a seating position occupied 
                   by the current player
Player           - Model which is displayed for a seating position occupied 
                   by a human player.
AI               - Model which is displayed for a seating position occupied by AI.

For example...
```C#
VehicleSeating("player1vehicleseating")
{
    EventPlayerIndex("player1.index")
    PropagateAlpha(1)
    EventEnable("player1.spawn")
    EventDisable("player1.die")
    Position(0.5, 0.5, -1592.276367, 1)
    Backdrop()
    {
        EventMesh("player1.vehicle.seatingMesh")
    }
    Empty()
    {
        Mesh("hud_vehicle_seatingchart_empty_icon")
    }
    Self()
    {
        Mesh("hud_vehicle_seatingchart_player1_icon")
    }
    Player()
    {
        Mesh("hud_vehicle_seatingchart_player1_icon")
    }
    AI()
    {
        Mesh("hud_vehicle_seatingchart_ai_icon")
    }
}
```

## Viewport
--------

The viewport group duplicates all children elements for each viewport.  Replacing
the element names and their event names with the specified EventNameFilter.  The
viewport group has the following properties...

EventNameFilter = "" : String which modifies the event names of children elements
                       on in each view port.  The string should be in the form
                       "string%" for example "player%" will replace all instances of
                       "player" followed by a number e.g player1 with 
                       "player" followed by the number of the view port.
                       In 2 player split screen the given the 
                       EventNameFilter("player%"), the event named 
                       "player1.name" would be changed called
                       "player1.name" for viewport 1 and 
                       "player2.name" for viewport 2.
                       
For example...
```C#
Viewport("healthbars")
{
    EventNameFilter("player%")
    
    BarBitmap("player1weapon1ammobar")
    {
        EventValue("player1.weapon1.totalAmmoFraction")
        Position(0.1, 0.1, 0.000000, 1)
        Bitmap("hud_ammobar")
        BitmapRect(0.1, 0.05, "Top", "Left", 1)
        TexCoords(0, 0, 1, 1)
        EventEnable("player1.weapon1.totalAmmoFraction")
        EventDisable("player1.weapon1.disable")
    }
}
```
would create the following...
```C#
BarBitmap("player1weapon1ammobar")
{
    EventValue("player1.weapon1.totalAmmoFraction")
    Position(0.1, 0.1, 0.000000, 1)
    Bitmap("hud_ammobar")
    BitmapRect(0.1, 0.05, "Top", "Left", 1)
    TexCoords(0, 0, 1, 1)
    EventEnable("player1.weapon1.totalAmmoFraction")
    EventDisable("player1.weapon1.disable")
    Viewport(1)
}

BarBitmap("player2weapon1ammobar")
{
    EventValue("player2.weapon1.totalAmmoFraction")
    Position(0.1, 0.1, 0.000000, 1)
    Bitmap("hud_ammobar")
    BitmapRect(0.1, 0.05, "Top", "Left", 1)
    TexCoords(0, 0, 1, 1)
    EventEnable("player2.weapon1.totalAmmoFraction")
    EventDisable("player2.weapon1.disable")
    Viewport(1)
}
```

## Transforms
----------

Transforms can filter events or convert an event of one type to another.
All transforms have the following properties...

EventInput(input)   - makes transform receive the specified input event
EventOutput(output) - specifies which output event to generate from the 
                      input event


## TransformNumberColor
--------------------

Converts a number into a color.  TransformNumberColor has the following 
properties ...

NumberColor(num, r, g, b) - maps num - the input number - to the color 
                            r - red, g - green, b - blue.  The color
                            element must be in the range 0..255
InputFactor(factor)       - value which scales the input value 
EventInputFactor(event)   - event whose value scales the input value
WrapInput(wrap)           - Set wrap to 1 to wrap input value to the 
                            input range.  Set wrap to 0 to clamp the
                            input value to the input range
                            

Example...
```C#
// convert ammo count to color for ammo text
TransformNumberColor("ammotextcolor")
{
    EventInput("ammo")
    EventOutput("ammotextcolor")
    NumberColor(0,   255, 0,   0)  // red
    NumberColor(200, 200, 200, 30) // darkish yellow
    NumberColor(400, 0,   255, 0)  // very green     
    WrapInput(0)
}
```

## TransformNumberColorBlend
-------------------------

The same as TransformNumberColor with the addition that it can blend another
color to the transform's output color. TransformNumberColorBlend has
the same properties as TransformNumberColor with the addition of...

EventBlend(event) - color event which is blended to the current output color
EventAlpha(event) - alpha value event (0.0..1.0 or 0..255) 
BlendMode(blend)  - blending mode can be either "Alpha" or "Additive"

Example...
```C#
TransformNumberColorBlend("ammocolorflasher")
{
    EventInput("ammo")
    EventBlend("ammotextcolor")
    EventOutput("amootextflashycolor")
    NumberColor(0, 0,   0,   0) 
    NumberColor(2, 255, 255, 255)
    NumberColor(4, 0,   0,   0) 
    BlendMode("Additive")
    WrapInput(1)
}
```

TransformNumberVector3
## ----------------------

Converts a number into a vector3.  TransformNumberVector3 has the following 
properties...

NumberVector3(num, x, y, z) - maps num - the input number - to the vector
                              x, y, z.
InputFactor(factor)       - value which scales the input value 
EventInputFactor(event)   - event whose value scales the input value
WrapInput(wrap)           - Set wrap to 1 to wrap input value to the 
                            input range.  Set wrap to 0 to clamp the
                            input value to the input range
                              
Example...
```C#
// convert charge into scale
TransformNumberColor("ammotextcolor")
{
    EventInput("player1.weapon1.charge")
    EventOutput("player1.weapon1.chargescale")
    NumberVector3(0.5, 1.0, 1.0, 1.0)
    NumberVector3(1.0, 0.5, 0.5, 0.5)
    WrapInput(0)
}
```

## TransformNameMesh
-----------------

Maps a name event to a mesh.  Has the default Transform properties with
the addition of 

NameMesh(name, meshName) - When input event matches name the transform 
                           generates the output event with the specified
                           mesh.  If the input name is not found the 
                           transform will try to find a mesh with the 
                           specified name.
TransformNameMesh(name)  - Copies the NameMesh properties from another
                           TransformNameMesh


Example...
```C#
TransformNameMesh("player1primaryweapons")
{
    EventInput("player1.weapon1.change")
    EventOutput("player1.weapon1.mesh")
    NameMesh("all_weap_inf_rifle",        "all_weap_inf_rifle");
    NameMesh("cis_weap_inf_wristblaster", "cis_weap_inf_wristblaster_hud");
}

TransformNameMesh("player2primaryweapons")
{
    EventInput("player2.weapon1.change")
    EventOutput("player2.weapon1.mesh")
    TransformNameMesh("player1primaryweapons")
}
```

## Sound
-----

Plays a sound when an event occurs.

Sound(soundName)        - Name of the sound to play when a trigger event is received
EventTrigger(eventName) - When event is triggered the sound is played
EventStop(eventName)    - When event is triggered the sound is stopped

Example...
```C#
Sound("player1pointssound")
{
    Sound("shell_menu_accept")
    EventTrigger("player1.statistics.points")
}
```

## In Game HUD Editor
==================

Enable the in game HUD editor by running the game with /hud on the command line 
then in game press CTRL-E on the connected keyboard.  

There are 3 modes...

* HUD element selection
* property selection
* property edit

In the HUD element selection mode the controls are the following...
```
XBOX / PS2

D pad left   - selects previous element (move up the list)
D pad left   - selects previous element (move down the list)
D pad left   - scrolls quickly through previous elements (move up the list)
D pad right  - scrolls quickly through next elements (move down the list)
L2           - toggle moving element name to corner of the screen or to the 
               corner of the elemnt's position
R1           - select HUD element
             
The controls for property selection of the current element are the following...

D pad up    - selects the previous property (move up the list)
D pad down  - selects the next property (move down the list)
D pad left  - scrolls quickly through previous properties (move up the list)
D pad right - scrolls quickly through next properties (move down the list)
L1          - go back to HUD element selection
R1          - edit the property

The controls for property edit mode are the following...

D pad left   - decrease first value
D pad right  - increase first value
D pad up     - decrease second value
D pad down   - increase second value
X / Square   - decrease third value
B / Circle   - increase third value
Y / Triangle - decrease fourth value
A / Cross(X) - increase fourth value
L2           - toggle moving element name to corner of the screen or to the 
               corner of the elemnt's position


In all modes...

Select / Back (insert on PC) - write the current HUD layout to a file.
R2                           - toggle display of safe zone


On the PC the console buttons are mapped to the following...
D pad      - the cursor keys
X, B ,Y, A - numeric keypad 4, 6, 8 and 6 (left, right, up, down)
L1         - Home
L2         - End
R1         - Page up
R2         - Page down
Start      - Delete
Select     - Insert
```


## Battlefront2 HUD
================


### Global Events
-------------
```
objectivetimer          - current value of the objective timer if it's active
objectivetimer.disable  - fired when objective timer is disabled
levelHintText           - level hint localization string fired when level starts
targetResetCommon       - fired when a target should be reset on the target display
initialize              - fired on the first update of the HUD (when the mission starts)
time                    - time elapsed (in seconds) since the start of the mission
```
### Player Events (apply to object player is controlling, soldier or vehicle)
-------------
```
player[num].spawn                 - fired when player num spawns
player[num].die                   - fired when player num dies
player[num].index                 - fired by the spawn display to attach players 
                                    to displays
player[num].targetResetPlayer     - fired when a player specific target should be 
                                    reset on the target display
                                     
player[num].shield                - player's shield value
player[num].shieldFraction        - player's fractional shield value (0..1)
player[num].shieldDisable         - fired when player's shield display is disabled

player[num].energy                - player's energy value
player[num].energyFraction        - player's fractional energy value (0..1)
player[num].energyWarning         - value from 0..1, 0 when energy is zero, 1 
                                    when the energy is above the energy threshold
player[num].energyDisable         - fired when energy display is disabled
player[num].energyOverburn        - 1.0 when energy is in overburn region
                                    0.0 when energy is normal
```
### Player Messaging
----------------
```
player[num].centerMessage         - localization string fired when objectives 
                                    or really important messages need to be 
                                    displayed
player[num].centerMessage.color   - color of the center message being displayed
player[num].centerMessage.disable - fired when center message should be turned off
player[num].message               - kill / command post capture / flag capture 
                                    message 
player[num].message.color         - message color
player[num].message.disable       - fired when the message should be disabled
player[num].chatMessage           - multiplayer chat message
player[num].chatMessage.color     - color of the multiplayer chat message
player[num].chatMessage.disable   - fired when chat message should be disabled

player[num].heroSelect.timer         - remaining time in seconds whilst the player
                                       can select a hero
player[num].heroSelect.timerFraction - remaining time (0..1) whilst the player
                                       can select a hero
player[num].heroSelect.message       - hero selection message string 
                                       e.g "Play as Anakin?"
player[num].heroSelect.disable       - fired when selection display is disabled
```

### Player Soldier Events
---------------------
```
player[num].health                  - player soldier's health (in hit points) left
player[num].healthFraction          - player soldier's health (0..1) left
player[num].healthDisable           - fired when player soldier's health display 
                                      is disabled
player[num].healthInVehicle         - player soldier's health while in a vehicle
player[num].healthInVehicleFraction - player soldier's health while in a vehicle (0..1)
player[num].healthInVehicleDisable  - fired when player gets out of vehicle
                                    
player[num].jetFuelFraction         - fraction of the player soldier's remaining 
                                      jetfuel (0..1)
player[num].jetDisable              - fired when player soldier's jet display 
                                      is disabled
player[num].jetFuelWarning          - value from 0..1, 0 when out of jetfuel 
                                      warning zone 1 when totally out of jetfuel
player[num].jetFuelThreshold        - threshold of fuel warning (0..1) 
                                      (use to overlay a threshold bar for warning 
                                       region)
```
### Player Statistics
-----------------
```
player[num].statistic.points          - player's current points, fired when 
                                        player's points changes 
                                        (number, so assign to EventNumber)
player[num].statistic.pointsDelta     - change in points 
                                        (string, assign to EventText)
player[num].statistic.kills           - player's current kills, fired when 
                                        player's kills changes 
                                        (number, so assign to EventNumber)
player[num].statistic.killsDelta      - change in kills 
                                        (string, assign to EventText)
player[num].statistic.deaths          - player's current deaths, 
                                        fired when player dies 
                                        (number so, assign to EventNumber)
player[num].statistic.deathsDelta     - change in deaths (string, so assign to EventText)
player[num].statistic.heropoints      - player's hero points, fired when 
                                        player's hero points change. 
                                        (number, so assign to EventNumber)
player[num].statistic.heropointsDelta - change in hero points 
                                        (string, so assign to EventText)
player[num].statistic.captures        - player's command post captures,
                                        fired when player captures a command post 
                                        (number, so assign to EventNumber)
player[num].statistic.capturesDelta   - change in command post captures 
                                        (string, so assign to EventText)
player[num].statistic.changed         - fired when any statistic changes
player[num].statistic.disable         - fired when statistics should be disabled
```

### Player Hero Events
------------------
```
player[num].hero.health           - player's hero health (in hit points)
player[num].hero.healthFraction   - player's hero health (0..1)
player[num].hero.healthDisable    - fired when hero bar should be disabled
```
### Player Vehicle Events
---------------------
```                                     
player[num].vehicle.health              - player vehicle's health (in hit points)
player[num].vehicle.healthFraction      - player vehicle's health (0..1)
player[num].vehicle.healthDisable       - fired when the vehicle's health display is 
                                          disabled
player[num].vehicle.seatingMesh         - The seating mesh for the current vehicle.
                                          The seating mesh is setup using the 
                                          HUDModel property in the vehicle ODF.
player[num].vehicle.hackingTime         - time before the target vehicle's pilot 
                                          is ejected when the player is hacking a
                                          vehicle with a repair weapon
player[num].vehicle.hackingTimeFraction - counts up (0..100) until the target vehicle's 
                                          pilot is ejected with the hack weapon
player[num].vehicle.hackingTimeDisable  - fired when hacking display should be 
                                          disabled
player[num].vehicle.hackedTime          - time before the player is ejected 
                                          from their vehicle
player[num].vehicle.hackedTimeFraction  - time (0..1) before the player is 
                                          ejected from their vehicle
player[num].vehicle.hackedTimeDisable   - fired when hacked display should be 
                                          disabled
```

Vehicle seating example - in imp_hover_fightertank add the following property...
HUDModel = "imp_hover_fightertank_seatinglayout"
where imp_hover_fightertank_seatinglayout is the model for the seating layout
of the fightertank.  The seating layout model should contain hardpoints
labelled hp_1, hp_2 ... hp_N for each seating position from 1..N.

### Targeting Events
----------------
```
player[num].lockOnName              - name / tip string of the target player is locked on to 
player[num].lockOnClassName         - class name of target player is locked on to
player[num].lockOnHealth            - target's health (in hitpoints)
player[num].lockOnHealthFraction    - fraction of target's health
player[num].lockOnDisable           - fired when target info. is disabled
player[num].lockOnShieldName        - 'shield' label that comes up when bar                                                 //          indicates shield health
player[num].lockOnDisableShieldName - fired when shield is disabled
player[num].lockOnDistance          - distance from player in world units
player[num].lockOnDirection         - rotation of the lock on direction icon
player[num].lockOnDirectionDisable  - fired when lock on direction icon is disabled
player[num].lockOnTeamColor         - color of the target's team
player[num].missileLock             - fired when another player has locked a missle 
                                      onto this player
player[num].missileLockDisable      - fired when another player loses missle lock on 
                                      this player
player[num].missileLockDistance     - distance of missile to player
```       
### Weapon Events
-------------
```
player[num].weaponsEnable                     - fired when a weapon becomes available
player[num].weaponsDisable                    - fired when no weapons are available
player[num].weaponsOverheat                   - fired when a player's weapon overheats
player[num].weapon[num].change                - fired when the player changes 
                                                their primary weapon
player[num].weapon[num].disable               - fired when the primary weapon 
                                                is deselected
player[num].weapon[num].totalAmmoBullets      - total number of bullets in 
                                                 the weapon
player[num].weapon[num].totalAmmoFraction     - fraction of the bullets left 
                                                in weapon (0..1)
player[num].weapon[num].totalClipBullets      - total number of bullets in the 
                                                weapon's clip
player[num].weapon[num].totalClipFraction     - fraction of the bullets left in 
                                                the clip (0..1)
player[num].weapon[num].ammoInfinite          - fired if the weapon's ammo is 
                                                infinite
player[num].weapon[num].charge                - amount of weapons charge (0..1)
player[num].weapon[num].refire                - time before next shot (0..1)
player[num].weapon[num].heat                  - weapon's heat (0..1)
player[num].weapon[num].name                  - name of the weapon
player[num].weapon[num].target.name           - name of the weapon's target
player[num].weapon[num].target.className      - name of the weapon target's class
player[num].weapon[num].target.health         - health of the weapon's target
player[num].weapon[num].target.healthFraction - fraction of target's health (0..1)
player[num].weapon[num].target.teamColor      - team color of the target
player[num].weapon[num].target.disable        - fired when weapon loses target
player[num].weapon[num].target.hitColor       - team color of the target that was hit
player[num].weapon[num].target.hit            - fired when any weapon hits a target
player[num].weapon[num].target.hitCritical    - fired when any weapon performs a 
                                                critcal hit
player[num].weapon[num].reticule.disable      - disable reticule
player[num].weapon[num].reticule.position     - position of the reticule
player[num].weapon[num].lockOnPosition        - position of the locked on object
player[num].weapon[num].lockOnDisable         - whether to disable the lock on indicator
```

### Team Events
-----------

Team number 0 is always the specified player's team.  Team 1 is the opposition
team.  So to display the player 0's team's points use player0.team0.points,
to display player 1's team's points use player1.team0.points.
```
player[num].team[num].texture               - team's icon
player[num].team[num].textureDisable        - disables team's icon
player[num].team[num].points                - team points
player[num].team[num].pointsText            - team points text 
                                              (format current/maximum e.g 1/5)
player[num].team[num].pointsDisable         - fired when team points are disabled
player[num].team[num].reinforcements        - team reinforcement count
player[num].team[num].reinforcementsFraction- fraction of team 
                                              reinforcements (0..1)
player[num].team[num].reinforcementsDisable - fired when team reinforcement 
                                              count is disabled
player[num].team[num].bleedRate             - when bleeding is maximum this
                                              value is 1, when not bleeding
                                              this value is huge (FLT_MAX).
```
### Map Events
----------
```
player[num].map.mode          - fired when the player select a map mode
player[num].map.modeToggle    - fired when the player cycles through available 
                                map modes
player[num].map.hideCPs       - fired when the player wants to hide the command 
                                posts from the map view
player[num].map.refreshTarget - fired when a target is added / removed 
player[num].map.refreshPost   - fired when a command post is added / removed
player[num].map.refreshMarker - fired when a marker is added / removed
player[num].map.enable        - fired when the map is enabled
player[num].map.disable       - fired when the map is disabled
player[num].map.spawn         - fired when spawn display map is enabled
player[num].map.spawnLarge         - fired when large map or spawn map is enabled
player[num].map.spawnLargeDisable  - fired when large map or spawn map is disabled

player[num].objectivelist.enable  - fired when the objective list is enabled
player[num].objectivelist.disable - fired when the objective list is disabled
```

### Spawn Display Events
--------------------
```
player[num].spawnDisplay.enable    - fired when the spawn display map screen 
                                     is enabled
player[num].spawnDisplay.disable   - fired when the spawn display map screen 
                                     is disabled
player[num].spawnDisplay.message   - mission specific localization string 
                                     fired when the spawn display is setup
player[num].spawnDisplay.vehicle   - command post specific localization string 
                                     fired when a command post is selected in 
                                     the spawn display
player[num].spawnDisplay.spawninfo - command post specific localization string 
                                     fired when a command post is selected in 
                                     the spawn display
```                                     
### Command post capture
--------------------
```
player[num].commandPost.charge         - number 0..1 command posts charge
player[num].commandPost.disable        - fired when command post display is disabled
player[num].commandPost.color          - color of the capturing team
player[num].commandPost.disputeColor   - color of the disputing team (or netural 
                                         color if command post is being neutralized)
player[num].commandPost.disputeEnable  - fired when a dispute starts
player[num].commandPost.disputeDisable - fired when a dispute stops

```
### CTF / Flag Events
-----------------
```
player[num].flag.player.carried    - fired when the player picks up the flag
player[num].flag.player.dropped    - fired when the player drops the flag
player[num].flag.player.disable    - fired when player's flag status should be disabled

player[num].flag.friend.carried                - fired when a friend picks up the flag
player[num].flag.friend.carried.disable        - fired when the friend flag indicator should be disabled
player[num].flag.friend.carried.number         - number of friendly flags carried
player[num].flag.friend.carried.number.disable - fired when number of friend flags should be disabled
player[num].flag.friend.dropped                - fired when a friend drops up the flag
player[num].flag.friend.dropped.disable        - fired when the friend flag indicator should be disabled
player[num].flag.friend.dropped.number         - number of friendly flags dropped
player[num].flag.friend.dropped.number.disable - fired when number of friend flags should be disabled

player[num].flag.enemy.carried                 - fired when a enemy picks up the flag
player[num].flag.enemy.carried.disable         - fired when the enemy flag indicator should be disabled
player[num].flag.enemy.carried.number          - number of enemyly flags carried
player[num].flag.enemy.carried.number.disable  - fired when number of enemy flags should be disabled
player[num].flag.enemy.dropped                 - fired when a enemy drops up the flag
player[num].flag.enemy.dropped.disable         - fired when the enemy flag indicator should be disabled
player[num].flag.enemy.dropped.number          - number of enemyly flags dropped
player[num].flag.enemy.dropped.number.disable  - fired when number of enemy flags should be disabled
```
Handling spawn / die events example...
```C#
TransformNameMesh("hudweapons")
{
    EventInput("player1.weapon1.change")
    EventOutput("player1.weapon1.mesh")
}

Text()
{
    Position(0.0, 0.0, 0.0)
    Text("interface.youarealive")
    TextAlignment("Left", "Top")
    TextScale(2.0, 2.0)
    TextFont("console")
    EventEnable("player1.spawn")
    EventDisable("player1.die")
}

Model3D("weapon")
{
    Position(100, 0, 0)
    Lighting(1)
    EventEnable("player1.weapon1.mesh")
    EventDisable("player1.weapon1.disable")
    EventMesh("player1.weapon1.mesh")
    FadeHoldTime(4.0)
    FadeOutTime(3.0)
}
```

###  Weapon Events
-------------

player[num].weapon[mode].change 

Fired when the player (num) changes weapon (mode) and passes the name of the weapon
 - specified by HUDTag in the weapon's ODF.  If HUDTag isn't set then WeaponName in 
 the weapon's ODF, if WeaponName is not set then 
 the value will be the GeometryName in the weapon's ODF, if that isn't set the 
 value will be the name of the ODF (e,g all_weap_inf_rifle.odf will generate the
 event all_weap_inf_rifle).
This can be used to map the weapon name event to a mesh event like this...

```C#
TransformNameMesh("hudprimaryweapons")
{
    EventInput("player1.weapon1.change")
    EventOutput("player1.weapon1.mesh")
    NameMesh("cis_weap_inf_wristblaster", "cis_weap_inf_wristblaster_hud");
}

Model3D("primaryweapon")
{
    EventEnable("player1.weapon1.mesh")
    EventDisable("player1.weapon1.disable")
    EventMesh("player1.weapon1.mesh")
}
```

In the above example the weapon name is used to look up the appropriate mesh 
which is sent to the "weapon" element.  If the weapon name is 
"cis_weap_inf_wristblaster" the mesh "cis_weap_inf_wristblaster_hud" will be
displayed in the "weapon" element.