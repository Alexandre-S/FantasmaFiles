/*
	File: fn_viewId.sqf
	Author: Youri Litovski
	
	Description:
	View someone ID card
*/
private["_unit","_lvl","_rang","_message"];

_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_lvl = [_this,1,-1,[0]] call BIS_fnc_param;

if(isNull _unit OR _lvl == -1) exitwith {};


switch (side _unit) do
{
	case west: 
	{
		switch ( _lvl ) do
		{
			case 1: { _rang = "Adjoint"; };
			case 2: { _rang = "Brigadier"; };
			case 3: { _rang = "Lieutenant"; };
			case 4: { _rang = "Capitaine"; };
			case 5: { _rang = "Colonel"; };
			case 6: { _rang = "Général"; };
			case 7: { _rang = "Gouverneur"; };
			case 8: { _rang = "Dieu"; };
			default { _rang = "Erreur de grade"; };
		};
		_message = format["<img size='10' color='#FFFFFF' image='altisrpfr\images\gendarmerie_elpida.paa'/><br/><br/><t size='2.5'>%1</t><br/><t size='1.8'>%2</t><br/><br/><t size='1'>Gendarme d'Elpida</t>", name _unit, _rang];
	};
	case independent: 
	{
		switch ( _lvl ) do
		{
			case 1: { _rang = "Médecin Stagiaire"; };
			case 2: { _rang = "Médecin externe"; };
			case 3: { _rang = "Médecin interne"; };
			case 4: { _rang = "Médecin titulaire"; };
			case 5: { _rang = "Médecin chef"; };
			default { _rang = "Erreur de grade"; };
		};
		_message = format["<img size='10' color='#FFFFFF' image='altisrpfr\images\croixrouge_elpida.paa'/><br/><br/><t size='2.5'>%1</t><br/><t size='1.8'>%2</t><br/><br/><t size='1'>Croix-Rouge d'Elpida</t>", name _unit, _rang];
	};
	default 
	{ 
		_message = format["<img size='10' color='#FFFFFF' image='altisrpfr\images\civil_elpida.paa'/><br/><br/><t size='2.5'>%1</t><br/><br/><t size='1'>Civil d'Elpida</t>", name _unit];
	};
};

hintSilent parseText _message;
