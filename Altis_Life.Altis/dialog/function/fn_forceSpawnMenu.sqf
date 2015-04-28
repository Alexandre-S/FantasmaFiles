/*
	File: fn_forceSpawnMenu.sqf
	Author: havena
	
	Description:
	force spawn abattre.
*/
closeDialog 0;
life_respawned = true;
spawnmenuon = 1;
[] call life_fnc_spawnMenu;