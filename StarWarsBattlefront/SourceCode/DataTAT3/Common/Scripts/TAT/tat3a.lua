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
    local ALL = 1
    local IMP = 2
--  These variables do not change
    local ATT = 1
    local DEF = 2

    AddMissionObjective(IMP, "red", "level.tat3.objectives.1");
    AddMissionObjective(IMP, "orange", "level.tat3.objectives.2");
    AddMissionObjective(IMP, "orange", "level.tat3.objectives.3");
    AddMissionObjective(ALL, "red", "level.tat3.objectives.1");
    AddMissionObjective(ALL, "orange", "level.tat3.objectives.2");
    AddMissionObjective(ALL, "orange", "level.tat3.objectives.3");
    
      SetTeamAggressiveness(IMP, 0.95)
SetTeamAggressiveness(ALL, 0.95)



    ReadDataFile("dc:sound\\tat.lvl;tat3gcw")
    ReadDataFile("SIDE\\all.lvl",
        "all_inf_basicdesert",
        "all_inf_smuggler");

    ReadDataFile("SIDE\\imp.lvl",
        "imp_inf_basic_tie",
        "imp_inf_dark_trooper");

    ReadDataFile("dc:SIDE\\gam.lvl",
        "gam_inf_gamorreanguard")
    
    SetAttackingTeam(ATT);

--      Alliance Stats
    SetTeamName(ALL, "Alliance")
    SetTeamIcon(ALL, "all_icon")
    AddUnitClass(ALL, "all_inf_soldierdesert",10)
    AddUnitClass(ALL, "all_inf_vanguard",1)
    AddUnitClass(ALL, "all_inf_pilot",2)
    AddUnitClass(ALL, "all_inf_marksman",2)
    AddUnitClass(ALL, "all_inf_smuggler",1)

--      Imperial Stats
    SetTeamName(IMP, "Empire")
    SetTeamIcon(IMP, "imp_icon")
    AddUnitClass(IMP, "imp_inf_storm_trooper",10)
    AddUnitClass(IMP, "imp_inf_shock_trooper",1)
    AddUnitClass(IMP, "imp_inf_pilottie",2)
    AddUnitClass(IMP, "imp_inf_scout_trooper",2)
    AddUnitClass(IMP, "imp_inf_dark_trooper",1)

--  Attacker Stats
    SetUnitCount(ATT, 16)
    SetReinforcementCount(ATT, 200)
--    AddBleedThreshold(ATT, 31, 0.0)
--    AddBleedThreshold(ATT, 21, 0.75)
    AddBleedThreshold(ATT, 11, 0.75)
    AddBleedThreshold(ATT, 10, 1.5)
    AddBleedThreshold(ATT, 1, 3.0)

--  Defender Stats
    SetUnitCount(DEF, 16)
    SetReinforcementCount(DEF, 200)
--    AddBleedThreshold(DEF, 31, 0.0)
--    AddBleedThreshold(DEF, 21, 0.75)
    AddBleedThreshold(DEF, 11, 0.75)
    AddBleedThreshold(DEF, 10, 1.5)
    AddBleedThreshold(DEF, 1, 3.0)

--  Local Stats
    SetTeamName(3, "locals")
    AddUnitClass(3, "gam_inf_gamorreanguard",3)
    SetUnitCount(3, 3)
    SetTeamAsEnemy(3, ATT)
    SetTeamAsEnemy(3, DEF) 

--  Level Stats
    ClearWalkers()
    AddWalkerType(0, 0)
    AddWalkerType(1, 4)
    AddWalkerType(2, 0)
    --SetMemoryPoolSize("EntityHover", 12)
    --SetMemoryPoolSize("EntityFlyer", 5)
--  SetMemoryPoolSize("EntityBuildingArmedDynamic", 16)
--  SetMemoryPoolSize("EntityTauntaun", 0)
--  SetMemoryPoolSize("MountedTurret", 22)
    SetMemoryPoolSize("PowerupItem", 60)
    SetMemoryPoolSize("SoundSpaceRegion", 81)
    SetMemoryPoolSize("EntityMine", 40)
    SetMemoryPoolSize("Aimer", 200)
    SetMemoryPoolSize("Obstacle", 725)
    SetSpawnDelay(10.0, 0.25)
    ReadDataFile("dc:TAT\\tat3.lvl")
    SetDenseEnvironment("true")
    --AddDeathRegion("Sarlac01")
    SetMaxFlyHeight(90)
    SetMaxPlayerFlyHeight(90)


