/*
    File: fn_loadGear.sqf
    Author: Bryan "Tonic" Boardwine
    
    Description:
    Loads saved civilian gear, this is limited for a reason and that's balance.
*/
private["_itemArray","_uniform","_vest","_backpack","_goggles","_headgear","_items","_prim","_seco","_uItems","_bItems","_vItems","_pItems","_hItems","_yItems","_uMags","_bMags","_vMags","_handle","_launcher","_sItems","_oldsys"];
_itemArray = life_gear;
waitUntil {!(isNull (findDisplay 46))};

_handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};

if(count _itemArray == 0) exitWith
{
    switch(playerSide) do {
        case west: {
            [] call life_fnc_copLoadout;
        };
        
        case civilian: {
            [] call life_fnc_civLoadout;
        };

        case independent: {
            [] call life_fnc_medicLoadout;
        };
    };
};
_oldsys = false;
if((count _itemArray) == 17) then {
	_oldsys = true;
	_itemArray set [18, _itemArray select 16];
	_itemArray set [17, []];
	_itemArray set [16, _itemArray select 15];
	_itemArray set [15, _itemArray select 14];
	_itemArray set [14, _itemArray select 13];
	_itemArray set [13, _itemArray select 12];
	_itemArray set [12, _itemArray select 11];
	_itemArray set [11, _itemArray select 10];
	_itemArray set [10, _itemArray select 9];
	_itemArray set [9, _itemArray select 8];
	_itemArray set [8, ""];
};

_uniform = [_itemArray,0,"",[""]] call BIS_fnc_param;
_vest = [_itemArray,1,"",[""]] call BIS_fnc_param;
_backpack = [_itemArray,2,"",[""]] call BIS_fnc_param;
_goggles = [_itemArray,3,"",[""]] call BIS_fnc_param;
_headgear = [_itemArray,4,"",[""]] call BIS_fnc_param;
_items = [_itemArray,5,[],[[]]] call BIS_fnc_param;
_prim = [_itemArray,6,"",[""]] call BIS_fnc_param;
_seco = [_itemArray,7,"",[""]] call BIS_fnc_param;
_launcher = [_itemArray,8,"",[""]] call BIS_fnc_param;
_uItems = [_itemArray,9,[],[[]]] call BIS_fnc_param;
_uMags = [_itemArray,10,[],[[]]] call BIS_fnc_param;
_bItems = [_itemArray,11,[],[[]]] call BIS_fnc_param;
_bMags = [_itemArray,12,[],[[]]] call BIS_fnc_param;
_vItems = [_itemArray,13,[],[[]]] call BIS_fnc_param;
_vMags = [_itemArray,14,[],[[]]] call BIS_fnc_param;
_pItems = [_itemArray,15,[],[[]]] call BIS_fnc_param;
_hItems = [_itemArray,16,[],[[]]] call BIS_fnc_param;
_sItems = [_itemArray,17,[],[[]]] call BIS_fnc_param;
_yItems = [_itemArray,18,[],[[]]] call BIS_fnc_param;

if(_goggles != "") then {_handle = [_goggles,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};};
if(_headgear != "") then {_handle = [_headgear,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};};
if(_uniform != "") then {_handle = [_uniform,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};};
if(_vest != "") then {_handle = [_vest,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};};
if(_backpack != "") then {_handle = [_backpack,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};};

_items2 = [];
_uItems2 = [];
_vItems2 = [];
_bItems2 = [];

