/*
	File: fn_sendChannel.sqf
	Author: alleskapot & Lifted
	Thanks again for all the help alleskapot!
	Description:
	Ermöglicht senden bzw. die Abfrage des Geschriebenen.
	
	this addAction["Send Message",life_fnc_calldialog,0];

*/

private["_message"];
disableSerialization;

waitUntil {!isnull (findDisplay 9000)};

if ( life_cash < 10000 ) exitWith { [[1,"Vous devez payer 10000€ pour envoyer un message"],"life_fnc_broadcast",player,false] spawn life_fnc_MP; }; // Hint if person haves no 6000 dollar
//if ( playerSide != civilian ) exitWith { systemChat "Du musst Zivilist sein um einen Nachricht zu senden!"; }; // Hint if not civilian
if !(life_channel_send) exitWith { [[1,"Vous devez attendre 10 minutes pour renvoyer un message"],"life_fnc_broadcast",player,false] spawn life_fnc_MP; }; //Gives Player the Hint to Wait 10 mins
life_cash = life_cash - 10000;
[0] call SOCK_fnc_updatePartial;

_message = ctrlText 9001;
[[1,format ["%1 envoie le message suivant depuis Altis Telekom: \n\n %2",name player,_message]],"life_fnc_broadcast",true,false] call life_fnc_MP;
[[0,format ["%1 envoie le message suivant depuis Altis Telekom: %2",name player,_message]],"life_fnc_broadcast",true,false] call life_fnc_MP;
life_channel_send = false;

[] spawn
{
	sleep 600;
	life_channel_send = true;
};
