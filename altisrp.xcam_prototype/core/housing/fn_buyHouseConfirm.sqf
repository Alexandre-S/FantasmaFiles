#include <macro.h>
/*
	Author: Havena
	
	Description:
	Confirm buy
*/
private["_house","_uid","_houseCfg","_marker","_houseName","_numOfDoors"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_house = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _house OR _uid == "") exitWith {};

_houseCfg = [(typeOf _house)] call life_fnc_houseConfig;
if(count _houseCfg == 0) exitWith {};

_house setVariable["house_owner",[_uid,profileName],true];
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
};
hintC "Félicitations, vous êtes le nouveau propriétaire.";