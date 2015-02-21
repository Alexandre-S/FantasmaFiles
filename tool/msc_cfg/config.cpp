class DefaultEventhandlers;
class CfgPatches
{
	class msc_cfg
	{
		units[] = {""};
		weapons[] = {};
		author = "Youri";
		requiredVersion = 0.1;
		requiredAddons[] = {"A3_Characters_F"};
	};
};
class UniformSlotInfo
{
	slotType = 0;
	linkProxy = "-";
};

class CfgVehicleClasses
{
	class mscinf
	{
		displayName = "Men (MSC)";
	};
};

class CfgVehicles
{
	class Man;
	class CAManBase: Man
	{
		class AnimationSources;
		class HitPoints
		{
			class HitHead;
			class HitBody;
			class HitHands;
			class HitLegs;
		};
	};
	class SoldierWB: CAManBase
	{
		threat[] = {1,0.1,0.1};
	};
	class Msc_Base: SoldierWB
	{
		author = "Niko";
		_generalMacro = "Msc_Base";
		scope = 0;
		identityTypes[] = {"Language_EN_EP1","Head_NATO","G_NATO_default"};
		faceType = "Man_A3";
		side = 1;
		faction = "BLU_F";
		genericNames = "NATOMen";
		vehicleClass = "mscinf";
		portrait = "";
		picture = "";
		icon = "iconMan";
		accuracy = 3.9;
		sensitivity = 3;
		threat[] = {1,0.1,0.1};
		camouflage = 1.4;
		minFireTime = 10;
		cost = 40000;
		class Wounds
		{
			tex[] = {};
			mat[] = {"A3\Characters_F_Beta\INDEP\Data\ia_soldier_01_clothing.rvmat","A3\Characters_F_Beta\INDEP\Data\ia_soldier_01_clothing_injury.rvmat","A3\Characters_F_Beta\INDEP\Data\ia_soldier_01_clothing_injury.rvmat","A3\Characters_F\Heads\Data\hl_white_bald_muscular.rvmat","A3\Characters_F\Heads\Data\hl_white_bald_muscular_injury.rvmat","A3\Characters_F\Heads\Data\hl_white_bald_muscular_injury.rvmat","A3\Characters_F\Heads\Data\hl_black_bald_muscular.rvmat","A3\Characters_F\Heads\Data\hl_black_bald_muscular_injury.rvmat","A3\Characters_F\Heads\Data\hl_black_bald_muscular_injury.rvmat","A3\Characters_F\Heads\Data\hl_white_hairy_muscular.rvmat","A3\Characters_F\Heads\Data\hl_white_hairy_muscular_injury.rvmat","A3\Characters_F\Heads\Data\hl_white_hairy_muscular_injury.rvmat","A3\Characters_F\Heads\Data\hl_white_old.rvmat","A3\Characters_F\Heads\Data\hl_white_old_injury.rvmat","A3\Characters_F\Heads\Data\hl_white_old_injury.rvmat","A3\Characters_F\Heads\Data\hl_asian_bald_muscular.rvmat","A3\Characters_F\Heads\Data\hl_asian_bald_muscular_injury.rvmat","A3\Characters_F\Heads\Data\hl_asian_bald_muscular_injury.rvmat"};
		};
		hiddenSelections[] = {"Camo","insignia"};
		hiddenSelectionsTextures[] = {""};
		class UniformInfo
		{
			class SlotsInfo
			{
				class NVG: UniformSlotInfo
				{
					slotType = 602;
				};
				class Scuba: UniformSlotInfo
				{
					slotType = 604;
				};
				class Googles: UniformSlotInfo
				{
					slotType = 603;
				};
				class Headgear: UniformSlotInfo
				{
					slotType = 605;
				};
			};
		};
		model = "\A3\Characters_F_Beta\INDEP\ia_soldier_01.p3d";
		modelSides[] = {2,3};
		nakedUniform = "U_BasicBody";
		uniformClass = "U_I_CombatUniform";
		class HitPoints: HitPoints
		{
			class HitHead: HitHead
			{
				armor = 1;
			};
			class HitBody: HitBody
			{
				armor = 2;
			};
			class HitHands: HitHands
			{
				armor = 2;
			};
			class HitLegs: HitLegs
			{
				armor = 2;
			};
		};
		armor = 2;
		armorStructural = 5;
		class EventHandlers;
		weapons[] = {"arifle_MX_ACO_pointer_F","hgun_ACPC2_F","Throw","Put","Binocular"};
		respawnWeapons[] = {"arifle_MX_ACO_pointer_F","hgun_ACPC2_F","Throw","Put","Binocular"};
		Items[] = {"FirstAidKit"};
		RespawnItems[] = {"FirstAidKit"};
		magazines[] = {"30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","16Rnd_9x21_Mag","16Rnd_9x21_Mag","16Rnd_9x21_Mag","HandGrenade","HandGrenade","SmokeShell","SmokeShellGreen","Chemlight_green","Chemlight_green","9Rnd_45ACP_Mag","9Rnd_45ACP_Mag"};
		respawnMagazines[] = {"30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","16Rnd_9x21_Mag","16Rnd_9x21_Mag","16Rnd_9x21_Mag","HandGrenade","HandGrenade","SmokeShell","SmokeShellGreen","Chemlight_green","Chemlight_green","9Rnd_45ACP_Mag","9Rnd_45ACP_Mag"};
		linkedItems[] = {"V_PlateCarrier1_rgr","H_HelmetB_paint","NVGoggles","ItemMap","ItemCompass","ItemWatch","ItemRadio"};
		respawnLinkedItems[] = {"V_PlateCarrier1_rgr","H_HelmetB_paint","NVGoggles","ItemMap","ItemCompass","ItemWatch","ItemRadio"};
	};
	class Msc_R_Base: SoldierWB
	{
		author = "Niko";
		_generalMacro = "Msc_Base";
		scope = 0;
		identityTypes[] = {"Language_EN_EP1","Head_NATO","G_NATO_default"};
		faceType = "Man_A3";
		side = 1;
		faction = "BLU_F";
		genericNames = "NATOMen";
		vehicleClass = "mscinf";
		portrait = "";
		picture = "";
		icon = "iconMan";
		accuracy = 3.9;
		sensitivity = 3;
		threat[] = {1,0.1,0.1};
		camouflage = 1.4;
		minFireTime = 10;
		cost = 40000;
		class Wounds
		{
			tex[] = {};
			mat[] = {"A3\Characters_F_Beta\INDEP\Data\ia_soldier_01_clothing.rvmat","A3\Characters_F_Beta\INDEP\Data\ia_soldier_01_clothing_injury.rvmat","A3\Characters_F_Beta\INDEP\Data\ia_soldier_01_clothing_injury.rvmat","A3\Characters_F\Heads\Data\hl_white_bald_muscular.rvmat","A3\Characters_F\Heads\Data\hl_white_bald_muscular_injury.rvmat","A3\Characters_F\Heads\Data\hl_white_bald_muscular_injury.rvmat","A3\Characters_F\Heads\Data\hl_black_bald_muscular.rvmat","A3\Characters_F\Heads\Data\hl_black_bald_muscular_injury.rvmat","A3\Characters_F\Heads\Data\hl_black_bald_muscular_injury.rvmat","A3\Characters_F\Heads\Data\hl_white_hairy_muscular.rvmat","A3\Characters_F\Heads\Data\hl_white_hairy_muscular_injury.rvmat","A3\Characters_F\Heads\Data\hl_white_hairy_muscular_injury.rvmat","A3\Characters_F\Heads\Data\hl_white_old.rvmat","A3\Characters_F\Heads\Data\hl_white_old_injury.rvmat","A3\Characters_F\Heads\Data\hl_white_old_injury.rvmat","A3\Characters_F\Heads\Data\hl_asian_bald_muscular.rvmat","A3\Characters_F\Heads\Data\hl_asian_bald_muscular_injury.rvmat","A3\Characters_F\Heads\Data\hl_asian_bald_muscular_injury.rvmat"};
		};
		hiddenSelections[] = {"Camo","insignia"};
		hiddenSelectionsTextures[] = {""};
		class UniformInfo
		{
			class SlotsInfo
			{
				class NVG: UniformSlotInfo
				{
					slotType = 602;
				};
				class Scuba: UniformSlotInfo
				{
					slotType = 604;
				};
				class Googles: UniformSlotInfo
				{
					slotType = 603;
				};
				class Headgear: UniformSlotInfo
				{
					slotType = 605;
				};
			};
		};
		model = "\A3\Characters_F_Beta\INDEP\ia_soldier_02.p3d";
		modelSides[] = {2,3};
		nakedUniform = "U_BasicBody";
		uniformClass = "U_I_CombatUniform";
		class HitPoints: HitPoints
		{
			class HitHead: HitHead
			{
				armor = 1;
			};
			class HitBody: HitBody
			{
				armor = 2;
			};
			class HitHands: HitHands
			{
				armor = 2;
			};
			class HitLegs: HitLegs
			{
				armor = 2;
			};
		};
		armor = 2;
		armorStructural = 5;
		class EventHandlers;
		weapons[] = {"arifle_MX_ACO_pointer_F","hgun_ACPC2_F","Throw","Put","Binocular"};
		respawnWeapons[] = {"arifle_MX_ACO_pointer_F","hgun_ACPC2_F","Throw","Put","Binocular"};
		Items[] = {"FirstAidKit"};
		RespawnItems[] = {"FirstAidKit"};
		magazines[] = {"30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","16Rnd_9x21_Mag","16Rnd_9x21_Mag","16Rnd_9x21_Mag","HandGrenade","HandGrenade","SmokeShell","SmokeShellGreen","Chemlight_green","Chemlight_green","9Rnd_45ACP_Mag","9Rnd_45ACP_Mag"};
		respawnMagazines[] = {"30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_mag","16Rnd_9x21_Mag","16Rnd_9x21_Mag","16Rnd_9x21_Mag","HandGrenade","HandGrenade","SmokeShell","SmokeShellGreen","Chemlight_green","Chemlight_green","9Rnd_45ACP_Mag","9Rnd_45ACP_Mag"};
		linkedItems[] = {"V_PlateCarrier1_rgr","H_HelmetB_paint","NVGoggles","ItemMap","ItemCompass","ItemWatch","ItemRadio"};
		respawnLinkedItems[] = {"V_PlateCarrier1_rgr","H_HelmetB_paint","NVGoggles","ItemMap","ItemCompass","ItemWatch","ItemRadio"};
	};
	class msc_SnowMARPAT_soldier : Msc_Base
	{
		_generalMacro = "msc_SnowMARPAT_soldier";
		displayName = "Snow MARPAT";
		scope = 2;
		
