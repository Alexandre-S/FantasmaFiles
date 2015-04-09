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
ctrlSetText[3103,"Friperie Gendarme"];

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
	{
		_ret pushBack ["U_Rangemaster","Uniforme de gendarme",0];
		
		// Grade Brigadier
		if(__GETC__(life_coplevel) >= 2) then
		{
			_ret pushBack ["rpima_uniform",nil,0];
		};
		// Grade Lieutenant
		if(__GETC__(life_coplevel) >= 3) then
		{
		};
		// BAC / PJ
		if(license_cop_bacpj) then
		{
			_ret pushBack ["U_B_CombatUniform_mcam","Polaire Gendarme",0];
			_ret pushBack ["U_B_SpecopsUniform_sgg","Polaire Bleue Gendarme",0];
			_ret pushBack ["C_Uniform_survivor3_l",nil,0];
			_ret pushBack ["B_Uniform_survivor2_l",nil,0];
			_ret pushBack ["U_C_HunterBody_grn",nil,0];
			_ret pushBack ["U_IG_Guerilla3_1",nil,0];
			_ret pushBack ["FANTASMA_GiletPolo",nil,0];
			_ret pushBack ["U_NikosBody",nil,0];
			_ret pushBack ["vip_clothes",nil,0];
			_ret pushBack ["U_PMC_BlkTShirt_SJeans",nil,0];
			_ret pushBack ["U_PMC_BluePlaidShirt_BeigeCords",nil,0];
			_ret pushBack ["U_PMC_BlckPolo_BgPants",nil,0];
			_ret pushBack ["UVF_Soldier_Outfit_4",nil,0];
			_ret pushBack ["U_BG_Guerilla2_1",nil,0];
			_ret pushBack ["U_BG_Guerilla2_2",nil,0];
			_ret pushBack ["U_BG_Guerilla2_3",nil,0];
			_ret pushBack ["U_BG_Guerilla3_1",nil,0];
			_ret pushBack ["U_BG_Guerilla3_2",nil,0];
		};
		// Unité tactique
		if(license_cop_swat) then
		{
			_ret pushBack ["gign_uniform",nil,0];
		};
		// Pilote
		if(license_cop_air) then
		{
			_ret pushBack ["U_B_PilotCoveralls",nil,0];
			_ret pushBack ["U_I_pilotCoveralls",nil,0];
			_ret pushBack ["U_B_HeliPilotCoveralls",nil,0];
			_ret pushBack ["U_I_HeliPilotCoveralls",nil,0];
		};
		// Grade Capitaine
		if(__GETC__(life_coplevel) >= 4) then
		{
		};
		
		// Grade Haut-Gradés
		if(__GETC__(life_coplevel) >= 5) then
		{
			_ret pushBack ["U_B_GhillieSuit",nil,0];
			_ret pushBack ["U_I_GhillieSuit",nil,0];
			_ret pushBack ["U_B_FullGhillie_ard",nil,0];
			_ret pushBack ["U_B_FullGhillie_lsh",nil,0];
			_ret pushBack ["U_B_FullGhillie_sard",nil,0];
		};
		
		_ret pushBack ["rds_uniform_Policeman","Tenue d'apparat",0];
		
		/*if(life_sexe) then
		{
			_ret pushBack ["B_FEM_NATO","Tenue femme 1",0];
			_ret pushBack ["B_FEM_FIA","Tenue femme 2",0];
			_ret pushBack ["O_FEM_CSAT","Tenue femme 3",0];
			_ret pushBack ["I_FEM_AAF","Tenue femme 4",0];
			_ret pushBack ["O_FEM_CSAT_Long","Tenue femme 5",0];
			_ret pushBack ["B_FEM_NATO_long","Tenue femme 6",0];
			_ret pushBack ["I_FEM_AAF_long","Tenue femme 7",0];
			_ret pushBack ["B_FEM_NATO_Collar","Tenue femme 8",0];
			_ret pushBack ["B_FEM_NATO_Rolled","Tenue femme 9",0];
			_ret pushBack ["O_FEM_CSAT_Rolled","Tenue femme 10",0];
			_ret pushBack ["B_FEM_AAF_Rolled","Tenue femme 11",0];
		};*/
	};
	
	//Hats
	case 1:
	{
		_ret pushBack ["H_MilCap_blue",nil,0];
			
		if(__GETC__(life_coplevel) >= 2) then
		{
			_ret pushBack ["H_Beret_blk",nil,0];
		};
		if(__GETC__(life_coplevel) >= 3) then
		{
			_ret pushBack ["H_Beret_02",nil,0];
			// _ret pushBack ["H_PilotHelmetHeli_B",nil,0];
			_ret pushBack ["H_Cap_headphones",nil,0];
			_ret pushBack ["H_Watchcap_blk",nil,0];
		};
		// PJ / BAC
		if(license_cop_bacpj) then
		{
			_ret pushBack ["H_Booniehat_tan",nil,0];
			_ret pushBack ["H_Hat_grey",nil,0];
			_ret pushBack ["H_Hat_tan",nil,0];
			_ret pushBack ["H_Hat_brown",nil,0];
			_ret pushBack ["H_Cap_blu",nil,0];
			_ret pushBack ["H_Cap_grn",nil,0];
			_ret pushBack ["H_Cap_grn_BI",nil,0];
			
			_ret pushBack ["H_Watchcap_khk",nil,0];
			_ret pushBack ["H_Cap_police",nil,0];
			_ret pushBack ["RPIMA_Balaclava",nil,0];
		};
		// Unité tactique
		if(license_cop_swat) then
		{
			_ret pushBack ["H_Cap_oli_hs",nil,0];
			_ret pushBack ["H_Booniehat_khk_hs",nil,0]; //
			_ret pushBack ["H_MilCap_gry",nil,0]; //
			_ret pushBack ["H_MilCap_mcamo",nil,0];
			_ret pushBack ["gign_Balaclava",nil,0];
			_ret pushBack ["gign_helm",nil,0];
			_ret pushBack ["gign_helm3",nil,0];
			_ret pushBack ["gign_helm4",nil,0];
		};
		// Pilote
		if(license_cop_air) then
		{
			// _ret pushBack ["H_HelmetCrew_B",nil,0];
			// _ret pushBack ["H_HelmetCrew_O",nil,0];
			// _ret pushBack ["H_CrewHelmetHeli_B",nil,0];
			// _ret pushBack ["H_CrewHelmetHeli_O",nil,0];
		};
		// Grade Capitaine
		if(__GETC__(life_coplevel) >= 4) then
		{
			_ret pushBack ["H_Beret_Colonel",nil,0];
		};
		// Grade Colonel
		if(__GETC__(life_coplevel) >= 5) then
		{
			_ret pushBack ["Beret_rouge",nil,0];
			_ret pushBack ["ATHhelm_Balaclava1",nil,0];
			_ret pushBack ["ATHhelm_Balaclava2",nil,0];
			_ret pushBack ["ATHhelm_Balaclava3",nil,0];
			_ret pushBack ["ATHhelm_Balaclava4",nil,0];
			_ret pushBack ["RPIMA_Balaclava2",nil,0];
			_ret pushBack ["RPIMA_helm",nil,0];
		};
		_ret pushBack ["rds_police_cap",nil,0];
	};
	
	//Glasses
	case 2:
	{
		_ret = 
		[
			["G_Tactical_Clear",nil,0],
			["G_Tactical_Black",nil,0],
			
			["Pomi_Goggles",nil,0],
			["Pomi_Goggles_Grn",nil,0],
			["Pomi_Goggles_Snd",nil,0],
			
			["Mask_M50",nil,0]
			
			// ["rpima_goggle_orange",nil,0],
			// ["rpima_goggle_black",nil,0],
			// ["rpima_goggle_blue",nil,0],
			// ["rpima_goggle_green",nil,0]
		];
	};
	
	//Vest
	case 3:
	{
		_ret pushBack ["V_Rangemaster_belt",nil,0];
		_ret pushBack ["V_TacVest_blk_POLICE",nil,0];
		
		if(__GETC__(life_coplevel) >= 2) then
		{
			_ret pushBack["V_BandollierB_oli",nil,0];
			_ret pushBack["V_BandollierB_blk",nil,0];
			_ret pushBack["gign_BlackVest",nil,0];
		};
		if(__GETC__(life_coplevel) >= 3) then
		{
			_ret pushBack["V_Chestrig_blk",nil,0];
			_ret pushBack["V_Chestrig_oli",nil,0];
			_ret pushBack["V_PlateCarrier1_rgr",nil,0];
			_ret pushBack["V_PlateCarrier1_blk",nil,0];
		};
		// PJ / BAC
		if(license_cop_bacpj) then
		{
			_ret pushBack ["V_HarnessO_brn",nil,0];
			_ret pushBack ["V_HarnessO_gry",nil,0];
			
			_ret pushBack ["V_Chestrig_khk",nil,0];
			_ret pushBack ["V_Chestrig_rgr",nil,0];
			
			//gillet par balle
			_ret pushBack ["V_TacVest_khk",nil,0];
			_ret pushBack ["V_TacVest_brn",nil,0];
			_ret pushBack ["V_TacVest_blk",nil,0];
			_ret pushBack ["V_TacVest_oli",nil,0];
		};
		// Medic
		if(license_cop_medic) then
		{
			_ret pushBack ["V_TacVestIR_blk",nil,0];
		};
		// Unité tactique
		if(license_cop_swat) then
		{
			_ret pushBack["gign_HeavyVest",nil,0];
		};
		if(__GETC__(life_coplevel) >= 4) then
		{
			_ret pushBack["rpima_BlackVest",nil,0];
			_ret pushBack["rpima_Vest_light",nil,0];
			_ret pushBack["RPIMA_vest",nil,0];
			_ret pushBack["RPIMA_vest_black2",nil,0];
			
		};
		if(__GETC__(life_coplevel) >= 5) then
		{
			
		};
	};
	
	//Backpacks
	case 4:
	{
		_ret pushBack ["B_AssaultPack_rgr",nil,0];
		_ret pushBack ["B_AssaultPack_blk",nil,0];
		
		_ret pushBack ["B_FieldPack_blk",nil,0];
		
		_ret pushBack ["B_TacticalPack_rgr",nil,0];
		_ret pushBack ["B_TacticalPack_blk",nil,0];
		
		_ret pushBack ["PMC_B_Kitbag_blk",nil,0];
		
		_ret pushBack ["PMC_B_Carryall_blk",nil,0];
		
		_ret pushBack ["tf_rt1523g_black",nil,0];
		// Grade Brigadier
		if(__GETC__(life_coplevel) >= 2) then
		{
			_ret pushBack ["B_AssaultPack_mcamo",nil,0];
			_ret pushBack ["B_Kitbag_mcamo",nil,0];
			_ret pushBack ["B_Kitbag_rgr",nil,0];
			_ret pushBack ["B_Bergen_mcamo",nil,0];
			_ret pushBack ["B_Carryall_cbr",nil,0];
			_ret pushBack ["B_Carryall_khk",nil,0];
			_ret pushBack ["B_Carryall_mcamo",nil,0];
			
			_ret pushBack ["tf_rt1523g",nil,0];
			_ret pushBack ["tf_rt1523g_bwmod",nil,0];
			_ret pushBack ["tf_rt1523g_sage",nil,0];
			_ret pushBack ["tf_rt1523g_green",nil,0];
			_ret pushBack ["tf_rt1523g_rhs",nil,0];
			_ret pushBack ["tf_rt1523g_fabric",nil,0];
			_ret pushBack ["tf_rt1523g_big",nil,0];
			_ret pushBack ["tf_rt1523g_big_bwmod",nil,0];
			_ret pushBack ["tf_rt1523g_big_rhs",nil,0];
		};
		// Unité Tactique
		if(license_cop_swat || __GETC__(life_coplevel) >= 2) then
		{
			_ret pushBack ["B_UAV_01_backpack_F",nil,0];
		};
		// 
		if(license_cop_air) then
		{
			_ret pushBack ["B_Parachute",nil,0];
		};
	};
};

_ret;