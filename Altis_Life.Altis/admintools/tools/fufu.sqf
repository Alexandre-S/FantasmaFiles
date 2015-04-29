if (isNil "fufu") then
{
	fufu = 0;
};

if (fufu == 0) then
{
	fufu = 1;
	[[0,format ["GM %1 est maintenant invisible",name player]],"life_fnc_broadcast",true,false] call life_fnc_MP;
	player hideObjectGlobal true;
    cutText ["Invisibilité activé.", "PLAIN"];
}

else
{
	fufu = 0;
    cutText ["Invisibilité désativé.", "PLAIN"];
	player hideObjectGlobal false;
	[[0,format ["GM %1 est maintenant visible",name player]],"life_fnc_broadcast",true,false] call life_fnc_MP;
};