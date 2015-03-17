abcd={
	_pos = [_this select 0, _this select 1, _this select 2];
	(vehicle player) setpos [_pos select 0, _pos select 1, 0];
	player setVariable["lastPos",1];player setVariable["lastPos",[]];
	onMapSingleClick "";
	openMap [false, false];
};

//[[1,format ["GM %1 utilise TP",name player]],"life_fnc_broadcast",true,false] call life_fnc_MP;
[[0,format ["GM %1 utilise TP",name player]],"life_fnc_broadcast",true,false] call life_fnc_MP;

openMap [true, false];
onMapSingleClick "[_pos select 0, _pos select 1, _pos select 2] call abcd";