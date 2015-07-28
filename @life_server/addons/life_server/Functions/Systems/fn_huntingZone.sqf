/*
	File: fn_huntingZone.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Spawns up animals local to the client.
*/

life_animals_spawned = true;
// life_animals_spawned_time = -500;
life_animals_array = [];
goatgroup = createGroup Civilian; 

[] spawn
{
	private ["_alive","_total","_type","_animal","_pos","_pos2","_animals","_z"];
	//_animals = ["Cock_random_F","Goat_random_F","Goat_random_F","Goat_random_F","Hen_random_F","Sheep_random_F","Sheep_random_F","Alsatian_Random_F"]; //Array of animals to spawn
	_animals = ["Cock_random_F","Cock_random_F","Cock_random_F","Cock_random_F","Cock_random_F","Goat_random_F","Goat_random_F","Goat_random_F","Goat_random_F","Hen_random_F","Hen_random_F","Hen_random_F","Hen_random_F","Hen_random_F","Hen_random_F","Sheep_random_F","Sheep_random_F","Sheep_random_F","Sheep_random_F","Alsatian_Random_F","Fin_random_F"]; //Array of animals to spawn
	_pos = getMarkerPos "hunting";
	while {life_animals_spawned} do
	{
		/*_alive = 0;
		{
			if (!isNull _x) then
			{
				if (alive _x) then
				{
					_alive = _alive + 1;
				};
			};
		} forEach life_animals_array;*/
		// _total = 200 - _alive;
		// if (time - life_animals_spawned_time > 60) then
		// {
			_total = 80 - count life_animals_array;
			for "_i" from 1 to _total do
			{
				_type = _animals call BIS_fnc_selectRandom;
				// _animal = _type createVehicleLocal ([_pos, [1,500] call BIS_fnc_randomInt, [0,359] call BIS_fnc_randomInt] call BIS_fnc_relPos);
				// _animal = goatgroup createUnit [_type, ([_pos, [1,500] call BIS_fnc_randomInt, [0,359] call BIS_fnc_randomInt] call BIS_fnc_relPos),[],0,"NONE"];
				// _animal = (createGroup east) createUnit [_type, ([_pos, [1,50] call BIS_fnc_randomInt, [0,50] call BIS_fnc_randomInt] call BIS_fnc_relPos),[],0,"NONE"];
				_animal = createAgent [_type, _pos,[],1100,"NONE"];
				_animal setdir (random 360);
				_animal switchmove "walkf";
				//_animal setVariable ["zbe_cacheDisabled",true];
				// _animal enableSimulation false;
				// diag_log format["--- CREATE ANIMAL --- %1 - %2 - %3",_type,_animal,position _animal];

				/*_pos = getPos _animal;
				_z = switch (_type) do
				{
					case "Hen_random_F": { 0.3 };
					case "Cock_random_F": { 0.3 };
					case "Alsatian_Random_F": { 0.6 };
					//case "Fin_random_F": { 0.6 };
					case "Goat_random_F": { 0.7 };
					case "Sheep_random_F": { 0.75 };
				};
				_pos set [2, _z];
				_animal setPos _pos;
				_animal setVectorUp surfaceNormal position _animal;*/
				_animal addEventHandler ["handleDamage", {
					_a = _this select 0;
					_d = _this select 2;
					// _p = getPos _a;
					if (_d >= 1) then {
						_a setDamage 1;
						// _v = vectorUp _a;
						// _v set [2, (_v select 2) - 1];
						// _a setVectorUp _v;
						// _p set [2, 0.1];
						// _a setPos _p;
						[_a] spawn {
							_a = _this select 0;
							sleep 300;
							life_animals_array = life_animals_array - [_a];
							if(!isNull _a) then {
								// deleteVehicle _a;
								[[_a],"life_fnc_delveh",true,false] spawn life_fnc_MP;
							};
						};
					};
				}];
				life_animals_array set[count life_animals_array,_animal];
				sleep 1;
			};
			// life_animals_spawned_time = time;
		// };
		sleep 60;
	};
};

/*[] spawn {
	private ["_pos","_cb"];
	_pos = getMarkerPos "hunting";
	while {life_animals_spawned} do
	{
		_cb = 0;
		if({(_x distance _pos) < 700} count playableUnits > 0) then {
			{if(!simulationEnabled _x) then {_cb = _cb +1; _x enableSimulationGlobal true; };} foreach life_animals_array;
			if(_cb>0) then {
				diag_log format["--- DEBUG ANIMAL INFO --- SIMULATION TRUE : %1",_cb];
			};
		} else {
			{if(simulationEnabled _x) then {_cb = _cb +1; _x enableSimulationGlobal false;};} foreach life_animals_array;
			if(_cb>0) then {
				diag_log format["--- DEBUG ANIMAL INFO --- SIMULATION FALSE : %1",_cb];
			};
		};
		sleep 30;
	};
};*/

[] spawn
{
	private ["_pos"];
	_pos = getMarkerPos "hunting";
	while {life_animals_spawned} do
	{
		sleep 60*5;
		{
			if((_x distance _pos) > 1200) then
			{
				// deleteVehicle _x;
				[[_x],"life_fnc_delveh",true,false] spawn life_fnc_MP;
				life_animals_array = life_animals_array - [_x];
			};
		} foreach life_animals_array;
		diag_log format["--- DEBUG ANIMAL INFO --- total : %1",count life_animals_array];
	};
};