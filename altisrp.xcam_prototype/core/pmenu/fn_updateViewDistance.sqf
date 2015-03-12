/*
	File: fn_updateViewDistance.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Updates the view distance dependant on whether the player is on foot, a car or an aircraft.
*/
switch (true) do
{
	case ((vehicle player) isKindOf "Man"): {havena_minview = tawvd_foot; havena_maxview=tawvd_foot+2000;};
	case ((vehicle player) isKindOf "LandVehicle"): {havena_minview = tawvd_car; havena_maxview=tawvd_car+2000;};
	case ((vehicle player) isKindOf "Air"): {havena_minview = tawvd_air; havena_maxview=tawvd_air+2000;};
};
if(!life_autofps) then {
	switch (true) do
	{
		case ((vehicle player) isKindOf "Man"): {setViewDistance tawvd_foot};
		case ((vehicle player) isKindOf "LandVehicle"): {setViewDistance tawvd_car};
		case ((vehicle player) isKindOf "Air"): {setViewDistance tawvd_air};
	};
};