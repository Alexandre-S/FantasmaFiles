/*file:
	fn_medSos.sqf
	author:Youri & Havena
*/

[[ObjNull,format["%1 - SOS",name player],player,3],"TON_fnc_handleMessages",serverhc] spawn life_fnc_MP;
[[format["%1 - Balise de détresse",name player], position player],"life_fnc_createMarker",independent,false] spawn life_fnc_MP;
