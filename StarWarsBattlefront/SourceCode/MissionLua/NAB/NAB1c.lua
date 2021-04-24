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
    local REP = 2
    local CIS = 1
--  These variables do not change
    local ATT = 1
    local DEF = 2

    SetTeamAggressiveness(REP, 0.75)
    SetTeamAggressiveness(CIS, 1.0)
    SetMaxFlyHeight(-40)
    SetMaxPlayerFlyHeight(-40)
    ReadDataFile("sound\\nab.lvl;nab1cw");

        AddMissionObjective(CIS, "orange", "level.naboo1.objectives.1a");
    AddMissionObjective(CIS, "red", "level.naboo1.objectives.4r");
    --AddMissionObjective(CIS, "red", "level.naboo1.objectives.5r");
    AddMissionObjective(REP, "orange", "level.naboo1.objectives.1a");
    --AddMissionObjective(REP, "red", "level.naboo1.objectives.2r");
    AddMissionObjective(REP, "red", "level.naboo1.objectives.3r");

    ReadDataFile("SIDE\\rep.lvl",
        "rep_hover_fightertank",
        "rep_inf_basic",
        "rep_inf_jet_trooper",
        "rep_inf_macewindu"
--        "rep_fly_jedifighter"
        );
    ReadDataFile("SIDE\\cis.lvl",
        "cis_fly_fedlander_dome",
        "cis_hover_aat",
        "cis_hover_stap",
        "cis_inf_basic",
        "cis_inf_countdooku",
        "cis_inf_droideka");

    ReadDataFile("SIDE\\gun.lvl",
        "gun_inf_basic",
        "gun_walk_kaadu")


--  Level Stats
    ClearWalkers()
--  SetMemoryPoolSize ("EntityWalker",-0)
    AddWalkerType(0, 8) -- 8 droidekas (special case: 0 leg pairs)
    AddWalkerType(1, 0) --
    AddWalkerType(2, 0) -- 2 spider walkers with 2 leg pairs each
    AddWalkerType(3, 4) -- 2 attes with 3 leg pairs each
    SetMemoryPoolSize ("Weapon", 280)
    SetMemoryPoolSize ("CommandWalker",0)
    SetMemoryPoolSize ("MountedTurret",55)
    SetMemoryPoolSize("EntityFlyer", 1)
--  SetMemoryPoolSize("EntityTauntaun", 0)
    SetMemoryPoolSize("EntityHover", 8)
    SetMemoryPoolSize("EntityCarrier", 0)
    SetMemoryPoolSize("PowerupItem", 40)
    SetMemoryPoolSize("EntityMine", 40)
    SetMemoryPoolSize("Aimer", 220)

--    Republic Stats
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


--  Local Stats
    SetTeamName(3, "Locals")
--  SetTeamIcon(ALL, "all_icon")
    AddUnitClass(3, "gun_inf_soldier", 5)
    AddUnitClass(3, "gun_inf_rider", 2)
    SetUnitCount(3, 7)
    SetTeamAsEnemy(3,ATT)
    SetTeamAsFriend(3,DEF)

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


    SetSpawnDelay(10.0, 0.25)
    ReadDataFile("NAB\\nab1.lvl")
    SetDenseEnvironment("false")

--  Birdies
    SetNumBirdTypes(1);
    SetBirdType(0,1.0,"bird");


--  Sound
    OpenAudioStream("sound\\nab.lvl",  "nabcw_music");
    OpenAudioStream("sound\\cw.lvl",  "cw_vo");
    OpenAudioStream("sound\\cw.lvl",  "cw_tac_vo");
    OpenAudioStream("sound\\nab.lvl",  "nab1");
    OpenAudioStream("sound\\nab.lvl",  "nab1");

    SetBleedingVoiceOver(REP, REP, "rep_off_com_report_us_overwhelmed", 1);
    SetBleedingVoiceOver(REP, CIS, "rep_off_com_report_enemy_losing",   1);
    SetBleedingVoiceOver(CIS, REP, "cis_off_com_report_enemy_losing",   1);
    SetBleedingVoiceOver(CIS, CIS, "cis_off_com_report_us_overwhelmed", 1);

    SetOutOfBoundsVoiceOver(1, "cisleaving");
    SetOutOfBoundsVoiceOver(2, "repleaving");


    SetAmbientMusic(REP, 1.0, "rep_nab_amb_start",  0,1);
    SetAmbientMusic(REP, 0.99, "rep_nab_amb_middle", 1,1);
    SetAmbientMusic(REP, 0.1,"rep_nab_amb_end",    2,1);
    SetAmbientMusic(CIS, 1.0, "cis_nab_amb_start",  0,1);
    SetAmbientMusic(CIS, 0.99, "cis_nab_amb_middle", 1,1);
    SetAmbientMusic(CIS, 0.1,"cis_nab_amb_end",    2,1);

    SetVictoryMusic(REP, "rep_nab_amb_victory");
    SetDefeatMusic (REP, "rep_nab_amb_defeat");
    SetVictoryMusic(CIS, "cis_nab_amb_victory");
    SetDefeatMusic (CIS, "cis_nab_amb_defeat");

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

--Opening Satalite Shot
--Nab1 Plains
--Hill
AddCameraShot(0.983066, -0.039190, 0.178868, 0.007131, 44.779041, -92.555016, 223.609207);
--Pillars
AddCameraShot(0.558071, -0.004864, -0.829747, -0.007232, -99.522423, -104.189438, 102.993027);
--Center
AddCameraShot(-0.180345, 0.002299, -0.983521, -0.012535, 38.772453, -105.314598, 24.777697);

end

