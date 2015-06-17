#include <macro.h>
/*
	File: fn_gangWithdraw.sqf
	Author: Youri Litovski
	
	Description:
	Retrait argent gang leader
*/
if((time - life_action_delay) < 2) exitWith {hint "Vous ne pouvez pas effectuer autant d'opération en si peu de temps.. merci de patienter"};
life_action_delay = time;
if!(init_gang) exitwith {};
private["_val","_gangBank","_gFund"];
_gangBank = grpPlayer getVariable "gang_bank";
_val = parseNumber(ctrlText 62702);
if(_val > 999999) exitWith {hint localize "STR_ATM_WithdrawMax";};
if(_val < 0) exitwith {};
if(!([str(_val)] call life_fnc_isnumeric)) exitWith {hint localize "STR_ATM_notnumeric"};
if(_val > _gangBank) exitWith {hint localize "STR_ATM_NotEnoughFunds"};
if(_val < 100 && life_atmcash > 20000000) exitWith {hint localize "STR_ATM_WithdrawMin"}; //Temp fix for something.

life_cash = life_cash + _val;
_gFund = _gangBank - _val;
grpPlayer setVariable ["gang_bank",_gFund,true];

hint format [localize "STR_ATM_WithdrawSuccess",[_val] call life_fnc_numberText];
[] call life_fnc_gangAtmMenu;
[0] call SOCK_fnc_updatePartial;
[] call life_fnc_getHLC;
[[1,grpPlayer,_gFund],"TON_fnc_updateGang",serverhc,false] spawn life_fnc_MP;