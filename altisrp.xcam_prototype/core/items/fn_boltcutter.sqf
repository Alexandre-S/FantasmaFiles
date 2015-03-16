/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Breaks the lock on a single door (Closet door to the player).
*/
if(isNil "life_boltcutter_uses") then {life_boltcutter_uses = true;};
if(life_action_inUse) exitWith {hint "Vous ne pouvez pas utiliser rapidement les touches d'actions!"};
private["_building","_door","_doors","_cpRate","_title","_progressBar","_titleText","_cp","_ui","_chance","_dice"];
_building = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _building) exitWith {};
if(!(_building isKindOf "House_F")) exitWith {hint "You are not looking at a house door."};
if((nearestObject [[16019.5,16952.9,0],"Land_Dome_Big_F"]) == _building OR (nearestObject [[16019.5,16952.9,0],"Land_Research_house_V1_F"]) == _building) then {
	[[[1,2],"STR_ISTR_Bolt_AlertFed",true,[]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
} else {
	[[0,"STR_ISTR_Bolt_AlertHouse",true,[profileName]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
};

_doors = getNumber(configFile >> "CfgVehicles" >> (typeOf _building) >> "NumberOfDoors");

_door = 0;
//Find the nearest door
for "_i" from 1 to _doors do {
	_selPos = _building selectionPosition format["Door_%1_trigger",_i];
	_worldSpace = _building modelToWorld _selPos;
		if(player distance _worldSpace < 5) exitWith {_door = _i;};
};
if(_door == 0) exitWith {hint localize "STR_Cop_NotaDoor"}; //Not near a door to be broken into.
if((_building getVariable[format["bis_disabled_Door_%1",_door],0]) == 0) exitWith {hint localize "STR_House_Raid_DoorUnlocked"};
life_action_inUse = true;

//Setup the progress bar
disableSerialization;
_title = localize "STR_ISTR_Bolt_Process";
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

switch (typeOf _building) do {
	case "Land_Dome_Big_F": {_cpRate = 0.003;};
	case "Land_Research_house_V1_F": {_cpRate = 0.0015;};
	default {_cpRate = 0.01;}
};

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
		// [[player,"AinvPknlMstpSnonWnonDnon_medic_1"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
		// player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
		player spawn _fnc_playAnim;
	};
	sleep 0.26;
	if(isNull _ui) then {
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNamespace getVariable "life_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
	};
	_cP = _cP + _cpRate;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR !alive player) exitWith {};
	if(life_istazed) exitWith {}; //Tazed
	if(life_interrupted) exitWith {};
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player OR life_istazed) exitWith {life_action_inUse = false;};
if((player getVariable["AGM_isCaptive",false])) exitWith {life_action_inUse = false;};
if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};
if(!([false,"boltcutter",1] call life_fnc_handleInv)) exitWith {life_action_inUse = false;};

// life_boltcutter_uses = life_boltcutter_uses + 1;
// if(life_boltcutter_uses >= 5) then {
	// [false,"boltcutter",1] call life_fnc_handleInv;
	// life_boltcutter_uses = 0;
// };
switch (typeOf _building) do {
	case "Land_Dome_Big_F": {_chance = 20;};
	case "Land_Research_house_V1_F": {_chance = 20;};
	default {_chance = 5;}
};
_dice = random(100);
if(_dice <= _chance) then
{
	_building setVariable[format["bis_disabled_Door_%1",_door],0,true]; //Unlock the door.
	if((_building getVariable["locked",false])) then {
		_building setVariable["locked",false,true];
	};
	[] call life_fnc_getHLC;
	[[getPlayerUID player,profileName,"459"],"life_fnc_wantedAdd",serverhc,false] spawn life_fnc_MP;
}
else
{
	titleText["L'outil de serrurier est cassé.","PLAIN"];
};
[[_curTarget, "alarmevoiture",75],"life_fnc_playSound",true,false] spawn life_fnc_MP;
life_action_inUse = false;