#include <macro.h>
/*
	File: fn_copSearch.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Returns information on the search.
*/
life_action_inUse = false;
private["_civ","_invs","_atmcash","_cash"];
_civ = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_invs = [_this,1,[],[[]]] call BIS_fnc_param;
// _robber = [_this,2,false,[false]] call BIS_fnc_param;
// _guns = _this select 3;
// _atmcash = _this select 4;
_cash = _this select 2;
if(isNull _civ) exitWith {};

// _totalThune = _atmcash + _cash;

// _illegal = 0;
_inv = "";
if(count _invs > 0) then
{
	{
		// _inv = _inv + format["%1 %2<br/>",_x select 1,[([_x select 0,0] call life_fnc_varHandle)] call life_fnc_varToStr];
		_inv = _inv + format["%2 [x%1]<br/>",_x select 1,[_x select 0] call life_fnc_varToStr];
		/*_index = [_x select 0,__GETC__(sell_array)] call life_fnc_index;
		if(_index != -1) then
		{
			_illegal = _illegal + ((_x select 1) * ((__GETC__(sell_array) select _index) select 1));
		};*/
	} foreach _invs;
	
	/*if(_illegal > 6000) then
	{
		[] call life_fnc_getHLC;
		[[getPlayerUID _civ,_civ getVariable["realname",name _civ],"482"],"life_fnc_wantedAdd",serverhc,false] spawn life_fnc_MP;
	};
	[] call life_fnc_getHLC;
	[[getPlayerUID _civ,_civ getVariable["realname",name _civ],"481"],"life_fnc_wantedAdd",serverhc,false] spawn life_fnc_MP;*/
	// [[0,"STR_Cop_Contraband",true,[(_civ getVariable["realname",name _civ]),[_illegal] call life_fnc_numberText]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
}
else
{
	// _inv = localize "STR_Cop_NoIllegal";
	_inv = "Pas d'objets virtuels";
};

// if(!alive _civ || player distance _civ > 5) exitWith {hint format[localize "STR_Cop_CouldntSearch",_civ getVariable["realname",name _civ]]};
if(!alive _civ || player distance _civ > 5) exitWith {hint localize "STR_Cop_CouldntSearch"};
//hint format["%1",_this];
// hint parseText format["<t color='#FF0000'><t size='2'>%1</t></t><br/><t color='#FFD700'><t size='1.5'><br/>" +(localize "STR_Cop_IllegalItems")+ "</t></t><br/>%2<br/><br/><t color='#FFD700'><t size='1.5'>Argent (Cash + DAB)</t></t><br/>%3<br/><br/><t color='#FF0000'><t size='1.5'>Armes</t></t><br/>%4<br/><br/><br/><br/><t color='#FF0000'>%5</t>"
hint parseText format["<t color='#FF0000'><t size='2'>Cible</t></t><br/><t color='#FFD700'><t size='1.5'><br/>Objets virtuels</t></t><br/>%1<br/><br/><t color='#FFD700'><t size='1.5'>Argent</t></t><br/>%2<br/><br/>"
,_inv,_cash];

/*if(_robber) then
{
	[[0,"STR_Cop_Robber",true,[(_civ getVariable["realname",name _civ])]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
};*/