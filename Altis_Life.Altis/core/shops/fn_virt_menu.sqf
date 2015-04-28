#include <macro.h>
/*
	File: fn_virt_menu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initialize the virtual shop menu.
*/
private["_shop"];
_shop = _this select 3;
if(isNil {_shop}) exitWith {};
life_shop_type = _shop;
life_shop_npc = _this select 0;
if(_shop == "cop" && playerSide != west) exitWith {hint localize "STR_NOTF_NotACop"};
if(_shop == "med" && playerSide != independent) exitWith {hint "Shop reservé aux médecins"};
if(_shop == "dep" && !(player getVariable["life_dep",false])) exitWith {hint "Shop reservé aux dépanneurs"};
if(_shop == "house" && (__GETC__(life_donator==0))) exitWith {hint "Shop reservé aux membres premium"};
createDialog "shops_menu";

[] call life_fnc_virt_update;