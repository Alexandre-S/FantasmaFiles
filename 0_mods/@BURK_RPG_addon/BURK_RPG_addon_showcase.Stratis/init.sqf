/*
	File: BURK_RPG_addon_showcase.Stratis\init.sqf

	Author: Burkhar

	BURK RPG addon: Showcase
*/

// Include action functions
#include "scripts\functions.sqf";

// KillzoneKid created excelent private variable extractor on his web. Definite try: http://killzonekid.com/arma-simple-private-variable-extractor/
private ["_housePosList", "_lootPos"];

// Sometimes you have to wait
waitUntil {!isNil {BIS_fnc_init}};
waitUntil {player == player};

// Fade in
[] spawn {
	private ["_tmpTime"];

	_tmpTime = time + 15;
	titleText ["BURK RPG addon:\nShowcase", "BLACK IN", 10];

	waitUntil {time > _tmpTime};
	_tmpTime = nil;
};

// Barrel init
BURK_waterBarrel setVariable ["BURK_waterSource", true];

// Player house
BURK_housePlayer = [0, 0, 0] nearestObject 144173;

// Neighbor house
BURK_houseNeighbor = [0, 0, 0] nearestObject 144192;

// Markers
BURK_mrk_housePlayer = createMarker ["BURK_mrk_housePlayer", BURK_housePlayer];
BURK_mrk_housePlayer setMarkerShape "ICON";
BURK_mrk_housePlayer setMarkerType "BURK_mrkHome";
BURK_mrk_housePlayer setMarkerColor "ColorGreen";

BURK_mrk_waterBarrel = createMarker ["BURK_mrk_waterBarrel", BURK_waterBarrel];
BURK_mrk_waterBarrel setMarkerShape "ICON";
BURK_mrk_waterBarrel setMarkerType "hd_warning";
BURK_mrk_waterBarrel setMarkerColor "ColorGreen";

BURK_mrk_houseNeighbor = createMarker ["BURK_mrk_houseNeighbor", BURK_houseNeighbor];
BURK_mrk_houseNeighbor setMarkerShape "ICON";
BURK_mrk_houseNeighbor setMarkerType "BURK_mrkHouse";
BURK_mrk_houseNeighbor setMarkerColor "ColorRed";

BURK_mrk_toiletNeighbor = createMarker ["BURK_mrk_toiletNeighbor", BURK_toiletNeighbor];
BURK_mrk_toiletNeighbor setMarkerShape "ICON";
BURK_mrk_toiletNeighbor setMarkerType "hd_warning";
BURK_mrk_toiletNeighbor setMarkerColor "ColorRed";

player createDiaryRecord ["Diary", ["In need of receptables", "<marker name='BURK_mrk_waterBarrel'>Your barell</marker> is full but you don't have any bottle nor canteen. You need bottles or canteens of at least 4 L volume. Your neighbor should have some canteens or bottles <marker name='BURK_mrk_houseNeighbor'>at home</marker>. You are waiting for hi to wake up and go to <marker name='BURK_mrk_toiletNeighbor'>the toilet</marker>."]];

BURK_missionEnd = false;

// Give player the keys
player setVariable ["BURK_plrKeys", [BURK_housePlayer]];

// Lock houses
[BURK_housePlayer, nil, nil] call BURK_fnc_buildingDoorLock;
[BURK_houseNeighbor, nil, nil] call BURK_fnc_buildingDoorLock;
[BURK_toiletNeighbor, nil, nil] call BURK_fnc_buildingDoorLock;

// Create basic task
0 = [player, "BURK_tsk_01", ["Now the neighbor finally went out to do his toilet duties. Steal that stuff, you have only 5 minutes until he will finish his morning shit.", "In need of receptables", "Neighbors' house"], BURK_houseNeighbor, "CREATED", 0, false] call BIS_fnc_taskCreate;  

// Create neighbors loot
_housePosList = [BURK_houseNeighbor] call BIS_fnc_buildingPositions;
_lootPos = _housePosList call BIS_fnc_selectRandom;

sleep 1;

BURK_neighborStuff = createVehicle ["WeaponHolderSimulated", _lootPos, [], 0, "CAN_COLLIDE"]; 
BURK_neighborStuff addItemCargoGlobal ["BURK_itemCanteenEmpty", 2 + ceil random 2];
BURK_neighborStuff addItemCargoGlobal ["BURK_itemBottleEmpty", 4 + ceil random 4];

// Equip player
removeAllAssignedItems player;
removeAllItems player;
removeHeadgear player;

// Give him the stuff
player addBackpack "B_OutdoorPack_tan";

player addItemToBackpack "BURK_itemLockpicks";
player addItemToBackpack "BURK_itemLockpicks";
player addItem "BURK_itemLockpicks";

player addItem "ItemMap";
player addItem "ItemWatch";

player assignItem "BURK_itemCellphone";
player assignItem "ItemMap";

// Init canteen / bottle status
player setVariable ["BURK_plr_canteenCnt", 0];
player setVariable ["BURK_plr_canteenLtrs", 0];
player setVariable ["BURK_plr_bottleCnt", 0];
player setVariable ["BURK_plr_bottleLtrs", 0];

