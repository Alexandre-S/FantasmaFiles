if (isNil "demiGOD") then
{
	demiGOD = 0;
};

if (demiGOD == 0) then
{
	demiGOD = 1;
	player setVariable["gm_cheat", true, true];
	[[0,format ["GM %1 utilise Godmode",name player]],"life_fnc_broadcast_admin",allside,false] call life_fnc_MP;
    cutText ["Godmode activé.", "PLAIN"];
	// player removeAllEventHandlers "handleDamage";
	// player addEventHandler ["handleDamage", {false}];
	// player allowDamage false;
}

else
{
	demiGOD = 0;
    cutText ["Godmode désativé.", "PLAIN"];
	// player allowDamage true;
	// player removeAllEventHandlers "handleDamage";
	// player addEventHandler["handleDamage",{_this call ACE_Medical_fnc_handleDamage}];
	// player addEventHandler ["handleDamage", {true}];
	player setVariable["gm_cheat", false, true];
};