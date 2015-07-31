/*
	File: fn_shutBalise.sqf
	Author: Youri
	
	Description:
	Coupe ou remet la balise d'un flic
*/
if(playerSide != west) exitWith {};
private ["_mode"];
_mode = _this select 0;

switch (_mode) do
{
	case "off":
	{
		player setVariable ["balise_off",true,true];
	};
	case "on":
	{
		player setVariable ["balise_off",false,true];
	};
};