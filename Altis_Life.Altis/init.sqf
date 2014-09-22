enableSaving [false, false];

X_Server = false;
X_Client = false;
X_JIP = false;
StartProgress = false;

//TFR
/*tf_radio_channel_name = "EN JEU TASK FORCE RADIO";
tf_radio_channel_password = "123tfr";
TF_terrain_interception_coefficient = 4.0;*/

// tf_west_radio_code = "_fantasma";
// tf_east_radio_code = "_fantasma";
// tf_guer_radio_code = "_fantasma";

/*TF_give_personal_radio_to_regular_soldier = true;*/

// If you want to disable the automatic long range radio for squad/team leaders at start.
// Would be used if you wanted a custom loadout and only wanted certain players to have access.
/*tf_no_auto_long_range_radio = true;*/

// If you want to start the game will all squads on the same frequency
//tf_same_frequencies_for_side = true;

if(!isDedicated) then { X_Client = true;};
enableSaving[false,false];

life_versionInfo = "Altis Life RPG v5.0";
[] execVM "briefing.sqf"; //Load Briefing
[] execVM "KRON_Strings.sqf";

[] execVM "admintools\loop.sqf";

StartProgress = true;

"BIS_fnc_MP_packet" addPublicVariableEventHandler {_this call life_fnc_MPexec};