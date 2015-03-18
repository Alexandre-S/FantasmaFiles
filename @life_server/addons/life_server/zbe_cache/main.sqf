zbe_aiCacheDist				= _this select 0;
zbe_minFrameRate			= _this select 1;
zbe_debug					= _this select 2;
zbe_vehicleCacheDistCar		= _this select 3;
zbe_vehicleCacheDistAir		= _this select 4;
zbe_vehicleCacheDistBoat	= _this select 5;

zbe_allGroups	   			= 0;
zbe_cachedGroups   			= [];
zbe_cachedUnits	   			= 0;
zbe_allVehicles	   			= 0;
zbe_cachedVehicles 			= 0;
zbe_objectView	   			= 0;
zbe_players					= [];
zbe_cachedAi 				= [];

call compileFinal preprocessFileLineNumbers "\life_server\zbe_cache\zbe_functions.sqf";

if (zbe_minFrameRate == -1) then {if (isDedicated || !hasinterface) then {zbe_minFrameRate = 16} else {zbe_minFrameRate = 31};};

zbe_mapsize = [] call bis_fnc_mapSize;
zbe_mapside = zbe_mapsize / 2;
zbe_centerPOS = [zbe_mapside, zbe_mapside, 0];

/*[] spawn  {
	while {true} do {
		sleep 15;
		zbe_players = (switchableUnits + playableUnits);
		{
			_disable = _x getVariable "zbe_cacheDisabled";
			_disable = if (isNil "_disable") then { false;
				} else {_disable;
				};
			if (!_disable && !(_x in zbe_cachedGroups)) then {
					zbe_cachedGroups = zbe_cachedGroups + [_x];
				 [zbe_aiCacheDist, _x, zbe_minFrameRate, zbe_debug] execFSM "\life_server\zbe_cache\zbe_aiCaching.fsm";
				};
		} forEach allGroups;
	};
};*/


[] spawn  {
	sleep 60;
	while {true} do {
		sleep 15;
		zbe_players = (switchableUnits + playableUnits);
		{
			if !(_x in zbe_players) then {
					_disable = _x getVariable ["zbe_cacheDisabled",false];
				if (!_disable && !(_x in zbe_cachedAi)) then {
					zbe_cachedAi = zbe_cachedAi + [_x];
					[zbe_aiCacheDist, _x, zbe_minFrameRate, zbe_debug] execFSM "\life_server\zbe_cache\zbe_aiCaching2.fsm";
				};
			};
		} forEach allUnits;
	};
};
/*
[] spawn  {
	sleep 60;
	private ["_allPlayers","_allAi","_aiacacher","_disable"];
	while {true} do {
		sleep 15;
		zbe_players = (switchableUnits + playableUnits);
		
		_allPlayers = [];
		_allAi = [];
		{
			if (isPlayer _x) then {
				_allPlayers pushBack _x;
			} else {
				if(_x != master_group) then {
					_allAi pushBack _x;
				};
			};
		} forEach allUnits;
		diag_log format["======= DEBUG - HAVENA_CACHE CHECK - PLAYER %1 - AI %2 - cached %3",count _allPlayers,count _allAi,count zbe_cachedAi];
		{
			_aiacacher = _x;
			_disable = _aiacacher getVariable ["zbe_cacheDisabled",false];
			
			if ({_x distance _aiacacher < zbe_aiCacheDist} count _allPlayers == 0) then {
				if (!_disable && !(_aiacacher in zbe_cachedAi) && !(isPlayer _aiacacher)) then {
					zbe_cachedAi = zbe_cachedAi + [_aiacacher];
					diag_log format["======= DEBUG - HAVENA_CACHE START - AI %1",_aiacacher];
					// _aiacacher hideobjectGlobal true;
					[[_aiacacher,true],"TON_fnc_hideobjectg",false,false] spawn life_fnc_MP;
				};
			} else {
			if (!_disable && (_aiacacher in zbe_cachedAi)) then {
					zbe_cachedAi = zbe_cachedAi - [_aiacacher];
					diag_log format["======= DEBUG - HAVENA_CACHE STOP - AI %1",_aiacacher];
					// _aiacacher hideobjectGlobal false;
					[[_aiacacher,false],"TON_fnc_hideobjectg",false,false] spawn life_fnc_MP;
				};
			};			
		} forEach _allAi;
		
		{
			if(isPlayer _x) then {
				[[_x,false],"TON_fnc_hideobjectg",false,false] spawn life_fnc_MP;
				zbe_cachedAi = zbe_cachedAi - [_x];
				diag_log format["======= DEBUG - HAVENA_CACHE STOPPLAYER - AI %1",_x];
			};
		} forEach zbe_cachedAi
	};
};
*/


