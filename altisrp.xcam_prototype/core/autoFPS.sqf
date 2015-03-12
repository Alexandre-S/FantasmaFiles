life_autofps = true;
[] spawn {
	havena_maxview = 3000;
	havena_view = 1000;
	havena_objectView = round(havena_view*0.8);
	havena_shadow = 50;
	havena_targetfps = 30;
	havena_grid = 48;

	setObjectViewDistance [havena_objectView,havena_shadow];
	setViewDistance havena_view;
	setTerrainGrid havena_grid;
	havena_ok = 0;
	
	while{true} do {
		if(!life_autofps) then {
			waituntil{sleep 1;life_autofps};
		};
		havena_fps = diag_fps;
		if((havena_fps <= (havena_targetfps)) && (havena_view >= 400) && dayz_combat == 0) then {
			havena_ok = havena_ok - 1;
		};

		if(((havena_fps > (havena_targetfps+5)) && (havena_view < havena_maxview))) then {
			havena_ok = havena_ok + 1;
		};
		
		if(havena_ok > 0 || havena_ok < 0 || (dayz_combat == 1 && havena_view < 620)) then {
			if(havena_ok > 0) then {
				havena_view = havena_view + ceil(havena_fps - havena_targetfps);
				if(havena_shadow < 200) then {
					havena_shadow = havena_shadow + 1;
				};
			};
			if(havena_ok < 0) then {
				
				havena_view = havena_view + floor(havena_fps - havena_targetfps)*2;
				if(havena_shadow > 50) then {
					havena_shadow = havena_shadow - 2;
				};
			};
			if(dayz_combat == 1 && havena_view < 620) then {
				havena_view = 620;
				havena_shadow = 50;
			};
			
			havena_objectView = round(havena_view*0.8);
			setObjectViewDistance [havena_objectView,havena_shadow];
			setViewDistance havena_view;
			waituntil{sleep 0.05;((diag_fps <= (havena_targetfps)) && (havena_view >= 500)) OR ((diag_fps > (havena_targetfps+5)) && (havena_view < havena_maxview)) OR (dayz_combat == 1 && havena_view < 620)};
			havena_ok = 0;
		};
		//hint format["%1 - %2 [ %3 , %4 ] - %5 | %6",havena_fps,viewDistance,havena_objectView,havena_shadow,havena_grid,havena_ok];
	};
};

