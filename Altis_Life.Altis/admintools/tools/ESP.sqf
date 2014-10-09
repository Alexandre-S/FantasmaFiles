//<MAP ESP>


marker_mapesp = true;
//Alle Vehicle
//_list_vec = (allMissionObjects "Plane")+(allMissionObjects "LandVehicle")+(allMissionObjects "Helicopter")+(allMissionObjects "Ship");
//<-----GLOBAL-VARIABLE----->
private["_actualunit"];
//hint "Adding Markers on the map";
admin_F4_EH = (findDisplay 46) displayAddEventHandler ["KeyDown","if ((_this select 1) == 0x3E) then {marker_mapesp = false;};"];	

while {marker_mapesp} do
{
    //<-----PLAYER-MARKER----->
    //<----------------------->
    //<-----PLAYER-MARKER----->
    _unitList_player = allUnits; //getting all units
    _totalunits = count _unitList_player;
    //hint format["%1", totalunits];
    
    _o = 0;
    _yo = 0;

    for "_o" from 0 to _totalunits do
    {
        _actualunit = _unitList_player select _o; //Player1
        //hint format["%1", actualunit];
        
		if (!isNil "_actualunit") then{
			if ( isplayer _actualunit && alive _actualunit ) then 
			{
				deleteMarkerLocal ("Player" + (str _o));
				_yo = _o + 1;
				deleteMarkerLocal ("Player" + (str _yo));
					
				_namePlayer = "";
				_namePlayer = name _actualunit;
			
				_mark_player = "Player" + (str _o); //Player0, Player1, Player2
				_mark_player = createMarkerLocal [_mark_player,getPos _actualunit];
				_mark_player setMarkerTypeLocal "waypoint";
				_mark_player setMarkerPosLocal (getPos _actualunit);
				_mark_player setMarkerColorLocal "ColorBlue";
				_mark_player setMarkerTextLocal format ["%1",_namePlayer];
			};
		};
    };    
    //bit of sleep
    sleep 1;
};
(findDisplay 46) displayRemoveEventHandler ["KeyDown", admin_F4_EH];
_k = 0;
for "_k" from 0 to 2000 do
{
    deleteMarkerLocal ("Player"+ (str _k));
    deleteMarkerLocal ("Vehicle"+ (str _k));
};