/*
	File: fn_setupActions.sqf
	
	Description:
	Master addAction file handler for all client-based actions.
*/
switch (playerSide) do
{
	case west:
	{
		life_actions = life_actions + [player addAction["<t color='#00FFFF'>Conduire en tant que Gendarme</t>",life_fnc_copEnter,"driver",200,false,false,"",'!isNull cursorTarget && ((cursorTarget isKindOf "Car")||(cursorTarget isKindOf "Air")||(cursorTarget isKindOf "Ship")) && (locked cursorTarget) != 0 && cursorTarget distance player < 5']];
		life_actions = life_actions + [player addAction["<t color='#00FFFF'>Monter en tant que Gendarme</t>",life_fnc_copEnter,"passenger",180,false,false,"",'!isNull cursorTarget && ((cursorTarget isKindOf "Car")||(cursorTarget isKindOf "Air")||(cursorTarget isKindOf "Ship")) && (locked cursorTarget) != 0 && cursorTarget distance player < 5']];
		life_actions = life_actions + [player addAction["<t color='#00FFFF'>Commander en tant que Gendarme</t>",life_fnc_copEnter,"commander",180,false,false,"",'!isNull cursorTarget && ((cursorTarget isKindOf "Car")||(cursorTarget isKindOf "Air")||(cursorTarget isKindOf "Ship")) && (locked cursorTarget) != 0 && cursorTarget distance player < 5 && ((cursorTarget isKindOf "C_Offroad_01_F")||(cursorTarget isKindOf "B_MRAP_01_hmg_F")||(cursorTarget isKindOf "I_MRAP_03_F")||(cursorTarget isKindOf "B_APC_Wheeled_01_cannon_F")||(cursorTarget isKindOf "B_Heli_Attack_01_F_RP"))']];
		life_actions = life_actions + [player addAction["Descendre",life_fnc_copEnter,"exit",149,false,false,"",'(vehicle player != player) && (locked(vehicle player)==2)']];
		life_actions = life_actions + [player addAction["Saisir objets",life_fnc_seizeObjects,cursorTarget,0,false,false,"",'((count(nearestObjects [player,["WeaponHolder"],3])>0) || (count(nearestObjects [player,["GroundWeaponHolder"],3])>0) || (count(nearestObjects [player,["WeaponHolderSimulated"],3])>0))']];
		//put in car
		//life_actions = life_actions + [player addAction["<t color='#00FFFF'>Mettre dans le véhicule</t>",life_fnc_putInCar,cursorTarget,200,false,false,"",' !isNull cursorTarget && (player distance cursorTarget) < 6 && speed cursorTarget < 2 && (cursorTarget isKindOf "LandVehicle" || cursorTarget isKindOf "Air" || cursorTarget isKindOf "Ship" || cursorTarget isKindOf "Submarine")']];
		//fast travel
		life_actions = life_actions + [player addAction["<t color='#FFFF33'>Métro</t>",life_fnc_spawnMenu,"",0,false,false,"",'{side _x == west} count playableUnits <= 8 && ((player distance (getMarkerPos "cop_spawn_1") < 30) OR  (player distance (getMarkerPos "cop_spawn_2") < 30) OR (player distance (getMarkerPos "cop_spawn_3") < 30) OR  (player distance (getMarkerPos "cop_spawn_4") < 30) OR  (player distance (getMarkerPos "cop_spawn_5") < 30)) ']];
		// Prendre barrière
		life_actions = life_actions + [player addAction["Prendre barrière",life_fnc_packupmauer,"",0,false,false,"",' _mauer = nearestObjects[getPos player,["RoadBarrier_small_F"],8] select 0; !isNil "_mauer" && !isNil {(_mauer getVariable "item")} && {((_mauer getVariable "item") select 0) == "barriere"}']];
		// Prendre cone
		life_actions = life_actions + [player addAction["Prendre cone",life_fnc_packupcone,"",0,false,false,"",' _cone = nearestObjects[getPos player,["RoadCone_L_F"],8] select 0; !isNil "_cone" && !isNil {(_cone getVariable "item")} && {((_cone getVariable "item") select 0) == "cone"}']];
		// Prendre sac de sable
		life_actions = life_actions + [player addAction["Prendre sacs de sable (droit)",life_fnc_packupsandbag,"",0,false,false,"",' _sandbag = nearestObjects[getPos player,["Land_BagFence_Long_F"],8] select 0; !isNil "_sandbag" && !isNil {(_sandbag getVariable "item")}']];
		life_actions = life_actions + [player addAction["Prendre sacs de sable (arrondis)",life_fnc_packupsandbagr,"",0,false,false,"",' _sandbagr = nearestObjects[getPos player,["Land_BagFence_Round_F"],8] select 0; !isNil "_sandbagr" && !isNil {(_sandbagr getVariable "item")}']];
		life_actions = life_actions + [player addAction["SOS",life_fnc_copSos,"",0,false,false,"",'playerSide == west']];
	};
	case civilian:
	{
		//Drop fishing net
		life_actions = [player addAction[localize "STR_pAct_DropFishingNet",life_fnc_dropFishingNet,"",0,false,false,"",'
		(surfaceisWater (getPos vehicle player)) && (vehicle player isKindOf "Ship") && life_carryWeight < life_maxWeight && speed (vehicle player) < 2 && speed (vehicle player) > -1 && !life_net_dropped ']];
		//Rob person
		life_actions = life_actions + [player addAction[localize "STR_pAct_RobPerson",life_fnc_robAction,"",0,false,false,"",'
		!isNull cursorTarget && player distance cursorTarget < 3.5 && isPlayer cursorTarget && animationState cursorTarget in ["Incapacitated"] && !(cursorTarget getVariable["robbed",FALSE]) ']];
		// !isNull cursorTarget && player distance cursorTarget < 3.5 && isPlayer cursorTarget && animationState cursorTarget in ["Incapacitated","amovpercmstpsnonwnondnon_amovpercmstpssurwnondnon"] && !(cursorTarget getVariable["robbed",FALSE]) ']];
		// Prendre barrière
		life_actions = life_actions + [player addAction["Prendre barrière",life_fnc_packupmauer,"",0,false,false,"",' _mauer = nearestObjects[getPos player,["RoadBarrier_small_F"],8] select 0; !isNil "_mauer" && !isNil {(_mauer getVariable "item")} && {((_mauer getVariable "item") select 0) == "barriere"} && (player getVariable["life_dep",false])']];
		// Prendre cone
		life_actions = life_actions + [player addAction["Prendre cone",life_fnc_packupcone,"",0,false,false,"",' _cone = nearestObjects[getPos player,["RoadCone_L_F"],8] select 0; !isNil "_cone" && !isNil {(_cone getVariable "item")} && {((_cone getVariable "item") select 0) == "cone"} && (player getVariable["life_dep",false])']];
		// Prendre sac de sable
		life_actions = life_actions + [player addAction["Prendre sacs de sable (droit)",life_fnc_packupsandbag,"",0,false,false,"",' _sandbag = nearestObjects[getPos player,["Land_BagFence_Long_F"],8] select 0; !isNil "_sandbag" && !isNil {(_sandbag getVariable "item")}']];
		life_actions = life_actions + [player addAction["Prendre sacs de sable (arrondis)",life_fnc_packupsandbagr,"",0,false,false,"",' _sandbagr = nearestObjects[getPos player,["Land_BagFence_Round_F"],8] select 0; !isNil "_sandbagr" && !isNil {(_sandbagr getVariable "item")}']];
	};
	case independent:
	{
		// Prendre barrière
		life_actions = life_actions + [player addAction["Prendre barrière",life_fnc_packupmauer,"",0,false,false,"",' _mauer = nearestObjects[getPos player,["RoadBarrier_small_F"],8] select 0; !isNil "_mauer" && !isNil {(_mauer getVariable "item")} && {((_mauer getVariable "item") select 0) == "barriere"}']];
		// Prendre cone
		life_actions = life_actions + [player addAction["Prendre cone",life_fnc_packupcone,"",0,false,false,"",' _cone = nearestObjects[getPos player,["RoadCone_L_F"],8] select 0; !isNil "_cone" && !isNil {(_cone getVariable "item")} && {((_cone getVariable "item") select 0) == "cone"}']];
		// Prendre sac de sable
		life_actions = life_actions + [player addAction["Prendre sacs de sable (droit)",life_fnc_packupsandbag,"",0,false,false,"",' _sandbag = nearestObjects[getPos player,["Land_BagFence_Long_F"],8] select 0; !isNil "_sandbag" && !isNil {(_sandbag getVariable "item")}']];
		life_actions = life_actions + [player addAction["Prendre sacs de sable (arrondis)",life_fnc_packupsandbagr,"",0,false,false,"",' _sandbagr = nearestObjects[getPos player,["Land_BagFence_Round_F"],8] select 0; !isNil "_sandbagr" && !isNil {(_sandbagr getVariable "item")}']];
		life_actions = life_actions + [player addAction["SOS",life_fnc_medSos,"",0,false,false,"",'playerSide == independent']];
	};
};

// Pushback pour tous !
//life_actions pushBack (player addAction["<t color='#00FF00'>Nitro</t>",life_fnc_activateNitro,false,2,false,false,"",' (vehicle player != player) && (driver vehicle player == player) && (((vehicle player) getVariable["nitro", 0]) > 0) ']);