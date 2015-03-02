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

if((__GETC__(life_medicLevel)) < 1) then {
	player enableSimulation false;
	["Notwhitelisted",false,true] call BIS_fnc_endMission;
	sleep 35;
};


if(str(player) in ["medic_7","medic_8","medic_9","medic_10"]) then {
	if(__GETC__(life_donator) == 0) then {
		player enableSimulation false;
		["NotPremium",false,true] call BIS_fnc_endMission;
		sleep 35;
	};
};
if(face player in life_women && !life_sexe) then {
	player enableSimulation false;
	["NotFemale",false,true] call BIS_fnc_endMission;
	sleep 35;
};
if(__GETC__(life_adminlevel) == 0) then
{
	if(((profileName) != (life_playername)) && !(life_wipe)) exitWith {
		0 cutText[format ["Changement de nom interdit. \nVous devez passer à la prefecture pour changer de nom. \nMerci de vous reconnecter sous le nom : ""%1""",(life_playername)],"BLACK FADED"];
		0 cutFadeOut 9999999;
		sleep 20;
		
		player enableSimulation false;
		["BadName",false,true] call BIS_fnc_endMission;
		sleep 35;
	};
};
if(((profileName) == (life_playername)) && life_wipe) exitWith {
	0 cutText[format ["Changement d'identité en cours. \nVous venez de passer à la prefecture pour changer de nom, ou vous avez subit une mort RP. \nMerci de vous reconnecter avec un nouveau nom différent de : ""%1""",(life_playername)],"BLACK FADED"];
	0 cutFadeOut 9999999;
	sleep 20;
	
	player enableSimulation false;
	["NewName",false,true] call BIS_fnc_endMission;
	sleep 35;
};

if (!life_is_alive || (count life_position) == 0) then {
	[] call life_fnc_spawnMenu;
	waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
	waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
	// life_is_alive = true; // Just in-case the player disconnects before choosing a spawn position I guess? Otherwise debug island it is!
} else {
	player setPosATL life_position;
	hint format["Vous êtes toujours en vie. Vous avez respawn à votre dernière position."];
	// life_is_alive = true;
	if(life_firstSpawn) then {
		[] call life_fnc_welcomeNotification;
	};
};
[(call TFAR_fnc_activeSwRadio), 2, "51"] call TFAR_fnc_SetChannelFrequency;
[(call TFAR_fnc_activeSwRadio), 3, "30"] call TFAR_fnc_SetChannelFrequency;
[(call TFAR_fnc_activeSwRadio), 4, "61"] call TFAR_fnc_SetChannelFrequency;
[] execVM "spawnanim.sqf";