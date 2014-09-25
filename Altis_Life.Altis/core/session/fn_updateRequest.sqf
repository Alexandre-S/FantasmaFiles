/*
	File: fn_updateRequest.sqf
	Author: Tonic
*/
private["_packet","_array","_flag","_position"];
_packet = [getPlayerUID player,(profileName),playerSide,life_cash,life_atmcash];
_array = [];
_flag = switch(playerSide) do {case west: {"cop"}; case civilian: {"civ"}; case independent: {"med"};};
_position = getPosATL player;
{
	if(_x select 1 == _flag) then
	{
		_array pushBack [_x select 0,(missionNamespace getVariable (_x select 0))];
	};
} foreach life_licenses;
_packet pushBack _array;

[] call life_fnc_saveGear;
_packet pushBack life_gear;

_packet pushBack _position;

if(!(player getVariable["Revive",false]) || !alive player) then {life_is_alive = false;};
_packet pushBack life_is_alive;

switch (playerSide) do {
	case civilian: {
		_packet pushBack life_is_arrested;
	};
};

[_packet,"DB_fnc_updateRequest",false,false] spawn life_fnc_MP;