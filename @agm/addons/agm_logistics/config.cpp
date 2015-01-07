////////////////////////////////////////////////////////////////////
//DeRap: Produced from mikero's Dos Tools Dll version 4.52
//Wed Jan 07 14:09:47 2015 : Source 'file' date Wed Jan 07 14:09:47 2015
//http://dev-heaven.net/projects/list_files/mikero-pbodll
////////////////////////////////////////////////////////////////////

#define _ARMA_

//Class C:/Users/sil/Documents/GitHub/altislife/@agm/addons/0_no/agm_logistics/config.bin{
class CfgPatches
{
	class AGM_Logistics
	{
		units[] = {"AGM_JerryCan","AGM_SpareTrack","AGM_SpareWheel","AGM_SandbagBarrier_Crate","AGM_RazorWire_Crate"};
		weapons[] = {"AGM_UAVBattery"};
		requiredVersion = 0.6;
		requiredAddons[] = {"AGM_Core","AGM_Interaction"};
		version = "0.95";
		versionStr = "0.95";
		versionAr[] = {0,95,0};
		author[] = {"commy2","KoffeinFlummi","Garth 'L-H' de Wet","marc_book","gpgpgpgp","nic547"};
		authorUrl = "https://github.com/commy2/";
	};
};
class CfgFunctions
{
	class AGM_Logistics
	{
		class AGM_Logistics
		{
			file = "\AGM_Logistics\functions";
			class canLoadItem;
			class canLoadItemCarried;
			class canLoadMagazine;
			class hasLoadedItems;
			class initLoadedObject;
			class getLoadableMagazines;
			class getLoadPoints;
			class getPosLoadable;
			class getWeaponsOfMagazine;
			class loadItem;
			class loadItemAbort;
			class loadItemCallback;
			class loadMagazine;
			class loadMagazineCallback;
			class loadMagazineRemote;
			class openLoadUI;
			class openMagazineMenu;
			class openUnloadUI;
			class remainingSpace;
			class unloadItem;
			class unloadItemCallback;
			class spawnObject;
		};
	};
	class AGM_Drag
	{
		class AGM_Drag
		{
			file = "\AGM_Logistics\functions\Drag";
			class initialise
			{
				postInit = 1;
			};
			class makeDraggable;
			class makeUndraggable;
			class dragObject;
			class releaseObject;
			class isDraggingObject;
			class handleScrollWheel;
			class isDraggable;
			class GetWeight;
			class isCarryable;
			class isCarryingObject;
			class carryJerrycan;
			class dropJerrycan;
		};
	};
	class AGM_Repair
	{
		class AGM_Repair
		{
			file = "\AGM_Logistics\functions\Repair";
			class canRemoveWheel;
			class canRepair;
			class canRepairTrack;
			class canRepairWheel;
			class checkVehicle;
			class checkVehicleCallback;
			class getHitPointName;
			class getNearestRepairer;
			class getNearestTrack;
			class getNearestWheel;
			class module;
			class openSelectWheelUI;
			class openSelectWheelUI_Salvage;
			class removeWheel;
			class removeWheelAbort;
			class removeWheelCallback;
			class repair;
			class repairAbort;
			class repairCallback;
			class repairTrack;
			class repairTrackAbort;
			class repairTrackCallback;
			class repairWheel;
			class repairWheelAbort;
			class repairWheelCallback;
			class setDamage;
			class setHitPointDamage;
		};
	};
	class AGM_StaticWeapons
	{
		class AGM_StaticWeapons
		{
			file = "\AGM_Logistics\functions\StaticWeapons";
			class canGetIn;
			class canRotate;
			class getIn;
			class rotate;
		};
	};
	class AGM_UAVs
	{
		class AGM_UAVs
		{
			file = "\AGM_Logistics\functions\UAVs";
			class refuel;
			class refuelCallback;
		};
	};
	class AGM_Wirecutter
	{
		class AGM_Wirecutter
		{
			file = "\AGM_Logistics\functions\Wirecutter";
			class cutDownFence;
			class cutDownFenceAbort;
			class cutDownFenceCallback;
		};
	};
	class AGM_Resupply
	{
		class AGM_Resupply
		{
			file = "\AGM_Logistics\functions\Resupply";
			class getFuelAmount;
			class getFuelAmountCallback;
			class getFuelAmountCargo;
			class getFuelAmountCargoCallback;
			class getFuelAmountJerrycan;
			class getNearestRefueler;
			class canDrainFuel;
			class canDrainFuelCargo;
			class canRefuel;
			class canRefuelCargo;
			class drainFuel;
			class drainFuelCallback;
			class drainFuelCargo;
			class drainFuelCargoCallback;
			class refuelVehicle;
			class refuelVehicleCallback;
			class refuelVehicleCargo;
			class refuelVehicleCargoCallback;
		};
	};
	class AGM_Paradrop
	{
		class AGM_Paradrop
		{
			file = "\AGM_Logistics\functions\Paradrop";
			class paradrop;
		};
	};
	class AGM_Fortifications
	{
		class AGM_Fortifications
		{
			file = "\AGM_Logistics\functions\Fortifications";
			class initialise
			{
				postInit = 1;
			};
			class canSetupBarrier;
			class setupApprove;
			class setupBarrier;
			class setupCancel;
			class openSelectBarrierlUI;
		};
	};
};
class Extended_PostInit_EventHandlers
{
	class AGM_Logistics
	{
		serverInit = "call compile preprocessFileLineNumbers '\AGM_Logistics\serverInit.sqf'";
	};
};
class Extended_GetIn_EventHandlers
{
	class AllVehicles
	{
		class AGM_DropItem
		{
			clientGetIn = "if (player == _this select 2) then {(_this select 2) call AGM_Drag_fnc_releaseObject}";
		};
	};
};
class Extended_Killed_EventHandlers
{
	class CAManBase
	{
		class AGM_DropItem
		{
			clientKilled = "if (player == _this select 0) then {(_this select 0) call AGM_Drag_fnc_releaseObject}";
		};
	};
};
class Extended_WeaponAssembled_EventHandlers
{
	class CAManBase
	{
		class AGM_DropItem
		{
			clientWeaponAssembled = "if (player == _this select 0) then {(_this select 0) call AGM_Drag_fnc_releaseObject}";
		};
	};
};
class Extended_WeaponDisassembled_EventHandlers
{
	class CAManBase
	{
		class AGM_DropItem
		{
			clientWeaponDisassembled = "if (player == _this select 0) then {(_this select 0) call AGM_Drag_fnc_releaseObject}";
		};
	};
};
class AGM_Core_canInteractConditions
{
	class AGM_Drag_isNotDragging
	{
		condition = "!(_player getVariable ['AGM_isDragging', false])";
	};
};
class CfgAddons
{
	class AGM_Repair_Items
	{
		list[] = {"AGM_Repair_Track","AGM_Repair_Wheel"};
	};
};
class CfgSounds
{
	class AGM_Wirecutter_sound
	{
		name = "AGM_wirecutter_sound";
		sound[] = {"AGM_Logistics\sound\wire_cut.ogg","db-0",1};
		titles[] = {};
	};
	class AGM_Wirecutter_sound_long
	{
		name = "AGM_wirecutter_sound_long";
		sound[] = {"AGM_Logistics\sound\wire_cut_long.ogg","db-0",1};
		titles[] = {};
	};
};
class CfgVehicleClasses
{
	class AGM_Repair_Items
	{
		displayName = "AGM";
	};
};
class CfgVehicles
{
	class Man;
	class CAManBase: Man
	{
		class AGM_SelfActions
		{
			class AGM_ReleaseItemSelf
			{
				displayName = "$STR_AGM_Drag_EndDrag";
				condition = "player call AGM_Drag_fnc_isDraggingObject";
				statement = "player call AGM_Drag_fnc_releaseObject";
				exceptions[] = {"AGM_Drag_isNotDragging"};
				showDisabled = 0;
				priority = 2.1;
				hotkey = "R";
			};
			class AGM_CheckFuelSelf
			{
				displayName = "$STR_AGM_Resupply_CheckFuelJerryCan";
				condition = "(player getVariable ['AGM_carriedItem', objNull]) isKindOf 'AGM_JerryCan'";
				statement = "[player] call AGM_Resupply_fnc_getFuelAmountJerrycan";
				exceptions[] = {"AGM_Drag_isNotDragging"};
				showDisabled = 0;
				priority = 3;
				icon = "\A3\ui_f\data\igui\cfg\actions\refuel_ca.paa";
			};
		};
	};
	class LandVehicle;
	class Car: LandVehicle
	{
		AGM_Vehicle_Cargo = 4;
		class AGM_Actions
		{
			class AGM_copRegistration
			{
				displayName = "$STR_vInAct_Registration";
				distance = 4;
				condition = "alive AGM_Interaction_Target && {speed AGM_Interaction_Target == 0} && {playerSide in [west,independent]}";
				statement = "[AGM_Interaction_Target] spawn life_fnc_searchVehAction";
				showDisabled = 0;
				priority = 1.6;
				// icon = "\A3\ui_f\data\igui\cfg\actions\gear_ca.paa";
			};
			class AGM_copPullout
			{
				displayName = "Sortir tt le monde";
				distance = 4;
				condition = "alive AGM_Interaction_Target && {speed AGM_Interaction_Target == 0} && {count crew AGM_Interaction_Target != 0} && {playerSide == west}";
				statement = "[AGM_Interaction_Target] spawn life_fnc_pulloutAction";
				showDisabled = 0;
				priority = 1.6;
				// icon = "\A3\ui_f\data\igui\cfg\actions\gear_ca.paa";
			};
			class AGM_Impound
			{
				displayName = "$STR_vInAct_Impound";
				distance = 4;
				condition = "alive AGM_Interaction_Target && {speed AGM_Interaction_Target == 0} && {playerSide in [west,independent]}";
				statement = "[AGM_Interaction_Target] spawn life_fnc_impoundAction";
				showDisabled = 0;
				priority = 1.6;
				// icon = "\A3\ui_f\data\igui\cfg\actions\gear_ca.paa";
			};
			class AGM_Kart
			{
				displayName = "$STR_vInAct_GetInKart";
				distance = 4;
				condition = "alive AGM_Interaction_Target && {speed AGM_Interaction_Target == 0} && {typeOf (AGM_Interaction_Target) in [""C_Kart_01_Blu_F"",""C_Kart_01_Red_F"",""C_Kart_01_Fuel_F"",""C_Kart_01_Vrana_F""]} && {canMove AGM_Interaction_Target} && {count crew AGM_Interaction_Target != 0} && {locked AGM_Interaction_Target == 0}";
				statement = "player moveInDriver life_vInact_curTarget";
				showDisabled = 0;
				priority = 1.6;
				// icon = "\A3\ui_f\data\igui\cfg\actions\gear_ca.paa";
			};
			class AGM_Unflip
			{
				displayName = "$STR_vInAct_Unflip";
				distance = 4;
				condition = "alive AGM_Interaction_Target && {speed AGM_Interaction_Target == 0} && {!(typeOf (AGM_Interaction_Target) in [""C_Kart_01_Blu_F"",""C_Kart_01_Red_F"",""C_Kart_01_Fuel_F"",""C_Kart_01_Vrana_F""])} && {canMove AGM_Interaction_Target} && {count crew AGM_Interaction_Target != 0}";
				statement = "AGM_Interaction_Target setPos [getPos AGM_Interaction_Target select 0, getPos AGM_Interaction_Target select 1, (getPos AGM_Interaction_Target select 2)+0.5]";
				showDisabled = 0;
				priority = 1.6;
				// icon = "\A3\ui_f\data\igui\cfg\actions\gear_ca.paa";
			};
			class AGM_DeviceMine
			{
				displayName = "$STR_vInAct_DeviceMine";
				distance = 4;
				condition = "alive AGM_Interaction_Target && {typeOf AGM_Interaction_Target == ""O_Truck_03_device_F""} && {isNil {(AGM_Interaction_Target getVariable ""mining"")} && {local AGM_Interaction_Target} && {AGM_Interaction_Target in life_vehicles} && {playerSide != west}";
				statement = "[AGM_Interaction_Target] spawn life_fnc_deviceMine";
				showDisabled = 0;
				priority = 1.6;
				// icon = "\A3\ui_f\data\igui\cfg\actions\gear_ca.paa";
			};
			class AGM_loadItemCarried
			{
				displayName = "$STR_AGM_Logistics_LoadItem";
				distance = 4;
				condition = "[AGM_Interaction_Target] call AGM_Logistics_fnc_canLoadItemCarried";
				statement = "[player getVariable 'AGM_carriedItem', AGM_Interaction_Target] call AGM_Logistics_fnc_openLoadUI";
				exceptions[] = {"AGM_Drag_isNotDragging"};
				showDisabled = 0;
				priority = 1.6;
				icon = "\A3\ui_f\data\igui\cfg\actions\gear_ca.paa";
			};
			class AGM_unloadBox
			{
				displayName = "$STR_AGM_Logistics_Unload";
				distance = 4;
				condition = "[AGM_Interaction_Target] call AGM_Logistics_fnc_hasLoadedItems && {alive AGM_Interaction_Target}";
				statement = "[AGM_Interaction_Target] call AGM_Logistics_fnc_openUnloadUI";
				showDisabled = 1;
				priority = 1.5;
				icon = "\A3\ui_f\data\igui\cfg\actions\gear_ca.paa";
			};
			class AGM_RefuelCargo
			{
				displayName = "$STR_AGM_Resupply_RefuelVehicleCargo";
				distance = 4;
				condition = "[AGM_Interaction_Target] call AGM_Resupply_fnc_canRefuelCargo";
				statement = "[AGM_Interaction_Target] call AGM_Resupply_fnc_refuelVehicleCargo";
				showDisabled = 0;
				priority = 1.225;
				icon = "\A3\ui_f\data\igui\cfg\actions\refuel_ca.paa";
			};
			class AGM_Refuel
			{
				displayName = "$STR_AGM_Resupply_RefuelVehicle";
				distance = 4;
				condition = "[player, AGM_Interaction_Target] call AGM_Resupply_fnc_canRefuel";
				statement = "[player, AGM_Interaction_Target] call AGM_Resupply_fnc_refuelVehicle";
				exceptions[] = {"AGM_Drag_isNotDragging"};
				showDisabled = 0;
				priority = 1.245;
				icon = "\A3\ui_f\data\igui\cfg\actions\refuel_ca.paa";
			};
			class AGM_DrainFuel
			{
				displayName = "$STR_AGM_Resupply_DrainFuel";
				distance = 4;
				condition = "[player, AGM_Interaction_Target] call AGM_Resupply_fnc_canDrainFuel";
				statement = "[player, AGM_Interaction_Target] call AGM_Resupply_fnc_drainFuel";
				exceptions[] = {"AGM_Drag_isNotDragging"};
				showDisabled = 0;
				priority = 1.235;
				icon = "\A3\ui_f\data\igui\cfg\actions\refuel_ca.paa";
			};
			class AGM_CheckFuel
			{
				displayName = "$STR_AGM_Resupply_CheckFuel";
				distance = 4;
				condition = "alive AGM_Interaction_Target && {speed AGM_Interaction_Target == 0}";
				statement = "[player, AGM_Interaction_Target] call AGM_Resupply_fnc_getFuelAmount";
				exceptions[] = {"AGM_Drag_isNotDragging"};
				showDisabled = 0;
				priority = 1.295;
				icon = "\A3\ui_f\data\igui\cfg\actions\refuel_ca.paa";
			};
		};
	};
	class Tank: LandVehicle
	{
		AGM_Vehicle_Cargo = 4;
		class AGM_Actions
		{
			class AGM_copRegistration
			{
				displayName = "$STR_vInAct_Registration";
				distance = 4;
				condition = "alive AGM_Interaction_Target && {speed AGM_Interaction_Target == 0} && {playerSide in [west,independent]}";
				statement = "[AGM_Interaction_Target] spawn life_fnc_searchVehAction";
				showDisabled = 0;
				priority = 1.6;
				// icon = "\A3\ui_f\data\igui\cfg\actions\gear_ca.paa";
			};
			class AGM_copPullout
			{
				displayName = "Sortir tt le monde";
				distance = 4;
				condition = "alive AGM_Interaction_Target && {speed AGM_Interaction_Target == 0} && {count crew AGM_Interaction_Target != 0} && {playerSide == west}";
				statement = "[AGM_Interaction_Target] spawn life_fnc_pulloutAction";
				showDisabled = 0;
				priority = 1.6;
				// icon = "\A3\ui_f\data\igui\cfg\actions\gear_ca.paa";
			};
			class AGM_Impound
			{
				displayName = "$STR_vInAct_Impound";
				distance = 4;
				condition = "alive AGM_Interaction_Target && {speed AGM_Interaction_Target == 0} && {playerSide in [west,independent]}";
				statement = "[AGM_Interaction_Target] spawn life_fnc_impoundAction";
				showDisabled = 0;
				priority = 1.6;
				// icon = "\A3\ui_f\data\igui\cfg\actions\gear_ca.paa";
			};
			class AGM_Unflip
			{
				displayName = "$STR_vInAct_Unflip";
				distance = 4;
				condition = "alive AGM_Interaction_Target && {speed AGM_Interaction_Target == 0} && {!(typeOf (AGM_Interaction_Target) in [""C_Kart_01_Blu_F"",""C_Kart_01_Red_F"",""C_Kart_01_Fuel_F"",""C_Kart_01_Vrana_F""])} && {canMove AGM_Interaction_Target} && {count crew AGM_Interaction_Target != 0}";
				statement = "AGM_Interaction_Target setPos [getPos AGM_Interaction_Target select 0, getPos AGM_Interaction_Target select 1, (getPos AGM_Interaction_Target select 2)+0.5]";
				showDisabled = 0;
				priority = 1.6;
				// icon = "\A3\ui_f\data\igui\cfg\actions\gear_ca.paa";
			};
			class AGM_loadItemCarried
			{
				displayName = "$STR_AGM_Logistics_LoadItem";
				distance = 4;
				condition = "[AGM_Interaction_Target] call AGM_Logistics_fnc_canLoadItemCarried";
				statement = "[player getVariable 'AGM_carriedItem', AGM_Interaction_Target] call AGM_Logistics_fnc_openLoadUI";
				exceptions[] = {"AGM_Drag_isNotDragging"};
				showDisabled = 0;
				priority = 1.6;
				icon = "\A3\ui_f\data\igui\cfg\actions\gear_ca.paa";
			};
			class AGM_unloadBox
			{
				displayName = "$STR_AGM_Logistics_Unload";
				distance = 4;
				condition = "[AGM_Interaction_Target] call AGM_Logistics_fnc_hasLoadedItems && {alive AGM_Interaction_Target}";
				statement = "[AGM_Interaction_Target] call AGM_Logistics_fnc_openUnloadUI";
				showDisabled = 1;
				priority = 1.5;
				icon = "\A3\ui_f\data\igui\cfg\actions\gear_ca.paa";
			};
			class AGM_RefuelCargo
			{
				displayName = "$STR_AGM_Resupply_RefuelVehicleCargo";
				distance = 4;
				condition = "[AGM_Interaction_Target] call AGM_Resupply_fnc_canRefuelCargo";
				statement = "[AGM_Interaction_Target] call AGM_Resupply_fnc_refuelVehicleCargo";
				showDisabled = 0;
				priority = 1.225;
				icon = "\A3\ui_f\data\igui\cfg\actions\refuel_ca.paa";
			};
			class AGM_Refuel
			{
				displayName = "$STR_AGM_Resupply_RefuelVehicle";
				distance = 4;
				condition = "[player, AGM_Interaction_Target] call AGM_Resupply_fnc_canRefuel";
				statement = "[player, AGM_Interaction_Target] call AGM_Resupply_fnc_refuelVehicle";
				exceptions[] = {"AGM_Drag_isNotDragging"};
				showDisabled = 0;
				priority = 1.245;
				icon = "\A3\ui_f\data\igui\cfg\actions\refuel_ca.paa";
			};
			class AGM_DrainFuel
			{
				displayName = "$STR_AGM_Resupply_DrainFuel";
				distance = 4;
				condition = "[player, AGM_Interaction_Target] call AGM_Resupply_fnc_canDrainFuel";
				statement = "[player, AGM_Interaction_Target] call AGM_Resupply_fnc_drainFuel";
				exceptions[] = {"AGM_Drag_isNotDragging"};
				showDisabled = 0;
				priority = 1.235;
				icon = "\A3\ui_f\data\igui\cfg\actions\refuel_ca.paa";
			};
			class AGM_CheckFuel
			{
				displayName = "$STR_AGM_Resupply_CheckFuel";
				distance = 4;
				condition = "alive AGM_Interaction_Target && {speed AGM_Interaction_Target == 0}";
				statement = "[player, AGM_Interaction_Target] call AGM_Resupply_fnc_getFuelAmount";
				exceptions[] = {"AGM_Drag_isNotDragging"};
				showDisabled = 0;
				priority = 1.295;
				icon = "\A3\ui_f\data\igui\cfg\actions\refuel_ca.paa";
			};
			class AGM_reloadMagazines
			{
				displayName = "$STR_AGM_Logistics_ReloadMagazines";
				distance = 4;
				condition = "count ([player, AGM_Interaction_Target] call AGM_Logistics_fnc_getLoadableMagazines) > 0";
				statement = "[AGM_Interaction_Target] call AGM_Logistics_fnc_openMagazineMenu";
				showDisabled = 1;
				priority = 1.45;
				icon = "\A3\ui_f\data\igui\cfg\actions\reammo_ca.paa";
			};
		};
	};
	class Car_F: Car
	{
		AGM_Wheels[] = {"HitLFWheel","HitRFWheel","HitLF2Wheel","HitRF2Wheel"};
		AGM_WheelsLocalized[] = {"STR_AGM_Repair_HitLFWheel","STR_AGM_Repair_HitRFWheel","STR_AGM_Repair_HitLBWheel","STR_AGM_Repair_HitRBWheel"};
		class HitPoints;
		AGM_fuelCapacity = 60;
		class AGM_Actions: AGM_Actions
		{
			class AGM_Repair
			{
				displayName = "$STR_AGM_Repair";
				distance = 4;
				condition = "alive AGM_Interaction_Target";
				statement = "";
				showDisabled = 1;
				priority = 1.4;
				icon = "\A3\ui_f\data\igui\cfg\actions\repair_ca.paa";
				subMenu[] = {"AGM_Repair",0};
				class AGM_Repair_checkVehicle
				{
					displayName = "$STR_AGM_Repair_checkVehicle";
					distance = 4;
					condition = "alive AGM_Interaction_Target";
					statement = "[AGM_Interaction_Target] call AGM_Repair_fnc_checkVehicle";
					showDisabled = 1;
					priority = 1;
					icon = "\A3\ui_f\data\igui\cfg\actions\repair_ca.paa";
				};
				class AGM_Repair_Wheels
				{
					displayName = "$STR_AGM_Repair_RepairWheel";
					distance = 4;
					condition = "[AGM_Interaction_Target, ['HitLFWheel', 'HitLBWheel', 'HitLMWheel', 'HitLF2Wheel', 'HitRFWheel', 'HitRBWheel', 'HitRMWheel', 'HitRF2Wheel']] call AGM_Repair_fnc_canRepairWheel";
					statement = "[AGM_Interaction_Target, ['HitLFWheel', 'HitLBWheel', 'HitLMWheel', 'HitLF2Wheel', 'HitRFWheel', 'HitRBWheel', 'HitRMWheel', 'HitRF2Wheel']] call AGM_Repair_fnc_openSelectWheelUI";
					showDisabled = 1;
					priority = 0.9;
					icon = "\A3\ui_f\data\igui\cfg\actions\repair_ca.paa";
				};
				class AGM_Remove_Wheels
				{
					displayName = "$STR_AGM_Repair_RemoveWheel";
					distance = 4;
					condition = "[AGM_Interaction_Target, ['HitLFWheel', 'HitLBWheel', 'HitLMWheel', 'HitLF2Wheel', 'HitRFWheel', 'HitRBWheel', 'HitRMWheel', 'HitRF2Wheel']] call AGM_Repair_fnc_canRemoveWheel";
					statement = "[AGM_Interaction_Target, ['HitLFWheel', 'HitLBWheel', 'HitLMWheel', 'HitLF2Wheel', 'HitRFWheel', 'HitRBWheel', 'HitRMWheel', 'HitRF2Wheel']] call AGM_Repair_fnc_openSelectWheelUI_Salvage";
					showDisabled = 1;
					priority = 0.8;
					icon = "\A3\ui_f\data\igui\cfg\actions\repair_ca.paa";
				};
				class AGM_Repair_Body
				{
					displayName = "$STR_AGM_Repair_HitBody";
					distance = 4;
					condition = "[AGM_Interaction_Target, 'HitBody'] call AGM_Repair_fnc_canRepair";
					statement = "[AGM_Interaction_Target, 'HitBody'] call AGM_Repair_fnc_repair";
					showDisabled = 0;
					priority = 0.5;
					icon = "\A3\ui_f\data\igui\cfg\actions\repair_ca.paa";
				};
				class AGM_Repair_Engine
				{
					displayName = "$STR_AGM_Repair_HitEngine";
					distance = 4;
					condition = "[AGM_Interaction_Target, 'HitEngine'] call AGM_Repair_fnc_canRepair";
					statement = "[AGM_Interaction_Target, 'HitEngine'] call AGM_Repair_fnc_repair";
					showDisabled = 0;
					priority = 0.4;
					icon = "\A3\ui_f\data\igui\cfg\actions\repair_ca.paa";
				};
				class AGM_Repair_Fuel
				{
					displayName = "$STR_AGM_Repair_HitFuel";
					distance = 4;
					condition = "[AGM_Interaction_Target, 'HitFuel'] call AGM_Repair_fnc_canRepair";
					statement = "[AGM_Interaction_Target, 'HitFuel'] call AGM_Repair_fnc_repair";
					showDisabled = 0;
					priority = 0.3;
					icon = "\A3\ui_f\data\igui\cfg\actions\repair_ca.paa";
				};
				class AGM_Repair_Gun
				{
					displayName = "$STR_AGM_Repair_HitGun";
					distance = 4;
					condition = "[AGM_Interaction_Target, 'HitGun'] call AGM_Repair_fnc_canRepair";
					statement = "[AGM_Interaction_Target, 'HitGun'] call AGM_Repair_fnc_repair";
					showDisabled = 0;
					priority = 0.2;
					icon = "\A3\ui_f\data\igui\cfg\actions\repair_ca.paa";
				};
				class AGM_Repair_Turret
				{
					displayName = "$STR_AGM_Repair_HitTurret";
					distance = 4;
					condition = "[AGM_Interaction_Target, 'HitTurret'] call AGM_Repair_fnc_canRepair";
					statement = "[AGM_Interaction_Target, 'HitTurret'] call AGM_Repair_fnc_repair";
					showDisabled = 0;
					priority = 0.1;
					icon = "\A3\ui_f\data\igui\cfg\actions\repair_ca.paa";
				};
			};
		};
	};
	class Kart_01_Base_F: Car_F
	{
		AGM_fuelCapacity = 4;
	};
	class MRAP_01_base_F: Car_F
	{
		AGM_fuelCapacity = 163;
	};
	class MRAP_02_base_F: Car_F
	{
		AGM_fuelCapacity = 200;
	};
	class MRAP_03_base_F: Car_F
	{
		AGM_fuelCapacity = 230;
	};
	class Quadbike_01_base_F: Car_F
	{
		AGM_fuelCapacity = 15;
	};
	class Offroad_01_base_f: Car_F
	{
		AGM_fuelCapacity = 80;
	};
	class Truck_F: Car_F
	{
		AGM_Vehicle_Cargo = 8;
		AGM_Wheels[] = {"HitLFWheel","HitRFWheel","HitLMWheel","HitRMWheel","HitLBWheel","HitRBWheel"};
		AGM_WheelsLocalized[] = {"STR_AGM_Repair_HitLFWheel","STR_AGM_Repair_HitRFWheel","STR_AGM_Repair_HitLMWheel","STR_AGM_Repair_HitRMWheel","STR_AGM_Repair_HitLBWheel","STR_AGM_Repair_HitRBWheel"};
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
		AGM_fuelCapacity = 240;
		class AGM_Actions;
	};
	class Wheeled_APC_F: Car_F
	{
		AGM_Wheels[] = {"HitLFWheel","HitRFWheel","HitLMWheel","HitRMWheel","HitLBWheel","HitRBWheel"};
		AGM_WheelsLocalized[] = {"STR_AGM_Repair_HitLFWheel","STR_AGM_Repair_HitRFWheel","STR_AGM_Repair_HitLMWheel","STR_AGM_Repair_HitRMWheel","STR_AGM_Repair_HitLBWheel","STR_AGM_Repair_HitRBWheel"};
		AGM_fuelCapacity = 600;
	};
	class Tank_F: Tank
	{
		AGM_fuelCapacity = 1500;
		class AGM_Actions: AGM_Actions
		{
			class AGM_Repair
			{
				displayName = "$STR_AGM_Repair";
				distance = 4;
				condition = "alive AGM_Interaction_Target";
				statement = "";
				showDisabled = 1;
				priority = 1.4;
				icon = "\A3\ui_f\data\igui\cfg\actions\repair_ca.paa";
				subMenu[] = {"AGM_Repair",0};
				class AGM_Repair_checkVehicle
				{
					displayName = "$STR_AGM_Repair_checkVehicle";
					distance = 4;
					condition = "alive AGM_Interaction_Target";
					statement = "[AGM_Interaction_Target] call AGM_Repair_fnc_checkVehicle";
					showDisabled = 1;
					priority = 1;
					icon = "\A3\ui_f\data\igui\cfg\actions\repair_ca.paa";
				};
				class AGM_Repair_Hull
				{
					displayName = "$STR_AGM_Repair_HitHull";
					distance = 4;
					condition = "[AGM_Interaction_Target, 'HitHull'] call AGM_Repair_fnc_canRepair";
					statement = "[AGM_Interaction_Target, 'HitHull'] call AGM_Repair_fnc_repair";
					showDisabled = 0;
					priority = 0.5;
					icon = "\A3\ui_f\data\igui\cfg\actions\repair_ca.paa";
				};
				class AGM_Repair_LTrack
				{
					displayName = "$STR_AGM_Repair_HitLTrack";
					distance = 4;
					condition = "[AGM_Interaction_Target, 'HitLTrack'] call AGM_Repair_fnc_canRepairTrack";
					statement = "[AGM_Interaction_Target, 'HitLTrack'] call AGM_Repair_fnc_repairTrack";
					showDisabled = 0;
					priority = 0.42;
					icon = "\A3\ui_f\data\igui\cfg\actions\repair_ca.paa";
				};
				class AGM_Repair_RTrack
				{
					displayName = "$STR_AGM_Repair_HitRTrack";
					distance = 4;
					condition = "[AGM_Interaction_Target, 'HitRTrack'] call AGM_Repair_fnc_canRepairTrack";
					statement = "[AGM_Interaction_Target, 'HitRTrack'] call AGM_Repair_fnc_repairTrack";
					showDisabled = 0;
					priority = 0.41;
					icon = "\A3\ui_f\data\igui\cfg\actions\repair_ca.paa";
				};
				class AGM_Repair_Engine
				{
					displayName = "$STR_AGM_Repair_HitEngine";
					distance = 4;
					condition = "[AGM_Interaction_Target, 'HitEngine'] call AGM_Repair_fnc_canRepair";
					statement = "[AGM_Interaction_Target, 'HitEngine'] call AGM_Repair_fnc_repair";
					showDisabled = 0;
					priority = 0.4;
					icon = "\A3\ui_f\data\igui\cfg\actions\repair_ca.paa";
				};
				class AGM_Repair_Gun
				{
					displayName = "$STR_AGM_Repair_HitGun";
					distance = 4;
					condition = "[AGM_Interaction_Target, 'HitGun'] call AGM_Repair_fnc_canRepair";
					statement = "[AGM_Interaction_Target, 'HitGun'] call AGM_Repair_fnc_repair";
					showDisabled = 0;
					priority = 0.2;
					icon = "\A3\ui_f\data\igui\cfg\actions\repair_ca.paa";
				};
				class AGM_Repair_Turret
				{
					displayName = "$STR_AGM_Repair_HitTurret";
					distance = 4;
					condition = "[AGM_Interaction_Target, 'HitTurret'] call AGM_Repair_fnc_canRepair";
					statement = "[AGM_Interaction_Target, 'HitTurret'] call AGM_Repair_fnc_repair";
					showDisabled = 0;
					priority = 0.1;
					icon = "\A3\ui_f\data\igui\cfg\actions\repair_ca.paa";
				};
			};
		};
	};
	class MBT_01_base_F: Tank_F
	{
		AGM_fuelCapacity = 1400;
	};
	class MBT_02_base_F: Tank_F
	{
		AGM_fuelCapacity = 1600;
	};
	class MBT_03_base_F: Tank_F
	{
		AGM_fuelCapacity = 1200;
	};
	class Air;
	class Helicopter: Air
	{
		AGM_Paradrop = 0;
		AGM_fuelCapacity = 240;
		AGM_Vehicle_Cargo = 8;
		class AGM_Actions
		{
			class AGM_copRegistration
			{
				displayName = "$STR_vInAct_Registration";
				distance = 4;
				condition = "alive AGM_Interaction_Target && {speed AGM_Interaction_Target == 0} && {playerSide in [west,independent]}";
				statement = "[AGM_Interaction_Target] spawn life_fnc_searchVehAction";
				showDisabled = 0;
				priority = 1.6;
				// icon = "\A3\ui_f\data\igui\cfg\actions\gear_ca.paa";
			};
			class AGM_copPullout
			{
				displayName = "Sortir tt le monde";
				distance = 4;
				condition = "alive AGM_Interaction_Target && {speed AGM_Interaction_Target == 0} && {count crew AGM_Interaction_Target != 0} && {playerSide == west}";
				statement = "[AGM_Interaction_Target] spawn life_fnc_pulloutAction";
				showDisabled = 0;
				priority = 1.6;
				// icon = "\A3\ui_f\data\igui\cfg\actions\gear_ca.paa";
			};
			class AGM_Impound
			{
				displayName = "$STR_vInAct_Impound";
				distance = 4;
				condition = "alive AGM_Interaction_Target && {speed AGM_Interaction_Target == 0} && {playerSide in [west,independent]}";
				statement = "[AGM_Interaction_Target] spawn life_fnc_impoundAction";
				showDisabled = 0;
				priority = 1.6;
				// icon = "\A3\ui_f\data\igui\cfg\actions\gear_ca.paa";
			};
			class AGM_Unflip
			{
				displayName = "$STR_vInAct_Unflip";
				distance = 4;
				condition = "alive AGM_Interaction_Target && {speed AGM_Interaction_Target == 0} && {!(typeOf (AGM_Interaction_Target) in [""C_Kart_01_Blu_F"",""C_Kart_01_Red_F"",""C_Kart_01_Fuel_F"",""C_Kart_01_Vrana_F""])} && {canMove AGM_Interaction_Target} && {count crew AGM_Interaction_Target != 0}";
				statement = "AGM_Interaction_Target setPos [getPos AGM_Interaction_Target select 0, getPos AGM_Interaction_Target select 1, (getPos AGM_Interaction_Target select 2)+0.5]";
				showDisabled = 0;
				priority = 1.6;
				// icon = "\A3\ui_f\data\igui\cfg\actions\gear_ca.paa";
			};
			class AGM_loadItemCarried
			{
				displayName = "$STR_AGM_Logistics_LoadItem";
				distance = 4;
				condition = "[AGM_Interaction_Target] call AGM_Logistics_fnc_canLoadItemCarried";
				statement = "[player getVariable 'AGM_carriedItem', AGM_Interaction_Target] call AGM_Logistics_fnc_openLoadUI";
				exceptions[] = {"AGM_Drag_isNotDragging"};
				showDisabled = 0;
				priority = 1.6;
				icon = "\A3\ui_f\data\igui\cfg\actions\gear_ca.paa";
			};
			class AGM_unloadBox
			{
				displayName = "$STR_AGM_Logistics_Unload";
				distance = 4;
				condition = "[AGM_Interaction_Target] call AGM_Logistics_fnc_hasLoadedItems && {alive AGM_Interaction_Target}";
				statement = "[AGM_Interaction_Target] call AGM_Logistics_fnc_openUnloadUI";
				showDisabled = 1;
				priority = 1.5;
				icon = "\A3\ui_f\data\igui\cfg\actions\gear_ca.paa";
			};
			class AGM_RefuelCargo
			{
				displayName = "$STR_AGM_Resupply_RefuelVehicleCargo";
				distance = 4;
				condition = "[AGM_Interaction_Target] call AGM_Resupply_fnc_canRefuelCargo";
				statement = "[AGM_Interaction_Target] call AGM_Resupply_fnc_refuelVehicleCargo";
				showDisabled = 0;
				priority = 1.225;
				icon = "\A3\ui_f\data\igui\cfg\actions\refuel_ca.paa";
			};
			class AGM_Refuel
			{
				displayName = "$STR_AGM_Resupply_RefuelVehicle";
				distance = 4;
				condition = "[player, AGM_Interaction_Target] call AGM_Resupply_fnc_canRefuel";
				statement = "[player, AGM_Interaction_Target] call AGM_Resupply_fnc_refuelVehicle";
				exceptions[] = {"AGM_Drag_isNotDragging"};
				showDisabled = 0;
				priority = 1.245;
				icon = "\A3\ui_f\data\igui\cfg\actions\refuel_ca.paa";
			};
			class AGM_DrainFuel
			{
				displayName = "$STR_AGM_Resupply_DrainFuel";
				distance = 4;
				condition = "[player, AGM_Interaction_Target] call AGM_Resupply_fnc_canDrainFuel";
				statement = "[player, AGM_Interaction_Target] call AGM_Resupply_fnc_drainFuel";
				exceptions[] = {"AGM_Drag_isNotDragging"};
				showDisabled = 0;
				priority = 1.235;
				icon = "\A3\ui_f\data\igui\cfg\actions\refuel_ca.paa";
			};
			class AGM_CheckFuel
			{
				displayName = "$STR_AGM_Resupply_CheckFuel";
				distance = 4;
				condition = "alive AGM_Interaction_Target && {speed AGM_Interaction_Target == 0}";
				statement = "[player, AGM_Interaction_Target] call AGM_Resupply_fnc_getFuelAmount";
				exceptions[] = {"AGM_Drag_isNotDragging"};
				showDisabled = 0;
				priority = 1.295;
				icon = "\A3\ui_f\data\igui\cfg\actions\refuel_ca.paa";
			};
			class AGM_reloadMagazines
			{
				displayName = "$STR_AGM_Logistics_ReloadMagazines";
				distance = 4;
				condition = "count ([player, AGM_Interaction_Target] call AGM_Logistics_fnc_getLoadableMagazines) > 0";
				statement = "[AGM_Interaction_Target] call AGM_Logistics_fnc_openMagazineMenu";
				showDisabled = 1;
				priority = 1.45;
				icon = "\A3\ui_f\data\igui\cfg\actions\reammo_ca.paa";
			};
			class AGM_Repair
			{
				displayName = "$STR_AGM_Repair";
				distance = 4;
				condition = "alive AGM_Interaction_Target";
				statement = "";
				showDisabled = 1;
				priority = 1.4;
				icon = "\A3\ui_f\data\igui\cfg\actions\repair_ca.paa";
				subMenu[] = {"AGM_Repair",0};
				class AGM_Repair_checkVehicle
				{
					displayName = "$STR_AGM_Repair_checkVehicle";
					distance = 4;
					condition = "alive AGM_Interaction_Target";
					statement = "[AGM_Interaction_Target] call AGM_Repair_fnc_checkVehicle";
					showDisabled = 1;
					priority = 1;
					icon = "\A3\ui_f\data\igui\cfg\actions\repair_ca.paa";
				};
				class AGM_Repair_Body
				{
					displayName = "$STR_AGM_Repair_HitHull";
					distance = 4;
					condition = "[AGM_Interaction_Target, 'HitHull'] call AGM_Repair_fnc_canRepair";
					statement = "[AGM_Interaction_Target, 'HitHull'] call AGM_Repair_fnc_repair";
					showDisabled = 0;
					priority = 0.5;
					icon = "\A3\ui_f\data\igui\cfg\actions\repair_ca.paa";
				};
				class AGM_Repair_Engine
				{
					displayName = "$STR_AGM_Repair_HitEngine";
					distance = 4;
					condition = "[AGM_Interaction_Target, 'HitEngine'] call AGM_Repair_fnc_canRepair";
					statement = "[AGM_Interaction_Target, 'HitEngine'] call AGM_Repair_fnc_repair";
					showDisabled = 0;
					priority = 0.4;
					icon = "\A3\ui_f\data\igui\cfg\actions\repair_ca.paa";
				};
				class AGM_Repair_Fuel
				{
					displayName = "$STR_AGM_Repair_HitFuel";
					distance = 4;
					condition = "[AGM_Interaction_Target, 'HitFuel'] call AGM_Repair_fnc_canRepair";
					statement = "[AGM_Interaction_Target, 'HitFuel'] call AGM_Repair_fnc_repair";
					showDisabled = 0;
					priority = 0.3;
					icon = "\A3\ui_f\data\igui\cfg\actions\repair_ca.paa";
				};
				class AGM_Repair_Avionics
				{
					displayName = "$STR_AGM_Repair_HitAvionics";
					distance = 4;
					condition = "[AGM_Interaction_Target, 'HitAvionics'] call AGM_Repair_fnc_canRepair";
					statement = "[AGM_Interaction_Target, 'HitAvionics'] call AGM_Repair_fnc_repair";
					showDisabled = 0;
					priority = 0.2;
					icon = "\A3\ui_f\data\igui\cfg\actions\repair_ca.paa";
				};
				class AGM_Repair_HRotor
				{
					displayName = "$STR_AGM_Repair_HitHRotor";
					distance = 4;
					condition = "[AGM_Interaction_Target, 'HitHRotor'] call AGM_Repair_fnc_canRepair";
					statement = "[AGM_Interaction_Target, 'HitHRotor'] call AGM_Repair_fnc_repair";
					showDisabled = 0;
					priority = 0.15;
					icon = "\A3\ui_f\data\igui\cfg\actions\repair_ca.paa";
				};
				class AGM_Repair_VRotor
				{
					displayName = "$STR_AGM_Repair_HitVRotor";
					distance = 4;
					condition = "[AGM_Interaction_Target, 'HitVRotor'] call AGM_Repair_fnc_canRepair";
					statement = "[AGM_Interaction_Target, 'HitVRotor'] call AGM_Repair_fnc_repair";
					showDisabled = 0;
					priority = 0.1;
					icon = "\A3\ui_f\data\igui\cfg\actions\repair_ca.paa";
				};
			};
		};
		class AGM_SelfActions
		{
			class AGM_DropCargo
			{
				displayName = "$STR_AGM_Paradrop_Unload";
				distance = 4;
				condition = "getNumber(configFile >> 'CfgVehicles' >> typeOf vehicle player >> 'AGM_Paradrop') == 1 && {getPosATL vehicle player select 2 > 60} && {count (vehicle player getVariable ['AGM_Logistics_loadedItems', []]) > 0}";
				conditionShow = "getNumber(configFile >> 'CfgVehicles' >> typeOf vehicle player >> 'AGM_Paradrop') == 1";
				statement = "[vehicle player] call AGM_Paradrop_fnc_paradrop";
				priority = 1;
				enableInside = 1;
			};
		};
	};
	class Heli_Transport_02_base_F;
	class I_Heli_Transport_02_F: Heli_Transport_02_base_F
	{
		AGM_Vehicle_Cargo = 20;
		AGM_Paradrop = 1;
	};
	class Plane: Air
	{
		AGM_Paradrop = 0;
		AGM_fuelCapacity = 600;
		AGM_Vehicle_Cargo = 4;
		class AGM_Actions
		{
			class AGM_copRegistration
			{
				displayName = "$STR_vInAct_Registration";
				distance = 4;
				condition = "alive AGM_Interaction_Target && {speed AGM_Interaction_Target == 0} && {playerSide in [west,independent]}";
				statement = "[AGM_Interaction_Target] spawn life_fnc_searchVehAction";
				showDisabled = 0;
				priority = 1.6;
				// icon = "\A3\ui_f\data\igui\cfg\actions\gear_ca.paa";
			};
			class AGM_copPullout
			{
				displayName = "Sortir tt le monde";
				distance = 4;
				condition = "alive AGM_Interaction_Target && {speed AGM_Interaction_Target == 0} && {count crew AGM_Interaction_Target != 0} && {playerSide == west}";
				statement = "[AGM_Interaction_Target] spawn life_fnc_pulloutAction";
				showDisabled = 0;
				priority = 1.6;
				// icon = "\A3\ui_f\data\igui\cfg\actions\gear_ca.paa";
			};
			class AGM_Impound
			{
				displayName = "$STR_vInAct_Impound";
				distance = 4;
				condition = "alive AGM_Interaction_Target && {speed AGM_Interaction_Target == 0} && {playerSide in [west,independent]}";
				statement = "[AGM_Interaction_Target] spawn life_fnc_impoundAction";
				showDisabled = 0;
				priority = 1.6;
				// icon = "\A3\ui_f\data\igui\cfg\actions\gear_ca.paa";
			};
			class AGM_Unflip
			{
				displayName = "$STR_vInAct_Unflip";
				distance = 4;
				condition = "alive AGM_Interaction_Target && {speed AGM_Interaction_Target == 0} && {!(typeOf (AGM_Interaction_Target) in [""C_Kart_01_Blu_F"",""C_Kart_01_Red_F"",""C_Kart_01_Fuel_F"",""C_Kart_01_Vrana_F""])} && {canMove AGM_Interaction_Target} && {count crew AGM_Interaction_Target != 0}";
				statement = "AGM_Interaction_Target setPos [getPos AGM_Interaction_Target select 0, getPos AGM_Interaction_Target select 1, (getPos AGM_Interaction_Target select 2)+0.5]";
				showDisabled = 0;
				priority = 1.6;
				// icon = "\A3\ui_f\data\igui\cfg\actions\gear_ca.paa";
			};
			class AGM_loadItemCarried
			{
				displayName = "$STR_AGM_Logistics_LoadItem";
				distance = 4;
				condition = "[AGM_Interaction_Target] call AGM_Logistics_fnc_canLoadItemCarried";
				statement = "[player getVariable 'AGM_carriedItem', AGM_Interaction_Target] call AGM_Logistics_fnc_openLoadUI";
				exceptions[] = {"AGM_Drag_isNotDragging"};
				showDisabled = 0;
				priority = 1.6;
				icon = "\A3\ui_f\data\igui\cfg\actions\gear_ca.paa";
			};
			class AGM_unloadBox
			{
				displayName = "$STR_AGM_Logistics_Unload";
				distance = 4;
				condition = "[AGM_Interaction_Target] call AGM_Logistics_fnc_hasLoadedItems && {alive AGM_Interaction_Target}";
				statement = "[AGM_Interaction_Target] call AGM_Logistics_fnc_openUnloadUI";
				showDisabled = 1;
				priority = 1.5;
				icon = "\A3\ui_f\data\igui\cfg\actions\gear_ca.paa";
			};
			class AGM_RefuelCargo
			{
				displayName = "$STR_AGM_Resupply_RefuelVehicleCargo";
				distance = 4;
				condition = "[AGM_Interaction_Target] call AGM_Resupply_fnc_canRefuelCargo";
				statement = "[AGM_Interaction_Target] call AGM_Resupply_fnc_refuelVehicleCargo";
				showDisabled = 0;
				priority = 1.225;
				icon = "\A3\ui_f\data\igui\cfg\actions\refuel_ca.paa";
			};
			class AGM_Refuel
			{
				displayName = "$STR_AGM_Resupply_RefuelVehicle";
				distance = 4;
				condition = "[player, AGM_Interaction_Target] call AGM_Resupply_fnc_canRefuel";
				statement = "[player, AGM_Interaction_Target] call AGM_Resupply_fnc_refuelVehicle";
				exceptions[] = {"AGM_Drag_isNotDragging"};
				showDisabled = 0;
				priority = 1.245;
				icon = "\A3\ui_f\data\igui\cfg\actions\refuel_ca.paa";
			};
			class AGM_DrainFuel
			{
				displayName = "$STR_AGM_Resupply_DrainFuel";
				distance = 4;
				condition = "[player, AGM_Interaction_Target] call AGM_Resupply_fnc_canDrainFuel";
				statement = "[player, AGM_Interaction_Target] call AGM_Resupply_fnc_drainFuel";
				exceptions[] = {"AGM_Drag_isNotDragging"};
				showDisabled = 0;
				priority = 1.235;
				icon = "\A3\ui_f\data\igui\cfg\actions\refuel_ca.paa";
			};
			class AGM_CheckFuel
			{
				displayName = "$STR_AGM_Resupply_CheckFuel";
				distance = 4;
				condition = "alive AGM_Interaction_Target && {speed AGM_Interaction_Target == 0}";
				statement = "[player, AGM_Interaction_Target] call AGM_Resupply_fnc_getFuelAmount";
				exceptions[] = {"AGM_Drag_isNotDragging"};
				showDisabled = 0;
				priority = 1.295;
				icon = "\A3\ui_f\data\igui\cfg\actions\refuel_ca.paa";
			};
			class AGM_reloadMagazines
			{
				displayName = "$STR_AGM_Logistics_ReloadMagazines";
				distance = 4;
				condition = "count ([player, AGM_Interaction_Target] call AGM_Logistics_fnc_getLoadableMagazines) > 0";
				statement = "[AGM_Interaction_Target] call AGM_Logistics_fnc_openMagazineMenu";
				showDisabled = 1;
				priority = 1.45;
				icon = "\A3\ui_f\data\igui\cfg\actions\reammo_ca.paa";
			};
			class AGM_Repair
			{
				displayName = "$STR_AGM_Repair";
				distance = 4;
				condition = "alive AGM_Interaction_Target";
				statement = "";
				showDisabled = 1;
				priority = 1.4;
				icon = "\A3\ui_f\data\igui\cfg\actions\repair_ca.paa";
				subMenu[] = {"AGM_Repair",0};
				class AGM_Repair_checkVehicle
				{
					displayName = "$STR_AGM_Repair_checkVehicle";
					distance = 4;
					condition = "alive AGM_Interaction_Target";
					statement = "[AGM_Interaction_Target] call AGM_Repair_fnc_checkVehicle";
					showDisabled = 1;
					priority = 1;
					icon = "\A3\ui_f\data\igui\cfg\actions\repair_ca.paa";
				};
				class AGM_Repair_Body
				{
					displayName = "$STR_AGM_Repair_HitHull";
					distance = 4;
					condition = "[AGM_Interaction_Target, 'HitHull'] call AGM_Repair_fnc_canRepair";
					statement = "[AGM_Interaction_Target, 'HitHull'] call AGM_Repair_fnc_repair";
					showDisabled = 0;
					priority = 0.5;
					icon = "\A3\ui_f\data\igui\cfg\actions\repair_ca.paa";
				};
			};
		};
	};
	class Ship;
	class Ship_F: Ship
	{
		AGM_fuelCapacity = 40;
		AGM_Vehicle_Cargo = 4;
		class AGM_Actions
		{
			class AGM_copRegistration
			{
				displayName = "$STR_vInAct_Registration";
				distance = 4;
				condition = "alive AGM_Interaction_Target && {speed AGM_Interaction_Target == 0} && {playerSide in [west,independent]}";
				statement = "[AGM_Interaction_Target] spawn life_fnc_searchVehAction";
				showDisabled = 0;
				priority = 1.6;
				// icon = "\A3\ui_f\data\igui\cfg\actions\gear_ca.paa";
			};
			class AGM_copPullout
			{
				displayName = "Sortir tt le monde";
				distance = 4;
				condition = "alive AGM_Interaction_Target && {speed AGM_Interaction_Target == 0} && {count crew AGM_Interaction_Target != 0} && {playerSide == west}";
				statement = "[AGM_Interaction_Target] spawn life_fnc_pulloutAction";
				showDisabled = 0;
				priority = 1.6;
				// icon = "\A3\ui_f\data\igui\cfg\actions\gear_ca.paa";
			};
			class AGM_Impound
			{
				displayName = "$STR_vInAct_Impound";
				distance = 4;
				condition = "alive AGM_Interaction_Target && {speed AGM_Interaction_Target == 0} && {playerSide in [west,independent]}";
				statement = "[AGM_Interaction_Target] spawn life_fnc_impoundAction";
				showDisabled = 0;
				priority = 1.6;
				// icon = "\A3\ui_f\data\igui\cfg\actions\gear_ca.paa";
			};
			class AGM_Pushboat
			{
				displayName = "$STR_vInAct_PushBoat";
				distance = 4;
				condition = "alive AGM_Interaction_Target && {speed AGM_Interaction_Target == 0} && {AGM_Interaction_Target isKindOf ""Ship""} && {local AGM_Interaction_Target} && {count crew AGM_Interaction_Target != 0}";
				statement = "[AGM_Interaction_Target] spawn [] spawn life_fnc_pushObject";
				showDisabled = 0;
				priority = 1.6;
				// icon = "\A3\ui_f\data\igui\cfg\actions\gear_ca.paa";
			};
			class AGM_loadItemCarried
			{
				displayName = "$STR_AGM_Logistics_LoadItem";
				distance = 4;
				condition = "[AGM_Interaction_Target] call AGM_Logistics_fnc_canLoadItemCarried";
				statement = "[player getVariable 'AGM_carriedItem', AGM_Interaction_Target] call AGM_Logistics_fnc_openLoadUI";
				exceptions[] = {"AGM_Drag_isNotDragging"};
				showDisabled = 0;
				priority = 1.6;
				icon = "\A3\ui_f\data\igui\cfg\actions\gear_ca.paa";
			};
			class AGM_unloadBox
			{
				displayName = "$STR_AGM_Logistics_Unload";
				distance = 4;
				condition = "[AGM_Interaction_Target] call AGM_Logistics_fnc_hasLoadedItems && {alive AGM_Interaction_Target}";
				statement = "[AGM_Interaction_Target] call AGM_Logistics_fnc_openUnloadUI";
				showDisabled = 1;
				priority = 1.5;
				icon = "\A3\ui_f\data\igui\cfg\actions\gear_ca.paa";
			};
			class AGM_RefuelCargo
			{
				displayName = "$STR_AGM_Resupply_RefuelVehicleCargo";
				distance = 4;
				condition = "[AGM_Interaction_Target] call AGM_Resupply_fnc_canRefuelCargo";
				statement = "[AGM_Interaction_Target] call AGM_Resupply_fnc_refuelVehicleCargo";
				showDisabled = 0;
				priority = 1.225;
				icon = "\A3\ui_f\data\igui\cfg\actions\refuel_ca.paa";
			};
			class AGM_Refuel
			{
				displayName = "$STR_AGM_Resupply_RefuelVehicle";
				distance = 4;
				condition = "[player, AGM_Interaction_Target] call AGM_Resupply_fnc_canRefuel";
				statement = "[player, AGM_Interaction_Target] call AGM_Resupply_fnc_refuelVehicle";
				exceptions[] = {"AGM_Drag_isNotDragging"};
				showDisabled = 0;
				priority = 1.245;
				icon = "\A3\ui_f\data\igui\cfg\actions\refuel_ca.paa";
			};
			class AGM_DrainFuel
			{
				displayName = "$STR_AGM_Resupply_DrainFuel";
				distance = 4;
				condition = "[player, AGM_Interaction_Target] call AGM_Resupply_fnc_canDrainFuel";
				statement = "[player, AGM_Interaction_Target] call AGM_Resupply_fnc_drainFuel";
				exceptions[] = {"AGM_Drag_isNotDragging"};
				showDisabled = 0;
				priority = 1.235;
				icon = "\A3\ui_f\data\igui\cfg\actions\refuel_ca.paa";
			};
			class AGM_CheckFuel
			{
				displayName = "$STR_AGM_Resupply_CheckFuel";
				distance = 4;
				condition = "alive AGM_Interaction_Target && {speed AGM_Interaction_Target == 0}";
				statement = "[player, AGM_Interaction_Target] call AGM_Resupply_fnc_getFuelAmount";
				exceptions[] = {"AGM_Drag_isNotDragging"};
				showDisabled = 0;
				priority = 1.295;
				icon = "\A3\ui_f\data\igui\cfg\actions\refuel_ca.paa";
			};
			class AGM_Repair
			{
				displayName = "$STR_AGM_Repair";
				distance = 4;
				condition = "alive AGM_Interaction_Target";
				statement = "";
				showDisabled = 1;
				priority = 1.4;
				icon = "\A3\ui_f\data\igui\cfg\actions\repair_ca.paa";
				subMenu[] = {"AGM_Repair",0};
				class AGM_Repair_checkVehicle
				{
					displayName = "$STR_AGM_Repair_checkVehicle";
					distance = 4;
					condition = "alive AGM_Interaction_Target";
					statement = "[AGM_Interaction_Target] call AGM_Repair_fnc_checkVehicle";
					showDisabled = 1;
					priority = 1;
					icon = "\A3\ui_f\data\igui\cfg\actions\repair_ca.paa";
				};
				class AGM_Repair_Body
				{
					displayName = "$STR_AGM_Repair_HitHull";
					distance = 4;
					condition = "[AGM_Interaction_Target, 'HitHull'] call AGM_Repair_fnc_canRepair";
					statement = "[AGM_Interaction_Target, 'HitHull'] call AGM_Repair_fnc_repair";
					showDisabled = 0;
					priority = 0.5;
					icon = "\A3\ui_f\data\igui\cfg\actions\repair_ca.paa";
				};
				class AGM_Repair_Engine
				{
					displayName = "$STR_AGM_Repair_HitEngine";
					distance = 4;
					condition = "[AGM_Interaction_Target, 'HitEngine'] call AGM_Repair_fnc_canRepair";
					statement = "[AGM_Interaction_Target, 'HitEngine'] call AGM_Repair_fnc_repair";
					showDisabled = 0;
					priority = 0.4;
					icon = "\A3\ui_f\data\igui\cfg\actions\repair_ca.paa";
				};
				class AGM_Repair_Fuel
				{
					displayName = "$STR_AGM_Repair_HitFuel";
					distance = 4;
					condition = "[AGM_Interaction_Target, 'HitFuel'] call AGM_Repair_fnc_canRepair";
					statement = "[AGM_Interaction_Target, 'HitFuel'] call AGM_Repair_fnc_repair";
					showDisabled = 0;
					priority = 0.3;
					icon = "\A3\ui_f\data\igui\cfg\actions\repair_ca.paa";
				};
			};
		};
	};
	class StaticWeapon: LandVehicle
	{
		AGM_Size = 2;
		class AGM_Actions
		{
			class AGM_DragItem
			{
				displayName = "$STR_AGM_Drag_StartDrag";
				distance = 4;
				condition = "!(player call AGM_Drag_fnc_isDraggingObject)";
				conditionShow = "[AGM_Interaction_Target, player] call AGM_Drag_fnc_isDraggable";
				statement = "[AGM_Interaction_Target, player] call AGM_Drag_fnc_dragObject";
				showDisabled = 0;
				priority = 3;
				icon = "\A3\ui_f\data\igui\cfg\actions\gear_ca.paa";
				hotkey = "R";
			};
			class AGM_GetIn
			{
				displayName = "$STR_AGM_StaticWeapons_GetIn";
				distance = 4;
				condition = "[AGM_Interaction_Target] call AGM_StaticWeapons_fnc_canGetIn";
				statement = "[AGM_Interaction_Target] call AGM_StaticWeapons_fnc_getIn";
				showDisabled = 0;
				priority = 1;
			};
			class AGM_RotateClockwise
			{
				displayName = "$STR_AGM_StaticWeapons_RotateClockwise";
				distance = 4;
				condition = "[AGM_Interaction_Target, true] call AGM_StaticWeapons_fnc_canRotate";
				statement = "[AGM_Interaction_Target, true] call AGM_StaticWeapons_fnc_rotate";
				showDisabled = 1;
				priority = 2.1;
				icon = "AGM_Logistics\ui\rotate_cw_ca.paa";
			};
			class AGM_RotateCounterclockwise
			{
				displayName = "$STR_AGM_StaticWeapons_RotateCounterclockwise";
				distance = 4;
				condition = "[AGM_Interaction_Target, false] call AGM_StaticWeapons_fnc_canRotate";
				statement = "[AGM_Interaction_Target, false] call AGM_StaticWeapons_fnc_rotate";
				showDisabled = 1;
				priority = 2;
				icon = "AGM_Logistics\ui\rotate_ccw_ca.paa";
			};
			class AGM_loadItem
			{
				displayName = "$STR_AGM_Logistics_LoadItem";
				distance = 4;
				condition = "[AGM_Interaction_Target] call AGM_Logistics_fnc_canLoadItem";
				statement = "[AGM_Interaction_Target, AGM_Logistics_targetVehicle] call AGM_Logistics_fnc_openLoadUI";
				showDisabled = 1;
				priority = 1.6;
				icon = "\A3\ui_f\data\igui\cfg\actions\gear_ca.paa";
			};
		};
	};
	class StaticMortar;
	class Mortar_01_base_F: StaticMortar
	{
		AGM_Size = 2;
		class AGM_Actions
		{
			class AGM_DragItem
			{
				displayName = "$STR_AGM_Drag_StartDrag";
				distance = 4;
				condition = "!(player call AGM_Drag_fnc_isDraggingObject)";
				conditionShow = "[AGM_Interaction_Target, player] call AGM_Drag_fnc_isDraggable";
				statement = "[AGM_Interaction_Target, player] call AGM_Drag_fnc_dragObject";
				showDisabled = 0;
				priority = 3;
				icon = "\A3\ui_f\data\igui\cfg\actions\gear_ca.paa";
				hotkey = "R";
			};
			class AGM_GetIn
			{
				displayName = "$STR_AGM_StaticWeapons_GetIn";
				distance = 4;
				condition = "[AGM_Interaction_Target] call AGM_StaticWeapons_fnc_canGetIn";
				statement = "[AGM_Interaction_Target] call AGM_StaticWeapons_fnc_getIn";
				showDisabled = 0;
				priority = 1;
			};
			class AGM_RotateClockwise
			{
				displayName = "$STR_AGM_StaticWeapons_RotateClockwise";
				distance = 4;
				condition = "[AGM_Interaction_Target, true] call AGM_StaticWeapons_fnc_canRotate";
				statement = "[AGM_Interaction_Target, true] call AGM_StaticWeapons_fnc_rotate";
				showDisabled = 1;
				priority = 2.1;
				icon = "AGM_Logistics\ui\rotate_cw_ca.paa";
			};
			class AGM_RotateCounterclockwise
			{
				displayName = "$STR_AGM_StaticWeapons_RotateCounterclockwise";
				distance = 4;
				condition = "[AGM_Interaction_Target, false] call AGM_StaticWeapons_fnc_canRotate";
				statement = "[AGM_Interaction_Target, false] call AGM_StaticWeapons_fnc_rotate";
				showDisabled = 1;
				priority = 2;
				icon = "AGM_Logistics\ui\rotate_ccw_ca.paa";
			};
			class AGM_loadItem
			{
				displayName = "$STR_AGM_Logistics_LoadItem";
				distance = 4;
				condition = "[AGM_Interaction_Target] call AGM_Logistics_fnc_canLoadItem";
				statement = "[AGM_Interaction_Target, AGM_Logistics_targetVehicle] call AGM_Logistics_fnc_openLoadUI";
				showDisabled = 1;
				priority = 1.6;
				icon = "\A3\ui_f\data\igui\cfg\actions\gear_ca.paa";
			};
		};
	};
	class ThingX;
	class ReammoBox_F: ThingX
	{
		AGM_Size = 2;
		AGM_CarryPosition[] = {0,1,1};
		class AGM_Actions
		{
			class AGM_loadItem
			{
				displayName = "$STR_AGM_Logistics_LoadItem";
				distance = 4;
				condition = "[AGM_Interaction_Target] call AGM_Logistics_fnc_canLoadItem";
				statement = "[AGM_Interaction_Target, AGM_Logistics_targetVehicle] call AGM_Logistics_fnc_openLoadUI";
				showDisabled = 1;
				priority = 1.6;
				icon = "\A3\ui_f\data\igui\cfg\actions\gear_ca.paa";
			};
		};
	};
	class EAST_Box_Base: ReammoBox_F
	{
		class AGM_Actions: AGM_Actions
		{
			class AGM_DragItem
			{
				displayName = "$STR_AGM_Drag_StartDrag";
				distance = 4;
				condition = "!(player call AGM_Drag_fnc_isDraggingObject)";
				conditionShow = "[AGM_Interaction_Target, player] call AGM_Drag_fnc_isDraggable";
				statement = "[AGM_Interaction_Target, player] call AGM_Drag_fnc_dragObject";
				showDisabled = 0;
				priority = 3;
				icon = "\A3\ui_f\data\igui\cfg\actions\gear_ca.paa";
				hotkey = "R";
			};
		};
	};
	class IND_Box_Base: ReammoBox_F
	{
		class AGM_Actions: AGM_Actions
		{
			class AGM_DragItem
			{
				displayName = "$STR_AGM_Drag_StartDrag";
				distance = 4;
				condition = "!(player call AGM_Drag_fnc_isDraggingObject)";
				conditionShow = "[AGM_Interaction_Target, player] call AGM_Drag_fnc_isDraggable";
				statement = "[AGM_Interaction_Target, player] call AGM_Drag_fnc_dragObject";
				showDisabled = 0;
				priority = 3;
				icon = "\A3\ui_f\data\igui\cfg\actions\gear_ca.paa";
				hotkey = "R";
			};
		};
	};
	class NATO_Box_Base: ReammoBox_F
	{
		class AGM_Actions: AGM_Actions
		{
			class AGM_DragItem
			{
				displayName = "$STR_AGM_Drag_StartDrag";
				distance = 4;
				condition = "!(player call AGM_Drag_fnc_isDraggingObject)";
				conditionShow = "[AGM_Interaction_Target, player] call AGM_Drag_fnc_isDraggable";
				statement = "[AGM_Interaction_Target, player] call AGM_Drag_fnc_dragObject";
				showDisabled = 0;
				priority = 3;
				icon = "\A3\ui_f\data\igui\cfg\actions\gear_ca.paa";
				hotkey = "R";
			};
		};
	};
	class Box_East_AmmoVeh_F: EAST_Box_Base
	{
		class AGM_Actions: AGM_Actions
		{
			class AGM_DragItem
			{
				condition = "false";
			};
		};
	};
	class Box_NATO_AmmoVeh_F: NATO_Box_Base
	{
		class AGM_Actions: AGM_Actions
		{
			class AGM_DragItem
			{
				condition = "false";
			};
		};
	};
	class Box_IND_AmmoVeh_F: IND_Box_Base
	{
		class AGM_Actions: AGM_Actions
		{
			class AGM_DragItem
			{
				condition = "false";
			};
		};
	};
	class Helicopter_Base_F;
	class UAV_01_base_F: Helicopter_Base_F
	{
		class AGM_Actions
		{
			class AGM_DragItem
			{
				displayName = "$STR_AGM_Drag_StartDrag";
				distance = 4;
				condition = "!(player call AGM_Drag_fnc_isDraggingObject)";
				conditionShow = "[AGM_Interaction_Target, player] call AGM_Drag_fnc_isDraggable";
				statement = "[AGM_Interaction_Target, player] call AGM_Drag_fnc_dragObject";
				showDisabled = 0;
				priority = 3;
				icon = "\A3\ui_f\data\igui\cfg\actions\gear_ca.paa";
				hotkey = "R";
			};
			class AGM_RefuelUAV
			{
				displayName = "$STR_AGM_UAVs_Recharge";
				distance = 4;
				condition = "'AGM_UAVBattery' in items player && {fuel cursorTarget < 1}";
				statement = "[cursorTarget, player] call AGM_UAVs_fnc_refuel";
				showDisabled = 0;
				priority = 1.245;
				icon = "AGM_Logistics\ui\AGM_battery.paa";
			};
		};
	};
	class Land_CanisterFuel_F;
	class AGM_JerryCan: Land_CanisterFuel_F
	{
		author = "$STR_AGM_Core_AGMTeam";
		AGM_Size = 1;
		class AGM_Actions
		{
			class AGM_loadItem
			{
				displayName = "$STR_AGM_Logistics_LoadItem";
				distance = 4;
				condition = "[AGM_Interaction_Target] call AGM_Logistics_fnc_canLoadItem";
				statement = "[AGM_Interaction_Target, AGM_Logistics_targetVehicle] call AGM_Logistics_fnc_openLoadUI";
				showDisabled = 1;
				priority = 1.6;
				icon = "\A3\ui_f\data\igui\cfg\actions\gear_ca.paa";
			};
			class AGM_CarryJerrycan
			{
				displayName = "$STR_AGM_Drag_StartCarry";
				distance = 4;
				condition = "[player, AGM_Interaction_Target] call AGM_Drag_fnc_isCarryable";
				statement = "[player, AGM_Interaction_Target] call AGM_Drag_fnc_carryJerrycan";
				showDisabled = 1;
				priority = 3;
				icon = "\A3\ui_f\data\igui\cfg\actions\gear_ca.paa";
			};
			class AGM_DropJerrycan
			{
				displayName = "$STR_AGM_Drag_EndCarry";
				distance = 4;
				condition = "[player, AGM_Interaction_Target] call AGM_Drag_fnc_isCarryingObject";
				statement = "[player, AGM_Interaction_Target] call AGM_Drag_fnc_dropJerrycan";
				exceptions[] = {"AGM_Drag_isNotDragging"};
				showDisabled = 0;
				priority = 3;
				icon = "\A3\ui_f\data\igui\cfg\actions\gear_ca.paa";
			};
			class AGM_CheckFuelJerrycan
			{
				displayName = "$STR_AGM_Resupply_CheckFuelJerryCan";
				distance = 4;
				condition = "alive AGM_Interaction_Target";
				statement = "[player, AGM_Interaction_Target] call AGM_Resupply_fnc_getFuelAmountJerrycan";
				exceptions[] = {"AGM_Drag_isNotDragging"};
				showDisabled = 0;
				priority = 3;
				icon = "\A3\ui_f\data\igui\cfg\actions\refuel_ca.paa";
			};
		};
		icon = "iconObject_circle";
		displayName = "$STR_AGM_Repair_JerryCan";
		mapSize = 0.7;
		accuracy = 0.2;
		vehicleClass = "AGM_Repair_Items";
		destrType = "DesturctNo";
	};
	class AGM_SpareTrack: ThingX
	{
		author = "Hawkins";
		AGM_Size = 1;
		AGM_CarryPosition[] = {0,1,1};
		scope = 2;
		model = "\AGM_Logistics\agm_track.p3d";
		icon = "iconObject_circle";
		displayName = "$STR_AGM_Repair_SpareTrack";
		mapSize = 0.7;
		accuracy = 0.2;
		vehicleClass = "AGM_Repair_Items";
		destrType = "DesturctNo";
		class AGM_Actions
		{
			class AGM_DragItem
			{
				displayName = "$STR_AGM_Drag_StartDrag";
				distance = 4;
				condition = "!(player call AGM_Drag_fnc_isDraggingObject)";
				conditionShow = "[AGM_Interaction_Target, player] call AGM_Drag_fnc_isDraggable";
				statement = "[AGM_Interaction_Target, player] call AGM_Drag_fnc_dragObject";
				showDisabled = 0;
				priority = 3;
				icon = "\A3\ui_f\data\igui\cfg\actions\gear_ca.paa";
				hotkey = "R";
			};
			class AGM_loadItem
			{
				displayName = "$STR_AGM_Logistics_LoadItem";
				distance = 4;
				condition = "[AGM_Interaction_Target] call AGM_Logistics_fnc_canLoadItem";
				statement = "[AGM_Interaction_Target, AGM_Logistics_targetVehicle] call AGM_Logistics_fnc_openLoadUI";
				showDisabled = 1;
				priority = 1.6;
				icon = "\A3\ui_f\data\igui\cfg\actions\gear_ca.paa";
			};
		};
	};
	class AGM_SpareWheel: ThingX
	{
		author = "Hawkins";
		AGM_Size = 1;
		AGM_CarryPosition[] = {0,1,1};
		scope = 2;
		model = "\AGM_Logistics\agm_wheel.p3d";
		icon = "iconObject_circle";
		displayName = "$STR_AGM_Repair_SpareWheel";
		mapSize = 0.7;
		accuracy = 0.2;
		vehicleClass = "AGM_Repair_Items";
		destrType = "DesturctNo";
		picture = "\AGM_Logistics\ui\tire_ca.paa";
		class AGM_Actions
		{
			class AGM_DragItem
			{
				displayName = "$STR_AGM_Drag_StartDrag";
				distance = 4;
				condition = "!(player call AGM_Drag_fnc_isDraggingObject)";
				conditionShow = "[AGM_Interaction_Target, player] call AGM_Drag_fnc_isDraggable";
				statement = "[AGM_Interaction_Target, player] call AGM_Drag_fnc_dragObject";
				showDisabled = 0;
				priority = 3;
				icon = "\A3\ui_f\data\igui\cfg\actions\gear_ca.paa";
				hotkey = "R";
			};
			class AGM_loadItem
			{
				displayName = "$STR_AGM_Logistics_LoadItem";
				distance = 4;
				condition = "[AGM_Interaction_Target] call AGM_Logistics_fnc_canLoadItem";
				statement = "[AGM_Interaction_Target, AGM_Logistics_targetVehicle] call AGM_Logistics_fnc_openLoadUI";
				showDisabled = 1;
				priority = 1.6;
				icon = "\A3\ui_f\data\igui\cfg\actions\gear_ca.paa";
			};
		};
	};
	class Land_WoodenBox_F;
	class AGM_SandbagBarrier_Crate: Land_WoodenBox_F
	{
		author = "$STR_AGM_Core_AGMTeam";
		AGM_Size = 1;
		AGM_CarryPosition[] = {0,1,1};
		icon = "iconObject_circle";
		displayName = "$STR_AGM_Fortifications_SandbagBarrierCrate";
		mapSize = 0.7;
		accuracy = 0.2;
		vehicleClass = "AGM_Repair_Items";
		destrType = "DesturctNo";
		class AGM_Actions
		{
			class AGM_DragItem
			{
				displayName = "$STR_AGM_Drag_StartDrag";
				distance = 4;
				condition = "!(player call AGM_Drag_fnc_isDraggingObject)";
				conditionShow = "[AGM_Interaction_Target, player] call AGM_Drag_fnc_isDraggable";
				statement = "[AGM_Interaction_Target, player] call AGM_Drag_fnc_dragObject";
				showDisabled = 0;
				priority = 3;
				icon = "\A3\ui_f\data\igui\cfg\actions\gear_ca.paa";
				hotkey = "R";
			};
			class AGM_loadItem
			{
				displayName = "$STR_AGM_Logistics_LoadItem";
				distance = 4;
				condition = "[AGM_Interaction_Target] call AGM_Logistics_fnc_canLoadItem";
				statement = "[AGM_Interaction_Target, AGM_Logistics_targetVehicle] call AGM_Logistics_fnc_openLoadUI";
				showDisabled = 1;
				priority = 1.6;
				icon = "\A3\ui_f\data\igui\cfg\actions\gear_ca.paa";
			};
			class AGM_PlaceFortification
			{
				displayName = "Place Fortification";
				distance = 4;
				condition = "[player, AGM_Interaction_Target, ['Land_BagFence_Long_F', 'Land_BagFence_Round_F']] call AGM_Fortifications_fnc_canSetupBarrier";
				statement = "[player, AGM_Interaction_Target, ['Land_BagFence_Long_F', 'Land_BagFence_Round_F']] call AGM_Fortifications_fnc_openSelectBarrierlUI";
				showDisabled = 0;
				priority = 0.5;
				icon = "\A3\ui_f\data\igui\cfg\actions\repair_ca.paa";
			};
		};
	};
	class AGM_RazorWire_Crate: AGM_SandbagBarrier_Crate
	{
		author = "$STR_AGM_Core_AGMTeam";
		displayName = "$STR_AGM_Fortifications_RazorWireCrate";
		class AGM_Actions: AGM_Actions
		{
			class AGM_PlaceFortification
			{
				displayName = "Place Fortification";
				distance = 4;
				condition = "[player, AGM_Interaction_Target, 'Land_Razorwire_F'] call AGM_Fortifications_fnc_canSetupBarrier";
				statement = "[player, AGM_Interaction_Target, 'Land_Razorwire_F'] call AGM_Fortifications_fnc_setupBarrier";
				showDisabled = 0;
				priority = 0.5;
				icon = "\A3\ui_f\data\igui\cfg\actions\repair_ca.paa";
			};
		};
	};
	class Box_NATO_Support_F;
	class AGM_Box_Misc: Box_NATO_Support_F
	{
		class TransportItems
		{
			class _xx_AGM_UAVBattery
			{
				count = 6;
				name = "AGM_UAVBattery";
			};
		};
	};
	class Wall_F;
	class Land_Net_Fence_4m_F: Wall_F
	{
		class AGM_Actions
		{
			class AGM_Wirecutter_cut
			{
				displayName = "$STR_AGM_CutFence";
				distance = 4;
				condition = "'ToolKit' in items player && {alive AGM_Interaction_Target}";
				statement = "[5, AGM_Interaction_Target] call AGM_Wirecutter_fnc_cutDownFence";
				showDisabled = 1;
				priority = 2.1;
				icon = "AGM_Logistics\ui\wirecutter_ca.paa";
			};
		};
	};
	class Land_Net_Fence_8m_F: Wall_F
	{
		class AGM_Actions
		{
			class AGM_Wirecutter_cut
			{
				displayName = "$STR_AGM_CutFence";
				distance = 4;
				condition = "'ToolKit' in items player && {alive AGM_Interaction_Target}";
				statement = "[5, AGM_Interaction_Target] call AGM_Wirecutter_fnc_cutDownFence";
				showDisabled = 1;
				priority = 2.1;
				icon = "AGM_Logistics\ui\wirecutter_ca.paa";
			};
		};
	};
	class Land_Net_FenceD_8m_F: Wall_F
	{
		class AGM_Actions
		{
			class AGM_Wirecutter_cut
			{
				displayName = "$STR_AGM_CutFence";
				distance = 4;
				condition = "'ToolKit' in items player && {alive AGM_Interaction_Target}";
				statement = "[5, AGM_Interaction_Target] call AGM_Wirecutter_fnc_cutDownFence";
				showDisabled = 1;
				priority = 2.1;
				icon = "AGM_Logistics\ui\wirecutter_ca.paa";
			};
		};
	};
	class Land_New_WiredFence_5m_F: Wall_F
	{
		class AGM_Actions
		{
			class AGM_Wirecutter_cut
			{
				displayName = "$STR_AGM_CutFence";
				distance = 4;
				condition = "'ToolKit' in items player && {alive AGM_Interaction_Target}";
				statement = "[5, AGM_Interaction_Target] call AGM_Wirecutter_fnc_cutDownFence";
				showDisabled = 1;
				priority = 2.1;
				icon = "AGM_Logistics\ui\wirecutter_ca.paa";
			};
		};
	};
	class Land_New_WiredFence_10m_Dam_F: Wall_F
	{
		class AGM_Actions
		{
			class AGM_Wirecutter_cut
			{
				displayName = "$STR_AGM_CutFence";
				distance = 4;
				condition = "'ToolKit' in items player && {alive AGM_Interaction_Target}";
				statement = "[5, AGM_Interaction_Target] call AGM_Wirecutter_fnc_cutDownFence";
				showDisabled = 1;
				priority = 2.1;
				icon = "AGM_Logistics\ui\wirecutter_ca.paa";
			};
		};
	};
	class Land_New_WiredFence_10m_F: Wall_F
	{
		class AGM_Actions
		{
			class AGM_Wirecutter_cut
			{
				displayName = "$STR_AGM_CutFence";
				distance = 4;
				condition = "'ToolKit' in items player && {alive AGM_Interaction_Target}";
				statement = "[5, AGM_Interaction_Target] call AGM_Wirecutter_fnc_cutDownFence";
				showDisabled = 1;
				priority = 2.1;
				icon = "AGM_Logistics\ui\wirecutter_ca.paa";
			};
		};
	};
	class Land_Pipe_fence_4m_F: Wall_F
	{
		class AGM_Actions
		{
			class AGM_Wirecutter_cut
			{
				displayName = "$STR_AGM_CutFence";
				distance = 4;
				condition = "'ToolKit' in items player && {alive AGM_Interaction_Target}";
				statement = "[5, AGM_Interaction_Target] call AGM_Wirecutter_fnc_cutDownFence";
				showDisabled = 1;
				priority = 2.1;
				icon = "AGM_Logistics\ui\wirecutter_ca.paa";
			};
		};
	};
	class Land_Pipe_fence_4mNoLC_F: Wall_F
	{
		class AGM_Actions
		{
			class AGM_Wirecutter_cut
			{
				displayName = "$STR_AGM_CutFence";
				distance = 4;
				condition = "'ToolKit' in items player && {alive AGM_Interaction_Target}";
				statement = "[5, AGM_Interaction_Target] call AGM_Wirecutter_fnc_cutDownFence";
				showDisabled = 1;
				priority = 2.1;
				icon = "AGM_Logistics\ui\wirecutter_ca.paa";
			};
		};
	};
	class Land_SportGround_fence_F: Wall_F
	{
		class AGM_Actions
		{
			class AGM_Wirecutter_cut
			{
				displayName = "$STR_AGM_CutFence";
				distance = 4;
				condition = "'ToolKit' in items player && {alive AGM_Interaction_Target}";
				statement = "[5, AGM_Interaction_Target] call AGM_Wirecutter_fnc_cutDownFence";
				showDisabled = 1;
				priority = 2.1;
				icon = "AGM_Logistics\ui\wirecutter_ca.paa";
			};
		};
	};
	class Land_Wired_Fence_4m_F: Wall_F
	{
		class AGM_Actions
		{
			class AGM_Wirecutter_cut
			{
				displayName = "$STR_AGM_CutFence";
				distance = 4;
				condition = "'ToolKit' in items player && {alive AGM_Interaction_Target}";
				statement = "[5, AGM_Interaction_Target] call AGM_Wirecutter_fnc_cutDownFence";
				showDisabled = 1;
				priority = 2.1;
				icon = "AGM_Logistics\ui\wirecutter_ca.paa";
			};
		};
	};
	class Land_Wired_Fence_4mD_F: Wall_F
	{
		class AGM_Actions
		{
			class AGM_Wirecutter_cut
			{
				displayName = "$STR_AGM_CutFence";
				distance = 4;
				condition = "'ToolKit' in items player && {alive AGM_Interaction_Target}";
				statement = "[5, AGM_Interaction_Target] call AGM_Wirecutter_fnc_cutDownFence";
				showDisabled = 1;
				priority = 2.1;
				icon = "AGM_Logistics\ui\wirecutter_ca.paa";
			};
		};
	};
	class Land_Wired_Fence_8m_F: Wall_F
	{
		class AGM_Actions
		{
			class AGM_Wirecutter_cut
			{
				displayName = "$STR_AGM_CutFence";
				distance = 4;
				condition = "'ToolKit' in items player && {alive AGM_Interaction_Target}";
				statement = "[5, AGM_Interaction_Target] call AGM_Wirecutter_fnc_cutDownFence";
				showDisabled = 1;
				priority = 2.1;
				icon = "AGM_Logistics\ui\wirecutter_ca.paa";
			};
		};
	};
	class Land_Wired_Fence_8mD_F: Wall_F
	{
		class AGM_Actions
		{
			class AGM_Wirecutter_cut
			{
				displayName = "$STR_AGM_CutFence";
				distance = 4;
				condition = "'ToolKit' in items player && {alive AGM_Interaction_Target}";
				statement = "[5, AGM_Interaction_Target] call AGM_Wirecutter_fnc_cutDownFence";
				showDisabled = 1;
				priority = 2.1;
				icon = "AGM_Logistics\ui\wirecutter_ca.paa";
			};
		};
	};
	class NonStrategic;
	class Land_Razorwire_F: NonStrategic
	{
		class AGM_Actions
		{
			class AGM_Wirecutter_cut
			{
				displayName = "$STR_AGM_CutFence";
				distance = 4;
				condition = "'ToolKit' in items player && {alive AGM_Interaction_Target}";
				statement = "[5, AGM_Interaction_Target] call AGM_Wirecutter_fnc_cutDownFence";
				showDisabled = 1;
				priority = 2.1;
				icon = "AGM_Logistics\ui\wirecutter_ca.paa";
			};
		};
	};
	class House_Small_F;
	class Land_FuelStation_Feed_F: House_Small_F
	{
		class AGM_Actions
		{
			class AGM_DrainFuelCargo
			{
				displayName = "$STR_AGM_Resupply_DrainFuelCargo";
				distance = 4;
				condition = "[player, AGM_Interaction_Target] call AGM_Resupply_fnc_canDrainFuelCargo";
				statement = "[player, AGM_Interaction_Target] call AGM_Resupply_fnc_drainFuelCargo";
				exceptions[] = {"AGM_Drag_isNotDragging"};
				showDisabled = 0;
				priority = 1.22;
				icon = "\A3\ui_f\data\igui\cfg\actions\refuel_ca.paa";
			};
			class AGM_CheckFuelCargo
			{
				displayName = "$STR_AGM_Resupply_CheckFuelCargo";
				distance = 4;
				condition = "alive AGM_Interaction_Target && {speed AGM_Interaction_Target == 0}";
				statement = "[player, AGM_Interaction_Target] call AGM_Resupply_fnc_getFuelAmountCargo";
				exceptions[] = {"AGM_Drag_isNotDragging"};
				showDisabled = 0;
				priority = 1.24;
				icon = "\A3\ui_f\data\igui\cfg\actions\refuel_ca.paa";
			};
		};
		AGM_fuelCapacityCargo = 50000;
		transportFuel = 0;
	};
	class Land_fs_feed_F: House_Small_F
	{
		class AGM_Actions
		{
			class AGM_DrainFuelCargo
			{
				displayName = "$STR_AGM_Resupply_DrainFuelCargo";
				distance = 4;
				condition = "[player, AGM_Interaction_Target] call AGM_Resupply_fnc_canDrainFuelCargo";
				statement = "[player, AGM_Interaction_Target] call AGM_Resupply_fnc_drainFuelCargo";
				exceptions[] = {"AGM_Drag_isNotDragging"};
				showDisabled = 0;
				priority = 1.22;
				icon = "\A3\ui_f\data\igui\cfg\actions\refuel_ca.paa";
			};
			class AGM_CheckFuelCargo
			{
				displayName = "$STR_AGM_Resupply_CheckFuelCargo";
				distance = 4;
				condition = "alive AGM_Interaction_Target && {speed AGM_Interaction_Target == 0}";
				statement = "[player, AGM_Interaction_Target] call AGM_Resupply_fnc_getFuelAmountCargo";
				exceptions[] = {"AGM_Drag_isNotDragging"};
				showDisabled = 0;
				priority = 1.24;
				icon = "\A3\ui_f\data\igui\cfg\actions\refuel_ca.paa";
			};
		};
		AGM_fuelCapacityCargo = 50000;
		transportFuel = 0;
	};
	class APC_Wheeled_01_base_F: Wheeled_APC_F
	{
		AGM_fuelCapacity = 600;
		AGM_Wheels[] = {"HitLFWheel","HitRFWheel","HitLF2Wheel","HitRF2Wheel","HitLMWheel","HitRMWheel","HitLBWheel","HitRBWheel"};
		AGM_WheelsLocalized[] = {"STR_AGM_Repair_HitLFWheel","STR_AGM_Repair_HitRFWheel","STR_AGM_Repair_HitLF2Wheel","STR_AGM_Repair_HitRF2Wheel","STR_AGM_Repair_HitLMWheel","STR_AGM_Repair_HitRMWheel","STR_AGM_Repair_HitLBWheel","STR_AGM_Repair_HitRBWheel"};
	};
	class APC_Wheeled_02_base_F: Wheeled_APC_F
	{
		AGM_fuelCapacity = 600;
	};
	class APC_Wheeled_03_base_F: Wheeled_APC_F
	{
		AGM_fuelCapacity = 228;
		AGM_Wheels[] = {"HitLFWheel","HitRFWheel","HitLF2Wheel","HitRF2Wheel","HitLMWheel","HitRMWheel","HitLBWheel","HitRBWheel"};
		AGM_WheelsLocalized[] = {"STR_AGM_Repair_HitLFWheel","STR_AGM_Repair_HitRFWheel","STR_AGM_Repair_HitLF2Wheel","STR_AGM_Repair_HitRF2Wheel","STR_AGM_Repair_HitLMWheel","STR_AGM_Repair_HitRMWheel","STR_AGM_Repair_HitLBWheel","STR_AGM_Repair_HitRBWheel"};
	};
	class APC_Tracked_01_base_F: Tank_F
	{
		AGM_fuelCapacity = 1400;
	};
	class B_APC_Tracked_01_base_F: APC_Tracked_01_base_F
	{
		class AGM_Actions;
	};
	class B_APC_Tracked_01_CRV_F: B_APC_Tracked_01_base_F
	{
		class AGM_Actions: AGM_Actions
		{
			class AGM_DrainFuelCargo
			{
				displayName = "$STR_AGM_Resupply_DrainFuelCargo";
				distance = 4;
				condition = "[player, AGM_Interaction_Target] call AGM_Resupply_fnc_canDrainFuelCargo";
				statement = "[player, AGM_Interaction_Target] call AGM_Resupply_fnc_drainFuelCargo";
				exceptions[] = {"AGM_Drag_isNotDragging"};
				showDisabled = 0;
				priority = 1.22;
				icon = "\A3\ui_f\data\igui\cfg\actions\refuel_ca.paa";
			};
			class AGM_CheckFuelCargo
			{
				displayName = "$STR_AGM_Resupply_CheckFuelCargo";
				distance = 4;
				condition = "alive AGM_Interaction_Target && {speed AGM_Interaction_Target == 0}";
				statement = "[player, AGM_Interaction_Target] call AGM_Resupply_fnc_getFuelAmountCargo";
				exceptions[] = {"AGM_Drag_isNotDragging"};
				showDisabled = 0;
				priority = 1.24;
				icon = "\A3\ui_f\data\igui\cfg\actions\refuel_ca.paa";
			};
		};
		AGM_canRepair = 1;
		AGM_fuelCapacityCargo = 0;
		transportRepair = 0;
		transportFuel = 0;
	};
	class APC_Tracked_02_base_F: Tank_F
	{
		AGM_fuelCapacity = 800;
	};
	class APC_tracked_03_base_F: Tank_F
	{
		AGM_fuelCapacity = 770;
	};
	class Truck_01_base_F: Truck_F
	{
		AGM_Wheels[] = {"HitLFWheel","HitRFWheel","HitLF2Wheel","HitRF2Wheel","HitLMWheel","HitRMWheel","HitLBWheel","HitRBWheel"};
		AGM_WheelsLocalized[] = {"STR_AGM_Repair_HitLFWheel","STR_AGM_Repair_HitRFWheel","STR_AGM_Repair_HitLF2Wheel","STR_AGM_Repair_HitRF2Wheel","STR_AGM_Repair_HitLMWheel","STR_AGM_Repair_HitRMWheel","STR_AGM_Repair_HitLBWheel","STR_AGM_Repair_HitRBWheel"};
		AGM_fuelCapacity = 587;
		class AGM_Actions;
	};
	class B_Truck_01_transport_F: Truck_01_base_F{};
	class B_Truck_01_mover_F: B_Truck_01_transport_F{};
	class B_Truck_01_Repair_F: B_Truck_01_mover_F
	{
		AGM_canRepair = 1;
		transportRepair = 0;
	};
	class B_Truck_01_fuel_F: B_Truck_01_mover_F
	{
		class AGM_Actions: AGM_Actions
		{
			class AGM_DrainFuelCargo
			{
				displayName = "$STR_AGM_Resupply_DrainFuelCargo";
				distance = 4;
				condition = "[player, AGM_Interaction_Target] call AGM_Resupply_fnc_canDrainFuelCargo";
				statement = "[player, AGM_Interaction_Target] call AGM_Resupply_fnc_drainFuelCargo";
				exceptions[] = {"AGM_Drag_isNotDragging"};
				showDisabled = 0;
				priority = 1.22;
				icon = "\A3\ui_f\data\igui\cfg\actions\refuel_ca.paa";
			};
			class AGM_CheckFuelCargo
			{
				displayName = "$STR_AGM_Resupply_CheckFuelCargo";
				distance = 4;
				condition = "alive AGM_Interaction_Target && {speed AGM_Interaction_Target == 0}";
				statement = "[player, AGM_Interaction_Target] call AGM_Resupply_fnc_getFuelAmountCargo";
				exceptions[] = {"AGM_Drag_isNotDragging"};
				showDisabled = 0;
				priority = 1.24;
				icon = "\A3\ui_f\data\igui\cfg\actions\refuel_ca.paa";
			};
		};
		AGM_fuelCapacityCargo = 9464;
		transportFuel = 0;
	};
	class Truck_02_base_F: Truck_F
	{
		AGM_Wheels[] = {"HitLFWheel","HitRFWheel","HitLMWheel","HitRMWheel","HitLF2Wheel","HitRF2Wheel"};
		AGM_WheelsLocalized[] = {"STR_AGM_Repair_HitLFWheel","STR_AGM_Repair_HitRFWheel","STR_AGM_Repair_HitLMWheel","STR_AGM_Repair_HitRMWheel","STR_AGM_Repair_HitLBWheel","STR_AGM_Repair_HitRBWheel"};
		AGM_fuelCapacity = 420;
		class AGM_Actions: AGM_Actions{};
	};
	class O_Truck_02_box_F: Truck_02_base_F
	{
		AGM_canRepair = 1;
		transportRepair = 0;
	};
	class O_Truck_02_medical_F: O_Truck_02_box_F
	{
		AGM_canRepair = 0;
	};
	class O_Truck_02_fuel_F: Truck_02_base_F
	{
		class AGM_Actions: AGM_Actions
		{
			class AGM_DrainFuelCargo
			{
				displayName = "$STR_AGM_Resupply_DrainFuelCargo";
				distance = 4;
				condition = "[player, AGM_Interaction_Target] call AGM_Resupply_fnc_canDrainFuelCargo";
				statement = "[player, AGM_Interaction_Target] call AGM_Resupply_fnc_drainFuelCargo";
				exceptions[] = {"AGM_Drag_isNotDragging"};
				showDisabled = 0;
				priority = 1.22;
				icon = "\A3\ui_f\data\igui\cfg\actions\refuel_ca.paa";
			};
			class AGM_CheckFuelCargo
			{
				displayName = "$STR_AGM_Resupply_CheckFuelCargo";
				distance = 4;
				condition = "alive AGM_Interaction_Target && {speed AGM_Interaction_Target == 0}";
				statement = "[player, AGM_Interaction_Target] call AGM_Resupply_fnc_getFuelAmountCargo";
				exceptions[] = {"AGM_Drag_isNotDragging"};
				showDisabled = 0;
				priority = 1.24;
				icon = "\A3\ui_f\data\igui\cfg\actions\refuel_ca.paa";
			};
		};
		AGM_fuelCapacityCargo = 7125;
		transportFuel = 0;
	};
	class I_Truck_02_box_F: Truck_02_base_F
	{
		AGM_canRepair = 1;
		transportRepair = 0;
	};
	class I_Truck_02_medical_F: I_Truck_02_box_F
	{
		AGM_canRepair = 0;
	};
	class I_Truck_02_fuel_F: Truck_02_base_F
	{
		class AGM_Actions: AGM_Actions
		{
			class AGM_DrainFuelCargo
			{
				displayName = "$STR_AGM_Resupply_DrainFuelCargo";
				distance = 4;
				condition = "[player, AGM_Interaction_Target] call AGM_Resupply_fnc_canDrainFuelCargo";
				statement = "[player, AGM_Interaction_Target] call AGM_Resupply_fnc_drainFuelCargo";
				exceptions[] = {"AGM_Drag_isNotDragging"};
				showDisabled = 0;
				priority = 1.22;
				icon = "\A3\ui_f\data\igui\cfg\actions\refuel_ca.paa";
			};
			class AGM_CheckFuelCargo
			{
				displayName = "$STR_AGM_Resupply_CheckFuelCargo";
				distance = 4;
				condition = "alive AGM_Interaction_Target && {speed AGM_Interaction_Target == 0}";
				statement = "[player, AGM_Interaction_Target] call AGM_Resupply_fnc_getFuelAmountCargo";
				exceptions[] = {"AGM_Drag_isNotDragging"};
				showDisabled = 0;
				priority = 1.24;
				icon = "\A3\ui_f\data\igui\cfg\actions\refuel_ca.paa";
			};
		};
		AGM_fuelCapacityCargo = 7125;
		transportFuel = 0;
	};
	class Truck_03_base_F: Truck_F
	{
		AGM_Wheels[] = {"HitLFWheel","HitRFWheel","HitLF2Wheel","HitRF2Wheel","HitLBWheel","HitRBWheel"};
		AGM_WheelsLocalized[] = {"STR_AGM_Repair_HitLFWheel","STR_AGM_Repair_HitRFWheel","STR_AGM_Repair_HitLF2Wheel","STR_AGM_Repair_HitRF2Wheel","STR_AGM_Repair_HitLBWheel","STR_AGM_Repair_HitRBWheel"};
		AGM_fuelCapacity = 420;
		class AGM_Actions: AGM_Actions{};
	};
	class O_Truck_03_repair_F: Truck_03_base_F
	{
		AGM_canRepair = 1;
		transportRepair = 0;
	};
	class O_Truck_03_fuel_F: Truck_03_base_F
	{
		class AGM_Actions: AGM_Actions
		{
			class AGM_DrainFuelCargo
			{
				displayName = "$STR_AGM_Resupply_DrainFuelCargo";
				distance = 4;
				condition = "[player, AGM_Interaction_Target] call AGM_Resupply_fnc_canDrainFuelCargo";
				statement = "[player, AGM_Interaction_Target] call AGM_Resupply_fnc_drainFuelCargo";
				exceptions[] = {"AGM_Drag_isNotDragging"};
				showDisabled = 0;
				priority = 1.22;
				icon = "\A3\ui_f\data\igui\cfg\actions\refuel_ca.paa";
			};
			class AGM_CheckFuelCargo
			{
				displayName = "$STR_AGM_Resupply_CheckFuelCargo";
				distance = 4;
				condition = "alive AGM_Interaction_Target && {speed AGM_Interaction_Target == 0}";
				statement = "[player, AGM_Interaction_Target] call AGM_Resupply_fnc_getFuelAmountCargo";
				exceptions[] = {"AGM_Drag_isNotDragging"};
				showDisabled = 0;
				priority = 1.24;
				icon = "\A3\ui_f\data\igui\cfg\actions\refuel_ca.paa";
			};
		};
		AGM_fuelCapacityCargo = 7125;
		transportFuel = 0;
	};
	class Van_01_base_F: Truck_F
	{
		AGM_Wheels[] = {"HitLFWheel","HitRFWheel","HitLF2Wheel","HitRF2Wheel"};
		AGM_WheelsLocalized[] = {"STR_AGM_Repair_HitLFWheel","STR_AGM_Repair_HitRFWheel","STR_AGM_Repair_HitLBWheel","STR_AGM_Repair_HitRBWheel"};
		AGM_fuelCapacity = 80;
		class AGM_Actions: AGM_Actions{};
	};
	class I_G_Van_01_fuel_F: Van_01_base_F
	{
		class AGM_Actions: AGM_Actions
		{
			class AGM_DrainFuelCargo
			{
				displayName = "$STR_AGM_Resupply_DrainFuelCargo";
				distance = 4;
				condition = "[player, AGM_Interaction_Target] call AGM_Resupply_fnc_canDrainFuelCargo";
				statement = "[player, AGM_Interaction_Target] call AGM_Resupply_fnc_drainFuelCargo";
				exceptions[] = {"AGM_Drag_isNotDragging"};
				showDisabled = 0;
				priority = 1.22;
				icon = "\A3\ui_f\data\igui\cfg\actions\refuel_ca.paa";
			};
			class AGM_CheckFuelCargo
			{
				displayName = "$STR_AGM_Resupply_CheckFuelCargo";
				distance = 4;
				condition = "alive AGM_Interaction_Target && {speed AGM_Interaction_Target == 0}";
				statement = "[player, AGM_Interaction_Target] call AGM_Resupply_fnc_getFuelAmountCargo";
				exceptions[] = {"AGM_Drag_isNotDragging"};
				showDisabled = 0;
				priority = 1.24;
				icon = "\A3\ui_f\data\igui\cfg\actions\refuel_ca.paa";
			};
		};
		AGM_fuelCapacityCargo = 5000;
		transportFuel = 0;
	};
	class C_Van_01_fuel_F: Van_01_base_F
	{
		class AGM_Actions: AGM_Actions
		{
			class AGM_DrainFuelCargo
			{
				displayName = "$STR_AGM_Resupply_DrainFuelCargo";
				distance = 4;
				condition = "[player, AGM_Interaction_Target] call AGM_Resupply_fnc_canDrainFuelCargo";
				statement = "[player, AGM_Interaction_Target] call AGM_Resupply_fnc_drainFuelCargo";
				exceptions[] = {"AGM_Drag_isNotDragging"};
				showDisabled = 0;
				priority = 1.22;
				icon = "\A3\ui_f\data\igui\cfg\actions\refuel_ca.paa";
			};
			class AGM_CheckFuelCargo
			{
				displayName = "$STR_AGM_Resupply_CheckFuelCargo";
				distance = 4;
				condition = "alive AGM_Interaction_Target && {speed AGM_Interaction_Target == 0}";
				statement = "[player, AGM_Interaction_Target] call AGM_Resupply_fnc_getFuelAmountCargo";
				exceptions[] = {"AGM_Drag_isNotDragging"};
				showDisabled = 0;
				priority = 1.24;
				icon = "\A3\ui_f\data\igui\cfg\actions\refuel_ca.paa";
			};
		};
		AGM_fuelCapacityCargo = 5000;
		transportFuel = 0;
	};
	class Helicopter_Base_H;
	class Heli_Transport_04_base_F: Helicopter_Base_H
	{
		class AGM_Actions;
	};
	class O_Heli_Transport_04_fuel_F: Heli_Transport_04_base_F
	{
		class AGM_Actions: AGM_Actions
		{
			class AGM_DrainFuelCargo
			{
				displayName = "$STR_AGM_Resupply_DrainFuelCargo";
				distance = 4;
				condition = "[player, AGM_Interaction_Target] call AGM_Resupply_fnc_canDrainFuelCargo";
				statement = "[player, AGM_Interaction_Target] call AGM_Resupply_fnc_drainFuelCargo";
				exceptions[] = {"AGM_Drag_isNotDragging"};
				showDisabled = 0;
				priority = 1.22;
				icon = "\A3\ui_f\data\igui\cfg\actions\refuel_ca.paa";
			};
			class AGM_CheckFuelCargo
			{
				displayName = "$STR_AGM_Resupply_CheckFuelCargo";
				distance = 4;
				condition = "alive AGM_Interaction_Target && {speed AGM_Interaction_Target == 0}";
				statement = "[player, AGM_Interaction_Target] call AGM_Resupply_fnc_getFuelAmountCargo";
				exceptions[] = {"AGM_Drag_isNotDragging"};
				showDisabled = 0;
				priority = 1.24;
				icon = "\A3\ui_f\data\igui\cfg\actions\refuel_ca.paa";
			};
		};
		AGM_fuelCapacityCargo = 3000;
		transportFuel = 0;
	};
	class O_Heli_Transport_04_repair_F: Heli_Transport_04_base_F
	{
		AGM_canRepair = 1;
		transportRepair = 0;
	};
	class CargoNet_01_base_F;
	class CargoNet_01_barrels_F: CargoNet_01_base_F
	{
		class AGM_Actions
		{
			class AGM_DrainFuelCargo
			{
				displayName = "$STR_AGM_Resupply_DrainFuelCargo";
				distance = 4;
				condition = "[player, AGM_Interaction_Target] call AGM_Resupply_fnc_canDrainFuelCargo";
				statement = "[player, AGM_Interaction_Target] call AGM_Resupply_fnc_drainFuelCargo";
				exceptions[] = {"AGM_Drag_isNotDragging"};
				showDisabled = 0;
				priority = 1.22;
				icon = "\A3\ui_f\data\igui\cfg\actions\refuel_ca.paa";
			};
			class AGM_CheckFuelCargo
			{
				displayName = "$STR_AGM_Resupply_CheckFuelCargo";
				distance = 4;
				condition = "alive AGM_Interaction_Target && {speed AGM_Interaction_Target == 0}";
				statement = "[player, AGM_Interaction_Target] call AGM_Resupply_fnc_getFuelAmountCargo";
				exceptions[] = {"AGM_Drag_isNotDragging"};
				showDisabled = 0;
				priority = 1.24;
				icon = "\A3\ui_f\data\igui\cfg\actions\refuel_ca.paa";
			};
			class AGM_loadItem
			{
				displayName = "$STR_AGM_Logistics_LoadItem";
				distance = 4;
				condition = "[AGM_Interaction_Target] call AGM_Logistics_fnc_canLoadItem";
				statement = "[AGM_Interaction_Target, AGM_Logistics_targetVehicle] call AGM_Logistics_fnc_openLoadUI";
				showDisabled = 1;
				priority = 1.6;
				icon = "\A3\ui_f\data\igui\cfg\actions\gear_ca.paa";
			};
		};
		AGM_fuelCapacityCargo = 800;
	};
	class Items_Base_F;
	class Land_MetalBarrel_F: Items_Base_F
	{
		class AGM_Actions
		{
			class AGM_DrainFuelCargo
			{
				displayName = "$STR_AGM_Resupply_DrainFuelCargo";
				distance = 4;
				condition = "[player, AGM_Interaction_Target] call AGM_Resupply_fnc_canDrainFuelCargo";
				statement = "[player, AGM_Interaction_Target] call AGM_Resupply_fnc_drainFuelCargo";
				exceptions[] = {"AGM_Drag_isNotDragging"};
				showDisabled = 0;
				priority = 1.22;
				icon = "\A3\ui_f\data\igui\cfg\actions\refuel_ca.paa";
			};
			class AGM_CheckFuelCargo
			{
				displayName = "$STR_AGM_Resupply_CheckFuelCargo";
				distance = 4;
				condition = "alive AGM_Interaction_Target && {speed AGM_Interaction_Target == 0}";
				statement = "[player, AGM_Interaction_Target] call AGM_Resupply_fnc_getFuelAmountCargo";
				exceptions[] = {"AGM_Drag_isNotDragging"};
				showDisabled = 0;
				priority = 1.24;
				icon = "\A3\ui_f\data\igui\cfg\actions\refuel_ca.paa";
			};
		};
		AGM_fuelCapacityCargo = 200;
	};
	class Slingload_01_Base_F;
	class B_Slingload_01_Fuel_F: Slingload_01_Base_F
	{
		class AGM_Actions
		{
			class AGM_DrainFuelCargo
			{
				displayName = "$STR_AGM_Resupply_DrainFuelCargo";
				distance = 4;
				condition = "[player, AGM_Interaction_Target] call AGM_Resupply_fnc_canDrainFuelCargo";
				statement = "[player, AGM_Interaction_Target] call AGM_Resupply_fnc_drainFuelCargo";
				exceptions[] = {"AGM_Drag_isNotDragging"};
				showDisabled = 0;
				priority = 1.22;
				icon = "\A3\ui_f\data\igui\cfg\actions\refuel_ca.paa";
			};
			class AGM_CheckFuelCargo
			{
				displayName = "$STR_AGM_Resupply_CheckFuelCargo";
				distance = 4;
				condition = "alive AGM_Interaction_Target && {speed AGM_Interaction_Target == 0}";
				statement = "[player, AGM_Interaction_Target] call AGM_Resupply_fnc_getFuelAmountCargo";
				exceptions[] = {"AGM_Drag_isNotDragging"};
				showDisabled = 0;
				priority = 1.24;
				icon = "\A3\ui_f\data\igui\cfg\actions\refuel_ca.paa";
			};
			class AGM_loadItem
			{
				displayName = "$STR_AGM_Logistics_LoadItem";
				distance = 4;
				condition = "[AGM_Interaction_Target] call AGM_Logistics_fnc_canLoadItem";
				statement = "[AGM_Interaction_Target, AGM_Logistics_targetVehicle] call AGM_Logistics_fnc_openLoadUI";
				showDisabled = 1;
				priority = 1.6;
				icon = "\A3\ui_f\data\igui\cfg\actions\gear_ca.paa";
			};
		};
		AGM_fuelCapacityCargo = 24000;
		transportFuel = 0;
	};
	class Module_F;
	class AGM_ModuleRepair: Module_F
	{
		author = "Hawkeye104";
		category = "AGM";
		displayName = "Repair System";
		function = "AGM_Repair_fnc_module";
		scope = 2;
		isGlobal = 1;
		icon = "\AGM_Logistics\UI\Icon_Module_Repair_ca.paa";
		class Arguments
		{
			class TimeRepair
			{
				displayName = "Heavy Repair Time";
				description = "Time to repair engine/turret/body/fuel components (in seconds). Default: 10";
				typeName = "NUMBER";
				defaultValue = 10;
			};
			class TimeWheelRepair
			{
				displayName = "Wheel Replace Time";
				description = "Time to replace a wheel (in seconds). Default: 10";
				typeName = "NUMBER";
				defaultValue = 10;
			};
			class TimeTrackRepair
			{
				displayName = "Track Replace Time";
				description = "Time to replace a track (in seconds). Default: 10";
				typeName = "NUMBER";
				defaultValue = 10;
			};
			class MaxDamageRepair
			{
				displayName = "Maximum Repaired Damage";
				description = "Limits the amount of damage that can be repaired. 0 = Repair all damage, 1 = Cannot repair any damage. Decimal Value. Default: 0";
				typeName = "NUMBER";
				defaultValue = 0;
			};
		};
	};
};
class CfgMagazines
{
	class CA_LauncherMagazine;
	class Titan_AA: CA_LauncherMagazine
	{
		AGM_LoadTime = 10;
		AGM_MagazineReloadType = 1;
	};
	class Titan_AP: Titan_AA{};
	class Titan_AT: Titan_AA{};
};
class CfgWeapons
{
	class MissileLauncher;
	class missiles_titan: MissileLauncher
	{
		AGM_Magazines[] = {"Titan_AA"};
	};
	class ItemCore;
	class InventoryItem_Base_F;
	class ToolKitItem;
	class ToolKit: ItemCore
	{
		type = 4;
		detectRange = -1;
		simulation = "ItemMineDetector";
		class ItemInfo: ToolKitItem
		{
			mass = 80;
			type = 201;
		};
	};
	class AGM_ItemCore;
	class AGM_UAVBattery: AGM_ItemCore
	{
		scope = 2;
		displayName = "$STR_AGM_UAVs_Battery_Name";
		descriptionShort = "$STR_AGM_UAVs_Battery_Description";
		model = "\AGM_Logistics\agm_battery.p3d";
		picture = "\AGM_Logistics\ui\AGM_battery.paa";
		class ItemInfo: InventoryItem_Base_F
		{
			mass = 20;
		};
	};
};
class AGM_Parameters
{
	AGM_Repair_TimeRepair = 10;
	AGM_Repair_TimeWheelRepair = 10;
	AGM_Repair_TimeTrackRepair = 10;
	AGM_Repair_MaxDamageRepair = 0;
};
class AGM_Rsc_Control_Base;
class AGM_Rsc_Display_Base;
class AGM_Repair_Diagnose_Dialog
{
	idd = -1;
	movingEnable = 0;
	onLoad = "uiNamespace setVariable ['AGM_dlgDiagnose', _this select 0];";
	objects[] = {};
	class controlsBackground
	{
		class Background
		{
			idc = -1;
			moving = 0;
			font = "TahomaB";
			text = "";
			sizeEx = 0;
			lineSpacing = 0;
			access = 0;
			type = 0;
			style = 0;
			size = 1;
			colorBackground[] = {0,0,0,0.25};
			colorText[] = {0,0,0,0};
			x = 0;
			y = 0;
			w = 1;
			h = 1;
		};
		class LFWheel: Background
		{
			idc = 10;
			colorBackground[] = {1,1,1,1};
			x = "5.5 / 16";
			y = "1 / 9";
			w = "0.5 / 16";
			h = "1.5 / 9";
		};
		class LF2Wheel: LFWheel
		{
			idc = 11;
			y = "3 / 9";
		};
		class LMWheel: LFWheel
		{
			idc = 12;
			y = "5 / 9";
		};
		class LBWheel: LFWheel
		{
			idc = 13;
			y = "7 / 9";
		};
		class RFWheel: LFWheel
		{
			idc = 14;
			x = "10 / 16";
		};
		class RF2Wheel: RFWheel
		{
			idc = 15;
			y = "3 / 9";
		};
		class RMWheel: RFWheel
		{
			idc = 16;
			y = "5 / 9";
		};
		class RBWheel: RFWheel
		{
			idc = 17;
			y = "7 / 9";
		};
		class Body: LFWheel
		{
			idc = 20;
			x = "7 / 16";
			y = "4 / 9";
			w = "2 / 16";
			h = "1.5 / 9";
		};
		class Engine: Body
		{
			idc = 21;
			y = "2 / 9";
		};
		class Fuel: Body
		{
			idc = 22;
			y = "6 / 9";
		};
	};
};
class cfgMods
{
	author = "";
	timepacked = "1419181232";
};
//};
