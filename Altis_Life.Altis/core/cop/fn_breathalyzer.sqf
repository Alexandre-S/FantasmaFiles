/*file:
	fn_breathalyzer 
	author:[midgetgrimm] 
	descrip:allows cop to breathalyze player
	Adaptation : youri
*/
private["_target","_drinky"];
_target = [_this,0,"",[""]] call BIS_fnc_param;
_drinky = _this select 1;
if(isNull _target) exitWith {};
hint parseText format["<t color='#FF0000'><t size='2'>Analyse alcootest</t></t><br/><t color='#FFD700'><t size='1.5'>Niveau d'alcool : %1</t></t>",_drinky];
