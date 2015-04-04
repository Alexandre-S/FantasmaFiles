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
life_truck_types = ["B_Truck_01_mover_F_RP","B_Truck_01_box_F","B_Truck_01_ammo_F","B_Truck_01_fuel_F","B_Truck_01_medical_F","B_Truck_01_Repair_F","O_Truck_02_covered_F","O_Truck_02_transport_F","O_Truck_02_box_F_RP","O_Truck_02_fuel_F","O_Truck_02_Ammo_F","O_Truck_02_medical_F","I_Truck_02_ammo_F","I_Truck_02_fuel_F","I_Truck_02_medical_F_RP","I_Truck_02_box_F","C_Van_01_transport_F","C_Van_01_fuel_F","C_Van_01_box_F","C_Van_01_fuel_F","I_G_Van_01_fuel_F","I_G_Van_01_transport_F","I_G_Truck_02_Repair","I_G_Truck_02_Fuel","I_Truck_02_transport_F","I_Truck_02_covered_F","B_Truck_01_transport_F","B_Truck_01_covered_F","O_Truck_03_transport_F","O_Truck_03_covered_F","O_Truck_03_device_F","RDS_Ikarus_Civ_01","rhs_gaz66o_vdv","rhs_gaz66_vdv","RHS_Ural_Open_Civ_01","RHS_Ural_Civ_01"];
life_chemlist = ["Chemlight_red","Chemlight_yellow","Chemlight_green","Chemlight_blue","SmokeShell","SmokeShellRed","SmokeShellGreen","SmokeShellYellow","SmokeShellPurple","SmokeShellBlue","SmokeShellOrange","AGM_HandFlare_White","AGM_HandFlare_Red","AGM_HandFlare_Green","AGM_HandFlare_Yellow"];
life_women = ["Oakes","Tyler","Tyler_scars","Mason","Mason_camo","Mason_Rigged","Mason_scars","Smith","Cheung","Quereshi"];
// life_ver_random = ["C_Offroad_01_F","C_Hatchback_01_F","C_Hatchback_01_sport_F","C_SUV_01_F","C_Van_01_box_F","C_Van_01_transport_F"];
life_civ_weapon = ["Binocular","Trixie_CZ550_Rail","Trixie_Enfield","rhs_weap_M590_8RD","rhs_weap_M590_5RD","R3F_M4S90","hgun_ACPC2_F","hgun_Rook40_F","SMG_02_F","SMG_01_F","hgun_PDW2000_F"];
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
	["marijuana",2152],
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
	["16Rnd_9x21_Mag",350*0.5],
	["30Rnd_45ACP_Mag_SMG_01",750*0.5],
	["30Rnd_9x21_Mag",950*0.5],
	["6Rnd_45ACP_Cylinder",350*0.5],
	["9Rnd_45ACP_Mag",350*0.5],
	["acc_flashlight",1000*0.5],
	["AGM_Altimeter",100*0.5],
	["AGM_CableTie",100*0.5],
	["AGM_EarBuds",25*0.5],
	["AGM_HandFlare_Green",1000*0.5],
	["AGM_HandFlare_Red",1000*0.5],
	["AGM_HandFlare_White",1000*0.5],
	["AGM_HandFlare_Yellow",1000*0.5],
	["AGM_IR_Strobe_Item",0*0.5],
	["AGM_ItemKestrel",500*0.5],
	["AGM_MapTools",500*0.5],
	["AGM_NVG_Gen1",2000*0.5],
	["AGM_NVG_Gen2",1200*0.5],
	["AGM_SpareBarrel",1000*0.5],
	["AGM_Vector",15000*0.5],
	["APERSMine_Range_Mag",70000*0.5],
	["APERSTripMine_Wire_Mag",70000*0.5],
	["Binocular",150*0.5],
	["Chemlight_blue",300*0.5],
	["Chemlight_green",300*0.5],
	["Chemlight_red",300*0.5],
	["Chemlight_yellow",300*0.5],
	["FirstAidKit",1000*0.5],
	["hgun_PDW2000_F",67500*0.5],
	["hgun_Pistol_heavy_02_F",9990*0.5],
	["hgun_Rook40_F",4900*0.5],
	["hgun_ACPC2_F",5300*0.5],
	["9Rnd_45ACP_Mag",400*0.5],
	["hgun_Pistol_heavy_01_F",5300*0.5],
	["11Rnd_45ACP_Mag",400*0.5],
	["IEDLandSmall_Remote_Mag",50000*0.5],
	["IEDUrbanSmall_Remote_Mag",50000*0.5],
	["ItemCompass",100*0.5],
	["ItemGPS",100*0.5],
	["ItemMap",100*0.5],
	["ItemWatch",100*0.5],
	["Medikit",500*0.5],
	["O_HMG_01_high_weapon_F",400000*0.5],
	["O_HMG_01_support_high_F",7000*0.5],
	["optic_Aco",3000*0.5],
	["optic_ACO_grn",3000*0.5],
	["optic_Hamr",10000*0.5],
	["optic_Holosight",3000*0.5],
	["optic_MRCO",10000*0.5],
	["R3F_10Rnd_762x51_FRF2",3000*0.5],
	["R3F_7Rnd_127x99_PGM",4000*0.5],
	["R3F_7Rnd_M4S90",450*0.5],
	["R3F_AIMPOINT",3000*0.5],
	["R3F_AIMPOINT_DES",3000*0.5],
	["R3F_EOTECH",3000*0.5],
	["R3F_EOTECH_DES",3000*0.5],
	["R3F_FRF2",250000*0.5],
	["R3F_FRF2_DES",250000*0.5],
	["R3F_M4S90",50000*0.5],
	["R3F_PGM_Hecate_II",300000*0.5],
	["R3F_PGM_Hecate_II_DES",300000*0.5],
	["rhs_100Rnd_762x54mmR",2500*0.5],
	["rhs_10Rnd_762x54mmR_7N1",3000*0.5],
	["rhs_30Rnd_545x39_AK",1000*0.5],
	["rhs_30Rnd_762x39mm",1500*0.5],
	["rhs_acc_1p63",3000*0.5],
	["rhs_acc_ekp1",3000*0.5],
	["rhs_acc_pkas",3000*0.5],
	["rhs_mag_30Rnd_556x45_Mk318_Stanag",1000*0.5],
	["rhs_mag_9x18_12_57N181S",350*0.5],
	["rhs_mag_9x19_17",350*0.5],
	["rhs_weap_ak103",140000*0.5],
	["rhs_weap_ak103_npz",140000*0.5],
	["rhs_weap_ak74m",100000*0.5],
	["rhs_weap_ak74m_2mag",100000*0.5],
	["rhs_weap_ak74m_2mag_camo",100000*0.5],
	["rhs_weap_ak74m_2mag_camo_npz",100000*0.5],
	["rhs_weap_ak74m_2mag_npz",100000*0.5],
	["rhs_weap_ak74m_camo",100000*0.5],
	["rhs_weap_ak74m_camo_npz",100000*0.5],
	["rhs_weap_ak74m_desert",100000*0.5],
	["rhs_weap_ak74m_desert_npz",100000*0.5],
	["rhs_weap_ak74m_folded",100000*0.5],
	["rhs_weap_ak74m_npz",100000*0.5],
	["rhs_weap_akm",140000*0.5],
	["rhs_weap_akms",140000*0.5],
	["rhs_weap_m14ebrri",140000*0.5],
	["rhs_weap_m16a4",100000*0.5],
	["rhs_weap_m16a4_grip",100000*0.5],
	["rhs_weap_m16a4_carryhandle",100000*0.5],
	["rhs_weap_m16a4_carryhandle_grip_pmag",100000*0.5],
	["rhs_weap_m240B",200000*0.5],
	["rhs_weap_m249_pip",180000*0.5],
	["rhs_weap_m4",100000*0.5],
	["rhs_weap_m4_grip",100000*0.5],
	["rhs_weap_m4a1_carryhandle",100000*0.5],
	["rhs_weap_M590_5RD",64000*0.5],
	["rhs_weap_M590_8RD",67000*0.5],
	["rhs_weap_makarov_pmm",4900*0.5],
	["rhs_weap_mk18",100000*0.5],
	["rhs_weap_mk18_grip2",100000*0.5],
	["rhs_weap_pkm",180000*0.5],
	["rhs_weap_pkp",200000*0.5],
	["rhs_weap_pya",4900*0.5],
	["rhs_weap_sr25",140000*0.5],
	["rhs_weap_sr25_ec",140000*0.5],
	["Trixie_FNFAL_Rail",140000*0.5],
	["rhs_weap_svdp",250000*0.5],
	["rhs_weap_svdp_npz",250000*0.5],
	["rhs_weap_svdp_wd",250000*0.5],
	["rhs_weap_svdp_wd_npz",250000*0.5],
	["rhs_weap_svds",250000*0.5],
	["rhs_weap_svds_npz",250000*0.5],
	["rhs_weap_XM2010_sa",250000*0.5],
	["rhs_weap_XM2010_wd",250000*0.5],
	["rhsusf_100Rnd_556x45_soft_pouch",2000*0.5],
	["rhsusf_100Rnd_762x51",2500*0.5],
	["rhsusf_20Rnd_762x51_m118_special_Mag",1500*0.5],
	["rhsusf_5Rnd_00Buck",350*0.5],
	["rhsusf_8Rnd_00Buck",550*0.5],
	["rhsusf_acc_compm4",3000*0.5],
	["rhsusf_acc_eotech_552",3000*0.5],
	["SatchelCharge_Remote_Mag",200000*0.5],
	["SMG_01_F",69450*0.5],
	["SMG_02_F",73450*0.5],
	["SmokeShellBlue",1000*0.5],
	["SmokeShellGreen",1000*0.5],
	["SmokeShellOrange",1000*0.5],
	["SmokeShellPurple",1000*0.5],
	["SmokeShellRed",1000*0.5],
	["tf_anprc148jem",5000*0.5],
	["ToolKit",9500*0.5],
	["Trixie_CZ550_Mag",1000*0.5],
	["Trixie_CZ550_Rail",120000*0.5],
	["Trixie_Enfield",70000*0.5],
	["Trixie_Enfield_Mag",750*0.5],
	["B_AssaultPack_blk",2500*0.5],
	["B_AssaultPack_cbr",2500*0.5],
	["B_AssaultPack_dgtl",2500*0.5],
	["B_AssaultPack_khk",2500*0.5],
	["B_AssaultPack_mcamo",2500*0.5],
	["B_AssaultPack_ocamo",2500*0.5],
	["B_AssaultPack_rgr",2500*0.5],
	["B_AssaultPack_sgg",2500*0.5],
	["B_Bergen_sgg",4500*0.5],
	["B_Carryall_cbr",6500*0.5],
	["B_Carryall_khk",6500*0.5],
	["B_Carryall_mcamo",6500*0.5],
	["B_Carryall_ocamo",6500*0.5],
	["B_Carryall_oli",6500*0.5],
	["B_Carryall_oucamo",6500*0.5],
	["B_FEM_AAF_Rolled",3000*0.5],
	["B_FEM_FIA",800*0.5],
	["B_FEM_NATO",800*0.5],
	["B_FEM_NATO_Collar",3000*0.5],
	["B_FEM_NATO_long",2000*0.5],
	["B_FEM_NATO_Rolled",3000*0.5],
	["B_FieldPack_blk",3500*0.5],
	["B_FieldPack_cbr",3500*0.5],
	["B_FieldPack_khk",3500*0.5],
	["B_FieldPack_ocamo",3500*0.5],
	["B_FieldPack_oli",3500*0.5],
	["B_FieldPack_oucamo",3500*0.5],
	["B_Kitbag_cbr",5500*0.5],
	["B_Kitbag_mcamo",5500*0.5],
	["B_Kitbag_rgr",5500*0.5],
	["B_Kitbag_sgg",5500*0.5],
	["B_Parachute",15000*0.5],
	["B_TacticalPack_blk",4500*0.5],
	["B_TacticalPack_mcamo",4500*0.5],
	["B_TacticalPack_ocamo",4500*0.5],
	["B_TacticalPack_oli",4500*0.5],
	["B_TacticalPack_rgr",4500*0.5],
	["B_Uniform_hunter_l",2000*0.5],
	["B_Uniform_survivor1_l",2250*0.5],
	["B_Uniform_survivor2_l",2250*0.5],
	["B_Uniform_survivor3_l",2250*0.5],
	["B_Uniform_worker_l",1000*0.5],
	["C_Uniform_survivor1_l",2250*0.5],
	["C_Uniform_survivor2_l",2250*0.5],
	["C_Uniform_survivor3_l",2250*0.5],
	["C_Uniform_survivor4_l",2250*0.5],
	["C_Uniform_survivor5_l",2250*0.5],
	["C_Uniform_survivor6_l",2250*0.5],
	["C_Uniform_survivor7_l",2250*0.5],
	["FANTASMA_BlackHunter",2000*0.5],
	["FANTASMA_GiletPolo",1500*0.5],
	["G_Aviator",200*0.5],
	["G_Balaclava_blk",500*0.5],
	["G_Balaclava_combat",700*0.5],
	["G_Balaclava_lowprofile",700*0.5],
	["G_Balaclava_oli",500*0.5],
	["G_Bandanna_aviator",350*0.5],
	["G_Bandanna_beast",250*0.5],
	["G_Bandanna_blk",250*0.5],
	["G_Bandanna_khk",250*0.5],
	["G_Bandanna_oli",250*0.5],
	["G_Bandanna_shades",350*0.5],
	["G_Bandanna_sport",350*0.5],
	["G_Bandanna_tan",250*0.5],
	["G_Diving",500*0.5],
	["G_Goggles_VR",250*0.5],
	["G_Lady_Blue",150*0.5],
	["G_Lady_Dark",150*0.5],
	["G_Lady_Mirror",150*0.5],
	["G_Lady_Red",150*0.5],
	["G_Lowprofile",250*0.5],
	["G_Shades_Black",100*0.5],
	["G_Shades_Blue",100*0.5],
	["G_Shades_Green",100*0.5],
	["G_Shades_Red",100*0.5],
	["G_Spectacles",200*0.5],
	["G_Spectacles_Tinted",200*0.5],
	["G_Sport_Blackred",50*0.5],
	["G_Sport_BlackWhite",50*0.5],
	["G_Sport_Blackyellow",50*0.5],
	["G_Sport_Checkered",50*0.5],
	["G_Sport_Greenblack",50*0.5],
	["G_Sport_Red",50*0.5],
	["G_Squares",100*0.5],
	["G_Squares_Tinted",100*0.5],
	["G_Uniform_hunter_l",2000*0.5],
	["G_Uniform_survivor1_l",2250*0.5],
	["G_Uniform_survivor2_l",2250*0.5],
	["G_Uniform_survivor3_l",2250*0.5],
	["G_Uniform_survivor4_l",2250*0.5],
	["G_Uniform_survivor5_l",2250*0.5],
	["G_Uniform_survivor6_l",2250*0.5],
	["G_Uniform_survivor7_l",2250*0.5],
	["G_Uniform_worker_l",1000*0.5],
	["H_ag_bandana_03",250*0.5],
	["H_ag_bandana_04",250*0.5],
	["H_ag_bandanna_01",250*0.5],
	["H_ag_bandanna_02",250*0.5],
	["H_Bandanna_blu",250*0.5],
	["H_Bandanna_camo",250*0.5],
	["H_Bandanna_cbr",250*0.5],
	["H_Bandanna_gry",250*0.5],
	["H_Bandanna_khk",250*0.5],
	["H_Bandanna_khk_hs",250*0.5],
	["H_Bandanna_mcamo",250*0.5],
	["H_Bandanna_sand",250*0.5],
	["H_Bandanna_sgg",250*0.5],
	["H_Bandanna_surfer",250*0.5],
	["H_Bandanna_surfer_blk",250*0.5],
	["H_Bandanna_surfer_grn",250*0.5],
	["H_BandMask_blk",600*0.5],
	["H_Booniehat_dgtl",700*0.5],
	["H_Booniehat_DMARPAT",700*0.5],
	["H_Booniehat_GCAMO",700*0.5],
	["H_Booniehat_khk",700*0.5],
	["H_Booniehat_khk_hs",700*0.5],
	["H_Booniehat_mcamo",700*0.5],
	["H_Booniehat_oli",700*0.5],
	["H_Booniehat_rgr",700*0.5],
	["H_Booniehat_tan",700*0.5],
	["H_caf_ag_beanie",600*0.5],
	["H_caf_ag_boonie_01",700*0.5],
	["H_caf_ag_boonie_02",700*0.5],
	["H_caf_ag_fur",700*0.5],
	["H_caf_ag_fur2",700*0.5],
	["H_caf_ag_paktol",700*0.5],
	["H_caf_ag_paktol_02",700*0.5],
	["H_caf_ag_paktol_03",700*0.5],
	["H_caf_ag_paktol_04",700*0.5],
	["H_caf_ag_turban",700*0.5],
	["H_caf_ag_wrap",1250*0.5],
	["H_Cap_blk",500*0.5],
	["H_Cap_blk_CMMG",500*0.5],
	["H_Cap_blk_ION",500*0.5],
	["H_Cap_blk_Raven",500*0.5],
	["H_Cap_blu",500*0.5],
	["H_Cap_brn_SPECOPS",500*0.5],
	["H_Cap_grn",500*0.5],
	["H_Cap_grn_BI",500*0.5],
	["H_Cap_headphones",700*0.5],
	["H_Cap_khaki_specops_UK",500*0.5],
	["H_Cap_marshal",700*0.5],
	["H_Cap_oli",500*0.5],
	["H_Cap_pmc",500*0.5],
	["H_Cap_press",500*0.5],
	["H_Cap_red",500*0.5],
	["H_Cap_surfer",500*0.5],
	["H_Cap_tan",500*0.5],
	["H_Cap_tan_pmc",500*0.5],
	["H_Cap_tan_specops_US",500*0.5],
	["H_Cap_usblack",500*0.5],
	["H_Capbw_pmc",500*0.5],
	["H_Capbw_tan_pmc",500*0.5],
	["H_Hat_blue",700*0.5],
	["H_Hat_brown",700*0.5],
	["H_Hat_camo",700*0.5],
	["H_Hat_checker",700*0.5],
	["H_Hat_grey",700*0.5],
	["H_Hat_tan",700*0.5],
	["H_MilCap_dgtl",500*0.5],
	["H_MilCap_gry",500*0.5],
	["H_MilCap_ocamo",500*0.5],
	["H_MilCap_oucamo",500*0.5],
	["H_RacingHelmet_1_black_F",2500*0.5],
	["H_RacingHelmet_1_blue_F",2500*0.5],
	["H_RacingHelmet_1_F",2500*0.5],
	["H_RacingHelmet_1_green_F",2500*0.5],
	["H_RacingHelmet_1_orange_F",2500*0.5],
	["H_RacingHelmet_1_red_F",2500*0.5],
	["H_RacingHelmet_1_white_F",2500*0.5],
	["H_RacingHelmet_1_yellow_F",2500*0.5],
	["H_RacingHelmet_2_F",2500*0.5],
	["H_RacingHelmet_3_F",2500*0.5],
	["H_RacingHelmet_4_F",2500*0.5],
	["H_Shemag_olive",1250*0.5],
	["H_Shemag_olive_hs",1250*0.5],
	["H_Shemag_tan",1250*0.5],
	["H_ShemagOpen_khk",1250*0.5],
	["H_ShemagOpen_tan",1250*0.5],
	["H_StrawHat",700*0.5],
	["H_StrawHat_dark",700*0.5],
	["H_Watchcap_camo",700*0.5],
	["H_Watchcap_cbr",700*0.5],
	["I_FEM_AAF",800*0.5],
	["I_FEM_AAF_long",2000*0.5],
	["ice123_apo_bag",5000*0.5],
	["ice123_apo_cloak",5000*0.5],
	["ice123_apo_hood",1000*0.5],
	["IRA_Balaclava_Brown",500*0.5],
	["IRA_Soldier_Outfit_1",25000*0.5],
	["IRA_Soldier_Outfit_2",15000*0.5],
	["IRA_Soldier_Outfit_3",15000*0.5],
	["IRA_Soldier_Outfit_4",25000*0.5],
	["IRA_Soldier_Outfit_6",5000*0.5],
	["IRA_Soldier_Outfit_7",1500*0.5],
	["IRA_Soldier_Outfit_8",10000*0.5],
	["Mask_M40",2000*0.5],
	["Mask_M40_OD",2000*0.5],
	["msc_McamAlpine",10000*0.5],
	["msc_R_McamAlpine",10000*0.5],
	["msc_R_SnowMARPAT",10000*0.5],
	["msc_R_Yeti",10000*0.5],
	["msc_SnowMARPAT",10000*0.5],
	["msc_Yeti",10000*0.5],
	["O_FEM_CSAT",800*0.5],
	["O_FEM_CSAT_Long",2000*0.5],
	["O_FEM_CSAT_Rolled",3000*0.5],
	["PMC_B_Carryall_blk",6500*0.5],
	["PMC_B_Kitbag_blk",5500*0.5],
	["Pomi_Goggles",250*0.5],
	["Pomi_Goggles_Grn",250*0.5],
	["Pomi_Goggles_Snd",250*0.5],
	["R_Uniform_hunter_l",2000*0.5],
	["R_Uniform_survivor1_l",2250*0.5],
	["R_Uniform_survivor2_l",2250*0.5],
	["R_Uniform_worker_l",1000*0.5],
	["rds_Profiteer_cap1",600*0.5],
	["rds_Profiteer_cap2",600*0.5],
	["rds_Profiteer_cap3",600*0.5],
	["rds_Profiteer_cap4",600*0.5],
	["rds_uniform_assistant",1550*0.5],
	["rds_uniform_citizen1",1000*0.5],
	["rds_uniform_citizen2",1000*0.5],
	["rds_uniform_citizen3",1000*0.5],
	["rds_uniform_citizen4",1000*0.5],
	["rds_uniform_doctor",2500*0.5],
	["rds_uniform_doctor2",2500*0.5],
	["rds_uniform_Functionary1",7500*0.5],
	["rds_uniform_Functionary2",7500*0.5],
	["rds_uniform_Functionary3",7500*0.5],
	["rds_uniform_Functionary4",7500*0.5],
	["rds_uniform_Functionary5",7500*0.5],
	["rds_uniform_Functionary6",7500*0.5],
	["rds_uniform_Functionary7",7500*0.5],
	["rds_uniform_priest",1000*0.5],
	["rds_uniform_Profiteer1",1500*0.5],
	["rds_uniform_Profiteer2",1500*0.5],
	["rds_uniform_Profiteer3",1500*0.5],
	["rds_uniform_Profiteer4",1500*0.5],
	["rds_uniform_schoolteacher",1250*0.5],
	["rds_uniform_Villager1",1000*0.5],
	["rds_uniform_Villager2",1000*0.5],
	["rds_uniform_Villager3",1000*0.5],
	["rds_uniform_Villager4",1000*0.5],
	["rds_uniform_Woodlander1",1000*0.5],
	["rds_uniform_Woodlander2",1000*0.5],
	["rds_uniform_Woodlander3",1000*0.5],
	["rds_uniform_Woodlander4",1000*0.5],
	["rds_uniform_Worker1",1000*0.5],
	["rds_uniform_Worker2",1000*0.5],
	["rds_uniform_Worker3",1000*0.5],
	["rds_uniform_Worker4",1000*0.5],
	["rds_Villager_cap1",700*0.5],
	["rds_Villager_cap2",700*0.5],
	["rds_Villager_cap3",700*0.5],
	["rds_Villager_cap4",700*0.5],
	["rds_Woodlander_cap1",700*0.5],
	["rds_Woodlander_cap2",700*0.5],
	["rds_Woodlander_cap3",700*0.5],
	["rds_Woodlander_cap4",700*0.5],
	["rds_worker_cap1",600*0.5],
	["rds_worker_cap2",600*0.5],
	["rds_worker_cap3",600*0.5],
	["rds_worker_cap4",600*0.5],
	["rhs_6b23",15000*0.5],
	["rhs_6b23_6sh92",15000*0.5],
	["rhs_6b23_crew",15000*0.5],
	["rhs_6b23_crewofficer",15000*0.5],
	["rhs_6b23_digi",15000*0.5],
	["rhs_6b23_digi_6sh92",15000*0.5],
	["rhs_6b23_digi_crew",15000*0.5],
	["rhs_6b23_digi_crewofficer",15000*0.5],
	["rhs_6b23_digi_engineer",15000*0.5],
	["rhs_6b23_digi_rifleman",15000*0.5],
	["rhs_6b23_digi_sniper",15000*0.5],
	["rhs_6b23_engineer",15000*0.5],
	["rhs_6b23_ML",15000*0.5],
	["rhs_6b23_ML_6sh92",15000*0.5],
	["rhs_6b23_ML_crew",15000*0.5],
	["rhs_6b23_ML_crewofficer",15000*0.5],
	["rhs_6b23_ML_engineer",15000*0.5],
	["rhs_6b23_ML_rifleman",15000*0.5],
	["rhs_6b23_ML_sniper",15000*0.5],
	["rhs_6b23_rifleman",15000*0.5],
	["rhs_6b23_sniper",15000*0.5],
	["rhs_6sh46",1000*0.5],
	["rhs_6sh92",5000*0.5],
	["rhs_6sh92_digi",5000*0.5],
	["rhs_assault_umbts",2500*0.5],
	["rhs_beanie",600*0.5],
	["rhs_beanie_green",600*0.5],
	["rhs_Booniehat_digi",700*0.5],
	["rhs_Booniehat_flora",700*0.5],
	["rhs_Booniehat_m81",700*0.5],
	["rhs_Booniehat_marpatd",700*0.5],
	["rhs_Booniehat_marpatwd",700*0.5],
	["rhs_Booniehat_ocp",700*0.5],
	["rhs_Booniehat_ucp",700*0.5],
	["rhs_googles_black",200*0.5],
	["rhs_googles_clear",200*0.5],
	["rhs_gssh18",700*0.5],
	["rhs_sidor",2500*0.5],
	["rhs_uniform_df15",2500*0.5],
	["rhs_vest_commander",1000*0.5],
	["rhs_vydra_3m",5000*0.5],
	["rhsusf_patrolcap_ocp",500*0.5],
	["rhsusf_patrolcap_ucp",500*0.5],
	["SMD_US_BLOPS_BDU",10000*0.5],
	["SMD_US_BLOPS_Digi_BDU",10000*0.5],
	["tf_anprc155",15000*0.5],
	["tf_anprc155_coyote",15000*0.5],
	["tf_mr3000",15000*0.5],
	["tf_mr3000_bwmod",15000*0.5],
	["tf_mr3000_multicam",15000*0.5],
	["tf_mr3000_rhs",15000*0.5],
	["U_BG_Guerilla2_1",1500*0.5],
	["U_BG_Guerilla3_1",2000*0.5],
	["U_BG_Guerrilla_6_1",5000*0.5],
	["U_C_Driver_1",10000*0.5],
	["U_C_Driver_1_black",10000*0.5],
	["U_C_Driver_1_blue",10000*0.5],
	["U_C_Driver_1_green",10000*0.5],
	["U_C_Driver_1_orange",10000*0.5],
	["U_C_Driver_1_red",10000*0.5],
	["U_C_Driver_1_white",10000*0.5],
	["U_C_Driver_1_yellow",10000*0.5],
	["U_C_Driver_2",10000*0.5],
	["U_C_Driver_3",10000*0.5],
	["U_C_Driver_4",10000*0.5],
	["U_C_HunterBody_grn",2000*0.5],
	["U_C_Journalist",1500*0.5],
	["U_C_Poloshirt_blue",250*0.5],
	["U_C_Poloshirt_burgundy",250*0.5],
	["U_C_Poloshirt_redwhite",250*0.5],
	["U_C_Poloshirt_salmon",250*0.5],
	["U_C_Poloshirt_stripped",250*0.5],
	["U_C_Poloshirt_tricolour",250*0.5],
	["U_C_Poor_1",400*0.5],
	["U_C_WorkerCoveralls",2500*0.5],
	["U_CAF_AG_AFR_CLOTHES_01",250*0.5],
	["U_CAF_AG_AFR_CLOTHES_01a",250*0.5],
	["U_CAF_AG_AFR_CLOTHES_01b",250*0.5],
	["U_CAF_AG_AFR_CLOTHES_01c",250*0.5],
	["U_CAF_AG_AFR_CLOTHES_01d",250*0.5],
	["U_CAF_AG_AFR_CLOTHES_01e",250*0.5],
	["U_CAF_AG_AFR_CLOTHES_02",400*0.5],
	["U_CAF_AG_AFR_CLOTHES_02a",400*0.5],
	["U_CAF_AG_AFR_CLOTHES_02b",400*0.5],
	["U_CAF_AG_EEUR_FATIGUES_01",50000*0.5],
	["U_CAF_AG_EEUR_FATIGUES_01a",50000*0.5],
	["U_CAF_AG_EEUR_FATIGUES_02",10000*0.5],
	["U_CAF_AG_EEUR_FATIGUES_02a",10000*0.5],
	["U_CAF_AG_EEUR_FATIGUES_03",10000*0.5],
	["U_CAF_AG_EEUR_FATIGUES_03a",10000*0.5],
	["U_CAF_AG_EEUR_FATIGUES_03b",10000*0.5],
	["U_CAF_AG_EEUR_FATIGUES_03c",10000*0.5],
	["U_CAF_AG_ME_FATIGUES_01",10000*0.5],
	["U_CAF_AG_ME_FATIGUES_01a",10000*0.5],
	["U_CAF_AG_ME_FATIGUES_01b",10000*0.5],
	["U_CAF_AG_ME_FATIGUES_01c",10000*0.5],
	["U_CAF_AG_ME_FATIGUES_01d",10000*0.5],
	["U_CAF_AG_ME_ROBES_01",5000*0.5],
	["U_CAF_AG_ME_ROBES_01a",5000*0.5],
	["U_CAF_AG_ME_ROBES_01b",5000*0.5],
	["U_CAF_AG_ME_ROBES_01c",5000*0.5],
	["U_CAF_AG_ME_ROBES_01d",5000*0.5],
	["U_CAF_AG_ME_ROBES_02",5000*0.5],
	["U_CAF_AG_ME_ROBES_02a",5000*0.5],
	["U_CAF_AG_ME_ROBES_02b",5000*0.5],
	["U_CAF_AG_ME_ROBES_02c",5000*0.5],
	["U_CAF_AG_ME_ROBES_03",5000*0.5],
	["U_CAF_AG_ME_ROBES_03a",5000*0.5],
	["U_CAF_AG_ME_ROBES_03b",5000*0.5],
	["U_CAF_AG_ME_ROBES_03c",5000*0.5],
	["U_CAF_AG_ME_ROBES_03d",5000*0.5],
	["U_CAF_AG_ME_ROBES_04",5000*0.5],
	["U_CAF_AG_ME_ROBES_04a",5000*0.5],
	["U_CAF_AG_ME_ROBES_04b",5000*0.5],
	["U_CAF_AG_ME_ROBES_04c",5000*0.5],
	["U_CAF_AG_ME_ROBES_04d",5000*0.5],
	["U_CAF_AG_ME_ROBES_mil_01",25000*0.5],
	["U_CAF_AG_ME_ROBES_mil_01a",25000*0.5],
	["U_Competitor",500*0.5],
	["U_I_CombatUniform",50000*0.5],
	["U_I_CombatUniform_shortsleeve",50000*0.5],
	["U_I_G_resistanceLeader_F",3500*0.5],
	["U_I_G_Story_Protagonist_F",5000*0.5],
	["U_I_GhillieSuit",70000*0.5],
	["U_I_HeliPilotCoveralls",2500*0.5],
	["U_I_OfficerUniform",50000*0.5],
	["U_I_Wetsuit",1000*0.5],
	["U_IG_Guerilla1_1",10000*0.5],
	["U_IG_Guerilla2_2",1500*0.5],
	["U_IG_Guerilla2_3",1500*0.5],
	["U_IG_Guerilla3_1",1500*0.5],
	["U_IG_leader",25000*0.5],
	["U_Marshal",1500*0.5],
	["U_NikosAgedBody",5000*0.5],
	["U_NikosBody",3500*0.5],
	["U_O_GhillieSuit",70000*0.5],
	["U_O_OfficerUniform_ocamo",50000*0.5],
	["U_O_PilotCoveralls",20000*0.5],
	["U_OrestesBody",1000*0.5],
	["U_PMC_BgPolo_GrnPants",1500*0.5],
	["U_PMC_BlackPoloShirt_BeigeCords",1500*0.5],
	["U_PMC_BlckPolo_BgPants",1500*0.5],
	["U_PMC_BlckPolo_BluPants",1500*0.5],
	["U_PMC_BlkTShirt_DJeans",1500*0.5],
	["U_PMC_BlkTShirt_SJeans",1500*0.5],
	["U_PMC_BluePlaidShirt_BeigeCords",1500*0.5],
	["U_PMC_BluPolo_BgPants",1500*0.5],
	["U_PMC_BluPolo_GrnPants",1500*0.5],
	["U_PMC_BluTShirt_SJeans",1500*0.5],
	["U_PMC_BrnPolo_BgPants",1500*0.5],
	["U_PMC_BrnPolo_BluPants",1500*0.5],
	["U_PMC_CombatUniformLS_BSGPBB",20000*0.5],
	["U_PMC_CombatUniformLS_BSGPSB",20000*0.5],
	["U_PMC_CombatUniformLS_BSSPBB",20000*0.5],
	["U_PMC_CombatUniformLS_BSSPSB",20000*0.5],
	["U_PMC_CombatUniformLS_ChckDBS_GPSB",5000*0.5],
	["U_PMC_CombatUniformLS_ChckLB_GPBB",5000*0.5],
	["U_PMC_CombatUniformLS_ChckLR_SPBB",5000*0.5],
	["U_PMC_CombatUniformLS_ChckP_BPBB",5000*0.5],
	["U_PMC_CombatUniformLS_GSBPBB",20000*0.5],
	["U_PMC_CombatUniformLS_GSSPBB",20000*0.5],
	["U_PMC_CombatUniformLS_IndPBSBB",20000*0.5],
	["U_PMC_CombatUniformLS_SSBPBB",20000*0.5],
	["U_PMC_CombatUniformLS_SSGPBB",20000*0.5],
	["U_PMC_CombatUniformLS_SSGPSB",20000*0.5],
	["U_PMC_CombatUniformRS_BSGPBB",20000*0.5],
	["U_PMC_CombatUniformRS_BSGPSB",20000*0.5],
	["U_PMC_CombatUniformRS_BSSPBB",20000*0.5],
	["U_PMC_CombatUniformRS_BSSPSB",20000*0.5],
	["U_PMC_CombatUniformRS_ChckDBS_GPSB",5000*0.5],
	["U_PMC_CombatUniformRS_ChckLB_GPBB",5000*0.5],
	["U_PMC_CombatUniformRS_ChckLR_SPBB",5000*0.5],
	["U_PMC_CombatUniformRS_ChckP_BPBB",5000*0.5],
	["U_PMC_CombatUniformRS_GSBPBB",20000*0.5],
	["U_PMC_CombatUniformRS_GSSPBB",20000*0.5],
	["U_PMC_CombatUniformRS_IndPBSBB",20000*0.5],
	["U_PMC_CombatUniformRS_SSBPBB",20000*0.5],
	["U_PMC_CombatUniformRS_SSGPBB",20000*0.5],
	["U_PMC_CombatUniformRS_SSGPSB",20000*0.5],
	["U_PMC_GrnPolo_BgPants",1500*0.5],
	["U_PMC_GTShirt_DJeans",1500*0.5],
	["U_PMC_GTShirt_SJeans",1500*0.5],
	["U_PMC_IndUniformLS_BSBPBB",5000*0.5],
	["U_PMC_IndUniformLS_BSGPBB",5000*0.5],
	["U_PMC_IndUniformLS_BSTPTB",5000*0.5],
	["U_PMC_IndUniformLS_GSBPBB",5000*0.5],
	["U_PMC_IndUniformLS_GSGPBB",5000*0.5],
	["U_PMC_IndUniformLS_GSTPTB",5000*0.5],
	["U_PMC_IndUniformLS_TSBPBB",5000*0.5],
	["U_PMC_IndUniformLS_TSGPBB",5000*0.5],
	["U_PMC_IndUniformLS_TSTPTB",5000*0.5],
	["U_PMC_IndUniformRS_BSBPBB",5000*0.5],
	["U_PMC_IndUniformRS_BSGPBB",5000*0.5],
	["U_PMC_IndUniformRS_BSTPTB",5000*0.5],
	["U_PMC_IndUniformRS_GSBPBB",5000*0.5],
	["U_PMC_IndUniformRS_GSGPBB",5000*0.5],
	["U_PMC_IndUniformRS_GSTPTB",5000*0.5],
	["U_PMC_IndUniformRS_TSBPBB",5000*0.5],
	["U_PMC_IndUniformRS_TSGPBB",5000*0.5],
	["U_PMC_IndUniformRS_TSTPTB",5000*0.5],
	["U_PMC_RedPlaidShirt_DenimCords",1500*0.5],
	["U_PMC_WhtPolo_BgPants",1500*0.5],
	["U_PMC_WhtPolo_BluPants",1500*0.5],
	["U_PMC_WhtPolo_GrnPants",1500*0.5],
	["U_PMC_WTShirt_DJeans",1500*0.5],
	["U_Rangemaster",250*0.5],
	["UVF_Soldier_Outfit_1",2000*0.5],
	["UVF_Soldier_Outfit_2",50000*0.5],
	["UVF_Soldier_Outfit_3",10000*0.5],
	["UVF_Soldier_Outfit_4",1500*0.5],
	["UVF_Soldier_Outfit_5",5000*0.5],
	["V_BandollierB_blk",1500*0.5],
	["V_BandollierB_cbr",1500*0.5],
	["V_BandollierB_khk",1500*0.5],
	["V_BandollierB_oli",1500*0.5],
	["V_BandollierB_rgr",1500*0.5],
	["V_Chestrig_khk",3500*0.5],
	["V_Chestrig_rgr",3500*0.5],
	["V_HarnessO_brn",3500*0.5],
	["V_HarnessO_gry",3500*0.5],
	["V_HarnessOGL_brn",500000*0.5],
	["V_I_G_resistanceLeader_F",25000*0.5],
	["V_PlateCarrierIA1_dgtl",25000*0.5],
	["V_PlateCarrier1_rgr",25000*0.5],
	["V_Press_F",2000*0.5],
	["V_Rangemaster_belt",1000*0.5],
	["V_RebreatherIR",2000*0.5],
	["V_TacVest_blk",25000*0.5],
	["V_TacVest_brn",25000*0.5],
	["V_TacVest_camo",25000*0.5],
	["V_TacVest_khk",25000*0.5],
	["V_TacVest_oli",25000*0.5],
	["V_TacVestIR_blk",15000*0.5],
	["vip_clothes",4500*0.5]
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
	["rhs_uaz_open_vmf",19500*0.49],
	["rhs_uaz_vdv",22000*0.49],
	["RDS_Golf4_Civ_01",41500*0.49],
	["C_Offroad_01_F",33750*0.49],
	["B_G_Offroad_01_F",33750*0.49],
	["LandRover_ACR",47500*0.49],
	["BAF_Offroad_D",50000*0.49],
	["C_SUV_01_F",52500*0.49],
	["RDS_Octavia_Civ_01",60000*0.49],
	["rhsusf_m1025_d",150000*0.49],
	["rhsusf_m1025_d_s",150000*0.49],
	["rhsusf_m998_d_2dr",75500*0.49],
	["rhsusf_m998_d_s_2dr",75500*0.49],
	["C_Van_01_transport_F",97500*0.49],
	
	["C_Hatchback_01_sport_F",45000*0.49],
	["C_Van_01_fuel_F",112500*0.49],
	
	//GVT
	["I_MRAP_03_F",650000*0.49],
	
	//TRUCK
	["C_Van_01_box_F",127500*0.49],
	["rhs_gaz66o_vdv",175500*0.49],
	["rhs_gaz66_vdv",195300*0.49],
	["I_Truck_02_transport_F",202500*0.49],
	["I_Truck_02_covered_F",262500*0.49],
	["RDS_Ikarus_Civ_01",302500*0.49],
	["O_Truck_03_transport_F",310000*0.49],
	["RHS_Ural_Open_Civ_01",335250*0.49],
	["B_Truck_01_transport_F",375000*0.49],
	["O_Truck_03_covered_F",393750*0.49],
	["RHS_Ural_Civ_01",400000*0.49],
	["B_Truck_01_covered_F",412500*0.49],
	
	["B_Truck_01_box_F",450000*0.49],
	["O_Truck_03_device_F",450000*0.49],
	
	//AIR
	["GNT_C185_RP",207500*0.49],
	["GNT_C185F_RP",237500*0.49],
	//["bwi_a3_t6a_7",375000*0.49],
	["sab_camel_RP",375000*0.49],
	["Sab_ana_An2_RP",415000*0.49],
	["C_Heli_Light_01_civil_F_RP",337500*0.49],
	["B_Heli_Light_01_F_RP",337500*0.49],
	["O_Heli_Light_02_unarmed_F_RP",675000*0.49],
	["I_Heli_Transport_02_F_RP",750000*0.49],
	
	["O_Heli_Transport_04_F_RP",1000000*0.49],
	
	//BOAT
	["C_Rubberboat",3750*0.49],
	["C_Boat_Civil_01_F",33000*0.49],
	["C_Boat_Civil_01_rescue_F",31500*0.49],
	["D41_Trawler",130000*0.49],
	["Burnes_MK10_1",500000*0.49],
	
	//MED
	["ACR_LandRover_AMB_RP",33750*0.49],
	["B_Truck_01_mover_F_RP",30000*0.49],
	["I_Truck_02_medical_F_RP",20000*0.49],
	["O_Truck_03_medical_F",25000*0.49],
	["B_Truck_01_medical_F",30000*0.49],
	["O_Heli_Transport_04_medevac_F_RP",150000*0.49],
	
	//REB
	["rhs_tigr_ffv_vdv",750000*0.49],
	["B_G_Offroad_01_armed_F",750000*0.49],
	["BAF_Offroad_D_HMG",750000*0.49],
	["rhsusf_m1025_d_m2",750000*0.49],
	["rhsusf_m1025_d_s_m2",750000*0.49],
	["PMC_Offroad_Transport",33750*0.49],
	["PMC_Offroad_Armed",750000*0.49],
	["PMC_MH9",412500*0.49],
	["O_MRAP_02_F",1000000*0.49],
	["O_MRAP_02_hmg_F",1250000*0.49],
	["O_Heli_Transport_04_covered_F_RP",2500000*0.49],
	
	//COP
	["I_Heli_light_03_unarmed_F_RP",1],
	["B_Heli_Transport_01_F_RP",1],
	["B_Heli_Attack_01_F_RP",1],
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
	["rhs_uaz_open_vmf",19500*0.0735],
	["rhs_uaz_vdv",22000*0.0735],
	["RDS_Golf4_Civ_01",41500*0.0735],
	["C_Offroad_01_F",33750*0.0735],
	["B_G_Offroad_01_F",33750*0.0735],
	["LandRover_ACR",47500*0.0735],
	["BAF_Offroad_D",50000*0.0735],
	["C_SUV_01_F",52500*0.0735],
	["RDS_Octavia_Civ_01",60000*0.0735],
	["rhsusf_m1025_d",150000*0.0735],
	["rhsusf_m1025_d_s",150000*0.0735],
	["rhsusf_m998_d_2dr",75500*0.0735],
	["rhsusf_m998_d_s_2dr",75500*0.0735],
	["C_Van_01_transport_F",97500*0.0735],
	["C_Hatchback_01_sport_F",45000*0.0735],
	["C_Van_01_fuel_F",112500*0.0735],
	
	//GVT
	["I_MRAP_03_F",650000*0.0735],
	
	//TRUCK
	["C_Van_01_box_F",127500*0.0735],
	["rhs_gaz66o_vdv",175500*0.0735],
	["rhs_gaz66_vdv",195300*0.0735],
	["I_Truck_02_transport_F",202500*0.0735],
	["I_Truck_02_covered_F",262500*0.0735],
	["RDS_Ikarus_Civ_01",302500*0.0735],
	["O_Truck_03_transport_F",310000*0.0735],
	["RHS_Ural_Open_Civ_01",335250*0.0735],
	["B_Truck_01_transport_F",375000*0.0735],
	["O_Truck_03_covered_F",393750*0.0735],
	["RHS_Ural_Civ_01",400000*0.0735],
	["B_Truck_01_covered_F",412500*0.0735],
	
	["B_Truck_01_box_F",450000*0.0735],
	["O_Truck_03_device_F",450000*0.0735],
	
	//AIR
	["GNT_C185_RP",207500*0.0735],
	["GNT_C185F_RP",237500*0.0735],
	//["bwi_a3_t6a_7",375000*0.0735],
	["sab_camel_RP",375000*0.0735],
	["Sab_ana_An2_RP",415000*0.0735],
	["C_Heli_Light_01_civil_F_RP",337500*0.245],
	["B_Heli_Light_01_F_RP",337500*0.245],
	["O_Heli_Light_02_unarmed_F_RP",675000*0.245],
	["I_Heli_Transport_02_F_RP",750000*0.245],
	
	["O_Heli_Transport_04_F_RP",1000000*0.245],
		
	//BOAT
	["C_Rubberboat",3750*0.0735],
	["C_Boat_Civil_01_F",33000*0.0735],
	["C_Boat_Civil_01_rescue_F",31500*0.0735],
	["D41_Trawler",130000*0.0735],
	["Burnes_MK10_1",500000*0.0735],
	
	//MED
	["ACR_LandRover_AMB_RP",33750*0.0735],
	["B_Truck_01_mover_F_RP",30000*0.0735],
	["I_Truck_02_medical_F_RP",20000*0.0735],
	["O_Truck_03_medical_F",25000*0.0735],
	["B_Truck_01_medical_F",30000*0.0735],
	["O_Heli_Transport_04_medevac_F_RP",150000*0.245],
	
	//REB
	["rhs_tigr_ffv_vdv",750000*0.0735],
	["B_G_Offroad_01_armed_F",750000*0.0735],
	["BAF_Offroad_D_HMG",750000*0.0735],
	["rhsusf_m1025_d_m2",750000*0.0735],
	["rhsusf_m1025_d_s_m2",750000*0.0735],
	["PMC_Offroad_Transport",33750*0.0735],
	["PMC_Offroad_Armed",750000*0.0735],
	["PMC_MH9",412500*0.0735],
	["O_MRAP_02_F",1000000*0.0735],
	["O_MRAP_02_hmg_F",1250000*0.0735],
	["O_Heli_Transport_04_covered_F_RP",2500000*0.245],
	
	//ONU
	["I_Heli_light_03_unarmed_F_RP",1],
	["B_Heli_Transport_01_F_RP",1],
	["B_Heli_Attack_01_F_RP",1],
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
	["rhs_uaz_open_vmf",19500*0.5],
	["rhs_uaz_vdv",22000*0.5],
	["RDS_Golf4_Civ_01",41500*0.5],
	["C_Offroad_01_F",33750*0.5],
	["B_G_Offroad_01_F",33750*0.5],
	["LandRover_ACR",47500*0.5],
	["BAF_Offroad_D",50000*0.5],
	["C_SUV_01_F",52500*0.5],
	["RDS_Octavia_Civ_01",60000*0.5],
	["rhsusf_m1025_d",150000*0.5],
	["rhsusf_m1025_d_s",150000*0.5],
	["rhsusf_m998_d_2dr",75500*0.0735],
	["rhsusf_m998_d_s_2dr",75500*0.0735],
	["C_Van_01_transport_F",97500*0.5],
	
	["C_Hatchback_01_sport_F",45000*0.5],
	["C_Van_01_fuel_F",112500*0.5],
	
	//GVT
	["I_MRAP_03_F",650000*0.5],
	
	//TRUCK
	["C_Van_01_box_F",127500*0.5],
	["rhs_gaz66o_vdv",175500*0.5],
	["rhs_gaz66_vdv",195300*0.5],
	["I_Truck_02_transport_F",202500*0.5],
	["I_Truck_02_covered_F",262500*0.5],
	["RDS_Ikarus_Civ_01",302500*0.5],
	["O_Truck_03_transport_F",310000*0.5],
	["RHS_Ural_Open_Civ_01",335250*0.5],
	["B_Truck_01_transport_F",375000*0.5],
	["O_Truck_03_covered_F",393750*0.5],
	["RHS_Ural_Civ_01",400000*0.5],
	["B_Truck_01_covered_F",412500*0.5],
	
	["B_Truck_01_box_F",450000*0.5],
	["O_Truck_03_device_F",450000*0.5],
	
	//AIR
	["GNT_C185_RP",207500*0.5],
	["GNT_C185F_RP",237500*0.5],
	//["bwi_a3_t6a_7",375000*0.5],
	["sab_camel_RP",375000*0.5],
	["Sab_ana_An2_RP",415000*0.5],
	["C_Heli_Light_01_civil_F_RP",337500*0.5],
	["B_Heli_Light_01_F_RP",337500*0.5],
	["O_Heli_Light_02_unarmed_F_RP",675000*0.5],
	["I_Heli_Transport_02_F_RP",750000*0.5],
	
	["O_Heli_Transport_04_F_RP",1000000*0.5],
		
	//BOAT
	["C_Rubberboat",3750*0.5],
	["C_Boat_Civil_01_F",33000*0.5],
	["C_Boat_Civil_01_rescue_F",31500*0.5],
	["D41_Trawler",130000*0.5],
	["D41_Trawler",500000*0.5],
	
	//MED
	["ACR_LandRover_AMB_RP",33750*0.5],
	["B_Truck_01_mover_F_RP",30000*0.5],
	["I_Truck_02_medical_F_RP",20000*0.5],
	["O_Truck_03_medical_F",25000*0.5],
	["B_Truck_01_medical_F",30000*0.5],
	["O_Heli_Transport_04_medevac_F_RP",150000*0.5],
	
	//REB
	["rhs_tigr_ffv_vdv",750000*0.5],
	["B_G_Offroad_01_armed_F",750000*0.5],
	["BAF_Offroad_D_HMG",750000*0.5],
	["rhsusf_m1025_d_m2",750000*0.5],
	["rhsusf_m1025_d_s_m2",750000*0.5],
	["PMC_Offroad_Transport",33750*0.5],
	["PMC_Offroad_Armed",750000*0.5],
	["PMC_MH9",412500*0.5],
	["O_MRAP_02_F",1000000*0.5],
	["O_MRAP_02_hmg_F",1250000*0.5],
	["O_Heli_Transport_04_covered_F_RP",2500000*0.5],
	
	//ONU
	["I_Heli_light_03_unarmed_F_RP",1],
	["B_Heli_Transport_01_F_RP",1],
	["B_Heli_Attack_01_F_RP",1],
	["B_Boat_Transport_01_F",1],
	["B_SDV_01_F",1]
];
__CONST__(life_assur_prices,life_assur_prices);