/*
	File: fn_airsoft.sqf
	Author: Youri
	
	Description:
	Airsoft animation
*/
private["_unit","_shooter","_curWep","_curMags","_attach"];
_unit = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_shooter = [_this,1,Objnull,[Objnull]] call BIS_fnc_param;
if(isNull _unit OR isNull _shooter) exitWith {};

if(_shooter isKindOf "Man" && alive player) then
{
	if(!life_isOut) then
	{
		life_isOut = true;
		/*_curWep = currentWeapon player;
		_curMags = magazines player;
		_attach = if(primaryWeapon player != "") then {primaryWeaponItems _unit} else {[]};
		{player removeMagazine _x} foreach _curMags;
		player removeWeapon _curWep;
		player addWeapon _curWep;
		if(count _attach != 0 && primaryWeapon _unit != "") then
		{
			{
				_unit addPrimaryWeaponItem _x;
			} foreach _attach;
		};
		if(count _curMags != 0) then
		{
			{player addMagazine _x;} foreach _curMags;
		};*/
		
		[[_unit],"life_fnc_hitSound",true,false] spawn life_fnc_MP;
		_obj = "Land_ClutterCutter_small_F" createVehicle (getPosATL _unit);
		_obj setPosATL (getPosATL _unit);
		[[player,"AinjPfalMstpSnonWnonDf_carried_fallwc"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
		_unit attachTo [_obj,[0,0,0]];
		disableUserInput true;
		sleep 15;
		if(animationState player == "AinjPfalMstpSnonWnonDf_carried_fallwc") then {
			[[player,"amovppnemstpsraswrfldnon"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
		};
		detach player;
		life_isOut = false;
		deleteVehicle _obj;
		disableUserInput false;
	};
}
else
{
	life_isOut = false;
};