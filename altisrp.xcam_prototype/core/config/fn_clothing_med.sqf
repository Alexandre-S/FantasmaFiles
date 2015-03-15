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
			["U_Rangemaster","Uniforme Croix-Rouge",250],
			["U_Competitor","Uniforme Pompier",25],
			["U_I_OfficerUniform","Pompier intervention noir",550],
			["U_C_WorkerCoveralls","Pompier intervention rouge",550],
			//["FANTASMA_MedicTenue",nil,550],
			["U_I_Wetsuit",nil,1000]
		];
	};
	
	//Hats
	case 1:
	{
		_ret = 
		[	
		
		
			["H_Cap_red",nil,130],
			["H_Cap_oli",nil,130],
			["H_Cap_headphones",nil,200],
			["H_Cap_tan",nil,200],
			["H_Cap_blk",nil,200],
			["H_MilCap_gry",nil,200],
			["H_Bandanna_sgg",nil,200],
			["H_Bandanna_gry",nil,200],
			["H_Watchcap_blk",nil,200],
			["H_Hat_tan",nil,200],
			["H_Hat_grey",nil,200],
			["H_Hat_brown",nil,200],
			["H_HelmetCrew_B",nil,500],
			["H_PilotHelmetHeli_B",nil,500]
	
			// ["rds_Woodlander_cap1","Chapka 1",190],
			// ["rds_Woodlander_cap2","Chapka 2",190],
			// ["rds_Woodlander_cap3","Chapka 3",190],
			// ["rds_Woodlander_cap4","Chapka 4",190],
			// ["rds_Villager_cap1","Béret 1",170],
			// ["rds_Villager_cap2","Béret 2",170],
			// ["rds_Villager_cap3","Béret 3",170],
			// ["rds_Villager_cap4","Béret 4",170],
			// ["rds_worker_cap1","Bonnet 1",230],
			// ["rds_worker_cap2","Bonnet 2",230],
			// ["rds_worker_cap3","Bonnet 3",230],
			// ["rds_worker_cap4","Bonnet 4",230]
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
			["Mask_M40_OD",nil,2000],
			["G_Diving",nil,500]
		];
	};
	
	//Vest
	case 3:
	{
		_ret = 
		[
		
			
			["V_Rangemaster_belt",nil,1000],
			["V_BandollierB_blk",nil,1200],
			["V_PlateCarrier1_blk",nil,1500],
			["V_TacVest_blk",nil,1600],
			["V_TacVestIR_blk",nil,1800],
			["V_RebreatherIR",nil,2000]
		];
	};
	
	//Backpacks
	case 4:
	{
		_ret = 
		[
		
			["PMC_AssaultPack_Blk",nil,2500],
			["B_FieldPack_blk",nil,3000],
			["PMC_B_Kitbag_blk",nil,4500],
			["PMC_B_Carryall_blk",nil,5000],
			["B_TacticalPack_blk",nil,4500],
			["tf_anarc164",nil,5000],
			["B_Parachute",nil,5000]
		];
	};
};

_ret;