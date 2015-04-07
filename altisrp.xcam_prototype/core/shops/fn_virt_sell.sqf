#include <macro.h>
/*
	File: fn_virt_sell.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sell a virtual item to the store / shop
*/
if((time - life_action_delay) < 2) exitWith {hint "Vous ne pouvez pas effectuer autant d'opération en si peu de temps.. merci de patienter"};
life_action_delay = time;
private["_type","_index","_price","_var","_amount","_name","_marketprice","_weight","_index2","_array","_ind","_val","_valdeja","_trop"];
if((lbCurSel 2402) == -1) exitWith {};
_type = lbData[2402,(lbCurSel 2402)];
_index = [_type,__GETC__(sell_array)] call life_fnc_index;
if(_index == -1) exitWith {};
_price = (__GETC__(sell_array) select _index) select 1;
_var = [_type,0] call life_fnc_varHandle;
_index2 = [_type,sell_array2] call life_fnc_index;
if(_index2 != -1) then { _price = _price * ((sell_array2 select _index2) select 1); };
/*_marketprice = [_type] call life_fnc_marketGetSellPrice;
if(_marketprice != -1) then { _price = _marketprice; };*/
//vente donator
_price = ceil(_price + (((__GETC__(life_donator) * 5) / 100) * _price));

_amount = ctrlText 2405;
if(!([_amount] call life_fnc_isnumber)) exitWith {hint localize "STR_Shop_Virt_NoNum";};
_amount = parseNumber (_amount);
if(_amount > (missionNameSpace getVariable _var)) exitWith {hint localize "STR_Shop_Virt_NotEnough"};

_trop = false;
if(life_shop_type == "heroin") then
{
	_array = life_shop_npc getVariable["sellers",[]];
	_ind = [getPlayerUID player,_array] call life_fnc_index;
	if(_ind != -1) then
	{
		_valdeja = (_array select _ind) select 2;
		if(_valdeja>25) then {
			_trop = true;
		} else {
			if((_valdeja+_amount)>25) then {
				_amount = (25-_valdeja);
			};
		};
	};
};
if(_trop) exitWith {hint localize "STR_Shop_Virt_Trop"};

if(_index2 != -1) then {
// if!(_type in ["water","coffee","donuts","tbacon","lockpick","pickaxe","redgull","fuelF","spikeStrip","pcp","storage1","storage2","nitro","redburger","soda","apple","rabbit","peach"]) then {
	_weight = ([_type] call life_fnc_itemWeight) * _amount;
	[] call life_fnc_getHLC;
	[[_index2,_weight],"TON_fnc_updateSAM",serverhc,false] spawn life_fnc_MP;
};

_price = (_price * _amount);
if(playerSide == west) then { _price = 1; };
_name = [_var] call life_fnc_vartostr;
if(([false,_type,_amount] call life_fnc_handleInv)) then
{
	hint format[localize "STR_Shop_Virt_SellItem",_amount,_name,[_price] call life_fnc_numberText];
	life_cash = life_cash + _price;
	/*if(_marketprice != -1) then 
	{ 
		[_type, _amount] spawn
		{
			sleep 60;
            [_this select 0,_this select 1] call life_fnc_marketSell;
			[] call life_fnc_getHLC;
            [[_this select 0,_this select 1],"DB_fnc_marketInsertTimes",serverhc,false] call life_fnc_MP; // Sends the shortname and amount of the sold item to the server
		};
	};*/
	playSound "caching";
	[] call life_fnc_virt_update;
	
};

if(life_shop_type == "heroin") then
{
	// _array = life_shop_npc getVariable["sellers",[]];
	// _ind = [getPlayerUID player,_array] call life_fnc_index;
	if(_ind != -1) then
	{
		_val = (_array select _ind) select 2;
		_val = _val + _amount;
		_array set[_ind,[getPlayerUID player,profileName,_val]];
		life_shop_npc setVariable["sellers",_array,true];
	}
	else
	{
		_array pushBack [getPlayerUID player,profileName,_amount];
		life_shop_npc setVariable["sellers",_array,true];
	};

[0] call SOCK_fnc_updatePartial;
[3] call SOCK_fnc_updatePartial;