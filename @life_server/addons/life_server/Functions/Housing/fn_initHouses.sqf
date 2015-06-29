/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	WHAT THE HELL DO YOU THINK IT DOES?!?!!??!?!!?!??!
*/
private["_queryResult","_query","_count","_house","_houseCfg","_position","_numOfDoors","_pos"];
waitUntil {sleep (random 0.3); !DB_Async_Active};
_count = (["SELECT COUNT(*) FROM houses WHERE owned='1'",2] call DB_fnc_asyncCall) select 0;

for [{_x=0},{_x<=_count},{_x=_x+10}] do {
	waitUntil {sleep (random 0.3); !DB_Async_Active};
	_query = format["SELECT houses.id, houses.pid, houses.pos, players.name FROM houses INNER JOIN players ON houses.pid=players.playerid WHERE houses.owned='1' LIMIT %1,10",_x];
	_queryResult = [_query,2,true] call DB_fnc_asyncCall;
	if(count _queryResult == 0) exitWith {};
	
	{
		_pos = call compile format["%1",_x select 2];
		// _house = nearestBuilding _pos;
		// if(_house distance _pos > 1) then {
		//_house = (nearestObjects[_pos,["House_F"],20] select 0);
		_house = nearestObject [_pos,"house_F"];
		// };
		// add
		_houseCfg = [(typeOf _house)] call life_fnc_houseConfig;
		// if(count _houseCfg == 0) then
		// {
			// _house = (nearestObjects[_pos,["House_F"],20] select 0);
		// };
		
		_house setVariable["house_owner",[_x select 1,_x select 3],true];
		sleep 0.01;
		_house setVariable["house_id",_x select 0,true];
		sleep 0.01;
		_house setVariable["locked",true,true]; //Lock up all the stuff.
		sleep 0.01;
		_numOfDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors");
		for "_i" from 1 to _numOfDoors do {
			_house setVariable[format["bis_disabled_Door_%1",_i],1,true];
			sleep 0.01;
		};
	} foreach _queryResult;
};