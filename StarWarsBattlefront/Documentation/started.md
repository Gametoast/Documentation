SWBF Mod Tools

**GETTING STARTED**  

While the BFBuilder.hta application makes it possible to quickly and easily build a new world, understanding the files created and their contents is important in making any further changes to a map. This guide goes through the creation of Mod1, which was created manually, without the use of BFBuilder.hta.

The map template used to by BFBuilder to create new worlds was designed to meet the minimum in game requirements to run a world with the exception of the sky. The sky template and assets come from Geonosis, which makes use of all of the object type that can exist in the sky.  

The template world was created manually without the use of the BFBuilder application. How is was created is detailed in the Mod1 Tutorial. [View the Mod1 Tutorial](mod1tut.htm)

The Template contains these minimum requirements:  
1 Terrain with a base texture (a blank base texture is used)  
2 Command Posts, one owned by each team  
2 Capture regions, one for each command post  
2 Control regions, one for each command post  
2 Unit Spawn Paths, one for each command post  
1 Properly configured mission lua script for each era (2 luas)  

Mod2 expands on the demonstration of minimum functionality by taking default world created by BFBuilder and adding Water, Vehicles, Props, Barriers, Path Plans, Map Boundaries, and global ambient sound.

While these templates and documentation do not detail all of the artistic capabilities, the assets used to make the worlds in the shipped version are provided for use. The objects from the shipped levels are usable in new mod levels and will function if set up correctly.

DATATemplate  
All new projects are created by BFBuilder by copying DATATemplate and then making necessary changes to reflect the name of the new project and world.

Since the base template does not add any new sounds to the game some of these files are unused. Other files, such as the mission lua files, need to be edited to match the needs of each new world. How to do this will be detailed later.

Template Sky  
Most of the work that is done to the sky is done manually by editing the sky file with a text editor. The assets required by the Geonosis sky are listed within the .sky file and each asset file was copied into the appropriate location in the template folder. To change the sky the new textures and gemoetry need to be copied into the the same folder and the Geonosis assets removed. Depending on the geometry of the sky, it may or may not display properly in the editor. Do not use the editor as a reference for the appearance of the sky, always check that in game. It is also important to note that texture and mesh files typically require .option files. Make sure any sky elements copied from another world include all of these files as well, and any new objects created need these created manually.

Adding Command Posts  
Command posts are added in Zeroedit by entering OBJECT mode and then selecting on BROWSE to find the ODF file. ODF files are Object Definition files, text files that define all of an object's properties in the editor and game. Since the Add Ons make use of assets that shipped with the game, the common odf files included in DataMod#\\common\\odf\\ are only present for representing objects in the editor. The common assets that shipped with the game are locked, and no additional ODFs or MSH files can be added to DataModID\\common because they would not exist in the compiled files that shipped with the game. Among these common objects are various command posts, the most common of which is called com\_bldg\_controlzone.odf. This can be found by browsing in object mode to DataModID\\common\\ODF\\ and selecting com\_bldg\_controlzone.odf.

Objects  
Once an object ODF such as a command post is selected the editor returns to select mode. To place the object in the world PLACE mode must be selected before clicking on the terrain where the object is placed. If the terrain is clicked more than once, more than one object will be placed until the mode is returned to SELECT.

Command Post Properties  
Two command posts were placed before returning to select mode and selecting one of them. With one of the command posts selected it's properties were configured in the panels on the left and right of the screen.  
These include:  
Name: used by other objects to reference command post  
Label: used for language localization  
Team: specifies who owns the command post at mission start  
CaptureRegion: specifies name of command post's capture region  
ControlRegion: specifies name of command post's control region  
SpawnPath: Specifies name of command post's spawn path  

Other fields were either blank or filled in with defaults and no other changes were required. Typically command posts are named CP1, CP2, CP3, etc and their label mirrors those names but in the case of mod1 the label was changed to highlight where the information required for localization comes from. For that reason CP1Label and CP2Label were used. Since each level requires a command post be owned by each team, under Team for CP1 team 1 was specified and for CP2 team 2 was specified.

Capture and Control Regions  
Capture and Control regions are just two types of regions used in the game. Every command post must have a capture and a control region, and although the control region is not always required it is good practice to always create both. Regions are created in Zeroedit's Region mode. Once entering region mode NEW GROUP is selected and whatever region shape is selected will appear at the tip of the mouse to be placed. The capture and control regions can reside anywhere and be any shape, but typically the capture region surrounds the command post with the control region nearby. The RegionID property is only used to track multiple regions in the editor, and the Properties property is where the command post looks for the region names. For that reason in Mod1 the command post capture region RegionIDs were name CP#Sphere and CP#Box to represent their shape and illustrate where the command post is retrieving the region name. The properties for each were labeled CP#Capture and CP#Control as specified in each command post instance properties.

Spawn Paths  
With command posts and capture regions in place, all that is left to add before the mission is playable is Unit Spawn Paths. Spawn paths are added by entering spawn mode and selecting new path. Each path is created a node at a time, each node representing the location a unit can spawn in. By clicking around CP1 several times a path of nodes was created. Right clicking deselected the path and the name of the path was entered into the Path Name input field as CP1Spawn. This naming convention also works well and was applied to the same way to CP2.

Localization  
Localization uses base strings such as CP1Label.name and stores them in a file so different language translations can be created. To set it up so the names appear properly in English. Clicking on Localize ModID opens the MultiLanguage tool which contains scopes and keys for game variables to be translated. Inside that file the planet name can be seen and any command posts or other objects that need to be localized. Entries do not appear by default, they must be added as scopes and keys in a heirarchy delimited by periods. For example in the mission lua the mission objectives are listed in the form:

level.mod1.objectives.1 level.mod1.objectives.2  
level.mod1.objectives.3  

This denotes the localization string within the MultiLanguage tool that appears as the tree:  
level  
    Mod1  
        Objectives  
            1  
            2  
            3

Selecting the keys in the MultiLanguage Tool exposes a text field so the text displayed in game can be edited.

Some present by default are there for example purposes and are not used.

Mission LUAs  
Mission lua files, such as ModIDa.lua define all of a level's properties. In setting up the template many lines were commented out in the luas as they were not needed. In addition, the sound files loaded by the level were set to TAT, which shipped with the game. For that reason no sounds were compiled for use in the new level and none of the sound files needed setting up. See the Mission Lua Guide for more information.