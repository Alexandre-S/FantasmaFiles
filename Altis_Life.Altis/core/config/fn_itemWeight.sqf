/*
	File: fn_itemWeight.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gets the items weight and returns it.
*/
private["_item"];
_item = [_this,0,"",[""]] call BIS_fnc_param;
if(_item == "") exitWith {};

switch (_item) do
{
	// case "handcuffs": {2};
	// case "handcuffkeys": {1};
	case "oilu": {5};
	case "oilp": {4};
	case "gazu": {3};
	case "gazp": {2};
	case "heroinu": {3};
	case "heroinp": {2};
	case "seigle": {3};
	case "lsd": {2};
	case "cannabis": {3};
	case "marijuana": {2};
	case "apple": {1};
	case "water": {1};
	case "rabbit": {1};
	case "salema": {2};
	case "ornate": {2};
	case "mackerel": {4};
	case "tuna": {4};
	case "mullet": {4};
	case "catshark": {6};
	case "turtle": {5};
	case "fishing": {2};
	case "turtlesoup": {2};
	case "donuts": {1};
	case "coffee": {1};
	case "fuelE": {2};
	case "fuelF": {5};
	case "money": {0};
	case "pickaxe": {2};
	case "copperore": {4};
	case "ironore": {5};
	case "copper_r": {3};
	case "iron_r": {3};
	case "sand": {3};
	case "salt": {4};
	case "salt_r": {3};
	case "glass": {2};
	case "diamond": {4};
	case "diamondc": {3};
	case "cocaine": {3};
	case "cocainep": {2};
	case "spikeStrip": {15};
	case "rock": {6};
	case "cement": {5};
	case "goldbar": {12};
	case "blastingcharge": {15};
	case "boltcutter": {5};
	case "defusekit": {2};
	case "storagesmall": {5};
	case "storagebig": {10};
	case "mauer": {1};
	case "sandbag": {1};
	case "sandbagr": {1};
	case "cone": {1};
	case "gpstracker": {2};
	case "chicken": {1};
	case "goat": {1};
	case "sheep": {1};
	case "dog": {1};
	case "nitro": {5};
	case "excavator": {1};
	case "doubloon": {2};
	case "silverpiece": {2};
	case "ruby": {2};
	case "diamondf": {2};
	case "pearl": {2};
	case "rye": {2};
	case "hops": {2};
	case "yeast": {2};
	case "cornmeal": {2};
	case "mash": {2};
	case "whiskey": {4};
	case "beerp": {4};
	case "moonshine": {5};
	case "bottledwhiskey": {5};
	case "bottledbeer": {5};
	case "bottledshine": {5};
	case "bottles": {1};
	default {1};
};
