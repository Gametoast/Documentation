**Battlefront II Space LUA Guide**

Space Scripting

The following three lua examples will walk you through the basics of lua editing and setup for Battlefront II space levels.

To begin, I'll note that most of the general lua stuff is covered in previous docs, so this will ONLY cover items that are space specific.

The following file is found the Template folder and is @#$c_cmn. This is a common (cmn) lua file that is referenced by the game mode files to ease the clutter that can (and will) build up in a lua file. Parts of the lua have been removed to only focus on what you need to learn for space.

```LUA
--  LinkedTurrets is a lua file that handles the turret mainframe functionality of Space levels. Technically, you could use this on any 
-- kind of map to allow one central object control a number of turrets.
ScriptCB_DoFile("LinkedTurrets")

function SetupTurrets()
    
    --CIS turrets
    
    -- turretLinkageCIS is an array of turrets as well as their controlling device. For the script portion below, "cis-defense" is the controlling 
    -- device, and "cis_turr_1-6" are the individual turrets
    
    turretLinkageCIS = LinkedTurrets:New{ 
            team = CIS, 
            mainframe = "cis-defense",
            turrets = {"cis_turr_1", "cis_turr_2", "cis_turr_3", "cis_turr_4", "cis_turr_5", "cis_turr_6"} 
    }
    
    turretLinkageCIS:Init()
    
    -- function turretLinkageCIS:OnDisableMainframe() sets up the localized text for the action of disabling (destroying) the mainframe
    -- ShowMessageText("level.spa.hangar.mainframe.atk.down", REP)
    --    This line will reference the line found within "level.spa.hangar.mainframe.atk.down" and display it for the REP side when the 
    --    mainframe is disabled.
    
    -- BroadcastVoiceOver( "ROSMP_obj_20", REP )
    --    This line will look for the sound call "ROSMP_obj_20" and play it for the REP side when the mainframe is disabled.
    
    function turretLinkageCIS:OnDisableMainframe()
        ShowMessageText("level.spa.hangar.mainframe.atk.down", REP)
        ShowMessageText("level.spa.hangar.mainframe.def.down", CIS)
        BroadcastVoiceOver( "ROSMP_obj_20", REP )
        BroadcastVoiceOver( "COSMP_obj_21", CIS )
    end
    
    -- Similar to the above scripting, the lines below perform text and sound duties when the mainframe is enables (repaired). 
    -- This will not play the status of the mainframe when the map starts, only when the mainframe is repaired.
    function turretLinkageCIS:OnEnableMainframe()
        ShowMessageText("level.spa.hangar.mainframe.atk.up", REP)
        ShowMessageText("level.spa.hangar.mainframe.def.up", CIS)
        BroadcastVoiceOver( "ROSMP_obj_22", REP )
        BroadcastVoiceOver( "COSMP_obj_23", CIS )
    end
end

-- SetWorldExtents and ScriptPreInit go hand in hand. When building a Space level, you may notice that when you exit your 
-- ship you instantly die. You also might find that running around certain parts of your ship you will die without taking damage. 
-- That's what SetWorldExtents is for. If you have this set to 2500, but you're still finding that the world is killing you 
-- (and you're not walking into a death region) then bump it up to enlarge the soldier based playable space.

function ScriptPreInit()
    SetWorldExtents(2500)
end

function ScriptInit()

    -- Ahh flyheights. These are easy. These values control how far from the center of the world the player can fly up or down. 
    -- These are used on ground based maps to limit the jet classes and jedi, but is also used to keep flyers from getting too 
    -- high or too far below the space battlefield. To find an appropriate height, use PrintPlayerPos in the console, fly to 
    -- your desired max/min height, and punch those numbers in. It's best to keep the Max/MinFlyHeight and the Max/MinPlayerFlyHeight 
    -- in line with each other to avoid AI doing things that players can't.
    SetMinFlyHeight(-1800)
    SetMaxFlyHeight(1800)
    SetMinPlayerFlyHeight(-1800)
    SetMaxPlayerFlyHeight(1800)
    
    --Notify Radius is the distance around a waiting craft from which AI can be lured in.
    SetAIVehicleNotifyRadius(100)
    
    -- SetupTeams has been explained before, but I wanted to point out that myTeamConfig is found in both cmn.lua files and 
    -- the 1flag.lua files because while cmn.lua files actually setup the teams for all modes that call that lua, sometimes 
    -- you need a mode that has a different loadout of units. For example, Space Marines aren't needed for CTF, so they aren't 
    -- called in myTeamConfig in the 1flag.luas.
    SetupUnits()
    SetupTeams(myTeamConfig)
    
    -- In the level stats section of your lua, remember to allocate memory for as many flyers as you'll need, as well as Command Flyers.
    
    -- Level Stats
    SetMemoryPoolSize("EntityFlyer", 36)
    SetMemoryPoolSize("CommandFlyer", 2)
    
    -- As the comment states, myScriptInit is for custom pool allocations for a specific mode or custom loading of assets or teams.
    
    -- do any pool allocations, custom loading here
    if myScriptInit then
        myScriptInit()
        myScriptInit = nil
    end
    
    -- ReadDataFile regarding sky files: Most of this work has been done by the development team for the actual shipped product, 
    -- so you have less to worry about unless you make your own skydome and such. All you have to do is replace "tat" with the 
    -- three letters that correspond to the planet you want the battle to take place over. "cor" for Coruscant, "hot" for Hoth, etc.
    ReadDataFile("SPA\\spa_sky.lvl", "tat")
    
    -- ReadDataFile regarding gamemodes and your levels' lvl file: myGameMode corresponds to the gamemode inside of your gamemodes' lua. 
    -- For example, this finds the line in the 1flag lua that reads "myGameMode = "@#$_CW-CTF"" and adds the "@#$_CW-CTF" portion in 
    -- place of "myGameMode" in the cmn script.
    ReadDataFile("SPA\\@#$.lvl", myGameMode)
    
    -- This line is needed for particles in space to work properly, don't delete it!
    SetParticleLODBias(15000)
    
    -- AddDeathRegion("deathregion3") the name of the deathregion is placed where "deathregion3" is in this line. Sounds obvious, 
    -- I know, but keep this in mind because if you don't add the death region, it won't be active in your level.
    AddDeathRegion("deathregion3")
    
    -- AddLandingRegion works like adding a death region. These regions will restrict the landing capabilities for all flyers in your 
    -- level to be within the specified region. If no landing region is defined, players will be able to land and then takeoff from anywhere in the map.
    AddLandingRegion("rep-CP1Con")
    
    -- End of the script!
    
end
```
--

