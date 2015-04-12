#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Buys the house?
*/
private["_house","_uid","_action","_houseCfg","_exit"];
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_uid = getPlayerUID player;

if(isNull _house) exitWith {};
if(!(_house isKindOf "House_F")) exitWith {};
if((_house getVariable["house_owned",false]) || (_house getVariable["house_id",-1] != -1)) exitWith {hint "Ce bâtiment n'est pas à vendre"};
if(!isNil {(_house getVariable "house_sold")}) exitWith {hint localize "STR_House_Sell_Process"};
if(!license_civ_home) exitWith {hint localize "STR_House_License"};

// Plus de maisons pour le staff == Maisons MJ etc...
_exit = false;
if(__GETC__(life_adminlevel) > 0) then{
	if(count life_houses >= 6) then {_exit = true; hint "Un membre du staff ne peut pas avoir plus de 6 bâtiments à la fois.";};
} else{
	// if(__GETC__(life_donator==0)) then {
		// _exit = true; hint "L'achat de batiment est réservé au membres premium.";
	// } else {
		if(count life_houses >= (__GETC__(life_donator)+(__GETC__(life_houseLimit)))) then {_exit = true; hint format[localize "STR_House_Max_House",__GETC__(life_houseLimit)]};
		if(count life_houses >= 4) then {_exit = true; hint "Vous ne pouvez pas posséder plus de 4 bâtiments à la fois.";};
	// };
	// if(count life_houses >= (__GETC__(life_houseLimit))) exitWith {hint format[localize "STR_House_Max_House",__GETC__(life_houseLimit)]};
};
if(_exit) exitWith {closeDialog 0;};

_houseCfg = [(typeOf _house)] call life_fnc_houseConfig;
if(count _houseCfg == 0) exitWith {};

_action = [
	format[localize "STR_House_BuyMSG",
	[(_houseCfg select 0)] call life_fnc_numberText,
	(_houseCfg select 1)],localize "STR_House_Purchase",localize "STR_Global_Buy",localize "STR_Global_Cancel"
] call BIS_fnc_guiMessage;

if(_action) then {
	if(life_atmcash < (_houseCfg select 0)) exitWith {hint format [localize "STR_House_NotEnough"]};
	[] call life_fnc_getHLC;
	[[_uid,_house,havena_id],"TON_fnc_addHouse",serverhc,false] spawn life_fnc_MP;
	closedialog 0;
	/*_house setVariable["house_owner",[_uid,profileName],true];
	sleep 0.01;
	_house setVariable["locked",true,true];
	sleep 0.01;
	_house setVariable["Trunk",[[],0],true];
	sleep 0.01;
	_house setVariable["containers",[],true];
	sleep 0.01;
	_house setVariable["uid",round(random 99999),true];
	sleep 0.01;
	life_atmcash = life_atmcash - (_houseCfg select 0);
	life_vehicles pushBack _house;
	life_houses pushBack [str(getPosATL _house),[]];
	_marker = createMarkerLocal [format["house_%1",(_house getVariable "uid")],getPosATL _house];
	_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
	_marker setMarkerTextLocal _houseName;
	_marker setMarkerColorLocal "ColorBlue";
	_marker setMarkerTypeLocal "loc_Lighthouse";
	_numOfDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors");
	for "_i" from 1 to _numOfDoors do {
		_house setVariable[format["bis_disabled_Door_%1",_i],1,true];
		sleep 0.01;
	};*/
};