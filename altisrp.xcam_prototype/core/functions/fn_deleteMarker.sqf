/*
	File: fn_createMarker.sqf
	Author: Havena
	
	Description:
	Del a maker to the map locally
*/
Private["_playerName","_prefix"];
_playerName = [_this,0,"",[""]] call BIS_fnc_param;
_prefix = [_this,1,"COMA",["COMA"]] call BIS_fnc_param;

_playerName = format["%2%1", _playerName, _prefix];

deleteMarkerLocal _playerName;