		hiddenSelections[] = {"Camo","insignia"};
		hiddenSelectionsTextures[] = {"msc_cfg\uniforms\SnowMARPAT.paa"};
		
		model = "\A3\Characters_F_Beta\INDEP\ia_soldier_01.p3d";
		uniformClass = "msc_SnowMARPAT";
	};
	class msc_R_SnowMARPAT_soldier : Msc_R_Base
	{
		_generalMacro = "msc_R_SnowMARPAT_soldier";
		displayName = "Snow MARPAT (R)";
		scope = 2;
		
		hiddenSelections[] = {"Camo","insignia"};
		hiddenSelectionsTextures[] = {"msc_cfg\uniforms\SnowMARPAT.paa"};
		
		model = "\A3\Characters_F_Beta\INDEP\ia_soldier_02.p3d";
		uniformClass = "msc_R_SnowMARPAT";
	};
	class msc_Yeti_soldier : Msc_Base
	{
		_generalMacro = "msc_Yeti_soldier";
		displayName = "Yeti";
		scope = 2;
		
		hiddenSelections[] = {"Camo","insignia"};
		hiddenSelectionsTextures[] = {"msc_cfg\uniforms\Yeti.paa"};
		
		model = "\A3\Characters_F_Beta\INDEP\ia_soldier_01.p3d";
		uniformClass = "msc_Yeti";
	};
	class msc_R_Yeti_soldier : Msc_R_Base
	{
		_generalMacro = "msc_R_Yeti_soldier";
		displayName = "Yeti (R)";
		scope = 2;
		
