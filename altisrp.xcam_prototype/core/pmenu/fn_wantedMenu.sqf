#include <macro.h>
/*
	File: fn_wantedMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Opens the Wanted menu and connects to the APD.
*/
if((time - life_action_delay) < 10) exitWith {hint "Interpol: Echec de connexion.. Vos identifiants sont bloqués pour quelques secondes"};
life_action_delay = time;
private["_display","_list","_name","_crimes","_bounty","_units"];
disableSerialization;

createDialog "life_wanted_menu";

_display = findDisplay 2400;
_list = _display displayCtrl 2401;
lbClear _list;
_units = [];

ctrlSetText[2404,"Connection en cours..."];

if(__GETC__(life_coplevel) < 3 && __GETC__(life_adminlevel) == 0) then
{
	ctrlShow[2405,false];
};

[] call life_fnc_getHLC;
[[havena_id],"life_fnc_wantedFetch",serverhc,false] spawn life_fnc_MP;