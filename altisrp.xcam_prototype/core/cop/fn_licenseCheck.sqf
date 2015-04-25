/*
	File: fn_licenseCheck.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Returns the licenses to the cop.
*/
private["_cop","_licenses"];
_cop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _cop) exitWith {}; //Bad entry

_licenses = "";
_illegal = ["l_c_heroin","l_c_lsd","l_c_marijuana","l_c_rebel","l_c_thug","l_c_coke"];
//Licenses
{
	if(missionNamespace getVariable (_x select 0) && _x select 1 == "civ" && !(_x in _illegal)) then
	{
		_licenses = _licenses + ([_x select 0] call life_fnc_varToStr) + "<br/>";
	};
} foreach life_licenses;

hint "Un Gendarme vérifie vos licences";

if(_licenses == "") then {_licenses = (localize "STR_Cop_NoLicensesFound");};

[[profileName,_licenses],"life_fnc_licensesRead",_cop,FALSE] spawn life_fnc_MP;