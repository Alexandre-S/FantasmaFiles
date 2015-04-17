#include <macro.h>
/*
	File: fn_showId.sqf
	Author: Youri Litovski
	
	Description:
	Show the ID card to someone
*/
private["_target", "_lvl"];

_target = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_lvl = 0;

if(isNull _target) exitwith {};
if( !(_target isKindOf "Man") ) exitwith {};
if( !(alive _target) ) exitwith {};

switch (playerSide) do
{
	case west: 
	{
		_lvl = __GETC__(life_coplevel);
	};
	case independent: 
	{
		_lvl = __GETC__(life_medicLevel);
	};
};

[[player,_lvl],"life_fnc_viewId",_target,false] spawn life_fnc_MP;