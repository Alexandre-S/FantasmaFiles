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
						["arifle_mas_mp5",nil,0],
						["arifle_mas_mp5_v",nil,0],
						["arifle_mas_mp5_d",nil,0],
						["30Rnd_mas_9x21_Stanag",nil,0],
						["arifle_mas_m1014",nil,0],
						["7Rnd_mas_12Gauge_Slug",nil,0],
						["7Rnd_mas_12Gauge_Pellets",nil,0],
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
						["arifle_mas_m4",nil,0],
						["arifle_mas_m4_v",nil,0],
						["arifle_mas_m4_d",nil,0],
						["30Rnd_mas_556x45_Stanag",nil,0],
						["optic_Holosight",nil,0],
						["hgun_mas_m9_F",nil,0],
						["15Rnd_mas_9x21_Mag",nil,0],
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
						["arifle_mas_hk416",nil,0],
						["arifle_mas_hk416_v",nil,0],
						["arifle_mas_hk416_d",nil,0],
						["arifle_mas_m16",nil,0],
						["30Rnd_mas_556x45_Stanag",nil,0],
						["LMG_mas_M249_F",nil,0],
						["LMG_mas_M249_F_v",nil,0],
						["LMG_mas_M249_F_d",nil,0],
						["200Rnd_mas_556x45_Stanag",nil,0],
						["hgun_mas_glock_F",nil,0],
						["17Rnd_mas_9x21_Mag",nil,0],
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
						["srifle_mas_m24",nil,0],
						["srifle_mas_m24_v",nil,0],
						["srifle_mas_m24_d",nil,0],
						["5Rnd_mas_762x51_Stanag",nil,0],
						["srifle_mas_sr25",nil,0],
						["srifle_mas_sr25_v",nil,0],
						["srifle_mas_sr25_d",nil,0],
						["srifle_mas_mk17s",nil,0],
						["srifle_mas_m110",nil,0],
						["20Rnd_mas_762x51_Stanag",nil,0],
						["optic_DMS",nil,0],
						["optic_SOS",nil,0],
						["optic_NVS",nil,0],
						["optic_mas_zeiss",nil,0],
						["optic_mas_zeiss_c",nil,0],
						["optic_mas_zeiss_eo",nil,0],
						["optic_mas_zeiss_eo_c",nil,0],
						["Rangefinder",nil,0],
						["AGM_Vector",nil,0],
						["muzzle_mas_snds_SM",nil,0],
						["muzzle_mas_snds_SMc",nil,0]
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
						["arifle_mas_m4_gl",nil,0],
						["arifle_mas_m4_gl_v",nil,0],
						["arifle_mas_m4_gl_d",nil,0],
						["arifle_mas_hk416_gl",nil,0],
						["arifle_mas_hk416_gl_v",nil,0],
						["arifle_mas_hk416_gl_d",nil,0],
						["arifle_mas_m16_gl",nil,0],
						["30Rnd_mas_556x45_Stanag",nil,0],
						["mas_launch_maaws_F",nil,0],
						["mas_MAAWS",nil,0],
						["mas_launch_M136_F",nil,0],
						["mas_M136",nil,0],
						["mas_launch_Stinger_F",nil,0],
						["mas_Stinger",nil,0],
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
						["UGL_FlareRed_F",nil,0]
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
						["arifle_mas_m4c",nil,0],
						["arifle_mas_m4c_d",nil,0],
						["arifle_mas_m4c_v",nil,0],
						["30Rnd_mas_556x45_Stanag",nil,0],
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
						["SMG_02_F",nil,0],
						["30Rnd_9x21_Mag",nil,0],
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
						["arifle_mas_hk416",nil,0],
						["arifle_mas_hk416_v",nil,0],
						["arifle_mas_hk416_d",nil,0],
						["30Rnd_mas_556x45_Stanag",nil,0],
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
						["arifle_mas_hk417c",nil,0],
						["arifle_mas_hk417c_v",nil,0],
						["arifle_mas_hk417c_d",nil,0],
						["srifle_mas_sr25",nil,0],
						["srifle_mas_sr25_v",nil,0],
						["srifle_mas_sr25_d",nil,0],
						["20Rnd_mas_762x51_Stanag",nil,0],
						["hgun_mas_usp_F",nil,0],
						["12Rnd_mas_45acp_Mag",nil,0],
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
						["muzzle_mas_snds_M",nil,0],
						["muzzle_mas_snds_Mc",nil,0],
						["muzzle_mas_snds_SM",nil,0],
						["muzzle_mas_snds_SMc",nil,0],
						["muzzle_mas_snds_L",nil,0]
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
						["LMG_mas_M240_F",nil,0],
						["LMG_mas_mg3_F",nil,0],
						["100Rnd_mas_762x51_Stanag",nil,0],
						["srifle_mas_m107",nil,0],
						["srifle_mas_m107_v",nil,0],
						["srifle_mas_m107_d",nil,0],
						["5Rnd_mas_127x99_Stanag",nil,0],
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
							// ["U_Rangemaster","Uniforme Medecin",250],
							// ["U_Competitor","Uniforme Dépanneur",250],
							// ["FANTASMA_MedicTenue",nil,550],
							// ["G_Shades_Black",nil,25],
							// ["G_Shades_Blue",nil,20],
							// ["G_Sport_Blackred",nil,20],
							// ["G_Sport_Checkered",nil,20],
							// ["G_Sport_Blackyellow",nil,20],
							// ["G_Sport_BlackWhite",nil,20],
							// ["G_Squares",nil,10],
							// ["H_StrawHat","Straw Fedora",225],
							// ["H_BandMask_blk","Hat & Bandanna",300],
							// ["H_Booniehat_tan",nil,425],
							// ["H_Hat_blue",nil,310],
							// ["H_Hat_brown",nil,276],
							// ["H_Hat_checker",nil,340],
							// ["H_Hat_grey",nil,280],
							// ["H_Hat_tan",nil,265],
							// ["H_Cap_blu",nil,150],
							// ["H_Cap_grn",nil,150],
							// ["H_Cap_grn_BI",nil,150],
							// ["H_Cap_oli",nil,150],
							// ["H_Cap_red",nil,150],
							// ["H_Cap_tan",nil,150],
							// ["Mask_M40",nil,2000],
							// ["Mask_M40_OD",nil,2000],
							// ["U_B_Wetsuit",nil,200],
							// ["V_RebreatherB",nil,500],
							// ["G_Diving",nil,50],
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
							// ["ARC_FR_Backpack_CE_Med",nil,2000],
							// ["ARC_FR_Backpack_Daguet_Med",nil,2000],
							["tf_anprc155",nil,500],
							// ["V_Chestrig_khk",nil,1000],
							// ["V_HarnessO_brn",nil,1500],
							// ["B_FieldPack_blk",nil,3000],
							["SmokeShellRed",nil,100],
							["Chemlight_blue",nil,100],
							["Chemlight_yellow",nil,100]
						]
					];
				};
				// Croix Rouge rang 2
				if(__GETC__(life_medicLevel) >= 2) then
				{
					(_ret select 1) pushBack ["hgun_mas_mak_F",nil,5000];
					(_ret select 1) pushBack ["8Rnd_mas_9x18_Mag",nil,15];
					(_ret select 1) pushBack ["hgun_Rook40_F",nil,6500];
					(_ret select 1) pushBack ["16Rnd_9x21_Mag",nil,25];
					(_ret select 1) pushBack ["hgun_mas_bhp_F",nil,8000];
					(_ret select 1) pushBack ["15Rnd_mas_9x21_Mag",nil,25];
					(_ret select 1) pushBack ["hgun_mas_grach_F",nil,9500];
					(_ret select 1) pushBack ["17Rnd_mas_9x21_Mag",nil,35];
					(_ret select 1) pushBack ["hgun_ACPC2_F",nil,11500];
					(_ret select 1) pushBack ["9Rnd_45ACP_Mag",nil,45];
				};
				// Croix Rouge rang 3
				if(__GETC__(life_medicLevel) >= 3) then
				{
					(_ret select 1) pushBack ["hgun_PDW2000_F",nil,20000];
					(_ret select 1) pushBack ["30Rnd_9x21_Mag",nil,75];
					(_ret select 1) pushBack ["optic_ACO_grn_smg",nil,2500];
					(_ret select 1) pushBack ["optic_Aco_smg",nil,2500];
				};
				// Croix Rouge rang 4
				if(__GETC__(life_medicLevel) >= 4) then
				{
					(_ret select 1) pushBack ["hgun_mas_sa61_F",nil,20000];
					(_ret select 1) pushBack ["20Rnd_mas_765x17_Mag",nil,75];
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
							["arifle_mas_bizon",nil,25000],
							["64Rnd_mas_9x18_mag",nil,750],
							["arifle_mas_saiga",nil,15000],
							["10Rnd_mas_12Gauge_Slug",nil,150],
							["10Rnd_mas_12Gauge_Pellets",nil,150],
							["arifle_mas_m1014",nil,15000],
							["7Rnd_mas_12Gauge_Slug",nil,150],
							["7Rnd_mas_12Gauge_Pellets",nil,150],
							["arifle_mas_m4",nil,20000],
							["arifle_mas_m4_v",nil,20000],
							["arifle_mas_m4_d",nil,20000],
							["arifle_mas_m4_gl",nil,20000],
							["arifle_mas_m4_gl_v",nil,20000],
							["arifle_mas_m4_gl_d",nil,20000],
							["arifle_mas_l119",nil,25000],
							["arifle_mas_l119_v",nil,25000],
							["arifle_mas_l119_d",nil,25000],
							["arifle_mas_l119_gl",nil,30000],
							["arifle_mas_l119_gl_v",nil,30000],
							["arifle_mas_l119_gl_d",nil,30000],
							["arifle_mas_mk16",nil,25000],
							["arifle_mas_mk16_l",nil,25000],
							["arifle_mas_mk16_gl",nil,30000],
							["30Rnd_mas_556x45_Stanag",nil,300],
							["arifle_mas_ak_74m",nil,20000],
							["arifle_mas_ak_74m_c",nil,20000],
							["arifle_mas_aks74",nil,20000],
							["arifle_mas_ak_74m_gl",nil,25000],
							["arifle_mas_ak_74m_gl_c",nil,25000],
							["arifle_mas_aks74_gl",nil,25000],
							["arifle_mas_aks74u",nil,25000],
							["arifle_mas_aks74u_c",nil,25000],
							["arifle_mas_ak_74m_sf",nil,30000],
							["arifle_mas_ak_74m_sf_c",nil,30000],
							["arifle_mas_ak_74m_sf_gl",nil,35000],
							["arifle_mas_ak_74m_sf_gl_c",nil,35000],
							["30Rnd_mas_545x39_mag",nil,300],
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
					(_ret select 1) pushBack ["arifle_mas_g3",nil,45000];
					(_ret select 1) pushBack ["arifle_mas_g3s",nil,45000];
					(_ret select 1) pushBack ["arifle_mas_fal",nil,45000];
					(_ret select 1) pushBack ["20Rnd_mas_762x51_Stanag",nil,700];
					(_ret select 1) pushBack ["arifle_mas_m70",nil,45000];
					(_ret select 1) pushBack ["arifle_mas_m70ab",nil,45000];
					(_ret select 1) pushBack ["arifle_mas_m70_gl",nil,50000];
					(_ret select 1) pushBack ["arifle_mas_m70ab_gl",nil,50000];
					(_ret select 1) pushBack ["arifle_mas_akms",nil,40000];
					(_ret select 1) pushBack ["arifle_mas_akms_c",nil,40000];
					(_ret select 1) pushBack ["arifle_mas_akms_gl",nil,45000];
					(_ret select 1) pushBack ["arifle_mas_akms_gl_c",nil,45000];
					(_ret select 1) pushBack ["arifle_mas_akm_gl",nil,50000];
					(_ret select 1) pushBack ["arifle_mas_akm",nil,45000];
					(_ret select 1) pushBack ["30Rnd_mas_762x39_mag",nil,700];
					(_ret select 1) pushBack ["LMG_mas_rpk_F",nil,60000];
					(_ret select 1) pushBack ["100Rnd_mas_545x39_mag",nil,800];
					(_ret select 1) pushBack ["srifle_mas_m91",nil,70000];
					(_ret select 1) pushBack ["srifle_mas_svd",nil,80000];
					(_ret select 1) pushBack ["10Rnd_mas_762x54_mag",nil,1100];
					(_ret select 1) pushBack ["LMG_mas_m72_F",nil,90000];
					(_ret select 1) pushBack ["100Rnd_mas_762x39_mag",nil,1200];
					(_ret select 1) pushBack ["srifle_mas_m24",nil,60000];
					(_ret select 1) pushBack ["srifle_mas_m24_v",nil,60000];
					(_ret select 1) pushBack ["srifle_mas_m24_d",nil,60000];
					(_ret select 1) pushBack ["5Rnd_mas_762x51_Stanag",nil,900];
					(_ret select 1) pushBack ["LMG_mas_M249_F",nil,90000];
					(_ret select 1) pushBack ["LMG_mas_M249_F_v",nil,90000];
					(_ret select 1) pushBack ["LMG_mas_M249_F_d",nil,90000];
					(_ret select 1) pushBack ["200Rnd_mas_556x45_Stanag",nil,1200];
					(_ret select 1) pushBack ["LMG_mas_pkm_F",nil,120000];
					(_ret select 1) pushBack ["100Rnd_mas_762x54_mag",nil,1500];
					(_ret select 1) pushBack ["optic_LRPS",nil,2500];
					(_ret select 1) pushBack ["optic_SOS",nil,3500];
				};
				// Rang 3
				if(__GETC__(life_reblevel) >= 3) then
				{
					(_ret select 1) pushBack ["arifle_mas_g3",nil,45000];
					(_ret select 1) pushBack ["mas_launch_Strela_F",nil,300000];
					(_ret select 1) pushBack ["mas_Strela",nil,10000];
					(_ret select 1) pushBack ["mas_launch_Stinger_F",nil,300000];
					(_ret select 1) pushBack ["mas_Stinger",nil,10000];
					(_ret select 1) pushBack ["mas_launch_RPG7_F",nil,300000];
					(_ret select 1) pushBack ["mas_PG7V",nil,10000];
					(_ret select 1) pushBack ["mas_launch_M136_F",nil,300000];
					(_ret select 1) pushBack ["mas_M136",nil,10000];
					(_ret select 1) pushBack ["srifle_mas_ksvk",nil,700000];
					(_ret select 1) pushBack ["5Rnd_mas_127x108_mag",nil,5000];
					(_ret select 1) pushBack ["srifle_mas_m107_d",nil,700000];
					(_ret select 1) pushBack ["5Rnd_mas_127x99_Stanag",nil,5000];
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
						["hgun_mas_mak_F",nil,15000],
						["8Rnd_mas_9x18_Mag",nil,15],
						["hgun_Rook40_F",nil,16500],
						["16Rnd_9x21_Mag",nil,25],
						["hgun_mas_bhp_F",nil,18000],
						["15Rnd_mas_9x21_Mag",nil,25],
						["hgun_mas_grach_F",nil,19500],
						["17Rnd_mas_9x21_Mag",nil,35],
						["hgun_ACPC2_F",nil,21500],
						["9Rnd_45ACP_Mag",nil,45],
						["hgun_PDW2000_F",nil,70000],
						["30Rnd_9x21_Mag",nil,75],
						["hgun_mas_uzi_F",nil,70000],
						["25Rnd_mas_9x19_Mag",nil,75],
						["hgun_mas_sa61_F",nil,70000],
						["20Rnd_mas_765x17_Mag",nil,75],
						["optic_ACO_grn_smg",nil,2500],
						["optic_Aco_smg",nil,2500],
						["AGM_EarBuds",nil,25],
						["AGM_ItemKestrel",nil,500],
						["AGM_SpareBarrel",nil,1000]
					]
				];
				if(license_civ_vigil) then
				{
					(_ret select 1) pushBack ["arifle_Mk20_F",nil,35000];
					(_ret select 1) pushBack ["arifle_Mk20C_F",nil,35000];
					(_ret select 1) pushBack ["30Rnd_556x45_Stanag",nil,250];
					(_ret select 1) pushBack ["30Rnd_556x45_Stanag_Tracer_Red",nil,250];
					(_ret select 1) pushBack ["30Rnd_556x45_Stanag_Tracer_Green",nil,250];
					(_ret select 1) pushBack ["30Rnd_556x45_Stanag_Tracer_Yellow",nil,250];
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
						["hgun_mas_mak_F",nil,2500],
						["8Rnd_mas_9x18_Mag",nil,15],
						["hgun_Rook40_F",nil,3250],
						["16Rnd_9x21_Mag",nil,25],
						["hgun_mas_bhp_F",nil,4000],
						["15Rnd_mas_9x21_Mag",nil,25],
						["hgun_mas_grach_F",nil,4750],
						["17Rnd_mas_9x21_Mag",nil,35],
						["hgun_ACPC2_F",nil,5750],
						["9Rnd_45ACP_Mag",nil,45],
						["hgun_PDW2000_F",nil,10000],
						["30Rnd_9x21_Mag",nil,75],
						["hgun_mas_uzi_F",nil,10000],
						["25Rnd_mas_9x19_Mag",nil,75],
						["hgun_mas_sa61_F",nil,10000],
						["20Rnd_mas_765x17_Mag",nil,75],
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