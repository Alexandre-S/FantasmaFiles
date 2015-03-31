#include <macro.h>
/*
	Master Life Configuration File
	This file is to setup variables for the client, there are still other configuration files in the system

*****************************
****** Backend Variables *****
*****************************
*/
life_query_time = time;
life_action_delay = time;
life_trunk_vehicle = Objnull;
life_session_completed = false;
life_garage_store = false;
life_session_tries = 0;
life_net_dropped = false;
life_hit_explosive = false;
life_siren_active = false;
life_clothing_filter = 0;
life_clothing_uniform = -1;
life_redgull_effect = time;
life_is_processing = false;
life_bail_paid = false;
life_impound_inuse = false;
life_action_inUse = false;
life_spikestrip = ObjNull;
life_respawn_timer = 3; //Scaled in minutes
life_knockout = false;
life_interrupted = false;
life_respawned = false;
life_removeWanted = false;
life_action_gathering = false;
life_handcuffs = ObjNull;
life_handcuffkeys = ObjNull;
//Channel 7
life_channel_send = true;
life_sexe = false;
life_Mask_sound = false;
life_boltcutter_uses = false;
life_maxGangAccount = 10000000;
life_animals_spawned = false;
life_animals_spawned_time = -500;
life_animals_array = [];

life_isrebel = false;
life_factnumber = 0;
life_reblevel = 0;
life_isdep = false;
// player setVariable["life_dep",false,true];
life_istaxi = false;
// player setVariable["life_taxi",false,true];
life_fatigue = 0.6; //Set the max fatigue
life_is_alive = false;
life_smartphoneTarget = ObjNull;
player setVariable ["combat_mode", 0, false];
dayz_combat = 0;
init_gang = false;
player setVariable["init_gang",false,true];

//Utiliser les drogues
life_drug_level = 0;
life_smoking = false;
life_heroin_effect = 0;
life_cocaine_effect = 0;
life_lsd_effect = 0;

life_autofps = true;
havena_targetfps = 35;
havena_mincombat = 600;
havena_minview = 300;
havena_maxview = havena_minview+700;
havena_shadow = 50;
havena_view = viewDistance;
havena_grid = 48;
havena_debug = false;
havena_debugcache = false;
uncachelist = [];

life_truckreverse_active = false;
life_truck_types = ["B_Truck_01_mover_F","B_Truck_01_box_F","B_Truck_01_ammo_F","B_Truck_01_fuel_F","B_Truck_01_medical_F","B_Truck_01_Repair_F","O_Truck_02_covered_F","O_Truck_02_transport_F","O_Truck_02_box_F","O_Truck_02_fuel_F","O_Truck_02_Ammo_F","O_Truck_02_medical_F","I_Truck_02_ammo_F","I_Truck_02_fuel_F","I_Truck_02_medical_F","I_Truck_02_box_F","C_Van_01_transport_F","C_Van_01_fuel_F","C_Van_01_box_F","C_Van_01_fuel_F","I_G_Van_01_fuel_F","I_G_Van_01_transport_F","O_Truck_02_covered_F","O_Truck_02_transport_F","O_Truck_02_box_F","O_Truck_02_fuel_F","I_G_Truck_02_Repair","I_G_Truck_02_Fuel","I_Truck_02_transport_F","I_Truck_02_covered_F","B_Truck_01_transport_F","B_Truck_01_covered_F","O_Truck_03_transport_F","O_Truck_03_covered_F","O_Truck_03_device_F","RDS_Ikarus_Civ_01"];
life_chemlist = ["Chemlight_red","Chemlight_yellow","Chemlight_green","Chemlight_blue","SmokeShell","SmokeShellRed","SmokeShellGreen","SmokeShellYellow","SmokeShellPurple","SmokeShellBlue","SmokeShellOrange","AGM_HandFlare_White","AGM_HandFlare_Red","AGM_HandFlare_Green","AGM_HandFlare_Yellow"];
life_women = ["Oakes","Tyler","Tyler_scars","Mason","Mason_camo","Mason_Rigged","Mason_scars","Smith","Cheung","Quereshi"];
// life_ver_random = ["C_Offroad_01_F","C_Hatchback_01_F","C_Hatchback_01_sport_F","C_SUV_01_F","C_Van_01_box_F","C_Van_01_transport_F"];
life_civ_weapon = ["Binocular","CUP_srifle_CZ550","CUP_srifle_LeeEnfield","CUP_hgun_Compact","CUP_hgun_Duty","CUP_hgun_Phantom","CUP_hgun_Colt1911","CUP_hgun_Makarov","CUP_hgun_PB6P9","CUP_hgun_TaurusTracker455","CUP_hgun_TaurusTracker455_gold","hgun_ACPC2_F","CUP_hgun_MicroUzi","CUP_hgun_SA61","hgun_PDW2000_F"];
//Persistent Saving
__CONST__(life_save_civ,TRUE); //Save weapons for civs?
__CONST__(life_save_yinv,TRUE); //Save Y-Inventory for players?

