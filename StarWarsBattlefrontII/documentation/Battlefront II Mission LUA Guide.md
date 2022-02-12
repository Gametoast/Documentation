# Battlefront II Mission LUA Guide

In this document, I&#39;ll go over each type of Battlefront II mission script, and detail what each section of the script does. ModTools VisualMunge does most things for you, so you shouldn&#39;t have to be editing these scripts too much, but in case you want to change some things around, and experiment, here is a general break-down for you.

The different scripts you&#39;ll be dealing with are; \_con (conquest), \_1flag(1 flag ctf), \_ctf (2 flag ctf), and \_eli (hero assault).

I&#39;ll start with the Conquest script. The script I&#39;ll be commenting on is the exact conquest script that is created by ModTools Visual Munge when you create a new level. My comments will show up highlighted in gray. Comments will always refer to the block of script AFTER the comments.

So let&#39;s begin:

--

-- Copyright (c) 2005 Pandemic Studios, LLC. All rights reserved.

--

The ScriptCB\_DoFile lines load in an outside script, which allows us to make calls to functions that exist in those outside scripts, but do not exist in our actual game script. This just keeps a lot of the actual game script in one place, rather than being copied all over the place in every script. ObjectiveConquest is the script that handles all the Conquest game mod logic. setup\_teams handles the logic for specifying the unit loadout. More on that later.

-- load the gametype script

ScriptCB\_DoFile(&quot;ObjectiveConquest&quot;)

ScriptCB\_DoFile(&quot;setup\_teams&quot;)

These next lines simply define variables that we&#39;ll use in various places in our script. These lines define REP as team 1, and CIS as team 2.

We also use the variables ATT and DEF in some places in the script. These variables refer to which team is the attacking team, and which team is the defending team. In this example, REP is set as the attacking team, and CIS is set up as the defending team, and correspondingly, ATT is now set as 1, and DEF is set as 2.

