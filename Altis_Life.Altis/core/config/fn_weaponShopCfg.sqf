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
					
						["R3F_M4S90",nil,0],
						["R3F_7Rnd_M4S90",nil,0],
						["R3F_MP5SD",nil,0],
						["R3F_30Rnd_9x19_MP5",nil,0],
					
						["DDOPP_X26",nil,0],
						["DDOPP_1Rnd_X26",nil,0],
						// ["hgun_P07_snds_F","Stun Pistol",0],
						// ["16Rnd_9x21_Mag","Stun Pistol Magazine",0],
						
						["acc_flashlight",nil,0],
						["R3F_LAMPE_SURB",nil,0],
						
						["optic_Aco",nil,0],
						["optic_ACO_grn",nil,0],
						["optic_Holosight",nil,0],
						["R3F_AIMPOINT",nil,0],
						["R3F_AIMPOINT_DES",nil,0],
						["rhsusf_acc_compm4",nil,0],
						["R3F_EOTECH",nil,0],
						["R3F_EOTECH_DES",nil,0],
						["rhsusf_acc_eotech_552",nil,0],
						
						["Binocular",nil,0],
						["ACE_NVG_Gen4",nil,0],
						
						["SmokeShellYellow","Gaz Lacrimo",0],

						["ToolKit",nil,0],
						["FirstAidKit",nil,0],
						["ACE_EarPlugs",nil,0],
						["ACE_Kestrel4500",nil,0],
						["ACE_MapTools",nil,0],
						["ACE_SpareBarrel",nil,0],
						["ACE_CableTie",nil,0],
						["ItemGPS",nil,0],
						["ItemMap",nil,0],
						["ItemCompass",nil,0],
						["ItemWatch","SmartWatch",0],
						["ACE_Altimeter","SmartWatch Altimètre",0],
						["tf_anprc152",nil,0],
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
						["ACE_HandFlare_White",nil,0],
						["ACE_HandFlare_Red",nil,0],
						["ACE_HandFlare_Green",nil,0],
						["ACE_HandFlare_Yellow",nil,0],
						["ACE_IR_Strobe_Item",nil,0]
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
						["R3F_Famas_F1",nil,0],
						["R3F_Famas_F1_DES",nil,0],
						["R3F_25Rnd_556x45_FAMAS",nil,0],
						["R3F_Famas_surb",nil,0],				
						["R3F_Famas_G2",nil,0],
						["R3F_30Rnd_556x45_FAMAS",nil,0],
						["R3F_HK416M",nil,0],
						["R3F_HK416M_DES",nil,0],
						["R3F_30Rnd_556x45_HK416",nil,0],
						["rhs_weap_m4a1_blockII_grip2_KAC",nil,0],
						["rhs_mag_30Rnd_556x45_Mk318_Stanag",nil,0],
						["DDOPP_X3",nil,0],
						["DDOPP_X3_b",nil,0],
						["DDOPP_3Rnd_X3",nil,0],
						["ACE_M84",nil,0]
					]
				];
			};
		};
	};

	case "cop_bacpj":
	{
		switch(true) do
		{
			case (playerSide != west): {"Interdit aux civils !"};
			case (!l_g_bacpj): {"Vous n'avez pas la formation BAC / PJ !"};
			//case (__GETC__(life_coplevel) < 3): {"Réservé aux lieutenant!"};
			default
			{
				_ret =
				["Armurerie : BAC et PJ",
					[
						// rook 9mm
						["hgun_Rook40_F",nil,0],
						["16Rnd_9x21_Mag",nil,0],
						
						//.45
						["hgun_ACPC2_F",nil,0],
						["9Rnd_45ACP_Mag",nil,0],
						
						//benelli m4 
						// ["R3F_M4S90",nil,0],
						// ["R3F_7Rnd_M4S90",nil,0],
						["acc_flashlight",nil,0],
						
						// pompe court
						["rhs_weap_M590_5RD",nil,0],
						["rhsusf_5Rnd_00Buck",nil,0],

						// pompe long
						["rhs_weap_M590_8RD",nil,0],
						["rhsusf_8Rnd_00Buck",nil,0],
						
						//enfield
						["Trixie_Enfield",nil,0],
						["Trixie_Enfield_Mag",nil,0],

						//CZ550
						["Trixie_CZ550_Rail",nil,0],
						["Trixie_CZ550_Mag",nil,0],
						
						// optic
						["optic_Aco",nil,0],
						["optic_ACO_grn",nil,0],
						["optic_Holosight",nil,0],
						["R3F_AIMPOINT",nil,0],
						["R3F_AIMPOINT_DES",nil,0],
						["rhsusf_acc_compm4",nil,0],
						["R3F_EOTECH",nil,0],
						["R3F_EOTECH_DES",nil,0],
						["rhsusf_acc_eotech_552",nil,0],
						
						//equip
						["ACE_EarPlugs",nil,0],
						["ACE_Kestrel4500",nil,0],
						["ACE_SpareBarrel",nil,0],
						["ACE_CableTie",nil,0],
						["ACE_NVG_Gen1",nil,0],
					
						["B_UavTerminal",nil,0]
					]
				];
			};
		};
	};
	
	case "cop_aprg":
	{
		switch(true) do
		{
			case (playerSide != west): {"Interdit aux civils !"};
			case (!l_g_aprg): {"Vous n'avez pas la formation APRG !"};
			//case (__GETC__(life_coplevel) < 3): {"Réservé aux lieutenant!"};
			default
			{
				_ret =
				["Armurerie : APRG",
					[
						// MK 18
						["rhs_weap_mk18_grip2",nil,0],
						["rhs_mag_30Rnd_556x45_Mk318_Stanag",nil,0]
					]
				];
			};
		};
	};
	
	/*case "cop_grenadier":
	{
		switch(true) do
		{
			case (playerSide != west): {"Interdit aux civils !"};
			case (!l_g_grenadier): {"Vous n'avez pas la formation grenadier !"};
			//case (__GETC__(life_coplevel) < 5): {"Réservé aux Haut-Gradés!"};
			default
			{
				_ret =
				["Armurerie : Grenadier",
					[
						
						["HandGrenade",nil,0],
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
			case (!l_g_air): {"Vous n'avez pas la formation aérienne !"};
			//case (__GETC__(life_coplevel) < 5): {"Réservé aux Haut-Gradés!"};
			default
			{
				_ret =
				["Armurerie : Aérienne",
					[
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
			case (!l_g_onumecano): {"Vous n'avez pas la formation mécano / personnel naviguant !"};
			//case (__GETC__(life_coplevel) < 5): {"Réservé aux Haut-Gradés!"};
			default
			{
				_ret =
				["Armurerie : Mécano / Personnel naviguant",
					[
						["hgun_Pistol_Signal_F",nil,0],
						["6Rnd_GreenSignal_F",nil,0],
						["6Rnd_RedSignal_F",nil,0],
						["MineDetector",nil,0]
					]
				];
			};
		};
	};*/
	
	case "cop_medic":
	{
		switch(true) do
		{
			case (playerSide != west): {"Interdit aux civils !"};
			case (!l_g_medic): {"Vous n'avez pas la formation médic !"};
			//case (__GETC__(life_coplevel) < 5): {"Réservé aux Haut-Gradés!"};
			default
			{
				_ret =
				["Armurerie : Médic",
					[
						["Medikit",nil,0]
					]
				];
			};
		};
	};
	
	case "cop_cg":
	{
		switch(true) do
		{
			case (playerSide != west): {"Interdit aux civils !"};
			case (!l_g_cg): {"Vous n'avez pas la formation maritime !"};
			//case (__GETC__(life_coplevel) < 5): {"Réservé aux Haut-Gradés!"};
			default
			{
				_ret =
				["Armurerie : Maritime",
					[
						["arifle_SDAR_F",nil,0],
						["20Rnd_556x45_UW_mag",nil,0]
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
			case (!l_g_swat): {"Vous n'avez pas la formation unité tactique !"};
			//case (__GETC__(life_coplevel) < 5): {"Réservé aux Haut-Gradés!"};
			default
			{
				_ret =
				["Armurerie : Unité Tactique",
					[
						["gign_shield",nil,0],
						
						["R3F_HK417M",nil,0],
						["R3F_HK417M_DES",nil,0],
						["R3F_HK417L",nil,0],
						["R3F_HK417L_DES",nil,0],
						["R3F_20Rnd_762x51_HK417",nil,0],
						
						["R3F_Minimi",nil,0],
						["R3F_200Rnd_556x45_MINIMI",nil,0],

						["R3F_M107",nil,0],
						["R3F_M107_DES",nil,0],
						["R3F_10Rnd_127x99_M107",nil,0],
						
						["rhs_weap_XM2010",nil,0],
						["rhs_weap_XM2010_wd",nil,0],
						["rhs_weap_XM2010_d",nil,0],
						["rhs_weap_XM2010_sa",nil,0],
						["rhsusf_5Rnd_300winmag_xm2010",nil,0],
						
						["optic_MRCO",nil,0],
						["optic_Hamr",nil,0],
						["optic_LRPS",nil,0],
						
						["ACE_Vector",nil,0],
						["Laserdesignator",nil,0],
						["Laserbatteries",nil,0],
						["B_UavTerminal",nil,0],
						["MineDetector",nil,0],
						["ACE_Kestrel4500",nil,0]
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
						["rpima_shield",nil,0],
						["R3F_Minimi_762",nil,0],
						["R3F_100Rnd_762x51_MINIMI",nil,0],
						["R3F_PGM_Hecate_II_DES",nil,0],
						["R3F_7Rnd_127x99_PGM",nil,0],
						["R3F_STINGER",nil,0],
						["R3F_STINGER_mag",nil,0],
						["R3F_AT4CS",nil,0],
						["R3F_AT4CS_Mag",nil,0]
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
							["tf_anprc148jem",nil,5000],
							["ItemGPS",nil,100],
							["ItemCompass",nil,100],
							["ItemWatch","SmartWatch",100],
							["ACE_Altimeter","SmartWatch Altimètre",100],
							["ItemMap",nil,100],
							["ACE_MapTools",nil,500],
							["ACE_SpareBarrel",nil,1000],
							["ACE_CableTie",nil,100],
							["ACE_EarPlugs",nil,25],
							["ACE_Kestrel4500",nil,500],
							["Binocular",nil,150],
							["ToolKit",nil,3000],
							["FirstAidKit",nil,1000],
							["Medikit",nil,500],
							["ACE_NVG_Gen2",nil,1200],
							["SmokeShellRed",nil,1000],
							["Chemlight_blue",nil,300],
							["Chemlight_yellow",nil,300],
							["ACE_HandFlare_White",1000],
							["ACE_HandFlare_Red",1000],
							["ACE_HandFlare_Green",1000],
							["ACE_HandFlare_Yellow",1000],
							["ACE_IR_Strobe_Item",nil,0],
							["hgun_Rook40_F",nil,4900],
							["16Rnd_9x21_Mag",nil,350],
							["hgun_ACPC2_F",nil,5300],
							["9Rnd_45ACP_Mag",nil,400]
						]
					];
				};
				// Croix Rouge rang 2
				if(__GETC__(life_medicLevel) >= 2) then
				{

					//benelli m4 
					// (_ret select 1) pushBack ["R3F_M4S90",nil,50000];
					// (_ret select 1) pushBack ["R3F_7Rnd_M4S90",nil,450];
					(_ret select 1) pushBack ["acc_flashlight",nil,1000];
					
					// pompe court
					(_ret select 1) pushBack ["rhs_weap_M590_5RD",nil,64000];
					(_ret select 1) pushBack ["rhsusf_5Rnd_00Buck",nil,350];

					// pompe long
					(_ret select 1) pushBack ["rhs_weap_M590_8RD",nil,67000];
					(_ret select 1) pushBack ["rhsusf_8Rnd_00Buck",nil,550];
					
					//enfield
					(_ret select 1) pushBack ["Trixie_Enfield",nil,70000];
					(_ret select 1) pushBack ["Trixie_Enfield_Mag",nil,750];

					//CZ550
					(_ret select 1) pushBack ["Trixie_CZ550_Rail",nil,120000];
					(_ret select 1) pushBack ["Trixie_CZ550_Mag",nil,1000];
					
					// optic
					(_ret select 1) pushBack ["optic_Aco",nil,3000];
					(_ret select 1) pushBack ["optic_ACO_grn",nil,3000];
					(_ret select 1) pushBack ["optic_Holosight",nil,3000];
					(_ret select 1) pushBack ["R3F_AIMPOINT",nil,3000];
					(_ret select 1) pushBack ["R3F_AIMPOINT_DES",nil,3000];
					(_ret select 1) pushBack ["rhsusf_acc_compm4",nil,3000];
					(_ret select 1) pushBack ["R3F_EOTECH",nil,3000];
					(_ret select 1) pushBack ["R3F_EOTECH_DES",nil,3000];
					(_ret select 1) pushBack ["rhsusf_acc_eotech_552",nil,3000];
					
				};
				// Croix Rouge rang 3
				if(__GETC__(life_medicLevel) >= 3) then
				{
					// (_ret select 1) pushBack ["rhs_weap_mk18",nil,100000];
					(_ret select 1) pushBack ["rhs_weap_mk18_grip2",nil,100000];
					(_ret select 1) pushBack ["rhs_mag_30Rnd_556x45_Mk318_Stanag",nil,1000];

				};
				// Croix Rouge rang 4
				if(__GETC__(life_medicLevel) >= 4) then
				{
					
				};
			};
		};
	};
	
	case "rebel":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"Vous n'êtes pas un citoyen, oust !"};
			case (!l_c_rebel && __GETC__(life_reblevel) >= 1): {"Hey l'ami, je te connais pas moi, t'achéteras rien ici sans signer notre contrat !"};
			case (!l_c_thug && __GETC__(life_reblevel) == 0): {"Hey l'ami, je te connais pas moi, t'achéteras rien ici sans signer notre contrat !"};
			default
			{
				// Rang 1
				if(__GETC__(life_reblevel) == 0) then
				{
					_ret =
					["Marché noir - rang 0",
						[
							//pdw
							["hgun_PDW2000_F",nil,67500],
							["30Rnd_9x21_Mag",nil,950],

							//venin .45
							["SMG_01_F",nil,69450],
							["30Rnd_45ACP_Mag_SMG_01",nil,750],

							//sting 9mm
							["SMG_02_F",nil,73450],
							["30Rnd_9x21_Mag",nil,950],
							
							//optic
							["optic_Aco",nil,3000],
							["optic_ACO_grn",nil,3000],
							["optic_Holosight",nil,3000],
							["R3F_AIMPOINT",nil,3000],
							["R3F_AIMPOINT_DES",nil,3000],
							["rhsusf_acc_compm4",nil,3000],
							["R3F_EOTECH",nil,3000],
							["R3F_EOTECH_DES",nil,3000],
							["rhsusf_acc_eotech_552",nil,3000],
							
							["ACE_EarPlugs",nil,25],
							["ACE_Kestrel4500",nil,500],
							["ACE_SpareBarrel",nil,1000],
							["ACE_CableTie",nil,100],
							["ACE_NVG_Gen1",nil,2000]
						]
					];
				};
				// Rang 1
				if(__GETC__(life_reblevel) >= 1) then
				{
					_ret =
					["Marché noir 1 - rang 1",
						[
						
							// mp-443 9mm
							["rhs_weap_pya",nil,4900],
							["rhs_mag_9x19_17",nil,350],
							
							// makarov 9mm
							["rhs_weap_makarov_pmm",nil,4900],
							["rhs_mag_9x18_12_57N181S",nil,350],
							
							//.45
							["hgun_Pistol_heavy_01_F",nil,5300],
							["11Rnd_45ACP_Mag",nil,400],
						
							//Zubr terro
							["hgun_Pistol_heavy_02_F",nil,9990],
							["6Rnd_45ACP_Cylinder",nil,350],
						
							//ak74m
							["rhs_weap_ak74m_folded",nil,100000],
							["rhs_weap_ak74m",nil,100000],
							["rhs_weap_ak74m_npz",nil,100000],
							["rhs_weap_ak74m_2mag",nil,100000],
							["rhs_weap_ak74m_2mag_npz",nil,100000],
							["rhs_weap_ak74m_camo",nil,100000],
							["rhs_weap_ak74m_camo_npz",nil,100000],
							["rhs_weap_ak74m_2mag_camo",nil,100000],
							["rhs_weap_ak74m_2mag_camo_npz",nil,100000],
							["rhs_weap_ak74m_desert",nil,100000],
							["rhs_weap_ak74m_desert_npz",nil,100000],
							// ["rhs_weap_ak74m_gp25",nil,125000],
							// ["rhs_weap_ak74m_gp25_npz",nil,125000],
							["rhs_30Rnd_545x39_AK",nil,1000],

							
							//m16a4 m4 m4a1
							["rhs_weap_m16a4",nil,100000],
							["rhs_weap_m16a4_grip",nil,100000],
							["rhs_weap_m16a4_carryhandle",nil,100000],
							["rhs_weap_m16a4_carryhandle_grip_pmag",nil,100000],
							["rhs_weap_m4",nil,100000],
							["rhs_weap_m4_grip",nil,100000],
							// ["rhs_weap_m4_m320",nil,125000],
							["rhs_weap_m4a1_carryhandle",nil,100000],
							["rhs_mag_30Rnd_556x45_Mk318_Stanag",nil,1000],
							
							
							//optic
							["rhs_acc_1p63",nil,3000],
							["rhs_acc_ekp1",nil,3000],
							["rhs_acc_pkas",nil,3000],
							
							["optic_Aco",nil,3000],
							["optic_ACO_grn",nil,3000],
							["optic_Holosight",nil,3000],
							["R3F_AIMPOINT",nil,3000],
							["R3F_AIMPOINT_DES",nil,3000],
							["rhsusf_acc_compm4",nil,3000],
							["R3F_EOTECH",nil,3000],
							["R3F_EOTECH_DES",nil,3000],
							["rhsusf_acc_eotech_552",nil,3000],
							
							//equip
							["acc_flashlight",nil,1000],
							
							
							["Binocular",nil,150],
							["ToolKit",nil,3000],
							["FirstAidKit",nil,1000],
							["ItemWatch","SmartWatch",100],
							["ACE_Altimeter","SmartWatch Altimètre",100],
							["ACE_CableTie",nil,100],
							["ACE_EarPlugs",nil,25],
							["ACE_Kestrel4500",nil,500],
							["ItemCompass",nil,100],

							["ItemMap",nil,100],
							["ACE_MapTools",nil,500],
							["ACE_SpareBarrel",nil,1000],
							["ItemGPS",nil,100],

							["tf_anprc148jem",nil,5000],
							["ACE_NVG_Gen1",nil,2000],
							
							//Grenade incendiaire : molotov
							["rhs_mag_an_m14_th3",nil,15000],
							
							["SmokeShellRed",nil,1000],
							["SmokeShellGreen",nil,1000],
							//["SmokeShellYellow",nil,1000],
							["SmokeShellPurple",nil,1000],
							["SmokeShellBlue",nil,1000],
							["SmokeShellOrange",nil,1000],
							["ACE_HandFlare_White",nil,1000],
							["ACE_HandFlare_Red",nil,1000],
							["ACE_HandFlare_Green",nil,1000],
							["ACE_HandFlare_Yellow",nil,1000]					
						]
					];
					if(__GETC__(life_factnumber) == 1) then
					{
						// (_ret select 1) pushBack ["PMC_m4",nil,20000];
						// (_ret select 1) pushBack ["PMC_m4m203",nil,25000];
						// (_ret select 1) pushBack ["30Rnd_556x45_Stanag",nil,250];
					};
				};
				// Rang 2
				if(__GETC__(life_reblevel) >= 2) then
				{	
					//ak103 akm
					(_ret select 1) pushBack ["rhs_weap_ak103",nil,140000];
					(_ret select 1) pushBack ["rhs_weap_ak103_npz",nil,140000];
					(_ret select 1) pushBack ["rhs_weap_akm",nil,140000];
					// (_ret select 1) pushBack ["rhs_weap_akm_gp25",nil,180000];
					(_ret select 1) pushBack ["rhs_weap_akms",nil,140000];
					// (_ret select 1) pushBack ["rhs_weap_akms_gp25",nil,180000];
					(_ret select 1) pushBack ["rhs_30Rnd_762x39mm",nil,1500];
					
					
					// m14 sr25 fnfal
					(_ret select 1) pushBack ["rhs_weap_m14ebrri",nil,140000];	
					(_ret select 1) pushBack ["rhs_weap_sr25",nil,140000];	
					(_ret select 1) pushBack ["rhs_weap_sr25_ec",nil,140000];
					(_ret select 1) pushBack ["rhsusf_20Rnd_762x51_m118_special_Mag",nil,1500];	
					(_ret select 1) pushBack ["Trixie_FNFAL_Rail",nil,140000];
					(_ret select 1) pushBack ["Trixie_FNFAL_Mag",nil,1500];
					
					if(__GETC__(life_factnumber) == 1) then
					{

					};
				
					(_ret select 1) pushBack ["ACE_Vector",nil,15000];
				};
				// Rang 3
				if(__GETC__(life_reblevel) >= 3) then
				{
				
					//pkm pkp
					(_ret select 1) pushBack ["rhs_weap_pkm",nil,180000];
					(_ret select 1) pushBack ["rhs_weap_pkp",nil,200000];
					(_ret select 1) pushBack ["rhs_100Rnd_762x54mmR",nil,2500];
					
					
					//249 240
					(_ret select 1) pushBack ["rhs_weap_m249_pip",nil,180000];
					(_ret select 1) pushBack ["rhsusf_100Rnd_556x45_soft_pouch",nil,2000];
					(_ret select 1) pushBack ["rhs_weap_m240B",nil,200000];
					(_ret select 1) pushBack ["rhsusf_100Rnd_762x51",nil,2500];
					
					
					//svd
					(_ret select 1) pushBack ["rhs_weap_svdp",nil,250000];
					(_ret select 1) pushBack ["rhs_weap_svdp_npz",nil,250000];
					(_ret select 1) pushBack ["rhs_weap_svdp_wd_npz",nil,250000];
					(_ret select 1) pushBack ["rhs_weap_svdp_wd",nil,250000];
					(_ret select 1) pushBack ["rhs_weap_svds",nil,250000];
					(_ret select 1) pushBack ["rhs_weap_svds_npz",nil,250000];
					(_ret select 1) pushBack ["rhs_10Rnd_762x54mmR_7N1",nil,3000];
					
					//FRF2
					(_ret select 1) pushBack ["R3F_FRF2",nil,250000];
					(_ret select 1) pushBack ["R3F_FRF2_DES",nil,250000];
					(_ret select 1) pushBack ["R3F_10Rnd_762x51_FRF2",nil,3000];

					//Hecate II
					(_ret select 1) pushBack ["R3F_PGM_Hecate_II",nil,300000];
					(_ret select 1) pushBack ["R3F_PGM_Hecate_II_DES",nil,300000];
					(_ret select 1) pushBack ["R3F_7Rnd_127x99_PGM",nil,4000];
					
					//RPG7 - Sol
					(_ret select 1) pushBack ["rhs_weap_rpg7",nil,600000];
					(_ret select 1) pushBack ["rhs_rpg7_PG7VL_mag",nil,20000];
					
					//RPG 26 - Sol
					(_ret select 1) pushBack ["rhs_weap_rpg26",nil,550000];
					(_ret select 1) pushBack ["rhs_rpg26_mag",nil,15000];
					
					//RPG2 - Sol
					(_ret select 1) pushBack ["rhs_weap_rshg2",nil,500000];
					(_ret select 1) pushBack ["rhs_rshg2_mag",nil,10000];
					
					//Stinger - Anti Air
					(_ret select 1) pushBack ["rhs_weap_fim92",nil,500000];
					(_ret select 1) pushBack ["rhs_fim92_mag",nil,10000];
					
					(_ret select 1) pushBack ["optic_MRCO",nil,10000];
					(_ret select 1) pushBack ["optic_Hamr",nil,10000];
					(_ret select 1) pushBack ["optic_LRPS",nil,100000];
					
					(_ret select 1) pushBack ["IEDUrbanSmall_Remote_Mag",nil,50000];
					(_ret select 1) pushBack ["IEDLandSmall_Remote_Mag",nil,50000];
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
			case (!l_c_gun): {"Désolé monsieur, vous n'avez pas le permis de port d'armes !"};
			default
			{
				_ret = 
				["Armurerie",
					[
						
						// rook 9mm
						["hgun_Rook40_F",nil,4900],
						["16Rnd_9x21_Mag",nil,350],
						
						//.45
						["hgun_ACPC2_F",nil,5300],
						["9Rnd_45ACP_Mag",nil,400],
						
						//benelli m4 
						// ["R3F_M4S90",nil,50000],
						// ["R3F_7Rnd_M4S90",nil,450],
						["acc_flashlight",nil,1000],
						
						// pompe court
						["rhs_weap_M590_5RD",nil,64000],
						["rhsusf_5Rnd_00Buck",nil,350],

						// pompe long
						["rhs_weap_M590_8RD",nil,67000],
						["rhsusf_8Rnd_00Buck",nil,550],
						
						//enfield
						["Trixie_Enfield",nil,70000],
						["Trixie_Enfield_Mag",nil,750],

						//CZ550
						["Trixie_CZ550_Rail",nil,120000],
						["Trixie_CZ550_Mag",nil,1000],
						
						// optic
						["optic_Aco",nil,3000],
						["optic_ACO_grn",nil,3000],
						["optic_Holosight",nil,3000],
						["R3F_AIMPOINT",nil,3000],
						["R3F_AIMPOINT_DES",nil,3000],
						["rhsusf_acc_compm4",nil,3000],
						["R3F_EOTECH",nil,3000],
						["R3F_EOTECH_DES",nil,3000],
						["rhsusf_acc_eotech_552",nil,3000],
						
						//equip
						["ACE_EarPlugs",nil,25],
						["ACE_Kestrel4500",nil,500],
						["ACE_SpareBarrel",nil,1000],
						["ACE_CableTie",nil,100],
						["ACE_NVG_Gen1",nil,2000]
					]
				];
				if(l_c_airsoft) then
				{
					(_ret select 1) pushBack ["hgun_Rook40_F_as",nil,2450];
					(_ret select 1) pushBack ["16Rnd_9x21_Mag_airsoft",nil,175];
					(_ret select 1) pushBack ["rhs_weap_makarov_pmm_as",nil,2450];
					(_ret select 1) pushBack ["mag_9x18_12_57N181S_airsoft",nil,175];
					(_ret select 1) pushBack ["hgun_ACPC2_F_as",nil,2650];
					(_ret select 1) pushBack ["9Rnd_45ACP_Mag_airsoft",nil,200];
					(_ret select 1) pushBack ["rhsusf_weap_m1911a1_as",nil,2650];
					(_ret select 1) pushBack ["mag_7x45acp_MHP_airsoft",nil,200];
					(_ret select 1) pushBack ["rhs_weap_m4_as",nil,50000];
					(_ret select 1) pushBack ["rhs_weap_m4a1_blockII_as",nil,50000];
					(_ret select 1) pushBack ["rhs_weap_m16a4_as",nil,50000];
					(_ret select 1) pushBack ["30Rnd_556x45_Stanag_airsoft",nil,500];
					(_ret select 1) pushBack ["rhs_weap_ak74m_as",nil,50000];
					(_ret select 1) pushBack ["30Rnd_545x39_AK_airsoft",nil,500];
					(_ret select 1) pushBack ["rhs_weap_akm_as",nil,70000];
					(_ret select 1) pushBack ["rhs_weap_akms_as",nil,70000];
					(_ret select 1) pushBack ["30Rnd_762x39mm_airsoft",nil,750];
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
						["optic_ACO_grn",nil,2500],
						["optic_Aco",nil,2500],
						["ACE_EarPlugs",nil,25],
						["ACE_Kestrel4500",nil,500],
						["ACE_SpareBarrel",nil,1000]
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
				["ToolKit",nil,3000],
				["Binocular",nil,150],
				["ItemGPS",nil,100],
				["tf_anprc148jem",nil,5000],
				["ItemMap",nil,100],
				["ItemCompass",nil,100],
				["ItemWatch","SmartWatch",100],
				["ACE_Altimeter","SmartWatch Altimètre",100],
				["ACE_MapTools",nil,500],
				["FirstAidKit",nil,1000],
				["Chemlight_red",nil,300],
				["Chemlight_yellow",nil,300],
				["Chemlight_green",nil,300],
				["Chemlight_blue",nil,300],
				["ACE_HandFlare_White",nil,1000],
				["ACE_HandFlare_Red",nil,1000],
				["ACE_HandFlare_Green",nil,1000],
				["ACE_HandFlare_Yellow",nil,1000]
			]
		];
	};
};
_ret;