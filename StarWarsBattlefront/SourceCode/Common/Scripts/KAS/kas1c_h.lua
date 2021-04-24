---------------------------------------------------------------------------
-- FUNCTION:    ScriptInit
-- PURPOSE:     This function is only run once
-- INPUT:
-- OUTPUT:
-- NOTES:       The name, 'ScriptInit' is a chosen convention, and each
--              mission script must contain a version of this function, as
--              it is creped from C to start the mission.
---------------------------------------------------------------------------
function ScriptInit()
--  Attacker is always #1
    local WOK = 2;
    local CIS = 1;
--  These variables do not change
    local ATT = 1;
    local DEF = 2;

SetHistorical()

  SetPlayerTeamDifficultyEasy (4)
  SetEnemyTeamDifficultyEasy (-3)

  SetPlayerTeamDifficultyMedium (2)
  SetEnemyTeamDifficultyMedium (-4)

--  SetPlayerTeamDifficultyHard (0)
--  SetEnemyTeamDifficultyHard (0)

SetAttackingTeam(ATT)

    AddMissionObjective(CIS, "orange", "level.kashyyyk1.objectives.1");
    AddMissionObjective(WOK, "orange", "level.kashyyyk1.objectives.1");

--  SetTeamName(3, "locals")
    ReadDataFile("sound\\kas.lvl;kas1cw");
    --ReadDataFile("KAS\\repkas1c.lvl");
    ReadDataFile("SIDE\\cis.lvl",
        "cis_fly_droidfighter",
        "cis_inf_basic",
        "cis_inf_countdooku",
        "cis_inf_droideka");
    ReadDataFile("SIDE\\wok.lvl",
        "wok_inf_basic");



--  Republic Stats
    SetTeamName(WOK, "Wookie");
    SetTeamIcon(WOK, "rep_icon");
    AddUnitClass(WOK, "wok_inf_mechanic", 5)
    AddUnitClass(WOK, "wok_inf_rocketeer", 10)
    AddUnitClass(WOK, "wok_inf_warrior", 10)

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
    SetReinforcementCount(ATT, 200)
    AddBleedThreshold(ATT, 31, 0.0)
    AddBleedThreshold(ATT, 21, 0.75)
    AddBleedThreshold(ATT, 11, 2.25)
    AddBleedThreshold(ATT, 1, 3.0)
    SetTeamAsEnemy(ATT,3)

--  Defender Stats
    SetUnitCount(DEF, 32)
    SetReinforcementCount(DEF, 200)
    AddBleedThreshold(DEF, 31, 0.0)
    AddBleedThreshold(DEF, 21, 0.75)
    AddBleedThreshold(DEF, 11, 2.25)
    AddBleedThreshold(DEF, 1, 3.0)
    --SetTeamAsFriend(DEF,3)




--  Level Stats
    ClearWalkers()
    AddWalkerType(0, 8) -- 8 droidekas with 0 leg pairs each
    ClearWalkers()
    AddWalkerType(0, 8) -- 8 droidekas with 0 leg pairs each
    SetMemoryPoolSize("Entityflyer", 2)
    SetMemoryPoolSize("Aimer", 150)
    SetMemoryPoolSize ("MountedTurret",50)
--  SetMemoryPoolSize("EntityTauntaun", 0)
    SetMemoryPoolSize("EntityCarrier", 0)
    SetMemoryPoolSize("EntityBuildingArmedDynamic", 0)
    SetMemoryPoolSize("PowerupItem", 40)
    SetMemoryPoolSize("EntityMine", 40)
    SetMemoryPoolSize("Obstacle", 700)
    SetMemoryPoolSize("EntityLight", 80)

    SetSpawnDelay(10.0, 0.25)
    ReadDataFile("KAS\\kas1.lvl")
    SetDenseEnvironment("true")

    SetMaxFlyHeight(40)
    SetMaxPlayerFlyHeight(40)
    
--  Birdies
    SetNumBirdTypes(1);
    SetBirdType(0,1.0,"bird");
    SetBirdFlockMinHeight(-28.0);

