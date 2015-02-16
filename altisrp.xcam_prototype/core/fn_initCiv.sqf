#include <macro.h>
/*
	File: fn_initCiv.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initializes the civilian.
*/
private["_spawnPos"];

civ_spawn_1 = nearestObjects[getMarkerPos  "civ_spawn_1", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],250];
civ_spawn_2 = nearestObjects[getMarkerPos  "civ_spawn_2", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],250];
civ_spawn_3 = nearestObjects[getMarkerPos  "civ_spawn_3", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],250];
civ_spawn_4 = nearestObjects[getMarkerPos  "civ_spawn_4", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],250];
waitUntil {!(isNull (findDisplay 46))};

if(__GETC__(life_coplevel) != 0 OR __GETC__(life_medicLevel) != 0) then
{
	player enableSimulation false;
	["NotCiv",false,true] call BIS_fnc_endMission;
	sleep 35;
};

if(str(player) in ["civ_51","civ_52","civ_53","civ_54","civ_55","civ_56","civ_57","civ_58","civ_59","civ_60","civ_61","civ_62","civ_63","civ_64","civ_65","civ_66","civ_67","civ_68","civ_69","civ_70","civ_71","civ_72","civ_73","civ_74","civ_75","civ_76","civ_77","civ_78","civ_79","civ_80","civ_81","civ_82","civ_83","civ_84","civ_85","civ_86","civ_87","civ_88","civ_89","civ_90","civ_91","civ_92","civ_93","civ_94","civ_95","civ_96","civ_97","civ_98","civ_99","civ_100","civ_101","civ_102","civ_103","civ_104","civ_105","civ_106","civ_107","civ_108","civ_109","civ_110","civ_111","civ_112","civ_113","civ_114","civ_115","civ_116","civ_117","civ_118","civ_119","civ_120"]) then {
	if(__GETC__(life_donator) == 0) then
	{
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

if(life_is_arrested || (!(life_is_alive) && (life_firstSpawn)) ) then
{
	life_is_arrested = false;
	[player,true] spawn life_fnc_jail;
	[] call life_fnc_welcomeNotification;
}
else
{
	if (life_is_alive && ((count life_position) > 0)) then
	{
		player setPosATL life_position;
		hint format["Vous êtes toujours en vie. Vous avez respawn à votre dernière position."];
		if(life_firstSpawn) then {
			[] call life_fnc_welcomeNotification;
		};
	}
	else
	{
		[] call life_fnc_spawnMenu;
		waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
		waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
		// life_is_alive = true; // Just in-case the player disconnects before choosing a spawn position I guess? Otherwise debug island it is!
	};
};

/*
if (!life_is_alive || (count life_position) == 0) then
{
	[] call life_fnc_spawnMenu;
	waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
	waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
	life_is_alive = true; // Just in-case the player disconnects before choosing a spawn position I guess? Otherwise debug island it is!
}	
else 
{
	if(life_is_arrested) then
	{
		life_is_arrested = false;
		[player,true] spawn life_fnc_jail;
	} 
	else 
	{
		player setPosATL life_position;
		hint format["Your character is still alive. You have been placed at your last saved position."];
	};
	life_is_alive = true;
	if(life_firstSpawn) then {
		[] call life_fnc_welcomeNotification;
	};
};*/
[] execVM "spawnanim.sqf";
player addRating 9999999;