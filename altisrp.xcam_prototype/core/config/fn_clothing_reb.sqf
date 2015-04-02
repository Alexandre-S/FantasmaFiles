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
		if(life_sexe) then
		{
			// _ret pushBack ["B_FEM_NATO","Tenue femme 1",800];
			// _ret pushBack ["B_FEM_FIA","Tenue femme 2",800];
			// _ret pushBack ["O_FEM_CSAT","Tenue femme 3",800];
			// _ret pushBack ["I_FEM_AAF","Tenue femme 4",800];
			_ret pushBack ["O_FEM_CSAT_Long","Tenue femme 5",2000];
			_ret pushBack ["B_FEM_NATO_long","Tenue femme 6",2000];
			_ret pushBack ["I_FEM_AAF_long","Tenue femme 7",2000];
			_ret pushBack ["B_FEM_NATO_Collar","Tenue femme 8",3000];
			_ret pushBack ["B_FEM_NATO_Rolled","Tenue femme 9",3000];
			_ret pushBack ["O_FEM_CSAT_Rolled","Tenue femme 10",3000];
			_ret pushBack ["B_FEM_AAF_Rolled","Tenue femme 11",3000];
		};
		_ret pushBack ["U_I_G_Story_Protagonist_F","Work",5000];
		_ret pushBack ["U_BG_Guerrilla_6_1",nil,5000];
		_ret pushBack ["UVF_Soldier_Outfit_5","Veste khaki ouverte et jean",5000];
		_ret pushBack ["IRA_Soldier_Outfit_6","Tenue marron et bas vert",5000];
		// _ret pushBack ["UVF_Soldier_Outfit_2","Uniforme noir",50000];
		// _ret pushBack ["UVF_Soldier_Outfit_3","Tenue noire et bas noir",10000];
		
		_ret pushBack ["U_CAF_AG_ME_FATIGUES_01","Tenue noir et pantalon treilli",10000];
		_ret pushBack ["U_CAF_AG_ME_FATIGUES_01a","Tenue noir et pantalon treilli 2",10000];
		_ret pushBack ["U_CAF_AG_ME_FATIGUES_01c","Tenue noir et pantalon khaki 3",10000];
		_ret pushBack ["U_CAF_AG_ME_FATIGUES_01d","Tenue noir et pantalon khaki 4",10000];
		_ret pushBack ["U_CAF_AG_ME_FATIGUES_01b","Tenue carreau et pantalon khaki",10000];
		_ret pushBack ["IRA_Soldier_Outfit_8","Tenue verte et bas camo",10000];
		
		_ret pushBack ["U_IG_Guerilla1_1",nil,10000];
		
		
		_ret pushBack ["IRA_Soldier_Outfit_2","Veste camo ouverte et jean Bleu",15000];
		_ret pushBack ["IRA_Soldier_Outfit_3","Veste camo ouverte et jean Vert",15000];
		_ret pushBack ["IRA_Soldier_Outfit_1","Veste verte",25000];
		_ret pushBack ["U_IG_leader",nil,25000];
		_ret pushBack ["IRA_Soldier_Outfit_4","Uniforme camo",25000];
		_ret pushBack ["U_CAF_AG_ME_ROBES_mil_01","Veste ouverte desert et robe bleu",25000];
		_ret pushBack ["U_CAF_AG_ME_ROBES_mil_01a","Veste ouverte beige et robe marron",25000];			

		
	
		_ret pushBack ["U_I_CombatUniform_shortsleeve",nil,50000];
		_ret pushBack ["U_I_CombatUniform",nil,50000];
		_ret pushBack ["U_I_OfficerUniform",nil,50000];
		_ret pushBack ["U_O_OfficerUniform_ocamo",nil,50000];
		// _ret pushBack ["U_O_CombatUniform_ocamo",nil,17500];
		// _ret pushBack ["U_O_CombatUniform_oucamo",nil,17500];
		
		_ret pushBack ["U_O_PilotCoveralls",nil,20000];


		// Armée privée
		if(__GETC__(life_factnumber) == 1) then
		{
			_ret pushBack ["U_PMC_CombatUniformLS_BSGPBB",nil,20000];
			_ret pushBack ["U_PMC_CombatUniformLS_BSGPSB",nil,20000];
			_ret pushBack ["U_PMC_CombatUniformLS_BSSPBB",nil,20000];
			_ret pushBack ["U_PMC_CombatUniformLS_BSSPSB",nil,20000];
			_ret pushBack ["U_PMC_CombatUniformLS_GSBPBB",nil,20000];
			_ret pushBack ["U_PMC_CombatUniformLS_GSSPBB",nil,20000];
			_ret pushBack ["U_PMC_CombatUniformLS_IndPBSBB",nil,20000];
			_ret pushBack ["U_PMC_CombatUniformLS_SSBPBB",nil,20000];
			_ret pushBack ["U_PMC_CombatUniformLS_SSGPBB",nil,20000];
			_ret pushBack ["U_PMC_CombatUniformLS_SSGPSB",nil,20000];
			
			_ret pushBack ["U_PMC_CombatUniformRS_BSGPBB",nil,20000];
			_ret pushBack ["U_PMC_CombatUniformRS_BSGPSB",nil,20000];
			_ret pushBack ["U_PMC_CombatUniformRS_BSSPBB",nil,20000];
			_ret pushBack ["U_PMC_CombatUniformRS_BSSPSB",nil,20000];
			_ret pushBack ["U_PMC_CombatUniformRS_GSBPBB",nil,20000];
			_ret pushBack ["U_PMC_CombatUniformRS_GSSPBB",nil,20000];
			_ret pushBack ["U_PMC_CombatUniformRS_IndPBSBB",nil,20000];
			_ret pushBack ["U_PMC_CombatUniformRS_SSBPBB",nil,20000];
			_ret pushBack ["U_PMC_CombatUniformRS_SSGPBB",nil,20000];
			_ret pushBack ["U_PMC_CombatUniformRS_SSGPSB",nil,20000];
		};
		// Faction 2 = AEP
		if(__GETC__(life_factnumber) == 2) then
		{
			// _ret pushBack ["SMD_US_BLOPS_BDU",nil,10000];
			// _ret pushBack ["SMD_US_BLOPS_Digi_BDU",nil,10000];
		};
		// Faction 3 = Héphaistos
		if(__GETC__(life_factnumber) == 3) then
		{
			_ret pushBack ["U_CAF_AG_EEUR_FATIGUES_02","Bas treillis et polo 1",10000];
			_ret pushBack ["U_CAF_AG_EEUR_FATIGUES_02a","Bas treillis et polo 2",10000];
		
			_ret pushBack ["U_CAF_AG_EEUR_FATIGUES_03","Veste treilli ouverte et bas noir",10000];
			_ret pushBack ["U_CAF_AG_EEUR_FATIGUES_03a","Veste treilli ouverte et bas jean",10000];
			_ret pushBack ["U_CAF_AG_EEUR_FATIGUES_03b","Veste khaki marron ouverte et bas vert",10000];
			_ret pushBack ["U_CAF_AG_EEUR_FATIGUES_03c","Veste khaki vert ouverte et bas vert",10000];

			_ret pushBack ["U_CAF_AG_EEUR_FATIGUES_01","Uniforme Vert",50000];
			_ret pushBack ["U_CAF_AG_EEUR_FATIGUES_01a","Uniforme Marron",50000];
			
			_ret pushBack ["rds_uniform_doctor",nil,2500];
			// _ret pushBack ["U_C_Scientist",nil,2500];
			_ret pushBack ["rhs_uniform_df15",nil,2500];
			
		};
		// Faction 4 = Milice Sainte Croix
		if(__GETC__(life_factnumber) == 4) then
		{
			_ret pushBack ["ice123_apo_cloak",nil,10000];
			// _ret pushBack ["msc_R_Yeti",nil,10000];
			// _ret pushBack ["msc_Yeti",nil,10000];
			// _ret pushBack ["msc_R_McamAlpine",nil,10000];
			// _ret pushBack ["msc_McamAlpine",nil,10000];
			// _ret pushBack ["msc_R_SnowMARPAT",nil,10000];
			// _ret pushBack ["msc_SnowMARPAT",nil,10000];
		};
		// Si leader de faction
		if(__GETC__(life_reblevel) >= 3) then
		{
			_ret pushBack ["U_O_GhillieSuit",nil,70000];
			// _ret pushBack ["U_B_GhillieSuit",nil,50000];
			_ret pushBack ["U_I_GhillieSuit",nil,70000];
			//_ret pushBack ["vip_clothes",nil,50000];
		};
	};
	
	//Hats
	case 1:
	{
		_ret = 
		[
			["H_Bandanna_mcamo","bandanna camo",250],
			["H_Bandanna_camo",nil,250],
			["H_Bandanna_khk_hs","bandanna kaki oreillette",250],

			["H_Booniehat_GCAMO","bob camo",700],
			["rhs_Booniehat_flora","bob camo",700],
			["H_caf_ag_boonie_01","bob camo",700],
			["H_caf_ag_boonie_02","bob camo",700],
			["rhs_Booniehat_m81","bob camo",700],
			["rhs_Booniehat_ocp","bob camo",700],
			["rhs_Booniehat_ucp",nil,700],
			["H_Booniehat_mcamo","bob camo",700],
			["H_Booniehat_dgtl",nil,700],
			
			["H_Watchcap_cbr",nil,700],
			["H_Watchcap_camo",nil,700],

		
			["H_Cap_tan_specops_US",nil,500],
			["H_Cap_blk_Raven",nil,500],
			["H_Cap_brn_SPECOPS",nil,500],
			
			["rhsusf_patrolcap_ocp",nil,500],
			["rhsusf_patrolcap_ucp",nil,500],
			
			["H_MilCap_oucamo",nil,500],
			["H_MilCap_ocamo",nil,500],
			["H_MilCap_dgtl",nil,500],
			
			["H_Hat_camo",nil,700],
			
			["H_caf_ag_wrap",nil,1250],	
			
			["H_ShemagOpen_tan",nil,1250],
			["H_Shemag_olive",nil,1250],
			["H_Shemag_olive_hs",nil,1250],
			["H_ShemagOpen_khk",nil,1250],
			["H_Shemag_tan",nil,1250]
		];
	
		// Armée privée
		if(__GETC__(life_factnumber) == 1) then
		{
		};
		// msc
		if(__GETC__(life_factnumber) == 4) then
		{
			_ret pushBack ["rds_uniform_priest",nil,1000];
			_ret pushBack ["ice123_apo_hood",nil,1000];
		};
		// Faction 3 = Religieux
		if(__GETC__(life_factnumber) == 3) then
		{
			_ret pushBack ["H_caf_ag_beanie",nil,600];
		};
	};
	
	//Glasses
	case 2:
	{
		_ret = 
		[
			["G_Bandanna_tan",nil,250],
			["G_Bandanna_khk",nil,250],
			["G_Bandanna_blk",nil,250],
			["G_Bandanna_oli",nil,250],
			["G_Bandanna_beast",nil,250],
			["G_Bandanna_shades",nil,350],
			["G_Bandanna_sport",nil,350],
			["G_Bandanna_aviator",nil,350],
			
			["G_Balaclava_oli",nil,500],
			["IRA_Balaclava_Brown",nil,500],
			["G_Balaclava_blk",nil,500],
			["G_Balaclava_lowprofile",nil,700],
			["G_Balaclava_combat",nil,700],

			["Mask_M40",nil,2000],
			["Mask_M40_OD",nil,2000]
		];
	};
	
	//Vest
	case 3:
	{
		_ret = 
		[
			["rhs_6sh92",nil,5000],
			["rhs_6sh92_digi",nil,5000],
			["rhs_vydra_3m",nil,5000],
			
			
			["V_TacVest_camo",nil,15000],
			["V_I_G_resistanceLeader_F",nil,15000],
			// ["V_PlateCarrierIA2_dgtl",nil,15000],
			["V_PlateCarrierIA1_dgtl",nil,15000],
			
			["rhs_6b23",nil,15000],
			["rhs_6b23_crewofficer",nil,15000],
			["rhs_6b23_crew",nil,15000],
			["rhs_6b23_engineer",nil,15000],
			// ["rhs_6b23_medic",nil,15000],
			["rhs_6b23_rifleman",nil,15000],
			["rhs_6b23_sniper",nil,15000],
			["rhs_6b23_6sh92",nil,15000],
			
			["rhs_6b23_digi",nil,15000],
			["rhs_6b23_digi_crewofficer",nil,15000],
			["rhs_6b23_digi_crew",nil,15000],
			["rhs_6b23_digi_engineer",nil,15000],
			// ["rhs_6b23_digi_medic",nil,15000],
			["rhs_6b23_digi_rifleman",nil,15000],
			["rhs_6b23_digi_sniper",nil,15000],
			["rhs_6b23_digi_6sh92",nil,15000],
			
			["rhs_6b23_ML",nil,15000],
			["rhs_6b23_ML_crewofficer",nil,15000],
			["rhs_6b23_ML_crew",nil,15000],
			["rhs_6b23_ML_engineer",nil,15000],
			// ["rhs_6b23_ML_medic",nil,15000],
			["rhs_6b23_ML_rifleman",nil,15000],
			["rhs_6b23_ML_sniper",nil,15000],
			["rhs_6b23_ML_6sh92",nil,15000],
			
			["V_HarnessOGL_brn","Veste Explosive",500000]
		];
	};
	
	//Backpacks
	case 4:
	{
		_ret = 
		[
			["B_AssaultPack_ocamo",nil,2500],
			["B_AssaultPack_dgtl",nil,2500],
			["B_AssaultPack_mcamo",nil,2500],
			
			["B_FieldPack_ocamo",nil,3500],
			
			["B_TacticalPack_ocamo",nil,4500],
			["B_TacticalPack_mcamo",nil,4500],
			
			["B_Kitbag_mcamo",nil,5500],
			
			["B_Carryall_ocamo",nil,6500],
			["B_Carryall_mcamo",nil,6500],
			
		
			["tf_mr3000",nil,15000],
			["tf_mr3000_bwmod",nil,15000],
			["tf_mr3000_multicam",nil,15000],
			["tf_mr3000_rhs",nil,15000],
			
			["B_Parachute",nil,15000]
		];
	};
};

_ret;