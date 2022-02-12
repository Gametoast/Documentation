**SCRIPTING**

# Architecture

ScriptPreInit, ScriptInit, and ScriptPostLoad are the only scripting functions that the application will call for you automatically, during mission load. Events drive any other script logic that takes place during the mission, in the form of Callbacks. The application will _not_ call any sort of Update function every frame.

## Events

An Event is any important action that occurs during the game, usually when something significantly changes state. Associated with this Event are the Actor, the Context, and a number of Callbacks.

### Actor

The Actor is the instance that triggered the Event.

### Context

The Context is any other information relevant to the Event, often the other party involved in the Event. Some Events have no Context.

### Callback

A Callback is a function that the Event Manager calls in response to an Event. Its first parameter is the Actor, and its second is the Context, if any. An Event may have any number of Callbacks associated with it.

### Instance

Some Events only make sense for a specific instance of an Actor, and require an additional parameter to specify which instance.

## Filters

By default, the Event calls all registered Callbacks any time an Actor triggers it. However, a Callback may only care about Events that match some sort of condition (team, name, or whatever). While the Callback itself could reject Events that it does not care about, the script should let the Event apply a Filter to avoid calling the Callback in the first place.

## Scripting In Action

### Registering an Event Callback

To register a function as a Callback, the script calls one of the Event registration functions. These functions all have names that start with &quot;On&quot; followed by the name of the Event, and optionally by the name of a Filter:

- &quot; **On&quot; + Event Name**
- &quot; **On&quot; + Event Name + Filter Name**

For example, the registration function for the Command Post Event &quot;BeginCapture&quot; and the Command Post Filter &quot;Team&quot; has the name &quot;OnBeginCaptureTeam&quot;.

The Event part of the registration function expects a Lua function to call, whether by reference or inline definition. If the Event is instance-specific, it also expects an additional parameter to specify which instance.

The Filter part of the registration function expects a data parameter specific to that Filter. The Filter definitions below describe what parameters the Filter requires.

For the previous example, the call would look like this:

OnFinishCaptureTeam(CaptureTeam1, 1)

The FinishCapture Event receives the parameter CaptureTeam1, while the Team Filter receives the parameter 1. After this registration, the Event Manager will then call the function CaptureTeam1 whenever Team 1 captures a Command Post.

Alternatively, the Lua function can appear inline:

OnFinishCaptureTeam(function (post) ... end, 1)

Lua treats functions just like numbers, strings, tables, or any other data type. You can define them anywhere, assign them to variables, pass them as parameters, or return them from functions. In fact, defining a function remembers the values of all local variables in its environment, creating a &quot;closure&quot; or &quot;function object&quot;; this is a very useful and powerful language feature.

### Inside an Event Callback

When an Actor triggers an Event, the Event calls every associated Callback that passes the Filter. The Event always passes the Actor as the first parameter to the Callback. It passes related Context (if any) as the second parameter. The Callback may perform any action it wants before it returns.

# Character

## Events

### CharacterDeath: function (player, killer)

This event occurs whenever a character (human or AI) dies.

### CharacterSpawn: function (player)

This event occurs whenever a character (human or AI) spawns.

### CharacterDispensePowerup: function (player, powerup)

This event occurs whenever a character drops a health/ammo pickup

### CharacterDispenseControllable: function (player, controllable)

This event occurs whenever a character drops a controllable item (such as a remote droid or a mini-turret). If you want to check exactly what kind of controllable was dropped, use GetEntityClassName(controllable).

### CharacterLandedFlyer: function (player, flyer)

This event occurs whenever a character lands a flyer. If you wanted to check if the player landed within a region, use IsCharacterInRegion(player, &quot;regionName&quot;). If you want to check if the flyer matches a particular type of flyer, use this:

if GetEntityClass(flyer) == FindEntityClass(&quot;flyerClassName&quot;) then

\&lt;blah blah insert code here\&gt;

end

### CharacterEnterVehicle: function (player, vehicle)

This event occurs whenever a character enters a vehicle. It also works for turrets!

### CharacterChangeClass: function (player)

