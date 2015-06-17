/*
	File: fn_getsetprice.sqf
	Author: Havena
	
	Description: get & site price multi
*/
private["_query","_sql","_new","_ret","_t1"];
if(server_debug) then { _t1 = diag_tickTime; };

_query = "SELECT price FROM prices WHERE s='1'";

waitUntil {sleep (random 0.3); !DB_Async_Active};
_tickTime = diag_tickTime;
_result = [_query,2] call DB_fnc_asyncCall;

diag_log "------------- Price Query Request -------------";
diag_log format["QUERY: %1",_query];
diag_log format["Time to complete: %1 (in seconds)",(diag_tickTime - _tickTime)];
diag_log format["Result: %1",_result];
diag_log "------------------------------------------------";


if(count _result == 0) then
{
	sell_array2 = 
	[
		// ["heroinu",1],
		["heroinp",1],
		// ["seigle",1],
		["lsd",1],
		["salema",1],
		["ornate",1],
		["mackerel",1],
		["tuna",1],
		["mullet",1],
		["catshark",1],
		["oilp",1],
		["turtle",1],
		// ["turtlesoup",1],
		// ["cannabis",1],
		["marijuana",1],
		// ["cocaine",1],
		["cocainep",1],
		// ["diamond",1],
		["diamondc",1],
		["bottledbeer",1],
		["bottledwhiskey",1],
		["moonshine",1],
		["bottledshine",1],
		["iron_r",1],
		["copper_r",1],
		["salt_r",1],
		["glass",1],
		["cement",1],
		["goldbar",1],
		["chicken",1],
		["goat",1],
		["sheep",1],
		["dog",1]
	];
}
else
{
	_new = [(_result select 0)] call DB_fnc_mresToArray;
	if(typeName _new == "STRING") then {_new = call compile format["%1", _new];};
	//diag_log format["[fn_sellArrayMulti][BDD] sell_array2 = %1", _new];
	sell_array2 = _new;
};
publicVariable "sell_array2";
sleep 0.5;

// SAM
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
	["bottledbeer",0],
	["bottledwhiskey",0],
	["moonshine",0],
	["bottledshine",0],
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
if(server_debug && ((diag_tickTime - _t1) > 0.1) ) then { diag_log format["[debuglongtime] SYS fn_getSetPrice %1 ", diag_tickTime - _t1]; };