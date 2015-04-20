/*
	File: fn_vehicleStore.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Stores the vehicle in the 'Garage'
*/
private["_vehicle","_impound","_vInfo","_vInfo","_plate","_uid","_query","_sql","_unit","_unitid"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_impound = [_this,1,false,[true]] call BIS_fnc_param;
_unit = [_this,2,ObjNull,[ObjNull]] call BIS_fnc_param;
_unitid = [_this,3,-1,[0]] call BIS_fnc_param;

if(isNull _vehicle OR isNull _unit OR _unitid == -1) exitWith {
	// life_impound_inuse = false;
	// (owner _unit) publicVariableClient "life_impound_inuse";
	// life_garage_store = false;
	// (owner _unit) publicVariableClient "life_garage_store";
	if(_unitid != -1) then
	{
		[["life_impound_inuse",false],"life_fnc_netSetVar",_unitid,false] spawn life_fnc_MP;
		[["life_garage_store",false],"life_fnc_netSetVar",_unitid,false] spawn life_fnc_MP;

	};
}; //Bad data passed.

_vInfo = _vehicle getVariable["dbInfo",[]];
if(count _vInfo > 0) then
{
	_plate = _vInfo select 1;
	_uid = _vInfo select 0;
};

if(_impound) then
{
	if(count _vInfo == 0) then 
	{
		// life_impound_inuse = false;
		// (owner _unit) publicVariableClient "life_impound_inuse";
		[["life_impound_inuse",false],"life_fnc_netSetVar",_unitid,false] spawn life_fnc_MP;
		if(!isNil "_vehicle" && {!isNull _vehicle}) then {
			deleteVehicle _vehicle;
		};
	} 
	else
	{
		_query = format["UPDATE vehicles SET active='0', inventory='""[[],0]""', four ='1' WHERE pid='%1' AND plate='%2'",_uid,_plate];
		waitUntil {sleep (random 0.3); !DB_Async_Active};
		_thread = [_query,1] call DB_fnc_asyncCall;
		//waitUntil {scriptDone _thread};
		if(!isNil "_vehicle" && {!isNull _vehicle}) then {
			deleteVehicle _vehicle;
		};
		// life_impound_inuse = false;
		// (owner _unit) publicVariableClient "life_impound_inuse";
		[["life_impound_inuse",false],"life_fnc_netSetVar",_unitid,false] spawn life_fnc_MP;
	};
}
else
{

	if(count _vInfo == 0) exitWith
	{
		[[1,(localize "STR_Garage_Store_NotPersistent")],"life_fnc_broadcast",_unitid,false] spawn life_fnc_MP;
		// [[1,(localize "STR_Garage_Store_NotPersistent")],"life_fnc_broadcast",(owner _unit),false] spawn life_fnc_MP;
		// life_garage_store = false;
		// (owner _unit) publicVariableClient "life_garage_store";
		[["life_garage_store",false],"life_fnc_netSetVar",_unitid,false] spawn life_fnc_MP;
	};
	
	if(_uid != getPlayerUID _unit) exitWith
	{
		// [[1,(localize "STR_Garage_Store_NoOwnership")],"life_fnc_broadcast",(owner _unit),false] spawn life_fnc_MP;
		[[1,(localize "STR_Garage_Store_NoOwnership")],"life_fnc_broadcast",_unitid,false] spawn life_fnc_MP;
		// life_garage_store = false;
		// (owner _unit) publicVariableClient "life_garage_store";
		[["life_garage_store",false],"life_fnc_netSetVar",_unitid,false] spawn life_fnc_MP;
	};
	_query = format["UPDATE vehicles SET active='0', inventory='""[[],0]""' WHERE pid='%1' AND plate='%2'",_uid,_plate];
	waitUntil {sleep (random 0.3); !DB_Async_Active};
	_thread = [_query,1] call DB_fnc_asyncCall;
	//waitUntil {scriptDone _thread};
	if(!isNil "_vehicle" && {!isNull _vehicle}) then {
		deleteVehicle _vehicle;
	};
	// life_garage_store = false;
	// (owner _unit) publicVariableClient "life_garage_store";
	[["life_garage_store",false],"life_fnc_netSetVar",_unitid,false] spawn life_fnc_MP;
	// [[1,(localize "STR_Garage_Store_Success")],"life_fnc_broadcast",(owner _unit),false] spawn life_fnc_MP;
	[[1,"Le véhicule a été entreposé dans le garage."],"life_fnc_broadcast",_unitid,false] spawn life_fnc_MP;
};