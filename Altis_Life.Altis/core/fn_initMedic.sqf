#include <macro.h>
/*
	File: fn_initMedic.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initializes the medic..
*/
private["_end"];
player addRating 99999999;
waitUntil {!(isNull (findDisplay 46))};

if((__GETC__(life_medicLevel)) < 1) exitWith {
	["Notwhitelisted",FALSE,TRUE] call BIS_fnc_endMission;
	sleep 35;
};


if(str(player) in ["medic_7","medic_8","medic_9","medic_10"]) then {
	if(__GETC__(life_donator) == 0) then
	{
		player enableSimulation false;
		["NotPremium",false,true] call BIS_fnc_endMission;
		sleep 35;
	};
};

if (!life_is_alive || (count life_position) == 0) then
{
	[] call life_fnc_spawnMenu;
	waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
	waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
	// life_is_alive = true; // Just in-case the player disconnects before choosing a spawn position I guess? Otherwise debug island it is!
}	
else 
{
	player setPosATL life_position;
	hint format["Vous êtes toujours en vie. Vous avez respawn à votre dernière position."];
	// life_is_alive = true;
	if(life_firstSpawn) then {
		[] call life_fnc_welcomeNotification;
	};
};