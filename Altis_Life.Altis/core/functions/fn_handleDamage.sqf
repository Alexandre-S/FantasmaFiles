/*
	File: fn_handleDamage.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Handles damage, specifically for handling the 'tazer' pistol and nothing else.
*/
private["_unit","_damage","_source","_projectile","_part","_curWep","_source2"];
_unit = _this select 0;
_part = _this select 1;
_damage = _this select 2;
_source = _this select 3;
_projectile = _this select 4;

//Internal Debugging.
if(!isNil "TON_Debug") then {
	systemChat format["PART: %1 || DAMAGE: %2 || SOURCE: %3 || PROJECTILE: %4 || FRAME: %5",_part,_damage,_source,_projectile,diag_frameno];
};

//Handle the tazer first (Top-Priority).
if(!isNull _source) then {
	if(_source != _unit) then {
		_curWep = currentWeapon _source;
		/*if(_projectile in ["B_9x21_Ball","B_556x45_dual"] && _curWep in ["hgun_P07_snds_F","arifle_SDAR_F"]) then {
			// if(side _source == west && playerSide != west) then {
				private["_distance","_isVehicle","_isQuad"];
				_distance = if(_projectile == "B_556x45_dual") then {100} else {35};
				_isVehicle = if(vehicle player != player) then {true} else {false};
				_isQuad = if(_isVehicle) then {if(typeOf (vehicle player) == "B_Quadbike_01_F") then {true} else {false}} else {false};
				
				_damage = 0;
				if(_unit distance _source < _distance) then {
					if(!life_istazed && !(_unit getVariable["ACE_captives_isHandcuffed",false])) then {
						if(_isVehicle && _isQuad) then {
							player action ["Eject",vehicle player];
							[_unit,_source] spawn life_fnc_tazed;
						} else {
							[_unit,_source] spawn life_fnc_tazed;
						};
					};
				};
			// };
			
			//Temp fix for super tasers on cops.
			// if(playerSide == west && side _source == west) then {
				// _damage = 0;
			// };
		};*/
		
		 if(_projectile == "DDOPP_B_Taser" && _curWep in ["DDOPP_X26","DDOPP_X26_b","DDOPP_X3","DDOPP_X3_b"]) then {
			// if(side _source == west && playerSide != west) then {
				_damage = 0;
				private["_distance","_isVehicle","_isQuad"];
				_distance = 15;
				//_distance = if(_projectile == "B_556x45_dual") then {100} else {35};
				_isVehicle = if(vehicle player != player) then {true} else {false};
				_isQuad = if(_isVehicle) then {if((typeOf (vehicle player)) in ["B_Quadbike_01_F","C_Kart_01_Vrana_F","C_Kart_01_Red_F","C_Kart_01_Blu_F","C_Kart_01_Fuel_F","C_Kart_01_F","MMT_Civ"]) then {true} else {false}} else {false};		
				if(_unit distance _source < _distance) then {
					if(!life_istazed && !(_unit getVariable["ACE_captives_isHandcuffed",false])) then {
						if(_isVehicle && _isQuad) then {
							player action ["Eject",vehicle player];
							[_unit,_source] spawn life_fnc_tazed;
						};
						if(!_isVehicle) then {
							[_unit,_source] spawn life_fnc_tazed;
						};
					};
				};
			// };
		};
		if(_projectile in ["fantasma_ammo_556x45_airsoft","fantasma_B_545x39_airsoft","fantasma_B_762x39_airsoft","fantasma_ammo_45ACP_MHP_airsoft","fantasma_B_9x18_57N181S","fantasma_B_9x21_Ball","fantasma_B_45ACP_Ball_Green"] && _curWep in ["rhs_weap_m4_as","rhs_weap_m4a1_blockII_as","rhs_weap_m16a4_as","rhs_weap_ak74m_as","rhs_weap_akm_as","rhs_weap_akms_as","rhsusf_weap_m1911a1_as","rhs_weap_makarov_pmm_as","hgun_Rook40_F_as","hgun_ACPC2_F_as"]) then {
			_damage = 0;
			private["_isVehicle"];
			_isVehicle = if(vehicle player != player) then {true} else {false};
			if(!_isVehicle) then {
				cutText ["Une bille d'airsoft vous touche !!!", "PLAIN"];
				hint "Une bille d'airsoft vous touche !!!";
				[_unit,_source] spawn life_fnc_airsoft;
			};
		};
	};
};

// GM cheats
if(_unit getVariable["gm_cheat",false]) then {
	_damage = 0;
	[[0,format ["Attention %1, Godmode activé",name player]],"life_fnc_broadcast",player,false] call life_fnc_MP;
	// [[1,format ["Attention %1, Godmode activé",name player]],"life_fnc_broadcast",player,false] call life_fnc_MP;
	[[2,format ["Attention %1, Godmode activé",name player]],"life_fnc_broadcast",player,false] call life_fnc_MP;

	if(!isNull _source) then {
		if(_source != _unit) then {
			_source2 = _source;
			if ((_source2 isKindOf "LandVehicle")||(_source2 isKindOf "ship")||(_source2 isKindOf "air")) then {
				if (driver _source2 != _source2) then {
					_source2 = driver _source2;
				};
			};
			if (isPlayer _source2) then {
				[[0,format ["Info : %1, Godmode activé",name player]],"life_fnc_broadcast",_source2,false] call life_fnc_MP;
				// [[1,format ["Info : %1, Godmode activé",name player]],"life_fnc_broadcast",_source2,false] call life_fnc_MP;
				[[2,format ["Info : %1, Godmode activé",name player]],"life_fnc_broadcast",_source2,false] call life_fnc_MP;
			};
		};
	};
};

if((_damage > 0.01) && (_part == "") && (alive _unit) && (!isNull _source) && (_unit != _source)) then {
	[] call life_fnc_getHLC;
	[[_unit,_source,1],"TON_fnc_logdeath",serverhc,false] spawn life_fnc_MP;
};

[] call life_fnc_hudUpdate;
_damage;