/*
	File: fn_escInterupt.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Monitors when the ESC menu is pulled up and blocks off
	certain controls when conditions meet.
*/
private["_abortButton","_respawnButton","_fieldManual","_escSync","_canUseControls"];
disableSerialization;

_escSync = {
	private["_abortButton","_thread","_syncManager"];
	disableSerialization;
	
	_syncManager = {
		disableSerialization;
		private["_abortButton","_timeStamp","_save"];
		_abortButton = (findDisplay 49) displayCtrl 104;
		_timeStamp = time + 10;
		
		_save = false;
		waitUntil {
			_abortButton ctrlSetText format[localize "STR_NOTF_AbortESC",[(_timeStamp - time),"SS.MS"] call BIS_fnc_secondsToString];
			_abortButton ctrlCommit 0;
			if(round(_timeStamp - time) == 5 && !_save) then {
				_save = true;
				[] call SOCK_fnc_updateRequest; //call our silent sync.
			};
			round(_timeStamp - time) <= 0 || isNull (findDisplay 49)
		};
		
		_abortButton ctrlSetText localize "STR_DISP_INT_ABORT";
		_abortButton ctrlCommit 0;
	};
	
	_abortButton = (findDisplay 49) displayCtrl 104;
	// [] call SOCK_fnc_updateRequest; //call our silent sync.
	
	if(_this) then {
		_thread = [] spawn _syncManager;
		waitUntil{scriptDone _thread OR isNull (findDisplay 49)};
		_abortButton ctrlEnable true;
	};
};

_canUseControls = {
	if(playerSide == west) exitWith {true};
	if((player getVariable["ACE_captives_isHandcuffed",FALSE]) OR (player getVariable["ACE_captives_isEscorting",FALSE]) OR (life_is_arrested) OR (life_istazed) OR (life_isOut)) then {false} else {true};
};
	
while {true} do
{
	waitUntil{sleep 0.03;!isNull (findDisplay 49)};
	_abortButton = (findDisplay 49) displayCtrl 104;
	[] call life_fnc_getHLC;
	//_abortButton buttonSetAction "[[player],""TON_fnc_cleanupRequest"",serverhc,false] spawn life_fnc_MP";
	_respawnButton = (findDisplay 49) displayCtrl 1010;
	_fieldManual = (findDisplay 49) displayCtrl 122;
	
	//Block off our buttons first.
	_abortButton ctrlEnable false;
	_respawnButton ctrlEnable false;
	_fieldManual ctrlEnable false; //Never re-enable, blocks an old script executor.
	
	_usebleCtrl = call _canUseControls;
	_usebleCtrl spawn _escSync;
	if(_usebleCtrl) then {
		_respawnButton ctrlEnable true; //Enable the button.
	};
	waitUntil{sleep 0.03;isNull (findDisplay 49)};
};
