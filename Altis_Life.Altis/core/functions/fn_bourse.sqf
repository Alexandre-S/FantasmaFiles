private["_string","_var","_name","_taux"];
_string = "<t size='2'>Bourse</t><br /><br />";
{
	// if!((_x select 0) in ["water","coffee","donuts","tbacon","lockpick","pickaxe","redgull","fuelF","spikeStrip","pcp","storage1","storage2","nitro","redburger","soda","apple","rabbit","peach"]) then {
		
		_var = [_x select 0,0] call life_fnc_varHandle;
		_name = [_var] call life_fnc_vartostr;
		_taux = round(((_x select 1) - 1) * 100);
		if(_taux > 0) then { _taux = format ["<t color='#4c9900'>+%1%2</t>",_taux,"%"]; } else { _taux = format ["<t color='#ff0000'>%1%2</t>",_taux,"%"]; };
		_string = _string + format ["<t align='left'>%1</t><t align='right'>%2</t><br />",_name,_taux];
	// };
} foreach sell_array2;

hint parseText format ["%1",_string];