//Revive constant variables.
__CONST__(life_revive_cops,TRUE); //Set to false if you don't want cops to be able to revive downed players.
__CONST__(life_revive_fee,5000); //Fee for players to pay when revived.

//House Limit
__CONST__(life_houseLimit,1); //Maximum amount of houses a player can buy (TODO: Make Tiered licenses).

//Gang related stuff?
__CONST__(life_gangPrice,100000); //Price for creating a gang (They're all persistent so keep it high to avoid 345345345 gangs).
__CONST__(life_gangUpgradeBase,25000); //MASDASDASD
__CONST__(life_gangUpgradeMultipler,2.5); //BLAH

__CONST__(life_enableFatigue,true); //Enable / Disable the ARMA 3 Fatigue System

//Uniform price (0),Hat Price (1),Glasses Price (2),Vest Price (3),Backpack Price (4)
life_clothing_purchase = [-1,-1,-1,-1,-1];
/*
*****************************
****** Weight Variables *****
*****************************
*/
life_maxWeight = 24; //Identifies the max carrying weight (gets adjusted throughout game when wearing different types of clothing).
life_maxWeightT = 24; //Static variable representing the players max carrying weight on start.
life_carryWeight = 0; //Represents the players current inventory weight (MUST START AT 0).

/*
*****************************
****** Life Variables *******
*****************************
*/
life_net_dropped = false;
life_hit_explosive = false;
life_siren_active = false;
life_bank_fail = false;
life_use_atm = true;
life_is_arrested = false;
life_delivery_in_progress = false;
life_action_in_use = false;
life_thirst = 100;
life_hunger = 100;
__CONST__(life_paycheck_period,5); //Five minutes
life_cash = 0;
__CONST__(life_impound_car,350);
__CONST__(life_impound_boat,250);
__CONST__(life_impound_air,850);
life_istazed = false;
player setvariable["AGM_istazed",false,true];
life_my_gang = ObjNull;

life_vehicles = [];
bank_robber = [];
switch (playerSide) do
{
	case west: 
	{
		life_atmcash = 10000; //Starting Bank Money
		life_paycheck = 500; //Paycheck Amount
	};
	case civilian: 
	{
		life_atmcash = 10000; //Starting Bank Money
		life_paycheck = 350; //Paycheck Amount
	};
	
	case independent: {
		life_atmcash = 10000;
		life_paycheck = 1000;
	};
};

/*
	Master Array of items?
*/
life_vShop_rentalOnly = [""];
__CONST__(life_vShop_rentalOnly,life_vShop_rentalOnly); //These vehicles can never be bought and only 'rented'. Used as a balancer & money sink. If you want your server to be chaotic then fine.. Remove it..

