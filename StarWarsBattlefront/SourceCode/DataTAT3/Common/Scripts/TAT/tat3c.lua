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
    local REP = 1
    local CIS = 2
--  These variables do not change
    local ATT = 1
    local DEF = 2

    AddMissionObjective(CIS, "red", "level.tat3.objectives.1");
    AddMissionObjective(CIS, "orange", "level.tat3.objectives.2");
    AddMissionObjective(CIS, "orange", "level.tat3.objectives.3");
    AddMissionObjective(REP, "red", "level.tat3.objectives.1");
    AddMissionObjective(REP, "orange", "level.tat3.objectives.2");
    AddMissionObjective(REP, "orange", "level.tat3.objectives.3");

      SetTeamAggressiveness(CIS, 0.95)
SetTeamAggressiveness(REP, 0.95)



    --ReadDataFile("dc:sound\\tat.lvl")
    ReadDataFile("dc:sound\\tat.lvl;tat3cw")
    ReadDataFile("SIDE\\rep.lvl",
        "rep_inf_basic",
        "rep_inf_jet_trooper");

    ReadDataFile("SIDE\\cis.lvl",
        "cis_inf_basic",
        "cis_inf_droideka");

    ReadDataFile("dc:SIDE\\gam.lvl",
        "gam_inf_gamorreanguard")
    
    SetAttackingTeam(ATT);

--      Republic Stats
    SetTeamName(REP, "Republic")
    SetTeamIcon(REP, "rep_icon")
    AddUnitClass(REP, "rep_inf_clone_trooper",10)
    AddUnitClass(REP, "rep_inf_arc_trooper",1)
    AddUnitClass(REP, "rep_inf_clone_pilot",2)
    AddUnitClass(REP, "rep_inf_clone_sharpshooter",2)
     AddUnitClass(REP, "rep_inf_jet_trooper",1)
     
--      CIS Stats
    SetTeamName(CIS, "CIS")
    SetTeamIcon(CIS, "cis_icon")
    AddUnitClass(CIS, "cis_inf_battledroid",10)
    AddUnitClass(CIS, "cis_inf_assault",1)
    AddUnitClass(CIS, "cis_inf_pilotdroid",2)
    AddUnitClass(CIS, "cis_inf_assassindroid",2)
    AddUnitClass(CIS, "cis_inf_droideka",1)
     
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
    AddWalkerType(0, 4) -- Droidekas
    AddWalkerType(1, 4)
    AddWalkerType(2, 0)
    --SetMemoryPoolSize("EntityHover", 12)
    --SetMemoryPoolSize("EntityFlyer", 5)
