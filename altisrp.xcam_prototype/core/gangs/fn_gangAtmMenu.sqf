#include <macro.h>
/*
	File: fn_gangAtmMenu.sqf
	Author: Youri Litovski
	
	Description:
	Menu ATM gang.
*/
private["_display","_text","_units","_type","_gangBank"];
if(!dialog) then
{
	if(!(createDialog "Life_gangatm_management")) exitWith {};
};

disableSerialization;

_display = findDisplay 62700;
_text = _display displayCtrl 62701;
_units = _display displayCtrl 62703;
_gangBank = grpPlayer getVariable "gang_bank";
lbClear _units;
_text ctrlSetStructuredText parseText format["<img size='1.7' image='altisrpfr\icons\bank.paa'/> $%1<br/><img size='1.6' image='altisrpfr\icons\money.paa'/> $%2",[_gangBank] call life_fnc_numberText,[life_cash] call life_fnc_numberText];

{
	if(alive _x && {_x != player}) then
	{
		switch (side _x) do
		{
			case west: {_type = "Cop"};
			case civilian: {_type = "Civ"};
			case independent: {_type = "EMS"};
		};
		_units lbAdd format["%1 (%2)",_x getVariable["realname",name _x],_type];
		_units lbSetData [(lbSize _units)-1,str(_x)];
	};
} foreach (units grpPlayer);

lbSetCurSel [62703,0];

// if(isNil {(grpPlayer getVariable "gang_bank")}) then {
	// (getControl(62700,62705)) ctrlEnable false;
// };