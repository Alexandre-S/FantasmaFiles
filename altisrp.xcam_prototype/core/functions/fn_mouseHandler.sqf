/*
	File: fn_mouseHandler.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Handles the Z position changes in a mouse. This is specifically for
	scrolling while restrained.
*/
// hint str _this;
private ["_handled"];
_code = _this select 1;

_handled = false;

if(_code == 1)then{
	if((vehicle player != player && {driver (vehicle player) == player}) || (playerside == civilian && (!l_c_gvt && !l_c_vigil && !l_c_rebel) && !((currentWeapon player) in life_civ_weapon)))then{
		_handled=false;
		[] spawn {
			sleep 0.2;
			if(cameraView == "GUNNER") then {
				player switchCamera "Internal";
			};
			sleep 0.2;
			if(cameraView == "GUNNER") then {
				player switchCamera "Internal";
			};
		};
		
	}else{
		_handled=true;
	};
};
 // hint format["%1 - %2",_this,_handled];

_handled;