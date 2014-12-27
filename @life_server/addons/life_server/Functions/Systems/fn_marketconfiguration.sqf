/*

	Main configuration for non-persistent market system
	Will need triggers to hook into vanilla pricing methods
        Edited by: Lukas "Alduin86"

*/

////////////MAIN CONFIG

private["_queryResult","_query","_item","_itemprice","_oilpPrice","_iron_rPrice","_diamondcPrice","_copper_rPrice","_salt_rPrice","_glassPrice","_cementPrice","_turtlePrice","_marijuanaPrice","_cocainepPrice","_heroinpPrice","_goldbarPrice"];


_query = format["SELECT resource, price FROM resources"];
waitUntil{sleep (random 0.3); !DB_Async_Active};
_queryResult = [_query,2,true] call DB_fnc_asyncCall;
_rows = call compile format["%1",_queryResult]; //compile data
diag_log "------------- Market Query Request -------------";
diag_log format["Query: %1",_query];
diag_log format["Result: %1",_rows];
diag_log "------------------------------------------------";

//* _rows should look like this now: [["oilp","1000"],["diamond","2000"]];

{
	_item = (_x select 0); //on the first run = "oilp", second run = "diamond")
	_itemprice = (_x select 1); //on the first run = "1000", second run = "2000") //* Note: _price is a STRING now! 
	
	//diag_log format["%1-price %2 generated",_item,_itemprice];	
	if(_item == "oilp") then {_oilpPrice = _itemprice}; // The right price should be assigned
	if(_item == "iron_r") then {_iron_rPrice = _itemprice}; // The right price should be assigned
	if(_item == "diamondc") then {_diamondcPrice = _itemprice}; // The right price should be assigned
	if(_item == "copper_r") then {_copper_rPrice = _itemprice}; // The right price should be assigned
	if(_item == "salt_r") then {_salt_rPrice = _itemprice}; // The right price should be assigned
	if(_item == "glass") then {_glassPrice = _itemprice}; // The right price should be assigned
	if(_item == "cement") then {_cementPrice = _itemprice}; // The right price should be assigned
	if(_item == "turtle") then {_turtlePrice = _itemprice}; // The right price should be assigned
	if(_item == "marijuana") then {_marijuanaPrice = _itemprice}; // The right price should be assigned
	if(_item == "cocainep") then {_cocainepPrice = _itemprice}; // The right price should be assigned
	if(_item == "heroinp") then {_heroinpPrice = _itemprice}; // The right price should be assigned
	if(_item == "goldbar") then {_goldbarPrice = _itemprice}; // The right price should be assigned
	
} forEach _rows;


life_market_resources = [

	//Schema: SHORTNAME, Default, Min, Max, changes in action, [Sales multiplied by 1, Purchase multiplied by -1]
	
	["oilp", _oilpPrice, 3500, 7000, 3, 1, 
		[ 
			["diamondc",1], 
			["iron_r",1],
			["copper_r",1],
			["salt_r",1],
			["cement",1],
			["glass",1] 
		] 
	],
	
	["iron_r", _iron_rPrice, 2250, 5500, 3, 1,  
		[ 
			["diamondc",1], 
			["oilp",1],
			["copper_r",1],
			["salt_r",1],
			["cement",1],
			["glass",1] 
		] 
	],
	
	["diamondc", _diamondcPrice, 2000, 6500, 5, 2, 
		[ 
			["oilp",1],
			["iron_r",1],
			["copper_r",1],
			["salt_r",1],
			["cement",1],
			["glass",1] 
		] 
	],
	
	["copper_r", _copper_rPrice, 1300, 5000, 2, 1, 
		[ 
			["diamondc",1], 
			["oilp",1],
			["iron_r",1],
			["salt_r",1],
			["cement",1],
			["glass",1] 
		] 
	],

	["goldbar", _goldbarPrice, 75000, 150000, 2, 1, 
		[ 
			["diamondc",1], 
			["iron_r",1],
			["copper_r",1]
		] 
	],
	
	["salt_r", _salt_rPrice, 1200, 3350, 2, 1, 
		[ 
			["diamondc",1], 
			["oilp",1],
			["iron_r",1],
			["copper_r",1],
			["cement",1],
			["glass",1] 
		] 
	],
	
	["glass", _glassPrice, 1200, 4000, 2, 1, 
		[ 
			["diamondc",1], 
			["oilp",1],
			["iron_r",1],
			["copper_r",1],
			["salt_r",1],
			["cement",1]
		] 
	],
	
	["cement", _cementPrice, 3000, 6000, 2, 1, 
		[ 
			["diamondc",1], 
			["oilp",1],
			["iron_r",1],
			["copper_r",1],
			["salt_r",1],
			["glass",1]
		] 
	],

	///////////////////////////////////
	
	["turtle", _turtlePrice, 8000, 16000, 20, 18,  
		[ 
			["marijuana",1], 
			["cocainep",1],
			["heroinp",1]
		] 
	],
	
	["marijuana", _marijuanaPrice, 3500, 5500, 7, 5,   
		[ 
			["turtle",1], 
			["cocainep",1],
			["heroinp",1],
			["turtle",1]
		] 
	],
	
	["cocainep", _cocainepPrice, 3000, 9300, 11, 8,   
		[ 
			["marijuana",1], 
			["heroinp",1],
			["turtle",1]
		] 
	],
	
	["heroinp", _heroinpPrice, 3000, 7500, 11, 8,   
		[ 
			["marijuana",1], 
			["cocainep",1],
			["turtle",1]
		] 
	]
];


publicVariable "life_market_resources";

diag_log "------------- Life Market Resources -------------";
diag_log format["Result: %1",life_market_resources];
diag_log "------------------------------------------------";

life_market_shortnames = [];

{
	life_market_shortnames set [count life_market_shortnames, _x select 0];
}
foreach life_market_resources;

publicVariable "life_market_shortnames";

life_market_prices = [];
{
	life_market_prices set [count life_market_prices, [_x select 0, _x select 1, 0, 0] ];
}
foreach life_market_resources;
	
publicVariable "life_market_prices";

systemChat "Market Prices Generated!";