// Vehicle Caching Beta (for client FPS)
[] spawn {
	sleep 60;
	private ["_assetscar", "_assetsair", "_assetsboat"];
	zbe_cached_cars = [];
	zbe_cached_air = [];
	zbe_cached_boat = [];
	while {true} do {
		_assetscar = zbe_centerPOS nearEntities ["LandVehicle", zbe_mapside];
		{
			if !(_x in zbe_cached_cars) then {
				zbe_cached_cars = zbe_cached_cars + [_x];
					[_x, zbe_vehicleCacheDistCar] execFSM "\life_server\zbe_cache\zbe_vehicleCaching.fsm";
			};
		} forEach _assetscar;
		_assetsair = zbe_centerPOS nearEntities ["Air", zbe_mapside];
		{
			if !(_x in zbe_cached_air) then {
				zbe_cached_air = zbe_cached_air + [_x];
				    [_x, zbe_vehicleCacheDistAir] execFSM "\life_server\zbe_cache\zbe_vehicleCaching.fsm";
			};
		} forEach _assetsair;
		_assetsboat = zbe_centerPOS nearEntities ["Ship", zbe_mapside];
		{
			if !(_x isKindOf "FloatingStructure_F") then {
				if !(_x in zbe_cached_boat) then {
					zbe_cached_boat = zbe_cached_boat + [_x];
						[_x, zbe_vehicleCacheDistBoat] execFSM "\life_server\zbe_cache\zbe_vehicleCaching.fsm";
				};
			};
		} forEach _assetsboat;

		{
			if (!(_x in _assetscar)) then {
			zbe_cached_cars = zbe_cached_cars - [_x];
			};
		} forEach zbe_cached_cars;
		{
			if (!(_x in _assetsair)) then {
			zbe_cached_air = zbe_cached_air - [_x];
			};
		} forEach zbe_cached_air;
		{
			if (!(_x in _assetsboat)) then {
			zbe_cached_boat = zbe_cached_boat - [_x];
			};
		} forEach zbe_cached_boat;
		zbe_allVehicles = (_assetscar + _assetsair + _assetsboat);
		sleep 15;
	};
};

[] spawn {
	sleep 60;
	if (zbe_debug) then {
			while {true} do {
				uiSleep 15;
				zbe_cachedUnits = (count allUnits - ({simulationEnabled _x} count allUnits));
				zbe_cachedVehicles = (count zbe_allVehicles - ({simulationEnabled _x} count zbe_allVehicles));
				zbe_allVehiclesCount = (count zbe_allVehicles);
				/*hintSilent parseText format ["
                <t color='#FFFFFF' size='1.5'>ZBE Caching</t><br/>
                <t color='#FFFFFF'>Debug data</t><br/><br/>
                <t color='#A1A4AD' align='left'>Game time in seconds:</t><t color='#FFFFFF' align='right'>%1</t><br/><br/>
                <t color='#A1A4AD' align='left'>Number of groups:</t><t color='#FFFFFF' align='right'>%2</t><br/>
                <t color='#A1A4AD' align='left'>All units:</t><t color='#FFFFFF' align='right'>%3</t><br/>
                <t color='#A1A4AD' align='left'>Cached units:</t><t color='#39a0ff' align='right'>%4</t><br/><br/>
                <t color='#A1A4AD' align='left'>All vehicles:</t><t color='#FFFFFF' align='right'>%5</t><br/>
                <t color='#A1A4AD' align='left'>Cached vehicles:</t><t color='#39a0ff' align='right'>%6</t><br/><br/>
                <t color='#A1A4AD' align='left'>FPS:</t><t color='#FFFFFF' align='right'>%7</t><br/><br/>
                <t color='#A1A4AD' align='left'>Obj draw distance:</t><t color='#FFFFFF' align='right'>%8</t><br/>
            ", (round time), count allGroups, count allUnits, zbe_cachedUnits, zbe_allVehiclesCount, zbe_cachedVehicles, (round diag_fps), zbe_objectView];*/
				zbe_log_stats = format ["Groups: %1 # All/Cached Units: %2/%3 # All/Cached Vehicles: %4/%5 # FPS: %6 # ObjectDrawDistance: %7", count allGroups, count allUnits, zbe_cachedUnits, zbe_allVehiclesCount, zbe_cachedVehicles, (round diag_fps), zbe_objectView];
				// diag_log format ["%1 ZBE_Cache (%2) ---  %3", (round time), name player, zbe_log_stats];
				diag_log format ["%1 ZBE_Cache --- %2 ", (round time), zbe_log_stats];
			};
		};
};
// Experimental, disabled for now
// if (!isDedicated) then {execFSM "\life_server\zbe_cache\zbe_clientObjectDrawAuto.fsm";};