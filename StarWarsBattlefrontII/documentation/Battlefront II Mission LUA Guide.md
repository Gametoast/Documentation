# Battlefront II Mission LUA Guide

In this document, I'll go over each type of Battlefront II mission script, and detail what each section of the script does. ModTools VisualMunge does most things for you, so you shouldn't have to be editing these scripts too much, but in case you want to change some things around, and experiment, here is a general break-down for you.

The different scripts you'll be dealing with are; _con (conquest), _1flag(1 flag ctf), _ctf (2 flag ctf), and _eli (hero assault).

I'll start with the Conquest script. The script I'll be commenting on is the exact conquest script that is created by ModTools Visual Munge when you create a new level. My comments will show up highlighted in gray. Comments will always refer to the block of script AFTER the comments.

So let's begin:
```LUA
--
-- Copyright (c) 2005 Pandemic Studios, LLC. All rights reserved.
--

--The ScriptCB_DoFile lines load in an outside script, which allows us to make calls to functions that exist in those outside scripts, 
--but do not exist in our actual game script. This just keeps a lot of the actual game script in one place, rather than being copied 
--all over the place in every script. ObjectiveConquest is the script that handles all the Conquest game mod logic. setup_teams 
--handles the logic for specifying the unit loadout. More on that later.

-- load the gametype script
ScriptCB_DoFile("ObjectiveConquest")
ScriptCB_DoFile("setup_teams")

--These next lines simply define variables that we'll use in various places in our script. These lines define REP as team 1, and CIS as team 2.
--We also use the variables ATT and DEF in some places in the script. These variables refer to which team is the attacking team, and which team is 
-- the defending team. In this example, REP is set as the attacking team, and CIS is set up as the defending team, and correspondingly, 
--ATT is now set as 1, and DEF is set as 2.

-- REP Attacking (attacker is always #1)
REP = 1;
CIS = 2;

-- These variables do not change
ATT = REP;
DEF = CIS;

--The following line defines the function ScriptPostLoad, which is a function that is run after the game has finished 
-- running ScriptInit (more on that below). ScriptPostLoad will contain all your game script, handling everything that 
-- actually happens once the level is loaded and play begins. ScriptInit is setup, and making sure everything is loaded, 
-- and then ScriptPostLoad actually contains the in-game logic.

function ScriptPostLoad()
    -- Just as it says in the actual script comment below (lua comments begin with --, two dashes) these next lines define the CPs 
    -- that will be used for conquest. It is important if you are going to add more CPs to your level, that you edit your script, 
    -- and add your new CPs to the list. The default options provide 4 CPs by default. The first cp1 is simply a variable name that 
    -- you are using to define your CP. The "cp1" after name = , is the actual name of the CP in the editor. Make sure you have your 
    -- names spelled right (the names ARE case-sensetive)
    
    --This defines the CPs. These need to happen first
    cp1 = CommandPost:New{name = "cp1"}
    cp2 = CommandPost:New{name = "cp2"}
    cp3 = CommandPost:New{name = "cp3"}
    cp4 = CommandPost:New{name = "cp4"}
    
    -- This block if script sets up the conquest objective. teamATT and teamDEF define which team is the attacking team, and which team is the defending team.
    -- textATT and textDEF refer to the localize string that will be displayed as the objective text for each team. This will say something like
    -- "Capture all the CPs" or "Capture the enemy flag" depending on which game mode you're playing.
    
    --sets the rules for multiplayer as the same game mode script (ObjectiveConquest from above) is used both in single player and multiplayer. 
    -- This should always be set to true in a multiplayer script.
    multiplayerRules = true 
    
    --This sets up the actual objective. This needs to happen after cp's are defined
    conquest = ObjectiveConquest:New{
                teamATT = ATT, teamDEF = DEF,
                textATT = "game.modes.con",
                textDEF = "game.modes.con2",
                multiplayerRules = true
                }
    
    -- These next lines should also be fairly self-explanatory. Once you've defined the CPs, and set up the objective, these lines add the 
    -- CPs to the objective. If your CPs are not defined, and added into the objective, then they will still function as CPs in the game 
    -- (being capturable, and you can spawn from them) but they will not impact the victory/defeat conditions for the match.
    
    --This adds the CPs to the objective. This needs to happen after the objective is set up
    conquest:AddCommandPost(cp1)
    conquest:AddCommandPost(cp2)
    conquest:AddCommandPost(cp3)
    conquest:AddCommandPost(cp4)
    
    --This actually starts the objective. Without this line, your conquest game will go on forever, and will never actually start, or end.
    conquest:Start()
    
    --EnableSPHeroRules turns on the hero rules for the game. This should be present in every multiplayer script, unless you do not actually 
    -- want heroes in your map. Simply omit this line, and you will never get heroes in your game.
    EnableSPHeroRules()
    
    --This end closes the ScriptPostLoad function
    
end

-- This ScriptInit function must be present in every game mode script. This function is automatically run by the game, 
-- and handles all the loading of assets, and the team setup. I will go into detail line by line below.

---------------------------------------------------------------------------
-- FUNCTION: ScriptInit
-- PURPOSE: This function is only run once
-- INPUT:
-- OUTPUT:
-- NOTES: The name, 'scriptInit' is a chosen convention, and each
-- mission script must contain a version of this function, as
-- it is called from C to start the mission.
---------------------------------------------------------------------------

--This line creates the ScriptInit function
function ScriptInit()
    
    --This ReadDataFile loads ingame.lvl, which is required for every level.
    ReadDataFile("ingame.lvl")
    
    --These next two lines set the max flyheight for the level. This prevents units like jet troopers and jedi from jumping over walls, 
    -- and getting out of the world, or getting on top of buildings that they should not be able to get on top of. The 
    -- playerflyheight is for the player, and the maxflyheight is for other units.
    SetMaxFlyHeight(30)
    SetMaxPlayerFlyHeight (30)
    
    -- This block of SetMemoryPoolSize set the memory pool sizes for various things for Jedi, and other heroes in the map.
    -- The ClothData sets how many cloth objects can be in the level at one time. The Combo:: pools set up various attack, 
    -- and combo values for the jedi. You'll notice these values are set much higher in the Hero Assault scripts.
    SetMemoryPoolSize ("ClothData",20)
    SetMemoryPoolSize ("Combo",20) -- should be ~ 2x number of jedi classes
    SetMemoryPoolSize ("Combo::State",300) -- should be ~12x #Combo
    SetMemoryPoolSize ("Combo::Transition",300) -- should be a bit bigger than #Combo::State
    SetMemoryPoolSize ("Combo::Condition",300) -- should be a bit bigger than #Combo::State
    SetMemoryPoolSize ("Combo::Attack",150) -- should be ~8-12x #Combo
    SetMemoryPoolSize ("Combo::DamageSample",1800) -- should be ~8-12x #Combo::Attack
    SetMemoryPoolSize ("Combo::Deflect",50)
    
    -- This next ReadDataFile line loads the sound filed that will be used in this level. This contains all the unit sounds, as well as 
    -- any level specific sounds. You can change this to use sound files from other levels as long as you know that that level was setup 
    -- for the type of use that you want. For example, you won't want to use the hoth.lvl sound file if you're doing a map with CIS units 
    -- as the hoth files was not setup for use with CIS units. For this example, we have ReadDataFile("sound\\yav.lvl;yav1cw). 
    -- The yav1cw specifies that we'll be using the sounds for the Clone Wars era in this map. If we wanted to be using the sounds for the 
    -- Galactic Civil War era, we would be calling for yav1gcw. Note: Some levels do not support certain eras. For example, geonosis does 
    -- not have gcw, and hoth does not have cw.
    ReadDataFile("sound\\yav.lvl;yav1cw")
    
    -- This next block of ReadDataFile calls loads all the infantry and vehicle units you'll be using. If you are trying to use a certain 
    -- unit or vehicle, and it just will not show up in the game, it's a good idea to look here, and make sure you're actually
    -- loading that character/vehicle.
    ReadDataFile("SIDE\\rep.lvl",
                 "rep_inf_ep3_rifleman",
                 "rep_inf_ep3_rocketeer",
                 "rep_inf_ep3_engineer",
                 "rep_inf_ep3_sniper",
                 "rep_inf_ep3_officer",
                 "rep_inf_ep3_jettrooper",
                 "rep_hover_fightertank",
                 "rep_hero_anakin",
                 "rep_hover_barcspeeder")
    
    ReadDataFile("SIDE\\cis.lvl",
                 "cis_inf_rifleman",
                 "cis_inf_rocketeer",
                 "cis_inf_engineer",
                 "cis_inf_sniper",
                 "cis_inf_officer",
                 "cis_inf_droideka",
                 "cis_hero_darthmaul",
                 "cis_hover_aat")
    
    --This next ReadDataFile loads some turrets that are used in many of our levels.
    ReadDataFile("SIDE\\tur.lvl", "tur_bldg_laser", "tur_bldg_tower")
    
    -- The SetupTeams sections will determine a few things. The team specifies which team the team being defined is (1 or 2) which 
    -- gets it's value REP from the variable that we defined above. If you recall, we defined REP = 1, therefore, the first team we 
    -- set up here will be team 1. units = 20 specifies that there will always be 20 units on the field at any given time. You can 
    -- play with these values if you want to have a huge battle, but be careful, as this will create much more strain on your system. 
    -- The PC should be able to handle a pretty big load though. 64 on 64, or even higher should be pretty easily doable.
    -- Reinforcements = 150 specifies that there will be 150 reinforcements. These values do not have to be the same for each side, 
    -- so if you want to start out one team with some kind of disadvantage, you can offset that by giving that side more reinforcements 
    -- for example. The other lines should be pretty self-explanatory. These specify which units will occupy which slots in the character 
    -- carousel. You could (if desired) make one of your units a hero that is always available to any player.
    
    -- The numbers in these lines define min and max numbers for these units. For example, we have 20 units total on the play field. 
    -- The soldier unit is set to 9 min and 25 max. What this means is that there will ALWAYS be 9 soliders on the field,
    -- 1 rocketeer, 1 engineer, 1 sniper, 1 officer, and 1 jet trooper. The second number sets the max, so there will never be MORE 
    -- than 25 soldiers, 4 rocketeers, 4 engineers, etc. The minimums are filled up first, and then the the game will fill up to the max's 
    -- randomly until the 20 unit maximum units on the field is hit. You should never have you minimums exceed your total number of units 
    -- allowed on the field (in this example, the minimums would never be set to more than 20 in total.)
    
    SetupTeams{
        rep = {
            team = REP,
            units = 20,
            reinforcements = 150,
            soldier = { "rep_inf_ep3_rifleman",9, 25},
            assault = { "rep_inf_ep3_rocketeer",1, 4},
            engineer = { "rep_inf_ep3_engineer",1, 4},
            sniper = { "rep_inf_ep3_sniper",1, 4},
            officer = {"rep_inf_ep3_officer",1, 4},
            special = { "rep_inf_ep3_jettrooper",1, 4},
        },
        cis = {
            team = CIS,
            units = 20,
            reinforcements = 150,
            soldier = { "cis_inf_rifleman",9, 25},
            assault = { "cis_inf_rocketeer",1, 4},
            engineer = { "cis_inf_engineer",1, 4},
            sniper = { "cis_inf_sniper",1, 4},
            officer = {"cis_inf_officer",1, 4},
            special = { "cis_inf_droideka",1, 4},
        }
    }
    
    --These next two lines set what the hero class is for each side. In this case, we have Anakin on the REP team, and darth maul on the 
    -- CIS team. Heroes should be defined here, rather than in the SetupTeams above, unless you want them available at all times. If they 
    -- are defined as a hero class, then they will be unlocked according to the hero rules.
    SetHeroClass(CIS, "cis_hero_darthmaul")
    SetHeroClass(REP, "rep_hero_anakin")
    
    -- Level Stats
    
    -- ClearWalkers wipes out any allocations that may have been done automatically for walkers. You'll need to have this line in, and 
    -- uncommented if you want to have walkers in your level.
    
    -- ClearWalkers()
    
    -- These next lines will add walkers to your level. The first number inside the parenthesis specifies how many leg pairs the walker type has. 
    -- Droidekas are set up as a special case, with 0 leg pairs. So as you can see below, we have AddWalkerType(0,4) this specifies that we will have 
    -- 4 walkers with 0 leg pairs (droidekas). 1 leg pair would specify a walker with one pair of legs, an ATST for example, or a one-man ATST from 
    -- the clone wars era. So for 2 ATSTs, we would have a line that says; AddWalkerType(1, 2)
    -- 2 leg pairs would be a unit like the CIS spider walker, or an ATAT, and 3 leg pairs would be the 6-legged walker from the clone wars era.
    AddWalkerType(0, 4) -- special -\&gt; droidekas
    AddWalkerType(1, 0) -- 1x2 (1 pair of legs)
    AddWalkerType(2, 0) -- 2x2 (2 pairs of legs)
    AddWalkerType(3, 0) -- 3x2 (3 pairs of legs)
    
    --This next block of script sets up various memory pools for your level.
    local weaponCnt = 240
    SetMemoryPoolSize("Aimer", 75)
    SetMemoryPoolSize("AmmoCounter", weaponCnt)
    SetMemoryPoolSize("BaseHint", 1000)
    SetMemoryPoolSize("EnergyBar", weaponCnt)
    SetMemoryPoolSize("EntityCloth", 22)
    SetMemoryPoolSize("EntityFlyer", 7)
    SetMemoryPoolSize("EntityHover", 8)
    SetMemoryPoolSize("EntityLight", 50)
    SetMemoryPoolSize("EntitySoundStream", 4)
    SetMemoryPoolSize("EntitySoundStatic", 20)
    SetMemoryPoolSize("MountedTurret", 25)
    SetMemoryPoolSize("Navigator", 49)
    SetMemoryPoolSize("Obstacle", 760)
    SetMemoryPoolSize("PathNode", 512)
    SetMemoryPoolSize("SoundSpaceRegion", 46)
    SetMemoryPoolSize("TreeGridStack", 500)
    SetMemoryPoolSize("UnitAgent", 49)
    SetMemoryPoolSize("UnitController", 49)
    SetMemoryPoolSize("Weapon", weaponCnt)
    
    --SetSpawnDelay specifies an initial spawn delay. All levels use this call. You should never have to modify this line.
    SetSpawnDelay(10.0, 0.25)
    
    --This next line is a VERY important line. This reads in your level files, and the game mode files. Without these lines, 
    -- the script wouldn't know what level files to load, and you wouldn't be able to run your level. The first part; "dc:ABC\\ABC.lvl" 
    -- loads all the regular level files, and the second part, "ABC_conquest" specifies which game mode you're going to be loading. So 
    -- if this were a CTF script, you would see "ABC_ctf", or "ABC_1flag", or "ABC_eli" for hero assault.
    ReadDataFile("dc:ABC\\ABC.lvl", "ABC_conquest")
    
    -- This line sets a switch in the code that controls a number of AI behaviors. If this were a very foggy map, with a short view distance, 
    -- you would set this to "true" which would make the AI see a shorter distance, and other various things to make the AI act more appropriately 
    -- in an environment with limited visibility.
    SetDenseEnvironment("false")
    
    --The next section sets up various sound elements in the level
    
    -- Sound
    
    --These first two lines set the sound effect used for zooming in and out with the scope.
    SetSoundEffect("ScopeDisplayZoomIn", "binocularzoomin")
    SetSoundEffect("ScopeDisplayZoomOut", "binocularzoomout")
    
    -- Below, voiceSlow and voiceQuick are both simply audio streams for player, and other unit VO. They are set up as two separate streams 
    -- for two reasons. One, the quick stream has less VO in it, and the seek time will be lower than the slow stream. The other reason, is 
    -- that it opens an additional audio stream for voiceovers so that the voiceovers don't stomp on each other (one cuts out when the other starts). 
    -- The AudioStreamAppendSegments basically just tacks an additional stream onto another stream, lumping them both together in one stream. 
    -- In the example below, "cis_unit_vo_slow" and "global_vo_vo_slow" are combined with the original voiceSlow stream, which is defined as "rep_unit_vo_slow"
    voiceSlow = OpenAudioStream("sound\\global.lvl", "rep_unit_vo_slow")
    AudioStreamAppendSegments("sound\\global.lvl", "cis_unit_vo_slow", voiceSlow)
    AudioStreamAppendSegments("sound\\global.lvl", "global_vo_slow", voiceSlow)
    
    voiceQuick = OpenAudioStream("sound\\global.lvl", "rep_unit_vo_quick")
    AudioStreamAppendSegments("sound\\global.lvl", "cis_unit_vo_quick", voiceQuick)
    
    -- These lines open audio streams in the sound levels loaded previously. In the above case the music is opened first. then the voiceovers, 
    -- then the tactical voiceovers which are in a separate stream so there is less lag in hearing the VO when many sounds are being triggered, 
    -- then two streams are opened for ambient environment streams because in geo there are two and in an case where you have more than one ambient 
    -- environment stream two streams need to be opened so both can be heard at the same time if the player ever encounters them at the same time.
    OpenAudioStream("sound\\global.lvl", "cw_music")
    -- OpenAudioStream("sound\\global.lvl", "global_vo_quick")
    -- OpenAudioStream("sound\\global.lvl", "global_vo_slow")
    OpenAudioStream("sound\\yav.lvl", "yav1")
    OpenAudioStream("sound\\yav.lvl", "yav1")
    OpenAudioStream("sound\\yav.lvl", "yav1_emt")
    
    -- These lines set the voiceover calls for each team and circumstance. In the first line the REP is saying the REP are losing reinforcements, 
    -- as denoted by REP, REP. The "rep_off_com_report_us_overwhelmed" calls a soundstreamproperty in a config file (cw_vo.snd) which plays a sound 
    -- included in cw_vo.sfx.
    SetBleedingVoiceOver(REP, REP, "rep_off_com_report_us_overwhelmed", 1)
    SetBleedingVoiceOver(REP, CIS, "rep_off_com_report_enemy_losing", 1)
    SetBleedingVoiceOver(CIS, REP, "cis_off_com_report_enemy_losing", 1)
    SetBleedingVoiceOver(CIS, CIS, "cis_off_com_report_us_overwhelmed", 1)
    
    -- This is the voiceover that is played when you get the "leaving the battlefield" message in the game. The boundaries are set up in the 
    -- editor as to when you will receive this message. More on this in the ZeroEditor_guide.doc
    SetOutOfBoundsVoiceOver(2, "cisleaving")
    SetOutOfBoundsVoiceOver(1, "repleaving")
    
    -- These lines set the repeating music that is played throughout the game and the trigger for when the different subset of tracks is called. 
    -- First the team that hears is declared, then the reinforcement count as a percent. So above the first lines plays start music according to 
    -- the interval defined in the soundstreamproperty in geocw_music.snd The music will repeat until the next threshold is breached, in this 
    -- case the middle music begins at 99% reinforcements. The next argument sets to 1 to assign a started bleeding sound set to 0 to assign a 
    -- stopped bleeding sound. The final argument flags the declaration to look for the first argument as a percentage, if set to zero it will 
    -- look for an explicit count.
    SetAmbientMusic(REP, 1.0, "rep_yav_amb_start", 0,1)
    SetAmbientMusic(REP, 0.8, "rep_yav_amb_middle", 1,1)
    SetAmbientMusic(REP, 0.2, "rep_yav_amb_end", 2,1)
    SetAmbientMusic(CIS, 1.0, "cis_yav_amb_start", 0,1)
    SetAmbientMusic(CIS, 0.8, "cis_yav_amb_middle", 1,1)
    SetAmbientMusic(CIS, 0.2, "cis_yav_amb_end", 2,1)
    
    --These lines set the music that is played in victory or defeat for each team.
    SetVictoryMusic(REP, "rep_yav_amb_victory")
    SetDefeatMusic (REP, "rep_yav_amb_defeat")
    SetVictoryMusic(CIS, "cis_yav_amb_victory")
    SetDefeatMusic (CIS, "cis_yav_amb_defeat")
    
    -- These lines set up some miscellaneous sound calls that are used in the levels, like zoom sounds, and some shell sounds, like selecting units, 
    -- and other sound effects. You shouldn't really be modifying these either unless you are making your own sounds.
    SetSoundEffect("ScopeDisplayZoomIn", "binocularzoomin")
    SetSoundEffect("ScopeDisplayZoomOut", "binocularzoomout")
    --SetSoundEffect("BirdScatter", "birdsFlySeq1")
    --SetSoundEffect("WeaponUnableSelect", "com_weap_inf_weaponchange_null")
    --SetSoundEffect("WeaponModeUnableSelect", "com_weap_inf_modechange_null")
    SetSoundEffect("SpawnDisplayUnitChange", "shell_select_unit")
    SetSoundEffect("SpawnDisplayUnitAccept", "shell_menu_enter")
    SetSoundEffect("SpawnDisplaySpawnPointChange", "shell_select_change")
    SetSoundEffect("SpawnDisplaySpawnPointAccept", "shell_menu_enter")
    SetSoundEffect("SpawnDisplayBack", "shell_menu_exit")
    
    -- The Camera stats section defines the coordinate for the camera shots that appear in the background when you're waiting to 
    -- spawn in-game using in game coordinates. Using free cam mode in the SPTEST.exe supplied, modders can navigate to a spot and dump 
    -- the coordinates to a file called cameracoordinates.txt by typing dumpcamera in the console.
    
    --OpeningSateliteShot
    AddCameraShot(0.908386, -0.209095, -0.352873, -0.081226, -45.922508, -19.114113, 77.022636);
    AddCameraShot(-0.481173, 0.024248, -0.875181, -0.044103, 14.767292, -30.602322, -144.506851);
    AddCameraShot(0.999914, -0.012495, -0.004416, -0.000055, 1.143253, -33.602314, -76.884430);
    AddCameraShot(0.839161, 0.012048, -0.543698, 0.007806, 19.152437, -49.802273, 24.337317);
    AddCameraShot(0.467324, 0.006709, -0.883972, 0.012691, 11.825212, -49.802273, -7.000720);
    AddCameraShot(0.861797, 0.001786, -0.507253, 0.001051, -11.986043, -59.702248, 23.263165);
    AddCameraShot(0.628546, -0.042609, -0.774831, -0.052525, 20.429928, -48.302277, 9.771714);
    AddCameraShot(0.765213, -0.051873, 0.640215, 0.043400, 57.692474, -48.302277, 16.540724);
    AddCameraShot(0.264032, -0.015285, -0.962782, -0.055734, -16.681797, -42.902290, 129.553268);
    AddCameraShot(-0.382320, 0.022132, -0.922222, -0.053386, 20.670977, -42.902290, 135.513001);
    
    --This line closes the ScriptInit function…FIN!
    
end
```


