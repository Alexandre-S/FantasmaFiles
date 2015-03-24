if(server_test) then {
	serverhc = false;
}else{
	// waitUntil {!isNil "Havena_HLCOBJ"};
	// waitUntil {!isNil "Havena_HLCOBJ2"};
	if(isNil "Havena_HLCOBJ") then {
		0 cutText["Problème de connexion à la base de donnée (1)... veuillez patienter ! ","BLACK FADED"];
		0 cutFadeOut 9999999;
		// waitUntil {sleep 0.1;(isplayer Havena_HLCOBJ)};
		waitUntil {sleep 0.1;(!isNil "Havena_HLCOBJ")};
	};
	
	if(isNil "Havena_HLCOBJ2") then {
		0 cutText["Problème de connexion à la base de donnée (2)... veuillez patienter ! ","BLACK FADED"];
		0 cutFadeOut 9999999;
		// waitUntil {sleep 0.1;(isplayer Havena_HLCOBJ)};
		waitUntil {sleep 0.1;(!isNil "Havena_HLCOBJ2")};
	};

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
	// if (!(isplayer Havena_HLCOBJ) || !((getPlayerUID Havena_HLCOBJ) == "76561198128988909")) then {
	
	if ((isnull Havena_HLCOBJ) || ((typeOf Havena_HLCOBJ) != "HeadlessClient_F")) then {
		0 cutText["Problème de connexion à la base de donnée (3)... veuillez patienter ! ","BLACK FADED"];
		0 cutFadeOut 9999999;
		// waitUntil {sleep 0.1;(isplayer Havena_HLCOBJ)};
		waitUntil {sleep 0.1;(!isnull Havena_HLCOBJ)};
		// waitUntil {sleep 0.1;((getPlayerUID Havena_HLCOBJ) == "76561198128988909")};
		waitUntil {sleep 0.1;((typeOf Havena_HLCOBJ) == "HeadlessClient_F")};
		0 cutText ["","BLACK IN"];
	};
	
	if (isNil "havena_id") then {
		Havena_idplayer = player;
		publicVariableServer "Havena_idplayer";
		0 cutText["Problème de connexion à la base de donnée... recuperation de l'id client... veuillez patienter !","BLACK FADED"];
		0 cutFadeOut 9999999;
		waitUntil {sleep 0.5;!isNil "havena_id"};
		0 cutText ["","BLACK IN"];
	};

	serverhc = Havena_HLCOBJ2;
};