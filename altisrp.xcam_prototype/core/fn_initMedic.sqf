#include <macro.h>
/*
	File: fn_initMedic.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initializes the medic..
*/
private["_end","_slotpremium","_playerCount"];
player addRating 99999999;
waitUntil {!(isNull (findDisplay 46))};

if((__GETC__(life_medicLevel)) < 1) exitWith {
	["Notwhitelisted",FALSE,TRUE] call BIS_fnc_endMission;
	sleep 35;
};

_slotpremium = ["medic_7","medic_8","medic_9","medic_10"];


if(str(player) in _slotpremium) then {
	if(__GETC__(life_donator) == 0) then
	{
		player enableSimulation false;
		["NotPremium",false,true] call BIS_fnc_endMission;
		sleep 35;
	};
} else {
	// _playerCount = {!(isPlayer _x)} count _slotpremium;
	// if(__GETC__(life_donator) > 0 && {_playerCount > 2}) then
	// {
		// player enableSimulation false;
		// ["IsPremium",false,true] call BIS_fnc_endMission;
		// sleep 35;
	// };
};
if(face player in life_women && !life_sexe) then
{
	player enableSimulation false;
	["NotFemale",false,true] call BIS_fnc_endMission;
	sleep 35;
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
[] execVM "spawnanim.sqf";