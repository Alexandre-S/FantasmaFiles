/*
	File: fn_vehBeep.sqf
	Author: Oshydaka
	
	Description:
	Beep quand unlock
*/
private["_source "];
_source = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _source) exitWith {};
_source say3D "Beep";