life_inv_items = 
[
	// "life_inv_handcuffs",
	// "life_inv_handcuffkeys",
	"life_inv_oilu",
	"life_inv_oilp",
	"life_inv_heroinu",
	"life_inv_heroinp",
	"life_inv_seigle",
	"life_inv_lsd",
	"life_inv_cannabis",
	"life_inv_marijuana",
	"life_inv_apple",
	"life_inv_rabbit",
	"life_inv_salema",
	"life_inv_ornate",
	"life_inv_mackerel",
	"life_inv_tuna",
	"life_inv_mullet",
	"life_inv_catshark",
	"life_inv_turtle",
	"life_inv_fishingpoles",
	"life_inv_water",
	"life_inv_donuts",
	"life_inv_turtlesoup",
	"life_inv_coffee",
	"life_inv_fuelF",
	"life_inv_fuelE",
	"life_inv_pickaxe",
	"life_inv_copperore",
	"life_inv_ironore",
	"life_inv_ironr",
	"life_inv_copperr",
	"life_inv_sand",
	"life_inv_salt",
	"life_inv_saltr",
	"life_inv_glass",
	"life_inv_tbacon",
	"life_inv_lockpick",
	"life_inv_redgull",
	"life_inv_peach",
	"life_inv_diamond",
	"life_inv_coke",
	"life_inv_cokep",
	"life_inv_diamondr",
	"life_inv_spikeStrip",
	"life_inv_rock",
	"life_inv_cement",
	"life_inv_goldbar",
	"life_inv_blastingcharge",
	"life_inv_boltcutter",
	"life_inv_defusekit",
	"life_inv_storagesmall",
	"life_inv_storagebig",
	"life_inv_mauer",
	"life_inv_sandbag",
	"life_inv_sandbagr",
	"life_inv_cone",
	"life_inv_gpstracker",
	"life_inv_chicken",
	"life_inv_goat",
	"life_inv_sheep",
	"life_inv_dog",
	"life_inv_nitro",
	"life_inv_excavator",
	"life_inv_doubloon",
	"life_inv_silverpiece",
	"life_inv_ruby",
	"life_inv_diamondf",
	"life_inv_pearl"
];

//Setup variable inv vars.
{missionNamespace setVariable[_x,0];} foreach life_inv_items;
//Licenses [license var, civ/cop]
life_licenses =
[
	["license_cop_air","cop"],
	["license_cop_swat","cop"],
	["license_cop_cg","cop"],
	["license_cop_bacpj","cop"],
	["license_cop_medic","cop"],
	["license_civ_driver","civ"],
	["license_civ_air","civ"],
	["license_civ_heroin","civ"],
	["license_civ_lsd","civ"],
	["license_civ_marijuana","civ"],
	["license_civ_gang","civ"],
	["license_civ_boat","civ"],
	["license_civ_oil","civ"],
	["license_civ_dive","civ"],
	["license_civ_truck","civ"],
	["license_civ_gun","civ"],
	["license_civ_rebel","civ"],
	["license_civ_thug","civ"],
	["license_civ_coke","civ"],
	["license_civ_diamond","civ"],
	["license_civ_copper","civ"],
	["license_civ_iron","civ"],
	["license_civ_sand","civ"],
	["license_civ_salt","civ"],
	["license_civ_cement","civ"],
	["license_med_air","med"],
	["license_civ_home","civ"],
	["license_civ_gvt","civ"],
	["license_civ_vigil","civ"],
	["license_civ_dep","civ"],
	["license_civ_hunting","civ"],
	["license_civ_taxi","civ"]
];

//Setup License Variables
{missionNamespace setVariable[(_x select 0),false];} foreach life_licenses;

life_dp_points = ["dp_1","dp_2","dp_3","dp_4","dp_5","dp_6"];
//[shortVar,reward]
life_illegal_items =
[
	["heroinu",2225*0.7],
	["heroinp",2225],
	["cocaine",2568*0.7],
	["cocainep",2568],
	["cannabis",2152*0.7],
	["marijuana",21523],
	["seigle",2808*0.7],
	["lsd",2808],
	["turtle",1400*1.3],
	["blastingcharge",35000],
	["boltcutter",7500],
	["dog",650*1.3]
];