This completes the documentation of a conquest mission script. Next, we'll take a look at 2 Flag CTF, 1 Flag CTF, and Hero Assault maps. I won't be covering these scripts in their entirety, since they are mostly the same, I will be covering only the parts that differ, which for most of the scripts, is only the ScriptPostLoad function.

### 2 Flag CTF mission script

Below, we'll take a look at the ScriptPostLoad function from a CTF script. I'll continue with the same commenting scheme used above.

Before we get to that though, notice the ScriptCBDoFile lines at the top of the script are different. In the conquest script, we had this line:

ScriptCB_DoFile("ObjectiveConquest")

This loads the Objective script which handles all the game logic for conquest. Well, in CTF you're not going to have ObjectiveConquest anymore, this line is replaced with the following:

ScriptCB_DoFile("ObjectiveCTF")

This will load the objective script that handles all the logic for the **CTF** game mode.

With that out of the way, let's move on to the ScriptPostLoad function from the template CTF script:

```LUA
--

--The line below creates the ScriptPostLoad function (same as above)
function ScriptPostLoad()
    
    -- The SoundEvent_SetupTeams line below must be present in order for the CTF game event sounds to work (things like 
    -- "The republic has the flag", "The CIS has captured the Republic flag", etc). Without this line, it will be an 
    -- aweful quiet game of CTF with no audio cues as to the status of the flag. In a GCW era script, this would look like this;
    SoundEvent_SetupTeams(IMP, 'imp', ALL, 'all')
    SoundEvent_SetupTeams( REP, 'rep', CIS, 'cis' )
    
    -- These next 4 lines specifies which geometry to use for each flag. After SetProperty, the first parameter is the name of the flag 
    -- in the editor, the second parameter is what property you are setting (in this case GeometryName and CarriedGeometryName) and the 
    -- last parameter is the geometry to use. GeometryName is what geometry is used when the flag is sitting on the ground. The 
    -- CarriedGeometryName set the geometry when the flag is being carried by a player. The carried geometry has some small differences 
    -- to make the flag look better when being carried on the back of a unit. For more information on the SetProperty script command, 
    -- see the Battlefront2_scripting_system.doc
    SetProperty("flag1", "GeometryName", "com_icon_republic_flag")
    SetProperty("flag1", "CarriedGeometryName", "com_icon_republic_flag_carried")
    SetProperty("flag2", "GeometryName", "com_icon_cis_flag")
    SetProperty("flag2", "CarriedGeometryName", "com_icon_cis_flag_carried")
    
    -- The lua comments below pretty much sum up the next line. Again, for more information on the SetClassProperty script command, 
    -- see the Battlefront2_scripting_system.doc
    
    --This makes sure the flag is colorized when it has been dropped on the ground
    SetClassProperty("com_item_flag", "DroppedColorize", 1)
    
    -- This next block of script sets up the CTF parameters. Much of this is the same as in conquest. teamATT and teamDEF are the same, 
    -- textATT and textDEF are the same (but point to the ctf objective text instead of conquest), and multiplayer rules is the same.
    
    -- This is all the actual ctf objective setup
    ctf = ObjectiveCTF:New{teamATT = REP, teamDEF = CIS, captureLimit = 5, textATT = "game.modes.ctf", textDEF = "game.modes.ctf2", hideCPs = true, multiplayerRules = true}
    
    -- This next block sets up the specific parameters for each flag.
    -- name = "flag1" refers to the actual name of the flag in the editor.
    
    -- homeRegion is only really used to make the flag re-spawn when captured. Each flag must have a home region in capture the flag, or 
    --  when the flag is captured, it will not respawn. This is because the same game mode script is used for both single player and 
    --  multiplayer. In single player we didn't want the flags to respawn. You can just use any region in the level as the flag's home 
    --  region, it only exists to make sure that the flag respawns when it is captured. Also, the flag will respawn where it was 
    --  originally placed, NOT where the homeregion is.
    
    -- captureRegion specifies the region that the flag must be brought to in order for the flag to be captured, and points scored.
    
    -- capRegionMarker specifies the icon that is used to represent the capture region on the minimap.
    
    --capRegionMarkerScale specifies the scale of that icon.
    
    -- The icon parameter is not really used in multiplayer CTF and should be left as it appears below.
    
    -- mapIcon specifies what icon will be used as the icon in the mini-map for the flag itself
    
    -- All the these parameters should be left alone for the most part. The only parts you should have any reason to change 
    -- would be the "name" line if you have your flags named anything other than "flag1" and "flag2", and if your capture 
    -- regions are named different, obviously these lines would need to be modified as well.
    
    --There is a second block of identical script for the second flag in this 2 flag CTF script.
    
    ctf:AddFlag{name = "flag1", homeRegion = "team1_capture", captureRegion = "team2_capture",
               capRegionMarker = "hud_objective_icon_circle", capRegionMarkerScale = 3.0,
               icon = "", mapIcon = "flag_icon", mapIconScale = 3.0
               }
    ctf:AddFlag{name = "flag2", homeRegion = "team2_capture", captureRegion = "team1_capture",
               capRegionMarker = "hud_objective_icon_circle", capRegionMarkerScale = 3.0,
               icon = "", mapIcon = "flag_icon", mapIconScale = 3.0
               }
    
    -- This line starts the CTF objective, the same as in the conquest script, where you have conquest:Start()
    ctf:Start()
    
    --This line also is the same as in the conquest script, enabling the hero rules for unlocking heroes in multiplayer.
    EnableSPHeroRules()
    
    --This end closes the ScriptPostLoad function
    
end

--
```

