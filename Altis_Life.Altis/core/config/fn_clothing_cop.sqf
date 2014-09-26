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
		_ret pushBack ["ARC_FR_CE_Uniform_tshirt","Tenue recrue 1",0];
		_ret pushBack ["ARC_FR_Daguet_Uniform_tshirt","Tenue recrue 2",0];
		// Grade Brigadier
		if(__GETC__(life_coplevel) >= 2) then
		{
			_ret pushBack ["ARC_FR_CE_Uniform",nil,0];
			_ret pushBack ["ARC_FR_Daguet_Uniform",nil,0];
		};
		// Grade Lieutenant
		if(__GETC__(life_coplevel) >= 3) then
		{
			_ret pushBack ["ARC_FR_CE_Uniform_vest",nil,0];
			_ret pushBack ["ARC_FR_Daguet_Uniform_vest",nil,0];
			_ret pushBack ["U_B_HeliPilotCoveralls",nil,0];
		};
		// Grade Capitaine
		if(__GETC__(life_coplevel) >= 4) then
		{
			_ret pushBack ["U_B_GhillieSuit",nil,0];
			_ret pushBack ["U_B_survival_uniform",nil,0];
			_ret pushBack ["ARC_FR_Uniform_Serval",nil,0];
			_ret pushBack ["ARC_FR_CE_Uniform_Light",nil,0];
			_ret pushBack ["ARC_FR_Daguet_Uniform_Light",nil,0];
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
		
			_ret pushBack ["ARC_FR_CE_Milcap",nil,0];
			_ret pushBack ["ARC_FR_Daguet_Milcap",nil,0];
			_ret pushBack ["ARC_FR_CE_Helmet_simple",nil,0];
			_ret pushBack ["ARC_FR_Daguet_Helmet_simple",nil,0];
			_ret pushBack ["ARC_FR_CE_Mich",nil,0];
			_ret pushBack ["ARC_FR_Daguet_Mich",nil,0];
			_ret pushBack ["sab_UN_capHP",nil,0];
			_ret pushBack ["sab_UN_Helmet",nil,0];
		};
		if(__GETC__(life_coplevel) >= 3) then
		{
			_ret pushBack ["ARC_FR_CE_booniehat",nil,0];
			_ret pushBack ["ARC_FR_Daguet_booniehat",nil,0];
			_ret pushBack ["ARC_FR_CE_Helmet",nil,0];
			_ret pushBack ["ARC_FR_Daguet_Helmet",nil,0];
			_ret pushBack ["ARC_FR_CE_Helmet_Light",nil,0];
			_ret pushBack ["ARC_FR_Daguet_Helmet_Light",nil,0];
			_ret pushBack ["H_PilotHelmetHeli_B",nil,0];
			_ret pushBack ["H_HelmetCrew_B",nil,0];
			_ret pushBack ["H_Cap_headphones",nil,0];
			_ret pushBack ["H_Watchcap_khk",nil,0];
			
			
		};
		// Grade Capitaine
		if(__GETC__(life_coplevel) >= 4) then
		{
			_ret pushBack ["H_Beret_02",nil,0];
			_ret pushBack ["sab_UN_Beret",nil,0];
			_ret pushBack ["H_Beret_blk",nil,0];
			_ret pushBack ["H_Booniehat_tan",nil,0];
			_ret pushBack ["H_Hat_grey",nil,0];
			_ret pushBack ["H_Hat_tan",nil,0];
			_ret pushBack ["H_Hat_brown",nil,0];
			_ret pushBack ["H_Cap_blu",nil,0];
			_ret pushBack ["H_Cap_grn",nil,0];
			_ret pushBack ["H_Cap_grn_BI",nil,0];
		};
		// Grade Colonel
		if(__GETC__(life_coplevel) >= 4) then
		{
			_ret pushBack ["H_Beret_Colonel",nil,0];
		};
	};
	
	//Glasses
	case 2:
	{
		_ret = 
		[
			["G_Shades_Black",nil,0],
			["G_Shades_Blue",nil,0],
			["G_Shades_Green",nil,0],
			["G_Shades_Red",nil,0],
			["G_Sport_Blackred",nil,0],
			["G_Sport_Checkered",nil,0],
			["G_Sport_Blackyellow",nil,0],
			["G_Sport_BlackWhite",nil,0],
			["G_Aviator",nil,0],
			["G_Squares",nil,0],
			["G_Lowprofile",nil,0],
			["G_Combat",nil,0],
			["G_Tactical_Clear",nil,0]
			
		];
	};
	
	//Vest
	case 3:
	{
		_ret pushBack ["ARC_FR_CE_rangemaster_belt","Ceinture recrue 1",0];
		_ret pushBack ["ARC_FR_Daguet_rangemaster_belt","Ceinture recrue 2",0];
		_ret pushBack ["ARC_FR_CE_BandollierB_rgr","Bandoulière recrue 1",0];
		_ret pushBack ["ARC_FR_Daguet_BandollierB_rgr","Bandoulière recrue 2",0];
		if(__GETC__(life_coplevel) >= 2) then
		{
			_ret pushBack ["sab_UN_Vest",nil,0];
			_ret pushBack ["ARC_FR_CE_PlateCarrier_1",nil,0];
			_ret pushBack ["ARC_FR_Daguet_PlateCarrier_1",nil,0];
		};
		if(__GETC__(life_coplevel) >= 3) then
		{
			_ret pushBack ["sab_UN_mVest",nil,0];
			_ret pushBack ["ARC_FR_CE_PlateCarrier_2",nil,0];
			_ret pushBack ["ARC_FR_Daguet_PlateCarrier_2",nil,0];
		};
		if(__GETC__(life_coplevel) >= 4) then
		{
			_ret pushBack ["sab_UN_hVest",nil,0];
			_ret pushBack ["ARC_FR_CE_Plate_Carrier",nil,0];
			_ret pushBack ["ARC_FR_Daguet_Plate_Carrier",nil,0];
			_ret pushBack ["ARC_FR_TANOD_Plate_Carrier",nil,0];
		};
		if(__GETC__(life_coplevel) >= 5) then
		{
			_ret pushBack ["ARC_FR_CE_Plate_Carrier_H",nil,0];
			_ret pushBack ["ARC_FR_Daguet_Plate_Carrier_H",nil,0];
			_ret pushBack ["ARC_FR_TANOD_Plate_Carrier_H",nil,0];
		};
	};
	
	//Backpacks
	case 4:
	{
		_ret pushBack ["ARC_FR_Backpack_compact_CE",nil,0];
		_ret pushBack ["ARC_FR_Backpack_compact_Daguet",nil,0];
		// Grade Brigadier
		if(__GETC__(life_coplevel) >= 2) then
		{
			_ret pushBack ["ARC_FR_Kitbag_compact_CE",nil,0];
			_ret pushBack ["ARC_FR_Kitbag_compact_Daguet",nil,0];
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