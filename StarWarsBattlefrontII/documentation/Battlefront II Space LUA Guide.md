**Battlefront II Space LUA Guide**

Space Scripting

The following three lua examples will walk you through the basics of lua editing and setup for Battlefront II space levels.

To begin, I&#39;ll note that most of the general lua stuff is covered in previous docs, so this will ONLY cover items that are space specific.

The following file is found the Template folder and is @#$c\_cmn. This is a common (cmn) lua file that is referenced by the game mode files to ease the clutter that can (and will) build up in a lua file. Parts of the lua have been removed to only focus on what you need to learn for space.

\&gt;\&gt; LinkedTurrets is a lua file that handles the turret mainframe functionality of Space levels. Technically, you could use this on any kind of map to allow one central object control a number of turrets.

ScriptCB\_DoFile(&quot;LinkedTurrets&quot;)

function SetupTurrets()

--CIS turrets

\&gt;\&gt; turretLinkageCIS is an array of turrets as well as their controlling device. For the script portion below, &quot;cis-defense&quot; is the controlling device, and &quot;cis\_turr\_1-6&quot; are the individual turrets

turretLinkageCIS = LinkedTurrets:New{ team = CIS, mainframe = &quot;cis-defense&quot;,

turrets = {&quot;cis\_turr\_1&quot;, &quot;cis\_turr\_2&quot;, &quot;cis\_turr\_3&quot;, &quot;cis\_turr\_4&quot;, &quot;cis\_turr\_5&quot;, &quot;cis\_turr\_6&quot;} }

turretLinkageCIS:Init()

\&gt;\&gt; function turretLinkageCIS:OnDisableMainframe() sets up the localized text for the action of disabling (destroying) the mainframe

\&gt;\&gt; ShowMessageText(&quot;level.spa.hangar.mainframe.atk.down&quot;, REP)

This line will reference the line found within &quot;level.spa.hangar.mainframe.atk.down&quot; and display it for the REP side when the mainframe is disabled.

\&gt;\&gt;BroadcastVoiceOver( &quot;ROSMP\_obj\_20&quot;, REP )

This line will look for the sound call &quot;ROSMP\_obj\_20&quot; and play it for the REP side when the mainframe is disabled.

function turretLinkageCIS:OnDisableMainframe()

ShowMessageText(&quot;level.spa.hangar.mainframe.atk.down&quot;, REP)

ShowMessageText(&quot;level.spa.hangar.mainframe.def.down&quot;, CIS)

BroadcastVoiceOver( &quot;ROSMP\_obj\_20&quot;, REP )

BroadcastVoiceOver( &quot;COSMP\_obj\_21&quot;, CIS )

end

\&gt;\&gt; Similar to the above scripting, the lines below perform text and sound duties when the mainframe is enables (repaired). This will not play the status of the mainframe when the map starts, only when the mainframe is repaired.

function turretLinkageCIS:OnEnableMainframe()

ShowMessageText(&quot;level.spa.hangar.mainframe.atk.up&quot;, REP)

ShowMessageText(&quot;level.spa.hangar.mainframe.def.up&quot;, CIS)

BroadcastVoiceOver( &quot;ROSMP\_obj\_22&quot;, REP )

BroadcastVoiceOver( &quot;COSMP\_obj\_23&quot;, CIS )

end

\&gt;\&gt;SetWorldExtents and ScriptPreInit go hand in hand. When building a Space level, you may notice that when you exit your ship you instantly die. You also might find that running around certain parts of your ship you will die without taking damage. That&#39;s what SetWorldExtents is for. If you have this set to 2500, but you&#39;re still finding that the world is killing you (and you&#39;re not walking into a death region) then bump it up to enlarge the soldier based playable space.

function ScriptPreInit()

SetWorldExtents(2500)

end

\&gt;\&gt;Ahh flyheights. These are easy. These values control how far from the center of the world the player can fly up or down. These are used on ground based maps to limit the jet classes and jedi, but is also used to keep flyers from getting too high or too far below the space battlefield. To find an appropriate height, use PrintPlayerPos in the console, fly to your desired max/min height, and punch those numbers in. It&#39;s best to keep the Max/MinFlyHeight and the Max/MinPlayerFlyHeight in line with each other to avoid AI doing things that players can&#39;t.

SetMinFlyHeight(-1800)

SetMaxFlyHeight(1800)

SetMinPlayerFlyHeight(-1800)

SetMaxPlayerFlyHeight(1800)

