class CfgPatches
{
	class Bravo93_Balaclava
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {};
	};
};

class CfgGlasses
{
	class None;



	class IRA_Balaclava_Brown: None
	{
		scope = 2;
		displayname = "Balaclava (Brown)";
		model = "\A3\characters_f_bootcamp\Guerrilla\g_balaclava_clean.p3d";
		hiddenSelectionsTextures[] = {"\IRA_Pack\Balaclava\Brown_balaclava.paa"};
		hiddenSelections[] = {"Camo"};
		picture = "\IRA_Pack\UI\BrownBalaclava.paa";
                identityTypes[] = {"NoGlasses",1000};
                
                
          

		
	
	};
};