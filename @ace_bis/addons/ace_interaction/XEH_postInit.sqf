// by commy2 and esteldunedain

#include "script_component.hpp"

ACE_Modifier = 0;

//SelectLeader Event Handler for BecomeLeader action:
[QGVAR(selectLeader), {
    PARAMS_2(_group,_leader);
    _group selectLeader _leader;
}] call EFUNC(common,addEventHandler);

if (!hasInterface) exitWith {};

GVAR(isOpeningDoor) = false;

// restore global fire teams for JIP
private ["_team"];
{
    _team = _x getVariable [QGVAR(assignedFireTeam), ""];
    if (_team != "") then {_x assignTeam _team};
} forEach allUnits;


// Add keybinds
["ACE3 Common", QGVAR(openDoor), localize "STR_ACE_Interaction_OpenDoor",
{
    // Conditions: canInteract
    if !([ACE_player, objNull, []] call EFUNC(common,canInteractWith)) exitWith {false};
    // Conditions: specific
    if (GVAR(isOpeningDoor) || {[2] call FUNC(getDoor) select 1 == ''}) exitWith {false};

    // Statement
    call EFUNC(interaction,openDoor);
    true
},
{
    //Probably don't want any condidtions here, so variable never gets locked down
    // Statement
    GVAR(isOpeningDoor) = false;
    true
},
[57, [false, true, false]], false] call cba_fnc_addKeybind; //Key CTRL+Space


["ACE3 Common", QGVAR(tapShoulder), localize "STR_ACE_Interaction_TapShoulder",
{
    // Conditions: canInteract
    if !([ACE_player, objNull, []] call EFUNC(common,canInteractWith)) exitWith {false};
    // Conditions: specific
    if !([ACE_player, cursorTarget] call FUNC(canTapShoulder)) exitWith {false};

    // Statement
    [ACE_player, cursorTarget, 0] call FUNC(tapShoulder);
    true
},
{false},
[20, [true, false, false]], false] call cba_fnc_addKeybind;

["ACE3 Common", QGVAR(modifierKey), localize "STR_ACE_Interaction_ModifierKey",
{
    // Conditions: canInteract
    //if !([ACE_player, objNull, ["isNotDragging"]] call EFUNC(common,canInteractWith)) exitWith {false};   // not needed

    // Statement
    ACE_Modifier = 1;
    // Return false so it doesn't block other actions
    false
},
{
    //Probably don't want any condidtions here, so variable never gets locked down
    ACE_Modifier = 0;
    false;
},
[29, [false, false, false]], false] call cba_fnc_addKeybind;

["ACE3 Common", QGVAR(Ymenu), "Menu Y",
{
    // Conditions: canInteract
	if !([ACE_player, objNull, ["isNotSwimming","isNotInside"]] call EFUNC(common,canInteractWith)) exitWith {false};
    //if !([ACE_player, objNull, ["isNotDragging"]] call EFUNC(common,canInteractWith)) exitWith {false};   // not needed
	// Conditions: specific
	// if!((!player getVariable [QGVAR(isEscorting), false]) && {!(player getVariable [QGVAR(isHandcuffed), false])} && {!(player getVariable [QGVAR(isSurrendering), false])} && {!(player getVariable ["ACE_isUnconscious", false])}) exitWith {false};
	
    // Statement
    [] call life_fnc_p_openMenu;
    true
},
{false},
[21, [false, false, false]], false] call cba_fnc_addKeybind;

["ACE3 Common", QGVAR(CopSiren), "Sirène véhicule",
{
    // Conditions: canInteract
    if !([ACE_player, objNull, ["isNotInside"]] call EFUNC(common,canInteractWith)) exitWith {false};   // not needed
	// Conditions: specific
	if!((playerSide in [west,independent]) && {vehicle player != player} && {!life_siren_active} && {(driver vehicle player) == player}) exitWith {false};
	
    // Statement
    [] call life_fnc_sirenstart;
    true
},
{false},
[33, [true, false, false]], false] call cba_fnc_addKeybind;

