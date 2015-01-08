#include <macro.h>
/*
	Master client initialization file
*/
life_firstSpawn = true;
life_session_completed = false;
spawnmenuon = 1;
private["_handle","_timeStamp"];
0 cutText["Setting up client, please wait...","BLACK FADED"];
0 cutFadeOut 9999999;
_timeStamp = diag_tickTime;
diag_log "------------------------------------------------------------------------------------------------------";
diag_log "--------------------------------- Starting Altis Life Client Init ----------------------------------";
diag_log "------------------------------------------------------------------------------------------------------";
waitUntil {!isNull player && player == player}; //Wait till the player is ready
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

diag_log "::Life Client:: Waiting for server functions to transfer..";
waitUntil {(!isNil {TON_fnc_clientGangLeader})};
diag_log "::Life Client:: Received server functions.";

waitUntil {sleep 0.5;!isNil "server_test"};
diag_log "::Life Client:: Received HC version.";
if(!server_test) then {
	waitUntil {sleep 0.5;!isNil "Havena_HLCOBJ"};
	diag_log "::Life Client:: Received HC.";
	waitUntil {sleep 0.5;!isNil "Havena_HLCOBJ2"};
	diag_log "::Life Client:: Received HCid.";
};

0 cutText ["Waiting for the server to be ready...","BLACK FADED"];
0 cutFadeOut 99999999;
diag_log "::Life Client:: Waiting for the server to be ready..";
waitUntil{!isNil "life_server_isReady"};
waitUntil{(life_server_isReady OR !isNil "life_server_extDB_notLoaded")};
if(!isNil "life_server_extDB_notLoaded") exitWith {
	diag_log "::Life Client:: Server did not load extDB";
	999999 cutText ["The server-side extension extDB was not loaded into the engine, report this to the server admin.","BLACK FADED"];
	999999 cutFadeOut 99999999;
};

[] call SOCK_fnc_dataQuery;
waitUntil {life_session_completed};
0 cutText["Finishing client setup procedure","BLACK FADED"];
0 cutFadeOut 9999999;

//diag_log "::Life Client:: Group Base Execution";
[] spawn life_fnc_escInterupt;

switch (playerSide) do
{
	case west:
	{
		_handle = [] spawn life_fnc_initCop;
		waitUntil {scriptDone _handle};
	};
	
	case civilian:
	{
		//Initialize Civilian Settings
		_handle = [] spawn life_fnc_initCiv;
		waitUntil {scriptDone _handle};
	};
	
	case independent:
	{
		//Initialize Medics and blah
		_handle = [] spawn life_fnc_initMedic;
		waitUntil {scriptDone _handle};
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
[] execFSM "core\fsm\client.fsm";
diag_log "Executing client.fsm";
waitUntil {!(isNull (findDisplay 46))};
diag_log "Display 46 Found";
(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call life_fnc_keyHandler"];
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
				if (cameraView == "External") then
				{
					if(vehicle player == player)then{
						player switchCamera "Internal";
					};
				};
				sleep 0.1;
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

diag_log "------------------------------------------------------------------------------------------------------";
diag_log format["                End of Altis Life Client Init :: Total Execution Time %1 seconds ",(diag_tickTime) - _timeStamp];
diag_log "------------------------------------------------------------------------------------------------------";
life_sidechat = true;
//[[player,life_sidechat,playerSide],"TON_fnc_managesc",false,false] spawn life_fnc_MP;
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