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
		_ret pushBack ["U_PoloGendarmerie","Uniforme de gendarme",0];
		
		// Grade Brigadier
		if(__GETC__(life_coplevel) >= 2) then
		{
			_ret pushBack ["rpima_uniform",nil,0];
			_ret pushBack ["U_B_UniformePolaireGendarme","Polaire Gendarme",0];
		};
		// Grade Lieutenant
		if(__GETC__(life_coplevel) >= 3) then
		{
		};
		// BAC / PJ
		if(l_g_bacpj) then
		{
			_ret pushBack ["U_B_UniformePolaireBleueGendarme","Polaire Bleue Gendarme",0];
			_ret pushBack ["U_C_Poloshirt_blue","Poloshirt Blue",0];
			_ret pushBack ["U_C_Poloshirt_burgundy","Poloshirt Burgundy",0];
			_ret pushBack ["U_C_Poloshirt_redwhite","Poloshirt Red/White",0];
			_ret pushBack ["U_C_Poloshirt_salmon","Poloshirt Salmon",0];
			_ret pushBack ["U_C_Poloshirt_stripped","Poloshirt stripped",0];
			_ret pushBack ["U_C_Poloshirt_tricolour","Poloshirt Tricolor",0];
			_ret pushBack ["U_CAF_AG_AFR_CLOTHES_01","Polo Sale 1",0];
			_ret pushBack ["U_CAF_AG_AFR_CLOTHES_01a","Polo Sale 2",0];
			_ret pushBack ["U_CAF_AG_AFR_CLOTHES_01b","Polo Sale 3",0];
			_ret pushBack ["U_CAF_AG_AFR_CLOTHES_01c","Polo Sale 4",0];
			_ret pushBack ["U_CAF_AG_AFR_CLOTHES_01d","Polo Sale 5",0];
			_ret pushBack ["U_CAF_AG_AFR_CLOTHES_01e","Polo Sale 6",0];
			
			_ret pushBack ["U_CAF_AG_AFR_CLOTHES_02b","Tenue Sale 1",0];
			_ret pushBack ["U_CAF_AG_AFR_CLOTHES_02a","Tenue Sale 2",0];
			_ret pushBack ["U_CAF_AG_AFR_CLOTHES_02","Tenue Sale 3",0];
			_ret pushBack ["U_C_Poor_1","Rag tagged clothes",0];

			_ret pushBack ["U_OrestesBody","Surfing On Land",0];
			
			_ret pushBack ["rds_uniform_citizen1",nil,0];
			_ret pushBack ["rds_uniform_citizen2",nil,0];
			_ret pushBack ["rds_uniform_citizen3",nil,0];
			_ret pushBack ["rds_uniform_citizen4",nil,0];
			
			_ret pushBack ["rds_uniform_Villager1",nil,0];
			_ret pushBack ["rds_uniform_Villager2",nil,0];
			_ret pushBack ["rds_uniform_Villager3",nil,0];
			_ret pushBack ["rds_uniform_Villager4",nil,0];
			
			_ret pushBack ["rds_uniform_Woodlander1",nil,0];
			_ret pushBack ["rds_uniform_Woodlander2",nil,0];
			_ret pushBack ["rds_uniform_Woodlander3",nil,0];
			_ret pushBack ["rds_uniform_Woodlander4",nil,0];
			
			_ret pushBack ["R_Uniform_worker_l","Tenue de travail 1",0];
			_ret pushBack ["B_Uniform_worker_l","Tenue de travail 2",0];
			_ret pushBack ["G_Uniform_worker_l","Tenue de travail 3",0];
			_ret pushBack ["rds_uniform_Worker1","Tenue de travail 4",0];
			_ret pushBack ["rds_uniform_Worker2","Tenue de travail 5",0];
			_ret pushBack ["rds_uniform_Worker3","Tenue de travail 6",0];
			_ret pushBack ["rds_uniform_Worker4","Tenue de travail 7",0];
			
			_ret pushBack ["rds_uniform_schoolteacher",nil,0];
			_ret pushBack ["rds_uniform_assistant",nil,0];
			// _ret pushBack ["rhs_uniform_df15",nil,1250];
			_ret pushBack ["U_C_WorkerCoveralls","Mechanic Coveralls",0];
			_ret pushBack ["U_I_HeliPilotCoveralls","Work on airport",0];
			// _ret pushBack ["rds_uniform_priest",nil,0];
			
			_ret pushBack ["rds_uniform_Profiteer1",nil,0];
			_ret pushBack ["rds_uniform_Profiteer2",nil,0];
			_ret pushBack ["rds_uniform_Profiteer3",nil,0];
			_ret pushBack ["rds_uniform_Profiteer4",nil,0];
			
			_ret pushBack ["FANTASMA_GiletPolo",nil,0];
		
			_ret pushBack ["U_Marshal","Casual Wears",0];	
			_ret pushBack ["U_C_Journalist","AAN Journaliste",0];
			_ret pushBack ["IRA_Soldier_Outfit_7","Polo Guinness et jean",0];
			_ret pushBack ["UVF_Soldier_Outfit_4","Polo Rugby",0];
			
			_ret pushBack ["U_PMC_GTShirt_DJeans","TeeShirt vert et jean",0];
			_ret pushBack ["U_PMC_GTShirt_SJeans","TeeShirt vert et bas blanc",0];
			_ret pushBack ["U_PMC_BlkTShirt_DJeans","TeeShirt noir et jean",0];
			_ret pushBack ["U_PMC_BlkTShirt_SJeans",nil,0];
			_ret pushBack ["U_PMC_BluTShirt_SJeans",nil,0];
			_ret pushBack ["U_PMC_WTShirt_DJeans","TeeShirt blanc et jean",0];
			_ret pushBack ["U_PMC_BluePlaidShirt_BeigeCords","Chemise bleu et pantalon beige",0];
			_ret pushBack ["U_PMC_RedPlaidShirt_DenimCords","Chemise rouge et jean bleu",0];
			_ret pushBack ["U_PMC_BlackPoloShirt_BeigeCords","Polo noir et pantalon beige",0];
			_ret pushBack ["U_PMC_BluPolo_BgPants","Polo bleu et bas beige",0];
			_ret pushBack ["U_PMC_BgPolo_GrnPants",nil,0];
			_ret pushBack ["U_PMC_BlckPolo_BgPants",nil,0];
			_ret pushBack ["U_PMC_BlckPolo_BluPants",nil,0];
			_ret pushBack ["U_PMC_BluPolo_GrnPants",nil,0];
			_ret pushBack ["U_PMC_BrnPolo_BgPants",nil,0];
			_ret pushBack ["U_PMC_BrnPolo_BluPants","Polo marron et jean",0];
			_ret pushBack ["U_PMC_GrnPolo_BgPants",nil,0];
			_ret pushBack ["U_PMC_WhtPolo_BgPants",nil,0];
			_ret pushBack ["U_PMC_WhtPolo_BluPants","Polo blanc et jean",0];
			_ret pushBack ["U_PMC_WhtPolo_GrnPants",nil,0];
		
			_ret pushBack ["U_IG_Guerilla2_2","Green stripped shirt & Pants",0];
			_ret pushBack ["U_BG_Guerilla2_1","Routine",0];
			_ret pushBack ["U_IG_Guerilla3_1","Brown Jacket & Pants",0];
			_ret pushBack ["U_IG_Guerilla2_3","The Outback Rangler",0];
			
			_ret pushBack ["U_C_HunterBody_grn","Chasseur 1",0];
			_ret pushBack ["R_Uniform_hunter_l","Chasseur 2",0];
			_ret pushBack ["G_Uniform_hunter_l","Chasseur 3",0];
			_ret pushBack ["U_BG_Guerilla3_1","Chasseur 4",0];
			_ret pushBack ["B_Uniform_hunter_l","Chasseur 5",0];
			_ret pushBack ["FANTASMA_BlackHunter","Chasseur 6",0];
			_ret pushBack ["UVF_Soldier_Outfit_1","Chasseur 7",0];

			_ret pushBack ["B_Uniform_survivor1_l","Veste à capuche 1",0];
			_ret pushBack ["B_Uniform_survivor2_l","Veste à capuche 2",0];
			_ret pushBack ["B_Uniform_survivor3_l","Veste à capuche 3",0];
			_ret pushBack ["G_Uniform_survivor1_l","Tenue légère 1",0];
			_ret pushBack ["R_Uniform_survivor1_l","Tenue légère 2",0];
			_ret pushBack ["G_Uniform_survivor2_l","Tenue légère 3",0];
			_ret pushBack ["R_Uniform_survivor2_l","Tenue légère 4",0];
			_ret pushBack ["C_Uniform_survivor6_l","Tenue légère 5",0];
			_ret pushBack ["C_Uniform_survivor7_l","Tenue légère 6",0];
			_ret pushBack ["C_Uniform_survivor1_l","Chemise Rouge",0];
			_ret pushBack ["C_Uniform_survivor2_l","Chemise Blanche",0];
			_ret pushBack ["C_Uniform_survivor4_l","Chemise Blanche 2",0];
			_ret pushBack ["G_Uniform_survivor3_l","Chemise Violette",0];
			_ret pushBack ["C_Uniform_survivor3_l","Chemise a carreau",0];
			_ret pushBack ["G_Uniform_survivor4_l","Chemise Verte",0];
			_ret pushBack ["G_Uniform_survivor5_l","Chemise Motif Ensanglantée",0];
			_ret pushBack ["C_Uniform_survivor5_l","Chemise Papillon",0];
			_ret pushBack ["G_Uniform_survivor6_l","Chemise Cercle",0];
			_ret pushBack ["G_Uniform_survivor7_l","Chemise Rayure Blanche",0];
			
			_ret pushBack ["U_I_G_resistanceLeader_F","Work",0];
			_ret pushBack ["U_NikosBody","Rakail",0];
			
			_ret pushBack ["vip_clothes","Tenue footing",0];
			_ret pushBack ["rds_uniform_Functionary1",nil,0];
			_ret pushBack ["rds_uniform_Functionary2",nil,0];
			_ret pushBack ["rds_uniform_Functionary3",nil,0];
			_ret pushBack ["rds_uniform_Functionary4",nil,0];
			_ret pushBack ["rds_uniform_Functionary5",nil,0];
			_ret pushBack ["rds_uniform_Functionary6",nil,0];
			_ret pushBack ["rds_uniform_Functionary7",nil,0];
		};
		// APRG
		if(l_g_aprg) then
		{
			_ret pushBack ["UVF_Soldier_Outfit_4",nil,0];
			_ret pushBack ["U_PMC_BluPolo_BgPants",nil,0];
		};
		// Unité tactique
		if(l_g_swat) then
		{
			_ret pushBack ["gign_uniform",nil,0];
		};
		// Unité tactique
		if(l_g_swatSnipe) then
		{
			_ret pushBack ["U_B_GhillieSuit",nil,0];
			_ret pushBack ["U_I_GhillieSuit",nil,0];
			_ret pushBack ["U_B_FullGhillie_ard",nil,0];
			_ret pushBack ["U_B_FullGhillie_lsh",nil,0];
			_ret pushBack ["U_B_FullGhillie_sard",nil,0];
		};
		// Pilote
		if(l_g_air) then
		{
			_ret pushBack ["U_B_PilotCoveralls",nil,0];
			_ret pushBack ["U_I_pilotCoveralls",nil,0];
			_ret pushBack ["U_B_HeliPilotCoveralls",nil,0];
			_ret pushBack ["U_I_HeliPilotCoveralls",nil,0];
		};
		// Bomb squad
		if(l_g_demo) then
		{
			_ret pushBack ["U_bombsuit",nil,0];
		};
		// Grade Capitaine
		if(__GETC__(life_coplevel) >= 4) then
		{
		};
		
		// Grade Haut-Gradés
		if(__GETC__(life_coplevel) >= 5) then
		{
			
		};
		
		//_ret pushBack ["rds_uniform_Policeman","Tenue d'apparat",0];
		
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
			_ret pushBack ["kio_fhat",nil,0];
		};
		if(__GETC__(life_coplevel) >= 3) then
		{
			_ret pushBack ["H_Beret_02",nil,0];
			// _ret pushBack ["H_PilotHelmetHeli_B",nil,0];
			_ret pushBack ["H_Cap_headphones",nil,0];
			_ret pushBack ["H_Watchcap_blk",nil,0];
		};
		// PJ / BAC
		if(l_g_bacpj) then
		{
			_ret pushBack ["H_Bandanna_blu","Bandanna bleu",0];
			_ret pushBack ["H_Bandanna_sand","Bandanna sable",0];
			_ret pushBack ["H_Bandanna_gry","Grey Bandanna",0];
			_ret pushBack ["H_Bandanna_cbr",nil,0];
			_ret pushBack ["H_Bandanna_khk","Khaki Bandanna",0];
			_ret pushBack ["H_Bandanna_sgg","Sage Bandanna",0];
			_ret pushBack ["H_Bandanna_surfer","bandanna surfer bleu",0];
			_ret pushBack ["H_ag_bandanna_01","bandanna surfer pomme",0];
			_ret pushBack ["H_ag_bandanna_02","bandanna surfer rouge",0];
			_ret pushBack ["H_ag_bandana_03","bandanna surfer orange",0];
			_ret pushBack ["H_ag_bandana_04","bandanna surfer jaune",0];
			_ret pushBack ["H_Bandanna_surfer_blk","bandanna surfer noir",0];
			_ret pushBack ["H_Bandanna_surfer_grn","bandanna surfer vert",0];
			
			_ret pushBack ["H_Cap_pmc",nil,0];
			_ret pushBack ["H_Cap_tan_pmc",nil,0];
			_ret pushBack ["H_Capbw_pmc",nil,0];
			_ret pushBack ["H_Capbw_tan_pmc",nil,0];
			_ret pushBack ["H_Cap_grn_BI",nil,0];
			_ret pushBack ["H_Cap_blk_CMMG",nil,0];
			_ret pushBack ["H_Cap_blk_ION",nil,0];
			_ret pushBack ["H_Cap_tan",nil,0];
			_ret pushBack ["H_Cap_usblack",nil,0];
			_ret pushBack ["H_Cap_blk",nil,0];
			_ret pushBack ["H_Cap_oli",nil,0];
			_ret pushBack ["H_Cap_press",nil,0];
			_ret pushBack ["H_Cap_khaki_specops_UK",nil,0];
			_ret pushBack ["H_Cap_surfer",nil,0];
			_ret pushBack ["H_Cap_grn",nil,0];
			_ret pushBack ["H_Cap_blu",nil,0];
			
			_ret pushBack ["H_BandMask_blk","Hat & Bandanna",0];
			
			_ret pushBack ["rds_Profiteer_cap2",nil,0];
			_ret pushBack ["rds_Profiteer_cap4",nil,0];
			_ret pushBack ["rds_Profiteer_cap3",nil,0];
			_ret pushBack ["rds_Profiteer_cap1",nil,0];
			
			_ret pushBack ["H_Booniehat_rgr",nil,0];
			_ret pushBack ["H_Booniehat_DMARPAT",nil,0];
			_ret pushBack ["rhs_Booniehat_digi",nil,0];
			_ret pushBack ["rhs_Booniehat_marpatd",nil,0];
			_ret pushBack ["rhs_Booniehat_marpatwd",nil,0];
			_ret pushBack ["H_Booniehat_khk",nil,0];
			_ret pushBack ["H_Booniehat_oli",nil,0];
			_ret pushBack ["H_Booniehat_tan",nil,0];
			_ret pushBack ["H_Booniehat_khk_hs",nil,0];
			
			_ret pushBack ["rds_worker_cap1","Bonnet 1",0];
			_ret pushBack ["rds_worker_cap2","Bonnet 2",0];
			_ret pushBack ["rds_worker_cap3","Bonnet 3",0];
			
			_ret pushBack ["rhs_beanie_green",nil,0];
			_ret pushBack ["rhs_beanie",nil,0];
			
			_ret pushBack ["H_StrawHat",nil,0];
			_ret pushBack ["H_StrawHat_dark",nil,0];
			
			_ret pushBack ["H_Hat_blue",nil,0];
			_ret pushBack ["H_Hat_checker",nil,0];
			_ret pushBack ["H_Hat_grey",nil,0];
			_ret pushBack ["H_Hat_tan",nil,0];
			_ret pushBack ["H_Hat_brown",nil,0];
			
			_ret pushBack ["H_caf_ag_fur2",nil,0];
			_ret pushBack ["H_caf_ag_fur",nil,0];
			_ret pushBack ["rds_Woodlander_cap1","Chapka 1",0];
			_ret pushBack ["rds_Woodlander_cap2","Chapka 2",0];
			_ret pushBack ["rds_Woodlander_cap3","Chapka 3",0];
			_ret pushBack ["rds_Woodlander_cap4","Chapka 4",0];
			
			_ret pushBack ["rds_Villager_cap1","Béret 1",0];
			_ret pushBack ["rds_Villager_cap2","Béret 2",0];
			_ret pushBack ["rds_Villager_cap3","Béret 3",0];
			_ret pushBack ["rds_Villager_cap4","Béret 4",0];
			
			_ret pushBack ["H_caf_ag_paktol_02",nil,0];
			_ret pushBack ["H_caf_ag_paktol_03",nil,0];
			_ret pushBack ["H_caf_ag_paktol",nil,0];
			_ret pushBack ["H_caf_ag_paktol_04",nil,0];
			
			_ret pushBack ["H_Watchcap_khk",nil,0];
			_ret pushBack ["H_Cap_police",nil,0];
			_ret pushBack ["RPIMA_Balaclava",nil,0];
		};
		// APRG
		if(l_g_aprg) then
		{
			_ret pushBack ["rds_worker_cap4",nil,0];
		};
		// Unité tactique
		if(l_g_swat) then
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
		if(l_g_air || l_g_airT) then
		{
			_ret pushBack ["H_HelmetCrew_B",nil,0];
			_ret pushBack ["H_HelmetCrew_O",nil,0];
			_ret pushBack ["H_CrewHelmetHeli_B",nil,0];
			_ret pushBack ["H_CrewHelmetHeli_O",nil,0];
		};
		// Bomb squad
		if(l_g_demo) then
		{
			_ret pushBack ["H_Bombsuit_Helmet",nil,0];
			_ret pushBack ["H_Titan_Helmet",nil,0];
			_ret pushBack ["H_Titan_Helmet_O",nil,0];
		};
		// Grade Capitaine
		if(__GETC__(life_coplevel) >= 4) then
		{
			_ret pushBack ["H_Beret_Colonel",nil,0];
			_ret pushBack ["kio_fhat_g",nil,0];
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
			["G_Sport_BlackWhite",nil,0],
			["G_Sport_Blackyellow",nil,0],
			["G_Sport_Red",nil,0],
			["G_Sport_Checkered",nil,0],
			["G_Sport_Greenblack",nil,0],
			["G_Sport_Blackred",nil,0],
			
			["G_Shades_Blue",nil,0],
			["G_Shades_Black",nil,0],
			["G_Shades_Red",nil,0],
			["G_Shades_Green",nil,0],
			["G_Squares_Tinted",nil,0],
			["G_Squares",nil,0],
			
			["G_Lady_Red",nil,0],
			["G_Lady_Mirror",nil,0],
			["G_Lady_Dark",nil,0],
			["G_Lady_Blue",nil,0],
			
			["G_Spectacles",nil,0],
			["G_Spectacles_Tinted",nil,0],
			["G_Aviator",nil,0],
			
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
		if(l_g_bacpj) then
		{
			_ret pushBack ["rhs_vest_commander",nil,0];
			_ret pushBack ["rhs_6sh46",nil,0];
		
			_ret pushBack ["V_BandollierB_cbr",nil,0];
			_ret pushBack ["V_BandollierB_oli",nil,0];
			_ret pushBack ["V_BandollierB_blk",nil,0];
			_ret pushBack ["V_BandollierB_rgr",nil,0];
			_ret pushBack ["V_BandollierB_khk",nil,0];
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
		// APRG
		if(l_g_aprg) then
		{
			_ret pushBack ["V_PlateCarrier1_PMC_blk",nil,0];
		};
		// Medic
		if(l_g_medic) then
		{
			_ret pushBack ["V_TacVestIR_blk",nil,0];
		};
		// Unité tactique
		if(l_g_swat) then
		{
			_ret pushBack["gign_HeavyVest",nil,0];
		};
		// Bomb squad
		if(l_g_demo) then
		{
			_ret pushBack ["Specter_RAV",nil,0];
			_ret pushBack ["Specter_RAV_BLK",nil,0];
			_ret pushBack ["Specter_MBSS",nil,0];
			_ret pushBack ["Specter_MBSS_BLK",nil,0];
			_ret pushBack ["Specter_MBSS_TAN",nil,0];
			_ret pushBack ["Specter_MBSS_light",nil,0];
			_ret pushBack ["Specter_MBSS_light_BLK",nil,0];
			_ret pushBack ["Specter_MBSS_light_TAN",nil,0];
			_ret pushBack ["Specter_MBSS_PACA",nil,0];
			_ret pushBack ["Specter_MBSS_PACA_BLK",nil,0];
			_ret pushBack ["Specter_MBSS_PACA_TAN",nil,0];
			_ret pushBack ["Specter_MBSS_PACA_l",nil,0];
			_ret pushBack ["Specter_MBSS_PACA_l_BLK",nil,0];
			_ret pushBack ["Specter_MBSS_PACA_l_TAN",nil,0];
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
		// PJ / BAC
		if(l_g_bacpj) then
		{
			_ret pushBack ["rhs_sidor",nil,0];
			_ret pushBack ["rhs_assault_umbts",nil,0];
			
			_ret pushBack ["B_AssaultPack_cbr",nil,0];
			_ret pushBack ["B_AssaultPack_khk",nil,0];
			_ret pushBack ["B_AssaultPack_sgg",nil,0];
			_ret pushBack ["B_AssaultPack_rgr",nil,0];
			_ret pushBack ["B_AssaultPack_blk",nil,0];
			
			_ret pushBack ["B_FieldPack_cbr",nil,0];
			_ret pushBack ["B_FieldPack_khk",nil,0];
			_ret pushBack ["B_FieldPack_oli",nil,0];
			_ret pushBack ["B_FieldPack_blk",nil,0];
			_ret pushBack ["B_FieldPack_oucamo",nil,0];
			
			_ret pushBack ["B_TacticalPack_blk",nil,0];
			_ret pushBack ["B_TacticalPack_oli",nil,0];
			_ret pushBack ["B_TacticalPack_rgr",nil,0];
			_ret pushBack ["B_Bergen_sgg",nil,0];
			
			_ret pushBack ["B_Kitbag_cbr",nil,0];
			_ret pushBack ["B_Kitbag_sgg",nil,0];
			_ret pushBack ["B_Kitbag_rgr",nil,0];
			_ret pushBack ["PMC_B_Kitbag_blk",nil,0];
			
			
			_ret pushBack ["B_Carryall_oli",nil,0];
			_ret pushBack ["B_Carryall_cbr",nil,0];
			_ret pushBack ["B_Carryall_khk",nil,0];
			_ret pushBack ["PMC_B_Carryall_blk",nil,0];
			_ret pushBack ["B_Carryall_oucamo",nil,0];
		};
		// APRG
		if(l_g_aprg) then
		{
			_ret pushBack ["PMC_B_Carryall_blk",nil,0];
		};
		// Unité Tactique
		if(l_g_swatDrone) then
		{
			_ret pushBack ["B_UAV_01_backpack_F",nil,0];
		};
		// Unité Swat
		if(l_g_swat) then
		{
			_ret pushBack ["B_Parachute",nil,0];
		};
		// 
		if(l_g_air) then
		{
			_ret pushBack ["B_Parachute",nil,0];
		};
	};
};

_ret;