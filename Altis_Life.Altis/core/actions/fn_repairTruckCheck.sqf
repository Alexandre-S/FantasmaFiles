/*
	File: fn_repairTruckCheck.sqf
	Author: Havena
	
	Description:
	check repair.
*/
private ["_vehicle","_objtype","_array","_hitC","_cfg","_PartN","_PartName","_HitP","_veh_actions"];

_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _vehicle) exitWith {}; //Null was passed?
if!((_vehicle isKindOf "LandVehicle") OR (_vehicle isKindOf "Ship") OR (_vehicle isKindOf "Air")) exitwith {};

life_action_inUse = true;
_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
// _upp = format[localize "STR_NOTF_Repairing",_displayName];
_upp = format["Inspection de %1",_displayName];
//Setup our progress bar.
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
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

while{true} do
{
	if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		player spawn _fnc_playAnim;
		// [[player,"AinvPknlMstpSnonWnonDnon_medic_1"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
		// player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};
	sleep 0.27;
	_cP = _cP + 0.03;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
	if(_cP >= 1) exitWith {};
	if(!alive player) exitWith {};
	if(player != vehicle player) exitWith {};
	if(life_interrupted) exitWith {};
};

life_action_inUse = false;
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};
if(player != vehicle player) exitWith {titleText[localize "STR_NOTF_RepairingInVehicle","PLAIN"];};


