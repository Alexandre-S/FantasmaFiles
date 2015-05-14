#include <macro.h>
/*

	file: fn_smartphone.sqf
	Author: Silex
	
*/
private["_display","_units","_type","_data","_rowData","_msg","_near_units"];
_type = [_this,0,0] call BIS_fnc_param;
_data = [_this,1,0,["",[],0]] call BIS_fnc_param;


disableSerialization;
waitUntil {!isNull findDisplay 88888};
_display = findDisplay 88888;
_cPlayerList = _display displayCtrl 88881;
_cMessageList = _display displayCtrl 88882;
_cMessageHeader = _display displayCtrl 88886;
_cMessageHeader ctrlSetText format["De:                 Message:"];
ctrlEnable[887892,false];
switch(_type) do
{
	case 0:
	{
		lbClear _cPlayerList;
		
		_near_units = [];
		{  _near_units set [count _near_units, name _x]; } foreach playableUnits;
		_near_units = _near_units call BIS_fnc_sortAlphabetically;
		{
			_name = _x;
			{
				if (name _x == _name && alive _x && _x != player) then
				//if(alive _x && _x != player) then
				{
					switch(side _x) do
					{
						case west: {_type = "Cop"};
						case civilian: {
							_type = "Civ";
							if(_x getVariable["life_dep",false]) then{ _type = "Dep"; };
							if(_x getVariable["life_taxi",false]) then{ _type = "Taxi"; };
						};
						case independent: {_type = "Med"};
					};
					_cPlayerList lbAdd format["%1 (%2)",_x getVariable["realname", name _x],_type];
					_cPlayerList lbSetData [(lbSize _cPlayerList)-1,str(_x)];
				};
			} forEach playableUnits;
		} foreach _near_units;
		//_cPlayerList = _cPlayerList call BIS_fnc_sortAlphabetically;
		[] call life_fnc_getHLC;
		[[getPlayerUID player, player],"TON_fnc_msgRequest",serverhc,false] spawn life_fnc_MP;
		ctrlEnable[887892,false];
	};
	case 1:
	{
		{
			_msg = [_x select 2,40] call KRON_StrLeft;
			_rowData = [_x select 0, _x select 1, _x select 2, _x select 3];
			_cMessageList lnbAddRow[_x select 3,format["%1 ...",_msg]];
			_cMessageList lnbSetData[[((lnbSize _cMessageList) select 0)-1,0],str(_rowData)];
		}forEach _data;
	};
	case 2:
	{
		ctrlEnable[887892,true];
		_target = lbData[88881,(lbCurSel 88881)];
		life_smartphoneTarget = call compile format["%1",_target];
	};
	
	case 4:
	{
		createDialog "Life_smartphone_schreiben";
		ctrlSetText[88886, format["Message: %1",life_smartphoneTarget getVariable["realname", name life_smartphoneTarget]]];
		if((__GETC__(life_adminlevel) < 1)) then
		{
			ctrlShow[888897,false];
		};
	};
};