-- REP Attacking (attacker is always #1)

REP = 1;

CIS = 2;

-- These variables do not change

ATT = REP;

DEF = CIS;

The following line defines the function ScriptPostLoad, which is a function that is run after the game has finished running ScriptInit (more on that below). ScriptPostLoad will contain all your game script, handling everything that actually happens once the level is loaded and play begins. ScriptInit is setup, and making sure everything is loaded, and then ScriptPostLoad actually contains the in-game logic.

function ScriptPostLoad()

Just as it says in the actual script comment below (lua comments begin with --, two dashes) these next lines define the CPs that will be used for conquest. It is important if you are going to add more CPs to your level, that you edit your script, and add your new CPs to the list. The default options provide 4 CPs by default. The first cp1 is simply a variable name that you are using to define your CP. The &quot;cp1&quot; after name = , is the actual name of the CP in the editor. Make sure you have your names spelled right (the names ARE case-sensetive)

--This defines the CPs. These need to happen first

cp1 = CommandPost:New{name = &quot;cp1&quot;}

cp2 = CommandPost:New{name = &quot;cp2&quot;}

cp3 = CommandPost:New{name = &quot;cp3&quot;}

cp4 = CommandPost:New{name = &quot;cp4&quot;}

This block if script sets up the conquest objective. teamATT and teamDEF define which team is the attacking team, and which team is the defending team.

textATT and textDEF refer to the localize string that will be displayed as the objective text for each team. This will say something like &quot;Capture all the CPs&quot; or &quot;Capture the enemy flag&quot; depending on which game mode you&#39;re playing.

multiplayerRules = true sets the rules for multiplayer as the same game mode script (ObjectiveConquest from above) is used both in single player and multiplayer. This should always be set to true in a multiplayer script.

--This sets up the actual objective. This needs to happen after cp&#39;s are defined

conquest = ObjectiveConquest:New{teamATT = ATT, teamDEF = DEF,

textATT = &quot;game.modes.con&quot;,

textDEF = &quot;game.modes.con2&quot;,

multiplayerRules = true}

These next lines should also be fairly self-explanatory. Once you&#39;ve defined the CPs, and set up the objective, these lines add the CPs to the objective. If your CPs are not defined, and added into the objective, then they will still function as CPs in the game (being capturable, and you can spawn from them) but they will not impact the victory/defeat conditions for the match.

--This adds the CPs to the objective. This needs to happen after the objective is set up

conquest:AddCommandPost(cp1)

conquest:AddCommandPost(cp2)

conquest:AddCommandPost(cp3)

conquest:AddCommandPost(cp4)

This actually starts the objective. Without this line, your conquest game will go on forever, and will never actually start, or end.

conquest:Start()

EnableSPHeroRules turns on the hero rules for the game. This should be present in every multiplayer script, unless you do not actually want heroes in your map. Simply omit this line, and you will never get heroes in your game.

EnableSPHeroRules()

This end closes the ScriptPostLoad function

end

This ScriptInit function must be present in every game mode script. This function is automatically run by the game, and handles all the loading of assets, and the team setup. I will go into detail line by line below.

---------------------------------------------------------------------------

-- FUNCTION: ScriptInit

-- PURPOSE: This function is only run once

-- INPUT:

-- OUTPUT:

-- NOTES: The name, &#39;ScriptInit&#39; is a chosen convention, and each

-- mission script must contain a version of this function, as

-- it is called from C to start the mission.

---------------------------------------------------------------------------

This line creates the ScriptInit function

function ScriptInit()

This ReadDataFile loads ingame.lvl, which is required for every level.

ReadDataFile(&quot;ingame.lvl&quot;)

These next two lines set the max flyheight for the level. This prevents units like jet troopers and jedi from jumping over walls, and getting out of the world, or getting on top of buildings that they should not be able to get on top of. The playerflyheight is for the player, and the maxflyheight is for other units.

SetMaxFlyHeight(30)

SetMaxPlayerFlyHeight (30)

This block of SetMemoryPoolSize set the memory pool sizes for various things for Jedi, and other heroes in the map. The ClothData sets how many cloth objects can be in the level at one time. The Combo:: pools set up various attack, and combo values for the jedi. You&#39;ll notice these values are set much higher in the Hero Assault scripts.

SetMemoryPoolSize (&quot;ClothData&quot;,20)

SetMemoryPoolSize (&quot;Combo&quot;,20) -- should be ~ 2x number of jedi classes

SetMemoryPoolSize (&quot;Combo::State&quot;,300) -- should be ~12x #Combo

SetMemoryPoolSize (&quot;Combo::Transition&quot;,300) -- should be a bit bigger than #Combo::State

SetMemoryPoolSize (&quot;Combo::Condition&quot;,300) -- should be a bit bigger than #Combo::State

SetMemoryPoolSize (&quot;Combo::Attack&quot;,150) -- should be ~8-12x #Combo

SetMemoryPoolSize (&quot;Combo::DamageSample&quot;,1800) -- should be ~8-12x #Combo::Attack

SetMemoryPoolSize (&quot;Combo::Deflect&quot;,50)

This next ReadDataFile line loads the sound filed that will be used in this level. This contains all the unit sounds, as well as any level specific sounds. You can change this to use sound files from other levels as long as you know that that level was setup for the type of use that you want. For example, you won&#39;t want to use the hoth.lvl sound file if you&#39;re doing a map with CIS units as the hoth files was not setup for use with CIS units. For this example, we have ReadDataFile(&quot;sound\\yav.lvl;yav1cw). The yav1cw specifies that we&#39;ll be using the sounds for the Clone Wars era in this map. If we wanted to be using the sounds for the Galactic Civil War era, we would be calling for yav1gcw. Note: Some levels do not support certain eras. For example, geonosis does not have gcw, and hoth does not have cw.

ReadDataFile(&quot;sound\\yav.lvl;yav1cw&quot;)

This next block of ReadDataFile calls loads all the infantry and vehicle units you&#39;ll be using. If you are trying to use a certain unit or vehicle, and it just will not show up in the game, it&#39;s a good idea to look here, and make sure you&#39;re actually loading that character/vehicle.

ReadDataFile(&quot;SIDE\\rep.lvl&quot;,

&quot;rep\_inf\_ep3\_rifleman&quot;,

&quot;rep\_inf\_ep3\_rocketeer&quot;,

&quot;rep\_inf\_ep3\_engineer&quot;,

&quot;rep\_inf\_ep3\_sniper&quot;,

&quot;rep\_inf\_ep3\_officer&quot;,

&quot;rep\_inf\_ep3\_jettrooper&quot;,

&quot;rep\_hover\_fightertank&quot;,

&quot;rep\_hero\_anakin&quot;,

&quot;rep\_hover\_barcspeeder&quot;)

ReadDataFile(&quot;SIDE\\cis.lvl&quot;,

&quot;cis\_inf\_rifleman&quot;,

&quot;cis\_inf\_rocketeer&quot;,

&quot;cis\_inf\_engineer&quot;,

&quot;cis\_inf\_sniper&quot;,

&quot;cis\_inf\_officer&quot;,

&quot;cis\_inf\_droideka&quot;,

&quot;cis\_hero\_darthmaul&quot;,

&quot;cis\_hover\_aat&quot;)

This next ReadDataFile loads some turrets that are used in many of our levels.

ReadDataFile(&quot;SIDE\\tur.lvl&quot;,

&quot;tur\_bldg\_laser&quot;,

&quot;tur\_bldg\_tower&quot;)

The SetupTeams sections will determine a few things. The team specifies which team the team being defined is (1 or 2) which gets it&#39;s value REP from the variable that we defined above. If you recall, we defined REP = 1, therefore, the first team we set up here will be team 1. units = 20 specifies that there will always be 20 units on the field at any given time. You can play with these values if you want to have a huge battle, but be careful, as this will create much more strain on your system. The PC should be able to handle a pretty big load though. 64 on 64, or even higher should be pretty easily doable.

Reinforcements = 150 specifies that there will be 150 reinforcements. These values do not have to be the same for each side, so if you want to start out one team with some kind of disadvantage, you can offset that by giving that side more reinforcements for example. The other lines should be pretty self-explanatory. These specify which units will occupy which slots in the character carousel. You could (if desired) make one of your units a hero that is always available to any player.

The numbers in these lines define min and max numbers for these units. For example, we have 20 units total on the play field. The soldier unit is set to 9 min and 25 max. What this means is that there will ALWAYS be 9 soliders on the field, 1 rocketeer, 1 engineer, 1 sniper, 1 officer, and 1 jet trooper. The second number sets the max, so there will never be MORE than 25 soldiers, 4 rocketeers, 4 engineers, etc. The minimums are filled up first, and then the the game will fill up to the max&#39;s randomly until the 20 unit maximum units on the field is hit. You should never have you minimums exceed your total number of units allowed on the field (in this example, the minimums would never be set to more than 20 in total.)

SetupTeams{

rep = {

team = REP,

units = 20,

reinforcements = 150,

soldier = { &quot;rep\_inf\_ep3\_rifleman&quot;,9, 25},

assault = { &quot;rep\_inf\_ep3\_rocketeer&quot;,1, 4},

engineer = { &quot;rep\_inf\_ep3\_engineer&quot;,1, 4},

sniper = { &quot;rep\_inf\_ep3\_sniper&quot;,1, 4},

officer = {&quot;rep\_inf\_ep3\_officer&quot;,1, 4},

special = { &quot;rep\_inf\_ep3\_jettrooper&quot;,1, 4},

},

cis = {

team = CIS,

units = 20,

reinforcements = 150,

soldier = { &quot;cis\_inf\_rifleman&quot;,9, 25},

assault = { &quot;cis\_inf\_rocketeer&quot;,1, 4},

engineer = { &quot;cis\_inf\_engineer&quot;,1, 4},

sniper = { &quot;cis\_inf\_sniper&quot;,1, 4},

officer = {&quot;cis\_inf\_officer&quot;,1, 4},

special = { &quot;cis\_inf\_droideka&quot;,1, 4},

}

}

These next two lines set what the hero class is for each side. In this case, we have Anakin on the REP team, and darth maul on the CIS team. Heroes should be defined here, rather than in the SetupTeams above, unless you want them available at all times. If they are defined as a hero class, then they will be unlocked according to the hero rules.

SetHeroClass(CIS, &quot;cis\_hero\_darthmaul&quot;)

SetHeroClass(REP, &quot;rep\_hero\_anakin&quot;)

-- Level Stats

ClearWalkers wipes out any allocations that may have been done automatically for walkers. You&#39;ll need to have this line in, and uncommented if you want to have walkers in your level.

-- ClearWalkers()

These next lines will add walkers to your level. The first number inside the parenthesis specifies how many leg pairs the walker type has. Droidekas are set up as a special case, with 0 leg pairs. So as you can see below, we have AddWalkerType(0,4) this specifies that we will have 4 walkers with 0 leg pairs (droidekas). 1 leg pair would specify a walker with one pair of legs, an ATST for example, or a one-man ATST from the clone wars era. So for 2 ATSTs, we would have a line that says; AddWalkerType(1, 2)

2 leg pairs would be a unit like the CIS spider walker, or an ATAT, and 3 leg pairs would be the 6-legged walker from the clone wars era.

AddWalkerType(0, 4) -- special -\&gt; droidekas

AddWalkerType(1, 0) -- 1x2 (1 pair of legs)

AddWalkerType(2, 0) -- 2x2 (2 pairs of legs)

AddWalkerType(3, 0) -- 3x2 (3 pairs of legs)

This next block of script sets up various memory pools for your level.

local weaponCnt = 240

SetMemoryPoolSize(&quot;Aimer&quot;, 75)

SetMemoryPoolSize(&quot;AmmoCounter&quot;, weaponCnt)

SetMemoryPoolSize(&quot;BaseHint&quot;, 1000)

SetMemoryPoolSize(&quot;EnergyBar&quot;, weaponCnt)

SetMemoryPoolSize(&quot;EntityCloth&quot;, 22)

SetMemoryPoolSize(&quot;EntityFlyer&quot;, 7)

SetMemoryPoolSize(&quot;EntityHover&quot;, 8)

SetMemoryPoolSize(&quot;EntityLight&quot;, 50)

SetMemoryPoolSize(&quot;EntitySoundStream&quot;, 4)

SetMemoryPoolSize(&quot;EntitySoundStatic&quot;, 20)

SetMemoryPoolSize(&quot;MountedTurret&quot;, 25)

SetMemoryPoolSize(&quot;Navigator&quot;, 49)

SetMemoryPoolSize(&quot;Obstacle&quot;, 760)

SetMemoryPoolSize(&quot;PathNode&quot;, 512)

SetMemoryPoolSize(&quot;SoundSpaceRegion&quot;, 46)

SetMemoryPoolSize(&quot;TreeGridStack&quot;, 500)

SetMemoryPoolSize(&quot;UnitAgent&quot;, 49)

SetMemoryPoolSize(&quot;UnitController&quot;, 49)

SetMemoryPoolSize(&quot;Weapon&quot;, weaponCnt)

SetSpawnDelay specifies an initial spawn delay. All levels use this call. You should never have to modify this line.

SetSpawnDelay(10.0, 0.25)

This next line is a VERY important line. This reads in your level files, and the game mode files. Without these lines, the script wouldn&#39;t know what level files to load, and you wouldn&#39;t be able to run your level. The first part; &quot;dc:ABC\\ABC.lvl&quot; loads all the regular level files, and the second part, &quot;ABC\_conquest&quot; specifies which game mode you&#39;re going to be loading. So if this were a CTF script, you would see &quot;ABC\_ctf&quot;, or &quot;ABC\_1flag&quot;, or &quot;ABC\_eli&quot; for hero assault.

ReadDataFile(&quot;dc:ABC\\ABC.lvl&quot;, &quot;ABC\_conquest&quot;)

This line sets a switch in the code that controls a number of AI behaviors. If this were a very foggy map, with a short view distance, you would set this to &quot;true&quot; which would make the AI see a shorter distance, and other various things to make the AI act more appropriately in an environment with limited visibility.

SetDenseEnvironment(&quot;false&quot;)

The next section sets up various sound elements in the level

-- Sound

These first two lines set the sound effect used for zooming in and out with the scope.

SetSoundEffect(&quot;ScopeDisplayZoomIn&quot;, &quot;binocularzoomin&quot;)

SetSoundEffect(&quot;ScopeDisplayZoomOut&quot;, &quot;binocularzoomout&quot;)

Below, voiceSlow and voiceQuick are both simply audio streams for player, and other unit VO. They are set up as two separate streams for two reasons. One, the quick stream has less VO in it, and the seek time will be lower than the slow stream. The other reason, is that it opens an additional audio stream for voiceovers so that the voiceovers don&#39;t stomp on each other (one cuts out when the other starts). The AudioStreamAppendSegments basically just tacks an additional stream onto another stream, lumping them both together in one stream. In the example below, &quot;cis\_unit\_vo\_slow&quot; and &quot;global\_vo\_vo\_slow&quot; are combined with the original voiceSlow stream, which is defined as &quot;rep\_unit\_vo\_slow&quot;

voiceSlow = OpenAudioStream(&quot;sound\\global.lvl&quot;, &quot;rep\_unit\_vo\_slow&quot;)

AudioStreamAppendSegments(&quot;sound\\global.lvl&quot;, &quot;cis\_unit\_vo\_slow&quot;, voiceSlow)

AudioStreamAppendSegments(&quot;sound\\global.lvl&quot;, &quot;global\_vo\_slow&quot;, voiceSlow)

voiceQuick = OpenAudioStream(&quot;sound\\global.lvl&quot;, &quot;rep\_unit\_vo\_quick&quot;)

AudioStreamAppendSegments(&quot;sound\\global.lvl&quot;, &quot;cis\_unit\_vo\_quick&quot;, voiceQuick)

These lines open audio streams in the sound levels loaded previously. In the above case the music is opened first. then the voiceovers, then the tactical voiceovers which are in a separate stream so there is less lag in hearing the VO when many sounds are being triggered, then two streams are opened for ambient environment streams because in geo there are two and in an case where you have more than one ambient environment stream two streams need to be opened so both can be heard at the same time if the player ever encounters them at the same time.

OpenAudioStream(&quot;sound\\global.lvl&quot;, &quot;cw\_music&quot;)

-- OpenAudioStream(&quot;sound\\global.lvl&quot;, &quot;global\_vo\_quick&quot;)

-- OpenAudioStream(&quot;sound\\global.lvl&quot;, &quot;global\_vo\_slow&quot;)

OpenAudioStream(&quot;sound\\yav.lvl&quot;, &quot;yav1&quot;)

OpenAudioStream(&quot;sound\\yav.lvl&quot;, &quot;yav1&quot;)

OpenAudioStream(&quot;sound\\yav.lvl&quot;, &quot;yav1\_emt&quot;)

These lines set the voiceover calls for each team and circumstance. In the first line the REP is saying the REP are losing reinforcements, as denoted by REP, REP. The &quot;rep\_off\_com\_report\_us\_overwhelmed&quot; calls a soundstreamproperty in a config file (cw\_vo.snd) which plays a sound included in cw\_vo.sfx.

SetBleedingVoiceOver(REP, REP, &quot;rep\_off\_com\_report\_us\_overwhelmed&quot;, 1)

SetBleedingVoiceOver(REP, CIS, &quot;rep\_off\_com\_report\_enemy\_losing&quot;, 1)

SetBleedingVoiceOver(CIS, REP, &quot;cis\_off\_com\_report\_enemy\_losing&quot;, 1)

SetBleedingVoiceOver(CIS, CIS, &quot;cis\_off\_com\_report\_us\_overwhelmed&quot;, 1)

This is the voiceover that is played when you get the &quot;leaving the battlefield&quot; message in the game. The boundaries are set up in the editor as to when you will receive this message. More on this in the ZeroEditor\_guide.doc

SetOutOfBoundsVoiceOver(2, &quot;cisleaving&quot;)

SetOutOfBoundsVoiceOver(1, &quot;repleaving&quot;)

These lines set the repeating music that is played throughout the game and the trigger for when the different subset of tracks is called. First the team that hears is declared, then the reinforcement count as a percent. So above the first lines plays start music according to the interval defined in the soundstreamproperty in geocw\_music.snd The music will repeat until the next threshold is breached, in this case the middle music begins at 99% reinforcements. The next argument sets to 1 to assign a started bleeding sound set to 0 to assign a stopped bleeding sound. The final argument flags the declaration to look for the first argument as a percentage, if set to zero it will look for an explicit count.

SetAmbientMusic(REP, 1.0, &quot;rep\_yav\_amb\_start&quot;, 0,1)

SetAmbientMusic(REP, 0.8, &quot;rep\_yav\_amb\_middle&quot;, 1,1)

SetAmbientMusic(REP, 0.2, &quot;rep\_yav\_amb\_end&quot;, 2,1)

SetAmbientMusic(CIS, 1.0, &quot;cis\_yav\_amb\_start&quot;, 0,1)

SetAmbientMusic(CIS, 0.8, &quot;cis\_yav\_amb\_middle&quot;, 1,1)

SetAmbientMusic(CIS, 0.2, &quot;cis\_yav\_amb\_end&quot;, 2,1)

These lines set the music that is played in victory or defeat for each team.

SetVictoryMusic(REP, &quot;rep\_yav\_amb\_victory&quot;)

SetDefeatMusic (REP, &quot;rep\_yav\_amb\_defeat&quot;)

SetVictoryMusic(CIS, &quot;cis\_yav\_amb\_victory&quot;)

SetDefeatMusic (CIS, &quot;cis\_yav\_amb\_defeat&quot;)

These lines set up some miscellaneous sound calls that are used in the levels, like zoom sounds, and some shell sounds, like selecting units, and other sound effects. You shouldn&#39;t really be modifying these either unless you are making your own sounds.

SetSoundEffect(&quot;ScopeDisplayZoomIn&quot;, &quot;binocularzoomin&quot;)

SetSoundEffect(&quot;ScopeDisplayZoomOut&quot;, &quot;binocularzoomout&quot;)

--SetSoundEffect(&quot;BirdScatter&quot;, &quot;birdsFlySeq1&quot;)

--SetSoundEffect(&quot;WeaponUnableSelect&quot;, &quot;com\_weap\_inf\_weaponchange\_null&quot;)

--SetSoundEffect(&quot;WeaponModeUnableSelect&quot;, &quot;com\_weap\_inf\_modechange\_null&quot;)

SetSoundEffect(&quot;SpawnDisplayUnitChange&quot;, &quot;shell\_select\_unit&quot;)

SetSoundEffect(&quot;SpawnDisplayUnitAccept&quot;, &quot;shell\_menu\_enter&quot;)

SetSoundEffect(&quot;SpawnDisplaySpawnPointChange&quot;, &quot;shell\_select\_change&quot;)

SetSoundEffect(&quot;SpawnDisplaySpawnPointAccept&quot;, &quot;shell\_menu\_enter&quot;)

SetSoundEffect(&quot;SpawnDisplayBack&quot;, &quot;shell\_menu\_exit&quot;)

The Camera stats section defines the coordinate for the camera shots that appear in the background when you&#39;re waiting to spawn in-game using in game coordinates. Using free cam mode in the SPTEST.exe supplied, modders can navigate to a spot and dump the coordinates to a file called cameracoordinates.txt by typing dumpcamera in the console.

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

This line closes the ScriptInit function…FIN!

end

--

This completes the documentation of a conquest mission script. Next, we&#39;ll take a look at 2 Flag CTF, 1 Flag CTF, and Hero Assault maps. I won&#39;t be covering these scripts in their entirety, since they are mostly the same, I will be covering only the parts that differ, which for most of the scripts, is only the ScriptPostLoad function.

### 2 Flag CTF mission script

Below, we&#39;ll take a look at the ScriptPostLoad function from a CTF script. I&#39;ll continue with the same commenting scheme used above.

Before we get to that though, notice the ScriptCBDoFile lines at the top of the script are different. In the conquest script, we had this line:

ScriptCB\_DoFile(&quot;ObjectiveConquest&quot;)

This loads the Objective script which handles all the game logic for conquest. Well, in CTF you&#39;re not going to have ObjectiveConquest anymore, this line is replaced with the following:

ScriptCB\_DoFile(&quot;ObjectiveCTF&quot;)

This will load the objective script that handles all the logic for the **CTF** game mode.

With that out of the way, let&#39;s move on to the ScriptPostLoad function from the template CTF script:

--

The line below creates the ScriptPostLoad function (same as above)

function ScriptPostLoad()

The SoundEvent\_SetupTeams line below must be present in order for the CTF game event sounds to work (things like &quot;The republic has the flag&quot;, &quot;The CIS has captured the Republic flag&quot;, etc). Without this line, it will be an aweful quiet game of CTF with no audio cues as to the status of the flag. In a GCW era script, this would look like this;

SoundEvent\_SetupTeams(IMP, &#39;imp&#39;, ALL, &#39;all&#39;)

SoundEvent\_SetupTeams( REP, &#39;rep&#39;, CIS, &#39;cis&#39; )

These next 4 lines specifies which geometry to use for each flag. After SetProperty, the first parameter is the name of the flag in the editor, the second parameter is what property you are setting (in this case GeometryName and CarriedGeometryName) and the last parameter is the geometry to use. GeometryName is what geometry is used when the flag is sitting on the ground. The CarriedGeometryName set the geometry when the flag is being carried by a player. The carried geometry has some small differences to make the flag look better when being carried on the back of a unit. For more information on the SetProperty script command, see the Battlefront2\_scripting\_system.doc

SetProperty(&quot;flag1&quot;, &quot;GeometryName&quot;, &quot;com\_icon\_republic\_flag&quot;)

SetProperty(&quot;flag1&quot;, &quot;CarriedGeometryName&quot;, &quot;com\_icon\_republic\_flag\_carried&quot;)

SetProperty(&quot;flag2&quot;, &quot;GeometryName&quot;, &quot;com\_icon\_cis\_flag&quot;)

SetProperty(&quot;flag2&quot;, &quot;CarriedGeometryName&quot;, &quot;com\_icon\_cis\_flag\_carried&quot;)

The lua comments below pretty much sum up the next line. Again, for more information on the SetClassProperty script command, see the Battlefront2\_scripting\_system.doc

--This makes sure the flag is colorized when it has been dropped on the ground

SetClassProperty(&quot;com\_item\_flag&quot;, &quot;DroppedColorize&quot;, 1)

This next block of script sets up the CTF parameters. Much of this is the same as in conquest. teamATT and teamDEF are the same, textATT and textDEF are the same (but point to the ctf objective text instead of conquest), and multiplayer rules is the same.

--This is all the actual ctf objective setup

ctf = ObjectiveCTF:New{teamATT = REP, teamDEF = CIS, captureLimit = 5, textATT = &quot;game.modes.ctf&quot;, textDEF = &quot;game.modes.ctf2&quot;, hideCPs = true, multiplayerRules = true}

This next block sets up the specific parameters for each flag.

name = &quot;flag1&quot; refers to the actual name of the flag in the editor.

homeRegion is only really used to make the flag re-spawn when captured. Each flag must have a home region in capture the flag, or when the flag is captured, it will not respawn. This is because the same game mode script is used for both single player and multiplayer. In single player we didn&#39;t want the flags to respawn. You can just use any region in the level as the flag&#39;s home region, it only exists to make sure that the flag respawns when it is captured. Also, the flag will respawn where it was originally placed, NOT where the homeregion is.

captureRegion specifies the region that the flag must be brought to in order for the flag to be captured, and points scored.

capRegionMarker specifies the icon that is used to represent the capture region on the minimap.

capRegionMarkerScale specifies the scale of that icon.

The icon parameter is not really used in multiplayer CTF and should be left as it appears below.

mapIcon specifies what icon will be used as the icon in the mini-map for the flag itself

All the these parameters should be left alone for the most part. The only parts you should have any reason to change would be the &quot;name&quot; line if you have your flags named anything other than &quot;flag1&quot; and &quot;flag2&quot;, and if your capture regions are named different, obviously these lines would need to be modified as well.

There is a second block of identical script for the second flag in this 2 flag CTF script.

ctf:AddFlag{name = &quot;flag1&quot;, homeRegion = &quot;team1\_capture&quot;, captureRegion = &quot;team2\_capture&quot;,

capRegionMarker = &quot;hud\_objective\_icon\_circle&quot;, capRegionMarkerScale = 3.0,

icon = &quot;&quot;, mapIcon = &quot;flag\_icon&quot;, mapIconScale = 3.0}

ctf:AddFlag{name = &quot;flag2&quot;, homeRegion = &quot;team2\_capture&quot;, captureRegion = &quot;team1\_capture&quot;,

capRegionMarker = &quot;hud\_objective\_icon\_circle&quot;, capRegionMarkerScale = 3.0,

icon = &quot;&quot;, mapIcon = &quot;flag\_icon&quot;, mapIconScale = 3.0}

This line starts the CTF objective, the same as in the conquest script, where you have conquest:Start()

ctf:Start()

This line also is the same as in the conquest script, enabling the hero rules for unlocking heroes in multiplayer.

EnableSPHeroRules()

This end closes the ScriptPostLoad function

end

--

The only other key differences are the following:

**MemoryPool for flag objects****.**

You&#39;ll notice in the ScriptInit function the following line;

SetMemoryPoolSize(&quot;FlagItem&quot;, 2)

This line MUST exist in CTF scripts. Without this line, your flags will either not show up, or your level will possibly (and probably) crash. The number after the &quot;FlagItem&quot; specifies how many flags. In 2 flag CTF, we have 2 flags (really?).

**Call to load the game mode layers**

In our conquest script, we had the following line;

ReadDataFile(&quot;dc:ABC\\ABC.lvl&quot;, &quot;ABC\_conquest&quot;)

This loaded the conquest game mode scripts. In our CTF script, this line will be altered to look like this;

ReadDataFile(&quot;dc:ABC\\ABC.lvl&quot;, &quot;ABC\_ctf&quot;)

This will load the ctf game mode layers. That&#39;s that.

### 1 Flag CTF mission script

First, notice the the ScriptCB\_DoFile line that calls the objective script is changed once again. For 2 flag CTF we had:

ScriptCB\_DoFile(&quot;ObjectiveCTF&quot;)

Which has now been replaced with;

ScriptCB\_DoFile(&quot;ObjectiveOneFlagCTF&quot;)

And now we will go over the changes for a 1 flag CTF mission script. Find the ScriptPostLoad from the 1 flag CTF script below (comments are highlighted in gray):

This creates the ScriptPostLoad function

function ScriptPostLoad()

The SoundEvent\_SetupTeams is the same as for a 2 flag CTF map. This will enable the CTF event sounds, which are automatically adjusted when being run in 1 flag vs. 2 flag.

SoundEvent\_SetupTeams( REP, &#39;rep&#39;, CIS, &#39;cis&#39; )

Below is the objective setup for the 1 flag ctf game mode. teamATT and teamDEF are the same as in all the other game modes, as are textATT and textDEF (with the exception that they now point to the 1 flag ctf objective text).

captureLimit set the capture limit for the game. This value is overridden by the shell settings for the game mode.

flag = &quot;flag&quot; specifies the name of the flag (taken from the name in the editor)

flagIcon specifies the icon that will be used on the flag, both in-hud and on the mini-map.

flagIconScale should be self-explanatory. Sets the scale of the flagIcon

homeRegion works the same as in 2 flag CTF. Without a home region the flag will not respawn. This can be any region in the level.

captureRegionATT specifies the region which teamATT will bring the flag in order to score.

captureRegionDEF specifies the region which teamDEF will bring the flag in order to score.

capRegionMarkerATT and capRegionMarkerDEF specifies what icon to use for the mini-map icon for the capture region for teamATT and teamDEF respectively.

capRegionMarkerScaleATT and capRegionMarkerScaleDEF specify the scale of the capture region icon for each team.

multiplayerRules = true turns on the multiplayer condition for this game mode. Again, every game mode should have this set to true.

ctf = ObjectiveOneFlagCTF:New{teamATT = REP, teamDEF = CIS,

textATT = &quot;game.modes.1flag&quot;, textDEF = &quot;game.modes.1flag2&quot;,

captureLimit = 5, flag = &quot;flag&quot;, flagIcon = &quot;flag\_icon&quot;,

flagIconScale = 3.0, homeRegion = &quot;homeregion&quot;,

captureRegionATT = &quot;team1\_capture&quot;, captureRegionDEF = &quot;team2\_capture&quot;,

capRegionMarkerATT = &quot;hud\_objective\_icon\_circle&quot;, capRegionMarkerDEF = &quot;hud\_objective\_icon\_circle&quot;,

capRegionMarkerScaleATT = 3.0, capRegionMarkerScaleDEF = 3.0, multiplayerRules = true}

This next line starts the objective, same as in 2 flag CTF and conquest.

ctf:Start()

EnableSPHerorules, same as in CTF and conquest

EnableSPHeroRules()

This ends the ScriptPostLoad function

end

**MemoryPool for flag object**

You&#39;ll notice in the ScriptInit function the following line;

SetMemoryPoolSize(&quot;FlagItem&quot;, 1)

This sets the memorypool for the flag. In 2 flag CTF, this was set to 2 for 2 flags, in 1 flag CTF, we only need one FlagItem.

**Call to load the game mode layers**

In our conquest script, we had the following line;

ReadDataFile(&quot;dc:ABC\\ABC.lvl&quot;, &quot;ABC\_conquest&quot;)

This loaded the conquest game mode scripts. In our 1 flag CTF script, this line will be altered to look like this;

ReadDataFile(&quot;dc:ABC\\ABC.lvl&quot;, &quot;ABC\_1flag&quot;)

This will load the 1 flag CTF game mode layers. For more information on game modes, and layers, see ZeroEditor\_GameModes.doc

### Hero Assault mission script

Last, but not least, we&#39;ll go over the PostLoad function for a hero assault map, which is significantly simpler than the other modes. First though, notice that the ScriptCB\_DoFile line now calls for the &quot;ObjectiveTDM&quot; script. This must be set correctly, otherwise your level will not run properly.

This first line creates the ScriptPostLoad function

function ScriptPostLoad()

The line below enables the hero rules, which are used differently in Hero Assault, but must still be present.

EnableSPHeroRules()

As the lua comment says below, the following block is the hero assault objective setup. teamATT and teamDEF work the same as in the other maps. The only difference to note is that we&#39;re now explicitly entering a 1 and a 2 for these values; team 1 and 2. multiplayerScoreLimit specifies the score limit for the match, but this value will be overridden by the score limit set in the shell, which defaults to 180. textATT and textDEF specifies the objective text to display for each team. multiplayerRules, as with the other game modes sets certain flags in the script to function differently for multiplayer purposes. isCelebrityDeathmatch = true sets some flags in the game mode scripts, and code that changes certain game functions to be specific to hero assault. This should always be set to true in hero assault maps.

-- This is the actual objective setup

TDM = ObjectiveTDM:New{teamATT = 1, teamDEF = 2,

multiplayerScoreLimit = 100,

textATT = &quot;game.modes.tdm&quot;,

textDEF = &quot;game.modes.tdm2&quot;, multiplayerRules = true, isCelebrityDeathmatch = true}

This line starts the hero assault objective

TDM:Start()

These next two lines give AIGoals for each team. Normally, these are set automatically by the game mode script, but in the case of a TDM (team deathmatch) objective, we must manually set these to give the AI something to do. The parameters are as follows; The first number is the team number, the second number is the AI Goal, in this case deathmatch, and the third number is the weighting. With only one goal set for each team, all of the AI on each team will be in Deathmatch mode. If each team had 2 goals (say one conquest, and one deathmatch for example), each set at 100, then half of each team would be doing each goal type.

AddAIGoal(1, &quot;Deathmatch&quot;, 100)

AddAIGoal(2, &quot;Deathmatch&quot;, 100)

This line ends the ScriptPostLoad function.

end

**Other differences in Hero Assault**

You&#39;ll notice that in Hero Assault, only hero units are loaded, and the hero units are entered in the SetupTeams section so that all the heroes are available at all times. We do still use the SetHeroClass call, because we don&#39;t have enough slots in SetupTeams to specify that many units, so we add them with a SetHeroClass call.

**Call to load the game mode layers**

Once again, in our conquest script, we had the following line;

ReadDataFile(&quot;dc:ABC\\ABC.lvl&quot;, &quot;ABC\_conquest&quot;)

This loaded the conquest game mode scripts. In our hero assault script, this line will be altered to look like this;

ReadDataFile(&quot;dc:ABC\\ABC.lvl&quot;, &quot;ABC\_eli&quot;)

This will load the eli game mode layers. For more information on game modes, and layers, see ZeroEditor\_GameModes.doc