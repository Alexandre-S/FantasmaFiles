#define __CONST__(var1,var2) var1 = compileFinal (if(typeName var2 == "STRING") then {var2} else {str(var2)})
DB_Async_Active = false;
DB_Async_ExtraLock = false;

server_test = true;
publicVariable "server_test";
serverhc = false;
server_debug = true;
// life_ver_random = ["C_Offroad_01_F","C_Hatchback_01_F","C_Hatchback_01_sport_F","C_SUV_01_F","C_Van_01_box_F","C_Van_01_transport_F"];


if ((!IsDedicated)&&(!hasinterface)) then {	isHLC = true; }else{ isHLC = false; };

if(!isHLC) then {
	// _nObject_list = [302864,513103,514815,130811,130810,339880,519962,519964,519999,519961,519963,520363,520365,520367,520362,520364,520366,520424,520754,520756,520775,520758,520755,520757,520759,520760,530419,530418,530422,430421,530420,368514,368604,529115,530262,530263,530264,530419,530418,530422,530421,530420,526044,367582,366793,366795,366794,366934,89248,14057,14055,14056,72020];
	// _nObject_list = [173111,284874,286503,76972,76973,191159,289130,289132,289167,289129,289131,289361,289363,289365,289360,289362,289422,289364,289685,289687,289689,289686,289688,289690,289691,294303,294305,294302,294304,210634,210711,293215,294152,294153,294154,291721,209870,209115,209117,209116,209255,53228,8459,8457,8458,8410,44809];
	// _nObject_list = [[302864,[4356.04,3818.28,-4.00366]],  [513103,[5584.23,2632.9,0.239697]],  [514815,[5488.69,2500.85,-0.0846252]],  [130811,[3805.63,4340.68,-0.186228]],  [130810,[3806.2,4372.67,-0.23444]],  [339880,[5453.82,3808.26,0.699276]],  [519962,[6686.86,2586.95,-1.7471]],  [519964,[6695.63,2586.81,-1.76336]],  [519999,[6701.28,2585.91,0.0410357]],  [519961,[6686.83,2585.26,-1.74795]],  [519963,[6695.59,2585.12,-1.76215]],  [520363,[6679.52,2548.41,-1.77602]],  [520365,[6688.28,2548.27,-1.76104]],  [520367,[6697.05,2548.14,-1.75131]],  [520362,[6679.44,2546.67,-1.76919]],  [520364,[6688.19,2546.53,-1.75969]],  [520366,[6696.95,2546.4,-1.7521]],  [520424,[6693.65,2547.26,-0.90166]],  [520754,[6705.3,2467.56,-1.71996]],  [520756,[6712.44,2472.66,-1.73667]],  [520775,[6717.35,2475.14,-0.487585]],  [520758,[6719.56,2477.76,-1.7529]],  [520755,[6706.22,2466.17,-1.72373]],  [520757,[6713.34,2471.27,-1.73861]],  [520759,[6720.48,2476.36,-1.75252]],  [520760,[6727.61,2481.46,-1.75536]],  [530419,[5945.5,1995.1,-1.76624]],  [530418,[5945.28,1986.33,-1.75369]],  [530422,[5945.88,1980.78,0.139449]],  [430421,[8344.92,3795.76,-0.0347013]],  [530420,[5946.98,1986.28,-1.75709]],  [368514,[4370.55,2839.13,1.94615]],  [368604,[4425.22,2760.38,1.98743]],  [529115,[5769.87,1904.79,-0.758065]],  [530262,[5809.18,1923.94,-0.922667]],  [530263,[5834.62,1936.56,-0.997271]],  [530264,[5857.22,1945.57,-0.493481]],  [530419,[5945.5,1995.1,-1.76624]],  [530418,[5945.28,1986.33,-1.75369]],  [530422,[5945.88,1980.78,0.139449]],  [530421,[5947.2,1995.04,-1.76283]],  [530420,[5946.98,1986.28,-1.75709]],  [526044,[5798.1,2157.15,-0.0124598]],  [367582,[4689.75,3000.14,-0.905368]],  [366793,[4699.06,3010.51,-7.99566]],  [366795,[4705.83,3014.65,-0.919703]],  [366794,[4706.38,3018.16,-8.0952]],  [366934,[4713.69,3026.1,-8.06272]],  [89248,[2597.32,4657,0.0568504]],  [14057,[2266.32,6400.58,-0.0872946]],  [14055,[2300.34,6416.31,-0.356054]],  [14056,[2298.09,6375.94,0.417533]],  [72020,[2843.66,5357.92,-0.90636]]];
	_nObject_list = [[173111,[4358.38,3814.93,0.160858]],[284874,[5584.23,2632.9,0.239697]],[286503,[5488.69,2500.85,-0.0846252]],[76972,[3806.2,4372.67,-0.23444]],[76973,[3805.63,4340.68,-0.186228]],[191159,[5453.82,3808.26,0.642345]],[289130,[6686.86,2586.95,-1.79799]],[289132,[6695.63,2586.81,-1.81586]],[289167,[6701.28,2585.91,-0.0152831]],[289129,[6686.83,2585.26,-1.7947]],[289131,[6695.59,2585.12,-1.81423]],[289361,[6679.52,2548.41,-1.81617]],[289363,[6688.28,2548.27,-1.81023]],[289365,[6697.05,2548.14,-1.81278]],[289360,[6679.44,2546.67,-1.80646]],[289362,[6688.19,2546.53,-1.81241]],[289422,[6693.65,2547.26,-0.963951]],[289364,[6696.95,2546.4,-1.8163]],[289685,[6705.3,2467.56,-1.7986]],[289687,[6712.44,2472.66,-1.78912]],[289689,[6719.56,2477.76,-1.80764]],[289686,[6706.22,2466.17,-1.78802]],[289688,[6713.34,2471.27,-1.78761]],[289690,[6720.48,2476.36,-1.80763]],[289691,[6727.61,2481.46,-1.81234]],[294303,[5945.5,1995.1,-1.81968]],[294305,[5947.2,1995.04,-1.8164]],[294302,[5945.28,1986.33,-1.81067]],[294304,[5946.98,1986.28,-1.81407]],[210634,[4370.55,2839.13,1.91981]],[210711,[4425.22,2760.38,1.94859]],[293215,[5769.87,1904.79,-0.815044]],[294152,[5809.18,1923.94,-0.979647]],[294153,[5834.89,1936.77,-0.916811]],[294154,[5857.22,1945.57,-0.550461]],[291721,[5798.1,2157.15,-0.0694389]],[209870,[4689.75,3000.14,-0.962222]],[209115,[4699.06,3010.51,-8.04757]],[209117,[4705.83,3014.65,-1.01366]],[209116,[4706.38,3018.16,-8.18197]],[209255,[4713.69,3026.1,-8.07883]],[53228,[2597.34,4656.99,-0.018269]],[8459,[2266.32,6400.58,-0.0872946]],[8457,[2300.34,6416.31,-0.416399]],[8458,[2298.09,6375.94,0.417533]],[8410,[2300.46,6415.69,-0.513512]],[44809,[2843.66,5357.92,-0.96334]]];
	{
		_nObject = (_x select 1) nearestObject (_x select 0);
		diag_log format["indestructible - %1",_nObject];
		_nObject enableSimulation false;
		// _nObject allowDamage false;
		_nObject addEventHandler ["HandleDamage", {false}];
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
			// } foreach [Dealer_1,Dealer_2,Dealer_3];
			} foreach [Dealer_1,Dealer_2];
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
	
	TON_fnc_rePos = 
	compileFinal "
		(_this select 0) setPos (getPos (_this select 0));
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

	waitUntil {sleep 0.1; !isNull player && player == player};
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
						[_x,"TON_fnc_updateVeh",serverhc,false] spawn life_fnc_MP;
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
			waitUntil {sleep 0.1; !isNull player && player == player};

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