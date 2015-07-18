_target = _this select 0; 

_target lockCargo [3, false]; 
(gunner _target) action ["moveToCargo", _target,3]; 
_target lockCargo [3, true]; 
_target lockturret [[0],true];  _target lockturret [[1],true];  _target lockturret [[2],true]; 
sleep 0.1; 
_target animate["HideGun_01",1]; 
sleep 0.1; 
_target animate["HideGun_02",1]; 
sleep 0.1; 
_target animate["HideGun_03",1]; 
sleep 0.1; 
_target animate["HideGun_04",1]; 
sleep 0.1; 
_target animate["CloseCover1",1]; 
sleep 0.2; 
_target animate["CloseCover2",1]; 

suv_open_action_cargo = _target addAction ["<t color='#FF0000'>Enter Gunner Seat</t>","DG_UKBAF\Vehicles\ArmoredSUV\script\Cargo3.sqf",[],1,false,true, ""];

_target setVariable ['isTurnedOutOfVehicle',false,true]; 