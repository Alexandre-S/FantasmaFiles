/*
	Author: Karel Moricky
	Modified by Tonic for function white-listing.

	Description:
	Execute received remote execution

	Parameter(s):
	_this select 0: STRING - Packet variable name (always "life_fnc_MP_packet")
	_this select 1: ARRAY - Packet value (sent by life_fnc_MP function; see it's description for more details)
	
	Returns:
	BOOL - true if function was executed successfully
*/
private ["_validFunctions","_params","_functionName","_target","_isPersistent","_isCall","_varName","_varValue","_function","_callerName","_callerUID","_exitScope"];
_exitScope = false;
_varName = _this select 0;
_varValue = _this select 1;

_mode = 	[_varValue,0,[0]] call bis_fnc_param;
_params = 	[_varValue,1,[]] call bis_fnc_param;
_functionName =	[_varValue,2,"",[""]] call bis_fnc_param;
_target =	[_varValue,3,true,[ObjNull,true,0,[],sideUnknown,GrpNull,""]] call bis_fnc_param;
_isPersistent =	[_varValue,4,false,[false]] call bis_fnc_param;
_isCall =	[_varValue,5,false,[false]] call bis_fnc_param;
_callerName = [_varValue,6,"",[""]] call bis_fnc_param;
_callerUID = [_varValue,7,"",[""]] call bis_fnc_param;

if(!(["life_fnc_",_functionName] call BIS_fnc_inString) && {!(["SPY_fnc_",_functionName] call BIS_fnc_inString)} && {!(["DB_fnc_",_functionName] call BIS_fnc_inString)} && {!(["TON_fnc_",_functionName] call BIS_fnc_inString)} &&
{!(toLower(_functionName) in ["bis_fnc_execvm","bis_fnc_effectkilledairdestruction","bis_fnc_effectkilledsecondaries","bis_fnc_effectkilledairdestructionstage2","bis_fnc_modulelightning","bis_fnc_shownotification","bis_fnc_estimatedtimeleft","bis_fnc_curatorrespawn","mb_fnc_updateweather","mocap_fnc_strokeeffects","rhs_fnc_mi8_checkDoor"])} && {!(["SOCK_fnc_",_functionName] call BIS_fnc_inString)}) exitWith {diag_log format["===========MPexecFAIL2=========== %1 - %2 - %3",_functionName,_callerName,_callerUID]; false;};
if(toLower(_functionName) == "db_fnc_asynccall") exitWith {false};
if(toLower(_functionName) == "db_fnc_mresToArray") exitWith {false};

if(_functionName == "bis_fnc_execvm") then {
	_param2 = _params select 1;
	if(isNil "_param2") exitWith {_exitScope = true; diag_log format["===========MPexecFAIL3=========== %1 - %2 - %3 - %4 - %5 - %6 - %7",_functionName,_params,_target,_isPersistent,_isCall,_callerName,_callerUID];};
	if(_param2 != "initPlayerServer.sqf") exitWith {_exitScope = true; diag_log format["===========MPexecFAIL3=========== %1 - %2 - %3 - %4 - %5 - %6 - %7",_functionName,_params,_target,_isPersistent,_isCall,_callerName,_callerUID];};
};

if((_callerName == "" OR _callerUID == "") && (!(toLower(_functionName) in ["bis_fnc_modulelightning","bis_fnc_shownotification","bis_fnc_estimatedtimeleft","mocap_fnc_strokeeffects","life_fnc_attachSmoke","bis_fnc_effectkilledsecondaries","BIS_fnc_effectKilledAirDestruction","bis_fnc_execvm","bis_fnc_curatorrespawn","rhs_fnc_mi8_checkDoor"]))) exitWith {diag_log format["===========MPexecFAIL4=========== %1 - %2 - %3",_functionName,_callerName,_callerUID];}; //NO.

