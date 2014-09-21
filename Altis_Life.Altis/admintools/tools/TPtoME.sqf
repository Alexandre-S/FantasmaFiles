//AlPMaker
_max = 10; _snext = false; _plist = []; _pselect5 = "";
{if ((_x != player) && (getPlayerUID _x != "")) then {_plist set [count _plist, name _x];};} forEach entities "CAManBase";
{if ((count crew _x) > 0) then {{if ((_x != player) && (getPlayerUID _x != "")) then {_plist set [count _plist, name _x];};} forEach crew _x;};} foreach (entities "LandVehicle" + entities "Air" + entities "Ship");
_smenu =
{
	_pmenu = [["",true]];
	for "_i" from (_this select 0) to (_this select 1) do
	{_arr = [format['%1', _plist select (_i)], [12],  "", -5, [["expression", format ["_pselect5 = _plist select %1;", _i]]], "1", "1"]; _pmenu set [_i + 2, _arr];};
	if (count _plist > (_this select 1)) then {_pmenu set [(_this select 1) + 2, ["Next", [13], "", -5, [["expression", "_snext = true;"]], "1", "1"]];}
	else {_pmenu set [(_this select 1) + 2, ["", [-1], "", -5, [["expression", ""]], "1", "0"]];};
	_pmenu set [(_this select 1) + 3, ["Exit", [13], "", -5, [["expression", "_pselect5 = 'exit';"]], "1", "1"]];
	showCommandingMenu "#USER:_pmenu";
};
_j = 0; _max = 10; if (_max>9) then {_max = 10;};
while {_pselect5 == ""} do
{
	[_j, (_j + _max) min (count _plist)] call _smenu; _j = _j + _max;
	WaitUntil {_pselect5 != "" or _snext};	
	_snext = false;
};
if (_pselect5 != "exit") then
{
	_name = _pselect5;
	{
		if(name _x == _name) then
		{
			hint format ["Teleporting %1", _name];
			_x attachTo [vehicle player, [2, 2, 0]];
			sleep 0.25;
			detach _x;
		};
	} forEach entities "CAManBase";
};