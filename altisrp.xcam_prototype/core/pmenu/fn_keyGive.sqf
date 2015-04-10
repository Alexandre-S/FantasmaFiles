/*
	File: fn_keyGive.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gives a copy of the key for the selected vehicle to the selected player.
	Player must be within range.
*/
private["_dialog","_list","_plist","_sel","_vehicle","_owners","_index","_unit","_uid"];
disableSerialization;

_dialog = findDisplay 2700;
_list = _dialog displayCtrl 2701;
_plist = _dialog displayCtrl 2702;
ctrlShow[2703,false];

_sel = lbCurSel _list;
_vehicle = _list lbData _sel;
_vehicle = life_vehicles select parseNumber(_vehicle);

_sel = lbCurSel _plist;
_unit = _plist lbData _sel;
if(_unit == "targetkeygive") then {
	_unit = cursorTarget;
} else {
	_unit = call compile format["%1",_unit];
};
if(isNull _unit OR isNil "_unit") exitWith {ctrlShow[2703,true];}; 
if(_unit == player) exitWith {ctrlShow[2703,true];};
if(!isPlayer _unit) exitWith {hint "La cible n'est pas un joueur !";ctrlShow[2703,true];};
if(player distance _unit > 20) exitWith {hint "Cette personne est trop loin";ctrlShow[2703,true];};

_uid = getPlayerUID _unit;
_owners = _vehicle getVariable "vehicle_info_owners";
_index = [_uid,_owners] call life_fnc_index;
if(_index == -1) then 
{
	_owners pushBack [_uid,_unit getVariable["realname",name _unit]];
	_vehicle setVariable["vehicle_info_owners",_owners,true];
};

hint format["You have given %1 keys to your %2",_unit getVariable["realname",name _unit],typeOf _vehicle];
[[_vehicle,_unit,profileName], "life_fnc_clientGetKey",_unit,false] spawn life_fnc_MP;

ctrlShow[2703,true];