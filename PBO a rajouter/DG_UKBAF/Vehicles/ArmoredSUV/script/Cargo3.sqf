_target = _this select 0; 

_target lockCargo [3, false]; 
player moveInCargo [_target, 3]; 
_target lockCargo [3, true]; 