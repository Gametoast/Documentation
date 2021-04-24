-- List of missions presented to the user for IA/MP/splitscreen/etc.
-- This list is kept in alphabetical order (in English, anyhow).
--
-- Each entry should be in the following form:
-- {    -- starts a table entry
--   mapluafile = "END1", -- base name of map, w/o attacking side, no ".lua" either
--   showstr = "planets.endor.name1", -- localization key in DB of item to show
--   side_a = 1,  -- [OPTIONAL] Put this in the table if there is a "a" version of the map
--   side_c = 1,  -- [OPTIONAL] Put this in the table if there is a "c" version of the map
--   side_i = 1,  -- [OPTIONAL] Put this in the table if there is a "i" version of the map
--   side_r = 1,  -- [OPTIONAL] Put this in the table if there is a "r" version of the map
--   side_a_team1 = "common.sides.all.name" -- [OPTIONAL] -- localized name of team1 in an 'a' version of this map
--   side_a_team2 = "common.sides.imp.name" -- [OPTIONAL] -- localized name of team2 in an 'a' version of this map
--    -- Note, there's also OPTIONAL side_c_team1, side_i_team1, side_r_team1,
--    -- side_c_team2, side_i_team2, side_r_team2 fields. 
-- 
-- },   -- ends a table entry
--
-- Below, things are in one-entry-per-line format to make it easier to
-- comment in/out maps by commenting in/out a single line


-- Names for the attacking team. Entries must have same tags as the
-- next list, and the button layout list
gMissionSelectAttackerTeams = {
	a = "common.sides.all.name",
	i = "common.sides.imp.name",
	r = "common.sides.rep.name",
	c = "common.sides.cis.name",
}

gMissionSelectDefenderTeams = {
	a = "common.sides.imp.name",
	i = "common.sides.all.name",
	r = "common.sides.cis.name",
	c = "common.sides.rep.name",
}

-- For making the 'seal_XXX' name 
gExpandedSideNames = {
	a = "all",
	i = "imp",
	r = "rep",
	c = "cis",
}

sp_missionselect_listbox_contents = {
	{ mapluafile = "BES1", showstr = "planets.bespin.mapname1", side_r = 1, side_a = 1},
	{ mapluafile = "BES2", showstr = "planets.bespin.mapname2", side_r = 1, side_a = 1},

	{ mapluafile = "END1", showstr = "planets.endor.mapname1", side_a = 1},

	{ mapluafile = "GEO1", showstr = "planets.geonosis.mapname1", side_r = 1},

	{ mapluafile = "HOT1", showstr = "planets.hoth.mapname1", side_i = 1},

	{ mapluafile = "KAM1", showstr = "planets.kamino.mapname1", side_c = 1},

	{ mapluafile = "KAS1", showstr = "planets.kashyyyk.mapname1", side_c = 1, side_i = 1},
	{ mapluafile = "KAS2", showstr = "planets.kashyyyk.mapname2", side_c = 1, side_i = 1},

	{ mapluafile = "NAB1", showstr = "planets.naboo.mapname1", side_c = 1, side_i = 1},
	{ mapluafile = "NAB2", showstr = "planets.naboo.mapname2", side_c = 1, side_a = 1},

	{ mapluafile = "RHN1", showstr = "planets.rhenvar.mapname1", side_r = 1, side_i = 1},
	{ mapluafile = "RHN2", showstr = "planets.rhenvar.mapname2", side_c = 1, side_a = 1},

	{ mapluafile = "TAT1", showstr = "planets.tatooine.mapname1", side_r = 1, side_i = 1},
	{ mapluafile = "TAT2", showstr = "planets.tatooine.mapname2", side_r = 1, side_i = 1},

	{ mapluafile = "YAV1", showstr = "planets.yavin.mapname1", side_c = 1, side_i = 1},
	{ mapluafile = "YAV2", showstr = "planets.yavin.mapname2", side_r = 1, side_i = 1},

}

