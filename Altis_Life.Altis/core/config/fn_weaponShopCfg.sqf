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
private["_shop","_ret"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {closeDialog 0}; //Bad shop type passed.
_ret = [];
switch(_shop) do
{
	case "cop_basic":
	{
		switch(true) do
		{
			case (playerSide != west): {"Interdit aux civils !"};
			default
			{
				_ret =
				["Equipement General",
					[
						["CUP_smg_MP5SD6",nil,0],
						["CUP_smg_MP5A5",nil,0],
						["CUP_30Rnd_9x19_MP5",nil,0],
						["CUP_sgun_M1014",nil,0],
						["CUP_8Rnd_B_Beneli_74Slug",nil,0],
						["hgun_P07_snds_F","Stun Pistol",0],
						["16Rnd_9x21_Mag","Stun Pistol Magazine",0],
						["optic_Aco",nil,0],
						["optic_ACO_grn",nil,0],
						["optic_Aco_smg",nil,0],
						["acc_flashlight",nil,0],
						["Binocular",nil,0],
						["SmokeShellYellow","Gaz Lacrimo",0],
						["ItemGPS",nil,0],
						["ItemCompass",nil,0],
						["ItemWatch","SmartWatch",0],
						["ItemMap",nil,0],
						["ToolKit",nil,0],
						["FirstAidKit",nil,0],
						["NVGoggles_OPFOR",nil,0],
						["AGM_EarBuds",nil,0],
						["AGM_ItemKestrel",nil,0],
						["AGM_MapTools",nil,0],
						["AGM_SpareBarrel",nil,0],
						["AGM_CableTie",nil,0],
						["Chemlight_red",nil,0],
						["Chemlight_yellow",nil,0],
						["Chemlight_green",nil,0],
						["Chemlight_blue",nil,0],
						["SmokeShell",nil,0],
						["SmokeShellRed",nil,0],
						["SmokeShellGreen",nil,0],
						["SmokeShellPurple",nil,0],
						["SmokeShellBlue",nil,0],
						["SmokeShellOrange",nil,0],
						["AGM_HandFlare_White",nil,0],
						["AGM_HandFlare_Red",nil,0],
						["AGM_HandFlare_Green",nil,0],
						["AGM_HandFlare_Yellow",nil,0],
						["AGM_IR_Strobe_Item",nil,0],
						["tf_anprc152",nil,0]
					]
				];
			};
		};
	};

	case "cop_armurerie":
	{
		switch(true) do
		{
			case (playerSide != west): {"Interdit aux civils !"};
			case (__GETC__(life_coplevel) < 2): {"Interdit aux recrues !"};
			default
			{
				_ret =
				["Armurerie standard",
					[
						["CUP_arifle_M4A1",nil,0],
						["CUP_arifle_M4A1_black",nil,0],
						["CUP_arifle_M4A1_camo",nil,0],
						["CUP_arifle_M4A1_desert",nil,0],
						["CUP_30Rnd_556x45_Stanag",nil,0],
						["optic_Holosight",nil,0],
						["CUP_hgun_M9",nil,0],
						["CUP_15Rnd_9x19_M9",nil,0],
						["HandGrenade_Stone","Flashbang",0]
					]
				];
			};
		};
	};

	case "cop_infanterie":
	{
		switch(true) do
		{
			case (playerSide != west): {"Interdit aux civils !"};
			case (!license_cop_infanterie): {"Vous n'avez pas la formation infanterie !"};
			//case (__GETC__(life_coplevel) < 3): {"Réservé aux lieutenant!"};
			default
			{
				_ret =
				["Armurerie : Infanterie",
					[
						["CUP_srifle_M14",nil,0],
						["CUP_20Rnd_762x51_DMR",nil,0],
						["CUP_arifle_M16A2",nil,0],
						["CUP_arifle_M16A4_Base",nil,0],
						["CUP_arifle_Mk16_STD",nil,0],
						["CUP_arifle_Mk16_STD_FG",nil,0],
						["CUP_arifle_Mk16_STD_SFG",nil,0],
						["CUP_arifle_Mk16_SV",nil,0],
						["CUP_arifle_L85A2",nil,20000],
						["CUP_arifle_L86A2",nil,20000],
						["CUP_arifle_xm8_sharpshooter",nil,0],
						["CUP_30Rnd_556x45_Stanag",nil,0],
						["CUP_arifle_xm8_SAW",nil,0],
						["CUP_100Rnd_556x45_BetaCMag",nil,0],
						["CUP_arifle_Mk17_CQC",nil,0],
						["CUP_arifle_Mk17_CQC_FG",nil,0],
						["CUP_arifle_Mk17_CQC_SFG",nil,0],
						["CUP_arifle_Mk17_STD",nil,0],
						["CUP_arifle_Mk17_STD_FG",nil,0],
						["CUP_arifle_Mk17_STD_SFG",nil,0],
						["CUP_arifle_Mk20",nil,0],
						["CUP_20Rnd_762x51_B_SCAR",nil,0],
						["CUP_lmg_M249_para",nil,0],
						["CUP_lmg_M249",nil,0],
						["CUP_200Rnd_TE4_Red_Tracer_556x45_M249",nil,0],
						["CUP_200Rnd_TE4_Yellow_Tracer_556x45_M249",nil,0],
						["CUP_200Rnd_TE1_Red_Tracer_556x45_M249",nil,0],
						["CUP_hgun_Glock17",nil,0],
						["CUP_acc_Glock17_Flashlight",nil,0],
						["CUP_17Rnd_9x19_glock17",nil,0],
						["CUP_hgun_Glock17",nil,0],
						["CUP_hgun_Colt1911",nil,0],
						["CUP_7Rnd_45ACP_1911",nil,0],
						["optic_MRD",nil,0],
						["optic_Arco",nil,0],
						["optic_Hamr",nil,0],
						["optic_MRCO",nil,0],
						["MineDetector",nil,0],
						["acc_pointer_IR",nil,0]
					]
				];
			};
		};
	};
	
	case "cop_snipe":
	{
		switch(true) do
		{
			case (playerSide != west): {"Interdit aux civils !"};
			case (!license_cop_snipe): {"Vous n'avez pas la formation tireur de précision !"};
			//case (__GETC__(life_coplevel) < 4): {"Réservé aux capitaines!"};
			default
			{
				_ret =
				["Armurerie : Précision",
					[
						["CUP_srifle_Mk12SPR",nil,0],
						["CUP_20Rnd_556x45_Stanag",nil,0],
						["CUP_srifle_DMR",nil,0],
						["CUP_20Rnd_762x51_DMR",nil,0],
						["CUP_srifle_M24_des",nil,0],
						["CUP_srifle_M24_wdl",nil,0],
						["CUP_srifle_M24_ghillie",nil,0],
						["CUP_srifle_M40A3",nil,0],
						["CUP_5Rnd_762x51_M24",nil,0],
						["CUP_srifle_M110",nil,0],
						["CUP_20Rnd_762x51_B_M110",nil,0],
						["CUP_srifle_AWM_des",nil,0],
						["CUP_srifle_AWM_wdl",nil,0],
						["CUP_5Rnd_86x70_L115A1",nil,0],
						["CUP_optic_LeupoldMk4_10x40_LRT_Desert",nil,0],
						["CUP_optic_LeupoldMk4_10x40_LRT_Woodland",nil,0],
						["optic_DMS",nil,0],
						["optic_SOS",nil,0],
						["optic_NVS",nil,0],
						["Rangefinder",nil,0],
						["AGM_Vector",nil,0]
					]
				];
			};
		};
	};
	
	case "cop_grenadier":
	{
		switch(true) do
		{
			case (playerSide != west): {"Interdit aux civils !"};
			case (!license_cop_grenadier): {"Vous n'avez pas la formation grenadier !"};
			//case (__GETC__(life_coplevel) < 5): {"Réservé aux Haut-Gradés!"};
			default
			{
				_ret =
				["Armurerie : Grenadier",
					[
						["CUP_arifle_M16A2_GL",nil,0],
						["CUP_arifle_M16A4_GL",nil,0],
						["CUP_arifle_M4A1_BUIS_GL",nil,0],
						["CUP_arifle_M4A1_BUIS_desert_GL",nil,0],
						["CUP_arifle_M4A1_BUIS_camo_GL",nil,0],
						["CUP_arifle_Mk16_CQC_EGLM",nil,0],
						["CUP_arifle_Mk16_STD_EGLM",nil,0],
						["CUP_arifle_L85A2_GL",nil,0],
						["CUP_arifle_XM8_Carbine_GL",nil,0],
						["CUP_30Rnd_556x45_Stanag",nil,0],
						["CUP_arifle_Mk17_CQC_EGLM",nil,0],
						["CUP_arifle_Mk17_STD_EGLM",nil,0],
						["CUP_20Rnd_762x51_B_SCAR",nil,0],
						["CUP_glaunch_M79",nil,0],
						["CUP_glaunch_Mk13",nil,0],
						["CUP_launch_9K32Strela",nil,0],
						["CUP_Strela_2_M",nil,0],
						["CUP_launch_NLAW",nil,0],
						["CUP_NLAW_M",nil,0],
						["CUP_launch_Mk153Mod0",nil,0],
						["CUP_optic_SMAW_Scope",nil,0],
						["CUP_SMAW_HEAA_M",nil,0],
						["CUP_SMAW_HEDP_M",nil,0],
						["CUP_launch_MAAWS",nil,0],
						["CUP_optic_MAAWS_Scope",nil,0],
						["CUP_MAAWS_HEAT_M",nil,0],
						["CUP_MAAWS_HEDP_M",nil,0],
						["CUP_launch_M136",nil,0],
						["CUP_M136_M",nil,0],
						["CUP_launch_Igla",nil,0],
						["CUP_Igla_M",nil,0],
						["CUP_launch_FIM92Stinger",nil,0],
						["CUP_Stinger_M",nil,0],
						["optic_Hamr",nil,0],
						["HandGrenade",nil,0],
						["MiniGrenade",nil,0],
						["1Rnd_HE_Grenade_shell",nil,0],
						["1Rnd_Smoke_Grenade_shell",nil,0],
						["1Rnd_SmokeRed_Grenade_shell",nil,0],
						["1Rnd_SmokeGreen_Grenade_shell",nil,0],
						//["1Rnd_SmokeYellow_Grenade_shell",nil,0],
						["1Rnd_SmokePurple_Grenade_shell",nil,0],
						["1Rnd_SmokeBlue_Grenade_shell",nil,0],
						["1Rnd_SmokeOrange_Grenade_shell",nil,0],
						["UGL_FlareGreen_F",nil,0],
						["UGL_FlareYellow_F",nil,0],
						["UGL_FlareRed_F",nil,0],
						["UGL_FlareWhite_F",nil,0]
					]
				];
			};
		};
	};
	
	case "cop_airweapons":
	{
		switch(true) do
		{
			case (playerSide != west): {"Interdit aux civils !"};
			case (!license_cop_air): {"Vous n'avez pas la formation aérienne !"};
			//case (__GETC__(life_coplevel) < 5): {"Réservé aux Haut-Gradés!"};
			default
			{
				_ret =
				["Armurerie : Aérienne",
					[
						["CUP_arifle_XM8_Carbine",nil,0],
						["CUP_arifle_XM8_Compact",nil,0],
						["CUP_arifle_XM8_Carbine_FG",nil,0],
						["CUP_30Rnd_556x45_Stanag",nil,0],
						["SMG_01_F",nil,0],
						["30Rnd_45ACP_Mag_SMG_01",nil,0],
						["30Rnd_45ACP_Mag_SMG_01_Tracer_Green",nil,0],
						["hgun_Pistol_Signal_F",nil,0],
						["6Rnd_GreenSignal_F",nil,0],
						["6Rnd_RedSignal_F",nil,0]
					]
				];
			};
		};
	};
	
	case "cop_onumecano":
	{
		switch(true) do
		{
			case (playerSide != west): {"Interdit aux civils !"};
			case (!license_cop_onumecano): {"Vous n'avez pas la formation mécano / personnel naviguant !"};
			//case (__GETC__(life_coplevel) < 5): {"Réservé aux Haut-Gradés!"};
			default
			{
				_ret =
				["Armurerie : Mécano / Personnel naviguant",
					[
						["CUP_arifle_G36C",nil,0],
						["CUP_arifle_G36C_camo",nil,0],
						["CUP_30Rnd_556x45_G36",nil,0],
						["CUP_smg_EVO",nil,0],
						["CUP_30Rnd_9x19_EVO",nil,0],
						["hgun_Pistol_Signal_F",nil,0],
						["6Rnd_GreenSignal_F",nil,0],
						["6Rnd_RedSignal_F",nil,0],
						["MineDetector",nil,0]
					]
				];
			};
		};
	};
	
	case "cop_onumedic":
	{
		switch(true) do
		{
			case (playerSide != west): {"Interdit aux civils !"};
			case (!license_cop_onumedic): {"Vous n'avez pas la formation médic !"};
			//case (__GETC__(life_coplevel) < 5): {"Réservé aux Haut-Gradés!"};
			default
			{
				_ret =
				["Armurerie : Médic",
					[
						["CUP_arifle_Mk16_CQC",nil,0],
						["CUP_arifle_Mk16_CQC_FG",nil,0],
						["CUP_arifle_Mk16_CQC_SFG",nil,0],
						["CUP_30Rnd_556x45_Stanag",nil,0],
						["Medikit",nil,0]
					]
				];
			};
		};
	};
	
	case "cop_swat":
	{
		switch(true) do
		{
			case (playerSide != west): {"Interdit aux civils !"};
			case (!license_cop_swat): {"Vous n'avez pas la formation unité tactique !"};
			//case (__GETC__(life_coplevel) < 5): {"Réservé aux Haut-Gradés!"};
			default
			{
				_ret =
				["Armurerie : Unité Tactique",
					[
						["CUP_sgun_AA12",nil,0],
						["CUP_20Rnd_B_AA12_Pellets",nil,0],
						["CUP_20Rnd_B_AA12_74Slug",nil,0],
						["CUP_arifle_G36A",nil,0],
						["CUP_arifle_G36A_camo",nil,0],
						["CUP_arifle_G36K",nil,0],
						["CUP_arifle_G36K_camo",nil,0],
						["CUP_30Rnd_556x45_G36",nil,0],
						["CUP_arifle_MG36",nil,0],
						["CUP_arifle_MG36_camo,nil",0],
						["CUP_100Rnd_556x45_BetaCMag,nil",0],
						["CUP_lmg_Mk48_des",nil,0],
						["CUP_lmg_Mk48_wdl",nil,0],
						["CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M",nil,0],
						["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M",nil,0],
						["CUP_hgun_Duty",nil,0],
						["CUP_acc_CZ_M3X",nil,0],
						["16Rnd_9x21_Mag",nil,0],
						["optic_DMS",nil,0],
						["optic_Hamr",nil,0],
						["optic_tws",nil,0],
						["optic_Yorris",nil,0],
						["acc_pointer_IR",nil,0],
						["Rangefinder",nil,0],
						["AGM_Vector",nil,0],
						["Laserdesignator",nil,0],
						["Laserbatteries",nil,0],
						["B_UavTerminal",nil,0],
						["MineDetector",nil,0],
						["CUP_muzzle_snds_G36_black",nil,0],
						["CUP_muzzle_snds_G36_desert",nil,0],
						["CUP_muzzle_snds_M16",nil,0],
						["CUP_muzzle_snds_M16_camo",nil,0],
						["CUP_muzzle_snds_SCAR_L",nil,0],
						["CUP_muzzle_snds_SCAR_H",nil,0]
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
			case (__GETC__(life_coplevel) < 5): {"Réservé aux Haut-Gradés!"};
			default
			{
				_ret =
				["Armurerie : Hauts Gradés",
					[
						["CUP_20Rnd_B_AA12_HE",nil,0],
						["CUP_srifle_M107_Base",nil,0],
						["CUP_10Rnd_127x99_M107",nil,0],
						["CUP_5Rnd_127x99_as50_M",nil,0],
						["CUP_srifle_AS50",nil,0],
						["CUP_optic_SB_3_12x50_PMII",nil,0],
						["CUP_lmg_M240",nil,0],
						["CUP_lmg_Mk48_des",nil,0],
						["CUP_lmg_Mk48_wdl",nil,0],
						["CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M",nil,0],
						["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M",nil,0],
						["CUP_srifle_VSSVintorez",nil,0],
						["CUP_10Rnd_9x39_SP5_VSS_M",nil,0],
						["CUP_optic_PSO_3",nil,0],
						["CUP_glaunch_M32",nil,0],
						["CUP_6Rnd_HE_M203",nil,0],
						["CUP_6Rnd_FlareWhite_M203",nil,0],
						["CUP_6Rnd_FlareGreen_M203",nil,0],
						["CUP_6Rnd_FlareRed_M203",nil,0],
						["CUP_6Rnd_FlareYellow_M203",nil,0],
						["CUP_6Rnd_Smoke_M203",nil,0],
						["CUP_6Rnd_SmokeRed_M203",nil,0],
						["CUP_6Rnd_SmokeGreen_M203",nil,0],
						["CUP_6Rnd_SmokeYellow_M203",nil,0],
						["hgun_Pistol_heavy_02_F",nil,0],
						["6Rnd_45ACP_Cylinder",nil,0],
						["optic_Yorris",nil,0],
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
			case (playerSide != independent): {"Vous n'êtes pas membre des Services Publics !"};
			default {
				// Croix Rouge rang 1
				if(__GETC__(life_medicLevel) >= 1) then
				{
					_ret =
					["Magasin Service",
						[
							["tf_anprc148jem",nil,500],
							["ItemGPS",nil,100],
							["ItemCompass",nil,75],
							["ItemWatch","SmartWatch",50],
							["ItemMap",nil,10],
							["AGM_MapTools",nil,500],
							["AGM_SpareBarrel",nil,1000],
							["AGM_CableTie",nil,100],
							["AGM_EarBuds",nil,25],
							["AGM_ItemKestrel",nil,500],
							["Binocular",nil,150],
							["ToolKit",nil,9500],
							["FirstAidKit",nil,150],
							["Medikit",nil,500],
							["NVGoggles_INDEP",nil,1200],
							["tf_anprc155",nil,500],
							["SmokeShellRed",nil,100],
							["Chemlight_blue",nil,100],
							["Chemlight_yellow",nil,100]
						]
					];
				};
				// Croix Rouge rang 2
				if(__GETC__(life_medicLevel) >= 2) then
				{
					(_ret select 1) pushBack ["CUP_hgun_Compact",nil,15000];
					(_ret select 1) pushBack ["CUP_10Rnd_9x19_Compact",nil,150];
					(_ret select 1) pushBack ["CUP_hgun_Phantom",nil,17000];
					(_ret select 1) pushBack ["CUP_18Rnd_9x19_Phantom",nil,225];
					(_ret select 1) pushBack ["CUP_hgun_Colt1911",nil,18000];
					(_ret select 1) pushBack ["CUP_7Rnd_45ACP_1911",nil,275];
					(_ret select 1) pushBack ["CUP_hgun_Makarov",nil,20000];
					(_ret select 1) pushBack ["CUP_8Rnd_9x18_Makarov_M",nil,300];
					(_ret select 1) pushBack ["hgun_ACPC2_F",nil,21500];
					(_ret select 1) pushBack ["9Rnd_45ACP_Mag",nil,350];
				};
				// Croix Rouge rang 3
				if(__GETC__(life_medicLevel) >= 3) then
				{
					(_ret select 1) pushBack ["hgun_PDW2000_F",nil,80000];
					(_ret select 1) pushBack ["30Rnd_9x21_Mag",nil,450];
					(_ret select 1) pushBack ["optic_ACO_grn_smg",nil,2500];
					(_ret select 1) pushBack ["optic_Aco_smg",nil,2500];
				};
				// Croix Rouge rang 4
				if(__GETC__(life_medicLevel) >= 4) then
				{
					(_ret select 1) pushBack ["CUP_hgun_SA61",nil,70000];
					(_ret select 1) pushBack ["CUP_20Rnd_B_765x17_Ball_M",nil,400];
				};
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
				// Rang 1
				if(__GETC__(life_reblevel) >= 1) then
				{
					_ret =
					["Marché noir 1 - rang 1",
						[
							["tf_anprc148jem",nil,5000],
							["CUP_smg_bizon",nil,25000],
							["CUP_64Rnd_9x19_Bizon_M",nil,750],
							["CUP_sgun_Saiga12K",nil,15000],
							["CUP_8Rnd_B_Saiga12_74Slug_M",nil,150],
							["CUP_sgun_M1014",nil,15000],
							["CUP_8Rnd_B_Beneli_74Slug",nil,150],
							["CUP_arifle_AK107",nil,20000],
							["CUP_arifle_AK74",nil,20000],
							["CUP_arifle_AKS74",nil,20000],
							["CUP_arifle_AKS74U",nil,20000],
							["CUP_arifle_AK74_GL",nil,25000],
							["CUP_arifle_AK107_GL",nil,25000],
							["CUP_30Rnd_545x39_AK_M",nil,300],
							["CUP_arifle_XM8_Carbine",nil,20000],
							["CUP_arifle_XM8_Compact",nil,20000],
							["CUP_arifle_XM8_Carbine_FG",nil,20000],
							["CUP_arifle_xm8_sharpshooter",nil,20000],
							["CUP_arifle_L85A2",nil,20000],
							["CUP_arifle_L86A2",nil,20000],
							["CUP_arifle_L85A2_GL",nil,25000],
							["CUP_arifle_XM8_Carbine_GL",nil,25000],
							["CUP_30Rnd_556x45_Stanag",nil,300],
							["CUP_arifle_xm8_SAW",nil,30000],
							["CUP_100Rnd_556x45_BetaCMag",nil,300],
							["UGL_FlareGreen_F",nil,500],
							["UGL_FlareYellow_F",nil,500],
							["UGL_FlareRed_F",nil,500],
							["1Rnd_Smoke_Grenade_shell",nil,350],
							["1Rnd_SmokeRed_Grenade_shell",nil,350],
							["1Rnd_SmokeGreen_Grenade_shell",nil,350],
							//["1Rnd_SmokeYellow_Grenade_shell",nil,350],
							["1Rnd_SmokePurple_Grenade_shell",nil,350],
							["1Rnd_SmokeBlue_Grenade_shell",nil,350],
							["1Rnd_SmokeOrange_Grenade_shell",nil,350],
							["hgun_Pistol_heavy_02_F",nil,10000],
							["6Rnd_45ACP_Cylinder",nil,100],
							["optic_ACO_grn",nil,3500],
							["optic_Aco",nil,3500],
							["optic_Holosight",nil,3600],
							["CUP_optic_Kobra",nil,4000],
							["optic_MRCO",nil,8000],
							["optic_Hamr",nil,8000],
							["optic_Arco",nil,8000],
							["acc_flashlight",nil,1000],
							["acc_pointer_IR",nil,2000],
							["ToolKit",nil,9500],
							["FirstAidKit",nil,150],
							["ItemGPS",nil,100],
							["ItemCompass",nil,75],
							["ItemWatch","SmartWatch",50],
							["NVGoggles",nil,2000],
							["ItemMap",nil,10],
							["AGM_CableTie",nil,100],
							["AGM_EarBuds",nil,25],
							["AGM_ItemKestrel",nil,500],
							["AGM_MapTools",nil,500],
							["AGM_SpareBarrel",nil,1000],
							["SmokeShellRed",nil,1000],
							["SmokeShellGreen",nil,1000],
							//["SmokeShellYellow",nil,1000],
							["SmokeShellPurple",nil,1000],
							["SmokeShellBlue",nil,1000],
							["SmokeShellOrange",nil,1000]
						]
					];
				};
				// Rang 2
				if(__GETC__(life_reblevel) >= 2) then
				{
					(_ret select 1) pushBack ["CUP_arifle_AKM",nil,40000];
					(_ret select 1) pushBack ["CUP_arifle_AKS",nil,40000];
					(_ret select 1) pushBack ["CUP_arifle_AKS_Gold",nil,50000];
					(_ret select 1) pushBack ["CUP_30Rnd_762x39_AK47_M",nil,700];
					(_ret select 1) pushBack ["CUP_arifle_Sa58P",nil,45000];
					(_ret select 1) pushBack ["CUP_arifle_Sa58P_des",nil,45000];
					(_ret select 1) pushBack ["CUP_arifle_Sa58V",nil,45000];
					(_ret select 1) pushBack ["CUP_arifle_Sa58V_camo",nil,45000];
					(_ret select 1) pushBack ["CUP_arifle_Sa58RIS1",nil,45000];
					(_ret select 1) pushBack ["CUP_arifle_Sa58RIS1_des",nil,45000];
					(_ret select 1) pushBack ["CUP_arifle_Sa58RIS2",nil,45000];
					(_ret select 1) pushBack ["CUP_arifle_Sa58RIS2_camo",nil,45000];
					(_ret select 1) pushBack ["CUP_30Rnd_Sa58_M",nil,800];
					(_ret select 1) pushBack ["CUP_30Rnd_Sa58_M_TracerY",nil,800];
					(_ret select 1) pushBack ["CUP_30Rnd_Sa58_M_TracerR",nil,800];
					(_ret select 1) pushBack ["CUP_30Rnd_Sa58_M_TracerG",nil,800];
					(_ret select 1) pushBack ["CUP_srifle_CZ750",nil,60000];
					(_ret select 1) pushBack ["CUP_10Rnd_762x51_CZ750_Tracer",nil,1000];
					(_ret select 1) pushBack ["CUP_10Rnd_762x51_CZ750",nil,1000];
					(_ret select 1) pushBack ["CUP_srifle_SVD",nil,80000];
					(_ret select 1) pushBack ["CUP_srifle_SVD_des",nil,80000];
					(_ret select 1) pushBack ["CUP_srifle_SVD_wdl_ghillie",nil,90000];
					(_ret select 1) pushBack ["CUP_srifle_SVD_des_ghillie_pso",nil,90000];
					(_ret select 1) pushBack ["CUP_10Rnd_762x54_SVD_M",nil,1000];
					(_ret select 1) pushBack ["CUP_optic_PSO_1",nil,8000];
					(_ret select 1) pushBack ["CUP_optic_PSO_3",nil,8000];
					(_ret select 1) pushBack ["CUP_arifle_FNFAL_railed",nil,45000];
					(_ret select 1) pushBack ["CUP_20Rnd_762x51_FNFAL_M",nil,700];
					(_ret select 1) pushBack ["CUP_lmg_L110A1",nil,75000];
					(_ret select 1) pushBack ["CUP_200Rnd_TE4_Green_Tracer_556x45_L110A1",nil,900];
					(_ret select 1) pushBack ["CUP_200Rnd_TE4_Red_Tracer_556x45_L110A1",nil,900];
					(_ret select 1) pushBack ["CUP_200Rnd_TE4_Yellow_Tracer_556x45_L110A1",nil,900];
					(_ret select 1) pushBack ["CUP_lmg_M249_para",nil,75000];
					(_ret select 1) pushBack ["CUP_lmg_M249",nil,75000];
					(_ret select 1) pushBack ["CUP_200Rnd_TE4_Red_Tracer_556x45_M249",nil,900];
					(_ret select 1) pushBack ["CUP_200Rnd_TE4_Yellow_Tracer_556x45_M249",nil,900];
					(_ret select 1) pushBack ["CUP_200Rnd_TE1_Red_Tracer_556x45_M249",nil,900];
					(_ret select 1) pushBack ["CUP_lmg_L7A2",nil,85000];
					(_ret select 1) pushBack ["CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M",nil,1100];
					(_ret select 1) pushBack ["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M",nil,1100];
					(_ret select 1) pushBack ["CUP_srifle_M24_des",nil,60000];
					(_ret select 1) pushBack ["CUP_srifle_M24_wdl",nil,60000];
					(_ret select 1) pushBack ["CUP_srifle_M24_ghillie",nil,75000];
					(_ret select 1) pushBack ["CUP_srifle_M40A3",nil,75000];
					(_ret select 1) pushBack ["CUP_5Rnd_762x51_M24",nil,900];
					(_ret select 1) pushBack ["CUP_arifle_RPK74",nil,60000];
					(_ret select 1) pushBack ["CUP_75Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M",nil,900];
					(_ret select 1) pushBack ["CUP_lmg_UK59",nil,60000];
					(_ret select 1) pushBack ["CUP_50Rnd_UK59_762x54R_Tracer",nil,900];
					(_ret select 1) pushBack ["CUP_lmg_PKM",nil,120000];
					(_ret select 1) pushBack ["CUP_lmg_Pecheneg",nil,120000];
					(_ret select 1) pushBack ["CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M",nil,1500];
					(_ret select 1) pushBack ["CUP_optic_PechenegScope",nil,12000];
					(_ret select 1) pushBack ["optic_LRPS",nil,12500];
					(_ret select 1) pushBack ["optic_SOS",nil,13500];
				};
				// Rang 3
				if(__GETC__(life_reblevel) >= 3) then
				{
					(_ret select 1) pushBack ["CUP_srifle_ksvk",nil,700000];
					(_ret select 1) pushBack ["CUP_5Rnd_127x108_KSVK_M",nil,5000];
					(_ret select 1) pushBack ["CUP_srifle_M107_Base",nil,700000];
					(_ret select 1) pushBack ["CUP_10Rnd_127x99_M107",nil,5000];
					(_ret select 1) pushBack ["CUP_launch_9K32Strela",nil,300000];
					(_ret select 1) pushBack ["CUP_Strela_2_M",nil,10000];
					(_ret select 1) pushBack ["CUP_launch_RPG7V",nil,300000];
					(_ret select 1) pushBack ["CUP_PG7V_M",nil,10000];
					(_ret select 1) pushBack ["CUP_launch_RPG18",nil,300000];
					(_ret select 1) pushBack ["CUP_RPG18_M",nil,10000];
					(_ret select 1) pushBack ["CUP_launch_Mk153Mod0",nil,300000];
					(_ret select 1) pushBack ["CUP_optic_SMAW_Scope",nil,15000];
					(_ret select 1) pushBack ["CUP_SMAW_HEAA_M",nil,10000];
					(_ret select 1) pushBack ["CUP_SMAW_HEDP_M",nil,10000];
					(_ret select 1) pushBack ["CUP_launch_MAAWS",nil,300000];
					(_ret select 1) pushBack ["CUP_optic_MAAWS_Scope",nil,15000];
					(_ret select 1) pushBack ["CUP_MAAWS_HEAT_M",nil,10000];
					(_ret select 1) pushBack ["CUP_MAAWS_HEDP_M",nil,10000];
					(_ret select 1) pushBack ["CUP_launch_M136",nil,300000];
					(_ret select 1) pushBack ["CUP_M136_M",nil,10000];
					(_ret select 1) pushBack ["CUP_launch_Igla",nil,300000];
					(_ret select 1) pushBack ["CUP_Igla_M",nil,10000];
					(_ret select 1) pushBack ["CUP_launch_FIM92Stinger",nil,300000];
					(_ret select 1) pushBack ["CUP_Stinger_M",nil,10000];
					(_ret select 1) pushBack ["APERSMine_Range_Mag",nil,70000];
					(_ret select 1) pushBack ["APERSTripMine_Wire_Mag",nil,70000];
					(_ret select 1) pushBack ["SatchelCharge_Remote_Mag",nil,200000];
					(_ret select 1) pushBack ["O_HMG_01_high_weapon_F",nil,400000];
					(_ret select 1) pushBack ["O_HMG_01_support_high_F",nil,7000];
				};
			};
		};
	};
	
	case "gun":
	{
		switch(true) do
		{
			//case (playerSide != civilian): {"Vous n'êtes pas civil !"};
			case (!license_civ_gun): {"Désolé monsieur, vous n'avez pas le permis de port d'armes !"};
			default
			{
				_ret = 
				["Armurerie",
					[
						["CUP_srifle_CZ550",nil,130000],
						["CUP_5x_22_LR_17_HMR_M",nil,700],
						["CUP_srifle_LeeEnfield",nil,90000],
						["CUP_10x_303_M",nil,500],
						["CUP_hgun_Compact",nil,15000],
						["CUP_10Rnd_9x19_Compact",nil,150],
						["CUP_hgun_Duty",nil,16500],
						["16Rnd_9x21_Mag",nil,200],
						["CUP_hgun_Phantom",nil,17000],
						["CUP_18Rnd_9x19_Phantom",nil,225],
						["CUP_hgun_Colt1911",nil,18000],
						["CUP_7Rnd_45ACP_1911",nil,275],
						["CUP_hgun_Makarov",nil,20000],
						["CUP_hgun_PB6P9",nil,20000],
						["CUP_8Rnd_9x18_Makarov_M",nil,300],
						["CUP_hgun_TaurusTracker455",nil,21500],
						["CUP_hgun_TaurusTracker455_gold",nil,35000],
						["CUP_6Rnd_45ACP_M",nil,325],
						["hgun_ACPC2_F",nil,21500],
						["9Rnd_45ACP_Mag",nil,350],
						["CUP_hgun_MicroUzi",nil,70000],
						["CUP_30Rnd_9x19_UZI",nil,400],
						["CUP_hgun_SA61",nil,70000],
						["CUP_20Rnd_B_765x17_Ball_M",nil,400],
						["hgun_PDW2000_F",nil,80000],
						["30Rnd_9x21_Mag",nil,450],
						["optic_ACO_grn_smg",nil,2500],
						["optic_Aco_smg",nil,2500],
						["AGM_EarBuds",nil,25],
						["AGM_ItemKestrel",nil,500],
						["AGM_SpareBarrel",nil,1000]
					]
				];
				if(license_civ_vigil) then
				{
					(_ret select 1) pushBack ["CUP_arifle_CZ805_A1",nil,75000];
					(_ret select 1) pushBack ["CUP_arifle_CZ805_GL",nil,75000];
					(_ret select 1) pushBack ["CUP_arifle_CZ805_A2",nil,75000];
					(_ret select 1) pushBack ["CUP_30Rnd_556x45_Stanag",nil,575];
					(_ret select 1) pushBack ["CUP_arifle_CZ805_B",nil,95000];
					(_ret select 1) pushBack ["CUP_arifle_CZ805_B_GL",nil,95000];
					(_ret select 1) pushBack ["CUP_20Rnd_762x51_CZ805B",nil,650];
					(_ret select 1) pushBack ["CUP_optic_CompM4",nil,3000];
					(_ret select 1) pushBack ["CUP_optic_HoloBlack",nil,3000];
					(_ret select 1) pushBack ["CUP_optic_CompM2_Black",nil,3000];
				};
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
				_ret = 
				["Armurerie de gang",
					[
						["optic_ACO_grn_smg",nil,1250],
						["optic_Aco_smg",nil,1250],
						["AGM_EarBuds",nil,25],
						["AGM_ItemKestrel",nil,500],
						["AGM_SpareBarrel",nil,1000]
					]
				];
			};
		};
	};
	
	case "genstore":
	{
		_ret = 
		["Magasin Général",
			[
				["tf_anprc148jem",nil,5000],
				["Binocular",nil,150],
				["ItemGPS",nil,100],
				["ItemCompass",nil,75],
				["ItemWatch","SmartWatch",50],
				["ItemMap",nil,10],
				["AGM_MapTools",nil,500],
				["ToolKit",nil,9500],
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
_ret;