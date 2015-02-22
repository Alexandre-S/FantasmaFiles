/*
	File: fn_keyHandler.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main key handler for event 'keyDown'
*/
if(!alive player) exitwith {};
private ["_handled","_shift","_alt","_code","_ctrl","_alt","_ctrlKey","_veh","_locked","_interactionKey","_mapKey","_interruptionKeys"];
_ctrl = _this select 0;
_code = _this select 1;
_shift = _this select 2;
_ctrlKey = _this select 3;
_alt = _this select 4;
_speed = speed cursorTarget;
_handled = false;

_interactionKey = if(count (actionKeys "User10") == 0) then {219} else {(actionKeys "User10") select 0};
_mapKey = actionKeys "ShowMap" select 0;
//hint str _code;
_interruptionKeys = [17,30,31,32]; //A,S,W,D

//Vault handling...
if((_code in (actionKeys "GetOver") || _code in (actionKeys "salute")) && {(player getVariable ["AGM_isCaptive",false])}) exitWith {
	true;
};

if(_code in (actionKeys "TacticalView")) exitWith {
	true;
};


if(life_action_inUse) exitWith {
	if(!life_interrupted && _code in _interruptionKeys) then {life_interrupted = true;};
	_handled;
};

//Hotfix for Interaction key not being able to be bound on some operation systems.
if(count (actionKeys "User10") != 0 && {(inputAction "User10" > 0)}) exitWith {
	//Interaction key (default is Left Windows, can be mapped via Controls -> Custom -> User Action 10)
	if(!life_action_inUse) then {
		[] spawn 
		{
			private["_handle"];
			_handle = [] spawn life_fnc_actionKeyHandler;
			waitUntil {scriptDone _handle};
			life_action_inUse = false;
		};
	};
	true;
};

if ((_code==47)||(_code==19)||(_code==20)||(_code==34)) then{
	_handled = ((playerSide != west) && ((player getVariable ["AGM_isCaptive",false]) OR (player getVariable ["AGM_isEscorting",false])));
};

if(_code in(actionKeys "PersonView"))then{
	if((vehicle player != player && {driver (vehicle player) == player}) || (dayz_combat == 0))then{
		_handled=false;
	}else{
		_handled=true;
	};
};

