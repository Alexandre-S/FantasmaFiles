/*
	File: fn_s_onSliderChange.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Called when the slider is changed for any field and updates the view distance for it.
*/
private["_mode","_value"];
_mode = [_this,0,-1,[0]] call BIS_fnc_param;
_value = [_this,1,-1,[0]] call BIS_fnc_param;
if(_mode == -1 OR _value == -1) exitWith {};
disableSerialization;

switch (_mode) do
{
	case 0:
	{
		tawvd_foot = round(_value);
		ctrlSetText[2902,format["%1",round(_value)]];
		[] call life_fnc_updateViewDistance;
	};
	
	case 1:
	{
		tawvd_car = round(_value);
		ctrlSetText[2912,format["%1",round(_value)]];
		[] call life_fnc_updateViewDistance;
	};
	
	case 2:
	{
		tawvd_air = round(_value);
		ctrlSetText[2922,format["%1",round(_value)]];
		[] call life_fnc_updateViewDistance;
	};
	
	case 3:
	{
		havena_targetfps = round(_value);
		ctrlSetText[2932,format["%1",round(_value)]];
		// [] call life_fnc_updateViewDistance;
	};
	
	case 4:
	{
		havena_mincombat = round(_value);
		ctrlSetText[2942,format["%1",round(_value)]];
		// [] call life_fnc_updateViewDistance;
	};
	
	case 5:
	{
		youri_sound_foot = round(_value);
		ctrlSetText[2952,format["%1",round(_value)]];
		[] call life_fnc_updateSound;
	};
	
	case 6:
	{
		youri_sound_car = round(_value);
		ctrlSetText[2954,format["%1",round(_value)]];
		[] call life_fnc_updateSound;
	};
	
	case 7:
	{
		youri_sound_air = round(_value);
		ctrlSetText[2956,format["%1",round(_value)]];
		[] call life_fnc_updateSound;
	};
	
	case 8:
	{
		youri_sound_boat = round(_value);
		ctrlSetText[2958,format["%1",round(_value)]];
		[] call life_fnc_updateSound;
	};
};