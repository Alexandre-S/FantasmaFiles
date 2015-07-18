
	class BAF_ArmoredSUV_Base_DG1: Car_F
	{
		htMin = 60;         
		htMax = 1800;       
		afMax = 200; 			
		mfMax = 100; 		
		mFact = 1;           // Metabolism factor - number from interval <0, 1> (0 - metabolism has no influence, 1 - metabolism has full influence (no other temperature source will be considered)).
		tBody = 200;           // Metabolism temperature of the model (in celsius)
		
		scope = 0;
		
		class Reflectors
		{
			class Left
			{
				color[]={1900,1300,950};
				ambient[]={5,5,5};
				position="L svetlo";
				direction="konec L svetla";
				hitpoint="L svetlo";
				selection="L svetlo";
				size=1;
				innerAngle=100;
				outerAngle=179;
				coneFadeCoef=10;
				intensity=1;
				useFlare=0;
				dayLight=0;
				flareSize=1;
				class Attenuation
				{
					start=1;
					constant=0;
					linear=0;
					quadratic=0.25;
					hardLimitStart=30;
					hardLimitEnd=60;
				};
			};
			class Right: Left
			{
				position="P svetlo";
				direction="konec P svetla";
				hitpoint="P svetlo";
				selection="P svetlo";
			};
			class Right2: Right
			{
				useFlare=1;
				position="P svetlo";
			};
			class Left2: Left
			{
				useFlare=1;
				position="L svetlo";
			};
		};		
		aggregateReflectors[] = {{"Left", "Right"}};		

		displayName = BAF Armoured Base;
		model = "\DG_UKBAF\Vehicles\ArmoredSUV\armoredSUV_PMC.p3d";

    	icon = "\DG_UKBAF\Vehicles\ArmoredSUV\data\ui\Icon_suv_minigun_PMC.paa";
    	picture = "\DG_UKBAF\Vehicles\ArmoredSUV\data\ui\Picture_suv_minigun_PMC_ca.paa";
    	mapSize = 7;    		
		
		accuracy = 0.2;
		armor = 120;
		damageResistance = 0.03099;
		transportSoldier = 4;
		driverCompartments="Compartment1";
		cargoCompartments[]={"Compartment2"};

		weapons[] = {SportCarHorn};

		driverAction = SUV_Driver_EP1;
		cargoAction[] = {SUV_Cargo_EP1, SUV_Cargo02_EP1, SUV_Cargo01_EP1, ArmoredSUV_GunnerIn_PMC};

		outsideSoundFilter = 1;
		insideSoundCoef = 0.8;
		
		antiRollbarForceCoef	= 0; 	/// how strong is the anti-roll bar of vehicle preventing it to lose grip in turns (not any magical stuff, real ARB)
		antiRollbarForceLimit	= 0; 	/// highest possible force of ARB
		antiRollbarSpeedMin 	= 20; 	/// the roll bar force gets from zero to full in range of min and max speed
		antiRollbarSpeedMax		= 150;  	/// this simulates losing grip at high speed turns		

		maxSpeed=150;
		armorWheels=0.12;
		soundGear[]=
		{
			"",
			0.0005623413,
			1
		};
		idleRpm=800;
		redRpm=4500;
		brakeIdleSpeed=1.78;
		fuelCapacity=60;
		class complexGearbox
		{
			GearboxRatios[]=
			{
				"R1",
				-2.4749999,
				"N",
				0,
				"D1",
				2.3670001,
				"D2",
				1.67,
				"D3",
				1.238,
				"D4",
				0.99000001,
				"D5",
				0.80199999,
				"D6",
				0.60100001
			};
			TransmissionRatios[]=
			{
				"High",
				6
			};
			gearBoxMode="auto";
			moveOffGear=1;
			driveString="D";
			neutralString="N";
			reverseString="R";
		};
		simulation="carx";
		dampersBumpCoef=3;
		differentialType="all_limited";
		frontRearSplit=0.5;
		frontBias=1.3;
		rearBias=1.3;
		centreBias=1.3;
		clutchStrength=20;
		enginePower=100;
		maxOmega=471;
		peakTorque=300;
		dampingRateFullThrottle=0.2;
		dampingRateZeroThrottleClutchEngaged=2;
		dampingRateZeroThrottleClutchDisengaged=0.34999999;
		torqueCurve[]=
		{
			{0,0.15000001},
			{0.25,0.64999998},
			{0.34999999,0.75},
			{0.461,1},
			{0.60000002,0.94999999},
			{0.69999999,0.85000002},
			{0.80000001,0.75},
			{1,0.5}
		};
		changeGearMinEffectivity[]={0.94999999,0.15000001,0.94999999,0.94999999,0.94999999,0.94999999,0.94999999};
		switchTime=0.31;
		latency=1;
		class Wheels
		{
			class LF
			{
				boneName="wheel_1_1_damper";
				steering=1;
				side="left";
				center="wheel_1_1_axis";
				boundary="wheel_1_1_bound";
				width="0.126";
				mass=25;
				MOI=12.8;
				dampingRate=1;
				maxBrakeTorque=2000;
				maxHandBrakeTorque=0;
				suspTravelDirection[]={0,-1,0};
				suspForceAppPointOffset="wheel_1_1_axis";
				tireForceAppPointOffset="wheel_1_1_axis";
				maxCompression=0.050000001;
				MaxDroop=0;
				sprungMass=650;
				springStrength=56000;
				springDamperRate=12000;
				longitudinalStiffnessPerUnitGravity=10000;
				latStiffX=25;
				latStiffY=180;
				frictionVsSlipGraph[]=
				{
					{0,1},
					{0.5,1},
					{1,1}
				};
			};
			class LR: LF
			{
				boneName="wheel_1_2_damper";
				steering=0;
				center="wheel_1_2_axis";
				springStrength=74000;
				sprungMass=650;
				boundary="wheel_1_2_bound";
				suspForceAppPointOffset="wheel_1_2_axis";
				tireForceAppPointOffset="wheel_1_2_axis";
				maxHandBrakeTorque=3500;
			};
			class RF: LF
			{
				boneName="wheel_2_1_damper";
				center="wheel_2_1_axis";
				boundary="wheel_2_1_bound";
				suspForceAppPointOffset="wheel_2_1_axis";
				tireForceAppPointOffset="wheel_2_1_axis";
				steering=1;
				side="right";
			};
			class RR: LR
			{
				boneName="wheel_2_2_damper";
				side="right";
				center="wheel_2_2_axis";
				boundary="wheel_2_2_bound";
				suspForceAppPointOffset="wheel_2_2_axis";
				tireForceAppPointOffset="wheel_2_2_axis";
			};
		};
		
		attenuationEffectType="OpenCarAttenuation";
		soundGetIn[]=
		{
			"A3\Sounds_F\vehicles\soft\Offroad_01\Offroad_01-int-openclose",
			0.44668359,
			1
		};
		soundGetOut[]=
		{
			"A3\Sounds_F\vehicles\soft\Offroad_01\Offroad_01-int-openclose",
			0.44668359,
			1,
			40
		};
		soundDammage[]=
		{
			"",
			0.56234133,
			1
		};
		soundEngineOnInt[]=
		{
			"A3\Sounds_F\vehicles\soft\Offroad_01\engine_int_start",
			0.31622776,
			1
		};
		soundEngineOnExt[]=
		{
			"A3\Sounds_F\vehicles\soft\Offroad_01\engine_ext_start",
			0.39810717,
			1,
			200
		};
		soundEngineOffInt[]=
		{
			"A3\Sounds_F\vehicles\soft\Offroad_01\engine_int_stop",
			0.31622776,
			1
		};
		soundEngineOffExt[]=
		{
			"A3\Sounds_F\vehicles\soft\Offroad_01\engine_ext_stop",
			0.39810717,
			1,
			200
		};
		buildCrash0[]=
		{
			"A3\sounds_f\Vehicles\soft\noises\crash_building_01",
			1,
			1,
			150
		};
		buildCrash1[]=
		{
			"A3\sounds_f\Vehicles\soft\noises\crash_building_02",
			1,
			1,
			150
		};
		buildCrash2[]=
		{
			"A3\sounds_f\Vehicles\soft\noises\crash_building_03",
			1,
			1,
			150
		};
		buildCrash3[]=
		{
			"A3\sounds_f\Vehicles\soft\noises\crash_building_04",
			1,
			1,
			150
		};
		soundBuildingCrash[]=
		{
			"buildCrash0",
			0.25,
			"buildCrash1",
			0.25,
			"buildCrash2",
			0.25,
			"buildCrash3",
			0.25
		};
		WoodCrash0[]=
		{
			"A3\sounds_f\Vehicles\soft\noises\crash_mix_wood_01",
			1,
			1,
			100
		};
		WoodCrash1[]=
		{
			"A3\sounds_f\Vehicles\soft\noises\crash_mix_wood_02",
			1,
			1,
			100
		};
		WoodCrash2[]=
		{
			"A3\sounds_f\Vehicles\soft\noises\crash_mix_wood_03",
			1,
			1,
			100
		};
		WoodCrash3[]=
		{
			"A3\sounds_f\Vehicles\soft\noises\crash_mix_wood_04",
			1,
			1,
			100
		};
		WoodCrash4[]=
		{
			"A3\sounds_f\Vehicles\soft\noises\crash_mix_wood_05",
			1,
			1,
			100
		};
		WoodCrash5[]=
		{
			"A3\sounds_f\Vehicles\soft\noises\crash_mix_wood_06",
			1,
			1,
			100
		};
		soundWoodCrash[]=
		{
			"woodCrash0",
			0.16599999,
			"woodCrash1",
			0.16599999,
			"woodCrash2",
			0.16599999,
			"woodCrash3",
			0.16599999,
			"woodCrash4",
			0.16599999,
			"woodCrash5",
			0.16599999
		};
		ArmorCrash0[]=
		{
			"A3\sounds_f\Vehicles\soft\noises\crash_vehicle_01",
			1,
			1,
			200
		};
		ArmorCrash1[]=
		{
			"A3\sounds_f\Vehicles\soft\noises\crash_vehicle_02",
			1,
			1,
			200
		};
		ArmorCrash2[]=
		{
			"A3\sounds_f\Vehicles\soft\noises\crash_vehicle_03",
			1,
			1,
			200
		};
		ArmorCrash3[]=
		{
			"A3\sounds_f\Vehicles\soft\noises\crash_vehicle_04",
			1,
			1,
			200
		};
		soundArmorCrash[]=
		{
			"ArmorCrash0",
			0.25,
			"ArmorCrash1",
			0.25,
			"ArmorCrash2",
			0.25,
			"ArmorCrash3",
			0.25
		};
		class Sounds
		{
			class Idle_ext
			{
				sound[]=
				{
					"A3\Sounds_F\vehicles\soft\Offroad_01\engine_ext_idle",
					0.31622776,
					1,
					100
				};
				frequency="0.95	+	((rpm/	3500) factor[(200/	3500),(580/	3500)])*0.15";
				volume="engineOn*camPos*(((rpm/	3500) factor[(200/	3500),(350/	3500)])	*	((rpm/	3500) factor[(580/	3500),(400/	3500)]))";
			};
			class Engine
			{
				sound[]=
				{
					"A3\Sounds_F\vehicles\soft\Offroad_01\engine_ext_rpm1",
					0.31622776,
					1,
					200
				};
				frequency="0.9	+	((rpm/	3500) factor[(380/	3500),(960/	3500)])*0.2";
				volume="engineOn*camPos*(((rpm/	3500) factor[(380/	3500),(580/	3500)])	*	((rpm/	3500) factor[(960/	3500),(700/	3500)]))";
			};
			class Engine1_ext
			{
				sound[]=
				{
					"A3\Sounds_F\vehicles\soft\Offroad_01\engine_ext_rpm2",
					0.35481337,
					1,
					225
				};
				frequency="0.9	+	((rpm/	3500) factor[(700/	3500),(1400/	3500)])*0.2";
				volume="engineOn*camPos*(((rpm/	3500) factor[(700/	3500),(970/	3500)])	*	((rpm/	3500) factor[(1400/	3500),(1100/	3500)]))";
			};
			class Engine2_ext
			{
				sound[]=
				{
					"A3\Sounds_F\vehicles\soft\Offroad_01\engine_ext_rpm3",
					0.35481337,
					1,
					250
				};
				frequency="0.9	+	((rpm/	3500) factor[(1100/	3500),(1860/	3500)])*0.2";
				volume="engineOn*camPos*(((rpm/	3500) factor[(1100/	3500),(1430/	3500)])	*	((rpm/	3500) factor[(1860/	3500),(1570/	3500)]))";
			};
			class Engine3_ext
			{
				sound[]=
				{
					"A3\Sounds_F\vehicles\soft\Offroad_01\engine_ext_rpm4",
					0.39810717,
					1,
					275
				};
				frequency="0.95	+	((rpm/	3500) factor[(1600/	3500),(2200/	3500)])*0.2";
				volume="engineOn*camPos*(((rpm/	3500) factor[(1600/	3500),(1860/	3500)])	*	((rpm/	3500) factor[(2200/	3500),(2050/	3500)]))";
			};
			class Engine4_ext
			{
				sound[]=
				{
					"A3\Sounds_F\vehicles\soft\Offroad_01\engine_ext_rpm5",
					0.44668359,
					1,
					300
				};
				frequency="0.95	+	((rpm/	3500) factor[(2040/	3500),(2670/	3500)]) *0.2";
				volume="engineOn*camPos*(((rpm/	3500) factor[(2040/	3500),(2200/	3500)])	*	((rpm/	3500) factor[(2670/	3500),(2400/	3500)]))";
			};
			class Engine5_ext
			{
				sound[]=
				{
					"A3\Sounds_F\vehicles\soft\Offroad_01\engine_ext_rpm6",
					0.50118721,
					1,
					300
				};
				frequency="0.95	+	((rpm/	3500) factor[(2400/	3500),(3050/	3500)])*0.2";
				volume="engineOn*camPos*(((rpm/	3500) factor[(2400/	3500),(2660/	3500)])	*	((rpm/	3500) factor[(3050/	3500),(2800/	3500)]))";
			};
			class Engine6_ext
			{
				sound[]=
				{
					"A3\Sounds_F\vehicles\soft\Offroad_01\engine_ext_rpm7",
					0.56234133,
					1,
					300
				};
				frequency="0.95	+	((rpm/	3500) factor[(2700/	3500),(3500/	3500)])*0.2";
				volume="engineOn*camPos*((rpm/	3500) factor[(2700/	3500),(3200/	3500)])";
			};
			class IdleThrust
			{
				sound[]=
				{
					"A3\Sounds_F\vehicles\soft\Offroad_01\exhaust_ext_idle",
					0.50118721,
					1,
					200
				};
				frequency="0.95	+	((rpm/	3500) factor[(200/	3500),(580/	3500)])*0.15";
				volume="engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	3500) factor[(200/	3500),(350/	3500)])	*	((rpm/	3500) factor[(580/	3500),(400/	3500)]))";
			};
			class EngineThrust
			{
				sound[]=
				{
					"A3\Sounds_F\vehicles\soft\Offroad_01\exhaust_ext_rpm1",
					0.56234133,
					1,
					250
				};
				frequency="0.9	+	((rpm/	3500) factor[(380/	3500),(960/	3500)])*0.2";
				volume="engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	3500) factor[(380/	3500),(580/	3500)])	*	((rpm/	3500) factor[(960/	3500),(700/	3500)]))";
			};
			class Engine1_Thrust_ext
			{
				sound[]=
				{
					"A3\Sounds_F\vehicles\soft\Offroad_01\exhaust_ext_rpm2",
					0.63095737,
					1,
					275
				};
				frequency="0.9	+	((rpm/	3500) factor[(700/	3500),(1400/	3500)])*0.2";
				volume="engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	3500) factor[(700/	3500),(970/	3500)])	*	((rpm/	3500) factor[(1400/	3500),(1100/	3500)]))";
			};
			class Engine2_Thrust_ext
			{
				sound[]=
				{
					"A3\Sounds_F\vehicles\soft\Offroad_01\exhaust_ext_rpm3",
					0.70794576,
					1,
					300
				};
				frequency="0.9	+	((rpm/	3500) factor[(1100/	3500),(1860/	3500)])*0.2";
				volume="engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	3500) factor[(1100/	3500),(1430/	3500)])	*	((rpm/	3500) factor[(1860/	3500),(1570/	3500)]))";
			};
			class Engine3_Thrust_ext
			{
				sound[]=
				{
					"A3\Sounds_F\vehicles\soft\Offroad_01\exhaust_ext_rpm4",
					0.79432821,
					1,
					325
				};
				frequency="0.95	+	((rpm/	3500) factor[(1600/	3500),(2200/	3500)])*0.2";
				volume="engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	3500) factor[(1600/	3500),(1860/	3500)])	*	((rpm/	3500) factor[(2200/	3500),(2050/	3500)]))";
			};
			class Engine4_Thrust_ext
			{
				sound[]=
				{
					"A3\Sounds_F\vehicles\soft\Offroad_01\exhaust_ext_rpm5",
					0.89125091,
					1,
					350
				};
				frequency="0.95	+	((rpm/	3500) factor[(2040/	3500),(2670/	3500)]) *0.2";
				volume="engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	3500) factor[(2040/	3500),(2200/	3500)])	*	((rpm/	3500) factor[(2670/	3500),(2400/	3500)]))";
			};
			class Engine5_Thrust_ext
			{
				sound[]=
				{
					"A3\Sounds_F\vehicles\soft\Offroad_01\exhaust_ext_rpm6",
					1,
					1,
					375
				};
				frequency="0.95	+	((rpm/	3500) factor[(2400/	3500),(3050/	3500)])*0.2";
				volume="engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	3500) factor[(2400/	3500),(2660/	3500)])	*	((rpm/	3500) factor[(3050/	3500),(2800/	3500)]))";
			};
			class Engine6_Thrust_ext
			{
				sound[]=
				{
					"A3\Sounds_F\vehicles\soft\Offroad_01\exhaust_ext_rpm7",
					1.1220185,
					1,
					400
				};
				frequency="0.95	+	((rpm/	3500) factor[(2700/	3500),(3500/	3500)])*0.2";
				volume="engineOn*camPos*(0.4+(0.6*(thrust factor[0.1,1])))*((rpm/	3500) factor[(2700/	3500),(3200/	3500)])";
			};
			class Idle_int
			{
				sound[]=
				{
					"A3\Sounds_F\vehicles\soft\Offroad_01\engine_int_idle",
					0.2238721,
					1
				};
				frequency="0.95	+	((rpm/	3500) factor[(200/	3500),(580/	3500)])*0.15";
				volume="engineOn*(1-camPos)*(((rpm/	3500) factor[(200/	3500),(350/	3500)])	*	((rpm/	3500) factor[(580/	3500),(400/	3500)]))";
			};
			class Engine_int
			{
				sound[]=
				{
					"A3\Sounds_F\vehicles\soft\Offroad_01\engine_int_rpm1",
					0.25118864,
					1
				};
				frequency="0.9	+	((rpm/	3500) factor[(380/	3500),(960/	3500)])*0.2";
				volume="engineOn*(1-camPos)*(((rpm/	3500) factor[(380/	3500),(580/	3500)])	*	((rpm/	3500) factor[(960/	3500),(700/	3500)]))";
			};
			class Engine1_int
			{
				sound[]=
				{
					"A3\Sounds_F\vehicles\soft\Offroad_01\engine_int_rpm2",
					0.17782794,
					1
				};
				frequency="0.9	+	((rpm/	3500) factor[(700/	3500),(1400/	3500)])*0.2";
				volume="engineOn*(1-camPos)*(((rpm/	3500) factor[(700/	3500),(970/	3500)])	*	((rpm/	3500) factor[(1400/	3500),(1100/	3500)]))";
			};
			class Engine2_int
			{
				sound[]=
				{
					"A3\Sounds_F\vehicles\soft\Offroad_01\engine_int_rpm3",
					0.31622776,
					1
				};
				frequency="0.9	+	((rpm/	3500) factor[(1100/	3500),(1860/	3500)])*0.2";
				volume="engineOn*(1-camPos)*(((rpm/	3500) factor[(1100/	3500),(1430/	3500)])	*	((rpm/	3500) factor[(1860/	3500),(1570/	3500)]))";
			};
			class Engine3_int
			{
				sound[]=
				{
					"A3\Sounds_F\vehicles\soft\Offroad_01\engine_int_rpm4",
					0.35481337,
					1
				};
				frequency="0.95	+	((rpm/	3500) factor[(1600/	3500),(2200/	3500)])*0.2";
				volume="engineOn*(1-camPos)*(((rpm/	3500) factor[(1600/	3500),(1860/	3500)])	*	((rpm/	3500) factor[(2200/	3500),(2050/	3500)]))";
			};
			class Engine4_int
			{
				sound[]=
				{
					"A3\Sounds_F\vehicles\soft\Offroad_01\engine_int_rpm5",
					0.39810717,
					1
				};
				frequency="0.95	+	((rpm/	3500) factor[(2040/	3500),(2670/	3500)]) *0.2";
				volume="engineOn*(1-camPos)*(((rpm/	3500) factor[(2040/	3500),(2200/	3500)])	*	((rpm/	3500) factor[(2670/	3500),(2400/	3500)]))";
			};
			class Engine5_int
			{
				sound[]=
				{
					"A3\Sounds_F\vehicles\soft\Offroad_01\engine_int_rpm6",
					0.39810717,
					1
				};
				frequency="0.95	+	((rpm/	3500) factor[(2400/	3500),(3050/	3500)])*0.2";
				volume="engineOn*(1-camPos)*(((rpm/	3500) factor[(2400/	3500),(2660/	3500)])	*	((rpm/	3500) factor[(3050/	3500),(2800/	3500)]))";
			};
			class Engine6_int
			{
				sound[]=
				{
					"A3\Sounds_F\vehicles\soft\Offroad_01\engine_int_rpm7",
					0.44668359,
					1
				};
				frequency="0.95	+	((rpm/	3500) factor[(2700/	3500),(3500/	3500)])*0.2";
				volume="engineOn*(1-camPos)*((rpm/	3500) factor[(2700/	3500),(3200/	3500)])";
			};
			class IdleThrust_int
			{
				sound[]=
				{
					"A3\Sounds_F\vehicles\soft\Offroad_01\exhaust_int_idle",
					0.31622776,
					1
				};
				frequency="0.95	+	((rpm/	3500) factor[(200/	3500),(580/	3500)])*0.15";
				volume="engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	3500) factor[(200/	3500),(350/	3500)])	*	((rpm/	3500) factor[(580/	3500),(400/	3500)]))";
			};
			class EngineThrust_int
			{
				sound[]=
				{
					"A3\Sounds_F\vehicles\soft\Offroad_01\exhaust_int_rpm1",
					0.35481337,
					1
				};
				frequency="0.9	+	((rpm/	3500) factor[(380/	3500),(960/	3500)])*0.2";
				volume="engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	3500) factor[(380/	3500),(580/	3500)])	*	((rpm/	3500) factor[(960/	3500),(700/	3500)]))";
			};
			class Engine1_Thrust_int
			{
				sound[]=
				{
					"A3\Sounds_F\vehicles\soft\Offroad_01\exhaust_int_rpm2",
					0.39810717,
					1
				};
				frequency="0.9	+	((rpm/	3500) factor[(700/	3500),(1400/	3500)])*0.2";
				volume="engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	3500) factor[(700/	3500),(970/	3500)])	*	((rpm/	3500) factor[(1400/	3500),(1100/	3500)]))";
			};
			class Engine2_Thrust_int
			{
				sound[]=
				{
					"A3\Sounds_F\vehicles\soft\Offroad_01\exhaust_int_rpm3",
					0.44668359,
					1
				};
				frequency="0.9	+	((rpm/	3500) factor[(1100/	3500),(1860/	3500)])*0.2";
				volume="engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	3500) factor[(1100/	3500),(1430/	3500)])	*	((rpm/	3500) factor[(1860/	3500),(1570/	3500)]))";
			};
			class Engine3_Thrust_int
			{
				sound[]=
				{
					"A3\Sounds_F\vehicles\soft\Offroad_01\exhaust_int_rpm4",
					0.50118721,
					1
				};
				frequency="0.95	+	((rpm/	3500) factor[(1600/	3500),(2200/	3500)])*0.2";
				volume="engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	3500) factor[(1600/	3500),(1860/	3500)])	*	((rpm/	3500) factor[(2200/	3500),(2050/	3500)]))";
			};
			class Engine4_Thrust_int
			{
				sound[]=
				{
					"A3\Sounds_F\vehicles\soft\Offroad_01\exhaust_int_rpm5",
					0.56234133,
					1
				};
				frequency="0.95	+	((rpm/	3500) factor[(2040/	3500),(2670/	3500)]) *0.2";
				volume="engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	3500) factor[(2040/	3500),(2200/	3500)])	*	((rpm/	3500) factor[(2670/	3500),(2400/	3500)]))";
			};
			class Engine5_Thrust_int
			{
				sound[]=
				{
					"A3\Sounds_F\vehicles\soft\Offroad_01\exhaust_int_rpm6",
					0.63095737,
					1
				};
				frequency="0.95	+	((rpm/	3500) factor[(2400/	3500),(3050/	3500)])*0.2";
				volume="engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*(((rpm/	3500) factor[(2400/	3500),(2660/	3500)])	*	((rpm/	3500) factor[(3050/	3500),(2800/	3500)]))";
			};
			class Engine6_Thrust_int
			{
				sound[]=
				{
					"A3\Sounds_F\vehicles\soft\Offroad_01\exhaust_int_rpm7",
					0.70794576,
					1
				};
				frequency="0.95	+	((rpm/	3500) factor[(2700/	3500),(3500/	3500)])*0.2";
				volume="engineOn*(1-camPos)*(0.4+(0.6*(thrust factor[0.1,1])))*((rpm/	3500) factor[(2700/	3500),(3200/	3500)])";
			};
			class TiresRockOut
			{
				sound[]=
				{
					"A3\Sounds_F\vehicles\soft\tires\ext_tires_dirt_soft_1",
					0.70794576,
					1,
					60
				};
				frequency="1";
				volume="camPos*rock*(speed factor[2, 20])";
			};
			class TiresSandOut
			{
				sound[]=
				{
					"A3\Sounds_F\vehicles\soft\tires\ext-tires-sand1",
					0.70794576,
					1,
					60
				};
				frequency="1";
				volume="camPos*sand*(speed factor[2, 20])";
			};
			class TiresGrassOut
			{
				sound[]=
				{
					"A3\Sounds_F\vehicles\soft\tires\ext_tires_dirt_soft_2",
					0.70794576,
					1,
					60
				};
				frequency="1";
				volume="camPos*grass*(speed factor[2, 20])";
			};
			class TiresMudOut
			{
				sound[]=
				{
					"A3\Sounds_F\vehicles\soft\tires\ext-tires-mud2",
					0.70794576,
					1,
					60
				};
				frequency="1";
				volume="camPos*mud*(speed factor[2, 20])";
			};
			class TiresGravelOut
			{
				sound[]=
				{
					"A3\Sounds_F\vehicles\soft\tires\ext_tires_gravel_1",
					0.70794576,
					1,
					60
				};
				frequency="1";
				volume="camPos*gravel*(speed factor[2, 20])";
			};
			class TiresAsphaltOut
			{
				sound[]=
				{
					"A3\Sounds_F\vehicles\soft\tires\ext_tires_asfalt_2",
					0.70794576,
					1,
					60
				};
				frequency="1";
				volume="camPos*asphalt*(speed factor[2, 20])";
			};
			class NoiseOut
			{
				sound[]=
				{
					"A3\Sounds_F\vehicles\soft\noises\noise_ext_car_3",
					0.56234133,
					1,
					90
				};
				frequency="1";
				volume="camPos*(damper0 max 0.02)*(speed factor[0, 8])";
			};
			class TiresRockIn
			{
				sound[]=
				{
					"A3\Sounds_F\vehicles\soft\tires\int_tires_dirt_soft_1",
					0.70794576,
					1
				};
				frequency="1";
				volume="(1-camPos)*rock*(speed factor[2, 20])";
			};
			class TiresSandIn
			{
				sound[]=
				{
					"A3\Sounds_F\vehicles\soft\tires\int-tires-sand2",
					0.70794576,
					1
				};
				frequency="1";
				volume="(1-camPos)*sand*(speed factor[2, 20])";
			};
			class TiresGrassIn
			{
				sound[]=
				{
					"A3\Sounds_F\vehicles\soft\tires\int_tires_dirt_soft_2",
					0.70794576,
					1
				};
				frequency="1";
				volume="(1-camPos)*grass*(speed factor[2, 20])";
			};
			class TiresMudIn
			{
				sound[]=
				{
					"A3\Sounds_F\vehicles\soft\tires\int-tires-mud2",
					0.70794576,
					1
				};
				frequency="1";
				volume="(1-camPos)*mud*(speed factor[2, 20])";
			};
			class TiresGravelIn
			{
				sound[]=
				{
					"A3\Sounds_F\vehicles\soft\tires\int_tires_gravel_1",
					0.70794576,
					1
				};
				frequency="1";
				volume="(1-camPos)*gravel*(speed factor[2, 20])";
			};
			class TiresAsphaltIn
			{
				sound[]=
				{
					"A3\Sounds_F\vehicles\soft\tires\int_tires_asfalt_2",
					0.70794576,
					1
				};
				frequency="1";
				volume="(1-camPos)*asphalt*(speed factor[2, 20])";
			};
			class NoiseIn
			{
				sound[]=
				{
					"A3\Sounds_F\vehicles\soft\noises\noise_int_car_3",
					0.15848932,
					1
				};
				frequency="1";
				volume="(damper0 max 0.1)*(speed factor[0, 8])*(1-camPos)";
			};
			class breaking_ext_road
			{
				sound[]=
				{
					"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_04",
					0.70794576,
					1,
					80
				};
				frequency=1;
				volume="engineOn*camPos*asphalt*(LongSlipDrive Factor[-0.1, -0.4])*(Speed Factor[2, 15])";
			};
			class acceleration_ext_road
			{
				sound[]=
				{
					"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02",
					0.70794576,
					1,
					80
				};
				frequency=1;
				volume="engineOn*camPos*asphalt*(LongSlipDrive Factor[0.1, 0.4])*(Speed Factor[15, 2])";
			};
			class turn_left_ext_road
			{
				sound[]=
				{
					"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02",
					0.70794576,
					1,
					80
				};
				frequency=1;
				volume="engineOn*camPos*asphalt*(latSlipDrive Factor[0.1, 0.4])*(Speed Factor[2, 15])";
			};
			class turn_right_ext_road
			{
				sound[]=
				{
					"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02",
					0.70794576,
					1,
					80
				};
				frequency=1;
				volume="engineOn*camPos*asphalt*(latSlipDrive Factor[-0.1, -0.4])*(Speed Factor[2, 15])";
			};
			class breaking_ext_dirt
			{
				sound[]=
				{
					"A3\Sounds_F\vehicles\soft\noises\slipping_tires_14_dirt_breaking",
					0.70794576,
					1,
					60
				};
				frequency=1;
				volume="engineOn*camPos*(1-asphalt)*(LongSlipDrive Factor[-0.1, -0.4])*(Speed Factor[1, 15])";
			};
			class acceleration_ext_dirt
			{
				sound[]=
				{
					"A3\Sounds_F\vehicles\soft\noises\slipping_tires_16_dirt_acceleration",
					0.70794576,
					1,
					60
				};
				frequency=1;
				volume="engineOn*camPos*(1-asphalt)*(LongSlipDrive Factor[0.1, 0.4])*(Speed Factor[15, 1])";
			};
			class turn_left_ext_dirt
			{
				sound[]=
				{
					"A3\Sounds_F\vehicles\soft\noises\slipping_tires_18_dirt",
					0.70794576,
					1,
					60
				};
				frequency=1;
				volume="engineOn*camPos*(1-asphalt)*(latSlipDrive Factor[0.1, 0.4])*(Speed Factor[1, 15])";
			};
			class turn_right_ext_dirt
			{
				sound[]=
				{
					"A3\Sounds_F\vehicles\soft\noises\slipping_tires_18_dirt",
					0.70794576,
					1,
					60
				};
				frequency=1;
				volume="engineOn*camPos*(1-asphalt)*(latSlipDrive Factor[-0.1, -0.4])*(Speed Factor[1, 15])";
			};
			class breaking_int_road
			{
				sound[]=
				{
					"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_04_int",
					0.31622776,
					1
				};
				frequency=1;
				volume="engineOn*asphalt*(1-camPos)*(LongSlipDrive Factor[-0.1, -0.4])*(Speed Factor[1, 15])";
			};
			class acceleration_int_road
			{
				sound[]=
				{
					"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02_int",
					0.31622776,
					1
				};
				frequency=1;
				volume="engineOn*asphalt*(1-camPos)*(LongSlipDrive Factor[0.1, 0.4])*(Speed Factor[15, 1])";
			};
			class turn_left_int_road
			{
				sound[]=
				{
					"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02_int",
					0.31622776,
					1
				};
				frequency=1;
				volume="engineOn*asphalt*(1-camPos)*(latSlipDrive Factor[0.1, 0.4])*(Speed Factor[1, 15])";
			};
			class turn_right_int_road
			{
				sound[]=
				{
					"A3\Sounds_F\vehicles\soft\noises\slipping_tires_loop_02_int",
					0.31622776,
					1
				};
				frequency=1;
				volume="engineOn*asphalt*(1-camPos)*(latSlipDrive Factor[-0.1, -0.4])*(Speed Factor[1, 15])";
			};
			class breaking_int_dirt
			{
				sound[]=
				{
					"A3\Sounds_F\vehicles\soft\noises\slipping_tires_14_dirt_breaking_int",
					0.31622776,
					1
				};
				frequency=1;
				volume="engineOn*(1-asphalt)*(1-camPos)*(LongSlipDrive Factor[-0.1, -0.4])*(Speed Factor[1, 15])";
			};
			class acceleration_int_dirt
			{
				sound[]=
				{
					"A3\Sounds_F\vehicles\soft\noises\slipping_tires_16_dirt_acceleration_int",
					0.31622776,
					1
				};
				frequency=1;
				volume="engineOn*(1-asphalt)*(1-camPos)*(LongSlipDrive Factor[0.1, 0.4])*(Speed Factor[15, 1])";
			};
			class turn_left_int_dirt
			{
				sound[]=
				{
					"A3\Sounds_F\vehicles\soft\noises\slipping_tires_18_dirt_int",
					0.31622776,
					1
				};
				frequency=1;
				volume="engineOn*(1-asphalt)*(1-camPos)*(latSlipDrive Factor[0.1, 0.4])*(Speed Factor[1, 15])";
			};
			class turn_right_int_dirt
			{
				sound[]=
				{
					"A3\Sounds_F\vehicles\soft\noises\slipping_tires_18_dirt_int",
					0.31622776,
					1
				};
				frequency=1;
				volume="engineOn*(1-asphalt)*(1-camPos)*(latSlipDrive Factor[-0.1, -0.4])*(Speed Factor[1, 15])";
			};
		};
		class Exhausts
		{
			class Exhaust
			{
				effect="ExhaustEffectOffroad";
				position="exhaust_pos";
				direction="exhaust_dir";
			};
		};		
		
		class AnimationSources;

		class HitPoints: HitPoints
		{
			class HitLFWheel: HitLFWheel {armor=0.4;};
			class HitLBWheel: HitLBWheel {armor=0.4;};
			class HitRFWheel: HitRFWheel {armor=0.4;};
			class HitRBWheel: HitRBWheel {armor=0.4;};

			class HitEngine
			{
				armor=2;
				material=-1;
				name="motor";
				passThrough=0;
			};
			class HitFuel
			{
				armor=1;
				material=-1;
				name="palivo";
				passThrough=0;
			};

			class HitGlass1: HitGlass1 {armor=1;};
			class HitGlass2: HitGlass2 {armor=1;};
			class HitGlass3: HitGlass3 {armor=1;};
			class HitGlass4: HitGlass4 {armor=1;};

		};
		class Damage
		{
			tex[] = {};
			mat[] =
			{
				"DG_UKBAF\Vehicles\ArmoredSUV\data\SUV_body.rvmat",
				"DG_UKBAF\Vehicles\ArmoredSUV\data\SUV_body_damage.rvmat",
				"DG_UKBAF\Vehicles\ArmoredSUV\data\SUV_body_destruct.rvmat",
				
				"DG_UKBAF\Vehicles\ArmoredSUV\data\SUV_chrom.rvmat",
				"DG_UKBAF\Vehicles\ArmoredSUV\data\SUV_chrom_damage.rvmat",
				"DG_UKBAF\Vehicles\ArmoredSUV\data\SUV_chrom_destruct.rvmat",
				
				"DG_UKBAF\Vehicles\ArmoredSUV\data\SUV_glass.rvmat",
				"DG_UKBAF\Vehicles\ArmoredSUV\data\SUV_glass_damage.rvmat",
				"DG_UKBAF\Vehicles\ArmoredSUV\data\SUV_glass_destruct.rvmat",
				
				"a3\data_f\default.rvmat",
				"a3\data_f\default.rvmat",
				"DG_UKBAF\Aircraft\Data\default_destruct.rvmat"
			};
		};
		
		class Library {libTextDesc = $STR_PMC_LIB_ARMOREDSUV;};
	};

	class BAF_ArmoredSUV_DG1: BAF_ArmoredSUV_Base_DG1
	{
		scope = 2;
		
		side = 1;
		vehicleClass = "car";
		faction = "DG_UKBAF_Faction";
		
		author = "Deltagamer";
		
		displayName = "RMP Undercover SUV (M134)";
		
		crew = BAF_Soldier_Light_Infantry_L_M_DG1;
		typicalCargo[] = {BAF_Soldier_Light_Infantry_L_M_DG1, BAF_Soldier_Light_Infantry_L_M_DG1, BAF_Soldier_Light_Infantry_L_M_DG1, BAF_Soldier_Light_Infantry_L_M_DG1, BAF_Soldier_Light_Infantry_L_M_DG1};
		
		transportMaxWeapons = 5000;
		transportMaxMagazines = 20000;	

		class EventHandlers: DefaultEventhandlers
		{
		init = "_this execVM ""\DG_UKBAF\Vehicles\ArmoredSUV\script\init.sqf"";";
		};		
		
		class Turrets: Turrets
		{
			class MainTurret: MainTurret
			{
				body = "mainTurret";
				gun = "mainGun";
				viewGunnerInExternal = 1;
				minElev=-30; maxElev=45; initElev=0;
				soundServo[] = {, db-40, 1.0};
				stabilizedInAxes = StabilizedInAxesNone;
				gunBeg = "muzzle_1";
				gunEnd = "chamber_1";
				weapons[] = {LMG_Minigun};
				maxHorizontalRotSpeed = 1.8;
				maxVerticalRotSpeed = 1.8;
				magazines[] = {2000Rnd_65x39_Belt, 2000Rnd_65x39_Belt, 2000Rnd_65x39_Belt};
				
				gunnerAction = "ArmoredSUV_Gunner_PMC";		

                LODTurnedIn = VIEW_CARGO;					
                LODTurnedOut = VIEW_GUNNER;			

				outGunnerMayFire = true;
				inGunnerMayFire = false;	

                gunnerCompartments="Compartment3";				
			};			
		};
		class AnimationSources: AnimationSources
		{	
		
			class HideGun_01 {source="user"; initPhase=0; animPeriod=1.2;};
			class HideGun_02: HideGun_01{};
			class HideGun_03: HideGun_01{};
			class HideGun_04: HideGun_01{};
			class CloseCover1 {source="user"; initPhase=0; animPeriod=0.7;};
			class CloseCover2: CloseCover1 {};		
		
			class Revolving {source="revolving"; weapon=LMG_Minigun;};

		};
	};
	
	class BAF_ArmoredSUV_GunNotCommanding_DG1: BAF_ArmoredSUV_DG1
	{
		scope = 0;
		
		class Turrets: Turrets
		{
			class MainTurret: MainTurret
			{
				commanding = -2;				
			};
		};
	};

	class BAF_ArmoredSUV_Unarmed_DG1: BAF_ArmoredSUV_Base_DG1
	{
		scope = 2;
		
		side = 1;
		vehicleClass = "car";
		faction = "DG_UKBAF_Faction";
		
		author = "Deltagamer";
		
		icon = "\DG_UKBAF\Vehicles\ArmoredSUV\data\ui\icon_suv_ca.paa";
		picture = "\DG_UKBAF\Vehicles\ArmoredSUV\data\ui\picture_suv_ca.paa";
		model = "\DG_UKBAF\Vehicles\ArmoredSUV\suv.p3d";
		
		displayName = "RMP Undercover SUV";
		
		transportSoldier = 5;
		
		crew = BAF_Soldier_Light_Infantry_L_M_DG1;
		typicalCargo[] = {BAF_Soldier_Light_Infantry_L_M_DG1, BAF_Soldier_Light_Infantry_L_M_DG1, BAF_Soldier_Light_Infantry_L_M_DG1, BAF_Soldier_Light_Infantry_L_M_DG1, BAF_Soldier_Light_Infantry_L_M_DG1};
		
		cargoAction[] = {SUV_Cargo_EP1, SUV_Cargo02_EP1, SUV_Cargo01_EP1, SUV_Cargo01_EP1, SUV_Cargo01_EP1};
		
		transportMaxWeapons = 5000;
		transportMaxMagazines = 20000;	
		
		class Turrets : Turrets
		{
	
        };
		
	};	
	
	class BAF_ArmoredSUV_FFV_DG1: BAF_ArmoredSUV_Base_DG1
	{
		scope = 2;
		
		side = 1;
		vehicleClass = "car";
		faction = "DG_UKBAF_Faction";
		
		model = "\DG_UKBAF\Vehicles\ArmoredSUV\CargoTurret\suv.p3d";
		
		author = "Deltagamer";
		
		displayName = "RMP Undercover SUV (FFV)";
		
		icon = "\DG_UKBAF\Vehicles\ArmoredSUV\data\ui\icon_suv_ca.paa";
		picture = "\DG_UKBAF\Vehicles\ArmoredSUV\data\ui\picture_suv_ca.paa";		
		
		transportSoldier = 5;
		
		crew = BAF_Soldier_Light_Infantry_L_M_DG1;
		typicalCargo[] = {BAF_Soldier_Light_Infantry_L_M_DG1, BAF_Soldier_Light_Infantry_L_M_DG1, BAF_Soldier_Light_Infantry_L_M_DG1, BAF_Soldier_Light_Infantry_L_M_DG1, BAF_Soldier_Light_Infantry_L_M_DG1};
		
		cargoAction[] = {SUV_Cargo_EP1, SUV_Cargo02_EP1, SUV_Cargo01_EP1, SUV_Cargo01_EP1, SUV_Cargo01_EP1};
		
		transportMaxWeapons = 5000;
		transportMaxMagazines = 20000;			
		
		class CargoTurret;
		class Turrets : Turrets
		{
			class CargoTurret_01: CargoTurret
			{
				minElev = -10;		
				maxElev = 18;				
				maxTurn=70;
				minTurn=-60;

				gunnerAction="passenger_boat_3";
				gunnerName="Passenger (Rear Seat)";
				gunnerCompartments="Compartment2";
				proxyIndex=6;

				isPersonTurret=1;
				memoryPointsGetInGunner 	= "pos cargo rear";		/// specific memory points to allow choice of position
				memoryPointsGetInGunnerDir 	= "pos cargo dir rear";	/// direction of get in action	
				memoryPointGunnerOptics="";
				gunnerOutOpticsModel = "";
				gunnerOpticsModel = "";	
				enabledByAnimationSource 	= "";				/// doesn't work unless the said animation source is 1
				usepip = 0;
				startEngine = 0;
	            outGunnerMayFire = 1;
                inGunnerMayFire = 0;
				commanding=-2;			
			};		
        };		
	};		