--  SetMemoryPoolSize("EntityBuildingArmedDynamic", 16)
--  SetMemoryPoolSize("EntityTauntaun", 0)
 -- SetMemoryPoolSize("MountedTurret", 22)
    SetMemoryPoolSize("SoundSpaceRegion", 81)
    SetMemoryPoolSize("PowerupItem", 60)
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
    OpenAudioStream("sound\\tat.lvl",  "tatcw_music");
    OpenAudioStream("dc:sound\\tat.lvl",  "tat3");
    OpenAudioStream("dc:sound\\tat.lvl",  "tat3");
    OpenAudioStream("sound\\cw.lvl",  "cw_vo");
    OpenAudioStream("sound\\cw.lvl",  "cw_tac_vo");
    OpenAudioStream("dc:sound\\tat.lvl",  "tat3_emt");
    --OpenAudioStream("dc:sound\\tat.lvl",  "tat3_emt");

    SetBleedingVoiceOver(REP, REP, "rep_off_com_report_us_overwhelmed", 1);
    SetBleedingVoiceOver(REP, CIS, "rep_off_com_report_enemy_losing",   1);
    SetBleedingVoiceOver(CIS, REP, "cis_off_com_report_enemy_losing",   1);
    SetBleedingVoiceOver(CIS, CIS, "cis_off_com_report_us_overwhelmed", 1);

    SetLowReinforcementsVoiceOver(REP, REP, "rep_off_defeat_im", .1, 1);
    SetLowReinforcementsVoiceOver(REP, CIS, "rep_off_victory_im", .1, 1);
    SetLowReinforcementsVoiceOver(CIS, CIS, "cis_off_defeat_im", .1, 1);
    SetLowReinforcementsVoiceOver(CIS, REP, "cis_off_victory_im", .1, 1);

    SetOutOfBoundsVoiceOver(2, "repleaving");
    SetOutOfBoundsVoiceOver(1, "cisleaving");

    SetAmbientMusic(REP, 1.0, "rep_tat_amb_start",  0,1);
    SetAmbientMusic(REP, 0.99, "rep_tat_amb_middle", 1,1);
    SetAmbientMusic(REP, 0.1,"rep_tat_amb_end",    2,1);
    SetAmbientMusic(CIS, 1.0, "cis_tat_amb_start",  0,1);
    SetAmbientMusic(CIS, 0.99, "cis_tat_amb_middle", 1,1);
    SetAmbientMusic(CIS, 0.1,"cis_tat_amb_end",    2,1);

    SetVictoryMusic(REP, "rep_tat_amb_victory");
    SetDefeatMusic (REP, "rep_tat_amb_defeat");
    SetVictoryMusic(CIS, "cis_tat_amb_victory");
    SetDefeatMusic (CIS, "cis_tat_amb_defeat");



    SetSoundEffect("ScopeDisplayZoomIn",  "binocularzoomin");
    SetSoundEffect("ScopeDisplayZoomOut", "binocularzoomout");
    --SetSoundEffect("WeaponUnableSelect",  "com_weap_inf_weaponchange_null");
    --SetSoundEffect("WeaponModeUnableSelect",  "com_weap_inf_modechange_null");
    SetSoundEffect("SpawnDisplayUnitChange",       "shell_select_unit");
    SetSoundEffect("SpawnDisplayUnitAccept",       "shell_menu_enter");
    SetSoundEffect("SpawnDisplaySpawnPointChange", "shell_select_change");
    SetSoundEffect("SpawnDisplaySpawnPointAccept", "shell_menu_enter");
    SetSoundEffect("SpawnDisplayBack",             "shell_menu_exit");

    --SetPlanetaryBonusVoiceOver(CIS, CIS, 0, "cis_bonus_cis_medical");
    --SetPlanetaryBonusVoiceOver(CIS, REP, 0, "cis_bonus_rep_medical");
    --SetPlanetaryBonusVoiceOver(CIS, CIS, 1, "");
    --SetPlanetaryBonusVoiceOver(CIS, REP, 1, "");
    --SetPlanetaryBonusVoiceOver(CIS, CIS, 2, "cis_bonus_cis_sensors");
    --SetPlanetaryBonusVoiceOver(CIS, REP, 2, "cis_bonus_rep_sensors");
    --SetPlanetaryBonusVoiceOver(CIS, CIS, 3, "cis_bonus_cis_hero");
    --SetPlanetaryBonusVoiceOver(CIS, REP, 3, "cis_bonus_rep_hero");
    --SetPlanetaryBonusVoiceOver(CIS, CIS, 4, "cis_bonus_cis_reserves");
    --SetPlanetaryBonusVoiceOver(CIS, REP, 4, "cis_bonus_rep_reserves");
    --SetPlanetaryBonusVoiceOver(CIS, CIS, 5, "cis_bonus_cis_sabotage");--sabotage
    --SetPlanetaryBonusVoiceOver(CIS, REP, 5, "cis_bonus_rep_sabotage");
    --SetPlanetaryBonusVoiceOver(CIS, CIS, 6, "");
    --SetPlanetaryBonusVoiceOver(CIS, REP, 6, "");
    --SetPlanetaryBonusVoiceOver(CIS, CIS, 7, "cis_bonus_cis_training");--advanced training
    --SetPlanetaryBonusVoiceOver(CIS, REP, 7, "cis_bonus_rep_training");--advanced training

    --SetPlanetaryBonusVoiceOver(REP, REP, 0, "rep_bonus_rep_medical");
    --SetPlanetaryBonusVoiceOver(REP, CIS, 0, "rep_bonus_cis_medical");
    --SetPlanetaryBonusVoiceOver(REP, REP, 1, "");
    --SetPlanetaryBonusVoiceOver(REP, CIS, 1, "");
    --SetPlanetaryBonusVoiceOver(REP, REP, 2, "rep_bonus_rep_sensors");
    --SetPlanetaryBonusVoiceOver(REP, CIS, 2, "rep_bonus_cis_sensors");
    --SetPlanetaryBonusVoiceOver(REP, REP, 3, "rep_bonus_rep_hero");
    --SetPlanetaryBonusVoiceOver(REP, CIS, 3, "rep_bonus_cis_hero");
    --SetPlanetaryBonusVoiceOver(REP, REP, 4, "rep_bonus_rep_reserves");
    --SetPlanetaryBonusVoiceOver(REP, CIS, 4, "rep_bonus_cis_reserves");
    --SetPlanetaryBonusVoiceOver(REP, REP, 5, "rep_bonus_rep_sabotage");--sabotage
    --SetPlanetaryBonusVoiceOver(REP, CIS, 5, "rep_bonus_cis_sabotage");
    --SetPlanetaryBonusVoiceOver(REP, REP, 6, "");
    --SetPlanetaryBonusVoiceOver(REP, CIS, 6, "");
    --SetPlanetaryBonusVoiceOver(REP, REP, 7, "rep_bonus_rep_training");--advanced training
    --SetPlanetaryBonusVoiceOver(REP, CIS, 7, "rep_bonus_cis_training");--advanced training


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

