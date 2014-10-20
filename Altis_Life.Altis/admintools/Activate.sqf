waituntil {!alive player ; !isnull (finddisplay 46)};
if ((getPlayerUID player) in ["76561197971054451","76561197997451635","76561197971043903","76561197998367571","76561198047154722","76561197998925717","76561198075817952","76561197978210303","76561198010101889","76561198069512255","76561198075789125"]) then {
	sleep 30;
	player addaction [("<t color=""#0074E8"">" + ("Tools Menu") +"</t>"),"admintools\Eexcute.sqf","",5,false,true,"",""];
};