The only other key differences are the following:

**MemoryPool for flag objects****.**

You'll notice in the ScriptInit function the following line:
```SetMemoryPoolSize("FlagItem", 2)```

This line MUST exist in CTF scripts. Without this line, your flags will either not show up, or your level will possibly (and probably) crash. The number after the "FlagItem" specifies how many flags. In 2 flag CTF, we have 2 flags (really?).

**Call to load the game mode layers**

In our conquest script, we had the following line;

```ReadDataFile("dc:ABC\\ABC.lvl", "ABC_conquest")```

This loaded the conquest game mode scripts. In our CTF script, this line will be altered to look like this:
```ReadDataFile("dc:ABC\\ABC.lvl", "ABC_ctf")```

This will load the ctf game mode layers. That's that.

### 1 Flag CTF mission script

First, notice the the ScriptCB_DoFile line that calls the objective script is changed once again. For 2 flag CTF we had:

```ScriptCB_DoFile("ObjectiveCTF")```

Which has now been replaced with:
```ScriptCB_DoFile("ObjectiveOneFlagCTF")```

And now we will go over the changes for a 1 flag CTF mission script. Find the ScriptPostLoad from the 1 flag CTF script below (comments are highlighted in gray):

```LUA
--This creates the ScriptPostLoad function
function ScriptPostLoad()
    
    --The SoundEvent_SetupTeams is the same as for a 2 flag CTF map. This will enable the CTF event sounds, which are automatically 
    -- adjusted when being run in 1 flag vs. 2 flag.
    SoundEvent_SetupTeams( REP, 'rep', CIS, 'cis' )
    
    -- Below is the objective setup for the 1 flag ctf game mode. teamATT and teamDEF are the same as in all the other game modes, 
    -- as are textATT and textDEF (with the exception that they now point to the 1 flag ctf objective text).
    
    -- captureLimit set the capture limit for the game. This value is overridden by the shell settings for the game mode.
    
    -- flag = "flag" specifies the name of the flag (taken from the name in the editor)
    -- flagIcon specifies the icon that will be used on the flag, both in-hud and on the mini-map.
    -- flagIconScale should be self-explanatory. Sets the scale of the flagIcon
    -- homeRegion works the same as in 2 flag CTF. Without a home region the flag will not respawn. This can be any region in the level.
    -- captureRegionATT specifies the region which teamATT will bring the flag in order to score.
    -- captureRegionDEF specifies the region which teamDEF will bring the flag in order to score.
    -- capRegionMarkerATT and capRegionMarkerDEF specifies what icon to use for the mini-map icon for the capture region for teamATT and teamDEF respectively.
    -- capRegionMarkerScaleATT and capRegionMarkerScaleDEF specify the scale of the capture region icon for each team.
    -- multiplayerRules = true turns on the multiplayer condition for this game mode. Again, every game mode should have this set to true.
    
    ctf = ObjectiveOneFlagCTF:New{
            teamATT = REP, teamDEF = CIS,
            textATT = "game.modes.1flag", 
            textDEF = "game.modes.1flag2",
            captureLimit = 5, 
            flag = "flag", 
            flagIcon = "flag_icon",
            flagIconScale = 3.0, 
            homeRegion = "homeregion",
            captureRegionATT = "team1_capture", 
            captureRegionDEF = "team2_capture",
            capRegionMarkerATT = "hud_objective_icon_circle", 
            capRegionMarkerDEF = "hud_objective_icon_circle",
            capRegionMarkerScaleATT = 3.0, 
            capRegionMarkerScaleDEF = 3.0, 
            multiplayerRules = true
            }
    
    -- This next line starts the objective, same as in 2 flag CTF and conquest.
    ctf:Start()
    
    -- EnableSPHerorules, same as in CTF and conquest
    EnableSPHeroRules()
    
    -- This ends the ScriptPostLoad function
    
end
```
**MemoryPool for flag object**

