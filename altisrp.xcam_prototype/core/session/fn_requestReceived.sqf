#include <macro.h>
/*
	File: fn_requestReceived.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Called by the server saying that we have a response so let's 
	sort through the information, validate it and if all valid 
	set the client up.
*/
private["_other","_house","_houseCfg","_other","_wipe"];
life_session_tries = life_session_tries + 1;
if(life_session_completed) exitWith {}; //Why did this get executed when the client already initialized? Fucking arma...
if(life_session_tries > 3) exitWith {cutText[localize "STR_Session_Error","BLACK FADED"]; 0 cutFadeOut 999999999;};

0 cutText [localize "STR_Session_Received","BLACK FADED"];
0 cutFadeOut 9999999;

//Error handling and  junk..
if(isNil "_this") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if(typeName _this == "STRING") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if(count _this == 0) exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if((_this select 0) == "Error") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if((getPlayerUID player) != _this select 0) exitWith {[] call SOCK_fnc_dataQuery;};

// diag_log format ["DEBUG REQUESTRECEIVE %1", _this];

//Lets make sure some vars are not set before hand.. If they are get rid of them, hopefully the engine purges past variables but meh who cares.
if(!isServer && (!isNil "life_adminlevel" OR !isNil "life_coplevel" OR !isNil "life_donator")) exitWith {
	[[profileName,getPlayerUID player,"VariablesAlreadySet"],"SPY_fnc_cookieJar",false,false] spawn life_fnc_MP;
	[[profileName,format["Variables set before client initialization...\nlife_adminlevel: %1\nlife_coplevel: %2\nlife_donator: %3",life_adminlevel,life_coplevel,life_donator]],"SPY_fnc_notifyAdmins",true,false] spawn life_fnc_MP;
	sleep 0.9;
	["SpyGlass",false,false] execVM "\a3\functions_f\Misc\fn_endMission.sqf";
};




switch (playerSide) do
{
	case west:
	{
		_wipe = call compile format["%1",(_this select 16)];
	};

	case civilian:
	{
		_wipe = call compile format["%1",(_this select 21)];
	};
	case independent:
	{
		_wipe = call compile format["%1",(_this select 16)];
	};
};
if (!((getPlayerUID player) in ["76561197971054451","76561197999056075","76561198026019944","76561197983740568","76561198010101889","76561197985429466","76561197969337890","76561198007128754","76561197997451635"])) then {
	if(((profileName) != (_this select 1)) && !(_wipe)) exitWith {
		0 cutText[format ["Changement de nom interdit. \nVous devez passer à la prefecture pour changer de nom. \nMerci de vous reconnecter sous le nom : ""%1""",(_this select 1)],"BLACK FADED"];
		0 cutFadeOut 9999999;
		sleep 20;
		
		player enableSimulation false;
		["BadName",false,true] call BIS_fnc_endMission;
		sleep 35;
	};
} else {
	if(((profileName) != (_this select 1)) && !(_wipe)) exitWith {
		[] call life_fnc_getHLC;
		[[getPlayerUID player,0,profileName,havena_id],"TON_fnc_wipe",serverhc,false] spawn life_fnc_MP;
	};
};
if(((profileName) == (_this select 1)) && _wipe) exitWith {
	0 cutText[format ["Changement d'identité en cours. \nVous venez de passer à la prefecture pour changer de nom, ou vous avez subit une mort RP. \nMerci de vous reconnecter avec un nouveau nom différent de : ""%1""",(_this select 1)],"BLACK FADED"];
	0 cutFadeOut 9999999;
	sleep 20;
	
	player enableSimulation false;
	["NewName",false,true] call BIS_fnc_endMission;
	sleep 35;
};

if(((profileName) != (_this select 1)) && _wipe) then {
	[] call life_fnc_getHLC;
	[[getPlayerUID player,0,profileName,havena_id],"TON_fnc_wipe",serverhc,false] spawn life_fnc_MP;
};


//Parse basic player information.
life_cash = parseNumber (_this select 2);
life_atmcash = parseNumber (_this select 3);
__CONST__(life_adminlevel,parseNumber(_this select 4));
__CONST__(life_donator,parseNumber(_this select 5));
if(__GETC__(life_adminlevel)>0) then { player setVariable["is_admin",true,true]; };

