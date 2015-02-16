/*
	File: fn_chopShopSell.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sells the selected vehicle off.
*/
disableSerialization;
private["_control","_price","_vehicle","_nearVehicles","_price2"];
_control = ((findDisplay 39400) displayCtrl 39402);
_price = _control lbValue (lbCurSel _control);
_vehicle = _control lbData (lbCurSel _control);
_vehicle = call compile format["%1", _vehicle];
_nearVehicles = nearestObjects [getMarkerPos life_chopShop,["LandVehicle","Truck"],15];
_vehicle = _nearVehicles select _vehicle;
if(isNull _vehicle) exitWith {};
closeDialog 0;

[_vehicle,_price] spawn {
	private["_price","_price2","_vehicle","_displayName","_upp","_ui","_progress","_pgText","_cP"];
	_vehicle = _this select 0;
	_price = _this select 1;
	_price2 = life_cash + _price;
	life_interrupted = false;

	life_action_inUse = true;
	_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
	_upp = format["Recel du %1",_displayName];
	//Setup our progress bar.
	disableSerialization;
	5 cutRsc ["life_progress","PLAIN"];
	_ui = uiNameSpace getVariable "life_progress";
	_progress = _ui displayCtrl 38201;
	_pgText = _ui displayCtrl 38202;
	_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
	_progress progressSetPosition 0.01;
	_cP = 0.01;
	//[[player, "action_repair",15],"life_fnc_playSound",true,false] spawn life_fnc_MP;
	while{true} do
	{
		if(animationState player != "InBaseMoves_repairVehicleKnl") then {
			[[player,"InBaseMoves_repairVehicleKnl"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
			player playMoveNow "InBaseMoves_repairVehicleKnl";
		};
		sleep 0.27;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(!alive player) exitWith {};
		if(isNull _vehicle) exitWith {};
		if(player != vehicle player) exitWith {};
		if(life_interrupted) exitWith {};
	};

	life_action_inUse = false;
	5 cutText ["","PLAIN"];
	player playActionNow "stop";
	if(life_interrupted) exitWith {life_interrupted = false; titleText["Action annulée","PLAIN"]; life_action_inUse = false;};
	if(player != vehicle player) exitWith {titleText["Vous devez être à l'extérieur du véhicule pour le réparer. Désolé que ça vous empêche d'exploiter le système !","PLAIN"]; life_action_inUse = false;};
	if(player distance _vehicle > 15)  exitWith {titleText["Le véhicule doit être à moins de 15 mètres !","PLAIN"]; life_action_inUse = false;};
	[] call life_fnc_getHLC;
	[[player,_vehicle,_price,_price2,havena_id],"TON_fnc_chopShopSell",serverhc,false] spawn life_fnc_MP;
	// titleText["Vous avez recelé le véhicule.","PLAIN"];
};

/*hint localize "STR_Shop_ChopShopSelling";
life_action_inUse = true;
[] call life_fnc_getHLC;
[[player,_vehicle,_price,_price2,havena_id],"TON_fnc_chopShopSell",serverhc,false] spawn life_fnc_MP;
closeDialog 0;*/