#include <macro.h>
/*
	File: fn_cleanup.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Server-side cleanup script on vehicles.
	Sort of a lame way but whatever.
*/
private["_vehicleClass","_dbInfo","_units","_idleTime","_query","_sql","_uid","_plate","_t1","_deleted","_debugmap","_assur","_needfix"];
_deleted = false;
_debugmap = true;
while {true} do
{
	diag_log format["[debug] fn_cleanup start %1 ", ""];
	sleep (1 * 60);
	// if((isHLC) || (!(isHLC) && (time - last_HC_update) > 10)) then {
	// if(isHLC) then {
		if(server_debug) then { _t1 = diag_tickTime; };
		diag_log format["[debug] fn_cleanup foreach - last_HC_update = %1 - %2 : %3", last_HC_update, time, time - last_HC_update];
		{
			_idleTime = _x getVariable["idleTime",0];
			if(!alive _x) then {
				//_units = {(_x distance _x < 300)} count playableUnits;

				if(((time - _idleTime) > 180) || (_idleTime==0)) then {
					_dbInfo = _x getVariable["dbInfo",[]];
					_needfix = _x getVariable["needfix",false];
					if(count _dbInfo > 0 && {_x getVariable["waitdel",0] == 0}) then {
						_x setVariable["waitdel",1];
						_uid = _dbInfo select 0;
						_plate = _dbInfo select 1;
						_assur = _dbInfo select 2;

						if(_assur == 1) then {
							_x setVariable["needfix",true];
							_query = format["UPDATE vehicles SET insure='0', inventory='""[[],0]""' WHERE pid='%1' AND plate='%2'",_uid,_plate];
						} else {
							_query = format["UPDATE vehicles SET active='0', alive='0', inventory='""[[],0]""' WHERE pid='%1' AND plate='%2'",_uid,_plate];
						};
						
						[_x] spawn {
							private["_veh"];
							_veh = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
							sleep (4 * 60);
							_veh setVariable["waitdel",-1];
						};
						
						waitUntil {sleep (random 0.3); !DB_Async_Active};
						_sql = [_query,1] call DB_fnc_asyncCall;
					};
					if(!isNil "_x" && {!isNull _x} && {_x getVariable["waitdel",0] <= 0}) then {
						deleteVehicle _x;
						_deleted = true;
					};
					//{if (typeOf _x == "#particlesource") then {deleteVehicle _x}} forEach ((position _x) nearObjects 20);
					
					
					if(_deleted) then {
						if(!isNil "_x" && {!isNull _x}) then { sleep 1; deleteVehicle _x; sleep 1; };
						// waitUntil {isNull _x};
						_deleted = false;
					};

					if(isNull _x) then {
						systemChat "VEH NULL";

						if(_needfix) then {
							_query = format["UPDATE vehicles SET active='0' WHERE pid='%1' AND plate='%2'",_uid,_plate];
							systemChat "Fixing...";
							waitUntil {sleep (random 0.3); !DB_Async_Active};
							_sql = [_query,1] call DB_fnc_asyncCall;
						};					
						/*if(count _dbInfo > 0) then {
							systemChat "Fixing...";
							waitUntil {sleep (random 0.3); !DB_Async_Active};
							_sql = [_query,1] call DB_fnc_asyncCall;
						};*/
					};
				};
			} else {
				// _vehicleClass = getText(configFile >> "CfgVehicles" >> (typeOf _x) >> "vehicleClass");
				// if(_vehicleClass in ["Car","Support","Air","Ship","Armored","Submarine"]) then
				if((_x isKindOf "LandVehicle") || (_x isKindOf "Air") || ((_x isKindOf "Ship") && !(_x isKindOf "FloatingStructure_F"))) then {
					if(_idleTime == 0) then {
						// _x setVariable["idleTime",time,true];
						_x setVariable["idleTime",time];
					};
					if(((time - _idleTime) > 3600) && (time > 600)) then {
						if(count crew _x == 0) then {
							_dbInfo = _x getVariable["dbInfo",[]];
							if(count _dbInfo > 0) then {
								_uid = _dbInfo select 0;
								_plate = _dbInfo select 1;
								_query = format["UPDATE vehicles SET active='0', inventory='""[[],0]""' WHERE pid='%1' AND plate='%2'",_uid,_plate];
							};
							if(!isNil "_x" && {!isNull _x}) then {
								deleteVehicle _x;
								_deleted = true;
							};
							
							if(_deleted) then {
								if(!isNil "_x" && {!isNull _x}) then { sleep 1; deleteVehicle _x; sleep 1; };
								// waitUntil {isNull _x};
								_deleted = false;
							};

							if(isNull _x) then {
								systemChat "VEH REMOVE NULL";

								if(count _dbInfo > 0) then {
									systemChat "REMOVE Fixing...";
									waitUntil {sleep (random 0.3); !DB_Async_Active};
									_sql = [_query,1] call DB_fnc_asyncCall;
								};
								//{if (typeOf _x == "#particlesource") then {deleteVehicle _x}} forEach ((position _x) nearObjects 20);
							};
							/*
							switch (true) do
							{
								case ((_x getHitPointDamage "HitEngine") > 0.7 && _units == 0) : {deleteVehicle _x};
								case ((_x getHitPointDamage "HitLFWheel") > 0.98 && _units == 0) : {deleteVehicle _x};
								case ((_x getHitPointDamage "HitLF2Wheel") > 0.98 && _units == 0) : {deleteVehicle _x};
								case ((_x getHitPointDamage "HitRFWheel") > 0.98 && _units == 0) : {deleteVehicle _x};
								case ((_x getHitPointDamage "HitRF2Wheel") > 0.98 && _units == 0) : {deleteVehicle _x};
								case (_units == 0): {deleteVehicle _x};:)
							};
							*/
						};
					};
				} else {
					if((typeOf _x) in ["Land_BottlePlastic_V1_F","Land_TacticalBacon_F","Land_Can_V3_F","Land_CanisterFuel_F","Land_Money_F","Land_Suitcase_F"]) then {
						if ((time - _idleTime) > 600) then {
							if(!isNil "_x" && {!isNull _x}) then {
								deleteVehicle _x;
							};
						};
					} else {
						if(_debugmap) then {
							// _x setVariable["idleTime",1,true];
							_x setVariable["idleTime",1];
							_idleTime = 1;
						};
						//,"Box_NATO_Support_F","Box_NATO_AmmoVeh_F"
						if(_idleTime == 0 && !((typeOf _x) in ["Land_CargoBox_V1_F","B_UAV_01_F","Land_CashDesk_F","RoadBarrier_small_F","RoadCone_L_F","Land_Razorwire_F","Box_IND_Grenades_F","B_supplyCrate_F","AGM_JerryCan","AGM_SpareTrack","AGM_SpareWheel","Land_BagFence_Long_F","Land_BagFence_Round_F","WeaponHolderSimulated","GroundWeaponHolder"])) then {
							if(!isNil "_x" && {!isNull _x}) then {
								diag_log format["[debug] fn_cleanupdivers %1 ",typeOf _x];
								deleteVehicle _x;
							};
						};
					};
				};
			};

		} foreach vehicles;
		//Group clean (Local)
		{
			if(local _x && {(count units _x == 0)}) then {
				deleteGroup _x;
			};
		} foreach allGroups;
		_debugmap = false;
	if(server_debug && ((diag_tickTime - _t1) > 0.1) ) then { diag_log format["[debuglongtime] SYS fn_cleanup %1 ", diag_tickTime - _t1]; };
	// };
};