/*
    File: fn_packupsandbagr.sqf
    Author: Youri

    Description:
    Packs up a deployed sandbag.
*/
private["_sandbagr"];
if ((vehicle player) != player) exitWith { hint "Impossible d'effectuer cette action en véhicule." };
_sandbagr = nearestObjects[getPos player,["Land_BagFence_Round_F"],8] select 0;
if(isNil "_sandbagr") exitWith {};

if(([true,"sandbagr",1] call life_fnc_handleInv)) then
{
    titleText["Vous avez ramassé les sacs de sable.","PLAIN"];
    //deleteVehicle _sandbagr;
	[[_sandbagr],"life_fnc_delveh",true,false] spawn life_fnc_MP;
};