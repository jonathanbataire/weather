-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 04, 2018 at 11:40 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `wdrdb`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `prc_user`()
BEGIN
            DECLARE var2 INT DEFAULT 1;
            SET var2 = 38;
            SELECT  var2;
        END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `suser`()
BEGIN
            DECLARE var2 INT DEFAULT 1;
            SET var2 = 38;
            SELECT  var2;
        END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `archivedekadalformreportdata`
--

CREATE TABLE IF NOT EXISTS `archivedekadalformreportdata` (
  `id` bigint(255) NOT NULL AUTO_INCREMENT,
  `Date` date NOT NULL,
  `station` int(11) DEFAULT NULL,
  `MAX_TEMP` varchar(255) DEFAULT NULL,
  `MIN_TEMP` varchar(255) DEFAULT NULL,
  `DRY_BULB_0600Z` varchar(255) DEFAULT NULL,
  `WET_BULB_0600Z` varchar(255) DEFAULT NULL,
  `DEW_POINT_0600Z` varchar(255) DEFAULT NULL,
  `RELATIVE_HUMIDITY_0600Z` varchar(255) DEFAULT NULL,
  `WIND_DIRECTION_0600Z` varchar(255) DEFAULT NULL,
  `WIND_SPEED_0600Z` varchar(255) DEFAULT NULL,
  `RAINFALL_0600Z` varchar(255) DEFAULT NULL,
  `DRY_BULB_1200Z` varchar(255) DEFAULT NULL,
  `WET_BULB_1200Z` varchar(255) DEFAULT NULL,
  `DEW_POINT_1200Z` varchar(255) DEFAULT NULL,
  `RELATIVE_HUMIDITY_1200Z` varchar(255) DEFAULT NULL,
  `WIND_DIRECTION_1200Z` varchar(255) DEFAULT NULL,
  `WIND_SPEED_1200Z` varchar(255) DEFAULT NULL,
  `AD_SubmittedBy` varchar(255) NOT NULL,
  `Approved` varchar(225) NOT NULL,
  `CreationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `archivemetarformdata`
--

CREATE TABLE IF NOT EXISTS `archivemetarformdata` (
  `Date` date NOT NULL,
  `id` bigint(225) NOT NULL AUTO_INCREMENT,
  `station` int(11) NOT NULL,
  `TIME` varchar(225) NOT NULL,
  `METARSPECI` varchar(225) NOT NULL,
  `CCCC` varchar(225) DEFAULT NULL,
  `YYGGgg` varchar(225) DEFAULT NULL,
  `Dddfffmfm` varchar(225) DEFAULT NULL,
  `WWorCAVOK` varchar(225) DEFAULT NULL,
  `W1W1` varchar(225) DEFAULT NULL,
  `NlCCNmCCNhCC` varchar(225) DEFAULT NULL,
  `TTTdTd` varchar(225) DEFAULT NULL,
  `Qnhhpa` varchar(225) DEFAULT NULL,
  `Qnhin` varchar(225) DEFAULT NULL,
  `Qfehpa` varchar(225) DEFAULT NULL,
  `Qfein` varchar(225) DEFAULT NULL,
  `REW1W1` varchar(225) DEFAULT NULL,
  `AM_SubmittedBy` varchar(225) NOT NULL,
  `Approved` varchar(225) NOT NULL,
  `CreationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `archivemonthlyrainfallformreportdata`
--

CREATE TABLE IF NOT EXISTS `archivemonthlyrainfallformreportdata` (
  `id` bigint(225) NOT NULL AUTO_INCREMENT,
  `Date` date NOT NULL,
  `station` int(11) NOT NULL,
  `Rainfall` varchar(225) NOT NULL,
  `AR_SubmittedBy` varchar(225) NOT NULL,
  `Approved` varchar(225) NOT NULL,
  `CreationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `archiveobservationslipformdata`
--

CREATE TABLE IF NOT EXISTS `archiveobservationslipformdata` (
  `Date` date NOT NULL,
  `id` bigint(225) NOT NULL AUTO_INCREMENT,
  `station` int(11) NOT NULL,
  `TIME` varchar(225) NOT NULL,
  `TotalAmountOfAllClouds` varchar(225) DEFAULT NULL,
  `TotalAmountOfLowClouds` varchar(225) DEFAULT NULL,
  `TypeOfLowClouds1` varchar(225) DEFAULT NULL,
  `OktasOfLowClouds1` varchar(225) DEFAULT NULL,
  `HeightOfLowClouds1` varchar(225) DEFAULT NULL,
  `CLCODEOfLowClouds1` varchar(225) DEFAULT NULL,
  `TypeOfLowClouds2` varchar(255) DEFAULT NULL,
  `OktasOfLowClouds2` varchar(255) DEFAULT NULL,
  `HeightOfLowClouds2` varchar(255) DEFAULT NULL,
  `CLCODEOfLowClouds2` varchar(255) DEFAULT NULL,
  `TypeOfLowClouds3` varchar(255) DEFAULT NULL,
  `OktasOfLowClouds3` varchar(255) DEFAULT NULL,
  `HeightOfLowClouds3` varchar(255) DEFAULT NULL,
  `CLCODEOfLowClouds3` varchar(255) DEFAULT NULL,
  `TypeOfMediumClouds1` varchar(225) DEFAULT NULL,
  `OktasOfMediumClouds1` varchar(225) DEFAULT NULL,
  `HeightOfMediumClouds1` varchar(225) DEFAULT NULL,
  `CLCODEOfMediumClouds1` varchar(225) DEFAULT NULL,
  `TypeOfMediumClouds2` varchar(255) DEFAULT NULL,
  `OktasOfMediumClouds2` varchar(255) DEFAULT NULL,
  `HeightOfMediumClouds2` varchar(255) DEFAULT NULL,
  `CLCODEOfMediumClouds2` varchar(255) DEFAULT NULL,
  `TypeOfMediumClouds3` varchar(255) DEFAULT NULL,
  `OktasOfMediumClouds3` varchar(255) DEFAULT NULL,
  `HeightOfMediumClouds3` varchar(255) DEFAULT NULL,
  `CLCODEOfMediumClouds3` varchar(255) DEFAULT NULL,
  `TypeOfHighClouds1` varchar(225) DEFAULT NULL,
  `OktasOfHighClouds1` varchar(225) DEFAULT NULL,
  `HeightOfHighClouds1` varchar(225) DEFAULT NULL,
  `CLCODEOfHighClouds1` varchar(225) DEFAULT NULL,
  `TypeOfHighClouds2` varchar(255) DEFAULT NULL,
  `OktasOfHighClouds2` varchar(255) DEFAULT NULL,
  `HeightOfHighClouds2` varchar(255) DEFAULT NULL,
  `CLCODEOfHighClouds2` varchar(255) DEFAULT NULL,
  `TypeOfHighClouds3` varchar(255) DEFAULT NULL,
  `OktasOfHighClouds3` varchar(255) DEFAULT NULL,
  `HeightOfHighClouds3` varchar(255) DEFAULT NULL,
  `CLCODEOfHighClouds3` varchar(255) DEFAULT NULL,
  `CloudSearchLightReading` varchar(225) DEFAULT NULL,
  `Rainfall` varchar(225) DEFAULT NULL,
  `Dry_Bulb` varchar(225) DEFAULT NULL,
  `Wet_Bulb` varchar(225) DEFAULT NULL,
  `Max_Read` varchar(225) DEFAULT NULL,
  `Max_Reset` varchar(225) DEFAULT NULL,
  `Min_Read` varchar(225) DEFAULT NULL,
  `Min_Reset` varchar(225) DEFAULT NULL,
  `Piche_Read` varchar(225) DEFAULT NULL,
  `Piche_Reset` varchar(225) DEFAULT NULL,
  `TimeMarksThermo` varchar(225) DEFAULT NULL,
  `TimeMarksHygro` varchar(225) DEFAULT NULL,
  `TimeMarksRainRec` varchar(225) DEFAULT NULL,
  `Present_Weather` varchar(225) DEFAULT NULL,
  `Visibility` varchar(225) DEFAULT NULL,
  `Wind_Direction` varchar(225) DEFAULT NULL,
  `Wind_Speed` varchar(225) DEFAULT NULL,
  `Gusting` varchar(225) DEFAULT NULL,
  `AttdThermo` varchar(225) DEFAULT NULL,
  `PrAsRead` varchar(225) DEFAULT NULL,
  `Correction` varchar(225) DEFAULT NULL,
  `CLP` varchar(225) DEFAULT NULL,
  `MSLPr` varchar(225) DEFAULT NULL,
  `TimeMarksBarograph` varchar(225) DEFAULT NULL,
  `TimeMarksAnemograph` varchar(225) DEFAULT NULL,
  `OtherTMarks` varchar(255) DEFAULT NULL,
  `Remarks` varchar(255) DEFAULT NULL,
  `AO_SubmittedBy` varchar(225) NOT NULL,
  `Approved` varchar(225) NOT NULL,
  `CreationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `archivesynopticformreportdata`
--

CREATE TABLE IF NOT EXISTS `archivesynopticformreportdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Date` date NOT NULL,
  `station` int(11) NOT NULL,
  `TIME` varchar(50) NOT NULL,
  `UWS` varchar(25) DEFAULT NULL,
  `BN` varchar(25) DEFAULT NULL,
  `IOOP` varchar(25) DEFAULT NULL,
  `TSPPW` varchar(25) DEFAULT NULL,
  `HLC` varchar(25) DEFAULT NULL,
  `HV` varchar(25) DEFAULT NULL,
  `TCC` varchar(25) DEFAULT NULL,
  `WD` varchar(25) DEFAULT NULL,
  `WS` varchar(25) DEFAULT NULL,
  `GI1_1` varchar(25) DEFAULT NULL,
  `SignOfData_1` varchar(25) DEFAULT NULL,
  `Air_temperature` varchar(25) DEFAULT NULL,
  `GI2_1` varchar(25) DEFAULT NULL,
  `SignOfData_2` varchar(25) DEFAULT NULL,
  `Dewpoint_temperature` varchar(25) DEFAULT NULL,
  `GI3_1` varchar(25) DEFAULT NULL,
  `PASL` varchar(25) DEFAULT NULL,
  `GI4_1` varchar(25) DEFAULT NULL,
  `SIS` varchar(25) DEFAULT NULL,
  `GSIS` varchar(25) DEFAULT NULL,
  `GI6_1` varchar(25) DEFAULT NULL,
  `AOP` varchar(25) DEFAULT NULL,
  `DPOP` varchar(25) DEFAULT NULL,
  `GI7_1` varchar(25) DEFAULT NULL,
  `Present_Weather` varchar(25) DEFAULT NULL,
  `Past_Weather` varchar(25) DEFAULT NULL,
  `GI8_1` varchar(25) DEFAULT NULL,
  `AOC` varchar(25) DEFAULT NULL,
  `CLOG` varchar(25) DEFAULT NULL,
  `CGOG` varchar(25) DEFAULT NULL,
  `CHOG` varchar(25) DEFAULT NULL,
  `Section_Indicator333` varchar(25) DEFAULT NULL,
  `GI0_1` varchar(25) DEFAULT NULL,
  `GMT` varchar(25) DEFAULT NULL,
  `CIOP` varchar(25) DEFAULT NULL,
  `BEOP` varchar(25) DEFAULT NULL,
  `ThunderStorm` varchar(11) DEFAULT NULL,
  `HailStorm` varchar(11) DEFAULT NULL,
  `Fog` varchar(11) DEFAULT NULL,
  `EarthQuake` varchar(11) DEFAULT NULL,
  `Anemometer_Reading` varchar(11) DEFAULT NULL,
  `Actual_Rainfall` varchar(10) DEFAULT NULL,
  `GI1_2` varchar(25) DEFAULT NULL,
  `SignOfData_3` varchar(25) DEFAULT NULL,
  `Max_TempTx` varchar(25) DEFAULT NULL,
  `GI2_2` varchar(25) DEFAULT NULL,
  `SignOfData_4` varchar(25) DEFAULT NULL,
  `Max_TempTn` varchar(25) DEFAULT NULL,
  `GI5_1` varchar(25) DEFAULT NULL,
  `AOE` varchar(25) DEFAULT NULL,
  `ITI` varchar(25) DEFAULT NULL,
  `GI55` varchar(25) DEFAULT NULL,
  `DOS` varchar(25) DEFAULT NULL,
  `GI5_2` varchar(25) DEFAULT NULL,
  `SPC` varchar(12) DEFAULT NULL,
  `PCI24Hrs` varchar(25) DEFAULT NULL,
  `GI6_2` varchar(25) DEFAULT NULL,
  `AOP_2` varchar(25) DEFAULT NULL,
  `DPOP_2` varchar(25) DEFAULT NULL,
  `GI8_2` varchar(25) DEFAULT NULL,
  `AICL` varchar(25) DEFAULT NULL,
  `GOC` varchar(12) DEFAULT NULL,
  `HBCLOM` varchar(25) DEFAULT NULL,
  `GI8_3` varchar(25) DEFAULT NULL,
  `AICL_2` varchar(25) DEFAULT NULL,
  `GOC_2` varchar(25) DEFAULT NULL,
  `HBCLOM_2` varchar(25) DEFAULT NULL,
  `GI8_4` varchar(25) DEFAULT NULL,
  `AICL_3` varchar(25) DEFAULT NULL,
  `GOC_3` varchar(25) DEFAULT NULL,
  `HBCLOM_3` varchar(25) DEFAULT NULL,
  `GI8_5` varchar(25) DEFAULT NULL,
  `AICL_4` varchar(25) DEFAULT NULL,
  `GOC_4` varchar(25) DEFAULT NULL,
  `HBCLOM_4` varchar(25) DEFAULT NULL,
  `GI9` varchar(25) DEFAULT NULL,
  `Supp_Info` varchar(25) DEFAULT NULL,
  `Section_Indicator555` varchar(25) DEFAULT NULL,
  `GI1_3` varchar(25) DEFAULT NULL,
  `SignOfData_5` varchar(25) DEFAULT NULL,
  `Wetbulb_Temp` varchar(25) DEFAULT NULL,
  `R_Humidity` varchar(25) DEFAULT NULL,
  `V_Pressure` varchar(25) DEFAULT NULL,
  `remarks` text,
  `time_` time DEFAULT NULL,
  `ObserverOnDuty` varchar(30) DEFAULT NULL,
  `to_` varchar(30) DEFAULT NULL,
  `from_` varchar(30) DEFAULT NULL,
  `Approved` varchar(15) NOT NULL,
  `AS_SubmittedBy` varchar(20) NOT NULL,
  `CreationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `archiveweathersummaryformreportdata`
--

CREATE TABLE IF NOT EXISTS `archiveweathersummaryformreportdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Date` date NOT NULL,
  `station` int(11) NOT NULL,
  `TEMP_MAX` varchar(25) DEFAULT NULL,
  `TEMP_MIN` varchar(25) DEFAULT NULL,
  `SUNSHINE` varchar(25) DEFAULT NULL,
  `DB_0600Z` varchar(25) DEFAULT NULL,
  `WB_0600Z` varchar(25) DEFAULT NULL,
  `DP_0600Z` varchar(25) DEFAULT NULL,
  `VP_0600Z` varchar(25) DEFAULT NULL,
  `RH_0600Z` varchar(25) DEFAULT NULL,
  `CLP_0600Z` varchar(25) DEFAULT NULL,
  `GPM_0600Z` varchar(25) DEFAULT NULL,
  `WIND_DIR_0600Z` varchar(25) DEFAULT NULL,
  `FF_0600Z` varchar(25) DEFAULT NULL,
  `DB_1200Z` varchar(255) DEFAULT NULL,
  `WB_1200Z` varchar(255) DEFAULT NULL,
  `DP_1200Z` varchar(255) DEFAULT NULL,
  `VP_1200Z` varchar(255) DEFAULT NULL,
  `RH_1200Z` varchar(255) DEFAULT NULL,
  `CLP_1200Z` varchar(25) DEFAULT NULL,
  `GPM_1200Z` varchar(25) DEFAULT NULL,
  `WIND_DIR_1200Z` varchar(25) DEFAULT NULL,
  `FF_1200Z` varchar(25) DEFAULT NULL,
  `WIND_RUN` varchar(25) DEFAULT NULL,
  `R_F` varchar(25) DEFAULT NULL,
  `ThunderStorm` text,
  `Fog` text,
  `Haze` text,
  `HailStorm` text,
  `EarthQuake` text,
  `AW_SubmittedBy` varchar(255) NOT NULL,
  `Approved` varchar(255) NOT NULL,
  `CreationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `aws`
--

CREATE TABLE IF NOT EXISTS `aws` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `Date` date DEFAULT NULL,
  `Time` time DEFAULT NULL,
  `StationName` varchar(25) DEFAULT NULL,
  `StationNumber` bigint(20) NOT NULL,
  `TXT` varchar(255) DEFAULT NULL,
  `E64` varchar(255) DEFAULT NULL,
  `IdOfTransmittingNode` int(255) DEFAULT NULL,
  `Temperature` int(255) DEFAULT NULL,
  `SoilTemperature` int(255) DEFAULT NULL,
  `T_mcu` int(255) DEFAULT NULL,
  `V_MCU` varchar(255) DEFAULT NULL,
  `P0` int(25) DEFAULT NULL,
  `P0_lst60_02` int(255) DEFAULT NULL,
  `P1` int(255) DEFAULT NULL,
  `P1_t` int(255) DEFAULT NULL,
  `P1_lst` int(255) DEFAULT NULL,
  `Uptime` int(255) DEFAULT NULL,
  `Error` varchar(255) DEFAULT NULL,
  `V_IN` int(15) DEFAULT NULL,
  `A1` int(255) DEFAULT NULL,
  `A2` int(25) DEFAULT NULL,
  `A3` int(255) DEFAULT NULL,
  `GW_LON` int(255) DEFAULT NULL,
  `GW_LAT` int(255) DEFAULT NULL,
  `P_MS5611` int(255) DEFAULT NULL,
  `UT` int(255) DEFAULT NULL,
  `RH_SHT2X` int(255) DEFAULT NULL,
  `T_SHT2X` int(255) DEFAULT NULL,
  `ADC1` int(255) DEFAULT NULL,
  `ADC2` int(255) DEFAULT NULL,
  `DOMAIN` varchar(25) DEFAULT NULL,
  `TZ` varchar(25) DEFAULT NULL,
  `UP` varchar(25) DEFAULT NULL,
  `T` int(255) DEFAULT NULL,
  `PS` varchar(255) DEFAULT NULL,
  `RH` varchar(255) DEFAULT NULL,
  `V_a1` int(25) DEFAULT NULL,
  `P0_T` int(25) DEFAULT NULL,
  `V_A1_V_A2_005_400` int(255) DEFAULT NULL,
  `V_AD1_100` int(255) DEFAULT NULL,
  `V_AD2_100` int(25) DEFAULT NULL,
  `V_AD3_100` int(25) DEFAULT NULL,
  `V_AD1_1000` int(255) DEFAULT NULL,
  `V_AD2_1000` int(255) DEFAULT NULL,
  `V_AD3_1000` int(255) DEFAULT NULL,
  `ADDR` varchar(255) DEFAULT NULL,
  `V_AD1` varchar(255) DEFAULT NULL,
  `V_AD2` varchar(255) DEFAULT NULL,
  `V_AD3` varchar(255) DEFAULT NULL,
  `SEQ` varchar(255) DEFAULT NULL,
  `TTL` varchar(255) DEFAULT NULL,
  `RSSI` varchar(255) DEFAULT NULL,
  `LQI` varchar(255) DEFAULT NULL,
  `DRP` varchar(255) DEFAULT NULL,
  `SRC` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `elements`
--

CREATE TABLE IF NOT EXISTS `elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ElementName` varchar(30) NOT NULL,
  `InstrumentName` varchar(30) NOT NULL,
  `station` int(11) NOT NULL COMMENT 'foreign key',
  `Abbrev` varchar(10) DEFAULT NULL,
  `Type` varchar(30) DEFAULT NULL,
  `Units` varchar(30) DEFAULT NULL,
  `Scale` varchar(30) DEFAULT NULL,
  `Limits` varchar(30) DEFAULT NULL,
  `Description` varchar(30) DEFAULT NULL,
  `SubmittedBy` varchar(30) NOT NULL,
  `CreationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `groundnode`
--

CREATE TABLE IF NOT EXISTS `groundnode` (
  `node_id` int(11) NOT NULL AUTO_INCREMENT,
  `station_id` int(11) NOT NULL,
  `date_gnd` varchar(30) NOT NULL,
  `time_gnd` varchar(30) NOT NULL,
  `ut_gnd` varchar(30) NOT NULL,
  `gw_lat_gnd` varchar(30) NOT NULL,
  `gw_long_gnd` varchar(30) NOT NULL,
  `ps_gnd` varchar(30) NOT NULL,
  `p0_gnd` varchar(30) NOT NULL,
  `v_mcu_gnd` varchar(30) NOT NULL,
  `v_in_gnd` varchar(30) NOT NULL,
  `p0_lst60_gnd` varchar(30) NOT NULL,
  `up_gnd` varchar(30) NOT NULL,
  `v_a1_gnd` varchar(30) NOT NULL,
  `v_a2_gnd` varchar(30) NOT NULL,
  `ttl_gnd` varchar(30) NOT NULL,
  `rssi_gnd` varchar(30) NOT NULL,
  `lqi_gnd` varchar(30) NOT NULL,
  `drp_gnd` varchar(30) NOT NULL,
  `e64_gnd` varchar(30) NOT NULL,
  `txt_gnd` varchar(30) NOT NULL,
  `t1_gnd` varchar(30) NOT NULL,
  `t_gnd` varchar(30) NOT NULL,
  `seq_gnd` varchar(10) NOT NULL DEFAULT 'SEQ',
  `txt_gnd_value` varchar(30) NOT NULL,
  `node_status` enum('on','off') NOT NULL,
  `v_in_max_value` double NOT NULL,
  `v_in_min_value` double NOT NULL,
  `v_mcu_max_value` double NOT NULL,
  `v_mcu_min_value` double NOT NULL,
  `CreationDate` timestamp NULL DEFAULT NULL,
  `UpdateDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`node_id`),
  UNIQUE KEY `station_id` (`station_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `instruments`
--

CREATE TABLE IF NOT EXISTS `instruments` (
  `id` bigint(255) NOT NULL AUTO_INCREMENT,
  `InstrumentName` varchar(255) NOT NULL,
  `Station` int(11) NOT NULL,
  `DateRegistered` date NOT NULL,
  `ExpirationDate` date NOT NULL,
  `InstrumentCode` varchar(255) NOT NULL,
  `Manufacturer` varchar(255) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `SubmittedBy` varchar(255) NOT NULL,
  `CreationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `nodestatus`
--

CREATE TABLE IF NOT EXISTS `nodestatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `V_MCU` varchar(10) NOT NULL,
  `V_IN` varchar(10) NOT NULL,
  `RSSI` varchar(10) NOT NULL,
  `LQI` varchar(10) NOT NULL,
  `DRP` varchar(10) NOT NULL,
  `SEQ` varchar(20) DEFAULT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `TXT` varchar(20) DEFAULT NULL,
  `E64` varchar(30) DEFAULT NULL,
  `StationNumber` varchar(10) DEFAULT NULL,
  `date_time_recorded` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `nodestatus_analyzer_checks`
--

CREATE TABLE IF NOT EXISTS `nodestatus_analyzer_checks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_first_checked` int(11) NOT NULL,
  `id_last_checked` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `observationslip`
--

CREATE TABLE IF NOT EXISTS `observationslip` (
  `Date` date NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Userid` int(11) NOT NULL,
  `station` int(11) NOT NULL,
  `TIME` varchar(10) NOT NULL,
  `TotalAmountOfAllClouds` int(11) DEFAULT NULL,
  `TotalAmountOfLowClouds` int(11) DEFAULT NULL,
  `TypeOfLowClouds1` int(2) DEFAULT NULL,
  `OktasOfLowClouds1` int(11) DEFAULT NULL,
  `HeightOfLowClouds1` int(11) DEFAULT NULL,
  `CLCODEOfLowClouds1` varchar(10) DEFAULT '00',
  `TypeOfLowClouds2` int(11) DEFAULT NULL,
  `OktasOfLowClouds2` int(11) DEFAULT NULL,
  `HeightOfLowClouds2` int(11) DEFAULT NULL,
  `CLCODEOfLowClouds2` varchar(10) DEFAULT NULL,
  `TypeOfLowClouds3` int(11) DEFAULT NULL,
  `OktasOfLowClouds3` int(11) DEFAULT NULL,
  `HeightOfLowClouds3` int(11) DEFAULT NULL,
  `CLCODEOfLowClouds3` varchar(255) DEFAULT NULL,
  `TypeOfMediumClouds1` int(11) DEFAULT NULL,
  `OktasOfMediumClouds1` int(11) DEFAULT NULL,
  `HeightOfMediumClouds1` int(11) DEFAULT NULL,
  `CLCODEOfMediumClouds1` varchar(10) DEFAULT NULL,
  `TypeOfMediumClouds2` int(11) DEFAULT NULL,
  `OktasOfMediumClouds2` int(11) DEFAULT NULL,
  `HeightOfMediumClouds2` int(11) DEFAULT NULL,
  `CLCODEOfMediumClouds2` varchar(10) DEFAULT NULL,
  `TypeOfMediumClouds3` int(11) DEFAULT NULL,
  `OktasOfMediumClouds3` int(11) DEFAULT NULL,
  `HeightOfMediumClouds3` int(11) DEFAULT NULL,
  `CLCODEOfMediumClouds3` varchar(11) DEFAULT NULL,
  `TypeOfHighClouds1` int(11) DEFAULT NULL,
  `OktasOfHighClouds1` int(11) DEFAULT NULL,
  `HeightOfHighClouds1` int(11) DEFAULT NULL,
  `CLCODEOfHighClouds1` varchar(10) DEFAULT NULL,
  `TypeOfHighClouds2` int(11) DEFAULT NULL,
  `OktasOfHighClouds2` int(11) DEFAULT NULL,
  `HeightOfHighClouds2` int(11) DEFAULT NULL,
  `CLCODEOfHighClouds2` varchar(10) DEFAULT NULL,
  `TypeOfHighClouds3` int(11) DEFAULT NULL,
  `OktasOfHighClouds3` int(11) DEFAULT NULL,
  `HeightOfHighClouds3` int(11) DEFAULT NULL,
  `CLCODEOfHighClouds3` varchar(10) DEFAULT NULL,
  `CloudSearchLightReading` double DEFAULT NULL,
  `Rainfall` varchar(10) DEFAULT NULL,
  `Dry_Bulb` varchar(10) DEFAULT NULL,
  `Wet_Bulb` varchar(10) DEFAULT NULL,
  `Max_Read` double DEFAULT NULL,
  `Max_Reset` double DEFAULT NULL,
  `Min_Read` double DEFAULT NULL,
  `Min_Reset` double DEFAULT NULL,
  `Piche_Read` double DEFAULT NULL,
  `Piche_Reset` double DEFAULT NULL,
  `TimeMarksThermo` double DEFAULT NULL,
  `TimeMarksHygro` double DEFAULT NULL,
  `TimeMarksRainRec` double DEFAULT NULL,
  `Present_Weather` varchar(100) DEFAULT NULL,
  `Present_WeatherCode` varchar(25) DEFAULT NULL,
  `Past_Weather` varchar(25) DEFAULT NULL,
  `Visibility` double DEFAULT NULL,
  `Wind_Direction` varchar(10) DEFAULT NULL,
  `Wind_Speed` varchar(10) DEFAULT NULL,
  `Gusting` double DEFAULT NULL,
  `AttdThermo` double DEFAULT NULL,
  `PrAsRead` double DEFAULT NULL,
  `Correction` double DEFAULT NULL,
  `CLP` varchar(10) DEFAULT NULL,
  `MSLPr` double DEFAULT NULL,
  `TimeMarksBarograph` double DEFAULT NULL,
  `TimeMarksAnemograph` double DEFAULT NULL,
  `OtherTMarks` varchar(125) DEFAULT NULL,
  `Remarks` varchar(100) DEFAULT NULL,
  `O_SubmittedBy` varchar(30) NOT NULL,
  `Approved` varchar(5) NOT NULL DEFAULT '0',
  `ApprovedBy` int(11) NOT NULL DEFAULT '0',
  `O_CreationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `SoilMoisture` varchar(10) DEFAULT NULL,
  `SoilTemperature` varchar(10) DEFAULT NULL,
  `sunduration` varchar(25) DEFAULT NULL,
  `trend` varchar(50) DEFAULT NULL,
  `windrun` varchar(25) DEFAULT NULL,
  `speciormetar` enum('metar','speci') DEFAULT NULL,
  `UnitOfWindSpeed` varchar(30) DEFAULT NULL,
  `IndOrOmissionOfPrecipitation` varchar(30) DEFAULT NULL,
  `TypeOfStation_Present_Past_Weather` varchar(30) DEFAULT NULL,
  `HeightOfLowestCloud` varchar(30) DEFAULT NULL,
  `StandardIsobaricSurface` varchar(30) DEFAULT NULL,
  `GPM` varchar(30) DEFAULT NULL,
  `DurationOfPeriodOfPrecipitation` varchar(30) DEFAULT NULL,
  `GrassMinTemp` varchar(30) DEFAULT NULL,
  `CI_OfPrecipitation` varchar(30) DEFAULT NULL,
  `BE_OfPrecipitation` varchar(30) DEFAULT NULL,
  `IndicatorOfTypeOfIntrumentation` varchar(30) DEFAULT NULL,
  `SignOfPressureChange` varchar(30) DEFAULT NULL,
  `Supp_Info` varchar(30) DEFAULT NULL,
  `VapourPressure` varchar(30) DEFAULT NULL,
  `T_H_Graph` varchar(30) DEFAULT NULL,
  `DeviceType` enum('AWS','web','mobile','desktop') NOT NULL DEFAULT 'AWS',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Triggers `observationslip`
--
DROP TRIGGER IF EXISTS `update_of_data`;
DELIMITER //
CREATE TRIGGER `update_of_data` AFTER UPDATE ON `observationslip`
 FOR EACH ROW BEGIN
    IF (NEW.TotalAmountOfAllClouds != OLD.TotalAmountOfAllClouds) THEN
        INSERT INTO userlogs 
            (`data_id` , `field` , `old_value` , `new_value` , `Date` , `User`,`UserRole`,`Action`,`Details`,`IP`) 
        VALUES 
            (NEW.id, "Total amount of all clouds", OLD.TotalAmountOfAllClouds , NEW.TotalAmountOfAllClouds , NOW(),@User,@UserRole,@Action,@Details,@IP);
    END IF;
    IF (NEW.TotalAmountOfLowClouds != OLD.TotalAmountOfLowClouds) THEN
        INSERT INTO userlogs 
            (`data_id` , `field` , `old_value` , `new_value` , `Date` , `User`,`UserRole`,`Action`,`Details`,`IP`) 
        VALUES 
            (NEW.id, "TotalAmountOfLowClouds", OLD.TotalAmountOfLowClouds , NEW.TotalAmountOfLowClouds ,
             NOW(),@User,@UserRole,@Action,@Details,@IP);
    END IF;
     IF (NEW.TypeOfLowClouds1 != OLD.TypeOfLowClouds1) THEN
        INSERT INTO userlogs 
            (`data_id` , `field` , `old_value` , `new_value` , `Date` , `User`,`UserRole`,`Action`,`Details`,`IP`) 
        VALUES 
            (NEW.id, "TypeOfLowClouds1", OLD.TypeOfLowClouds1 , NEW.TypeOfLowClouds1 ,
             NOW(),@User,@UserRole,@Action,@Details,@IP);
    END IF;
     IF (NEW.OktasOfLowClouds1 != OLD.OktasOfLowClouds1) THEN
        INSERT INTO userlogs 
            (`data_id` , `field` , `old_value` , `new_value` , `Date` , `User`,`UserRole`,`Action`,`Details`,`IP`) 
        VALUES 
            (NEW.id, "OktasOfLowClouds1", OLD.OktasOfLowClouds1 , NEW.OktasOfLowClouds1 ,
             NOW(),@User,@UserRole,@Action,@Details,@IP);
    END IF;
      IF (NEW.HeightOfLowClouds1!= OLD.HeightOfLowClouds1) THEN
        INSERT INTO userlogs 
            (`data_id` , `field` , `old_value` , `new_value` , `Date` , `User`,`UserRole`,`Action`,`Details`,`IP`) 
        VALUES 
            (NEW.id, "HeightOfLowClouds1", OLD.HeightOfLowClouds1 , NEW.HeightOfLowClouds1 ,
             NOW(),@User,@UserRole,@Action,@Details,@IP);
    END IF;
      IF (NEW.CLCODEOfLowClouds1!= OLD.CLCODEOfLowClouds1) THEN
       INSERT INTO userlogs 
            (`data_id` , `field` , `old_value` , `new_value` , `Date` , `User`,`UserRole`,`Action`,`Details`,`IP`) 
        VALUES 
            (NEW.id, "CLCODEOfLowClouds1", OLD.CLCODEOfLowClouds1 , NEW.CLCODEOfLowClouds1 ,
             NOW(),@User,@UserRole,@Action,@Details,@IP);
    END IF;
      IF (NEW.TypeOfLowClouds2!= OLD.TypeOfLowClouds2) THEN
        INSERT INTO userlogs 
            (`data_id` , `field` , `old_value` , `new_value` , `Date` , `User`,`UserRole`,`Action`,`Details`,`IP`) 
        VALUES 
            (NEW.id, "TypeOfLowClouds2", OLD.TypeOfLowClouds2 , NEW.TypeOfLowClouds2,
             NOW(),@User,@UserRole,@Action,@Details,@IP);
    END IF;
      IF (NEW.OktasOfLowClouds2!= OLD.OktasOfLowClouds2) THEN
        INSERT INTO userlogs 
            (`data_id` , `field` , `old_value` , `new_value` , `Date` , `User`,`UserRole`,`Action`,`Details`,`IP`) 
        VALUES 
            (NEW.id, "OktasOfLowClouds2", OLD.OktasOfLowClouds2 , NEW.OktasOfLowClouds2,
             NOW(),@User,@UserRole,@Action,@Details,@IP);
    END IF;
      IF (NEW.HeightOfLowClouds2!= OLD.HeightOfLowClouds2) THEN
        INSERT INTO userlogs 
            (`data_id` , `field` , `old_value` , `new_value` , `Date` , `User`,`UserRole`,`Action`,`Details`,`IP`) 
        VALUES 
            (NEW.id, "HeightOfLowClouds2", OLD.HeightOfLowClouds2 , NEW.HeightOfLowClouds2,
             NOW(),@User,@UserRole,@Action,@Details,@IP);
    END IF;
     IF (NEW.CLCODEOfLowClouds2!= OLD.CLCODEOfLowClouds2) THEN
        INSERT INTO userlogs 
            (`data_id` , `field` , `old_value` , `new_value` , `Date` , `User`,`UserRole`,`Action`,`Details`,`IP`) 
        VALUES 
            (NEW.id, "CLCODEOfLowClouds2", OLD.CLCODEOfLowClouds2 , NEW.CLCODEOfLowClouds2,
             NOW(),@User,@UserRole,@Action,@Details,@IP);
    END IF;
      IF (NEW.TypeOfLowClouds3!= OLD.TypeOfLowClouds3) THEN
        INSERT INTO userlogs 
            (`data_id` , `field` , `old_value` , `new_value` , `Date` , `User`,`UserRole`,`Action`,`Details`,`IP`) 
        VALUES 
            (NEW.id, "TypeOfLowClouds3", OLD.TypeOfLowClouds3 , NEW.TypeOfLowClouds3,
             NOW(),@User,@UserRole,@Action,@Details,@IP);
    END IF;
      IF (NEW.OktasOfLowClouds3!= OLD.OktasOfLowClouds3) THEN
        INSERT INTO userlogs 
            (`data_id` , `field` , `old_value` , `new_value` , `Date` , `User`,`UserRole`,`Action`,`Details`,`IP`) 
        VALUES 
            (NEW.id, "OktasOfLowClouds3", OLD.OktasOfLowClouds3 , NEW.OktasOfLowClouds3,
             NOW(),@User,@UserRole,@Action,@Details,@IP);
    END IF;
      IF (NEW.HeightOfLowClouds3!= OLD.HeightOfLowClouds3) THEN
        INSERT INTO userlogs 
            (`data_id` , `field` , `old_value` , `new_value` , `Date` , `User`,`UserRole`,`Action`,`Details`,`IP`) 
        VALUES 
            (NEW.id, "HeightOfLowClouds3", OLD.HeightOfLowClouds3 , NEW.HeightOfLowClouds3,
             NOW(),@User,@UserRole,@Action,@Details,@IP);
    END IF;
    END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `observtnslp_analyzer_checks`
--

CREATE TABLE IF NOT EXISTS `observtnslp_analyzer_checks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_first_checked` int(11) NOT NULL,
  `id_last_checked` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `problems`
--

CREATE TABLE IF NOT EXISTS `problems` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `source` enum('sensor','station','twoMeterNode','groundNode','tenMeterNode','sinkNode') COLLATE utf8mb4_unicode_ci NOT NULL,
  `source_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `criticality` enum('Critical','Non Critical') COLLATE utf8mb4_unicode_ci NOT NULL,
  `classification_id` int(10) unsigned NOT NULL,
  `track_counter` int(10) unsigned NOT NULL,
  `status` enum('reported','investigation','solved') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `classification_id` (`classification_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `problem_classification`
--

CREATE TABLE IF NOT EXISTS `problem_classification` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `problem_description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `source` enum('node','station','sensor') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE IF NOT EXISTS `reports` (
  `report_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `problem_id` int(11) NOT NULL,
  `message` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `report_counter` int(11) NOT NULL,
  `station_id` int(11) DEFAULT NULL,
  `node` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sensor` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `scans_daily`
--

CREATE TABLE IF NOT EXISTS `scans_daily` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Form_scanned` enum('observationslip','metarreport','synopticform') NOT NULL,
  `station` int(11) NOT NULL COMMENT 'foreign key for station',
  `form_date` date DEFAULT NULL,
  `TIME` varchar(10) DEFAULT NULL,
  `Description` text,
  `FileRef` varchar(50) DEFAULT NULL,
  `FileName_FirstPage` varchar(50) NOT NULL,
  `FileName_SecondPage` varchar(50) NOT NULL,
  `SD_SubmittedBy` varchar(25) NOT NULL,
  `ApprovedBy` varchar(30) NOT NULL,
  `Approved` tinyint(1) DEFAULT NULL,
  `CreationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `scans_dekadals`
--

CREATE TABLE IF NOT EXISTS `scans_dekadals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `station` int(11) NOT NULL COMMENT 'foreign key for station',
  `from_date` date DEFAULT NULL,
  `to_date` date NOT NULL,
  `Description` text,
  `FileRef` varchar(50) DEFAULT NULL,
  `SDE_SubmittedBy` varchar(25) NOT NULL,
  `ApprovedBy` varchar(30) NOT NULL,
  `Approved` tinyint(1) DEFAULT NULL,
  `CreationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `scans_monthly`
--

CREATE TABLE IF NOT EXISTS `scans_monthly` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'scannedarchiveweathersummaryformreportcopydetails',
  `Form_scanned` varchar(30) NOT NULL,
  `station` int(11) NOT NULL COMMENT 'foreign key for station',
  `year` year(4) DEFAULT NULL,
  `month` varchar(13) NOT NULL,
  `Description` text,
  `FileRef` varchar(50) DEFAULT NULL,
  `SM_SubmittedBy` varchar(25) NOT NULL,
  `ApprovedBy` varchar(30) NOT NULL,
  `Approved` tinyint(1) DEFAULT NULL,
  `CreationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `scans_yearly`
--

CREATE TABLE IF NOT EXISTS `scans_yearly` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Form_scanned` varchar(25) NOT NULL,
  `station` int(11) NOT NULL COMMENT 'foreign key for station',
  `year` year(4) DEFAULT NULL,
  `Description` text,
  `FileRef` varchar(50) DEFAULT NULL,
  `SY_SubmittedBy` varchar(25) NOT NULL,
  `ApprovedBy` varchar(30) NOT NULL,
  `Approved` tinyint(1) DEFAULT NULL,
  `CreationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sensors`
--

CREATE TABLE IF NOT EXISTS `sensors` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `node_id` int(10) unsigned NOT NULL,
  `node_type` enum('twoMeterNode','tenMeterNode','groundNode','sinkNode') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'this should be the table of the node e.g twoMeterNode',
  `sensor_status` enum('on','off') COLLATE utf8mb4_unicode_ci NOT NULL,
  `parameter_read` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `identifier_used` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `min_value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `max_value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `report_time_interval` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '12',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sinknode`
--

CREATE TABLE IF NOT EXISTS `sinknode` (
  `node_id` int(11) NOT NULL AUTO_INCREMENT,
  `station_id` int(11) NOT NULL,
  `date_sink` varchar(30) NOT NULL,
  `time_sink` varchar(30) NOT NULL,
  `ut_sink` varchar(30) NOT NULL,
  `gw_lat_sink` varchar(30) NOT NULL,
  `gw_long_sink` varchar(30) NOT NULL,
  `e64_sink` varchar(30) NOT NULL,
  `t_sink` varchar(30) NOT NULL,
  `ps_sink` varchar(30) NOT NULL,
  `up_sink` varchar(30) NOT NULL,
  `v_mcu_sink` varchar(30) NOT NULL,
  `v_in_sink` varchar(30) NOT NULL,
  `p_ms5611_sink` varchar(30) NOT NULL,
  `ttl_sink` varchar(30) NOT NULL,
  `rssi_sink` varchar(30) NOT NULL,
  `lqi_sink` varchar(30) NOT NULL,
  `drp_sink` varchar(30) NOT NULL,
  `txt_sink` varchar(30) NOT NULL,
  `seq_sink` varchar(10) NOT NULL DEFAULT 'SEQ',
  `txt_sink_value` varchar(30) NOT NULL,
  `node_status` enum('on','off') NOT NULL,
  `v_in_max_value` double NOT NULL,
  `v_in_min_value` double NOT NULL,
  `v_mcu_max_value` double NOT NULL,
  `v_mcu_min_value` double NOT NULL,
  `CreationDate` timestamp NULL DEFAULT NULL,
  `UpdateDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`node_id`),
  UNIQUE KEY `station_id` (`station_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `stations`
--

CREATE TABLE IF NOT EXISTS `stations` (
  `station_id` int(11) NOT NULL AUTO_INCREMENT,
  `StationName` varchar(30) NOT NULL,
  `StationNumber` varchar(30) DEFAULT NULL,
  `StationRegNumber` varchar(30) DEFAULT NULL,
  `Location` varchar(50) NOT NULL,
  `Indicator` varchar(30) DEFAULT NULL,
  `StationRegion` varchar(30) NOT NULL,
  `Country` varchar(30) NOT NULL DEFAULT 'Uganda',
  `Latitude` double NOT NULL,
  `Longitude` double NOT NULL,
  `Altitude` double DEFAULT NULL,
  `StationStatus` enum('on','off') NOT NULL DEFAULT 'on',
  `StationType` varchar(30) NOT NULL,
  `Opened` datetime DEFAULT NULL,
  `Closed` date DEFAULT NULL,
  `SubmittedBy` varchar(30) DEFAULT NULL,
  `Creation_Date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdateDate` timestamp NULL DEFAULT NULL,
  `stationCategory` enum('manual','aws') NOT NULL,
  PRIMARY KEY (`station_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `station_problem_settings`
--

CREATE TABLE IF NOT EXISTS `station_problem_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `problem_id` int(10) unsigned NOT NULL COMMENT 'Problem ids must not be repeated for any given station i.e a station must not have a duplicated problem_id',
  `station_id` int(11) NOT NULL,
  `max_track_counter` int(10) unsigned NOT NULL,
  `report_method` enum('sms','email','Both') COLLATE utf8mb4_unicode_ci NOT NULL,
  `reporting_time_interval` int(11) NOT NULL,
  `criticality` enum('Critical','Non Critical') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `problem_id` (`problem_id`),
  KEY `station_id` (`station_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `systemusers`
--

CREATE TABLE IF NOT EXISTS `systemusers` (
  `Userid` bigint(255) NOT NULL AUTO_INCREMENT,
  `station` int(11) NOT NULL DEFAULT '0',
  `region_zone` varchar(30) DEFAULT NULL COMMENT 'region or zone of the the user in charge of',
  `FirstName` varchar(100) NOT NULL,
  `SurName` varchar(100) NOT NULL,
  `UserName` varchar(50) NOT NULL,
  `UserPassword` varchar(255) NOT NULL,
  `UserRole` varchar(50) NOT NULL,
  `UserEmail` varchar(50) NOT NULL,
  `UserPhone` varchar(50) NOT NULL,
  `Active` bit(1) NOT NULL,
  `LoggedOn` bit(1) DEFAULT NULL,
  `Reset` bit(1) NOT NULL,
  `LastPasswdChange` datetime NOT NULL,
  `LastLoggedIn` datetime NOT NULL,
  `CreatedBy` varchar(100) NOT NULL,
  `CreationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `systemusers`
--

INSERT INTO `systemusers` (`Userid`, `station`, `region_zone`, `FirstName`, `SurName`, `UserName`, `UserPassword`, `UserRole`, `UserEmail`, `UserPhone`, `Active`, `LoggedOn`, `Reset`, `LastPasswdChange`, `LastLoggedIn`, `CreatedBy`, `CreationDate`) VALUES
(1, 0, NULL, 'Manager', 'WIMEA', 'manager', 'e10adc3949ba59abbe56e057f20f883e', 'ManagerData', 'mukwayanicholas.mn@gmail.com', '0783604580', b'1', NULL, b'0', '2018-07-04 00:00:00', '2018-07-04 00:00:00', 'manager', '2018-07-04 00:00:00');

--
-- Triggers `systemusers`
--
DROP TRIGGER IF EXISTS `update_data`;
DELIMITER //
CREATE TRIGGER `update_data` AFTER UPDATE ON `systemusers`
 FOR EACH ROW BEGIN
	
    IF (NEW.FirstName != OLD.FirstName) THEN
        INSERT INTO userlogs 
            (`data_id` , `field` , `old_value` , `new_value` , `Date`,`User`,`UserRole`,`Action`,`Details`,`station`,`IP`) 
        VALUES 
            (NEW.Userid, "Firstname", OLD.FirstName, NEW.FirstName, NOW(), @User,@UserRole,@Action,@Details,@station,@IP);
    END IF;
    IF (NEW.SurName != OLD.SurName) THEN
        INSERT INTO userlogs 
            (`data_id` , `field` , `old_value` , `new_value` , `Date`,`User`,`UserRole`,`Action`,`Details`,`station`,`IP`) 
        VALUES 
            (NEW.Userid, "Surname", OLD.Surname, NEW.Surname, NOW(), @User,@UserRole,@Action,@Details,@station,@IP);
    END IF;
    IF (NEW.UserEmail != OLD.UserEmail) THEN
        INSERT INTO userlogs  
            (`data_id` , `field` , `old_value` , `new_value` , `Date`,`User`,`UserRole`,`Action`,`Details`,`station`,`IP`) 
        VALUES 
            (NEW.Userid, "UserEmail", OLD.UserEmail, NEW.UserEmail, NOW(), @User,@UserRole,@Action,@Details,@station,@IP);
    END IF;
     IF (NEW.UserPhone != OLD.UserPhone) THEN
        INSERT INTO userlogs  
            (`data_id` , `field` , `old_value` , `new_value` , `Date`,`User`,`UserRole`,`Action`,`Details`,`station`,`IP`) 
        VALUES 
            (NEW.Userid, "UserPhone", OLD.UserPhone, NEW.UserPhone, NOW(), @User,@UserRole,@Action,@Details,@station,@IP);
    END IF;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tenmeternode`
--

CREATE TABLE IF NOT EXISTS `tenmeternode` (
  `node_id` int(11) NOT NULL AUTO_INCREMENT,
  `station_id` int(11) NOT NULL,
  `date_10m` varchar(30) NOT NULL,
  `time_10m` varchar(30) NOT NULL,
  `ut_10m` varchar(30) NOT NULL,
  `gw_lat_10m` varchar(30) NOT NULL,
  `gw_long_10m` varchar(30) NOT NULL,
  `e64_10m` varchar(30) NOT NULL,
  `ps_10m` varchar(30) NOT NULL,
  `v_mcu_10m` varchar(30) NOT NULL,
  `v_in_10m` varchar(30) NOT NULL,
  `v_a1_10m` varchar(30) NOT NULL,
  `v_a2_10m` varchar(30) NOT NULL,
  `v_a3_10m` varchar(30) NOT NULL DEFAULT 'V_A3',
  `p0_lst60_10m` varchar(30) NOT NULL DEFAULT 'P0_LST60',
  `ttl_10m` varchar(30) NOT NULL,
  `rssi_10m` varchar(30) NOT NULL,
  `lqi_10m` varchar(30) NOT NULL,
  `drp_10m` varchar(30) NOT NULL,
  `txt_10m` varchar(30) NOT NULL,
  `seq_10m` varchar(10) NOT NULL DEFAULT 'SEQ',
  `v_ad1_10m` varchar(10) NOT NULL DEFAULT 'V_AD1',
  `v_ad2_10m` varchar(10) NOT NULL DEFAULT 'V_AD2',
  `txt_10m_value` varchar(30) NOT NULL,
  `node_status` enum('on','off') NOT NULL,
  `v_in_max_value` double NOT NULL,
  `v_in_min_value` double NOT NULL,
  `v_mcu_max_value` double NOT NULL,
  `v_mcu_min_value` double NOT NULL,
  `CreationDate` timestamp NULL DEFAULT NULL,
  `UpdateDate` timestamp NULL DEFAULT NULL,
  UNIQUE KEY `node_id` (`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `twometernode`
--

CREATE TABLE IF NOT EXISTS `twometernode` (
  `node_id` int(11) NOT NULL AUTO_INCREMENT,
  `station_id` int(11) NOT NULL,
  `date_2m` varchar(30) NOT NULL,
  `time_2m` varchar(30) NOT NULL,
  `ut_2m` varchar(30) NOT NULL,
  `gw_lat_2m` varchar(30) NOT NULL,
  `gw_long_2m` varchar(30) NOT NULL,
  `v_mcu_2m` varchar(30) NOT NULL,
  `v_in_2m` varchar(30) NOT NULL,
  `ttl_2m` varchar(30) NOT NULL,
  `rssi_2m` varchar(30) NOT NULL,
  `lqi_2m` varchar(30) NOT NULL,
  `drp_2m` varchar(30) NOT NULL,
  `e64_2m` varchar(30) NOT NULL,
  `txt_2m` varchar(30) NOT NULL,
  `t_sht2x_2m` varchar(30) NOT NULL,
  `rh_sh2x_2m` varchar(30) NOT NULL,
  `seq_2m` varchar(10) NOT NULL DEFAULT 'SEQ',
  `txt_2m_value` varchar(30) NOT NULL,
  `node_status` enum('on','off') NOT NULL,
  `v_in_max_value` double NOT NULL,
  `v_in_min_value` double NOT NULL,
  `v_mcu_max_value` double NOT NULL,
  `v_mcu_min_value` double NOT NULL,
  `CreationDate` timestamp NULL DEFAULT NULL,
  `UpdateDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`node_id`),
  UNIQUE KEY `station_id` (`station_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `userlogs`
--

CREATE TABLE IF NOT EXISTS `userlogs` (
  `Date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_id` int(20) DEFAULT NULL,
  `station` int(11) DEFAULT NULL,
  `User` varchar(30) DEFAULT NULL,
  `UserRole` varchar(25) DEFAULT NULL,
  `Action` varchar(50) DEFAULT NULL,
  `Details` text,
  `field` varchar(45) DEFAULT NULL,
  `old_value` text,
  `new_value` text,
  `IP` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
