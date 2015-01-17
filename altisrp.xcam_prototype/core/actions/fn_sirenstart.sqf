/*
	File: fn_copSirenStart.sqf
	Author: Havena
	
	Description:
	Starts the cop siren
*/
// if(_shift && playerSide in [west,independent] && vehicle player != player && !life_siren_active && ((driver vehicle player) == player)) then
// {
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
// };