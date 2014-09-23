/*
	File: fn_clothing_reb.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for Reb shop.
*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Mohammed's Jihadi Shop"];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
			["U_IG_Guerilla1_1",nil,5000],
			["U_I_G_resistanceLeader_F",nil,11500],
			["U_O_SpecopsUniform_ocamo",nil,17500],
			["U_O_GhillieSuit",nil,50000],
			["U_O_PilotCoveralls",nil,15610],
			["U_IG_leader",nil,15340],
			["U_PMC_GTShirt_DJeans","Para TeeShirt vert et jean",10000],
			["U_PMC_GTShirt_SJeans","Para TeeShirt vert et bas blanc",10000],
			["U_PMC_BlkTShirt_DJeans","Para TeeShirt noir et jean",10000],
			["U_PMC_WTShirt_DJeans","Para TeeShirt blanc et jean",10000],
			["U_PMC_BluPolo_BgPants","Para polo bleu et bas beige",10000],
			["U_PMC_WhtPolo_BluPants","Para polo blanc et jean",10000],
			["U_PMC_BlackPoloShirt_BeigeCords","Para Polo noir et bas beige",10000],
			["U_PMC_BrnPolo_BluPants","Para Polo marron et jean",10000],			
			["U_PMC_CombatUniformLS_BSGPBB","Para Veste combat noire bas foncé",20000],
			["U_PMC_CombatUniformLS_SSGPSB","Para Veste combat beige bas foncé",20000],
			["U_PMC_CombatUniformLS_ChckDBS_GPSB","Para Chemise combat bleu foncé",20000],
			["U_PMC_CombatUniformLS_ChckLB_GPBB","Para Chemise combat bleu clair",20000],
			["U_PMC_CombatUniformLS_ChckP_BPBB","Para Chemise combat rouge",20000],
			["U_PMC_CombatUniformLS_BSSPBB","Para Veste combat noire bas clair",20000],
			["U_PMC_CombatUniformLS_GSBPBB","Para Veste combat verte bas foncé",20000],
			["U_PMC_CombatUniformLS_IndPBSBB","Para Veste combat noire bas camo",20000]
		];
	};
	
	//Hats
	case 1:
	{ 
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
			["H_HelmetCrew_O",nil,2000],
			["H_Cap_pmc",nil,300],
			["H_Capbw_pmc",nil,300],
			["H_Cap_tan_pmc",nil,300],
			["H_Capbw_tan_pmc",nil,300],
			["H_Booniehat_DMARPAT",nil,450],
			["H_Booniehat_GCAMO",nil,450],
			["H_Booniehat_rgr",nil,450],
			["H_Cap_pmc_headphones",nil,1000],
			["H_PilotHelmetHeli_PMC",nil,2000]
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
		[
			["V_TacVest_khk",nil,12500],
			["V_BandollierB_cbr",nil,4500],
			["V_HarnessO_brn",nil,7500],
			["V_PlateCarrierInd_PMC_blk","Para Gilet noir Lourd",12500],
			["V_PlateCarrier1_PMC_blk","Para Gilet noir léger",7500],
			["V_PlateCarrierInd_PMC_grn","Para Gilet vert Lourd",12500],
			["V_PlateCarrier1_PMC_rgr","Para Gilet vert léger",7500],
			["V_PlateCarrier1_PMC_khki","Para Gilet khaki Lourd",7500],
			["V_PlateCarrier1_PMC_marpat","Para Gilet camo léger",7500],
			["V_TacVest_darkblck","Para Veste tactique",6000]
		];
	};
	
	//Backpacks
	case 4:
	{
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