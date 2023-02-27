-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: grants
-- ------------------------------------------------------
-- Server version	5.7.28-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `grants_infor`
--

DROP TABLE IF EXISTS `grants_infor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grants_infor` (
  `grant_id` int(11) NOT NULL,
  `donor_code` varchar(45) DEFAULT NULL,
  `donor_name` varchar(255) DEFAULT NULL,
  `prime_recipient` varchar(255) DEFAULT NULL,
  `prime_award_number` varchar(255) DEFAULT NULL,
  `country_of_implementation` varchar(255) DEFAULT NULL,
  `implementation_startdate` varchar(25) DEFAULT NULL,
  `implementation_enddate` varchar(25) DEFAULT NULL,
  `obligation_enddate` varchar(25) DEFAULT NULL,
  `costshare_obligation` varchar(255) DEFAULT NULL,
  `grant_amount` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`grant_id`),
  KEY `donor_name_index` (`donor_name`),
  KEY `prime_recipient_index` (`prime_recipient`),
  KEY `prime_award_number_index` (`prime_award_number`),
  KEY `country_of_implementation_index` (`country_of_implementation`),
  KEY `implementation_startdate_index` (`implementation_startdate`),
  KEY `implementation_enddate_index` (`implementation_enddate`),
  KEY `obligation_enddate_index` (`obligation_enddate`),
  KEY `costshare_obligation_index` (`costshare_obligation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grants_infor`
--

LOCK TABLES `grants_infor` WRITE;
/*!40000 ALTER TABLE `grants_infor` DISABLE KEYS */;
INSERT INTO `grants_infor` VALUES (1,NULL,'USAID','Deloitte Limited','84478','Kenya','2021-05-01 12:00:00 AM','2026-04-30 12:00:00 AM','2026-04-30 12:00:00 AM',NULL,NULL);
/*!40000 ALTER TABLE `grants_infor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opts_applicable_indirect_cost`
--

DROP TABLE IF EXISTS `opts_applicable_indirect_cost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `opts_applicable_indirect_cost` (
  `id` varchar(12) NOT NULL,
  `cost` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cost_index` (`cost`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opts_applicable_indirect_cost`
--

LOCK TABLES `opts_applicable_indirect_cost` WRITE;
/*!40000 ALTER TABLE `opts_applicable_indirect_cost` DISABLE KEYS */;
INSERT INTO `opts_applicable_indirect_cost` VALUES ('10_perc_dem','10% de minimis'),('nicra','NICRA'),('na','Not applicable');
/*!40000 ALTER TABLE `opts_applicable_indirect_cost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opts_currency`
--

DROP TABLE IF EXISTS `opts_currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `opts_currency` (
  `code` varchar(5) NOT NULL,
  `currency` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`code`),
  KEY `currency_index` (`currency`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opts_currency`
--

LOCK TABLES `opts_currency` WRITE;
/*!40000 ALTER TABLE `opts_currency` DISABLE KEYS */;
INSERT INTO `opts_currency` VALUES ('AFN','Afghan afghani'),('ALL','Albanian lek'),('DZD','Algerian dinar'),('AOA','Angolan kwanza'),('ARS','Argentine peso'),('AMD','Armenian dram'),('AUD','Australian dollar'),('AZN','Azerbaijani manat'),('BSD','Bahamian dollar'),('BHD','Bahraini dinar'),('BDT','Bangladeshi taka'),('BBD','Barbadian dollar'),('BYN','Belarusian ruble'),('BZD','Belize dollar'),('BTN','Bhutanese ngultrum'),('BOB','Bolivian boliviano'),('BAM','Bosnia and Herzegovina convertible mark'),('BWP','Botswana pula'),('BRL','Brazilian real'),('BND','Brunei dollar'),('BGN','Bulgarian lev'),('BIF','Burundian franc'),('KHR','Cambodian riel'),('CAD','Canadian dollar'),('CVE','Cape Verdean escudo'),('XAF','Central African CFA franc'),('CLP','Chilean peso'),('CNY','Chinese yuan'),('COP','Colombian peso'),('KMF','Comorian franc'),('CDF','Congolese franc'),('CRC','Costa Rican colón'),('CUP','Cuban peso'),('CZK','Czech koruna'),('DKK','Danish krone'),('DJF','Djiboutian franc'),('DOP','Dominican peso'),('XCD','East Caribbean dollar'),('EGP','EGP'),('ERN','Eritrean nakfa'),('ETB','Ethiopian birr'),('EUR','Euro'),('FJD','Fijian dollar'),('GMD','Gambian dalasi'),('GEL','Georgian lari'),('GHS','Ghanaian cedi'),('GTQ','Guatemalan quetzal'),('GNF','Guinean franc'),('GYD','Guyanese dollar'),('HTG','Haitian gourde'),('HNL','Honduran lempira'),('HUF','Hungarian forint'),('ISK','Icelandic króna'),('INR','Indian rupee'),('IDR','Indonesian rupiah'),('IRR','Iranian rial'),('IQD','Iraqi dinar'),('ILS','Israeli new shekel'),('JMD','Jamaican dollar'),('JPY','Japanese yen'),('JOD','Jordanian dinar'),('KZT','Kazakhstani tenge'),('KES','Kenyan shilling'),('KWD','Kuwaiti dinar'),('KGS','Kyrgyzstani som'),('LAK','Lao kip'),('LBP','Lebanese pound'),('LSL','Lesotho loti'),('LRD','Liberian dollar'),('LYD','Libyan dinar'),('KPW','North Korean won'),('KRW','South Korean won'),('SZL','Swazi lilangeni'),('USD','United States dollar'),('XOF','West African CFA franc');
/*!40000 ALTER TABLE `opts_currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opts_entitytype`
--

DROP TABLE IF EXISTS `opts_entitytype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `opts_entitytype` (
  `id` varchar(5) NOT NULL,
  `entitytype` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entitytype_index` (`entitytype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opts_entitytype`
--

LOCK TABLES `opts_entitytype` WRITE;
/*!40000 ALTER TABLE `opts_entitytype` DISABLE KEYS */;
INSERT INTO `opts_entitytype` VALUES ('cbo','CBO'),('fbo','FBO'),('gov','Governmental'),('ngo','Non Governmental Organization'),('other','Other'),('shg','Self-Help Group'),('trust','Trust');
/*!40000 ALTER TABLE `opts_entitytype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opts_reportingfrequency`
--

DROP TABLE IF EXISTS `opts_reportingfrequency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `opts_reportingfrequency` (
  `id` varchar(5) NOT NULL,
  `reportingfrequency` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reportingfrequency_index` (`reportingfrequency`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opts_reportingfrequency`
--

LOCK TABLES `opts_reportingfrequency` WRITE;
/*!40000 ALTER TABLE `opts_reportingfrequency` DISABLE KEYS */;
INSERT INTO `opts_reportingfrequency` VALUES ('mon','Monthly'),('ondev','On deliverable'),('onmil','On milestone'),('qrt','Quarterly');
/*!40000 ALTER TABLE `opts_reportingfrequency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opts_subaward_type`
--

DROP TABLE IF EXISTS `opts_subaward_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `opts_subaward_type` (
  `id` varchar(12) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `type_index` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opts_subaward_type`
--

LOCK TABLES `opts_subaward_type` WRITE;
/*!40000 ALTER TABLE `opts_subaward_type` DISABLE KEYS */;
INSERT INTO `opts_subaward_type` VALUES ('fixed','Fixed Amount Award'),('other','Other'),('sub_agr','Sub Agreement'),('subcont','Sub Contract');
/*!40000 ALTER TABLE `opts_subaward_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subrecipient_infor`
--

DROP TABLE IF EXISTS `subrecipient_infor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subrecipient_infor` (
  `subrec_id` varchar(5) NOT NULL,
  `subrec_name` varchar(255) DEFAULT NULL,
  `subaward_number` varchar(45) DEFAULT NULL,
  `subaward_type` varchar(255) DEFAULT NULL,
  `subaward_type_other` varchar(255) DEFAULT NULL,
  `subaward_startdate` varchar(25) DEFAULT NULL,
  `subaward_enddate` varchar(25) DEFAULT NULL,
  `reportingcurrency` varchar(255) DEFAULT NULL,
  `reportingfrequency` varchar(255) DEFAULT NULL,
  `applicable_indirectcost` varchar(255) DEFAULT NULL,
  `pinnumber` varchar(255) DEFAULT NULL,
  `entity_type` varchar(255) DEFAULT NULL,
  `entity_type_other` varchar(255) DEFAULT NULL,
  `costshare_obligation` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`subrec_id`),
  KEY `subrec_name_index` (`subrec_name`),
  KEY `subaward_number_index` (`subaward_number`),
  KEY `subaward_type_index` (`subaward_type`),
  KEY `subaward_startdate_index` (`subaward_startdate`),
  KEY `subaward_enddate_index` (`subaward_enddate`),
  KEY `reportingcurrency_index` (`reportingcurrency`),
  KEY `applicable_indirectcost_index` (`applicable_indirectcost`),
  KEY `pinnumber_index` (`pinnumber`),
  KEY `entity_type_index` (`entity_type`),
  KEY `costshare_obligation_index` (`costshare_obligation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subrecipient_infor`
--

LOCK TABLES `subrecipient_infor` WRITE;
/*!40000 ALTER TABLE `subrecipient_infor` DISABLE KEYS */;
INSERT INTO `subrecipient_infor` VALUES ('jkjk','Gold Star Kenya','djfjKHGDKHa','fixed','hjgh','2022-01-03 12:00:00 AM','2026-03-30 12:00:00 AM','USD','qtr','nicra','PT-FSGFD898987','ngo','hjhg','hjgjhj');
/*!40000 ALTER TABLE `subrecipient_infor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-01  9:32:03
