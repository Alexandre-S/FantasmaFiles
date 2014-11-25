/*
File: fn_fixTafr.sqf
Author: Kirgog


Description:
Reskin vehicles after 5 seconds
*/


private["_vehicle","_color"];


_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_color = _this select 1;


sleep 5;
[[_vehicle,_color],"life_fnc_colorVehicle",true,false] spawn life_fnc_MP;