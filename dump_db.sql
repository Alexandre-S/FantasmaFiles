-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Lun 29 Septembre 2014 à 22:48
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `arma3life`
--

DELIMITER $$
--
-- Procédures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteDeadVehicles`()
BEGIN
	DELETE FROM `vehicles` WHERE `alive` = 0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteOldGangs`()
BEGIN
  DELETE FROM `gangs` WHERE `active` = 0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteOldHouses`()
BEGIN
  DELETE FROM `houses` WHERE `owned` = 0;
END$$

CREATE DEFINER=`arma3`@`localhost` PROCEDURE `resetLifeVehicles`()
BEGIN
	UPDATE vehicles SET `active`= 0;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `gangs`
--

CREATE TABLE IF NOT EXISTS `gangs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `members` text,
  `maxmembers` int(2) DEFAULT '8',
  `bank` int(100) DEFAULT '0',
  `active` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `gangs`
--

INSERT INTO `gangs` (`id`, `owner`, `name`, `members`, `maxmembers`, `bank`, `active`) VALUES
(2, '76561197997451635', 'FLNC', '"[`76561197997451635`,`76561198010101889`]"', 20, 999999, 1);

-- --------------------------------------------------------

--
-- Structure de la table `houses`
--

CREATE TABLE IF NOT EXISTS `houses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` varchar(32) NOT NULL,
  `pos` varchar(64) DEFAULT NULL,
  `inventory` text,
  `containers` text,
  `owned` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`,`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `players`
--

