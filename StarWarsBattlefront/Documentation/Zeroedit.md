SWBF Mod Tools

**ZEROEDIT VERSION ZERO**

A Guide to Building Levels for Star Wars Battlefront

This guide will walk through the various modes and mode tools of Zeroedit while explaining how to build levels for Star Wars Battlefront Version 1.11 or later.

**Launching Zeroedit**  
Zeroedit creates an index of every file that exists in the directory structure beneath it each time it is started and as result a copy of the editor and it's config files is included in each datamod# folder and template. This speeds launch times and prevents crashes that result from files Zeroedit does not understand. Zeroedit uses this index when files are referenced during it's use rather than reading the paths in real time. Zeroedit can be launched by double clicking on the executable. By default no world is loaded, and the Lucasarts licensing agreement appears.

**Zeroedit Interface**  
The following image illustrates Zeroedit's global toolbars.  
There are five global toolbars, FILE, EDIT, SHOW, EDIT MODE, and ACTIVE LAYER.

**File Control**  
The first is the file control. This bar consists of two buttons, one to load a world and one to save a world. Worlds use the .wld extension for the main file being saved, but many others are saved each time a world is saved, several of which correspond to editor modes while others to specific tools such as the LAYERS control or the terrain file. Worlds are saved in the world folder but assets used in the various edit modes also exist in the MSH and ODF folders.

**Edit Control**  
The edit controls are simple UNDO and REDO buttons. These do not always work in all modes for all object types, and they have corresponding keyboard shortcuts using the standard Ctrl-Z for undo and Ctrl-Y for redo.

**Show Control**  
The Show control is a special control that turns on the visibility of objects even if the editor is not in their normal working mode. For example Paths and Regions are invisible while working in object but a certain object needs to be within a region and not on top of a Unit Spawn Node. By turning on Paths and Regions they can all be seen but only the object can be edited. This comes in handy especially when dealing with object or foliage heavy worlds that take a lot of screen render time. Linked to the SHOW control is a subset of controls just for the vertex map of the terrain entitled Terrain View. These buttons affect how the vertex map is displayed. SOLID and WIRE are linked to one another as toggles while HEIGHT and COLOR and independent toggles. With SOLID toggled on the terrain is displayed as close as possible to how it will appear in game complete with textures and sky properties. With both WIRE and SOLID toggled on the terrain appears solid but there is a bright green wireframe grid overlaying the textures. With just WIRE toggled on just a gray wireframe view of the terrain is visible. HEIGHT mode toggles the vertex map to be displayed as a heightmap colored by topography. COLOR displays the vertex map colors as painted in COLOR MODE.

**Edit Mode Control**  
The Edit Mode control consists of toggles that correspond to each of Zeroedit's edit modes. Zeroedit uses 12 modes for SWBF:  
HEIGHT - Edit height properties of the vertex map terrain  
COLOR - Edit color of the vertex map  
TEXTURE - Edit textures applied to the vertex map terrain  
WATER - Add water and edit water texture properties  
FOLIAGE - Paint and erase foliage on terrain  
OBJECT - Add and edit object location and properties  
PATH - Add and edit unit spawn paths  
REGIONS - Add and edit region properties  
HINTNODE - Add and edit AI hint nodes  
BARRIER - Add and edit AI barriers  
PLANNING - Add and edit AI path planning connectivity graph  
BOUNDARY - Add and edit map boundaries  

**ACTIVE LAYER**  
The layer controls were originally designed so multiple people could work on a world at the same time. Each person would work in their own layer which consists of the same set of files saved when there is only one layer known as the BASE layer. Creating a layer is as easy as selecting the CHANGE button and then clicking NEW on the pop up control panel and renaming the layer. During development as more functionality was added to the editor how layers were utilized changed. Several modes adopted multiple purposes so when one person was working in a layer they often had a lot of their own clutter to work around. As a result layers evolved to be created and named by functional purpose, and the base layer was not utilized. A design layer would be created for designers and artists to manipulate objects, paths, capture and control regions, boundaries, and path plans. A separate layer would be created just for Shadow Regions, and the same for SoundSpaces, SoundRegions, and often Trees and Buildings would be separated into their own layers on crowded maps. Objects can be moved from one layer to another and layers deleted to allow for flexibility during development.

**ADVANCED**  
The advanced controls include TERRAIN, for creating a new terrain file; CAMERA, for changing the Fog Range and Sky Visibility as it appears in the editor only and provide a button for snapping the camera to a top down satellite view; IMAGE, for saving pictures of the terrain as a HEIGHTMAP or HIRESMAP for use in creating in game maps and low res terrain textures for use in game, as well as BURN TERRAIN, which utilizes the heightmap to burn shadows into the terrain.

