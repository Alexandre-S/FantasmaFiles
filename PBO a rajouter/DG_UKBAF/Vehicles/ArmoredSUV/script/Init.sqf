_target = _this select 0; 

suv_close_action = _target addAction  
[ 
    "<t color='#FF0000'>Turn In</t>", 
    "DG_UKBAF\Vehicles\ArmoredSUV\script\TurnIn.sqf", 
    [], 
    1, 
    false, 
    true, 
    "", 
    "(gunner _target) isEqualTo player && {!(_this getVariable ['isTurnedOutOfVehicle',false])}" 
]; 

suv_open_action = _target addAction  
[ 
    "<t color='#FF0000'>Turn Out</t>", 
    "DG_UKBAF\Vehicles\ArmoredSUV\script\TurnOut.sqf", 
    [], 
    1, 
    false, 
    true, 
    "", 
    "((_target getCargoIndex _this) isEqualTo 3) && {!(_this getVariable ['isTurnedOutOfVehicle',false])}" 
]; 

_target lockCargo [3, true]; 
_target setVariable ['isTurnedOutOfVehicle',false,true];//first option will be to turn out of vehicle, switch the false to true to do the opposite 