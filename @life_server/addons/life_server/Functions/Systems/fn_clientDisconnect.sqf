/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	When a client disconnects this will remove their corpse and
	clean up their storage boxes in their house.
*/
private["_unit","_id","_uid","_name","_containers","_loops"];
_unit = _this select 0;
_id = _this select 1;
_uid = _this select 2;
_name = _this select 3;

_loops = 0;
while {true} do {
	if(isNull _unit) exitWith {};
	if(_loops >= 25) exitWith {};
	if(!alive _unit) exitWith {
		[_unit,_name] spawn {
			_unit = _this select 0;
			_name = _this select 1;
			if(!(_unit getVariable ["Revive", true])) then {
				[[0,format["ATTENTION INTERDIT ! - %1 A DECONNECTE PENDANT UN COMA - ATTENTION INTERDIT !", _name]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
				[[0,format["ATTENTION INTERDIT ! - %1 A DECONNECTE PENDANT UN COMA - ATTENTION INTERDIT !", _name]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
				sleep 600;
			};
			_containers = nearestObjects[_client,["WeaponHolderSimulated"],5];
			if(count _containers > 0) then {
				{deleteVehicle _x;} foreach _containers; //Delete the containers.
			};
			if (!isNull _unit) then {deleteVehicle _unit;}; //Get rid of the corpse.
		};
	};
	
	_loops = _loops + 1;
	sleep 1;
};

/*
waitUntil{sleep 0.1;count(allDeadMen) > 0};
{
	// diag_log format ["DISCO0 %1",_x getVariable["steam64ID",""]];
	_pid = _x getVariable["steam64id",getPlayerUID _x];

	if(_uid == _pid OR _pid == "" OR owner _x < 3) then {
		// diag_log format ["DISCO1 %1",_x];
		
		[_x,_name] spawn {
			_x = _this select 0;
			_name = _this select 1;
			_pos = getPosATL _x;
			if(!(_unit getVariable ["Revive", true])) then {
				[[0,format["ATTENTION INTERDIT ! - %1 A DECONNECTE PENDANT UN COMA - ATTENTION INTERDIT !", _name]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
				[[0,format["ATTENTION INTERDIT ! - %1 A DECONNECTE PENDANT UN COMA - ATTENTION INTERDIT !", _name]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
				sleep 600;
			};
			_containers = nearestObjects[_pos,["WeaponHolderSimulated"],5]; //Fetch list of containers (Simulated = weapons)
			{deleteVehicle _x;} foreach _containers; //Delete the containers.
			if (!isNull _x) then {deleteVehicle _x;}; //Get rid of the corpse.
		};
	};
} foreach allDeadMen;
*/
_uid spawn TON_fnc_houseCleanup;