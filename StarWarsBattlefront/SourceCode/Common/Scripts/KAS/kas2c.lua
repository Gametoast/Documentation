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
    local REP = 2
    local CIS = 1
--  These variables do not change
    local ATT = 1
    local DEF = 2

    AddMissionObjective(CIS, "orange", "level.kas2.objectives.1c");
    AddMissionObjective(CIS, "red", "level.kas2.objectives.2c");
    AddMissionObjective(REP, "orange", "level.kas2.objectives.1c");
    AddMissionObjective(REP, "red", "level.kas2.objectives.3c");

    SetTeamAggressiveness(REP, 1.0)
    SetTeamAggressiveness(CIS, 1.0)

    SetMaxFlyHeight(50)

    ReadDataFile("sound\\kas.lvl;kas2cw");
    ReadDataFile("SIDE\\rep.lvl",
        "rep_inf_basic",
        "rep_inf_jet_trooper",
        "rep_inf_macewindu");
    ReadDataFile("SIDE\\cis.lvl",
        "cis_hover_aat",
        "cis_inf_basic",
        "cis_hover_stap",
        "cis_walk_spider",
        "cis_inf_countdooku",
        "cis_inf_droideka");
ReadDataFile("SIDE\\wok.lvl",
        "wok_inf_basic")


    --    Republic Stats
      SetTeamName(REP, "Republic");
      SetTeamIcon(REP, "rep_icon");
      AddUnitClass(REP, "rep_inf_clone_trooper",11)
      AddUnitClass(REP, "rep_inf_arc_trooper",3)
      AddUnitClass(REP, "rep_inf_clone_pilot",4)
      AddUnitClass(REP, "rep_inf_clone_sharpshooter",4)
      AddUnitClass(REP, "rep_inf_jet_trooper",3)
      SetHeroClass(REP, "rep_inf_macewindu")



--  CIS Stats
      SetTeamName(CIS, "CIS");
      SetTeamIcon(CIS, "cis_icon");
        AddUnitClass(CIS, "cis_inf_battledroid",14)
        AddUnitClass(CIS, "cis_inf_assault",4)
      AddUnitClass(CIS, "cis_inf_pilotdroid",5)
      AddUnitClass(CIS, "cis_inf_assassindroid",5)
   AddUnitClass(CIS, "cis_inf_droideka",4) 
      SetHeroClass(CIS, "cis_inf_countdooku")


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

--  Level Stats
    ClearWalkers()
--  SetMemoryPoolSize ("EntityWalker",0)
    AddWalkerType(0, 8) -- 8 droidekas (special case: 0 leg pairs)
    AddWalkerType(1, 0) --
    AddWalkerType(2, 2) -- 2 spider walkers with 2 leg pairs each
    AddWalkerType(3, 0) -- 2 attes with 3 leg pairs each
    SetMemoryPoolSize ("CommandWalker",0)
    SetMemoryPoolSize("CommandHover",0)
    SetMemoryPoolSize ("MountedTurret",54)
--  SetMemoryPoolSize("EntityTauntaun", 0)
    SetMemoryPoolSize("EntityHover", 10)
    SetMemoryPoolSize("EntityCarrier", 0)
    SetMemoryPoolSize("EntityBuildingArmedDynamic", 0);
    SetMemoryPoolSize("PowerupItem", 30)
    SetMemoryPoolSize("EntityMine", 30)
    SetMemoryPoolSize("Aimer", 100)
    SetMemoryPoolSize("Obstacle", 600)
    SetMemoryPoolSize ("Weapon", 265)

    SetSpawnDelay(10.0, 0.25)
    ReadDataFile("KAS\\kas2.lvl")
    SetDenseEnvironment("false")

--  Birdies
    SetNumBirdTypes(1);
    SetBirdType(0,1.0,"bird");

--  Fishies
    SetNumFishTypes(1);
    SetFishType(0,0.8,"fish");

--  Local Stats
    SetTeamName(3, "locals")
    SetTeamIcon(3, "all_icon")
    AddUnitClass(3, "wok_inf_warrior", 3)
    AddUnitClass(3, "wok_inf_rocketeer", 2)
    AddUnitClass(3, "wok_inf_mechanic", 2)
    SetUnitCount(3, 7)
    SetTeamAsEnemy(3,ATT)
    SetTeamAsFriend(3,DEF)

--  Sound

    OpenAudioStream("sound\\kas.lvl",  "kascw_music");
    OpenAudioStream("sound\\cw.lvl",  "cw_vo");
    OpenAudioStream("sound\\cw.lvl",  "cw_tac_vo");
    OpenAudioStream("sound\\kas.lvl",  "kas");
    OpenAudioStream("sound\\kas.lvl",  "kas");

    SetBleedingVoiceOver(REP, REP, "rep_off_com_report_us_overwhelmed", 1);
    SetBleedingVoiceOver(REP, CIS, "rep_off_com_report_enemy_losing",   1);
    SetBleedingVoiceOver(CIS, REP, "cis_off_com_report_enemy_losing",   1);
    SetBleedingVoiceOver(CIS, CIS, "cis_off_com_report_us_overwhelmed", 1);

    SetAmbientMusic(REP, 1.0, "rep_kas_amb_start",  0,1);
    SetAmbientMusic(REP, 0.99, "rep_kas_amb_middle", 1,1);
    SetAmbientMusic(REP, 0.1,"rep_kas_amb_end",    2,1);
    SetAmbientMusic(CIS, 1.0, "cis_kas_amb_start",  0,1);
    SetAmbientMusic(CIS, 0.99, "cis_kas_amb_middle", 1,1);
    SetAmbientMusic(CIS, 0.1,"cis_kas_amb_end",    2,1);

    SetVictoryMusic(REP, "rep_kas_amb_victory");
    SetDefeatMusic (REP, "rep_kas_amb_defeat");
    SetVictoryMusic(CIS, "cis_kas_amb_victory");
    SetDefeatMusic (CIS, "cis_kas_amb_defeat");

    SetOutOfBoundsVoiceOver(1, "cisleaving");
    SetOutOfBoundsVoiceOver(2, "repleaving");

    SetSoundEffect("ScopeDisplayZoomIn",  "binocularzoomin");
    SetSoundEffect("ScopeDisplayZoomOut", "binocularzoomout");
    --SetSoundEffect("WeaponUnableSelect",  "com_weap_inf_weaponchange_null");
    --SetSoundEffect("WeaponModeUnableSelect",  "com_weap_inf_modechange_null");
    SetSoundEffect("SpawnDisplayUnitChange",       "shell_select_unit");
    SetSoundEffect("SpawnDisplayUnitAccept",       "shell_menu_enter");
    SetSoundEffect("SpawnDisplaySpawnPointChange", "shell_select_change");
    SetSoundEffect("SpawnDisplaySpawnPointAccept", "shell_menu_enter");
    SetSoundEffect("SpawnDisplayBack",             "shell_menu_exit");

    SetAttackingTeam(ATT);

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

--Kas2 Docks
--Wide beach shot
AddCameraShot(0.999802, -0.015964, 0.011840, 0.000189, 113.108002, 1.022731, 269.666748);
--Dock
AddCameraShot(0.953681, -0.012084, -0.300552, -0.003808, 19.168949, 2.542728, 119.974800);
--Platform
AddCameraShot(0.523602, -0.007785, 0.851833, 0.012665, 262.619171, 16.203047, -53.650951);


end