// Player drinking stats
player setVariable ["BURK_plr_drankLtrs", 0];

// Player alive status
[] spawn {
	waitUntil {!alive player};
	
	["LOSER", false, true] call BIS_fnc_endMission;
};

// Task flow
[] spawn {
	["BURK_tsk_01", "ASSIGNED"] call BIS_fnc_taskSetState;

	// 5 minutes timeout
	BURK_timeout = time + 300;	
	
	waitUntil {(player distance BURK_housePlayer) > 15};

	0 = [player, ["BURK_tsk_01_01", "BURK_tsk_01"], ["I have been too proud to accept these canteens and bottles when my neighbor offered it to me. But I know he has them!", "Steal empty bottles or canteens", "Empty bottles and canteens"], BURK_neighborStuff, "CREATED", 0, false] call BIS_fnc_taskCreate;  

	["BURK_tsk_01_01", "ASSIGNED"] call BIS_fnc_taskSetState;
	
	waitUntil {(player getVariable "BURK_plr_canteenCap") + (player getVariable "BURK_plr_bottleCap") >= 4};

	["BURK_tsk_01_01", "SUCCEEDED"] call BIS_fnc_taskSetState;
	
	0 = [player, ["BURK_tsk_01_02", "BURK_tsk_01"], ["Now you can fill your bottles and canteens at your barell. You need at least 4 L!", "Fill bottles or canteens with 4 L of water", "Water barell"], BURK_waterBarrel, "CREATED", 0, false] call BIS_fnc_taskCreate;  

	["BURK_tsk_01_02", "ASSIGNED"] call BIS_fnc_taskSetState;
	
	waitUntil {(player getVariable "BURK_plr_canteenLtrs") + (player getVariable "BURK_plr_bottleLtrs") >= 4};

	["BURK_tsk_01_02", "SUCCEEDED"] call BIS_fnc_taskSetState;

	0 = [player, ["BURK_tsk_01_03", "BURK_tsk_01"], ["It's time to go home! And of course drink.", "Go home and drink 1 L of water", "Home"], BURK_housePlayer, "CREATED", 0, false] call BIS_fnc_taskCreate;

	["BURK_tsk_01_03", "ASSIGNED"] call BIS_fnc_taskSetState;	
	
	waitUntil {((player getVariable "BURK_plr_drankLtrs") >= 1) and (player distance BURK_housePlayer) < 3};

	["BURK_tsk_01_03", "SUCCEEDED"] call BIS_fnc_taskSetState;
	["BURK_tsk_01", "SUCCEEDED"] call BIS_fnc_taskSetState;

	// Benefit the player
	player addRating (10 * ceil (BURK_timeout - time));
	player addRating (100 * ((player getVariable "BURK_plr_canteenCap") + (player getVariable "BURK_plr_bottleCap")));
	player addRating (500 * ((player getVariable "BURK_plr_canteenLtrs") + (player getVariable "BURK_plr_bottleLtrs")));
	player addRating (1000 * (player getVariable "BURK_plr_drankLtrs"));

	BURK_missionEnd = true;

	waitUntil {(["BURK_tsk_01"] call BIS_fnc_taskState) == "SUCCEEDED"};

	["END1", true, true] call BIS_fnc_endMission;
};

waitUntil {!isNil {BURK_timeout}};

// Status
[] spawn {
	while {(alive player) and !BURK_missionEnd} do {
		_canteenCnt = {(_x == "BURK_itemCanteen") or (_x == "BURK_itemCanteenEmpty")} count items player;
		_bottleCnt = {(_x == "BURK_itemBottle") or (_x == "BURK_itemBottleEmpty")} count items player;
	
		_canteenCap = _canteenCnt;
		_bottleCap = 0.33 * _bottleCnt;

		player setVariable ["BURK_plr_canteenCap", _canteenCap];
		player setVariable ["BURK_plr_bottleCap", _bottleCap];

		hintSilent format ["Canteens: %1 (%2/%3 L)\nBottles: %4 (%5/%6 L)\nWater drank: %7 L\n\nTime left: %8 s", _canteenCnt, player getVariable "BURK_plr_canteenLtrs", _canteenCap, _bottleCnt, player getVariable "BURK_plr_bottleLtrs", _bottleCap, player getVariable "BURK_plr_drankLtrs", ceil (BURK_timeout - time)];
	};
	
	hintSilent "";
};

waitUntil {time >= BURK_timeout};
if (!BURK_missionEnd) then {
	BURK_missionEnd = true;
	
	player addRating -10000;

	["BURK_tsk_01_01", "FAILED"] call BIS_fnc_taskSetState;
	["BURK_tsk_01_02", "FAILED"] call BIS_fnc_taskSetState;
	["BURK_tsk_01_03", "FAILED"] call BIS_fnc_taskSetState;
	["BURK_tsk_01", "FAILED"] call BIS_fnc_taskSetState;
	
	waitUntil {(["BURK_tsk_01"] call BIS_fnc_taskState) == "FAILED"};
	
	["LOSER", false, true] call BIS_fnc_endMission;
};