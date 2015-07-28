/*
	File: fn_vehicleDead.sqf
	
	Description:
	Tells the database that this vehicle has died and can't be recovered.
*/
private["_vehicle","_plate","_assur","_uid","_query","_sql","_dbInfo","_deleted","_needfix"];
// diag_log format["%1",_this];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _vehicle) exitWith {diag_log format["[vehicleDead] ERROR NULL VEH %1",_vehicle];}; //NULL

_vehicle setVariable["idleTime",time];
_needfix = true;

_dbInfo = _vehicle getVariable["dbInfo",[]];
if(count _dbInfo == 0) exitWith {diag_log format["[vehicleDead] ERROR NULL dbInfo %1",_vehicle];};
_uid = _dbInfo select 0;
_plate = _dbInfo select 1;
_assur = _dbInfo select 2;

if(_assur == 1) then {
	_query = format["UPDATE vehicles SET insure='0', inventory='""[[],0]""' WHERE pid='%1' AND plate='%2'",_uid,_plate];
} else {
	_query = format["UPDATE vehicles SET active='0', alive='0', inventory='""[[],0]""' WHERE pid='%1' AND plate='%2'",_uid,_plate];	
	_needfix = false;
};
// _query = format["UPDATE vehicles SET alive='0' WHERE pid='%1' AND plate='%2'",_uid,_plate];



waitUntil {sleep (random 0.3); !DB_Async_Active};
_sql = [_query,1] call DB_fnc_asyncCall;


sleep (5 * 60);
if(!isNil "_vehicle" && {!isNull _vehicle}) then {
	// deleteVehicle _vehicle;
	[[_vehicle],"life_fnc_delveh",true,false] spawn life_fnc_MP;
	_deleted = true;
};


if(_deleted) then {
	if(!isNil "_x" && {!isNull _x}) then {
		sleep 1;
		[[_x],"life_fnc_delveh",true,false] spawn life_fnc_MP;
		// deleteVehicle _x;
		sleep 1;
	};
	// waitUntil {isNull _x};
	_deleted = false;
};

if(isNull _vehicle) then
{
	systemChat "DEAD VEH NULL";
	if(_needfix) then {
		_query = format["UPDATE vehicles SET active='0' WHERE pid='%1' AND plate='%2'",_uid,_plate];
		systemChat "DEAD Fixing...";
		waitUntil {sleep (random 0.3); !DB_Async_Active};
		_sql = [_query,1] call DB_fnc_asyncCall;
	};
};