["ACE3 Common", QGVAR(CopRadar), "Radar Gendarmerie",
{
    // Conditions: canInteract
    if !([ACE_player, objNull, []] call EFUNC(common,canInteractWith)) exitWith {false};   // not needed
	// Conditions: specific
	// if!((playerSide in [west,independent]) && {vehicle player != player} && {!life_siren_active} && {(driver vehicle player) == player}) exitWith {false};
	
    // Statement
    [] call life_fnc_radar;
    true
},
{false},
[38, [false, false, false]], false] call cba_fnc_addKeybind;

["ACE3 Common", QGVAR(Carlock), "Vérouiller/Déverouiller véhicule",
{
    // Conditions: canInteract
	if !([ACE_player, objNull, ["isNotSwimming","isNotInside"]] call EFUNC(common,canInteractWith)) exitWith {false};
	// Conditions: specific
	// if!((!player getVariable [QGVAR(isEscorting), false]) && {!(player getVariable [QGVAR(isHandcuffed), false])} && {!(player getVariable [QGVAR(isSurrendering), false])} && {!(player getVariable ["ACE_isUnconscious", false])}) exitWith {false};
	
    // Statement
    [] call life_fnc_lockVehicleCheck;
    true
},
{false},
[22, [false, false, false]], false] call cba_fnc_addKeybind;

["ACE3 Common", QGVAR(OpenInventory), "Inventaire véhicule",
{
    // Conditions: canInteract
	if !([ACE_player, objNull, ["isNotSwimming","isNotInside"]] call EFUNC(common,canInteractWith)) exitWith {false};
	// Conditions: specific
	// if!((!player getVariable [QGVAR(isEscorting), false]) && {!(player getVariable [QGVAR(isHandcuffed), false])} && {!(player getVariable [QGVAR(isSurrendering), false])} && {!(player getVariable ["ACE_isUnconscious", false])}) exitWith {false};
	
    // Statement
    [] call life_fnc_openInventoryCheck;
    true
},
{false},
[20, [false, false, false]], false] call cba_fnc_addKeybind;

["ACE3 Common", QGVAR(Fight), "Combat - Main/Arme",
{
    // Conditions: canInteract
	if !([ACE_player, objNull, []] call EFUNC(common,canInteractWith)) exitWith {false};
	// Conditions: specific
	if!(isNil 'MOCAP_disabled_fighting' && {vehicle player == player}) exitWith {false};
	
    // Statement
    'hand' call MOCAP_RscDisplayMission_fnc_EH_keyDown;
    true
},
{false},
[46, [false, false, false]], false] call cba_fnc_addKeybind;

["ACE3 Common", QGVAR(FightLegs), "Combat - Pied",
{
    // Conditions: canInteract
	if !([ACE_player, objNull, []] call EFUNC(common,canInteractWith)) exitWith {false};
	// Conditions: specific
	if!(isNil 'MOCAP_disabled_fighting' && {vehicle player == player}) exitWith {false};
	
    // Statement
    'leg' call MOCAP_RscDisplayMission_fnc_EH_keyDown;
    true
},
{false},
[46, [true, false, false]], false] call cba_fnc_addKeybind;

["ACE3 Common", QGVAR(FightKill), "Combat - Etrangler",
{
    // Conditions: canInteract
	if !([ACE_player, objNull, []] call EFUNC(common,canInteractWith)) exitWith {false};
	// Conditions: specific
	if!(isNil 'MOCAP_disabled_fighting' && {vehicle player == player}) exitWith {false};
	
    // Statement
    'grab' call MOCAP_RscDisplayMission_fnc_EH_keyDown;
    true
},
{false},
[46, [false, true, false]], false] call cba_fnc_addKeybind;


["isNotDead", {alive _player && isNil (_player getVariable 'Revive')}] call EFUNC(common,addCanInteractWithCondition);
["isNotIncapacitated", {(animationState player) != 'Incapacitated' && !(player getVariable ['MOCAP_lockControls', false]) && !(player getVariable ['MOCAP_animationInProgress', false])}] call EFUNC(common,addCanInteractWithCondition);

["isNotSwimming", {!underwater (_this select 0)}] call EFUNC(common,addCanInteractWithCondition);
