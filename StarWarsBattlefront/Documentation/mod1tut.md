SWBF Mod Tools **MOD1 TUTORIAL**

PLEASE NOTE: MOD1 was created manually. Worlds can now be created in seconds using BFBuilder.hta.

MOD1 SAMPLE MAP  
Mod1 was the first map created as a sample that utilizes the minimum assets required for a functional world. The Mod1 sample map was created by first building the DATATEMPLATE directory and file structure so modders had a template that could be modified to accommodate new worlds. For other mods, the DATATEMPLATE directory can be copied and renamed to match the world name. For example DATATEMPLATE could be renamed to DATADan1 for Dantooine, or in the case of the Mod1 sample DATAMod1 for Modification1. Once the template has been copied and the folder renamed, individual files required to compile the level need to be changed to reflect the new level name and folder names.

Below is a list of the files and folders to be changed. Those prefaced with a (+) are mandatory, the rest are optional.
```
\\BFBuilder\\DataTEMPLATE\\ - copy and rename folder
\\BFBuilder\\Data%COPY%\\soundmunge.bat - edit mod references if necessary
\\BFBuilder\\Data%COPY%\\\_BUILD\_PC\\clean.bat - edit mod reference if necessary
+\\BFBuilder\\Data%COPY%\\\_BUILD\_PC\\munge.bat - edit mod and mod1 references (mod1 defines addon folder name)
\\BFBuilder\\Data%COPY%\\\_BUILD\_PC\\sound\\clean.bat - edit mod reference if necessary
\\BFBuilder\\Data%COPY%\\\_BUILD\_PC\\Worlds\\clean.bat - edit mod reference if necessary
\\BFBuilder\\Data%COPY%\\\_BUILD\_PC\\Worlds\\MOD\\ - rename folder if necessary
+\\BFBuilder\\Data%COPY%\\\_BUILD\_PC\\uninstall\_from\_pc.bat - edit mod1 references (mod1 defines addon folder name)
\\BFBuilder\\Data%COPY%\\\_BUILD\_PC\\Worlds\\MOD\\ - rename folder if necessary
\\BFBuilder\\Data%COPY%\\\_BUILD\_PC\\Worlds\\MOD\\munge.bat - edit Modification and mod references if necessary
\\BFBuilder\\Data%COPY%\\\_LVL\_PC\\MOD\\ - rename folder if necessary
\\BFBuilder\\Data%COPY%\\\_LVL\_PC\\Movies\\mod1.mvs - replace file and rename if necessary
+\\BFBuilder\\Data%COPY%\\\_SOURCE\_PC\\Shell\\Movies\\mod1.mlst rename file (must) and edit mod1 ref if necessary
+\\BFBuilder\\Data%COPY%\\addme\\addme.lua - edit mod1 references and map name for maplist
+\\BFBuilder\\Data%COPY%\\Common\\mission.req - edit mod1 references
+\\BFBuilder\\Data%COPY%\\Common\\Mission\\mod1a.req - rename file and edit mod1 references
+\\BFBuilder\\Data%COPY%\\Common\\Mission\\mod1c.req - rename file and edit mod1 references
\\BFBuilder\\Data%COPY%\\Common\\Scripts\\MOD\\ - rename folder if necessary
+\\BFBuilder\\Data%COPY%\\Common\\Scripts\\MOD\\mod1a.lua - rename file, edit mod1 references
+\\BFBuilder\\Data%COPY%\\Common\\Scripts\\MOD\\mod1c.lua - rename file, edit mod1 references
+\\BFBuilder\\Data%COPY%\\Shell\\Movies\\mod1.mcfg - rename file (must) and edit mod1 references if necessary
\\BFBuilder\\Data%COPY%\\Sound\\worlds\\mod\\mod.req - rename folder and file if necessary
+\\BFBuilder\\Data%COPY%\\Sound\\worlds\\mod\\mod1.asfx - rename file
+\\BFBuilder\\Data%COPY%\\Sound\\worlds\\mod\\mod1cw.req - rename file
+\\BFBuilder\\Data%COPY%\\Sound\\worlds\\mod\\mod1gcw.req - rename file
\\BFBuilder\\Data%COPY%\\Worlds\\Modification\\ - rename folder
+\\BFBuilder\\Data%COPY%\\Worlds\\Modification\\mod1.req - rename file and edit mod1 references
```

