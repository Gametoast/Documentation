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
--  REP Attacking (attacker is always #1)
    local REP = 2;
    local CIS = 1;
--  These variables do not change
    local ATT = 1;
    local DEF = 2;

    SetTeamAggressiveness(REP, 1.0)
    SetTeamAggressiveness(CIS, 1.0)
   	SetMaxFlyHeight(14)
	SetMaxPlayerFlyHeight (14)

        AddMissionObjective(REP, "orange", "level.yavin1.objectives.1");
    AddMissionObjective(CIS, "orange", "level.yavin1.objectives.1");

    ReadDataFile("sound\\yav.lvl;yav1cw");
    ReadDataFile("SIDE\\rep.lvl",
        "rep_hover_speederbike",
        "rep_inf_basic",
        "rep_inf_jet_trooper",
        "rep_inf_macewindu");
    ReadDataFile("SIDE\\cis.lvl",
        "cis_hover_aat",
        "cis_hover_stap",
        "cis_inf_basic",
        "cis_inf_countdooku",
        "cis_inf_droideka");

-- Republic Stats
SetTeamName(REP, "Republic");
SetTeamIcon(REP, "rep_icon");
      AddUnitClass(REP, "rep_inf_clone_trooper",11)
      AddUnitClass(REP, "rep_inf_arc_trooper",3)
      AddUnitClass(REP, "rep_inf_clone_pilot",4)
      AddUnitClass(REP, "rep_inf_clone_sharpshooter",4)
      AddUnitClass(REP, "rep_inf_jet_trooper",3)
      SetHeroClass(REP, "rep_inf_macewindu")
-- CIS Stats
SetTeamName(CIS, "CIS");
SetTeamIcon(CIS, "cis_icon");
      AddUnitClass(CIS, "cis_inf_battledroid",12)
      AddUnitClass(CIS, "cis_inf_assault",3)
      AddUnitClass(CIS, "cis_inf_pilotdroid",4)
      AddUnitClass(CIS, "cis_inf_assassindroid",4)
      AddUnitClass(CIS, "cis_inf_droideka",2)
      SetHeroClass(CIS, "cis_inf_countdooku")

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
ClearWalkers()
    AddWalkerType(0, 16) -- special -> droidekas
    AddWalkerType(1, 0) -- 1x2 (1 pair of legs)
    AddWalkerType(2, 0) -- 2x2 (2 pairs of legs)
    AddWalkerType(3, 0) -- 3x2 (3 pairs of legs)
    SetMemoryPoolSize("EntityFlyer", 0)
--  SetMemoryPoolSize("EntityTauntaun", 0)
    SetMemoryPoolSize("EntityHover", 7)
    SetMemoryPoolSize("EntityCarrier", 0)
    SetMemoryPoolSize("Aimer", 65)
    SetMemoryPoolSize("Obstacle", 740)
    SetSpawnDelay(10.0, 0.25)
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

    
    OpenAudioStream("sound\\yav.lvl",  "yavcw_music")
    OpenAudioStream("sound\\cw.lvl",  "cw_vo")
    OpenAudioStream("sound\\cw.lvl",  "cw_tac_vo")
    OpenAudioStream("sound\\yav.lvl",  "yav1");
    OpenAudioStream("sound\\yav.lvl",  "yav1");
    OpenAudioStream("sound\\yav.lvl",  "yav1_emt");

    SetBleedingVoiceOver(REP, REP, "rep_off_com_report_us_overwhelmed", 1);
    SetBleedingVoiceOver(REP, CIS, "rep_off_com_report_enemy_losing",   1);
    SetBleedingVoiceOver(CIS, REP, "cis_off_com_report_enemy_losing",   1);
    SetBleedingVoiceOver(CIS, CIS, "cis_off_com_report_us_overwhelmed", 1);

    SetOutOfBoundsVoiceOver(1, "cisleaving");
    SetOutOfBoundsVoiceOver(2, "repleaving");

    SetAmbientMusic(REP, 1.0, "rep_yav_amb_start",  0,1);
    SetAmbientMusic(REP, 0.99, "rep_yav_amb_middle", 1,1);
    SetAmbientMusic(REP, 0.1,"rep_yav_amb_end",    2,1);
    SetAmbientMusic(CIS, 1.0, "cis_yav_amb_start",  0,1);
    SetAmbientMusic(CIS, 0.99, "cis_yav_amb_middle", 1,1);
    SetAmbientMusic(CIS, 0.1,"cis_yav_amb_end",    2,1);

    SetVictoryMusic(REP, "rep_yav_amb_victory");
    SetDefeatMusic (REP, "rep_yav_amb_defeat");
    SetVictoryMusic(CIS, "cis_yav_amb_victory");
    SetDefeatMusic (CIS, "cis_yav_amb_defeat");

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

    SetAttackingTeam(ATT);
--Yav 1 - Temple
--Fountain
AddCameraShot(0.925694, -0.056832, 0.373277, 0.022917, 132.356064, -65.527252, -25.416561);
--Forrest Ruins
AddCameraShot(0.361355, -0.024311, -0.930009, -0.062569, 93.845818, -52.247051, -194.743134);
--Temple
AddCameraShot(0.934074, 0.077334, -0.347417, 0.028764, 102.660049, -30.127220, -335.167145);

end

