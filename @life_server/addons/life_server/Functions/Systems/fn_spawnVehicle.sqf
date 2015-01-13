/*
	File: fn_spawnVehicle.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sends the query request to the database, if an array is returned then it creates
	the vehicle if it's not in use or dead.
*/
private["_vid","_sp","_pid","_query","_sql","_vehicle","_nearVehicles","_name","_side","_tickTime","_dir","_fuel","_unitid","_inv","_spexit"];
_vid = [_this,0,-1,[0]] call BIS_fnc_param;
_pid = [_this,1,"",[""]] call BIS_fnc_param;
_sp = [_this,2,[],[[],""]] call BIS_fnc_param;
_unit = [_this,3,ObjNull,[ObjNull]] call BIS_fnc_param;
_price = [_this,4,0,[0]] call BIS_fnc_param;
_dir = [_this,5,0,[0]] call BIS_fnc_param;
_unit_return = _unit;
_name = name _unit;
_side = side _unit;
_unitid = [_this,6,-1,[0]] call BIS_fnc_param;

//_unit = owner _unit;
_unit = _unitid;

if(_vid == -1 OR _pid == "") exitWith {};
if(_vid in serv_sv_use) exitWith {};
serv_sv_use pushBack _vid;

_query = format["SELECT id, side, classname, type, pid, alive, active, plate, color, insure, fuel, inventory FROM vehicles WHERE id='%1' AND pid='%2'",_vid,_pid];

waitUntil{sleep (random 0.3); !DB_Async_Active};
_tickTime = diag_tickTime;
_queryResult = [_query,2] call DB_fnc_asyncCall;

diag_log "------------- Client Query Request -------------";
diag_log format["QUERY: %1",_query];
diag_log format["Time to complete: %1 (in seconds)",(diag_tickTime - _tickTime)];
diag_log format["Result: %1",_queryResult];
diag_log "------------------------------------------------";

if(typeName _queryResult == "STRING") exitWith {};

_vInfo = _queryResult;
if(isNil "_vInfo") exitWith {serv_sv_use = serv_sv_use - [_vid];};
if(count _vInfo == 0) exitWith {serv_sv_use = serv_sv_use - [_vid];};

if((_vInfo select 5) == 0) exitWith
{
	serv_sv_use = serv_sv_use - [_vid];
	[[1,format[(localize "STR_Garage_SQLError_Destroyed"),_vInfo select 2]],"life_fnc_broadcast",_unit,false] spawn life_fnc_MP;
};

if((_vInfo select 6) == 1) exitWith
{
	serv_sv_use = serv_sv_use - [_vid];
	[[1,format[(localize "STR_Garage_SQLError_Active"),_vInfo select 2]],"life_fnc_broadcast",_unit,false] spawn life_fnc_MP;
};
_spexit = false;
if(typeName _sp != "STRING") then {
	// _nearVehicles = nearestObjects[_sp,["LandVehicle","Air","Ship"],10];
	_sp = _sp findEmptyPosition [0,100,_vInfo select 2];
	if(count _sp == 0) then { _spexit = true; };
// } else {
	// _nearVehicles = [];
};
// if(count _nearVehicles > 0) exitWith
if(_spexit) exitWith
{
	serv_sv_use = serv_sv_use - [_vid];
	[[_price,_unit_return],"life_fnc_garageRefund",_unit,false] spawn life_fnc_MP;
	[[1,(localize "STR_Garage_SpawnPointError")],"life_fnc_broadcast",_unit,false] spawn life_fnc_MP;
};
_fuel = parseNumber(_vInfo select 10);

_query = format["UPDATE vehicles SET active='1' WHERE pid='%1' AND id='%2'",_pid,_vid];

waitUntil {!DB_Async_Active};
[_query,false] spawn DB_fnc_asyncCall;
if(typeName _sp == "STRING") then {
	_vehicle = createVehicle[(_vInfo select 2),[0,0,999],[],0,"NONE"];
	waitUntil {!isNil "_vehicle" && {!isNull _vehicle}};
	_vehicle allowDamage false;
	_hs = nearestObjects[getMarkerPos _sp,["Land_Hospital_side2_F"],50] select 0;
	_vehicle setPosATL (_hs modelToWorld [-0.4,-4,12.65]);
	sleep 0.6;
} else {
	_vehicle = createVehicle [(_vInfo select 2),_sp,[],0,"NONE"];
	waitUntil {!isNil "_vehicle" && {!isNull _vehicle}};
	_vehicle allowDamage false;
	_vehicle setPos _sp;
	_vehicle setVectorUp (surfaceNormal _sp);
	_vehicle setDir _dir;
	_vehicle setFuel _fuel;
};

