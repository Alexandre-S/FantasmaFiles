/*
	File: fn_overdose.sqf
	Author: John "Paratus" VanderZwet / cptjames32
	 
	Description:
	Took things a little too far!
*/
private["_overdose","_gesture","_duration"]
_overdose = [_this,0,0,[0]] call bis_fnc_param;
_gesture = "GestureSpasm%1";
_duration = ceil random 20;

if(_overdose == 0) then {
	hint "Vous faites une overdose !";
else {
	hint "Vous êtes en manque !";
};

disableUserInput true;
player playActionNow format[_gesture,1];

for "_i" from 1 to _duration do {
	switch (_i) do
	{
		case (5): { player playActionNow format[_gesture,2]; };
		case (10): { player playActionNow format[_gesture,3]; };
		case (15): { player playActionNow format[_gesture,4]; };
	};
	sleep 2;
};

disableUserInput false;

if(_overdose == 0) then {
_death = random 1;
if (_death > 0.7) then { hint "Vous venez de mourir d'une overdose !"; player setDamage 1; }
else { player playActionNow "gestureNod"; };

life_drug_level = 0;