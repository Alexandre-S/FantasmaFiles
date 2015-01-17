/*
    File: fn_packupcone.sqf
    Author: havena

    Description:
    Packs up a deployed cone.
*/
private["_cone"];
if ((vehicle player) != player) exitWith { hint "Impossible d'effectuer cette action en véhicule." };
_cone = nearestObjects[getPos player,["RoadCone_L_F"],8] select 0;
if(isNil "_cone") exitWith {};

if(([true,"cone",1] call life_fnc_handleInv)) then
{
    titleText["Vous avez ramassé le cône.","PLAIN"];
    deleteVehicle _cone;
};