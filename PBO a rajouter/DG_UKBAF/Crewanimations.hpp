#define ANIM_VERSION(cargo, version, varSpeed, varAfter1, varAfter2, varAfter3) \
	class cargo##_V##version##_EP1: cargo##_EP1 \
	{ \
		file = 	\ca\Air_E\Data\Anim\##cargo##_V##version##.rtm; \
		connectTo[] = {cargo##_EP1, 0.1}; \
		speed = varSpeed; \
		variantAfter[] = {varAfter1, varAfter2, varAfter3}; \
	};

class CfgMovesBasic
{
	class DefaultDie;
	class ManActions
	{
		AW159_Cargo_BAF="AW159_Cargo_BAF";
		AW159_Cargo01_BAF="AW159_Cargo01_BAF";
		AW159_Pilot_BAF="AW159_Pilot_BAF";
		Merlin_Cargo_BAF="Merlin_Cargo_BAF";
		Merlin_Cargo01_BAF="Merlin_Cargo01_BAF";
		Merlin_Pilot_BAF="Merlin_Pilot_BAF";
		AH64_gunner_EP1="AH64_gunner_EP1";
		AH64_pilot_EP1="AH64_pilot_EP1";		
		CH47_Cargo_EP1 = "CH47_Cargo_EP1";
		CH47_Cargo01_EP1 = "CH47_Cargo01_EP1";
		CH47_Cargo02_EP1 = "CH47_Cargo02_EP1";
		CH47_Cargo03_EP1 = "CH47_Cargo03_EP1";
		CH47_Gunner_EP1 = "CH47_Gunner_EP1";
		CH47_Gunner01_EP1 = "CH47_Gunner01_EP1";
		CH47_Pilot_EP1 = "CH47_Pilot_EP1";

		M113_Cargo01_EP1="M113_Cargo01_EP1";
		M113_Cargo02_EP1="M113_Cargo02_EP1";
		M113_Cargo03_EP1="M113_Cargo03_EP1";
		M113_Cargo04_EP1="M113_Cargo04_EP1";
		Abrams_Commander = "Abrams_Commander";
		Abrams_CommanderOUT = "Abrams_CommanderOUT";		
		Abrams_Driver = "Abrams_Driver";
		Abrams_DriverOUT = "Abrams_DriverOUT";	
		Abrams_Gunner = "Abrams_Gunner";

		Jackal_gunner_L2A1_BAF = "Jackal_gunner_L2A1_BAF";
		Jackal_gunner_GMG_BAF = "Jackal_gunner_GMG_BAF";
		Jackal_Cargo_BAF = "Jackal_Cargo_BAF";
		Jackal_driver_BAF = "Jackal_driver_BAF";
		Jackal_commander_BAF = "Jackal_commander_BAF";	

		LR_driver_EP1="LR_driver_EP1";
		LR_gunner_EP1="LR_gunner_EP1";
		LR_gunner01_EP1="LR_gunner01_EP1";
		LR_gunner02_EP1="LR_gunner02_EP1";
		LR_gunner03_EP1="LR_gunner03_EP1";
		LR_Cargo01_EP1="LR_Cargo01_EP1";
		LR_Cargo02_EP1="LR_Cargo02_EP1";
		LR_Cargo03_EP1="LR_Cargo03_EP1";
		LR_Cargo04_EP1="LR_Cargo04_EP1";
		LR_Cargo05_EP1="LR_Cargo05_EP1";	

		C17_Pilot = "C17_Pilot";	

		UH60_Pilot = "UH60_Pilot";
		UH60_Gunner = "UH60_Gunner";
		MH60_Gunner = "MH60_Gunner";
		UH60_Cargo01 = "UH60_Cargo01";
		UH60_Cargo02 = "UH60_Cargo02";	

		C130_Pilot = "C130_Pilot";
		C130_Cargo = "C130_Cargo";
		C130_Load = "C130_Load";

		blx_ridgback_gunner = "blx_ridgback_gunner";

		F35B_Pilot = "F35B_Pilot";	

		Cha_AV8B_Pilot = "Cha_AV8B_Pilot";	

		ArmoredSUV_Gunner_PMC = "ArmoredSUV_Gunner_PMC";
		ArmoredSUV_GunnerIn_PMC = "ArmoredSUV_GunnerIn_PMC";
		SUV_Cargo_EP1="SUV_Cargo_EP1";
		SUV_Cargo01_EP1="SUV_Cargo01_EP1";
		SUV_Cargo02_EP1="SUV_Cargo02_EP1";
		SUV_Driver_EP1="SUV_Driver_EP1";		
	};
};
class CfgMovesMaleSdr: CfgMovesBasic
{
	class States
	{
		class Crew;
		
		class SUV_Cargo_EP1: Crew
		{
			file="\DG_UKBAF\Vehicles\ArmoredSUV\data\Anim\SUV_Cargo";
			interpolateTo[]=
			{
				"SUV_KIA_Cargo_EP1",
				1
			};
			speed=1e+010;
		};
		class SUV_KIA_Cargo_EP1: DefaultDie
		{
			actions="DeadActions";
			file="\DG_UKBAF\Vehicles\ArmoredSUV\data\Anim\SUV_KIA_Cargo";
			speed=1e+010;
			terminal=1;
			soundEnabled=0;
			looped=0;
			connectTo[]=
			{
				"DeadState",
				0.1
			};
		};
		class SUV_Cargo01_EP1: Crew
		{
			file="\DG_UKBAF\Vehicles\ArmoredSUV\data\Anim\SUV_Cargo01";
			interpolateTo[]=
			{
				"SUV_KIA_Cargo01_EP1",
				1
			};
			speed=1e+010;
		};
		class SUV_KIA_Cargo01_EP1: DefaultDie
		{
			actions="DeadActions";
			file="\DG_UKBAF\Vehicles\ArmoredSUV\data\Anim\SUV_KIA_Cargo01";
			speed=1e+010;
			terminal=1;
			soundEnabled=0;
			looped=0;
			connectTo[]=
			{
				"DeadState",
				0.1
			};
		};
		class SUV_Cargo02_EP1: Crew
		{
			file="\DG_UKBAF\Vehicles\ArmoredSUV\data\Anim\SUV_Cargo02";
			interpolateTo[]=
			{
				"SUV_KIA_Cargo02_EP1",
				1
			};
			speed=1e+010;
		};
		class SUV_KIA_Cargo02_EP1: DefaultDie
		{
			actions="DeadActions";
			file="\DG_UKBAF\Vehicles\ArmoredSUV\data\Anim\SUV_KIA_Cargo02";
			speed=1e+010;
			terminal=1;
			soundEnabled=0;
			looped=0;
			connectTo[]=
			{
				"DeadState",
				0.1
			};
		};
		class SUV_Driver_EP1: Crew
		{
			file="\DG_UKBAF\Vehicles\ArmoredSUV\data\Anim\SUV_Driver";
			interpolateTo[]=
			{
				"SUV_KIA_Driver_EP1",
				1
			};
			speed=1e+010;
		};
		class SUV_KIA_Driver_EP1: DefaultDie
		{
			actions="DeadActions";
			file="\DG_UKBAF\Vehicles\ArmoredSUV\data\Anim\SUV_KIA_Driver";
			speed=1e+010;
			terminal=1;
			soundEnabled=0;
			looped=0;
			connectTo[]=
			{
				"DeadState",
				0.1
			};
		};		
		
		class ArmoredSUV_Gunner_PMC: Crew
		{
			file = "\DG_UKBAF\Vehicles\ArmoredSUV\data\Anim\SUVmatildaTurnOutPose.rtm";
			interpolateTo[] =
			{
				ArmoredSUV_KIA_Gunner_PMC, 1
			};
			speed = 1e+010;
		};
		class ArmoredSUV_GunnerIn_PMC: ArmoredSUV_Gunner_PMC
		{
			file = "\DG_UKBAF\Vehicles\ArmoredSUV\data\Anim\SUVmatildaTurnInPose.rtm";
		};		
		class ArmoredSUV_KIA_Gunner_PMC: DefaultDie
		{
			actions = DeadActions;
			file = "\DG_UKBAF\Vehicles\ArmoredSUV\data\Anim\SUVmatildaDeath.rtm";
			speed = 1e+010;
			terminal = 1;
			soundEnabled = 0;
			looped = 0;
			connectTo[] =
			{
				DeadState, 0.1
			};
		};
		class ArmoredSUV_GunnerTurnIn_PMC: Crew
		{
			file = "\DG_UKBAF\Vehicles\ArmoredSUV\data\Anim\SUVmatildaTurnIn.rtm";
			interpolateTo[] =
			{
				ArmoredSUV_KIA_Gunner_PMC, 1
			};			
			connectTo[] =
			{
				ArmoredSUV_GunnerIn_PMC, 0.1
			};
			speed = 0.5;
			looped = 0;
		};
		class ArmoredSUV_GunnerTurnOut_PMC: Crew
		{
			file = "\DG_UKBAF\Vehicles\ArmoredSUV\data\Anim\SUVmatildaTurnOut.rtm";
			interpolateTo[] =
			{
				ArmoredSUV_KIA_Gunner_PMC, 1
			};			
			connectTo[] =
			{
				ArmoredSUV_Gunner_PMC, 0.1
			};
			speed = 0.5;
			looped = 0;
		};		
		
		class KIA_Cha_AV8B_Pilot: DefaultDie
		{
			actions = DeadActions;
			file = "\DG_UKBAF\Aircraft\AV8B\data\Anim\KIA_AV8B_Pilot.rtm";
			speed = 0.5;
			looped=false;
			terminal = 1;
			soundEnabled=0;
			connectTo[] = {"Unconscious",0.1};
		};

		class Cha_AV8B_Pilot: Crew
		{
			file = "\DG_UKBAF\Aircraft\AV8B\data\Anim\AV8B_Pilot.rtm";
			interpolateTo[] = {KIA_Cha_AV8B_Pilot,1};
		};		

		class KIA_F35B_Pilot: DefaultDie
		{
			actions = DeadActions;
			file="\DG_UKBAF\Aircraft\F35B\data\Anim\KIA_F35B_Pilot.rtm";
			speed = 0.5;
			looped=false;
			terminal = 1;
			soundEnabled=0;
			connectTo[] = {DeadState,0.1};
		};
		class F35B_Pilot: Crew
		{
			file="\DG_UKBAF\Aircraft\F35B\data\Anim\F35B_Pilot.rtm";
			interpolateTo[]={KIA_F35B_Pilot,1};
		};		
		
		class blx_ridgback_gunner: Crew
			{
			file = "\DG_UKBAF\Vehicles\blx_ridgback\data\Anim\blx_ridgback_gunner";
			interpolateTo[] = {"blx_ridgback_KIA_Gunner",1};
			leftHandIKCurve[] = {1};
			rightHandIKCurve[] = {1};
			speed = 1e+010;
			};
		
			class blx_ridgback_KIA_gunner: DefaultDie
			{
			actions = "DeadActions";
			file = "\DG_UKBAF\Vehicles\blx_ridgback\Data\Anim\blx_ridgback_KIA_gunner";
			speed = 0.5; // 1e+010
			terminal = 1;
			soundEnabled = 0;
			looped = 0;
			connectTo[] = {"Unconscious",0.1};
			};
		
		class KIA_C130_Pilot: DefaultDie
		{
			actions = DeadActions;
			file="\DG_UKBAF\Aircraft\C130J\DATA\Anim\C130pilotKIA.rtm";
			speed = 0.5;
			looped=false;
			terminal = 1;
			soundEnabled=0;
			connectTo[] = {DeadState,0.1};
		};
		class C130_Pilot: Crew
		{
			file="\DG_UKBAF\Aircraft\C130J\DATA\Anim\C130Pilot.rtm";
			interpolateTo[]={KIA_C130_Pilot,1};
		};
		class KIA_C130_Cargo: KIA_C130_Pilot {};
		class C130_Cargo: Crew
		{
			file="\DG_UKBAF\Aircraft\C130J\DATA\Anim\C130Pilot.rtm";
			interpolateTo[]={KIA_C130_Cargo,1};
		};
		class C130_Load: Crew
		{
			file="\DG_UKBAF\Aircraft\C130J\DATA\Anim\C130load.rtm";
			interpolateTo[]={KIA_C130_Cargo,1};
		};		
		
		class KIA_UH60_Pilot: DefaultDie
		{
			actions = DeadActions;
			file="\DG_UKBAF\Aircraft\Puma\data\Anim\KIA_UH60_Pilot.rtm";
			speed = 0.5;
			looped=false;
			terminal = 1;
			soundEnabled=0;
			connectTo[] = {DeadState,0.1};
		};
		class UH60_Pilot: Crew
		{
			file="\DG_UKBAF\Aircraft\Puma\data\Anim\UH60_Pilot.rtm";
			interpolateTo[]={KIA_UH60_Pilot,1};
		};
		class KIA_UH60_Gunner: DefaultDie
		{
			actions = DeadActions;
			file="\DG_UKBAF\Aircraft\Puma\data\Anim\KIA_UH60_Gunner.rtm";
			speed = 0.5;
			looped=false;
			terminal = 1;
			soundEnabled=0;
			connectTo[] = {DeadState,0.1};
		};
		class UH60_Gunner: Crew
		{
			file="\DG_UKBAF\Aircraft\Puma\data\Anim\UH60_Gunner.rtm";
			interpolateTo[]={KIA_UH60_Gunner,1};
		};
		class KIA_MH60_Gunner: DefaultDie
		{
			actions = DeadActions;
			file="\DG_UKBAF\Aircraft\Puma\data\Anim\KIA_MH60_Gunner.rtm";
			speed = 0.5;
			looped=false;
			terminal = 1;
			soundEnabled=0;
			connectTo[] = {DeadState,0.1};
		};
		class MH60_Gunner: Crew
		{
			file="\DG_UKBAF\Aircraft\Puma\data\Anim\MH60_Gunner.rtm";
			interpolateTo[]={KIA_MH60_Gunner,1};
		};
		class KIA_UH60_Cargo01: DefaultDie
		{
			actions = DeadActions;
			file="\DG_UKBAF\Aircraft\Puma\data\Anim\KIA_UH60_Cargo01.rtm";
			speed = 0.5;
			looped=false;
			terminal = 1;
			soundEnabled=0;
			connectTo[] = {DeadState,0.1};
		};
		class UH60_Cargo01: Crew
		{
			file="\DG_UKBAF\Aircraft\Puma\data\Anim\UH60_Cargo01.rtm";
			interpolateTo[]={KIA_UH60_Cargo01,1};
		};
		class KIA_UH60_Cargo02: DefaultDie
		{
			actions = DeadActions;
			file="\DG_UKBAF\Aircraft\Puma\data\Anim\KIA_UH60_Cargo02.rtm";
			speed = 0.5;
			looped=false;
			terminal = 1;
			soundEnabled=0;
			connectTo[] = {DeadState,0.1};
		};
		class UH60_Cargo02: Crew
		{
			file="\DG_UKBAF\Aircraft\Puma\data\Anim\UH60_Cargo02_V0.rtm";
			interpolateTo[]={KIA_UH60_Cargo02,1};
			connectTo[]={UH60_Cargo02,0.1,UH60_Cargo02_V1,0.1,UH60_Cargo02_V2,0.1,UH60_Cargo02_V3,0.1,UH60_Cargo02_V4,0.1,UH60_Cargo02_V5,0.1};
			equivalentTo="UH60_Cargo02";
			variantsAI[]={UH60_Cargo02,0.5,UH60_Cargo02_V1,0.1,UH60_Cargo02_V2,0.1,UH60_Cargo02_V3,0.1,UH60_Cargo02_V4,0.1,UH60_Cargo02_V5,0.1};
			variantAfter[]={5,10,20};
			speed=0.3;
		};
		class UH60_Cargo02_V1: UH60_Cargo02
		{
			file="\DG_UKBAF\Aircraft\Puma\data\Anim\UH60_Cargo02_V1.rtm";
			interpolateTo[]={KIA_UH60_Cargo02,1};
			connectTo[]={UH60_Cargo02,0.1};
			speed = 0.197;
			variantAfter[]={5,5,5};
		};
		class UH60_Cargo02_V2: UH60_Cargo02
		{
			file="\DG_UKBAF\Aircraft\Puma\data\Anim\UH60_Cargo02_V2.rtm";
			interpolateTo[]={KIA_UH60_Cargo02,1};
			connectTo[]={UH60_Cargo02,0.1};
			speed = 0.294;
			variantAfter[]={3.5,3.5,3.5};
		};
		class UH60_Cargo02_V3: UH60_Cargo02
		{
			file="\DG_UKBAF\Aircraft\Puma\data\Anim\UH60_Cargo02_V3.rtm";
			interpolateTo[]={KIA_UH60_Cargo02,1};
			connectTo[]={UH60_Cargo02,0.1};
			speed = 0.299;
			variantAfter[]={3.5,3.5,3.5};
		};
		class UH60_Cargo02_V4: UH60_Cargo02
		{
			file="\DG_UKBAF\Aircraft\Puma\data\Anim\UH60_Cargo02_V4.rtm";
			interpolateTo[]={KIA_UH60_Cargo02,1};
			connectTo[]={UH60_Cargo02,0.1};
			speed = 0.395;
			variantAfter[]={2.5,2.5,2.5};
		};
		class UH60_Cargo02_V5: UH60_Cargo02
		{
			file="\DG_UKBAF\Aircraft\Puma\data\Anim\UH60_Cargo02_V5.rtm";
			interpolateTo[]={KIA_UH60_Cargo02,1};
			connectTo[]={UH60_Cargo02,0.1};
			speed = 0.263;
			variantAfter[]={4,4,4};
		};		
		
		class C17_Pilot: Crew
		{
			file = "\DG_UKBAF\Aircraft\C17\data\Anim\C17_Pilot.rtm";
			interpolateTo[] = {"KIA_C17_Pilot",1};
		};
		class KIA_C17_Pilot: DefaultDie
		{
			actions = "DeadActions";
			speed = 0.5;
			looped = 0;
			terminal = 1;
			file = "\DG_UKBAF\Aircraft\C17\data\Anim\KIA_C17_Pilot.rtm";
			connectTo[] = {"DeadState",0.1};
		};		
		
		class LR_driver_EP1: Crew
		{
			file="\DG_UKBAF\Vehicles\LandRovers\LR\Data\Anim\LR_driver";
			interpolateTo[]=
			{
				"KIA_LR_driver_EP1",
				1
			};
			speed=1e+010;
		};
		class KIA_LR_driver_EP1: DefaultDie
		{
			actions="DeadActions";
			file="\DG_UKBAF\Vehicles\LandRovers\LR\Data\Anim\KIA_LR_driver";
			speed=1e+010;
			terminal=1;
			soundEnabled=0;
			looped=0;
			connectTo[]=
			{
				"DeadState",
				0.1
			};
		};
		class LR_gunner_EP1: Crew
		{
			file="\DG_UKBAF\Vehicles\LandRovers\LR\Data\Anim\LR_gunner";
			connectTo[]=
			{
				"Stryker_Dead",
				1
			};
			speed=1e+010;
		};
		class LR_gunner01_EP1: Crew
		{
			file="\DG_UKBAF\Vehicles\LandRovers\LR\Data\Anim\LR_gunner01";
			connectTo[]=
			{
				"Stryker_Dead",
				1
			};
			speed=1e+010;
		};
		class LR_gunner02_EP1: Crew
		{
			file="\DG_UKBAF\Vehicles\LandRovers\LR\Data\Anim\LR_gunner02";
			connectTo[]=
			{
				"Stryker_Dead",
				1
			};
			speed=1e+010;
		};
		class LR_gunner03_EP1: Crew
		{
			file="\DG_UKBAF\Vehicles\LandRovers\LR\Data\Anim\LR_gunner03";
			connectTo[]=
			{
				"Stryker_Dead",
				1
			};
			speed=1e+010;
		};
		class LR_Cargo01_EP1: Crew
		{
			file="\DG_UKBAF\Vehicles\LandRovers\LR\Data\Anim\LR_Cargo01";
			interpolateTo[]=
			{
				"KIA_LR_Cargo01_EP1",
				1
			};
			speed=1e+010;
		};
		class KIA_LR_Cargo01_EP1: DefaultDie
		{
			actions="DeadActions";
			file="\DG_UKBAF\Vehicles\LandRovers\LR\Data\Anim\KIA_LR_Cargo01";
			speed=1e+010;
			terminal=1;
			soundEnabled=0;
			looped=0;
			connectTo[]=
			{
				"DeadState",
				0.1
			};
		};

		class LR_Cargo02_EP1: Crew
		{
			file="\DG_UKBAF\Vehicles\LandRovers\LR\Data\Anim\LR_Cargo02";
			interpolateTo[]={KIA_LR_Cargo02_EP1,0.1};
			connectTo[]=
			{
				LR_Cargo02_EP1, 0.1,
				LR_Cargo02_V1_EP1, 0.1,
				LR_Cargo02_V2_EP1, 0.1,
				LR_Cargo02_V3_EP1, 0.1,
				LR_Cargo02_V4_EP1, 0.1,
				LR_Cargo02_V5_EP1, 0.1
			};
			equivalentTo="LR_Cargo02_EP1";
			variantsAI[] =
			{
				LR_Cargo02_EP1, 0.5,
				LR_Cargo02_V1_EP1, 0.12,
				LR_Cargo02_V2_EP1, 0.11,
				LR_Cargo02_V3_EP1, 0.10,
				LR_Cargo02_V4_EP1, 0.09,
				LR_Cargo02_V5_EP1, 0.08
			};
			variantAfter[] = {5, 10, 20};
			speed=1e+010;
		};

		//#define ANIM_VERSION(cargo, version, varSpeed, varAfter1, varAfter2, varAfter3)
		ANIM_VERSION(LR_Cargo02,1,0.243902,5,5,5,KIA_LR_Cargo02_EP1)
		ANIM_VERSION(LR_Cargo02,2,0.370370,5,5,5,KIA_LR_Cargo02_EP1)
		ANIM_VERSION(LR_Cargo02,3,0.312500,5,5,5,KIA_LR_Cargo02_EP1)
		ANIM_VERSION(LR_Cargo02,4,0.370370,5,5,5,KIA_LR_Cargo02_EP1)
		ANIM_VERSION(LR_Cargo02,5,0.297030,5,5,5,KIA_LR_Cargo02_EP1)

		class KIA_LR_Cargo02_EP1: DefaultDie
		{
			actions="DeadActions";
			file="\DG_UKBAF\Vehicles\LandRovers\LR\Data\Anim\KIA_LR_Cargo02";
			speed=1e+010;
			terminal=1;
			soundEnabled=0;
			looped=0;
			connectTo[]=
			{
				"DeadState",
				0.1
			};
		};


		class LR_Cargo03_EP1: Crew
		{
			file="\DG_UKBAF\Vehicles\LandRovers\LR\Data\Anim\LR_Cargo03";
			interpolateTo[]={KIA_LR_Cargo03_EP1,0.1};
			connectTo[]=
			{
				LR_Cargo03_EP1, 0.1,
				LR_Cargo03_V1_EP1, 0.1,
				LR_Cargo03_V2_EP1, 0.1,
				LR_Cargo03_V3_EP1, 0.1,
				LR_Cargo03_V4_EP1, 0.1,
				LR_Cargo03_V5_EP1, 0.1
			};
			equivalentTo="LR_Cargo03_EP1";
			variantsAI[] =
			{
				LR_Cargo03_EP1, 0.5,
				LR_Cargo03_V1_EP1, 0.12,
				LR_Cargo03_V2_EP1, 0.11,
				LR_Cargo03_V3_EP1, 0.10,
				LR_Cargo03_V4_EP1, 0.09,
				LR_Cargo03_V5_EP1, 0.08
			};
			variantAfter[] = {5, 10, 20};
			speed=1e+010;
		};

		//#define ANIM_VERSION(cargo, version, varSpeed, varAfter1, varAfter2, varAfter3)
		ANIM_VERSION(LR_Cargo03,1,0.297030,5,5,5,KIA_LR_Cargo03_EP1)
		ANIM_VERSION(LR_Cargo03,2,0.410959,5,5,5,KIA_LR_Cargo03_EP1)
		ANIM_VERSION(LR_Cargo03,3,0.625000,5,5,5,KIA_LR_Cargo03_EP1)
		ANIM_VERSION(LR_Cargo03,4,0.177515,5,5,5,KIA_LR_Cargo03_EP1)
		ANIM_VERSION(LR_Cargo03,5,0.333333,5,5,5,KIA_LR_Cargo03_EP1)

		class KIA_LR_Cargo03_EP1: DefaultDie
		{
			actions="DeadActions";
			file="\DG_UKBAF\Vehicles\LandRovers\LR\Data\Anim\KIA_LR_Cargo03";
			speed=1e+010;
			terminal=1;
			soundEnabled=0;
			looped=0;
			connectTo[]=
			{
				"DeadState",
				0.1
			};
		};

		class LR_Cargo04_EP1: Crew
		{
			file="\DG_UKBAF\Vehicles\LandRovers\LR\Data\Anim\LR_Cargo04";
			interpolateTo[]={KIA_LR_Cargo04_EP1,0.1};
			connectTo[]=
			{
				LR_Cargo04_EP1, 0.1,
				LR_Cargo04_V1_EP1, 0.1,
				LR_Cargo04_V2_EP1, 0.1,
				LR_Cargo04_V3_EP1, 0.1,
				LR_Cargo04_V4_EP1, 0.1,
				LR_Cargo04_V5_EP1, 0.1
			};
			equivalentTo="LR_Cargo04_EP1";
			variantsAI[] =
			{
				LR_Cargo04_EP1, 0.5,
				LR_Cargo04_V1_EP1, 0.12,
				LR_Cargo04_V2_EP1, 0.11,
				LR_Cargo04_V3_EP1, 0.10,
				LR_Cargo04_V4_EP1, 0.09,
				LR_Cargo04_V5_EP1, 0.08
			};
			variantAfter[] = {5, 10, 20};
			speed=1e+010;
		};

		//#define ANIM_VERSION(cargo, version, varSpeed, varAfter1, varAfter2, varAfter3)
		ANIM_VERSION(LR_Cargo04,1,0.312500,5,5,5,KIA_LR_Cargo04_EP1)
		ANIM_VERSION(LR_Cargo04,2,0.410959,5,5,5,KIA_LR_Cargo04_EP1)
		ANIM_VERSION(LR_Cargo04,3,0.333333,5,5,5,KIA_LR_Cargo04_EP1)
		ANIM_VERSION(LR_Cargo04,4,0.410959,5,5,5,KIA_LR_Cargo04_EP1)
		ANIM_VERSION(LR_Cargo04,5,0.535714,5,5,5,KIA_LR_Cargo04_EP1)

		class KIA_LR_Cargo04_EP1: DefaultDie
		{
			actions="DeadActions";
			file="\DG_UKBAF\Vehicles\LandRovers\LR\Data\Anim\KIA_LR_Cargo04";
			speed=1e+010;
			terminal=1;
			soundEnabled=0;
			looped=0;
			connectTo[]=
			{
				"DeadState",
				0.1
			};
		};

		class LR_Cargo05_EP1: Crew
		{
			file="\DG_UKBAF\Vehicles\LandRovers\LR\Data\Anim\LR_Cargo05";
			interpolateTo[]={KIA_LR_Cargo05_EP1,0.1};
			connectTo[]=
			{
				LR_Cargo05_EP1, 0.1,
				LR_Cargo05_V1_EP1, 0.1,
				LR_Cargo05_V2_EP1, 0.1,
				LR_Cargo05_V3_EP1, 0.1,
				LR_Cargo05_V4_EP1, 0.1,
				LR_Cargo05_V5_EP1, 0.1
			};
			equivalentTo="LR_Cargo05_EP1";
			variantsAI[] =
			{
				LR_Cargo05_EP1, 0.5,
				LR_Cargo05_V1_EP1, 0.12,
				LR_Cargo05_V2_EP1, 0.11,
				LR_Cargo05_V3_EP1, 0.10,
				LR_Cargo05_V4_EP1, 0.09,
				LR_Cargo05_V5_EP1, 0.08
			};
			variantAfter[] = {5, 10, 20};
			speed=1e+010;
		};

		//#define ANIM_VERSION(cargo, version, varSpeed, varAfter1, varAfter2, varAfter3)
		ANIM_VERSION(LR_Cargo05,1,0.410959,5,5,5,KIA_LR_Cargo05_EP1)
		ANIM_VERSION(LR_Cargo05,2,0.370370,5,5,5,KIA_LR_Cargo05_EP1)
		ANIM_VERSION(LR_Cargo05,3,0.410959,5,5,5,KIA_LR_Cargo05_EP1)
		ANIM_VERSION(LR_Cargo05,4,0.535714,5,5,5,KIA_LR_Cargo05_EP1)
		ANIM_VERSION(LR_Cargo05,5,0.177515,5,5,5,KIA_LR_Cargo05_EP1)

		class KIA_LR_Cargo05_EP1: DefaultDie
		{
			actions="DeadActions";
			file="\DG_UKBAF\Vehicles\LandRovers\LR\Data\Anim\KIA_LR_Cargo05";
			speed=1e+010;
			terminal=1;
			soundEnabled=0;
			looped=0;
			connectTo[]=
			{
				"DeadState",
				0.1
			};
		};		
		
		
		class Jackal_gunner_L2A1_BAF: Crew
		{
			file = "\DG_UKBAF\Vehicles\Jackal\data\Anim\Jackal_BAF_gunner_L2A1";
			interpolateTo[] = {"Jackal_KIA_Gunner_BAF", 1};
			speed = 1e+010;
		};
		class Jackal_gunner_GMG_BAF: Crew
		{
			file = "\DG_UKBAF\Vehicles\Jackal\data\Anim\Jackal_BAF_gunner_GMG";
			interpolateTo[] = {"Jackal_KIA_Gunner_BAF", 1};
			speed = 1e+010;
		};
		class Jackal_Cargo_BAF: Crew
		{
			file = "\DG_UKBAF\Vehicles\Jackal\data\Anim\Jackal_BAF_cargo";
			interpolateTo[] = {"Unconscious", 1};
			speed = 1e+010;
		};
		class Jackal_driver_BAF: Crew
		{
			file = "\DG_UKBAF\Vehicles\Jackal\data\Anim\Jackal_BAF_driver";
			interpolateTo[] = {"Jackal_KIA_Driver_BAF", 1};
			speed = 1e+010;
		};
		class Jackal_commander_BAF: Crew
		{
			file = "\DG_UKBAF\Vehicles\Jackal\data\Anim\Jackal_BAF_commander";
			interpolateTo[] = {"Jackal_KIA_Driver_BAF", 1};
			speed = 1e+010;
		};
		class Jackal_KIA_Driver_BAF: DefaultDie
		{
			actions = "DeadActions";
			file = "\DG_UKBAF\Vehicles\Jackal\data\Anim\Jackal_KIA_Driver";
			speed = 1e+010;
			terminal = 1;
			soundEnabled = 0;
			looped = 0;
			interpolateTo[] = {"Unconscious", 0.1};
		};
		class Jackal_KIA_Gunner_BAF: DefaultDie
		{
			actions = "DeadActions";
			file = "\DG_UKBAF\Vehicles\Jackal\data\Anim\Jackal_KIA_Gunner";
			speed = 1e+010;
			terminal = 1;
			soundEnabled = 0;
			looped = 0;
			interpolateTo[] = {"Unconscious", 0.1};
		};		
		
		class KIA_Abrams_Commander:DefaultDie
		{
			actions = DeadActions;
			file="\DG_UKBAF\Vehicles\FV510Warrior\Desert\Data\Anim\KIA_Abrams_Commander.rtm";
			terminal = 1;
			soundEnabled=0;
			connectTo[] = {DeadState,0.1};
			speed = 0.5;
			looped=false;
		};
		class Abrams_Commander: Crew
		{
			file="\DG_UKBAF\Vehicles\FV510Warrior\Desert\Data\Anim\Abrams_Commander.rtm";
			interpolateTo[]={KIA_Abrams_Commander,1};
		};
		class Abrams_CommanderOut: Abrams_Commander
		{
			file="\DG_UKBAF\Vehicles\FV510Warrior\Desert\Data\Anim\Abrams_CommanderOut.rtm";
			interpolateTo[]={KIA_Abrams_Commander,1};
		};		
		class KIA_Abrams_Driver:DefaultDie
		{
			actions = DeadActions;
			file="\DG_UKBAF\Vehicles\FV510Warrior\Desert\Data\Anim\KIA_Abrams_Driver.rtm";
			speed = 0.5;
			looped=false;
			terminal = 1;
			soundEnabled=0;
			connectTo[] = {DeadState,0.1};
		};
	
		class Abrams_Driver: Crew
		{
			file="\DG_UKBAF\Vehicles\FV510Warrior\Desert\Data\Anim\Abrams_Driver.rtm";
			interpolateTo[]={KIA_Abrams_Driver,1};
		};
		class Abrams_DriverOut: Abrams_Driver
		{
			file="\DG_UKBAF\Vehicles\FV510Warrior\Desert\Data\Anim\Abrams_DriverOut.rtm";
			interpolateTo[]={KIA_Abrams_Driver,1};
		};		
		
		class KIA_Abrams_Gunner:DefaultDie
		{
			actions = DeadActions;
			file="\DG_UKBAF\Vehicles\FV510Warrior\Desert\Data\Anim\KIA_Abrams_Commander.rtm";
			speed = 0.5;
			looped=false;
			terminal = 1;
			soundEnabled=0;
			connectTo[] = {DeadState,0.1};
		};
		class Abrams_Gunner: Crew
		{
			file="\DG_UKBAF\Vehicles\FV510Warrior\Desert\Data\Anim\Abrams_Commander.rtm";
			interpolateTo[]={KIA_Abrams_Gunner,1};
		};		
		class M113_Cargo01_EP1: Crew
		{
			file="\DG_UKBAF\Vehicles\FV510Warrior\Desert\Data\Anim\M113_Cargo01";
			interpolateTo[]={M113_KIA_Cargo01_EP1,0.1};
			connectTo[]=
			{
				M113_Cargo01_EP1, 0.1,
				M113_Cargo01_V1_EP1, 0.1,
				M113_Cargo01_V2_EP1, 0.1,
				M113_Cargo01_V3_EP1, 0.1,
				M113_Cargo01_V4_EP1, 0.1,
				M113_Cargo01_V5_EP1, 0.1
			};
			equivalentTo="M113_Cargo01_EP1";
			variantsAI[] =
			{
				M113_Cargo01_EP1, 0.5,
				M113_Cargo01_V1_EP1, 0.12,
				M113_Cargo01_V2_EP1, 0.11,
				M113_Cargo01_V3_EP1, 0.10,
				M113_Cargo01_V4_EP1, 0.09,
				M113_Cargo01_V5_EP1, 0.08				
			};
			variantAfter[] = {5, 10, 20};			
			speed=1e+010;
		};
		
		//#define ANIM_VERSION(cargo, version, varSpeed, varAfter1, varAfter2, varAfter3)
		ANIM_VERSION(M113_Cargo01,1,0.245902,5,5,5)
		ANIM_VERSION(M113_Cargo01,2,0.410959,5,5,5)
		ANIM_VERSION(M113_Cargo01,3,0.333333,5,5,5)
		ANIM_VERSION(M113_Cargo01,4,0.410959,5,5,5)
		ANIM_VERSION(M113_Cargo01,5,0.177515,5,5,5)		
		
		class M113_KIA_Cargo01_EP1: DefaultDie
		{
			actions="DeadActions";
			file="\DG_UKBAF\Vehicles\FV510Warrior\Desert\Data\Anim\M113_KIA_Cargo01";
			speed=1e+010;
			terminal=1;
			soundEnabled=0;
			looped=0;
			connectTo[]=
			{
				"DeadState",
				0.1
			};
		};

		class M113_Cargo02_EP1: Crew
		{
			file="\DG_UKBAF\Vehicles\FV510Warrior\Desert\Data\Anim\M113_Cargo02";
			interpolateTo[]={M113_KIA_Cargo01_EP1,0.1};
			connectTo[]=
			{
				M113_Cargo02_EP1, 0.1,
				M113_Cargo02_V1_EP1, 0.1,
				M113_Cargo02_V2_EP1, 0.1,
				M113_Cargo02_V3_EP1, 0.1,
				M113_Cargo02_V4_EP1, 0.1,
				M113_Cargo02_V5_EP1, 0.1
			};
			equivalentTo="M113_Cargo02_EP1";
			variantsAI[] =
			{
				M113_Cargo02_EP1, 0.5,
				M113_Cargo02_V1_EP1, 0.12,
				M113_Cargo02_V2_EP1, 0.11,
				M113_Cargo02_V3_EP1, 0.10,
				M113_Cargo02_V4_EP1, 0.09,
				M113_Cargo02_V5_EP1, 0.08				
			};
			variantAfter[] = {5, 10, 20};			
			speed=1e+010;
		};
		
		//#define ANIM_VERSION(cargo, version, varSpeed, varAfter1, varAfter2, varAfter3)
		ANIM_VERSION(M113_Cargo02,1,0.370370,5,5,5)
		ANIM_VERSION(M113_Cargo02,2,0.410959,5,5,5)
		ANIM_VERSION(M113_Cargo02,3,0.333333,5,5,5)
		ANIM_VERSION(M113_Cargo02,4,0.410959,5,5,5)
		ANIM_VERSION(M113_Cargo02,5,0.535714,5,5,5)		
		
		class M113_Cargo03_EP1: Crew
		{
			file="\DG_UKBAF\Vehicles\FV510Warrior\Desert\Data\Anim\M113_Cargo03";
			interpolateTo[]={M113_KIA_Cargo01_EP1,0.1};
			connectTo[]=
			{
				M113_Cargo03_EP1, 0.1,
				M113_Cargo03_V1_EP1, 0.1,
				M113_Cargo03_V2_EP1, 0.1,
				M113_Cargo03_V3_EP1, 0.1,
				M113_Cargo03_V4_EP1, 0.1
			};
			equivalentTo="M113_Cargo03_EP1";
			variantsAI[] =
			{
				M113_Cargo03_EP1, 0.5,
				M113_Cargo03_V1_EP1, 0.15,
				M113_Cargo03_V2_EP1, 0.13,
				M113_Cargo03_V3_EP1, 0.11,
				M113_Cargo03_V4_EP1, 0.11
			};
			variantAfter[] = {5, 10, 20};			
			speed=1e+010;
		};
		
		//#define ANIM_VERSION(cargo, version, varSpeed, varAfter1, varAfter2, varAfter3)
		ANIM_VERSION(M113_Cargo03,1,0.297030,5,5,5)
		ANIM_VERSION(M113_Cargo03,2,0.410959,5,5,5)
		ANIM_VERSION(M113_Cargo03,3,0.625000,5,5,5)
		ANIM_VERSION(M113_Cargo03,4,0.535714,5,5,5)
		
		class M113_Cargo04_EP1: Crew
		{
			file="\DG_UKBAF\Vehicles\FV510Warrior\Desert\Data\Anim\M113_Cargo04";
			interpolateTo[]={M113_KIA_Cargo01_EP1,0.1};
			connectTo[]=
			{
				M113_Cargo04_EP1, 0.1,
				M113_Cargo04_V1_EP1, 0.1,
				M113_Cargo04_V2_EP1, 0.1,
				M113_Cargo04_V3_EP1, 0.1,
				M113_Cargo04_V4_EP1, 0.1,
				M113_Cargo04_V5_EP1, 0.1
			};
			equivalentTo="M113_Cargo04_EP1";
			variantsAI[] =
			{
				M113_Cargo04_EP1, 0.5,
				M113_Cargo04_V1_EP1, 0.12,
				M113_Cargo04_V2_EP1, 0.11,
				M113_Cargo04_V3_EP1, 0.10,
				M113_Cargo04_V4_EP1, 0.09,
				M113_Cargo04_V5_EP1, 0.08				
			};
			variantAfter[] = {5, 10, 20};			
			speed=1e+010;
		};		
		
		class CH47_Cargo_EP1: Crew
		{
			file = "\DG_UKBAF\Aircraft\Chinooks\data\anim\CH47_Cargo";
			interpolateTo[] = {"CH47_KIA_Cargo_EP1", 1};
			speed = 1e+010;
		};
		class CH47_KIA_Cargo_EP1: DefaultDie
		{
			actions = "DeadActions";
			file = "\DG_UKBAF\Aircraft\Chinooks\data\anim\CH47_KIA_Cargo";
			speed = 1e+010;
			terminal = 1;
			soundEnabled = 0;
			looped = 0;
			connectTo[] = {"Unconscious", 0.1};
		};
		class CH47_Cargo01_EP1: Crew
		{
			file = "\DG_UKBAF\Aircraft\Chinooks\data\anim\CH47_Cargo01";
			interpolateTo[] = {"CH47_KIA_Cargo01_EP1", 1};
			speed = 1e+010;
		};
		class CH47_KIA_Cargo01_EP1: DefaultDie
		{
			actions = "DeadActions";
			file = "\DG_UKBAF\Aircraft\Chinooks\data\anim\CH47_KIA_Cargo01";
			speed = 1e+010;
			terminal = 1;
			soundEnabled = 0;
			looped = 0;
			connectTo[] = {"Unconscious", 0.1};
		};
		class CH47_Cargo02_EP1: Crew
		{
			file = "\DG_UKBAF\Aircraft\Chinooks\data\anim\CH47_Cargo02";
			interpolateTo[] = {"CH47_KIA_Cargo02_EP1", 1};
			speed = 1e+010;
		};
		class CH47_KIA_Cargo02_EP1: DefaultDie
		{
			actions = "DeadActions";
			file = "\DG_UKBAF\Aircraft\Chinooks\data\anim\CH47_KIA_Cargo02";
			speed = 1e+010;
			terminal = 1;
			soundEnabled = 0;
			looped = 0;
			connectTo[] = {"Unconscious", 0.1};
		};
		class CH47_Cargo03_EP1: Crew
		{
			file = "\DG_UKBAF\Aircraft\Chinooks\data\anim\CH47_Cargo03";
			interpolateTo[] = {"CH47_KIA_Cargo03_EP1", 1};
			speed = 1e+010;
		};
		class CH47_KIA_Cargo03_EP1: DefaultDie
		{
			actions = "DeadActions";
			file = "\DG_UKBAF\Aircraft\Chinooks\data\anim\CH47_KIA_Cargo03";
			speed = 1e+010;
			terminal = 1;
			soundEnabled = 0;
			looped = 0;
			connectTo[] = {"Unconscious", 0.1};
		};
		class CH47_Pilot_EP1: Crew
		{
			file = "\DG_UKBAF\Aircraft\Chinooks\data\anim\CH47_Pilot";
			connectTo[] = {"CH47_KIA_Pilot_EP1", 1};
			speed = 1e+010;
		};
		class CH47_KIA_Pilot_EP1: DefaultDie
		{
			actions = "DeadActions";
			file = "\DG_UKBAF\Aircraft\Chinooks\data\anim\CH47_KIA_Pilot";
			speed = 1e+010;
			terminal = 1;
			soundEnabled = 0;
			looped = 0;
			connectTo[] = {"Unconscious",0.1};
		};
		class CH47_Gunner_EP1: Crew
		{
			file = "\DG_UKBAF\Aircraft\Chinooks\data\anim\CH47_Gunner02";
			connectTo[] = {"CH47_KIA_Gunner01_EP1",	1};
			speed = 1e+010;
		};
		class CH47_KIA_Gunner_EP1: DefaultDie
		{
			actions="DeadActions";
			file="\DG_UKBAF\Aircraft\Chinooks\data\anim\CH47_KIA_Gunner";
			speed=1e+010;
			terminal=1;
			soundEnabled=0;
			looped=0;
			connectTo[]=
			{
				"Unconscious",
				0.1
			};
		};
		class CH47_Gunner01_EP1: Crew
		{
			file = "\DG_UKBAF\Aircraft\Chinooks\data\anim\CH47_Gunner";
			connectTo[] = {"CH47_KIA_Gunner01_EP1",	1};
			speed = 1e+010;
		};
		class CH47_KIA_Gunner01_EP1: DefaultDie
		{
			actions = "DeadActions";
			file = "\DG_UKBAF\Aircraft\Chinooks\data\anim\CH47_KIA_Gunner01";
			speed = 1e+010;
			terminal = 1;
			soundEnabled = 0;
			looped = 0;
			connectTo[] = {"Unconscious",0.1};
		};		
		class AH64_gunner_EP1: Crew
		{
			file="\DG_UKBAF\Aircraft\Data\Anim\AH64_gunner";
			connectTo[]=
			{
				"KIA_AH64_gunner_EP1",
				1
			};
			speed=1e+010;
		};
		class KIA_AH64_gunner_EP1: DefaultDie
		{
			actions="DeadActions";
			file="\DG_UKBAF\Aircraft\Data\Anim\KIA_AH64_gunner";
			speed=1e+010;
			terminal=1;
			soundEnabled=0;
			looped=0;
			connectTo[]=
			{
				"DeadState",
				0.1
			};
		};
		class AH64_pilot_EP1: Crew
		{
			file="\DG_UKBAF\Aircraft\Data\Anim\AH64_pilot";
			connectTo[]=
			{
				"KIA_AH64_pilot_EP1",
				1
			};
			speed=1e+010;
		};
		class KIA_AH64_pilot_EP1: DefaultDie
		{
			actions="DeadActions";
			file="\DG_UKBAF\Aircraft\Data\Anim\KIA_AH64_pilot";
			speed=1e+010;
			terminal=1;
			soundEnabled=0;
			looped=0;
			connectTo[]=
			{
				"DeadState",
				0.1
			};
		};		
		
		class AW159_Cargo_BAF: Crew
		
		{
			file="\DG_UKBAF\Aircraft\Data\Anim\AW159_Cargo";
			connectTo[]=
			{
				"AW159_KIA_Cargo_BAF",
				1
			};
			speed=1e+010;
		};
		class AW159_KIA_Cargo_BAF: DefaultDie
		{
			actions="DeadActions";
			file="\DG_UKBAF\Aircraft\Data\Anim\AW159_KIA_Cargo";
			speed=1e+010;
			terminal=1;
			soundEnabled=0;
			looped=0;
			connectTo[]=
			{
				"DeadState",
				0.1
			};
		};
		
		class AW159_Cargo01_BAF: Crew
		{
			file="\DG_UKBAF\Aircraft\Data\Anim\AW159_Cargo01";
			connectTo[]=
			{
				"AW159_KIA_Cargo_BAF",
				1
			};
			speed=1e+010;
		};
		
		class AW159_Pilot_BAF: Crew
		{
			file="\DG_UKBAF\Aircraft\Data\Anim\AW159_Pilot";
			connectTo[]=
			{
				"AW159_KIA_Pilot_BAF",
				1
			};
			speed=1e+010;
		};
		class AW159_KIA_Pilot_BAF: DefaultDie
		{
			actions="DeadActions";
			file="\DG_UKBAF\Aircraft\Data\Anim\AW159_Kia_Pilot";
			speed=1e+010;
			terminal=1;
			soundEnabled=0;
			looped=0;
			connectTo[]=
			{
				"DeadState",
				0.1
			};
		};
		
		///Merlin Animations///
		
		class Merlin_Cargo_BAF: Crew
		{
			file="\DG_UKBAF\Aircraft\Data\Anim\Merlin_Cargo";
			connectTo[]=
			{
				"Merlin_KIA_Cargo_BAF",
				1
			};
			speed=1e+010;
		};
		class Merlin_KIA_Cargo_BAF: DefaultDie
		{
			actions="DeadActions";
			file="\DG_UKBAF\Aircraft\Data\Anim\Merlin_KIA_Cargo";
			speed=1e+010;
			terminal=1;
			soundEnabled=0;
			looped=0;
			connectTo[]=
			{
				"DeadState",
				0.1
			};
		};
		
		class Merlin_Cargo01_BAF: Crew
		{
			file="\DG_UKBAF\Aircraft\Data\Anim\Merlin_Cargo01";
			connectTo[]=
			{
				"Merlin_KIA_Cargo_BAF",
				1
			};
			speed=1e+010;
		};
		
		class Merlin_Pilot_BAF: Crew
		{
			file="\DG_UKBAF\Aircraft\Data\Anim\Merlin_Pilot";
			connectTo[]=
			{
				"Merlin_KIA_Pilot_BAF",
				1
			};
			speed=1e+010;
		};
		class Merlin_KIA_Pilot_BAF: DefaultDie
		{
			actions="DeadActions";
			file="\DG_UKBAF\Aircraft\Data\Anim\Merlin_Kia_Pilot";
			speed=1e+010;
			terminal=1;
			soundEnabled=0;
			looped=0;
			connectTo[]=
			{
				"DeadState",
				0.1
			};
		};		
	};
};
class CfgMovesWomen: CfgMovesBasic
{
	class DefaultDie;
	class ManActions
	{	
		AW159_Cargo_BAF="crew";
		AW159_Cargo01_BAF="crew";
		AW159_Pilot_BAF="crew";
		Merlin_Cargo_BAF="crew";
		Merlin_Cargo01_BAF="crew";
		Merlin_Pilot_BAF="crew";
		AH64_gunner_EP1="";
		AH64_pilot_EP1="";	

		CH47_Cargo_EP1 = "crew";
		CH47_Cargo01_EP1 = "crew";
		CH47_Cargo02_EP1 = "crew";
		CH47_Cargo03_EP1 = "crew";
		CH47_Gunner_EP1 = "";
		CH47_Gunner01_EP1 = "";
		CH47_Pilot_EP1 = "";
		
		M113_Cargo01_EP1="";
		M113_Cargo02_EP1="";
		M113_Cargo03_EP1="";
		M113_Cargo04_EP1="";			
		Abrams_Driver = "";
		Abrams_DriverOUT = "";	
		Abrams_Gunner = "";	

		Jackal_gunner_L2A1_BAF = "";
		Jackal_gunner_GMG_BAF = "";
		Jackal_Cargo_BAF = "";
		Jackal_driver_BAF = "";
		Jackal_commander_BAF = "";

		LR_driver_EP1="";
		LR_gunner_EP1="";
		LR_gunner01_EP1="";
		LR_gunner02_EP1="";
		LR_gunner03_EP1="";
		LR_Cargo01_EP1="crew";
		LR_Cargo02_EP1="crew";
		LR_Cargo03_EP1="crew";
		LR_Cargo04_EP1="crew";
		LR_Cargo05_EP1="crew";	

		Cha_AV8B_Pilot = "";	

		ArmoredSUV_Gunner_PMC = "crew";		
		
		SUV_Cargo_EP1="crew";
		SUV_Cargo01_EP1="crew";
		SUV_Cargo02_EP1="crew";
		SUV_Driver_EP1="";		
	};
};