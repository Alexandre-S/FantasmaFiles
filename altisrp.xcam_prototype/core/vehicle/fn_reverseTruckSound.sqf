/*
	File: fn_reverseTruckSound.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the truck reverse alarm sound for other players
*/
private["_vehicle","_soundToPlay"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

if(isNull _vehicle) exitWith {};
if(!life_truckreverse_active) exitWith {};

while {true} do
{
	if(isNull _vehicle) exitWith {};
	if(!alive _vehicle) exitWith {};
	if(count (crew (_vehicle)) == 0) then {};
	if(isNull driver _vehicle) exitWith {};
	if(speed _vehicle >= 0) exitWith {};
	_soundToPlay = "altisrpfr\sounds\truck_reverse.ogg";
	playSound3D [_soundToPlay, _vehicle];
	uiSleep 2.56;
};

life_truckreverse_active = false;