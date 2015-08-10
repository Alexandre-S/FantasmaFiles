/*
	File: fn_catchTurtle.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Catches a dead turtle?
*/
private["_obj"];
_obj = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _obj) exitWith {}; //Not valid
if(!(_obj isKindOf "Turtle_F")) exitWith {}; //Not a fishy!
if(player distance _obj > 3.5) exitWith {};

//if(alive _obj) exitWith {}; //It's alive, don't take it charlie!

if(([true,"turtle",1] call life_fnc_handleInv)) then
{
	deleteVehicle _obj;
	titleText[localize "STR_NOTF_CaughtTurtle","PLAIN"];
};