////////////////////////////////////////////////////////////////////
//DeRap: Produced from mikero's Dos Tools Dll version 4.52
//Fri Jul 11 01:44:22 2014 : Source 'file' date Fri Jul 11 01:44:22 2014
//http://dev-heaven.net/projects/list_files/mikero-pbodll
////////////////////////////////////////////////////////////////////

#define _ARMA_

//ndefs=5
enum {
	destructengine = 2,
	destructdefault = 6,
	destructwreck = 7,
	destructtree = 3,
	destructtent = 4,
	stabilizedinaxisx = 1,
	stabilizedinaxesxyz = 4,
	stabilizedinaxisy = 2,
	stabilizedinaxesboth = 3,
	destructno = 0,
	stabilizedinaxesnone = 0,
	destructman = 5,
	destructbuilding = 1
};

//Class C:/Users/sil/Documents/GitHub/@altisrpfr/addons/_new/rds_a2port_civ/config.bin{
class DefaultEventhandlers;
class CfgPatches
{
	class rds_A2_Civilians_c
	{
		units[] = {"RDS_Ikarus_Civ_01","RDS_Ikarus_Civ_02","RDS_Lada_Civ_01","RDS_Lada_Civ_02","RDS_Lada_Civ_03","RDS_Lada_Civ_04","RDS_Lada_Civ_05","RDS_S1203_Civ_01","RDS_S1203_Civ_02","RDS_S1203_Civ_03","RDS_Gaz24_Civ_01","RDS_Gaz24_Civ_02","RDS_Gaz24_Civ_03","RDS_Golf4_Civ_01","RDS_Octavia_Civ_01","RDS_Hatchback_01_F","RDS_SUV_01_F","RDS_Van_01_transport_F","RDS_Van_01_fuel_F","RDS_Van_01_box_F"};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {"rds_A2_Civilians","A3_Soft_F","A3_Soft_F_TruckHeavy","A3_CargoPoses_F"};
	};
};
class CfgMovesBasic
{
	class DefaultDie;
	class ManActions
	{
		Ikarus_Driver = "Ikarus_Driver";
		Ikarus_Cargo = "Ikarus_Cargo";
		Golf_Driver = "Golf_Driver";
		Golf_Cargo01 = "Golf_Cargo01";
		Golf_Cargo02 = "Golf_Cargo02";
		Golf_Cargo03 = "Golf_Cargo03";
		S1203_cargo = "S1203_cargo";
		S1203_cargo01 = "S1203_cargo01";
		S1203_cargo02 = "S1203_cargo02";
		S1203_cargo03 = "S1203_cargo03";
		S1203_driver = "S1203_driver";
		volha_driver = "volha_driver";
		volha_cargo02 = "volha_cargo02";
		volha_cargo01 = "volha_cargo01";
		volha_cargo = "volha_cargo";
		RDS_LyingWounded = "RDS_LyingWounded";
	};
};
class CfgMovesMaleSdr: CfgMovesBasic
{
	class States
	{
		class Crew;
		class Ikarus_Driver: Crew
		{
			file = "\rds_a2port_civ\Ikarus\Data\Anim\Ikarus_driver.rtm";
			interpolateTo[] = {"KIA_Ikarus_Driver",1};
			leftHandIKCurve[] = {1};
			rightHandIKCurve[] = {1};
			leftHandIKBeg = 1;
			leftHandIKEnd = 1;
		};
		class KIA_Ikarus_Driver: DefaultDie
		{
			actions = "DeadActions";
			file = "\rds_a2port_civ\Ikarus\Data\Anim\KIA_Ikarus_driver.rtm";
			speed = 0.5;
			looped = 0;
			terminal = 1;
			soundEnabled = 0;
			connectTo[] = {"Unconscious",0.1};
		};
		class Ikarus_Cargo: Crew
		{
			file = "\rds_a2port_civ\Ikarus\Data\Anim\Ikarus_cargo.rtm";
			interpolateTo[] = {"KIA_Ikarus_Cargo",1};
		};
		class KIA_Ikarus_Cargo: KIA_Ikarus_Driver
		{
			file = "\rds_a2port_civ\Ikarus\Data\Anim\KIA_Ikarus_Cargo.rtm";
		};
		class Golf_Driver: Ikarus_Driver
		{
			file = "\rds_a2port_civ\Data\Anim\Golf_driver.rtm";
			interpolateTo[] = {"KIA_Golf_Driver",1};
		};
		class KIA_Golf_Driver: KIA_Ikarus_Driver
		{
			file = "\rds_a2port_civ\Data\Anim\KIA_Golf_driver.rtm";
		};
		class Golf_Cargo01: Crew
		{
			file = "\rds_a2port_civ\Data\Anim\Golf_cargo1.rtm";
			interpolateTo[] = {"KIA_Golf_Cargo01",1};
		};
		class KIA_Golf_Cargo01: KIA_Ikarus_Driver
		{
			file = "\rds_a2port_civ\Data\Anim\KIA_Golf_cargo1.rtm";
		};
		class Golf_Cargo02: Crew
		{
			file = "\rds_a2port_civ\Data\Anim\Golf_cargo2.rtm";
			interpolateTo[] = {"KIA_Golf_Cargo02",1};
		};
		class KIA_Golf_Cargo02: KIA_Ikarus_Driver
		{
			file = "\rds_a2port_civ\Data\Anim\KIA_Golf_cargo2.rtm";
		};
		class Golf_Cargo03: Crew
		{
			file = "\rds_a2port_civ\Data\Anim\Golf_cargo3.rtm";
			interpolateTo[] = {"KIA_Golf_Cargo03",1};
		};
		class KIA_Golf_Cargo03: KIA_Ikarus_Driver
		{
			file = "\rds_a2port_civ\Data\Anim\KIA_Golf_cargo3.rtm";
		};
		class S1203_cargo: Crew
		{
			file = "\rds_a2port_civ\data\Anim\S1203_cargo01";
			interpolateTo[] = {"S1203_KIA_cargo",1};
			speed = 1e+010;
		};
		class S1203_KIA_cargo: DefaultDie
		{
			actions = "DeadActions";
			file = "\rds_a2port_civ\data\Anim\S1203_KIA_cargo01";
			speed = 1e+010;
			terminal = 1;
			soundEnabled = 0;
			looped = 0;
			connectTo[] = {"Unconscious",0.1};
		};
		class S1203_cargo01: Crew
		{
			file = "\rds_a2port_civ\data\Anim\S1203_cargo02";
			interpolateTo[] = {"S1203_KIA_cargo01",1};
			speed = 1e+010;
		};
		class S1203_KIA_cargo01: DefaultDie
		{
			actions = "DeadActions";
			file = "\rds_a2port_civ\data\Anim\S1203_KIA_cargo02";
			speed = 1e+010;
			terminal = 1;
			soundEnabled = 0;
			looped = 0;
			connectTo[] = {"Unconscious",0.1};
		};
		class S1203_cargo02: Crew
		{
			file = "\rds_a2port_civ\data\Anim\S1203_cargo03";
			interpolateTo[] = {"S1203_KIA_cargo02",1};
			speed = 1e+010;
		};
		class S1203_KIA_cargo02: DefaultDie
		{
			actions = "DeadActions";
			file = "\rds_a2port_civ\data\Anim\S1203_KIA_cargo03";
			speed = 1e+010;
			terminal = 1;
			soundEnabled = 0;
			looped = 0;
			connectTo[] = {"Unconscious",0.1};
		};
		class S1203_cargo03: Crew
		{
			file = "\rds_a2port_civ\data\Anim\S1203_KIA_Cargo04";
			interpolateTo[] = {"S1203_KIA_cargo03",1};
			speed = 1e+010;
		};
		class S1203_KIA_cargo03: DefaultDie
		{
			actions = "DeadActions";
			file = "\rds_a2port_civ\data\Anim\S1203_Cargo04";
			speed = 1e+010;
			terminal = 1;
			soundEnabled = 0;
			looped = 0;
			connectTo[] = {"Unconscious",0.1};
		};
		class S1203_driver: Ikarus_Driver
		{
			file = "\rds_a2port_civ\data\Anim\S1203_driver";
			interpolateTo[] = {"S1203_KIA_driver",1};
			speed = 1e+010;
		};
		class S1203_KIA_driver: DefaultDie
		{
			actions = "DeadActions";
			file = "\rds_a2port_civ\data\Anim\S1203_KIA_driver";
			speed = 1e+010;
			terminal = 1;
			soundEnabled = 0;
			looped = 0;
			connectTo[] = {"Unconscious",0.1};
		};
		class volha_cargo: Crew
		{
			file = "\rds_a2port_civ\data\anim\volha_cargo";
			interpolateTo[] = {"volha_KIA_cargo",1};
			speed = 1e+010;
		};
		class volha_KIA_cargo: DefaultDie
		{
			actions = "DeadActions";
			file = "\rds_a2port_civ\data\anim\volha_KIA_cargo01";
			speed = 1e+010;
			terminal = 1;
			soundEnabled = 0;
			looped = 0;
			connectTo[] = {"Unconscious",0.1};
		};
		class volha_cargo01: Crew
		{
			file = "\rds_a2port_civ\data\anim\volha_cargo01";
			interpolateTo[] = {"volha_KIA_cargo01",1};
			connectTo[] = {"volha_cargo01",0.1,"volha_cargo01_V1",0.1,"volha_cargo01_V2",0.1,"volha_cargo01_V3",0.1};
			equivalentTo = "volha_cargo01";
			variantsAI[] = {"volha_cargo01",0.6,"volha_cargo01_V1",0.1,"volha_cargo01_V2",0.15,"volha_cargo01_V3",0.07};
			variantAfter[] = {5,10,20};
			speed = 0.3;
		};
		class volha_cargo01_v1: volha_cargo01
		{
			file = "\rds_a2port_civ\data\anim\volha_cargo01_v1";
			interpolateTo[] = {"volha_KIA_cargo01",1};
			connectTo[] = {"volha_Cargo01",0.1};
			variantAfter[] = {4,4,4};
			speed = 0.246;
		};
		class volha_cargo01_v2: volha_cargo01
		{
			file = "\rds_a2port_civ\data\anim\volha_cargo01_v2";
			interpolateTo[] = {"volha_KIA_cargo01",1};
			connectTo[] = {"volha_Cargo01",0.1};
			variantAfter[] = {4,4,4};
			speed = 0.246;
		};
		class volha_cargo01_v3: volha_cargo01
		{
			file = "\rds_a2port_civ\data\anim\volha_cargo01_v3";
			interpolateTo[] = {"volha_KIA_cargo01",1};
			connectTo[] = {"volha_Cargo01",0.1};
			variantAfter[] = {4,4,4};
			speed = 0.246;
		};
		class volha_cargo01_v4: volha_cargo01
		{
			file = "\rds_a2port_civ\data\anim\volha_cargo01_v4";
			interpolateTo[] = {"volha_KIA_cargo01",1};
			connectTo[] = {"volha_Cargo01",0.1};
			variantAfter[] = {4,4,4};
			speed = 0.246;
		};
		class volha_cargo01_v5: volha_cargo01
		{
			file = "\rds_a2port_civ\data\anim\volha_cargo01_v5";
			interpolateTo[] = {"volha_KIA_cargo01",1};
			connectTo[] = {"volha_Cargo01",0.1};
			variantAfter[] = {4,4,4};
			speed = 0.246;
		};
		class volha_KIA_cargo01: DefaultDie
		{
			actions = "DeadActions";
			file = "\rds_a2port_civ\data\anim\volha_KIA_cargo02";
			speed = 1e+010;
			terminal = 1;
			soundEnabled = 0;
			looped = 0;
			connectTo[] = {"Unconscious",0.1};
		};
		class volha_cargo02: Crew
		{
			file = "\rds_a2port_civ\data\anim\volha_cargo02";
			interpolateTo[] = {"volha_KIA_cargo02",1};
			connectTo[] = {"volha_cargo02",0.1,"volha_cargo02_V1",0.1,"volha_cargo02_V2",0.1,"volha_cargo02_V3",0.1};
			equivalentTo = "volha_cargo02";
			variantsAI[] = {"volha_cargo02",0.6,"volha_cargo02_V1",0.1,"volha_cargo02_V2",0.15,"volha_cargo02_V3",0.07};
			variantAfter[] = {5,10,20};
			speed = 0.3;
		};
		class volha_cargo02_v1: volha_cargo02
		{
			file = "\rds_a2port_civ\data\anim\volha_cargo02_v1";
			interpolateTo[] = {"volha_KIA_cargo02",1};
			connectTo[] = {"volha_Cargo02",0.1};
			variantAfter[] = {4,4,4};
			speed = 0.246;
		};
		class volha_cargo02_v2: volha_cargo02
		{
			file = "\rds_a2port_civ\data\anim\volha_cargo02_v2";
			interpolateTo[] = {"volha_KIA_cargo02",1};
			connectTo[] = {"volha_Cargo02",0.1};
			variantAfter[] = {4,4,4};
			speed = 0.246;
		};
		class volha_cargo02_v3: volha_cargo02
		{
			file = "\rds_a2port_civ\data\anim\volha_cargo02_v3";
			interpolateTo[] = {"volha_KIA_cargo02",1};
			connectTo[] = {"volha_Cargo02",0.1};
			variantAfter[] = {4,4,4};
			speed = 0.246;
		};
		class volha_cargo02_v4: volha_cargo02
		{
			file = "\rds_a2port_civ\data\anim\volha_cargo02_v4";
			interpolateTo[] = {"volha_KIA_cargo02",1};
			connectTo[] = {"volha_Cargo02",0.1};
			variantAfter[] = {4,4,4};
			speed = 0.246;
		};
		class volha_cargo02_v5: volha_cargo02
		{
			file = "\rds_a2port_civ\data\anim\volha_cargo02_v5";
			interpolateTo[] = {"volha_KIA_cargo02",1};
			connectTo[] = {"volha_Cargo02",0.1};
			variantAfter[] = {4,4,4};
			speed = 0.246;
		};
		class volha_KIA_cargo02: DefaultDie
		{
			actions = "DeadActions";
			file = "\rds_a2port_civ\data\anim\volha_KIA_cargo03";
			speed = 1e+010;
			terminal = 1;
			soundEnabled = 0;
			looped = 0;
			connectTo[] = {"Unconscious",0.1};
		};
		class volha_driver: Crew
		{
			file = "\rds_a2port_civ\data\anim\volha_driver";
			interpolateTo[] = {"volha_KIA_Driver",1};
			speed = 1e+010;
		};
		class volha_KIA_Driver: DefaultDie
		{
			actions = "DeadActions";
			file = "\rds_a2port_civ\data\anim\volha_KIA_Driver";
			speed = 1e+010;
			terminal = 1;
			soundEnabled = 0;
			looped = 0;
			connectTo[] = {"Unconscious",0.1};
		};
		class KIA_Truck_Driver: DefaultDie
		{
			actions = "DeadActions";
			speed = 0.5;
			looped = 0;
			terminal = 1;
			file = "A3\soft_f_beta\Truck_02\data\Anim\KIA_Truck_02_Driver.rtm";
			connectTo[] = {"Unconscious",0.1};
		};
		class KIA_Truck_Cargo01: KIA_Truck_Driver
		{
			file = "A3\soft_f_beta\Truck_02\data\Anim\KIA_Truck_02_Cargo04.rtm";
		};
		class KIA_Truck_Cargo02: KIA_Truck_Driver
		{
			file = "A3\soft_f_beta\Truck_02\data\Anim\KIA_Truck_02_Cargo04.rtm";
		};
		class KIA_Truck_Cargo03: KIA_Truck_Driver
		{
			file = "A3\soft_f_beta\Truck_02\data\Anim\KIA_Truck_02_Cargo04.rtm";
		};
		class KIA_Truck_Cargo04: KIA_Truck_Driver
		{
			file = "A3\soft_f_beta\Truck_02\data\Anim\KIA_Truck_02_Cargo04.rtm";
		};
		class Acts_LyingWounded_loop;
		class RDS_LyingWounded: Acts_LyingWounded_loop
		{
			actions = "CargoActions";
			collisionShape = "A3\anims_f\Data\Geom\Sdr\geom_empty.p3d";
			variantsPlayer[] = {"RDS_LyingWounded1",0.33,"RDS_LyingWounded2",0.33,"RDS_LyingWounded3",0.34};
			equivalentTo = "RDS_LyingWounded";
		};
		class RDS_LyingWounded_loop1: RDS_LyingWounded
		{
			file = "\a3\Anims_F_EPA\data\Anim\sdr\cts\Custom\A_m01-02\Acts_LyingWounded01.rtm";
			speed = 0.04;
			looped = 0;
			ConnectTo[] = {"RDS_LyingWounded",0.0001};
			InterpolateTo[] = {"RDS_LyingWounded",0.0001};
		};
		class RDS_LyingWounded_loop2: RDS_LyingWounded
		{
			file = "\a3\Anims_F_EPA\data\Anim\sdr\cts\Custom\A_m01-02\Acts_LyingWounded02.rtm";
			speed = 0.0342;
			looped = 0;
			ConnectTo[] = {"RDS_LyingWounded",0.0001};
			InterpolateTo[] = {"RDS_LyingWounded",0.0001};
		};
		class RDS_LyingWounded_loop3: RDS_LyingWounded
		{
			file = "\a3\Anims_F_EPA\data\Anim\sdr\cts\Custom\A_m01-02\Acts_LyingWounded03.rtm";
			looped = 0;
			speed = 0.0405;
			ConnectTo[] = {"RDS_LyingWounded",0.0001};
			InterpolateTo[] = {"RDS_LyingWounded",0.0001};
		};
	};
};
class CfgFunctions
{
	class RDS
	{
		tag = "RDS";
		class functions
		{
			class ikarusDoors
			{
				file = "\rds_a2port_civ\Ikarus\Ikarus_Doors.sqf";
				description = "Doors sounds for Ikarus";
			};
		};
	};
};
class WeaponFireGun;
class WeaponCloudsGun;
class WeaponFireMGun;
class WeaponCloudsMGun;
class CfgVehicles
{
	class Wreck_base_F;
	class LandVehicle;
	class Car: LandVehicle
	{
		class HitPoints;
		class NewTurret;
	};
	class Car_F: Car
	{
		class Turrets
		{
			class MainTurret: NewTurret
			{
				disableSoundAttenuation = 1;
				class ViewOptics;
			};
		};
		class HitPoints
		{
			class HitLFWheel;
			class HitLF2Wheel;
			class HitRFWheel;
			class HitRF2Wheel;
			class HitBody;
			class HitGlass1{};
			class HitGlass2;
			class HitGlass3;
			class HitGlass4;
			class HitGlass5;
			class HitGlass6;
		};
		class EventHandlers;
		class AnimationSources;
	};
	class Offroad_01_base_F: Car_F{};
	class Truck_F: Car_F
	{
		class ViewPilot;
		class HitPoints: HitPoints
		{
			class HitLFWheel;
			class HitLBWheel;
			class HitLMWheel;
			class HitLF2Wheel;
			class HitRFWheel;
			class HitRBWheel;
			class HitRMWheel;
			class HitRF2Wheel;
		};
		class AnimationSources;
	};
	class RDS_Base_Car: Car_F{};
	class RDS_Base_Truck: Truck_F{};
	class RDS_Ikarus_Base: Truck_F
	{
		model = "\rds_a2port_civ\Ikarus\ikarus.p3d";
		icon = "\rds_a2port_civ\data\map_ico\icomap_Bus_CA.paa";
		picture = "\rds_a2port_civ\data\ico\bus_city_CA.paa";
		mapsize = 11;
		displayName = "Ikarus 260.03";
		hiddenselections[] = {"Camo1"};
		hiddenselectionstextures[] = {"\rds_a2port_civ\Ikarus\data\bus_exterior_co.paa"};
		driveraction = "Ikarus_Driver";
		attenuationEffectType = "OpenCarAttenuation";
		armor = 32;
		cost = 50000;
		transportMaxBackpacks = 6;
		transportSoldier = 23;
		wheelDamageRadiusCoef = 0.9;
		wheelDestroyRadiusCoef = 0.4;
		maxFordingDepth = 0.5;
		waterResistance = 1;
		crewCrashProtection = 0.25;
		driverLeftHandAnimName = "drivewheel";
		driverRightHandAnimName = "drivewheel";
		driverRightLegAnimName = "pedalR";
		soundAttenuationCargo[] = {1,0};
		insideSoundCoef = 1;
		soundGetIn[] = {"rds_a2port_civ\data\sounds\d1cls_r",0.56234133,1};
		soundGetOut[] = {"rds_a2port_civ\data\sounds\d1opn_r",0.56234133,1,20};
		soundDammage[] = {"",0.56234133,1};
		soundEngineOnInt[] = {"rds_a2port_civ\data\sounds\Ikarus_Start",0.39810717,1.0};
		soundEngineOnExt[] = {"rds_a2port_civ\data\sounds\Ikarus_Start",0.63095737,1.0,200};
		soundEngineOffInt[] = {"rds_a2port_civ\data\sounds\Ikarus_Stop",0.39810717,1.0};
		soundEngineOffExt[] = {"rds_a2port_civ\data\sounds\Ikarus_Stop",0.63095737,1.0,200};
		buildCrash0[] = {"A3\sounds_f\Vehicles\soft\noises\crash_building_01",1.0,1,200};
		buildCrash1[] = {"A3\sounds_f\Vehicles\soft\noises\crash_building_02",1.0,1,200};
		buildCrash2[] = {"A3\sounds_f\Vehicles\soft\noises\crash_building_03",1.0,1,200};
		buildCrash3[] = {"A3\sounds_f\Vehicles\soft\noises\crash_building_04",1.0,1,200};
		soundBuildingCrash[] = {"buildCrash0",0.25,"buildCrash1",0.25,"buildCrash2",0.25,"buildCrash3",0.25};
		WoodCrash0[] = {"A3\sounds_f\Vehicles\soft\noises\crash_mix_wood_01",1.0,1,200};
		WoodCrash1[] = {"A3\sounds_f\Vehicles\soft\noises\crash_mix_wood_02",1.0,1,200};
		WoodCrash2[] = {"A3\sounds_f\Vehicles\soft\noises\crash_mix_wood_03",1.0,1,200};
		WoodCrash3[] = {"A3\sounds_f\Vehicles\soft\noises\crash_mix_wood_04",1.0,1,200};
		WoodCrash4[] = {"A3\sounds_f\Vehicles\soft\noises\crash_mix_wood_05",1.0,1,200};
		WoodCrash5[] = {"A3\sounds_f\Vehicles\soft\noises\crash_mix_wood_06",1.0,1,200};
		soundWoodCrash[] = {"woodCrash0",0.166,"woodCrash1",0.166,"woodCrash2",0.166,"woodCrash3",0.166,"woodCrash4",0.166,"woodCrash5",0.166};
		ArmorCrash0[] = {"A3\sounds_f\Vehicles\soft\noises\crash_vehicle_01",1.0,1,200};
		ArmorCrash1[] = {"A3\sounds_f\Vehicles\soft\noises\crash_vehicle_02",1.0,1,200};
		ArmorCrash2[] = {"A3\sounds_f\Vehicles\soft\noises\crash_vehicle_03",1.0,1,200};
		ArmorCrash3[] = {"A3\sounds_f\Vehicles\soft\noises\crash_vehicle_04",1.0,1,200};
		soundArmorCrash[] = {"ArmorCrash0",0.25,"ArmorCrash1",0.25,"ArmorCrash2",0.25,"ArmorCrash3",0.25};
		class Sounds
		{
			class Idle_ext
			{
				sound[] = {"rds_a2port_civ\data\sounds\Ikarus_Idle",0.35481337,1,200};
				frequency = "0.9	+	((rpm/	2200) factor[(200/	2200),(1150/	2200)])*0.2";
				volume = "engineOn*camPos*(((rpm/	2200) factor[(200/	2200),(500/	2200)])	*	((rpm/	2200) factor[(900/	2200),(700/	2200)]))";
			};
			class Engine
			{
				sound[] = {"rds_a2port_civ\data\sounds\Ikarus_900_Ex",0.39810717,1,200};
				frequency = "0.8	+	((rpm/	2200) factor[(900/	2200),(2100/	2200)])*0.2";
				volume = "engineOn*camPos*(((rpm/	2200) factor[(870/	2200),(1100/	2200)])	*	((rpm/	2200) factor[(2100/	2200),(1300/	2200)]))";
			};
			class Engine1_ext
			{
				sound[] = {"rds_a2port_civ\data\sounds\Ikarus_1400_Ex",0.39810717,1,200};
				frequency = "0.8	+		((rpm/	2200) factor[(1300/	2200),(3100/	2200)])*0.2";
				volume = "engineOn*camPos*(((rpm/	2200) factor[(1250/	2200),(2050/	2200)])	*	((rpm/	2200) factor[(3100/	2200),(2300/	2200)]))";
			};
			class Engine2_ext
			{
				sound[] = {"rds_a2port_civ\data\sounds\Ikarus_1700_Ex",0.4466836,1,250};
				frequency = "0.8	+	((rpm/	2200) factor[(2200/	2200),(4100/	2200)])*0.2";
				volume = "engineOn*camPos*(((rpm/	2200) factor[(2250/	2200),(3050/	2200)])	*	((rpm/	2200) factor[(4100/	2200),(3300/	2200)]))";
			};
			class Engine3_ext
			{
				sound[] = {"rds_a2port_civ\data\sounds\Ikarus_1850_Ex",0.5011872,1,300};
				frequency = "0.8	+	((rpm/	2200) factor[(3300/	2200),(4900/	2200)])*0.2";
				volume = "engineOn*camPos*(((rpm/	2200) factor[(3250/	2200),(4050/	2200)])	*	((rpm/	2200) factor[(4870/	2200),(4200/	2200)]))";
			};
			class Engine4_ext
			{
				sound[] = {"rds_a2port_civ\data\sounds\Ikarus_1950_Ex",0.5011872,1,300};
				frequency = "0.8	+	((rpm/	2200) factor[(4200/	2200),(6200/	2200)])*0.2";
				volume = "engineOn*camPos*(((rpm/	2200) factor[(4150/	2200),(4800/	2200)])	*	((rpm/	2200) factor[(6150/	2200),(5150/	2200)]))";
			};
			class Engine5_ext
			{
				sound[] = {"rds_a2port_civ\data\sounds\Ikarus_2000",0.56234133,1,300};
				frequency = "0.95	+	((rpm/	2200) factor[(5100/	2200),(6900/	2200)])*0.15";
				volume = "engineOn*camPos*((rpm/	2200) factor[(5100/	2200),(6100/	2200)])";
			};
			class IdleThrust
			{
				sound[] = {"rds_a2port_civ\data\sounds\Ikarus_Idle",0.5011872,1,200};
				frequency = "0.9	+	((rpm/	2200) factor[(200/	2200),(1150/	2200)])*0.2";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	2200) factor[(200/	2200),(500/	2200)])	*	((rpm/	2200) factor[(900/	2200),(700/	2200)]))";
			};
			class EngineThrust
			{
				sound[] = {"rds_a2port_civ\data\sounds\Ikarus_900_Ex",0.5011872,1,200};
				frequency = "0.8	+	((rpm/	2200) factor[(900/	2200),(2100/	2200)])*0.2";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	2200) factor[(870/	2200),(1100/	2200)])	*	((rpm/	2200) factor[(2100/	2200),(1300/	2200)]))";
			};
			class Engine1_Thrust_ext
			{
				sound[] = {"rds_a2port_civ\data\sounds\Ikarus_1400_Ex",0.56234133,1,200};
				frequency = "0.8	+		((rpm/	2200) factor[(1300/	2200),(3100/	2200)])*0.2";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	2200) factor[(1250/	2200),(2050/	2200)])	*	((rpm/	2200) factor[(3100/	2200),(2300/	2200)]))";
			};
			class Engine2_Thrust_ext
			{
				sound[] = {"rds_a2port_civ\data\sounds\Ikarus_1700_Ex",0.63095737,1,250};
				frequency = "0.8	+	((rpm/	2200) factor[(2200/	2200),(4100/	2200)])*0.2";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	2200) factor[(2250/	2200),(3050/	2200)])	*	((rpm/	2200) factor[(4100/	2200),(3300/	2200)]))";
			};
			class Engine3_Thrust_ext
			{
				sound[] = {"rds_a2port_civ\data\sounds\Ikarus_1850_Ex",0.7943282,1,350};
				frequency = "0.8	+	((rpm/	2200) factor[(3300/	2200),(4900/	2200)])*0.2";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	2200) factor[(3250/	2200),(4050/	2200)])	*	((rpm/	2200) factor[(4870/	2200),(4200/	2200)]))";
			};
			class Engine4_Thrust_ext
			{
				sound[] = {"rds_a2port_civ\data\sounds\Ikarus_1950_Ex",0.8912509,1,350};
				frequency = "0.8	+	((rpm/	2200) factor[(4200/	2200),(6200/	2200)])*0.3";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	2200) factor[(4150/	2200),(4800/	2200)])	*	((rpm/	2200) factor[(6150/	2200),(5150/	2200)]))";
			};
			class Engine5_Thrust_ext
			{
				sound[] = {"rds_a2port_civ\data\sounds\Ikarus_2000_Ex",1.0,1,400};
				frequency = "0.9	+	((rpm/	2200) factor[(5100/	2200),(6900/	2200)])*0.2";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*((rpm/	2200) factor[(5100/	2200),(6100/	2200)])";
			};
			class Idle_int
			{
				sound[] = {"rds_a2port_civ\data\sounds\Ikarus_Idle",0.2238721,1};
				frequency = "0.9	+	((rpm/	2200) factor[(200/	2200),(1150/	2200)])*0.2";
				volume = "engineOn*(1-camPos)*(((rpm/	2200) factor[(200/	2200),(500/	2200)])	*	((rpm/	2200) factor[(900/	2200),(700/	2200)]))";
			};
			class Engine_int
			{
				sound[] = {"rds_a2port_civ\data\sounds\Ikarus_900",0.25118864,1};
				frequency = "0.8	+	((rpm/	2200) factor[(900/	2200),(2100/	2200)])*0.2";
				volume = "engineOn*(1-camPos)*(((rpm/	2200) factor[(870/	2200),(1100/	2200)])	*	((rpm/	2200) factor[(2100/	2200),(1300/	2200)]))";
			};
			class Engine1_int
			{
				sound[] = {"rds_a2port_civ\data\sounds\Ikarus_1400",0.2818383,1};
				frequency = "0.8	+		((rpm/	2200) factor[(1300/	2200),(3100/	2200)])*0.2";
				volume = "engineOn*(1-camPos)*(((rpm/	2200) factor[(1250/	2200),(2050/	2200)])	*	((rpm/	2200) factor[(3100/	2200),(2300/	2200)]))";
			};
			class Engine2_int
			{
				sound[] = {"rds_a2port_civ\data\sounds\Ikarus_1700",0.31622776,1};
				frequency = "0.8	+	((rpm/	2200) factor[(2200/	2200),(4100/	2200)])*0.2";
				volume = "engineOn*(1-camPos)*(((rpm/	2200) factor[(2250/	2200),(3050/	2200)])	*	((rpm/	2200) factor[(4100/	2200),(3300/	2200)]))";
			};
			class Engine3_int
			{
				sound[] = {"rds_a2port_civ\data\sounds\Ikarus_1850",0.31622776,1};
				frequency = "0.8	+	((rpm/	2200) factor[(3300/	2200),(4900/	2200)])*0.2";
				volume = "engineOn*(1-camPos)*(((rpm/	2200) factor[(3250/	2200),(4050/	2200)])	*	((rpm/	2200) factor[(4870/	2200),(4200/	2200)]))";
			};
			class Engine4_int
			{
				sound[] = {"rds_a2port_civ\data\sounds\Ikarus_1950",0.35481337,1};
				frequency = "0.8	+	((rpm/	2200) factor[(4200/	2200),(6200/	2200)])*0.2";
				volume = "engineOn*(1-camPos)*(((rpm/	2200) factor[(4150/	2200),(4800/	2200)])	*	((rpm/	2200) factor[(6150/	2200),(5150/	2200)]))";
			};
			class Engine5_int
			{
				sound[] = {"rds_a2port_civ\data\sounds\Ikarus_200",0.39810717,1};
				frequency = "0.95	+	((rpm/	2200) factor[(5100/	2200),(6900/	2200)])*0.15";
				volume = "engineOn*(1-camPos)*((rpm/	2200) factor[(5100/	2200),(6100/	2200)])";
			};
			class IdleThrust_int
			{
				sound[] = {"rds_a2port_civ\data\sounds\Ikarus_900",0.35481337,1};
				frequency = "0.9	+	((rpm/	2200) factor[(200/	2200),(1150/	2200)])*0.2";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	2200) factor[(200/	2200),(500/	2200)])	*	((rpm/	2200) factor[(900/	2200),(700/	2200)]))";
			};
			class EngineThrust_int
			{
				sound[] = {"rds_a2port_civ\data\sounds\Ikarus_1400",0.39810717,1};
				frequency = "0.8	+	((rpm/	2200) factor[(900/	2200),(2100/	2200)])*0.2";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	2200) factor[(870/	2200),(1100/	2200)])	*	((rpm/	2200) factor[(2100/	2200),(1300/	2200)]))";
			};
			class Engine1_Thrust_int
			{
				sound[] = {"rds_a2port_civ\data\sounds\Ikarus_1700",0.4466836,1};
				frequency = "0.8	+		((rpm/	2200) factor[(1300/	2200),(3100/	2200)])*0.2";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	2200) factor[(1250/	2200),(2050/	2200)])	*	((rpm/	2200) factor[(3100/	2200),(2300/	2200)]))";
			};
			class Engine2_Thrust_int
			{
				sound[] = {"rds_a2port_civ\data\sounds\Ikarus_1850",0.5011872,1};
				frequency = "0.8	+	((rpm/	2200) factor[(2200/	2200),(4100/	2200)])*0.2";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	2200) factor[(2250/	2200),(3050/	2200)])	*	((rpm/	2200) factor[(4100/	2200),(3300/	2200)]))";
			};
			class Engine3_Thrust_int
			{
				sound[] = {"rds_a2port_civ\data\sounds\Ikarus_1950",0.56234133,1};
				frequency = "0.8	+	((rpm/	2200) factor[(3300/	2200),(4900/	2200)])*0.2";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	2200) factor[(3250/	2200),(4050/	2200)])	*	((rpm/	2200) factor[(4870/	2200),(4200/	2200)]))";
			};
			class Engine4_Thrust_int
			{
				sound[] = {"rds_a2port_civ\data\sounds\Ikarus_2000",0.63095737,1};
				frequency = "0.8	+	((rpm/	2200) factor[(4200/	2200),(6200/	2200)])*0.3";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	2200) factor[(4150/	2200),(4800/	2200)])	*	((rpm/	2200) factor[(6150/	2200),(5150/	2200)]))";
			};
			class Engine5_Thrust_int
			{
				sound[] = {"rds_a2port_civ\data\sounds\Ikarus_2000",0.70794576,1};
				frequency = "0.9	+	((rpm/	2200) factor[(5100/	2200),(6900/	2200)])*0.2";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*((rpm/	2200) factor[(5100/	2200),(6100/	2200)])";
			};
			class Movement
			{
				sound = "soundEnviron";
				frequency = "1";
				volume = "0";
			};
			class TiresRockOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\ext_tires_rock_final_2",0.7943282,1.0,120};
				frequency = "1";
				volume = "camPos*rock*(speed factor[2, 20])";
			};
			class TiresSandOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\ext-tires-sand1",0.70794576,1.0,120};
				frequency = "1";
				volume = "camPos*sand*(speed factor[2, 20])";
			};
			class TiresGrassOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\ext_tires_road_final_1",0.70794576,1.0,120};
				frequency = "1";
				volume = "camPos*grass*(speed factor[2, 20])";
			};
			class TiresMudOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\ext-tires-mud2",0.70794576,1.0,120};
				frequency = "1";
				volume = "camPos*mud*(speed factor[2, 20])";
			};
			class TiresGravelOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\ext_tires_rock_final_2",0.70794576,1.0,120};
				frequency = "1";
				volume = "camPos*gravel*(speed factor[2, 20])";
			};
			class TiresAsphaltOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\ext_tires_road_final_1",0.70794576,1.0,120};
				frequency = "1";
				volume = "camPos*asphalt*(speed factor[2, 20])";
			};
			class NoiseOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\noise_ext_car_3",1.2589254,1.0,90};
				frequency = "1";
				volume = "camPos*(damper0 max 0.02)*(speed factor[0, 8])";
			};
			class TiresRockIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\int_tires_rock_final_2",0.39810717,1.0};
				frequency = "1";
				volume = "(1-camPos)*rock*(speed factor[2, 20])";
			};
			class TiresSandIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\int-tires-sand2",0.39810717,1.0};
				frequency = "1";
				volume = "(1-camPos)*sand*(speed factor[2, 20])";
			};
			class TiresGrassIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\int_tires_road_final_1",0.39810717,1.0};
				frequency = "1";
				volume = "(1-camPos)*grass*(speed factor[2, 20])";
			};
			class TiresMudIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\int-tires-mud2",0.39810717,1.0};
				frequency = "1";
				volume = "(1-camPos)*mud*(speed factor[2, 20])";
			};
			class TiresGravelIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\int_tires_rock_final_2",0.39810717,1.0};
				frequency = "1";
				volume = "(1-camPos)*gravel*(speed factor[2, 20])";
			};
			class TiresAsphaltIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\int_tires_road_final_1",0.39810717,1.0};
				frequency = "1";
				volume = "(1-camPos)*asphalt*(speed factor[2, 20])";
			};
			class NoiseIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\noise_int_car_3",0.5011872,1.0};
				frequency = "1";
				volume = "(damper0 max 0.1)*(speed factor[0, 8])*(1-camPos)";
			};
			class breaking_ext_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_04",0.39810717,1,100};
				frequency = 1;
				volume = "engineOn*camPos*(LongSlipDrive Factor[-0.1, -0.3])*(Speed Factor[2, 10])";
			};
			class acceleration_ext_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02",0.39810717,1,100};
				frequency = 1;
				volume = "engineOn*camPos*(LongSlipDrive Factor[0.1, 0.3])*(Speed Factor[10, 1])";
			};
			class turn_left_ext_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02",0.39810717,1,100};
				frequency = 1;
				volume = "engineOn*camPos*(latSlipDrive Factor[0.1, 0.3])*(Speed Factor[0, 10])";
			};
			class turn_right_ext_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02",0.39810717,1,100};
				frequency = 1;
				volume = "engineOn*camPos*(latSlipDrive Factor[-0.1, -0.3])*(Speed Factor[0, 10])";
			};
			class breaking_ext_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_04",0.39810717,1,100};
				frequency = 1;
				volume = "engineOn*camPos*(LongSlipDrive Factor[-0.1, -0.3])*(Speed Factor[2, 10])";
			};
			class acceleration_ext_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02",0.39810717,1,100};
				frequency = 1;
				volume = "engineOn*camPos*(LongSlipDrive Factor[0.1, 0.3])*(Speed Factor[10, 1])";
			};
			class turn_left_ext_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02",0.39810717,1,100};
				frequency = 1;
				volume = "engineOn*camPos*(latSlipDrive Factor[0.1, 0.3])*(Speed Factor[0, 10])";
			};
			class turn_right_ext_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02",0.39810717,1,100};
				frequency = 1;
				volume = "engineOn*camPos*(latSlipDrive Factor[-0.1, -0.3])*(Speed Factor[0, 10])";
			};
			class breaking_int_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_04_int",0.56234133,1};
				frequency = 1;
				volume = "engineOn*(1-camPos)*(LongSlipDrive Factor[-0.1, -0.3])*(Speed Factor[2, 6])";
			};
			class acceleration_int_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02_int",0.56234133,1};
				frequency = 1;
				volume = "engineOn*(1-camPos)*(LongSlipDrive Factor[0.1, 0.3])*(Speed Factor[10, 1])";
			};
			class turn_left_int_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02_int",0.56234133,1};
				frequency = 1;
				volume = "engineOn*(1-camPos)*(latSlipDrive Factor[0.1, 0.3])*(Speed Factor[0, 10])";
			};
			class turn_right_int_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02_int",0.56234133,1};
				frequency = 1;
				volume = "engineOn*(1-camPos)*(latSlipDrive Factor[-0.1, -0.3])*(Speed Factor[0, 10])";
			};
			class breaking_int_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_04_int",0.56234133,1};
				frequency = 1;
				volume = "engineOn*(1-camPos)*(LongSlipDrive Factor[-0.1, -0.3])*(Speed Factor[2, 6])";
			};
			class acceleration_int_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02_int",0.56234133,1};
				frequency = 1;
				volume = "engineOn*(1-camPos)*(LongSlipDrive Factor[0.1, 0.3])*(Speed Factor[10, 1])";
			};
			class turn_left_int_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02_int",0.56234133,1};
				frequency = 1;
				volume = "engineOn*(1-camPos)*(latSlipDrive Factor[0.1, 0.3])*(Speed Factor[0, 10])";
			};
			class turn_right_int_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02_int",0.56234133,1};
				frequency = 1;
				volume = "engineOn*(1-camPos)*(latSlipDrive Factor[-0.1, -0.3])*(Speed Factor[0, 10])";
			};
		};
		class Turrets{};
		cargoaction[] = {"Truck_Cargo01","Truck_Cargo01","Truck_Cargo01","Truck_Cargo01","Truck_Cargo01","Truck_Cargo01","Truck_Cargo01","Truck_Cargo01","Truck_Cargo02","Truck_Cargo02","Truck_Cargo02","Truck_Cargo02","Truck_Cargo03","Truck_Cargo03","Truck_Cargo04","Truck_Cargo04","Truck_Cargo04","Truck_Cargo04","Truck_Cargo04","Ikarus_Cargo","Ikarus_Cargo","Ikarus_Cargo","Ikarus_Cargo"};
		memoryPointsGetInCargo[] = {"pos cargo1","pos cargo","pos cargo1","pos cargo","pos cargo2","pos cargo1","pos cargo1","pos cargo1","pos cargo2","pos cargo2","pos cargo","pos cargo","pos cargo2","pos cargo","pos cargo2","pos cargo1","pos cargo","pos cargo","pos cargo","pos cargo","pos cargo1","pos cargo2","pos cargo2"};
		memoryPointsGetInCargoDir[] = {"pos cargo1 dir","pos cargo dir","pos cargo1 dir","pos cargo dir","pos cargo2 dir","pos cargo1 dir","pos cargo1 dir","pos cargo1 dir","pos cargo2 dir","pos cargo2 dir","pos cargo dir","pos cargo dir","pos cargo2 dir","pos cargo dir","pos cargo2 dir","pos cargo1 dir","pos cargo dir","pos cargo dir","pos cargo dir","pos cargo dir","pos cargo1 dir","pos cargo2 dir","pos cargo2 dir"};
		driverDoor = "Doors_1";
		cargoDoors[] = {"Doors_2","Doors_1","Doors_2","Doors_1","Doors_3","Doors_2","Doors_2","Doors_2","Doors_3","Doors_3","Doors_1","Doors_1","Doors_3","Doors_1","Doors_3","Doors_2","Doors_1","Doors_1","Doors_1","Doors_1","Doors_2","Doors_1","Doors_1","Doors_2","Doors_3","Doors_2","Doors_3","Doors_3"};
		driverCompartments = "Compartment1";
		cargoCompartments[] = {"Compartment1"};
		class AnimationSources: AnimationSources
		{
			class Doors_1
			{
				source = "door";
				animPeriod = 1.7;
			};
			class Doors_2: Doors_1{};
			class Doors_3: Doors_1{};
		};
		class UserActions
		{
			class openDoors
			{
				displayName = "Ouvrir la porte"; //Open Doors
				position = "";
				radius = 5;
				showWindow = 0;
				condition = "(player == driver this) && (this animationPhase ""door_1"" < 0.5)";
				statement = "[vehicle player,1] call rds_fnc_ikarusDoors";
				onlyForPlayer = 1;
			};
			class closeDoors: openDoors
			{
				displayName = "Fermer la porte"; //Close Doors
				condition = "(player == driver this) && (this animationPhase ""door_1"" > 0.5)";
				statement = "[vehicle player,0] call rds_fnc_ikarusDoors";
			};
		};
		class HitPoints: HitPoints
		{
			class HitLFWheel: HitLFWheel
			{
				armor = 0.175;
				passThrough = 0.3;
			};
			class HitLF2Wheel: HitLF2Wheel
			{
				armor = 0.175;
				passThrough = 0.3;
			};
			class HitRFWheel: HitRFWheel
			{
				armor = 0.175;
				passThrough = 0.3;
			};
			class HitRF2Wheel: HitRF2Wheel
			{
				armor = 0.175;
				passThrough = 0.3;
			};
			class HitFuel
			{
				armor = 0.5;
				material = -1;
				name = "palivo";
				visual = "";
				passThrough = 0.2;
			};
			class HitEngine
			{
				armor = 0.5;
				material = -1;
				name = "motor";
				visual = "";
				passThrough = 0.2;
			};
			class HitBody: HitBody
			{
				name = "karoserie";
				visual = "camo1";
				passThrough = 1;
			};
			class HitGlass1: HitGlass1
			{
				armor = 0.1;
			};
			class HitGlass2: HitGlass2
			{
				armor = 0.05;
			};
			class HitGlass3: HitGlass3
			{
				armor = 0.05;
			};
			class HitGlass4: HitGlass4
			{
				visual = "glass4";
				armor = 0.05;
			};
			class HitGlass5: HitGlass5
			{
				armor = 0.05;
			};
			class HitGlass6: HitGlass6
			{
				armor = 0.05;
			};
		};
		getInAction = "GetInLow";
		getOutAction = "GetOutLow";
		cargoGetInAction[] = {"GetInLow"};
		cargoGetOutAction[] = {"GetOutLow"};
		memorypointtrackbll = "Stopa ZLL";
		memorypointtrackblr = "Stopa ZLP";
		memorypointtrackbrl = "Stopa ZPL";
		memorypointtrackbrr = "Stopa ZPP";
		memorypointtrackfll = "Stopa PLL";
		memorypointtrackflr = "Stopa PLP";
		memorypointtrackfrl = "Stopa PPL";
		memorypointtrackfrr = "Stopa PPP";
		dustFrontLeftPos = "Stopa PPL";
		dustFrontRightPos = "Stopa PLP";
		dustBackLeftPos = "Stopa ZLL";
		dustBackRightPos = "Stopa ZLP";
		class Damage
		{
			mat[] = {"rds_a2port_civ\Ikarus\Data\Bus_exterior.rvmat","rds_a2port_civ\Ikarus\Data\Bus_exterior_damage.rvmat","rds_a2port_civ\Ikarus\Data\Bus_exterior_destruct.rvmat","rds_a2port_civ\Ikarus\Data\Bus_interior.rvmat","rds_a2port_civ\Ikarus\Data\Bus_interior_damage.rvmat","rds_a2port_civ\Ikarus\Data\Bus_interior_destruct.rvmat","rds_a2port_civ\Ikarus\Data\Bus_windows.rvmat","rds_a2port_civ\Ikarus\Data\Bus_windows_damage.rvmat","rds_a2port_civ\Ikarus\Data\Bus_windows_damage.rvmat","rds_a2port_civ\Ikarus\Data\Bus_windows_in.rvmat","rds_a2port_civ\Ikarus\Data\Bus_windows_in_damage.rvmat","rds_a2port_civ\Ikarus\Data\Bus_windows_in_damage.rvmat","a3\data_f\default.rvmat","a3\data_f\default.rvmat","a3\data_f\default_destruct.rvmat"};
			tex[] = {};
		};
		class Exhausts
		{
			class Exhaust1
			{
				position = "vyfuk start";
				direction = "vyfuk konec";
				effect = "ExhaustEffectOffroad";
			};
		};
		class Reflectors
		{
			class Left//LSvetla
			{
				color[] = {800,900,650};
				ambient[] = {5,5,7}; //{2,2,2};
				position = "L svetlo";
				direction = "konec L svetla";
				hitpoint = "L svetlo";
				selection = "L svetlo";
				size = 1;
				innerAngle = 30; //30
				outerAngle = 120; //100
				coneFadeCoef = 10;
				intensity = 2; //1.5 All Modif
				useFlare = 1; //1
				dayLight = 1; //0 All Modif
				flareSize = 1; //0.85
				class Attenuation
				{
					start = 2; //1
					constant = 0;
					linear = 0.1; //0
					quadratic = 0.01; //0.25
					hardLimitStart = 100; //30
					hardLimitEnd = 300; //60 All Modif
				};
			};
			class Right : Left//RSvetla: LSvetla
			{
				position = "P svetlo";
				direction = "konec P svetla";
				hitpoint = "P svetlo";
				selection = "P svetlo";
			};
		};
		//aggregateReflectors[] = {{ "LSvetla","RSvetla" }};
		class RenderTargets
		{
			class LeftMirror
			{
				renderTarget = "rendertarget0";
				class CameraView1
				{
					pointPosition = "m1p";
					pointDirection = "m1d";
					renderQuality = 2;
					renderVisionMode = 4;
					fov = 0.5;
				};
			};
			class RightMirror
			{
				renderTarget = "rendertarget1";
				class CameraView1
				{
					pointPosition = "m2p";
					pointDirection = "m2d";
					renderQuality = 2;
					renderVisionMode = 4;
					fov = 0.7;
				};
			};
			class RightMirrorSmall
			{
				renderTarget = "rendertarget3";
				class CameraView1
				{
					pointPosition = "m4p";
					pointDirection = "m4d";
					renderQuality = 2;
					renderVisionMode = 4;
					fov = 0.5;
				};
			};
			class BackMirror
			{
				renderTarget = "rendertarget2";
				class CameraView1
				{
					pointPosition = "m3p";
					pointDirection = "m3d";
					renderQuality = 2;
					renderVisionMode = 4;
					fov = 0.7;
				};
			};
		};
		//Ikarus: Moteur OK
		enginePower = 1080; //142
		maxOmega = 580; //230.38
		peakTorque = 696;
		idleRPM = 600;
		redRpm = 5400; //2200
		turnCoef = 2.5;
		precision = 10;
		brakeDistance = 3;
		acceleration = 50; //15
		fireResistance = 5;
		thrustDelay = 0.2;
		brakeIdleSpeed = 1.78;
		maxSpeed = 105; //80
		fuelCapacity = 30; //78
		wheelCircumference = 3.233;
		antiRollbarForceCoef = 0.5;
		antiRollbarForceLimit = 0.5;
		antiRollbarSpeedMin = 10;
		antiRollbarSpeedMax = 120; //80
		changeGearMinEffectivity[] = {0.95,0.15,0.95,0.95,0.95,0.95,0.95};
		class complexGearbox
		{
			GearboxRatios[] = {"R1",-6.009,"N",0,"D1",5.81,"D2",2.98,"D3",1.992,"D4",1.438,"D5",1.0};
			TransmissionRatios[] = {"High",6.194};
			gearBoxMode = "auto";
			moveOffGear = 1;
			driveString = "D";
			neutralString = "N";
			reverseString = "R";
		};
		simulation = "carx";
		dampersBumpCoef = 2;
		differentialType = "rear_limited";
		frontRearSplit = 0.5;
		frontBias = 1.5;
		rearBias = 1.5;
		centreBias = 1.3;
		clutchStrength = 20;
		dampingRateFullThrottle = 0.08;
		dampingRateZeroThrottleClutchEngaged = 1.35;
		dampingRateZeroThrottleClutchDisengaged = 0.35;
		torqueCurve[] = {{ "0/2200","0/696" },{ "581/2200","452/696" },{ "1001/2200","621/696" },{ "1300/2200","696/696" },{ "1599/2200","691/696" },{ "1901/2200","675/696" },{ "2101/2200","654/696" },{ "2299/2200","0/696" }};
		switchTime = 0.31;
		latency = 1;
		class Wheels
		{
			class LF
			{
				width = "0.45";
				boneName = "wheel_1_1_damper";
				steering = 1;
				side = "left";
				center = "wheel_1_1_axis";
				boundary = "wheel_1_1_bound";
				mass = 50;
				MOI = 12.7;
				dampingRate = 0.1;
				maxBrakeTorque = 4500;
				maxHandBrakeTorque = 0;
				suspTravelDirection[] = {0,-1,0};
				suspForceAppPointOffset = "wheel_1_1_axis";
				tireForceAppPointOffset = "wheel_1_1_axis";
				maxCompression = 0.15;
				mMaxDroop = 0.15;
				sprungMass = 1985.5;
				springStrength = 85025;
				springDamperRate = 8700;
				longitudinalStiffnessPerUnitGravity = 10000;
				latStiffX = 2.5;
				latStiffY = 18.0;
				frictionVsSlipGraph[] = {{ 0,1.2 },{ 0.5,1.13 },{ 1,1 }};
			};
			class LR: LF
			{
				boneName = "wheel_1_2_damper";
				steering = 0;
				center = "wheel_1_2_axis";
				boundary = "wheel_1_2_bound";
				suspForceAppPointOffset = "wheel_1_2_axis";
				tireForceAppPointOffset = "wheel_1_2_axis";
				maxHandBrakeTorque = 3000;
			};
			class RF: LF
			{
				boneName = "wheel_2_1_damper";
				center = "wheel_2_1_axis";
				boundary = "wheel_2_1_bound";
				suspForceAppPointOffset = "wheel_2_1_axis";
				tireForceAppPointOffset = "wheel_2_1_axis";
				steering = 1;
				side = "right";
			};
			class RR: RF
			{
				boneName = "wheel_2_2_damper";
				steering = 0;
				center = "wheel_2_2_axis";
				boundary = "wheel_2_2_bound";
				suspForceAppPointOffset = "wheel_2_2_axis";
				tireForceAppPointOffset = "wheel_2_2_axis";
				maxHandBrakeTorque = 3000;
			};
		};
	};
	class RDS_Ikarus_Civ_Base: RDS_Ikarus_Base
	{
		accuracy = 0.5;
		crew = "RDS_Worker1";
		faction = "rds_rus_civ";
		side = 3;
	};
	class RDS_Ikarus_Civ_01: RDS_Ikarus_Civ_Base
	{
		scope = 2;
	};
	class RDS_Ikarus_Civ_02: RDS_Ikarus_Civ_01
	{
		displayName = "Ikarus 260.03 (TK)";
		hiddenselectionstextures[] = {"\rds_a2port_civ\Ikarus\data\bus_exterior_eciv_co.paa"};
	};
	class RDS_Lada_Base: Car_F
	{
		model = "\rds_a2port_civ\Lada\Lada";
		icon = "\rds_a2port_civ\data\map_ico\icon_skoda_ca.paa";
		picture = "\rds_a2port_civ\data\ico\Picture_lada_ca.paa";
		hiddenselections[] = {"Camo1","Camo2"};
		hiddenselectionstextures[] = {"rds_a2port_civ\Lada\Data\lada_white_co.paa"};
		mapsize = 5;
		displayName = "Lada VAZ-2103";
		driveraction = "Golf_Driver";
		attenuationEffectType = "OpenCarAttenuation";
		armor = 22;
		cost = 10000;
		transportMaxBackpacks = 6;
		transportSoldier = 3;
		wheelDamageRadiusCoef = 0.9;
		wheelDestroyRadiusCoef = 0.4;
		maxFordingDepth = 0.5;
		waterResistance = 1;
		crewCrashProtection = 0.25;
		driverLeftHandAnimName = "drivewheel";
		driverRightHandAnimName = "";
		driverRightLegAnimName = "pedalR";
		soundAttenuationCargo[] = {1,0};
		insideSoundCoef = 1;
		soundGetIn[] = {"rds_a2port_civ\data\sounds\lada_door",0.4466836,1};
		soundGetOut[] = {"rds_a2port_civ\data\sounds\lada_door",0.4466836,1,40};
		soundDammage[] = {"",0.56234133,1};
		soundEngineOnInt[] = {"rds_a2port_civ\data\sounds\lada_int_start",0.31622776,1.0};
		soundEngineOnExt[] = {"rds_a2port_civ\data\sounds\lada_ext_start",0.39810717,1.0,200};
		soundEngineOffInt[] = {"rds_a2port_civ\data\sounds\lada_int_stop",0.31622776,1.0};
		soundEngineOffExt[] = {"rds_a2port_civ\data\sounds\lada_ext_stop",0.39810717,1.0,200};
		buildCrash0[] = {"A3\sounds_f\Vehicles\soft\noises\crash_building_01",1.0,1,150};
		buildCrash1[] = {"A3\sounds_f\Vehicles\soft\noises\crash_building_02",1.0,1,150};
		buildCrash2[] = {"A3\sounds_f\Vehicles\soft\noises\crash_building_03",1.0,1,150};
		buildCrash3[] = {"A3\sounds_f\Vehicles\soft\noises\crash_building_04",1.0,1,150};
		soundBuildingCrash[] = {"buildCrash0",0.25,"buildCrash1",0.25,"buildCrash2",0.25,"buildCrash3",0.25};
		WoodCrash0[] = {"A3\sounds_f\Vehicles\soft\noises\crash_mix_wood_01",1.0,1,100};
		WoodCrash1[] = {"A3\sounds_f\Vehicles\soft\noises\crash_mix_wood_02",1.0,1,100};
		WoodCrash2[] = {"A3\sounds_f\Vehicles\soft\noises\crash_mix_wood_03",1.0,1,100};
		WoodCrash3[] = {"A3\sounds_f\Vehicles\soft\noises\crash_mix_wood_04",1.0,1,100};
		WoodCrash4[] = {"A3\sounds_f\Vehicles\soft\noises\crash_mix_wood_05",1.0,1,100};
		WoodCrash5[] = {"A3\sounds_f\Vehicles\soft\noises\crash_mix_wood_06",1.0,1,100};
		soundWoodCrash[] = {"woodCrash0",0.166,"woodCrash1",0.166,"woodCrash2",0.166,"woodCrash3",0.166,"woodCrash4",0.166,"woodCrash5",0.166};
		ArmorCrash0[] = {"A3\sounds_f\Vehicles\soft\noises\crash_vehicle_01",1.0,1,200};
		ArmorCrash1[] = {"A3\sounds_f\Vehicles\soft\noises\crash_vehicle_02",1.0,1,200};
		ArmorCrash2[] = {"A3\sounds_f\Vehicles\soft\noises\crash_vehicle_03",1.0,1,200};
		ArmorCrash3[] = {"A3\sounds_f\Vehicles\soft\noises\crash_vehicle_04",1.0,1,200};
		soundArmorCrash[] = {"ArmorCrash0",0.25,"ArmorCrash1",0.25,"ArmorCrash2",0.25,"ArmorCrash3",0.25};
		class Sounds
		{
			class Idle_ext
			{
				sound[] = {"rds_a2port_civ\data\sounds\lada_ext_Idle",0.31622776,1,100};
				frequency = "0.9	+	((rpm/	6000) factor[(200/	6000),(1150/	6000)])*0.2";
				volume = "engineOn*camPos*(((rpm/	6000) factor[(200/	6000),(500/	6000)])	*	((rpm/	6000) factor[(900/	6000),(700/	6000)]))";
			};
			class Engine
			{
				sound[] = {"rds_a2port_civ\data\sounds\lada_ext_acceleration",0.31622776,1,200};
				frequency = "0.8	+	((rpm/	6000) factor[(900/	6000),(2100/	6000)])*0.2";
				volume = "engineOn*camPos*(((rpm/	6000) factor[(870/	6000),(1100/	6000)])	*	((rpm/	6000) factor[(2100/	6000),(1300/	6000)]))";
			};
			class Engine1_ext
			{
				sound[] = {"rds_a2port_civ\data\sounds\lada_ext_low",0.35481337,1,225};
				frequency = "0.8	+		((rpm/	6000) factor[(1300/	6000),(3100/	6000)])*0.2";
				volume = "engineOn*camPos*(((rpm/	6000) factor[(1250/	6000),(2050/	6000)])	*	((rpm/	6000) factor[(3100/	6000),(2300/	6000)]))";
			};
			class Engine2_ext
			{
				sound[] = {"rds_a2port_civ\data\sounds\lada_ext_low",0.35481337,1,250};
				frequency = "0.8	+	((rpm/	6000) factor[(2200/	6000),(4100/	6000)])*0.2";
				volume = "engineOn*camPos*(((rpm/	6000) factor[(2250/	6000),(3050/	6000)])	*	((rpm/	6000) factor[(4100/	6000),(3300/	6000)]))";
			};
			class Engine3_ext
			{
				sound[] = {"rds_a2port_civ\data\sounds\lada_ext_mid",0.39810717,1,275};
				frequency = "0.8	+	((rpm/	6000) factor[(3300/	6000),(4900/	6000)])*0.2";
				volume = "engineOn*camPos*(((rpm/	6000) factor[(3250/	6000),(4050/	6000)])	*	((rpm/	6000) factor[(4870/	6000),(4200/	6000)]))";
			};
			class Engine4_ext
			{
				sound[] = {"rds_a2port_civ\data\sounds\lada_ext_high",0.4466836,1,300};
				frequency = "0.8	+	((rpm/	6000) factor[(4200/	6000),(6200/	6000)])*0.2";
				volume = "engineOn*camPos*(((rpm/	6000) factor[(4150/	6000),(4800/	6000)])	*	((rpm/	6000) factor[(6150/	6000),(5150/	6000)]))";
			};
			class Engine5_ext
			{
				sound[] = {"rds_a2port_civ\data\sounds\lada_ext_high",0.5011872,1,300};
				frequency = "0.95	+	((rpm/	6000) factor[(5100/	6000),(6900/	6000)])*0.15";
				volume = "engineOn*camPos*((rpm/	6000) factor[(5100/	6000),(6100/	6000)])";
			};
			class IdleThrust
			{
				sound[] = {"rds_a2port_civ\data\sounds\lada_ext_Idle",0.5011872,1,200};
				frequency = "0.9	+	((rpm/	6000) factor[(200/	6000),(1150/	6000)])*0.2";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	6000) factor[(200/	6000),(500/	6000)])	*	((rpm/	6000) factor[(900/	6000),(700/	6000)]))";
			};
			class EngineThrust
			{
				sound[] = {"rds_a2port_civ\data\sounds\lada_ext_acceleration",0.56234133,1,250};
				frequency = "0.8	+	((rpm/	6000) factor[(900/	6000),(2100/	6000)])*0.2";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	6000) factor[(870/	6000),(1100/	6000)])	*	((rpm/	6000) factor[(2100/	6000),(1300/	6000)]))";
			};
			class Engine1_Thrust_ext
			{
				sound[] = {"rds_a2port_civ\data\sounds\lada_ext_low",0.63095737,1,275};
				frequency = "0.8	+		((rpm/	6000) factor[(1300/	6000),(3100/	6000)])*0.2";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	6000) factor[(1250/	6000),(2050/	6000)])	*	((rpm/	6000) factor[(3100/	6000),(2300/	6000)]))";
			};
			class Engine2_Thrust_ext
			{
				sound[] = {"rds_a2port_civ\data\sounds\lada_ext_low",0.70794576,1,300};
				frequency = "0.8	+	((rpm/	6000) factor[(2200/	6000),(4100/	6000)])*0.2";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	6000) factor[(2250/	6000),(3050/	6000)])	*	((rpm/	6000) factor[(4100/	6000),(3300/	6000)]))";
			};
			class Engine3_Thrust_ext
			{
				sound[] = {"rds_a2port_civ\data\sounds\lada_ext_mid",0.7943282,1,325};
				frequency = "0.8	+	((rpm/	6000) factor[(3300/	6000),(4900/	6000)])*0.2";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	6000) factor[(3250/	6000),(4050/	6000)])	*	((rpm/	6000) factor[(4870/	6000),(4200/	6000)]))";
			};
			class Engine4_Thrust_ext
			{
				sound[] = {"rds_a2port_civ\data\sounds\lada_ext_high",0.8912509,1,350};
				frequency = "0.8	+	((rpm/	6000) factor[(4200/	6000),(6200/	6000)])*0.3";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	6000) factor[(4150/	6000),(4800/	6000)])	*	((rpm/	6000) factor[(6150/	6000),(5150/	6000)]))";
			};
			class Engine5_Thrust_ext
			{
				sound[] = {"rds_a2port_civ\data\sounds\lada_ext_high",1.0,1,375};
				frequency = "0.9	+	((rpm/	6000) factor[(5100/	6000),(6900/	6000)])*0.2";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*((rpm/	6000) factor[(5100/	6000),(6100/	6000)])";
			};
			class Idle_int
			{
				sound[] = {"rds_a2port_civ\data\sounds\lada_int_Idle",0.2238721,1};
				frequency = "0.9	+	((rpm/	6000) factor[(200/	6000),(1150/	6000)])*0.2";
				volume = "engineOn*(1-camPos)*(((rpm/	6000) factor[(200/	6000),(500/	6000)])	*	((rpm/	6000) factor[(900/	6000),(700/	6000)]))";
			};
			class Engine_int
			{
				sound[] = {"rds_a2port_civ\data\sounds\lada_int_acceleration",0.25118864,1};
				frequency = "0.8	+	((rpm/	6000) factor[(900/	6000),(2100/	6000)])*0.2";
				volume = "engineOn*(1-camPos)*(((rpm/	6000) factor[(870/	6000),(1100/	6000)])	*	((rpm/	6000) factor[(2100/	6000),(1300/	6000)]))";
			};
			class Engine1_int
			{
				sound[] = {"rds_a2port_civ\data\sounds\lada_int_low",0.17782794,1};
				frequency = "0.8	+		((rpm/	6000) factor[(1300/	6000),(3100/	6000)])*0.2";
				volume = "engineOn*(1-camPos)*(((rpm/	6000) factor[(1250/	6000),(2050/	6000)])	*	((rpm/	6000) factor[(3100/	6000),(2300/	6000)]))";
			};
			class Engine2_int
			{
				sound[] = {"rds_a2port_civ\data\sounds\lada_int_low",0.31622776,1};
				frequency = "0.8	+	((rpm/	6000) factor[(2200/	6000),(4100/	6000)])*0.2";
				volume = "engineOn*(1-camPos)*(((rpm/	6000) factor[(2250/	6000),(3050/	6000)])	*	((rpm/	6000) factor[(4100/	6000),(3300/	6000)]))";
			};
			class Engine3_int
			{
				sound[] = {"rds_a2port_civ\data\sounds\lada_int_mid",0.35481337,1};
				frequency = "0.8	+	((rpm/	6000) factor[(3300/	6000),(4900/	6000)])*0.2";
				volume = "engineOn*(1-camPos)*(((rpm/	6000) factor[(3250/	6000),(4050/	6000)])	*	((rpm/	6000) factor[(4870/	6000),(4200/	6000)]))";
			};
			class Engine4_int
			{
				sound[] = {"rds_a2port_civ\data\sounds\lada_int_high",0.39810717,1};
				frequency = "0.8	+	((rpm/	6000) factor[(4200/	6000),(6200/	6000)])*0.2";
				volume = "engineOn*(1-camPos)*(((rpm/	6000) factor[(4150/	6000),(4800/	6000)])	*	((rpm/	6000) factor[(6150/	6000),(5150/	6000)]))";
			};
			class Engine5_int
			{
				sound[] = {"rds_a2port_civ\data\sounds\lada_int_high",0.39810717,1};
				frequency = "0.95	+	((rpm/	6000) factor[(5100/	6000),(6900/	6000)])*0.15";
				volume = "engineOn*(1-camPos)*((rpm/	6000) factor[(5100/	6000),(6100/	6000)])";
			};
			class IdleThrust_int
			{
				sound[] = {"rds_a2port_civ\data\sounds\lada_int_acceleration",0.31622776,1};
				frequency = "0.9	+	((rpm/	6000) factor[(200/	6000),(1150/	6000)])*0.2";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	6000) factor[(200/	6000),(500/	6000)])	*	((rpm/	6000) factor[(900/	6000),(700/	6000)]))";
			};
			class EngineThrust_int
			{
				sound[] = {"rds_a2port_civ\data\sounds\lada_int_low",0.35481337,1};
				frequency = "0.8	+	((rpm/	6000) factor[(900/	6000),(2100/	6000)])*0.2";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	6000) factor[(870/	6000),(1100/	6000)])	*	((rpm/	6000) factor[(2100/	6000),(1300/	6000)]))";
			};
			class Engine1_Thrust_int
			{
				sound[] = {"rds_a2port_civ\data\sounds\lada_int_low",0.39810717,1};
				frequency = "0.8	+		((rpm/	6000) factor[(1300/	6000),(3100/	6000)])*0.2";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	6000) factor[(1250/	6000),(2050/	6000)])	*	((rpm/	6000) factor[(3100/	6000),(2300/	6000)]))";
			};
			class Engine2_Thrust_int
			{
				sound[] = {"rds_a2port_civ\data\sounds\lada_int_mid",0.4466836,1};
				frequency = "0.8	+	((rpm/	6000) factor[(2200/	6000),(4100/	6000)])*0.2";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	6000) factor[(2250/	6000),(3050/	6000)])	*	((rpm/	6000) factor[(4100/	6000),(3300/	6000)]))";
			};
			class Engine3_Thrust_int
			{
				sound[] = {"rds_a2port_civ\data\sounds\lada_int_mid",0.5011872,1};
				frequency = "0.8	+	((rpm/	6000) factor[(3300/	6000),(4900/	6000)])*0.2";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	6000) factor[(3250/	6000),(4050/	6000)])	*	((rpm/	6000) factor[(4870/	6000),(4200/	6000)]))";
			};
			class Engine4_Thrust_int
			{
				sound[] = {"rds_a2port_civ\data\sounds\lada_int_high",0.56234133,1};
				frequency = "0.8	+	((rpm/	6000) factor[(4200/	6000),(6200/	6000)])*0.3";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	6000) factor[(4150/	6000),(4800/	6000)])	*	((rpm/	6000) factor[(6150/	6000),(5150/	6000)]))";
			};
			class Engine5_Thrust_int
			{
				sound[] = {"rds_a2port_civ\data\sounds\lada_int_high",0.63095737,1};
				frequency = "0.9	+	((rpm/	6000) factor[(5100/	6000),(6900/	6000)])*0.2";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*((rpm/	6000) factor[(5100/	6000),(6100/	6000)])";
			};
			class Movement
			{
				sound = "soundEnviron";
				frequency = "1";
				volume = "0";
			};
			class TiresRockOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\ext_tires_dirt_soft_1",0.70794576,1.0,60};
				frequency = "1";
				volume = "camPos*rock*(speed factor[2, 20])";
			};
			class TiresSandOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\ext-tires-sand1",0.70794576,1.0,60};
				frequency = "1";
				volume = "camPos*sand*(speed factor[2, 20])";
			};
			class TiresGrassOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\ext_tires_dirt_soft_2",0.70794576,1.0,60};
				frequency = "1";
				volume = "camPos*grass*(speed factor[2, 20])";
			};
			class TiresMudOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\ext-tires-mud2",0.70794576,1.0,60};
				frequency = "1";
				volume = "camPos*mud*(speed factor[2, 20])";
			};
			class TiresGravelOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\ext_tires_gravel_1",0.70794576,1.0,60};
				frequency = "1";
				volume = "camPos*gravel*(speed factor[2, 20])";
			};
			class TiresAsphaltOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\ext_tires_asfalt_2",0.70794576,1.0,60};
				frequency = "1";
				volume = "camPos*asphalt*(speed factor[2, 20])";
			};
			class NoiseOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\noise_ext_car_3",0.56234133,1.0,90};
				frequency = "1";
				volume = "camPos*(damper0 max 0.02)*(speed factor[0, 8])";
			};
			class TiresRockIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\int_tires_dirt_soft_1",0.70794576,1.0};
				frequency = "1";
				volume = "(1-camPos)*rock*(speed factor[2, 20])";
			};
			class TiresSandIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\int-tires-sand2",0.70794576,1.0};
				frequency = "1";
				volume = "(1-camPos)*sand*(speed factor[2, 20])";
			};
			class TiresGrassIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\int_tires_dirt_soft_2",0.70794576,1.0};
				frequency = "1";
				volume = "(1-camPos)*grass*(speed factor[2, 20])";
			};
			class TiresMudIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\int-tires-mud2",0.70794576,1.0};
				frequency = "1";
				volume = "(1-camPos)*mud*(speed factor[2, 20])";
			};
			class TiresGravelIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\int_tires_gravel_1",0.70794576,1.0};
				frequency = "1";
				volume = "(1-camPos)*gravel*(speed factor[2, 20])";
			};
			class TiresAsphaltIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\int_tires_asfalt_2",0.70794576,1.0};
				frequency = "1";
				volume = "(1-camPos)*asphalt*(speed factor[2, 20])";
			};
			class NoiseIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\noise_int_car_3",0.15848932,1.0};
				frequency = "1";
				volume = "(damper0 max 0.1)*(speed factor[0, 8])*(1-camPos)";
			};
			class breaking_ext_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_04",0.70794576,1,80};
				frequency = 1;
				volume = "engineOn*camPos*asphalt*(LongSlipDrive Factor[-0.1, -0.4])*(Speed Factor[2, 15])";
			};
			class acceleration_ext_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02",0.70794576,1,80};
				frequency = 1;
				volume = "engineOn*camPos*asphalt*(LongSlipDrive Factor[0.1, 0.4])*(Speed Factor[15, 2])";
			};
			class turn_left_ext_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02",0.70794576,1,80};
				frequency = 1;
				volume = "engineOn*camPos*asphalt*(latSlipDrive Factor[0.1, 0.4])*(Speed Factor[2, 15])";
			};
			class turn_right_ext_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02",0.70794576,1,80};
				frequency = 1;
				volume = "engineOn*camPos*asphalt*(latSlipDrive Factor[-0.1, -0.4])*(Speed Factor[2, 15])";
			};
			class breaking_ext_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_14_dirt_breaking",0.70794576,1,60};
				frequency = 1;
				volume = "engineOn*camPos*(1-asphalt)*(LongSlipDrive Factor[-0.1, -0.4])*(Speed Factor[1, 15])";
			};
			class acceleration_ext_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_16_dirt_acceleration",0.70794576,1,60};
				frequency = 1;
				volume = "engineOn*camPos*(1-asphalt)*(LongSlipDrive Factor[0.1, 0.4])*(Speed Factor[15, 1])";
			};
			class turn_left_ext_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_18_dirt",0.70794576,1,60};
				frequency = 1;
				volume = "engineOn*camPos*(1-asphalt)*(latSlipDrive Factor[0.1, 0.4])*(Speed Factor[1, 15])";
			};
			class turn_right_ext_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_18_dirt",0.70794576,1,60};
				frequency = 1;
				volume = "engineOn*camPos*(1-asphalt)*(latSlipDrive Factor[-0.1, -0.4])*(Speed Factor[1, 15])";
			};
			class breaking_int_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_04_int",0.31622776,1};
				frequency = 1;
				volume = "engineOn*asphalt*(1-camPos)*(LongSlipDrive Factor[-0.1, -0.4])*(Speed Factor[1, 15])";
			};
			class acceleration_int_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02_int",0.31622776,1};
				frequency = 1;
				volume = "engineOn*asphalt*(1-camPos)*(LongSlipDrive Factor[0.1, 0.4])*(Speed Factor[15, 1])";
			};
			class turn_left_int_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02_int",0.31622776,1};
				frequency = 1;
				volume = "engineOn*asphalt*(1-camPos)*(latSlipDrive Factor[0.1, 0.4])*(Speed Factor[1, 15])";
			};
			class turn_right_int_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02_int",0.31622776,1};
				frequency = 1;
				volume = "engineOn*asphalt*(1-camPos)*(latSlipDrive Factor[-0.1, -0.4])*(Speed Factor[1, 15])";
			};
			class breaking_int_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_14_dirt_breaking_int",0.31622776,1};
				frequency = 1;
				volume = "engineOn*(1-asphalt)*(1-camPos)*(LongSlipDrive Factor[-0.1, -0.4])*(Speed Factor[1, 15])";
			};
			class acceleration_int_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_16_dirt_acceleration_int",0.31622776,1};
				frequency = 1;
				volume = "engineOn*(1-asphalt)*(1-camPos)*(LongSlipDrive Factor[0.1, 0.4])*(Speed Factor[15, 1])";
			};
			class turn_left_int_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_18_dirt_int",0.31622776,1};
				frequency = 1;
				volume = "engineOn*(1-asphalt)*(1-camPos)*(latSlipDrive Factor[0.1, 0.4])*(Speed Factor[1, 15])";
			};
			class turn_right_int_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_18_dirt_int",0.31622776,1};
				frequency = 1;
				volume = "engineOn*(1-asphalt)*(1-camPos)*(latSlipDrive Factor[-0.1, -0.4])*(Speed Factor[1, 15])";
			};
		};
		class Turrets{};
		cargoaction[] = {"Golf_Cargo01","Golf_Cargo02","Golf_Cargo02"};
		memorypointsgetincargo[] = {"pos cargo 1","pos cargo 2","pos cargo 3","pos cargo 4"};
		memorypointsgetincargodir[] = {"pos cargo dir 1","pos cargo dir 2","pos cargo dir 3","pos cargo dir 4"};
		driverDoor = "Door_LF";
		cargoDoors[] = {"Door_RF","Door_LB","Door_RB"};
		driverCompartments = "Compartment1";
		cargoCompartments[] = {"Compartment1"};
		class AnimationSources: AnimationSources
		{
			class Door_LF
			{
				source = "door";
				animPeriod = 1.0;
			};
			class Door_LB: Door_LF{};
			class Door_RB: Door_LF{};
			class Door_RF: Door_LF{};
			class Trunk: Door_LF{};
		};
		class UserActions
		{
			class openDoors
			{
				displayName = "Ouvrir le coffre";
				position = "pos cargo dir 4";
				radius = 1;
				showWindow = 0;
				condition = "(this animationPhase ""trunk"" < 0.5)";
				statement = "this animateDoor [""trunk"",1]";
				onlyForPlayer = 0;
			};
			class closeDoors: openDoors
			{
				displayName = "Fermer le coffre";
				condition = "(this animationPhase ""trunk"" > 0.5)";
				statement = "this animateDoor [""trunk"",0]";
			};
		};
		class HitPoints: HitPoints
		{
			class HitLFWheel: HitLFWheel
			{
				armor = 0.175;
				passThrough = 0.3;
			};
			class HitLF2Wheel: HitLF2Wheel
			{
				armor = 0.175;
				passThrough = 0.3;
			};
			class HitRFWheel: HitRFWheel
			{
				armor = 0.175;
				passThrough = 0.3;
			};
			class HitRF2Wheel: HitRF2Wheel
			{
				armor = 0.175;
				passThrough = 0.3;
			};
			class HitFuel
			{
				armor = 0.5;
				material = -1;
				name = "palivo";
				visual = "";
				passThrough = 0.2;
			};
			class HitEngine
			{
				armor = 0.5;
				material = -1;
				name = "motor";
				visual = "";
				passThrough = 0.2;
			};
			class HitBody: HitBody
			{
				name = "karoserie";
				visual = "camo1";
				passThrough = 1;
			};
			class HitGlass1: HitGlass1
			{
				armor = 0.1;
			};
			class HitGlass2: HitGlass2
			{
				armor = 0.05;
			};
			class HitGlass3: HitGlass3
			{
				armor = 0.05;
			};
			class HitGlass4: HitGlass4
			{
				visual = "glass4";
				armor = 0.05;
			};
			class HitGlass5: HitGlass5
			{
				armor = 0.05;
			};
			class HitGlass6: HitGlass6
			{
				armor = 0.05;
			};
		};
		getInAction = "GetInOffroad";
		getOutAction = "GetOutLow";
		cargoGetInAction[] = {"GetInLow"};
		cargoGetOutAction[] = {"GetOutLow"};
		memorypointtrackbll = "Stopa ZLL";
		memorypointtrackblr = "Stopa ZLP";
		memorypointtrackbrl = "Stopa ZPL";
		memorypointtrackbrr = "Stopa ZPP";
		memorypointtrackfll = "Stopa PLL";
		memorypointtrackflr = "Stopa PLP";
		memorypointtrackfrl = "Stopa PPL";
		memorypointtrackfrr = "Stopa PPP";
		dustFrontLeftPos = "Stopa PPL";
		dustFrontRightPos = "Stopa PLP";
		dustBackLeftPos = "Stopa ZLL";
		dustBackRightPos = "Stopa ZLP";
		class Damage
		{
			mat[] = {"rds_a2port_civ\Lada\Data\Lada_chrome.rvmat","rds_a2port_civ\Lada\Data\Lada_chrome.rvmat","rds_a2port_civ\Lada\Data\Lada_chrome_destruct.rvmat","rds_a2port_civ\Lada\Data\Lada_glass.rvmat","rds_a2port_civ\Lada\Data\Lada_glass_damage.rvmat","rds_a2port_civ\Lada\Data\Lada_glass_damage.rvmat","rds_a2port_civ\Lada\Data\Lada_glass_in.rvmat","rds_a2port_civ\Lada\Data\Lada_glass_in_damage.rvmat","rds_a2port_civ\Lada\Data\Lada_glass_in_damage.rvmat","rds_a2port_civ\Lada\Data\Lada_mat.rvmat","rds_a2port_civ\Lada\Data\Lada_mat_damage.rvmat","rds_a2port_civ\Lada\Data\Lada_mat_destruct.rvmat","a3\data_f\default.rvmat","a3\data_f\default.rvmat","a3\data_f\default_destruct.rvmat"};
			tex[] = {};
		};
		class Exhausts
		{
			class Exhaust1
			{
				position = "vyfuk start";
				direction = "vyfuk konec";
				effect = "ExhaustEffectOffroad";
			};
		};
		class Reflectors
		{
			class LSvetla
			{
				color[] = {800,900,650};
				ambient[] = {2,2,2};
				position = "L svetlo";
				direction = "konec L svetla";
				hitpoint = "L svetlo";
				selection = "L svetlo";
				size = 1;
				innerAngle = 30;
				outerAngle = 120;
				coneFadeCoef = 10;
				intensity = 2;
				useFlare = 1;
				dayLight = 1;
				flareSize = 1;
				class Attenuation
				{
					start = 2;
					constant = 0;
					linear = 0.1;
					quadratic = 0.01;
					hardLimitStart = 100;
					hardLimitEnd = 300;
				};
			};
			class RSvetla: LSvetla
			{
				position = "P svetlo";
				direction = "konec P svetla";
				hitpoint = "P svetlo";
				selection = "P svetlo";
			};
		};
		aggregateReflectors[] = {{ "LSvetla","RSvetla" }};
		class RenderTargets
		{
			class LeftMirror
			{
				renderTarget = "rendertarget0";
				class CameraView1
				{
					pointPosition = "m1p";
					pointDirection = "m1d";
					renderQuality = 2;
					renderVisionMode = 4;
					fov = 0.5;
				};
			};
			class RightMirror
			{
				renderTarget = "rendertarget1";
				class CameraView1
				{
					pointPosition = "m2p";
					pointDirection = "m2d";
					renderQuality = 2;
					renderVisionMode = 4;
					fov = 0.7;
				};
			};
			class BackMirror
			{
				renderTarget = "rendertarget2";
				class CameraView1
				{
					pointPosition = "m3p";
					pointDirection = "m3d";
					renderQuality = 2;
					renderVisionMode = 4;
					fov = 0.7;
				};
			};
		};
		//Lada VAZ_2103
		enginePower = 350; //69.9
		maxOmega = 513.13; //513.13
		peakTorque = 320; //186.3
		idleRPM = 600;
		redRpm = 4900;
		terrainCoef = 3; //5
		turnCoef = 2.0;
		precision = 10;
		brakeDistance = 3;
		acceleration = 60; //15
		fireResistance = 5;
		thrustDelay = 0.2;
		brakeIdleSpeed = 1.78;
		maxSpeed = 146; //156
		fuelCapacity = 12; //50
		wheelCircumference = 2.04;
		antiRollbarForceCoef = 1.9;
		antiRollbarForceLimit = 5;
		antiRollbarSpeedMin = 10;
		antiRollbarSpeedMax = 150;
		changeGearMinEffectivity[] = {0.95,0.15,0.85,0.95,0.95,0.95};
		class complexGearbox
		{
			GearboxRatios[] = {"R1",-3.54,"N",0,"D1",2.5,"D2",1.26,"D3",0.45,"D4",0.10};//"R1",-3.54,"N",0,"D1",3.5,"D2",2.26,"D3",1.45,"D4",1.0
			TransmissionRatios[] = {"High",4.1};
			gearBoxMode = "auto";
			moveOffGear = 1;
			driveString = "D";
			neutralString = "N";
			reverseString = "R";
		};
		simulation = "carx";
		dampersBumpCoef = 4;
		differentialType = "rear_limited";
		frontRearSplit = 0.5;
		frontBias = 1.5;
		rearBias = 3.5;
		centreBias = 3.3;
		clutchStrength = 75;
		dampingRateFullThrottle = 0.08;
		dampingRateZeroThrottleClutchEngaged = 1.35;
		dampingRateZeroThrottleClutchDisengaged = 0.35;
		torqueCurve[] = {{ "0/6000","0/106" },{ "798/6000","89/106" },{ "1398/6000","92/106" },{ "2298/6000","98/106" },{ "3402/6000","106/106" },{ "4902/6000","103/106" },{ "5598/6000","95/106" },{ "6300/6000","0/106" }};
		switchTime = 0.31;
		latency = 1;
		class Wheels
		{
			class LF
			{
				width = "0.05";
				boneName = "wheel_1_1_damper";
				steering = 1;
				side = "left";
				center = "wheel_1_1_axis";
				boundary = "wheel_1_1_bound";
				mass = 17;
				MOI = 19.0;
				dampingRate = 0.1;
				maxBrakeTorque = 1200;
				maxHandBrakeTorque = 0;
				suspTravelDirection[] = {0,-1,0};
				suspForceAppPointOffset = "wheel_1_1_axis";
				tireForceAppPointOffset = "wheel_1_1_axis";
				maxCompression = 0.15;
				mMaxDroop = 0.15;
				sprungMass = 185.5;
				springStrength = 45025;
				springDamperRate = 4700;
				longitudinalStiffnessPerUnitGravity = 10000;
				latStiffX = 1.5;
				latStiffY = 15.0;
				frictionVsSlipGraph[] = {{ 0,1.11 },{ 0.5,1.1 },{ 1,1 }};
			};
			class LR: LF
			{
				boneName = "wheel_1_2_damper";
				steering = 0;
				center = "wheel_1_2_axis";
				boundary = "wheel_1_2_bound";
				suspForceAppPointOffset = "wheel_1_2_axis";
				tireForceAppPointOffset = "wheel_1_2_axis";
				maxHandBrakeTorque = 2000;
			};
			class RF: LF
			{
				boneName = "wheel_2_1_damper";
				center = "wheel_2_1_axis";
				boundary = "wheel_2_1_bound";
				suspForceAppPointOffset = "wheel_2_1_axis";
				tireForceAppPointOffset = "wheel_2_1_axis";
				steering = 1;
				side = "right";
			};
			class RR: RF
			{
				boneName = "wheel_2_2_damper";
				steering = 0;
				center = "wheel_2_2_axis";
				boundary = "wheel_2_2_bound";
				suspForceAppPointOffset = "wheel_2_2_axis";
				tireForceAppPointOffset = "wheel_2_2_axis";
				maxHandBrakeTorque = 2000;
			};
		};
	};
	class RDS_Lada_Civ_Base: RDS_Lada_Base
	{
		accuracy = 0.5;
		crew = "RDS_Citizen1";
		faction = "rds_rus_civ";
		side = 3;
	};
	class RDS_Lada_Civ_01: RDS_Lada_Civ_Base
	{
		scope = 2;
	};
	class RDS_Lada_Civ_02: RDS_Lada_Civ_01
	{
		scope = 2;
		crew = "RDS_Citizen3";
		displayName = "Lada VAZ-2103 (Rouge)";
		// hiddenselections[] = {"Camo1"};
		hiddenselectionstextures[] = {"rds_a2port_civ\Lada\Data\Lada_red_CO.paa"};
	};
	class RDS_Lada_Civ_03: RDS_Lada_Civ_01
	{
		crew = "RDS_Citizen2";
		// hiddenselections[] = {"Camo1","Camo2"};
		displayName = "Lada VAZ-2103 (Vert)";
		hiddenselectionstextures[] = {"rds_a2port_civ\Lada\Data\lada_eciv1_co.paa","rds_a2port_civ\Lada\Data\Lada_glass_ECIV1_CA.paa"};
	};
	class RDS_Lada_Civ_04: RDS_Lada_Civ_03
	{
		crew = "RDS_Citizen4";
		displayName = "Lada VAZ-2103 (Gitan)";
		hiddenselectionstextures[] = {"rds_a2port_civ\Lada\Data\lada_eciv2_co.paa","rds_a2port_civ\Lada\Data\Lada_glass_ECIV2_CA.paa"};
	};
	class RDS_Lada_Civ_05: RDS_Lada_Civ_01
	{
		crew = "RDS_Policeman";
		displayName = "Lada VAZ-2103 (Militaire)";
		model = "\rds_a2port_civ\Lada\Lada_LM";
		hiddenselectionstextures[] = {"rds_a2port_civ\Lada\Data\Lada_red_CO.paa"};
		class Reflectors: Reflectors
		{
			class Left: LSvetla{};
			class Right: RSvetla{};
			class Majak1
			{
				ambient[] = {0.01,0.01,0.1,1};
				brightness = 0.5;
				color[] = {0.1,0.2,0.8,1};
				direction = "majak ligth 1 end";
				hitpoint = "";
				position = "majak ligth 1 start";
				selection = "";
				size = 0.5;
			};
			class Majak2: Majak1
			{
				direction = "majak ligth 2 end";
				hitpoint = "";
				position = "majak ligth 2 start";
				selection = "";
			};
		};
	};
	class RDS_Lada_Wreck: Wreck_base_F
	{
		_generalmacro = "RDS_Lada_Wreck";
		author = "Bohemia Interactive";
		displayname = "Lada VAZ-2103 (épave)";
		icon = "iconObject_2x5";
		mapsize = 4.91;
		model = "\rds_a2port_civ\Lada\Lada_wrecked";
		scope = 2;
	};
	class RDS_S1203_Base: Car_F
	{
		model = "\rds_a2port_civ\S1203\S1203";
		icon = "\rds_a2port_civ\data\map_ico\icon_S1203_ca.paa";
		picture = "\rds_a2port_civ\data\ico\Picture_S1203_ca.paa";
		mapsize = 6;
		displayName = "Van Skoda 1203";
		htmax = 1800;
		htmin = 60;
		mfact = 0;
		mfmax = 100;
		tbody = 0;
		driveraction = "S1203_driver";
		attenuationEffectType = "OpenCarAttenuation";
		armor = 22;
		cost = 10000;
		transportMaxBackpacks = 6;
		transportSoldier = 7; //5
		wheelDamageRadiusCoef = 0.9;
		wheelDestroyRadiusCoef = 0.4;
		maxFordingDepth = 0.5;
		waterResistance = 1;
		crewCrashProtection = 0.25;
		driverLeftHandAnimName = "drivewheel";
		driverRightHandAnimName = "";
		driverRightLegAnimName = "pedalR";
		soundAttenuationCargo[] = {1,0};
		insideSoundCoef = 1;
		soundGetIn[] = {"rds_a2port_civ\data\sounds\lada_door",0.4466836,1};
		soundGetOut[] = {"rds_a2port_civ\data\sounds\lada_door",0.4466836,1,40};
		soundDammage[] = {"",0.56234133,1};
		soundEngineOnInt[] = {"rds_a2port_civ\data\sounds\lada_int_start",0.31622776,1.0};
		soundEngineOnExt[] = {"rds_a2port_civ\data\sounds\lada_ext_start",0.39810717,1.0,200};
		soundEngineOffInt[] = {"rds_a2port_civ\data\sounds\lada_int_stop",0.31622776,1.0};
		soundEngineOffExt[] = {"rds_a2port_civ\data\sounds\lada_ext_stop",0.39810717,1.0,200};
		buildCrash0[] = {"A3\sounds_f\Vehicles\soft\noises\crash_building_01",1.0,1,150};
		buildCrash1[] = {"A3\sounds_f\Vehicles\soft\noises\crash_building_02",1.0,1,150};
		buildCrash2[] = {"A3\sounds_f\Vehicles\soft\noises\crash_building_03",1.0,1,150};
		buildCrash3[] = {"A3\sounds_f\Vehicles\soft\noises\crash_building_04",1.0,1,150};
		soundBuildingCrash[] = {"buildCrash0",0.25,"buildCrash1",0.25,"buildCrash2",0.25,"buildCrash3",0.25};
		WoodCrash0[] = {"A3\sounds_f\Vehicles\soft\noises\crash_mix_wood_01",1.0,1,100};
		WoodCrash1[] = {"A3\sounds_f\Vehicles\soft\noises\crash_mix_wood_02",1.0,1,100};
		WoodCrash2[] = {"A3\sounds_f\Vehicles\soft\noises\crash_mix_wood_03",1.0,1,100};
		WoodCrash3[] = {"A3\sounds_f\Vehicles\soft\noises\crash_mix_wood_04",1.0,1,100};
		WoodCrash4[] = {"A3\sounds_f\Vehicles\soft\noises\crash_mix_wood_05",1.0,1,100};
		WoodCrash5[] = {"A3\sounds_f\Vehicles\soft\noises\crash_mix_wood_06",1.0,1,100};
		soundWoodCrash[] = {"woodCrash0",0.166,"woodCrash1",0.166,"woodCrash2",0.166,"woodCrash3",0.166,"woodCrash4",0.166,"woodCrash5",0.166};
		ArmorCrash0[] = {"A3\sounds_f\Vehicles\soft\noises\crash_vehicle_01",1.0,1,200};
		ArmorCrash1[] = {"A3\sounds_f\Vehicles\soft\noises\crash_vehicle_02",1.0,1,200};
		ArmorCrash2[] = {"A3\sounds_f\Vehicles\soft\noises\crash_vehicle_03",1.0,1,200};
		ArmorCrash3[] = {"A3\sounds_f\Vehicles\soft\noises\crash_vehicle_04",1.0,1,200};
		soundArmorCrash[] = {"ArmorCrash0",0.25,"ArmorCrash1",0.25,"ArmorCrash2",0.25,"ArmorCrash3",0.25};
		class Sounds
		{
			class Idle_ext
			{
				sound[] = {"rds_a2port_civ\data\sounds\lada_ext_Idle",0.31622776,1,100};
				frequency = "0.9	+	((rpm/	6000) factor[(200/	6000),(1150/	6000)])*0.2";
				volume = "engineOn*camPos*(((rpm/	6000) factor[(200/	6000),(500/	6000)])	*	((rpm/	6000) factor[(900/	6000),(700/	6000)]))";
			};
			class Engine
			{
				sound[] = {"rds_a2port_civ\data\sounds\lada_ext_acceleration",0.31622776,1,200};
				frequency = "0.8	+	((rpm/	6000) factor[(900/	6000),(2100/	6000)])*0.2";
				volume = "engineOn*camPos*(((rpm/	6000) factor[(870/	6000),(1100/	6000)])	*	((rpm/	6000) factor[(2100/	6000),(1300/	6000)]))";
			};
			class Engine1_ext
			{
				sound[] = {"rds_a2port_civ\data\sounds\lada_ext_low",0.35481337,1,225};
				frequency = "0.8	+		((rpm/	6000) factor[(1300/	6000),(3100/	6000)])*0.2";
				volume = "engineOn*camPos*(((rpm/	6000) factor[(1250/	6000),(2050/	6000)])	*	((rpm/	6000) factor[(3100/	6000),(2300/	6000)]))";
			};
			class Engine2_ext
			{
				sound[] = {"rds_a2port_civ\data\sounds\lada_ext_low",0.35481337,1,250};
				frequency = "0.8	+	((rpm/	6000) factor[(2200/	6000),(4100/	6000)])*0.2";
				volume = "engineOn*camPos*(((rpm/	6000) factor[(2250/	6000),(3050/	6000)])	*	((rpm/	6000) factor[(4100/	6000),(3300/	6000)]))";
			};
			class Engine3_ext
			{
				sound[] = {"rds_a2port_civ\data\sounds\lada_ext_mid",0.39810717,1,275};
				frequency = "0.8	+	((rpm/	6000) factor[(3300/	6000),(4900/	6000)])*0.2";
				volume = "engineOn*camPos*(((rpm/	6000) factor[(3250/	6000),(4050/	6000)])	*	((rpm/	6000) factor[(4870/	6000),(4200/	6000)]))";
			};
			class Engine4_ext
			{
				sound[] = {"rds_a2port_civ\data\sounds\lada_ext_high",0.4466836,1,300};
				frequency = "0.8	+	((rpm/	6000) factor[(4200/	6000),(6200/	6000)])*0.2";
				volume = "engineOn*camPos*(((rpm/	6000) factor[(4150/	6000),(4800/	6000)])	*	((rpm/	6000) factor[(6150/	6000),(5150/	6000)]))";
			};
			class Engine5_ext
			{
				sound[] = {"rds_a2port_civ\data\sounds\lada_ext_high",0.5011872,1,300};
				frequency = "0.95	+	((rpm/	6000) factor[(5100/	6000),(6900/	6000)])*0.15";
				volume = "engineOn*camPos*((rpm/	6000) factor[(5100/	6000),(6100/	6000)])";
			};
			class IdleThrust
			{
				sound[] = {"rds_a2port_civ\data\sounds\lada_ext_Idle",0.5011872,1,200};
				frequency = "0.9	+	((rpm/	6000) factor[(200/	6000),(1150/	6000)])*0.2";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	6000) factor[(200/	6000),(500/	6000)])	*	((rpm/	6000) factor[(900/	6000),(700/	6000)]))";
			};
			class EngineThrust
			{
				sound[] = {"rds_a2port_civ\data\sounds\lada_ext_acceleration",0.56234133,1,250};
				frequency = "0.8	+	((rpm/	6000) factor[(900/	6000),(2100/	6000)])*0.2";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	6000) factor[(870/	6000),(1100/	6000)])	*	((rpm/	6000) factor[(2100/	6000),(1300/	6000)]))";
			};
			class Engine1_Thrust_ext
			{
				sound[] = {"rds_a2port_civ\data\sounds\lada_ext_low",0.63095737,1,275};
				frequency = "0.8	+		((rpm/	6000) factor[(1300/	6000),(3100/	6000)])*0.2";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	6000) factor[(1250/	6000),(2050/	6000)])	*	((rpm/	6000) factor[(3100/	6000),(2300/	6000)]))";
			};
			class Engine2_Thrust_ext
			{
				sound[] = {"rds_a2port_civ\data\sounds\lada_ext_low",0.70794576,1,300};
				frequency = "0.8	+	((rpm/	6000) factor[(2200/	6000),(4100/	6000)])*0.2";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	6000) factor[(2250/	6000),(3050/	6000)])	*	((rpm/	6000) factor[(4100/	6000),(3300/	6000)]))";
			};
			class Engine3_Thrust_ext
			{
				sound[] = {"rds_a2port_civ\data\sounds\lada_ext_mid",0.7943282,1,325};
				frequency = "0.8	+	((rpm/	6000) factor[(3300/	6000),(4900/	6000)])*0.2";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	6000) factor[(3250/	6000),(4050/	6000)])	*	((rpm/	6000) factor[(4870/	6000),(4200/	6000)]))";
			};
			class Engine4_Thrust_ext
			{
				sound[] = {"rds_a2port_civ\data\sounds\lada_ext_high",0.8912509,1,350};
				frequency = "0.8	+	((rpm/	6000) factor[(4200/	6000),(6200/	6000)])*0.3";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	6000) factor[(4150/	6000),(4800/	6000)])	*	((rpm/	6000) factor[(6150/	6000),(5150/	6000)]))";
			};
			class Engine5_Thrust_ext
			{
				sound[] = {"rds_a2port_civ\data\sounds\lada_ext_high",1.0,1,375};
				frequency = "0.9	+	((rpm/	6000) factor[(5100/	6000),(6900/	6000)])*0.2";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*((rpm/	6000) factor[(5100/	6000),(6100/	6000)])";
			};
			class Idle_int
			{
				sound[] = {"rds_a2port_civ\data\sounds\lada_int_Idle",0.2238721,1};
				frequency = "0.9	+	((rpm/	6000) factor[(200/	6000),(1150/	6000)])*0.2";
				volume = "engineOn*(1-camPos)*(((rpm/	6000) factor[(200/	6000),(500/	6000)])	*	((rpm/	6000) factor[(900/	6000),(700/	6000)]))";
			};
			class Engine_int
			{
				sound[] = {"rds_a2port_civ\data\sounds\lada_int_acceleration",0.25118864,1};
				frequency = "0.8	+	((rpm/	6000) factor[(900/	6000),(2100/	6000)])*0.2";
				volume = "engineOn*(1-camPos)*(((rpm/	6000) factor[(870/	6000),(1100/	6000)])	*	((rpm/	6000) factor[(2100/	6000),(1300/	6000)]))";
			};
			class Engine1_int
			{
				sound[] = {"rds_a2port_civ\data\sounds\lada_int_low",0.17782794,1};
				frequency = "0.8	+		((rpm/	6000) factor[(1300/	6000),(3100/	6000)])*0.2";
				volume = "engineOn*(1-camPos)*(((rpm/	6000) factor[(1250/	6000),(2050/	6000)])	*	((rpm/	6000) factor[(3100/	6000),(2300/	6000)]))";
			};
			class Engine2_int
			{
				sound[] = {"rds_a2port_civ\data\sounds\lada_int_low",0.31622776,1};
				frequency = "0.8	+	((rpm/	6000) factor[(2200/	6000),(4100/	6000)])*0.2";
				volume = "engineOn*(1-camPos)*(((rpm/	6000) factor[(2250/	6000),(3050/	6000)])	*	((rpm/	6000) factor[(4100/	6000),(3300/	6000)]))";
			};
			class Engine3_int
			{
				sound[] = {"rds_a2port_civ\data\sounds\lada_int_mid",0.35481337,1};
				frequency = "0.8	+	((rpm/	6000) factor[(3300/	6000),(4900/	6000)])*0.2";
				volume = "engineOn*(1-camPos)*(((rpm/	6000) factor[(3250/	6000),(4050/	6000)])	*	((rpm/	6000) factor[(4870/	6000),(4200/	6000)]))";
			};
			class Engine4_int
			{
				sound[] = {"rds_a2port_civ\data\sounds\lada_int_high",0.39810717,1};
				frequency = "0.8	+	((rpm/	6000) factor[(4200/	6000),(6200/	6000)])*0.2";
				volume = "engineOn*(1-camPos)*(((rpm/	6000) factor[(4150/	6000),(4800/	6000)])	*	((rpm/	6000) factor[(6150/	6000),(5150/	6000)]))";
			};
			class Engine5_int
			{
				sound[] = {"rds_a2port_civ\data\sounds\lada_int_high",0.39810717,1};
				frequency = "0.95	+	((rpm/	6000) factor[(5100/	6000),(6900/	6000)])*0.15";
				volume = "engineOn*(1-camPos)*((rpm/	6000) factor[(5100/	6000),(6100/	6000)])";
			};
			class IdleThrust_int
			{
				sound[] = {"rds_a2port_civ\data\sounds\lada_int_acceleration",0.31622776,1};
				frequency = "0.9	+	((rpm/	6000) factor[(200/	6000),(1150/	6000)])*0.2";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	6000) factor[(200/	6000),(500/	6000)])	*	((rpm/	6000) factor[(900/	6000),(700/	6000)]))";
			};
			class EngineThrust_int
			{
				sound[] = {"rds_a2port_civ\data\sounds\lada_int_low",0.35481337,1};
				frequency = "0.8	+	((rpm/	6000) factor[(900/	6000),(2100/	6000)])*0.2";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	6000) factor[(870/	6000),(1100/	6000)])	*	((rpm/	6000) factor[(2100/	6000),(1300/	6000)]))";
			};
			class Engine1_Thrust_int
			{
				sound[] = {"rds_a2port_civ\data\sounds\lada_int_low",0.39810717,1};
				frequency = "0.8	+		((rpm/	6000) factor[(1300/	6000),(3100/	6000)])*0.2";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	6000) factor[(1250/	6000),(2050/	6000)])	*	((rpm/	6000) factor[(3100/	6000),(2300/	6000)]))";
			};
			class Engine2_Thrust_int
			{
				sound[] = {"rds_a2port_civ\data\sounds\lada_int_mid",0.4466836,1};
				frequency = "0.8	+	((rpm/	6000) factor[(2200/	6000),(4100/	6000)])*0.2";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	6000) factor[(2250/	6000),(3050/	6000)])	*	((rpm/	6000) factor[(4100/	6000),(3300/	6000)]))";
			};
			class Engine3_Thrust_int
			{
				sound[] = {"rds_a2port_civ\data\sounds\lada_int_mid",0.5011872,1};
				frequency = "0.8	+	((rpm/	6000) factor[(3300/	6000),(4900/	6000)])*0.2";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	6000) factor[(3250/	6000),(4050/	6000)])	*	((rpm/	6000) factor[(4870/	6000),(4200/	6000)]))";
			};
			class Engine4_Thrust_int
			{
				sound[] = {"rds_a2port_civ\data\sounds\lada_int_high",0.56234133,1};
				frequency = "0.8	+	((rpm/	6000) factor[(4200/	6000),(6200/	6000)])*0.3";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	6000) factor[(4150/	6000),(4800/	6000)])	*	((rpm/	6000) factor[(6150/	6000),(5150/	6000)]))";
			};
			class Engine5_Thrust_int
			{
				sound[] = {"rds_a2port_civ\data\sounds\lada_int_high",0.63095737,1};
				frequency = "0.9	+	((rpm/	6000) factor[(5100/	6000),(6900/	6000)])*0.2";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*((rpm/	6000) factor[(5100/	6000),(6100/	6000)])";
			};
			class Movement
			{
				sound = "soundEnviron";
				frequency = "1";
				volume = "0";
			};
			class TiresRockOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\ext_tires_dirt_soft_1",0.70794576,1.0,60};
				frequency = "1";
				volume = "camPos*rock*(speed factor[2, 20])";
			};
			class TiresSandOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\ext-tires-sand1",0.70794576,1.0,60};
				frequency = "1";
				volume = "camPos*sand*(speed factor[2, 20])";
			};
			class TiresGrassOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\ext_tires_dirt_soft_2",0.70794576,1.0,60};
				frequency = "1";
				volume = "camPos*grass*(speed factor[2, 20])";
			};
			class TiresMudOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\ext-tires-mud2",0.70794576,1.0,60};
				frequency = "1";
				volume = "camPos*mud*(speed factor[2, 20])";
			};
			class TiresGravelOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\ext_tires_gravel_1",0.70794576,1.0,60};
				frequency = "1";
				volume = "camPos*gravel*(speed factor[2, 20])";
			};
			class TiresAsphaltOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\ext_tires_asfalt_2",0.70794576,1.0,60};
				frequency = "1";
				volume = "camPos*asphalt*(speed factor[2, 20])";
			};
			class NoiseOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\noise_ext_car_3",0.56234133,1.0,90};
				frequency = "1";
				volume = "camPos*(damper0 max 0.02)*(speed factor[0, 8])";
			};
			class TiresRockIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\int_tires_dirt_soft_1",0.70794576,1.0};
				frequency = "1";
				volume = "(1-camPos)*rock*(speed factor[2, 20])";
			};
			class TiresSandIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\int-tires-sand2",0.70794576,1.0};
				frequency = "1";
				volume = "(1-camPos)*sand*(speed factor[2, 20])";
			};
			class TiresGrassIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\int_tires_dirt_soft_2",0.70794576,1.0};
				frequency = "1";
				volume = "(1-camPos)*grass*(speed factor[2, 20])";
			};
			class TiresMudIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\int-tires-mud2",0.70794576,1.0};
				frequency = "1";
				volume = "(1-camPos)*mud*(speed factor[2, 20])";
			};
			class TiresGravelIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\int_tires_gravel_1",0.70794576,1.0};
				frequency = "1";
				volume = "(1-camPos)*gravel*(speed factor[2, 20])";
			};
			class TiresAsphaltIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\int_tires_asfalt_2",0.70794576,1.0};
				frequency = "1";
				volume = "(1-camPos)*asphalt*(speed factor[2, 20])";
			};
			class NoiseIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\noise_int_car_3",0.15848932,1.0};
				frequency = "1";
				volume = "(damper0 max 0.1)*(speed factor[0, 8])*(1-camPos)";
			};
			class breaking_ext_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_04",0.70794576,1,80};
				frequency = 1;
				volume = "engineOn*camPos*asphalt*(LongSlipDrive Factor[-0.1, -0.4])*(Speed Factor[2, 15])";
			};
			class acceleration_ext_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02",0.70794576,1,80};
				frequency = 1;
				volume = "engineOn*camPos*asphalt*(LongSlipDrive Factor[0.1, 0.4])*(Speed Factor[15, 2])";
			};
			class turn_left_ext_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02",0.70794576,1,80};
				frequency = 1;
				volume = "engineOn*camPos*asphalt*(latSlipDrive Factor[0.1, 0.4])*(Speed Factor[2, 15])";
			};
			class turn_right_ext_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02",0.70794576,1,80};
				frequency = 1;
				volume = "engineOn*camPos*asphalt*(latSlipDrive Factor[-0.1, -0.4])*(Speed Factor[2, 15])";
			};
			class breaking_ext_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_14_dirt_breaking",0.70794576,1,60};
				frequency = 1;
				volume = "engineOn*camPos*(1-asphalt)*(LongSlipDrive Factor[-0.1, -0.4])*(Speed Factor[1, 15])";
			};
			class acceleration_ext_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_16_dirt_acceleration",0.70794576,1,60};
				frequency = 1;
				volume = "engineOn*camPos*(1-asphalt)*(LongSlipDrive Factor[0.1, 0.4])*(Speed Factor[15, 1])";
			};
			class turn_left_ext_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_18_dirt",0.70794576,1,60};
				frequency = 1;
				volume = "engineOn*camPos*(1-asphalt)*(latSlipDrive Factor[0.1, 0.4])*(Speed Factor[1, 15])";
			};
			class turn_right_ext_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_18_dirt",0.70794576,1,60};
				frequency = 1;
				volume = "engineOn*camPos*(1-asphalt)*(latSlipDrive Factor[-0.1, -0.4])*(Speed Factor[1, 15])";
			};
			class breaking_int_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_04_int",0.31622776,1};
				frequency = 1;
				volume = "engineOn*asphalt*(1-camPos)*(LongSlipDrive Factor[-0.1, -0.4])*(Speed Factor[1, 15])";
			};
			class acceleration_int_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02_int",0.31622776,1};
				frequency = 1;
				volume = "engineOn*asphalt*(1-camPos)*(LongSlipDrive Factor[0.1, 0.4])*(Speed Factor[15, 1])";
			};
			class turn_left_int_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02_int",0.31622776,1};
				frequency = 1;
				volume = "engineOn*asphalt*(1-camPos)*(latSlipDrive Factor[0.1, 0.4])*(Speed Factor[1, 15])";
			};
			class turn_right_int_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02_int",0.31622776,1};
				frequency = 1;
				volume = "engineOn*asphalt*(1-camPos)*(latSlipDrive Factor[-0.1, -0.4])*(Speed Factor[1, 15])";
			};
			class breaking_int_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_14_dirt_breaking_int",0.31622776,1};
				frequency = 1;
				volume = "engineOn*(1-asphalt)*(1-camPos)*(LongSlipDrive Factor[-0.1, -0.4])*(Speed Factor[1, 15])";
			};
			class acceleration_int_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_16_dirt_acceleration_int",0.31622776,1};
				frequency = 1;
				volume = "engineOn*(1-asphalt)*(1-camPos)*(LongSlipDrive Factor[0.1, 0.4])*(Speed Factor[15, 1])";
			};
			class turn_left_int_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_18_dirt_int",0.31622776,1};
				frequency = 1;
				volume = "engineOn*(1-asphalt)*(1-camPos)*(latSlipDrive Factor[0.1, 0.4])*(Speed Factor[1, 15])";
			};
			class turn_right_int_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_18_dirt_int",0.31622776,1};
				frequency = 1;
				volume = "engineOn*(1-asphalt)*(1-camPos)*(latSlipDrive Factor[-0.1, -0.4])*(Speed Factor[1, 15])";
			};
		};
		class Turrets{};
		cargoaction[] = {"S1203_Cargo","S1203_Cargo02","S1203_Cargo01","S1203_cargo03"};
		hiddenselections[] = {"camo1","camo2"};
		hiddenselectionstextures[] = {"rds_a2port_civ\S1203\data\s1203_co.paa","rds_a2port_civ\S1203\data\s1203_glass_ca.paa"};
		memorypointsgetincargo[] = {"pos cargo 1","pos cargo 3","pos cargo 3","pos cargo 4"};
		memorypointsgetincargodir[] = {"pos cargo dir 1","pos cargo dir 3","pos cargo 3","pos cargo dir 4"};
		driverDoor = "Door_LF";
		cargoDoors[] = {"Door_RF","Door_RB","Door_RB","Door_RC"};
		driverCompartments = "Compartment1";
		cargoCompartments[] = {"Compartment1","Compartment2","Compartment2","Compartment3"};
		class AnimationSources: AnimationSources
		{
			class Door_LF
			{
				source = "door";
				animPeriod = 1.0;
			};
			class Door_RF: Door_LF{};
			class Door_RB: Door_LF{};
			class Door_RC: Door_LF{};
		};
		class UserActions
		{
			class openDoors
			{
				displayName = "Ouvrir le coffre";
				position = "pos cargo dir 5";
				radius = 2;
				showWindow = 0;
				condition = "(this animationPhase ""BackDoor1"" < 0.5)";
				statement = "this animateDoor [""Door_RC"",1]";
				onlyForPlayer = 0;
			};
			class closeDoors: openDoors
			{
				displayName = "Fermer le coffre";
				condition = "(this animationPhase ""BackDoor1"" > 0.5)";
				statement = "this animateDoor [""Door_RC"",0]";
			};
		};
		class HitPoints: HitPoints
		{
			class HitLFWheel: HitLFWheel
			{
				armor = 0.175;
				passThrough = 0.3;
			};
			class HitLF2Wheel: HitLF2Wheel
			{
				armor = 0.175;
				passThrough = 0.3;
			};
			class HitRFWheel: HitRFWheel
			{
				armor = 0.175;
				passThrough = 0.3;
			};
			class HitRF2Wheel: HitRF2Wheel
			{
				armor = 0.175;
				passThrough = 0.3;
			};
			class HitFuel
			{
				armor = 0.5;
				material = -1;
				name = "palivo";
				visual = "";
				passThrough = 0.2;
			};
			class HitEngine
			{
				armor = 0.5;
				material = -1;
				name = "motor";
				visual = "";
				passThrough = 0.2;
			};
			class HitBody: HitBody
			{
				name = "karoserie";
				visual = "camo1";
				passThrough = 1;
			};
			class HitGlass1: HitGlass1
			{
				armor = 0.1;
			};
			class HitGlass2: HitGlass2
			{
				armor = 0.05;
			};
			class HitGlass3: HitGlass3
			{
				armor = 0.05;
			};
			class HitGlass4: HitGlass4
			{
				visual = "glass4";
				armor = 0.05;
			};
			class HitGlass5: HitGlass5
			{
				armor = 0.05;
			};
			class HitGlass6: HitGlass6
			{
				armor = 0.05;
			};
		};
		getInAction = "GetInOffroad";
		getOutAction = "GetOutLow";
		cargoGetInAction[] = {"GetInLow"};
		cargoGetOutAction[] = {"GetOutLow"};
		memorypointtrackbll = "Stopa ZLL";
		memorypointtrackblr = "Stopa ZLP";
		memorypointtrackbrl = "Stopa ZPL";
		memorypointtrackbrr = "Stopa ZPP";
		memorypointtrackfll = "Stopa PLL";
		memorypointtrackflr = "Stopa PLP";
		memorypointtrackfrl = "Stopa PPL";
		memorypointtrackfrr = "Stopa PPP";
		dustFrontLeftPos = "Stopa PPL";
		dustFrontRightPos = "Stopa PLP";
		dustBackLeftPos = "Stopa ZLL";
		dustBackRightPos = "Stopa ZLP";
		class Damage
		{
			mat[] = {"rds_a2port_civ\S1203\Data\s1203_mat.rvmat","rds_a2port_civ\S1203\Data\s1203_mat_damage.rvmat","rds_a2port_civ\S1203\Data\s1203_mat_destruct.rvmat","rds_a2port_civ\S1203\Data\s1203_glass.rvmat","rds_a2port_civ\S1203\Data\s1203_glass_damage.rvmat","rds_a2port_civ\S1203\Data\s1203_glass_damage.rvmat","rds_a2port_civ\S1203\Data\s1203_glass_in.rvmat","rds_a2port_civ\S1203\Data\s1203_glass_in_damage.rvmat","rds_a2port_civ\S1203\Data\s1203_glass_in_damage.rvmat","a3\data_f\default.rvmat","a3\data_f\default.rvmat","a3\data_f\default_destruct.rvmat"};
			tex[] = {};
		};
		class Exhausts
		{
			class Exhaust1
			{
				position = "vyfuk start";
				direction = "vyfuk konec";
				effect = "ExhaustEffectOffroad";
			};
		};
		class Reflectors
		{
			class LSvetla
			{
				color[] = {800,900,650};
				ambient[] = {2,2,2};
				position = "L svetlo";
				direction = "konec L svetla";
				hitpoint = "L svetlo";
				selection = "L svetlo";
				size = 1;
				innerAngle = 30;
				outerAngle = 120;
				coneFadeCoef = 10;
				intensity = 2;
				useFlare = 1;
				dayLight = 1;
				flareSize = 1;
				class Attenuation
				{
					start = 2;
					constant = 0;
					linear = 0.1;
					quadratic = 0.01;
					hardLimitStart = 100;
					hardLimitEnd = 300;
				};
			};
			class RSvetla: LSvetla
			{
				position = "P svetlo";
				direction = "konec P svetla";
				hitpoint = "P svetlo";
				selection = "P svetlo";
			};
		};
		aggregateReflectors[] = {{ "LSvetla","RSvetla" }};
		class RenderTargets
		{
			class LeftMirror
			{
				renderTarget = "rendertarget0";
				class CameraView1
				{
					pointPosition = "m1p";
					pointDirection = "m1d";
					renderQuality = 2;
					renderVisionMode = 4;
					fov = 0.5;
				};
			};
			class RightMirror
			{
				renderTarget = "rendertarget1";
				class CameraView1
				{
					pointPosition = "m2p";
					pointDirection = "m2d";
					renderQuality = 2;
					renderVisionMode = 4;
					fov = 0.7;
				};
			};
			class BackMirror
			{
				renderTarget = "rendertarget2";
				class CameraView1
				{
					pointPosition = "m3p";
					pointDirection = "m3d";
					renderQuality = 2;
					renderVisionMode = 4;
					fov = 0.7;
				};
			};
		};
		//Van S1203
		enginePower = 150; //69.9/100
		maxOmega = 513.13; //513.13-920
		peakTorque = 250; //186.3
		idleRPM = 600;
		redRpm = 4900; //4900-8900
		terrainCoef = 2; //5
		turnCoef = 2.0;
		precision = 10;
		brakeDistance = 3;
		acceleration = 45;//15
		fireResistance = 5;
		thrustDelay = 0.2;
		brakeIdleSpeed = 1.78;
		maxSpeed = 136; //156
		fuelCapacity = 12; //50
		wheelCircumference = 2.04;
		antiRollbarForceCoef = 1.9;
		antiRollbarForceLimit = 5;
		antiRollbarSpeedMin = 10;
		antiRollbarSpeedMax = 150;
		changeGearMinEffectivity[] = {0.95,0.15,0.85,0.95,0.95,0.95};
		class complexGearbox
		{
			GearboxRatios[] = {"R1",-3.54,"N",0,"D1",2.5,"D2",1.26,"D3",1.05,"D4",0.40}; //"R1",-3.54,"N",0,"D1",3.5,"D2",2.26,"D3",1.45,"D4",1.0
			TransmissionRatios[] = {"High",4.1};
			gearBoxMode = "auto";
			moveOffGear = 1;
			driveString = "D";
			neutralString = "N";
			reverseString = "R";
		};
		simulation = "carx";
		dampersBumpCoef = 4;
		differentialType = "rear_limited";
		frontRearSplit = 0.5;
		frontBias = 1.5;
		rearBias = 3.5;
		centreBias = 3.3;
		clutchStrength = 45;
		dampingRateFullThrottle = 0.08;
		dampingRateZeroThrottleClutchEngaged = 1.35;
		dampingRateZeroThrottleClutchDisengaged = 0.35;
		torqueCurve[] = {{ "0/5000","0/88" },{ "800/5000","57/88" },{ "1400/5000","70/88" },{ "2300/5000","81/88" },{ "3000/5000","88/88" },{ "3900/5000","85/88" },{ "4600/5000","77/88" },{ "5250/5000","0/88" }};
		switchTime = 0.31;
		latency = 1;
		class Wheels
		{
			class LF
			{
				width = "0.05";
				boneName = "wheel_1_1_damper";
				steering = 1;
				side = "left";
				center = "wheel_1_1_axis";
				boundary = "wheel_1_1_bound";
				mass = 23;
				MOI = 6.0;
				dampingRate = 0.1;
				maxBrakeTorque = 1200;
				maxHandBrakeTorque = 0;
				suspTravelDirection[] = {0,-1,0};
				suspForceAppPointOffset = "wheel_1_1_axis";
				tireForceAppPointOffset = "wheel_1_1_axis";
				maxCompression = 0.15;
				mMaxDroop = 0.15;
				sprungMass = 215.5;
				springStrength = 42025;
				springDamperRate = 5400;
				longitudinalStiffnessPerUnitGravity = 10000;
				latStiffX = 1.5;
				latStiffY = 15.0;
				frictionVsSlipGraph[] = {{ 0,1.11 },{ 0.5,1.1 },{ 1,1 }};
			};
			class LR: LF
			{
				boneName = "wheel_1_2_damper";
				steering = 0;
				center = "wheel_1_2_axis";
				boundary = "wheel_1_2_bound";
				suspForceAppPointOffset = "wheel_1_2_axis";
				tireForceAppPointOffset = "wheel_1_2_axis";
				maxHandBrakeTorque = 2000;
			};
			class RF: LF
			{
				boneName = "wheel_2_1_damper";
				center = "wheel_2_1_axis";
				boundary = "wheel_2_1_bound";
				suspForceAppPointOffset = "wheel_2_1_axis";
				tireForceAppPointOffset = "wheel_2_1_axis";
				steering = 1;
				side = "right";
			};
			class RR: RF
			{
				boneName = "wheel_2_2_damper";
				steering = 0;
				center = "wheel_2_2_axis";
				boundary = "wheel_2_2_bound";
				suspForceAppPointOffset = "wheel_2_2_axis";
				tireForceAppPointOffset = "wheel_2_2_axis";
				maxHandBrakeTorque = 2000;
			};
		};
	};
	class RDS_S1203_Civ_Base: RDS_S1203_Base
	{
		accuracy = 0.5;
		crew = "RDS_Worker3";
		faction = "rds_rus_civ";
		side = 3;
	};
	class RDS_S1203_Civ_01: RDS_S1203_Civ_Base
	{
		scope = 2;
		/*
		class EventHandlers: EventHandlers
		{
			init = "(_this select 0) execVM ""\rds_a2port_civ\s1203\scripts\randomize.sqf""";
		};*/
	};
	class RDS_S1203_Civ_02: RDS_S1203_Civ_Base
	{
		scope = 2;
		displayName = "Van Skoda 1203 (Ambulance)";
		model = "\rds_a2port_civ\S1203\S1203_ambulance";
		icon = "\rds_a2port_civ\data\map_ico\icon_s1203_amb_ca.paa";
		hiddenselections[] = {"camo1","camo2"};
		hiddenselectionstextures[] = {"rds_a2port_civ\S1203\data\s1203_ambulance_eur_co.paa","rds_a2port_civ\S1203\data\s1203_glass3_ca.paa"};
		cargoaction[] = {"S1203_Cargo","RDS_LyingWounded","RDS_LyingWounded"};
		transportSoldier = 3;
		memorypointsgetincargo[] = {"pos cargo 1","pos cargo 4"};
		memorypointsgetincargodir[] = {"pos cargo dir 1","pos cargo dir 4"};
		driverDoor = "Door_LF";
		cargoDoors[] = {"Door_RF","Door_RC"};
	};
	class RDS_S1203_Civ_03: RDS_S1203_Civ_02
	{
		displayName = "Van Skoda 1203 (Ambulance/TK)";
		hiddenselectionstextures[] = {"rds_a2port_civ\S1203\data\s1203_ambulance_co.paa","rds_a2port_civ\S1203\data\s1203_glass3_ca.paa"};
	};
	class RDS_Gaz24_Base: Car_F
	{
		model = "\rds_a2port_civ\volha\volha";
		icon = "\rds_a2port_civ\data\map_ico\icon_volha_ca.paa";
		picture = "\rds_a2port_civ\data\ico\Picture_Volha_ca.paa";
		mapsize = 5;
		displayName = "GAZ-24";
		driveraction = "Volha_Driver";
		attenuationEffectType = "OpenCarAttenuation";
		armor = 16;
		cost = 10000;
		transportMaxBackpacks = 0;
		transportSoldier = 4; //4
		wheelDamageRadiusCoef = 0.9;
		wheelDestroyRadiusCoef = 0.4;
		maxFordingDepth = 0.5;
		waterResistance = 1;
		crewCrashProtection = 0.25;
		driverLeftHandAnimName = "drivewheel";
		driverRightHandAnimName = "";
		driverRightLegAnimName = "pedalR";
		afmax = 200;
		htmax = 1800;
		htmin = 60;
		mfact = 0;
		mfmax = 100;
		tbody = 0;
		soundAttenuationCargo[] = {1,0};
		insideSoundCoef = 1;
		soundGetIn[] = {"rds_a2port_civ\data\sounds\lada_door",0.4466836,1};
		soundGetOut[] = {"rds_a2port_civ\data\sounds\lada_door",0.4466836,1,40};
		soundDammage[] = {"",0.56234133,1};
		soundEngineOnInt[] = {"rds_a2port_civ\data\sounds\lada_int_start",0.31622776,1.0};
		soundEngineOnExt[] = {"rds_a2port_civ\data\sounds\lada_ext_start",0.39810717,1.0,200};
		soundEngineOffInt[] = {"rds_a2port_civ\data\sounds\lada_int_stop",0.31622776,1.0};
		soundEngineOffExt[] = {"rds_a2port_civ\data\sounds\lada_ext_stop",0.39810717,1.0,200};
		buildCrash0[] = {"A3\sounds_f\Vehicles\soft\noises\crash_building_01",1.0,1,150};
		buildCrash1[] = {"A3\sounds_f\Vehicles\soft\noises\crash_building_02",1.0,1,150};
		buildCrash2[] = {"A3\sounds_f\Vehicles\soft\noises\crash_building_03",1.0,1,150};
		buildCrash3[] = {"A3\sounds_f\Vehicles\soft\noises\crash_building_04",1.0,1,150};
		soundBuildingCrash[] = {"buildCrash0",0.25,"buildCrash1",0.25,"buildCrash2",0.25,"buildCrash3",0.25};
		WoodCrash0[] = {"A3\sounds_f\Vehicles\soft\noises\crash_mix_wood_01",1.0,1,100};
		WoodCrash1[] = {"A3\sounds_f\Vehicles\soft\noises\crash_mix_wood_02",1.0,1,100};
		WoodCrash2[] = {"A3\sounds_f\Vehicles\soft\noises\crash_mix_wood_03",1.0,1,100};
		WoodCrash3[] = {"A3\sounds_f\Vehicles\soft\noises\crash_mix_wood_04",1.0,1,100};
		WoodCrash4[] = {"A3\sounds_f\Vehicles\soft\noises\crash_mix_wood_05",1.0,1,100};
		WoodCrash5[] = {"A3\sounds_f\Vehicles\soft\noises\crash_mix_wood_06",1.0,1,100};
		soundWoodCrash[] = {"woodCrash0",0.166,"woodCrash1",0.166,"woodCrash2",0.166,"woodCrash3",0.166,"woodCrash4",0.166,"woodCrash5",0.166};
		ArmorCrash0[] = {"A3\sounds_f\Vehicles\soft\noises\crash_vehicle_01",1.0,1,200};
		ArmorCrash1[] = {"A3\sounds_f\Vehicles\soft\noises\crash_vehicle_02",1.0,1,200};
		ArmorCrash2[] = {"A3\sounds_f\Vehicles\soft\noises\crash_vehicle_03",1.0,1,200};
		ArmorCrash3[] = {"A3\sounds_f\Vehicles\soft\noises\crash_vehicle_04",1.0,1,200};
		soundArmorCrash[] = {"ArmorCrash0",0.25,"ArmorCrash1",0.25,"ArmorCrash2",0.25,"ArmorCrash3",0.25};
		class Sounds
		{
			class Idle_ext
			{
				sound[] = {"rds_a2port_civ\data\sounds\lada_ext_Idle",0.31622776,1,100};
				frequency = "0.9	+	((rpm/	4900) factor[(284/	4900),(817/	4900)])*0.2";
				volume = "engineOn*camPos*(((rpm/	4900) factor[(284/	4900),(497/	4900)])	*	((rpm/	4900) factor[(781/	4900),(639/	4900)]))";
			};
			class Engine
			{
				sound[] = {"rds_a2port_civ\data\sounds\lada_ext_acceleration",0.31622776,1,200};
				frequency = "0.8	+	((rpm/	4900) factor[(639/	4900),(1491/	4900)])*0.2";
				volume = "engineOn*camPos*(((rpm/	4900) factor[(618/	4900),(781/	4900)])	*	((rpm/	4900) factor[(1491/	4900),(923/	4900)]))";
			};
			class Engine1_ext
			{
				sound[] = {"rds_a2port_civ\data\sounds\lada_ext_low",0.35481337,1,225};
				frequency = "0.8	+	((rpm/	4900) factor[(923/	4900),(2201/	4900)])*0.2";
				volume = "engineOn*camPos*(((rpm/	4900) factor[(888/	4900),(1456/	4900)])	*	((rpm/	4900) factor[(2201/	4900),(1633/	4900)]))";
			};
			class Engine2_ext
			{
				sound[] = {"rds_a2port_civ\data\sounds\lada_ext_low",0.35481337,1,250};
				frequency = "0.8	+	((rpm/	4900) factor[(1598/	4900),(2166/	4900)])*0.2";
				volume = "engineOn*camPos*(((rpm/	4900) factor[(1598/	4900),(2166/	4900)])	*	((rpm/	4900) factor[(2912/	4900),(2343/	4900)]))";
			};
			class Engine3_ext
			{
				sound[] = {"rds_a2port_civ\data\sounds\lada_ext_mid",0.39810717,1,275};
				frequency = "0.8	+	((rpm/	4900) factor[(2343/	4900),(3480/	4900)])*0.2";
				volume = "engineOn*camPos*(((rpm/	4900) factor[(2308/	4900),(2876/	4900)])	*	((rpm/	4900) factor[(3458/	4900),(2983/	4900)]))";
			};
			class Engine4_ext
			{
				sound[] = {"rds_a2port_civ\data\sounds\lada_ext_high",0.4466836,1,300};
				frequency = "0.8	+	((rpm/	4900) factor[(2983/	4900),(4403/	4900)])*0.2";
				volume = "engineOn*camPos*(((rpm/	4900) factor[(2947/	4900),(3409/	4900)])	*	((rpm/	4900) factor[(4367/	4900),(3657/	4900)]))";
			};
			class Engine5_ext
			{
				sound[] = {"rds_a2port_civ\data\sounds\lada_ext_high",0.5011872,1,300};
				frequency = "0.95	+	((rpm/	4900) factor[(3622/	4900),(4900/	4900)])*0.15";
				volume = "engineOn*camPos*((rpm/	4900) factor[(3622/	4900),(4432/	4900)])";
			};
			class IdleThrust
			{
				sound[] = {"rds_a2port_civ\data\sounds\lada_ext_Idle",0.5011872,1,200};
				frequency = "0.9	+	((rpm/	4900) factor[(284/	4900),(817/	4900)])*0.2";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	4900) factor[(284/	4900),(497/	4900)])	*	((rpm/	4900) factor[(781/	4900),(639/	4900)]))";
			};
			class EngineThrust
			{
				sound[] = {"rds_a2port_civ\data\sounds\lada_ext_acceleration",0.56234133,1,250};
				frequency = "0.8	+	((rpm/	4900) factor[(639/	4900),(1491/	4900)])*0.2";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	4900) factor[(618/	4900),(781/	4900)])	*	((rpm/	4900) factor[(1491/	4900),(923/	4900)]))";
			};
			class Engine1_Thrust_ext
			{
				sound[] = {"rds_a2port_civ\data\sounds\lada_ext_low",0.63095737,1,275};
				frequency = "0.8	+	((rpm/	4900) factor[(923/	4900),(2201/	4900)])*0.2";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	4900) factor[(888/	4900),(1456/	4900)])	*	((rpm/	4900) factor[(2201/	4900),(1633/	4900)]))";
			};
			class Engine2_Thrust_ext
			{
				sound[] = {"rds_a2port_civ\data\sounds\lada_ext_low",0.70794576,1,300};
				frequency = "0.8	+	((rpm/	4900) factor[(1598/	4900),(2166/	4900)])*0.2";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	4900) factor[(1598/	4900),(2166/	4900)])	*	((rpm/	4900) factor[(2912/	4900),(2343/	4900)]))";
			};
			class Engine3_Thrust_ext
			{
				sound[] = {"rds_a2port_civ\data\sounds\lada_ext_mid",0.7943282,1,325};
				frequency = "0.8	+	((rpm/	4900) factor[(2343/	4900),(3480/	4900)])*0.2";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	4900) factor[(2308/	4900),(2876/	4900)])	*	((rpm/	4900) factor[(3458/	4900),(2983/	4900)]))";
			};
			class Engine4_Thrust_ext
			{
				sound[] = {"rds_a2port_civ\data\sounds\lada_ext_high",0.8912509,1,350};
				frequency = "0.8	+	((rpm/	4900) factor[(2983/	4900),(4403/	4900)])*0.3";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	4900) factor[(2947/	4900),(3409/	4900)])	*	((rpm/	4900) factor[(4367/	4900),(3657/	4900)]))";
			};
			class Engine5_Thrust_ext
			{
				sound[] = {"rds_a2port_civ\data\sounds\lada_ext_high",1.0,1,375};
				frequency = "0.9	+	((rpm/	4900) factor[(3622/	4900),(4900/	4900)])*0.2";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*((rpm/	4900) factor[(3622/	4900),(4432/	4900)])";
			};
			class Idle_int
			{
				sound[] = {"rds_a2port_civ\data\sounds\lada_int_Idle",0.2238721,1};
				frequency = "0.9	+	((rpm/	4900) factor[(284/	4900),(817/	4900)])*0.2";
				volume = "engineOn*(1-camPos)*(((rpm/	4900) factor[(284/	4900),(497/	4900)])	*	((rpm/	4900) factor[(781/	4900),(639/	4900)]))";
			};
			class Engine_int
			{
				sound[] = {"rds_a2port_civ\data\sounds\lada_int_acceleration",0.25118864,1};
				frequency = "0.8	+	((rpm/	4900) factor[(639/	4900),(1491/	4900)])*0.2";
				volume = "engineOn*(1-camPos)*(((rpm/	4900) factor[(618/	4900),(781/	4900)])	*	((rpm/	4900) factor[(1491/	4900),(923/	4900)]))";
			};
			class Engine1_int
			{
				sound[] = {"rds_a2port_civ\data\sounds\lada_int_low",0.17782794,1};
				frequency = "0.8	+	((rpm/	4900) factor[(923/	4900),(2201/	4900)])*0.2";
				volume = "engineOn*(1-camPos)*(((rpm/	4900) factor[(888/	4900),(1456/	4900)])	*	((rpm/	4900) factor[(2201/	4900),(1633/	4900)]))";
			};
			class Engine2_int
			{
				sound[] = {"rds_a2port_civ\data\sounds\lada_int_low",0.31622776,1};
				frequency = "0.8	+	((rpm/	4900) factor[(1598/	4900),(2166/	4900)])*0.2";
				volume = "engineOn*(1-camPos)*(((rpm/	4900) factor[(1598/	4900),(2166/	4900)])	*	((rpm/	4900) factor[(2912/	4900),(2343/	4900)]))";
			};
			class Engine3_int
			{
				sound[] = {"rds_a2port_civ\data\sounds\lada_int_mid",0.35481337,1};
				frequency = "0.8	+	((rpm/	4900) factor[(2343/	4900),(3480/	4900)])*0.2";
				volume = "engineOn*(1-camPos)*(((rpm/	4900) factor[(2308/	4900),(2876/	4900)])	*	((rpm/	4900) factor[(3458/	4900),(2983/	4900)]))";
			};
			class Engine4_int
			{
				sound[] = {"rds_a2port_civ\data\sounds\lada_int_high",0.39810717,1};
				frequency = "0.8	+	((rpm/	4900) factor[(2983/	4900),(4403/	4900)])*0.2";
				volume = "engineOn*(1-camPos)*(((rpm/	4900) factor[(2947/	4900),(3409/	4900)])	*	((rpm/	4900) factor[(4367/	4900),(3657/	4900)]))";
			};
			class Engine5_int
			{
				sound[] = {"rds_a2port_civ\data\sounds\lada_int_high",0.39810717,1};
				frequency = "0.95	+	((rpm/	4900) factor[(3622/	4900),(4900/	4900)])*0.15";
				volume = "engineOn*(1-camPos)*((rpm/	4900) factor[(3622/	4900),(4432/	4900)])";
			};
			class IdleThrust_int
			{
				sound[] = {"rds_a2port_civ\data\sounds\lada_int_acceleration",0.31622776,1};
				frequency = "0.9	+	((rpm/	4900) factor[(284/	4900),(817/	4900)])*0.2";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	4900) factor[(284/	4900),(497/	4900)])	*	((rpm/	4900) factor[(781/	4900),(639/	4900)]))";
			};
			class EngineThrust_int
			{
				sound[] = {"rds_a2port_civ\data\sounds\lada_int_low",0.35481337,1};
				frequency = "0.8	+	((rpm/	4900) factor[(639/	4900),(1491/	4900)])*0.2";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	4900) factor[(618/	4900),(781/	4900)])	*	((rpm/	4900) factor[(1491/	4900),(923/	4900)]))";
			};
			class Engine1_Thrust_int
			{
				sound[] = {"rds_a2port_civ\data\sounds\lada_int_low",0.39810717,1};
				frequency = "0.8	+	((rpm/	4900) factor[(923/	4900),(2201/	4900)])*0.2";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	4900) factor[(888/	4900),(1456/	4900)])	*	((rpm/	4900) factor[(2201/	4900),(1633/	4900)]))";
			};
			class Engine2_Thrust_int
			{
				sound[] = {"rds_a2port_civ\data\sounds\lada_int_mid",0.4466836,1};
				frequency = "0.8	+	((rpm/	4900) factor[(1598/	4900),(2166/	4900)])*0.2";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	4900) factor[(1598/	4900),(2166/	4900)])	*	((rpm/	4900) factor[(2912/	4900),(2343/	4900)]))";
			};
			class Engine3_Thrust_int
			{
				sound[] = {"rds_a2port_civ\data\sounds\lada_int_mid",0.5011872,1};
				frequency = "0.8	+	((rpm/	4900) factor[(2343/	4900),(3480/	4900)])*0.2";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	4900) factor[(2308/	4900),(2876/	4900)])	*	((rpm/	4900) factor[(3458/	4900),(2983/	4900)]))";
			};
			class Engine4_Thrust_int
			{
				sound[] = {"rds_a2port_civ\data\sounds\lada_int_high",0.56234133,1};
				frequency = "0.8	+	((rpm/	4900) factor[(2983/	4900),(4403/	4900)])*0.3";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	4900) factor[(2947/	4900),(3409/	4900)])	*	((rpm/	4900) factor[(4367/	4900),(3657/	4900)]))";
			};
			class Engine5_Thrust_int
			{
				sound[] = {"rds_a2port_civ\data\sounds\lada_int_high",0.63095737,1};
				frequency = "0.9	+	((rpm/	4900) factor[(3622/	4900),(4900/	4900)])*0.2";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*((rpm/	4900) factor[(3622/	4900),(4432/	4900)])";
			};
			class Movement
			{
				sound = "soundEnviron";
				frequency = "1";
				volume = "0";
			};
			class TiresRockOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\ext_tires_dirt_soft_1",0.70794576,1.0,60};
				frequency = "1";
				volume = "camPos*rock*(speed factor[2, 20])";
			};
			class TiresSandOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\ext-tires-sand1",0.70794576,1.0,60};
				frequency = "1";
				volume = "camPos*sand*(speed factor[2, 20])";
			};
			class TiresGrassOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\ext_tires_dirt_soft_2",0.70794576,1.0,60};
				frequency = "1";
				volume = "camPos*grass*(speed factor[2, 20])";
			};
			class TiresMudOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\ext-tires-mud2",0.70794576,1.0,60};
				frequency = "1";
				volume = "camPos*mud*(speed factor[2, 20])";
			};
			class TiresGravelOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\ext_tires_gravel_1",0.70794576,1.0,60};
				frequency = "1";
				volume = "camPos*gravel*(speed factor[2, 20])";
			};
			class TiresAsphaltOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\ext_tires_asfalt_2",0.70794576,1.0,60};
				frequency = "1";
				volume = "camPos*asphalt*(speed factor[2, 20])";
			};
			class NoiseOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\noise_ext_car_3",0.56234133,1.0,90};
				frequency = "1";
				volume = "camPos*(damper0 max 0.02)*(speed factor[0, 8])";
			};
			class TiresRockIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\int_tires_dirt_soft_1",0.70794576,1.0};
				frequency = "1";
				volume = "(1-camPos)*rock*(speed factor[2, 20])";
			};
			class TiresSandIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\int-tires-sand2",0.70794576,1.0};
				frequency = "1";
				volume = "(1-camPos)*sand*(speed factor[2, 20])";
			};
			class TiresGrassIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\int_tires_dirt_soft_2",0.70794576,1.0};
				frequency = "1";
				volume = "(1-camPos)*grass*(speed factor[2, 20])";
			};
			class TiresMudIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\int-tires-mud2",0.70794576,1.0};
				frequency = "1";
				volume = "(1-camPos)*mud*(speed factor[2, 20])";
			};
			class TiresGravelIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\int_tires_gravel_1",0.70794576,1.0};
				frequency = "1";
				volume = "(1-camPos)*gravel*(speed factor[2, 20])";
			};
			class TiresAsphaltIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\int_tires_asfalt_2",0.70794576,1.0};
				frequency = "1";
				volume = "(1-camPos)*asphalt*(speed factor[2, 20])";
			};
			class NoiseIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\noise_int_car_3",0.15848932,1.0};
				frequency = "1";
				volume = "(damper0 max 0.1)*(speed factor[0, 8])*(1-camPos)";
			};
			class breaking_ext_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_04",0.70794576,1,80};
				frequency = 1;
				volume = "engineOn*camPos*asphalt*(LongSlipDrive Factor[-0.1, -0.4])*(Speed Factor[2, 15])";
			};
			class acceleration_ext_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02",0.70794576,1,80};
				frequency = 1;
				volume = "engineOn*camPos*asphalt*(LongSlipDrive Factor[0.1, 0.4])*(Speed Factor[15, 2])";
			};
			class turn_left_ext_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02",0.70794576,1,80};
				frequency = 1;
				volume = "engineOn*camPos*asphalt*(latSlipDrive Factor[0.1, 0.4])*(Speed Factor[2, 15])";
			};
			class turn_right_ext_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02",0.70794576,1,80};
				frequency = 1;
				volume = "engineOn*camPos*asphalt*(latSlipDrive Factor[-0.1, -0.4])*(Speed Factor[2, 15])";
			};
			class breaking_ext_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_14_dirt_breaking",0.70794576,1,60};
				frequency = 1;
				volume = "engineOn*camPos*(1-asphalt)*(LongSlipDrive Factor[-0.1, -0.4])*(Speed Factor[1, 15])";
			};
			class acceleration_ext_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_16_dirt_acceleration",0.70794576,1,60};
				frequency = 1;
				volume = "engineOn*camPos*(1-asphalt)*(LongSlipDrive Factor[0.1, 0.4])*(Speed Factor[15, 1])";
			};
			class turn_left_ext_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_18_dirt",0.70794576,1,60};
				frequency = 1;
				volume = "engineOn*camPos*(1-asphalt)*(latSlipDrive Factor[0.1, 0.4])*(Speed Factor[1, 15])";
			};
			class turn_right_ext_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_18_dirt",0.70794576,1,60};
				frequency = 1;
				volume = "engineOn*camPos*(1-asphalt)*(latSlipDrive Factor[-0.1, -0.4])*(Speed Factor[1, 15])";
			};
			class breaking_int_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_04_int",0.31622776,1};
				frequency = 1;
				volume = "engineOn*asphalt*(1-camPos)*(LongSlipDrive Factor[-0.1, -0.4])*(Speed Factor[1, 15])";
			};
			class acceleration_int_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02_int",0.31622776,1};
				frequency = 1;
				volume = "engineOn*asphalt*(1-camPos)*(LongSlipDrive Factor[0.1, 0.4])*(Speed Factor[15, 1])";
			};
			class turn_left_int_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02_int",0.31622776,1};
				frequency = 1;
				volume = "engineOn*asphalt*(1-camPos)*(latSlipDrive Factor[0.1, 0.4])*(Speed Factor[1, 15])";
			};
			class turn_right_int_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02_int",0.31622776,1};
				frequency = 1;
				volume = "engineOn*asphalt*(1-camPos)*(latSlipDrive Factor[-0.1, -0.4])*(Speed Factor[1, 15])";
			};
			class breaking_int_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_14_dirt_breaking_int",0.31622776,1};
				frequency = 1;
				volume = "engineOn*(1-asphalt)*(1-camPos)*(LongSlipDrive Factor[-0.1, -0.4])*(Speed Factor[1, 15])";
			};
			class acceleration_int_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_16_dirt_acceleration_int",0.31622776,1};
				frequency = 1;
				volume = "engineOn*(1-asphalt)*(1-camPos)*(LongSlipDrive Factor[0.1, 0.4])*(Speed Factor[15, 1])";
			};
			class turn_left_int_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_18_dirt_int",0.31622776,1};
				frequency = 1;
				volume = "engineOn*(1-asphalt)*(1-camPos)*(latSlipDrive Factor[0.1, 0.4])*(Speed Factor[1, 15])";
			};
			class turn_right_int_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_18_dirt_int",0.31622776,1};
				frequency = 1;
				volume = "engineOn*(1-asphalt)*(1-camPos)*(latSlipDrive Factor[-0.1, -0.4])*(Speed Factor[1, 15])";
			};
		};
		class Turrets{};
		cargoaction[] = {"Volha_Cargo","Volha_Cargo02","Volha_Cargo01","Golf_Cargo03"};
		memorypointsgetincargo[] = {"pos cargo 1","pos cargo 2","pos cargo 3","pos cargo 4"};
		memorypointsgetincargodir[] = {"pos cargo dir 1","pos cargo dir 2","pos cargo dir 3","pos cargo dir 4"};
		driverDoor = "Door_LF";
		cargoDoors[] = {"Door_RF","Door_LB","Door_RB","Trunk"};
		driverCompartments = "Compartment1";
		cargoCompartments[] = {"Compartment1","Compartment2","Compartment2","Compartment3"};
		class AnimationSources: AnimationSources
		{
			class Door_LF
			{
				source = "door";
				animPeriod = 1.0;
			};
			class Door_LB: Door_LF{};
			class Door_RB: Door_LF{};
			class Door_RF: Door_LF{};
			class Trunk: Door_LF{};
		};
		class UserActions
		{
			class openDoors
			{
				displayName = "Ouvrir le coffre";
				position = "trunk_action";
				radius = 1;
				showWindow = 0;
				condition = "(this animationPhase ""trunk"" < 0.5)";
				statement = "this animateDoor [""trunk"",1]";
				onlyForPlayer = 0;
			};
			class closeDoors: openDoors
			{
				displayName = "Fermer le coffre";
				condition = "(this animationPhase ""trunk"" > 0.5)";
				statement = "this animateDoor [""trunk"",0]";
			};
		};
		class HitPoints: HitPoints
		{
			class HitLFWheel: HitLFWheel
			{
				armor = 0.175;
				passThrough = 0.3;
			};
			class HitLF2Wheel: HitLF2Wheel
			{
				armor = 0.175;
				passThrough = 0.3;
			};
			class HitRFWheel: HitRFWheel
			{
				armor = 0.175;
				passThrough = 0.3;
			};
			class HitRF2Wheel: HitRF2Wheel
			{
				armor = 0.175;
				passThrough = 0.3;
			};
			class HitFuel
			{
				armor = 0.5;
				material = -1;
				name = "palivo";
				visual = "";
				passThrough = 0.2;
			};
			class HitEngine
			{
				armor = 0.5;
				material = -1;
				name = "motor";
				visual = "";
				passThrough = 0.2;
			};
			class HitBody: HitBody
			{
				name = "karoserie";
				visual = "camo1";
				passThrough = 1;
			};
			class HitGlass1: HitGlass1
			{
				armor = 0.1;
			};
			class HitGlass2: HitGlass2
			{
				armor = 0.05;
			};
			class HitGlass3: HitGlass3
			{
				armor = 0.05;
			};
			class HitGlass4: HitGlass4
			{
				visual = "glass4";
				armor = 0.05;
			};
			class HitGlass5: HitGlass5
			{
				armor = 0.05;
			};
			class HitGlass6: HitGlass6
			{
				armor = 0.05;
			};
		};
		getInAction = "GetInOffroad";
		getOutAction = "GetOutLow";
		cargoGetInAction[] = {"GetInLow"};
		cargoGetOutAction[] = {"GetOutLow"};
		memorypointtrackbll = "Stopa ZLL";
		memorypointtrackblr = "Stopa ZLP";
		memorypointtrackbrl = "Stopa ZPL";
		memorypointtrackbrr = "Stopa ZPP";
		memorypointtrackfll = "Stopa PLL";
		memorypointtrackflr = "Stopa PLP";
		memorypointtrackfrl = "Stopa PPL";
		memorypointtrackfrr = "Stopa PPP";
		dustFrontLeftPos = "Stopa PPL";
		dustFrontRightPos = "Stopa PLP";
		dustBackLeftPos = "Stopa ZLL";
		dustBackRightPos = "Stopa ZLP";
		class Damage
		{
			mat[] = {"rds_a2port_civ\Volha\Data\Volha_ECIV.rvmat","rds_a2port_civ\Volha\Data\Volha_ECIV_damage.rvmat","rds_a2port_civ\Volha\Data\Volha_ECIV_destruct.rvmat","rds_a2port_civ\Volha\Data\Volha_Glass_ECIV.rvmat","rds_a2port_civ\Volha\Data\Volha_Glass_ECIV_damage.rvmat","rds_a2port_civ\Volha\Data\Volha_Glass_ECIV_destruct.rvmat","rds_a2port_civ\Volha\Data\Volha_Chrome_ECIV.rvmat","rds_a2port_civ\Volha\Data\Volha_Chrome_ECIV_damage.rvmat","rds_a2port_civ\Volha\Data\Volha_Chrome_ECIV_destruct.rvmat","a3\data_f\default.rvmat","a3\data_f\default.rvmat","a3\data_f\default_destruct.rvmat"};
			tex[] = {};
		};
		class Exhausts
		{
			class Exhaust1
			{
				position = "vyfuk start";
				direction = "vyfuk konec";
				effect = "ExhaustEffectOffroad";
			};
		};
		class Reflectors
		{
			class LSvetla
			{
				color[] = {800,900,650};
				ambient[] = {2,2,2};
				position = "L svetlo";
				direction = "konec L svetla";
				hitpoint = "L svetlo";
				selection = "L svetlo";
				size = 1;
				innerAngle = 30;
				outerAngle = 120;
				coneFadeCoef = 10;
				intensity = 2;
				useFlare = 1;
				dayLight = 1;
				flareSize = 1;
				class Attenuation
				{
					start = 2;
					constant = 0;
					linear = 0.1;
					quadratic = 0.01;
					hardLimitStart = 100;
					hardLimitEnd = 300;
				};
			};
			class RSvetla: LSvetla
			{
				position = "P svetlo";
				direction = "konec P svetla";
				hitpoint = "P svetlo";
				selection = "P svetlo";
			};
		};
		aggregateReflectors[] = {{ "LSvetla","RSvetla" }};
		class RenderTargets
		{
			class LeftMirror
			{
				renderTarget = "rendertarget0";
				class CameraView1
				{
					pointPosition = "m1p";
					pointDirection = "m1d";
					renderQuality = 2;
					renderVisionMode = 4;
					fov = 0.5;
				};
			};
			class RightMirror
			{
				renderTarget = "rendertarget1";
				class CameraView1
				{
					pointPosition = "m2p";
					pointDirection = "m2d";
					renderQuality = 2;
					renderVisionMode = 4;
					fov = 0.7;
				};
			};
			class BackMirror
			{
				renderTarget = "rendertarget2";
				class CameraView1
				{
					pointPosition = "m3p";
					pointDirection = "m3d";
					renderQuality = 2;
					renderVisionMode = 4;
					fov = 0.7;
				};
			};
		};
		//GAZ-24
		enginePower = 150; //69.9
		maxOmega = 513.13;
		peakTorque = 350; //186.3
		idleRPM = 600;
		redRpm = 4900;
		terrainCoef = 2; //5
		turnCoef = 2.0;
		precision = 10;
		brakeDistance = 3;
		acceleration = 60; //15
		fireResistance = 5;
		thrustDelay = 0.2;
		brakeIdleSpeed = 1.78;
		maxSpeed = 156;
		fuelCapacity = 12; //50
		wheelCircumference = 2.04;
		antiRollbarForceCoef = 1.9;
		antiRollbarForceLimit = 5;
		antiRollbarSpeedMin = 10;
		antiRollbarSpeedMax = 150;
		changeGearMinEffectivity[] = {0.95,0.15,0.85,0.95,0.95,0.95};
		class complexGearbox
		{
			GearboxRatios[] = {"R1",-3.54,"N",0,"D1",3.5,"D2",2.26,"D3",1.45,"D4",1.0};
			TransmissionRatios[] = {"High",4.1};
			gearBoxMode = "auto";
			moveOffGear = 1;
			driveString = "D";
			neutralString = "N";
			reverseString = "R";
		};
		simulation = "carx";
		dampersBumpCoef = 4;
		differentialType = "rear_limited";
		frontRearSplit = 0.5;
		frontBias = 1.5;
		rearBias = 3.5;
		centreBias = 3.3;
		clutchStrength = 85;
		dampingRateFullThrottle = 0.08;
		dampingRateZeroThrottleClutchEngaged = 1.35;
		dampingRateZeroThrottleClutchDisengaged = 0.35;
		torqueCurve[] = {{ "0/4900","0/186" },{ "799/4900","139/186" },{ "1401/4900","162/186" },{ "2298/4900","186/186" },{ "3401/4900","175/186" },{ "3900/4900","166/186" },{ "4498/4900","147/186" },{ "4998/4900","0/186" }};
		latency = 1;
		class Wheels
		{
			class LF
			{
				width = "0.1";
				boneName = "wheel_1_1_damper";
				steering = 1;
				side = "left";
				center = "wheel_1_1_axis";
				boundary = "wheel_1_1_bound";
				mass = 17;
				MOI = 14.0;
				dampingRate = 0.1;
				maxBrakeTorque = 1300;
				maxHandBrakeTorque = 0;
				suspTravelDirection[] = {0,-1,0};
				suspForceAppPointOffset = "wheel_1_1_axis";
				tireForceAppPointOffset = "wheel_1_1_axis";
				maxCompression = 0.15;
				mMaxDroop = 0.15;
				sprungMass = 145.5;
				springStrength = 45025;
				springDamperRate = 4700;
				longitudinalStiffnessPerUnitGravity = 10000;
				latStiffX = 1.7;
				latStiffY = 16.0;
				frictionVsSlipGraph[] = {{ 0,1.41 },{ 0.5,1.1 },{ 1,1 }};
			};
			class LR: LF
			{
				boneName = "wheel_1_2_damper";
				steering = 0;
				center = "wheel_1_2_axis";
				boundary = "wheel_1_2_bound";
				suspForceAppPointOffset = "wheel_1_2_axis";
				tireForceAppPointOffset = "wheel_1_2_axis";
				maxHandBrakeTorque = 2000;
			};
			class RF: LF
			{
				boneName = "wheel_2_1_damper";
				center = "wheel_2_1_axis";
				boundary = "wheel_2_1_bound";
				suspForceAppPointOffset = "wheel_2_1_axis";
				tireForceAppPointOffset = "wheel_2_1_axis";
				steering = 1;
				side = "right";
			};
			class RR: RF
			{
				boneName = "wheel_2_2_damper";
				steering = 0;
				center = "wheel_2_2_axis";
				boundary = "wheel_2_2_bound";
				suspForceAppPointOffset = "wheel_2_2_axis";
				tireForceAppPointOffset = "wheel_2_2_axis";
				maxHandBrakeTorque = 2000;
			};
		};
	};
	class RDS_Gaz24_Civ_Base: RDS_Gaz24_Base
	{
		accuracy = 0.5;
		crew = "RDS_Citizen1";
		faction = "rds_rus_civ";
		side = 3;
	};
	class RDS_Gaz24_Civ_01: RDS_Gaz24_Civ_Base
	{
		scope = 2;
		displayName = "GAZ-24 (Bleu)";
		hiddenselections[] = {"Camo1"};
		hiddenselectionstextures[] = {"rds_a2port_civ\volha\Data\Volha_ECIV_CO.paa"};
	};
	class RDS_Gaz24_Civ_02: RDS_Gaz24_Civ_01
	{
		crew = "RDS_Citizen4";
		displayName = "GAZ-24 (Gris)";
		hiddenselectionstextures[] = {"rds_a2port_civ\volha\Data\Volha_Gray_ECIV_CO.paa"};
	};
	class RDS_Gaz24_Civ_03: RDS_Gaz24_Civ_01
	{
		crew = "RDS_Citizen2";
		displayName = "GAZ-24 (Noir)";
		hiddenselectionstextures[] = {"rds_a2port_civ\volha\Data\Volha_Black_ECIV_CO.paa"};
	};
	class RDS_Golf4_Base: Car_F
	{
		model = "\rds_a2port_civ\VWGOLF\vwgolf";
		icon = "\rds_a2port_civ\data\map_ico\icon_VWGolf_ca.paa";
		picture = "\rds_a2port_civ\data\ico\Picture_VWGolf_ca.paa";
		mapsize = 5;
		displayName = "Golf IV 1.6 16v"; //Golf IV 1.9 TDI
		hiddenSelections[] = {"camo1"};
		driveraction = "Golf_Driver";
		attenuationEffectType = "OpenCarAttenuation";
		armor = 22;
		cost = 10000;
		transportMaxBackpacks = 6;
		transportSoldier = 4;
		wheelDamageRadiusCoef = 0.9;
		wheelDestroyRadiusCoef = 0.4;
		maxFordingDepth = 0.5;
		waterResistance = 1;
		crewCrashProtection = 0.25;
		driverLeftHandAnimName = "drivewheel";
		driverRightHandAnimName = "";
		driverRightLegAnimName = "pedalR";
		afmax = 200;
		htmax = 1800;
		htmin = 60;
		mfact = 0;
		mfmax = 100;
		tbody = 0;
		soundAttenuationCargo[] = {1,0};
		insideSoundCoef = 1;
		soundGetIn[] = {"rds_a2port_civ\data\sounds\GOLF\int\int-golf-getout",0.4466836,1};
		soundGetOut[] = {"rds_a2port_civ\data\sounds\GOLF\ext\ext-golf-getout",0.4466836,1,40};
		soundDammage[] = {"",0.56234133,1};
		soundEngineOnInt[] = {"rds_a2port_civ\data\sounds\GOLF\int\int-golf-start-1",0.31622776,1.0};
		soundEngineOnExt[] = {"rds_a2port_civ\data\sounds\GOLF\ext\ext-golf-start-1",0.39810717,1.0,200};
		soundEngineOffInt[] = {"rds_a2port_civ\data\sounds\GOLF\int\int-golf-stop-1",0.31622776,1.0};
		soundEngineOffExt[] = {"rds_a2port_civ\data\sounds\GOLF\ext\ext-golf-stop-1",0.39810717,1.0,200};
		buildCrash0[] = {"A3\sounds_f\Vehicles\soft\noises\crash_building_01",1.0,1,150};
		buildCrash1[] = {"A3\sounds_f\Vehicles\soft\noises\crash_building_02",1.0,1,150};
		buildCrash2[] = {"A3\sounds_f\Vehicles\soft\noises\crash_building_03",1.0,1,150};
		buildCrash3[] = {"A3\sounds_f\Vehicles\soft\noises\crash_building_04",1.0,1,150};
		soundBuildingCrash[] = {"buildCrash0",0.25,"buildCrash1",0.25,"buildCrash2",0.25,"buildCrash3",0.25};
		WoodCrash0[] = {"A3\sounds_f\Vehicles\soft\noises\crash_mix_wood_01",1.0,1,100};
		WoodCrash1[] = {"A3\sounds_f\Vehicles\soft\noises\crash_mix_wood_02",1.0,1,100};
		WoodCrash2[] = {"A3\sounds_f\Vehicles\soft\noises\crash_mix_wood_03",1.0,1,100};
		WoodCrash3[] = {"A3\sounds_f\Vehicles\soft\noises\crash_mix_wood_04",1.0,1,100};
		WoodCrash4[] = {"A3\sounds_f\Vehicles\soft\noises\crash_mix_wood_05",1.0,1,100};
		WoodCrash5[] = {"A3\sounds_f\Vehicles\soft\noises\crash_mix_wood_06",1.0,1,100};
		soundWoodCrash[] = {"woodCrash0",0.166,"woodCrash1",0.166,"woodCrash2",0.166,"woodCrash3",0.166,"woodCrash4",0.166,"woodCrash5",0.166};
		ArmorCrash0[] = {"A3\sounds_f\Vehicles\soft\noises\crash_vehicle_01",1.0,1,200};
		ArmorCrash1[] = {"A3\sounds_f\Vehicles\soft\noises\crash_vehicle_02",1.0,1,200};
		ArmorCrash2[] = {"A3\sounds_f\Vehicles\soft\noises\crash_vehicle_03",1.0,1,200};
		ArmorCrash3[] = {"A3\sounds_f\Vehicles\soft\noises\crash_vehicle_04",1.0,1,200};
		soundArmorCrash[] = {"ArmorCrash0",0.25,"ArmorCrash1",0.25,"ArmorCrash2",0.25,"ArmorCrash3",0.25};
		class Sounds
		{
			class Idle_ext
			{
				sound[] = {"rds_a2port_civ\data\sounds\GOLF\ext\ext-golf-Idle-1",0.31622776,1,100};
				frequency = "0.9	+	((rpm/	6900) factor[(267/	6900),(767/	6900)])*0.2";
				volume = "engineOn*camPos*(((rpm/	6900) factor[(200/	6900),(500/	6900)])	*	((rpm/	6900) factor[(900/	6900),(700/	6900)]))";
			};
			class Engine
			{
				sound[] = {"rds_a2port_civ\data\sounds\GOLF\ext\ext-golf-low-1",0.31622776,1,200};
				frequency = "0.8	+	((rpm/	6900) factor[(600/	6900),(1300/	6900)])*0.2";
				volume = "engineOn*camPos*(((rpm/	6900) factor[(780/	6900),(833/	6900)])	*	((rpm/	6900) factor[(1100/	6900),(967/	6900)]))";
			};
			class Engine1_ext
			{
				sound[] = {"rds_a2port_civ\data\sounds\GOLF\ext\ext-golf-high-1",0.35481337,1,225};
				frequency = "0.8	+	((rpm/	6900) factor[(967/	6900),(1767/	6900)])*0.2";
				volume = "engineOn*camPos*(((rpm/	6900) factor[(833/	6900),(1267/	6900)])	*	((rpm/	6900) factor[(1767/	6900),(1433/	6900)]))";
			};
			class Engine2_ext
			{
				sound[] = {"rds_a2port_civ\data\sounds\GOLF\ext\ext-golf-high-2",0.35481337,1,250};
				frequency = "0.8	+	((rpm/	6900) factor[(1400/	6900),(2533/	6900)])*0.2";
				volume = "engineOn*camPos*(((rpm/	6900) factor[(1400/	6900),(2033/	6900)])	*	((rpm/	6900) factor[(2733/	6900),(2200/	6900)]))";
			};
			class Engine3_ext
			{
				sound[] = {"rds_a2port_civ\data\sounds\GOLF\ext\ext-golf-high-2",0.39810717,1,275};
				frequency = "0.8	+	((rpm/	6900) factor[(2200/	6900),(3267/	6900)])*0.2";
				volume = "engineOn*camPos*(((rpm/	6900) factor[(2167/	6900),(2700/	6900)])	*	((rpm/	6900) factor[(3247/	6900),(2800/	6900)]))";
			};
			class Engine4_ext
			{
				sound[] = {"rds_a2port_civ\data\sounds\GOLF\ext\ext-golf-high-2",0.4466836,1,300};
				frequency = "0.8	+	((rpm/	6900) factor[(2800/	6900),(4133/	6900)])*0.2";
				volume = "engineOn*camPos*(((rpm/	6900) factor[(2767/	6900),(3200/	6900)])	*	((rpm/	6900) factor[(4100/	6900),(3433/	6900)]))";
			};
			class Engine5_ext
			{
				sound[] = {"rds_a2port_civ\data\sounds\GOLF\ext\ext-golf-high-3",0.5011872,1,300};
				frequency = "0.95	+	((rpm/	6900) factor[(3400/	6900),(6900/	6900)])*0.15";
				volume = "engineOn*camPos*((rpm/	6900) factor[(3400/	6900),(4067/	6900)])";
			};
			class IdleThrust
			{
				sound[] = {"rds_a2port_civ\data\sounds\GOLF\ext\ext-golf-Idle-1",0.5011872,1,200};
				frequency = "0.9	+	((rpm/	6900) factor[(267/	6900),(767/	6900)])*0.2";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	6900) factor[(200/	6900),(500/	6900)])	*	((rpm/	6900) factor[(900/	6900),(700/	6900)]))";
			};
			class EngineThrust
			{
				sound[] = {"rds_a2port_civ\data\sounds\GOLF\ext\ext-golf-acce-1",0.56234133,1,250};
				frequency = "0.8	+	((rpm/	6900) factor[(600/	6900),(1300/	6900)])*0.2";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	6900) factor[(780/	6900),(833/	6900)])	*	((rpm/	6900) factor[(1100/	6900),(967/	6900)]))";
			};
			class Engine1_Thrust_ext
			{
				sound[] = {"rds_a2port_civ\data\sounds\GOLF\ext\ext-golf-low-1",0.63095737,1,275};
				frequency = "0.8	+	((rpm/	6900) factor[(967/	6900),(1767/	6900)])*0.2";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	6900) factor[(833/	6900),(1267/	6900)])	*	((rpm/	6900) factor[(1767/	6900),(1433/	6900)]))";
			};
			class Engine2_Thrust_ext
			{
				sound[] = {"rds_a2port_civ\data\sounds\GOLF\ext\ext-golf-high-1",0.70794576,1,300};
				frequency = "0.8	+	((rpm/	6900) factor[(1400/	6900),(2533/	6900)])*0.2";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	6900) factor[(1400/	6900),(2033/	6900)])	*	((rpm/	6900) factor[(2733/	6900),(2200/	6900)]))";
			};
			class Engine3_Thrust_ext
			{
				sound[] = {"rds_a2port_civ\data\sounds\GOLF\ext\ext-golf-high-2",0.7943282,1,325};
				frequency = "0.8	+	((rpm/	6900) factor[(2200/	6900),(3267/	6900)])*0.2";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	6900) factor[(2167/	6900),(2700/	6900)])	*	((rpm/	6900) factor[(3247/	6900),(2800/	6900)]))";
			};
			class Engine4_Thrust_ext
			{
				sound[] = {"rds_a2port_civ\data\sounds\GOLF\ext\ext-golf-high-2",0.8912509,1,350};
				frequency = "0.8	+	((rpm/	6900) factor[(2800/	6900),(4133/	6900)])*0.3";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	6900) factor[(2767/	6900),(3200/	6900)])	*	((rpm/	6900) factor[(4100/	6900),(3433/	6900)]))";
			};
			class Engine5_Thrust_ext
			{
				sound[] = {"rds_a2port_civ\data\sounds\GOLF\ext\ext-golf-high-3",1.0,1,375};
				frequency = "0.9	+	((rpm/	6900) factor[(3400/	6900),(6900/	6900)])*0.2";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*((rpm/	6900) factor[(3400/	6900),(4067/	6900)])";
			};
			class Idle_int
			{
				sound[] = {"rds_a2port_civ\data\sounds\GOLF\int\int-golf-Idle-1",0.2238721,1};
				frequency = "0.9	+	((rpm/	6900) factor[(267/	6900),(767/	6900)])*0.2";
				volume = "engineOn*(1-camPos)*(((rpm/	6900) factor[(200/	6900),(500/	6900)])	*	((rpm/	6900) factor[(900/	6900),(700/	6900)]))";
			};
			class Engine_int
			{
				sound[] = {"rds_a2port_civ\data\sounds\GOLF\int\int-golf-low-1",0.25118864,1};
				frequency = "0.8	+	((rpm/	6900) factor[(600/	6900),(1300/	6900)])*0.2";
				volume = "engineOn*(1-camPos)*(((rpm/	6900) factor[(780/	6900),(833/	6900)])	*	((rpm/	6900) factor[(1100/	6900),(967/	6900)]))";
			};
			class Engine1_int
			{
				sound[] = {"rds_a2port_civ\data\sounds\GOLF\int\int-golf-high-1",0.17782794,1};
				frequency = "0.8	+	((rpm/	6900) factor[(967/	6900),(1767/	6900)])*0.2";
				volume = "engineOn*(1-camPos)*(((rpm/	6900) factor[(833/	6900),(1267/	6900)])	*	((rpm/	6900) factor[(1767/	6900),(1433/	6900)]))";
			};
			class Engine2_int
			{
				sound[] = {"rds_a2port_civ\data\sounds\GOLF\int\int-golf-high-2",0.31622776,1};
				frequency = "0.8	+	((rpm/	6900) factor[(1400/	6900),(2533/	6900)])*0.2";
				volume = "engineOn*(1-camPos)*(((rpm/	6900) factor[(1400/	6900),(2033/	6900)])	*	((rpm/	6900) factor[(2733/	6900),(2200/	6900)]))";
			};
			class Engine3_int
			{
				sound[] = {"rds_a2port_civ\data\sounds\GOLF\int\int-golf-high-2",0.35481337,1};
				frequency = "0.8	+	((rpm/	6900) factor[(2200/	6900),(3267/	6900)])*0.2";
				volume = "engineOn*(1-camPos)*(((rpm/	6900) factor[(2167/	6900),(2700/	6900)])	*	((rpm/	6900) factor[(3247/	6900),(2800/	6900)]))";
			};
			class Engine4_int
			{
				sound[] = {"rds_a2port_civ\data\sounds\GOLF\int\int-golf-high-2",0.39810717,1};
				frequency = "0.8	+	((rpm/	6900) factor[(2800/	6900),(4133/	6900)])*0.2";
				volume = "engineOn*(1-camPos)*(((rpm/	6900) factor[(2767/	6900),(3200/	6900)])	*	((rpm/	6900) factor[(4100/	6900),(3433/	6900)]))";
			};
			class Engine5_int
			{
				sound[] = {"rds_a2port_civ\data\sounds\GOLF\int\int-golf-high-3",0.39810717,1};
				frequency = "0.95	+	((rpm/	6900) factor[(3400/	6900),(6900/	6900)])*0.15";
				volume = "engineOn*(1-camPos)*((rpm/	6900) factor[(3400/	6900),(4067/	6900)])";
			};
			class IdleThrust_int
			{
				sound[] = {"rds_a2port_civ\data\sounds\GOLF\int\int-golf-acce-1",0.31622776,1};
				frequency = "0.9	+	((rpm/	6900) factor[(267/	6900),(767/	6900)])*0.2";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	6900) factor[(200/	6900),(500/	6900)])	*	((rpm/	6900) factor[(900/	6900),(700/	6900)]))";
			};
			class EngineThrust_int
			{
				sound[] = {"rds_a2port_civ\data\sounds\GOLF\int\int-golf-low-1",0.35481337,1};
				frequency = "0.8	+	((rpm/	6900) factor[(600/	6900),(1300/	6900)])*0.2";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	6900) factor[(780/	6900),(833/	6900)])	*	((rpm/	6900) factor[(1100/	6900),(967/	6900)]))";
			};
			class Engine1_Thrust_int
			{
				sound[] = {"rds_a2port_civ\data\sounds\GOLF\int\int-golf-high-1",0.39810717,1};
				frequency = "0.8	+	((rpm/	6900) factor[(967/	6900),(1767/	6900)])*0.2";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	6900) factor[(833/	6900),(1267/	6900)])	*	((rpm/	6900) factor[(1767/	6900),(1433/	6900)]))";
			};
			class Engine2_Thrust_int
			{
				sound[] = {"rds_a2port_civ\data\sounds\GOLF\int\int-golf-high-2",0.4466836,1};
				frequency = "0.8	+	((rpm/	6900) factor[(1400/	6900),(2533/	6900)])*0.2";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	6900) factor[(1400/	6900),(2033/	6900)])	*	((rpm/	6900) factor[(2733/	6900),(2200/	6900)]))";
			};
			class Engine3_Thrust_int
			{
				sound[] = {"rds_a2port_civ\data\sounds\GOLF\int\int-golf-high-2",0.5011872,1};
				frequency = "0.8	+	((rpm/	6900) factor[(2200/	6900),(3267/	6900)])*0.2";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	6900) factor[(2167/	6900),(2700/	6900)])	*	((rpm/	6900) factor[(3247/	6900),(2800/	6900)]))";
			};
			class Engine4_Thrust_int
			{
				sound[] = {"rds_a2port_civ\data\sounds\GOLF\int\int-golf-high-2",0.56234133,1};
				frequency = "0.8	+	((rpm/	6900) factor[(2800/	6900),(4133/	6900)])*0.3";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	6900) factor[(2767/	6900),(3200/	6900)])	*	((rpm/	6900) factor[(4100/	6900),(3433/	6900)]))";
			};
			class Engine5_Thrust_int
			{
				sound[] = {"rds_a2port_civ\data\sounds\GOLF\int\int-golf-high-3",0.63095737,1};
				frequency = "0.9	+	((rpm/	6900) factor[(3400/	6900),(6900/	6900)])*0.2";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*((rpm/	6900) factor[(3400/	6900),(4067/	6900)])";
			};
			class Movement
			{
				sound = "soundEnviron";
				frequency = "1";
				volume = "0";
			};
			class TiresRockOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\ext_tires_dirt_soft_1",0.70794576,1.0,60};
				frequency = "1";
				volume = "camPos*rock*(speed factor[2, 20])";
			};
			class TiresSandOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\ext-tires-sand1",0.70794576,1.0,60};
				frequency = "1";
				volume = "camPos*sand*(speed factor[2, 20])";
			};
			class TiresGrassOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\ext_tires_dirt_soft_2",0.70794576,1.0,60};
				frequency = "1";
				volume = "camPos*grass*(speed factor[2, 20])";
			};
			class TiresMudOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\ext-tires-mud2",0.70794576,1.0,60};
				frequency = "1";
				volume = "camPos*mud*(speed factor[2, 20])";
			};
			class TiresGravelOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\ext_tires_gravel_1",0.70794576,1.0,60};
				frequency = "1";
				volume = "camPos*gravel*(speed factor[2, 20])";
			};
			class TiresAsphaltOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\ext_tires_asfalt_2",0.70794576,1.0,60};
				frequency = "1";
				volume = "camPos*asphalt*(speed factor[2, 20])";
			};
			class NoiseOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\noise_ext_car_3",0.56234133,1.0,90};
				frequency = "1";
				volume = "camPos*(damper0 max 0.02)*(speed factor[0, 8])";
			};
			class TiresRockIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\int_tires_dirt_soft_1",0.70794576,1.0};
				frequency = "1";
				volume = "(1-camPos)*rock*(speed factor[2, 20])";
			};
			class TiresSandIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\int-tires-sand2",0.70794576,1.0};
				frequency = "1";
				volume = "(1-camPos)*sand*(speed factor[2, 20])";
			};
			class TiresGrassIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\int_tires_dirt_soft_2",0.70794576,1.0};
				frequency = "1";
				volume = "(1-camPos)*grass*(speed factor[2, 20])";
			};
			class TiresMudIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\int-tires-mud2",0.70794576,1.0};
				frequency = "1";
				volume = "(1-camPos)*mud*(speed factor[2, 20])";
			};
			class TiresGravelIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\int_tires_gravel_1",0.70794576,1.0};
				frequency = "1";
				volume = "(1-camPos)*gravel*(speed factor[2, 20])";
			};
			class TiresAsphaltIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\int_tires_asfalt_2",0.70794576,1.0};
				frequency = "1";
				volume = "(1-camPos)*asphalt*(speed factor[2, 20])";
			};
			class NoiseIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\noise_int_car_3",0.15848932,1.0};
				frequency = "1";
				volume = "(damper0 max 0.1)*(speed factor[0, 8])*(1-camPos)";
			};
			class breaking_ext_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_04",0.70794576,1,80};
				frequency = 1;
				volume = "engineOn*camPos*asphalt*(LongSlipDrive Factor[-0.1, -0.4])*(Speed Factor[2, 15])";
			};
			class acceleration_ext_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02",0.70794576,1,80};
				frequency = 1;
				volume = "engineOn*camPos*asphalt*(LongSlipDrive Factor[0.1, 0.4])*(Speed Factor[15, 2])";
			};
			class turn_left_ext_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02",0.70794576,1,80};
				frequency = 1;
				volume = "engineOn*camPos*asphalt*(latSlipDrive Factor[0.1, 0.4])*(Speed Factor[2, 15])";
			};
			class turn_right_ext_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02",0.70794576,1,80};
				frequency = 1;
				volume = "engineOn*camPos*asphalt*(latSlipDrive Factor[-0.1, -0.4])*(Speed Factor[2, 15])";
			};
			class breaking_ext_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_14_dirt_breaking",0.70794576,1,60};
				frequency = 1;
				volume = "engineOn*camPos*(1-asphalt)*(LongSlipDrive Factor[-0.1, -0.4])*(Speed Factor[1, 15])";
			};
			class acceleration_ext_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_16_dirt_acceleration",0.70794576,1,60};
				frequency = 1;
				volume = "engineOn*camPos*(1-asphalt)*(LongSlipDrive Factor[0.1, 0.4])*(Speed Factor[15, 1])";
			};
			class turn_left_ext_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_18_dirt",0.70794576,1,60};
				frequency = 1;
				volume = "engineOn*camPos*(1-asphalt)*(latSlipDrive Factor[0.1, 0.4])*(Speed Factor[1, 15])";
			};
			class turn_right_ext_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_18_dirt",0.70794576,1,60};
				frequency = 1;
				volume = "engineOn*camPos*(1-asphalt)*(latSlipDrive Factor[-0.1, -0.4])*(Speed Factor[1, 15])";
			};
			class breaking_int_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_04_int",0.31622776,1};
				frequency = 1;
				volume = "engineOn*asphalt*(1-camPos)*(LongSlipDrive Factor[-0.1, -0.4])*(Speed Factor[1, 15])";
			};
			class acceleration_int_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02_int",0.31622776,1};
				frequency = 1;
				volume = "engineOn*asphalt*(1-camPos)*(LongSlipDrive Factor[0.1, 0.4])*(Speed Factor[15, 1])";
			};
			class turn_left_int_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02_int",0.31622776,1};
				frequency = 1;
				volume = "engineOn*asphalt*(1-camPos)*(latSlipDrive Factor[0.1, 0.4])*(Speed Factor[1, 15])";
			};
			class turn_right_int_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02_int",0.31622776,1};
				frequency = 1;
				volume = "engineOn*asphalt*(1-camPos)*(latSlipDrive Factor[-0.1, -0.4])*(Speed Factor[1, 15])";
			};
			class breaking_int_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_14_dirt_breaking_int",0.31622776,1};
				frequency = 1;
				volume = "engineOn*(1-asphalt)*(1-camPos)*(LongSlipDrive Factor[-0.1, -0.4])*(Speed Factor[1, 15])";
			};
			class acceleration_int_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_16_dirt_acceleration_int",0.31622776,1};
				frequency = 1;
				volume = "engineOn*(1-asphalt)*(1-camPos)*(LongSlipDrive Factor[0.1, 0.4])*(Speed Factor[15, 1])";
			};
			class turn_left_int_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_18_dirt_int",0.31622776,1};
				frequency = 1;
				volume = "engineOn*(1-asphalt)*(1-camPos)*(latSlipDrive Factor[0.1, 0.4])*(Speed Factor[1, 15])";
			};
			class turn_right_int_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_18_dirt_int",0.31622776,1};
				frequency = 1;
				volume = "engineOn*(1-asphalt)*(1-camPos)*(latSlipDrive Factor[-0.1, -0.4])*(Speed Factor[1, 15])";
			};
		};
		class Turrets{};
		cargoaction[] = {"Golf_Cargo01","Golf_Cargo02","Golf_Cargo02","Golf_Cargo03"};
		memorypointsgetincargo[] = {"pos cargo 1","pos cargo 2","pos cargo 3","pos cargo 4"};
		memorypointsgetincargodir[] = {"pos cargo dir 1","pos cargo dir 2","pos cargo dir 3","pos cargo dir 4"};
		driverDoor = "Door_LF";
		cargoDoors[] = {"Door_RF","Door_LB","Door_RB","Trunk"};
		driverCompartments = "Compartment1";
		cargoCompartments[] = {"Compartment1","Compartment2","Compartment2","Compartment3"};
		class AnimationSources: AnimationSources
		{
			class Door_LF
			{
				source = "door";
				animPeriod = 1.0;
			};
			class Door_LB: Door_LF{};
			class Door_RB: Door_LF{};
			class Door_RF: Door_LF{};
			class Trunk: Door_LF{};
		};
		class UserActions
		{
			class openDoors
			{
				displayName = "Ouvrir le coffre"; //Open Trunk
				position = "trunk_action";
				radius = 1;
				showWindow = 0;
				condition = "(this animationPhase ""trunk"" < 0.5)";
				statement = "this animateDoor [""trunk"",1]";
				onlyForPlayer = 0;
			};
			class closeDoors: openDoors
			{
				displayName = "Fermer le coffre"; //Close Trunk
				condition = "(this animationPhase ""trunk"" > 0.5)";
				statement = "this animateDoor [""trunk"",0]";
			};
		};
		class HitPoints: HitPoints
		{
			class HitLFWheel: HitLFWheel
			{
				armor = 0.175;
				passThrough = 0.3;
			};
			class HitLF2Wheel: HitLF2Wheel
			{
				armor = 0.175;
				passThrough = 0.3;
			};
			class HitRFWheel: HitRFWheel
			{
				armor = 0.175;
				passThrough = 0.3;
			};
			class HitRF2Wheel: HitRF2Wheel
			{
				armor = 0.175;
				passThrough = 0.3;
			};
			class HitFuel
			{
				armor = 0.5;
				material = -1;
				name = "palivo";
				visual = "";
				passThrough = 0.2;
			};
			class HitEngine
			{
				armor = 0.5;
				material = -1;
				name = "motor";
				visual = "";
				passThrough = 0.2;
			};
			class HitBody: HitBody
			{
				name = "karoserie";
				visual = "camo1";
				passThrough = 1;
			};
			class HitGlass1: HitGlass1
			{
				armor = 0.1;
			};
			class HitGlass2: HitGlass2
			{
				armor = 0.05;
			};
			class HitGlass3: HitGlass3
			{
				armor = 0.05;
			};
			class HitGlass4: HitGlass4
			{
				visual = "glass4";
				armor = 0.05;
			};
			class HitGlass5: HitGlass5
			{
				armor = 0.05;
			};
			class HitGlass6: HitGlass6
			{
				armor = 0.05;
			};
		};
		getInAction = "GetInOffroad";
		getOutAction = "GetOutLow";
		cargoGetInAction[] = {"GetInLow"};
		cargoGetOutAction[] = {"GetOutLow"};
		memorypointtrackbll = "Stopa ZLL";
		memorypointtrackblr = "Stopa ZLP";
		memorypointtrackbrl = "Stopa ZPL";
		memorypointtrackbrr = "Stopa ZPP";
		memorypointtrackfll = "Stopa PLL";
		memorypointtrackflr = "Stopa PLP";
		memorypointtrackfrl = "Stopa PPL";
		memorypointtrackfrr = "Stopa PPP";
		dustFrontLeftPos = "Stopa PPL";
		dustFrontRightPos = "Stopa PLP";
		dustBackLeftPos = "Stopa ZLL";
		dustBackRightPos = "Stopa ZLP";
		class Damage
		{
			mat[] = {"rds_a2port_civ\VWGOLF\Data\VWgolf_body.rvmat","rds_a2port_civ\VWGOLF\Data\vwgolf_body_damage.rvmat","rds_a2port_civ\VWGOLF\Data\VWgolf_body_destruct.rvmat","rds_a2port_civ\VWGOLF\Data\VWGolf_carriage.rvmat","rds_a2port_civ\VWGOLF\Data\VWGolf_carriage.rvmat","rds_a2port_civ\VWGOLF\Data\VWGolf_carriage_destruct.rvmat","rds_a2port_civ\VWGOLF\Data\VWgolf_interier2.rvmat","rds_a2port_civ\VWGOLF\Data\VWgolf_interier2.rvmat","rds_a2port_civ\VWGOLF\Data\VWgolf_interier2_destruct.rvmat","rds_a2port_civ\VWGOLF\Data\VWgolf_interier.rvmat","rds_a2port_civ\VWGOLF\Data\VWgolf_interier.rvmat","rds_a2port_civ\VWGOLF\Data\VWgolf_interier_destruct.rvmat","rds_a2port_civ\VWGOLF\Data\VWgolf_sklo.rvmat","rds_a2port_civ\VWGOLF\Data\VWgolf_sklo_damage.rvmat","rds_a2port_civ\VWGOLF\Data\VWgolf_sklo_damage.rvmat","rds_a2port_civ\VWGOLF\Data\VWgolf_sklo_in.rvmat","rds_a2port_civ\VWGOLF\Data\VWgolf_sklo_in_damage.rvmat","rds_a2port_civ\VWGOLF\Data\VWgolf_sklo_in_damage.rvmat","rds_a2port_civ\VWGOLF\Data\vwgolf_wheels.rvmat","rds_a2port_civ\VWGOLF\Data\vwgolf_wheels.rvmat","rds_a2port_civ\VWGOLF\Data\vwgolf_wheels_destruct.rvmat","a3\data_f\default.rvmat","a3\data_f\default.rvmat","a3\data_f\default_destruct.rvmat"};
			tex[] = {};
		};
		class Exhausts
		{
			class Exhaust1
			{
				position = "vyfuk start";
				direction = "vyfuk konec";
				effect = "ExhaustEffectOffroad";
			};
		};
		class Reflectors
		{
			class LSvetla
			{
				color[] = {800,900,650};
				ambient[] = {2,2,2};
				position = "L svetlo";
				direction = "konec L svetla";
				hitpoint = "L svetlo";
				selection = "L svetlo";
				size = 1;
				innerAngle = 30;
				outerAngle = 120;
				coneFadeCoef = 10;
				intensity = 2;
				useFlare = 1;
				dayLight = 1;
				flareSize = 1;
				class Attenuation
				{
					start = 2;
					constant = 0;
					linear = 0.1;
					quadratic = 0.01;
					hardLimitStart = 100;
					hardLimitEnd = 300;
				};
			};
			class RSvetla: LSvetla
			{
				position = "P svetlo";
				direction = "konec P svetla";
				hitpoint = "P svetlo";
				selection = "P svetlo";
			};
		};
		aggregateReflectors[] = {{ "LSvetla","RSvetla" }};
		class RenderTargets
		{
			class LeftMirror
			{
				renderTarget = "rendertarget0";
				class CameraView1
				{
					pointPosition = "m1p";
					pointDirection = "m1d";
					renderQuality = 2;
					renderVisionMode = 4;
					fov = 0.5;
				};
			};
			class RightMirror
			{
				renderTarget = "rendertarget1";
				class CameraView1
				{
					pointPosition = "m2p";
					pointDirection = "m2d";
					renderQuality = 2;
					renderVisionMode = 4;
					fov = 0.7;
				};
			};
			class BackMirror
			{
				renderTarget = "rendertarget2";
				class CameraView1
				{
					pointPosition = "m3p";
					pointDirection = "m3d";
					renderQuality = 2;
					renderVisionMode = 4;
					fov = 0.7;
				};
			};
		};
		//Golf
		enginePower = 110; //81
		maxOmega = 600; //481.71
		peakTorque = 340; //240
		idleRPM = 800;
		redRpm = 6900; //4600
		terrainCoef = 3; //6.5
		turnCoef = 2.5;
		precision = 10;
		brakeDistance = 3;
		acceleration = 15; //15
		fireResistance = 5;
		thrustDelay = 0.2;
		brakeIdleSpeed = 1.78;
		maxSpeed = 196; //216
		fuelCapacity = 12; //50
		wheelCircumference = 2.04;
		latency = 1;
		switchTime = 0.31;
		antiRollbarForceCoef = 1.9; //0.0
		antiRollbarForceLimit = 0.5;
		antiRollbarSpeedMin = 10;
		antiRollbarSpeedMax = 180; //80
		changeGearMinEffectivity[] = {0.95,0.15,0.95,0.95,0.95,0.95,0.95};
		class complexGearbox
		{
			GearboxRatios[] = {"R1",-3.778,"N",0,"D1",3.778,"D2",2.118,"D3",1.36,"D4",0.971,"D5",0.756};
			TransmissionRatios[] = {"High",3.389};
			gearBoxMode = "auto";
			moveOffGear = 1;
			driveString = "D";
			neutralString = "N";
			reverseString = "R";
			transmissionDelay = 0.01;
		};
		simulation = "carx";
		differentialType="rear_limited";
		/*dampersBumpCoef = 0.5;
		differentialType = "front_limited";
		frontRearSplit = 0.5;
		frontBias = 1.5;
		rearBias = 1.3;
		centreBias = 1.3;
		clutchStrength = 85;
		dampingRateFullThrottle = 0.08;
		dampingRateZeroThrottleClutchEngaged = 0.35;
		dampingRateZeroThrottleClutchDisengaged = 0.35;
		torqueCurve[] = {{ "0/4600","0/240" },{ "800/4600","199/240" },{ "1799/4600","240/240" },{ "2401/4600","240/240" },{ "3399/4600","209/240" },{ "3901/4600","194/240" },{ "4149/4600","187/240" },{ "4901/4600","30/240" }};*/
		torqueCurve[] = {{ "0/6900","0/340" },{ "800/6900","230/340" },{ "3200/6900","340/340" },{ "4900/6900","280/340" },{ "5800/6900","250/340" },{ "7200/6900","150/340" }};
		class Wheels
		{
			class LF
			{
				width = "0.1";
				boneName = "wheel_1_1";//damper
				steering = 1;
				side = "left";
				center = "wheel_1_1_axis";
				boundary = "wheel_1_1_bound";
				mass = 13;
				MOI = 14.0;
				dampingRate = 0.1;
				maxBrakeTorque = 1900;
				maxHandBrakeTorque = 0;
				suspTravelDirection[] = {0,-1,0};
				suspForceAppPointOffset = "wheel_1_1_axis";
				tireForceAppPointOffset = "wheel_1_1_axis";
				maxCompression = 0.0;//0.15
				mMaxDroop = 0.15;
				sprungMass = 145.5;
				springStrength = 45025;
				springDamperRate = 4700;
				longitudinalStiffnessPerUnitGravity = 1000;//10000
				latStiffX = 25;//2.2
				latStiffY = 180;//18.0
				frictionVsSlipGraph[] = {{ 0,1.61 },{ 0.5,1.41 },{ 1,1 }};
			};
			class LR: LF
			{
				boneName = "wheel_1_2";
				steering = 0;
				center = "wheel_1_2_axis";
				boundary = "wheel_1_2_bound";
				suspForceAppPointOffset = "wheel_1_2_axis";
				tireForceAppPointOffset = "wheel_1_2_axis";
				maxHandBrakeTorque = 3000;
			};
			class RF: LF
			{
				boneName = "wheel_2_1";
				center = "wheel_2_1_axis";
				boundary = "wheel_2_1_bound";
				suspForceAppPointOffset = "wheel_2_1_axis";
				tireForceAppPointOffset = "wheel_2_1_axis";
				steering = 1;
				side = "right";
			};
			class RR: RF
			{
				boneName = "wheel_2_2";
				steering = 0;
				center = "wheel_2_2_axis";
				boundary = "wheel_2_2_bound";
				suspForceAppPointOffset = "wheel_2_2_axis";
				tireForceAppPointOffset = "wheel_2_2_axis";
				maxHandBrakeTorque = 3000;
			};
		};
		
		class EventHandlers: EventHandlers
		{
			init = "(_this select 0) execVM ""\rds_a2port_civ\vwgolf\scripts\randomize.sqf""";
		};
		
	};
	class RDS_Golf4_Civ_Base: RDS_Golf4_Base
	{
		accuracy = 0.5;
		crew = "RDS_Profiteer1";
		faction = "rds_rus_civ";
		side = 3;
	};
	class RDS_Golf4_Civ_01: RDS_Golf4_Civ_Base
	{
		scope = 2;
		hiddenSelectionsTextures[] = {"\rds_a2port_civ\VWGOLF\Data\vwgolf_body_co.paa"};
	};
	class RDS_Octavia_Base: Car_F
	{
		model = "\rds_a2port_civ\Octavia\Octavia_ACR";
		icon = "\rds_a2port_civ\data\map_ico\icon_Octavia_ca.paa";
		picture = "\rds_a2port_civ\data\ico\Picture_Octavia_ca.paa";
		mapsize = 5;
		displayName = "Skoda Octavia II 2.0 TDI";
		HiddenSelections[] = {"camo","camo1"};
		hiddenSelectionsTextures[] = {"\rds_a2port_civ\Octavia\Data\car_body_co.paa","\rds_a2port_civ\Octavia\Data\car_body_m_co.paa"};
		driverAction = "driver_offroad01";
		attenuationEffectType = "OpenCarAttenuation";
		armor = 16;
		cost = 10000;
		transportMaxBackpacks = 6;
		transportSoldier = 3;
		wheelDamageRadiusCoef = 0.9;
		wheelDestroyRadiusCoef = 0.4;
		maxFordingDepth = 0.5;
		waterResistance = 1;
		crewCrashProtection = 0.25;
		driverLeftHandAnimName = "drivewheel";
		driverRightHandAnimName = "drivewheel";
		driverRightLegAnimName = "pedalR";
		afmax = 200;
		htmax = 1800;
		htmin = 60;
		mfact = 0;
		mfmax = 100;
		tbody = 0;
		soundAttenuationCargo[] = {1,0};
		soundGetIn[] = {"rds_a2port_civ\data\sounds\GOLF\int\int-golf-getout",0.31622776,1};
		soundGetOut[] = {"rds_a2port_civ\data\sounds\GOLF\ext\ext-golf-getout",0.31622776,1,60};
		soundDammage[] = {"",0.56234133,1};
		soundEngineOnInt[] = {"rds_a2port_civ\data\sounds\Skoda\skoda_int_start",0.4466836,1.0};
		soundEngineOnExt[] = {"rds_a2port_civ\data\sounds\Skoda\skoda_ext_start",0.5011872,1.0,200};
		soundEngineOffInt[] = {"rds_a2port_civ\data\sounds\Skoda\skoda_int_stop",0.4466836,1.0};
		soundEngineOffExt[] = {"rds_a2port_civ\data\sounds\Skoda\skoda_ext_stop",0.5011872,1.0,100};
		insideSoundCoef = 1.0;
		buildCrash0[] = {"A3\sounds_f\Vehicles\soft\noises\crash_building_01",1.0,1,200};
		buildCrash1[] = {"A3\sounds_f\Vehicles\soft\noises\crash_building_02",1.0,1,200};
		buildCrash2[] = {"A3\sounds_f\Vehicles\soft\noises\crash_building_03",1.0,1,200};
		buildCrash3[] = {"A3\sounds_f\Vehicles\soft\noises\crash_building_04",1.0,1,200};
		soundBuildingCrash[] = {"buildCrash0",0.25,"buildCrash1",0.25,"buildCrash2",0.25,"buildCrash3",0.25};
		WoodCrash0[] = {"A3\sounds_f\Vehicles\soft\noises\crash_mix_wood_01",1.0,1,200};
		WoodCrash1[] = {"A3\sounds_f\Vehicles\soft\noises\crash_mix_wood_02",1.0,1,200};
		WoodCrash2[] = {"A3\sounds_f\Vehicles\soft\noises\crash_mix_wood_03",1.0,1,200};
		WoodCrash3[] = {"A3\sounds_f\Vehicles\soft\noises\crash_mix_wood_04",1.0,1,200};
		WoodCrash4[] = {"A3\sounds_f\Vehicles\soft\noises\crash_mix_wood_05",1.0,1,200};
		WoodCrash5[] = {"A3\sounds_f\Vehicles\soft\noises\crash_mix_wood_06",1.0,1,200};
		soundWoodCrash[] = {"woodCrash0",0.166,"woodCrash1",0.166,"woodCrash2",0.166,"woodCrash3",0.166,"woodCrash4",0.166,"woodCrash5",0.166};
		ArmorCrash0[] = {"A3\sounds_f\Vehicles\soft\noises\crash_vehicle_01",1.0,1,200};
		ArmorCrash1[] = {"A3\sounds_f\Vehicles\soft\noises\crash_vehicle_02",1.0,1,200};
		ArmorCrash2[] = {"A3\sounds_f\Vehicles\soft\noises\crash_vehicle_03",1.0,1,200};
		ArmorCrash3[] = {"A3\sounds_f\Vehicles\soft\noises\crash_vehicle_04",1.0,1,200};
		soundArmorCrash[] = {"ArmorCrash0",0.25,"ArmorCrash1",0.25,"ArmorCrash2",0.25,"ArmorCrash3",0.25};
		class Sounds
		{
			class Idle_ext
			{
				sound[] = {"rds_a2port_civ\data\sounds\Skoda\skoda_ext_idle",0.2818383,1,200};
				frequency = "0.9	+	((rpm/	5000) factor[(267/	5000),(767/	5000)])*0.2";
				volume = "engineOn*camPos*(((rpm/	5000) factor[(200/	5000),(500/	5000)])	*	((rpm/	5000) factor[(900/	5000),(700/	5000)]))";
			};
			class Engine
			{
				sound[] = {"rds_a2port_civ\data\sounds\Skoda\skoda_ext_mid1",0.31622776,1,200};
				frequency = "0.8	+	((rpm/	5000) factor[(600/	5000),(1300/	5000)])*0.2";
				volume = "engineOn*camPos*(((rpm/	5000) factor[(780/	5000),(833/	5000)])	*	((rpm/	5000) factor[(1100/	5000),(967/	5000)]))";
			};
			class Engine1_ext
			{
				sound[] = {"rds_a2port_civ\data\sounds\Skoda\skoda_ext_mid1",0.35481337,1,210};
				frequency = "0.8	+	((rpm/	5000) factor[(967/	5000),(1767/	5000)])*0.2";
				volume = "engineOn*camPos*(((rpm/	5000) factor[(833/	5000),(1267/	5000)])	*	((rpm/	5000) factor[(1767/	5000),(1433/	5000)]))";
			};
			class Engine2_ext
			{
				sound[] = {"rds_a2port_civ\data\sounds\Skoda\skoda_ext_mid1",0.39810717,1,220};
				frequency = "0.8	+	((rpm/	5000) factor[(1400/	5000),(2533/	5000)])*0.2";
				volume = "engineOn*camPos*(((rpm/	5000) factor[(1400/	5000),(2033/	5000)])	*	((rpm/	5000) factor[(2733/	5000),(2200/	5000)]))";
			};
			class Engine3_ext
			{
				sound[] = {"rds_a2port_civ\data\sounds\Skoda\skoda_ext_high",0.4466836,1,230};
				frequency = "0.8	+	((rpm/	5000) factor[(2200/	5000),(3267/	5000)])*0.2";
				volume = "engineOn*camPos*(((rpm/	5000) factor[(2167/	5000),(2700/	5000)])	*	((rpm/	5000) factor[(3447/	5000),(2800/	5000)]))";
			};
			class Engine4_ext
			{
				sound[] = {"rds_a2port_civ\data\sounds\Skoda\skoda_ext_high",0.39810717,1,240};
				frequency = "0.8	+	((rpm/	5000) factor[(2800/	5000),(4133/	5000)])*0.2";
				volume = "engineOn*camPos*(((rpm/	5000) factor[(2767/	5000),(3200/	5000)])	*	((rpm/	5000) factor[(4600/	5000),(3433/	5000)]))";
			};
			class Engine5_ext
			{
				sound[] = {"rds_a2port_civ\data\sounds\Skoda\skoda_ext_high",0.35481337,1,250};
				frequency = "0.95	+	((rpm/	5000) factor[(3400/	5000),(5600/	5000)])*0.15";
				volume = "engineOn*camPos*((rpm/	5000) factor[(3400/	5000),(5067/	5000)])";
			};
			class IdleThrust
			{
				sound[] = {"rds_a2port_civ\data\sounds\Skoda\skoda_ext_idle",0.39810717,1,280};
				frequency = "0.9	+	((rpm/	5000) factor[(267/	5000),(767/	5000)])*0.2";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	5000) factor[(200/	5000),(500/	5000)])	*	((rpm/	5000) factor[(900/	5000),(700/	5000)]))";
			};
			class EngineThrust
			{
				sound[] = {"rds_a2port_civ\data\sounds\Skoda\skoda_ext_acce1",0.4466836,1,300};
				frequency = "0.8	+	((rpm/	5000) factor[(600/	5000),(1300/	5000)])*0.2";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	5000) factor[(780/	5000),(833/	5000)])	*	((rpm/	5000) factor[(1100/	5000),(967/	5000)]))";
			};
			class Engine1_Thrust_ext
			{
				sound[] = {"rds_a2port_civ\data\sounds\Skoda\skoda_ext_mid1",0.5011872,1,310};
				frequency = "0.8	+	((rpm/	5000) factor[(967/	5000),(1767/	5000)])*0.2";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	5000) factor[(833/	5000),(1267/	5000)])	*	((rpm/	5000) factor[(1767/	5000),(1433/	5000)]))";
			};
			class Engine2_Thrust_ext
			{
				sound[] = {"rds_a2port_civ\data\sounds\Skoda\skoda_ext_mid1",0.56234133,1,320};
				frequency = "0.8	+	((rpm/	5000) factor[(1400/	5000),(2533/	5000)])*0.2";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	5000) factor[(1400/	5000),(2033/	5000)])	*	((rpm/	5000) factor[(2733/	5000),(2200/	5000)]))";
			};
			class Engine3_Thrust_ext
			{
				sound[] = {"rds_a2port_civ\data\sounds\Skoda\skoda_ext_high",0.63095737,1,330};
				frequency = "0.8	+	((rpm/	5000) factor[(2200/	5000),(3267/	5000)])*0.2";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	5000) factor[(2167/	5000),(2700/	5000)])	*	((rpm/	5000) factor[(3447/	5000),(2800/	5000)]))";
			};
			class Engine4_Thrust_ext
			{
				sound[] = {"rds_a2port_civ\data\sounds\Skoda\skoda_ext_high",0.56234133,1,340};
				frequency = "0.8	+	((rpm/	5000) factor[(2800/	5000),(4133/	5000)])*0.3";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	5000) factor[(2767/	5000),(3200/	5000)])	*	((rpm/	5000) factor[(4600/	5000),(3433/	5000)]))";
			};
			class Engine5_Thrust_ext
			{
				sound[] = {"rds_a2port_civ\data\sounds\Skoda\skoda_ext_high",0.5011872,1,350};
				frequency = "0.9	+	((rpm/	5000) factor[(3400/	5000),(5600/	5000)])*0.2";
				volume = "engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*((rpm/	5000) factor[(3400/	5000),(5067/	5000)])";
			};
			class Idle_int
			{
				sound[] = {"rds_a2port_civ\data\sounds\Skoda\skoda_int_idle",0.25118864,1};
				frequency = "0.9	+	((rpm/	5000) factor[(267/	5000),(767/	5000)])*0.2";
				volume = "engineOn*(1-camPos)*(((rpm/	5000) factor[(200/	5000),(500/	5000)])	*	((rpm/	5000) factor[(900/	5000),(700/	5000)]))";
			};
			class Engine_int
			{
				sound[] = {"rds_a2port_civ\data\sounds\Skoda\skoda_int_mid1",0.2818383,1};
				frequency = "0.8	+	((rpm/	5000) factor[(600/	5000),(1300/	5000)])*0.2";
				volume = "engineOn*(1-camPos)*(((rpm/	5000) factor[(780/	5000),(833/	5000)])	*	((rpm/	5000) factor[(1100/	5000),(967/	5000)]))";
			};
			class Engine1_int
			{
				sound[] = {"rds_a2port_civ\data\sounds\Skoda\skoda_int_mid1",0.31622776,1};
				frequency = "0.8	+	((rpm/	5000) factor[(967/	5000),(1767/	5000)])*0.2";
				volume = "engineOn*(1-camPos)*(((rpm/	5000) factor[(833/	5000),(1267/	5000)])	*	((rpm/	5000) factor[(1767/	5000),(1433/	5000)]))";
			};
			class Engine2_int
			{
				sound[] = {"rds_a2port_civ\data\sounds\Skoda\skoda_int_high",0.35481337,1};
				frequency = "0.8	+	((rpm/	5000) factor[(1400/	5000),(2533/	5000)])*0.2";
				volume = "engineOn*(1-camPos)*(((rpm/	5000) factor[(1400/	5000),(2033/	5000)])	*	((rpm/	5000) factor[(2733/	5000),(2200/	5000)]))";
			};
			class Engine3_int
			{
				sound[] = {"rds_a2port_civ\data\sounds\Skoda\skoda_int_high",0.39810717,1};
				frequency = "0.8	+	((rpm/	5000) factor[(2200/	5000),(3267/	5000)])*0.2";
				volume = "engineOn*(1-camPos)*(((rpm/	5000) factor[(2167/	5000),(2700/	5000)])	*	((rpm/	5000) factor[(3447/	5000),(2800/	5000)]))";
			};
			class Engine4_int
			{
				sound[] = {"rds_a2port_civ\data\sounds\Skoda\skoda_int_high",0.4466836,1};
				frequency = "0.8	+	((rpm/	5000) factor[(2800/	5000),(4133/	5000)])*0.2";
				volume = "engineOn*(1-camPos)*(((rpm/	5000) factor[(2767/	5000),(3200/	5000)])	*	((rpm/	5000) factor[(4600/	5000),(3433/	5000)]))";
			};
			class Engine5_int
			{
				sound[] = {"rds_a2port_civ\data\sounds\Skoda\skoda_int_high",0.5011872,1};
				frequency = "0.95	+	((rpm/	5000) factor[(3400/	5000),(5600/	5000)])*0.15";
				volume = "engineOn*(1-camPos)*((rpm/	5000) factor[(3400/	5000),(5067/	5000)])";
			};
			class IdleThrust_int
			{
				sound[] = {"rds_a2port_civ\data\sounds\Skoda\skoda_int_acce1",0.35481337,1};
				frequency = "0.9	+	((rpm/	5000) factor[(267/	5000),(767/	5000)])*0.2";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	5000) factor[(200/	5000),(500/	5000)])	*	((rpm/	5000) factor[(900/	5000),(700/	5000)]))";
			};
			class EngineThrust_int
			{
				sound[] = {"rds_a2port_civ\data\sounds\Skoda\skoda_int_mid1",0.39810717,1};
				frequency = "0.8	+	((rpm/	5000) factor[(600/	5000),(1300/	5000)])*0.2";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	5000) factor[(780/	5000),(833/	5000)])	*	((rpm/	5000) factor[(1100/	5000),(967/	5000)]))";
			};
			class Engine1_Thrust_int
			{
				sound[] = {"rds_a2port_civ\data\sounds\Skoda\skoda_int_mid1",0.4466836,1};
				frequency = "0.8	+	((rpm/	5000) factor[(967/	5000),(1767/	5000)])*0.2";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	5000) factor[(833/	5000),(1267/	5000)])	*	((rpm/	5000) factor[(1767/	5000),(1433/	5000)]))";
			};
			class Engine2_Thrust_int
			{
				sound[] = {"rds_a2port_civ\data\sounds\Skoda\skoda_int_high",0.5011872,1};
				frequency = "0.8	+	((rpm/	5000) factor[(1400/	5000),(2533/	5000)])*0.2";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	5000) factor[(1400/	5000),(2033/	5000)])	*	((rpm/	5000) factor[(2733/	5000),(2200/	5000)]))";
			};
			class Engine3_Thrust_int
			{
				sound[] = {"rds_a2port_civ\data\sounds\Skoda\skoda_int_high",0.5011872,1};
				frequency = "0.8	+	((rpm/	5000) factor[(2200/	5000),(3267/	5000)])*0.2";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	5000) factor[(2167/	5000),(2700/	5000)])	*	((rpm/	5000) factor[(3447/	5000),(2800/	5000)]))";
			};
			class Engine4_Thrust_int
			{
				sound[] = {"rds_a2port_civ\data\sounds\Skoda\skoda_int_high",0.56234133,1};
				frequency = "0.8	+	((rpm/	5000) factor[(2800/	5000),(4133/	5000)])*0.3";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	5000) factor[(2767/	5000),(3200/	5000)])	*	((rpm/	5000) factor[(4600/	5000),(3433/	5000)]))";
			};
			class Engine5_Thrust_int
			{
				sound[] = {"rds_a2port_civ\data\sounds\Skoda\skoda_int_high",0.63095737,1};
				frequency = "0.9	+	((rpm/	5000) factor[(3400/	5000),(5600/	5000)])*0.2";
				volume = "engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*((rpm/	5000) factor[(3400/	5000),(5067/	5000)])";
			};
			class Movement
			{
				sound = "soundEnviron";
				frequency = "1";
				volume = "0";
			};
			class TiresRockOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\ext_tires_dirt_soft_1",0.56234133,1.0,60};
				frequency = "1";
				volume = "camPos*rock*(speed factor[2, 20])";
			};
			class TiresSandOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\ext-tires-sand1",0.56234133,1.0,60};
				frequency = "1";
				volume = "camPos*sand*(speed factor[2, 20])";
			};
			class TiresGrassOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\ext_tires_dirt_soft_2",0.56234133,1.0,60};
				frequency = "1";
				volume = "camPos*grass*(speed factor[2, 20])";
			};
			class TiresMudOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\ext-tires-mud2",0.56234133,1.0,60};
				frequency = "1";
				volume = "camPos*mud*(speed factor[2, 20])";
			};
			class TiresGravelOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\ext_tires_gravel_1",0.56234133,1.0,60};
				frequency = "1";
				volume = "camPos*gravel*(speed factor[2, 20])";
			};
			class TiresAsphaltOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\ext_tires_asfalt_2",0.8912509,1.0,60};
				frequency = "1";
				volume = "camPos*asphalt*(speed factor[2, 20])";
			};
			class NoiseOut
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\noise_ext_car_3",0.31622776,1.0,90};
				frequency = "1";
				volume = "camPos*(damper0 max 0.02)*(speed factor[0, 8])";
			};
			class TiresRockIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\int_tires_dirt_soft_1",0.4466836,1.0};
				frequency = "1";
				volume = "(1-camPos)*rock*(speed factor[2, 20])";
			};
			class TiresSandIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\int-tires-sand2",0.4466836,1.0};
				frequency = "1";
				volume = "(1-camPos)*sand*(speed factor[2, 20])";
			};
			class TiresGrassIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\int_tires_dirt_soft_2",0.4466836,1.0};
				frequency = "1";
				volume = "(1-camPos)*grass*(speed factor[2, 20])";
			};
			class TiresMudIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\int-tires-mud2",0.4466836,1.0};
				frequency = "1";
				volume = "(1-camPos)*mud*(speed factor[2, 20])";
			};
			class TiresGravelIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\int_tires_gravel_1",0.4466836,1.0};
				frequency = "1";
				volume = "(1-camPos)*gravel*(speed factor[2, 20])";
			};
			class TiresAsphaltIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\tires\int_tires_asfalt_2",0.4466836,1.0};
				frequency = "1";
				volume = "(1-camPos)*asphalt*(speed factor[2, 20])";
			};
			class NoiseIn
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\noise_int_car_3",0.19952624,1.0};
				frequency = "1";
				volume = "(damper0 max 0.1)*(speed factor[0, 8])*(1-camPos)";
			};
			class breaking_ext_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_04",0.70794576,1,80};
				frequency = 1;
				volume = "engineOn*camPos*asphalt*(LongSlipDrive Factor[-0.15, -0.3])*(Speed Factor[2, 10])";
			};
			class acceleration_ext_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02",0.70794576,1,80};
				frequency = 1;
				volume = "engineOn*camPos*asphalt*(LongSlipDrive Factor[0.15, 0.3])*(Speed Factor[10, 0])";
			};
			class turn_left_ext_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02",0.70794576,1,80};
				frequency = 1;
				volume = "engineOn*camPos*asphalt*(latSlipDrive Factor[0.15, 0.3])*(Speed Factor[0, 10])";
			};
			class turn_right_ext_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02",0.70794576,1,80};
				frequency = 1;
				volume = "engineOn*camPos*asphalt*(latSlipDrive Factor[-0.15, -0.3])*(Speed Factor[0, 10])";
			};
			class breaking_ext_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_14_dirt_breaking",0.70794576,1,60};
				frequency = 1;
				volume = "engineOn*camPos*(1-asphalt)*(LongSlipDrive Factor[-0.15, -0.3])*(Speed Factor[2, 10])";
			};
			class acceleration_ext_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\acceleration_dirt_ext_1",0.70794576,1,60};
				frequency = 1;
				volume = "engineOn*camPos*(1-asphalt)*(LongSlipDrive Factor[0.15, 0.3])*(Speed Factor[10, 0])";
			};
			class turn_left_ext_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_18_dirt",0.70794576,1,60};
				frequency = 1;
				volume = "engineOn*camPos*(1-asphalt)*(latSlipDrive Factor[0.15, 0.3])*(Speed Factor[0, 10])";
			};
			class turn_right_ext_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_18_dirt",0.70794576,1,60};
				frequency = 1;
				volume = "engineOn*camPos*(1-asphalt)*(latSlipDrive Factor[-0.15, -0.3])*(Speed Factor[0, 10])";
			};
			class breaking_int_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_04_int",0.39810717,1};
				frequency = 1;
				volume = "engineOn*asphalt*(1-camPos)*(LongSlipDrive Factor[-0.1, -0.3])*(Speed Factor[1,15])";
			};
			class acceleration_int_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02_int",0.39810717,1};
				frequency = 1;
				volume = "engineOn*asphalt*(1-camPos)*(LongSlipDrive Factor[0.1, 0.3])*(Speed Factor[15, 1])";
			};
			class turn_left_int_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02_int",0.39810717,1};
				frequency = 1;
				volume = "engineOn*asphalt*(1-camPos)*(latSlipDrive Factor[0.1, 0.3])*(Speed Factor[1, 15])";
			};
			class turn_right_int_road
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02_int",0.39810717,1};
				frequency = 1;
				volume = "engineOn*asphalt*(1-camPos)*(latSlipDrive Factor[-0.1, -0.3])*(Speed Factor[1, 15])";
			};
			class breaking_int_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_14_dirt_breaking_int",0.39810717,1};
				frequency = 1;
				volume = "engineOn*(1-asphalt)*(1-camPos)*(LongSlipDrive Factor[-0.1, -0.3])*(Speed Factor[2, 15])";
			};
			class acceleration_int_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\acceleration_dirt_int_1",0.39810717,1};
				frequency = 1;
				volume = "engineOn*(1-asphalt)*(1-camPos)*(LongSlipDrive Factor[0.1, 0.3])*(Speed Factor[15, 2])";
			};
			class turn_left_int_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_18_dirt_int",0.39810717,1};
				frequency = 1;
				volume = "engineOn*(1-asphalt)*(1-camPos)*(latSlipDrive Factor[0.1, 0.3])*(Speed Factor[2, 15])";
			};
			class turn_right_int_dirt
			{
				sound[] = {"A3\Sounds_F\vehicles\soft\noises\slipping_tires_18_dirt_int",0.39810717,1};
				frequency = 1;
				volume = "engineOn*(1-asphalt)*(1-camPos)*(latSlipDrive Factor[-0.1, -0.3])*(Speed Factor[2, 15])";
			};
		};
		class Turrets{};
		cargoaction[] = {"Golf_Cargo01","Golf_Cargo02","Golf_Cargo02","Golf_Cargo03"};
		memorypointsgetincargo[] = {"pos cargo 1","pos cargo 2","pos cargo 3"};
		memorypointsgetincargodir[] = {"pos cargo dir 1","pos cargo dir 2","pos cargo dir 3"};
		driverDoor = "Door_LF";
		cargoDoors[] = {};
		driverCompartments = "Compartment1";
		cargoCompartments[] = {"Compartment1","Compartment2","Compartment2","Compartment3"};
		class AnimationSources: AnimationSources{};
		class HitPoints: HitPoints
		{
			class HitLFWheel: HitLFWheel
			{
				armor = 0.175;
				passThrough = 0.3;
			};
			class HitLF2Wheel: HitLF2Wheel
			{
				armor = 0.175;
				passThrough = 0.3;
			};
			class HitRFWheel: HitRFWheel
			{
				armor = 0.175;
				passThrough = 0.3;
			};
			class HitRF2Wheel: HitRF2Wheel
			{
				armor = 0.175;
				passThrough = 0.3;
			};
			class HitFuel
			{
				armor = 0.5;
				material = -1;
				name = "palivo";
				visual = "";
				passThrough = 0.2;
			};
			class HitEngine
			{
				armor = 0.5;
				material = -1;
				name = "motor";
				visual = "";
				passThrough = 0.2;
			};
			class HitBody: HitBody
			{
				name = "karoserie";
				visual = "camo1";
				passThrough = 1;
			};
			class HitGlass1: HitGlass1
			{
				armor = 0.1;
			};
			class HitGlass2: HitGlass2
			{
				armor = 0.05;
			};
			class HitGlass3: HitGlass3
			{
				armor = 0.05;
			};
			class HitGlass4: HitGlass4
			{
				visual = "glass4";
				armor = 0.05;
			};
		};
		getInAction = "GetInOffroad";
		getOutAction = "GetOutLow";
		cargoGetInAction[] = {"GetInLow"};
		cargoGetOutAction[] = {"GetOutLow"};
		memorypointtrackbll = "Stopa ZLL";
		memorypointtrackblr = "Stopa ZLP";
		memorypointtrackbrl = "Stopa ZPL";
		memorypointtrackbrr = "Stopa ZPP";
		memorypointtrackfll = "Stopa PLL";
		memorypointtrackflr = "Stopa PLP";
		memorypointtrackfrl = "Stopa PPL";
		memorypointtrackfrr = "Stopa PPP";
		dustFrontLeftPos = "Stopa PPL";
		dustFrontRightPos = "Stopa PLP";
		dustBackLeftPos = "Stopa ZLL";
		dustBackRightPos = "Stopa ZLP";
		class Damage
		{
			mat[] = {"rds_a2port_civ\Octavia\Data\car_body1.rvmat","rds_a2port_civ\Octavia\Data\car_body1_damage.rvmat","rds_a2port_civ\Octavia\Data\car_body1_destruct.rvmat","rds_a2port_civ\Octavia\Data\car_body.rvmat","rds_a2port_civ\Octavia\Data\car_body_damage.rvmat","rds_a2port_civ\Octavia\Data\car_body_destruct.rvmat","rds_a2port_civ\Octavia\Data\car_chrom.rvmat","rds_a2port_civ\Octavia\Data\car_chrom_damage.rvmat","rds_a2port_civ\Octavia\Data\car_chrom_destruct.rvmat","rds_a2port_civ\Octavia\Data\car_interier.rvmat","rds_a2port_civ\Octavia\Data\car_interier_damage.rvmat","rds_a2port_civ\Octavia\Data\car_interier_destruct.rvmat","A3\data_f\glass_veh_int.rvmat","A3\data_f\Glass_veh_damage.rvmat","A3\data_f\Glass_veh_damage.rvmat","A3\data_f\glass_veh.rvmat","A3\data_f\Glass_veh_damage.rvmat","A3\data_f\Glass_veh_damage.rvmat","a3\data_f\default.rvmat","a3\data_f\default.rvmat","a3\data_f\default_destruct.rvmat"};
			tex[] = {};
		};
		class Exhausts
		{
			class Exhaust1
			{
				position = "vyfuk start";
				direction = "vyfuk konec";
				effect = "ExhaustEffectOffroad";
			};
		};
		class Reflectors
		{
			class LSvetla
			{
				color[] = {800,900,650};
				ambient[] = {2,2,2};
				position = "L svetlo";
				direction = "konec L svetla";
				hitpoint = "L svetlo";
				selection = "L svetlo";
				size = 1;
				innerAngle = 30;
				outerAngle = 120;
				coneFadeCoef = 10;
				intensity = 2;
				useFlare = 1;
				dayLight = 1;
				flareSize = 1;
				class Attenuation
				{
					start = 2;
					constant = 0;
					linear = 0.1;
					quadratic = 0.01;
					hardLimitStart = 100;
					hardLimitEnd = 300;
				};
			};
			class RSvetla: LSvetla
			{
				position = "P svetlo";
				direction = "konec P svetla";
				hitpoint = "P svetlo";
				selection = "P svetlo";
			};
		};
		aggregateReflectors[] = {{ "LSvetla","RSvetla" }};
		class RenderTargets
		{
			class LeftMirror
			{
				renderTarget = "rendertarget0";
				class CameraView1
				{
					pointPosition = "m1p";
					pointDirection = "m1d";
					renderQuality = 2;
					renderVisionMode = 4;
					fov = 0.5;
				};
			};
			class RightMirror
			{
				renderTarget = "rendertarget1";
				class CameraView1
				{
					pointPosition = "m2p";
					pointDirection = "m2d";
					renderQuality = 2;
					renderVisionMode = 4;
					fov = 0.7;
				};
			};
			class BackMirror
			{
				renderTarget = "rendertarget2";
				class CameraView1
				{
					pointPosition = "m3p";
					pointDirection = "m3d";
					renderQuality = 2;
					renderVisionMode = 4;
					fov = 0.7;
				};
			};
		};
		//Octavia
		enginePower = 150; //150
		maxOmega = 523.6;
		peakTorque = 350;
		idleRpm = 800;
		redRpm = 5000;
		terrainCoef = 4; //6.5
		turnCoef = 5;
		precision = 20;
		brakeDistance = 7;
		acceleration = 15;
		fireResistance = 5;
		thrustDelay = 0.2;
		brakeIdleSpeed = 1.78;
		maxSpeed = 206; //216
		fuelCapacity = 12; //50
		wheelCircumference = 2.135;
		latency = 1;
		switchTime = 0.31;
		antiRollbarForceCoef = 1.9;
		antiRollbarForceLimit = 5;
		antiRollbarSpeedMin = 10;
		antiRollbarSpeedMax = 150;
		changeGearMinEffectivity[] = {0.95,0.15,0.95,0.95,0.95,0.95,0.95,0.95};
		class complexGearbox
		{
			GearboxRatios[] = {"R1",-4.55,"N",0,"D1",3.77,"D2",1.96,"D3",1.26,"D4",0.87,"D5",0.86,"D6",0.72};
			TransmissionRatios[] = {"High",3.45};
			gearBoxMode = "auto";
			moveOffGear = 1;
			driveString = "D";
			neutralString = "N";
			reverseString = "R";
			transmissionDelay = 0.01;
		};
		simulation = "carx";
		dampersBumpCoef = 0.5;
		differentialType = "front_limited";
		frontRearSplit = 0.5;
		frontBias = 1.5;
		rearBias = 1.3;
		centreBias = 1.3;
		clutchStrength = 85;
		dampingRateFullThrottle = 0.08;
		dampingRateZeroThrottleClutchEngaged = 0.35;
		dampingRateZeroThrottleClutchDisengaged = 0.35;
		torqueCurve[] = {{ "0/5000","0/350" },{ "800/5000","262/350" },{ "1750/5000","350/350" },{ "2750/5000","350/350" },{ "3400/5000","329/350" },{ "3900/5000","298/350" },{ "4200/5000","284/350" },{ "5300/5000","0/350" }};
		class Wheels
		{
			class LF
			{
				width = "0.1";
				boneName = "wheel_1_1_damper";
				steering = 1;
				side = "left";
				center = "wheel_1_1_axis";
				boundary = "wheel_1_1_bound";
				mass = 13;
				MOI = 14.0;
				dampingRate = 0.1;
				maxBrakeTorque = 2900;
				maxHandBrakeTorque = 0;
				suspTravelDirection[] = {0,-1,0};
				suspForceAppPointOffset = "wheel_1_1_axis";
				tireForceAppPointOffset = "wheel_1_1_axis";
				maxCompression = 0.15;
				mMaxDroop = 0.15;
				sprungMass = 145.5;
				springStrength = 45025;
				springDamperRate = 4700;
				longitudinalStiffnessPerUnitGravity = 10000;
				latStiffX = 3.2;
				latStiffY = 22.0;
				frictionVsSlipGraph[] = {{ 0,1.61 },{ 0.5,1.41 },{ 1,1 }};
			};
			class LR: LF
			{
				boneName = "wheel_1_2_damper";
				steering = 0;
				center = "wheel_1_2_axis";
				boundary = "wheel_1_2_bound";
				suspForceAppPointOffset = "wheel_1_2_axis";
				tireForceAppPointOffset = "wheel_1_2_axis";
				maxHandBrakeTorque = 3000;
			};
			class RF: LF
			{
				boneName = "wheel_2_1_damper";
				center = "wheel_2_1_axis";
				boundary = "wheel_2_1_bound";
				suspForceAppPointOffset = "wheel_2_1_axis";
				tireForceAppPointOffset = "wheel_2_1_axis";
				steering = 1;
				side = "right";
			};
			class RR: RF
			{
				boneName = "wheel_2_2_damper";
				steering = 0;
				center = "wheel_2_2_axis";
				boundary = "wheel_2_2_bound";
				suspForceAppPointOffset = "wheel_2_2_axis";
				tireForceAppPointOffset = "wheel_2_2_axis";
				maxHandBrakeTorque = 3000;
			};
		};
		/*
		class EventHandlers: EventHandlers
		{
			init = "(_this select 0) execVM ""\rds_a2port_civ\octavia\scripts\randomize.sqf""";
		};*/
	};
	class RDS_Octavia_Civ_Base: RDS_Octavia_Base
	{
		accuracy = 0.5;
		crew = "RDS_Profiteer3";
		faction = "rds_rus_civ";
		side = 3;
	};
	class RDS_Octavia_Civ_01: RDS_Octavia_Civ_Base
	{
		scope = 2;
	};
	class C_Hatchback_01_F;
	class C_SUV_01_F;
	class C_Van_01_transport_F;
	class C_Van_01_fuel_F;
	class C_Van_01_box_F;
	class RDS_Hatchback_01_F: C_Hatchback_01_F
	{
		crew = "RDS_Citizen3";
		faction = "rds_rus_civ";
	};
	class RDS_SUV_01_F: C_SUV_01_F
	{
		crew = "RDS_Functionary1";
		faction = "rds_rus_civ";
	};
	class RDS_Van_01_transport_F: C_Van_01_transport_F
	{
		crew = "RDS_Worker1";
		faction = "rds_rus_civ";
	};
	class RDS_Van_01_fuel_F: C_Van_01_fuel_F
	{
		crew = "RDS_Worker2";
		faction = "rds_rus_civ";
	};
	class RDS_Van_01_box_F: C_Van_01_box_F
	{
		crew = "RDS_Worker3";
		faction = "rds_rus_civ";
	};
};
//};
