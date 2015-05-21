/*
	File: fn_varToStr.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Takes the long-name (variable) and returns a display name for our
	virtual item.
*/
private["_var"];
_var = [_this,0,"",[""]] call BIS_fnc_param;
if(_var == "") exitWith {""};

switch (_var) do
{
	//Virtual Inventory Items
	// case "life_inv_handcuffs": {(localize "STR_Item_Handcuffs")};
	// case "life_inv_handcuffkeys": {(localize "STR_Item_Handcuffkeys")};
	case "life_inv_oilu": {(localize "STR_Item_OilU")};
	case "life_inv_oilp": {(localize "STR_Item_OilP")};
	case "life_inv_heroinu": {(localize "STR_Item_HeroinU")};
	case "life_inv_heroinp": {(localize "STR_Item_HeroinP")};
	case "life_inv_seigle": {(localize "STR_Item_Seigle")};
	case "life_inv_lsd": {(localize "STR_Item_LSD")};
	case "life_inv_cannabis": {(localize "STR_Item_Cannabis")};
	case "life_inv_marijuana": {(localize "STR_Item_Marijuana")};
	case "life_inv_apple": {(localize "STR_Item_Apple")};
	case "life_inv_rabbit": {(localize "STR_Item_RabbitMeat")};
	case "life_inv_salema": {(localize "STR_Item_SalemaMeat")};
	case "life_inv_ornate": {(localize "STR_Item_OrnateMeat")};
	case "life_inv_mackerel": {(localize "STR_Item_MackerelMeat")};
	case "life_inv_tuna": {(localize "STR_Item_TunaMeat")};
	case "life_inv_mullet": {(localize "STR_Item_MulletMeat")};
	case "life_inv_catshark": {(localize "STR_Item_CatSharkMeat")};
	case "life_inv_turtle": {(localize "STR_Item_TurtleMeat")};
	case "life_inv_fishingpoles": {(localize "STR_Item_FishingPole")};
	case "life_inv_water": {(localize "STR_Item_WaterBottle")};
	case "life_inv_coffee": {(localize "STR_Item_Coffee")};
	case "life_inv_turtlesoup": {(localize "STR_Item_TurtleSoup")};
	case "life_inv_donuts": {(localize "STR_Item_Donuts")};
	case "life_inv_fuelE": {(localize "STR_Item_FuelE")};
	case "life_inv_fuelF": {(localize "STR_Item_FuelF")};
	case "life_inv_pickaxe": {(localize "STR_Item_Pickaxe")};
	case "life_inv_copperore": {(localize "STR_Item_CopperOre")};
	case "life_inv_ironore": {(localize "STR_Item_IronOre")};
	case "life_inv_ironr": {(localize "STR_Item_IronIngot")};
	case "life_inv_copperr": {(localize "STR_Item_CopperIngot")};
	case "life_inv_sand": {(localize "STR_Item_Sand")};
	case "life_inv_salt": {(localize "STR_Item_Salt")};
	case "life_inv_saltr": {(localize "STR_Item_SaltR")};
	case "life_inv_glass": {(localize "STR_Item_Glass")};
	case "life_inv_diamond": {(localize "STR_Item_DiamondU")};
	case "life_inv_diamondr": {(localize "STR_Item_DiamondC")};
	case "life_inv_tbacon": {(localize "STR_Item_TBacon")};
	case "life_inv_redgull": {(localize "STR_Item_RedGull")};
	case "life_inv_lockpick": {(localize "STR_Item_Lockpick")};
	case "life_inv_peach": {(localize "STR_Item_Peach")};
	case "life_inv_coke": {(localize "STR_Item_CocaineU")};
	case "life_inv_cokep": {(localize "STR_Item_CocaineP")};
	case "life_inv_spikeStrip": {(localize "STR_Item_SpikeStrip")};
	case "life_inv_rock": {(localize "STR_Item_Rock")};
	case "life_inv_cement": {(localize "STR_Item_CementBag")};
	case "life_inv_goldbar": {(localize "STR_Item_GoldBar")};
	case "life_inv_blastingcharge": {(localize "STR_Item_BCharge")};
	case "life_inv_boltcutter": {(localize "STR_Item_BCutter")};
	case "life_inv_defusekit": {(localize "STR_Item_DefuseKit")};
	case "life_inv_storagesmall": {(localize "STR_Item_StorageBS")};
	case "life_inv_storagebig": {(localize "STR_Item_StorageBL")};
	case "life_inv_mauer": {"Barrière"};
	case "life_inv_sandbag": {"Sacs de sables (droits)"};
	case "life_inv_sandbagr": {"Sacs de sables (arrondis)"};
	case "life_inv_cone": {"Cone"};
	case "life_inv_gpstracker": {"GPS Tracker"};
	case "life_inv_chicken": {"Viande de poulet"};
	case "life_inv_goat": {"Viande de chèvre"};
	case "life_inv_sheep": {"Viande de mouton"};
	case "life_inv_dog": {"Viande de chien"};
	case "life_inv_nitro": {"Injecteur Nitro"};
	case "life_inv_excavator": {"Détecteur sous marin"};
	case "life_inv_doubloon": {"Doublon d'or"};
	case "life_inv_silverpiece": {"Pièce d'argent"};
	case "life_inv_ruby": {"Rubis"};
	case "life_inv_diamondf": {"Diamant Parfait"};
	case "life_inv_pearl": {"Perle"};

	//License Block
	case "l_c_driver": {(localize "STR_License_Driver")};
	case "l_c_air": {(localize "STR_License_Pilot")};
	case "l_c_heroin": {(localize "STR_License_Heroin")};
	case "l_c_lsd": {(localize "STR_License_LSD")};
	case "l_c_oil": {(localize "STR_License_Oil")};
	case "l_c_dive": {(localize "STR_License_Diving")};
	case "l_c_boat": {(localize "STR_License_Boat")};
	case "l_c_gun": {(localize "STR_License_Firearm")};
	case "l_g_air": {(localize "STR_License_Pilot")};
	case "l_g_swat": {(localize "STR_License_Swat")};
	case "l_g_cg": {(localize "STR_License_CG")};
	case "l_g_bacpj": {(localize "STR_License_BacPJ")};
	case "l_g_medic": {(localize "STR_License_OMedic")};
	case "l_g_aprg": {"Licence APRG"};
	case "l_c_rebel": {(localize "STR_License_Rebel")};
	case "l_c_thug": {(localize "STR_License_Thug")};
	case "l_c_truck": {(localize "STR_License_Truck")};
	case "l_c_diamond": {(localize "STR_License_Diamond")};
	case "l_c_copper": {(localize "STR_License_Copper")};
	case "l_c_iron": {(localize "STR_License_Iron")};
	case "l_c_sand": {(localize "STR_License_Sand")};
	case "l_c_salt": {(localize "STR_License_Salt")};
	case "l_c_coke": {(localize "STR_License_Cocaine")};
	case "l_c_marijuana": {(localize "STR_License_Marijuana")};
	case "l_c_cement": {(localize "STR_License_Cement")};
	case "l_m_air": {(localize "STR_License_Pilot")};
	case "l_c_home": {(localize "STR_License_Home")};
	case "l_c_gvt": {(localize "STR_License_Gvt")};
	case "l_c_vigil": {(localize "STR_License_Vigil")};
	case "l_c_dep": {"Licence de dépanneur"};
	case "l_c_hunting": {"Licence de chasseur"};
	case "l_c_taxi": {"Licence de taxi"};
	case "l_c_airsoft": {"Licence d'airsoft"};
	default {"Erreur"};
};
