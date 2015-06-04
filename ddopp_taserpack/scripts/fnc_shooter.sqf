/*****************************************************************
Copyright © 2013 Double Doppler

File: fnc_shooter.sqf
Date: 21/1/2013
Author: Double Doppler/D.Doppler
Contact: doubledoppler@live.co.uk
Description: N/A.
Parameter(s): None.

UNAUTHORIZED USE OR REPRODUCTION OF THIS MATERIAL WITHOUT THE 
PERMISSION OF THE AUTHOR IS PROHIBITED.
*****************************************************************/
/*
	MP-LOCALITY: Shooter must be local.
*/

DDOPP_taser_driveStun = {
	private ["_shooter","_victim","_stunTime"];
	_shooter  = player; // Only works on human players at this time
	_victim   = cursortarget;
	_stunTime = DDOPP_taser_koTimeDS;
	
	if(
		(((weaponState _shooter) select 0) in DDOPP_taser_arrHandgun) &&
		(((weaponState _shooter) select 1)== "Drive_Stun_Mode")
	) then {
		if !(_victim iskindof "Man") exitWith {}; 						  // Victim IS human
			[[_shooter,"Taser_Spark"],true] call DDOPP_public_say;
			call compile format ["[[""[%1,%2,%3]"",""DDOPP_taser_VictimCheck""],true] call DDOPP_public_spawn", _victim, _shooter, _stunTime];				
	};
	
};