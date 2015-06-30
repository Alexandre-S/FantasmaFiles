/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Cleans up containers inside the house.
*/
private["_query","_houses","_pos","_house","_houseCfg"];
_query = format["SELECT pid, pos, inventory, containers FROM houses WHERE pid='%1' AND owned='1'",_this];
waitUntil {sleep (random 0.3); !DB_Async_Active};
_houses = [_query,2,true] call DB_fnc_asyncCall;

if(count _houses == 0) exitWith {};
{
	_pos = call compile format["%1",_x select 1];
	// _house = nearestBuilding _pos;
	_house = (nearestObjects[_pos,["House_F"],20] select 0);
	// add
	_houseCfg = [(typeOf _house)] call life_fnc_houseConfig;
	// if(count _houseCfg == 0) then
	// {
		// _house = (nearestObjects[_pos,["House_F"],20] select 0);
	// };
	
	if(!isNil {(_house getVariable "containers")}) then {
		{if(!isNull _x) then {deleteVehicle _x;};} foreach (_house getVariable "containers");
		_house setVariable["containers",nil,true];
	};
} foreach _houses;