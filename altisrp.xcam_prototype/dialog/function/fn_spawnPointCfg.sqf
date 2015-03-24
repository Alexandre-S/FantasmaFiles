/*
	File: fn_spawnPointCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration for available spawn points depending on the units side.
	
	Return:
	[Spawn Marker,Spawn Name,Image Path]
*/
private["_side","_return","_pos","_house","_houseCfg","_houseName"];
_side = [_this,0,civilian,[civilian]] call BIS_fnc_param;

//Spawn Marker, Spawn Name, PathToImage
switch (_side) do
{
	case west:
	{
		_return = [
			["cop_spawn_1","Base principale","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"],
			["cop_spawn_2","Base secondaire","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"],
			["cop_spawn_3","Base avancée","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"],
			["cop_spawn_5","QG Maritime 1","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"],
			["cop_spawn_4","QG Maritime 2","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"]
		];
	};
	
	case civilian:
	{
		_return = [
			["civ_spawn_1","East City","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["civ_spawn_2","West City","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["civ_spawn_3","Coast Town","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["civ_spawn_4","Port Town","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
		];
		
		if(count life_houses > 0) then {
			{
				_pos = call compile format["%1",_x select 0];
				_house = nearestBuilding _pos;
				// add
				_houseCfg = [(typeOf _house)] call life_fnc_houseConfig;
				if(count _houseCfg == 0) then
				{
					_house = (nearestObjects[_pos,["House_F"],20] select 0);
				};
				
				_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
				
				_return pushBack [format["house_%1",_house getVariable "uid"],_houseName,"\a3\ui_f\data\map\MapControl\lighthouse_ca.paa"];
			} foreach life_houses;
		};	
	};
	
	case independent: {
		_return = [
			["medic_spawn_1","Hopital Principal","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
			["medic_spawn_2","Hopital Secondaire","\a3\ui_f\data\map\MapControl\hospital_ca.paa"]
			// ["medic_spawn_3","Hopital de Pygros","\a3\ui_f\data\map\MapControl\hospital_ca.paa"]
		];
	};
};

_return;