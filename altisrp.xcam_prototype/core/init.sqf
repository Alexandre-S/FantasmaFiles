#include <macro.h>
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
				if (cameraView == "External" OR {playerside == civilian && cameraView == "GUNNER" && (!license_civ_gvt && !license_civ_vigil && !license_civ_rebel) && !((currentWeapon player) in life_civ_weapon)} ) then
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

alarm_check = 
{
	private["_unit","_mag","_list"];
	_unit = (_this select 0) select 0;
	_mag = (_this select 0) select 5;
	//hint format ["%1 %2",_weapon,_mag];
	
	if(side _unit == west) exitwith {};
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
// player addEventHandler ["fired", "[_this] spawn alarm_check;"];

diag_log "::Life Client:: Vidage des pompes à essences..";
_pumps = [["Land_FuelStation",[2554.91,4864.73,-0.00377178]],
["Land_FuelStation",[3769.42,4521.34,0]],
["Land_FuelStation",[4868.28,3706.02,0.410715]],
["Land_FuelStation_Feed_F",[4314.53,3900.29,-0.0458012]],
["Land_FuelStation_Feed_F",[4312.83,3901.21,-0.0490313]],
["Land_FuelStation_Feed_F",[4316.28,3899.35,-0.0474215]],
["FuelStation",[2554.91,4864.73,-0.00377178]],
["FuelStation",[3769.42,4521.34,0]],
["FuelStation",[4868.28,3706.02,0.410715]]];
{
	_pump = (nearestObject [_x select 1, _x select 0]);
	_pump setFuelCargo 0;
	_pump addAction ["Faire le plein", life_fnc_refuelVehicle, 1, 3, true, true, "", ' _this distance _target < 5 && cursorTarget == _target '];
} forEach _pumps;

diag_log "::Life Client:: batiments indestructibles..";
_nObject_list = [[302864,[4356.04,3818.28,-4.00366]],  [513103,[5584.23,2632.9,0.239697]],  [514815,[5488.69,2500.85,-0.0846252]],  [130811,[3805.63,4340.68,-0.186228]],  [130810,[3806.2,4372.67,-0.23444]],  [339880,[5453.82,3808.26,0.699276]],  [519962,[6686.86,2586.95,-1.7471]],  [519964,[6695.63,2586.81,-1.76336]],  [519999,[6701.28,2585.91,0.0410357]],  [519961,[6686.83,2585.26,-1.74795]],  [519963,[6695.59,2585.12,-1.76215]],  [520363,[6679.52,2548.41,-1.77602]],  [520365,[6688.28,2548.27,-1.76104]],  [520367,[6697.05,2548.14,-1.75131]],  [520362,[6679.44,2546.67,-1.76919]],  [520364,[6688.19,2546.53,-1.75969]],  [520366,[6696.95,2546.4,-1.7521]],  [520424,[6693.65,2547.26,-0.90166]],  [520754,[6705.3,2467.56,-1.71996]],  [520756,[6712.44,2472.66,-1.73667]],  [520775,[6717.35,2475.14,-0.487585]],  [520758,[6719.56,2477.76,-1.7529]],  [520755,[6706.22,2466.17,-1.72373]],  [520757,[6713.34,2471.27,-1.73861]],  [520759,[6720.48,2476.36,-1.75252]],  [520760,[6727.61,2481.46,-1.75536]],  [530419,[5945.5,1995.1,-1.76624]],  [530418,[5945.28,1986.33,-1.75369]],  [530422,[5945.88,1980.78,0.139449]],  [430421,[8344.92,3795.76,-0.0347013]],  [530420,[5946.98,1986.28,-1.75709]],  [368514,[4370.55,2839.13,1.94615]],  [368604,[4425.22,2760.38,1.98743]],  [529115,[5769.87,1904.79,-0.758065]],  [530262,[5809.18,1923.94,-0.922667]],  [530263,[5834.62,1936.56,-0.997271]],  [530264,[5857.22,1945.57,-0.493481]],  [530419,[5945.5,1995.1,-1.76624]],  [530418,[5945.28,1986.33,-1.75369]],  [530422,[5945.88,1980.78,0.139449]],  [530421,[5947.2,1995.04,-1.76283]],  [530420,[5946.98,1986.28,-1.75709]],  [526044,[5798.1,2157.15,-0.0124598]],  [367582,[4689.75,3000.14,-0.905368]],  [366793,[4699.06,3010.51,-7.99566]],  [366795,[4705.83,3014.65,-0.919703]],  [366794,[4706.38,3018.16,-8.0952]],  [366934,[4713.69,3026.1,-8.06272]],  [89248,[2597.32,4657,0.0568504]],  [14057,[2266.32,6400.58,-0.0872946]],  [14055,[2300.34,6416.31,-0.356054]],  [14056,[2298.09,6375.94,0.417533]],  [72020,[2843.66,5357.92,-0.90636]]];
{
	_nObject = (_x select 1) nearestObject (_x select 0);
	// _nObject = [0,0,0] nearestObject _x;
	_nObject enableSimulation false;
	_nObject allowDamage false;
} forEach _nObject_list;


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
[] spawn life_fnc_autoc;
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
		[] call life_fnc_updateClothing;
		_nb = _nb+1;
		if(_nb == 5) then {
			[] call SOCK_fnc_updateRequest;
			_nb = 0;
		} else {
			[8] call SOCK_fnc_updatePartial; //Silent pos Sync
		};
	};
};