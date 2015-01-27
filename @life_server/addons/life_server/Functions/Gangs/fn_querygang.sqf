/*
	File: fn_querygang.sqf
	Author: havena
	
	Description:
	querygang
*/
private["_uid","_ret"];

_uid = [_this,0,"",[""]] call BIS_fnc_param;
_unitid = [_this,1,-1,[0]] call BIS_fnc_param;

if(_unitid == -1) exitWith {};

_gangData = _uid spawn TON_fnc_queryPlayerGang;
waitUntil{scriptDone _gangData};
_ret = missionNamespace getVariable[format["gang_%1",_uid],[]];

[[_ret],"life_fnc_initGang",_unitid,false] spawn life_fnc_MP;
