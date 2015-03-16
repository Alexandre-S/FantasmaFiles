/*
	File: fn_marijuana.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Marijuana is bad, mmkay?
*/

private ["_item"];

_item = _this select 0;

if (!([false,_item,1] call life_fnc_handleInv)) exitWith {};

life_drug_level = life_drug_level + 0.05;
if (life_drug_level > 1) then { life_drug_level = 1; };
hint "C'est d'la bonne ?a poto !";
[_item] call life_fnc_drugUsed;

if (!life_smoking) then
{
	life_smoking = true;
	player setFatigue 0.75;
	player enableFatigue false;
	[[player],"life_fnc_attachSmoke",true,false] spawn life_fnc_MP;
	uiSleep 180;
	life_smoking = false;
	player enableFatigue true;
};