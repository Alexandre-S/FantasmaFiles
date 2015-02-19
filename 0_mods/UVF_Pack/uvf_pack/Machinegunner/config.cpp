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
	class Bravo93_UVF_Soldier3
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
       



      
        class UVF_Soldier_Outfit_3: B_Soldier_base_F
	{
                
		scope = 2;
		side = 2;
		displayName = "UVF Soldier (FN MAG)";
                faction = "UVF";
		identityTypes[] = {"Head_White","LanguageENG_F"};
		vehicleClass = "UVF_men";
                canCarryBackPack=1;
		canDeactivateMines=1;
		engineer=1; 
                attendant = "true";
		author = "Bravo93";
		uniformAccessories[] = {};
                uniformClass = "UVF_Soldier_Outfit_3";
		nakedUniform = "U_BasicBody";
		model = "\A3\Characters_F_bootcamp\Guerrilla\ig_guerrilla_6_1.p3d";
		Items[] = {};
		// weapons[] = {"LMG_mas_M240_F","Throw","Put"};
		// respawnWeapons[] = {"LMG_mas_M240_F","Throw","Put"};
		// magazines[] = {"100Rnd_mas_762x51_Stanag","100Rnd_mas_762x51_Stanag","100Rnd_mas_762x51_Stanag"};
		// respawnMagazines[] = {"100Rnd_mas_762x51_Stanag","100Rnd_mas_762x51_Stanag","100Rnd_mas_762x51_Stanag"};
		// linkedItems[] = {"ItemMap","ItemWatch","ItemRadio","ItemGPS","G_Balaclava_blk"};
		// respawnLinkedItems[] = {"ItemMap","ItemCompass","ItemWatch","ItemRadio","ItemGPS","G_Balaclava_blk"};
		weapons[] = {};
		respawnWeapons[] = {};
		magazines[] = {};
		respawnMagazines[] = {};
        linkedItems[] = {};
		respawnLinkedItems[] = {};
		
		hiddenSelectionsTextures[] = {"\UVF_Pack\Wool_Uniforms\Uniform2.paa"};  
		hiddenSelections[] = {"Camo"};
		class Wounds
		{
			tex[] = {};
			mat[] = {"A3\Characters_F_Beta\INDEP\Data\ia_soldier_01_clothing.rvmat","A3\Characters_F_Beta\INDEP\Data\ia_soldier_01_clothing_injury.rvmat","A3\Characters_F_Beta\INDEP\Data\ia_soldier_01_clothing_injury.rvmat","A3\Characters_F\Heads\Data\hl_white_bald_muscular.rvmat","A3\Characters_F\Heads\Data\hl_white_bald_muscular_injury.rvmat","A3\Characters_F\Heads\Data\hl_white_bald_muscular_injury.rvmat","A3\Characters_F\Heads\Data\hl_black_bald_muscular.rvmat","A3\Characters_F\Heads\Data\hl_black_bald_muscular_injury.rvmat","A3\Characters_F\Heads\Data\hl_black_bald_muscular_injury.rvmat","A3\Characters_F\Heads\Data\hl_white_hairy_muscular.rvmat","A3\Characters_F\Heads\Data\hl_white_hairy_muscular_injury.rvmat","A3\Characters_F\Heads\Data\hl_white_hairy_muscular_injury.rvmat","A3\Characters_F\Heads\Data\hl_white_old.rvmat","A3\Characters_F\Heads\Data\hl_white_old_injury.rvmat","A3\Characters_F\Heads\Data\hl_white_old_injury.rvmat","A3\Characters_F\Heads\Data\hl_asian_bald_muscular.rvmat","A3\Characters_F\Heads\Data\hl_asian_bald_muscular_injury.rvmat","A3\Characters_F\Heads\Data\hl_asian_bald_muscular_injury.rvmat"};
		


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


		
		
	class UVF_Soldier_Outfit_3: Uniform_Base
	{
		scope=public;
                model = "\A3\Characters_F\Common\Suitpacks\suitpack_blufor_diver";
		displayName = "Woolly Pully (Black)";
		picture = "\UVF_Pack\UI\Jumper3.jpg";
		
		class ItemInfo: UniformItem
		{
			uniformModel = "-";
			uniformClass = "UVF_Soldier_Outfit_3";
			containerClass="Supply60";
			mass=80;






			};
		};
	};
};
//};