/*
	Sell / buy arrays
*/
sell_array = 
[
	["apple",50],
	["peach",50],
	// ["cocaine",1125],
	["cocainep",2568],
	// ["heroinu",950],
	["heroinp",2225],
	// ["seigle",1175],
	["lsd",2808],
	// ["cannabis",1025],
	["marijuana",2152],
	["salema",45*1.3],
	["ornate",40*1.3],
	["mackerel",175*1.3],
	["tuna",700*1.3],
	["mullet",250*1.3],
	["catshark",300*1.3],
	["rabbit",65],
	["oilp",1756],
	["turtle",1400*1.3],
	["water",5],
	["coffee",5],
	["turtlesoup",1000],
	["donuts",60],
	["tbacon",25],
	["lockpick",75],
	["pickaxe",400],
	["redgull",500],
	// ["diamond",500],
	["diamondc",1485],
	["iron_r",1416],
	["copper_r",1551],
	["salt_r",1192],
	["glass",1259],
	["fuelF",950],
	["spikeStrip",833],
	["cement",1605],
	["goldbar",95000],
	["defusekit",0],
	["storagesmall",280000],
	["storagebig",400000],
	["mauer",0],
	["sandbag",2000],
	["sandbagr",2000],
	["cone",0],
	["gpstracker",10000],
	["chicken",250*1.3],
	["goat",300*1.3],
	["sheep",350*1.3],
	["dog",650*1.3],
	["excavator",2600],
	["doubloon",900],
	["silverpiece",750],
	["ruby",2500],
	["diamondf",10000],
	["pearl",2000]
];
__CONST__(sell_array,sell_array);

buy_array = 
[
	["apple",150],
	["rabbit",195],
	// ["salema",135],
	// ["ornate",120],
	// ["mackerel",525],
	// ["tuna",2100],
	// ["mullet",750],
	// ["catshark",900],
	["water",15],
	// ["turtle",1200],
	["turtlesoup",3000],
	["donuts",180],
	["coffee",15],
	["tbacon",75],
	["lockpick",225],
	["pickaxe",1200],
	["redgull",1500],
	["fuelF",2850],
	["peach",150],
	["spikeStrip",2500],
	["blastingcharge",35000],
	["boltcutter",7500],
	["defusekit",0],
	["storagesmall",700000],
	["storagebig",1000000],
	["mauer",1000],
	["sandbag",5000],
	["sandbagr",5000],
	["cone",100],
	["gpstracker",50000],
	["nitro",25000],
	["excavator",5000]
];
__CONST__(buy_array,buy_array);

life_weapon_shop_array =
[
	["arifle_sdar_F",7500],
	["hgun_P07_snds_F",0],
	["hgun_P07_F",0],
	["ItemGPS",45],
	["ToolKit",75],
	["FirstAidKit",65],
	["Medikit",450],
	["NVGoggles",980],
	["16Rnd_9x21_Mag",0],
	["20Rnd_556x45_UW_mag",35],
	["ItemMap",0],
	["ItemCompass",0],
	["Chemlight_blue",50],
	["Chemlight_yellow",50],
	["Chemlight_green",50],
	["Chemlight_red",50],
	["hgun_Rook40_F",500],
	["arifle_Katiba_F",5000],
	["30Rnd_556x45_Stanag",65],
	["20Rnd_762x51_Mag",85],
	["30Rnd_65x39_caseless_green",50],
	["DemoCharge_Remote_Mag",7500],
	["SLAMDirectionalMine_Wire_Mag",2575],
	["optic_ACO_grn",250],
	["acc_flashlight",100],
	["srifle_EBR_F",15000],
	["arifle_TRG21_F",3500],
	["optic_MRCO",5000],
	["optic_Aco",850],
	["arifle_MX_F",7500],
	["arifle_MXC_F",5000],
	["arifle_MXM_F",8500],
	["MineDetector",500],
	["optic_Holosight",275],
	["acc_pointer_IR",175],
	["arifle_TRG20_F",2500],
	["SMG_01_F",1500],
	["arifle_Mk20C_F",4500],
	["30Rnd_45ACP_Mag_SMG_01",60],
	["30Rnd_9x21_Mag",30],
	["launch_RPG32_F",nil,210000],
	["RPG32_F",nil,1500],
	["srifle_GM6_F",nil,300000],
	["5Rnd_127x108_Mag",nil,1500],
	["optic_SOS",nil,1050],
	["APERSMine_Range_Mag",nil,150000],
	["APERSTripMine_Wire_Mag",nil,150000],
	["SatchelCharge_Remote_Mag",nil,210000],
	["O_HMG_01_high_weapon_F",nil,300000],
	["O_HMG_01_support_high_F",nil,2100]
];
__CONST__(life_weapon_shop_array,life_weapon_shop_array);


