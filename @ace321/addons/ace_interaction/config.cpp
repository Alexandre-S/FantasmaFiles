#include "script_component.hpp"

/*class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_interact_menu"};
        author[] = {"commy2", "KoffeinFlummi", "esteldunedain", "bux578"};
        authorUrl = "https://github.com/commy2/";
        VERSION_CONFIG;
    };
};*/
class CfgPatches
{
	class ace_interaction
	{
		units[] = {"ACE_ModuleInteraction"};
		weapons[] = {};
		requiredVersion = 0.5;
		requiredAddons[] = {"ace_interact_menu"};
		author[] = {"commy2","KoffeinFlummi","esteldunedain","bux578"};
		authorUrl = "https://github.com/commy2/";
		version = "3.2.1.0";
		versionStr = "3.2.1.0";
		versionAr[] = {3,2,1,0};
	};
};

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
#include "Menu_Config.hpp"
#include "ACE_Settings.hpp"
#include "ACE_ZeusActions.hpp"