**VISIBILITY**  
The visibility bar provides levels of visibility in 500 meter increments (500-5000 on the 10 bar scale). In solid mode if the visibility range is too high to render all of the object on screen the editor will slow to a crawl or even crash, so it is best to start with the visibility low and increase it as necessary. This is less of a problem when working in WIRE mode since the terrain and it's textures are not being rendered.

**ZeroEdit Keyboard / Mouse Commands**  
```
Ctrl + S        	Save
Ctrl + L        	Load
Ctrl + Z        	Undo
TAB			Toggle  between Mouselook and Edit
Arrow Up      	  	Rotate view up
Arrow Down		Rotate view down
Arrow Left		Turn view left
Arrow Right		Turn view right
NumPad (8)Arrow Up  	Move view forward
NumPad (2)Arrow Down    Move view back
NumPad (4)Arrow Left    Move view left
NumPad (6)Arrow Right   Move view right
NumPad (7) Home		Move view left and forward
NumPad (9) PgUp		Move view right and forward
NumPad (1) End 		Move view Left and back
NumPad Arrow Up		Move view right and back
, (<)			slow key and mouse movement
. (>)			speed key and mouse movement

With MOUSELOOK on, cursor disappears and you can not select anything, used to position the camera in the world.

Alt + I		Toggle behavior of Mouselook up and down
Mouse Forward	Look up
Mouse Back	Look down
Mouse Left  	Look / Turn Left
Mouse Right 	Look / Turn right
W		Move Forward
S		Move Back
A		Strafe to the left
D		Strafe to the right
F		Move up
V		Move down

With MOUSELOOK off, your cursor appears and you can select menus and manipulate the world

Left Click	Select or Place
Right Click	Deselect
Mouse Forward	Move cursor up the screen/Move cursor + item forward in the world
Mouse Back	Move cursor down the screen/Move cursor + item back in the world
Mouse Left	Move cursor left on the screen/Move cursor + item left in the world
Mouse Right	Move cursor right on the screen/Move cursor + item right in the world
Mouse Right	Move cursor right on the screen/Move cursor + item right in the world
F		Move cursor + item up in the world
V		Move cursor + item down in the world

When in OBJECT mode

Left Mouse Button	X axis
Right Mouse Button	Y axis
Middle Mouse Button	Z axis
C + L/R/M Mouse Button	Translate (move)
X + L/R/M Mouse Button	Rotate around Object Center
Z + L/R/M Mouse Button	Rotate around Object Root
O                       Center Camera on Selected Object

When in REGION or BARRIER mode

C + L/R/M Mouse Button		Scale Object in the X axis
X + L/R/M Mouse Button		Scale Object in the Y axis
Z + L/R/M Mouse Button		Scale Object in the Y axis
```
**EDIT MODES**

**HEIGHT MODE**  
Height mode allows users to mold the vertex height map of the terrain with a terrain brush. Instead of painting the vertex map with color like a paint brush, the terrain brush applies FOREGROUND and BACKGROUND heights to vertices on the terrain height map. The brush control panel consists of MODE, SIZE, SHAPE, ROTATION, and PRESSURE as well as TERRAIN HEIGHT tools.

MODE  
Mode defines the type of brush used to paint terrain. PAINT is the default and adjust terrain height consistently under the brush. SPRAY is akin to a spray can and raises terrain under the brush more erratically. RAISE gradually raises or lowers the vertices under the brush as long as the mouse button is being held down. The left mouse button raises while the right lowers. BLEND takes the foreground height and the background and applies a smoothing gradient between the two in the area under the brush. This is used to smooth out jagged hills and peaks for a more natural look.

SIZE  
The size controls affect the width and depth of the brush in the various modes. Values can be typed in or defined using sliders.

SHAPE  
Shape controls determine the brush shape. Brush shapes include SQUARE, which produces a solid brush with a hard edge; CIRCLE which produces a solid circle with a hard edge. If a circle is small it may look like a square due to the 8 meter grid tile size of the terrain. CONE looks and functions much like the CIRCLE shape but applies a blend like gradient to the terrain between the foreground height and background height that makes the terrain form a cone. Like circle, the smaller the cone the weaker the effect. BELL is much like CONE but instead of a blend gradient that results in a cone shape one that results in a bell shape is applied. RAMP shape uses the foreground height and background height to generate a rectangular ramp under the terrain brush.

ROTATION AND PRESSURE  
Rotation and pressure apply to the brush rotation and "paint" pressure. Brush ROTATION can be edited in degrees while PRESSURE is a percentage. Typically pressure is left at the default of 20 but increasing pressure is useful when manipulating terrain in RAISE mode.

