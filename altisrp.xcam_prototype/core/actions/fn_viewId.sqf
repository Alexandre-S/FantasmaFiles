/*
	File: fn_viewId.sqf
	Author: Youri Litovski
	
	Description:
	View someone ID card
*/
private["_msg"];

_msg = _this select 1;

hintSilent parseText _msg;