/*
	Author: Havena

	Description:
	Wipe
*/
private["_action","_action2","_price"];
_price = 500000;
if!(isNil {(group player) getVariable "gang_owner"}) exitWith {hint "Vous devez quitter le Groupe pour changer d'identité !";};
if(life_atmcash < _price) exitWith {hint format["Vous n'avez pas assez d'argent pour changer d'identité .\n\nIl vous manque: $%1",[(_price-life_atmcash)] call life_fnc_numberText];};

_action = [
	"ATTENTION : Vous êtes sur le point de changer d'identité (changement de nom), cela entrainera une remise à zero de votre personnage.<br/><br/>Etes vous sur de vouloir supprimer votre personnage? Aucun retour en arrière ne sera possible.",
	"Changer d'identité (wipe)",
	"Oui",
	"Non"
] call BIS_fnc_guiMessage;

if(_action) then {
	
	_action2 = [
	"ATTENTION CONFIRMATION : êtes vous VRAIMENT sur de vouloir changer d'identité (changement de nom), cela entrainera une REMISE A ZERO de votre personnage.<br/><br/>Etes vous sur de vouloir SUPPRIMER votre personnage? Aucun retour en arrière ne sera possible.",
	"CONFIRMATION : Changer d'identité (wipe)",
	"Oui",
	"Non"
	] call BIS_fnc_guiMessage;
	
	if(_action2) then {
		hint "Changement d'identité en cours...patientez quelques secondes...";
		titleText ["Changement d'identité en cours...patientez quelques secondes...", "PLAIN"];
		closeDialog 0;
		[] call life_fnc_getHLC;
		[[getPlayerUID player,1,profileName,havena_id],"TON_fnc_wipe",serverhc,false] spawn life_fnc_MP;
		player enableSimulation false;
		/*[] spawn {
			sleep 5;
			["NewName",false,true] call BIS_fnc_endMission;
			sleep 35;
		};*/
	} else {
		hint "Changement d'identité Annulé";
	};
} else {
	hint "Changement d'identité Annulé";
};