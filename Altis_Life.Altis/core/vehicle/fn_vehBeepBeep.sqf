/*
	File: fn_vehBeepBeep.sqf
	Author: Oshydaka
	
	Description:
	BeepBeep quand lock
*/
private["_vehicle"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

if(isNull _vehicle) exitWith {};
_source say3D "BeepBeep";