#define GVAR_UINS uiNamespace getVariable
#define CONST(var1,var2) var1 = compileFinal (if(typeName var2 == "STRING") then {var2} else {str(var2)})
#define steamid getPlayerUID player
/*
	File: fn_initSpy.sqf
	
	Description:
	Does some things that I made over-complicated / un-needed but blah.
	Will eventually include server-side checks but it's blah at this point.
	
	Will also become a standalone system which is why it's setup like this.
*/
private["_binConfigPatches","_cfgPatches","_endM"];
if(isServer OR !hasInterface) exitwith {}; //Server doesn't need to know.

CONST(W_O_O_K_I_E_ANTI_ANTI_HAX,"false");
CONST(W_O_O_K_I_E_FUD_ANTI_ANTI_HAX,"false");
CONST(E_X_T_A_S_Y_ANTI_ANTI_HAX,"false");
CONST(E_X_T_A_S_Y_Pro_RE,"false");
CONST(E_X_T_A_S_Y_Car_RE,"false");
CONST(DO_NUKE,"false");
CONST(JxMxE_spunkveh,"false");
CONST(JxMxE_spunkveh2,"false");
CONST(JxMxE_spunkair,"false");
CONST(JJJJ_MMMM___EEEEEEE_LLYYSSTTIICCC_SHIT_RE,"false");
CONST(JJJJ_MMMM___EEEEEEE_LLYYSSTTIICCC_SHIT_RE_OLD,"false");
CONST(JJJJ_MMMM___EEEEEEE_SPAWN_VEH,"false");
CONST(JJJJ_MMMM___EEEEEEE_SPAWN_WEAPON,"false");

/*
	Compile our list of allowed addon patches, by default this DOES NOT ALLOW ANY ADDONS.
	
	If you want to white-list addons such as JSRS or Blastcore you need to start a test instance (Host locally and not the mission) and first fill the SPY_cfg_patchList array, once you executed it (Filled it)
	Run the following code and it will copy the list of addons / patches not in the list to your clipboard (Ctrl + V) and then add it to the array.
	
	_cfgPatches = [];
	_binConfigPatches = configFile >> "CfgPatches";
	for "_i" from 0 to count (_binConfigPatches)-1 do {
		_patchEntry = _binConfigPatches select _i;
		if(isClass _patchEntry) then {
			if(!((configName _patchEntry) in SPY_cfg_patchList)) then {
				_cfgPatches set[count _cfgPatches,(configName _patchEntry)];
			};
		};
	};

	copyToClipboard str(_cfgPatches);
	
	i.e
	["cba_xeh","Extended_EventHandlers","CBA_Extended_EventHandlers","JSRS_Environment","WarFXPE","cba_common","cba_events","cba_hashes","cba_network","cba_strings","cba_ui","cba_vectors","JSRS2_120mm_Cannon","JSRS2_127","JSRS2_155mm_AMOS",
	"JSRS2_230mm_Titan","JSRS2_30mm_Cannon","JSRS2_35mm_Autocannon","JSRS2_4Five45","JSRS2_ACPC","JSRS2_Autocannon","JSRS2_Bullethits","JSRS2_DAGR","JSRS2_DAR","JSRS2_EBR","JSRS2_Explosions","JSRS2_Explosives","JSRS2_Filters","JSRS2_FS2000",
	"JSRS2_Gatling","JSRS2_GMG20","JSRS2_GMG40","JSRS2_Khaybar","JSRS2_LMGRCWS","JSRS2_M134","JSRS2_M200","JSRS2_M320R","JSRS2_M6","JSRS2_Minigun","JSRS2_MX","JSRS2_NLAW","JSRS2_P07","JSRS2_PDW","JSRS2_Rahim","JSRS2_Rook40","JSRS2_RPG32",
	"JSRS2_Scorpian","JSRS2_SDAR","JSRS2_Skalpel_ATGM","JSRS2_Skyfire","JSRS2_Sonic_Cracks","JSRS2_Titan","JSRS2_TRG20","JSRS2_Vector","JSRS2_Veh_Titan","JSRS2_Zafir","JSRS2_Zubr45","Blastcore_VEP","cba_ai","cba_arrays","cba_diagnostic","cba_help",
	"cba_ui_helper","cba_versioning","JSRS2_Movement","JSRS2_Silencers","cba_main","cba_main_a3","JSRS2_2S9_Sorcher","JSRS2_AFV4_Gorgon","JSRS2_AH99_Blackfoot","JSRS2_AH9_Pawnee","JSRS2_AMV7_Marshal","JSRS2_BTRK_Kamysh","JSRS2_CH49_Mohawk","JSRS2_Distance",
	"JSRS2_FighterPlane3","JSRS2_FV720_Mora","JSRS2_Hunter","JSRS2_Ifrit","JSRS2_IFV6a_Cheetah","JSRS2_IFV6c_Panther","JSRS2_M2A1_Slammer","JSRS2_M4_Scorcher","JSRS2_M5_Sandstorm","JSRS2_MBT52_Kuma","JSRS2_Mi48_Kajman","JSRS2_MSE3_Marid","JSRS2_Offroad",
	"JSRS2_Po30_Orca","JSRS2_Strider","JSRS2_SUV","JSRS2_T100_Varsuk","JSRS2_Truck1","JSRS2_Truck2","JSRS2_UAV_1","JSRS2_UH80_GhostHawk","JSRS2_Van","JSRS2_WY55_Hellcat","JSRS2_ZSU39_Tigris","cba_xeh_a3"]
*/
	
