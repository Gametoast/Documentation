SWBF Mod Tools

**MISSION LUA GUIDE**  

In this guide two LUAs will be gone over, first explaining the sections and then explaining the individual lines and their arguments.

Mission LUA scripts define all the of the global properties for a level and are required for each mission. Typically there are two missions per map, 1 Clone Wars Era mission and one Galactic Civil War Era mission. These mission lua scripts are named using the three letter and number level naming convention with a letter added to the end to denote the attacking team. In the case of Mod1, the lua scripts are named Mod1a.lua and Mod1c.lua. They could just as easily be Mod1i and Mod1r as long as the contents of each file define the attacker correctly.

Below is a line by line breakdown of Mod1a.lua with a brief explanation of what each section does. Comments about each line are prefaced with >>

Originally there 4 maps per world minimum, one with each team attacking and different vehicle loadouts, unit loadouts, and strategies for each. This meant each world had four mission lua script plus one for the historical campaign denoted with an \_h in the name as in mod1a\_h.lua

A Word About Luas, Reqs, and Lvls  
These file types are intertwined. Reqs are requirements files and define assets required for a mission or object. Every REQ generates an LVL when munged. Munging is the what the compile process is called. During the munge req files are read and the assets compiled into LVLs that are then compiled inside other LVLs. These LVLs and sub-lvls are loaded and referenced in the mission lua script as it relates to loading assets for a given level. This same structure with added file types applies to art and sound in the game.

mod1a.lua Start
>>
>> Note about Mission lua naming conventions:
>> The mission luas must always following the three-letter, 1 number, 1 letter naming convention.
>> COmments always appear prefaced by --
```LUA
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
-->> The above section defines the script and the two teams and which is declared as the attacker.
-->> The attacker on a map is always team 1, and the name of the mission lua script reflects the
-->> attacker. In this case the Alliance is the attacker but it could just as easily be the Empire.
-->>


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
-->> the specific assets to be loaded by the level. First the sound.lvl is loaded and the sound assets
-->> for the specific era. In mods, for legal reasons the sound lvls that shipped with the game cannot
-->> be distributed, but if you would like to add sounds to the game functionality has been provided to
-->> build your own sound lvls in order to put sounds into your levels.

    SetAttackingTeam(ATT);

-->>
-->> The SetAttacking Team line denotes which team is the attacker.SetDefendingTeam(DEF); may also
-->> be called.
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
-->> The team stats define the team names, team icon, unit hero classes and their loadouts.
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
-->> sound properties. It addresses first sound type meaning stream or static effects, then begins
-->> pointing to assets within those streams and LVLs. This includes victory and defeat tracks, global
-->> sound effects, amibient streams, ambient emitters, command post voiceovers, bleed rate voiceovers,
-->> planetary bonus voiceovers for galactic conquest and for multiplayer heros.
-->>
-->> The global sounds and music are called as it relates to the mission and the sounds assets were
-->> built for each level and mesured to fit into memory. On the PC there should be an excess of free
-->> memory to add sounds and if these streams are not called the call can be replaced with one to a
-->> stream or static lvl you have created. Each command post can have specific voiceovers or common
-->> ones can be used.
-->>
-->> For legal reasons the sounds and music that shipped with the game cannot be used in mods without
-->> the mods being licensed so artists get paid for their work, and this includes all sounds that
-->> shipped with the game. Keep in mind sounds added to mods must also abide by the licensing
-->> agreement attached to the mod tools. Questions regarding usage can forwarded to the address in
-->> the agreement.
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
-->> in game coordinates. Using free cam mode in the SPTEST.exe supplied, modders can navigate to a spot
-->> and dump the coordinates to a file called cameracoordinates.txt by typing dumpcamera in the console.
-->>


end

-->>
-->> The end of the lua function
-->>
--End of Mod1a.lua script
```


This next lua was from Geonosis which had an active third team, the Geonosians. It also had every vehicle class and serves as a good sample to go through line by line. This script is geo1r.lua

