# Munged .lvl format notes (Star Wars: Battlefront, 2004)

Notes on the munged `.lvl` formats of the 2004 PC game, written while building
[Battlefront Eternal](https://battlefronteternal.com/), a fan-made engine for the game. They describe
the file formats only: no game files and no code from the game. Where the munged data stores only a
hash, property and file names come from PrismaticFlower's
[swbf-unmunge](https://github.com/PrismaticFlower/swbf-unmunge) hash list. Code paths link to the
engine's GPL-3.0 source. Corrections and additions are welcome.

## Name hashes

Animation banks key bones and clips by CRC-32 of the lowercased name: MSB first, polynomial `0x04C11DB7`, initial value and final xor `0xFFFFFFFF`. Every bone of the trooper skeleton matches its animation track this way.

Entity class properties, instance properties, and localization keys use a 32-bit FNV-1a over each byte OR 0x20. That folds letters to lower case, but it also turns `_` into 0x7f. So for a name with `_` (or `@[\]^`), such as `Value_ATK_CIS`, the hash is not FNV-1a of the lowercased name.

## Animation banks (`zaa_`, `zaf_`)

`common.lvl` has `zaa_` banks `human_animation_0` to `_4`, `_alert`, `_fp` (first person, own skeleton), and `_lowrez`. A `zaf_` with the same name holds that bank's animation skeleton (joint bind pose and a skin).

`zaa_` is `NAME` plus `BIN_`. Inside `BIN_` the chunk tags are byte-reversed:

- `SMNA`: a 24-byte header. Tag, a zero size, 8, the total bone record count, the curve data size, the clip count.
- `MINA`: 16 bytes per clip. Flags, an unused word, the name CRC, frame count (u16), bone count (u16). Flag bit 0 means `DummyRoot` carries the clip's ground travel.
- `TNJA`: 48 bytes per bone per clip. Bone CRC, four rotation curve offsets, three translation curve offsets, translation bias xyz, translation scale. A zero scale means the translation is the constant bias.
- `TADA`: the curves. Each starts with an int16 sample. Each following signed byte is a delta from the last sample, except -128 (hold for the next unsigned byte's count of frames) and -127 (an absolute int16 follows).

Rotations are quaternion xyzw over 2047. A few near-180-degree keys were clamped by the encoder and need renormalizing. Translations are bias + sample × scale. Clips run at 30 fps, and loops repeat their first frame as their last, so a loop lasts (frames − 1) / 30 seconds.

Clip names follow `human_<weapon>_<posture>_<action>`, with an `_alert` variant for the raised-weapon set (`human_animation_alert`), and posture-less clips such as `human_<weapon>_jump`, `_fall`, `_landsoft`, `_landhard`, `_diveforward`, and `_stand_getdown_prone`. The posture-less action names are: jump, jump_up, landsoft, landhard, fall, the thrown_* set, stand_getupfront and stand_getupback, diveforward, jetpack_hover, the four prone transitions, and the stand_death_* set. The extractor names clips by matching CRCs against that scheme.

Locomotion clips (flag bit 0) carry their travel on `DummyRoot`. The travel over one cycle divided by the cycle's duration is the speed the cycle was authored for. At 30 fps the standing run comes out within a few percent of the trooper's `MaxSpeed`. The runtime drops that travel and plays each cycle at ground speed over authored speed, so planted feet stay put.

The turn clips do not rotate the root. They are a foot shuffle that starts and ends in the idle stance, so the body yaw has to be turned in code while they play.

The banks key tracks by bone name, so one bank serves every body with those bones. Bodies don't all list them in the same order: the ARC trooper's skeleton has the clone trooper's 25 bones in a different order, so tracks are matched to bones by name.

## Entity classes (`entc`)

`TYPE`, `BASE` (the engine class, such as `soldier`), then `PROP` chunks: the FNV-1a of the property name and the value as a C string. The whole ODF inheritance chain is flattened into the class. Repeated keys keep their order; `CAMERASECTION` starts a group of `EyePointOffset`, `TrackCenter`, `TrackOffset`, and `TiltValue`.

Two more repeated groups: `CHUNKSECTION` starts one of the pieces a droid blows apart into (`ChunkGeometryName`, `ChunkNodeName`, `ChunkSpeed`, `ChunkOmega`, `ChunkTerrainCollisions`, `ChunkTerrainEffect`, `ChunkTrailEffect`, `ChunkPhysics`), and the drop list is `DropItemClass` (406d2b75) with its `DropItemProbability` (26996dae), `NextDropItem` (5ea04066, value `-`) moving to the next slot. Every Republic and CIS infantry class drops ammo 0.4, health100 0.3, dual 0.1.

`HealthType` (person, animal, droid, vehicle, building) picks which of an ordnance's or explosion's scales hurts a unit; unset is person. `OverrideTexture` re-skins a class's body: the assault droid's `cis_inf_battledroid_blue`, the assassin's `_red`, both over the B1's `cis_inf_battledroid`. The port swaps the texture most of the body uses (and `OverrideTexture2` the next).

The 2004 trooper classes set `MaxSpeed`, `MaxStrafeSpeed`, `MaxTurnSpeed`, `Acceleraton`, the camera sections, and `FirstPersonFOV` / `ThirdPersonFOV`. The acceleration property really is spelled `Acceleraton`. There is no `JumpHeight` in the 2004 engine; the jump is `MaxJumpSpeed`. Properties a class leaves unset take the soldier class defaults listed under engine behavior.

## Models (`modl`, `segm`)

A `modl` is `NAME`, `INFO` (counts, then the bounding box at bytes 12..35), and one `segm` per material. A segment holds `INFO` (the primitive type), `MTRL`, `RTYP` (the render type: `Normal`, `Bump`, `Scroll`, `Specmap`), `TNAM` (a slot number and a texture name), two or three `VBUF`s of the same vertices in different encodings, `IBUF`, and for skinned models `SKIN` and `BMAP`.

- **VBUF:** count, stride, flags, then the vertices. The fields come in this order, each only when its flag is set: position (0x2), bone weights (0x8), bone indices (0x4), normal (0x20), tangent and binormal (0x40), colour (0x80), baked light (0x100), and UV (0x200). Bits 0x1000/0x2000/0x4000/0x8000 select packed forms: positions as int16x4 within the model's box, weights as bytes, vectors as bytes (x, y, z in bytes 2, 1, 0, scaled to −1..1), UVs as int16 over 2048. The extractor reads the uncompressed buffer with the most fields. All encodings hold the same data.
- **Vertex colours** (0x80 and 0x100) are D3DCOLORs stored B, G, R, A. A 0x80 colour is a tint on the material; a 0x100 colour is baked light. They never appear together.
- **Tangents:** the tangent follows +u and the binormal +v of the raw UVs (v runs down the texture). About 1% of float tangents are NaN; the extractor builds a basis from the normal for those.
- **SKIN** is a vertex count, a type, then the vertices' bones as slots of `BMAP` (a list of skeleton indices). Type 1, a hard skin, is one byte per vertex, and the vertices are in their bone's space. Type 3, a soft skin, is five bytes per vertex: two weights out of 255 (the third weight is what remains), then three slots. The vertices of a soft skin are already in the model's space, and its `VBUF` carries the same weights and indices (flags 0x8 and 0x4; the index bytes are stored in reverse). Stock BF1 uses soft skins for Vader's and Dooku's capes, the sarlacc tentacle, Endor's log trap and the fambaa. Jabba's Palace uses them for the Gamorrean guard, Jabba, the rancor and the torture droid. The renderer blends by the `VBUF`'s float weights; `SKIN`'s bytes are the same rounded to 1/255. An animated prop keeps each vertex's three bones and weights (`props.json` `skinJoints`, `skinWeights`; docs/live-objects.md "Animated props and the sarlacc"); soldiers and vehicles give each soft-skinned vertex its heaviest bone and leave it where it is.
- **MTRL** is a u32 of flags, then two more u32s when bit 0x10 is set. Bits: 0x1 lit, 0x2 alpha test, 0x4 alpha blend, 0x10 two parameters follow, 0x20 specular, 0x40 baked lighting, 0x80 additive, 0x400 scrolling (only a marker). The parameters are a specular exponent and a 0x00RRGGBB colour when 0x20 is set, or two float scroll speeds in repeats per second.
- **TNAM:** slot 0 is the diffuse texture, slot 1 the bump map: a tangent-space normal map with green toward +v.
- **Levels of detail:** `gmod` lists a model's `LOD0` and, for most buildings, `LOWD`, a low-detail model named `<model>LOWD` with its own `_lowrez` textures.
- **Bounds:** a SWBF1 model `INFO` is 68 bytes: three counts, the vertex box, a second box, and two more words. `SPHR` is its bounding sphere (centre, radius). The engine locks onto and aims at a building by the second box's middle and half its diagonal (the gun turret: (0, 1.653, 0.323), radius 3.008), and onto a build pad by its sphere.

## Weapons (`wpnc`, `ordc`, `expc`)

Weapon, ordnance, and explosion classes are laid out like entity classes: `TYPE`, `BASE` (the engine class), and `PROP` chunks. The ODF chain is flattened, so a key can repeat and the last value wins.

- **Bases:** weapons `cannon` (rifles, pistols, the wrist blasters, the arc caster), `grenade` (grenades and the mortar), `launcher`, `dispenser` (mines and power-ups), `repair` (the fusion cutter), `remote` (the recon droid), `destruct` (the droid's orbital strike); ordnance `bolt`, `bullet` (rockets), `missile`, `shell`, `sticky` (grenades), `emitterordnance` (the arc caster's lightning); `explosion`.
- **Loadout:** the soldier class sets `WeaponName<N>`, `WeaponAmmo<N>` (clips counting the loaded one; 0 is unlimited), and `WeaponChannel<N>` (0 the primary trigger, 1 the secondary). The clone trooper carries the rifle (4 clips of 60) and pistol on the primary, and EMP (3) and concussion (2) grenades on the secondary.
- **The chain:** a weapon's `OrdnanceName` names its ordnance class, whose `ExplosionExpire` names the explosion. Classes the side archive doesn't hold come from `common.lvl`.
- **Models:** `GeometryName` is the model held in `hp_weapons`, with `hp_fire` (`FirePointName`) at the muzzle. Grenades fly as their ordnance's `GeometryName`.
- **Charge levels:** `NextCharge t` (8316f444) starts a copy of the weapon class as read so far, which the keys after it change, up to the next one. The mortar's base level fires `_ord1` (a shell) and its `NextCharge 0.9` level `_ord` (a sticky grenade); the arc caster's four levels only raise `HeatPerShot`.
- **Shot patterns:** `ShotPatternCount` and one `ShotPatternPitchYaw p y` per round, in degrees, positive pitch down. The super battle droid's shrapnel is (−0.1, −0.8), (0.8, 0), (−0.1, 0.8). `ShotPatternCount` starts a new list and a `NextCharge` level starts with none, so each charge level's entries are its own; the runtime takes the last `ShotPatternCount` of such a list.
- **Other keys:** `KickStrength` (degrees) and `KickBuildup` (the aim kick), `HideOnFire` (5578d44c), `ShotElevate` (ae3db60d), `SniperScope` (f15aaeb2). `KickSpread` and `SpreadRecover` are older names for `SpreadPerShot` and `SpreadRecoverRate`.
- **Keys the 2004 game ignores:** the retail weapon classes also set `Discharge` (8b83f9b7, `small_smoke_effect` on most guns), `ModeTexture` (54e9f4e5, a fire-mode icon: `HUD_weap_fullauto` on rifles, `HUD_weap_semiauto` on pistols, `HUD_weap_scatter` on the two shotguns, `HUD_weap_charge` on bowcasters) and `ChangeModeSound` (c77178c1). The 2004 game uses none of the three: it plays no discharge smoke, shows no fire-mode icon and has no fire modes to switch; a gun fires the one way its class describes. An ordnance's `MaxDamage` is the same field as `Damage`; the shotguns' bolts name only `MaxDamage` (55).
- **Dispensers:** `OrdnanceName` names an entity class (`entc`), not ordnance: `com_weap_inf_landmine` (base `mine`) or `com_item_powerup_dual` (base `powerupitem`). They add `Velocity`, `MinStrength`, `MaxStrength`, and `MaxItems`. Items read `LifeSpan`, `Gravity`, `Rebound`, `Friction`, `LightColor`, `LightRadius`; mines `ExplosionTrigger` (also `ExplosionName` or `Explosion`), `ExplosionDeath`, `TriggerRadius`, `SuppressRadius`; power-ups `PersonHealth` … `BuildingAmmo`, which `SoldierHealth` and `SoldierAmmo` write for persons and droids together.
- **Repair weapons:** amounts per tick for each health type (`PersonHealth` … `BuildingHealth`), `BuildingRebuild` (a wreck), and `BuildingBuild` (a pad), the same for ammo; `ShotDelay` defaults to 0.125 and `TriggerSingle` to 0.
- **Remote weapons:** `OrdnanceName` is the droid's class (base `droid`), with `SwitchImmediately` and `AllowDestruct`. The droid class lists its own weapons as `WeaponSection` groups of `WeaponName`, `WeaponAmmo`, and `WeaponChannel`. Its hover keys (`ForwardSpeed` and the rest) belong to a template the droid ignores; it reads `SetAltitude`, `GravityScale` ("1.0//2" reads as 1), `LiftSpring`, `LiftDamp`, and the soldier's `MaxSpeed`, `MaxStrafeSpeed`, `MaxTurnSpeed`, `Acceleraton` (defaults 9, 7, 2, 70). Its destruct weapon's `StrikeOrdnanceName` is the orbital strike, with `AimElevation`, `AimAzimuth`, `AimDistance`, and `ScatterDistance`.
- **Emitter ordnance:** `ConeLength`, `ConeAngle`, `FirstRadius`, `MaxTargets`, `MaxJumpDistance`, `DamageThreshold`, `LightningEffect`, `Push`, and `Damage` and `MaxDamage` as the damage at no charge and full charge (defaults: `ConeLength` 10, `ConeAngle` 60, `FirstRadius` 1.5, `MaxTargets` 5, `MaxJumpDistance` 10). fc0d5e74, whose name is unknown, is the damage lost per link (75). The class also accepts `Effect` (an effect started at the gun along the shot), `StunAnimation` and an unnamed number (8df1e8c9); the last two do nothing, and the arc caster's class sets none of the three. Its `PersonScale` … `ShieldScale` (`VehicleScale` 0, `ShieldScale` 4) go to the plain ordnance fields, which the emitter ignores too: its damage is the same for every kind of target.
- **Explosions:** `DamageRadius`, `ShakeRadius`, and `PushRadius` are older names for the outer radii (the inner stays 0). The turret's and the droids' explosions use them.

## Effects (`fx__`)

An `fx__` chunk is `NAME` (the FNV hash of the effect name) and the effect's source as a config tree (the same `DATA`/`SCOP` layout as `sky_`). Each `ParticleEmitter` block holds:

- emission: `MaxParticles`, `StartDelay`, `BurstDelay`, `BurstCount` (min, max ranges), `NoRegisterStep`;
- emitter-wide `Size` and colour (`Red`/`Green`/`Blue` or `Hue`/`Saturation`/`Value`, `Alpha`);
- a `Spawner`: a `Spread` box or `Circle` of direction ranges, an `Offset`, `PositionScale`, `VelocityScale`, `InheritVelocityFactor`, and size, colour, `StartRotation`, and `RotationVelocity` ranges (written with a leading selector, (0, min, max));
- a `Transformer`: the particle's `Lifetime`, then `Position`, `Size`, `Color`, and `Rotation` keys, each a `Lifetime` and an `Accelerate`, `Reach`, `Scale`, or `Move`, chained by `Next`;
- a `Geometry`: `Type` (`PARTICLE`, `ANIMATED`, `SPARK`, `STREAK`, `BILLBOARD`, `GEOMETRY`, `EMITTER`), `BlendMode`, `Texture` or `Model`, and flipbook (`TimePerFrame`, `FrameSize` cells per row, `TotalFrames`) or spark (`SparkLength`) settings. An `EMITTER` geometry holds the emitter each particle carries.

In the munged tree an effect's next emitter sits inside the previous emitter's block, after its `Geometry`.

A `LightningBolt` block (only `arccaster_lightning` has one) is a bolt between two points: `Texture`, `Width`, `FadeTime`, `SpreadFactor`, `InterpolationSpeed`, `BranchFactor`, `BranchSpreadFactor`, `BranchLength`, `MaxBranches`, `BreakDistance`, `TextureSize`, and `Child` versions of the shape keys, `NumChildren`, `Color`, and `ChildColor`.

## Collision (`coll`, `prim`)

`coll` is one model's collision mesh: `NAME`, `NODE`, `INFO` (vertex count, three counts, bounds), `POSI` (float3 per vertex), and `TREE`. `TREE` is an AABB tree written depth first. `NODE` children are a 6-byte quantized box. Each `LEAF` is one polygon: a vertex count, a 6-byte quantized box, then u16 vertex indices. The polygons are triangles and quads. The engine resolves contacts per polygon, so the extractor keeps each polygon's number with its triangles.

`prim` holds a model's primitive shapes: `INFO` (model name, shape count), then `NAME`, `PRNT`, `XFRM` (a 3x3 rotation and a translation, relative to the parent node), and `DATA` per shape. `DATA` is the type and three floats. Type 4 is a box with half extents. Type 2 is a cylinder along Y with radius and full height. The street lamp's post shows the height convention: it spans exactly the lamp's 0 to 4 m.

Every building placed in Cloud City has a `coll`, `prim` shapes, or both. Shapes parented to a bone belong to animated props.

## Terrain (`tern`)

`INFO` is the grid unit (8 m), height scale, min and max height, grid size (256 cells), and cells per patch (8). `PCHS` holds `COMN` (the triangle strip every plain patch shares) and one `PTCH` per patch, row by row. A patch's kind-290 `VBUF` (28-byte stride: position, normal, color) is in patch-local meters.

Patch (col, row) sits at x = col × 64 − 1024 and z = row × 64 − 1024 + 8: whole patches in x, and one grid unit along z. The hole edges in the cut patches land exactly on the `CUTS` volumes there, and the spawn points on the sunken plazas sit exactly on the terrain there. A grid laid out without that offset, or flipped, puts the plazas' floors in the wrong places.

`CUTS` holds `CUTR` volumes, each a list of planes (normal, d); terrain inside all of them (n·p + d < 0) is removed. The munger has already applied them: the patches under a cutter carry their own `VBUF` and `IBUF`, re-tessellated around the hole.

The patch colour is baked light at half strength: the renderer doubles it. Its alpha is the second texture layer's weight. `LTEX` names the layer textures, `SCAL` gives each layer's meters per repeat (UVs are x and z over it), and `DTLX` names the detail texture. `LUMI` is 256 x 256 bytes, indexed x-major (`x * 256 + z`, in grid units from the patch origin), that darkens soldiers standing on the terrain.

## Terrain water (`WATR`)

`OceanEnable` selects a textured ocean rather than the inland reflective-water
path. Intake also retains `FoamTexture`, `FoamTile`, `WindDirection`, and
`WindSpeed`, exporting both water and foam textures. The runtime uses a bounded
camera-following mesh with nearby wave displacement and an outer skirt in both
near and far scenes; the native WMAP mask still clips its footprint.
Enhanced ocean replaces the Classic surface with a 65,280-triangle ring mesh,
world-space Gerstner swells, crest compression foam and a 384-instance spray/mist
batch. Unresolved short waves fade with mesh spacing. A 768×384 hemisphere
panorama integrates a 3D cloud volume at most 10 times per second when stationary;
large camera translations invalidate it. Looking around reuses the panorama.
The sky and ocean share this cloud image. Lightning uses a fixed ribbon buffer
and short cloud/water/ambient light pulses; Classic restores native sky visibility
and map lighting. Ocean displacement is visual: drowning and water collision
continue to use the native mean water level.
`DomeInfo.TerrainEnable(0)` suppresses the editor height field in both visual
geometry and terrain collision. Kamino otherwise gains a gray sheet above the
ocean and a false floor beneath its suspended platforms.

`Effect("Precipitation")` is exported only when enabled, with its authored type,
range, particle count/size, streak length, velocity, color, alpha, and ground-effect
settings. Classic rain uses one instanced draw with GPU motion and a 16×16
toroidal cover cache. Enhanced uses up to 8,192 fine drops across several depth
layers (8,192 on Kamino), gusts, and soft depth intersections, plus two batches
for low mist and surface rings/spray. Its 32×32 cover cache shares roof queries
across drops; the impact pool performs at most four placement rays per update.
Mode switches reuse precipitation geometry and dispose the replaced cover map.

A map's `tern` can hold `WATR`; the water exists only if the world's fx config also has an `Effect("Water")` section.

- **INFO:** cells per side (64), cells per WMAP byte (2), cell size (32 m), x and z offsets (1024), and a scale that multiplies the look's tiling and divides its speeds. A point's cell is `floor((x + offset) / cell)`, clamped to the grid.
- **LAYR:** a name, a u32, the surface height (Theed: −54), then values only the editor reads. Only the first layer is used.
- **WMAP:** a nibble per cell (even cells in the high nibble): nonzero is water, bit 3 a cell drawn from its own patch.
- **CPAT:** one `LPTC` per patched cell, row by row: `INFO` bounds, an `IBUF` strip, and a `VBUF` (flags 0x222, stride 32: world position, normal, uv across the cell). Theed's six cut the water around the rotunda's island.
- **The look** (`Water` keys): `PatchDivisions` (grid quads per cell), `Tile` (normal-map repeats per cell), `Velocity` and `MainTexture` (the low-quality scrolling layer), `RefractionColor`, `ReflectionColor`, `UnderwaterColor`, `FresnelMinMax`, `NormalMapTextures`, `BumpMapTextures`, `SpecularMaskTextures` (each a name prefix, frame count, and frames per second; frames are `<prefix><n>` from 0), `SpecularMaskTile`, `SpecularMaskScrollSpeed`, and `OscillationEnable`. Normal maps are A4R4G4B4 with x in red, z in green, up in blue; bump maps are V8U8 du/dv offsets.

The low-quality runtime path uses `MainTexture`, `Velocity`, and animated `SpecularMaskTextures` without a reflection render. WATR's scale multiplies tile counts and divides scrolling speeds. High and Ultra retain their existing reflection/refraction paths. Rectangular `PatchDivisions` preserve both axes; custom shoreline patch geometry is kept. `DiffuseColor` and `RefractionColor` are aliases, with the last authored value winning. Gameplay keeps the original game's positive-Z WMAP lookup, edge-cell clamping, downward-only water crossings, and mean level plus the authored bob.

## Foliage (`grasspatch`, `leafpatch`, `prp_`, `FOLG`)

Foliage classes are entity classes. `grasspatch` (Theed's `nab_prop_flowers`) sets `MinSize`, `MaxSize`, `NumParticles`, `Texture` (a 2×2 atlas when `NumParts` is 4), `Alpha`, `MaxDistance`, `BoxSize` (or `RadiusFadeMin`/`Max`), `DarknessMin`/`Max`, and `YOffset`. `leafpatch` (Theed's `nab2_prop_vine1`/`2`) adds `Seed` (wrapped to 32 bits: vine1's 5232344514 is 937377218), `Radius`, `Height`, `HeightScale`, `ConeHeight`, `Offset`, `Vine` (two jitter gains: vine1 grows in the world's x-y plane, vine2 in z-y), `VineLength`, `VineSpread`, `WiggleSpeed`, and `WiggleAmount`.

A map's `prp_` config holds terrain foliage `Layer`s and `TreeLine` blocks. Its string values are FNV hashes. A `TreeLine`'s `Path` (by hash) gets a `BorderOdf` prop every `Distance` along its polyline, the walk not restarting at nodes; Theed's puts 19 `nab2_prop_treebill` along `jungle1` every 28 m. Its matrix uses the horizontal path tangent as right and `cross(tangent, up)` as forward, with Flip negating both axes. Treating the perpendicular as right mirrored the backdrops and turned them across Yavin's bridge exit. Theed has no terrain foliage layers.

Painted foliage: `FOLG` in `tern` is a u32 byte count followed by a nibble per cell (even columns in the high nibble). The PC game uses a **fixed 512×512 grid of 16 m cells**, independently of the terrain height-grid resolution. Columns run toward +X and rows toward **−Z**, centered on the world origin. Bit k enables layer k. Taking 4 m cells and +Z rows from the height map instead compresses and mirrors the vegetation onto unrelated ground, including Yavin Temple's bridge approach. Template paint outside the map's height field is ignored.

Only top-level `Layer(k)` sections in `prp_` are loaded; Geonosis's nested second layer is not promoted. `SpreadFactor` controls integer spacing or reciprocal placements per cell. Each `Mesh` is a weighted alternative selected by normalized `Frequency`, not an additional object planted at every cell. `grasspatch`/`leafpatch` name classes and take precedence over their editor `File`; standalone `File` entries name real meshes (including Yavin's shrubs). Random streams restart per 32 m block and layer, and scatter within each enabled cell.

Painted cards use three terrain samples for their support height and up axis, with `Stiffness` controlling slope alignment. Imported tint uses terrain `LUMI` and `ColorVariation`. Painted grass draws to the near-scene end; painted leaves use twice the mesh entry's distance, capped at 1000 m. Placed patches retain their distinct distance rules. Painted model meshes only contribute collision when `UseCollision` is authored. FOLG does not suppress paint under WATR; water has its own independently oriented grid. Static painted model meshes currently share the normal world-mesh renderer rather than the original engine's streaming pool and per-mesh distance fade.

Attachments: an ODF's `AttachOdf` names the class that every `AttachToHardPoint` after it attaches, until the next `AttachOdf`. Yavin's `yav_prop_leaftree` hangs `yav_prop_leafpatch` on six branches, `yav_prop_leafpatch2` on three more, then godrays; reading only the first pair of each key left each tree one leaf cluster.

- **Grass:** `NumParts=1` uses the entire image with alternating U mirroring; `NumParts=4` uses the four atlas tiles. Radial edge cards clip their bottoms and UVs to the patch base plane. Each card is MinSize..MaxSize (0.9 × that tall, 1.1 × wide), one of the atlas's four plants in turn, a grey from the darkness range. Every frame its top leans toward the camera (up 70% toward it), its width turns by one of ten fixed amounts, and the top sways by 8% of the width at (1 + 0.2 (i mod 5)) × 0.8 rad/s. A placed bed draws to `MaxDistance`, sinking into the ground over the last 20 m (its height × 1 − (1 − a)²).
- **Leaves:** laid out once per class from `Seed` through the engine's random numbers (an LCG: two steps of s × 1664525 + 1013904223, the high half of the second and the high half of the first making 23 bits of a float; the seed first xored with 0xC71C2830 and one number dropped), so every vine of a class has the same shape. A vine walk emits `NumParticles` leaves, smaller toward its tips; each leaf's grey is darker on the side away from the sun. Leaves face the camera, pulled 0.1 m toward it, their widths turned by one of ten amounts, wiggling by `WiggleAmount` of their width at `WiggleSpeed`; odd leaves of a one-part texture are mirrored. Placed patches retain their up axis, discard yaw, and draw to the near scene's end, fading over its last 40%.
- **Drawing:** foliage is fullbright (texture × grey × a tint, no sun or ambient), cut out at alpha 0.25, double-sided, never casts shadows, and nothing collides with it.

## World (`wrld`, `PATH`)

`wrld` holds `NAME` (the world's name, such as `bespin2`), `inst` (placed objects), `regn` (regions: `TYPE` box, cylinder, or sphere, plus `NAME`, `XFRM`, `SIZE`), `Hint`, and `BARR`.

- **Instances:** an `inst` is an `INFO` (`TYPE` the class, `NAME` the instance name, `XFRM` the transform), then `PROP` chunks: the hash of the property name and the value as a C string. Command posts set `Team` (0 neutral, else the team number), `Label`, `CaptureRegion`, and `SpawnPath` this way.
- **Regions:** a region's runtime shape is built from `TYPE`, `XFRM` and `SIZE` ([`src/regions.js`](https://github.com/centrevilletech/battlefront-eternal/blob/19ea2b38c9943ee93309a500cc1024e094374853/src/regions.js)). A box's `SIZE` is half extents along its axes, scaled by the lengths of the `XFRM`'s axes. A cylinder's `SIZE` is scaled the same way, then its x and z both become sqrt(x^2 + z^2): that is its radius about its y axis, and y is its half height (Tatooine: Dune Sea's sarlacc pit `Sarlac01`, 2.14 x 6.06 x 8.16, is an 8.43 m cylinder; Kamino's light region `shadow0`, 0.1 x 10.15 x 93.16, is 93.2 m). A sphere's radius is the length of its unscaled `SIZE` (the world loader stores that length beside it, and the test compares against it); hand-sized spheres often stretch one axis and leave the others at 0.1: Dune Sea's `HOMESTEAD` capture region is 0.1 x 8.15 x 0.1, an 8.15 m sphere. Every reader takes the built shape: capture, kill, death and light regions, and the AI's objective offset, which spans the built x and z in world axes. A region a battle's script names with `AddDeathRegion` (by name without regard to case) kills a soldier inside it: Tatooine: Dune Sea's sarlacc pit (`Sarlac01`), Hoth's `Death`, Theed's `Water` and `Waterfall`, the Citadel's `FalltoDeath`, and the `deathregion*` regions of Cloud City, Endor and Kamino. The port also keeps every region named `deathregion*`, which Yavin 4: Arena's four are without a script naming them.

`PATH` holds `path` chunks: `NAME`, `INFO`, `PROP`, and `PNTS` (28 bytes per point: a position, then a rotation quaternion stored w, x, y, z). The `CP<n>Spawn` paths are each command post's spawn points.

## Sky and effects config (`sky_`, `fx__`)

These are trees of named values. A `DATA` chunk is the FNV hash of the name (u32), a value count (u8), that many 4-byte values, and a string table (u32 size, then the strings). A value is a float, or an offset to a string at values start + offset + 4. A `SCOP` after a `DATA` holds that entry's children.

- **SkyInfo:** `NearSceneRange` (fade start and end at the shortest and longest view distance), `FarSceneRange`, `AmbientColor`, `TopDirectionalAmbientColor`, `BottomDirectionalAmbientColor`, and `CharacterAmbientColor`. `FogColor` and `FogRange` are there but the PC game doesn't read them: it takes only those six, `VehicleAmbientColor`, `Enable`, and one colour whose name isn't known (hash 0x91e9c28b), the water reflection's fog (see "Fog" under Rendering).
- **SunInfo:** `Angle` (a0, a1 in degrees) and `Color`. The light travels along (−sin a0 cos a1, cos a0, −sin a0 sin a1).
- **DomeInfo:** each `DomeModel` names a sky model (`Geometry`). The engine draws them in order around the eye, without depth, before the far scene: the dome itself, then whatever stands on its horizon (Geonosis's arena, spire and rim; Hoth's mountains and ion cannon; Endor's satellite, tree line and Death Star; Kamino's city; Kashyyyk's mountains; Naboo Plains' waterfall and mountains; Rhen Var Citadel's two cloud layers; Tatooine's rocks; Yavin's gas giant; Bespin Platforms' Cloud City). A model with `Offset` or `MovementScale` s stands at height s × eye + (1 − s) × Offset instead of at the eye, so it sinks slightly as the eye climbs. The first model is opaque; the others keep their textures' alpha. `LowResTerrain` has the far scene's terrain texture and its scale, and its fog: `FogColor` (r, g, b, a), `FogNear`, `FogFar`. The fog's far end stretches by 255 / a, except at an a of 0 or 255, and the fog is only on when 0 ≤ `FogNear` < `FogFar` (see "Fog" under Rendering).
- **fx__** for the world holds `Blur` (soft focus: `ConstantBlend`, `DownSizeFactor`) and `SunFlare`, among others. The weather and haze sections:
  - `Effect("FogCloud")` (Enable 0 by default): `Texture` (fluffy), `Range` near and far (40, 90), `Color` (192, 192, 192, 160; three values leave the alpha at 255), `Velocity` x and z (0, 0), `Rotation` (0.1), `Height` (16), `ParticleSize` (28), `ParticleDensity` (30). The engine lays `ParticleDensity` points over every 256 m world cell (one draw of its random numbers from seed 1, so every cell holds the same pattern), scrolls the pattern by Velocity × time, and stands each point `Height` over the terrain height there. It keeps the points inside the bounding box of the view's slab between `Range` near and far (grown by ParticleSize × 0.707), drawing each as a camera-facing square `ParticleSize` across, turning at ±Rotation × π radians a second. Its alpha is the colour's × (1 − t²), t running −1..1 as the squared distance runs from near² to far². Geonosis (brownmist, 90 to 120 m), Endor, Rhen Var Citadel and both Yavins have it on; Bespin, Theed and Hoth carry it disabled.
  - `Effect("Precipitation")`: `Type` `Streaks` (rain) or `Quads` (Hoth's snow), `Texture`, `Range`, `Color`, `Velocity`, `VelocityRange`, `ParticleDensity`, `ParticleDensityRange`, `ParticleSize`, `StreakLength`, `AlphaMinMax`, `Rotation`, `RotationRange` (turns a second, default 2), `CameraCrossVelocityScale`, `CameraAxialVelocityScale`, and `GroundEffect`, `GroundEffectsPerSec`, `GroundEffectSpread`. ParticleDensity + ParticleDensityRange particles fill a 5 m box, and the box is repeated over the world's 5 m grid through the view out to Range, its alpha fading over the last third. Every half second each particle's wander (±VelocityRange per axis), alpha (one end of AlphaMinMax) and spin (Rotation ± RotationRange / 2) ease a fifth of the way to new random values. A quad is a camera-facing square reaching ParticleSize from its centre to each side. A streak runs back from its drop along its motion relative to the eye, StreakLength / 30 seconds of it. Regions named `rainshadow*` (Hoth, Kamino, Yavin Arena) keep it out of shelters.
  - `Effect("Wind")`: `Velocity` x and z, `VelocityRange`, `VelocityChangeRate`: the wind eases to a new target, the velocity give or take VelocityRange, every 1 / VelocityChangeRate seconds.
  - Also present, not yet drawn by the port: `Godray` (sun shafts: `Texture` fx_godray, `TextureScale` and ten unnamed values), `HeatShimmer` (Tatooine: a `shimmer_waves` distortion), `Lightning` and `LightningBolt` (Kamino, Yavin Arena: flashes, bolts and thunder sounds), `WorldShadowMap` (Endor: the `end_canopy` texture projected over the world), `ColorControl` (gamma, brightness, contrast).
- **sky_** also lists `SkyObject`s, the ships crossing the sky ("Sky flyers" below), and Rhen Var Citadel's DomeInfo has `Stars`, which the port doesn't draw yet.

### Sky flyers (`SkyObject`)

A `SkyObject` section of `sky_` is a class of ships crossing the sky: Geonosis's gunships, droid fighters and rising Techno Union core ships, and the capital ships over Bespin, Naboo Plains and Tatooine. Each section builds one class, which spawns, updates and draws its ships.

| Key | Default | Read as |
| --- | --- | --- |
| `Geometry` | none | the model, found by name among the models loaded when the level starts |
| `NumObjects` | 1 | ships always in the sky (a float, truncated) |
| `Height` | 70 100 | min and max height above the origin |
| `VelocityX`, `VelocityY`, `VelocityZ` | 0 0 | min and max speed along the ship's right, up and forward axes |
| `Acceleration` | 0 0 0 | added to that velocity every update, in the same axes |
| `Distance` | 300 | how far out across the ground they start |
| `InDirectionFactor` | 3 | how far inward they head (below) |
| `LifeTime` | 1000 | seconds (below) |

A range given as one value is that value; a key given twice keeps the last. The names are FNV hashes like every config key (`VelocityX` b6c8887e, `Acceleration` 2fa0ba9d, `LifeTime` 5212abee).

**Which battles draw them.** The `*_DOME` models live in the side archives, each in a sub-level of its own name (`SIDE/rep.lvl`'s `rep_fly_assault_dome` holds the model, its skeleton and its one texture). A battle has them only if its script reads that sub-level (`ReadDataFile("SIDE\\rep.lvl", "rep_fly_assault_dome", ...)`); a class whose model isn't loaded gets no ships (its count stays 0). So the sky config lists every era's ships and each battle draws its own:

| Map | SkyObjects | Battles that draw them |
| --- | --- | --- |
| Bespin: Platforms (bes1) | `rep_fly_assault_DOME`, `cis_fly_fedlander_DOME`, `all_fly_moncalamari_DOME`, `imp_fly_destroyer_DOME`: 2 each, Height 170 to 250, VelocityZ 20 to 50, Distance 1500, InDirectionFactor 2.5 | none: neither battle reads a dome sub-level |
| Bespin: Cloud City (bes2) | the same four | `bes2r`: the Republic assault ships. `bes2a`: none |
| Geonosis: Spire (geo1) | `rep_fly_assault_DOME` 2 (Height 200 to 300, VelocityZ 20 to 50, Distance 1500, InDirectionFactor 2); `rep_fly_gunship_DOME` 20 (Height 80 to 140, VelocityY −10 to 10, VelocityZ 80 to 120, Distance 600, InDirectionFactor 0.5); `cis_fly_droidfighter_DOME` 20 (the same, VelocityZ 80 to 100, Distance 300); `cis_fly_techounion_DOME` 8 (Height 0, VelocityY 10 to 12, Acceleration 0 2 0, Distance 1000, LifeTime 80) | `geo1r` and `geo1r_h`: all four (they also read `rep_fly_jedifighter_dome` and `cis_fly_fedcoreship_dome`, which no SkyObject names) |
| Naboo: Plains (nab1) | `cis_fly_fedlander_DOME` and `imp_fly_destroyer_DOME`, 1 each, Height 350 to 500, VelocityZ 30 to 50, Distance 2500, InDirectionFactor 2.5 | `nab1c`: the Federation lander. `nab1i`: the Star Destroyer |
| Tatooine: Dune Sea (tat1) | the four capital ships, 2 each, as on Naboo Plains | `tat1r`: Republic assault ships. `tat1i` (and `tat1i_h`): Star Destroyers |
| Tatooine: Mos Eisley (tat2) | as the Dune Sea | `tat2r`: Republic assault ships. `tat2i`: Star Destroyers. The historical `tat2i_h`: Mon Calamari cruisers |
| The other eleven maps | none | |

Kamino's Clone Wars script reads `cis_fly_fedlander_dome` too, but its sky has no SkyObject and nothing places one. The models are small: 72 to 200 triangles in one or two segments with one texture (32 × 32 for the gunship, droid fighter and core ship, 128 or 256 for the capital ships); the gunship is about 20 m long, the droid fighter 13 m, the core ship 41 m tall, the capital ships 280 to 550 m. All their textures are opaque; their segments are lit (MTRL 0x1) except the assault ship's engines (0x0), and the gunship's canopy blends (0x5).

**Motion.** Everything is about the class's centre, which is always (0, 0, 0), so the ships circle the world's origin, not the player.

- **Start**, with the engine's shared random numbers (the bot names' LCG, a float from its top 23 bits), in this order: a direction d = normalize(r₂ − 0.5, 0, r₁ − 0.5) (drawn again while both are 0; not uniform in angle, the square's corners are favoured); a height, Height min + r × (max − min); the ship stands at d × Distance at that height. Its heading is up × d, across d, negated when the next draw is over 0.5, plus −d × f with f = InDirectionFactor × (0.5 + 0.5 r) when InDirectionFactor is over 0. Its frame is the look-at frame of the heading with the world's up: level, its model's z along the heading, x along up × heading. Then VelocityZ, VelocityY and VelocityX, each min + r × (max − min), the class's Acceleration, an age of LifeTime × (0.8 + 0.2 r), and a fade of 0.
- **Each frame:** a ship with fade ≥ 0 whose position is more than Distance + 10 m from the centre across the ground (x² + z²), or whose age is over LifeTime, gets fade −1. Then its age grows by the frame's time, fade becomes min(fade + 0.25 × dt, 1), and a ship whose fade just reached 0 from below starts again instead of moving. Any other ship adds Acceleration × dt to its velocity and moves by (right × vx + up × vy + forward × vz) × dt. Its frame never changes: no turning, no banking.
- **So** every ship of the class is always in the sky, fading in over 4 s, flying, or fading out over 4 s while it flies on. The fade is drawn as its absolute value, so a ship cut short while still fading in jumps to full alpha as its fade-out starts. With the age starting at 80% to 100% of LifeTime, a ship lives at most a fifth of it: up to 200 s by default, up to 16 s for Geonosis's core ships, which start at height 0 (some 60 m above the plain) 1000 m out and rise at 10 to 12 m/s, 2 m/s faster each second (up to about 450 m before they fade). A straight course from Distance out passes Distance / √(1 + f²) from the centre: the gunships (InDirectionFactor 0.5) cut chords of their 600 m ring 540 to 580 m from it and cross it in 3 to 7 s, so they are seldom wholly faded in before they jump to full and fade out, Geonosis's assault ships pass 670 to 1060 m out, Cloud City's 560 to 940 m, and the capital ships over Naboo Plains and Tatooine (Distance 2500, 2.5) 930 to 1560 m.
- **Updates** run once a rendered frame with the frame's time, not on the simulation's tick. Whether they stop while the game is paused is unknown.

**Drawing.** The class is drawn in the far scene with the far pass's own depth buffer, after the sky dome (which draws its models without depth or fog) and before the world's objects. Fog is off while it draws. Each ship's model is drawn with the tint (255, 255, 255, |fade| × 255), lit by the level's ambient and sun and no point lights, and depth tested. A model with a tint alpha under 255 blends every segment, but its opaque segments keep writing depth while they blend; a segment that blends or adds by its material (MTRL 0x84) never writes depth. So a fading ship still hides a ship behind it. The far scene's far plane (`FarSceneRange` at the view distance) clips them: 1000 m on Geonosis, Naboo Plains and Mos Eisley, 2000 m on the Dune Sea, 500 m on Cloud City, whose assault ships pass at least 557 m from the origin and 170 m up, so only the edge of the city sees them at the original view distance.

[`tools/zero_sky.py`](https://github.com/centrevilletech/battlefront-eternal/blob/19ea2b38c9943ee93309a500cc1024e094374853/tools/zero_sky.py) writes each map's `sky/` folder beside `map.json` for the battles that draw ships (`flyers.json`: the classes, which battle draws which, the models' parts and textures; `flyers.bin` and `flyers_index.bin`; `textures/`). None of it is in the content fingerprint. [`src/sky-flyers.js`](https://github.com/centrevilletech/battlefront-eternal/blob/19ea2b38c9943ee93309a500cc1024e094374853/src/sky-flyers.js) flies them page-side and draws each class's model parts as instanced meshes in the far scene, without fog, after the far terrain (docs/environment-effects.md, "The sky's flyers"). That is Classic. Graphics > Ocean and sky's Enhanced (map generation 16) also draws every class of the battle's era, past the far plane, with smooth fades (docs/environment-effects.md, "Enhanced"); `flyers.json` then lists each battle's classes twice, as the original draws them (`missions`) and as the Enhanced sky does (`enhanced`), with each class's `era`.

### Placed haze (`dusteffect`) and attached effects

A `dusteffect` class (Geonosis `geo_prop_dust`, Hoth `hoth_prop_dust` and `hoth_prop_mist`, Kamino `kam1_prop_mist`, Rhen Var Citadel `Rhn2_prop_cloud`, Tatooine Dune Sea `tat_prop_dust`, both Yavins `yav_prop_mist`) is a cloud of camera-facing squares shared by every copy of the class: `NumParticles` (50), `MinPos`/`MaxPos` (±20, ±1, ±20) and `MinVel`/`MaxVel` (±3, ±1, ±3) per axis, `MinSize`/`MaxSize` (10, 15), `MinLifetime`/`MaxLifetime` (2, 3), `Alpha` (0.5), `MinDistance` (0), `MaxDistance`, `RadiusFadeMin`/`RadiusFadeMax` (off), `HeightScale` (0.2) and `Texture` (whitesmoke); `CameraDistance` and `SpawnSound` exist but no stock map sets them. A particle's alpha rises at 1 a second to Alpha; in its last second it is Alpha × life left × that. Past RadiusFadeMin from the copy's vertical axis it fades out, and past RadiusFadeMax it starts again. A placed copy keeps only its position: its frame is the world's with the vertical axis scaled by HeightScale, so the particles and their squares lie flattened into low sheets. A copy draws while its view depth plus the class's radius (half MaxSize, plus RadiusFadeMax when the fade is on, else the fastest speed over the longest life plus the farthest start) lies between MinDistance and MaxDistance, with its alpha × min(1, (MaxDistance − that) / 200).

A class's `AttachEffect` names the effect that every `AttachToHardPoint` after it carries, until the next `AttachEffect` or `AttachOdf` (at most 30 a class; a hardpoint the model lacks attaches nothing, and an effect no archive defines, like Kashyyyk's `kas1_fireflies` and `kas_dryice`, attaches nothing). The retail `576b09cd` property names an effect and its hardpoint together.

## Mission scripts (`mission.lvl`)

Each battle's setup is a compiled Lua 4.0 chunk (version byte 0x40, 4-byte floats) inside a named chunk of `mission.lvl`. Names are the map plus an era letter: Bespin: Cloud City's Clone Wars battle is `bes2r` and its Galactic Civil War battle is `bes2a`; `_h` marks the historical campaign's version. Running the setup function's straight-line code on literal values recovers its calls:

- the sides it loads (`ReadDataFile("SIDE\\rep.lvl", ...)`);
- the teams (`SetTeamName`, `SetTeamIcon`, `AddUnitClass`, `SetHeroClass`);
- unit and reinforcement counts, bleed thresholds, and the attacking team;
- death regions (`AddDeathRegion`).

`bes2r` puts the Republic on team 1 and the CIS on team 2, with 25 units and 200 reinforcements each. Command post ownership is not in the script. It is each post's `Team` instance property.

A map's battles are the scripts named for it: the map, an era letter (`r` and `c` are the Clone Wars, `a` and `i` the Galactic Civil War, as the shell's playlist letters name them) and `_h` for the historical campaign's version. Each reads its world with `ReadDataFile("<PLANET>\\<world>.lvl")`. That is the map's own archive for every battle but two: the campaign's Theed and Naboo Plains (`nab2c_h`, `nab1c_h`) are fought in `NAB/nab2_h.lvl` and `nab1_h.lvl`, worlds of their own (`TAT/tat1h.lvl` and `YAV/yav2_h.lvl`, which `tat1i_h` and `yav2i_h` read, are byte for byte `tat1.lvl` and `yav2.lvl`). Every historical version but `rhn1r_h` calls `SetHistorical`, after which teams 1 and 2 take the vehicle pads' `ClassHisATK` and `ClassHisDEF`. The extraction keeps every battle of a map's world ([`tools/extract.py`](https://github.com/centrevilletech/battlefront-eternal/blob/19ea2b38c9943ee93309a500cc1024e094374853/tools/extract.py) `map_missions`), the two in other worlds recorded with their `world` and nothing that depends on it.

`common.lvl` holds the interface scripts the same way. Its `globals` script builds plain tables, which running its top-level code with tables recovers. The first-person camera motions are there: `RollLeft`, `RollRight`, `Crouch`, `CrouchToProne`, `StandToProne`, `ProneToStand`, `CrouchToStand`, and `Land`. Each has `Size` (the segment count), `Vec` and `Slope` (eye offsets in the camera's frame, x right, y up, z back, and their tangents, in metres), `Ore` and `RSlope` (Euler angles x, y, z in radians, and their tangents), and `Time` (seconds per segment). The game reads them by name at mission start and scales nothing.

## Localization (`Locl`)

`core.lvl` holds a `Locl` per language: `NAME` (such as `english`) and `BODY`. The body is a run of entries: a u32 key hash, a u16 entry size including this 6-byte header, then UTF-16 text. Keys the port uses:

- A command post's display name is `level.<world>.<Label>`, so `level.bespin2.CP1` is "COURTYARD".
- A weapon class's name is `weapons.` and the class name with its first two underscores as dots: `rep_weap_inf_rifle` is `weapons.rep.weap.inf_rifle`, "BLASTER RIFLE".
- A side's name is `common.sides.<side>.name` ("REPUBLIC", "CIS").
- The message feed's lines are `game.infomsg.captured` ("%s CAPTURED THE %s"), `game.infomsg.lost`, `game.infomsg.killed`, and so on.
- The game asks for some text by hash: 0x0634F877 is "VICTORY IN" and 0xEDD20CDE is "DEFEAT IN".

## Add-ons (`GameData/AddOn/<name>`)

A map can be installed beside the game rather than in `Data/_LVL_PC`. The Steam copy installs Jabba's Palace this way, in `AddOn/Tat3`. The game treats a folder under `AddOn` as an add-on when it holds `addme.script` and `Data/_LVL_PC`. Tat3 spells these `_lvl_pc` and `Side`, so every name matches without regard to case, as on Windows.

- `addme.script` is a ucfb archive holding one compiled Lua 4.0 chunk, `addme`. The game runs it at startup. It appends the add-on's map to the shell's two lists, `sp_missionselect_listbox_contents` and `mp_missionselect_listbox_contents`, at `getn(list) + 1`. The entry has the same fields as the stock `missionlist` entries: `mapluafile = "TAT3"`, `showstr`, one `side_<letter>` flag per era, and `dnldable = 1`. The script then registers each mission with `AddDownloadableContent("TAT3", "TAT3c", 4)` and `("TAT3", "TAT3a", 4)`. Tat3's `showstr` is the literal "TATOOINE: JABBA", not a localization key. The shell's `missionlist_GetLocalizedMapName` shows such a string as written when localization has nothing for it.
- `Data/_LVL_PC` follows the game's own layout. `mission.lvl` holds the add-on's missions (`tat3c`: Republic against CIS; `tat3a`: Alliance against Empire; Gamorrean guards as team 3 in both). `core.lvl` is a full copy of the game's localization plus 22 strings of its own: the command posts `level.tat3.cp1` to `cp5` (BARRACKS, THRONE ROOM, PRISON, KEEPERS CHAMBERS, DROID REPAIR BAY) and the objectives. `TAT/tat3.lvl` is the world. `Side/gam.lvl` is a new army, the Gamorrean guard, whose body is a soft skin (`SKIN` type 3; see Models above). `sound/tat.lvl` holds the sub-levels `tat3cw` and `tat3gcw` and the streams `tat3` and `tat3_emt`. Each sub-level has two banks: one external, whose samples are in the game's `common.bnk`, and one with 18 samples of its own data. `Movies/tat3.mvs` holds one movie, the Instant Action flyover `tat3fly` (720x480, 24 s, silent). `Shell/ENG/shell.lvl` is only the movie config for it. There are no loading pictures, and `Load/load.lvl` has no `World` entry for `tat3`.
- An add-on's mission scripts mark their own files with `dc:`: `ReadDataFile("dc:TAT\\tat3.lvl")`, `ReadDataFile("dc:SIDE\\gam.lvl", ...)`, `ReadDataFile("dc:sound\\tat.lvl;tat3cw")`, `OpenAudioStream("dc:sound\\tat.lvl", "tat3")`. A path without `dc:` is the game's own: `SIDE\\rep.lvl`, the era's music from the game's `sound\\tat.lvl`, and its voice-over from `sound\\cw.lvl`. The add-on's `sound/tat.lvl` and the game's `Sound/tat.lvl` share a name and are different archives, so a path is resolved by its prefix and never by looking in both places.

[`tools/zero_addon.py`](https://github.com/centrevilletech/battlefront-eternal/blob/19ea2b38c9943ee93309a500cc1024e094374853/tools/zero_addon.py) reads add-ons this way for every tool. A map or side archive comes from the game when it has one, else from an add-on. A map's world is `<PLANET>/<map>.lvl` by name; when neither has that file, it is the world the map's battles read. A community add-on's map id need not name its world: one listing `georuins` reads `GEO\\geo1.lvl`, so the name alone found nothing. The mission scripts are `mission.lvl`'s followed by each add-on's, with the game's script kept when names clash. The text is `core.lvl`'s with each add-on's new keys added. The Instant Action list is the `missionlist` entries followed by the entries each `addme` script appends, and the flyovers come from each add-on's movie archive as well. What the extraction writes for an add-on map is laid out like a stock map's (`maps/tat3/`, `sides/gam/`, `audio/tat3cw/`), so the runtime and the server need nothing of their own for it.

## Fonts (`font`)

`core.lvl` holds the HUD's bitmap fonts: `gamefont_tiny` (18-pixel lines), `gamefont_small` (21), `gamefont_medium` (23), `gamefont_large` (28), `gamefont_super_tiny`, and `starwars_small`. A `font` chunk is:

- `NAME`;
- `HEAD`: the glyph count (u16), page count (u8), line height (u8), and baseline (u8);
- `FTEX`: the glyph pages as `tex_` chunks (A4R4G4B4, white glyphs in the alpha);
- `FBOD`: 24 bytes per glyph. The character code (u16), page (u8), advance (u8), the glyph's box x0, x1, y0, y1 in pixels from the pen and the line's top (u8 each), then u0, u1, v0, v1 (f32) on the page.

Text is laid out glyph by glyph: each quad runs from (pen + round(x0 × s), top + round(y0 × s)) to (pen + round(x1 × s), top + round(y1 × s)), and the pen moves on by round(advance × s) plus a spacing of 1.

## Sound (`Sound/*.lvl`, `common.bnk`)

`GameData/Data/_LVL_PC/Sound` holds one archive per planet (`nab.lvl` for Naboo), `cw.lvl` and `gcw.lvl` (each era's voice-over), `shell.lvl` (the front end), and `common.bnk`. A mission reads its sound sub-level with `ReadDataFile("sound\\nab.lvl;nab2cw")` and opens streams with `OpenAudioStream("sound\\nab.lvl", "nabcw_music")`. [`tools/zero_sound.py`](https://github.com/centrevilletech/battlefront-eternal/blob/19ea2b38c9943ee93309a500cc1024e094374853/tools/zero_sound.py) reads them (see `docs/audio.md` for what the port does with them).

These are ucfb trees like the other archives, but most chunk tags are FNV hashes of names (`zero_hash.fnv1a`), so they don't read as text:

| Chunk | Contents |
| --- | --- |
| `StreamList` (0x5bb97f21) | One stream: `Stream` (0x5f6f6d65, which happens to spell `emo_`) holding `Info` and `Data`. Each is padded with a `_pad` chunk so data starts on a 2048-byte boundary. |
| `lvl_` | A sub-level: a name hash (`nab2cw`, `nab2gcw`, `nab1cw`, `nab1gcw` in `nab.lvl`) and an inner size, then a `SoundBankList` and config chunks `snd_`, `mus_`, and `ffx_`. |
| `SoundBankList` (0x5e262256) | `SampleBank` (0x9a644d15) holding `Info` and, in `common.bnk` and `core.lvl`, `Data`. |

`common.bnk` is a single bank of every sample the levels use (1554 of them, 71.8 MB). A level's bank lists the ids it needs, with no `Data` (its `694aaa0b` field is 1). Those samples come from `common.bnk`. The level bank's `Info` describes many of them at 44100 Hz while `common.bnk` holds them at 22050 Hz, with the same duration. Only the 22050 Hz data exists on the PC, and it is what plays. `core.lvl` has its own small bank with data (six interface sounds), the buses, and the default reverb settings.

**Info** is a run of (name hash, u32) pairs. `SegmentInfo` (streams) or `SampleInfo` (banks) opens a list of `Sample` … `SampleEnd` records:

- Stream header: `Name`, `Format`, `NumChannels`, `ChannelInterleave`, `NumSegments`, `Size`, `NumSubstreams`, `SubstreamInterleave`, `Padding`.
- Bank header: `Name`, `Format`, `NumSamples` (the count), `Size`, 694aaa0b, `Padding`.
- Per sample or segment: `Id` (the hash of its name), `Frequency`, `Size`, a frame count (1d48feef), `Padding`, and for six samples in `common.bnk` an `Alias`. An alias names another sample whose data it plays, and takes no space.
- Samples in `Data` follow one another; segments are each followed by their padding.

**Formats.** 2 is 16-bit PCM, little-endian, mono: every bank sample. Rates are mostly 22050 Hz; 52 are at 44100, and a few at 16000, 11025, 8000, 7056, and even 320 Hz. 5 is Xbox IMA ADPCM, every stream:

- 36 bytes per channel encode 64 frames. A 4-byte header gives an int16 sample, a step index, and a pad byte; the header sample is the first frame.
- 32 bytes of 4-bit codes follow, low nibble first. Only 63 are decoded; the last is unused.
- Channels interleave every 4 bytes (`ChannelInterleave` 4).
- The reference IMA step rule applies (step/8, plus step, step/2, and step/4 by the code's bits), as in the original game. Decoders that multiply instead (FFmpeg's `adpcm_ima_wav`) differ by a few LSB.
- A stream with two substreams interleaves two of these in `SubstreamInterleave`-byte chunks (36864, or 512 stereo blocks). Theed's ambience streams `nab1` and `nab2` are two stereo pairs; the second is quieter and correlates about 0.8 with the first.
- Segment `Frequency` values are a few hertz off round numbers (48001, 44125). They are used as written.

Theed's streams: `nabcw_music` (24 segments) and `nabgcw_music` (25), stereo at 48 kHz; `nab1` and `nab2`, the ambience (one segment each, two substreams, 44.1 kHz); `nab2_emt` (mono). In `cw.lvl` are `cw_vo` (314 segments, mono, 44.1 kHz) and `cw_tac_vo` (63, 22 kHz).

**Configs** (`snd_`, `mus_`, `ffx_`) are DATA/SCOP trees like `sky_`, but every string is stored as its FNV hash in the value slot. The objects:

- **SoundProperties** (also accepted as `Sound`): `Name`, `Inherit`, `Group`, `Bus`, `Pitch`, `PitchDev`, `Gain`, `GainDev`, `ReverbGain`, `Looping`, `Pan`, `Mode3D`, `ModeDoppler`, `Priority`, `Bias`, `MinDistance`, `MuteDistance`, `MaxDistance`, `RollOff`, `RollIn`, `RollInDistance`, `PlayProbability`, `PlayInterval`, `PlayIntervalDev`, `RandomPlayPos` (3af79d76), and a `SampleList` of `Sample(id, weight[, interval, intervalDev])` with an optional `CyclePlayback` (4d5af670).
- **SoundStreamProperties** (and `SoundStream`, 0x2e93ef4c, the music's): the same keys, plus `Stream` and a `SegmentList` of `Segment(id, weight[, …])`.
- **SoundLayered**: `Layer(layerName, sound, PlaybackDelay[, PlaybackDelayDev])`.
- **SoundParameterized**: a `SoundLayered` and, per layer, `ParameterGraph(input, graph, output)`. The input is a name such as `Speed`, `Acceleration`, or `Health`; the output is `Gain` or `Pitch`.
- **ParameterGraph** (e657a914): `ControlPoint(x, y)` points.
- **Bus**: `Name`, `Gain`, `Parent`, and `AttenuateBus`, `Attenuation`, `AttenuationLeadIn`, `AttenuationLeadOut`; also `Mute` and `Solo`. `core.lvl`'s buses:

  | Bus | Gain | Parent | Notes |
  | --- | --- | --- | --- |
  | root | | | |
  | shellfx | 0.3 | root | |
  | ingame | 1 | root | |
  | main | 1 | ingame | |
  | soundfx | 1 | main | |
  | music | 1 | main | |
  | ingamemusic | 0.5 | music | |
  | shellmusic | 0.6 | music | |
  | shellmovies | 1 | ingame | |
  | ambience | 0.7 | ingame | |
  | voiceover | 0.6 | ingame | attenuates main by 0.5, 0.5 s each way |

- **I3DL2ReverbPreset** (abd36816): `RoomGain`, `RoomHFGain`, `RoomRollOff`, `DecayTime`, `DecayHFRatio`, `ERGain`, `ERDelay`, `ReverbGain`, `ReverbDelay`, `Diffusion`, `Density`, `HFReference`.
- **space**: a preset (`I3DL2ReverbPreset`), `DirectGain`, `DirectHFGain`, `RoomGain`, `RoomHFGain`, `RoomRolloffFactor`, `ObstructionHFGain`, `ObstructionLFRatio`, `OcclusionHFGain`, `OcclusionLFRatio`. Theed's one space has `RoomGain` 0, so it is dry.
- **Music** (`mus_`): `Name`, `Priority`, `FadeInTime`, `FadeOutTime`, `MinPlaybackTime` (6813be83; 5 s on Theed), `MinInactiveTime` (35724887; 90, 60 or 30 s), and the `SoundStream` it plays.
- **FoleyFXSoldier** (`ffx_`): per soldier `Class`, and sounds for `FootstepLeftWalk` (2a9f6673), `FootstepRightWalk` (e79eb7c2), `FootstepLeftRun` (640f6efb), `FootstepRightRun` (a4df1b00), `FootstepLeftStop` (b59a8702) and `FootstepRightStop` (54e8af1f) (never played), `jump`, `Land`, `roll`, `prone`, `squat` (65bfa4e1), `stand`, and `bodyfall` (70dc49d0).
- **FoleyFXGroup** (a1c9cbc5): a surface material (`dirt_foley`, `metal_foley`, `stone_foley`, and the built-in `terrain_foley` (26c04c0e) and `water_foley` (425aa124)), listing its `FoleyFX` entries. Props and buildings name their material with the same key; a soldier class picks its entry with `FoleyFXClass` (99d55922).

**Class sound keys.** Classes name their sounds in ODF properties, a SoundProperties name optionally followed by `defer`. `defer` only delays the name lookup until the banks are loaded.

- **Weapons:**
  - `FireSound`, `FireLoopSound`, `FireEmptySound`, `ReloadSound`, `ChargeSound` and `ChargeSoundPitch`, `WeaponChangeSound`, `OverheatSound` and `OverheatSoundPitch`, `FireSoundStop`.
  - Ten movement slots: four for steps (b77f3981, b989fc18, 1064c0a7, 10a991e4: left and right walk, left and right run; no class sets them), then `JumpSound`, `LandSound`, `RollSound`, `ProneSound`, `SquatSound`, `StandSound`.
  - The game doesn't use `ChangeModeSound` or `OverheatStopSound`, though 45 classes set the latter.
- **Ordnance:** `OrdnanceSound` and `CollisionSound`; grenades and mines `CollisionOtherSound` (edc6251a) for a bounce or landing, `CollisionWaterSound` (2297e47d), and `CollisionFoliageSound` (b8c524f1).
- **Explosions:** `SoundProperty`.
- **Soldiers:** `HurtSound`, `DeathSound`, `LowHealthSound` (f8d3e5d2), `FleeSound`, and unnamed chatter keys (the AI's).
- **Entities:** `EngineSound`, `TurnOnSound`, `TurnOffSound`, `AmbientSound`, `Ambient2Sound`, and `Footstep0Sound` to `Footstep2Sound`.
- **Items:** `PowerupSound`.
- **Command posts:** `AmbientSound` (one per side: `"<side> <sound>"`), `ChargeSound`, `CapturedSound` (f17a02e6), `DischargeSound`, `LostSound`, `DisputeSound`, and `SoundPitchDev` (a33d3401). `CaptureMusic` (6b9b4728) and `LostMusic` (42cb8c86) are read but unused.
- **Turrets:** `TurretYawSound`, `TurretPitchSound`, `TurretYawSoundPitch` and `TurretPitchSoundPitch`, `TurretActivateSound`, `TurretDeactivateSound`.
- **Static emitters:** the world's `com_snd_amb_static` instances set `Sound` (0x0e0d9594), `MinDistance`, and `MaxDistance`. Theed has 36 of them, `canal` and `fountain`.
