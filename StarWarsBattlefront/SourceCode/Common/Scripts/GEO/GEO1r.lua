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
    local REP = 1
    local CIS = 2
--  These variables do not change
    local ATT = 1
    local DEF = 2

        AddMissionObjective(CIS, "orange", "level.geo1.objectives.1r");
    AddMissionObjective(CIS, "red", "level.geo1.objectives.2r");
    AddMissionObjective(CIS, "red", "level.geo1.objectives.3r");
    AddMissionObjective(REP, "orange", "level.geo1.objectives.1r");
    AddMissionObjective(REP, "red", "level.geo1.objectives.4r");
    AddMissionObjective(REP, "red", "level.geo1.objectives.5r");

SetTeamAggressiveness(CIS, 1.0)
SetTeamAggressiveness(REP, 1.0)

    ReadDataFile("sound\\geo.lvl;geo1cw");
    ReadDataFile("SIDE\\rep.lvl",
        "rep_bldg_forwardcenter",
        "rep_fly_assault_dome",
        "rep_fly_gunship",
        "rep_fly_gunship_dome",
        "rep_fly_jedifighter_dome",
        "rep_inf_basic",
        "rep_inf_jet_trooper",
        "rep_inf_macewindu",
        "rep_walk_atte")
    ReadDataFile("SIDE\\cis.lvl",
        "cis_fly_droidfighter_dome",
        "cis_fly_fedcoreship_dome",
        "cis_fly_geofighter",
        "cis_fly_techounion_dome",
        "cis_inf_basic",
        "cis_inf_countdooku",
        "cis_inf_droideka",
        "cis_tread_hailfire",
        "cis_walk_spider")
    ReadDataFile("SIDE\\geo.lvl",
        "gen_inf_geonosian")

--  Level Stats

    ClearWalkers()
    SetMemoryPoolSize("EntityWalker", -2)
    AddWalkerType(0, 8) -- 8 droidekas (special case: 0 leg pairs)
    AddWalkerType(2, 2) -- 2 spider walkers with 2 leg pairs each
    AddWalkerType(3, 2) -- 2 attes with 3 leg pairs each
    SetMemoryPoolSize("CommandWalker", 2)
    SetMemoryPoolSize("EntityFlyer", 5)
    SetMemoryPoolSize("EntityHover", 3)
--  SetMemoryPoolSize("EntityCarrier", 2)
--  SetMemoryPoolSize("EntityTauntaun", 0)
--  SetMemoryPoolSize("CommandBuildingArmed", 2)
    SetMemoryPoolSize("PowerupItem", 25)
    SetMemoryPoolSize("MountedTurret", 50)
    SetMemoryPoolSize("Aimer", 200)
    SetSpawnDelay(10.0, 0.25)


--    Republic Stats
    SetTeamName(REP, "Republic")
    SetTeamIcon(REP, "rep_icon")
    AddUnitClass(REP, "rep_inf_clone_trooper",14)
    AddUnitClass(REP, "rep_inf_arc_trooper",4)
    AddUnitClass(REP, "rep_inf_clone_pilot",5)
    AddUnitClass(REP, "rep_inf_clone_sharpshooter",5)
    AddUnitClass(REP, "rep_inf_jet_trooper",4)
    SetHeroClass(REP, "rep_inf_macewindu")
--  SetCarrierClass(REP, "rep_fly_vtrans")

--  CIS Stats
    SetTeamName(CIS, "CIS")
    SetTeamIcon(CIS, "cis_icon")
    AddUnitClass(CIS, "cis_inf_battledroid",11)
    AddUnitClass(CIS, "cis_inf_assault",3)
    AddUnitClass(CIS, "cis_inf_pilotdroid",4)
    AddUnitClass(CIS, "cis_inf_assassindroid",4)
    AddUnitClass(CIS, "cis_inf_droideka",3)
    SetHeroClass(CIS, "cis_inf_countdooku")