When all of the changes have been made a new world can be saved within the folder Data%COPY%/Worlds/Modification/World1, where TEMPLATE and Modification are reflective of the new world name such as DataDAN1/Worlds/Dantooine/World1. To save a new world into this folder, an existing world can be opened and saved under a new name or a new world can be created and saved without first opening an existing world. When creating the DATAMOD1 sample Mod1, the world was created from scratch.

LAUNCHING ZERO EDIT  
To create a world without first opening an existing world, run the copy of Zeroeditor.exe that resides in the Data%COPY% directory where the new world is to reside. At runtime Zeroeditor creates an index of all files that reside beneath it's current directory and uses that index when opening or using files. As a result, editor launch times can be slow when the editor has to index multiple world assets so each Data directory (including DATATEMPLATE) has it's own copy of the editor that is duplicated with the template.

CREATING A WORLD FROM SCRATCH  
Once Zeroedit has been launched, select TERRAIN from the ADVANCED menu in the top right corner of the editor. A window will pop up that will allow the new terrain size to be specified before selecting the CREATE button to actually generate the terrain. Once the terrain has been created, simply save the world to the new directory under DataDan1\\Worlds\\Dantooine\\World1\\. All of the files saved by Zeroedit are saved in the World1 folder, and when a world is saved for the first time the world file name must include the .WLD extension, such as Dan1.wld. The length of the world file name is not limited.

WORLD FILE TYPES  
When the world is saved many files are saved with names that correspond to those specified in DataDan1\\Worlds\\Dantooine\\Dan1.req. This .REQ file is known as the world req, and among other properties it declares the name of the world file (WLD) and it's associated files such those required for paths (PTH), props (PRP), boundaries (BND), connectivity graph (path plans) (PLN), and environment effects (FX). If the names in the world req do not correspond to the names of the files in the world directory, the level will not compile properly.

SKY TEMPLATE  
While the DATATemplate directory does not contain any world or object files, it does contain the textures and meshes that make up the Geonosis sky which is used as a default template for the sky file when a world is created from scratch. For this reason when a world is created using the TERRAIN/CREATE button and subsequently saved, it will automatically save a working sky file. It is also for this reason that when creating a world from scratch Zeroedit should be closed and the world reopened to access the newly saved data.

MINIMUM REQUIREMENTS  
After reopening the world file, the minimum requirements for a world to compile and run can be added.  
They are:  
2 Command Posts, one owned by each team  
2 Capture regions, one for each command post  
2 Control regions, one for each command post  
2 Unit Spawn Paths, one for each command post  
1 Properly configured mission lua script for each era (2 luas)  

COMMON OBJECTS  
All game objects and their properties are defined by an Object Definition File (ODF file). Common objects are located in the DATATEMPLATE/Common/ODF folder for each world. Do not change the contents of this folder. It contains ODFs only so objects that shipped with the game can appear in the editor while editing. After compiling, any common objects contained in a world are pulled from the assets that shipped with the game rather those compiled in a mod.

ADDING OBJECTS  
Command posts are common objects located in the DATATEMPLATE/Common/ODF folder. To add a command post to Mod1 Zeroedit was changed to OBJECT EDIT MODE and from the EDIT OBJECT TOOLS the BROWSE button under ODF FILE was selected. This launches a file explorer window to specify the ODF file to import into the world as an object.

COMMAND POSTS  
The two most common command post types are Major and Minor Command Posts. Major Command Posts are large and take longer to capture while Minor Command Posts are smaller and take less time to capture. Major Command Posts are defined by the ODF called com\_bldg\_major\_controlzone.odf while Minor Command Posts are defined by the ODF called com\_bldg\_controlzone.odf. Two minor command posts were added to Mod1.

