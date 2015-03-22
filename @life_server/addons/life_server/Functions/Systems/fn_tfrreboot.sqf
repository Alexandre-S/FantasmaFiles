/*
	File: fn_tfrreboot.sqf
	Author: Havena
	
	Description:
	reboot tfr
*/
private["_query","_result","_uid"];

_uid = [_this,0,"",[""]] call BIS_fnc_param;

if(_uid == "") exitWith {}; //If null / dead exit menu

_query = format["UPDATE players SET tfr='0' WHERE playerid='%1'",_uid];
waitUntil {sleep (random 0.3); !DB_Async_Active};
_result = [_query,1] call DB_fnc_asyncCall;