mp_missionselect_listbox_contents = {
	{ mapluafile = "BES1", showstr = "planets.bespin.mapname1", side_r = 1, side_a = 1},
	{ mapluafile = "BES2", showstr = "planets.bespin.mapname2", side_r = 1, side_a = 1},

	{ mapluafile = "END1", showstr = "planets.endor.mapname1", side_a = 1},

	{ mapluafile = "GEO1", showstr = "planets.geonosis.mapname1", side_r = 1},

	{ mapluafile = "HOT1", showstr = "planets.hoth.mapname1", side_i = 1},

	{ mapluafile = "KAM1", showstr = "planets.kamino.mapname1", side_c = 1},

	{ mapluafile = "KAS1", showstr = "planets.kashyyyk.mapname1", side_c = 1, side_i = 1},
	{ mapluafile = "KAS2", showstr = "planets.kashyyyk.mapname2", side_c = 1, side_i = 1},

	{ mapluafile = "NAB1", showstr = "planets.naboo.mapname1", side_c = 1, side_i = 1},
	{ mapluafile = "NAB2", showstr = "planets.naboo.mapname2", side_c = 1, side_a = 1},

	{ mapluafile = "RHN1", showstr = "planets.rhenvar.mapname1", side_r = 1, side_i = 1},
	{ mapluafile = "RHN2", showstr = "planets.rhenvar.mapname2", side_c = 1, side_a = 1},

	{ mapluafile = "TAT1", showstr = "planets.tatooine.mapname1", side_r = 1, side_i = 1},
	{ mapluafile = "TAT2", showstr = "planets.tatooine.mapname2", side_r = 1, side_i = 1},

	{ mapluafile = "YAV1", showstr = "planets.yavin.mapname1", side_c = 1, side_i = 1},
	{ mapluafile = "YAV2", showstr = "planets.yavin.mapname2", side_r = 1, side_i = 1},
}

-- List of maps usable in attract mode. These should be the raw lua
-- filenames (without ".lua"), and one per line, so we can turn them
-- on/off easily. Historical missions could go in here if desired.
attract_mode_maps = {
	"bes1a",
	"bes1r",
	"bes2a",
	"bes2r",
	"end1a",
	"geo1r",
	"hot1i",
	"kam1c",
	"kas1c",
	"kas1i",
	"kas2c",
	"kas2i",
	"nab1c",
	"nab1i",
	"nab2a",
	"nab2c",
	"rhn1i",
	"rhn1r",
	"tat1i",
	"tat1r",
	"tat2i",
	"tat2r",
	"yav1c",
	"yav1i",
	"yav2i",
	"yav2r",

	-- Historical maps, off by default
 	"nab1c_h",
 	"nab2c_h",
 	"kas1c_h",
 	"geo1r_h",
 	"kam1c_h",
 	"rhn1r_h",
 	"kas2c_h",
 	"tat1i_h",
 	"tat2i_h",
 	"rhn2a_h",
 	"yav2i_h",
 	"yav1i_h",
 	"hot1i_h",
 	"bes2a_h",
 	"bes1a_h",
 	"end1a_h",
}


-- Singleplayer campaigns. Each of these tables has a set of
-- sub-tables, one sub-table per mission. These are run through in
-- order. Note: there is a max of 255 missions in a campaign. Todo:
-- add in listings for VOs, backgrounds, etc.
--
-- Optional params per line:
--   side = 2,    -- forces the user to team 2 (defender). If omitted, team 1 (attacker) is forced
--   intromovie = "", --movie played before yoda
--   outtromovie = "", --movie played after yoda, before mission
--   exitmovie = "", --movie played after mission is done (and you win)
-- [More will be coming, which refer to text to print, voiceover, etc.]

