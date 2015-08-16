#include "script_component.hpp"

/*class CfgPatches {
    class ADDON {
        units[] = {QGVAR(ModuleSettings), QGVAR(ModuleSurrender)};
        weapons[] = {"ACE_CableTie"};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ACE_Interaction"};
        author[] = {"commy2", "KoffeinFlummi"};
        authorUrl = "https://github.com/commy2/";
        VERSION_CONFIG;
    };
};*/
class CfgPatches
{
	class ace_captives
	{
		units[] = {"ace_captives_ModuleSettings","ace_captives_ModuleSurrender"};
		weapons[] = {"ACE_CableTie"};
		requiredVersion = 0.5;
		requiredAddons[] = {"ACE_Interaction"};
		author[] = {"commy2","KoffeinFlummi"};
		authorUrl = "https://github.com/commy2/";
		version = "3.2.1.0";
		versionStr = "3.2.1.0";
		versionAr[] = {3,2,1,0};
	};
};

#include "ACE_Settings.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgMoves.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
