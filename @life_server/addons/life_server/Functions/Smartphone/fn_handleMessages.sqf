/*

	file: fn_handleMessages.sqf
	Author: Silex

*/	
	
private["_msg","_to","_target","_player","_type","_tabletemp"];
_target = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_msg = [_this,1,"",[""]] call BIS_fnc_param;
_player = [_this,2,ObjNull,[ObjNull]] call BIS_fnc_param;
_type = [_this,3,-1] call BIS_fnc_param;

//diag_log format["messageTEST %1",_this];

switch(_type) do
{
	//normal message
	case 0:
	{
		if(isNULL _target)  exitWith {};
		_to = call compile format["%1", _target];
		//[[_msg,name _player,0],"clientMessage",_to,false] spawn life_fnc_MP;
		[[_msg,_player,0],"life_fnc_clientMessage",_to,false] spawn life_fnc_MP;
		
		private["_query","_pid","_toID"];
		_pid = getPlayerUID _player;
		_toID = getPlayerUID _target;
		_msg = [_msg] call DB_fnc_mresString;
		_fromName = name _player;
		_toName = name _target;
		_query = format["INSERT INTO messages (fromID, toID, message, fromName, toName) VALUES('%1', '%2', '""%3""', '%4', '%5')",_pid,_toID,_msg,_fromName,_toName];
		diag_log format["Query: %1",_query];
		waitUntil {sleep (random 0.3); !DB_Async_Active};
		[_query,1] call DB_fnc_asyncCall;
	};
	//message to cops
	case 1:
	{	
		[[_msg,_player,1],"life_fnc_clientMessage",west,false] spawn life_fnc_MP;
	};
	//to admins
	case 2:
	{	
		[[_msg,_player,2],"life_fnc_clientMessage",allside,false] spawn life_fnc_MP;
	};
	//ems request
	case 3:
	{	
		[[_msg,_player,5],"life_fnc_clientMessage",independent,false] spawn life_fnc_MP;
	};
	//adminToPerson
	case 4:
	{
		_to = call compile format["%1", _target];
		if(isNull _to) exitWith {};
	
		[[_msg,_player,3],"life_fnc_clientMessage",_to,false] spawn life_fnc_MP;
	};
	//adminMsgAll
	case 5:
	{
		[[_msg,_player,4],"life_fnc_clientMessage",allside,false] spawn life_fnc_MP;
	};
	//MSGDEP
	case 6:
	{
		_tabletemp = [];
		{
			if(_x getVariable["life_dep",false]) then {
				_tabletemp pushBack _x;
			};
		} forEach playableUnits;
		if(count _tabletemp > 0) then {
			[[_msg,_player,6],"life_fnc_clientMessage",_tabletemp,false] spawn life_fnc_MP;
		};
	};
	//MSGTAXI
	case 7:
	{
		_tabletemp = [];
		{
			if(_x getVariable["life_taxi",false]) then {
				_tabletemp pushBack _x;
			};
		} forEach playableUnits;
		if(count _tabletemp > 0) then {
			[[_msg,_player,7],"life_fnc_clientMessage",_tabletemp,false] spawn life_fnc_MP;
		};
	};
};