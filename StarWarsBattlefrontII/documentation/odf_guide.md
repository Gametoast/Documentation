**Object Definition Files**

Object Definition Files (ODFs) are text files the define the properties of every object in the game. All examples were included with the assets of the levels that shipped with the game. ODF files contain information that defines an object&#39;s presence in the editor as well as in the game.

File Properties
 At the top of every ODF are lines that look like this:

[GameObjectClass]

ClassLabel = &quot;someclasslabel&quot;

GeometryName = &quot;somefilename.msh&quot;

[Properties]

The GAMEOBJECTCLASS section define the properties needed by Zeroedtor to view and manipulate the object.
 CLASSLABEL refers to the object&#39;s functional class. This is for use in the game primarily, but in some cases it is used to expose an object&#39;s properties within the editor.
 GEOMETRYNAME is the mesh file reference that ultimately makes an object visible in the editor.
 PROPERTIES is where the beginning of the in game properties are defined.

In addition to GAMEOBJECTCLASS there are other classes that are defined in ODFs that are not viewed in the editor. These include WEAPONCLASS and EXPLOSIONCLASS. These headers are applied to ODFs that are typically called by other ODFs as child objects. For example a weapon is always attached to a unit, vheciel or building, and anb explosion is always attached to a type of ordnance or an object.

ClassLabels
 There are over 60 ClassLabels attached to objects in the game. A list of these can be found below in the appendix but it should be noted that many of these are redundant.

Appendix

ODF ClassLabels
```
 animatedbuilding
 animatedprop
 armedbuilding
 armedbuildingdynamic
 beacon - obsolete? once used for orbital strike
 beam - ordnance
 binoculars
 bolt - ordnance
 building
 bullet - ordnance
 cannon - weapon
 catapult - obsolete, once used on Endor
 cloudcluster
 commandarmedanimatedbuilding
 commandhover - mobile command post
 commandpost
 commandwalker - mobile command post
 destruct
 destructablebuilding
 detonator - obsolete? Time bomb replaced remote detonator
 disguise - weapon
 dispenser - weapon
 droid
 dusteffect
 emitterordnance
 explosion
 fatray
 flyer - vehicle class
 godray - lighting effect
 grapplinghook
 grapplinghookweapon
 grasspatch
 grenade
 haywire
 hologram
 hover - vehicle class
 launcher - weapon
 leafpatch
 Light
 melee - used for Jedi melee weapons
 mine
 missile
 powerupitem
 prop
 remote
 repair
 rumbleeffect - special, used in Hoth hangar
 shell
 shield
 soldier
 SoundAmbienceStatic - used to display speakers in editor when adding ambient emitters
 SoundAmbienceStreaming - used to display speakers in editor when adding ambient emitters
 sticky
 towcable
 towcableweapon
 trap
 vehiclepad - obsolete, once used for LATTE to drop ATTEs
 vehiclespawn
 walker - vehicle class
 walkerdroid
 water
 weapon
```
**ODF Hierarchy**

We used a hierarchy system in Battlefront II that allowed us to keep commonly used functions within one ODF file. This benefit to this system is that it allowed us to make sweeping changes to everything linked to this one file in one shot.

For instance, every faction&#39;s rocket launcher class weapon was linked to a &quot;parent&quot; rocket launcher. We knew we wanted to keep all of the rocket launcher classes balanced the same, for the most part, so there was no need to change how much damage each rocket would be able to inflict from one faction to another. Rather than giving each of the faction&#39;s ODF files its own unique &quot;MaxDamage&quot; function, we instead placed &quot;MaxDamage&quot; within the parent file. When we decided that rocket launcher classes were doing too little damage, this let us change one file rather than having to update four files. Since the parent was changed, everything that linked to the parent would change as well. As you could imagine, this allowed us to save _a lot_ of time.

So, how do you get this working? Let me run you through an example of how the hierarchy is currently being used.

- Go to your … \data\Sides\imp folder.
- Open up the ODF file: imp\_weap\_inf\_rocket\_launcher\_ord.odf.
- Notice up top, the &quot;ClassParent&quot; – you will find these commonly shared (&quot;com&quot;) files in …\data\Sides\Common
- Open up the ODF file: com\_weap\_inf\_rocket\_launcher\_ord.odf.

Now you&#39;ll have these two ODF files open side by side. Notice that the child file (imp\_weap\_inf\_rocket\_launcher\_ord) only contains the information necessary to distinguish itself from another faction&#39;s rocket ordnance – the trail effect ODF file, the color it displays, and the explosion ODF file it references. The rest of the functions you&#39;ll file in the parent file (com\_weap\_inf\_rocket\_launcher\_ord). All of these functions are shared between the four factions in SWBFII – Republic, CIS, Alliance, Imperial. If you make a change in this file, it will affect every rocket launcher class&#39; ordnance.

