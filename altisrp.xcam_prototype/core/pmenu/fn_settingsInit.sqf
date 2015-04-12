/*
	File: fn_settingsInit.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initializes key parts for the Settings menu for View distance and other stuff.
*/
// tawvd_foot = viewDistance;
// tawvd_car = viewDistance;
// tawvd_air = viewDistance;
tawvd_foot = havena_minview;
tawvd_car = 400;
tawvd_air = 1000;
tawvd_addon_disable = true;

[] spawn
{
	private["_recorded"];
	while {true} do
	{
		_recorded = vehicle player;
		[] call life_fnc_updateSound;
		[] call life_fnc_updateViewDistance;
		waitUntil {sleep 1; _recorded != vehicle player || !alive player};
		/*if(vehicle player != _recorded OR !alive player) then {
 			[] call life_fnc_updateViewDistance;
 		};
 		sleep 2.2;*/
	};
};