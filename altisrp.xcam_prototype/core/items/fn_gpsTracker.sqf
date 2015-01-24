/*
	File: fn_gpsTracker.sqf
	Author: Poseidon
	
	Description: Attaches a gps tracker to selected vehicle
*/
private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _unit) exitWith {};
if(!(_unit isKindOf "AllVehicles")) exitWith {hint "Vous ne pouvez pas utiliser la puce GPS sur ceci."};
if(player distance _unit > 4) exitWith {hint "Vous devez être plus proche pour poser la puce !"};
if(!([false,"gpstracker",1] call life_fnc_handleInv)) exitWith {};
closeDialog 0;

life_action_inUse = true;
player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
sleep 4;
life_action_inUse = false;
if(player distance _unit > 4) exitWith {titleText["Vous n'êtes pas à proximité d'un véhicule!","PLAIN"];};
titleText["Vous avez fixé une puce GPS à ce véhicule.","PLAIN"];

[_unit] spawn {
	_veh = _this select 0;
	_markerName = format["%1_gpstracker",_veh];
	_marker = createMarkerLocal [_markerName, visiblePosition _veh];
	_marker setMarkerColorLocal "ColorRed";
	_marker setMarkerTypeLocal "Mil_destroy";
	_marker setMarkerTextLocal "Puce GPS sur "+getText(configFile >> "CfgVehicles" >> typeof _veh >> "displayName");
	_marker setMarkerPosLocal getPos _veh;
	while {true} do {
		if(not alive _veh) exitWith {deleteMarkerLocal _markerName;};
		_marker setMarkerPosLocal getPos _veh;
		sleep 0.5;
	};
};