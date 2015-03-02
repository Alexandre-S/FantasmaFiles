#include <macro.h>
/*
	File: fn_initCop.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Cop Initialization file.
*/
private["_end"];
player addRating 9999999;
waitUntil {!(isNull (findDisplay 46))};
_end = false;
/*if(life_blacklisted) exitWith
{
	["Blacklisted",false,true] call BIS_fnc_endMission;
	sleep 30;
};*/

//diag_log format["%1 - %2",__GETC__(life_coplevel),__GETC__(life_donator)];

if(str(player) in ["cop_1","cop_2","cop_3","cop_4","cop_5","cop_6","cop_7","cop_8","cop_9","cop_10","cop_11","cop_12","cop_13","cop_14","cop_15"]) then {
	if(__GETC__(life_coplevel) == 0) then {
		player enableSimulation false;
		["NotCop",false,true] call BIS_fnc_endMission;
		sleep 35;
	};
};
if(str(player) in ["cop_16","cop_17","cop_18","cop_19","cop_20","cop_21","cop_22","cop_23","cop_24","cop_25","cop_26","cop_27","cop_28","cop_29","cop_30"]) then {
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

player setVariable["rank",(__GETC__(life_coplevel)),true];

if (!life_is_alive || (count life_position) == 0) then {
	[] call life_fnc_spawnMenu;
	waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
	waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
	//life_is_alive = true; // Just in-case the player disconnects before choosing a spawn position I guess? Otherwise debug island it is!
} else {
	player setPosATL life_position;
	hint format["Vous êtes toujours en vie. Vous avez respawn à votre dernière position."];
	//life_is_alive = true;
	if(life_firstSpawn) then {
		[] call life_fnc_welcomeNotification;
	};
};
[] execVM "spawnanim.sqf";