		hiddenSelections[] = {"Camo","insignia"};
		hiddenSelectionsTextures[] = {"msc_cfg\uniforms\Yeti.paa"};
		
		model = "\A3\Characters_F_Beta\INDEP\ia_soldier_02.p3d";
		uniformClass = "msc_R_Yeti";
	};
	class msc_McamAlpine_soldier : Msc_Base
	{
		_generalMacro = "msc_McamAlpine_soldier";
		displayName = "McamAlpine";
		scope = 2;
		
		hiddenSelections[] = {"Camo","insignia"};
		hiddenSelectionsTextures[] = {"msc_cfg\uniforms\McamAlpine.paa"};
		
		model = "\A3\Characters_F_Beta\INDEP\ia_soldier_01.p3d";
		uniformClass = "msc_McamAlpine";
	};
	class msc_R_McamAlpine_soldier : Msc_R_Base
	{
		_generalMacro = "msc_R_McamAlpine_soldier";
		displayName = "McamAlpine (R)";
		scope = 2;
		
		hiddenSelections[] = {"Camo","insignia"};
		hiddenSelectionsTextures[] = {"msc_cfg\uniforms\McamAlpine.paa"};
		
		model = "\A3\Characters_F_Beta\INDEP\ia_soldier_02.p3d";
		uniformClass = "msc_R_McamAlpine";
	};
};

