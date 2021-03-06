/*
	File: fn_useItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main function for item effects and functionality through the player menu.
*/
private["_item"];
disableSerialization;
if((lbCurSel 2005) == -1) exitWith {hint localize "STR_ISTR_SelectItemFirst";};
_item = lbData[2005,(lbCurSel 2005)];

switch (true) do
{
	case (_item == "water" or _item == "coffee"):
	{
		if(underwater player) exitWith { hint "Vous devez remonter à la surface pour pouvoir vous rafraîchir."; };
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			playSound "drink";
			life_thirst = 100;
			player setFatigue 0;
		};
	};
	
	case (_item == "boltcutter" && !life_boltcutter_uses): {
		life_boltcutter_uses = true;
		_handle = [cursorTarget] spawn life_fnc_boltcutter;
		closeDialog 0;
		waitUntil {sleep 0.1; scriptDone _handle};
		life_boltcutter_uses = false;
	};
	
	case (_item == "blastingcharge"): {
		player reveal fed_bank;
		(group player) reveal fed_bank;
		[cursorTarget] spawn life_fnc_blastingCharge;
	};
	
	case (_item == "defusekit"): {
		[cursorTarget] spawn life_fnc_defuseKit;
	};

	case (_item == "excavator"):
	{
		closeDialog 0;
		[] spawn life_fnc_searchWreck;
	};
	
	case (_item in ["storagesmall","storagebig"]): {
		[_item] call life_fnc_storageBox;
	};
	
	case (_item == "redgull"):
	{
		if(underwater player) exitWith { hint "Vous devez remonter à la surface pour pouvoir vous rafraîchir."; };
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			playSound "soda";
			life_thirst = 100;
			player setFatigue 0;
			[] spawn
			{
				life_redgull_effect = time;
				titleText[localize "STR_ISTR_RedGullEffect","PLAIN"];
				player enableFatigue false;
				waitUntil {sleep 1; !alive player OR ((time - life_redgull_effect) > (3 * 60))};
				player enableFatigue true;
			};
		};
	};
	
	case (_item == "spikeStrip"):
	{
		if(!isNull life_spikestrip) exitWith {hint localize "STR_ISTR_SpikesDeployment"};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_spikeStrip;
		};
	};
	
	case (_item == "fuelF"):
	{
		if(vehicle player != player) exitWith {hint localize "STR_ISTR_RefuelInVehicle"};
		[] spawn life_fnc_jerryRefuel;
	};
	
	case (_item == "lockpick"):
	{
		[] spawn life_fnc_lockpick;
	};
	
	case (_item in ["apple","rabbit","salema","ornate","mackerel","tuna","mullet","catshark","turtle","turtlesoup","donuts","tbacon","peach","sheep","chicken","goat"]):
	{
		[_item] call life_fnc_eatFood;
	};

	/*case (_item == "pickaxe"):
	{
		[] spawn life_fnc_pickAxeUse;
	};*/
	
	case (_item == "mauer"):
	{
		if(!isNull life_mauer) exitWith {hint "Vous avez déjà une barrière!"};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_mauer;
		};
	};
	
	case (_item == "sandbag"):
	{
		if(!isNull life_sandbag) exitWith {hint "Vous avez un sac de sable (droit)!"};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_sandbag;
		};
	};
	
	case (_item == "sandbagr"):
	{
		if(!isNull life_sandbagr) exitWith {hint "Vous avez un sac de sable (arrondi)!"};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_sandbagr;
		};
	};
	
	case (_item == "cone"):
	{
		if(!isNull life_cone) exitWith {hint "Vous avez déjà un cone!"};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			closedialog 0;
			[] spawn life_fnc_cone;
		};
	};
	
	case (_item == "gpstracker"): 
	{
		[cursorTarget] spawn life_fnc_gpsTracker;
	}; 
	
	case (_item == "marijuana"):
	{
		[_item] spawn life_fnc_marijuana;
	};
	
	case (_item == "cocainep"):
	{
		[] spawn life_fnc_cocaine;
	};
	
	case (_item == "heroinp"):
	{
		[] spawn life_fnc_heroin;
	};
	
	case (_item == "lsd"):
	{
		[] spawn life_fnc_lsd;
	};
		
	case (_item == "nitro"):
	{
		[] spawn life_fnc_nitro;
	};
	
	case (_item =="bottledwhiskey"):
	{
		if((player getVariable ["inDrink",FALSE])) exitWith {hint localize "STR_MISC_AlreadyDrinking";};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			if(isNil "life_drink") then {life_drink = 0;};
			life_drink = life_drink + 0.10;
			//if (life_drink < 0.07) exitWith {};
			[] spawn life_fnc_drinkwhiskey;
		};
	};
	
	case (_item =="bottledshine"):
	{
		if((player getVariable ["inDrink",FALSE])) exitWith {hint localize "STR_MISC_AlreadyDrinking";};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			if(isNil "life_drink") then {life_drink = 0;};
			life_drink = life_drink + 0.15;
			//if (life_drink < 0.09) exitWith {};
			[] spawn life_fnc_drinkmoonshine;
		};
	};
	
	case (_item =="bottledbeer"):
	{
		if((player getVariable ["inDrink",FALSE])) exitWith {hint localize "STR_MISC_AlreadyDrinking";};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			if(isNil "life_drink") then {life_drink = 0;};
			life_drink = life_drink + 0.05;
			//if (life_drink < 0.06) exitWith {};
			[] spawn life_fnc_drinkbeer;
		};
	};
	
	default
	{
		hint localize "STR_ISTR_NotUsable";
	};
};
	
[] call life_fnc_p_updateMenu;
[] call life_fnc_hudUpdate;