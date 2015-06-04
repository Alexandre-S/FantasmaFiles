#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	32 hours later...
*/
private["_grp","_grpMembers"];
if(steamid == (grpPlayer getVariable "gang_owner")) exitWith {hint localize "STR_GNOTF_LeaderLeave"};
if!(init_gang) exitwith {};

_grp = grpPlayer;
_grpMembers = _grp getVariable ["gang_members",nil];
if(isNil "_grpMembers") exitWith {};
if(typeName _grpMembers != "ARRAY") exitWith {};
_grpMembers = _grpMembers - [steamid];
// _grp setVariable["gang_members",_grpMembers,true];
[[_grp,"gang_members",_grpMembers,true],"TON_fnc_setObjVar",false,false] spawn life_fnc_MP;

closeDialog 0;

[_grp] spawn {
	_grp = _this select 0;

	hint "Patientez...";
	init_gang = false;
	
	sleep 1;
	
	[] call life_fnc_getHLC;
	[[4,_grp],"TON_fnc_updateGang",serverhc,false] spawn life_fnc_MP;
	
	sleep 1;
	
	[player] joinSilent (createGroup civilian);
	init_gang = true;
	hint "Vous avez quitté le groupe.";
};