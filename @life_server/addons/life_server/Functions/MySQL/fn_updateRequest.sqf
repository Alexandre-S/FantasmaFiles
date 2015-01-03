/*
	File: fn_updateRequest.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Ain't got time to describe it, READ THE FILE NAME!
*/
private["_uid","_side","_cash","_bank","_licenses","_gear","_name","_query","_thread","_position","_alive","_thirst","_hunger","_damage"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_name = [_this,1,"",[""]] call BIS_fnc_param;
_side = [_this,2,sideUnknown,[civilian]] call BIS_fnc_param;
_cash = [_this,3,0,[0]] call BIS_fnc_param;
_bank = [_this,4,5000,[0]] call BIS_fnc_param;
_licenses = [_this,5,[],[[]]] call BIS_fnc_param;
_gear = [_this,6,[],[[]]] call BIS_fnc_param;

_position = [_this,7,""] call BIS_fnc_param;
_alive = [_this select 8] call DB_fnc_bool;

_hunger = [_this,9,0,[0]] call BIS_fnc_param;
_thirst = [_this,10,0,[0]] call BIS_fnc_param;
_damage = [_this,11,0,[0]] call BIS_fnc_param;

//Get to those error checks.
if((_uid == "") OR (_name == "")) exitWith {};

//Parse and setup some data.
_name = [_name] call DB_fnc_mresString;
_gear = [_gear] call DB_fnc_mresArray;
_cash = [_cash] call DB_fnc_numberSafe;
_bank = [_bank] call DB_fnc_numberSafe;
_position = [_position] call DB_fnc_mresArray;

//Does something license related but I can't remember I only know it's important?
for "_i" from 0 to count(_licenses)-1 do {
	_bool = [(_licenses select _i) select 1] call DB_fnc_bool;
	_licenses set[_i,[(_licenses select _i) select 0,_bool]];
};

_licenses = [_licenses] call DB_fnc_mresArray;

switch (_side) do {
	case west: {_query = format["UPDATE players SET name='%1', cash='%2', bankacc='%3', cop_gear='%4', cop_licenses='%5', position='%7', alive='%8', hunger='%9', thirst='%10', damage='%11' WHERE playerid='%6'",_name,_cash,_bank,_gear,_licenses,_uid,_position,_alive,_hunger,_thirst,_damage];};
	case civilian: {_query = format["UPDATE players SET name='%1', cash='%2', bankacc='%3', civ_licenses='%4', civ_gear='%6', arrested='%7', position='%8', alive='%9', hunger='%10', thirst='%11', damage='%12' WHERE playerid='%5'",_name,_cash,_bank,_licenses,_uid,_gear,[_this select 12] call DB_fnc_bool,_position,_alive,_hunger,_thirst,_damage];};
	case independent: {_query = format["UPDATE players SET name='%1', cash='%2', bankacc='%3', med_licenses='%4', med_gear='%6', position='%7', alive='%8', hunger='%9', thirst='%10', damage='%11' WHERE playerid='%5'",_name,_cash,_bank,_licenses,_uid,_gear,_position,_alive,_hunger,_thirst,_damage];};
};

waitUntil {sleep (random 0.3); !DB_Async_Active};
_queryResult = [_query,1] call DB_fnc_asyncCall;