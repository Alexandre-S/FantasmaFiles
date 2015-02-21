#define __CONST__(var1,var2) var1 = compileFinal (if(typeName var2 == "STRING") then {var2} else {str(var2)})
DB_Async_Active = false;
DB_Async_ExtraLock = false;

server_test = false;
publicVariable "server_test";
serverhc = false;
server_debug = true;
// life_ver_random = ["C_Offroad_01_F","C_Hatchback_01_F","C_Hatchback_01_sport_F","C_SUV_01_F","C_Van_01_box_F","C_Van_01_transport_F"];


if ((!IsDedicated)&&(!hasinterface)) then {	isHLC = true; }else{ isHLC = false; };

if(!isHLC) then {
	//([0,0,0] nearestObject 1122929) setDamage 1;
	_nObject_list = [302864,513103,514815,130811,130810,339880,519962,519964,519999,519961,519963,520363,520365,520367,520362,520364,520366,520424,520754,520756,520775,520758,520755,520757,520759,520760,530419,530418,530422,430421,530420,368514,368604,529115,530262,530263,530264,530419,530418,530422,530421,530420,526044,367582,366793,366795,366794,366934,89248,14057,14055,14056,72020];
	{
		_nObject = [0,0,0] nearestObject _x;
		_nObject enableSimulationGlobal false;
		_nObject allowDamage false;
	} forEach _nObject_list;
	
	life_server_isReady = false;
	publicVariable "life_server_isReady";

	last_HC_update = 0;
	hlcAI = false;

	// [] execVM "\life_server\functions.sqf";
	[] execVM "\life_server\eventhandlers.sqf";

	//I am aiming to confuse people including myself, ignore the ui checks it's because I test locally.
	if(server_test) then {
		
	
		_extDB = false;

		//Only need to setup extDB once.
		if(isNil {uiNamespace getVariable "life_sql_id"}) then {
			life_sql_id = round(random(9999));
			__CONST__(life_sql_id,life_sql_id);
			uiNamespace setVariable ["life_sql_id",life_sql_id];

			//extDB Version
			_result = "extDB" callExtension "9:VERSION";
			diag_log format ["extDB: Version: %1", _result];
			if(_result == "") exitWith {};
			if ((parseNumber _result) < 14) exitWith {diag_log "Error: extDB version 14 or Higher Required";};

			//Initialize the database
			_result = "extDB" callExtension "9:DATABASE:Database2";
			if(_result != "[1]") exitWith {diag_log "extDB: Error with Database Connection";};
			_result = "extDB" callExtension format["9:ADD:DB_RAW_V2:%1",(call life_sql_id)];
			if(_result != "[1]") exitWith {diag_log "extDB: Error with Database Connection";};
			"extDB" callExtension "9:LOCK";
			_extDB = true;
			diag_log "extDB: Connected to Database";
		} else {
			life_sql_id = uiNamespace getVariable "life_sql_id";
			__CONST__(life_sql_id,life_sql_id);
			_extDB = true;
			diag_log "extDB: Still Connected to Database";
		};

		//Broadbase PV to Clients, to warn about extDB Error.
		//	exitWith to stop trying to run rest of Server Code
		if (!_extDB) exitWith {
			life_server_extDB_notLoaded = true;
			publicVariable "life_server_extDB_notLoaded";
			diag_log "extDB: Error checked extDB/logs for more info";
		};

		//Run procedures for SQL cleanup on mission start.
		["CALL resetLifeVehicles",1] spawn DB_fnc_asyncCall;
		["CALL deleteDeadVehicles",1] spawn DB_fnc_asyncCall;
		["CALL deleteOldHouses",1] spawn DB_fnc_asyncCall;
		["CALL deleteOldGangs",1] spawn DB_fnc_asyncCall; //Maybe delete old gangs
	};
	
	life_adminlevel = 0;
	life_medicLevel = 0;
	life_coplevel = 0;
	

	//Null out harmful things for the server.
	__CONST__(JxMxE_PublishVehicle,"No");

	//[] execVM "\life_server\fn_initHC.sqf";

	// life_radio_west = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []];
	// life_radio_civ = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []];
	// life_radio_indep = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []];

	serv_sv_use = [];
	
	if(server_test) then {
		/*fed_bank setVariable["safe",(count playableUnits),true];
		[] spawn TON_fnc_federalUpdate;*/

		[] spawn TON_fnc_cleanup;
		life_wanted_list = [];
	};
	[] execFSM "\life_server\cleanup.fsm";
	//General cleanup for clients disconnecting.
	// addMissionEventHandler ["HandleDisconnect",{_this call TON_fnc_clientDisconnect; false;}]; //Do not second guess this, this can be stacked this way.
	HC_DC = ["HC_Disconnected","onPlayerDisconnected",{if(!isNil "Havena_HLCOBJ" && {_uid == getPlayerUID Havena_HLCOBJ}) then {life_HC_isActive = false;};}] call BIS_fnc_addStackedEventHandler;
	
	// serv var to hc
	serverloadhc = true;
	publicVariable "serverloadhc";
	
	if(server_test) then {
	
		/*if(isNil("life_market_prices")) then
		{
			[] call TON_fnc_marketconfiguration;
			diag_log "Market prices generated!";
			"life_market_prices" addPublicVariableEventHandler
			{
				diag_log format["Market prices updated! %1", _this select 1];
			};
		};*/
		
		_handle = [] spawn TON_fnc_getSetPrice;
		waitUntil {sleep 0.1;scriptDone _handle};

		countsellitem = 0;
		last_sellArrayMulti = 0;
		// update sellArrayMulti every min
		[] spawn  {
		  while{true} do
		  {
			sleep (1 * 60);
			if(countsellitem > 1000 && ((time - last_sellArrayMulti) > 900)) then {
				last_sellArrayMulti = time;
				[] call TON_fnc_sellArrayMulti;
			};
		  };
		};
	}
	else
	{
		waitUntil {sleep 0.1;!isNil "Havena_HLCOBJ2"};
	};
	
	addMissionEventHandler ["HandleDisconnect",{[] call life_fnc_getHLC; [_this,"TON_fnc_clientDisconnect",serverhc,false] call life_fnc_MP; false;}]; //Do not second guess this, this can be stacked this way.

	life_gang_list = [];
	publicVariable "life_gang_list";
	// client_session_list = [];


	[] spawn
	{
		private["_logic","_queue"];
		while {true} do
		{
			sleep (30 * 60);
			_logic = missionnamespace getvariable ["bis_functions_mainscope",objnull];
			_queue = _logic getvariable "BIS_fnc_MP_queue";
			_logic setVariable["BIS_fnc_MP_queue",[],TRUE];
		};
	};


	[] spawn
	{
		while {true} do
		{
			sleep (30 * 60);
			{
				_x setVariable["sellers",[],true];
			} foreach [Dealer_1,Dealer_2,Dealer_3];
		};
	};

	//Strip NPC's of weapons
	{
		if(!isPlayer _x) then {
			_npc = _x;
			{
				if(_x != "") then {
					_npc removeWeapon _x;
				};
			} foreach [primaryWeapon _npc,secondaryWeapon _npc,handgunWeapon _npc];
		};
	} foreach allUnits;

	if(server_test) then {
		_handle = [] spawn TON_fnc_initHouses;
		waitUntil {sleep 0.1;scriptDone _handle};
		_handle = [] spawn TON_fnc_spawnVehicleActive;
		waitUntil {sleep 0.1;scriptDone _handle};
		HCserverloadVeh = true;
		publicVariable "HCserverloadVeh";
	}else{
		waitUntil {sleep 0.1;!isNil "HCserverload"};
	};
	
	TON_fnc_hideobjectg = 
	compileFinal "
		(_this select 0) hideObjectGlobal (_this select 1);
	";
	
	TON_fnc_player_query =
	compileFinal "
		private[""_ret""];
		_ret = _this select 0;
		if(isNull _ret) exitWith {};
		if(isNil ""_ret"") exitWith {};
		
		[[life_atmcash,life_cash,owner player,player],""life_fnc_admininfo"",_ret,false] spawn life_fnc_MP;
	";
	publicVariable "TON_fnc_player_query";
	
	//Lockup the dome
	private["_dome","_rsb"];
	_dome = nearestObject [[16019.5,16952.9,0],"Land_Dome_Big_F"];
	_rsb = nearestObject [[16019.5,16952.9,0],"Land_Research_house_V1_F"];

	for "_i" from 1 to 3 do {_dome setVariable[format["bis_disabled_Door_%1",_i],1,true]; _dome animate [format["Door_%1_rot",_i],0];};
	_rsb setVariable["bis_disabled_Door_1",1,true];
	_rsb allowDamage false;
	_dome allowDamage false;
	life_server_isReady = true;
	publicVariable "life_server_isReady";
	
	if(server_test) then {
		//[AiCacheDistance(players),TargetFPS(-1 for Auto),Debug,CarCacheDistance,AirCacheDistance,BoatCacheDistance]execvm "zbe_cache\main.sqf";
		[100,-1,true,100,1000,1000]execvm "\life_server\zbe_cache\main.sqf";
		[] spawn TON_fnc_huntingZone;
	};
}
else
{
	// [] execVM "\life_server\functions.sqf";
	"life_fnc_MP_packet" addPublicVariableEventHandler {[_this select 0,_this select 1] call life_fnc_MPexec;};
		
	_extDB = false;

	//Only need to setup extDB once.
	if(isNil {uiNamespace getVariable "life_sql_id"}) then {
		life_sql_id = round(random(9999));
		__CONST__(life_sql_id,life_sql_id);
		uiNamespace setVariable ["life_sql_id",life_sql_id];

		//extDB Version
		_result = "extDB" callExtension "9:VERSION";
		diag_log format ["extDB: Version: %1", _result];
		if(_result == "") exitWith {};
		if ((parseNumber _result) < 14) exitWith {diag_log "Error: extDB version 14 or Higher Required";};

		//Initialize the database
		_result = "extDB" callExtension "9:DATABASE:Database2";
		if(_result != "[1]") exitWith {diag_log "extDB: Error with Database Connection";};
		_result = "extDB" callExtension format["9:ADD:DB_RAW_V2:%1",(call life_sql_id)];
		if(_result != "[1]") exitWith {diag_log "extDB: Error with Database Connection";};
		"extDB" callExtension "9:LOCK";
		_extDB = true;
		diag_log "extDB: Connected to Database";
	} else {
		life_sql_id = uiNamespace getVariable "life_sql_id";
		__CONST__(life_sql_id,life_sql_id);
		_extDB = true;
		diag_log "extDB: Still Connected to Database";
	};

	//Broadbase PV to Clients, to warn about extDB Error.
	//	exitWith to stop trying to run rest of Server Code
	if (!_extDB) exitWith {
		life_server_extDB_notLoaded = true;
		publicVariable "life_server_extDB_notLoaded";
		diag_log "extDB: Error checked extDB/logs for more info";
	};

	//Run procedures for SQL cleanup on mission start.
	["CALL resetLifeVehicles",1] spawn DB_fnc_asyncCall;
	["CALL deleteDeadVehicles",1] spawn DB_fnc_asyncCall;
	["CALL deleteOldHouses",1] spawn DB_fnc_asyncCall;
	["CALL deleteOldGangs",1] spawn DB_fnc_asyncCall; //Maybe delete old gangs

	waitUntil {!isNull player && player == player};
	serv_sv_use = [];
	last_HC_update = 0;
	waitUntil {sleep 0.1;!isNil "serverloadhc"};
	
	//verif plantage
	_handle = [] spawn  {
		private["_vehicleClass","_dbInfo"];
		{
			_vehicleClass = getText(configFile >> "CfgVehicles" >> (typeOf _x) >> "vehicleClass");
			if(_vehicleClass in ["Car","Support","Air","Ship","Armored","Submarine"]) then
			{
				_dbInfo = _x getVariable["dbInfo",[]];
				if(count _dbInfo > 0) then
				{
					sleep 0.1;
					diag_log format ["::spawn:: vehupdate %1",_x];
					[_x] spawn  {
						_x = _this select 0;
						sleep (random 60);
						[] call life_fnc_getHLC;
						[_x,"STS_fnc_updateVeh",serverhc,false] spawn life_fnc_MP;
					};
				};
			};
		} foreach vehicles;
	};
	waitUntil {sleep 0.1;scriptDone _handle};
	
	/*fed_bank setVariable["safe",(count playableUnits),true];
	[] spawn TON_fnc_federalUpdate;*/
	
	life_HC_isActive = true;
	publicVariableServer "life_HC_isActive";
	Havena_HLCOBJ = player;
	publicVariable "Havena_HLCOBJ";
	
	[] spawn TON_fnc_cleanup;
	life_wanted_list = [];
	// [] execFSM "\life_server\cleanup.fsm";
	
	/*if(isNil("life_market_prices")) then
	{
		[] call TON_fnc_marketconfiguration;
		diag_log "Market prices generated!";
		"life_market_prices" addPublicVariableEventHandler
		{
			diag_log format["Market prices updated! %1", _this select 1];
		};
	};*/
	
	_handle = [] spawn TON_fnc_getSetPrice;
	waitUntil {sleep 0.1;scriptDone _handle};

	countsellitem = 0;
	last_sellArrayMulti = 0;
	// update sellArrayMulti every min
	[] spawn  {
	  while{true} do
	  {
		sleep (1 * 60);
		if(countsellitem > 1000 && ((time - last_sellArrayMulti) > 900)) then {
			last_sellArrayMulti = time;
			[] call TON_fnc_sellArrayMulti;
		};
	  };
	};
	
	if(isNil "TON_fnc_player_query") then {	
		_handle = [] spawn TON_fnc_initHouses;
		waitUntil {sleep 0.1;scriptDone _handle};
		_handle = [] spawn TON_fnc_spawnVehicleActive;
		waitUntil {sleep 0.1;scriptDone _handle};
		HCserverloadVeh = true;
		publicVariable "HCserverloadVeh";
		
		HCserverload = true;
		publicVariable "HCserverload";
	};
	
	PO3_sVAR_HLCKeepAlive = [objNull,0,time];
	[] spawn
	{
		while {true} do
		{
			waitUntil {!isNull player && player == player};

			PO3_sVAR_HLCKeepAlive = [player,diag_fps,time];
			publicVariableServer "PO3_sVAR_HLCKeepAlive";
			diag_log format["%1 sent %2 keepAlive to Server",player,PO3_sVAR_HLCKeepAlive];

			sleep 15;
		};
	};
	
	//[AiCacheDistance(players),TargetFPS(-1 for Auto),Debug,CarCacheDistance,AirCacheDistance,BoatCacheDistance]execvm "zbe_cache\main.sqf";
	[100,-1,true,100,1000,1000]execvm "\life_server\zbe_cache\main.sqf";
	[] spawn TON_fnc_huntingZone;
};