This event occurs whenever the player presses the OK button in the spawn display. It is not intended to be a robust thing that can be used in either multiplayer or to check when the AI change classes. If you need to get the player&#39;s class, use GetCharacterClass(player), which will return a class index. If you need the class name, you can use GetEntityClassName(GetCharacterUnit(player))

### CharacterIssueAICommand: function (player, command\_id)

This event occurs whenever a player issues a command to the AI. The command ID that is passed in must be translated into a string by calling TranslateAICommand(command\_id). This function will return one of the following strings:

&quot;getintovehicle&quot;

&quot;getoutofvehicle&quot;

&quot;waitforpickup&quot;

&quot;followchr&quot;

&quot;stopfollowchr&quot;

## Filters

### Name: name

This Filter matches any Character with the specified name.

### Team: team

This Filter matches any Character on the specified team.

### Class: config

This Filter matches any Character with the specified config.

# Command Post

## Properties

### Name

This property is the name of the Command Post, and should be unique.

### Team

This property is the team that currently owns the Command Post. The Command Post will not be neutral (team 0) at the time it triggers a Capture or Neutralize Event, even though it will be neutral before (Capture) or after (Neutralize).

### Value

This property is the number of points the Command Post contributes to its owner. Neutral Command Posts contribute one point to every team instead.

### Instance Properties

Any instance property defined in an Object Definition File or in the World File also applies from the Script.

Label

Description

CaptureRegion

ControlRegion

KillRegion

SpawnPath

AllyPath

AllyCount

Radius

VO\_All\_AllCapture

VO\_All\_AllLost

VO\_All\_AllInDispute

VO\_All\_AllSaved

VO\_All\_AllInfo

VO\_All\_ImpCapture

VO\_All\_ImpLost

VO\_All\_ImpInDispute

VO\_All\_ImpSaved

VO\_All\_ImpInfo

VO\_Imp\_AllCapture

VO\_Imp\_AllLost

VO\_Imp\_AllInDispute

VO\_Imp\_AllSaved

VO\_Imp\_AllInfo

VO\_Imp\_ImpCapture

VO\_Imp\_ImpLost

VO\_Imp\_ImpInDispute

VO\_Imp\_ImpSaved

VO\_Imp\_ImpInfo

VO\_Rep\_RepCapture

VO\_Rep\_RepLost

VO\_Rep\_RepInDispute

VO\_Rep\_RepSaved

VO\_Rep\_RepInfo

VO\_Rep\_CISCapture

VO\_Rep\_CISLost

VO\_Rep\_CISInDispute

VO\_Rep\_CISSaved

VO\_Rep\_CISInfo

VO\_CIS\_RepCapture

VO\_CIS\_RepLost

VO\_CIS\_RepInDispute

VO\_CIS\_RepSaved

VO\_CIS\_RepInfo

VO\_CIS\_CISCapture

VO\_CIS\_CISLost

VO\_CIS\_CISInDispute

VO\_CIS\_CISSaved

VO\_CIS\_CISInfo

ValueBleed

Value\_ATK\_Alliance

Value\_ATK\_CIS

Value\_ATK\_Empire

Value\_ATK\_Republic

Value\_ATK\_Locals

Value\_DEF\_Alliance

Value\_DEF\_CIS

Value\_DEF\_Empire

Value\_DEF\_Republic

Value\_DEF\_Locals

SoldierBan

HoverBan

SmallBan

MediumBan

HugeBan

FlyerBan

## Events

### BeginNeutralize: function (post, holding)

**Actor: post**

**Context: holding (table of characters)**

**Instance: N/A**

This Event occurs when an enemy unit begins neutralizing a Command Post.

### AbortNeutralize: function (post, holding)

**Actor: post**

**Context: holding (table of characters)**

**Instance: N/A**

This Event occurs when an enemy unit stops neutralizing a Command Post.

### FinishNeutralize: function (post, holding)

**Actor: post**

**Context: holding (table of characters)**

**Instance: N/A**

This Event occurs when an enemy unit finishes neutralizing a Command Post.

### BeginCapture: function (post, holding)

**Actor: post**

**Context: holding (table of characters)**

