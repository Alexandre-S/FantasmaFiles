if(isServer OR !hasInterface) exitwith {};
/*
	File: fn_respawned.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sets the player up if he/she used the respawn option.
*/
private["_handle"];
//Reset our weight and other stuff
life_use_atm = TRUE;
life_hunger = 100;
life_thirst = 100;
life_carryWeight = 0;
life_cash = 0; //Make sure we don't get our cash back.
life_respawned = false;
player playMove "amovpercmstpsnonwnondnon";

[[profileName, "COMA"],"life_fnc_deleteMarker",independent,false] spawn life_fnc_MP;
[[profileName, "COMA"],"life_fnc_deleteMarker",west,false] spawn life_fnc_MP;

life_corpse setVariable["Revive",nil,TRUE];
life_corpse setVariable["name",nil,TRUE];
life_corpse setVariable["Reviving",nil,TRUE];
life_corpse setVariable["life_corps",nil,TRUE];

player setVariable["life_corpse_var",nil,true];
player setVariable["Revive",nil,TRUE];
player setVariable["name",nil,TRUE];
player setVariable["Reviving",nil,TRUE];

player setVariable["AGM_isCaptive",false,true];
player setVariable["AGM_isEscorting",false,true];
player setVariable["AGM_isSurrender", false, true];

player setVariable ["tf_receivingDistanceMultiplicator", 0.5];
player setVariable ["tf_sendingDistanceMultiplicator", 0.5];

//Load gear for a 'new life'
switch(playerSide) do
{
	case west: {
		_handle = [] spawn life_fnc_copLoadout;
	};
	case civilian: {
		_handle = [] spawn life_fnc_civLoadout;
	};
	case independent: {
		_handle = [] spawn life_fnc_medicLoadout;
	};
	waitUntil {sleep 0.1; scriptDone _handle};
};

//Cleanup of weapon containers near the body & hide it.
if(!isNull life_corpse) then {
	private["_containers"];
	life_corpse setVariable["Revive",TRUE,TRUE];
	//_containers = nearestObjects[life_corpse,["WeaponHolderSimulated"],5];
	//{deleteVehicle _x;} foreach _containers; //Delete the containers.
	hideBody life_corpse;
};

//Destroy our camera...
life_deathCamera cameraEffect ["TERMINATE","BACK"];
camDestroy life_deathCamera;

//Bad boy
if(life_is_arrested) exitWith {
	hint localize "STR_Jail_Suicide";
	life_is_arrested = false;
	[player,TRUE] spawn life_fnc_jail;
	spawnmenuon = 0;
	// [] call SOCK_fnc_updateRequest;
};

//Johnny law got me but didn't let the EMS revive me, reward them half the bounty.
/*if(!isNil "life_copRecieve") then {
	[] call life_fnc_getHLC;
	[[player,life_copRecieve,true],"life_fnc_wantedBounty",serverhc,false] spawn life_fnc_MP;
	life_copRecieve = nil;
};*/

//So I guess a fellow gang member, cop or myself killed myself so get me off that Altis Most Wanted
/*if(life_removeWanted) then {
	[] call life_fnc_getHLC;
	[[getPlayerUID player],"life_fnc_wantedRemove",serverhc,false] spawn life_fnc_MP;
};*/

[] call SOCK_fnc_updateRequest;
[] call life_fnc_hudUpdate; //Request update of hud.

//[] call life_fnc_updateClothing;