//Loop through licenses
if(count (_this select 6) > 0) then {
	{missionNamespace setVariable [(_x select 0),(_x select 1)];} foreach (_this select 6);
};

life_gear = _this select 8;

//Parse side specific information.
switch(playerSide) do {
	case west: {
		__CONST__(life_coplevel, parseNumber(_this select 7));
		__CONST__(life_medicLevel,0);
		// life_blacklisted = _this select 9;
		life_position = _this select 9;
		life_is_alive = _this select 10;
		life_tfrreboot = _this select 11;
		if(life_is_alive) then {
			player setdamage parseNumber(_this select 12);
			life_hunger = parseNumber(_this select 13);
			life_thirst = parseNumber(_this select 14);
		};
		life_sexe = _this select 15;
		init_gang = true;
	};
	
	case civilian: {
		life_is_arrested = _this select 7;
		__CONST__(life_coplevel, 0);
		__CONST__(life_medicLevel, 0);
		// START CHANGES
		life_isrebel = _this select 9;
		__CONST__(life_factnumber, parseNumber(_this select 10));
		__CONST__(life_reblevel, parseNumber(_this select 11));
		
		// so, here i change the select 9 to select 12 (+3 fields to civilian side). Is that right ?
		life_houses = _this select 22;
		{
			_house = nearestBuilding (call compile format["%1", _x select 0]);
			// add
			_houseCfg = [(typeOf _house)] call life_fnc_houseConfig;
			if(count _houseCfg == 0) then
			{
				_house = (nearestObjects[(call compile format["%1", _x select 0]),["House_F"],20] select 0);
			};
			
			life_vehicles pushBack _house;
		} foreach life_houses;
		
		// Same here, select 10 + 3 fields, is that right ?
		life_gangData = _This select 23;
		if(count life_gangData != 0) then {
			[] spawn life_fnc_initGang;
		} else { init_gang = true; player setVariable["init_gang",true,true]; };
		[] spawn life_fnc_initHouses;
		// END CHANGES
		life_position = _this select 12;
		life_is_alive = _this select 13;
		life_tfrreboot = _this select 14;
		if(life_is_alive) then {
			player setdamage parseNumber(_this select 15);
			life_hunger = parseNumber(_this select 16);
			life_thirst = parseNumber(_this select 17);
		};
		life_sexe = _this select 18;
		life_isdep = _this select 19;
		life_istaxi = _this select 20;
		
		_other = ["dep",0] call life_fnc_licenseType;
		if(!life_isdep) then { missionNamespace setVariable [_other select 0,false]; };
		if (missionNamespace getVariable[_other select 0,false]) then{ player setVariable["life_dep", true, true];};
		
		_other = ["taxi",0] call life_fnc_licenseType;
		if(!life_istaxi) then { missionNamespace setVariable [_other select 0,false]; };
		if (missionNamespace getVariable[_other select 0,false]) then{ player setVariable["life_taxi", true, true];};
	};
	
	case independent: {
		__CONST__(life_medicLevel, parseNumber(_this select 7));
		__CONST__(life_coplevel,0);
		life_position = _this select 9;
		life_is_alive = _this select 10;
		life_tfrreboot = _this select 11;
		if(life_is_alive) then {
			player setdamage parseNumber(_this select 12);
			life_hunger = parseNumber(_this select 13);
			life_thirst = parseNumber(_this select 14);
		};
		life_sexe = _this select 15;
		init_gang = true;
	};
};

// life_paycheck = life_paycheck + (__GETC__(life_donator) * 250);
life_paycheck = ceil(life_paycheck + (((__GETC__(life_donator) * 5) / 100) * life_paycheck));


/*if ((count life_position) > 0) then {
	life_position = life_position findEmptyPosition [1,50,typeof player];
};*/

[] call life_fnc_loadGear;

// recup des clefs houses/vehicles
if(count (_this select 24) > 0) then { 
	{life_vehicles pushBack _x;} foreach (_this select 24);
};

life_session_completed = true;