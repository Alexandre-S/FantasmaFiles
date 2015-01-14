/*

	Updates player clothing by replacing vanilla by custom ones
        by Audacious

*/

private["_uniform","_backpack"];

///Uniform
////////////////

_uniform = uniform player;

switch(true) do
{	
	case (playerSide == independent && _uniform == "U_Rangemaster"):
	{
		player setObjectTextureGlobal  [0, "altisrpfr\textures\medic_uniform.paa"];
		
		//if(backpack player != "") then {(unitBackpack player) setObjectTextureGlobal [0,""];};
	};
};

if (!life_Mask_sound && {goggles player == "Mask_M50" OR goggles player == "Mask_M40" OR goggles player == "Mask_M40_OD"}) then {
	life_Mask_sound = true;
	while {alive player AND (goggles player == "Mask_M50" OR goggles player == "Mask_M40" OR goggles player == "Mask_M40_OD")} do 
	{
		playsound3d ["A3\sounds_f\characters\human-sfx\other\diver-breath-2.wss", player,false,getposASL player, 0.8,1,15];
		sleep 5;
	};
	life_Mask_sound = false;
};