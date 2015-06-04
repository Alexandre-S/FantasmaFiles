/*****************************************************************
Copyright © 2013 Double Doppler

File: init_taser.sqf
Date: 21/1/2013
Author: Double Doppler/D.Doppler
Contact: doubledoppler@live.co.uk
Description: N/A.
Parameter(s): None.

UNAUTHORIZED USE OR REPRODUCTION OF THIS MATERIAL WITHOUT THE 
PERMISSION OF THE AUTHOR IS PROHIBITED.
*****************************************************************/
// COPYPASTA!!
/*
AI:
removeallweapons this; this addmagazine "DDOPP_3Rnd_X3"; this addmagazine "DDOPP_3Rnd_X3"; this addweapon "DDOPP_X3";
this addmagazine "DDOPP_3Rnd_X3";

PLAYER:
removeallweapons player; player addmagazine "DDOPP_3Rnd_X3"; player addmagazine "DDOPP_3Rnd_X3"; player addweapon "DDOPP_X3";
player addmagazine "DDOPP_3Rnd_X3";

player addmagazine "DDOPP_1Rnd_X26"; player addweapon "DDOPP_X26";
*/

// #include "\userconfig\DDOPP_TaserMod\DDOPP_TaserConfig.hpp";


// BASIC CONFIGURATION
DDOPP_taser_maxShootRange    = 50;   // Meters - Maximum cartridge projectile range
DDOPP_taser_maxTouchRange    = 3;    // Meters - Required to touch the target in Drive Stun
DDOPP_taser_koTime           = 40;   // Seconds - How long target will be knocked out for
DDOPP_taser_koTimeDS         = 20;   // Seconds - How long target will be knocked out for (Drive Stun)

DDOPP_taser_enableMessage    = false; // Enable/disable global message updates - i.e
                                     // globalChat "Player X was stunned by player Y".

DDOPP_taser_enableHints      = false; // Enable/disable client-side hints - i.e
                                     // hint "You are stunned!".					 

// FOR MISSION EDITORS AND MOD PACK ADMINS
// (Make sure you distribute this .hpp file in your mod pack, for the players to use the same settings.)

DDOPP_taser_arrWeapons       = ["DDOPP_X26","DDOPP_X26_b","DDOPP_X3","DDOPP_X3_b"]; // List of all tasers
DDOPP_taser_arrHandgun       = ["DDOPP_X26","DDOPP_X26_b","DDOPP_X3","DDOPP_X3_b"]; // List of all tasers with "Drive-Stun" mode
DDOPP_taser_arrBullet        = ["DDOPP_B_Taser"]; // Taser projectile(s)
DDOPP_taser_arrProneAnims    = ["amovppnemrunsnonwnondf","amovppnemstpsnonwnondnon","amovppnemstpsraswrfldnon","amovppnemsprslowwrfldf","aidlppnemstpsnonwnondnon0s","aidlppnemstpsnonwnondnon01"];
DDOPP_taser_arrStunAnims     = ["adthppnemstpsraswpstdnon_2","adthpercmstpslowwrfldnon_4"];

DDOPP_taser_arrRestrainAnims = [ 
	// If your mission features a restrain system, add the restrain animations that it uses in this array to
	// avoid conflicting with the taser effects function. (If they are not already in here.)
	// CASE SESITIVE
	"actspercmstpsnonwrfldnon_interrogate02_forgoten",
	"civillying01"
];

DDOPP_taser_arrNotWeapons 	 = [
	// These "weapons" will not be removed from your gear inventory when you are stunned.
	"Binocular",
	"NVGoggles",
	"ItemMap",
	"ItemCompass",
	"ItemRadio",
	"ItemWatch",
	"ItemGPS"
];

DDOPP_taser_enableEH         = false; // Decide if "HandleDamage" Event Handler will be added
                                     // to predefined AI units and player inside the taser
									 // scripts, or not (if you define it elsewhere).

									 // If your mission already contains a "HandleDamage"
									 // Event-handler then set this to false and merge the
									 // contents of the taser "HandleDamage" EH with yours.	

// REQUIRED COMMON VARS
if (isNil "isClient") then { // Future Proof
	isClient              	 = (if (isMultiplayer) then {!isServer} else {true}); // SP Proof
};
DDOPP_taser_version      	 = "v1.1 (23/2/2013)";


// Originally client-only, but now server needs to know these functions in order to operate on AI.
{call compile preprocessfile _x;} forEach [
	"\DDOPP_taserPack\scripts\fnc_network.sqf", // Priority #1
	"\DDOPP_taserPack\scripts\fnc_victim.sqf",
	"\DDOPP_taserPack\scripts\fnc_shooter.sqf",
	"\DDOPP_taserPack\scripts\fnc_global.sqf"
];

// Player initialization

if (isClient) then {
	
	// Set effects control to player
	player setVariable ["isTazed", false, true];
	
	// Add EH to player
	if (DDOPP_taser_enableEH) then {
		player addEventHandler ["HandleDamage",{_this call DDOPP_taser_handleHit}];
	};

	/*
		MouseButtonDown:		
		_this select 1 = ID of mouse button pressed
		_this select 1 == 0 = Right Mouse Button
		_this select 1 == 1 = Left Mouse Button
		_this select 1 == 2 = Middle Mouse Button
	*/
	[] spawn {
		sleep 3;
		if (isNil "drive_stun_hotkey") then {
			drive_stun_hotkey = (findDisplay 46) displayAddEventHandler ["MouseButtonDown", "if(_this select 1 == 0) then {[] spawn DDOPP_taser_driveStun}"];
		};
	};
	//(findDisplay 46) displayRemoveEventHandler ["MouseButtonDown",drive_stun_hotkey];
	
};

// Server initialization

if (isServer || !isMultiplayer) then {
	call compile preprocessfile "\DDOPP_taserPack\scripts\fnc_server.sqf";
	
	{	
		if (!isPlayer _x) then {
			
			// Set effects control to AI
			_x setVariable ["isTazed", false, true];
			
			 // Add EH to AI
			if (DDOPP_taser_enableEH) then {
				_x addEventHandler ["HandleDamage",{_this call DDOPP_taser_handleHit}];
			};
			
		};
	} forEach AllUnits;
	
	[] spawn DDOPP_taser_babel;
};