**Instance: N/A**

This Event occurs when a unit begins capturing a neutral Command Post.

### AbortCapture: function (post, holding)

**Actor: post**

**Context: holding (table of characters)**

**Instance: N/A**

This Event occurs when a unit stops capturing a neutral Command Post.

### FinishCapture: function (post, holding)

**Actor: post**

**Context: holding (table of characters)**

**Instance: N/A**

This Event occurs when a unit finishes capturing a neutral Command Post.

### CommandPostKill: function (post, killer)

**Actor: post**

**Context: killer (character)**

**Instance: N/A**

This Event occurs when a Command Post dies.

### CommandPostRespawn: function (post)

**Actor: post**

**Context: none**

**Instance: N/A**

This Event occurs when a Command Post spawns or respawns

## Filters

### Name: name

This Filter matches any Command Cost matching the specified name.

### Team: team

This Filter matches any Command Post matching the specified team.

## Functions

### GetCommandPostTeam(name or post) → team

This function returns the team number of the specified Command Post.

### GetCommandPostBleedValue (name or post, team) → value

This function returns the point value of the specified Command Post, relative to a particular team (each faction can now have a different valuation of each post)

# Flag

## Events

### FlagPickUp: function (flag, character)

**Actor: flag**

**Context: character**

**Instance: N/A**

This Event occurs when a character picks up a Flag.

### FlagDrop: function (flag, character)

**Actor: flag**

**Context: character**

**Instance: N/A**

This Event occurs when a character drops a Flag.

### FlagReturn: function (flag, character)

**Actor: flag**

**Context: character**

**Instance: N/A**

This Event occurs when a character returns an allied Flag.

### FlagCapture: function (flag, character)

**Actor: flag**

**Context: character**

**Instance: N/A**

This Event occurs when a character captures a neutral or enemy Flag.

## Filters

### Name: name

This Filter matches any Character with the specified name.

### Team: team

This Filter matches any Character on the specified team.

### Class: config

This Filter matches any Character with the specified config.

## Functions

### KillObject (name or flag)

This function sends the Flag back to its starting location.

# Object

## Properties

### Name

This property is the name of the Object, and should be unique.

### Class

This property is the config (ODF) name of the Object.

### Instance Properties

GameObject:

Team

PerceivedTeam

CurHealth

MaxHealth

AddHealth

CurShield

MaxShield

AddShield

PhysicsActive

Door:

OpenTrigger

OpenRatio

RemoteTerminal:

RemoteGameObject

NextLinkedTerminal

PrevLinkedTerminal

PowerupStation:

EffectRegion

Radius

VehicleSpawn:

Team

CommandPost

SpawnTime

DecayTime

ClassNeutral

ClassAlliance

ClassAllAtk

ClassAllDef

ClassEmpire

ClassImpAtk

ClassImpDef

ClassRepublic

ClassRepAtk

ClassRepDef

ClassCIS

ClassCISAtk

ClassCISDef

ClassLocals

ClassLocAtk

ClassLocDef

ClassHistorical

ClassHisAtk

ClassHisDef

EntitySound:

Sound

SoundStream

MinDistance

MaxDistance

## Events

### ObjectCreate

**Actor: object**

**Context: none**

**Instance: N/A**

This Event occurs on the creation of an Object, before setting its properties.

### ObjectInit

**Actor: object**

**Context: none**

**Instance: N/A**

This Event occurs on the initialization of an Object, after settings its properties.

### ObjectDamage

**Actor: object**

**Context: damager (character)**

**Instance: N/A**

This Event occurs whenever an Object takes damage.

### ObjectRepair

**Actor: object**

**Context: repairer (character)**

**Instance: N/A**

This event occurs when a character finishes repairing an object. Also conveniently works for checking when a player has built a repair/ammo droid from one of those build pads.

### ObjectHack

**Actor: object**

**Context: hacker (character)**

**Instance: N/A**

This Event occurs whenever a character hacks an object (which is our nomenclature for kicking dudes out of a vehicle with the fusion cutter…makes sense to me)

### ObjectKill

**Actor: object**

**Context: killer (character)**

