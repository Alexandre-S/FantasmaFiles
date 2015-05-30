/*
    File: fn_airsoftGear.sqf
    Author: Youri

    Description:
    Equipe, Stuff Airsoft
*/
private["_rec","_Munition"];
_rec = _this select 3;
if(_rec == "tB") then {
	titleText["Vous rejoignez l'équipe bleu","PLAIN"];
	life_as_team = true;
	player forceAddUniform "U_Bleu_Airsoft";
	player addVest "V_TacVest_Bleu_airsoft";
	player addItemToUniform "Pomi_Goggles";
	player addItemToUniform "ACE_EarPlugs";
	player addItemToVest "H_ag_bandanna_02";
};
if(_rec == "tJ") then {
	titleText["Vous rejoignez l'équipe jaune","PLAIN"];
	life_as_team = true;
	player forceAddUniform "U_Jaune_Airsoft";
	player addVest "V_TacVest_Jaune_airsoft";
	player addItemToUniform "Pomi_Goggles";
	player addItemToUniform "ACE_EarPlugs";
	player addItemToVest "H_ag_bandanna_02";
};
if(_rec == "1911") then {
	titleText["Vous recevez un M1911 et 5 chargeurs","PLAIN"];
	life_as_pistol = true;
	for "_x" from 1 to 5 do{
		player addItem "mag_7x45acp_MHP_airsoft";
	};
	player addWeapon "rhsusf_weap_m1911a1_as";
	life_as_namePistol = "rhsusf_weap_m1911a1_as";
};
if(_rec == "rook") then {
	titleText["Vous recevez un Rook et 5 chargeurs","PLAIN"];
	life_as_pistol = true;
	for "_x" from 1 to 5 do{
		player addItem "16Rnd_9x21_Mag_airsoft";
	};
	player addWeapon "hgun_Rook40_F_as";
	life_as_namePistol = "hgun_Rook40_F_as";
};
if(_rec == "acp") then {
	titleText["Vous recevez un ACP-C2 et 5 chargeurs","PLAIN"];
	life_as_pistol = true;
	for "_x" from 1 to 5 do{
		player addItem "9Rnd_45ACP_Mag_airsoft";
	};
	player addWeapon "hgun_ACPC2_F_as";
	life_as_namePistol = "hgun_ACPC2_F_as";
};
if(_rec == "pmm") then {
	titleText["Vous recevez un Makarov PMM et 5 chargeurs","PLAIN"];
	life_as_pistol = true;
	for "_x" from 1 to 5 do{
		player addItem "mag_9x18_12_57N181S_airsoft";
	};
	player addWeapon "rhs_weap_makarov_pmm_as";
	life_as_namePistol = "rhs_weap_makarov_pmm_as";
};
if(_rec == "m4") then {
	titleText["Vous recevez une M4 et 10 chargeurs","PLAIN"];
	life_as_rifle = true;
	for "_x" from 1 to 10 do{
		player addItem "30Rnd_556x45_Stanag_airsoft";
	};
	player addWeapon "rhs_weap_m4_as";
	life_as_nameRifle = "rhs_weap_m4_as";
};
if(_rec == "m4a1") then {
	titleText["Vous recevez une M4A1 Block II et 10 chargeurs","PLAIN"];
	life_as_rifle = true;
	for "_x" from 1 to 10 do{
		player addItem "30Rnd_556x45_Stanag_airsoft";
	};
	player addWeapon "rhs_weap_m4a1_blockII_as";
	life_as_nameRifle = "rhs_weap_m4a1_blockII_as";
};
if(_rec == "m16a4") then {
	titleText["Vous recevez une M16A4 et 10 chargeurs","PLAIN"];
	life_as_rifle = true;
	for "_x" from 1 to 10 do{
		player addItem "30Rnd_556x45_Stanag_airsoft";
	};
	player addWeapon "rhs_weap_m16a4_as";
	life_as_nameRifle = "rhs_weap_m16a4_as";
};
if(_rec == "ak74") then {
	titleText["Vous recevez une AK-74 et 10 chargeurs","PLAIN"];
	life_as_rifle = true;
	for "_x" from 1 to 10 do{
		player addItem "30Rnd_545x39_AK_airsoft";
	};
	player addWeapon "rhs_weap_ak74m_as";
	life_as_nameRifle = "rhs_weap_ak74m_as";
};
if(_rec == "akm") then {
	titleText["Vous recevez une AKM et 10 chargeurs","PLAIN"];
	life_as_rifle = true;
	for "_x" from 1 to 10 do{
		player addItem "30Rnd_762x39mm_airsoft";
	};
	player addWeapon "rhs_weap_akm_as";
	life_as_nameRifle = "rhs_weap_akm_as";
};
if(_rec == "akms") then {
	titleText["Vous recevez une AKMS et 10 chargeurs","PLAIN"];
	life_as_rifle = true;
	for "_x" from 1 to 10 do{
		player addItem "30Rnd_762x39mm_airsoft";
	};
	player addWeapon "rhs_weap_akms_as";
	life_as_nameRifle = "rhs_weap_akms_as";
};

if(life_as_rifle && !life_game_start) then{
	sleep 5;
	titleText["Vous êtes désormais équipé, merci de mettre vos lunettes, et d'attendre dans le calme le début de la partie !","PLAIN"];
};

if(_rec == "reload") then {
	titleText["Vous recevez des chargeurs","PLAIN"];
	_Munition = [] + getArray (configFile >> "cfgWeapons" >> life_as_nameRifle >> "magazines");
	for "_x" from 1 to 5 do{
		player addItem (_Munition select 0);
	};
	_Munition = [] + getArray (configFile >> "cfgWeapons" >> life_as_namePistol >> "magazines");
	for "_x" from 1 to 5 do{
		player addItem (_Munition select 0);
	};
	life_as_reload = true;
};
