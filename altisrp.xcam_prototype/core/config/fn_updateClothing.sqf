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
	case (playerSide == west && _uniform == "U_Rangemaster"):
	{
		player setObjectTextureGlobal [0, "altisrpfr\textures\gendarmerie_uniform_base.paa"];
	};
	case (playerSide == independent && _uniform == "U_Rangemaster"):
	{
		player setObjectTextureGlobal  [0, "altisrpfr\textures\medic_uniform.paa"];
		//if(backpack player != "") then {(unitBackpack player) setObjectTextureGlobal [0,""];};
	};
	case (playerSide == independent && _uniform == "U_Competitor"):
	{
		player setObjectTextureGlobal  [0, "altisrpfr\textures\Polo_Pompiers.paa"];
	};
	case (playerSide == independent && _uniform == "U_O_OfficerUniform_ocamo"):
	{
		player setObjectTextureGlobal  [0, "altisrpfr\textures\sapeurspompiers.paa"];
	};
	case (playerSide == independent && _uniform == "U_C_WorkerCoveralls"):
	{
		player setObjectTextureGlobal  [0, "altisrpfr\textures\sapeurs_pompiers2015.paa"];
	};
	case (_uniform == "U_B_CombatUniform_mcam" OR _uniform == "U_B_CombatUniform_mcam_vest"):
	{
		player setObjectTextureGlobal  [0, "altisrpfr\textures\clothing1_co.paa"];
	};
};