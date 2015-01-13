/*
	File: fn_spawnVehicleActive.sqf
	Author: Havena
	
	Description:
	Sends the query request to the database, if an array is returned then it creates
	the vehicle if it's not in use or dead.
*/
private["_vid","_sp","_pid","_query","_queryResult","_count","_sql","_vehicle","_nearVehicles","_name","_side","_plate","_color","_classname","_inv","_fuel","_insure","_dir","_t1","_realside"];

waitUntil{!DB_Async_Active};
_count = (["SELECT COUNT(*) FROM vehicles WHERE active='1' AND alive='1'",2] call DB_fnc_asyncCall) select 0;

for [{_x=0},{_x<=_count},{_x=_x+10}] do {
	waitUntil{!DB_Async_Active};
	// _query = format["SELECT id,pid,pos,name,side,plate,color,classname,inventory,fuel,insure,dir FROM vehicles WHERE active='1' AND alive='1' LIMIT %1,10",_x];
	_query = format["SELECT vehicles.id, vehicles.pid, vehicles.pos, players.name, vehicles.side, vehicles.plate, vehicles.color, vehicles.classname, vehicles.inventory, vehicles.fuel, vehicles.insure, vehicles.dir FROM vehicles, players WHERE vehicles.pid = players.playerid AND vehicles.active='1' AND vehicles.alive='1' LIMIT %1,10",_x];

	_queryResult = [_query,2,true] call DB_fnc_asyncCall;
	if(count _queryResult == 0) exitWith {};
	{
		if(server_debug) then { _t1 = diag_tickTime; };

		_vid = _x select 0;
		_pid = _x select 1;
		_sp = (call compile format["%1", _x select 2]);
		_name = _x select 3;
		_side = _x select 4;
		_plate = _x select 5;
		_color = _x select 6;
		_classname = _x select 7;
		_inv = _x select 8;
		_fuel = _x select 9;
		// _insure = ([_x select 10,1] call DB_fnc_bool);
		_insure = _x select 10;
		_dir = _x select 11;



		diag_log format["[fn_spawnVehicleActive][%1] pid = %2 sp = %3 name = %4 side = %5 plate = %6 color = %7 classname = %8 fuel = %9", _vid, _pid, _sp, _name, _side, _plate, _color, _classname, _fuel];

		/*_sp2 = _sp findEmptyPosition [0,100,_classname];
		if(count _sp2 != 0) then {
			_sp = _sp2;
		};*/

		//_vInfo = [_vid,_pid] call DB_fnc_queryVehicle;

		//if(isNil "_vInfo") exitWith {serv_sv_use = serv_sv_use - [_vid];};
		//if(count _vInfo == 0) exitWith {serv_sv_use = serv_sv_use - [_vid];};

		//if((_vInfo select 5) == "False") exitWith
		//{
		//	serv_sv_use = serv_sv_use - [_vid];
			//[[1,format["Sorry but %1 was classified as a destroyed vehicle and was sent to the scrap yard.",_vInfo select 2]],"life_fnc_broadcast",_unit,false] spawn life_fnc_MP;
		//};

		//if((_vInfo select 6) == "False") exitWith
		//{
		//	serv_sv_use = serv_sv_use - [_vid];
			//[[1,format["Sorry but %1 is already active somewhere in the map and cannot be spawned.",_vInfo select 2]],"life_fnc_broadcast",_unit,false] spawn life_fnc_MP;
		//};

		//_nearVehicles = nearestObjects[_sp,["Car","Air","Ship"],10];
		//if(count _nearVehicles > 0) exitWith
		//{
			//serv_sv_use = serv_sv_use - [_vid];
			//[[1,"There is a vehicle on the spawn point."],"life_fnc_broadcast",_unit,false] spawn life_fnc_MP;
		//};

		//_query = format["UPDATE vehicles SET active='1' WHERE pid='%1' AND id='%2'",_pid,_vid];
		//_sql = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['%2', '%1']", _query,(call LIFE_SCHEMA_NAME)];

		_vehicle = createVehicle [_classname,[0,0,999],[], 0, "NONE"];
		waitUntil {!isNil "_vehicle"}; //Wait?
		_vehicle allowDamage false;

		// _vehicle = _classname createVehicle _sp;
		// _vehicle addEventHandler ["handleDamage", { false }];
		_vehicle setDir _dir;
		_vehicle setVectorUp (surfaceNormal _sp);
		_vehicle setPosATL _sp;

		
		sleep 0.01;
		_vehicle setVariable["idleTime",time,true];
		sleep 0.01;
		_vehicle setVariable["lootModified",false,true];
		sleep 0.01;
		_vehicle setVariable ["R3F_LOG_disabled", false,true];
		sleep 0.01;
		if((_side) == "cop") then
		{
			_vehicle setVariable ["tf_side", "west", true];	
		}else{
			_vehicle setVariable ["tf_side", "civilian", true];
		};
		sleep 0.01;
		_vehicle setVariable ["tf_hasRadio", true, true];
		sleep 0.01;
		_vehicle setVariable ["tf_range", 50000, true];
		sleep 0.01;
		_vehicle setVariable["vehicle_info_owners",[[_pid,_name]],true];
		sleep 0.01;
		//_vehicle setVariable["spawned",false,true];
		_vehicle setVariable["dbInfo",[(_pid),(call compile format["%1", _plate]),_insure],true];
		sleep 0.01;
		_vehicle setVariable["lastPos",[]];
		sleep 0.01;
		//inv
		_inv = [_inv] call DB_fnc_mresToArray;
		if(typeName _inv == "STRING") then {_inv = call compile format["%1", _inv];};
		_vehicle setVariable["Trunk",_inv,true];
		sleep 0.01;
		/*if!(_classname in ["B_G_Offroad_01_armed_F","I_Heli_Transport_02_F_RP","B_Heli_Light_01_F_RP","O_Heli_Light_02_unarmed_F_RP"]) then
		{
			_vehicle setVariable["Assur",_assur,true];
		}
		else
		{
			_vehicle setVariable["Assur",false,true];
		};
		sleep 0.01;*/

		//_vehicle addEventHandler["Killed",{_this spawn STS_fnc_vehicleDead;}];
		_vehicle addEventHandler["GetOut", {_this call life_fnc_vehicleExit;}];
		[_vehicle] call life_fnc_clearVehicleAmmo;
		_vehicle lock 2;

		_vehicle setFuel (parseNumber _fuel);
		//Send keys over the network.
		//[[_vehicle],"STS_fnc_addVehicle2Chain",_unit,false] spawn life_fnc_MP;
		if(_side == "cop") then { _realside = west; };
		if(_side == "civ") then { _realside = civilian; };
		if(_side == "med") then { _realside = independent; };
		[_pid,_realside,_vehicle,1] call TON_fnc_keyManagement;
		//[[_pid,_realside,_vehicle,1],"TON_fnc_keyManagement",false,false] spawn life_fnc_MP;

		_vehicle disableTIEquipment true; //No Thermals.. They're cheap but addictive.

		
		[_vehicle,_color,_classname,_side] spawn
		{
			private["_vehicle","_color","_classname","_side"];
			if(_classname in life_ver_random) then { sleep 5; };

			_vehicle = _this select 0;
			_color = _this select 1;
			_classname = _this select 2;
			_side = _this select 3;
			
			//Reskin the vehicle 
			// [_vehicle,(call compile format["%1",_color])] spawn life_fnc_colorVehicle;
			[[_vehicle,(call compile format["%1",_color])],"life_fnc_colorVehicle",true,false] spawn life_fnc_MP;
			
			//Sets of animations
			/*if(_classname == "B_MRAP_01_hmg_F") then
			{
			  _vehicle disableTIEquipment true;
			};*/
			if(_classname == "C_Van_01_fuel_F") then
			{
			 _vehicle setFuelCargo 0;
			};
			/*if((_color) == "10" && (_classname) == "C_Offroad_01_F") then
			{
				[_vehicle,"service_truck",true] spawn life_fnc_vehicleAnimate;
			};*/

			if((_side) == "med" && (_classname) == "C_Offroad_01_F") then
			{
				if(_color == 10) then {
					[_vehicle,"service_truck",true] spawn life_fnc_vehicleAnimate;
					_vehicle setVariable ["service_truck", true, true];
				}else{
					[_vehicle,"med_offroad",true] spawn life_fnc_vehicleAnimate;
				};
			};
			if((_side) == "civ" && (_classname) == "LandRover_ACR") then
			{
				[_vehicle,"landrover_nocov",true] spawn life_fnc_vehicleAnimate;
			};

			/*if((_color) == "11" && (_classname) == "C_Offroad_01_F") then
			{
				[_vehicle,"service_truck",true] spawn life_fnc_vehicleAnimate; // vigil
			};*/

			if((_side) == "civ" && (_classname) == "B_Heli_Light_01_F") then
			{
				[_vehicle,"civ_littlebird",true] spawn life_fnc_vehicleAnimate;
			};

			if((_side) == "cop" && (_classname) in ["sab_UN_Offroad","sab_UN_Hunter","C_SUV_01_F"]) then
			{
				[_vehicle,"cop_offroad",true] spawn life_fnc_vehicleAnimate;
			};

			/*if(_classname in ["B_MRAP_01_F","C_SUV_01_F"] && ((_side) == "cop")) then {
				_vehicle setVariable["lights",false,true];
				sleep 0.01;
			};*/
		};
		
		[_vehicle] spawn
		{
			_vehicle = _this select 0;
			sleep 10;
			_vehicle allowDamage true;
		};

		// Force session DB save every 2.5 mins
		[_vehicle] spawn  {
			_vehicle = _this select 0;
			sleep (random 60);
			[] call life_fnc_getHLC;
			[_vehicle,"TON_fnc_updateVeh",serverhc,false] spawn life_fnc_MP;
		};
		if(server_debug && ((diag_tickTime - _t1) > 0.1) ) then { diag_log format["[debuglongtime] SYS fn_spawnVehicleActive %1 ", diag_tickTime - _t1]; };

	} foreach _queryResult;
};