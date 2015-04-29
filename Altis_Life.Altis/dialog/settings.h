class SettingsMenu
{
	idd = 2900;
	name = "SettingsMenu";
	movingEnabled = 1;
	enableSimulation = 1;
	
	class controlsBackground
	{
		class fondtablet: Life_RscPicture
		{
			idc = 9090909;
			text = "altisrpfr\textures\menu.paa";
			x = 0;
			y = -0.12;
			w = 1;
			h = 1.28;
		};
		
		class RscMainBackground : life_RscText
		{
			colorBackground[] = {0,0,0,0.2};
			idc = -1;
			x = 0.075;
			y = 0.2 + (11 / 250);
			w = 0.875;
			h = 0.58 - (22 / 250);
		};
		
		class PlayerTagsHeader : Life_RscText
		{
			idc = -1;
			text = "$STR_SM_PlayerTags";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			
			x = 0.075;
			y = 0.53;
			w = 0.3;
			h = (1 / 25);
		};
		
		class SideChatHeader : PlayerTagsHeader
		{
			idc = -1;
			// text = "$STR_SM_SC";
			text = "Auto FPS";
			shadow = 0;
			
			y = 0.58;
		};
		
		class RevealNearestHeader : PlayerTagsHeader
		{
			idc = -1;
			text = "Révéler les objets proches";
			
			y = 0.63;
		};
		
		/*class RemoveherbeHeader : PlayerTagsHeader
		{
			idc = -1;
			text = "Supprimer les herbes";
			
			y = 0.68;
		};*/
		
		class Title : life_RscTitle
		{
			idc = -1;
			colorBackground[] = {0,0,0,0};
			text = "$STR_SM_Title";
			x = 0.1;
			y = 0.2;
			w = 0.5;
			h = (1 / 25);
		};
		
		class Title_Audio: life_RscTitle
		{
			idc = -1;
			colorBackground[] = {0,0,0,0};
			text = "$STR_SM_Title2";
			x = 0.5375;
			y = 0.2;
			w = 0.5;
			h = (1 / 25);
		};
		
		class Barre_separation: life_RscFrame
		{
			idc = -1;
			x = 0.485;
			y = 0.24;
			w = 0.0025;
			h = 0.5;
		};
	};
	
	class controls
	{
		class VDonFoot : life_RscText
		{
			idc = -1;
			text = "$STR_SM_onFoot";
			
			x = 0.075; y = 0.258;
			w = 0.275; h = 0.04;
		};
		
		class VDinCar : life_RscText
		{
			idc = -1;
			text = "$STR_SM_inCar";
			
			x = 0.075; y = 0.305;
			w = 0.275; h = 0.04;
		};
		
		class VDinAir : life_RscText
		{
			idc = -1;
			text = "$STR_SM_inAir";
			
			x = 0.075; y = 0.355;
			w = 0.275; h = 0.04;
		};
		
		class VDtargetFPS : life_RscText
		{
			idc = -1;
			text = "FPS min";
			
			x = 0.075; y = 0.405;
			w = 0.275; h = 0.04;
		};
		
		class VDcombatView : life_RscText
		{
			idc = -1;
			text = "Combat";
			
			x = 0.075; y = 0.455;
			w = 0.275; h = 0.04;
		};
		
		class VD_onfoot_slider : life_RscXSliderH 
		{
			idc = 2901;
			text = "";
			onSliderPosChanged = "[0,_this select 1] call life_fnc_s_onSliderChange;";
			tooltip = "$STR_SM_ToolTip1";
			x = 0.1875;
			y = 0.30 - (1 / 25);
			
			w = "7 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		
		class VD_onfoot_value : life_RscText
		{
			idc = 2902;
			text = "";
			
			x = 0.4; y = 0.258;
			w = 0.275; h = 0.04;
		};
		
		class VD_car_slider : life_RscXSliderH 
		{
			idc = 2911;
			text = "";
			onSliderPosChanged = "[1,_this select 1] call life_fnc_s_onSliderChange;";
			tooltip = "$STR_SM_ToolTip2";
			x = 0.1875;
			y = 0.35 - (1 / 25);
			
			w = "7 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		
		class VD_car_value : life_RscText
		{
			idc = 2912;
			text = "";
			
			x = 0.4; y = 0.31;
			w = 0.275; h = 0.04;
		};
		
		class VD_air_slider : life_RscXSliderH 
		{
			idc = 2921;
			text = "";
			onSliderPosChanged = "[2,_this select 1] call life_fnc_s_onSliderChange;";
			tooltip = "$STR_SM_ToolTip3";
			x = 0.1875;
			y = 0.40 - (1 / 25);
			
			w = "7 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		
		class VD_air_value : life_RscText
		{
			idc = 2922;
			text = "";
			
			x = 0.4; y = 0.36;
			w = 0.275; h = 0.04;
		};
		
		class VD_targetfps_slider : life_RscXSliderH 
		{
			idc = 2931;
			text = "";
			onSliderPosChanged = "[3,_this select 1] call life_fnc_s_onSliderChange;";
			tooltip = "FPS minimum souhaité";
			x = 0.1875;
			y = 0.45 - (1 / 25);
			
			w = "7 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		
		class VD_targetfps_value : life_RscText
		{
			idc = 2932;
			text = "";
			
			x = 0.4; y = 0.41;
			w = 0.275; h = 0.04;
		};
		
		class VD_combatView_slider : life_RscXSliderH 
		{
			idc = 2941;
			text = "";
			onSliderPosChanged = "[4,_this select 1] call life_fnc_s_onSliderChange;";
			tooltip = "Distance minimum en combat";
			x = 0.1875;
			y = 0.50 - (1 / 25);
			
			w = "7 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		
		class VD_combatView_value : life_RscText
		{
			idc = 2942;
			text = "";
			
			x = 0.4; y = 0.46;
			w = 0.275; h = 0.04;
		};
		
		class VDsoundFoot : life_RscText
		{
			idc = -1;
			text = "$STR_SM_onFoot";
			
			x = 0.5; y = 0.258;
			w = 0.275; h = 0.04;
		};
		
		class VDsoundCar : life_RscText
		{
			idc = -1;
			text = "$STR_SM_inCar";
			
			x = 0.5; y = 0.305;
			w = 0.275; h = 0.04;
		};
		
		class VDsoundAir : life_RscText
		{
			idc = -1;
			text = "$STR_SM_inAir";
			
			x = 0.5; y = 0.355;
			w = 0.275; h = 0.04;
		};
		
		class VDsoundBoat : life_RscText
		{
			idc = -1;
			text = "Mer:";
			
			x = 0.5; y = 0.405;
			w = 0.275; h = 0.04;
		};
		
		class VD_soundFoot_slider : life_RscXSliderH 
		{
			idc = 2951;
			text = "";
			onSliderPosChanged = "[5,_this select 1] call life_fnc_s_onSliderChange;";
			tooltip = "Son a pied";
			x = 0.6;
			y = 0.30 - (1 / 25);
			
			w = "7 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		
		class VD_soundFoot_value : life_RscText
		{
			idc = 2952;
			text = "";
			
			x = 0.8125; y = 0.258;
			w = 0.275; h = 0.04;
		};
		
		class VD_soundCar_slider : life_RscXSliderH 
		{
			idc = 2953;
			text = "";
			onSliderPosChanged = "[6,_this select 1] call life_fnc_s_onSliderChange;";
			tooltip = "Son en voiture";
			x = 0.6;
			y = 0.31;
			
			w = "7 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		
		class VD_soundCar_value : life_RscText
		{
			idc = 2954;
			text = "";
			
			x = 0.8125; y = 0.31;
			w = 0.275; h = 0.04;
		};
		
		class VD_soundAir_slider : life_RscXSliderH 
		{
			idc = 2955;
			text = "";
			onSliderPosChanged = "[7,_this select 1] call life_fnc_s_onSliderChange;";
			tooltip = "Son en véhicule aerien";
			x = 0.6;
			y = 0.36;
			
			w = "7 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		
		class VD_soundAir_value : life_RscText
		{
			idc = 2956;
			text = "";
			
			x = 0.8125; y = 0.36;
			w = 0.275; h = 0.04;
		};
		
		class VD_soundBoat_slider : life_RscXSliderH 
		{
			idc = 2957;
			text = "";
			onSliderPosChanged = "[8,_this select 1] call life_fnc_s_onSliderChange;";
			tooltip = "Son en véhicule maritime";
			x = 0.6;
			y = 0.41;
			
			w = "7 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		
		class VD_soundBoat_value : life_RscText
		{
			idc = 2958;
			text = "";
			
			x = 0.8125; y = 0.41;
			w = 0.275; h = 0.04;
		};
		
		class PlayerTagsONOFF : Life_RscActiveText
		{
			text = "ON";
			tooltip = "$STR_GUI_PlayTags";
			idc = 2970;
			sizeEx = 0.04;
			x = 0.385;
			y = 0.53;
			w = 0.275;
		};
		
		/*class SideChatONOFF : PlayerTagsONOFF
		{
			idc = 2971;
			tooltip = "";
			action = "[] call life_fnc_sidechat;";
			y = 0.48;
		};*/
		
		class SideChatONOFF : PlayerTagsONOFF
		{
			idc = 2971;
			tooltip = "Réduit ou augmente à la volé la visibilité général, des objets, des ombres pour maintenir vos FPS.";
			y = 0.58;
		};
		
		class RevealONOFF : PlayerTagsONOFF
		{
			tooltip = "$STR_GUI_PlayerReveal";
			idc = 2972;
			y = 0.63;
		};
		
		/*class HerbeONOFF : PlayerTagsONOFF
		{
			tooltip = "Désactive l'affichage de l'herbe";
			idc = 2973;
			y = 0.68;
		};*/
		
		class ButtonClose : life_RscButtonMenu {
			idc = -1;
			//shortcuts[] = {0x00050000 + 2};
			colorBackground[] = {0, 0, 0, 0.4};	
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0.1 + (6.25 / 19.8) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.78 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};