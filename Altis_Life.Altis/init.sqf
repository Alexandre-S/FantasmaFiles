enableSaving [false, false];
diag_log format ["DEBUG INIT START - %1, %2", player, time];
//FLIR OFF
{ _x disableTIEquipment true;} foreach vehicles;

X_Server = false;
X_Client = false;
X_JIP = false;
StartProgress = false;

//TFR
tf_radio_channel_name = "EN JEU TASK FORCE RADIO";
tf_radio_channel_password = "123tfr";
TF_terrain_interception_coefficient = 4.0;

tf_west_radio_code = "_fantasma";
tf_east_radio_code = "_fantasma";
tf_guer_radio_code = "_fantasma";

TF_give_personal_radio_to_regular_soldier = true;

// If you want to disable the automatic long range radio for squad/team leaders at start.
// Would be used if you wanted a custom loadout and only wanted certain players to have access.
tf_no_auto_long_range_radio = true;

// If you want to start the game will all squads on the same frequency
//tf_same_frequencies_for_side = true;

if(isServer) then 
{
	if(!X_Server) then
	{
		"BIS_fnc_MP_packet" addPublicVariableEventHandler {_this call life_fnc_MPexec};
		[] call compile PreprocessFileLineNumbers "\life_server\init.sqf";
		//master_group attachTo[bank_obj,[0,0,0]];

		onMapSingleClick "if(_alt) then {vehicle player setPos _pos};";

		//Spawn the new hospitals.
		{
			_hs = createVehicle ["Land_Hospital_main_F", [0,0,0], [], 0, "NONE"];
			_hs setDir (markerDir _x);
			_hs setPosATL (getMarkerPos _x);
			_var = createVehicle ["Land_Hospital_side1_F", [0,0,0], [], 0, "NONE"];
			_var attachTo [_hs, [4.69775,32.6045,-0.1125]];
			detach _var;
			_var = createVehicle ["Land_Hospital_side2_F", [0,0,0], [], 0, "NONE"];
			_var attachTo [_hs, [-28.0336,-10.0317,0.0889387]]; 
			detach _var;
		} foreach ["hospital_2","hospital_3"];

		[8,true,12] execFSM "core\fsm\timeModule.fsm";
	};
	X_Server = true;
};


if(!isDedicated) then { X_Client = true;};

if ((!IsDedicated)&&(!hasinterface))exitwith{
	[] call compile PreprocessFileLineNumbers "\life_server\init.sqf";
	[] execVM "KRON_Strings.sqf";
	
	//if(isDedicated && isNil("life_market_prices")) then
	if(isNil("life_market_prices")) then
	{
		[] call TON_fnc_marketconfiguration;
		diag_log "Market prices generated!";
		"life_market_prices" addPublicVariableEventHandler
		{
			diag_log format["Market prices updated! %1", _this select 1];
		};
	};
	
	[] spawn {
		waitUntil {sleep 0.1;!isNull player && player == player}; //Wait till the player is ready
		player setVariable ["tf_unable_to_use_radio", true];
		player allowDamage false;
		_handle = [] spawn life_fnc_stripDownPlayer;
		waitUntil {scriptDone _handle};
	};
};

if(hasInterface) then // Not HC
{
	#define __CONST__(var1,var2) var1 = compileFinal (if(typeName var2 == "STRING") then {var2} else {str(var2)})
	__CONST__(BIS_fnc_endMission,BIS_fnc_endMission);
	// if(isNull player) then 
	// {
		if(!X_JIP && !isServer) then
		{
			[] spawn (compile PreprocessFileLineNumbers "core\jip.sqf");
		};
		X_JIP = true;
	// };

	if(X_Client) then
	{
		[] execVM "SpyGlass\fn_initSpy.sqf";
		[] execVM "core\init.sqf";
		
		illegalmarkers = ["Dealer_1","Dealer_2","gang_area_1","gang_area_2","gang_area_3","Rebelop","Rebelop_1","Rebelop_2","turle_dealer","turle_dealer_1","turle_dealer_2","turtle_1_name_1","turtle_2","turtle_3","turtle_1_name_2","chop_shop_1","chop_shop_4","chop_shop_3","turtle_1_name","turtle_1","Weed_p_1","heroin_p","coke_area","cocaine_1","Dealer_1_4","Dealer_1_3","heroin_1","heroin_area","cocaine_processing","weed_1"];
		if(playerSide == west) then {
			{ deleteMarkerLocal _x; } forEach illegalmarkers ;
		};
		[] execVM "teargas.sqf";
		[] execVM "admintools\loop.sqf";

		
	};

};

enableSaving[false,false];

life_versionInfo = "Altis Life RPG v5.1";
[] execVM "briefing.sqf"; //Load Briefing
[] execVM "KRON_Strings.sqf";
execVM "randomWeather2.sqf";


//spam radio
{_x setVariable ["BIS_noCoreConversations", true]} forEach allUnits;
0 fadeRadio 0;
enableSentences false;

StartProgress = true;

diag_log format ["DEBUG INIT END - %1, %2", player, time];