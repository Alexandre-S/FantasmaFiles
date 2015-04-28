/*
	File: fn_searchClient.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Searches the player and he returns information back to the player.
*/
private["_cop","_inv","_var","_val"];
_cop = [_this,0,Objnull,[objNull]] call BIS_fnc_param;
if(isNull _cop) exitWith {};
// _guns = [];
_inv = [];
// _robber = false;
//items
{
	// _var = [_x,1] call life_fnc_varHandle;
	_val = missionNamespace getVariable _x;
	if(_val > 0) then
	{
		// _inv pushBack [_x select 0,_val];
		_inv pushBack [_x,_val];
		// [false,(_x select 0),_val] call life_fnc_handleInv;
	};
} foreach life_inv_items;

/*
// diag_log format["DEBUGSEARCHCLIENT1 %1",_inv];
// Check for hidden weapons.
if (uniform player != "") then {
	{
		_cfg = [_x] call life_fnc_fetchCfgDetails;
		if(count _cfg > 0) then {
			if((_cfg select 6) == "CfgWeapons") then {
				if((_cfg select 4) in [1,2,4,5]) then {
					_guns set[count _guns,(_cfg select 1)];
				};
			};
		};
	} forEach (uniformItems player);
};
// diag_log format["DEBUGSEARCHCLIENT2 %1",_inv];
if (vest player != "") then {
	{
		_cfg = [_x] call life_fnc_fetchCfgDetails;
		if(count _cfg > 0) then {
			if((_cfg select 6) == "CfgWeapons") then {
				if((_cfg select 4) in [1,2,4,5]) then {
					_guns set [count _guns, (_cfg select 1)];
				};
			};
		};
	} forEach (vestItems player);
};
// diag_log format["DEBUGSEARCHCLIENT3 %1",_inv];
if (backpack player != "") then {
	{
		_cfg = [_x] call life_fnc_fetchCfgDetails;
		if(count _cfg > 0) then {
			if((_cfg select 6) == "CfgWeapons") then {
				if((_cfg select 4) in [1,2,4,5]) then {
					_guns set[count _guns,(_cfg select 1)];
				};
			};
		};
	} forEach (backpackItems player);
};

// diag_log format["DEBUGSEARCHCLIENT4 %1",_inv];
if(!life_use_atm) then 
{
	life_cash = 0;
	_robber = true;
};

if((count _guns) == 0) then { _guns = "Aucune arme trouvée"; };
*/
hint "Une personne fouille vos objets/vos poches";
// [[player,_inv,_robber,_guns, life_atmcash, life_cash],"life_fnc_copSearch",_cop,false] spawn life_fnc_MP;
[[player,_inv, life_cash],"life_fnc_copSearch",_cop,false] spawn life_fnc_MP;