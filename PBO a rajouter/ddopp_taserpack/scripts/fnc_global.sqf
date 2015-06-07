/*****************************************************************
Copyright © 2013 Double Doppler

File: fnc_global.sqf
Date: 28/1/2013
Author: Double Doppler/D.Doppler
Contact: doubledoppler@live.co.uk
Description: N/A.
Parameter(s): None.

UNAUTHORIZED USE OR REPRODUCTION OF THIS MATERIAL WITHOUT THE 
PERMISSION OF THE AUTHOR IS PROHIBITED.
*****************************************************************/
/*
	MP-LOCALITY: Functions defined here will be sent to everyone's PC.
	(I.E running player checks.)
*/

// For Drive-Stun
// Decides where to execute the hit function (which is local to the victim)
DDOPP_taser_VictimCheck = {
	private ["_victim","_shooter","_stunTime"];
	_victim    = _this select 0;
	_shooter   = _this select 1;
	_stunTime  = _this select 2;
	
	// Human is handled by its client
	if (_victim == player) then {
		[_victim, _shooter, _stunTime] call DDOPP_taser_victimFx;
	};
	
	// Who handles the AI?
	// Server runs all AI-related commands...
	if !(isPlayer _victim) then {
		switch isMultiplayer do {
			case true  : {
				if (isServer) then {
					[_victim, _shooter, _stunTime] call DDOPP_taser_victimFx;
					diag_log format ["D.DOPPLER Taser Mod: An AI unit was drive-stunned - %1 (AI) was stunned by %2 (%3) for %4 seconds. The calculation was handled by the server.", _victim, _shooter, name _shooter, _stunTime];		
				};
			};
			case false : { // SP Proof
				[_victim, _shooter, _stunTime] call DDOPP_taser_victimFx;
			}; 
		};
	};
	
};