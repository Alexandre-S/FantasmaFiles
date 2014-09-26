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
		_ret pushBack ["U_I_G_resistanceLeader_F",nil,11500];
		_ret pushBack ["U_O_SpecopsUniform_ocamo",nil,17500];
		_ret pushBack ["U_O_PilotCoveralls",nil,15610];
		_ret pushBack ["U_IG_leader",nil,15340];
		// Faction 1 = Armée Privée
		if(__GETC__(life_factnumber) == 1) then
		{
			_ret pushBack ["U_PMC_GTShirt_DJeans","TeeShirt vert et jean",10000];
			_ret pushBack ["U_PMC_GTShirt_SJeans","TeeShirt vert et bas blanc",10000];
			_ret pushBack ["U_PMC_BlkTShirt_DJeans","TeeShirt noir et jean",10000];
			_ret pushBack ["U_PMC_WTShirt_DJeans","TeeShirt blanc et jean",10000];
			_ret pushBack ["U_PMC_BluPolo_BgPants","Polo bleu et bas beige",10000];
			_ret pushBack ["U_PMC_WhtPolo_BluPants","Polo blanc et jean",10000];
			_ret pushBack ["U_PMC_BlackPoloShirt_BeigeCords","Polo noir et bas beige",10000];
			_ret pushBack ["U_PMC_BrnPolo_BluPants","Polo marron et jean",10000];
			_ret pushBack ["U_PMC_CombatUniformLS_BSGPBB","Veste combat noire bas foncé",20000];
			_ret pushBack ["U_PMC_CombatUniformLS_SSGPSB","Veste combat beige bas foncé",20000];
			_ret pushBack ["U_PMC_CombatUniformLS_ChckDBS_GPSB","Chemise combat bleu foncé",20000];
			_ret pushBack ["U_PMC_CombatUniformLS_ChckLB_GPBB","Chemise combat bleu clair",20000];
			_ret pushBack ["U_PMC_CombatUniformLS_ChckP_BPBB","Chemise combat rouge",20000];
			_ret pushBack ["U_PMC_CombatUniformLS_BSSPBB","Veste combat noire bas clair",20000];
			_ret pushBack ["U_PMC_CombatUniformLS_GSBPBB","Veste combat verte bas foncé",20000];
			_ret pushBack ["U_PMC_CombatUniformLS_IndPBSBB","Veste combat noire bas camo",20000];
			// Si leader de faction
			if(__GETC__(life_reblevel) >= 3) then
			{
				_ret pushBack ["U_O_GhillieSuit",nil,50000];
				_ret pushBack ["vip_clothes",nil,50000];
			};
		};
		// Faction 2 = Mafia
		if(__GETC__(life_factnumber) == 2) then
		{
			_ret pushBack ["UVF_Soldier_Outfit_1","Veste noire ouverte et jean",10000];
			_ret pushBack ["IRA_Soldier_Outfit_3","Veste camo ouverte et jean Vert",10000];
			_ret pushBack ["IRA_Soldier_Outfit_2","Veste camo ouverte et jean Bleu",10000];
			_ret pushBack ["IRA_Soldier_Outfit_5","Veste khaki ouverte et jean",10000];
			_ret pushBack ["UVF_Soldier_Outfit_3","Tenue noire et bas noir",10000];
			_ret pushBack ["IRA_Soldier_Outfit_6","Tenue marron et bas vert",10000];
			_ret pushBack ["UVF_Soldier_Outfit_6","Tenue marron et bas noir",10000];
			_ret pushBack ["IRA_Soldier_Outfit_8","Tenue verte et bas camo",10000];
			_ret pushBack ["UVF_Soldier_Outfit_5","Tenue bleue et bas noir ",10000];
			// Si leader de faction
			if(__GETC__(life_reblevel) >= 2) then
			{
				_ret pushBack ["IRA_Soldier_Outfit_1","Uniforme vert",20000];
			};
			// Si leader de faction
			if(__GETC__(life_reblevel) >= 3) then
			{
				_ret pushBack ["U_O_GhillieSuit",nil,50000];
				_ret pushBack ["UVF_Soldier_Outfit_2","Uniforme noir",50000];
				_ret pushBack ["IRA_Soldier_Outfit_4","Uniforme camo",50000];
			};
		};
		// Faction 3 = Religieux
		if(__GETC__(life_factnumber) == 3) then
		{
			_ret pushBack ["U_CAF_AG_EEUR_FATIGUES_03b","Veste khaki marron ouverte et bas vert",10000];
			_ret pushBack ["U_CAF_AG_EEUR_FATIGUES_03c","Veste khaki vert ouverte et bas vert",10000];
			_ret pushBack ["U_CAF_AG_ME_FATIGUES_01a","Tenue noir et pantalon khaki",10000];
			_ret pushBack ["U_CAF_AG_ME_FATIGUES_01d","Tenue noir et pantalon khaki foncé",10000];
			_ret pushBack ["U_CAF_AG_ME_ROBES_mil_01a","Veste ouverte beige et robe marron",10000];
			_ret pushBack ["U_CAF_AG_ME_ROBES_01","Tenue gris et vert avec veston bleu",10000];
			_ret pushBack ["U_CAF_AG_ME_ROBES_02a","Veste ouverte noir et robe marron",10000];
			_ret pushBack ["U_CAF_AG_ME_ROBES_03d","Veston noir et robe blanche",10000];
			_ret pushBack ["U_CAF_AG_ME_ROBES_04a","Veste marron et robe verte et marron",10000];
			_ret pushBack ["U_CAF_AG_ME_ROBES_04c","Veste bleu et robe bleu",10000];
			_ret pushBack ["U_CAF_AG_ME_ROBES_04d","Veste marron et robe verte et marron",10000];
			// Si leader de faction
			if(__GETC__(life_reblevel) >= 3) then
			{
				_ret pushBack ["U_O_GhillieSuit",nil,50000];
				_ret pushBack ["U_CAF_AG_EEUR_FATIGUES_01","Uniforme Vert",50000];
				_ret pushBack ["U_CAF_AG_EEUR_FATIGUES_01a","Uniforme Marron",50000];
			};
		};
	};
	
	//Hats
	case 1:
	{ 
		_ret pushBack ["H_ShemagOpen_tan",nil,850];
		_ret pushBack ["H_Shemag_tan",nil,850];
		_ret pushBack ["H_Shemag_olive",nil,850];
		_ret pushBack ["H_ShemagOpen_khk",nil,800];
		_ret pushBack ["H_MilCap_oucamo",nil,1200];
		_ret pushBack ["H_Watchcap_cbr",nil,700];
		_ret pushBack ["H_Booniehat_dgtl",nil,100];
		_ret pushBack ["H_Cap_brn_SPECOPS",nil,1200];
		_ret pushBack ["H_Cap_tan_specops_US",nil,1200];
		_ret pushBack ["H_Cap_khaki_specops_UK",nil,1200];
		_ret pushBack ["H_Cap_blk_Raven",nil,1200];
		_ret pushBack ["H_Bandanna_camo",nil,650];
		_ret pushBack ["H_Bandanna_mcamo",nil,650];
		_ret pushBack ["H_HelmetO_ocamo",nil,1700];
		_ret pushBack ["H_HelmetO_oucamo",nil,1700];
		_ret pushBack ["H_HelmetLeaderO_ocamo",nil,1700];
		_ret pushBack ["H_HelmetLeaderO_oucamo",nil,1700];
		_ret pushBack ["H_HelmetSpecO_ocamo",nil,1700];
		_ret pushBack ["H_PilotHelmetHeli_O",nil,2000];
		_ret pushBack ["H_HelmetCrew_O",nil,2000];
		// Faction 1 = Armée Privée
		if(__GETC__(life_factnumber) == 1) then
		{
			_ret pushBack ["H_Cap_pmc",nil,300];
			_ret pushBack ["H_Capbw_pmc",nil,300];
			_ret pushBack ["H_Cap_tan_pmc",nil,300];
			_ret pushBack ["H_Capbw_tan_pmc",nil,300];
			_ret pushBack ["H_Booniehat_DMARPAT",nil,450];
			_ret pushBack ["H_Booniehat_GCAMO",nil,450];
			_ret pushBack ["H_Booniehat_rgr",nil,450];
			_ret pushBack ["H_Cap_pmc_headphones",nil,1000];
			_ret pushBack ["H_PilotHelmetHeli_PMC",nil,2000];
		};
		// Faction 3 = Religieux
		if(__GETC__(life_factnumber) == 3) then
		{
			_ret pushBack ["H_caf_ag_beanie",nil,300];
			_ret pushBack ["H_caf_ag_fur2",nil,300];
			_ret pushBack ["H_caf_ag_fur",nil,300];
			_ret pushBack ["H_caf_ag_paktol_02",nil,300];
			_ret pushBack ["H_caf_ag_paktol_03",nil,300];
			_ret pushBack ["H_caf_ag_paktol",nil,300];
			_ret pushBack ["H_caf_ag_paktol_04",nil,300];
			_ret pushBack ["H_caf_ag_wrap",nil,450];			
			_ret pushBack ["H_caf_ag_turban",nil,450];
		};
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
			["G_Balaclava_oli",nil,300],
			["IRA_Balaclava_Brown",nil,300]
		];
	};
	
	//Vest
	case 3:
	{
		
		_ret pushBack ["V_TacVest_khk",nil,12500];
		_ret pushBack ["V_BandollierB_cbr",nil,4500];
		_ret pushBack ["V_HarnessO_brn",nil,7500];
		// Faction 1 = Armée Privée
		if(__GETC__(life_factnumber) == 1) then
		{
			_ret pushBack ["V_PlateCarrierInd_PMC_blk","Gilet noir Lourd",12500];
			_ret pushBack ["V_PlateCarrier1_PMC_blk","Gilet noir léger",7500];
			_ret pushBack ["V_PlateCarrierInd_PMC_grn","Gilet vert Lourd",12500];
			_ret pushBack ["V_PlateCarrier1_PMC_rgr","Gilet vert léger",7500];
			_ret pushBack ["V_PlateCarrier1_PMC_khki","Gilet khaki Lourd",7500];
			_ret pushBack ["V_PlateCarrier1_PMC_marpat","Gilet camo léger",7500];
			_ret pushBack ["V_TacVest_darkblck","Veste tactique",6000];
		};
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

_ret;