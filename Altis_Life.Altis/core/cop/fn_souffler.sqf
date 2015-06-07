/*file:
	fn_souffler
	author:Youri
*/
private["_target","_cop"];
_target = [_this,0,"",[""]] call BIS_fnc_param;
if(isNull _target) exitWith {};
[[_cop],"life_fnc_soufflerBallon",_target,FALSE] spawn life_fnc_MP;
