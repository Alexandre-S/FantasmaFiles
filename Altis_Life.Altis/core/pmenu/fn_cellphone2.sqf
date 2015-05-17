/*
File: fn_cellphone2.sqf
Author: Timo
 
Description:
With no radio cant use Cellphone
*/
 
 
if("ItemWatch" in assignedItems player OR "ACE_Altimeter" in assignedItems player) then {
createDialog "Life_my_smartphone"; // or /** Life_my_smartphone **\ if you use the SQL Based Smartphone   By Silex ( http://www.altislife...sed-smartphone/ )
}else{
hint parseText format ["<t size='1.30' font='puristaMedium' align='center' color='#0D82DF'>Pas de smartwatch</t><br/><br/>
<t size='0.90 'font='puristaLight' align='left'>Vous devez avoir votre smartwatch (Montre ou Altimètre) pour utiliser le téléphone. Vous pouvez trouver une smartwatch à la superette</t><br/>"];
};
