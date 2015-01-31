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
			case 6: {_color = "Gendarmerie"};
			case 7: {_color = "Noir"};
			case 8: {_color = "Croix-Rouge"};
			case 9: {_color = "Rouillé"};
			case 10: {_color = "Dépanneur"};
			case 11: {_color = "Vigil"};
			case 12: {_color = "Noir"};
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
			case 8: {_color = "Gendarmerie"};
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
	
	case "RDS_Octavia_Civ_01":
	{
		switch (_index) do
		{
			case 0: {_color = "Blanche";};
			case 1: {_color = "Noir";};
			case 2: {_color = "Jaune";};
			case 3: {_color = "Bleu";};
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
			case 6: {_color = "Gendarmerie"};
			case 7: {_color = "Banalisée beige"};
			case 8: {_color = "Banalisée verte"};
			case 9: {_color = "Banalisée bleu"};
			case 10: {_color = "Banalisée bleu foncé"};
			case 11: {_color = "Banalisée beige motif"};
			case 12: {_color = "Banalisée jaune"};
			case 13: {_color = "Ken Block"};
			case 14: {_color = "RedGull"};
			case 15: {_color = "Banalisée blanche"};
			case 16: {_color = "Banalisée grise"};
			case 17: {_color = "Croix-Rouge"};
			case 18: {_color = "Banalisée noir"};
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
			case 4: {_color = "Gendarmerie";};
			case 5: {_color = "Noir et flammes bleues";};
			case 6: {_color = "Léopard";};
			case 7: {_color = "Rouillé";};
			case 8: {_color = "Banalisée rouge foncé";};
			case 9: {_color = "Banalisée Noir";};
			case 10: {_color = "Banalisée argenté";};
			case 11: {_color = "Banalisée orange";};		
		};
	};
	
	case "C_Van_01_box_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Blanc"};
			case 1: {_color = "Rouge"};
			case 2: {_color = "Bleu"};
			case 3: {_color = "Bleu nuit"};
			case 4: {_color = "Vert foncé"};
			case 5: {_color = "Vert clair"};
			case 6: {_color = "Jaune clair"};
			case 7: {_color = "Orange"};
			case 8: {_color = "Gris"};
			case 9: {_color = "Noir"};
		};
	};
	
	case "C_Van_01_transport_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Blanc"};
			case 1: {_color = "Rouge"};
			case 2: {_color = "Bleu"};
			case 3: {_color = "Bleu nuit"};
			case 4: {_color = "Vert foncé"};
			case 5: {_color = "Vert clair"};
			case 6: {_color = "Jaune clair"};
			case 7: {_color = "Orange"};
			case 8: {_color = "Gris"};
			case 9: {_color = "Noir"};
		};
	};
	
	case "C_Van_01_fuel_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Blanc"};
			case 1: {_color = "Rouge"};
			case 2: {_color = "bleu"};
			case 3: {_color = "bleu nuit"};
			case 4: {_color = "vert foncé"};
			case 5: {_color = "vert clair"};
			case 6: {_color = "jaune clair"};
			case 7: {_color = "orange"};
			case 8: {_color = "gris"};
			case 9: {_color = "noir"};
			case 10: {_color = "BP Blanc"};
			case 11: {_color = "China Rouge"};
			case 12: {_color = "Bleu Rayé"};
			case 13: {_color = "Shell"};
			case 14: {_color = "Vert logo"};
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
			case 0: {_color = "N-Gendarmerie"};
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
			case 0: {_color = "P-Gendarmerie"};
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
			case 0: {_color = "Kaki"};
			case 1: {_color = "Noir"};
		};
	};
	
	case "B_MRAP_01_hmg_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Kaki"};
			case 1: {_color = "Noir"};
		};
	};
	
	case "I_Truck_02_covered_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Orange"};
			
			case 1: {_color = "Blanc/Beige"};
			case 2: {_color = "Blanc"};
			case 3: {_color = "Blanc/Bleu"};
			case 4: {_color = "Blanc/Bleu clair"};
			case 5: {_color = "Blanc/Gris"};
			case 6: {_color = "Blanc/Jaune"};
			case 7: {_color = "Blanc/Jaune clair"};
			case 8: {_color = "Blanc/Orange"};
			case 9: {_color = "Blanc/Rouge"};
			case 10: {_color = "Blanc/Vert"};
			case 11: {_color = "Blanc/Violet"};
			
			case 12: {_color = "Jaune clair/Beige"};
			case 13: {_color = "Jaune clair/Blanc"};
			case 14: {_color = "Jaune clair/Bleu"};
			case 15: {_color = "Jaune clair/Bleu clair"};
			case 16: {_color = "Jaune clair/Gris"};
			case 17: {_color = "Jaune clair/Jaune"};
			case 18: {_color = "Jaune clair"};
			case 19: {_color = "Jaune clair/Orange"};
			case 20: {_color = "Jaune clair/Rouge"};
			case 21: {_color = "Jaune clair/Vert"};
			case 22: {_color = "Jaune clair/Violet"};
			
			case 23: {_color = "Jaune/Beige"};
			case 24: {_color = "Jaune/Blanc"};
			case 25: {_color = "Jaune/Bleu"};
			case 26: {_color = "Jaune/Bleu clair"};
			case 27: {_color = "Jaune/Gris"};
			case 28: {_color = "Jaune"};
			case 29: {_color = "Jaune/Jaune clair"};
			case 30: {_color = "Jaune/Orange"};
			case 31: {_color = "Jaune/Rouge"};
			case 32: {_color = "Jaune/Vert"};
			case 33: {_color = "Jaune/Violet"};
			
			case 34: {_color = "Rouge/Beige"};
			case 35: {_color = "Rouge/Blanc"};
			case 36: {_color = "Rouge/Bleu"};
			case 37: {_color = "Rouge/Bleu clair"};
			case 38: {_color = "Rouge/Gris"};
			case 39: {_color = "Rouge/Jaune"};
			case 40: {_color = "Rouge/Jaune clair"};
			case 41: {_color = "Rouge/Orange"};
			case 42: {_color = "Rouge"};
			case 43: {_color = "Rouge/Vert"};
			case 44: {_color = "Rouge/Violet"};
			
			case 45: {_color = "Rouge vif/Beige"};
			case 46: {_color = "Rouge vif/Blanc"};
			case 47: {_color = "Rouge vif/Bleu"};
			case 48: {_color = "Rouge vif/Bleu clair"};
			case 49: {_color = "Rouge vif/Gris"};
			case 50: {_color = "Rouge vif/Jaune"};
			case 51: {_color = "Rouge vif/Jaune clair"};
			case 52: {_color = "Rouge vif/Orange"};
			case 53: {_color = "Rouge vif/Rouge"};
			case 54: {_color = "Rouge vif/Vert"};
			case 55: {_color = "Rouge vif/Violet"};
			
			case 56: {_color = "Vert/Beige"};
			case 57: {_color = "Vert/Blanc"};
			case 58: {_color = "Vert/Bleu"};
			case 59: {_color = "Vert/Bleu clair"};
			case 60: {_color = "Vert/Gris"};
			case 61: {_color = "Vert/Jaune"};
			case 62: {_color = "Vert/Jaune clair"};
			case 63: {_color = "Vert/Orange"};
			case 64: {_color = "Vert/Rouge"};
			case 65: {_color = "Vert"};
			case 66: {_color = "Vert/Violet"};
			
			case 67: {_color = "Violet/Beige"};
			case 68: {_color = "Violet/Blanc"};
			case 69: {_color = "Violet/Bleu"};
			case 70: {_color = "Violet/Bleu clair"};
			case 71: {_color = "Violet/Gris"};
			case 72: {_color = "Violet/Jaune"};
			case 73: {_color = "Violet/Jaune clair"};
			case 74: {_color = "Violet/Orange"};
			case 75: {_color = "Violet/Rouge"};
			case 76: {_color = "Violet/Vert"};
			case 77: {_color = "Violet"};
			
			case 78: {_color = "Noir"};
		};
	};
	
	case "I_Truck_02_transport_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Orange"};
			case 1: {_color = "Blanc"};
			case 2: {_color = "Jaune clair"};
			case 3: {_color = "Jaune"};
			case 4: {_color = "Rouge"};
			case 5: {_color = "Rouge vif"};
			case 6: {_color = "Vert"};
			case 7: {_color = "Violet"};
			case 8: {_color = "Noir"};
		};
	};
	
	/*case "B_APC_Wheeled_01_cannon_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Noir"};
		};
	};*/
	
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
			case 2: {_color = "Depanneur"};
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
	
	case "B_Truck_01_mover_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Dépanneuse"};
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
			case 5: {_color = "Gendarmerie"};
			case 6: {_color = "Blanc / Bleu"};
			case 7: {_color = "Jaune / Rouge"};
			case 8: {_color = "Jaune"};
			case 9: {_color = "Blanc"};
			case 10: {_color = "Gris"};
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
			case 5: {_color = "Gendarmerie"};
			case 6: {_color = "Blanc / Bleu"};
			case 7: {_color = "Jaune / Rouge"};
			case 8: {_color = "Jaune"};
			case 9: {_color = "Blanc"};
			case 10: {_color = "Gris"};
		};
	};
};

_color;