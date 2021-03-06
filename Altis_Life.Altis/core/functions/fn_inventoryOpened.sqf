/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	For the mean time it blocks the player from opening another persons backpack
*/
private["_container","_unit","_house","_close","_houseCfg","_locked","_result"];
if(count _this == 1) exitWith {false};
_unit = _this select 0;
_container = _this select 1;
_result = false;

if(playerSide == west) exitWith {false};

_isPack = getNumber(configFile >> "CfgVehicles" >> (typeOf _container) >> "isBackpack");
if(_isPack == 1) exitWith {
	hint localize "STR_MISC_Backpack";
	_result = true;
	_result;
};

if((typeOf _container) in ["Box_IND_Grenades_F_RP","B_supplyCrate_F_RP"]) exitWith {
	// _house = nearestBuilding (getPosATL player);
	_house = (nearestObjects[(getPosATL player),["House_F"],20] select 0);
	// add
	_houseCfg = [(typeOf _house)] call life_fnc_houseConfig;
	// if(count _houseCfg == 0) then
	// {
		// _house = (nearestObjects[(getPosATL player),["House_F"],20] select 0);
	// };
	
	_locked = _house getVariable ["locked",nil];
	_close = false;
	if(isNil "_locked") then {_close = true;};
	if((typeof _house == "Land_Stone_Gate_F") or _close or (!(_house in life_vehicles) && {(_house getVariable ["locked",false])})) then {
		hint localize "STR_House_ContainerDeny";
		_result = true;
		_result;
	};
};

if(_container isKindOf "LandVehicle" OR _container isKindOf "Ship" OR _container isKindOf "Air") exitWith {
	if(!(_container in life_vehicles) && {(locked _container) == 2}) exitWith {
		hint localize "STR_MISC_VehInventory";
		_result = true;
		_result;
	};
};


//Allow alive players who've been knocked out to be looted, just not the dead ones
if(_container isKindOf "Man" && !alive _container && _container getVariable["side",civilian] == west) exitWith {
	hint localize "STR_NOTF_NoLootingPerson";
	_result = true;
	_result;
};
_result