/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Updates the gang information?
*/
private["_mode","_group","_groupID","_bank","_maxMembers","_members","_query","_owner","_membersFinal","_slotUpgrade"];
_mode = [_this,0,0,[0]] call BIS_fnc_param;
_group = [_this,1,grpNull,[grpNull]] call BIS_fnc_param;

if(isNull _group) exitWith {}; //FAIL

_groupID = _group getVariable["gang_id",-1];
if(_groupID == -1) exitWith {};

switch (_mode) do {
	case 0: {
		_bank = [(_group getVariable ["gang_bank",0])] call DB_fnc_numberSafe;
		_maxMembers = _group getVariable ["gang_maxMembers",8];
		// _members = [(_group getVariable "gang_members")] call DB_fnc_mresArray;
		_owner = _group getVariable ["gang_owner",""];
		if(_owner == "") exitWith {};
		
		_query = format["UPDATE gangs SET bank='%1', maxmembers='%2', owner='%3' WHERE id='%4'",_bank,_maxMembers,_owner,_groupID];
	};
	
	case 1: {
		_bank = [_this,2,0,[0]] call BIS_fnc_param;
		_query = format["UPDATE gangs SET bank='%1' WHERE id='%2'",([_bank] call DB_fnc_numberSafe),_groupID];
	};
	
	case 2: {
		_slotUpgrade = [_this,2,8,[0]] call BIS_fnc_param;
		// _query = format["UPDATE gangs SET maxmembers='%1' WHERE id='%2'",(_group getVariable ["gang_maxMembers",8]),_groupID];
		_query = format["UPDATE gangs SET maxmembers='%1' WHERE id='%2'",_slotUpgrade,_groupID];
	};
	
	case 3: {
		// _owner = _group getVariable["gang_owner",""];
		_owner = [_this,2,0,[0]] call BIS_fnc_param;
		// if(_owner == "") exitWith {};
		if(_owner == 0) exitWith {};
		_query = format["UPDATE gangs SET owner='%1' WHERE id='%2'",_owner,_groupID];
	};
	
	case 4: {
		// _members = _group getVariable ["gang_members",nil];
		_members = [_this,2,[],[[]]] call BIS_fnc_param;
		// if(isNil "_members") exitWith {};
		if(count _members == 0) exitWith {};
		if(typeName _members != "ARRAY") exitWith {};
		_maxMembers = _group getVariable ["gang_maxMembers",8];
		if(count _members > _maxMembers) then {
			_membersFinal = [];
			for "_i" from 0 to _maxMembers -1 do {
				_membersFinal pushBack (_members select _i);
			};
			_membersFinal = [_membersFinal] call DB_fnc_mresArray;
		} else {
			_membersFinal = [_members] call DB_fnc_mresArray;
		};
		_query = format["UPDATE gangs SET members='%1' WHERE id='%2'",_membersFinal,_groupID];
	};
};

if(!isNil "_query") then {
	waitUntil {sleep (random 0.3); !DB_Async_Active};
	[_query,1] call DB_fnc_asyncCall;
};
