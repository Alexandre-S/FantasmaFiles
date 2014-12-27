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
life_respawn_timer = 5; //Scaled in minutes
life_knockout = false;
life_interrupted = false;
life_respawned = false;
life_removeWanted = false;
life_action_gathering = false;
life_handcuffs = ObjNull;
life_handcuffkeys = ObjNull;
//Channel 7
life_channel_send = true;

life_isblacklisted = false;
life_factnumber = 0;
life_reblevel = 0;
life_fatigue = 0.6; //Set the max fatigue
life_is_alive = false;
life_smartphoneTarget = ObjNull;

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
life_my_gang = ObjNull;

life_vehicles = [];
bank_robber = [];
switch (playerSide) do
{
	case west: 
	{
		life_atmcash = 7000; //Starting Bank Money
		life_paycheck = 500; //Paycheck Amount
	};
	case civilian: 
	{
		life_atmcash = 5000; //Starting Bank Money
		life_paycheck = 350; //Paycheck Amount
	};
	
	case independent: {
		life_atmcash = 7000;
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
	"life_inv_handcuffs",
	"life_inv_handcuffkeys",
	"life_inv_oilu",
	"life_inv_oilp",
	"life_inv_heroinu",
	"life_inv_heroinp",
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
	"life_inv_storagebig"
];

//Setup variable inv vars.
{missionNamespace setVariable[_x,0];} foreach life_inv_items;
//Licenses [license var, civ/cop]
life_licenses =
[
	["license_cop_air","cop"],
	["license_cop_swat","cop"],
	["license_cop_cg","cop"],
	["license_cop_infanterie","cop"],
	["license_cop_snipe","cop"],
	["license_cop_grenadier","cop"],
	["license_cop_piloteauto","cop"],
	["license_cop_onumecano","cop"],
	["license_cop_onumedic","cop"],
	["license_civ_driver","civ"],
	["license_civ_air","civ"],
	["license_civ_heroin","civ"],
	["license_civ_marijuana","civ"],
	["license_civ_gang","civ"],
	["license_civ_boat","civ"],
	["license_civ_oil","civ"],
	["license_civ_dive","civ"],
	["license_civ_truck","civ"],
	["license_civ_gun","civ"],
	["license_civ_rebel","civ"],
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
	["license_civ_vigil","civ"]
];

//Setup License Variables
{missionNamespace setVariable[(_x select 0),false];} foreach life_licenses;

life_dp_points = ["dp_1","dp_2","dp_3","dp_4","dp_5","dp_6","dp_7","dp_8","dp_9","dp_10","dp_11","dp_12","dp_13","dp_14","dp_15","dp_15","dp_16","dp_17","dp_18","dp_19","dp_20","dp_21","dp_22","dp_23","dp_24","dp_25"];
//[shortVar,reward]
life_illegal_items = [["handcuffs",200],["handcuffkeys",100],["heroinu",1850],["heroinp",3500],["cocaine",3000],["cocainep",4500],["marijuana",2650],["cannabis",2000],["turtle",2750],["blastingcharge",35000],["boltcutter",7500]];


/*
	Sell / buy arrays
*/
sell_array = 
[
	["apple",50],
	["heroinu",1850],
	["heroinp",3500],
	["salema",45],
	["ornate",40],
	["mackerel",175],
	["tuna",700],
	["mullet",250],
	["catshark",300],
	["rabbit",0],
	["oilp",2600],
	["turtle",2750],
	["water",0],
	["coffee",0],
	["turtlesoup",1000],
	["donuts",0],
	["marijuana",2650],
	["tbacon",0],
	["lockpick",75],
	["pickaxe",750],
	["redgull",0],
	["peach",55],
	["cocaine",3000],
	["cocainep",4500],
	["diamond",750],
	["diamondc",2600],
	["iron_r",2300],
	["copper_r",1500],
	["salt_r",1550],
	["glass",1450],
	["fuelF",0],
	["spikeStrip",0],
	["cement",1950],
	["goldbar",95000],
	["handcuffs",200],
	["handcuffkeys",100],
	["defusekit",0]
];
__CONST__(sell_array,sell_array);

buy_array = 
[
	["handcuffs",500],
	["handcuffkeys",300],
	["apple",65],
	["rabbit",75],
	["salema",55],
	["ornate",50],
	["mackerel",200],
	["tuna",900],
	["mullet",300],
	["catshark",350],
	["water",10],
	["turtle",4000],
	["turtlesoup",2500],
	["donuts",0],
	["coffee",0],
	["tbacon",75],
	["lockpick",150],
	["pickaxe",1200],
	["redgull",1500],
	["fuelF",850],
	["peach",68],
	["spikeStrip",0],
	["blastingcharge",35000],
	["boltcutter",7500],
	["defusekit",0],
	["storagesmall",75000],
	["storagebig",150000]
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

life_garage_prices =
[
	["C_Kart_01_Blu_F",3750],
	["C_Kart_01_Fuel_F",3750],
	["C_Kart_01_Red_F",3750],
	["C_Kart_01_Vrana_F",3750],
	["B_Quadbike_01_F",625],
	["C_Hatchback_01_F",2375],
	["C_Offroad_01_F",3125],
	["BAF_Offroad_D",4375],
	["LandRover_ACR",4375],
	["ACR_LandRover_AMB",4375],
	["C_SUV_01_F",8750],
	["C_Van_01_transport_F",10000],
	["C_Van_01_box_F",15000],
	["I_Truck_02_transport_F",18750],
	["I_Truck_02_covered_F",25000],
	["B_Truck_01_transport_F",30750],
	["O_Truck_03_transport_F",25000],
	["O_Truck_03_covered_F",32500],
	["B_Truck_01_box_F",47500],
	["O_Truck_03_device_F",70500],
	["B_Heli_Light_01_F",100000],
	["C_Heli_Light_01_civil_F",100000],
	["O_Heli_Light_02_unarmed_F",200000],
	["O_Heli_Transport_04_covered_F",625000],
	["O_Heli_Transport_04_medevac_F",375000],
	["O_Heli_Transport_04_F",500000],
	["O_Heli_Transport_04_bench_F",1],
	["C_Rubberboat",1250],
	["C_Boat_Civil_01_F",5500],
	["I_Truck_02_medical_F",6250],
	["O_Truck_03_medical_F",11250],
	["B_Truck_01_medical_F",15000],
	["I_Heli_Transport_02_F",175000],
	["B_G_Offroad_01_armed_F",46875],
	["BAF_Offroad_D_HMG",46875],
	["PMC_Offroad_Transport",3750],
	["PMC_Offroad_Armed",46875],
	["PMC_MH9",81250],
	["O_MRAP_02_hmg_F",312500],
	["sab_UN_Car",1],
	["sab_UN_Offroad",1],
	["C_Hatchback_01_sport_F",5500],
	["sab_UN_Truck_O",1],
	["sab_UN_Truck_C",1],
	["sab_UN_Hunter",1],
	["sab_UN_Truck_Fuel",1],
	["sab_UN_Truck_Medi",1],
	["sab_UN_Truck_Rep",1],
	["sab_UN_Truck_Ammo",1],
	["sab_UN_Hunter_hmg",1],
	["sab_UN_Offroad_gun",1],
	["sab_UN_Strider",1],
	["sab_UN_Strider_hmg",1],
	["sab_UN_APC",1],
	["sab_UN_CRV",1],
	["sab_UN_Kuma",1],
	["sab_UN_Panther",1],
	["sab_UN_Heli",1],
	["sab_UN_Large_Heli",1],
	["I_Heli_light_03_unarmed_F",1],
	["B_Heli_Transport_01_F",1],
	["sab_UN_Heli_armed",1],
	["B_Heli_Attack_01_F",1],
	["B_Boat_Transport_01_F",1],
	["sab_UN_Boat",1],
	["sab_UN_Boat_armed",1],
	["B_SDV_01_F",1]
];
__CONST__(life_garage_prices,life_garage_prices);

life_garage_sell =
[
	["C_Kart_01_Blu_F",7500],
	["C_Kart_01_Fuel_F",7500],
	["C_Kart_01_Red_F",7500],
	["C_Kart_01_Vrana_F",7500],
	["B_Quadbike_01_F",1250],
	["C_Hatchback_01_F",4750],
	["C_Offroad_01_F",6250],
	["BAF_Offroad_D",8750],
	["LandRover_ACR",8750],
	["ACR_LandRover_AMB",8750],
	["C_SUV_01_F",17500],
	["C_Van_01_transport_F",20000],
	["C_Van_01_box_F",30000],
	["I_Truck_02_transport_F",37500],
	["I_Truck_02_covered_F",50000],
	["B_Truck_01_transport_F",137500],
	["O_Truck_03_transport_F",100000],
	["O_Truck_03_covered_F",125000],
	["B_Truck_01_box_F",175000],
	["O_Truck_03_device_F",225000],
	["B_Heli_Light_01_F",126500],
	["C_Heli_Light_01_civil_F",126500],
	["O_Heli_Light_02_unarmed_F",375000], 
	["O_Heli_Transport_04_covered_F",1250000],
	["O_Heli_Transport_04_medevac_F",750000],
	["O_Heli_Transport_04_F",1000000],
	["O_Heli_Transport_04_bench_F",1],
	["C_Rubberboat",2500],
	["C_Boat_Civil_01_F",11000],
	["I_Truck_02_medical_F",12500],
	["O_Truck_03_medical_F",22500],
	["B_Truck_01_medical_F",30000],
	["I_Heli_Transport_02_F",350000],
	["B_G_Offroad_01_armed_F",93750],
	["BAF_Offroad_D_HMG",93750],
	["PMC_Offroad_Transport",7500],
	["PMC_Offroad_Armed",93750],
	["PMC_MH9",162500],
	["O_MRAP_02_hmg_F",625000],
	["sab_UN_Car",1],
	["sab_UN_Offroad",1],
	["C_Hatchback_01_sport_F",12500],
	["sab_UN_Truck_O",1],
	["sab_UN_Truck_C",1],
	["sab_UN_Hunter",1],
	["sab_UN_Truck_Fuel",1],
	["sab_UN_Truck_Medi",1],
	["sab_UN_Truck_Rep",1],
	["sab_UN_Truck_Ammo",1],
	["sab_UN_Hunter_hmg",1],
	["sab_UN_Offroad_gun",1],
	["sab_UN_Strider",1],
	["sab_UN_Strider_hmg",1],
	["sab_UN_APC",1],
	["sab_UN_CRV",1],
	["sab_UN_Kuma",1],
	["sab_UN_Panther",1],
	["sab_UN_Heli",1],
	["sab_UN_Large_Heli",1],
	["I_Heli_light_03_unarmed_F",1],
	["B_Heli_Transport_01_F",1],
	["sab_UN_Heli_armed",1],
	["B_Heli_Attack_01_F",1],
	["B_Boat_Transport_01_F",1],
	["sab_UN_Boat",1],
	["sab_UN_Boat_armed",1],
	["B_SDV_01_F",1]
];
__CONST__(life_garage_sell,life_garage_sell);

life_assur_prices =
[
	["C_Kart_01_Blu_F",2500],
	["C_Kart_01_Fuel_F",2500],
	["C_Kart_01_Vrana_F",2500],
	["C_Kart_01_Red_F",2500],
	 
	["B_Quadbike_01_F",2500],
	["C_Hatchback_01_F",4500],
	["C_Hatchback_01_sport_F",4500],
	["C_Offroad_01_F",3000],
	["BAF_Offroad_D",3500],
	["LandRover_ACR",3500],
	["ACR_LandRover_AMB",3500],
	["C_SUV_01_F",4000], 
	 
	["C_Van_01_transport_F",10000],
	["C_Van_01_box_F",10000],
	["C_Van_01_fuel_F",10000],
	["I_Truck_02_transport_F",10000],
	["I_Truck_02_covered_F",10000],
	["I_Truck_02_box_F",10000],
	["B_Truck_01_transport_F",10000],
	["B_Truck_01_box_F", 10000], 
	["O_Truck_03_device_F", 10000],
	 
	["B_G_Offroad_01_F",10000],
	["B_G_Offroad_01_armed_F",10000],
	["BAF_Offroad_D_HMG",10000],
	["O_MRAP_02_F",10000],
	 
	["B_MRAP_01_F",10000],
	["B_MRAP_01_hmg_F",10000],
	["I_MRAP_03_F",10000],
	 
	["B_Heli_Light_01_F",10000],
	["C_Heli_Light_01_civil_F",10000], 
	["B_Heli_Attack_01_F",10000],
	["O_Heli_Light_02_unarmed_F",10000],
	["I_Heli_Transport_02_F",10000], 
	["I_Heli_light_03_unarmed_F",10000],
	["B_Heli_Transport_01_F",10000], 
	["O_Heli_Transport_04_covered_F",10000], 
	["O_Heli_Transport_04_medevac_F",10000],
	["O_Heli_Transport_04_F",10000],
	["O_Heli_Transport_04_bench_F",10000],
	
	 
	["C_Rubberboat",10000],
	["I_G_Boat_Transport_01_F",10000],
	["C_Boat_Civil_01_F",10000],
	 
	["B_Boat_Transport_01_F",10000],
	["C_Boat_Civil_01_police_F",10000],
	["B_Boat_Armed_01_minigun_F",10000],
	["B_SDV_01_F",10000]
];
__CONST__(life_assur_prices,life_assur_prices);