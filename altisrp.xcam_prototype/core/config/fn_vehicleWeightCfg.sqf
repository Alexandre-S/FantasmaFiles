/*
	File: fn_vehicleWeightCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration for vehicle weight.
*/
private["_className"];
_className = [_this,0,"",[""]] call BIS_fnc_param;

switch (_className) do
{
	case "C_Kart_01_Blu_F": {7};
	case "C_Kart_01_Fuel_F": {7};
	case "C_Kart_01_Red_F": {7};
	case "C_Kart_01_Vrana_F": {7};
	case "B_Quadbike_01_F": {38};
	case "RDS_S1203_Civ_01": {135};
	case "C_Hatchback_01_F": {60};
	case "RDS_Lada_Civ_01": {60};
	case "RDS_Gaz24_Civ_01": {60};
	case "RDS_Golf4_Civ_01": {60};
	case "C_Offroad_01_F": {98};
	case "B_G_Offroad_01_F": {98};
	case "BAF_Offroad_D": {113};
	case "LandRover_ACR": {113};
	case "ACR_LandRover_AMB": {113};
	case "RDS_Octavia_Civ_01": {75};
	case "C_SUV_01_F": {75};
	case "RDS_Ikarus_Civ_01": {113};
	case "C_Van_01_transport_F": {150};
	case "C_Van_01_box_F": {225};
	case "C_Van_01_fuel_F": {225};
	case "I_Truck_02_transport_F": {300};
	case "I_Truck_02_covered_F": {375};
	case "B_Truck_01_transport_F": {450};
	case "O_Truck_03_transport_F": {428};
	case "B_Truck_01_covered_F": {488};
	case "O_Truck_03_covered_F": {468};
	case "B_Truck_01_box_F": {600};
	case "O_Truck_03_device_F": {525};
	case "C_Heli_Light_01_civil_F": {15};
	case "B_Heli_Light_01_F": {15};
	case "O_Heli_Light_02_unarmed_F": {45};
	case "O_Heli_Transport_04_medevac_F": {60};
	case "O_Heli_Transport_04_covered_F": {60};
	case "O_Heli_Transport_04_F": {60};
	case "bwi_a3_t6a_7": {23};
	case "bwi_a3_at6b_3": {23};
	case "GNT_C185": {23};
	case "GNT_C185F": {23};
	case "C_Rubberboat": {68};
	case "C_Boat_Civil_01_F": {128};
	case "D41_Trawler": {600};
	case "Burnes_MK10_1": {98};
	case "I_Truck_02_medical_F": {375};
	case "O_Truck_03_medical_F": {450};
	case "B_Truck_01_medical_F": {488};
	case "I_Heli_Transport_02_F": {105};
	case "B_G_Offroad_01_armed_F": {98};
	case "BAF_Offroad_D_HMG": {98};
	case "PMC_Offroad_Transport": {98};
	case "PMC_Offroad_Armed": {98};
	case "PMC_MH9": {15};
	case "O_MRAP_02_F": {90};
	case "O_MRAP_02_hmg_F": {90};
	case "I_MRAP_03_F": {90};
	// case "sab_UN_Car": {40};
	// case "sab_UN_Offroad": {65};
	case "C_Hatchback_01_sport_F": {60};
	// case "sab_UN_Truck_O": {200};
	// case "sab_UN_Truck_C": {250};
	// case "sab_UN_Hunter": {65};
	// case "sab_UN_Truck_Fuel": {250};
	// case "sab_UN_Truck_Medi": {300};
	// case "sab_UN_Truck_Rep": {350};
	// case "sab_UN_Truck_Ammo": {350};
	// case "sab_UN_Hunter_hmg": {65};
	// case "sab_UN_Offroad_gun": {65};
	// case "sab_UN_Strider": {55};
	// case "sab_UN_Strider_hmg": {55};
	// case "sab_UN_APC": {100};
	// case "sab_UN_CRV": {100};
	// case "sab_UN_Kuma": {100};
	// case "sab_UN_Panther": {100};
	// case "sab_UN_Heli": {30};
	// case "sab_UN_Large_Heli": {50};
	case "I_Heli_light_03_unarmed_F": {90};
	case "B_Heli_Transport_01_F": {105};
	// case "sab_UN_Heli_armed": {20};
	case "B_Heli_Attack_01_F": {30};
	case "O_Heli_Transport_04_bench_F": {45};
	case "B_Heli_Transport_03_unarmed_F": {60};
	case "B_Heli_Transport_03_F": {60};
	case "B_Boat_Transport_01_F": {68};
	// case "sab_UN_Boat": {30};
	// case "sab_UN_Boat_armed": {50};
	case "B_SDV_01_F": {68};
	case "Land_CargoBox_V1_F": {5000};
	case "Box_IND_Grenades_F": {250};
	case "B_supplyCrate_F": {500};
	default {-1};
};