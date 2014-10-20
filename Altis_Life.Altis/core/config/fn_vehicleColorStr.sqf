/*
	File: fn_vehicleColorStr.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration for color strings depending on their index location.
*/
private["_vehicle","_color","_index"];
_vehicle = [_this,0,"",[""]] call BIS_fnc_param;
_index = [_this,1,-1,[0]] call BIS_fnc_param;
_color = "";

switch (_vehicle) do
{
	case "C_Offroad_01_F" :
	{
		switch (_index) do
		{
			case 0: {_color = "Rouge";};
			case 1: {_color = "Jaune";};
			case 2: {_color = "Blanc";};
			case 3: {_color = "Bleu";};
			case 4: {_color = "Rouge foncé";};
			case 5: {_color = "Bleu et Blanc"};
			case 6: {_color = "Noir"};
			case 7: {_color = "Noir"};
			case 8: {_color = "Medic"};
			case 9: {_color = "Rouillé"};
		};
	};
	
	case "C_Hatchback_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Beige";};
			case 1: {_color = "Vert";};
			case 2: {_color = "Bleu";};
			case 3: {_color = "Bleu foncé";};
			case 4: {_color = "Jaune";};
			case 5: {_color = "Blanc"};
			case 6: {_color = "Gris"};
			case 7: {_color = "Noir"};
		};
	};
	
	case "C_Hatchback_01_sport_F":
	{
		switch(_index) do
		{
			case 0: {_color = "Rouge"};
			case 1: {_color = "Bleu foncé"};
			case 2: {_color = "Orange"};
			case 3: {_color = "Noir et blanc"};
			case 4: {_color = "Marron"};
			case 5: {_color = "Vert"};
			case 6: {_color = "Noir"};
			case 7: {_color = "Rouge"};
			case 8: {_color = "Bleu foncé"};
			case 9: {_color = "Orange"};
			case 10: {_color = "Noir et blanc"};
			case 11: {_color = "Marron"};
			case 12: {_color = "Vert"};
			case 13: {_color = "Ken Block"};
			case 14: {_color = "RedGull"};
			case 15: {_color = "Ken Block"};
			case 16: {_color = "RedGull"};
		};
	};
	
	case "C_SUV_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Rouge foncé";};
			case 1: {_color = "Noir";};
			case 2: {_color = "Argenté";};
			case 3: {_color = "Orange";};
			case 4: {_color = "Cop";};
			case 5: {_color = "Noir et flammes bleues";};
			case 6: {_color = "Léopard";};
			case 7: {_color = "Rouillé";};
		};
	};
	
	case "C_Van_01_box_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Blanc"};
			case 1: {_color = "Rouge"};
		};
	};
	
	case "C_Van_01_transport_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Blanc"};
			case 1: {_color = "Rouge"};
		};
	};
	
	case "C_Van_01_fuel_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Blanc"};
			case 1: {_color = "Rouge"};
		};
	};
	
	case "B_Quadbike_01_F" :
	{
		switch (_index) do
		{
			case 0: {_color = "Marron"};
			case 1: {_color = "Désertique"};
			case 2: {_color = "Noir"};
			case 3: {_color = "Bleu"};
			case 4: {_color = "Rouge"};
			case 5: {_color = "Blanc"};
			case 6: {_color = "Vert digital"};
			case 7: {_color = "Camo chasse"};
			case 8: {_color = "Camo terroriste"};
		};
	};
	
	case "B_Heli_Light_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "ONU"};
			case 1: {_color = "Noir"};
			case 2: {_color = "Civ bleu"};
			case 3: {_color = "Civ rouge"};
			case 4: {_color = "Vert digital"};
			case 5: {_color = "Bleuline"};
			case 6: {_color = "Elliptical"};
			case 7: {_color = "Furious"};
			case 8: {_color = "Jeans Bleu"};
			case 9: {_color = "Speedy Redline"};
			case 10: {_color = "Sunset"};
			case 11: {_color = "Vrana"};
			case 12: {_color = "Waves Blue"};
			case 13: {_color = "Terroriste Digital"};
			case 14: {_color = "Croix-Rouge"};
		};
	};
	
	case "O_Heli_Light_02_unarmed_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Noir"};
			case 1: {_color = "Blanc et Bleu"};
			case 2: {_color = "Vert Digital"};
			case 3: {_color = "Desert Digital"};
			case 4: {_color = "Croix-Rouge"};
		};
	};
	
	case "B_MRAP_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Normal"};
			case 1: {_color = "Noir"};
		};
	};
	
	case "I_Truck_02_covered_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Orange"};
			case 1: {_color = "Noir"};
		};
	};
	
	case "I_Truck_02_transport_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Orange"};
			case 1: {_color = "Noir"};
		};
	};
	
	case "B_APC_Wheeled_01_cannon_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Noir"};
		};
	};
	
	case "O_Heli_Attack_02_black_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Noir"};
		};
	};
	
	case "I_Heli_Transport_02_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Ion"};
			case 1: {_color = "Dahoman"};
		};
	};
	
	case "B_APC_Wheeled_01_cannon_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Noir"};
		};
	};
};

_color;