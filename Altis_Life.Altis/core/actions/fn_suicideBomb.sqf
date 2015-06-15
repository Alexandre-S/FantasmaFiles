/*
	ALAH SNACKBAR!
        Created By: TAW_Tonic
        Edited By: Sebastien Scibilia
        Tested and Approved by: Capt. Fitzsimmons and 617th PMC
*/
private["_boum"];
if(vest player != "V_HarnessOGL_brn") exitWith {};

sleep 1; 

_boum = "Bo_GBU12_LGB_MI10" createVehicle [0,0,9999];
_boum setPos (getPos player);
_boum setVelocity [100,0,0];

if(alive player) then {player setDamage 1;};