switch (_code) do
{
	//Space key for Jumping
	/*case 57:
	{
		if(isNil "jumpActionTime") then {jumpActionTime = 0;};
		if(_shift && {animationState player != "AovrPercMrunSrasWrflDf"} && {isTouchingGround player} && {stance player == "STAND"} && {speed player > 2} && {!life_is_arrested} && {(velocity player) select 2 < 2.5} && {time - jumpActionTime > 1.5}) then {
			jumpActionTime = time; //Update the time.
			[player,true] spawn life_fnc_jumpFnc; //Local execution
			[[player,false],"life_fnc_jumpFnc",nil,FALSE] call life_fnc_MP; //Global execution 
			_handled = true;
		};
	};*/
	
	//Map Key
	case _mapKey:
	{
		switch (playerSide) do 
		{
			case west: {if(!visibleMap) then {[] spawn life_fnc_copMarkers;}};
			case independent: {if(!visibleMap) then {[] spawn life_fnc_medicMarkers;}};
		};
	};
	
	//Holster / recall weapon.
	/*case 35:
	{
		if(_shift && !_ctrlKey && currentWeapon player != "") then {
			life_curWep_h = currentWeapon player;
			player action ["SwitchWeapon", player, player, 100];
			player switchcamera cameraView;
		};
		
		if(!_shift && _ctrlKey && !isNil "life_curWep_h" && {(life_curWep_h != "")}) then {
			if(life_curWep_h in [primaryWeapon player,secondaryWeapon player,handgunWeapon player]) then {
				player selectWeapon life_curWep_h;
			};
		};
	};*/
	
	//ALT F4
	/*case 62:
	{
		if(_alt) then {
			exitwith {
				[[0,format["ATTENTION INTERDIT ! - %1 A ALT F4 - ATTENTION INTERDIT !", profileName]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
				[[0,format["ATTENTION INTERDIT ! - %1 A ALT F4 - ATTENTION INTERDIT !", profileName]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
				[[0,format["ATTENTION INTERDIT ! - %1 A ALT F4 - ATTENTION INTERDIT !", profileName]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
				_handled=false;
			};
		};
	};*/
	
	// O, police gate opener
	case 24:
	{
		if (!_shift && !_alt && !_ctrlKey && (playerSide == west) && (vehicle player != player)) then {
			[] call life_fnc_copOpener;
		};
	};
	
	//Interaction key (default is Left Windows, can be mapped via Controls -> Custom -> User Action 10)
	case _interactionKey:
	{
		if(!life_action_inUse) then {
			[] spawn 
			{
				private["_handle"];
				_handle = [] spawn life_fnc_actionKeyHandler;
				waitUntil {scriptDone _handle};
				life_action_inUse = false;
			};
		};
	};
	
	//Restraining (Shift + R)
	/*case 19:
	{
		if(_shift) then {_handled = true;};
		switch (playerSide) do
        {
            case west:
            {
            if(_shift && !(player getVariable["restrained",false]) && !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && (side cursorTarget in [west,civilian,independent]) && alive cursorTarget && cursorTarget distance player < 3.5 && !(cursorTarget getVariable "Escorting") && !(cursorTarget getVariable "restrained") && !life_knockout&& speed cursorTarget < 1) then
                {
                    if([false,"handcuffs",1] call life_fnc_handleInv) then
                    {
                        [] call life_fnc_restrainAction;
                        //life_inv_handcuffs = life_inv_handcuffs - 1;
                        hint "Vous avez menotté la personne !";
                    }else{
                        systemChat localize "STR_NOTF_NoHandcuffs";
                    };
                };
            };
            default 
            {
            if(_shift && !(player getVariable["restrained",false]) && !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && (side cursorTarget in [west,civilian,independent]) && alive cursorTarget && cursorTarget distance player < 3.5 && !(cursorTarget getVariable "Escorting") && !(cursorTarget getVariable "restrained") && !life_knockout&& speed cursorTarget < 1) then
                {
                    if([false,"handcuffs",1] call life_fnc_handleInv) then
                    {
                        [] call life_fnc_restrainAction;
                        // life_inv_handcuffs = life_inv_handcuffs - 1;
                        hint "Vous avez menotté la personne !";
                    }else{
                        systemChat localize "STR_NOTF_NoHandcuffs";
                    };
                };
            };
        };
	};*/
	
	//Knock out, this is experimental and yeah...
	//case 34:
	/*case 46:
	{
		if(_shift) then {_handled = true;};
		if(_shift && !isNull cursorTarget && cursorTarget isKindOf "Man" && isPlayer cursorTarget && alive cursorTarget && cursorTarget distance player < 4 && speed cursorTarget < 1 && (animationState player) != "Incapacitated") then
		{
			if((animationState cursorTarget) != "Incapacitated" && (currentWeapon player == primaryWeapon player OR currentWeapon player == handgunWeapon player) && currentWeapon player != "" && !life_knockout && !(player getVariable["AGM_isCaptive",false]) && !life_istazed && !(cursorTarget getVariable ["AGM_isCaptive",false])) then
			{
				[cursorTarget] spawn life_fnc_knockoutAction;
				if("ItemWatch" in assignedItems cursorTarget OR "AGM_Altimeter" in assignedItems cursorTarget) then {
					if("ItemWatch" in assignedItems cursorTarget) then {
						cursorTarget removeweapon "ItemWatch";
						hint "La téléphone de la personne est désormais au sol.";
						_defenceplace1 = "Item_ItemWatch" createVehicle (player modelToWorld[0,0,0]);
					};
					if("AGM_Altimeter" in assignedItems cursorTarget) then {
						cursorTarget removeweapon "AGM_Altimeter";
						hint "La téléphone de la personne est désormais au sol.";
						_defenceplace1 = "Item_AGM_Altimeter" createVehicle (player modelToWorld[0,0,0]);
					};
				} else { 
					hint "La personne n'a pas de téléphone !";
				};
			};
		};
	};*/
	
	//surrender... shift + g
	/*case 34:
	{
		if(_shift) then {_handled = true;};
		if (_shift) then
		{
			if (vehicle player == player && !(player getVariable ["restrained", false]) && (animationState player) != "Incapacitated" && !life_istazed) then
			{
				if (player getVariable ["surrender", false]) then
				{
					player setVariable ["surrender", false, true];
				} else
				{
					[] spawn life_fnc_surrender;
				};
			};
		};
	};*/

	//T Key (Trunk)
	/*case 20:
	{
		if(!_alt && !_ctrlKey) then
		{
			if(vehicle player != player && alive vehicle player) then
			{
				if(playerSide == west && (player distance (vehicle player)) < 7) then {
					[vehicle player] call life_fnc_openInventory;
				} else {
					if((vehicle player) in life_vehicles && (player distance (vehicle player)) < 7) then
					{
						[vehicle player] call life_fnc_openInventory;
					};
				};
			}
			else
			{
				if(playerSide == west && player distance cursorTarget < 7 && (vehicle player) == player) then {
					[cursorTarget] call life_fnc_openInventory;
				} else {
					if((cursorTarget isKindOf "LandVehicle" OR cursorTarget isKindOf "Air" OR cursorTarget isKindOf "Ship" OR cursorTarget isKindOf "House_F") && player distance cursorTarget < 7 && vehicle player == player && alive cursorTarget) then
					{
						if(cursorTarget in life_vehicles OR {!(cursorTarget getVariable ["locked",true])}) then
						{
							[cursorTarget] call life_fnc_openInventory;
						};
					};
				};
			};
		};
	};*/
	//L Key?
	case 38: 
	{
		//If cop run checks for turning lights on.
		if(_shift && (playerSide in [west,independent] OR (player getVariable["life_dep",false]))) then {
			if(vehicle player != player && (typeOf vehicle player) in ["C_Offroad_01_F","B_MRAP_01_F","C_SUV_01_F","B_MRAP_01_hmg_F"]) then {
				if(!isNil {vehicle player getVariable "lights"}) then {
					if(playerSide == west) then {
						[vehicle player] call life_fnc_sirenLights;
					} else {
						[vehicle player] call life_fnc_medicSirenLights;
					};
					_handled = true;
				};
			};
		};
		
		// if(!_alt && !_ctrlKey) then { [] call life_fnc_radar; };
	};
	//Y Player Menu
	/*case 21:
	{
		if(!_alt && !_ctrlKey && !dialog) then
		{
			[] call life_fnc_p_openMenu;
		};
	};*/
	
	//F Key
	/*case 33:
	{
		if(_shift) then {_handled = true;};
		if(_shift && playerSide in [west,independent] && vehicle player != player && !life_siren_active && ((driver vehicle player) == player)) then
		{
			[] spawn
			{
				if(playerSide == west) then {
					life_siren_active = true;
					sleep 4.7;
					life_siren_active = false;
				} else {
					life_siren_active = true;
					sleep 5.4;
					life_siren_active = false;
				};
			};
			_veh = vehicle player;
			if(isNil {_veh getVariable "siren"}) then {_veh setVariable["siren",false,true];};
			if((_veh getVariable "siren")) then
			{
				titleText [localize "STR_MISC_SirensOFF","PLAIN"];
				_veh setVariable["siren",false,true];
			}
				else
			{
				titleText [localize "STR_MISC_SirensON","PLAIN"];
				_veh setVariable["siren",true,true];
				if(playerSide == west) then {
					[[_veh],"life_fnc_copSiren",nil,true] spawn life_fnc_MP;
				} else {
					//I do not have a custom sound for this and I really don't want to go digging for one, when you have a sound uncomment this and change medicSiren.sqf in the medical folder.
					[[_veh],"life_fnc_medicSiren",nil,true] spawn life_fnc_MP;
				};
			};
		};
	};*/
	//U Key
	/*case 22:
	{
		if(!_alt && !_ctrlKey) then {
			if(vehicle player == player) then {
				_veh = cursorTarget;
			} else {
				_veh = vehicle player;
			};
			
			if(_veh isKindOf "House_F" && playerSide == civilian) then {
				if(_veh in life_vehicles && player distance _veh < 8) then {
					_door = [_veh] call life_fnc_nearestDoor;
					if(_door == 0) exitWith {hint localize "STR_House_Door_NotNear"};
					_locked = _veh getVariable [format["bis_disabled_Door_%1",_door],0];
					if(_locked == 0) then {
						_veh setVariable[format["bis_disabled_Door_%1",_door],1,true];
						_veh animate [format["door_%1_rot",_door],0];
						systemChat localize "STR_House_Door_Lock";
					} else {
						_veh setVariable[format["bis_disabled_Door_%1",_door],0,true];
						_veh animate [format["door_%1_rot",_door],1];
						systemChat localize "STR_House_Door_Unlock";
					};
				};
			} else {
				_locked = locked _veh;
				if(_veh in life_vehicles && player distance _veh < 8) then {
					if(_locked == 2) then {
						if(local _veh) then {
							_veh lock 0;
						} else {
							[[_veh,0],"life_fnc_lockVehicle",_veh,false] spawn life_fnc_MP;
						};
						systemChat localize "STR_MISC_VehUnlock";
						[[_veh],"life_fnc_UnLockCarSound",nil,true] spawn life_fnc_MP;
					} else {
						if(local _veh) then {
							_veh lock 2;
						} else {
							[[_veh,2],"life_fnc_lockVehicle",_veh,false] spawn life_fnc_MP;
						};	
						systemChat localize "STR_MISC_VehLock";
						[[_veh],"life_fnc_LockCarSound",nil,true] spawn life_fnc_MP;
					};
				};
			};
		};
	};*/
	case 31:
	{
		if ((!life_truckreverse_active) and (vehicle player != player && (typeOf vehicle player) in life_truck_types)) then {
			_veh = [vehicle player,0] call BIS_fnc_param;			
			if ((speed _veh) < 0) then {
				life_truckreverse_active = true;
				[_veh] spawn life_fnc_reverseTruckSound;
			};
		};
	};
	// Shift B : BOUM BOUM
	/*case 48:
	{
		if(_shift && vest player == "V_HarnessOGL_brn" && alive player && playerSide == civilian && !life_istazed && !(player getVariable "restrained") && !(player getVariable "Escorting") && !(player getVariable "transporting")) then {
			[] call life_fnc_suicideBomb;
		};
	};*/
	//6 Nitro
	case 7:
	{
		if(!_alt && !_ctrlKey) then {
			[] spawn life_fnc_activateNitro;
		};
	};
};

_handled;