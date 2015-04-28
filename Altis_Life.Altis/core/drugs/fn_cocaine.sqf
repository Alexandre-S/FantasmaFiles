/*
	File: fn_cocaine.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Say hello to my little friend!
*/

if (!([false,"cocainep",1] call life_fnc_handleInv)) exitWith {};

life_drug_level = life_drug_level + 0.15;
if (life_drug_level > 1) then { life_drug_level = 1; };

_dice = random(1);
if(_dice <= 0.15) then
{
	dependance = dependance + 0.15;
};

[] spawn
{
	life_cocaine_effect = time;
	hint "Vous vous sentez inarrêtable !";
	player setFatigue 0;
	player enableFatigue false;
	waitUntil {sleep 0.1; !alive player OR ((time - life_cocaine_effect) > (4 * 60))};
	life_cocaine_effect = 0;
	player enableFatigue true;
};

[] call life_fnc_hudUpdate;
["cocainep"] call life_fnc_drugUsed;