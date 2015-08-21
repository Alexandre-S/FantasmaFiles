class CfgPatches
{
    class PG_Services_PMC_vehicles_XEH
    {
		units[] = {"PMC_Offroad_Transport","PMC_Offroad_Armed","PMC_Offroad_Cargo","PMC_MH9"};
        weapons[]={};
        requiredAddons[] = {"A3_Soft_F","A3_Air_F","PG_Services_PMC_vehicles", "cba_xeh"};
        requiredVersion = 1.0;
    };
};

class CfgVehicles
{
	class B_Heli_Light_01_F;
	class C_Offroad_01_F;
	class Offroad_01_military_base_F;
	class PMC_MH9_base: B_Heli_Light_01_F
	{
		// scope = 1;
		class EventHandlers;
	};
	class PMC_Offroad_base: C_Offroad_01_F
	{
		// scope = 1;
		class EventHandlers;
	};
	class Offroad_01_armed_base_F: Offroad_01_military_base_F
	{
		class EventHandlers;
	};
	class PMC_MH9: PMC_MH9_base
	{
		// displayName = "MH-9 PMC";
		// dlc = "PG_Services_Mod";
		// scope = 2;
		// side = 2;
		// faction = "PG_Services";
		// author = "Pomigit";
		// forceInGarage = 1;
		// crew = "PMC_Helipilot";
		// hiddenSelectionsTextures[] = {"\PG_Services_PMC\textures\MH9\Heli_light01_ext_pmc_co.paa","a3\air_f\mh9\data\heli_medium01_detail_co.paa","\PG_Services_PMC\textures\MH9\heli_light01_int_pmc_co.paa"};
		class EventHandlers: EventHandlers
		{
		    delete init;
			// init = "(_this select 0) execVM ""\PG_Services_PMC_config\scripts\heli.sqf""";
		};
	};
	class PMC_Offroad_Transport: PMC_Offroad_base
	{
		// scope = 2;
		// side = 2;
		// author = "BadHabitz";
		// forceInGarage = 1;
		// faction = "PG_Services";
		// displayName = "Offroad Transport";
		// dlc = "PG_Services_Mod";
		// crew = "PMC_SecurityCon_MX";
		// typicalCargo[] = {"PMC_Engineer"};
		// enableGPS = 1;
		// transportMaxBackpacks = 6;
		// hiddenSelectionsTextures[] = {"\PG_Services_PMC\textures\Vehicles\offroad_01.paa","\PG_Services_PMC\textures\Vehicles\offroad_01.paa"};
		class EventHandlers: EventHandlers
		{
		    delete init;
			// init = "(_this select 0) execVM ""\PG_Services_PMC_config\scripts\randomize.sqf""";
		};
		// class TransportItems
		// {
			// class _xx_ToolKit
			// {
				// name = "ToolKit";
				// count = 1;
			// };
			// class _xx_Medikit
			// {
				// name = "Medikit";
				// count = 1;
			// };
			// class _xx_FirstAidKit
			// {
				// name = "FirstAidKit";
				// count = 10;
			// };
		// };
	};
	class PMC_Offroad_Armed: Offroad_01_armed_base_F
	{
		// scope = 2;
		// side = 2;
		// author = "BadHabitz";
		// forceInGarage = 1;
		// faction = "PG_Services";
		// displayName = "Offroad Armed";
		// dlc = "PG_Services_Mod";
		// crew = "PMC_SecurityCon_MX";
		// typicalCargo[] = {"PMC_Engineer"};
		// enableGPS = 1;
		// mapSize = 5;
		// transportMaxBackpacks = 6;
		// hiddenSelectionsTextures[] = {"\PG_Services_PMC\textures\Vehicles\offroad_01.paa","\PG_Services_PMC\textures\Vehicles\offroad_01.paa"};
		class EventHandlers: EventHandlers
		{
		    delete init;
			// init = "(_this select 0) execVM ""\PG_Services_PMC_config\scripts\randomize.sqf""";
		};
		// class TransportItems
		// {
			// class _xx_ToolKit
			// {
				// name = "ToolKit";
				// count = 1;
			// };
			// class _xx_Medikit
			// {
				// name = "Medikit";
				// count = 1;
			// };
			// class _xx_FirstAidKit
			// {
				// name = "FirstAidKit";
				// count = 10;
			// };
		// };
	};
	class PMC_Offroad_Cargo: PMC_Offroad_base
	{
		// scope = 2;
		// side = 2;
		// author = "BadHabitz";
		// forceInGarage = 1;
		// faction = "PG_Services";
		// displayName = "Offroad Cargo";
		// dlc = "PG_Services_Mod";
		// crew = "PMC_SecurityCon_MX";
		// typicalCargo[] = {"PMC_Engineer"};
		// enableGPS = 1;
		// transportSoldier = 1;
		// cargoAction[] = {"passenger_low01"};
		// transportMaxBackpacks = 6;
		// hiddenSelectionsTextures[] = {"\PG_Services_PMC\textures\Vehicles\offroad_01.paa","\PG_Services_PMC\textures\Vehicles\offroad_01.paa"};
		class EventHandlers: EventHandlers
		{
		    delete init;
			// init = "(_this select 0) execVM ""\PG_Services_PMC_config\scripts\randomize.sqf""";
		};
		// class TransportItems
		// {
			// class _xx_ToolKit
			// {
				// name = "ToolKit";
				// count = 1;
			// };
			// class _xx_Medikit
			// {
				// name = "Medikit";
				// count = 1;
			// };
			// class _xx_FirstAidKit
			// {
				// name = "FirstAidKit";
				// count = 10;
			// };
		// };
	};
};