--  Sound
    OpenAudioStream("sound\\kas.lvl",  "kascw_music");
    OpenAudioStream("sound\\cw.lvl",  "cw_vo");
    OpenAudioStream("sound\\cw.lvl",  "cw_tac_vo");
    OpenAudioStream("sound\\kas.lvl",  "kas");
    OpenAudioStream("sound\\kas.lvl",  "kas");

    SetBleedingVoiceOver(CIS, WOK, "cis_off_com_report_enemy_losing_generic",   1);
    SetBleedingVoiceOver(CIS, CIS, "cis_off_com_report_us_overwhelmed_generic", 1);

    SetOutOfBoundsVoiceOver(1, "cisleaving");

    SetAmbientMusic(CIS, 1.0, "cis_kas_amb_start",  0,1);
    SetAmbientMusic(CIS, 0.99, "cis_kas_amb_middle", 1,1);
    SetAmbientMusic(CIS, 0.1,"cis_kas_amb_end",    2,1);

    SetVictoryMusic(CIS, "cis_kas_amb_victory");
    SetDefeatMusic (CIS, "cis_kas_amb_defeat");

    SetSoundEffect("ScopeDisplayZoomIn",  "binocularzoomin");
    SetSoundEffect("ScopeDisplayZoomOut", "binocularzoomout");
    --SetSoundEffect("WeaponUnableSelect",  "com_weap_inf_weaponchange_null");
    --SetSoundEffect("WeaponModeUnableSelect",  "com_weap_inf_modechange_null");
    SetSoundEffect("SpawnDisplayUnitChange",       "shell_select_unit");
    SetSoundEffect("SpawnDisplayUnitAccept",       "shell_menu_enter");
    SetSoundEffect("SpawnDisplaySpawnPointChange", "shell_select_change");
    SetSoundEffect("SpawnDisplaySpawnPointAccept", "shell_menu_enter");
    SetSoundEffect("SpawnDisplayBack",             "shell_menu_exit");

    SetPlanetaryBonusVoiceOver(CIS, CIS, 0, "CIS_bonus_CIS_medical");
    SetPlanetaryBonusVoiceOver(CIS, WOK, 0, "CIS_bonus_REP_medical");
    SetPlanetaryBonusVoiceOver(CIS, CIS, 1, "");
    SetPlanetaryBonusVoiceOver(CIS, WOK, 1, "");
    SetPlanetaryBonusVoiceOver(CIS, CIS, 2, "CIS_bonus_CIS_sensors");
    SetPlanetaryBonusVoiceOver(CIS, WOK, 2, "CIS_bonus_REP_sensors");
    SetPlanetaryBonusVoiceOver(CIS, CIS, 3, "CIS_bonus_CIS_hero");
    SetPlanetaryBonusVoiceOver(CIS, WOK, 3, "CIS_bonus_REP_hero");
    SetPlanetaryBonusVoiceOver(CIS, CIS, 4, "CIS_bonus_CIS_reserves");
    SetPlanetaryBonusVoiceOver(CIS, WOK, 4, "CIS_bonus_REP_reserves");
    SetPlanetaryBonusVoiceOver(CIS, CIS, 5, "CIS_bonus_CIS_sabotage");--sabotage
    SetPlanetaryBonusVoiceOver(CIS, WOK, 5, "CIS_bonus_REP_sabotage");
    SetPlanetaryBonusVoiceOver(CIS, CIS, 6, "");
    SetPlanetaryBonusVoiceOver(CIS, WOK, 6, "");
    SetPlanetaryBonusVoiceOver(CIS, CIS, 7, "CIS_bonus_CIS_training");--advanced training
    SetPlanetaryBonusVoiceOver(CIS, WOK, 7, "CIS_bonus_REP_training");--advanced training

--  SetPlanetaryBonusVoiceOver(REP, REP, 0, "REP_bonus_REP_medical");
--  SetPlanetaryBonusVoiceOver(REP, CIS, 0, "REP_bonus_CIS_medical");
--  SetPlanetaryBonusVoiceOver(REP, REP, 1, "");
--  SetPlanetaryBonusVoiceOver(REP, CIS, 1, "");
--  SetPlanetaryBonusVoiceOver(REP, REP, 2, "REP_bonus_REP_sensors");
--  SetPlanetaryBonusVoiceOver(REP, CIS, 2, "REP_bonus_CIS_sensors");
--  SetPlanetaryBonusVoiceOver(REP, REP, 3, "REP_bonus_REP_hero");
--  SetPlanetaryBonusVoiceOver(REP, CIS, 3, "REP_bonus_CIS_hero");
--  SetPlanetaryBonusVoiceOver(REP, REP, 4, "REP_bonus_REP_reserves");
--  SetPlanetaryBonusVoiceOver(REP, CIS, 4, "REP_bonus_CIS_reserves");
--  SetPlanetaryBonusVoiceOver(REP, REP, 5, "REP_bonus_REP_sabotage");--sabotage
--  SetPlanetaryBonusVoiceOver(REP, CIS, 5, "REP_bonus_CIS_sabotage");
--  SetPlanetaryBonusVoiceOver(REP, REP, 6, "");
--  SetPlanetaryBonusVoiceOver(REP, CIS, 6, "");
--  SetPlanetaryBonusVoiceOver(REP, REP, 7, "REP_bonus_REP_training");--advanced training
--  SetPlanetaryBonusVoiceOver(REP, CIS, 7, "REP_bonus_CIS_training");--advanced training

    ActivateBonus(CIS, "HERO")

    --SetSoundEffect("BirdScatter",         "birdsFlySeq1");



--  Camera Stats
--Kas 1 Islands
--Huts
AddCameraShot(-0.421137, 0.025737, -0.904943, -0.055304, 216.391846, -19.422512, -249.231918);
--Grand Hut
AddCameraShot(0.701411, 0.037622, -0.710742, 0.038123, 49.056309, -29.080774, -87.605171);
--Huts
AddCameraShot(0.916854, -0.005262, 0.399181, 0.002291, 222.269363, -30.438093, -130.609543);
end

