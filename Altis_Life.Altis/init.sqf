enableSaving [false, false];

X_Server = false;
X_Client = false;
X_JIP = false;
StartProgress = false;

//TFR
tf_radio_channel_name = "EN JEU TASK FORCE RADIO";
tf_radio_channel_password = "123tfr";
TF_terrain_interception_coefficient = 4.0;

// tf_west_radio_code = "_fantasma";
// tf_east_radio_code = "_fantasma";
// tf_guer_radio_code = "_fantasma";

TF_give_personal_radio_to_regular_soldier = true;

// If you want to disable the automatic long range radio for squad/team leaders at start.
// Would be used if you wanted a custom loadout and only wanted certain players to have access.
tf_no_auto_long_range_radio = true;

// If you want to start the game will all squads on the same frequency
//tf_same_frequencies_for_side = true;

if(!isDedicated) then { X_Client = true;};
enableSaving[false,false];

life_versionInfo = "Altis Life RPG v5.0";
[] execVM "briefing.sqf"; //Load Briefing
[] execVM "KRON_Strings.sqf";

if(playerSide == west) then {
	{_x setMarkerAlphaLocal 0} forEach ["Dealer_1","Dealer_2","gang_area_1","gang_area_2","gang_area_3","Rebelop","Rebelop_1","Rebelop_2","turle_dealer","turle_dealer_1","turle_dealer_2","turtle_1_name_1","turtle_2","turtle_3","turtle_1_name_2","chop_shop_1","chop_shop_4","chop_shop_3","turtle_1_name","turtle_1","Weed_p_1","heroin_p","coke_area","cocaine_1","Dealer_1_4","Dealer_1_3","heroin_1","heroin_area","cocaine_processing","weed_1"];
};

[] execVM "admintools\loop.sqf";

StartProgress = true;

"BIS_fnc_MP_packet" addPublicVariableEventHandler {_this call life_fnc_MPexec};