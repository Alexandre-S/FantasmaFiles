/*
	File: initPlayerLocal.sqf
	
	Description:
	Starts the initialization of the player.
*/
"BIS_fnc_MP_packet" addPublicVariableEventHandler {_this call life_fnc_MPexec};
//This is a headless client, he doesn't need to do anything but keep being headless..
waitUntil {sleep 0.1;!isNull player && player == player}; //Wait till the player is ready
player setVariable ["tf_voiceVolume", 0, true];
player setVariable ["tf_globalVolume", 0];
player setVariable ["tf_unable_to_use_radio", true];
player setVariable ["tf_receivingDistanceMultiplicator", 0.5];
player setVariable ["tf_sendingDistanceMultiplicator", 0.5];
if(!hasInterface) then {
	diag_log format[" === DEBUG initplayerlocal HC %1",player];
	[] call compile PreprocessFileLineNumbers "\life_server\init.sqf";
	
	[] spawn {
		player allowDamage false;
		_handle = [] spawn life_fnc_stripDownPlayer;
		waitUntil {sleep 0.1; scriptDone _handle};
	};
}else{
	#define __CONST__(var1,var2) var1 = compileFinal (if(typeName var2 == "STRING") then {var2} else {str(var2)})
	__CONST__(BIS_fnc_endMission,BIS_fnc_endMission);
	[] execVM "SpyGlass\fn_initSpy.sqf";
	[] execVM "core\init.sqf";

	//Execute JIP code.
	/*if((_this select 1)) then {
		[] execVM "core\jip.sqf";
	};*/

	illegalmarkers = ["Dealer_1","Dealer_2","Dealer_1_3_1","gang_area_1","gang_area_2","gang_area_3","Rebelop","Rebelop_1","Rebelop_2","turle_dealer","turle_dealer_1","turle_dealer_2","turtle_1_name_1","turtle_2","turtle_3","turtle_1_name_2","chop_shop_1","chop_shop_4","chop_shop_3","turtle_1_name","turtle_1","Weed_p_1","seigle_1","lsd_p_1","heroin_p","cocaine_1","Dealer_1_4","Dealer_1_3","heroin_1","cocaine_processing","weed_1"];
	if(playerSide == west) then {
		{ deleteMarkerLocal _x; } forEach illegalmarkers ;
	};

	[] execVM "teargas.sqf";
	[] execVM "admintools\loop.sqf";
};