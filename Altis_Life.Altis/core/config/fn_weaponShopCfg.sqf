#include <macro.h>
/*
	File: fn_weaponShopCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for the weapon shops.
	
	Return:
	String: Close the menu
	Array: 
	[Shop Name,
	[ //Array of items to add to the store
		[classname,Custom Name (set nil for default),price]
	]]
*/
private["_shop"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {closeDialog 0}; //Bad shop type passed.

switch(_shop) do
{
	case "cop_basic":
	{
		switch(true) do
		{
			case (playerSide != west): {"Interdit aux civils !"};
			default
			{
				["Equipement General",
					[
						["arifle_sdar_F","Taser Rifle",0],
						["20Rnd_556x45_UW_mag","Taser Rifle Magazine",0],
						["hgun_P07_snds_F","Stun Pistol",0],
						["16Rnd_9x21_Mag","Stun Pistol Magazine",0],
						["hgun_P07_F",nil,0],
						["16Rnd_9x21_Mag",nil,0],
						["arifle_TRG21_F",nil,0],
						["30Rnd_556x45_Stanag",nil,0],
						["SMG_01_F",nil,0],
						["30Rnd_45ACP_Mag_SMG_01",nil,0],
						["muzzle_snds_L",nil,0],
						["optic_Aco",nil,0],
						["optic_ACO_grn",nil,0],
						["optic_Aco_smg",nil,0],
						["optic_Holosight",nil,0],
						["acc_flashlight",nil,0],
						["HandGrenade_Stone","Flashbang",0],
						["Binocular",nil,0],
						["ItemGPS",nil,0],
						["ItemCompass",nil,0],
						["ItemWatch",nil,0],
						["ItemRadio",nil,0],
						["ItemMap",nil,0],
						["ToolKit",nil,0],
						["FirstAidKit",nil,0],
						["Medikit",nil,0],
						["NVGoggles_OPFOR",nil,0],
						["Chemlight_red",nil,0],
						["Chemlight_yellow",nil,0],
						["Chemlight_green",nil,0],
						["Chemlight_blue",nil,0],
						["SmokeShell",nil,0],
						["SmokeShellRed",nil,0],
						["SmokeShellGreen",nil,0],
						["SmokeShellYellow",nil,0],
						["SmokeShellPurple",nil,0],
						["SmokeShellBlue",nil,0],
						["SmokeShellOrange",nil,0]
					]
				];
			};
		};
	};

	case "cop_brigadier":
	{
		switch(true) do
		{
			case (playerSide != west): {"Interdit aux civils !"};
			case (__GETC__(life_coplevel) < 2): {"Réservé aux brigadiers !"};
			default
			{
				["Armurerie : Brigadier",
					[
						["arifle_MXC_F",nil,0],
						["arifle_MX_F",nil,0],
						["arifle_MXM_F",nil,0],
						["30Rnd_65x39_caseless_mag",nil,0],
						["SMG_02_F",nil,0],
						["30Rnd_9x21_Mag",nil,0],
						["hgun_Pistol_heavy_01_F",nil,0],
						["11Rnd_45ACP_Mag",nil,0],
						["optic_MRD",nil,0],
						["optic_Arco",nil,0],
						["optic_Hamr",nil,0],
						["acc_pointer_IR",nil,0],
						["Rangefinder",nil,0]
					]
				];
			};
		};
	};

	case "cop_lieutenant":
	{
		switch(true) do
		{
			case (playerSide != west): {"Interdit aux civils !"};
			case (__GETC__(life_coplevel) < 3): {"Réservé aux lieutenant!"};
			default
			{
				["Armurerie : Lieutenant",
					[
						["srifle_EBR_F",nil,0],
						["20Rnd_762x51_Mag",nil,0],
						["arifle_MX_SW_F",nil,0],
						["100Rnd_65x39_caseless_mag",nil,0],				
						["hgun_ACPC2_F",nil,0],
						["9Rnd_45ACP_Mag",nil,0],
						["optic_MRCO",nil,0],
						["muzzle_snds_H",nil,0],
						["muzzle_snds_B",nil,0],
						["MineDetector",nil,0],
						["B_UavTerminal",nil,0]
					]
				];
			};
		};
	};
	
	case "cop_capitaine":
	{
		switch(true) do
		{
			case (playerSide != west): {"Interdit aux civils !"};
			case ((__GETC__(life_coplevel) < 4)&&(__GETC__(life_adminlevel) == 0)): {"Réservé aux capitaines"};
			default
			{
				["Armurerie : Capitaine",
					[
						["LMG_Mk200_F",nil,0],
						["200Rnd_65x39_cased_Box",nil,0],
						["hgun_Pistol_heavy_02_F",nil,0],
						["6Rnd_45ACP_Cylinder",nil,0],
						["optic_DMS",nil,0],
						["optic_Yorris",nil,0],
						["muzzle_snds_H_MG",nil,0]
					]
				];
			};
		};
	};
	
	case "cop_major":
	{
		switch(true) do
		{
			case (playerSide != west): {"Interdit aux civils !"};
			case ((__GETC__(life_coplevel) < 5)&&(__GETC__(life_adminlevel) == 0)): {"Réservé aux Hauts Gradés"};
			default
			{
				["Armurerie : Hauts Gradés",
					[
						["srifle_LRR_F",nil,0],
						["7Rnd_408_Mag",nil,0],
						["srifle_GM6_F",nil,0],
						["5Rnd_127x108_Mag",nil,0],
						["5Rnd_127x108_APDS_Mag",nil,0],
						["launch_RPG32_F",nil,0],
						["RPG32_F",nil,0],
						["RPG32_HE_F",nil,0],
						["launch_Titan_F",nil,0],
						["Titan_AA",nil,0],
						["optic_NVS",nil,0],
						["optic_Nightstalker",nil,0],
						["optic_LRPS",nil,0],
						["optic_tws",nil,0]
					]
				];
			};
		};
	};
	
	case "med_basic":
	{
		switch (true) do 
		{
			case (playerSide != independent): {"Vous n'êtes pas membre de la Croix-Rouge !"};
			default {
				["Magasin Croix-Rouge",
					[
						["ItemGPS",nil,100],
						["ItemCompass",nil,75],
						["ItemWatch",nil,50],
						["ItemRadio",nil,25],
						["ItemMap",nil,10],
						["Binocular",nil,150],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["Medikit",nil,500],
						["NVGoggles_INDEP",nil,1200],
						["_FieldPack_blk ",nil,3000],
						["Chemlight_red",nil,100],
						["Chemlight_green",nil,100],
						["Chemlight_blue",nil,100],
						["Chemlight_yellow",nil,100]
					]
				];
			};
		};
	};
	
	case "rebel":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"Vous n'êtes pas un terroriste !"};
			case (!license_civ_rebel): {"Hey l'ami, je te connais pas moi, t'achéteras rien ici sans signer notre contrat !"};
			default
			{
				["Marché Noir",
					[
						["arifle_TRG20_F",nil,25000],
						["30Rnd_556x45_Stanag",nil,300],
						["arifle_Katiba_F",nil,30000],
						["30Rnd_65x39_caseless_green",nil,275],
						["srifle_DMR_01_F",nil,50000],
						["10Rnd_762x51_Mag",nil,500],
						["arifle_SDAR_F",nil,20000],
						["20Rnd_556x45_UW_mag",nil,125],
						["30Rnd_556x45_Stanag",nil,300],
						["arifle_Mk20_F",nil,20000],
						["30Rnd_556x45_Stanag",nil,125],
						["LMG_Zafir_F",nil,75000],
						["150Rnd_762x51_Box",nil,600],
						["hgun_Pistol_heavy_02_F",nil,10000],
						["6Rnd_45ACP_Cylinder",nil,100],
						["optic_ACO_grn",nil,3500],
						["optic_Aco",nil,3500],
						["optic_Holosight",nil,3600],
						["optic_MRCO",nil,8000],
						["optic_Hamr",nil,8000],
						["optic_Arco",nil,8000],
						["acc_flashlight",nil,1000],
						["acc_pointer_IR",nil,2000],
						["ItemGPS",nil,100],
						["ItemCompass",nil,75],
						["ItemWatch",nil,50],
						["ItemRadio",nil,25],
						["ItemMap",nil,10],
						["SmokeShellRed",nil,1000],
						["SmokeShellGreen",nil,1000],
						["SmokeShellYellow",nil,1000],
						["SmokeShellPurple",nil,1000],
						["SmokeShellBlue",nil,1000],
						["SmokeShellOrange",nil,1000]
					]
				];
			};
		};
	};
	
	case "rebel_leader":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"Vous n'êtes pas un terroriste !"};
			case ((!license_civ_rebel) &&(__GETC__(life_adminlevel) == 0)): {"Hey l'ami, je te connais pas moi, t'achéteras rien ici sans signer notre contrat !"};
			default
			{
				["Marché Noir Leader",
					[
						["launch_RPG32_F",nil,700000],
						["RPG32_F",nil,5000],
						["srifle_GM6_F",nil,1000000],
						["5Rnd_127x108_Mag",nil,5000],
						["optic_SOS",nil,3500],
						["APERSMine_Range_Mag",nil,500000],
						["APERSTripMine_Wire_Mag",nil,400000],
						["SatchelCharge_Remote_Mag",nil,700000],
						["O_HMG_01_high_weapon_F",nil,1000000],
						["O_HMG_01_support_high_F",nil,7000]						
					]
				];
			};
		};
	};
	
	case "gun":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"Vous n'êtes pas civil !"};
			case (!license_civ_gun): {"Désolé monsieur, vous n'avez pas le permis de port d'armes !"};
			default
			{
				["Armurerie",
					[
						["hgun_Rook40_F",nil,6500],
						["16Rnd_9x21_Mag",nil,25],
						["hgun_ACPC2_F",nil,11500],
						["9Rnd_45ACP_Mag",nil,45],
						["hgun_PDW2000_F",nil,20000],
						["30Rnd_9x21_Mag",nil,75],
						["optic_ACO_grn_smg",nil,2500],
						["optic_Aco_smg",nil,2500],
						["V_BandollierB_khk",nil,4900]
					]
				];
			};
		};
	};
	
	case "gang":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"Vous n'êtes pas civil !"};
			default
			{
				["Armurerie de gang",
					[
						["hgun_Rook40_F",nil,2500],
						["16Rnd_9x21_Mag",nil,25],
						["hgun_ACPC2_F",nil,4500],
						["9Rnd_45ACP_Mag",nil,45],
						["hgun_PDW2000_F",nil,9500],
						["30Rnd_9x21_Mag",nil,75],
						["optic_ACO_grn_smg",nil,950],
						["optic_Aco_smg",nil,2500],
						["V_BandollierB_khk",nil,1900]
					]
				];
			};
		};
	};
	
	case "genstore":
	{
		["Magasin Général",
			[
				["Binocular",nil,150],
				["ItemGPS",nil,100],
				["ItemCompass",nil,75],
				["ItemWatch",nil,50],
				["ItemRadio",nil,25],
				["ItemMap",nil,10],
				["ToolKit",nil,250],
				["FirstAidKit",nil,150],
				["NVGoggles",nil,2000],
				["Chemlight_red",nil,300],
				["Chemlight_yellow",nil,300],
				["Chemlight_green",nil,300],
				["Chemlight_blue",nil,300]
			]
		];
	};
};
