CREATE DATABASE  IF NOT EXISTS `taxi_reporting_ph` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `taxi_reporting_ph`;
-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: taxi_reporting_ph
-- ------------------------------------------------------
-- Server version	5.5.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_login`
--

DROP TABLE IF EXISTS `account_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_login` (
  `id` int(11) NOT NULL,
  `password` varchar(100) NOT NULL,
  `salt` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `account_login.idAccount` FOREIGN KEY (`id`) REFERENCES `account` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_login`
--

LOCK TABLES `account_login` WRITE;
/*!40000 ALTER TABLE `account_login` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_revision`
--

DROP TABLE IF EXISTS `account_revision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_revision` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idAccount` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `email` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `accountType` tinyint(4) NOT NULL,
  `isPasswordChanged` bit(1) NOT NULL,
  `isBanned` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `account_revision.idAccount_idx` (`idAccount`),
  CONSTRAINT `account_revision.idAccount` FOREIGN KEY (`idAccount`) REFERENCES `account` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_revision`
--

LOCK TABLES `account_revision` WRITE;
/*!40000 ALTER TABLE `account_revision` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_revision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_UNIQUE` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idAuthor` int(11) NOT NULL,
  `idReport` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comment.idAuthor_idx` (`idAuthor`),
  KEY `comment.idAeport_idx` (`idReport`),
  CONSTRAINT `comment.idAuthor` FOREIGN KEY (`idAuthor`) REFERENCES `account` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `comment.idReport` FOREIGN KEY (`idReport`) REFERENCES `report` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_revision`
--

DROP TABLE IF EXISTS `comment_revision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment_revision` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idComment` int(11) NOT NULL,
  `idReviser` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `comment` longtext NOT NULL,
  `nFlagged` tinyint(4) NOT NULL,
  `isDeleted` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comment_revision.idComment_idx` (`idComment`),
  KEY `comment_revision.idReviser_idx` (`idReviser`),
  CONSTRAINT `comment_revision.idComment` FOREIGN KEY (`idComment`) REFERENCES `comment` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `comment_revision.idReviser` FOREIGN KEY (`idReviser`) REFERENCES `account` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_revision`
--

LOCK TABLES `comment_revision` WRITE;
/*!40000 ALTER TABLE `comment_revision` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment_revision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facebook`
--

DROP TABLE IF EXISTS `facebook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facebook` (
  `id` int(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facebook`
--

LOCK TABLES `facebook` WRITE;
/*!40000 ALTER TABLE `facebook` DISABLE KEYS */;
/*!40000 ALTER TABLE `facebook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facebook_account`
--

DROP TABLE IF EXISTS `facebook_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facebook_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idAccount` int(11) NOT NULL,
  `idFacebook` int(20) NOT NULL,
  `startTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `endTimestamp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `facebook_account.idAccount_idx` (`idAccount`),
  KEY `facebook_account.idFacebook_idx` (`idFacebook`),
  CONSTRAINT `facebook_account.idAccount` FOREIGN KEY (`idAccount`) REFERENCES `account` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `facebook_account.idFacebook` FOREIGN KEY (`idFacebook`) REFERENCES `facebook` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facebook_account`
--

LOCK TABLES `facebook_account` WRITE;
/*!40000 ALTER TABLE `facebook_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `facebook_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `level`
--

DROP TABLE IF EXISTS `level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `level_UNIQUE` (`level`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `level`
--

LOCK TABLES `level` WRITE;
/*!40000 ALTER TABLE `level` DISABLE KEYS */;
INSERT INTO `level` VALUES (4,'high'),(2,'low'),(3,'medium'),(1,'no');
/*!40000 ALTER TABLE `level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idAuthor` int(11) NOT NULL,
  `idTaxi` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `report.idAuthor_idx` (`idAuthor`),
  KEY `report.idTaxi_idx` (`idTaxi`),
  CONSTRAINT `report.idAuthor` FOREIGN KEY (`idAuthor`) REFERENCES `account` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `report.idTaxi` FOREIGN KEY (`idTaxi`) REFERENCES `taxi` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report`
--

LOCK TABLES `report` WRITE;
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
/*!40000 ALTER TABLE `report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_revision`
--

DROP TABLE IF EXISTS `report_revision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_revision` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idReport` int(11) NOT NULL,
  `idReviser` int(11) NOT NULL,
  `idSubcategory` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `driverName` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `picture` longblob NOT NULL,
  `report` longtext NOT NULL,
  `nFlagged` tinyint(4) NOT NULL,
  `isDeleted` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `report_revision.idReport_idx` (`idReport`),
  KEY `report_revision.idReviser_idx` (`idReviser`),
  KEY `report_reviison.idSubcategory_idx` (`idSubcategory`),
  CONSTRAINT `report_reviison.idSubcategory` FOREIGN KEY (`idSubcategory`) REFERENCES `subcategory` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `report_revision.idReport` FOREIGN KEY (`idReport`) REFERENCES `report` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `report_revision.idReviser` FOREIGN KEY (`idReviser`) REFERENCES `account` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_revision`
--

LOCK TABLES `report_revision` WRITE;
/*!40000 ALTER TABLE `report_revision` DISABLE KEYS */;
/*!40000 ALTER TABLE `report_revision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcategory`
--

DROP TABLE IF EXISTS `subcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subcategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idCategory` int(11) NOT NULL,
  `idLevel` int(11) NOT NULL,
  `subcategory` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subcategory_UNIQUE` (`subcategory`),
  KEY `subcategory.idCategory_idx` (`idCategory`),
  KEY `subcategory.idLevel_idx` (`idLevel`),
  CONSTRAINT `subcategory.idCategory` FOREIGN KEY (`idCategory`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `subcategory.idLevel` FOREIGN KEY (`idLevel`) REFERENCES `level` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcategory`
--

LOCK TABLES `subcategory` WRITE;
/*!40000 ALTER TABLE `subcategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `subcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxi`
--

DROP TABLE IF EXISTS `taxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plateNumber` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `plateNumber_UNIQUE` (`plateNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxi`
--

LOCK TABLES `taxi` WRITE;
/*!40000 ALTER TABLE `taxi` DISABLE KEYS */;
/*!40000 ALTER TABLE `taxi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxi_revision`
--

DROP TABLE IF EXISTS `taxi_revision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxi_revision` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idTaxi` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `company` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `taxi_revision.idTaxi_idx` (`idTaxi`),
  CONSTRAINT `taxi_revision.idTaxi` FOREIGN KEY (`idTaxi`) REFERENCES `taxi` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxi_revision`
--

LOCK TABLES `taxi_revision` WRITE;
/*!40000 ALTER TABLE `taxi_revision` DISABLE KEYS */;
/*!40000 ALTER TABLE `taxi_revision` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-10-31 14:40:18
