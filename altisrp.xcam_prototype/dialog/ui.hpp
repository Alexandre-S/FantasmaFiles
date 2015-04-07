	class playerHUD
   	{
		idd=-1;
		movingEnable=0;
	  	fadein=0;
		duration = 999999999999999999;
	  	fadeout=0;
		name="playerHUD";
		onLoad="uiNamespace setVariable ['playerHUD',_this select 0]";
		objects[]={};
		
		class controlsBackground 
		{
			class speakerHIcon : life_RscPicture 
			{
			
				idc = 23662;
				text = "altisrpfr\icons\speaker.paa";
				x = safeZoneX+safeZoneW-0.115; y = safeZoneY+safeZoneH-0.67;
				w = 0.04; h = 0.04;
			};
			
			class combatHIcon : life_RscPicture 
			{
			
				idc = 23450;
				text = "altisrpfr\icons\status_combat_inside_ca.paa";
				x = safeZoneX+safeZoneW-0.115; y = safeZoneY+safeZoneH-0.61;
				w = 0.06; h = 0.08;
			};
			
			class foodHIcon : life_RscPicture 
			{
			
				idc = -1;
				text = "altisrpfr\icons\food.paa";
				x = safeZoneX+safeZoneW-0.115; y = safeZoneY+safeZoneH-0.54;
				w = 0.03; h = 0.04;
			};
			
			class waterHIcon : life_RscPicture 
			{
			
				idc = -1;
				text = "altisrpfr\icons\water.paa";
				x = safeZoneX+safeZoneW-0.12; y = safeZoneY+safeZoneH-0.50;
				w = 0.04; h = 0.04;
			};
			
			class healthHIcon : life_RscPicture
			{
				
				idc = -1;
				text = "altisrpfr\icons\health.paa";
				x = safeZoneX+safeZoneW-0.11; y = safeZoneY+safeZoneH-0.445;
				w = 0.02; h = 0.03;
			};
			
			class dependanceHIcon : life_RscPicture
			{
				idc = -1;
				text = "altisrpfr\icons\items\heroin_processed.paa";
				x = safeZoneX+safeZoneW-0.11; y = safeZoneY+safeZoneH-0.395;
				w = 0.02; h = 0.03;
			};
			
			class moneyHIcon : life_RscPicture
			{
				
				idc = -1;
				text = "altisrpfr\icons\money.paa";
				x = safeZoneX+safeZoneW-0.11; y = safeZoneY+safeZoneH-0.345;
				w = 0.02; h = 0.03;
			};
		};
		
		class controls
		{
			class speakertext
			{
				type=0;
				idc=23663;
				style=0;
				x=-1;
				y=-1;
				w=0.3;
				h=0.05;
				sizeEx=0.03;
				size=1;
				font="PuristaSemibold";
				colorBackground[]={0,0,0,0};
				colorText[] = { 1 , 1 , 1 , 1 };
				shadow=true;
				text="";
			};
			class foodtext
			{
				type=0;
				idc=23500;
				style=0;
				x=-1;
				y=-1;
				w=0.3;
				h=0.05;
				sizeEx=0.03;
				size=1;
				font="PuristaSemibold";
				colorBackground[]={0,0,0,0};
				colorText[] = { 1 , 1 , 1 , 1 };
				shadow=true;
				text="";
			};
			
			class watertext
			{
				type=0;
				idc=23510;
				style=0;
				x=-1;
				y=-1;
				w=0.3;
				h=0.05;
				sizeEx=0.03;
				size=1;
				font="PuristaSemibold";
				colorBackground[]={0,0,0,0};
				colorText[] = { 1 , 1 , 1 , 1 };
				shadow=true;
				text="";
			};
			
			class healthtext
			{
				type=0;
				idc=23515;
				style=0;
				x=-1;
				y=-1;
				w=0.3;
				h=0.05;
				sizeEx=0.03;
				size=1;
				font="PuristaSemibold";
				colorBackground[]={0,0,0,0};
				colorText[] = { 1 , 1 , 1 , 1 };
				shadow=true;
				text="";
			};
			
			class dependancetext
			{
				type=0;
				idc=23525;
				style=0;
				x=-1;
				y=-1;
				w=0.3;
				h=0.05;
				sizeEx=0.03;
				size=1;
				font="PuristaSemibold";
				colorBackground[]={0,0,0,0};
				colorText[] = { 1 , 1 , 1 , 1 };
				shadow=true;
				text="";
			};
			
			class moneytext
			{
				type=0;
				idc=23520;
				style=0;
				x=-1;
				y=-1;
				w=0.3;
				h=0.05;
				sizeEx=0.03;
				size=1;
				font="PuristaSemibold";
				colorBackground[]={0,0,0,0};
				colorText[] = { 1 , 1 , 1 , 1 };
				shadow=true;
				text="";
			};
		};   
 	};