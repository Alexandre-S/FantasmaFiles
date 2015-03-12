while {true} do
{
  waitUntil {sleep 1; alive vehicle player};
 [] execVM "admintools\activate.sqf";


  waitUntil {sleep 1; !alive player};
}; 