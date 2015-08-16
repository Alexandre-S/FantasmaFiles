if(isServer OR !hasInterface) exitwith {};
/*
	File: fn_hudUpdate.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Updates the HUD when it needs to.
*/
private["_ui","_food","_water","_health","_ctrlCombat","_combatVal","_money","_cash","_speaker","_volume","_dependance"];
disableSerialization;

_ui = uiNameSpace getVariable ["playerHUD",displayNull];
if(isNull _ui) then {[] call life_fnc_hudSetup;};
_speaker = _ui displayCtrl 23663;
_food = _ui displayCtrl 23500;
_water = _ui displayCtrl 23510;
_health = _ui displayCtrl 23515;
_ctrlCombat = _ui displayCtrl 23450;
_money = _ui displayCtrl 23520;
_dependance = _ui displayCtrl 23525;

_cash = life_cash;
_combatVal =	1 - dayz_combat; // May change later to be a range of red/green to loosely indicate 'time left in combat'

//Rajouter [] call life_fnc_hudUpdate; dans task_force_radio/functions/fn_onSpeakVolumeChange.sqf
_volume = "Parler";
switch(TF_speak_volume_level) do {
	case "whispering": {
		_volume = "Murmurer";
	};
	case "yelling": {
		_volume = "Crier";
	};
	case "normal": {
		_volume = "Parler";
	};
	default {
		_volume = "Parler";
	};
};

//Update combat
_ctrlCombat ctrlSetTextColor [(0.38 + (0.3 * (1-_combatVal))),(0.63 * _combatVal),(0.26 * _combatVal), 0.5];
//Update Speaker
_speaker ctrlSetPosition [safeZoneX+safeZoneW-0.090,safeZoneY+safeZoneH-0.678];
_speaker ctrlSetText format["%1", _volume];
_speaker ctrlCommit 0;
//Update food
_food ctrlSetPosition [safeZoneX+safeZoneW-0.090,safeZoneY+safeZoneH-0.548];
_food ctrlSetText format["%1", life_hunger];
_food ctrlCommit 0;
//Update Water
_water ctrlSetPosition [safeZoneX+safeZoneW-0.090,safeZoneY+safeZoneH-0.502];
_water ctrlSetText format["%1", life_thirst];
_water ctrlCommit 0;
//Update Health
_health ctrlSetPosition [safeZoneX+safeZoneW-0.090,safeZoneY+safeZoneH-0.456];
_health ctrlSetText format["%1", round((1 - (damage player)) * 100)];
_health ctrlCommit 0;
//Update Money
_dependance ctrlSetPosition [safeZoneX+safeZoneW-0.090,safeZoneY+safeZoneH-0.410];
_dependance ctrlSetText format["%1", format["%1/%2",dependance*100,life_drug_level*100]];
_dependance ctrlCommit 0;
//Update Money
_money ctrlSetPosition [safeZoneX+safeZoneW-0.090,safeZoneY+safeZoneH-0.364];
_money ctrlSetText format["%1", format["%1",_cash]];
_money ctrlCommit 0;