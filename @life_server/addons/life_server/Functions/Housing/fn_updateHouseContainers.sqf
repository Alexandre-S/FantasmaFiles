/*
	BLAH BLAH
	I LOVE NOTEPAD++ GET OVER IT
	BLAH!
*/
private["_house","_houseID","_containers","_query","_mode"];
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_mode = [_this,1,0,[0]] call BIS_fnc_param;

if(isNull _house) exitWith {systemChat "House null"; diag_log "House null"; };
_houseID = _house getVariable["house_id",-1];
if(_houseID == -1) exitWith {systemChat "HouseID invalid"; diag_log format ["HouseID invalid --- %1", _house];};

if(_mode == 0) then {
	_containers = _house getVariable ["containers",[]];
} else {
	_containers = [_this,2,[],[[]]] call BIS_fnc_param;
};
systemChat format["Number of containers found: %1",count _containers];

_arr = [];
{
	_className = typeOf _x;
	_weapons = getWeaponCargo _x;
	_magazines = getMagazineCargo _x;
	_items = getItemCargo _x;
	_backpacks = getBackpackCargo _x;
	
	_arr pushBack [_className,[_weapons,_magazines,_items,_backpacks]];
} foreach _containers;

_arr = [_arr] call DB_fnc_mresArray;
_query = format["UPDATE houses SET containers='%1' WHERE id='%2'",_arr,_houseID];
waitUntil {sleep (random 0.3); !DB_Async_Active};
[_query,1] call DB_fnc_asyncCall;
//systemChat "Query ran?";