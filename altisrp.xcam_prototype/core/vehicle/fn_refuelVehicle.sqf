/*
	File: fn_refuelVehicle.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Refuel a vehicle!
*/

private ["_vehicle","_capacity","_litres","_cost","_level","_tick","_delay","_tax","_exit"];

if (vehicle player != player) exitWith { hint "Veuillez descendre du véhicule pour remettre de l'essence !"; };
_vehicle = nearestObjects [(_this select 0), ["Air", "LandVehicle"], 10];
if (count _vehicle == 0) exitWith { hint "Aucun véhicule dans les 10m !"; };
_vehicle = _vehicle select 0;

if (isEngineOn _vehicle) exitWith { hint "Veuillez couper le moteur pour remettre de l'essence !"; };

_capacity = getNumber(configFile >> "CfgVehicles" >> typeOf _vehicle >> "fuelCapacity");

_litres = 0;
_cost = 0;
_level = fuel _vehicle;
_tax = 15 / 100;
_delay = 0.5;
_exit = false;
if (_vehicle isKindOf "Air") then { _delay = _delay / 3; };

while {_level < 1} do
{
	uiSleep _delay;
	if (speed player > 1) exitWith {};
	if (player distance (_this select 0) > 5) exitWith {};
	if (vehicle player != player) exitWith {};
	
	_litres = _litres + 1;
	_cost = _cost + (60 * (1 + _tax));
	if (life_cash < _cost) exitWith {_exit = true;};
	
	_tick = 1 / _capacity;
	_level = _level + _tick;
	if (_level > 1) then { _level = 1; };
	
	hintSilent parseText format["<t color='#cec25b'>Litres:</t> %1<br/><t color='#cec25b'>Prix total :</t> %2€<br/><t color='#cec25b'>Réservoir à :</t> %3%4", _litres, [_cost] call life_fnc_numberText, floor (_level * 100), "%"];
};
if(_exit) exitWith { hint "Vous n'avez pas assez d'argent pour faire le plein d'essence !";  };

hintSilent parseText format["<t color='#cec25b'>Litres:</t> %1<br/><t color='#cec25b'>Prix total :</t> %2€<br/><t color='#cec25b'>Réservoir à :</t> %3%4", _litres, [_cost] call life_fnc_numberText, floor (_level * 100), "%"];

if(!local _vehicle) then
{
	// [[[_vehicle,_level],{_this select 0 setFuel (_this select 1);}],"BIS_fnc_spawn",_vehicle,false] spawn life_fnc_MP;
	[[_vehicle,_level],"life_fnc_setFuel",_vehicle,false] spawn life_fnc_MP;
}
else
{
	_vehicle setFuel _level;
};

life_cash = life_cash - _cost;
playSound "caching";
//["atm","take",_cost] call life_fnc_updateCash;