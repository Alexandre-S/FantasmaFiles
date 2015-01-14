#include <macro.h>
/*
	File: fn_requestReceived.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Called by the server saying that we have a response so let's 
	sort through the information, validate it and if all valid 
	set the client up.
*/
private["_other"];
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

//Parse basic player information.
life_cash = parseNumber (_this select 2);
life_atmcash = parseNumber (_this select 3);
__CONST__(life_adminlevel,parseNumber(_this select 4));
__CONST__(life_donator,parseNumber(_this select 5));

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
	};
	
	case civilian: {
		life_is_arrested = _this select 7;
		__CONST__(life_coplevel, 0);
		__CONST__(life_medicLevel, 0);
		// START CHANGES
		life_isblacklisted = _this select 9;
		__CONST__(life_factnumber, parseNumber(_this select 10));
		__CONST__(life_reblevel, parseNumber(_this select 11));
		
		// so, here i change the select 9 to select 12 (+3 fields to civilian side). Is that right ?
		life_houses = _this select 20;
		{
			_house = nearestBuilding (call compile format["%1", _x select 0]);
			life_vehicles pushBack _house;
		} foreach life_houses;
		
		// Same here, select 10 + 3 fields, is that right ?
		life_gangData = _This select 21;
		if(count life_gangData != 0) then {
			[] spawn life_fnc_initGang;
		};
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
		
		_other = ["dep",0] call life_fnc_licenseType;
		if(!life_isdep) then { missionNamespace setVariable [_other select 0,false]; };
		if (missionNamespace getVariable[_other select 0,false]) then{ player setVariable["life_dep", true, true];};
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
	};
};

[] call life_fnc_loadGear;

// recup des clefs houses/vehicles
if(count (_this select 22) > 0) then { 
	{life_vehicles pushBack _x;} foreach (_this select 22);
};

life_session_completed = true;