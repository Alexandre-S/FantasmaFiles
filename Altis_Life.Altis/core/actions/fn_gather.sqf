/*
	File: fn_gather.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main functionality for gathering.
*/
if(isNil "life_action_gathering") then {life_action_gathering = true;};
if(life_action_inUse) exitWith {hint "Vous ne pouvez pas utiliser rapidement les touches d'actions!"};
life_action_inUse = true;
private["_gather","_itemWeight","_diff","_itemName","_val","_resourceZones","_zone"];
_resourceZones = ["apple_1","apple_2","apple_2_1","apple_3","apple_4","peaches_1","peaches_2","peaches_2_1","peaches_3","peaches_4","heroin_1","cocaine_1","weed_1","seigle_1","rye_1","mash_1","hops_1","yeast_1"];
_zone = "";
_gather = "";
// if(life_action_gathering) exitWith {}; //Action is in use, exit to prevent spamming.

//Find out what zone we're near
{
	if(player distance (getMarkerPos _x) < 75) exitWith {_zone = _x;};
} foreach _resourceZones;

// if(_zone == "") exitWith {
	// life_action_inUse = false;
// };

//si pas zone check mine
if(_zone == "") then {
	switch (true) do
	{
		case (player distance (getMarkerPos "lead_1") < 75): {_gather = "copperore"; _val = 2;};
		case (player distance (getMarkerPos "lead_1_1") < 75): {_gather = "copperore"; _val = 2;};
		case (player distance (getMarkerPos "iron_1") < 75): {_gather = "ironore"; _val = 2;};
		case (player distance (getMarkerPos "iron_1_1") < 75): {_gather = "ironore"; _val = 2;};
		case (player distance (getMarkerPos "salt_1") < 120) : {_gather = "salt"; _val = 4;};
		case (player distance (getMarkerPos "salt_1_1") < 120) : {_gather = "salt"; _val = 4;};
		case (player distance (getMarkerPos "sand_1") < 75) : {_gather = "sand"; _val = 5;};
		case (player distance (getMarkerPos "sand_1_1") < 75) : {_gather = "sand"; _val = 5;};
		case (player distance (getMarkerPos "diamond_1") < 75): {_gather = "diamond"; _val = 1;};
		case (player distance (getMarkerPos "oil_1") < 75) : {_gather = "oilu"; _val = 1;};
		case (player distance (getMarkerPos "oil_2") < 75) : {_gather = "oilu"; _val = 1;};
		case (player distance (getMarkerPos "gaz_rig_1") < 75) : {_gather = "gazu"; _val = 1;};
		case (player distance (getMarkerPos "gaz_rig_2") < 75) : {_gather = "gazu"; _val = 1;};
		case (player distance (getMarkerPos "gaz_rig_3") < 75) : {_gather = "gazu"; _val = 1;};
		case (player distance (getMarkerPos "rock_1") < 75): {_gather = "rock"; _val = 2;};
		default {_gather = "";};
	};
} else {
	//Get the resource that will be gathered from the zone name...
	switch(true) do {
		case (_zone in ["apple_1","apple_2","apple_2_1","apple_3","apple_4"]): {_gather = "apple"; _val = 3;};
		case (_zone in ["peaches_1","peaches_2","peaches_2_1","peaches_3","peaches_4"]): {_gather = "peach"; _val = 3;};
		case (_zone in ["heroin_1"]): {_gather = "heroinu"; _val = 1;};
		case (_zone in ["cocaine_1"]): {_gather = "cocaine"; _val = 1;};
		case (_zone in ["weed_1"]): {_gather = "cannabis"; _val = 1;};
		case (_zone in ["seigle_1"]): {_gather = "seigle"; _val = 1;};
		case (_zone in ["rye_1"]): {_gather = "rye"; _val = 2;};
		case (_zone in ["mash_1"]): {_gather = "cornmeal"; _val = 2;};
		case (_zone in ["yeast_1"]): {_gather = "yeast"; _val = 2;};
		case (_zone in ["hops_1"]): {_gather = "hops"; _val = 2;}; 
		default {""};
	};
};

if(_gather == "") exitWith {
	life_action_inUse = false;
};

_itemName = [([_gather,0] call life_fnc_varHandle)] call life_fnc_varToStr;
titleText[format["Récolte %1...",_itemName],"PLAIN"];

while {life_carryWeight < life_maxWeight} do
{
	//gather check??
	if (!(alive player)) exitWith {};
	if(vehicle player != player) exitWith {};
	if (speed player > 1) exitWith { titleText["Récolte annulée. Vous devez rester immobile pendant la récolte.","PLAIN"]; };
	_val = [1,2,3,4] call BIS_fnc_selectRandom;
	_diff = [_gather,_val,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
	if((_gather == "sand" || _gather == "salt" || _gather == "rock" || _gather == "oilu" || _gather == "gazu" || _gather == "ironore" || _gather == "diamond" || _gather == "copperore") && (life_inv_pickaxe < 1)) exitWith {hint "Vous avez besoin d'une pioche pour effectuer cette action.";};
	// if(_diff == 0) exitWith {hint localize "STR_NOTF_InvFull"};
	if(!(_diff > 0)) exitWith { titleText [format["Récolte terminé. Vous n'avez plus de place pour stocker plus de %1.", _itemName],"PLAIN"]; };

	if(_gather == "sand" || _gather == "salt" || _gather == "rock" || _gather == "oilu" || _gather == "gazu" || _gather == "ironore" || _gather == "diamond" || _gather == "copperore") then {
		//[[player, "mining",10],"life_fnc_playSound",true,false] spawn life_fnc_MP;
		playSound "mining";
	}
	else
	{
		//[[player, "bag",10],"life_fnc_playSound",true,false] spawn life_fnc_MP;
		playSound "bag";
	};
	
	
	// for "_i" from 0 to 2 do
	// {
		player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
		waitUntil{sleep 0.1; animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
		sleep 5;
	// };

	if(!([true,_gather,_diff] call life_fnc_handleInv)) then
	{
		titleText [format["Récolte terminé. Vous n'avez plus de place pour stocker plus de %1.", _itemName],"PLAIN"];
	};
	titleText[format[localize "STR_NOTF_Gather_Success",_itemName,_diff],"PLAIN"];
	titleFadeOut 1;

	if (life_carryWeight >= life_maxWeight) exitWith { titleText [format["Récolte terminé. Vous n'avez plus de place pour stocker plus de %1.", _itemName],"PLAIN"]; };
};

life_action_inUse = false;