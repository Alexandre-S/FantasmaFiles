/*
	File: fn_sellArrayMulti.sqf
	Author: Havena
	
	Description: update sell array multi
*/
private["_max","_min","_diff","_med","_xarray","_i","_newval","_sell_array2","_t1"];
if(server_debug) then { _t1 = diag_tickTime; };

_max = 0;
_min = 999999999;
{
    if (_x select 1 > _max) then {
        _max = _x select 1;
    };
	if (_x select 1 < _min) then {
        _min = _x select 1;
    };
} forEach sell_array_count;

_diff = _max - _min;
_med = _diff/4;

diag_log format["[fn_sellArrayMulti] min %1 max %2 med %3 diff %4 ", _min, _max, _med, _diff];
if(_diff==0) exitwith {};

countsellitem = 0;

for[{_i = 0},{_i < (count sell_array_count)},{_i = _i+1}] do
{
	_xarray = (sell_array_count select _i);
	
	// if!(((sell_array2 select _i) select 0) in ["water","coffee","donuts","tbacon","lockpick","pickaxe","redgull","fuelF","spikeStrip","pcp","storage1","storage2","nitro","redburger","soda"]) then {
		if (((_xarray select 1) - _min) > _med) then {
			if(((sell_array2 select _i) select 1) > 0.5) then {
				_newval = ((sell_array2 select _i) select 1) - (((((_xarray select 1) - _min) - _med)*0.05)/(_med*3));
				if(_newval < 0.5) then { _newval = 0.5};
				(sell_array2 select _i) set [1, _newval];
			};
		}
		else
		{
			if(((sell_array2 select _i) select 1) < 1.25) then {
				_newval = ((sell_array2 select _i) select 1) - (((((_xarray select 1) - _min) - _med)*0.02)/_med);
				if(_newval > 1.25) then { _newval = 1.25};
				(sell_array2 select _i) set [1, _newval];
			};
		};
	// };
	//diag_log format["[fn_sellArrayMulti] %1", ((sell_array2 select _i) select 1)];
};

diag_log format["[fn_sellArrayMulti] %1", sell_array2];
publicVariable "sell_array2";
sleep 0.5;

_sell_array2 = [sell_array2] call DB_fnc_mresArray;
_query = format["UPDATE prices SET price='%1' WHERE s='1' ",_sell_array2];
waitUntil {sleep (random 0.3); !DB_Async_Active};
_sql = [_query,1] call DB_fnc_asyncCall;
//diag_log format["[fn_sellArrayMulti][BDD] sell_array2 = %1", _sell_array2];

sell_array_count = 
[
	// ["heroinu",0],
	["heroinp",0],
	// ["seigle",0],
	["lsd",0],
	["salema",0],
	["ornate",0],
	["mackerel",0],
	["tuna",0],
	["mullet",0],
	["catshark",0],
	["oilp",0],
	["turtle",0],
	// ["turtlesoup",0],
	// ["cannabis",0],
	["marijuana",0],
	// ["cocaine",0],
	["cocainep",0],
	// ["diamond",0],
	["diamondc",0],
	["iron_r",0],
	["copper_r",0],
	["salt_r",0],
	["glass",0],
	["cement",0],
	["goldbar",0],
	["chicken",0],
	["goat",0],
	["sheep",0],
	["dog",0]
];

if(server_debug && ((diag_tickTime - _t1) > 0.1) ) then { diag_log format["[debuglongtime] SYS fn_sellArrayMulti %1 ", diag_tickTime - _t1]; };