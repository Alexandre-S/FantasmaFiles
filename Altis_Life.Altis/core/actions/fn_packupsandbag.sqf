/*
    File: fn_packupsandbag.sqf
    Author: Youri

    Description:
    Packs up a deployed sandbag.
*/
private["_sandbag"];
if ((vehicle player) != player) exitWith { hint "Impossible d'effectuer cette action en véhicule." };
_sandbag = nearestObjects[getPos player,["Land_BagFence_Long_F"],8] select 0;
if(isNil "_sandbag") exitWith {};

if(([true,"sandbag",1] call life_fnc_handleInv)) then
{
    titleText["Vous avez ramassé les sacs de sable.","PLAIN"];
    //deleteVehicle _sandbag;
	[[_sandbag],"life_fnc_delveh",true,false] spawn life_fnc_MP;
};