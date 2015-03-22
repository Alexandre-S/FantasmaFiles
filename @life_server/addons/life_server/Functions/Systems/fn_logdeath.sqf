/*
	File: fn_logdeath.sqf
	Author: Havena
	
	Description:
	log death
*/
private["_pos","_uid","_sid","_type","_t1","_query","_result","_unit","_source","_distance","_weapon","_primary","_launcher","_handgun","_Object"];
if(server_debug) then { _t1 = diag_tickTime; };

diag_log format["[fn_logdeath] %1 ",_this]; 

_unit = [_this,0,ObjNull,[Objnull]] call BIS_fnc_param;
_source = [_this,1,ObjNull,[Objnull]] call BIS_fnc_param;
_type = [_this,2,0,[0]] call BIS_fnc_param;
_uid = _unit getVariable["steam64id",getPlayerUID _unit];

_pos = getPosATL _unit;

if(isnull _source) then {
	_sid = "";
	_distance = "";
	_weapon = "";
} else {
	
	//check source car
	if ((_source isKindOf "LandVehicle")||(_source isKindOf "ship")||(_source isKindOf "air")) then {
		if (driver _source != _source) then {
			_weapon = typeOf _source;
			_source = driver _source;
		};
	} else {
		_weapon = currentWeapon _source;
	};
	
	_sid = _source getVariable["steam64id",getPlayerUID _source];
	_distance = _unit distance _source;
};
// _uid = [_this,0,"",[""]] call BIS_fnc_param;
// _sid = [_this,1,"",[""]] call BIS_fnc_param;
// _pos = [_this,2,[],[[]]] call BIS_fnc_param;
// _unit = [_this,4,ObjNull,[Objnull]] call BIS_fnc_param;
// _distance = [_this,5,0,[0]] call BIS_fnc_param;
// _weapon = [_this,6,"",[""]] call BIS_fnc_param;

//suicide death
if(_uid == _sid) then {_weapon = "";};

/*if(_type == 0) then {
	[_unit] spawn {
		private["_unit","_Object"];
		_unit = _this select 0;
		if(count(weapons _unit) > 0) then {
			_Object = "GroundWeaponHolder" createVehicle getPosATL _unit;
			_Object setVariable["idleTime",1];
			{
				_unit action ["DropWeapon", _Object, _x];
			} foreach (weapons _unit);
			sleep 5;
			removeAllWeapons _unit;
			//remove objets
			[_Object, 600] spawn {
				sleep (_this select 1);
				deleteVehicle (_this select 0);
			};
		};
	};
	//remove body
	[_unit, 600] spawn {
	  sleep (_this select 1);
	  deleteVehicle (_this select 0);
	};
};*/

_query = format["INSERT INTO logdeath (uid, sid, pos, type, distance, weapon) VALUES ('%1', '%2', '%3', '%4', '%5', '%6')",_uid,_sid,_pos,_type,_distance,_weapon];
waitUntil {sleep (random 0.3); !DB_Async_Active};
_result = [_query,1] call DB_fnc_asyncCall;

if(server_debug && ((diag_tickTime - _t1) > 0.1) ) then { diag_log format["[debuglongtime] SYS fn_logdeath %1 ", diag_tickTime - _t1]; };