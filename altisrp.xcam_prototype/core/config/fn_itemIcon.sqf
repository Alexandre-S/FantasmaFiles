/*
	File: fn_itemIcon.sqf
	Author: EdgeKiller

	Description:
	Return the icon for each altis life item.
*/
private["_var"];
_var = [_this,0,"",[""]] call BIS_fnc_param;
if(_var == "") exitWith {""};

switch (_var) do
{
	//Virtual Inventory Items
	// case "life_inv_handcuffs": {("altisrpfr\icons\items\handcuffs.paa")};
	// case "life_inv_handcuffkeys": {("altisrpfr\icons\items\handcuffkeys.paa")};
	case "life_inv_oilu": {("altisrpfr\icons\items\oil_unprocessed.paa")};
	case "life_inv_oilp": {("altisrpfr\icons\items\oil_processed.paa")};
	case "life_inv_heroinu": {("altisrpfr\icons\items\heroin_unprocessed.paa")};
	case "life_inv_heroinp": {("altisrpfr\icons\items\heroin_processed.paa")};
	case "life_inv_cannabis": {("altisrpfr\icons\items\cannabis.paa")};
	case "life_inv_marijuana": {("altisrpfr\icons\items\marijuana.paa")};
	case "life_inv_apple": {("altisrpfr\icons\items\apple.paa")};
	case "life_inv_rabbit": {("altisrpfr\icons\items\meat.paa")};
	case "life_inv_salema": {("altisrpfr\icons\items\fish.paa")};
	case "life_inv_ornate": {("altisrpfr\icons\items\fish.paa")};
	case "life_inv_mackerel": {("altisrpfr\icons\items\fish.paa")};
	case "life_inv_tuna": {("altisrpfr\icons\items\fish.paa")};
	case "life_inv_mullet": {("altisrpfr\icons\items\fish.paa")};
	case "life_inv_catshark": {("altisrpfr\icons\items\fish.paa")};
	case "life_inv_turtle": {("altisrpfr\icons\items\turtle.paa")};
	case "life_inv_fishingpoles": {("altisrpfr\icons\items\fishingpoles.paa")};
	case "life_inv_water": {("altisrpfr\icons\items\water.paa")};
	case "life_inv_coffee": {("altisrpfr\icons\items\coffee.paa")};
	case "life_inv_turtlesoup": {("altisrpfr\icons\items\turtle_soup.paa")};
	case "life_inv_donuts": {("altisrpfr\icons\items\donut.paa")};
	case "life_inv_fuelE": {("altisrpfr\icons\items\fuel_can.paa")};
	case "life_inv_fuelF": {("altisrpfr\icons\items\fuel_can.paa")};
	case "life_inv_pickaxe": {("altisrpfr\icons\items\pickaxe.paa")};
	case "life_inv_copperore": {("altisrpfr\icons\items\copper_ore.paa")};
	case "life_inv_ironore": {("altisrpfr\icons\items\iron_ore.paa")};
	case "life_inv_ironr": {("altisrpfr\icons\items\iron.paa")};
	case "life_inv_copperr": {("altisrpfr\icons\items\copper.paa")};
	case "life_inv_sand": {("altisrpfr\icons\items\sand.paa")};
	case "life_inv_salt": {("altisrpfr\icons\items\salt_unprocessed.paa")};
	case "life_inv_saltr": {("altisrpfr\icons\items\salt.paa")};
	case "life_inv_glass": {("altisrpfr\icons\items\glass.paa")};
	case "life_inv_diamond": {("altisrpfr\icons\items\diamond_unprocessed.paa")};
	case "life_inv_diamondr": {("altisrpfr\icons\items\diamond.paa")};
	case "life_inv_tbacon": {("altisrpfr\icons\items\meat.paa")};
	case "life_inv_redgull": {("altisrpfr\icons\items\redgull.paa")};
	case "life_inv_lockpick": {("altisrpfr\icons\items\lockpick.paa")};
	case "life_inv_peach": {("altisrpfr\icons\items\peach.paa")};
	case "life_inv_coke": {("altisrpfr\icons\items\cocain_unprocessed.paa")};
	case "life_inv_cokep": {("altisrpfr\icons\items\cocain_processed.paa")};
	case "life_inv_spikeStrip": {("altisrpfr\icons\items\spikestrip.paa")};
	case "life_inv_rock": {("altisrpfr\icons\items\rock.paa")};
	case "life_inv_cement": {("altisrpfr\icons\items\cement.paa")};
	case "life_inv_goldbar": {("altisrpfr\icons\items\goldbar.paa")};
	case "life_inv_blastingcharge": {("altisrpfr\icons\items\blastingcharge.paa")};
	case "life_inv_boltcutter": {("altisrpfr\icons\items\boltcutter.paa")};
	case "life_inv_defusekit": {("altisrpfr\icons\items\defusekit.paa")};
	case "life_inv_storagesmall": {("altisrpfr\icons\items\storagesmall.paa")};
	case "life_inv_storagebig": {("altisrpfr\icons\items\storagebig.paa")};
	case "life_inv_mauer": {("altisrpfr\icons\items\mauer.paa")};
	case "life_inv_sandbag": {("altisrpfr\icons\items\sandbag.paa")};
	case "life_inv_sandbagr": {("altisrpfr\icons\items\sandbag.paa")};
	case "life_inv_cone": {("altisrpfr\icons\items\cone.paa")};
	case "life_inv_chicken": {("altisrpfr\icons\items\meat.paa")};
	case "life_inv_goat": {("altisrpfr\icons\items\meat.paa")};
	case "life_inv_sheep": {("altisrpfr\icons\items\meat.paa")};
	case "life_inv_dog": {("altisrpfr\icons\items\meat.paa")};
	case "life_inv_nitro": {("altisrpfr\icons\items\nos.paa")};
	case "life_inv_excavator": {("altisrpfr\icons\items\excavator.paa")};
	case "life_inv_doubloon": {("altisrpfr\icons\items\doubloon.paa")};
	case "life_inv_silverpiece": {("altisrpfr\icons\items\silverpiece.paa")};
	case "life_inv_ruby": {("altisrpfr\icons\items\ruby.paa")};
	case "life_inv_diamondf": {("altisrpfr\icons\items\diamant_parfait.paa")};
	case "life_inv_pearl": {("altisrpfr\icons\items\pearl.paa")};
	default {("altisrpfr\icons\items\blank.paa")};
};