PLACING OBJECTS  
Once an ODF file is selected from the file explorer the EDIT OBJECT ACTION mode must be set to PLACE. After selecting PLACE the object being placed in the world can be seen attached to the end of the mouse cursor. To place the object simply left click on the terrain where it should go.

SELECTING OBJECTS  
Once an instance of an object is placed the EDIT OBJECT ACTION mode can be changed to SELECT and the object can be clicked on in the world with the left mouse button to select it. When this is done it's INSTANCE PROPERTIES are exposed for defining in the toolbars on the left and right side of the editor.

OBJECT INSTANCE PROPERTIES  
Command Post objects have object instance properties that can be configured for each instance of an object on a level. In the case of command posts required object instance properties are NAME, LABEL, TEAM, CAPTURE REGION, CONTROL REGION, and SPAWN PATH.

NAME is used internally to reference the command post.  
LABEL sets a flag that is referenced by the Multi-Language tool used for localization.  
TEAM can be either 0, 1, 2, or 3, where 0 is neutral and 3 is a third team if present.  
CAPTURE REGION is the name of the Capture Region attached to the command post.  
CONTROL REGION is the name of the Control Region attached to the command post.  
SPAWN PATH is the name of the unit spawn path attached to the command post.  

NAMING CONVENTIONS  
For ease of use command posts are typically name by number such as CP1, CP2, etc. This name and number is then used as the prefix to reference all of the instance properties. Label becomes CP1Label, CaptureRegion is CP1Capture, ControlRegion is CP1Control, and SpawnPath is CP1Spawn.

TEAM  
Since each map must have at least one command post owned by each playable team CP1 is typically assigned to Team 1, which is always the attacker as defined by the mission lua script. In the case of Mod1, the attackers are the Alliance and the CIS.

SELECT AND ADD  
After placing and filling in the input fields defining an object's instance properties, the EDIT OBJECT ACTION mode can be changed back to PLACE into order to place additional instances of the same object. Just as before the object to be placed appears at the tip of the mouse cursor until the terrain is selected with the left mouse button. When an additional instance of an object is placed and the new instance selected, the NAME, LABEL, and TEAM definitions are carried over from the previous instance. The number at the end of the name field is incremented 1 for each new instance because each command post must have a unique name, and it's one less field that needs to be changed when defining the new instance properties. Two minor command posts were added to Mod1 and their instance properties filled out according to the naming convention described above. The second command post was assigned to team 2.

COMMAND POST REGIONS  
Once command posts have been setup they must be attached to CAPTURE and CONTROL REGIONs. A CAPTURE REGION is a zone that when entered by an enemy unit triggers the capture of a command post. A CONTROL REGION is a zone attached to a command post that defines the area under influence of a command post. Typically this is only used to define an area where VEHICLE SPAWNs are placed in order to protect the vehicles from degradation while they are within the control region. Capture and Control regions attached to a command post are typically located on top of or very near to the command post, but they can be located anywhere on the map.

ADDING REGIONS  
Regions are added to a world by changing Zeroedit to REGIONS EDIT mode and selecting NEW GROUP. Once NEW GROUP is selected the region to be placed will appear as a wireframe box at the end of the mouse cursor to be placed like an object. To change the shape of the region, a different shape can be selected from the EDIT REGIONS SHAPE toolbar. Capture and control regions can be any shape.

SPHERE was selected as the shape for CP1's capture region and it was placed on top of the command post. After placing the first region the EDIT REGIONS ACTION mode was changed to SELECT and the region selected for editing. The region was resized and it's position adjusted using the left mouse button and the Z and C keys. Upon selection the region's ID and properties are exposed at the top of the screen for defining. For Mod1 the RegionID for CP1's capture region was labelled CP1Sphere to indicate it's shape. The RegionID is arbitrary and is used to track individual regions in the editor and nothing more. What is more important is the region's properties, which is the field that specifies the name referenced by a command post. In the case of Mod1 CP1's capture region properties were defined as CP1Capture, which was the name defined in the command post instance properties under CaptureRegion. This was repeated for CP2's capture region, following the same naming convention as referenced by CP2's instance properties.

