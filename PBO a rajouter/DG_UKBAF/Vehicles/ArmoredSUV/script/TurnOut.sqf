_target = _this select 0; 

_target animate["CloseCover2",0]; 
sleep 0.2; 
_target animate["CloseCover1",0]; 
sleep 0.2; 
_target animate["HideGun_04",0]; 
sleep 0.1; 
_target animate["HideGun_03",0]; 
sleep 0.1; 
_target animate["HideGun_02",0]; 
sleep 0.1; 
_target animate["HideGun_01",0]; 
sleep 0.1; 
_target lockturret [[0],false];  _target lockturret [[1],false];  _target lockturret [[2],false]; 
_target lockCargo [3, false]; 
player action ["moveToTurret", _target,[0]]; 
_target lockCargo [3, true]; 

_target removeAction suv_open_action_cargo;

_target setVariable ['isTurnedOutOfVehicle',true,false];  