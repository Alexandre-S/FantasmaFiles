/*
    File: fn_packupmauer.sqf
    Author: Bryan "Tonic" Boardwine
    Edited by: OLLI aka Hauklotz

    Description:
    Packs up a deployed wall.
*/
private["_mauer"];
if ((vehicle player) != player) exitWith { hint "Impossible d'effectuer cette action en véhicule." };
_mauer = nearestObjects[getPos player,["RoadBarrier_small_F"],8] select 0;
if(isNil "_mauer") exitWith {};

if(([true,"mauer",1] call life_fnc_handleInv)) then
{
    titleText["Vous avez ramassé la barrière.","PLAIN"];
    //deleteVehicle _mauer;
	[[_mauer],"life_fnc_delveh",true,false] spawn life_fnc_MP;
};