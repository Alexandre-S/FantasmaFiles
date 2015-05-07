sleep 5;

ef1 = ppEffectCreate ["colorCorrections", 1501];
ef1 ppEffectAdjust[ 0.7, 0.8, 0, [-2.32, 0.17, 0.71, 0],[1.09, 0.91, 0.66, 0.27],[-1.24, 3.03, 0.37, -1.69]];
ef1 ppEffectCommit 1;

ef2 = ppEffectCreate ["filmGrain", 1502];
// ef2 ppEffectAdjust [0.1, -1, 0.1, 0.05, 2, false];
// ef2 ppEffectAdjust [0.1, -1, 8, 0.5, 0.5, true]; 
ef2 ppEffectAdjust [1, 5, 8, 0.5, 0.5, true]; 

ef2 ppEffectCommit 1;

ef3 = ppEffectCreate ["colorCorrections", 1503];
ef3 ppEffectAdjust [1,1,-0.01,[0.0,0.0,0.0,0.0],[1.5,1,1.2,0.6],[0.199,0.587,0.114,0.20]];
ef3 ppEffectCommit 1;

ef4 = ppEffectCreate ["filmGrain", 1504];
// ef4 ppEffectAdjust [0.05, -1, 0.1, 0.05, 2, false];
// ef4 ppEffectAdjust [0.1, 0.9, 8, 0.5, 0.5, true]; 
ef4 ppEffectAdjust [1, 14, 8, 0.5, 0.5, true];
ef4 ppEffectCommit 1;

[] spawn {
	While{true} do 
	{
		"dynamicBlur" ppEffectEnable true; // enables ppeffect
		"dynamicBlur" ppEffectAdjust [0]; // enables normal vision
		"dynamicBlur" ppEffectCommit 15; // time it takes to normal
		resetCamShake; // resets the shake
		20 fadeSound 1;     //fades the sound back to normal


		waituntil{ sleep 0.3; (((nearestObject [getpos player, "SmokeShellYellow"]) distance player < 10) && (getpos (nearestObject [getpos player, "SmokeShellYellow"]) select 2 < 0.5)) };

		if (!(goggles player in ["Mask_M50","Mask_M40","Mask_M40_OD"])) then
		{
			"dynamicBlur" ppEffectEnable true; // enables ppeffect
			"dynamicBlur" ppEffectAdjust [20]; // intensity of blur
			"dynamicBlur" ppEffectCommit 3; // time till vision is fully blurred
			enableCamShake true;     // enables camera shake
			addCamShake [10, 45, 10];    // sets shakevalues
			player setFatigue 1; // sets the fatigue to 100%
			5 fadeSound 0.1;     // fades the sound to 10% in 5 seconds

		};
		
		sleep 5;
	};
};
[] spawn {
	While{true} do 
	{
		waituntil{  sleep 0.3; (!life_Mask_sound && {goggles player in ["Mask_M50","Mask_M40","Mask_M40_OD"]}) };

		life_Mask_sound = true;
		while {sleep 0.3;(alive player AND (goggles player in ["Mask_M50","Mask_M40","Mask_M40_OD"]))} do 
		{
			// playsound3d ["A3\sounds_f\characters\human-sfx\other\diver-breath-2.wss",player,false,getposASL player, 0.8,1,15];
			[[player, "diverbreath2",5],"life_fnc_playSound",true,false] spawn life_fnc_MP;
			sleep (random 2+5);
		};
		life_Mask_sound = false;
	};
};