#include <macro.h>
/*
	File: fn_initCop.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Cop Initialization file.
*/
private["_end","_slotpremium","_playerCount"];
player addRating 9999999;
waitUntil {!(isNull (findDisplay 46))};
_end = false;
/*if(life_blacklisted) exitWith
{
	["Blacklisted",false,true] call BIS_fnc_endMission;
	sleep 30;
};*/

//diag_log format["%1 - %2",__GETC__(life_coplevel),__GETC__(life_donator)];

_slotpremium = ["cop_16","cop_17","cop_18","cop_19","cop_20","cop_21","cop_22","cop_23","cop_24","cop_25","cop_26","cop_27","cop_28","cop_29","cop_30"];

if(str(player) in ["cop_1","cop_2","cop_3","cop_4","cop_5","cop_6","cop_7","cop_8","cop_9","cop_10","cop_11","cop_12","cop_13","cop_14","cop_15"]) then {
	if(__GETC__(life_coplevel) == 0) then {
		player enableSimulation false;
		["NotCop",false,true] call BIS_fnc_endMission;
		sleep 35;
	};
	_playerCount = {!(isPlayer _x)} count _slotpremium;

	if(__GETC__(life_donator) > 0 && {_playerCount > 2}) then
	{
		player enableSimulation false;
		["IsPremium",false,true] call BIS_fnc_endMission;
		sleep 35;
	};
};
if(str(player) in _slotpremium) then {
	if(__GETC__(life_coplevel) == 0) then {
		player enableSimulation false;
		["NotCop",false,true] call BIS_fnc_endMission;
		sleep 35;
	};
	if((__GETC__(life_coplevel) != 0) && (__GETC__(life_donator) == 0)) then {
		player enableSimulation false;
		["NotPremium",false,true] call BIS_fnc_endMission;
		sleep 35;
	};
};
if(face player in life_women && !life_sexe) then
{
	player enableSimulation false;
	["NotFemale",false,true] call BIS_fnc_endMission;
	sleep 35;
};

player setVariable["rank",(__GETC__(life_coplevel)),true];

if (!life_is_alive || (count life_position) == 0) then
{
	[] call life_fnc_spawnMenu;
	waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
	waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
	//life_is_alive = true; // Just in-case the player disconnects before choosing a spawn position I guess? Otherwise debug island it is!
}	
else 
{
	player setPosATL life_position;
	hint format["Vous êtes toujours en vie. Vous avez respawn à votre dernière position."];
	//life_is_alive = true;
	if(life_firstSpawn) then {
		[] call life_fnc_welcomeNotification;
	};
};
[] execVM "spawnanim.sqf";
