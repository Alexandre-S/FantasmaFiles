////////////////////////////////////////////////////////////////////
//DeRap: Produced from mikero's Dos Tools Dll version 4.52
//Wed Jul 09 19:57:59 2014 : Source 'file' date Wed Jul 09 19:57:59 2014
//http://dev-heaven.net/projects/list_files/mikero-pbodll
////////////////////////////////////////////////////////////////////

#define _ARMA_

//Class C:/Users/sil/Documents/GitHub/@altisrpfr/addons/_new/ddopp_taserpack/config.bin{
class CfgPatches
{
	class DDOPP_taserPack
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.2;
		requiredAddons[] = {"A3_Weapons_F"};
	};
};
class Mode_SemiAuto;
class Mode_FullAuto;
class GrenadeLauncher;
class CfgAmmo
{
	class BulletBase;
	class DDOPP_B_Taser: BulletBase
	{
		hit = 5.5;
		caliber = 0.3;
		class HitEffects
		{
			Hit_Blood = "ImpactBlood";
		};
	};
};
class CfgMagazines
{
	class CA_Magazine;
	class DDOPP_Nothing: CA_Magazine
	{
		scope = 1;
		value = 0;
		displayName = "";
		model = "\A3\weapons_F\Pistols\P07\p07_F.p3d";
		picture = "";
		modelSpecial = "";
		useAction = 0;
		useActionTitle = "";
		reloadAction = "ManActReloadMagazine";
		ammo = "";
		count = 0;
		initSpeed = 900;
		selectionFireAnim = "zasleh";
		nameSound = "magazine";
	};
	class DDOPP_1Rnd_X26: CA_Magazine
	{
		scope = 2;
		model = "DDOPP_taserPack\taser_x26\DDOPP_x26_mag";
		picture = "\DDOPP_taserPack\taser_x26\m_x26.paa";
		type = 16;
		ammo = "DDOPP_B_Taser";
		selectionFireAnim = "zasleh";
		count = 6;
		displayName = "X26 Cartridge";
		descriptionShort = "Contient 6 recharges";
	};
	class DDOPP_3Rnd_X3: DDOPP_1Rnd_X26
	{
		model = "DDOPP_taserPack\taser_x3\DDOPP_x3_mag";
		picture = "\DDOPP_taserPack\taser_x3\m_x3.paa";
		ammo = "DDOPP_B_Taser";
		count = 3;
		displayName = "X3 Cartridges";
		descriptionShort = "X3 Set of 3 Taser Stun Cartridges. Holds 3 rounds. Use in the X3 Taser.";
	};
};
class CfgWeapons
{
	class Pistol;
	class Drive_Stun: GrenadeLauncher
	{
		cursor = "";
		cursorAim = "";
		displayName = "Drive-Stun Mode";
		selectionFireAnim = "crackle";
		reloadTime = 3;
		sound[] = {"\DDOPP_taserPack\Taser_Hit.wav",0.001,1,400};
		magazines[] = {"DDOPP_Nothing"};
		recoil = "recoil_empty";
		optics = 0;
		muzzlePos = "usti hlavne";
		muzzleEnd = "konec hlavne";
		UiPicture = "\CA\weapons\data\Ico\i_regular_CA.paa";
	};
	class DDOPP_X26: Pistol
	{
		scope = 2;
		modelOptics = "-";
		model = "DDOPP_taserPack\taser_x26\DDOPP_x26";
		displayName = "X26 Taser (Yellow)";
		picture = "\DDOPP_taserPack\taser_x26\w_x26";
		UiPicture = "\DDOPP_taserPack\taser_x26\w_x26";
		bullet1[] = {"A3\sounds_f\weapons\shells\9mm\metal_9mm_01",0.501187,1,15};
		bullet2[] = {"A3\sounds_f\weapons\shells\9mm\metal_9mm_02",0.501187,1,15};
		bullet3[] = {"A3\sounds_f\weapons\shells\9mm\metal_9mm_03",0.501187,1,15};
		bullet4[] = {"A3\sounds_f\weapons\shells\9mm\metal_9mm_04",0.501187,1,15};
		bullet5[] = {"A3\sounds_f\weapons\shells\9mm\dirt_9mm_01",0.398107,1,15};
		bullet6[] = {"A3\sounds_f\weapons\shells\9mm\dirt_9mm_02",0.398107,1,15};
		bullet7[] = {"A3\sounds_f\weapons\shells\9mm\dirt_9mm_03",0.398107,1,15};
		bullet8[] = {"A3\sounds_f\weapons\shells\9mm\dirt_9mm_04",0.398107,1,15};
		bullet9[] = {"A3\sounds_f\weapons\shells\9mm\grass_9mm_01",0.223872,1,15};
		bullet10[] = {"A3\sounds_f\weapons\shells\9mm\grass_9mm_02",0.223872,1,15};
		bullet11[] = {"A3\sounds_f\weapons\shells\9mm\grass_9mm_03",0.223872,1,15};
		bullet12[] = {"A3\sounds_f\weapons\shells\9mm\grass_9mm_04",0.223872,1,15};
		class Library
		{
			libTextDesc = "X26 Taser. Can keep human targets stunned up to 20 seconds.";
		};
		descriptionShort = "X26 Taser. Can keep human targets stunned up to 20 seconds.";
		discreteDistance[] = {10};
		discreteDistanceInitIndex = 0;
		dispersion = 0.02;
		recoil = "recoil_single_pistol_2outof3";
		recoilProne = "recoil_single_pistol_prone_2outof3";
		minRange = 0;
		minRangeProbab = 0.1;
		midRange = 10;
		midRangeProbab = 0.3;
		maxRange = 20;
		maxRangeProbab = 0.04;
		aiRateOfFire = 0.5;
		aiRateOfFireDistance = 50;
		ffCount = 1;
		reloadTime = 3;
		autoReload = 0;
		magazineReloadTime = 5;
		magazines[] = {"DDOPP_1Rnd_X26"};
		// class Drive_Stun_Mode: Drive_Stun{};
		// muzzles[] = {"this","Drive_Stun_Mode"};
		optics = 0;
		cursor = "";
		cursoraim = "DDOPP_taserPack\data\taser_cursor.paa";
		cursorSize = 1;
		class FlashLight
		{
			ambient[] = {0.1,0.1,0.1,1};
			angle = 30;
			brightness = 0.1;
			color[] = {0.9,0.9,0.7,0.9};
			direction = "flash_pos";
			position = "flash_dir";
			scale[] = {1,1,0.5};
		};
		begin1[] = {"\DDOPP_taserPack\Taser_Shot.wav",0.2,1,700};
		// begin1[] = {"\DDOPP_taserPack\Taser_Hit.wav",0.2,1,400};
		soundBegin[] = {"begin1",0.333};
		drySound[] = {"A3\sounds_f\weapons\other\dry1",0.398107,1,20};
		reloadMagazineSound[] = {"A3\sounds_f\weapons\pistols\p07_reload",0.562341,1,30};
		class EventHandlers
		{
			// Init = "[] execVM ""\DDOPP_taserPack\scripts\Init_Taser.sqf""";
		};
	};
	class DDOPP_X26_b: DDOPP_X26
	{
		model = "DDOPP_taserPack\taser_x26\DDOPP_x26_b";
		displayName = "X26 Taser (Black)";
		picture = "\DDOPP_taserPack\taser_x26\w_x_b";
		UiPicture = "\DDOPP_taserPack\taser_x26\w_x_b";
	};
	class DDOPP_X3: DDOPP_X26
	{
		model = "DDOPP_taserPack\taser_x3\DDOPP_x3";
		displayName = "X3 Taser (Yellow)";
		picture = "\DDOPP_taserPack\taser_x3\w_x3";
		UiPicture = "\DDOPP_taserPack\taser_x3\w_x3";
		class Library
		{
			libTextDesc = "X3 Taser. Can keep human targets stunned up to 20 seconds. Can carry up to 3 cartridges.";
		};
		descriptionShort = "X3 Taser. Can keep human targets stunned up to 20 seconds. Can carry up to 3 cartridges.";
		reloadTime = 0.1;
		autoReload = 0;
		magazineReloadTime = 5;
		magazines[] = {"DDOPP_3Rnd_X3"};
		class FlashLight
		{
			ambient[] = {0.1,0.1,0.1,1};
			angle = 30;
			brightness = 0.1;
			color[] = {0.9,0.9,0.7,0.9};
			direction = "flash_pos";
			position = "flash_dir";
			scale[] = {1,1,0.5};
		};
	};
	class DDOPP_X3_b: DDOPP_X3
	{
		model = "DDOPP_taserPack\taser_x3\DDOPP_x3_b";
		displayName = "X3 Taser (Black)";
		picture = "\DDOPP_taserPack\taser_x3\w_x_b";
		UiPicture = "\DDOPP_taserPack\taser_x3\w_x_b";
	};
};
class CfgVehicleClasses
{
	class DDOPP_TaserLogic
	{
		displayName = "D.Doppler: Taser Mod";
	};
};
class CfgVehicles
{
	class Logic;
	class All;
	class Strategic;
	class Land;
	class DDOPP_TaserInit: Logic
	{
		vehicleClass = "DDOPP_TaserLogic";
		displayName = "Initialize Taser Scripts";
		model = "\ca\weapons\empty";
		Icon = "\DDOPP_taserPack\data\icon_init.paa";
		class EventHandlers
		{
			// init = "[] execVM""\DDOPP_taserPack\scripts\init_taser.sqf"";";
		};
	};
};
class CfgSounds
{
	class taser_hit
	{
		sound[] = {"\DDOPP_taserPack\Taser_Hit.wav",0.1,1};
		name = "taser_hit";
		titles[] = {};
	};
	class taser_spark
	{
		sound[] = {"\DDOPP_taserPack\Taser_Spark.wav",0.1,1};
		name = "taser_spark";
		titles[] = {};
	};
};
class RscText;
class RscEdit;
class RscShortcutButton;
class RscControlsGroup;
class RscListBox;
class RscTitles
{
	class RscPicture
	{
		type = 0;
		idc = -1;
		style = 48;
		colorBackground[] = {1,1,1,1};
		colorText[] = {1,1,1,1};
		font = "";
		sizeEx = 0.02;
		text = "";
	};
	class taser_hit_fx
	{
		name = "taser_hit_fx";
		duration = 5;
		idd = -1;
		movingEnable = 0;
		controls[] = {"taser_hit_fx"};
		class taser_hit_fx: RscPicture
		{
			text = "DDOPP_taserPack\data\taser_hit_fx.paa";
			x = "-0.000481755 * safezoneW + safezoneX";
			y = "6.49715e-006 * safezoneH + safezoneY";
			w = "1.0003 * safezoneW";
			h = "1.00067 * safezoneH";
		};
	};
};
//};
