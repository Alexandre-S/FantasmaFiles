/* 
	cfg des png mission livraison
	06/03/2014
	from: altisrp.fr
*/

_this allowDamage false; 
_this enableSimulation false; 
_this addAction["Terminer mission livraison",life_fnc_dpFinish,"dp_1",0,false,false,"",'!isNil "life_dp_point" && life_delivery_in_progress && life_dp_point == _target '];  
_this addAction["Obtenir mission",life_fnc_getDPMission,"dp_1",0,false,false,"",' isNil "life_dp_point" && !life_delivery_in_progress '];