_patchList = 
["marmadebug","life_server","3DEN","CAData","A3_BaseConfig_F","A3_Dubbing_Radio_F","A3_Functions_F","A3_Functions_F_EPA","A3_Functions_F_EPC","A3_Data_F","A3_Data_F_ParticleEffects","A3_Editor_F","A3_Functions_F_Curator",
"A3_Language_F","A3_Language_F_Beta","A3_Language_F_Curator","A3_Language_F_EPA","A3_Language_F_EPB","A3_Language_F_EPC","A3_Language_F_Gamma","A3_LanguageMissions_F","A3_LanguageMissions_F_Beta",
"A3_LanguageMissions_F_Gamma","A3_Misc_F","A3_Misc_F_Helpers","A3_Modules_F","A3_Modules_F_DynO","A3_Modules_F_Effects","A3_Modules_F_Events","A3_Modules_F_GroupModifiers","A3_Modules_F_HC",
"A3_Modules_F_Intel","A3_Modules_F_LiveFeed","A3_Modules_F_Marta","A3_Modules_F_Misc","A3_Modules_F_Multiplayer","A3_Modules_F_ObjectModifiers","A3_Modules_F_Sites","A3_Modules_F_Skirmish",
"A3_Modules_F_StrategicMap","A3_Modules_F_Supports","A3_Modules_F_UAV","A3_Modules_F_Beta","A3_Modules_F_Beta_FiringDrills","A3_Modules_F_EPB","A3_Modules_F_EPB_Misc","A3_Music_F","A3_Music_F_EPA",
"A3_Music_F_EPB","A3_Music_F_EPC","A3_Roads_F","A3_Rocks_F","A3_Sounds_F","A3_Sounds_F_EPB","A3_Sounds_F_EPC","A3_Structures_F","A3_Structures_F_Bridges","A3_Structures_F_Civ","A3_Structures_F_Civ_Accessories",
"A3_Structures_F_Civ_Ancient","A3_Structures_F_Civ_BellTowers","A3_Structures_F_Civ_Calvaries","A3_Structures_F_Civ_Camping","A3_Structures_F_Civ_Chapels","A3_Structures_F_Civ_Constructions","A3_Structures_F_Civ_Dead",
"A3_Structures_F_Civ_Garbage","A3_Structures_F_Civ_InfoBoards","A3_Structures_F_Civ_Lamps","A3_Structures_F_Civ_Market","A3_Structures_F_Civ_Offices","A3_Structures_F_Civ_Pavements","A3_Structures_F_Civ_PlayGround",
"A3_Structures_F_Civ_SportsGrounds","A3_Structures_F_Civ_Statues","A3_Structures_F_Dominants","A3_Structures_F_Dominants_Amphitheater","A3_Structures_F_Dominants_Castle","A3_Structures_F_Dominants_Church",
"A3_Structures_F_Dominants_Hospital","A3_Structures_F_Dominants_Lighthouse","A3_Structures_F_Dominants_WIP","A3_Structures_F_Furniture","A3_Structures_F_Households","A3_Structures_F_Households_Addons",
"A3_Structures_F_Households_House_Big01","A3_Structures_F_Households_House_Big02","A3_Structures_F_Households_House_Shop01","A3_Structures_F_Households_House_Shop02","A3_Structures_F_Households_House_Small01",
"A3_Structures_F_Households_House_Small02","A3_Structures_F_Households_House_Small03","A3_Structures_F_Households_Slum","A3_Structures_F_Households_Stone_Big","A3_Structures_F_Households_Stone_Shed",
"A3_Structures_F_Households_Stone_Small","A3_Structures_F_Households_WIP","A3_Structures_F_Ind","A3_Structures_F_Ind_AirPort","A3_Structures_F_Ind_Cargo","A3_Structures_F_Ind_CarService",
"A3_Structures_F_Ind_ConcreteMixingPlant","A3_Structures_F_Ind_Crane","A3_Structures_F_Ind_DieselPowerPlant","A3_Structures_F_Ind_Factory","A3_Structures_F_Ind_FuelStation","A3_Structures_F_Ind_FuelStation_Small",
"A3_Structures_F_Ind_Pipes","A3_Structures_F_Ind_PowerLines","A3_Structures_F_Ind_ReservoirTank","A3_Structures_F_Ind_Shed","A3_Structures_F_Ind_SolarPowerPlant","A3_Structures_F_Ind_Tank",
"A3_Structures_F_Ind_Transmitter_Tower","A3_Structures_F_Ind_WavePowerPlant","A3_Structures_F_Ind_Windmill","A3_Structures_F_Ind_WindPowerPlant","A3_Structures_F_Items","A3_Structures_F_Items_Documents",
"A3_Structures_F_Items_Electronics","A3_Structures_F_Items_Cans","A3_Structures_F_Items_Gadgets","A3_Structures_F_Items_Luggage","A3_Structures_F_Items_Stationery","A3_Structures_F_Items_Tools",
"A3_Structures_F_Items_Valuables","A3_Structures_F_Items_Vessels","A3_Structures_F_Mil","A3_Structures_F_Mil_BagBunker","A3_Structures_F_Mil_BagFence","A3_Structures_F_Mil_Barracks","A3_Structures_F_Mil_Bunker",
"A3_Structures_F_Mil_Cargo","A3_Structures_F_Mil_Flags","A3_Structures_F_Mil_Fortification","A3_Structures_F_Mil_Helipads","A3_Structures_F_Mil_Offices","A3_Structures_F_Mil_Radar","A3_Structures_F_Mil_Shelters",
"A3_Structures_F_Mil_TentHangar","A3_Structures_F_Naval","A3_Structures_F_Naval_Buoys","A3_Structures_F_Naval_Piers","A3_Structures_F_Naval_RowBoats","A3_Structures_F_Research","A3_Structures_F_System",
"A3_Structures_F_Training","A3_Structures_F_Training_InvisibleTarget","A3_Structures_F_Walls","A3_Structures_F_EPA_Civ_Camping","A3_Structures_F_EPA_Civ_Constructions","A3_Structures_F_EPA_Items_Electronics",
"A3_Structures_F_EPA_Items_Food","A3_Structures_F_EPA_Items_Medical","A3_Structures_F_EPA_Items_Tools","A3_Structures_F_EPA_Items_Vessels","A3_Structures_F_EPA_Walls","A3_Structures_F_EPB_Civ_Accessories",
"A3_Structures_F_EPB_Civ_Camping","A3_Structures_F_EPB_Civ_Dead","A3_Structures_F_EPB_Civ_Garbage","A3_Structures_F_EPB_Civ_Graffiti","A3_Structures_F_EPB_Civ_PlayGround","A3_Structures_F_EPB_Furniture",
"A3_Structures_F_EPB_Items_Documents","A3_Structures_F_EPB_Items_Luggage","A3_Structures_F_EPB_Items_Military","A3_Structures_F_EPB_Items_Vessels","A3_Structures_F_EPB_Naval_Fishing","A3_Structures_F_EPC_Civ_Accessories",
"A3_Structures_F_EPC_Civ_Camping","A3_Structures_F_EPC_Civ_Garbage","A3_Structures_F_EPC_Civ_InfoBoards","A3_Structures_F_EPC_Civ_Kiosks","A3_Structures_F_EPC_Civ_PlayGround",
"A3_Structures_F_EPC_Civ_Tourism","A3_Structures_F_EPC_Dominants_GhostHotel","A3_Structures_F_EPC_Dominants_Stadium","A3_Structures_F_EPC_Furniture","A3_Structures_F_EPC_Items_Documents",
"A3_Structures_F_EPC_Items_Electronics","A3_Structures_F_EPC_Walls","A3_UIFonts_F","A3_Animals_F","A3_Animals_F_AnimConfig","A3_Animals_F_Fishes","A3_Animals_F_Kestrel","A3_Animals_F_Rabbit",
"A3_Animals_F_Seagull","A3_Animals_F_Snakes","A3_Animals_F_Turtle","A3_Animals_F_Chicken","A3_Animals_F_Dog","A3_Animals_F_Goat","A3_Animals_F_Sheep","A3_Anims_F","A3_Anims_F_Config_Sdr",
"A3_Anims_F_EPA","A3_Anims_F_EPC","A3_Map_Data","A3_Map_Stratis","A3_Map_Stratis_Scenes","A3_Plants_F_Bush","A3_Signs_F","A3_Signs_F_AD","A3_UI_F","A3_UI_F_Curator","A3_Weapons_F",
"A3_Weapons_F_NATO","A3_Weapons_F_CSAT","A3_Weapons_F_AAF","A3_weapons_F_FIA","A3_Weapons_F_ItemHolders","A3_Weapons_F_Headgear","A3_Weapons_F_Uniforms","A3_Weapons_F_Vests","A3_Weapons_F_Ammoboxes",
"A3_Weapons_F_DummyWeapons","A3_Weapons_F_Explosives","A3_Weapons_F_Items","A3_Weapons_F_Launchers_NLAW","A3_Weapons_F_Launchers_LAW","A3_Weapons_F_EBR","A3_Weapons_F_LongRangeRifles_GM6",
"A3_Weapons_F_LongRangeRifles_M320","A3_Weapons_F_Machineguns_M200","A3_Weapons_F_Pistols_P07","A3_Weapons_F_Pistols_Rook40","A3_Weapons_F_Rifles_Khaybar","A3_Weapons_F_Rifles_MX","A3_Weapons_F_Rifles_SDAR",
"A3_Weapons_F_Rifles_TRG20","A3_Weapons_F_beta","A3_Weapons_F_Beta_Ammoboxes","A3_Weapons_F_Launchers_Titan","A3_Weapons_F_beta_EBR","A3_Weapons_F_Machineguns_Zafir","A3_Weapons_F_Pistols_ACPC2","A3_Weapons_F_beta_Rifles_Khaybar",
"A3_Weapons_F_Rifles_Mk20","A3_Weapons_F_beta_Rifles_MX","A3_Weapons_F_beta_Rifles_TRG20","A3_Weapons_F_Rifles_Vector","a3_weapons_f_rifles_SMG_02","A3_Weapons_F_EPA_LongRangeRifles_DMR_01","A3_Weapons_F_EPA_EBR",
"A3_Weapons_F_EPA_LongRangeRifles_GM6","A3_Weapons_F_Pistols_Pistol_heavy_01","A3_Weapons_F_Pistols_Pistol_heavy_02","A3_Weapons_F_EPA_Rifles_MX","A3_Weapons_F_EPB_LongRangeRifles_GM3","A3_Weapons_F_EPB_LongRangeRifles_M320",
"A3_Weapons_F_EPB_Rifles_MX_Black","A3_Weapons_F_gamma","A3_Weapons_F_Gamma_Ammoboxes","A3_Weapons_F_Pistols_PDW2000","A3_Characters_F","A3_Characters_F_BLUFOR","A3_Characters_F_Civil","A3_Characters_F_Heads",
"A3_Characters_F_OPFOR","A3_Characters_F_Proxies","A3_Characters_F_Beta","A3_Characters_F_INDEP","A3_Characters_F_EPB_Heads","A3_Characters_F_Gamma","A3_Data_F_Curator","A3_Data_F_Curator_Eagle","A3_Data_F_Curator_Intel",
"A3_Data_F_Curator_Misc","A3_Data_F_Curator_Respawn","A3_UAV_F_Characters_F_Gamma","A3_UAV_F_Weapons_F_Gamma_Ammoboxes","A3_Weapons_F_gamma_Items","A3_Map_Altis","A3_Map_Altis_Scenes","A3_Missions_F","A3_Missions_F_Beta",
"A3_Missions_F_Gamma","A3_Modules_F_Curator","A3_Modules_F_Curator_Animals","A3_Modules_F_Curator_CAS","A3_Modules_F_Curator_Curator","A3_Modules_F_Curator_Effects","A3_Modules_F_Curator_Environment","A3_Modules_F_Curator_Flares",
"A3_Modules_F_Curator_Intel","A3_Modules_F_Curator_Lightning","A3_Modules_F_Curator_Mines","A3_Modules_F_Curator_Misc","A3_Modules_F_Curator_Multiplayer","A3_Modules_F_Curator_Objectives","A3_Modules_F_Curator_Ordnance",
"A3_Modules_F_Curator_Respawn","A3_Modules_F_Curator_Smokeshells","A3_Static_F","A3_Static_F_Mortar_01","A3_Static_F_Beta_Mortar_01","A3_Static_F_Gamma","A3_Static_F_Gamma_AA","A3_Static_F_Gamma_AT","A3_Static_F_Gamma_Mortar_01",
"A3_Weapons_F_Acc","A3_Weapons_F_Beta_Acc","A3_Weapons_F_EPA","A3_Weapons_F_EPA_Acc","A3_Weapons_F_EPA_Ammoboxes","A3_Weapons_F_EPB","A3_Weapons_F_EPB_Acc","A3_Weapons_F_EPB_Ammoboxes","A3_Weapons_F_EPC","A3_Weapons_F_gamma_Acc",
"A3_Air_F","A3_Air_F_Heli_Light_01","A3_Air_F_Heli_Light_02","A3_Air_F_Beta","A3_Air_F_Beta_Heli_Attack_01","A3_Air_F_Beta_Heli_Attack_02","A3_Air_F_Beta_Heli_Transport_01","A3_Air_F_Beta_Heli_Transport_02","A3_Air_F_Beta_Parachute_01",
"A3_Air_F_Beta_Parachute_02","A3_Air_F_EPB_Heli_Light_03","A3_Air_F_EPC_Plane_CAS_01","A3_Air_F_EPC_Plane_CAS_02","A3_Air_F_Gamma_Plane_Fighter_03","A3_Armor_F","A3_armor_f_beta","A3_Armor_F_Panther","A3_armor_f_beta_APC_Tracked_02",
"A3_Armor_F_EPB_APC_tracked_03","A3_Armor_F_EPB_MBT_03","A3_Armor_F_Slammer","A3_Armor_F_T100K","A3_Boat_F","A3_Boat_F_Boat_Armed_01","A3_Boat_F_Boat_Transport_01","A3_Boat_F_Beta_Boat_Armed_01","A3_Boat_F_Beta_Boat_Transport_01",
"A3_Boat_F_SDV_01","A3_Boat_F_EPC_Submarine_01_F","A3_Boat_F_Civilian_Boat","A3_Boat_F_Trawler","A3_Boat_F_Gamma_Boat_Transport_01","A3_Characters_F_Common","A3_Characters_F_EPA","A3_Characters_F_EPB","A3_Characters_F_EPC",
"A3_Data_F_Curator_Characters","A3_Data_F_Curator_Virtual","A3_Air_F_Gamma_UAV_01","A3_Air_F_Gamma_UAV_02","A3_Missions_F_EPA","A3_Missions_F_EPB","A3_Missions_F_EPC","A3_Modules_F_Curator_Chemlights","A3_Soft_F","A3_Soft_F_MRAP_01",
"A3_Soft_F_MRAP_02","A3_Soft_F_Offroad_01","A3_Soft_F_Quadbike","A3_Soft_F_MRAP_03","A3_Soft_F_Beta_Quadbike","A3_Soft_F_HEMTT","A3_Soft_F_TruckHeavy","A3_Soft_F_EPC_Truck_03","A3_Soft_F_Car","A3_Soft_F_Gamma_Offroad",
"A3_Soft_F_Gamma_Quadbike","A3_Soft_F_SUV","A3_Soft_F_Gamma_HEMTT","A3_Soft_F_Gamma_TruckHeavy","A3_Soft_F_Truck","A3_Structures_F_Wrecks","A3_Structures_F_EPA_Mil_Scrapyard","A3_Air_F_EPC_Plane_Fighter_03",
"A3_Armor_F_AMV","A3_Armor_F_Marid","A3_Armor_F_EPC_MBT_01","A3_Armor_F_APC_Wheeled_03","A3_CargoPoses_F","A3_Soft_F_Crusher_UGV","A3_Missions_F_Curator","A3_Data_F_Kart_ParticleEffects","A3_Language_F_Kart",
"A3_LanguageMissions_F_Kart","A3_Structures_F_Kart_Civ_SportsGrounds","A3_Structures_F_Kart_Mil_Flags","A3_Anims_F_Kart","A3_Structures_F_Kart_Signs_Companies","A3_UI_F_Kart",
"A3_Weapons_F_Kart_Pistols_Pistol_Signal_F","A3_Data_F_Kart","A3_Missions_F_Kart","A3_Modules_F_Kart","A3_Modules_F_Kart_TimeTrials","A3_Weapons_F_Kart","A3_Characters_F_Kart","A3_Soft_F_Kart_Kart_01",
"A3_Structures_F_Civ_Graffiti","A3_Structures_F_Civ_Kiosks","A3_Structures_F_Civ_Tourism","A3_Structures_F_Items_Medical","A3_Structures_F_Items_Military","A3_Structures_F_Naval_Fishing","A3_Structures_F_Signs_Companies","A3_Structures_F_Mil_Scrapyard",
"A3_Soft_F_Bootcamp_Truck","A3_Soft_F_Bootcamp_Quadbike","A3_Soft_F_Bootcamp_Offroad_01","A3_Weapons_F_Bootcamp","A3_Modules_F_Bootcamp_Misc","A3_Modules_F_Bootcamp","A3_Characters_F_Bootcamp_Common","A3_Weapons_F_Bootcamp_Ammoboxes","A3_UI_F_Bootcamp",
"A3_Characters_F_Bootcamp","A3_Weapons_F_Bootcamp_LongRangeRifles_M320","A3_Weapons_F_Bootcamp_LongRangeRifles_GM6","A3_Structures_F_Bootcamp_Items_Food","A3_Structures_F_Bootcamp_Items_Electronics","A3_Structures_F_Bootcamp_Civ_SportsGrounds",
"A3_Structures_F_Bootcamp_Civ_Camping","A3_Language_F_Bootcamp","A3_Functions_F_Bootcamp","A3_Structures_F_Bootcamp_VR_Helpers","A3_Structures_F_Bootcamp_VR_CoverObjects","A3_Structures_F_Bootcamp_VR_Blocks","A3_Structures_F_Bootcamp_Training",
"A3_Structures_F_Bootcamp_System","A3_Structures_F_Bootcamp_Items_Sport","A3_Structures_F_Bootcamp_Ind_Cargo","A3_Sounds_F_Bootcamp","A3_Data_F_Bootcamp","A3_Map_VR_Scenes","A3_Missions_F_Bootcamp","A3_Music_F_Bootcamp","Map_VR","A3Data",
"A3_Data_F_Hook",
// "sab_UN","PG_Services_PMC_UNITS","pg_services_pmc_client","PG_Services_PMC_Bags","PG_Services_PMC_CLIENT","PG_Services_PMC_Gear","PG_SERVICES_PMC_UNDERWEAR","PG_SERVICES_PMC_UNIFORMS","PG_Services_PMC_Goggles","PG_Services_PMC_Ammoboxes",
"PG_Services_PMC_UNITS","PG_Services_PMC_Bags","PG_Services_PMC_CLIENT","PG_Services_PMC_Gear","PG_SERVICES_PMC_UNDERWEAR","PG_SERVICES_PMC_UNIFORMS","PG_Services_PMC_Goggles","PG_Services_PMC_Ammoboxes","PG_Services_PMC_vehicles","PMC_Items","pmc_weapons","PG_Services_PMC_Patches",
"gign_shield","gign","RPIMA",
"Bravo93_Balaclava","Bravo93_IRA_Soldier4","Bravo93_IRA_Soldier1","Bravo93_IRA_Soldier3","Bravo93_IRA_Soldier2","Bravo93_IRA_Soldier5","Bravo93_IRA_Soldier6","Bravo93_IRA_Soldier7","Bravo93_IRA_Soldier8",
"Bravo93_UVF_Soldier1","Bravo93_UVF_Soldier2","Bravo93_UVF_Soldier3","Bravo93_UVF_Soldier4","Bravo93_UVF_Soldier5","Bravo93_UVF_Soldier6","Bravo93_UVF_Soldier7","Bravo93_UVF_Soldier8",
// "arc_units","ARC_Units",
"caf_ag_faction_afr_p","caf_ag_vehicles_afr_p","caf_ag_vehicles_eeur_r","caf_ag_vehicles_me_t","caf_ag_equip","caf_ag_equip_c","caf_ag_equip_afr_backpack","caf_ag_africa_equip_h","caf_ag_equip_afr_clothes_01","caf_ag_equip_afr_clothes_02","caf_ag_equip_me_backpack","caf_ag_eeur_equip_h_beanie","caf_ag_eeur_equip_h_boonie","caf_ag_eeur_equip_h_furhat","caf_ag_equip_EEUR_fatigues_01","caf_ag_equip_EEUR_fatigues_02","caf_ag_equip_EEUR_fatigues_03","caf_ag_middleeast_equip_h",
"caf_ag_equip_me_fatigues_01","caf_ag_equip_me_robe_01","caf_ag_equip_me_robe_02","caf_ag_equip_me_robe_03","caf_ag_equip_me_robe_04","caf_ag_equip_t","caf_ag_faction_afr","caf_ag_faction_afr_civ","caf_ag_groups_afr_p","caf_ag_afr_p_mtr","caf_ag_faction_eur","caf_ag_faction_eeur_r","caf_ag_groups_eeur_r","caf_ag_eeur_r_mtr","caf_ag_faction_me","caf_ag_faction_me_civ","caf_ag_faction_me_t","caf_ag_groups_me_t","caf_ag_me_t_mtr","caf_ag_vehicles_T55","caf_wp_weapons_c","caf_wp_weapons_ak47","caf_wp_weapons_ak74","caf_wp_weapons_pkm","caf_wp_weapons_rpg","caf_wp_weapons_rpk","caf_wp_weapons_strela","caf_wp_weapons_svd","caf_wp_weapons_s","caf_wp_weapons_T","caf_wp_weapons",
"altisrpfr","GNT_C185","rds_A2_Civilians","cba_xeh","Extended_EventHandlers","CBA_Extended_EventHandlers","cba_common","cba_events","cba_hashes","cba_network","cba_strings","cba_vectors",
"SakuWeaponShake","task_force_radio_items","cba_ai","cba_arrays","cba_diagnostic","cba_help","cba_keybinding","cba_ui","cba_ui_helper","cba_versioning",
"HK430_M4benelli","Unlocked_Uniforms","cba_main","cba_main_a3","PLP_truckColors","task_force_radio","cba_xeh_a3","rds_A2_Civilians_c",
"JSRS2_120mm_Cannon","JSRS2_127","JSRS2_155mm_AMOS","JSRS_Environment","JSRS2_Gau8","DragonFyre_Titan","JSRS2_CAS_Plane1","JSRS2_CAS_Plane2",
"JSRS2_230mm_Titan","JSRS2_30mm_Cannon","JSRS2_35mm_Autocannon","JSRS2_4Five45","JSRS2_ACPC","JSRS2_Autocannon","JSRS2_Bullethits","JSRS2_DAGR","JSRS2_DAR","JSRS2_EBR","JSRS2_Explosions","JSRS2_Explosives","JSRS2_Filters","JSRS2_FS2000",
"JSRS2_Gatling","JSRS2_GMG20","JSRS2_GMG40","JSRS2_Khaybar","JSRS2_LMGRCWS","JSRS2_M134","JSRS2_M200","JSRS2_M320R","JSRS2_M6","JSRS2_Minigun","JSRS2_MX","JSRS2_NLAW","JSRS2_P07","JSRS2_PDW","JSRS2_Rahim","JSRS2_Rook40","JSRS2_RPG32",
"JSRS2_Scorpian","JSRS2_SDAR","JSRS2_Skalpel_ATGM","JSRS2_Skyfire","JSRS2_Sonic_Cracks","JSRS2_Titan","JSRS2_TRG20","JSRS2_Vector","JSRS2_Veh_Titan","JSRS2_Zafir","JSRS2_Zubr45","Blastcore_VEP","cba_ai","cba_arrays","cba_diagnostic","cba_help",
"cba_ui_helper","cba_versioning","JSRS2_Movement","JSRS2_Silencers","cba_main","cba_main_a3","JSRS2_2S9_Sorcher","JSRS2_AFV4_Gorgon","JSRS2_AH99_Blackfoot","JSRS2_AH9_Pawnee","JSRS2_AMV7_Marshal","JSRS2_BTRK_Kamysh","JSRS2_CH49_Mohawk","JSRS2_Distance",
"JSRS2_FighterPlane3","JSRS2_FV720_Mora","JSRS2_Hunter","JSRS2_Ifrit","JSRS2_IFV6a_Cheetah","JSRS2_IFV6c_Panther","JSRS2_M2A1_Slammer","JSRS2_M4_Scorcher","JSRS2_M5_Sandstorm","JSRS2_MBT52_Kuma","JSRS2_Mi48_Kajman","JSRS2_MSE3_Marid","JSRS2_Offroad",
"JSRS2_Po30_Orca","JSRS2_Strider","JSRS2_SUV","JSRS2_T100_Varsuk","JSRS2_Truck1","JSRS2_Truck2","JSRS2_UAV_1","JSRS2_UH80_GhostHawk","JSRS2_Van","JSRS2_WY55_Hellcat","JSRS2_ZSU39_Tigris","rds_a2port_cman",
"A3_Functions_F_Heli","A3_Language_F_Heli","A3_Modules_F_Heli","A3_Modules_F_Heli_SpawnAi","A3_Music_F_Heli","A3_Structures_F_Heli_Civ_Accessories","A3_Structures_F_Heli_Civ_Constructions","A3_Structures_F_Heli_Civ_Garbage","A3_Structures_F_Heli_Civ_Market","A3_Structures_F_Heli_Furniture","A3_Structures_F_Heli_Ind_AirPort","A3_Structures_F_Heli_Ind_Cargo","A3_Structures_F_Heli_Ind_Machines","A3_Structures_F_Heli_Items_Airport","A3_Structures_F_Heli_Items_Luggage","A3_Structures_F_Heli_Items_Sport","A3_Structures_F_Heli_Items_Tools","A3_Structures_F_Heli_VR_Helpers","A3_Structures_F_Heli_Items_Electronics","A3_Structures_F_Heli_Items_Food","A3_Anims_F_Heli","A3_Supplies_F_Heli","A3_Supplies_F_Heli_Bladders","A3_Supplies_F_Heli_CargoNets","A3_Supplies_F_Heli_Fuel","A3_Supplies_F_Heli_Slingload","A3_Air_F_RTD","A3_Boat_F_Heli_Boat_Armed_01","A3_Boat_F_Heli_SDV_01","A3_Data_F_Heli","A3_Missions_F_Heli","A3_Soft_F_Heli_Car","A3_Soft_F_Heli_MRAP_01","A3_Soft_F_Heli_MRAP_02","A3_Soft_F_Heli_MRAP_03","A3_Soft_F_Heli_Quadbike","A3_Soft_F_Heli_SUV","A3_Soft_F_Heli_Truck","A3_UI_F_Heli","A3_Air_F_Heli","A3_Air_F_Heli_Heli_Attack_01","A3_Air_F_Heli_Heli_Attack_02","A3_Air_F_Heli_Heli_Light_01","A3_Air_F_Heli_Heli_Light_02","A3_Air_F_Heli_Heli_Light_03","A3_Air_F_Heli_Heli_Transport_01","A3_Air_F_Heli_Heli_Transport_02","A3_Air_F_Heli_Heli_Transport_03","A3_Air_F_Heli_Heli_Transport_04","A3_CargoPoses_F_Heli","A3_Soft_F_Heli_Crusher_UGV",
"LandRover","bwi_a3_t6","PansyLandRovers","PansyLandRovers","FANTASMA_Units","LT_Characters_S","Medic_uniform_config","giletpolo_uniform_config","blackHunter_uniform_config","LT_Characters_Male_S","Shemaghs","m50gasmask","gasmask",
"FEMAL3","FEMAL3_Heads","FEMAL3_CustomModels","FEMAL3_Uniforms","FEMAL3_UnitInfo",
"asdg_jointrails",
"DragonFyre_Bullethits","DragonFyre_Explosions","DragonFyre_Sonic_Cracks","DragonFyre_230mm_Titan","DragonFyre_Air_Weapons","DragonFyre_35mm_Autocannon","DragonFyre_120mm_Cannon","DragonFyre_Autocannon","DragonFyre_DAGR","DragonFyre_DAR","DragonFyre_Minigun","DragonFyre_30mm_Cannon","DragonFyre_Gau8","DragonFyre_155mm_AMOS","DragonFyre_M134","DragonFyre_LMGRCWS","DragonFyre_GMG20","DragonFyre_GMG40","DragonFyre_127","DragonFyre_Skalpel_ATGM","DragonFyre_Skyfire","DragonFyre_Veh_Titan","DragonFyre_4Five45","DragonFyre_ACPC","DragonFyre_MX","DragonFyre_M6","DragonFyre_Khaybar","DragonFyre_M320R","DragonFyre_EBR","DragonFyre_FS2000","DragonFyre_M200","DragonFyre_P07","DragonFyre_NLAW","DragonFyre_PDW","DragonFyre_Rahim","DragonFyre_Rook40","DragonFyre_RPG32","DragonFyre_Scorpian","DragonFyre_TRG20","DragonFyre_UGL","DragonFyre_SDAR","DragonFyre_Vector","DragonFyre_Zafir","DragonFyre_Zubr45","DragonFyre_Movement","DragonFyre_Distance","DragonFyre_FighterPlane3","DragonFyre_CAS_Plane1","DragonFyre_AH99_Blackfoot","DragonFyre_AH9_Pawnee","DragonFyre_UAV_1","DragonFyre_CH67_Huron","DragonFyre_CH49_Mohawk","DragonFyre_Mi290_Taru","DragonFyre_Mi48_Kajman","DragonFyre_UAV_2","DragonFyre_Po30_Orca","DragonFyre_CAS_Plane2","DragonFyre_UH80_GhostHawk","DragonFyre_WY55_Hellcat","DragonFyre_Boat_Armed_1","DragonFyre_2S9_Sorcher","DragonFyre_AFV4_Gorgon","DragonFyre_AMV7_Marshal","DragonFyre_BTRK_Kamysh","DragonFyre_FV720_Mora","DragonFyre_IFV6a_Cheetah","DragonFyre_IFV6c_Panther","DragonFyre_M2A1_Slammer","DragonFyre_M4_Scorcher","DragonFyre_M5_Sandstorm","DragonFyre_MBT52_Kuma","DragonFyre_MSE3_Marid","DragonFyre_T100_Varsuk","DragonFyre_ZSU39_Tigris","DragonFyre_Hatchback","DragonFyre_truck1","DragonFyre_Hunter","DragonFyre_Ifrit","DragonFyre_Offroad","DragonFyre_Quadbike","DragonFyre_Strider","DragonFyre_SUV","DragonFyre_truck2","DragonFyre_Van","DragonFyre_Truck3",
"CBS_Movements_Of_Combat_Actions_Pro","MOCAP_Code","L_Immerse","D41_TrawlerCfg","Burnes_MK10_Patch","sab_An2","msc_cfg","ASCZ_Heads","sab_Camel",
"bzly_mantrucks","UU_rds_a2port_cman",
"ice_apo_seekers","Trixie_Rifles","asdg_jointrails_r3f","DDOPP_taserPack","SMD_ASSETS_US",
"r3f_armes","rhs_c_radio","rhs_s_radio","rhs_main","RHS_Missions_Pack","rhs_optics","rhsusf_c_uav","rhsusf_main","rhsusf_marks_fix","rhsusf_optics","rhsusf_radio","rhsusf_uav","r3f_acc","r3f_armes_c","rhs_c_heavyweapons","rhs_c_radars","rhs_c_weapons","rhs_decals","rhs_heavyweapons","rhs_radars","rhs_sounds","rhs_weapons","rhs_weapons2","rhsusf_a2port_car","rhsusf_c_a2port_car","rhsusf_c_weapons","rhsusf_decals","rhsusf_weapons","rhs_c_cars","rhs_c_troops","rhs_infantry","rhs_tigr","rhsusf_c_fmtv","rhsusf_c_HEMTT_A2","rhsusf_c_rg33","rhsusf_c_troops","rhsusf_fmtv","rhsusf_hemtt_a2","rhsusf_infantry","rhsusf_rg33","rhs_c_2s3","rhs_c_a2port_air","RHS_A2_AirImport","rhs_c_a2port_car","RHS_A2_CarsImport","rhs_c_a3retex","rhs_c_bmd","rhs_c_bmp3","rhs_c_bmp","rhs_c_btr","rhs_c_rva","rhs_c_sprut","rhs_c_t72","rhs_c_tanks","rhs_c_trucks","rhs_gaz66","rhs_sprut","rhs_ss21","rhs_t72","rhs_t80","rhs_t80u","rhsusf_c_heavyweapons","rhsusf_vehicles","rhsusf_c_hmmwv","rhsusf_c_m109","rhsusf_c_m113","rhsusf_c_radio","rhsusf_c_m1a1","rhsusf_c_m1a2","rhsusf_heavyweapons","rhsusf_hmmwv","rhsusf_m109","rhsusf_m113","rhsusf_m1a1","rhsusf_m1a2","rhsusf_sounds","rhs_2s3","rhs_a2port_air","rhsusf_a2port_air2","rhs_a2port_car","rhs_a3retex","rhs_bmd","rhs_bmd_34","rhs_bmp3","rhs_bmp","rhs_btr70","rhs_btr80","rhs_c_a2port_armor","rhs_cti_insurgents","RHS_US_A2_AirImport","RHS_US_A2Port_Armor","rhs_a2port_armor","rhsusf_a2port_air","rhsusf_a2port_armor","rhsusf_s_radio",
"A3_Language_F_MP_Mark","A3_LanguageMissions_F_MP_Mark","A3_Data_F_Mark","A3_Functions_F_Mark","A3_Functions_F_MP_Mark","A3_Language_F_Mark","A3_Modules_F_Mark","A3_Modules_F_Mark_FiringDrills","A3_Modules_F_MP_Mark","A3_Modules_F_Mark_Objectives","A3_Music_F_Mark","A3_Structures_F_Mark_Items_Military","A3_Structures_F_Mark_Items_Sport","A3_Structures_F_Mark_Mil_Flags","A3_Structures_F_Mark_Training","A3_Structures_F_Mark_VR_Helpers","A3_Structures_F_Mark_VR_Shapes","A3_Structures_F_Mark_VR_Targets","A3_Anims_F_Mark_Deployment","A3_UI_F_Mark","A3_UI_F_MP_Mark","A3_Weapons_F_Mark_LongRangeRifles_DMR_01","A3_Weapons_F_Mark_EBR","A3_Weapons_F_Mark_LongRangeRifles_GM6","A3_Weapons_F_Mark_LongRangeRifles_GM6_camo","A3_Weapons_F_Mark_LongRangeRifles_M320","A3_Weapons_F_Mark_LongRangeRifles_M320_camo","A3_Weapons_F_Mark_Machineguns_M200","A3_Weapons_F_Mark_Machineguns_Zafir","A3_Weapons_F_Mark_Rifles_Khaybar","A3_Weapons_F_Mark_Rifles_Mk20","A3_Weapons_F_Mark_Rifles_MX","A3_Weapons_F_Mark_Rifles_SDAR","A3_Weapons_F_Mark_Rifles_TRG20","A3_Characters_F_Mark","A3_Static_F_Mark_Designator_01","A3_Static_F_Mark_Designator_02","A3_Supplies_F_Mark","A3_Weapons_F_Mark_Acc","A3_Missions_F_Mark","A3_Missions_F_MP_Mark","A3_Weapons_F_Mark","A3_Weapons_F_Mark_LongRangeRifles_DMR_02","A3_Weapons_F_Mark_LongRangeRifles_DMR_03","A3_Weapons_F_Mark_LongRangeRifles_DMR_04","A3_Weapons_F_Mark_LongRangeRifles_DMR_05","A3_Weapons_F_Mark_LongRangeRifles_DMR_06","A3_Weapons_F_Mark_Machineguns_MMG_01","A3_Weapons_F_Mark_Machineguns_MMG_02",
"cba_EE","asdg_jointrails_dmr01","asdg_jointrails_dmr02","asdg_jointrails_dmr03","asdg_jointrails_dmr04","asdg_jointrails_dmr05","asdg_jointrails_dmr06","asdg_jointrails_ebr","asdg_jointrails_gm6","asdg_jointrails_lrr","asdg_jointrails_m200","asdg_jointrails_mmg01","asdg_jointrails_mmg02","asdg_jointrails_zafir","asdg_jointrails_katiba","asdg_jointrails_mk20","asdg_jointrails_mx","asdg_jointrails_tavor","asdg_jointrails_pdw2k","asdg_jointrails_kriss","asdg_jointrails_evo","cba_diagnostics_xeh_disabled",
"ffaa_ar_supercat","ffaa_ar_lcm","ffaa_data",
"xCam_EU",
"ace_main","ace_APL","ace_common","ace_difficulties","ace_flashsuppressors","ace_frag","ace_goggles","ace_grenades","ace_hitreactions","ace_interact_menu","ace_interaction","ace_inventory","ace_laser","ace_laser_selfdesignate","ace_laserpointer","ace_logistics_uavbattery","ace_logistics_wirecutter","ace_magazinerepack","ace_map","ace_maptools","ace_markers","ace_microdagr","ace_missionModules","ace_modules","ace_movement","ace_nightvision","ace_noidle","ace_noradio","ace_norearm","ace_optics","ace_optionsmenu","ace_overheating","ace_overpressure","ACE_Parachute","ace_protection","ace_ragdolls","ace_recoil","ace_reload","ace_reloadlaunchers","ace_safemode","ace_scopes","ace_smallarms","ace_thermals","ace_vector","ace_vehicles","ace_weaponselect","ace_weather","ace_winddeflection","ace_aircraft","ace_attach","ace_backpacks","ace_ballistics","ace_captives","ace_disarming","ace_dragging","ace_explosives","ace_hearing","ace_kestrel4500","ace_medical","ace_advanced_ballistics",
"ace_rhs_c_weapons_comp","ace_rhsusf_c_weapons_comp","ace_asdg_comp","kio_kio_fhat","Skyline_Mercedes_300_SEL",
"CALanguageCL3","cl3_mbikes","cl3_mod_client","cl3_sounds","cl3_vehiclefunctions","cl3_wheeled","STGI","ST_STHud","ST_STHud_Usermenu",
"rh_de","RH_de_cfg","DG_UKBAF",
"WarFXPE","Blastcore_SmokeCS","Blastcore_VEP","Blastcore_Sun",
"Specter_Armaments","Test_Character_F","Talon_UGV",
"HAFM_EC635_Config","HAFM_EC635",
"cba_enable_auto_xeh","ace_fonts","ace_dagr","ace_huntir","ace_mx2a","ace_spottingscope","ace_tripod","ace_tacticalladder","ace_ui","ace_yardage450","ace_rangecard",
"rhs_infantry2","rhs_c_identity","rhs_identity","rhsusf_c_identity","rhsusf_cars","rhsusf_weapons2",
"asdg_jointrails_xtra","plp_containers",
"asdg_jointmuzzles","asdg_jointrails_xacc","asdg_jointrails_xdmr06","asdg_jointrails_xebr","asdg_jointrails_xm200","asdg_jointrails_xmmg01","asdg_jointrails_xmmg02","asdg_jointrails_xzafir",
"ace_finger","ace_sitting","ace_slideshow",
"PG_SERVICES_PMC_UNITS","PG_SERVICES_PMC_HEADER","FEMAL3_v1","More_Heads",
"cba_jr","PG_SERVICES_PMC_HEADER_XEH","PG_Services_PMC_vehicles_XEH"
];

