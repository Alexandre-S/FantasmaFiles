////////////////////////////////////////////////////////////////////
//DeRap: Produced from mikero's Dos Tools Dll version 4.52
//Wed Jan 07 21:17:57 2015 : Source 'file' date Wed Jan 07 21:17:57 2015
//http://dev-heaven.net/projects/list_files/mikero-pbodll
////////////////////////////////////////////////////////////////////

#define _ARMA_

//Class C:/Users/sil/Documents/GitHub/altislife/@agm/addons/agm_captives/config.bin{
class CfgPatches
{
	class AGM_Captives
	{
		units[] = {};
		weapons[] = {"AGM_CableTie"};
		requiredVersion = 0.6;
		requiredAddons[] = {"AGM_Core","AGM_Interaction"};
		version = "0.95";
		versionStr = "0.95";
		versionAr[] = {0,95,0};
		author[] = {"commy2","KoffeinFlummi"};
		authorUrl = "https://github.com/commy2/";
	};
};
class CfgFunctions
{
	class AGM_Captives
	{
		class AGM_Captives
		{
			file = "\AGM_Captives\functions";
			class canFriskPerson;
			class canLoadCaptive;
			class canUnloadCaptive;
			class escortCaptive;
			class handleGetOut;
			class handleKnockedOut;
			class handlePlayerChanged;
			class handleWokeUp;
			class initPost;
			class initUnit;
			class loadCaptive;
			class openFriskMenu;
			class setCaptive;
			class surrender;
			class unloadCaptive;
		};
	};
};
class Extended_GetIn_EventHandlers
{
	class All
	{
		class AGM_Captives_AutoDetachCaptive
		{
			getIn = "if (local (_this select 2) && {(_this select 2) getVariable ['AGM_isEscorting', false]}) then {(_this select 2) setVariable ['AGM_isEscorting', false, true]}";
		};
	};
};
class Extended_GetOut_EventHandlers
{
	class All
	{
		class AGM_Captives_LeaveVehicle
		{
			getOut = "if (local (_this select 2) && {(_this select 2) getVariable ['AGM_isCaptive', false]}) then {_this call AGM_Captives_fnc_handleGetOut}";
		};
	};
};
class Extended_Killed_EventHandlers
{
	class CAManBase
	{
		class AGM_Captives_AutoDetachCaptive
		{
			killed = "if ((_this select 0) getVariable ['AGM_isCaptive', false]) then {(_this select 0) setVariable ['AGM_isCaptive', false, true]}; if ((_this select 0) getVariable ['AGM_isEscorting', false]) then {(_this select 0) setVariable ['AGM_isEscorting', false, true]};";
		};
	};
};
class Extended_Init_EventHandlers
{
	class CAManBase
	{
		class AGM_Captives_AutoDetachCaptive
		{
			init = "_this call AGM_Captives_fnc_initUnit";
		};
	};
};
class Extended_InitPost_EventHandlers
{
	class CAManBase
	{
		class AGM_Captives_InitPost
		{
			init = "if (local (_this select 0)) then {_this call AGM_Captives_fnc_initPost};";
		};
	};
};
class Extended_PostInit_EventHandlers
{
	class AGM_Captives
	{
		clientInit = "call compile preprocessFileLineNumbers '\AGM_Captives\clientInit.sqf'";
	};
};
class AGM_Core_canInteractConditions
{
	class AGM_Interaction_isNotEscorting
	{
		condition = "!(_player getVariable ['AGM_isEscorting', false])";
	};
	class AGM_Interaction_isNotCaptive
	{
		condition = "!(_player getVariable ['AGM_isCaptive', false])";
	};
	class AGM_Interaction_isNotSurrendering
	{
		condition = "!(_player getVariable ['AGM_isSurrender', false])";
	};
};
class CfgVehicles
{
	class Man;
	class CAManBase: Man
	{
		class AGM_Actions
		{
			class AGM_SetCaptive
			{
				displayName = "$STR_AGM_Captives_SetCaptive";
				distance = 4;
				condition = "'AGM_CableTie' in items _player && {alive _target} && {!(_target getVariable ['AGM_isCaptive', false])}";
				statement = "player removeItem 'AGM_CableTie'; [_target, true] call AGM_Captives_fnc_setCaptive";
				showDisabled = 0;
				priority = 2.4;
				icon = "\AGM_Captives\UI\handcuff_ca.paa";
				hotkey = "C";
			};
			class AGM_ReleaseCaptive
			{
				displayName = "$STR_AGM_Captives_ReleaseCaptive";
				distance = 4;
				condition = "_target getVariable ['AGM_isCaptive', false] && {isNull (attachedTo _target)}";
				statement = "[_target, false] call AGM_Captives_fnc_setCaptive";
				exceptions[] = {"AGM_Interaction_isNotEscorting"};
				showDisabled = 0;
				priority = 2.4;
				icon = "\AGM_Captives\UI\handcuff_ca.paa";
				hotkey = "R";
			};
			class AGM_EscortCaptive
			{
				displayName = "$STR_AGM_Captives_EscortCaptive";
				distance = 4;
				condition = "_target getVariable ['AGM_isCaptive', false] && {isNull (attachedTo _target)} && {alive _target} && {!(_target getVariable ['AGM_isUnconscious', false])}";
				statement = "[_target, true] call AGM_Captives_fnc_escortCaptive";
				exceptions[] = {"AGM_Interaction_isNotEscorting"};
				showDisabled = 0;
				icon = "\AGM_Captives\UI\captive_ca.paa";
				priority = 2.3;
				hotkey = "E";
			};
			class AGM_StopEscorting
			{
				displayName = "$STR_AGM_Captives_StopEscorting";
				distance = 4;
				condition = "_target getVariable ['AGM_isCaptive', false] && {_target in attachedObjects _player}";
				statement = "[_target, false] call AGM_Captives_fnc_escortCaptive";
				exceptions[] = {"AGM_Interaction_isNotEscorting"};
				showDisabled = 0;
				icon = "\AGM_Captives\UI\captive_ca.paa";
				priority = 2.3;
				hotkey = "E";
			};
			class AGM_LoadCaptive
			{
				displayName = "$STR_AGM_Captives_LoadCaptive";
				distance = 4;
				condition = "[_player, _target, objNull] call AGM_Captives_fnc_canLoadCaptive";
				statement = "[_player, _target, objNull] call AGM_Captives_fnc_loadCaptive";
				exceptions[] = {"AGM_Interaction_isNotEscorting"};
				showDisabled = 0;
				icon = "\AGM_Captives\UI\captive_ca.paa";
				priority = 2.2;
				hotkey = "L";
			};
			class AGM_FriskPerson
			{
				displayName = "$STR_AGM_Captives_FriskPerson";
				distance = 2;
				condition = "[_player, _target] call AGM_Captives_fnc_canFriskPerson";
				statement = "[_player, _target] call AGM_Captives_fnc_openFriskMenu";
				showDisabled = 0;
				priority = 3;
				hotkey = "F";
			};
		};
		class AGM_SelfActions
		{
			class AGM_StopEscortingSelf
			{
				displayName = "$STR_AGM_Captives_StopEscorting";
				condition = "(_player getVariable ['AGM_escortedUnit', objNull]) getVariable ['AGM_isCaptive', false] && {(_player getVariable ['AGM_escortedUnit', objNull]) in attachedObjects _player}";
				statement = "[_player getVariable ['AGM_escortedUnit', objNull], false] call AGM_Captives_fnc_escortCaptive;";
				exceptions[] = {"AGM_Interaction_isNotEscorting"};
				showDisabled = 0;
				priority = 2.3;
				hotkey = "C";
			};
		};
	};
	class LandVehicle;
	class Car: LandVehicle
	{
		class AGM_Actions
		{
			class AGM_LoadCaptive
			{
				displayName = "$STR_AGM_Captives_LoadCaptive";
				distance = 4;
				condition = "[_player, objNull, _target] call AGM_Captives_fnc_canLoadCaptive";
				statement = "[_player, objNull, _target] call AGM_Captives_fnc_loadCaptive";
				exceptions[] = {"AGM_Interaction_isNotEscorting"};
				showDisabled = 0;
				priority = 1.2;
				hotkey = "L";
			};
			class AGM_UnloadCaptive
			{
				displayName = "$STR_AGM_Captives_UnloadCaptive";
				distance = 4;
				condition = "[_player, _target] call AGM_Captives_fnc_canUnloadCaptive";
				statement = "[_player, _target] call AGM_Captives_fnc_unloadCaptive";
				showDisabled = 0;
				priority = 1.2;
				hotkey = "C";
			};
		};
	};
	class Tank: LandVehicle
	{
		class AGM_Actions
		{
			class AGM_LoadCaptive
			{
				displayName = "$STR_AGM_Captives_LoadCaptive";
				distance = 4;
				condition = "[_player, objNull, _target] call AGM_Captives_fnc_canLoadCaptive";
				statement = "[_player, objNull, _target] call AGM_Captives_fnc_loadCaptive";
				exceptions[] = {"AGM_Interaction_isNotEscorting"};
				showDisabled = 0;
				priority = 1.2;
				hotkey = "L";
			};
			class AGM_UnloadCaptive
			{
				displayName = "$STR_AGM_Captives_UnloadCaptive";
				distance = 4;
				condition = "[_player, _target] call AGM_Captives_fnc_canUnloadCaptive";
				statement = "[_player, _target] call AGM_Captives_fnc_unloadCaptive";
				showDisabled = 0;
				priority = 1.2;
				hotkey = "C";
			};
		};
	};
	class Air;
	class Helicopter: Air
	{
		class AGM_Actions
		{
			class AGM_LoadCaptive
			{
				displayName = "$STR_AGM_Captives_LoadCaptive";
				distance = 4;
				condition = "[_player, objNull, _target] call AGM_Captives_fnc_canLoadCaptive";
				statement = "[_player, objNull, _target] call AGM_Captives_fnc_loadCaptive";
				exceptions[] = {"AGM_Interaction_isNotEscorting"};
				showDisabled = 0;
				priority = 1.2;
				hotkey = "L";
			};
			class AGM_UnloadCaptive
			{
				displayName = "$STR_AGM_Captives_UnloadCaptive";
				distance = 4;
				condition = "[_player, _target] call AGM_Captives_fnc_canUnloadCaptive";
				statement = "[_player, _target] call AGM_Captives_fnc_unloadCaptive";
				showDisabled = 0;
				priority = 1.2;
				hotkey = "C";
			};
		};
	};
	class Plane: Air
	{
		class AGM_Actions
		{
			class AGM_LoadCaptive
			{
				displayName = "$STR_AGM_Captives_LoadCaptive";
				distance = 4;
				condition = "[_player, objNull, _target] call AGM_Captives_fnc_canLoadCaptive";
				statement = "[_player, objNull, _target] call AGM_Captives_fnc_loadCaptive";
				exceptions[] = {"AGM_Interaction_isNotEscorting"};
				showDisabled = 0;
				priority = 1.2;
				hotkey = "L";
			};
			class AGM_UnloadCaptive
			{
				displayName = "$STR_AGM_Captives_UnloadCaptive";
				distance = 4;
				condition = "[_player, _target] call AGM_Captives_fnc_canUnloadCaptive";
				statement = "[_player, _target] call AGM_Captives_fnc_unloadCaptive";
				showDisabled = 0;
				priority = 1.2;
				hotkey = "C";
			};
		};
	};
	class Ship;
	class Ship_F: Ship
	{
		class AGM_Actions
		{
			class AGM_LoadCaptive
			{
				displayName = "$STR_AGM_Captives_LoadCaptive";
				distance = 4;
				condition = "[_player, objNull, _target] call AGM_Captives_fnc_canLoadCaptive";
				statement = "[_player, objNull, _target] call AGM_Captives_fnc_loadCaptive";
				exceptions[] = {"AGM_Interaction_isNotEscorting"};
				showDisabled = 0;
				priority = 1.2;
				hotkey = "L";
			};
			class AGM_UnloadCaptive
			{
				displayName = "$STR_AGM_Captives_UnloadCaptive";
				distance = 4;
				condition = "[_player, _target] call AGM_Captives_fnc_canUnloadCaptive";
				statement = "[_player, _target] call AGM_Captives_fnc_unloadCaptive";
				showDisabled = 0;
				priority = 1.2;
				hotkey = "C";
			};
		};
	};
	class StaticWeapon: LandVehicle
	{
		class AGM_Actions
		{
			class AGM_LoadCaptive
			{
				displayName = "$STR_AGM_Captives_LoadCaptive";
				distance = 4;
				condition = "[_player, objNull, _target] call AGM_Captives_fnc_canLoadCaptive";
				statement = "[_player, objNull, _target] call AGM_Captives_fnc_loadCaptive";
				exceptions[] = {"AGM_Interaction_isNotEscorting"};
				showDisabled = 0;
				priority = 1.2;
				hotkey = "L";
			};
			class AGM_UnloadCaptive
			{
				displayName = "$STR_AGM_Captives_UnloadCaptive";
				distance = 4;
				condition = "[_player, _target] call AGM_Captives_fnc_canUnloadCaptive";
				statement = "[_player, _target] call AGM_Captives_fnc_unloadCaptive";
				showDisabled = 0;
				priority = 1.2;
				hotkey = "C";
			};
		};
	};
	class StaticMortar;
	class Mortar_01_base_F: StaticMortar
	{
		class AGM_Actions
		{
			class AGM_LoadCaptive
			{
				displayName = "$STR_AGM_Captives_LoadCaptive";
				distance = 4;
				condition = "[_player, objNull, _target] call AGM_Captives_fnc_canLoadCaptive";
				statement = "[_player, objNull, _target] call AGM_Captives_fnc_loadCaptive";
				exceptions[] = {"AGM_Interaction_isNotEscorting"};
				showDisabled = 0;
				priority = 1.2;
				hotkey = "L";
			};
			class AGM_UnloadCaptive
			{
				displayName = "$STR_AGM_Captives_UnloadCaptive";
				distance = 4;
				condition = "[_player, _target] call AGM_Captives_fnc_canUnloadCaptive";
				statement = "[_player, _target] call AGM_Captives_fnc_unloadCaptive";
				showDisabled = 0;
				priority = 1.2;
				hotkey = "C";
			};
		};
	};
	class Box_NATO_Support_F;
	class AGM_Box_Misc: Box_NATO_Support_F
	{
		class TransportItems
		{
			class _xx_AGM_CableTie
			{
				name = "AGM_CableTie";
				count = 12;
			};
		};
	};
};
class CfgWeapons
{
	class AGM_ItemCore;
	class InventoryItem_Base_F;
	class AGM_CableTie: AGM_ItemCore
	{
		displayName = "$STR_AGM_Captives_CableTie";
		descriptionShort = "$STR_AGM_Captives_CableTieDescription";
		model = "\AGM_Captives\agm_cabletie.p3d";
		picture = "\AGM_Captives\UI\agm_cabletie_x_ca.paa";
		scope = 2;
		class ItemInfo: InventoryItem_Base_F
		{
			mass = 1;
		};
	};
};
class CfgMovesBasic
{
	class Actions
	{
		class CivilStandActions;
		class AGM_CivilStandCaptiveActions: CivilStandActions
		{
			turnL = "";
			turnR = "";
			stop = "AGM_AmovPercMstpScapWnonDnon";
			StopRelaxed = "AGM_AmovPercMstpScapWnonDnon";
			default = "AGM_AmovPercMstpScapWnonDnon";
			getOver = "";
			throwPrepare = "";
			throwGrenade[] = {"","Gesture"};
		};
	};
};
class CfgMovesMaleSdr: CfgMovesBasic
{
	class StandBase;
	class States
	{
		class AmovPercMstpSnonWnonDnon: StandBase
		{
			[] += {};
		};
		class CutSceneAnimationBase;
		class AGM_AmovPercMstpSnonWnonDnon_AmovPercMstpScapWnonDnon: CutSceneAnimationBase
		{
			actions = "AGM_CivilStandCaptiveActions";
			file = "\A3\anims_f\Data\Anim\Sdr\mov\erc\stp\non\non\AmovPercMstpSnonWnonDnon_EaseIn";
			speed = 1;
			looped = 0;
			interpolationRestart = 2;
			ConnectTo[] = {"AGM_AmovPercMstpScapWnonDnon",0.1};
			InterpolateTo[] = {"Unconscious",0.01,"AGM_AmovPercMstpScapWnonDnon_AmovPercMstpSnonWnonDnon",0.1};
		};
		class AGM_AmovPercMstpScapWnonDnon: AGM_AmovPercMstpSnonWnonDnon_AmovPercMstpScapWnonDnon
		{
			file = "\A3\anims_f\Data\Anim\Sdr\mov\erc\stp\non\non\AmovPercMstpSnonWnonDnon_Ease";
			speed = 0;
			ConnectTo[] = {"AGM_AmovPercMstpScapWnonDnon_AmovPercMstpSnonWnonDnon",0.1};
			InterpolateTo[] = {"Unconscious",0.01};
			looped = 1;
		};
		class AGM_AmovPercMstpScapWnonDnon_AmovPercMstpSnonWnonDnon: AGM_AmovPercMstpSnonWnonDnon_AmovPercMstpScapWnonDnon
		{
			actions = "CivilStandActions";
			file = "\A3\anims_f\Data\Anim\Sdr\mov\erc\stp\non\non\amovpercmstpsnonwnondnon_easeout";
			ConnectTo[] = {"AmovPercMstpSnonWnonDnon",0.1};
			InterpolateTo[] = {"Unconscious",0.01,"AGM_AmovPercMstpSnonWnonDnon_AmovPercMstpScapWnonDnon",0.1};
		};
	};
};
class cfgMods
{
	author = "";
	timepacked = "1419181200";
};
//};