**Instance: N/A**

This Event occurs when an Object dies.

### ObjectHeadshot

**Actor: object (entity soldier)**

**Context: killer (character)**

**Instance: N/A**

This Event occurs when an Object gets shot in the head

### ObjectRespawn

**Actor: object**

**Context: none**

**Instance: N/A**

This Event occurs when an Object respawns.

### ObjectDelete

**Actor: object**

**Context: none**

**Instance: N/A**

This Event occurs on the deletion of an Object. Do not use the Object after deletion!

### TeamChange

**Actor: object**

**Context: team**

**Instance: N/A**

This Event occurs when an Object changes teams.

### HealthChange

**Actor: object**

**Context: health**

**Instance: N/A**

This Event occurs when the Object&#39;s health changes due to an external event. AddHealth does not trigger this Event.

### ShieldChange

**Actor: object**

**Context: shield**

**Instance: N/A**

This Event occurs when the Object&#39;s shield changes due to an external event. AddShield does not trigger this Event.

## Object Functions

### GetObjectPtr (name) → object

This function returns the Object with the specified name, or nil if none exists.

### ActivateObject (name or object)

This function activates the specified Object, enabling its physics.

SetProperty(…, &quot;PhysicsActive&quot;, 1) does the same thing, but slightly slower and safer.

### DeactivateObject (name object)

This function deactivates the specified Object, disabling its physics.

SetProperty(…, &quot;PhysicsActive&quot;, 0) does the same thing, but slightly slower and safer.

### SetObjectTeam (name or object, team)

This function set the team of the specified Object.

SetProperty(…, &quot;Team&quot;, team) does the same thing, but slightly slower and safer.

### GetObjectTeam (name or object) → team

This function returns the team of the specified Object.

### KillObject (name or object)

This function kills the specified Object.

### RespawnObject (name or object)

This function respawns the specified Object.

## Entity Functions

All Objects are Entities, though not all Entities are Objects (some are Props, for example). These functions will work on _anything_ saved in the World file and given a name, including Objects.

### GetEntityPtr (name) → entity

This function returns the Entity with the specified name, or nil if none exists.

### GetEntityName (name or entity)

This function gets the name of the specified Entity.

### SetProperty (name or entity, property, value)

This function sets the value of an instance property for the specified Entity.

# Region

## Events

### EnterRegion: function (region, character), name or region

**Actor: region**

**Context: character**

**Instance: name or region**

This Event occurs when a Character enters a Region.

### LeaveRegion: function (region, character), name or region

**Actor: region**

**Context: character**

**Instance: name or region**

This Event occurs when a Character leaves a Region.

## Filters

### Name: name

This Filter matches any Character with the specified name.

### Team: team

This Filter matches any Character on the specified team.

### Class: config

This Filter matches any Character with the specified config.

## Functions

### GetRegion (name) → region

This function returns the Region with the specified name

### ActivateRegion (name or region)

This function activates the specified Region, enabling its Events.

### DeactivateRegion (name or region)

This function deactivates the specified Region, disabling its Events.

### RegionName (name or region) → name

This function returns the name of the specified Region.

# Team

## Events

### TicketCountChange: function (team, count)

This event occurs when the reinforcement count changes.

### TicketBleedChange: function (team, bleed)

This event occurs when the bleed rate changes.

## Filters

### Team: team

This filter matches the specified team.

## Functions

### SetTeamName (team, name)

This function sets the name of the specified team. The names &quot;neutral&quot;, &quot;neu&quot;, &quot;alliance&quot;, &quot;all&quot;, &quot;empire&quot;, &quot;imp&quot;, &quot;republic&quot;, &quot;rep&quot;, and &quot;cis&quot; map to pre-defined team identifiers; anything else maps to locals. (Yes, this is not very general.)

### SetTeamIcon (team, icon)

This function sets the icon of the specified team to the specified texture.

### SetTeamAsEnemy (team, other)

This function makes the specified team regard the other team as an enemy. It does not affect how the other team regards the specified team!

### SetTeamAsNeutral (team, other)

This function makes the specified team regard the other team as a neutral. It does not affect how the other team regards the specified team!

