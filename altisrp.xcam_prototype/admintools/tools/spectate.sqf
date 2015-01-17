_mycv = cameraView;

_n2sh = 10;  
_n2c = "Select Player:";
_shnext = false;
_nlist = [];  
_selecteditem = "";

if (isNil "spectate_adminmenu") then {spectate_adminmenu = true;} else {spectate_adminmenu = !spectate_adminmenu;};
if (spectate_adminmenu) then 
{	 
	{if (_x != player) then {_nlist set [count _nlist, name _x];};} forEach playableUnits;
		
	_shnmenu = 
	{
		_pmenu = [["",true],[_n2c, [-1], "", -5, [["expression", ""]], "1", "0"]];
		for "_i" from (_this select 0) to (_this select 1) do
		{_arr = [format['%1',_nlist select (_i)], [_i - (_this select 0) + 2],  "", -5, [["expression", format["_selecteditem = _nlist select %1;",_i]]], "1", "1"];_pmenu set [_i+2, _arr];};
		if (count _nlist >  (_this select 1)) then {_pmenu set [(_this select 1)+2, ["Next", [12], "", -5, [["expression", "_shnext = true;"]], "1", "1"]];}
		else {_pmenu set [(_this select 1)+2, ["", [-1], "", -5, [["expression", ""]], "1", "0"]];};
		_pmenu set [(_this select 1)+3, ["Exit", [13], "", -5, [["expression", "_selecteditem = 'exitscript';"]], "1", "1"]];
		showCommandingMenu "#USER:_pmenu";
	};
	_j = 0; _n2sh = 10; if (_n2sh>9) then {_n2sh=10;};
	while {_selecteditem==""} do
	{
		[_j,(_j+_n2sh) min (count _nlist)] call _shnmenu;_j=_j+_n2sh;
		WaitUntil {_selecteditem!="" or _shnext};	
		_shnext = false;
	};
	
	if (_selecteditem!= "exitscript") then
	{
		_name = _selecteditem;
		{
			if(format[name _x] == _name) then 
			{
				
				admin_F3_EH = (findDisplay 46) displayAddEventHandler ["KeyDown","if ((_this select 1) == 0x3D) then {spectate_adminmenu = false;};"];	
				(vehicle _x) switchCamera "EXTERNAL";
				titleText ["Spectating...","PLAIN DOWN"];titleFadeOut 4;
				waitUntil { !(alive _x) or !(alive player) or !(spectate_adminmenu)};
				(findDisplay 46) displayRemoveEventHandler ["KeyDown", admin_F3_EH];
				player switchCamera _mycv;	
				 		
			};
		} forEach playableUnits;
	};
	spectate_adminmenu = false;
};
if (!spectate_adminmenu) then 
{	
	titleText ["Back to player...","PLAIN DOWN"];titleFadeOut 4;
};