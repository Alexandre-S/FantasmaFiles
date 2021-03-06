#include <macro.h>
/*
	File: fn_sellGarage.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sells a vehicle from the garage.
*/
private["_vehicle","_vid","_pid","_unit","_price"];
disableSerialization;
if(lbCurSel 2802 == -1) exitWith {hint localize "STR_Global_NoSelection"};
_vehicle = lbData[2802,(lbCurSel 2802)];
_vehicle = (call compile format["%1",_vehicle]) select 0;
_vid = lbValue[2802,(lbCurSel 2802)];
_pid = getPlayerUID player;
_unit = player;

if (life_action_inUse) exitWith {}; // prevent duping
if(isNil "_vehicle") exitWith {hint localize "STR_Garage_Selection_Error"};

life_action_inUse = true; // duping fix
_price = [_vehicle,__GETC__(life_garage_sell)] call life_fnc_index;
if(_price == -1) then {_price = 1000;} else {_price = (__GETC__(life_garage_sell) select _price) select 1;};
//vente donator
_price = ceil(_price + (((__GETC__(life_donator) * 5) / 100) * _price));
if(playerSide == west) then { _price = 1; };
if(playerSide == independent) then { _price = 100; };

[] call life_fnc_getHLC;
[[_vid,_pid,_price,player,life_garage_type],"TON_fnc_vehicleDelete",serverhc,false] spawn life_fnc_MP;
hint format[localize "STR_Garage_SoldCar",[_price] call life_fnc_numberText];
life_cash = life_cash + _price;
[0] call SOCK_fnc_updatePartial;

life_action_inUse = false; // duping fix
closeDialog 0;