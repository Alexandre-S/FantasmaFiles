////////////////////////////////////////////////////////////////////
//DeRap: Produced from mikero's Dos Tools Dll version 4.97
//Tue Aug 18 13:03:47 2015 : Source 'file' date Tue Aug 18 13:03:47 2015
//http://dev-heaven.net/projects/list_files/mikero-pbodll
////////////////////////////////////////////////////////////////////

#define _ARMA_

//Class ace_common : config.bin{
class CfgPatches
{
	class ace_common
	{
		units[] = {"ACE_Box_Misc","ACE_bananaItem","ACE_ModuleCheckPBOs","ACE_ModuleLSDVehicles","ACE_LogicDummy","ACE_Headbug_Fix"};
		weapons[] = {"ACE_ItemCore","ACE_FakePrimaryWeapon","ACE_Banana"};
		requiredVersion = 0.5;
		requiredAddons[] = {"ace_main","ace_modules"};
		author[] = {"KoffeinFlummi"};
		authorUrl = "https://github.com/KoffeinFlummi/";
		version = "3.2.1.0";
		versionStr = "3.2.1.0";
		versionAr[] = {3,2,1,0};
		magazines[] = {};
	};
};
class Extended_PreInit_EventHandlers
{
	class ace_common
	{
		init = "call compile preProcessFileLineNumbers '\z\ace\addons\common\XEH_preInit.sqf'";
		disableModuload = 1;
	};
};
class Extended_PostInit_EventHandlers
{
	class ace_common
	{
		init = "call compile preProcessFileLineNumbers '\z\ace\addons\common\XEH_postInit.sqf'";
		disableModuload = 1;
	};
};
class Extended_InitPost_EventHandlers
{
	class All
	{
		class ace_common_executePersistent
		{
			init = "[_this select 0] call ace_common_fnc_executePersistent";
		};
	};
	class CAManBase
	{
		class ace_common_setName
		{
			init = "if (local (_this select 0)) then {_this call ace_common_fnc_setName};";
		};
		class ace_common_forceWalk
		{
			init = "_this call ace_common_fnc_applyForceWalkStatus";
		};
		class ace_common_muteUnit
		{
			init = "_this call ace_common_fnc_muteUnitHandleInitPost";
		};
	};
};
class Extended_Respawn_EventHandlers
{
	class All
	{
		class ace_common_restoreVariablesJIP
		{
			respawn = "_this call ace_common_fnc_restoreVariablesJIP";
		};
		class ace_common_setName
		{
			respawn = "_this call ace_common_fnc_setName";
		};
		class ace_common_RESETDefaults
		{
			respawn = "_this call ace_common_fnc_resetAllDefaults";
		};
	};
	class CAManBase
	{
		class ace_common_muteUnit
		{
			respawn = "_this call ace_common_fnc_muteUnitHandleRespawn";
		};
	};
};
class CfgSounds
{
	class ACE_Sound_Click
	{
		sound[] = {"\z\ace\addons\common\sounds\ACE_click.wav",1,1,200};
		titles[] = {};
	};
};
class CfgVehicles
{
	class Logic;
	class Module_F: Logic
	{
		class ModuleDescription;
	};
	class ACE_Module: Module_F{};
	class ACE_ModuleCheckPBOs: ACE_Module
	{
		author = "$STR_ace_common_ACETeam";
		category = "ACE";
		displayName = "$STR_ace_common_CheckPBO_DisplayName";
		function = "ace_common_fnc_moduleCheckPBOs";
		scope = 2;
		isGlobal = 1;
		icon = "\z\ace\addons\common\UI\Icon_Module_CheckPBO_ca.paa";
		class Arguments
		{
			class Action
			{
				displayName = "$STR_ace_common_CheckPBO_Action_DisplayName";
				description = "$STR_ace_common_CheckPBO_Action_Description";
				typeName = "NUMBER";
				class values
				{
					class WarnOnce
					{
						default = 1;
						name = "$STR_ace_common_CheckPBO_Action_WarnOnce";
						value = 0;
					};
					class Warn
					{
						name = "$STR_ace_common_CheckPBO_Action_WarnPerm";
						value = 1;
					};
					class Kick
					{
						name = "$STR_ace_common_CheckPBO_Action_Kick";
						value = 2;
					};
				};
			};
			class CheckAll
			{
				displayName = "$STR_ace_common_CheckPBO_CheckAll_DisplayName";
				description = "$STR_ace_common_CheckPBO_CheckAll_Description";
				typeName = "BOOL";
				defaultValue = 0;
			};
			class Whitelist
			{
				displayName = "$STR_ace_common_CheckPBO_Whitelist_DisplayName";
				description = "$STR_ace_common_CheckPBO_Whitelist_Description";
				typeName = "STRING";
				defaultValue = "[]";
			};
		};
		class ModuleDescription: ModuleDescription
		{
			description = "$STR_ace_common_CheckPBO_Description";
		};
	};
	class ACE_ModuleLSDVehicles: ACE_Module
	{
		author = "$STR_ace_common_ACETeam";
		category = "ACE";
		displayName = "$STR_ace_common_LSDVehicles_DisplayName";
		function = "ACE_Common_fnc_moduleLSDVehicles";
		scope = 2;
		icon = "\z\ace\addons\common\UI\Icon_Module_LSD_ca.paa";
		isGlobal = 1;
		class Arguments{};
		class ModuleDescription: ModuleDescription
		{
			description = "$STR_ace_common_LSDVehicles_Description";
			sync[] = {"AnyVehicle"};
		};
	};
	class Box_NATO_Support_F;
	class ACE_Box_Misc: Box_NATO_Support_F
	{
		author = "$STR_ace_common_ACETeam";
		displayName = "$STR_ace_common_MiscItems";
		transportMaxWeapons = 9001;
		transportMaxMagazines = 9001;
		transportMaxItems = 9001;
		maximumload = 9001;
		class TransportWeapons{};
		class TransportMagazines{};
		class TransportItems{};
		class TransportBackpacks{};
	};
	class Item_Base_F;
	class ACE_bananaItem: Item_Base_F
	{
		scope = 2;
		scopeCurator = 2;
		displayName = "$STR_ace_common_bananaDisplayName";
		author = "$STR_ace_common_ACETeam";
		vehicleClass = "Items";
		class TransportItems
		{
			class _xx_ACE_banana
			{
				name = "ACE_banana";
				count = 1;
			};
		};
	};
	class Land_HelipadEmpty_F;
	class ACE_LogicDummy: Land_HelipadEmpty_F
	{
		scope = 1;
		SLX_XEH_DISABLED = 1;
		author = "$STR_ace_common_ACETeam";
		class EventHandlers
		{
			init = "(_this select 0) enableSimulation false";
		};
	};
	class Bicycle;
	class ACE_Headbug_Fix: Bicycle
	{
		scope = 1;
		side = 3;
		model = "\z\ace\addons\common\data\ACE_HeadBanger.p3d";
		author = "$STR_ace_common_ACETeam";
		displayName = " ";
		soundEngine[] = {"",20,0.875};
		soundEnviron[] = {"",25,0.925};
		isBicycle = 1;
		class EventHandlers{};
		SLX_XEH_DISABLED = 1;
	};
};
class CfgWeapons
{
	class ItemCore;
	class ACE_ItemCore: ItemCore
	{
		type = 4096;
		detectRange = -1;
		simulation = "ItemMineDetector";
	};
	class Rifle;
	class Rifle_Base_F: Rifle
	{
		class WeaponSlotsInfo;
	};
	class ACE_FakePrimaryWeapon: Rifle_Base_F
	{
		scope = 2;
		scopeCurator = 1;
		scopeArsenal = 1;
		displayName = "";
		model = "\A3\Weapons_f\empty";
		picture = "";
		magazines[] = {"ACE_FakeMagazine"};
		discreteDistance[] = {};
		discreteDistanceInitIndex = 0;
		class WeaponSlotsInfo: WeaponSlotsInfo
		{
			mass = 0;
		};
	};
	class InventoryItem_Base_F;
	class ACE_Banana: ACE_ItemCore
	{
		author = "$STR_ace_common_ACETeam";
		scope = 2;
		displayName = "$STR_ace_common_bananaDisplayName";
		descriptionShort = "$STR_ace_common_bananaDescr";
		model = "\z\ace\addons\common\data\banana.p3d";
		picture = "\z\ace\addons\common\data\icon_banana_ca.paa";
		icon = "iconObject_circle";
		mapSize = 0.034;
		class ItemInfo: InventoryItem_Base_F
		{
			mass = 1;
		};
	};
};
class CfgMagazines
{
	class CA_Magazine;
	class ACE_FakeMagazine: CA_Magazine
	{
		scopeCurator = 1;
		descriptionShort = "";
		displayName = "";
		displayNameShort = "";
		count = 0;
	};
};
class CfgActions
{
	class None;
	class TakeWeapon: None
	{
		show = 0;
	};
	class TakeItem: None
	{
		show = 0;
	};
	class TakeMagazine: None
	{
		show = 0;
	};
};
class CfgMovesBasic
{
	class Default;
	class Actions
	{
		class NoActions;
		class PistolStandActions: NoActions
		{
			grabDrag = "AmovPercMstpSlowWrflDnon_AcinPknlMwlkSlowWrflDb_2";
		};
		class LauncherKneelActions: NoActions
		{
			grabDrag = "AmovPercMstpSlowWrflDnon_AcinPknlMwlkSlowWrflDb_2";
		};
		class CivilStandActions: NoActions
		{
			grabDrag = "AmovPercMstpSlowWrflDnon_AcinPknlMwlkSlowWrflDb_2";
		};
	};
};
class CfgMovesMaleSdr: CfgMovesBasic
{
	class AgonyBase;
	class AgonyBaseRfl;
	class StandBase;
	class HealBase;
	class States
	{
		class AinjPfalMstpSnonWnonDnon_carried_Down: AgonyBase
		{
			canReload = 0;
		};
		class AinjPfalMstpSnonWnonDnon_carried_Up: AgonyBase
		{
			canReload = 0;
		};
		class AinjPfalMstpSnonWrflDnon_carried_Down: AgonyBase
		{
			canReload = 0;
		};
		class AinjPfalMstpSnonWrflDnon_carried_Up: AgonyBaseRfl
		{
			canReload = 0;
		};
		class AmovPpneMstpSnonWnonDnon_injured;
		class AinjPpneMstpSnonWnonDnon: AmovPpneMstpSnonWnonDnon_injured
		{
			canReload = 0;
		};
		class AmovPpneMstpSrasWrflDnon_injured;
		class AinjPpneMstpSnonWrflDnon: AmovPpneMstpSrasWrflDnon_injured
		{
			canReload = 0;
		};
		class LadderCivilStatic: StandBase
		{
			ACE_isLadder = 1;
		};
		class AmovPercMstpSnonWnonDnon_AcinPknlMwlkSnonWnonDb_1;
		class AcinPknlMstpSnonWnonDnon: AmovPercMstpSnonWnonDnon_AcinPknlMwlkSnonWnonDb_1
		{
			enableDirectControl = 1;
		};
		class AcinPknlMwlkSnonWnonDb: AmovPercMstpSnonWnonDnon_AcinPknlMwlkSnonWnonDb_1
		{
			enableDirectControl = 1;
		};
		class Unconscious: Default
		{
			ConnectTo[] = {};
			head = "headNo";
			forceAim = 1;
			static = 1;
		};
		class AinvPknlMstpSnonWnonDnon_medic0: HealBase
		{
			variantsPlayer[] = {};
		};
	};
};
class RadioProtocolBase
{
	class Words;
};
class ACE_RadioProtocolNoRadio: RadioProtocolBase
{
	class CuratorWaypointPlaced;
	class CuratorWaypointPlacedAttack;
	class CuratorObjectPlaced;
	class curatorObjectDestroyed;
	class curatorModuleCAS;
	class SentFireNoTarget_1;
	class SentSupportRequestRGCASBombing;
	class SentNoTargetDefault;
	class SentEngageNoTargetDefault;
	class SentFireNoTargetDefault;
	class SentAttackNoTargetDefault;
	class SentEnemyDetectedMedium;
	class SentEnemyDetectedLong;
	class SentEnemyDetectedDangerClose;
	class SentEnemyDetectedClose;
	class SentEnemyDetectedVeryLong;
	class SentIsLeaderDefault;
	class SentCommandCompletedDefault;
	class SentFireReadyDefault;
	class SentCommandFailedDefault;
	class SentDestinationUnreacheableDefault;
	class SentObjectDestroyedDefault;
	class SentObjectDestroyedUnknownDefault;
	class SentClearDefault;
	class SentRepeatCommandDefault;
	class SentWhereAreYouDefault;
	class SentReportStatusDefault;
	class SentNotifyAttackDefault;
	class SentNotifyAttackSubgroupDefault;
	class SentConfirmMoveDefault;
	class SentConfirmAttackDefault;
	class SentConfirmOtherDefault;
	class SentUnitKilledDefault;
	class SentHealthCriticalDefault;
	class SentHealthNormalDefault;
	class SentReturnToFormationDefault;
	class SentLooseFormationDefault;
	class SentCmdFollowMeDefault;
	class SelectCmdMoveSentenceClose;
	class SelectCmdMoveSentenceVeryClose;
	class SelectCmdMoveSentenceFar;
	class SentEnemyDetectedMediumStealth;
	class SentSupportConfirmDefault;
	class SelectCmdMoveSentenceClose_1;
	class SelectCmdMoveSentenceVeryClose_1;
	class SelectCmdMoveSentenceFar_1;
	class SentSupportRequestRGCASHelicopter;
	class SentSupportRequestRGSupplyDrop;
	class SentSupportRequestRGUAV;
	class SentSupportRequestRGArty;
	class SentSupportRequestRGTransport;
	class SentRequestAcknowledgedSGCASBombing;
	class SentRequestAcknowledgedSGCASHelicopter;
	class SentRequestAcknowledgedSGSupplyDrop;
	class SentRequestAcknowledgedSGUAV;
	class SentRequestAcknowledgedSGArty;
	class SentRequestAcknowledgedTransport;
	class SentUnitDestroyedHQCASBombing;
	class SentUnitDestroyedHQCASHelicopter;
	class SentUnitDestroyedHQSupplyDrop;
	class SentUnitDestroyedHQUAV;
	class SentUnitDestroyedHQArty;
	class SentUnitDestroyedHQTransport;
	class SentRequestAccomplishedSGCASBombing;
	class SentRequestAccomplishedSGCASHelicopter;
	class SentRequestAccomplishedSGSupplyDrop;
	class SentRequestAccomplishedSGUAV;
	class SentRequestAccomplishedSGArty;
	class SentRequestAccomplishedSGTransport;
	class SentSupportAddedDuringMission;
	class SentArtySGSupportRoundsComplete;
	class SentTransportSGWelcomeAboard;
	class SentTransportSGLZCoordinatesSelected;
	class SelectCmdMoveSentenceLocation;
	class SelectCmdMoveSentenceMedium;
	class SentEnemyDetectedLongStealth;
	class SentEnemyDetectedDangerCloseStealth;
	class SentEnemyDetectedCloseStealth;
	class SentEnemyDetectedVeryLongStealth;
	class SentEngageDefault;
	class SelectCmdMoveSentenceLocation_1;
	class SelectCmdMoveSentenceMedium_1;
	class SentBehaviourSafeDefault;
	class SentBehaviourAwareDefault;
	class SentBehaviourCombatDefault;
	class SentOpenFireDefault;
	class SentCeaseFireInsideGroupDefault;
	class SentCeaseFireDefault;
	class SentEngageStealth;
	class SentFireNoTargetStealth;
	class SentAttackNoTargetStealth;
	class SentNoTargetStealth;
	class SentEngageNoTargetStealth;
	class SelectCmdMoveSentenceCloseStealth;
	class SelectCmdMoveSentenceVeryCloseStealth;
	class SelectCmdMoveSentenceFarStealth;
	class SelectCmdMoveSentenceLocationStealth;
	class SelectCmdMoveSentenceMediumStealth;
	class SentReturnToFormationStealth;
	class SentLooseFormationStealth;
	class SentCmdFollowMeStealth;
	class SentOpenFireStealth;
	class SentCeaseFireInsideGroupStealth;
	class SentBehaviourSafeStealth;
	class SentBehaviourAwareStealth;
	class SentBehaviourCombatStealth;
	class SentSupportConfirmStealth;
	class SentCommandFailedStealth;
	class SentObjectDestroyedStealth;
	class SentObjectDestroyedUnknownStealth;
	class SentCommandCompletedStealth;
	class SentFireReadyStealth;
	class SentIsLeaderStealth;
	class SentDestinationUnreacheableStealth;
	class SentClearStealth;
	class SentRepeatCommandStealth;
	class SentWhereAreYouStealth;
	class SentReportStatusStealth;
	class SentNotifyAttackStealth;
	class SentNotifyAttackSubgroupStealth;
	class SentConfirmMoveStealth;
	class SentConfirmAttackStealth;
	class SentConfirmOtherStealth;
	class SentUnitKilledStealth;
	class SentHealthCriticalStealth;
	class SentHealthNormalStealth;
	class SentGenReinforcementsConfirmed;
	class SentGenReinforcementsRejected;
	class SentGenReinforcementsArrived;
	class SentGenLeavingAO;
	class SentGenTime;
	class SentGenLosing;
	class SentGenLost;
	class SentGenComplete;
	class SentGenCmdSeize;
	class SentGenCmdDefend;
	class SentGenCmdRTB;
	class SentGenCmdTargetNeutralize;
	class SentGenCmdTargetProtect;
	class SentGenCmdTargetEscort;
	class SentGenCmdTargetFind;
	class SentGenIncoming;
	class SentGenBaseUnlockRespawn;
	class SentGenBaseUnlockVehicle;
	class SentGenBaseSideFriendlyWEST;
	class SentFXBreathingSlow;
	class SentFXBreathingFast;
	class SentFXHit;
	class SentFXDeath;
	class SentFXHurt;
	class SentFXEffort;
	class SentFXDrowning;
	class SentCeaseFireDefault_1;
	class SentGenBaseSideFriendlyEAST;
	class SentGenBaseSideFriendlyGUER;
	class SentGenBaseSideEnemyWEST;
	class SentGenBaseSideEnemyEAST;
	class SentGenBaseSideEnemyGUER;
	class SentTargetDefault;
	class SentTargetStealth;
	class Dummy;
	class Words: Words
	{
		grid_zero[] = {};
		grid_one[] = {};
		grid_two[] = {};
		grid_three[] = {};
		grid_four[] = {};
		grid_five[] = {};
		grid_six[] = {};
		grid_seven[] = {};
		grid_eight[] = {};
		grid_nine[] = {};
		grid_zero_2[] = {};
		grid_one_2[] = {};
		grid_two_2[] = {};
		grid_three_2[] = {};
		grid_four_2[] = {};
		grid_five_2[] = {};
		grid_six_2[] = {};
		grid_seven_2[] = {};
		grid_eight_2[] = {};
		grid_nine_2[] = {};
		grid_zero_3[] = {};
		grid_one_3[] = {};
		grid_two_3[] = {};
		grid_three_3[] = {};
		grid_four_3[] = {};
		grid_five_3[] = {};
		grid_six_3[] = {};
		grid_seven_3[] = {};
		grid_eight_3[] = {};
		grid_nine_3[] = {};
		Ready[] = {};
		Waiting[] = {};
		StandingBy[] = {};
		RallyUp[] = {};
		UnderFireE[] = {};
	};
};
class CfgVoice
{
	class ACE_NoVoice
	{
		author = "$STR_ace_common_ACETeam";
		protocol = "ACE_RadioProtocolNoRadio";
		variants[] = {1};
		directories[] = {"",""};
		identityTypes[] = {"Default"};
		scope = 2;
		voiceType = "";
		icon = "\a3\Ui_f\data\Map\Markers\Flags\nato_ca.paa";
		displayName = "$STR_ace_common_NoVoice";
	};
};
class CfgVoiceTypes
{
	class ACE_NoVoice
	{
		name = "$STR_ace_common_NoVoice";
		voices[] = {"ACE_NoVoice","ACE_NoVoice","ACE_NoVoice"};
		preview = "ACE_NoVoice";
		alternative = "";
	};
};
class CfgUnitInsignia
{
	class ACE_insignia_logo
	{
		displayName = "ACE3";
		author = "$STR_ace_common_ACETeam";
		texture = "\z\ace\addons\common\data\Insignia_ace3logo_ca.paa";
		textureVehicle = "";
	};
	class ACE_insignia_banana
	{
		displayName = "ABE3";
		author = "$STR_ace_common_ACETeam";
		texture = "\z\ace\addons\common\data\insignia_banana_ca.paa";
		textureVehicle = "";
	};
};
class ACE_Rsc_Display_Base
{
	idd = -1;
	type = 0;
	style = 48;
	name = "";
	duration = 999999;
	fadeIn = 0;
	fadeOut = 0;
	font = "TahomaB";
	size = 1;
	colorBackground[] = {1,1,1,0};
	colorText[] = {1,1,1,1};
};
class ACE_Rsc_Control_Base
{
	idc = 1;
	type = 0;
	style = 48;
	access = 0;
	lineSpacing = 0;
	moving = 1;
	text = "";
	size = 1;
	sizeEx = 0;
	font = "TahomaB";
	colorBackground[] = {1,1,1,0};
	colorText[] = {1,1,1,1};
	x = 0;
	y = 0;
	w = 0;
	h = 0;
};
class ACE_Settings
{
	class ace_common_forceAllSettings
	{
		value = 0;
		typeName = "BOOL";
	};
	class ace_common_checkPBOsAction
	{
		value = 0;
		typeName = "SCALAR";
		isClientSettable = 0;
		values[] = {"$STR_ace_common_CheckPBO_Action_WarnOnce","$STR_ace_common_CheckPBO_Action_WarnPerm","$STR_ace_common_CheckPBO_Action_Kick"};
	};
	class ace_common_checkPBOsCheckAll
	{
		value = 0;
		typeName = "BOOL";
		isClientSettable = 0;
	};
	class ace_common_checkPBOsWhitelist
	{
		value = "[]";
		typeName = "STRING";
		isClientSettable = 0;
	};
	class ace_common_settingFeedbackIcons
	{
		value = 1;
		typeName = "SCALAR";
		force = 0;
		isClientSettable = 1;
		displayName = "$STR_ace_common_SettingFeedbackIconsName";
		description = "$STR_ace_common_SettingFeedbackIconsDesc";
		values[] = {"$STR_ace_optionsmenu_Hide","$STR_ace_optionsmenu_TopRightDown","$STR_ace_optionsmenu_TopRightLeft","$STR_ace_optionsmenu_TopLeftDown","$STR_ace_optionsmenu_TopLeftRight"};
	};
	class ace_common_SettingProgressBarLocation
	{
		value = 0;
		typeName = "SCALAR";
		force = 0;
		isClientSettable = 1;
		displayName = "$STR_ace_common_SettingProgressbarLocationName";
		description = "$STR_ace_common_SettingProgressbarLocationDesc";
		values[] = {"$STR_ace_optionsmenu_Top","$STR_ace_optionsmenu_Bottom"};
	};
	class ace_common_displayTextColor
	{
		value[] = {0,0,0,0.1};
		typeName = "COLOR";
		isClientSettable = 1;
		displayName = "$STR_ace_common_SettingDisplayTextColorName";
		description = "$STR_ace_common_SettingDisplayTextColorDesc";
	};
	class ace_common_displayTextFontColor
	{
		value[] = {1,1,1,1};
		typeName = "COLOR";
		isClientSettable = 1;
		displayName = "$STR_ace_common_SettingDisplayTextFontColorName";
		description = "$STR_ace_common_SettingDisplayTextFontColorDesc";
	};
};
class ACE_gui_backgroundBase
{
	type = 0;
	idc = -1;
	style = 48;
	colorBackground[] = {0,0,0,0};
	colorText[] = {1,1,1,1};
	font = "PuristaMedium";
	text = "";
	sizeEx = 0.032;
};
class ACE_gui_editBase
{
	access = 0;
	type = 2;
	x = 0;
	y = 0;
	h = 0.04;
	w = 0.2;
	colorBackground[] = {0,0,0,1};
	colorText[] = {0.95,0.95,0.95,1};
	colorSelection[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])",1};
	autocomplete = "";
	text = "";
	size = 0.2;
	style = "0x00 + 0x40";
	font = "PuristaMedium";
	shadow = 2;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	colorDisabled[] = {1,1,1,0.25};
};
class ACE_gui_buttonBase
{
	idc = -1;
	type = 16;
	style = 0;
	text = "";
	action = "";
	x = 0;
	y = 0;
	w = 0.25;
	h = 0.04;
	size = 0.03921;
	sizeEx = 0.03921;
	color[] = {1,1,1,1};
	color2[] = {1,1,1,1};
	colorBackground[] = {1,1,1,0.95};
	colorbackground2[] = {1,1,1,0.95};
	colorDisabled[] = {1,1,1,0.6};
	colorFocused[] = {1,1,1,1};
	colorBackgroundFocused[] = {1,1,1,1};
	periodFocus = 1.2;
	periodOver = 0.8;
	default = 0;
	class HitZone
	{
		left = 0;
		top = 0;
		right = 0;
		bottom = 0;
	};
	class ShortcutPos
	{
		left = 0;
		top = 0;
		w = 0;
		h = 0;
	};
	class TextPos
	{
		left = 0.002;
		top = 0.0004;
		right = 0;
		bottom = 0;
	};
	textureNoShortcut = "";
	animTextureNormal = "#(argb,8,8,3)color(0,0,0,0.9)";
	animTextureDisabled = "#(argb,8,8,3)color(0,0,0,0.8)";
	animTextureOver = "#(argb,8,8,3)color(1,1,1,1)";
	animTextureFocused = "#(argb,8,8,3)color(1,1,1,1)";
	animTexturePressed = "#(argb,8,8,3)color(1,1,1,1)";
	animTextureDefault = "#(argb,8,8,3)color(1,1,1,1)";
	period = 0.5;
	font = "PuristaMedium";
	soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
	soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0,0};
	soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.07,1};
	soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
	class Attributes
	{
		font = "PuristaMedium";
		color = "#E5E5E5";
		align = "center";
		shadow = 1;
	};
	class AttributesImage
	{
		font = "PuristaMedium";
		color = "#E5E5E5";
		align = "left";
		shadow = 1;
	};
};
class ACE_gui_RscProgress
{
	type = 8;
	style = 0;
	colorFrame[] = {1,1,1,0.7};
	colorBar[] = {1,1,1,0.7};
	texture = "#(argb,8,8,3)color(1,1,1,0.7)";
	x = "1 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
	y = "10 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
	w = "38 * (((safezoneW / safezoneH) min 1.2) / 40)";
	h = "0.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
};
class ACE_gui_staticBase
{
	idc = -1;
	type = 0;
	x = 0;
	y = 0;
	w = 0.183825;
	h = 0.104575;
	style = 0;
	font = "PuristaMedium";
	sizeEx = 0.03921;
	colorText[] = {0.95,0.95,0.95,1};
	colorBackground[] = {0,0,0,0};
	text = "";
};
class RscListBox;
class ACE_gui_listBoxBase: RscListBox
{
	type = 5;
	style = 16;
	font = "PuristaMedium";
	sizeEx = 0.03921;
	color[] = {1,1,1,1};
	colorText[] = {0.543,0.5742,0.4102,1};
	colorScrollbar[] = {0.95,0.95,0.95,1};
	colorSelect[] = {0.95,0.95,0.95,1};
	colorSelect2[] = {0.95,0.95,0.95,1};
	colorSelectBackground[] = {0,0,0,1};
	colorSelectBackground2[] = {0.543,0.5742,0.4102,1};
	colorDisabled[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",0.25};
	period = 1.2;
	rowHeight = 0.03;
	colorBackground[] = {0,0,0,1};
	maxHistoryDelay = 1;
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
	soundSelect[] = {"",0.1,1};
	soundExpand[] = {"",0.1,1};
	soundCollapse[] = {"",0.1,1};
	class ListScrollBar
	{
		arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
		arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
		autoScrollDelay = 5;
		autoScrollEnabled = 0;
		autoScrollRewind = 0;
		autoScrollSpeed = -1;
		border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
		color[] = {1,1,1,0.6};
		colorActive[] = {1,1,1,1};
		colorDisabled[] = {1,1,1,0.3};
		height = 0;
		scrollSpeed = 0.06;
		shadow = 0;
		thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
		width = 0;
	};
	class ScrollBar
	{
		color[] = {1,1,1,0.6};
		colorActive[] = {1,1,1,1};
		colorDisabled[] = {1,1,1,0.3};
		thumb = "";
		arrowFull = "";
		arrowEmpty = "";
		border = "";
	};
};
class ACE_gui_listNBox
{
	access = 0;
	type = 102;
	style = 16;
	w = 0.4;
	h = 0.4;
	font = "PuristaMedium";
	sizeEx = 0.031;
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
	arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
	arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
	columns[] = {0};
	color[] = {1,1,1,1};
	rowHeight = 0.03;
	colorBackground[] = {0,0,0,0.2};
	colorText[] = {1,1,1,1};
	colorScrollbar[] = {0.95,0.95,0.95,1};
	colorSelect[] = {0.95,0.95,0.95,1};
	colorSelect2[] = {0.95,0.95,0.95,1};
	colorSelectBackground[] = {0,0,0,0};
	colorSelectBackground2[] = {0,0,0,0.5};
	colorActive[] = {0,0,0,1};
	colorDisabled[] = {0,0,0,0.3};
	rows = 1;
	drawSideArrows = 0;
	idcLeft = -1;
	idcRight = -1;
	maxHistoryDelay = 1;
	soundSelect[] = {"",0.1,1};
	period = 1;
	shadow = 2;
	class ScrollBar
	{
		arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
		arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
		border = "#(argb,8,8,3)color(1,1,1,1)";
		color[] = {1,1,1,0.6};
		colorActive[] = {1,1,1,1};
		colorDisabled[] = {1,1,1,0.3};
		thumb = "#(argb,8,8,3)color(1,1,1,1)";
	};
	class ListScrollBar
	{
		arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
		arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
		autoScrollDelay = 5;
		autoScrollEnabled = 0;
		autoScrollRewind = 0;
		autoScrollSpeed = -1;
		border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
		color[] = {1,1,1,0.6};
		colorActive[] = {1,1,1,1};
		colorDisabled[] = {1,1,1,0.3};
		height = 0;
		scrollSpeed = 0.06;
		shadow = 0;
		thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
		width = 0;
	};
};
class RscCombo;
class ACE_gui_comboBoxBase: RscCombo
{
	idc = -1;
	type = 4;
	style = "0x10 + 0x200";
	x = 0;
	y = 0;
	w = 0.3;
	h = 0.035;
	color[] = {0,0,0,0.6};
	colorActive[] = {1,0,0,1};
	colorBackground[] = {0,0,0,1};
	colorDisabled[] = {1,1,1,0.25};
	colorScrollbar[] = {1,0,0,1};
	colorSelect[] = {0,0,0,1};
	colorSelectBackground[] = {1,1,1,0.7};
	colorText[] = {1,1,1,1};
	arrowEmpty = "";
	arrowFull = "";
	wholeHeight = 0.45;
	font = "PuristaMedium";
	sizeEx = 0.031;
	soundSelect[] = {"\A3\ui_f\data\sound\RscCombo\soundSelect",0.1,1};
	soundExpand[] = {"\A3\ui_f\data\sound\RscCombo\soundExpand",0.1,1};
	soundCollapse[] = {"\A3\ui_f\data\sound\RscCombo\soundCollapse",0.1,1};
	maxHistoryDelay = 1;
	class ScrollBar
	{
		color[] = {0.3,0.3,0.3,0.6};
		colorActive[] = {0.3,0.3,0.3,1};
		colorDisabled[] = {0.3,0.3,0.3,0.3};
		thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
		arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
		arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
		border = "";
	};
	class ComboScrollBar
	{
		arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
		arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
		autoScrollDelay = 5;
		autoScrollEnabled = 0;
		autoScrollRewind = 0;
		autoScrollSpeed = -1;
		border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
		color[] = {0.3,0.3,0.3,0.6};
		colorActive[] = {0.3,0.3,0.3,1};
		colorDisabled[] = {0.3,0.3,0.3,0.3};
		height = 0;
		scrollSpeed = 0.06;
		shadow = 0;
		thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
		width = 0;
	};
};
class ACE_gui_mapBase
{
	moveOnEdges = 1;
	x = "SafeZoneXAbs";
	y = "SafeZoneY + 1.5 *           (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	w = "SafeZoneWAbs";
	h = "SafeZoneH - 1.5 *           (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	type = 100;
	style = 48;
	shadow = 0;
	ptsPerSquareSea = 5;
	ptsPerSquareTxt = 3;
	ptsPerSquareCLn = 10;
	ptsPerSquareExp = 10;
	ptsPerSquareCost = 10;
	ptsPerSquareFor = 9;
	ptsPerSquareForEdge = 9;
	ptsPerSquareRoad = 6;
	ptsPerSquareObj = 9;
	showCountourInterval = 0;
	scaleMin = 0.001;
	scaleMax = 1;
	scaleDefault = 0.16;
	maxSatelliteAlpha = 0.85;
	alphaFadeStartScale = 0.35;
	alphaFadeEndScale = 0.4;
	colorBackground[] = {0.969,0.957,0.949,1};
	colorSea[] = {0.467,0.631,0.851,0.5};
	colorForest[] = {0.624,0.78,0.388,0.5};
	colorForestBorder[] = {0,0,0,0};
	colorRocks[] = {0,0,0,0.3};
	colorRocksBorder[] = {0,0,0,0};
	colorLevels[] = {0.286,0.177,0.094,0.5};
	colorMainCountlines[] = {0.572,0.354,0.188,0.5};
	colorCountlines[] = {0.572,0.354,0.188,0.25};
	colorMainCountlinesWater[] = {0.491,0.577,0.702,0.6};
	colorCountlinesWater[] = {0.491,0.577,0.702,0.3};
	colorPowerLines[] = {0.1,0.1,0.1,1};
	colorRailWay[] = {0.8,0.2,0,1};
	colorNames[] = {0.1,0.1,0.1,0.9};
	colorInactive[] = {1,1,1,0.5};
	colorOutside[] = {0,0,0,1};
	colorTracks[] = {0.84,0.76,0.65,0.15};
	colorTracksFill[] = {0.84,0.76,0.65,1};
	colorRoads[] = {0.7,0.7,0.7,1};
	colorRoadsFill[] = {1,1,1,1};
	colorMainRoads[] = {0.9,0.5,0.3,1};
	colorMainRoadsFill[] = {1,0.6,0.4,1};
	colorGrid[] = {0.1,0.1,0.1,0.6};
	colorGridMap[] = {0.1,0.1,0.1,0.6};
	colorText[] = {1,1,1,0.85};
	font = "PuristaMedium";
	sizeEx = 0.027;
	stickX[] = {0.2,{ "Gamma",1,1.5 }};
	stickY[] = {0.2,{ "Gamma",1,1.5 }};
	onMouseButtonClick = "";
	onMouseButtonDblClick = "";
	fontLabel = "PuristaMedium";
	sizeExLabel = "(     (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
	fontGrid = "TahomaB";
	sizeExGrid = 0.02;
	fontUnits = "TahomaB";
	sizeExUnits = "(     (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
	fontNames = "PuristaMedium";
	sizeExNames = "(     (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8) * 2";
	fontInfo = "PuristaMedium";
	sizeExInfo = "(      (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
	fontLevel = "TahomaB";
	sizeExLevel = 0.02;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	class ActiveMarker
	{
		color[] = {0.3,0.1,0.9,1};
		size = 50;
	};
	class Legend
	{
		x = "SafeZoneX +          (     ((safezoneW / safezoneH) min 1.2) / 40)";
		y = "SafeZoneY + safezoneH - 4.5 *          (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		w = "10 *           (     ((safezoneW / safezoneH) min 1.2) / 40)";
		h = "3.5 *          (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		font = "PuristaMedium";
		sizeEx = "(     (     (     ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
		colorBackground[] = {1,1,1,0.5};
		color[] = {0,0,0,1};
	};
	class Task
	{
		icon = "\A3\ui_f\data\map\mapcontrol\taskIcon_CA.paa";
		iconCreated = "\A3\ui_f\data\map\mapcontrol\taskIconCreated_CA.paa";
		iconCanceled = "\A3\ui_f\data\map\mapcontrol\taskIconCanceled_CA.paa";
		iconDone = "\A3\ui_f\data\map\mapcontrol\taskIconDone_CA.paa";
		iconFailed = "\A3\ui_f\data\map\mapcontrol\taskIconFailed_CA.paa";
		color[] = {"(profilenamespace getvariable ['IGUI_TEXT_RGB_R',0])","(profilenamespace getvariable ['IGUI_TEXT_RGB_G',1])","(profilenamespace getvariable ['IGUI_TEXT_RGB_B',1])","(profilenamespace getvariable ['IGUI_TEXT_RGB_A',0.8])"};
		colorCreated[] = {1,1,1,1};
		colorCanceled[] = {0.7,0.7,0.7,1};
		colorDone[] = {0.7,1,0.3,1};
		colorFailed[] = {1,0.3,0.2,1};
		size = 27;
		importance = 1;
		coefMin = 1;
		coefMax = 1;
	};
	class Waypoint
	{
		icon = "\A3\ui_f\data\map\mapcontrol\waypoint_ca.paa";
		color[] = {0,0,0,1};
		size = 20;
		importance = "1.2 * 16 * 0.05";
		coefMin = 0.9;
		coefMax = 4;
	};
	class WaypointCompleted
	{
		icon = "\A3\ui_f\data\map\mapcontrol\waypointCompleted_ca.paa";
		color[] = {0,0,0,1};
		size = 20;
		importance = "1.2 * 16 * 0.05";
		coefMin = 0.9;
		coefMax = 4;
	};
	class CustomMark
	{
		icon = "\A3\ui_f\data\map\mapcontrol\custommark_ca.paa";
		size = 24;
		importance = 1;
		coefMin = 1;
		coefMax = 1;
		color[] = {0,0,0,1};
	};
	class Command
	{
		icon = "\A3\ui_f\data\map\mapcontrol\waypoint_ca.paa";
		size = 18;
		importance = 1;
		coefMin = 1;
		coefMax = 1;
		color[] = {1,1,1,1};
	};
	class Bush
	{
		icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
		color[] = {0.45,0.64,0.33,0.4};
		size = "14/2";
		importance = "0.2 * 14 * 0.05 * 0.05";
		coefMin = 0.25;
		coefMax = 4;
	};
	class Rock
	{
		icon = "\A3\ui_f\data\map\mapcontrol\rock_ca.paa";
		color[] = {0.1,0.1,0.1,0.8};
		size = 12;
		importance = "0.5 * 12 * 0.05";
		coefMin = 0.25;
		coefMax = 4;
	};
	class SmallTree
	{
		icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
		color[] = {0.45,0.64,0.33,0.4};
		size = 12;
		importance = "0.6 * 12 * 0.05";
		coefMin = 0.25;
		coefMax = 4;
	};
	class Tree
	{
		icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
		color[] = {0.45,0.64,0.33,0.4};
		size = 12;
		importance = "0.9 * 16 * 0.05";
		coefMin = 0.25;
		coefMax = 4;
	};
	class busstop
	{
		icon = "\A3\ui_f\data\map\mapcontrol\busstop_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
		color[] = {1,1,1,1};
	};
	class fuelstation
	{
		icon = "\A3\ui_f\data\map\mapcontrol\fuelstation_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
		color[] = {1,1,1,1};
	};
	class hospital
	{
		icon = "\A3\ui_f\data\map\mapcontrol\hospital_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
		color[] = {1,1,1,1};
	};
	class church
	{
		icon = "\A3\ui_f\data\map\mapcontrol\church_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
		color[] = {1,1,1,1};
	};
	class lighthouse
	{
		icon = "\A3\ui_f\data\map\mapcontrol\lighthouse_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
		color[] = {1,1,1,1};
	};
	class power
	{
		icon = "\A3\ui_f\data\map\mapcontrol\power_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
		color[] = {1,1,1,1};
	};
	class powersolar
	{
		icon = "\A3\ui_f\data\map\mapcontrol\powersolar_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
		color[] = {1,1,1,1};
	};
	class powerwave
	{
		icon = "\A3\ui_f\data\map\mapcontrol\powerwave_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
		color[] = {1,1,1,1};
	};
	class powerwind
	{
		icon = "\A3\ui_f\data\map\mapcontrol\powerwind_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
		color[] = {1,1,1,1};
	};
	class quay
	{
		icon = "\A3\ui_f\data\map\mapcontrol\quay_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
		color[] = {1,1,1,1};
	};
	class shipwreck
	{
		icon = "\A3\ui_f\data\map\mapcontrol\shipwreck_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
		color[] = {1,1,1,1};
	};
	class transmitter
	{
		icon = "\A3\ui_f\data\map\mapcontrol\transmitter_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
		color[] = {1,1,1,1};
	};
	class watertower
	{
		icon = "\A3\ui_f\data\map\mapcontrol\watertower_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
		color[] = {1,1,1,1};
	};
	class Cross
	{
		icon = "\A3\ui_f\data\map\mapcontrol\Cross_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
		color[] = {0,0,0,1};
	};
	class Chapel
	{
		icon = "\A3\ui_f\data\map\mapcontrol\Chapel_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
		color[] = {0,0,0,1};
	};
	class Bunker
	{
		icon = "\A3\ui_f\data\map\mapcontrol\bunker_ca.paa";
		size = 14;
		importance = "1.5 * 14 * 0.05";
		coefMin = 0.25;
		coefMax = 4;
		color[] = {0,0,0,1};
	};
	class Fortress
	{
		icon = "\A3\ui_f\data\map\mapcontrol\bunker_ca.paa";
		size = 16;
		importance = "2 * 16 * 0.05";
		coefMin = 0.25;
		coefMax = 4;
		color[] = {0,0,0,1};
	};
	class Fountain
	{
		icon = "\A3\ui_f\data\map\mapcontrol\fountain_ca.paa";
		size = 11;
		importance = "1 * 12 * 0.05";
		coefMin = 0.25;
		coefMax = 4;
		color[] = {0,0,0,1};
	};
	class Ruin
	{
		icon = "\A3\ui_f\data\map\mapcontrol\ruin_ca.paa";
		size = 16;
		importance = "1.2 * 16 * 0.05";
		coefMin = 1;
		coefMax = 4;
		color[] = {0,0,0,1};
	};
	class Stack
	{
		icon = "\A3\ui_f\data\map\mapcontrol\stack_ca.paa";
		size = 20;
		importance = "2 * 16 * 0.05";
		coefMin = 0.9;
		coefMax = 4;
		color[] = {0,0,0,1};
	};
	class Tourism
	{
		icon = "\A3\ui_f\data\map\mapcontrol\tourism_ca.paa";
		size = 16;
		importance = "1 * 16 * 0.05";
		coefMin = 0.7;
		coefMax = 4;
		color[] = {0,0,0,1};
	};
	class ViewTower
	{
		icon = "\A3\ui_f\data\map\mapcontrol\viewtower_ca.paa";
		size = 16;
		importance = "2.5 * 16 * 0.05";
		coefMin = 0.5;
		coefMax = 4;
		color[] = {0,0,0,1};
	};
};
class ace_common_ProgressBar_Dialog
{
	idd = -1;
	movingEnable = 0;
	onLoad = "uiNamespace setVariable [""ace_common_ctrlProgressBG"", (_this select 0) displayCtrl 1]; uiNamespace setVariable [""ace_common_ctrlProgressBar"", (_this select 0) displayCtrl 2]; uiNamespace setVariable [""ace_common_ctrlProgressBarTitle"", (_this select 0) displayCtrl 3];";
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
			colorBackground[] = {0,0,0,0};
			colorText[] = {0,0,0,0};
			x = "safezoneX";
			y = "safezoneY";
			w = "safezoneW";
			h = "safezoneH";
		};
		class TitleBackground: ACE_gui_staticBase
		{
			idc = 1;
			style = 2;
			sizeEx = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[] = {0,0,0,0.5};
			colorText[] = {1,1,1,1};
			x = "1 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "0 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "38 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class Progress: ACE_gui_RscProgress
		{
			idc = 2;
			x = "1.2 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "0.1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "38 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorFrame[] = {1,1,1,0.5};
			colorBar[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.8])"};
			texture = "#(argb,8,8,3)color(1,1,1,0.7)";
		};
		class TitleText: TitleBackground
		{
			idc = 3;
			colorBackground[] = {0,0,0,0};
		};
	};
};
class ace_common_DisableMouse_Dialog
{
	idd = -1;
	movingEnable = 0;
	onLoad = "uiNamespace setVariable [""ace_common_dlgDisableMouse"", _this select 0];";
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
			colorBackground[] = {0,0,0,0};
			colorText[] = {0,0,0,0};
			x = "safezoneX";
			y = "safezoneY";
			w = "safezoneW";
			h = "safezoneH";
		};
	};
};
class RscStructuredText;
class RscMapControl;
class RscTitles
{
	class ACE_RscHint
	{
		idd = -1;
		onLoad = "uiNamespace setVariable ['ACE_ctrlHint', (_this select 0) displayCtrl 1];";
		movingEnable = 0;
		duration = 4;
		fadeIn = 0.2;
		fadeOut = 0.2;
		name = "ACE_RscHint";
		class controls
		{
			class HintBox: RscStructuredText
			{
				idc = 1;
				text = "";
				SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
				colorText[] = {1,1,1,1};
				colorBackground[] = {0,0,0,0.5};
				x = "safeZoneW + safeZoneX - 0 * safezoneW";
				y = "safeZoneY + 0.2 * safezoneH";
				w = "0.2 * safeZoneW";
				h = "0.1 * SafeZoneH";
				font = "PuristaMedium";
			};
		};
	};
	class ACE_RscErrorHint
	{
		idd = -1;
		onLoad = "uiNamespace setVariable ['ACE_ctrlErrorHint', (_this select 0) displayCtrl 1];";
		movingEnable = 0;
		duration = 999999;
		fadeIn = 0.2;
		fadeOut = 0.2;
		name = "ACE_RscErrorHint";
		class controls
		{
			class HintBox: RscStructuredText
			{
				idc = 1;
				text = "";
				SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
				colorText[] = {1,1,1,1};
				colorBackground[] = {0.8,0,0,0.5};
				x = "0.3 * safeZoneW + safeZoneX";
				y = "0.4 * safezoneH + safeZoneY";
				w = "0.4 * safeZoneW";
				h = "0.2 * SafeZoneH";
			};
		};
	};
	class ACE_EventHandlerHelper2: ACE_Rsc_Display_Base
	{
		class controls
		{
			class MapMarkerCreated: RscMapControl
			{
				onDraw = "if (count allMapMarkers != uiNamespace getVariable 'ACE_EventHandler_MapMarker') then {if (count allMapMarkers > uiNamespace getVariable 'ACE_EventHandler_MapMarker') then {{[allMapMarkers select count allMapMarkers - 1] call _x; nil} count ((missionNamespace getVariable 'ACE_EventHandler_MapMarker') select 2);}; uiNamespace setVariable ['ACE_EventHandler_MapMarker', count allMapMarkers];};";
				idc = -1;
				w = 0;
				h = 0;
			};
		};
	};
};
class RscInGameUI
{
	class RscUnitInfo
	{
		onLoad = "[""onLoad"", _this, ""RscUnitInfo"", 'IGUI'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf""; ['infoDisplayChanged',  [_this select 0,  'Any']]         call ace_common_fnc_localEvent;";
	};
	class RscUnitInfoNoHUD
	{
		onLoad = "['infoDisplayChanged',  [_this select 0,  'Any']] call ace_common_fnc_localEvent;";
	};
	class RscUnitInfoSoldier: RscUnitInfo
	{
		onLoad = "[""onLoad"", _this, ""RscUnitInfo"", 'IGUI'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf""; uiNamespace setVariable ['ACE_dlgSoldier',      _this select 0]; ['infoDisplayChanged',  [_this select 0,  'Soldier']]     call ace_common_fnc_localEvent;";
	};
	class RscUnitInfoTank: RscUnitInfo
	{
		onLoad = "[""onLoad"", _this, ""RscUnitInfo"", 'IGUI'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf""; uiNamespace setVariable ['ACE_dlgVehicle',      _this select 0]; ['infoDisplayChanged',  [_this select 0,  'Vehicle']]     call ace_common_fnc_localEvent;";
	};
	class RscUnitInfoAirNoWeapon: RscUnitInfo
	{
		onLoad = "[""onLoad"", _this, ""RscUnitInfo"", 'IGUI'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf""; uiNamespace setVariable ['ACE_dlgAircraft',     _this select 0]; ['infoDisplayChanged',  [_this select 0,  'Aircraft']]    call ace_common_fnc_localEvent;";
	};
	class RscUnitInfoAir: RscUnitInfoAirNoWeapon
	{
		onLoad = "[""onLoad"", _this, ""RscUnitInfo"", 'IGUI'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf""; uiNamespace setVariable ['ACE_dlgAircraft',     _this select 0]; ['infoDisplayChanged',  [_this select 0,  'Aircraft']]    call ace_common_fnc_localEvent;";
	};
	class RscUnitInfo_AH64D_gunner
	{
		onLoad = "uiNamespace setVariable ['ACE_dlgAircraft',     _this select 0]; ['infoDisplayChanged',  [_this select 0,  'Aircraft']]    call ace_common_fnc_localEvent;";
	};
	class RscUnitInfoUAV
	{
		onLoad = "uiNamespace setVariable ['ACE_dlgUAV',          _this select 0]; ['infoDisplayChanged',  [_this select 0,  'UAV']]         call ace_common_fnc_localEvent;";
	};
	class RscUnitInfoSubmarine: RscUnitInfo
	{
		onLoad = "[""onLoad"", _this, ""RscUnitInfo"", 'IGUI'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf""; uiNamespace setVariable ['ACE_dlgSubmarine',    _this select 0]; ['infoDisplayChanged',  [_this select 0,  'Submarine']]   call ace_common_fnc_localEvent;";
	};
	class RscUnitInfoShip: RscUnitInfo
	{
		onLoad = "[""onLoad"", _this, ""RscUnitInfo"", 'IGUI'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf""; uiNamespace setVariable ['ACE_dlgShip',         _this select 0]; ['infoDisplayChanged',  [_this select 0,  'Ship']]        call ace_common_fnc_localEvent;";
	};
	class RscWeaponEmpty
	{
		onLoad = "['infoDisplayChanged',  [_this select 0,  'Any']] call ace_common_fnc_localEvent;";
	};
	class RscWeaponRangeFinder
	{
		onLoad = "['infoDisplayChanged',  [_this select 0,  'Any']] call ace_common_fnc_localEvent;";
	};
	class RscWeaponRangeArtillery
	{
		onLoad = "uiNamespace setVariable ['ACE_dlgArtillery',    _this select 0]; ['infoDisplayChanged',  [_this select 0,  'Artillery']]   call ace_common_fnc_localEvent;";
	};
	class RscWeaponRangeArtilleryAuto
	{
		onLoad = "uiNamespace setVariable ['ACE_dlgArtillery',    _this select 0]; ['infoDisplayChanged',  [_this select 0,  'Artillery']]   call ace_common_fnc_localEvent;";
	};
	class RscWeaponRangeFinderPAS13
	{
		onLoad = "['infoDisplayChanged',  [_this select 0,  'Any']] call ace_common_fnc_localEvent;";
	};
	class RscOptics_LaserDesignator
	{
		onLoad = "['infoDisplayChanged',  [_this select 0,  'Any']] call ace_common_fnc_localEvent;";
	};
	class RscWeaponRangeFinderMAAWS
	{
		onLoad = "['infoDisplayChanged',  [_this select 0,  'Any']] call ace_common_fnc_localEvent;";
	};
	class RscWeaponRangeFinderAbramsCom
	{
		onLoad = "['infoDisplayChanged',  [_this select 0,  'Any']] call ace_common_fnc_localEvent;";
	};
	class RscWeaponRangeFinderAbramsGun
	{
		onLoad = "['infoDisplayChanged',  [_this select 0,  'Any']] call ace_common_fnc_localEvent;";
	};
	class RscWeaponRangeFinderStrykerMGSGun
	{
		onLoad = "['infoDisplayChanged',  [_this select 0,  'Any']] call ace_common_fnc_localEvent;";
	};
	class RscOptics_strider_commander
	{
		onLoad = "['infoDisplayChanged',  [_this select 0,  'Any']] call ace_common_fnc_localEvent;";
	};
	class RscOptics_titan
	{
		onLoad = "['infoDisplayChanged',  [_this select 0,  'Any']] call ace_common_fnc_localEvent;";
	};
	class RscOptics_punisher
	{
		onLoad = "['infoDisplayChanged',  [_this select 0,  'Any']] call ace_common_fnc_localEvent;";
	};
	class RscOptics_SDV_periscope
	{
		onLoad = "['infoDisplayChanged',  [_this select 0,  'Any']] call ace_common_fnc_localEvent;";
	};
	class RscUnitInfoParachute: RscUnitInfo
	{
		onLoad = "[""onLoad"", _this, ""RscUnitInfo"", 'IGUI'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf""; uiNamespace setVariable ['ACE_dlgParachute',    _this select 0]; ['infoDisplayChanged',  [_this select 0,  'Parachute']]   call ace_common_fnc_localEvent;";
	};
	class RscUnitVehicle
	{
		onLoad = "['infoDisplayChanged',  [_this select 0,  'Any']] call ace_common_fnc_localEvent;";
	};
	class RscOptics_LaserDesignator_02
	{
		onLoad = "['infoDisplayChanged',  [_this select 0,  'Any']] call ace_common_fnc_localEvent;";
	};
};
class RscDisplayInventory
{
	onLoad = "[""onLoad"", _this, ""RscDisplayInventory"", 'IGUI'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf""; ['inventoryDisplayLoaded',  _this] call ace_common_fnc_localEvent;";
};
class RscDisplayMainMap
{
	onLoad = "[""onLoad"", _this, ""RscDiary"", 'GUI'] call    (uinamespace getvariable 'BIS_fnc_initDisplay'); uiNamespace setVariable ['ACE_dlgMap',  _this select 0]; ['mapDisplayLoaded',  [_this select 0,  'Ingame']] call ace_common_fnc_localEvent;";
};
class RscDisplayGetReady: RscDisplayMainMap
{
	onLoad = "[""onLoad"", _this, ""RscDiary"", 'GUI'] call    (uinamespace getvariable 'BIS_fnc_initDisplay'); uiNamespace setVariable ['ACE_dlgMap',  _this select 0]; ['mapDisplayLoaded',  [_this select 0,  'Briefing']] call ace_common_fnc_localEvent;";
};
class RscDisplayServerGetReady: RscDisplayGetReady
{
	onLoad = "[""onLoad"", _this, ""RscDiary"", 'GUI'] call    (uinamespace getvariable 'BIS_fnc_initDisplay'); uiNamespace setVariable ['ACE_dlgMap',  _this select 0]; ['mapDisplayLoaded',  [_this select 0,  'ServerBriefing']] call ace_common_fnc_localEvent;";
};
class RscDisplayClientGetReady: RscDisplayGetReady
{
	onLoad = "[""onLoad"", _this, ""RscDiary"", 'GUI'] call    (uinamespace getvariable 'BIS_fnc_initDisplay'); uiNamespace setVariable ['ACE_dlgMap',  _this select 0]; ['mapDisplayLoaded',  [_this select 0,  'ClientBriefing']] call ace_common_fnc_localEvent;";
};
class CfgUIGrids
{
	class IGUI
	{
		class Presets
		{
			class Arma3
			{
				class Variables
				{
					grid_ACE_displayText[] = {{ "((safezoneX + safezoneW) - (10 *(((safezoneW / safezoneH) min 1.2) / 40)) - 2.9 *(((safezoneW / safezoneH) min 1.2) / 40))","safeZoneY + 0.175 * safezoneH","(10 *(((safezoneW / safezoneH) min 1.2) / 40))","(2 *((((safezoneW / safezoneH) min 1.2) / 1.2) / 25))" },"(((safezoneW / safezoneH) min 1.2) / 40)","((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)"};
				};
			};
		};
		class Variables
		{
			class grid_ACE_displayText
			{
				displayName = "ACE Hint";
				description = "Textual in game feedback to the player.";
				preview = "\a3\Ui_f\data\GUI\Cfg\UIGrids\grid_hint_ca.paa";
				saveToProfile[] = {0,1};
			};
		};
	};
};
class ACE_Extensions
{
	extensions[] = {};
};
//};
