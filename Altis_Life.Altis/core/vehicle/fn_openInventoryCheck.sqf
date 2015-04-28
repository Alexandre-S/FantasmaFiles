private["_dist","_veh"];
_dist = 7;
if(vehicle player == player) then {
	_veh = cursorTarget;
} else {
	_veh = vehicle player;
};
if(isNull _veh OR !(_veh isKindOf "LandVehicle" OR _veh isKindOf "Air" OR _veh isKindOf "Ship" OR _veh isKindOf "House_F")) exitWith {};
if(!alive _veh) exitwith {};
if((_veh isKindOf "Ship")) then { _dist = 20; };
if(player distance _veh > _dist) exitwith {};


if(_veh != player) then {
	if(playerSide == west) then {
		[_veh] call life_fnc_openInventory;
	} else {
		if(_veh in life_vehicles || {locked _veh == 0}) then {
			[_veh] call life_fnc_openInventory;
		};
	};
} else {
	if(playerSide == west) then {
		[_veh] call life_fnc_openInventory;
	} else {
		if(_veh isKindOf "House_F") then {
			if(_veh in life_vehicles OR {!(_veh getVariable ["locked",true])}) then	{
				[_veh] call life_fnc_openInventory;
			};
		} else {
			// if (_veh isKindOf "LandVehicle" OR _veh isKindOf "Air" OR _veh isKindOf "Ship") then {
				if(_veh in life_vehicles OR {locked _veh == 0}) then {
					[_veh] call life_fnc_openInventory;
				};
			// };
		};
	};
};