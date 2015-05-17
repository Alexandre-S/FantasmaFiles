enableSaving [false, false];
//FLIR OFF
//{ _x disableTIEquipment true;} foreach vehicles;

X_Server = false;
X_Client = false;
X_JIP = false;
StartProgress = false;

//TFR
tf_radio_channel_name = "EN JEU TASK FORCE RADIO";
tf_radio_channel_password = "8heWrecawR";
TF_terrain_interception_coefficient = 4.0;

tf_west_radio_code = "_fantasma";
tf_east_radio_code = "_fantasma";
tf_guer_radio_code = "_fantasma";

TF_give_personal_radio_to_regular_soldier = true;

// If you want to disable the automatic long range radio for squad/team leaders at start.
// Would be used if you wanted a custom loadout and only wanted certain players to have access.
tf_no_auto_long_range_radio = true;

// If you want to start the game will all squads on the same frequency
tf_same_sw_frequencies_for_side = true;
tf_same_lr_frequencies_for_side = true;

TF_give_microdagr_to_soldier = false;

L_immerse_twitch_enabled		= 	true;	// Enabled Twitch, "twitching" when someone shoots nearby
L_immerse_exShake_enabled		= 	true;	// Enabled ExShake, camshake for explosions, even distant ones! (Feel the Bombs ;))
L_immerse_recoil_enabled		= 	true;	// A slight camshake when firing weapons, makes them feel "heavier"

if(!isDedicated) then { X_Client = true;};

enableSaving[false,false];

life_versionInfo = "Altis Life RPG v5.1";
[] execVM "briefing.sqf"; //Load Briefing
[] execVM "KRON_Strings.sqf";
//execVM "randomWeather2.sqf";
//execVM "R3F_LOG\init.sqf";

//spam radio
{_x setVariable ["BIS_noCoreConversations", true]} forEach allUnits;
0 fadeRadio 0;
enableSentences false;

StartProgress = true;