#include <macro.h>
/*
	File: fn_clothing_cop.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master config file for Cop clothing store.
*/
private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Friperie de l'ONU"];

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
	{
		_ret pushBack ["U_Rangemaster","Cop Uniform",0];
		// Grade Brigadier
		if(__GETC__(life_coplevel) >= 2) then
		{
			_ret pushBack ["U_B_CombatUniform_mcam",nil,0];
			_ret pushBack ["U_B_CombatUniform_mcam_vest",nil,0];
		};
		// Grade Lieutenant
		if(__GETC__(life_coplevel) >= 3) then
		{
			_ret pushBack ["U_B_HeliPilotCoveralls",nil,0];
			_ret pushBack ["U_B_CombatUniform_mcam_tshirt",nil,0];
		};
		// Grade Capitaine
		if(__GETC__(life_coplevel) >= 4) then
		{
			_ret pushBack ["U_B_GhillieSuit",nil,0];
			_ret pushBack ["U_B_CombatUniform_mcam_worn",nil,0];
			_ret pushBack ["U_B_survival_uniform",nil,0];
			_ret pushBack ["U_BG_Guerilla2_1",nil,0];
			_ret pushBack ["U_BG_Guerilla2_2",nil,0];
			_ret pushBack ["U_BG_Guerilla2_3",nil,0];
			_ret pushBack ["U_BG_Guerilla3_1",nil,0];
			_ret pushBack ["U_BG_Guerilla3_2",nil,0];
			_ret pushBack ["sab_UN_Officer_Clothing",nil,0];			
		};
	};
	
	//Hats
	case 1:
	{
		_ret pushBack ["H_MilCap_blue",nil,0];
		_ret pushBack ["sab_UN_cap",nil,0];
		if(__GETC__(life_coplevel) >= 2) then
		{
			_ret pushBack ["H_Booniehat_mcamo",nil,0];
			_ret pushBack ["H_HelmetB_plain_mcamo",nil,0];
			_ret pushBack ["sab_UN_capHP",nil,0];
			_ret pushBack ["sab_UN_Helmet",nil,0];
		};
		if(__GETC__(life_coplevel) >= 3) then
		{
			_ret pushBack ["H_Cap_headphones",nil,0];
			_ret pushBack ["H_HelmetB_light",nil,0];
			_ret pushBack ["H_HelmetSpecB_paint2",nil,0];
			_ret pushBack ["H_PilotHelmetHeli_B",nil,0];
			_ret pushBack ["H_HelmetCrew_B",nil,0];
		};
		// Grade Capitaine
		if(__GETC__(life_coplevel) >= 4) then
		{
			_ret pushBack ["H_Beret_blk",nil,0];
			_ret pushBack ["H_Beret_02",nil,0];
			_ret pushBack ["H_Beret_Colonel",nil,0];
			_ret pushBack ["H_Booniehat_tan",nil,0];
			_ret pushBack ["H_Hat_grey",nil,0];
			_ret pushBack ["H_Hat_tan",nil,0];
			_ret pushBack ["H_Hat_brown",nil,0];
			_ret pushBack ["H_Cap_blu",nil,0];
			_ret pushBack ["H_Cap_grn",nil,0];
			_ret pushBack ["H_Cap_grn_BI",nil,0];
			_ret pushBack ["sab_UN_Beret",nil,0];
		
		};
	};
	
	//Glasses
	case 2:
	{
		_ret = 
		[
			["G_Shades_Black",nil,0],
			["G_Shades_Blue",nil,0],
			["G_Sport_Blackred",nil,0],
			["G_Sport_Checkered",nil,0],
			["G_Sport_Blackyellow",nil,0],
			["G_Sport_BlackWhite",nil,0],
			["G_Aviator",nil,0],
			["G_Squares",nil,0],
			["G_Lowprofile",nil,0],
			["G_Combat",nil,0],
			["G_Bandanna_tan",nil,0],
			["G_Bandanna_khk",nil,0],
			["G_Bandanna_blk",nil,0],
			["G_Bandanna_oli",nil,0]
		];
	};
	
	//Vest
	case 3:
	{
		_ret pushBack ["V_Rangemaster_belt",nil,0];
		_ret pushBack ["sab_UN_Vest",nil,0];
		if(__GETC__(life_coplevel) >= 2) then
		{
			_ret pushBack ["V_TacVest_khk",nil,0];
			_ret pushBack ["V_TacVest_camo",nil,0];
			_ret pushBack ["sab_UN_mVest",nil,0];
		};
		if(__GETC__(life_coplevel) >= 3) then
		{
			_ret pushBack ["V_PlateCarrierL_CTRG",nil,0];
			_ret pushBack ["V_PlateCarrierH_CTRG",nil,0];
			_ret pushBack ["sab_UN_hVest",nil,0];
		};
	};
	
	//Backpacks
	case 4:
	{
		_ret pushBack ["B_OutdoorPack_tan",nil,0];
		// Grade Brigadier
		if(__GETC__(life_coplevel) >= 2) then
		{
			_ret pushBack ["B_AssaultPack_dgtl",nil,0];
			_ret pushBack ["B_AssaultPack_blk",nil,0];
			_ret pushBack ["B_AssaultPack_Kerry",nil,0];
			_ret pushBack ["B_Kitbag_rgr",nil,0];
			_ret pushBack ["B_FieldPack_blk",nil,0];
			_ret pushBack ["B_Bergen_blk",nil,0];
			_ret pushBack ["B_Bergen_mcamo",nil,0];
		};
		// Grade Lieutenant
		if(__GETC__(life_coplevel) >= 2) then
		{
			_ret pushBack ["B_Carryall_cbr",nil,0];
			_ret pushBack ["B_Carryall_khk",nil,0];
			_ret pushBack ["B_Carryall_mcamo",nil,0];
			_ret pushBack ["B_UAV_01_backpack_F",nil,0];
		};
	};
};

_ret;