/*
	File: fn_updateSound.sqf
	Author: Youri Litovski
	
	Description:
	Updates the sound on foot / car / air / boat.
	Variables sont entre 1 et 100
	Donc divisé par 100 pour le fadeSound qui va de 0 a 1
*/
switch (true) do
{
	case ((vehicle player) isKindOf "Man"): {1 fadeSound (youri_sound_foot/100)};
	case ((vehicle player) isKindOf "LandVehicle"): {1 fadeSound (youri_sound_car/100)};
	case ((vehicle player) isKindOf "Air"): {1 fadeSound (youri_sound_air/100)};
	case ((vehicle player) isKindOf "Sjip"): {1 fadeSound (youri_sound_boat/100)};
};
