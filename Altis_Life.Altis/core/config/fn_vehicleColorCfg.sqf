/*
	File: fn_vehicleColorCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration for vehicle colors.
*/
private["_vehicle","_ret","_path"];
_vehicle = [_this,0,"",[""]] call BIS_fnc_param;
if(_vehicle == "") exitWith {[]};
_ret = [];

switch (_vehicle) do
{
	case "I_Heli_Transport_02_F":
	{
		_path = "\a3\air_f_beta\Heli_Transport_02\Data\Skins\";
		_ret =
		[
			[_path + "heli_transport_02_1_ion_co.paa","civ",_path + "heli_transport_02_2_ion_co.paa",_path + "heli_transport_02_3_ion_co.paa"],
			[_path + "heli_transport_02_1_dahoman_co.paa","civ",_path + "heli_transport_02_2_dahoman_co.paa",_path + "heli_transport_02_3_dahoman_co.paa"],
			["altisrpfr\texture\mohawk_dep_hull.paa","med","altisrpfr\texture\mohawk_dep_back_hull.paa","altisrpfr\texture\mohawk_dep_rotor.paa"]
		];
	};
	
	case "C_Hatchback_01_sport_F":
	{
		_path = "\a3\soft_f_gamma\Hatchback_01\data\";
		_ret =
		[
			[_path + "hatchback_01_ext_sport01_co.paa","civ"],
			[_path + "hatchback_01_ext_sport02_co.paa","civ"],
			[_path + "hatchback_01_ext_sport03_co.paa","civ"],
			[_path + "hatchback_01_ext_sport04_co.paa","civ"],
			[_path + "hatchback_01_ext_sport05_co.paa","civ"],
			[_path + "hatchback_01_ext_sport06_co.paa","civ"],
			["#(ai,64,64,1)Fresnel(1.3,7)","cop"],
			[_path + "hatchback_01_ext_sport01_co.paa","cop"],
			[_path + "hatchback_01_ext_sport02_co.paa","cop"],
			[_path + "hatchback_01_ext_sport03_co.paa","cop"],
			[_path + "hatchback_01_ext_sport04_co.paa","cop"],
			[_path + "hatchback_01_ext_sport05_co.paa","cop"],
			[_path + "hatchback_01_ext_sport06_co.paa","cop"],
			["altisrpfr\textures\hsport_kblock.paa","civ"],
			["altisrpfr\textures\hsport_redgull.paa","civ"],
			["altisrpfr\textures\hsport_kblock.paa","cop"],
			["altisrpfr\textures\hsport_redgull.paa","cop"],
			["altisrpfr\textures\Hayon_sport_medic.paa","med"]
		];
	};
		
	case "C_Offroad_01_F":
	{
		_ret = 
		[
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa", "civ"], 
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE01_CO.paa", "civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE02_CO.paa", "civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE03_CO.paa","civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE04_CO.paa","civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE05_CO.paa","civ"],
			["#(ai,64,64,1)Fresnel(0.3,3)","cop"],
			["#(ai,64,64,1)Fresnel(1.3,7)","cop"],
			["altisrpfr\textures\med_offroad.paa","med"],
			["altisrpfr\textures\offroad_rouille.paa","civ"],
			["altisrpfr\texture\offroad_depannage.paa","med"]
		];
	};
	
	case "C_Hatchback_01_F":
	{
		_ret =
		[
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base01_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base02_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base03_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base04_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base06_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base07_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base08_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base09_co.paa","civ"]
		];
	};
	
	case "RDS_Gaz24_Civ_01":
	{
		_ret =
		[
			["\rds_a2port_civ\volha\Data\Volha_ECIV_CO.paa","civ"],
			["\rds_a2port_civ\volha\Data\Volha_Gray_ECIV_CO.paa","civ"],
			["\rds_a2port_civ\volha\Data\Volha_Black_ECIV_CO.paa","civ"]
		];
	};
	
	case "RDS_Ikarus_Civ_01":
	{
		_ret =
		[
			["\rds_a2port_civ\Ikarus\data\bus_exterior_eciv_co","civ"],
			["\rds_a2port_civ\Ikarus\data\bus_exterior_co.paa","civ"]
		];
	};
	
	case "RDS_S1203_Civ_01":
	{
		_ret =
		[
			["\rds_a2port_civ\S1203\data\s1203_co.paa","civ"],
			["\rds_a2port_civ\s1203\Data\s1203_red_CO.paa","civ"],
			["\rds_a2port_civ\s1203\Data\s1203_silver_CO.paa","civ"],
			["\rds_a2port_civ\s1203\Data\s1203_orange_CO.paa","civ"],
			["\rds_a2port_civ\s1203\Data\s1203_white_CO.paa","civ"],
			["\rds_a2port_civ\s1203\Data\s1203_green_CO.paa""civ"]
		];
	};
	
	case "RDS_Lada_Civ_01":
	{
		_ret =
		[
			["\rds_a2port_civ\Lada\Data\lada_white_co.paa","civ"],
			["\rds_a2port_civ\Lada\Data\Lada_red_CO.paa","civ"],
			["\rds_a2port_civ\Lada\Data\lada_eciv1_co.paa","civ","\rds_a2port_civ\Lada\Data\Lada_glass_ECIV1_CA.paa"],
			["\rds_a2port_civ\Lada\Data\lada_eciv2_co.paa","civ","\rds_a2port_civ\Lada\Data\Lada_glass_ECIV2_CA.paa"]
		];
	};
	
	case "RDS_Golf4_Civ_01":
	{
		_ret =
		[
			["\rds_a2port_civ\VWGOLF\Data\vwgolf_body_co.paa","civ"],
			["\rds_a2port_civ\VWGOLF\Data\vwgolf_body_black_CO.paa","civ"],
			["\rds_a2port_civ\VWGOLF\Data\vwgolf_body_yellow_CO.paa","civ"],
			["\rds_a2port_civ\VWGOLF\Data\vwgolf_body_blue_CO.paa","civ"],
			["\rds_a2port_civ\VWGOLF\Data\vwgolf_body_white_CO.paa","civ"],
			["\rds_a2port_civ\VWGOLF\Data\vwgolf_body_green_CO.paa","civ"]
		];
	};
	
	case "C_SUV_01_F":
	{
		_ret =
		[
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_co.paa","civ"],
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_02_co.paa","civ"],
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_03_co.paa","civ"],
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_04_co.paa","civ"],
			["#(ai,64,64,1)Fresnel(1.3,7)","cop"],
			["altisrpfr\textures\suv_bleuflamme.paa","civ"],
			["altisrpfr\textures\suv_leopard.paa","civ"],
			["altisrpfr\textures\suv_rouille.paa","civ"]
		];
	};
	
	case "C_Van_01_box_F":
	{
		_ret = 
		[
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa","civ"],
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa","civ"],
			["\plp_truckColors\van_front\van_01_ext_blue_CO.paa","civ","\plp_truckColors\van_box\van_01_adds_blue_CO.paa"],
			["\plp_truckColors\van_front\van_01_ext_darkblue_CO.paa","civ","\plp_truckColors\van_box\van_01_adds_white_CO.paa"],
			["\plp_truckColors\van_front\van_01_ext_darkgreen_CO.paa","civ","\plp_truckColors\van_box\van_01_adds_green_CO.paa"],
			["\plp_truckColors\van_front\van_01_ext_lightgreen_CO.paa","civ","\plp_truckColors\van_box\van_01_adds_white_CO.paa"],
			["\plp_truckColors\van_front\van_01_ext_lightyellow_CO.paa","civ","\plp_truckColors\van_box\van_01_adds_yellow_CO.paa"],
			["\plp_truckColors\van_front\van_01_ext_orange_CO.paa","civ","\plp_truckColors\van_box\van_01_adds_yellow_CO.paa"],
			["\plp_truckColors\van_front\van_01_ext_grey_CO.paa","civ","\plp_truckColors\van_box\van_01_adds_white_CO.paa"],
			["\plp_truckColors\van_front\van_01_ext_black_CO.paa","civ","\plp_truckColors\van_box\van_01_adds_black_CO.paa"]
		];
	};
	
	case "C_Van_01_transport_F":
	{
		_ret = 
		[
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa","civ"],
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa","civ"],
			["\plp_truckColors\van_front\van_01_ext_blue_CO.paa","civ"],
			["\plp_truckColors\van_front\van_01_ext_darkblue_CO.paa","civ"],
			["\plp_truckColors\van_front\van_01_ext_darkgreen_CO.paa","civ"],
			["\plp_truckColors\van_front\van_01_ext_lightgreen_CO.paa","civ"],
			["\plp_truckColors\van_front\van_01_ext_lightyellow_CO.paa","civ"],
			["\plp_truckColors\van_front\van_01_ext_orange_CO.paa","civ"],
			["\plp_truckColors\van_front\van_01_ext_grey_CO.paa","civ"],
			["\plp_truckColors\van_front\van_01_ext_black_CO.paa","civ"]
		];
	};
	
	case "B_Quadbike_01_F":
	{
		_ret = 
		[
			["\A3\Soft_F\Quadbike_01\Data\Quadbike_01_co.paa","cop"],
			["\A3\Soft_F\Quadbike_01\Data\quadbike_01_opfor_co.paa","reb"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_black_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_blue_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_red_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_white_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_indp_co.paa","civ"],
			["\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa","civ"],
			["\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa","reb"]
		];
	};
	
	case "B_Heli_Light_01_F":
	{
		_ret = 
		[
			["altisrpfr\textures\heli_police_light.paa","cop"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_ion_co.paa","cop"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_blue_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_indp_co.paa","donate"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_blueline_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_elliptical_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_furious_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_jeans_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_speedy_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sunset_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_vrana_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa","reb"],
			["altisrpfr\textures\heli_medic_light.paa","med"]
		];
	};
	
	case "C_Heli_Light_01_civil_F":
	{
		_ret = 
		[
			["altisrpfr\textures\heli_police_light.paa","cop"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_ion_co.paa","cop"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_blue_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_indp_co.paa","donate"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_blueline_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_elliptical_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_furious_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_jeans_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_speedy_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sunset_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_vrana_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa","reb"],
			["altisrpfr\textures\heli_medic_light.paa","med"]
		];
	};
	
	case "O_Heli_Light_02_unarmed_F":
	{
		_ret = 
		[
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_co.paa","cop"],
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_civilian_co.paa","civ"],
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_indp_co.paa","donate"],
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_opfor_co.paa","reb"],
			["altisrpfr\textures\orca_croix_rouge.paa","med"]
		];
	};
	
	case "B_MRAP_01_F":
	{
		_ret = 
		[
			["\A3\Soft_F\MRAP_01\Data\mrap_01_base_co.paa","cop"],
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","cop"]
		];
	};
	
	case "B_Truck_01_mover_F":
	{
		_ret = 
		[
			["altisrpfr\texture\CIV_Depann_hemtt.paa","med"]
		];
	};
	
	case "I_Truck_02_covered_F":
	{
		_ret = 
		[
			["\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa","civ","\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"],
			
			["altisrpfr\textures\zamak_cabine_diffu_blanc.paa","civ","altisrpfr\textures\zamak_bache_beige.paa"],
			["altisrpfr\textures\zamak_cabine_diffu_blanc.paa","civ","altisrpfr\textures\zamak_bache_blanc.paa"],
			["altisrpfr\textures\zamak_cabine_diffu_blanc.paa","civ","altisrpfr\textures\zamak_bache_bleu.paa"],
			["altisrpfr\textures\zamak_cabine_diffu_blanc.paa","civ","altisrpfr\textures\zamak_bache_bleuclair.paa"],
			["altisrpfr\textures\zamak_cabine_diffu_blanc.paa","civ","altisrpfr\textures\zamak_bache_gris.paa"],
			["altisrpfr\textures\zamak_cabine_diffu_blanc.paa","civ","altisrpfr\textures\zamak_bache_jaune.paa"],
			["altisrpfr\textures\zamak_cabine_diffu_blanc.paa","civ","altisrpfr\textures\zamak_bache_jauneclair.paa"],
			["altisrpfr\textures\zamak_cabine_diffu_blanc.paa","civ","altisrpfr\textures\zamak_bache_orange.paa"],
			["altisrpfr\textures\zamak_cabine_diffu_blanc.paa","civ","altisrpfr\textures\zamak_bache_rouge.paa"],
			["altisrpfr\textures\zamak_cabine_diffu_blanc.paa","civ","altisrpfr\textures\zamak_bache_vert.paa"],
			["altisrpfr\textures\zamak_cabine_diffu_blanc.paa","civ","altisrpfr\textures\zamak_bache_violet.paa"],
			
			["altisrpfr\textures\zamak_cabine_diffu_jauneclair.paa","civ","altisrpfr\textures\zamak_bache_beige.paa"],
			["altisrpfr\textures\zamak_cabine_diffu_jauneclair.paa","civ","altisrpfr\textures\zamak_bache_blanc.paa"],
			["altisrpfr\textures\zamak_cabine_diffu_jauneclair.paa","civ","altisrpfr\textures\zamak_bache_bleu.paa"],
			["altisrpfr\textures\zamak_cabine_diffu_jauneclair.paa","civ","altisrpfr\textures\zamak_bache_bleuclair.paa"],
			["altisrpfr\textures\zamak_cabine_diffu_jauneclair.paa","civ","altisrpfr\textures\zamak_bache_gris.paa"],
			["altisrpfr\textures\zamak_cabine_diffu_jauneclair.paa","civ","altisrpfr\textures\zamak_bache_jaune.paa"],
			["altisrpfr\textures\zamak_cabine_diffu_jauneclair.paa","civ","altisrpfr\textures\zamak_bache_jauneclair.paa"],
			["altisrpfr\textures\zamak_cabine_diffu_jauneclair.paa","civ","altisrpfr\textures\zamak_bache_orange.paa"],
			["altisrpfr\textures\zamak_cabine_diffu_jauneclair.paa","civ","altisrpfr\textures\zamak_bache_rouge.paa"],
			["altisrpfr\textures\zamak_cabine_diffu_jauneclair.paa","civ","altisrpfr\textures\zamak_bache_vert.paa"],
			["altisrpfr\textures\zamak_cabine_diffu_jauneclair.paa","civ","altisrpfr\textures\zamak_bache_violet.paa"],
			
			["altisrpfr\textures\zamak_cabine_diffu_jaune.paa","civ","altisrpfr\textures\zamak_bache_beige.paa"],
			["altisrpfr\textures\zamak_cabine_diffu_jaune.paa","civ","altisrpfr\textures\zamak_bache_blanc.paa"],
			["altisrpfr\textures\zamak_cabine_diffu_jaune.paa","civ","altisrpfr\textures\zamak_bache_bleu.paa"],
			["altisrpfr\textures\zamak_cabine_diffu_jaune.paa","civ","altisrpfr\textures\zamak_bache_bleuclair.paa"],
			["altisrpfr\textures\zamak_cabine_diffu_jaune.paa","civ","altisrpfr\textures\zamak_bache_gris.paa"],
			["altisrpfr\textures\zamak_cabine_diffu_jaune.paa","civ","altisrpfr\textures\zamak_bache_jaune.paa"],
			["altisrpfr\textures\zamak_cabine_diffu_jaune.paa","civ","altisrpfr\textures\zamak_bache_jauneclair.paa"],
			["altisrpfr\textures\zamak_cabine_diffu_jaune.paa","civ","altisrpfr\textures\zamak_bache_orange.paa"],
			["altisrpfr\textures\zamak_cabine_diffu_jaune.paa","civ","altisrpfr\textures\zamak_bache_rouge.paa"],
			["altisrpfr\textures\zamak_cabine_diffu_jaune.paa","civ","altisrpfr\textures\zamak_bache_vert.paa"],
			["altisrpfr\textures\zamak_cabine_diffu_jaune.paa","civ","altisrpfr\textures\zamak_bache_violet.paa"],
			
			["altisrpfr\textures\zamak_cabine_diffu_rougeuse.paa","civ","altisrpfr\textures\zamak_bache_beige.paa"],
			["altisrpfr\textures\zamak_cabine_diffu_rougeuse.paa","civ","altisrpfr\textures\zamak_bache_blanc.paa"],
			["altisrpfr\textures\zamak_cabine_diffu_rougeuse.paa","civ","altisrpfr\textures\zamak_bache_bleu.paa"],
			["altisrpfr\textures\zamak_cabine_diffu_rougeuse.paa","civ","altisrpfr\textures\zamak_bache_bleuclair.paa"],
			["altisrpfr\textures\zamak_cabine_diffu_rougeuse.paa","civ","altisrpfr\textures\zamak_bache_gris.paa"],
			["altisrpfr\textures\zamak_cabine_diffu_rougeuse.paa","civ","altisrpfr\textures\zamak_bache_jaune.paa"],
			["altisrpfr\textures\zamak_cabine_diffu_rougeuse.paa","civ","altisrpfr\textures\zamak_bache_jauneclair.paa"],
			["altisrpfr\textures\zamak_cabine_diffu_rougeuse.paa","civ","altisrpfr\textures\zamak_bache_orange.paa"],
			["altisrpfr\textures\zamak_cabine_diffu_rougeuse.paa","civ","altisrpfr\textures\zamak_bache_rouge.paa"],
			["altisrpfr\textures\zamak_cabine_diffu_rougeuse.paa","civ","altisrpfr\textures\zamak_bache_vert.paa"],
			["altisrpfr\textures\zamak_cabine_diffu_rougeuse.paa","civ","altisrpfr\textures\zamak_bache_violet.paa"],
			
			["altisrpfr\textures\zamak_cabine_diffu_rougefonce.paa","civ","altisrpfr\textures\zamak_bache_beige.paa"],
			["altisrpfr\textures\zamak_cabine_diffu_rougefonce.paa","civ","altisrpfr\textures\zamak_bache_blanc.paa"],
			["altisrpfr\textures\zamak_cabine_diffu_rougefonce.paa","civ","altisrpfr\textures\zamak_bache_bleu.paa"],
			["altisrpfr\textures\zamak_cabine_diffu_rougefonce.paa","civ","altisrpfr\textures\zamak_bache_bleuclair.paa"],
			["altisrpfr\textures\zamak_cabine_diffu_rougefonce.paa","civ","altisrpfr\textures\zamak_bache_gris.paa"],
			["altisrpfr\textures\zamak_cabine_diffu_rougefonce.paa","civ","altisrpfr\textures\zamak_bache_jaune.paa"],
			["altisrpfr\textures\zamak_cabine_diffu_rougefonce.paa","civ","altisrpfr\textures\zamak_bache_jauneclair.paa"],
			["altisrpfr\textures\zamak_cabine_diffu_rougefonce.paa","civ","altisrpfr\textures\zamak_bache_orange.paa"],
			["altisrpfr\textures\zamak_cabine_diffu_rougefonce.paa","civ","altisrpfr\textures\zamak_bache_rouge.paa"],
			["altisrpfr\textures\zamak_cabine_diffu_rougefonce.paa","civ","altisrpfr\textures\zamak_bache_vert.paa"],
			["altisrpfr\textures\zamak_cabine_diffu_rougefonce.paa","civ","altisrpfr\textures\zamak_bache_violet.paa"],
			
			["altisrpfr\textures\zamak_cabine_diffu_vertkaki.paa","civ","altisrpfr\textures\zamak_bache_beige.paa"],
			["altisrpfr\textures\zamak_cabine_diffu_vertkaki.paa","civ","altisrpfr\textures\zamak_bache_blanc.paa"],
			["altisrpfr\textures\zamak_cabine_diffu_vertkaki.paa","civ","altisrpfr\textures\zamak_bache_bleu.paa"],
			["altisrpfr\textures\zamak_cabine_diffu_vertkaki.paa","civ","altisrpfr\textures\zamak_bache_bleuclair.paa"],
			["altisrpfr\textures\zamak_cabine_diffu_vertkaki.paa","civ","altisrpfr\textures\zamak_bache_gris.paa"],
			["altisrpfr\textures\zamak_cabine_diffu_vertkaki.paa","civ","altisrpfr\textures\zamak_bache_jaune.paa"],
			["altisrpfr\textures\zamak_cabine_diffu_vertkaki.paa","civ","altisrpfr\textures\zamak_bache_jauneclair.paa"],
			["altisrpfr\textures\zamak_cabine_diffu_vertkaki.paa","civ","altisrpfr\textures\zamak_bache_orange.paa"],
			["altisrpfr\textures\zamak_cabine_diffu_vertkaki.paa","civ","altisrpfr\textures\zamak_bache_rouge.paa"],
			["altisrpfr\textures\zamak_cabine_diffu_vertkaki.paa","civ","altisrpfr\textures\zamak_bache_vert.paa"],
			["altisrpfr\textures\zamak_cabine_diffu_vertkaki.paa","civ","altisrpfr\textures\zamak_bache_violet.paa"],
			
			["altisrpfr\textures\zamak_cabine_diffu_violet.paa","civ","altisrpfr\textures\zamak_bache_beige.paa"],
			["altisrpfr\textures\zamak_cabine_diffu_violet.paa","civ","altisrpfr\textures\zamak_bache_blanc.paa"],
			["altisrpfr\textures\zamak_cabine_diffu_violet.paa","civ","altisrpfr\textures\zamak_bache_bleu.paa"],
			["altisrpfr\textures\zamak_cabine_diffu_violet.paa","civ","altisrpfr\textures\zamak_bache_bleuclair.paa"],
			["altisrpfr\textures\zamak_cabine_diffu_violet.paa","civ","altisrpfr\textures\zamak_bache_gris.paa"],
			["altisrpfr\textures\zamak_cabine_diffu_violet.paa","civ","altisrpfr\textures\zamak_bache_jaune.paa"],
			["altisrpfr\textures\zamak_cabine_diffu_violet.paa","civ","altisrpfr\textures\zamak_bache_jauneclair.paa"],
			["altisrpfr\textures\zamak_cabine_diffu_violet.paa","civ","altisrpfr\textures\zamak_bache_orange.paa"],
			["altisrpfr\textures\zamak_cabine_diffu_violet.paa","civ","altisrpfr\textures\zamak_bache_rouge.paa"],
			["altisrpfr\textures\zamak_cabine_diffu_violet.paa","civ","altisrpfr\textures\zamak_bache_vert.paa"],
			["altisrpfr\textures\zamak_cabine_diffu_violet.paa","civ","altisrpfr\textures\zamak_bache_violet.paa"],
			
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","cop"]
		];
	};
	
	case "I_Truck_02_transport_F":
	{
		_ret = 
		[
			["\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa","civ","\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"],
			["altisrpfr\textures\zamak_cabine_diffu_blanc.paa","civ","altisrpfr\textures\zamak_bache_blanc.paa"],
			["altisrpfr\textures\zamak_cabine_diffu_jauneclair.paa","civ","altisrpfr\textures\zamak_bache_jauneclair.paa"],
			["altisrpfr\textures\zamak_cabine_diffu_jaune.paa","civ","altisrpfr\textures\zamak_bache_jaune.paa"],
			["altisrpfr\textures\zamak_cabine_diffu_rougeuse.paa","civ","altisrpfr\textures\zamak_bache_rouge.paa"],
			["altisrpfr\textures\zamak_cabine_diffu_rougefonce.paa","civ","altisrpfr\textures\zamak_bache_rouge.paa"],
			["altisrpfr\textures\zamak_cabine_diffu_vertkaki.paa","civ","altisrpfr\textures\zamak_bache_vert.paa"],
			["altisrpfr\textures\zamak_cabine_diffu_violet.paa","civ","altisrpfr\textures\zamak_bache_violet.paa"],
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","cop"]
		];
	};
	
	case "B_APC_Wheeled_01_cannon_F":
	{
		_ret = 
		[
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","cop"]
		];
	};
	
	case "I_Heli_light_03_unarmed_F":
	{
		_ret = 
		[
			["altisrpfr\textures\hellcat.paa","civ"],
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","cop"],
			["\A3\air_f_epb\Heli_Light_03\data\heli_light_03_base_co.paa","cop"]
		];
	};
	
	case "O_Heli_Attack_02_black_F":
	{
		_ret = 
		[
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","cop"]
		];
	};
	
	case "bwi_a3_t6a_7":
	{
		_ret = 
		[
			["bwi_a3_t6\tex\beech\t6_1_t.paa","civ","bwi_a3_t6\tex\beech\t6_2_t.paa", "bwi_a3_t6\tex\beech\t6_3_t.paa", "bwi_a3_t6\tex\beech\t6_4_t.paa"],
			["bwi_a3_t6\tex\usaf\t6_1_t.paa","civ","bwi_a3_t6\tex\usaf\t6_2_t.paa","bwi_a3_t6\tex\usaf\t6_3_t.paa","bwi_a3_t6\tex\usaf\t6_4_t.paa"],
			["bwi_a3_t6\tex\usn\t6_1_t.paa","civ","bwi_a3_t6\tex\usn\t6_2_t.paa","bwi_a3_t6\tex\usn\t6_3_t.paa","bwi_a3_t6\tex\usn\t6_4_t.paa"],
			["bwi_a3_t6\tex\usaf_1\t6_1_t.paa","civ","bwi_a3_t6\tex\usaf_1\t6_2_t.paa","bwi_a3_t6\tex\usaf_1\t6_3_t.paa","bwi_a3_t6\tex\usaf_1\t6_4_t.paa"],
			["bwi_a3_t6\tex\usn_1\t6_1_t.paa","civ","bwi_a3_t6\tex\usn_1\t6_2_t.paa","bwi_a3_t6\tex\usn_1\t6_3_t.paa","bwi_a3_t6\tex\usn_1\t6_4_t.paa"],
			["bwi_a3_t6\tex\iraq\t6_1_t.paa","civ","bwi_a3_t6\tex\iraq\t6_2_t.paa","bwi_a3_t6\tex\iraq\t6_3_t.paa","bwi_a3_t6\tex\iraq\t6_4_t.paa"],
			["bwi_a3_t6\tex\greek\t6_1_t.paa","civ","bwi_a3_t6\tex\greek\t6_2_t.paa","bwi_a3_t6\tex\greek\t6_3_t.paa","bwi_a3_t6\tex\greek\t6_4_t.paa"],
			["bwi_a3_t6\tex\canada\t6_1_t.paa","civ","bwi_a3_t6\tex\canada\t6_2_t.paa","bwi_a3_t6\tex\canada\t6_3_t.paa","bwi_a3_t6\tex\canada\t6_4_t.paa"],
			["bwi_a3_t6\tex\dog\t6_1_t.paa","civ","bwi_a3_t6\tex\dog\t6_2_t.paa", "bwi_a3_t6\tex\dog\t6_3_t.paa", "bwi_a3_t6\tex\dog\t6_4_t.paa"],
			["bwi_a3_t6\tex\usaf\t6_1_t.paa","cop","bwi_a3_t6\tex\usaf\t6_2_t.paa","bwi_a3_t6\tex\usaf\t6_3_t.paa","bwi_a3_t6\tex\usaf\t6_4_t.paa"]
		];
	};
	
	case "BAF_Offroad_D":
	{
		_ret = 
		[
			["pansy\LandRover\data\lr_base_baf_co","civ","pansy\LandRover\data\lr_special_baf_co"],
			["pansy\LandRover\data\lr_acr_base_co","civ","pansy\LandRover\data\lr_acr_spec_co"],
			["pansy\LandRover\data\lr_base_red_co","civ","pansy\LandRover\data\lr_special_red_co"],
			["pansy\LandRover\data\lr_base_w_baf_co","civ","pansy\LandRover\data\lr_special_w_baf_co"],
			["pansy\LandRover\data\lr_base_acrs_co","civ","pansy\LandRover\data\lr_special_acr_co"]
		];
	};
	
	case "LandRover_ACR":
	{
		_ret = 
		[
			["pansy\LandRover\data\lr_base_baf_co","civ","pansy\LandRover\data\lr_special_baf_co"],
			["pansy\LandRover\data\lr_acr_base_co","civ","pansy\LandRover\data\lr_acr_spec_co"],
			["pansy\LandRover\data\lr_base_red_co","civ","pansy\LandRover\data\lr_special_red_co"],
			["pansy\LandRover\data\lr_base_w_baf_co","civ","pansy\LandRover\data\lr_special_w_baf_co"],
			["pansy\LandRover\data\lr_base_acrs_co","civ","pansy\LandRover\data\lr_special_acr_co"]
		];
	};
	
	case "BAF_Offroad_D_HMG":
	{
		_ret = 
		[
			["pansy\LandRover\data\lr_base_baf_co","reb","pansy\LandRover\data\lr_special_baf_co","pansy\LandRover\data\lr_mg-spg9_baf_co"],
			["pansy\LandRover\data\lr_acr_base_co","reb","pansy\LandRover\data\lr_acr_spec_co","pansy\LandRover\data\lr_mg-spg9_ind_co"],
			["pansy\LandRover\data\lr_base_w_baf_co","reb","pansy\LandRover\data\lr_special_w_baf_co","pansy\LandRover\data\lr_mg-spg9_w_baf_co"],
			["pansy\LandRover\data\lr_base_ind_co","reb","pansy\LandRover\data\lr_special_w_baf_co","pansy\LandRover\data\lr_mg-spg9_ind_co"]
		];
	};
	
	case "I_MRAP_03_F":
	{
		_ret = 
		[
			["\A3\soft_f_beta\MRAP_03\Data\mrap_03_ext_co.paa","civ","\a3\data_f\vehicles\turret_co.paa"]
		];
	};
	
	case "GNT_C185":
	{
		_ret = 
		[
			["gnt_c185\tex\c185fuse4.paa","civ","gnt_c185\tex\c185wings4.paa"],
			["gnt_c185\tex\c185fuse2.paa","civ","gnt_c185\tex\c185wings2.paa"],
			["gnt_c185\tex\c185fuse3.paa","civ","gnt_c185\tex\c185wings3.paa"],
			["gnt_c185\tex\c185fuse.paa","civ","gnt_c185\tex\c185wings.paa"],
			["gnt_c185\tex\c185fuse5.paa","civ","gnt_c185\tex\c185wings5.paa"],
			["gnt_c185\tex\c185fuse4.paa","cop","gnt_c185\tex\c185wings4.paa"],
			["gnt_c185\tex\c185fuse2.paa","cop","gnt_c185\tex\c185wings2.paa"],
			["gnt_c185\tex\c185fuse3.paa","cop","gnt_c185\tex\c185wings3.paa"],
			["gnt_c185\tex\c185fuse.paa","cop","gnt_c185\tex\c185wings.paa"],
			["gnt_c185\tex\c185fuse5.paa","cop","gnt_c185\tex\c185wings5.paa"]
			
		];
	};
	
	case "GNT_C185F":
	{
		_ret = 
		[
			["gnt_c185\tex\c185fuse4.paa","civ","gnt_c185\tex\c185wings4.paa"],
			["gnt_c185\tex\c185fuse2.paa","civ","gnt_c185\tex\c185wings2.paa"],
			["gnt_c185\tex\c185fuse3.paa","civ","gnt_c185\tex\c185wings3.paa"],
			["gnt_c185\tex\c185fuse.paa","civ","gnt_c185\tex\c185wings.paa"],
			["gnt_c185\tex\c185fuse5.paa","civ","gnt_c185\tex\c185wings5.paa"],
			["gnt_c185\tex\c185fuse4.paa","cop","gnt_c185\tex\c185wings4.paa"],
			["gnt_c185\tex\c185fuse2.paa","cop","gnt_c185\tex\c185wings2.paa"],
			["gnt_c185\tex\c185fuse3.paa","cop","gnt_c185\tex\c185wings3.paa"],
			["gnt_c185\tex\c185fuse.paa","cop","gnt_c185\tex\c185wings.paa"],
			["gnt_c185\tex\c185fuse5.paa","cop","gnt_c185\tex\c185wings5.paa"]
		];
	};
};

_ret;