/*
    File: fn_packupcone.sqf
    Author: havena

    Description:
    Packs up a deployed cone.
*/
private["_cone"];
_cone = nearestObjects[getPos player,["RoadCone_L_F"],8] select 0;
if(isNil "_cone") exitWith {};

if(([true,"cone",1] call life_fnc_handleInv)) then
{
    player removeAction life_action_conePickup;
    life_action_conePickup = nil;
    deleteVehicle _cone;
};