	---------------------------------------------------------------------------
	-- FUNCTION:	ScriptInit
	-- PURPOSE:		This function is only run once
	-- INPUT:		
	-- OUTPUT:		
	-- NOTES:		The name, 'ScriptInit' is a chosen convention, and each
	--				mission script must contain a version of this function, as
	--				it is called from C to start the mission.
	---------------------------------------------------------------------------
	function ScriptInit()
		ReadDataFile("alliance.lvl");
		ReadDataFile("empire.lvl");

		SetUnitCount(1, 32);
		SetReinforcementCount(1, 310);
		AddUnitClass(1, "all_inf_snowtrooper");
		AddUnitClass(1, "all_inf_pilot");
		AddUnitClass(1, "all_inf_sapper");
		AddUnitClass(1, "all_inf_medic");
		AddUnitClass(1, "all_inf_spy");
		AddBleedThreshold(1, 499, 1.0);
		AddBleedThreshold(1, 299, 2.0);
		AddBleedThreshold(1, 99, 5.0);
		AddBleedThreshold(1, 0, 70.0);

		SetUnitCount(2, 32);
		SetReinforcementCount(2, 260);
		AddUnitClass(2, "imp_inf_snowtrooper");
		AddUnitClass(2, "imp_inf_pilot");
		AddUnitClass(2, "imp_inf_gunner");
		AddUnitClass(2, "imp_inf_medic");
		AddUnitClass(2, "imp_inf_scout");
		AddUnitClass(2, "imp_inf_officer");
		AddBleedThreshold(2, 124, 1.0);
		AddBleedThreshold(2, 99, 3.0);
		AddBleedThreshold(2, 0, 70.0);
		SetSpawnDelay(12.0, 1.5);

		ReadDataFile("hoth.lvl");

		-- not needed anymore - NM 6/5/03. Mission is implied already when
		-- we're loading this.
		--		SetState("mission");
	end

 