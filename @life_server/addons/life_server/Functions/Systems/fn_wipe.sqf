/*
	File: fn_wipe.sqf
	Author: Havena
	
	Description:
	wipe
*/
private["_player","_t1","_name","_query","_result","_code","_uid","_array","_aliases","_sql","_profileName"];
if(server_debug) then { _t1 = diag_tickTime; };

_uid = [_this,0,"",[""]] call BIS_fnc_param;
_code = [_this,1,0,[0]] call BIS_fnc_param;
_profileName = [_this,2,"",[""]] call BIS_fnc_param;
_unitid = [_this,3,-1,[0]] call BIS_fnc_param;

if(_uid == "" OR _profileName == "" OR _unitid == -1) exitWith {};

if(_code == 0) then {
	_query = format["UPDATE players SET name='%3', wipe='%2' WHERE playerid='%1'",_uid,_code,_profileName];
	//Execute SQL Statement
	waitUntil{sleep 0.1;!DB_Async_Active};
	_sql = [_query,1] call DB_fnc_asyncCall;
} else {
	_query = format["SELECT name, aliases FROM players WHERE playerid='%1'",_uid];
	waitUntil{sleep 0.1;!DB_Async_Active};
	_result = [_query,2] call DB_fnc_asyncCall;

	_name = (_result select 0);
	_array = (_result select 1);
	_array = [_array] call DB_fnc_mresToArray;
	_array = call compile format["%1", _array];
	diag_log format["DEBUG WIPE : %1 - %2",_array,_name];
	if(!(_name in _array)) then
	{
		_aliases = _array;
		_aliases pushBack _name;
		_aliases = [_aliases] call DB_fnc_mresArray;
		_query = format["UPDATE players SET aliases='%1' WHERE playerid='%2'",_aliases,_uid];
		waitUntil{sleep 0.1;!DB_Async_Active};
		_result = [_query,1] call DB_fnc_asyncCall;
	};


	_query = format["UPDATE players SET name='%3', cash='0', bankacc='10000', coplevel='0', cop_licenses='""[]""', civ_licenses='""[]""', med_licenses='""[]""',cop_gear='""[]""', med_gear='""[]""', mediclevel='0', arrested='0', civ_gear='""[]""', blacklist='0', faction_reb='0', grade_reb='0', position='""[]""', taxi='0', dep='0', damage='0', hunger='100', thirst='100', wipe='%2' WHERE playerid='%1'",_uid,_code,_profileName];
	//Execute SQL Statement
	waitUntil{sleep 0.1;!DB_Async_Active};
	_sql = [_query,2] call DB_fnc_asyncCall;

	_query = format["UPDATE houses SET owned='0' WHERE pid = '%1'",_uid];
	//Execute SQL Statement
	waitUntil{sleep 0.1;!DB_Async_Active};
	_sql = [_query,2] call DB_fnc_asyncCall;

	_query = format["UPDATE vehicles SET alive='0' WHERE pid = '%1'",_uid];
	//Execute SQL Statement
	waitUntil{sleep 0.1;!DB_Async_Active};
	_sql = [_query,2] call DB_fnc_asyncCall;

	[[],"life_fnc_wipeok",_unitid,false] spawn life_fnc_MP;
};
if(server_debug && ((diag_tickTime - _t1) > 0.1) ) then { diag_log format["[debuglongtime] SYS fn_updateVeh %1 ", diag_tickTime - _t1]; };