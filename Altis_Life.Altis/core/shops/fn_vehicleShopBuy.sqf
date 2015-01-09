/*
	File: fn_vehicleShopBuy.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Does something with vehicle purchasing.
*/
private["_mode","_spawnPoints","_className","_basePrice","_colorIndex","_spawnPoint","_vehicle","_hs"];
_mode = _this select 0;
if((lbCurSel 2302) == -1) exitWith {hint localize "STR_Shop_Veh_DidntPick"};
_className = lbData[2302,(lbCurSel 2302)];
_vIndex = lbValue[2302,(lbCurSel 2302)];
_vehicleList = [life_veh_shop select 0] call life_fnc_vehicleListCfg;
_basePrice = (_vehicleList select _vIndex) select 1;
 if(_mode) then {_basePrice = round(_basePrice)};
_colorIndex = lbValue[2304,(lbCurSel 2304)];

//Series of checks (YAY!)
if(_basePrice < 0) exitWith {}; //Bad price entry
if(life_cash < _basePrice) exitWith {hint format[localize "STR_Shop_Veh_NotEnough",[_basePrice - life_cash] call life_fnc_numberText];};
if(!([_className] call life_fnc_vehShopLicenses) && _className != "B_MRAP_01_hmg_F") exitWith {hint localize "STR_Shop_Veh_NoLicense"};

_spawnPoints = life_veh_shop select 1;
// _spawnPoint = "";
_spawnPoint = [];

if((life_veh_shop select 0) == "med_air_hs") then {
	if(count(nearestObjects[(getMarkerPos _spawnPoints),["Air"],35]) == 0) exitWith {
		_spawnPoint = _spawnPoints;
		// _hs = ((nearestObjects[getMarkerPos _spawnPoints,["Land_Hospital_side2_F"],50]) select 0);
		// _spawnPoint = setPosATL (_hs modelToWorld [-0.4,-4,12.65]);
	};
} else {
	//Check if there is multiple spawn points and find a suitable spawnpoint.
	if(typeName _spawnPoints == typeName []) then {
		//Find an available spawn point.
		_spawnPoint = (getMarkerPos (_spawnPoints select 0)) findEmptyPosition [5,100,_className];
		// {if(count(nearestObjects[(getMarkerPos _x),["LandVehicle","Ship","Air"],5]) == 0) exitWith {_spawnPoint = _x};} foreach _spawnPoints;
	} else {
		_spawnPoint = (getMarkerPos _spawnPoints) findEmptyPosition [5,100,_className];
		// if(count(nearestObjects[(getMarkerPos _spawnPoints),["LandVehicle","Ship","Air"],5]) == 0) exitWith {_spawnPoint = _spawnPoints};
	};
};

// if(_spawnPoint == "") exitWith {hint localize "STR_Shop_Veh_Block";};
if(count _spawnPoint == 0) exitWith {hint localize "STR_Shop_Veh_Block";};
life_cash = life_cash - _basePrice;
hint format[localize "STR_Shop_Veh_Bought",getText(configFile >> "CfgVehicles" >> _className >> "displayName"),[_basePrice] call life_fnc_numberText];

//Spawn the vehicle and prep it.
if((life_veh_shop select 0) == "med_air_hs") then {
	_vehicle = createVehicle [_className,[0,0,999],[], 0, "NONE"];
	waitUntil {!isNil "_vehicle"}; //Wait?
	_vehicle allowDamage false;
	_hs = nearestObjects[getMarkerPos _spawnPoint,["Land_Hospital_side2_F"],50] select 0;
	// _vehicle setPosATL _spawnPoint;
	_vehicle setPosATL (_hs modelToWorld [-0.4,-4,12.65]);
	_vehicle lock 2;
} else {
	_vehicle = createVehicle [_className, _spawnPoint, [], 0, "NONE"];
	waitUntil {!isNil "_vehicle"}; //Wait?
	_vehicle allowDamage false; //Temp disable damage handling..
	_vehicle lock 2;
	_vehicle setVectorUp (surfaceNormal _spawnPoint);
	// _vehicle setDir (markerDir _spawnPoint);
	_vehicle setPos _spawnPoint;
	_vehicle setFuel 0.8;
};

_vehicle setVariable["idleTime",time,true];
_vehicle setVariable["lootModified",false,true];
_vehicle setVariable ["R3F_LOG_disabled", false, true];
_vehicle setVariable ["tf_hasRadio", true, true];
_vehicle setVariable ["tf_range", 50000, true];

_vehicle addEventHandler["GetOut", {_this call life_fnc_vehicleExit;}];

//life_vehicles set[count life_vehicles,_vehicle]; //Add err to the chain.
life_vehicles pushBack _vehicle;
[] call life_fnc_getHLC;
[[getPlayerUID player,playerSide,_vehicle,1],"TON_fnc_keyManagement",serverhc,false] spawn life_fnc_MP;

if(_mode) then {
	//if(!(_className in ["B_G_Offroad_01_armed_F","B_MRAP_01_hmg_F"])) then {
		[] call life_fnc_getHLC;
		[[(getPlayerUID player),playerSide,_vehicle,_colorIndex],"TON_fnc_vehicleCreate",serverhc,false] spawn life_fnc_MP;
	//};
};

sleep 5;
[[_vehicle,_colorIndex],"life_fnc_colorVehicle",true,false] spawn life_fnc_MP;
[_vehicle] call life_fnc_clearVehicleAmmo;
[[_vehicle,"trunk_in_use",false,true],"TON_fnc_setObjVar",false,false] spawn life_fnc_MP;
[[_vehicle,"vehicle_info_owners",[[getPlayerUID player,profileName]],true],"TON_fnc_setObjVar",false,false] spawn life_fnc_MP;
_vehicle disableTIEquipment true; //No Thermals.. They're cheap but addictive.

//Side Specific actions.
switch(playerSide) do {
	case west: {
		_vehicle setVariable ["tf_side", playerSide, true];	
		[_vehicle,"cop_offroad",true] spawn life_fnc_vehicleAnimate;
	};
	
	case civilian: {
		_vehicle setVariable ["tf_side", playerSide, true];	
		if((life_veh_shop select 2) == "civ" && {_className == "B_Heli_Light_01_F"}) then {
			[_vehicle,"civ_littlebird",true] spawn life_fnc_vehicleAnimate;
		};
		if((life_veh_shop select 2) == "civ" && {_className == "LandRover_ACR"}) then {
			[_vehicle,"landrover_nocov",true] spawn life_fnc_vehicleAnimate;
		};
	};
	
	case independent: {
		_vehicle setVariable ["tf_side", civilian, true];
		if(_className == "C_Offroad_01_F") then {
			if(_colorIndex == 10) then {
				_vehicle setVariable ["service_truck", true, true];
				[_vehicle,"service_truck",true] spawn life_fnc_vehicleAnimate;
			} else {
				[_vehicle,"med_offroad",true] spawn life_fnc_vehicleAnimate;
			};
		};
	};
};
playSound "caching";

[_vehicle] spawn
{
	_vehicle = _this select 0;
	sleep 5;
	_vehicle allowDamage true;
};

// Force session DB save every 1 mins
[] call life_fnc_getHLC;
[_vehicle,"TON_fnc_updateVeh",serverhc,false] spawn life_fnc_MP;

[0] call SOCK_fnc_updatePartial;
// closeDialog 0; //Exit the menu.
true;