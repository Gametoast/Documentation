SWBF Mod Tools **The Mod Add On Build File Structure**

Included in the toolkit are sample mods set up with common assets that shipped with the game as working examples for reference. The mod tools working directory is outlined below.

**Detailed Description of Files**

**/BFBuilder** - main working directory  
    **/AddOn** - created upon first munge, copy your compiled mods from here to your SWBF Addon folder  
    **/Assets** - Folders of assets used to create worlds that shipped with game, XSI Addon, SPTEST.exe  
    **/Data** - directory of common assets from shipped game, needed for munge  
    **/DataMod1** - Sample mod working directory  
    **/DataMod2** - Sample mod working directory  
    **/Documentation** - Help files  
    **/ToolsFL** - Executables required to munge and compile.

**/DataTEMPLATE**  
  
    **/\_BUILD\_PC/** - munged and precompiled files, also where munge and clean are executed  
    **/\_LVL\_PC/** - compiled files game ready which are copied to /Data/Addon for copying to game folder  
    **/\_SOURCE\_PC/** - files required by munge for localization and movie data that plays when level is selected  
    **/addme/** - The addme.lua script which adds the mission to the mission list  
    **/Build/** - Zeroedit files  
    **/Common/** - where supplemental common assets reside  
    **/Shell/** - where add on movie files are stored  
    **/Sides/** - where supplemental sides assets are stored  
    **/Sound/** - where supplemental sound assets are stored and configured  
    **/Worlds/** - where world folders are stored  
            **/ModWorldName/** - where individual world assets are stored  
            **/Effects/** - where world-specific particle effects are stored  
            **/MSH/** - where object mesh files are stored  
            **/munged/** - where pre-munged assets such as animations are stored  
            **/ODF/** - where world-specific ODFs are stored  
            **/World1/** - where the Zeroedit saved files are stored  
    **/config.ini** - editor config file  
    **/edit\_pc\_addon\_localize.bat** - launches localization tool for add on level  
    **/soundmunge.bat** - used to compile sound  
    **/soundmungedir.bat** - used to compile sound  
    **/Zeroeditor.exe** - the level editor

It is important to understand how the worlds are built so they may be debugged, so this section will provide an overview on the location of assets and how they are assembled into a functional world.

**Process Overview**  
Functional worlds typically consist of a vertex heightmap terrain, object models, command post objects, unit spawn points, vehicle spawn pads, barriers, regions, ai path plans, map boundaries, and in some cases invisible collision objects.

**Objects**  
Models are built with Softimage XSI and exported using a proprietary Add On that provides additional functionality such as shadow collision, transparent and animated textures. The models are exported to mesh (MSH) files that are reference by text files called Object Definition Files. Object definition files define all of the properties of an object so that it functions properly in game as well as in the map editor.

**Map Editor**  
Zeroedit is the map editor which manipulates level objects. Once models have been properly prepared they can imported into a world and positioned accordingly. When a world is saved, different objects are saved in different files in the WORLD folder.

**Munge and Compile**  
All of the assets and the text files defining how they are used are compiled in a two step process that is collectively called a MUNGE. When a mod is munged numerous batch files are executed in order and compile the assets into the \_BUILD\_PC folder. The \_BUILD\_PC folder does not contain the final compiled binaries, but rather pre-compiled assets that are not the raw assets. These precompiled raw assets are needed to build one another, so when all of the pre-compiled assets have been created they are finally compiled into the LVL files that are used by the game. The \_LVL\_PC directory structure is where the final data is stored to be used by the game as an Add On.

To compile a world, simply run MUNGE.BAT located in the \_Build\_PC folder for the add on. When the munge is complete, the compiled files will be copied to BFBuilder/Addon/Mod# where mod# is the name specified for the new world. Before every munge it is a good idea to "do a clean" by running CLEAN.BAT. This will delete all of the munged files in \_Build\_PC and \_LVL\_PC to ensure they are rebuilt.