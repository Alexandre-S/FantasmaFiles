#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	32 hours...
*/
private["_unit","_unitID","_members"];
disableSerialization;

if((lbCurSel 2621) == -1) exitWith {hint localize "STR_GNOTF_SelectKick"};
_unit = call compile format["%1",getSelData(2621)];
if(isNull _unit) exitWith {}; //Bad unit?
if(_unit == player) exitWith {hint localize "STR_GNOTF_KickSelf"};
if!(init_gang) exitwith {};
if!(_unit getVariable["init_gang",false]) exitwith {hint "Impossible de kicker cette personne, recommencez dans 30sec.."};

_unitID = getPlayerUID _unit;
_members = grpPlayer getVariable "gang_members";
if(isNil "_members") exitWith {};
if(typeName _members != "ARRAY") exitWith {};
_members = _members - [_unitID];
grpPlayer setVariable["gang_members",_members,true];

[[_unit,grpPlayer],"life_fnc_clientGangKick",_unit,false] spawn life_fnc_MP; //Boot that bitch!
[] call life_fnc_getHLC;
[[4,grpPlayer],"TON_fnc_updateGang",serverhc,false] spawn life_fnc_MP; //Update the database.
[] call life_fnc_gangMenu;