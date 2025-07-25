-- MySQL dump 10.13  Distrib 8.0.42, for Linux (x86_64)
--
-- Host: localhost    Database: ops-ci
-- ------------------------------------------------------
-- Server version	8.0.42-0ubuntu0.24.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `announcement_settings`
--

DROP TABLE IF EXISTS `announcement_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcement_settings` (
  `announcement_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `announcement_id` bigint NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  PRIMARY KEY (`announcement_setting_id`),
  UNIQUE KEY `announcement_settings_unique` (`announcement_id`,`locale`,`setting_name`),
  KEY `announcement_settings_announcement_id` (`announcement_id`),
  CONSTRAINT `announcement_settings_announcement_id_foreign` FOREIGN KEY (`announcement_id`) REFERENCES `announcements` (`announcement_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='More data about announcements, including localized properties like names and contents.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcement_settings`
--

LOCK TABLES `announcement_settings` WRITE;
/*!40000 ALTER TABLE `announcement_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcement_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcement_type_settings`
--

DROP TABLE IF EXISTS `announcement_type_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcement_type_settings` (
  `announcement_type_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type_id` bigint NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL,
  PRIMARY KEY (`announcement_type_setting_id`),
  UNIQUE KEY `announcement_type_settings_unique` (`type_id`,`locale`,`setting_name`),
  KEY `announcement_type_settings_type_id` (`type_id`),
  CONSTRAINT `announcement_type_settings_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `announcement_types` (`type_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='More data about announcement types, including localized properties like their names.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcement_type_settings`
--

LOCK TABLES `announcement_type_settings` WRITE;
/*!40000 ALTER TABLE `announcement_type_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcement_type_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcement_types`
--

DROP TABLE IF EXISTS `announcement_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcement_types` (
  `type_id` bigint NOT NULL AUTO_INCREMENT,
  `context_id` bigint DEFAULT NULL,
  PRIMARY KEY (`type_id`),
  KEY `announcement_types_context_id` (`context_id`),
  CONSTRAINT `announcement_types_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Announcement types allow for announcements to optionally be categorized.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcement_types`
--

LOCK TABLES `announcement_types` WRITE;
/*!40000 ALTER TABLE `announcement_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcement_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcements` (
  `announcement_id` bigint NOT NULL AUTO_INCREMENT,
  `assoc_type` smallint DEFAULT NULL,
  `assoc_id` bigint DEFAULT NULL,
  `type_id` bigint DEFAULT NULL,
  `date_expire` date DEFAULT NULL,
  `date_posted` datetime NOT NULL,
  PRIMARY KEY (`announcement_id`),
  KEY `announcements_type_id` (`type_id`),
  KEY `announcements_assoc` (`assoc_type`,`assoc_id`),
  CONSTRAINT `announcements_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `announcement_types` (`type_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Announcements are messages that can be presented to users e.g. on the homepage.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `author_affiliation_settings`
--

DROP TABLE IF EXISTS `author_affiliation_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author_affiliation_settings` (
  `author_affiliation_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `author_affiliation_id` bigint NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  PRIMARY KEY (`author_affiliation_setting_id`),
  UNIQUE KEY `author_affiliation_settings_unique` (`author_affiliation_id`,`locale`,`setting_name`),
  CONSTRAINT `author_affiliation_settings_author_affiliation_id_foreign` FOREIGN KEY (`author_affiliation_id`) REFERENCES `author_affiliations` (`author_affiliation_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3 COMMENT='More data about author affiliations';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author_affiliation_settings`
--

LOCK TABLES `author_affiliation_settings` WRITE;
/*!40000 ALTER TABLE `author_affiliation_settings` DISABLE KEYS */;
INSERT INTO `author_affiliation_settings` VALUES (1,1,'en','name','University of Bologna'),(2,2,'en','name','University of Windsor'),(3,3,'en','name','University of Alberta'),(4,4,'en','name','University of Victoria'),(5,5,'en','name','University of Alberta'),(6,6,'en','name','University of Victoria'),(7,7,'en','name','Alexandria University'),(8,8,'en','name','University of Toronto'),(9,9,'en','name','University College Cork'),(10,10,'en','name','Indiana University'),(11,11,'en','name','Indiana University'),(12,12,'en','name','University of Rome'),(13,13,'en','name','University of Cape Town'),(14,14,'en','name','Aalborg University'),(15,15,'en','name','Stanford University'),(16,16,'en','name','Stanford University'),(17,17,'en','name','Australian National University'),(18,18,'en','name','University of Cape Town'),(19,19,'en','name','University of Wolverhampton'),(20,20,'en','name','University of Nairobi'),(21,21,'en','name','Barcelona University'),(22,22,'en','name','University of Tehran'),(23,23,'en','name','University of Windsor'),(24,24,'en','name','CUNY');
/*!40000 ALTER TABLE `author_affiliation_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `author_affiliations`
--

DROP TABLE IF EXISTS `author_affiliations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author_affiliations` (
  `author_affiliation_id` bigint NOT NULL AUTO_INCREMENT,
  `author_id` bigint NOT NULL,
  `ror` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`author_affiliation_id`),
  KEY `author_affiliations_ror` (`ror`),
  KEY `author_affiliations_author_id_foreign` (`author_id`),
  CONSTRAINT `author_affiliations_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `authors` (`author_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3 COMMENT='Author affiliations';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author_affiliations`
--

LOCK TABLES `author_affiliations` WRITE;
/*!40000 ALTER TABLE `author_affiliations` DISABLE KEYS */;
INSERT INTO `author_affiliations` VALUES (1,1,NULL),(2,2,NULL),(3,5,NULL),(4,6,NULL),(5,7,NULL),(6,8,NULL),(7,9,NULL),(8,10,NULL),(9,11,NULL),(10,12,NULL),(11,13,NULL),(12,14,NULL),(13,15,NULL),(14,16,NULL),(15,17,NULL),(16,18,NULL),(17,19,NULL),(18,20,NULL),(19,21,NULL),(20,22,NULL),(21,23,NULL),(22,24,NULL),(23,25,NULL),(24,26,NULL);
/*!40000 ALTER TABLE `author_affiliations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `author_settings`
--

DROP TABLE IF EXISTS `author_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author_settings` (
  `author_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `author_id` bigint NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  PRIMARY KEY (`author_setting_id`),
  UNIQUE KEY `author_settings_unique` (`author_id`,`locale`,`setting_name`),
  KEY `author_settings_author_id` (`author_id`),
  CONSTRAINT `author_settings_author_id` FOREIGN KEY (`author_id`) REFERENCES `authors` (`author_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb3 COMMENT='More data about authors, including localized properties such as their name and affiliation.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author_settings`
--

LOCK TABLES `author_settings` WRITE;
/*!40000 ALTER TABLE `author_settings` DISABLE KEYS */;
INSERT INTO `author_settings` VALUES (1,1,'','country','IT'),(2,1,'en','familyName','Corino'),(3,1,'en','givenName','Carlo'),(4,2,'','country','CA'),(5,2,'en','familyName','Kwantes'),(6,2,'en','givenName','Catherine'),(9,3,'','country','FI'),(10,3,'en','familyName','Kekkonen'),(11,3,'fr_CA','familyName',NULL),(12,3,'en','givenName','Urho'),(13,3,'fr_CA','givenName',NULL),(25,5,'','country','CA'),(26,5,'en','familyName','Montgomerie'),(27,5,'en','givenName','Craig'),(28,6,'','country','CA'),(29,6,'en','familyName','Irvine'),(30,6,'en','givenName','Mark'),(31,7,'','country','CA'),(32,7,'en','familyName','Montgomerie'),(33,7,'en','givenName','Craig'),(34,8,'','country','CA'),(35,8,'en','familyName','Irvine'),(36,8,'en','givenName','Mark'),(37,9,'','country','EG'),(38,9,'en','familyName','Diouf'),(39,9,'en','givenName','Diaga'),(40,10,'','country','CA'),(41,10,'en','familyName','Phillips'),(42,10,'en','givenName','Dana'),(43,11,'','country','IE'),(44,11,'en','familyName','Sokoloff'),(45,11,'en','givenName','Domatilia'),(46,12,'','country','US'),(47,12,'en','familyName','Ostrom'),(48,12,'en','givenName','Elinor'),(49,13,'','country','US'),(50,13,'en','familyName','van Laerhoven'),(51,13,'en','givenName','Frank'),(52,14,'','country','IT'),(53,14,'en','familyName','Paglieri'),(54,14,'en','givenName','Fabio'),(55,15,'','country','ZA'),(56,15,'en','familyName','Mwandenga'),(57,15,'en','givenName','John'),(58,16,'','country','DK'),(59,16,'en','familyName','Novak'),(60,16,'en','givenName','John'),(61,17,'','country','US'),(62,17,'en','familyName','Al-Khafaji'),(63,17,'en','givenName','Karim'),(64,18,'','country','US'),(65,18,'en','familyName','Morse'),(66,18,'en','givenName','Margaret'),(67,19,'','country','AU'),(68,19,'en','familyName','Christopher'),(69,19,'en','givenName','Leo'),(70,20,'','country','ZA'),(71,20,'en','familyName','Kumiega'),(72,20,'en','givenName','Lise'),(73,21,'','country','GB'),(74,21,'en','familyName','Daniel'),(75,21,'en','givenName','Patricia'),(76,22,'','country','KE'),(77,22,'en','familyName','Baiyewu'),(78,22,'en','givenName','Rana'),(79,23,'','country','ES'),(80,23,'en','familyName','Rossi'),(81,23,'en','givenName','Rosanna'),(82,24,'','country','IR'),(83,24,'en','familyName','Karbasizaed'),(84,24,'en','givenName','Vajiheh'),(85,25,'','country','CA'),(86,25,'en','familyName','Williamson'),(87,25,'en','givenName','Valerie'),(88,26,'','country','US'),(89,26,'en','familyName','Woods'),(90,26,'en','givenName','Zita');
/*!40000 ALTER TABLE `author_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authors` (
  `author_id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(90) NOT NULL,
  `include_in_browse` smallint NOT NULL DEFAULT '1',
  `publication_id` bigint NOT NULL,
  `seq` double NOT NULL DEFAULT '0',
  `user_group_id` bigint DEFAULT NULL,
  PRIMARY KEY (`author_id`),
  KEY `authors_user_group_id` (`user_group_id`),
  KEY `authors_publication_id` (`publication_id`),
  CONSTRAINT `authors_publication_id` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`publication_id`) ON DELETE CASCADE,
  CONSTRAINT `authors_user_group_id_foreign` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`user_group_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3 COMMENT='The authors of a publication.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES (1,'ccorino@mailinator.com',1,1,0,4),(2,'ckwantes@mailinator.com',1,2,0,4),(3,'notanemailukk@mailinator.com',1,2,1,4),(5,'cmontgomerie@mailinator.com',1,3,0,4),(6,'mirvine@mailinator.com',1,3,0,4),(7,'cmontgomerie@mailinator.com',1,4,0,4),(8,'mirvine@mailinator.com',1,4,0,4),(9,'ddiouf@mailinator.com',1,5,0,4),(10,'dphillips@mailinator.com',1,6,0,4),(11,'dsokoloff@mailinator.com',1,7,0,4),(12,'eostrom@mailinator.com',1,8,0,4),(13,'fvanlaerhoven@mailinator.com',1,8,0,4),(14,'fpaglieri@mailinator.com',1,9,0,4),(15,'jmwandenga@mailinator.com',1,10,0,4),(16,'jnovak@mailinator.com',1,11,0,4),(17,'kalkhafaji@mailinator.com',1,12,0,4),(18,'mmorse@mailinator.com',1,12,0,4),(19,'lchristopher@mailinator.com',1,13,0,4),(20,'lkumiega@mailinator.com',1,14,0,4),(21,'pdaniel@mailinator.com',1,15,0,4),(22,'rbaiyewu@mailinator.com',1,16,0,4),(23,'rrossi@mailinator.com',1,17,0,4),(24,'vkarbasizaed@mailinator.com',1,18,0,4),(25,'vwilliamson@mailinator.com',1,19,0,4),(26,'zwoods@mailinator.com',1,20,0,4);
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `category_id` bigint NOT NULL AUTO_INCREMENT,
  `context_id` bigint NOT NULL,
  `parent_id` bigint DEFAULT NULL,
  `seq` bigint DEFAULT NULL,
  `path` varchar(255) NOT NULL,
  `image` text,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_path` (`context_id`,`path`),
  KEY `category_context_id` (`context_id`),
  KEY `category_context_parent_id` (`context_id`,`parent_id`),
  KEY `category_parent_id` (`parent_id`),
  CONSTRAINT `categories_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE,
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`category_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COMMENT='Categories permit the organization of submissions into a heirarchical structure.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,1,NULL,1,'history',NULL),(2,1,NULL,2,'biology',NULL),(3,1,NULL,3,'social-sciences',NULL),(4,1,NULL,4,'mathematics',NULL),(5,1,1,10000,'cultural-history',NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_settings`
--

DROP TABLE IF EXISTS `category_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_settings` (
  `category_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `category_id` bigint NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  PRIMARY KEY (`category_setting_id`),
  UNIQUE KEY `category_settings_unique` (`category_id`,`locale`,`setting_name`),
  KEY `category_settings_category_id` (`category_id`),
  CONSTRAINT `category_settings_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3 COMMENT='More data about categories, including localized properties such as names.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_settings`
--

LOCK TABLES `category_settings` WRITE;
/*!40000 ALTER TABLE `category_settings` DISABLE KEYS */;
INSERT INTO `category_settings` VALUES (1,1,'','sortOption','title-ASC'),(2,1,'en','title','History'),(3,1,'fr_CA','title',''),(4,1,'en','description',''),(5,1,'fr_CA','description',''),(6,2,'','sortOption','title-ASC'),(7,2,'en','title','Biology'),(8,2,'fr_CA','title',''),(9,2,'en','description',''),(10,2,'fr_CA','description',''),(11,3,'','sortOption','title-ASC'),(12,3,'en','title','Social sciences'),(13,3,'fr_CA','title',''),(14,3,'en','description',''),(15,3,'fr_CA','description',''),(16,4,'','sortOption','title-ASC'),(17,4,'en','title','Mathematics'),(18,4,'fr_CA','title',''),(19,4,'en','description',''),(20,4,'fr_CA','description',''),(21,5,'','sortOption','title-ASC'),(22,5,'en','title','Cultural History'),(23,5,'fr_CA','title',''),(24,5,'en','description',''),(25,5,'fr_CA','description','');
/*!40000 ALTER TABLE `category_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `citation_settings`
--

DROP TABLE IF EXISTS `citation_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `citation_settings` (
  `citation_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `citation_id` bigint NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  `setting_type` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`citation_setting_id`),
  UNIQUE KEY `citation_settings_unique` (`citation_id`,`locale`,`setting_name`),
  KEY `citation_settings_citation_id` (`citation_id`),
  CONSTRAINT `citation_settings_citation_id` FOREIGN KEY (`citation_id`) REFERENCES `citations` (`citation_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Additional data about citations, including localized content.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citation_settings`
--

LOCK TABLES `citation_settings` WRITE;
/*!40000 ALTER TABLE `citation_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `citation_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `citations`
--

DROP TABLE IF EXISTS `citations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `citations` (
  `citation_id` bigint NOT NULL AUTO_INCREMENT,
  `publication_id` bigint NOT NULL,
  `raw_citation` text NOT NULL,
  `seq` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`citation_id`),
  UNIQUE KEY `citations_publication_seq` (`publication_id`,`seq`),
  KEY `citations_publication` (`publication_id`),
  CONSTRAINT `citations_publication` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`publication_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='A citation made by an associated publication.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citations`
--

LOCK TABLES `citations` WRITE;
/*!40000 ALTER TABLE `citations` DISABLE KEYS */;
/*!40000 ALTER TABLE `citations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `controlled_vocab_entries`
--

DROP TABLE IF EXISTS `controlled_vocab_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `controlled_vocab_entries` (
  `controlled_vocab_entry_id` bigint NOT NULL AUTO_INCREMENT,
  `controlled_vocab_id` bigint NOT NULL,
  `seq` double DEFAULT NULL,
  PRIMARY KEY (`controlled_vocab_entry_id`),
  KEY `controlled_vocab_entries_controlled_vocab_id` (`controlled_vocab_id`),
  KEY `controlled_vocab_entries_cv_id` (`controlled_vocab_id`,`seq`),
  CONSTRAINT `controlled_vocab_entries_controlled_vocab_id_foreign` FOREIGN KEY (`controlled_vocab_id`) REFERENCES `controlled_vocabs` (`controlled_vocab_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8mb3 COMMENT='The order that a word or phrase used in a controlled vocabulary should appear. For example, the order of keywords in a publication.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controlled_vocab_entries`
--

LOCK TABLES `controlled_vocab_entries` WRITE;
/*!40000 ALTER TABLE `controlled_vocab_entries` DISABLE KEYS */;
INSERT INTO `controlled_vocab_entries` VALUES (3,6,1),(4,6,2),(34,10,1),(35,10,2),(36,10,3),(37,10,4),(38,10,5),(39,10,6),(40,10,7),(41,10,8),(58,14,1),(59,14,2),(60,14,3),(61,14,4),(62,14,5),(63,14,6),(64,14,7),(65,14,8),(68,26,1),(69,26,2),(73,30,1),(74,30,2),(75,30,3),(77,42,1),(82,46,1),(83,46,2),(84,46,3),(85,46,4),(88,50,1),(89,50,2),(91,54,1),(102,58,1),(103,58,2),(104,58,3),(105,58,4),(106,58,5),(107,58,6),(108,58,7),(109,58,8),(110,58,9),(111,58,10),(114,66,1),(115,66,2),(119,74,1),(120,74,2),(121,74,3),(124,78,1),(125,78,2);
/*!40000 ALTER TABLE `controlled_vocab_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `controlled_vocab_entry_settings`
--

DROP TABLE IF EXISTS `controlled_vocab_entry_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `controlled_vocab_entry_settings` (
  `controlled_vocab_entry_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `controlled_vocab_entry_id` bigint NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  PRIMARY KEY (`controlled_vocab_entry_setting_id`),
  UNIQUE KEY `c_v_e_s_pkey` (`controlled_vocab_entry_id`,`locale`,`setting_name`),
  KEY `c_v_e_s_entry_id` (`controlled_vocab_entry_id`),
  CONSTRAINT `c_v_e_s_entry_id` FOREIGN KEY (`controlled_vocab_entry_id`) REFERENCES `controlled_vocab_entries` (`controlled_vocab_entry_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8mb3 COMMENT='More data about a controlled vocabulary entry, including localized properties such as the actual word or phrase.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controlled_vocab_entry_settings`
--

LOCK TABLES `controlled_vocab_entry_settings` WRITE;
/*!40000 ALTER TABLE `controlled_vocab_entry_settings` DISABLE KEYS */;
INSERT INTO `controlled_vocab_entry_settings` VALUES (3,3,'en','name','employees'),(4,4,'en','name','survey'),(34,34,'en','name','Integrating Technology'),(35,35,'en','name','Computer Skills'),(36,36,'en','name','Survey'),(37,37,'en','name','Alberta'),(38,38,'en','name','National'),(39,39,'en','name','Provincial'),(40,40,'en','name','Professional Development'),(41,41,'en','name','employees'),(58,58,'en','name','Integrating Technology'),(59,59,'en','name','Computer Skills'),(60,60,'en','name','Survey'),(61,61,'en','name','Alberta'),(62,62,'en','name','National'),(63,63,'en','name','Provincial'),(64,64,'en','name','Professional Development'),(65,65,'en','name','employees'),(68,68,'en','name','education'),(69,69,'en','name','citizenship'),(73,73,'en','name','Common pool resource'),(74,74,'en','name','common property'),(75,75,'en','name','intellectual developments'),(77,77,'en','name','water'),(82,82,'en','name','Development'),(83,83,'en','name','engineering education'),(84,84,'en','name','service learning'),(85,85,'en','name','sustainability'),(88,88,'en','name','pigs'),(89,89,'en','name','food security'),(91,91,'en','name','water'),(102,102,'en','name','21st Century'),(103,103,'en','name','Diversity'),(104,104,'en','name','Multilingual'),(105,105,'en','name','Multiethnic'),(106,106,'en','name','Participatory Pedagogy'),(107,107,'en','name','Language'),(108,108,'en','name','Culture'),(109,109,'en','name','Gender'),(110,110,'en','name','Egalitarianism'),(111,111,'en','name','Social Transformation'),(114,114,'en','name','cattle'),(115,115,'en','name','food security'),(119,119,'en','name','Self-Organization'),(120,120,'en','name','Multi-Level Institutions'),(121,121,'en','name','Goverance'),(124,124,'en','name','education'),(125,125,'en','name','citizenship');
/*!40000 ALTER TABLE `controlled_vocab_entry_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `controlled_vocabs`
--

DROP TABLE IF EXISTS `controlled_vocabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `controlled_vocabs` (
  `controlled_vocab_id` bigint NOT NULL AUTO_INCREMENT,
  `symbolic` varchar(64) NOT NULL,
  `assoc_type` bigint NOT NULL DEFAULT '0',
  `assoc_id` bigint DEFAULT NULL,
  PRIMARY KEY (`controlled_vocab_id`),
  UNIQUE KEY `controlled_vocab_symbolic` (`symbolic`,`assoc_type`,`assoc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb3 COMMENT='Every word or phrase used in a controlled vocabulary. Controlled vocabularies are used for submission metadata like keywords and subjects, reviewer interests, and wherever a similar dictionary of words or phrases is required. Each entry corresponds to a word or phrase like "cellular reproduction" and a type like "submissionKeyword".';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controlled_vocabs`
--

LOCK TABLES `controlled_vocabs` WRITE;
/*!40000 ALTER TABLE `controlled_vocabs` DISABLE KEYS */;
INSERT INTO `controlled_vocabs` VALUES (1,'interest',0,NULL),(5,'submissionAgency',1048588,1),(9,'submissionAgency',1048588,2),(13,'submissionAgency',1048588,3),(17,'submissionAgency',1048588,4),(21,'submissionAgency',1048588,5),(25,'submissionAgency',1048588,6),(29,'submissionAgency',1048588,7),(33,'submissionAgency',1048588,8),(37,'submissionAgency',1048588,9),(41,'submissionAgency',1048588,10),(45,'submissionAgency',1048588,11),(49,'submissionAgency',1048588,12),(53,'submissionAgency',1048588,13),(57,'submissionAgency',1048588,14),(61,'submissionAgency',1048588,15),(65,'submissionAgency',1048588,16),(69,'submissionAgency',1048588,17),(73,'submissionAgency',1048588,18),(77,'submissionAgency',1048588,19),(81,'submissionAgency',1048588,20),(4,'submissionDiscipline',1048588,1),(8,'submissionDiscipline',1048588,2),(12,'submissionDiscipline',1048588,3),(16,'submissionDiscipline',1048588,4),(20,'submissionDiscipline',1048588,5),(24,'submissionDiscipline',1048588,6),(28,'submissionDiscipline',1048588,7),(32,'submissionDiscipline',1048588,8),(36,'submissionDiscipline',1048588,9),(40,'submissionDiscipline',1048588,10),(44,'submissionDiscipline',1048588,11),(48,'submissionDiscipline',1048588,12),(52,'submissionDiscipline',1048588,13),(56,'submissionDiscipline',1048588,14),(60,'submissionDiscipline',1048588,15),(64,'submissionDiscipline',1048588,16),(68,'submissionDiscipline',1048588,17),(72,'submissionDiscipline',1048588,18),(76,'submissionDiscipline',1048588,19),(80,'submissionDiscipline',1048588,20),(2,'submissionKeyword',1048588,1),(6,'submissionKeyword',1048588,2),(10,'submissionKeyword',1048588,3),(14,'submissionKeyword',1048588,4),(18,'submissionKeyword',1048588,5),(22,'submissionKeyword',1048588,6),(26,'submissionKeyword',1048588,7),(30,'submissionKeyword',1048588,8),(34,'submissionKeyword',1048588,9),(38,'submissionKeyword',1048588,10),(42,'submissionKeyword',1048588,11),(46,'submissionKeyword',1048588,12),(50,'submissionKeyword',1048588,13),(54,'submissionKeyword',1048588,14),(58,'submissionKeyword',1048588,15),(62,'submissionKeyword',1048588,16),(66,'submissionKeyword',1048588,17),(70,'submissionKeyword',1048588,18),(74,'submissionKeyword',1048588,19),(78,'submissionKeyword',1048588,20),(3,'submissionSubject',1048588,1),(7,'submissionSubject',1048588,2),(11,'submissionSubject',1048588,3),(15,'submissionSubject',1048588,4),(19,'submissionSubject',1048588,5),(23,'submissionSubject',1048588,6),(27,'submissionSubject',1048588,7),(31,'submissionSubject',1048588,8),(35,'submissionSubject',1048588,9),(39,'submissionSubject',1048588,10),(43,'submissionSubject',1048588,11),(47,'submissionSubject',1048588,12),(51,'submissionSubject',1048588,13),(55,'submissionSubject',1048588,14),(59,'submissionSubject',1048588,15),(63,'submissionSubject',1048588,16),(67,'submissionSubject',1048588,17),(71,'submissionSubject',1048588,18),(75,'submissionSubject',1048588,19),(79,'submissionSubject',1048588,20);
/*!40000 ALTER TABLE `controlled_vocabs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_object_tombstone_oai_set_objects`
--

DROP TABLE IF EXISTS `data_object_tombstone_oai_set_objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_object_tombstone_oai_set_objects` (
  `object_id` bigint NOT NULL AUTO_INCREMENT,
  `tombstone_id` bigint NOT NULL,
  `assoc_type` bigint NOT NULL,
  `assoc_id` bigint NOT NULL,
  PRIMARY KEY (`object_id`),
  KEY `data_object_tombstone_oai_set_objects_tombstone_id` (`tombstone_id`),
  CONSTRAINT `data_object_tombstone_oai_set_objects_tombstone_id` FOREIGN KEY (`tombstone_id`) REFERENCES `data_object_tombstones` (`tombstone_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COMMENT='Relationships between tombstones and other data that can be collected in OAI sets, e.g. sections.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_object_tombstone_oai_set_objects`
--

LOCK TABLES `data_object_tombstone_oai_set_objects` WRITE;
/*!40000 ALTER TABLE `data_object_tombstone_oai_set_objects` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_object_tombstone_oai_set_objects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_object_tombstone_settings`
--

DROP TABLE IF EXISTS `data_object_tombstone_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_object_tombstone_settings` (
  `tombstone_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tombstone_id` bigint NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  PRIMARY KEY (`tombstone_setting_id`),
  UNIQUE KEY `data_object_tombstone_settings_unique` (`tombstone_id`,`locale`,`setting_name`),
  KEY `data_object_tombstone_settings_tombstone_id` (`tombstone_id`),
  CONSTRAINT `data_object_tombstone_settings_tombstone_id` FOREIGN KEY (`tombstone_id`) REFERENCES `data_object_tombstones` (`tombstone_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='More data about data object tombstones, including localized content.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_object_tombstone_settings`
--

LOCK TABLES `data_object_tombstone_settings` WRITE;
/*!40000 ALTER TABLE `data_object_tombstone_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_object_tombstone_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_object_tombstones`
--

DROP TABLE IF EXISTS `data_object_tombstones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_object_tombstones` (
  `tombstone_id` bigint NOT NULL AUTO_INCREMENT,
  `data_object_id` bigint NOT NULL,
  `date_deleted` datetime NOT NULL,
  `set_spec` varchar(255) NOT NULL,
  `set_name` varchar(255) NOT NULL,
  `oai_identifier` varchar(255) NOT NULL,
  PRIMARY KEY (`tombstone_id`),
  KEY `data_object_tombstones_data_object_id` (`data_object_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COMMENT='Entries for published data that has been removed. Usually used in the OAI endpoint.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_object_tombstones`
--

LOCK TABLES `data_object_tombstones` WRITE;
/*!40000 ALTER TABLE `data_object_tombstones` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_object_tombstones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doi_settings`
--

DROP TABLE IF EXISTS `doi_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doi_settings` (
  `doi_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `doi_id` bigint NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  PRIMARY KEY (`doi_setting_id`),
  UNIQUE KEY `doi_settings_unique` (`doi_id`,`locale`,`setting_name`),
  KEY `doi_settings_doi_id` (`doi_id`),
  CONSTRAINT `doi_settings_doi_id_foreign` FOREIGN KEY (`doi_id`) REFERENCES `dois` (`doi_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='More data about DOIs, including the registration agency.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doi_settings`
--

LOCK TABLES `doi_settings` WRITE;
/*!40000 ALTER TABLE `doi_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `doi_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dois`
--

DROP TABLE IF EXISTS `dois`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dois` (
  `doi_id` bigint NOT NULL AUTO_INCREMENT,
  `context_id` bigint NOT NULL,
  `doi` varchar(255) NOT NULL,
  `status` smallint NOT NULL DEFAULT '1',
  PRIMARY KEY (`doi_id`),
  KEY `dois_context_id` (`context_id`),
  CONSTRAINT `dois_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Stores all DOIs used in the system.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dois`
--

LOCK TABLES `dois` WRITE;
/*!40000 ALTER TABLE `dois` DISABLE KEYS */;
/*!40000 ALTER TABLE `dois` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edit_decisions`
--

DROP TABLE IF EXISTS `edit_decisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `edit_decisions` (
  `edit_decision_id` bigint NOT NULL AUTO_INCREMENT,
  `submission_id` bigint NOT NULL,
  `review_round_id` bigint DEFAULT NULL,
  `stage_id` bigint DEFAULT NULL,
  `round` smallint DEFAULT NULL,
  `editor_id` bigint NOT NULL,
  `decision` smallint NOT NULL COMMENT 'A numeric constant indicating the decision that was taken. Possible values are listed in the Decision class.',
  `date_decided` datetime NOT NULL,
  PRIMARY KEY (`edit_decision_id`),
  KEY `edit_decisions_submission_id` (`submission_id`),
  KEY `edit_decisions_editor_id` (`editor_id`),
  KEY `edit_decisions_review_round_id` (`review_round_id`),
  CONSTRAINT `edit_decisions_editor_id` FOREIGN KEY (`editor_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `edit_decisions_review_round_id_foreign` FOREIGN KEY (`review_round_id`) REFERENCES `review_rounds` (`review_round_id`) ON DELETE CASCADE,
  CONSTRAINT `edit_decisions_submission_id` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='Editorial decisions recorded on a submission, such as decisions to accept or decline the submission, as well as decisions to send for review, send to copyediting, request revisions, and more.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edit_decisions`
--

LOCK TABLES `edit_decisions` WRITE;
/*!40000 ALTER TABLE `edit_decisions` DISABLE KEYS */;
INSERT INTO `edit_decisions` VALUES (1,4,NULL,5,NULL,3,8,'2025-07-22 05:24:01'),(2,4,NULL,5,NULL,3,16,'2025-07-22 05:24:04'),(3,4,NULL,5,NULL,3,8,'2025-07-22 05:24:08');
/*!40000 ALTER TABLE `edit_decisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_log`
--

DROP TABLE IF EXISTS `email_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_log` (
  `log_id` bigint NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint NOT NULL,
  `assoc_id` bigint NOT NULL,
  `sender_id` bigint DEFAULT NULL,
  `date_sent` datetime NOT NULL,
  `event_type` bigint DEFAULT NULL,
  `from_address` varchar(255) DEFAULT NULL,
  `recipients` text,
  `cc_recipients` text,
  `bcc_recipients` text,
  `subject` varchar(255) DEFAULT NULL,
  `body` text,
  PRIMARY KEY (`log_id`),
  KEY `email_log_sender_id` (`sender_id`),
  KEY `email_log_assoc` (`assoc_type`,`assoc_id`),
  CONSTRAINT `email_log_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3 COMMENT='A record of email messages that are sent in relation to an associated entity, such as a submission.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_log`
--

LOCK TABLES `email_log` WRITE;
/*!40000 ALTER TABLE `email_log` DISABLE KEYS */;
INSERT INTO `email_log` VALUES (1,1048585,1,NULL,'2025-07-22 05:21:58',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Carlo Corino\" <ccorino@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Carlo Corino,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, The influence of lactation on the quantity and quality of cashmere production, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=1</p><p>If you have been logged out, you can login again with the username ccorino.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=1\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(2,1048585,2,NULL,'2025-07-22 05:22:53',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Catherine Kwantes\" <ckwantes@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Catherine Kwantes,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=2</p><p>If you have been logged out, you can login again with the username ckwantes.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=2\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(3,1048585,2,NULL,'2025-07-22 05:22:53',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Urho Kekkonen\" <notanemailukk@mailinator.com>','','','Submission Acknowledgement','<p>Dear Urho Kekkonen,</p><p>You have been named as a co-author on a preprint submitted to Public Knowledge Preprint Server. The submitter, Catherine Kwantes, provided the following details:</p><p>The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence<br></p><p>If any of these details are incorrect, or you do not wish to be named on this preprint, please contact me.</p><p>Thank you for considering this server as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(4,1048585,3,NULL,'2025-07-22 05:23:17',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Craig Montgomerie\" <cmontgomerie@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Craig Montgomerie,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=3</p><p>If you have been logged out, you can login again with the username cmontgomerie.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=3\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(5,1048585,3,NULL,'2025-07-22 05:23:17',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Mark Irvine\" <mirvine@mailinator.com>','','','Submission Acknowledgement','<p>Dear Mark Irvine,</p><p>You have been named as a co-author on a preprint submitted to Public Knowledge Preprint Server. The submitter, Craig Montgomerie, provided the following details:</p><p>Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice<br></p><p>If any of these details are incorrect, or you do not wish to be named on this preprint, please contact me.</p><p>Thank you for considering this server as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(6,1048585,4,NULL,'2025-07-22 05:23:57',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Diaga Diouf\" <ddiouf@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Diaga Diouf,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Genetic transformation of forest trees, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=4</p><p>If you have been logged out, you can login again with the username ddiouf.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=4\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(7,1048585,4,3,'2025-07-22 05:24:01',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Diaga Diouf\" <ddiouf@mailinator.com>','','','Your submission has been declined','<p>Dear Diaga Diouf,</p><p>I’m sorry to inform you that, after reviewing your submission, \"Genetic transformation of forest trees\", the editor has found that it does not meet our requirements for publication in Public Knowledge Preprint Server.</p><p>I wish you success if you consider submitting your work elsewhere.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(8,1048585,4,3,'2025-07-22 05:24:04',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Diaga Diouf\" <ddiouf@mailinator.com>','','','We have reversed the decision to decline your submission','<p>Dear Diaga Diouf,</p>\n<p>The decision to decline your submission, Genetic transformation of forest trees, has been reversed. \nA moderator will look further at your submission before deciding whether to decline \nor post the submission.</p>\n<p>Occasionally, a decision to decline a submission will be recorded accidentally in \nour system and must be reverted. I apologize for any confusion this may have caused.</p>\n<p>We will contact you if we need any further assistance.</p>\n<p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=4\">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p><p>Daniel Barnes</p></p>'),(9,1048585,4,3,'2025-07-22 05:24:08',805306369,'\"Daniel Barnes\" <dbarnes@mailinator.com>','\"Diaga Diouf\" <ddiouf@mailinator.com>','','','Your submission has been declined','<p>Dear Diaga Diouf,</p><p>I’m sorry to inform you that, after reviewing your submission, \"Genetic transformation of forest trees\", the editor has found that it does not meet our requirements for publication in Public Knowledge Preprint Server.</p><p>I wish you success if you consider submitting your work elsewhere.</p><p>Kind regards,</p><p>Daniel Barnes</p>'),(10,1048585,5,NULL,'2025-07-22 05:24:27',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Dana Phillips\" <dphillips@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Dana Phillips,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=5</p><p>If you have been logged out, you can login again with the username dphillips.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=5\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(11,1048585,6,NULL,'2025-07-22 05:24:54',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Domatilia Sokoloff\" <dsokoloff@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Domatilia Sokoloff,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Developing efficacy beliefs in the classroom, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=6</p><p>If you have been logged out, you can login again with the username dsokoloff.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=6\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(12,1048585,7,NULL,'2025-07-22 05:25:16',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Elinor Ostrom\" <eostrom@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Elinor Ostrom,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Developing efficacy beliefs in the classroom, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=7</p><p>If you have been logged out, you can login again with the username eostrom.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=7\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(13,1048585,7,NULL,'2025-07-22 05:25:16',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Frank van Laerhoven\" <fvanlaerhoven@mailinator.com>','','','Submission Acknowledgement','<p>Dear Frank van Laerhoven,</p><p>You have been named as a co-author on a preprint submitted to Public Knowledge Preprint Server. The submitter, Elinor Ostrom, provided the following details:</p><p>Developing efficacy beliefs in the classroom<br></p><p>If any of these details are incorrect, or you do not wish to be named on this preprint, please contact me.</p><p>Thank you for considering this server as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(14,1048585,8,NULL,'2025-07-22 05:25:37',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Fabio Paglieri\" <fpaglieri@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Fabio Paglieri,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Hansen & Pinto: Reason Reclaimed, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=8</p><p>If you have been logged out, you can login again with the username fpaglieri.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=8\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(15,1048585,9,NULL,'2025-07-22 05:25:58',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"John Mwandenga\" <jmwandenga@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear John Mwandenga,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=9</p><p>If you have been logged out, you can login again with the username jmwandenga.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=9\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(16,1048585,10,NULL,'2025-07-22 05:26:19',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"John Novak\" <jnovak@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear John Novak,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Condensing Water Availability Models to Focus on Specific Water Management Systems, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=10</p><p>If you have been logged out, you can login again with the username jnovak.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=10\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(17,1048585,11,NULL,'2025-07-22 05:26:41',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Karim Al-Khafaji\" <kalkhafaji@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Karim Al-Khafaji,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Learning Sustainable Design through Service, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=11</p><p>If you have been logged out, you can login again with the username kalkhafaji.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=11\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(18,1048585,11,NULL,'2025-07-22 05:26:41',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Margaret Morse\" <mmorse@mailinator.com>','','','Submission Acknowledgement','<p>Dear Margaret Morse,</p><p>You have been named as a co-author on a preprint submitted to Public Knowledge Preprint Server. The submitter, Karim Al-Khafaji, provided the following details:</p><p>Learning Sustainable Design through Service<br></p><p>If any of these details are incorrect, or you do not wish to be named on this preprint, please contact me.</p><p>Thank you for considering this server as a venue for your work.</p><p>Kind regards,</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(19,1048585,12,NULL,'2025-07-22 05:27:03',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Leo Christopher\" <lchristopher@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Leo Christopher,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Sodium butyrate improves growth performance of weaned piglets during the first period after weaning, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=12</p><p>If you have been logged out, you can login again with the username lchristopher.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=12\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(20,1048585,13,NULL,'2025-07-22 05:27:24',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Lise Kumiega\" <lkumiega@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Lise Kumiega,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=13</p><p>If you have been logged out, you can login again with the username lkumiega.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=13\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(21,1048585,14,NULL,'2025-07-22 05:27:45',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Patricia Daniel\" <pdaniel@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Patricia Daniel,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=14</p><p>If you have been logged out, you can login again with the username pdaniel.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=14\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(22,1048585,15,NULL,'2025-07-22 05:28:06',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Rana Baiyewu\" <rbaiyewu@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Rana Baiyewu,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Yam diseases and its management in Nigeria, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=15</p><p>If you have been logged out, you can login again with the username rbaiyewu.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=15\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(23,1048585,16,NULL,'2025-07-22 05:28:28',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Rosanna Rossi\" <rrossi@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Rosanna Rossi,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=16</p><p>If you have been logged out, you can login again with the username rrossi.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=16\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(24,1048585,17,NULL,'2025-07-22 05:28:49',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Vajiheh Karbasizaed\" <vkarbasizaed@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Vajiheh Karbasizaed,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=17</p><p>If you have been logged out, you can login again with the username vkarbasizaed.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=17\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(25,1048585,18,NULL,'2025-07-22 05:29:10',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Valerie Williamson\" <vwilliamson@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Valerie Williamson,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Self-Organization in Multi-Level Institutions in Networked Environments, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=18</p><p>If you have been logged out, you can login again with the username vwilliamson.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=18\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(26,1048585,19,NULL,'2025-07-22 05:29:32',536870914,'\"Ramiro Vaca\" <rvaca@mailinator.com>','\"Zita Woods\" <zwoods@mailinator.com>','','','Thank you for your submission to Public Knowledge Preprint Server','<p>Dear Zita Woods,</p><p>Thank you for your submission to Public Knowledge Preprint Server. We have received your preprint, Finocchiaro: Arguments About Arguments, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=19</p><p>If you have been logged out, you can login again with the username zwoods.</p><p>If you have any questions, please contact me from your <a href=\"http://localhost/index.php/publicknowledge/en/dashboard/mySubmissions?workflowSubmissionId=19\">submission dashboard</a>.</p><p>Thank you for considering Public Knowledge Preprint Server as a venue for your work.</p><br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>');
/*!40000 ALTER TABLE `email_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_log_users`
--

DROP TABLE IF EXISTS `email_log_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_log_users` (
  `email_log_user_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email_log_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`email_log_user_id`),
  UNIQUE KEY `email_log_user_id` (`email_log_id`,`user_id`),
  KEY `email_log_users_email_log_id` (`email_log_id`),
  KEY `email_log_users_user_id` (`user_id`),
  CONSTRAINT `email_log_users_email_log_id_foreign` FOREIGN KEY (`email_log_id`) REFERENCES `email_log` (`log_id`) ON DELETE CASCADE,
  CONSTRAINT `email_log_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3 COMMENT='A record of users associated with an email log entry.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_log_users`
--

LOCK TABLES `email_log_users` WRITE;
/*!40000 ALTER TABLE `email_log_users` DISABLE KEYS */;
INSERT INTO `email_log_users` VALUES (1,1,7),(2,2,8),(3,4,9),(4,6,10),(5,7,10),(6,8,10),(7,9,10),(8,10,11),(9,11,12),(10,12,13),(11,14,14),(12,15,15),(13,16,16),(14,17,17),(15,19,18),(16,20,19),(17,21,20),(18,22,21),(19,23,22),(20,24,23),(21,25,24),(22,26,25);
/*!40000 ALTER TABLE `email_log_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_templates`
--

DROP TABLE IF EXISTS `email_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_templates` (
  `email_id` bigint NOT NULL AUTO_INCREMENT,
  `email_key` varchar(255) NOT NULL COMMENT 'Unique identifier for this email.',
  `context_id` bigint NOT NULL,
  `alternate_to` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`email_id`),
  UNIQUE KEY `email_templates_email_key` (`email_key`,`context_id`),
  KEY `email_templates_context_id` (`context_id`),
  KEY `email_templates_alternate_to` (`alternate_to`),
  CONSTRAINT `email_templates_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='Custom email templates created by each context, and overrides of the default templates.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates`
--

LOCK TABLES `email_templates` WRITE;
/*!40000 ALTER TABLE `email_templates` DISABLE KEYS */;
INSERT INTO `email_templates` VALUES (1,'EDITOR_ASSIGN_PRODUCTION',1,'DISCUSSION_NOTIFICATION_PRODUCTION');
/*!40000 ALTER TABLE `email_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_templates_default_data`
--

DROP TABLE IF EXISTS `email_templates_default_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_templates_default_data` (
  `email_templates_default_data_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email_key` varchar(255) NOT NULL COMMENT 'Unique identifier for this email.',
  `locale` varchar(28) NOT NULL DEFAULT 'en',
  `name` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `body` text,
  PRIMARY KEY (`email_templates_default_data_id`),
  UNIQUE KEY `email_templates_default_data_unique` (`email_key`,`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb3 COMMENT='Default email templates created for every installed locale.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates_default_data`
--

LOCK TABLES `email_templates_default_data` WRITE;
/*!40000 ALTER TABLE `email_templates_default_data` DISABLE KEYS */;
INSERT INTO `email_templates_default_data` VALUES (1,'PASSWORD_RESET_CONFIRM','en','Password Reset Confirm','Password Reset Confirmation','We have received a request to reset your password for the {$siteTitle} web site.<br />\n<br />\nIf you did not make this request, please ignore this email and your password will not be changed. If you wish to reset your password, click on the below URL.<br />\n<br />\nReset my password: {$passwordResetUrl}<br />\n<br />\n{$siteContactName}'),(3,'USER_REGISTER','en','User Created','Server Registration','{$recipientName}<br />\n<br />\nYou have now been registered as a user with {$serverName}. We have included your username and password in this email, which are needed for all work with this server through its website. At any point, you can ask to be removed from the server\'s list of users by contacting me.<br />\n<br />\nUsername: {$recipientUsername}<br />\nPassword: {$password}<br />\n<br />\nThank you,<br />\n{$signature}'),(5,'USER_VALIDATE_CONTEXT','en','Validate Email (Server Registration)','Validate Your Account','{$recipientName}<br />\n<br />\nYou have created an account with {$serverName}, but before you can start using it, you need to validate your email account. To do this, simply follow the link below:<br />\n<br />\n{$activateUrl}<br />\n<br />\nThank you,<br />\n{$serverSignature}'),(7,'USER_VALIDATE_SITE','en','Validate Email (Site)','Validate Your Account','{$recipientName}<br />\n<br />\nYou have created an account with {$siteTitle}, but before you can start using it, you need to validate your email account. To do this, simply follow the link below:<br />\n<br />\n{$activateUrl}<br />\n<br />\nThank you,<br />\n{$siteSignature}'),(9,'SUBMISSION_ACK','en','Submission Acknowledgement (Pending Moderation)','Thank you for your submission to {$serverName}','<p>Dear {$recipientName},</p><p>Thank you for your submission to {$serverName}. We have received your preprint, {$submissionTitle}, and a moderator  will see it soon. Once the moderator has reviewed your submission, they will post your preprint or contact you.</p><p>You can view your submission and track its progress through the editorial process at the following location:</p><p>Submission URL: {$authorSubmissionUrl}</p><p>If you have been logged out, you can login again with the username {$recipientUsername}.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>Thank you for considering {$serverName} as a venue for your work.</p>{$serverSignature}'),(11,'POSTED_ACK','en','Posted Acknowledgement','Preprint Posted Acknowledgement','{$recipientName}:<br />\n<br />\nYour preprint, &quot;{$submissionTitle}&quot; has been posted online on {$serverName}.<br />\n<br />\nPreprint URL: {$submissionUrl}<br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\n{$signature}'),(13,'POSTED_NEW_VERSION_ACK','en','New Version Posted','New Version Posted Acknowledgement','<p>Dear {$recipientName},</p><p>Thank you for posting a new version of your preprint to {$serverName}. The new version is now <a href=\"{$submissionPublishedUrl}\">available</a>.</p><p>If you have any questions, please contact me.</p>{$signature}'),(15,'SUBMISSION_ACK_CAN_POST','en','Submission Acknowledgement (No Moderation Required)','Thank you for your submission to {$serverName}','<p>Dear {$recipientName},</p><p>Thank you for your submission to {$serverName}. This is an automated message to let you know that we have received your preprint, {$submissionTitle}. As a trusted author, no moderation is required, so we invite you to <a href=\"{$authorSubmissionUrl}\">post your preprint</a> as soon as you are ready.</p><p>If you have been logged out, you can login again with the username {$recipientUsername}.</p><p>Thank you for considering {$serverName} as a venue for your work.</p>{$serverSignature}'),(17,'SUBMISSION_ACK_NOT_USER','en','Submission Confirmation (Other Authors)','Submission Acknowledgement','<p>Dear {$recipientName},</p><p>You have been named as a co-author on a preprint submitted to {$serverName}. The submitter, {$submitterName}, provided the following details:</p><p>{$submissionTitle}<br>{$authorsWithAffiliation}</p><p>If any of these details are incorrect, or you do not wish to be named on this preprint, please contact me.</p><p>Thank you for considering this server as a venue for your work.</p><p>Kind regards,</p>{$serverSignature}'),(19,'EDITOR_ASSIGN','en','Editor Assigned','You have been assigned as a moderator on a submission to {$serverName}','<p>Dear {$recipientName},</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>Please login to <a href=\"{$submissionUrl}\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p>{$serverSignature}'),(21,'EDITOR_DECISION_ACCEPT','en','Submission Accepted','Your submission has passed moderation at {$serverName}','<p>Dear {$recipientName},</p><p>I am pleased to inform you that a moderator has decided to accept your preprint at {$serverName}. We found your submission, {$submissionTitle}, to meet the requirements for preprints posted to {$serverName} and thank you for choosing our server as a venue for your work.</p><p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p><p>Kind regards,</p>{$signature}'),(23,'EDITOR_DECISION_INITIAL_DECLINE','en','Submission Declined','Your submission has been declined','<p>Dear {$recipientName},</p><p>I’m sorry to inform you that, after reviewing your submission, \"{$submissionTitle}\", the editor has found that it does not meet our requirements for publication in {$serverName}.</p><p>I wish you success if you consider submitting your work elsewhere.</p><p>Kind regards,</p>{$signature}'),(25,'EDITOR_DECISION_REVERT_INITIAL_DECLINE','en','Reinstate Submission Declined Without Review','We have reversed the decision to decline your submission','<p>Dear {$recipientName},</p>\n<p>The decision to decline your submission, {$submissionTitle}, has been reversed. \nA moderator will look further at your submission before deciding whether to decline \nor post the submission.</p>\n<p>Occasionally, a decision to decline a submission will be recorded accidentally in \nour system and must be reverted. I apologize for any confusion this may have caused.</p>\n<p>We will contact you if we need any further assistance.</p>\n<p>If you have any questions, please contact me from your <a href=\"{$authorSubmissionUrl}\">submission dashboard</a>.</p>\n<p>Kind regards,</p>\n<p>{$signature}</p>\n'),(27,'EDITOR_DECISION_NOTIFY_OTHER_AUTHORS','en','Notify Other Authors','An update regarding your submission','<p>The following email was sent to {$submittingAuthorName} from {$serverName} regarding \"{$submissionTitle}\".</p>\n<p>You are receiving a copy of this notification because you are identified as an author of the submission. Any instructions in the message below are intended for the submitting author, {$submittingAuthorName}, and no action is required of you at this time.</p>\n\n{$messageToSubmittingAuthor}'),(29,'STATISTICS_REPORT_NOTIFICATION','en','Statistics Report Notification','Preprint Server activity for {$month}, {$year}','\n{$recipientName}, <br />\n<br />\nYour preprint health report for {$month}, {$year} is now available. Your key stats for this month are below.<br />\n<ul>\n	<li>New submissions this month: {$newSubmissions}</li>\n	<li>Declined submissions this month: {$declinedSubmissions}</li>\n	<li>Accepted submissions this month: {$acceptedSubmissions}</li>\n	<li>Total submissions in the system: {$totalSubmissions}</li>\n</ul>\nLogin to the the preprint server to view more detailed <a href=\"{$editorialStatsLink}\">trends</a> and <a href=\"{$publicationStatsLink}\">posted preprint stats</a>. A full copy of this month\'s trends is attached.<br />\n<br />\nSincerely,<br />\n{$serverSignature}'),(31,'ANNOUNCEMENT','en','New Announcement','{$announcementTitle}','<b>{$announcementTitle}</b><br />\n<br />\n{$announcementSummary}<br />\n<br />\nVisit our website to read the <a href=\"{$announcementUrl}\">full announcement</a>.'),(33,'DISCUSSION_NOTIFICATION_PRODUCTION','en','Discussion (Production)','A message regarding {$serverName}','Please enter your message.'),(35,'EDITOR_ASSIGN_PRODUCTION','en','Editor Assigned','You have been assigned as a moderator on a submission to {$serverName}','<p>Dear {$recipientName},</p><p>The following preprint has been assigned to you to see through the screening process in your role as Moderator.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>Please login to <a href=\"{$submissionUrl}\">view the preprint</a>. Use the Discussions section to contact the author if you have any questions. Please post the preprint once you are satisfied that it meets all requirements.</p><p>Thank you in advance.</p><p>Kind regards,</p>{$serverSignature}'),(37,'VERSION_CREATED','en','Version Created','A new version was created for \"{$submissionTitle}\"','<p>Dear {$recipientName}, </p><p>This is an automated message to inform you that a new version of your submission, \"{$submissionTitle}\", was created. You can view this version from your submission dashboard at the following link:</p><p><a href=\"{$submissionUrl}\">\"{$submissionTitle}\"</a></p><hr><p>This is an automatic email sent from <a href=\"{$serverUrl}\">{$serverName}</a>.</p>'),(39,'SUBMISSION_SAVED_FOR_LATER','en','Submission Saved for Later','Resume your submission to {$serverName}','<p>Dear {$recipientName},</p><p>Your submission details have been saved in our system, but it has not yet been submitted for consideration. You can return to complete your submission at any time by following the link below.</p><p><a href=\"{$submissionWizardUrl}\">{$authorsShort} — \"{$submissionTitle}\"</a></p><hr><p>This is an automated email from <a href=\"{$serverUrl}\">{$serverName}</a>.</p>'),(41,'SUBMISSION_NEEDS_EDITOR','en','Submission Needs Editor','A new submission needs an editor to be assigned: \"{$submissionTitle}\"','<p>Dear {$recipientName},</p><p>The following submission has been submitted and there is no editor assigned.</p><p><a href=\"{$submissionUrl}\">\"{$submissionTitle}\"</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>Please assign an editor who will be responsible for the submission by clicking the title above and assigning an editor under the Participants section.</p><hr><p>This is an automated email from <a href=\"{$serverUrl}\">{$serverName}</a>.</p>'),(43,'CHANGE_EMAIL','en','Change Email Address Invitation','Confirm account contact email change request','<p>Dear {$recipientName},</p><p>You are receiving this email because someone has requested a change of your email to {$newEmail}.</p><p>If you have made this request please <a href=\"{$acceptInvitationUrl}\">confirm</a> the email change.</p><p>You can always <a href=\"{$declineInvitationUrl}\">reject</a> this email change.</p><p>Please feel free to contact me with any questions about the submission or the review process.</p><p>Kind regards,</p>{$siteContactName}'),(45,'ORCID_COLLECT_AUTHOR_ID','en','orcidCollectAuthorId','Submission ORCID','Dear {$recipientName},<br/>\n<br/>\nYou have been listed as an author on a manuscript submission to {$serverName}.<br/>\nTo confirm your authorship, please add your ORCID id to this submission by visiting the link provided below.<br/>\n<br/>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://info.orcid.org/wp-content/uploads/2020/12/ORCIDiD_icon16x16.png\" width=\'16\' height=\'16\' alt=\"ORCID iD icon\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Register or connect your ORCID iD</a><br/>\n<br/>\n<br>\n<a href=\"{$orcidAboutUrl}\">More information about ORCID at {$serverName}</a><br/>\n<br/>\nIf you have any questions, please contact me.<br/>\n<br/>\n{$principalContactSignature}<br/>\n'),(47,'ORCID_REQUEST_AUTHOR_AUTHORIZATION','en','orcidRequestAuthorAuthorization','Requesting ORCID record access','Dear {$recipientName},<br>\n<br>\nYou have been listed as an author on the manuscript submission \"{$submissionTitle}\" to {$serverName}.\n<br>\n<br>\nPlease allow us to add your ORCID id to this submission and also to add the submission to your ORCID profile on publication.<br>\nVisit the link to the official ORCID website, login with your profile and authorize the access by following the instructions.<br>\n<br>\n<a href=\"{$authorOrcidUrl}\" style=\"display: inline-flex; align-items: center; background-color: white; text-align: center; padding: 10px 20px; text-decoration: none; border-radius: 5px; border: 2px solid #d7d4d4;\"><img id=\"orcid-id-logo\" src=\"https://info.orcid.org/wp-content/uploads/2020/12/ORCIDiD_icon16x16.png\" width=\'16\' height=\'16\' alt=\"ORCID iD icon\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Register or Connect your ORCID iD</a><br/>\n<br>\n<br>\nClick here to verify your account with ORCID: <a href=\"{$authorOrcidUrl}\">{$authorOrcidUrl}.</a>\n<br>\n<br>\n<a href=\"{$orcidAboutUrl}\">More about ORCID at {$serverName}</a><br/>\n<br>\n<br>\nIf you have any questions, please contact me.<br>\n<br>\n{$principalContactSignature}<br>\n'),(49,'USER_ROLE_ASSIGNMENT_INVITATION','en','User Invited to Role Notification','You are invited to new roles','<div class=\'email-container\'>    <div class=\'email-header\'>        <h2>Invitation to New Role</h2>    </div>    <div class=\'email-content\'>        <p>Dear {$recipientName},</p>        <p>In light of your expertise, you have been invited by {$inviterName} to take on new roles at {$serverName}</p>        <p>At {$serverName}, we value your privacy. As such, we have taken steps to ensure that we are fully GDPR compliant. These steps include you being accountable to enter your own data and choosing who can see what information. For additional information on how we handled your data, please refer to our Privacy Policy.</p>        <div>{$existingRoles}</div>        <div>{$rolesAdded}</div>        <p>On accepting the invite, you will be redirected to {$serverName}.</p>        <p>Feel free to contact me with any questions about the process.</p>        <p><a href=\'{$acceptUrl}\' class=\'btn btn-accept\'>Accept Invitation</a></p>        <p><a href=\'{$declineUrl}\' class=\'btn btn-decline\'>Decline Invitation</a></p>        <p>Kind regards,</p>        <p>{$serverName}</p>    </div></div><style>{$emailTemplateStyle}</style>'),(51,'USER_ROLE_END','en','User Role Ended Notification','You have been removed from a role','<div class=\'email-container\'>    <div class=\'email-header\'>        <h2>Removed from a Role</h2>    </div>    <div class=\'email-content\'>        <p>Dear {$recipientName},</p>        <p>Thank you very much for your participation in the role of {$roleRemoved} at {$serverName}.</p>        <p>This is a notice to let you know that you have been removed from the following role at {$serverName}: <b>{$roleRemoved}</b>.</p>        <p>Your account with {$serverName} is still active and any other roles you previously held are still active.</p>        <p>Feel free to contact me with any questions about the process.</p>        <p>Kind regards,</p>        <p>{$serverName}</p>    </div></div><style>{$emailTemplateStyle}</style>'),(53,'ORCID_REQUEST_UPDATE_SCOPE','en','orcidRequestUpdateScope','Requesting updated ORCID record access','Dear {$recipientName},<br>\n<br>\nYou are listed as a contributor (author or reviewer) on the manuscript submission \"{$submissionTitle}\" to {$serverName}.\n<br>\n<br>\nYou have previously authorized {$serverName} to list your ORCID id on the site, and we require updateded permissions to add your contribution to your ORCID profile.<br>\nVisit the link to the official ORCID website, login with your profile and authorize the access by following the instructions.<br>\n<br>\n<a href=\"{$authorOrcidUrl}\" style=\"display: inline-flex; align-items: center; background-color: white; text-align: center; padding: 10px 20px; text-decoration: none; border-radius: 5px; border: 2px solid #d7d4d4;\"><img id=\"orcid-id-logo\" src=\"https://info.orcid.org/wp-content/uploads/2020/12/ORCIDiD_icon16x16.png\" width=\'16\' height=\'16\' alt=\"ORCID iD icon\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Register or Connect your ORCID iD</a><br/>\n<br>\n<br>\nClick here to update your account with ORCID: <a href=\"{$authorOrcidUrl}\">{$authorOrcidUrl}.</a>\n<br>\n<br>\n<a href=\"{$orcidAboutUrl}\">More about ORCID at {$serverName}</a><br/>\n<br>\n<br>\nIf you have any questions, please contact me.<br>\n<br>\n{$principalContactSignature}<br>\n'),(82,'PASSWORD_RESET_CONFIRM','fr_CA','Confirmation de la réinitialisation du mot de passe','Confirmation de la réinitialisation du mot de passe','Nous avons reçu une demande concernant la réinitialisation de votre mot de passe pour le site Web {$siteTitle}.<br />\n<br />\nSi vous n\'avez pas fait cette demande, veuillez ne pas tenir compte du présent message, votre mot de passe restera le même. Si vous souhaitez réinitialiser votre mot de passe, cliquer sur l\'URL ci-dessous.<br />\n<br />\nRéinitialisation de mon mot de passe : {$passwordResetUrl}<br />\n<br />\n{$siteContactName}'),(83,'USER_REGISTER','fr_CA','Création de l\'utilisateur-trice','Inscription au serveur','{$recipientName},<br />\n<br />\nVous êtes désormais inscrit-e en tant qu\'utilisateur-trice pour {$serverName}. Votre nom d\'utilisateur-trice et votre mot de passe figurent dans ce courriel, lesquels sont requis pour toute interaction avec le serveur via son site Web. À n\'importe quel moment, vous pouvez demander à être retiré-e de la liste des utilisateurs-trices du serveur en nous contactant.<br />\n<br />\nNom d\'utilisateur-trice : {$recipientUsername}<br />\nMot de passe : {$password}<br />\n<br />\nMerci,<br />\n{$signature}'),(84,'USER_VALIDATE_CONTEXT','fr_CA','','Valider votre compte','{$recipientName},<br />\n<br />\nVous avez créé un compte avec {$serverName}. Pour pouvoir commencer à l\'utiliser vous devez d\'abord valider votre compte de courriel. Pour ce faire, vous n\'avez qu\'à suivre le lien ci-dessous :<br />\n<br />\n{$activateUrl}<br />\n<br />\nMerci,<br />\n{$serverSignature}'),(85,'USER_VALIDATE_SITE','fr_CA','Valider le courriel (site)','',''),(86,'SUBMISSION_ACK','fr_CA','Confirmation de soumission','Accusé de réception de la soumission à {$serverName}','<p>{$recipientName},</p><p>Nous vous remercions d\'avoir soumis le manuscrit intitulé « {$submissionTitle} » à la revue {$serverName}. Nous l\'avons bien reçu et un membre de notre équipe éditorial le prendre en charge sous peu. Grâce à notre système de gestion en ligne, vous pourrez suivre votre soumission tout au long du processus d\'édition en accédant au site Web de la revue :</p>\n<br />\nURL de la soumission : {$submissionUrl}<br />\nNom d\'utilisateur-trice : {$recipientUsername}<br />\n<br />\nSi vous avez des questions, n\'hésitez pas à communiquer avec nous. Nous vous remercions d\'avoir pensé à notre revue pour la publication de vos travaux.<br />\n<br />\n{$serverSignature}'),(87,'POSTED_ACK','fr_CA','','',''),(88,'POSTED_NEW_VERSION_ACK','fr_CA','','',''),(89,'SUBMISSION_ACK_CAN_POST','fr_CA','','Accusé de réception de la soumission à {$serverName}',''),(90,'SUBMISSION_ACK_NOT_USER','fr_CA','Confirmation de soumission (autres auteur-es)','Accusé de réception de la soumission','Bonjour,<br />\n<br />\nLe manuscrit intitulé , « {$submissionTitle} » , a été soumis par {$submitterName} à {$serverName}.<br />\n<br />\nSi vous avez des questions, n\'hésitez pas à communiquer avec nous. Nous vous remercions d\'avoir pensé à {$serverName} pour la publication de vos travaux.<br />\n<br />\n{$serverSignature}'),(91,'EDITOR_ASSIGN','fr_CA','Rédacteur-trice assigné','',''),(92,'EDITOR_DECISION_ACCEPT','fr_CA','Soumission acceptée','',''),(93,'EDITOR_DECISION_INITIAL_DECLINE','fr_CA','Soumission refusée avant évaluation','Décision du rédacteur','<p>{$recipientName},</p><p>Nous avons le regret de vous informer qu\'après avoir évaluer votre manuscrit, {$submissionTitle}, le-la rédacteur-trice en a conclue qu\'il ne rencontre pas les exigences nécessaires pour être publier dans {$serverName}.</p><p>Cordialement,</p>{$signature}'),(94,'EDITOR_DECISION_REVERT_INITIAL_DECLINE','fr_CA','Rétablir une soumission refusée sans évaluation','Nous avons renversé la décision de rejeter votre soumission','<p>{$recipientName},</p>\n<p>La décision de rejeter votre soumission, {$submissionTitle}, a été renversée. Un-e modérateur-trice évaluera votre soumission dans les détails afin de décider si votre soumission sera rejetée ou pourra être envoyée en évaluation.</p>\n<p>Si vous avez des questions, vous pouvez nous contacter sur votre <a href=\"{$authorSubmissionUrl}\">tableau de bord de soumissions</a>.</p>\n<p>Cordialement,</p>\n<p>{$signature}</p>\n'),(95,'EDITOR_DECISION_NOTIFY_OTHER_AUTHORS','fr_CA','Envoyer une notification aux autres auteur-es','Mise à jour concernant votre soumission','<p>Ce courriel a été envoyé à {$submittingAuthorName} par {$serverName} concernant {$submissionTitle}.</p>\n<p>Vous recevez une copie de cet avis car vous êtes identifié comme auteur-e de cette soumission. Toutes les instructions dans le message ci-dessous sont à l\'intention de l\'auteur-e de correspondance, {$submittingAuthorName}. </p><p>Aucune action n\'est attendue de votre part.</p>\n\n{$messageToSubmittingAuthor}'),(96,'STATISTICS_REPORT_NOTIFICATION','fr_CA','Notification sur les rapports statistiques','',''),(97,'ANNOUNCEMENT','fr_CA','Nouvelle annonce','',''),(98,'DISCUSSION_NOTIFICATION_PRODUCTION','fr_CA','Discussion (production)','Un message à propos de la revue {$serverName}','Prière de saisir votre message.'),(99,'EDITOR_ASSIGN_PRODUCTION','fr_CA','Rédacteur-trice assigné','',''),(100,'VERSION_CREATED','fr_CA','Version créée','Une nouvelle version a été créée pour {$submissionTitle}','<p>{$recipientName}, </p><p>Ceci est un courriel automatique de <a href=\"{$serverUrl}\">{$serverName}</a> pour vous informer qu\'une nouvelle version de votre soumission, {$submissionTitle}, a été créée. Vous pouvez consulter cette version à partir de votre tableau de bord de soumission:</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a></p><hr>'),(101,'SUBMISSION_SAVED_FOR_LATER','fr_CA','Soumission incomplète sauvegardée','Reprendre votre soumission à {$serverName}','<p>{$recipientName},</p><p>Les détails de votre soumission ont été enregistrés, mais vous ne l\'avez pas encore finalisée. Vous pouvez le faire en cliquant sur le lien ci-dessous: </p><p><a href=\"{$submissionWizardUrl}\">{$authorsShort} — {$submissionTitle}</a></p><hr><p>Ceci est un message automatique de <a href=\"{$serverUrl}\">{$serverName}</a>.</p>'),(102,'SUBMISSION_NEEDS_EDITOR','fr_CA','Soumission en attente de rédacteur-trice','Un-e rédacteur-trice doit être assigné-e à la nouvelle soumission : {$submissionTitle}','<p>{$recipientName},</p><p>La soumission suivante a été soumise et aucun-e rédacteur-trice ne lui est assigné-e.</p><p><a href=\"{$submissionUrl}\">{$submissionTitle}</a><br />{$authors}</p><p><b>Abstract</b></p>{$submissionAbstract}<p>S\'il vous plait, assignez un-e rédacteur-trice qui sera responsable de la soumission. </p><hr><p>Ceci est un courriel automatique de <a href=\"{$serverUrl}\">{$serverName}</a>.</p>'),(103,'CHANGE_EMAIL','fr_CA','Changer l\'adresse courriel d\'invitation','',''),(104,'ORCID_COLLECT_AUTHOR_ID','fr_CA','orcidCollectAuthorId','Soumission ORCID','{$recipientName},<br/>\n<br/>\nVous avez été inscrit ou inscrite en tant qu\'auteur ou auteure pour un manuscrit soumis à {$serverName}.<br/>\nPour confirmer votre statut d\'auteur ou d\'auteure, veuillez ajouter votre identifiant ORCID à cette soumission en cliquant sur le lien ci-dessous.<br/>\n<br/>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://info.orcid.org/wp-content/uploads/2020/12/ORCIDiD_icon16x16.png\" width=\'16\' height=\'16\' alt=\"icône identifiant ORCID\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Se connecter avec votre identifiant ORCID ou s\'inscrire</a><br/>\n<br/>\n<br/>\n<a href=\"{$orcidAboutUrl}\">Plus de renseignements sur votre identifiant ORCID dans {$serverName}</a><br/>\n<br/>\nSi vous avez des questions, veuillez communiquer avec nous.<br/>\n<br/>\n{$principalContactSignature}<br/>\n'),(105,'ORCID_REQUEST_AUTHOR_AUTHORIZATION','fr_CA','orcidRequestAuthorAuthorization','Demande d\'accès au dossier ORCID','{$recipientName},<br/>\n<br/>\nVous avez été inscrit ou inscrite en tant qu\'auteur ou auteure pour le manuscrit « {$submissionTitle} » soumis à {$serverName}.\n<br/>\n<br/>\nVeuillez nous autoriser à ajouter votre identifiant ORCID à cette soumission et à ajouter également la soumission à votre dossier ORCID suite à sa publication.\n<br/>\nSuivre le lien vers le site officiel ORCID, vous connecter avec votre profil et autoriser l\'accès en suivant les instructions.<br/>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://info.orcid.org/wp-content/uploads/2020/12/ORCIDiD_icon16x16.png\" width=\'16\' height=\'16\' alt=\"icône identifiant ORCID\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Se connecter avec votre identifiant ORCID ou s\'inscrire</a><br/>\n<br/>\n<br/>\n<a href=\"{$orcidAboutUrl}\">Plus de renseignements sur votre identifiant ORCID dans {$serverName}</a><br/>\n<br/>\nSi vous avez des questions, veuillez communiquer avec nous.<br/>\n<br/>\n{$principalContactSignature}<br/>\n'),(106,'USER_ROLE_ASSIGNMENT_INVITATION','fr_CA','','',''),(107,'USER_ROLE_END','fr_CA','','',''),(108,'ORCID_REQUEST_UPDATE_SCOPE','fr_CA','','','');
/*!40000 ALTER TABLE `email_templates_default_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_templates_settings`
--

DROP TABLE IF EXISTS `email_templates_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_templates_settings` (
  `email_template_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email_id` bigint NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  PRIMARY KEY (`email_template_setting_id`),
  UNIQUE KEY `email_templates_settings_unique` (`email_id`,`locale`,`setting_name`),
  KEY `email_templates_settings_email_id` (`email_id`),
  CONSTRAINT `email_templates_settings_email_id` FOREIGN KEY (`email_id`) REFERENCES `email_templates` (`email_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='More data about custom email templates, including localized properties such as the subject and body.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates_settings`
--

LOCK TABLES `email_templates_settings` WRITE;
/*!40000 ALTER TABLE `email_templates_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_templates_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_log`
--

DROP TABLE IF EXISTS `event_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_log` (
  `log_id` bigint NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint NOT NULL,
  `assoc_id` bigint NOT NULL,
  `user_id` bigint DEFAULT NULL COMMENT 'NULL if it''s system or automated event',
  `date_logged` datetime NOT NULL,
  `event_type` bigint DEFAULT NULL,
  `message` text,
  `is_translated` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `event_log_user_id` (`user_id`),
  KEY `event_log_assoc` (`assoc_type`,`assoc_id`),
  CONSTRAINT `event_log_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=utf8mb3 COMMENT='A log of all events related to an object like a submission.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_log`
--

LOCK TABLES `event_log` WRITE;
/*!40000 ALTER TABLE `event_log` DISABLE KEYS */;
INSERT INTO `event_log` VALUES (1,1048585,1,7,'2025-07-22 05:21:45',268435458,'submission.event.general.metadataUpdated',0),(2,1048585,1,7,'2025-07-22 05:21:46',268435458,'submission.event.general.metadataUpdated',0),(3,515,1,7,'2025-07-22 05:21:55',1342177281,'submission.event.fileUploaded',0),(4,1048585,1,7,'2025-07-22 05:21:55',1342177288,'submission.event.fileRevised',0),(5,515,1,7,'2025-07-22 05:21:57',1342177296,'submission.event.fileEdited',0),(6,1048585,1,7,'2025-07-22 05:21:58',268435457,'submission.event.submissionSubmitted',0),(7,1048585,2,8,'2025-07-22 05:22:05',268435458,'submission.event.general.metadataUpdated',0),(8,1048585,2,8,'2025-07-22 05:22:05',268435458,'submission.event.general.metadataUpdated',0),(9,1048585,2,8,'2025-07-22 05:22:20',268435458,'submission.event.general.metadataUpdated',0),(10,515,2,8,'2025-07-22 05:22:28',1342177281,'submission.event.fileUploaded',0),(11,1048585,2,8,'2025-07-22 05:22:28',1342177288,'submission.event.fileRevised',0),(12,515,2,8,'2025-07-22 05:22:30',1342177296,'submission.event.fileEdited',0),(13,1048585,2,8,'2025-07-22 05:22:52',268435457,'submission.event.submissionSubmitted',0),(14,1048585,2,3,'2025-07-22 05:22:58',268435462,'publication.event.published',0),(15,1048585,3,9,'2025-07-22 05:23:04',268435458,'submission.event.general.metadataUpdated',0),(16,1048585,3,9,'2025-07-22 05:23:04',268435458,'submission.event.general.metadataUpdated',0),(17,515,3,9,'2025-07-22 05:23:13',1342177281,'submission.event.fileUploaded',0),(18,1048585,3,9,'2025-07-22 05:23:13',1342177288,'submission.event.fileRevised',0),(19,515,3,9,'2025-07-22 05:23:15',1342177296,'submission.event.fileEdited',0),(20,1048585,3,9,'2025-07-22 05:23:17',268435457,'submission.event.submissionSubmitted',0),(21,1048585,3,3,'2025-07-22 05:23:20',268435462,'publication.event.published',0),(22,1048585,3,3,'2025-07-22 05:23:24',268435463,'publication.event.unpublished',0),(23,1048585,3,3,'2025-07-22 05:23:26',268435458,'submission.event.general.metadataUpdated',0),(24,1048585,3,3,'2025-07-22 05:23:28',268435462,'publication.event.published',0),(25,1048585,3,3,'2025-07-22 05:23:31',268435458,'submission.event.general.metadataUpdated',0),(26,1048585,3,3,'2025-07-22 05:23:31',268435464,'publication.event.versionCreated',0),(27,1048585,3,3,'2025-07-22 05:23:39',268435462,'publication.event.versionPublished',0),(28,1048585,4,10,'2025-07-22 05:23:45',268435458,'submission.event.general.metadataUpdated',0),(29,1048585,4,10,'2025-07-22 05:23:45',268435458,'submission.event.general.metadataUpdated',0),(30,515,4,10,'2025-07-22 05:23:54',1342177281,'submission.event.fileUploaded',0),(31,1048585,4,10,'2025-07-22 05:23:54',1342177288,'submission.event.fileRevised',0),(32,515,4,10,'2025-07-22 05:23:56',1342177296,'submission.event.fileEdited',0),(33,1048585,4,10,'2025-07-22 05:23:57',268435457,'submission.event.submissionSubmitted',0),(34,1048585,4,3,'2025-07-22 05:24:01',805306371,'editor.submission.decision.decline.log',0),(35,1048585,4,3,'2025-07-22 05:24:04',805306371,'editor.submission.decision.revertDecline.log',0),(36,1048585,4,3,'2025-07-22 05:24:08',805306371,'editor.submission.decision.decline.log',0),(37,1048585,5,11,'2025-07-22 05:24:14',268435458,'submission.event.general.metadataUpdated',0),(38,1048585,5,11,'2025-07-22 05:24:15',268435458,'submission.event.general.metadataUpdated',0),(39,515,5,11,'2025-07-22 05:24:24',1342177281,'submission.event.fileUploaded',0),(40,1048585,5,11,'2025-07-22 05:24:24',1342177288,'submission.event.fileRevised',0),(41,515,5,11,'2025-07-22 05:24:26',1342177296,'submission.event.fileEdited',0),(42,1048585,5,11,'2025-07-22 05:24:26',268435457,'submission.event.submissionSubmitted',0),(43,1048585,5,3,'2025-07-22 05:24:30',268435462,'publication.event.published',0),(44,1048585,5,3,'2025-07-22 05:24:32',268435463,'publication.event.unpublished',0),(45,1048585,5,3,'2025-07-22 05:24:37',268435462,'publication.event.published',0),(46,1048585,6,12,'2025-07-22 05:24:42',268435458,'submission.event.general.metadataUpdated',0),(47,1048585,6,12,'2025-07-22 05:24:42',268435458,'submission.event.general.metadataUpdated',0),(48,515,6,12,'2025-07-22 05:24:51',1342177281,'submission.event.fileUploaded',0),(49,1048585,6,12,'2025-07-22 05:24:51',1342177288,'submission.event.fileRevised',0),(50,515,6,12,'2025-07-22 05:24:54',1342177296,'submission.event.fileEdited',0),(51,1048585,6,12,'2025-07-22 05:24:54',268435457,'submission.event.submissionSubmitted',0),(52,1048585,6,3,'2025-07-22 05:24:58',268435462,'publication.event.published',0),(53,1048585,7,13,'2025-07-22 05:25:03',268435458,'submission.event.general.metadataUpdated',0),(54,1048585,7,13,'2025-07-22 05:25:04',268435458,'submission.event.general.metadataUpdated',0),(55,515,7,13,'2025-07-22 05:25:12',1342177281,'submission.event.fileUploaded',0),(56,1048585,7,13,'2025-07-22 05:25:13',1342177288,'submission.event.fileRevised',0),(57,515,7,13,'2025-07-22 05:25:15',1342177296,'submission.event.fileEdited',0),(58,1048585,7,13,'2025-07-22 05:25:16',268435457,'submission.event.submissionSubmitted',0),(59,1048585,7,3,'2025-07-22 05:25:19',268435462,'publication.event.published',0),(60,1048585,8,14,'2025-07-22 05:25:25',268435458,'submission.event.general.metadataUpdated',0),(61,1048585,8,14,'2025-07-22 05:25:25',268435458,'submission.event.general.metadataUpdated',0),(62,515,8,14,'2025-07-22 05:25:34',1342177281,'submission.event.fileUploaded',0),(63,1048585,8,14,'2025-07-22 05:25:34',1342177288,'submission.event.fileRevised',0),(64,515,8,14,'2025-07-22 05:25:36',1342177296,'submission.event.fileEdited',0),(65,1048585,8,14,'2025-07-22 05:25:37',268435457,'submission.event.submissionSubmitted',0),(66,1048585,8,3,'2025-07-22 05:25:40',268435462,'publication.event.published',0),(67,1048585,9,15,'2025-07-22 05:25:46',268435458,'submission.event.general.metadataUpdated',0),(68,1048585,9,15,'2025-07-22 05:25:46',268435458,'submission.event.general.metadataUpdated',0),(69,515,9,15,'2025-07-22 05:25:55',1342177281,'submission.event.fileUploaded',0),(70,1048585,9,15,'2025-07-22 05:25:55',1342177288,'submission.event.fileRevised',0),(71,515,9,15,'2025-07-22 05:25:57',1342177296,'submission.event.fileEdited',0),(72,1048585,9,15,'2025-07-22 05:25:58',268435457,'submission.event.submissionSubmitted',0),(73,1048585,9,3,'2025-07-22 05:26:02',268435462,'publication.event.published',0),(74,1048585,10,16,'2025-07-22 05:26:07',268435458,'submission.event.general.metadataUpdated',0),(75,1048585,10,16,'2025-07-22 05:26:07',268435458,'submission.event.general.metadataUpdated',0),(76,515,10,16,'2025-07-22 05:26:16',1342177281,'submission.event.fileUploaded',0),(77,1048585,10,16,'2025-07-22 05:26:16',1342177288,'submission.event.fileRevised',0),(78,515,10,16,'2025-07-22 05:26:19',1342177296,'submission.event.fileEdited',0),(79,1048585,10,16,'2025-07-22 05:26:19',268435457,'submission.event.submissionSubmitted',0),(80,1048585,10,3,'2025-07-22 05:26:23',268435462,'publication.event.published',0),(81,1048585,11,17,'2025-07-22 05:26:28',268435458,'submission.event.general.metadataUpdated',0),(82,1048585,11,17,'2025-07-22 05:26:29',268435458,'submission.event.general.metadataUpdated',0),(83,515,11,17,'2025-07-22 05:26:38',1342177281,'submission.event.fileUploaded',0),(84,1048585,11,17,'2025-07-22 05:26:38',1342177288,'submission.event.fileRevised',0),(85,515,11,17,'2025-07-22 05:26:40',1342177296,'submission.event.fileEdited',0),(86,1048585,11,17,'2025-07-22 05:26:41',268435457,'submission.event.submissionSubmitted',0),(87,1048585,11,3,'2025-07-22 05:26:45',268435462,'publication.event.published',0),(88,1048585,12,18,'2025-07-22 05:26:50',268435458,'submission.event.general.metadataUpdated',0),(89,1048585,12,18,'2025-07-22 05:26:51',268435458,'submission.event.general.metadataUpdated',0),(90,515,12,18,'2025-07-22 05:27:00',1342177281,'submission.event.fileUploaded',0),(91,1048585,12,18,'2025-07-22 05:27:00',1342177288,'submission.event.fileRevised',0),(92,515,12,18,'2025-07-22 05:27:02',1342177296,'submission.event.fileEdited',0),(93,1048585,12,18,'2025-07-22 05:27:03',268435457,'submission.event.submissionSubmitted',0),(94,1048585,12,3,'2025-07-22 05:27:06',268435462,'publication.event.published',0),(95,1048585,13,19,'2025-07-22 05:27:12',268435458,'submission.event.general.metadataUpdated',0),(96,1048585,13,19,'2025-07-22 05:27:12',268435458,'submission.event.general.metadataUpdated',0),(97,515,13,19,'2025-07-22 05:27:21',1342177281,'submission.event.fileUploaded',0),(98,1048585,13,19,'2025-07-22 05:27:21',1342177288,'submission.event.fileRevised',0),(99,515,13,19,'2025-07-22 05:27:23',1342177296,'submission.event.fileEdited',0),(100,1048585,13,19,'2025-07-22 05:27:24',268435457,'submission.event.submissionSubmitted',0),(101,1048585,13,3,'2025-07-22 05:27:27',268435462,'publication.event.published',0),(102,1048585,14,20,'2025-07-22 05:27:33',268435458,'submission.event.general.metadataUpdated',0),(103,1048585,14,20,'2025-07-22 05:27:33',268435458,'submission.event.general.metadataUpdated',0),(104,515,14,20,'2025-07-22 05:27:42',1342177281,'submission.event.fileUploaded',0),(105,1048585,14,20,'2025-07-22 05:27:42',1342177288,'submission.event.fileRevised',0),(106,515,14,20,'2025-07-22 05:27:44',1342177296,'submission.event.fileEdited',0),(107,1048585,14,20,'2025-07-22 05:27:45',268435457,'submission.event.submissionSubmitted',0),(108,1048585,14,3,'2025-07-22 05:27:49',268435462,'publication.event.published',0),(109,1048585,15,21,'2025-07-22 05:27:54',268435458,'submission.event.general.metadataUpdated',0),(110,1048585,15,21,'2025-07-22 05:27:54',268435458,'submission.event.general.metadataUpdated',0),(111,515,15,21,'2025-07-22 05:28:03',1342177281,'submission.event.fileUploaded',0),(112,1048585,15,21,'2025-07-22 05:28:03',1342177288,'submission.event.fileRevised',0),(113,515,15,21,'2025-07-22 05:28:06',1342177296,'submission.event.fileEdited',0),(114,1048585,15,21,'2025-07-22 05:28:06',268435457,'submission.event.submissionSubmitted',0),(115,1048585,15,3,'2025-07-22 05:28:10',268435462,'publication.event.published',0),(116,1048585,16,22,'2025-07-22 05:28:15',268435458,'submission.event.general.metadataUpdated',0),(117,1048585,16,22,'2025-07-22 05:28:16',268435458,'submission.event.general.metadataUpdated',0),(118,515,16,22,'2025-07-22 05:28:25',1342177281,'submission.event.fileUploaded',0),(119,1048585,16,22,'2025-07-22 05:28:25',1342177288,'submission.event.fileRevised',0),(120,515,16,22,'2025-07-22 05:28:27',1342177296,'submission.event.fileEdited',0),(121,1048585,16,22,'2025-07-22 05:28:28',268435457,'submission.event.submissionSubmitted',0),(122,1048585,16,3,'2025-07-22 05:28:31',268435462,'publication.event.published',0),(123,1048585,17,23,'2025-07-22 05:28:36',268435458,'submission.event.general.metadataUpdated',0),(124,1048585,17,23,'2025-07-22 05:28:37',268435458,'submission.event.general.metadataUpdated',0),(125,515,17,23,'2025-07-22 05:28:46',1342177281,'submission.event.fileUploaded',0),(126,1048585,17,23,'2025-07-22 05:28:46',1342177288,'submission.event.fileRevised',0),(127,515,17,23,'2025-07-22 05:28:48',1342177296,'submission.event.fileEdited',0),(128,1048585,17,23,'2025-07-22 05:28:49',268435457,'submission.event.submissionSubmitted',0),(129,1048585,17,3,'2025-07-22 05:28:52',268435462,'publication.event.published',0),(130,1048585,18,24,'2025-07-22 05:28:57',268435458,'submission.event.general.metadataUpdated',0),(131,1048585,18,24,'2025-07-22 05:28:58',268435458,'submission.event.general.metadataUpdated',0),(132,515,18,24,'2025-07-22 05:29:07',1342177281,'submission.event.fileUploaded',0),(133,1048585,18,24,'2025-07-22 05:29:07',1342177288,'submission.event.fileRevised',0),(134,515,18,24,'2025-07-22 05:29:09',1342177296,'submission.event.fileEdited',0),(135,1048585,18,24,'2025-07-22 05:29:10',268435457,'submission.event.submissionSubmitted',0),(136,1048585,18,3,'2025-07-22 05:29:13',268435462,'publication.event.published',0),(137,1048585,19,25,'2025-07-22 05:29:20',268435458,'submission.event.general.metadataUpdated',0),(138,1048585,19,25,'2025-07-22 05:29:21',268435458,'submission.event.general.metadataUpdated',0),(139,515,19,25,'2025-07-22 05:29:29',1342177281,'submission.event.fileUploaded',0),(140,1048585,19,25,'2025-07-22 05:29:29',1342177288,'submission.event.fileRevised',0),(141,515,19,25,'2025-07-22 05:29:32',1342177296,'submission.event.fileEdited',0),(142,1048585,19,25,'2025-07-22 05:29:32',268435457,'submission.event.submissionSubmitted',0),(143,1048585,19,3,'2025-07-22 05:29:36',268435462,'publication.event.published',0);
/*!40000 ALTER TABLE `event_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_log_settings`
--

DROP TABLE IF EXISTS `event_log_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_log_settings` (
  `event_log_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `log_id` bigint NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  PRIMARY KEY (`event_log_setting_id`),
  UNIQUE KEY `event_log_settings_unique` (`log_id`,`setting_name`,`locale`),
  KEY `event_log_settings_log_id` (`log_id`),
  KEY `event_log_settings_name_value` (`setting_name`(50),`setting_value`(150)),
  CONSTRAINT `event_log_settings_log_id` FOREIGN KEY (`log_id`) REFERENCES `event_log` (`log_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=346 DEFAULT CHARSET=utf8mb3 COMMENT='Data about an event log entry. This data is commonly used to display information about an event to a user.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_log_settings`
--

LOCK TABLES `event_log_settings` WRITE;
/*!40000 ALTER TABLE `event_log_settings` DISABLE KEYS */;
INSERT INTO `event_log_settings` VALUES (1,3,'','fileId','1'),(2,3,'en','filename','The influence of lactation on the quantity and quality of cashmere production.pdf'),(3,3,'','fileStage','10'),(4,3,'','submissionFileId','1'),(5,3,'','submissionId','1'),(6,3,'','username','ccorino'),(7,4,'','fileId','1'),(8,4,'en','filename','The influence of lactation on the quantity and quality of cashmere production.pdf'),(9,4,'','fileStage','10'),(10,4,'','submissionFileId','1'),(11,4,'','submissionId','1'),(12,4,'','username','ccorino'),(13,5,'','fileId','1'),(14,5,'en','filename','The influence of lactation on the quantity and quality of cashmere production.pdf'),(15,5,'','fileStage','10'),(16,5,'','submissionFileId','1'),(17,5,'','submissionId','1'),(18,5,'','username','ccorino'),(19,10,'','fileId','2'),(20,10,'en','filename','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf'),(21,10,'','fileStage','10'),(22,10,'','submissionFileId','2'),(23,10,'','submissionId','2'),(24,10,'','username','ckwantes'),(25,11,'','fileId','2'),(26,11,'en','filename','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf'),(27,11,'','fileStage','10'),(28,11,'','submissionFileId','2'),(29,11,'','submissionId','2'),(30,11,'','username','ckwantes'),(31,12,'','fileId','2'),(32,12,'en','filename','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf'),(33,12,'','fileStage','10'),(34,12,'','submissionFileId','2'),(35,12,'','submissionId','2'),(36,12,'','username','ckwantes'),(37,17,'','fileId','3'),(38,17,'en','filename','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf'),(39,17,'','fileStage','10'),(40,17,'','submissionFileId','3'),(41,17,'','submissionId','3'),(42,17,'','username','cmontgomerie'),(43,18,'','fileId','3'),(44,18,'en','filename','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf'),(45,18,'','fileStage','10'),(46,18,'','submissionFileId','3'),(47,18,'','submissionId','3'),(48,18,'','username','cmontgomerie'),(49,19,'','fileId','3'),(50,19,'en','filename','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf'),(51,19,'','fileStage','10'),(52,19,'','submissionFileId','3'),(53,19,'','submissionId','3'),(54,19,'','username','cmontgomerie'),(55,30,'','fileId','4'),(56,30,'en','filename','Genetic transformation of forest trees.pdf'),(57,30,'','fileStage','10'),(58,30,'','submissionFileId','4'),(59,30,'','submissionId','4'),(60,30,'','username','ddiouf'),(61,31,'','fileId','4'),(62,31,'en','filename','Genetic transformation of forest trees.pdf'),(63,31,'','fileStage','10'),(64,31,'','submissionFileId','4'),(65,31,'','submissionId','4'),(66,31,'','username','ddiouf'),(67,32,'','fileId','4'),(68,32,'en','filename','Genetic transformation of forest trees.pdf'),(69,32,'','fileStage','10'),(70,32,'','submissionFileId','4'),(71,32,'','submissionId','4'),(72,32,'','username','ddiouf'),(73,34,'','editorName','Daniel Barnes'),(74,35,'','editorName','Daniel Barnes'),(75,36,'','editorName','Daniel Barnes'),(76,39,'','fileId','5'),(77,39,'en','filename','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf'),(78,39,'','fileStage','10'),(79,39,'','submissionFileId','5'),(80,39,'','submissionId','5'),(81,39,'','username','dphillips'),(82,40,'','fileId','5'),(83,40,'en','filename','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf'),(84,40,'','fileStage','10'),(85,40,'','submissionFileId','5'),(86,40,'','submissionId','5'),(87,40,'','username','dphillips'),(88,41,'','fileId','5'),(89,41,'en','filename','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf'),(90,41,'','fileStage','10'),(91,41,'','submissionFileId','5'),(92,41,'','submissionId','5'),(93,41,'','username','dphillips'),(94,48,'','fileId','6'),(95,48,'en','filename','Developing efficacy beliefs in the classroom.pdf'),(96,48,'','fileStage','10'),(97,48,'','submissionFileId','6'),(98,48,'','submissionId','6'),(99,48,'','username','dsokoloff'),(100,49,'','fileId','6'),(101,49,'en','filename','Developing efficacy beliefs in the classroom.pdf'),(102,49,'','fileStage','10'),(103,49,'','submissionFileId','6'),(104,49,'','submissionId','6'),(105,49,'','username','dsokoloff'),(106,50,'','fileId','6'),(107,50,'en','filename','Developing efficacy beliefs in the classroom.pdf'),(108,50,'','fileStage','10'),(109,50,'','submissionFileId','6'),(110,50,'','submissionId','6'),(111,50,'','username','dsokoloff'),(112,55,'','fileId','7'),(113,55,'en','filename','Developing efficacy beliefs in the classroom.pdf'),(114,55,'','fileStage','10'),(115,55,'','submissionFileId','7'),(116,55,'','submissionId','7'),(117,55,'','username','eostrom'),(118,56,'','fileId','7'),(119,56,'en','filename','Developing efficacy beliefs in the classroom.pdf'),(120,56,'','fileStage','10'),(121,56,'','submissionFileId','7'),(122,56,'','submissionId','7'),(123,56,'','username','eostrom'),(124,57,'','fileId','7'),(125,57,'en','filename','Developing efficacy beliefs in the classroom.pdf'),(126,57,'','fileStage','10'),(127,57,'','submissionFileId','7'),(128,57,'','submissionId','7'),(129,57,'','username','eostrom'),(130,62,'','fileId','8'),(131,62,'en','filename','Hansen & Pinto: Reason Reclaimed.pdf'),(132,62,'','fileStage','10'),(133,62,'','submissionFileId','8'),(134,62,'','submissionId','8'),(135,62,'','username','fpaglieri'),(136,63,'','fileId','8'),(137,63,'en','filename','Hansen & Pinto: Reason Reclaimed.pdf'),(138,63,'','fileStage','10'),(139,63,'','submissionFileId','8'),(140,63,'','submissionId','8'),(141,63,'','username','fpaglieri'),(142,64,'','fileId','8'),(143,64,'en','filename','Hansen & Pinto: Reason Reclaimed.pdf'),(144,64,'','fileStage','10'),(145,64,'','submissionFileId','8'),(146,64,'','submissionId','8'),(147,64,'','username','fpaglieri'),(148,69,'','fileId','9'),(149,69,'en','filename','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf'),(150,69,'','fileStage','10'),(151,69,'','submissionFileId','9'),(152,69,'','submissionId','9'),(153,69,'','username','jmwandenga'),(154,70,'','fileId','9'),(155,70,'en','filename','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf'),(156,70,'','fileStage','10'),(157,70,'','submissionFileId','9'),(158,70,'','submissionId','9'),(159,70,'','username','jmwandenga'),(160,71,'','fileId','9'),(161,71,'en','filename','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf'),(162,71,'','fileStage','10'),(163,71,'','submissionFileId','9'),(164,71,'','submissionId','9'),(165,71,'','username','jmwandenga'),(166,76,'','fileId','10'),(167,76,'en','filename','Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf'),(168,76,'','fileStage','10'),(169,76,'','submissionFileId','10'),(170,76,'','submissionId','10'),(171,76,'','username','jnovak'),(172,77,'','fileId','10'),(173,77,'en','filename','Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf'),(174,77,'','fileStage','10'),(175,77,'','submissionFileId','10'),(176,77,'','submissionId','10'),(177,77,'','username','jnovak'),(178,78,'','fileId','10'),(179,78,'en','filename','Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf'),(180,78,'','fileStage','10'),(181,78,'','submissionFileId','10'),(182,78,'','submissionId','10'),(183,78,'','username','jnovak'),(184,83,'','fileId','11'),(185,83,'en','filename','Learning Sustainable Design through Service.pdf'),(186,83,'','fileStage','10'),(187,83,'','submissionFileId','11'),(188,83,'','submissionId','11'),(189,83,'','username','kalkhafaji'),(190,84,'','fileId','11'),(191,84,'en','filename','Learning Sustainable Design through Service.pdf'),(192,84,'','fileStage','10'),(193,84,'','submissionFileId','11'),(194,84,'','submissionId','11'),(195,84,'','username','kalkhafaji'),(196,85,'','fileId','11'),(197,85,'en','filename','Learning Sustainable Design through Service.pdf'),(198,85,'','fileStage','10'),(199,85,'','submissionFileId','11'),(200,85,'','submissionId','11'),(201,85,'','username','kalkhafaji'),(202,90,'','fileId','12'),(203,90,'en','filename','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf'),(204,90,'','fileStage','10'),(205,90,'','submissionFileId','12'),(206,90,'','submissionId','12'),(207,90,'','username','lchristopher'),(208,91,'','fileId','12'),(209,91,'en','filename','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf'),(210,91,'','fileStage','10'),(211,91,'','submissionFileId','12'),(212,91,'','submissionId','12'),(213,91,'','username','lchristopher'),(214,92,'','fileId','12'),(215,92,'en','filename','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf'),(216,92,'','fileStage','10'),(217,92,'','submissionFileId','12'),(218,92,'','submissionId','12'),(219,92,'','username','lchristopher'),(220,97,'','fileId','13'),(221,97,'en','filename','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf'),(222,97,'','fileStage','10'),(223,97,'','submissionFileId','13'),(224,97,'','submissionId','13'),(225,97,'','username','lkumiega'),(226,98,'','fileId','13'),(227,98,'en','filename','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf'),(228,98,'','fileStage','10'),(229,98,'','submissionFileId','13'),(230,98,'','submissionId','13'),(231,98,'','username','lkumiega'),(232,99,'','fileId','13'),(233,99,'en','filename','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf'),(234,99,'','fileStage','10'),(235,99,'','submissionFileId','13'),(236,99,'','submissionId','13'),(237,99,'','username','lkumiega'),(238,104,'','fileId','14'),(239,104,'en','filename','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf'),(240,104,'','fileStage','10'),(241,104,'','submissionFileId','14'),(242,104,'','submissionId','14'),(243,104,'','username','pdaniel'),(244,105,'','fileId','14'),(245,105,'en','filename','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf'),(246,105,'','fileStage','10'),(247,105,'','submissionFileId','14'),(248,105,'','submissionId','14'),(249,105,'','username','pdaniel'),(250,106,'','fileId','14'),(251,106,'en','filename','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf'),(252,106,'','fileStage','10'),(253,106,'','submissionFileId','14'),(254,106,'','submissionId','14'),(255,106,'','username','pdaniel'),(256,111,'','fileId','15'),(257,111,'en','filename','Yam diseases and its management in Nigeria.pdf'),(258,111,'','fileStage','10'),(259,111,'','submissionFileId','15'),(260,111,'','submissionId','15'),(261,111,'','username','rbaiyewu'),(262,112,'','fileId','15'),(263,112,'en','filename','Yam diseases and its management in Nigeria.pdf'),(264,112,'','fileStage','10'),(265,112,'','submissionFileId','15'),(266,112,'','submissionId','15'),(267,112,'','username','rbaiyewu'),(268,113,'','fileId','15'),(269,113,'en','filename','Yam diseases and its management in Nigeria.pdf'),(270,113,'','fileStage','10'),(271,113,'','submissionFileId','15'),(272,113,'','submissionId','15'),(273,113,'','username','rbaiyewu'),(274,118,'','fileId','16'),(275,118,'en','filename','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf'),(276,118,'','fileStage','10'),(277,118,'','submissionFileId','16'),(278,118,'','submissionId','16'),(279,118,'','username','rrossi'),(280,119,'','fileId','16'),(281,119,'en','filename','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf'),(282,119,'','fileStage','10'),(283,119,'','submissionFileId','16'),(284,119,'','submissionId','16'),(285,119,'','username','rrossi'),(286,120,'','fileId','16'),(287,120,'en','filename','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf'),(288,120,'','fileStage','10'),(289,120,'','submissionFileId','16'),(290,120,'','submissionId','16'),(291,120,'','username','rrossi'),(292,125,'','fileId','17'),(293,125,'en','filename','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf'),(294,125,'','fileStage','10'),(295,125,'','submissionFileId','17'),(296,125,'','submissionId','17'),(297,125,'','username','vkarbasizaed'),(298,126,'','fileId','17'),(299,126,'en','filename','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf'),(300,126,'','fileStage','10'),(301,126,'','submissionFileId','17'),(302,126,'','submissionId','17'),(303,126,'','username','vkarbasizaed'),(304,127,'','fileId','17'),(305,127,'en','filename','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf'),(306,127,'','fileStage','10'),(307,127,'','submissionFileId','17'),(308,127,'','submissionId','17'),(309,127,'','username','vkarbasizaed'),(310,132,'','fileId','18'),(311,132,'en','filename','Self-Organization in Multi-Level Institutions in Networked Environments.pdf'),(312,132,'','fileStage','10'),(313,132,'','submissionFileId','18'),(314,132,'','submissionId','18'),(315,132,'','username','vwilliamson'),(316,133,'','fileId','18'),(317,133,'en','filename','Self-Organization in Multi-Level Institutions in Networked Environments.pdf'),(318,133,'','fileStage','10'),(319,133,'','submissionFileId','18'),(320,133,'','submissionId','18'),(321,133,'','username','vwilliamson'),(322,134,'','fileId','18'),(323,134,'en','filename','Self-Organization in Multi-Level Institutions in Networked Environments.pdf'),(324,134,'','fileStage','10'),(325,134,'','submissionFileId','18'),(326,134,'','submissionId','18'),(327,134,'','username','vwilliamson'),(328,139,'','fileId','19'),(329,139,'en','filename','Finocchiaro: Arguments About Arguments.pdf'),(330,139,'','fileStage','10'),(331,139,'','submissionFileId','19'),(332,139,'','submissionId','19'),(333,139,'','username','zwoods'),(334,140,'','fileId','19'),(335,140,'en','filename','Finocchiaro: Arguments About Arguments.pdf'),(336,140,'','fileStage','10'),(337,140,'','submissionFileId','19'),(338,140,'','submissionId','19'),(339,140,'','username','zwoods'),(340,141,'','fileId','19'),(341,141,'en','filename','Finocchiaro: Arguments About Arguments.pdf'),(342,141,'','fileStage','10'),(343,141,'','submissionFileId','19'),(344,141,'','submissionId','19'),(345,141,'','username','zwoods');
/*!40000 ALTER TABLE `event_log_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='A log of all failed jobs.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `files` (
  `file_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `path` varchar(255) NOT NULL,
  `mimetype` varchar(255) NOT NULL,
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3 COMMENT='Records information in the database about files tracked by the system, linking them to the local filesystem.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
INSERT INTO `files` VALUES (1,'contexts/1/submissions/1/687f1ff32a1a7.pdf','application/pdf'),(2,'contexts/1/submissions/2/687f20142570c.pdf','application/pdf'),(3,'contexts/1/submissions/3/687f2041a277d.pdf','application/pdf'),(4,'contexts/1/submissions/4/687f206a2e9ce.pdf','application/pdf'),(5,'contexts/1/submissions/5/687f208804ff1.pdf','application/pdf'),(6,'contexts/1/submissions/6/687f20a3d6e75.pdf','application/pdf'),(7,'contexts/1/submissions/7/687f20b8f0ff0.pdf','application/pdf'),(8,'contexts/1/submissions/8/687f20ce9effc.pdf','application/pdf'),(9,'contexts/1/submissions/9/687f20e3a694a.pdf','application/pdf'),(10,'contexts/1/submissions/10/687f20f8e1dce.pdf','application/pdf'),(11,'contexts/1/submissions/11/687f210e34f3a.pdf','application/pdf'),(12,'contexts/1/submissions/12/687f212430ede.pdf','application/pdf'),(13,'contexts/1/submissions/13/687f21395dd7c.pdf','application/pdf'),(14,'contexts/1/submissions/14/687f214e8af9e.pdf','application/pdf'),(15,'contexts/1/submissions/15/687f2163dd72c.pdf','application/pdf'),(16,'contexts/1/submissions/16/687f217918052.pdf','application/pdf'),(17,'contexts/1/submissions/17/687f218e276ce.pdf','application/pdf'),(18,'contexts/1/submissions/18/687f21a347313.pdf','application/pdf'),(19,'contexts/1/submissions/19/687f21b9e3cca.pdf','application/pdf');
/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filter_groups`
--

DROP TABLE IF EXISTS `filter_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filter_groups` (
  `filter_group_id` bigint NOT NULL AUTO_INCREMENT,
  `symbolic` varchar(255) DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `input_type` varchar(255) DEFAULT NULL,
  `output_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`filter_group_id`),
  UNIQUE KEY `filter_groups_symbolic` (`symbolic`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3 COMMENT='Filter groups are used to organized filters into named sets, which can be retrieved by the application for invocation.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filter_groups`
--

LOCK TABLES `filter_groups` WRITE;
/*!40000 ALTER TABLE `filter_groups` DISABLE KEYS */;
INSERT INTO `filter_groups` VALUES (1,'preprint=>crossref-xml','plugins.importexport.crossref.displayName','plugins.importexport.crossref.description','class::classes.submission.Submission[]','xml::schema(https://www.crossref.org/schemas/crossref5.4.0.xsd)'),(2,'preprint=>dc11','plugins.metadata.dc11.preprintAdapter.displayName','plugins.metadata.dc11.preprintAdapter.description','class::classes.submission.Submission','metadata::APP\\plugins\\metadata\\dc11\\schema\\Dc11Schema(PREPRINT)'),(3,'preprint=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.submission.Submission[]','xml::schema(plugins/importexport/native/native.xsd)'),(4,'native-xml=>preprint','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.submission.Submission[]'),(5,'author=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.author.Author[]','xml::schema(plugins/importexport/native/native.xsd)'),(6,'native-xml=>author','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.author.Author[]'),(7,'SubmissionFile=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::lib.pkp.classes.submissionFile.SubmissionFile','xml::schema(plugins/importexport/native/native.xsd)'),(8,'native-xml=>SubmissionFile','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::lib.pkp.classes.submissionFile.SubmissionFile[]'),(9,'preprint-galley=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::lib.pkp.classes.galley.Galley','xml::schema(plugins/importexport/native/native.xsd)'),(10,'native-xml=>PreprintGalley','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::lib.pkp.classes.galley.Galley[]'),(11,'publication=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.publication.Publication','xml::schema(plugins/importexport/native/native.xsd)'),(12,'native-xml=>Publication','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.publication.Publication[]');
/*!40000 ALTER TABLE `filter_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filter_settings`
--

DROP TABLE IF EXISTS `filter_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filter_settings` (
  `filter_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `filter_id` bigint NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL,
  PRIMARY KEY (`filter_setting_id`),
  UNIQUE KEY `filter_settings_unique` (`filter_id`,`locale`,`setting_name`),
  KEY `filter_settings_id` (`filter_id`),
  CONSTRAINT `filter_settings_filter_id_foreign` FOREIGN KEY (`filter_id`) REFERENCES `filters` (`filter_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='More data about filters, including localized content.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filter_settings`
--

LOCK TABLES `filter_settings` WRITE;
/*!40000 ALTER TABLE `filter_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `filter_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filters`
--

DROP TABLE IF EXISTS `filters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filters` (
  `filter_id` bigint NOT NULL AUTO_INCREMENT,
  `filter_group_id` bigint NOT NULL,
  `context_id` bigint DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `class_name` varchar(255) DEFAULT NULL,
  `is_template` smallint NOT NULL DEFAULT '0',
  `parent_filter_id` bigint DEFAULT NULL,
  `seq` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`filter_id`),
  KEY `filters_filter_group_id` (`filter_group_id`),
  KEY `filters_context_id` (`context_id`),
  KEY `filters_parent_filter_id` (`parent_filter_id`),
  CONSTRAINT `filters_context_id` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE,
  CONSTRAINT `filters_filter_group_id_foreign` FOREIGN KEY (`filter_group_id`) REFERENCES `filter_groups` (`filter_group_id`) ON DELETE CASCADE,
  CONSTRAINT `filters_parent_filter_id_foreign` FOREIGN KEY (`parent_filter_id`) REFERENCES `filters` (`filter_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3 COMMENT='Filters represent a transformation of a supported piece of data from one form to another, such as a PHP object into an XML document.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filters`
--

LOCK TABLES `filters` WRITE;
/*!40000 ALTER TABLE `filters` DISABLE KEYS */;
INSERT INTO `filters` VALUES (1,1,NULL,'Crossref XML preprint export','APP\\plugins\\generic\\crossref\\filter\\PreprintCrossrefXmlFilter',0,NULL,0),(2,2,NULL,'Extract metadata from a(n) Submission','APP\\plugins\\metadata\\dc11\\filter\\Dc11SchemaPreprintAdapter',0,NULL,0),(3,3,NULL,'Native XML submission export','APP\\plugins\\importexport\\native\\filter\\PreprintNativeXmlFilter',0,NULL,0),(4,4,NULL,'Native XML submission import','APP\\plugins\\importexport\\native\\filter\\NativeXmlPreprintFilter',0,NULL,0),(5,5,NULL,'Native XML author export','APP\\plugins\\importexport\\native\\filter\\AuthorNativeXmlFilter',0,NULL,0),(6,6,NULL,'Native XML author import','APP\\plugins\\importexport\\native\\filter\\NativeXmlAuthorFilter',0,NULL,0),(7,8,NULL,'Native XML submission file import','APP\\plugins\\importexport\\native\\filter\\NativeXmlPreprintFileFilter',0,NULL,0),(8,7,NULL,'Native XML submission file export','PKP\\plugins\\importexport\\native\\filter\\SubmissionFileNativeXmlFilter',0,NULL,0),(9,9,NULL,'Native XML representation export','APP\\plugins\\importexport\\native\\filter\\PreprintGalleyNativeXmlFilter',0,NULL,0),(10,10,NULL,'Native XML representation import','APP\\plugins\\importexport\\native\\filter\\NativeXmlPreprintGalleyFilter',0,NULL,0),(11,11,NULL,'Native XML Publication export','APP\\plugins\\importexport\\native\\filter\\PublicationNativeXmlFilter',0,NULL,0),(12,12,NULL,'Native XML publication import','APP\\plugins\\importexport\\native\\filter\\NativeXmlPublicationFilter',0,NULL,0);
/*!40000 ALTER TABLE `filters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre_settings`
--

DROP TABLE IF EXISTS `genre_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genre_settings` (
  `genre_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `genre_id` bigint NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  PRIMARY KEY (`genre_setting_id`),
  UNIQUE KEY `genre_settings_unique` (`genre_id`,`locale`,`setting_name`),
  KEY `genre_settings_genre_id` (`genre_id`),
  CONSTRAINT `genre_settings_genre_id_foreign` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`genre_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3 COMMENT='More data about file genres, including localized properties such as the genre name.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre_settings`
--

LOCK TABLES `genre_settings` WRITE;
/*!40000 ALTER TABLE `genre_settings` DISABLE KEYS */;
INSERT INTO `genre_settings` VALUES (1,1,'en','name','Preprint Text','string'),(2,1,'fr_CA','name','Texte de la prépublication','string'),(3,2,'en','name','Research Instrument','string'),(4,2,'fr_CA','name','##default.genres.researchInstrument##','string'),(5,3,'en','name','Research Materials','string'),(6,3,'fr_CA','name','##default.genres.researchMaterials##','string'),(7,4,'en','name','Research Results','string'),(8,4,'fr_CA','name','##default.genres.researchResults##','string'),(9,5,'en','name','Transcripts','string'),(10,5,'fr_CA','name','##default.genres.transcripts##','string'),(11,6,'en','name','Data Analysis','string'),(12,6,'fr_CA','name','##default.genres.dataAnalysis##','string'),(13,7,'en','name','Data Set','string'),(14,7,'fr_CA','name','##default.genres.dataSet##','string'),(15,8,'en','name','Source Texts','string'),(16,8,'fr_CA','name','##default.genres.sourceTexts##','string'),(17,9,'en','name','Multimedia','string'),(18,9,'fr_CA','name','Multimédias','string'),(19,10,'en','name','Image','string'),(20,10,'fr_CA','name','Image','string'),(21,11,'en','name','HTML Stylesheet','string'),(22,11,'fr_CA','name','Feuille de style HTML','string'),(23,12,'en','name','Other','string'),(24,12,'fr_CA','name','Autre','string');
/*!40000 ALTER TABLE `genre_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genres` (
  `genre_id` bigint NOT NULL AUTO_INCREMENT,
  `context_id` bigint NOT NULL,
  `seq` bigint NOT NULL,
  `enabled` smallint NOT NULL DEFAULT '1',
  `category` bigint NOT NULL DEFAULT '1',
  `dependent` smallint NOT NULL DEFAULT '0',
  `supplementary` smallint NOT NULL DEFAULT '0',
  `required` smallint NOT NULL DEFAULT '0' COMMENT 'Whether or not at least one file of this genre is required for a new submission.',
  `entry_key` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`genre_id`),
  KEY `genres_context_id` (`context_id`),
  CONSTRAINT `genres_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3 COMMENT='The types of submission files configured for each context, such as Article Text, Data Set, Transcript, etc.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (1,1,0,1,1,0,0,1,'SUBMISSION'),(2,1,1,1,3,0,1,0,'RESEARCHINSTRUMENT'),(3,1,2,1,3,0,1,0,'RESEARCHMATERIALS'),(4,1,3,1,3,0,1,0,'RESEARCHRESULTS'),(5,1,4,1,3,0,1,0,'TRANSCRIPTS'),(6,1,5,1,3,0,1,0,'DATAANALYSIS'),(7,1,6,1,3,0,1,0,'DATASET'),(8,1,7,1,3,0,1,0,'SOURCETEXTS'),(9,1,8,1,1,1,1,0,'MULTIMEDIA'),(10,1,9,1,2,1,0,0,'IMAGE'),(11,1,10,1,1,1,0,0,'STYLE'),(12,1,11,1,3,0,1,0,'OTHER');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `highlight_settings`
--

DROP TABLE IF EXISTS `highlight_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `highlight_settings` (
  `highlight_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `highlight_id` bigint NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  PRIMARY KEY (`highlight_setting_id`),
  UNIQUE KEY `highlight_settings_unique` (`highlight_id`,`locale`,`setting_name`),
  KEY `highlight_settings_highlight_id` (`highlight_id`),
  CONSTRAINT `highlight_settings_highlight_id_foreign` FOREIGN KEY (`highlight_id`) REFERENCES `highlights` (`highlight_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='More data about highlights, including localized properties like title and description.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `highlight_settings`
--

LOCK TABLES `highlight_settings` WRITE;
/*!40000 ALTER TABLE `highlight_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `highlight_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `highlights`
--

DROP TABLE IF EXISTS `highlights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `highlights` (
  `highlight_id` bigint NOT NULL AUTO_INCREMENT,
  `context_id` bigint DEFAULT NULL,
  `sequence` bigint NOT NULL,
  `url` varchar(2047) NOT NULL,
  PRIMARY KEY (`highlight_id`),
  KEY `highlights_context_id` (`context_id`),
  CONSTRAINT `highlights_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Highlights are featured items that can be presented to users, for example on the homepage.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `highlights`
--

LOCK TABLES `highlights` WRITE;
/*!40000 ALTER TABLE `highlights` DISABLE KEYS */;
/*!40000 ALTER TABLE `highlights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institution_ip`
--

DROP TABLE IF EXISTS `institution_ip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `institution_ip` (
  `institution_ip_id` bigint NOT NULL AUTO_INCREMENT,
  `institution_id` bigint NOT NULL,
  `ip_string` varchar(40) NOT NULL,
  `ip_start` bigint NOT NULL,
  `ip_end` bigint DEFAULT NULL,
  PRIMARY KEY (`institution_ip_id`),
  KEY `institution_ip_institution_id` (`institution_id`),
  KEY `institution_ip_start` (`ip_start`),
  KEY `institution_ip_end` (`ip_end`),
  CONSTRAINT `institution_ip_institution_id_foreign` FOREIGN KEY (`institution_id`) REFERENCES `institutions` (`institution_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Records IP address ranges and associates them with institutions.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institution_ip`
--

LOCK TABLES `institution_ip` WRITE;
/*!40000 ALTER TABLE `institution_ip` DISABLE KEYS */;
/*!40000 ALTER TABLE `institution_ip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institution_settings`
--

DROP TABLE IF EXISTS `institution_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `institution_settings` (
  `institution_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `institution_id` bigint NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  PRIMARY KEY (`institution_setting_id`),
  UNIQUE KEY `institution_settings_unique` (`institution_id`,`locale`,`setting_name`),
  KEY `institution_settings_institution_id` (`institution_id`),
  CONSTRAINT `institution_settings_institution_id_foreign` FOREIGN KEY (`institution_id`) REFERENCES `institutions` (`institution_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='More data about institutions, including localized properties like names.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institution_settings`
--

LOCK TABLES `institution_settings` WRITE;
/*!40000 ALTER TABLE `institution_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `institution_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institutions`
--

DROP TABLE IF EXISTS `institutions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `institutions` (
  `institution_id` bigint NOT NULL AUTO_INCREMENT,
  `context_id` bigint NOT NULL,
  `ror` varchar(255) DEFAULT NULL COMMENT 'ROR (Research Organization Registry) ID',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`institution_id`),
  KEY `institutions_context_id` (`context_id`),
  CONSTRAINT `institutions_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Institutions for statistics and subscriptions.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institutions`
--

LOCK TABLES `institutions` WRITE;
/*!40000 ALTER TABLE `institutions` DISABLE KEYS */;
/*!40000 ALTER TABLE `institutions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invitations`
--

DROP TABLE IF EXISTS `invitations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invitations` (
  `invitation_id` bigint NOT NULL AUTO_INCREMENT,
  `key_hash` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `inviter_id` bigint DEFAULT NULL,
  `expiry_date` datetime DEFAULT NULL,
  `payload` json DEFAULT NULL,
  `status` enum('INITIALIZED','PENDING','ACCEPTED','DECLINED','CANCELLED') NOT NULL,
  `email` varchar(255) DEFAULT NULL COMMENT 'When present, the email address of the invitation recipient; when null, user_id must be set and the email can be fetched from the users table.',
  `context_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`invitation_id`),
  KEY `invitations_user_id` (`user_id`),
  KEY `invitations_inviter_id` (`inviter_id`),
  KEY `invitations_context_id` (`context_id`),
  KEY `invitations_status_context_id_user_id_type_index` (`status`,`context_id`,`user_id`,`type`),
  KEY `invitations_expiry_date_index` (`expiry_date`),
  CONSTRAINT `invitations_context_id` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE,
  CONSTRAINT `invitations_inviter_id_foreign` FOREIGN KEY (`inviter_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `invitations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COMMENT='Invitations are sent to request a person (by email) to allow them to accept or reject an operation or position, such as a board membership or a submission peer review.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invitations`
--

LOCK TABLES `invitations` WRITE;
/*!40000 ALTER TABLE `invitations` DISABLE KEYS */;
INSERT INTO `invitations` VALUES (2,'$2y$10$7gTC7qWanN5uyQod3bapduSACgWV34VpiZSrzCymD1ot0.IQGXxQe','userRoleAssignment',NULL,1,'2025-07-25 05:19:57','{\"orcid\": null, \"password\": \"$2y$10$wHqRLFm8x7QHKBXd9TaQQemopQWIfM.5glebEHrbkEPJaST2Uldq6\", \"username\": \"rvaca\", \"emailBody\": null, \"givenName\": {\"en\": \"Ramiro\", \"fr_CA\": \"Ramiro\"}, \"familyName\": {\"en\": \"Vaca\", \"fr_CA\": \"Vaca\"}, \"affiliation\": {\"en\": \"Universidad Nacional Autónoma de México\", \"fr_CA\": \"Mexico\"}, \"userCountry\": \"MX\", \"emailSubject\": null, \"passwordHashed\": true, \"orcidIsVerified\": null, \"userGroupsToAdd\": [{\"dateEnd\": null, \"masthead\": true, \"dateStart\": \"2025-07-22\", \"userGroupId\": 2}], \"orcidAccessScope\": null, \"orcidAccessToken\": null, \"sendEmailAddress\": \"rvaca@mailinator.com\", \"orcidAccessDenied\": null, \"orcidRefreshToken\": null, \"inviteStagePayload\": {\"orcid\": null, \"password\": null, \"username\": null, \"emailBody\": null, \"givenName\": null, \"familyName\": null, \"affiliation\": null, \"userCountry\": null, \"emailSubject\": null, \"passwordHashed\": null, \"orcidIsVerified\": null, \"userGroupsToAdd\": [{\"dateEnd\": null, \"masthead\": true, \"dateStart\": \"2025-07-22\", \"userGroupId\": 2}], \"orcidAccessScope\": null, \"orcidAccessToken\": null, \"sendEmailAddress\": \"rvaca@mailinator.com\", \"orcidAccessDenied\": null, \"orcidRefreshToken\": null, \"inviteStagePayload\": null, \"shouldUseInviteData\": null, \"orcidAccessExpiresOn\": null}, \"shouldUseInviteData\": null, \"orcidAccessExpiresOn\": null}','ACCEPTED','rvaca@mailinator.com',1,'2025-07-22 05:19:56','2025-07-22 05:20:04'),(4,'$2y$10$cS7XGnAI9q9WGqXxGgiuLuFH2IIVCmqTJAlYBbaZAHloiNFMwUe4S','userRoleAssignment',NULL,1,'2025-07-25 05:20:13','{\"orcid\": null, \"password\": \"$2y$10$CiqrJJL8Pxrpwr8Fj7sxuObepRjqREEthBWUYSuEuez67IMswOvF2\", \"username\": \"dbarnes\", \"emailBody\": null, \"givenName\": {\"en\": \"Daniel\", \"fr_CA\": \"Daniel\"}, \"familyName\": {\"en\": \"Barnes\", \"fr_CA\": \"Barnes\"}, \"affiliation\": {\"en\": \"University of Melbourne\", \"fr_CA\": \"Australia\"}, \"userCountry\": \"AU\", \"emailSubject\": null, \"passwordHashed\": true, \"orcidIsVerified\": null, \"userGroupsToAdd\": [{\"dateEnd\": null, \"masthead\": true, \"dateStart\": \"2025-07-22\", \"userGroupId\": 2}], \"orcidAccessScope\": null, \"orcidAccessToken\": null, \"sendEmailAddress\": \"dbarnes@mailinator.com\", \"orcidAccessDenied\": null, \"orcidRefreshToken\": null, \"inviteStagePayload\": {\"orcid\": null, \"password\": null, \"username\": null, \"emailBody\": null, \"givenName\": null, \"familyName\": null, \"affiliation\": null, \"userCountry\": null, \"emailSubject\": null, \"passwordHashed\": null, \"orcidIsVerified\": null, \"userGroupsToAdd\": [{\"dateEnd\": null, \"masthead\": true, \"dateStart\": \"2025-07-22\", \"userGroupId\": 2}], \"orcidAccessScope\": null, \"orcidAccessToken\": null, \"sendEmailAddress\": \"dbarnes@mailinator.com\", \"orcidAccessDenied\": null, \"orcidRefreshToken\": null, \"inviteStagePayload\": null, \"shouldUseInviteData\": null, \"orcidAccessExpiresOn\": null}, \"shouldUseInviteData\": null, \"orcidAccessExpiresOn\": null}','ACCEPTED','dbarnes@mailinator.com',1,'2025-07-22 05:20:12','2025-07-22 05:20:20'),(6,'$2y$10$Br6CJ74AF4KvAlYlUcU/deoQtXzl/uveSFH/Nji/xSwviAc6v6X32','userRoleAssignment',NULL,1,'2025-07-25 05:20:29','{\"orcid\": null, \"password\": \"$2y$10$OdnNrF4qDR/smADBcsS3B.NVVECY0LjKJKY8bye/G/yiA.8qGx7DW\", \"username\": \"dbuskins\", \"emailBody\": null, \"givenName\": {\"en\": \"David\", \"fr_CA\": \"David\"}, \"familyName\": {\"en\": \"Buskins\", \"fr_CA\": \"Buskins\"}, \"affiliation\": {\"en\": \"University of Chicago\", \"fr_CA\": \"United States\"}, \"userCountry\": \"US\", \"emailSubject\": null, \"passwordHashed\": true, \"orcidIsVerified\": null, \"userGroupsToAdd\": [{\"dateEnd\": null, \"masthead\": true, \"dateStart\": \"2025-07-22\", \"userGroupId\": 3}], \"orcidAccessScope\": null, \"orcidAccessToken\": null, \"sendEmailAddress\": \"dbuskins@mailinator.com\", \"orcidAccessDenied\": null, \"orcidRefreshToken\": null, \"inviteStagePayload\": {\"orcid\": null, \"password\": null, \"username\": null, \"emailBody\": null, \"givenName\": null, \"familyName\": null, \"affiliation\": null, \"userCountry\": null, \"emailSubject\": null, \"passwordHashed\": null, \"orcidIsVerified\": null, \"userGroupsToAdd\": [{\"dateEnd\": null, \"masthead\": true, \"dateStart\": \"2025-07-22\", \"userGroupId\": 3}], \"orcidAccessScope\": null, \"orcidAccessToken\": null, \"sendEmailAddress\": \"dbuskins@mailinator.com\", \"orcidAccessDenied\": null, \"orcidRefreshToken\": null, \"inviteStagePayload\": null, \"shouldUseInviteData\": null, \"orcidAccessExpiresOn\": null}, \"shouldUseInviteData\": null, \"orcidAccessExpiresOn\": null}','ACCEPTED','dbuskins@mailinator.com',1,'2025-07-22 05:20:28','2025-07-22 05:20:36'),(8,'$2y$10$2/slpK9rGUl830JULiKoJu/GTRaqfjPI/NW2EYxK5MpVoz8inmkTG','userRoleAssignment',NULL,1,'2025-07-25 05:20:46','{\"orcid\": null, \"password\": \"$2y$10$HfTGDJYnNRaE2KDNCFczeOKQ2rgF51gW/1xZVvSvcmK2blktfOwOG\", \"username\": \"sberardo\", \"emailBody\": null, \"givenName\": {\"en\": \"Stephanie\", \"fr_CA\": \"Stephanie\"}, \"familyName\": {\"en\": \"Berardo\", \"fr_CA\": \"Berardo\"}, \"affiliation\": {\"en\": \"University of Toronto\", \"fr_CA\": \"Canada\"}, \"userCountry\": \"CA\", \"emailSubject\": null, \"passwordHashed\": true, \"orcidIsVerified\": null, \"userGroupsToAdd\": [{\"dateEnd\": null, \"masthead\": true, \"dateStart\": \"2025-07-22\", \"userGroupId\": 3}], \"orcidAccessScope\": null, \"orcidAccessToken\": null, \"sendEmailAddress\": \"sberardo@mailinator.com\", \"orcidAccessDenied\": null, \"orcidRefreshToken\": null, \"inviteStagePayload\": {\"orcid\": null, \"password\": null, \"username\": null, \"emailBody\": null, \"givenName\": null, \"familyName\": null, \"affiliation\": null, \"userCountry\": null, \"emailSubject\": null, \"passwordHashed\": null, \"orcidIsVerified\": null, \"userGroupsToAdd\": [{\"dateEnd\": null, \"masthead\": true, \"dateStart\": \"2025-07-22\", \"userGroupId\": 3}], \"orcidAccessScope\": null, \"orcidAccessToken\": null, \"sendEmailAddress\": \"sberardo@mailinator.com\", \"orcidAccessDenied\": null, \"orcidRefreshToken\": null, \"inviteStagePayload\": null, \"shouldUseInviteData\": null, \"orcidAccessExpiresOn\": null}, \"shouldUseInviteData\": null, \"orcidAccessExpiresOn\": null}','ACCEPTED','sberardo@mailinator.com',1,'2025-07-22 05:20:45','2025-07-22 05:20:54'),(10,'$2y$10$8m0lCQ/jPoQaURm40ljEWOPkwAumL/zkSsR52uNvYjwxBDVU8LrBW','userRoleAssignment',NULL,1,'2025-07-25 05:21:03','{\"orcid\": null, \"password\": \"$2y$10$JBnrZB5cfotIAzZZkFze7uWf9efLvxPXUrNM4RPgfNidU4KL2AXUG\", \"username\": \"minoue\", \"emailBody\": null, \"givenName\": {\"en\": \"Minoti\", \"fr_CA\": \"Minoti\"}, \"familyName\": {\"en\": \"Inoue\", \"fr_CA\": \"Inoue\"}, \"affiliation\": {\"en\": \"Kyoto University\", \"fr_CA\": \"Japan\"}, \"userCountry\": \"JP\", \"emailSubject\": null, \"passwordHashed\": true, \"orcidIsVerified\": null, \"userGroupsToAdd\": [{\"dateEnd\": null, \"masthead\": true, \"dateStart\": \"2025-07-22\", \"userGroupId\": 3}], \"orcidAccessScope\": null, \"orcidAccessToken\": null, \"sendEmailAddress\": \"minoue@mailinator.com\", \"orcidAccessDenied\": null, \"orcidRefreshToken\": null, \"inviteStagePayload\": {\"orcid\": null, \"password\": null, \"username\": null, \"emailBody\": null, \"givenName\": null, \"familyName\": null, \"affiliation\": null, \"userCountry\": null, \"emailSubject\": null, \"passwordHashed\": null, \"orcidIsVerified\": null, \"userGroupsToAdd\": [{\"dateEnd\": null, \"masthead\": true, \"dateStart\": \"2025-07-22\", \"userGroupId\": 3}], \"orcidAccessScope\": null, \"orcidAccessToken\": null, \"sendEmailAddress\": \"minoue@mailinator.com\", \"orcidAccessDenied\": null, \"orcidRefreshToken\": null, \"inviteStagePayload\": null, \"shouldUseInviteData\": null, \"orcidAccessExpiresOn\": null}, \"shouldUseInviteData\": null, \"orcidAccessExpiresOn\": null}','ACCEPTED','minoue@mailinator.com',1,'2025-07-22 05:21:03','2025-07-22 05:21:12');
/*!40000 ALTER TABLE `invitations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` text NOT NULL,
  `options` mediumtext,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Job batches allow jobs to be collected into groups for managed processing.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_reserved_at_index` (`queue`,`reserved_at`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb3 COMMENT='All pending or in-progress jobs.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `library_file_settings`
--

DROP TABLE IF EXISTS `library_file_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `library_file_settings` (
  `library_file_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `file_id` bigint NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object|date)',
  PRIMARY KEY (`library_file_setting_id`),
  UNIQUE KEY `library_file_settings_unique` (`file_id`,`locale`,`setting_name`),
  KEY `library_file_settings_file_id` (`file_id`),
  CONSTRAINT `library_file_settings_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `library_files` (`file_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='More data about library files, including localized content such as names.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `library_file_settings`
--

LOCK TABLES `library_file_settings` WRITE;
/*!40000 ALTER TABLE `library_file_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `library_file_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `library_files`
--

DROP TABLE IF EXISTS `library_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `library_files` (
  `file_id` bigint NOT NULL AUTO_INCREMENT,
  `context_id` bigint NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `original_file_name` varchar(255) NOT NULL,
  `file_type` varchar(255) NOT NULL,
  `file_size` bigint NOT NULL,
  `type` smallint NOT NULL,
  `date_uploaded` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `submission_id` bigint DEFAULT NULL,
  `public_access` smallint DEFAULT '0',
  PRIMARY KEY (`file_id`),
  KEY `library_files_context_id` (`context_id`),
  KEY `library_files_submission_id` (`submission_id`),
  CONSTRAINT `library_files_context_id` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE,
  CONSTRAINT `library_files_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Library files can be associated with the context (press/server/journal) or with individual submissions, and are typically forms, agreements, and other administrative documents that are not part of the scholarly content.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `library_files`
--

LOCK TABLES `library_files` WRITE;
/*!40000 ALTER TABLE `library_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `library_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metrics_context`
--

DROP TABLE IF EXISTS `metrics_context`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metrics_context` (
  `metrics_context_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `load_id` varchar(50) NOT NULL,
  `context_id` bigint NOT NULL,
  `date` date NOT NULL,
  `metric` int NOT NULL,
  PRIMARY KEY (`metrics_context_id`),
  KEY `metrics_context_load_id` (`load_id`),
  KEY `metrics_context_context_id` (`context_id`),
  CONSTRAINT `metrics_context_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Daily statistics for views of the homepage.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metrics_context`
--

LOCK TABLES `metrics_context` WRITE;
/*!40000 ALTER TABLE `metrics_context` DISABLE KEYS */;
/*!40000 ALTER TABLE `metrics_context` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metrics_counter_submission_daily`
--

DROP TABLE IF EXISTS `metrics_counter_submission_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metrics_counter_submission_daily` (
  `metrics_counter_submission_daily_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `load_id` varchar(50) NOT NULL,
  `context_id` bigint NOT NULL,
  `submission_id` bigint NOT NULL,
  `date` date NOT NULL,
  `metric_investigations` int NOT NULL,
  `metric_investigations_unique` int NOT NULL,
  `metric_requests` int NOT NULL,
  `metric_requests_unique` int NOT NULL,
  PRIMARY KEY (`metrics_counter_submission_daily_id`),
  UNIQUE KEY `msd_uc_load_id_context_id_submission_id_date` (`load_id`,`context_id`,`submission_id`,`date`),
  KEY `msd_load_id` (`load_id`),
  KEY `metrics_counter_submission_daily_context_id` (`context_id`),
  KEY `metrics_counter_submission_daily_submission_id` (`submission_id`),
  KEY `msd_context_id_submission_id` (`context_id`,`submission_id`),
  CONSTRAINT `msd_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE,
  CONSTRAINT `msd_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Daily statistics matching the COUNTER R5 protocol for views and downloads of published submissions and galleys.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metrics_counter_submission_daily`
--

LOCK TABLES `metrics_counter_submission_daily` WRITE;
/*!40000 ALTER TABLE `metrics_counter_submission_daily` DISABLE KEYS */;
/*!40000 ALTER TABLE `metrics_counter_submission_daily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metrics_counter_submission_institution_daily`
--

DROP TABLE IF EXISTS `metrics_counter_submission_institution_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metrics_counter_submission_institution_daily` (
  `metrics_counter_submission_institution_daily_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `load_id` varchar(50) NOT NULL,
  `context_id` bigint NOT NULL,
  `submission_id` bigint NOT NULL,
  `institution_id` bigint NOT NULL,
  `date` date NOT NULL,
  `metric_investigations` int NOT NULL,
  `metric_investigations_unique` int NOT NULL,
  `metric_requests` int NOT NULL,
  `metric_requests_unique` int NOT NULL,
  PRIMARY KEY (`metrics_counter_submission_institution_daily_id`),
  UNIQUE KEY `msid_uc_load_id_context_id_submission_id_institution_id_date` (`load_id`,`context_id`,`submission_id`,`institution_id`,`date`),
  KEY `msid_load_id` (`load_id`),
  KEY `msid_context_id` (`context_id`),
  KEY `msid_submission_id` (`submission_id`),
  KEY `msid_institution_id` (`institution_id`),
  KEY `msid_context_id_submission_id` (`context_id`,`submission_id`),
  CONSTRAINT `msid_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE,
  CONSTRAINT `msid_institution_id_foreign` FOREIGN KEY (`institution_id`) REFERENCES `institutions` (`institution_id`) ON DELETE CASCADE,
  CONSTRAINT `msid_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Daily statistics matching the COUNTER R5 protocol for views and downloads from institutions.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metrics_counter_submission_institution_daily`
--

LOCK TABLES `metrics_counter_submission_institution_daily` WRITE;
/*!40000 ALTER TABLE `metrics_counter_submission_institution_daily` DISABLE KEYS */;
/*!40000 ALTER TABLE `metrics_counter_submission_institution_daily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metrics_counter_submission_institution_monthly`
--

DROP TABLE IF EXISTS `metrics_counter_submission_institution_monthly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metrics_counter_submission_institution_monthly` (
  `metrics_counter_submission_institution_monthly_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `context_id` bigint NOT NULL,
  `submission_id` bigint NOT NULL,
  `institution_id` bigint NOT NULL,
  `month` int NOT NULL,
  `metric_investigations` int NOT NULL,
  `metric_investigations_unique` int NOT NULL,
  `metric_requests` int NOT NULL,
  `metric_requests_unique` int NOT NULL,
  PRIMARY KEY (`metrics_counter_submission_institution_monthly_id`),
  UNIQUE KEY `msim_uc_context_id_submission_id_institution_id_month` (`context_id`,`submission_id`,`institution_id`,`month`),
  KEY `msim_context_id` (`context_id`),
  KEY `msim_submission_id` (`submission_id`),
  KEY `msim_institution_id` (`institution_id`),
  KEY `msim_context_id_submission_id` (`context_id`,`submission_id`),
  CONSTRAINT `msim_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE,
  CONSTRAINT `msim_institution_id_foreign` FOREIGN KEY (`institution_id`) REFERENCES `institutions` (`institution_id`) ON DELETE CASCADE,
  CONSTRAINT `msim_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Monthly statistics matching the COUNTER R5 protocol for views and downloads from institutions.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metrics_counter_submission_institution_monthly`
--

LOCK TABLES `metrics_counter_submission_institution_monthly` WRITE;
/*!40000 ALTER TABLE `metrics_counter_submission_institution_monthly` DISABLE KEYS */;
/*!40000 ALTER TABLE `metrics_counter_submission_institution_monthly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metrics_counter_submission_monthly`
--

DROP TABLE IF EXISTS `metrics_counter_submission_monthly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metrics_counter_submission_monthly` (
  `metrics_counter_submission_monthly_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `context_id` bigint NOT NULL,
  `submission_id` bigint NOT NULL,
  `month` int NOT NULL,
  `metric_investigations` int NOT NULL,
  `metric_investigations_unique` int NOT NULL,
  `metric_requests` int NOT NULL,
  `metric_requests_unique` int NOT NULL,
  PRIMARY KEY (`metrics_counter_submission_monthly_id`),
  UNIQUE KEY `msm_uc_context_id_submission_id_month` (`context_id`,`submission_id`,`month`),
  KEY `metrics_counter_submission_monthly_context_id` (`context_id`),
  KEY `metrics_counter_submission_monthly_submission_id` (`submission_id`),
  KEY `msm_context_id_submission_id` (`context_id`,`submission_id`),
  CONSTRAINT `msm_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE,
  CONSTRAINT `msm_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Monthly statistics matching the COUNTER R5 protocol for views and downloads of published submissions and galleys.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metrics_counter_submission_monthly`
--

LOCK TABLES `metrics_counter_submission_monthly` WRITE;
/*!40000 ALTER TABLE `metrics_counter_submission_monthly` DISABLE KEYS */;
/*!40000 ALTER TABLE `metrics_counter_submission_monthly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metrics_submission`
--

DROP TABLE IF EXISTS `metrics_submission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metrics_submission` (
  `metrics_submission_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `load_id` varchar(50) NOT NULL,
  `context_id` bigint NOT NULL,
  `submission_id` bigint NOT NULL,
  `representation_id` bigint DEFAULT NULL,
  `submission_file_id` bigint unsigned DEFAULT NULL,
  `file_type` bigint DEFAULT NULL,
  `assoc_type` bigint NOT NULL,
  `date` date NOT NULL,
  `metric` int NOT NULL,
  PRIMARY KEY (`metrics_submission_id`),
  KEY `ms_load_id` (`load_id`),
  KEY `metrics_submission_context_id` (`context_id`),
  KEY `metrics_submission_submission_id` (`submission_id`),
  KEY `metrics_submission_representation_id` (`representation_id`),
  KEY `metrics_submission_submission_file_id` (`submission_file_id`),
  KEY `ms_context_id_submission_id_assoc_type_file_type` (`context_id`,`submission_id`,`assoc_type`,`file_type`),
  CONSTRAINT `metrics_submission_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE,
  CONSTRAINT `metrics_submission_representation_id_foreign` FOREIGN KEY (`representation_id`) REFERENCES `publication_galleys` (`galley_id`) ON DELETE CASCADE,
  CONSTRAINT `metrics_submission_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE,
  CONSTRAINT `metrics_submission_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Daily statistics for views and downloads of published submissions and galleys.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metrics_submission`
--

LOCK TABLES `metrics_submission` WRITE;
/*!40000 ALTER TABLE `metrics_submission` DISABLE KEYS */;
/*!40000 ALTER TABLE `metrics_submission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metrics_submission_geo_daily`
--

DROP TABLE IF EXISTS `metrics_submission_geo_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metrics_submission_geo_daily` (
  `metrics_submission_geo_daily_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `load_id` varchar(50) NOT NULL,
  `context_id` bigint NOT NULL,
  `submission_id` bigint NOT NULL,
  `country` varchar(2) NOT NULL DEFAULT '',
  `region` varchar(3) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `date` date NOT NULL,
  `metric` int NOT NULL,
  `metric_unique` int NOT NULL,
  PRIMARY KEY (`metrics_submission_geo_daily_id`),
  UNIQUE KEY `msgd_uc_load_context_submission_c_r_c_date` (`load_id`,`context_id`,`submission_id`,`country`,`region`,`city`(80),`date`),
  KEY `msgd_load_id` (`load_id`),
  KEY `msgd_context_id` (`context_id`),
  KEY `msgd_submission_id` (`submission_id`),
  KEY `msgd_context_id_submission_id` (`context_id`,`submission_id`),
  CONSTRAINT `msgd_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE,
  CONSTRAINT `msgd_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Daily statistics by country, region and city for views and downloads of published submissions and galleys.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metrics_submission_geo_daily`
--

LOCK TABLES `metrics_submission_geo_daily` WRITE;
/*!40000 ALTER TABLE `metrics_submission_geo_daily` DISABLE KEYS */;
/*!40000 ALTER TABLE `metrics_submission_geo_daily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metrics_submission_geo_monthly`
--

DROP TABLE IF EXISTS `metrics_submission_geo_monthly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metrics_submission_geo_monthly` (
  `metrics_submission_geo_monthly_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `context_id` bigint NOT NULL,
  `submission_id` bigint NOT NULL,
  `country` varchar(2) NOT NULL DEFAULT '',
  `region` varchar(3) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `month` int NOT NULL,
  `metric` int NOT NULL,
  `metric_unique` int NOT NULL,
  PRIMARY KEY (`metrics_submission_geo_monthly_id`),
  UNIQUE KEY `msgm_uc_context_submission_c_r_c_month` (`context_id`,`submission_id`,`country`,`region`,`city`(80),`month`),
  KEY `msgm_context_id` (`context_id`),
  KEY `msgm_submission_id` (`submission_id`),
  KEY `msgm_context_id_submission_id` (`context_id`,`submission_id`),
  CONSTRAINT `msgm_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE,
  CONSTRAINT `msgm_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Monthly statistics by country, region and city for views and downloads of published submissions and galleys.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metrics_submission_geo_monthly`
--

LOCK TABLES `metrics_submission_geo_monthly` WRITE;
/*!40000 ALTER TABLE `metrics_submission_geo_monthly` DISABLE KEYS */;
/*!40000 ALTER TABLE `metrics_submission_geo_monthly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navigation_menu_item_assignment_settings`
--

DROP TABLE IF EXISTS `navigation_menu_item_assignment_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `navigation_menu_item_assignment_settings` (
  `navigation_menu_item_assignment_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `navigation_menu_item_assignment_id` bigint NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL,
  PRIMARY KEY (`navigation_menu_item_assignment_setting_id`),
  UNIQUE KEY `navigation_menu_item_assignment_settings_unique` (`navigation_menu_item_assignment_id`,`locale`,`setting_name`),
  KEY `navigation_menu_item_assignment_settings_n_m_i_a_id` (`navigation_menu_item_assignment_id`),
  CONSTRAINT `assignment_settings_navigation_menu_item_assignment_id` FOREIGN KEY (`navigation_menu_item_assignment_id`) REFERENCES `navigation_menu_item_assignments` (`navigation_menu_item_assignment_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='More data about navigation menu item assignments to navigation menus, including localized content.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigation_menu_item_assignment_settings`
--

LOCK TABLES `navigation_menu_item_assignment_settings` WRITE;
/*!40000 ALTER TABLE `navigation_menu_item_assignment_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `navigation_menu_item_assignment_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navigation_menu_item_assignments`
--

DROP TABLE IF EXISTS `navigation_menu_item_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `navigation_menu_item_assignments` (
  `navigation_menu_item_assignment_id` bigint NOT NULL AUTO_INCREMENT,
  `navigation_menu_id` bigint NOT NULL,
  `navigation_menu_item_id` bigint NOT NULL,
  `parent_id` bigint DEFAULT NULL,
  `seq` bigint DEFAULT '0',
  PRIMARY KEY (`navigation_menu_item_assignment_id`),
  KEY `navigation_menu_item_assignments_navigation_menu_id` (`navigation_menu_id`),
  KEY `navigation_menu_item_assignments_navigation_menu_item_id` (`navigation_menu_item_id`),
  KEY `navigation_menu_item_assignments_parent_id` (`parent_id`),
  CONSTRAINT `navigation_menu_item_assignments_navigation_menu_id_foreign` FOREIGN KEY (`navigation_menu_id`) REFERENCES `navigation_menus` (`navigation_menu_id`) ON DELETE CASCADE,
  CONSTRAINT `navigation_menu_item_assignments_navigation_menu_item_id_foreign` FOREIGN KEY (`navigation_menu_item_id`) REFERENCES `navigation_menu_items` (`navigation_menu_item_id`) ON DELETE CASCADE,
  CONSTRAINT `navigation_menu_item_assignments_parent_id` FOREIGN KEY (`parent_id`) REFERENCES `navigation_menu_items` (`navigation_menu_item_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3 COMMENT='Links navigation menu items to navigation menus.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigation_menu_item_assignments`
--

LOCK TABLES `navigation_menu_item_assignments` WRITE;
/*!40000 ALTER TABLE `navigation_menu_item_assignments` DISABLE KEYS */;
INSERT INTO `navigation_menu_item_assignments` VALUES (1,1,1,NULL,0),(2,1,2,NULL,1),(3,1,3,NULL,2),(4,1,4,3,0),(5,1,5,3,1),(6,1,6,3,2),(7,1,7,3,3),(8,2,8,NULL,0),(9,2,9,NULL,1),(10,2,10,NULL,2),(11,2,11,10,0),(12,2,12,10,1),(13,2,13,10,2),(14,2,14,10,3),(15,3,15,NULL,0),(16,3,16,NULL,1),(17,3,17,NULL,2),(18,3,18,17,0),(19,3,19,17,1),(20,3,20,17,2),(21,3,21,17,3),(22,3,22,17,4);
/*!40000 ALTER TABLE `navigation_menu_item_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navigation_menu_item_settings`
--

DROP TABLE IF EXISTS `navigation_menu_item_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `navigation_menu_item_settings` (
  `navigation_menu_item_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `navigation_menu_item_id` bigint NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` longtext,
  `setting_type` varchar(6) NOT NULL,
  PRIMARY KEY (`navigation_menu_item_setting_id`),
  UNIQUE KEY `navigation_menu_item_settings_unique` (`navigation_menu_item_id`,`locale`,`setting_name`),
  KEY `navigation_menu_item_settings_navigation_menu_item_id` (`navigation_menu_item_id`),
  CONSTRAINT `navigation_menu_item_settings_navigation_menu_id` FOREIGN KEY (`navigation_menu_item_id`) REFERENCES `navigation_menu_items` (`navigation_menu_item_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3 COMMENT='More data about navigation menu items, including localized content such as names.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigation_menu_item_settings`
--

LOCK TABLES `navigation_menu_item_settings` WRITE;
/*!40000 ALTER TABLE `navigation_menu_item_settings` DISABLE KEYS */;
INSERT INTO `navigation_menu_item_settings` VALUES (1,1,'','titleLocaleKey','navigation.register','string'),(2,2,'','titleLocaleKey','navigation.login','string'),(3,3,'','titleLocaleKey','{$loggedInUsername}','string'),(4,4,'','titleLocaleKey','navigation.dashboard','string'),(5,5,'','titleLocaleKey','common.viewProfile','string'),(6,6,'','titleLocaleKey','navigation.admin','string'),(7,7,'','titleLocaleKey','user.logOut','string'),(8,8,'','titleLocaleKey','navigation.register','string'),(9,9,'','titleLocaleKey','navigation.login','string'),(10,10,'','titleLocaleKey','{$loggedInUsername}','string'),(11,11,'','titleLocaleKey','navigation.dashboard','string'),(12,12,'','titleLocaleKey','common.viewProfile','string'),(13,13,'','titleLocaleKey','navigation.admin','string'),(14,14,'','titleLocaleKey','user.logOut','string'),(15,15,'','titleLocaleKey','manager.announcements','string'),(16,16,'','titleLocaleKey','navigation.archives','string'),(17,17,'','titleLocaleKey','navigation.about','string'),(18,18,'','titleLocaleKey','about.aboutContext','string'),(19,19,'','titleLocaleKey','about.submissions','string'),(20,20,'','titleLocaleKey','common.editorialMasthead','string'),(21,21,'','titleLocaleKey','manager.setup.privacyStatement','string'),(22,22,'','titleLocaleKey','about.contact','string'),(23,23,'','titleLocaleKey','common.search','string');
/*!40000 ALTER TABLE `navigation_menu_item_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navigation_menu_items`
--

DROP TABLE IF EXISTS `navigation_menu_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `navigation_menu_items` (
  `navigation_menu_item_id` bigint NOT NULL AUTO_INCREMENT,
  `context_id` bigint DEFAULT NULL,
  `path` varchar(255) DEFAULT '',
  `type` varchar(255) DEFAULT '',
  PRIMARY KEY (`navigation_menu_item_id`),
  KEY `navigation_menu_items_context_id` (`context_id`),
  CONSTRAINT `navigation_menu_items_context_id` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3 COMMENT='Navigation menu items are single elements within a navigation menu.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigation_menu_items`
--

LOCK TABLES `navigation_menu_items` WRITE;
/*!40000 ALTER TABLE `navigation_menu_items` DISABLE KEYS */;
INSERT INTO `navigation_menu_items` VALUES (1,NULL,NULL,'NMI_TYPE_USER_REGISTER'),(2,NULL,NULL,'NMI_TYPE_USER_LOGIN'),(3,NULL,NULL,'NMI_TYPE_USER_DASHBOARD'),(4,NULL,NULL,'NMI_TYPE_USER_DASHBOARD'),(5,NULL,NULL,'NMI_TYPE_USER_PROFILE'),(6,NULL,NULL,'NMI_TYPE_ADMINISTRATION'),(7,NULL,NULL,'NMI_TYPE_USER_LOGOUT'),(8,1,NULL,'NMI_TYPE_USER_REGISTER'),(9,1,NULL,'NMI_TYPE_USER_LOGIN'),(10,1,NULL,'NMI_TYPE_USER_DASHBOARD'),(11,1,NULL,'NMI_TYPE_USER_DASHBOARD'),(12,1,NULL,'NMI_TYPE_USER_PROFILE'),(13,1,NULL,'NMI_TYPE_ADMINISTRATION'),(14,1,NULL,'NMI_TYPE_USER_LOGOUT'),(15,1,NULL,'NMI_TYPE_ANNOUNCEMENTS'),(16,1,NULL,'NMI_TYPE_ARCHIVES'),(17,1,NULL,'NMI_TYPE_ABOUT'),(18,1,NULL,'NMI_TYPE_ABOUT'),(19,1,NULL,'NMI_TYPE_SUBMISSIONS'),(20,1,NULL,'NMI_TYPE_MASTHEAD'),(21,1,NULL,'NMI_TYPE_PRIVACY'),(22,1,NULL,'NMI_TYPE_CONTACT'),(23,1,NULL,'NMI_TYPE_SEARCH');
/*!40000 ALTER TABLE `navigation_menu_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navigation_menus`
--

DROP TABLE IF EXISTS `navigation_menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `navigation_menus` (
  `navigation_menu_id` bigint NOT NULL AUTO_INCREMENT,
  `context_id` bigint DEFAULT NULL,
  `area_name` varchar(255) DEFAULT '',
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`navigation_menu_id`),
  KEY `navigation_menus_context_id` (`context_id`),
  CONSTRAINT `navigation_menus_context_id` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='Navigation menus on the website are installed with the software as a default set, and can be customized.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigation_menus`
--

LOCK TABLES `navigation_menus` WRITE;
/*!40000 ALTER TABLE `navigation_menus` DISABLE KEYS */;
INSERT INTO `navigation_menus` VALUES (1,NULL,'user','User Navigation Menu'),(2,1,'user','User Navigation Menu'),(3,1,'primary','Primary Navigation Menu');
/*!40000 ALTER TABLE `navigation_menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notes` (
  `note_id` bigint NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint NOT NULL,
  `assoc_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `date_created` datetime NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `contents` text,
  PRIMARY KEY (`note_id`),
  KEY `notes_user_id` (`user_id`),
  KEY `notes_assoc` (`assoc_type`,`assoc_id`),
  CONSTRAINT `notes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Notes allow users to annotate associated entities, such as submissions.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_settings`
--

DROP TABLE IF EXISTS `notification_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification_settings` (
  `notification_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `notification_id` bigint NOT NULL,
  `locale` varchar(28) DEFAULT NULL,
  `setting_name` varchar(64) NOT NULL,
  `setting_value` mediumtext NOT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  PRIMARY KEY (`notification_setting_id`),
  UNIQUE KEY `notification_settings_unique` (`notification_id`,`locale`,`setting_name`),
  KEY `notification_settings_notification_id` (`notification_id`),
  CONSTRAINT `notification_settings_notification_id_foreign` FOREIGN KEY (`notification_id`) REFERENCES `notifications` (`notification_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='More data about notifications, including localized properties.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_settings`
--

LOCK TABLES `notification_settings` WRITE;
/*!40000 ALTER TABLE `notification_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_subscription_settings`
--

DROP TABLE IF EXISTS `notification_subscription_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification_subscription_settings` (
  `setting_id` bigint NOT NULL AUTO_INCREMENT,
  `setting_name` varchar(64) NOT NULL,
  `setting_value` mediumtext NOT NULL,
  `user_id` bigint NOT NULL,
  `context_id` bigint DEFAULT NULL,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  PRIMARY KEY (`setting_id`),
  KEY `notification_subscription_settings_user_id` (`user_id`),
  KEY `notification_subscription_settings_context` (`context_id`),
  CONSTRAINT `notification_subscription_settings_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE,
  CONSTRAINT `notification_subscription_settings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3 COMMENT='Which email notifications a user has chosen to unsubscribe from.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_subscription_settings`
--

LOCK TABLES `notification_subscription_settings` WRITE;
/*!40000 ALTER TABLE `notification_subscription_settings` DISABLE KEYS */;
INSERT INTO `notification_subscription_settings` VALUES (1,'blocked_emailed_notification','8',7,1,'int'),(2,'blocked_emailed_notification','8',8,1,'int'),(3,'blocked_emailed_notification','8',9,1,'int'),(4,'blocked_emailed_notification','8',10,1,'int'),(5,'blocked_emailed_notification','8',11,1,'int'),(6,'blocked_emailed_notification','8',12,1,'int'),(7,'blocked_emailed_notification','8',13,1,'int'),(8,'blocked_emailed_notification','8',14,1,'int'),(9,'blocked_emailed_notification','8',15,1,'int'),(10,'blocked_emailed_notification','8',16,1,'int'),(11,'blocked_emailed_notification','8',17,1,'int'),(12,'blocked_emailed_notification','8',18,1,'int'),(13,'blocked_emailed_notification','8',19,1,'int'),(14,'blocked_emailed_notification','8',20,1,'int'),(15,'blocked_emailed_notification','8',21,1,'int'),(16,'blocked_emailed_notification','8',22,1,'int'),(17,'blocked_emailed_notification','8',23,1,'int'),(18,'blocked_emailed_notification','8',24,1,'int'),(19,'blocked_emailed_notification','8',25,1,'int');
/*!40000 ALTER TABLE `notification_subscription_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `notification_id` bigint NOT NULL AUTO_INCREMENT,
  `context_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `level` bigint NOT NULL,
  `type` bigint NOT NULL,
  `date_created` datetime NOT NULL,
  `date_read` datetime DEFAULT NULL,
  `assoc_type` bigint DEFAULT NULL,
  `assoc_id` bigint DEFAULT NULL,
  PRIMARY KEY (`notification_id`),
  KEY `notifications_context_id` (`context_id`),
  KEY `notifications_user_id` (`user_id`),
  KEY `notifications_context_id_user_id` (`context_id`,`user_id`,`level`),
  KEY `notifications_context_id_level` (`context_id`,`level`),
  KEY `notifications_assoc` (`assoc_type`,`assoc_id`),
  KEY `notifications_user_id_level` (`user_id`,`level`),
  CONSTRAINT `notifications_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE,
  CONSTRAINT `notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8mb3 COMMENT='User notifications created during certain operations.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (5,1,NULL,3,16777220,'2025-07-22 05:21:58',NULL,1048585,1),(6,1,NULL,3,16777222,'2025-07-22 05:21:58',NULL,1048585,1),(7,1,NULL,3,16777223,'2025-07-22 05:21:58',NULL,1048585,1),(8,1,4,2,16777217,'2025-07-22 05:21:58',NULL,1048585,1),(9,1,5,2,16777217,'2025-07-22 05:21:58',NULL,1048585,1),(10,1,NULL,2,16777243,'2025-07-22 05:21:58',NULL,1048585,1),(11,1,NULL,2,16777245,'2025-07-22 05:21:58',NULL,1048585,1),(12,1,NULL,3,16777220,'2025-07-22 05:22:52',NULL,1048585,2),(13,1,NULL,3,16777222,'2025-07-22 05:22:52',NULL,1048585,2),(14,1,NULL,3,16777223,'2025-07-22 05:22:52',NULL,1048585,2),(15,1,4,2,16777217,'2025-07-22 05:22:52',NULL,1048585,2),(16,1,5,2,16777217,'2025-07-22 05:22:52',NULL,1048585,2),(17,1,NULL,2,16777243,'2025-07-22 05:22:53',NULL,1048585,2),(18,1,NULL,2,16777245,'2025-07-22 05:22:53',NULL,1048585,2),(19,1,NULL,3,16777220,'2025-07-22 05:23:17',NULL,1048585,3),(20,1,NULL,3,16777222,'2025-07-22 05:23:17',NULL,1048585,3),(21,1,NULL,3,16777223,'2025-07-22 05:23:17',NULL,1048585,3),(22,1,4,2,16777217,'2025-07-22 05:23:17',NULL,1048585,3),(23,1,5,2,16777217,'2025-07-22 05:23:17',NULL,1048585,3),(24,1,NULL,2,16777243,'2025-07-22 05:23:17',NULL,1048585,3),(25,1,NULL,2,16777245,'2025-07-22 05:23:17',NULL,1048585,3),(26,1,4,3,16777259,'2025-07-22 05:23:31',NULL,1048585,3),(27,1,5,3,16777259,'2025-07-22 05:23:31',NULL,1048585,3),(28,1,9,3,16777259,'2025-07-22 05:23:31',NULL,1048585,3),(29,1,NULL,3,16777220,'2025-07-22 05:23:57',NULL,1048585,4),(30,1,NULL,3,16777222,'2025-07-22 05:23:57',NULL,1048585,4),(31,1,NULL,3,16777223,'2025-07-22 05:23:57',NULL,1048585,4),(32,1,4,2,16777217,'2025-07-22 05:23:57',NULL,1048585,4),(33,1,5,2,16777217,'2025-07-22 05:23:57',NULL,1048585,4),(34,1,NULL,2,16777243,'2025-07-22 05:23:57',NULL,1048585,4),(35,1,NULL,2,16777245,'2025-07-22 05:23:57',NULL,1048585,4),(37,1,10,2,16777234,'2025-07-22 05:24:08',NULL,1048585,4),(38,1,NULL,3,16777220,'2025-07-22 05:24:26',NULL,1048585,5),(39,1,NULL,3,16777222,'2025-07-22 05:24:26',NULL,1048585,5),(40,1,NULL,3,16777223,'2025-07-22 05:24:26',NULL,1048585,5),(41,1,4,2,16777217,'2025-07-22 05:24:26',NULL,1048585,5),(42,1,5,2,16777217,'2025-07-22 05:24:26',NULL,1048585,5),(43,1,NULL,2,16777243,'2025-07-22 05:24:27',NULL,1048585,5),(44,1,NULL,2,16777245,'2025-07-22 05:24:27',NULL,1048585,5),(45,1,NULL,3,16777220,'2025-07-22 05:24:54',NULL,1048585,6),(46,1,NULL,3,16777222,'2025-07-22 05:24:54',NULL,1048585,6),(47,1,NULL,3,16777223,'2025-07-22 05:24:54',NULL,1048585,6),(48,1,4,2,16777217,'2025-07-22 05:24:54',NULL,1048585,6),(49,1,5,2,16777217,'2025-07-22 05:24:54',NULL,1048585,6),(50,1,NULL,2,16777243,'2025-07-22 05:24:54',NULL,1048585,6),(51,1,NULL,2,16777245,'2025-07-22 05:24:54',NULL,1048585,6),(52,1,NULL,3,16777220,'2025-07-22 05:25:16',NULL,1048585,7),(53,1,NULL,3,16777222,'2025-07-22 05:25:16',NULL,1048585,7),(54,1,NULL,3,16777223,'2025-07-22 05:25:16',NULL,1048585,7),(55,1,4,2,16777217,'2025-07-22 05:25:16',NULL,1048585,7),(56,1,5,2,16777217,'2025-07-22 05:25:16',NULL,1048585,7),(57,1,NULL,2,16777243,'2025-07-22 05:25:16',NULL,1048585,7),(58,1,NULL,2,16777245,'2025-07-22 05:25:16',NULL,1048585,7),(59,1,NULL,3,16777220,'2025-07-22 05:25:37',NULL,1048585,8),(60,1,NULL,3,16777222,'2025-07-22 05:25:37',NULL,1048585,8),(61,1,NULL,3,16777223,'2025-07-22 05:25:37',NULL,1048585,8),(62,1,4,2,16777217,'2025-07-22 05:25:37',NULL,1048585,8),(63,1,5,2,16777217,'2025-07-22 05:25:37',NULL,1048585,8),(64,1,NULL,2,16777243,'2025-07-22 05:25:37',NULL,1048585,8),(65,1,NULL,2,16777245,'2025-07-22 05:25:37',NULL,1048585,8),(66,1,NULL,3,16777220,'2025-07-22 05:25:58',NULL,1048585,9),(67,1,NULL,3,16777222,'2025-07-22 05:25:58',NULL,1048585,9),(68,1,NULL,3,16777223,'2025-07-22 05:25:58',NULL,1048585,9),(69,1,4,2,16777217,'2025-07-22 05:25:58',NULL,1048585,9),(70,1,5,2,16777217,'2025-07-22 05:25:58',NULL,1048585,9),(71,1,NULL,2,16777243,'2025-07-22 05:25:58',NULL,1048585,9),(72,1,NULL,2,16777245,'2025-07-22 05:25:58',NULL,1048585,9),(73,1,NULL,3,16777220,'2025-07-22 05:26:19',NULL,1048585,10),(74,1,NULL,3,16777222,'2025-07-22 05:26:19',NULL,1048585,10),(75,1,NULL,3,16777223,'2025-07-22 05:26:19',NULL,1048585,10),(76,1,4,2,16777217,'2025-07-22 05:26:19',NULL,1048585,10),(77,1,5,2,16777217,'2025-07-22 05:26:19',NULL,1048585,10),(78,1,NULL,2,16777243,'2025-07-22 05:26:19',NULL,1048585,10),(79,1,NULL,2,16777245,'2025-07-22 05:26:19',NULL,1048585,10),(80,1,NULL,3,16777220,'2025-07-22 05:26:41',NULL,1048585,11),(81,1,NULL,3,16777222,'2025-07-22 05:26:41',NULL,1048585,11),(82,1,NULL,3,16777223,'2025-07-22 05:26:41',NULL,1048585,11),(83,1,4,2,16777217,'2025-07-22 05:26:41',NULL,1048585,11),(84,1,5,2,16777217,'2025-07-22 05:26:41',NULL,1048585,11),(85,1,NULL,2,16777243,'2025-07-22 05:26:41',NULL,1048585,11),(86,1,NULL,2,16777245,'2025-07-22 05:26:41',NULL,1048585,11),(87,1,NULL,3,16777220,'2025-07-22 05:27:03',NULL,1048585,12),(88,1,NULL,3,16777222,'2025-07-22 05:27:03',NULL,1048585,12),(89,1,NULL,3,16777223,'2025-07-22 05:27:03',NULL,1048585,12),(90,1,4,2,16777217,'2025-07-22 05:27:03',NULL,1048585,12),(91,1,5,2,16777217,'2025-07-22 05:27:03',NULL,1048585,12),(92,1,NULL,2,16777243,'2025-07-22 05:27:03',NULL,1048585,12),(93,1,NULL,2,16777245,'2025-07-22 05:27:03',NULL,1048585,12),(94,1,NULL,3,16777220,'2025-07-22 05:27:24',NULL,1048585,13),(95,1,NULL,3,16777222,'2025-07-22 05:27:24',NULL,1048585,13),(96,1,NULL,3,16777223,'2025-07-22 05:27:24',NULL,1048585,13),(97,1,4,2,16777217,'2025-07-22 05:27:24',NULL,1048585,13),(98,1,5,2,16777217,'2025-07-22 05:27:24',NULL,1048585,13),(99,1,NULL,2,16777243,'2025-07-22 05:27:24',NULL,1048585,13),(100,1,NULL,2,16777245,'2025-07-22 05:27:24',NULL,1048585,13),(101,1,NULL,3,16777220,'2025-07-22 05:27:45',NULL,1048585,14),(102,1,NULL,3,16777222,'2025-07-22 05:27:45',NULL,1048585,14),(103,1,NULL,3,16777223,'2025-07-22 05:27:45',NULL,1048585,14),(104,1,4,2,16777217,'2025-07-22 05:27:45',NULL,1048585,14),(105,1,5,2,16777217,'2025-07-22 05:27:45',NULL,1048585,14),(106,1,NULL,2,16777243,'2025-07-22 05:27:45',NULL,1048585,14),(107,1,NULL,2,16777245,'2025-07-22 05:27:45',NULL,1048585,14),(108,1,NULL,3,16777220,'2025-07-22 05:28:06',NULL,1048585,15),(109,1,NULL,3,16777222,'2025-07-22 05:28:06',NULL,1048585,15),(110,1,NULL,3,16777223,'2025-07-22 05:28:06',NULL,1048585,15),(111,1,4,2,16777217,'2025-07-22 05:28:06',NULL,1048585,15),(112,1,5,2,16777217,'2025-07-22 05:28:06',NULL,1048585,15),(113,1,NULL,2,16777243,'2025-07-22 05:28:06',NULL,1048585,15),(114,1,NULL,2,16777245,'2025-07-22 05:28:06',NULL,1048585,15),(115,1,NULL,3,16777220,'2025-07-22 05:28:28',NULL,1048585,16),(116,1,NULL,3,16777222,'2025-07-22 05:28:28',NULL,1048585,16),(117,1,NULL,3,16777223,'2025-07-22 05:28:28',NULL,1048585,16),(118,1,4,2,16777217,'2025-07-22 05:28:28',NULL,1048585,16),(119,1,5,2,16777217,'2025-07-22 05:28:28',NULL,1048585,16),(120,1,NULL,2,16777243,'2025-07-22 05:28:28',NULL,1048585,16),(121,1,NULL,2,16777245,'2025-07-22 05:28:28',NULL,1048585,16),(122,1,NULL,3,16777220,'2025-07-22 05:28:49',NULL,1048585,17),(123,1,NULL,3,16777222,'2025-07-22 05:28:49',NULL,1048585,17),(124,1,NULL,3,16777223,'2025-07-22 05:28:49',NULL,1048585,17),(125,1,4,2,16777217,'2025-07-22 05:28:49',NULL,1048585,17),(126,1,5,2,16777217,'2025-07-22 05:28:49',NULL,1048585,17),(127,1,NULL,2,16777243,'2025-07-22 05:28:49',NULL,1048585,17),(128,1,NULL,2,16777245,'2025-07-22 05:28:49',NULL,1048585,17),(129,1,NULL,3,16777220,'2025-07-22 05:29:10',NULL,1048585,18),(130,1,NULL,3,16777222,'2025-07-22 05:29:10',NULL,1048585,18),(131,1,NULL,3,16777223,'2025-07-22 05:29:10',NULL,1048585,18),(132,1,4,2,16777217,'2025-07-22 05:29:10',NULL,1048585,18),(133,1,5,2,16777217,'2025-07-22 05:29:10',NULL,1048585,18),(134,1,NULL,2,16777243,'2025-07-22 05:29:10',NULL,1048585,18),(135,1,NULL,2,16777245,'2025-07-22 05:29:10',NULL,1048585,18),(136,1,NULL,3,16777220,'2025-07-22 05:29:32',NULL,1048585,19),(137,1,NULL,3,16777222,'2025-07-22 05:29:32',NULL,1048585,19),(138,1,NULL,3,16777223,'2025-07-22 05:29:32',NULL,1048585,19),(139,1,4,2,16777217,'2025-07-22 05:29:32',NULL,1048585,19),(140,1,5,2,16777217,'2025-07-22 05:29:32',NULL,1048585,19),(141,1,NULL,2,16777243,'2025-07-22 05:29:32',NULL,1048585,19),(142,1,NULL,2,16777245,'2025-07-22 05:29:32',NULL,1048585,19);
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oai_resumption_tokens`
--

DROP TABLE IF EXISTS `oai_resumption_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oai_resumption_tokens` (
  `oai_resumption_token_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(32) NOT NULL,
  `expire` bigint NOT NULL,
  `record_offset` int NOT NULL,
  `params` text,
  PRIMARY KEY (`oai_resumption_token_id`),
  UNIQUE KEY `oai_resumption_tokens_unique` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='OAI resumption tokens are used to allow for pagination of large result sets into manageable pieces.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oai_resumption_tokens`
--

LOCK TABLES `oai_resumption_tokens` WRITE;
/*!40000 ALTER TABLE `oai_resumption_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oai_resumption_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_settings`
--

DROP TABLE IF EXISTS `plugin_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plugin_settings` (
  `plugin_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `plugin_name` varchar(80) NOT NULL,
  `context_id` bigint DEFAULT NULL,
  `setting_name` varchar(80) NOT NULL,
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL COMMENT '(bool|int|float|string|object)',
  PRIMARY KEY (`plugin_setting_id`),
  UNIQUE KEY `plugin_settings_unique` (`plugin_name`,`context_id`,`setting_name`),
  KEY `plugin_settings_context_id` (`context_id`),
  KEY `plugin_settings_plugin_name` (`plugin_name`),
  CONSTRAINT `plugin_settings_context_id` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3 COMMENT='More data about plugins, including localized properties. This table is frequently used to store plugin-specific configuration.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_settings`
--

LOCK TABLES `plugin_settings` WRITE;
/*!40000 ALTER TABLE `plugin_settings` DISABLE KEYS */;
INSERT INTO `plugin_settings` VALUES (1,'defaultthemeplugin',NULL,'enabled','1','bool'),(2,'usageeventplugin',NULL,'enabled','1','bool'),(3,'tinymceplugin',NULL,'enabled','1','bool'),(4,'languagetoggleblockplugin',NULL,'enabled','1','bool'),(5,'languagetoggleblockplugin',NULL,'seq','4','int'),(6,'developedbyblockplugin',NULL,'enabled','0','bool'),(7,'developedbyblockplugin',NULL,'seq','0','int'),(8,'defaultthemeplugin',1,'enabled','1','bool'),(9,'tinymceplugin',1,'enabled','1','bool'),(10,'languagetoggleblockplugin',1,'enabled','1','bool'),(11,'languagetoggleblockplugin',1,'seq','4','int'),(12,'developedbyblockplugin',1,'enabled','0','bool'),(13,'developedbyblockplugin',1,'seq','0','int'),(14,'pdfjsviewerplugin',1,'enabled','1','bool'),(15,'webfeedplugin',1,'enabled','1','bool'),(16,'webfeedplugin',1,'displayPage','homepage','string'),(17,'webfeedplugin',1,'displayItems','1','bool'),(18,'webfeedplugin',1,'recentItems','30','int'),(19,'webfeedplugin',1,'includeIdentifiers','0','bool'),(20,'googlescholarplugin',1,'enabled','1','bool'),(21,'defaultthemeplugin',1,'typography','notoSans','string'),(22,'defaultthemeplugin',1,'baseColour','#1E6292','string'),(23,'defaultthemeplugin',1,'showDescriptionInServerIndex','false','string'),(24,'defaultthemeplugin',1,'useHomepageImageAsHeader','false','string'),(25,'defaultthemeplugin',1,'displayStats','none','string');
/*!40000 ALTER TABLE `plugin_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publication_categories`
--

DROP TABLE IF EXISTS `publication_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publication_categories` (
  `publication_category_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `publication_id` bigint NOT NULL,
  `category_id` bigint NOT NULL,
  PRIMARY KEY (`publication_category_id`),
  UNIQUE KEY `publication_categories_id` (`publication_id`,`category_id`),
  KEY `publication_categories_publication_id` (`publication_id`),
  KEY `publication_categories_category_id` (`category_id`),
  CONSTRAINT `publication_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE CASCADE,
  CONSTRAINT `publication_categories_publication_id_foreign` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`publication_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Associates publications (and thus submissions) with categories.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication_categories`
--

LOCK TABLES `publication_categories` WRITE;
/*!40000 ALTER TABLE `publication_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `publication_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publication_galley_settings`
--

DROP TABLE IF EXISTS `publication_galley_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publication_galley_settings` (
  `publication_galley_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `galley_id` bigint NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  PRIMARY KEY (`publication_galley_setting_id`),
  UNIQUE KEY `publication_galley_settings_unique` (`galley_id`,`locale`,`setting_name`),
  KEY `publication_galley_settings_galley_id` (`galley_id`),
  KEY `publication_galley_settings_name_value` (`setting_name`(50),`setting_value`(150)),
  CONSTRAINT `publication_galley_settings_galley_id_foreign` FOREIGN KEY (`galley_id`) REFERENCES `publication_galleys` (`galley_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='More data about publication galleys, including localized properties such as labels.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication_galley_settings`
--

LOCK TABLES `publication_galley_settings` WRITE;
/*!40000 ALTER TABLE `publication_galley_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `publication_galley_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publication_galleys`
--

DROP TABLE IF EXISTS `publication_galleys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publication_galleys` (
  `galley_id` bigint NOT NULL AUTO_INCREMENT,
  `locale` varchar(28) DEFAULT NULL,
  `publication_id` bigint NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `submission_file_id` bigint unsigned DEFAULT NULL,
  `seq` double NOT NULL DEFAULT '0',
  `remote_url` varchar(2047) DEFAULT NULL,
  `is_approved` tinyint NOT NULL DEFAULT '0',
  `url_path` varchar(64) DEFAULT NULL,
  `doi_id` bigint DEFAULT NULL,
  PRIMARY KEY (`galley_id`),
  KEY `publication_galleys_publication_id` (`publication_id`),
  KEY `publication_galleys_submission_file_id` (`submission_file_id`),
  KEY `publication_galleys_url_path` (`url_path`),
  KEY `publication_galleys_doi_id` (`doi_id`),
  CONSTRAINT `publication_galleys_doi_id_foreign` FOREIGN KEY (`doi_id`) REFERENCES `dois` (`doi_id`) ON DELETE SET NULL,
  CONSTRAINT `publication_galleys_publication_id` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`publication_id`) ON DELETE CASCADE,
  CONSTRAINT `publication_galleys_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3 COMMENT='Publication galleys are representations of publications in a particular format, such as a PDF file.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication_galleys`
--

LOCK TABLES `publication_galleys` WRITE;
/*!40000 ALTER TABLE `publication_galleys` DISABLE KEYS */;
INSERT INTO `publication_galleys` VALUES (1,'en',1,'PDF',1,0,NULL,0,NULL,NULL),(2,'en',2,'PDF',2,0,NULL,0,NULL,NULL),(3,'en',3,'PDF',3,0,NULL,0,NULL,NULL),(4,'en',4,'PDF',3,0,NULL,0,NULL,NULL),(5,'en',5,'PDF',4,0,NULL,0,NULL,NULL),(6,'en',6,'PDF',5,0,NULL,0,NULL,NULL),(7,'en',7,'PDF',6,0,NULL,0,NULL,NULL),(8,'en',8,'PDF',7,0,NULL,0,NULL,NULL),(9,'en',9,'PDF',8,0,NULL,0,NULL,NULL),(10,'en',10,'PDF',9,0,NULL,0,NULL,NULL),(11,'en',11,'PDF',10,0,NULL,0,NULL,NULL),(12,'en',12,'PDF',11,0,NULL,0,NULL,NULL),(13,'en',13,'PDF',12,0,NULL,0,NULL,NULL),(14,'en',14,'PDF',13,0,NULL,0,NULL,NULL),(15,'en',15,'PDF',14,0,NULL,0,NULL,NULL),(16,'en',16,'PDF',15,0,NULL,0,NULL,NULL),(17,'en',17,'PDF',16,0,NULL,0,NULL,NULL),(18,'en',18,'PDF',17,0,NULL,0,NULL,NULL),(19,'en',19,'PDF',18,0,NULL,0,NULL,NULL),(20,'en',20,'PDF',19,0,NULL,0,NULL,NULL);
/*!40000 ALTER TABLE `publication_galleys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publication_settings`
--

DROP TABLE IF EXISTS `publication_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publication_settings` (
  `publication_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `publication_id` bigint NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  PRIMARY KEY (`publication_setting_id`),
  UNIQUE KEY `publication_settings_unique` (`publication_id`,`locale`,`setting_name`),
  KEY `publication_settings_name_value` (`setting_name`(50),`setting_value`(150)),
  CONSTRAINT `publication_settings_publication_id` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`publication_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb3 COMMENT='More data about publications, including localized properties such as the title and abstract.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication_settings`
--

LOCK TABLES `publication_settings` WRITE;
/*!40000 ALTER TABLE `publication_settings` DISABLE KEYS */;
INSERT INTO `publication_settings` VALUES (1,1,'en','abstract','The effects of pressed beet pulp silage (PBPS) replacing barley for 10% and 20% (DM basis) were studied on heavy pigs fed dairy whey-diluted diets. 60 Hypor pigs (average initial weight of 28 kg), 30 barrows and 30 gilts, were homogeneously allocated to three exper- imental groups: T1 (control) in which pigs were fed a traditional sweet whey- diluted diet (the ratio between whey and dry matter was 4.5/1); T2 in which PBPS replaced barley for 10% (DM basis) during a first period (from the beginning to the 133rd day of trial) and thereafter for 20% (DM basis); T3 in which PBPS replaced barley for 20% (DM basis) throughout the experimental period. In diets T2 and T3 feed was dairy whey-diluted as in group T1. No significant (P>0.05) differences were observed concerning growth parameters (ADG and FCR). Pigs on diets contain- ing PBPS showed significantly higher (P<0.05) percentages of lean cuts and lower percentages of fat cuts. On the whole, ham weight losses during seasoning were moderate but significantly (P<0.05) more marked for PBPS-fed pigs as a prob- able consequence of their lower adiposity degree. Fatty acid composition of ham fat was unaffected by diets. With regard to m. Semimembranosus colour, pigs receiving PBPS showed lower (P<0.05) \"L\", \"a\" and \"Chroma\" values. From an economical point of view it can be concluded that the use of PBPS (partially replacing barley) and dairy whey in heavy pig production could be of particular interest in areas where both these by products are readily available.'),(2,1,'en','title','The influence of lactation on the quantity and quality of cashmere production'),(3,2,'en','title','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence'),(4,2,'en','abstract','<p>Archival data from an attitude survey of employees in a single multinational organization were used to examine the degree to which national culture affects the nature of job satisfaction. Responses from nine countries were compiled to create a benchmark against which nations could be individually compared. Factor analysis revealed four factors: Organizational Communication, Organizational Efficiency/Effectiveness, Organizational Support, and Personal Benefit. Comparisons of factor structures indicated that Organizational Communication exhibited the most construct equivalence, and Personal Benefit the least. The most satisfied employees were those from China, and the least satisfied from Brazil, consistent with previous findings that individuals in collectivistic nations report higher satisfaction. The research findings suggest that national cultural context exerts an effect on the nature of job satisfaction.</p>'),(5,2,'en','copyrightHolder','Public Knowledge Preprint Server'),(6,2,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(7,2,'','copyrightYear','2025'),(8,3,'en','abstract','The integration of technology into the classroom is a major issue in education today. Many national and provincial initiatives specify the technology skills that students must demonstrate at each grade level. The Government of the Province of Alberta in Canada, has mandated the implementation of a new curriculum which began in September of 2000, called Information and Communication Technology. This curriculum is infused within core courses and specifies what students are “expected to know, be able to do, and be like with respect to technology” (Alberta Learning, 2000). Since teachers are required to implement this new curriculum, school jurisdictions are turning to professional development strategies and hiring standards to upgrade teachers’ computer skills to meet this goal. This paper summarizes the results of a telephone survey administered to all public school jurisdictions in the Province of Alberta with a 100% response rate. We examined the computer skills that school jurisdictions require of newly hired teachers, and the support strategies employed for currently employed teachers.'),(9,3,'en','title','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice'),(10,3,'en','copyrightHolder','Public Knowledge Preprint Server'),(11,3,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(12,3,'','copyrightYear','2025'),(13,4,'en','abstract','The integration of technology into the classroom is a major issue in education today. Many national and provincial initiatives specify the technology skills that students must demonstrate at each grade level. The Government of the Province of Alberta in Canada, has mandated the implementation of a new curriculum which began in September of 2000, called Information and Communication Technology. This curriculum is infused within core courses and specifies what students are “expected to know, be able to do, and be like with respect to technology” (Alberta Learning, 2000). Since teachers are required to implement this new curriculum, school jurisdictions are turning to professional development strategies and hiring standards to upgrade teachers’ computer skills to meet this goal. This paper summarizes the results of a telephone survey administered to all public school jurisdictions in the Province of Alberta with a 100% response rate. We examined the computer skills that school jurisdictions require of newly hired teachers, and the support strategies employed for currently employed teachers.'),(14,4,'en','copyrightHolder','Public Knowledge Preprint Server'),(15,4,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(16,4,'','copyrightYear','2025'),(17,4,'en','title','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice'),(18,5,'en','abstract','In this review, the recent progress on genetic transformation of forest trees were discussed. Its described also, different applications of genetic engineering for improving forest trees or understanding the mechanisms governing genes expression in woody plants.'),(19,5,'en','title','Genetic transformation of forest trees'),(20,6,'en','abstract','Robert Fogelin claims that interlocutors must share a framework of background beliefs and commitments in order to fruitfully pursue argument. I refute Fogelin’s claim by investigating more thoroughly the shared background required for productive argument. I find that this background consists not in any common beliefs regarding the topic at hand, but rather in certain shared pro-cedural commitments and competencies. I suggest that Fogelin and his supporters mistakenly view shared beliefs as part of the required background for productive argument because these procedural com-mitments become more difficult to uphold when people’s beliefs diverge widely regarding the topic at hand.'),(21,6,'en','title','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement'),(22,6,'en','copyrightHolder','Public Knowledge Preprint Server'),(23,6,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(24,6,'','copyrightYear','2025'),(25,7,'en','abstract','A major goal of education is to equip children with the knowledge, skills and self-belief to be confident and informed citizens - citizens who continue to see themselves as learners beyond graduation. This paper looks at the key role of nurturing efficacy beliefs in order to learn and participate in school and society. Research findings conducted within a social studies context are presented, showing how strategy instruction can enhance self-efficacy for learning. As part of this research, Creative Problem Solving (CPS) was taught to children as a means to motivate and support learning. It is shown that the use of CPS can have positive effects on self-efficacy for learning, and be a valuable framework to involve children in decision-making that leads to social action. Implications for enhancing self-efficacy and motivation to learn in the classroom are discussed.'),(26,7,'en','title','Developing efficacy beliefs in the classroom'),(27,7,'en','copyrightHolder','Public Knowledge Preprint Server'),(28,7,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(29,7,'','copyrightYear','2025'),(30,8,'en','abstract','The study of the commons has expe- rienced substantial growth and development over the past decades.1 Distinguished scholars in many disciplines had long studied how specific resources were managed or mismanaged at particular times and places (Coward 1980; De los Reyes 1980; MacKenzie 1979; Wittfogel 1957), but researchers who studied specific commons before the mid-1980s were, however, less likely than their contemporary colleagues to be well informed about the work of scholars in other disciplines, about other sec- tors in their own region of interest, or in other regions of the world.'),(31,8,'en','title','Developing efficacy beliefs in the classroom'),(32,8,'en','copyrightHolder','Public Knowledge Preprint Server'),(33,8,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(34,8,'','copyrightYear','2025'),(35,9,'en','abstract','None.'),(36,9,'en','title','Hansen & Pinto: Reason Reclaimed'),(37,9,'en','copyrightHolder','Public Knowledge Preprint Server'),(38,9,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(39,9,'','copyrightYear','2025'),(40,10,'en','abstract','The signaling theory suggests that dividends signal future prospects of a firm. However, recent empirical evidence from the US and the Uk does not offer a conclusive evidence on this issue. There are conflicting policy implications among financial economists so much that there is no practical dividend policy guidance to management, existing and potential investors in shareholding. Since corporate investment, financing and distribution decisions are a continuous function of management, the dividend decisions seem to rely on intuitive evaluation.'),(41,10,'en','title','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence'),(42,10,'en','copyrightHolder','Public Knowledge Preprint Server'),(43,10,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(44,10,'','copyrightYear','2025'),(45,11,'en','abstract','The Texas Water Availability Modeling System is routinely applied in administration of the water rights permit system, regional and statewide planning, and an expanding variety of other endeavors. Modeling water management in the 23 river basins of the state reflects about 8,000 water right permits and 3,400 reservoirs. Datasets are necessarily large and complex to provide the decision-support capabilities for which the modeling system was developed. New modeling features are being added, and the different types of applications are growing. Certain applications are enhanced by simplifying the simulation input datasets to focus on particular water management systems. A methodology is presented for developing a condensed dataset for a selected reservoir system that reflects the impacts of all the water rights and accompanying reservoirs removed from the original complete dataset. A set of streamflows is developed that represents flows available to the selected system considering the effects of all the other water rights in the river basin contained in the original complete model input dataset that are not included in the condensed dataset. The methodology is applied to develop a condensed model of the Brazos River Authority reservoir system based on modifying the Texas Water Availability Modeling System dataset for the Brazos River Basin.'),(46,11,'en','title','Condensing Water Availability Models to Focus on Specific Water Management Systems'),(47,11,'en','copyrightHolder','Public Knowledge Preprint Server'),(48,11,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(49,11,'','copyrightYear','2025'),(50,12,'en','abstract','Environmental sustainability and sustainable development principles are vital topics that engineering education has largely failed to address. Service-learning, which integrates social service into an academic setting, is an emerging tool that can be leveraged to teach sustainable design to future engineers. We present a model of using service-learning to teach sustainable design based on the experiences of the Stanford chapter of Engineers for a Sustainable World. The model involves the identification of projects and partner organizations, a student led, project-based design course, and internships coordinated with partner organizations. The model has been very successful, although limitations and challenges exist. These are discussed along with future directions for expanding the model.'),(51,12,'en','title','Learning Sustainable Design through Service'),(52,12,'en','copyrightHolder','Public Knowledge Preprint Server'),(53,12,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(54,12,'','copyrightYear','2025'),(55,13,'en','abstract','The aim of this study was to assess the influence of long-term fat supplementation on the fatty acid profile of heavy pig adipose tissue. Fifty-four Large White barrows, averaging 25 kg LW, were randomized (matched weights) to one of three isoenergetic diets supplemented with either tallow (TA), maize oil (MO), or rapeseed oil (RO). The fats were supplement- ed at 3% as fed from 25 to 110 kg LW, and at 2.5 % from 110 kg to slaughtering. Following slaughter at about 160 kg LW, backfat samples were collected from ten animals per treatment and analyzed. Fatty acid composition of backfat close- ly reflected the fatty acid composition of the supplemented fats. The backfat of pigs fed TA had the highest saturated fatty acid content (SFA) (P&lt;0.01); those fed MO had the highest content in polyunsaturated fatty acid (PUFA) and the lowest in monounsaturated fatty acid (MUFA) content; those fed RO had the highest content of linolenic acid (C18:3) and cis 11- ecosenoic acid (C20:1). Only MO treatment had an effect on linoleic acid levels and the iodine value (IV) of backfat, result- ing in levels higher than those (IV = 70; C18:2 = 15%) accepted by the Parma Consortium for dry-cured ham. The IV and unsaturation index in both layers of subcutaneous backfat tissue differed significantly between treatments. These results show that long-term dietary supplementation with different fats changes the fatty acid profile of heavy pig adipose tissue. Supplementation with rapeseed oil increases the proportion of “healthy” fatty acids in pig fat, thereby improving the nutritional quality, however the effects on the technological quality of the fat must be carefully assessed.'),(56,13,'en','title','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning'),(57,13,'en','copyrightHolder','Public Knowledge Preprint Server'),(58,13,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(59,13,'','copyrightYear','2025'),(60,14,'en','abstract','The Edwards Aquifer serves as the primary water supply in South-Central Texas and is the source for several major springs. In developing a plan to protect endangered species immediately downstream of San Marcos Springs, questions have been raised regarding the established concept of a hydrologic divide between the San Antonio and Barton Springs segments of the Edwards Aquifer during drought conditions. To address these questions, a water-level data collection program and a hydrogeologic study was conducted. An analysis of groundwater-level data indicate that a groundwater divide exists in the vicinity of the surface drainage divide between Onion Creek and Blanco River during wet and normal hydrologic conditions. However, analysis of data collected during the 2009 drought suggests that the groundwater divide dissipated and no longer hydrologically separated the two segments. As a result, there is potential for groundwater to flow past San Marcos Springs toward Barton Springs during major droughts. The implications for this have bearings on the management and availability of groundwater in the Edwards Aquifer. Assessments of simulations from a numerical model suggest 5 cfs could be flowing past San Marcos toward Barton springs under drought conditions. The groundwater divide appears to be influenced by recharge along Onion Creek and Blanco River and appears to be vulnerable to extended periods of little or no recharge and extensive pumping in the vicinity of Kyle and Buda. The 2009 data set shows a very low gradient in the potentiometric surface between San Marcos Springs and Kyle with very little variation in levels between drought and non-drought periods. From Kyle toward Barton Springs, the potentiometric surface slopes significantly to the north and has dramatic changes in levels between drought and non-drought periods. The source and nature of the discontinuity of the change in potentiometric gradients and dynamic water level response at Kyle is unknown. Structural influences or hydraulic properties inherent in the aquifer could be the cause of this discontinuity and may also influence the degree of hydrologic connection between San Marcos and Barton Springs. Rapid population growth and increased water demands in the Kyle and Buda areas necessitates a continual groundwater level monitoring program between San Marcos Springs and Buda to provide data for future hydrogeologic and trend analyses.'),(61,14,'en','title','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions'),(62,14,'en','copyrightHolder','Public Knowledge Preprint Server'),(63,14,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(64,14,'','copyrightYear','2025'),(65,15,'en','abstract','One of the challenges still to be met in the 21st century is that of genuinely embracing diversity. How can education help to overcome the barriers that continue to exist between people on the basis of language, culture and gender? This case study takes the Atlantic Coast of Nicaragua as an example of a multilingual/multiethnic region and examines how the community university URACCAN is contributing to the development of interculturality. It describes participatory research that was carried out with university staff and students with the intention of defining an intercultural curriculum and appropriate strategies for delivering such. One model used as a basis for discussions was the Model for Community Understanding from the Wales Curriculum Council, which emphasises the belonging of the individual to different communities or cultures at the same time. Factors supporting the development of an intercultural curriculum include the university’s close involvement with the ethnic communities it serves. However, ethno-linguistic power relations within the region and the country as a whole, still militate against egalitarianism within the university. The research highlights the importance of participatory pedagogy as the basis for promoting interculturality and achieving lasting social transformation.'),(66,15,'en','title','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua'),(67,15,'en','copyrightHolder','Public Knowledge Preprint Server'),(68,15,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(69,15,'','copyrightYear','2025'),(70,16,'en','abstract','This review presents different diseases associated with yam and the management strategies employed in combating its menace in Nigeria. The field and storage diseases are presented, anthracnose is regarded as the most widely spread of all the field diseases, while yam mosaic virus disease is considered to cause the most severe losses in yams. Dry rot is considered as the most devastating of all the storage diseases of yam. Dry rot of yams alone causes a marked reduction in the quantity, marketable value and edible portions of tubers and those reductions are more severe in stored yams. The management strategies adopted and advocated for combating the field diseases includes the use of crop rotation, fallowing, planting of healthy material, the destruction of infected crop cultivars and the use of resistant cultivars. With regards to the storage diseases, the use of Tecto (Thiabendazole), locally made dry gins or wood ash before storage has been found to protect yam tubers against fungal infection in storage. Finally, processing of yam tubers into chips or cubes increases its shelf live for a period of between 6 months and one year.'),(71,16,'en','title','Yam diseases and its management in Nigeria'),(72,16,'en','copyrightHolder','Public Knowledge Preprint Server'),(73,16,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(74,16,'','copyrightYear','2025'),(75,17,'en','abstract','Aim of this research is to provide a general situation of cattle slaughtered in Cameroon, as a representative example for the Central African Sub-region. The quality and safety of beef from the abattoir of Yaoundé, the largest in Cameroon, were considered. From January 2009 to March 2012, the pre-slaughter conditions and characteristics of 1953 cattle carcasses were recorded, as well as the pH of m. longissimus thoracis 24 h after slaughter. From these carcasses, 60 were selected to represent the bulls slaughtered. The quality parameters and composition of m. longissimus thoracis were carried out. The origin of most of the cattle was the Guinea High Savannah (74.6%), and transhumance was the common production system (75.5%). Gudali (45.6%), White Fulani (33.3%) and Red Mbororo (20.3%) breeds were predominant. Carcass weight was affected by rearing system and cattle category, and it markedly varied during year. Considering meat quality, the fat content was low (1.2%) and similar between breeds, moreover Gudali showed the toughest meat. Of the cows slaughtered, 27% were pregnant and the most common abnormal conditions encountered were ectoparasites, fatigue, lameness, fungal-like skin lesions, enlarged lymph nodes, respiratory distress, nodular lesions. More than 20% of the carcasses had some organs condemned, mainly for liver flukes (5.17%), and 1.0% of them were completely condemned due to tuberculosis, that also affected 3.28% of lungs. These data could aid authorities draw up programmes with the aim to strengthen cattle production, improve beef supply, control and prevent the observed diseases, and promote the regional trade.'),(76,17,'en','title','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat'),(77,17,'en','copyrightHolder','Public Knowledge Preprint Server'),(78,17,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(79,17,'','copyrightYear','2025'),(80,18,'en','abstract','The antimicrobial, heavy metal resistance patterns and plasmid profiles of Coliforms (Enterobacteriacea) isolated from nosocomial infections and healthy human faeces were compared. Fifteen of the 25 isolates from nosocomial infections were identified as Escherichia coli, and remaining as Kelebsiella pneumoniae. Seventy two percent of the strains isolated from nosocomial infections possess multiple resistance to antibiotics compared to 45% of strains from healthy human faeces. The difference between minimal inhibitory concentration (MIC) values of strains from clinical cases and from faeces for four heavy metals (Hg, Cu, Pb, Cd) was not significant. However most strains isolated from hospital were more tolerant to heavy metal than those from healthy persons. There was no consistent relationship between plasmid profile group and antimicrobial resistance pattern, although a conjugative plasmid (>56.4 kb) encoding resistance to heavy metals and antibiotics was recovered from eight of the strains isolated from nosocomial infections. The results indicate multidrug-resistance coliforms as a potential cause of nosocomial infection in this region.'),(81,18,'en','title','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran'),(82,18,'en','copyrightHolder','Public Knowledge Preprint Server'),(83,18,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(84,18,'','copyrightYear','2025'),(85,19,'en','abstract','We compare a setting where actors individually decide whom to sanction with a setting where sanctions are only implemented when actors collectively agree that a certain actor should be sanctioned. Collective sanctioning decisions are problematic due to the difficulty of reaching consensus. However, when a decision is made collectively, perverse sanctioning (e.g. punishing high contributors) by individual actors is ruled out. Therefore, collective sanctioning decisions are likely to be in the interest of the whole group.'),(86,19,'en','title','Self-Organization in Multi-Level Institutions in Networked Environments'),(87,19,'en','copyrightHolder','Public Knowledge Preprint Server'),(88,19,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(89,19,'','copyrightYear','2025'),(90,20,'en','abstract','None.'),(91,20,'en','title','Finocchiaro: Arguments About Arguments'),(92,20,'en','copyrightHolder','Public Knowledge Preprint Server'),(93,20,'fr_CA','copyrightHolder','Serveur de prépublication de la connaissance du public'),(94,20,'','copyrightYear','2025');
/*!40000 ALTER TABLE `publication_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publications`
--

DROP TABLE IF EXISTS `publications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publications` (
  `publication_id` bigint NOT NULL AUTO_INCREMENT,
  `access_status` bigint DEFAULT '0',
  `date_published` date DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `primary_contact_id` bigint DEFAULT NULL,
  `section_id` bigint DEFAULT NULL,
  `submission_id` bigint NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `url_path` varchar(64) DEFAULT NULL,
  `version` bigint DEFAULT NULL,
  `doi_id` bigint DEFAULT NULL,
  PRIMARY KEY (`publication_id`),
  KEY `publications_author_id` (`primary_contact_id`),
  KEY `publications_section_id` (`section_id`),
  KEY `publications_submission_id` (`submission_id`),
  KEY `publications_url_path` (`url_path`),
  KEY `publications_doi_id` (`doi_id`),
  CONSTRAINT `publications_author_id` FOREIGN KEY (`primary_contact_id`) REFERENCES `authors` (`author_id`) ON DELETE SET NULL,
  CONSTRAINT `publications_doi_id_foreign` FOREIGN KEY (`doi_id`) REFERENCES `dois` (`doi_id`) ON DELETE SET NULL,
  CONSTRAINT `publications_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections` (`section_id`) ON DELETE SET NULL,
  CONSTRAINT `publications_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3 COMMENT='Each publication is one version of a submission.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publications`
--

LOCK TABLES `publications` WRITE;
/*!40000 ALTER TABLE `publications` DISABLE KEYS */;
INSERT INTO `publications` VALUES (1,0,NULL,'2025-07-22 05:21:46',1,1,1,1,NULL,1,NULL),(2,0,'2025-07-22','2025-07-22 05:22:58',2,1,2,3,NULL,1,NULL),(3,0,'2025-07-22','2025-07-22 05:23:28',5,1,3,3,NULL,1,NULL),(4,0,'2025-07-22','2025-07-22 05:23:39',7,1,3,3,NULL,2,NULL),(5,0,NULL,'2025-07-22 05:23:45',9,1,4,1,NULL,1,NULL),(6,0,'2025-07-22','2025-07-22 05:24:37',10,1,5,3,NULL,1,NULL),(7,0,'2025-07-22','2025-07-22 05:24:58',11,1,6,3,NULL,1,NULL),(8,0,'2025-07-22','2025-07-22 05:25:19',12,1,7,3,NULL,1,NULL),(9,0,'2025-07-22','2025-07-22 05:25:40',14,1,8,3,NULL,1,NULL),(10,0,'2025-07-22','2025-07-22 05:26:01',15,1,9,3,NULL,1,NULL),(11,0,'2025-07-22','2025-07-22 05:26:23',16,1,10,3,NULL,1,NULL),(12,0,'2025-07-22','2025-07-22 05:26:45',17,1,11,3,NULL,1,NULL),(13,0,'2025-07-22','2025-07-22 05:27:06',19,1,12,3,NULL,1,NULL),(14,0,'2025-07-22','2025-07-22 05:27:27',20,1,13,3,NULL,1,NULL),(15,0,'2025-07-22','2025-07-22 05:27:48',21,1,14,3,NULL,1,NULL),(16,0,'2025-07-22','2025-07-22 05:28:10',22,1,15,3,NULL,1,NULL),(17,0,'2025-07-22','2025-07-22 05:28:31',23,1,16,3,NULL,1,NULL),(18,0,'2025-07-22','2025-07-22 05:28:52',24,1,17,3,NULL,1,NULL),(19,0,'2025-07-22','2025-07-22 05:29:13',25,1,18,3,NULL,1,NULL),(20,0,'2025-07-22','2025-07-22 05:29:36',26,1,19,3,NULL,1,NULL);
/*!40000 ALTER TABLE `publications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queries`
--

DROP TABLE IF EXISTS `queries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `queries` (
  `query_id` bigint NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint NOT NULL,
  `assoc_id` bigint NOT NULL,
  `stage_id` smallint NOT NULL,
  `seq` double NOT NULL DEFAULT '0',
  `date_posted` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `closed` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`query_id`),
  KEY `queries_assoc_id` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Discussions, usually related to a submission, created by editors, authors and other editorial staff.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queries`
--

LOCK TABLES `queries` WRITE;
/*!40000 ALTER TABLE `queries` DISABLE KEYS */;
/*!40000 ALTER TABLE `queries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `query_participants`
--

DROP TABLE IF EXISTS `query_participants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `query_participants` (
  `query_participant_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `query_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`query_participant_id`),
  UNIQUE KEY `query_participants_unique` (`query_id`,`user_id`),
  KEY `query_participants_query_id` (`query_id`),
  KEY `query_participants_user_id` (`user_id`),
  CONSTRAINT `query_participants_query_id_foreign` FOREIGN KEY (`query_id`) REFERENCES `queries` (`query_id`) ON DELETE CASCADE,
  CONSTRAINT `query_participants_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='The users assigned to a discussion.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `query_participants`
--

LOCK TABLES `query_participants` WRITE;
/*!40000 ALTER TABLE `query_participants` DISABLE KEYS */;
/*!40000 ALTER TABLE `query_participants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_assignment_settings`
--

DROP TABLE IF EXISTS `review_assignment_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_assignment_settings` (
  `review_assignment_settings_id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary key.',
  `review_id` bigint NOT NULL COMMENT 'Foreign key referencing record in review_assignments table',
  `locale` varchar(28) DEFAULT NULL COMMENT 'Locale key.',
  `setting_name` varchar(255) NOT NULL COMMENT 'Name of settings record.',
  `setting_value` mediumtext COMMENT 'Settings value.',
  PRIMARY KEY (`review_assignment_settings_id`),
  UNIQUE KEY `review_assignment_settings_unique` (`review_id`,`locale`,`setting_name`),
  KEY `review_assignment_settings_review_id` (`review_id`),
  CONSTRAINT `review_assignment_settings_review_id_foreign` FOREIGN KEY (`review_id`) REFERENCES `review_assignments` (`review_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_assignment_settings`
--

LOCK TABLES `review_assignment_settings` WRITE;
/*!40000 ALTER TABLE `review_assignment_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_assignment_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_assignments`
--

DROP TABLE IF EXISTS `review_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_assignments` (
  `review_id` bigint NOT NULL AUTO_INCREMENT,
  `submission_id` bigint NOT NULL,
  `reviewer_id` bigint NOT NULL,
  `competing_interests` text,
  `recommendation` smallint DEFAULT NULL,
  `date_assigned` datetime DEFAULT NULL,
  `date_notified` datetime DEFAULT NULL,
  `date_confirmed` datetime DEFAULT NULL,
  `date_completed` datetime DEFAULT NULL,
  `date_considered` datetime DEFAULT NULL,
  `date_acknowledged` datetime DEFAULT NULL,
  `date_due` datetime DEFAULT NULL,
  `date_response_due` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `reminder_was_automatic` smallint NOT NULL DEFAULT '0',
  `declined` smallint NOT NULL DEFAULT '0',
  `cancelled` smallint NOT NULL DEFAULT '0',
  `date_cancelled` datetime DEFAULT NULL,
  `date_rated` datetime DEFAULT NULL,
  `date_reminded` datetime DEFAULT NULL,
  `quality` smallint DEFAULT NULL,
  `review_round_id` bigint NOT NULL,
  `stage_id` smallint NOT NULL,
  `review_method` smallint NOT NULL DEFAULT '1',
  `round` smallint NOT NULL DEFAULT '1',
  `step` smallint NOT NULL DEFAULT '1',
  `review_form_id` bigint DEFAULT NULL,
  `considered` smallint DEFAULT NULL,
  `request_resent` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`review_id`),
  KEY `review_assignments_submission_id` (`submission_id`),
  KEY `review_assignments_reviewer_id` (`reviewer_id`),
  KEY `review_assignment_reviewer_round` (`review_round_id`,`reviewer_id`),
  KEY `review_assignments_form_id` (`review_form_id`),
  KEY `review_assignments_reviewer_review` (`reviewer_id`,`review_id`),
  CONSTRAINT `review_assignments_review_form_id_foreign` FOREIGN KEY (`review_form_id`) REFERENCES `review_forms` (`review_form_id`),
  CONSTRAINT `review_assignments_review_round_id_foreign` FOREIGN KEY (`review_round_id`) REFERENCES `review_rounds` (`review_round_id`),
  CONSTRAINT `review_assignments_reviewer_id_foreign` FOREIGN KEY (`reviewer_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `review_assignments_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Data about peer review assignments for all submissions.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_assignments`
--

LOCK TABLES `review_assignments` WRITE;
/*!40000 ALTER TABLE `review_assignments` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_files`
--

DROP TABLE IF EXISTS `review_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_files` (
  `review_file_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `review_id` bigint NOT NULL,
  `submission_file_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`review_file_id`),
  UNIQUE KEY `review_files_unique` (`review_id`,`submission_file_id`),
  KEY `review_files_review_id` (`review_id`),
  KEY `review_files_submission_file_id` (`submission_file_id`),
  CONSTRAINT `review_files_review_id_foreign` FOREIGN KEY (`review_id`) REFERENCES `review_assignments` (`review_id`) ON DELETE CASCADE,
  CONSTRAINT `review_files_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='A list of the submission files made available to each assigned reviewer.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_files`
--

LOCK TABLES `review_files` WRITE;
/*!40000 ALTER TABLE `review_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_form_element_settings`
--

DROP TABLE IF EXISTS `review_form_element_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_form_element_settings` (
  `review_form_element_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `review_form_element_id` bigint NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL,
  PRIMARY KEY (`review_form_element_setting_id`),
  UNIQUE KEY `review_form_element_settings_unique` (`review_form_element_id`,`locale`,`setting_name`),
  KEY `review_form_element_settings_review_form_element_id` (`review_form_element_id`),
  CONSTRAINT `review_form_element_settings_review_form_element_id` FOREIGN KEY (`review_form_element_id`) REFERENCES `review_form_elements` (`review_form_element_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='More data about review form elements, including localized content such as question text.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_form_element_settings`
--

LOCK TABLES `review_form_element_settings` WRITE;
/*!40000 ALTER TABLE `review_form_element_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_form_element_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_form_elements`
--

DROP TABLE IF EXISTS `review_form_elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_form_elements` (
  `review_form_element_id` bigint NOT NULL AUTO_INCREMENT,
  `review_form_id` bigint NOT NULL,
  `seq` double DEFAULT NULL,
  `element_type` bigint DEFAULT NULL,
  `required` smallint DEFAULT NULL,
  `included` smallint DEFAULT NULL,
  PRIMARY KEY (`review_form_element_id`),
  KEY `review_form_elements_review_form_id` (`review_form_id`),
  CONSTRAINT `review_form_elements_review_form_id` FOREIGN KEY (`review_form_id`) REFERENCES `review_forms` (`review_form_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Each review form element represents a single question on a review form.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_form_elements`
--

LOCK TABLES `review_form_elements` WRITE;
/*!40000 ALTER TABLE `review_form_elements` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_form_elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_form_responses`
--

DROP TABLE IF EXISTS `review_form_responses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_form_responses` (
  `review_form_response_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `review_form_element_id` bigint NOT NULL,
  `review_id` bigint NOT NULL,
  `response_type` varchar(6) DEFAULT NULL,
  `response_value` text,
  PRIMARY KEY (`review_form_response_id`),
  KEY `review_form_responses_review_form_element_id` (`review_form_element_id`),
  KEY `review_form_responses_review_id` (`review_id`),
  KEY `review_form_responses_unique` (`review_form_element_id`,`review_id`),
  CONSTRAINT `review_form_responses_review_form_element_id_foreign` FOREIGN KEY (`review_form_element_id`) REFERENCES `review_form_elements` (`review_form_element_id`) ON DELETE CASCADE,
  CONSTRAINT `review_form_responses_review_id_foreign` FOREIGN KEY (`review_id`) REFERENCES `review_assignments` (`review_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Each review form response records a reviewer''s answer to a review form element associated with a peer review.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_form_responses`
--

LOCK TABLES `review_form_responses` WRITE;
/*!40000 ALTER TABLE `review_form_responses` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_form_responses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_form_settings`
--

DROP TABLE IF EXISTS `review_form_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_form_settings` (
  `review_form_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `review_form_id` bigint NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  `setting_type` varchar(6) NOT NULL,
  PRIMARY KEY (`review_form_setting_id`),
  UNIQUE KEY `review_form_settings_unique` (`review_form_id`,`locale`,`setting_name`),
  KEY `review_form_settings_review_form_id` (`review_form_id`),
  CONSTRAINT `review_form_settings_review_form_id` FOREIGN KEY (`review_form_id`) REFERENCES `review_forms` (`review_form_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='More data about review forms, including localized content such as names.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_form_settings`
--

LOCK TABLES `review_form_settings` WRITE;
/*!40000 ALTER TABLE `review_form_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_form_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_forms`
--

DROP TABLE IF EXISTS `review_forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_forms` (
  `review_form_id` bigint NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint NOT NULL,
  `assoc_id` bigint NOT NULL,
  `seq` double DEFAULT NULL,
  `is_active` smallint DEFAULT NULL,
  PRIMARY KEY (`review_form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Review forms provide custom templates for peer reviews with several types of questions.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_forms`
--

LOCK TABLES `review_forms` WRITE;
/*!40000 ALTER TABLE `review_forms` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_forms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_round_files`
--

DROP TABLE IF EXISTS `review_round_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_round_files` (
  `review_round_file_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `submission_id` bigint NOT NULL,
  `review_round_id` bigint NOT NULL,
  `stage_id` smallint NOT NULL,
  `submission_file_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`review_round_file_id`),
  UNIQUE KEY `review_round_files_unique` (`submission_id`,`review_round_id`,`submission_file_id`),
  KEY `review_round_files_submission_id` (`submission_id`),
  KEY `review_round_files_review_round_id` (`review_round_id`),
  KEY `review_round_files_submission_file_id` (`submission_file_id`),
  CONSTRAINT `review_round_files_review_round_id_foreign` FOREIGN KEY (`review_round_id`) REFERENCES `review_rounds` (`review_round_id`) ON DELETE CASCADE,
  CONSTRAINT `review_round_files_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE,
  CONSTRAINT `review_round_files_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Records the files made available to reviewers for a round of reviews. These can be further customized on a per review basis with review_files.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_round_files`
--

LOCK TABLES `review_round_files` WRITE;
/*!40000 ALTER TABLE `review_round_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_round_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_rounds`
--

DROP TABLE IF EXISTS `review_rounds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_rounds` (
  `review_round_id` bigint NOT NULL AUTO_INCREMENT,
  `submission_id` bigint NOT NULL,
  `stage_id` bigint DEFAULT NULL,
  `round` smallint NOT NULL,
  `review_revision` bigint DEFAULT NULL,
  `status` bigint DEFAULT NULL,
  PRIMARY KEY (`review_round_id`),
  UNIQUE KEY `review_rounds_submission_id_stage_id_round_pkey` (`submission_id`,`stage_id`,`round`),
  KEY `review_rounds_submission_id` (`submission_id`),
  CONSTRAINT `review_rounds_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Peer review assignments are organized into multiple rounds on a submission.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_rounds`
--

LOCK TABLES `review_rounds` WRITE;
/*!40000 ALTER TABLE `review_rounds` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_rounds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviewer_suggestion_settings`
--

DROP TABLE IF EXISTS `reviewer_suggestion_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviewer_suggestion_settings` (
  `reviewer_suggestion_id` bigint NOT NULL COMMENT 'The foreign key mapping of this setting to reviewer_suggestions table',
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  UNIQUE KEY `reviewer_suggestion_settings_unique` (`reviewer_suggestion_id`,`locale`,`setting_name`),
  KEY `reviewer_suggestion_settings_reviewer_suggestion_id` (`reviewer_suggestion_id`),
  KEY `reviewer_suggestion_settings_locale_setting_name_index` (`setting_name`,`locale`),
  CONSTRAINT `reviewer_suggestion_settings_reviewer_suggestion_id_foreign` FOREIGN KEY (`reviewer_suggestion_id`) REFERENCES `reviewer_suggestions` (`reviewer_suggestion_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Reviewer suggestion settings table to contain multilingual or extra information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviewer_suggestion_settings`
--

LOCK TABLES `reviewer_suggestion_settings` WRITE;
/*!40000 ALTER TABLE `reviewer_suggestion_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviewer_suggestion_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviewer_suggestions`
--

DROP TABLE IF EXISTS `reviewer_suggestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviewer_suggestions` (
  `reviewer_suggestion_id` bigint NOT NULL AUTO_INCREMENT,
  `suggesting_user_id` bigint DEFAULT NULL COMMENT 'The user/author who has made the suggestion',
  `submission_id` bigint NOT NULL COMMENT 'Submission at which the suggestion was made',
  `email` varchar(255) NOT NULL COMMENT 'Suggested reviewer email address',
  `orcid_id` varchar(255) DEFAULT NULL COMMENT 'Suggested reviewer optional Orcid Id',
  `approved_at` timestamp NULL DEFAULT NULL COMMENT 'If and when the suggestion approved to add/invite suggested_reviewer',
  `approver_id` bigint DEFAULT NULL COMMENT 'The user who has approved the suggestion',
  `reviewer_id` bigint DEFAULT NULL COMMENT 'The reviewer who has been added/invited through this suggestion',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`reviewer_suggestion_id`),
  KEY `reviewer_suggestions_suggesting_user_id` (`suggesting_user_id`),
  KEY `reviewer_suggestions_submission_id` (`submission_id`),
  KEY `reviewer_suggestions_approver_id_foreign` (`approver_id`),
  KEY `reviewer_suggestions_reviewer_id_foreign` (`reviewer_id`),
  CONSTRAINT `reviewer_suggestions_approver_id_foreign` FOREIGN KEY (`approver_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL,
  CONSTRAINT `reviewer_suggestions_reviewer_id_foreign` FOREIGN KEY (`reviewer_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL,
  CONSTRAINT `reviewer_suggestions_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE,
  CONSTRAINT `reviewer_suggestions_suggesting_user_id_foreign` FOREIGN KEY (`suggesting_user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Author suggested reviewers at the submission time';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviewer_suggestions`
--

LOCK TABLES `reviewer_suggestions` WRITE;
/*!40000 ALTER TABLE `reviewer_suggestions` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviewer_suggestions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ror_settings`
--

DROP TABLE IF EXISTS `ror_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ror_settings` (
  `ror_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ror_id` bigint NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  PRIMARY KEY (`ror_setting_id`),
  UNIQUE KEY `ror_settings_unique` (`ror_id`,`locale`,`setting_name`),
  CONSTRAINT `ror_settings_ror_id_foreign` FOREIGN KEY (`ror_id`) REFERENCES `rors` (`ror_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='More data about Ror registry dataset cache';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ror_settings`
--

LOCK TABLES `ror_settings` WRITE;
/*!40000 ALTER TABLE `ror_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `ror_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rors`
--

DROP TABLE IF EXISTS `rors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rors` (
  `ror_id` bigint NOT NULL AUTO_INCREMENT,
  `ror` varchar(255) NOT NULL,
  `display_locale` varchar(28) NOT NULL,
  `is_active` smallint NOT NULL DEFAULT '1',
  `search_phrase` mediumtext,
  PRIMARY KEY (`ror_id`),
  UNIQUE KEY `rors_unique` (`ror`),
  KEY `rors_display_locale` (`display_locale`),
  KEY `rors_is_active` (`is_active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Ror registry dataset cache';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rors`
--

LOCK TABLES `rors` WRITE;
/*!40000 ALTER TABLE `rors` DISABLE KEYS */;
/*!40000 ALTER TABLE `rors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section_settings`
--

DROP TABLE IF EXISTS `section_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `section_settings` (
  `section_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `section_id` bigint NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  PRIMARY KEY (`section_setting_id`),
  UNIQUE KEY `section_settings_unique` (`section_id`,`locale`,`setting_name`),
  KEY `section_settings_section_id` (`section_id`),
  CONSTRAINT `section_settings_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections` (`section_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 COMMENT='More data about sections, including localized properties such as section titles.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section_settings`
--

LOCK TABLES `section_settings` WRITE;
/*!40000 ALTER TABLE `section_settings` DISABLE KEYS */;
INSERT INTO `section_settings` VALUES (1,1,'en','title','Preprints'),(2,1,'en','abbrev','PRE'),(3,1,'','path','preprints'),(4,1,'en','policy','<p>Section default policy</p>'),(5,1,'fr_CA','title',''),(6,1,'fr_CA','abbrev',''),(7,1,'en','description',''),(8,1,'fr_CA','description',''),(9,1,'en','identifyType',''),(10,1,'fr_CA','identifyType',''),(11,1,'fr_CA','policy','');
/*!40000 ALTER TABLE `section_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections` (
  `section_id` bigint NOT NULL AUTO_INCREMENT,
  `server_id` bigint NOT NULL,
  `review_form_id` bigint DEFAULT NULL,
  `seq` double NOT NULL DEFAULT '0',
  `editor_restricted` tinyint NOT NULL DEFAULT '0',
  `meta_indexed` tinyint NOT NULL DEFAULT '0',
  `meta_reviewed` tinyint NOT NULL DEFAULT '1',
  `abstracts_not_required` tinyint NOT NULL DEFAULT '0',
  `hide_title` tinyint NOT NULL DEFAULT '0',
  `hide_author` tinyint NOT NULL DEFAULT '0',
  `is_inactive` tinyint NOT NULL DEFAULT '0',
  `abstract_word_count` bigint DEFAULT NULL,
  PRIMARY KEY (`section_id`),
  KEY `sections_server_id` (`server_id`),
  KEY `sections_review_form_id` (`review_form_id`),
  CONSTRAINT `sections_review_form_id_foreign` FOREIGN KEY (`review_form_id`) REFERENCES `review_forms` (`review_form_id`) ON DELETE SET NULL,
  CONSTRAINT `sections_server_id_foreign` FOREIGN KEY (`server_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='Submissions can be organized into sections, which determine the front-end presentation and provide options for selective harvesting in the OAI-PMH interface.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
INSERT INTO `sections` VALUES (1,1,NULL,0,0,1,1,0,0,0,0,0);
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server_settings`
--

DROP TABLE IF EXISTS `server_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `server_settings` (
  `server_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `server_id` bigint NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  PRIMARY KEY (`server_setting_id`),
  UNIQUE KEY `server_settings_unique` (`server_id`,`locale`,`setting_name`),
  KEY `server_settings_server_id` (`server_id`),
  CONSTRAINT `server_settings_server_id` FOREIGN KEY (`server_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb3 COMMENT='More data about server settings, including localized properties such as policies.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server_settings`
--

LOCK TABLES `server_settings` WRITE;
/*!40000 ALTER TABLE `server_settings` DISABLE KEYS */;
INSERT INTO `server_settings` VALUES (1,1,'en','acronym','JPKPKP'),(3,1,'en','authorGuidelines','<p>Researchers are invited to submit a preprint to be posted on this server. All preprints will be moderated to determine whether they meet the aims and scope of this server. Those considered to be a good fit will be posted and the author will be notified.</p><p>Before submitting a preprint, authors are responsible for obtaining permission to share any material included with the preprint, such as photos, documents and datasets. All authors identified on the preprint must consent to be identified as an author. Where appropriate, research should be approved by an appropriate ethics committee in accordance with the legal requirements of the study\'s country.</p><p> When you\'re satisfied that your preprint meets this standard, please follow the checklist below to prepare your submission.</p>'),(4,1,'fr_CA','authorGuidelines','##default.contextSettings.authorGuidelines##'),(5,1,'en','authorInformation','Interested in submitting to this server? We recommend that you review the <a href=\"http://localhost/index.php/publicknowledge/about\">About</a> page for the policies, as well as the <a href=\"http://localhost/index.php/publicknowledge/about/submissions#authorGuidelines\">Author Guidelines</a>. Authors need to <a href=\"http://localhost/index.php/publicknowledge/user/register\">register</a> prior to submitting or, if already registered, can simply <a href=\"http://localhost/index.php/index/login\">log in</a> and begin the process.'),(6,1,'fr_CA','authorInformation','##default.contextSettings.forAuthors##'),(7,1,'en','beginSubmissionHelp','<p>Thank you for posting your preprint at Public Knowledge Preprint Server. You will be asked to upload files, identify co-authors, and provide information such as the title and abstract.<p><p>Please read our <a href=\"http://localhost/index.php/publicknowledge/about/submissions\" target=\"_blank\">Submission Guidelines</a> if you have not done so already. When filling out the forms, provide as many details as possible in order to help our readers find your work.</p><p>Once you begin, you can save your submission and come back to it later. You will be able to review and correct any information before you submit.</p>'),(8,1,'fr_CA','beginSubmissionHelp','<p>Merci de votre soumission à la revue Public Knowledge Preprint Server. Il vous sera demandé de téléverser des fichiers, identifier des co-auteur.trice.s et fournir des informations comme le titre et le résumé.<p><p>Si vous ne l\'avez pas encore fait, merci de consulter nos <a href=\"http://localhost/index.php/publicknowledge/about/submissions\" target=\"_blank\">Recommandations pour la soumission</a>. Lorsque vous remplissez les formulaires, merci de fournir autant de détails que possible pour aider nos éditeur.trice.s à évaluer votre travail. </p><p>Une fois que vous avez commencé, vous pouvez enregistrer votre soumission et y revenir plus tard. Vous pourrez alors réviser et modifier toutes les informations voulues avant de soumettre le tout.</p>'),(9,1,'','contactEmail','rvaca@mailinator.com'),(10,1,'','contactName','Ramiro Vaca'),(11,1,'en','contributorsHelp','<p>Add details for all of the contributors to this submission. Contributors added here will be sent an email confirmation of the submission.</p><p> If a contributor can not be contacted by email, because they must remain anonymous or do not have an email account, please do not enter a fake email address. You can add information about this contributor in a message to the moderators at a later step in the submission process.</p>'),(12,1,'fr_CA','contributorsHelp','<p>Ajouter des informations relatives à tous les contributeurs.trices à cette soumission. Les contributeurs.trices ajouté.e.s ici se verront envoyer un courriel de confirmation de la soumission ainsi qu\'une copie de toutes les décisions éditoriales enregistrées pour cette soumission.</p><p>Si un.e contributeur.trice ne peut être contacté.e par courriel parce qu\'il ou elle doit demeurer anonyme ou n\'a pas de compte de messagerie, veuillez ne pas entrer de courriel fictif. Vous pouvez ajouter des informations sur ce ou cette contributeur.trice à une étape ultérieure du processus de soumission.</p>'),(13,1,'','country','IS'),(14,1,'','defaultReviewMode','2'),(15,1,'en','description','<p>The Public Knowledge Preprint Server is a preprint service on the subject of public access to science.</p>'),(16,1,'fr_CA','description','<p>Le Serveur de prépublication de la connaissance du public est une service trimestrielle évaluée par les pairs sur le thème de l\'accès du public à la science.</p>'),(17,1,'en','detailsHelp','<p>Please provide the following details to help us manage your submission in our system.</p>'),(18,1,'fr_CA','detailsHelp','<p>Veuillez fournir les informations suivantes afin de nous aider à gérer votre soumission dans notre système.</p>'),(19,1,'','copySubmissionAckPrimaryContact','0'),(20,1,'','copySubmissionAckAddress',''),(21,1,'','emailSignature','<br><br>—<br><p>This is an automated message from <a href=\"http://localhost/index.php/publicknowledge\">Public Knowledge Preprint Server</a>.</p>'),(22,1,'','enableDois','1'),(23,1,'','doiSuffixType','default'),(24,1,'','registrationAgency',''),(25,1,'','disableSubmissions','0'),(26,1,'','editorialStatsEmail','1'),(27,1,'en','forTheEditorsHelp','<p>Please provide the following details in order to help readers discover your preprint.</p><p>When entering metadata such as keywords, provide entries that you think would be most helpful to readers looking for research like yours.</p>'),(28,1,'fr_CA','forTheEditorsHelp','<p>S\'il vous plaît, fournissez les détails suivants afin d\'aider l\'équipe éditoriale à gérer votre soumission.</p><p>Dans vos métadonnées, assurez vous de fournir des informations que vous pensez pouvoir être utile à la personne qui gérera votre soumission. Cette information peut être changée avant publication.</p>'),(29,1,'','itemsPerPage','25'),(30,1,'','keywords','request'),(31,1,'en','librarianInformation','We encourage research librarians to list this server among their library\'s holdings. As well, it may be worth noting that this server\'s open source system is suitable for libraries to host for their faculty members to use (see <a href=\"https://pkp.sfu.ca\">Public Knowledge Project</a>).'),(32,1,'fr_CA','librarianInformation','##default.contextSettings.forLibrarians##'),(33,1,'en','name','Public Knowledge Preprint Server'),(34,1,'fr_CA','name','Serveur de prépublication de la connaissance du public'),(35,1,'','notifyAllAuthors','1'),(36,1,'','numPageLinks','10'),(37,1,'','numWeeksPerResponse','4'),(38,1,'','numWeeksPerReview','4'),(39,1,'','numReviewsPerSubmission','0'),(40,1,'en','openAccessPolicy','This server provides immediate open access to its content on the principle that making research freely available to the public supports a greater global exchange of knowledge.'),(41,1,'fr_CA','openAccessPolicy','##default.contextSettings.openAccessPolicy##'),(42,1,'','orcidCity',''),(43,1,'','orcidClientId',''),(44,1,'','orcidClientSecret',''),(45,1,'','orcidEnabled','0'),(46,1,'','orcidLogLevel','ERROR'),(47,1,'','orcidSendMailToAuthorsOnPublication','0'),(48,1,'en','privacyStatement','<p>The names and email addresses entered in this server site will be used exclusively for the stated purposes of this server and will not be made available for any other purpose or to any other party.</p>'),(49,1,'fr_CA','privacyStatement','##default.contextSettings.privacyStatement##'),(50,1,'en','readerInformation','We encourage readers to sign up for the posting notification service for this server. Use the <a href=\"http://localhost/index.php/publicknowledge/user/register\">Register</a> link at the top of the home page. This list also allows the server to claim a certain level of support or readership. See the <a href=\"http://localhost/index.php/publicknowledge/about/submissions#privacyStatement\">Privacy Statement</a>, which assures readers that their name and email address will not be used for other purposes.'),(51,1,'fr_CA','readerInformation','##default.contextSettings.forReaders##'),(52,1,'en','reviewHelp','<p>Review the information you have entered before you complete your submission. You can change any of the details displayed here by clicking the edit button at the top of each section.</p>'),(53,1,'fr_CA','reviewHelp','<p>Révisez l\'information que vous avez fourni avant de finaliser votre soumission. Vous pouvez modifier chaque détails affichés en cliquant sur le bouton d\'édition en haut de chaque section.</p><p>Une fois votre soumission transmise, un membre de l\'équipe éditoriale lui sera assigné afin de l\'évaluer. S\'il vous plaît, assurez vous que les détails fournis sont le plus exactes possibles.</p>'),(54,1,'','submissionAcknowledgement','allAuthors'),(55,1,'en','submissionChecklist','<p>All submissions must meet the following requirements.</p><ul><li>This submission meets the requirements outlined in the <a href=\"http://localhost/index.php/publicknowledge/about/submissions\">Author Guidelines</a>.</li><li>This submission has not been previously posted.</li><li>All references have been checked for accuracy and completeness.</li><li>All tables and figures have been numbered and labeled.</li><li>Permission has been obtained to post all photos, datasets and other material provided with this preprint.</li></ul>'),(56,1,'fr_CA','submissionChecklist','##default.contextSettings.checklist##'),(57,1,'','submitWithCategories','0'),(58,1,'','supportedAddedSubmissionLocales','[\"en\",\"fr_CA\"]'),(59,1,'','supportedDefaultSubmissionLocale','en'),(60,1,'','supportedFormLocales','[\"en\",\"fr_CA\"]'),(61,1,'','supportedLocales','[\"en\",\"fr_CA\"]'),(62,1,'','supportedSubmissionLocales','[\"en\",\"fr_CA\"]'),(63,1,'','supportedSubmissionMetadataLocales','[\"en\",\"fr_CA\"]'),(64,1,'','themePluginPath','default'),(65,1,'en','uploadFilesHelp','<p>Upload the preprint you would like to share. In addition to the main work, you may wish to upload data sets or other supplementary files that will help researchers understand and evaluate your work.</p>'),(66,1,'fr_CA','uploadFilesHelp','<p> Fournir tous les fichiers dont notre équipe éditoriale pourrait avoir besoin pour évaluer votre soumission. En plus du fichier principal, vous pouvez soumettre des ensembles de données, une déclaration relative au conflit d\'intérêt ou tout autre fichier potentiellement utile pour nos éditeur.trice.s.</p>'),(67,1,'','enableGeoUsageStats','disabled'),(68,1,'','enableInstitutionUsageStats','0'),(69,1,'','isSushiApiPublic','1'),(72,1,'','enableAuthorScreening','0'),(73,1,'','enabledDoiTypes','[\"publication\"]'),(74,1,'','postedAcknowledgement','1'),(75,1,'','enableOai','1'),(76,1,'','doiVersioning','1'),(77,1,'en','customHeaders','<meta name=\"pkp\" content=\"Test metatag.\">'),(78,1,'en','searchDescription','The Public Knowledge Preprint Server is a preprint service on the subject of public access to science.'),(79,1,'en','abbreviation','publicknowledgePub Know Pre'),(80,1,'','mailingAddress','123 456th Street\nBurnaby, British Columbia\nCanada'),(81,1,'','supportEmail','rvaca@mailinator.com'),(82,1,'','supportName','Ramiro Vaca');
/*!40000 ALTER TABLE `server_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servers`
--

DROP TABLE IF EXISTS `servers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servers` (
  `server_id` bigint NOT NULL AUTO_INCREMENT,
  `path` varchar(32) NOT NULL,
  `seq` double NOT NULL DEFAULT '0' COMMENT 'Used to order lists of servers',
  `primary_locale` varchar(28) NOT NULL,
  `enabled` tinyint NOT NULL DEFAULT '1' COMMENT 'Controls whether or not the server is considered "live" and will appear on the website. (Note that disabled servers may still be accessible, but only if the user knows the URL.)',
  PRIMARY KEY (`server_id`),
  UNIQUE KEY `servers_path` (`path`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='A list of preprint servers managed by the installation.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servers`
--

LOCK TABLES `servers` WRITE;
/*!40000 ALTER TABLE `servers` DISABLE KEYS */;
INSERT INTO `servers` VALUES (1,'publicknowledge',1,'en',1);
/*!40000 ALTER TABLE `servers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text,
  `last_activity` int NOT NULL,
  `payload` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`),
  CONSTRAINT `sessions_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Session data for logged-in users.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('0niIXRDIee5FdoAtPXFteEaS4mdqYrmIYWeITywJ',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1753161647,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiaHRKNXhLVXAxVkVOdHdncGl1WEtIbGF6WXNVTnl1V3gxNkQxMEhteSI7czo4OiJ1c2VybmFtZSI7czo1OiJhZG1pbiI7czo1OiJlbWFpbCI7czoyMzoicGtwYWRtaW5AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0='),('28yiHstiCLkWLG1svMqS3288LwXY0DqSEfp7jTz3',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1753161630,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiWkE4QzNQYVk3NGFiSG90NUtUUjRCeHBJWFoyc3NWeWRrS0V1TXJUZCI7czo4OiJ1c2VybmFtZSI7czo1OiJhZG1pbiI7czo1OiJlbWFpbCI7czoyMzoicGtwYWRtaW5AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0='),('2GWfVJRaADDTUfBPIXNzMs7r0eeOb3EJAXORKsjo',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1753161877,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoidm9Vdm5QTkRkczFPakhRbG9hVjJyazVJSzFRd1M2Z1BhMnZQSlhJbCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCR6cS9RdVFneEpYZUFDY2NTVzdPWE8uN1ZWQlk5azF5UnlHdTU2R0lSL1RRNVhxczZJYWdYcSI7fQ=='),('2PveisUlivdi7Lsdrtz5l0RR0tWoKNdIZs4wBZVm',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1753161916,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiMUgycWVXVWFBZ0E2SGl0OHNpaDdBTXNvdll1TEx1RTl3VEtaWTVJRiI7czo4OiJ1c2VybmFtZSI7czo3OiJlb3N0cm9tIjtzOjU6ImVtYWlsIjtzOjIyOiJlb3N0cm9tQG1haWxpbmF0b3IuY29tIjtzOjUwOiJsb2dpbl93ZWJfYzFhMjZiYzAwMjQ5ZGM2MjFmMDNjNDE3NzhkNTVmZTMzMWU3ZTkxMiI7TjtzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19'),('3atcCbouPrKvMYA0OSlmJK07R7XxaMWmrB0N1e9s',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1753161870,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiNkpaVVFFeHhDNlNWVkh3SndPb0c0ek1wS01LdzJkd0J1OTJhU2ZkUyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCQ4Li9RSFpVNWNVMEMycUhITXBLLkZPUllkdlRwMTJXOTY4WHJJOVVrb1o5QWkxdEZ3NVphLiI7fQ=='),('3WazBi6bmA5Hf1iTIWApS8mwSgfYa0AxsT8MnEK5',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1753161874,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiSzZKbktJSUYyVm8yd2RtUkxNUnZRSW40SXl6RWhPZlhIWDQwZXM5UiI7czo4OiJ1c2VybmFtZSI7czo3OiJkYmFybmVzIjtzOjU6ImVtYWlsIjtzOjIyOiJkYmFybmVzQG1haWxpbmF0b3IuY29tIjtzOjUwOiJsb2dpbl93ZWJfYzFhMjZiYzAwMjQ5ZGM2MjFmMDNjNDE3NzhkNTVmZTMzMWU3ZTkxMiI7TjtzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19'),('4VAqU1H9vDrgucol5y70qma5nm8HZJo90Bn6syAL',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1753161565,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiVWlVckR1RVVnMEZJbDZzck5TQXkzZ3Z5T1ppcWNtb3BCRktFNjhuRSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MTtzOjY6InVzZXJJZCI7aToxO3M6ODoidXNlcm5hbWUiO3M6NToiYWRtaW4iO3M6NToiZW1haWwiO3M6MjM6InBrcGFkbWluQG1haWxpbmF0b3IuY29tIjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJENMbVN0TWpRLlAudG5qUTl5b1JoNnV4aW5XSGtNOUxlaGdHa3pId3lubUh4TGo2akxkZ2JlIjt9'),('5dQVYfOr4G8C2SEQlqbu6dioULrzmjns79BbvO7J',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1753161779,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiMHFpeVFOUGlzM05WUG5MWkdmQ2hDYmhRQlZlVkd2aTY1N1VhN3lrbSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRydnZQRFBCZEdQQWlUMjZYd3JkbDBlblBCNW5aaDgyVHdMaWI4ZGU1N0d6SFp0UjJYTmZYaSI7fQ=='),('67KOZNbdfKNEWXt0Usmvx2POZOPcbAOguAs9K3Rg',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1753162002,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiN200c0U5WmpRY2pzd2dSM1p4c2RvRnRlb0JTNURvZXRRR2ZVVXVmYiI7czo4OiJ1c2VybmFtZSI7czoxMDoia2Fsa2hhZmFqaSI7czo1OiJlbWFpbCI7czoyNToia2Fsa2hhZmFqaUBtYWlsaW5hdG9yLmNvbSI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO047czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ=='),('6GGFACxkdrxBH3BP4UgtX5DQm5bklB9mAiErUpet',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1753161980,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoieDRXaUZwSURTT0Q3WU04akF5SmZtdHBMeHJsc0QyQTUwSGtTUk9VaSI7czo4OiJ1c2VybmFtZSI7czo2OiJqbm92YWsiO3M6NToiZW1haWwiO3M6MjE6Impub3Zha0BtYWlsaW5hdG9yLmNvbSI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO047czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ=='),('6GutmsgBThyPulPmTiFSNm40aRe5iL7OXyrX0x4Y',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1753161605,'YTozOntzOjY6Il90b2tlbiI7czo0MDoicmNtQzB0VVVrTHMxWTJZRFNFSUJlN09SSnduVXBFWGJ4NGVHSnBGaiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),('6oRIcvOfWOpfiQMmu5O84eVozMoFieWsCadWsHT0',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1753161849,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiRURhUEd5SmtJOG9NeFFKVzhXc0tJNFFYZUhnRjQ0SE9wcGh0M3RJNyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRjVXp5alBGV29ueDlJNlk4Y1JJb1h1cVB5VGNTdlBQYzE0L0F6ZVJueko3VGhqWHBXem4uRyI7fQ=='),('75pZgyq7Ez5Bbs2pugdij9KrBKfadR8Sl218QwCW',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1753161895,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiVGJwbEZGVFhnZ1JqR1VxWEt3NDhjMjRQTndxdnJGM3ZHT2hKQkR4SyI7czo4OiJ1c2VybmFtZSI7czo5OiJkc29rb2xvZmYiO3M6NToiZW1haWwiO3M6MjQ6ImRzb2tvbG9mZkBtYWlsaW5hdG9yLmNvbSI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO047czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ=='),('7KaufYyAwLThXVv8WF2ADGStneFj4tY3zi0GOYJ9',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1753162150,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiVGZocXdsejFwUVBZblY3aEYyT0V6WmR0SUdsVnkzU3BhUnRCOHF5MCI7czo4OiJ1c2VybmFtZSI7czoxMToidndpbGxpYW1zb24iO3M6NToiZW1haWwiO3M6MjY6InZ3aWxsaWFtc29uQG1haWxpbmF0b3IuY29tIjtzOjUwOiJsb2dpbl93ZWJfYzFhMjZiYzAwMjQ5ZGM2MjFmMDNjNDE3NzhkNTVmZTMzMWU3ZTkxMiI7TjtzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19'),('aivJNaG71BjuRGrlmW3IIgapug0aMSs2PVEMQDMx',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1753162173,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoicjliQ2JmVlJKWXhTeGZaZUVTMWo0RzBwOXJ2dnQ1SjJFVldjanVNMyI7czo4OiJ1c2VybmFtZSI7czo2OiJ6d29vZHMiO3M6NToiZW1haWwiO3M6MjE6Inp3b29kc0BtYWlsaW5hdG9yLmNvbSI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO047czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ=='),('aTZi6XBVW0YCkQtCQbTs6afCcq5jTz7DUK3khccl',10,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1753161837,'YTo4OntzOjY6Il90b2tlbiI7czo0MDoibDFKT0NOYUxjUVRhZmladEdmNm5NT3ZsbThQY0pXY2NSRGl4Vnp5MiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7czo4OiJ1c2VybmFtZSI7czo2OiJkZGlvdWYiO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtpOjEwO3M6NjoidXNlcklkIjtpOjEwO3M6NToiZW1haWwiO3M6MjE6ImRkaW91ZkBtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRDei5oMTM5R2Q5ZlRUaU9tTU1VTEZ1UzJhOFpYN0Nna0xwSVJOUnguV2thb0Y0MzJ4VnNVLiI7fQ=='),('B09oAUTTNOgn3Vyx2h1SonOyq4DcQjUn9TpxT0TY',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1753162176,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoidVB3b2dadHBoVGg2SU9kMlRiSUNHc2JRMm1vOWIxNmVrbUlmR1UzZyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRhWlIzb1ZlSnFlRFhkVE5saEZJVUVlNzU1Nk5zdnk5ZFY5MkI1MjdubEdUM0pucXh6clBvaSI7fQ=='),('BGUPYKh1kvcQfKFYz6rrdqcTHFhXSxHMCQ71Ws8f',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1753161898,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiTWVrajdIWDRrMkJ4Z1pob09tdmdjMDgxcGZXQ3U0VERKdDhzb21MOCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRqTWx1YmthQ3Ywd2FtcUtqdzkvWnVPQUlmYTJJa1FtemNuNVQ1Tnl4U1kxT0tzLnBZRkt6SyI7fQ=='),('BtEnxQGMAYthBmibOPQPMj4Fw8mud25oG7WMA7Az',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1753161673,'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVDBib2ZOaXV0bktITXFsekxQV2NYWHRLR2k2YTR6UkMzcWVEbXY3MiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),('bwEQfeUlS4qY7JG267bK3j6nE30fxEmu4JS8B5TE',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1753162065,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiVEg0TnNtMTBSZTBiMkhrcGFvTDY4WkJYcEpCaUV6V1ZKY2pnY3JOMSI7czo4OiJ1c2VybmFtZSI7czo3OiJwZGFuaWVsIjtzOjU6ImVtYWlsIjtzOjIyOiJwZGFuaWVsQG1haWxpbmF0b3IuY29tIjtzOjUwOiJsb2dpbl93ZWJfYzFhMjZiYzAwMjQ5ZGM2MjFmMDNjNDE3NzhkNTVmZTMzMWU3ZTkxMiI7TjtzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19'),('bzGCEAHF6lG9WY6rqKDtt3xlCdukuXJDM4pY3Ean',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1753161801,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiMmJYNTN1S3N0UFUxN2xWT1g1OThQeUVTRXdVckpPd0lpaFdUZWN0eSI7czo4OiJ1c2VybmFtZSI7czo3OiJkYmFybmVzIjtzOjU6ImVtYWlsIjtzOjIyOiJkYmFybmVzQG1haWxpbmF0b3IuY29tIjtzOjUwOiJsb2dpbl93ZWJfYzFhMjZiYzAwMjQ5ZGM2MjFmMDNjNDE3NzhkNTVmZTMzMWU3ZTkxMiI7TjtzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19'),('C5JeQWuAFv5A7s36PgMYCpnKJJwCzwK2KWRYn3zP',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1753161874,'YToyOntzOjY6Il90b2tlbiI7czo0MDoib1BQU3RWb2hrOG5VV29BVEtEaTJ0UUJBTDVib3YxUVpObUNWSlJyUyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ=='),('dhphGSa0uHLETpu4CofYQBAVvUTcgjqVoTOp9WD5',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1753161665,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiRTFNVDBMV2tUS25yOVA3YXlUNVo5MTJEUUZrZXVjN3I2ZGVqeHRoUSI7czo4OiJ1c2VybmFtZSI7czo1OiJhZG1pbiI7czo1OiJlbWFpbCI7czoyMzoicGtwYWRtaW5AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0='),('DLs04AKSAHeMaQKjzDct7oU3rHmSKBSmQqLUoXlu',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1753161548,'YToyOntzOjY6Il90b2tlbiI7czo0MDoiaWJVcjNaODlIYlpDVnJoV2RxemNPWGY2OFhlZTRtUkFOdDcwVlI3RSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ=='),('H0bDO4WdfmFNxdxnrueU9yfdBurWjppiafcn33z5',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1753161941,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoibzlDT0RvTmdheTMxem94V0Q4cDFJSjNaa0lFWjJHcml1WGgzR1ZhayI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCR4WXd4dEJ3bVZiUUd3d3d5TkZINml1SXc5aVpZd2RwRDRxeG5rcEo2ajJkd1FJeHR4NXBwVyI7fQ=='),('HRSeiZXdOKPHLQlgJmdFHFgB0zW98ZpMesGAERTi',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1753161575,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiSVRycjFMd0dpYUlCWTVpNE1PNHZoRllKbkFYYUpGZUNwcTBDWDRaNSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MTtzOjY6InVzZXJJZCI7aToxO3M6ODoidXNlcm5hbWUiO3M6NToiYWRtaW4iO3M6NToiZW1haWwiO3M6MjM6InBrcGFkbWluQG1haWxpbmF0b3IuY29tIjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJHJ0QW4vVnNVdU9nb2RtMS95ZTR5Zi5jc1FCaC5ZZTc3M3Z2QWluejFDa0Eyc3BEUFRxQ2VHIjt9'),('Hsmh1OMz6YwADDdkbLBw8eZX8eLVFkPnN8xGCmHv',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1753162023,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoidFFTNFBvdlhGeEFNcmxoU2RjU1Q0aEM3Sld2b0hqWEVldWpMN0hldCI7czo4OiJ1c2VybmFtZSI7czoxMjoibGNocmlzdG9waGVyIjtzOjU6ImVtYWlsIjtzOjI3OiJsY2hyaXN0b3BoZXJAbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0='),('ipugZLc4HoMisf6nXs7AxqJRpzvp1uRYWtXsf2qB',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1753161920,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiZEJ6UGdHeFRZYmF2YkFGa2pLS01DSjR1aXNGaG90SE1yTmZhanlvbiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRxVGFaUk90RFBkTzVuMUFTeHVwY1JPaEt5cEdRQjk1dno1NFJreDdvQlA4M3ZMOXQ4TkJaaSI7fQ=='),('jyrMwhiJPkXiJIhJ2y9IAw5ZXCd7JTZsoTXz4Jgg',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1753161938,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiSDJoQld1bFlNeWZrMG94S1llUTJCSm5GOG42MTZVWkk2Q2NROHZKUiI7czo4OiJ1c2VybmFtZSI7czo5OiJmcGFnbGllcmkiO3M6NToiZW1haWwiO3M6MjQ6ImZwYWdsaWVyaUBtYWlsaW5hdG9yLmNvbSI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO047czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ=='),('k0irOzO9chIpNTfgSLhM2ZIr2DCirYIHnik8R8qH',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1753162108,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoicmlIbTVDQ2o2TEk3UXBOZmdXSUgyNmNnaXJuMTlkcGRaalJ0alRmaCI7czo4OiJ1c2VybmFtZSI7czo2OiJycm9zc2kiO3M6NToiZW1haWwiO3M6MjE6InJyb3NzaUBtYWlsaW5hdG9yLmNvbSI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO047czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ=='),('l8BLz1uDtnpHIFgqj6mxPzAIXFd5uui1wkLVXkCA',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1753161599,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiS1J5WFlKTlJSemNsWlhhUFNlYlhPUjlCUlRKSVFhSEptTHhkd3hwViI7czo4OiJ1c2VybmFtZSI7czo1OiJhZG1pbiI7czo1OiJlbWFpbCI7czoyMzoicGtwYWRtaW5AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0='),('LdSIdEdw9gqca9VqxadKvKHJB4rMmZORD2nYgrSh',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1753161673,'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYmdrYlk0Q1pIOVZ3THNSaW9WTzBTdWpUN3ZvbGQxMDQ5aDRhVG5wbiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),('lhHYHxKgbC8KDRh6eGhl3iFQKYnsB0i1TeQiVWnO',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1753161580,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoidzVRZUJvQWRUUmRnWWtiODJUbVJXT1hHb0xVZ0duMlc5UThvQ0JRbiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MTtzOjY6InVzZXJJZCI7aToxO3M6ODoidXNlcm5hbWUiO3M6NToiYWRtaW4iO3M6NToiZW1haWwiO3M6MjM6InBrcGFkbWluQG1haWxpbmF0b3IuY29tIjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJGFlaXljeXRiM1hDWkVjdWE5NDIzTHV3RVVzRUI5YmJRWlNqRmsyN2NBczF5YUdCNjRmNk9tIjt9'),('MRIu21xxPRvXN5Zuis6m3a20jp4DNRyfZXVgRcgw',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1753162005,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiSk5JcDU3SklOUnU4MTZvWjRnNnlhdVJ5dzJ2QmpTVDJxQ09TUVNSaSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCQybk1tVjdHbjRJTlo1UzYuZTFtZHRPa3gxNWlyMkpXMUFkNHVnby8xaG1EVmFtemloZzU1dSI7fQ=='),('n9E5wEJVHHYtPp7aQDkrlR2DqksdXweu35M2TL5A',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1753161584,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiT3RkekZOS1Q2QTFmdzd1bWcyVmNYWjJycDJDQWVXU1JubWxUSjVROCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MTtzOjY6InVzZXJJZCI7aToxO3M6ODoidXNlcm5hbWUiO3M6NToiYWRtaW4iO3M6NToiZW1haWwiO3M6MjM6InBrcGFkbWluQG1haWxpbmF0b3IuY29tIjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJEU1VlNUalpZN0lET2ovWVBCQnVUTi4yOUZTbXZMenFyZkN5V1hSUzdXMVVrdVdHbkJVVHhxIjt9'),('nIIKEpWMvgaBlAZpEPEFTbuNLE48hlEb9jKqfXqz',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1753161614,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiWGZrTFV3cEJiNDJxM0F5YUc4NkZqV2wxN1prdFY3aXF5NTlKdURmVCI7czo4OiJ1c2VybmFtZSI7czo1OiJhZG1pbiI7czo1OiJlbWFpbCI7czoyMzoicGtwYWRtaW5AbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0='),('o3gIu3aZXHgV3o0zq86P8dRVoYEUms1Bj5QIxEkm',7,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1753161718,'YTo4OntzOjY6Il90b2tlbiI7czo0MDoid21CeTRmbVRYZXJ4M3BLSVN5ZFdadExIaTdhZTZzVG1wRExVS1FabyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7czo4OiJ1c2VybmFtZSI7czo3OiJjY29yaW5vIjtzOjUwOiJsb2dpbl93ZWJfYzFhMjZiYzAwMjQ5ZGM2MjFmMDNjNDE3NzhkNTVmZTMzMWU3ZTkxMiI7aTo3O3M6NjoidXNlcklkIjtpOjc7czo1OiJlbWFpbCI7czoyMjoiY2Nvcmlub0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCQuWUxuNmg0YXM1bzEzblU0Y0xZdC5PM0N4cG16dmNSUU1GMjk4dWlyUTRXcVUuOXJTRmFrYSI7fQ=='),('OU9YfQ4ghr1wuEySfLBylbH5LCkXqYNWD68ucqr6',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1753161820,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoidEtxOFBxWkgyaG1QTmJFUFhHN1FQNUtoV2JvaW9HamxCOGZndGJRbSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRQVEtEcVlPZWZTRGRIUUVYLjY1MXJlVkFzbnllRWt1UkRKSWhLd241L2Quc05NV20xUHZ4NiI7fQ=='),('qkrvggk2g7FoqGOSKYuqjliZ3Ew5kO1g03pg5DqA',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1753162132,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoicDFuVEFpb1h6S0I5alU1bmI0TnBacTFuSnp2TVRudjIxVHJ3QmNIaiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRVSEV1UXk4ZXJ4bXVsV3J2dDcwYzUuMGpvSHNDM1lzbHNHenU4L0Q0MGtaOFg0QlpFSzlCUyI7fQ=='),('qLhQVchQ5p23GD3Fe2cKCeGyGIKRvUqqF7IWLhA5',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1753161654,'YTozOntzOjY6Il90b2tlbiI7czo0MDoiM3lJd3RPN0ZPSGxsMHZHNk5qOE5NQ0lBM01lTnpqTWFORnlONlN6YSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),('QUNnPSUZ61cvzbnB2SjezASXSXelqHn9ST4vtcwd',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1753162047,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiN05wWEJyaEExVEhrT2tucVVUaFhoSUtqaUhmZk14WXVDdkZwODNMZiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCQxd2RwMlltcFVsT1gyZ2VBamVLc0NPcFJReXIzdGdNaFlpYVNwRVBST2RXVTkzUDAwdXU5NiI7fQ=='),('rQfp6WJ2jOdFmRpCYwTin5fEoy7LFEEjAaW3tFah',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1753161867,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiUWpYUjB1dHJVSTk1anVzSEhYSzdpb3hRcnM1OEJHMVd2UFlRNmptQSI7czo4OiJ1c2VybmFtZSI7czo5OiJkcGhpbGxpcHMiO3M6NToiZW1haWwiO3M6MjQ6ImRwaGlsbGlwc0BtYWlsaW5hdG9yLmNvbSI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO047czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ=='),('s4Ban8BAtfLvnxL2jTXoUws5BUF00HiMG67HAuSB',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1753162111,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiTXRjUFZHb2lIanpLRVNyZ0wwNnMxQzJVNTF2N0ZmcGtld0hPcnJ6NyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRpNWFqT2VZZy9sWXBjT0FNbWV1T3R1SFpGQ1Q5RWZVMHJINFh3LzUyMGt5S2Zua2lWQTFBSyI7fQ=='),('SLqTpGjCq4pO5HfhIgpMu7VHKK5QeXioRt6UjxlV',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1753161797,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoia3JQOHJFWFlFUjJVc3NOeXdCTzNvZklNTjg2Szd5ekZMVTNEOUhsTyI7czo4OiJ1c2VybmFtZSI7czoxMjoiY21vbnRnb21lcmllIjtzOjU6ImVtYWlsIjtzOjI3OiJjbW9udGdvbWVyaWVAbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0='),('sX2muiHiNrRPvIv0vSETSISplQw5trbJIuyEpG2l',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1753161958,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiRFF5UG9NaUhKQ2tlVkdMZ2w4TU5ZbFRNU3psWmZKOXpaNVdBMmtvbCI7czo4OiJ1c2VybmFtZSI7czoxMDoiam13YW5kZW5nYSI7czo1OiJlbWFpbCI7czoyNToiam13YW5kZW5nYUBtYWlsaW5hdG9yLmNvbSI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO047czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ=='),('T8ojFsJwVGCZGSaX9s8evUy3IWMLEu3DVjkIZLrm',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1753162090,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiTW5PcjNYeFVLaGZZcFI3MENtVTR0aGRlbFJzVlNEN0E0NUdpMDU3MSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRwTU50a1U1TklZLkdRaTRHTUFnWDNlSUpqSkl5S3h0NVF1UHM2YmtiWEJwYXBwV0tUMkcvdSI7fQ=='),('Tc2PSopo7orfWHR7dVWOmrnJOim0Pv0PZUhIMcAW',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1753161962,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiaWxuTVU4d2xCTU4yUXdNdXR5MFJBN21XMnY2VlRjMXNmekRRUEJlciI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRETVN1WExLQmRmOTB1MFVhNldEaG9PN2FxZnBOUlovSUF1WEIybnYvQ1V3d1hoSGJCQzFmeSI7fQ=='),('tOHkhPgWXViM53yPcvvIt8XbngVPu1co9y3wV2wg',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1753162129,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiV1p5azkxeWdiVmNwUVhLUHphYnNvQnlYMTJISTc4OERSejc5YXBKYiI7czo4OiJ1c2VybmFtZSI7czoxMjoidmthcmJhc2l6YWVkIjtzOjU6ImVtYWlsIjtzOjI3OiJ2a2FyYmFzaXphZWRAbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0='),('tSDjWSt4gMScBWRB2soziQ4A5v8zeSfkP5NbuE2Y',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1753162026,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiTkxEazIwNVV3Y0p1UGx0dEVCdTljNWQzVHNCZXJTWXBQekZlSWp1USI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRLSXM2cklyLm9PZnRQb2V3WXdEczFPRkU1aFJuemhQVVo0aDR5T2czWkZENERIM2t2OTFlVyI7fQ=='),('u7bJW68IKMoSOPnWZfLHcodtYJkllXSzpiD4L2fq',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1753161983,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoibExqcWgybXdjNElXNmVlWEVKdGh4cDZTdnN3NWFUdlZHN1RtWFgwViI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRNVHdTcm5yTE1IUXJiZEdiTEJrR0kuUS5GQy9aL0h5Wkwyb1ZOaVl4TTRZSE9LL05qbExuNiI7fQ=='),('VlcR21i2c07DSevhfZjoafIJD11BwbsWnJ71d4BW',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1753161548,'YToyOntzOjY6Il90b2tlbiI7czo0MDoiQ1Q4RzRFSlNkcjNucWFIQVgxaWVaYjBlUEExV2d5R1E5M1NtM3NCRSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ=='),('wpsvle05G3WbwKbLjY1amWaWBkoqghVpnX79aqM7',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1753161620,'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZlJuMmtjZU1vZmFIYkJyM2ozQUxaWERJcGM0TFZXamxDOXBhM2JKeSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),('XvuNC3qCUm7WATPFTlJ1GfxHAhAZkVUnux4pdMxx',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1753161680,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoienNNczQ5MmFoQTJqSnNzcGZ3eVdiMWhHMTZDRmVQOXJabVFyVXQ2MCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MTtzOjY6InVzZXJJZCI7aToxO3M6ODoidXNlcm5hbWUiO3M6NToiYWRtaW4iO3M6NToiZW1haWwiO3M6MjM6InBrcGFkbWluQG1haWxpbmF0b3IuY29tIjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJGdmZmd6TkMuaW5HNm8vNjU3cDZJRS5JZEp4NkJZeEdOOGhvUWlyQnFIVVVyWkFkRGJ0OHgyIjt9'),('xYiTfheg80GbwRZoo8LAMIPHjhWVQv9W0pfBupuu',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1753162087,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiSE1pQzd6dFdhbUd2Ym54ZXNNM0dmSGkwYm1NbTVRY0RoUWlUOWtrcSI7czo4OiJ1c2VybmFtZSI7czo4OiJyYmFpeWV3dSI7czo1OiJlbWFpbCI7czoyMzoicmJhaXlld3VAbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0='),('yi1EExWp3usdAECTMyPOannTlTbqTgCYADi3HkKP',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1753161637,'YTozOntzOjY6Il90b2tlbiI7czo0MDoibjdPRTd1emF0UG5PYnVFZ09yY2tkWTNhRHpERG9FcjhISW53YTlHTyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7fQ=='),('yNMA9xC36iPTlSBPDvSXSL2FY4AljSLb77o8NU22',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1753162044,'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiaFdxcmVJc0duT3lHU3oxeUxlWUk1cnFBNkJ5NXM3UThTTExTV3FlRyI7czo4OiJ1c2VybmFtZSI7czo4OiJsa3VtaWVnYSI7czo1OiJlbWFpbCI7czoyMzoibGt1bWllZ2FAbWFpbGluYXRvci5jb20iO3M6NTA6ImxvZ2luX3dlYl9jMWEyNmJjMDAyNDlkYzYyMWYwM2M0MTc3OGQ1NWZlMzMxZTdlOTEyIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0='),('yOVIRI3HE5JXH6Ffi6xmiHzkblbhVNc4PRVQPx06',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1753162069,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoibWkyTm82MlQzdE4zRlJ0Y2xuNjd0RmdQUU1JSHRucUpnbEZzd3NFTCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRORk5xQVlLSExNREFBUmllTXp4Nkd1akYzVFc2VVd6NWNZbFdGOTRMc0loc00wQmtDYUVKRyI7fQ=='),('YPYDUEHkAnrPayG3kT6Ik6lRjrbUEQKYUC6EdWZX',8,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1753161775,'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiS01uZWVwSUltR1FXMmcwN29qbEtFWXNJSXBVUm8yMDFFbFYwZjlwRyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxMzoiY3VycmVudExvY2FsZSI7czoyOiJlbiI7czo4OiJ1c2VybmFtZSI7czo4OiJja3dhbnRlcyI7czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6ODtzOjY6InVzZXJJZCI7aTo4O3M6NToiZW1haWwiO3M6MjM6ImNrd2FudGVzQG1haWxpbmF0b3IuY29tIjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJG5uUUFQQ2pSLkkyQmpFM1JRRkRnc09qeXd6V0svUklwSHF0MFRMOTV2MjN4QUlmRUgzWWpXIjt9'),('zVOzd8VZ3J1pil9D6uKLDGxnselhC1bFgJIZ3RKb',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1753161700,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiMlVIRTBGSUpwRjhqaGJJblVwNGxPbktDWVJaOEVnd1JGQ2dFeml0RCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MTtzOjY6InVzZXJJZCI7aToxO3M6ODoidXNlcm5hbWUiO3M6NToiYWRtaW4iO3M6NToiZW1haWwiO3M6MjM6InBrcGFkbWluQG1haWxpbmF0b3IuY29tIjtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJDNtaGVXbFdKRUE0dGJJQTNKaWY1WmVDai42VzgxbFdkQ3VNNy93V0VYLmVwaUQubHF2Y2dpIjt9'),('ZYTl3R3j8VkIRKgKfXRqm1eQjHP69UNKlqP8IXVo',3,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/138.0.0.0 Safari/537.36',1753162153,'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiTlRaNUs5eEVJSjNPWVhucm1GeGI1bmJhRTVGVFBwQXBUVEJ2azQxaiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViX2MxYTI2YmMwMDI0OWRjNjIxZjAzYzQxNzc4ZDU1ZmUzMzFlN2U5MTIiO2k6MztzOjY6InVzZXJJZCI7aTozO3M6ODoidXNlcm5hbWUiO3M6NzoiZGJhcm5lcyI7czo1OiJlbWFpbCI7czoyMjoiZGJhcm5lc0BtYWlsaW5hdG9yLmNvbSI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRya2RJVVg4dWZaQTB4Zi5aZ1daOUR1TUxNV0F0cElyL1U4TEFUYzhXQ0dIVnZ6ODlwMDNSLiI7fQ==');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site`
--

DROP TABLE IF EXISTS `site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `site` (
  `site_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `redirect_context_id` bigint DEFAULT NULL COMMENT 'If not null, redirect to the specified journal/conference/... site.',
  `primary_locale` varchar(28) NOT NULL COMMENT 'Primary locale for the site.',
  `min_password_length` smallint NOT NULL DEFAULT '6',
  `installed_locales` varchar(1024) NOT NULL DEFAULT 'en' COMMENT 'Locales for which support has been installed.',
  `supported_locales` varchar(1024) DEFAULT NULL COMMENT 'Locales supported by the site (for hosted journals/conferences/...).',
  `original_style_file_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`site_id`),
  KEY `site_context_id` (`redirect_context_id`),
  CONSTRAINT `site_redirect_context_id_foreign` FOREIGN KEY (`redirect_context_id`) REFERENCES `servers` (`server_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='A singleton table describing basic information about the site.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site`
--

LOCK TABLES `site` WRITE;
/*!40000 ALTER TABLE `site` DISABLE KEYS */;
INSERT INTO `site` VALUES (1,NULL,'en',6,'[\"en\",\"fr_CA\"]','[\"en\",\"fr_CA\"]',NULL);
/*!40000 ALTER TABLE `site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_settings`
--

DROP TABLE IF EXISTS `site_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `site_settings` (
  `site_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `setting_name` varchar(255) NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_value` mediumtext,
  PRIMARY KEY (`site_setting_id`),
  UNIQUE KEY `site_settings_unique` (`setting_name`,`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3 COMMENT='More data about the site, including localized properties such as its name.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_settings`
--

LOCK TABLES `site_settings` WRITE;
/*!40000 ALTER TABLE `site_settings` DISABLE KEYS */;
INSERT INTO `site_settings` VALUES (1,'contactEmail','en','pkpadmin@mailinator.com'),(2,'contactName','en','Open Preprint Systems'),(3,'contactName','fr_CA','Open Preprint Systems'),(4,'compressStatsLogs','','0'),(5,'enableGeoUsageStats','','disabled'),(6,'enableInstitutionUsageStats','','0'),(7,'keepDailyUsageStats','','0'),(8,'isSiteSushiPlatform','','0'),(9,'isSushiApiPublic','','1'),(10,'disableSharedReviewerStatistics','','0'),(11,'orcidClientId','',''),(12,'orcidClientSecret','',''),(13,'orcidEnabled','','0'),(14,'themePluginPath','','default'),(15,'uniqueSiteId','','A68D4148-4809-415F-84A5-506E8F82857F');
/*!40000 ALTER TABLE `site_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stage_assignments`
--

DROP TABLE IF EXISTS `stage_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stage_assignments` (
  `stage_assignment_id` bigint NOT NULL AUTO_INCREMENT,
  `submission_id` bigint NOT NULL,
  `user_group_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `date_assigned` datetime NOT NULL,
  `recommend_only` smallint NOT NULL DEFAULT '0',
  `can_change_metadata` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`stage_assignment_id`),
  UNIQUE KEY `stage_assignment` (`submission_id`,`user_group_id`,`user_id`),
  KEY `stage_assignments_user_group_id` (`user_group_id`),
  KEY `stage_assignments_user_id` (`user_id`),
  KEY `stage_assignments_submission_id` (`submission_id`),
  CONSTRAINT `stage_assignments_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE,
  CONSTRAINT `stage_assignments_user_group_id` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`user_group_id`) ON DELETE CASCADE,
  CONSTRAINT `stage_assignments_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb3 COMMENT='Who can access a submission while it is in the editorial workflow. Includes all editorial and author assignments. For reviewers, see review_assignments.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stage_assignments`
--

LOCK TABLES `stage_assignments` WRITE;
/*!40000 ALTER TABLE `stage_assignments` DISABLE KEYS */;
INSERT INTO `stage_assignments` VALUES (1,1,4,7,'2025-07-22 05:21:45',0,1),(2,1,3,4,'2025-07-22 05:21:58',0,1),(3,1,3,5,'2025-07-22 05:21:58',0,1),(4,2,4,8,'2025-07-22 05:22:05',0,0),(5,2,3,4,'2025-07-22 05:22:52',0,1),(6,2,3,5,'2025-07-22 05:22:52',0,1),(7,3,4,9,'2025-07-22 05:23:04',0,0),(8,3,3,4,'2025-07-22 05:23:17',0,1),(9,3,3,5,'2025-07-22 05:23:17',0,1),(10,4,4,10,'2025-07-22 05:23:45',0,1),(11,4,3,4,'2025-07-22 05:23:57',0,1),(12,4,3,5,'2025-07-22 05:23:57',0,1),(13,5,4,11,'2025-07-22 05:24:14',0,0),(14,5,3,4,'2025-07-22 05:24:26',0,1),(15,5,3,5,'2025-07-22 05:24:26',0,1),(16,6,4,12,'2025-07-22 05:24:42',0,0),(17,6,3,4,'2025-07-22 05:24:54',0,1),(18,6,3,5,'2025-07-22 05:24:54',0,1),(19,7,4,13,'2025-07-22 05:25:03',0,0),(20,7,3,4,'2025-07-22 05:25:16',0,1),(21,7,3,5,'2025-07-22 05:25:16',0,1),(22,8,4,14,'2025-07-22 05:25:25',0,0),(23,8,3,4,'2025-07-22 05:25:37',0,1),(24,8,3,5,'2025-07-22 05:25:37',0,1),(25,9,4,15,'2025-07-22 05:25:46',0,0),(26,9,3,4,'2025-07-22 05:25:58',0,1),(27,9,3,5,'2025-07-22 05:25:58',0,1),(28,10,4,16,'2025-07-22 05:26:07',0,0),(29,10,3,4,'2025-07-22 05:26:19',0,1),(30,10,3,5,'2025-07-22 05:26:19',0,1),(31,11,4,17,'2025-07-22 05:26:28',0,0),(32,11,3,4,'2025-07-22 05:26:41',0,1),(33,11,3,5,'2025-07-22 05:26:41',0,1),(34,12,4,18,'2025-07-22 05:26:50',0,0),(35,12,3,4,'2025-07-22 05:27:03',0,1),(36,12,3,5,'2025-07-22 05:27:03',0,1),(37,13,4,19,'2025-07-22 05:27:12',0,0),(38,13,3,4,'2025-07-22 05:27:24',0,1),(39,13,3,5,'2025-07-22 05:27:24',0,1),(40,14,4,20,'2025-07-22 05:27:33',0,0),(41,14,3,4,'2025-07-22 05:27:45',0,1),(42,14,3,5,'2025-07-22 05:27:45',0,1),(43,15,4,21,'2025-07-22 05:27:54',0,0),(44,15,3,4,'2025-07-22 05:28:06',0,1),(45,15,3,5,'2025-07-22 05:28:06',0,1),(46,16,4,22,'2025-07-22 05:28:15',0,0),(47,16,3,4,'2025-07-22 05:28:27',0,1),(48,16,3,5,'2025-07-22 05:28:28',0,1),(49,17,4,23,'2025-07-22 05:28:36',0,0),(50,17,3,4,'2025-07-22 05:28:49',0,1),(51,17,3,5,'2025-07-22 05:28:49',0,1),(52,18,4,24,'2025-07-22 05:28:57',0,0),(53,18,3,4,'2025-07-22 05:29:10',0,1),(54,18,3,5,'2025-07-22 05:29:10',0,1),(55,19,4,25,'2025-07-22 05:29:20',0,0),(56,19,3,4,'2025-07-22 05:29:32',0,1),(57,19,3,5,'2025-07-22 05:29:32',0,1);
/*!40000 ALTER TABLE `stage_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subeditor_submission_group`
--

DROP TABLE IF EXISTS `subeditor_submission_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subeditor_submission_group` (
  `subeditor_submission_group_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `context_id` bigint NOT NULL,
  `assoc_id` bigint NOT NULL,
  `assoc_type` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `user_group_id` bigint NOT NULL,
  PRIMARY KEY (`subeditor_submission_group_id`),
  UNIQUE KEY `section_editors_unique` (`context_id`,`assoc_id`,`assoc_type`,`user_id`,`user_group_id`),
  KEY `subeditor_submission_group_context_id` (`context_id`),
  KEY `subeditor_submission_group_user_id` (`user_id`),
  KEY `subeditor_submission_group_user_group_id` (`user_group_id`),
  KEY `subeditor_submission_group_assoc_id` (`assoc_id`,`assoc_type`),
  CONSTRAINT `section_editors_context_id` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE,
  CONSTRAINT `subeditor_submission_group_user_group_id_foreign` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`user_group_id`) ON DELETE CASCADE,
  CONSTRAINT `subeditor_submission_group_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COMMENT='Subeditor assignments to e.g. sections and categories';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subeditor_submission_group`
--

LOCK TABLES `subeditor_submission_group` WRITE;
/*!40000 ALTER TABLE `subeditor_submission_group` DISABLE KEYS */;
INSERT INTO `subeditor_submission_group` VALUES (1,1,1,530,4,3),(2,1,1,530,5,3);
/*!40000 ALTER TABLE `subeditor_submission_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_comments`
--

DROP TABLE IF EXISTS `submission_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submission_comments` (
  `comment_id` bigint NOT NULL AUTO_INCREMENT,
  `comment_type` bigint DEFAULT NULL,
  `role_id` bigint NOT NULL,
  `submission_id` bigint NOT NULL,
  `assoc_id` bigint NOT NULL,
  `author_id` bigint NOT NULL,
  `comment_title` text NOT NULL,
  `comments` text,
  `date_posted` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `viewable` smallint DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `submission_comments_submission_id` (`submission_id`),
  KEY `submission_comments_author_id` (`author_id`),
  CONSTRAINT `submission_comments_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `submission_comments_submission_id` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Comments on a submission, e.g. peer review comments';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_comments`
--

LOCK TABLES `submission_comments` WRITE;
/*!40000 ALTER TABLE `submission_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `submission_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_file_revisions`
--

DROP TABLE IF EXISTS `submission_file_revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submission_file_revisions` (
  `revision_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `submission_file_id` bigint unsigned NOT NULL,
  `file_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`revision_id`),
  KEY `submission_file_revisions_submission_file_id` (`submission_file_id`),
  KEY `submission_file_revisions_file_id` (`file_id`),
  CONSTRAINT `submission_file_revisions_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `files` (`file_id`) ON DELETE CASCADE,
  CONSTRAINT `submission_file_revisions_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3 COMMENT='Revisions map submission_file entries to files on the data store.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_file_revisions`
--

LOCK TABLES `submission_file_revisions` WRITE;
/*!40000 ALTER TABLE `submission_file_revisions` DISABLE KEYS */;
INSERT INTO `submission_file_revisions` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,6,6),(7,7,7),(8,8,8),(9,9,9),(10,10,10),(11,11,11),(12,12,12),(13,13,13),(14,14,14),(15,15,15),(16,16,16),(17,17,17),(18,18,18),(19,19,19);
/*!40000 ALTER TABLE `submission_file_revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_file_settings`
--

DROP TABLE IF EXISTS `submission_file_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submission_file_settings` (
  `submission_file_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `submission_file_id` bigint unsigned NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  PRIMARY KEY (`submission_file_setting_id`),
  UNIQUE KEY `submission_file_settings_unique` (`submission_file_id`,`locale`,`setting_name`),
  KEY `submission_file_settings_submission_file_id` (`submission_file_id`),
  CONSTRAINT `submission_file_settings_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb3 COMMENT='Localized data about submission files like published metadata.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_file_settings`
--

LOCK TABLES `submission_file_settings` WRITE;
/*!40000 ALTER TABLE `submission_file_settings` DISABLE KEYS */;
INSERT INTO `submission_file_settings` VALUES (1,1,'en','name','The influence of lactation on the quantity and quality of cashmere production.pdf'),(2,1,'fr_CA','name',''),(3,2,'en','name','The Facets Of Job Satisfaction: A Nine-Nation Comparative Study Of Construct Equivalence.pdf'),(4,2,'fr_CA','name',''),(5,3,'en','name','Computer Skill Requirements for New and Existing Teachers: Implications for Policy and Practice.pdf'),(6,3,'fr_CA','name',''),(7,4,'en','name','Genetic transformation of forest trees.pdf'),(8,4,'fr_CA','name',''),(9,5,'en','name','Investigating the Shared Background Required for Argument: A Critique of Fogelin\'s Thesis on Deep Disagreement.pdf'),(10,5,'fr_CA','name',''),(11,6,'en','name','Developing efficacy beliefs in the classroom.pdf'),(12,6,'fr_CA','name',''),(13,7,'en','name','Developing efficacy beliefs in the classroom.pdf'),(14,7,'fr_CA','name',''),(15,8,'en','name','Hansen & Pinto: Reason Reclaimed.pdf'),(16,8,'fr_CA','name',''),(17,9,'en','name','Signalling Theory Dividends: A Review Of The Literature And Empirical Evidence.pdf'),(18,9,'fr_CA','name',''),(19,10,'en','name','Condensing Water Availability Models to Focus on Specific Water Management Systems.pdf'),(20,10,'fr_CA','name',''),(21,11,'en','name','Learning Sustainable Design through Service.pdf'),(22,11,'fr_CA','name',''),(23,12,'en','name','Sodium butyrate improves growth performance of weaned piglets during the first period after weaning.pdf'),(24,12,'fr_CA','name',''),(25,13,'en','name','Hydrologic Connectivity in the Edwards Aquifer between San Marcos Springs and Barton Springs during 2009 Drought Conditions.pdf'),(26,13,'fr_CA','name',''),(27,14,'en','name','Towards Designing an Intercultural Curriculum: A Case Study from the Atlantic Coast of Nicaragua.pdf'),(28,14,'fr_CA','name',''),(29,15,'en','name','Yam diseases and its management in Nigeria.pdf'),(30,15,'fr_CA','name',''),(31,16,'en','name','Influence of long-term nutrition with different dietary fats on fatty acid composition of heavy pigs backfat.pdf'),(32,16,'fr_CA','name',''),(33,17,'en','name','Antimicrobial, heavy metal resistance and plasmid profile of coliforms isolated from nosocomial infections in a hospital in Isfahan, Iran.pdf'),(34,17,'fr_CA','name',''),(35,18,'en','name','Self-Organization in Multi-Level Institutions in Networked Environments.pdf'),(36,18,'fr_CA','name',''),(37,19,'en','name','Finocchiaro: Arguments About Arguments.pdf'),(38,19,'fr_CA','name','');
/*!40000 ALTER TABLE `submission_file_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_files`
--

DROP TABLE IF EXISTS `submission_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submission_files` (
  `submission_file_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `submission_id` bigint NOT NULL,
  `file_id` bigint unsigned NOT NULL,
  `source_submission_file_id` bigint unsigned DEFAULT NULL,
  `genre_id` bigint DEFAULT NULL,
  `file_stage` bigint NOT NULL,
  `direct_sales_price` varchar(255) DEFAULT NULL,
  `sales_type` varchar(255) DEFAULT NULL,
  `viewable` smallint DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `uploader_user_id` bigint DEFAULT NULL,
  `assoc_type` bigint DEFAULT NULL,
  `assoc_id` bigint DEFAULT NULL,
  PRIMARY KEY (`submission_file_id`),
  KEY `submission_files_submission_id` (`submission_id`),
  KEY `submission_files_file_id` (`file_id`),
  KEY `submission_files_genre_id` (`genre_id`),
  KEY `submission_files_uploader_user_id` (`uploader_user_id`),
  KEY `submission_files_stage_assoc` (`file_stage`,`assoc_type`,`assoc_id`),
  KEY `submission_files_source_submission_file_id` (`source_submission_file_id`),
  CONSTRAINT `submission_files_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `files` (`file_id`) ON DELETE CASCADE,
  CONSTRAINT `submission_files_genre_id_foreign` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`genre_id`) ON DELETE SET NULL,
  CONSTRAINT `submission_files_source_submission_file_id_foreign` FOREIGN KEY (`source_submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE,
  CONSTRAINT `submission_files_submission_id` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE,
  CONSTRAINT `submission_files_uploader_user_id_foreign` FOREIGN KEY (`uploader_user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3 COMMENT='All files associated with a submission, such as those uploaded during submission, as revisions, or by copyeditors or layout editors for production.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_files`
--

LOCK TABLES `submission_files` WRITE;
/*!40000 ALTER TABLE `submission_files` DISABLE KEYS */;
INSERT INTO `submission_files` VALUES (1,1,1,NULL,1,10,NULL,NULL,NULL,'2025-07-22 05:21:55','2025-07-22 05:21:57',7,521,1),(2,2,2,NULL,1,10,NULL,NULL,NULL,'2025-07-22 05:22:28','2025-07-22 05:22:30',8,521,2),(3,3,3,NULL,1,10,NULL,NULL,NULL,'2025-07-22 05:23:13','2025-07-22 05:23:15',9,521,3),(4,4,4,NULL,1,10,NULL,NULL,NULL,'2025-07-22 05:23:54','2025-07-22 05:23:56',10,521,5),(5,5,5,NULL,1,10,NULL,NULL,NULL,'2025-07-22 05:24:24','2025-07-22 05:24:26',11,521,6),(6,6,6,NULL,1,10,NULL,NULL,NULL,'2025-07-22 05:24:51','2025-07-22 05:24:54',12,521,7),(7,7,7,NULL,1,10,NULL,NULL,NULL,'2025-07-22 05:25:12','2025-07-22 05:25:15',13,521,8),(8,8,8,NULL,1,10,NULL,NULL,NULL,'2025-07-22 05:25:34','2025-07-22 05:25:36',14,521,9),(9,9,9,NULL,1,10,NULL,NULL,NULL,'2025-07-22 05:25:55','2025-07-22 05:25:57',15,521,10),(10,10,10,NULL,1,10,NULL,NULL,NULL,'2025-07-22 05:26:16','2025-07-22 05:26:19',16,521,11),(11,11,11,NULL,1,10,NULL,NULL,NULL,'2025-07-22 05:26:38','2025-07-22 05:26:40',17,521,12),(12,12,12,NULL,1,10,NULL,NULL,NULL,'2025-07-22 05:27:00','2025-07-22 05:27:02',18,521,13),(13,13,13,NULL,1,10,NULL,NULL,NULL,'2025-07-22 05:27:21','2025-07-22 05:27:23',19,521,14),(14,14,14,NULL,1,10,NULL,NULL,NULL,'2025-07-22 05:27:42','2025-07-22 05:27:44',20,521,15),(15,15,15,NULL,1,10,NULL,NULL,NULL,'2025-07-22 05:28:03','2025-07-22 05:28:06',21,521,16),(16,16,16,NULL,1,10,NULL,NULL,NULL,'2025-07-22 05:28:25','2025-07-22 05:28:27',22,521,17),(17,17,17,NULL,1,10,NULL,NULL,NULL,'2025-07-22 05:28:46','2025-07-22 05:28:48',23,521,18),(18,18,18,NULL,1,10,NULL,NULL,NULL,'2025-07-22 05:29:07','2025-07-22 05:29:09',24,521,19),(19,19,19,NULL,1,10,NULL,NULL,NULL,'2025-07-22 05:29:29','2025-07-22 05:29:32',25,521,20);
/*!40000 ALTER TABLE `submission_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_search_keyword_list`
--

DROP TABLE IF EXISTS `submission_search_keyword_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submission_search_keyword_list` (
  `keyword_id` bigint NOT NULL AUTO_INCREMENT,
  `keyword_text` varchar(60) NOT NULL,
  PRIMARY KEY (`keyword_id`),
  UNIQUE KEY `submission_search_keyword_text` (`keyword_text`)
) ENGINE=InnoDB AUTO_INCREMENT=979 DEFAULT CHARSET=utf8mb3 COMMENT='A list of all keywords used in the search index';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_search_keyword_list`
--

LOCK TABLES `submission_search_keyword_list` WRITE;
/*!40000 ALTER TABLE `submission_search_keyword_list` DISABLE KEYS */;
INSERT INTO `submission_search_keyword_list` VALUES (47,'133rd'),(364,'1980s'),(714,'21st'),(835,'abattoir'),(870,'abnormal'),(502,'academic'),(589,'accepted'),(471,'accompanying'),(763,'achieving'),(79,'acid'),(604,'acids'),(335,'action'),(962,'actor'),(955,'actors'),(458,'added'),(500,'address'),(58,'adg'),(544,'adipose'),(76,'adiposity'),(219,'administered'),(435,'administration'),(793,'adopted'),(794,'advocated'),(860,'affected'),(119,'affects'),(832,'african'),(961,'agree'),(891,'aid'),(539,'aim'),(186,'alberta'),(33,'allocated'),(704,'analyses'),(130,'analysis'),(568,'analyzed'),(566,'animals'),(775,'anthracnose'),(931,'antibiotics'),(902,'antimicrobial'),(640,'antonio'),(667,'appears'),(241,'applications'),(434,'applied'),(616,'aquifer'),(108,'archival'),(95,'areas'),(256,'argument'),(978,'arguments'),(811,'ash'),(540,'assess'),(608,'assessed'),(662,'assessments'),(710,'atlantic'),(110,'attitude'),(892,'authorities'),(485,'authority'),(426,'availability'),(27,'average'),(548,'averaging'),(562,'backfat'),(255,'background'),(766,'baiyewu'),(16,'barley'),(720,'barriers'),(30,'barrows'),(620,'barton'),(486,'based'),(479,'basin'),(445,'basins'),(17,'basis'),(661,'bearings'),(834,'beef'),(11,'beet'),(191,'began'),(46,'beginning'),(300,'belief'),(267,'beliefs'),(743,'belonging'),(125,'benchmark'),(139,'benefit'),(652,'blanco'),(145,'brazil'),(484,'brazos'),(857,'breeds'),(676,'buda'),(847,'bulls'),(533,'butyrate'),(581,'c18'),(584,'c20'),(193,'called'),(830,'cameroon'),(187,'canada'),(455,'capabilities'),(859,'carcass'),(842,'carcasses'),(607,'carefully'),(1,'carlo'),(734,'carried'),(709,'case'),(938,'cases'),(7,'cashmere'),(862,'category'),(98,'catherine'),(828,'cattle'),(281,'cedural'),(627,'central'),(715,'century'),(665,'cfs'),(525,'challenges'),(686,'change'),(512,'chapter'),(841,'characteristics'),(298,'children'),(144,'china'),(817,'chips'),(531,'christopher'),(86,'chroma'),(582,'cis'),(303,'citizens'),(338,'citizenship'),(273,'claim'),(263,'claims'),(172,'classroom'),(937,'clinical'),(569,'close'),(711,'coast'),(922,'coli'),(906,'coliforms'),(366,'colleagues'),(564,'collected'),(642,'collection'),(964,'collective'),(960,'collectively'),(150,'collectivistic'),(84,'colour'),(771,'combating'),(268,'commitments'),(277,'common'),(341,'commons'),(134,'communication'),(745,'communities'),(727,'community'),(104,'comparative'),(954,'compare'),(128,'compared'),(140,'comparisons'),(282,'competencies'),(123,'compiled'),(474,'complete'),(887,'completely'),(453,'complex'),(80,'composition'),(162,'computer'),(935,'concentration'),(638,'concept'),(91,'concluded'),(402,'conclusive'),(884,'condemned'),(466,'condensed'),(424,'condensing'),(622,'conditions'),(313,'conducted'),(301,'confident'),(403,'conflicting'),(944,'conjugative'),(695,'connection'),(614,'connectivity'),(969,'consensus'),(75,'consequence'),(781,'considered'),(146,'consistent'),(276,'consists'),(591,'consortium'),(106,'construct'),(480,'contained'),(365,'contemporary'),(573,'content'),(155,'context'),(701,'continual'),(304,'continue'),(418,'continuous'),(730,'contributing'),(972,'contributors'),(37,'control'),(522,'coordinated'),(196,'core'),(2,'corino'),(413,'corporate'),(741,'council'),(122,'countries'),(756,'country'),(197,'courses'),(357,'coward'),(868,'cows'),(324,'cps'),(160,'craig'),(124,'create'),(321,'creative'),(651,'creek'),(257,'critique'),(796,'crop'),(818,'cubes'),(803,'cultivars'),(154,'cultural'),(118,'culture'),(746,'cultures'),(592,'cured'),(190,'curriculum'),(66,'cuts'),(22,'dairy'),(251,'dana'),(706,'daniel'),(109,'data'),(467,'dataset'),(450,'datasets'),(48,'day'),(346,'decades'),(956,'decide'),(332,'decision'),(417,'decisions'),(260,'deep'),(737,'defining'),(77,'degree'),(738,'delivering'),(699,'demands'),(181,'demonstrate'),(732,'describes'),(491,'design'),(707,'designing'),(801,'destruction'),(785,'devastating'),(483,'develop'),(456,'developed'),(295,'developing'),(208,'development'),(377,'developments'),(231,'diaga'),(40,'diet'),(600,'dietary'),(25,'diets'),(597,'differed'),(932,'difference'),(54,'differences'),(288,'difficult'),(967,'difficulty'),(24,'diluted'),(232,'diouf'),(527,'directions'),(261,'disagreement'),(349,'disciplines'),(685,'discontinuity'),(240,'discussed'),(739,'discussions'),(780,'disease'),(768,'diseases'),(655,'dissipated'),(347,'distinguished'),(881,'distress'),(416,'distribution'),(291,'diverge'),(718,'diversity'),(639,'divide'),(407,'dividend'),(391,'dividends'),(293,'domatilia'),(634,'downstream'),(649,'drainage'),(684,'dramatic'),(893,'draw'),(621,'drought'),(660,'droughts'),(42,'dry'),(888,'due'),(688,'dynamic'),(88,'economical'),(405,'economists'),(583,'ecosenoic'),(872,'ectoparasites'),(788,'edible'),(175,'education'),(615,'edwards'),(157,'effect'),(136,'effectiveness'),(9,'effects'),(296,'efficacy'),(135,'efficiency'),(758,'egalitarianism'),(339,'elinor'),(717,'embracing'),(504,'emerging'),(742,'emphasises'),(393,'empirical'),(227,'employed'),(112,'employees'),(945,'encoding'),(871,'encountered'),(631,'endangered'),(443,'endeavors'),(242,'engineering'),(508,'engineers'),(320,'enhance'),(461,'enhanced'),(336,'enhancing'),(877,'enlarged'),(915,'enterobacteriacea'),(493,'environmental'),(953,'environments'),(297,'equip'),(107,'equivalence'),(921,'escherichia'),(637,'established'),(751,'ethnic'),(752,'ethno'),(422,'evaluation'),(394,'evidence'),(116,'examine'),(223,'examined'),(726,'examines'),(156,'exerts'),(142,'exhibited'),(526,'exist'),(165,'existing'),(646,'exists'),(441,'expanding'),(342,'expe'),(199,'expected'),(34,'exper'),(510,'experiences'),(50,'experimental'),(248,'expression'),(671,'extended'),(673,'extensive'),(381,'fabio'),(100,'facets'),(129,'factor'),(132,'factors'),(917,'faeces'),(499,'failed'),(798,'fallowing'),(68,'fat'),(873,'fatigue'),(558,'fats'),(78,'fatty'),(59,'fcr'),(457,'features'),(21,'fed'),(51,'feed'),(773,'field'),(918,'fifteen'),(546,'fifty'),(815,'finally'),(404,'financial'),(415,'financing'),(275,'find'),(148,'findings'),(977,'finocchiaro'),(400,'firm'),(659,'flow'),(666,'flowing'),(478,'flows'),(886,'flukes'),(428,'focus'),(258,'fogelin'),(609,'food'),(235,'forest'),(812,'found'),(266,'framework'),(378,'frank'),(270,'fruitfully'),(854,'fulani'),(419,'function'),(813,'fungal'),(398,'future'),(722,'gender'),(826,'general'),(247,'genes'),(233,'genetic'),(716,'genuinely'),(31,'gilts'),(809,'gins'),(214,'goal'),(974,'goverance'),(246,'governing'),(184,'government'),(182,'grade'),(679,'gradient'),(687,'gradients'),(306,'graduation'),(645,'groundwater'),(52,'group'),(36,'groups'),(460,'growing'),(56,'growth'),(853,'gudali'),(408,'guidance'),(849,'guinea'),(69,'ham'),(279,'hand'),(383,'hansen'),(603,'healthy'),(19,'heavy'),(850,'high'),(63,'higher'),(571,'highest'),(759,'highlights'),(226,'hired'),(210,'hiring'),(32,'homogeneously'),(910,'hospital'),(916,'human'),(692,'hydraulic'),(644,'hydrogeologic'),(613,'hydrologic'),(657,'hydrologically'),(26,'hypor'),(514,'identification'),(920,'identified'),(35,'imental'),(633,'immediately'),(470,'impacts'),(203,'implement'),(189,'implementation'),(959,'implemented'),(167,'implications'),(760,'importance'),(896,'improve'),(534,'improves'),(243,'improving'),(749,'include'),(482,'included'),(795,'includes'),(698,'increased'),(601,'increases'),(594,'index'),(744,'individual'),(127,'individually'),(149,'individuals'),(802,'infected'),(814,'infection'),(909,'infections'),(3,'influence'),(668,'influenced'),(691,'influences'),(194,'information'),(302,'informed'),(195,'infused'),(60,'ing'),(694,'inherent'),(934,'inhibitory'),(28,'initial'),(178,'initiatives'),(464,'input'),(951,'institutions'),(319,'instruction'),(501,'integrates'),(228,'integrating'),(170,'integration'),(376,'intellectual'),(736,'intention'),(708,'intercultural'),(731,'interculturality'),(94,'interest'),(264,'interlocutors'),(521,'internships'),(421,'intuitive'),(253,'investigating'),(414,'investment'),(411,'investors'),(331,'involve'),(750,'involvement'),(513,'involves'),(587,'iodine'),(912,'iran'),(230,'irvine'),(911,'isfahan'),(552,'isoenergetic'),(907,'isolated'),(919,'isolates'),(174,'issue'),(838,'january'),(101,'job'),(387,'john'),(205,'jurisdictions'),(901,'karbasizaed'),(488,'karim'),(159,'kekkonen'),(924,'kelebsiella'),(307,'key'),(489,'khafaji'),(299,'knowledge'),(612,'kumiega'),(99,'kwantes'),(675,'kyle'),(4,'lactation'),(380,'laerhoven'),(874,'lameness'),(721,'language'),(452,'large'),(498,'largely'),(837,'largest'),(764,'lasting'),(595,'layers'),(334,'leads'),(65,'lean'),(310,'learn'),(305,'learners'),(201,'learning'),(519,'led'),(530,'leo'),(876,'lesions'),(183,'level'),(586,'levels'),(506,'leveraged'),(524,'limitations'),(753,'linguistic'),(585,'linoleic'),(580,'linolenic'),(611,'lise'),(392,'literature'),(820,'live'),(885,'liver'),(807,'locally'),(350,'long'),(656,'longer'),(844,'longissimus'),(358,'los'),(70,'losses'),(678,'low'),(67,'lower'),(577,'lowest'),(890,'lungs'),(878,'lymph'),(360,'mackenzie'),(808,'made'),(555,'maize'),(173,'major'),(333,'making'),(353,'managed'),(409,'management'),(188,'mandated'),(839,'march'),(618,'marcos'),(528,'margaret'),(229,'mark'),(73,'marked'),(863,'markedly'),(787,'marketable'),(550,'matched'),(800,'material'),(43,'matter'),(856,'mbororo'),(326,'means'),(865,'meat'),(245,'mechanisms'),(213,'meet'),(772,'menace'),(713,'met'),(903,'metal'),(939,'metals'),(465,'methodology'),(936,'mic'),(363,'mid'),(757,'militate'),(933,'minimal'),(354,'mismanaged'),(284,'mistakenly'),(287,'mitments'),(481,'model'),(431,'modeling'),(427,'models'),(72,'moderate'),(487,'modifying'),(702,'monitoring'),(578,'monounsaturated'),(161,'montgomerie'),(821,'months'),(529,'morse'),(778,'mosaic'),(327,'motivate'),(337,'motivation'),(579,'mufa'),(950,'multi'),(947,'multidrug'),(725,'multiethnic'),(724,'multilingual'),(114,'multinational'),(930,'multiple'),(388,'mwandenga'),(103,'nation'),(117,'national'),(126,'nations'),(120,'nature'),(451,'necessarily'),(700,'necessitates'),(952,'networked'),(225,'newly'),(712,'nicaragua'),(769,'nigeria'),(879,'nodes'),(882,'nodular'),(654,'normal'),(683,'north'),(908,'nosocomial'),(423,'novak'),(664,'numerical'),(309,'nurturing'),(825,'nutrition'),(605,'nutritional'),(55,'observed'),(401,'offer'),(556,'oil'),(650,'onion'),(269,'order'),(115,'organization'),(133,'organizational'),(517,'organizations'),(883,'organs'),(848,'origin'),(473,'original'),(340,'ostrom'),(719,'overcome'),(382,'paglieri'),(215,'paper'),(57,'parameters'),(590,'parma'),(285,'part'),(92,'partially'),(311,'participate'),(733,'participatory'),(516,'partner'),(345,'past'),(705,'patricia'),(943,'pattern'),(913,'patterns'),(14,'pbps'),(761,'pedagogy'),(290,'people'),(927,'percent'),(64,'percentages'),(535,'performance'),(45,'period'),(672,'periods'),(437,'permit'),(448,'permits'),(138,'personal'),(941,'persons'),(970,'perverse'),(252,'phillips'),(93,'pig'),(537,'piglets'),(20,'pigs'),(384,'pinto'),(356,'places'),(629,'plan'),(440,'planning'),(799,'planting'),(250,'plants'),(905,'plasmid'),(925,'pneumoniae'),(89,'point'),(168,'policy'),(575,'polyunsaturated'),(373,'pool'),(697,'population'),(789,'portions'),(329,'positive'),(929,'possess'),(410,'potential'),(680,'potentiometric'),(754,'power'),(406,'practical'),(169,'practice'),(840,'pre'),(858,'predominant'),(869,'pregnant'),(509,'present'),(316,'presented'),(770,'presents'),(10,'pressed'),(897,'prevent'),(147,'previous'),(624,'primary'),(495,'principles'),(280,'pro'),(74,'prob'),(322,'problem'),(966,'problematic'),(286,'procedural'),(816,'processing'),(8,'production'),(274,'productive'),(96,'products'),(207,'professional'),(543,'profile'),(914,'profiles'),(643,'program'),(894,'programmes'),(239,'progress'),(520,'project'),(515,'projects'),(898,'promote'),(762,'promoting'),(693,'properties'),(375,'property'),(602,'proportion'),(399,'prospects'),(630,'protect'),(454,'provide'),(185,'province'),(177,'provincial'),(220,'public'),(576,'pufa'),(12,'pulp'),(674,'pumping'),(971,'punishing'),(271,'pursue'),(6,'quality'),(5,'quantity'),(635,'questions'),(636,'raised'),(765,'rana'),(549,'randomized'),(557,'rapeseed'),(696,'rapid'),(222,'rate'),(41,'ratio'),(968,'reaching'),(97,'readily'),(861,'rearing'),(385,'reason'),(85,'receiving'),(238,'recent'),(669,'recharge'),(386,'reclaimed'),(843,'recorded'),(946,'recovered'),(855,'red'),(786,'reduction'),(791,'reductions'),(570,'reflected'),(447,'reflects'),(272,'refute'),(82,'regard'),(776,'regarded'),(370,'region'),(438,'regional'),(371,'regions'),(755,'relations'),(942,'relationship'),(420,'rely'),(923,'remaining'),(472,'removed'),(44,'replaced'),(15,'replacing'),(151,'report'),(846,'represent'),(831,'representative'),(477,'represents'),(224,'require'),(202,'required'),(164,'requirements'),(152,'research'),(362,'researchers'),(469,'reservoir'),(449,'reservoirs'),(904,'resistance'),(804,'resistant'),(374,'resource'),(352,'resources'),(200,'respect'),(880,'respiratory'),(221,'response'),(121,'responses'),(588,'result'),(217,'results'),(131,'revealed'),(237,'review'),(359,'reyes'),(343,'rienced'),(436,'rights'),(444,'river'),(262,'robert'),(308,'role'),(823,'rosanna'),(824,'rossi'),(784,'rot'),(797,'rotation'),(433,'routinely'),(973,'ruled'),(833,'safety'),(563,'samples'),(617,'san'),(957,'sanction'),(963,'sanctioned'),(965,'sanctioning'),(958,'sanctions'),(102,'satisfaction'),(143,'satisfied'),(572,'saturated'),(851,'savannah'),(348,'scholars'),(204,'school'),(71,'seasoning'),(368,'sec'),(610,'security'),(641,'segments'),(468,'selected'),(83,'semimembranosus'),(658,'separated'),(192,'september'),(623,'serves'),(492,'service'),(475,'set'),(503,'setting'),(926,'seventy'),(782,'severe'),(574,'sfa'),(265,'share'),(254,'shared'),(412,'shareholding'),(819,'shelf'),(599,'show'),(61,'showed'),(317,'showing'),(328,'shown'),(677,'shows'),(397,'signal'),(395,'signaling'),(389,'signalling'),(53,'significant'),(62,'significantly'),(13,'silage'),(866,'similar'),(462,'simplifying'),(463,'simulation'),(663,'simulations'),(113,'single'),(827,'situation'),(163,'skill'),(179,'skills'),(875,'skin'),(561,'slaughter'),(829,'slaughtered'),(560,'slaughtering'),(682,'slopes'),(314,'social'),(312,'society'),(532,'sodium'),(294,'sokoloff'),(323,'solving'),(628,'source'),(626,'south'),(632,'species'),(351,'specific'),(198,'specifies'),(777,'spread'),(619,'springs'),(735,'staff'),(211,'standards'),(511,'stanford'),(446,'state'),(439,'statewide'),(774,'storage'),(792,'stored'),(928,'strains'),(209,'strategies'),(318,'strategy'),(476,'streamflows'),(895,'strengthen'),(690,'structural'),(141,'structures'),(518,'student'),(180,'students'),(18,'studied'),(315,'studies'),(105,'study'),(596,'subcutaneous'),(344,'substantial'),(523,'successful'),(153,'suggest'),(396,'suggests'),(216,'summarizes'),(559,'supplement'),(542,'supplementation'),(553,'supplemented'),(625,'supply'),(137,'support'),(283,'supporters'),(748,'supporting'),(648,'surface'),(111,'survey'),(494,'sustainability'),(490,'sustainable'),(39,'sweet'),(432,'system'),(429,'systems'),(723,'takes'),(554,'tallow'),(325,'taught'),(507,'teach'),(166,'teachers'),(606,'technological'),(171,'technology'),(805,'tecto'),(218,'telephone'),(565,'ten'),(541,'term'),(430,'texas'),(390,'theory'),(259,'thesis'),(806,'thiabendazole'),(845,'thoracis'),(747,'time'),(355,'times'),(545,'tissue'),(176,'today'),(940,'tolerant'),(505,'tool'),(278,'topic'),(497,'topics'),(369,'tors'),(867,'toughest'),(899,'trade'),(38,'traditional'),(234,'transformation'),(852,'transhumance'),(567,'treatment'),(598,'treatments'),(236,'trees'),(703,'trend'),(49,'trial'),(889,'tuberculosis'),(790,'tubers'),(206,'turning'),(459,'types'),(81,'unaffected'),(244,'understanding'),(728,'university'),(689,'unknown'),(593,'unsaturation'),(212,'upgrade'),(289,'uphold'),(729,'uraccan'),(158,'urho'),(900,'vajiheh'),(948,'valerie'),(330,'valuable'),(87,'values'),(379,'van'),(681,'variation'),(864,'varied'),(442,'variety'),(647,'vicinity'),(90,'view'),(779,'virus'),(496,'vital'),(670,'vulnerable'),(740,'wales'),(425,'water'),(536,'weaned'),(538,'weaning'),(29,'weight'),(551,'weights'),(653,'wet'),(23,'whey'),(547,'white'),(292,'widely'),(949,'williamson'),(361,'wittfogel'),(810,'wood'),(976,'woods'),(249,'woody'),(367,'work'),(372,'world'),(767,'yam'),(783,'yams'),(836,'yaoundé'),(822,'year'),(975,'zita');
/*!40000 ALTER TABLE `submission_search_keyword_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_search_object_keywords`
--

DROP TABLE IF EXISTS `submission_search_object_keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submission_search_object_keywords` (
  `submission_search_object_keyword_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `object_id` bigint NOT NULL,
  `keyword_id` bigint NOT NULL,
  `pos` int NOT NULL COMMENT 'Word position of the keyword in the object.',
  PRIMARY KEY (`submission_search_object_keyword_id`),
  UNIQUE KEY `submission_search_object_keywords_unique` (`object_id`,`pos`),
  KEY `submission_search_object_keywords_object_id` (`object_id`),
  KEY `submission_search_object_keywords_keyword_id` (`keyword_id`),
  CONSTRAINT `submission_search_object_keywords_keyword_id` FOREIGN KEY (`keyword_id`) REFERENCES `submission_search_keyword_list` (`keyword_id`) ON DELETE CASCADE,
  CONSTRAINT `submission_search_object_keywords_object_id_foreign` FOREIGN KEY (`object_id`) REFERENCES `submission_search_objects` (`object_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5467 DEFAULT CHARSET=utf8mb3 COMMENT='Relationships between search objects and keywords in the search index';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_search_object_keywords`
--

LOCK TABLES `submission_search_object_keywords` WRITE;
/*!40000 ALTER TABLE `submission_search_object_keywords` DISABLE KEYS */;
INSERT INTO `submission_search_object_keywords` VALUES (142,1,1,0),(143,1,2,1),(144,2,3,0),(145,2,4,1),(146,2,5,2),(147,2,6,3),(148,2,7,4),(149,2,8,5),(150,3,9,0),(151,3,10,1),(152,3,11,2),(153,3,12,3),(154,3,13,4),(155,3,14,5),(156,3,15,6),(157,3,16,7),(158,3,17,8),(159,3,18,9),(160,3,19,10),(161,3,20,11),(162,3,21,12),(163,3,22,13),(164,3,23,14),(165,3,24,15),(166,3,25,16),(167,3,26,17),(168,3,20,18),(169,3,27,19),(170,3,28,20),(171,3,29,21),(172,3,30,22),(173,3,31,23),(174,3,32,24),(175,3,33,25),(176,3,34,26),(177,3,35,27),(178,3,36,28),(179,3,37,29),(180,3,20,30),(181,3,21,31),(182,3,38,32),(183,3,39,33),(184,3,23,34),(185,3,24,35),(186,3,40,36),(187,3,41,37),(188,3,23,38),(189,3,42,39),(190,3,43,40),(191,3,14,41),(192,3,44,42),(193,3,16,43),(194,3,17,44),(195,3,45,45),(196,3,46,46),(197,3,47,47),(198,3,48,48),(199,3,49,49),(200,3,17,50),(201,3,14,51),(202,3,44,52),(203,3,16,53),(204,3,17,54),(205,3,50,55),(206,3,45,56),(207,3,25,57),(208,3,51,58),(209,3,22,59),(210,3,23,60),(211,3,24,61),(212,3,52,62),(213,3,53,63),(214,3,54,64),(215,3,55,65),(216,3,56,66),(217,3,57,67),(218,3,58,68),(219,3,59,69),(220,3,20,70),(221,3,25,71),(222,3,60,72),(223,3,14,73),(224,3,61,74),(225,3,62,75),(226,3,63,76),(227,3,64,77),(228,3,65,78),(229,3,66,79),(230,3,67,80),(231,3,64,81),(232,3,68,82),(233,3,66,83),(234,3,69,84),(235,3,29,85),(236,3,70,86),(237,3,71,87),(238,3,72,88),(239,3,62,89),(240,3,73,90),(241,3,14,91),(242,3,21,92),(243,3,20,93),(244,3,74,94),(245,3,75,95),(246,3,67,96),(247,3,76,97),(248,3,77,98),(249,3,78,99),(250,3,79,100),(251,3,80,101),(252,3,69,102),(253,3,68,103),(254,3,81,104),(255,3,25,105),(256,3,82,106),(257,3,83,107),(258,3,84,108),(259,3,20,109),(260,3,85,110),(261,3,14,111),(262,3,61,112),(263,3,67,113),(264,3,86,114),(265,3,87,115),(266,3,88,116),(267,3,89,117),(268,3,90,118),(269,3,91,119),(270,3,14,120),(271,3,92,121),(272,3,15,122),(273,3,16,123),(274,3,22,124),(275,3,23,125),(276,3,19,126),(277,3,93,127),(278,3,8,128),(279,3,94,129),(280,3,95,130),(281,3,96,131),(282,3,97,132),(461,9,98,0),(462,9,99,1),(463,9,158,2),(464,9,159,3),(465,10,100,0),(466,10,101,1),(467,10,102,2),(468,10,103,3),(469,10,104,4),(470,10,105,5),(471,10,106,6),(472,10,107,7),(473,11,108,0),(474,11,109,1),(475,11,110,2),(476,11,111,3),(477,11,112,4),(478,11,113,5),(479,11,114,6),(480,11,115,7),(481,11,116,8),(482,11,77,9),(483,11,117,10),(484,11,118,11),(485,11,119,12),(486,11,120,13),(487,11,101,14),(488,11,102,15),(489,11,121,16),(490,11,122,17),(491,11,123,18),(492,11,124,19),(493,11,125,20),(494,11,126,21),(495,11,127,22),(496,11,128,23),(497,11,129,24),(498,11,130,25),(499,11,131,26),(500,11,132,27),(501,11,133,28),(502,11,134,29),(503,11,133,30),(504,11,135,31),(505,11,136,32),(506,11,133,33),(507,11,137,34),(508,11,138,35),(509,11,139,36),(510,11,140,37),(511,11,129,38),(512,11,141,39),(513,11,133,40),(514,11,134,41),(515,11,142,42),(516,11,106,43),(517,11,107,44),(518,11,138,45),(519,11,139,46),(520,11,143,47),(521,11,112,48),(522,11,144,49),(523,11,143,50),(524,11,145,51),(525,11,146,52),(526,11,147,53),(527,11,148,54),(528,11,149,55),(529,11,150,56),(530,11,126,57),(531,11,151,58),(532,11,63,59),(533,11,102,60),(534,11,152,61),(535,11,148,62),(536,11,153,63),(537,11,117,64),(538,11,154,65),(539,11,155,66),(540,11,156,67),(541,11,157,68),(542,11,120,69),(543,11,101,70),(544,11,102,71),(545,13,112,0),(546,13,111,1),(1080,25,160,0),(1081,25,161,1),(1082,25,229,2),(1083,25,230,3),(1084,26,162,0),(1085,26,163,1),(1086,26,164,2),(1087,26,165,3),(1088,26,166,4),(1089,26,167,5),(1090,26,168,6),(1091,26,169,7),(1092,27,170,0),(1093,27,171,1),(1094,27,172,2),(1095,27,173,3),(1096,27,174,4),(1097,27,175,5),(1098,27,176,6),(1099,27,117,7),(1100,27,177,8),(1101,27,178,9),(1102,27,171,10),(1103,27,179,11),(1104,27,180,12),(1105,27,181,13),(1106,27,182,14),(1107,27,183,15),(1108,27,184,16),(1109,27,185,17),(1110,27,186,18),(1111,27,187,19),(1112,27,188,20),(1113,27,189,21),(1114,27,190,22),(1115,27,191,23),(1116,27,192,24),(1117,27,193,25),(1118,27,194,26),(1119,27,134,27),(1120,27,171,28),(1121,27,190,29),(1122,27,195,30),(1123,27,196,31),(1124,27,197,32),(1125,27,198,33),(1126,27,180,34),(1127,27,199,35),(1128,27,200,36),(1129,27,171,37),(1130,27,186,38),(1131,27,201,39),(1132,27,166,40),(1133,27,202,41),(1134,27,203,42),(1135,27,190,43),(1136,27,204,44),(1137,27,205,45),(1138,27,206,46),(1139,27,207,47),(1140,27,208,48),(1141,27,209,49),(1142,27,210,50),(1143,27,211,51),(1144,27,212,52),(1145,27,166,53),(1146,27,162,54),(1147,27,179,55),(1148,27,213,56),(1149,27,214,57),(1150,27,215,58),(1151,27,216,59),(1152,27,217,60),(1153,27,218,61),(1154,27,111,62),(1155,27,219,63),(1156,27,220,64),(1157,27,204,65),(1158,27,205,66),(1159,27,185,67),(1160,27,186,68),(1161,27,221,69),(1162,27,222,70),(1163,27,223,71),(1164,27,162,72),(1165,27,179,73),(1166,27,204,74),(1167,27,205,75),(1168,27,224,76),(1169,27,225,77),(1170,27,226,78),(1171,27,166,79),(1172,27,137,80),(1173,27,209,81),(1174,27,227,82),(1175,27,227,83),(1176,27,166,84),(1177,29,228,0),(1178,29,171,1),(1179,29,162,2),(1180,29,179,3),(1181,29,111,4),(1182,29,186,5),(1183,29,117,6),(1184,29,177,7),(1185,29,207,8),(1186,29,208,9),(1187,29,112,10),(1215,33,231,0),(1216,33,232,1),(1217,34,233,0),(1218,34,234,1),(1219,34,235,2),(1220,34,236,3),(1221,35,237,0),(1222,35,238,1),(1223,35,239,2),(1224,35,233,3),(1225,35,234,4),(1226,35,235,5),(1227,35,236,6),(1228,35,240,7),(1229,35,241,8),(1230,35,233,9),(1231,35,242,10),(1232,35,243,11),(1233,35,235,12),(1234,35,236,13),(1235,35,244,14),(1236,35,245,15),(1237,35,246,16),(1238,35,247,17),(1239,35,248,18),(1240,35,249,19),(1241,35,250,20),(1446,49,251,0),(1447,49,252,1),(1448,50,253,0),(1449,50,254,1),(1450,50,255,2),(1451,50,202,3),(1452,50,256,4),(1453,50,257,5),(1454,50,258,6),(1455,50,259,7),(1456,50,260,8),(1457,50,261,9),(1458,51,262,0),(1459,51,258,1),(1460,51,263,2),(1461,51,264,3),(1462,51,265,4),(1463,51,266,5),(1464,51,255,6),(1465,51,267,7),(1466,51,268,8),(1467,51,269,9),(1468,51,270,10),(1469,51,271,11),(1470,51,256,12),(1471,51,272,13),(1472,51,258,14),(1473,51,273,15),(1474,51,253,16),(1475,51,254,17),(1476,51,255,18),(1477,51,202,19),(1478,51,274,20),(1479,51,256,21),(1480,51,275,22),(1481,51,255,23),(1482,51,276,24),(1483,51,277,25),(1484,51,267,26),(1485,51,278,27),(1486,51,279,28),(1487,51,254,29),(1488,51,280,30),(1489,51,281,31),(1490,51,268,32),(1491,51,282,33),(1492,51,153,34),(1493,51,258,35),(1494,51,283,36),(1495,51,284,37),(1496,51,90,38),(1497,51,254,39),(1498,51,267,40),(1499,51,285,41),(1500,51,202,42),(1501,51,255,43),(1502,51,274,44),(1503,51,256,45),(1504,51,286,46),(1505,51,287,47),(1506,51,288,48),(1507,51,289,49),(1508,51,290,50),(1509,51,267,51),(1510,51,291,52),(1511,51,292,53),(1512,51,278,54),(1513,51,279,55),(1676,57,293,0),(1677,57,294,1),(1678,58,295,0),(1679,58,296,1),(1680,58,267,2),(1681,58,172,3),(1682,59,173,0),(1683,59,214,1),(1684,59,175,2),(1685,59,297,3),(1686,59,298,4),(1687,59,299,5),(1688,59,179,6),(1689,59,300,7),(1690,59,301,8),(1691,59,302,9),(1692,59,303,10),(1693,59,303,11),(1694,59,304,12),(1695,59,305,13),(1696,59,306,14),(1697,59,215,15),(1698,59,307,16),(1699,59,308,17),(1700,59,309,18),(1701,59,296,19),(1702,59,267,20),(1703,59,269,21),(1704,59,310,22),(1705,59,311,23),(1706,59,204,24),(1707,59,312,25),(1708,59,152,26),(1709,59,148,27),(1710,59,313,28),(1711,59,314,29),(1712,59,315,30),(1713,59,155,31),(1714,59,316,32),(1715,59,317,33),(1716,59,318,34),(1717,59,319,35),(1718,59,320,36),(1719,59,296,37),(1720,59,201,38),(1721,59,285,39),(1722,59,152,40),(1723,59,321,41),(1724,59,322,42),(1725,59,323,43),(1726,59,324,44),(1727,59,325,45),(1728,59,298,46),(1729,59,326,47),(1730,59,327,48),(1731,59,137,49),(1732,59,201,50),(1733,59,328,51),(1734,59,324,52),(1735,59,329,53),(1736,59,9,54),(1737,59,296,55),(1738,59,201,56),(1739,59,330,57),(1740,59,266,58),(1741,59,331,59),(1742,59,298,60),(1743,59,332,61),(1744,59,333,62),(1745,59,334,63),(1746,59,314,64),(1747,59,335,65),(1748,59,167,66),(1749,59,336,67),(1750,59,296,68),(1751,59,337,69),(1752,59,310,70),(1753,59,172,71),(1754,59,240,72),(1755,61,175,0),(1756,61,338,1),(1869,65,339,0),(1870,65,340,1),(1871,65,378,2),(1872,65,379,3),(1873,65,380,4),(1874,66,295,0),(1875,66,296,1),(1876,66,267,2),(1877,66,172,3),(1878,67,105,0),(1879,67,341,1),(1880,67,342,2),(1881,67,343,3),(1882,67,344,4),(1883,67,56,5),(1884,67,208,6),(1885,67,345,7),(1886,67,346,8),(1887,67,347,9),(1888,67,348,10),(1889,67,349,11),(1890,67,350,12),(1891,67,18,13),(1892,67,351,14),(1893,67,352,15),(1894,67,353,16),(1895,67,354,17),(1896,67,355,18),(1897,67,356,19),(1898,67,357,20),(1899,67,358,21),(1900,67,359,22),(1901,67,360,23),(1902,67,361,24),(1903,67,362,25),(1904,67,18,26),(1905,67,351,27),(1906,67,341,28),(1907,67,363,29),(1908,67,364,30),(1909,67,365,31),(1910,67,366,32),(1911,67,302,33),(1912,67,367,34),(1913,67,348,35),(1914,67,349,36),(1915,67,368,37),(1916,67,369,38),(1917,67,370,39),(1918,67,94,40),(1919,67,371,41),(1920,67,372,42),(1921,69,277,0),(1922,69,373,1),(1923,69,374,2),(1924,69,277,3),(1925,69,375,4),(1926,69,376,5),(1927,69,377,6),(1940,73,381,0),(1941,73,382,1),(1942,74,383,0),(1943,74,384,1),(1944,74,385,2),(1945,74,386,3),(2048,81,387,0),(2049,81,388,1),(2050,82,389,0),(2051,82,390,1),(2052,82,391,2),(2053,82,237,3),(2054,82,392,4),(2055,82,393,5),(2056,82,394,6),(2057,83,395,0),(2058,83,390,1),(2059,83,396,2),(2060,83,391,3),(2061,83,397,4),(2062,83,398,5),(2063,83,399,6),(2064,83,400,7),(2065,83,238,8),(2066,83,393,9),(2067,83,394,10),(2068,83,401,11),(2069,83,402,12),(2070,83,394,13),(2071,83,174,14),(2072,83,403,15),(2073,83,168,16),(2074,83,167,17),(2075,83,404,18),(2076,83,405,19),(2077,83,406,20),(2078,83,407,21),(2079,83,168,22),(2080,83,408,23),(2081,83,409,24),(2082,83,165,25),(2083,83,410,26),(2084,83,411,27),(2085,83,412,28),(2086,83,413,29),(2087,83,414,30),(2088,83,415,31),(2089,83,416,32),(2090,83,417,33),(2091,83,418,34),(2092,83,419,35),(2093,83,409,36),(2094,83,407,37),(2095,83,417,38),(2096,83,420,39),(2097,83,421,40),(2098,83,422,41),(2353,89,387,0),(2354,89,423,1),(2355,90,424,0),(2356,90,425,1),(2357,90,426,2),(2358,90,427,3),(2359,90,428,4),(2360,90,351,5),(2361,90,425,6),(2362,90,409,7),(2363,90,429,8),(2364,91,430,0),(2365,91,425,1),(2366,91,426,2),(2367,91,431,3),(2368,91,432,4),(2369,91,433,5),(2370,91,434,6),(2371,91,435,7),(2372,91,425,8),(2373,91,436,9),(2374,91,437,10),(2375,91,432,11),(2376,91,438,12),(2377,91,439,13),(2378,91,440,14),(2379,91,441,15),(2380,91,442,16),(2381,91,443,17),(2382,91,431,18),(2383,91,425,19),(2384,91,409,20),(2385,91,444,21),(2386,91,445,22),(2387,91,446,23),(2388,91,447,24),(2389,91,425,25),(2390,91,448,26),(2391,91,449,27),(2392,91,450,28),(2393,91,451,29),(2394,91,452,30),(2395,91,453,31),(2396,91,454,32),(2397,91,332,33),(2398,91,137,34),(2399,91,455,35),(2400,91,431,36),(2401,91,432,37),(2402,91,456,38),(2403,91,431,39),(2404,91,457,40),(2405,91,458,41),(2406,91,459,42),(2407,91,241,43),(2408,91,460,44),(2409,91,241,45),(2410,91,461,46),(2411,91,462,47),(2412,91,463,48),(2413,91,464,49),(2414,91,450,50),(2415,91,428,51),(2416,91,425,52),(2417,91,409,53),(2418,91,429,54),(2419,91,465,55),(2420,91,316,56),(2421,91,295,57),(2422,91,466,58),(2423,91,467,59),(2424,91,468,60),(2425,91,469,61),(2426,91,432,62),(2427,91,447,63),(2428,91,470,64),(2429,91,425,65),(2430,91,436,66),(2431,91,471,67),(2432,91,449,68),(2433,91,472,69),(2434,91,473,70),(2435,91,474,71),(2436,91,467,72),(2437,91,475,73),(2438,91,476,74),(2439,91,456,75),(2440,91,477,76),(2441,91,478,77),(2442,91,468,78),(2443,91,432,79),(2444,91,9,80),(2445,91,425,81),(2446,91,436,82),(2447,91,444,83),(2448,91,479,84),(2449,91,480,85),(2450,91,473,86),(2451,91,474,87),(2452,91,481,88),(2453,91,464,89),(2454,91,467,90),(2455,91,482,91),(2456,91,466,92),(2457,91,467,93),(2458,91,465,94),(2459,91,434,95),(2460,91,483,96),(2461,91,466,97),(2462,91,481,98),(2463,91,484,99),(2464,91,444,100),(2465,91,485,101),(2466,91,469,102),(2467,91,432,103),(2468,91,486,104),(2469,91,487,105),(2470,91,430,106),(2471,91,425,107),(2472,91,426,108),(2473,91,431,109),(2474,91,432,110),(2475,91,467,111),(2476,91,484,112),(2477,91,444,113),(2478,91,479,114),(2479,93,425,0),(2636,97,488,0),(2637,97,489,1),(2638,97,528,2),(2639,97,529,3),(2640,98,201,0),(2641,98,490,1),(2642,98,491,2),(2643,98,492,3),(2644,99,493,0),(2645,99,494,1),(2646,99,490,2),(2647,99,208,3),(2648,99,495,4),(2649,99,496,5),(2650,99,497,6),(2651,99,242,7),(2652,99,175,8),(2653,99,498,9),(2654,99,499,10),(2655,99,500,11),(2656,99,492,12),(2657,99,201,13),(2658,99,501,14),(2659,99,314,15),(2660,99,492,16),(2661,99,502,17),(2662,99,503,18),(2663,99,504,19),(2664,99,505,20),(2665,99,506,21),(2666,99,507,22),(2667,99,490,23),(2668,99,491,24),(2669,99,398,25),(2670,99,508,26),(2671,99,509,27),(2672,99,481,28),(2673,99,492,29),(2674,99,201,30),(2675,99,507,31),(2676,99,490,32),(2677,99,491,33),(2678,99,486,34),(2679,99,510,35),(2680,99,511,36),(2681,99,512,37),(2682,99,508,38),(2683,99,490,39),(2684,99,372,40),(2685,99,481,41),(2686,99,513,42),(2687,99,514,43),(2688,99,515,44),(2689,99,516,45),(2690,99,517,46),(2691,99,518,47),(2692,99,519,48),(2693,99,520,49),(2694,99,486,50),(2695,99,491,51),(2696,99,521,52),(2697,99,522,53),(2698,99,516,54),(2699,99,517,55),(2700,99,481,56),(2701,99,523,57),(2702,99,524,58),(2703,99,525,59),(2704,99,526,60),(2705,99,240,61),(2706,99,398,62),(2707,99,527,63),(2708,99,441,64),(2709,99,481,65),(2710,101,208,0),(2711,101,242,1),(2712,101,175,2),(2713,101,492,3),(2714,101,201,4),(2715,101,494,5),(3036,105,530,0),(3037,105,531,1),(3038,106,532,0),(3039,106,533,1),(3040,106,534,2),(3041,106,56,3),(3042,106,535,4),(3043,106,536,5),(3044,106,537,6),(3045,106,45,7),(3046,106,538,8),(3047,107,539,0),(3048,107,105,1),(3049,107,540,2),(3050,107,3,3),(3051,107,350,4),(3052,107,541,5),(3053,107,68,6),(3054,107,542,7),(3055,107,78,8),(3056,107,79,9),(3057,107,543,10),(3058,107,19,11),(3059,107,93,12),(3060,107,544,13),(3061,107,545,14),(3062,107,546,15),(3063,107,452,16),(3064,107,547,17),(3065,107,30,18),(3066,107,548,19),(3067,107,549,20),(3068,107,550,21),(3069,107,551,22),(3070,107,552,23),(3071,107,25,24),(3072,107,553,25),(3073,107,554,26),(3074,107,555,27),(3075,107,556,28),(3076,107,557,29),(3077,107,556,30),(3078,107,558,31),(3079,107,559,32),(3080,107,21,33),(3081,107,560,34),(3082,107,561,35),(3083,107,562,36),(3084,107,563,37),(3085,107,564,38),(3086,107,565,39),(3087,107,566,40),(3088,107,567,41),(3089,107,568,42),(3090,107,78,43),(3091,107,79,44),(3092,107,80,45),(3093,107,562,46),(3094,107,569,47),(3095,107,570,48),(3096,107,78,49),(3097,107,79,50),(3098,107,80,51),(3099,107,553,52),(3100,107,558,53),(3101,107,562,54),(3102,107,20,55),(3103,107,21,56),(3104,107,571,57),(3105,107,572,58),(3106,107,78,59),(3107,107,79,60),(3108,107,573,61),(3109,107,574,62),(3110,107,21,63),(3111,107,571,64),(3112,107,573,65),(3113,107,575,66),(3114,107,78,67),(3115,107,79,68),(3116,107,576,69),(3117,107,577,70),(3118,107,578,71),(3119,107,78,72),(3120,107,79,73),(3121,107,579,74),(3122,107,573,75),(3123,107,21,76),(3124,107,571,77),(3125,107,573,78),(3126,107,580,79),(3127,107,79,80),(3128,107,581,81),(3129,107,582,82),(3130,107,583,83),(3131,107,79,84),(3132,107,584,85),(3133,107,567,86),(3134,107,157,87),(3135,107,585,88),(3136,107,79,89),(3137,107,586,90),(3138,107,587,91),(3139,107,562,92),(3140,107,588,93),(3141,107,60,94),(3142,107,586,95),(3143,107,63,96),(3144,107,581,97),(3145,107,589,98),(3146,107,590,99),(3147,107,591,100),(3148,107,42,101),(3149,107,592,102),(3150,107,69,103),(3151,107,593,104),(3152,107,594,105),(3153,107,595,106),(3154,107,596,107),(3155,107,562,108),(3156,107,545,109),(3157,107,597,110),(3158,107,62,111),(3159,107,598,112),(3160,107,217,113),(3161,107,599,114),(3162,107,350,115),(3163,107,541,116),(3164,107,600,117),(3165,107,542,118),(3166,107,558,119),(3167,107,78,120),(3168,107,79,121),(3169,107,543,122),(3170,107,19,123),(3171,107,93,124),(3172,107,544,125),(3173,107,545,126),(3174,107,542,127),(3175,107,557,128),(3176,107,556,129),(3177,107,601,130),(3178,107,602,131),(3179,107,603,132),(3180,107,78,133),(3181,107,604,134),(3182,107,93,135),(3183,107,68,136),(3184,107,243,137),(3185,107,605,138),(3186,107,6,139),(3187,107,9,140),(3188,107,606,141),(3189,107,6,142),(3190,107,68,143),(3191,107,607,144),(3192,107,608,145),(3193,109,20,0),(3194,109,609,1),(3195,109,610,2),(3646,113,611,0),(3647,113,612,1),(3648,114,613,0),(3649,114,614,1),(3650,114,615,2),(3651,114,616,3),(3652,114,617,4),(3653,114,618,5),(3654,114,619,6),(3655,114,620,7),(3656,114,619,8),(3657,114,621,9),(3658,114,622,10),(3659,115,615,0),(3660,115,616,1),(3661,115,623,2),(3662,115,624,3),(3663,115,425,4),(3664,115,625,5),(3665,115,626,6),(3666,115,627,7),(3667,115,430,8),(3668,115,628,9),(3669,115,173,10),(3670,115,619,11),(3671,115,295,12),(3672,115,629,13),(3673,115,630,14),(3674,115,631,15),(3675,115,632,16),(3676,115,633,17),(3677,115,634,18),(3678,115,617,19),(3679,115,618,20),(3680,115,619,21),(3681,115,635,22),(3682,115,636,23),(3683,115,637,24),(3684,115,638,25),(3685,115,613,26),(3686,115,639,27),(3687,115,617,28),(3688,115,640,29),(3689,115,620,30),(3690,115,619,31),(3691,115,641,32),(3692,115,615,33),(3693,115,616,34),(3694,115,621,35),(3695,115,622,36),(3696,115,500,37),(3697,115,635,38),(3698,115,425,39),(3699,115,183,40),(3700,115,109,41),(3701,115,642,42),(3702,115,643,43),(3703,115,644,44),(3704,115,105,45),(3705,115,313,46),(3706,115,130,47),(3707,115,645,48),(3708,115,183,49),(3709,115,109,50),(3710,115,645,51),(3711,115,639,52),(3712,115,646,53),(3713,115,647,54),(3714,115,648,55),(3715,115,649,56),(3716,115,639,57),(3717,115,650,58),(3718,115,651,59),(3719,115,652,60),(3720,115,444,61),(3721,115,653,62),(3722,115,654,63),(3723,115,613,64),(3724,115,622,65),(3725,115,130,66),(3726,115,109,67),(3727,115,564,68),(3728,115,621,69),(3729,115,396,70),(3730,115,645,71),(3731,115,639,72),(3732,115,655,73),(3733,115,656,74),(3734,115,657,75),(3735,115,658,76),(3736,115,641,77),(3737,115,588,78),(3738,115,410,79),(3739,115,645,80),(3740,115,659,81),(3741,115,345,82),(3742,115,617,83),(3743,115,618,84),(3744,115,619,85),(3745,115,620,86),(3746,115,619,87),(3747,115,173,88),(3748,115,660,89),(3749,115,167,90),(3750,115,661,91),(3751,115,409,92),(3752,115,426,93),(3753,115,645,94),(3754,115,615,95),(3755,115,616,96),(3756,115,662,97),(3757,115,663,98),(3758,115,664,99),(3759,115,481,100),(3760,115,153,101),(3761,115,665,102),(3762,115,666,103),(3763,115,345,104),(3764,115,617,105),(3765,115,618,106),(3766,115,620,107),(3767,115,619,108),(3768,115,621,109),(3769,115,622,110),(3770,115,645,111),(3771,115,639,112),(3772,115,667,113),(3773,115,668,114),(3774,115,669,115),(3775,115,650,116),(3776,115,651,117),(3777,115,652,118),(3778,115,444,119),(3779,115,667,120),(3780,115,670,121),(3781,115,671,122),(3782,115,672,123),(3783,115,669,124),(3784,115,673,125),(3785,115,674,126),(3786,115,647,127),(3787,115,675,128),(3788,115,676,129),(3789,115,109,130),(3790,115,475,131),(3791,115,677,132),(3792,115,678,133),(3793,115,679,134),(3794,115,680,135),(3795,115,648,136),(3796,115,617,137),(3797,115,618,138),(3798,115,619,139),(3799,115,675,140),(3800,115,681,141),(3801,115,586,142),(3802,115,621,143),(3803,115,621,144),(3804,115,672,145),(3805,115,675,146),(3806,115,620,147),(3807,115,619,148),(3808,115,680,149),(3809,115,648,150),(3810,115,682,151),(3811,115,62,152),(3812,115,683,153),(3813,115,684,154),(3814,115,586,155),(3815,115,621,156),(3816,115,621,157),(3817,115,672,158),(3818,115,628,159),(3819,115,120,160),(3820,115,685,161),(3821,115,686,162),(3822,115,680,163),(3823,115,687,164),(3824,115,688,165),(3825,115,425,166),(3826,115,183,167),(3827,115,221,168),(3828,115,675,169),(3829,115,689,170),(3830,115,690,171),(3831,115,691,172),(3832,115,692,173),(3833,115,693,174),(3834,115,694,175),(3835,115,616,176),(3836,115,685,177),(3837,115,3,178),(3838,115,77,179),(3839,115,613,180),(3840,115,695,181),(3841,115,617,182),(3842,115,618,183),(3843,115,620,184),(3844,115,619,185),(3845,115,696,186),(3846,115,697,187),(3847,115,56,188),(3848,115,698,189),(3849,115,425,190),(3850,115,699,191),(3851,115,675,192),(3852,115,676,193),(3853,115,95,194),(3854,115,700,195),(3855,115,701,196),(3856,115,645,197),(3857,115,183,198),(3858,115,702,199),(3859,115,643,200),(3860,115,617,201),(3861,115,618,202),(3862,115,619,203),(3863,115,676,204),(3864,115,454,205),(3865,115,109,206),(3866,115,398,207),(3867,115,644,208),(3868,115,703,209),(3869,115,704,210),(3870,117,425,0),(4105,121,705,0),(4106,121,706,1),(4107,122,707,0),(4108,122,708,1),(4109,122,190,2),(4110,122,709,3),(4111,122,105,4),(4112,122,710,5),(4113,122,711,6),(4114,122,712,7),(4115,123,525,0),(4116,123,713,1),(4117,123,714,2),(4118,123,715,3),(4119,123,716,4),(4120,123,717,5),(4121,123,718,6),(4122,123,175,7),(4123,123,719,8),(4124,123,720,9),(4125,123,304,10),(4126,123,526,11),(4127,123,290,12),(4128,123,17,13),(4129,123,721,14),(4130,123,118,15),(4131,123,722,16),(4132,123,709,17),(4133,123,105,18),(4134,123,723,19),(4135,123,710,20),(4136,123,711,21),(4137,123,712,22),(4138,123,724,23),(4139,123,725,24),(4140,123,370,25),(4141,123,726,26),(4142,123,727,27),(4143,123,728,28),(4144,123,729,29),(4145,123,730,30),(4146,123,208,31),(4147,123,731,32),(4148,123,732,33),(4149,123,733,34),(4150,123,152,35),(4151,123,734,36),(4152,123,728,37),(4153,123,735,38),(4154,123,180,39),(4155,123,736,40),(4156,123,737,41),(4157,123,708,42),(4158,123,190,43),(4159,123,209,44),(4160,123,738,45),(4161,123,481,46),(4162,123,17,47),(4163,123,739,48),(4164,123,481,49),(4165,123,727,50),(4166,123,244,51),(4167,123,740,52),(4168,123,190,53),(4169,123,741,54),(4170,123,742,55),(4171,123,743,56),(4172,123,744,57),(4173,123,745,58),(4174,123,746,59),(4175,123,747,60),(4176,123,132,61),(4177,123,748,62),(4178,123,208,63),(4179,123,708,64),(4180,123,190,65),(4181,123,749,66),(4182,123,728,67),(4183,123,569,68),(4184,123,750,69),(4185,123,751,70),(4186,123,745,71),(4187,123,623,72),(4188,123,752,73),(4189,123,753,74),(4190,123,754,75),(4191,123,755,76),(4192,123,370,77),(4193,123,756,78),(4194,123,757,79),(4195,123,758,80),(4196,123,728,81),(4197,123,152,82),(4198,123,759,83),(4199,123,760,84),(4200,123,733,85),(4201,123,761,86),(4202,123,17,87),(4203,123,762,88),(4204,123,731,89),(4205,123,763,90),(4206,123,764,91),(4207,123,314,92),(4208,123,234,93),(4209,125,714,0),(4210,125,715,1),(4211,125,718,2),(4212,125,724,3),(4213,125,725,4),(4214,125,733,5),(4215,125,761,6),(4216,125,721,7),(4217,125,118,8),(4218,125,722,9),(4219,125,758,10),(4220,125,314,11),(4221,125,234,12),(4432,129,765,0),(4433,129,766,1),(4434,130,767,0),(4435,130,768,1),(4436,130,409,2),(4437,130,769,3),(4438,131,237,0),(4439,131,770,1),(4440,131,768,2),(4441,131,767,3),(4442,131,409,4),(4443,131,209,5),(4444,131,227,6),(4445,131,771,7),(4446,131,772,8),(4447,131,769,9),(4448,131,773,10),(4449,131,774,11),(4450,131,768,12),(4451,131,316,13),(4452,131,775,14),(4453,131,776,15),(4454,131,292,16),(4455,131,777,17),(4456,131,773,18),(4457,131,768,19),(4458,131,767,20),(4459,131,778,21),(4460,131,779,22),(4461,131,780,23),(4462,131,781,24),(4463,131,782,25),(4464,131,70,26),(4465,131,783,27),(4466,131,42,28),(4467,131,784,29),(4468,131,781,30),(4469,131,785,31),(4470,131,774,32),(4471,131,768,33),(4472,131,767,34),(4473,131,42,35),(4474,131,784,36),(4475,131,783,37),(4476,131,73,38),(4477,131,786,39),(4478,131,5,40),(4479,131,787,41),(4480,131,788,42),(4481,131,789,43),(4482,131,790,44),(4483,131,791,45),(4484,131,782,46),(4485,131,792,47),(4486,131,783,48),(4487,131,409,49),(4488,131,209,50),(4489,131,793,51),(4490,131,794,52),(4491,131,771,53),(4492,131,773,54),(4493,131,768,55),(4494,131,795,56),(4495,131,796,57),(4496,131,797,58),(4497,131,798,59),(4498,131,799,60),(4499,131,603,61),(4500,131,800,62),(4501,131,801,63),(4502,131,802,64),(4503,131,796,65),(4504,131,803,66),(4505,131,804,67),(4506,131,803,68),(4507,131,774,69),(4508,131,768,70),(4509,131,805,71),(4510,131,806,72),(4511,131,807,73),(4512,131,808,74),(4513,131,42,75),(4514,131,809,76),(4515,131,810,77),(4516,131,811,78),(4517,131,774,79),(4518,131,812,80),(4519,131,630,81),(4520,131,767,82),(4521,131,790,83),(4522,131,813,84),(4523,131,814,85),(4524,131,774,86),(4525,131,815,87),(4526,131,816,88),(4527,131,767,89),(4528,131,790,90),(4529,131,817,91),(4530,131,818,92),(4531,131,601,93),(4532,131,819,94),(4533,131,820,95),(4534,131,45,96),(4535,131,821,97),(4536,131,822,98),(4831,137,823,0),(4832,137,824,1),(4833,138,3,0),(4834,138,350,1),(4835,138,541,2),(4836,138,825,3),(4837,138,600,4),(4838,138,558,5),(4839,138,78,6),(4840,138,79,7),(4841,138,80,8),(4842,138,19,9),(4843,138,20,10),(4844,138,562,11),(4845,139,539,0),(4846,139,152,1),(4847,139,454,2),(4848,139,826,3),(4849,139,827,4),(4850,139,828,5),(4851,139,829,6),(4852,139,830,7),(4853,139,831,8),(4854,139,627,9),(4855,139,832,10),(4856,139,370,11),(4857,139,6,12),(4858,139,833,13),(4859,139,834,14),(4860,139,835,15),(4861,139,836,16),(4862,139,837,17),(4863,139,830,18),(4864,139,781,19),(4865,139,838,20),(4866,139,839,21),(4867,139,840,22),(4868,139,561,23),(4869,139,622,24),(4870,139,841,25),(4871,139,828,26),(4872,139,842,27),(4873,139,843,28),(4874,139,844,29),(4875,139,845,30),(4876,139,561,31),(4877,139,842,32),(4878,139,468,33),(4879,139,846,34),(4880,139,847,35),(4881,139,829,36),(4882,139,6,37),(4883,139,57,38),(4884,139,80,39),(4885,139,844,40),(4886,139,845,41),(4887,139,734,42),(4888,139,848,43),(4889,139,828,44),(4890,139,849,45),(4891,139,850,46),(4892,139,851,47),(4893,139,852,48),(4894,139,277,49),(4895,139,8,50),(4896,139,432,51),(4897,139,853,52),(4898,139,547,53),(4899,139,854,54),(4900,139,855,55),(4901,139,856,56),(4902,139,857,57),(4903,139,858,58),(4904,139,859,59),(4905,139,29,60),(4906,139,860,61),(4907,139,861,62),(4908,139,432,63),(4909,139,828,64),(4910,139,862,65),(4911,139,863,66),(4912,139,864,67),(4913,139,822,68),(4914,139,865,69),(4915,139,6,70),(4916,139,68,71),(4917,139,573,72),(4918,139,678,73),(4919,139,866,74),(4920,139,857,75),(4921,139,853,76),(4922,139,61,77),(4923,139,867,78),(4924,139,865,79),(4925,139,868,80),(4926,139,829,81),(4927,139,869,82),(4928,139,277,83),(4929,139,870,84),(4930,139,622,85),(4931,139,871,86),(4932,139,872,87),(4933,139,873,88),(4934,139,874,89),(4935,139,813,90),(4936,139,875,91),(4937,139,876,92),(4938,139,877,93),(4939,139,878,94),(4940,139,879,95),(4941,139,880,96),(4942,139,881,97),(4943,139,882,98),(4944,139,876,99),(4945,139,842,100),(4946,139,883,101),(4947,139,884,102),(4948,139,885,103),(4949,139,886,104),(4950,139,887,105),(4951,139,884,106),(4952,139,888,107),(4953,139,889,108),(4954,139,860,109),(4955,139,890,110),(4956,139,109,111),(4957,139,891,112),(4958,139,892,113),(4959,139,893,114),(4960,139,894,115),(4961,139,539,116),(4962,139,895,117),(4963,139,828,118),(4964,139,8,119),(4965,139,896,120),(4966,139,834,121),(4967,139,625,122),(4968,139,37,123),(4969,139,897,124),(4970,139,55,125),(4971,139,768,126),(4972,139,898,127),(4973,139,438,128),(4974,139,899,129),(4975,141,828,0),(4976,141,609,1),(4977,141,610,2),(5188,145,900,0),(5189,145,901,1),(5190,146,902,0),(5191,146,19,1),(5192,146,903,2),(5193,146,904,3),(5194,146,905,4),(5195,146,543,5),(5196,146,906,6),(5197,146,907,7),(5198,146,908,8),(5199,146,909,9),(5200,146,910,10),(5201,146,911,11),(5202,146,912,12),(5203,147,902,0),(5204,147,19,1),(5205,147,903,2),(5206,147,904,3),(5207,147,913,4),(5208,147,905,5),(5209,147,914,6),(5210,147,906,7),(5211,147,915,8),(5212,147,907,9),(5213,147,908,10),(5214,147,909,11),(5215,147,603,12),(5216,147,916,13),(5217,147,917,14),(5218,147,128,15),(5219,147,918,16),(5220,147,919,17),(5221,147,908,18),(5222,147,909,19),(5223,147,920,20),(5224,147,921,21),(5225,147,922,22),(5226,147,923,23),(5227,147,924,24),(5228,147,925,25),(5229,147,926,26),(5230,147,927,27),(5231,147,928,28),(5232,147,907,29),(5233,147,908,30),(5234,147,909,31),(5235,147,929,32),(5236,147,930,33),(5237,147,904,34),(5238,147,931,35),(5239,147,128,36),(5240,147,928,37),(5241,147,603,38),(5242,147,916,39),(5243,147,917,40),(5244,147,932,41),(5245,147,933,42),(5246,147,934,43),(5247,147,935,44),(5248,147,936,45),(5249,147,87,46),(5250,147,928,47),(5251,147,937,48),(5252,147,938,49),(5253,147,917,50),(5254,147,19,51),(5255,147,939,52),(5256,147,53,53),(5257,147,928,54),(5258,147,907,55),(5259,147,910,56),(5260,147,940,57),(5261,147,19,58),(5262,147,903,59),(5263,147,603,60),(5264,147,941,61),(5265,147,146,62),(5266,147,942,63),(5267,147,905,64),(5268,147,543,65),(5269,147,52,66),(5270,147,902,67),(5271,147,904,68),(5272,147,943,69),(5273,147,944,70),(5274,147,905,71),(5275,147,945,72),(5276,147,904,73),(5277,147,19,74),(5278,147,939,75),(5279,147,931,76),(5280,147,946,77),(5281,147,928,78),(5282,147,907,79),(5283,147,908,80),(5284,147,909,81),(5285,147,217,82),(5286,147,947,83),(5287,147,904,84),(5288,147,906,85),(5289,147,410,86),(5290,147,908,87),(5291,147,814,88),(5292,147,370,89),(5395,153,948,0),(5396,153,949,1),(5397,154,115,0),(5398,154,950,1),(5399,154,183,2),(5400,154,951,3),(5401,154,952,4),(5402,154,953,5),(5403,155,954,0),(5404,155,503,1),(5405,155,955,2),(5406,155,127,3),(5407,155,956,4),(5408,155,957,5),(5409,155,503,6),(5410,155,958,7),(5411,155,959,8),(5412,155,955,9),(5413,155,960,10),(5414,155,961,11),(5415,155,962,12),(5416,155,963,13),(5417,155,964,14),(5418,155,965,15),(5419,155,417,16),(5420,155,966,17),(5421,155,888,18),(5422,155,967,19),(5423,155,968,20),(5424,155,969,21),(5425,155,332,22),(5426,155,808,23),(5427,155,960,24),(5428,155,970,25),(5429,155,965,26),(5430,155,971,27),(5431,155,850,28),(5432,155,972,29),(5433,155,744,30),(5434,155,955,31),(5435,155,973,32),(5436,155,964,33),(5437,155,965,34),(5438,155,417,35),(5439,155,94,36),(5440,155,52,37),(5441,157,115,0),(5442,157,950,1),(5443,157,183,2),(5444,157,951,3),(5445,157,974,4),(5460,161,975,0),(5461,161,976,1),(5462,162,977,0),(5463,162,978,1),(5464,162,978,2),(5465,165,175,0),(5466,165,338,1);
/*!40000 ALTER TABLE `submission_search_object_keywords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_search_objects`
--

DROP TABLE IF EXISTS `submission_search_objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submission_search_objects` (
  `object_id` bigint NOT NULL AUTO_INCREMENT,
  `submission_id` bigint NOT NULL,
  `type` int NOT NULL COMMENT 'Type of item. E.g., abstract, fulltext, etc.',
  `assoc_id` bigint DEFAULT NULL COMMENT 'Optional ID of an associated record (e.g., a file_id)',
  PRIMARY KEY (`object_id`),
  KEY `submission_search_objects_submission_id` (`submission_id`),
  CONSTRAINT `submission_search_object_submission` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8mb3 COMMENT='A list of all search objects indexed in the search index';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_search_objects`
--

LOCK TABLES `submission_search_objects` WRITE;
/*!40000 ALTER TABLE `submission_search_objects` DISABLE KEYS */;
INSERT INTO `submission_search_objects` VALUES (1,1,1,NULL),(2,1,2,NULL),(3,1,4,NULL),(4,1,16,NULL),(5,1,17,NULL),(6,1,8,NULL),(7,1,32,NULL),(8,1,64,NULL),(9,2,1,NULL),(10,2,2,NULL),(11,2,4,NULL),(12,2,16,NULL),(13,2,17,NULL),(14,2,8,NULL),(15,2,32,NULL),(16,2,64,NULL),(25,3,1,NULL),(26,3,2,NULL),(27,3,4,NULL),(28,3,16,NULL),(29,3,17,NULL),(30,3,8,NULL),(31,3,32,NULL),(32,3,64,NULL),(33,4,1,NULL),(34,4,2,NULL),(35,4,4,NULL),(36,4,16,NULL),(37,4,17,NULL),(38,4,8,NULL),(39,4,32,NULL),(40,4,64,NULL),(49,5,1,NULL),(50,5,2,NULL),(51,5,4,NULL),(52,5,16,NULL),(53,5,17,NULL),(54,5,8,NULL),(55,5,32,NULL),(56,5,64,NULL),(57,6,1,NULL),(58,6,2,NULL),(59,6,4,NULL),(60,6,16,NULL),(61,6,17,NULL),(62,6,8,NULL),(63,6,32,NULL),(64,6,64,NULL),(65,7,1,NULL),(66,7,2,NULL),(67,7,4,NULL),(68,7,16,NULL),(69,7,17,NULL),(70,7,8,NULL),(71,7,32,NULL),(72,7,64,NULL),(73,8,1,NULL),(74,8,2,NULL),(75,8,4,NULL),(76,8,16,NULL),(77,8,17,NULL),(78,8,8,NULL),(79,8,32,NULL),(80,8,64,NULL),(81,9,1,NULL),(82,9,2,NULL),(83,9,4,NULL),(84,9,16,NULL),(85,9,17,NULL),(86,9,8,NULL),(87,9,32,NULL),(88,9,64,NULL),(89,10,1,NULL),(90,10,2,NULL),(91,10,4,NULL),(92,10,16,NULL),(93,10,17,NULL),(94,10,8,NULL),(95,10,32,NULL),(96,10,64,NULL),(97,11,1,NULL),(98,11,2,NULL),(99,11,4,NULL),(100,11,16,NULL),(101,11,17,NULL),(102,11,8,NULL),(103,11,32,NULL),(104,11,64,NULL),(105,12,1,NULL),(106,12,2,NULL),(107,12,4,NULL),(108,12,16,NULL),(109,12,17,NULL),(110,12,8,NULL),(111,12,32,NULL),(112,12,64,NULL),(113,13,1,NULL),(114,13,2,NULL),(115,13,4,NULL),(116,13,16,NULL),(117,13,17,NULL),(118,13,8,NULL),(119,13,32,NULL),(120,13,64,NULL),(121,14,1,NULL),(122,14,2,NULL),(123,14,4,NULL),(124,14,16,NULL),(125,14,17,NULL),(126,14,8,NULL),(127,14,32,NULL),(128,14,64,NULL),(129,15,1,NULL),(130,15,2,NULL),(131,15,4,NULL),(132,15,16,NULL),(133,15,17,NULL),(134,15,8,NULL),(135,15,32,NULL),(136,15,64,NULL),(137,16,1,NULL),(138,16,2,NULL),(139,16,4,NULL),(140,16,16,NULL),(141,16,17,NULL),(142,16,8,NULL),(143,16,32,NULL),(144,16,64,NULL),(145,17,1,NULL),(146,17,2,NULL),(147,17,4,NULL),(148,17,16,NULL),(149,17,17,NULL),(150,17,8,NULL),(151,17,32,NULL),(152,17,64,NULL),(153,18,1,NULL),(154,18,2,NULL),(155,18,4,NULL),(156,18,16,NULL),(157,18,17,NULL),(158,18,8,NULL),(159,18,32,NULL),(160,18,64,NULL),(161,19,1,NULL),(162,19,2,NULL),(163,19,4,NULL),(164,19,16,NULL),(165,19,17,NULL),(166,19,8,NULL),(167,19,32,NULL),(168,19,64,NULL);
/*!40000 ALTER TABLE `submission_search_objects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_settings`
--

DROP TABLE IF EXISTS `submission_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submission_settings` (
  `submission_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `submission_id` bigint NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  PRIMARY KEY (`submission_setting_id`),
  UNIQUE KEY `submission_settings_unique` (`submission_id`,`locale`,`setting_name`),
  KEY `submission_settings_submission_id` (`submission_id`),
  CONSTRAINT `submission_settings_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Localized data about submissions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_settings`
--

LOCK TABLES `submission_settings` WRITE;
/*!40000 ALTER TABLE `submission_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `submission_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submissions`
--

DROP TABLE IF EXISTS `submissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submissions` (
  `submission_id` bigint NOT NULL AUTO_INCREMENT,
  `context_id` bigint NOT NULL,
  `current_publication_id` bigint DEFAULT NULL,
  `date_last_activity` datetime DEFAULT NULL,
  `date_submitted` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `stage_id` bigint NOT NULL DEFAULT '5',
  `locale` varchar(28) DEFAULT NULL,
  `status` smallint NOT NULL DEFAULT '1',
  `submission_progress` varchar(50) NOT NULL DEFAULT 'start',
  `work_type` smallint DEFAULT '0',
  PRIMARY KEY (`submission_id`),
  KEY `submissions_context_id` (`context_id`),
  KEY `submissions_current_publication_id` (`current_publication_id`),
  CONSTRAINT `submissions_context_id` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE,
  CONSTRAINT `submissions_current_publication_id` FOREIGN KEY (`current_publication_id`) REFERENCES `publications` (`publication_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3 COMMENT='All submissions submitted to the context, including incomplete, declined and unpublished submissions.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submissions`
--

LOCK TABLES `submissions` WRITE;
/*!40000 ALTER TABLE `submissions` DISABLE KEYS */;
INSERT INTO `submissions` VALUES (1,1,1,'2025-07-22 05:21:58','2025-07-22 05:21:58','2025-07-22 05:21:58',5,'en',1,'',0),(2,1,2,'2025-07-22 05:22:58','2025-07-22 05:22:52','2025-07-22 05:22:52',5,'en',3,'',0),(3,1,4,'2025-07-22 05:23:39','2025-07-22 05:23:17','2025-07-22 05:23:17',5,'en',3,'',0),(4,1,5,'2025-07-22 05:23:57','2025-07-22 05:23:57','2025-07-22 05:23:57',5,'en',4,'',0),(5,1,6,'2025-07-22 05:24:37','2025-07-22 05:24:26','2025-07-22 05:24:26',5,'en',3,'',0),(6,1,7,'2025-07-22 05:24:58','2025-07-22 05:24:54','2025-07-22 05:24:54',5,'en',3,'',0),(7,1,8,'2025-07-22 05:25:19','2025-07-22 05:25:16','2025-07-22 05:25:16',5,'en',3,'',0),(8,1,9,'2025-07-22 05:25:40','2025-07-22 05:25:37','2025-07-22 05:25:37',5,'en',3,'',0),(9,1,10,'2025-07-22 05:26:02','2025-07-22 05:25:58','2025-07-22 05:25:58',5,'en',3,'',0),(10,1,11,'2025-07-22 05:26:23','2025-07-22 05:26:19','2025-07-22 05:26:19',5,'en',3,'',0),(11,1,12,'2025-07-22 05:26:45','2025-07-22 05:26:41','2025-07-22 05:26:41',5,'en',3,'',0),(12,1,13,'2025-07-22 05:27:06','2025-07-22 05:27:03','2025-07-22 05:27:03',5,'en',3,'',0),(13,1,14,'2025-07-22 05:27:27','2025-07-22 05:27:24','2025-07-22 05:27:24',5,'en',3,'',0),(14,1,15,'2025-07-22 05:27:49','2025-07-22 05:27:45','2025-07-22 05:27:45',5,'en',3,'',0),(15,1,16,'2025-07-22 05:28:10','2025-07-22 05:28:06','2025-07-22 05:28:06',5,'en',3,'',0),(16,1,17,'2025-07-22 05:28:31','2025-07-22 05:28:27','2025-07-22 05:28:27',5,'en',3,'',0),(17,1,18,'2025-07-22 05:28:52','2025-07-22 05:28:49','2025-07-22 05:28:49',5,'en',3,'',0),(18,1,19,'2025-07-22 05:29:13','2025-07-22 05:29:10','2025-07-22 05:29:10',5,'en',3,'',0),(19,1,20,'2025-07-22 05:29:36','2025-07-22 05:29:32','2025-07-22 05:29:32',5,'en',3,'',0);
/*!40000 ALTER TABLE `submissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temporary_files`
--

DROP TABLE IF EXISTS `temporary_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `temporary_files` (
  `file_id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `file_name` varchar(90) NOT NULL,
  `file_type` varchar(255) DEFAULT NULL,
  `file_size` bigint NOT NULL,
  `original_file_name` varchar(127) DEFAULT NULL,
  `date_uploaded` datetime NOT NULL,
  PRIMARY KEY (`file_id`),
  KEY `temporary_files_user_id` (`user_id`),
  CONSTRAINT `temporary_files_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Temporary files, e.g. where files are kept during an upload process before they are moved somewhere more appropriate.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temporary_files`
--

LOCK TABLES `temporary_files` WRITE;
/*!40000 ALTER TABLE `temporary_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `temporary_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usage_stats_institution_temporary_records`
--

DROP TABLE IF EXISTS `usage_stats_institution_temporary_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usage_stats_institution_temporary_records` (
  `usage_stats_temp_institution_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `load_id` varchar(50) NOT NULL,
  `line_number` bigint NOT NULL,
  `institution_id` bigint NOT NULL,
  PRIMARY KEY (`usage_stats_temp_institution_id`),
  UNIQUE KEY `usitr_load_id_line_number_institution_id` (`load_id`,`line_number`,`institution_id`),
  KEY `usi_institution_id` (`institution_id`),
  CONSTRAINT `usi_institution_id_foreign` FOREIGN KEY (`institution_id`) REFERENCES `institutions` (`institution_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Temporary stats for views and downloads from institutions based on visitor log records. Data in this table is provisional. See the metrics_* tables for compiled stats.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usage_stats_institution_temporary_records`
--

LOCK TABLES `usage_stats_institution_temporary_records` WRITE;
/*!40000 ALTER TABLE `usage_stats_institution_temporary_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `usage_stats_institution_temporary_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usage_stats_total_temporary_records`
--

DROP TABLE IF EXISTS `usage_stats_total_temporary_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usage_stats_total_temporary_records` (
  `usage_stats_temp_total_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `ip` varchar(64) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `line_number` bigint NOT NULL,
  `canonical_url` varchar(255) NOT NULL,
  `context_id` bigint NOT NULL,
  `submission_id` bigint DEFAULT NULL,
  `representation_id` bigint DEFAULT NULL,
  `submission_file_id` bigint unsigned DEFAULT NULL,
  `assoc_type` bigint NOT NULL,
  `file_type` smallint DEFAULT NULL,
  `country` varchar(2) NOT NULL DEFAULT '',
  `region` varchar(3) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `load_id` varchar(50) NOT NULL,
  PRIMARY KEY (`usage_stats_temp_total_id`),
  KEY `ust_context_id` (`context_id`),
  KEY `ust_submission_id` (`submission_id`),
  KEY `ust_representation_id` (`representation_id`),
  KEY `ust_submission_file_id` (`submission_file_id`),
  KEY `ust_load_id_context_id_ip_ua_url` (`load_id`,`context_id`,`ip`,`user_agent`,`canonical_url`),
  CONSTRAINT `ust_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE,
  CONSTRAINT `ust_representation_id_foreign` FOREIGN KEY (`representation_id`) REFERENCES `publication_galleys` (`galley_id`) ON DELETE CASCADE,
  CONSTRAINT `ust_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE,
  CONSTRAINT `ust_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Temporary stats totals based on visitor log records. Data in this table is provisional. See the metrics_* tables for compiled stats.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usage_stats_total_temporary_records`
--

LOCK TABLES `usage_stats_total_temporary_records` WRITE;
/*!40000 ALTER TABLE `usage_stats_total_temporary_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `usage_stats_total_temporary_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usage_stats_unique_item_investigations_temporary_records`
--

DROP TABLE IF EXISTS `usage_stats_unique_item_investigations_temporary_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usage_stats_unique_item_investigations_temporary_records` (
  `usage_stats_temp_unique_item_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `ip` varchar(64) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `line_number` bigint NOT NULL,
  `context_id` bigint NOT NULL,
  `submission_id` bigint NOT NULL,
  `representation_id` bigint DEFAULT NULL,
  `submission_file_id` bigint unsigned DEFAULT NULL,
  `assoc_type` bigint NOT NULL,
  `file_type` smallint DEFAULT NULL,
  `country` varchar(2) NOT NULL DEFAULT '',
  `region` varchar(3) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `load_id` varchar(50) NOT NULL,
  PRIMARY KEY (`usage_stats_temp_unique_item_id`),
  KEY `usii_context_id` (`context_id`),
  KEY `usii_submission_id` (`submission_id`),
  KEY `usii_representation_id` (`representation_id`),
  KEY `usii_submission_file_id` (`submission_file_id`),
  KEY `usii_load_id_context_id_ip_ua` (`load_id`,`context_id`,`ip`,`user_agent`),
  CONSTRAINT `usii_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE,
  CONSTRAINT `usii_representation_id_foreign` FOREIGN KEY (`representation_id`) REFERENCES `publication_galleys` (`galley_id`) ON DELETE CASCADE,
  CONSTRAINT `usii_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE,
  CONSTRAINT `usii_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Temporary stats on unique downloads based on visitor log records. Data in this table is provisional. See the metrics_* tables for compiled stats.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usage_stats_unique_item_investigations_temporary_records`
--

LOCK TABLES `usage_stats_unique_item_investigations_temporary_records` WRITE;
/*!40000 ALTER TABLE `usage_stats_unique_item_investigations_temporary_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `usage_stats_unique_item_investigations_temporary_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usage_stats_unique_item_requests_temporary_records`
--

DROP TABLE IF EXISTS `usage_stats_unique_item_requests_temporary_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usage_stats_unique_item_requests_temporary_records` (
  `usage_stats_temp_item_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `ip` varchar(64) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `line_number` bigint NOT NULL,
  `context_id` bigint NOT NULL,
  `submission_id` bigint NOT NULL,
  `representation_id` bigint DEFAULT NULL,
  `submission_file_id` bigint unsigned DEFAULT NULL,
  `assoc_type` bigint NOT NULL,
  `file_type` smallint DEFAULT NULL,
  `country` varchar(2) NOT NULL DEFAULT '',
  `region` varchar(3) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `load_id` varchar(50) NOT NULL,
  PRIMARY KEY (`usage_stats_temp_item_id`),
  KEY `usir_context_id` (`context_id`),
  KEY `usir_submission_id` (`submission_id`),
  KEY `usir_representation_id` (`representation_id`),
  KEY `usir_submission_file_id` (`submission_file_id`),
  KEY `usir_load_id_context_id_ip_ua` (`load_id`,`context_id`,`ip`,`user_agent`),
  CONSTRAINT `usir_context_id_foreign` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE,
  CONSTRAINT `usir_representation_id_foreign` FOREIGN KEY (`representation_id`) REFERENCES `publication_galleys` (`galley_id`) ON DELETE CASCADE,
  CONSTRAINT `usir_submission_file_id_foreign` FOREIGN KEY (`submission_file_id`) REFERENCES `submission_files` (`submission_file_id`) ON DELETE CASCADE,
  CONSTRAINT `usir_submission_id_foreign` FOREIGN KEY (`submission_id`) REFERENCES `submissions` (`submission_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Temporary stats on unique views based on visitor log records. Data in this table is provisional. See the metrics_* tables for compiled stats.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usage_stats_unique_item_requests_temporary_records`
--

LOCK TABLES `usage_stats_unique_item_requests_temporary_records` WRITE;
/*!40000 ALTER TABLE `usage_stats_unique_item_requests_temporary_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `usage_stats_unique_item_requests_temporary_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group_settings`
--

DROP TABLE IF EXISTS `user_group_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_group_settings` (
  `user_group_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_group_id` bigint NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  PRIMARY KEY (`user_group_setting_id`),
  UNIQUE KEY `user_group_settings_unique` (`user_group_id`,`locale`,`setting_name`),
  KEY `user_group_settings_user_group_id` (`user_group_id`),
  CONSTRAINT `user_group_settings_user_group_id_foreign` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`user_group_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb3 COMMENT='More data about user groups, including localized properties such as the name.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group_settings`
--

LOCK TABLES `user_group_settings` WRITE;
/*!40000 ALTER TABLE `user_group_settings` DISABLE KEYS */;
INSERT INTO `user_group_settings` VALUES (1,2,'','nameLocaleKey','default.groups.name.manager'),(2,2,'','abbrevLocaleKey','default.groups.abbrev.manager'),(3,2,'en','name','Preprint Server manager'),(4,2,'en','abbrev','PSM'),(5,2,'fr_CA','name','##default.groups.name.manager##'),(6,2,'fr_CA','abbrev','##default.groups.abbrev.manager##'),(7,3,'','nameLocaleKey','default.groups.name.sectionEditor'),(8,3,'','abbrevLocaleKey','default.groups.abbrev.sectionEditor'),(9,3,'en','name','Moderator'),(10,3,'en','abbrev','MOD'),(11,3,'fr_CA','name','##default.groups.name.sectionEditor##'),(12,3,'fr_CA','abbrev','##default.groups.abbrev.sectionEditor##'),(13,4,'','nameLocaleKey','default.groups.name.author'),(14,4,'','abbrevLocaleKey','default.groups.abbrev.author'),(15,4,'en','name','Author'),(16,4,'en','abbrev','AU'),(17,4,'fr_CA','name','Auteur-e'),(18,4,'fr_CA','abbrev','AU'),(19,5,'','nameLocaleKey','default.groups.name.reader'),(20,5,'','abbrevLocaleKey','default.groups.abbrev.reader'),(21,5,'en','name','Reader'),(22,5,'en','abbrev','Read'),(23,5,'fr_CA','name','Lecteur-trice'),(24,5,'fr_CA','abbrev','Lect'),(25,6,'','nameLocaleKey','default.groups.name.editorialBoardMember'),(26,6,'','abbrevLocaleKey','default.groups.abbrev.editorialBoardMember'),(27,6,'en','name','Editorial Board Member'),(28,6,'en','abbrev','EBM'),(29,6,'fr_CA','name','##default.groups.name.editorialBoardMember##'),(30,6,'fr_CA','abbrev','##default.groups.abbrev.editorialBoardMember##');
/*!40000 ALTER TABLE `user_group_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group_stage`
--

DROP TABLE IF EXISTS `user_group_stage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_group_stage` (
  `user_group_stage_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `context_id` bigint NOT NULL,
  `user_group_id` bigint NOT NULL,
  `stage_id` bigint NOT NULL,
  PRIMARY KEY (`user_group_stage_id`),
  UNIQUE KEY `user_group_stage_unique` (`context_id`,`user_group_id`,`stage_id`),
  KEY `user_group_stage_context_id` (`context_id`),
  KEY `user_group_stage_user_group_id` (`user_group_id`),
  KEY `user_group_stage_stage_id` (`stage_id`),
  CONSTRAINT `user_group_stage_context_id` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE,
  CONSTRAINT `user_group_stage_user_group_id` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`user_group_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='Which stages of the editorial workflow the user_groups can access.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group_stage`
--

LOCK TABLES `user_group_stage` WRITE;
/*!40000 ALTER TABLE `user_group_stage` DISABLE KEYS */;
INSERT INTO `user_group_stage` VALUES (1,1,2,5),(2,1,3,5),(3,1,4,5);
/*!40000 ALTER TABLE `user_group_stage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_groups`
--

DROP TABLE IF EXISTS `user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_groups` (
  `user_group_id` bigint NOT NULL AUTO_INCREMENT,
  `context_id` bigint DEFAULT NULL,
  `role_id` bigint NOT NULL,
  `is_default` smallint NOT NULL DEFAULT '0',
  `show_title` smallint NOT NULL DEFAULT '1',
  `permit_self_registration` smallint NOT NULL DEFAULT '0',
  `permit_metadata_edit` smallint NOT NULL DEFAULT '0',
  `permit_settings` smallint NOT NULL DEFAULT '0',
  `masthead` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_group_id`),
  KEY `user_groups_context_id` (`context_id`),
  KEY `user_groups_user_group_id` (`user_group_id`),
  KEY `user_groups_role_id` (`role_id`),
  CONSTRAINT `user_groups_context_id` FOREIGN KEY (`context_id`) REFERENCES `servers` (`server_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COMMENT='All defined user roles in a context, such as Author, Reviewer, Section Editor and Journal Manager.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_groups`
--

LOCK TABLES `user_groups` WRITE;
/*!40000 ALTER TABLE `user_groups` DISABLE KEYS */;
INSERT INTO `user_groups` VALUES (1,NULL,1,1,1,0,0,1,0),(2,1,16,1,1,0,1,1,0),(3,1,17,1,1,0,1,0,1),(4,1,65536,1,1,1,1,0,0),(5,1,1048576,1,1,1,0,0,0),(6,1,4097,1,1,0,0,0,1);
/*!40000 ALTER TABLE `user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_interests`
--

DROP TABLE IF EXISTS `user_interests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_interests` (
  `user_interest_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `controlled_vocab_entry_id` bigint NOT NULL,
  PRIMARY KEY (`user_interest_id`),
  UNIQUE KEY `u_e_pkey` (`user_id`,`controlled_vocab_entry_id`),
  KEY `user_interests_user_id` (`user_id`),
  KEY `user_interests_controlled_vocab_entry_id` (`controlled_vocab_entry_id`),
  CONSTRAINT `user_interests_controlled_vocab_entry_id_foreign` FOREIGN KEY (`controlled_vocab_entry_id`) REFERENCES `controlled_vocab_entries` (`controlled_vocab_entry_id`) ON DELETE CASCADE,
  CONSTRAINT `user_interests_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Associates users with user interests (which are stored in the controlled vocabulary tables).';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_interests`
--

LOCK TABLES `user_interests` WRITE;
/*!40000 ALTER TABLE `user_interests` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_interests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_settings`
--

DROP TABLE IF EXISTS `user_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_settings` (
  `user_setting_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `locale` varchar(28) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` mediumtext,
  PRIMARY KEY (`user_setting_id`),
  UNIQUE KEY `user_settings_unique` (`user_id`,`locale`,`setting_name`),
  KEY `user_settings_user_id` (`user_id`),
  KEY `user_settings_locale_setting_name_index` (`setting_name`,`locale`),
  CONSTRAINT `user_settings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb3 COMMENT='More data about users, including localized properties like their name and affiliation.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_settings`
--

LOCK TABLES `user_settings` WRITE;
/*!40000 ALTER TABLE `user_settings` DISABLE KEYS */;
INSERT INTO `user_settings` VALUES (1,1,'en','familyName','admin'),(2,1,'en','givenName','admin'),(3,2,'en','affiliation','Universidad Nacional Autónoma de México'),(4,2,'fr_CA','affiliation','Mexico'),(5,2,'en','familyName','Vaca'),(6,2,'fr_CA','familyName','Vaca'),(7,2,'en','givenName','Ramiro'),(8,2,'fr_CA','givenName','Ramiro'),(9,3,'en','affiliation','University of Melbourne'),(10,3,'fr_CA','affiliation','Australia'),(11,3,'en','familyName','Barnes'),(12,3,'fr_CA','familyName','Barnes'),(13,3,'en','givenName','Daniel'),(14,3,'fr_CA','givenName','Daniel'),(15,4,'en','affiliation','University of Chicago'),(16,4,'fr_CA','affiliation','United States'),(17,4,'en','familyName','Buskins'),(18,4,'fr_CA','familyName','Buskins'),(19,4,'en','givenName','David'),(20,4,'fr_CA','givenName','David'),(21,5,'en','affiliation','University of Toronto'),(22,5,'fr_CA','affiliation','Canada'),(23,5,'en','familyName','Berardo'),(24,5,'fr_CA','familyName','Berardo'),(25,5,'en','givenName','Stephanie'),(26,5,'fr_CA','givenName','Stephanie'),(27,6,'en','affiliation','Kyoto University'),(28,6,'fr_CA','affiliation','Japan'),(29,6,'en','familyName','Inoue'),(30,6,'fr_CA','familyName','Inoue'),(31,6,'en','givenName','Minoti'),(32,6,'fr_CA','givenName','Minoti'),(33,7,'en','affiliation','University of Bologna'),(34,7,'en','familyName','Corino'),(35,7,'en','givenName','Carlo'),(36,8,'en','affiliation','University of Windsor'),(37,8,'en','familyName','Kwantes'),(38,8,'en','givenName','Catherine'),(39,9,'en','affiliation','University of Alberta'),(40,9,'en','familyName','Montgomerie'),(41,9,'en','givenName','Craig'),(42,10,'en','affiliation','Alexandria University'),(43,10,'en','familyName','Diouf'),(44,10,'en','givenName','Diaga'),(45,11,'en','affiliation','University of Toronto'),(46,11,'en','familyName','Phillips'),(47,11,'en','givenName','Dana'),(48,12,'en','affiliation','University College Cork'),(49,12,'en','familyName','Sokoloff'),(50,12,'en','givenName','Domatilia'),(51,13,'en','affiliation','Indiana University'),(52,13,'en','familyName','Ostrom'),(53,13,'en','givenName','Elinor'),(54,14,'en','affiliation','University of Rome'),(55,14,'en','familyName','Paglieri'),(56,14,'en','givenName','Fabio'),(57,15,'en','affiliation','University of Cape Town'),(58,15,'en','familyName','Mwandenga'),(59,15,'en','givenName','John'),(60,16,'en','affiliation','Aalborg University'),(61,16,'en','familyName','Novak'),(62,16,'en','givenName','John'),(63,17,'en','affiliation','Stanford University'),(64,17,'en','familyName','Al-Khafaji'),(65,17,'en','givenName','Karim'),(66,18,'en','affiliation','Australian National University'),(67,18,'en','familyName','Christopher'),(68,18,'en','givenName','Leo'),(69,19,'en','affiliation','University of Cape Town'),(70,19,'en','familyName','Kumiega'),(71,19,'en','givenName','Lise'),(72,20,'en','affiliation','University of Wolverhampton'),(73,20,'en','familyName','Daniel'),(74,20,'en','givenName','Patricia'),(75,21,'en','affiliation','University of Nairobi'),(76,21,'en','familyName','Baiyewu'),(77,21,'en','givenName','Rana'),(78,22,'en','affiliation','Barcelona University'),(79,22,'en','familyName','Rossi'),(80,22,'en','givenName','Rosanna'),(81,23,'en','affiliation','University of Tehran'),(82,23,'en','familyName','Karbasizaed'),(83,23,'en','givenName','Vajiheh'),(84,24,'en','affiliation','University of Windsor'),(85,24,'en','familyName','Williamson'),(86,24,'en','givenName','Valerie'),(87,25,'en','affiliation','CUNY'),(88,25,'en','familyName','Woods'),(89,25,'en','givenName','Zita');
/*!40000 ALTER TABLE `user_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_user_groups`
--

DROP TABLE IF EXISTS `user_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_user_groups` (
  `user_user_group_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_group_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `masthead` smallint DEFAULT NULL,
  PRIMARY KEY (`user_user_group_id`),
  KEY `user_user_groups_user_group_id` (`user_group_id`),
  KEY `user_user_groups_user_id` (`user_id`),
  CONSTRAINT `user_user_groups_user_group_id_foreign` FOREIGN KEY (`user_group_id`) REFERENCES `user_groups` (`user_group_id`) ON DELETE CASCADE,
  CONSTRAINT `user_user_groups_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb3 COMMENT='Maps users to their assigned user_groups.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_user_groups`
--

LOCK TABLES `user_user_groups` WRITE;
/*!40000 ALTER TABLE `user_user_groups` DISABLE KEYS */;
INSERT INTO `user_user_groups` VALUES (1,1,1,'2025-07-22 05:19:05',NULL,NULL),(2,2,1,NULL,NULL,NULL),(3,2,2,'2025-07-22 00:00:00',NULL,1),(4,2,3,'2025-07-22 00:00:00',NULL,1),(5,3,4,'2025-07-22 00:00:00',NULL,1),(6,3,5,'2025-07-22 00:00:00',NULL,1),(7,3,6,'2025-07-22 00:00:00',NULL,1),(8,5,7,'2025-07-22 05:21:44',NULL,NULL),(9,4,7,'2025-07-22 05:21:45',NULL,NULL),(10,5,8,'2025-07-22 05:22:02',NULL,NULL),(11,4,8,'2025-07-22 05:22:02',NULL,NULL),(12,5,9,'2025-07-22 05:23:02',NULL,NULL),(13,4,9,'2025-07-22 05:23:04',NULL,NULL),(14,5,10,'2025-07-22 05:23:43',NULL,NULL),(15,4,10,'2025-07-22 05:23:44',NULL,NULL),(16,5,11,'2025-07-22 05:24:13',NULL,NULL),(17,4,11,'2025-07-22 05:24:14',NULL,NULL),(18,5,12,'2025-07-22 05:24:41',NULL,NULL),(19,4,12,'2025-07-22 05:24:42',NULL,NULL),(20,5,13,'2025-07-22 05:25:02',NULL,NULL),(21,4,13,'2025-07-22 05:25:03',NULL,NULL),(22,5,14,'2025-07-22 05:25:23',NULL,NULL),(23,4,14,'2025-07-22 05:25:25',NULL,NULL),(24,5,15,'2025-07-22 05:25:44',NULL,NULL),(25,4,15,'2025-07-22 05:25:46',NULL,NULL),(26,5,16,'2025-07-22 05:26:06',NULL,NULL),(27,4,16,'2025-07-22 05:26:07',NULL,NULL),(28,5,17,'2025-07-22 05:26:27',NULL,NULL),(29,4,17,'2025-07-22 05:26:28',NULL,NULL),(30,5,18,'2025-07-22 05:26:49',NULL,NULL),(31,4,18,'2025-07-22 05:26:50',NULL,NULL),(32,5,19,'2025-07-22 05:27:10',NULL,NULL),(33,4,19,'2025-07-22 05:27:12',NULL,NULL),(34,5,20,'2025-07-22 05:27:31',NULL,NULL),(35,4,20,'2025-07-22 05:27:33',NULL,NULL),(36,5,21,'2025-07-22 05:27:53',NULL,NULL),(37,4,21,'2025-07-22 05:27:54',NULL,NULL),(38,5,22,'2025-07-22 05:28:14',NULL,NULL),(39,4,22,'2025-07-22 05:28:15',NULL,NULL),(40,5,23,'2025-07-22 05:28:35',NULL,NULL),(41,4,23,'2025-07-22 05:28:36',NULL,NULL),(42,5,24,'2025-07-22 05:28:56',NULL,NULL),(43,4,24,'2025-07-22 05:28:57',NULL,NULL),(44,5,25,'2025-07-22 05:29:19',NULL,NULL),(45,4,25,'2025-07-22 05:29:20',NULL,NULL);
/*!40000 ALTER TABLE `user_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `url` varchar(2047) DEFAULT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `mailing_address` varchar(255) DEFAULT NULL,
  `billing_address` varchar(255) DEFAULT NULL,
  `country` varchar(90) DEFAULT NULL,
  `locales` varchar(255) NOT NULL DEFAULT '[]',
  `gossip` text,
  `date_last_email` datetime DEFAULT NULL,
  `date_registered` datetime NOT NULL,
  `date_validated` datetime DEFAULT NULL,
  `date_last_login` datetime DEFAULT NULL,
  `must_change_password` smallint DEFAULT NULL,
  `auth_id` bigint DEFAULT NULL,
  `auth_str` varchar(255) DEFAULT NULL,
  `disabled` smallint NOT NULL DEFAULT '0',
  `disabled_reason` text,
  `inline_help` smallint DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `users_username` (`username`),
  UNIQUE KEY `users_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3 COMMENT='All registered users, including authentication data and profile data.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','$2y$10$3mheWlWJEA4tbIA3Jif5ZeCj.6W81lWdCuM7/wWEX.epiD.lqvcgi','pkpadmin@mailinator.com',NULL,NULL,NULL,NULL,NULL,'[]',NULL,NULL,'2025-07-22 05:19:05',NULL,'2025-07-22 05:21:21',NULL,NULL,NULL,0,NULL,1,NULL),(2,'rvaca','$2y$10$wHqRLFm8x7QHKBXd9TaQQemopQWIfM.5glebEHrbkEPJaST2Uldq6','rvaca@mailinator.com',NULL,NULL,NULL,NULL,'MX','[]',NULL,NULL,'2025-07-22 05:20:04',NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL),(3,'dbarnes','$2y$10$aZR3oVeJqeDXdTNlhFIUEe7556Nsvy9dV92B527nlGT3JnqxzrPoi','dbarnes@mailinator.com',NULL,NULL,NULL,NULL,'AU','[]',NULL,NULL,'2025-07-22 05:20:20',NULL,'2025-07-22 05:29:33',NULL,NULL,NULL,0,NULL,1,NULL),(4,'dbuskins','$2y$10$OdnNrF4qDR/smADBcsS3B.NVVECY0LjKJKY8bye/G/yiA.8qGx7DW','dbuskins@mailinator.com',NULL,NULL,NULL,NULL,'US','[]',NULL,NULL,'2025-07-22 05:20:36',NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL),(5,'sberardo','$2y$10$HfTGDJYnNRaE2KDNCFczeOKQ2rgF51gW/1xZVvSvcmK2blktfOwOG','sberardo@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2025-07-22 05:20:54',NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL),(6,'minoue','$2y$10$JBnrZB5cfotIAzZZkFze7uWf9efLvxPXUrNM4RPgfNidU4KL2AXUG','minoue@mailinator.com',NULL,NULL,NULL,NULL,'JP','[]',NULL,NULL,'2025-07-22 05:21:12',NULL,NULL,NULL,NULL,NULL,0,NULL,1,NULL),(7,'ccorino','$2y$10$.YLn6h4as5o13nU4cLYt.O3CxpmzvcRQMF298uirQ4WqU.9rSFaka','ccorino@mailinator.com',NULL,NULL,NULL,NULL,'IT','[]',NULL,NULL,'2025-07-22 05:21:44',NULL,'2025-07-22 05:21:44',NULL,NULL,NULL,0,NULL,1,NULL),(8,'ckwantes','$2y$10$nnQAPCjR.I2BjE3RQFDgsOjywzWK/RIpHqt0TL95v23xAIfEH3YjW','ckwantes@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2025-07-22 05:22:02',NULL,'2025-07-22 05:22:02',NULL,NULL,NULL,0,NULL,1,NULL),(9,'cmontgomerie','$2y$10$FFvxK1xcR7ig1JiN.VyEgOOUrNhuEj8slHQGy5GqOPcKyy8nXZZwO','cmontgomerie@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2025-07-22 05:23:02',NULL,'2025-07-22 05:23:02',NULL,NULL,NULL,0,NULL,1,NULL),(10,'ddiouf','$2y$10$Cz.h139Gd9fTTiOmMMULFuS2a8ZX7CgkLpIRNRx.WkaoF432xVsU.','ddiouf@mailinator.com',NULL,NULL,NULL,NULL,'EG','[]',NULL,NULL,'2025-07-22 05:23:43',NULL,'2025-07-22 05:23:43',NULL,NULL,NULL,0,NULL,1,NULL),(11,'dphillips','$2y$10$pojdQPUbj/L7i3eSHHujhOWMYDBa2SjIA0MjmJ91ztpGsHCT0GePO','dphillips@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2025-07-22 05:24:13',NULL,'2025-07-22 05:24:13',NULL,NULL,NULL,0,NULL,1,NULL),(12,'dsokoloff','$2y$10$yBP7DZAg4.pTagTpFmKVTelXKQzUa/MhRLJsZBPsHsld0jdNX6.ce','dsokoloff@mailinator.com',NULL,NULL,NULL,NULL,'IE','[]',NULL,NULL,'2025-07-22 05:24:41',NULL,'2025-07-22 05:24:41',NULL,NULL,NULL,0,NULL,1,NULL),(13,'eostrom','$2y$10$SWBLXGaPtOyattJM6ijQj.FL2rikrKjz2oXlsYMuHRuOEzF60z55O','eostrom@mailinator.com',NULL,NULL,NULL,NULL,'US','[]',NULL,NULL,'2025-07-22 05:25:02',NULL,'2025-07-22 05:25:02',NULL,NULL,NULL,0,NULL,1,NULL),(14,'fpaglieri','$2y$10$i5ktz3Q3CixQHFiBmpIXQOZbouJrIz7U.wCyQd60e1uK/mXeeAhqy','fpaglieri@mailinator.com',NULL,NULL,NULL,NULL,'IT','[]',NULL,NULL,'2025-07-22 05:25:23',NULL,'2025-07-22 05:25:24',NULL,NULL,NULL,0,NULL,1,NULL),(15,'jmwandenga','$2y$10$F.voDiMSIKnWkRzLm998LOadA2frYJaXwkXw8zsOqJuzMC6YzSR0y','jmwandenga@mailinator.com',NULL,NULL,NULL,NULL,'ZA','[]',NULL,NULL,'2025-07-22 05:25:44',NULL,'2025-07-22 05:25:45',NULL,NULL,NULL,0,NULL,1,NULL),(16,'jnovak','$2y$10$.K9Zvkiu704AGR3EfhrDj.EFqCOBpsdIhgtmFjb0b/Pd.IVWSet3a','jnovak@mailinator.com',NULL,NULL,NULL,NULL,'DK','[]',NULL,NULL,'2025-07-22 05:26:05',NULL,'2025-07-22 05:26:06',NULL,NULL,NULL,0,NULL,1,NULL),(17,'kalkhafaji','$2y$10$lqMjKIi2g42UlGni1Dr3J.D42BjZ.4vyl1HV9JYXr2jmTEBJlIYhy','kalkhafaji@mailinator.com',NULL,NULL,NULL,NULL,'US','[]',NULL,NULL,'2025-07-22 05:26:27',NULL,'2025-07-22 05:26:27',NULL,NULL,NULL,0,NULL,1,NULL),(18,'lchristopher','$2y$10$Fyea2QEIhXEGhHZpFP.aZOT75W3YZpQulGsDb7nMvtV65hH9rCDsu','lchristopher@mailinator.com',NULL,NULL,NULL,NULL,'AU','[]',NULL,NULL,'2025-07-22 05:26:49',NULL,'2025-07-22 05:26:49',NULL,NULL,NULL,0,NULL,1,NULL),(19,'lkumiega','$2y$10$lM7BmbljJdlc9iM741Z67eIf5sHPcssvYw8k7nQGjLEr06V2VKW0y','lkumiega@mailinator.com',NULL,NULL,NULL,NULL,'ZA','[]',NULL,NULL,'2025-07-22 05:27:10',NULL,'2025-07-22 05:27:10',NULL,NULL,NULL,0,NULL,1,NULL),(20,'pdaniel','$2y$10$aVYrtCcWCGSGpi6Md0hNbuv8y0Ke2X.KT5PzqjwIjRUzp6s2nDJFO','pdaniel@mailinator.com',NULL,NULL,NULL,NULL,'GB','[]',NULL,NULL,'2025-07-22 05:27:31',NULL,'2025-07-22 05:27:31',NULL,NULL,NULL,0,NULL,1,NULL),(21,'rbaiyewu','$2y$10$3fiEf4ZZbkVBlUdrgCOKNe0lA5TFQ6Lc97SW4TB0yq8cpW797WEq6','rbaiyewu@mailinator.com',NULL,NULL,NULL,NULL,'KE','[]',NULL,NULL,'2025-07-22 05:27:53',NULL,'2025-07-22 05:27:53',NULL,NULL,NULL,0,NULL,1,NULL),(22,'rrossi','$2y$10$EvbNUQPEeO0yPQl9HnjrTeiGcXBi3K3aJhtycdMssPNtZz0LMUlrK','rrossi@mailinator.com',NULL,NULL,NULL,NULL,'ES','[]',NULL,NULL,'2025-07-22 05:28:14',NULL,'2025-07-22 05:28:14',NULL,NULL,NULL,0,NULL,1,NULL),(23,'vkarbasizaed','$2y$10$hgkjpBizeZgStmMAz3GfFOae2W/yYWlVDYn5HZTVm1LWxHeF8.6Fy','vkarbasizaed@mailinator.com',NULL,NULL,NULL,NULL,'IR','[]',NULL,NULL,'2025-07-22 05:28:35',NULL,'2025-07-22 05:28:35',NULL,NULL,NULL,0,NULL,1,NULL),(24,'vwilliamson','$2y$10$I51fHjgEL1kJk4qqOf54gusA4FkdxsFMSMPb.bKcYcF/KSLh55c6m','vwilliamson@mailinator.com',NULL,NULL,NULL,NULL,'CA','[]',NULL,NULL,'2025-07-22 05:28:56',NULL,'2025-07-22 05:28:56',NULL,NULL,NULL,0,NULL,1,NULL),(25,'zwoods','$2y$10$dFsmeHoxtVeRCVNy0mQ5Yuiicr.S/fgKFUo/7baBlq/TQmfKDe0CG','zwoods@mailinator.com',NULL,NULL,NULL,NULL,'US','[]',NULL,NULL,'2025-07-22 05:29:19',NULL,'2025-07-22 05:29:19',NULL,NULL,NULL,0,NULL,1,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `versions`
--

DROP TABLE IF EXISTS `versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `versions` (
  `version_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `major` int NOT NULL DEFAULT '0' COMMENT 'Major component of version number, e.g. the 2 in OJS 2.3.8-0',
  `minor` int NOT NULL DEFAULT '0' COMMENT 'Minor component of version number, e.g. the 3 in OJS 2.3.8-0',
  `revision` int NOT NULL DEFAULT '0' COMMENT 'Revision component of version number, e.g. the 8 in OJS 2.3.8-0',
  `build` int NOT NULL DEFAULT '0' COMMENT 'Build component of version number, e.g. the 0 in OJS 2.3.8-0',
  `date_installed` datetime NOT NULL,
  `current` smallint NOT NULL DEFAULT '0' COMMENT '1 iff the version entry being described is currently active. This permits the table to store past installation history for forensic purposes.',
  `product_type` varchar(30) DEFAULT NULL COMMENT 'Describes the type of product this row describes, e.g. "plugins.generic" (for a generic plugin) or "core" for the application itself',
  `product` varchar(30) DEFAULT NULL COMMENT 'Uniquely identifies the product this version row describes, e.g. "ojs2" for OJS 2.x, "languageToggle" for the language toggle block plugin, etc.',
  `product_class_name` varchar(80) DEFAULT NULL COMMENT 'Specifies the class name associated with this product, for plugins, or the empty string where not applicable.',
  `lazy_load` smallint NOT NULL DEFAULT '0' COMMENT '1 iff the row describes a lazy-load plugin; 0 otherwise',
  `sitewide` smallint NOT NULL DEFAULT '0' COMMENT '1 iff the row describes a site-wide plugin; 0 otherwise',
  PRIMARY KEY (`version_id`),
  UNIQUE KEY `versions_unique` (`product_type`,`product`,`major`,`minor`,`revision`,`build`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3 COMMENT='Describes the installation and upgrade version history for the application and all installed plugins.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `versions`
--

LOCK TABLES `versions` WRITE;
/*!40000 ALTER TABLE `versions` DISABLE KEYS */;
INSERT INTO `versions` VALUES (1,1,0,0,0,'2025-07-22 05:19:06',1,'plugins.metadata','dc11','',0,0),(2,1,0,0,0,'2025-07-22 05:19:06',1,'plugins.blocks','languageToggle','LanguageToggleBlockPlugin',1,0),(3,1,0,1,0,'2025-07-22 05:19:06',1,'plugins.blocks','browse','BrowseBlockPlugin',1,0),(4,1,0,0,0,'2025-07-22 05:19:06',1,'plugins.blocks','developedBy','DevelopedByBlockPlugin',1,0),(5,2,2,0,0,'2025-07-22 05:19:06',1,'plugins.generic','crossref','',0,0),(6,1,0,0,0,'2025-07-22 05:19:06',1,'plugins.generic','usageEvent','',0,0),(7,1,0,1,0,'2025-07-22 05:19:06',1,'plugins.generic','pdfJsViewer','PdfJsViewerPlugin',1,0),(8,0,1,0,0,'2025-07-22 05:19:06',1,'plugins.generic','citationStyleLanguage','CitationStyleLanguagePlugin',1,0),(9,1,2,0,0,'2025-07-22 05:19:06',1,'plugins.generic','customBlockManager','CustomBlockManagerPlugin',1,0),(10,1,0,0,0,'2025-07-22 05:19:06',1,'plugins.generic','tinymce','TinyMCEPlugin',1,0),(11,1,0,0,0,'2025-07-22 05:19:06',1,'plugins.generic','googleAnalytics','GoogleAnalyticsPlugin',1,0),(12,1,0,0,0,'2025-07-22 05:19:06',1,'plugins.generic','webFeed','WebFeedPlugin',1,0),(13,1,1,0,0,'2025-07-22 05:19:06',1,'plugins.generic','googleScholar','GoogleScholarPlugin',1,0),(14,1,0,0,0,'2025-07-22 05:19:06',1,'plugins.importexport','native','',0,0),(15,1,0,0,0,'2025-07-22 05:19:06',1,'plugins.oaiMetadataFormats','dc','',0,0),(16,1,0,0,0,'2025-07-22 05:19:06',1,'plugins.themes','default','DefaultThemePlugin',1,0),(17,3,5,0,1,'2025-07-22 05:18:59',1,'core','ops','',0,1);
/*!40000 ALTER TABLE `versions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-22  5:29:37
