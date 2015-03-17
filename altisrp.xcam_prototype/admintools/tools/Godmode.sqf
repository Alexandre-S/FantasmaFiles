if (isNil "demiGOD") then
{
	demiGOD = 0;
};

if (demiGOD == 0) then
{
	demiGOD = 1;
    cutText ["Godmode activated.", "PLAIN"];
	player removeAllEventHandlers "handleDamage";
	player addEventHandler ["handleDamage", {false}];
	player allowDamage false;
	player setVariable["god_mod_eta", true, true];
}

else
{
	demiGOD = 0;
    cutText ["Godmode Deactivated.", "PLAIN"];
	player allowDamage true;
	player removeAllEventHandlers "handleDamage";
	player addEventHandler["handleDamage",{_this call AGM_Medical_fnc_handleDamage}];
	player setVariable["god_mod_eta", false, true];
};