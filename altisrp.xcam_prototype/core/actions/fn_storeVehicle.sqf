/*
	File: fn_storeVehicle.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Stores the vehicle in the garage.
*/
private["_nearVehicles","_vehicle","_upp","_ui","_progress","_pgText","_cP","_displayName"];
if(vehicle player != player) exitWith {hint "Vous ne pouvez pas ranger un véhicule en étant dedans."};

_nearVehicles = nearestObjects[getPos (_this select 0),["LandVehicle","Air","Ship"],100]; //Fetch vehicles within 30m.
if(count _nearVehicles > 0) then
{
	{
		if(!isNil "_vehicle") exitWith {}; //Kill the loop.
		_vehData = _x getVariable["vehicle_info_owners",[]];
		if(count _vehData  > 0) then
		{
			_vehOwner = (_vehData select 0) select 0;
			if((getPlayerUID player) == _vehOwner) exitWith
			{
				_vehicle = _x;
			};
		};
	} foreach _nearVehicles;

	life_action_inUse = true;
	_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
	_upp = format[localize "STR_NOTF_Rangement",_displayName];
	//Setup our progress bar.
	disableSerialization;
	5 cutRsc ["life_progress","PLAIN"];
	_ui = uiNameSpace getVariable "life_progress";
	_progress = _ui displayCtrl 38201;
	_pgText = _ui displayCtrl 38202;
	_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
	_progress progressSetPosition 0.01;
	_cP = 0.01;

	while{true} do
	{
		sleep 0.27;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(!alive player) exitWith {};
		if(player != vehicle player) exitWith {};
		if(life_interrupted) exitWith {};
		if(isNil "_vehicle") exitWith {};
		if(isNull _vehicle) exitWith {};
	};
	
	life_action_inUse = false;
	5 cutText ["","PLAIN"];
	player playActionNow "stop";
	if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};


	if(isNil "_vehicle") exitWith {hint localize "STR_Garage_NoNPC"};
	if(isNull _vehicle) exitWith {};
	[] call life_fnc_getHLC;
	[[_vehicle,false,(_this select 1),havena_id],"TON_fnc_vehicleStore",serverhc,false] spawn life_fnc_MP;
	hint localize "STR_Garage_Store_Server";
	life_garage_store = true;

};

	