_objtype = typeOf _vehicle;
_array = [];
_hitC = (count ((configFile >> "CfgVehicles" >> _objtype >> "HitPoints") call Bis_fnc_getCfgSubClasses)) - 1; 
_veh_actions = [];
for "_i" from 0 to _hitC do {
	_cfg = (configFile >> "CfgVehicles" >> _objtype >> "HitPoints") select _i; 
	_PartN = configName _cfg;
	_PartName = getText(_cfg >> "name");
	_HitP = _vehicle getHitPointDamage _PartN;
	// _array set [_i,[_PartName,_PartN,_HitP]];

	if(_PartN == "HitEngine") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#00D600'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitEngine"; !life_action_inUse && _degat > 0 && _degat <= 0.2' ]); };
	if(_PartN == "HitEngine1") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#00D600'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitEngine1"; !life_action_inUse && _degat > 0 && _degat <= 0.2' ]); };
	if(_PartN == "HitEngine2") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#00D600'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitEngine2"; !life_action_inUse && _degat > 0 && _degat <= 0.2' ]); };
	if(_PartN == "HitEngine3") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#00D600'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitEngine3"; !life_action_inUse && _degat > 0 && _degat <= 0.2' ]); };
	if(_PartN == "HitFuel") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#00D600'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitFuel"; !life_action_inUse && _degat > 0 && _degat <= 0.2' ]); };
	if(_PartN == "HitFuel2") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#00D600'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitFuel2"; !life_action_inUse && _degat > 0 && _degat <= 0.2' ]); };
	if(_PartN == "HitHull") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#00D600'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitHull"; !life_action_inUse && _degat > 0 && _degat <= 0.2' ]); };
	if(_PartN == "HitAvionics") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#00D600'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitAvionics"; !life_action_inUse && _degat > 0 && _degat <= 0.2' ]); };
	if(_PartN == "HitMissiles") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#00D600'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitMissiles"; !life_action_inUse && _degat > 0 && _degat <= 0.2' ]); };
	if(_PartN == "HitBody") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#00D600'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitBody"; !life_action_inUse && _degat > 0 && _degat <= 0.2' ]); };
	if(_PartN == "HitHRotor") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#00D600'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitHRotor"; !life_action_inUse && _degat > 0 && _degat <= 0.2' ]); };
	if(_PartN == "HitVRotor") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#00D600'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitVRotor"; !life_action_inUse && _degat > 0 && _degat <= 0.2' ]); };
	if(_PartN == "HitLFWheel") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#00D600'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitLFWheel"; !life_action_inUse && _degat > 0 && _degat <= 0.2' ]); };
	if(_PartN == "HitLBWheel") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#00D600'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitLBWheel"; !life_action_inUse && _degat > 0 && _degat <= 0.2' ]); };
	if(_PartN == "HitLMWheel") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#00D600'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitLMWheel"; !life_action_inUse && _degat > 0 && _degat <= 0.2' ]); };
	if(_PartN == "HitLF2Wheel") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#00D600'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitLF2Wheel"; !life_action_inUse && _degat > 0 && _degat <= 0.2' ]); };
	if(_PartN == "HitRFWheel") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#00D600'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitRFWheel"; !life_action_inUse && _degat > 0 && _degat <= 0.2' ]); };
	if(_PartN == "HitRBWheel") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#00D600'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitRBWheel"; !life_action_inUse && _degat > 0 && _degat <= 0.2' ]); };
	if(_PartN == "HitRMWheel") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#00D600'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitRMWheel"; !life_action_inUse && _degat > 0 && _degat <= 0.2' ]); };
	if(_PartN == "HitRF2Wheel") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#00D600'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitRF2Wheel"; !life_action_inUse && _degat > 0 && _degat <= 0.2' ]); };
	if(_PartN == "hitwindshield_1") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#00D600'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "hitwindshield_1"; !life_action_inUse && _degat > 0 && _degat <= 0.2' ]); };
	if(_PartN == "hitwindshield_2") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#00D600'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "hitwindshield_2"; !life_action_inUse && _degat > 0 && _degat <= 0.2' ]); };
	if(_PartN == "HitRGlass") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#00D600'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitRGlass"; !life_action_inUse && _degat > 0 && _degat <= 0.2' ]); };
	if(_PartN == "HitLGlass") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#00D600'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitLGlass"; !life_action_inUse && _degat > 0 && _degat <= 0.2' ]); };
	if(_PartN == "HitGlass1") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#00D600'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitGlass1"; !life_action_inUse && _degat > 0 && _degat <= 0.2' ]); };
	if(_PartN == "HitGlass2") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#00D600'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitGlass2"; !life_action_inUse && _degat > 0 && _degat <= 0.2' ]); };
	if(_PartN == "HitGlass3") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#00D600'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitGlass3"; !life_action_inUse && _degat > 0 && _degat <= 0.2' ]); };
	if(_PartN == "HitGlass4") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#00D600'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitGlass4"; !life_action_inUse && _degat > 0 && _degat <= 0.2' ]); };
	if(_PartN == "HitGlass5") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#00D600'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitGlass5"; !life_action_inUse && _degat > 0 && _degat <= 0.2' ]); };
	if(_PartN == "HitGlass6") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#00D600'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitGlass6"; !life_action_inUse && _degat > 0 && _degat <= 0.2' ]); };
	if(_PartN == "HitGlass7") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#00D600'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitGlass7"; !life_action_inUse && _degat > 0 && _degat <= 0.2' ]); };
	if(_PartN == "HitGlass8") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#00D600'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitGlass8"; !life_action_inUse && _degat > 0 && _degat <= 0.2' ]); };
	if(_PartN == "HitGlass9") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#00D600'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitGlass9"; !life_action_inUse && _degat > 0 && _degat <= 0.2' ]); };
	if(_PartN == "HitGlass10") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#00D600'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitGlass10"; !life_action_inUse && _degat > 0 && _degat <= 0.2' ]); };
	if(_PartN == "HitGlass11") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#00D600'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitGlass11"; !life_action_inUse && _degat > 0 && _degat <= 0.2' ]); };
	if(_PartN == "HitGlass12") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#00D600'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitGlass12"; !life_action_inUse && _degat > 0 && _degat <= 0.2' ]); };
	if(_PartN == "HitGlass13") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#00D600'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitGlass13"; !life_action_inUse && _degat > 0 && _degat <= 0.2' ]); };
	if(_PartN == "HitGlass14") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#00D600'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitGlass14"; !life_action_inUse && _degat > 0 && _degat <= 0.2' ]); };
	
	if(_PartN == "HitEngine") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#FFFF33'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitEngine"; !life_action_inUse && _degat > 0.2 && _degat <= 0.5' ]); };
	if(_PartN == "HitEngine1") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#FFFF33'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitEngine1"; !life_action_inUse && _degat > 0.2 && _degat <= 0.5' ]); };
	if(_PartN == "HitEngine2") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#FFFF33'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitEngine2"; !life_action_inUse && _degat > 0.2 && _degat <= 0.5' ]); };
	if(_PartN == "HitEngine3") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#FFFF33'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitEngine3"; !life_action_inUse && _degat > 0.2 && _degat <= 0.5' ]); };
	if(_PartN == "HitFuel") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#FFFF33'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitFuel"; !life_action_inUse && _degat > 0.2 && _degat <= 0.5' ]); };
	if(_PartN == "HitFuel2") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#FFFF33'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitFuel2"; !life_action_inUse && _degat > 0.2 && _degat <= 0.5' ]); };
	if(_PartN == "HitHull") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#FFFF33'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitHull"; !life_action_inUse && _degat > 0.2 && _degat <= 0.5' ]); };
	if(_PartN == "HitAvionics") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#FFFF33'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitAvionics"; !life_action_inUse && _degat > 0.2 && _degat <= 0.5' ]); };
	if(_PartN == "HitMissiles") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#FFFF33'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitMissiles"; !life_action_inUse && _degat > 0.2 && _degat <= 0.5' ]); };
	if(_PartN == "HitBody") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#FFFF33'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitBody"; !life_action_inUse && _degat > 0.2 && _degat <= 0.5' ]); };
	if(_PartN == "HitHRotor") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#FFFF33'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitHRotor"; !life_action_inUse && _degat > 0.2 && _degat <= 0.5' ]); };
	if(_PartN == "HitVRotor") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#FFFF33'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitVRotor"; !life_action_inUse && _degat > 0.2 && _degat <= 0.5' ]); };
	if(_PartN == "HitLFWheel") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#FFFF33'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitLFWheel"; !life_action_inUse && _degat > 0.2 && _degat <= 0.5' ]); };
	if(_PartN == "HitLBWheel") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#FFFF33'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitLBWheel"; !life_action_inUse && _degat > 0.2 && _degat <= 0.5' ]); };
	if(_PartN == "HitLMWheel") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#FFFF33'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitLMWheel"; !life_action_inUse && _degat > 0.2 && _degat <= 0.5' ]); };
	if(_PartN == "HitLF2Wheel") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#FFFF33'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitLF2Wheel"; !life_action_inUse && _degat > 0.2 && _degat <= 0.5' ]); };
	if(_PartN == "HitRFWheel") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#FFFF33'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitRFWheel"; !life_action_inUse && _degat > 0.2 && _degat <= 0.5' ]); };
	if(_PartN == "HitRBWheel") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#FFFF33'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitRBWheel"; !life_action_inUse && _degat > 0.2 && _degat <= 0.5' ]); };
	if(_PartN == "HitRMWheel") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#FFFF33'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitRMWheel"; !life_action_inUse && _degat > 0.2 && _degat <= 0.5' ]); };
	if(_PartN == "HitRF2Wheel") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#FFFF33'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitRF2Wheel"; !life_action_inUse && _degat > 0.2 && _degat <= 0.5' ]); };
	if(_PartN == "hitwindshield_1") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#FFFF33'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "hitwindshield_1"; !life_action_inUse && _degat > 0.2 && _degat <= 0.5' ]); };
	if(_PartN == "hitwindshield_2") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#FFFF33'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "hitwindshield_2"; !life_action_inUse && _degat > 0.2 && _degat <= 0.5' ]); };
	if(_PartN == "HitRGlass") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#FFFF33'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitRGlass"; !life_action_inUse && _degat > 0.2 && _degat <= 0.5' ]); };
	if(_PartN == "HitLGlass") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#FFFF33'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitLGlass"; !life_action_inUse && _degat > 0.2 && _degat <= 0.5' ]); };
	if(_PartN == "HitGlass1") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#FFFF33'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitGlass1"; !life_action_inUse && _degat > 0.2 && _degat <= 0.5' ]); };
	if(_PartN == "HitGlass2") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#FFFF33'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitGlass2"; !life_action_inUse && _degat > 0.2 && _degat <= 0.5' ]); };
	if(_PartN == "HitGlass3") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#FFFF33'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitGlass3"; !life_action_inUse && _degat > 0.2 && _degat <= 0.5' ]); };
	if(_PartN == "HitGlass4") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#FFFF33'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitGlass4"; !life_action_inUse && _degat > 0.2 && _degat <= 0.5' ]); };
	if(_PartN == "HitGlass5") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#FFFF33'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitGlass5"; !life_action_inUse && _degat > 0.2 && _degat <= 0.5' ]); };
	if(_PartN == "HitGlass6") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#FFFF33'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitGlass6"; !life_action_inUse && _degat > 0.2 && _degat <= 0.5' ]); };
	if(_PartN == "HitGlass7") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#FFFF33'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitGlass7"; !life_action_inUse && _degat > 0.2 && _degat <= 0.5' ]); };
	if(_PartN == "HitGlass8") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#FFFF33'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitGlass8"; !life_action_inUse && _degat > 0.2 && _degat <= 0.5' ]); };
	if(_PartN == "HitGlass9") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#FFFF33'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitGlass9"; !life_action_inUse && _degat > 0.2 && _degat <= 0.5' ]); };
	if(_PartN == "HitGlass10") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#FFFF33'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitGlass10"; !life_action_inUse && _degat > 0.2 && _degat <= 0.5' ]); };
	if(_PartN == "HitGlass11") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#FFFF33'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitGlass11"; !life_action_inUse && _degat > 0.2 && _degat <= 0.5' ]); };
	if(_PartN == "HitGlass12") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#FFFF33'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitGlass12"; !life_action_inUse && _degat > 0.2 && _degat <= 0.5' ]); };
	if(_PartN == "HitGlass13") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#FFFF33'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitGlass13"; !life_action_inUse && _degat > 0.2 && _degat <= 0.5' ]); };
	if(_PartN == "HitGlass14") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#FFFF33'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitGlass14"; !life_action_inUse && _degat > 0.2 && _degat <= 0.5' ]); };
	
	
	if(_PartN == "HitEngine") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#FF0000'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitEngine"; !life_action_inUse && _degat > 0.5' ]); };
	if(_PartN == "HitEngine1") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#FF0000'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitEngine1"; !life_action_inUse && _degat > 0.5' ]); };
	if(_PartN == "HitEngine2") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#FF0000'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitEngine2"; !life_action_inUse && _degat > 0.5' ]); };
	if(_PartN == "HitEngine3") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#FF0000'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitEngine3"; !life_action_inUse && _degat > 0.5' ]); };
	if(_PartN == "HitFuel") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#FF0000'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitFuel"; !life_action_inUse && _degat > 0.5' ]); };
	if(_PartN == "HitFuel2") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#FF0000'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitFuel2"; !life_action_inUse && _degat > 0.5' ]); };
	if(_PartN == "HitHull") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#FF0000'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitHull"; !life_action_inUse && _degat > 0.5' ]); };
	if(_PartN == "HitAvionics") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#FF0000'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitAvionics"; !life_action_inUse && _degat > 0.5' ]); };
	if(_PartN == "HitMissiles") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#FF0000'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitMissiles"; !life_action_inUse && _degat > 0.5' ]); };
	if(_PartN == "HitBody") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#FF0000'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitBody"; !life_action_inUse && _degat > 0.5' ]); };
	if(_PartN == "HitHRotor") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#FF0000'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitHRotor"; !life_action_inUse && _degat > 0.5' ]); };
	if(_PartN == "HitVRotor") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#FF0000'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitVRotor"; !life_action_inUse && _degat > 0.5' ]); };
	if(_PartN == "HitLFWheel") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#FF0000'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitLFWheel"; !life_action_inUse && _degat > 0.5' ]); };
	if(_PartN == "HitLBWheel") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#FF0000'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitLBWheel"; !life_action_inUse && _degat > 0.5' ]); };
	if(_PartN == "HitLMWheel") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#FF0000'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitLMWheel"; !life_action_inUse && _degat > 0.5' ]); };
	if(_PartN == "HitLF2Wheel") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#FF0000'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitLF2Wheel"; !life_action_inUse && _degat > 0.5' ]); };
	if(_PartN == "HitRFWheel") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#FF0000'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitRFWheel"; !life_action_inUse && _degat > 0.5' ]); };
	if(_PartN == "HitRBWheel") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#FF0000'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitRBWheel"; !life_action_inUse && _degat > 0.5' ]); };
	if(_PartN == "HitRMWheel") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#FF0000'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitRMWheel"; !life_action_inUse && _degat > 0.5' ]); };
	if(_PartN == "HitRF2Wheel") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#FF0000'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitRF2Wheel"; !life_action_inUse && _degat > 0.5' ]); };
	if(_PartN == "hitwindshield_1") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#FF0000'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "hitwindshield_1"; !life_action_inUse && _degat > 0.5' ]); };
	if(_PartN == "hitwindshield_2") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#FF0000'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "hitwindshield_2"; !life_action_inUse && _degat > 0.5' ]); };
	if(_PartN == "HitRGlass") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#FF0000'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitRGlass"; !life_action_inUse && _degat > 0.5' ]); };
	if(_PartN == "HitLGlass") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#FF0000'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitLGlass"; !life_action_inUse && _degat > 0.5' ]); };
	if(_PartN == "HitGlass1") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#FF0000'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitGlass1"; !life_action_inUse && _degat > 0.5' ]); };
	if(_PartN == "HitGlass2") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#FF0000'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitGlass2"; !life_action_inUse && _degat > 0.5' ]); };
	if(_PartN == "HitGlass3") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#FF0000'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitGlass3"; !life_action_inUse && _degat > 0.5' ]); };
	if(_PartN == "HitGlass4") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#FF0000'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitGlass4"; !life_action_inUse && _degat > 0.5' ]); };
	if(_PartN == "HitGlass5") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#FF0000'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitGlass5"; !life_action_inUse && _degat > 0.5' ]); };
	if(_PartN == "HitGlass6") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#FF0000'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitGlass6"; !life_action_inUse && _degat > 0.5' ]); };
	if(_PartN == "HitGlass7") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#FF0000'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitGlass7"; !life_action_inUse && _degat > 0.5' ]); };
	if(_PartN == "HitGlass8") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#FF0000'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitGlass8"; !life_action_inUse && _degat > 0.5' ]); };
	if(_PartN == "HitGlass9") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#FF0000'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitGlass9"; !life_action_inUse && _degat > 0.5' ]); };
	if(_PartN == "HitGlass10") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#FF0000'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitGlass10"; !life_action_inUse && _degat > 0.5' ]); };
	if(_PartN == "HitGlass11") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#FF0000'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitGlass11"; !life_action_inUse && _degat > 0.5' ]); };
	if(_PartN == "HitGlass12") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#FF0000'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitGlass12"; !life_action_inUse && _degat > 0.5' ]); };
	if(_PartN == "HitGlass13") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#FF0000'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitGlass13"; !life_action_inUse && _degat > 0.5' ]); };
	if(_PartN == "HitGlass14") then { _veh_actions pushback (_vehicle addAction [ format["<t color='#FF0000'>Réparer %1</t>", _PartName], life_fnc_repairTruck, [_PartN,_PartName], 0, false, false, "", '_degat = _target getHitPointDamage "HitGlass14"; !life_action_inUse && _degat > 0.5' ]); };
};

[_vehicle,_veh_actions] spawn {
	private["_veh"];
	_veh = (_this select 0);
	sleep (5*60);
	if(isNil "_veh" || isNull _veh) exitwith {};
	{
		(_this select 0) removeAction _x;
	}foreach (_this select 1);
	// hint format ["REMOVE %1",_this];
};