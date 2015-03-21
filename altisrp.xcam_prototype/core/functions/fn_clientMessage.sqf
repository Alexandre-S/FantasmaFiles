if(isServer OR ((!IsDedicated)&&(!hasinterface))) exitwith {};
private["_msg","_from", "_type","_fromplayer","_position"];
_msg = _this select 0;
_fromplayer = _this select 1;
_from = name _fromplayer;
_type = _this select 2;
_position = [_this,3,[],[[]]] call BIS_fnc_param;

if(_from == "") exitWith {};
switch (_type) do
{
	case 0 :
	{
		private["_message"];
		_message = format[">>>MESSAGE DE %1: %2",_from,_msg];
		hint parseText format ["<t color='#FFCC00'><t size='2'><t align='center'>Nouveau Message<br/><br/><t color='#33CC33'><t align='left'><t size='1'>A: <t color='#ffffff'>Vous<br/><t color='#33CC33'>De: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Message:<br/><t color='#ffffff'>%2",_from,_msg];
		
		["TextMessage",[format["Vous avez reçu un nouveau message privé de %1",_from]]] call bis_fnc_showNotification;
		systemChat _message;
		playSound "cell_ring_0";
	};
	
	case 1 :
	{
		if(side player != west) exitWith {};
		private["_message"];
		_message = format["---APPEL GENDARMERIE DE %1: %2",_from,_msg];
		hint parseText format ["<t color='#316dff'><t size='2'><t align='center'>Nouvelle demande<br/><br/><t color='#33CC33'><t align='left'><t size='1'>A: <t color='#ffffff'>Tous les agents<br/><t color='#33CC33'>De: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Message:<br/><t color='#ffffff'>%2",_from,_msg];
		
		["PoliceDispatch",[format["Nouvel appel d'urgence de: %1",_from]]] call bis_fnc_showNotification;
		systemChat _message;
		playSound "cell_ring_0";
	};
	
	case 2 :
	{
		if((call life_adminlevel) < 1) exitWith {};
		private["_message"];
		_message = format["???DEMANDE D'ADMIN DE  %1: %2",_from,_msg];
		hint parseText format ["<t color='#ffcefe'><t size='2'><t align='center'>Demande Admin<br/><br/><t color='#33CC33'><t align='left'><t size='1'>A: <t color='#ffffff'>Admins<br/><t color='#33CC33'>De: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Message:<br/><t color='#ffffff'>%2",_from,_msg];
		
		["AdminDispatch",[format["%1 a demandé un Admin!",_from]]] call bis_fnc_showNotification;
		systemChat _message;
		playSound "cell_ring_0";
		[name _fromplayer, _position,"ADMIN"] spawn life_fnc_createMarker;
	};
	
	case 3 :
	{
		private["_message"];
		_message = format["!!!MESSAGE D'ADMIN: %1",_msg];
		_admin = format["Envoyé par admin: %1", _from];
		hint parseText format ["<t color='#FF0000'><t size='2'><t align='center'>Message d'Admin<br/><br/><t color='#33CC33'><t align='left'><t size='1'>A: <t color='#ffffff'>Vous<br/><t color='#33CC33'>De: <t color='#ffffff'>Un Admin<br/><br/><t color='#33CC33'>Message:<br/><t color='#ffffff'>%1",_msg];
		
		["AdminMessage",["Vous avez reçu un message d'un Admin!"]] call bis_fnc_showNotification;
		systemChat _message;
		if((call life_adminlevel) > 0) then {systemChat _admin;};
		playSound "cell_ring_0";
	};
	
	case 4 :
	{
		private["_message","_admin"];
		_message = format["!!!MESSAGE DE LA PREFECTURE: %1",_msg];
		_admin = format["Envoyé par la prefecture: %1", _from];
		hint parseText format ["<t color='#FF0000'><t size='2'><t align='center'>Message de la prefecture<br/><br/><t color='#33CC33'><t align='left'><t size='1'>A: <t color='#ffffff'>Tous les joueurs<br/><t color='#33CC33'>De: <t color='#ffffff'>La prefecture<br/><br/><t color='#33CC33'>Message:<br/><t color='#ffffff'>%1",_msg];
		
		["AdminMessage",["Vous avez reçu un message de le prefecture!"]] call bis_fnc_showNotification;
		systemChat _message;
		if((call life_adminlevel) > 0) then {systemChat _admin;};
		playSound "cell_ring_0";
	};
	
	case 5:
	{
		private["_message"];
		_message = format["!!!APPEL D'URGENCE: %1",_msg];
		hint parseText format ["<t color='#FFCC00'><t size='2'><t align='center'>Nouvelle demande<br/><br/><t color='#33CC33'><t align='left'><t size='1'>A: <t color='#ffffff'>Tous les médecins<br/><t color='#33CC33'>De: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Message:<br/><t color='#ffffff'>%2",_from,_msg];
		
		["MedicalRequestEmerg",[format["Nouvel appel d'urgence de: %1",_from]]] call bis_fnc_showNotification;
		playSound "cell_ring_0";
		[name _fromplayer, _position,"SAMU"] spawn life_fnc_createMarker;
	};
	
	case 6 :
	{
		if!(player getVariable["life_dep",false]) exitWith {};
		private["_message"];
		_message = format["---APPEL DEPANNEUR DE %1: %2",_from,_msg];
		hint parseText format ["<t color='#316dff'><t size='2'><t align='center'>Nouvelle demande<br/><br/><t color='#33CC33'><t align='left'><t size='1'>A: <t color='#ffffff'>Tous les dépanneurs<br/><t color='#33CC33'>De: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Message:<br/><t color='#ffffff'>%2",_from,_msg];
		
		["TextMessage",[format["Nouvel appel d'urgence de: %1",_from]]] call bis_fnc_showNotification;
		systemChat _message;
		playSound "cell_ring_0";
		[name _fromplayer, _position,"DEP"] spawn life_fnc_createMarker;
	};
	
	case 7 :
	{
		if!(player getVariable["life_taxi",false]) exitWith {};
		private["_message"];
		_message = format["---APPEL TAXI DE %1: %2",_from,_msg];
		hint parseText format ["<t color='#316dff'><t size='2'><t align='center'>Nouvelle demande<br/><br/><t color='#33CC33'><t align='left'><t size='1'>A: <t color='#ffffff'>Tous les taxis<br/><t color='#33CC33'>De: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Message:<br/><t color='#ffffff'>%2",_from,_msg];
		
		["TextMessage",[format["Nouvelle demande de taxi de: %1",_from]]] call bis_fnc_showNotification;
		systemChat _message;
		playSound "cell_ring_0";
		[name _fromplayer, _position,"TAXI"] spawn life_fnc_createMarker;
	};
};