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
    local ALL = 2
    local IMP = 1
--  These variables do not change
    local ATT = 1
    local DEF = 2
    SetHistorical()

    SetAttackingTeam(ATT);

        AddMissionObjective(IMP, "orange", "level.hoth.objectives.1");
    AddMissionObjective(IMP, "red", "level.hoth.objectives.2");
--  AddMissionObjective(IMP, "red", "level.hoth.objectives.3");
    AddMissionObjective(ALL, "orange", "level.hoth.objectives.1");
    AddMissionObjective(ALL, "red", "level.hoth.objectives.3");
    AddMissionObjective(ALL, "red", "level.hoth.objectives.4");

    SetTeamAggressiveness(ALL, 1.0)
    SetTeamAggressiveness(IMP, 1.0)

  SetPlayerTeamDifficultyEasy (2)
  SetEnemyTeamDifficultyEasy (6)

  SetPlayerTeamDifficultyMedium (2)
  SetEnemyTeamDifficultyMedium (0)

  SetPlayerTeamDifficultyHard (0)
  SetEnemyTeamDifficultyHard (3)

    SetMaxFlyHeight(70)
    SetMaxPlayerFlyHeight(70)

    ReadDataFile("sound\\hot.lvl;hot1gcw");
    ReadDataFile("SIDE\\all.lvl",
        "all_fly_snowspeeder",
        "all_inf_basicsnow",
        "all_inf_lukeskywalkersnow",
        "all_inf_smugglersnow",
        "all_walk_tauntaun")
    ReadDataFile("SIDE\\imp.lvl",
        "imp_inf_basicsnow",
--        "imp_inf_dark_troopersnow",
        "imp_inf_darthvader",
        "imp_walk_atat",
        "imp_walk_atst_snow",
        "imp_droid_probe")

--      Alliance Stats
        SetTeamName(ALL, "Alliance")
        SetTeamIcon(ALL, "all_icon")
    AddUnitClass(ALL, "all_inf_soldiersnow",14)
    AddUnitClass(ALL, "all_inf_vanguardsnow",3)
    AddUnitClass(ALL, "all_inf_pilot",4)
    AddUnitClass(ALL, "all_inf_marksmansnow",4)
    AddUnitClass(ALL, "all_inf_smugglersnow",3)
    SetHeroClass(ALL, "all_inf_lukeskywalkersnow")
    ActivateBonus(ALL, "HERO")

--      Imperial Stats
        SetTeamName(IMP, "Empire")
        SetTeamIcon(IMP, "imp_icon")
    AddUnitClass(IMP, "imp_inf_storm_troopersnow",14)
    AddUnitClass(IMP, "imp_inf_shock_troopersnow",3)
    AddUnitClass(IMP, "imp_inf_pilotatat",4)
    AddUnitClass(IMP, "imp_inf_scout_troopersnow",4)
--    AddUnitClass(IMP, "imp_inf_dark_troopersnow",3)
    SetHeroClass(IMP, "imp_inf_darthvader")

--  Level Stats
    ClearWalkers()
    SetMemoryPoolSize("EntityWalker", -2)
    AddWalkerType(0, 0) -- 0 droidekas
    AddWalkerType(1, 10) -- 6 atsts with 1 leg pairs each
    AddWalkerType(2, 2) -- 2 atats with 2 leg pairs each
    SetMemoryPoolSize("CommandWalker", 2)
    SetMemoryPoolSize("EntityFlyer", 4)
    SetMemoryPoolSize("MountedTurret", 48)
    SetMemoryPoolSize("PowerupItem", 60)
    SetMemoryPoolSize("EntityMine", 40)
    SetMemoryPoolSize("OrdnanceTowCable", 8) -- need extra for wrapped/fallen cables
    SetMemoryPoolSize("EntityLight", 120)

    ReadDataFile("HOT\\hot1.lvl")
    SetSpawnDelay(10.0, 0.25)
    SetDenseEnvironment("false")
    SetDefenderSnipeRange(170)
    AddDeathRegion("Death");

--  Local Stats
--  SetTeamName(3, "Local")
--  AddUnitClass(3, "snw_inf_wampa", 1);
--  SetUnitCount(3, 1)
--  SetTeamAsEnemy(3,ATT)
--  SetTeamAsEnemy(3,DEF)