TERRAIN HEIGHT  
Terrain height is a subset of controls that affect chosen height settings and allows for the selection of an area of terrain for copying and pasting. Two height settings are stored and attached to the height tools at all times, the foreground height and the background height. The foreground height is attached to the left mouse button and background to the right mouse button when PICK is active under Terrain Height. The height selected using the PICK tool is only for terrain vertices and PICK cannot be used on objects. MARQUEE allows for the selection of a rectangle of terrain that can then be copied using Ctrl-C. When an area of terrain is copied, the copy appears at the tip of the mouse arrow and superimposed over the terrain until the muse is clicked and it is placed in it's new location. Copied terrain can be pasted repeatedly. Right clicking will deselect the terrain. FOREGROUND and BACKGROUND input boxes allow for manually entering values but in coming up with values the world size and scope must be taken into account. While the default map size 256 x 256 meters with an 8 meter grid of squares, it does have max and min height settings in the mission lua that affect units and flyers.

**COLOR MODE**  
Color mode is used to paint heightmap vertices. There are also controls for ambient environment colors, but these are for view in the editor only because the complexity of the sky file exceeds the functionality of the editor and the sky file must be edited manually. Otherwise the changes made in color mode are saved in the terrain file. To view the color changes best, toggle the COLOR button on the TERRAIN VIEW control panel.

PAINT BRUSH  
The paint brush edit tools act as paint tools do so they are mostly self-explanatory. The brush controls consist of MODE, SIZE, SHAPE, PRESSURE, and COLORs (FOREGROUND and BACKGROUND attached to the left and right mouse button respectively).

MODE  
PAINT applies the color to the vertex map consistently across the vertex map. SPRAY mode applies the paint more like a spray can. PICK mode allows the mouse pointer to be used as an eyedropper to pick a color from the terrain. BLEND mode allows the brush to blend one color with another where different the colored areas meet.

SIZE  
Size is self explanatory setting the size of the brush in grid unit (8 meters per grid).

SHAPE  
The shape tool works much like it did in HEIGHT EDIT MODE. SQUARE presents a square brush with a solid edge; CIRCLE a circular brush with a solid edge that appears more circular the larger the circle; CONE is designed for painting on cone-shaped vertex maps and fades the paint not far from the center of the brush; BELL functions much like CONE except the fade begins closer to the edge of the brush.

PRESSURE  
PRESSURE allows the intensity of the color being applied while the mouse button is being held down to be adjusted. 20% is default.

FOREGROUND AND BACKGROUND  
Current FOREGROUND and BACKGROUND color settings are displayed here using RGB values. They can also be set here by typing a new value into each input field and hitting enter.

COLOR FILL  
The COLOR FILL button fills the entire vertex map with the FOREGROUND color.

COLOR TABLE  
At the bottom of the screen is the COLOR TABLE control panel which contains a default palette and buttons for selecting FOREGROUND and BACKGROUND colors. There is also a LOAD button for loading a custom .ACT palette. Also in the color table are the controls for the editor's ambient colors such as SKY, FOG, and AMBIENT. These colors do light the objects in the world and can be used as reference when setting the color values in the sky file. The values can be set using RGB and HSV values.

**TEXTURE EDIT MODE**  
Texture edit mode is used to apply textures to the grids on the terrain vertex map. The texture brush controls function just as they did for HEIGHT and COLOR with regard to SIZE and SHAPE with the exception of RAISE and BLEND. RAISE is used to bring out a texture that is on a layer below another visible texture. BLEND similarly blends the visibility of two adjacent textures. There is also a SOLO TEXTURE toggle that displays only the selected texture in the terrain view. In TEXTURE EDIT MODE the FOREGROUND and BACKGROUND are single alpha values.

TEXTURE and DETAIL  
The TEXTURE input field is where the name of the texture to be applied is typed. The DETAIL input field is for the detailed version of the texture. The SHOW DETAIL button toggles the view of the terrain textures to display the detailed rather than the standard texture. For a guide to creating textures see the ART DESIGN GUIDE.

TILE CONTROLS  
The TILE control panel provides visual slots for textures that can be applied to the terrain. When a tile is select the TEXTURE input field on the left side of the screen will display it's name. Every world needs a terrain file with at least one texture for the world to run. TILERANGE and TILEROTATION addresses how an individual texture is applied to the terrain grids being painted with the texture. These are especially useful when painting hillsides and cliffs. RAISE and LOWER move the position of the selected tile in the stack of layers. While it is functionally possible to stack as many textures in layers as desired, after about 4 it visually begins to fall apart.

