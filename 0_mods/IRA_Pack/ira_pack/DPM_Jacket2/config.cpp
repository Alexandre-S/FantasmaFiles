#define ReadAndWrite		0
#define ReadAndCreate		1
#define ReadOnly		2
#define ReadOnlyVerified		3

#define true	1
#define false	0

#define VSoft		0
#define VArmor		1
#define VAir		2

#define TEast		0
#define TWest		1
#define TGuerrila		2
#define TCivilian		3
#define TSideUnknown		4
#define TEnemy		5
#define TFriendly		6
#define TLogic		7

#define private		0
#define protected		1
#define public		2 




class CfgPatches
{
	class Bravo93_IRA_Soldier4
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {"A3_Data_F","A3_Weapons_F","A3_Characters_F","A3_Characters_F_BLUFOR"};
     };
};


class CfgFactionClasses {
	class IRA {
		displayName = "IRA";
		priority = 100;
		side = TEast;
                icon = "\IRA_Pack\Icon\Icon.jpg";

     };
};


class CfgVehicleClasses
{
	class IRA_men
	{
		displayName = "Men";
	};
};

class CfgVehicles
{
	
        class B_Soldier_base_F;
       


      
        class IRA_Soldier_Outfit_4: B_Soldier_base_F
	{
                
		scope = 2;
		side = 0;
		displayName = "IRA Fighter (RPG)";
		faction = "IRA";
		vehicleClass = "IRA_men";
		identityTypes[] = {"Head_White","LanguageENG_F"};
		canCarryBackPack=1;
		canDeactivateMines=1;
		engineer=1; 
		attendant = "true";
		author = "Bravo93";
		uniformAccessories[] = {};
		uniformClass = "IRA_Soldier_Outfit_4";
		nakedUniform = "U_BasicBody";
		model = "\A3\Characters_F_Beta\INDEP\ia_officer.p3d";
		Items[] = {};
		// weapons[] = {"arifle_mas_g3","mas_launch_RPG7_F","Throw","Put"};
		// respawnWeapons[] = {"arifle_mas_g3","mas_launch_RPG7_F","Throw","Put"};
		// magazines[] = {"mas_PG7V","20Rnd_mas_762x51_Stanag","20Rnd_mas_762x51_Stanag","20Rnd_mas_762x51_Stanag"};
		// respawnMagazines[] = {"mas_PG7V","20Rnd_mas_762x51_Stanag","20Rnd_mas_762x51_Stanag","20Rnd_mas_762x51_Stanag"};
		// linkedItems[] = {"ItemMap","ItemWatch","ItemRadio","ItemGPS","G_Balaclava_oli","H_Beret_blk"};
		// respawnLinkedItems[] = {"ItemMap","ItemCompass","ItemWatch","ItemRadio","ItemGPS","G_Balaclava_oli","H_Beret_blk"};
		
		weapons[] = {};
		respawnWeapons[] = {};
		magazines[] = {};
		respawnMagazines[] = {};
        linkedItems[] = {};
		respawnLinkedItems[] = {};
		
		hiddenSelectionsTextures[] = {"\IRA_Pack\DPM_Jacket\Uniform4.paa","\IRA_Pack\DPM_Jacket\Uniform3.paa"};  
		hiddenSelections[] = {"Camo1","Camo2"};
		class Wounds
		{
			tex[] = {};
			mat[] = {"A3\Characters_F_Beta\INDEP\Data\officer.rvmat","A3\Characters_F_Beta\INDEP\Data\officer_injury.rvmat","A3\Characters_F_Beta\INDEP\Data\ia_soldier_01_clothing_injury.rvmat","A3\Characters_F\Heads\Data\hl_white_bald_muscular.rvmat","A3\Characters_F\Heads\Data\hl_white_bald_muscular_injury.rvmat","A3\Characters_F\Heads\Data\hl_white_bald_muscular_injury.rvmat","A3\Characters_F\Heads\Data\hl_black_bald_muscular.rvmat","A3\Characters_F\Heads\Data\hl_black_bald_muscular_injury.rvmat","A3\Characters_F\Heads\Data\hl_black_bald_muscular_injury.rvmat","A3\Characters_F\Heads\Data\hl_white_hairy_muscular.rvmat","A3\Characters_F\Heads\Data\hl_white_hairy_muscular_injury.rvmat","A3\Characters_F\Heads\Data\hl_white_hairy_muscular_injury.rvmat","A3\Characters_F\Heads\Data\hl_white_old.rvmat","A3\Characters_F\Heads\Data\hl_white_old_injury.rvmat","A3\Characters_F\Heads\Data\hl_white_old_injury.rvmat","A3\Characters_F\Heads\Data\hl_asian_bald_muscular.rvmat","A3\Characters_F\Heads\Data\hl_asian_bald_muscular_injury.rvmat","A3\Characters_F\Heads\Data\hl_asian_bald_muscular_injury.rvmat"};
		


};
};
};
        

class cfgWeapons
{
	class Uniform_Base;
	class UniformItem;
	class InventoryItem_Base_F;
	class ItemCore;
	class HeadGearItem;
	class V_PlateCarrier1_rgr;
	class VestItem;


		
		
	class IRA_Soldier_Outfit_4: Uniform_Base
	{
		scope=public;
		model = "\A3\Characters_F\Common\Suitpacks\suitpack_blufor_diver";
		displayName = "DPM Combat Jacket";
		picture = "\IRA_Pack\ui\DPMJacket.jpg";
		
		class ItemInfo: UniformItem
		{
			uniformModel = "-";
			uniformClass = "IRA_Soldier_Outfit_4";
			containerClass="Supply60";
			mass=80;






			};
		};
	};
};
//};