CREATE TABLE IF NOT EXISTS `players` (
  `uid` int(12) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `playerid` varchar(50) NOT NULL,
  `cash` int(100) NOT NULL DEFAULT '0',
  `bankacc` int(100) NOT NULL DEFAULT '0',
  `coplevel` enum('0','1','2','3','4','5','6','7') NOT NULL DEFAULT '0',
  `cop_licenses` text,
  `civ_licenses` text,
  `med_licenses` text,
  `cop_gear` text NOT NULL,
  `med_gear` text NOT NULL,
  `mediclevel` enum('0','1','2','3','4','5') NOT NULL DEFAULT '0',
  `arrested` tinyint(1) NOT NULL DEFAULT '0',
  `aliases` text NOT NULL,
  `adminlevel` enum('0','1','2','3') NOT NULL DEFAULT '0',
  `donatorlvl` enum('0','1','2','3','4','5') NOT NULL DEFAULT '0',
  `civ_gear` text NOT NULL,
  `blacklist` tinyint(1) NOT NULL DEFAULT '0',
  `faction_reb` enum('0','1','2','3') NOT NULL DEFAULT '0',
  `grade_reb` enum('0','1','2','3') NOT NULL DEFAULT '0',
  `alive` tinyint(1) NOT NULL DEFAULT '0',
  `position` text NOT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `playerid` (`playerid`),
  KEY `name` (`name`),
  KEY `blacklist` (`blacklist`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Contenu de la table `players`
--

INSERT INTO `players` (`uid`, `name`, `playerid`, `cash`, `bankacc`, `coplevel`, `cop_licenses`, `civ_licenses`, `med_licenses`, `cop_gear`, `med_gear`, `mediclevel`, `arrested`, `aliases`, `adminlevel`, `donatorlvl`, `civ_gear`, `blacklist`, `faction_reb`, `grade_reb`, `alive`, `position`) VALUES
(16, 'Nikos Baros', '76561198010101889', 144420, 784223104, '7', '"[[`license_cop_air`,0],[`license_cop_swat`,0],[`license_cop_cg`,0]]"', '"[[`license_civ_driver`,1],[`license_civ_air`,1],[`license_civ_heroin`,0],[`license_civ_marijuana`,0],[`license_civ_gang`,0],[`license_civ_boat`,1],[`license_civ_oil`,0],[`license_civ_dive`,0],[`license_civ_truck`,1],[`license_civ_gun`,1],[`license_civ_rebel`,1],[`license_civ_coke`,0],[`license_civ_diamond`,0],[`license_civ_copper`,0],[`license_civ_iron`,0],[`license_civ_sand`,0],[`license_civ_salt`,0],[`license_civ_cement`,0],[`license_civ_home`,1]]"', '"[[`license_med_air`,1]]"', '"[`ARC_FR_Uniform_Serval`,`ARC_FR_CE_Plate_Carrier_H`,`ARC_FR_Kitbag_compact_Daguet`,`G_Aviator`,`sab_UN_Beret`,[`ItemMap`,`ItemCompass`,`ItemWatch`,`ItemGPS`],`srifle_mas_m24_d`,`hgun_mas_glock_F`,[],[`16Rnd_9x21_Mag`,`17Rnd_mas_9x21_Mag`,`30Rnd_mas_556x45_Stanag`],[],[],[],[`16Rnd_9x21_Mag`,`16Rnd_9x21_Mag`,`6Rnd_45ACP_Cylinder`,`6Rnd_45ACP_Cylinder`,`6Rnd_45ACP_Cylinder`,`20Rnd_mas_762x51_Stanag`,`16Rnd_9x21_Mag`,`30Rnd_mas_556x45_Stanag`,`5Rnd_mas_762x51_Stanag`,`5Rnd_mas_762x51_Stanag`,`16Rnd_9x21_Mag`],[``,``,`optic_SOS`],[``,``,``],[]]"', '"[`U_Rangemaster`,``,``,``,``,[`ItemMap`,`ItemCompass`,`ItemWatch`],[],[],[`FirstAidKit`,`FirstAidKit`],[],[],[],[],[],[],[],[]]"', '5', 0, '"[`Nikos Baros`]"', '3', '0', '"[`UVF_Soldier_Outfit_2`,`V_BandollierB_oli`,`B_Carryall_cbr`,`IRA_Balaclava_Brown`,`H_Cap_khaki_specops_UK`,[`ItemMap`,`ItemCompass`,`ItemWatch`,`ItemGPS`,`NVGoggles`,`Binocular`],`LMG_mas_m72_F`,`hgun_mas_sa61_F`,[],[`9Rnd_45ACP_Mag`,`20Rnd_mas_765x17_Mag`,`20Rnd_mas_765x17_Mag`,`30Rnd_mas_556x45_Stanag`,`30Rnd_mas_556x45_Stanag`],[],[],[],[`30Rnd_mas_556x45_Stanag`,`30Rnd_mas_556x45_Stanag`,`20Rnd_mas_765x17_Mag`,`20Rnd_mas_765x17_Mag`,`100Rnd_mas_762x39_mag`,`20Rnd_mas_765x17_Mag`],[``,``,``],[``,``,``],[]]"', 0, '2', '3', 0, '[12205.2,22933.8,0.00166011]'),
(17, 'Keyserjose', '76561197991770316', 235661, 564234816, '7', '"[]"', '"[[`license_civ_driver`,0],[`license_civ_air`,0],[`license_civ_heroin`,0],[`license_civ_marijuana`,0],[`license_civ_gang`,0],[`license_civ_boat`,0],[`license_civ_oil`,0],[`license_civ_dive`,0],[`license_civ_truck`,0],[`license_civ_gun`,0],[`license_civ_rebel`,0],[`license_civ_coke`,0],[`license_civ_diamond`,0],[`license_civ_copper`,0],[`license_civ_iron`,0],[`license_civ_sand`,0],[`license_civ_salt`,0],[`license_civ_cement`,0],[`license_civ_home`,0]]"', '"[]"', '"[]"', '"[]"', '5', 0, '"[`Keyserjose`]"', '0', '0', '"[`U_C_Poloshirt_tricolour`,``,``,``,``,[`ItemMap`,`ItemCompass`,`ItemWatch`],``,``,[],[],[],[],[],[],[],[],[]]"', 0, '3', '3', 0, '[8493.69,25146.5,0.00156403]'),
(18, 'Germain De Nevris', '76561198060551250', 0, 564234816, '7', '"[]"', '"[[`license_civ_driver`,0],[`license_civ_air`,0],[`license_civ_heroin`,0],[`license_civ_marijuana`,0],[`license_civ_gang`,0],[`license_civ_boat`,0],[`license_civ_oil`,0],[`license_civ_dive`,0],[`license_civ_truck`,0],[`license_civ_gun`,0],[`license_civ_rebel`,0],[`license_civ_coke`,0],[`license_civ_diamond`,0],[`license_civ_copper`,0],[`license_civ_iron`,0],[`license_civ_sand`,0],[`license_civ_salt`,0],[`license_civ_cement`,0],[`license_civ_home`,0]]"', '"[]"', '"[`ARC_FR_CE_Uniform_Light`,`ARC_FR_TANOD_Plate_Carrier_H`,`ARC_FR_Kitbag_compact_CE`,``,`sab_UN_Beret`,[`ItemMap`,`ItemCompass`,`ItemWatch`,`ItemGPS`],``,`hgun_Pistol_heavy_02_F`,[],[`16Rnd_9x21_Mag`,`16Rnd_9x21_Mag`,`30Rnd_mas_556x45_Stanag`],[],[`5Rnd_mas_127x99_dem_Stanag`,`5Rnd_mas_127x99_dem_Stanag`,`5Rnd_mas_127x99_dem_Stanag`,`5Rnd_mas_127x99_dem_Stanag`],[],[`16Rnd_9x21_Mag`,`16Rnd_9x21_Mag`,`16Rnd_9x21_Mag`,`5Rnd_mas_762x51_Stanag`,`5Rnd_mas_762x51_Stanag`,`5Rnd_mas_762x51_Stanag`,`5Rnd_mas_762x51_Stanag`,`5Rnd_mas_762x51_Stanag`,`5Rnd_mas_762x51_Stanag`,`5Rnd_mas_762x51_Stanag`,`5Rnd_mas_762x51_Stanag`,`5Rnd_mas_762x51_Stanag`,`6Rnd_45ACP_Cylinder`,`6Rnd_45ACP_Cylinder`,`6Rnd_45ACP_Cylinder`,`6Rnd_45ACP_Cylinder`,`6Rnd_45ACP_Cylinder`,`30Rnd_mas_556x45_Stanag`],[],[``,``,``],[]]"', '"[]"', '5', 0, '"[`Germain De Nevris`]"', '0', '0', '"[`U_C_Poloshirt_stripped`,``,``,``,``,[`ItemMap`,`ItemCompass`,`ItemWatch`],``,``,[],[],[],[],[],[],[],[],[]]"', 0, '2', '3', 0, '[3374.23,13011.7,0.00114274]');

-- --------------------------------------------------------

--
-- Structure de la table `vehicles`
--

CREATE TABLE IF NOT EXISTS `vehicles` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `side` varchar(15) NOT NULL,
  `classname` varchar(32) NOT NULL,
  `type` varchar(12) NOT NULL,
  `pid` varchar(32) NOT NULL,
  `alive` tinyint(1) NOT NULL DEFAULT '1',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `plate` int(20) NOT NULL,
  `color` int(20) NOT NULL,
  `inventory` varchar(500) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `side` (`side`),
  KEY `pid` (`pid`),
  KEY `type` (`type`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Contenu de la table `vehicles`
--

INSERT INTO `vehicles` (`id`, `side`, `classname`, `type`, `pid`, `alive`, `active`, `plate`, `color`, `inventory`) VALUES
(1, 'med', 'O_Heli_Light_02_unarmed_F', 'Air', '76561198010101889', 1, 1, 492170, 4, '"[]"'),
(2, 'med', 'O_Heli_Light_02_unarmed_F', 'Air', '76561198010101889', 1, 0, 688538, 4, '"[]"'),
(3, 'med', 'C_Offroad_01_F', 'Car', '76561198010101889', 1, 1, 704352, 0, '"[]"'),
(4, 'med', 'B_Heli_Light_01_F', 'Air', '76561198010101889', 1, 0, 870674, 14, '"[]"'),
(5, 'med', 'C_Offroad_01_F', 'Car', '76561198010101889', 1, 1, 82058, 0, '"[]"'),
(6, 'med', 'C_Offroad_01_F', 'Car', '76561198010101889', 1, 1, 749127, 0, '"[]"'),
(7, 'med', 'C_Offroad_01_F', 'Car', '76561198010101889', 1, 1, 414632, 0, '"[]"'),
(8, 'civ', 'C_Hatchback_01_F', 'Car', '76561198010101889', 1, 1, 467521, 3, '"[]"');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
