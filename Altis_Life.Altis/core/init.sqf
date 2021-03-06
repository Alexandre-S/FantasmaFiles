#include <macro.h>
if(isServer OR !hasInterface) exitwith {};
/*
	Master client initialization file
*/
life_firstSpawn = true;
life_session_completed = false;
spawnmenuon = 3;
private["_handle","_timeStamp"];
0 cutText["Setting up client, please wait...","BLACK FADED"];
0 cutFadeOut 9999999;
_timeStamp = diag_tickTime;
diag_log "------------------------------------------------------------------------------------------------------";
diag_log "--------------------------------- Starting Altis Life Client Init ----------------------------------";
diag_log "------------------------------------------------------------------------------------------------------";
waitUntil {sleep 0.1;!isNull player && player == player}; //Wait till the player is ready
[] call compile PreprocessFileLineNumbers "core\clientValidator.sqf";
//Setup initial client core functions
diag_log "::Life Client:: Initialization Variables";
[] call compile PreprocessFileLineNumbers "core\configuration.sqf";
diag_log "::Life Client:: Variables initialized";

diag_log "::Life Client:: Setting up Eventhandlers";
[] call life_fnc_setupEVH;
diag_log "::Life Client:: Eventhandlers completed";

diag_log "::Life Client:: Setting up user actions";
[] call life_fnc_setupActions;
diag_log "::Life Client:: User actions completed";

diag_log "::Life Client:: Waiting for client ID..";
Havena_idplayer = player;
publicVariableServer "Havena_idplayer";
0 cutText["Recuperation de l id client... patientez","BLACK FADED"];
0 cutFadeOut 9999999;
waitUntil {sleep 0.5;!isNil "havena_id"};
player setVariable ["havena_id",havena_id, true];
0 cutText["Initialisation du serveur. \n veuillez patientez...","BLACK FADED"];
0 cutFadeOut 9999999;
diag_log "::Life Client:: Waiting for server functions to transfer..";
waitUntil {sleep 0.5;(!isNil {TON_fnc_player_query})};
diag_log "::Life Client:: Received server functions.";
0 cutText["Initialisation des fonctionnalitées serveur. \n veuillez patientez...","BLACK FADED"];
0 cutFadeOut 9999999;
waitUntil {sleep 0.5;!isNil "server_test"};
diag_log "::Life Client:: Received HC version.";
if(!server_test) then {
	waitUntil {sleep 0.5;!isNil "Havena_HLCOBJ"};
	diag_log "::Life Client:: Received HC.";
	waitUntil {sleep 0.5;!isNil "Havena_HLCOBJ2"};
	diag_log "::Life Client:: Received HCid.";
};
0 cutText["Récupération des infos du serveur.... patientez","BLACK FADED"];
0 cutFadeOut 99999999;
diag_log "::Life Client:: Waiting for the server to be ready..";
waitUntil{sleep 0.5;!isNil "life_server_isReady"};
waitUntil{sleep 0.1;(life_server_isReady OR !isNil "life_server_extDB_notLoaded")};
if(!isNil "life_server_extDB_notLoaded") exitWith {
	diag_log "::Life Client:: Server did not load extDB";
	// 999999 cutText ["The server-side extension extDB was not loaded into the engine, report this to the server admin.","BLACK FADED"];
	999999 cutText ["Le serveur semble avoir un problème de chargement. \n merci de contacter un admin.","BLACK FADED"];
	999999 cutFadeOut 99999999;
};

[] call SOCK_fnc_dataQuery;
waitUntil {sleep 0.1;life_session_completed};
// 0 cutText["Finishing client setup procedure","BLACK FADED"];
// 0 cutFadeOut 9999999;

diag_log "::Life Client:: init Gang.";
0 cutText["Récupération des infos du groupe.... patientez","BLACK FADED"];
0 cutFadeOut 9999999;
waitUntil {sleep 0.5;init_gang};

