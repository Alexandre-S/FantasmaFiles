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
	class Bravo93_UVF_Soldier4
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
		side = TEast;
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
       



      
        class UVF_Soldier_Outfit_4: B_Soldier_base_F
	{
                
		scope = 2;
		side = 2;
		displayName = "UVF Soldier (AK74M)";
                faction = "UVF";
		identityTypes[] = {"Head_White","LanguageENG_F"};
		vehicleClass = "UVF_men";
                canCarryBackPack=1;
		canDeactivateMines=1;
		engineer=1; 
                attendant = "true";
		author = "Bravo93";
		uniformAccessories[] = {};
                uniformClass = "UVF_Soldier_Outfit_4";
		nakedUniform = "U_BasicBody";
		model = "\A3\Characters_F\Civil\c_poloshirtpants.p3d";
		Items[] = {};
		// weapons[] = {"arifle_mas_ak_74m","Throw","Put"};
		// respawnWeapons[] = {"arifle_mas_ak_74m","Throw","Put"};
		// magazines[] = {"30Rnd_mas_545x39_mag","30Rnd_mas_545x39_mag","30Rnd_mas_545x39_mag"};
		// respawnMagazines[] = {"30Rnd_mas_545x39_mag","30Rnd_mas_545x39_mag","30Rnd_mas_545x39_mag"};
		// linkedItems[] = {"ItemMap","ItemWatch","ItemRadio","ItemGPS","G_Balaclava_blk"};
		// respawnLinkedItems[] = {"ItemMap","ItemCompass","ItemWatch","ItemRadio","ItemGPS","G_Balaclava_blk"};
		
		weapons[] = {};
		respawnWeapons[] = {};
		magazines[] = {};
		respawnMagazines[] = {};
        linkedItems[] = {};
		respawnLinkedItems[] = {};
		
		hiddenSelectionsTextures[] = {"\UVF_Pack\TShirt\Uniform1.paa"};  
		hiddenSelections[] = {"Camo"};
		class Wounds
		{
			tex[] = {};
			mat[] = {"A3\Characters_F\Civil\Data\c_poloshirt.rvmat","A3\Characters_F\Civil\Data\c_poloshirt_injury.rvmat","A3\Characters_F\Heads\Data\hl_white_bald_muscular.rvmat","A3\Characters_F\Heads\Data\hl_white_bald_muscular_injury.rvmat","A3\Characters_F\Heads\Data\hl_white_bald_muscular_injury.rvmat","A3\Characters_F\Heads\Data\hl_black_bald_muscular.rvmat","A3\Characters_F\Heads\Data\hl_black_bald_muscular_injury.rvmat","A3\Characters_F\Heads\Data\hl_black_bald_muscular_injury.rvmat","A3\Characters_F\Heads\Data\hl_white_hairy_muscular.rvmat","A3\Characters_F\Heads\Data\hl_white_hairy_muscular_injury.rvmat","A3\Characters_F\Heads\Data\hl_white_hairy_muscular_injury.rvmat","A3\Characters_F\Heads\Data\hl_white_old.rvmat","A3\Characters_F\Heads\Data\hl_white_old_injury.rvmat","A3\Characters_F\Heads\Data\hl_white_old_injury.rvmat","A3\Characters_F\Heads\Data\hl_asian_bald_muscular.rvmat","A3\Characters_F\Heads\Data\hl_asian_bald_muscular_injury.rvmat","A3\Characters_F\Heads\Data\hl_asian_bald_muscular_injury.rvmat"};
		


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


		
		
	class UVF_Soldier_Outfit_4: Uniform_Base
	{
		scope=public;
                model = "\A3\Characters_F\Common\Suitpacks\suitpack_blufor_diver";
		displayName = "UVF T-Shirt (Black)";
		picture = "\UVF_Pack\UI\TShirt.jpg";
		
		class ItemInfo: UniformItem
		{
			uniformModel = "-";
			uniformClass = "UVF_Soldier_Outfit_4";
			containerClass="Supply60";
			mass=80;






			};
		};
	};
};
//};