#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	32 hours later...
*/
private["_grpMembers"];
if(steamid == (grpPlayer getVariable "gang_owner")) exitWith {hint localize "STR_GNOTF_LeaderLeave"};
if!(init_gang) exitwith {};

_grpMembers = grpPlayer getVariable "gang_members";
if(isNil "_grpMembers") exitWith {};
if(typeName _grpMembers != "ARRAY") exitWith {};
_grpMembers = _grpMembers - [steamid];
grpPlayer setVariable["gang_members",_grpMembers,true];
[player] joinSilent (createGroup civilian);

[] call life_fnc_getHLC;
[[4,grpPlayer],"TON_fnc_updateGang",serverhc,false] spawn life_fnc_MP;
closeDialog 0;