**WATER EDIT MODE**  
WATER EDIT mode is used to apply water tile in the game. Water tiles are 4 x 4 grids which means they are 24 meters x 24 meters in size minimum. Water tiles can be made up of up to 15 layers each with a different textures as well varying alpha and color values. Few of the water controls are actually used so not all of their functions are documented here.

In additon to painting water on the terrain setting up the water texture requires several text files associated with the project be edited to configure the properties for the water animation. These files are the world req, typically named <ModID>.req located in the Data<ModID>\\Worlds\\<ModID> folder, and the world FX file, typically named <ModID>.fx located in the Data<ModID>\\Worlds\\<ModID>\\World1 folder.

The FX file is not created by deault and if written contains properties specified in the editor. It is easiest to copy FX files and water texture assets from worlds that shipped with the game and apply them to new worlds. The REQ and FX files for the worlds that shipped with the game server as a great reference.

Below is an example of the section that needs to be added to the ModID.req file. This was used in Mod2 and originally came from Jabba's Palace. It lists all of the textures that need to be included in the water animation. These textures are referred to by the FX file to create the visual effects:
```
    REQN
        {
            "texture"
            "platform=pc"
            "water_bumpmap_0"
            "water_bumpmap_1"
            "water_bumpmap_2"
            "water_bumpmap_3"
            "water_bumpmap_4"
            "water_bumpmap_5"
            "water_bumpmap_6"
            "water_bumpmap_7"
            "water_bumpmap_8"
            "water_bumpmap_9"
            "water_bumpmap_10"
            "water_bumpmap_11"
            "water_bumpmap_12"
            "water_bumpmap_13"
            "water_bumpmap_14"
            "water_bumpmap_15"

            "water_normalmap_0"
            "water_normalmap_1"
            "water_normalmap_2"
            "water_normalmap_3"
            "water_normalmap_4"
            "water_normalmap_5"
            "water_normalmap_6"
            "water_normalmap_7"
            "water_normalmap_8"
            "water_normalmap_9"
            "water_normalmap_10"
            "water_normalmap_11"
            "water_normalmap_12"
            "water_normalmap_13"
            "water_normalmap_14"
            "water_normalmap_15"

            "water_specularmask_0"
            "water_specularmask_1"
            "water_specularmask_2"
            "water_specularmask_3"
            "water_specularmask_4"
            "water_specularmask_5"
            "water_specularmask_6"
            "water_specularmask_7"
            "water_specularmask_8"
            "water_specularmask_9"
            "water_specularmask_10"
            "water_specularmask_11"
            "water_specularmask_12"
            "water_specularmask_13"
            "water_specularmask_14"
            "water_specularmask_15"
            "water_specularmask_16"
            "water_specularmask_17"
            "water_specularmask_18"
            "water_specularmask_19"
            "water_specularmask_20"
            "water_specularmask_21"
            "water_specularmask_22"
            "water_specularmask_23"
            "water_specularmask_24"
        }
```

Below is an example of the section that needs to be edited or added to the ModID.fx file. The texture and bumpmap file names should be all that need to be edited here to change them,or the entire section can be copied and pasted from a world that shipped with game. Note the properties make use of file prefixes with a range that encompasses the total number of files that make up the animation:

```C#
Effect("Water")
{
    // general parameters
    PatchDivisions(8,8);
    Tile(2.0,2.0);

    // ocean parameters
    OceanEnable(0);

    // water event parameters
    WaterRingColor(148, 170, 192,255);
    WaterWakeColor(192, 192, 192,255);
    WaterSplashColor((192, 192, 192,255);
    OscillationEnable(0);

    DisableLowRes();

    // PC parameters
    PC()
    {
        Velocity(0.01,0.02);
        MainTexture("tat3_water.tga");
        LODDecimation(1);

        RefractionColor(101, 136, 140, 255);
        ReflectionColor(150,150,150,150);
        UnderwaterColor(128, 130, 128, 64);
        FresnelMinMax(0.2,0.7)

        NormalMapTextures("water_normalmap_",16,8.0);
        BumpMapTextures("water_bumpmap_",16,8.0);
        SpecularMaskTextures("water_specularmask_",25, 2.0);
        SpecularMaskTile(4.0,4.0);
        SpecularMaskScrollSpeed(0.0,0.0);
    }
}
```

WIDTH AND HEIGHT  
WIDTH and HEIGHT are for the brush size. This brush is always square and 1 unit is equivalent to 4 terrain grid tiles. LAYER is used to change the working layer for the water tile. HEIGHT was not used.

UVEL, VVEL, UREPEAT, VREPEAT  
UVel, VVel, URepeat, and VRepeat control the animation of the water texture layers. They control the speed repeat frequency respectively along the x and y axes.

TEXTURE  
TEXTURE is where the water texture name is typed in for the specified layer.

