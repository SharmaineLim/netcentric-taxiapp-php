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
  CONSTRAINT `account_login.id_account` FOREIGN KEY (`id`) REFERENCES `account` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
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
  `id_account` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `email` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `type_account` tinyint(4) NOT NULL,
  `is_password_changed` bit(1) NOT NULL,
  `is_banned` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `account_revision.id_account_idx` (`id_account`),
  CONSTRAINT `account_revision.id_account` FOREIGN KEY (`id_account`) REFERENCES `account` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
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
  `id_author` int(11) NOT NULL,
  `id_report` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comment.id_author_idx` (`id_author`),
  KEY `comment.id_aeport_idx` (`id_report`),
  CONSTRAINT `comment.id_author` FOREIGN KEY (`id_author`) REFERENCES `account` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `comment.id_report` FOREIGN KEY (`id_report`) REFERENCES `report` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
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
  `id_comment` int(11) NOT NULL,
  `id_reviser` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `comment` longtext NOT NULL,
  `n_flagged` tinyint(4) NOT NULL,
  `is_deleted` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comment_revision.id_comment_idx` (`id_comment`),
  KEY `comment_revision.id_reviser_idx` (`id_reviser`),
  CONSTRAINT `comment_revision.id_comment` FOREIGN KEY (`id_comment`) REFERENCES `comment` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `comment_revision.id_reviser` FOREIGN KEY (`id_reviser`) REFERENCES `account` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
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
  `id_account` int(11) NOT NULL,
  `id_facebook` int(20) NOT NULL,
  `start_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `end_timestamp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `facebook_account.id_account_idx` (`id_account`),
  KEY `facebook_account.id_facebook_idx` (`id_facebook`),
  CONSTRAINT `facebook_account.id_account` FOREIGN KEY (`id_account`) REFERENCES `account` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `facebook_account.id_facebook` FOREIGN KEY (`id_facebook`) REFERENCES `facebook` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
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
  `id_author` int(11) NOT NULL,
  `id_taxi` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `report.id_author_idx` (`id_author`),
  KEY `report.id_taxi_idx` (`id_taxi`),
  CONSTRAINT `report.id_author` FOREIGN KEY (`id_author`) REFERENCES `account` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `report.id_taxi` FOREIGN KEY (`id_taxi`) REFERENCES `taxi` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
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
  `id_report` int(11) NOT NULL,
  `id_reviser` int(11) NOT NULL,
  `id_subcategory` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `driver_name` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `picture` longblob NOT NULL,
  `report` longtext NOT NULL,
  `n_flagged` tinyint(4) NOT NULL,
  `is_deleted` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `report_revision.id_report_idx` (`id_report`),
  KEY `report_revision.id_reviser_idx` (`id_reviser`),
  KEY `report_reviison.id_subcategory_idx` (`id_subcategory`),
  CONSTRAINT `report_reviison.id_subcategory` FOREIGN KEY (`id_subcategory`) REFERENCES `subcategory` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `report_revision.id_report` FOREIGN KEY (`id_report`) REFERENCES `report` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `report_revision.id_reviser` FOREIGN KEY (`id_reviser`) REFERENCES `account` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
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
  `id_category` int(11) NOT NULL,
  `id_level` int(11) NOT NULL,
  `subcategory` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subcategory_UNIQUE` (`subcategory`),
  KEY `subcategory.id_category_idx` (`id_category`),
  KEY `subcategory.id_level_idx` (`id_level`),
  CONSTRAINT `subcategory.id_category` FOREIGN KEY (`id_category`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `subcategory.id_level` FOREIGN KEY (`id_level`) REFERENCES `level` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
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
  `plate_number` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `plate_number_UNIQUE` (`plate_number`)
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
  `id_taxi` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `company` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `taxi_revision.id_taxi_idx` (`id_taxi`),
  CONSTRAINT `taxi_revision.id_taxi` FOREIGN KEY (`id_taxi`) REFERENCES `taxi` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
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