This completes the documentation of a common space script. Now we'll take a look at 1 Flag CTF and Assault maps. I won't be covering these scripts in their entirety, since they have their common items inside the common script.

1 Flag Space CTF
```LUA
--
-- Copyright (c) 2005 Pandemic Studios, LLC. All rights reserved.
-- SPAX - Clone Wars Template CTF File
--
-- The ScriptCB_DoFile("ObjectiveOneFlagCTF ") calls the 1flag CTF lua that hopefully you've read about in a separate doc. 
-- Don't worry about what's in that lua, just know that it's a crucial item for you to have here.  As for the other 
-- ScriptCB_DoFile("@#$c_cmn") This line calls to our common lua that we just went over.
ScriptCB_DoFile("ObjectiveOneFlagCTF")
ScriptCB_DoFile("@#$c_cmn")

-- myGameMode, as stated before, calls out the proper mrq reference for the gamemode this lua sets up.
myGameMode = "@#$_CW-CTF"

-- This function sets up the units for your map. This is also found in the cmn file, but you can setup a different loadout for this game mode if you wanted to.
function SetupUnits()
    
    ReadDataFile("SIDE\\rep.lvl",
                 "rep_inf_ep3_pilot",
                 "rep_fly_assault_dome",
                 "rep_fly_anakinstarfighter_sc",
                 "rep_fly_arc170fighter_sc",
                 "rep_veh_remote_terminal",
                 "rep_fly_vwing")
    
    ReadDataFile("SIDE\\cis.lvl",
                 "cis_inf_pilot",
                 "cis_fly_fedlander_dome",
                 "cis_fly_droidfighter_sc",
                 "cis_fly_greviousfighter",
                 "cis_fly_tridroidfighter")
    
    ReadDataFile("SIDE\\tur.lvl",
                 "tur_bldg_spa_cis_beam",
                 "tur_bldg_spa_cis_chaingun",
                 "tur_bldg_spa_rep_beam",
                 "tur_bldg_spa_rep_chaingun",
                 "tur_bldg_chaingun_roof",
                 "tur_bldg_spa_cis_recoilless"
    )
end

-- myTeamConfig sets up the actual classes that will be available for players and AI at the class selection carousel screen.
myTeamConfig = {
    rep = {
        team = REP,
        units = 32,
        reinforcements = -1,
        pilot = { "rep_inf_ep3_pilot",32},
    },
    cis = {
        team = CIS,
        units = 32,
        reinforcements = -1,
        pilot = { "cis_inf_pilot",32},
    }
}

-- This function actually changes the pool allocations for Command flyers (none in CTF mode) and adds 1 for FlagItem because that 
-- will allow the Flag to spawn. You can further change the values for other memory allocations if you need/want to.
function myScriptInit()
    SetMemoryPoolSize("FlagItem", 1)
    SetMemoryPoolSize("CommandFlyer", 0)
end

-- Here is where the meat of the lua is, read on.
---------------------------------------------------------------------------
-- FUNCTION: ScriptPostLoad
-- PURPOSE: This function is only run once
-- INPUT:
-- OUTPUT:
-- NOTES: The name, 'ScriptPostLoad' is a chosen convention, and each
-- mission script must contain a version of this function, as
-- it is called from C to start the mission.
---------------------------------------------------------------------------
-- SetupTurrets calls back to the common lua to allow you to have auto-turrets setup in CTF mode.
function ScriptPostLoad()
    SetupTurrets()
    -- As the comment states, this is the actual CTF info. In plain terms you can see where the team names (ALL,CIS,IMP,REP) need to be to setup the two sides on the map. I'm going to highlight in light blue where information needs to be changed. I'll explain the rest after you look over the script with individual highlights.
    --This is all the actual ctf objective setup
    ctf = ObjectiveOneFlagCTF:New{
        teamATT = REP, 
        teamDEF = CIS,
        -- need new text
        textATT = "game.modes.1flag", textDEF = "game.modes.1flag2", flag = "cmn_flag",
        homeRegion = "flaghome", captureRegionATT = "atthome", captureRegionDEF = "defhome",
        capRegionDummyObjectATT = "1flag_rep_marker", capRegionDummyObjectDEF = "1flag_cis_marker",
        multiplayerRules = true, hideCPs = true,
        AIGoalWeight = 0.0,
    }

    SoundEvent_SetupTeams( REP, 'rep', CIS, 'cis' )
    ctf:Start()

    -- In order, here's what things mean.
    --   "cmn_flag" this is the name of the flag object placed in the level
    --   "flaghome" this is the name of the region that the flag initially spawns into and will return to when dropped or captured
    --   "defhome" this is the name of the capture region that the Attacking team needs to take the flag in order to score.
    --   "atthome" this is the name of the capture region that the Defending team needs to take the flag in order to score.
    --   "1flag_rep_marker" This is a dummy object that looks like a big orb with an animated texture on it. It's a visual representation 
    --          of the capture region for the Attacking teams' capture region
    --   "1flag_cis_marker" This is a dummy object that looks like a big orb with an animated texture on it. It's a visual representation 
    --          of the capture region for the Defending teams' capture region
    
    -- The AI goals let AI spawn and gives them a command to fight. Without this, AI won't spawn, so these lines are rather important eh? 
    
    -- get them going?
    AddAIGoal(REP, "Deathmatch", 100)
    AddAIGoal(CIS, "Deathmatch", 100)
end

-- So ends 1 flag.
--
```
Now onto Assault mode. YAY!
```LUA
--
-- Copyright (c) 2005 Pandemic Studios, LLC. All rights reserved.
-- SPAX - Clone Wars Template Assault File
--

ScriptCB_DoFile("setup_teams")

-- We've been here before, it's calling the common file.
ScriptCB_DoFile("@#$c_cmn")

-- These DoFiles call the Space Assault Script as well as the scripts that setup shields and the destroyable objects respectively.
ScriptCB_DoFile("ObjectiveSpaceAssault")
ScriptCB_DoFile("LinkedShields")
ScriptCB_DoFile("LinkedDestroyables")

-- myGameMode, as stated before, calls out the proper mrq reference for the gamemode this lua sets up.
myGameMode = "@#$_CW-Assault"

function ScriptPostLoad()
    -- Run the functions below to properly setup the Space Assault objectives
    SetupObjectives()
    SetupShields()
    SetupDestroyables()
    SetupTurrets()

    -- Remember, these two lines get the AI spawning, shucking and jiving.
    AddAIGoal(REP, "Deathmatch", 100)
    AddAIGoal(CIS, "Deathmatch", 100)

    -- This disables the Small Minimap in this mode. You'll notice that Space Assault maps don't have a small mini map.
    DisableSmallMapMiniMap()
end

-- Fun stuff, as before, I'll highlight things in you need to change in light blue!
function SetupObjectives()
    assault = ObjectiveSpaceAssault:New{
        teamATT = REP, 
        teamDEF = CIS,
        multiplayerRules = true
    }

    -- this list of targets represents the critical systems on a star ship. Rep targets are targets that the CIS will 
    -- aim to destroy. CIS targets are what Rep units will aim to destroy. Imp targets for Alliance, and All for Imperials. Simple no?

    -- Seriously, the first table you see is a list of repTargets, all of the blue highlights are objects on the CIS cruiser as well as the cis frigate that become objectives in a space Assault game.
    local repTargets = {
        engines = { "cis_drive_1", "cis_drive_2" },
        lifesupport = "cis-life-ext",
        bridge = "cis-bridge",
        comm = "cis-comms",
        sensors = "cis-sensors",
        frigates = "cis-frigate",
        internalSys = { "cis-life-int", "cis-engines" },
    }
    local cisTargets = {
        engines = "rep_drive_1",
        lifesupport = "rep-life-ext",
        bridge = "rep-bridge",
        comm = "rep-comms",
        sensors = "rep-sensors",
        frigates = "rep-frigate",
        internalSys = { "rep-life-int", "rep-engines" },
    }
    assault:SetupAllCriticalSystems( "rep", repTargets, true )
    assault:SetupAllCriticalSystems( "cis", cisTargets, false )
    assault:Start()
end

-- The fancy green is a list of objects that will be protected by the shield generator on the cruiser. If you want to mess around 
-- with what objects can be shielded, keep in mind that the shield impact effect will play when that surface is shot. That means 
-- that if you add in the interior hangar for a star ship then fire at the inside of the hangar, you'll get huge shield impact 
-- effects that can look… a little strange. 

function SetupShields()
    -- CIS Shielded objects
    local linkedShieldObjectsCIS = { "cis_ship_1", "cis_ship_2", "cis_ship_3", "cis_ship_4", "cis-bridge", "cis-comms", "cis-life-ext", "cis-sensors", "cis_drive_1", "cis_drive_2"}
    
    -- cis-shield down there is the controlling object for the shield. It's the actual object that player will destroy to bring down the shields.
    shieldStuffCIS = LinkedShields:New{objs = linkedShieldObjectsCIS, controllerObject = "cis-shield"}
    shieldStuffCIS:Init()

    -- Much like the audio and text calls from the common lua, these will send out the appropriate alerts for the shields status.

    function shieldStuffCIS:OnAllShieldsDown()
        ShowMessageText("level.spa.hangar.shields.atk.down", REP)
        ShowMessageText("level.spa.hangar.shields.def.down", CIS)
        BroadcastVoiceOver( "ROSMP_obj_16", REP )
        BroadcastVoiceOver( "COSMP_obj_17", CIS )
    end

    function shieldStuffCIS:OnAllShieldsUp()
        ShowMessageText("level.spa.hangar.shields.atk.up", REP)
        ShowMessageText("level.spa.hangar.shields.def.up", CIS)
        BroadcastVoiceOver( "ROSMP_obj_18", REP )
        BroadcastVoiceOver( "COSMP_obj_19", CIS )
    end

    -- Same as for the CIS shielded objects, except that they are for the REP side.
    -- REP Shielded objects
    local linkedShieldObjectsREP = { "rep_ship_1", "rep_ship_2", "rep_ship_3", "rep_ship_4", "rep-bridge", "rep-comms", "rep-life-ext", "rep-sensors","rep_drive_1"}
    shieldStuffREP = LinkedShields:New{objs = linkedShieldObjectsREP, controllerObject = "rep-shield"}
    shieldStuffREP:Init()

    function shieldStuffREP:OnAllShieldsDown()
        ShowMessageText("level.spa.hangar.shields.atk.down", CIS)
        ShowMessageText("level.spa.hangar.shields.def.down", REP)
        BroadcastVoiceOver( "ROSMP_obj_17", REP )
        BroadcastVoiceOver( "COSMP_obj_16", CIS )
    end

    function shieldStuffREP:OnAllShieldsUp()
        ShowMessageText("level.spa.hangar.shields.atk.up", CIS)
        ShowMessageText("level.spa.hangar.shields.def.up", REP)
        BroadcastVoiceOver( "ROSMP_obj_19", REP )
        BroadcastVoiceOver( "COSMP_obj_18", CIS )
    end

end

-- SetupDestroyables sets up the links between internal destructible objects and their external counterparts. Keep in mind that it doesn't matter what order the objects go in, just keep them separated between internal and external. This is especially important for star ships with multiple engines.

function SetupDestroyables()
    --CIS destroyables
    lifeSupportLinkageCIS = LinkedDestroyables:New{ objectSets = {{"cis-life-int"}, {"cis-life-ext"}} }
    lifeSupportLinkageCIS:Init()

    engineLinkageCIS = LinkedDestroyables:New{ objectSets = {{"cis_drive_1", "cis_drive_2"}, {"cis-engines"}} }
    engineLinkageCIS:Init()

    --REP destroyables
    lifeSupportLinkageREP = LinkedDestroyables:New{ objectSets = {{"rep-life-int"}, {"rep-life-ext"}} }
    lifeSupportLinkageREP:Init()

    engineLinkageREP = LinkedDestroyables:New{ objectSets = {{"rep_drive_1"}, {"rep-engines"}} }
    engineLinkageREP:Init()
end
```
