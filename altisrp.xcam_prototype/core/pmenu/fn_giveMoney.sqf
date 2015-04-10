/*
	File: fn_giveMoney.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gives the selected amount of money to the selected player.
*/
if((time - life_action_delay) < 2) exitWith {hint "Vous ne pouvez pas effectuer autant d'opération en si peu de temps.. merci de patienter"};
life_action_delay = time;
private["_unit","_amount"];
_amount = ctrlText 2018;
ctrlShow[2001,false];
if((lbCurSel 2022) == -1) exitWith {hint "Vous n'avez selectionné aucune personne!";ctrlShow[2001,true];};
_unit = lbData [2022,lbCurSel 2022];
if(_unit == "targetgiveitemmoney") then {
	_unit = cursorTarget;
} else {
	_unit = call compile format["%1",_unit];
};
if(isNil "_unit") exitWith {ctrlShow[2001,true];};
if(isNull _unit) exitWith {ctrlShow[2001,true];};
if(_unit == player) exitWith {ctrlShow[2001,true];};
if(!isPlayer _unit) exitWith {hint "La cible n'est pas un joueur !";ctrlShow[2001,true];};
if(player distance _unit > 10) exitWith {hint "Cette personne est trop loin";ctrlShow[2001,true];};

//A series of checks *ugh*
if(!life_use_atm) exitWith {hint "You recently robbed the bank! You can't give money away just yet.";ctrlShow[2001,true];};
if(!([_amount] call life_fnc_isnumber)) exitWith {hint "You didn't enter an actual number format.";ctrlShow[2001,true];};
if(parseNumber(_amount) <= 0) exitWith {hint "You need to enter an actual amount you want to give.";ctrlShow[2001,true];};
if(parseNumber(_amount) > life_cash) exitWith {hint "You don't have that much to give!";ctrlShow[2001,true];};
if(isNull _unit) exitWith {ctrlShow[2001,true];};
if(isNil "_unit") exitWith {ctrlShow[2001,true]; hint "The selected player is not within range";};
hint format["You gave $%1 to %2",[(parseNumber(_amount))] call life_fnc_numberText,_unit getVariable["realname",name _unit]];
life_cash = life_cash - (parseNumber(_amount));
[0] call SOCK_fnc_updatePartial;
[[_unit,_amount,player],"life_fnc_receiveMoney",_unit,false] spawn life_fnc_MP;
[] call life_fnc_p_updateMenu;

ctrlShow[2001,true];