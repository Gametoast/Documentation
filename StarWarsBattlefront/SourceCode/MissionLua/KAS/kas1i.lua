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
--  Attacker is always #1
    local ALL = 2
    local IMP = 1
--  These variables do not change
    local ATT = 1
    local DEF = 2

    SetMaxFlyHeight(40)
    SetMaxPlayerFlyHeight(40)
    
    AddMissionObjective(ALL, "orange", "level.kashyyyk1.objectives.1");
    AddMissionObjective(IMP, "orange", "level.kashyyyk1.objectives.1");

    SetTeamName(3, "locals")
    ReadDataFile("sound\\kas.lvl;kas1gcw");
    ReadDataFile("SIDE\\all.lvl",
        --"all_hover_combatspeeder",
        "all_fly_xwing",
        "all_fly_ywing",
        "all_inf_basic",
        "all_inf_lukeskywalker",
        "all_inf_smuggler");
    ReadDataFile("SIDE\\imp.lvl",
        --"imp_hover_fightertank",
        "imp_fly_tiefighter",
        "imp_fly_tiebomber",
        --"imp_hover_speederbike",
        "imp_inf_basic",
        "imp_inf_dark_trooper",
        "imp_inf_darthvader");
    ReadDataFile("SIDE\\wok.lvl",
        "wok_inf_basic");


--  Alliance Stats
    SetTeamName(ALL, "Alliance")
    SetTeamIcon(ALL, "all_icon")
    AddUnitClass(ALL, "all_inf_soldier",11)
    AddUnitClass(ALL, "all_inf_vanguard",3)
    AddUnitClass(ALL, "all_inf_pilot",4)
    AddUnitClass(ALL, "all_inf_marksman",4)
    AddUnitClass(ALL, "all_inf_smuggler",3)
    SetHeroClass(ALL, "all_inf_lukeskywalker")

--  Imperial Stats
    SetTeamName(IMP, "Empire")
    SetTeamIcon(IMP, "imp_icon")
    AddUnitClass(IMP, "imp_inf_storm_trooper",14)
    AddUnitClass(IMP, "imp_inf_shock_trooper",4)
    AddUnitClass(IMP, "imp_inf_pilotatst",5)
    AddUnitClass(IMP, "imp_inf_scout_trooper",5)
    AddUnitClass(IMP, "imp_inf_dark_trooper",4)
    SetHeroClass(IMP, "imp_inf_darthvader")

--  Attacker Stats
    SetUnitCount(ATT, 32)
    SetReinforcementCount(ATT, 200)
    AddBleedThreshold(ATT, 31, 0.0)
    AddBleedThreshold(ATT, 21, 0.75)
    AddBleedThreshold(ATT, 11, 2.25)
    AddBleedThreshold(ATT, 1, 3.0)
    SetTeamAsEnemy(ATT,3)

--  Defender Stats
    SetUnitCount(DEF, 25)
    SetReinforcementCount(DEF, 200)
    AddBleedThreshold(DEF, 31, 0.0)
    AddBleedThreshold(DEF, 21, 0.75)
    AddBleedThreshold(DEF, 11, 2.25)
    AddBleedThreshold(DEF, 1, 3.0)
    SetTeamAsFriend(DEF,3)

--  Local Stats
    SetTeamName(3, "locals")
    SetTeamIcon(3, "all_icon")
    AddUnitClass(3, "wok_inf_mechanic", 2)
    AddUnitClass(3, "wok_inf_rocketeer", 2)
    AddUnitClass(3, "wok_inf_warrior", 3)
    SetUnitCount(3, 7)

    SetTeamAsEnemy(3,ATT)
    SetTeamAsFriend(3,DEF)


--  Level Stats
    ClearWalkers()
    AddWalkerType(1, 3) -- 6 atsts with 1 leg pairs each
    SetMemoryPoolSize("EntityHover", 0)
    SetMemoryPoolSize("EntityFlyer", 4)
    SetMemoryPoolSize ("MountedTurret",50)
