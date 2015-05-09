#include <macro.h>
/*
	File: fn_onPlayerRespawn.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Does something but I won't know till I write it...
*/
private["_unit","_corpse"];
_unit = _this select 0;
_unit setVariable ["BIS_enableRandomization",false];
_corpse = _this select 1;
life_corpse = _corpse;
life_corpse setVariable["life_corps",true,true];
_unit setVariable["life_corpse_var",_corpse,true];

//Comment this code out if you want them to keep the weapon on the ground.
private["_containers"];
//_containers = nearestObjects[getPosATL _corpse,["WeaponHolderSimulated"],5]; //Fetch list of containers (Simulated = weapons)
//{deleteVehicle _x;} foreach _containers; //Delete the containers.

//Set some vars on our new body.
_unit setVariable["AGM_isCaptive",false,true];
_unit setVariable["AGM_isEscorting",false,true];
_unit setVariable["AGM_isSurrender", false, true];
_unit setVariable["steam64id",(getPlayerUID player),true]; //Reset the UID.
_unit setVariable["realname",profileName,true]; //Reset the players name.

_unit addRating 9999999999999999; //Set our rating to a high value, this is for a ARMA engine thing.
player playMoveNow "amovppnemstpsraswrfldnon";

[] call life_fnc_setupActions;
//[[_unit,life_sidechat,playerSide],"TON_fnc_managesc",false,false] spawn life_fnc_MP;
player enableFatigue (__GETC__(life_enableFatigue));
//[] call life_fnc_updateClothing;