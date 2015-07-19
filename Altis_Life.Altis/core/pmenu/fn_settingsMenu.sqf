#include <macro.h>
/*
	File: fn_settingsMenu
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Setup the settings menu.
*/
if(isNull (findDisplay 2900)) then
{
	if(!createDialog "SettingsMenu") exitWith {hint "Something went wrong, the menu won't open?"};
};

disableSerialization;

ctrlSetText[2902, format["%1", tawvd_foot]];
ctrlSetText[2912, format["%1", tawvd_car]];
ctrlSetText[2922, format["%1", tawvd_air]];
ctrlSetText[2932, format["%1", havena_targetfps]];
ctrlSetText[2942, format["%1", havena_mincombat]];
ctrlSetText[2952, format["%1", youri_sound_foot]];
ctrlSetText[2954, format["%1", youri_sound_car]];
ctrlSetText[2956, format["%1", youri_sound_air]];
ctrlSetText[2958, format["%1", youri_sound_boat]];

//Setup Sliders range
{ slidersetRange [_x,200,12000];} foreach [2901,2911,2921,2941];
{ slidersetRange [_x,5,120];} foreach [2931];
{ slidersetRange [_x,1,100];} foreach [2951,2953,2955,2957];
//Setup Sliders speed
{ ((findDisplay 2900) displayCtrl _x) sliderSetSpeed [50,50,50]; } foreach [2901,2911,2921,2941];
{ ((findDisplay 2900) displayCtrl _x) sliderSetSpeed [1,1,1]; } foreach [2931,2951,2953,2955,2957];
//Setup Sliders position
{
	sliderSetPosition[_x select 0, _x select 1];
} foreach [[2901,tawvd_foot],[2911,tawvd_car],[2921,tawvd_air],[2931,havena_targetfps],[2941,havena_mincombat],[2951,youri_sound_foot],[2953,youri_sound_car],[2955,youri_sound_air],[2957,youri_sound_boat]];

private["_display","_side","_tags","_objs","_herb"];
_display = findDisplay 2900;
_side = _display displayCtrl 2971;
_tags = _display displayCtrl 2970;
_objs = _display displayCtrl 2972;
// _herb = _display displayCtrl 2973;

if(isNil "life_tagson") then {
	//life_sidechat = true;
	life_tagson = true;
	life_revealObjects = true;
	life_herbe = true;
};

if(life_revealObjects) then {
	_objs ctrlSetTextColor [0,1,0,1];
	_objs ctrlSetText "ON";
	_objs buttonSetAction "[LIFE_ID_RevealObjects,""onEachFrame""] call BIS_fnc_removeStackedEventHandler; life_revealObjects = false; [] call life_fnc_settingsMenu;";
} else {
	_objs ctrlSetTextColor [1,0,0,1];
	_objs ctrlSetText "OFF";
	_objs buttonSetAction "LIFE_ID_RevealObjects = [""LIFE_RevealObjects"",""onEachFrame"",""life_fnc_revealObjects""] call BIS_fnc_addStackedEventHandler; life_revealObjects = true; [] call life_fnc_settingsMenu;";
};

if(__GETC__(life_adminlevel) > 0) then {
	if(life_tagson) then {
		_tags ctrlSetTextColor [0,1,0,1];
		_tags ctrlSetText "ON";
		_tags buttonSetAction "[LIFE_ID_PlayerTags,""onEachFrame""] call BIS_fnc_removeStackedEventHandler; life_tagson = false; [] call life_fnc_settingsMenu;";
	} else {
		_tags ctrlSetTextColor [1,0,0,1];
		_tags ctrlSetText "OFF";
		_tags buttonSetAction "LIFE_ID_PlayerTags = [""LIFE_PlayerTags"",""onEachFrame"",""life_fnc_playerTags""] call BIS_fnc_addStackedEventHandler; life_tagson = true; [] call life_fnc_settingsMenu;";
	};
};

/*if(life_sidechat) then {
	_side ctrlSetTextColor [0,1,0,1];
	_side ctrlSetText "ON";
} else {
	_side ctrlSetTextColor [1,0,0,1];
	_side ctrlSetText "OFF";
};*/

if(life_autofps) then {
	_side ctrlSetTextColor [0,1,0,1];
	_side ctrlSetText "ON";
	_side buttonSetAction "life_autofps=false; ctrlShow[2901,false]; ctrlShow[2902,false]; ctrlShow[2911,false]; ctrlShow[2912,false]; ctrlShow[2921,false]; ctrlShow[2922,false]; ctrlShow[2931,false]; ctrlShow[2932,false]; ctrlShow[2941,false]; ctrlShow[2942,false]; setViewDistance -1; setViewDistance havena_view_save; setObjectViewDistance havena_objectView_save; call life_fnc_settingsMenu;";
} else {
	_side ctrlSetTextColor [1,0,0,1];
	_side ctrlSetText "OFF";
	_side buttonSetAction "life_autofps=true; ctrlShow[2901,true]; ctrlShow[2902,true]; ctrlShow[2911,true]; ctrlShow[2912,true]; ctrlShow[2921,true]; ctrlShow[2922,true]; ctrlShow[2931,true]; ctrlShow[2932,true]; ctrlShow[2941,true]; ctrlShow[2942,true]; [] call life_fnc_settingsMenu;";
};


/*if(life_herbe) then {
	_herb ctrlSetTextColor [0,1,0,1];
	_herb ctrlSetText "ON";
	_herb buttonSetAction "life_herbe=false; setTerrainGrid 50; [] call life_fnc_settingsMenu;";
} else {
	_herb ctrlSetTextColor [1,0,0,1];
	_herb ctrlSetText "OFF";
	_herb buttonSetAction "life_herbe=true; setTerrainGrid 48; [] call life_fnc_settingsMenu;";
};*/