### SetTeamAsFriend (team, other)

This function makes the specified team regard the other team as an ally. It does not affect how the other team regards the specified team!

### SetUnitCount (team, count)

This function sets the allowed number of spawned units for the specified team.

### SetReinforcementCount (team, count)

This function sets the current and maximum number of reinforcements for the specified team.

### GetReinforcementCount (team) → count

This function gets the current number of reinforcements for the specified team.

### AddReinforcements (team, add)

This function adds to the current number of reinforcements on the specified team. Specify negative values to deduct reinforcements.

### AddUnitClass (team, config)

This function adds a class to the specified team.

### SetHeroClass (team, config)

This function sets the hero class for the specified team.

### ActivateBonus (team, bonus)

This function activates a bonus for the specified team. Allowed values are &quot;MEDICAL\_SUPPLIES&quot;, &quot;SURPLUS\_SUPPLIES&quot;, &quot;SENSOR\_BOOST&quot;, &quot;HERO&quot;, &quot;RESERVES&quot;, &quot;SABOTAGE&quot;, &quot;SNEAK\_ATTACK&quot;, and &quot;TRAINING&quot;.

### SetBleedRate (team, rate)

This function sets the visible bleed rate for the specified team.

### SetCarrierClass (team, config)

This function sets the carrier vehicle class for the specified team. This vehicle class _must_ have a class label of &quot;carrier&quot;, or derive from one that does. The carrier will carry ground units to vehicle pads.

# Timer

## Properties

### Name

This property is the name of the timer, and should be unique.

### Value

This property is the time remaining on the timer. When it reaches zero, the timer elapses.

### Rate

This property is how fast the timer counts down. The default value is 1.0, representing one unit per second. The timer counts down faster with values above 1.0 and slower with values below 1.0.

## Events

### TimerElapse: function (timer), name or timer

**Actor: timer**

**Context: none**

**Instance: name or timer**

This Event occurs when the timer reaches zero.

## Filters

Timer Events do not provide any Filters, as they are already specific enough.

## Functions

### CreateTimer (name) → timer

This function creates a new Timer with the specified name and returns it.

### DestroyTimer (name or timer)

This function deletes the specified Timer. Do not use the timer after destroying it!

&quot;Why?&quot;

&quot;It would be bad.&quot;

&quot;I&#39;m fuzzy on the whole good/bad thing. What do you mean &#39;bad&#39;?&quot;

&quot;Try to imagine all life as you know it stopping instantaneously and every molecule in your body exploding at the speed of light.&quot;

&quot;Total protonic reversal…&quot;

&quot;Right, that&#39;s bad. Okay, all right, important safety tip. Thanks Egon.&quot;

### StartTimer (name or timer)

This function activates the specified Timer.

### StopTimer (name or timer)

This function deactivates the specified Timer.

### SetTimerValue (name or timer, value)

This function sets the value of the specified Timer.

### GetTimerValue (name or timer) → value

This function returns the value of the specified Timer.

### SetTimerRate (name or timer, rate)

This function sets the rate of the specified Timer.

### GetTimerRate (name or timer) → rate

This function returns the rate of the specified Timer.

### GetTimerName (name or timer) → name

This function returns the name of the specified Timer.

# User

## Events

### \&lt;Event\&gt;: function (actor, context)

**Actor: any Lua type**

**Context: any Lua type**

**Instance: N/A**

This event occurs when the script calls Trigger\&lt;Event\&gt; for a previously created Event type. It supports all Lua types as Actor and Context, including nil, Boolean, light user data, number, string, table, function, user data, and thread.

## Filters

### Match: actor

This filter matches the specified actor.

## Functions

### CreateUserEvent (name)

This function creates a new Event with the specified name. It generates the registration functions On\&lt;Event\&gt; and On\&lt;Event\&gt;Match, as well as Trigger\&lt;Event\&gt;, where \&lt;Event\&gt; is the name specified.

### Trigger\&lt;Event\&gt; (actor, context)

This function triggers the specified Event. It passes the actor and context parameters directly to any Callbacks registered for the event.