COLOR  
COLOR specifies the background color of the tile not contained in the water textures. This color would applies to all layers if they are all transparent.

ALPHA  
ALPHA sets the alpha values for the layer and GLOW was not used.

**FOLIAGE EDIT MODE**  
Foliage is defined in the PRP file using text editor and subsequently applied using the FOLIAGE BRUSH tools. There are four foliage layers as defined and simple controls for brush SIZE and SHAPE because foliage is applied in an erratic fashion. There are also FILL WORLD and ERASE WORLD buttons that apply and remove foliage across the entire terrain. In the game assets provided some of the foliage is set up to appear in the editor as small white disks, while other foliage is fully rendered. This was done on a case by case basis to make it easier to use the editor by increasing render times and visual clutter to work around.

Foliage properties are written to the prop (prp) file. The format is below for two types, the first utilizes a mesh called editor_grasspatch.msh which appears in the editor as a white disk. The second layer utilizes the most typical type of foliage used is the second example which also has multiple types of foliage in a single layer.

```C#
Layer(0)
{
    SpreadFactor(0.1);
    Mesh()
    {
        GrassPatch("nab_prop_grass.odf", 50);
        File("editor_grasspatch.msh", 50);
        Frequency(100);
        Scale(1);
        Stiffness(0.0);
    }
}

Layer(1)
{
    SpreadFactor(0.4);
    Mesh()
    {
        File("end_prop_fern5.msh", 30);
        Frequency(20);
        Scale(1);
        Stiffness(0.0);
        CollisionSound("foliage_collision");
        ColorVariation(0.2);
    }

    Mesh()
    {
        File("end_prop_treeclump_1.msh", 50);
        Frequency(80);
        Scale(1);
        Stiffness(0.0);
        CollisionSound("foliage_collision");
        ColorVariation(0.2);
    }
}
```

Foliage Properties:  
The SpreadFactor determines the density of the foliage on a particular tile. The lower the number the more dense. The number that appears in the File line at the end of the mesh or object specifies the view distance where the foliage fades in or out in meters.

The Frequency represents the percent of that particular layer that is made up of that individual mesh. In the above samples for layer 1, one mesh constitutes 20% percent of the foliage and the other 80% on a given tile when painted.

Scale scales the foliage object.

Stiffness determines how stiff an object is. If set to 0 the foliage tends to tilt with the terrain, but if set higher it becomes more erect and straight pointing straight up, such as when a tree is planted on a hill and you want the tree to be pointed towards the sky rather that at angle.

Collision sound is a sound hook that triggers a sound when something collides with the foliage.

ColorVariation provides a color deviation in the foliage so it does not all appear as the same object.

Hell Bushes  
There is another type of foliage in the game that does not utilize the EDIT FOLIAGE mode but rather the PATH EDIT mode but it will be described here. This type of foliage is referred to as Hell Bushes and they are created by defining a path that functions like a string of popcorn where the popcorn are object meshes. The density of the objects along the string are determined by the distance property defined in the PRP file using syntax like that below. Examples of Hell Bushes in the game are the bushes that encircle Yavin 1.
```C#
TreeLine()
{
    Path("jungle1")
    {
        Distance(28);
        BorderOdf("end_prop_treebill.odf");
    }
}
```

**OBJECT EDIT MODE**  
Object edit mode allows for importing and in some cases configuring instance properties of objects created with Softimage XSI and defined using Object Definition Files (ODF). Once an object has been set up and loaded into the world's ODF directory the editor can be launched and the object will be found if it's name is typed into the ODF File input box. Once imported an object can be placed using the ACTION MODE: PLACE. From there the object can be moved and manipulated.

ACTION MODES  
Object actions include SELECT, PLACE, and MULTI SELECT. These are self explanatory with the additional sidebar that once an object is selected and being placed, all one has to do to duplicate the object is to continue clicking the mouse on the terrain to add additional copies.

SNAP TO  
SNAP TO provides toggles to snap objects to grid squares when moving or a specific degree intervals when rotating. The rotation of an object can be reset to it's default state using RESET ROTATION.

ALIGNMENT  
In conjunction with the keyboard controls the alignment controls make used of world and object geometry to align objects.

USE ROOT or ORIGIN is utilized when rotating objects. These settings determine whether what point in an object's geometry is used as an axis of rotation.

GROUND TO TERRAIN and OBJECT determines whether an object snaps to the terrain or another object when the GROUND OBJECT button is selected. Grounding to the terrain or object makes use of the select object's geometry and origin, so depending on the model it's position on the ground may need to be adjusted to prevent it from floating above or being embedded in the terrain. Objects ground to terrain by default when adding them to a world but their height can be set manually as well. To ground an object to another object, simply set the mode to OBJECT with the first object selected. It is assume the first object is located above the object it is being grounded to, so when the GROUND OBJECT is selected the top object snaps to the bottom one rather than dropping through it to the terrain height.

