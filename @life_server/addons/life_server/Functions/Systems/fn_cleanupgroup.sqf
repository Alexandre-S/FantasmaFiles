/*
	File: fn_cleanupgroup.sqf
	Author: havena
	
	Description:
	Server-side cleanup group.
*/
while {true} do
{
	sleep (60);
	// hint diag_log["=======%1",(count allGroups)];
	{if ((units _x)isEqualTo[])then{
		// diag_log format["-- %1 - %2",_x,units _x];
		deleteGroup _x
	}}forEach allGroups;
	
	// hint diag_log["=======%1",(count allGroups)];
};