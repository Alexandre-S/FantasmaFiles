/*
	File: fn_delveh.sqf
*/
private["_veh"];
_veh = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _veh) exitWith {};

if(local _veh) then {
	deleteVehicle _veh;
};