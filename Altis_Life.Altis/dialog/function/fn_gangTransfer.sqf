#include <macro.h>
/*
	File: fn_gangTransfer.sqf
	Author: Youri Litovski
	
	Description:
	Transfert argent gang leader
*/
if((time - life_action_delay) < 2) exitWith {hint "Vous ne pouvez pas effectuer autant d'opération en si peu de temps.. merci de patienter"};
life_action_delay = time;
if!(init_gang) exitwith {};
private["_val","_unit","_tax","_gangBank","_gFund"];
_val = parseNumber(ctrlText 62702);
_gangBank = grpPlayer getVariable "gang_bank";
_unit = call compile format["%1",(lbData[62703,(lbCurSel 62703)])];
if(isNull _unit) exitWith {};
if!(_unit getVariable["init_gang",false]) exitwith {hint "Impossible, recommencez dans 30sec.."};
if((lbCurSel 62703) == -1) exitWith {hint localize "STR_ATM_NoneSelected"};
if(isNil "_unit") exitWith {hint localize "STR_ATM_DoesntExist"};
if(_val > 999999) exitWith {hint localize "STR_ATM_TransferMax";};
if(_val < 0) exitwith {};
if(!([str(_val)] call life_fnc_isnumeric)) exitWith {hint localize "STR_ATM_notnumeric"};
if(_val > _gangBank) exitWith {hint localize "STR_ATM_NotEnough"};
_tax = [_val] call life_fnc_taxRate;
if((_val + _tax) > _gangBank) exitWith {hint format[localize "STR_ATM_SentMoneyFail",_val,_tax]};

_gFund = _gangBank - (_val + _tax);
grpPlayer setVariable ["gang_bank",_gFund,true];

[[_val,profileName],"life_fnc_clientWireTransfer",_unit,false] spawn life_fnc_MP;
[] call life_fnc_gangAtmMenu;
hint format[localize "STR_ATM_SentMoneySuccess",[_val] call life_fnc_numberText,_unit getVariable["realname",name _unit],[_tax] call life_fnc_numberText];
// [1] call SOCK_fnc_updatePartial;
[] call life_fnc_getHLC;
[[1,grpPlayer],"TON_fnc_updateGang",serverhc,false] spawn life_fnc_MP;