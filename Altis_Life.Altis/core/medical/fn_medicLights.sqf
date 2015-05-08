/*
	File: fn_copLights.sqf
	Author: mindstorm, modified by Adanteh
	Link: http://forums.bistudio.com/showthread.php?157474-Offroad-Police-sirens-lights-and-underglow
	
	Description:
	Adds the light effect to cop vehicles, specifically the offroad.
*/

Private ["_vehicle","_lightRed","_lightBlue","_lightleft","_lightright","_leftRed","_service_truck"];
_vehicle = _this select 0;
service_truck =	_vehicle getVariable["service_truck",FALSE];
if(isNil "_vehicle" OR isNull _vehicle OR !(_vehicle getVariable "lights")) exitWith {};

if(service_truck) then {
	_lightRed = [20, 20, 6];
	_lightBlue = [20, 20, 6];
} else {
	_lightRed = [0.1, 0.1, 20];
	_lightBlue = [0.1, 0.1, 20];
};

_lightleft = "#lightpoint" createVehicle getpos _vehicle;   
sleep 0.2;
_lightleft setLightColor _lightRed; 
_lightleft setLightBrightness 0.2;
if(service_truck) then {
	_lightleft setLightAmbient [20, 20, 6];
} else {
	_lightleft setLightAmbient [0.1,0.1,20];
};

switch (typeOf _vehicle) do
{
	case "C_Offroad_01_F":
	{
		_lightleft lightAttachObject [_vehicle, [-0.37, 0.0, 0.52]];
	};
	case "C_Offroad_01_F_DEP_RP":
	{
		_lightleft lightAttachObject [_vehicle, [-0.37, 0.0, 0.52]];
	};
};

_lightleft setLightAttenuation [0.1, 0, 1000, 130]; 
_lightleft setLightIntensity 8;
_lightleft setLightFlareSize 0.38;
_lightleft setLightFlareMaxDistance 120;
_lightleft setLightUseFlare true;

_lightright = "#lightpoint" createVehicle getpos _vehicle;   
sleep 0.2;
_lightright setLightColor _lightBlue; 
_lightright setLightBrightness 0.2;  

if(service_truck) then {
	_lightright setLightAmbient [20, 20, 6]; 
} else {
	_lightright setLightAmbient [0.1,0.1,20]; 
};

switch (typeOf _vehicle) do
{
	case "C_Offroad_01_F":
	{
		_lightright lightAttachObject [_vehicle, [0.37, 0.0, 0.52]];
	};
	case "C_Offroad_01_F_DEP_RP":
	{
		_lightright lightAttachObject [_vehicle, [0.37, 0.0, 0.52]];
	};
};
  
_lightright setLightAttenuation [0.1, 0, 1000, 130]; 
_lightright setLightIntensity 8;
_lightright setLightFlareSize 0.38;
_lightright setLightFlareMaxDistance 120;
_lightright setLightUseFlare true;

//ARE YOU ALL HAPPY?!?!?!?!?!?!?!?!?%#?@WGD?TGD?BN?ZDHBFD?GA
_lightleft setLightDayLight true;
_lightright setLightDayLight true;

_leftRed = true;  
while{ (alive _vehicle)} do  
{  
	if(!(_vehicle getVariable "lights")) exitWith {};
	if(_leftRed) then  
	{  
		_leftRed = false;  
		_lightright setLightBrightness 0.0;  
		sleep 0.05;
		_lightleft setLightBrightness 6;  
	}  
		else  
	{  
		_leftRed = true;  
		_lightleft setLightBrightness 0.0;  
		sleep 0.05;
		_lightright setLightBrightness 6;  
	};  
	sleep (_this select 1);  
};  
deleteVehicle _lightleft;
deleteVehicle _lightright;