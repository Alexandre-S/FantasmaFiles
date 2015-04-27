/*
 * Author: commy2
 *
 * Unit unloads a captive from a vehicle.
 * 
 * Argument:
 * 0: Unit that wants to unload a captive (Object)
 * 1: Vehicle to unload a captive from. (Object)
 * 
 * Return value:
 * Nothing
 */

private ["_unit", "_vehicle", "_cargo", "_target"];

_unit = _this select 0;
_vehicle = _this select 1;

_cargo = crew _vehicle;  // Can also unload from driver, gunner, commander, turret positions. They shouldn't be there anyway.

_cargo = [_cargo, {_this getVariable ["AGM_isCaptive", false]}] call AGM_Core_fnc_filter;

if (count _cargo > 0) then {
  _target = _cargo select 0;

  _target setVariable ["AGM_Captives_CargoIndex", -1, true];

  moveOut _target;
  // [_target, "AGM_AmovPercMstpScapWnonDnon", 2] call AGM_Core_fnc_doAnimation;
  [_target, "{unassignVehicle _this}", _target] call AGM_Core_fnc_execRemoteFnc;
  
  [_target] spawn {
	waituntil{ sleep 0.1; (_this select 0 == vehicle (_this select 0)) };
	[_this select 0, false, true] call AGM_Captives_fnc_setCaptive;
	waituntil{ sleep 0.1; ((_this select 0) getVariable ["tf_unable_to_use_radio", true]) };
	// player removeItem 'AGM_CableTie';
	[_this select 0, true, true] call AGM_Captives_fnc_setCaptive;
  };
};