/*
	File: fn_RopeAttach.sqf
	Author: Havena
	
	Description: 
*/
private["_vehicle","_rope","_unit"];
_vehicle = _this select 0;
_rope = _this select 1;

_unit = driver _vehicle;


if(!(side _unit in [independent,west] || _unit getVariable["life_dep", false] || _unit getVariable["life_gvt", false])) then {
	deleteVehicle _rope;
};



// [] call life_fnc_getHLC;
// [[_vehicle,"idleTime",time],"TON_fnc_setObjVar",serverhc,false] spawn life_fnc_MP;