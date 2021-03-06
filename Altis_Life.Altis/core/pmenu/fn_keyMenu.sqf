/*
	File: fn_keyMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initializes the key menu
	Will be revised.
*/
private["_display","_vehicles","_plist","_near_units","_pic","_name","_text","_color","_index","_type"];
disableSerialization;

waitUntil {!isNull (findDisplay 2700)};
_display = findDisplay 2700;
_vehicles = _display displayCtrl 2701;
lbClear _vehicles;
_plist = _display displayCtrl 2702;
lbClear _plist;
_near_units = [];

// { if(player distance _x < 20) then {_near_units pushBack _x};} foreach playableUnits;
{  _near_units set [count _near_units, name _x]; } foreach playableUnits;

for "_i" from 0 to (count life_vehicles)-1 do
{
	_veh = life_vehicles select _i;
	if(!isNull _veh && alive _veh) then
	{
		_color = [(typeOf _veh),(_veh getVariable "Life_VEH_color")] call life_fnc_vehicleColorStr;
		_text = format["(%1)",_color];
		if(_text == "()") then
		{
			_text = "";
		};
		
		_name = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");
		_pic = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "picture");
		_vehicles lbAdd format["%1 %3 - [Distance: %2m]",_name,round(player distance _veh),_text];
		if(_pic != "pictureStaticObject") then {
			_vehicles lbSetPicture [(lbSize _vehicles)-1,_pic];
		};
		_vehicles lbSetData [(lbSize _vehicles)-1,str(_i)];
	};
};

/*
{
	if(!isNull _x && alive _x && player distance _x < 20 && _x != player) then
	{
		_plist lbAdd format["%1 - %2",_x getVariable["realname",name _x], side _x];
		_plist lbSetData [(lbSize _plist)-1,str(_x)];
	};
} foreach _near_units;
*/

_plist lbAdd format["%1","Cible"];
_plist lbSetData [(lbSize _plist)-1,"targetkeygive"];

_near_units = _near_units call BIS_fnc_sortAlphabetically;
{
	_name = _x;
	{
		if (!isNull _x && name _x == _name && alive _x && _x != player) then
		{
			switch (side _x) do
			{
				case west: {
					_type = "Cop";
				};
				case civilian: {
					_type = "Civ";
					if(_x getVariable["life_dep",false]) then{ _type = "Dep"; };
					if(_x getVariable["life_taxi",false]) then{ _type = "Taxi"; };
				};
				case resistance: {
					_type = "Med";
				};
			};
			_plist lbAdd format["%1 (%2)",_x getVariable["realname",name _x], _type];
			_plist lbSetData [(lbSize _plist)-1,str(_x)];
		};
	} foreach playableUnits;
} foreach _near_units;

if(((lbSize _vehicles)-1) == -1) then
{
	_vehicles lbAdd "Vous ne possedez aucun vehicle";
	_vehicles lbSetData [(lbSize _vehicles)-1,str(ObjNull)];
};