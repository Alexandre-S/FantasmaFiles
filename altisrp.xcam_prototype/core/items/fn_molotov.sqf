/*
	File: fn_molotov.sqf
	Author: Matthias Bun

	Description:
	Handles the Molotov Cocktails
*/
private["_pos","_fire"];
_pos = [_this,0,[],[[]]] call BIS_fnc_param;
if(count _pos == 0) exitWith {}; //Badddd

_fire = "test_EmptyObjectForFireBig" createVehicle _pos;

sleep 10;
{if (typeOf _x == "#particlesource") then {deleteVehicle _x}} forEach ((position _fire) nearObjects 5);  