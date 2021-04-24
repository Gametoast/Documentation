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

    AddMissionObjective(IMP, "red", "level.tat2.objectives.1");
--  AddMissionObjective(IMP, "orange", "level.tat2.objectives.2");
    AddMissionObjective(ALL, "red", "level.tat2.objectives.1");
--  AddMissionObjective(ALL, "orange", "level.tat2.objectives.3");

SetTeamAggressiveness(IMP, 0.95)
SetTeamAggressiveness(ALL, 0.95)
SetMaxFlyHeight(40);

  SetPlayerTeamDifficultyEasy (4)
  SetEnemyTeamDifficultyEasy (-3)

  SetPlayerTeamDifficultyMedium (2)
  SetEnemyTeamDifficultyMedium (-6)

--  SetPlayerTeamDifficultyHard (0)
--  SetEnemyTeamDifficultyHard (0)

    ReadDataFile("sound\\tat.lvl;tat2gcw");

    ReadDataFile("SIDE\\all.lvl",
        "all_fly_moncalamari_dome",
        "all_inf_basicdesert",
        "all_inf_lukeskywalker",
        "all_inf_smuggler");
    ReadDataFile("SIDE\\imp.lvl",
        "imp_walk_atst",
        "imp_inf_basic",
        "imp_inf_dark_trooper",
        "imp_inf_darthvader");
    ReadDataFile("SIDE\\des.lvl",
        "tat_inf_jawa");

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
      AddUnitClass(IMP, "imp_inf_storm_trooper",11)
      AddUnitClass(IMP, "imp_inf_shock_trooper",3)
      AddUnitClass(IMP, "imp_inf_pilotatst",4)
      AddUnitClass(IMP, "imp_inf_scout_trooper",4)
      AddUnitClass(IMP, "imp_inf_dark_trooper",3)
    SetHeroClass(IMP, "imp_inf_darthvader")
    ActivateBonus(IMP, "HERO")

--  Attacker Stats
    SetUnitCount(ATT, 25)
    SetReinforcementCount(ATT, 200)
    AddBleedThreshold(ATT, 31, 0.0)
    AddBleedThreshold(ATT, 21, 0.75)
    AddBleedThreshold(ATT, 11, 2.25)
    AddBleedThreshold(ATT, 1, 3.0)
    SetTeamAsFriend(ATT, 3)

--  Defender Stats
    SetUnitCount(DEF, 25)
    SetReinforcementCount(DEF, 200)
    AddBleedThreshold(DEF, 31, 0.0)
    AddBleedThreshold(DEF, 21, 0.75)
    AddBleedThreshold(DEF, 11, 2.25)
    AddBleedThreshold(DEF, 1, 3.0)
    SetTeamAsFriend(DEF, 3)

--  Local Stats
    SetTeamName (3, "locals")
    AddUnitClass (3, "tat_inf_jawa", 14);
    SetUnitCount (3, 14)
    SetTeamAsFriend(3,ATT)
    SetTeamAsFriend(3,DEF)

--  Level Stats
    ClearWalkers()
    AddWalkerType(0, 0) -- special -> droidekas
    AddWalkerType(1, 1) -- 1x2 (1 pair of legs)
    AddWalkerType(2, 0) -- 2x2 (2 pairs of legs)
    AddWalkerType(3, 0) -- 3x2 (3 pairs of legs)
    SetMemoryPoolSize("Obstacle", 653)
    SetSpawnDelay(10.0, 0.25)
    ReadDataFile("TAT\\tat2.lvl")
    SetDenseEnvironment("false")


--  Sound Stats
    OpenAudioStream("sound\\tat.lvl",  "tatgcw_music");
    OpenAudioStream("sound\\tat.lvl",  "tat2");
    OpenAudioStream("sound\\tat.lvl",  "tat2");
    OpenAudioStream("sound\\gcw.lvl",  "gcw_vo");
    OpenAudioStream("sound\\gcw.lvl",  "gcw_tac_vo");

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

    --SetSoundEffect("ScopeDisplayZoomIn",  "binocularzoomin");
    --SetSoundEffect("ScopeDisplayZoomOut", "binocularzoomout");
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

    SetAttackingTeam(ATT);

--  Camera Stats
--Tat2 Mos Eisley
--Overhead
AddCameraShot(0.514878, -0.143332, -0.814235, -0.226667, -351.052490, 31.599720, -71.300522);
--Derelict
AddCameraShot(0.899316, 0.007445, 0.437220, -0.003620, -212.966995, 20.173393, 56.179829);
--Cantina
AddCameraShot(0.902993, -0.019975, -0.429085, -0.009492, -205.001770, 17.679758, 77.177254);
end