BOX was chosen as the shape for a new group to define as the ControlRegion for each command post. The same process that was followed for defining the capture regions is used to define the properties for the control regions. Normally control regions need to be adjusted and scaled to envelope VEHICLE SPAWNs under their influence, but in the case of Mod1 there are no vehicles so the regions were not adjusted and the control regions are only present as a requirement of the command posts.

UNIT SPAWN PATHS  
With regions attached to command posts all that is required in the world for it to be functional are SPAWN PATHS that allow playable units to enter the game. SPAWN PATHS are added using PATH EDIT mode. In PATH EDIT mode a new path is created by first selecting NEW PATH from the SPAWN PATH ACTION mode menu. In NEW PATH mode when the terrain is clicked on with the left mouse button a SPAWN NODE will be placed. Each time the terrain is clicked another node will be added to the path, each representing a point where a unit spawns. After clicking the terrain in an arc around a CP, the terrain was clicked with the right mouse button to deselect the path and change the SPAWN PATH ACTION mode to MOVE. The path was then adjusted by right clicking on it while holding the button down until it was positioned properly.

The PATH NAME field is selected once a path has been placed in order to name it. In the case of Mod1 the name specified in the command post instance properties was used as the PATH NAME, following the naming convention established. CP1Spawn was defined and the process repeated for CP2Spawn which was placed around CP2. Having defined the spawn paths, all that is left to make the world functional is setting up the mission lua scripts and making sure all of the appropriate files and folders have been edited in order for the level to compile. At this point the level can be saved and Zeroeditor closed because the remainder of the work takes place using a text editor.

MISSION LUAS  
Mission LUA scripts define all the of the global properties for a level and are required for each mission. Typically there are two missions per map, 1 Clone Wars Era mission and one Galactic Civil War Era mission. These mission lua scripts are named using the three letter and number level naming convention with a letter added to the end to denote the attacking team. In the case of Mod1, the lua scripts are named Mod1a.lua and Mod1c.lua. They could just as easily be Mod1i and Mod1r as long as the contents of each file define the attacker correctly.

Below is a line by line breakdown of Mod1a.lua with a brief explanation of what each section does. Comments about each line are prefaced with >>

