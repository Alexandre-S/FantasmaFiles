if(server_test) then {
	serverhc = false;
}else{

	if(isNil "Havena_HLCOBJ") then {
		waitUntil {sleep 0.1;(!isNil "Havena_HLCOBJ")};
	};
	if(isNil "Havena_HLCOBJ2") then {
		waitUntil {sleep 0.1;(!isNil "Havena_HLCOBJ2")};
	};
	// if (!(isplayer Havena_HLCOBJ) || !((getPlayerUID Havena_HLCOBJ) == "76561198128988909")) then {
		if ((isnull Havena_HLCOBJ) || ((typeOf Havena_HLCOBJ) != "HeadlessClient_F")) then {
		// waitUntil {sleep 0.1;(isplayer Havena_HLCOBJ)};
		waitUntil {sleep 0.1;(!isnull Havena_HLCOBJ)};
		// waitUntil {sleep 0.1;((getPlayerUID Havena_HLCOBJ) == "76561198128988909")};
		waitUntil {sleep 0.1;((typeOf Havena_HLCOBJ) == "HeadlessClient_F")};
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
