/*
    File: fn_airsoftStart.sqf
    Author: Youri

    Description:
    Lancer l'airsoft, rajout addaction PNJ
*/
private["_stopStart"];
_stopStart = _this select 3;
if(_stopStart == "stuff") then {
	titleText["Debut du stuffage","PLAIN"];
	life_ar_start = true;
	[["stuff",true],"life_fnc_varAirsoft",true,false] spawn life_fnc_MP;
};
if(_stopStart == "start") then {
	titleText["Debut de la partie","PLAIN"];
	life_game_start = true;
	[["game",true],"life_fnc_varAirsoft",true,false] spawn life_fnc_MP;
};
if(_stopStart == "end") then {
	titleText["Fin de la partie","PLAIN"];
	life_ar_start = false;
	life_game_start = false;
	life_as_team = false;
	life_as_rifle = false;
	life_as_pistol = false;
	life_as_reload = false;
	[["end",false],"life_fnc_varAirsoft",true,false] spawn life_fnc_MP;
};