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
	case "C_Kart_01_Blu_F": {5};
	case "C_Kart_01_Fuel_F": {5};
	case "C_Kart_01_Red_F": {5};
	case "C_Kart_01_Vrana_F": {5};
	case "B_Quadbike_01_F": {25};
	case "C_Hatchback_01_F": {40};
	case "C_Offroad_01_F": {65};
	case "C_SUV_01_F": {50};
	case "C_Van_01_transport_F": {100};
	case "C_Van_01_box_F": {150};
	case "I_Truck_02_transport_F": {200};
	case "I_Truck_02_covered_F": {250};
	case "B_Truck_01_transport_F": {325};
	case "O_Truck_03_transport_F": {285};
	case "O_Truck_03_covered_F": {300};
	case "B_Truck_01_box_F": {450};
	case "O_Truck_03_device_F": {350};
	case "C_Heli_Light_01_civil_F": {10};
	case "B_Heli_Light_01_F": {10};
	case "O_Heli_Light_02_unarmed_F": {30};
	case "O_Heli_Transport_04_medevac_F": {40};
	case "C_Rubberboat": {45};
	case "C_Boat_Civil_01_F": {85};
	case "I_Truck_02_medical_F": {250};
	case "O_Truck_03_medical_F": {300};
	case "B_Truck_01_medical_F": {325};
	case "I_Heli_Transport_02_F": {70};
	case "B_G_Offroad_01_armed_F": {65};
	case "PMC_Offroad_Transport": {65};
	case "PMC_Offroad_Armed": {65};
	case "PMC_MH9": {10};
	case "O_MRAP_02_F": {60};
	case "O_MRAP_02_hmg_F": {60};
	case "sab_UN_Car": {40};
	case "sab_UN_Offroad": {65};
	case "C_Hatchback_01_sport_F": {40};
	case "sab_UN_Truck_O": {200};
	case "sab_UN_Truck_C": {250};
	case "sab_UN_Hunter": {65};
	case "sab_UN_Truck_Fuel": {250};
	case "sab_UN_Truck_Medi": {300};
	case "sab_UN_Truck_Rep": {350};
	case "sab_UN_Truck_Ammo": {350};
	case "sab_UN_Hunter_hmg": {65};
	case "sab_UN_Offroad_gun": {65};
	case "sab_UN_Strider": {55};
	case "sab_UN_Strider_hmg": {55};
	case "sab_UN_APC": {100};
	case "sab_UN_CRV": {100};
	case "sab_UN_Kuma": {100};
	case "sab_UN_Panther": {100};
	case "sab_UN_Heli": {30};
	case "sab_UN_Large_Heli": {50};
	case "I_Heli_light_03_unarmed_F": {60};
	case "B_Heli_Transport_01_F": {70};
	case "sab_UN_Heli_armed": {20};
	case "B_Heli_Attack_01_F": {20};
	case "O_Heli_Transport_04_bench_F": {30};
	case "B_Heli_Transport_03_unarmed_F": {40};
	case "B_Heli_Transport_03_F": {40};
	case "B_Boat_Transport_01_F": {45};
	case "sab_UN_Boat": {30};
	case "sab_UN_Boat_armed": {50};
	case "B_SDV_01_F": {45};
	case "Land_CargoBox_V1_F": {5000};
	case "Box_IND_Grenades_F": {200};
	case "B_supplyCrate_F": {500};
	default {-1};
};