You'll notice in the ScriptInit function the following line:
```SetMemoryPoolSize("FlagItem", 1)```

This sets the memorypool for the flag. In 2 flag CTF, this was set to 2 for 2 flags, in 1 flag CTF, we only need one FlagItem.

**Call to load the game mode layers**

In our conquest script, we had the following line;

```ReadDataFile("dc:ABC\\ABC.lvl", "ABC_conquest")```

This loaded the conquest game mode scripts. In our 1 flag CTF script, this line will be altered to look like this;
```ReadDataFile("dc:ABC\\ABC.lvl", "ABC_1flag")```

This will load the 1 flag CTF game mode layers. For more information on game modes, and layers, see ZeroEditor_GameModes.doc

### Hero Assault mission script

Last, but not least, we'll go over the PostLoad function for a hero assault map, which is significantly simpler than the other modes. First though, notice that the ScriptCB_DoFile line now calls for the "ObjectiveTDM" script. This must be set correctly, otherwise your level will not run properly.

```LUA
--This first line creates the ScriptPostLoad function
function ScriptPostLoad()
    
    -- The line below enables the hero rules, which are used differently in Hero Assault, but must still be present.
    EnableSPHeroRules()
    
    -- As the lua comment says below, the following block is the hero assault objective setup. teamATT and teamDEF work the same as 
    -- in the other maps. The only difference to note is that we're now explicitly entering a 1 and a 2 for these values; 
    -- team 1 and 2. multiplayerScoreLimit specifies the score limit for the match, but this value will be overridden by the 
    -- score limit set in the shell, which defaults to 180. textATT and textDEF specifies the objective text to display for each 
    -- team. multiplayerRules, as with the other game modes sets certain flags in the script to function differently for multiplayer 
    -- purposes. isCelebrityDeathmatch = true sets some flags in the game mode scripts, and code that changes certain game functions 
    -- to be specific to hero assault. This should always be set to true in hero assault maps.
    
    -- This is the actual objective setup
    TDM = ObjectiveTDM:New{
                teamATT = 1, 
                teamDEF = 2,
                multiplayerScoreLimit = 100,
                textATT = "game.modes.tdm",
                textDEF = "game.modes.tdm2", 
                multiplayerRules = true, 
                isCelebrityDeathmatch = true
                }
    
    -- This line starts the hero assault objective
    TDM:Start()
    
    -- These next two lines give AIGoals for each team. Normally, these are set automatically by the game mode script, 
    -- but in the case of a TDM (team deathmatch) objective, we must manually set these to give the AI something to do. 
    -- The parameters are as follows; The first number is the team number, the second number is the AI Goal, in this case 
    -- deathmatch, and the third number is the weighting. With only one goal set for each team, all of the AI on each team 
    -- will be in Deathmatch mode. If each team had 2 goals (say one conquest, and one deathmatch for example), each set at 
    -- 100, then half of each team would be doing each goal type.
    AddAIGoal(1, "Deathmatch", 100)
    AddAIGoal(2, "Deathmatch", 100)
    
    --This line ends the ScriptPostLoad function.
    
end
```

**Other differences in Hero Assault**

You'll notice that in Hero Assault, only hero units are loaded, and the hero units are entered in the SetupTeams section so that all the heroes are available at all times. We do still use the SetHeroClass call, because we don't have enough slots in SetupTeams to specify that many units, so we add them with a SetHeroClass call.

**Call to load the game mode layers**

Once again, in our conquest script, we had the following line:
```ReadDataFile("dc:ABC\\ABC.lvl", "ABC_conquest")```

This loaded the conquest game mode scripts. In our hero assault script, this line will be altered to look like this:
```ReadDataFile("dc:ABC\\ABC.lvl", "ABC_eli")```

This will load the eli game mode layers. For more information on game modes, and layers, see ZeroEditor_GameModes.doc