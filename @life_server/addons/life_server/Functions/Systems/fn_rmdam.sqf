private["_list"];

_list = [_this,0,[],[[],""]] call BIS_fnc_param;

if(count _list == 0) exitWith {diag_log format ["SETDAM === LIST NULL %1", _list];};

{
	_x setdamage 0;
} foreach _list;