class cfgWeapons
{
	class InventoryItem_Base_F;
	class ItemCore;
	class ItemInfo;
	class HeadgearItem;
	class Vest_Camo_Base; 
    class VestItem;
	class UniformItem;
	class Uniform_Base;
	class msc_SnowMARPAT: Uniform_Base
	{
		scope = 2;
 		author = "Niko";
		displayName = "MSC MARPAT Snow";
		picture = "\msc_cfg\uniforms\ui\snowmarpat.paa";
		model = "\A3\Characters_F\Common\Suitpacks\suitpack_universal_F.p3d";
		class ItemInfo: UniformItem
		{
			uniformModel = "-";
			uniformClass = "msc_SnowMARPAT_soldier";
			containerClass = "Supply40";
			mass = 40;
		};
	};
	class msc_R_SnowMARPAT: Uniform_Base
	{
		scope = 2;
 		author = "Niko";
		displayName = "MSC (R) MARPAT Snow";
		picture = "\msc_cfg\uniforms\ui\snowmarpat.paa";
		model = "\A3\Characters_F\Common\Suitpacks\suitpack_universal_F.p3d";
		class ItemInfo: UniformItem
		{
			uniformModel = "-";
			uniformClass = "msc_R_SnowMARPAT_soldier";
			containerClass = "Supply40";
			mass = 40;
		};
	};
	class msc_Yeti: Uniform_Base
	{
		scope = 2;
 		author = "Niko";
		displayName = "MSC Kryptek Yeti";
		picture = "\msc_cfg\uniforms\ui\Yeti.paa";
		model = "\A3\Characters_F\Common\Suitpacks\suitpack_universal_F.p3d";
		class ItemInfo: UniformItem
		{
			uniformModel = "-";
			uniformClass = "msc_Yeti_soldier";
			containerClass = "Supply40";
			mass = 40;
		};
	};
	class msc_R_Yeti: Uniform_Base
	{
		scope = 2;
 		author = "Niko";
		displayName = "MSC (R) Kryptek Yeti";
		picture = "\msc_cfg\uniforms\ui\Yeti.paa";
		model = "\A3\Characters_F\Common\Suitpacks\suitpack_universal_F.p3d";
		class ItemInfo: UniformItem
		{
			uniformModel = "-";
			uniformClass = "msc_R_Yeti_soldier";
			containerClass = "Supply40";
			mass = 40;
		};
	};
	class msc_McamAlpine: Uniform_Base
	{
		scope = 2;
 		author = "Niko";
		displayName = "MSC Multicam Alpine";
		picture = "\msc_cfg\uniforms\ui\McamAlpine.paa";
		model = "\A3\Characters_F\Common\Suitpacks\suitpack_universal_F.p3d";
		class ItemInfo: UniformItem
		{
			uniformModel = "-";
			uniformClass = "msc_McamAlpine_soldier";
			containerClass = "Supply40";
			mass = 40;
		};
	};
	class msc_R_McamAlpine: Uniform_Base
	{
		scope = 2;
 		author = "Niko";
		displayName = "MSC (R) Multicam Alpine";
		picture = "\msc_cfg\uniforms\ui\McamAlpine.paa";
		model = "\A3\Characters_F\Common\Suitpacks\suitpack_universal_F.p3d";
		class ItemInfo: UniformItem
		{
			uniformModel = "-";
			uniformClass = "msc_R_McamAlpine_soldier";
			containerClass = "Supply40";
			mass = 40;
		};
	};
};