/*
    File: fn_sandbag.sqf
    Author: Youri
*/
private["_position","_sandbag"];
_sandbag = "Land_BagFence_Long_F" createVehicle [0,0,0];
_sandbag attachTo[player,[0,3.5,0.2]];
_sandbag setDir 90;
//_sandbag setVariable["item","mauerDeployed",true];
_sandbag setVariable["item",["sandbag","1"],true];

life_action_sandbagDeploy = player addAction["<t color='#ffffff'>Poser sacs de sable (droit)</t>",{if(!isNull life_sandbag) then {detach life_sandbag; life_sandbag = ObjNull;}; player removeAction life_action_sandbagDeploy; life_action_sandbagDeploy = nil;},"",999,false,false,"",'!isNull life_sandbag'];
life_sandbag = _sandbag;
waitUntil {isNull life_sandbag};
if(!isNil "life_action_sandbagDeploy") then {player removeAction life_action_sandbagDeploy;};
if(isNull _sandbag) exitWith {life_sandbag = ObjNull;};
_sandbag setPos [(getPos _sandbag select 0),(getPos _sandbag select 1),0];
//_sandbag allowDamage false;
//_sandbag enableSimulation false;