Let&#39;s say you want one class to have a different &quot;MaxDamage&quot; than another class. Keep this in mind; any function put into the child file _will_ overwrite the function in the parent file. It won&#39;t overwrite it for everything it&#39;s linked to, just the child file you placed &quot;MaxDamage&quot; in. So, if you wanted to make the Imperial rocket launcher&#39;s damage value different than everyone else&#39;s, add the function &quot;MaxDamage&quot; to imp\_weap\_inf\_rocket\_launcher\_ord and change the value to whatever number you&#39;d like it to be.

Let&#39;s throw out another example, a bit more complicated.

- Go to your … \data\Sides\rep folder.
- Open up the ODF file: rep\_inf\_rifleman.odf.

Notice its &quot;ClassParent&quot;, rep\_inf\_default\_rifleman.odf. We separated the two files to allow two people to edit various aspects of the Republic assault trooper without stepping on each others toes. The rep\_inf\_rifleman file adjusts the visual properties of the soldier; the armor he wears, etc., while rep\_inf\_default\_rifleman allows someone else to adjust the weapon properties. In this case, rep\_inf\_default\_rifleman is the parent which is found in the same folder. Parent files don&#39;t have to be within a specific folder, they just need to exist within the data directory. In this case, it&#39;s not found within the Common folder because this particular hierarchy has four steps.

The file it links to next, rep\_inf\_default.odf, is also found within the same folder. All of the default Republic ODF infantry files (these files control the weapon loadouts for each class) can share several of the same functions. The ones that need to be unique are found within each of the specific unit&#39;s ODF file. The ones that can be shared among them will be found in rep\_inf\_default.

Since a lot of the Republic soldiers share similar properties (most notably sounds, animations, etc.), it made sense to group them up into a single parent file. Notice though, within this parent file, there is a link to yet another parent file. This file links to the data\Common folder (not the data\Sides\Common folder), where you&#39;ll find com\_inf\_default.odf.

We did this for the same reason we did it to the rocket launcher files. All of the infantrymen have similar properties. They fire the same types of weapons (not visually, but rather numerically they are similar), have the same range, move at the same speed, etc. There&#39;s no need to copy and paste all of this information multiple times.

Parent files were a great help to us as we developed SWBFII, and we hope they&#39;ll help you get your own mods up and running faster as well. If you have a hard time tracking down a parent file, just run a search from it in the data directory.

**Vehicle ODF Files**

I hope to give you a better idea of to manipulate the vehicle ODF files in this section. Just note that vehicles can change from one to another. Some have multiple seating, some are hovers, some walk, others fly, and some have unique abilities. It would take a book to give you an idea of how to get every one of them working, so let&#39;s just start with something simple and hopefully you can take it from there.

Let&#39;s use the CIS Snailtank for our example.

- Go to …\data\Sides\cis\odf
- Open: cis\_tread\_snailtank.odf

We&#39;re going to start from the top and go down. I&#39;m going to skip to the functions that clearly define the vehicle. I might describe sections in chunks for ease of understanding.

ClassLabel – The type of vehicle this is. This is used to determine whether or not it&#39;s a walker, a hover, a flyer, etc. This definition is important since various vehicles have properties the other type wont. For instance, imperial walkers, along with any other walker vehicle, rely heavily on animations. Hovers can get over obstacles other ground based vehicles can&#39;t. Flyers can… well, fly. Changing the ClassLabel will cause you problems if you don&#39;t add in the necessary functions to make the new ClassLabel work.

GeometryName – This is the actual mesh that&#39;s being called in through the ODF.

VehicleType – This plays into the collision system and how the vehicle will interact with the world.

ReserveOneForPlayer – Determines whether or not an AI unit can jump into the vehicle.

MapTexture, HealthTexture – The 2D image displayed on your HUD.

VehiclePosition – Where the player&#39;s character will sit once they&#39;ve entered the vehicle.

MapScale – How close you are zoomed in to the mini-map.

Explosion, ExplosionCritical, ExplosionDestruct – Various states of destruction. You will call the appropriate ODF file depending on the cause of &quot;death&quot; to the vehicle.

FirstPersonFOV – What your frame of view will be when seated inside the vehicle.

CockpitTension, CollisionScale, CollisionThreshold – Various functions that deal with the vehicle&#39;s collision against other vehicles, objects, etc.

MaxHealth – The vehicle&#39;s maximum health value.

HealthType – This determines whether it can be healed by a fusion cutter or not, and other conditions.

HitLocation – The location of its critical hit point. The number at the end determines its multiplier. For instance, the &quot;4&quot; means this location causes 4x the normal damage.

