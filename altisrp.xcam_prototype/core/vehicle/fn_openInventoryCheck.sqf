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