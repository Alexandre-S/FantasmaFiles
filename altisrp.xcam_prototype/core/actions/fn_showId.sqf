/*
	File: fn_showId.sqf
	Author: Youri Litovski
	
	Description:
	Show the ID card to someone
*/
private["_target", "_message","_coplevel","_rang"];

_target = _this select 1;

if( isNull _target) then {_target = player;};
if( !(_target isKindOf "Man") ) then {_target = player;};
if( !(alive _target) ) then {_target = player;};

switch (playerSide) do
{
	case west: 
	{
		_coplevel = __GETC__(life_coplevel);
		switch ( _coplevel ) do
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
		_message = format["<img size='10' color='#FFFFFF' image='altisrpfr\images\gendarmerie_elpida.paa'/><br/><br/><t size='2.5'>%1</t><br/><t size='1.8'>%2</t><br/><br/><t size='1'>Gendarme d'Elpida</t>", name player, _rang];
	};
	case independent: 
	{
		_coplevel = __GETC__(life_medicLevel);
		switch ( _coplevel ) do
		{
			case 1: { _rang = "Médecin Stagiaire"; };
			case 2: { _rang = "Médecin externe"; };
			case 3: { _rang = "Médecin interne"; };
			case 4: { _rang = "Médecin titulaire"; };
			case 5: { _rang = "Médecin chef"; };
			default { _rang = "Erreur de grade"; };
		};
		_message = format["<img size='10' color='#FFFFFF' image='altisrpfr\images\croixrouge_elpida.paa'/><br/><br/><t size='2.5'>%1</t><br/><t size='1.8'>%2</t><br/><br/><t size='1'>Croix-Rouge d'Elpida</t>", name player, _rang];
	};
	default 
	{ 
		_message = format["<img size='10' color='#FFFFFF' image='altisrpfr\images\civil_elpida.paa'/><br/><br/><t size='2.5'>%1</t><br/><br/><t size='1'>Civil d'Elpida</t>", name player];
	};
};

[[player, _message],"life_fnc_viewId",_target,false] spawn life_fnc_MP;