if(server_test) then {
	serverhc = false;
}else{
	waitUntil {!isNil "Havena_HLCOBJ"};
	waitUntil {!isNil "Havena_HLCOBJ2"};
	if (!(isplayer Havena_HLCOBJ) || !((getPlayerUID Havena_HLCOBJ) == "76561198128988909")) then {
		waitUntil {sleep 0.1;(isplayer Havena_HLCOBJ)};
		waitUntil {sleep 0.1;((getPlayerUID Havena_HLCOBJ) == "76561198128988909")};
		//0 cutText["Problème de connexion à la base de donnée... veuillez patienter ! ","BLACK FADED"];
		//sleep 5;
	};
	serverhc = Havena_HLCOBJ2;

	/*
	if(!isnil ("Havena_HLCOBJ")) then {
		if ((isplayer Havena_HLCOBJ) && ((getPlayerUID Havena_HLCOBJ) == "76561198128988909")) then {
			serverhc = Havena_HLCOBJ;
		}
		else {
			serverhc = false;
			diag_log format["[debug] HLC FAIL %1", Havena_HLCOBJ];
		};
	};*/
	diag_log format["[debug] HLC %1", serverhc];
};