life_garage_sell =
[
	["C_Kart_01_Blu_F",15000*0.49],
	["C_Kart_01_Fuel_F",15000*0.49],
	["C_Kart_01_Red_F",15000*0.49],
	["C_Kart_01_Vrana_F",15000*0.49],
	
	["B_Quadbike_01_F",3500*0.49],
	["RDS_S1203_Civ_01",9800*0.49],
	["C_Hatchback_01_F",14250*0.49],
	["RDS_Lada_Civ_01",15000*0.49],
	["RDS_Gaz24_Civ_01",16000*0.49],
	["RDS_Golf4_Civ_01",41500*0.49],
	["C_Offroad_01_F",33750*0.49],
	["B_G_Offroad_01_F",33750*0.49],
	["BAF_Offroad_D",47500*0.49],
	["LandRover_ACR",47500*0.49],
	["C_SUV_01_F",52500*0.49],
	["RDS_Octavia_Civ_01",60000*0.49],
	["C_Van_01_transport_F",97500*0.49],
	
	["C_Hatchback_01_sport_F",45000*0.49],
	["C_Van_01_fuel_F",112500*0.49],
	
	//GVT
	["I_MRAP_03_F",650000*0.49],
	
	//TRUCK
	["C_Van_01_box_F",127500*0.49],
	["DAR_4x4",175500*0.49],
	["DAR_MK23",195300*0.49],
	["I_Truck_02_transport_F",202500*0.49],
	["DAR_MK27",228500*0.49],
	["I_Truck_02_covered_F",262500*0.49],
	["DAR_MK27T",288500*0.49],
	["RDS_Ikarus_Civ_01",302500*0.49],
	["DAR_LHS_8",335250*0.49],
	["O_Truck_03_transport_F",310000*0.49],
	["B_Truck_01_transport_F",375000*0.49],
	["O_Truck_03_covered_F",393750*0.49],
	["B_Truck_01_covered_F",412500*0.49],
	
	["B_Truck_01_box_F",450000*0.49],
	["DAR_LHS_16",450000*0.49],
	["O_Truck_03_device_F",450000*0.49],
	
	//AIR
	["GNT_C185",207500*0.49],
	["GNT_C185F",237500*0.49],
	//["bwi_a3_t6a_7",375000*0.49],
	["sab_camel",375000*0.49],
	["Sab_ana_An2",415000*0.49],
	["C_Heli_Light_01_civil_F",337500*0.49],
	["B_Heli_Light_01_F",337500*0.49],
	["O_Heli_Light_02_unarmed_F",675000*0.49],
	["I_Heli_Transport_02_F",750000*0.49],
	
	["O_Heli_Transport_04_F",1000000*0.49],
	
	//BOAT
	["C_Rubberboat",3750*0.49],
	["C_Boat_Civil_01_F",33000*0.49],
	["C_Boat_Civil_01_rescue_F",31500*0.49],
	["D41_Trawler",130000*0.49],
	["Burnes_MK10_1",500000*0.49],
	
	//MED
	["ACR_LandRover_AMB",33750*0.49],
	["B_Truck_01_mover_F",30000*0.49],
	["I_Truck_02_medical_F",20000*0.49],
	["O_Truck_03_medical_F",25000*0.49],
	["B_Truck_01_medical_F",30000*0.49],
	["O_Heli_Transport_04_medevac_F",150000*0.49],
	
	//REB
	["B_G_Offroad_01_armed_F",750000*0.49],
	["BAF_Offroad_D_HMG",750000*0.49],
	["PMC_Offroad_Transport",33750*0.49],
	["PMC_Offroad_Armed",750000*0.49],
	["PMC_MH9",412500*0.49],
	["O_MRAP_02_F",1000000*0.49],
	["O_MRAP_02_hmg_F",1250000*0.49],
	["O_Heli_Transport_04_covered_F",2500000*0.49],
	
	//COP
	["I_Heli_light_03_unarmed_F",1],
	["B_Heli_Transport_01_F",1],
	["B_Heli_Attack_01_F",1],
	["B_Boat_Transport_01_F",1],
	["B_SDV_01_F",1]
];
__CONST__(life_garage_sell,life_garage_sell);

