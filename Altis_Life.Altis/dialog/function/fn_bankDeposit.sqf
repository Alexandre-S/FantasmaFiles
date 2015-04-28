/*
	File: fn_bankDeposit.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Figure it out.
*/
if((time - life_action_delay) < 2) exitWith {hint "Vous ne pouvez pas effectuer autant d'opération en si peu de temps.. merci de patienter"};
life_action_delay = time;
private["_value"];
_value = parseNumber(ctrlText 2702);

//Series of stupid checks
if(_value > 999999) exitWith {hint localize "STR_ATM_GreaterThan";};
if(_value < 0) exitWith {};
if(!([str(_value)] call life_fnc_isnumeric)) exitWith {hint localize "STR_ATM_notnumeric"};
if(_value > life_cash) exitWith {hint localize "STR_ATM_NotEnoughCash"};

life_cash = life_cash - _value;
life_atmcash = life_atmcash + _value;

hint format[localize "STR_ATM_DepositMSG",[_value] call life_fnc_numberText];
[] call life_fnc_atmMenu;
[6] call SOCK_fnc_updatePartial;