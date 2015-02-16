/*
	File: fn_updateSAM.sqf
	Author: Havena
	
	Description: update sell array multi
*/
private["_index","_amount","_newcount","_t1"];
if(server_debug) then { _t1 = diag_tickTime; };

_index = _this select 0;
_amount = _this select 1;
countsellitem = countsellitem + _amount;
diag_log format["[fn_updateSAM1] %1 %2 %3 %4 ", _index, _amount, sell_array_count select _index, ((sell_array_count select _index) select 1)];

_newcount = ((sell_array_count select _index) select 1) + _amount;
//diag_log format["[fn_updateSAM2] %1 %2 %3", _index, _amount, _newcount];

(sell_array_count select _index) set [1, _newcount];
//diag_log format["[fn_updateSAM3] %1 %2 %3 ", _index, _amount, sell_array_count];
if(server_debug && ((diag_tickTime - _t1) > 0.1) ) then { diag_log format["[debuglongtime] SYS fn_updateSAM %1 ", diag_tickTime - _t1]; };