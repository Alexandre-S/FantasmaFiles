#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Deposits money into the players gang bank.
*/
private["_value","_gFund","_gMemb"];
_value = parseNumber(ctrlText 2702);

//Series of stupid checks
if(_value > 999999) exitWith {hint localize "STR_ATM_GreaterThan";};
if(_value < 0) exitWith {};
if(!([str(_value)] call life_fnc_isnumeric)) exitWith {hint localize "STR_ATM_notnumeric"};
if(_value > life_atmcash) exitWith {hint localize "STR_NOTF_NotEnoughFunds"};
_gFund = grpPlayer getVariable ["gang_bank",0];
_gMemb = count(grpPlayer getVariable ["gang_members",[]])*500000;
if(_gFund + _value > _gMemb) exitWith {hint localize "STR_ATM_GangLimit",[_gMemb] call life_fnc_numberText};
if(_gFund + _value > life_maxGangAccount) exitWith {hint localize "STR_ATM_GangLimit",[life_maxGangAccount] call life_fnc_numberText};

__SUB__(life_atmcash,_value);
_gFund = _gFund + _value;
grpPlayer setVariable ["gang_bank",_gFund,true];

hint format[localize "STR_ATM_DepositGang",[_value] call life_fnc_numberText];
[] call life_fnc_atmMenu;
[6] call SOCK_fnc_updatePartial; //Silent Sync
[] call life_fnc_getHLC;
[[1,grpPlayer],"TON_fnc_updateGang",serverhc,false] spawn life_fnc_MP;
