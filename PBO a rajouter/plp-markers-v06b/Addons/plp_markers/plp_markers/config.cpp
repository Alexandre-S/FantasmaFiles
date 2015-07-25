////////////////////////////////////////////////////////////////////
//DeRap: Produced from mikero's Dos Tools Dll version 4.97
//Sat Jul 25 20:19:43 2015 : Source 'file' date Sat Jul 25 20:19:43 2015
//http://dev-heaven.net/projects/list_files/mikero-pbodll
////////////////////////////////////////////////////////////////////

#define _ARMA_

//ndefs=13
enum {
	destructengine = 2,
	destructdefault = 6,
	destructwreck = 7,
	destructtree = 3,
	destructtent = 4,
	stabilizedinaxisx = 1,
	stabilizedinaxesxyz = 4,
	stabilizedinaxisy = 2,
	stabilizedinaxesboth = 3,
	destructno = 0,
	stabilizedinaxesnone = 0,
	destructman = 5,
	destructbuilding = 1
};

//Class plp_markers : config.bin{
class CfgPatches
{
	class plp_containers
	{
		requiredAddons[] = {"A3_Data_F"};
		requiredVersion = 0.1;
		units[] = {};
		weapons[] = {};
	};
};
class CfgMarkers
{
	class plp_mark_as_airport
	{
		name = "PLP ASSET Airport A";
		icon = "\plp_markers\icons\plp_mark_as_airport.pac";
		color[] = {1,1,1,1};
		size = 32;
		scope = 2;
		shadow = 1;
	};
	class plp_mark_as_airport2: plp_mark_as_airport
	{
		name = "PLP ASSET Airport B";
		icon = "\plp_markers\icons\plp_mark_as_airport2.pac";
	};
	class plp_mark_as_airradar: plp_mark_as_airport
	{
		name = "PLP ASSET Air Radar";
		icon = "\plp_markers\icons\plp_mark_as_airradar.pac";
	};
	class plp_mark_as_ammunition: plp_mark_as_airport
	{
		name = "PLP ASSET Ammunition";
		icon = "\plp_markers\icons\plp_mark_as_ammunition.pac";
	};
	class plp_mark_as_aacannon: plp_mark_as_airport
	{
		name = "PLP ASSET Anti Air (Cannon)";
		icon = "\plp_markers\icons\plp_mark_as_aacannon.pac";
	};
	class plp_mark_as_aamissile: plp_mark_as_airport
	{
		name = "PLP ASSET Anti Air (Missile)";
		icon = "\plp_markers\icons\plp_mark_as_aamissile.pac";
	};
	class plp_mark_as_artycannon: plp_mark_as_airport
	{
		name = "PLP ASSET Artillery (Cannon)";
		icon = "\plp_markers\icons\plp_mark_as_artycannon.pac";
	};
	class plp_mark_as_artyrocket: plp_mark_as_airport
	{
		name = "PLP ASSET Artillery (Rocket)";
		icon = "\plp_markers\icons\plp_mark_as_artyrocket.pac";
	};
	class plp_mark_as_backpack: plp_mark_as_airport
	{
		name = "PLP ASSET Backpack";
		icon = "\plp_markers\icons\plp_mark_as_backpack.pac";
	};
	class plp_mark_as_bicycle: plp_mark_as_airport
	{
		name = "PLP ASSET Bicycle";
		icon = "\plp_markers\icons\plp_mark_as_bicycle.pac";
	};
	class plp_mark_as_binoculars: plp_mark_as_airport
	{
		name = "PLP ASSET Binoculars";
		icon = "\plp_markers\icons\plp_mark_as_binoculars.pac";
	};
	class plp_mark_as_boat: plp_mark_as_airport
	{
		name = "PLP ASSET Boat";
		icon = "\plp_markers\icons\plp_mark_as_boat.pac";
	};
	class plp_mark_as_building: plp_mark_as_airport
	{
		name = "PLP ASSET Building";
		icon = "\plp_markers\icons\plp_mark_as_building.pac";
	};
	class plp_mark_as_camp: plp_mark_as_airport
	{
		name = "PLP ASSET Camp";
		icon = "\plp_markers\icons\plp_mark_as_camp.pac";
	};
	class plp_mark_as_cross: plp_mark_as_airport
	{
		name = "PLP ASSET Cross";
		icon = "\plp_markers\icons\plp_mark_as_cross.pac";
	};
	class plp_mark_as_canteen: plp_mark_as_airport
	{
		name = "PLP ASSET Canteen";
		icon = "\plp_markers\icons\plp_mark_as_canteen.pac";
	};
	class plp_mark_as_checkpoint: plp_mark_as_airport
	{
		name = "PLP ASSET Checkpoint";
		icon = "\plp_markers\icons\plp_mark_as_checkpoint.pac";
	};
	class plp_mark_as_drinkingwater: plp_mark_as_airport
	{
		name = "PLP ASSET Drinking Water";
		icon = "\plp_markers\icons\plp_mark_as_drinkingwater.pac";
	};
	class plp_mark_as_electronics: plp_mark_as_airport
	{
		name = "PLP ASSET Electronics";
		icon = "\plp_markers\icons\plp_mark_as_electronics.pac";
	};
	class plp_mark_as_explosives: plp_mark_as_airport
	{
		name = "PLP ASSET Explosives";
		icon = "\plp_markers\icons\plp_mark_as_explosives.pac";
	};
	class plp_mark_as_flag: plp_mark_as_airport
	{
		name = "PLP ASSET Flag";
		icon = "\plp_markers\icons\plp_mark_as_flag.pac";
	};
	class plp_mark_as_fuel: plp_mark_as_airport
	{
		name = "PLP ASSET Fuel";
		icon = "\plp_markers\icons\plp_mark_as_fuel.pac";
	};
	class plp_mark_as_handgrenade: plp_mark_as_airport
	{
		name = "PLP ASSET Handgrenade";
		icon = "\plp_markers\icons\plp_mark_as_handgrenade.pac";
	};
	class plp_mark_as_hardpoint: plp_mark_as_airport
	{
		name = "PLP ASSET Hardpoint";
		icon = "\plp_markers\icons\plp_mark_as_hardpoint.pac";
	};
	class plp_mark_as_helicopter: plp_mark_as_airport
	{
		name = "PLP ASSET Helicopter";
		icon = "\plp_markers\icons\plp_mark_as_helicopter.pac";
	};
	class plp_mark_as_house: plp_mark_as_airport
	{
		name = "PLP ASSET House";
		icon = "\plp_markers\icons\plp_mark_as_house.pac";
	};
	class plp_mark_as_industrial: plp_mark_as_airport
	{
		name = "PLP ASSET Industrial";
		icon = "\plp_markers\icons\plp_mark_as_industrial.pac";
	};
	class plp_mark_as_infantry: plp_mark_as_airport
	{
		name = "PLP ASSET Infantry";
		icon = "\plp_markers\icons\plp_mark_as_infantry.pac";
	};
	class plp_mark_as_launcher: plp_mark_as_airport
	{
		name = "PLP ASSET Launcher";
		icon = "\plp_markers\icons\plp_mark_as_launcher.pac";
	};
	class plp_mark_as_machinegun: plp_mark_as_airport
	{
		name = "PLP ASSET Machinegun";
		icon = "\plp_markers\icons\plp_mark_as_machinegun.pac";
	};
	class plp_mark_as_machinegunnest: plp_mark_as_airport
	{
		name = "PLP ASSET Machinegun Nest";
		icon = "\plp_markers\icons\plp_mark_as_machinegunnest.pac";
	};
	class plp_mark_as_maptools: plp_mark_as_airport
	{
		name = "PLP ASSET Map Tools";
		icon = "\plp_markers\icons\plp_mark_as_maptools.pac";
	};
	class plp_mark_as_mortar: plp_mark_as_airport
	{
		name = "PLP ASSET Mortar";
		icon = "\plp_markers\icons\plp_mark_as_mortar.pac";
	};
	class plp_mark_as_motinfantry: plp_mark_as_airport
	{
		name = "PLP ASSET Motorized Inf";
		icon = "\plp_markers\icons\plp_mark_as_motinfantry.pac";
	};
	class plp_mark_as_motorcycle: plp_mark_as_airport
	{
		name = "PLP ASSET Motorcycle";
		icon = "\plp_markers\icons\plp_mark_as_motorcycle.pac";
	};
	class plp_mark_as_pistol: plp_mark_as_airport
	{
		name = "PLP ASSET Pistol";
		icon = "\plp_markers\icons\plp_mark_as_pistol.pac";
	};
	class plp_mark_as_police: plp_mark_as_airport
	{
		name = "PLP ASSET Police";
		icon = "\plp_markers\icons\plp_mark_as_police.pac";
	};
	class plp_mark_as_quad: plp_mark_as_airport
	{
		name = "PLP ASSET Quad";
		icon = "\plp_markers\icons\plp_mark_as_quad.pac";
	};
	class plp_mark_as_radiotower: plp_mark_as_airport
	{
		name = "PLP ASSET Radiotower";
		icon = "\plp_markers\icons\plp_mark_as_radiotower.pac";
	};
	class plp_mark_as_repairs: plp_mark_as_airport
	{
		name = "PLP ASSET Repairs";
		icon = "\plp_markers\icons\plp_mark_as_repairs.pac";
	};
	class plp_mark_as_rifle: plp_mark_as_airport
	{
		name = "PLP ASSET Rifle";
		icon = "\plp_markers\icons\plp_mark_as_rifle.pac";
	};
	class plp_mark_as_shotgun: plp_mark_as_airport
	{
		name = "PLP ASSET Shotgun";
		icon = "\plp_markers\icons\plp_mark_as_shotgun.pac";
	};
	class plp_mark_as_sniperrifle: plp_mark_as_airport
	{
		name = "PLP ASSET Sniper Rifle";
		icon = "\plp_markers\icons\plp_mark_as_sniperrifle.pac";
	};
	class plp_mark_as_specialforces: plp_mark_as_airport
	{
		name = "PLP ASSET Special Forces";
		icon = "\plp_markers\icons\plp_mark_as_specialforces.pac";
	};
	class plp_mark_as_storage: plp_mark_as_airport
	{
		name = "PLP ASSET Storage";
		icon = "\plp_markers\icons\plp_mark_as_storage.pac";
	};
	class plp_mark_as_submachinegun: plp_mark_as_airport
	{
		name = "PLP ASSET Submachinegun";
		icon = "\plp_markers\icons\plp_mark_as_submachinegun.pac";
	};
	class plp_mark_as_tank: plp_mark_as_airport
	{
		name = "PLP ASSET Tank";
		icon = "\plp_markers\icons\plp_mark_as_tank.pac";
	};
	class plp_mark_as_truck: plp_mark_as_airport
	{
		name = "PLP ASSET Truck";
		icon = "\plp_markers\icons\plp_mark_as_truck.pac";
	};
	class plp_mark_as_vehicle: plp_mark_as_airport
	{
		name = "PLP ASSET Vehicle";
		icon = "\plp_markers\icons\plp_mark_as_vehicle.pac";
	};
	class plp_mark_as_voltage: plp_mark_as_airport
	{
		name = "PLP ASSET Voltage";
		icon = "\plp_markers\icons\plp_mark_as_voltage.pac";
	};
	class plp_mark_as_watchtower: plp_mark_as_airport
	{
		name = "PLP ASSET Watchtower";
		icon = "\plp_markers\icons\plp_mark_as_watchtower.pac";
	};
	class plp_mark_civ_animals
	{
		name = "PLP CIVIL Animals";
		icon = "\plp_markers\icons\plp_mark_civ_animals.pac";
		color[] = {1,1,1,1};
		size = 32;
		scope = 2;
		shadow = 1;
	};
	class plp_mark_civ_beach: plp_mark_civ_animals
	{
		name = "PLP CIVIL Beach";
		icon = "\plp_markers\icons\plp_mark_civ_beach.pac";
	};
	class plp_mark_civ_bed: plp_mark_civ_animals
	{
		name = "PLP CIVIL Bed";
		icon = "\plp_markers\icons\plp_mark_civ_bed.pac";
	};
	class plp_mark_civ_bridge: plp_mark_civ_animals
	{
		name = "PLP CIVIL Bridge";
		icon = "\plp_markers\icons\plp_mark_civ_bridge.pac";
	};
	class plp_mark_civ_bus: plp_mark_civ_animals
	{
		name = "PLP CIVIL Bus";
		icon = "\plp_markers\icons\plp_mark_civ_bus.pac";
	};
	class plp_mark_civ_carWorkshop: plp_mark_civ_animals
	{
		name = "PLP CIVIL Car Workshop";
		icon = "\plp_markers\icons\plp_mark_civ_carWorkshop.pac";
	};
	class plp_mark_civ_campingsite: plp_mark_civ_animals
	{
		name = "PLP CIVIL Camping Site";
		icon = "\plp_markers\icons\plp_mark_civ_campingsite.pac";
	};
	class plp_mark_civ_church: plp_mark_civ_animals
	{
		name = "PLP CIVIL Church";
		icon = "\plp_markers\icons\plp_mark_civ_church.pac";
	};
	class plp_mark_civ_commercialzone: plp_mark_civ_animals
	{
		name = "PLP CIVIL Commercial Zone";
		icon = "\plp_markers\icons\plp_mark_civ_commercialzone.pac";
	};
	class plp_mark_civ_coffee: plp_mark_civ_animals
	{
		name = "PLP CIVIL Coffee";
		icon = "\plp_markers\icons\plp_mark_civ_coffee.pac";
	};
	class plp_mark_civ_firedepartment: plp_mark_civ_animals
	{
		name = "PLP CIVIL Fire department";
		icon = "\plp_markers\icons\plp_mark_civ_firedepartment.pac";
	};
	class plp_mark_civ_food: plp_mark_civ_animals
	{
		name = "PLP CIVIL Food";
		icon = "\plp_markers\icons\plp_mark_civ_food.pac";
	};
	class plp_mark_civ_fuelstation: plp_mark_civ_animals
	{
		name = "PLP CIVIL Fuel Station";
		icon = "\plp_markers\icons\plp_mark_civ_fuelstation.pac";
	};
	class plp_mark_civ_harbor: plp_mark_civ_animals
	{
		name = "PLP CIVIL Harbor";
		icon = "\plp_markers\icons\plp_mark_civ_harbor.pac";
	};
	class plp_mark_civ_hikingtrail: plp_mark_civ_animals
	{
		name = "PLP CIVIL Hiking Trail";
		icon = "\plp_markers\icons\plp_mark_civ_hikingtrail.pac";
	};
	class plp_mark_civ_hospitalA: plp_mark_civ_animals
	{
		name = "PLP CIVIL Hospital A";
		icon = "\plp_markers\icons\plp_mark_civ_hospitalA.pac";
	};
	class plp_mark_civ_hospitalB: plp_mark_civ_animals
	{
		name = "PLP CIVIL Hospital B";
		icon = "\plp_markers\icons\plp_mark_civ_hospitalB.pac";
	};
	class plp_mark_civ_industrial: plp_mark_civ_animals
	{
		name = "PLP CIVIL Industrial";
		icon = "\plp_markers\icons\plp_mark_civ_industrial.pac";
	};
	class plp_mark_civ_information: plp_mark_civ_animals
	{
		name = "PLP CIVIL Information";
		icon = "\plp_markers\icons\plp_mark_civ_information.pac";
	};
	class plp_mark_civ_lake: plp_mark_civ_animals
	{
		name = "PLP CIVIL Lake";
		icon = "\plp_markers\icons\plp_mark_civ_lake.pac";
	};
	class plp_mark_civ_mobilehome: plp_mark_civ_animals
	{
		name = "PLP CIVIL Mobile Home";
		icon = "\plp_markers\icons\plp_mark_civ_mobilehome.pac";
	};
	class plp_mark_civ_mountain: plp_mark_civ_animals
	{
		name = "PLP CIVIL Mountain";
		icon = "\plp_markers\icons\plp_mark_civ_mountain.pac";
	};
	class plp_mark_civ_motorwayA: plp_mark_civ_animals
	{
		name = "PLP CIVIL Motorway A";
		icon = "\plp_markers\icons\plp_mark_civ_motorwayA.pac";
	};
	class plp_mark_civ_motorwayB: plp_mark_civ_animals
	{
		name = "PLP CIVIL Motorway B";
		icon = "\plp_markers\icons\plp_mark_civ_motorwayB.pac";
	};
	class plp_mark_civ_naturereserve: plp_mark_civ_animals
	{
		name = "PLP CIVIL Nature Reserve";
		icon = "\plp_markers\icons\plp_mark_civ_naturereserve.pac";
	};
	class plp_mark_civ_parkinglot: plp_mark_civ_animals
	{
		name = "PLP CIVIL Parking Lot";
		icon = "\plp_markers\icons\plp_mark_civ_parkinglot.pac";
	};
	class plp_mark_civ_parkinglotroofed: plp_mark_civ_animals
	{
		name = "PLP CIVIL Parking Lot (Roofed)";
		icon = "\plp_markers\icons\plp_mark_civ_parkinglotroofed.pac";
	};
	class plp_mark_civ_radarcontrol: plp_mark_civ_animals
	{
		name = "PLP CIVIL Radar Control";
		icon = "\plp_markers\icons\plp_mark_civ_radarcontrol.pac";
	};
	class plp_mark_civ_roadworks: plp_mark_civ_animals
	{
		name = "PLP CIVIL Road works";
		icon = "\plp_markers\icons\plp_mark_civ_roadworks.pac";
	};
	class plp_mark_civ_ruins: plp_mark_civ_animals
	{
		name = "PLP CIVIL Ruins";
		icon = "\plp_markers\icons\plp_mark_civ_ruins.pac";
	};
	class plp_mark_civ_shoppingcart: plp_mark_civ_animals
	{
		name = "PLP CIVIL Shopping Cart";
		icon = "\plp_markers\icons\plp_mark_civ_shoppingcart.pac";
	};
	class plp_mark_civ_taxi: plp_mark_civ_animals
	{
		name = "PLP CIVIL Taxi";
		icon = "\plp_markers\icons\plp_mark_civ_taxi.pac";
	};
	class plp_mark_civ_telephone: plp_mark_civ_animals
	{
		name = "PLP CIVIL Telephone";
		icon = "\plp_markers\icons\plp_mark_civ_telephone.pac";
	};
	class plp_mark_civ_toilets: plp_mark_civ_animals
	{
		name = "PLP CIVIL Toilets";
		icon = "\plp_markers\icons\plp_mark_civ_toilets.pac";
	};
	class plp_mark_civ_train: plp_mark_civ_animals
	{
		name = "PLP CIVIL Train";
		icon = "\plp_markers\icons\plp_mark_civ_train.pac";
	};
	class plp_mark_civ_tree: plp_mark_civ_animals
	{
		name = "PLP CIVIL Tree";
		icon = "\plp_markers\icons\plp_mark_civ_tree.pac";
	};
	class plp_mark_civ_viewpoint: plp_mark_civ_animals
	{
		name = "PLP CIVIL Viewpoint";
		icon = "\plp_markers\icons\plp_mark_civ_viewpoint.pac";
	};
};
//};
