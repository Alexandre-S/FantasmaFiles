/*
	File: fn_colorVehicle.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Reskins the vehicle
*/
private["_vehicle","_index","_texture","_texture2","_texture3","_texture4","_texture5","_texture6","_texture7","_texture8","_texture9","_texture10"];
_vehicle = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_index = [_this,1,-1,[0]] call BIS_fnc_param;
if(isNull _vehicle OR !alive _vehicle OR _index == -1) exitWith {};
//Does the vehicle already have random styles? Halt till it's set.

/*if(local _vehicle) then {
	switch (typeOf _vehicle) do
	{
		case "C_Offroad_01_F": {[[_vehicle,"color",3,true],"TON_fnc_setObjVar",false,false] spawn life_fnc_MP;};
		case "C_Hatchback_01_F": {[[_vehicle,"color",1,true],"TON_fnc_setObjVar",false,false] spawn life_fnc_MP;};
		case "C_Hatchback_01_sport_F": {[[_vehicle,"color",1,true],"TON_fnc_setObjVar",false,false] spawn life_fnc_MP;};
		case "C_SUV_01_F": {[[_vehicle,"color",1,true],"TON_fnc_setObjVar",false,false] spawn life_fnc_MP;};
		case "C_Van_01_box_F": {[[_vehicle,"color",1,true],"TON_fnc_setObjVar",false,false] spawn life_fnc_MP;};
		case "C_Van_01_transport_F": {[[_vehicle,"color",1,true],"TON_fnc_setObjVar",false,false] spawn life_fnc_MP;};
	};	

	switch (typeOf _vehicle) do
	{
		case "C_Offroad_01_F": {_vehicle setVariable["color",3];};
		case "B_G_Offroad_01_F": {_vehicle setVariable["color",3];};
		case "B_G_Offroad_01_armed_F": {_vehicle setVariable["color",3];};
		case "C_Hatchback_01_F": {_vehicle setVariable["color",1];};
		case "C_Hatchback_01_sport_F": {_vehicle setVariable["color",1];};
		case "C_SUV_01_F": {_vehicle setVariable["color",1];};
		case "C_Van_01_box_F": {_vehicle setVariable["color",1];};
		case "C_Van_01_transport_F": {_vehicle setVariable["color",1];};
	};
};*/


//Fetch texture from our present array.
_texture = [(typeOf _vehicle)] call life_fnc_vehicleColorCfg;
if(isNil "_texture") exitWith {};
if(count _texture == 0) exitWith {};
if(count (_texture select _index) > 2) then {_texture2 = (_texture select _index) select 2;};
if(count (_texture select _index) > 3) then {_texture3 = (_texture select _index) select 3;};
if(count (_texture select _index) > 4) then {_texture4 = (_texture select _index) select 4;};
if(count (_texture select _index) > 5) then {_texture5 = (_texture select _index) select 5;};
if(count (_texture select _index) > 6) then {_texture6 = (_texture select _index) select 6;};
if(count (_texture select _index) > 7) then {_texture7 = (_texture select _index) select 7;};
if(count (_texture select _index) > 8) then {_texture8 = (_texture select _index) select 8;};
if(count (_texture select _index) > 9) then {_texture9 = (_texture select _index) select 9;};
if(count (_texture select _index) > 10) then {_texture10 = (_texture select _index) select 10;};
_texture = _texture select _index;
if(typeName _texture == "ARRAY") then { _texture = _texture select 0; };

//Local to us? Set it's color.
/*if(local _vehicle) then
{*/
	_vehicle setVariable["Life_VEH_color",_index,true];
// };

waitUntil{!isNil {_vehicle getVariable "Life_VEH_color"}};

_vehicle setObjectTextureGlobal[0,_texture];
if(!isNil "_texture2") then {
	_vehicle setObjectTextureGlobal[1,_texture2];
};
if(!isNil "_texture3") then {
	_vehicle setObjectTextureGlobal[2,_texture3];
};
if(!isNil "_texture4") then {
	_vehicle setObjectTextureGlobal[3,_texture3];
};
if(!isNil "_texture5") then {
	_vehicle setObjectTextureGlobal[4,_texture3];
};
if(!isNil "_texture6") then {
	_vehicle setObjectTextureGlobal[5,_texture3];
};
if(!isNil "_texture7") then {
	_vehicle setObjectTextureGlobal[6,_texture3];
};
if(!isNil "_texture8") then {
	_vehicle setObjectTextureGlobal[7,_texture3];
};
if(!isNil "_texture9") then {
	_vehicle setObjectTextureGlobal[8,_texture3];
};
if(!isNil "_texture10") then {
	_vehicle setObjectTextureGlobal[9,_texture3];
};
if(typeOf _vehicle == "C_Offroad_01_F") then {
	if(_index < 5) then {
		_vehicle setObjectTextureGlobal[1,_texture];
	};
};
if(typeOf _vehicle in ["B_G_Offroad_01_armed_F","B_G_Offroad_01_F"]) then {
	_vehicle setObjectTextureGlobal[1,_texture];
};