#define ReadAndWrite		0
#define ReadAndCreate		1
#define ReadOnly		2
#define ReadOnlyVerified		3

#define true	1
#define false	0

#define VSoft		0
#define VArmor		1
#define VAir		2

#define TEast		1
#define TWest		0
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
	class Bravo93_UVF_Soldier2
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {"A3_Data_F","A3_Weapons_F","A3_Characters_F","A3_Characters_F_BLUFOR"};
     };
};


class CfgFactionClasses {
	class UVF {
		displayName = "UVF";
		priority = 100;
		side = 1;
                icon = "\UVF_Pack\Icon\Icon.jpg";

     };
};


class CfgVehicleClasses
{
	class UVF_men
	{
		displayName = "Men";
	};
};

class CfgVehicles
{
	
        class B_Soldier_base_F;
       


      
        class UVF_Soldier_Outfit_2: B_Soldier_base_F
	{
                
		scope = 2;
		side = 2;
		displayName = "UVF Soldier (M16)";
                faction = "UVF";
		identityTypes[] = {"Head_White","LanguageENG_F"};
		vehicleClass = "UVF_men";
                canCarryBackPack=1;
		canDeactivateMines=1;
		engineer=1; 
                attendant = "true";
		author = "Bravo93";
		uniformAccessories[] = {};
                uniformClass = "UVF_Soldier_Outfit_2";
		nakedUniform = "U_BasicBody";
		model = "\A3\Characters_F\OPFOR\o_officer.p3d";
		Items[] = {};
		// weapons[] = {"arifle_mas_m16","Throw","Put"};
		// respawnWeapons[] = {"arifle_mas_m16","Throw","Put"};
		// magazines[] = {"30Rnd_mas_556x45_Stanag","30Rnd_mas_556x45_Stanag","30Rnd_mas_556x45_Stanag"};
		// respawnMagazines[] = {"30Rnd_mas_556x45_Stanag","30Rnd_mas_556x45_Stanag","30Rnd_mas_556x45_Stanag"};
		// linkedItems[] = {"ItemMap","ItemWatch","ItemRadio","ItemGPS","G_Balaclava_blk"};
		// respawnLinkedItems[] = {"ItemMap","ItemCompass","ItemWatch","ItemRadio","ItemGPS","G_Balaclava_blk"};
		
		weapons[] = {};
		respawnWeapons[] = {};
		magazines[] = {};
		respawnMagazines[] = {};
        linkedItems[] = {};
		respawnLinkedItems[] = {};
		
		hiddenSelectionsTextures[] = {"\UVF_Pack\Black_Jacket\Uniform1.paa"};  
		hiddenSelections[] = {"Camo"};
		class Wounds
		{
			tex[] = {};
			mat[] = {"A3\Characters_F_Beta\INDEP\Data\officer.rvmat","A3\Characters_F_Beta\INDEP\Data\officer_injury.rvmat","A3\Characters_F\Heads\Data\hl_white_bald_muscular.rvmat","A3\Characters_F\Heads\Data\hl_white_bald_muscular_injury.rvmat","A3\Characters_F\Heads\Data\hl_white_bald_muscular_injury.rvmat","A3\Characters_F\Heads\Data\hl_black_bald_muscular.rvmat","A3\Characters_F\Heads\Data\hl_black_bald_muscular_injury.rvmat","A3\Characters_F\Heads\Data\hl_black_bald_muscular_injury.rvmat","A3\Characters_F\Heads\Data\hl_white_hairy_muscular.rvmat","A3\Characters_F\Heads\Data\hl_white_hairy_muscular_injury.rvmat","A3\Characters_F\Heads\Data\hl_white_hairy_muscular_injury.rvmat","A3\Characters_F\Heads\Data\hl_white_old.rvmat","A3\Characters_F\Heads\Data\hl_white_old_injury.rvmat","A3\Characters_F\Heads\Data\hl_white_old_injury.rvmat","A3\Characters_F\Heads\Data\hl_asian_bald_muscular.rvmat","A3\Characters_F\Heads\Data\hl_asian_bald_muscular_injury.rvmat","A3\Characters_F\Heads\Data\hl_asian_bald_muscular_injury.rvmat"};
		


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


		
		
	class UVF_Soldier_Outfit_2: Uniform_Base
	{
		scope=public;
                model = "\A3\Characters_F\Common\Suitpacks\suitpack_blufor_diver";
		displayName = "Black Jacket";
		picture = "\UVF_Pack\UI\Jacket1.jpg";
		
		class ItemInfo: UniformItem
		{
			uniformModel = "-";
			uniformClass = "UVF_Soldier_Outfit_2";
			containerClass="Supply60";
			mass=80;






			};
		};
	};
};
//};