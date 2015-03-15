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
			["RDS_Golf4_Civ_01",41500],
			["C_Offroad_01_F",33750],
			["BAF_Offroad_D",47500],
			["LandRover_ACR",47500],
			["C_SUV_01_F",52500],
			["RDS_Octavia_Civ_01",60000],
			["C_Van_01_transport_F",97500]
		];
		// Si donateur
		if(__GETC__(life_donator) > 0) then
		{
			_return pushBack ["C_Hatchback_01_sport_F",45000];
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
			["RDS_Golf4_Civ_01",41500],
			["C_Offroad_01_F",33750],
			["BAF_Offroad_D",47500],
			["LandRover_ACR",47500],
			["C_SUV_01_F",52500],
			["C_Van_01_transport_F",97500]
		];
		// Si donateur
		if(__GETC__(life_donator) > 0) then
		{
			_return pushBack ["C_Hatchback_01_sport_F",45000];
			_return pushBack ["C_Van_01_fuel_F",112500];
		};
		if(license_civ_gvt) then
		{
			_return pushBack ["I_MRAP_03_F",650000];
		};
	};
	
	case "civ_truck":
	{
		_return =
		[
			["C_Van_01_box_F",127500],
			["DAR_4x4",175500],
			["DAR_MK23",195300],
			["I_Truck_02_transport_F",202500],
			["DAR_MK27",228500],
			["I_Truck_02_covered_F",262500],
			["DAR_MK27T",288500],
			["RDS_Ikarus_Civ_01",302500],
			["O_Truck_03_transport_F",310000],
			["B_Truck_01_transport_F",375000],
			["O_Truck_03_covered_F",393750],
			["B_Truck_01_covered_F",412500]
			
		];
		// Si donateur
		if(__GETC__(life_donator) > 0) then
		{
			//_return pushBack ["DAR_LHS_8",335250];
			_return pushBack ["B_Truck_01_box_F",450000];
			_return pushBack ["DAR_LHS_16",450000];
			_return pushBack ["O_Truck_03_device_F",450000];
		};
		if(player getVariable["life_dep",false]) then
		{
			_return pushBack ["B_Truck_01_mover_F",30000]; //Service Truck
		};
	};
	
	case "civ_air":
	{
		_return =
		[
			["GNT_C185",207500], // Cessna 185
			["GNT_C185F",237500], // Cessna 185 Amphibian
			//["bwi_a3_t6a_7",375000],
			["sab_camel",375000],
			["Sab_ana_An2",415000],
			["C_Heli_Light_01_civil_F",337500],
			["B_Heli_Light_01_F",337500],
			["O_Heli_Light_02_unarmed_F",675000]
		];
		if(player getVariable["life_dep",false] || {license_civ_gvt} || {__GETC__(life_donator) > 0}) then
		{
			_return pushBack ["I_Heli_Transport_02_F",750000]; // dep
		};
		if(__GETC__(life_donator) > 0) then
		{
			_return pushBack ["O_Heli_Transport_04_F",1000000];
		};
	};
	
	case "civ_ship":
	{
		_return =
		[
			["C_Rubberboat",3750],
			["C_Boat_Civil_01_F",33000],
			// ["D41_Trawler",130000]
			["Burnes_MK10_1",500000]
		];
	};
	
	case "med_shop":
	{
		_return = [
			["C_Offroad_01_F",33750],
			["ACR_LandRover_AMB",33750],
			["C_SUV_01_F",52500]
		];
		if(__GETC__(life_medicLevel) >= 2 && __GETC__(life_donator) > 0) then
		{
			_return pushBack ["C_Hatchback_01_sport_F",45000];
			//_return pushBack ["B_Truck_01_mover_F",30000];
		};
		if(__GETC__(life_medicLevel) >= 3) then
		{
			_return pushBack ["I_Truck_02_medical_F",20000];
			_return pushBack ["O_Truck_02_box_F",20000];
			// _return pushBack ["O_Truck_03_medical_F",25000];
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
			_return pushBack ["C_Heli_Light_01_civil_F",40000];
			_return pushBack ["B_Heli_Light_01_F",40000];
		};
		if(__GETC__(life_medicLevel) >= 2) then
		{
			_return pushBack ["O_Heli_Light_02_unarmed_F",75000];
		};
		if(__GETC__(life_medicLevel) >= 4 && __GETC__(life_donator) > 0) then
		{
			_return pushBack ["O_Heli_Transport_04_medevac_F",150000];
		};
	};
	
	case "reb_car":
	{
		_return =
		[
			["B_Quadbike_01_F",3500],
			["B_G_Offroad_01_F",33750],
			["C_Heli_Light_01_civil_F",412500],
			["B_Heli_Light_01_F",412500],
			["O_Heli_Light_02_unarmed_F",700000],
			["I_Heli_Transport_02_F",750000]
		];
		// Grade 2
		if(__GETC__(life_reblevel) >= 2) then
		{
			// _return pushBack ["O_MRAP_02_F",150000];
			_return pushBack ["B_G_Offroad_01_armed_F",750000];
			_return pushBack ["BAF_Offroad_D_HMG",750000];
		};
		// Faction 1 = Armée Privée
		if(__GETC__(life_factnumber) == 1) then
		{
			_return pushBack ["PMC_Offroad_Transport",33750];
			_return pushBack ["PMC_MH9",412500];
			// Grade 2
			if(__GETC__(life_reblevel) >= 2) then
			{
				_return pushBack ["PMC_Offroad_Armed",750000];
			};
		};
		// Si leader de faction
		if(__GETC__(life_reblevel) >= 3) then
		{
			// _return pushBack ["O_MRAP_02_hmg_F",1250000];
			_return pushBack ["O_Heli_Transport_04_covered_F",2500000];
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
		// Grade Lieutenant
		if(__GETC__(life_coplevel) >= 3) then
		{
			_return pushBack ["C_Hatchback_01_sport_F",0];
			_return pushBack ["I_Truck_02_transport_F",0]; //ZAMAK transport
			// _return pushBack ["sab_UN_Truck_O",0]; //ZAMAK transport
			_return pushBack ["I_Truck_02_covered_F",0]; //ZAMAK Couvert
			// _return pushBack ["sab_UN_Truck_C",0]; //ZAMAK Couvert
		};
		if(license_cop_piloteauto) then
		{
			// _return pushBack["sab_UN_APC",0];
			// _return pushBack["sab_UN_Hunter",0];
			// _return pushBack["sab_UN_Strider",0];
		};
		// Grade Capitaine
		if(__GETC__(life_coplevel) >= 4) then
		{
			// _return pushBack["sab_UN_Truck_Fuel",0];
			// _return pushBack["sab_UN_Truck_Medi",0];
			// _return pushBack["sab_UN_Truck_Rep",0];
			// _return pushBack["sab_UN_Truck_Ammo",0];
			_return pushBack["B_MRAP_01_F",0];
		};
		// Grade Colonel
		if(__GETC__(life_coplevel) >= 5) then
		{
			_return pushBack["B_MRAP_01_hmg_F",0];
			// _return pushBack["sab_UN_Offroad_gun",0];// Douscka ONU
			// _return pushBack["sab_UN_CRV",0]; // Impossible de ranger au garage
		};
		// Grade Général
		if(__GETC__(life_coplevel) >= 6) then
		{
			// _return pushBack["sab_UN_Strider_hmg",0];
			// _return pushBack["sab_UN_Kuma",0];
			// _return pushBack["sab_UN_Panther",];
			_return pushBack["B_APC_Wheeled_01_cannon_F",0];
			_return pushBack["I_MRAP_03_F",0];
			
		};
	};
	
	case "cop_air":
	{
		// Grade Brigadier
		if(__GETC__(life_coplevel) >= 2) then
		{
			_return pushBack["GNT_C185",0];
			_return pushBack["GNT_C185F",0];
			_return pushBack["C_Heli_Light_01_civil_F",0];
			_return pushBack["B_Heli_Light_01_F",0];
			// _return pushBack["sab_UN_Heli",0];
			// _return pushBack["sab_UN_Large_Heli",0];
		};
		// Grade Lieutenant
		if(__GETC__(life_coplevel) >= 3) then
		{
			_return pushBack["O_Heli_Light_02_unarmed_F",0];
			_return pushBack["I_Heli_light_03_unarmed_F",0];
			_return pushBack["B_Heli_Transport_03_unarmed_F",0];
			_return pushBack["O_Heli_Transport_04_F",0];
			//_return pushBack["bwi_a3_t6a_7",0];
			//_return pushBack["bwi_a3_at6b_3",0];
		};
		// Grade Colonel
		if(__GETC__(life_coplevel) >= 5) then
		{
			_return pushBack["B_Heli_Transport_01_F",0];
			_return pushBack["B_Heli_Transport_03_F",0];
		};
		// Grade Général
		if(__GETC__(life_coplevel) >= 6) then
		{
			// _return pushBack["sab_UN_Heli_armed",0];
			// _return pushBack["sab_UN_attackHeli",0];
			_return pushBack["B_Heli_Attack_01_F",0];
		};
	};
	
	case "cop_ship":
	{
		_return pushBack["B_Boat_Transport_01_F",0];
		_return pushBack["B_Lifeboat",0];
		// Grade Brigadier
		if(__GETC__(life_coplevel) >= 1) then
		{
			_return pushBack["C_Boat_Civil_01_police_F",0];
		};
		if(__GETC__(life_coplevel) >= 2) then
		{
			_return pushBack["C_Boat_Civil_01_police_F",0];
		};
		// Grade Haut-Gradés
		if(__GETC__(life_coplevel) >= 5) then
		{
			_return pushBack["B_Boat_Armed_01_minigun_F",0];
		};
	};
};

_return;
