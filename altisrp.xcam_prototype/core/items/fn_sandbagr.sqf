/*
    File: fn_sandbagr.sqf
    Author: Youri
*/
private["_position","_sandbagr"];
_sandbagr = "Land_BagFence_Round_F" createVehicle [0,0,0];
_sandbagr attachTo[player,[0,3.5,0.2]];
_sandbagr setDir 90;
//_sandbagr setVariable["item","mauerDeployed",true];
_sandbagr setVariable["item",["sandbagr","1"],true];

life_action_sandbagrDeploy = player addAction["<t color='#ffffff'>Poser sacs de sable (arrondi)</t>",{if(!isNull life_sandbagr) then {detach life_sandbagr; life_sandbagr = ObjNull;}; player removeAction life_action_sandbagrDeploy; life_action_sandbagrDeploy = nil;},"",999,false,false,"",'!isNull life_sandbagr'];
life_sandbagr = _sandbagr;
waitUntil {isNull life_sandbagr};
if(!isNil "life_action_sandbagrDeploy") then {player removeAction life_action_sandbagrDeploy;};
if(isNull _sandbagr) exitWith {life_sandbagr = ObjNull;};
_sandbagr setPos [(getPos _sandbagr select 0),(getPos _sandbagr select 1),0];
//_sandbagr allowDamage false;
//_sandbagr enableSimulation false;