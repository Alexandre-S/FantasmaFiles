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
			// ["U_Rangemaster","Uniforme Croix-Rouge",250],
			["U_uniformesamu","Uniforme SAMU",250],
			["U_PoloPompiers","Uniforme Pompier",500],
			["U_O_sapeurspompiers","Pompier intervention noir",2500],
			["U_C_sapeurspompiers2015","Pompier intervention rouge",2500],
			//["FANTASMA_MedicTenue",nil,550],
			["U_I_Wetsuit",nil,1000]
		];
	};
	
	//Hats
	case 1:
	{
		_ret = 
		[	
		
		
			["H_Cap_red",nil,500],
			["H_MilCap_gry",nil,500],
			["rhs_gssh18",nil,700],
			["H_Cap_marshal",nil,700],
			["H_Cap_headphones",nil,700]
			// ["H_Cap_oli",nil,130],
			// ["H_Cap_tan",nil,200],
			// ["H_Cap_blk",nil,200],
			// ["H_Bandanna_sgg",nil,200],
			// ["H_Bandanna_gry",nil,200],
			// ["H_Hat_tan",nil,200],
			// ["H_Hat_grey",nil,200],
			// ["H_Hat_brown",nil,200],
			// ["H_HelmetCrew_B",nil,500],
			// ["H_PilotHelmetHeli_B",nil,500]
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
			["Pomi_Goggles_Snd",nil,250],
			
			["Mask_M40",nil,2000],
			["G_Diving",nil,500]
		];
	};
	
	//Vest
	case 3:
	{
		_ret = 
		[
			["rhs_vest_commander",nil,1000],
			["rhs_6sh46",nil,1000],
			
			["V_BandollierB_blk",nil,1500],
			["V_TacVestIR_blk",nil,15000],
			["V_RebreatherIR",nil,2000]
		];
	};
	
	//Backpacks
	case 4:
	{
		_ret = 
		[
		
			["B_AssaultPack_blk",nil,2500],
			["B_FieldPack_blk",nil,3500],
			["B_TacticalPack_blk",nil,4500],
			["PMC_B_Kitbag_blk",nil,5500],
			["PMC_B_Carryall_blk",nil,6500],
			
			["tf_anprc155",nil,15000],
			// ["tf_anarc164",nil,15000],
			["B_Parachute",nil,15000]
		];
	};
};

_ret;