uiNamespace setVariable["RscDisplayRemoteMissions",displayNull]; //For Spy-Glass..
uiNamespace setVariable["RscDisplayMultiplayer",displayNull];

_binConfigPatches = configFile >> "CfgPatches";
for "_i" from 0 to count (_binConfigPatches)-1 do {
	_patchEntry = _binConfigPatches select _i;
	if(isClass _patchEntry) then {
		if(!((configName _patchEntry) in _patchList)) exitWith {
			[[profileName,steamid,(configName _patchEntry)],"SPY_fnc_cookieJar",false,false] spawn life_fnc_MP;
			[[profileName,format["Unknown Addon Patch: %1",(configName _patchEntry)]],"SPY_fnc_notifyAdmins",true,false] spawn life_fnc_MP;
			sleep 0.5;
			failMission "SpyGlass";
		};
	};
};

//Check for copy-pasters of Dev-Con styled execution.
//Because I am nice, add these to the following below to allow CBA; "CBA_CREDITS_CONT_C","CBA_CREDITS_M_P
private["_children","_allowedChildren"];
_children = [configFile >> "RscDisplayMPInterrupt" >> "controls",0] call BIS_fnc_returnChildren;
_allowedChildren = [
"Title","MissionTitle","DifficultyTitle","PlayersName","ButtonCancel","ButtonSAVE","ButtonSkip","ButtonRespawn","ButtonOptions",
"ButtonVideo","ButtonAudio","ButtonControls","ButtonGame","ButtonTutorialHints","ButtonAbort","DebugConsole","Feedback","MessageBox","Version","TraffLight","CBA_CREDITS_CONT_C","CBA_CREDITS_M_P","ACE_Open_settingsMenu_Btn","RHS_Options"
];

