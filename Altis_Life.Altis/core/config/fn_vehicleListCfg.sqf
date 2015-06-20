#include <macro.h>
/*
	File:
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration list / array for buyable vehicles & prices and their shop.
*/
private["_shop","_return"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {[]};
_return = [];
switch (_shop) do
{
	case "kart_shop":
	{
		_return = [
			["C_Kart_01_Blu_F",15000],
			["C_Kart_01_Fuel_F",15000],
			["C_Kart_01_Red_F",15000],
			["C_Kart_01_Vrana_F",15000]
		];
	};
	
	case "civ_car":
	{
		_return = 
		[
			["B_Quadbike_01_F",3500],
			["RDS_S1203_Civ_01",9800],
			["C_Hatchback_01_F",14250],
			["RDS_Lada_Civ_01",15000],
			["RDS_Gaz24_Civ_01",16000],
			["rhs_uaz_open_vmf",19500],
			["rhs_uaz_vdv",22000],
			["RDS_Golf4_Civ_01",41500],
			["C_Offroad_01_F",33750],
			["LandRover_ACR",47500],
			["BAF_Offroad_D",50000],
			["C_SUV_01_F",52500],
			["RDS_Octavia_Civ_01",60000],
			["rhsusf_m998_d_2dr",75500],
			["rhsusf_m998_d_s_2dr",75500],
			["C_Van_01_transport_F",97500]
		];
		if(player getVariable["life_dep",false]) then
		{
			_return pushBack ["C_Offroad_01_F_DEP_RP",3375]; //Service Truck
		};
		// Si donateur
		if(__GETC__(life_donator) > 0) then
		{
			_return pushBack ["C_Hatchback_01_sport_F_RP",45000];
			_return pushBack ["C_Van_01_fuel_F",112500];
		};
	};
	
	case "gvt_car":
	{
		_return = 
		[
			["B_Quadbike_01_F",3500],
			["RDS_S1203_Civ_01",9800],
			["C_Hatchback_01_F",14250],
			["RDS_Lada_Civ_01",15000],
			["RDS_Gaz24_Civ_01",16000],
			["rhs_uaz_open_vmf",19500],
			["rhs_uaz_vdv",22000],
			["RDS_Golf4_Civ_01",41500],
			["C_Offroad_01_F",33750],
			["LandRover_ACR",47500],
			["BAF_Offroad_D",50000],
			["C_SUV_01_F",52500],
			["RDS_Octavia_Civ_01",60000],
			["rhsusf_m998_d_2dr",75500],
			["rhsusf_m998_d_s_2dr",75500],
			["C_Van_01_transport_F",97500]
		];
		// Si donateur
		if(__GETC__(life_donator) > 0) then
		{
			_return pushBack ["C_Hatchback_01_sport_F_RP",45000];
			_return pushBack ["C_Van_01_fuel_F",112500];
		};
		if(l_c_gvt) then
		{
			_return pushBack ["I_MRAP_03_F",650000];
		};
	};
	
	case "civ_truck":
	{
		_return =
		[
			["C_Van_01_box_F",127500],
			["rhs_gaz66o_vdv",175500],
			["rhs_gaz66_vdv",195300],
			["I_Truck_02_transport_F",202500],
			["I_Truck_02_covered_F",262500],
			["RDS_Ikarus_Civ_01",302500],
			["O_Truck_03_transport_F_RP",310000],
			["RHS_Ural_Open_Civ_01",335250],
			["B_Truck_01_transport_F",375000],
			["O_Truck_03_covered_F_RP",393750],
			["RHS_Ural_Civ_01",400000],
			["B_Truck_01_covered_F",412500]
		];
		// Si donateur
		if(__GETC__(life_donator) > 0) then
		{
			_return pushBack ["B_Truck_01_box_F",450000];
			_return pushBack ["O_Truck_03_device_F_RP",450000];
		};
		if(player getVariable["life_dep",false]) then
		{
			_return pushBack ["B_Truck_01_mover_F_RP",30000]; //Service Truck
		};
	};
	
	case "civ_air":
	{
		_return =
		[
			["GNT_C185_RP",207500], // Cessna 185
			["GNT_C185F_RP",237500], // Cessna 185 Amphibian
			//["bwi_a3_t6a_7",375000],
			["sab_camel_RP",375000],
			["Sab_ana_An2_RP",415000],
			["C_Heli_Light_01_civil_F_RP",337500],
			["B_Heli_Light_01_F_RP",337500],
			["O_Heli_Light_02_unarmed_F_RP",675000],
			["RHS_Mi8mt_Cargo_vdv",700000]
		];
		if(player getVariable["life_dep",false]) then
		{
			_return pushBack ["B_Heli_Light_01_F_DEP_RP",33750]; // dep
			_return pushBack ["C_Heli_Light_01_civil_F_DEP_RP",33750]; // dep
			_return pushBack ["I_Heli_Transport_02_F_DEP_RP",75000]; // dep
		};
		if(l_c_gvt || {__GETC__(life_donator) > 0}) then
		{
			_return pushBack ["I_Heli_Transport_02_F_RP",750000];
		};
		if(__GETC__(life_donator) > 0) then
		{
			_return pushBack ["O_Heli_Transport_04_F_RP",1000000];
		};
	};
	
	case "civ_air2":
	{
		_return =
		[
			["C_Heli_Light_01_civil_F_RP",337500],
			["B_Heli_Light_01_F_RP",337500],
			["O_Heli_Light_02_unarmed_F_RP",675000],
			["RHS_Mi8mt_Cargo_vdv",700000]
		];
		if(player getVariable["life_dep",false]) then
		{
			_return pushBack ["B_Heli_Light_01_F_DEP_RP",33750]; // dep
			_return pushBack ["C_Heli_Light_01_civil_F_DEP_RP",33750]; // dep
			_return pushBack ["I_Heli_Transport_02_F_DEP_RP",75000]; // dep
		};
		if(l_c_gvt || {__GETC__(life_donator) > 0}) then
		{
			_return pushBack ["I_Heli_Transport_02_F_RP",750000];
		};
		if(__GETC__(life_donator) > 0) then
		{
			_return pushBack ["O_Heli_Transport_04_F_RP",1000000];
		};
	};
	
	case "civ_ship":
	{
		_return =
		[
			["C_Rubberboat",3750],
			["C_Boat_Civil_01_F",33000],
			// ["D41_Trawler",130000]
			["Burnes_MK10_1",500000],
			["ffaa_ar_lcm",500000]
		];
	};
	
	case "med_shop":
	{
		_return = [
			["C_Offroad_01_F",33750],
			["ACR_LandRover_AMB_RP",33750],
			["C_SUV_01_F",52500]
		];
		if(__GETC__(life_medicLevel) >= 2 && __GETC__(life_donator) > 0) then
		{
			_return pushBack ["C_Hatchback_01_sport_F_RP",45000];
			//_return pushBack ["B_Truck_01_mover_F_RP",30000];
		};
		if(__GETC__(life_medicLevel) >= 3) then
		{
			_return pushBack ["I_Truck_02_medical_F_RP",20000];
			_return pushBack ["O_Truck_02_box_F_RP",20000];
			// _return pushBack ["O_Truck_03_medical_F_RP",25000];
			// _return pushBack ["B_Truck_01_medical_F",30000];
		};
	};
	
	case "med_sea":
	{
		_return = [
			["C_Boat_Civil_01_rescue_F",31500]
		];
	};
	
	case "med_air_hs": {
		if(__GETC__(life_medicLevel) >= 1) then
		{
			_return pushBack ["C_Heli_Light_01_civil_F_RP",40000];
			_return pushBack ["B_Heli_Light_01_F_RP",40000];
		};
		if(__GETC__(life_medicLevel) >= 2) then
		{
			_return pushBack ["O_Heli_Light_02_unarmed_F_RP",75000];
		};
		if(__GETC__(life_medicLevel) >= 4 && __GETC__(life_donator) > 0) then
		{
			_return pushBack ["O_Heli_Transport_04_medevac_F_RP",150000];
			_return pushBack ["RHS_UH60M_MEV_d",250000];
		};
	};
	
	case "reb_car":
	{
		_return =
		[
			["B_Quadbike_01_F",3500],
			["B_G_Offroad_01_F",33750],
			["rhsusf_m1025_d",150000],
			["rhsusf_m1025_d_s",150000],
			["C_Heli_Light_01_civil_F_RP",412500],
			["B_Heli_Light_01_F_RP",412500],
			["O_Heli_Light_02_unarmed_F_RP",700000],
			["I_Heli_Transport_02_F_RP",750000]
			//["RHS_UH60M_MEV2_d",1500000]
		];
		// Grade 2
		if(__GETC__(life_reblevel) >= 2) then
		{
			// _return pushBack ["O_MRAP_02_F",150000];
			_return pushBack ["rhs_tigr_ffv_vdv",750000];
			_return pushBack ["B_G_Offroad_01_armed_F",750000];
			_return pushBack ["BAF_Offroad_D_HMG",750000];
			_return pushBack ["rhsusf_m1025_d_m2",750000];
			_return pushBack ["rhsusf_m1025_d_s_m2",750000];
		};
		// Faction 1 = Armée Privée
		/*if(__GETC__(life_factnumber) == 1) then
		{
			_return pushBack ["PMC_Offroad_Transport",33750];
			_return pushBack ["PMC_MH9",412500];
			// Grade 2
			if(__GETC__(life_reblevel) >= 2) then
			{
				_return pushBack ["PMC_Offroad_Armed",750000];
			};
		};*/
		// Si leader de faction
		if(__GETC__(life_reblevel) >= 3) then
		{
			// _return pushBack ["O_MRAP_02_hmg_F",1250000];
			_return pushBack ["O_Heli_Transport_04_covered_F_RP",2500000];
		};
	};
	
	case "cop_car":
	{
		_return pushBack ["B_Quadbike_01_F",0];
		_return pushBack ["C_Hatchback_01_F",0];
		// Grade Brigadier
		if(__GETC__(life_coplevel) >= 2) then
		{
			_return pushBack ["C_Offroad_01_F",0];
			_return pushBack ["C_SUV_01_F",0];
		};
		// BAC / PJ
		if(l_g_bacpj) then
		{
			_return pushBack ["RDS_Golf4_Civ_01",0];
			_return pushBack ["RDS_Gaz24_Civ_01",0];
			_return pushBack ["BAF_Offroad_D",0];
			_return pushBack ["LandRover_ACR",0];
			_return pushBack ["C_Van_01_box_F",0];
		};
		// Grade Lieutenant
		if(__GETC__(life_coplevel) >= 3) then
		{
			_return pushBack ["C_Hatchback_01_sport_F_RP",0];
			_return pushBack ["I_Truck_02_transport_F",0]; //ZAMAK transport
			_return pushBack ["I_Truck_02_covered_F",0]; //ZAMAK Couvert
		};
		// Grade Capitaine
		if(__GETC__(life_coplevel) >= 4) then
		{
			_return pushBack["B_MRAP_01_F",0];
		};
		// Grade Colonel
		if(__GETC__(life_coplevel) >= 5) then
		{
			_return pushBack["B_MRAP_01_hmg_F",0];
		};
		// Grade Général
		if(__GETC__(life_coplevel) >= 6) then
		{
			_return pushBack["B_APC_Wheeled_01_cannon_F",0];
			_return pushBack["I_MRAP_03_F",0];
			
		};
	};
	
	case "cop_air":
	{
		// Pilote transport
		if(l_g_air) then
		{
			_return pushBack["GNT_C185_RP",0];
			_return pushBack["GNT_C185F_RP",0];
			_return pushBack["C_Heli_Light_01_civil_F_RP",0];
			_return pushBack["B_Heli_Light_01_F_RP",0];
			_return pushBack["O_Heli_Light_02_unarmed_F_RP",0];
			_return pushBack["B_Heli_Transport_03_unarmed_F_RP",0];
			_return pushBack["O_Heli_Transport_04_F_RP",0];
		};
		// Pilote Tactique
		if(l_g_airT) then
		{
			_return pushBack["I_Heli_light_03_unarmed_F_RP",0];
			_return pushBack["B_Heli_Transport_01_F_RP",0];
			_return pushBack["B_Heli_Transport_03_F_RP",0];
			_return pushBack["RHS_UH60M_d",0];
		};
		// Grade Général
		if(__GETC__(life_coplevel) >= 6) then
		{
			_return pushBack["B_Heli_Attack_01_F_RP",0];
		};
	};
	
	case "cop_ship":
	{
		_return pushBack["C_Boat_Civil_01_police_F",0];
		
		// Garde Cote
		if(l_g_cg) then
		{
			_return pushBack["B_Boat_Transport_01_F",0];
			_return pushBack["B_Lifeboat",0];
			_return pushBack["ffaa_ar_supercat",0];
			_return pushBack["B_Boat_Armed_01_minigun_F",0];
			_return pushBack["B_SDV_01_F",0];
		};
		// Grade Haut-Gradés
		if(__GETC__(life_coplevel) >= 5) then
		{
		};
	};
};

_return;
