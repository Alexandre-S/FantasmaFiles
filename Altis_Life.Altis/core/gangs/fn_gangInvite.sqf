#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Prompts the player about an invite.
*/
private["_name","_group","_grpMembers","_action","_gangName"];
_name = [_this,0,"",[""]] call BIS_fnc_param;
_group = [_this,1,grpNull,[grpNull]] call BIS_fnc_param;
if(_name == "" OR isNull _group) exitWith {}; //Fail horn anyone?
if!(init_gang) exitwith {};
if(!isNil {(group player) getVariable "gang_name"}) exitWith {hint "You are already in a gang"};

_gangName = _group getVariable "gang_name";
_action = [
	format[localize "STR_GNOTF_InviteMSG",_name,_gangName],
	localize "STR_Gang_Invitation",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if(_action) then {
	[player] join _group;
	[] call life_fnc_getHLC;
	[[4,_group],"TON_fnc_updateGang",serverhc,false] spawn life_fnc_MP;
} else {
	sleep 1;
	_grpMembers = _group getVariable ["gang_members",nil];
	if(isNil "_grpMembers") exitWith {};
	if(typeName _grpMembers != "ARRAY") exitWith {};
	_grpMembers = _grpMembers - [steamid];
	// _group setVariable["gang_members",_grpMembers,true];
	[[_group,"gang_members",_grpMembers,true],"TON_fnc_setObjVar",false,false] spawn life_fnc_MP;

	[] call life_fnc_getHLC;
	[[4,_group],"TON_fnc_updateGang",serverhc,false] spawn life_fnc_MP;
};