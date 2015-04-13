/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Fetches all the players houses and sets them up.
*/
private["_query","_houses","_pos","_house","_houseCfg","_containers","_containerData","_trunk","_className","_weapons","_magazines","_items","_backpacks","_positions","_slots","_container","_weaponCount","_magazineCount","_itemCount","_backpackCount"];
if(_this == "") exitWith {};

_query = format["SELECT pid, pos, inventory, containers FROM houses WHERE pid='%1' AND owned='1'",_this];
waitUntil {sleep (random 0.3); !DB_Async_Active};
_houses = [_query,2,true] call DB_fnc_asyncCall;

_return = [];
{
	_pos = call compile format["%1",_x select 1];
	_house = nearestBuilding _pos;
	// add
	_houseCfg = [(typeOf _house)] call life_fnc_houseConfig;
	if(count _houseCfg == 0) then
	{
		_house = (nearestObjects[_pos,["House_F"],20] select 0);
	};
	
	_house allowDamage false;
	_containers = [];
	_house setVariable["slots",[],true];
	sleep 0.01;
	if(!isNil {(_house getVariable "containers")}) then {
		{if(!isNull _x) then {deleteVehicle _x;};} foreach (_house getVariable "containers");
	};
	
	_trunk = [_x select 2] call DB_fnc_mresToArray;
	if(typeName _trunk == "STRING") then {_trunk = call compile format["%1", _trunk];};
	_containerData = [_x select 3] call DB_fnc_mresToArray;
	if(typeName _containerData == "STRING") then {_containerData = call compile format["%1", _containerData];};
	_house setVariable["Trunk",_trunk,true];
	sleep 0.01;
	{
		if(count _x == 0) exitWith {}; //No containers / items.
		_className = _x select 0;
		_weapons = (_x select 1) select 0;
		_magazines = (_x select 1) select 1;
		_items = (_x select 1) select 2;
		_backpacks = (_x select 1) select 3;
		
		//Setup the variables
		_positions = [_house] call life_fnc_getBuildingPositions;
		_pos = [0,0,0];
		
		{
			_slots = _house getVariable ["slots",[]];
			if(!(_forEachIndex in _slots)) exitWith {
				_slots pushBack _forEachIndex;
				_house setVariable["slots",_slots,true];
				sleep 0.01;
				_pos = _x;
			};
		} foreach _positions;
		
		if(_pos isEqualTo [0,0,0]) exitWith {};
		
		_container = createVehicle[_className,_pos,[],0,"NONE"];
		waitUntil{sleep 0.1; !isNil "_container"};
		// _container enableSimulation false;
		_container allowDamage false;
		_container setPosATL _pos;
		_container setVariable["houseobj",_house,true];
		sleep 0.01;
		
		_containers pushBack _container;
		// clearWeaponCargoGlobal _container;
		// sleep 0.01;
		// clearItemCargoGlobal _container;
		// sleep 0.01;
		// clearMagazineCargoGlobal _container;
		// sleep 0.01;
		// clearBackpackCargoGlobal _container;
		// sleep 0.01;
		//Add weapons to the crate.
		{
			if(!(["CUP_",_x] call BIS_fnc_inString)) then {
				_weaponCount = (_weapons select 1) select _forEachIndex;
				_container addWeaponCargoGlobal [_x,_weaponCount];
			};
		} foreach (_weapons select 0);
		
		//Add magazines
		{
			if(!(["CUP_",_x] call BIS_fnc_inString)) then {
				_magazineCount = (_magazines select 1) select _forEachIndex;
				_container addMagazineCargoGlobal [_x,_magazineCount];
			};
		} foreach (_magazines select 0);
			
		//Add items
		{
			if(!(["CUP_",_x] call BIS_fnc_inString)) then {
				_itemCount = (_items select 1) select _forEachIndex;
				_container addItemCargoGlobal [_x,_itemCount];
			};
		} foreach (_items select 0);
		
		//Add backpacks
		{
			_backpackCount = (_backpacks select 1) select _forEachIndex;
			_container addBackpackCargoGlobal [_x,_backpackCount];
		} foreach (_backpacks select 0);
		
	} foreach _containerData;
	
	_house setVariable["containers",_containers,true];
	sleep 0.01;
	_return pushBack [_x select 1,_containers];
} foreach _houses;

missionNamespace setVariable[format["houses_%1",_this],_return];