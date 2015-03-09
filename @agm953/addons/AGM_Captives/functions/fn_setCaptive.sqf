/*
 * Author: Nic547, commy2
 *
 * Makes a civilian unable to move.
 * 
 * Argument:
 * 0: Unit (Object)
 * 1: True to take captive, false to release captive (Object)
 * 
 * Return value:
 * Nothing
 */

private ["_unit", "_state","_remote"];

_unit = _this select 0;
_state = _this select 1;
_remote = false;

if (count _this > 2) then {
	_remote = _this select 2;
};

if (!_remote and !_state and playerside == west) then {
	player addItem "AGM_CableTie";
};

if (!local _unit) exitWith {[[_unit, _state, true], _fnc_scriptName, _unit] call AGM_Core_fnc_execRemoteFnc};


if (_state) then {
  if (_unit getVariable ["AGM_isCaptive", false]) exitWith {};

  _unit setVariable ["AGM_isCaptive", true, true];
  [_unit, "AGM_Handcuffed", true] call AGM_Core_fnc_setCaptivityStatus;

  if (_unit getVariable ["AGM_isSurrender", false]) then {
	_unit setVariable ["AGM_isSurrender", false, true];
  };

  _unit setVariable ["AGM_Captives_CargoIndex", vehicle _unit getCargoIndex _unit, true];

  // fix anim on mission start (should work on dedicated servers)
  _unit spawn {
	private ["_playerGrp"];
	
	if(side _this == civilian) then {
		[_this] joinSilent (createGroup civilian);
		init_gang = false;
		_this setVariable["init_gang",false,true];
	} else {
		_playerGrp = group _this;
		[_this] joinSilent (createGroup (side _this));
	};
	_this setVariable ["tf_unable_to_use_radio", true];
	
	if (_this getVariable ["AGM_isCaptive", false] && {vehicle _this == _this}) then {
      [_this] call AGM_Core_fnc_fixLoweredRifleAnimation;
    };
	
	
	while {_this getVariable ["AGM_isCaptive", false]} do {
		sleep 0.001; //sleep in UI
		
		if (_this == AGM_player) then {
			showHUD false;
		};
		
		waitUntil {!(_this getVariable ["AGM_Unconscious", false])};

		if (!alive _this) then {
			_this setVariable ["AGM_isCaptive", false, true];
		} else {
			if(animationState _this != "AGM_AmovPercMstpScapWnonDnon" && {vehicle _this == _this}) then {
				[_this, "AGM_AmovPercMstpScapWnonDnon", 0] spawn AGM_Core_fnc_doAnimation;
			};
		};
	};
	
	[_this, "AGM_Handcuffed", false] call AGM_Core_fnc_setCaptivityStatus;
	sleep 0.1;
	if !(_this getVariable ["AGM_Unconscious", false]) then {
		// _this playMoveNow "AmovPercMstpSnonWnonDnon_EaseOut";
		if (vehicle _this == _this) then {
			[_this, "AGM_AmovPercMstpScapWnonDnon_AmovPercMstpSnonWnonDnon", 2] call AGM_Core_fnc_doAnimation;
		};
	} else {
		_this playMoveNow "unconscious";
	};
	
	if (_this getVariable ["AGM_Captives_CargoIndex", -1] != -1) then {
		_this setVariable ["AGM_Captives_CargoIndex", -1, true];
	};
	
	if (_this == AGM_player) then {
		showHUD true;
	};
	
	_this setVariable ["tf_unable_to_use_radio", false];
	if(side _this == civilian) then {
		[] call life_fnc_getHLC;
		[[(getPlayerUID _this),havena_id],"TON_fnc_querygang",serverhc,false] spawn life_fnc_MP;
	} else {
		//join west/indep group
		if(!isNull _playerGrp) then {
			[_this] joinSilent (_playerGrp);
		};
	};
  };
} else {
  if !(_unit getVariable ["AGM_isCaptive", false]) exitWith {};

  _unit setVariable ["AGM_isCaptive", false, true];
  /*[_unit, "AGM_Handcuffed", false] call AGM_Core_fnc_setCaptivityStatus;
  if (vehicle _unit == _unit) then {
    [_unit, "AGM_AmovPercMstpScapWnonDnon_AmovPercMstpSnonWnonDnon", 2] call AGM_Core_fnc_doAnimation;
  };

  if (_unit getVariable ["AGM_Captives_CargoIndex", -1] != -1) then {
    _unit setVariable ["AGM_Captives_CargoIndex", -1, true];
  };

  if (_unit == AGM_player) then {
    showHUD true;
  };
   _unit setVariable ["tf_unable_to_use_radio", false];
   */
};