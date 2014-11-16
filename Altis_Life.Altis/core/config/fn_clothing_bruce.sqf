/*
	File: fn_clothing_bruce.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for Bruce's Outback Outfits.
*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Bruce's Outback Outfits"];
comment "Remove existing items";

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
		["U_C_Poloshirt_blue","Poloshirt Blue",250],
		["U_C_Poloshirt_burgundy","Poloshirt Burgundy",275],
		["U_C_Poloshirt_redwhite","Poloshirt Red/White",150],
		["U_C_Poloshirt_salmon","Poloshirt Salmon",175],
		["U_C_Poloshirt_stripped","Poloshirt stripped",125],
		["U_C_Poloshirt_tricolour","Poloshirt Tricolor",350],
		["U_CAF_AG_AFR_CLOTHES_02b","Trehit Sale",100],
		["U_CAF_AG_AFR_CLOTHES_02a","Poloshirt Sale",100],		
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
		["U_C_HunterBody_grn","The Hunters Look",1500],
		["U_C_WorkerCoveralls","Mechanic Coveralls",2500],
		["U_OrestesBody","Surfing On Land",1100],
		["rds_uniform_schoolteacher",nil,1250],
		["rds_uniform_assistant",nil,1550],
		["U_BG_Guerilla3_1","Hunter",2000],
		["U_I_G_Story_Protagonist_F","Work",2000],
		["U_NikosBody","Rakail",3500],
		["U_NikosAgedBody","Casual Wears",5000],
		["U_Marshal","Casual Wears",5500],	
		["U_I_HeliPilotCoveralls","Work on airport",6000],
		["U_C_Journalist","AAN",6500],
		["U_PMC_BluePlaidShirt_BeigeCords","Chemise bleu et pantalon beige",3500],
		["U_PMC_RedPlaidShirt_DenimCords","Chemise rouge et jean bleu",3500],
		["IRA_Soldier_Outfit_7","Polo Guinness et jean",3500],
		["UVF_Soldier_Outfit_4","Polo Rugby",3500],
		["rds_uniform_Functionary1",nil,7500],
		["rds_uniform_Functionary2",nil,7500],
		["rds_uniform_priest",nil,2500]
		];
	};
	
	//Hats
	case 1:
	{
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
			["rds_worker_cap4","Bonnet 4",230]
		];
	};
	
	//Glasses
	case 2:
	{
		[
			["G_Shades_Black",nil,25],
			["G_Shades_Blue",nil,20],
			["G_Sport_Blackred",nil,20],
			["G_Sport_Checkered",nil,20],
			["G_Sport_Blackyellow",nil,20],
			["G_Sport_BlackWhite",nil,20],
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
			["G_Bandanna_sport",nil,100]
		];
	};
	
	//Vest
	case 3:
	{
		[
			["V_BandollierB_oli",nil,1200],
			["V_BandollierB_blk",nil,1200],
			["V_BandollierB_rgr",nil,1200],
			["V_TacVest_brn",nil,2400],
			["V_Press_F",nil,2000]
		];
	};
	
	//Backpacks
	case 4:
	{
		[
			["B_AssaultPack_cbr",nil,2500],
			["B_AssaultPack_khk",nil,2500],
			["B_AssaultPack_mcamo",nil,2500],
			["B_AssaultPack_sgg",nil,2500],
			["B_AssaultPack_rgr",nil,2500],
			["B_Kitbag_mcamo",nil,4500],
			["B_Kitbag_sgg",nil,4500],
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
			["tf_anarc164",nil,15000]
		];
	};
};