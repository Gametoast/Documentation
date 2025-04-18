SWBF Mod Tools

**EDITING NEW WORLDS WITH ZEROEDITOR**

After following the Quick Start instructions to create a world the new project is opened in BFBuilder automatically. Projects can also be opened from the PROJECT menu. The world created as part of the project can then be opened in the world editor -- Zeroeditor -- by clicking on the Edit <ModID> button.

Viewing in Zeroeditor  
When the editor launched it is displayed at a resolution of 1024 x 768 by default. These settings can be changed to a higher resultion by editing the config.ini file located in the Data<ModID> folder for each world created, and/or by editing the master file located in DataTemplate.

A license agreement awaits agreement and there is what appears to be a white background. This is actually a terrain-level view of the world, and the white color is the color used to represent a lack of texture on the terrain. When opened the world is displayed in the editor with the terrain in solid mode. This means the textures on the terrain are visible, but the world was just created with the BFBuilder tool which creates an unpainted terrain that appears as white.

To gain a better view, add a wireframe to the display by toggling the WIRE button under TERRAIN VIEW. This changes the display to show both textures and a wireframe. To display just a wireframe untoggle the SOLID button under TERRAIN VIEW.

Not much more than a line or two will be visible until the camera is moved around.

Hitting the TAB key will unlock the mouselook and allow you to change the position of the camera using:  
W and S to zoom in and out;  
A and D to pan left and right;  
F and V to raise and lower the camera.  
These keys are mirrored on the numberpad. Pressing the TAB key locks the camera again and changes the mouse to cursor mode. See the Zeroeditor Reference for complete keyboard controls.

Start by raising the camera above the terrain to get a look at the grid. Each square is 8 meters and the entire terrain by default is 256 squares by 256 squares resulting in a playing field 2048 meters by 2048 meters. Not all of this space is usable though, as you near the edge of the map not only will the edge of the world be visible in the game but it objects are too close to the edge the game will not perform properly.

To get a better look at the world, close the Layers window (Layers will be addressed in other sections) and select ADVANCED: CAMERA at the top right of the screen. This activates the advanced camera controls. In this window select the SET TOP DOWN VIEW button for a satellite view of the world. This may zoom out too far to see anything, so close the advanced camera control window and click on the small grey buttons just beneath the ADVANCED control panel under VISIBILITY. These buttons change the visibility range in 500 meter increments. This allows for a better view or better performance in model heavy worlds when navigating in the editor.

By default a world created with BFBuilder has the minimum requirements needed to function. That means there are only two visible objects in the world, and they are the command posts. Command posts are small and difficult to see, but there are a few ways to quickly locate them. One way is to look for the objects associated with them. This means not looking for the command posts, but for the spawn paths and capture regions always found attached to a command post.

Under SHOW select the PATHS and REGIONS buttons. This will make paths and regions visible at all times, no matter what edit mode is active. Paths appear as lines with nodes while regions appear as shaded polygons that either spheres, cylinders, or boxes. By default you'll see two sets of regions as well as two spawn paths on the map.

In addition to locating the objects associated with a command post every object in the game can be selected where it appears on the map or from a list. To select an object switch to OBJECT EDIT mode. At the bottom of the screen a list of objects will appear. If an object can't be found easily in the world it can be selected from the list. It will appear highlighted when selected, at which time pressing the "O" key will center the camera on the object.

Camera positions that are saved with the world can also be recalled using the 0-9 keys. Camera positions are saved using Ctrl-0 thru nine, and recalled by the same numbers without pressing Ctrl.

Once centered on a command post it's positions can be seen as can the spawn path, capture and control regions. Zoom in very close to the command post in order to get a good look at it. If the camera moves too fast use the < and > keys to adjust it's speed. The command post that is highlight will appear in a blue shaded box surrounded by a spawn path littered with spawn nodes within a blue region.

The nodes represent where units spawn with the green line pointing in the direction the units will be facing. By default the capture regions are spheres and the control regions are boxes. Capture regions are regions that if occupied by an enemy unit will trigger the capture of a command post. Control regions are needed for vehicles or objects that are influence by the command post. By default, no vehicles are in the world but the Control regions are added as a requirement of the command post.

With the command post selected in OBJECT EDIT mode, a control panel appears on the right of the screen that contains the object's instance properties. Each command post has unique defined properties, and it it is these properties that declare what spawn paths are associated with the command post as well as what regions and even more critical data such as the value of the command post to each team. While most of the instance properties are located on the right panel, two important properties are located at the bottom left of the screen. The first is Label. Most objects in the game don't need to be declared with a label, but command posts are a special case.

Labels are used as localization keys. Localization is the process of converting the text that appears on screen into multiple languages. For this reason the actual text that appears in game is not put in the label, but a key name is that is then referenced by a localization tool that can then replace that key name with the real label in the right language. In game, when at the unit selection screen there is a map on the right that allows players to select a command post to spawn at. Below that is displayed the localized name linked to a command posts key name. The key names attached to the command posts in the template are CP1Label and CP2Label. These are used by default so it is understood in the localization tool where the references come from.

The other important property located on the bottom left of the screen is TEAM. This number defines which team owns the command post. By default the template defines the Alliance or CIS as team 1. If each team does not own a command post the level will not run.

After looking at or editing the world, it can be saved in the Data<ModId>\\Worlds\\<ModID\\World1 folder. AFter closing the editor the world can be compiled by clicking the Munge <ModID> button. Once compiled a munge log will appear displaying any potential errors. This can be closed as can the command prompt window . These are presented to let the user know when the process is complete. The compiled world is copied automatically to BFBuilder\\AddOn and must be manually copied into the Star Wars Battlefront AddOn folder to be played.

If a compiled world does not seem to be reflecting changes made to it, it's a good idea to use the Clean button. A clean is where the compiled but prepackaged assets are deleted for rebuilding on the next munge. Sometimes files are not updated because they are corrupt or their filesizes have not changed. To ensure everything is rebuilt do a clean. As a world becomes more complex the more assets there are to compile and the longer the munge will take. For this reason performing a clean every time may slow down production.

Refer to the Zeroeditor guide for more deatils about how to use the various modes and features of Zeroeditor to manipulate worlds.