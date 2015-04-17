private["_unit","_near","_nlist","_sendrep"];

_unit = [_this,0,[],[[],""]] call BIS_fnc_param;

if(count _unit == 0) exitWith {diag_log format ["REPMAP DEBUG === POS NULL %1", _unit];};


_near = nearestObjects [(_this select 0), [], 50];
_nlist = [];
_sendrep = true;
{
	if(isplayer _x OR _x isKindOf "Car" OR _x isKindOf "Ship" OR _x isKindOf "Air") exitwith { _sendrep = false; };
	if ((damage _x) > 0) then {
			_nlist pushback _x;
	};
} forEach _near;
if(_sendrep && {count _nlist != 0}) then {
	diag_log format ["REPMAP DEBUG === %1", count _nlist];
	[[_nlist],"TON_fnc_rmdam",false,false] spawn life_fnc_MP;
} else { diag_log format ["REPMAP DEBUG === NO %1", _unit]; } 

//_x setdamage 0;
