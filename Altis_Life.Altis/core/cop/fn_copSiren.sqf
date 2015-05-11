if(isServer OR !hasInterface) exitwith {}; //NO SERVER DO NOT EXECUTE IT!
/*
	File: fn_copSiren.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the cop siren sound for other players
*/
private["_vehicle"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

if(isNull _vehicle) exitWith {};
if(isNil {_vehicle getVariable "siren"}) exitWith {};

while {true} do
{
	if(!(_vehicle getVariable "siren")) exitWith {};
	if(count (crew (_vehicle)) == 0) then {_vehicle setVariable["siren",false,true]};
	if(!alive _vehicle) exitWith {};
	if(isNull _vehicle) exitWith {};
	switch (typeOf _vehicle) do
	{
 		case "B_MRAP_01_F": { _vehicle say3D "SirenSwat"; sleep 13; };
		case "B_MRAP_01_hmg_F": { _vehicle say3D "SirenSwat"; sleep 13; };
		case "I_MRAP_03_F": { _vehicle say3D "SirenSwat"; sleep 13; };
 		default { _vehicle say3D "SirenLong"; sleep 2.183; };
 	};
	if(!(_vehicle getVariable "siren")) exitWith {};
};