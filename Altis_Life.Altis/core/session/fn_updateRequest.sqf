/*
	File: fn_updateRequest.sqf
	Author: Tonic
*/
private["_packet","_array","_flag"];
_packet = [getPlayerUID player,(profileName),playerSide,life_cash,life_atmcash];
_array = [];
_flag = switch(playerSide) do {case west: {"cop"}; case civilian: {"civ"}; case independent: {"med"};};
{
	if(_x select 1 == _flag) then
	{
		_array pushBack [_x select 0,(missionNamespace getVariable (_x select 0))];
	};
} foreach life_licenses;
_packet pushBack _array;

[] call life_fnc_saveGear;
_packet pushBack life_gear;

_packet pushBack (getPosATL player);

if((player getVariable["Revive",true]) && alive player) then {life_is_alive = true;} else {life_is_alive = false;};
//diag_log format ["DEBUG CLIENT UPDATE %1, %2", player getVariable["Revive",false], alive player];
_packet pushBack life_is_alive;

switch (playerSide) do {
	case civilian: {
		_packet pushBack life_is_arrested;
	};
};

[] call life_fnc_getHLC;
[_packet,"DB_fnc_updateRequest",serverhc,false] spawn life_fnc_MP;