TimeRequiredToEject – How long it will take to hack someone out of the vehicle.

EjectResistance – The higher this resistance it, the more it opposes the the hacking attempt, thus making the TimeRequiredToEject higher and regenerate back to full quicker.

TimeTilReboard – After the person is hacked out, how long it takes for anyone to be allowed to re-enter the vehicle.

SetAltitude, GravityScale, LiftSpring, LiftDamp – These adjust the hover proerties of the vehicle and how they collide with the world.

Acceleration, Deceleration, Traction, ForwardSpeed, ReverseSpeed, StrafeSpeed – Adjust the speed values of the vehicle in its various states of movement.

FloatsOnWater – Whether or not it can float on water as a hover vehicle type.

EnergyBar, EnergyOverheat, EnergyAutoRestore, EnergyBoostDrain, BoostSpeed, BoostAcceleration, BoostFOV – These values adjust the vehicle&#39;s energy, and how quickly it uses this value, regenerates it, boost speed and the frame of view when boosting.

From AddSpringBody down to OmegaZDamp, these values play into where the &quot;collision spheres&quot; are located on the hover vehicle. Hovers use a procedurally created collision system, which are simply spheres placed at different X,Y, Z coordinates of the vehicle.

SpinRate, TurnRate, TurnFilter, PitchRate, LevelSpring, LevelDamp – These affect the control of the vehicle through a peripheral, such as a mouse, joystick, etc.

EyePointOffset, TrackCenter, TrackOffset, TiltValue, NormalDirection – Camera placement parameters that use an X, Y, Z orientation system.

PitchLimits, YawLimits – The limitations of how far the camera can pitch or yaw until it hits a &quot;wall&quot;.

WHEELSECTION – This section controls the Snailtanks&#39;s tread animation.

WEAPONSECTION – A vehicle can have two weapon sections. Each will call its own weapon ODF file and have its own properties. These properties will control where the ordnance is firing from, how many guns there are that fire the ordnance, the ammo count, etc.

FLYERSECTION – NOTE that the Snailtank doesn&#39;t have a FLYERSECTION since it&#39;s a one-man vehicle. Untrue to its name, any vehicle that can support a passenger has a FLYERSECTION. These use functions found through the regular vehicle&#39;s ODF file, so check out a vehicle (such as the CIS&#39;s AAT, the Imperial AT-ST, etc.) that has multiple positions for an example on how it&#39;s set up.

WakeEffect – The water animation played when the vehicle is touching water.

CHUNKSECTION – These sections define the vehicle when it has exploded. They determine what geometry is used, how they will disperse, etc.

AISizeType – This plays into the collision system and how the vehicle will interact with the world.

DamageStartPercent, DamageStopPercent, DamageEffect, DamageAttachPoint – The damage effects played at various health levels of the vehicle.

EngineSound down to FoleyFXGroup will manipulate the sounds the vehicles will use, the music you&#39;ll hear and the sound effects that can play while inside them.

**Infantry ODF Files**

Infantry units use a lot of the hierarchy system we&#39;ve set up for SWBFII. Bear with me as we jump through them all.

Let&#39;s use the CIS Battledroid for our example.

- Go to …\data\Sides\cis\odf
- Open: cis\_inf\_rifleman.odf

This odf file specifically deals with the way our infantry unit will look. These functions will call in the mesh to be used, the type of unit it is, and where its head collision is found (used for critical headshots). This file is pretty straightforward.

Let&#39;s move to the next file.

- Go to …\data\Sides\cis\odf
- Open: cis\_inf\_default\_rifleman.odf

This is where the weapons are found and specific class VO (voice over sounds) functions are found. From here it links to specific weapon ODF files and the specific VO used when the player uses his F-key shortcuts.

After that we move to another parent file.

- Go to …\data\Sides\cis\odf
- Open: cis\_inf\_default.odf

Here&#39;s a file that&#39;s shared among the CIS infantry units. This section is mainly reserved to call the CHUNKSECTION (explosion effects) and universal sounds each of the CIS infantry units will make. Changing something here will change the properties in all of the CIS infantry units.

Last, but not least, we have our last file.

- Go to …\data\Common\odfs
- Open: com\_inf\_default.odf

This file covers _all_ of the infantry units (minus ones like the Droideka, which is a completely different entity and much more like a vehicle). Changing something here will change every infantry unit. You&#39;ll be able to control their speeds when running, strafing and crouching, the camera at these different positions, the energy they have and the energy cost for various abilities. It will also affect the drop rate of the health, ammo and special canisters, and what will drop from them. Most of the function names are self-explanatory, and others share the same properties as the ones found in the Vehicle ODF documentation.