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

    AddMissionObjective(IMP, "orange", "level.tat1.objectives.1");
    AddMissionObjective(IMP, "red", "level.tat1.objectives.2");
    AddMissionObjective(ALL, "orange", "level.tat1.objectives.1");
    AddMissionObjective(ALL, "red", "level.tat1.objectives.2");

    SetTeamAggressiveness(IMP, 0.95)
    SetTeamAggressiveness(ALL, 0.95)

  SetPlayerTeamDifficultyEasy (7)
  SetEnemyTeamDifficultyEasy (-3)

  SetPlayerTeamDifficultyMedium (2)
  SetEnemyTeamDifficultyMedium (-6)

--  SetPlayerTeamDifficultyHard (0)
--  SetEnemyTeamDifficultyHard (0)


    ReadDataFile("sound\\tat.lvl;tat1gcw");

    ReadDataFile("SIDE\\all.lvl",
        "all_fly_xwing",
        "all_hover_combatspeeder",
        "all_inf_basicdesert",
        "all_inf_lukeskywalker",
        "all_inf_smuggler")
    ReadDataFile("SIDE\\imp.lvl",
        "imp_fly_destroyer_dome",
        "imp_fly_tiefighter",
        "imp_hover_speederbike",
        "imp_walk_atst",
        "imp_inf_basic_tie",
        "imp_inf_dark_trooper",
        "imp_inf_darthvader")
    ReadDataFile("SIDE\\des.lvl",
        "tat_inf_tuskenhunter",
        "tat_inf_tuskenraider")

    SetAttackingTeam(ATT);

--      Alliance Stats
    SetTeamName(ALL, "Alliance")
    SetTeamIcon(ALL, "all_icon")
    AddUnitClass(ALL, "all_inf_soldierdesert",11)
    AddUnitClass(ALL, "all_inf_vanguard",3)
    AddUnitClass(ALL, "all_inf_pilot",4)
    AddUnitClass(ALL, "all_inf_marksman",4)
    AddUnitClass(ALL, "all_inf_smuggler",3)
    SetHeroClass(ALL, "all_inf_lukeskywalker")

--      Imperial Stats
    SetTeamName(IMP, "Empire")
    SetTeamIcon(IMP, "imp_icon")
    AddUnitClass(IMP, "imp_inf_storm_trooper",14)
    AddUnitClass(IMP, "imp_inf_shock_trooper",3)
    AddUnitClass(IMP, "imp_inf_pilottie",4)
    AddUnitClass(IMP, "imp_inf_scout_trooper",4)
    SetHeroClass(IMP, "imp_inf_darthvader")

--  Attacker Stats
    SetUnitCount(ATT, 25)
    SetReinforcementCount(ATT, 250)
    AddBleedThreshold(ATT, 31, 0.0)
    AddBleedThreshold(ATT, 21, 0.75)
    AddBleedThreshold(ATT, 11, 2.25)
    AddBleedThreshold(ATT, 1, 3.0)

--  Defender Stats
    SetUnitCount(DEF, 25)
    SetReinforcementCount(DEF, 250)
    AddBleedThreshold(DEF, 31, 0.0)
    AddBleedThreshold(DEF, 21, 0.75)
    AddBleedThreshold(DEF, 11, 2.25)
    AddBleedThreshold(DEF, 1, 3.0)

--  Local Stats
    SetTeamName(3, "locals")
    AddUnitClass(3, "tat_inf_tuskenraider", 5);
    AddUnitClass(3, "tat_inf_tuskenhunter", 2);
    SetUnitCount(3, 14)

--  Level Stats
    ClearWalkers()
    AddWalkerType(0, 0)
    AddWalkerType(1, 4)
    AddWalkerType(2, 0)
    SetMemoryPoolSize("EntityHover", 12)
    SetMemoryPoolSize("EntityFlyer", 5)
--  SetMemoryPoolSize("EntityBuildingArmedDynamic", 16)
--  SetMemoryPoolSize("EntityTauntaun", 0)
    SetMemoryPoolSize("MountedTurret", 22)
    SetMemoryPoolSize("PowerupItem", 60)
    SetMemoryPoolSize("EntityMine", 40)
    SetMemoryPoolSize("Aimer", 200)
    SetMemoryPoolSize("Obstacle", 725)
    SetSpawnDelay(10.0, 0.25)
    ReadDataFile("TAT\\tat1h.lvl")
    SetDenseEnvironment("false")
    AddDeathRegion("Sarlac01")
    SetMaxFlyHeight(90)
    SetMaxPlayerFlyHeight(90)

--  Sound Stats
    OpenAudioStream("sound\\tat.lvl",  "tatgcw_music");
    OpenAudioStream("sound\\tat.lvl",  "tat1");
    OpenAudioStream("sound\\tat.lvl",  "tat1");
    OpenAudioStream("sound\\gcw.lvl",  "gcw_vo");
    OpenAudioStream("sound\\gcw.lvl",  "gcw_tac_vo");
    OpenAudioStream("sound\\tat.lvl",  "tat1_emt");

    SetBleedingVoiceOver(ALL, ALL, "all_off_com_report_us_overwhelmed", 1);
    SetBleedingVoiceOver(ALL, IMP, "all_off_com_report_enemy_losing",   1);
    SetBleedingVoiceOver(IMP, ALL, "imp_off_com_report_enemy_losing",   1);
    SetBleedingVoiceOver(IMP, IMP, "imp_off_com_report_us_overwhelmed", 1);

    SetLowReinforcementsVoiceOver(ALL, ALL, "all_off_defeat_im", .1, 1);
    SetLowReinforcementsVoiceOver(ALL, IMP, "all_off_victory_im", .1, 1);
    SetLowReinforcementsVoiceOver(IMP, IMP, "imp_off_defeat_im", .1, 1);
    SetLowReinforcementsVoiceOver(IMP, ALL, "imp_off_victory_im", .1, 1);

    SetOutOfBoundsVoiceOver(2, "Allleaving");
    SetOutOfBoundsVoiceOver(1, "Impleaving");

    SetAmbientMusic(ALL, 1.0, "all_tat_amb_start",  0,1);
    SetAmbientMusic(ALL, 0.99, "all_tat_amb_middle", 1,1);
    SetAmbientMusic(ALL, 0.1,"all_tat_amb_end",    2,1);
    SetAmbientMusic(IMP, 1.0, "imp_tat_amb_start",  0,1);
    SetAmbientMusic(IMP, 0.99, "imp_tat_amb_middle", 1,1);
    SetAmbientMusic(IMP, 0.1,"imp_tat_amb_end",    2,1);

    SetVictoryMusic(ALL, "all_tat_amb_victory");
    SetDefeatMusic (ALL, "all_tat_amb_defeat");
    SetVictoryMusic(IMP, "imp_tat_amb_victory");
    SetDefeatMusic (IMP, "imp_tat_amb_defeat");

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
--Tat 1 - Dune Sea
--Crawler
AddCameraShot(-0.404895, 0.000992, -0.914360, -0.002240, -85.539894, 20.536297, 141.699493);
--Homestead
AddCameraShot(0.040922, 0.004049, -0.994299, 0.098381, -139.729523, 17.546598, -34.360893);
--Sarlac Pit
AddCameraShot(-0.312360, 0.016223, -0.948547, -0.049263, -217.381485, 20.150953, 54.514324);

end
