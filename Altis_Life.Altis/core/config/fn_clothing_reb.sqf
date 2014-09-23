#include <macro.h>
/*
	File: fn_clothing_reb.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for Reb shop.
*/
private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Mohammed's Jihadi Shop"];

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
	{
		_ret pushBack ["U_IG_Guerilla1_1",nil,5000];
		// rebz grp 1
		if(__GETC__(life_factnumber) = 1) then
		{
			_ret pushBack ["U_I_G_resistanceLeader_F",nil,11500];
			// If rebz leader
			if(__GETC__(life_reblevel) = 3) then
			{
				_ret pushBack ["U_O_SpecopsUniform_ocamo",nil,17500];
				_ret pushBack ["U_O_GhillieSuit",nil,50000];
			};
		};
		// rebz grp 2
		if(__GETC__(life_factnumber) = 2) then
		{
			_ret pushBack ["U_O_PilotCoveralls",nil,15610];
			// if rebz leader
			if(__GETC__(life_reblevel) = 3) then
			{
				_ret pushBack ["U_IG_leader",nil,15340];
				_ret pushBack ["U_O_GhillieSuit",nil,50000];
			};
		};
	};
	
	//Hats
	case 1:
	{
		_ret = 
		[
			["H_ShemagOpen_tan",nil,850],
			["H_Shemag_tan",nil,850],
			["H_Shemag_olive",nil,850],
			["H_ShemagOpen_khk",nil,800],
			["H_MilCap_oucamo",nil,1200],
			["H_Watchcap_cbr",nil,700],
			["H_Booniehat_dgtl",nil,100],
			["H_Cap_brn_SPECOPS",nil,1200],
			["H_Cap_tan_specops_US",nil,1200],
			["H_Cap_khaki_specops_UK",nil,1200],
			["H_Cap_blk_Raven",nil,1200],
			["H_Bandanna_camo",nil,650],
			["H_Bandanna_mcamo",nil,650],
			["H_HelmetO_ocamo",nil,1700],
			["H_HelmetO_oucamo",nil,1700],
			["H_HelmetLeaderO_ocamo",nil,1700],
			["H_HelmetLeaderO_oucamo",nil,1700],
			["H_HelmetSpecO_ocamo",nil,1700],
			["H_PilotHelmetHeli_O",nil,2000],
			["H_HelmetCrew_O",nil,2000]
		];
	};
	
	//Glasses
	case 2:
	{
		_ret = 
		[
			["G_Shades_Black",nil,25],
			["G_Shades_Blue",nil,20],
			["G_Sport_Blackred",nil,20],
			["G_Sport_Checkered",nil,20],
			["G_Sport_Blackyellow",nil,20],
			["G_Sport_BlackWhite",nil,20],
			["G_Squares",nil,10],
			["G_Lowprofile",nil,30],
			["G_Combat",nil,55],
			["G_Bandanna_beast",nil,55],
			["G_Bandanna_aviator",nil,55],
			["G_Balaclava_blk",nil,100],
			["G_Balaclava_oli",nil,100],
			["G_Balaclava_combat",nil,300],
			["G_Balaclava_lowprofile",nil,300],
			["G_Balaclava_blk",nil,300],
			["G_Balaclava_oli",nil,300]
		];
	};
	
	//Vest
	case 3:
	{
		_ret = 
		[
			["V_TacVest_khk",nil,12500],
			["V_BandollierB_cbr",nil,4500],
			["V_HarnessO_brn",nil,7500]
		];
	};
	
	//Backpacks
	case 4:
	{
		_ret = 
		[
			["B_AssaultPack_ocamo",nil,2500],
			["B_Kitbag_mcamo",nil,4500],
			["B_TacticalPack_oli",nil,3500],
			["B_FieldPack_ocamo",nil,3000],
			["B_FieldPack_oucamo",nil,3000],
			["B_Bergen_sgg",nil,4500],
			["B_TacticalPack_ocamo",nil,4500],
			["B_Carryall_oucamo",nil,5000],
			["B_Carryall_mcamo",nil,5000],
			["B_Carryall_ocamo",nil,5000],
			["B_Parachute",nil,15000]
		];
	};
};