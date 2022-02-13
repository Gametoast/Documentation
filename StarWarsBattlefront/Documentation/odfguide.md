SWBF Mod Tools

**OBJECT DEFINITION FILES**

Object Definition Files (ODFs) are text files the define the properties of every object in the game. All examples were included with the assets of the levels that shipped with the game. ODF files contain information that defines an object's presence in the editor as well as in the game.

File Properties  
At the top of every ODF are lines that look like this:  

```C#
[GameObjectClass]
ClassLabel = "someclasslabel"
GeometryName = "somefilename.msh"

[Properties]
```

The GAMEOBJECTCLASS section define the properties needed by Zeroedtor to view and manipulate the object.  
CLASSLABEL refers to the object's functional class. This is for use in the game primarily, but in some cases it is used to expose an object's properties within the editor.  
GEOMETRYNAME is the mesh file reference that ultimately makes an object visible in the editor.  
PROPERTIES is where the beginning of the in game properties are defined.

In addition to GAMEOBJECTCLASS there are other classes that are defined in ODFs that are not viewed in the editor. These include WEAPONCLASS and EXPLOSIONCLASS. These headers are applied to ODFs that are typically called by other ODFs as child objects. For example a weapon is always attached to a unit, vehicle or building, and an explosion is always attached to a type of ordnance or an object. An explosion may or may not have an ODF. In many cases as with vehicles there is an exploded vehicle ODF that calls an explosion particle effect.

Particle effects are stored in the effects folder and can be created from textures using a Particle Editor included in the BFBuilder\\ToolsFL folder. The Particle Editor is not covered here, but it should be noted that particle effects are saved as text files that refer to textures can also trigger sounds. Some particle effects have sound hooks.

ClassLabels  
There are over 60 ClassLabels attached to objects in the game. A list of these can be found below in the appendix but it should be noted that there are redundancies and some are even obsolete. The list was assembled from the ODFs that shipped with the game but not all of the ODFs that shipped with the game are in the game. Most are self explanatory, and a few have been highlighted with notes. When creating new objects and ODFs there is a lot of overlap in the ClassLabels, so use a ClassLabel that provides just the functionality the object needs.

Vehicles and Units  
When creating new objects not in the game the most difficult are probably the units and vehicles. This is because they are typically a collection of objects whose features are practically limitless and thus are defined on a case by case basis. The best way to create new units and vehicles to examine those that already exist. For vehicles that did not appear in the game use their ODFs with suspicion as they may not be set up completely and for those that do appear in the game they may have extraneous uneeded data, or obsolete comments. Units are pretty easy to create if all one wants to change is textures, weapons, and weapon strengths. Those require simple texture and property edits before munging the units and vehicles into a new side. What is more complicated is creating all new models with collisions and animations. How to do this in explicit detail is not covered here, but a primer can be found in the Art Design Guide and the Animation Guide.

Appendix

ODF ClassLabels
```LUA
animatedbuilding  
animatedprop  
armedbuilding  
armedbuildingdynamic  
beacon -- obsolete? once used for orbital strike  
beam -- ordnance  
binoculars -- for binculars as a weapon  
bolt -- ordnance  
building  
bullet -- ordnance  
cannon -- weapon  
catapult -- obsolete, once used on Endor  
cloudcluster  
commandarmedanimatedbuilding  
commandhover -- mobile command post  
commandpost  
commandwalker -- mobile command post  
destruct  
destructablebuilding  
detonator -- obsolete? Time bomb replaced remote detonator  
disguise -- weapon  
dispenser -- weapon  
droid  
dusteffect  
emitterordnance  
explosion  
fatray  
flyer -- vehicle class  
godray -- lighting effect  
grapplinghook  
grapplinghookweapon  
grasspatch  
grenade  
haywire  
hologram  
hover -- vehicle class  
launcher -- weapon  
leafpatch  
Light  
melee -- used for Jedi melee weapons  
mine  
missile  
powerupitem  
prop  
remote  
repair  
rumbleeffect -- special, used in Hoth hangar  
shell  
shield  
soldier  
SoundAmbienceStatic -- used to display speakers in editor when adding ambient emitters  
SoundAmbienceStreaming -- used to display speakers in editor when adding ambient emitters  
sticky  
towcable  
towcableweapon  
trap  
vehiclepad -- obsolete, once used for LATTE to drop ATTEs  
vehiclespawn  
walker -- vehicle class  
walkerdroid  
water  
weapon
```

Appendix B

ClassLabels and Properties  
Below is a list of the classlabels and the corresponding properties in the ODFs that are part of the assets that shipped with the game. Again not all of the properties are valid, or required for an object and this list does not illustrate any heirarchy required by the syntax in defining an object's properties. In general the properties in all caps with SECTION in the name (WEAPONSECTION for example) are not properties but define property subsections for an object.

