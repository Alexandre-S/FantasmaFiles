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
	case "rhs_uaz_open_vmf": {60};
	case "rhs_uaz_vdv": {60};
	case "RDS_Golf4_Civ_01": {60};
	case "rhsusf_m1025_d_m2": {70};
	case "rhsusf_m1025_d_s_m2": {70};
	case "C_Offroad_01_F": {98};
	case "B_G_Offroad_01_F": {98};
	case "rhs_tigr_ffv_vdv": {110};
	case "BAF_Offroad_D": {103};
	case "LandRover_ACR": {103};
	case "ACR_LandRover_AMB": {103};
	case "RDS_Octavia_Civ_01": {75};
	case "C_SUV_01_F": {75};
	case "RDS_Ikarus_Civ_01": {113};
	case "B_Truck_01_mover_F": {113};
	case "C_Van_01_transport_F": {150};
	case "C_Van_01_box_F": {225};
	case "C_Van_01_fuel_F": {225};
	case "rhs_gaz66o_vdv": {250};
	case "rhs_gaz66_vdv": {275};
	case "I_Truck_02_transport_F": {300};
	case "I_Truck_02_covered_F": {375};
	case "O_Truck_03_transport_F": {428};
	case "RHS_Ural_Open_Civ_01": {435};
	case "B_Truck_01_transport_F": {450};
	case "RHS_Ural_Civ_01": {470};
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
	//case "bwi_a3_t6a_7": {23};
	//case "bwi_a3_at6b_3": {23};
	case "sab_camel": {23};
	case "Sab_ana_An2": {23};
	case "GNT_C185": {23};
	case "GNT_C185F": {23};
	case "C_Rubberboat": {68};
	case "C_Boat_Civil_01_F": {128};
	case "C_Boat_Civil_01_rescue_F": {128};
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
	case "C_Hatchback_01_sport_F": {60};
	case "I_Heli_light_03_unarmed_F": {90};
	case "B_Heli_Transport_01_F": {105};
	case "B_Heli_Attack_01_F": {30};
	case "O_Heli_Transport_04_bench_F": {45};
	case "B_Heli_Transport_03_unarmed_F": {60};
	case "B_Heli_Transport_03_F": {60};
	case "B_Boat_Transport_01_F": {68};
	case "B_SDV_01_F": {68};
	case "Land_CargoBox_V1_F": {5000};
	case "Box_IND_Grenades_F": {250};
	case "B_supplyCrate_F": {500};
	default {-1};
};