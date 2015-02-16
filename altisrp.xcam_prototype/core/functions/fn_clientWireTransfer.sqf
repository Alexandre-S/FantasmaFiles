private["_unit","_val","_from"];
_val = _this select 0;
_from = _this select 1;
if(!([str(_val)] call life_fnc_isnumber)) exitWith {};
if(_from == "") exitWith {};
life_atmcash = life_atmcash + _val;
hint format["%1 vous a transferé %2€.",_from,[_val] call life_fnc_numberText];