{
	if(!((configName _x) in _allowedChildren)) exitWith {
		diag_log["SPYGLASS allowedChildren %1",configName _x];
		[[profileName,steamid,"Modified_MPInterrupt"],"SPY_fnc_cookieJar",false,false] spawn life_fnc_MP;
		[[profileName,"Devcon like executor detected"],"SPY_fnc_notifyAdmins",true,false] spawn life_fnc_MP;
		sleep 0.5;
		failMission "SpyGlass";
	};
} foreach _children;

/*
	Display Validator
	Loops through and makes sure none of the displays were modified..
	
	TODO: Run check every x minutes and validate all displays.
*/
{
	_onLoad = getText(configFile >> (_x select 0) >> "onLoad");
	_onUnload = getText(configFile >> (_x select 0) >> "onUnload");
	if(_onLoad != (_x select 1) OR _onUnload != (_x select 2)) exitWith {
		[[profileName,steamid,format["Modified_Method_%1",_x select 0]],"SPY_fnc_cookieJar",false,false] call life_fnc_MP;
		[[profileName,format["Modified Display Method %1 (Memory Edit)",_x select 0]],"SPY_fnc_notifyAdmins",true,false] call life_fnc_MP;
		sleep 0.5;
		vehicle player setVelocity[1e10,1e14,1e18]; //It's a surprise.
		sleep 3;
		preProcessFile "SpyGlass\endoftheline.sqf";
		sleep 2.5;
		failMission "SpyGlass";
	};
}
foreach [
	//["RscDisplayMainMap","[""onLoad"",_this,""RscDiary"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDiary"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')"],
	//["RscDisplayGetReady","[""onLoad"",_this,""RscDiary"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDiary"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')"],
	//["RscDisplayInventory","[""onLoad"",_this,""RscDisplayInventory"",'IGUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayInventory"",'IGUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')"],
	["RscDisplayLoadMission","[""onLoad"",_this,""RscDisplayLoading"",'Loading'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayLoading"",'Loading'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')"],
	["RscDisplayInterrupt","[""onLoad"",_this,""RscDisplayInterrupt"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayInterrupt"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')"],
	["RscDisplayOptionsVideo","[""onLoad"",_this,""RscDisplayOptionsVideo"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayOptionsVideo"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')"],
	["RscDisplayOptions","[""onLoad"",_this,""RscDisplayOptions"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayOptions"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')"],
	["RscDisplayAVTerminal","[""onLoad"",_this,""RscDisplayAVTerminal"",'IGUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayAVTerminal"",'IGUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')"],
	["RscDisplayConfigureAction","[""onLoad"",_this,""RscDisplayConfigureAction"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayConfigureAction"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')"],
	["RscDisplayConfigureControllers","[""onLoad"",_this,""RscDisplayConfigureControllers"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayConfigureControllers"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')"],
	["RscDisplayControlSchemes","[""onLoad"",_this,""RscDisplayControlSchemes"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayControlSchemes"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')"],
	["RscDisplayCustomizeController","[""onLoad"",_this,""RscDisplayCustomizeController"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayCustomizeController"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')"],
	["RscDisplayDebriefing","[""onLoad"",_this,""RscDisplayDebriefing"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayDebriefing"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')"],
	//["RscDisplayDiary","[""onLoad"",_this,""RscDiary"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDiary"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')"],
	["RscDisplayGameOptions","[""onLoad"",_this,""RscDisplayGameOptions"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayGameOptions"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')"],
	["RscDisplayJoystickSchemes","[""onLoad"",_this,""RscDisplayJoystickSchemes"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayJoystickSchemes"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')"],
	["RscDisplayLoading","[""onLoad"",_this,""RscDisplayLoading"",'Loading'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayLoading"",'Loading'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')"],
	["RscDisplayMicSensitivityOptions","[""onLoad"",_this,""RscDisplayMicSensitivityOptions"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayMicSensitivityOptions"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')"],
	["RscDisplayOptionsAudio","[""onLoad"",_this,""RscDisplayOptionsAudio"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayOptionsAudio"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')"],
	["RscDisplayOptionsLayout","[""onLoad"",_this,""RscDisplayOptionsLayout"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayOptionsLayout"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')"],
	["RscDisplayStart","[2] call compile preprocessfilelinenumbers gettext (configfile >> 'CfgFunctions' >> 'init'); ['onLoad',_this,'RscDisplayLoading','Loading'] call (uinamespace getvariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayLoading"",'Loading'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')"]
	//["RscDisplayVehicleMsgBox","[""onLoad"",_this,""RscDisplayVehicleMsgBox"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayVehicleMsgBox"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')"]
	// ["RscDisplayInsertMarker","[""onLoad"",_this,""RscDisplayInsertMarker"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')","[""onUnload"",_this,""RscDisplayInsertMarker"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')"] 
];

[] execVM "SpyGlass\fn_cmdMenuCheck.sqf";
[] execVM "SpyGlass\fn_variableCheck.sqf";
[] execVM "SpyGlass\fn_menuCheck.sqf";