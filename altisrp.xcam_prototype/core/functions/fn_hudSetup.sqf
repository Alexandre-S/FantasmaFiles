if(isServer OR !hasInterface) exitwith {};
/*
	File: fn_hudSetup.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Setups the hud for the player?
*/
private["_display","_alpha","_version","_p","_pg"];
disableSerialization;
_display = findDisplay 46;
_alpha = _display displayCtrl 1001;
_version = _display displayCtrl 1000;

2 cutRsc ["playerHUD","PLAIN"];
_version ctrlSetText format["BETA: 0.%1.%2",(productVersion select 2),(productVersion select 3)];
[] call life_fnc_hudUpdate;

[] spawn
{
	sleep 1;
	private["_dam","_cash","_volumelvl"];
	while {true} do
	{
		_dam = damage player;
		_cash  = life_cash;
		if(isnil "TF_speak_volume_level") then {_volumelvl = "normal"; } else {	_volumelvl = TF_speak_volume_level;	};
		waitUntil {sleep 0.1; ((damage player) != _dam || _cash != life_cash || _volumelvl != TF_speak_volume_level)};
		[] call life_fnc_hudUpdate;
	};
};