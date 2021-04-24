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

       AddMissionObjective(REP, "orange", "level.yav2.objectives.1");
       AddMissionObjective(CIS, "orange", "level.yav2.objectives.1");

    SetTeamAggressiveness(REP, 1.0)
    SetTeamAggressiveness(CIS, 1.0)
    SetMaxFlyHeight(-22)
    SetMaxPlayerFlyHeight (-22)

    ReadDataFile("sound\\yav.lvl;yav2cw");

    ReadDataFile("SIDE\\cis.lvl",
        "cis_hover_aat",
        "cis_inf_basic",
        "cis_inf_countdooku",
        "cis_walk_spider",
        "cis_inf_droideka")
    ReadDataFile("SIDE\\rep.lvl",
        "rep_hover_fightertank",
        "rep_inf_basic",
        "rep_inf_jet_trooper",
        "rep_inf_macewindu")


--    Republic Stats
      SetTeamName(REP, "Republic")
      SetTeamIcon(REP, "rep_icon")
      AddUnitClass(REP, "rep_inf_clone_trooper",11)
      AddUnitClass(REP, "rep_inf_arc_trooper",3)
      AddUnitClass(REP, "rep_inf_clone_pilot",4)
      AddUnitClass(REP, "rep_inf_clone_sharpshooter",4)
      AddUnitClass(REP, "rep_inf_jet_trooper",3)
      SetHeroClass(REP, "rep_inf_macewindu")



--  CIS Stats
      SetTeamName(CIS, "CIS")
      SetTeamIcon(CIS, "cis_icon")
     AddUnitClass(CIS, "cis_inf_battledroid",11)
      AddUnitClass(CIS, "cis_inf_assault",3)
      AddUnitClass(CIS, "cis_inf_pilotdroid",4)
      AddUnitClass(CIS, "cis_inf_assassindroid" ,4)
      AddUnitClass(CIS, "cis_inf_droideka",3)
      SetHeroClass(CIS, "cis_inf_countdooku")


--  Attacker Stats
    SetUnitCount(ATT, 25)
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

--  Level Stats
    ClearWalkers()
    SetMemoryPoolSize ("EntityWalker",0)
    AddWalkerType(0, 8) -- 8 droidekas (special case: 0 leg pairs)
    AddWalkerType(1, 0) --
    AddWalkerType(2, 2) -- 2 spider walkers with 2 leg pairs each
    AddWalkerType(3, 0) -- 2 attes with 3 leg pairs each
    SetMemoryPoolSize ("CommandWalker",0)
    SetMemoryPoolSize("EntityFlyer", 0)
--  SetMemoryPoolSize("EntityTauntaun", 0)
    SetMemoryPoolSize("EntityHover", 4)
    SetMemoryPoolSize("EntityCarrier", 0)
    SetMemoryPoolSize("MountedTurret", 20)
    SetMemoryPoolSize("EntityBuildingArmedDynamic", 0);
    SetMemoryPoolSize("PowerupItem", 40)
    SetMemoryPoolSize("EntityMine", 40)
    SetMemoryPoolSize("Aimer", 200)

    SetSpawnDelay(10.0, 0.25);
    ReadDataFile("YAV\\yav2.lvl")
    SetDenseEnvironment("true")

--  Birdies
    --SetNumBirdTypes(1);
    --SetBirdType(0,1.0,"bird");



--  Local Stats
--  SetTeamName(3, "locals")
--  AddUnitClass(3, "inf_gungan", 5)
--  AddUnitClass(3, "inf_gungan2", 5)
--  AddUnitClass(3, "inf_gungan3", 4)
--  SetUnitCount(3, 14)
--  SetTeamAsEnemy(3,ATT)
--  SetTeamAsFriend(3,DEF)

--  Sound

    OpenAudioStream("sound\\yav.lvl",  "yavcw_music");
    OpenAudioStream("sound\\cw.lvl",  "cw_vo");
    OpenAudioStream("sound\\cw.lvl",  "cw_tac_vo");
    OpenAudioStream("sound\\yav.lvl",  "yav2");
    OpenAudioStream("sound\\yav.lvl",  "yav2");

    SetBleedingVoiceOver(REP, REP, "rep_off_com_report_us_overwhelmed", 1);
    SetBleedingVoiceOver(REP, CIS, "rep_off_com_report_enemy_losing",   1);
    SetBleedingVoiceOver(CIS, REP, "cis_off_com_report_enemy_losing",   1);
    SetBleedingVoiceOver(CIS, CIS, "cis_off_com_report_us_overwhelmed", 1);

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

    SetOutOfBoundsVoiceOver(1, "repleaving");
    SetOutOfBoundsVoiceOver(2, "cisleaving");

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

--OpeningSateliteShot
--Yav 2 Arena
--Top Side
AddCameraShot(0.998324, 0.042165, -0.039592, 0.001672, 2.729886, -49.061783, -56.202015);
--Arena
AddCameraShot(0.394474, -0.064969, -0.904423, -0.148957, -42.978031, -33.685440, -31.236471);
--Bottom Side
AddCameraShot(0.499178, -0.030334, -0.864374, -0.052527, -46.470646, -46.574200, 89.658791);

end