if(_callerUID != "__SERVER__" && _callerName != "__SERVER__" && toLower(_functionName) in ["spy_fnc_cookiejar","spy_fnc_notifyadmins"]) then {
	//Check if the sender & reported UID match, if they don't exit.
	if(toLower(_functionName) == "spy_fnc_cookiejar") exitWith {
		private["_reportUID"];
		_reportUID = _params select 1;
		if(_reportUID != _callerUID) exitWith {
			if(isServer && _mode == 0) then {
				[_callerName,_callerUID,"false_reports_to_spyglass"] call SPY_fnc_cookieJar;
				[[_callerName,"False reporting to SpyGlass (cheater)"],"SPY_fnc_notifyAdmins",true,false] spawn life_fnc_MP;
			};
			_exitScope = true;
		};
	};
	//So it's not the cookiejar, let's check the admin notification and make sure the report matches.
	private["_reportName"];
	_reportName = _params select 0;
	if(_callerName != _reportName) exitWith {
		if(isServer && _mode == 0) then {
			[_callerName,_callerUID,"false_reports_to_spyglass"] call SPY_fnc_cookieJar;
			[[_callerName,"False reporting to SpyGlass (cheater)"],"SPY_fnc_notifyAdmins",true,false] spawn life_fnc_MP;
		};
		_exitScope = true;
	};
};
	
if(toLower(_functionName) == "bis_fnc_endmission") exitWith {false}; //Don't allow BIS_fnc_endMission to be passed.

if(_exitScope) exitWith {false}; //Blah.
if (ismultiplayer && _mode == 0) then {
	if (isserver) then {
		if (typename _target == typename []) then {

			//--- Multi execution
			{
				[_varName,[_mode,_params,_functionName,_x,_isPersistent,_isCall,_callerName,_callerUID]] call life_fnc_MPexec;
			} foreach _target;
		} else {

			//--- Single execution
			private ["_ownerID","_serverID"];
			_serverID = owner (missionnamespace getvariable ["bis_functions_mainscope",objnull]); //--- Server ID is not always 0

			//--- Server process
			switch (typename _target) do {
				case (typename ""): {
					_ownerID = owner (missionnamespace getvariable [_target,objnull]);
				};
				case (typename objnull): {
					private ["_targetCuratorUnit"];
					_targetCuratorUnit = getassignedcuratorunit _target;
					if !(isnull _targetCuratorUnit) then {_target = _targetCuratorUnit;};
					_ownerID = owner _target;
				};
				case (typename true): {
					_ownerID = [_serverID,-1] select _target;
				};
				case (typename 0): {
					_ownerID = _target;
				};
				case (typename grpnull);
				case (typename sideUnknown): {
					_ownerID = -1;
				};
			};
			life_fnc_MP_packet = [1,_params,_functionName,_target,_isPersistent,_isCall,"__SERVER__","__SERVER__"];

			//--- Send to clients
			if (_ownerID < 0) then {
				//--- Everyone
				publicvariable "life_fnc_MP_packet";
			} else {
				if (_ownerID != _serverID) then {
					//--- Client
					_ownerID publicvariableclient "life_fnc_MP_packet";
				};
			};

			//--- Server execution (for all or server only)
			if (_ownerID < 0 || _ownerID == _serverID) then {
				["life_fnc_MP_packet",life_fnc_MP_packet] spawn life_fnc_MPexec;
			};

			//--- Persistent call (for all or clients)
			if (_isPersistent) then {
				if (typename _target != typename 0) then {
					private ["_logic","_queue"];
					_logic = missionnamespace getvariable ["bis_functions_mainscope",objnull];
					_queue = _logic getvariable ["BIS_fnc_MP_queue",[]];
					_queue set [
						count _queue,
						+life_fnc_MP_packet
					];
					_logic setvariable ["BIS_fnc_MP_queue",_queue,true];
				} else {
					["Persistent execution is not allowed when target is %1. Use %2 or %3 instead.",typename 0,typename objnull,typename false] call bis_fnc_error;
				};
			};
		};
	};

} else {
	//--- Client
	private ["_canExecute"];
	_canExecute = switch (typename _target) do {
		case (typename grpnull): {player in units _target};
		case (typename sideUnknown): {playerside == _target;};
		case (typeName ""): {if(!isNull player) then {getPlayerUID player == _target;} else {false}};
		default {true};
	};

	if (_canExecute) then {
		_function = missionnamespace getvariable _functionName;
		if (!isnil "_function") then {
			if (_isCall) then {
				_params call _function;
			} else {
				_params spawn _function;
			};
			true
		} else {
			["Function '%1' does not exist",_functionName] call bis_fnc_error;
			false
		};
	};
};