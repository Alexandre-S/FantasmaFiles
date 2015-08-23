#include "script_component.hpp"

/*class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common"};
        author[] = {"NouberNou", "esteldunedain"};
        authorUrl = "";
        VERSION_CONFIG;
    };
};*/
class CfgPatches
{
	class ace_interact_menu
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.5;
		requiredAddons[] = {"ace_common"};
		author[] = {"NouberNou","esteldunedain"};
		authorUrl = "";
		version = "3.2.1.0";
		versionStr = "3.2.1.0";
		versionAr[] = {3,2,1,0};
	};
};

#include "CfgEventHandlers.hpp"

#include "CfgActions.hpp"

#include "CursorMenus.hpp"

#include "ACE_Settings.hpp"

class ACE_Extensions {
    extensions[] += {"ace_break_line", "ace_parse_imagepath"};
};
