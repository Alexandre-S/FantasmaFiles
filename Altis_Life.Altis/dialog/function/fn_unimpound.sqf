#include <macro.h>
/*
	File: fn_unimpound.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Yeah... Gets the vehicle from the garage.
*/
private["_vehicle","_vid","_pid","_unit","_price"];
disableSerialization;
if(lbCurSel 2802 == -1) exitWith {hint localize "STR_Global_NoSelection"};
_vehicle = lbData[2802,(lbCurSel 2802)];
_vehicle = (call compile format["%1",_vehicle]) select 0;
_vid = lbValue[2802,(lbCurSel 2802)];
_pid = getPlayerUID player;
_unit = player;

if(isNil "_vehicle") exitWith {hint localize "STR_Garage_Selection_Error"};

_price = [_vehicle,__GETC__(life_garage_prices)] call life_fnc_index;
if(_price == -1) then {_price = 1000;} else {_price = (__GETC__(life_garage_prices) select _price) select 1;};

_price = ceil(_price - (((__GETC__(life_donator) * 5) / 100) * _price));

if(playerSide == west) then { _price = 1; };
if(playerSide == independent) then { _price = 100; };
// if(l_c_dep && _vehicle == "I_Heli_Transport_02_F_RP") then {
	// _price = _price/10;
// };

if(life_atmcash < _price) exitWith {hint format[(localize "STR_Garage_CashError"),[_price] call life_fnc_numberText];};

if(typeName life_garage_sp == "ARRAY") then {
	[] call life_fnc_getHLC;
	[[_vid,_pid,life_garage_sp select 0,_unit,_price,life_garage_sp select 1,havena_id],"TON_fnc_spawnVehicle",serverhc,false] spawn life_fnc_MP;
} else {
	if(life_garage_sp in ["medic_spawn_1","medic_spawn_2","medic_spawn_3"]) then {
		[] call life_fnc_getHLC;
		[[_vid,_pid,life_garage_sp,_unit,_price,0,havena_id],"TON_fnc_spawnVehicle",serverhc,false] spawn life_fnc_MP;
	} else {
		[] call life_fnc_getHLC;
		[[_vid,_pid,(getMarkerPos life_garage_sp),_unit,_price,markerDir life_garage_sp,havena_id],"TON_fnc_spawnVehicle",serverhc,false] spawn life_fnc_MP;
	};
};

hint localize "STR_Garage_SpawningVeh";

life_atmcash = life_atmcash - _price;
closeDialog 0;