if(life_tfrreboot) then {
	_TFRclassname = ["tf_pnr1000a","tf_anprc154","tf_rf7800str","tf_fadak","tf_anprc148jem","tf_anprc152","tf_mr3000","tf_anprc155","tf_rt1523g","tf_mr6000l","tf_anarc164","tf_anarc210"];
	if(count _uItems > 0) then {
		{
			_itemacheckfind = "";
			_itemacheck = _x;
			{
				if([_itemacheck,_x] call KRON_StrInStr) exitWith {
					_itemacheckfind = _x;
				};
			} forEach _TFRclassname;
			if(_itemacheckfind != "") then {
				_uItems2 set [count(_uItems2), _itemacheckfind];
			}
			else{
				_uItems2 set [count(_uItems2), _itemacheck];
			};
		} foreach _uItems;
	};
	if(count _bItems > 0) then {
		{
			_itemacheckfind = "";
			_itemacheck = _x;
			{
				if([_itemacheck,_x] call KRON_StrInStr)  exitWith {
					_itemacheckfind = _x;
				};
			} forEach _TFRclassname;
			if(_itemacheckfind != "") then {
				_bItems2 set [count(_bItems2), _itemacheckfind];
			}
			else{
				_bItems2 set [count(_bItems2), _itemacheck];
			};
		} foreach _bItems;
	};
	if(count _vItems > 0) then {
		{
			_itemacheckfind = "";
			_itemacheck = _x;
			{
				if([_itemacheck,_x] call KRON_StrInStr)  exitWith {
					_itemacheckfind = _x;
				};
			} forEach _TFRclassname;
			if(_itemacheckfind != "") then {
				_vItems2 set [count(_vItems2), _itemacheckfind];
			}
			else{
				_vItems2 set [count(_vItems2), _itemacheck];
			};
		} foreach _vItems;
	};
	if(count _items > 0) then {
		{
			_itemacheckfind = "";
			_itemacheck = _x;
			{
				if([_itemacheck,_x] call KRON_StrInStr)  exitWith {
					_itemacheckfind = _x;
				};
			} forEach _TFRclassname;
			if(_itemacheckfind != "") then {
				_items2 set [count(_items2), _itemacheckfind];
			}
			else{
				_items2 set [count(_items2), _itemacheck];
			};
		} foreach _items;
	};
	[] call life_fnc_getHLC;
	[[getPlayerUID player],"TON_fnc_tfrreboot",serverhc,false] spawn life_fnc_MP;
}else{
_items2 = _items;
_uItems2 = _uItems;
_bItems2 = _bItems;
_vItems2 = _vItems;
};

// {_handle = [_x,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};} foreach _items;
{_handle = [_x,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};} foreach _items2;

// {player addItemToUniform _x;} foreach (_uItems);
{player addItemToUniform _x;} foreach (_uItems2);
{(uniformContainer player) addItemCargoGlobal [_x,1];} foreach (_uMags);
// {player addItemToVest _x;} foreach (_vItems);
{player addItemToVest _x;} foreach (_vItems2);
{(vestContainer player) addItemCargoGlobal [_x,1];} foreach (_vMags);
// {player addItemToBackpack _x;} foreach (_bItems);
{player addItemToBackpack _x;} foreach (_bItems2);
{(backpackContainer player) addItemCargoGlobal [_x,1];} foreach (_bMags);
life_maxWeight = 100;
if(_oldsys) then {
	{
		if(!(_item in ["life_inv_handcuffs","life_inv_handcuffkeys"])) then {
			_item = [_x,1] call life_fnc_varHandle;
			[true,_item,1] call life_fnc_handleInv;
		};
	} foreach (_yItems);
} else {
	{
		_item = _x select 0;
		if(!(_item in ["life_inv_handcuffs","life_inv_handcuffkeys"])) then {
			_item = [_item,1] call life_fnc_varHandle;
			[true,_item,_x select 1,true] call life_fnc_handleInv;
		};
	} foreach (_yItems);
};
life_maxWeight = 24;

//Primary & Secondary (Handgun) should be added last as magazines do not automatically load into the gun.
if(_prim != "") then {_handle = [_prim,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};};
if(_seco != "") then {_handle = [_seco,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};};
if(_launcher != "") then {_handle = [_launcher,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};};

{
    if (_x != "") then {
        player addPrimaryWeaponItem _x;
    };
} foreach (_pItems);
{
    if (_x != "") then {
        player addHandgunItem _x;
    };
} foreach (_hItems);
{
    if (_x != "") then {
        player addSecondaryWeaponItem _x;
    };
} foreach (_sItems);

if(playerSide == independent && {uniform player == "U_Rangemaster"}) then {
	[[player,0,"altisrpfr\textures\medic_uniform.paa"],"life_fnc_setTexture",true,false] spawn life_fnc_MP;
};
if(uniform player == "U_B_CombatUniform_mcam" OR {uniform player == "U_B_CombatUniform_mcam_vest"}) then {
	[[player,0,"altisrpfr\textures\clothing1_co.paa"],"life_fnc_setTexture",true,false] spawn life_fnc_MP;
};
[] call life_fnc_updateClothing;