//0.0735 CAR 
//0.245 HELI
life_garage_prices =
[
	["C_Kart_01_Blu_F",15000*0.0735],
	["C_Kart_01_Fuel_F",15000*0.0735],
	["C_Kart_01_Red_F",15000*0.0735],
	["C_Kart_01_Vrana_F",15000*0.0735],
	
	["B_Quadbike_01_F",3500*0.0735],
	["RDS_S1203_Civ_01",9800*0.0735],
	["C_Hatchback_01_F",14250*0.0735],
	["RDS_Lada_Civ_01",15000*0.0735],
	["RDS_Gaz24_Civ_01",16000*0.0735],
	["RDS_Golf4_Civ_01",41500*0.0735],
	["C_Offroad_01_F",33750*0.0735],
	["B_G_Offroad_01_F",33750*0.0735],
	["BAF_Offroad_D",47500*0.0735],
	["LandRover_ACR",47500*0.0735],
	["C_SUV_01_F",52500*0.0735],
	["RDS_Octavia_Civ_01",60000*0.0735],
	["C_Van_01_transport_F",97500*0.0735],
	
	["C_Hatchback_01_sport_F",45000*0.0735],
	["C_Van_01_fuel_F",112500*0.0735],
	
	//GVT
	["I_MRAP_03_F",650000*0.0735],
	
	//TRUCK
	["C_Van_01_box_F",127500*0.0735],
	["DAR_4x4",175500*0.0735],
	["DAR_MK23",195300*0.0735],
	["I_Truck_02_transport_F",202500*0.0735],
	["DAR_MK27",228500*0.0735],
	["I_Truck_02_covered_F",262500*0.0735],
	["DAR_MK27T",288500*0.0735],
	["RDS_Ikarus_Civ_01",302500*0.0735],
	["DAR_LHS_8",335250*0.0735],
	["O_Truck_03_transport_F",310000*0.0735],
	["B_Truck_01_transport_F",375000*0.0735],
	["O_Truck_03_covered_F",393750*0.0735],
	["B_Truck_01_covered_F",412500*0.0735],
	
	["B_Truck_01_box_F",450000*0.0735],
	["DAR_LHS_16",450000*0.0735],
	["O_Truck_03_device_F",450000*0.0735],
	
	//AIR
	["GNT_C185",207500*0.0735],
	["GNT_C185F",237500*0.0735],
	//["bwi_a3_t6a_7",375000*0.0735],
	["sab_camel",375000*0.0735],
	["Sab_ana_An2",415000*0.0735],
	["C_Heli_Light_01_civil_F",337500*0.245],
	["B_Heli_Light_01_F",337500*0.245],
	["O_Heli_Light_02_unarmed_F",675000*0.245],
	["I_Heli_Transport_02_F",750000*0.245],
	
	["O_Heli_Transport_04_F",1000000*0.245],
		
	//BOAT
	["C_Rubberboat",3750*0.0735],
	["C_Boat_Civil_01_F",33000*0.0735],
	["C_Boat_Civil_01_rescue_F",31500*0.0735],
	["D41_Trawler",130000*0.0735],
	["Burnes_MK10_1",500000*0.0735],
	
	//MED
	["ACR_LandRover_AMB",33750*0.0735],
	["B_Truck_01_mover_F",30000*0.0735],
	["I_Truck_02_medical_F",20000*0.0735],
	["O_Truck_03_medical_F",25000*0.0735],
	["B_Truck_01_medical_F",30000*0.0735],
	["O_Heli_Transport_04_medevac_F",150000*0.245],
	
	//REB
	["B_G_Offroad_01_armed_F",750000*0.0735],
	["BAF_Offroad_D_HMG",750000*0.0735],
	["PMC_Offroad_Transport",33750*0.0735],
	["PMC_Offroad_Armed",750000*0.0735],
	["PMC_MH9",412500*0.0735],
	["O_MRAP_02_F",1000000*0.0735],
	["O_MRAP_02_hmg_F",1250000*0.0735],
	["O_Heli_Transport_04_covered_F",2500000*0.245],
	
	//ONU
	["I_Heli_light_03_unarmed_F",1],
	["B_Heli_Transport_01_F",1],
	["B_Heli_Attack_01_F",1],
	["B_Boat_Transport_01_F",1],
	["B_SDV_01_F",1]
];
__CONST__(life_garage_prices,life_garage_prices);

