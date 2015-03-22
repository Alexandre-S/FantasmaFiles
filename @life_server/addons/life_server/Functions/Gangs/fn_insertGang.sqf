/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Inserts the gang into the database.
*/
private["_ownerID","_uid","_gangName","_query","_queryResult","_gangMembers","_group","_unitid"];
_ownerID = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_uid = [_this,1,"",[""]] call BIS_fnc_param;
_gangName = [_this,2,"",[""]] call BIS_fnc_param;
_unitid = [_this,3,-1,[0]] call BIS_fnc_param;
_group = group _ownerID;

if(isNull _ownerID OR _uid == "" OR _gangName == "" OR _unitid == -1) exitWith {}; //Fail

//_ownerID = owner _ownerID;
_ownerID = _unitid;
_gangName = [_gangName] call DB_fnc_mresString;
_query = format["SELECT id FROM gangs WHERE name='%1' AND active='1'",_gangName];
waitUntil {sleep (random 0.3); !DB_Async_Active};
_queryResult = [_query,2] call DB_fnc_asyncCall;

//Check to see if the gang name already exists.
if(count _queryResult != 0) exitWith {
	[[1,"Il y a déjà un groupe utilisant ce nom. Merci d'en choisir un autre."],"life_fnc_broadcast",_ownerID,false] spawn life_fnc_MP;
	[["life_action_gangInUse",nil,missionNamespace],"life_fnc_netSetVar",_ownerID,false] spawn life_fnc_MP;
};

_query = format["SELECT id FROM gangs WHERE members LIKE '%2%1%2' AND active='1'",_uid,"%"];
waitUntil {sleep (random 0.3); !DB_Async_Active};
_queryResult = [_query,2] call DB_fnc_asyncCall;

//Check to see if this person already owns or belongs to a gang.
if(count _queryResult != 0) exitWith {
	[[1,"Vous faite déjà parti d'un groupe. Merci de le quitter."],"life_fnc_broadcast",_ownerID,false] spawn life_fnc_MP;
	[["life_action_gangInUse",nil,missionNamespace],"life_fnc_netSetVar",_ownerID,false] spawn life_fnc_MP;
};

//Check to see if a gang with that name already exists but is inactive.
_query = format["SELECT id, active FROM gangs WHERE name='%1' AND active='0'",_gangName];
waitUntil {sleep (random 0.3); !DB_Async_Active};
_queryResult = [_query,2] call DB_fnc_asyncCall;
_gangMembers = [[_uid]] call DB_fnc_mresArray;

if(count _queryResult != 0) then {
	_query = format["UPDATE gangs SET active='1', owner='%1',members='%2' WHERE id='%3'",_uid,_gangMembers,(_queryResult select 0)];
} else {
	_query = format["INSERT INTO gangs (owner, name, members) VALUES('%1','%2','%3')",_uid,_gangName,_gangMembers];
};
waitUntil {sleep (random 0.3); !DB_Async_Active};
_queryResult = [_query,1] call DB_fnc_asyncCall;

_group setVariable["gang_name",_gangName,true];
_group setVariable["gang_owner",_uid,true];
_group setVariable["gang_bank",0,true];
_group setVariable["gang_maxMembers",8,true];
_group setVariable["gang_members",[_uid],true];
[[_group],"life_fnc_gangCreated",_ownerID,false] spawn life_fnc_MP;

sleep 0.35;
_query = format["SELECT id FROM gangs WHERE owner='%1' AND active='1'",_uid];
waitUntil {sleep (random 0.3); !DB_Async_Active};
_queryResult = [_query,2] call DB_fnc_asyncCall;

_group setVariable["gang_id",(_queryResult select 0),true];
