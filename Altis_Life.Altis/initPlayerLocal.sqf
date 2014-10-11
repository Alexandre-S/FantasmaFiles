/*
	File: initPlayerLocal.sqf
	
	Description:
	Starts the initialization of the player.
*/
if(!hasInterface) exitWith {}; //This is a headless client, he doesn't need to do anything but keep being headless..
#define __CONST__(var1,var2) var1 = compileFinal (if(typeName var2 == "STRING") then {var2} else {str(var2)})
__CONST__(BIS_fnc_endMission,BIS_fnc_endMission);
[] execVM "SpyGlass\fn_initSpy.sqf";
[] execVM "core\init.sqf";

//Execute JIP code.
if((_this select 1)) then {
	[] execVM "core\jip.sqf";
};

illegalmarkers = ["Dealer_1","Dealer_2","gang_area_1","gang_area_2","gang_area_3","Rebelop","Rebelop_1","Rebelop_2","turle_dealer","turle_dealer_1","turle_dealer_2","turtle_1_name_1","turtle_2","turtle_3","turtle_1_name_2","chop_shop_1","chop_shop_4","chop_shop_3","turtle_1_name","turtle_1","Weed_p_1","heroin_p","coke_area","cocaine_1","Dealer_1_4","Dealer_1_3","heroin_1","heroin_area","cocaine_processing","weed_1"];
if(playerSide == west) then {
	{ deleteMarkerLocal _x; } forEach illegalmarkers ;
};