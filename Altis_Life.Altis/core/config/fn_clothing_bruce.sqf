#include <macro.h>
/*
	File: fn_clothing_bruce.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for Bruce's Outback Outfits.
*/
private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Bruce's Outback Outfits"];
comment "Remove existing items";
_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
	{
		_ret = 
		[
			["U_C_Poloshirt_blue","Poloshirt Blue",250],
			["U_C_Poloshirt_burgundy","Poloshirt Burgundy",250],
			["U_C_Poloshirt_redwhite","Poloshirt Red/White",250],
			["U_C_Poloshirt_salmon","Poloshirt Salmon",250],
			["U_C_Poloshirt_stripped","Poloshirt stripped",250],
			["U_C_Poloshirt_tricolour","Poloshirt Tricolor",250],
			["U_CAF_AG_AFR_CLOTHES_01","Polo Sale 1",250],
			["U_CAF_AG_AFR_CLOTHES_01a","Polo Sale 2",250],
			["U_CAF_AG_AFR_CLOTHES_01b","Polo Sale 3",250],
			["U_CAF_AG_AFR_CLOTHES_01c","Polo Sale 4",250],
			["U_CAF_AG_AFR_CLOTHES_01d","Polo Sale 5",250],
			["U_CAF_AG_AFR_CLOTHES_01e","Polo Sale 6",250],
			
			["U_CAF_AG_AFR_CLOTHES_02b","Tenue Sale 1",400],
			["U_CAF_AG_AFR_CLOTHES_02a","Tenue Sale 2",400],
			["U_CAF_AG_AFR_CLOTHES_02","Tenue Sale 3",400],
			["U_C_Poor_1","Rag tagged clothes",400],

			["U_OrestesBody","Surfing On Land",1000],
			
			["rds_uniform_citizen1",nil,1000],
			["rds_uniform_citizen2",nil,1000],
			["rds_uniform_citizen3",nil,1000],
			["rds_uniform_citizen4",nil,1000],
			
			["rds_uniform_Villager1",nil,1000],
			["rds_uniform_Villager2",nil,1000],
			["rds_uniform_Villager3",nil,1000],
			["rds_uniform_Villager4",nil,1000],
			
			["rds_uniform_Woodlander1",nil,1000],
			["rds_uniform_Woodlander2",nil,1000],
			["rds_uniform_Woodlander3",nil,1000],
			["rds_uniform_Woodlander4",nil,1000],
			
			["R_Uniform_worker_l","Tenue de travail 1",1000],
			["B_Uniform_worker_l","Tenue de travail 2",1000],
			["G_Uniform_worker_l","Tenue de travail 3",1000],
			["rds_uniform_Worker1","Tenue de travail 4",1000],
			["rds_uniform_Worker2","Tenue de travail 5",1000],
			["rds_uniform_Worker3","Tenue de travail 6",1000],
			["rds_uniform_Worker4","Tenue de travail 7",1000],
			
			["rds_uniform_schoolteacher",nil,1250],
			["rds_uniform_assistant",nil,1550],
			// ["rhs_uniform_df15",nil,1250],
			["U_C_WorkerCoveralls","Mechanic Coveralls",2500],
			["U_I_HeliPilotCoveralls","Work on airport",2500],
			// ["rds_uniform_priest",nil,2500],
			
			["rds_uniform_Profiteer1",nil,1500],
			["rds_uniform_Profiteer2",nil,1500],
			["rds_uniform_Profiteer3",nil,1500],
			["rds_uniform_Profiteer4",nil,1500],
			
			["FANTASMA_GiletPolo",nil,1500],
		
			["U_Marshal","Casual Wears",1500],	
			["U_C_Journalist","AAN Journaliste",1500],
			["IRA_Soldier_Outfit_7","Polo Guinness et jean",1500],
			["UVF_Soldier_Outfit_4","Polo Rugby",1500],
			
			["U_PMC_GTShirt_DJeans","TeeShirt vert et jean",1500],
			["U_PMC_GTShirt_SJeans","TeeShirt vert et bas blanc",1500],
			["U_PMC_BlkTShirt_DJeans","TeeShirt noir et jean",1500],
			["U_PMC_BlkTShirt_SJeans",nil,1500],
			["U_PMC_BluTShirt_SJeans",nil,1500],
			["U_PMC_WTShirt_DJeans","TeeShirt blanc et jean",1500],
			["U_PMC_BluePlaidShirt_BeigeCords","Chemise bleu et pantalon beige",1500],
			["U_PMC_RedPlaidShirt_DenimCords","Chemise rouge et jean bleu",1500],
			["U_PMC_BlackPoloShirt_BeigeCords","Polo noir et pantalon beige",1500],
			["U_PMC_BluPolo_BgPants","Polo bleu et bas beige",1500],
			["U_PMC_BgPolo_GrnPants",nil,1500],
			["U_PMC_BlckPolo_BgPants",nil,1500],
			["U_PMC_BlckPolo_BluPants",nil,1500],
			["U_PMC_BluPolo_GrnPants",nil,1500],
			["U_PMC_BrnPolo_BgPants",nil,1500],
			["U_PMC_BrnPolo_BluPants","Polo marron et jean",1500],
			["U_PMC_GrnPolo_BgPants",nil,1500],
			["U_PMC_WhtPolo_BgPants",nil,1500],
			["U_PMC_WhtPolo_BluPants","Polo blanc et jean",1500],
			["U_PMC_WhtPolo_GrnPants",nil,1500],
		
			["U_IG_Guerilla2_2","Green stripped shirt & Pants",1500],
			["U_BG_Guerilla2_1","Routine",1500],
			["U_IG_Guerilla3_1","Brown Jacket & Pants",1500],
			["U_IG_Guerilla2_3","The Outback Rangler",1500],
			
			["U_C_HunterBody_grn","Chasseur 1",2000],
			["R_Uniform_hunter_l","Chasseur 2",2000],
			["G_Uniform_hunter_l","Chasseur 3",2000],
			["U_BG_Guerilla3_1","Chasseur 4",2000],
			["B_Uniform_hunter_l","Chasseur 5",2000],
			["FANTASMA_BlackHunter","Chasseur 6",2000],
			["UVF_Soldier_Outfit_1","Chasseur 7",2000],

			["B_Uniform_survivor1_l","Veste à capuche 1",2250],
			["B_Uniform_survivor2_l","Veste à capuche 2",2250],
			["B_Uniform_survivor3_l","Veste à capuche 3",2250],
			["G_Uniform_survivor1_l","Tenue légère 1",2250],
			["R_Uniform_survivor1_l","Tenue légère 2",2250],
			["G_Uniform_survivor2_l","Tenue légère 3",2250],
			["R_Uniform_survivor2_l","Tenue légère 4",2250],
			["C_Uniform_survivor6_l","Tenue légère 5",2250],
			["C_Uniform_survivor7_l","Tenue légère 6",2250],
			["C_Uniform_survivor1_l","Chemise Rouge",2250],
			["C_Uniform_survivor2_l","Chemise Blanche",2250],
			["C_Uniform_survivor4_l","Chemise Blanche 2",2250],
			["G_Uniform_survivor3_l","Chemise Violette",2250],
			["C_Uniform_survivor3_l","Chemise a carreau",2250],
			["G_Uniform_survivor4_l","Chemise Verte",2250],
			["G_Uniform_survivor5_l","Chemise Motif Ensanglantée",2250],
			["C_Uniform_survivor5_l","Chemise Papillon",2250],
			["G_Uniform_survivor6_l","Chemise Cercle",2250],
			["G_Uniform_survivor7_l","Chemise Rayure Blanche",2250],
			
			["U_I_G_resistanceLeader_F","Work",3500],
			["U_NikosBody","Rakail",3500],
			
			["vip_clothes","Tenue footing",4500],

			["U_NikosAgedBody","Casual Wears",5000],
			
			["rds_uniform_Functionary1",nil,7500],
			["rds_uniform_Functionary2",nil,7500],
			["rds_uniform_Functionary3",nil,7500],
			["rds_uniform_Functionary4",nil,7500],
			["rds_uniform_Functionary5",nil,7500],
			["rds_uniform_Functionary6",nil,7500],
			["rds_uniform_Functionary7",nil,7500]
			
		
			/*["U_C_Driver_1_black",nil,10000],
			["U_C_Driver_1_blue",nil,10000],
			["U_C_Driver_1_red",nil,10000],
			["U_C_Driver_1_orange",nil,10000],
			["U_C_Driver_1_green",nil,10000],
			["U_C_Driver_1_white",nil,10000],
			["U_C_Driver_1_yellow",nil,10000],
			["U_C_Driver_2",nil,10000],
			["U_C_Driver_1",nil,10000],
			["U_C_Driver_3",nil,10000],
			["U_C_Driver_4",nil,10000]*/

		];
		
		if(player getVariable["life_dep",false]) then
		{
			//_ret pushBack ["U_Competitor","Uniforme Dépanneur",500];
			_ret pushBack ["U_PoloDep","Uniforme Dépanneur",500];
			_ret pushBack ["U_C_DepanneurJaune","Combi Jaune",1500];
			_ret pushBack ["U_C_DepanneurOrange","Combi Orange",1500];
			
		};
		if(life_sexe) then
		{
			_ret pushBack ["B_FEM_NATO","Tenue femme 1",800];
			_ret pushBack ["B_FEM_FIA","Tenue femme 2",800];
			_ret pushBack ["O_FEM_CSAT","Tenue femme 3",800];
			_ret pushBack ["I_FEM_AAF","Tenue femme 4",800];
			// _ret pushBack ["O_FEM_CSAT_Long","Tenue femme 5",1200];
			// _ret pushBack ["B_FEM_NATO_long","Tenue femme 6",1200];
			// _ret pushBack ["I_FEM_AAF_long","Tenue femme 7",1200];
			// _ret pushBack ["B_FEM_NATO_Collar","Tenue femme 8",2100];
			// _ret pushBack ["B_FEM_NATO_Rolled","Tenue femme 9",2100];
			// _ret pushBack ["O_FEM_CSAT_Rolled","Tenue femme 10",2100];
			// _ret pushBack ["B_FEM_AAF_Rolled","Tenue femme 11",2100];
		};
	};
	
	//Hats
	case 1:
	{
		_ret = 
		[
			["H_Bandanna_blu","Bandanna bleu",250],
			["H_Bandanna_sand","Bandanna sable",250],
			["H_Bandanna_gry","Grey Bandanna",250],
			["H_Bandanna_cbr",nil,250],
			["H_Bandanna_khk","Khaki Bandanna",250],
			["H_Bandanna_sgg","Sage Bandanna",250],
			["H_Bandanna_surfer","bandanna surfer bleu",250],
			["H_ag_bandanna_01","bandanna surfer pomme",250],
			["H_ag_bandanna_02","bandanna surfer rouge",250],
			["H_ag_bandana_03","bandanna surfer orange",250],
			["H_ag_bandana_04","bandanna surfer jaune",250],
			["H_Bandanna_surfer_blk","bandanna surfer noir",250],
			["H_Bandanna_surfer_grn","bandanna surfer vert",250],
			
			["H_Cap_pmc",nil,500],
			["H_Cap_tan_pmc",nil,500],
			["H_Capbw_pmc",nil,500],
			["H_Capbw_tan_pmc",nil,500],
			["H_Cap_grn_BI",nil,500],
			["H_Cap_blk_CMMG",nil,500],
			["H_Cap_blk_ION",nil,500],
			["H_Cap_tan",nil,500],
			["H_Cap_usblack",nil,500],
			["H_Cap_blk",nil,500],
			["H_Cap_oli",nil,500],
			["H_Cap_press",nil,500],
			["H_Cap_khaki_specops_UK",nil,500],
			["H_Cap_surfer",nil,500],
			["H_Cap_grn",nil,500],
			["H_Cap_blu",nil,500],
			
			["H_BandMask_blk","Hat & Bandanna",600],
			
			["rds_Profiteer_cap2",nil,600],
			["rds_Profiteer_cap4",nil,600],
			["rds_Profiteer_cap3",nil,600],
			["rds_Profiteer_cap1",nil,600],
			
			["H_Booniehat_rgr",nil,700],
			["H_Booniehat_DMARPAT",nil,700],
			["rhs_Booniehat_digi",nil,700],
			["rhs_Booniehat_marpatd",nil,700],
			["rhs_Booniehat_marpatwd",nil,700],
			["H_Booniehat_khk",nil,700],
			["H_Booniehat_oli",nil,700],
			["H_Booniehat_tan",nil,700],
			["H_Booniehat_khk_hs",nil,700],
			
			["rds_worker_cap1","Bonnet 1",600],
			["rds_worker_cap2","Bonnet 2",600],
			["rds_worker_cap3","Bonnet 3",600],
			["rds_worker_cap4","Bonnet 4",600],
			
			["rhs_beanie_green",nil,600],
			["rhs_beanie",nil,600],
			
			["H_StrawHat",nil,700],
			["H_StrawHat_dark",nil,700],
			
			["H_Hat_blue",nil,700],
			["H_Hat_checker",nil,700],
			["H_Hat_grey",nil,700],
			["H_Hat_tan",nil,700],
			["H_Hat_brown",nil,700],
			
			["rds_Woodlander_cap1","Chapka 1",700],
			["rds_Woodlander_cap2","Chapka 2",700],
			["rds_Woodlander_cap3","Chapka 3",700],
			["rds_Woodlander_cap4","Chapka 4",700],
			
			["rds_Villager_cap1","Béret 1",700],
			["rds_Villager_cap2","Béret 2",700],
			["rds_Villager_cap3","Béret 3",700],
			["rds_Villager_cap4","Béret 4",700],
			
			["H_caf_ag_paktol_02",nil,700],
			["H_caf_ag_paktol_03",nil,700],
			["H_caf_ag_paktol",nil,700],
			["H_caf_ag_paktol_04",nil,700]
			
			
			/*["H_RacingHelmet_1_black_F",nil,2500],
			["H_RacingHelmet_1_red_F",nil,2500],
			["H_RacingHelmet_1_white_F",nil,2500],
			["H_RacingHelmet_1_blue_F",nil,2500],
			["H_RacingHelmet_1_yellow_F",nil,2500],
			["H_RacingHelmet_1_green_F",nil,2500],
			["H_RacingHelmet_1_orange_F",nil,2500],
			["H_RacingHelmet_1_F",nil,2500],
			["H_RacingHelmet_2_F",nil,2500],
			["H_RacingHelmet_3_F",nil,2500],
			["H_RacingHelmet_4_F",nil,2500]*/
		];
	};
	
	//Glasses
	case 2:
	{
		_ret = 
		[
			["G_Sport_BlackWhite",nil,50],
			["G_Sport_Blackyellow",nil,50],
			["G_Sport_Red",nil,50],
			["G_Sport_Checkered",nil,50],
			["G_Sport_Greenblack",nil,50],
			["G_Sport_Blackred",nil,50],
			
			["G_Shades_Blue",nil,100],
			["G_Shades_Black",nil,100],
			["G_Shades_Red",nil,100],
			["G_Shades_Green",nil,100],
			["G_Squares_Tinted",nil,100],
			["G_Squares",nil,100],
			
			["G_Lady_Red",nil,150],
			["G_Lady_Mirror",nil,150],
			["G_Lady_Dark",nil,150],
			["G_Lady_Blue",nil,150],
			
			["G_Spectacles",nil,200],
			["G_Spectacles_Tinted",nil,200],
			["G_Aviator",nil,200],
			
			["rhs_googles_black",nil,200],
			["rhs_googles_clear",nil,200],
			
			["G_Lowprofile",nil,250],
			["G_Goggles_VR",nil,250],

			["Pomi_Goggles",nil,250],
			["Pomi_Goggles_Grn",nil,250],
			["Pomi_Goggles_Snd",nil,250]
		];
	};
	
	//Vest
	case 3:
	{
		_ret = 
		[
			["rhs_vest_commander",nil,1000],
			["rhs_6sh46",nil,1000],

			["V_Rangemaster_belt",nil,1000],
			["rhs_vest_commander",nil,1000],
		
			["V_BandollierB_cbr",nil,1500],
			["V_BandollierB_oli",nil,1500],
			["V_BandollierB_blk",nil,1500],
			["V_BandollierB_rgr",nil,1500],
			["V_BandollierB_khk",nil,1500],

			["V_Press_F",nil,2000],
			
			["V_HarnessO_brn",nil,3500],
			["V_HarnessO_gry",nil,3500],
			
			["V_Chestrig_khk",nil,3500],
			["V_Chestrig_rgr",nil,3500]
		];
	};
	
	//Backpacks
	case 4:
	{
		_ret = 
		[
			["rhs_sidor",nil,2500],
			["rhs_assault_umbts",nil,2500],
			
			["B_AssaultPack_cbr",nil,2500],
			["B_AssaultPack_khk",nil,2500],
			["B_AssaultPack_sgg",nil,2500],
			["B_AssaultPack_rgr",nil,2500],
			["B_AssaultPack_blk",nil,2500],
			
			["B_FieldPack_cbr",nil,3500],
			["B_FieldPack_khk",nil,3500],
			["B_FieldPack_oli",nil,3500],
			["B_FieldPack_blk",nil,3500],
			["B_FieldPack_oucamo",nil,3500],
			
			["B_TacticalPack_blk",nil,4500],
			["B_TacticalPack_oli",nil,4500],
			["B_TacticalPack_rgr",nil,4500],
			["B_Bergen_sgg",nil,4500],
			
			["B_Kitbag_cbr",nil,5500],
			["B_Kitbag_sgg",nil,5500],
			["B_Kitbag_rgr",nil,5500],
			["PMC_B_Kitbag_blk",nil,5500],
			
			
			["B_Carryall_oli",nil,6500],
			["B_Carryall_cbr",nil,6500],
			["B_Carryall_khk",nil,6500],
			["PMC_B_Carryall_blk",nil,6500],
			["B_Carryall_oucamo",nil,6500],

	
			["tf_anprc155_coyote",nil,15000],
			["B_Parachute",nil,15000]
		];
	};
};

_ret;