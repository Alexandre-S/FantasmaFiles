/*
	File: fn_licensePrice.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Returns the license price.
*/
private["_type"];
_type = [_this,0,"",[""]] call BIS_fnc_param;
if(_type == "") exitWith {-1};

switch (_type) do
{
	case "driver": {1500}; //Drivers License cost
	case "boat": {15000}; //Boating license cost
	case "pilot": {500000}; //Pilot/air license cost
	case "gun": {100000}; //Firearm/gun license cost
	case "dive": {65000}; //Diving license cost
	case "oil": {60000}; //Oil processing license cost
	case "cair": {100000}; //Cop Pilot License cost
	case "swat": {35000}; //Swat License cost
	case "cg": {5000}; //Coast guard license cost
	case "heroin": {250000}; //Heroin processing license cost
	case "marijuana": {200000}; //Marijuana processing license cost
	case "medmarijuana": {1500}; //Medical Marijuana processing license cost
	case "gang": {10000}; //Gang license cost
	case "rebel": {150000}; //Rebel license cost
	case "truck": {250000}; //Truck license cost
	case "diamond": {100000};
	case "salt": {75000};
	case "cocaine": {300000};
	case "sand": {75000};
	case "iron": {90000};
	case "copper": {15000};
	case "cement": {15000};
	case "mair": {15000};
	case "home": {75000};
};