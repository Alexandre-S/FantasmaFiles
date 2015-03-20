_t = cursorTarget;

[] spawn {
	_obj = vehicle havena_t;
	_obj setDamage 0;
	hint format["%1",_obj];
	_obj hideobject true;
	_obj enablesimulation false;
	sleep 10;
	_obj enablesimulation true;
	sleep 2;
	_obj hideobject false;
	player reveal _obj;
}; 
==========



_list = _p nearEntities ["Man", 1000];
{
	if(isplayer _x) then {
		_listtotal = _listtotal - [_x];

		_x enablesimulation true;
		_x hideobject false;
	};
} forEach _list;



=======
[] spawn { sleep 1; hint format["%1 - %2",animationState player,simulationEnabled player];};
	_x switchMove (animationState player);

==========

_t1 = diag_tickTime;
{
	if(isplayer _x) then {
		_x enablesimulation true;
		_x hideobject false;
	};
} forEach allUnits;

_totalcar = [5000, 5000] nearEntities [["LandVehicle", "Air", "Ship"], 10000];
{
	_x enablesimulation true;
	_x hideobject false;
} forEach _totalcar;
		
hint str (diag_tickTime - _t1);
=============

xcache = [];
_t1 = diag_tickTime;
_p = player;
_distance = 1000;
_landall = [];
{
	if((_x isKindOF "LandVehicle") || (_x isKindOf "Air") || (_x isKindOf "Ship")) then {
		_landall pushback _x;
	};
} foreach vehicles;
_all = allUnits + _landall + allDead;
_allreal = _all - (agents - [teamMemberNull]);

{
	if(isNull _x) then {
		xcache = xcache - [_x];
	};
} forEach xcache;

{
	if(_p distance _x > _distance) then {
		if!(_x in xcache) then {
			xcache pushBack _x;
			_x hideobject true;
			_x enablesimulation false;
		};
	} else {
		if(_x in xcache) then {
			_x enablesimulation true;
			_p reveal _x;
			_x hideobject false;
			xcache = xcache - [_x];
		};
	};
} forEach _allreal;


hint format ["%1 - %2 - unit %3 - veh %4 - vehicles %5 - dead %6 || %7",count _allreal,count xcache,count allUnits, count _landall, count vehicles, count alldead,(diag_tickTime - _t1)];

============

havena_test = true;
[] spawn {
	while{havena_test} do {
		_t1 = diag_tickTime;
		_p = player;
		_distance = 1000;
		zbe_players = (switchableUnits + playableUnits);
		_totalcar = [5000, 5000] nearEntities [["LandVehicle", "Air", "Ship"], 10000];

		_listtotal = zbe_players;
		_removecar = _totalcar;

		_list = position _p nearObjects ["Man", _distance];
		{
			if(!isagent _x) then {
				_listtotal = _listtotal - [_x];

				_x enablesimulation true;
				_x hideobject false;
			};
		} forEach _list;
		_listcar = _p nearEntities [["LandVehicle", "Air", "Ship"], _distance];
		{
			_removecar = _removecar - [_x]; 
			
			_x enablesimulation true;
			_x hideobject false;
			
			{
				_listtotal = _listtotal - [_x];

				_x enablesimulation true;
				_x hideobject false;
				
			} forEach (crew _x);
			
		} forEach _listcar;


		{
			_x hideobject true;
			_x enablesimulation false;
		} forEach _listtotal;

		{
			_x hideobject true;
			_x enablesimulation false;
		} forEach _removecar;

		hint format ["%1 - %2 || %3 - %4 || %5 ",count zbe_players, count _listtotal,count _totalcar,count _removecar,(diag_tickTime - _t1)];
		sleep 1;
	};
};