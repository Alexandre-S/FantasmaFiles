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
			case 8: {_color = "Croix-Rouge"};
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
	
	case "RDS_Gaz24_Civ_01":
	{
		switch (_index) do
		{
			case 0: {_color = "Bleu";};
			case 1: {_color = "Gris";};
			case 2: {_color = "Noir";};
		};
	};
	
	case "RDS_Ikarus_Civ_01":
	{
		switch (_index) do
		{
			case 0: {_color = "Coloré";};
			case 1: {_color = "Bleu/gris";};
		};
	};
	
	case "RDS_S1203_Civ_01":
	{
		switch (_index) do
		{
			case 0: {_color = "Bleu";};
			case 1: {_color = "Rouge";};
			case 2: {_color = "Argent";};
			case 3: {_color = "Orange";};
			case 4: {_color = "Blanc";};
			case 5: {_color = "Vert";};
		};
	};
	
	case "RDS_Lada_Civ_01":
	{
		switch (_index) do
		{
			case 0: {_color = "Blanche";};
			case 1: {_color = "Rouge";};
			case 2: {_color = "Verte rouillé";};
			case 3: {_color = "Décoré";};
		};
	};
	
	case "RDS_Golf4_Civ_01":
	{
		switch (_index) do
		{
			case 0: {_color = "Rouge";};
			case 1: {_color = "Noir";};
			case 2: {_color = "Jaune";};
			case 3: {_color = "Bleu";};
			case 4: {_color = "Blanche";};
			case 5: {_color = "Verte";};
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
			case 17: {_color = "Croix-Rouge"};
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
			case 0: {_color = "N-ONU"};
			case 1: {_color = "N-Noir"};
			case 2: {_color = "N-Civ bleu"};
			case 3: {_color = "N-Civ rouge"};
			case 4: {_color = "N-Vert digital"};
			case 5: {_color = "N-Bleuline"};
			case 6: {_color = "N-Elliptical"};
			case 7: {_color = "N-Furious"};
			case 8: {_color = "N-Jeans Bleu"};
			case 9: {_color = "N-Speedy Redline"};
			case 10: {_color = "N-Sunset"};
			case 11: {_color = "N-Vrana"};
			case 12: {_color = "N-Waves Blue"};
			case 13: {_color = "N-Terroriste Digital"};
			case 14: {_color = "N-Croix-Rouge"};
		};
	};
	
	case "C_Heli_Light_01_civil_F":
	{
		switch (_index) do
		{
			case 0: {_color = "P-ONU"};
			case 1: {_color = "P-Noir"};
			case 2: {_color = "P-Civ bleu"};
			case 3: {_color = "P-Civ rouge"};
			case 4: {_color = "P-Vert digital"};
			case 5: {_color = "P-Bleuline"};
			case 6: {_color = "P-Elliptical"};
			case 7: {_color = "P-Furious"};
			case 8: {_color = "P-Jeans Bleu"};
			case 9: {_color = "P-Speedy Redline"};
			case 10: {_color = "P-Sunset"};
			case 11: {_color = "P-Vrana"};
			case 12: {_color = "P-Waves Blue"};
			case 13: {_color = "P-Terroriste Digital"};
			case 14: {_color = "P-Croix-Rouge"};
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
	
	case "I_Heli_light_03_unarmed_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Hellcat"};
			case 1: {_color = "Noir"};
			case 2: {_color = "Standard"};
		};
	};
	
	case "B_APC_Wheeled_01_cannon_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Noir"};
		};
	};
	
	case "bwi_a3_t6a_7":
	{
		switch (_index) do
		{
			case 0: {_color = "BeechCraft"};
			case 1: {_color = "USAF Academy"};
			case 2: {_color = "NAVY"};
			case 3: {_color = "Tiger"};
			case 4: {_color = "Shark"};
			case 5: {_color = "Irak"};
			case 6: {_color = "Greek"};
			case 7: {_color = "Canada"};
			case 8: {_color = "Warthunder"};
			case 9: {_color = "USAF Academy"};
		};
	};
	
	case "BAF_Offroad_D":
	{
		switch (_index) do
		{
			case 0: {_color = "Beige Bâché"};
			case 1: {_color = "Vert Bâché"};
			case 2: {_color = "Rouge Bâché"};
			case 3: {_color = "Vert Camo Bâché"};
			case 4: {_color = "Désert Camo Bâché"};
		};
	};
	
	case "LandRover_ACR":
	{
		switch (_index) do
		{
			case 0: {_color = "Beige Débâché"};
			case 1: {_color = "Vert Débâché"};
			case 2: {_color = "Rouge Débâché"};
			case 3: {_color = "Vert Camo Débâché"};
			case 4: {_color = "Désert Camo Débâché"};
		};
	};
	
	case "BAF_Offroad_D_HMG":
	{
		switch (_index) do
		{
			case 0: {_color = "Beige"};
			case 1: {_color = "Vert"};
			case 3: {_color = "Vert Camo"};
			case 4: {_color = "Désert Camo"};
		};
	};
	
	case "I_MRAP_03_F" :
	{
		switch (_index) do
		{
			case 0: {_color = "Noir";};
		};
	};
	
	case "GNT_C185":
	{
		switch (_index) do
		{
			case 0: {_color = "Blanc / Bleu"};
			case 1: {_color = "Jaune / Rouge"};
			case 2: {_color = "Jaune"};
			case 3: {_color = "Blanc"};
			case 4: {_color = "Gris"};
			case 0: {_color = "Blanc / Bleu"};
			case 1: {_color = "Jaune / Rouge"};
			case 2: {_color = "Jaune"};
			case 3: {_color = "Blanc"};
			case 4: {_color = "Gris"};
		};
	};
	
	case "GNT_C185F":
	{
		switch (_index) do
		{
			case 0: {_color = "Blanc / Bleu"};
			case 1: {_color = "Jaune / Rouge"};
			case 2: {_color = "Jaune"};
			case 3: {_color = "Blanc"};
			case 4: {_color = "Gris"};
			case 0: {_color = "Blanc / Bleu"};
			case 1: {_color = "Jaune / Rouge"};
			case 2: {_color = "Jaune"};
			case 3: {_color = "Blanc"};
			case 4: {_color = "Gris"};
		};
	};
};

_color;