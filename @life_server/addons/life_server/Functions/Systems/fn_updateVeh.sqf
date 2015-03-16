/*
	File: fn_updateVeh.sqf
	Author: Havena
	
	Description:
	launch update vehicle each x sec
*/
private["_vehicle","_vInfo","_plate","_uid","_pos","_dir","_query","_sql","_lastPos","_fuel","_inv","_lootm","_magBox","_weapBox","_itemBox","_realinv","_containerId","_i","_t1"];

// if(server_debug) then { _t1 = diag_tickTime; };
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _vehicle OR !alive _vehicle) exitWith {}; //If null / dead exit menu


if((_vehicle isKindOf "Car") || (_vehicle isKindOf "Air") || (_vehicle isKindOf "Ship")) then
{
	while{alive _vehicle} do
	{
		if(isNull _vehicle) exitWith {}; //If null
		if(server_debug) then { _t1 = diag_tickTime; };

		_vInfo = _vehicle getVariable ["dbInfo",[]];
		_lastPos = _vehicle getVariable["lastPos",[]];
		_lootm = _vehicle getVariable ["lootM",false];
		if(count _vInfo > 0) then
		{
			_plate = _vInfo select 1;
			_uid = _vInfo select 0;
			_pos = getPosATL _vehicle;
			_dir = getDir _vehicle;
			_fuel = fuel _vehicle;
			
			if (_lootm) then {
				_inv = _vehicle getVariable ["Trunk",[]];
				_inv = [_inv] call DB_fnc_mresArray;
			};
			
			//diag_log format["[updateVehicles][debug] vid %1 plate %2 pos %3", _uid, _plate, _pos];
			//diag_log format["[updateVehicles][debug2] %1", _lastPos];
			
			if (count _lastPos > 0) then
			{
				if(((_lastPos select 0) != (_pos select 0)) || ((_lastPos select 1) != (_pos select 1)) || (_lootm)) then {
					if (_lootm) then {
						_query = format["UPDATE vehicles SET inventory='%3', pos='%4', fuel='%5', dir='%6' WHERE pid='%1' AND plate='%2'",_uid,_plate,_inv,_pos,_fuel,_dir];
						_vehicle setVariable["lootM",nil];
					}
					else
					{
						_query = format["UPDATE vehicles SET pos='%3', fuel='%4', dir='%5' WHERE pid='%1' AND plate='%2'",_uid,_plate,_pos,_fuel,_dir];
					};
					_vehicle setVariable ["lastPos",_pos];
					waitUntil{!DB_Async_Active};
					_sql = [_query,1] call DB_fnc_asyncCall;
					//diag_log format["[updateVehicles][%1] plate = %2 uid = %3 pos = %4 fuel = %5", _vehicle, _plate, _uid, _pos, _fuel];
				};		
			}
			else
			{
				if (_lootm) then {
					_query = format["UPDATE vehicles SET inventory='%3', pos='%4', fuel='%5', dir='%6' WHERE pid='%1' AND plate='%2'",_uid,_plate,_inv,_pos,_fuel,_dir];
					_vehicle setVariable["lootM",nil];
				}
				else
				{
					_query = format["UPDATE vehicles SET pos='%3', fuel='%4', dir='%5' WHERE pid='%1' AND plate='%2'",_uid,_plate,_pos,_fuel,_dir];
				};
				_vehicle setVariable ["lastPos",_pos];
				waitUntil{!DB_Async_Active};
				_sql = [_query,1] call DB_fnc_asyncCall;
				//diag_log format["[updateVehicles][%1] plate = %2 uid = %3 pos = %4 fuel = %5", _vehicle, _plate, _uid, _pos, _fuel];
			};
		};
		if(server_debug && ((diag_tickTime - _t1) > 0.1) ) then { diag_log format["[debuglongtime] SYS fn_updateVeh %1 ", diag_tickTime - _t1]; };
		uiSleep 30;
	};
}