SELECTABILITY  
Selectability provides controls for hiding individual objects using the HIDE toggle and disabling objects in the editor from being selected using the ACTIVE toggle. These are used when dealing with cluttered maps and one needs to work around a lot of objects. To change the properties of an object that is no longer ACTIVE as selectable it must be selected from the OBJECT BROWSER at the bottom of the screen.

HEIGHT  
Height is specified in meters and LOCK will the height of a selected object or group of objects,

ODF FILE  
ODF file specifies the name of the objects ODF file.

NAME  
NAME specifies the name of the object for editor purposes only as it appears in the object browser list.

LABEL  
LABEL is used to define the key string that referenced in the localization file. This descriptor can then be translated into multiple languages.

TEAM  
Some object can make use of the TEAM field, most specifically command posts. This field and those in the OBJECT INSTANCE control panel address instance properties for objects with advanced functionality.

TOGGLE BROWSER  
This button toggle the large object browser window at the bottom of the screen.

OBJECT INSTANCE PROPERTIES  
This control panel exposes object specific settings that can be applied a case by case basis for each instance of an object in a world. There are typically default settings for these objects defined in common ODFs that are overwritten in the world file when an instance is placed. There are COPY TO and COPY FROM buttons that allow the selecting of one object, copying, selecting a second, and then pasting the properties to another instance. There are PGUP and PGDN controls to page through large collections of properties.

**PATH EDIT MODE**  
PATH EDIT MODE is used for creating UNIT SPAWN Paths. Unit SPAWN PATHS consist of a string of SPAWN nodes that contain color axes that indicate the direction the unit will face when spawned. Spawn paths can be named and that name referenced in object instance properties such as in the case of command posts. PATH nodes can be rotated using the standard keyboard and mouse controls and like objects snap to the terrain first. Nodes and paths can have their heights adjusted and locked using the LOCK HEIGHTS button and/or by holding the shift key.

NEW PATH  
In NEW PATH mode a new path name is generated and the mode changes to ADD NODE. In this mode every mouse click on the terrain places a node.

MOVE  
Once placed a path can be moved by right clicking on it while nodes can be selected and moved individually if they are selected with the left mouse button.

TAPE MEASURE  
PATH EDIT MODE comes with a tape measure that can be used to measure distances in meters.

**REGIONS EDIT MODE**  
There are many types of regions. Examine the assets that came with these tools to examine their properties. In general they are Capture Regions, Control Regions, SoundStream Regions, SoundTrigger Regions, SoundSpace Regions, Shadow Regions, Death Regions... and probably more. Capture and control are explained in the Mod1 tutorial. As an example it explains that the RegionID property is arbitrary for use in the editor only while the Properties field is what defines the effect the region has in game. Capture and Control Regions simply need to be referenced to be functional. Other regions, such as SoundStream regions have properties and parameters that need to be more elaborately defined. Mod2 contains a simple example of how a SoundStream region is set up. The RegionID is arbitrary, but the properties always begins with SoundStream then the name of a SoundStreamProperty, then a number. The number represents a calculated rolloff point (1 over the number is the number of meters the sound rolloff begins) and this understood by the game engine. Similarly SoundTrigger Regions are regions that play a sound when a unit enters them. An example of this is the "Transport One is Away" announcement inside the bunkers and hangar on Hoth. SoundSpace Regions call soundspace properties that affect what kind of reverb and occlusion the sound heard within a region exhibit. Shadow Regions apply lighting properties different from those of the outdoor world. This basically blocks the sun virtually because the sun and ambient light pass through objects and a solution for blocking light in addition to lighting is needed. Death Regions are just regions that kill a unit of entered. These are used to kill units that fall into traps or spaces that cannot be escaped. They are simply named and defined in the mission lua to function. One other is a Rain or No Rain region such as those used on Kamino to block rain from appearing indoors.

REGION ACTIONS  
Regions are declared first as groups because they can share properties. To create a region NEW REGION must first be selected in ACTION mode and then the terrain clicked for it to be placed. Once placed, a region can be selected when in SELECT mode and it's properties set and adjusted. Regions can only be BOXes, SPHEREs, and CYLINDERs, in some cases such as sound, must be of a certain shape to function. Regions can also be snapped to grid tiles using the SNAP TO toggle.