\&gt;\&gt;Notify Radius is the distance around a waiting craft from which AI can be lured in.

SetAIVehicleNotifyRadius(100)

\&gt;\&gt; SetupTeams has been explained before, but I wanted to point out that myTeamConfig is found in both cmn.lua files and the 1flag.lua files because while cmn.lua files actually setup the teams for all modes that call that lua, sometimes you need a mode that has a different loadout of units. For example, Space Marines aren&#39;t needed for CTF, so they aren&#39;t called in myTeamConfig in the 1flag.luas.

SetupUnits()

SetupTeams(myTeamConfig)

\&gt;\&gt; In the level stats section of your lua, remember to allocate memory for as many flyers as you&#39;ll need, as well as Command Flyers.

-- Level Stats

SetMemoryPoolSize(&quot;EntityFlyer&quot;, 36)

SetMemoryPoolSize(&quot;CommandFlyer&quot;, 2)

\&gt;\&gt; As the comment states, myScriptInit is for custom pool allocations for a specific mode or custom loading of assets or teams.

-- do any pool allocations, custom loading here

if myScriptInit then

myScriptInit()

myScriptInit = nil

end

\&gt;\&gt;ReadDataFile regarding sky files: Most of this work has been done by the development team for the actual shipped product, so you have less to worry about unless you make your own skydome and such. All you have to do is replace &quot;tat&quot; with the three letters that correspond to the planet you want the battle to take place over. &quot;cor&quot; for Coruscant, &quot;hot&quot; for Hoth, etc.

ReadDataFile(&quot;SPA\\spa\_sky.lvl&quot;, &quot;tat&quot;)

\&gt;\&gt;ReadDataFile regarding gamemodes and your levels&#39; lvl file: myGameMode corresponds to the gamemode inside of your gamemodes&#39; lua. For example, this finds the line in the 1flag lua that reads &quot;myGameMode = &quot;@#$\_CW-CTF&quot;&quot; and adds the &quot;@#$\_CW-CTF&quot; portion in place of &quot;myGameMode&quot; in the cmn script.

