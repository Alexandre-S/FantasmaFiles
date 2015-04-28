/*
	File: fn_removeLicenses.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Used for stripping certain licenses off of civilians as punishment.
*/
private["_state"];
_state = [_this,0,1,[0]] call BIS_fnc_param;

switch (_state) do
{
	//Death while being wanted
	case 0:
	{
		l_c_rebel = false;
		l_c_thug = false;
		l_c_gun = false;
		//l_c_driver = false;
		//l_c_heroin = false;
		//l_c_marijuana = false;
		//l_c_coke = false;
	};
	
	//Jail licenses
	case 1:
	{
		l_c_gun = false;
		l_c_rebel = false;
		l_c_thug = false;
		//l_c_driver = false;
		l_c_dep = false;
		if(player getVariable["life_dep", false]) then {
			player setVariable["life_dep", false, true];
		};
		l_c_taxi = false;
		if(player getVariable["life_taxi", false]) then {
			player setVariable["life_taxi", false, true];
		};
	};
	
	//Remove motor vehicle licenses
	case 2:
	{
		if(l_c_driver OR l_c_air OR l_c_truck OR l_c_boat) then {
			//l_c_driver = false;
			//l_c_air = false;
			//l_c_truck = false;
			//l_c_boat = false;
			//hint localize "STR_Civ_LicenseRemove_1";
		};
	};
	
	//Killing someone while owning a gun license
	case 3:
	{
		if(l_c_gun) then {
			//l_c_gun = false;
			//hint localize "STR_Civ_LicenseRemove_2";
		};
	};
	
	// Revoking Licenses
    
    // Permis de Conduire
    case 10:
    {
        l_c_driver = false;
        hint localize "STR_Civ_RevokeLicense_Driver";
    };
    // Permis de Camions
    case 11:
    {
        l_c_truck = false;
        hint localize "STR_Civ_RevokeLicense_Truck";
    };
    // Brevet de Pilote
    case 12:
    {
        l_c_air = false;
        hint localize "STR_Civ_RevokeLicense_Pilot";
    };
    // Permis de Bateau
    case 13:
    {
        l_c_boat = false;
        hint localize "STR_Civ_RevokeLicense_Boating";
    };
    // Permis de plongée
    case 14:
    {
        l_c_dive = false;
        hint localize "STR_Civ_RevokeLicense_Diving";
    };
    // Licence de Taxi
    /*case 15:
    {
        l_c_taxi = false;
        hint localize "STR_Civ_RevokeLicense_Taxi";
    };*/
    // Toutes les licences
    case 16:
    {
        l_c_driver = false;
        l_c_truck = false;
        l_c_air = false;
        l_c_boat = false;
        l_c_air = false;
        l_c_dive = false;
        // l_c_taxi = false;
        hint localize "STR_Civ_RevokeLicense_AllMotor";
    };
    // Permis de port d'armes
    case 17:
    {
        l_c_gun = false;
        hint localize "STR_Civ_RevokeLicense_Firearm";
    };
};