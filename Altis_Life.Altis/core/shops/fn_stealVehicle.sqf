/*
File: fn_stealVehicle.sqf
Author: Kevin Webb
Description: Allows the player to put a stolen vehicle in his garage.
*/
disableSerialization;
private["_control","_price","_vehicle","_nearVehicles","_color","_check"];
_control = ((findDisplay 39400) displayCtrl 39402);
_price = _control lbValue (lbCurSel _control);
_price = _price*0.65;
if(life_atmcash < _price) exitWith {hint format["Vous devez avoir %1 sur votre compte pour changer les plaques",_price]; };
_vehicle = _control lbData (lbCurSel _control);
_vehicle = call compile format["%1", _vehicle];
_nearVehicles = nearestObjects [getMarkerPos life_chopShop,["LandVehicle","Truck"],25];
_vehicle = _nearVehicles select _vehicle;
if(isNull _vehicle) exitWith {};
_check = false; 
{if(player distance _x < 200 && side _x == west) then { _check = true; };} forEach playableUnits; 
if(_check) exitWith {hint "Les flics sont trop proches de vous !";};
if(typeOf _vehicle in["B_MRAP_01_hmg_F","B_Truck_01_mover_F","B_APC_Wheeled_01_cannon_F"]) exitWith {hint "Vous ne pouvez pas changer les plaques de ce véhicule"; };
_color = 0;
if(typeOf _vehicle in["C_Offroad_01_F"]) then { _color = floor(random 8); };
//while {typeOf _vehicle in["C_Offroad_01_F"] && _color in [6,7,8]} do {_color = floor(random 12); };
if(typeOf _vehicle in["C_Hatchback_01_F"]) then { _color = floor(random 8); };
if(typeOf _vehicle in["C_Hatchback_01_sport_F_RP"]) then { _color = floor(random 8); };
if(typeOf _vehicle in["RDS_Gaz24_Civ_01"]) then { _color = floor(random 3); };
if(typeOf _vehicle in["RDS_Octavia_Civ_01"]) then { _color = floor(random 4); };
if(typeOf _vehicle in["RDS_Ikarus_Civ_01"]) then { _color = floor(random 2); };
if(typeOf _vehicle in["RDS_S1203_Civ_01"]) then { _color = floor(random 6); };
if(typeOf _vehicle in["RDS_Lada_Civ_01"]) then { _color = floor(random 4); };
if(typeOf _vehicle in["RDS_Golf4_Civ_01"]) then { _color = floor(random 6); };
if(typeOf _vehicle in["C_SUV_01_F"]) then { _color = floor(random 7); };
//while {typeOf _vehicle in["C_SUV_01_F"] && _color in[1,4,5]} do { _color = floor(random 8); };
if(typeOf _vehicle in["C_Van_01_box_F"]) then { _color = floor(random 10); };
if(typeOf _vehicle in["C_Van_01_transport_F"]) then { _color = floor(random 10); };
if(typeOf _vehicle in["C_Van_01_fuel_F"]) then { _color = floor(random 15); };
if(typeOf _vehicle in["B_Quadbike_01_F"]) then { _color = floor(random 6); };
if(typeOf _vehicle in["I_Truck_02_covered_F"]) then { _color = floor(random 78); };
if(typeOf _vehicle in["I_Truck_02_transport_F"]) then { _color = floor(random 8); };
if(typeOf _vehicle in["BAF_Offroad_D"]) then { _color = floor(random 5); };
if(typeOf _vehicle in["LandRover_ACR"]) then { _color = floor(random 5); };
if(typeOf _vehicle in["BAF_Offroad_D_HMG"]) then { _color = floor(random 4); };

hint format["Votre compte est débité de %1 € pour cette transaction et le véhicule est désormais votre.",_price];
life_atmcash = life_atmcash - _price;
[1] call SOCK_fnc_updatePartial;
//[[_vehicle],"TON_fnc_vehicleDead",false,false] spawn life_fnc_MP;
sleep 0.05;
[[(getPlayerUID player),playerSide,_vehicle,_color,1],"TON_fnc_vehicleCreate",false,false] spawn life_fnc_MP;
closeDialog 0;
sleep 0.5;
if(!isNil "_vehicle" && !isNull _vehicle) then {
	// deleteVehicle _vehicle;
	[[_vehicle],"life_fnc_delveh",true,false] spawn life_fnc_MP;
};