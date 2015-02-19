/*
	File: fn_abattre.sqf
	Author: Havena
	
	Description:
	abattre
*/
private["_unit","_ui","_progressBar","_titleText","_cP","_title","_badDistance"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _unit) exitWith {}; //DAFUQ?@!%$!R?EFFD?TGSF?HBS?DHBFNFD?YHDGN?D?FJH

if(player distance _unit > 5) exitWith {}; //Not close enough.

life_interrupted = false;
if(life_action_inUse) exitWith {};
// _title = format["Abattre %1",name _unit];
_title = "Abattre la cible";
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
	sleep 0.15;
	if(player != vehicle player) exitWith {};
	if (animationState _this != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		[_this, "AinvPknlMstpSnonWnonDnon_medic_1", 2, True] call AGM_Core_fnc_doAnimation;
	};
};

while {true} do
{
	if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		player spawn _fnc_playAnim;
		// [[player,"AinvPknlMstpSnonWnonDnon_medic_1"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
		// player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};
	sleep 0.27;
	_cP = _cP + 0.01;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR !alive player) exitWith {};
	if(life_istazed) exitWith {}; //Tazed
	if(life_interrupted) exitWith {};
	if((player getVariable["AGM_isCaptive",false])) exitWith {};
	if(player distance _unit > 4) exitWith {_badDistance = true;};
};
//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player OR life_istazed) exitWith {life_action_inUse = false;};
if((player getVariable["AGM_isCaptive",false])) exitWith {life_action_inUse = false;};
if(!isNil "_badDistance") exitWith {titleText[localize "Vous êtes trop loin de la cible","PLAIN"]; life_action_inUse = false;};
if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};
life_action_inUse = false;
_unit setVariable ["do_abattre", true, true];
// _unit setDamage 1;
[] call life_fnc_getHLC;
[[_unit,player,2],"STS_fnc_logdeath",serverhc,false] spawn life_fnc_MP;
[[],"life_fnc_forceSpawnMenu",_unit,FALSE] spawn life_fnc_MP;