//diag_log "::Life Client:: Group Base Execution";
[] spawn life_fnc_escInterupt;
0 cutText["Attente du spawn.... patientez","BLACK FADED"];
0 cutFadeOut 9999999;
switch (playerSide) do
{
	case west:
	{
		_handle = [] spawn life_fnc_initCop;
		waitUntil {sleep 0.5;scriptDone _handle};
	};
	
	case civilian:
	{
		//Initialize Civilian Settings
		_handle = [] spawn life_fnc_initCiv;
		waitUntil {sleep 0.5;scriptDone _handle};
	};
	
	case independent:
	{
		//Initialize Medics and blah
		_handle = [] spawn life_fnc_initMedic;
		waitUntil {sleep 0.5;scriptDone _handle};
	};
	
	case sideLogic:
 	{
 		_handle = [] spawn life_fnc_initZeus;
 		waitUntil {sleep 0.5;scriptDone _handle};
 	};
};
waitUntil {sleep 0.5;!life_firstSpawn};
spawnmenuon = 0;
// player setVariable["restrained",false,true];
// player setVariable["Escorting",false,true];
// player setVariable["transporting",false,true];
diag_log "Past Settings Init";
[] execFSM "core\fsm\Fixed_Client987154.fsm";
diag_log "Executing fsm";
waitUntil {!(isNull (findDisplay 46))};
diag_log "Display 46 Found";
(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call life_fnc_keyHandler"];
(findDisplay 46) displayAddEventHandler ["MouseButtonDown", "_this call life_fnc_mouseHandler"];
player addRating 99999999;

combat_mode = 
{
	if(isNull player) exitWith {};
	dayz_combat = 1;
	player setVariable ["combat_mode", time, false];
		[] spawn  {
			private["_veh","_handled","_ctrlCombat"];
			while {((player getVariable ["combat_mode",0]) > time - 60)} do
			{
				[] call life_fnc_hudUpdate;
				if (cameraView == "External" OR {playerside == civilian && cameraView == "GUNNER" && (!l_c_gvt && !l_c_vigil && !l_c_rebel) && !((currentWeapon player) in life_civ_weapon)} ) then
				{
					if(vehicle player == player) then{
						player switchCamera "Internal";
					}else{
						if(driver (vehicle player) != player) then {
							player switchCamera "Internal";
						};
					};
				};
				sleep 0.01;
			};
			player setVariable ["combat_mode", 0, false];
			dayz_combat = 0;
			[] call life_fnc_hudUpdate;
		};
};

/*life_fnc_uncache = 
{
	private["_veh"];
	_veh = (_this select 0);
	uncachelist append _veh;
	if(havena_debugcache) then { systemChat format ["HAVENA_UNCACHE - %1",_veh]	};
};

life_fnc_cache = 
{
	private["_veh"];
	_veh = (_this select 0);
	{
		[_x] execFSM "core\fsm\cachegestion.fsm";
		sleep 0.5;
	} forEach _veh;
	if(havena_debugcache) then { systemChat format ["HAVENA_CACHE - %1",_veh] };
};*/

alarm_check = 
{
	private["_unit","_mag","_list"];
	_unit = (_this select 0) select 0;
	_mag = (_this select 0) select 5;
	//hint format ["%1 %2",_weapon,_mag];
	
	if(side _unit == west) exitwith {};
	if(side _unit == independent ) exitwith {};
	if(_unit getvariable ["alarm_check",false]) exitwith {};
	
	if!(_mag in life_chemlist) then {
	
		//5 sec
		_unit setVariable["alarm_check",true];
		[_unit] spawn {
			_unit = _this select 0;
			sleep 5;
			_unit setVariable["alarm_check",false];
		};
		
		//speakers
		_list = position player nearObjects ["Land_Loudspeakers_F",600];
		if (count(_list) > 0) then {
			[[profileName, position player,"FIRE"],"life_fnc_createMarker",west,false] spawn life_fnc_MP;
		};
		
		{
			if !(_x getvariable ["alarm_on",false]) then {
				_x setVariable["alarm_on",true,true];
				[_x] spawn {
					_vehicle = _this select 0;
					sleep 60;
					_vehicle setVariable["alarm_on",false,true];
				};
				[_x] spawn {
					_vehicle = _this select 0;
					while {true} do
					{
						//_vehicle say3D "bankalarm"; sleep 13;
						[[_vehicle,"bankalarm",-1],"life_fnc_playSound",true,false] spawn life_fnc_MP;
						sleep 23.44;
						if(!(_vehicle getVariable "alarm_on")) exitWith {};
					};
				};
				sleep (random 5);
			};
		} foreach _list;
	};
};

player addEventHandler ["FiredNear", " if(!((_this select 6) in life_chemlist)) then { [] spawn combat_mode; }; "];
player addEventHandler ["fired", "[_this] spawn alarm_check;"];

diag_log "::Life Client:: Vidage des pompes à essences..";
_pumps = [];
_pumpClass = "Land_fs_feed_F";
_pumps = [[9205.75,12112.2,-0.0487232],[11831.6,14155.9,-0.0342026],[12024.7,15830,-0.0298138],[12026.6,15830.1,-0.0342979],[12028.4,15830,-0.0388737],[9025.78,15729.4,-0.0206451],[9023.75,15729,-0.027153],[9021.82,15728.7,-0.0293427],[16750.9,12513.1,-0.0525198],[6798.15,15561.6,-0.0441475],[6198.83,15081.4,-0.0912418],[14173.2,16541.8,-0.0946102],[5023.26,14429.6,-0.0978947],[5019.68,14436.7,-0.0114822],[4001.12,12592.1,-0.0966625],[17417.2,13936.7,-0.106519],[3757.14,13477.9,-0.0540276],[3757.54,13485.9,-0.010498],[16875.2,15469.4,0.0373325],[16871.7,15476.6,0.0102873],[8481.69,18260.7,-0.0266876],[15297.1,17565.9,-0.283808],[14221.4,18302.5,-0.0697155],[15781,17453.2,-0.285282],[19961.3,11454.6,-0.0349236],[19965.1,11447.6,-0.0483704],[5768.99,20085.7,-0.0189667],[21230.4,7116.56,-0.0604229],[20784.8,16665.9,-0.0521202],[20789.6,16672.3,-0.0213318],[23379.4,19799,-0.0544052],[25701.2,21372.6,-0.0774155]];
{
	_pump = (nearestObject [_x, _pumpClass]);
	_pump setFuelCargo 0;
	_pump addAction ["Faire le plein", life_fnc_refuelVehicle, 1, 3, true, true, "", ' _this distance _target < 5 && cursorTarget == _target '];
} forEach _pumps;

/*diag_log "::Life Client:: batiments indestructibles..";
_nObject_list = [[173111,[4358.38,3814.93,0.160858]],[284874,[5584.23,2632.9,0.239697]],[286503,[5488.69,2500.85,-0.0846252]],[76972,[3806.2,4372.67,-0.23444]],[76973,[3805.63,4340.68,-0.186228]],[191159,[5453.82,3808.26,0.642345]],[289130,[6686.86,2586.95,-1.79799]],[289132,[6695.63,2586.81,-1.81586]],[289167,[6701.28,2585.91,-0.0152831]],[289129,[6686.83,2585.26,-1.7947]],[289131,[6695.59,2585.12,-1.81423]],[289361,[6679.52,2548.41,-1.81617]],[289363,[6688.28,2548.27,-1.81023]],[289365,[6697.05,2548.14,-1.81278]],[289360,[6679.44,2546.67,-1.80646]],[289362,[6688.19,2546.53,-1.81241]],[289422,[6693.65,2547.26,-0.963951]],[289364,[6696.95,2546.4,-1.8163]],[289685,[6705.3,2467.56,-1.7986]],[289687,[6712.44,2472.66,-1.78912]],[289689,[6719.56,2477.76,-1.80764]],[289686,[6706.22,2466.17,-1.78802]],[289688,[6713.34,2471.27,-1.78761]],[289690,[6720.48,2476.36,-1.80763]],[289691,[6727.61,2481.46,-1.81234]],[294303,[5945.5,1995.1,-1.81968]],[294305,[5947.2,1995.04,-1.8164]],[294302,[5945.28,1986.33,-1.81067]],[294304,[5946.98,1986.28,-1.81407]],[210634,[4370.55,2839.13,1.91981]],[210711,[4425.22,2760.38,1.94859]],[293215,[5769.87,1904.79,-0.815044]],[294152,[5809.18,1923.94,-0.979647]],[294153,[5834.89,1936.77,-0.916811]],[294154,[5857.22,1945.57,-0.550461]],[291721,[5798.1,2157.15,-0.0694389]],[209870,[4689.75,3000.14,-0.962222]],[209115,[4699.06,3010.51,-8.04757]],[209117,[4705.83,3014.65,-1.01366]],[209116,[4706.38,3018.16,-8.18197]],[209255,[4713.69,3026.1,-8.07883]],[53228,[2597.34,4656.99,-0.018269]],[8459,[2266.32,6400.58,-0.0872946]],[8457,[2300.34,6416.31,-0.416399]],[8458,[2298.09,6375.94,0.417533]],[8410,[2300.46,6415.69,-0.513512]],[44809,[2843.66,5357.92,-0.96334]]];
	{
		_nObject = (_x select 1) nearestObject (_x select 0);
		diag_log format["indestructible - %1",_nObject];
		_nObject enableSimulation false;
		// _nObject allowDamage false;
		_nObject addEventHandler ["HandleDamage", {false}];
	} forEach _nObject_list;
	*/
diag_log "------------------------------------------------------------------------------------------------------";
diag_log format["                End of Altis Life Client Init :: Total Execution Time %1 seconds ",(diag_tickTime) - _timeStamp];
diag_log "------------------------------------------------------------------------------------------------------";
//life_sidechat = true;
//[[player,life_sidechat,playerSide],"TON_fnc_managesc",false,false] spawn life_fnc_MP;
player setVariable ["tf_voiceVolume", 1, true];
player setVariable ["tf_globalVolume", 1];
player setVariable ["tf_unable_to_use_radio", false];
0 cutText ["","BLACK IN"];
[] call life_fnc_hudSetup;
LIFE_ID_PlayerTags = ["LIFE_PlayerTags","onEachFrame","life_fnc_playerTags"] call BIS_fnc_addStackedEventHandler;
LIFE_ID_RevealObjects = ["LIFE_RevealObjects","onEachFrame","life_fnc_revealObjects"] call BIS_fnc_addStackedEventHandler;
[] call life_fnc_settingsInit;
player setVariable["steam64ID",getPlayerUID player];
player setVariable["realname",profileName,true];
life_fnc_moveIn = compileFinal
"
	player moveInCargo (_this select 0);
";

life_fnc_garageRefund = compileFinal
"
	_price = _this select 0;
	_unit = _this select 1;
	if(_unit != player) exitWith {};
	life_atmcash = life_atmcash + _price;
";

[] execVM "core\init_survival.sqf";
// [] spawn life_fnc_autoc;
[] spawn {
	sleep 15;
	titleText ["Activation de l'autoFPS","PLAIN DOWN"]; titleFadeOut 4;
	[] execFSM "core\fsm\autoc.fsm";
};


//[] execVM "core\fn_addKey.sqf"; doublon

__CONST__(life_paycheck,life_paycheck); //Make the paycheck static.
player enableFatigue (__GETC__(life_enableFatigue));
//[] spawn life_fnc_fatigueReset;
//auto update
[] spawn
{
	private["_nb"];
	_nb = 0;
	while {true} do {
		sleep (30 + (random 30));
		//[] call life_fnc_updateClothing;
		_nb = _nb+1;
		if(_nb == 5) then {
			[] call SOCK_fnc_updateRequest;
			_nb = 0;
		} else {
			[8] call SOCK_fnc_updatePartial; //Silent pos Sync
		};
	};
};

[] spawn
{
	private["_od"];
	while {true} do {
		sleep (5*60);
		life_drug_level = life_drug_level - 0.05;
		if(life_drug_level<0) then {life_drug_level = 0;};
		if(dependance>life_drug_level) then {
			_od = random 1;
			if (_od > 0.6) then { [1] spawn life_fnc_overdose; };
		};
	};
};

[] spawn
{
	while {true} do {
		sleep (30*60);
		dependance = dependance - 0.05;
		if(dependance<0) then {dependance = 0;};
	};
};