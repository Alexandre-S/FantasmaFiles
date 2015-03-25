/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Retrieves all 3D-world positions in a building and also restricts
	certain positions due to window positioning.
*/
private["_building","_arr","_allowed","_exitLoop","_i","_pos"];
_building = _this select 0;
_arr = [];

/*_restricted = switch(typeOf _building) do
{
case "Land_i_House_Big_02_V1_F": {[0,1,2,3,4]};
case "Land_i_House_Big_02_V2_F": {[0,1,2,3,4]};
case "Land_i_House_Big_02_V3_F": {[0,1,2,3,4]};
case "Land_i_House_Big_01_V1_F": {[2,3]};
case "Land_i_House_Big_01_V2_F": {[2,3]};
case "Land_i_House_Big_01_V3_F": {[2,3]};
case "Land_i_Stone_HouseSmall_V1_F": {[0,1,3,4]};
case "Land_i_Stone_HouseSmall_V2_F": {[0,1,3,4]};
case "Land_i_Stone_HouseSmall_V3_F": {[0,1,3,4]};
default {[]};
*/

_allowed = switch(typeOf _building) do
{
case "Land_i_House_Big_02_V1_F": {[5,8,6]}; //[0,1,2,3,4,6]
case "Land_i_House_Big_02_V2_F": {[5,8,6]};
case "Land_i_House_Big_02_V3_F": {[5,8,6]};
case "Land_i_House_Big_01_V1_F": {[1,4,0,5]}; //[2,3]
case "Land_i_House_Big_01_V2_F": {[1,4,0,5]};
case "Land_i_House_Big_01_V3_F": {[1,4,0,5]};
case "Land_i_Stone_HouseSmall_V1_F": {[2,0]}; //[0,1,3,4]
case "Land_i_Stone_HouseSmall_V2_F": {[2,0]};
case "Land_i_Stone_HouseSmall_V3_F": {[2,0]};
case "Land_i_House_Small_01_V1_F": {[3,2]}; //[0,2]
case "Land_i_House_Small_01_V2_F": {[3,2]};
case "Land_i_House_Small_01_V3_F": {[3,2]};
case "Land_i_House_Small_02_V1_F": {[4,2]}; //[0,1,3]
case "Land_i_House_Small_02_V2_F": {[4,2]};
case "Land_i_House_Small_02_V3_F": {[4,2]};
case "Land_i_House_Small_03_V1_F": {[2,1,4]}; //[0,1,3]
default {[1]};
};

{
	_pos = _building buildingPos _x;
	if!(_pos isEqualTo [0,0,0]) then {
		_arr pushBack _pos;
	};
} foreach _allowed;

/*_i = 0;
_exitLoop = false; //Loops are not fun.
while {true} do {
	if(!(_i in _restricted)) then {
	_pos = _building buildingPos _i;
	if(_pos isEqualTo [0,0,0]) exitWith {_exitLoop = true;};
	_arr pushBack _pos;
	};
	if(_exitLoop) exitWith {};
	_i = _i + 1;
};*/

_arr;
