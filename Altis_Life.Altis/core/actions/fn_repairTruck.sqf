/*
	File: fn_repairTruck.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main functionality for toolkits, to be revised in later version.
*/
private["_veh","_upp","_ui","_progress","_pgText","_cP","_displayName"];
_veh = cursorTarget;
life_interrupted = false;
if(isNull _veh) exitwith {};
if((_veh isKindOf "LandVehicle") OR (_veh isKindOf "Ship") OR (_veh isKindOf "Air")) then
{
	if("ToolKit" in (items player)) then
	{
		life_action_inUse = true;
		_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");
		_upp = format[localize "STR_NOTF_Repairing",_displayName];
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
			waitUntil {isTouchingGround _this};
			waitUntil {!([_this] call AGM_Core_fnc_inTransitionAnim) or !(alive _this)};
			if !(alive _this) exitWith {};
			[_this, "InBaseMoves_repairVehicleKnl", 1, True] call AGM_Core_fnc_doAnimation;
			sleep 0.15;
			if (animationState _this != "InBaseMoves_repairVehicleKnl") then {
				[_this, "InBaseMoves_repairVehicleKnl", 2, True] call AGM_Core_fnc_doAnimation;
			};
		};

		playSound "action_repair";
		while{true} do
		{
			if(animationState player != "InBaseMoves_repairVehicleKnl") then {
				player spawn _fnc_playAnim;
				// [[player,"InBaseMoves_repairVehicleKnl"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
				// player playMoveNow "InBaseMoves_repairVehicleKnl";
			};
			sleep 0.27;
			_cP = _cP + 0.01;
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
		if((playerSide != west) && !(player getVariable["life_dep",false])) then { player removeItem "ToolKit"; };
		_veh setDamage 0;
		titleText[localize "STR_NOTF_RepairedVehicle","PLAIN"];
	};
};