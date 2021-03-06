/*
	File: fn_queryRequest.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Handles the incoming request and sends an asynchronous query 
	request to the database.
	
	Return:
	ARRAY - If array has 0 elements it should be handled as an error in client-side files.
	STRING - The request had invalid handles or an unknown error and is logged to the RPT.
*/
private["_uid","_side","_query","_return","_queryResult","_qResult","_handler","_thread","_tickTime","_loops","_new","_unitid"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_side = [_this,1,sideUnknown,[civilian]] call BIS_fnc_param;
_ownerID = [_this,2,ObjNull,[ObjNull]] call BIS_fnc_param;
_unitid = [_this,3,-1,[0]] call BIS_fnc_param;

if(isNull _ownerID OR _unitid == -1) exitWith {};
//_ownerID = owner _ownerID;
_ownerID = _unitid;

_query = switch(_side) do {
	case west: {format["SELECT playerid, name, cash, bankacc, adminlevel, donatorlvl, cop_licenses, coplevel, cop_gear, position, alive, tfr, damage, hunger, thirst, sexe, wipe FROM players WHERE playerid='%1'",_uid];};
	// START CHANGES
	// HERE I'VE ADDED MY 3 FIELDS ON CIVILIAN
	case civilian: {format["SELECT playerid, name, cash, bankacc, adminlevel, donatorlvl, civ_licenses, arrested, civ_gear, blacklist, faction_reb, grade_reb, position, alive, tfr, damage, hunger, thirst, sexe, dep, taxi, wipe FROM players WHERE playerid='%1'",_uid];};
	// END CHANGES
	case independent: {format["SELECT playerid, name, cash, bankacc, adminlevel, donatorlvl, med_licenses, mediclevel, med_gear, position, alive, tfr, damage, hunger, thirst, sexe, wipe FROM players WHERE playerid='%1'",_uid];};
};

waitUntil{sleep (random 0.3); !DB_Async_Active};
_tickTime = diag_tickTime;
_queryResult = [_query,2] call DB_fnc_asyncCall;

diag_log "------------- Client Query Request -------------";
diag_log format["QUERY: %1",_query];
diag_log format["Time to complete: %1 (in seconds)",(diag_tickTime - _tickTime)];
diag_log format["Result: %1",_queryResult];
diag_log "------------------------------------------------";

if(typeName _queryResult == "STRING") exitWith {
	[[],"SOCK_fnc_insertPlayerInfo",_ownerID,false,true] spawn life_fnc_MP;
};

if(count _queryResult == 0) exitWith {
	[[],"SOCK_fnc_insertPlayerInfo",_ownerID,false,true] spawn life_fnc_MP;
};

//Blah conversion thing from a2net->extdb
private["_tmp"];
_tmp = _queryResult select 2;
_queryResult set[2,[_tmp] call DB_fnc_numberSafe];
_tmp = _queryResult select 3;
_queryResult set[3,[_tmp] call DB_fnc_numberSafe];

//Parse licenses (Always index 6)
_new = [(_queryResult select 6)] call DB_fnc_mresToArray;
if(typeName _new == "STRING") then {_new = call compile format["%1", _new];};
_queryResult set[6,_new];

//Convert tinyint to boolean
_old = _queryResult select 6;
for "_i" from 0 to (count _old)-1 do
{
	_data = _old select _i;
	_old set[_i,[_data select 0, ([_data select 1,1] call DB_fnc_bool)]];
};

_queryResult set[6,_old];

_new = [(_queryResult select 8)] call DB_fnc_mresToArray;
if(typeName _new == "STRING") then {_new = call compile format["%1", _new];};
_queryResult set[8,_new];
//Parse data for specific side.
switch (_side) do {
	case west: {
		// _queryResult set[9,([_queryResult select 9,1] call DB_fnc_bool)];
		//POS
		_new = [(_queryResult select 9)] call DB_fnc_mresToArray;
		if(typeName _new == "STRING") then {_new = call compile format["%1", _new];};
		_queryResult set[9,_new];
		//alive
		_queryResult set[10,([_queryResult select 10,1] call DB_fnc_bool)];
		_queryResult set[11,([_queryResult select 11,1] call DB_fnc_bool)];
		_queryResult set[15,([_queryResult select 15,1] call DB_fnc_bool)];
		_queryResult set[16,([_queryResult select 16,1] call DB_fnc_bool)];

	};
	
	case civilian: {
		//Arrested
		_queryResult set[7,([_queryResult select 7,1] call DB_fnc_bool)];
		
		//Blacklisted
		_queryResult set[9,([_queryResult select 9,1] call DB_fnc_bool)];

		// START CHANGES
		// HERE I CONVERT CIVLIAN BLACKLIST TO BOOLEAN
		// END CHANGES
		_houseData = _uid spawn TON_fnc_fetchPlayerHouses;
		waitUntil {sleep 0.01;scriptDone _houseData};
		_queryResult pushBack (missionNamespace getVariable[format["houses_%1",_uid],[]]);
		_gangData = _uid spawn TON_fnc_queryPlayerGang;
		waitUntil{sleep 0.01;scriptDone _gangData};
		_queryResult pushBack (missionNamespace getVariable[format["gang_%1",_uid],[]]);
		
		//POS
		_new = [(_queryResult select 12)] call DB_fnc_mresToArray;
		if(typeName _new == "STRING") then {_new = call compile format["%1", _new];};
		_queryResult set[12,_new];
		//alive
		_queryResult set[13,([_queryResult select 13,1] call DB_fnc_bool)];
		_queryResult set[14,([_queryResult select 14,1] call DB_fnc_bool)];
		_queryResult set[18,([_queryResult select 18,1] call DB_fnc_bool)];
		_queryResult set[19,([_queryResult select 19,1] call DB_fnc_bool)];
		_queryResult set[20,([_queryResult select 20,1] call DB_fnc_bool)];
		_queryResult set[21,([_queryResult select 21,1] call DB_fnc_bool)];
	};
	
	case independent: {
		//POS
		_new = [(_queryResult select 9)] call DB_fnc_mresToArray;
		if(typeName _new == "STRING") then {_new = call compile format["%1", _new];};
		_queryResult set[9,_new];
		//alive
		_queryResult set[10,([_queryResult select 10,1] call DB_fnc_bool)];
		_queryResult set[11,([_queryResult select 11,1] call DB_fnc_bool)];
		_queryResult set[15,([_queryResult select 15,1] call DB_fnc_bool)];
		_queryResult set[16,([_queryResult select 16,1] call DB_fnc_bool)];
	};
};

_keyArr = missionNamespace getVariable [format["%1_KEYS_%2",_uid,_side],[]];
_queryResult set[24,_keyArr];

[_queryResult,"SOCK_fnc_requestReceived",_ownerID,false] spawn life_fnc_MP;