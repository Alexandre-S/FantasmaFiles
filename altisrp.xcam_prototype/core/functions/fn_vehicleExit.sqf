/*
	File: fn_vehicleExit.sqf
	Author: Havena
	
	Description: 
*/
private["_vehicle","_position","_unit","_isTrans"];
_vehicle = _this select 0;
_position = _this select 1;
_unit = _this select 2;

_vehicle setVariable["idleTime",time,true];