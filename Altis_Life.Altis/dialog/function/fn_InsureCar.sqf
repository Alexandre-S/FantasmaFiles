#include <macro.h>
 
private["_vehicle","_vid","_pid","_unit","_price"];
disableSerialization;
if(lbCurSel 2802 == -1) exitWith {hint localize "STR_Global_NoSelection"};
_vehicle = lbData[2802,(lbCurSel 2802)];
_vehicle = (call compile format["%1",_vehicle]) select 0;
_vid = lbValue[2802,(lbCurSel 2802)];
_pid = getPlayerUID player;
_unit = player;

if(isNil "_vehicle") exitWith {hint "Il y a une erreur dans la sélection..."};
if(_vehicle == "BAF_Offroad_D_HMG" || _vehicle == "O_MRAP_02_F" || _vehicle == "B_G_Offroad_01_armed_F" || _vehicle == "PMC_Offroad_Armed" || _vehicle == "O_MRAP_02_hmg_F") exitWith {hint "Vous ne pouvez pas assurer ce véhicule..."};

_price = [_vehicle,__GETC__(life_assur_prices)] call life_fnc_index;
if(_price == -1) then {_price = 10000;} else {_price = (__GETC__(life_assur_prices) select _price) select 1;};

_price = ceil(_price + (((__GETC__(life_donator) * 5) / 100) * _price));

if(playerSide == west) then { _price = 1; };
if(playerSide == independent) then { _price = 100; };

if(life_atmcash < _price) exitWith {hint format[(localize "STR_Garage_CashError"),[_price] call life_fnc_numberText];};
 
 [] call life_fnc_getHLC;
[[_vid,_pid,_unit,_price],"TON_fnc_InsureCar",serverhc,false] spawn life_fnc_MP;
 
hint "Votre véhicule est désormais assuré";
 
life_atmcash = life_atmcash - _price;
closeDialog 0;