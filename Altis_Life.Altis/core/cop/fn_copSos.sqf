/*file:
	fn_copSos.sqf
	author:Youri
*/

[[ObjNull,format["%1 - SOS",name player],player,1],"TON_fnc_handleMessages",serverhc] spawn life_fnc_MP;
[[format["%1 - Balise de détresse",name player], position player],"life_fnc_createMarker",west,false] spawn life_fnc_MP;