|**ClassLabel** | **Property** |
|-------------------------|--------------------------------|
| animatedbuilding | AnimationName|
| animatedbuilding | ClassLabel|
| animatedbuilding | CollisionScale|
| animatedbuilding | DeathAnimation|
| animatedbuilding | DeathEffect|
| animatedbuilding | DestroyedGeometryName|
| animatedbuilding | EnableDeathExplosions|
| animatedbuilding | ExplosionName|
| animatedbuilding | ExplosionOffset|
| animatedbuilding | GeometryName|
| animatedbuilding | IdleAnimation|
| animatedbuilding | MaxHealth|
| animatedbuilding | TargetableCollision|
| animatedbuilding | vehiclecollisiononly|
| animatedprop | Animation|
| animatedprop | AnimationName|
| animatedprop | AnimationTrigger|
| animatedprop | AttachTrigger|
| animatedprop | ClassLabel|
| animatedprop | DenyFlyerLand|
| animatedprop | DisableForCloneWars|
| animatedprop | GeometryName|
| animatedprop | IdleDelay|
| animatedprop | KillSoldierSound|
| animatedprop | TrackDeathOnAttach|
| armedbuilding | AimerNodeName|
| armedbuilding | AimerPitchLimits|
| armedbuilding | AimerYawLimits|
| armedbuilding | AutoFire|
| armedbuilding | BarrelLength|
| armedbuilding | BarrelNodeName|
| armedbuilding | BarrelRecoil|
| armedbuilding | BUILDINGSECTION|
| armedbuilding | ChunkBounciness|
| armedbuilding | ChunkGeometryName|
| armedbuilding | ChunkNodeName|
| armedbuilding | ChunkOmega|
| armedbuilding | ChunkPhysics|
| armedbuilding | CHUNKSECTION|
| armedbuilding | ChunkSmokeEffect|
| armedbuilding | ChunkSmokeNodeName|
| armedbuilding | ChunkSpeed|
| armedbuilding | ChunkStickiness|
| armedbuilding | ChunkTerrainCollisions|
| armedbuilding | ChunkTerrainEffect|
| armedbuilding | ChunkTrailEffect|
| armedbuilding | ChunkUpFactor|
| armedbuilding | ClassLabel|
| armedbuilding | Controllable|
| armedbuilding | DamageAttachPoint|
| armedbuilding | DamageEffect|
| armedbuilding | DamageStartPercent|
| armedbuilding | DamageStopPercent|
| armedbuilding | DestroyedGeometryName|
| armedbuilding | ExplosionCritical|
| armedbuilding | ExplosionDestruct|
| armedbuilding | ExplosionName|
| armedbuilding | EyePointOffset|
| armedbuilding | FirePointName|
| armedbuilding | FireSound|
| armedbuilding | FirstPerson|
| armedbuilding | FoleyFXGroup|
| armedbuilding | GeometryName|
| armedbuilding | HealthTexture|
| armedbuilding | IconTexture|
| armedbuilding | Label|
| armedbuilding | MapScale|
| armedbuilding | MapTexture|
| armedbuilding | MaxHealth|
| armedbuilding | MaxPitchSpeed|
| armedbuilding | MaxTurnSpeed|
| armedbuilding | NextBarrel|
| armedbuilding | Ordnancecollision|
| armedbuilding | PCaxPitchSpeed|
| armedbuilding | PCMaxPitchSpeed|
| armedbuilding | PCMaxStrafeSpeed|
| armedbuilding | PCMaxTurnSpeed|
| armedbuilding | PCPitchSpeed|
| armedbuilding | PCPitchTurnFactor|
| armedbuilding | PCTurnSpeed|
| armedbuilding | PCYawTurnFactor|
| armedbuilding | Pilot9Pose|
| armedbuilding | PilotAnimation|
| armedbuilding | PilotPosition|
| armedbuilding | PitchLimits|
| armedbuilding | PitchRate|
| armedbuilding | PitchTurnFactor|
| armedbuilding | ReloadSound|
| armedbuilding | RespawnTime|
| armedbuilding | Soldiercollision|
| armedbuilding | StatusTexture|
| armedbuilding | ThirdPersonFOV|
| armedbuilding | TiltValue|
| armedbuilding | TrackCenter|
| armedbuilding | TrackOffset|
| armedbuilding | TurnRate|
| armedbuilding | TurretActivateSound|
| armedbuilding | TurretAmbientSound|
| armedbuilding | TurretDeactivateSound|
| armedbuilding | TurretMoveSound|
| armedbuilding | TurretMoveSoundStartEndPitch|
| armedbuilding | TurretMoveSoundStartEndTime|
| armedbuilding | TurretNodeName|
| armedbuilding | TurretPitchoundPitch|
| armedbuilding | TurretPitchSound|
| armedbuilding | TurretPitchSoundPitch|
| armedbuilding | TURRETSECTION|
| armedbuilding | TurretStartSound|
| armedbuilding | TurretStopSound|
| armedbuilding | TurretYawSound|
| armedbuilding | TurretYawSoundPitch|
| armedbuilding | UnbuiltGeometryName|
| armedbuilding | UnbuiltHoloOdf|
| armedbuilding | vehiclecollision|
| armedbuilding | Virtual|
| armedbuilding | WeaponAmmo|
| armedbuilding | WeaponName|
| armedbuilding | YawLimits|
| armedbuildingdynamic | BUILDINGSECTION|
| armedbuildingdynamic | ClassLabel|
| armedbuildingdynamic | GeometryName|
| armedbuildingdynamic | Label|
| armedbuildingdynamic | MaxHealth|
| armedbuildingdynamic | PilotAnimation|
| armedbuildingdynamic | PilotPosition|
| armedbuildingdynamic | PitchLimits|
| armedbuildingdynamic | RespawnTime|
| armedbuildingdynamic | TrackCenter|
| armedbuildingdynamic | WeaponAmmo|
| armedbuildingdynamic | WeaponName|
| armedbuildingdynamic | YawLimits|
| beacon | AimAzimuth|
| beacon | AimDistance|
| beacon | AimElevation|
| beacon | ClassLabel|
| beacon | CollisionSound|
| beacon | ExplosionExpire|
| beacon | Friction|
| beacon | GeometryName|
| beacon | Gravity|
| beacon | ImpactEffect|
| beacon | LifeSpan|
| beacon | MaxDamage|
| beacon | NEXTCHARGE|
| beacon | OrdnanceEffect|
| beacon | OrdnanceName|
| beacon | OrdnanceSound|
| beacon | Rebound|
| beacon | SalvoCount|
| beacon | SalvoDelay|
| beacon | ScatterDistance|
| beacon | TrailEffect|
| beacon | Velocity|
| beam | AnimalScale|
| beam | ArmorScale|
| beam | BuildingScale|
| beam | ClassLabel|
| beam | CollisionSound|
| beam | DroidScale|
| beam | Gravity|
| beam | HealthScale|
| beam | ImpactEffect|
| beam | ImpactEffectWater|
| beam | LaserGlowColor|
| beam | LaserTexture|
| beam | LaserWidth|
| beam | LifeSpan|
| beam | MaxDamage|
| beam | OrdnanceSound|
| beam | PersonScale|
| beam | Range|
| beam | Rebound|
| beam | ShieldScale|
| beam | VehicleScale|
| binoculars | AnimationBank|
| binoculars | ClassLabel|
| binoculars | FirePointName|
| binoculars | FireStateTime|
| binoculars | GeometryName|
| binoculars | IconTexture|
| binoculars | Label|
| binoculars | LockOnRange|
| binoculars | ModeTexture|
| binoculars | ModeTextureColor|
| binoculars | ReloadTime|
| binoculars | ReticuleTexture|
| binoculars | RoundsPerClip|
| binoculars | ShotDelay|
| binoculars | WeaponChangeSound|
| binoculars | ZoomMax|
| binoculars | ZoomMin|
| binoculars | ZoomRate|
| bolt | AnimalScale|
| bolt | ArmorScale|
| bolt | BlurLength|
| bolt | BuildingScale|
| bolt | ClassLabel|
| bolt | CollisionSound|
| bolt | Damage|
| bolt | DroidScale|
| bolt | ExpireEffect|
| bolt | ExplosionExpire|
| bolt | ExplosionImpact|
| bolt | ExplosionName|
| bolt | FadeOutTime|
| bolt | FoleyFXClass|
| bolt | GlowLength|
| bolt | Gravity|
| bolt | HealthScale|
| bolt | HealthSScale|
| bolt | ImpactEffect|
| bolt | ImpactEffectRigid|
| bolt | ImpactEffectShield|
| bolt | ImpactEffectSoft|
| bolt | ImpactEffectStatic|
| bolt | ImpactEffectTerrain|
| bolt | ImpactEffectWater|
| bolt | LaserGlowColor|
| bolt | LaserLength|
| bolt | LaserTexture|
| bolt | LaserWidth|
| bolt | LifeSpan|
| bolt | LightColor|
| bolt | LightRadius|
| bolt | MaxDamage|
| bolt | NEXTCHARGE|
| bolt | OrdnanceEffect|
| bolt | OrdnanceSound|
| bolt | PersonScale|
| bolt | Rebound|
| bolt | ShieldScale|
| bolt | VehicleScale|
| bolt | Velocity|
| building | AttachEffect|
| building | AttachOdf|
| building | AttachToHardPoint|
| building | classLabel|
| building | collisionName|
| building | CollisionScale|
| building | FoleyFXGroup|
| building | geometryName|
| building | geometryScale|
| building | Label|
| building | OrdnanceCollision|
| building | SoldierCollision|
| building | SoundProperty|
| building | unitName|
| building | VehicleCollision|
| building | VehicleCollisionOnly|
| bullet | AnimalScale|
| bullet | BuildingScale|
| bullet | ClassLabel|
| bullet | CollisionSound|
| bullet | Damage|
| bullet | DroidScale|
| bullet | ExplosionExpire|
| bullet | ExplosionImpact|
| bullet | ExplosionName|
| bullet | Friction|
| bullet | GeometryName|
| bullet | Gravity|
| bullet | ImpactEffect|
| bullet | ImpactEffectWater|
| bullet | LifeSpan|
| bullet | LightColor|
| bullet | LightRadius|
| bullet | LockedOnSound|
| bullet | MaxDamage|
| bullet | MaxRange|
| bullet | MinRange|
| bullet | OptimalRange|
| bullet | OrdnanceSound|
| bullet | PersonScale|
| bullet | Rebound|
| bullet | StickAnimal|
| bullet | StickBuilding|
| bullet | StickBuildingDead|
| bullet | StickBuildingUnbuilt|
| bullet | StickDroid|
| bullet | StickPerson|
| bullet | StickTerrain|
| bullet | StickVehicle|
| bullet | TargetAnimal|
| bullet | TargetBuilding|
| bullet | TargetDroid|
| bullet | TargetEnemy|
| bullet | TargetFriendly|
| bullet | TargetNeutral|
| bullet | TargetPerson|
| bullet | TargetVehicle|
| bullet | TrailEffect|
| bullet | TurnRate|
| bullet | VehicleScale|
| bullet | Velocity|
| bullet | WaverRate|
| bullet | WaverTurn|
| cannon | AmmoPerShot|
| cannon | AnimationBank|
| cannon | AutoAimSize|
| cannon | ChangeModeSound|
| cannon | ChargeDelayHeavy|
| cannon | ChargeDelayLight|
| cannon | ChargeRateHeavy|
| cannon | ChargeRateLight|
| cannon | ChargeSound|
| cannon | ChargeSoundPitch|
| cannon | ChargeUpEffect|
| cannon | ClankLeftRunSound|
| cannon | ClankLeftWalkSound|
| cannon | ClankRightRunSound|
| cannon | ClankRightWalkSound|
| cannon | ClassLabel|
| cannon | CrouchMoveSpread|
| cannon | CrouchStillSpread|
| cannon | Discharge|
| cannon | FireAnim|
| cannon | FireEmptySound|
| cannon | FireLoopSound|
| cannon | FirePointName|
| cannon | FireSound|
| cannon | FireSoundStop|
| cannon | FlashColor|
| cannon | FlashLength|
| cannon | FlashLightColor|
| cannon | FlashLightDuration|
| cannon | FlashLightRadius|
| cannon | FoleyFXGroup|
| cannon | GeometryName|
| cannon | HeatPerShot|
| cannon | HeatRecoverRate|
| cannon | HeatThreshold|
| cannon | HideOnFire|
| cannon | HighResGeometry|
| cannon | IconTexture|
| cannon | InitialSalvoDelay|
| cannon | JumpSound|
| cannon | KickBuildup|
| cannon | KickSpread|
| cannon | KickStrength|
| cannon | Label|
| cannon | LandSound|
| cannon | LockOffAngle|
| cannon | LockOnAngle|
| cannon | LockOnRange|
| cannon | LockOnTime|
| cannon | LockTime|
| cannon | MaxChargeStrengthHeavy|
| cannon | MaxChargeStrengthLight|
| cannon | MaxPressedTime|
| cannon | MaxRange|
| cannon | MaxSpread|
| cannon | MaxStrength|
| cannon | MinRange|
| cannon | MinSpread|
| cannon | MinStrength|
| cannon | ModeTexture|
| cannon | ModeTextureColor|
| cannon | MuzzleFlash|
| cannon | NextCharge|
| cannon | OptimalRange|
| cannon | OrdnanceName|
| cannon | OverheatSound|
| cannon | OverheatSoundPitch|
| cannon | OverheatStopSound|
| cannon | PitchSpread|
| cannon | ProneMoveSpread|
| cannon | ProneSound|
| cannon | ProneStillSpread|
| cannon | RecoilDecayHeavy|
| cannon | RecoilDecayLight|
| cannon | RecoilDelayHeavy|
| cannon | RecoilDelayLight|
| cannon | RecoilLengthHeavy|
| cannon | RecoilLengthLight|
| cannon | RecoilStrengthHeavy|
| cannon | RecoilStrengthLight|
| cannon | ReloadSound|
| cannon | ReloadTime|
| cannon | ReticuleTexture|
| cannon | RollSound|
| cannon | RoundDelay|
| cannon | RoundsPerClip|
| cannon | RoundsPerSalvo|
| cannon | SalvoCount|
| cannon | SalvoDelay|
| cannon | SalvoTime|
| cannon | ScopeTexture|
| cannon | ShotDelay|
| cannon | ShotElevate|
| cannon | ShotPatternCount|
| cannon | ShotPatternPitchYaw|
| cannon | ShotsPerSalvo|
| cannon | SniperScope|
| cannon | SpreadLimit|
| cannon | SpreadPerShot|
| cannon | SpreadRecover|
| cannon | SpreadRecoverRate|
| cannon | SpreadThreshold|
| cannon | SquatSound|
| cannon | StandMoveSpread|
| cannon | StandSound|
| cannon | StandStillSpread|
| cannon | TargetAnimal|
| cannon | TargetBuilding|
| cannon | TargetDroid|
| cannon | TargetEnemy|
| cannon | TargetFriendly|
| cannon | TargetNeutral|
| cannon | TargetPerson|
| cannon | TargetVehicle|
| cannon | TrackingSound|
| cannon | TriggerSingle|
| cannon | WeaponChange|
| cannon | WeaponChangeSound|
| cannon | WEAPONSECTION|
| cannon | YawSpread|
| cannon | ZoomFirstPerson|
| cannon | ZoomMax|
| cannon | ZoomMin|
| cannon | ZoomRate|
| catapult | ArmName|
| catapult | AutoAimSize|
| catapult | ClassLabel|
| catapult | CockedAngle|
| catapult | FirePointName|
| catapult | FireSound|
| catapult | FireVelocity|
| catapult | InitialSalvoDelay|
| catapult | Label|
| catapult | LockOnRange|
| catapult | LockTime|
| catapult | MaxSpread|
| catapult | MinSpread|
| catapult | OrdnanceGeometryName|
| catapult | OrdnanceName|
| catapult | ReloadSound|
| catapult | ReloadTime|
| catapult | RoundsPerClip|
| catapult | SalvoCount|
| catapult | SalvoDelay|
| catapult | ShotDelay|
| cloudcluster | ClassLabel|
| cloudcluster | GeometryName|
| cloudcluster | HorizontalSpread|
| cloudcluster | NumDustObjectsInEffects|
| cloudcluster | Odf|
| cloudcluster | VerticalSpread|
| commandarmedanimatedbuilding | AllyCount|
| commandarmedanimatedbuilding | AllyPath|
| commandarmedanimatedbuilding | AmbientSound|
| commandarmedanimatedbuilding | AnimationName|
| commandarmedanimatedbuilding | AutoFire|
| commandarmedanimatedbuilding | BUILDINGSECTION|
| commandarmedanimatedbuilding | CapturedSound|
| commandarmedanimatedbuilding | CaptureRegion|
| commandarmedanimatedbuilding | ChargeSound|
| commandarmedanimatedbuilding | ClassLabel|
| commandarmedanimatedbuilding | CollisionScale |
| commandarmedanimatedbuilding | Controllable |
| commandarmedanimatedbuilding | ControlRegion |
| commandarmedanimatedbuilding | DeathAnimation |
| commandarmedanimatedbuilding | DeathSound |
| commandarmedanimatedbuilding | DischargeSound |
| commandarmedanimatedbuilding | DisputeSound |
| commandarmedanimatedbuilding | GeometryName |
| commandarmedanimatedbuilding | HoloImageGeometry |
| commandarmedanimatedbuilding | HoloOdf |
| commandarmedanimatedbuilding | HoloTurnOnTime |
| commandarmedanimatedbuilding | HoverBan |
| commandarmedanimatedbuilding | HugeBan |
| commandarmedanimatedbuilding | HurtSound |
| commandarmedanimatedbuilding | IdleAnimation |
| commandarmedanimatedbuilding | KillRegion |
| commandarmedanimatedbuilding | Label |
| commandarmedanimatedbuilding | LostSound |
| commandarmedanimatedbuilding | MapScale |
| commandarmedanimatedbuilding | MapTexture |
| commandarmedanimatedbuilding | MaxHealth |
| commandarmedanimatedbuilding | MaxPitchSpeed |
| commandarmedanimatedbuilding | MaxTurnSpeed |
| commandarmedanimatedbuilding | MediumBan |
| commandarmedanimatedbuilding | PilotType |
| commandarmedanimatedbuilding | PitchLimits |
| commandarmedanimatedbuilding | Radius |
| commandarmedanimatedbuilding | RespawnTime |
| commandarmedanimatedbuilding | RestDir |
| commandarmedanimatedbuilding | SmallBan |
| commandarmedanimatedbuilding | SoldierBan |
| commandarmedanimatedbuilding | SoundPitchDev |
| commandarmedanimatedbuilding | SpawnPath |
| commandarmedanimatedbuilding | SpawnPointCount |
| commandarmedanimatedbuilding | SpawnPointLocation |
| commandarmedanimatedbuilding | Strategic_Filter1 |
| commandarmedanimatedbuilding | Strategic_Filter2 |
| commandarmedanimatedbuilding | Strategic_Filter3 |
| commandarmedanimatedbuilding | Strategic_Filter4 |
| commandarmedanimatedbuilding | Strategic_Filter5 |
| commandarmedanimatedbuilding | Strategic_Filter6 |
| commandarmedanimatedbuilding | TurretNodeName |
| commandarmedanimatedbuilding | Value_ATK_Alliance |
| commandarmedanimatedbuilding | Value_ATK_CIS |
| commandarmedanimatedbuilding | Value_ATK_Empire |
| commandarmedanimatedbuilding | Value_ATK_Republic |
| commandarmedanimatedbuilding | Value_DEF_Alliance |
| commandarmedanimatedbuilding | Value_DEF_CIS |
| commandarmedanimatedbuilding | Value_DEF_Empire |
| commandarmedanimatedbuilding | Value_DEF_Locals |
| commandarmedanimatedbuilding | Value_DEF_Republic |
| commandarmedanimatedbuilding | ValueBleed |
| commandarmedanimatedbuilding | VO_All_AllCapture |
| commandarmedanimatedbuilding | VO_All_AllInDispute |
| commandarmedanimatedbuilding | VO_All_AllInfo |
| commandarmedanimatedbuilding | VO_All_AllLost |
| commandarmedanimatedbuilding | VO_All_AllSaved |
| commandarmedanimatedbuilding | VO_All_ImpCapture |
| commandarmedanimatedbuilding | VO_All_ImpInDispute |
| commandarmedanimatedbuilding | VO_All_ImpInfo |
| commandarmedanimatedbuilding | VO_All_ImpLost |
| commandarmedanimatedbuilding | VO_All_ImpSaved |
| commandarmedanimatedbuilding | VO_CIS_CISCapture |
| commandarmedanimatedbuilding | VO_CIS_CISInDispute |
| commandarmedanimatedbuilding | VO_CIS_CISInfo |
| commandarmedanimatedbuilding | VO_CIS_CISLost |
| commandarmedanimatedbuilding | VO_CIS_CISSaved |
| commandarmedanimatedbuilding | VO_CIS_RepCapture |
| commandarmedanimatedbuilding | VO_CIS_RepInDispute |
| commandarmedanimatedbuilding | VO_CIS_RepInfo |
| commandarmedanimatedbuilding | VO_CIS_RepLost |
| commandarmedanimatedbuilding | VO_CIS_RepSaved |
| commandarmedanimatedbuilding | VO_Imp_AllCapture |
| commandarmedanimatedbuilding | VO_Imp_AllInDispute |
| commandarmedanimatedbuilding | VO_Imp_AllInfo |
| commandarmedanimatedbuilding | VO_Imp_AllLost |
| commandarmedanimatedbuilding | VO_Imp_AllSaved |
| commandarmedanimatedbuilding | VO_Imp_ImpCapture |
| commandarmedanimatedbuilding | VO_Imp_ImpInDispute |
| commandarmedanimatedbuilding | VO_Imp_ImpInfo |
| commandarmedanimatedbuilding | VO_Imp_ImpLost |
| commandarmedanimatedbuilding | VO_Imp_ImpSaved |
| commandarmedanimatedbuilding | VO_Rep_CISCapture |
| commandarmedanimatedbuilding | VO_Rep_CISInDispute |
| commandarmedanimatedbuilding | VO_Rep_CISInfo |
| commandarmedanimatedbuilding | VO_Rep_CISLost |
| commandarmedanimatedbuilding | VO_Rep_CISSaved |
| commandarmedanimatedbuilding | VO_Rep_RepCapture |
| commandarmedanimatedbuilding | VO_Rep_RepInDispute |
| commandarmedanimatedbuilding | VO_Rep_RepInfo |
| commandarmedanimatedbuilding | VO_Rep_RepLost |
| commandarmedanimatedbuilding | VO_Rep_RepSaved |
| commandarmedanimatedbuilding | WeaponAmmo |
| commandarmedanimatedbuilding | WeaponName |
| commandarmedanimatedbuilding | YawLimits |
| commandhover | Acceleration |
| commandhover | AddSpringBody |
| commandhover | AimerNodeName |
| commandhover | AimerPitchLimits |
| commandhover | AimerYawLimits |
| commandhover | AISizeType |
| commandhover | AllMusic |
| commandhover | BankAngle |
| commandhover | BankFilter |
| commandhover | BarrelNodeName |
| commandhover | BarrelRecoil |
| commandhover | BodySpringLength |
| commandhover | BoostSound |
| commandhover | ChunkBounciness |
| commandhover | ChunkGeometryName |
| commandhover | ChunkNodeName |
| commandhover | ChunkOmega |
| commandhover | ChunkPhysics |
| commandhover | CHUNKSECTION |
| commandhover | ChunkSpeed |
| commandhover | ChunkStickiness |
| commandhover | ChunkTerrainCollisions |
| commandhover | ChunkTerrainEffect |
| commandhover | ChunkTrailEffect |
| commandhover | ChunkUpFactor |
| commandhover | CISMusic |
| commandhover | ClassLabel |
| commandhover | CockpitTension |
| commandhover | CollisionScale |
| commandhover | CollisionThreshold |
| commandhover | DamageAttachPoint |
| commandhover | DamageEffect |
| commandhover | DamageEffectScale |
| commandhover | DamageInheritVelocity |
| commandhover | DamageStartPercent |
| commandhover | DamageStopPercent |
| commandhover | DeathSound |
| commandhover | Deceleration |
| commandhover | EngineSound |
| commandhover | Explosion |
| commandhover | ExplosionCritical |
| commandhover | ExplosionDestruct |
| commandhover | ExplosionName |
| commandhover | EyePointOffset |
| commandhover | FirePointName |
| commandhover | FirstPerson |
| commandhover | FirstPersonFOV |
| commandhover | FLYERSECTION |
| commandhover | FoleyFXGroup |
| commandhover | ForceMode |
| commandhover | ForwardSpeed |
| commandhover | GeometryName |
| commandhover | GravityScale |
| commandhover | GroundedHeight |
| commandhover | GroundedSound |
| commandhover | HealthTexture |
| commandhover | HealthType |
| commandhover | HitLocation |
| commandhover | HurtSound |
| commandhover | ImpMusic |
| commandhover | LevelDamp |
| commandhover | LevelSpring |
| commandhover | LiftDamp |
| commandhover | LiftSpring |
| commandhover | MapScale |
| commandhover | MapTexture |
| commandhover | MaxHealth |
| commandhover | Music |
| commandhover | MusicDelay |
| commandhover | MusicSpeed |
| commandhover | NextAimer |
| commandhover | NextBarrel |
| commandhover | NoCombatInterrupt |
| commandhover | OmegaXDamp |
| commandhover | OmegaXSpring |
| commandhover | OmegaZDamp |
| commandhover | OmegaZSpring |
| commandhover | OrdnanceCollision |
| commandhover | PassengerEyePoint |
| commandhover | PassengerSlots |
| commandhover | PCPitchRate |
| commandhover | PCSpinRate |
| commandhover | PCTurnRate |
| commandhover | PilotAnimation |
| commandhover | PilotPosition |
| commandhover | PitchDamp |
| commandhover | PitchFilter |
| commandhover | PitchLimits |
| commandhover | PitchRate |
| commandhover | RepMusic |
| commandhover | ReverseSpeed |
| commandhover | ScanningRange |
| commandhover | SetAltitude |
| commandhover | SoldierCollision |
| commandhover | SpawnPointCount |
| commandhover | SpawnPointLocation |
| commandhover | SpinRate |
| commandhover | StatusTexture |
| commandhover | StrafeRollAngle |
| commandhover | StrafeSpeed |
| commandhover | ThrustPitchAngle |
| commandhover | TiltValue |
| commandhover | TrackCenter |
| commandhover | TrackOffset |
| commandhover | Traction |
| commandhover | TransmitRange |
| commandhover | TurnFilter |
| commandhover | TurningOffSound |
| commandhover | TurnOffSound |
| commandhover | TurnOffTime |
| commandhover | TurnOnSound |
| commandhover | TurnRate |
| commandhover | TurretMoveSound |
| commandhover | TurretMoveSoundStartEndPitch |
| commandhover | TurretMoveSoundStartEndTime |
| commandhover | TurretNodeName |
| commandhover | Value_ATK_Alliance |
| commandhover | Value_ATK_CIS |
| commandhover | Value_ATK_Empire |
| commandhover | Value_ATK_Locals |
| commandhover | Value_ATK_Republic |
| commandhover | Value_DEF_Alliance |
| commandhover | Value_DEF_CIS |
| commandhover | Value_DEF_Empire |
| commandhover | Value_DEF_Locals |
| commandhover | Value_DEF_Republic |
| commandhover | ValueBleed |
| commandhover | VehicleCollision |
| commandhover | VehicleCollisionSound |
| commandhover | VehiclePosition |
| commandhover | VehicleType |
| commandhover | VelocityDamp |
| commandhover | VelocitySpring |
| commandhover | WaterEffect |
| commandhover | WeaponAmmo |
| commandhover | WeaponName |
| commandhover | WEAPONSECTION |
| commandhover | YawLimits |
| commandpost | AllyCount |
| commandpost | AllyPath |
| commandpost | AmbientSound |
| commandpost | AnimationName |
| commandpost | AttachOdf |
| commandpost | --AttachOdf |
| commandpost | AttachToHardPoint |
| commandpost | --AttachToHardPoint |
| commandpost | BUILDINGSECTION |
| commandpost | CapturedSound |
| commandpost | CaptureRegion |
| commandpost | CaptureTime |
| commandpost | ChargeSound |
| commandpost | ChunkAngularDamping |
| commandpost | ChunkBounciness |
| commandpost | ChunkGeometryName |
| commandpost | ChunkLinearDamping |
| commandpost | ChunkNodeName |
| commandpost | ChunkOmega |
| commandpost | ChunkPhysics |
| commandpost | CHUNKSECTION |
| commandpost | ChunkSpeed |
| commandpost | ChunkStickiness |
| commandpost | ChunkTerrainCollisions |
| commandpost | ChunkTerrainEffect |
| commandpost | ChunkTrailEffect |
| commandpost | ChunkUpFactor |
| commandpost | ClassLabel |
| commandpost | CollisionScale |
| commandpost | ControlRegion |
| commandpost | DamageAttachPoint |
| commandpost | --DamageAttachPoint |
| commandpost | DamageEffect |
| commandpost | --DamageEffect |
| commandpost | DamageEffectScale |
| commandpost | --DamageEffectScale |
| commandpost | DamageInheritVelocity |
| commandpost | --DamageInheritVelocity |
| commandpost | DamageStartPercent |
| commandpost | --DamageStartPercent |
| commandpost | DamageStopPercent |
| commandpost | --DamageStopPercent |
| commandpost | DeathAnimation |
| commandpost | DeathEffect |
| commandpost | DenyFlyerLand |
| commandpost | DestroyedGeometryName |
| commandpost | DischargeSound |
| commandpost | DisputeSound |
| commandpost | EnableDeathExplosions |
| commandpost | ExplosionDestruct |
| commandpost | ExplosionName |
| commandpost | ExplosionOffset |
| commandpost | FlyerBan |
| commandpost | FoleyFXGroup |
| commandpost | GeometryName |
| commandpost | GeometryScale |
| commandpost | HealthTexture |
| commandpost | HoloImageGeometry |
| commandpost | HoloOdf |
| commandpost | HoloTurnOnTime |
| commandpost | HoverBan |
| commandpost | HugeBan |
| commandpost | IdleAnimation |
| commandpost | KillRegion |
| commandpost | Label |
| commandpost | Lighting |
| commandpost | LostSound |
| commandpost | MapScale |
| commandpost | MapTexture |
| commandpost | MaxHealth |
| commandpost | MediumBan |
| commandpost | NeutralizeTime |
| commandpost | OrdnanceCollision |
| commandpost | Radius |
| commandpost | SmallBan |
| commandpost | SoldierBan |
| commandpost | SoldierCollision |
| commandpost | SoundPitchDev |
| commandpost | SpawnPath |
| commandpost | Strategic_Filter1 |
| commandpost | Strategic_Filter2 |
| commandpost | Strategic_Filter3 |
| commandpost | Strategic_Filter4 |
| commandpost | Strategic_Filter5 |
| commandpost | Strategic_Filter6 |
| commandpost | Value_ATK_Alliance |
| commandpost | Value_ATK_CIS |
| commandpost | Value_ATK_Empire |
| commandpost | Value_ATK_Locals |
| commandpost | Value_ATK_Republic |
| commandpost | Value_DEF_Alliance |
| commandpost | Value_DEF_CIS |
| commandpost | Value_DEF_Empire |
| commandpost | Value_DEF_Locals |
| commandpost | Value_DEF_Republic |
| commandpost | ValueBleed |
| commandpost | VehicleCollision |
| commandpost | VO_All_AllCapture |
| commandpost | VO_All_AllInDispute |
| commandpost | VO_All_AllInfo |
| commandpost | VO_All_AllLost |
| commandpost | VO_All_AllSaved |
| commandpost | VO_All_ImpCapture |
| commandpost | VO_All_ImpInDispute |
| commandpost | VO_All_ImpInfo |
| commandpost | VO_All_ImpLost |
| commandpost | VO_All_ImpSaved |
| commandpost | VO_CIS_CISCapture |
| commandpost | VO_CIS_CISInDispute |
| commandpost | VO_CIS_CISInfo |
| commandpost | VO_CIS_CISLost |
| commandpost | VO_CIS_CISSaved |
| commandpost | VO_CIS_RepCapture |
| commandpost | VO_CIS_RepInDispute |
| commandpost | VO_CIS_RepInfo |
| commandpost | VO_CIS_RepLost |
| commandpost | VO_CIS_RepSaved |
| commandpost | VO_Imp_AllCapture |
| commandpost | VO_Imp_AllInDispute |
| commandpost | VO_Imp_AllInfo |
| commandpost | VO_Imp_AllLost |
| commandpost | VO_Imp_AllSaved |
| commandpost | VO_Imp_ImpCapture |
| commandpost | VO_Imp_ImpInDispute |
| commandpost | VO_Imp_ImpInfo |
| commandpost | VO_Imp_ImpLost |
| commandpost | VO_Imp_ImpSaved |
| commandpost | VO_Rep_CISCapture |
| commandpost | VO_Rep_CISInDispute |
| commandpost | VO_Rep_CISInfo |
| commandpost | VO_Rep_CISLost |
| commandpost | VO_Rep_CISSaved |
| commandpost | VO_Rep_RepCapture |
| commandpost | VO_Rep_RepInDispute |
| commandpost | VO_Rep_RepInfo |
| commandpost | VO_Rep_RepLost |
| commandpost | VO_Rep_RepSaved |
| commandwalker | Acceleraton |
| commandwalker | AimerNodeName |
| commandwalker | AimerPitchLimits |
| commandwalker | AimerYawLimits |
| commandwalker | AimValue |
| commandwalker | AISizeType |
| commandwalker | AllMusic |
| commandwalker | AllyCount |
| commandwalker | AnimationExtraFile |
| commandwalker | AnimationName |
| commandwalker | AutoAimYLimits |
| commandwalker | BarrelNodeName |
| commandwalker | BarrelRecoil |
| commandwalker | BuildingCollision |
| commandwalker | CargoNodeName |
| commandwalker | ChunkBounciness |
| commandwalker | ChunkGeometryName |
| commandwalker | ChunkNodeName |
| commandwalker | ChunkOmega |
| commandwalker | ChunkPhysics |
| commandwalker | CHUNKSECTION |
| commandwalker | ChunkSmokeEffect |
| commandwalker | ChunkSmokeNodeName |
| commandwalker | ChunkSpeed |
| commandwalker | ChunkStickiness |
| commandwalker | ChunkTerrainCollisions |
| commandwalker | ChunkTerrainEffect |
| commandwalker | ChunkTrailEffect |
| commandwalker | ChunkUpFactor |
| commandwalker | CISMusic |
| commandwalker | ClassLabel |
| commandwalker | CockpitTension |
| commandwalker | DamageAttachPoint |
| commandwalker | DamageEffect |
| commandwalker | DamageEffectScale |
| commandwalker | DamageInheritVelocity |
| commandwalker | DamageStartPercent |
| commandwalker | DamageStopPercent |
| commandwalker | DeathAnimationExplosion |
| commandwalker | DeathAnimationExplosionTime |
| commandwalker | DeathDustDelay |
| commandwalker | DeathDustEffect |
| commandwalker | DeathDustOffset |
| commandwalker | DeathShakeDelay |
| commandwalker | DeathShakeDuration |
| commandwalker | DeathShakeForce |
| commandwalker | DeathShakeRadius |
| commandwalker | DeathSound |
| commandwalker | EngineSound |
| commandwalker | ExplosionCritical |
| commandwalker | ExplosionDestruct |
| commandwalker | ExplosionName |
| commandwalker | ExplosionOffset |
| commandwalker | EyePointOffset |
| commandwalker | FinalExplosion |
| commandwalker | FinalExplosionOffset |
| commandwalker | FireOutsideLimits |
| commandwalker | FirePoint |
| commandwalker | FirePointName |
| commandwalker | FirstPerson |
| commandwalker | FirstPersonFOV |
| commandwalker | FoleyFXGroup |
| commandwalker | FootBoneLeft |
| commandwalker | FootBoneRight |
| commandwalker | FootstepSound0 |
| commandwalker | FootstepSound1 |
| commandwalker | FootstepSound2 |
| commandwalker | FootstepSound3 |
| commandwalker | FootstepSound4 |
| commandwalker | FootstepSound5 |
| commandwalker | ForceMode |
| commandwalker | ForwardTurnSpeed |
| commandwalker | GeometryName |
| commandwalker | HealthTexture |
| commandwalker | Healthtype |
| commandwalker | HitLocation |
| commandwalker | HurtSound |
| commandwalker | HydraulicLowerHeight |
| commandwalker | HydraulicLowerSound |
| commandwalker | HydraulicSound |
| commandwalker | HydraulicSoundHeight |
| commandwalker | ImpMusic |
| commandwalker | Label |
| commandwalker | LegBoneLeft |
| commandwalker | LegBoneRight |
| commandwalker | LegBoneTopLeft |
| commandwalker | LegBoneTopRight |
| commandwalker | LegPairCount |
| commandwalker | LegRayHitLength |
| commandwalker | MapScale |
| commandwalker | MapTexture |
| commandwalker | MaxHealth |
| commandwalker | MaxSpeed |
| commandwalker | MaxStrafeSpeed |
| commandwalker | MaxTurnSpeed |
| commandwalker | MusicDelay |
| commandwalker | MusicSpeed |
| commandwalker | NextAimer |
| commandwalker | NextBarrel |
| commandwalker | NoCombatInterrupt |
| commandwalker | NormalDirection |
| commandwalker | OrdnanceCollision |
| commandwalker | PassengerEyePoint |
| commandwalker | PassengerSlots |
| commandwalker | PCMaxTurnSpeed |
| commandwalker | PCMaxYawSpeed |
| commandwalker | PCPitchRate |
| commandwalker | PCPitchTurnFactor |
| commandwalker | PCSpinRate |
| commandwalker | PCTurnRate |
| commandwalker | PCYawTurnFactor |
| commandwalker | PilotAnimation |
| commandwalker | PilotPosition |
| commandwalker | PitchFilter |
| commandwalker | PitchLimits |
| commandwalker | PitchRate |
| commandwalker | PitchTurnFactor |
| commandwalker | Radius |
| commandwalker | RepMusic |
| commandwalker | ReserveOneForPlayer |
| commandwalker | ScanningRange |
| commandwalker | SmashParkedFlyers |
| commandwalker | SoldierCollision |
| commandwalker | SpawnPointCount |
| commandwalker | SpawnPointLocation |
| commandwalker | StompDecal |
| commandwalker | StompDecalSize |
| commandwalker | StompDetectionType |
| commandwalker | StompEffect |
| commandwalker | StoppedTurnSpeed |
| commandwalker | TargetableCollision |
| commandwalker | TEMP_AnimationSpeed |
| commandwalker | TEMP_Type |
| commandwalker | TerrainCollision |
| commandwalker | TerrainLeft |
| commandwalker | TerrainRight |
| commandwalker | ThirdPersonFOV |
| commandwalker | TiltValue |
| commandwalker | TowCableCollision |
| commandwalker | TrackCenter |
| commandwalker | TrackOffset |
| commandwalker | TransmitRange |
| commandwalker | TurnFilter |
| commandwalker | TurningOffSound |
| commandwalker | TurnOffSound |
| commandwalker | TurnOffTime |
| commandwalker | TurnOnSound |
| commandwalker | TurnOnTime |
| commandwalker | TurnRate |
| commandwalker | TurnThreshold |
| commandwalker | TurretActivateSound |
| commandwalker | TurretAmbientSound |
| commandwalker | TurretDeactivateSound |
| commandwalker | TurretNodeName |
| commandwalker | TurretPitchSound |
| commandwalker | TurretPitchSoundPitch |
| commandwalker | TurretStartSound |
| commandwalker | TurretStopSound |
| commandwalker | TurretYawSound |
| commandwalker | TurretYawSoundPitch |
| commandwalker | Value_ATK_Alliance |
| commandwalker | Value_ATK_CIS |
| commandwalker | Value_ATK_Empire |
| commandwalker | Value_ATK_Locals |
| commandwalker | Value_ATK_Republic |
| commandwalker | Value_DEF_Alliance |
| commandwalker | Value_DEF_CIS |
| commandwalker | Value_DEF_Empire |
| commandwalker | Value_DEF_Locals |
| commandwalker | Value_DEF_Republic |
| commandwalker | ValueBleed |
| commandwalker | VehicleCollision |
| commandwalker | VehicleCollisionSound |
| commandwalker | VehiclePosition |
| commandwalker | VehicleType |
| commandwalker | WalkerLegPair |
| commandwalker | WalkerOrientRoll |
| commandwalker | WALKERSECTION |
| commandwalker | WalkerWidth |
| commandwalker | WaterDamageAmount |
| commandwalker | WaterDamageInterval |
| commandwalker | WeaponAmmo |
| commandwalker | WeaponName |
| commandwalker | WEAPONSECTION |
| commandwalker | YawLimits |
| commandwalker | YawTurnFactor |
| destruct | AimAzimuth |
| destruct | AimDistance |
| destruct | AimElevation |
| destruct | ChargeSound |
| destruct | ClassLabel |
| destruct | ExplosionClass |
| destruct | IconTexture |
| destruct | InitialSalvoDelay |
| destruct | MaxPressedTime |
| destruct | RoundsPerClip |
| destruct | SalvoCount |
| destruct | SalvoDelay |
| destruct | ScatterDistance |
| destruct | SelfDestructSoundPitch |
| destruct | StrikeOrdnanceName |
| destructablebuilding | ClassLabel |
| destructablebuilding | ExplosionName |
| destructablebuilding | GeometryName |
| destructablebuilding | MapScale |
| destructablebuilding | MapTexture |
| destructablebuilding | MaxHealth |
| destructablebuilding | UnbuiltGeometryName |
| destructablebuilding | UnbuiltHoloOdf |
| detonator | AnimationBank |
| detonator | AutoAimSize |
| detonator | ClassLabel |
| detonator | FirePointName |
| detonator | InitialSalvoDelay |
| detonator | LockOnRange |
| detonator | LockTime |
| detonator | MaxSpread |
| detonator | MaxStrength |
| detonator | MinSpread |
| detonator | MinStrength |
| detonator | OrdnanceName |
| detonator | ReloadSound |
| detonator | ReloadTime |
| detonator | RoundsPerClip |
| detonator | SalvoCount |
| detonator | SalvoDelay |
| detonator | ShotDelay |
| detonator | TrackingSound |
| detonator | WEAPONSECTION |
| disguise | AnimationBank |
| disguise | ClassLabel |
| disguise | DisguiseOwnerModel |
| disguise | GeometryName |
| disguise | IconTexture |
| disguise | Label |
| disguise | RoundsPerClip |
| dispenser | AnimationBank |
| dispenser | AutoAimSize |
| dispenser | ChangeModeSound |
| dispenser | ChargeSound |
| dispenser | ChargeSoundPitch |
| dispenser | ClankLeftRunSound |
| dispenser | ClankLeftWalkSound |
| dispenser | ClankRightRunSound |
| dispenser | ClankRightWalkSound |
| dispenser | ClassLabel |
| dispenser | Discharge |
| dispenser | FireEmptySound |
| dispenser | FireLoopSound |
| dispenser | FireSound |
| dispenser | ForceFireAnimation |
| dispenser | GeometryName |
| dispenser | HighResGeometry |
| dispenser | IconTexture |
| dispenser | InitialSalvoDelay |
| dispenser | JumpSound |
| dispenser | LandSound |
| dispenser | LockOnRange |
| dispenser | LockTime |
| dispenser | MaxItems |
| dispenser | MaxPressedTime |
| dispenser | MaxSpread |
| dispenser | MaxStrength |
| dispenser | MinSpread |
| dispenser | MinStrength |
| dispenser | ModeTexture |
| dispenser | ModeTextureColor |
| dispenser | MuzzleFlash |
| dispenser | OrdnanceName |
| dispenser | OverheatSound |
| dispenser | OverheatSoundPitch |
| dispenser | OverheatStopSound |
| dispenser | ProneSound |
| dispenser | RefillFromItem |
| dispenser | ReloadSound |
| dispenser | ReloadTime |
| dispenser | ReticuleTexture |
| dispenser | RollSound |
| dispenser | RoundsPerClip |
| dispenser | SalvoCount |
| dispenser | SalvoDelay |
| dispenser | ShotDelay |
| dispenser | SquatSound |
| dispenser | StandSound |
| dispenser | TargetAnimal |
| dispenser | TargetBuilding |
| dispenser | TargetDroid |
| dispenser | TargetEnemy |
| dispenser | TargetFriendly |
| dispenser | TargetNeutral |
| dispenser | TargetPerson |
| dispenser | TargetVehicle |
| dispenser | TrackingSound |
| dispenser | TriggerAll |
| dispenser | WeaponChangeSound |
| dispenser | WEAPONSECTION |
| droid | Acceleration |
| droid | Acceleraton |
| droid | AddHealth |
| droid | AimerPitchLimits |
| droid | AimerYawLimits |
| droid | AimValue |
| droid | AISizeType |
| droid | Ambient2Sound |
| droid | AmbientSound |
| droid | BankAngle |
| droid | BankFilter |
| droid | BuildingCollision |
| droid | CameraDistance |
| droid | CameraHeight |
| droid | ClassLabel |
| droid | CollisionScale |
| droid | DeathSound |
| droid | Deceleration |
| droid | DropItemClass |
| droid | DropItemProbability |
| droid | ExplosionName |
| droid | EyePointOffset |
| droid | FLYERSECTION |
| droid | ForwardSpeed |
| droid | GeometryName |
| droid | GravityScale |
| droid | HealthTexture |
| droid | HealthType |
| droid | HurtSound |
| droid | ImpactEffectWater |
| droid | Label |
| droid | LevelDamp |
| droid | LevelSpring |
| droid | LiftDamp |
| droid | LiftSpring |
| droid | MapScale |
| droid | MapTexture |
| droid | MaxHealth |
| droid | MaxSpeed |
| droid | MaxStrafeSpeed |
| droid | MaxTurnSpeed |
| droid | MoveTension |
| droid | NextDropItem |
| droid | NormalDirection |
| droid | OrdnanceCollision |
| droid | PCMaxStrafeSpeed |
| droid | PCMaxTurnSpeed |
| droid | PilotType |
| droid | PitchFilter |
| droid | PitchLimits |
| droid | PitchRate |
| droid | ReverseSpeed |
| droid | ScanningRange |
| droid | SetAltitude |
| droid | SoldierCollision |
| droid | SpinRate |
| droid | StrafeSpeed |
| droid | TiltValue |
| droid | TrackOffset |
| droid | Traction |
| droid | TrakCenter |
| droid | TransmitRange |
| droid | TurnFilter |
| droid | TurnRate |
| droid | VehicleCollision |
| droid | VehicleType |
| droid | WeaponAmmo |
| droid | WeaponChannel |
| droid | WeaponName |
| droid | WEAPONSECTION |
| droid | YawLimits |
| dusteffect | Alpha |
| dusteffect | CameraDistance |
| dusteffect | ClassLabel |
| dusteffect | GeometryName |
| dusteffect | HeightScale |
| dusteffect | MaxDistance |
| dusteffect | MaxLifeTime |
| dusteffect | MaxPos |
| dusteffect | MaxSize |
| dusteffect | MaxVel |
| dusteffect | MinDistance |
| dusteffect | MinLifeTime |
| dusteffect | MinPos |
| dusteffect | MinSize |
| dusteffect | MinVel |
| dusteffect | NumParticles |
| dusteffect | RadiusFadeMax |
| dusteffect | RadiusFadeMin |
| dusteffect | SpawnSound |
| dusteffect | Texture |
| emitterordnance | AnimalScale |
| emitterordnance | BuildingScale |
| emitterordnance | ClassLabel |
| emitterordnance | ConeAngle |
| emitterordnance | ConeLength |
| emitterordnance | Damage |
| emitterordnance | DamageThreshold |
| emitterordnance | DroidScale |
| emitterordnance | FirstRadius |
| emitterordnance | ImpactEffectWater |
| emitterordnance | JumpDeduction |
| emitterordnance | LightningEffect |
| emitterordnance | MaxDamage |
| emitterordnance | MaxJumpDistance |
| emitterordnance | MaxTargets |
| emitterordnance | OrdnanceSound |
| emitterordnance | PersonScale |
| emitterordnance | Push |
| emitterordnance | ShieldScale |
| emitterordnance | VehicleScale |
| explosion | AnimalScale |
| explosion | ArmorScale |
| explosion | BuildingScale |
| explosion | ChunkGeometryName |
| explosion | ChunkOmega |
| explosion | ChunkPhysics |
| explosion | ChunkSpeed |
| explosion | ChunkStartDistance |
| explosion | ChunkTerrainCollisions |
| explosion | ChunkTrailEffect |
| explosion | ClassLabel |
| explosion | CollisionSound |
| explosion | Damage |
| explosion | DamageRadius |
| explosion | DamageRadiusInner |
| explosion | DamageRadiusOuter |
| explosion | DeathSound |
| explosion | Decal |
| explosion | DroidScale |
| explosion | Effect |
| explosion | HealthScale |
| explosion | ImpactEffectWater |
| explosion | LaserGlowColor |
| explosion | LifeSpan |
| explosion | LightColor |
| explosion | LightDuration |
| explosion | LightRadius |
| explosion | NumChunks |
| explosion | PersonScale |
| explosion | Push |
| explosion | PushRadius |
| explosion | PushRadiusInner |
| explosion | PushRadiusOuter |
| explosion | Shake |
| explosion | ShakeLength |
| explosion | ShakeRadius |
| explosion | ShakeRadiusInner |
| explosion | ShakeRadiusOuter |
| explosion | ShieldScale |
| explosion | SoundProperty |
| explosion | VehicleScale |
| explosion | WaterEffect |
| fatray | AnimalScale |
| fatray | BuildingScale |
| fatray | ClassLabel |
| fatray | DamageDeduction |
| fatray | DroidScale |
| fatray | ExplosionName |
| fatray | Gravity |
| fatray | ImpactEffectWater |
| fatray | LifeSpan |
| fatray | MaxDamage |
| fatray | MaxPush |
| fatray | MinDamage |
| fatray | MinPush |
| fatray | OrdnanceSound |
| fatray | PersonScale |
| fatray | PushDeduction |
| fatray | RayRadius |
| fatray | Rebound |
| fatray | ShieldScale |
| fatray | TrailEffect |
| fatray | TurnRate |
| fatray | VehicleScale |
| fatray | Velocity |
| fatray | WaverRate |
| fatray | WaverTurn |
| flyer | Acceleraton |
| flyer | AfterburnerOffSound |
| flyer | AfterburnerOnSound |
| flyer | AfterburnerSpeed |
| flyer | AimerNodeName |
| flyer | AimerPitchLimits |
| flyer | AimerPitchLimts |
| flyer | AimerYawLimits |
| flyer | AimerYawLimts |
| flyer | AimTension |
| flyer | AllMusic |
| flyer | AnimationName |
| flyer | AvailableForAnyTeam |
| flyer | BankAngle |
| flyer | BankFilter |
| flyer | BarrelLength |
| flyer | BarrelNodeName |
| flyer | BarrelRecoil |
| flyer | BuildingCollision |
| flyer | ChunkBounciness |
| flyer | ChunkGeometryName |
| flyer | ChunkNodeName |
| flyer | ChunkOmega |
| flyer | ChunkPhysics |
| flyer | CHUNKSECTION |
| flyer | ChunkSmokeEffect |
| flyer | ChunkSmokeNodeName |
| flyer | ChunkSpeed |
| flyer | ChunkStickiness |
| flyer | ChunkTerrainCollisions |
| flyer | ChunkTerrainEffect |
| flyer | ChunkTrailEffect |
| flyer | ChunkUpFactor |
| flyer | CISMusic |
| flyer | ClassLabel |
| flyer | CockpitTension |
| flyer | CollisionInflict |
| flyer | CollisionScale |
| flyer | CollisionThreshold |
| flyer | DamageAttachPoint |
| flyer | DamageEffect |
| flyer | DamageEffectScale |
| flyer | DamageInheritVelocity |
| flyer | DamageStartPercent |
| flyer | DamageStopPercent |
| flyer | DeathSound |
| flyer | EngineSound |
| flyer | ExplosionCritical |
| flyer | ExplosionDestruct |
| flyer | EyePointCenter |
| flyer | EyePointOffset |
| flyer | FinAnimation |
| flyer | FireNodeName |
| flyer | FireOutsideLimits |
| flyer | FirePointName |
| flyer | FirstPerson |
| flyer | FirstPersonFOV |
| flyer | FLYERSECTION |
| flyer | FoleyFXGroup |
| flyer | ForceMode |
| flyer | GeometryName |
| flyer | HealthTexture |
| flyer | HealthType |
| flyer | HitLocation |
| flyer | HurtSound |
| flyer | ImpMusic |
| flyer | IsPilotExposed |
| flyer | Label |
| flyer | LandedHeight |
| flyer | LandingSpeed |
| flyer | LandingTime |
| flyer | LandSound |
| flyer | LevelFilter |
| flyer | MapScale |
| flyer | MapTexture |
| flyer | MaxHealth |
| flyer | MaxSpeed |
| flyer | MidSpeed |
| flyer | MinSpeed |
| flyer | MountPos |
| flyer | MoveTension |
| flyer | MoveTensionX |
| flyer | MoveTensionY |
| flyer | MoveTensionZ |
| flyer | Music |
| flyer | MusicDelay |
| flyer | MusicSpeed |
| flyer | NextAimer |
| flyer | NextBarrel |
| flyer | NormalDirection |
| flyer | OrdnanceCollision |
| flyer | PCPitchRate |
| flyer | PCPitchTurnFactor |
| flyer | PCSpinRate |
| flyer | PCTurnRate |
| flyer | PCYawTurnFactor |
| flyer | PilotAnimation |
| flyer | PilotPosition |
| flyer | PilotSkillRepairScale |
| flyer | PitchFilter |
| flyer | PitchLimits |
| flyer | PitchRate |
| flyer | PitchTurnFactor |
| flyer | PPitchRate |
| flyer | RepMusic |
| flyer | ReserveOneForPlayer |
| flyer | SoldierCollision |
| flyer | StatusTexture |
| flyer | StrafeRollAngle |
| flyer | StrafeSpeed |
| flyer | TakeoffHeight |
| flyer | TakeoffSound |
| flyer | TakeoffSpeed |
| flyer | TakeoffTime |
| flyer | TerrainCollision |
| flyer | ThirdPersonFOV |
| flyer | ThrustAttachOffset |
| flyer | ThrustAttachPoint |
| flyer | ThrustEffect |
| flyer | ThrustEffectMaxScale |
| flyer | ThrustEffectMinScale |
| flyer | ThrustEffectScaleStart |
| flyer | ThrustPitchAngle |
| flyer | TiltValue |
| flyer | TrackCenter |
| flyer | TrackOffset |
| flyer | TurnFilter |
| flyer | TurningOffSound |
| flyer | TurnOffSound |
| flyer | TurnOffTime |
| flyer | TurnOnSound |
| flyer | TurnRate |
| flyer | TurretActivateSound |
| flyer | TurretAmbientSound |
| flyer | TurretDeactivateSound |
| flyer | TurretNodeName |
| flyer | TurretPitchSound |
| flyer | TurretPitchSoundPitch |
| flyer | TurretStartSound |
| flyer | TurretStopSound |
| flyer | TurretYawSound |
| flyer | TurretYawSoundPitch |
| flyer | VehicleCollision |
| flyer | VehicleCollisionSound |
| flyer | VehiclePosition |
| flyer | VehicleType |
| flyer | WeaponAmmo |
| flyer | WeaponName |
| flyer | WEAPONSECTION |
| flyer | YawLimits |
| flyer | YawTurnFactor |
| godray | ClassLabel |
| godray | Color |
| godray | GeometryName |
| godray | MaxAlpha |
| godray | MaxLifetime |
| godray | MinAlpha |
| godray | MinLifetime |
| godray | NumRays |
| godray | Radius |
| godray | SpreadRadius |
| grapplinghook | BuildingScale |
| grapplinghook | ClassLabel |
| grapplinghook | DroidScale |
| grapplinghook | ExplosionName |
| grapplinghook | LifeSpan |
| grapplinghook | MaxDamage |
| grapplinghook | OrdnanceSound |
| grapplinghook | PersonScale |
| grapplinghook | ShieldScale |
| grapplinghook | SoldierAnimation |
| grapplinghook | VehicleScale |
| grapplinghook | Velocity |
| grapplinghookweapon | AnimationBank |
| grapplinghookweapon | AutoAimSize |
| grapplinghookweapon | ChangeModeSound |
| grapplinghookweapon | ClassLabel |
| grapplinghookweapon | CrouchMoveSpread |
| grapplinghookweapon | CrouchStillSpread |
| grapplinghookweapon | Discharge |
| grapplinghookweapon | FireEmptySound |
| grapplinghookweapon | FirePointName |
| grapplinghookweapon | FireSound |
| grapplinghookweapon | FlashLightColor |
| grapplinghookweapon | FlashLightDuration |
| grapplinghookweapon | FlashLightRadius |
| grapplinghookweapon | GeometryName |
| grapplinghookweapon | HeatPerShot |
| grapplinghookweapon | HeatRecoverRate |
| grapplinghookweapon | HeatThreshold |
| grapplinghookweapon | HighResGeometry |
| grapplinghookweapon | IconTexture |
| grapplinghookweapon | InitialSalvoDelay |
| grapplinghookweapon | LockOnRange |
| grapplinghookweapon | LockTime |
| grapplinghookweapon | MaxPressedTime |
| grapplinghookweapon | ModeTexture |
| grapplinghookweapon | MuzzleFlash |
| grapplinghookweapon | OrdnanceName |
| grapplinghookweapon | PitchSpread |
| grapplinghookweapon | ProneMoveSpread |
| grapplinghookweapon | ProneStillSpread |
| grapplinghookweapon | ReloadSound |
| grapplinghookweapon | ReloadTime |
| grapplinghookweapon | ReticuleTexture |
| grapplinghookweapon | RoundsPerClip |
| grapplinghookweapon | SalvoCount |
| grapplinghookweapon | SalvoDelay |
| grapplinghookweapon | SalvoTime |
| grapplinghookweapon | ShotDelay |
| grapplinghookweapon | ShotsPerSalvo |
| grapplinghookweapon | SpreadLimit |
| grapplinghookweapon | SpreadPerShot |
| grapplinghookweapon | SpreadRecoverRate |
| grapplinghookweapon | SpreadThreshold |
| grapplinghookweapon | StandMoveSpread |
| grapplinghookweapon | StandStillSpread |
| grapplinghookweapon | TargetAnimal |
| grapplinghookweapon | TargetBuilding |
| grapplinghookweapon | TargetDroid |
| grapplinghookweapon | TargetEnemy |
| grapplinghookweapon | TargetFriendly |
| grapplinghookweapon | TargetNeutral |
| grapplinghookweapon | TargetPerson |
| grapplinghookweapon | TargetVehicle |
| grapplinghookweapon | TriggerSingle |
| grapplinghookweapon | WeaponChangeSound |
| grapplinghookweapon | WEAPONSECTION |
| grapplinghookweapon | YawSpread |
| grapplinghookweapon | ZoomMax |
| grapplinghookweapon | ZoomMin |
| grapplinghookweapon | ZoomRate |
| grasspatch | Alpha |
| grasspatch | BoxSize |
| grasspatch | ClassLabel |
| grasspatch | DarknessMax |
| grasspatch | DarknessMin |
| grasspatch | FlatCount |
| grasspatch | FlatFaceFactor |
| grasspatch | FlatGrassSwing |
| grasspatch | FlatHeight |
| grasspatch | FlatSizeMultiplier |
| grasspatch | GeometryName |
| grasspatch | MaxDistance |
| grasspatch | MaxSize |
| grasspatch | MaxSkew |
| grasspatch | MinSize |
| grasspatch | NumParticles |
| grasspatch | NumParts |
| grasspatch | RadiusFadeMax |
| grasspatch | RadiusFadeMin |
| grasspatch | SkinnyFactor |
| grasspatch | Texture |
| grasspatch | TransparentType |
| grasspatch | YOffset |
| grenade | AnimationBank |
| grenade | AutoAimSize |
| grenade | ChangeModeSound |
| grenade | ChargeDelayHeavy |
| grenade | ChargeDelayLight |
| grenade | ChargeRateHeavy |
| grenade | ChargeRateLight |
| grenade | ChargeSound |
| grenade | ChargeSoundPitch |
| grenade | ClankLeftRunSound |
| grenade | ClankLeftWalkSound |
| grenade | ClankRightRunSound |
| grenade | ClankRightWalkSound |
| grenade | ClassLabel |
| grenade | CollisionOtherSound |
| grenade | DisableTime |
| grenade | Discharge |
| grenade | ExplosionExpire |
| grenade | ExtremeRange |
| grenade | FireEmptySound |
| grenade | FireLoopSound |
| grenade | FireSound |
| grenade | FlashColor |
| grenade | FlashLength |
| grenade | FlashLightColor |
| grenade | ForceFireAnimation |
| grenade | Friction |
| grenade | GeometryName |
| grenade | Gravity |
| grenade | HeatPerShot |
| grenade | HeatRecoverRate |
| grenade | HeatThreshold |
| grenade | HideOnFire |
| grenade | HighResGeometry |
| grenade | IconTexture |
| grenade | ImpactEffect |
| grenade | ImpactEffectWater |
| grenade | InitialSalvoDelay |
| grenade | JumpSound |
| grenade | LandSound |
| grenade | LifeSpan |
| grenade | LightColor |
| grenade | LightRadius |
| grenade | LockOnRange |
| grenade | LockTime |
| grenade | MaxChargeStrengthHeavy |
| grenade | MaxChargeStrengthLight |
| grenade | MaxPressedTime |
| grenade | MaxRange |
| grenade | MinRange |
| grenade | ModeTexture |
| grenade | MuzzleFlash |
| grenade | NextCharge |
| grenade | OptimalRange |
| grenade | OrdnanceEffect |
| grenade | OrdnanceName |
| grenade | OverheatSound |
| grenade | OverheatSoundPitch |
| grenade | OverheatStopSound |
| grenade | PitchSpread |
| grenade | ProneSound |
| grenade | Rebound |
| grenade | RecoilDecayHeavy |
| grenade | RecoilLengthHeavy |
| grenade | RecoilLengthLight |
| grenade | RecoilStrengthHeavy |
| grenade | RecoilStrengthLight |
| grenade | ReloadSound |
| grenade | ReloadTime |
| grenade | ReticuleTexture |
| grenade | RollSound |
| grenade | RoundsPerClip |
| grenade | SalvoCount |
| grenade | SalvoDelay |
| grenade | SalvoTime |
| grenade | ScopeTexture |
| grenade | ShotDelay |
| grenade | ShotElevate |
| grenade | ShotsPerSalvo |
| grenade | SquatSound |
| grenade | StandSound |
| grenade | TargetAnimal |
| grenade | TargetBuilding |
| grenade | TargetDroid |
| grenade | TargetEnemy |
| grenade | TargetFriendly |
| grenade | TargetNeutral |
| grenade | TargetPerson |
| grenade | TargetVehicle |
| grenade | TrailEffect |
| grenade | TriggerSingle |
| grenade | Velocity |
| grenade | WeaponChangeSound |
| grenade | WEAPONSECTION |
| grenade | YawSpread |
| grenade | ZoomMax |
| grenade | ZoomMin |
| grenade | ZoomRate |
| haywire | ClassLabel |
| haywire | CollisionOtherSound |
| haywire | DisableTime |
| haywire | ExplosionExpire |
| haywire | Friction |
| haywire | GeometryName |
| haywire | Gravity |
| haywire | ImpactEffect |
| haywire | ImpactEffectWater |
| haywire | LifeSpan |
| haywire | LightColor |
| haywire | LightRadius |
| haywire | NEXTCHARGE |
| haywire | OrdnanceEffect |
| haywire | Rebound |
| haywire | TrailEffect |
| haywire | Velocity |
| hologram | ClassLabel |
| hologram | Color |
| hologram | EnemyColor |
| hologram | FriendlyColor |
| hologram | HoloBeamIntensity |
| hologram | HoloFadeInTime |
| hologram | HoloFlareIntensity |
| hologram | HoloFlickerAlphaMax |
| hologram | HoloFlickerAlphaMin |
| hologram | HoloFlickerRate |
| hologram | HoloHeight |
| hologram | HoloImageGeometry |
| hologram | HoloImageIntensity |
| hologram | HoloLightIntensity |
| hologram | HoloLightRadius |
| hologram | HoloPopRate |
| hologram | HoloRotateRate |
| hologram | HoloSize |
| hologram | HoloType |
| hologram | HoloVisibleDistance |
| hologram | LocalsColor |
| hologram | NeutralColor |
| hover | Acceleration |
| hover | AddSpringBody |
| hover | AimerNodeName |
| hover | AimerPitchLimits |
| hover | AimerYawLimits |
| hover | AISizeType |
| hover | AllMusic |
| hover | AnimationName |
| hover | AutoAimSize |
| hover | AvailableForAnyTeam |
| hover | BankAngle |
| hover | BankFilter |
| hover | BarrelLength |
| hover | BarrelNodeName |
| hover | BarrelRecoil |
| hover | BlurEffect |
| hover | BlurStart |
| hover | BodyOmegaXSpringFactor |
| hover | BodySpringLength |
| hover | BoostSound |
| hover | BuildingCollision |
| hover | ChunkAngularDamping |
| hover | ChunkBounciness |
| hover | ChunkGeometryName |
| hover | ChunkInitialCollisionSound |
| hover | ChunkLinearDamping |
| hover | ChunkNodeName |
| hover | ChunkOmega |
| hover | ChunkPhysics |
| hover | CHUNKSECTION |
| hover | ChunkSmokeEffect |
| hover | ChunkSmokeNodeName |
| hover | ChunkSpeed |
| hover | ChunkStickiness |
| hover | ChunkTerrainCollisions |
| hover | ChunkTerrainEffect |
| hover | ChunkTrailEffect |
| hover | ChunkUpFactor |
| hover | CISMusic |
| hover | ClassLabel |
| hover | CockpitTension |
| hover | CollisionScale |
| hover | CollisionThreshold |
| hover | DamageAttachPoint |
| hover | DamageEffect |
| hover | DamageEffectScale |
| hover | DamageInheritVelocity |
| hover | DamageStartPercent |
| hover | DamageStopPercent |
| hover | DeathSound |
| hover | Deceleration |
| hover | EngineSound |
| hover | Explosion |
| hover | ExplosionCritical |
| hover | ExplosionDestruct |
| hover | ExplosionName |
| hover | EyePointOffset |
| hover | FinAnimation |
| hover | FireOutsideLimits |
| hover | FirePointName |
| hover | FireSound |
| hover | FirstPerson |
| hover | FirstPersonFOV |
| hover | FLYERSECTION |
| hover | FoleyFXGroup |
| hover | ForceMode |
| hover | ForwardSpeed |
| hover | GeometryName |
| hover | GravityScale |
| hover | GroundedHeight |
| hover | GroundedSound |
| hover | HealthTexture |
| hover | HealthType |
| hover | HierarchyLevel |
| hover | HitLocation |
| hover | HurtSound |
| hover | ImpMusic |
| hover | Label |
| hover | LevelDamp |
| hover | LevelSpring |
| hover | LiftDamp |
| hover | LiftSpring |
| hover | MapScale |
| hover | MapTexture |
| hover | MaxHealth |
| hover | MaxPitchSpeed |
| hover | MaxTurnSpeed |
| hover | MovingTurnOnly |
| hover | Music |
| hover | MusicDelay |
| hover | MusicSpeed |
| hover | NextAimer |
| hover | NextBarrel |
| hover | NoCombatInterrupt |
| hover | NoRandomSpring |
| hover | NormalDirection |
| hover | OmegaXDamp |
| hover | OmegaXSpring |
| hover | OmegaZDamp |
| hover | OmegaZSpring |
| hover | OrdnanceCollision |
| hover | PCPitchRate |
| hover | PCSpinRate |
| hover | PCTurnRate |
| hover | Pilot9Pose |
| hover | PilotAnimation |
| hover | PilotPosition |
| hover | PitchDamp |
| hover | PitchFilter |
| hover | PitchLimits |
| hover | PitchRate |
| hover | PitchTurnFactor |
| hover | ReloadSound |
| hover | RepMusic |
| hover | ReserveOneForPlayer |
| hover | ReverseSpeed |
| hover | SetAltitude |
| hover | SoldierCollision |
| hover | SpinRate |
| hover | StrafeRollAngle |
| hover | StrafeSpeed |
| hover | SuspensionLeftArmNodeName |
| hover | SuspensionMaxOffset |
| hover | SuspensionMidOffset |
| hover | SuspensionNodeName |
| hover | SuspensionRightArmNodeName |
| hover | TargetableCollision |
| hover | ThirdPersonFOV |
| hover | ThrustPitchAngle |
| hover | TiltValue |
| hover | TrackCenter |
| hover | TrackOffset |
| hover | Traction |
| hover | TurnFilter |
| hover | TurningOffSound |
| hover | TurnOffSound |
| hover | TurnOffTime |
| hover | TurnOnSound |
| hover | TurnRate |
| hover | TurretActivateSound |
| hover | TurretAmbientSound |
| hover | TurretDeactivateSound |
| hover | TurretNodeName |
| hover | TurretPitchSound |
| hover | TurretPitchSoundPitch |
| hover | TurretStartSound |
| hover | TurretStopSound |
| hover | TurretYawSound |
| hover | TurretYawSoundPitch |
| hover | VehicleCollision |
| hover | VehicleCollisionSound |
| hover | VehiclePosition |
| hover | VehicleType |
| hover | VelocityDamp |
| hover | VelocitySpring |
| hover | WakeEffect |
| hover | WaterEffect |
| hover | WeaponAmmo |
| hover | WeaponName |
| hover | WEAPONSECTION |
| hover | YawLimits |
| launcher | AnimationBank |
| launcher | AutoAimSize |
| launcher | ChangeModeSound |
| launcher | ChargeDelayHeavy |
| launcher | ChargeDelayLight |
| launcher | ChargeRateHeavy |
| launcher | ChargeRateLight |
| launcher | ChargeSound |
| launcher | ChargeSoundPitch |
| launcher | ClankLeftRunSound |
| launcher | ClankLeftWalkSound |
| launcher | ClankRightRunSound |
| launcher | ClankRightWalkSound |
| launcher | ClassLabel |
| launcher | CrouchMoveSpread |
| launcher | CrouchStillSpread |
| launcher | Discharge |
| launcher | FireEmptySound |
| launcher | FireLoopSound |
| launcher | FirePointName |
| launcher | FireSound |
| launcher | FlashColor |
| launcher | FlashLength |
| launcher | FlashLightColor |
| launcher | FlashLightDuration |
| launcher | FlashLightRadius |
| launcher | FoleyFXGroup |
| launcher | GeometryName |
| launcher | HeatPerShot |
| launcher | HeatRecoverRate |
| launcher | HeatThreshold |
| launcher | HighResGeometry |
| launcher | IconTexture |
| launcher | InitialSalvoDelay |
| launcher | JumpSound |
| launcher | Label |
| launcher | LandSound |
| launcher | LockOffAngle |
| launcher | LockOnAngle |
| launcher | LockOnRange |
| launcher | LockTime |
| launcher | MaxChargeStrengthHeavy |
| launcher | MaxChargeStrengthLight |
| launcher | MaxPressedTime |
| launcher | MaxRange |
| launcher | MaxSpread |
| launcher | MinRange |
| launcher | MinSpread |
| launcher | ModeTexture |
| launcher | MuzzleFlash |
| launcher | OptimalRange |
| launcher | OrdnanceName |
| launcher | PitchSpread |
| launcher | ProneMoveSpread |
| launcher | ProneSound |
| launcher | ProneStillSpread |
| launcher | RecoilDecayHeavy |
| launcher | RecoilDelayHeavy |
| launcher | RecoilLengthHeavy |
| launcher | RecoilLengthLight |
| launcher | RecoilStrengthHeavy |
| launcher | RecoilStrengthLight |
| launcher | ReloadSound |
| launcher | ReloadTime |
| launcher | ReticuleTexture |
| launcher | RollSound |
| launcher | RoundsPerClip |
| launcher | SalvoCount |
| launcher | SalvoDelay |
| launcher | SalvoTime |
| launcher | ScopeTexture |
| launcher | ShotDelay |
| launcher | ShotsPerSalvo |
| launcher | SpreadLimit |
| launcher | SpreadPerShot |
| launcher | SpreadRecoverRate |
| launcher | SpreadThreshold |
| launcher | SquatSound |
| launcher | StandMoveSpread |
| launcher | StandSound |
| launcher | StandStillSpread |
| launcher | TargetAnimal |
| launcher | TargetBuilding |
| launcher | TargetDroid |
| launcher | TargetEnemy |
| launcher | TargetFriendly |
| launcher | TargetNeutral |
| launcher | TargetPerson |
| launcher | TargetVehicle |
| launcher | TrackingSound |
| launcher | TriggerSingle |
| launcher | WeaponChangeSound |
| launcher | WEAPONSECTION |
| launcher | YawSpread |
| launcher | ZoomMax |
| launcher | ZoomMin |
| launcher | ZoomRate |
| leafpatch | Alpha |
| leafpatch | ClassLabel |
| leafpatch | ConeHeight |
| leafpatch | DarknessMax |
| leafpatch | DarknessMin |
| leafpatch | GeometryName |
| leafpatch | Height |
| leafpatch | HeightScale |
| leafpatch | MaxDistance |
| leafpatch | MaxFallingLeaves |
| leafpatch | MaxScatterBirds |
| leafpatch | MaxSize |
| leafpatch | MinSize |
| leafpatch | NumParticles |
| leafpatch | NumParts |
| leafpatch | NumVisible |
| leafpatch | Offset |
| leafpatch | Radius |
| leafpatch | Seed |
| leafpatch | Texture |
| leafpatch | Vine |
| leafpatch | VineLength |
| leafpatch | VineSpread |
| leafpatch | WiggleAmount |
| leafpatch | WiggleSpeed |
| Light | BeamIntensity |
| Light | ClassLabel |
| Light | CodeInitialWidth |
| Light | Color |
| Light | ConeFadeFactor |
| Light | ConeFadeLength |
| Light | ConeInitialWidth |
| Light | ConeLength |
| Light | ConeWidth |
| Light | FlareAngle |
| Light | FlareIntensity |
| Light | FlickerPeriod |
| Light | FlickerType |
| Light | OmniLightRadius |
| Light | OmniRadius |
| Light | Static |
| melee | AnimationBank |
| melee | AutoAimSize |
| melee | ChangeModeSound |
| melee | ClassLabel |
| melee | DeflectSound |
| melee | Discharge |
| melee | FirePointName |
| melee | GeometryName |
| melee | HitSound |
| melee | IconTexture |
| melee | LockOnRange |
| melee | LockTime |
| melee | MaxRange |
| melee | MinRange |
| melee | MuzzleFlash |
| melee | OptimalRange |
| melee | ReloadSound |
| melee | ReloadTime |
| melee | RoundsPerClip |
| melee | SwingTime |
| melee | Texture |
| melee | WeaponChangeSound |
| mine | ClassLabel |
| mine | CollisionFoliageSound |
| mine | CollisionOtherSound |
| mine | CollisionWaterSound |
| mine | ExplosionDeath |
| mine | ExplosionExpire |
| mine | ExplosionTrigger |
| mine | Friction |
| mine | GeometryName |
| mine | Gravity |
| mine | HighResGeometry |
| mine | ImpactEffectWater |
| mine | LifeSpan |
| mine | LightColor |
| mine | LightRadius |
| mine | MaxHealth |
| mine | Rebound |
| mine | SuppressRadius |
| mine | TickSound |
| mine | TickSoundPitch |
| mine | TrailEffect |
| mine | TriggerContact |
| mine | TriggerRadius |
| mine | Velocity |
| missile | AnimalScale |
| missile | ArmorScale |
| missile | BuildingScale |
| missile | ClassLabel |
| missile | CollisionSound |
| missile | Damage |
| missile | DamageRadius |
| missile | DroidScale |
| missile | Explosion |
| missile | ExplosionExpire |
| missile | ExplosionName |
| missile | GeometryName |
| missile | Gravity |
| missile | HealthScale |
| missile | ImpactEffect |
| missile | ImpactEffectWater |
| missile | LifeSpan |
| missile | LightColor |
| missile | LightRadius |
| missile | LockedOnSound |
| missile | MaxDamage |
| missile | NEXTCHARGE |
| missile | OrdnanceEffect |
| missile | OrdnanceSound |
| missile | PersonScale |
| missile | Rebound |
| missile | RecoilDecayHeavy |
| missile | RecoilLengthHeavy |
| missile | RecoilStrengthHeavy |
| missile | ShieldScale |
| missile | TrailEffect |
| missile | TurnRate |
| missile | VehicleScale |
| missile | Velocity |
| missile | WaverRate |
| missile | WaverTurn |
| powerupitem | ClassLabel |
| powerupitem | CollisionOtherSound |
| powerupitem | Friction |
| powerupitem | GeometryName |
| powerupitem | GeometryScale |
| powerupitem | Gravity |
| powerupitem | Lifespan |
| powerupitem | Lighting |
| powerupitem | Powerupsound |
| powerupitem | Rebound |
| powerupitem | SoldierAmmo |
| powerupitem | SoldierHealth |
| powerupitem | Velocity |
| powerupstation | ActiveRotateNode |
| powerupstation | ActiveSpinNode |
| powerupstation | AmbientSound |
| powerupstation | BuildingCollisionPrim |
| powerupstation | BuiltSound |
| powerupstation | ClassLabel |
| powerupstation | DestroyedGeometryName |
| powerupstation | EffectRegion |
| powerupstation | ExplosionName |
| powerupstation | FoleyFXGroup |
| powerupstation | GeometryName |
| powerupstation | HealthType |
| powerupstation | IdleRotateSpeed |
| powerupstation | IdleWaitTime |
| powerupstation | IdleWobbleFactor |
| powerupstation | IdleWobbleLeftFoot |
| powerupstation | IdleWobbleNode |
| powerupstation | IdleWobbleRightFoot |
| powerupstation | Label |
| powerupstation | Lighting |
| powerupstation | MapScale |
| powerupstation | MapTexture |
| powerupstation | MaxHealth |
| powerupstation | OrdnanceCollisionPrim |
| powerupstation | PowerupDelay |
|powerupstation | Powerupsound |
|powerupstation | Radius |
|powerupstation | SoldierAmmo |
|powerupstation | SoldierCollisionPrim |
|powerupstation | SoldierHealth |
|powerupstation | TerrainCollisionPrim |
|powerupstation | UnbuiltGeometryName |
|powerupstation | UnbuiltHoloOdf |
|powerupstation | VehicleAmmo |
|powerupstation | VehicleCollisionPrim |
|powerupstation | VehicleHealth |
|prop | AttachEffect |
|prop | AttachOdf |
|prop | AttachToHardPoint |
|prop | BUILDINGSECTION |
|prop | ClassLabel |
|prop | CollisionScale |
|prop | DamageAttachPoint |
|prop | DamageEffect |
|prop | DamageEffectScale |
|prop | DamageInheritVelocity |
|prop | DamageStartPercent |
|prop | DamageStopPercent |
|prop | DenyFlyerLand |
|prop | DestroyedGeometryName |
|prop | Emitter |
|prop | ExplosionName |
|prop | FoleyFXGroup |
|prop | GeometryColorMax |
|prop | GeometryColorMin |
|prop | GeometryName |
|prop | GeometryScale |
|prop | Label |
|prop | LowResModel |
|prop | MapScale |
|prop | MapTexture |
|prop | MaxHealth |
|prop | OrdnanceCollision |
|prop | SoldierCollision |
|prop | SoundProperty |
|prop | SwingSpeed |
|prop | UseVCollForFlyers |
|prop | VehicleCollision |
|prop | VehicleCollisionOnly |
|prop | VehicleCollisionPrim |
|remote | AnimationBank |
|remote | AutoAimSize |
|remote | ChangeModeSound |
|remote | ClassLabel |
|remote | Discharge |
|remote | FireEmptySound |
|remote | FireSound |
|remote | GeometryName |
|remote | IconTexture |
|remote | InitialSalvoDelay |
|remote | LockOnRange |
|remote | LockTime |
|remote | MaxSpread |
|remote | MinSpread |
|remote | MuzzleFlash |
|remote | OrdnanceName |
|remote | ReloadSound |
|remote | ReloadTime |
|remote | RoundsPerClip |
|remote | SalvoCount |
|remote | SalvoDelay |
|remote | ShotDelay |
|remote | SwitchImmediately |
|remote | TrackingSound |
|remote | WeaponChangeSound |
|remote | ZoomMax |
|remote | ZoomMin |
|remote | ZoomRate |
|repair | AnimationBank |
|repair | BuildingAmmo |
|repair | BuildingBuild |
|repair | BuildingHealth |
|repair | BuildingRebuild |
|repair | ChangeModeSound |
|repair | ChargeSound |
|repair | ClankLeftRunSound |
|repair | ClankLeftWalkSound |
|repair | ClankRightRunSound |
|repair | ClankRightWalkSound |
|repair | ClassLabel |
|repair | Discharge |
|repair | DroidHealth |
|repair | FireEmptySound |
|repair | FireLoopSound |
|repair | FirePointName |
|repair | FireSound |
|repair | GeometryName |
|repair | HeatPerShot |
|repair | HeatRecoverRate |
|repair | HeatThreshold |
|repair | HighResGeometry |
|repair | IconTexture |
|repair | JumpSound |
|repair | LandSound |
|repair | LockOnAngle |
|repair | LockOnRange |
|repair | ModeTexture |
|repair | ModeTextureColor |
|repair | MuzzleFlashEffect |
|repair | OverheatSound |
|repair | OverheatSoundPitch |
|repair | OverheatStopSound |
|repair | ProneSound |
|repair | RecoilLengthHeavy |
|repair | RecoilLengthLight |
|repair | RecoilStrengthHeavy |
|repair | RecoilStrengthLight |
|repair | ReloadSound |
|repair | ReloadTime |
|repair | ReticuleTexture |
|repair | RollSound |
|repair | RoundsPerClip |
|repair | ShotDelay |
|repair | SquatSound |
|repair | StandSound |
|repair | TargetAnimal |
|repair | TargetBuilding |
|repair | TargetDroid |
|repair | TargetEnemy |
|repair | TargetFriendly |
|repair | TargetNeutral |
|repair | TargetPerson |
|repair | TargetVehicle |
|repair | TriggerSingle |
|repair | VehicleHealth |
|repair | WeaponChangeSound |
|repair | WEAPONSECTION |
|rumbleeffect | ClassLabel |
|rumbleeffect | FXName |
|rumbleeffect | GeometryName |
|rumbleeffect | MaxDelayHeavy |
|rumbleeffect | MaxDelayLight |
|rumbleeffect | MaxHeavy |
|rumbleeffect | MaxHeavyDecay |
|rumbleeffect | MaxInterval |
|rumbleeffect | MaxLight |
|rumbleeffect | MaxLightDecay |
|rumbleeffect | MaxShakeAmt |
|rumbleeffect | MaxShakeLen |
|rumbleeffect | MaxTimeLeftHeavy |
|rumbleeffect | MaxTimeLeftLight |
|rumbleeffect | MinDelayHeavy |
|rumbleeffect | MinDelayLight |
|rumbleeffect | MinHeavy |
|rumbleeffect | MinHeavyDecay |
|rumbleeffect | MinInterval |
|rumbleeffect | MinLight |
|rumbleeffect | MinLightDecay |
|rumbleeffect | MinShakeAmt |
|rumbleeffect | MinShakeLen |
|rumbleeffect | MinTimeLeftHeavy |
|rumbleeffect | MinTimeLeftLight |
|rumbleeffect | SoundName |
|shell | AnimalScale |
|shell | ArmorScale |
|shell | BuildingScale |
|shell | ClassLabel |
|shell | CollisionOtherSound |
|shell | Damage |
|shell | DroidScale |
|shell | ExplosionExpire |
|shell | ExplosionImpact |
|shell | ExplosionName |
|shell | Friction |
|shell | GeometryName |
|shell | Gravity |
|shell | HealthScale |
|shell | ImpactEffect |
|shell | ImpactEffectWater |
|shell | LifeSpan |
|shell | LightColor |
|shell | LightRadius |
|shell | LockedOnSound |
|shell | MaxDamage |
|shell | NEXTCHARGE |
|shell | OrdnanceEffect |
|shell | OrdnanceSound |
|shell | PersonScale |
|shell | Rebound |
|shell | ShieldScale |
|shell | StickAnimal |
|shell | StickBuilding |
|shell | StickBuildingDead |
|shell | StickBuildingUnbuilt |
|shell | StickDroid |
|shell | StickPerson |
|shell | StickTerrain |
|shell | StickVehicle |
|shell | TrailEffect |
|shell | TurnRate |
|shell | VehicleScale |
|shell | Velocity |
|shell | WaverRate |
|shell | WaverTurn |
|shield | AddShield |
|shield | AddShieldOff |
|shield | ChangeModeSound |
|shield | ChargeSound |
|shield | ClassLabel |
|shield | FireEmptySound |
|shield | FireLoopSound |
|shield | FireSound |
|shield | IconTexture |
|shield | Label |
|shield | LockOnAngle |
|shield | LockOnRange |
|shield | MaxShield |
|shield | ReloadSound |
|shield | ReloadTime |
|shield | RoundsPerClip |
|shield | ShieldEffect |
|shield | ShieldOffset |
|shield | ShieldOffSound |
|shield | ShieldRadius |
|shield | ShieldSound |
|shield | ShotDelay |
|shield | TriggerSingle |
|shield | WeaponChangeSound |
|soldier | Acceleraton |
|soldier | AcquiredTargetSound |
|soldier | AddHealth |
|soldier | AddonAttachJoint |
|soldier | AimFactorMove |
|soldier | AimFactorPostureCrouch |
|soldier | AimFactorPostureProne |
|soldier | AimFactorPostureSpecial |
|soldier | AimFactorPostureStand |
|soldier | AimFactorStrafe |
|soldier | AimValue |
|soldier | AISCDriverGetInSound |
|soldier | AISCDriverGetOutSound |
|soldier | AISCFieldFollowSound |
|soldier | AISCFieldHoldSound |
|soldier | AISCFieldMoveOutSound |
|soldier | AISCGunnerAllClearSound |
|soldier | AISCGunnerGetInSound |
|soldier | AISCGunnerGetOutSound |
|soldier | AISCGunnerSteadySound |
|soldier | AISCPassengerGetInSound |
|soldier | AISCPassengerGetOutSound |
|soldier | AISCPassengerMoveOutSound |
|soldier | AISCPassengerStopSound |
|soldier | AISCResponseNosirSound |
|soldier | AISCResponseYessirSound |
|soldier | AISizeType |
|soldier | AmbientSound |
|soldier | AnimatedAddon |
|soldier | AnimationAddon |
|soldier | AnimationName |
|soldier | ApproachingTargetSound |
|soldier | CameraDistance |
|soldier | CameraHeight |
|soldier | CAMERASECTION |
|soldier | CapturePosts |
|soldier | ChargeSound |
|soldier | ChunkFrequency |
|soldier | ChunkGeometryName |
|soldier | ChunkNodeName |
|soldier | ChunkOmega |
|soldier | ChunkPhysics |
|soldier | CHUNKSECTION |
|soldier | ChunkSpeed |
|soldier | ChunkTerrainCollisions |
|soldier | ChunkTerrainEffect |
|soldier | ChunkTrailEffect |
|soldier | ClassLabel |
|soldier | ClothingRustleSound |
|soldier | CollisionRootScale |
|soldier | CollisionScale |
|soldier | DeathSound |
|soldier | DropItemClass |
|soldier | DropItemProbability |
|soldier | EngineSound |
|soldier | ExplosionName |
|soldier | EyePointOffset |
|soldier | FirstPerson |
|soldier | FirstPersonFOV |
|soldier | FleeSound |
|soldier | FoleyFXClass |
|soldier | FootWaterSplashEffect |
|soldier | GeometryAddon |
|soldier | GeometryLowRes |
|soldier | GeometryName |
|soldier | HealthType |
|soldier | HeardEnemySound |
|soldier | HidingSound |
|soldier | HurtSound |
|soldier | IconTexture |
|soldier | JetDuration |
|soldier | JetEffect |
|soldier | JetFuelCost |
|soldier | JetFuelInitialCost |
|soldier | JetFuelMinBorder |
|soldier | JetFuelRechargeRate |
|soldier | JetJump |
|soldier | JetPush |
|soldier | JetType |
|soldier | JumpSound |
|soldier | Label |
|soldier | LandSound |
|soldier | LeftFootstepSound |
|soldier | LowHealthSound |
|soldier | LowHealthThreshold |
|soldier | MapScale |
|soldier | MapTexture |
|soldier | MaxHealth |
|soldier | MaxSpeed |
|soldier | MaxStrafeSpeed |
|soldier | MaxTurnSpeed |
|soldier | NextDropItem |
|soldier | NoEnterVehicles |
|soldier | OverrideTexture |
|soldier | OverrideTexture2 |
|soldier | PCMaxStrafeSpeed |
|soldier | PCMaxTurnSpeed |
|soldier | PreparingForDamageSound |
|soldier | RightFootstepSound |
|soldier | RollSound |
|soldier | ScanningRange |
|soldier | SCDriverGetInSound |
|soldier | SCDriverGetOutSound |
|soldier | SCFieldFollowSound |
|soldier | SCFieldHoldSound |
|soldier | SCFieldMoveOutSound |
|soldier | SCGunnerAllClearSound |
|soldier | SCGunnerGetInSound |
|soldier | SCGunnerGetOutSound |
|soldier | SCGunnerSteadySound |
|soldier | SCPassengerGetInSound |
|soldier | SCPassengerGetOutSound |
|soldier | SCPassengerMoveOutSound |
|soldier | SCPassengerStopSound |
|soldier | SCResponseNosirSound |
|soldier | SCResponseYessirSound |
|soldier | ShockFadeInTime |
|soldier | ShockFadeOutGain |
|soldier | ShockFadeOutTime |
|soldier | ShockSound |
|soldier | SkeletonLowRes |
|soldier | SkeletonName |
|soldier | SkeletonRootScale |
|soldier | SkeletonRootScaleLowRes |
|soldier | ThirdPersonFOV |
|soldier | TiltValue |
|soldier | TrackCenter |
|soldier | TrackOffset |
|soldier | TransmitRange |
|soldier | TurnOffSound |
|soldier | TurnOffTime |
|soldier | TurnOnSound |
|soldier | UnitType |
|soldier | WakeWaterSplashEffect |
|soldier | WaterSplashEffect |
|soldier | WaterWadingSound |
|soldier | WeaponAmmo1 |
|soldier | WeaponAmmo2 |
|soldier | WeaponAmmo3 |
|soldier | WeaponAmmo4 |
|soldier | WeaponChannel1 |
|soldier | WeaponChannel2 |
|soldier | WeaponChannel3 |
|soldier | WeaponChannel4 |
|soldier | WeaponName1 |
|soldier | WeaponName2 |
|soldier | WeaponName3 |
|soldier | WeaponName4 |
|soldier | WingModel |
|SoundAmbienceStatic | ClassLabel |
|SoundAmbienceStatic | GeometryName |
|SoundAmbienceStatic | GeometryScale |
|SoundAmbienceStatic | MaxDistance |
|SoundAmbienceStatic | MinDistance |
|SoundAmbienceStatic | Sound |
|SoundAmbienceStreaming | ClassLabel |
|SoundAmbienceStreaming | GeometryName |
|SoundAmbienceStreaming | GeometryScale |
|SoundAmbienceStreaming | MaxDistance |
|SoundAmbienceStreaming | MinDistance |
|SoundAmbienceStreaming | Sound |
|sticky | AlignVertical |
|sticky | AnimalScale |
|sticky | BuildingScale |
|sticky | ClassLabel |
|sticky | CollisionOtherSound |
|sticky | DroidScale |
|sticky | ExplosionExpire |
|sticky | ExplosionImpact |
|sticky | Friction |
|sticky | GeometryName |
|sticky | Gravity |
|sticky | ImpactEffect |
|sticky | ImpactEffectWater |
|sticky | LifeSpan |
|sticky | LightColor |
|sticky | LightRadius |
|sticky | MaxDamage |
|sticky | NEXTCHARGE |
|sticky | OrdnanceEffect |
|sticky | OrdnanceSound |
|sticky | PersonScale |
|sticky | Rebound |
|sticky | StickAnimal |
|sticky | StickBuilding |
|sticky | StickBuildingDead |
|sticky | StickBuildingUnbuilt |
|sticky | StickDroid |
|sticky | StickPerson |
|sticky | StickTerrain |
|sticky | StickVehicle |
|sticky | TrailEffect |
|sticky | VehicleScale |
|sticky | Velocity |
|towcable | ArmorScale |
|towcable | CableLength |
|towcable | ClassLabel |
|towcable | CollisionSound |
|towcable | ExplosionName |
|towcable | Gravity |
|towcable | HealthScale |
|towcable | ImpactEffect |
|towcable | ImpactEffectWater |
|towcable | InitialCableLength |
|towcable | LaserLength |
|towcable | LaserWidth |
|towcable | LifeSpan |
|towcable | MaxDamage |
|towcable | OrdnanceEffect |
|towcable | OrdnanceSound |
|towcable | Rebound |
|towcable | ShieldScale |
|towcable | Velocity |
|towcableweapon | AutoAimSize |
|towcableweapon | ClassLabel |
|towcableweapon | DetatchSound |
|towcableweapon | Discharge |
|towcableweapon | FireSound |
|towcableweapon | IconTexture |
|towcableweapon | InitialSalvoDelay |
|towcableweapon | Label |
|towcableweapon | LockOnRange |
|towcableweapon | LockTime |
|towcableweapon | MaxRange |
|towcableweapon | MinRange |
|towcableweapon | OptimalRange |
|towcableweapon | OrdnanceName |
|towcableweapon | RecoilLengthHeavy |
|towcableweapon | RecoilLengthLight |
|towcableweapon | RecoilStrengthHeavy |
|towcableweapon | RecoilStrengthLight |
|towcableweapon | ReloadSound |
|towcableweapon | ReloadTime |
|towcableweapon | ReticuleTexture |
|towcableweapon | RoundsPerClip |
|towcableweapon | SalvoCount |
|towcableweapon | SalvoDelay |
|towcableweapon | ShotDelay |
|towcableweapon | TargetAnimal |
|towcableweapon | TargetBuilding |
|towcableweapon | TargetDroid |
|towcableweapon | TargetEnemy |
|towcableweapon | TargetFriendly |
|towcableweapon | TargetNeutral |
|towcableweapon | TargetPerson |
|towcableweapon | TargetVehicle |
|towcableweapon | WeaponChangeSound |
|towcableweapon | WindSound |
|trap | AnimationName |
|trap | BuildAnimation |
|trap | BuildModelOdf |
|trap | BuildPoint |
|trap | BuiltCollision |
|trap | ChunkBounciness |
|trap | ChunkDeathSpeed |
|trap | ChunkGeometryName |
|trap | ChunkInitialCollisionSound |
|trap | ChunkNodeName |
|trap | ChunkPhysics |
|trap | ChunkScrapeCollisionSound |
|trap | CHUNKSECTION |
|trap | ChunkSimpleFriction |
|trap | ChunkSpeed |
|trap | ChunkTerrainCollisions |
|trap | ChunkVelocityFactor |
|trap | ClassLabel |
|trap | DeathEffect |
|trap | DeathEffectOffset |
|trap | DeathOnCollision |
|trap | DeathTime |
|trap | DestroyedGeometryName |
|trap | GeometryName |
|trap | HideUnbuiltModel |
|trap | MaxHealth |
|trap | MinEnemyRadius |
|trap | RayTriggerMinSpeed |
|trap | RayTriggerWidth |
|trap | ResetTeam |
|trap | TriggerAnimation |
|trap | TriggerCollision |
|trap | TriggerOffset |
|trap | TriggerRadius |
|trap | TriggerSound |
|trap | TriggerTeam |
|trap | UnbuiltGeometryName |
|trap | UnbuiltHoloOdf |
|vehiclepad | ClassAllATK |
|vehiclepad | ClassAllDEF |
|vehiclepad | ClassCISATK |
|vehiclepad | ClassCISDEF |
|vehiclepad | ClassHisATK |
|vehiclepad | ClassImpATK |
|vehiclepad | ClassImpDEF |
|vehiclepad | classLabel |
|vehiclepad | ClassLocATK |
|vehiclepad | ClassRepATK |
|vehiclepad | ClassRepDEF |
|vehiclepad | ControlZone |
|vehiclepad | DecayTime |
|vehiclepad | ExpireTimeEnemy |
|vehiclepad | ExpireTimeField |
|vehiclepad | geometryName |
|vehiclepad | geometryScale |
|vehiclepad | SpawnTime |
|vehiclespawn | ClassAllATK |
|vehiclespawn | ClassAllDEF |
|vehiclespawn | ClassCISATK |
|vehiclespawn | ClassCISDEF |
|vehiclespawn | ClassHisATK |
|vehiclespawn | ClassHisDEF |
|vehiclespawn | ClassImpATK |
|vehiclespawn | ClassImpDEF |
|vehiclespawn | classLabel |
|vehiclespawn | ClassLocATK |
|vehiclespawn | ClassLocDEF |
|vehiclespawn | ClassRepATK |
|vehiclespawn | ClassRepDEF |
|vehiclespawn | ControlZone |
|vehiclespawn | DecayTime |
|vehiclespawn | ExpireTimeEnemy |
|vehiclespawn | ExpireTimeField |
|vehiclespawn | geometryName |
|vehiclespawn | geometryScale |
|vehiclespawn | SpawnTime |
|walker | Acceleraton |
|walker | AimerNodeName |
|walker | AimerPitchLimits |
|walker | AimerYawLimits |
|walker | AimValue |
|walker | AISizeType |
|walker | AllMusic |
|walker | AnimatedPilotPosition |
|walker | AnimationName |
|walker | AutoAimYLimits |
|walker | BarrelNodeName |
|walker | BarrelRecoil |
|walker | BuildingCollision |
|walker | BuildingCollisionPrim |
|walker | ChunkAngularDamping |
|walker | ChunkBounciness |
|walker | ChunkGeometryName |
|walker | ChunkLinearDamping |
|walker | ChunkNodeName |
|walker | ChunkOmega |
|walker | ChunkPhysics |
|walker | CHUNKSECTION |
|walker | ChunkSmokeEffect |
|walker | ChunkSmokeNodeName |
|walker | ChunkSpeed |
|walker | ChunkStickiness |
|walker | ChunkTerrainCollisions |
|walker | ChunkTerrainEffect |
|walker | ChunkTrailEffect |
|walker | ChunkUpFactor |
|walker | CISMusic |
|walker | ClassLabel |
|walker | CockpitChatterStream |
|walker | CockpitTension |
|walker | CollisionInflict |
|walker | CollisionScale |
|walker | CollisionThreshold |
|walker | DamageAttachPoint |
|walker | DamageEffect |
|walker | DamageEffectScale |
|walker | DamageInheritVelocity |
|walker | DamageStartPercent |
|walker | DamageStopPercent |
|walker | DeathAnimationExplosion |
|walker | DeathAnimationExplosionTime |
|walker | DeathDustDelay |
|walker | DeathDustEffect |
|walker | DeathDustOffset |
|walker | DeathSound |
|walker | DropShadowSize |
|walker | EngineSound |
|walker | ExplosionName |
|walker | ExplosionOffset |
|walker | EyePointOffset |
|walker | FinalExplosion |
|walker | FinalExplosionOffset |
|walker | FireOutsideLimits |
|walker | FirePointName |
|walker | FirstPerson |
|walker | FirstPersonFOV |
|walker | FoleyFXClass |
|walker | FoleyFXGroup |
|walker | FootBoneLeft |
|walker | FootBoneRight |
|walker | FootstepSound0 |
|walker | FootStepSound1 |
|walker | FootStepSound2 |
|walker | FootstepSound3 |
|walker | ForceMode |
|walker | ForwardTurnSpeed |
|walker | GeometryName |
|walker | GeometryScale |
|walker | HealthTexture |
|walker | HealthType |
|walker | HierarchyLevel |
|walker | HitLocation |
|walker | HurtSound |
|walker | HydraulicLowerHeight |
|walker | HydraulicLowerSound |
|walker | HydraulicSound |
|walker | HydraulicSoundHeight |
|walker | IgnorableCollsion |
|walker | ImpMusic |
|walker | Label |
|walker | LeftFootstepSound |
|walker | LegBoneLeft |
|walker | LegBoneRight |
|walker | LegBoneTopLeft |
|walker | LegBoneTopRight |
|walker | LegPairCount |
|walker | LegRayHitLength |
|walker | MapScale |
|walker | MapTexture |
|walker | MaxHealth |
|walker | MaxPitchSpeed |
|walker | MaxSpeed |
|walker | MaxStrafeSpeed |
|walker | MaxTerrainAngle |
|walker | MaxTurnSpeed |
|walker | MaxYawSpeed |
|walker | MountPos |
|walker | Music |
|walker | MusicDelay |
|walker | MusicSpeed |
|walker | NextAimer |
|walker | NextBarrel |
|walker | NoCombatInterrupt |
|walker | NoDeathExplosions |
|walker | NormalDirection |
|walker | OrdnanceCollision |
|walker | PCMaxStrafeSpeed |
|walker | PCMaxTurnSpeed |
|walker | PCMaxYawSpeed |
|walker | PCPitchRate |
|walker | PCPitchTurnFactor |
|walker | PCSpinRate |
|walker | PCTurnRate |
|walker | PCYawTurnFactor |
|walker | PilotAnimation |
|walker | PitchLimits |
|walker | PrimaryWeapon |
|walker | RepMusic |
|walker | ReserveOneForPlayer |
|walker | RightFootstepSound |
|walker | SecondaryWeapon |
|walker | SoldierCollision |
|walker | StatusTexture |
|walker | StompDecal |
|walker | StompDecalSize |
|walker | StompDetectionType |
|walker | StompEffect |
|walker | StompThreshold |
|walker | StoppedTurnSpeed |
|walker | TargetableCollision |
|walker | TEMP_AnimationSpeed |
|walker | TEMP_Type |
|walker | TerrainCollision |
|walker | TerrainLeft |
|walker | TerrainRight |
|walker | TiltValue |
|walker | TrackCenter |
|walker | TrackOffset |
|walker | TrakCenter |
|walker | TurningOffSound |
|walker | TurnOffSound |
|walker | TurnOffTime |
|walker | TurnOnSound |
|walker | TurnOnTime |
|walker | TurnThreshold |
|walker | TurretActivateSound |
|walker | TurretAmbientSound |
|walker | TurretDeactivateSound |
|walker | TurretPitchSound |
|walker | TurretPitchSoundPitch |
|walker | TurretStartSound |
|walker | TurretStopSound |
|walker | TurretYawSound |
|walker | TurretYawSoundPitch |
|walker | VehicleCollision |
|walker | VehicleCollisionSound |
|walker | VehiclePosition |
|walker | VehicleType |
|walker | WalkerLegPair |
|walker | WalkerOrientRoll |
|walker | WALKERSECTION |
|walker | WalkerWidth |
|walker | WaterDamageAmount |
|walker | WaterDamageInterval |
|walker | WeaponAmmo |
|walker | WeaponName |
|walker | WEAPONSECTION |
|walker | YawLimits |
|walkerdroid | Acceleraton |
|walkerdroid | AimerNodeName |
|walkerdroid | AimerPitchLimits |
|walkerdroid | AimerYawLimits |
|walkerdroid | AISCDriverGetInSound |
|walkerdroid | AISCDriverGetOutSound |
|walkerdroid | AISCFieldFollowSound |
|walkerdroid | AISCFieldHoldSound |
|walkerdroid | AISCFieldMoveOutSound |
|walkerdroid | AISCGunnerAllClearSound |
|walkerdroid | AISCGunnerGetInSound |
|walkerdroid | AISCGunnerGetOutSound |
|walkerdroid | AISCGunnerSteadySound |
|walkerdroid | AISCPassengerGetInSound |
|walkerdroid | AISCPassengerGetOutSound |
|walkerdroid | AISCPassengerMoveOutSound |
|walkerdroid | AISCPassengerStopSound |
|walkerdroid | AISCResponseNosirSound |
|walkerdroid | AISCResponseYessirSound |
|walkerdroid | AnimationName |
|walkerdroid | BallAcceleration |
|walkerdroid | BallCollision |
|walkerdroid | BallLowResModel |
|walkerdroid | BallMaxLean |
|walkerdroid | BallMinMoveSpeed |
|walkerdroid | BallMoveSpeed |
|walkerdroid | BallMoveThreshold |
|walkerdroid | BallRadius |
|walkerdroid | BallRollingFriction |
|walkerdroid | BallSlippage |
|walkerdroid | BallTurnSpeed |
|walkerdroid | BallWaterDamageHeight |
|walkerdroid | BuildingCollision |
|walkerdroid | CAMERASECTION |
|walkerdroid | ChunkAngularDamping |
|walkerdroid | ChunkGeometryName |
|walkerdroid | ChunkLinearDamping |
|walkerdroid | ChunkNodeName |
|walkerdroid | ChunkOmega |
|walkerdroid | ChunkPhysics |
|walkerdroid | CHUNKSECTION |
|walkerdroid | ChunkSmokeEffect |
|walkerdroid | ChunkSmokeNodeName |
|walkerdroid | ChunkSpeed |
|walkerdroid | ChunkTerrainCollisions |
|walkerdroid | ChunkTerrainEffect |
|walkerdroid | ChunkUpFactor |
|walkerdroid | ClassLabel |
|walkerdroid | DeathDustDelay |
|walkerdroid | DeathDustEffect |
|walkerdroid | DeathDustOffset |
|walkerdroid | DeathSound |
|walkerdroid | DropItemClass |
|walkerdroid | DropItemProbability |
|walkerdroid | EngineSound |
|walkerdroid | ExplosionName |
|walkerdroid | EyePointOffset |
|walkerdroid | FireOutsideLimits |
|walkerdroid | FirstPerson |
|walkerdroid | FirstPersonFOV |
|walkerdroid | FoleyFXClass |
|walkerdroid | FootBoneLeft |
|walkerdroid | FootBoneRight |
|walkerdroid | Footstep0Sound |
|walkerdroid | Footstep1Sound |
|walkerdroid | Footstep2Sound |
|walkerdroid | ForwardTurnSpeed |
|walkerdroid | GeometryName |
|walkerdroid | HealthTexture |
|walkerdroid | HealthType |
|walkerdroid | HurtSound |
|walkerdroid | HydraulicSound |
|walkerdroid | HydraulicSoundHeight |
|walkerdroid | LegBoneLeft |
|walkerdroid | LegBoneRight |
|walkerdroid | LegPairCount |
|walkerdroid | MapScale |
|walkerdroid | MapTexture |
|walkerdroid | MaxBallAngle |
|walkerdroid | MaxHealth |
|walkerdroid | MaxSpeed |
|walkerdroid | MaxStrafeSpeed |
|walkerdroid | MaxTurnSpeed |
|walkerdroid | NextAimer |
|walkerdroid | NextDropItem |
|walkerdroid | OrdnanceCollision |
|walkerdroid | PCMaxStrafeSpeed |
|walkerdroid | PCMaxTurnSpeed |
|walkerdroid | PitchLimits |
|walkerdroid | SCDriverGetInSound |
|walkerdroid | SCDriverGetOutSound |
|walkerdroid | SCFieldFollowSound |
|walkerdroid | SCFieldHoldSound |
|walkerdroid | SCFieldMoveOutSound |
|walkerdroid | SCGunnerAllClearSound |
|walkerdroid | SCGunnerGetInSound |
|walkerdroid | SCGunnerGetOutSound |
|walkerdroid | SCGunnerSteadySound |
|walkerdroid | SCPassengerGetInSound |
|walkerdroid | SCPassengerGetOutSound |
|walkerdroid | SCPassengerMoveOutSound |
|walkerdroid | SCPassengerStopSound |
|walkerdroid | SCResponseNosirSound |
|walkerdroid | SCResponseYessirSound |
|walkerdroid | SoldierCollision |
|walkerdroid | StoppedTurnSpeed |
|walkerdroid | TEMP_AnimationSpeed |
|walkerdroid | TEMP_Type |
|walkerdroid | TerrainCollision |
|walkerdroid | TerrainLeft |
|walkerdroid | TerrainRight |
|walkerdroid | ThirdPersonFOV |
|walkerdroid | TiltValue |
|walkerdroid | TrackCenter |
|walkerdroid | TrackOffset |
|walkerdroid | TurnOffSound |
|walkerdroid | TurnOnSound |
|walkerdroid | TurnThreshold |
|walkerdroid | UprightLowResModel |
|walkerdroid | UprightWaterDamageHeight |
|walkerdroid | VehicleCollision |
|walkerdroid | VehicleType |
|walkerdroid | WakeEffect |
|walkerdroid | WalkerLegPair |
|walkerdroid | WALKERSECTION |
|walkerdroid | WaterDamageAmount |
|walkerdroid | WaterDamageInterval |
|walkerdroid | WeaponAmmo |
|walkerdroid | WeaponName |
|walkerdroid | WEAPONSECTION |
|walkerdroid | YawLimits |
|water | ClassLabel |
|water | GeometryName |
|weapon | AutoAimSize |
|weapon | ChangeModeSound |
|weapon | ChargeSound |
|weapon | ClassLabel |
|weapon | Discharge |
|weapon | FireEmptySound |
|weapon | FireLoopSound |
|weapon | FirePointName |
|weapon | FireSound |
|weapon | FireSoundStop |
|weapon | FlashLightColor |
|weapon | FlashLightDuration |
|weapon | FlashLightRadius |
|weapon | FoleyFXGroup |
|weapon | GeometryName |
|weapon | HeatPerShot |
|weapon | HeatRecoverRate |
|weapon | HeatThreshold |
|weapon | IconTexture |
|weapon | InitialSalvoDelay |
|weapon | KickBuildup |
|weapon | KickSpread |
|weapon | KickStrength |
|weapon | Label |
|weapon | LockOffAngle |
|weapon | LockOnAngle |
|weapon | LockOnRange |
|weapon | LockTime |
|weapon | MaxRange |
|weapon | MaxSpread |
|weapon | MinRange |
|weapon | MinSpread |
|weapon | ModeTexture |
|weapon | MuzzleFlash |
|weapon | OptimalRange |
|weapon | OrdnanceName |
|weapon | OverheatSound |
|weapon | OverheatSoundPitch |
|weapon | OverheatStopSound |
|weapon | PitchSpread |
|weapon | RecoilDecayHeavy |
|weapon | RecoilDelayHeavy |
|weapon | RecoilDelayLight |
|weapon | RecoilLengthHeavy |
|weapon | RecoilLengthLight |
|weapon | RecoilStrengthHeavy |
|weapon | RecoilStrengthLight |
|weapon | ReloadSound |
|weapon | ReloadTime |
|weapon | ReticuleTexture |
|weapon | RoundDelay |
|weapon | RoundsPerClip |
|weapon | RoundsPerSalvo |
|weapon | SalvoCount |
|weapon | SalvoDelay |
|weapon | SalvoTime |
|weapon | ShotDelay |
|weapon | ShotsPerSalvo |
|weapon | SpreadLimit |
|weapon | SpreadPerShot |
|weapon | SpreadRecover |
|weapon | SpreadRecoverRate |
|weapon | SpreadThreshold |
|weapon | TargetAnimal |
|weapon | TargetBuilding |
|weapon | TargetDroid |
|weapon | TargetEnemy |
|weapon | TargetFriendly |
|weapon | TargetNeutral |
|weapon | TargetPerson |
|weapon | TargetVehicle |
|weapon | TriggerSingle |
|weapon | TurretActivateSound |
|weapon | TurretAmbientSound |
|weapon | TurretDeactivateSound |
|weapon | TurretPitchSound |
|weapon | TurretPitchSoundPitch |
|weapon | TurretStartSound |
|weapon | TurretStopSound |
|weapon | TurretYawSound |
|weapon | TurretYawSoundPitch |
|weapon | WeaponChange |
|weapon | WeaponChangeSound |
|weapon | WEAPONSECTION |
|weapon | YawSpread |
|weapon | ZoomMax |
|weapon | ZoomMin |
|weapon | ZoomRate |