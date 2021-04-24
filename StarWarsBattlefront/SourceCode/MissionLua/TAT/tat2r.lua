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
--  Republic Attacking (attacker is always #1)
    local REP = 1
    local CIS = 2
--  These variables do not change
    local ATT = 1
    local DEF = 2

    AddMissionObjective(REP, "red", "level.tat2.objectives.1");
--  AddMissionObjective(REP, "orange", "level.tat2.objectives.2");
    AddMissionObjective(CIS, "red", "level.tat2.objectives.1");
--  AddMissionObjective(CIS, "orange", "level.tat2.objectives.3");

SetTeamAggressiveness(REP, 0.95)
SetTeamAggressiveness(CIS, 0.95)

SetMaxFlyHeight(40);

    ReadDataFile("sound\\tat.lvl;tat2cw");
    ReadDataFile("SIDE\\rep.lvl",
        "rep_fly_assault_dome",
        "rep_inf_basic",
        "rep_inf_jet_trooper",
        "rep_inf_macewindu");
    ReadDataFile("SIDE\\cis.lvl",
        "cis_hover_aat",
        "cis_inf_basic",
        "cis_inf_countdooku",
        "cis_inf_droideka");
    ReadDataFile("SIDE\\des.lvl",
        "tat_inf_jawa");

--          Republic Stats
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
    AddUnitClass(CIS, "cis_inf_battledroid",11)
    AddUnitClass(CIS, "cis_inf_assault",3)
    AddUnitClass(CIS, "cis_inf_pilotdroid",4)
    AddUnitClass(CIS, "cis_inf_assassindroid",4)
    AddUnitClass(CIS, "cis_inf_droideka",3)
    SetHeroClass(CIS, "cis_inf_countdooku")

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
    AddWalkerType(0, 4) -- special -> droidekas
    AddWalkerType(1, 0) -- 1x2 (1 pair of legs)
    AddWalkerType(2, 0) -- 2x2 (2 pairs of legs)
    AddWalkerType(3, 0) -- 3x2 (3 pairs of legs)
    SetMemoryPoolSize("Obstacle", 653)
    SetMemoryPoolSize("EntityHover", 1)


    SetSpawnDelay(10.0, 0.25)
    ReadDataFile("TAT\\tat2.lvl")
    SetDenseEnvironment("false")


--  Sound Stats
    OpenAudioStream("sound\\tat.lvl",  "tatcw_music");
    OpenAudioStream("sound\\cw.lvl",  "cw_vo");
    OpenAudioStream("sound\\cw.lvl",  "cw_tac_vo");
    OpenAudioStream("sound\\tat.lvl",  "tat2");
    OpenAudioStream("sound\\tat.lvl",  "tat2");

    SetBleedingVoiceOver(REP, REP, "rep_off_com_report_us_overwhelmed", 1);
    SetBleedingVoiceOver(REP, CIS, "rep_off_com_report_enemy_losing",   1);
    SetBleedingVoiceOver(CIS, REP, "cis_off_com_report_enemy_losing",   1);
    SetBleedingVoiceOver(CIS, CIS, "cis_off_com_report_us_overwhelmed", 1);

    SetOutOfBoundsVoiceOver(1, "repleaving");
    SetOutOfBoundsVoiceOver(2, "cisleaving");

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

--  Camera Stats
--Tat2 Mos Eisley
--Overhead
AddCameraShot(0.514878, -0.143332, -0.814235, -0.226667, -351.052490, 31.599720, -71.300522);
--Derelict
AddCameraShot(0.899316, 0.007445, 0.437220, -0.003620, -212.966995, 20.173393, 56.179829);
--Cantina
AddCameraShot(0.902993, -0.019975, -0.429085, -0.009492, -205.001770, 17.679758, 77.177254);
end


