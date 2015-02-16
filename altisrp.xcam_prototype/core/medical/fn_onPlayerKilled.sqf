#include <macro.h>
/*
	File: fn_onPlayerKilled.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	When the player dies collect various information about that player
	and pull up the death dialog / camera functionality.
*/
private["_unit","_killer","_veh"];
disableSerialization;
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_killer = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;

//Set some vars
_unit setVariable["Revive",FALSE,true]; //Set the corpse to a revivable state.
_unit setVariable["name",profileName,true]; //Set my name so they can say my name.
_unit setVariable["AGM_isCaptive",FALSE,true];
_unit setVariable["AGM_isEscorting",FALSE,true];
// _unit setVariable["transporting",FALSE,true]; //Why the fuck do I have this? Is it used?
_unit setVariable["steam64id",(getPlayerUID player),true]; //Set the UID.
_unit setVariable["side",playerSide,true]; //Set the UID.

//Setup our camera view
life_deathCamera  = "CAMERA" camCreate (getPosATL _unit);
showCinemaBorder true;
life_deathCamera cameraEffect ["Internal","Back"];
createDialog "DeathScreen";
life_deathCamera camSetTarget _unit;
life_deathCamera camSetRelPos [0,3.5,4.5];
life_deathCamera camSetFOV .5;
life_deathCamera camSetFocus [50,0];
life_deathCamera camCommit 0;

[] call life_fnc_getHLC;
[[_unit,_killer,0],"TON_fnc_logdeath",serverhc,false] spawn life_fnc_MP;

(findDisplay 7300) displaySetEventHandler ["KeyDown","if((_this select 1) == 1) then {true}"]; //Block the ESC menu

//Create a thread for something?
_unit spawn
{
	private["_maxTime","_RespawnBtn","_Timer"];
	disableSerialization;
	_RespawnBtn = ((findDisplay 7300) displayCtrl 7302);
	_Timer = ((findDisplay 7300) displayCtrl 7301);
	if(__GETC__(life_adminlevel) > 0) then{
		_RespawnBtn ctrlEnable true;
		_Timer ctrlSetText localize "STR_Medic_Respawn_2";
	} else{
		maxTimeRespawn = time + (life_respawn_timer * 60);
		_RespawnBtn ctrlEnable false;
		waitUntil {_Timer ctrlSetText format[localize "STR_Medic_Respawn",[(maxTimeRespawn - time),"MM:SS.MS"] call BIS_fnc_secondsToString];
		round(maxTimeRespawn - time) <= 0 OR isNull _this};
		_RespawnBtn ctrlEnable true;
		_Timer ctrlSetText localize "STR_Medic_Respawn_2";
		maxTimeRespawn = 0;
	};
	// _maxTime = time + (13 * 60);
	// waitUntil {_Timer ctrlSetText format[localize "STR_Medic_Respawn_2",[(_maxTime - time),"MM:SS.MS"] call BIS_fnc_secondsToString];
	// round(_maxTime - time) <= 0 OR isNull _this OR (isNull (findDisplay 7300))};
	// if(!isNull _this && !(isNull (findDisplay 7300))) then { closeDialog 0; life_respawned = true; spawnmenuon = 1; [] call life_fnc_spawnMenu; };
};

[_unit] spawn life_fnc_deathScreen;

//Create a thread to follow with some what precision view of the corpse.
[_unit] spawn
{
	private["_unit"];
	_unit = _this select 0;
	waitUntil {if(speed _unit == 0) exitWith {true}; life_deathCamera camSetTarget _unit; life_deathCamera camSetRelPos [0,3.5,4.5]; life_deathCamera camCommit 0;};
};

//Make the killer wanted
if(!isNull _killer && {_killer != _unit} && {side _killer != west} && {alive _killer}) then {
	if(vehicle _killer isKindOf "LandVehicle") then {
		[] call life_fnc_getHLC;
		[[getPlayerUID _killer,_killer getVariable["realname",name _killer],"187V"],"life_fnc_wantedAdd",serverhc,false] spawn life_fnc_MP;
		//Get rid of this if you don't want automatic vehicle license removal.
		// if(!local _killer) then {
			// [[2],"life_fnc_removeLicenses",_killer,FALSE] spawn life_fnc_MP;
		// };
	} else {
		[] call life_fnc_getHLC;
		[[getPlayerUID _killer,_killer getVariable["realname",name _killer],"187"],"life_fnc_wantedAdd",serverhc,false] spawn life_fnc_MP;
		
		//if(!local _killer) then {
		//	[[3],"life_fnc_removeLicenses",_killer,FALSE] spawn life_fnc_MP;
		//};
	};
};

_veh = vehicle _unit;
// waitUntil { !alive _unit };
if(_veh != _unit) then {
	// diag_log format["check vehB - %1 - %2",_veh,speed _veh];
	// waitUntil { speed _veh < 2 };
	// diag_log format["check vehB2 - %1 - %2 - %3",_veh,speed _veh,crew _veh];
	unassignVehicle (_unit);
	_unit setposATL getposATL _veh;
	// _unit action ["Eject", _veh];
};

//Killed by cop stuff...
if(side _killer == west && playerSide != west) then {
	//life_copRecieve = _killer;
	//Did I rob the federal reserve?
	if(!life_use_atm && {life_cash > 0}) then {
		[format[localize "STR_Cop_RobberDead",[life_cash] call life_fnc_numberText],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
		life_cash = 0;
	};
};
if(!isNull _killer && {_killer != _unit}) then {
	life_removeWanted = true;
};

_handle = [_unit,true] spawn life_fnc_dropItems;
waitUntil {scriptDone _handle};

life_hunger = 100;
life_thirst = 100;
life_carryWeight = 0;
life_cash = 0;

[] call life_fnc_hudUpdate; //Get our HUD updated.
//[[player,life_sidechat,playerSide],"TON_fnc_managesc",false,false] spawn life_fnc_MP;

[] call SOCK_fnc_updateRequest;

// [0] call SOCK_fnc_updatePartial;
// [3] call SOCK_fnc_updatePartial;