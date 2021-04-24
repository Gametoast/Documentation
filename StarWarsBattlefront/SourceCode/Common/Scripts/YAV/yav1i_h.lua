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

    SetTeamAggressiveness(ALL, 1.0)
    SetTeamAggressiveness(IMP, 1.0)

  SetPlayerTeamDifficultyEasy (4)
  SetEnemyTeamDifficultyEasy (4)

  SetPlayerTeamDifficultyMedium (2)
  SetEnemyTeamDifficultyMedium (-2)

  SetPlayerTeamDifficultyHard (6)
  SetEnemyTeamDifficultyHard (-1)
  
   	SetMaxFlyHeight(14)
	SetMaxPlayerFlyHeight (14)

        AddMissionObjective(ALL, "orange", "level.yavin1.objectives.1");
    AddMissionObjective(IMP, "orange", "level.yavin1.objectives.1");

    ReadDataFile("sound\\yav.lvl;yav1gcw");
    ReadDataFile("SIDE\\all.lvl",
        "all_inf_basicjungle",
        "all_inf_lukeskywalker",
        "all_inf_smuggler");
    ReadDataFile("SIDE\\imp.lvl",
        "imp_hover_speederbike",
        "imp_inf_basic",
        "imp_inf_dark_trooper",
        "imp_inf_darthvader",
        "imp_walk_atst");

-- Alliance Stats
    SetTeamName(ALL, "Alliance")
    SetTeamIcon(ALL, "all_icon")
        AddUnitClass(ALL, "all_inf_soldierjungle",11)
        AddUnitClass(ALL, "all_inf_vanguardjungle",3)
        AddUnitClass(ALL, "all_inf_pilot",4)
        AddUnitClass(ALL, "all_inf_marksmanjungle",4)
        AddUnitClass(ALL, "all_inf_smuggler",3)
    SetHeroClass(ALL, "all_inf_lukeskywalker")
-- Imperial Stats
    SetTeamName(IMP, "Empire")
    SetTeamIcon(IMP, "imp_icon")
      AddUnitClass(IMP, "imp_inf_storm_trooper",11)
      AddUnitClass(IMP, "imp_inf_shock_trooper",3)
      AddUnitClass(IMP, "imp_inf_pilotatst",4)
      AddUnitClass(IMP, "imp_inf_scout_trooper",4)
      AddUnitClass(IMP, "imp_inf_dark_trooper",3)
    SetHeroClass(IMP, "imp_inf_darthvader")

--  Attacker Stats
    SetUnitCount(ATT, 25)
    SetReinforcementCount(ATT, 200)
    AddBleedThreshold(ATT, 31, 0.0)
    AddBleedThreshold(ATT, 21, 0.75)
    AddBleedThreshold(ATT, 11, 2.25)
    AddBleedThreshold(ATT, 1, 3.0)

--  Defender Stats
    SetUnitCount(DEF, 25)
    SetReinforcementCount(DEF, 200)
    AddBleedThreshold(DEF, 31, 0.0)
    AddBleedThreshold(DEF, 21, 0.75)
    AddBleedThreshold(DEF, 11, 2.25)
    AddBleedThreshold(DEF, 1, 3.0)

--  Level Stats
--  ClearWalkers()
    AddWalkerType(0, 0) -- special -> droidekas
    AddWalkerType(1, 7) -- 1x2 (1 pair of legs)
    AddWalkerType(2, 0) -- 2x2 (2 pairs of legs)
    AddWalkerType(3, 0) -- 3x2 (3 pairs of legs)
    SetMemoryPoolSize("EntityFlyer", 0)
--  SetMemoryPoolSize("EntityTauntaun", 0)
    SetMemoryPoolSize("EntityHover", 4)
    SetMemoryPoolSize("EntityCarrier", 0)
    SetMemoryPoolSize("Aimer", 65)
    SetMemoryPoolSize("Obstacle", 740)
    SetSpawnDelay(10.0, 0.25);
    ReadDataFile("YAV\\yav1.lvl")
    SetDenseEnvironment("false")

--  Birdies
    SetNumBirdTypes(2);
    SetBirdType(0,1.0,"bird");
    SetBirdType(1,1.5,"bird2");

--  Fishies
    SetNumFishTypes(1);
    SetFishType(0,0.8,"fish");

--  Sound
    
    SetSoundEffect("ScopeDisplayZoomIn",  "binocularzoomin");
    SetSoundEffect("ScopeDisplayZoomOut", "binocularzoomout");
    
    OpenAudioStream("sound\\yav.lvl",  "yavgcw_music")
    OpenAudioStream("sound\\gcw.lvl",  "gcw_vo")
    OpenAudioStream("sound\\gcw.lvl",  "gcw_tac_vo")
    OpenAudioStream("sound\\yav.lvl",  "yav1");
    OpenAudioStream("sound\\yav.lvl",  "yav1");
    OpenAudioStream("sound\\yav.lvl",  "yav1_emt");

    SetBleedingVoiceOver(ALL, ALL, "all_off_com_report_us_overwhelmed", 1);
    SetBleedingVoiceOver(ALL, IMP, "all_off_com_report_enemy_losing",   1);
    SetBleedingVoiceOver(IMP, ALL, "imp_off_com_report_enemy_losing",   1);
    SetBleedingVoiceOver(IMP, IMP, "imp_off_com_report_us_overwhelmed", 1);

    SetLowReinforcementsVoiceOver(ALL, ALL, "all_off_defeat_im", .1, 1);
    SetLowReinforcementsVoiceOver(ALL, IMP, "all_off_victory_im", .1, 1);
    SetLowReinforcementsVoiceOver(IMP, IMP, "imp_off_defeat_im", .1, 1);
    SetLowReinforcementsVoiceOver(IMP, ALL, "imp_off_victory_im", .1, 1);

    SetOutOfBoundsVoiceOver(1, "impleaving");
    SetOutOfBoundsVoiceOver(2, "allleaving");

    SetAmbientMusic(ALL, 1.0, "all_yav_amb_start",  0,1);
    SetAmbientMusic(ALL, 0.99, "all_yav_amb_middle", 1,1);
    SetAmbientMusic(ALL, 0.1,"all_yav_amb_end",    2,1);
    SetAmbientMusic(IMP, 1.0, "imp_yav_amb_start",  0,1);
    SetAmbientMusic(IMP, 0.99, "imp_yav_amb_middle", 1,1);
    SetAmbientMusic(IMP, 0.1,"imp_yav_amb_end",    2,1);

    SetVictoryMusic(ALL, "all_yav_amb_victory");
    SetDefeatMusic (ALL, "all_yav_amb_defeat");
    SetVictoryMusic(IMP, "imp_yav_amb_victory");
    SetDefeatMusic (IMP, "imp_yav_amb_defeat");

    SetSoundEffect("ScopeDisplayZoomIn",      "binocularzoomin");
    SetSoundEffect("ScopeDisplayZoomOut",     "binocularzoomout");
    --SetSoundEffect("BirdScatter",             "birdsFlySeq1");
    --SetSoundEffect("WeaponUnableSelect",      "com_weap_inf_weaponchange_null");
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
--Yav 1 - Temple
--Fountain
AddCameraShot(0.925694, -0.056832, 0.373277, 0.022917, 132.356064, -65.527252, -25.416561);
--Forrest Ruins
AddCameraShot(0.361355, -0.024311, -0.930009, -0.062569, 93.845818, -52.247051, -194.743134);
--Temple
AddCameraShot(0.934074, 0.077334, -0.347417, 0.028764, 102.660049, -30.127220, -335.167145);

end

