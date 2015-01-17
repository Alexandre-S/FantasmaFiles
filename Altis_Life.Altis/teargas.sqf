sleep 5;
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

While{true} do 
{
	waituntil{  sleep 0.3; (!life_Mask_sound && {goggles player in ["Mask_M50","Mask_M40","Mask_M40_OD"]}) };

	life_Mask_sound = true;
	while {sleep 0.3;(alive player AND (goggles player in ["Mask_M50","Mask_M40","Mask_M40_OD"]))} do 
	{
		playsound3d ["A3\sounds_f\characters\human-sfx\other\diver-breath-2.wss",player,false,getposASL player, 0.8,1,15];
		sleep 5;
	};
	life_Mask_sound = false;
};