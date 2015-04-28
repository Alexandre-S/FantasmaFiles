/*
	File: fn_licenseType.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Returns the short-var of the license name to a long var and display name.
*/
private["_type","_ret","_var","_mode"];
_type = [_this,0,"",[""]] call BIS_fnc_param;
_mode = [_this,1,-1,[0]] call BIS_fnc_param;
if(_type == "" OR _mode == -1) exitWith {[]};

switch (_mode) do
{
	case 0:
	{
		switch (_type) do
		{
			case "driver": {_var = "l_c_driver"}; //Drivers License cost
			case "boat": {_var = "l_c_boat"}; //Boating license cost
			case "pilot": {_var = "l_c_air"}; //Pilot/air license cost
			case "gun": {_var = "l_c_gun"}; //Firearm/gun license cost
			case "dive": {_var = "l_c_dive"}; //Diving license cost
			case "oil": {_var = "l_c_oil"}; //Oil processing license cost
			case "cair": {_var = "l_g_air"}; //Cop Pilot License cost
			case "swat": {_var = "l_g_swat"}; //Swat License cost
			case "cg": {_var = "l_g_cg"}; //Coast guard license cost
			case "bacpj": {_var = "l_g_bacpj"}; //BacPJ
			case "medic": {_var = "l_g_medic"}; //cop medic license cost
			case "heroin": {_var = "l_c_heroin"}; //Heroin processing license cost
			case "lsd": {_var = "l_c_lsd"}; //LSD processing license cost
			case "marijuana": {_var = "l_c_marijuana"}; //Marijuana processing license cost
			case "gang": {_var = "l_c_gang"}; //Gang license cost
			case "rebel": {_var = "l_c_rebel"}; //Rebel License
			case "thug": {_var = "l_c_thug"}; //thug License
			case "truck":{_var = "l_c_truck"}; //Truck License
			case "diamond": {_var = "l_c_diamond"};
			case "salt": {_var = "l_c_salt"};
			case "cocaine": {_var = "l_c_coke"};
			case "sand": {_var = "l_c_sand"};
			case "iron": {_var = "l_c_iron"};
			case "copper": {_var = "l_c_copper"};
			case "cement": {_var = "l_c_cement"};
			case "mair": {_var = "l_m_air"};
			case "home": {_var = "l_c_home"};
			case "gvt": {_var = "l_c_gvt"};
			case "vigil": {_var = "l_c_vigil"};
			case "dep": {_var = "l_c_dep"};
			case "hunting": {_var = "l_c_hunting"};
			case "taxi": {_var = "l_c_taxi"};
			default {_var = ""};
		};
	};
	
	case 1:
	{
		switch (_type) do
		{
			case "l_c_driver": {_var = "driver"}; //Drivers License cost
			case "l_c_boat": {_var = "boat"}; //Boating license cost
			case "l_c_air": {_var = "pilot"}; //Pilot/air license cost
			case "l_c_gun": {_var = "gun"}; //Firearm/gun license cost
			case "l_c_dive": {_var = "dive"}; //Diving license cost
			case "l_c_oil": {_var = "oil"}; //Oil processing license cost
			case "l_g_air": {_var = "cair"}; //Cop Pilot License cost
			case "l_g_swat": {_var = "swat"}; //Swat License cost
			case "l_g_cg": {_var = "cg"}; //Coast guard license cost
			case "l_g_bacpj": {_var = "bacpj"}; //BacPJ
			case "l_g_medic": {_var = "medic"}; //cop medic license cost
			case "l_c_heroin": {_var = "heroin"}; //Heroin processing license cost
			case "l_c_lsd": {_var = "lsd"}; //LSD processing license cost
			case "l_c_marijuana": {_var = "marijuana"}; //Marijuana processing license cost
			case "l_c_gang": {_var = "gang"}; //Gang license cost
			case "l_c_rebel": {_var = "rebel"}; //Rebel License
			case "l_c_thug": {_var = "thug"}; //thug License
			case "l_c_truck":{_var = "truck"}; //Truck License
			case "l_c_diamond": {_var = "diamond"};
			case "l_c_salt": {_var = "salt"};
			case "l_c_coke": {_var = "cocaine"};
			case "l_c_sand": {_var = "sand"};
			case "l_c_iron": {_var = "iron"};
			case "l_c_copper": {_var = "copper"};
			case "l_c_cement": {_var = "cement"};
			case "l_m_air": {_var = "mair"};
			case "l_c_home": {_var = "home"};
			case "l_c_gvt": {_var = "gvt"};
			case "l_c_vigil": {_var = "vigil"};
			case "l_c_dep": {_var = "dep"};
			case "l_c_hunting": {_var = "hunting"};
			case "l_c_taxi": {_var = "taxi"};
			default {_var = ""};
		};
	};
};

_ret = [_var,(if(_var != "") then {([_var] call life_fnc_varToStr)})];
_ret;