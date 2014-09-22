/*
	File: fn_vehBeep.sqf
	Author: Oshydaka
	
	Description:
	Beep quand unlock
*/
private["_vehicle"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

if(isNull _vehicle) exitWith {};
_source say3D "Tazersound";