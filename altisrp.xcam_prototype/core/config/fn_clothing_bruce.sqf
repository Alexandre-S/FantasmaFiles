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
			["U_C_Poloshirt_burgundy","Poloshirt Burgundy",275],
			["U_C_Poloshirt_redwhite","Poloshirt Red/White",150],
			["U_C_Poloshirt_salmon","Poloshirt Salmon",175],
			["U_C_Poloshirt_stripped","Poloshirt stripped",125],
			["U_C_Poloshirt_tricolour","Poloshirt Tricolor",350],
			["U_CAF_AG_AFR_CLOTHES_01","Polo Sale 1",100],
			["U_CAF_AG_AFR_CLOTHES_01a","Polo Sale 2",100],
			["U_CAF_AG_AFR_CLOTHES_01b","Polo Sale 3",100],
			["U_CAF_AG_AFR_CLOTHES_01c","Polo Sale 4",100],
			["U_CAF_AG_AFR_CLOTHES_01d","Polo Sale 5",100],
			["U_CAF_AG_AFR_CLOTHES_01e","Polo Sale 6",100],
			["U_CAF_AG_AFR_CLOTHES_02b","Tenue Sale 1",100],
			["U_CAF_AG_AFR_CLOTHES_02a","Tenue Sale 2",100],
			["U_CAF_AG_AFR_CLOTHES_02","Tenue Sale 3",100],
			["U_C_Poor_2","Rag tagged clothes",250],
			["rds_uniform_citizen1",nil,650],
			["rds_uniform_citizen2",nil,650],
			["rds_uniform_citizen3",nil,650],
			["rds_uniform_citizen4",nil,650],
			["rds_uniform_Villager1",nil,700],
			["rds_uniform_Villager2",nil,700],
			["rds_uniform_Villager3",nil,700],
			["rds_uniform_Villager4",nil,700],
			["rds_uniform_Profiteer1",nil,850],
			["rds_uniform_Profiteer2",nil,850],
			["rds_uniform_Profiteer3",nil,850],
			["rds_uniform_Profiteer4",nil,850],
			["rds_uniform_Woodlander1",nil,1000],
			["rds_uniform_Woodlander2",nil,1000],
			["rds_uniform_Woodlander3",nil,1000],
			["rds_uniform_Woodlander4",nil,1000],
			["U_IG_Guerilla2_2","Green stripped shirt & Pants",650],
			["U_BG_Guerilla2_1","Routine",700],
			["U_IG_Guerilla3_1","Brown Jacket & Pants",735],
			["U_IG_Guerilla2_3","The Outback Rangler",1200],
			["FANTASMA_GiletPolo",nil,1350],
			["U_C_WorkerCoveralls","Mechanic Coveralls",2500],
			["U_OrestesBody","Surfing On Land",1100],
			["U_BG_Guerilla2_2","Chemise verte 1",1100],
			["U_BG_Guerilla2_3","Chemise Noire 1",1100],
			["rds_uniform_schoolteacher",nil,1250],
			["rds_uniform_assistant",nil,1550],
			["U_C_HunterBody_grn","Chasseur 1",2000],
			["G_Uniform_hunter_l","Chasseur 2",2000],
			["U_BG_Guerilla3_1","Chasseur 3",2000],
			["FANTASMA_BlackHunter","Chasseur 4",2000],
			["B_Uniform_survivor1_l","Veste à capuche 1",3000],
			["B_Uniform_survivor2_l","Veste à capuche 2",3000],
			["B_Uniform_survivor3_l","Veste à capuche 3",3000],
			["G_Uniform_survivor1_l","Tenue légère 1",2250],
			["R_Uniform_survivor1_l","Tenue légère 2",2250],
			["G_Uniform_survivor2_l","Tenue légère 3",2250],
			["R_Uniform_survivor2_l","Tenue légère 4",2250],
			["C_Uniform_survivor6_l","Tenue légère 5",2250],
			["C_Uniform_survivor7_l","Tenue légère 6",2250],
			["C_Uniform_survivor1_l","Chemise Rouge",1750],
			["C_Uniform_survivor2_l","Chemise Blanche",1750],
			["C_Uniform_survivor4_l","Chemise Blanche 2",1750],
			["G_Uniform_survivor3_l","Chemise Violette",1750],
			["C_Uniform_survivor3_l","Chemise a carreau",1750],
			["G_Uniform_survivor4_l","Chemise Verte",1750],
			["G_Uniform_survivor5_l","Chemise Motif Ensanglantée",1750],
			["C_Uniform_survivor5_l","Chemise Papillon",1750],
			["G_Uniform_survivor6_l","Chemise Cercle",1750],
			["G_Uniform_survivor7_l","Chemise Rayure Blanche",1750],
			["R_Uniform_worker_l","Tenue de travail 1",1300],
			["B_Uniform_worker_l","Tenue de travail 2",1300],
			["G_Uniform_worker_l","Tenue de travail 3",1300],
			["rds_uniform_Worker1","Tenue de travail 4",1300],
			["rds_uniform_Worker2","Tenue de travail 5",1300],
			["rds_uniform_Worker3","Tenue de travail 6",1300],
			["rds_uniform_Worker4","Tenue de travail 7",1300],
			["U_I_G_Story_Protagonist_F","Work",2000],
			["U_NikosBody","Rakail",3500],
			["U_NikosAgedBody","Casual Wears",5000],
			["U_Marshal","Casual Wears",5500],	
			["U_I_HeliPilotCoveralls","Work on airport",6000],
			["U_C_Journalist","AAN",6500],
			["vip_clothes","Tenue footing",5500],
			
			["U_PMC_GTShirt_DJeans","TeeShirt vert et jean",3500],
			["U_PMC_GTShirt_SJeans","TeeShirt vert et bas blanc",3500],
			["U_PMC_BlkTShirt_DJeans","TeeShirt noir et jean",3500],
			["U_PMC_BlkTShirt_SJeans",nil,3500],
			["U_PMC_BluTShirt_SJeans",nil,3500],
			["U_PMC_WTShirt_DJeans","TeeShirt blanc et jean",3500],
			["U_PMC_BluePlaidShirt_BeigeCords","Chemise bleu et pantalon beige",3500],
			["U_PMC_RedPlaidShirt_DenimCords","Chemise rouge et jean bleu",3500],
			["U_PMC_BlackPoloShirt_BeigeCords","Polo noir et pantalon beige",3500],
			["U_PMC_BluPolo_BgPants","Polo bleu et bas beige",3500],
			["U_PMC_BgPolo_GrnPants",nil,3500],
			["U_PMC_BlckPolo_BgPants",nil,3500],
			["U_PMC_BlckPolo_BluPants",nil,3500],
			["U_PMC_BluPolo_GrnPants",nil,3500],
			["U_PMC_BrnPolo_BgPants",nil,3500],
			["U_PMC_BrnPolo_BluPants","Polo marron et jean",3500],
			["U_PMC_GrnPolo_BgPants",nil,3500],
			["U_PMC_WhtPolo_BgPants",nil,3500],
			["U_PMC_WhtPolo_BluPants","Polo blanc et jean",3500],
			["U_PMC_WhtPolo_GrnPants",nil,3500],
			
			["IRA_Soldier_Outfit_7","Polo Guinness et jean",3500],
			["UVF_Soldier_Outfit_4","Polo Rugby",3500],
			["rds_uniform_Functionary1",nil,7500],
			["rds_uniform_Functionary2",nil,7500],
			["rds_uniform_priest",nil,2500]
		];
		/*if(license_civ_vigil) then
		{
			_ret pushBack ["U_B_CombatUniform_mcam","Tenue Vigil 1",7500];
			_ret pushBack ["U_B_CombatUniform_mcam_vest","Tenue Vigil 2",7500];
		};*/
		if(player getVariable["life_dep",false]) then
		{
			_ret pushBack ["U_Competitor","Uniforme Dépanneur",500];
		};
		if(life_sexe) then
		{
			_ret pushBack ["B_FEM_NATO","Tenue femme 1",800];
			_ret pushBack ["B_FEM_FIA","Tenue femme 2",800];
			_ret pushBack ["O_FEM_CSAT","Tenue femme 3",800];
			_ret pushBack ["I_FEM_AAF","Tenue femme 4",800];
			_ret pushBack ["O_FEM_CSAT_Long","Tenue femme 5",1200];
			_ret pushBack ["B_FEM_NATO_long","Tenue femme 6",1200];
			_ret pushBack ["I_FEM_AAF_long","Tenue femme 7",1200];
			_ret pushBack ["B_FEM_NATO_Collar","Tenue femme 8",2100];
			_ret pushBack ["B_FEM_NATO_Rolled","Tenue femme 9",2100];
			_ret pushBack ["O_FEM_CSAT_Rolled","Tenue femme 10",2100];
			_ret pushBack ["B_FEM_AAF_Rolled","Tenue femme 11",2100];
		};
	};
	
	//Hats
	case 1:
	{
		_ret = 
		[
			["H_Bandanna_camo","Camo Bandanna",120],
			["H_Bandanna_surfer","Surfer Bandanna",130],
			["H_Bandanna_gry","Grey Bandanna",150],
			["H_Bandanna_cbr",nil,165],
			["H_Bandanna_surfer",nil,135],
			["H_Bandanna_khk","Khaki Bandanna",145],
			["H_Bandanna_sgg","Sage Bandanna",160],
			["H_StrawHat","Straw Fedora",225],
			["H_BandMask_blk","Hat & Bandanna",300],
			["H_Booniehat_tan",nil,425],
			["H_Hat_blue",nil,310],
			["H_Hat_brown",nil,276],
			["H_Hat_checker",nil,340],
			["H_Hat_grey",nil,280],
			["H_Hat_tan",nil,265],
			["H_Cap_blu",nil,150],
			["H_Cap_grn",nil,150],
			["H_Cap_grn_BI",nil,150],
			["H_Cap_oli",nil,150],
			["H_Cap_red",nil,150],
			["H_Cap_tan",nil,150],
			["rds_Woodlander_cap1","Chapka 1",190],
			["rds_Woodlander_cap2","Chapka 2",190],
			["rds_Woodlander_cap3","Chapka 3",190],
			["rds_Woodlander_cap4","Chapka 4",190],
			["rds_Villager_cap1","Béret 1",170],
			["rds_Villager_cap2","Béret 2",170],
			["rds_Villager_cap3","Béret 3",170],
			["rds_Villager_cap4","Béret 4",170],
			["rds_worker_cap1","Bonnet 1",230],
			["rds_worker_cap2","Bonnet 2",230],
			["rds_worker_cap3","Bonnet 3",230],
			["rds_worker_cap4","Bonnet 4",230],
			["H_Cap_pmc",nil,300],
			["H_Cap_tan_pmc",nil,300],
			["H_Capbw_pmc",nil,300],
			["H_Capbw_tan_pmc",nil,300],
			["H_Booniehat_rgr",nil,450],
			["H_Booniehat_DMARPAT",nil,450],
			["H_Booniehat_GCAMO",nil,450]
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
			["G_Spectacles",nil,25],
			["G_Spectacles_Tinted",nil,30],
			["G_Squares",nil,10],
			["G_Aviator",nil,100],
			["G_Lady_Mirror",nil,150],
			["G_Lady_Dark",nil,150],
			["G_Lady_Blue",nil,150],
			["G_Lowprofile",nil,30],
			["G_Combat",nil,55],
			["G_Bandanna_tan",nil,100],
			["G_Bandanna_khk",nil,100],
			["G_Bandanna_blk",nil,100],
			["G_Bandanna_oli",nil,100],
			["G_Bandanna_shades",nil,100],
			["G_Bandanna_sport",nil,100],
			["Mask_M40",nil,2000],
			["Mask_M40_OD",nil,2000]
		];
	};
	
	//Vest
	case 3:
	{
		_ret = 
		[
			["V_Rangemaster_belt",nil,1200],
			["V_BandollierB_oli",nil,1200],
			["V_BandollierB_blk",nil,1200],
			["V_BandollierB_rgr",nil,1200],
			["V_BandollierB_khk",nil,1200],
			["V_TacVest_brn",nil,4000],
			["V_TacVest_blk",nil,4000],
			["V_Press_F",nil,2000]
		];
	};
	
	//Backpacks
	case 4:
	{
		_ret = 
		[
			["B_AssaultPack_cbr",nil,2500],
			["B_AssaultPack_khk",nil,2500],
			["B_AssaultPack_mcamo",nil,2500],
			["B_AssaultPack_sgg",nil,2500],
			["B_AssaultPack_rgr",nil,2500],
			["PMC_AssaultPack_Blk",nil,2500],
			["B_Kitbag_mcamo",nil,4500],
			["B_Kitbag_sgg",nil,4500],
			["PMC_B_Kitbag_blk",nil,4500],
			["B_TacticalPack_oli",nil,3500],
			["B_FieldPack_cbr",nil,3000],
			["B_FieldPack_khk",nil,3000],
			["B_FieldPack_oli",nil,3000],
			["B_Bergen_sgg",nil,4500],
			["B_Kitbag_cbr",nil,4500],
			["B_TacticalPack_mcamo",nil,4500],
			["B_TacticalPack_blk",nil,4500],
			["B_TacticalPack_oli",nil,4500],
			["B_TacticalPack_rgr",nil,4500],
			["B_Carryall_oli",nil,5000],
			["B_Carryall_khk",nil,5000],
			["B_Carryall_cbr",nil,5000],
			["PMC_B_Carryall_blk",nil,5000],
			//["tf_anarc164",nil,15000],
			["tf_anprc155_coyote",nil,15000],
			["B_Parachute",nil,15000]
		];
	};
};

_ret;