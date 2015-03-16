[] spawn {
	
	havena_debug = false;
	
	setViewDistance havena_view;
	havena_objectView = round(havena_view*0.8);
	setObjectViewDistance [havena_objectView,havena_shadow];
	
	setTerrainGrid havena_grid;
	
	havena_ok = 0;
	havena_okk = 0;
	
	while{true} do {
		if(!life_autofps) then {
			waituntil{sleep 1;life_autofps};
		};
		havena_fps = diag_fps;
		if((((havena_fps <= (havena_targetfps)) && (havena_view > havena_minview)) && dayz_combat == 0) OR (havena_view > havena_maxview)) then {
			havena_okk = 0;
			havena_ok = - 1;
		};
		
		if(((havena_fps > (havena_targetfps+5)) && (havena_view < havena_maxview)) OR (havena_view < havena_minview)) then {

			if(havena_view < havena_minview) then {
				havena_ok = 101;
			} else {
				havena_ok = havena_ok + 1;
			};
			
			if(havena_ok > 100) then {
				havena_okk = 1;
			};
		};
		
		
		if(havena_ok > 100 || havena_okk == 1 || havena_ok < 0 || (dayz_combat == 1 && (havena_view < havena_mincombat))) then {
			if(havena_ok > 100 || havena_okk == 1) then {
				_plusfps = (ceil(havena_fps - havena_targetfps)) min 5;
				havena_view = havena_view + _plusfps;
				
				if(havena_view > havena_maxview) then {
					havena_view = havena_maxview;
				};
			};
			if(havena_ok < 0) then {
				_moinsfps = (floor(havena_fps - havena_targetfps)*2) min -1;
				havena_view = havena_view + _moinsfps;
				
				if(havena_view < havena_minview) then {
					havena_view = havena_minview;
				};
			};
			if(dayz_combat == 1 && havena_view < havena_mincombat) then {
				havena_view = havena_mincombat;
			};
			
			havena_objectView = round(havena_view*0.8);
			havena_shadow = round(havena_objectView*0.1);
			setViewDistance havena_view;
			setObjectViewDistance [havena_objectView,havena_shadow];
			// setObjectViewDistance havena_objectView;
			
			if(havena_debug) then {
				hint format["%1 - %2 [ %3 , %4 ] - %5 | %6",havena_fps,viewDistance,havena_objectView,havena_shadow,havena_grid,havena_ok];
			};
			waituntil{sleep 0.05;((((diag_fps <= (havena_targetfps)) && (havena_view > havena_minview)) && dayz_combat == 0) OR (havena_view > havena_maxview)) OR (((diag_fps > (havena_targetfps+5)) && (havena_view < havena_maxview)) OR (havena_view < havena_minview)) OR (dayz_combat == 1 && (havena_view < havena_mincombat))};
			havena_ok = 0;
		} else {
			// if(havena_debug) then {
				// hint "WTF";
				// diag_log format["FPS : %1 - Viewdist : %2 [ %3 , %4 ] - Grid : %5 | ok : %6 - targetFPS : %7 - mindist:  %8 - maxdist : %9 - havena_view : %10",havena_fps,viewDistance,havena_objectView,havena_shadow,havena_grid,havena_ok,havena_targetfps,havena_minview,havena_maxview,havena_view];
			// };
			sleep 0.05;
		};
		
	};
};