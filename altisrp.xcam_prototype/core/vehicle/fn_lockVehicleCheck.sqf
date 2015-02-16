private["_veh","_locked","_door","_dist"];
_dist = 8;
if(vehicle player == player) then {
	_veh = cursorTarget;
} else {
	_veh = vehicle player;
};

// if(_veh isKindOf "House_F" && playerSide == civilian) then {
if(_veh isKindOf "House_F") then {
	if(_veh in life_vehicles && player distance _veh < _dist) then {
		_door = [_veh] call life_fnc_nearestDoor;
		if(_door == 0) exitWith {hint localize "STR_House_Door_NotNear"};
		_locked = _veh getVariable [format["bis_disabled_Door_%1",_door],0];
		if(_locked == 0) then {
			_veh setVariable[format["bis_disabled_Door_%1",_door],1,true];
			_veh animate [format["door_%1_rot",_door],0];
			systemChat localize "STR_House_Door_Lock";
			playSound "lock";
		} else {
			_veh setVariable[format["bis_disabled_Door_%1",_door],0,true];
			_veh animate [format["door_%1_rot",_door],1];
			systemChat localize "STR_House_Door_Unlock";	
			playSound "unlock";
		};
	};
} else {
	_locked = locked _veh;
	if((_veh isKindOf "Ship")) then { _dist = 20; };
	if(_veh in life_vehicles && player distance _veh < _dist) then {
		if(_locked == 2) then {
			if(local _veh) then {
				_veh lock 0;
			} else {
				[[_veh,0],"life_fnc_lockVehicle",_veh,false] spawn life_fnc_MP;
			};
			systemChat localize "STR_MISC_VehUnlock";
			[[_veh, "Beep",10],"life_fnc_playSound",true,false] spawn life_fnc_MP;                                        
		} else {
			if(local _veh) then {
				_veh lock 2;
			} else {
				[[_veh,2],"life_fnc_lockVehicle",_veh,false] spawn life_fnc_MP;
			};	
			systemChat localize "STR_MISC_VehLock";
			[[_veh, "BeepBeep",10],"life_fnc_playSound",true,false] spawn life_fnc_MP;
		};
		// _veh setVariable["idleTime",time,true];
		[] call life_fnc_getHLC;
		[[_veh,"idleTime",time],"TON_fnc_setObjVar",serverhc,false] spawn life_fnc_MP;
	};
};