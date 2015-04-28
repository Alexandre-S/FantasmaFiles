/*
	File: fn_clothing_copdive.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for Altis Cop Diving Shop.
*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Magasin de plongée Gendarme"];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
			["U_B_Wetsuit",nil,0],
			["U_O_Wetsuit",nil,0]
		];
	};
	
	//Hats
	case 1:
	{
		[
		];
	};
	
	//Glasses
	case 2:
	{
		[
			["G_Diving",nil,0]
		];
	};
	
	//Vest
	case 3:
	{
		[
			["V_RebreatherB",nil,0],
			["V_RebreatherIR",nil,0],
			["V_RebreatherIA",nil,0]
			
		];
	};
	
	//Backpacks
	case 4:
	{
		[
		];
	};
};