SPCampaign_CW = {
	--Player is CIS
	{
		mapluafile = "nab1c_h",
		side = 1,
		showstr = "ifs.sp.cw.map1name",
		description = "ifs.sp.cw.map1descr",
		movie = "nab1fly",
		voiceover = "cis_missionbriefing_nab1",
		intromovie = "nab1h01",
--no tutorials on the pc
--		outtromovie = "tutorial01cw",
--		outtromovie_left = 90, 
--		outtromovie_top = 60, 
--		outtromovie_width = 460, 
--		outtromovie_height = 350,
--		outtromovielocalized = 1,
		briefingmusic = "shell_droidinvasion",
		iconmodel = "com_icon_CIS"
	}, --Player is CIS
	{
		mapluafile = "nab2c_h",
		side = 1,
		showstr = "ifs.sp.cw.map2name",
		description = "ifs.sp.cw.map2descr",
		movie = "nab2fly",
		voiceover = "cis_missionbriefing_nab2",
		outtromovie = "nab2h01",
		briefingmusic = "shell_droidinvasion",
		--unlockable = 1,
		iconmodel = "com_icon_CIS"
	}, --Player is CIS
	{
		mapluafile = "kas1c_h",
		side = 1,
		showstr = "ifs.sp.cw.map3name",
		description = "ifs.sp.cw.map3descr",
		movie = "kas1fly",
		voiceover = "cis_missionbriefing_kas1",
		briefingmusic = "shell_droidinvasion",
		--unlockable = 2,
		iconmodel = "com_icon_CIS"
	}, 

	--Player is Republic
	{
		mapluafile = "geo1r_h",
		side = 1,
		showstr = "ifs.sp.cw.map4name",
		description = "ifs.sp.cw.map4descr",
		movie = "geo1fly",
		outtromovie = "geo1h01",
		voiceover = "rep_missionbriefing_geo1",
		briefingmusic = "shell_clonewars",
		--unlockable = 3,
		iconmodel = "com_icon_republic"
	},
	
	--Player is Republic
	{
		mapluafile = "kam1c_h",
		side = 2,
		showstr = "ifs.sp.cw.map5name",
		description = "ifs.sp.cw.map5descr",
		movie = "kam1fly",
		intromovie = "kam1h01",
		outtromovie = "kam1h02",
		voiceover = "rep_missionbriefing_kam1",
		briefingmusic = "shell_clonewars",
		--unlockable = 4,	
		iconmodel = "com_icon_republic"
	},--Player is Republic
	{
		mapluafile = "rhn1r_h",
		side = 1,
		showstr = "ifs.sp.cw.map6name",
		description = "ifs.sp.cw.map6descr",
		movie = "rhn1fly",
		voiceover = "rep_missionbriefing_rhn1",
		briefingmusic = "shell_clonewars",
 		--unlockable = 5,
		iconmodel = "com_icon_republic"
	},--Player is Republic
	{
		mapluafile = "kas2c_h",
		side = 2,
		showstr = "ifs.sp.cw.map7name",
		description = "ifs.sp.cw.map7descr", side = 2,
		movie = "kas2fly",
		voiceover = "rep_missionbriefing_kas1",
		briefingmusic = "shell_clonewars",
		exitmovie = "kas2h01",
		iconmodel = "com_icon_republic"
	},--Player is Republic
}

SPCampaign_GCW = {
	--Player is the Empire
	{
		mapluafile = "tat1i_h",
		side = 1,
		showstr = "ifs.sp.gcw.map1name",
		description = "ifs.sp.gcw.map1descr",
		movie = "tat1fly",
		intromovie = "tat1h01",
-- no tutorials on pc
--		outtromovie = "tutorial01gcw",
--		outtromovie_left = 90, 
--		outtromovie_top = 60, 
--		outtromovie_width = 460, 
--		outtromovie_height = 350,
--		outtromovielocalized = 1,
		voiceover = "imp_missionbriefing_tat1",
		briefingmusic = "shell_imperialmarch",
		iconmodel = "com_icon_imperial"
	},--Player is the Empire
	{
		mapluafile = "tat2i_h",
		side = 1,		
		showstr = "ifs.sp.gcw.map2name",
		description = "ifs.sp.gcw.map2descr",
		movie = "tat2fly",
		intromovie = "tat2h01",
		voiceover = "imp_missionbriefing_tat2",
		briefingmusic = "shell_imperialmarch",
		--unlockable = 6,
		iconmodel = "com_icon_imperial"
	},--Player is the Empire
	{
		mapluafile = "rhn2a_h",
		side = 2,
		showstr = "ifs.sp.gcw.map3name",
		description = "ifs.sp.gcw.map3descr",
		movie = "rhn2fly",
		voiceover = "imp_missionbriefing_rhn1",
		briefingmusic = "shell_imperialmarch",
		iconmodel = "com_icon_imperial"
	},--Player is the Empire
	{
		mapluafile = "yav2i_h",
		side = 1,		
		showstr = "ifs.sp.gcw.map4name",
		description = "ifs.sp.gcw.map4descr",
		movie = "yav2fly",
		intromovie = "yav2h01",
		voiceover = "imp_missionbriefing_yav1",
		briefingmusic = "shell_imperialmarch",
		iconmodel = "com_icon_imperial"
	},--Player is the Alliance
	{
		mapluafile = "yav1i_h",
		side = 2,		
		showstr = "ifs.sp.gcw.map5name",
		description = "ifs.sp.gcw.map5descr",
		movie = "yav1fly",
		intromovie = "yav1h01",
		voiceover = "all_missionbriefing_yav1",
		briefingmusic = "shell_clash",
		--unlockable = 7,
		iconmodel = "com_icon_alliance"		
	},--Player is the Alliance

	--Player is the Alliance
	{
		mapluafile = "hot1i_h",
		side = 2,		
		showstr = "ifs.sp.gcw.map6name",
		description = "ifs.sp.gcw.map6descr", side = 2,
		movie = "hot1fly",
		outtromovie = "hot1h02",
		voiceover = "all_missionbriefing_hot1",
		briefingmusic = "shell_clash",
		--unlockable = 8,
		iconmodel = "com_icon_alliance"		
	},--Player is the Alliance
	{
		mapluafile = "bes2a_h",
		side = 1,
		showstr = "ifs.sp.gcw.map7name",
		description = "ifs.sp.gcw.map7descr",
		movie = "bes2fly",
		intromovie = "bes2h01",
		voiceover = "all_missionbriefing_bes1",
		briefingmusic = "shell_clash",
		--unlockable = 9,
		iconmodel = "com_icon_alliance"		
	},--Player is the Alliance
	{
		mapluafile = "bes1a_h",
		side = 1,
		showstr = "ifs.sp.gcw.map8name",
		description = "ifs.sp.gcw.map8descr",
		movie = "bes1fly",
		outtromovie = "bes1h01",
		voiceover = "all_missionbriefing_bes2",
		briefingmusic = "shell_clash",
		--unlockable = 10,
		iconmodel = "com_icon_alliance"		
	},--Player is the Alliance
	{
		mapluafile = "end1a_h",
		side = 1,		
		showstr = "ifs.sp.gcw.map9name",
		description = "ifs.sp.gcw.map9descr",
		movie = "end1fly",
		outtromovie = "end1h02",
		exitmovie = "end1h03",
		voiceover = "all_missionbriefing_end1",
		briefingmusic = "shell_clash",
		iconmodel = "com_icon_alliance"		
	},--Player is the Alliance
}