--  SetMemoryPoolSize("EntityTauntaun", 0)
    SetMemoryPoolSize("EntityCarrier", 0)
    SetMemoryPoolSize("EntityBuildingArmedDynamic", 0)
    SetMemoryPoolSize("PowerupItem", 40)
    SetMemoryPoolSize("EntityMine", 40)
    SetMemoryPoolSize("Aimer", 150)
    SetMemoryPoolSize("Obstacle", 700)
    SetMemoryPoolSize("EntityLight", 80)

    SetSpawnDelay(10.0, 0.25)
    ReadDataFile("KAS\\kas1.lvl")
    SetDenseEnvironment("false")


--  Birdies
    SetNumBirdTypes(1);
    SetBirdType(0,1.0,"bird");
    SetBirdFlockMinHeight(-28.0);

--  Sound
    OpenAudioStream("sound\\kas.lvl",  "kasgcw_music");
    OpenAudioStream("sound\\gcw.lvl",  "gcw_vo");
    OpenAudioStream("sound\\gcw.lvl",  "gcw_tac_vo");
    OpenAudioStream("sound\\kas.lvl",  "kas");
    OpenAudioStream("sound\\kas.lvl",  "kas");

    SetBleedingVoiceOver(ALL, ALL, "all_off_com_report_us_overwhelmed", 1);
    SetBleedingVoiceOver(ALL, IMP, "all_off_com_report_enemy_losing", 1);
    SetBleedingVoiceOver(IMP, ALL, "imp_off_com_report_enemy_losing", 1);
    SetBleedingVoiceOver(IMP, IMP, "imp_off_com_report_us_overwhelmed", 1);

    SetLowReinforcementsVoiceOver(ALL, ALL, "all_off_defeat_im", .1, 1);
    SetLowReinforcementsVoiceOver(ALL, IMP, "all_off_victory_im", .1, 1);
    SetLowReinforcementsVoiceOver(IMP, IMP, "imp_off_defeat_im", .1, 1);
    SetLowReinforcementsVoiceOver(IMP, ALL, "imp_off_victory_im", .1, 1);

    SetOutOfBoundsVoiceOver(2, "allleaving");
    SetOutOfBoundsVoiceOver(1, "impleaving");

    SetAmbientMusic(ALL, 1.0, "all_kas_amb_start",  0,1);
    SetAmbientMusic(ALL, 0.99, "all_kas_amb_middle", 1,1);
    SetAmbientMusic(ALL, 0.1,"all_kas_amb_end",    2,1);
    SetAmbientMusic(IMP, 1.0, "imp_kas_amb_start",  0,1);
    SetAmbientMusic(IMP, 0.99, "imp_kas_amb_middle", 1,1);
    SetAmbientMusic(IMP, 0.1,"imp_kas_amb_end",    2,1);

    SetVictoryMusic(ALL, "all_kas_amb_victory");
    SetDefeatMusic (ALL, "all_kas_amb_defeat");
    SetVictoryMusic(IMP, "imp_kas_amb_victory");
    SetDefeatMusic (IMP, "imp_kas_amb_defeat");

    SetSoundEffect("ScopeDisplayZoomIn",  "binocularzoomin");
    SetSoundEffect("ScopeDisplayZoomOut", "binocularzoomout");
    --SetSoundEffect("WeaponUnableSelect",  "com_weap_inf_weaponchange_null");
    --SetSoundEffect("WeaponModeUnableSelect",  "com_weap_inf_modechange_null");
    SetSoundEffect("SpawnDisplayUnitChange",       "shell_select_unit");
    SetSoundEffect("SpawnDisplayUnitAccept",       "shell_menu_enter");
    SetSoundEffect("SpawnDisplaySpawnPointChange", "shell_select_change");
    SetSoundEffect("SpawnDisplaySpawnPointAccept", "shell_menu_enter");
    SetSoundEffect("SpawnDisplayBack",             "shell_menu_exit");


    --SetSoundEffect("BirdScatter",         "birdsFlySeq1");

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

--Kas 1 Islands
--Huts
AddCameraShot(-0.421137, 0.025737, -0.904943, -0.055304, 216.391846, -19.422512, -249.231918);
--Grand Hut
AddCameraShot(0.701411, 0.037622, -0.710742, 0.038123, 49.056309, -29.080774, -87.605171);
--Huts
AddCameraShot(0.916854, -0.005262, 0.399181, 0.002291, 222.269363, -30.438093, -130.609543);
end
