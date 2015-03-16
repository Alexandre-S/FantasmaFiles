/*
	File: fn_lockpick.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main functionality for lock-picking.
*/
private["_curTarget","_distance","_isVehicle","_title","_progressBar","_cP","_titleText","_dice","_badDistance","_chance"];
_curTarget = cursorTarget;
life_interrupted = false;
if(life_action_inUse) exitWith {};
if(isNull _curTarget) exitWith {}; //Bad type
_distance = ((boundingBox _curTarget select 1) select 0) + 2;
if(player distance _curTarget > _distance) exitWith {}; //Too far
_isVehicle = if((_curTarget isKindOf "LandVehicle") OR (_curTarget isKindOf "Ship") OR (_curTarget isKindOf "Air")) then {true} else {false};
if(_isVehicle && _curTarget in life_vehicles) exitWith {hint localize "STR_ISTR_Lock_AlreadyHave"};

//More error checks
if(!_isVehicle && !isPlayer _curTarget) exitWith {};
if(!_isVehicle && !(_curTarget getVariable["AGM_isCaptive",false])) exitWith {};

_title = format[localize "STR_ISTR_Lock_Process",if(!_isVehicle) then {"Handcuffs"} else {getText(configFile >> "CfgVehicles" >> (typeOf _curTarget) >> "displayName")}];
life_action_inUse = true; //Lock out other actions

//Setup the progress bar
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

// play appropriate anim
	private "_fnc_playAnim";
	_fnc_playAnim = {
		if (getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> animationState _this >> "AGM_isLadder") == 1) then {
			_this action ["LadderOff", nearestObject [position _this, "House"]];
		};
		waitUntil {isTouchingGround _this OR underwater _this};
		waitUntil {!([_this] call AGM_Core_fnc_inTransitionAnim) or !(alive _this)};
		if !(alive _this) exitWith {};
		[_this, "AinvPknlMstpSnonWnonDnon_medic_1", 1, True] call AGM_Core_fnc_doAnimation;
		uiSleep 0.15;
		if(player != vehicle player) exitWith {};
		if (animationState _this != "AinvPknlMstpSnonWnonDnon_medic_1") then {
			[_this, "AinvPknlMstpSnonWnonDnon_medic_1", 2, True] call AGM_Core_fnc_doAnimation;
		};
	};

while {true} do
{
	if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		// [[player,"AinvPknlMstpSnonWnonDnon_medic_1"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
		// player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
		player spawn _fnc_playAnim;
	};
	uiSleep 0.26;
	if(isNull _ui) then {
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNamespace getVariable "life_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
	};
	_cP = _cP + 0.01;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR !alive player) exitWith {};
	if(life_istazed) exitWith {}; //Tazed
	if(life_interrupted) exitWith {};
	if((player getVariable["AGM_isCaptive",false])) exitWith {};
	if(player distance _curTarget > _distance) exitWith {_badDistance = true;};
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player OR life_istazed) exitWith {life_action_inUse = false;};
if((player getVariable["AGM_isCaptive",false])) exitWith {life_action_inUse = false;};
if(!isNil "_badDistance") exitWith {titleText[localize "STR_ISTR_Lock_TooFar","PLAIN"]; life_action_inUse = false;};
if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};
if(!([false,"lockpick",1] call life_fnc_handleInv)) exitWith {life_action_inUse = false;};

life_action_inUse = false;
if (_curTarget isKindOf "Air") then{
	_chance = 10;
} else {
	_chance = 15;
};
_dice = random(100);
if(!_isVehicle) then {
	if(_dice <= _chance) then
	{
		titleText["Vous avez libéré cette personne.","PLAIN"];
		[_curTarget, false] call AGM_Interaction_fnc_setCaptive;
		//[] call life_fnc_getHLC;
		//[[getPlayerUID player,profileName,"486"],"life_fnc_wantedAdd",serverhc,false] spawn life_fnc_MP;
		[[0,format["%1 a crocheté les menottes de %2.",profileName,name _curTarget]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
	}
	else
	{
		titleText["Le kit de crochetage est cassé.","PLAIN"];
		//[[0,format["%1 est en train de crocheter les menottes de %2.",profileName,name _curTarget]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
	};
} else {
	if(_dice <= _chance) then {
		titleText[localize "STR_ISTR_Lock_Success","PLAIN"];
		life_vehicles pushBack _curTarget;
		[] call life_fnc_getHLC;
		[[getPlayerUID player,profileName,"487"],"life_fnc_wantedAdd",serverhc,false] spawn life_fnc_MP;
		[[0,"STR_ISTR_Lock_FailedNOTF",true,[profileName]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
	} else {
		// [] call life_fnc_getHLC;
		// [[getPlayerUID player,profileName,"215"],"life_fnc_wantedAdd",serverhc,false] spawn life_fnc_MP;
		// [[0,"STR_ISTR_Lock_FailedNOTF",true,[profileName]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
		titleText[localize "STR_ISTR_Lock_Failed","PLAIN"];
	};
[[_curTarget, "alarmevoiture",75],"life_fnc_playSound",true,false] spawn life_fnc_MP;	
};