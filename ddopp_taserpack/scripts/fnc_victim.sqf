/*****************************************************************
Copyright © 2013 Double Doppler

File: fnc_victim.sqf
Date: 21/1/2013
Author: Double Doppler/D.Doppler
Contact: doubledoppler@live.co.uk
Description: N/A.
Parameter(s): None.

UNAUTHORIZED USE OR REPRODUCTION OF THIS MATERIAL WITHOUT THE 
PERMISSION OF THE AUTHOR IS PROHIBITED.
*****************************************************************/
/*
	MP-LOCALITY: Victim must be local.
*/

// REQUIRED

DDOPP_taser_handleHit = {
	private ["_shooter","_selection","_damage","_shooter","_bullet"];
	_victim    = _this select 0;
	_selection = _this select 1;
	_damage    = _this select 2;
	_shooter   = _this select 3;
	_bullet    = _this select 4;
	
	if (_bullet in DDOPP_taser_arrBullet) then {
		[_victim, _shooter, DDOPP_taser_koTime] spawn DDOPP_taser_victimFx;
	};

	_damage
};

DDOPP_taser_victimFx = {
	private ["_victim","_shooter","_stunTime"];
	_victim    = _this select 0;
	_shooter   = _this select 1;
	_stunTime  = _this select 2;
	
	if (_victim getVariable "isTazed") exitWith {                             // Victim IS already stunned             
		// # EXIT
	}; 						            
	if ((animationState _victim) in DDOPP_taser_arrRestrainAnims) exitWith {  // Victim NOT restrained
		// # EXIT
	};  
	
	if (
		!(isnull _victim)         									 && // Victim DOES exist
		 (alive  _victim)         									 && // Victim IS alive
		 (vehicle _victim == _victim)               	                // Victim NOT in vehicle
	) then { 
	
		// Sound effects
		[[_victim,"Taser_Hit"],true] call DDOPP_public_say;
		
		// Stunned animation
		if (animationState _victim in DDOPP_taser_arrProneAnims) then {
			[[_victim,"adthppnemstpsraswpstdnon_2"],true] call DDOPP_public_anim;
		} else {
			[[_victim,"adthpercmstpslowwrfldnon_4"],true] call DDOPP_public_anim;
		};
		
		// Remove weapons
		(_victim) call DDOPP_taser_removeWeapons;
		
		// Spawn player effects
		if (_victim == player) then { // SP Proof
			(_stunTime/5) spawn {
				private "_loopTimes";
				_loopTimes = ((_this)-2);
				if (DDOPP_taser_enableHints) then {
					hintSilent parseText "<t size='1.25' font='Zeppelin32' color='#ff0000'>You have been tased!</t>";
				};
				disableuserinput true;
				"dynamicBlur" ppEffectEnable true; 
				"dynamicBlur" ppEffectAdjust [15]; 
				"dynamicBlur" ppEffectCommit 2; 
				"dynamicBlur" ppEffectAdjust [10]; 
				"dynamicBlur" ppEffectCommit ((_loopTimes*5)+10);
				for "_i" from 0 to (_loopTimes) do {
					cutRsc ["taser_hit_fx","PLAIN",1.5];
					sleep 5;
				};
				disableuserinput false;
				"dynamicBlur" ppEffectAdjust [0]; 
				"dynamicBlur" ppEffectCommit (10);
				sleep 3;
				if (DDOPP_taser_enableHints) then {
					hintSilent "";
				};
			};
		};
		
		// Set Variable
		_victim setVariable ["isTazed",true,true];
		
		// Send global message
		if (DDOPP_taser_enableMessage) then {
			call compile format ["[[""%1 (%2) deployed a taser on %3 (%4)"",""globalChat""],true] call DDOPP_public_msg;",_shooter, (name _shooter), _victim, (name _victim)];
		};
		
		// # BEGIN STUN TIME
		
		sleep _stunTime;
		
		// # END   STUN TIME
		
		// Set Variable
		_victim setVariable ["isTazed",false,true];
		
		// Free animation
		if !((animationState _victim) in DDOPP_taser_arrRestrainAnims) then { // Victim != arrested	
			[[_victim,"amovppnemrunsnonwnondf"],true] call DDOPP_public_anim; // Victim = free
		};
	
	};

};

// PRACTICAL

DDOPP_taser_removeWeapons = {
	private ["_victim","_weapons"];
	_victim  = _this;
	_weapons = weapons _victim - DDOPP_taser_arrNotWeapons;
	if (count _weapons > 0) then {													
		{_victim removeWeapon _x} forEach _weapons;																														
		call compile format ['
			weaponholder_%1 = createVehicle ["weaponHolder",(position _victim) , [], 0, "CAN_COLLIDE"]; 
			weaponholder_%1 setVehicleInit ''weaponholder_%1 = this; weaponholder_%1 setVehicleVarName "weaponholder_%1"; {this addWeaponCargo [_x,1]} forEach %2; if (!isMultiplayer || isServer) then {[weaponholder_%1] spawn {sleep 300; if (!isNil "weaponholder_%1") then {deleteVehicle weaponholder_%1}}};''; 
			processInitCommands;
		', _victim, _weapons];
	};	
};
