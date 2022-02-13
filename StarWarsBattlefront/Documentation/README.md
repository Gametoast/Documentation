SWBF Mod Tools **SWBF MOD Toolkit**

**Introduction**  
This kit will allow users to create their own levels for Star Wars Battlefront. These tools are unofficial and are not officially supported by Lucasarts or Pandemic Studios. Any support received from employees of either company is unofficial and neither company is obligated to respond to requests for support. Use them at your own risk.

**Guides**  
[Game Overview](game.md)  
[DATATemplate and Compiling](datatemplate.md)  
[Zeroeditor](zeroedit.md)  
[Getting Started](started.md)  
[Mod1 Tutorial](mod1tut.md)  
[Mission LUA Guide](luaguide.md)  
[ODF Guide](odfguide.md)  
[Art Design Guide](artguide.md)  
[Animation Guide](aniguide.md)

The Star Wars Battlefront mod tool kit consists of the applications, assets, and documentation required to build, test and run new maps.

Also included in this tool kit is a special add on for Softimage XSI 4.2 or greater that allows for the creation of new models for use in Star Wars Battlefront.

This tool kit consists of the following:  
\- Zeroedit, the map editor created by Pandemic Studios  
\- PartcleEditor, the application used to create particle effects  
\- XSI2MSHExporter, the XSI Add On for exporting models  
\- Munge compiler, a collection of applications that compile the game assets  

Also included in the Star Wars Battlefront tool kit are the pre-compiled assets used to create the missions, sides, and maps in the shipped version of Star Wars Battlefront. These precompiled assets consist of model files exported using the proprietary exporter, texture files typically created with Adobe Photoshop, binary and text files created by the map editor, and text files used to control the properties of everything in the game. These text files come in two forms, config files of various types and script files. The script files use a scripting language called LUA, but knowledge of LUA is unnecessary for making changes to the existing game.

SWBF Patch 1.11  
The tool kit is designed for use with Star Wars Battlefront version 1.11. The 1.11 update is required for the game to make use of Add Ons, such as Jabba's Palace and any additional maps or assets added to the game after it shipped. Once installed the patch creates a folder in the same location as the Star Wars Battlefront executable called AddOn. Each new map needs to be placed in it's own folder in the AddOn folder for version 1.11 to detect it and add it to the mission list so it is playable.

**Kit Contents**  
Included in this kit are two template mods; Mod1 and Mod2, as well as a directory entitled DATATEMPLATE. The creation of Mod1 is outlined in a tutorial, and the DATATEMPLATE directory is a blank folder structure specially prepared for duplication, renaming, and modifcation in order to create new levels. Zeroeditor, the level editor is also included as part of the DataTEMPLATE, and it's use is detailed in the included documentation.

Assets for worlds and sides that shipped with the game are included in the assets folder to be copied into world folders as needed. Also included in the assets folder are the Pandemic XSI Addon which allows new models to be exported for use in mods and SPTEST.exe, a special game executable that provides a console for displaying information used in building levels. The assets folder also contains the DATATAT3 folder which contains the precompiled Jabba's Palace addon. This is a good reference for Add Ons since it was the first add on and makes use of assets that shipped with the game as well as shipped separately. It also includes a third team, the Gammorreans, which serve as a reference for setting up a third side in an add on level.

Documentation assembled and written by Chris Fusco aka psych0fred  
Special thanks to Paul Baker, Chris McGee, and Juan Sanchez for their contribution to the documentation  
Kudos to Mike Zaimont for his awesome work on the editor and XSI plugin, Nathan Mates for building the invaluable SPTEST.exe, and Carey Chico for providing his valuable knowledge and support.