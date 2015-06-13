/*
	File: fn_colorVehicle.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Reskins the vehicle
*/
private["_vehicle","_index","_texture","_texture2","_texture3","_texture4","_texture5","_texture6","_texture7","_texture8","_texture9","_texture10","_texture11","_texture12","_texture13","_texture14","_texture15","_texture16","_texture17","_texture18","_texture19","_texture20"];
_vehicle = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_index = [_this,1,-1,[0]] call BIS_fnc_param;
if(isNull _vehicle OR !alive _vehicle OR _index == -1) exitWith {};
//Does the vehicle already have random styles? Halt till it's set.

/*if(local _vehicle) then {
	switch (typeOf _vehicle) do
	{
		case "C_Offroad_01_F": {[[_vehicle,"color",3,true],"TON_fnc_setObjVar",false,false] spawn life_fnc_MP;};
		case "C_Hatchback_01_F": {[[_vehicle,"color",1,true],"TON_fnc_setObjVar",false,false] spawn life_fnc_MP;};
		case "C_Hatchback_01_sport_F_RP": {[[_vehicle,"color",1,true],"TON_fnc_setObjVar",false,false] spawn life_fnc_MP;};
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
		case "C_Hatchback_01_sport_F_RP": {_vehicle setVariable["color",1];};
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
if(count (_texture select _index) > 11) then {_texture11 = (_texture select _index) select 11;};
if(count (_texture select _index) > 12) then {_texture12 = (_texture select _index) select 12;};
if(count (_texture select _index) > 13) then {_texture13 = (_texture select _index) select 13;};
if(count (_texture select _index) > 14) then {_texture14 = (_texture select _index) select 14;};
if(count (_texture select _index) > 15) then {_texture15 = (_texture select _index) select 15;};
if(count (_texture select _index) > 16) then {_texture16 = (_texture select _index) select 16;};
if(count (_texture select _index) > 17) then {_texture17 = (_texture select _index) select 17;};
if(count (_texture select _index) > 18) then {_texture18 = (_texture select _index) select 18;};
if(count (_texture select _index) > 19) then {_texture19 = (_texture select _index) select 19;};
if(count (_texture select _index) > 20) then {_texture20 = (_texture select _index) select 20;};
_texture = _texture select _index;
if(typeName _texture == "ARRAY") then { _texture = _texture select 0; };

//Local to us? Set it's color.
if(local _vehicle) then
{
	_vehicle setVariable["Life_VEH_color",_index,true];
};

waitUntil{!isNil {_vehicle getVariable "Life_VEH_color"}};

_vehicle setObjectTexture[0,_texture];
if(!isNil "_texture2") then {
	_vehicle setObjectTexture[1,_texture2];
};
if(!isNil "_texture3") then {
	_vehicle setObjectTexture[2,_texture3];
};
if(!isNil "_texture4") then {
	_vehicle setObjectTexture[3,_texture4];
};
if(!isNil "_texture5") then {
	_vehicle setObjectTexture[4,_texture5];
};
if(!isNil "_texture6") then {
	_vehicle setObjectTexture[5,_texture6];
};
if(!isNil "_texture7") then {
	_vehicle setObjectTexture[6,_texture7];
};
if(!isNil "_texture8") then {
	_vehicle setObjectTexture[7,_texture8];
};
if(!isNil "_texture9") then {
	_vehicle setObjectTexture[8,_texture9];
};
if(!isNil "_texture10") then {
	_vehicle setObjectTexture[9,_texture10];
};
if(!isNil "_texture11") then {
	_vehicle setObjectTexture[10,_texture11];
};
if(!isNil "_texture12") then {
	_vehicle setObjectTexture[11,_texture12];
};
if(!isNil "_texture13") then {
	_vehicle setObjectTexture[12,_texture13];
};
if(!isNil "_texture14") then {
	_vehicle setObjectTexture[13,_texture14];
};
if(!isNil "_texture15") then {
	_vehicle setObjectTexture[14,_texture15];
};
if(!isNil "_texture16") then {
	_vehicle setObjectTexture[15,_texture16];
};
if(!isNil "_texture17") then {
	_vehicle setObjectTexture[16,_texture17];
};
if(!isNil "_texture18") then {
	_vehicle setObjectTexture[17,_texture18];
};
if(!isNil "_texture19") then {
	_vehicle setObjectTexture[18,_texture19];
};
if(!isNil "_texture20") then {
	_vehicle setObjectTexture[19,_texture20];
};
if(typeOf _vehicle == "C_Offroad_01_F") then {
	if(_index < 5) then {
		_vehicle setObjectTexture[1,_texture];
	};
};
if(typeOf _vehicle in ["B_G_Offroad_01_armed_F","B_G_Offroad_01_F"]) then {
	_vehicle setObjectTexture[1,_texture];
};