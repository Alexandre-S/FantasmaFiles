if (isNil "carGOD") then
{
	carGOD = 0;
};

if (carGOD == 0) then
{
	carGOD = 1;
	titleText ["Cargod enabled","PLAIN DOWN"]; titleFadeOut 4;
	while {alive ( vehicle player ) && carGOD == 1} do 
	{
		vehicle player setfuel 1;
		vehicle player setvehicleammo 1;
		vehicle player setdammage 0;
		sleep 0.001;
	};
}
else
{
	carGOD = 0;
	titleText ["Cargod disabled","PLAIN DOWN"]; titleFadeOut 4;
};