```LUA
--mod1a.lua Start
-->>
-->> Note about Mission lua naming conventions:
-->> The mission luas must always following the three-letter, 1 number, 1 letter naming convention.
-->> COmments always appear prefaced by --

---------------------------------------------------------------------------
-- FUNCTION:    ScriptInit
-- PURPOSE:     This function is only run once
-- INPUT:
-- OUTPUT:
-- NOTES:       The name, 'ScriptInit' is a chosen convention, and each
--              mission script must contain a version of this function, as
--              it is called from C to start the mission.
---------------------------------------------------------------------------

function ScriptInit()
--  Empire Attacking (attacker is always #1)
    local ALL = 1
    local IMP = 2
--  These variables do not change
    local ATT = 1
    local DEF = 2
-->>
-->> The above section defines the two teams and which is declared as the attacker.
-->> The attacker on a map is always team 1, and the name of the mission lua script reflects the attacker.
-->>

--(mod1a means that Alliance is the attacker).
    AddMissionObjective(IMP, "red", "level.mod1.objectives.1");
    AddMissionObjective(IMP, "orange", "level.mod1.objectives.2");
    AddMissionObjective(IMP, "orange", "level.mod1.objectives.3");
    AddMissionObjective(ALL, "red", "level.mod1.objectives.1");
    AddMissionObjective(ALL, "orange", "level.mod1.objectives.2");
    AddMissionObjective(ALL, "orange", "level.mod1.objectives.3");

-->>
-->> The above section defines the localization strings for mission objectives.
-->> These are localization strings that are stored in the localization file which references
-->> the actual text that appears in the game. See the localization guide for more details.
-->>

    ReadDataFile("sound\\tat.lvl;tat1gcw")
    ReadDataFile("SIDE\\all.lvl",
        "all_inf_basicdesert",
    "all_inf_lukeskywalker",
        "all_inf_smuggler");

    ReadDataFile("SIDE\\imp.lvl",
        "imp_inf_basic_tie",
    "imp_inf_darthvader",
        "imp_inf_dark_trooper");

   -- ReadDataFile("dc:SIDE\\gam.lvl",
   --     "gam_inf_gamorreanguard")


-->>
-->> All ReadDataFile lines reference LVL files that contain assets that need to be loaded and
-->> the specific assets to be loaded by the level.
-->>

    SetAttackingTeam(ATT);

-->>
-->> The SetAttacking Team line denotes which team is the attacker and which is the defender
-->>

--      Alliance Stats
    SetTeamName(ALL, "Alliance")
    SetTeamIcon(ALL, "all_icon")
    AddUnitClass(ALL, "all_inf_soldierdesert",10)
    AddUnitClass(ALL, "all_inf_vanguard",1)
    AddUnitClass(ALL, "all_inf_pilot",2)
    AddUnitClass(ALL, "all_inf_marksman",2)
    AddUnitClass(ALL, "all_inf_smuggler",1)
    SetHeroClass(ALL, "all_inf_lukeskywalker")

--      Imperial Stats
    SetTeamName(IMP, "Empire")
    SetTeamIcon(IMP, "imp_icon")
    AddUnitClass(IMP, "imp_inf_storm_trooper",10)
    AddUnitClass(IMP, "imp_inf_shock_trooper",1)
    AddUnitClass(IMP, "imp_inf_pilottie",2)
    AddUnitClass(IMP, "imp_inf_scout_trooper",2)
    AddUnitClass(IMP, "imp_inf_dark_trooper",1)
    SetHeroClass(IMP, "imp_inf_darthvader")


-->>
-->> The attacker and defender stats define the team names, team icon, unit hero classes and their loadouts.
-->>

--  Attacker Stats
    SetUnitCount(ATT, 16)
    SetReinforcementCount(ATT, 200)
--    AddBleedThreshold(ATT, 31, 0.0)
--    AddBleedThreshold(ATT, 21, 0.75)
    AddBleedThreshold(ATT, 11, 0.75)
    AddBleedThreshold(ATT, 10, 1.5)
    AddBleedThreshold(ATT, 1, 3.0)

--  Defender Stats
    SetUnitCount(DEF, 16)
    SetReinforcementCount(DEF, 200)
--    AddBleedThreshold(DEF, 31, 0.0)
--    AddBleedThreshold(DEF, 21, 0.75)
    AddBleedThreshold(DEF, 11, 0.75)
    AddBleedThreshold(DEF, 10, 1.5)
    AddBleedThreshold(DEF, 1, 3.0)

-->>
-->> The attacker and defender stats set the team total units counts, the bleed thresholds and their triggers
-->>


--  Local Stats
 --   SetTeamName(3, "locals")
 --   AddUnitClass(3, "gam_inf_gamorreanguard",3)
 --   SetUnitCount(3, 3)
 --   SetTeamAsEnemy(3, ATT)
 --   SetTeamAsEnemy(3, DEF)

-->>
-->> Local stats sets up the 3 team on maps where there is an NPC team.
-->>

--  Level Stats
    ClearWalkers()
    AddWalkerType(0, 0)
   -- AddWalkerType(1, 4)
    AddWalkerType(2, 0)
    --SetMemoryPoolSize("EntityHover", 12)
    --SetMemoryPoolSize("EntityFlyer", 5)
--  SetMemoryPoolSize("EntityBuildingArmedDynamic", 16)
--  SetMemoryPoolSize("EntityTauntaun", 0)
--  SetMemoryPoolSize("MountedTurret", 22)
    SetMemoryPoolSize("PowerupItem", 60)
--    SetMemoryPoolSize("SoundSpaceRegion", 85)
    SetMemoryPoolSize("EntityMine", 40)
    --SetMemoryPoolSize("Aimer", 200)
--    SetMemoryPoolSize("Obstacle", 725)
    --SetMemoryPoolSize("EntityLight", 150)
    SetSpawnDelay(10.0, 0.25)
    ReadDataFile("dc:MOD\\mod1.lvl")
    SetDenseEnvironment("false")
    --AddDeathRegion("Sarlac01")
  --  SetMaxFlyHeight(90)
  --  SetMaxPlayerFlyHeight(90)

-->>
-->> Level stats declare various memory pools settings that need to be adjusted on
-->> an as needed basis as indicated by debug errors.
-->> Walker type memory allocations are declared in this section as well.
-->> The level world lvl to be loaded for a world is declared in this section as well
-->> as level-specific properties that need declaring such as the addition of a death
-->> region and the type of combat environment.
-->>



--  Sound Stats
    OpenAudioStream("sound\\tat.lvl",  "tatgcw_music");
   -- OpenAudioStream("dc:sound\\mod.lvl",  "mod1");
   -- OpenAudioStream("dc:sound\\mod.lvl",  "mod1");
    OpenAudioStream("sound\\gcw.lvl",  "gcw_vo");
    OpenAudioStream("sound\\gcw.lvl",  "gcw_tac_vo");
   --  OpenAudioStream("dc:sound\\mod.lvl",  "mod1_emt");
   --OpenAudioStream("dc:sound\\tat.lvl",  "tat3_emt");

    SetBleedingVoiceOver(ALL, ALL, "all_off_com_report_us_overwhelmed", 1);
    SetBleedingVoiceOver(ALL, IMP, "all_off_com_report_enemy_losing",   1);
    SetBleedingVoiceOver(IMP, ALL, "imp_off_com_report_enemy_losing",   1);
    SetBleedingVoiceOver(IMP, IMP, "imp_off_com_report_us_overwhelmed", 1);

    SetLowReinforcementsVoiceOver(ALL, ALL, "all_off_defeat_im", .1, 1);
    SetLowReinforcementsVoiceOver(ALL, IMP, "all_off_victory_im", .1, 1);
    SetLowReinforcementsVoiceOver(IMP, IMP, "imp_off_defeat_im", .1, 1);
    SetLowReinforcementsVoiceOver(IMP, ALL, "imp_off_victory_im", .1, 1);

    SetOutOfBoundsVoiceOver(2, "Allleaving");
    SetOutOfBoundsVoiceOver(1, "Impleaving");

    SetAmbientMusic(ALL, 1.0, "all_tat_amb_start",  0,1);
    SetAmbientMusic(ALL, 0.99, "all_tat_amb_middle", 1,1);
    SetAmbientMusic(ALL, 0.1,"all_tat_amb_end",    2,1);
    SetAmbientMusic(IMP, 1.0, "imp_tat_amb_start",  0,1);
    SetAmbientMusic(IMP, 0.99, "imp_tat_amb_middle", 1,1);
    SetAmbientMusic(IMP, 0.1,"imp_tat_amb_end",    2,1);

    SetVictoryMusic(ALL, "all_tat_amb_victory");
    SetDefeatMusic (ALL, "all_tat_amb_defeat");
    SetVictoryMusic(IMP, "imp_tat_amb_victory");
    SetDefeatMusic (IMP, "imp_tat_amb_defeat");



    SetSoundEffect("ScopeDisplayZoomIn",  "binocularzoomin");
    SetSoundEffect("ScopeDisplayZoomOut", "binocularzoomout");
    --SetSoundEffect("WeaponUnableSelect",  "com_weap_inf_weaponchange_null");
    --SetSoundEffect("WeaponModeUnableSelect",  "com_weap_inf_modechange_null");
    SetSoundEffect("SpawnDisplayUnitChange",       "shell_select_unit");
    SetSoundEffect("SpawnDisplayUnitAccept",       "shell_menu_enter");
    SetSoundEffect("SpawnDisplaySpawnPointChange", "shell_select_change");
    SetSoundEffect("SpawnDisplaySpawnPointAccept", "shell_menu_enter");
    SetSoundEffect("SpawnDisplayBack",             "shell_menu_exit");

    --SetPlanetaryBonusVoiceOver(IMP, IMP, 0, "imp_bonus_imp_medical");
    --SetPlanetaryBonusVoiceOver(IMP, ALL, 0, "imp_bonus_all_medical");
    --SetPlanetaryBonusVoiceOver(IMP, IMP, 1, "");
    --SetPlanetaryBonusVoiceOver(IMP, ALL, 1, "");
    --SetPlanetaryBonusVoiceOver(IMP, IMP, 2, "imp_bonus_imp_sensors");
    --SetPlanetaryBonusVoiceOver(IMP, ALL, 2, "imp_bonus_all_sensors");
    SetPlanetaryBonusVoiceOver(IMP, IMP, 3, "imp_bonus_imp_hero");
    SetPlanetaryBonusVoiceOver(IMP, ALL, 3, "imp_bonus_all_hero");
    --SetPlanetaryBonusVoiceOver(IMP, IMP, 4, "imp_bonus_imp_reserves");
    --SetPlanetaryBonusVoiceOver(IMP, ALL, 4, "imp_bonus_all_reserves");
    --SetPlanetaryBonusVoiceOver(IMP, IMP, 5, "imp_bonus_imp_sabotage");--sabotage
    --SetPlanetaryBonusVoiceOver(IMP, ALL, 5, "imp_bonus_all_sabotage");
    --SetPlanetaryBonusVoiceOver(IMP, IMP, 6, "");
    --SetPlanetaryBonusVoiceOver(IMP, ALL, 6, "");
    --SetPlanetaryBonusVoiceOver(IMP, IMP, 7, "imp_bonus_imp_training");--advanced training
    --SetPlanetaryBonusVoiceOver(IMP, ALL, 7, "imp_bonus_all_training");--advanced training

    --SetPlanetaryBonusVoiceOver(ALL, ALL, 0, "all_bonus_all_medical");
    --SetPlanetaryBonusVoiceOver(ALL, IMP, 0, "all_bonus_imp_medical");
    --SetPlanetaryBonusVoiceOver(ALL, ALL, 1, "");
    --SetPlanetaryBonusVoiceOver(ALL, IMP, 1, "");
    --SetPlanetaryBonusVoiceOver(ALL, ALL, 2, "all_bonus_all_sensors");
    --SetPlanetaryBonusVoiceOver(ALL, IMP, 2, "all_bonus_imp_sensors");
    SetPlanetaryBonusVoiceOver(ALL, ALL, 3, "all_bonus_all_hero");
    SetPlanetaryBonusVoiceOver(ALL, IMP, 3, "all_bonus_imp_hero");
    --SetPlanetaryBonusVoiceOver(ALL, ALL, 4, "all_bonus_all_reserves");
    --SetPlanetaryBonusVoiceOver(ALL, IMP, 4, "all_bonus_imp_reserves");
    --SetPlanetaryBonusVoiceOver(ALL, ALL, 5, "all_bonus_all_sabotage");--sabotage
    --SetPlanetaryBonusVoiceOver(ALL, IMP, 5, "all_bonus_imp_sabotage");
    --SetPlanetaryBonusVoiceOver(ALL, ALL, 6, "");
    --SetPlanetaryBonusVoiceOver(ALL, IMP, 6, "");
    --SetPlanetaryBonusVoiceOver(ALL, ALL, 7, "all_bonus_all_training");--advanced training
    --SetPlanetaryBonusVoiceOver(ALL, IMP, 7, "all_bonus_imp_training");--advanced training

-->>
-->> Sound stats declares all of the sound assets loaded for a level as well as mission-specific
-->> sound properties.
-->>

--  Camera Stats
--Tat 3 - Jabbas' Palace
    AddCameraShot(0.685601, -0.253606, -0.639994, -0.236735, -65.939224, -0.176558, 127.400444);
    AddCameraShot(0.786944, 0.050288, -0.613719, 0.039218, -80.626396, 1.175180, 133.205551);
    AddCameraShot(0.997982, 0.061865, -0.014249, 0.000883, -65.227898, 1.322798, 123.976990);
    AddCameraShot(-0.367869, -0.027819, -0.926815, 0.070087, -19.548307, -5.736280, 163.360519);
    AddCameraShot(0.773980, -0.100127, -0.620077, -0.080217, -61.123989, -0.629283, 176.066025);
    AddCameraShot(0.978189, 0.012077, 0.207350, -0.002560, -88.388947, 5.674968, 153.745255);
    AddCameraShot(-0.144606, -0.010301, -0.986935, 0.070304, -106.872772, 2.066469, 102.783096);
    AddCameraShot(0.926756, -0.228578, -0.289446, -0.071390, -60.819584, -2.117482, 96.400620);
    AddCameraShot(0.873080, 0.134285, 0.463274, -0.071254, -52.071609, -8.430746, 67.122437);
    AddCameraShot(0.773398, -0.022789, -0.633236, -0.018659, -32.738083, -7.379394, 81.508003);
    AddCameraShot(0.090190, 0.005601, -0.993994, 0.061733, -15.379695, -9.939115, 72.110054);
    AddCameraShot(0.971737, -0.118739, -0.202524, -0.024747, -16.591295, -1.371236, 147.933029);
    AddCameraShot(0.894918, 0.098682, -0.432560, 0.047698, -20.577391, -10.683214, 128.752563);

-->>
-->> The Camera stats section defines the coordinate for the screenshots that appear in the game using
-->> in game coordinates.
-->>


end

-->>
-->> The end of the lua function
-->>
```