ReadDataFile(&quot;SPA\\@#$.lvl&quot;, myGameMode)

\&gt;\&gt;This line is needed for particles in space to work properly, don&#39;t delete it!

SetParticleLODBias(15000)

\&gt;\&gt;AddDeathRegion(&quot;deathregion3&quot;) the name of the deathregion is placed where &quot;deathregion3&quot; is in this line. Sounds obvious, I know, but keep this in mind because if you don&#39;t add the death region, it won&#39;t be active in your level.

AddDeathRegion(&quot;deathregion3&quot;)

\&gt;\&gt;AddLandingRegion works like adding a death region. These regions will restrict the landing capabilities for all flyers in your level to be within the specified region. If no landing region is defined, players will be able to land and then takeoff from anywhere in the map.

AddLandingRegion(&quot;rep-CP1Con&quot;)

\&gt;\&gt;End of the script!

end

--

This completes the documentation of a common space script. Now we&#39;ll take a look at 1 Flag CTF and Assault maps. I won&#39;t be covering these scripts in their entirety, since they have their common items inside the common script.

1 Flag Space CTF

--

-- Copyright (c) 2005 Pandemic Studios, LLC. All rights reserved.

-- SPAX - Clone Wars Template CTF File

--

\&gt;\&gt; The ScriptCB\_DoFile(&quot;ObjectiveOneFlagCTF &quot;) calls the 1flag CTF lua that hopefully you&#39;ve read about in a separate doc. Don&#39;t worry about what&#39;s in that lua, just know that it&#39;s a crucial item for you to have here.  As for the other ScriptCB\_DoFile(&quot;@#$c\_cmn&quot;) This line calls to our common lua that we just went over.

ScriptCB\_DoFile(&quot;ObjectiveOneFlagCTF&quot;)

ScriptCB\_DoFile(&quot;@#$c\_cmn&quot;)

\&gt;\&gt;myGameMode, as stated before, calls out the proper mrq reference for the gamemode this lua sets up.

myGameMode = &quot;@#$\_CW-CTF&quot;

\&gt;\&gt; This function sets up the units for your map. This is also found in the cmn file, but you can setup a different loadout for this game mode if you wanted to.

function SetupUnits()

ReadDataFile(&quot;SIDE\\rep.lvl&quot;,

&quot;rep\_inf\_ep3\_pilot&quot;,

&quot;rep\_fly\_assault\_dome&quot;,

&quot;rep\_fly\_anakinstarfighter\_sc&quot;,

&quot;rep\_fly\_arc170fighter\_sc&quot;,

&quot;rep\_veh\_remote\_terminal&quot;,

&quot;rep\_fly\_vwing&quot;)

ReadDataFile(&quot;SIDE\\cis.lvl&quot;,

&quot;cis\_inf\_pilot&quot;,

&quot;cis\_fly\_fedlander\_dome&quot;,

&quot;cis\_fly\_droidfighter\_sc&quot;,

&quot;cis\_fly\_greviousfighter&quot;,

&quot;cis\_fly\_tridroidfighter&quot;)

ReadDataFile(&quot;SIDE\\tur.lvl&quot;,

&quot;tur\_bldg\_spa\_cis\_beam&quot;,

&quot;tur\_bldg\_spa\_cis\_chaingun&quot;,

&quot;tur\_bldg\_spa\_rep\_beam&quot;,

&quot;tur\_bldg\_spa\_rep\_chaingun&quot;,

&quot;tur\_bldg\_chaingun\_roof&quot;,

&quot;tur\_bldg\_spa\_cis\_recoilless&quot;

)

end

\&gt;\&gt;myTeamConfig sets up the actual classes that will be available for players and AI at the class selection carousel screen.

myTeamConfig = {

rep = {

team = REP,

units = 32,

reinforcements = -1,

pilot = { &quot;rep\_inf\_ep3\_pilot&quot;,32},

},

cis = {

team = CIS,

units = 32,

reinforcements = -1,

pilot = { &quot;cis\_inf\_pilot&quot;,32},

}

}

\&gt;\&gt; This function actually changes the pool allocations for Command flyers (none in CTF mode) and adds 1 for FlagItem because that will allow the Flag to spawn. You can further change the values for other memory allocations if you need/want to.

function myScriptInit()

SetMemoryPoolSize(&quot;FlagItem&quot;, 1)

SetMemoryPoolSize(&quot;CommandFlyer&quot;, 0)

end

\&gt;\&gt;Here is where the meat of the lua is, read on.

---------------------------------------------------------------------------

-- FUNCTION: ScriptPostLoad

-- PURPOSE: This function is only run once

-- INPUT:

-- OUTPUT:

-- NOTES: The name, &#39;ScriptPostLoad&#39; is a chosen convention, and each

-- mission script must contain a version of this function, as

-- it is called from C to start the mission.

---------------------------------------------------------------------------

\&gt;\&gt; SetupTurrets calls back to the common lua to allow you to have auto-turrets setup in CTF mode.

function ScriptPostLoad()

SetupTurrets()

\&gt;\&gt; As the comment states, this is the actual CTF info. In plain terms you can see where the team names (ALL,CIS,IMP,REP) need to be to setup the two sides on the map. I&#39;m going to highlight in light blue where information needs to be changed. I&#39;ll explain the rest after you look over the script with individual highlights.

--This is all the actual ctf objective setup

ctf = ObjectiveOneFlagCTF:New{

teamATT = REP, teamDEF = CIS,

-- need new text

textATT = &quot;game.modes.1flag&quot;, textDEF = &quot;game.modes.1flag2&quot;, flag = &quot;cmn\_flag&quot;,

homeRegion = &quot;flaghome&quot;, captureRegionATT = &quot;atthome&quot;, captureRegionDEF = &quot;defhome&quot;,

capRegionDummyObjectATT = &quot;1flag\_rep\_marker&quot;, capRegionDummyObjectDEF = &quot;1flag\_cis\_marker&quot;,

multiplayerRules = true, hideCPs = true,

AIGoalWeight = 0.0,

}

SoundEvent\_SetupTeams( REP, &#39;rep&#39;, CIS, &#39;cis&#39; )

ctf:Start()

\&gt;\&gt; In order, here&#39;s what things mean.

&quot;cmn\_flag&quot; this is the name of the flag object placed in the level

&quot;flaghome&quot; this is the name of the region that the flag initially spawns into and will return to when dropped or captured

&quot;defhome&quot; this is the name of the capture region that the Attacking team needs to take the flag in order to score.

&quot;atthome&quot; this is the name of the capture region that the Defending team needs to take the flag in order to score.

&quot;1flag\_rep\_marker&quot; This is a dummy object that looks like a big orb with an animated texture on it. It&#39;s a visual representation of the capture region for the Attacking teams&#39; capture region

&quot;1flag\_cis\_marker&quot; This is a dummy object that looks like a big orb with an animated texture on it. It&#39;s a visual representation of the capture region for the Defending teams&#39; capture region

\&gt;\&gt; The AI goals let AI spawn and gives them a command to fight. Without this, AI won&#39;t spawn, so these lines are rather important eh? 

-- get them going?

AddAIGoal(REP, &quot;Deathmatch&quot;, 100)

AddAIGoal(CIS, &quot;Deathmatch&quot;, 100)

end

\&gt;\&gt; So ends 1 flag.

--

Now onto Assault mode. YAY!

--

-- Copyright (c) 2005 Pandemic Studios, LLC. All rights reserved.

-- SPAX - Clone Wars Template Assault File

--

ScriptCB\_DoFile(&quot;setup\_teams&quot;)

\&gt;\&gt; We&#39;ve been here before, it&#39;s calling the common file.

ScriptCB\_DoFile(&quot;@#$c\_cmn&quot;)

\&gt;\&gt;These DoFiles call the Space Assault Script as well as the scripts that setup shields and the destroyable objects respectively.

ScriptCB\_DoFile(&quot;ObjectiveSpaceAssault&quot;)

ScriptCB\_DoFile(&quot;LinkedShields&quot;)

ScriptCB\_DoFile(&quot;LinkedDestroyables&quot;)

\&gt;\&gt;myGameMode, as stated before, calls out the proper mrq reference for the gamemode this lua sets up.

myGameMode = &quot;@#$\_CW-Assault&quot;

function ScriptPostLoad()

\&gt;\&gt; Run the functions below to properly setup the Space Assault objectives

SetupObjectives()

SetupShields()

SetupDestroyables()

SetupTurrets()

\&gt;\&gt; Remember, these two lines get the AI spawning, shucking and jiving.

AddAIGoal(REP, &quot;Deathmatch&quot;, 100)

AddAIGoal(CIS, &quot;Deathmatch&quot;, 100)

\&gt;\&gt;This disables the Small Minimap in this mode. You&#39;ll notice that Space Assault maps don&#39;t have a small mini map.

DisableSmallMapMiniMap()

end

\&gt;\&gt; Fun stuff, as before, I&#39;ll highlight things in you need to change in light blue!

function SetupObjectives()

assault = ObjectiveSpaceAssault:New{

teamATT = REP, teamDEF = CIS,

multiplayerRules = true

}

\&gt;\&gt; this list of targets represents the critical systems on a star ship. Rep targets are targets that the CIS will aim to destroy. CIS targets are what Rep units will aim to destroy. Imp targets for Alliance, and All for Imperials. Simple no?

Seriously, the first table you see is a list of repTargets, all of the blue highlights are objects on the CIS cruiser as well as the cis frigate that become objectives in a space Assault game.

local repTargets = {

engines = { &quot;cis\_drive\_1&quot;, &quot;cis\_drive\_2&quot; },

lifesupport = &quot;cis-life-ext&quot;,

bridge = &quot;cis-bridge&quot;,

comm = &quot;cis-comms&quot;,

sensors = &quot;cis-sensors&quot;,

frigates = &quot;cis-frigate&quot;,

internalSys = { &quot;cis-life-int&quot;, &quot;cis-engines&quot; },

}

local cisTargets = {

engines = &quot;rep\_drive\_1&quot;,

lifesupport = &quot;rep-life-ext&quot;,

bridge = &quot;rep-bridge&quot;,

comm = &quot;rep-comms&quot;,

sensors = &quot;rep-sensors&quot;,

frigates = &quot;rep-frigate&quot;,

internalSys = { &quot;rep-life-int&quot;, &quot;rep-engines&quot; },

}

assault:SetupAllCriticalSystems( &quot;rep&quot;, repTargets, true )

assault:SetupAllCriticalSystems( &quot;cis&quot;, cisTargets, false )

assault:Start()

end

\&gt;\&gt; The fancy green is a list of objects that will be protected by the shield generator on the cruiser. If you want to mess around with what objects can be shielded, keep in mind that the shield impact effect will play when that surface is shot. That means that if you add in the interior hangar for a star ship then fire at the inside of the hangar, you&#39;ll get huge shield impact effects that can look… a little strange. 

function SetupShields()

-- CIS Shielded objects

local linkedShieldObjectsCIS = { &quot;cis\_ship\_1&quot;, &quot;cis\_ship\_2&quot;, &quot;cis\_ship\_3&quot;, &quot;cis\_ship\_4&quot;, &quot;cis-bridge&quot;, &quot;cis-comms&quot;, &quot;cis-life-ext&quot;, &quot;cis-sensors&quot;, &quot;cis\_drive\_1&quot;, &quot;cis\_drive\_2&quot;}

\&gt;\&gt; cis-shield down there is the controlling object for the shield. It&#39;s the actual object that player will destroy to bring down the shields.

shieldStuffCIS = LinkedShields:New{objs = linkedShieldObjectsCIS, controllerObject = &quot;cis-shield&quot;}

shieldStuffCIS:Init()

\&gt;\&gt; Much like the audio and text calls from the common lua, these will send out the appropriate alerts for the shields status.

function shieldStuffCIS:OnAllShieldsDown()

ShowMessageText(&quot;level.spa.hangar.shields.atk.down&quot;, REP)

ShowMessageText(&quot;level.spa.hangar.shields.def.down&quot;, CIS)

BroadcastVoiceOver( &quot;ROSMP\_obj\_16&quot;, REP )

BroadcastVoiceOver( &quot;COSMP\_obj\_17&quot;, CIS )

end

function shieldStuffCIS:OnAllShieldsUp()

ShowMessageText(&quot;level.spa.hangar.shields.atk.up&quot;, REP)

ShowMessageText(&quot;level.spa.hangar.shields.def.up&quot;, CIS)

BroadcastVoiceOver( &quot;ROSMP\_obj\_18&quot;, REP )

BroadcastVoiceOver( &quot;COSMP\_obj\_19&quot;, CIS )

end

\&gt;\&gt; Same as for the CIS shielded objects, except that they are for the REP side.

-- REP Shielded objects

local linkedShieldObjectsREP = { &quot;rep\_ship\_1&quot;, &quot;rep\_ship\_2&quot;, &quot;rep\_ship\_3&quot;, &quot;rep\_ship\_4&quot;, &quot;rep-bridge&quot;, &quot;rep-comms&quot;, &quot;rep-life-ext&quot;, &quot;rep-sensors&quot;,&quot;rep\_drive\_1&quot;}

shieldStuffREP = LinkedShields:New{objs = linkedShieldObjectsREP, controllerObject = &quot;rep-shield&quot;}

shieldStuffREP:Init()

function shieldStuffREP:OnAllShieldsDown()

ShowMessageText(&quot;level.spa.hangar.shields.atk.down&quot;, CIS)

ShowMessageText(&quot;level.spa.hangar.shields.def.down&quot;, REP)

BroadcastVoiceOver( &quot;ROSMP\_obj\_17&quot;, REP )

BroadcastVoiceOver( &quot;COSMP\_obj\_16&quot;, CIS )

end

function shieldStuffREP:OnAllShieldsUp()

ShowMessageText(&quot;level.spa.hangar.shields.atk.up&quot;, CIS)

ShowMessageText(&quot;level.spa.hangar.shields.def.up&quot;, REP)

BroadcastVoiceOver( &quot;ROSMP\_obj\_19&quot;, REP )

BroadcastVoiceOver( &quot;COSMP\_obj\_18&quot;, CIS )

end

end

\&gt;\&gt; SetupDestroyables sets up the links between internal destructible objects and their external counterparts. Keep in mind that it doesn&#39;t matter what order the objects go in, just keep them separated between internal and external. This is especially important for star ships with multiple engines.

function SetupDestroyables()

--CIS destroyables

lifeSupportLinkageCIS = LinkedDestroyables:New{ objectSets = {{&quot;cis-life-int&quot;}, {&quot;cis-life-ext&quot;}} }

lifeSupportLinkageCIS:Init()

engineLinkageCIS = LinkedDestroyables:New{ objectSets = {{&quot;cis\_drive\_1&quot;, &quot;cis\_drive\_2&quot;}, {&quot;cis-engines&quot;}} }

engineLinkageCIS:Init()

--REP destroyables

lifeSupportLinkageREP = LinkedDestroyables:New{ objectSets = {{&quot;rep-life-int&quot;}, {&quot;rep-life-ext&quot;}} }

lifeSupportLinkageREP:Init()

engineLinkageREP = LinkedDestroyables:New{ objectSets = {{&quot;rep\_drive\_1&quot;}, {&quot;rep-engines&quot;}} }

engineLinkageREP:Init()

end