**HINT NODE EDIT MODE**  
HINT NODEs are hotspots that when an AI is in range triggers the specified behavior in the unit. There many node and behavior types, some with primary and secondary stances for deeper control over the unit's behavior. Hint nodes should be used in moderation for the best performance and AI behavior. Hint Nodes have indicators that illustrate the hot spot and direction the unit must be facing to perform the behavior.

NEW NODE  
Selecting NEW NODE in the ACTION control panel will allow for the placement of a new node with each mouse click.

MOVE  
Once placed a node can be select by changing to MOVE mode and it's properties adjusted.

TYPE  
The TYPE controls set the node types as well as any subsequent behavior that can be controlled. The node types are SNIPE, PATROL, COVER, ACCESS, JETJUMP, MINE, and LAND. SNIPE affects marksmen, PATROL causes units to hang around an area changing position, COVER causes AI to duck behind the object the node is placed behind, ACCESS is aesthetic and causes a unit to stand in front of an object like a control panel as though they are doing something, JETJUMP targets jet troopers and can be used to control whether or not they leap up to higher levels such as the huts in the tees on Endor, MINE specifies a spot for the AI to place a mine field, and LAND targets Carriers for landing a deploying troops. Some of these have primary and secondary stances that cause a unit to stand, crouch, go prone, or face left or right. A METANODE allows for a behavior to be applied to a greater realm of influence or collection of nodes.

NAME  
Hint Nodes can be named for convenience in the editor.

TOGGLE HEIGHT  
This toggle controls the ghosted height indicators that appear on objects in the editor such as hint nodes, This is just a visual indicator that can be changed to make it easier to see how this nodes line up in the editor as objects of infinite height. These same controls apply to other edit modes as well and they all have controls to change the height as well as transparency of the height indicators.

**BARRIER EDIT MODE**  
Barriers act as invisible boxes that the AI recognize and calculate the area of in order to plot a course around objects. Each barrier also has a set of filters that determine what AI types can pass through them. AI cannot chart a course to a command post that is within a barrier filtering out that AI type. Barriers are created by selecting NEW from the EDIT BARRIER ACTION mode. When NEW is selected if the terrain is clicked with the left mouse button the first point of the rectangular barrier is placed and the shape begins to grow from the anchored point as the mouse is moved. Clicking a second time anchors the second point, and a third time the third anchor which places a barrier whose shape can be adjusted if the ACTION mode is set to STRETCH. The entire rectangle is selected so the barrier can be moved using MOVE mode. When moving a barrier if the shift key is held the corner of the barrier will snap to the nearest corner of an adjacent barrier. When ROTATE mode is selected if a barrier is clicked on the corner closest to the click point will become an anchor point for rotating the barrier.

BARRIER FILTERS  
BAN controls define the filters for each barrier. The ban filters include Solider, Hover, Small, Medium, Huge, and Flyer which apply to an object's ClassLabel as defined in the vehicle or unit's ODF file. Flyers handle barriers differently that other vehicles because they move faster and change course in a different manner. As a result barriers for Flyers should be larger to give them more time to change course before getting too close to an object.

TOGGLE HEIGHT  
This button toggles the visibility of the barrier height in the editor. Barriers have infinite height in game and the TOGGLE HEIGHT function makes it possible to extended the barrier shading. HEIGHT and ALPHA display control the actual height of the shaded area as well as it's alpha transparency value.

BARRIER LIST  
Barrier names are utilized in the editor only and therefore are arbitrary. Typically the default names are used.

**PATH PLANNING AND CONNECTIVITY GRAPHS**  
PLANNING PATHS are made up of Hubs and Connections forming a Connectivity Graph that defines routes taken by AI as they plot a course to a command post. When an AI unit plans a path to a command post it looks for the closest command post that is not owned by it�s team and charts a course. By default, the AI will take the most direct course from it�s starting point, a straight line. When a connectivity graph is present the AI looks first for the nearest command post, then the nearest connectivity hub and sets whichever is closer as it�s destination.

PLANNING Mode allows for the creation of invisible HUBS and CONNECTIONS that provide paths and areas for artificially intelligent movement by non-player characters. When AI NPCs move about the map they start at a Hub and pick a destination Hub before establishing a path along Connections that link Hubs.

AI NPC MOVEMENT  
AI NPCs can only travel from Hub to Hub via Connections. When an AI NPC moves it plots a course from a starting Hub to a final destination Hub. It first identifies the nearest connected Hub along a path that ultimately connects to the final destination Hub, and establishes the nearest Hub as a Primary Destination Hub. Rather than plot a direct course to the hub, secondary destinations along the connection are established to act as waypoints between Hubs. When the AI NPC reaches the Primary Destination Hub, it then revaluates the path to the Final Destination Hub and selects a new Primary Destination Hub that is along the shortest path to the Final Destination Hub and repeats the process moving the NPC one Hub closer to Final Destination Hub. This process is repeated until the NPC reaches the Final Destination Hub. Filters can be applied to connections and hubs that remove them from an AI NPC�s destination selection process. Connections between hubs can given Weights in order to create less favorable connections for an AI NPC to choose from when selecting connections as possible paths. By changing the weight of hubs and connections, preferred paths for AI NPC to follow can be created.