```LUA
---------------------------------------------------------------------------
-- FUNCTION:    ScriptInit
-- PURPOSE:     This function is only run once
-- INPUT:
-- OUTPUT:
-- NOTES:       The name, 'ScriptInit' is a chosen convention, and each
--              mission script must contain a version of this function, as
--              it is called from C to start the mission.
---------------------------------------------------------------------------

-->> The header comments are self explanatory



function ScriptInit()
--  REP Attacking (attacker is always #1)
    local REP = 1
    local CIS = 2
--  These variables do not change
    local ATT = 1
    local DEF = 2


-->> The script is initialized and the teams defined. On geo the Republic was the
-->> attacker.

    AddMissionObjective(CIS, "orange", "level.geo1.objectives.1r");
    AddMissionObjective(CIS, "red", "level.geo1.objectives.2r");
    AddMissionObjective(CIS, "red", "level.geo1.objectives.3r");
    AddMissionObjective(REP, "orange", "level.geo1.objectives.1r");
    AddMissionObjective(REP, "red", "level.geo1.objectives.4r");
    AddMissionObjective(REP, "red", "level.geo1.objectives.5r");

-->> Mission objective strings serve as markers to the actual text to be used in
-->> game which resides in a localization file that is prepped for each language.
-->> If there is no info in the localization file that matches the strings in the
-->> lua, what you see above will be displayed in game. The argument itself sets
-->> the objects per team, color, and string. Use the multilanguage tool that
-->> shipped with the tools by doubleclicking edit\_pc\_addon\_localize.bat in the datamod/
-->> directory to use the tool. The scopes and keys in the sample should provide enough
-->> information to rename or add new scopes for your mods.


SetTeamAggressiveness(CIS, 1.0)
SetTeamAggressiveness(REP, 1.0)

-->> SetTeamAgressiveness is obsolete and is unused. Difficulty is determined in code
-->> using the difficulty settings in game or on a server.
-->>


    ReadDataFile("sound\\geo.lvl;geo1cw");

-->> ReadDataFile loads the geo.lvl sound file in the path specified and then loads just
-->> the geo1cw segment. This line loads the static sound effects for the game. In mods
-->> the addon directory is always referenced as DC: something which stands for downloadable
-->> content and tells the game to look in the addon folder path under the mod directory.
-->> The path for new sounds would be ReadDataFile("dc:sound\\mod.lvl") (or whatever three letter
-->> abbreviation exists for your world.
-->>

    ReadDataFile("SIDE\\rep.lvl",
                "rep_bldg_forwardcenter",
                "rep_fly_assault_dome",
                "rep_fly_gunship",
                "rep_fly_gunship_dome",
                "rep_fly_jedifighter_dome",
                "rep_inf_basic",
                "rep_inf_jet_trooper",
                "rep_inf_macewindu",
                "rep_walk_atte")
    ReadDataFile("SIDE\\cis.lvl",
                "cis_fly_droidfighter_dome",
                "cis_fly_fedcoreship_dome",
                "cis_fly_geofighter",
                "cis_fly_techounion_dome",
                "cis_inf_basic",
                "cis_inf_countdooku",
                "cis_inf_droideka",
                "cis_tread_hailfire",
                "cis_walk_spider")
    ReadDataFile("SIDE\\geo.lvl",
                "gen_inf_geonosian")

-->>
-->> These ReadDataFiles segments load the side-speciifc assets for all three teams.
-->> the assets being referenced relate to the geometry of the units.


--  Level Stats

    ClearWalkers()
    SetMemoryPoolSize("EntityWalker", -2)
    AddWalkerType(0, 8) -- 8 droidekas (special case: 0 leg pairs)
    AddWalkerType(2, 2) -- 2 spider walkers with 2 leg pairs each
    AddWalkerType(3, 2) -- 2 attes with 3 leg pairs each
    SetMemoryPoolSize("CommandWalker", 2)
    SetMemoryPoolSize("EntityFlyer", 5)
    SetMemoryPoolSize("EntityHover", 3)
--  SetMemoryPoolSize("EntityCarrier", 2)
--  SetMemoryPoolSize("EntityTauntaun", 0)
--  SetMemoryPoolSize("CommandBuildingArmed", 2)
    SetMemoryPoolSize("PowerupItem", 25)
    SetMemoryPoolSize("MountedTurret", 50)
    SetMemoryPoolSize("Aimer", 200)
    SetSpawnDelay(10.0, 0.25)


-->> Level stats define memory pools when necessary as indicated by messages genereated
-->> in the SPTEST.exe console or log file. Walkers are a special case and need to be
-->> handled carefully because they are memory muncher.
-->> The SetMemoryPoolSize("EntityWalker", -2) line may be obsolete, but it used to be called
-->> as a flag requirement for the command walkers, in this case the ATTE.
-->> The AddWalkerType argument first declares the walker class by leg pairs, where 0 is a
-->> special class for droideka, which are actually vehicles.
-->> The memory pool classes are numerous and if they are not set or not set high enough
-->> messages will be generated in the console or log.
-->> Carrier class applies to the Gunship, TaunTaun to the TaunTauns and Kaadu class.
-->> Aimers apply to anything with an aimer, vehicles, weapons, units, turrets, etc.
-->> The things that aim, the more memory required.
-->> SetSpawnDelay is the spawn delay and deviation.


--    Republic Stats
    SetTeamName(REP, "Republic")
    SetTeamIcon(REP, "rep_icon")
    AddUnitClass(REP, "rep_inf_clone_trooper",14)
    AddUnitClass(REP, "rep_inf_arc_trooper",4)
    AddUnitClass(REP, "rep_inf_clone_pilot",5)
    AddUnitClass(REP, "rep_inf_clone_sharpshooter",5)
    AddUnitClass(REP, "rep_inf_macewindu",4)
    SetHeroClass(REP, "rep_inf_macewindu")
--  SetCarrierClass(REP, "rep_fly_vtrans")

--  CIS Stats
    SetTeamName(CIS, "CIS")
    SetTeamIcon(CIS, "cis_icon")
    AddUnitClass(CIS, "cis_inf_battledroid",11)
    AddUnitClass(CIS, "cis_inf_assault",3)
    AddUnitClass(CIS, "cis_inf_pilotdroid",4)
    AddUnitClass(CIS, "cis_inf_assassindroid",4)
    AddUnitClass(CIS, "cis_inf_droideka",3)
    SetHeroClass(CIS, "cis_inf_countdooku")


-->> The team stats declares the unit loadouts per class as well as call the team icon and
-->> set the team name. The unit loadout counts must add up to the total counts in the SetUnitCount
-->> arguments below. Each mission can have a maximum of five unit classes and one hero class unit.

--  Attacker Stats
    SetUnitCount(ATT, 32)
    SetReinforcementCount(ATT, 250)
    AddBleedThreshold(ATT, 31, 0.0)
    AddBleedThreshold(ATT, 21, 0.75)
    AddBleedThreshold(ATT, 11, 2.25)
    AddBleedThreshold(ATT, 1, 3.0)
    SetTeamAsEnemy(ATT,3)

--  Defender Stats
    SetUnitCount(DEF, 25)
    SetReinforcementCount(DEF, 250)
    AddBleedThreshold(DEF, 31, 0.0)
    AddBleedThreshold(DEF, 21, 0.75)
    AddBleedThreshold(DEF, 11, 2.25)
    AddBleedThreshold(DEF, 1, 3.0)
    SetTeamAsFriend(DEF,3)

--  Local Stats
    SetTeamName(3, "locals")
    AddUnitClass(3, "geo_inf_geonosian", 7)
    SetUnitCount(3, 7)
    SetTeamAsFriend(3, DEF)


-->> Attacker and defender stats define the overall unit count per team. For singleplayer missions
-->> you could even have hundreds of units on the field.
-->> The bleed thresholds are based on the sum of the command post values owned by each team. If
-->> the bleed threshold is breached, the team begins to bleed reinforcements at the rate in seconds
-->> specified. Also in this section are declarations for who is freindly and who is foe. In this
-->> case the Republic is the attacker so the locals (team 3) are being declared as the enemy. The
-->> locals in this case the Geonosians. AI will not attack friends and will attack enemies as long
-->> the relationship is declared.


    ReadDataFile("GEO\\geo1.lvl")

    SetDenseEnvironment("false")
    SetMinFlyHeight(-65)
    SetMaxFlyHeight(50)
    SetMaxPlayerFlyHeight(50)


-->> ReadDataFile here is calling the world.lvl and it's assets here.
-->> SetDenseEnvironment affects AI behavior so they are tuned for urban
-->> or open combat. SetMinFlyHeight declarations are in meters and you should always
-->> make sure your values meet your terrain heights.


--  Birdies
    --SetNumBirdTypes(1)
    --SetBirdType(0.0,10.0,"dragon")
    --SetBirdFlockMinHeight(90.0)

-->> If birds are on a level this is where they would be set up.
-->> Look at the assets for Kashyyyk as an example of how to implement birds, which req files
-->> to include th references in, where to store the assets and configure their properties.


--  Sound
    OpenAudioStream("sound\\geo.lvl",  "geocw_music");
    OpenAudioStream("sound\\cw.lvl",  "cw_vo");
    OpenAudioStream("sound\\cw.lvl",  "cw_tac_vo");
    OpenAudioStream("sound\\geo.lvl",  "geo1cw");
    OpenAudioStream("sound\\geo.lvl",  "geo1cw");

-->> These lines open audio streams in the sound levels loaded previously. In the above case
-->> the music is opened first. then the voiceovers, then the tactical voiceovers which are in a
-->> separate stream so there is less lag in hearing the VO when many sounds are being triggered,
-->> then two streams are opened for ambient environment streams because in geo there are two and in
-->> an case where you have more than one ambient environment stream two streams need to be opened
-->> so both can be heard at the same time if the player ever encounters them at the same time.


    SetBleedingVoiceOver(REP, REP, "rep_off_com_report_us_overwhelmed", 1)
    SetBleedingVoiceOver(REP, CIS, "rep_off_com_report_enemy_losing",   1)
    SetBleedingVoiceOver(CIS, REP, "cis_off_com_report_enemy_losing",   1)
    SetBleedingVoiceOver(CIS, CIS, "cis_off_com_report_us_overwhelmed", 1)

-->> These lines set the voiceover calls for each team and circumstance. In the first line
-->> the REP is saying the REP are losing reinforcements, as denoted by REP, REP. The
-->> "rep_off_com_report_us_overwhelmed" calls a soundstreamproperty in a config file (cw_vo.snd)
-->> which plays a sound included in cw_vo.sfx. In the case of addons, all new files are added using
-->> .asfx files rather than ,sfx files. See the TAT3 assets as a the best reference for mods.

    SetOutOfBoundsVoiceOver(1, "repleaving");
    SetOutOfBoundsVoiceOver(2, "cisleaving");

-->> These lines call the sound property for when a unit crosses the boundary and hence leaves the
-->> battlefield. The numbers represent team number.

    SetAmbientMusic(REP, 1.0, "rep_GEO_amb_start",  0,1)
    SetAmbientMusic(REP, 0.99, "rep_GEO_amb_middle", 1,1)
    SetAmbientMusic(REP, 0.1,"rep_GEO_amb_end",    2,1)
    SetAmbientMusic(CIS, 1.0, "cis_GEO_amb_start",  0,1)
    SetAmbientMusic(CIS, 0.99, "cis_GEO_amb_middle", 1,1)
    SetAmbientMusic(CIS, 0.1,"cis_GEO_amb_end",    2,1)

-->> These lines set the repeating music that is played throughout the game and the trigger
-->> for when the different subset of tracks is called. First the team that hears is declared,
-->> then the reinforcement count as a percent. So above the first lines plays start music
-->> according to the interval defined in the soundstreamproperty in geocw_music.snd The music will
-->> repeat until the next threshold is breached, in this case the middle music begins at 99%
-->> reinforcements. The next argument sets to 1 to assign a started bleeding sound set
-->> to 0 to assign a stopped bleeding sound. The final argument flags the declaration to look
-->> for the first argument as a percentage, if set to zero it will look for an explicit count.


    SetVictoryMusic(REP, "rep_geo_amb_victory")
    SetDefeatMusic (REP, "rep_geo_amb_defeat")
    SetVictoryMusic(CIS, "cis_geo_amb_victory")
    SetDefeatMusic (CIS, "cis_geo_amb_defeat")

-->> These lines set the victory and defeat music for each team

    SetSoundEffect("ScopeDisplayZoomIn",  "binocularzoomin");
    SetSoundEffect("ScopeDisplayZoomOut", "binocularzoomout");
    --SetSoundEffect("WeaponUnableSelect",  "com_weap_inf_weaponchange_null");
    --SetSoundEffect("WeaponModeUnableSelect",  "com_weap_inf_modechange_null");
    SetSoundEffect("SpawnDisplayUnitChange",       "shell_select_unit");
    SetSoundEffect("SpawnDisplayUnitAccept",       "shell_menu_enter");
    SetSoundEffect("SpawnDisplaySpawnPointChange", "shell_select_change");
    SetSoundEffect("SpawnDisplaySpawnPointAccept", "shell_menu_enter");
    SetSoundEffect("SpawnDisplayBack",             "shell_menu_exit");

-->> These lines call global sound properties for zooming and shell sounds


    SetPlanetaryBonusVoiceOver(CIS, CIS, 0, "CIS_bonus_CIS_medical");
    SetPlanetaryBonusVoiceOver(CIS, REP, 0, "CIS_bonus_REP_medical");
    SetPlanetaryBonusVoiceOver(CIS, CIS, 1, "");
    SetPlanetaryBonusVoiceOver(CIS, REP, 1, "");
    SetPlanetaryBonusVoiceOver(CIS, CIS, 2, "CIS_bonus_CIS_sensors");
    SetPlanetaryBonusVoiceOver(CIS, REP, 2, "CIS_bonus_REP_sensors");
    SetPlanetaryBonusVoiceOver(CIS, CIS, 3, "CIS_bonus_CIS_hero");
    SetPlanetaryBonusVoiceOver(CIS, REP, 3, "CIS_bonus_REP_hero");
    SetPlanetaryBonusVoiceOver(CIS, CIS, 4, "CIS_bonus_CIS_reserves");
    SetPlanetaryBonusVoiceOver(CIS, REP, 4, "CIS_bonus_REP_reserves");
    SetPlanetaryBonusVoiceOver(CIS, CIS, 5, "CIS_bonus_CIS_sabotage");--sabotage
    SetPlanetaryBonusVoiceOver(CIS, REP, 5, "CIS_bonus_REP_sabotage");
    SetPlanetaryBonusVoiceOver(CIS, CIS, 6, "");
    SetPlanetaryBonusVoiceOver(CIS, REP, 6, "");
    SetPlanetaryBonusVoiceOver(CIS, CIS, 7, "CIS_bonus_CIS_training");--advanced training
    SetPlanetaryBonusVoiceOver(CIS, REP, 7, "CIS_bonus_REP_training");--advanced training

    SetPlanetaryBonusVoiceOver(REP, REP, 0, "REP_bonus_REP_medical");
    SetPlanetaryBonusVoiceOver(REP, CIS, 0, "REP_bonus_CIS_medical");
    SetPlanetaryBonusVoiceOver(REP, REP, 1, "");
    SetPlanetaryBonusVoiceOver(REP, CIS, 1, "");
    SetPlanetaryBonusVoiceOver(REP, REP, 2, "REP_bonus_REP_sensors");
    SetPlanetaryBonusVoiceOver(REP, CIS, 2, "REP_bonus_CIS_sensors");
    SetPlanetaryBonusVoiceOver(REP, REP, 3, "REP_bonus_REP_hero");
    SetPlanetaryBonusVoiceOver(REP, CIS, 3, "REP_bonus_CIS_hero");
    SetPlanetaryBonusVoiceOver(REP, REP, 4, "REP_bonus_REP_reserves");
    SetPlanetaryBonusVoiceOver(REP, CIS, 4, "REP_bonus_CIS_reserves");
    SetPlanetaryBonusVoiceOver(REP, REP, 5, "REP_bonus_REP_sabotage");--sabotage
    SetPlanetaryBonusVoiceOver(REP, CIS, 5, "REP_bonus_CIS_sabotage");
    SetPlanetaryBonusVoiceOver(REP, REP, 6, "");
    SetPlanetaryBonusVoiceOver(REP, CIS, 6, "");
    SetPlanetaryBonusVoiceOver(REP, REP, 7, "REP_bonus_REP_training");--advanced training
    SetPlanetaryBonusVoiceOver(REP, CIS, 7, "REP_bonus_CIS_training");--advanced training

-->> The above lines set the calls to the voiceovers for the planetary bonuses in
-->> Galactic Conquest. They are triggered when the bonus is activated in game or if
-->> forced by using the comment lines below. The arguments above are as follows:
-->> SetPlanetaryBonusVoiceOver(playerTeam,bonusNum,streamSoundName);

    --ActivateBonus(CIS, "SNEAK_ATTACK")
    --ActivateBonus(REP, "SNEAK_ATTACK")

    SetAttackingTeam(ATT)

--Opening Satalite Shot
--Geo
--Mountain
AddCameraShot(0.996091, 0.085528, -0.022005, 0.001889, -6.942698, -59.197201, 26.136919);
--Wrecked Ship
AddCameraShot(0.906778, 0.081875, -0.411906, 0.037192, 26.373968, -59.937874, 122.553581);
--War Room
AddCameraShot(0.994219, 0.074374, 0.077228, -0.005777, 90.939568, -49.293945, -69.571136);
end

-->> The above lines were explained previously with mod1a.
```
The game assets were provided with the tools for the creation of new maps with the exception of sounds for size as well as licensing reasons. These levels will not run as is using the add on functionality but you may look at them as examples for reference. This will be especially useful when it comes to mission luas.