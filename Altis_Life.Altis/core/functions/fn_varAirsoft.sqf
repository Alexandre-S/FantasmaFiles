/*
    File: fn_varAirsoft.sqf
    Author: Youri

    Description:
    broadcast variables
*/
private["_rec","_val"];
_rec = _this select 0;
_val = _this select 1;

if(_rec == "stuff") then {
	life_ar_start = _val;
};
if(_rec == "game") then {
	life_game_start = _val;
};
if(_rec == "end") then {
	life_ar_start = _val;
	life_game_start = _val;
	life_as_team = _val;
	life_as_rifle = _val;
	life_as_pistol = _val;
	life_as_reload = _val;
};
