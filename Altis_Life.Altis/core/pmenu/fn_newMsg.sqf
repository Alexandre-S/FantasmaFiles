#include <macro.h>
/*
	
	file: fn_newMsg.sqf
	Author: Silex
	
*/

private["_to","_type","_playerData","_msg"];
disableSerialization;

_type = [_this,0,-1] call BIS_fnc_param;
_playerData = [_this,1,-1] call BIS_fnc_param;
_msg = [_this,2,"",[""]] call BIS_fnc_param;

_display = findDisplay 88888;
_cPlayerList = _display displayCtrl 88881;
_cMessageEdit = _display displayCtrl 88884;
[] call life_fnc_getHLC;
switch(_type) do
{
	case 0:
	{
		life_smartphoneTarget = call compile format["%1",_playerData];
		ctrlSetText[88886, format["Email: %1",name life_smartphoneTarget]];
		if((__GETC__(life_adminlevel) < 1)) then
		{
			ctrlShow[888897,false];
		};
	};
	//normal message
	case 1:
	{
		if(isNUll life_smartphoneTarget) exitWith {hint format["Aucun joueur selectionné!"];};
		ctrlShow[88885, false];
		if(_msg == "") exitWith {hint "Veuillez entrer un message!";ctrlShow[88885, true];};
		[[life_smartphoneTarget,_msg,player,0],"TON_fnc_handleMessages",serverhc] spawn life_fnc_MP;
		hint format["Vous avez envoyez à %1 le message: %2",name life_smartphoneTarget,_msg];	
		ctrlShow[88885, true];
		closeDialog 88883;
	};
	//copmessage
	case 2:
	{
		if(({side _x == west} count playableUnits) == 0) exitWith {hint format["Aucun membre de l'ONU disponible. Veuillez re-essayer plus tard."];};
		ctrlShow[888895,false];
		if(_msg == "") exitWith {hint "Veuillez entrer un message!";ctrlShow[888895,true];};
		[[ObjNull,_msg,player,1],"TON_fnc_handleMessages",serverhc] spawn life_fnc_MP;
		_to = "l'ONU";
		hint format["Vous avez envoyez à %1 le message: %2",_to,_msg];
		ctrlShow[888895,true];
		closeDialog 887890;
		[[profileName, position player],"life_fnc_createMarker",west,false] spawn life_fnc_MP;
	};
	//msgadmin
	case 3:
	{
		ctrlShow[888896,false];
		if(_msg == "") exitWith {hint "Veuillez entrer un message!";ctrlShow[888896,true];};
		[[ObjNull,_msg,player,2],"TON_fnc_handleMessages",serverhc] spawn life_fnc_MP;
		_to = "admins";
		hint format["Vous avez envoyez aux %1 le message: %2",_to,_msg];
		ctrlShow[888896,true];
		closeDialog 887890;
	};
	//emsrequest
	case 4:
	{
		if(({side _x == independent} count playableUnits) == 0) exitWith {hint format["Aucun membre de la Croix-Rouge disponible. Veuillez re-essayer plus tard."];};
		ctrlShow[888899,false];
		if(_msg == "") exitWith {hint "Veuillez entrer un message!";ctrlShow[888899,true];};
		[[ObjNull,_msg,player,3],"TON_fnc_handleMessages",serverhc] spawn life_fnc_MP;
		hint format["Vous avez envoyez à la Croix-Rouge un message.",_msg];
		ctrlShow[888899,true];
		closeDialog 887890;
	};
	//adminToPerson
	case 5:
	{
		if((call life_adminlevel) < 1) exitWith {hint "Vous n'êtes pas admin!";};
		if(isNULL life_smartphoneTarget) exitWith {hint format["Aucun joueur selectionné!"];};
		if(_msg == "") exitWith {hint "Veuillez entrer un message!";};
		[[life_smartphoneTarget,_msg,player,4],"TON_fnc_handleMessages",serverhc] spawn life_fnc_MP;
		hint format["Admin Message envoyé à: %1 - Message: %2",name life_smartphoneTarget,_msg];
		closeDialog 88883;
	};
	//emergencyloading
	case 6:
	{
		if((__GETC__(life_adminlevel) < 1)) then
		{
			ctrlShow[888898,false];
			ctrlShow[888896,true];
		} else {
			ctrlShow[888898,true];
			ctrlShow[888896,false];
		};
	};
	//adminMsgAll
	case 7:
	{
		if((call life_adminlevel) < 1) exitWith {hint "Vous n'êtes pas admin!";};
		if(_msg == "") exitWith {hint "Veuillez entrer un message!";};
		[[ObjNull,_msg,player,5],"TON_fnc_handleMessages",serverhc] spawn life_fnc_MP;
		hint format["Admin Message envoyé à tous: %1",_msg];
		closeDialog 887890;
	};
	//depreq
	case 8:
	{
		if(({_x getVariable["life_dep",false]} count playableUnits) == 0) exitWith {hint format["Aucun dépanneur disponible. Veuillez re-essayer plus tard."];};
		ctrlShow[888900,false];
		if(_msg == "") exitWith {hint "Veuillez entrer un message!";ctrlShow[888900,true];};
		[[ObjNull,_msg,player,6],"TON_fnc_handleMessages",serverhc] spawn life_fnc_MP;
		hint format["Vous avez envoyez aux dépanneurs.",_msg];
		ctrlShow[888900,true];
		closeDialog 887890;
	};
};