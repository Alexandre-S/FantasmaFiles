////////////////////////////////////////////////////////////////////
//DeRap: Produced from mikero's Dos Tools Dll version 5.03
//Thu Aug 13 12:29:51 2015 : Source 'file' date Thu Aug 13 12:29:51 2015
//http://dev-heaven.net/projects/list_files/mikero-pbodll
////////////////////////////////////////////////////////////////////

#define _ARMA_

//Class cba_xeh : config.bin{
class CfgPatches
{
	class cba_xeh
	{
		units[] = {};
		weapons[] = {};
		worlds[] = {};
		requiredAddons[] = {"A3_Data_F","A3_Air_F","A3_Air_F_Beta"};
		requiredVersion = 1.41;
		version = "1.1.23.150604";
		versionStr = "1.1.23.150604";
		versionAr[] = {1,1,23,150604};
		author[] = {"CBA Team","Solus","Killswitch"};
		authorUrl = "http://dev-heaven.net/projects/cca";
	};
	class Extended_EventHandlers
	{
		units[] = {};
		weapons[] = {};
		worlds[] = {};
		requiredAddons[] = {"A3_Data_F","A3_Air_F","A3_Air_F_Beta"};
		requiredVersion = 1.41;
		version = "4.0.0";
		versionStr = "4.0.0";
		versionAr[] = {4,0,0};
		author[] = {"CBA Team","Solus","Killswitch"};
		authorUrl = "http://dev-heaven.net/projects/cca";
	};
	class CBA_Extended_EventHandlers
	{
		units[] = {};
		weapons[] = {};
		worlds[] = {};
		requiredAddons[] = {"A3_Data_F","A3_Air_F","A3_Air_F_Beta"};
		requiredVersion = 1.41;
		version = "1.1.23.150604";
		versionStr = "1.1.23.150604";
		versionAr[] = {1,1,23,150604};
		author[] = {"CBA Team","Solus","Killswitch"};
		authorUrl = "http://dev-heaven.net/projects/cca";
	};
};
class Extended_EventHandlers
{
	init = "_this call SLX_XEH_EH_Init";
	fired = "_this call SLX_XEH_EH_Fired";
	animChanged = "_this call SLX_XEH_EH_AnimChanged";
	animDone = "_this call SLX_XEH_EH_AnimDone";
	animStateChanged = "_this call SLX_XEH_EH_AnimStateChanged";
	containerClosed = "_this call SLX_XEH_EH_ContainerClosed";
	containerOpened = "_this call SLX_XEH_EH_ContainerOpened";
	controlsShifted = "_this call SLX_XEH_EH_ControlsShifted";
	dammaged = "_this call SLX_XEH_EH_Dammaged";
	engine = "_this call SLX_XEH_EH_Engine";
	epeContact = "_this call SLX_XEH_EH_EpeContact";
	epeContactEnd = "_this call SLX_XEH_EH_EpeContactEnd";
	epeContactStart = "_this call SLX_XEH_EH_EpeContactStart";
	explosion = "_this call SLX_XEH_EH_Explosion";
	firedNear = "_this call SLX_XEH_EH_FiredNear";
	fuel = "_this call SLX_XEH_EH_Fuel";
	gear = "_this call SLX_XEH_EH_Gear";
	getIn = "_this call SLX_XEH_EH_GetIn";
	getOut = "_this call SLX_XEH_EH_GetOut";
	handleHeal = "_this call SLX_XEH_EH_HandleHeal";
	hit = "_this call SLX_XEH_EH_Hit";
	hitPart = "_this call SLX_XEH_EH_HitPart";
	incomingMissile = "_this call SLX_XEH_EH_IncomingMissile";
	inventoryClosed = "_this call SLX_XEH_EH_InventoryClosed";
	inventoryOpened = "_this call SLX_XEH_EH_InventoryOpened";
	killed = "_this call SLX_XEH_EH_Killed";
	landedTouchDown = "_this call SLX_XEH_EH_LandedTouchDown";
	landedStopped = "_this call SLX_XEH_EH_LandedStopped";
	local = "_this call SLX_XEH_EH_Local";
	respawn = "_this call SLX_XEH_EH_Respawn";
	put = "_this call SLX_XEH_EH_Put";
	take = "_this call SLX_XEH_EH_Take";
	soundPlayed = "_this call SLX_XEH_EH_SoundPlayed";
	weaponAssembled = "_this call SLX_XEH_EH_WeaponAssembled";
	weaponDisAssembled = "_this call SLX_XEH_EH_WeaponDisassembled";
};
class Extended_PreInit_EventHandlers{};
class Extended_PostInit_EventHandlers{};
class Extended_InitPost_EventHandlers{};
class Extended_AnimChanged_EventHandlers{};
class Extended_AnimDone_EventHandlers{};
class Extended_AnimStateChanged_EventHandlers{};
class Extended_ContainerClosed_EventHandlers{};
class Extended_ContainerOpened_EventHandlers{};
class Extended_ControlsShifted_EventHandlers{};
class Extended_Dammaged_EventHandlers{};
class Extended_Engine_EventHandlers{};
class Extended_EpeContact_EventHandlers{};
class Extended_EpeContactEnd_EventHandlers{};
class Extended_EpeContactStart_EventHandlers{};
class Extended_Explosion_EventHandlers{};
class Extended_Fired_EventHandlers{};
class Extended_FiredBIS_EventHandlers{};
class Extended_FiredNear_EventHandlers{};
class Extended_Fuel_EventHandlers{};
class Extended_Gear_EventHandlers{};
class Extended_HandleDamage_EventHandlers{};
class Extended_HandleHeal_EventHandlers{};
class Extended_Hit_EventHandlers{};
class Extended_HitPart_EventHandlers{};
class Extended_Init_EventHandlers{};
class Extended_IncomingMissile_EventHandlers{};
class Extended_InventoryClosed_EventHandlers{};
class Extended_InventoryOpened_EventHandlers{};
class Extended_Killed_EventHandlers{};
class Extended_LandedTouchDown_EventHandlers{};
class Extended_LandedStopped_EventHandlers{};
class Extended_Local_EventHandlers{};
class Extended_Put_EventHandlers{};
class Extended_Take_EventHandlers{};
class Extended_SoundPlayed_EventHandlers{};
class Extended_WeaponAssembled_EventHandlers{};
class Extended_WeaponDisassembled_EventHandlers{};
class Extended_GetIn_EventHandlers
{
	class AllVehicles
	{
		class SLX_GetInMan
		{
			scope = 2;
			getIn = "_this call SLX_XEH_EH_GetInMan";
		};
	};
};
class Extended_GetOut_EventHandlers
{
	class AllVehicles
	{
		class SLX_GetOutMan
		{
			scope = 2;
			getOut = "_this call SLX_XEH_EH_GetOutMan";
		};
	};
};
class Extended_GetInMan_EventHandlers{};
class Extended_GetOutMan_EventHandlers{};
class Extended_Respawn_EventHandlers
{
	class CAManBase
	{
		class SLX_RespawnInit
		{
			scope = 2;
			respawn = "_this call SLX_XEH_EH_RespawnInit";
		};
	};
};
class DefaultEventhandlers;
class Default_Extended_Eventhandlers: DefaultEventhandlers
{
	init = "_this call SLX_XEH_EH_Init";
	fired = "_this call SLX_XEH_EH_Fired";
	animChanged = "_this call SLX_XEH_EH_AnimChanged";
	animDone = "_this call SLX_XEH_EH_AnimDone";
	animStateChanged = "_this call SLX_XEH_EH_AnimStateChanged";
	containerClosed = "_this call SLX_XEH_EH_ContainerClosed";
	containerOpened = "_this call SLX_XEH_EH_ContainerOpened";
	controlsShifted = "_this call SLX_XEH_EH_ControlsShifted";
	dammaged = "_this call SLX_XEH_EH_Dammaged";
	engine = "_this call SLX_XEH_EH_Engine";
	epeContact = "_this call SLX_XEH_EH_EpeContact";
	epeContactEnd = "_this call SLX_XEH_EH_EpeContactEnd";
	epeContactStart = "_this call SLX_XEH_EH_EpeContactStart";
	explosion = "_this call SLX_XEH_EH_Explosion";
	firedNear = "_this call SLX_XEH_EH_FiredNear";
	fuel = "_this call SLX_XEH_EH_Fuel";
	gear = "_this call SLX_XEH_EH_Gear";
	getIn = "_this call SLX_XEH_EH_GetIn";
	getOut = "_this call SLX_XEH_EH_GetOut";
	handleHeal = "_this call SLX_XEH_EH_HandleHeal";
	hit = "_this call SLX_XEH_EH_Hit";
	hitPart = "_this call SLX_XEH_EH_HitPart";
	incomingMissile = "_this call SLX_XEH_EH_IncomingMissile";
	inventoryClosed = "_this call SLX_XEH_EH_InventoryClosed";
	inventoryOpened = "_this call SLX_XEH_EH_InventoryOpened";
	killed = "_this call SLX_XEH_EH_Killed";
	landedTouchDown = "_this call SLX_XEH_EH_LandedTouchDown";
	landedStopped = "_this call SLX_XEH_EH_LandedStopped";
	local = "_this call SLX_XEH_EH_Local";
	respawn = "_this call SLX_XEH_EH_Respawn";
	put = "_this call SLX_XEH_EH_Put";
	take = "_this call SLX_XEH_EH_Take";
	soundPlayed = "_this call SLX_XEH_EH_SoundPlayed";
	weaponAssembled = "_this call SLX_XEH_EH_WeaponAssembled";
	weaponDisAssembled = "_this call SLX_XEH_EH_WeaponDisassembled";
};
class CfgFunctions
{
	class CBA
	{
		class XEH
		{
			class initXEH
			{
				preInit = 1;
				file = "\x\cba\addons\xeh\init_pre.sqf";
			};
		};
	};
};
class CfgVehicles
{
	class All
	{
		class EventHandlers
		{
			init = "_this call SLX_XEH_EH_Init";
			fired = "_this call SLX_XEH_EH_Fired";
			animChanged = "_this call SLX_XEH_EH_AnimChanged";
			animDone = "_this call SLX_XEH_EH_AnimDone";
			animStateChanged = "_this call SLX_XEH_EH_AnimStateChanged";
			containerClosed = "_this call SLX_XEH_EH_ContainerClosed";
			containerOpened = "_this call SLX_XEH_EH_ContainerOpened";
			controlsShifted = "_this call SLX_XEH_EH_ControlsShifted";
			dammaged = "_this call SLX_XEH_EH_Dammaged";
			engine = "_this call SLX_XEH_EH_Engine";
			epeContact = "_this call SLX_XEH_EH_EpeContact";
			epeContactEnd = "_this call SLX_XEH_EH_EpeContactEnd";
			epeContactStart = "_this call SLX_XEH_EH_EpeContactStart";
			explosion = "_this call SLX_XEH_EH_Explosion";
			firedNear = "_this call SLX_XEH_EH_FiredNear";
			fuel = "_this call SLX_XEH_EH_Fuel";
			gear = "_this call SLX_XEH_EH_Gear";
			getIn = "_this call SLX_XEH_EH_GetIn";
			getOut = "_this call SLX_XEH_EH_GetOut";
			handleHeal = "_this call SLX_XEH_EH_HandleHeal";
			hit = "_this call SLX_XEH_EH_Hit";
			hitPart = "_this call SLX_XEH_EH_HitPart";
			incomingMissile = "_this call SLX_XEH_EH_IncomingMissile";
			inventoryClosed = "_this call SLX_XEH_EH_InventoryClosed";
			inventoryOpened = "_this call SLX_XEH_EH_InventoryOpened";
			killed = "_this call SLX_XEH_EH_Killed";
			landedTouchDown = "_this call SLX_XEH_EH_LandedTouchDown";
			landedStopped = "_this call SLX_XEH_EH_LandedStopped";
			local = "_this call SLX_XEH_EH_Local";
			respawn = "_this call SLX_XEH_EH_Respawn";
			put = "_this call SLX_XEH_EH_Put";
			take = "_this call SLX_XEH_EH_Take";
			soundPlayed = "_this call SLX_XEH_EH_SoundPlayed";
			weaponAssembled = "_this call SLX_XEH_EH_WeaponAssembled";
			weaponDisAssembled = "_this call SLX_XEH_EH_WeaponDisassembled";
		};
	};
	class ArtilleryTarget: All
	{
		class EventHandlers{};
		SLX_XEH_DISABLED = 1;
	};
	class FireSectorTarget: All
	{
		class EventHandlers{};
		SLX_XEH_DISABLED = 1;
	};
	class LaserTarget: All
	{
		class EventHandlers{};
		SLX_XEH_DISABLED = 1;
	};
	class NVTarget: All
	{
		class EventHandlers{};
		SLX_XEH_DISABLED = 1;
	};
	class Static: All
	{
		class EventHandlers{};
		SLX_XEH_DISABLED = 1;
	};
	class Thing: All
	{
		class EventHandlers{};
		SLX_XEH_DISABLED = 1;
	};
	class Strategic;
	class ReammoBox: Strategic
	{
		class EventHandlers
		{
			init = "_this call SLX_XEH_EH_Init";
			fired = "_this call SLX_XEH_EH_Fired";
			animChanged = "_this call SLX_XEH_EH_AnimChanged";
			animDone = "_this call SLX_XEH_EH_AnimDone";
			animStateChanged = "_this call SLX_XEH_EH_AnimStateChanged";
			containerClosed = "_this call SLX_XEH_EH_ContainerClosed";
			containerOpened = "_this call SLX_XEH_EH_ContainerOpened";
			controlsShifted = "_this call SLX_XEH_EH_ControlsShifted";
			dammaged = "_this call SLX_XEH_EH_Dammaged";
			engine = "_this call SLX_XEH_EH_Engine";
			epeContact = "_this call SLX_XEH_EH_EpeContact";
			epeContactEnd = "_this call SLX_XEH_EH_EpeContactEnd";
			epeContactStart = "_this call SLX_XEH_EH_EpeContactStart";
			explosion = "_this call SLX_XEH_EH_Explosion";
			firedNear = "_this call SLX_XEH_EH_FiredNear";
			fuel = "_this call SLX_XEH_EH_Fuel";
			gear = "_this call SLX_XEH_EH_Gear";
			getIn = "_this call SLX_XEH_EH_GetIn";
			getOut = "_this call SLX_XEH_EH_GetOut";
			handleHeal = "_this call SLX_XEH_EH_HandleHeal";
			hit = "_this call SLX_XEH_EH_Hit";
			hitPart = "_this call SLX_XEH_EH_HitPart";
			incomingMissile = "_this call SLX_XEH_EH_IncomingMissile";
			inventoryClosed = "_this call SLX_XEH_EH_InventoryClosed";
			inventoryOpened = "_this call SLX_XEH_EH_InventoryOpened";
			killed = "_this call SLX_XEH_EH_Killed";
			landedTouchDown = "_this call SLX_XEH_EH_LandedTouchDown";
			landedStopped = "_this call SLX_XEH_EH_LandedStopped";
			local = "_this call SLX_XEH_EH_Local";
			respawn = "_this call SLX_XEH_EH_Respawn";
			put = "_this call SLX_XEH_EH_Put";
			take = "_this call SLX_XEH_EH_Take";
			soundPlayed = "_this call SLX_XEH_EH_SoundPlayed";
			weaponAssembled = "_this call SLX_XEH_EH_WeaponAssembled";
			weaponDisAssembled = "_this call SLX_XEH_EH_WeaponDisassembled";
		};
		delete SLX_XEH_DISABLED;
	};
	class Air;
	class Helicopter: Air
	{
		class Eventhandlers: DefaultEventhandlers
		{
			init = "_this call SLX_XEH_EH_Init";
			fired = "_this call SLX_XEH_EH_Fired";
			animChanged = "_this call SLX_XEH_EH_AnimChanged";
			animDone = "_this call SLX_XEH_EH_AnimDone";
			animStateChanged = "_this call SLX_XEH_EH_AnimStateChanged";
			containerClosed = "_this call SLX_XEH_EH_ContainerClosed";
			containerOpened = "_this call SLX_XEH_EH_ContainerOpened";
			controlsShifted = "_this call SLX_XEH_EH_ControlsShifted";
			dammaged = "_this call SLX_XEH_EH_Dammaged";
			engine = "_this call SLX_XEH_EH_Engine";
			epeContact = "_this call SLX_XEH_EH_EpeContact";
			epeContactEnd = "_this call SLX_XEH_EH_EpeContactEnd";
			epeContactStart = "_this call SLX_XEH_EH_EpeContactStart";
			explosion = "_this call SLX_XEH_EH_Explosion";
			firedNear = "_this call SLX_XEH_EH_FiredNear";
			fuel = "_this call SLX_XEH_EH_Fuel";
			gear = "_this call SLX_XEH_EH_Gear";
			getIn = "_this call SLX_XEH_EH_GetIn";
			getOut = "_this call SLX_XEH_EH_GetOut";
			handleHeal = "_this call SLX_XEH_EH_HandleHeal";
			hit = "_this call SLX_XEH_EH_Hit";
			hitPart = "_this call SLX_XEH_EH_HitPart";
			incomingMissile = "_this call SLX_XEH_EH_IncomingMissile";
			inventoryClosed = "_this call SLX_XEH_EH_InventoryClosed";
			inventoryOpened = "_this call SLX_XEH_EH_InventoryOpened";
			killed = "_this call SLX_XEH_EH_Killed";
			landedTouchDown = "_this call SLX_XEH_EH_LandedTouchDown";
			landedStopped = "_this call SLX_XEH_EH_LandedStopped";
			local = "_this call SLX_XEH_EH_Local";
			respawn = "_this call SLX_XEH_EH_Respawn";
			put = "_this call SLX_XEH_EH_Put";
			take = "_this call SLX_XEH_EH_Take";
			soundPlayed = "_this call SLX_XEH_EH_SoundPlayed";
			weaponAssembled = "_this call SLX_XEH_EH_WeaponAssembled";
			weaponDisAssembled = "_this call SLX_XEH_EH_WeaponDisassembled";
		};
	};
	class ParachuteBase: Helicopter
	{
		class EventHandlers{};
		SLX_XEH_DISABLED = 1;
	};
	class Plane: Air
	{
		class Eventhandlers: DefaultEventhandlers
		{
			init = "_this call SLX_XEH_EH_Init";
			fired = "_this call SLX_XEH_EH_Fired";
			animChanged = "_this call SLX_XEH_EH_AnimChanged";
			animDone = "_this call SLX_XEH_EH_AnimDone";
			animStateChanged = "_this call SLX_XEH_EH_AnimStateChanged";
			containerClosed = "_this call SLX_XEH_EH_ContainerClosed";
			containerOpened = "_this call SLX_XEH_EH_ContainerOpened";
			controlsShifted = "_this call SLX_XEH_EH_ControlsShifted";
			dammaged = "_this call SLX_XEH_EH_Dammaged";
			engine = "_this call SLX_XEH_EH_Engine";
			epeContact = "_this call SLX_XEH_EH_EpeContact";
			epeContactEnd = "_this call SLX_XEH_EH_EpeContactEnd";
			epeContactStart = "_this call SLX_XEH_EH_EpeContactStart";
			explosion = "_this call SLX_XEH_EH_Explosion";
			firedNear = "_this call SLX_XEH_EH_FiredNear";
			fuel = "_this call SLX_XEH_EH_Fuel";
			gear = "_this call SLX_XEH_EH_Gear";
			getIn = "_this call SLX_XEH_EH_GetIn";
			getOut = "_this call SLX_XEH_EH_GetOut";
			handleHeal = "_this call SLX_XEH_EH_HandleHeal";
			hit = "_this call SLX_XEH_EH_Hit";
			hitPart = "_this call SLX_XEH_EH_HitPart";
			incomingMissile = "_this call SLX_XEH_EH_IncomingMissile";
			inventoryClosed = "_this call SLX_XEH_EH_InventoryClosed";
			inventoryOpened = "_this call SLX_XEH_EH_InventoryOpened";
			killed = "_this call SLX_XEH_EH_Killed";
			landedTouchDown = "_this call SLX_XEH_EH_LandedTouchDown";
			landedStopped = "_this call SLX_XEH_EH_LandedStopped";
			local = "_this call SLX_XEH_EH_Local";
			respawn = "_this call SLX_XEH_EH_Respawn";
			put = "_this call SLX_XEH_EH_Put";
			take = "_this call SLX_XEH_EH_Take";
			soundPlayed = "_this call SLX_XEH_EH_SoundPlayed";
			weaponAssembled = "_this call SLX_XEH_EH_WeaponAssembled";
			weaponDisAssembled = "_this call SLX_XEH_EH_WeaponDisassembled";
		};
	};
	class StaticWeapon;
	class StaticCannon: StaticWeapon
	{
		delete EventHandlers;
	};
	class Logic;
	class SLX_XEH_Logic: Logic
	{
		displayName = "XEH (backup) Initialization Logic";
		vehicleClass = "Modules";
		class EventHandlers
		{
			init = "_this call SLX_XEH_EH_Init";
			fired = "_this call SLX_XEH_EH_Fired";
			animChanged = "_this call SLX_XEH_EH_AnimChanged";
			animDone = "_this call SLX_XEH_EH_AnimDone";
			animStateChanged = "_this call SLX_XEH_EH_AnimStateChanged";
			containerClosed = "_this call SLX_XEH_EH_ContainerClosed";
			containerOpened = "_this call SLX_XEH_EH_ContainerOpened";
			controlsShifted = "_this call SLX_XEH_EH_ControlsShifted";
			dammaged = "_this call SLX_XEH_EH_Dammaged";
			engine = "_this call SLX_XEH_EH_Engine";
			epeContact = "_this call SLX_XEH_EH_EpeContact";
			epeContactEnd = "_this call SLX_XEH_EH_EpeContactEnd";
			epeContactStart = "_this call SLX_XEH_EH_EpeContactStart";
			explosion = "_this call SLX_XEH_EH_Explosion";
			firedNear = "_this call SLX_XEH_EH_FiredNear";
			fuel = "_this call SLX_XEH_EH_Fuel";
			gear = "_this call SLX_XEH_EH_Gear";
			getIn = "_this call SLX_XEH_EH_GetIn";
			getOut = "_this call SLX_XEH_EH_GetOut";
			handleHeal = "_this call SLX_XEH_EH_HandleHeal";
			hit = "_this call SLX_XEH_EH_Hit";
			hitPart = "_this call SLX_XEH_EH_HitPart";
			incomingMissile = "_this call SLX_XEH_EH_IncomingMissile";
			inventoryClosed = "_this call SLX_XEH_EH_InventoryClosed";
			inventoryOpened = "_this call SLX_XEH_EH_InventoryOpened";
			killed = "_this call SLX_XEH_EH_Killed";
			landedTouchDown = "_this call SLX_XEH_EH_LandedTouchDown";
			landedStopped = "_this call SLX_XEH_EH_LandedStopped";
			local = "_this call SLX_XEH_EH_Local";
			respawn = "_this call SLX_XEH_EH_Respawn";
			put = "_this call SLX_XEH_EH_Put";
			take = "_this call SLX_XEH_EH_Take";
			soundPlayed = "_this call SLX_XEH_EH_SoundPlayed";
			weaponAssembled = "_this call SLX_XEH_EH_WeaponAssembled";
			weaponDisAssembled = "_this call SLX_XEH_EH_WeaponDisassembled";
		};
	};
};
//};