-- Tables for cached mapname lookups. The key for each entry will
-- be the 'abbrev' passed into missionlist_GetLocalizedMapName(abbrev)
-- if present.
gMapName0Table = {}
gMapName1Table = {}
gMapName2Table = {}

-- API
-- ShowUStr, iSource = missionlist_GetLocalizedName("tat3a")
--
-- Given an abbreviation (e.g. "tat3a"), returns a localized unicode
-- string that should be shown. Also returns an index of where that
-- string came from:
-- 0: localize database
-- 1: addon map w/ English-only string
-- 2: fallback (abbrev upconverted to Unicode)
function missionlist_GetLocalizedMapName(abbrev)
	-- Look in cached lookups first
	local CacheUStr

	CacheUStr = gMapName0Table[abbrev]
	if(CacheUStr) then
		--      print("gMapName0Table["..abbrev.."] found")
		return CacheUStr, 0
	end

	CacheUStr = gMapName1Table[abbrev]
	if(CacheUStr) then
		--      print("gMapName1Table["..abbrev.."] found")
		return CacheUStr, 1
	end

	CacheUStr = gMapName2Table[abbrev]
	if(CacheUStr) then
		--      print("gMapName2Table["..abbrev.."] found")
		return CacheUStr, 2
	end

	------- Not cached. Do lookup, stick it in cache

	local i,j,l
	l = strlen(abbrev)

	-- Pass #1, try and find it in current missionlist
	if(missionselect_listbox_contents) then
		for i = 0,1 do
			local TrimmedStr = strupper(strsub(abbrev, 1, l - i))
			for j = 1,getn(missionselect_listbox_contents) do
				if(TrimmedStr == strupper(missionselect_listbox_contents[j].mapluafile)) then
					local DisplayUStr = ScriptCB_getlocalizestr(missionselect_listbox_contents[j].showstr, 1) -- 2nd param: return nil if not found
					if(DisplayUStr) then
						gMapName0Table[abbrev] = DisplayUStr
						return DisplayUStr, 0
					else
						DisplayUStr = ScriptCB_tounicode(missionselect_listbox_contents[j].showstr)
						gMapName1Table[abbrev] = DisplayUStr
						return DisplayUStr, 1
					end
				end
			end -- j loop over missionselect_listbox_contents
		end -- i loop over trimming suffixes
	end

	-- Final fallback: show what was received
	local DisplayUStr = ScriptCB_tounicode(abbrev)
	gMapName2Table[abbrev] = DisplayUStr
	return DisplayUStr, 2
end
