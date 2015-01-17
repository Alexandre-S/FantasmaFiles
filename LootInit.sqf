// if(isServer)then{
private ["_probability","_distanceToSpawn","_sleepTimer","_lootArray","_cfgArray","_item","_positionArray","_buildingArray","_element","_newMarker","_loot"]; 
_probability=20;
_distanceToSpawn = 200;
_sleepTimer = 60; 
_debug = true;


// Set Weapon loot: Primary weapons, secondary weapons, Sidearms.
weaponsLoot=	["arifle_MX_F","arifle_Katiba_F","arifle_Mk20_F","arifle_MXM_F","arifle_MXC_F","arifle_SDAR_F","arifle_TRG20_F","arifle_TRG21_F"];
// Set items: Weapon attachments, first-aid, Binoculars
itemsLoot=		["Rangefinder","Binocular","ToolKit","muzzle_snds_M","muzzle_snds_L","muzzle_snds_H_SW","muzzle_snds_H_MG","muzzle_snds_H","muzzle_snds_B","optic_Arco","optic_Aco","optic_Holosight","optic_Nightstalker","optic_Yorris","optic_tws","FirstAidKit","muzzle_snds_acp"];
// Set Clothing: Hats, Helmets, Uniforms
clothesLoot=	["H_Hat_camo","H_HelmetB_light","U_I_pilotCoveralls","H_Bandanna_camo","U_B_CombatUniform_mcam","U_B_CombatUniform_mcam_tshirt","U_BG_Guerilla1_1","U_BG_Guerilla2_1","U_C_Poloshirt_burgundy","U_I_CombatUniform"];
// Set Vests: Any vests
vestsLoot=		["V_Chestrig_blk","V_BandollierB_blk","V_HarnessO_brn","V_PlateCarrier1_blk","V_Press_F","V_TacVest_blk"];
// Set Backpacks: Any packpacks
backpacksLoot=	["B_AssaultPack_blk","B_AssaultPack_cbr","B_AssaultPack_khk","B_Carryall_cbr","B_Carryall_khk","B_Carryall_mcamo","B_FieldPack_blk","B_FieldPack_cbr","B_FieldPack_khk"];

// Exclude buildings from loot spawn. Use 'TYPEOF' to find building name
_exclusionList=	["Land_Pier_F","Land_Pier_small_F","Land_NavigLight","Land_LampHarbour_F"];

while { true } do  
{
    _positionArray = []; 
    _buildingArray = nearestObjects [player, ["house"], _distanceToSpawn];
	
	{
		_house=_X;
		if (!(typeOf _house in _exclusionList || _house getVariable["house_owned",false])) then
		{
			_positionArray pushBack ([_x] call BIS_fnc_buildingPositions);
		};
	}foreach _buildingArray;
	

    {
        _element = _forEachIndex; 
        {
			_item="Sign_Arrow_Blue_F";
            // if (({(typeOf _x) == "Sign_Arrow_Blue_F"} count (nearestObjects[player,["Sign_Arrow_Blue_F"], 1])) == 0) then 
			if ((count (nearestObjects[_x,[_item,"groundweaponholder"], 5])) == 0) then
            {
				if (_probability > random 100) then
				{
					null=[_x,false] execVM "spawnloot.sqf";
					_loot = createVehicle [_item, _x, [], 0, "CAN_COLLIDE"]; 
					//=============
					if ( _debug ) then  
					{ 
						_newMarker = createMarker [format ["%1_%2", _element, _forEachIndex], _x]; 
						_newMarker setMarkerShape "ICON"; 
						_newMarker setMarkerType "mil_dot"; 
						_newMarker setMarkerColor "ColorRed";
						diag_log format ["%1 @ %2", _item, _x]; 
					} else { 
						_newMarker = ""; 
					}; 
					 
					 
					[_newMarker, _loot, _distanceToSpawn] spawn  
					{
						waitUntil {player distance (_this select 1) > (_this select 2)}; 
						deleteVehicle (_this select 1); 
						deleteMarker (_this select 0); 
					};
					//=============
				};
            }; 
        }forEach _x; 
    }forEach _positionArray; 
  sleep _sleepTimer; 
};