_inv = [(_vInfo select 9)] call DB_fnc_mresToArray;
if(typeName _inv == "STRING") then {_inv = call compile format["%1", _inv];};
_vehicle setVariable["Trunk",_inv,true];

_vehicle setVariable["idleTime",time,true];
_vehicle setVariable["lootModified",false,true];
_vehicle setVariable ["R3F_LOG_disabled", false,true];
_vehicle setVariable["lastPos",[]];

//Side Specific actions.
switch(_side) do {
	case west: {
		_vehicle setVariable ["tf_side", _side, true];	
	};
	
	case civilian: {
		_vehicle setVariable ["tf_side", _side, true];	
	};
	
	case independent: {
		_vehicle setVariable ["tf_side", civilian, true];	
	};
};
_vehicle setVariable ["tf_hasRadio", true, true];
_vehicle setVariable ["tf_range", 50000, true];

_vehicle lock 2;
//Send keys over the network.
[_pid,_side,_vehicle,1] call TON_fnc_keyManagement;
//[[_pid,_side,_vehicle,1],"TON_fnc_keyManagement",false,false] spawn life_fnc_MP;

_vehicle setVariable["vehicle_info_owners",[[_pid,_name]],true];
_vehicle setVariable["dbInfo",[(_vInfo select 4),_vInfo select 7,_vInfo select 9]];
//_vehicle addEventHandler["Killed","_this spawn TON_fnc_vehicleDead"]; //Obsolete function?
_vehicle addEventHandler["GetOut", {_this call life_fnc_vehicleExit;}];
[_vehicle] call life_fnc_clearVehicleAmmo;
_vehicle disableTIEquipment true; //No Thermals.. They're cheap but addictive.

if((_vInfo select 2) in life_ver_random) then { sleep 5; };

[[_vehicle],"life_fnc_addVehicle2Chain",_unit,false] spawn life_fnc_MP;
//Reskin the vehicle 
[[_vehicle,_vInfo select 8],"life_fnc_colorVehicle",true,false] spawn life_fnc_MP;
//Sets of animations
if((_vInfo select 1) == "civ" && (_vInfo select 2) == "B_Heli_Light_01_F" && _vInfo select 8 != 13) then
{
	[[_vehicle,"civ_littlebird",true],"life_fnc_vehicleAnimate",_unit,false] spawn life_fnc_MP;
};

if((_vInfo select 1) == "cop" && (_vInfo select 2) in ["sab_UN_Offroad","sab_UN_Hunter","C_SUV_01_F"]) then
{
	[[_vehicle,"cop_offroad",true],"life_fnc_vehicleAnimate",_unit,false] spawn life_fnc_MP;
};
if((_vInfo select 1) == "med" && (_vInfo select 2) == "C_Offroad_01_F") then
{
	if((_vInfo select 8) == 10) then {
		[[_vehicle,"service_truck",true],"life_fnc_vehicleAnimate",_unit,false] spawn life_fnc_MP;
		_vehicle setVariable ["service_truck", true, true];
	}else{
		[[_vehicle,"med_offroad",true],"life_fnc_vehicleAnimate",_unit,false] spawn life_fnc_MP;
	};
};
if((_vInfo select 1) == "civ" && (_vInfo select 2) == "LandRover_ACR") then
{
	[[_vehicle,"landrover_nocov",true],"life_fnc_vehicleAnimate",_unit,false] spawn life_fnc_MP;
};
if((_vInfo select 9) == 1) then
{
  [[1,"Votre vehicule est dispo et assuré ! "],"life_fnc_broadcast",_unit,false] spawn life_fnc_MP;
}
else
{
  [[1,"Votre vehicule est dispo !"],"life_fnc_broadcast",_unit,false] spawn life_fnc_MP;
};
serv_sv_use = serv_sv_use - [_vid];

[_vehicle] spawn
{
	_vehicle = _this select 0;
	sleep 5;
	_vehicle allowDamage true;
};

// Force session DB save every 1 mins
[] call life_fnc_getHLC;
[_vehicle,"TON_fnc_updateVeh",serverhc,false] spawn life_fnc_MP;

// Problem with TAFR
// [_vehicle,_vInfo select 8] spawn TON_fnc_fixTafr;