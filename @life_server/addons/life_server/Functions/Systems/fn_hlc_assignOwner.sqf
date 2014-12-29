/*
	Author: Eightysix

	Description:

	Syntax:

	Example:
*/
if !(isServer) exitWith {};

_hcID	= owner (_this select 0);
_state	= [_this,1,0,[0]] call BIS_fnc_param;
last_HC_update = _this select 2;

diag_log format["PO3_sVAR_HLCKeepAlive: HLCID %1 - state %2",_hcID,_state];


if(!hlcAI) then {
	if !(_hcID > 0) exitWith {diag_log format["Failed: HLCID %1 is Zero - %2",_hcID,_state,(_this select 0)]; };
	if(_state < 15) exitWith {diag_log format["Failed: HLCID %1 Low FPS %2. Too low to assign any further units",_hcID,_state]; };

	_playerIDs = [];
	{
		_playerIDs set [count _playerIDs, owner _x];
	}forEach (playableUnits);
	_playerIDs = _playerIDs - [0];

	{
		if(owner _x IN [0,1] && !((owner _x) IN _playerIDs) ) then {
			if !(isNull _x) then {
				if( _x setOwner _hcID ) then {
					diag_log format["Succeeded: HLCID %1, Object: %2 Command: %3 setOwner %1",_hcID,typeOf _x,_x];
				}else{
					diag_log format["Failed: HLCID %1, Owner %4, Object: %2 Command: %3 setOwner %1",_hcID,typeOf _x,_x,owner _x];
				};
			};
		};
	}forEach allUnits;
	hlcAI = true;
};