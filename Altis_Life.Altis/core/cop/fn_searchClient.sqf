/*
	File: fn_searchClient.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Searches the player and he returns information back to the player.
*/
private["_cop","_guns","_inv","_var","_val","_robber","_cfg","_licenses"];
_cop = [_this,0,Objnull,[objNull]] call BIS_fnc_param;
if(isNull _cop) exitWith {};
_inv = [];
_robber = false;
//Illegal items
{
	_var = [_x select 0,0] call life_fnc_varHandle;
	_val = missionNamespace getVariable _var;
	if(_val > 0) then
	{
		_inv pushBack [_x select 0,_val];
		[false,(_x select 0),_val] call life_fnc_handleInv;
	};
} foreach life_illegal_items;

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

if(!life_use_atm) then 
{
	life_cash = 0;
	_robber = true;
};

[[player,_inv,_licenses,_robber,_guns, life_atmcash, life_cash],"life_fnc_copSearch",_cop,false] spawn life_fnc_MP;