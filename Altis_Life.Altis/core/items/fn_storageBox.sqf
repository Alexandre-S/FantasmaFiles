#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Tries to place a storage box in the nearest house.
*/
private["_boxType","_house","_positions","_containers","_pos","_houseCfg"];
_boxType = _this select 0;

// _house = nearestBuilding (getPosATL player);
_house = (nearestObjects[(getPosATL player),["House_F"],20] select 0);
// add
_houseCfg = [(typeOf _house)] call life_fnc_houseConfig;
// if(count _houseCfg == 0) then
// {
	// _house = (nearestObjects[(getPosATL player),["House_F"],20] select 0);
// };

if(!(_house in life_vehicles)) exitWith {hint localize "STR_ISTR_Box_NotinHouse"};
_containers = _house getVariable["containers",[]];
_houseCfg = [(typeOf _house)] call life_fnc_houseConfig;
if(count _houseCfg == 0) exitWith {}; //What the fuck happened?
if(count _containers >= (_houseCfg select 1)) exitWith {hint localize "STR_ISTR_Box_HouseFull"};
if(count _containers >= (__GETC__(life_donator))) exitWith {hint localize "STR_ISTR_Box_HouseFull_don"};

_slots = _house getVariable ["slots",[]];
_positions = [_house] call life_fnc_getBuildingPositions;
_pos = [0,0,0];
{
	_slots = _house getVariable ["slots",[]];
	if(!(_forEachIndex in _slots)) exitWith {
		_slots pushBack _forEachIndex;
		_house setVariable["slots",_slots,true];
		_pos = _x;
	};
} foreach _positions;
if(_pos isEqualTo [0,0,0]) exitWith {hint localize "STR_ISTR_Box_HouseFull_2"};
if(!([false,_boxType,1] call life_fnc_handleInv)) exitWith {};
switch (_boxType) do {
	case "storagesmall": {
		_container = "Box_IND_Grenades_F_RP" createVehicle [0,0,0];
		_container setPosATL _pos;
		
		_containers pushBack _container;
		// _house setVariable["containers",_containers,true];
		[[_house,"containers",_containers,true],"TON_fnc_setObjVar",false,false] spawn life_fnc_MP;
		[] call life_fnc_getHLC;
		[[_house,1,_containers],"TON_fnc_updateHouseContainers",serverhc,false] spawn life_fnc_MP;
		
		//Empty out the crate
		// clearWeaponCargoGlobal _container;
		// clearMagazineCargoGlobal _container;
		// clearItemCargoGlobal _container;
		// clearBackpackCargoGlobal _container;
	};
	
	case "storagebig": {
		_container = "B_supplyCrate_F_RP" createVehicle [0,0,0];
		_container setPosATL _pos;
		
		_containers pushBack _container;
		// _house setVariable["containers",_containers,true];
		[[_house,"containers",_containers,true],"TON_fnc_setObjVar",false,false] spawn life_fnc_MP;
		[] call life_fnc_getHLC;
		[[_house,1,_containers],"TON_fnc_updateHouseContainers",serverhc,false] spawn life_fnc_MP;
		
		//Empty out the crate
		// clearWeaponCargoGlobal _container;
		// clearMagazineCargoGlobal _container;
		// clearItemCargoGlobal _container;
		// clearBackpackCargoGlobal _container;
	};
};