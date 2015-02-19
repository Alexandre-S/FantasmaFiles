/*
	File: fn_requestMedic.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	N/A
*/
private["_medicsOnline","_name"];
_medicsOnline = {_x != player && {side _x == independent} && {alive _x}} count playableUnits > 0; //Check if medics (indep) are in the room.
_name = "Anonyme";
// +5 min
maxTimeRespawn = maxTimeRespawn + 60*3;

if(_medicsOnline) then {
	//There is medics let's send them the request.
	[[life_corpse,_name],"life_fnc_medicRequest",independent,FALSE] spawn life_fnc_MP;
} else {
	//No medics were online, send it to the police.
	// [[life_corpse,_name],"life_fnc_copMedicRequest",west,FALSE] spawn life_fnc_MP;
	[[life_corpse,_name],"life_fnc_medicRequest",west,FALSE] spawn life_fnc_MP;
};

//Create a thread to monitor duration since last request (prevent spammage).
[] spawn 
{
	((findDisplay 7300) displayCtrl 7303) ctrlEnable false;
	sleep (2 * 60);
	((findDisplay 7300) displayCtrl 7303) ctrlEnable true;
};