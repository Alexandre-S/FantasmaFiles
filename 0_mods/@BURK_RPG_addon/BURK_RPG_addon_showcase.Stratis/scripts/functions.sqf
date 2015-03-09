/*
	File: BURK_RPG_addon_showcase.Stratis\scripts\functions.sqf

	Author: Burkhar
	
	Description: Functions for item related actions.

	BURK RPG addon: Showcase
*/

// Filling empty bottle(s)
BURK_fnc_actBottleFill = {
	private ["_plr", "_plrLtrs"];

	_plr = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
	
	_plr setVariable ["BURK_plrBusy", true, true];
	
	cutText [format ['%1 is filling bottle(s) with water...', profileName], "PLAIN DOWN"];
	
	sleep 2;
	
	cutText [format ['%1 filled bottle(s) with water...', profileName], "PLAIN DOWN"];
	
	_plrLtrs = _plr getVariable "BURK_plr_bottleLtrs";

	{
		if (_x == "BURK_itemBottleEmpty") then {
			_plr removeItem "BURK_itemBottleEmpty";
			_plr addItem "BURK_itemBottle";

			_plrLtrs = _plrLtrs + 0.33;
		};
	} forEach items _plr;
	
	_plr setVariable ["BURK_plr_bottleLtrs", _plrLtrs];
	
	_plr setVariable ["BURK_plrBusy", nil, true];	
};

// Drinking from bottle
BURK_fnc_actBottleDrink = {
	private ["_plr", "_plrLtrs"];

 	_plr = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
	
	_plr setVariable ["BURK_plrBusy", true, true];
	
	cutText [format ['%1 is drinking bottle of water...', profileName], "PLAIN DOWN"];

	sleep 2;
	
	cutText [format ['%1 drank bottle of water...', profileName], "PLAIN DOWN"];
	
	_plr removeItem "BURK_itemBottle";
	_plr addItem "BURK_itemBottleEmpty";

	_plr setVariable ["BURK_plr_bottleLtrs", (_plr getVariable "BURK_plr_bottleLtrs") - 0.33];
	_plr setVariable ["BURK_plr_drankLtrs", (_plr getVariable "BURK_plr_drankLtrs") + 0.33];
	
	_plr setVariable ["BURK_plrBusy", nil, true];	
};

// Filling empty canteen(s)
BURK_fnc_actCanteenFill = {
	private ["_plr", "_plrLtrs"];

	_plr = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
	
	_plr setVariable ["BURK_plrBusy", true, true];
	
	cutText [format ['%1 is filling canteen(s) with water...', profileName], "PLAIN DOWN"];

	sleep 2;

	cutText [format ['%1 filled canteen(s) with water...', profileName], "PLAIN DOWN"];

	_plrLtrs = _plr getVariable "BURK_plr_canteenLtrs";
	
	{
		if (_x == "BURK_itemCanteenEmpty") then {
			_plr removeItem "BURK_itemCanteenEmpty";
			_plr addItem "BURK_itemCanteen";

			_plrLtrs = _plrLtrs + 1;
		};
	} forEach items _plr;	

	_plr setVariable ["BURK_plr_canteenLtrs", _plrLtrs];

	_plr setVariable ["BURK_plrBusy", nil, true];	
};

// Drinking from canteen
BURK_fnc_actCanteenDrink = {
	private ["_plr", "_plrLtrs"];

	_plr = [_this, 0, objNull, [objNull]] call BIS_fnc_param;

	_plr setVariable ["BURK_plrBusy", true, true];

	cutText [format ['%1 is drinking canteen of water...', profileName], "PLAIN DOWN"];
	
	sleep 2;

	cutText [format ['%1 drank canteen of water...', profileName], "PLAIN DOWN"];	

	_plr removeItem "BURK_itemCanteen";
	_plr addItem "BURK_itemCanteenEmpty";

	_plr setVariable ["BURK_plr_canteenLtrs", (_plr getVariable "BURK_plr_canteenLtrs") - 1];
	_plr setVariable ["BURK_plr_drankLtrs", (_plr getVariable "BURK_plr_drankLtrs") + 1];

	_plr setVariable ["BURK_plrBusy", nil, true];	
};

// Using cellphone
BURK_fnc_actUseCellphone = {
	private ["_plr"];

	_plr = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
	
	cutText [format ['%1 is using cellphone...', profileName], "PLAIN DOWN"];
};

// Using smartphone
BURK_fnc_actUseSmartphone = {
	private ["_plr"];

	_plr = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
	
	cutText [format ['%1 is using smartphone...', profileName], "PLAIN DOWN"];
};