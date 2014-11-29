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
			["B_Quadbike_01_F",2500],
			["C_Hatchback_01_F",9500],
			["C_Offroad_01_F",12500],
			["BAF_Offroad_D",17500],
			["LandRover_ACR",17500],
			["C_SUV_01_F",35000],
			["C_Van_01_transport_F",40000]
		];
		// Si donateur
		if(__GETC__(life_donator) > 0) then
		{
			_return pushBack
			["C_Hatchback_01_sport_F",11300];
		};
	};
	
	case "civ_truck":
	{
		_return =
		[
			["C_Van_01_box_F",60000],
			["I_Truck_02_transport_F",75000],
			["I_Truck_02_covered_F",100000],
			["B_Truck_01_transport_F",275000],
			["O_Truck_03_transport_F",200000],
			["O_Truck_03_covered_F",250000],
			["B_Truck_01_box_F",350000]
			
		];
		// Si donateur
		if(__GETC__(life_donator) > 0) then
		{
			_return pushBack
			["O_Truck_03_device_F",450000];
		};
	};
	
	case "civ_air":
	{
		_return =
		[
			["C_Heli_Light_01_civil_F",253000],
			["B_Heli_Light_01_F",253000],
			["O_Heli_Light_02_unarmed_F",750000],
			["bwi_a3_t6a_7",375000]
		];
		if(__GETC__(life_donator) > 0) then
		{
			_return pushBack
			["O_Heli_Transport_04_F",2000000];
		};
	};
	
	case "civ_ship":
	{
		_return =
		[
			["C_Rubberboat",5000],
			["C_Boat_Civil_01_F",22000]
		];
	};
	
	case "med_shop":
	{
		_return = [
			["C_Offroad_01_F",10000],
			["ACR_LandRover_AMB",15000]
		];
		if(__GETC__(life_medicLevel) >= 2 && __GETC__(life_donator) > 0) then
		{
			_return pushBack
			["C_Hatchback_01_sport_F",11300];
		};
		if(__GETC__(life_medicLevel) >= 3) then
		{
			_return pushBack
			["I_Truck_02_medical_F",25000];
			_return pushBack
			["O_Truck_03_medical_F",45000];
			_return pushBack
			["B_Truck_01_medical_F",60000];
		};
	};
	
	case "med_air_hs": {
		if(__GETC__(life_medicLevel) >= 1) then
		{
			_return pushBack
			["C_Heli_Light_01_civil_F",253000];
			_return pushBack
			["B_Heli_Light_01_F",253000];
		};
		if(__GETC__(life_medicLevel) >= 2) then
		{
			_return pushBack
			["O_Heli_Light_02_unarmed_F",750000];
		};
		if(__GETC__(life_medicLevel) >= 4 && __GETC__(life_donator) > 0) then
		{
			_return pushBack
			["O_Heli_Transport_04_medevac_F",1500000];
		};
	};
	
	case "reb_car":
	{
		_return =
		[
			["B_Quadbike_01_F",2500],
			["B_G_Offroad_01_F",15000],
			["C_Heli_Light_01_civil_F",325000],
			["B_Heli_Light_01_F",325000],
			["I_Heli_Transport_02_F",700000]
		];
		// Grade 2
		if(__GETC__(life_reblevel) >= 2) then
		{
			_return pushBack
			["O_MRAP_02_F",150000];
			_return pushBack
			["B_G_Offroad_01_armed_F",750000];
			_return pushBack
			["BAF_Offroad_D_HMG",750000];
		};
		// Faction 1 = Armée Privée
		if(__GETC__(life_factnumber) == 1) then
		{
			_return pushBack
			["PMC_Offroad_Transport",15000];
			// Grade 2
			if(__GETC__(life_reblevel) >= 2) then
			{
				_return pushBack
				["PMC_Offroad_Armed",750000];
				_return pushBack
				["PMC_MH9",325000];
			};
		};
		// Si leader de faction
		if(__GETC__(life_reblevel) >= 3) then
		{
			_return pushBack
			["O_MRAP_02_hmg_F",1250000];
			_return pushBack
			["O_Heli_Transport_04_covered_F",2500000];
		};
	};
	
	case "cop_car":
	{
		_return pushBack
		["sab_UN_Car",0];
		// Grade Brigadier
		if(__GETC__(life_coplevel) >= 2) then
		{
			_return pushBack
			["sab_UN_Offroad",0];
		};
		// Grade Lieutenant
		if(__GETC__(life_coplevel) >= 3) then
		{
			_return pushBack
			["C_Hatchback_01_sport_F",0];
			_return pushBack
			//ZAMAK transport
			["sab_UN_Truck_O",0];
			//ZAMAK Couvert
			_return pushBack
			["sab_UN_Truck_C",0];
		};
		// Grade Brigadier
		if(license_cop_piloteauto) then
		{
			_return pushBack
			["sab_UN_APC",0];
			_return pushBack
			["sab_UN_Hunter",0];
			_return pushBack
			["sab_UN_Strider",0];
		};
		// Grade Capitaine
		if(__GETC__(life_coplevel) >= 4) then
		{
			_return pushBack
			["sab_UN_Truck_Fuel",0];
			_return pushBack
			["sab_UN_Truck_Medi",0];
			_return pushBack
			["sab_UN_Truck_Rep",0];
			_return pushBack
			["sab_UN_Truck_Ammo",0];
		};
		// Grade Colonel
		if(__GETC__(life_coplevel) >= 5) then
		{
			_return pushBack
			["sab_UN_Hunter_hmg",0];
			// Douscka ONU
			_return pushBack
			["sab_UN_Offroad_gun",0];
			_return pushBack
			["sab_UN_CRV",0]; // Impossible de ranger au garage
		};
		// Grade Général
		if(__GETC__(life_coplevel) >= 6) then
		{
			_return pushBack
			["sab_UN_Strider_hmg",0];
			_return pushBack
			["sab_UN_Kuma",0];
			_return pushBack
			["sab_UN_Panther",0];
			
		};
	};
	
	case "cop_air":
	{
		// Grade Brigadier
		if(__GETC__(life_coplevel) >= 2) then
		{
			_return pushBack
			["C_Heli_Light_01_civil_F",0];
			_return pushBack
			["B_Heli_Light_01_F",0];
			_return pushBack
			["sab_UN_Heli",0];
			_return pushBack
			["sab_UN_Large_Heli",0];
		};
		// Grade Lieutenant
		if(__GETC__(life_coplevel) >= 3) then
		{
			_return pushBack
			["I_Heli_light_03_unarmed_F",0];
			_return pushBack
			["B_Heli_Transport_03_unarmed_F",0];
			_return pushBack
			["O_Heli_Transport_04_bench_F",0];
			_return pushBack
			["bwi_a3_t6a_7",0];
			_return pushBack
			["bwi_a3_at6b_3",0];
		};
		// Grade Colonel
		if(__GETC__(life_coplevel) >= 5) then
		{
			_return pushBack
			["B_Heli_Transport_01_F",0];
			_return pushBack
			["B_Heli_Transport_03_F",0];
		};
		// Grade Général
		if(__GETC__(life_coplevel) >= 6) then
		{
			_return pushBack
			["sab_UN_Heli_armed",0];
			_return pushBack
			["B_Heli_Attack_01_F",0];
		};
	};
	
	case "cop_airhq":
	{
		// Grade Brigadier
		if(__GETC__(life_coplevel) >= 2) then
		{
			_return pushBack
			["C_Heli_Light_01_civil_F",0];
			_return pushBack
			["B_Heli_Light_01_F",0];
			_return pushBack
			["sab_UN_Heli",0];
			_return pushBack
			["sab_UN_Large_Heli",0];
		};
		// Grade Lieutenant
		if(__GETC__(life_coplevel) >= 3) then
		{
			_return pushBack
			["I_Heli_light_03_unarmed_F",0];
			_return pushBack
			["B_Heli_Transport_03_unarmed_F",0];
			_return pushBack
			["O_Heli_Transport_04_bench_F",0];
			_return pushBack
			["bwi_a3_t6a_7",0];
			_return pushBack
			["bwi_a3_at6b_3",0];
		};
		// Grade Colonel
		if(__GETC__(life_coplevel) >= 5) then
		{
			_return pushBack
			["B_Heli_Transport_01_F",0];
			_return pushBack
			["B_Heli_Transport_03_F",0];
		};
		// Grade Général
		if(__GETC__(life_coplevel) >= 6) then
		{
			_return pushBack
			["sab_UN_Heli_armed",0];
			_return pushBack
			["B_Heli_Attack_01_F",0];
		};
	};
	
	case "cop_ship":
	{
		// Grade Brigadier
		if(__GETC__(life_coplevel) >= 2) then
		{
			_return pushBack
			["B_Boat_Transport_01_F",0];
			_return pushBack
			["sab_UN_Boat",0];
			_return pushBack
			["B_SDV_01_F",0];
		};
		// Grade Haut-Gradés
		if(__GETC__(life_coplevel) >= 5) then
		{
			_return pushBack
			["sab_UN_Boat_armed",0];
		};
	};
};

_return;
