/*****************************************************************
Copyright © 2013 Double Doppler

File: fnc_network.sqf
Date: 21/1/2013
Author: Double Doppler/D.Doppler
Contact: doubledoppler@live.co.uk
Description: N/A.
Parameter(s): None.

UNAUTHORIZED USE OR REPRODUCTION OF THIS MATERIAL WITHOUT THE 
PERMISSION OF THE AUTHOR IS PROHIBITED.
*****************************************************************/
// INITIALIZE PUBLIC VARIABLES
if (isnil "DDOPP_pvSay") then {
	DDOPP_pvSay = [objNull,""];
};
if (isnil "DDOPP_pvAnim") then {
	DDOPP_pvAnim = [objNull,""];
};
if (isnil "DDOPP_pvSpawn") then {
	DDOPP_pvSpawn = ["",""];
};
if (isnil "DDOPP_pvChat") then {
	DDOPP_pvChat = [objNull,"",""];
};
if (isnil "DDOPP_pvMsg") then {
	DDOPP_pvMsg = [0,""];
};
// ATTACH PV EVENT HANDLERS
"DDOPP_pvSay" addPublicVariableEventHandler {
	[(_this select 1),false] call DDOPP_public_say;
};
"DDOPP_pvAnim" addPublicVariableEventHandler {
	[(_this select 1),false] call DDOPP_public_anim;
};
"DDOPP_pvSpawn" addPublicVariableEventHandler {
	[(_this select 1),false] call DDOPP_public_spawn;
};
/*"DDOPP_pvChat" addPublicVariableEventHandler {
	[(_this select 1),false] call DDOPP_public_chat;
};*/
"DDOPP_pvMsg" addPublicVariableEventHandler {
	[(_this select 1),false] call DDOPP_public_msg;
};
// FUNCTIONS DOUBLE AS RUNNING ON CLIENT AND SENDING VARIABLE OVER THE NETWORK
// SINGLE PLAYER PROOF (WILL NOT BROADCAST IF NOT MULTIPLAYER)

// SCANS IF THE FUNCTION WAS ALREADY INITIALIZED FROM ANOTHER MOD BEFORE INITIALIZING IT HERE

if (isnil "DDOPP_public_say") then {
	DDOPP_public_say = {
		private ["_parameters","_who","_what","_pvUpdate"];
		_parameters = _this select 0;
		_who        = _parameters select 0;
		_what       = _parameters select 1;
		_pvUpdate   = _this select 1;
		_who say _what;
		if (_pvUpdate && isMultiplayer) then {
			DDOPP_pvSay = [_who,_what];
			publicVariable "DDOPP_pvSay";
		};
	};
};
if (isnil "DDOPP_public_anim") then {
	DDOPP_public_anim = {
		private ["_parameters","_who","_what","_pvUpdate"];
		_parameters = _this select 0;
		_who        = ((_parameters) select 0);
		_what       = ((_parameters) select 1);
		_pvUpdate   = _this select 1;
		_who switchMove _what;
		if (_pvUpdate && isMultiplayer) then {
			DDOPP_pvAnim = [_who,_what];
			publicVariable "DDOPP_pvAnim";
		};
	};
};
if (isnil "DDOPP_public_spawn") then {
	DDOPP_public_spawn = {
		private ["_parameters","_fncName","_pvUpdate"];
		_parameters = ((_this select 0) select 0);
		_fncName    = ((_this select 0) select 1);
		_pvUpdate   = _this select 1;
		call compile format ["%1 spawn %2",call compile (_parameters),call compile (_fncName)];
		if (_pvUpdate && isMultiplayer) then {
			DDOPP_pvSpawn = [_parameters,_fncName];
			publicVariable "DDOPP_pvSpawn";
		};
	};
};
/*
if (isnil "DDOPP_public_chat") then {
	DDOPP_public_chat = {
		private ["_parameters","_who","_what","_pvUpdate","_chatType"];
		_parameters = _this select 0;
		_who        = ((_parameters) select 0);
		_what       = ((_parameters) select 1);
		_chatType   = ((_parameters) select 2);
		_pvUpdate   = _this select 1;
		call compile format ["%1 %2 ""%3""",_who, (_chatType), _what];
		if (_pvUpdate && isMultiplayer) then {
			DDOPP_pvChat = [_who,_what,_chatType];
			publicVariable "DDOPP_pvChat";
		};
	};
};
*/
if (isnil "DDOPP_public_msg") then {
	DDOPP_public_msg = {
		private ["_parameters","_text","_channel","_pvUpdate"];
		_parameters = _this select 0;
		_text        = ((_parameters) select 0);
		_channel     = ((_parameters) select 1);
		_pvUpdate    = _this select 1;
		call compile format ["DDOPP_taser_globalChat %2 ""%1""; diag_log ""D.DOPPLER Taser Mod (Msg Sent): %1"";",_text,_channel];
		if (_pvUpdate && isMultiplayer) then {
			DDOPP_pvMsg = [_text,_channel];
			publicVariable "DDOPP_pvMsg";
		};
	};
};