--  Attacker Stats
    SetUnitCount(ATT, 32)
    SetReinforcementCount(ATT, 250)
    AddBleedThreshold(ATT, 31, 0.0)
    AddBleedThreshold(ATT, 21, 0.75)
    AddBleedThreshold(ATT, 11, 2.25)
    AddBleedThreshold(ATT, 1, 3.0)
    SetTeamAsEnemy(ATT,3)

--  Defender Stats
    SetUnitCount(DEF, 25)
    SetReinforcementCount(DEF, 250)
    AddBleedThreshold(DEF, 31, 0.0)
    AddBleedThreshold(DEF, 21, 0.75)
    AddBleedThreshold(DEF, 11, 2.25)
    AddBleedThreshold(DEF, 1, 3.0)
    SetTeamAsFriend(DEF,3)

--  Local Stats
    SetTeamName(3, "locals")
    AddUnitClass(3, "geo_inf_geonosian", 7)
    SetUnitCount(3, 7)
    SetTeamAsFriend(3, DEF)
    --SetTeamName(4, "locals")
    --AddUnitClass(4, "rep_inf_jedimale",1)
    --AddUnitClass(4, "rep_inf_jedimaleb",1)
    --AddUnitClass(4, "rep_inf_jedimaley",1)
    --SetUnitCount(4, 3)
    --SetTeamAsFriend(4, ATT)

    ReadDataFile("GEO\\geo1.lvl")

    SetDenseEnvironment("false")
    SetMinFlyHeight(-65)
    SetMaxFlyHeight(50)
    SetMaxPlayerFlyHeight(50)



--  Birdies
    --SetNumBirdTypes(1)
    --SetBirdType(0.0,10.0,"dragon")
    --SetBirdFlockMinHeight(90.0)

--  Sound
    OpenAudioStream("sound\\geo.lvl",  "geocw_music");
    OpenAudioStream("sound\\cw.lvl",  "cw_vo");
    OpenAudioStream("sound\\cw.lvl",  "cw_tac_vo");
    OpenAudioStream("sound\\geo.lvl",  "geo1cw");
    OpenAudioStream("sound\\geo.lvl",  "geo1cw");

    SetBleedingVoiceOver(REP, REP, "rep_off_com_report_us_overwhelmed", 1)
    SetBleedingVoiceOver(REP, CIS, "rep_off_com_report_enemy_losing",   1)
    SetBleedingVoiceOver(CIS, REP, "cis_off_com_report_enemy_losing",   1)
    SetBleedingVoiceOver(CIS, CIS, "cis_off_com_report_us_overwhelmed", 1)

    SetOutOfBoundsVoiceOver(1, "repleaving");
    SetOutOfBoundsVoiceOver(2, "cisleaving");

    SetAmbientMusic(REP, 1.0, "rep_GEO_amb_start",  0,1)
    SetAmbientMusic(REP, 0.99, "rep_GEO_amb_middle", 1,1)
    SetAmbientMusic(REP, 0.1,"rep_GEO_amb_end",    2,1)
    SetAmbientMusic(CIS, 1.0, "cis_GEO_amb_start",  0,1)
    SetAmbientMusic(CIS, 0.99, "cis_GEO_amb_middle", 1,1)
    SetAmbientMusic(CIS, 0.1,"cis_GEO_amb_end",    2,1)

    SetVictoryMusic(REP, "rep_geo_amb_victory")
    SetDefeatMusic (REP, "rep_geo_amb_defeat")
    SetVictoryMusic(CIS, "cis_geo_amb_victory")
    SetDefeatMusic (CIS, "cis_geo_amb_defeat")

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

    --ActivateBonus(CIS, "SNEAK_ATTACK")
    --ActivateBonus(REP, "SNEAK_ATTACK")

    SetAttackingTeam(ATT)

--Opening Satalite Shot
--Geo
--Mountain
AddCameraShot(0.996091, 0.085528, -0.022005, 0.001889, -6.942698, -59.197201, 26.136919);
--Wrecked Ship
AddCameraShot(0.906778, 0.081875, -0.411906, 0.037192, 26.373968, -59.937874, 122.553581);
--War Room	
AddCameraShot(0.994219, 0.074374, 0.077228, -0.005777, 90.939568, -49.293945, -69.571136);
end

