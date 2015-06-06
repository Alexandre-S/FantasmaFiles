class CfgPatches 
{
	class kio_kio_fhat 
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {"A3_Weapons_F"};
	};
};
 
class cfgWeapons 
{
	class ItemCore; 
	class InventoryItem_Base_F;
	class HeadgearItem;
 
	class kio_fhat : ItemCore 
	{
		scope = 2;
		weaponPoolAvailable = 1;
		displayName = "French Police Hat";
		picture = "\kio_fhat\UI\gear_x_kio_fhat_ca.paa";
		UiPicture = "";
		model = "\kio_fhat\fhat.p3d";
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\kio_fhat\data\FH_co.paa"}; 

		class ItemInfo : HeadgearItem 
		{
			mass = 2;
			uniformModel = "\kio_fhat\fhat.p3d";
			modelSides[] = {3, 1};
			armor = 0;
			passThrough = 1;
			hiddenSelections[] = {"camo"};
		};
	};
	class kio_fhat_g : kio_fhat 
	{		
		hiddenSelections[] = {"camo"};
		hiddenSelectionsTextures[] = {"\kio_fhat\data\FH_g_co.paa"}; 
	};
};