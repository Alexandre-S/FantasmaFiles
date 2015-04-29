////////////////////////////////////////////////////////////////////
//DeRap: Produced from mikero's Dos Tools Dll version 4.97
//Wed Apr 29 14:49:47 2015 : Source 'file' date Wed Apr 29 14:49:47 2015
//http://dev-heaven.net/projects/list_files/mikero-pbodll
////////////////////////////////////////////////////////////////////

#define _ARMA_

//Class rpa_rve_opfor : typhoon_refined\config.bin{
class CfgPatches
{
	class rve_typhoon
	{
		units[] = {"O_Truck_03_transport_F","O_Truck_03_covered_F","O_Truck_03_repair_F","O_Truck_03_ammo_F","O_Truck_03_fuel_F","O_Truck_03_medical_F","O_Truck_03_device_F"};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {"A3_Soft_F_EPC_Truck_03"};
	};
};
class CfgVehicles
{
	class Truck_F;
	class Truck_03_base_F: Truck_F
	{
		author = "BI; edited by RP";
		terrainCoef = 1.8;
		wheelCircumference = 3.776;
		turnCoef = 3.7;
		brakeIdleSpeed = 0.0;
		maxSpeed = 100;
		fuelCapacity = 250;
		fuelConsumptionRate = 36;
		normalSpeedForwardCoef = 1.0;
		slowSpeedForwardCoef = 0.45;
		class TransportMagazines
		{
			class RPA_JerryCan_Item_Full
			{
				magazine = "RPA_JerryCan_Item_Full";
				count = 4;
			};
		};
		antiRollbarForceCoef = 4;
		antiRollbarForceLimit = 5;
		antiRollbarSpeedMin = 20;
		antiRollbarSpeedMax = 50;
		class complexGearbox
		{
			GearboxRatios[] = {"R1",-4.97,"N",0,"D1",4.15,"D2",2.16,"D3",1.52,"D4",1.0,"D5",0.73,"D6",0.63};
			TransmissionRatios[] = {"High",8.53};
			gearBoxMode = "auto";
			moveOffGear = 1;
			driveString = "D";
			neutralString = "N";
			reverseString = "R";
		};
		changeGearMinEffectivity[] = {0.95,0.15,0.95,0.95,0.95,0.95,0.95,0.95};
		switchTime = 0.28;
		latency = 0.5;
		transmissionLosses = 18;
		dampersBumpCoef = 6.0;
		differentialType = "all_limited";
		frontRearSplit = 0.5;
		frontBias = 1.8;
		rearBias = 1.3;
		centreBias = 1.3;
		clutchStrength = 65.0;
		dampingRateFullThrottle = 0.08;
		dampingRateZeroThrottleClutchEngaged = 1.5;
		dampingRateZeroThrottleClutchDisengaged = 0.35;
		torqueCurve[] = {{ 0.26,0.35 },{ 0.37,0.64 },{ 0.44,0.84 },{ 0.52,1 },{ 0.59,0.99 },{ 0.74,0.92 },{ 0.87,0.84 },{ 1,0.78 }};
		maxOmega = 282.74;
		enginePower = 336;
		peakTorque = 1660;
		idleRPM = 700;
		redRPM = 2700;
		thrustDelay = 0.6;
		engineLosses = 20;
		engineBrakeCoef = 0.25;
		class Wheels
		{
			class L1
			{
				boneName = "wheel_1_1_damper";
				steering = 1;
				side = "left";
				center = "wheel_1_1_axis";
				boundary = "wheel_1_1_bound";
				width = "0.2";
				mass = 80;
				MOI = 40;
				dampingRate = 0.08;
				dampingRateDamaged = 1.0;
				dampingRateDestroyed = 1000.0;
				maxBrakeTorque = 15000;
				maxHandBrakeTorque = 0;
				suspTravelDirection[] = {0,-1,0};
				suspForceAppPointOffset = "wheel_1_1_axis";
				tireForceAppPointOffset = "wheel_1_1_axis";
				maxCompression = 0.15;
				mMaxDroop = 0.15;
				sprungMass = 2716;
				springStrength = 679083;
				springDamperRate = 34357;
				longitudinalStiffnessPerUnitGravity = 5432;
				latStiffX = 25;
				latStiffY = 180;
				frictionVsSlipGraph[] = {{ 0,1 },{ 0.5,1 },{ 1,1 }};
			};
			class L2: L1
			{
				boneName = "wheel_1_2_damper";
				steering = 1;
				center = "wheel_1_2_axis";
				boundary = "wheel_1_2_bound";
				suspForceAppPointOffset = "wheel_1_2_axis";
				tireForceAppPointOffset = "wheel_1_2_axis";
			};
			class L3: L2
			{
				boneName = "wheel_1_3_damper";
				steering = 0;
				center = "wheel_1_3_axis";
				boundary = "wheel_1_3_bound";
				suspForceAppPointOffset = "wheel_1_3_axis";
				tireForceAppPointOffset = "wheel_1_3_axis";
				sprungMass = 2500;
				springStrength = 150000;
				springDamperRate = 15000;
				maxHandBrakeTorque = 200000;
			};
			class R1: L1
			{
				boneName = "wheel_2_1_damper";
				center = "wheel_2_1_axis";
				boundary = "wheel_2_1_bound";
				suspForceAppPointOffset = "wheel_2_1_axis";
				tireForceAppPointOffset = "wheel_2_1_axis";
				steering = 1;
				side = "right";
			};
			class R2: L2
			{
				boneName = "wheel_2_2_damper";
				steering = 1;
				center = "wheel_2_2_axis";
				boundary = "wheel_2_2_bound";
				suspForceAppPointOffset = "wheel_2_2_axis";
				tireForceAppPointOffset = "wheel_2_2_axis";
				side = "right";
				maxHandBrakeTorque = 0;
			};
			class R3: L3
			{
				boneName = "wheel_2_3_damper";
				steering = 0;
				center = "wheel_2_3_axis";
				boundary = "wheel_2_3_bound";
				suspForceAppPointOffset = "wheel_2_3_axis";
				tireForceAppPointOffset = "wheel_2_3_axis";
				maxHandBrakeTorque = 200000;
			};
		};
	};
	class O_Truck_03_transport_F: Truck_03_base_F
	{
		displayName = "KamAZ 63968 Typhoon (Flatbed)";
		author = "BI; edited by RP";
	};
	class O_Truck_03_covered_F: Truck_03_base_F
	{
		displayName = "KamAZ 63968 Typhoon (Covered)";
		author = "BI; edited by RP";
	};
	class O_Truck_03_repair_F: Truck_03_base_F
	{
		displayName = "KamAZ 63968 Typhoon (Service)";
		author = "BI; edited by RP";
		supplyRadius = 3;
	};
	class O_Truck_03_ammo_F: Truck_03_base_F
	{
		displayName = "KamAZ 63968 Typhoon (Ammo)";
		author = "BI; edited by RP";
		supplyRadius = 3;
	};
	class O_Truck_03_fuel_F: Truck_03_base_F
	{
		displayName = "KamAZ 63968 Typhoon (Fuel)";
		author = "BI; edited by RP";
		supplyRadius = 3;
	};
	class O_Truck_03_medical_F: Truck_03_base_F
	{
		displayName = "KamAZ 63968 Typhoon (Medical)";
		author = "BI; edited by RP";
	};
	class O_Truck_03_device_F: Truck_03_base_F
	{
		displayName = "KamAZ 63968 Typhoon (Device)";
		author = "BI; edited by RP";
	};
};
//};
