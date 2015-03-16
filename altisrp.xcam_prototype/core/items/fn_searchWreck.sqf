/*
	File: fn_searchWreck.sqf
	Author: Mike "Revir" Berlin

	Description:
	Searches shipwrecks for the items within the _items array.
*/
if (life_action_in_use) exitWith {};
private["_sum","_items","_random","_nObject"];
_items = [];
for "_i" from 1 to 20 do { _items set[count _items, "silverpiece"]; };
for "_i" from 1 to 15 do { _items set[count _items, "lockpick"]; };
for "_i" from 1 to 5 do { _items set[count _items, "marijuana"]; };
for "_i" from 1 to 7 do { _items set[count _items, "oilp"]; };
for "_i" from 1 to 2 do { _items set[count _items, "cocainep"]; };
for "_i" from 1 to 10 do { _items set[count _items, "doubloon"]; };
for "_i" from 1 to 3 do { _items set[count _items, "pearl"]; };
for "_i" from 1 to 2 do { _items set[count _items, "ruby"]; };
_items set[count _items, "diamondf"];

if (playerSide == west) exitWith {hint "Les flics ne peuvent pas fouiller une épave de bateau"};
_nObject = nearestObject[player,"Land_UWreck_FishingBoat_F"];
if (player distance _nObject > 50) exitWith {titleText["Vous devez être plus proche d'une épave pour utiliser le détecteur","PLAIN"]};
if ((getPosASL player) select 2 > -10) exitWith {titleText["Le détecteur ne marche pas à cette profondeur (Vous n'êtes pas assez profond).","PLAIN"]};
life_action_in_use = true;

_success = false;
while{life_carryWeight < life_maxWeight} do 
{
	if (speed player > 1) exitWith {};
	if (player distance _nObject > 50) exitWith {titleText["Vous devez être plus proche d'une épave pour utiliser le détecteur","PLAIN"]};
	if ((getPosASL player) select 2 > -10) exitWith {titleText["Le détecteur ne marche pas à cette profondeur (Vous n'êtes pas assez profond).","PLAIN"]};
	if (life_carryWeight >= life_maxWeight) exitWith {_success=true;};
	titleText["Détection en cours...","PLAIN"];
	_random = _items select round (random ((count _items)-1));
	_sum =[_random,1,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
	if (_sum > 0) then
	{
		if (([true,_random,1] call life_fnc_handleInv)) then
		{
			uiSleep 5;
			titleText["Vous avez trouvé quelque chose !","PLAIN"];
			titleFadeOut 1;
		};
	};
};
// _nObject setVariable ["sw",true];
life_action_in_use = false;

if (_success) then { titleText["Le détecteur semble ne plus rien trouver (vérifiez votre inventaire)!","PLAIN"]; }
else { titleText["Echec. Veuillez ne pas bouger durant la recherche!","PLAIN"]; };


