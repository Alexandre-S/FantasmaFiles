if (isNil "fufu") then
{
	fufu = 0;
};

if (fufu == 0) then
{
	fufu = 1;
	[[0,format ["GM %1 est maintenant invisible",name player]],"life_fnc_broadcast",true,false] call life_fnc_MP;
	//player hideObjectGlobal true;
	[[player,true],"TON_fnc_hideobjectg",false,false] spawn life_fnc_MP;
    cutText ["Invisibilité activé.", "PLAIN"];
}

else
{
	fufu = 0;
    cutText ["Invisibilité désativé.", "PLAIN"];
	//player hideObjectGlobal false;
	[[player,false],"TON_fnc_hideobjectg",false,false] spawn life_fnc_MP;
	[[0,format ["GM %1 est maintenant visible",name player]],"life_fnc_broadcast",true,false] call life_fnc_MP;
};