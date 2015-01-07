////////////////////////////////////////////////////////////////////
//DeRap: Produced from mikero's Dos Tools Dll version 4.52
//Wed Jan 07 01:46:38 2015 : Source 'file' date Wed Jan 07 01:46:38 2015
//http://dev-heaven.net/projects/list_files/mikero-pbodll
////////////////////////////////////////////////////////////////////

#define _ARMA_

//Class C:/Users/sil/Documents/GitHub/altislife/@agm/addons/agm_interaction/config.bin{
class CfgPatches
{
	class AGM_Interaction
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.6;
		requiredAddons[] = {"AGM_Core"};
		version = "0.95";
		versionStr = "0.95";
		versionAr[] = {0,95,0};
		author[] = {"commy2","KoffeinFlummi","CAA-Picard"};
		authorUrl = "https://github.com/commy2/";
	};
};
class CfgFunctions
{
	class AGM_Interaction
	{
		class AGM_Interaction
		{
			file = "\AGM_interaction\functions";
			class addInteraction;
			class addInteractionSelf;
			class AddSelectableItem;
			class addToTooltip;
			class applyButtons;
			class canInteractWith;
			class canLockDoor;
			class canTapShoulder;
			class getActions2;
			class GetActions;
			class getDoor;
			class getDoorAnimations;
			class getDown;
			class getSelectedButton;
			class hideMenu;
			class hideMouseHint;
			class initialiseInteraction;
			class isInRange;
			class joinTeam;
			class lockDoor;
			class menuKeyInput;
			class moveDown;
			class onButtonDown;
			class onButtonDownSelf;
			class onButtonUp;
			class onClick;
			class onSelectMenuDblClick;
			class openDoor;
			class openMenu;
			class openMenuSelectUI;
			class openMenuSelf;
			class openSelectMenu;
			class openSubMenu;
			class openSubMenuSelf;
			class prepareSelectMenu;
			class push;
			class removeInteraction;
			class removeInteractionSelf;
			class removeTag;
			class sendAway;
			class showMenu;
			class showMouseHint;
			class sortOptionsByPriority;
			class tapShoulder;
			class updateTooltipPosition;
			class getCaptivityStatus;
			class setCaptivityStatus;
		};
	};
};
class Extended_PostInit_EventHandlers
{
	class AGM_Interaction
	{
		clientInit = "call compile preprocessFileLineNumbers '\AGM_Interaction\clientInit.sqf'";
	};
};
class Extended_GetIn_EventHandlers
{
	class All
	{
		class AGM_AutoCloseMenu
		{
			clientGetIn = "if (_this select 2 == AGM_player && {!isNull (findDisplay 1713999)}) then {(findDisplay 1713999) closeDisplay 1}";
		};
	};
};
class Extended_GetOut_EventHandlers
{
	class All
	{
		class AGM_AutoCloseMenu
		{
			clientGetOut = "if (_this select 2 == AGM_player && {!isNull (findDisplay 1713999)}) then {(findDisplay 1713999) closeDisplay 1}";
		};
	};
};
class AGM_Core_Default_Keys
{
	class openInteractionMenuNew
	{
		displayName = "$STR_AGM_Interaction_InteractionMenu";
		condition = "true";
		statement = "call AGM_Interaction_fnc_onButtonDown";
		conditionUp = "!isNull (findDisplay 1713999) && {profileNamespace getVariable ['AGM_Interaction_AutoCloseMenu', false]}";
		statementUp = "if (AGM_Interaction_MenuType mod 2 == 0) then {call AGM_Interaction_fnc_onButtonUp};";
		exceptions[] = {"AGM_Drag_isNotDragging","AGM_Medical_canTreat","AGM_Interaction_isNotEscorting","AGM_Interaction_isNotSwimming"};
		key = 219;
		shift = 0;
		control = 0;
		alt = 0;
	};
	class openInteractionMenuSelfNew
	{
		displayName = "$STR_AGM_Interaction_InteractionMenuSelf";
		condition = "true";
		statement = "call AGM_Interaction_fnc_onButtonDownSelf";
		conditionUp = "!isNull (findDisplay 1713999) && {profileNamespace getVariable ['AGM_Interaction_AutoCloseMenu', false]}";
		statementUp = "if (AGM_Interaction_MenuType mod 2 == 1) then {call AGM_Interaction_fnc_onButtonUp};";
		exceptions[] = {"AGM_Drag_isNotDragging","AGM_Medical_canTreat","AGM_Interaction_isNotEscorting","AGM_Interaction_isNotSwimming","AGM_Core_notOnMap"};
		key = 219;
		shift = 0;
		control = 1;
		alt = 0;
	};
	/*class openDoor
	{
		displayName = "$STR_AGM_Interaction_OpenDoor";
		condition = "!AGM_Interaction_isOpeningDoor && {[2] call AGM_Interaction_fnc_getDoor select 1 != ''}";
		statement = "call AGM_Interaction_fnc_openDoor";
		conditionUp = "AGM_Interaction_isOpeningDoor";
		statementUp = "AGM_Interaction_isOpeningDoor = false";
		key = 57;
		shift = 0;
		control = 1;
		alt = 0;
	};*/
	class tapShoulder
	{
		displayName = "$STR_AGM_Interaction_TapShoulder";
		condition = "[_player, cursorTarget] call AGM_Interaction_fnc_canTapShoulder";
		statement = "[_player, cursorTarget] call AGM_Interaction_fnc_tapShoulder";
		key = 20;
		shift = 1;
		control = 0;
		alt = 0;
	};
	class modifierKey
	{
		displayName = "$STR_AGM_Interaction_ModifierKey";
		condition = "";
		statement = "AGM_Modifier = 1;";
		conditionUp = "";
		statementUp = "AGM_Modifier = 0;";
		exceptions[] = {"AGM_Drag_isNotDragging"};
		key = 29;
		shift = 0;
		control = 0;
		alt = 0;
	};
	class Surrender {
		displayName = "Se rendre";
		condition = "!(player getVariable ['AGM_isCaptive', false]) && {!(player getVariable ['AGM_Unconscious', false])}";
		statement = "[player, true] call AGM_Interaction_fnc_surrender";
		exceptions[] = {"AGM_Interaction_isNotSurrendering"};
		key = 35;
		shift = 0;
		control = 0;
		alt = 1;
	};
	class Ymenu {
		displayName = "Menu Y";
		condition = "!(player getVariable ['AGM_isCaptive', false]) && {!(player getVariable ['AGM_Unconscious', false])} && {!(player getVariable ['AGM_isSurrender', false])}";
		statement = "[] call life_fnc_p_openMenu";
		key = 21;
		shift = 0;
		control = 0;
		alt = 0;
	};
	class CopSiren {
		displayName = "Sirène véhicule";
		condition = "playerSide in [west,independent] && {vehicle player != player} && {!life_siren_active} && {((driver vehicle player) == player)}";
		statement = "[] call life_fnc_sirenstart";
		key = 33;
		shift = 1;
		control = 0;
		alt = 0;
	};
	class CopRadar {
		displayName = "Radar Gendarmerie";
		condition = "!(player getVariable ['AGM_Unconscious', false])";
		statement = "[] call life_fnc_radar";
		key = 38;
		shift = 0;
		control = 0;
		alt = 0;
	};
	class Carlock {
		displayName = "Vérouiller/Déverouiller véhicule";
		condition = "!(player getVariable ['AGM_Unconscious', false])";
		statement = "[] call life_fnc_lockVehicleCheck";
		key = 22;
		shift = 0;
		control = 0;
		alt = 0;
	};
	class OpenInventory {
		displayName = "Inventaire véhicule";
		condition = "vehicle player == player";
		statement = "[] call life_fnc_openInventoryCheck";
		key = 20;
		shift = 0;
		control = 0;
		alt = 0;
	};
};
class AGM_Core_Options
{
	class Interaction_FlowMenu
	{
		displayName = "$STR_AGM_Interaction_FlowMenu";
		default = 0;
	};
	class Interaction_AutoCloseMenu
	{
		displayName = "$STR_AGM_Interaction_AutoCloseMenu";
		default = 0;
	};
	class Interaction_AutoCenterCursor
	{
		displayName = "$STR_AGM_Interaction_AutoCenterCursor";
		default = 1;
	};
};
class AGM_Parameters
{
	AGM_Modifier = 0;
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
	class AGM_Interaction_isNotSwimming
	{
		condition = "!underwater _player";
	};
};
class CfgVehicles
{
	class Man;
	class CAManBase: Man
	{
		class AGM_Actions
		{
			class AGM_TeamManagement
			{
				displayName = "$STR_AGM_Interaction_TeamManagement";
				distance = 4;
				condition = "alive _target && {!isPlayer _target} && {_target in units group _player}";
				statement = "";
				showDisabled = 0;
				priority = 3.2;
				icon = "\AGM_Interaction\UI\team\team_management_ca.paa";
				subMenu[] = {"AGM_TeamManagement",0};
				hotkey = "M";
				enableInside = 1;
				class AGM_JoinTeamRed
				{
					displayName = "$STR_AGM_Interaction_JoinTeamRed";
					distance = 4;
					condition = "alive _target && {!isPlayer _target} && {_target in units group _player}";
					statement = "[_target, 'RED'] call AGM_Interaction_fnc_joinTeam";
					showDisabled = 1;
					icon = "\AGM_Interaction\UI\team\team_red_ca.paa";
					priority = 2.4;
					hotkey = "R";
					enableInside = 1;
				};
				class AGM_JoinTeamGreen
				{
					displayName = "$STR_AGM_Interaction_JoinTeamGreen";
					distance = 4;
					condition = "alive _target && {!isPlayer _target} && {_target in units group _player}";
					statement = "[_target, 'GREEN'] call AGM_Interaction_fnc_joinTeam";
					showDisabled = 1;
					icon = "\AGM_Interaction\UI\team\team_green_ca.paa";
					priority = 2.3;
					hotkey = "G";
					enableInside = 1;
				};
				class AGM_JoinTeamBlue
				{
					displayName = "$STR_AGM_Interaction_JoinTeamBlue";
					distance = 4;
					condition = "alive _target && {!isPlayer _target} && {_target in units group _player}";
					statement = "[_target, 'BLUE'] call AGM_Interaction_fnc_joinTeam";
					showDisabled = 1;
					icon = "\AGM_Interaction\UI\team\team_blue_ca.paa";
					priority = 2.2;
					hotkey = "B";
					enableInside = 1;
				};
				class AGM_JoinTeamYellow
				{
					displayName = "$STR_AGM_Interaction_JoinTeamYellow";
					distance = 4;
					condition = "alive _target && {!isPlayer _target} && {_target in units group _player}";
					statement = "[_target, 'YELLOW'] call AGM_Interaction_fnc_joinTeam";
					showDisabled = 1;
					icon = "\AGM_Interaction\UI\team\team_yellow_ca.paa";
					priority = 2.1;
					hotkey = "Y";
					enableInside = 1;
				};
				class AGM_LeaveTeam
				{
					displayName = "$STR_AGM_Interaction_LeaveTeam";
					distance = 4;
					condition = "alive _target && {!isPlayer _target} && {_target in units group _player} && {assignedTeam _player != 'MAIN'}";
					statement = "[_target, 'MAIN'] call AGM_Interaction_fnc_joinTeam";
					showDisabled = 1;
					icon = "\AGM_Interaction\UI\team\team_white_ca.paa";
					priority = 2.5;
					hotkey = "N";
					enableInside = 1;
				};
			};
			class AGM_TapShoulder
			{
				displayName = "$STR_AGM_Interaction_TapShoulder";
				distance = 4;
				condition = "[_player, _target] call AGM_Interaction_fnc_canTapShoulder";
				statement = "[_player, _target] call AGM_Interaction_fnc_tapShoulder";
				showDisabled = 1;
				priority = 2.8;
				hotkey = "Q";
				enableInside = 1;
			};
			/*class AGM_JoinGroup
			{
				displayName = "$STR_AGM_Interaction_JoinGroup";
				distance = 4;
				condition = "side group _player == side group _target && {group _player != group _target}";
				statement = "[_player] joinSilent group _target;";
				showDisabled = 0;
				priority = 2.6;
				icon = "\AGM_Interaction\UI\team\team_management_ca.paa";
				hotkey = "J";
				enableInside = 1;
			};*/
			class AGM_GetDown
			{
				displayName = "$STR_AGM_Interaction_GetDown";
				distance = 4;
				condition = "[_target] call AGM_Interaction_fnc_canInteractWith";
				statement = "[_target] call AGM_Interaction_fnc_getDown";
				showDisabled = 0;
				priority = 2.2;
			};
			class AGM_SendAway
			{
				displayName = "$STR_AGM_Interaction_SendAway";
				distance = 4;
				condition = "[_target] call AGM_Interaction_fnc_canInteractWith";
				statement = "[_target] call AGM_Interaction_fnc_sendAway";
				showDisabled = 0;
				priority = 2;
			};
			/*class AGM_Pardon
			{
				displayName = "$STR_AGM_Interaction_Pardon";
				distance = 4;
				condition = "rating _target < -2000 && {alive _target} && {side group _player == side group _target}";
				statement = "[_target, '{_this addRating -rating _this}', _target] call AGM_Core_fnc_execRemoteFnc";
				showDisabled = 0;
				priority = 2.5;
				enableInside = 1;
			};*/
		};
		class AGM_SelfActions
		{
			class AGM_TeamManagement
			{
				displayName = "$STR_AGM_Interaction_TeamManagement";
				condition = "true";
				statement = "";
				showDisabled = 1;
				priority = 3.2;
				icon = "\AGM_Interaction\UI\team\team_management_ca.paa";
				subMenu[] = {"AGM_TeamManagement",1};
				enableInside = 1;
				hotkey = "M";
				class AGM_JoinTeamRed
				{
					displayName = "$STR_AGM_Interaction_JoinTeamRed";
					condition = "true";
					statement = "[_player, 'RED'] call AGM_Interaction_fnc_joinTeam";
					showDisabled = 1;
					priority = 2.4;
					icon = "\AGM_Interaction\UI\team\team_red_ca.paa";
					enableInside = 1;
					hotkey = "R";
				};
				class AGM_JoinTeamGreen
				{
					displayName = "$STR_AGM_Interaction_JoinTeamGreen";
					condition = "true";
					statement = "[_player, 'GREEN'] call AGM_Interaction_fnc_joinTeam";
					showDisabled = 1;
					priority = 2.3;
					icon = "\AGM_Interaction\UI\team\team_green_ca.paa";
					enableInside = 1;
					hotkey = "G";
				};
				class AGM_JoinTeamBlue
				{
					displayName = "$STR_AGM_Interaction_JoinTeamBlue";
					condition = "true";
					statement = "[_player, 'BLUE'] call AGM_Interaction_fnc_joinTeam";
					showDisabled = 1;
					priority = 2.2;
					icon = "\AGM_Interaction\UI\team\team_blue_ca.paa";
					enableInside = 1;
					hotkey = "B";
				};
				class AGM_JoinTeamYellow
				{
					displayName = "$STR_AGM_Interaction_JoinTeamYellow";
					condition = "true";
					statement = "[_player, 'YELLOW'] call AGM_Interaction_fnc_joinTeam";
					showDisabled = 1;
					priority = 2.1;
					icon = "\AGM_Interaction\UI\team\team_yellow_ca.paa";
					enableInside = 1;
					hotkey = "Y";
				};
				class AGM_LeaveTeam
				{
					displayName = "$STR_AGM_Interaction_LeaveTeam";
					condition = "assignedTeam _player != 'MAIN'";
					statement = "[_player, 'MAIN'] call AGM_Interaction_fnc_joinTeam";
					showDisabled = 1;
					priority = 2.5;
					icon = "\AGM_Interaction\UI\team\team_white_ca.paa";
					enableInside = 1;
					hotkey = "N";
				};
				/*class AGM_BecomeLeader
				{
					displayName = "$STR_AGM_Interaction_BecomeLeader";
					condition = "count (units group _player) > 1 && {leader group _player != _player}";
					statement = "_newGroup = createGroup side group _player; (units group _player) joinSilent _newGroup; _newGroup selectLeader _player;";
					showDisabled = 1;
					priority = 1;
					icon = "\AGM_Interaction\UI\team\team_white_ca.paa";
					enableInside = 1;
					hotkey = "L";
				};
				class AGM_LeaveGroup
				{
					displayName = "$STR_AGM_Interaction_LeaveGroup";
					condition = "count (units group _player) > 1";
					statement = "_oldGroup = units group _player; _newGroup = createGroup side _player; [_player] joinSilent _newGroup; {_player reveal _x} forEach _oldGroup;";
					showDisabled = 1;
					priority = 1.2;
					icon = "\AGM_Interaction\UI\team\team_management_ca.paa";
					enableInside = 1;
					hotkey = "M";
				};*/
			};
			class AGM_Gestures
			{
				displayName = "$STR_AGM_Interaction_Gestures";
				condition = "canStand _target";
				statement = "";
				showDisabled = 1;
				priority = 3.5;
				subMenu[] = {"AGM_Gestures",1};
				icon = "AGM_Interaction\UI\gestures_ca.paa";
				hotkey = "G";
				class AGM_Gesture_Advance
				{
					displayName = "$STR_AGM_Interaction_Gestures_Advance";
					condition = "canStand _target";
					statement = "_target playActionNow 'gestureAdvance';";
					showDisabled = 1;
					priority = 1.9;
					hotkey = "1";
				};
				class AGM_Gesture_Go
				{
					displayName = "$STR_AGM_Interaction_Gestures_Go";
					condition = "canStand _target";
					statement = "_target playActionNow (['gestureGo', 'gestureGoB'] select (floor random 2));";
					showDisabled = 1;
					priority = 1.8;
					hotkey = "2";
				};
				class AGM_Gesture_Follow
				{
					displayName = "$STR_AGM_Interaction_Gestures_Follow";
					condition = "canStand _target";
					statement = "_target playActionNow 'gestureFollow';";
					showDisabled = 1;
					priority = 1.7;
					hotkey = "3";
				};
				class AGM_Gesture_Up
				{
					displayName = "$STR_AGM_Interaction_Gestures_Up";
					condition = "canStand _target";
					statement = "_target playActionNow 'gestureUp';";
					showDisabled = 1;
					priority = 1.5;
					hotkey = "4";
				};
				class AGM_Gesture_Cover
				{
					displayName = "$STR_AGM_Interaction_Gestures_Cover";
					condition = "canStand _target";
					statement = "_target playActionNow 'gestureCover';";
					showDisabled = 1;
					priority = 1.4;
					hotkey = "5";
				};
				class AGM_Gesture_CeaseFire
				{
					displayName = "$STR_AGM_Interaction_Gestures_Cease_Fire";
					condition = "canStand _target";
					statement = "_target playActionNow 'gestureCeaseFire';";
					showDisabled = 1;
					priority = 1.3;
					hotkey = "6";
				};
				class AGM_Gesture_Freeze
				{
					displayName = "$STR_AGM_Interaction_Gestures_Freeze";
					condition = "canStand _target";
					statement = "_target playActionNow 'gestureFreeze';";
					showDisabled = 1;
					priority = 1.2;
					hotkey = "7";
				};
				class AGM_Gesture_Yes
				{
					displayName = "$STR_AGM_Interaction_Gestures_Yes";
					condition = "canStand _target";
					statement = "_target playActionNow (['gestureYes', 'gestureNod'] select (floor random 2));";
					showDisabled = 1;
					priority = 1.1;
					hotkey = "8";
				};
				class AGM_Gesture_No
				{
					displayName = "$STR_AGM_Interaction_Gestures_No";
					condition = "canStand _target";
					statement = "_target playActionNow 'gestureNo';";
					showDisabled = 1;
					priority = 1;
					hotkey = "9";
				};
				class AGM_Gesture_Hi
				{
					displayName = "$STR_AGM_Interaction_Gestures_Hi";
					condition = "canStand _target";
					statement = "_target playActionNow (['gestureHi', 'gestureHiB', 'gestureHiC'] select (floor random 3));";
					showDisabled = 1;
					priority = 0.9;
					hotkey = "0";
				};
			};
			class AGM_Equipment
			{
				displayName = "$STR_AGM_Interaction_Equipment";
				condition = "true";
				statement = "";
				showDisabled = 1;
				priority = 4.5;
				icon = "";
				subMenu[] = {"AGM_Equipment",1};
				enableInside = 1;
				hotkey = "E";
				class AGM_Dummy
				{
					displayName = "";
					condition = "false";
					statement = "";
					showDisabled = 1;
					priority = -99;
					icon = "AGM_Core\UI\blank_CO.paa";
					enableInside = 1;
				};
			};
		};
	};
	class LandVehicle;
	class Car: LandVehicle
	{
		class AGM_Actions{};
		class AGM_SelfActions{};
	};
	class Tank: LandVehicle
	{
		class AGM_Actions{};
		class AGM_SelfActions{};
	};
	class Air;
	class Helicopter: Air
	{
		class AGM_Actions{};
		class AGM_SelfActions{};
	};
	class Plane: Air
	{
		class AGM_Actions{};
		class AGM_SelfActions{};
	};
	class Ship;
	class Ship_F: Ship
	{
		class AGM_Actions
		{
			class AGM_Push
			{
				displayName = "$STR_AGM_Interaction_Push";
				distance = 4;
				condition = "getMass _target < 1000 and alive _target";
				statement = "[_target, [2 * (vectorDir _player select 0), 2 * (vectorDir _player select 1), 0.5]] call AGM_Interaction_fnc_push;";
				showDisabled = 0;
				priority = -1;
			};
		};
		class AGM_SelfActions{};
	};
	class StaticWeapon: LandVehicle
	{
		class AGM_Actions{};
		class AGM_SelfActions{};
	};
	class StaticMortar;
	class Mortar_01_base_F: StaticMortar
	{
		class AGM_Actions{};
		class AGM_SelfActions{};
	};
	class Box_NATO_Support_F;
	class AGM_Box_Misc: Box_NATO_Support_F
	{
		class TransportItems
		{
			class _xx_AGM_CableTie
			{
				name = "AGM_CableTie";
				count = 24;
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
		displayName = "$STR_AGM_Interaction_CableTie_Name";
		descriptionShort = "$STR_AGM_Interaction_CableTie_Description";
		model = "\AGM_Interaction\agm_cabletie.p3d";
		picture = "\AGM_Interaction\UI\agm_cabletie_x_ca.paa";
		scope = 2;
		class ItemInfo: InventoryItem_Base_F
		{
			mass = 1;
		};
	};
};
class RscStructuredText;
class AGM_Interaction_Button_Base
{
	tooltip = "";
	action = "";
	idc = -1;
	access = 0;
	type = 1;
	text = "";
	font = "PuristaMedium";
	sizeEx = "0.8 / 40 / (getResolution select 5)";
	shadow = 2;
	style = 2;
	x = 0;
	y = 0;
	w = "2.0 / 16 * safezoneW";
	h = "0.3 / 9 * safezoneH";
	offsetX = 0.003;
	offsetY = 0.003;
	offsetPressedX = 0.002;
	offsetPressedY = 0.002;
	borderSize = 0;
	colorText[] = {1,1,1,1};
	colorDisabled[] = {0.5,0.5,0.5,1};
	colorBackground[] = {0,0,0,0.8};
	colorBackgroundDisabled[] = {0,0,0,0.8};
	colorBackgroundActive[] = {1,1,1,0};
	colorFocused[] = {1,1,1,1};
	colorShadow[] = {0,0,0,0};
	colorBorder[] = {1,1,1,0.8};
	soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
	soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};
	soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
	soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
};
class AGM_Interaction_Dialog
{
	idd = 1713999;
	enableSimulation = 1;
	movingEnable = 0;
	onLoad = "_dlgInteractionDialog = _this select 0; for '_a' from 10 to 19 do {(_dlgInteractionDialog displayCtrl _a) ctrlShow false}; uiNamespace setVariable ['AGM_Interaction_Dialog', _dlgInteractionDialog];";
	objects[] = {};
	class controls
	{
		class Interaction_BackgroundMain: AGM_Interaction_Button_Base
		{
			type = 0;
			style = 2;
			idc = 2;
			colorBackground[] = {0,0,0,0.5};
			colorBackgroundDisabled[] = {0,0,0,0.5};
			x = "(0.5-1.8/16/2 + 0 * 0.1) * safezoneW + safezoneX";
			y = "(0.5-0.55/9/2 + 0 * 0.04) * safezoneH + safezoneY";
			w = "1.8 / 16 * safezoneW";
			h = "0.55 / 9 * safezoneH";
		};
		class Interaction_ButtonMain: AGM_Interaction_Button_Base
		{
			action = "-1 call AGM_Interaction_fnc_onClick;";
			style = 2;
			tooltip = "";
			text = "Interaction Menu";
			idc = 3;
			sizeEx = "0.6 / 40 / (getResolution select 5)";
			colorBackground[] = {0,0,0,0};
			colorBackgroundDisabled[] = {0,0,0,0};
			colorBackgroundActive[] = {1,1,1,0.2};
			colorFocused[] = {0,0,0,0};
			x = "(0.5-1.8/16/2 + 0 * 0.1) * safezoneW + safezoneX";
			y = "(0.5-0.55/9/2 + 0 * 0.04) * safezoneH + safezoneY";
			w = "1.8 / 16 * safezoneW";
			h = "0.55 / 9 * safezoneH";
		};
		class Interaction_Background0: AGM_Interaction_Button_Base
		{
			type = 0;
			style = 2;
			idc = 40;
			colorBackground[] = {0,0,0,0.5};
			colorBackgroundDisabled[] = {0,0,0,0.5};
			x = "(0.5-2.0/16/2 + 0 * 0.1) * safezoneW + safezoneX";
			y = "(0.5-0.3/9/2 - 2.5 * 0.04) * safezoneH + safezoneY";
			w = "2.0 / 16 * safezoneW";
			h = "0.3 / 9 * safezoneH";
		};
		class Interaction_Background1: Interaction_Background0
		{
			idc = 41;
			x = "(0.5-2.0/16/2 + 1.0 * 0.1) * safezoneW + safezoneX";
			y = "(0.5-0.3/9/2 - 1.5 * 0.04) * safezoneH + safezoneY";
			w = "2.0 / 16 * safezoneW";
			h = "0.3 / 9 * safezoneH";
		};
		class Interaction_Background2: Interaction_Background0
		{
			idc = 42;
			x = "(0.5-2.0/16/2 + 1.25 * 0.1) * safezoneW + safezoneX";
			y = "(0.5-0.3/9/2 - 0.5 * 0.04) * safezoneH + safezoneY";
			w = "2.0 / 16 * safezoneW";
			h = "0.3 / 9 * safezoneH";
		};
		class Interaction_Background3: Interaction_Background0
		{
			idc = 43;
			x = "(0.5-2.0/16/2 + 1.25 * 0.1) * safezoneW + safezoneX";
			y = "(0.5-0.3/9/2 + 0.5 * 0.04) * safezoneH + safezoneY";
			w = "2.0 / 16 * safezoneW";
			h = "0.3 / 9 * safezoneH";
		};
		class Interaction_Background4: Interaction_Background0
		{
			idc = 44;
			x = "(0.5-2.0/16/2 + 1.0 * 0.1) * safezoneW + safezoneX";
			y = "(0.5-0.3/9/2 + 1.5 * 0.04) * safezoneH + safezoneY";
			w = "2.0 / 16 * safezoneW";
			h = "0.3 / 9 * safezoneH";
		};
		class Interaction_Background5: Interaction_Background0
		{
			idc = 45;
			x = "(0.5-2.0/16/2 + 0 * 0.1) * safezoneW + safezoneX";
			y = "(0.5-0.3/9/2 + 2.5 * 0.04) * safezoneH + safezoneY";
			w = "2.0 / 16 * safezoneW";
			h = "0.3 / 9 * safezoneH";
		};
		class Interaction_Background6: Interaction_Background0
		{
			idc = 46;
			x = "(0.5-2.0/16/2 - 1.0 * 0.1) * safezoneW + safezoneX";
			y = "(0.5-0.3/9/2 + 1.5 * 0.04) * safezoneH + safezoneY";
			w = "2.0 / 16 * safezoneW";
			h = "0.3 / 9 * safezoneH";
		};
		class Interaction_Background7: Interaction_Background0
		{
			idc = 47;
			x = "(0.5-2.0/16/2 - 1.25 * 0.1) * safezoneW + safezoneX";
			y = "(0.5-0.3/9/2 + 0.5 * 0.04) * safezoneH + safezoneY";
			w = "2.0 / 16 * safezoneW";
			h = "0.3 / 9 * safezoneH";
		};
		class Interaction_Background8: Interaction_Background0
		{
			idc = 48;
			x = "(0.5-2.0/16/2 - 1.25 * 0.1) * safezoneW + safezoneX";
			y = "(0.5-0.3/9/2 - 0.5 * 0.04) * safezoneH + safezoneY";
			w = "2.0 / 16 * safezoneW";
			h = "0.3 / 9 * safezoneH";
		};
		class Interaction_Background9: Interaction_Background0
		{
			idc = 49;
			x = "(0.5-2.0/16/2 - 1.0 * 0.1) * safezoneW + safezoneX";
			y = "(0.5-0.3/9/2 - 1.5 * 0.04) * safezoneH + safezoneY";
			w = "2.0 / 16 * safezoneW";
			h = "0.3 / 9 * safezoneH";
		};
		class Interaction_Icon0: AGM_Interaction_Button_Base
		{
			tooltip = "";
			text = "";
			idc = 20;
			type = 0;
			style = 48;
			colorBackground[] = {0,0,0,0};
			x = "(0.5-(2.0-0.05)/16/2 + 0 * 0.1) * safezoneW + safezoneX";
			y = "(0.5-(0.3-0.05)/9/2 - 2.5 * 0.04) * safezoneH + safezoneY";
			w = "(0.3-0.05) / 16 * safezoneW";
			h = "(0.3-0.05) / 9 * safezoneH";
		};
		class Interaction_Icon1: Interaction_Icon0
		{
			idc = 21;
			x = "(0.5-(2.0-0.05)/16/2 + 1.0 * 0.1) * safezoneW + safezoneX";
			y = "(0.5-(0.3-0.05)/9/2 - 1.5 * 0.04) * safezoneH + safezoneY";
			w = "(0.3-0.05) / 16 * safezoneW";
			h = "(0.3-0.05) / 9 * safezoneH";
		};
		class Interaction_Icon2: Interaction_Icon0
		{
			idc = 22;
			x = "(0.5-(2.0-0.05)/16/2 + 1.25 * 0.1) * safezoneW + safezoneX";
			y = "(0.5-(0.3-0.05)/9/2 - 0.5 * 0.04) * safezoneH + safezoneY";
			w = "(0.3-0.05) / 16 * safezoneW";
			h = "(0.3-0.05) / 9 * safezoneH";
		};
		class Interaction_Icon3: Interaction_Icon0
		{
			idc = 23;
			x = "(0.5-(2.0-0.05)/16/2 + 1.25 * 0.1) * safezoneW + safezoneX";
			y = "(0.5-(0.3-0.05)/9/2 + 0.5 * 0.04) * safezoneH + safezoneY";
			w = "(0.3-0.05) / 16 * safezoneW";
			h = "(0.3-0.05) / 9 * safezoneH";
		};
		class Interaction_Icon4: Interaction_Icon0
		{
			idc = 24;
			x = "(0.5-(2.0-0.05)/16/2 + 1.0 * 0.1) * safezoneW + safezoneX";
			y = "(0.5-(0.3-0.05)/9/2 + 1.5 * 0.04) * safezoneH + safezoneY";
			w = "(0.3-0.05) / 16 * safezoneW";
			h = "(0.3-0.05) / 9 * safezoneH";
		};
		class Interaction_Icon5: Interaction_Icon0
		{
			idc = 25;
			x = "(0.5-(2.0-0.05)/16/2 + 0 * 0.1) * safezoneW + safezoneX";
			y = "(0.5-(0.3-0.05)/9/2 + 2.5 * 0.04) * safezoneH + safezoneY";
			w = "(0.3-0.05) / 16 * safezoneW";
			h = "(0.3-0.05) / 9 * safezoneH";
		};
		class Interaction_Icon6: Interaction_Icon0
		{
			idc = 26;
			x = "(0.5-(2.0-0.05)/16/2 - 1.0 * 0.1) * safezoneW + safezoneX";
			y = "(0.5-(0.3-0.05)/9/2 + 1.5 * 0.04) * safezoneH + safezoneY";
			w = "(0.3-0.05) / 16 * safezoneW";
			h = "(0.3-0.05) / 9 * safezoneH";
		};
		class Interaction_Icon7: Interaction_Icon0
		{
			idc = 27;
			x = "(0.5-(2.0-0.05)/16/2 - 1.25 * 0.1) * safezoneW + safezoneX";
			y = "(0.5-(0.3-0.05)/9/2 + 0.5 * 0.04) * safezoneH + safezoneY";
			w = "(0.3-0.05) / 16 * safezoneW";
			h = "(0.3-0.05) / 9 * safezoneH";
		};
		class Interaction_Icon8: Interaction_Icon0
		{
			idc = 28;
			x = "(0.5-(2.0-0.05)/16/2 - 1.25 * 0.1) * safezoneW + safezoneX";
			y = "(0.5-(0.3-0.05)/9/2 - 0.5 * 0.04) * safezoneH + safezoneY";
			w = "(0.3-0.05) / 16 * safezoneW";
			h = "(0.3-0.05) / 9 * safezoneH";
		};
		class Interaction_Icon9: Interaction_Icon0
		{
			idc = 29;
			x = "(0.5-(2.0-0.05)/16/2 - 1.0 * 0.1) * safezoneW + safezoneX";
			y = "(0.5-(0.3-0.05)/9/2 - 1.5 * 0.04) * safezoneH + safezoneY";
			w = "(0.3-0.05) / 16 * safezoneW";
			h = "(0.3-0.05) / 9 * safezoneH";
		};
		class Interaction_Shortcut0: AGM_Interaction_Button_Base
		{
			tooltip = "";
			text = "";
			idc = 30;
			style = 2;
			colorBackground[] = {0,0,0,0};
			x = "(0.5+2.0/16/2-0.3/16 + 0 * 0.1) * safezoneW + safezoneX";
			y = "(0.5-0.3/9/2 - 2.5 * 0.04) * safezoneH + safezoneY";
			w = "0.3 / 16 * safezoneW";
			h = "0.3 / 9 * safezoneH";
		};
		class Interaction_Shortcut1: Interaction_Shortcut0
		{
			idc = 31;
			type = 0;
			x = "(0.5+2.0/16/2-0.3/16 + 1.0 * 0.1) * safezoneW + safezoneX";
			y = "(0.5-0.3/9/2 - 1.5 * 0.04) * safezoneH + safezoneY";
			w = "0.3 / 16 * safezoneW";
			h = "0.3 / 9 * safezoneH";
		};
		class Interaction_Shortcut2: Interaction_Shortcut0
		{
			idc = 32;
			type = 0;
			x = "(0.5+2.0/16/2-0.3/16 + 1.25 * 0.1) * safezoneW + safezoneX";
			y = "(0.5-0.3/9/2 - 0.5 * 0.04) * safezoneH + safezoneY";
			w = "0.3 / 16 * safezoneW";
			h = "0.3 / 9 * safezoneH";
		};
		class Interaction_Shortcut3: Interaction_Shortcut0
		{
			idc = 33;
			type = 0;
			x = "(0.5+2.0/16/2-0.3/16 + 1.25 * 0.1) * safezoneW + safezoneX";
			y = "(0.5-0.3/9/2 + 0.5 * 0.04) * safezoneH + safezoneY";
			w = "0.3 / 16 * safezoneW";
			h = "0.3 / 9 * safezoneH";
		};
		class Interaction_Shortcut4: Interaction_Shortcut0
		{
			idc = 34;
			type = 0;
			x = "(0.5+2.0/16/2-0.3/16 + 1.0 * 0.1) * safezoneW + safezoneX";
			y = "(0.5-0.3/9/2 + 1.5 * 0.04) * safezoneH + safezoneY";
			w = "0.3 / 16 * safezoneW";
			h = "0.3 / 9 * safezoneH";
		};
		class Interaction_Shortcut5: Interaction_Shortcut0
		{
			idc = 35;
			type = 0;
			x = "(0.5+2.0/16/2-0.3/16 + 0 * 0.1) * safezoneW + safezoneX";
			y = "(0.5-0.3/9/2 + 2.5 * 0.04) * safezoneH + safezoneY";
			w = "0.3 / 16 * safezoneW";
			h = "0.3 / 9 * safezoneH";
		};
		class Interaction_Shortcut6: Interaction_Shortcut0
		{
			idc = 36;
			type = 0;
			x = "(0.5+2.0/16/2-0.3/16 - 1.0 * 0.1) * safezoneW + safezoneX";
			y = "(0.5-0.3/9/2 + 1.5 * 0.04) * safezoneH + safezoneY";
			w = "0.3 / 16 * safezoneW";
			h = "0.3 / 9 * safezoneH";
		};
		class Interaction_Shortcut7: Interaction_Shortcut0
		{
			idc = 37;
			type = 0;
			x = "(0.5+2.0/16/2-0.3/16 - 1.25 * 0.1) * safezoneW + safezoneX";
			y = "(0.5-0.3/9/2 + 0.5 * 0.04) * safezoneH + safezoneY";
			w = "0.3 / 16 * safezoneW";
			h = "0.3 / 9 * safezoneH";
		};
		class Interaction_Shortcut8: Interaction_Shortcut0
		{
			idc = 38;
			type = 0;
			x = "(0.5+2.0/16/2-0.3/16 - 1.25 * 0.1) * safezoneW + safezoneX";
			y = "(0.5-0.3/9/2 - 0.5 * 0.04) * safezoneH + safezoneY";
			w = "0.3 / 16 * safezoneW";
			h = "0.3 / 9 * safezoneH";
		};
		class Interaction_Shortcut9: Interaction_Shortcut0
		{
			idc = 39;
			type = 0;
			x = "(0.5+2.0/16/2-0.3/16 - 1.0 * 0.1) * safezoneW + safezoneX";
			y = "(0.5-0.3/9/2 - 1.5 * 0.04) * safezoneH + safezoneY";
			w = "0.3 / 16 * safezoneW";
			h = "0.3 / 9 * safezoneH";
		};
		class Interaction_Button0: AGM_Interaction_Button_Base
		{
			action = "0 call AGM_Interaction_fnc_onClick;";
			style = 2;
			tooltip = "";
			text = "";
			idc = 10;
			colorBackground[] = {0,0,0,0};
			colorBackgroundDisabled[] = {0,0,0,0};
			colorBackgroundActive[] = {1,1,1,0.2};
			colorFocused[] = {0,0,0,0};
			x = "(0.5-2.0/16/2 + 0 * 0.1) * safezoneW + safezoneX";
			y = "(0.5-0.3/9/2 - 2.5 * 0.04) * safezoneH + safezoneY";
			w = "2.0 / 16 * safezoneW";
			h = "0.3 / 9 * safezoneH";
		};
		class Interaction_Button1: Interaction_Button0
		{
			action = "1 call AGM_Interaction_fnc_onClick;";
			idc = 11;
			x = "(0.5-2.0/16/2 + 1.0 * 0.1) * safezoneW + safezoneX";
			y = "(0.5-0.3/9/2 - 1.5 * 0.04) * safezoneH + safezoneY";
			w = "2.0 / 16 * safezoneW";
			h = "0.3 / 9 * safezoneH";
		};
		class Interaction_Button2: Interaction_Button0
		{
			action = "2 call AGM_Interaction_fnc_onClick;";
			idc = 12;
			x = "(0.5-2.0/16/2 + 1.25 * 0.1) * safezoneW + safezoneX";
			y = "(0.5-0.3/9/2 - 0.5 * 0.04) * safezoneH + safezoneY";
			w = "2.0 / 16 * safezoneW";
			h = "0.3 / 9 * safezoneH";
		};
		class Interaction_Button3: Interaction_Button0
		{
			action = "3 call AGM_Interaction_fnc_onClick;";
			idc = 13;
			x = "(0.5-2.0/16/2 + 1.25 * 0.1) * safezoneW + safezoneX";
			y = "(0.5-0.3/9/2 + 0.5 * 0.04) * safezoneH + safezoneY";
			w = "2.0 / 16 * safezoneW";
			h = "0.3 / 9 * safezoneH";
		};
		class Interaction_Button4: Interaction_Button0
		{
			action = "4 call AGM_Interaction_fnc_onClick;";
			idc = 14;
			x = "(0.5-2.0/16/2 + 1.0 * 0.1) * safezoneW + safezoneX";
			y = "(0.5-0.3/9/2 + 1.5 * 0.04) * safezoneH + safezoneY";
			w = "2.0 / 16 * safezoneW";
			h = "0.3 / 9 * safezoneH";
		};
		class Interaction_Button5: Interaction_Button0
		{
			action = "5 call AGM_Interaction_fnc_onClick;";
			idc = 15;
			x = "(0.5-2.0/16/2 + 0 * 0.1) * safezoneW + safezoneX";
			y = "(0.5-0.3/9/2 + 2.5 * 0.04) * safezoneH + safezoneY";
			w = "2.0 / 16 * safezoneW";
			h = "0.3 / 9 * safezoneH";
		};
		class Interaction_Button6: Interaction_Button0
		{
			action = "6 call AGM_Interaction_fnc_onClick;";
			idc = 16;
			x = "(0.5-2.0/16/2 - 1.0 * 0.1) * safezoneW + safezoneX";
			y = "(0.5-0.3/9/2 + 1.5 * 0.04) * safezoneH + safezoneY";
			w = "2.0 / 16 * safezoneW";
			h = "0.3 / 9 * safezoneH";
		};
		class Interaction_Button7: Interaction_Button0
		{
			action = "7 call AGM_Interaction_fnc_onClick;";
			idc = 17;
			x = "(0.5-2.0/16/2 - 1.25 * 0.1) * safezoneW + safezoneX";
			y = "(0.5-0.3/9/2 + 0.5 * 0.04) * safezoneH + safezoneY";
			w = "2.0 / 16 * safezoneW";
			h = "0.3 / 9 * safezoneH";
		};
		class Interaction_Button8: Interaction_Button0
		{
			action = "8 call AGM_Interaction_fnc_onClick;";
			idc = 18;
			x = "(0.5-2.0/16/2 - 1.25 * 0.1) * safezoneW + safezoneX";
			y = "(0.5-0.3/9/2 - 0.5 * 0.04) * safezoneH + safezoneY";
			w = "2.0 / 16 * safezoneW";
			h = "0.3 / 9 * safezoneH";
		};
		class Interaction_Button9: Interaction_Button0
		{
			action = "9 call AGM_Interaction_fnc_onClick;";
			idc = 19;
			x = "(0.5-2.0/16/2 - 1.0 * 0.1) * safezoneW + safezoneX";
			y = "(0.5-0.3/9/2 - 1.5 * 0.04) * safezoneH + safezoneY";
			w = "2.0 / 16 * safezoneW";
			h = "0.3 / 9 * safezoneH";
		};
	};
};
class RscListbox;
class IGUIBack;
class RscText;
class RscAGM_SelectAnItem
{
	idd = 8854;
	movingEnable = 0;
	class controls
	{
		class back: IGUIBack
		{
			x = 0.2;
			y = 0;
			w = 0.6;
			h = 0.71;
			colorBackground[] = {0,0,0,0.2};
		};
		class header: RscText
		{
			idc = 8870;
			x = "0.2 + 0.005";
			y = 0.005;
			w = 0.59;
			h = 0.05;
			style = 2;
			text = "";
		};
		class itemList: RscListbox
		{
			onMouseButtonDblClick = "_this call AGM_Interaction_fnc_onSelectMenuDblClick";
			idc = 8866;
			x = "0.2 + 0.005";
			w = 0.59;
			h = 0.54;
			y = 0.06;
		};
		class cancelBtnBackground: AGM_Interaction_Button_Base
		{
			type = 0;
			style = 2;
			idc = -1;
			colorBackground[] = {0,0,0,0.5};
			colorBackgroundDisabled[] = {0,0,0,0.5};
			x = "0.2 + 0.005";
			w = 0.15;
			h = 0.1;
			y = 0.605;
		};
		class approveBtnBackground: AGM_Interaction_Button_Base
		{
			type = 0;
			style = 2;
			idc = -1;
			colorBackground[] = {0,0,0,0.5};
			colorBackgroundDisabled[] = {0,0,0,0.5};
			x = "0.2 + 0.445";
			y = 0.605;
			h = 0.1;
			w = 0.15;
		};
		class cancelBtn: AGM_Interaction_Button_Base
		{
			idc = 8855;
			x = "0.2 + 0.005";
			w = 0.15;
			h = 0.1;
			y = 0.605;
			style = 2;
			text = "$STR_AGM_Interaction_Back";
			action = "call AGM_Interaction_fnc_hideMenu;";
			colorBackground[] = {0,0,0,0};
			colorBackgroundDisabled[] = {0,0,0,0};
			colorBackgroundActive[] = {1,1,1,0.2};
			colorFocused[] = {0,0,0,0};
		};
		class approveBtn: AGM_Interaction_Button_Base
		{
			idc = 8860;
			x = "0.2 + 0.445";
			y = 0.605;
			h = 0.1;
			w = 0.15;
			style = 2;
			text = "$STR_AGM_Interaction_MakeSelection";
			action = "call AGM_Interaction_fnc_hideMenu;";
			colorBackground[] = {0,0,0,0};
			colorBackgroundDisabled[] = {0,0,0,0};
			colorBackgroundActive[] = {1,1,1,0.2};
			colorFocused[] = {0,0,0,0};
		};
	};
};
class RscPicture;
class RscInteractionIcon: RscPicture
{
	x = "19.25 * (0.025)";
	y = "15.75 * (0.04)";
	w = "2*(0.04)";
	h = "2*(0.04)";
};
class RscInteractionHelperIcon: RscInteractionIcon
{
	x = "20 * (0.025)";
	y = "16 * (0.04)";
	w = "(0.04)";
	h = "(0.04)";
};
class RscInteractionText: RscText
{
	x = "21 * (0.025)";
	y = "16 * (0.04)";
	w = "8 * (0.025)";
	h = "1.5 * (0.04)";
};
class RscTitles
{
	class AGM_FlowMenu
	{
		idd = 9920;
		enableSimulation = 1;
		movingEnable = 0;
		fadeIn = 0.5;
		fadeOut = 0.5;
		duration = 1e+011;
		onLoad = "uiNamespace setVariable ['AGM_Flow_Display', _this select 0];";
		class controls
		{
			class RearIcon: RscInteractionIcon
			{
				idc = 999;
				text = "AGM_interaction\UI\CenterIcon_ca.paa";
				x = "17.9 * (0.025)";
				y = "10 * (0.04)";
				w = "3.7 * (0.04)";
				h = "5.75 * (0.04)";
			};
			class TopIcon: RscInteractionIcon
			{
				idc = 1200;
				h = "1 * (0.04)";
				y = "9 * (0.04)";
			};
			class FirstIcon: RscInteractionIcon
			{
				idc = 1201;
				y = "10.25 * (0.04)";
				h = "1.5 * (0.04)";
			};
			class SelectedItemIcon: RscInteractionIcon
			{
				idc = 1202;
				y = "12 * (0.04)";
			};
			class ThirdIcon: RscInteractionIcon
			{
				idc = 1203;
				y = "14.25 * (0.04)";
				h = "1.5 * (0.04)";
			};
			class BottomIcon: TopIcon
			{
				idc = 1204;
				y = "16 * (0.04)";
			};
			class ItemName: RscText
			{
				idc = 1000;
				style = 1;
				x = "5.25 * (0.025)";
				y = "12.15 * (0.04)";
				w = "13 * (0.025)";
				h = "1.5 * (0.04)";
				colorBackground[] = {0.3,0.3,0.3,0.8};
			};
			class BackIcon: RscInteractionIcon
			{
				idc = 1210;
				text = "AGM_interaction\UI\backArrow_ca.paa";
				x = "18.25 * (0.025)";
				y = "12.69 * (0.04)";
				w = "0.5 * (0.025)";
				h = "0.5 * (0.04)";
			};
			class ItemDetails: RscStructuredText
			{
				idc = 1100;
				style = 12;
				x = "23.5 * (0.025)";
				y = "11 * (0.04)";
				w = "13 * (0.025)";
				h = "3.9 * (0.04)";
				colorBackground[] = {0,0,0,0.4};
			};
		};
	};
	class AGM_InteractionHelper
	{
		idd = 9930;
		enableSimulation = 1;
		movingEnable = 0;
		fadeIn = 0.5;
		fadeOut = 0.5;
		duration = 1e+011;
		onLoad = "uiNamespace setVariable ['AGM_Helper_Display', _this select 0];";
		class controls
		{
			class SelectIcon: RscInteractionHelperIcon
			{
				idc = 1200;
				text = "AGM_interaction\UI\mouse_left_ca.paa";
				y = "17.5 * (0.04)";
			};
			class SelectText: RscInteractionText
			{
				idc = 1000;
				y = "17 * (0.04)";
				text = "$STR_AGM_Interaction_MakeSelection";
			};
			class GoBackIcon: RscInteractionHelperIcon
			{
				idc = 1201;
				text = "AGM_interaction\UI\mouse_right_ca.paa";
				y = "19.5 * (0.04)";
			};
			class GoBackText: RscInteractionText
			{
				idc = 1001;
				y = "19 * (0.04)";
				text = "$STR_AGM_Interaction_Back";
			};
			class ScrollIcon: RscInteractionHelperIcon
			{
				idc = 1202;
				text = "AGM_interaction\UI\mouse_scroll_ca.paa";
				y = "18.5 * (0.04)";
			};
			class ScrollText: RscInteractionText
			{
				idc = 1002;
				y = "18 * (0.04)";
				text = "$STR_AGM_Interaction_ScrollHint";
			};
		};
	};
};
class cfgMods
{
	author = "";
	timepacked = "1419181208";
};
//};
