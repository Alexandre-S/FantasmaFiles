/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Used for syncing house container data but when the inventory menu
	is closed a sync request is sent off to the server.
*/
private["_container","_house","_houseCfg"];
_container = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _container) exitWith {}; //MEH

if((typeOf _container) in ["Box_IND_Grenades_F_RP","B_supplyCrate_F_RP"]) exitWith {
	_house = _container getVariable ["houseobj",objNull];
	if(isNull _house) then {
		_house = lineIntersectsWith [getPosASL player, ATLtoASL screenToWorld[0.5,0.5]];
	};
	if(typeName _house != "ARRAY") then {
		// add
		_houseCfg = [(typeOf _house)] call life_fnc_houseConfig;
		if(count _houseCfg == 0) then
		{
			_house = (nearestObjects[(getPosATL player),["House_F"],20] select 0);
		};
	} else {
		switch(true) do {
			case (count _house == 0): {_exit = true;};
			case (count _house == 1): {_house = _house select 0;};
			default {
				{if(_x isKindOf "House_F" && (_x getVariable["house_id",-1] != -1)) exitWith {_house = _x;};} foreach _house;
			};
		};
	};
	
	if(!isNil "_exit" OR !(_house isKindOf "House_F")) exitWith {systemChat localize "STR_House_ContainerError"};
	[] call life_fnc_getHLC;
	[[_house],"TON_fnc_updateHouseContainers",serverhc,false] spawn life_fnc_MP;
};

[3] call SOCK_fnc_updatePartial; // save player gear