life_assur_prices =
[
	["C_Kart_01_Blu_F",15000*0.5],
	["C_Kart_01_Fuel_F",15000*0.5],
	["C_Kart_01_Red_F",15000*0.5],
	["C_Kart_01_Vrana_F",15000*0.5],
	
	["B_Quadbike_01_F",3500*0.5],
	["RDS_S1203_Civ_01",9800*0.5],
	["C_Hatchback_01_F",14250*0.5],
	["RDS_Lada_Civ_01",15000*0.5],
	["RDS_Gaz24_Civ_01",16000*0.5],
	["RDS_Golf4_Civ_01",41500*0.5],
	["C_Offroad_01_F",33750*0.5],
	["B_G_Offroad_01_F",33750*0.5],
	["BAF_Offroad_D",47500*0.5],
	["LandRover_ACR",47500*0.5],
	["C_SUV_01_F",52500*0.5],
	["RDS_Octavia_Civ_01",60000*0.5],
	["C_Van_01_transport_F",97500*0.5],
	
	["C_Hatchback_01_sport_F",45000*0.5],
	["C_Van_01_fuel_F",112500*0.5],
	
	//GVT
	["I_MRAP_03_F",650000*0.5],
	
	//TRUCK
	["C_Van_01_box_F",127500*0.5],
	["DAR_4x4",175500*0.5],
	["DAR_MK23",195300*0.5],
	["I_Truck_02_transport_F",202500*0.5],
	["DAR_MK27",228500*0.5],
	["I_Truck_02_covered_F",262500*0.5],
	["DAR_MK27T",288500*0.5],
	["RDS_Ikarus_Civ_01",302500*0.5],
	["DAR_LHS_8",335250*0.5],
	["O_Truck_03_transport_F",310000*0.5],
	["B_Truck_01_transport_F",375000*0.5],
	["O_Truck_03_covered_F",393750*0.5],
	["B_Truck_01_covered_F",412500*0.5],
	
	["B_Truck_01_box_F",450000*0.5],
	["DAR_LHS_16",450000*0.5],
	["O_Truck_03_device_F",450000*0.5],
	
	//AIR
	["GNT_C185",207500*0.5],
	["GNT_C185F",237500*0.5],
	//["bwi_a3_t6a_7",375000*0.5],
	["sab_camel",375000*0.5],
	["Sab_ana_An2",415000*0.5],
	["C_Heli_Light_01_civil_F",337500*0.5],
	["B_Heli_Light_01_F",337500*0.5],
	["O_Heli_Light_02_unarmed_F",675000*0.5],
	["I_Heli_Transport_02_F",750000*0.5],
	
	["O_Heli_Transport_04_F",1000000*0.5],
		
	//BOAT
	["C_Rubberboat",3750*0.5],
	["C_Boat_Civil_01_F",33000*0.5],
	["C_Boat_Civil_01_rescue_F",31500*0.5],
	["D41_Trawler",130000*0.5],
	["D41_Trawler",500000*0.5],
	
	//MED
	["ACR_LandRover_AMB",33750*0.5],
	["B_Truck_01_mover_F",30000*0.5],
	["I_Truck_02_medical_F",20000*0.5],
	["O_Truck_03_medical_F",25000*0.5],
	["B_Truck_01_medical_F",30000*0.5],
	["O_Heli_Transport_04_medevac_F",150000*0.5],
	
	//REB
	["B_G_Offroad_01_armed_F",750000*0.5],
	["BAF_Offroad_D_HMG",750000*0.5],
	["PMC_Offroad_Transport",33750*0.5],
	["PMC_Offroad_Armed",750000*0.5],
	["PMC_MH9",412500*0.5],
	["O_MRAP_02_F",1000000*0.5],
	["O_MRAP_02_hmg_F",1250000*0.5],
	["O_Heli_Transport_04_covered_F",2500000*0.5],
	
	//ONU
	["I_Heli_light_03_unarmed_F",1],
	["B_Heli_Transport_01_F",1],
	["B_Heli_Attack_01_F",1],
	["B_Boat_Transport_01_F",1],
	["B_SDV_01_F",1]
];
__CONST__(life_assur_prices,life_assur_prices);