HUBS  
Hubs are areas that act as primary starting points and destinations as well as secondary waypoints along paths that AI NPCs are allowed to follow. A hub cannot exist by itself, so in creating one Hub a second is required for it to be functional. Hubs can be any size but are circular in shape. The size and shape of connections are created automatically to meet the size and shape of the hubs to which it is connected.

To place a Hub select the NEW HUB option while in Planning mode. With New Hub selected, clicking on the map will create a sticky circle marquee and a transparent white column that changes diameter as the mouse is moved forward and backward. When the mouse is clicked a second time, the circle�s size is locked and the Hub is placed. Each Hub can be named by overriding the default Hub name that appears in the Name input field. Typically hub names are not changed.

Once placed, selecting EDIT/MOVE HUB can be used to move a Hub. Hold down the mouse while over a Hub and it will move with the cursor until the mouse button is released.

To delete a Hub select it with the mouse and then press the Delete key on the keyboard.

CONNECTIONS  
Connections are areas that act as paths and areas for secondary waypoints between an AI NPC�s starting and destination Hubs.

CREATING CONNECTIONS  
A Connection can be created between two Hubs by selecting the New Connection option and clicking on a Hub. A rectangle will attach itself and rotate around the hub with the movement of the mouse as well as change in size until a second hub is selected, connecting the two hubs. When the unattached Connection comes near a hub it will snap to the hub�s size automatically but will not attach itself until the left mouse button is clicked. To delete an unattached connection click the right mouse button at any time.

EDITING CONNECTIONS  
To break a connection with one hub and attach it to another select the Edit Connections option from the menu and click on the connection with the left mouse button to select it. Right click on the attached hub and hold the mouse down to break the connection and the rectangle will once more follow the mouse and snap to hubs until the right mouse button is released. To delete the unattached connection simply release the right mouse button while the connection is not attached to hub.

HUB AND CONNECTION APPEARANCE  
When Hubs and Connections are placed in the editor their size and shape as they appear is for editing purposes only. The hubs and connections are represented in the editor by two-dimensional lines that appear on the map vertices surrounded by light shaded columns that provide a sense of path volume, but in reality the height and depth are infinite. The appearance of the light shaded columns map-wide can be toggled on and off by selecting Toggle Hub Height or Toggle Connection Height on the menu accordingly. Using the Height and Alpha input fields can alter the height and transparency of the shaded columns.

FILTERS  
Planning filters work on connections and they specify which units are allowed to use a connection. These function similarly to those in BARRIER EDIT MODE making use of toggle that can be changed once a connection is selected.

WEIGHTS  
By default each connection from a starting hub to a destination hub has a weight of 100. To change the weight of a connection in the AI�s selection process select Edit Weights from the menu and click on a starting hub. The connection will change color to yellow and when the mouse is moved outside the hub a line will be attached to the cursor until a destination hub is selected by clicking on it with the left mouse button. To delete an unattached path weight, click the right mouse button at any time. Once attached to a destination hub, the weight can be changed by entering a new weight in the Weight input field on the menu. WEIGHTS allow for greater control over which connections are used by AI as they move towards their final destination hub next to a command post.

INFINITE HEIGHT  
The game has no 3D pathing so like barriers, Planning Paths have infinite height. This must be taken into consideration when constructing maps that involve stacked playing fields. Planning paths cannot overlap but rather must be joined using hubs.

**BOUNDARY EDIT MODE**  
Each map typically has at least one BOUNDARY that when crossed triggers a countdown to death and a message that the unit is leaving the battlefield. Boundaries are required not just to define the playable area on a map but also to control the aesthetic appearance of the battlefield. If a unit moves too close to the edge of the map, the edge of the terrain or sky can become visible.

CREATING A BOUNDARY  
A boundary is created by selecting the NEW BOUNDARY button under BOUNDARY ACTION MODE. This automatically generates a circular boundary that can be adjusted with the HEIGHT and DEPTH sliders so clicking the terrain to place a boundary is not necessary. Boundaries are a type of path so clicking on them with the right mouse button will allow them their position to be moved. Multiple boundaries can be used on a map, the death clock is only triggered if a unit is not within a boundary when they exist on a map.

BOUNDARY NAMES  
Boundary names are arbitrary but need to be properly declared in the mission lua script to be functional.