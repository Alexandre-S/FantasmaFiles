/*
	File: fn_buyLicense.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Called when purchasing a license. May need to be revised.
*/
private["_type"];
_type = _this select 3;

_price = [_type] call life_fnc_licensePrice;
_license = [_type,0] call life_fnc_licenseType;
if(isNil "life_isblacklisted") life_isblacklisted = 0;

if(!life_isblacklisted && _licence == "license_civ_rebel") exitWith {hint "Vous devez faire une demande sur le forum pour rejoindre une faction terroriste"};


if(life_cash < _price) exitWith {hint format[localize "STR_NOTF_NE_1",[_price] call life_fnc_numberText,_license select 1];};

life_cash = life_cash - _price;
titleText[format[localize "STR_NOTF_B_1", _license select 1,[_price] call life_fnc_numberText],"PLAIN"];
missionNamespace setVariable[(_license select 0),true];