--  Sound Stats
    OpenAudioStream("sound\\tat.lvl",  "tatgcw_music");
    OpenAudioStream("dc:sound\\tat.lvl",  "tat3");
    OpenAudioStream("dc:sound\\tat.lvl",  "tat3");
    OpenAudioStream("sound\\gcw.lvl",  "gcw_vo");
    OpenAudioStream("sound\\gcw.lvl",  "gcw_tac_vo");
    OpenAudioStream("dc:sound\\tat.lvl",  "tat3_emt");
    --OpenAudioStream("dc:sound\\tat.lvl",  "tat3_emt");

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

    --SetPlanetaryBonusVoiceOver(IMP, IMP, 0, "imp_bonus_imp_medical");
    --SetPlanetaryBonusVoiceOver(IMP, ALL, 0, "imp_bonus_all_medical");
    --SetPlanetaryBonusVoiceOver(IMP, IMP, 1, "");
    --SetPlanetaryBonusVoiceOver(IMP, ALL, 1, "");
    --SetPlanetaryBonusVoiceOver(IMP, IMP, 2, "imp_bonus_imp_sensors");
    --SetPlanetaryBonusVoiceOver(IMP, ALL, 2, "imp_bonus_all_sensors");
    --SetPlanetaryBonusVoiceOver(IMP, IMP, 3, "imp_bonus_imp_hero");
    --SetPlanetaryBonusVoiceOver(IMP, ALL, 3, "imp_bonus_all_hero");
    --SetPlanetaryBonusVoiceOver(IMP, IMP, 4, "imp_bonus_imp_reserves");
    --SetPlanetaryBonusVoiceOver(IMP, ALL, 4, "imp_bonus_all_reserves");
    --SetPlanetaryBonusVoiceOver(IMP, IMP, 5, "imp_bonus_imp_sabotage");--sabotage
    --SetPlanetaryBonusVoiceOver(IMP, ALL, 5, "imp_bonus_all_sabotage");
    --SetPlanetaryBonusVoiceOver(IMP, IMP, 6, "");
    --SetPlanetaryBonusVoiceOver(IMP, ALL, 6, "");
    --SetPlanetaryBonusVoiceOver(IMP, IMP, 7, "imp_bonus_imp_training");--advanced training
    --SetPlanetaryBonusVoiceOver(IMP, ALL, 7, "imp_bonus_all_training");--advanced training

    --SetPlanetaryBonusVoiceOver(ALL, ALL, 0, "all_bonus_all_medical");
    --SetPlanetaryBonusVoiceOver(ALL, IMP, 0, "all_bonus_imp_medical");
    --SetPlanetaryBonusVoiceOver(ALL, ALL, 1, "");
    --SetPlanetaryBonusVoiceOver(ALL, IMP, 1, "");
    --SetPlanetaryBonusVoiceOver(ALL, ALL, 2, "all_bonus_all_sensors");
    --SetPlanetaryBonusVoiceOver(ALL, IMP, 2, "all_bonus_imp_sensors");
    --SetPlanetaryBonusVoiceOver(ALL, ALL, 3, "all_bonus_all_hero");
    --SetPlanetaryBonusVoiceOver(ALL, IMP, 3, "all_bonus_imp_hero");
    --SetPlanetaryBonusVoiceOver(ALL, ALL, 4, "all_bonus_all_reserves");
    --SetPlanetaryBonusVoiceOver(ALL, IMP, 4, "all_bonus_imp_reserves");
    --SetPlanetaryBonusVoiceOver(ALL, ALL, 5, "all_bonus_all_sabotage");--sabotage
    --SetPlanetaryBonusVoiceOver(ALL, IMP, 5, "all_bonus_imp_sabotage");
    --SetPlanetaryBonusVoiceOver(ALL, ALL, 6, "");
    --SetPlanetaryBonusVoiceOver(ALL, IMP, 6, "");
    --SetPlanetaryBonusVoiceOver(ALL, ALL, 7, "all_bonus_all_training");--advanced training
    --SetPlanetaryBonusVoiceOver(ALL, IMP, 7, "all_bonus_imp_training");--advanced training


--  Camera Stats
--Tat 3 - Jabbas' Palace
    AddCameraShot(0.685601, -0.253606, -0.639994, -0.236735, -65.939224, -0.176558, 127.400444);
    AddCameraShot(0.786944, 0.050288, -0.613719, 0.039218, -80.626396, 1.175180, 133.205551);
    AddCameraShot(0.997982, 0.061865, -0.014249, 0.000883, -65.227898, 1.322798, 123.976990);
    AddCameraShot(-0.367869, -0.027819, -0.926815, 0.070087, -19.548307, -5.736280, 163.360519);
    AddCameraShot(0.773980, -0.100127, -0.620077, -0.080217, -61.123989, -0.629283, 176.066025);
    AddCameraShot(0.978189, 0.012077, 0.207350, -0.002560, -88.388947, 5.674968, 153.745255);
    AddCameraShot(-0.144606, -0.010301, -0.986935, 0.070304, -106.872772, 2.066469, 102.783096);
    AddCameraShot(0.926756, -0.228578, -0.289446, -0.071390, -60.819584, -2.117482, 96.400620);
    AddCameraShot(0.873080, 0.134285, 0.463274, -0.071254, -52.071609, -8.430746, 67.122437);
    AddCameraShot(0.773398, -0.022789, -0.633236, -0.018659, -32.738083, -7.379394, 81.508003);
    AddCameraShot(0.090190, 0.005601, -0.993994, 0.061733, -15.379695, -9.939115, 72.110054);
    AddCameraShot(0.971737, -0.118739, -0.202524, -0.024747, -16.591295, -1.371236, 147.933029);
    AddCameraShot(0.894918, 0.098682, -0.432560, 0.047698, -20.577391, -10.683214, 128.752563);

end
