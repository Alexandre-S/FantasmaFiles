/*file:
	fn_breathalyzer 
	author:[midgetgrimm] 
	descrip:allows cop to breathalyze player
	Adaptation : youri
*/
private["_target","_drinky","_druglvl"];
_target = _this select 0;
_drinky = _this select 1;
_druglvl = _this select 2;
if(isNil _target) exitWith {};
hint parseText format["<t color='#FF0000'><t size='2'>Analyse alcool</t></t><br/><t color='#FFD700'><t size='1.5'>Niveau d'alcool : %1</t></t><br/><t color='#FFFFFF'><t size='1'>Limite légale : 0.25</t></t><br/><br/><t color='#FF0000'><t size='2'>Analyse drogues</t></t><br/><t color='#FFD700'><t size='1.5'>Niveau de drogue : %2</t></t>",_drinky,_druglvl];
