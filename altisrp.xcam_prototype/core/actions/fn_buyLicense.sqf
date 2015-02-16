#include <macro.h>
/*
	File: fn_buyLicense.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Called when purchasing a license. May need to be revised.
*/
private["_type","_price","_license","_other"];
_type = _this select 3;

_price = [_type] call life_fnc_licensePrice;
_license = [_type,0] call life_fnc_licenseType;

//achat donator
_price = ceil(_price - (((__GETC__(life_donator) * 5) / 100) * _price));

// if(isNil "life_isblacklisted") then{
	// life_isblacklisted = false;
// };

if (((_type == "taxi") || (_type == "dep")) && life_isrebel) exitWith {hint "Vous ne pouvez pas effectuer ces métiers car vous êtes fiché comme terroriste."};
if (((_type == "rebel") || (_type == "dep")) && life_istaxi) exitWith {hint "Vous ne pouvez pas effectuer ces métiers car vous êtes fiché comme Taxi."};
if (((_type == "taxi") || (_type == "rebel")) && life_isdep) exitWith {hint "Vous ne pouvez pas effectuer ces métiers car vous êtes fiché comme dépanneur."};


if(!life_isrebel && (_license select 0) == "license_civ_rebel") exitWith {hint "Vous devez faire une demande sur le forum pour rejoindre une faction terroriste"};
if(!life_isdep && (_license select 0) == "license_civ_dep") exitWith {hint "Vous devez faire une demande sur le forum pour rejoindre les dépanneurs"};
if(!life_istaxi && (_license select 0) == "license_civ_taxi") exitWith {hint "Vous devez faire une demande sur le forum pour rejoindre les Taxis"};


if(life_cash < _price) exitWith {hint format[localize "STR_NOTF_NE_1",[_price] call life_fnc_numberText,_license select 1];};
playSound "caching";
life_cash = life_cash - _price;
titleText[format[localize "STR_NOTF_B_1", _license select 1,[_price] call life_fnc_numberText],"PLAIN"];
missionNamespace setVariable[(_license select 0),true];


if (_type == "dep") then
{
	_other = ["taxi",0] call life_fnc_licenseType;
	if (missionNamespace getVariable[_other select 0,false]) then
	{
		hint "Parce que vous avez acheté une licence de dépanneur, vous avez perdu votre licence de Taxi";
		missionNamespace setVariable[_other select 0,false];
		if(player getVariable["life_taxi", false]) then {
			player setVariable["life_taxi", false, true];
		};
	};
	
	_other = ["rebel",0] call life_fnc_licenseType;
	if (missionNamespace getVariable[_other select 0,false]) then
	{
		hint "Parce que vous avez acheté une licence de dépanneur, vous avez perdu votre licence de terroriste";
		missionNamespace setVariable[_other select 0,false];
	};
	
	_msg = parseText format["%1, vous êtes désormais Dépanneur!<br/><br/>En tant que <t color='#FF0000'>dépanneur</t> vous devez vous conformer à certaines règles ou risquez la suppression de votre licence voir tout simplement être banni du serveur<br/><br/><t color='#FF0000'>Il est très important</t>de comprendre que vous êtes toujours un civil, et devez obéir à toutes les règles qui s'appliquent aux civils. Un dépanneur ne doit pas se promener avec une arme à la main. Un dépanneur n'est pas un soldat. <br/><br/>En tant que dépanneur, votre travail consiste à venir au secours de la population et <t color='#00FF00'>en priorité aux forces de l'ordre</t>.<br/><br/>", profileName];
	"Vous êtes dépanneur" hintC _msg;
	player setVariable["life_dep", true, true];
};

if (_type == "taxi") then
{
	_other = ["dep",0] call life_fnc_licenseType;
	if (missionNamespace getVariable[_other select 0,false]) then
	{
		hint "Parce que vous avez acheté une licence de Taxi, vous avez perdu votre licence de dépanneur";
		missionNamespace setVariable[_other select 0,false];
		if(player getVariable["life_dep", false]) then {
			player setVariable["life_dep", false, true];
		};
	};
	
	_other = ["rebel",0] call life_fnc_licenseType;
	if (missionNamespace getVariable[_other select 0,false]) then
	{
		hint "Parce que vous avez acheté une licence de Taxi, vous avez perdu votre licence de terroriste";
		missionNamespace setVariable[_other select 0,false];
	};
	
	_msg = parseText format["%1, vous êtes désormais Taxi!<br/><br/>En tant que <t color='#FF0000'>Taxi</t> vous devez vous conformer à certaines règles ou risquez la suppression de votre licence voir tout simplement être banni du serveur<br/><br/><t color='#FF0000'>Il est très important</t>de comprendre que vous êtes toujours un civil, et devez obéir à toutes les règles qui s'appliquent aux civils. Un dépanneur ne doit pas se promener avec une arme à la main. Un Taxi n'est pas un soldat. <br/><br/>En tant que Taxi, votre travail consiste à venir au service de la population et <t color='#00FF00'>en priorité aux forces de l'ordre</t>.<br/><br/>", profileName];
	"Vous êtes Taxi" hintC _msg;
	player setVariable["life_taxi", true, true];
};

if (_type == "rebel") then
{
	_other = ["taxi",0] call life_fnc_licenseType;
	if (missionNamespace getVariable[_other select 0,false]) then
	{
		hint "Parce que vous êtes un terroriste, vous avez perdu votre licence de Taxi";
		missionNamespace setVariable[_other select 0,false];
		if(player getVariable["life_taxi", false]) then {
			player setVariable["life_taxi", false, true];
		};
	};
	
	_other = ["dep",0] call life_fnc_licenseType;
	if (missionNamespace getVariable[_other select 0,false]) then
	{
		hint "Parce que vous êtes un terroriste, vous avez perdu votre licence de dépanneur";
		missionNamespace setVariable[_other select 0,false];
		if(player getVariable["life_dep", false]) then {
			player setVariable["life_dep", false, true];
		};
	};
	
	_msg = parseText format["%1, vous êtes désormais rebelle!<br/><br/>En tant que <t color='#FF0000'>rebelle</t> vous devez vous conformer à certaines règles ou risquez la suppression de votre licence voir tout simplement être banni du serveur<br/><br/><t color='#FF0000'>Il est très important</t>de comprendre que vous êtes toujours un civil, et devez obéir à toutes les règles qui s'appliquent aux civils. Un rebelle se doit d'avoir un RP exemplaire. <br/><br/>En tant que rebelle, vous vous exposez à des représailles de la part des force de l'ordre. <t color='#00FF00'>Ne soyez pas étonné de vous faire attaquer sans sommation si vous vous ballader en tenu/équipement ou vehicules rebelles aux yeux de tous.</t>.<br/><br/>", profileName];
	"Vous êtes un mafieux" hintC _msg;
};

[2] call SOCK_fnc_updatePartial;