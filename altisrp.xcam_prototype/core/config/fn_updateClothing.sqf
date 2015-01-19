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
	case (_uniform == "U_B_CombatUniform_mcam" OR _uniform == "U_B_CombatUniform_mcam_vest"):
	{
		player setObjectTextureGlobal  [0, "altisrpfr\textures\clothing1_co.paa"];
	};
};