Each line and more details about what can and can not be done in a mod can be found in the LUA GUIDE. In that guide mission luas for each era are gone over in detail. Other examples that can be used for reference are in the assets folder.

Munge and Compile  
All of the assets and the text files defining how they are used are compiled in a two step process that is collectively called a MUNGE. When a mod is munged numerous batch files are executed in order and compile the assets into the \_BUILD\_PC folder. The \_BUILD\_PC folder does not contain the final compiled binaries, but rather pre-compiled assets that are not the raw assets. These precompiled raw assets are needed to build one another, so when all of the pre-compiled assets have been created they are finally compiled into the LVL files that are used by the game. The \_LVL\_PC directory structure is where the final data is stored to be used by the game as an Add On.

To compile a world, simply run MUNGE.BAT located in the \_Build\_PC folder for the add on. When the munge is complete, the compiled files will be copied to BFBuilder/Addon/Mod# where mod# is the name specified for the new world. This mod# folder can then be copied to the LucasArts\\Star Wars Battlefront\\GameData\\AddOn and when the game is run the new level will appear on the mission list.

Before every munge it is a good idea to "do a clean" by running CLEAN.BAT. This will delete all of the munged files in \_Build\_PC and \_LVL\_PC to ensure they are rebuilt.

Testing With SPTEST.EXE  
SPTEXT.EXE can be copied to the same directory that the game executable is located (LucasArts\\Star Wars Battlefront\\GameData) and run instead of the default game executable. When SPTEST.EXE is run, the game runs in a window with console always open that displays any errors or asserts with the level. If the game does not run a build log is saved in the same directory as SPTEST.EXE so the problem can be fixed. This in combination with the munge log provides debug information needed to get a level up and running error free.