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

    AddMissionObjective(CIS, "orange", "level.kamino1.objectives.1");
    AddMissionObjective(REP, "orange", "level.kamino1.objectives.1");

    ReadDataFile("sound\\kam.lvl;kam1cw");
    ReadDataFile("SIDE\\rep.lvl",
        "rep_inf_basic",
        "rep_inf_jet_trooper",
        "rep_inf_macewindu");
    ReadDataFile("SIDE\\cis.lvl",
        "cis_fly_fedlander_dome",
        "cis_inf_basic",
        "cis_inf_countdooku",
        "cis_inf_droideka");

    SetTeamAggressiveness(CIS, 0.9)
    SetTeamAggressiveness(REP, 0.9)

--  Republic Stats
    SetTeamName(REP, "Republic");
    SetTeamIcon(REP, "rep_icon");
      AddUnitClass(REP, "rep_inf_clone_trooper",11)
      AddUnitClass(REP, "rep_inf_arc_trooper",3)
      AddUnitClass(REP, "rep_inf_clone_pilot",4)
      AddUnitClass(REP, "rep_inf_clone_sharpshooter",4)
      AddUnitClass(REP, "rep_inf_jet_trooper",3)
      SetHeroClass(REP, "rep_inf_macewindu")



--  CIS Stats
    SetTeamName(CIS, "CIS");
    SetTeamIcon(CIS, "cis_icon");
      AddUnitClass(CIS, "cis_inf_battledroid",12)
      AddUnitClass(CIS, "cis_inf_assault",3)
      AddUnitClass(CIS, "cis_inf_pilotdroid",4)
      AddUnitClass(CIS, "cis_inf_assassindroid",4)
      AddUnitClass(CIS, "cis_inf_droideka",2)
      SetHeroClass(CIS, "cis_inf_countdooku")

--SetPlayerTeamDifficulty( 11 )
--SetEnemyTeamDifficulty( 11 )

--  Attacker Stats
    SetUnitCount(ATT, 25)
    SetReinforcementCount(ATT, 200)
    AddBleedThreshold(ATT, 31, 0.0)
    AddBleedThreshold(ATT, 21, 0.75)
    AddBleedThreshold(ATT, 11, 2.25)
    AddBleedThreshold(ATT, 1, 3.0)


--  Defender Stats
    SetUnitCount(DEF, 25)
    SetReinforcementCount(DEF, 220)
    AddBleedThreshold(DEF, 31, 0.0)
    AddBleedThreshold(DEF, 21, 0.75)
    AddBleedThreshold(DEF, 11, 2.25)
    AddBleedThreshold(DEF, 1, 3.0)

--  Level Stats
    ClearWalkers()
    AddWalkerType(0, 16) -- droidekas
    SetSpawnDelay(10.0, 0.25)
    ReadDataFile("KAM\\kam1.lvl")
    SetDenseEnvironment("false")

--  AI
    SetMinFlyHeight(60)
    SetMaxFlyHeight(140)
    SetAllowBlindJetJumps(0)

--  Sound
    OpenAudioStream("sound\\kam.lvl",  "kamcw_music");
    OpenAudioStream("sound\\cw.lvl",  "cw_vo");
    OpenAudioStream("sound\\cw.lvl",  "cw_tac_vo");
    OpenAudioStream("sound\\kam.lvl",  "kam1cw");
    OpenAudioStream("sound\\kam.lvl",  "kam1cw");


    SetBleedingVoiceOver(REP, REP, "rep_off_com_report_us_overwhelmed", 1);
    SetBleedingVoiceOver(REP, CIS, "rep_off_com_report_enemy_losing",   1);
    SetBleedingVoiceOver(CIS, REP, "cis_off_com_report_enemy_losing",   1);
    SetBleedingVoiceOver(CIS, CIS, "cis_off_com_report_us_overwhelmed", 1);

    SetAmbientMusic(REP, 1.0, "rep_kam_amb_start",  0,1);
    SetAmbientMusic(REP, 0.99, "rep_kam_amb_middle", 1,1);
    SetAmbientMusic(REP, 0.1,"rep_kam_amb_end",    2,1);
    SetAmbientMusic(CIS, 1.0, "cis_kam_amb_start",  0,1);
    SetAmbientMusic(CIS, 0.99, "cis_kam_amb_middle", 1,1);
    SetAmbientMusic(CIS, 0.1,"cis_kam_amb_end",    2,1);

    SetVictoryMusic(REP, "rep_kam_amb_victory");
    SetDefeatMusic (REP, "rep_kam_amb_defeat");
    SetVictoryMusic(CIS, "cis_kam_amb_victory");
    SetDefeatMusic (CIS, "cis_kam_amb_defeat");

    SetOutOfBoundsVoiceOver(2, "repleaving");
    SetOutOfBoundsVoiceOver(1, "cisleaving");

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

    AddDeathRegion("DeathRegion");

--Kamino
--Alpha
AddCameraShot(0.190478, -0.010945, -0.980014, -0.056312, -26.091288, 55.965012, 159.458099);
--Clonecenter
AddCameraShot(-0.376571, -0.019637, -0.924923, 0.048232, 176.042465, 53.957565, 244.261139);
--Overhead many alphas
AddCameraShot(0.639254, -0.073533, 0.760457, 0.087475, 78.395348, 72.538582, 344.086609);
end