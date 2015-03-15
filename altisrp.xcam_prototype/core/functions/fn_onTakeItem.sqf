/*
	File: fn_onTakeItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Blocks the unit from taking something they should not have.
*/
private["_unit","_container","_item","_house","_close","_houseCfg","_locked"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_container = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
_item = [_this,2,"",[""]] call BIS_fnc_param;

if(isNull _unit OR _item == "") exitWith {}; //Bad thingies?

// if((typeOf _container) in ["stone_gate_f"]) exitWith {}; 


switch(playerSide) do
{
	case west: {}; //Blah
	case civilian: {
		//Currently stoping the civilians from taking the indep clothing from medics.
		if(_item in ["U_Rangemaster"]) then {
			[_item,false,false,false,false] call life_fnc_handleItem;
		};
	};
	case independent: {};
};


// if((uniform player) in ["U_Rangemaster","U_B_CombatUniform_mcam","U_B_CombatUniform_mcam_vest"]) then {
[] call life_fnc_updateClothing;
// };


// BOX

// diag_log format ["TYPETAKE %1 - %2",typeof _container,_item];
if(playerSide != west) then{
	if((typeOf _container) in ["Box_IND_Grenades_F","B_supplyCrate_F"]) exitWith {
		_house = nearestBuilding (getPosATL player);
		// add
		_houseCfg = [(typeOf _house)] call life_fnc_houseConfig;
		if(count _houseCfg == 0) then
		{
			_house = (nearestObjects[(getPosATL player),["House_F"],20] select 0);
		};
		
		_locked = _house getVariable ["locked",nil];
		// diag_log format["%1 - %2 - %3","CLOSETAKE3",!(_house in life_vehicles),_locked];
		_close = false;
		if(isNil "_locked") then {_close = true;};
		if((typeof _house == "Land_Stone_Gate_F") or _close or (!(_house in life_vehicles) && {(_house getVariable ["locked",false])})) then {
			// diag_log hint "BLAAAAAAAAAAAAAAAAAA";
			[_container,_item] spawn {
				_container = _this select 0;
				_item = _this select 1;
				// diag_log format ["TYPETAKE 2 %1 - %2",typeof _container,_item];

				// waitUntil {!isNull (findDisplay 602)};
				closeDialog 0;
				sleep 0.01;
				closeDialog 0;
				// diag_log format ["TYPETAKE 3 %1 - %2",typeof _container,_item];

				[_item,false,false,false,false] call life_fnc_handleItem;
				_container addItemCargoGlobal [_item,1];
				/*_fin = 0;
				if ( isClass (configFile >> "CFGweapons" >> _item)) then {
					_container addItemCargoGlobal [_item,1];
					_fin = 1;
				};
				if ( isClass (configFile >> "CFGMagazines" >> _item)) then {
					_container addItemCargoGlobal [_item,1];
					_fin = 1;
				};
				if ( isClass (configFile >> "CFGMagazines" >> _item)) then {
					_container addItemCargoGlobal [_item,1];
					_fin = 1;
				};
				if(_fin == 0)then {
					_container addItemCargoGlobal [_item,1];
				};*/
				[] call SOCK_fnc_updateRequest;
				[[profileName,"Glitch Vol dans coffre"],"SPY_fnc_notifyAdmins",true,false] spawn life_fnc_MP;
				sleep 1;
				failMission "SpyGlass";
				false;
			};
		};
	};
};
	
if(playerSide != west) then{
	if(_container isKindOf "LandVehicle" OR _container isKindOf "Ship" OR _container isKindOf "Air") exitWith {
		if(!(_container in life_vehicles) && {(locked _container) == 2}) exitWith {
			hint localize "STR_MISC_VehInventory";
			[_container,_item] spawn {
				_container = _this select 0;
				_item = _this select 1;
				// waitUntil {!isNull (findDisplay 602)};
				closeDialog 0;
				sleep 0.01;
				closeDialog 0;
				
				[_item,false,false,false,false] call life_fnc_handleItem;
				_container addItemCargoGlobal [_item,1];
				
				[] call SOCK_fnc_updateRequest;
				[[profileName,"Glitch Vol dans véhicule"],"SPY_fnc_notifyAdmins",true,false] spawn life_fnc_MP;
				sleep 1;
				failMission "SpyGlass";
				false;
			};
		};
	};
};