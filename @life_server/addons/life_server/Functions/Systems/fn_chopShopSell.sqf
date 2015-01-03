/*
	File: fn_chopShopSell.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Checks whether or not the vehicle is persistent or temp and sells it.
*/
private["_unit","_vehicle","_price","_cash","_query","_unitid"];
_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_vehicle = [_this,1,objNull,[objNull]] call BIS_fnc_param;
_price = [_this,2,500,[0]] call BIS_fnc_param;
_cash = [_this,3,0,[0]] call BIS_fnc_param;
_unitid = [_this,4,-1,[0]] call BIS_fnc_param;

//Error checks
if(isNull _vehicle OR isNull _unit OR _unitid == -1) exitWith 
{
	[["life_action_inUse",false],"life_fnc_netSetVar",nil,false] spawn life_fnc_MP;
};

_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
//_unit = owner _unit;

_dbInfo = _vehicle getVariable["dbInfo",[]];
if(count _dbInfo > 0) then {
	_uid = _dbInfo select 0;
	_plate = _dbInfo select 1;
	_assur = _dbInfo select 2;
	
	if(_assur == 1) then
	{
		_query = format["UPDATE vehicles SET alive='1', insure='0', active='0' WHERE pid='%1' AND plate='%2'",_uid,_plate]; 
	} 
	else  
	{
		_query = format["UPDATE vehicles SET alive='0' WHERE pid='%1' AND plate='%2'",_uid,_plate];
	}; 
	waitUntil {!DB_Async_Active};
	_sql = [_query,1] call DB_fnc_asyncCall;
};

deleteVehicle _vehicle;
[["life_action_inUse",false],"life_fnc_netSetVar",_unitid,false] spawn life_fnc_MP;
[["life_cash",_cash],"life_fnc_netSetVar",_unitid,false] spawn life_fnc_MP;
[[2,format[(localize "STR_NOTF_ChopSoldCar"),_displayName,[_price] call life_fnc_numberText]],"life_fnc_broadcast",_unitid,false] spawn life_fnc_MP;