--  Attacker Stats
    SetUnitCount(ATT, 28)
    SetReinforcementCount(ATT, 250)
    AddBleedThreshold(ATT, 31, 0.0)
    AddBleedThreshold(ATT, 21, 0.75)
    AddBleedThreshold(ATT, 11, 2.25)
    AddBleedThreshold(ATT, 1, 3.0)
    SetTeamAsFriend(ATT, 3)

--  Defender Stats
    SetUnitCount(DEF, 28)
    SetReinforcementCount(DEF, 200)
    AddBleedThreshold(DEF, 31, 0.0)
    AddBleedThreshold(DEF, 21, 0.75)
    AddBleedThreshold(DEF, 11, 2.25)
    AddBleedThreshold(DEF, 1, 3.0)
    SetTeamAsEnemy(DEF, 3)

--  Sound Stats
    OpenAudioStream("sound\\hot.lvl",  "hotgcw_music");
    OpenAudioStream("sound\\gcw.lvl", "gcw_vo");
    OpenAudioStream("sound\\gcw.lvl", "gcw_tac_vo");
    OpenAudioStream("sound\\hot.lvl", "hot1gcw");
    OpenAudioStream("sound\\hot.lvl", "hot1gcw");

    SetBleedingVoiceOver(ALL, ALL, "all_off_com_report_us_overwhelmed", 1);
    SetBleedingVoiceOver(ALL, IMP, "all_off_com_report_enemy_losing",   1);
    SetBleedingVoiceOver(IMP, ALL, "imp_off_com_report_enemy_losing",   1);
    SetBleedingVoiceOver(IMP, IMP, "imp_off_com_report_us_overwhelmed", 1);

    --SetLowReinforcementsVoiceOver(ALL, IMP, "all_hot_transport_away", .75, 1);
    --SetLowReinforcementsVoiceOver(ALL, IMP, "all_hot_transport_away", .5, 1);
    --SetLowReinforcementsVoiceOver(ALL, IMP, "all_hot_transport_away", .25, 1);

    SetLowReinforcementsVoiceOver(ALL, ALL, "all_off_defeat_im", .1, 1);
    SetLowReinforcementsVoiceOver(ALL, IMP, "all_off_victory_im", .1, 1);
    SetLowReinforcementsVoiceOver(IMP, IMP, "imp_off_defeat_im", .1, 1);
    SetLowReinforcementsVoiceOver(IMP, ALL, "imp_off_victory_im", .1, 1);

    SetOutOfBoundsVoiceOver(2, "Allleaving");
    SetOutOfBoundsVoiceOver(1, "Impleaving");

    SetAmbientMusic(ALL, 1.0, "all_hot_amb_start",  0,1);
    SetAmbientMusic(ALL, 0.5, "all_hot_amb_middle", 1,1);
    SetAmbientMusic(ALL, 0.25,"all_hot_amb_end",    2,1);
    SetAmbientMusic(IMP, 1.0, "imp_hot_amb_start",  0,1);
    SetAmbientMusic(IMP, 0.5, "imp_hot_amb_middle", 1,1);
    SetAmbientMusic(IMP, 0.25,"imp_hot_amb_end",    2,1);

    SetVictoryMusic(ALL, "all_hot_amb_victory");
    SetDefeatMusic (ALL, "all_hot_amb_defeat");
    SetVictoryMusic(IMP, "imp_hot_amb_victory");
    SetDefeatMusic (IMP, "imp_hot_amb_defeat");

    SetSoundEffect("ScopeDisplayZoomIn",  "binocularzoomin");
    SetSoundEffect("ScopeDisplayZoomOut", "binocularzoomout");
    --SetSoundEffect("WeaponUnableSelect",  "com_weap_inf_weaponchange_null");
    --SetSoundEffect("WeaponModeUnableSelect",  "com_weap_inf_modechange_null");
    SetSoundEffect("SpawnDisplayUnitChange",       "shell_select_unit");
    SetSoundEffect("SpawnDisplayUnitAccept",       "shell_menu_enter");
    SetSoundEffect("SpawnDisplaySpawnPointChange", "shell_select_change");
    SetSoundEffect("SpawnDisplaySpawnPointAccept", "shell_menu_enter");
    SetSoundEffect("SpawnDisplayBack",             "shell_menu_exit");

    SetPlanetaryBonusVoiceOver(IMP, IMP, 0, "imp_bonus_imp_medical");
    SetPlanetaryBonusVoiceOver(IMP, ALL, 0, "imp_bonus_all_medical");
    SetPlanetaryBonusVoiceOver(IMP, IMP, 1, "");
    SetPlanetaryBonusVoiceOver(IMP, ALL, 1, "");
    SetPlanetaryBonusVoiceOver(IMP, IMP, 2, "imp_bonus_imp_sensors");
    SetPlanetaryBonusVoiceOver(IMP, ALL, 2, "imp_bonus_all_sensors");
    SetPlanetaryBonusVoiceOver(IMP, IMP, 3, "imp_bonus_imp_hero");
    SetPlanetaryBonusVoiceOver(IMP, ALL, 3, "imp_bonus_all_hero");
    SetPlanetaryBonusVoiceOver(IMP, IMP, 4, "imp_bonus_imp_reserves");
    SetPlanetaryBonusVoiceOver(IMP, ALL, 4, "imp_bonus_all_reserves");
    SetPlanetaryBonusVoiceOver(IMP, IMP, 5, "imp_bonus_imp_sabotage");--sabotage
    SetPlanetaryBonusVoiceOver(IMP, ALL, 5, "imp_bonus_all_sabotage");
    SetPlanetaryBonusVoiceOver(IMP, IMP, 6, "");
    SetPlanetaryBonusVoiceOver(IMP, ALL, 6, "");
    SetPlanetaryBonusVoiceOver(IMP, IMP, 7, "imp_bonus_imp_training");--advanced training
    SetPlanetaryBonusVoiceOver(IMP, ALL, 7, "imp_bonus_all_training");--advanced training

    SetPlanetaryBonusVoiceOver(ALL, ALL, 0, "all_bonus_all_medical");
    SetPlanetaryBonusVoiceOver(ALL, IMP, 0, "all_bonus_imp_medical");
    SetPlanetaryBonusVoiceOver(ALL, ALL, 1, "");
    SetPlanetaryBonusVoiceOver(ALL, IMP, 1, "");
    SetPlanetaryBonusVoiceOver(ALL, ALL, 2, "all_bonus_all_sensors");
    SetPlanetaryBonusVoiceOver(ALL, IMP, 2, "all_bonus_imp_sensors");
    SetPlanetaryBonusVoiceOver(ALL, ALL, 3, "all_bonus_all_hero");
    SetPlanetaryBonusVoiceOver(ALL, IMP, 3, "all_bonus_imp_hero");
    SetPlanetaryBonusVoiceOver(ALL, ALL, 4, "all_bonus_all_reserves");
    SetPlanetaryBonusVoiceOver(ALL, IMP, 4, "all_bonus_imp_reserves");
    SetPlanetaryBonusVoiceOver(ALL, ALL, 5, "all_bonus_all_sabotage");--sabotage
    SetPlanetaryBonusVoiceOver(ALL, IMP, 5, "all_bonus_imp_sabotage");
    SetPlanetaryBonusVoiceOver(ALL, ALL, 6, "");
    SetPlanetaryBonusVoiceOver(ALL, IMP, 6, "");
    SetPlanetaryBonusVoiceOver(ALL, ALL, 7, "all_bonus_all_training");--advanced training
    SetPlanetaryBonusVoiceOver(ALL, IMP, 7, "all_bonus_imp_training");--advanced training

--  Camera Stats
--Hoth
--Hangar
AddCameraShot(0.944210, 0.065541, 0.321983, -0.022350, -500.489838, 0.797472, -68.773849);
--Shield Generator
AddCameraShot(0.371197, 0.008190, -0.928292, 0.020482, -473.384155, -17.880533, 132.126801);
--Battlefield
AddCameraShot(0.927083, 0.020456, -0.374206, 0.008257, -333.221558, 0.676043, -14.027348);


end
