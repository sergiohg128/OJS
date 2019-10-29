-- MySQL dump 10.13  Distrib 5.7.27, for Linux (x86_64)
--
-- Host: localhost    Database: ojs3
-- ------------------------------------------------------
-- Server version	5.7.27-0ubuntu0.16.04.1

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
-- Table structure for table `access_keys`
--

DROP TABLE IF EXISTS `access_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `access_keys` (
  `access_key_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context` varchar(40) NOT NULL,
  `key_hash` varchar(40) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  `expiry_date` datetime NOT NULL,
  PRIMARY KEY (`access_key_id`),
  KEY `access_keys_hash` (`key_hash`,`user_id`,`context`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access_keys`
--

LOCK TABLES `access_keys` WRITE;
/*!40000 ALTER TABLE `access_keys` DISABLE KEYS */;
/*!40000 ALTER TABLE `access_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcement_settings`
--

DROP TABLE IF EXISTS `announcement_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcement_settings` (
  `announcement_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `announcement_settings_pkey` (`announcement_id`,`locale`,`setting_name`),
  KEY `announcement_settings_announcement_id` (`announcement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcement_type_settings` (
  `type_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `announcement_type_settings_pkey` (`type_id`,`locale`,`setting_name`),
  KEY `announcement_type_settings_type_id` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcement_types` (
  `type_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` smallint(6) DEFAULT NULL,
  `assoc_id` bigint(20) NOT NULL,
  PRIMARY KEY (`type_id`),
  KEY `announcement_types_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcements` (
  `announcement_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` smallint(6) DEFAULT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `type_id` bigint(20) DEFAULT NULL,
  `date_expire` datetime DEFAULT NULL,
  `date_posted` datetime NOT NULL,
  PRIMARY KEY (`announcement_id`),
  KEY `announcements_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_sources`
--

DROP TABLE IF EXISTS `auth_sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_sources` (
  `auth_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(60) NOT NULL,
  `plugin` varchar(32) NOT NULL,
  `auth_default` tinyint(4) NOT NULL DEFAULT '0',
  `settings` text,
  PRIMARY KEY (`auth_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_sources`
--

LOCK TABLES `auth_sources` WRITE;
/*!40000 ALTER TABLE `auth_sources` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_sources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `author_settings`
--

DROP TABLE IF EXISTS `author_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `author_settings` (
  `author_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `author_settings_pkey` (`author_id`,`locale`,`setting_name`),
  KEY `author_settings_author_id` (`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author_settings`
--

LOCK TABLES `author_settings` WRITE;
/*!40000 ALTER TABLE `author_settings` DISABLE KEYS */;
INSERT INTO `author_settings` VALUES (2,'','orcid','','string'),(2,'es_ES','affiliation','Universidad Nacional Pedro Ruiz Gallo','string'),(2,'es_ES','biography','','string'),(2,'es_ES','familyName','Zuñe Da Silva','string'),(2,'es_ES','givenName','Luis','string'),(2,'es_ES','preferredPublicName','','string');
/*!40000 ALTER TABLE `author_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authors` (
  `author_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `primary_contact` tinyint(4) NOT NULL DEFAULT '0',
  `seq` double NOT NULL DEFAULT '0',
  `country` varchar(90) DEFAULT NULL,
  `email` varchar(90) NOT NULL,
  `url` varchar(2047) DEFAULT NULL,
  `user_group_id` bigint(20) DEFAULT NULL,
  `include_in_browse` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`author_id`),
  KEY `authors_submission_id` (`submission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES (2,1,0,1,'PE','lfelipezd15@hotmail.com','',65,1);
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `category_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `parent_id` bigint(20) NOT NULL,
  `seq` bigint(20) DEFAULT NULL,
  `path` varchar(255) NOT NULL,
  `image` text,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_path` (`context_id`,`path`),
  KEY `category_context_id` (`context_id`,`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_settings`
--

DROP TABLE IF EXISTS `category_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_settings` (
  `category_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `category_settings_pkey` (`category_id`,`locale`,`setting_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_settings`
--

LOCK TABLES `category_settings` WRITE;
/*!40000 ALTER TABLE `category_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `category_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `citation_settings`
--

DROP TABLE IF EXISTS `citation_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `citation_settings` (
  `citation_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `citation_settings_pkey` (`citation_id`,`locale`,`setting_name`),
  KEY `citation_settings_citation_id` (`citation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `citations` (
  `citation_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL DEFAULT '0',
  `raw_citation` text,
  `seq` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`citation_id`),
  UNIQUE KEY `citations_submission_seq` (`submission_id`,`seq`),
  KEY `citations_submission` (`submission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citations`
--

LOCK TABLES `citations` WRITE;
/*!40000 ALTER TABLE `citations` DISABLE KEYS */;
/*!40000 ALTER TABLE `citations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `completed_payments`
--

DROP TABLE IF EXISTS `completed_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `completed_payments` (
  `completed_payment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `timestamp` datetime NOT NULL,
  `payment_type` bigint(20) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  `amount` double NOT NULL,
  `currency_code_alpha` varchar(3) DEFAULT NULL,
  `payment_method_plugin_name` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`completed_payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `completed_payments`
--

LOCK TABLES `completed_payments` WRITE;
/*!40000 ALTER TABLE `completed_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `completed_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `controlled_vocab_entries`
--

DROP TABLE IF EXISTS `controlled_vocab_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `controlled_vocab_entries` (
  `controlled_vocab_entry_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `controlled_vocab_id` bigint(20) NOT NULL,
  `seq` double DEFAULT NULL,
  PRIMARY KEY (`controlled_vocab_entry_id`),
  KEY `controlled_vocab_entries_cv_id` (`controlled_vocab_id`,`seq`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controlled_vocab_entries`
--

LOCK TABLES `controlled_vocab_entries` WRITE;
/*!40000 ALTER TABLE `controlled_vocab_entries` DISABLE KEYS */;
INSERT INTO `controlled_vocab_entries` VALUES (1,1,1),(2,1,2),(3,1,3),(4,2,1),(5,2,2),(6,2,3),(7,2,4),(8,2,5),(9,2,6),(10,2,7),(11,3,1),(12,3,2),(13,3,3),(14,4,1),(15,4,2),(16,4,3),(17,4,4),(18,4,5),(19,4,6),(20,4,7),(21,4,8),(22,4,9),(23,4,10),(24,4,11),(25,4,12),(26,5,1),(27,5,2),(28,6,1),(29,6,2),(30,6,3),(31,6,4),(32,6,5),(33,6,6),(34,6,7),(35,7,1),(36,7,2),(37,7,3),(38,7,4),(39,7,5),(40,7,6),(41,7,7),(43,39,1);
/*!40000 ALTER TABLE `controlled_vocab_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `controlled_vocab_entry_settings`
--

DROP TABLE IF EXISTS `controlled_vocab_entry_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `controlled_vocab_entry_settings` (
  `controlled_vocab_entry_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `c_v_e_s_pkey` (`controlled_vocab_entry_id`,`locale`,`setting_name`),
  KEY `c_v_e_s_entry_id` (`controlled_vocab_entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controlled_vocab_entry_settings`
--

LOCK TABLES `controlled_vocab_entry_settings` WRITE;
/*!40000 ALTER TABLE `controlled_vocab_entry_settings` DISABLE KEYS */;
INSERT INTO `controlled_vocab_entry_settings` VALUES (1,'','name','personal','string'),(2,'','name','corporate','string'),(3,'','name','conference','string'),(4,'','description','Author','string'),(4,'','name','aut','string'),(5,'','description','Contributor','string'),(5,'','name','ctb','string'),(6,'','description','Editor','string'),(6,'','name','edt','string'),(7,'','description','Illustrator','string'),(7,'','name','ill','string'),(8,'','description','Photographer','string'),(8,'','name','pht','string'),(9,'','description','Sponsor','string'),(9,'','name','spn','string'),(10,'','description','Translator','string'),(10,'','name','trl','string'),(11,'','name','multimedia','string'),(12,'','name','still image','string'),(13,'','name','text','string'),(14,'','name','article','string'),(15,'','name','book','string'),(16,'','name','conference publication','string'),(17,'','name','issue','string'),(18,'','name','journal','string'),(19,'','name','newspaper','string'),(20,'','name','picture','string'),(21,'','name','review','string'),(22,'','name','periodical','string'),(23,'','name','series','string'),(24,'','name','thesis','string'),(25,'','name','web site','string'),(26,'','name','electronic','string'),(27,'','name','print','string'),(28,'','name','journal','string'),(29,'','name','issue','string'),(30,'','name','article','string'),(31,'','name','proceeding','string'),(32,'','name','conference','string'),(33,'','name','preprint','string'),(34,'','name','unknown','string'),(35,'','name','book','string'),(36,'','name','bookitem','string'),(37,'','name','proceeding','string'),(38,'','name','conference','string'),(39,'','name','report','string'),(40,'','name','document','string'),(41,'','name','unknown','string'),(43,'es_ES','submissionKeyword','Solanaceae, Comparación, Bosque de Protección San Matías San Carlos, Santuario Nacional Pampa Hermosa, Perú.','string');
/*!40000 ALTER TABLE `controlled_vocab_entry_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `controlled_vocabs`
--

DROP TABLE IF EXISTS `controlled_vocabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `controlled_vocabs` (
  `controlled_vocab_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `symbolic` varchar(64) NOT NULL,
  `assoc_type` bigint(20) NOT NULL DEFAULT '0',
  `assoc_id` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`controlled_vocab_id`),
  UNIQUE KEY `controlled_vocab_symbolic` (`symbolic`,`assoc_type`,`assoc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controlled_vocabs`
--

LOCK TABLES `controlled_vocabs` WRITE;
/*!40000 ALTER TABLE `controlled_vocabs` DISABLE KEYS */;
INSERT INTO `controlled_vocabs` VALUES (8,'interest',0,0),(4,'mods34-genre-marcgt',0,0),(2,'mods34-name-role-roleTerms-marcrelator',0,0),(1,'mods34-name-types',0,0),(5,'mods34-physicalDescription-form-marcform',0,0),(3,'mods34-typeOfResource',0,0),(7,'openurl10-book-genres',0,0),(6,'openurl10-journal-genres',0,0),(41,'submissionAgency',1048585,1),(40,'submissionDiscipline',1048585,1),(39,'submissionKeyword',1048585,1),(42,'submissionLanguage',1048585,1),(38,'submissionSubject',1048585,1);
/*!40000 ALTER TABLE `controlled_vocabs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_issue_orders`
--

DROP TABLE IF EXISTS `custom_issue_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_issue_orders` (
  `issue_id` bigint(20) NOT NULL,
  `journal_id` bigint(20) NOT NULL,
  `seq` double NOT NULL DEFAULT '0',
  UNIQUE KEY `custom_issue_orders_pkey` (`issue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_issue_orders`
--

LOCK TABLES `custom_issue_orders` WRITE;
/*!40000 ALTER TABLE `custom_issue_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_issue_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_section_orders`
--

DROP TABLE IF EXISTS `custom_section_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_section_orders` (
  `issue_id` bigint(20) NOT NULL,
  `section_id` bigint(20) NOT NULL,
  `seq` double NOT NULL DEFAULT '0',
  UNIQUE KEY `custom_section_orders_pkey` (`issue_id`,`section_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_section_orders`
--

LOCK TABLES `custom_section_orders` WRITE;
/*!40000 ALTER TABLE `custom_section_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_section_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_object_tombstone_oai_set_objects`
--

DROP TABLE IF EXISTS `data_object_tombstone_oai_set_objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_object_tombstone_oai_set_objects` (
  `object_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tombstone_id` bigint(20) NOT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  PRIMARY KEY (`object_id`),
  KEY `data_object_tombstone_oai_set_objects_tombstone_id` (`tombstone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_object_tombstone_settings` (
  `tombstone_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `data_object_tombstone_settings_pkey` (`tombstone_id`,`locale`,`setting_name`),
  KEY `data_object_tombstone_settings_tombstone_id` (`tombstone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_object_tombstones` (
  `tombstone_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `data_object_id` bigint(20) NOT NULL,
  `date_deleted` datetime NOT NULL,
  `set_spec` varchar(255) NOT NULL,
  `set_name` varchar(255) NOT NULL,
  `oai_identifier` varchar(255) NOT NULL,
  PRIMARY KEY (`tombstone_id`),
  KEY `data_object_tombstones_data_object_id` (`data_object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_object_tombstones`
--

LOCK TABLES `data_object_tombstones` WRITE;
/*!40000 ALTER TABLE `data_object_tombstones` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_object_tombstones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edit_decisions`
--

DROP TABLE IF EXISTS `edit_decisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edit_decisions` (
  `edit_decision_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `review_round_id` bigint(20) DEFAULT NULL,
  `stage_id` bigint(20) DEFAULT NULL,
  `round` tinyint(4) NOT NULL,
  `editor_id` bigint(20) NOT NULL,
  `decision` tinyint(4) NOT NULL,
  `date_decided` datetime NOT NULL,
  PRIMARY KEY (`edit_decision_id`),
  KEY `edit_decisions_submission_id` (`submission_id`),
  KEY `edit_decisions_editor_id` (`editor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edit_decisions`
--

LOCK TABLES `edit_decisions` WRITE;
/*!40000 ALTER TABLE `edit_decisions` DISABLE KEYS */;
INSERT INTO `edit_decisions` VALUES (1,1,0,1,0,6,1,'2019-10-28 16:39:36'),(2,1,0,4,0,6,7,'2019-10-28 16:39:55');
/*!40000 ALTER TABLE `edit_decisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_log`
--

DROP TABLE IF EXISTS `email_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  `sender_id` bigint(20) NOT NULL,
  `date_sent` datetime NOT NULL,
  `ip_address` varchar(39) DEFAULT NULL,
  `event_type` bigint(20) DEFAULT NULL,
  `from_address` varchar(255) DEFAULT NULL,
  `recipients` text,
  `cc_recipients` text,
  `bcc_recipients` text,
  `subject` varchar(255) DEFAULT NULL,
  `body` text,
  PRIMARY KEY (`log_id`),
  KEY `email_log_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_log`
--

LOCK TABLES `email_log` WRITE;
/*!40000 ALTER TABLE `email_log` DISABLE KEYS */;
INSERT INTO `email_log` VALUES (1,1048585,1,6,'2019-10-28 16:26:40','190.108.84.115',NULL,'\"Ada Patricia Barturén Quispe\" <adapatricia33@hotmail.com>','\"Ada Patricia Barturén Quispe\" <adapatricia33@hotmail.com>',NULL,'adapatricia33@hotmail.com, adapatricia33@hotmail.com','[RC] Acuse de recibo del envío','Ada Patricia Barturén Quispe:<br />\n<br />\nGracias por enviar el manuscrito &quot;Diversidad de la Familia Solanaceae en dos áreas naturales protegidas del Perú&quot; a Revista Científica. Con el sistema de gestión de publicaciones en línea que utilizamos podrá seguir el progreso a través del proceso editorial tras iniciar sesión en el sitio web de la publicación:<br />\n<br />\nURL del manuscrito: <a href=\'http://vrinv.unprg.edu.pe/ojs/index.php/RC/authorDashboard/submission/1\' class=\'submissionUrl-style-class\'>http://vrinv.unprg.edu.pe/ojs/index.php/RC/authorDashboard/submission/1</a><br />\nNombre de usuario/a: abarturen<br />\n<br />\nSi tiene alguna duda puede ponerse en contacto conmigo. Gracias por elegir esta editorial para mostrar su trabajo.<br />\n<br />\nAda Patricia Barturén Quispe<br/><br/>\n________________________________________________________________________<br/>\n<a href=\"http://vrinv.unprg.edu.pe/ojs/index.php/RC\">Revista Científica</a>'),(2,1048585,1,6,'2019-10-28 16:26:41','190.108.84.115',NULL,'\"Ada Patricia Barturén Quispe\" <adapatricia33@hotmail.com>','\"Luis Zuñe Da Silva\" <lfelipezd15@hotmail.com>',NULL,NULL,'[RC] Acuse de recibo del envío','Hola,<br />\n<br />\nAda Patricia Barturén Quispe ha enviado el manuscrito &quot;Diversidad de la Familia Solanaceae en dos áreas naturales protegidas del Perú&quot; a Revista Científica. <br />\n<br />\nSi tiene cualquier pregunta no dude en contactarme. Le agradecemos que haya elegido esta revista para dar a conocer su obra.<br />\n<br />\nAda Patricia Barturén Quispe<br/><br/>\n________________________________________________________________________<br/>\n<a href=\"http://vrinv.unprg.edu.pe/ojs/index.php/RC\">Revista Científica</a>');
/*!40000 ALTER TABLE `email_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_log_users`
--

DROP TABLE IF EXISTS `email_log_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_log_users` (
  `email_log_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  UNIQUE KEY `email_log_user_id` (`email_log_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_log_users`
--

LOCK TABLES `email_log_users` WRITE;
/*!40000 ALTER TABLE `email_log_users` DISABLE KEYS */;
INSERT INTO `email_log_users` VALUES (1,6);
/*!40000 ALTER TABLE `email_log_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_templates`
--

DROP TABLE IF EXISTS `email_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_templates` (
  `email_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email_key` varchar(64) NOT NULL,
  `assoc_type` bigint(20) DEFAULT '0',
  `assoc_id` bigint(20) DEFAULT '0',
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`email_id`),
  UNIQUE KEY `email_templates_email_key` (`email_key`,`assoc_type`,`assoc_id`),
  KEY `email_templates_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates`
--

LOCK TABLES `email_templates` WRITE;
/*!40000 ALTER TABLE `email_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_templates_data`
--

DROP TABLE IF EXISTS `email_templates_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_templates_data` (
  `email_key` varchar(64) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT 'en_US',
  `assoc_type` bigint(20) DEFAULT '0',
  `assoc_id` bigint(20) DEFAULT '0',
  `subject` varchar(120) NOT NULL,
  `body` text,
  UNIQUE KEY `email_templates_data_pkey` (`email_key`,`locale`,`assoc_type`,`assoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates_data`
--

LOCK TABLES `email_templates_data` WRITE;
/*!40000 ALTER TABLE `email_templates_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_templates_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_templates_default`
--

DROP TABLE IF EXISTS `email_templates_default`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_templates_default` (
  `email_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email_key` varchar(64) NOT NULL,
  `can_disable` tinyint(4) NOT NULL DEFAULT '1',
  `can_edit` tinyint(4) NOT NULL DEFAULT '1',
  `from_role_id` bigint(20) DEFAULT NULL,
  `to_role_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`email_id`),
  KEY `email_templates_default_email_key` (`email_key`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates_default`
--

LOCK TABLES `email_templates_default` WRITE;
/*!40000 ALTER TABLE `email_templates_default` DISABLE KEYS */;
INSERT INTO `email_templates_default` VALUES (1,'NOTIFICATION',0,1,NULL,NULL),(2,'NOTIFICATION_CENTER_DEFAULT',0,1,NULL,NULL),(3,'PASSWORD_RESET_CONFIRM',0,1,NULL,NULL),(4,'PASSWORD_RESET',0,1,NULL,NULL),(5,'USER_REGISTER',0,1,NULL,NULL),(6,'USER_VALIDATE',0,1,NULL,NULL),(7,'REVIEWER_REGISTER',0,1,NULL,NULL),(8,'PUBLISH_NOTIFY',0,1,NULL,NULL),(9,'LOCKSS_EXISTING_ARCHIVE',0,1,NULL,NULL),(10,'LOCKSS_NEW_ARCHIVE',0,1,NULL,NULL),(11,'SUBMISSION_ACK',1,1,NULL,65536),(12,'SUBMISSION_ACK_NOT_USER',1,1,NULL,65536),(13,'EDITOR_ASSIGN',1,1,256,512),(14,'REVIEW_CANCEL',1,1,512,4096),(15,'REVIEW_REQUEST',1,1,512,4096),(16,'REVIEW_REQUEST_SUBSEQUENT',1,1,512,4096),(17,'REVIEW_REQUEST_ONECLICK',1,1,512,4096),(18,'REVIEW_REQUEST_ONECLICK_SUBSEQUENT',1,1,512,4096),(19,'REVIEW_REQUEST_ATTACHED',0,1,512,4096),(20,'REVIEW_REQUEST_ATTACHED_SUBSEQUENT',0,1,512,4096),(21,'REVIEW_REQUEST_REMIND_AUTO',0,1,NULL,4096),(22,'REVIEW_REQUEST_REMIND_AUTO_ONECLICK',0,1,NULL,4096),(23,'REVIEW_CONFIRM',1,1,4096,512),(24,'REVIEW_DECLINE',1,1,4096,512),(25,'REVIEW_ACK',1,1,512,4096),(26,'REVIEW_REMIND',0,1,512,4096),(27,'REVIEW_REMIND_AUTO',0,1,NULL,4096),(28,'REVIEW_REMIND_ONECLICK',0,1,512,4096),(29,'REVIEW_REMIND_AUTO_ONECLICK',0,1,NULL,4096),(30,'EDITOR_DECISION_ACCEPT',0,1,512,65536),(31,'EDITOR_DECISION_SEND_TO_EXTERNAL',0,1,17,65536),(32,'EDITOR_DECISION_SEND_TO_PRODUCTION',0,1,17,65536),(33,'EDITOR_DECISION_REVISIONS',0,1,512,65536),(34,'EDITOR_DECISION_RESUBMIT',0,1,512,65536),(35,'EDITOR_DECISION_DECLINE',0,1,512,65536),(36,'EDITOR_DECISION_INITIAL_DECLINE',0,1,512,65536),(37,'EDITOR_RECOMMENDATION',0,1,17,16),(38,'COPYEDIT_REQUEST',1,1,512,8192),(39,'LAYOUT_REQUEST',1,1,512,768),(40,'LAYOUT_COMPLETE',1,1,768,512),(41,'EMAIL_LINK',0,1,1048576,NULL),(42,'SUBSCRIPTION_NOTIFY',0,1,NULL,1048576),(43,'OPEN_ACCESS_NOTIFY',0,1,NULL,1048576),(44,'SUBSCRIPTION_BEFORE_EXPIRY',0,1,NULL,1048576),(45,'SUBSCRIPTION_AFTER_EXPIRY',0,1,NULL,1048576),(46,'SUBSCRIPTION_AFTER_EXPIRY_LAST',0,1,NULL,1048576),(47,'SUBSCRIPTION_PURCHASE_INDL',0,1,NULL,2097152),(48,'SUBSCRIPTION_PURCHASE_INSTL',0,1,NULL,2097152),(49,'SUBSCRIPTION_RENEW_INDL',0,1,NULL,2097152),(50,'SUBSCRIPTION_RENEW_INSTL',0,1,NULL,2097152),(51,'CITATION_EDITOR_AUTHOR_QUERY',0,1,NULL,NULL),(52,'REVISED_VERSION_NOTIFY',0,1,NULL,512),(53,'ORCID_COLLECT_AUTHOR_ID',0,1,NULL,NULL),(54,'ORCID_REQUEST_AUTHOR_AUTHORIZATION',0,1,NULL,NULL),(55,'PAYPAL_INVESTIGATE_PAYMENT',0,1,NULL,NULL),(56,'MANUAL_PAYMENT_NOTIFICATION',0,1,NULL,NULL);
/*!40000 ALTER TABLE `email_templates_default` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_templates_default_data`
--

DROP TABLE IF EXISTS `email_templates_default_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_templates_default_data` (
  `email_key` varchar(64) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT 'en_US',
  `subject` varchar(120) NOT NULL,
  `body` text,
  `description` text,
  UNIQUE KEY `email_templates_default_data_pkey` (`email_key`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates_default_data`
--

LOCK TABLES `email_templates_default_data` WRITE;
/*!40000 ALTER TABLE `email_templates_default_data` DISABLE KEYS */;
INSERT INTO `email_templates_default_data` VALUES ('CITATION_EDITOR_AUTHOR_QUERY','en_US','Citation Editing','{$authorFirstName},<br />\n<br />\nCould you please verify or provide us with the proper citation for the following reference from your article, {$submissionTitle}:<br />\n<br />\n{$rawCitation}<br />\n<br />\nThanks!<br />\n<br />\n{$userFirstName}<br />\nCopy-Editor, {$contextName}<br />\n','This email allows copyeditors to request additional information about references from authors.'),('CITATION_EDITOR_AUTHOR_QUERY','es_ES','Edición de citas','{$authorFirstName},<br />\n<br />\nPor favor, ¿podría usted verificar o proporcionarnos la cita adecuada para la siguiente referencia de su artículo, {$submissionTitle}?:<br />\n<br />\n{$rawCitation}<br />\n<br />\n¡Gracias!<br />\n<br />\n{$userFirstName}<br />\nCorrector/a de estilo, {$contextName}','Este correo electrónico permite a los correctores/as de estilo solicitar información adicional acerca de las referencias de los autores/as.'),('CITATION_EDITOR_AUTHOR_QUERY','pt_BR','Edição de citação','{$authorFirstName},<br />\n<br />\nSolicitamos verificar ou encaminhar a citação correta para a seguinte referência do seu artigo, {$submissionTitle}:<br />\n<br />\n{$rawCitation}<br />\n<br />\nAtenciosamente,<br />\n<br />\n{$userFirstName}<br />\nEditor de texto, {$contextName}','Solicitação ao autor de detalhes sobre referência, enviada pelo editor de texto.'),('COPYEDIT_REQUEST','en_US','Copyediting Request','{$participantName}:<br />\n<br />\nI would ask that you undertake the copyediting of &quot;{$submissionTitle}&quot; for {$contextName} by following these steps.<br />\n1. Click on the Submission URL below.<br />\n2. Open any files available under Draft Files and do your copyediting, while adding any Copyediting Discussions as needed.<br />\n3. Save copyedited file(s), and upload to Copyedited panel.<br />\n4. Notify the Editor that all files have been prepared, and that the Production process may begin.<br />\n<br />\n{$contextName} URL: {$contextUrl}<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$participantUsername}<br />\n<br />\n{$editorialContactSignature}','This email is sent by a Section Editor to a submission\'s Copyeditor to request that they begin the copyediting process. It provides information about the submission and how to access it.'),('COPYEDIT_REQUEST','es_ES','Petición de corrección','{$participantName}:<br />\n<br />\nMe gustaría pedirle que llevara a cabo la corrección del manuscrito &quot;{$submissionTitle},&quot; para {$contextName}. En el sitio web de la revista puede encontrar el envío, así como las instrucciones de corrección.<br />\n<br />\nURL del manuscrito: {$submissionUrl}<br />\nNombre de usuaria/o: {$participantUsername}<br />\n<br />\nSi no puede llevar a cabo este trabajo en este momento o tiene cualquier pregunta, póngase en contacto con nosotros/as. Gracias por aceptar llevar a cabo este importante trabajo para la revista.<br />\n<br />\n{$editorialContactSignature}','Este correo es enviado por un/a Editor/a de Sección a un/a corrector/a de un envío para pedirles que comiencen un proceso de corrección. Le proporciona información sobre en el envío y cómo acceder a él.'),('COPYEDIT_REQUEST','pt_BR','Solicitação de edição de texto','{$participantName},<br />\n<br />\nSolicito a edição de texto do trabalho&quot;{$submissionTitle}&quot;, submetido à revista {$contextName}, conforme os passos a seguir:<br />\n<br />\n1. Clique na URL da submissão, informado mais adiante nesta mensagem.<br />\n2. Acesse o sistema e clique no arquivo que aparece no Passo 1.<br />\n3. Consulte as instruções para edição de texto na página<br />\n4. Abra o arquivo baixado e realize as alterações necessárias, incluindo perguntas ao autor onde necessário.<br />\n5. Salve o arquivo editado e envie o arquivo no Passo 1.<br />\n5. Clique no ícone de e-mail sob CONCLUÍDO e envie a mensagem ao editor.<br />\n<br />\nURL da revista {$contextName}: {$contextUrl}<br />\nURL da Submissão: {$submissionUrl}<br />\nLogin: {$participantUsername}<br />\n<br />\nCaso não esteja disponível para assumir esta responsabilidade no momento, ou em caso de dúvidas, entre em contato via e-mail.<br />\n<br />\nAgradecemos desde já sua colaboração, fundamental para a qualidade da revista.<br />\n<br />\n{$editorialContactSignature}','Mensagem enviada pelo Editor de Seção solicitando a realização de uma tarefa de edição ao Editor de Texto, com informações sobre e como acessar o documento.'),('EDITOR_ASSIGN','en_US','Editorial Assignment','{$editorialContactName}:<br />\n<br />\nThe submission, &quot;{$submissionTitle},&quot; to {$contextName} has been assigned to you to see through the editorial process in your role as Section Editor.<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$editorUsername}<br />\n<br />\nThank you,<br />\n{$editorialContactSignature}','This email notifies a Section Editor that the Editor has assigned them the task of overseeing a submission through the editing process. It provides information about the submission and how to access the journal site.'),('EDITOR_ASSIGN','es_ES','Asignación editorial','{$editorialContactName}:<br />\n<br />\nSe le ha asignado el envío, &quot;{$submissionTitle},&quot; a {$contextName} para que lo revise en el proceso editorial como Editor/a de Sección.<br />\n<br />\nURL del envío: {$submissionUrl}<br />\nUsuario/a: {$editorUsername}<br />\n<br />\nGracias,<br />\n{$editorialContactSignature}','Este correo notifica al / a la Editor/a de Sección de que les ha asignado la tarea de supervisar un envío a través del proceso editorial. Proporciona información sobre el envío y cómo acceder a la revista.'),('EDITOR_ASSIGN','pt_BR','Tarefa editorial','{$editorialContactName},<br />\n<br />\nComo parte de suas funções como editor de seção, designamos para seu acompanhamento do processo editorial a submissão &quot;{$submissionTitle}&quot; para a revista {$contextName}.<br />\n<br />\nURL da submissão: {$submissionUrl}<br />\nlogin: {$editorUsername}<br />\n<br />\nAgradecendo desde já a atenção dispensada,<br />\n{$editorialContactSignature}','Mensagem notifica o Editor de Seção que uma nova tarefa de acompanhamento de submissão lhe foi designada pelo Editor-Gerente. Oferece informações sobre a submissão e como acessar o sistema.'),('EDITOR_DECISION_ACCEPT','en_US','Editor Decision','{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Accept Submission<br />\n<br />\n{$editorialContactSignature}<br />\n','This email from the Editor or Section Editor to an Author notifies them of a final \"accept submission\" decision regarding their submission.'),('EDITOR_DECISION_ACCEPT','es_ES','Decisión del editor/a','{$authorName}:<br />\n<br />\nHemos tomado una decisión sobre su envío en {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nNuestra decisión es: Aceptar el envío<br />\n<br />\n{$editorialContactSignature}<br />','Este correo electrónico del editor/a o editor/a de sección al autor/a le notifica de la decisión final sobre su envío.'),('EDITOR_DECISION_ACCEPT','pt_BR','Decisão editorial','{$authorName},<br />\n<br />\nFoi tomada uma decisão sobre o artigo submetido à revista {$contextName},<br />\n&quot;{$submissionTitle}&quot;.<br />\n<br />\nA decisão é: Submissão aceita.<br />\n<br />\n{$editorialContactSignature}','Esta é uma mensagem do Editor/Editor de Seção ao autor para notificá-lo da decisão editorial (final) tomada sobre a submissão.'),('EDITOR_DECISION_DECLINE','en_US','Editor Decision','{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Decline Submission<br />\n<br />\n{$editorialContactSignature}<br />\n','This email from the Editor or Section Editor to an Author notifies them of a final \"decline\" decision regarding their submission.'),('EDITOR_DECISION_DECLINE','es_ES','Decisión del editor/a','{$authorName}:<br />\n<br />\nHemos tomado una decisión sobre su envío en {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nNuestra decisión es: Rechazar el envío<br />\n<br />\n{$editorialContactSignature}<br />','Este correo electrónico del editor/a o editor/a de sección al autor/a le notifica sobre la decisión final de \"rechazar\" su envío.'),('EDITOR_DECISION_DECLINE','pt_BR','Decisão editorial','{$authorName}:<br />\n<br />\nFoi tomada uma decisão sobre o artigo submetido à revista {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nA decisão é: Submissão rejeitada.<br />\n<br />\n{$editorialContactSignature}','Esta mensagem do Editor/Editor de Seção ao autor notifica sobre a decisão final tomada sobre a submissão.'),('EDITOR_DECISION_INITIAL_DECLINE','en_US','Editor Decision','\n			{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Decline Submission<br />\n<br />\n{$editorialContactSignature}<br />','This email is send to the author if the editor declines his submission initially, before the review stage'),('EDITOR_DECISION_INITIAL_DECLINE','es_ES','Decisión del editor/a','{$authorName}:<br />\n<br />\nHemos llegado a una decisión sobre su envio a {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nNuestra decisión es: Rechazar el envío<br />\n<br />\n{$editorialContactSignature}<br />','Este correo electrónico se envía al autor/a si el editor/a rechaza su envío inicialmente, antes de la fase de revisión'),('EDITOR_DECISION_RESUBMIT','en_US','Editor Decision','{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Resubmit for Review<br />\n<br />\n{$editorialContactSignature}<br />\n','This email from the Editor or Section Editor to an Author notifies them of a final \"resubmit\" decision regarding their submission.'),('EDITOR_DECISION_RESUBMIT','es_ES','Decisión del editor/a','{$authorName}:<br />\n<br />\nHemos tomado una decisión sobre su envío en {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nNuestra decisión es: Volver a enviar a revisión<br />\n<br />\n{$editorialContactSignature}<br />','Este correo electrónico del editor/a o editor/a de sección al autor/a le notifica sobre la decisión final de volver a revisar su envío.'),('EDITOR_DECISION_RESUBMIT','pt_BR','Decisão editorial','{$authorName}:<br />\n<br />\nFoi tomada uma decisão sobre o artigo enviado à revista {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nA decisão é: Submeter novamente.<br />\n<br />\n{$editorialContactSignature}','Esta mensagem do Editor/Editor de Seção ao autor notifica sobre a decisão editorial final tomada sobre a submissão.'),('EDITOR_DECISION_REVISIONS','en_US','Editor Decision','{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is: Revisions Required<br />\n<br />\n{$editorialContactSignature}<br />\n','This email from the Editor or Section Editor to an Author notifies them of a final \"revisions required\" decision regarding their submission.'),('EDITOR_DECISION_REVISIONS','es_ES','Decisión del editor/a','{$authorName}:<br />\n<br />\nHemos tomado una decisión sobre su envío en {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nNuestra decisión es: Necesita revisiones<br />\n<br />\n{$editorialContactSignature}<br />','Este correo electrónico del editor/a o editor/a de sección al autor/a le notifica que la decisión final respecto a su envío es que \"necesita revisiones\".'),('EDITOR_DECISION_REVISIONS','pt_BR','Decisão editorial','{$authorName}:<br />\n<br />\nFoi tomada uma decisão sobre o artigo submetido à {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nA decisão é: Revisões necessárias.<br />\n<br />\n{$editorialContactSignature}','Esta mensagem é enviada pelo do Editor/Editor de Seção ao autor, notificando-o da decisão final tomada sobre a submissão.'),('EDITOR_DECISION_SEND_TO_EXTERNAL','en_US','Editor Decision','{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Send to Review<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\n<br />\n{$editorialContactSignature}<br />\n','This email from the Editor or Section Editor to an Author notifies them that their submission is being sent to an external review.'),('EDITOR_DECISION_SEND_TO_EXTERNAL','es_ES','Decisión del editor/a','{$authorName}:<br />\n<br />\nHemos llegado a una decisión respecto a su envío {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nNuestra decisión es: Enviar a revisión<br />\n<br />\nEnlace: {$submissionUrl}<br />\n<br />\n{$editorialContactSignature}<br />','Este correo electrónico del editor/a, o del editor/a de sección, notifica al autor/a que su envío se traslada a un revisor/a externo.'),('EDITOR_DECISION_SEND_TO_EXTERNAL','pt_BR','Decisão do Editor','{$authorName}:<br />\n<br />\nChegamos a uma decisão sobre sua submissão  {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nNossa decisão é que seu artigo foi enviado para avaliação externa. Iremos aguardar os pareceres para entrar em contato novamente<br />\n<br />\nURL da submissão: {$submissionUrl}<br />\n<br />\n{$editorialContactSignature}<br />','Este e-mail enviado pelo Editor ou Editor de Seção para um autor serve para notificar o mesmo de que sua submissão foi enviada para revisores externos.'),('EDITOR_DECISION_SEND_TO_PRODUCTION','en_US','Editor Decision','{$authorName}:<br />\n<br />\nThe editing of your submission, &quot;{$submissionTitle},&quot; is complete.  We are now sending it to production.<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\n<br />\n{$editorialContactSignature}<br />\n','This email from the Editor or Section Editor to an Author notifies them that their submission is being sent to production.'),('EDITOR_DECISION_SEND_TO_PRODUCTION','es_ES','Decisión del editor/a','{$authorName}:<br />\n<br />\nLa edición de su envío, &quot;{$submissionTitle},&quot; se ha completado. Ahora lo enviaremos a producción.<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\n<br />\n{$editorialContactSignature}<br />','Este correo electrónico del editor/a, o del editor/a de sección, notifica al autor/a que su envío se traslada a producción.'),('EDITOR_RECOMMENDATION','en_US','Editor Recommendation','{$editors}:<br />\n<br />\nThe recommendation regarding the submission to {$contextName}, &quot;{$submissionTitle}&quot; is: {$recommendation}<br />\n<br />\n{$editorialContactSignature}<br />\n','This email from the recommending Editor or Section Editor to the decision making Editors or Section Editors notifies them of a final recommendation regarding the submission.'),('EDITOR_RECOMMENDATION','es_ES','Recomendación del editor/a','{$editors}:<br />\n<br />\nLa recomendación respecto al envío a {$contextName}, &quot;{$submissionTitle}&quot; es: {$recommendation}<br />\n<br />\n{$editorialContactSignature}<br />','Este correo electrónico del editor/a o editor/a de sección que aconseja para los editores/as o editores/as de sección que toman las decisiones les notifica sobre la recomendación final respecto al envío.'),('EMAIL_LINK','en_US','Article of Possible Interest','Thought you might be interested in seeing &quot;{$submissionTitle}&quot; by {$authorName} published in Vol {$volume}, No {$number} ({$year}) of {$contextName} at &quot;{$articleUrl}&quot;.','This email template provides a registered reader with the opportunity to send information about an article to somebody who may be interested. It is available via the Reading Tools and must be enabled by the Journal Manager in the Reading Tools Administration page.'),('EMAIL_LINK','es_ES','Artículo interesante','He pensado que le podría interesar ver el artículo &quot;{$submissionTitle}&quot; de {$authorName}, publicado en el vol. {$volume}, nº {$number} ({$year}) de {$contextName} en &quot;{$articleUrl}&quot;.','Esta plantilla de correo proporciona a un/a lector/a registrado/a la oportunidad de enviar información sobre un artículo a alguien a quien le podría interesar. Está disponible a través de las Herramientas de Lectura y debe ser activado por el/la Gestor/a de la Revista en las Administración de Herramientas de Lectura.'),('EMAIL_LINK','pt_BR','Artigo interessante para sua leitura','Acredito ser de seu interesse o artigo &quot;{$submissionTitle}&quot;, de {$authorName}, publicado na revista {$contextName}, V. {$volume}, n. {$number}, Ano {$year}, disponível em &quot;{$articleUrl}&quot;.','Mensagem enviada por um leitor a um colega, sobre um artigo considerado de seu interesse, com link para acesso e informações sobre a revista e a edição onde o documento foi publicado.'),('LAYOUT_ACK','pt_BR','Agradecimento pelas composições','{$participantName},<br />\n<br />\nAgradecemos a preparação das composições do trabalho &quot;{$submissionTitle}&quot;, submetido à revista {$contextName}.<br />\n<br />\nSua contribuição é fundamental para o processo editorial e a qualidade desta publicação.<br />\n<br />\n{$editorialContactSignature}','Mensagem enviada pelo Editor de Seção ao Editor de Layout, agradecendo pela conclusão das composições.'),('LAYOUT_COMPLETE','en_US','Galleys Complete','{$editorialContactName}:<br />\n<br />\nGalleys have now been prepared for the manuscript, &quot;{$submissionTitle},&quot; for {$contextName} and are ready for proofreading.<br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\n{$participantName}','This email from the Layout Editor to the Section Editor notifies them that the layout process has been completed.'),('LAYOUT_COMPLETE','es_ES','Galeradas completadas','{$editorialContactName}:<br />\n<br />\nYa han sido preparadas las galeradas para el manuscrito &quot;{$submissionTitle},&quot; para {$contextName} y están listas para corregir.<br />\n<br />\nSi tiene cualquier pregunta, no dude en contactar con nosotros/as.<br />\n<br />\n{$participantName}','Este correo es enviado por el/la Editor/a de Maquetación al / a la Editor/a de Sección notificándole que el proceso de maquetación ha finalizado.'),('LAYOUT_COMPLETE','pt_BR','Composições concluídas','{$editorialContactName},<br />\n<br />\nAs composições do trabalho &quot;{$submissionTitle}&quot;, submetido à revista {$contextName}, estão prontas para leitura de provas.<br />\n<br />\nEm caso de dúvidas, entre em contato via e-mail.<br />\n<br />\n{$participantName}','Mensagem enviada pelo Editor de Layout ao Editor de Seção, informando sobre a conclusão das composições.'),('LAYOUT_REQUEST','en_US','Request Galleys','{$participantName}:<br />\n<br />\nThe submission &quot;{$submissionTitle}&quot; to {$contextName} now needs galleys laid out by following these steps.<br />\n1. Click on the Submission URL below.<br />\n2. Log into the journal and use the Production Ready files to create the galleys according to the journal\'s standards.<br />\n3. Upload the galleys to the Galley Files section.<br />\n4. Notify the Editor using Production Discussions that the galleys are uploaded and ready.<br />\n<br />\n{$contextName} URL: {$contextUrl}<br />\nSubmission URL: {$submissionLayoutUrl}<br />\nUsername: {$participantUsername}<br />\n<br />\nIf you are unable to undertake this work at this time or have any questions, please contact me. Thank you for your contribution to this journal.<br />\n<br />\n{$editorialContactSignature}','This email from the Section Editor to the Layout Editor notifies them that they have been assigned the task of performing layout editing on a submission. It provides information about the submission and how to access it.'),('LAYOUT_REQUEST','es_ES','Solicitud de galeradas','{$participantName}:<br />\n<br />\nLe solicito que prepare las galeradas del manuscrito &quot;{$submissionTitle},&quot; para {$contextName}.<br />\n<br />\nURL del manuscrito: {$submissionLayoutUrl}<br />\nNombre de usuaria/o: {$participantUsername}<br />\n<br />\nSi no puede llevar a cabo este trabajo en este momento o tiene cualquier pregunta, póngase en contacto con nosotros/as. Gracias por su contribución a la revista.<br />\n<br />\n{$editorialContactSignature}','Este correo es enviado por el/ la Editor/a de Sección al / a la Editor/a de Maquetación notificándole que se les ha asignado la tarea de editar la maquetación de un envío. Le proporciona información sobre el envío y cómo acceder a él.'),('LAYOUT_REQUEST','pt_BR','Solicitação de composições','{$participantName},<br />\n<br />\nSolicito a preparação das composições do manuscrito &quot;{$submissionTitle}&quot;, submetido à revista {$contextName}, conforme instruções a seguir:<br />\n<br />\n1. Clique na URL da submissão, informada mais adiante nesta mensagem.<br />\n2. Acesse o sistema e, usando a Versão de Layout como referência, produza as composições de acordo com os padrões desta revista.<br />\n3. Clique no ícone de e-mail sob CONCLUÍDO e envie a mensagem ao editor.<br />\n<br />\nURL da revista {$contextName}: {$contextUrl}<br />\nURL da Submissão: {$submissionLayoutUrl}<br />\nLogin: {$participantUsername}<br />\n<br />\nCaso não esteja disponível para assumir esta responsabilidade no momento, ou tenha quaisquer dúvidas, entre em contato via e-mail.<br />\n<br />\nAgradecemos desde já sua colaboração, fundamental para a qualidade da revista.<br />\n<br />\n{$editorialContactSignature}','Mensagem enviada pelo Editor de Seção ao Editor de Layout, solicitando que sejam preparadas as Composições do texto final, com informações de acesso.'),('LOCKSS_EXISTING_ARCHIVE','en_US','Archiving Request for {$contextName}','Dear [University Librarian]<br />\n<br />\n{$contextName} &amp;lt;{$contextUrl}&amp;gt;, is a journal for which a member of your faculty, [name of member], serves as a [title of position]. The journal is seeking to establish a LOCKSS (Lots of Copies Keep Stuff Safe) compliant archive with this and other university libraries.<br />\n<br />\n[Brief description of journal]<br />\n<br />\nThe URL to the LOCKSS Publisher Manifest for our journal is: {$contextUrl}/gateway/lockss<br />\n<br />\nWe understand that you are already participating in LOCKSS. If we can provide any additional metadata for purposes of registering our journal with your version of LOCKSS, we would be happy to provide it.<br />\n<br />\nThank you,<br />\n{$principalContactSignature}','This email requests the keeper of a LOCKSS archive to consider including this journal in their archive. It provides the URL to the journal\'s LOCKSS Publisher Manifest.'),('LOCKSS_EXISTING_ARCHIVE','es_ES','Petición de archivado para {$contextName}','Estimado/a [Bibliotecaria/o Universitaria/o]<br />\n<br />\n{$contextName} &amp;lt;{$contextUrl}&amp;gt;, es una revista en la que un miembro de su Facultad/Universidad, [nombre de la persona], colabora como [cargo que desempeña]. La revista está intentando crear un archivo LOCKSS (Lots of Copies Keep Stuff Safe) con esta y otras bibliotecas universitarias.<br />\n<br />\n[Breve descripción de la revista]<br />\n<br />\nLa URL para el Manifiesto Editorial LOCKSS para nuestra revista es: {$contextUrl}/gateway/lockss<br />\n<br />\nEntendemos que ya está participando en LOCKSS. Si podemos proporcionarle metadatos adicionales para registrar nuestra revista con su versión de LOCKSS, estaremos encantados/as de hacerlo.<br />\n<br />\nGracias,<br />\n{$principalContactSignature}','Este correo solicita al / a la administrador/a de un archivo LOCKSS que tenga en cuenta esta revista para incluirla en su archivo. Proporciona la URL del Manifiesto Editorial LOCKSS de la revista.'),('LOCKSS_EXISTING_ARCHIVE','pt_BR','Solicitação para incluir a revista {$contextName} em seu arquivo','&lt;![CDATA[Prezada(o) [Nome da(o) Bibliotecária(o) da Universidade],<br />\n<br />\n{$contextName} &lt;{$contextUrl}&gt; é uma revista na qual um docente da sua instituição, [nome da pessoa], possui o papel editorial de [título do papel editorial]. Esta revista deseja estabelecer arquivamento por meio do LOCKSS (Lots of Copies Keep Stuff Safe - Muitas Cópias Mantém as Coisas Seguras) com esta e outras bibliotecas de instituições de ensino superior.<br />\n<br />\n[Breve descrição da revista]<br />\n<br />\nA URL do Manifesto LOCKSS da Editora da nossa revista é: {$contextUrl}/gateway/lockss<br />\n<br />\nConsta do nosso registro que esta biblioteca é participante do sistema LOCKSS. Estamos à disposição caso necessite de metadados adicionais para o cadastro da revista na sua versão do LOCKSS, os quais providenciaremos o mais rápido possível.<br />\n<br />\nEm caso de dúvidas, entre em contato via e-mail.<br />\n<br />\nAgradecendo desde já a atenção dispensada,<br />\n{$principalContactSignature}]]&gt;','Mensagem solicita ao administrador de um repositório LOCKSS que considere armazenar a revista em seu arquivo, informando a URL para o Manifesto LOCKSS da Editora da revista.'),('LOCKSS_NEW_ARCHIVE','en_US','Archiving Request for {$contextName}','Dear [University Librarian]<br />\n<br />\n{$contextName} &amp;lt;{$contextUrl}&amp;gt;, is a journal for which a member of your faculty, [name of member] serves as a [title of position]. The journal is seeking to establish a LOCKSS (Lots of Copies Keep Stuff Safe) compliant archive with this and other university libraries.<br />\n<br />\n[Brief description of journal]<br />\n<br />\nThe LOCKSS Program &amp;lt;http://lockss.org/&amp;gt;, an international library/publisher initiative, is a working example of a distributed preservation and archiving repository, additional details are below. The software, which runs on an ordinary personal computer is free; the system is easily brought on-line; very little ongoing maintenance is required.<br />\n<br />\nTo assist in the archiving of our journal, we invite you to become a member of the LOCKSS community, to help collect and preserve titles produced by your faculty and by other scholars worldwide. To do so, please have someone on your staff visit the LOCKSS site for information on how this system operates. I look forward to hearing from you on the feasibility of providing this archiving support for this journal.<br />\n<br />\nThank you,<br />\n{$principalContactSignature}','This email encourages the recipient to participate in the LOCKSS initiative and include this journal in the archive. It provides information about the LOCKSS initiative and ways to become involved.'),('LOCKSS_NEW_ARCHIVE','es_ES','Petición de archivado para {$contextName}','Estimado/a [Bibliotecario/a Universitario/a]<br />\n<br />\n{$contextName} &amp;lt;{$contextUrl}&amp;gt;, es una revista en la que un miembro de su Facultad/Universidad, [nombre de la persona], colabora como [cargo que desempeña]. La revista está intentando crear un archivo LOCKSS (Lots of Copies Keep Stuff Safe) con esta y otras bibliotecas universitarias.<br />\n<br />\n[Breve descripción de la revista]<br />\n<br />\nEl programa LOCKSS &amp;lt;http://lockss.org/&amp;gt;, una iniciativa internacional de bibliotecas y editoriales, es un ejemplo vivo de un repositorio de preservación y archivo distribuido, a continuación le mostramos más detalles. El software, que funciona en ordenadores personales normales es gratuito; el sistema se conecta fácilmente; necesitando muy poco mantenimiento.<br />\n<br />\nPara contribuir al archivado de nuestra revista, le invitamos a convertirse en miembro de la comunidad LOCKSS, y así ayudar a recopilar y preservar títulos producidos en nuestra facultad y por otras entidades académicas de todo el mundo. Para hacerlo le rogamos que alguna persona de su biblioteca visite el sitio de LOCKSS para saber cómo funciona este sistema. Espero recibir pronto noticias suyas en el sentido de que proporcionará el apoyo para poder archivar esta revista.<br />\n<br />\nGracias,<br />\n{$principalContactSignature}','Este correo solicita al / a la destinatario/a participar en la iniciativa LOCKSS e incluir esta revista en el archivo. Le proporciona información sobre la iniciativa LOCKSS y cómo participar.'),('LOCKSS_NEW_ARCHIVE','pt_BR','Solicitação de inclusão da revista {$contextName} em seu arquivo','&lt;![CDATA[Prezada(o) [Nome da(o) Bibliotecária(o) da Universidade],<br />\n<br />\n{$contextName} &lt;{$contextUrl}&gt; é uma revista na qual um docente da sua instituição, [nome da pessoa], possui o papel editorial de [título do papel editorial]. Esta revista deseja estabelecer arquivamento por meio do LOCKSS (Lots of Copies Keep Stuff Safe - Muitas Cópias Mantém as Coisas Seguras) com esta e outras bibliotecas de instituições de ensino superior.<br />\n<br />\n[Breve descrição da revista]<br />\n<br />\nO sistema LOCKSS &lt;http://lockss.org/&gt;, uma iniciativa internacional de bibliotecas e editores, é um exemplo funcional de um repositório digital de preservação e arquivamento distribuído. O sistema, que é operado em ambiente tecnológico idêntico ao de um computador pessoal, é gratuito, permite sua implementação e disponibilização online rápida, e sua manutenção é mínima.<br />\n<br />\nPara auxiliar no arquivamento de nossa revista, convidamos sua biblioteca a se tornar membro da comunidade LOCKSS, e ajudar a colecionar e preservar títulos produzidos mundialmente. Para isso, visite o site do LOCKSS para saber como funciona o sistema e como fazer parte da comunidade.<br />\n<br />\nAguardamos resposta sobre sua disponibilidade para arquivamento desta revista.<br />\n<br />\nAgradecendo desde já a atenção dispensada,<br />\n{$principalContactSignature}]]&gt;','Mensagem convida o destinatário a participar da iniciativa LOCKSS e incluir a revista no seu repositório, oferecendo informações iniciais e sobre como participar. O remetente deverá preencher as informações, substituindo o que estiver em colchetes!'),('MANUAL_PAYMENT_NOTIFICATION','en_US','Manual Payment Notification','A manual payment needs to be processed for the journal {$contextName} and the user {$userFullName} (username &quot;{$userName}&quot;).<br />\n<br />\nThe item being paid for is &quot;{$itemName}&quot;.<br />\nThe cost is {$itemCost} ({$itemCurrencyCode}).<br />\n<br />\nThis email was generated by Open Journal Systems\' Manual Payment plugin.','This email template is used to notify a journal manager contact that a manual payment was requested.'),('MANUAL_PAYMENT_NOTIFICATION','es_ES','Notificación de pago manual','Un pago manual necesita ser procesado para la revista  {$contextName} y el usuario {$userFullName} (username &quot;{$userName}&quot;).<br />\n<br />\nEl ítem pagado es &quot;{$itemName}&quot;.<br />\nEl precio es {$itemCost} ({$itemCurrencyCode}).<br />\n<br />\nEste correo ha sido generado por el plugin de Pago Manual de  Open Journal Systems.','Este correo se usa para notificar al gestor/a de la revista de que se ha realizado un pago manual.'),('MANUAL_PAYMENT_NOTIFICATION','pt_BR','Notificação de pagamento manual','É necessário realizar o processamento de um pagamento manual de assinatura da revista {$contextName}, pelo usuário {$userFullName} (login &quot;{$userName}&quot;).<br />\n<br />\nO item adquirido é &quot;{$itemName}&quot;.<br />\nValor em ({$itemCurrencyCode}): {$itemCost}<br />\n<br />\nEsta é uma mensagem automática da ferramenta de Pagamento manual do Open Journal Systems.','Mensagem automática notificando editor-gerente que um pagamento manual foi realizado e exige processamento.'),('NOTIFICATION','en_US','New notification from {$siteTitle}','You have a new notification from {$siteTitle}:<br />\n<br />\n{$notificationContents}<br />\n<br />\nLink: {$url}<br />\n<br />\n{$principalContactSignature}','The email is sent to registered users that have selected to have this type of notification emailed to them.'),('NOTIFICATION','es_ES','Nueva notificación desde {$siteTitle}','Tiene una nueva notificación desde {$siteTitle}:<br />\n<br />\n{$notificationContents}<br />\n<br />\nEnlace: {$url}<br />\n<br />\n{$principalContactSignature}','El email es enviado a usuarios registrados que han seleccionado recibir notificaciones.'),('NOTIFICATION','pt_BR','Nova notificação de {$siteTitle}','Você possui uma nova notificação de {$siteTitle}:<br />\n<br />\n{$notificationContents}<br />\n<br />\nLink: {$url}<br />\n<br />\n{$principalContactSignature}','Esta mensagem é enviada a usuários cadastrados que escolheram habilitar este tipo de notificação via email.'),('NOTIFICATION_CENTER_DEFAULT','en_US','A message regarding {$contextName}','Please enter your message.','The default (blank) message used in the Notification Center Message Listbuilder.'),('NOTIFICATION_CENTER_DEFAULT','es_ES','Mensaje sobre {$contextName}','Por favor, introduzca su mensaje.','Mensaje (en blanco) por defecto usado en el Notification Center Message Listbuilder.'),('OPEN_ACCESS_NOTIFY','en_US','Issue Now Open Access','Readers:<br />\n<br />\n{$contextName} has just made available in an open access format the following issue. We invite you to review the Table of Contents here and then visit our web site ({$contextUrl}) to review articles and items of interest.<br />\n<br />\nThanks for the continuing interest in our work,<br />\n{$editorialContactSignature}','This email is sent to registered readers who have requested to receive a notification email when an issue becomes open access.'),('OPEN_ACCESS_NOTIFY','es_ES','Ahora el número es de acceso libre','Lectores:<br />\n<br />\n	{$contextName} acaba de hacer disponible de forma acceso libre el siguiente número. Los invitamos a revisar la Tabla de Contenido aquí y después visite nuestra página Web  ({$contextUrl}) para consultar los artículos que sean de su interés.<br />\n<br />\n	Gracias por mantener el interés en nuestro trabajo,<br />\n	{$editorialContactSignature}','Este correo se envía a los lectores/as registrados que han pedido recibir notificaciones por email cuando un número se vuelve de acceso libre.'),('OPEN_ACCESS_NOTIFY','pt_BR','Nova edição de Acesso Livre','Caros leitores,<br />\n<br />\nA {$contextName} acaba de tornar disponível para Acesso Livre mais uma edição. Convidamos a examinar o sumário nesta mensagem e então acessar a revista ({$contextUrl}), para ler os artigos e outros itens de seu proveito.<br />\n<br />\nAgradecemos o interesse e apoio contínuo à revista,<br />\n{$editorialContactSignature}','Esta mensagem é enviada a leitores cadastrados que solicitam o recebimento do sumário de uma nova edição de Acesso Livre.'),('ORCID_COLLECT_AUTHOR_ID','en_US','Submission ORCID','Dear {$authorName},<br/>\n<br/>\nYou have been listed as an author on a manuscript submission to {$contextName}.<br/>\nTo confirm your authorship, please add your ORCID id to this submission by visiting the link provided below.<br/>\n<br/>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://orcid.org/sites/default/files/images/orcid_16x16.png\" width=\'16\' height=\'16\' alt=\"ORCID iD icon\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Register or connect your ORCID iD</a><br/>\n<br/>\n<br>\n<a href=\"{$orcidAboutUrl}\">More information about ORCID at {$contextName}</a><br/>\n<br/>\nIf you have any questions, please contact me.<br/>\n<br/>\n{$principalContactSignature}<br/>\n','This email template is used to collect the ORCID id\'s from authors.'),('ORCID_COLLECT_AUTHOR_ID','es_ES','Identificador ORCID','Estimado/a {$authorName},\n\nSe le ha añadido como coautor/a del artículo \"{$articleTitle}\" para {$journalName}. \n\nPara confirmar su autoría, añada su identificador ORCID a este envío mediante el enlace proporcionado a continuación.\n\n{$authorOrcidUrl}\n\nSi tiene cualquier pregunta no dude en contactarme.\n\n{$editorialContactSignature}','Esta plantilla de correo se utiliza para recopilar los identificadores ORCID de los coautores/as.'),('ORCID_REQUEST_AUTHOR_AUTHORIZATION','en_US','Requesting ORCID record access','Dear {$authorName},<br>\n<br>\nYou have been listed as an author on the manuscript submission \"{$articleTitle}\" to {$contextName}.\n<br>\n<br>\nPlease allow us to add your ORCID id to this submission and also to add the submission to your ORCID profile on publication.<br>\nVisit the link to the official ORCID website, login with your profile and authorize the access by following the instructions.<br>\n<a href=\"{$authorOrcidUrl}\"><img id=\"orcid-id-logo\" src=\"https://orcid.org/sites/default/files/images/orcid_16x16.png\" width=\'16\' height=\'16\' alt=\"ORCID iD icon\" style=\"display: block; margin: 0 .5em 0 0; padding: 0; float: left;\"/>Register or Connect your ORCID iD</a><br/>\n<br>\n<br>\n<a href=\"{$orcidAboutUrl}\">More about ORCID at {$contextName}</a><br/>\n<br>\nIf you have any questions, please contact me.<br>\n<br>\n{$principalContactSignature}<br>\n','This email template is used to request ORCID record access from authors.'),('PASSWORD_RESET','en_US','Password Reset','Your password has been successfully reset for use with the {$siteTitle} web site. Please retain this username and password, as it is necessary for all work with the journal.<br />\n<br />\nYour username: {$username}<br />\nPassword: {$password}<br />\n<br />\n{$principalContactSignature}','This email is sent to a registered user when they have successfully reset their password following the process described in the PASSWORD_RESET_CONFIRM email.'),('PASSWORD_RESET','es_ES','Cambio de contraseña','Su contraseña en {$siteTitle} se ha cambiado sin problema. Por favor, guarde en lugar seguro su nombre de usuaria/o y contraseña, ya que son necesarios para trabajar con la revista.<br />\n<br />\nNombre de usuaria/o: {$username}<br />\nContraseña: {$password}<br />\n<br />\n{$principalContactSignature}','Este correo se envía a un/a usuario/a registrado/a una vez han cambiado su contraseña siguiendo el procedimiento descrito en el correo-e PASSWORD_RESET_CONFIRM.'),('PASSWORD_RESET','pt_BR','Senha atualizada','Sua senha de acesso ao site {$siteTitle} foi atualizada com sucesso. Guarde o login e a senha, uma vez que serão necessários para todas as atividades relacionadas ao sistema.<br />\n<br />\nSeu login: {$username}<br />\nSenha: {$password}<br />\n<br />\n{$principalContactSignature}','Mensagem enviada a usuário cadastrado quando o mesmo informa que esqueceu sua senha ou encontra problemas para acessar o sistema. O link contido permite ao usuário atualizar a senha de acesso.'),('PASSWORD_RESET_CONFIRM','en_US','Password Reset Confirmation','We have received a request to reset your password for the {$siteTitle} web site.<br />\n<br />\nIf you did not make this request, please ignore this email and your password will not be changed. If you wish to reset your password, click on the below URL.<br />\n<br />\nReset my password: {$url}<br />\n<br />\n{$principalContactSignature}','This email is sent to a registered user when they indicate that they have forgotten their password or are unable to login. It provides a URL they can follow to reset their password.'),('PASSWORD_RESET_CONFIRM','es_ES','Confirmación de cambio de contraseña','Hemos recibido una petición para cambiar su contraseña en {$siteTitle}.<br />\n<br />\nSi no hizo usted esta petición ignore este correo-e y su contraseña no cambiará. Si desea cambiar su contraseña pinche en el enlace que le mostramos a continuación.<br />\n<br />\nCambiar mi contraseña: {$url}<br />\n<br />\n{$principalContactSignature}','Este correo se envía a un/a usuario/a registrado/a cuando indican que han olvidado su contraseña o que no se pueden identificar. Proporciona una URL para que cambien su contraseña.'),('PASSWORD_RESET_CONFIRM','pt_BR','Solicitação de atualização de senha','Recebemos uma solicitação para atualizar sua senha de acesso à revista {$siteTitle}.<br />\n<br />\nCaso não tenha feito a solicitação, ignore esta mensagem, para não alterar sua senha.<br />\n<br />\nSe deseja realmente atualizar sua senha, clique no link a seguir.<br />\n<br />\nAtualizar senha: {$url}<br />\n<br />\n{$principalContactSignature}','Mensagem enviada a usuário cadastrado quando o mesmo solicita atualização da senha, quando esqueceu a senha ou encontra problemas para acessar o sistema. O link contido permite ao usuário concluir a atualização da senha de acesso.'),('PAYPAL_INVESTIGATE_PAYMENT','en_US','Unusual PayPal Activity','Open Journal Systems has encountered unusual activity relating to PayPal payment support for the journal {$contextName}. This activity may need further investigation or manual intervention.<br />\n                       <br />\nThis email was generated by Open Journal Systems\' PayPal plugin.<br />\n<br />\nFull post information for the request:<br />\n{$postInfo}<br />\n<br />\nAdditional information (if supplied):<br />\n{$additionalInfo}<br />\n<br />\nServer vars:<br />\n{$serverVars}<br />\n','This email template is used to notify a journal\'s primary contact that suspicious activity or activity requiring manual intervention was encountered by the PayPal plugin.'),('PAYPAL_INVESTIGATE_PAYMENT','es_ES','Actividad inusual de PayPal','Open Journal Systems ha notado una actividad inusual relacionada con el soporte de pago de PayPal para la revista {$contextName}.  Esta actividad puede necesitar de mayor investigación o intervención manual.<br />\n<br />\nEste email ha sido generado por el plugin de PayPal de Open Journal Systems.<br />\n<br />\nInformación completa de envío para la solicitud:<br />\n{$postInfo}<br />\n<br />\nInformación adicional (si proporcionada):<br />\n{$additionalInfo}<br />\n<br />\nVariables de servidor:<br />\n{$serverVars}','Esta plantilla de correo es usada para notificar al contacto principal de la revista de que el plugin de PayPal ha detectado actividad sospechosa o actividad que requiere de intervención manual.'),('PAYPAL_INVESTIGATE_PAYMENT','pt_BR','Atividade incomum na conta PayPal','O sistema encontrou atividade incomum relacionada ao suporte a pagamentos via PayPal da revista {$contextName}. <br />\nEsta atividade pode exigir investigação mais profunda ou intervenção manual.<br />\n                       <br />\nEsta é uma mensagem automática da ferramenta de Pagamento via PayPal do Open Journal Systems.<br />\n<br />\nInformações detalhadas da notificação:<br />\n{$postInfo}<br />\n<br />\nInformações adicionais (caso informado):<br />\n{$additionalInfo}<br />\n<br />\nVariáveis do servidor:<br />\n{$serverVars}','Esta mensagem notifica o contato principal da revista sobre atividades suspeitas, ou atividades que exijam intervenção manual, detectadas pelo Plugin de Pagamento via PayPal.'),('PROOFREAD_ACK','pt_BR','Agradecimento pela leitura de provas','{$proofreaderName},<br />\n<br />\nAgradecemos a leitura de provas do trabalho&quot;{$submissionTitle}&quot;, submetido à revista {$contextName}.<br />\n<br />\nSua contribuição é fundamental para a qualidade desta publicação.<br />\n<br />\n{$editorialContactSignature}','Mensagem enviada pelo Editor de Seção ao Leitor de Provas, agradecendo pelo trabalho concluído de Leitura de Provas.'),('PROOFREAD_AUTHOR_ACK','pt_BR','Agradecimento pela leitura de provas pelo autor','{$authorName},<br />\n<br />\nAgradecemos a conclusão da leitura de provas do seu trabalho, &quot;{$submissionTitle}&quot; submetido à revista {$contextName}.<br />\nEm breve seu trabalho estará pronto para publicação.<br />\n<br />\nCaso tenha habilitado o serviço de notificação, você receberá o Sumário via e-mail assim que a revista for publicada.<br />\n<br />\nEm caso de dúvidas, entre em contato.<br />\n<br />\n{$editorialContactSignature}','Mensagem enviada pelo Editor de Seção ao autor, agradecendo a conclusão da Leitura de Provas.'),('PROOFREAD_AUTHOR_COMPLETE','pt_BR','Conclusão da leitura de provas pelo autor','{$editorialContactName},<br />\n<br />\nConcluí a leitura de provas do trabalho &quot;{$submissionTitle}&quot;, submetido à revista {$contextName}.<br />\nAs correções estão disponíveis para serem incorporadas pelo editor de layout e verificadas pelo leitor de prova.<br />\n<br />\n{$authorName}','Mensagem enviada pelo Autor ao Editor de Seção, informando a conclusão da Leitura de Provas.'),('PROOFREAD_AUTHOR_REQUEST','pt_BR','Solicitação de leitura de provas ao autor','{$authorName},<br />\n<br />\nSolicitamos a leitura de provas do trabalho&quot;{$submissionTitle}&quot;, submetido à revista {$contextName}, conforme as instruções a seguir:<br />\n<br />\n1. Clique na URL da submissão, informada mais adiante nesta mensagem.<br />\n2. Acesse o sistema da revista e leia as INSTRUÇÕES PARA LEITURA DE PROVAS<br />\n3. Clique em LER PROVA na seção Layout e revise a composição nos formatos disponíveis.<br />\n4. Informe as solicitações de correções (tipográficos e de formatação) em Correções da prova<br />\n5. Salve e envie o e-mail com as correções ao editor de layout e ao leitor de prova.<br />\n6. Clique no ícone de e-mail sob CONCLUÍDO e envie a mensagem ao editor.<br />\n<br />\nURL da Submissão: {$submissionUrl}<br />\n<br />\nEm caso de dúvidas, entre em contato via e-mail.<br />\n<br />\nAgradecemos desde já sua colaboração, fundamental para a qualidade da revista.<br />\n<br />\n{$editorialContactSignature}','Mensagem enviada pelo Editor de Seção ao autor, solicitando que verifique o trabalho realizado pelo Editor de Layou, com informações sobre acesso e avisando que somente é possível corrigir erros tipográficos de de layout.'),('PROOFREAD_COMPLETE','pt_BR','Leitura de provas concluída','{$editorialContactName},<br />\n<br />\nConcluí a leitura de provas do trabalho&quot;{$submissionTitle}&quot;, submetido à revista {$contextName}.<br />\nAs correções estão disponíveis para serem incorporadas pelo editor de layout.<br />\n<br />\n{$proofreaderName}','Mensagem enviada pelo Leitor de Provas ao Editor de Seção, informando a conclusão da Leitura de Provas.'),('PROOFREAD_LAYOUT_ACK','pt_BR','Agradecimento pela leitura de provas pelo Editor de Layout','{$participantName},<br />\n<br />\nAgradecemos a conclusão da leitura de provas e as correções realizadas às composições do manuscrito &quot;{$submissionTitle}&quot;, submetido à revista {$contextName}.<br />\n<br />\nSua contribuição é fundamental para a qualidade desta publicação.<br />\n<br />\n{$editorialContactSignature}','Mensagem enviada pelo Editor de Seção ao Editor de Layout, agradecendo pela conclusão das composições, após a Leitura de Provas'),('PROOFREAD_LAYOUT_COMPLETE','pt_BR','Leitura de provas concluída pelo Editor de Layout','{$editorialContactName},<br />\n<br />\nAs composições do trabalho &quot;{$submissionTitle}&quot;, submetido à revista  {$contextName}, foram corrigidas, segundo as solicitações da leitura de provas, e estão prontas para publicação.<br />\n<br />\n{$participantName}','Mensagem enviada pelo Editor de Layout ao Editor de Seção, informando a conclusão das novas composições, após Leitura de Provas'),('PROOFREAD_LAYOUT_REQUEST','pt_BR','Solicitação de leitura de provas pelo Editor de Layout','{$participantName},<br />\n<br />\nO autor e o leitor de provas concluíram a leitura de provas do trabalho &quot;{$submissionTitle}&quot;, submetido à revista {$contextName}.<br />\nAs correções devem agora ser incorporadas conforme instruções a seguir:<br />\n<br />\n1. Clique na URL da submissão, informada mais adiante nesta mensagem.<br />\n2. Acesse o sistema da revista e consulte as Correções da prova para a atualizar as composições.<br />\n3. Envie as composições corrigidas.<br />\n4. Clique no ícone de e-mail sob CONCLUÍDO no Passo 3 da seção Leitura de provas, e envie a mensagem ao editor.<br />\n<br />\nURL da revista {$contextName}: {$contextUrl}<br />\nURL da Submissão: {$submissionUrl}<br />\nLogin: {$participantUsername}<br />\n<br />\nCaso não esteja disponível para assumir esta responsabilidade no momento, ou em caso de dúvidas, entre em contato através deste e-mail.<br />\n<br />\nAgradecemos desde já sua colaboração, fundamental para a qualidade da revista.<br />\n<br />\n{$editorialContactSignature}','Mensagem enviada pelo Editor de Seção ao Editor de Layout, solicitando que verifique os comentários e realize as alterações solicitadas após a Leitura de Provas. Possui informações sobre acesso ao sistema e ao documento'),('PROOFREAD_REQUEST','pt_BR','Solicitação de leitura de provas','{$proofreaderName},<br />\n<br />\nSolicito a leitura de provas do trabalho &quot;{$submissionTitle}&quot;, submetido à revista {$contextName}, conforme instruções a seguir:<br />\n<br />\n1. Clique na URL da submissão, informada mais adiante nesta mensagem.<br />\n2. Acesse o sistema da revista e leia as INSTRUÇÕES PARA LEITURA DE PROVAS.<br />\n3. Clique em VER PROVA na seção Layout e verifique as composições nos formatos disponíveis.<br />\n4. Informe correções (tipográficas e de formatação) em Correções da Prova.<br />\n5. Salve e envie as correções via e-mail ao editor de layout.<br />\n6. Clique no ícone de e-mail sob CONCLUÍDO e envie a mensagem ao editor.<br />\n<br />\nURL da Submissão: {$submissionUrl}<br />\nLogin: {$proofreaderUsername}<br />\n<br />\nCaso não esteja disponível para assumir esta responsabilidade no momento, ou tenha quaisquer dúvidas, entre em contato via e-mail.<br />\n<br />\nAgradecemos desde já sua colaboração, fundamental para a qualidade da revista.<br />\n<br />\n{$editorialContactSignature}','Mensagem enviada pelo Editor de Seção ao Leitor de Provas, solicitando que verifique o trabalho realizado pelo Editor de Layout e o autor, verificando os comentários e alterações solicitadas. É o último momento para verificar a qualidade do documento e evitar possíveis erros antes da publicação.'),('PUBLISH_NOTIFY','en_US','New Issue Published','Readers:<br />\n<br />\n{$contextName} has just published its latest issue at {$contextUrl}. We invite you to review the Table of Contents here and then visit our web site to review articles and items of interest.<br />\n<br />\nThanks for the continuing interest in our work,<br />\n{$editorialContactSignature}','This email is sent to registered readers via the \"Notify Users\" link in the Editor\'s User Home. It notifies readers of a new issue and invites them to visit the journal at a supplied URL.'),('PUBLISH_NOTIFY','es_ES','Nuevo número publicado','Estimados/as lectores/as:<br />\n<br />\n{$contextName} acaba de publicar su último número en {$contextUrl}. A continuación le mostramos la tabla de contenidos, después puede visitar nuestro sitio web para consultar los artículos que sean de su interés.<br />\n<br />\nGracias por mantener el interés en nuestro trabajo,<br />\n{$editorialContactSignature}','Este correo se envía a lectores/as registrados/as a través del enlace \"Notificar a usuarios/as\" en la home de editores/as. Notifica a los/as lectores/as de la aparición de un nuevo número y les invita a visitar la revista en la URL proporcionada.'),('PUBLISH_NOTIFY','pt_BR','Nova Edição Publicada','Caros leitores,<br />\n<br />\nA revista {$contextName} acaba de publicar seu último número, disponível em {$contextUrl}. Convidamos todos para verificarem o sumário da revista e acessar artigos e outros itens de seu interesse.<br />\n<br />\nAgradecemos pelo seu apoio contínuo e confiança em nosso trabalho,<br />\n{$editorialContactSignature}','Mensagem enviada para leitores cadastrados via \"notificação de usuários\"  na página do Editor. Ela convida os leitores a acessar o sistema web da revista para ler a edição mais recente, através da URL informada.'),('REVIEWER_REGISTER','en_US','Registration as Reviewer with {$contextName}','In light of your expertise, we have taken the liberty of registering your name in the reviewer database for {$contextName}. This does not entail any form of commitment on your part, but simply enables us to approach you with a submission to possibly review. On being invited to review, you will have an opportunity to see the title and abstract of the paper in question, and you\'ll always be in a position to accept or decline the invitation. You can also ask at any point to have your name removed from this reviewer list.<br />\n<br />\nWe are providing you with a username and password, which is used in all interactions with the journal through its website. You may wish, for example, to update your profile, including your reviewing interests.<br />\n<br />\nUsername: {$username}<br />\nPassword: {$password}<br />\n<br />\nThank you,<br />\n{$principalContactSignature}','This email is sent to a newly registered reviewer to welcome them to the system and provide them with a record of their username and password.'),('REVIEWER_REGISTER','es_ES','Revisor para {$contextName}','Estimado/a colega:<br />\n<br />\nA la vista de su trayectoria profesional, su nombre ha sido propuesto para figurar como revisor potencial en el sistema de gestión electrónica de artículos de la revista {$contextName}, sin que ello implique ningún compromiso por su parte y pudiendo dejar de formar parte de esta lista cuando lo desee.<br />\n<br />\nEn caso de estar conforme con actuar como revisor para la revista, podrá recibir solicitudes de revisión de artículos, y aceptar o rechazar dichas solicitudes en su momento.<br />\n<br />\nA continuación le enviamos un nombre de usuario y contraseña con los que podrá acceder al sistema de gestión de envíos de la revista.<br />\n<br />\nUsuario: {$username}<br />\ncontraseña: {$password}<br />\n<br />\nMuchas gracias por su atención y por su colaboración en {$contextName}','Este email se envía a los nuevos revisores para darles la bienvenida al sistema y proporcionarles sus datos de acceso.'),('REVIEWER_REGISTER','pt_BR','Cadastro como avaliador na revista {$contextName}','Devido ao conhecimento excepcional na sua área de atuação, tomamos a liberdade de cadastrá-lo na base de dados de avaliadores da revista {$contextName}.<br />\n<br />\nSeu cadastro não significa assumir responsabilidade alguma, apenas permitindo-nos solicitar a avaliação de submissões, de acordo com seus interesses informados no perfil.<br />\n<br />\nAo ser convidado para avaliar um artigo, estarão disponíveis informações como o título e resumo da submissão, podendo aceitar ou rejeitar o convite. Caso deseje ser removido da lista, basta entrar em contato a qualquer tempo solicitando sua remoção.<br />\n<br />\nSeus dados de acesso, login e senha, utilizados para interagir com o sistema e realizar atividades, como por exemplo atualizar seu perfil e a área de interesse para avaliação, estão incluídos nesta mensagem.<br />\n<br />\nLogin: {$username}<br />\nSenha: {$password}<br />\n<br />\nEsperamos poder contar com sua colaboração para garantir a qualidade desta publicação.<br />\n<br />\nAtenciosamente,<br />\n<br />\n{$principalContactSignature}','Mensagem de boas-vindas enviada a novo avaliador cadastrado no sistema, com login e senha para acesso.'),('REVIEW_ACK','en_US','Article Review Acknowledgement','{$reviewerName}:<br />\n<br />\nThank you for completing the review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We appreciate your contribution to the quality of the work that we publish.<br />\n<br />\n{$editorialContactSignature}','This email is sent by a Section Editor to confirm receipt of a completed review and thank the reviewer for their contributions.'),('REVIEW_ACK','es_ES','Acuse de recibo de revisión de artículo','{$reviewerName}:<br />\n<br />\nGracias por completar la revisión del envío &quot;{$submissionTitle},&quot; para {$contextName}. Apreciamos su contribución a la calidad de los trabajos que publicamos.<br />\n<br />\n{$editorialContactSignature}','Este correo enviado por el/la Editor/a de Sección para confirmar la recepción de una revisión completada y agradecer al / a la revisor/a su contribución.'),('REVIEW_ACK','pt_BR','Agradecimento pela avaliação','{$reviewerName},<br />\n<br />\nAgradecemos ter concluído a avaliação da submissão &quot;{$submissionTitle}&quot; à revista {$contextName}.<br />\n<br />\nSua contribuição é fundamental para a qualidade dos trabalhos publicados.<br />\n<br />\n{$editorialContactSignature}','Mensagem enviada pelo Editor de Seção ao Avaliador para confirmar recebimento e agradecer o avaliador pela conclusão da avaliação.'),('REVIEW_CANCEL','en_US','Request for Review Cancelled','{$reviewerName}:<br />\n<br />\nWe have decided at this point to cancel our request for you to review the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We apologize for any inconvenience this may cause you and hope that we will be able to call on you to assist with this journal\'s review process in the future.<br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\n{$editorialContactSignature}','This email is sent by the Section Editor to a Reviewer who has a submission review in progress to notify them that the review has been cancelled.'),('REVIEW_CANCEL','es_ES','Petición de revisión cancelada','{$reviewerName}:<br />\n<br />\nHemos decidido cancelar nuestra petición para que revisara el envío &quot;{$submissionTitle},&quot; para {$contextName}. Lamentamos las molestias que hayamos podido causarle y esperamos poder volver a contactar con usted en el futuro para que nos ayude en el proceso de revisión.<br />\n<br />\nSi tiene cualquier pregunta, no dude en contactar con nosotros/as.<br />\n<br />\n{$editorialContactSignature}','Este correo del / de la Editor/a de Sección a un/a Revisor/a que tiene la revisión de un envío en progreso para notificarles que la revisión se ha cancelado.'),('REVIEW_CANCEL','pt_BR','Cancelamento de solicitação de avaliação','{$reviewerName},<br />\n<br />\nEstamos cancelando a solicitação de avaliação da submissão &quot;{$submissionTitle}&quot; à revista {$contextName}.<br />\n<br />\nLamentamos qualquer inconveniente causado e esperamos poder contar com seus préstimos em outra oportunidade.<br />\n<br />\nEm caso de dúvidas, entre em contato via e-mail.<br />\n<br />\n{$editorialContactSignature}','Mensagem enviada pelo Editor de Seção com um processo de avaliação em andamento, notificando que o processo em questão foi cancelado.'),('REVIEW_CONFIRM','en_US','Able to Review','Editors:<br />\n<br />\nI am able and willing to review the submission, &quot;{$submissionTitle},&quot; for {$contextName}. Thank you for thinking of me, and I plan to have the review completed by its due date, {$reviewDueDate}, if not before.<br />\n<br />\n{$reviewerName}','This email is sent by a Reviewer to the Section Editor in response to a review request to notify the Section Editor that the review request has been accepted and will be completed by the specified date.'),('REVIEW_CONFIRM','es_ES','Acepto la revisión','Editores/as:<br />\n<br />\nTengo la capacidad y deseo revisar el envío &quot;{$submissionTitle},&quot; para {$contextName}. Gracias por acordarse de mí, es mi intención tener la revisión completa en el plazo indicado: {$reviewDueDate}, a ser posible antes.<br />\n<br />\n{$reviewerName}','Este correo es enviado por un/a revisor/a al / a la Editor/a de Sección en respuesta a una petición de revisión para notificarle que ha aceptado la petición y que será completada antes de la fecha especificada.'),('REVIEW_CONFIRM','pt_BR','Disponível para realizar avaliação','{$editorialContactName},<br />\n<br />\nEstou disponível e interessado em avaliar a submissão &quot;{$submissionTitle}&quot; a {$contextName}. Agradeço a consideração e pretendo concluir a avaliação até a data definida, {$reviewDueDate}, ou antes do prazo.<br />\n<br />\n{$reviewerName}','Mensagem enviada pelo Avaliador ao Editor de Seção, em resposta à solicitação de avaliação, para notificar disponibilidade para realizar a tarefa e de que a mesma será concluída no prazo especificado.'),('REVIEW_DECLINE','en_US','Unable to Review','Editors:<br />\n<br />\nI am afraid that at this time I am unable to review the submission, &quot;{$submissionTitle},&quot; for {$contextName}. Thank you for thinking of me, and another time feel free to call on me.<br />\n<br />\n{$reviewerName}','This email is sent by a Reviewer to the Section Editor in response to a review request to notify the Section Editor that the review request has been declined.'),('REVIEW_DECLINE','es_ES','Rechazo la revisión','Editores/as:<br />\n<br />\nMe temo que en este momento no voy a poder revisar el envío &quot;{$submissionTitle},&quot; para {$contextName}. Gracias por pensar en mí, espero que vuelvan a contar conmigo en futuras ocasiones.<br />\n<br />\n{$reviewerName}','Este correo es enviado por un/a revisor/a al / a la Editor/a de Sección en respuesta a una petición de revisión para notificarle que rechaza la petición de revisión.'),('REVIEW_DECLINE','pt_BR','Indisponível para realizar avaliação','{$editorialContactName},<br />\n<br />\nSinto informar que estou indisponível no momento para realizar a avaliação da submissão &quot;{$submissionTitle}&quot; à revista {$contextName}. Agradeço a consideração, e espero poder ser convocado e estar disponível em outra oportunidade.<br />\n<br />\n{$reviewerName}','Mensagem enviada pelo Avaliador ao Editor de Seção, em resposta à solicitação de avaliação, para notificar sua NÃO disponibilidade para realizar a tarefa, rejeitando a solicitação.'),('REVIEW_REMIND','en_US','Submission Review Reminder','{$reviewerName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have this review by {$reviewDueDate}, and would be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nIf you do not have your username and password for the journal\'s web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the journal. I look forward to hearing from you.<br />\n<br />\n{$editorialContactSignature}','This email is sent by a Section Editor to remind a reviewer that their review is due.'),('REVIEW_REMIND','es_ES','Recordatorio de envío de revisión','{$reviewerName}:<br />\n<br />\nLe recordamos nuestra petición de revisión del envío &quot;{$submissionTitle},&quot; para {$contextName}. Esperábamos su revisión antes del {$reviewDueDate}, esperamos nos la mande en cuanto la tenga lista.<br />\n<br />\nSi ha perdido su nombre de usuaria/o y contraseña para la revista puede pinchar en el siguiente enlace para cambiar su contraseña (se la enviaremos por correo-e junto con su nombre de usuaria/o). {$passwordResetUrl}<br />\n<br />\nURL del envío: {$submissionReviewUrl}<br />\n<br />\nLe rogamos nos confirme su disponibilidad para completar esta contribución vital para el trabajo de la revista. Esperamos tener noticias suyas a la mayor brevedad.<br />\n<br />\n{$editorialContactSignature}','Este correo es enviado por el/la Editor/a de Sección para recordar a un/a revisor/a que ya debe entregar su revisión.'),('REVIEW_REMIND','pt_BR','Lembrete de soclitação de avaliação','{$reviewerName},<br />\n<br />\nEste é apenas um lembrete quanto à solicitação de avaliação da submissão &quot;{$submissionTitle}&quot; à revista {$contextName}.<br />\nEsperamos receber sua avaliação até {$reviewDueDate}, e aguardamos o recebimento assim que for possível.<br />\n<br />\nCaso não possua o login e a senha para acessar o sistema da revista, use o link a seguir para criar uma nova senha, que lhe será enviada via email junto com o seu login.<br />\nCriar nova senha: {$passwordResetUrl}.<br />\n<br />\nClique no link a seguir para acessar a submissão e realizar a avaliação.<br />\nURL da Submissão: {$submissionReviewUrl}<br />\n<br />\nConfirme sua disponibilidade para concluir sua avaliação, uma contribuição vital para a qualidade desta publicação.<br />\n<br />\nAguardando seu contato,<br />\n<br />\n{$editorialContactSignature}','Mensagem enviada pelo Editor de Seção ao Avaliador como lembrete da tarefa de avaliação em andamento ainda não concluída.'),('REVIEW_REMIND_AUTO','en_US','Automated Submission Review Reminder','{$reviewerName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have this review by {$reviewDueDate}, and this email has been automatically generated and sent with the passing of that date. We would still be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nIf you do not have your username and password for the journal\'s web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the journal. I look forward to hearing from you.<br />\n<br />\n{$editorialContactSignature}','This email is automatically sent when a reviewer\'s due date elapses (see Review Options under Settings > Workflow > Review) and one-click reviewer access is disabled. Scheduled tasks must be enabled and configured (see the site configuration file).'),('REVIEW_REMIND_AUTO','es_ES','Recordatorio automático de revisión de envío','{$reviewerName}:<br />\n<br />\nLe recordamos nuestra petición de revisión del envío &quot;{$submissionTitle},&quot; para {$contextName}. Esperábamos su revisión antes del {$reviewDueDate}, y se ha generado automáticamente este correo-e al haberse superado dicha fecha. Aún estaríamos encantados de recibirla una vez la tenga lista.<br />\n<br />\nSi ha perdido su nombre de usuaria/o y contraseña para la revista puede pinchar en el siguiente enlace para cambiar su contraseña (se la enviaremos por correo-e junto con su nombre de usuaria/o). {$passwordResetUrl}<br />\n<br />\nURL del envío: {$submissionReviewUrl}<br />\n<br />\nLe rogamos nos confirme su disponibilidad para completar esta contribución vital para el trabajo de la revista. Esperamos tener noticias suyas a la mayor brevedad.<br />\n<br />\n{$editorialContactSignature}','Este correo es enviado automáticamente cuando se supera la fecha de entrega de un/a revisor/a (véase Opciones de Revisión en Configuración de la revista, paso 2). Las tareas planificadas deben estar activadas y configuradas (ver fichero de configuración del sitio).'),('REVIEW_REMIND_AUTO','pt_BR','Lembrete automático de solicitação de avaliação','{$reviewerName},<br />\n<br />\nEste é um lembrete automático, referente à solicitação de avaliação da submissão &quot;{$submissionTitle}&quot; a {$contextName}.<br />\n<br />\nEsperávamos receber a avaliação até {$reviewDueDate}, e este e-mail foi enviado automaticamente pois o prazo para entrega foi ultrapassado.<br />\nAguardamos o recebimento da avaliação assim que for possível concluí-la.<br />\n<br />\nCaso não possua o login e a senha para acessar o sistema da revista, use o link a seguir para criar uma nova senha, que lhe será enviada via e-mail junto com o seu login.<br />\nCriar nova senha: {$passwordResetUrl}.<br />\n<br />\nURL da Submissão: {$submissionReviewUrl}<br />\n<br />\nConfirme sua disponibilidade para concluir a avaliação, uma contribuição vital para a qualidade desta publicação.<br />\n<br />\nAguardando seu contato,<br />\n<br />\n{$editorialContactSignature}','Mensagem enviada automaticamente ao avaliador quando a data de conclusão de avaliação for ultrapassada (veja as Opções de Avaliação no Passo 2 da Configuração da Revista). Tarefas agendadas devem ser habilitadas e configuradas (veja o arquivo de configuração do sistema).'),('REVIEW_REMIND_AUTO_ONECLICK','en_US','Automated Submission Review Reminder','{$reviewerName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have this review by {$reviewDueDate}, and this email has been automatically generated and sent with the passing of that date. We would still be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the journal. I look forward to hearing from you.<br />\n<br />\n{$editorialContactSignature}','This email is automatically sent when a reviewer\'s due date elapses (see Review Options under Settings > Workflow > Review) and one-click reviewer access is enabled. Scheduled tasks must be enabled and configured (see the site configuration file).'),('REVIEW_REMIND_AUTO_ONECLICK','es_ES','Recordatorio automático de revisión de envío','{$reviewerName}:<br />\n<br />\nLe recordamos nuestra petición de revisión del envío &quot;{$submissionTitle},&quot; para {$contextName}. Esperábamos su revisión antes del {$reviewDueDate}, y se ha generado automáticamente este correo-e al haberse superado dicha fecha. Aún estaríamos encantados de recibirla una vez la tenga lista.<br />\n<br />\nURL del envío: {$submissionReviewUrl}<br />\n<br />\nLe rogamos nos confirme su disponibilidad para completar esta contribución vital para el trabajo de la revista. Esperamos tener noticias suyas a la mayor brevedad.<br />\n<br />\n{$editorialContactSignature}','This email is automatically sent when a reviewer\'s due date elapses (see Review Options under Journal Setup, Step 2) and one-click reviewer access is enabled. Scheduled tasks must be enabled and configured (see the site configuration file).'),('REVIEW_REMIND_AUTO_ONECLICK','pt_BR','Lembrete automático de solicitação de avaliação','{$reviewerName},<br />\n<br />\nEste é um lembrete automático, referente à solicitação de avaliação da submissão &quot;{$submissionTitle}&quot; a {$contextName}.<br />\n<br />\nO prazo para entrega da avaliação era {$reviewDueDate}, e este e-mail foi enviado automaticamente pois o prazo se esgotou.<br />\nAguardamos o recebimento da avaliação assim que for possível concluí-la.<br />\n<br />\nURL da Submissão: {$submissionReviewUrl}<br />\n<br />\nConfirme sua disponibilidade para concluir a avaliação, uma contribuição vital para a qualidade desta publicação.<br />\n<br />\nAguardando seu contato,<br />\n<br />\n{$editorialContactSignature}','Mensagem enviada automaticamente ao avaliador quando a data de conclusão de avaliação for ultrapassada (veja as Opções de Avaliação no Passo 2 da Configuração da Revista) e o acesso 1-Clique estiver ativado. Tarefas agendadas devem ser habilitadas e configuradas (veja o arquivo de configuração do sistema).'),('REVIEW_REMIND_ONECLICK','en_US','Submission Review Reminder','{$reviewerName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have this review by {$reviewDueDate}, and would be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the journal. I look forward to hearing from you.<br />\n<br />\n{$editorialContactSignature}','This email is sent by a Section Editor to remind a reviewer that their review is due.'),('REVIEW_REMIND_ONECLICK','es_ES','Recordatorio de envío de revisión','{$reviewerName}:<br />\n<br />\nLe recordamos nuestra petición de revisión del envío &quot;{$submissionTitle},&quot; para {$contextName}. Esperábamos su revisión antes del {$reviewDueDate}, esperamos nos la mande en cuanto la tenga lista.<br />\n<br />\nURL del envío: {$submissionReviewUrl}<br />\n<br />\nLe rogamos nos confirme su disponibilidad para completar esta contribución vital para el trabajo de la revista. Esperamos tener noticias suyas a la mayor brevedad.<br />\n<br />\n{$editorialContactSignature}','Este correo es enviado por el/la Editor/a de Sección para recordar a un/a revisor/a que ya debe entregar su revisión.'),('REVIEW_REMIND_ONECLICK','pt_BR','Lembrete de solicitação de avaliação','{$reviewerName},<br />\n<br />\nEsta mensagem é apenas um lembrete quanto à solicitação de avaliação da submissão &quot;{$submissionTitle}&quot; a {$contextName}.<br />\nEsperamos receber a avaliação até {$reviewDueDate}, e aguardamos o recebimento assim que for possível.<br />\n<br />\nClique no link a seguir para realizar a avaliação.<br />\nURL da Submissão: {$submissionReviewUrl}<br />\n<br />\nConfirme sua disponibilidade para concluir sua avaliação, uma contribuição vital para a qualidade desta publicação.<br />\n<br />\nAguardando seu contato,<br />\n<br />\n{$editorialContactSignature}','Mensagem enviada pelo Editor de Seção ao Avaliador como lembrete da tarefa de avaliação em andamento ainda não concluída.'),('REVIEW_REQUEST','en_US','Article Review Request','{$reviewerName}:<br />\n<br />\nI believe that you would serve as an excellent reviewer of the manuscript, &quot;{$submissionTitle},&quot; which has been submitted to {$contextName}. The submission\'s abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br />\n<br />\nPlease log into the journal web site by {$responseDueDate} to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation. The web site is {$contextUrl}<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nIf you do not have your username and password for the journal\'s web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}','This email from the Section Editor to a Reviewer requests that the reviewer accept or decline the task of reviewing a submission. It provides information about the submission such as the title and abstract, a review due date, and how to access the submission itself. This message is used when the Standard Review Process is selected in Management > Settings > Workflow > Review. (Otherwise see REVIEW_REQUEST_ATTACHED.)'),('REVIEW_REQUEST','es_ES','Solicitud de revisión de artículo','{$reviewerName}:<br />\n<br />\nTengo el convencimiento de que sería un/a excelente revisor/a del manuscrito, &quot;{$submissionTitle},&quot; que ha sido enviado a {$contextName}. A continuación encontrará un extracto del envío, con la esperanza de que aceptará llevar a cabo esta importante tarea para nosotros.<br />\n<br />\nPor favor, identifíquese en la revista antes de {$responseDueDate} para decirnos si hará o no la revisión, así como para tener acceso al envío y para registrar su revisión y recomendación. La dirección es {$contextUrl}<br />\n<br />\nLa revisión propiamente dicha debe estar lista para el {$reviewDueDate}.<br />\n<br />\nSi ha perdido su nombre de usuaria/o y contraseña, puede pinchar en el siguiente enlace para cambiar su contraseña (le llegará por correo-e junto con su nombre de usuaria/o). {$passwordResetUrl}<br />\n<br />\nURL del envío: {$submissionReviewUrl}<br />\n<br />\nGracias por tener en cuenta nuestra solicitud.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\nResumen<br />\n{$submissionAbstract}','Este correo del / de la Editor/a de Sección a un/a revisor/a le solicita que acepte o rechace la revisión de un envío. Proporciona información sobre el envío como el título y el resumen, el plazo de revisión, y cómo acceder al envío propiamente dicho. Este mensaje se usa cuando se selecciona el Proceso de Envío Estándar en la configuración de la revista, paso 2. (En caso de haber seleccionado otra opción, REVIEW_REQUEST_ATTACHED.)'),('REVIEW_REQUEST','pt_BR','A revista {$contextName} solicita avaliação de artigo','{$reviewerName},<br />\n<br />\nAcredito que seu conhecimento será fundamental para realizar a avaliação do trabalho &quot;{$submissionTitle}&quot; submetido a {$contextName}. Informações sobre a submissão encontram-se nesta mensagem, e espero que considere assumir esta importante responsabilidade.<br />\n<br />\nAcesse o sistema até {$responseDueDate} para informar se estará disponível ou não para realizar a avaliação, bem como acessar os dados completos da submissão e registrar sua avaliação e recomendações, por meio da URL {$contextUrl}.<br />\n<br />\nO prazo para a conclusão da avaliação é {$reviewDueDate}.<br />\n<br />\nCaso não tenha seu login e senha de acesso para acessar o sistema, use o link a seguir para que o sistema crie uma nova senha que lhe será enviada via e-mail, após mensagem de confirmação de solicitação de atualização de senha, junto com o seu login. Clique no link a seguir para criar sua nova senha: {$passwordResetUrl}<br />\n<br />\nClique no link baixo para acessar o sistema e a submissão designada.<br />\nURL da submissão: {$submissionReviewUrl}<br />\n<br />\nAgradecemos desde já sua atenção.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n---------------------------------------------------------------<br />\nDados da submissão<br />\n<br />\nTítulo<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n<br />\n<br />\nResumo<br />\n{$submissionAbstract}','Mensagem do Editor de Seção para solicitar ao Avaliador que indique disponibilidade ou não para realizar uma avaliação. Oferece informações sobre a submissão, como título e resumo, além da data para a conclusão dos trabalhos e como acessar o documento. Esta mensagem é usada quando se utiliza o Processo Padrão de Avaliação, definido no Passo 2 de Configuração da Revista. (Caso contrário veja REVIEW_REQ_MULTI_ATTACHED e REVIEW_REQUEST_ATTACHED.)'),('REVIEW_REQUEST_ATTACHED','en_US','Article Review Request','{$reviewerName}:<br />\n<br />\nI believe that you would serve as an excellent reviewer of the manuscript, &quot;{$submissionTitle},&quot; and I am asking that you consider undertaking this important task for us. The Review Guidelines for this journal are appended below, and the submission is attached to this email. Your review of the submission, along with your recommendation, should be emailed to me by {$reviewDueDate}.<br />\n<br />\nPlease indicate in a return email by {$responseDueDate} whether you are able and willing to do the review.<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\nReview Guidelines<br />\n<br />\n{$reviewGuidelines}<br />\n','This email is sent by the Section Editor to a Reviewer to request that they accept or decline the task of reviewing a submission. It includes the submission as an attachment. This message is used when the Email-Attachment Review Process is selected in Management > Settings > Workflow > Review. (Otherwise see REVIEW_REQUEST.)'),('REVIEW_REQUEST_ATTACHED','es_ES','Petición de revisión de artículo','{$reviewerName}:<br />\n<br />\nTengo el convencimiento de que sería un/a excelente revisor/a del manuscrito &quot;{$submissionTitle},&quot;. A continuación encontrará un extracto del envío, con la esperanza de que aceptará llevar a cabo esta importante tarea para nosotros. A continuación le mostramos las Normas de Revisión de esta revista y adjunto a este correo-e recibirá el envío. Debería enviarme por correo-e su revisión del envío, así como su recomendación antes del {$reviewDueDate}.<br />\n<br />\nLe ruego me conteste a este correo-e antes del {$responseDueDate} y me comunique si puede y quiere hacer la revisión.<br />\n<br />\nGracias por tener en cuenta esta solicitud.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\nNormas de Revisión<br />\n<br />\n{$reviewGuidelines}<br />','Este correo del / de la Editor/a de Sección a un/a revisor/a le solicita que acepte o rechace la revisión de un envío. Contiene el envío propiamente dicho como adjunto. Este correo se usa cuando es seleccionado Proceso de Revisión mediante Adjuntos en Correo-e en la configuración de la revista, paso 2.'),('REVIEW_REQUEST_ATTACHED','pt_BR','A revista {$contextName} solicita avaliação de artigo','{$reviewerName},<br />\n<br />\nAcredito que seu conhecimento será fundamental para realizar a avaliação do trabalho &quot;{$submissionTitle}&quot; submetido a {$contextName}.<br />\nAs diretrizes de avaliação encontram-se no final desta mensagem, e a submissão encontra-se em anexo.<br />\nO prazo para avaliar a submissão, bem como definir sua recomendação, devem ser enviadas via e-mail até {$reviewDueDate}.<br />\n<br />\nResponda a esta mensagem até {$responseDueDate} se estará disponível ou não para realizar a avaliação.<br />\n<br />\nEspero que considere assumir esta importante responsabilidade.<br />\n<br />\nAgradecemos desde já sua atenção.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n---------------------------------------------------------------<br />\nDiretrizes de avaliação<br />\n<br />\n{$reviewGuidelines}',NULL),('REVIEW_REQUEST_ATTACHED_SUBSEQUENT','en_US','Article Review Request','{$reviewerName}:<br />\n<br />\nThis regards the manuscript &quot;{$submissionTitle},&quot; which is under consideration by {$contextName}.<br />\n<br />\nFollowing the review of the previous version of the manuscript, the authors have now submitted a revised version of their paper. We would appreciate it if you could help evaluate it.<br />\n<br />\nThe Review Guidelines for this journal are appended below, and the submission is attached to this email. Your review of the submission, along with your recommendation, should be emailed to me by {$reviewDueDate}.<br />\n<br />\nPlease indicate in a return email by {$responseDueDate} whether you are able and willing to do the review.<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\nReview Guidelines<br />\n<br />\n{$reviewGuidelines}<br />\n','This email is sent by the Section Editor to a Reviewer to request that they accept or decline the task of reviewing a submission for a second or greater round of review. It includes the submission as an attachment. This message is used when the Email-Attachment Review Process is selected in Management > Settings > Workflow > Review. (Otherwise see REVIEW_REQUEST_SUBSEQUENT.)'),('REVIEW_REQUEST_ATTACHED_SUBSEQUENT','es_ES','Solicitud de revisión de artículo','{$reviewerName}:<br />\n<br />\nEste correo es en referencia al manuscrito &quot;{$submissionTitle},&quot;, que {$contextName} está considerando.<br />\n<br />\nDespués de la revisión de la versión previa del manuscrito, los autores/as han enviado una versión revisada de su artículo. Le agradeceríamos mucho si pudiera ayudarnos a evaluarla.<br />\n<br />\nLas normas de revisión de esta revista se pueden ver a continuación. Además, el artículo se adjunta en este correo electrónico. Debería enviarnos su revisión del envío, junto con su recomendación, antes del {$reviewDueDate}.<br />\n<br />\nPor favor, responda a este correo electrónico antes del {$responseDueDate} e indíquenos si puede y desea realizar esta revisión.<br />\n<br />\nGracias por considerar esta solicitud.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\nNormas de revisión<br />\n<br />\n{$reviewGuidelines}<br />','El editor de sección envía este correo electrónico a un revisor para pedirle si acepta o rechaza la tarea de revisión de un artículo en segunda ronda. Este incluye el envío como adjunto. Este mensaje se usa cuando se selecciona el proceso de revisión de archivos adjuntos por correo electrónico en el paso 2 de la configuración de la revista. (Por lo demás, vea SOLICITUD_DE_REVISIÓN_POSTERIOR).'),('REVIEW_REQUEST_ATTACHED_SUBSEQUENT','pt_BR','Solicitação de avaliação de artigo','Prezada(o) {$reviewerName},<br />\n<br />\nEsta mensagem é referente ao trabalho &quot;{$submissionTitle},&quot; em processo de avaliação para a revista {$contextName}.<br />\n<br />\nSeguindo o processo de avaliação do trabalho, os autores encaminharam uma versão atualizada. Acredito que seu conhecimento será fundamental para realizar sua avaliação e espero que considere assumir esta importante responsabilidade.<br />\n<br />\nAs Diretrizes para Avaliação estão apensas a e a submissão como anexo a esta mensaagem. Sua avaliação, bem como recomendação, devem ser enviadas para este e-mail até {$reviewDueDate}.<br />\n<br />\nResponda a esta mensagem até {$responseDueDate} indicando sua disponibilidade ou não para realizar a avaliação.<br />\n<br />\nAgradecendo desde já a atenção dispensada,<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\nDiretrizes para Avaliação<br />\n<br />\n{$reviewGuidelines}','Esta mensagem é enviada pelo Editor de seção ao avaliador, solicitando a avaliação de uma submissão em uma segunda rodada ou superior. A mensagem inclui a submissão como anexo. Ela é usada quando o processo de avaliação via e-mail é escolhido no Passo 2 de configuração da revista (Caso contrário, veja REVIEW_REQUEST_SUBSEQUENT).'),('REVIEW_REQUEST_ONECLICK','en_US','Article Review Request','{$reviewerName}:<br />\n<br />\nI believe that you would serve as an excellent reviewer of the manuscript, &quot;{$submissionTitle},&quot; which has been submitted to {$contextName}. The submission\'s abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br />\n<br />\nPlease log into the journal web site by {$responseDueDate} to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}','This email from the Section Editor to a Reviewer requests that the reviewer accept or decline the task of reviewing a submission. It provides information about the submission such as the title and abstract, a review due date, and how to access the submission itself. This message is used when the Standard Review Process is selected in Management > Settings > Workflow > Review, and one-click reviewer access is enabled.'),('REVIEW_REQUEST_ONECLICK','es_ES','Petición de revisión de artículo','{$reviewerName}:<br />\n<br />\nTengo el convencimiento de que sería un/a excelente revisor/a del manuscrito &quot;{$submissionTitle},&quot; que ha sido enviado a {$contextName}. A continuación encontrará un extracto del envío, con la esperanza de que aceptará llevar a cabo esta importante tarea para nosotros.<br />\n<br />\nPor favor, identifíquese en la revista antes de {$responseDueDate} para decirnos si hará o no la revisión, así como para tener acceso al envío y para registrar su revisión y recomendación.<br />\n<br />\nLa revisión propiamente dicha debe estar lista para el {$reviewDueDate}.<br />\n<br />\nURL del envío: {$submissionReviewUrl}<br />\n<br />\nGracias por tener en cuenta nuestra solicitud.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}','Este correo del / de la Editor/a de Sección a un/a revisor/a le solicita que acepte o rechace la revisión de un envío. Proporciona información sobre el envío como el título y el resumen, el plazo de revisión, y cómo acceder al envío propiamente dicho. Este mensaje se usa cuando se selecciona el Proceso de Envío Estándar en la configuración de la revista, paso 2, y está activado el acceso a la revisión en un click.'),('REVIEW_REQUEST_ONECLICK','pt_BR','Solicita avaliação de artigo','{$reviewerName},<br />\n<br />\nAcredito que seu conhecimento será fundamental para realizar a avaliação do manuscrito &quot;{$submissionTitle}&quot; submetido a {$contextName}. Informações sobre a submissão encontram-se abaixo, e espero que considere assumir esta importante responsabilidade.<br />\n<br />\nAcesse o sistema até {$responseDueDate} para informar se estará disponível ou não para realizar a avaliação, bem como acessar os dados completos da submissão e registrar sua avaliação e recomendações.<br />\n<br />\nO prazo para a entrega da avaliação é {$reviewDueDate}.<br />\n<br />\nURL da Submissão: {$submissionReviewUrl}<br />\nA URL da submissão permite acesso direto, sem a necessidade de informar login e senha, que serão necessários para acessar outras áreas.<br />\n<br />\nAgradecendo desde já a atenção dispensada,<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\n----------------------------------------------------<br />\nDados da submissão<br />\n<br />\nTítulo:<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n<br />\n<br />\nResumo:<br />\n{$submissionAbstract}','Mensagem do Editor de Seção para solicitar ao Avaliador que indique disponibilidade ou não para realizar uma avaliação. Oferece informações sobre a submissão, como título e resumo, além da data para a conclusão dos trabalhos e como acessar o documento. Esta mensagem é usada quando se utiliza o Processo Padrão de Avaliação, definido no Passo 2 de Configuração da Revista e a opção de acesso one-click está habilitada (Caso contrário veja REVIEW_REQ_MULTI_ATTACHED e REVIEW_REQUEST_ATTACHED).'),('REVIEW_REQUEST_ONECLICK_SUBSEQUENT','en_US','Article Review Request','{$reviewerName}:<br />\n<br />\nThis regards the manuscript &quot;{$submissionTitle},&quot; which is under consideration by {$contextName}.<br />\n<br />\nFollowing the review of the previous version of the manuscript, the authors have now submitted a revised version of their paper. We would appreciate it if you could help evaluate it.<br />\n<br />\nPlease log into the journal web site by {$responseDueDate} to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}','This email from the Section Editor to a Reviewer requests that the reviewer accept or decline the task of reviewing a submission for a second or greater round of review. It provides information about the submission such as the title and abstract, a review due date, and how to access the submission itself. This message is used when the Standard Review Process is selected in Management > Settings > Workflow > Review, and one-click reviewer access is enabled.'),('REVIEW_REQUEST_ONECLICK_SUBSEQUENT','es_ES','Solicitud de revisión de artículo','{$reviewerName}:<br />\n<br />\nEste correo es en referencia al manuscrito &quot;{$submissionTitle},&quot;, que {$contextName} está considerando.<br />\n<br />\nDespués de la revisión de la versión previa del manuscrito, los autores/as han enviado una versión revisada de su artículo. Le agradeceríamos mucho si pudiera ayudarnos a evaluarla.<br />\n<br />\nInicie sesión en el sitio web de la revista antes del {$responseDueDate} para indicar si llevará a cabo la revisión o no, además de para obtener acceso al envío y registrar su revisión y recomendación.<br />\n<br />\nLa fecha límite para entregar la revisión es el {$reviewDueDate}.<br />\n<br />\nURL del envío: {$submissionReviewUrl}<br />\n<br />\nGracias por considerar esta solicitud.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}','Este correo electrónico del editor/a de sección a un revisor/a solicita que el revisor/a acepte o rechace la tarea de revisar un envío para una ronda de revisión adicional. Además, proporciona información sobre el envío como el título, el resumen, la fecha de entrega de la revisión y cómo obtener acceso al propio envío. Este mensaje se usa cuando se selecciona el proceso de revisión estándar en el paso 2 de la configuración de la revista y cuando se habilita el acceso al revisor/a con un solo clic.'),('REVIEW_REQUEST_ONECLICK_SUBSEQUENT','pt_BR','Solicitação de avaliação de artigo','{$reviewerName}:<br />\n<br />\nEsta mensagem é referente ao trabalho &quot;{$submissionTitle}&quot;, que está em processo de avaliação na publicação {$contextName}.<br />\n<br />\nContinuando o processo de avaliação da versão anterior do trabalho, os autores enviaram uma versão revisada. Nos seria de grande valia se pudesse ajudara a avaliá-lo.<br />\n<br />\nPara tanto, acesse o sistema da revista até {$responseDueDate} para indicar se está disponível ou não para assumir a responsabilidade, bem como acessar os dados da submissão e registrar sua avaliação e recomendação.<br />\n<br />\nA avaliação deve ser concluída até {$reviewDueDate}.<br />\n<br />\nURL da Submissão: {$submissionReviewUrl}<br />\n<br />\nAgradecendo desde já a atenção dispensada,<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}','This email from the Section Editor to a Reviewer requests that the reviewer accept or decline the task of reviewing a submission for a second or greater round of review. It provides information about the submission such as the title and abstract, a review due date, and how to access the submission itself. This message is used when the Standard Review Process is selected in Journal Setup, Step 2, and one-click reviewer access is enabled.'),('REVIEW_REQUEST_REMIND_AUTO','en_US','Article Review Request','{$reviewerName}:<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have your response by {$responseDueDate}, and this email has been automatically generated and sent with the passing of that date.\n<br />\nI believe that you would serve as an excellent reviewer of the manuscript. The submission\'s abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br />\n<br />\nPlease log into the journal web site to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation. The web site is {$contextUrl}<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nIf you do not have your username and password for the journal\'s web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}','This email is automatically sent when a reviewer\'s confirmation due date elapses (see Review Options under Settings > Workflow > Review) and one-click reviewer access is disabled. Scheduled tasks must be enabled and configured (see the site configuration file).'),('REVIEW_REQUEST_REMIND_AUTO','es_ES','Solicitud de revisión de artículo','{$reviewerName}:<br />\nLe recordamos nuestra petición acerca de la revisión del envío &quot;{$submissionTitle},&quot; para {$contextName}. Esperábamos tener esta revisión como muy tarde el {$responseDueDate}, por lo cual este correo electrónico se ha generado automáticamente y se ha enviado una vez pasada dicha fecha.\n<br />\nEl resumen del envío se ha insertado a continuación. Creemos que sería un excelente revisor para este artículo, por lo que esperamos que reconsidere llevar a cabo esta importante tarea para nosotros.<br />\n<br />\nPor favor, ingrese en la página web de la revista para indicar si realizará o no la revisión, y en caso afirmativo para acceder al envío y registrar su revisión y su recomendación. El sitio web es {$contextUrl}<br />\n<br />\nLa fecha límite para la revisión es el {$reviewDueDate}.<br />\n<br />\nSi no dispone de un nombre de usuario/a y contraseña para el sitio web de la revista, puede hacer clic en este enlace para restablecer su contraseña (se la enviaremos junto con su nombre de usuario/a). {$passwordResetUrl}<br />\n<br />\nURL del envío: {$submissionReviewUrl}<br />\n<br />\nGracias por considerar esta petición.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}','Este correo electrónico se envía automáticamente cuando transcurre la fecha de entrega del revisor/a (vea las opciones de revisión en el paso 2 de la configuración de la revista) y se deshabilita el acceso al revisor/a con un solo clic. Las tareas planificadas se deben habilitar y configurar (vea el archivo de configuración del sitio).'),('REVIEW_REQUEST_REMIND_AUTO_ONECLICK','en_US','Article Review Request','{$reviewerName}:<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have your response by {$responseDueDate}, and this email has been automatically generated and sent with the passing of that date.\n<br />\nI believe that you would serve as an excellent reviewer of the manuscript. The submission\'s abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br />\n<br />\nPlease log into the journal web site to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}','This email is automatically sent when a reviewer\'s confirmation due date elapses (see Review Options under Settings > Workflow > Review) and one-click reviewer access is enabled. Scheduled tasks must be enabled and configured (see the site configuration file).'),('REVIEW_REQUEST_REMIND_AUTO_ONECLICK','es_ES','Solicitud de revisión de artículo','{$reviewerName}:<br />\nLe recordamos nuestra petición acerca de la revisión del envío &quot;{$submissionTitle},&quot; para {$contextName}. Esperábamos tener esta revisión como muy tarde el {$responseDueDate}, por lo cual este correo electrónico se ha generado automáticamente y se ha enviado una vez pasada dicha fecha.\n<br />\nEl resumen del envío se ha insertado a continuación. Creemos que sería un excelente revisor para este artículo, por lo que esperamos que reconsidere llevar a cabo esta importante tarea para nosotros.<br />\n<br />\nPor favor, ingrese en la página web de la revista para indicar si realizará o no la revisión, y en caso afirmativo para acceder al envío y registrar su revisión y su recomendación. <br />\n<br />\nLa fecha límite para la revisión es el {$reviewDueDate}.<br />\n<br />\nURL del envío: {$submissionReviewUrl}<br />\n<br />\nGracias por considerar esta petición.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}','Este correo electrónico se envía automáticamente cuando transcurre la fecha de entrega del revisor/a (vea las opciones de revisión en el paso 2 de la configuración de la revista) y se habilita el acceso al revisor/a con un solo clic. Las tareas planificadas se deben habilitar y configurar (vea el archivo de configuración del sitio).'),('REVIEW_REQUEST_SUBSEQUENT','en_US','Article Review Request','{$reviewerName}:<br />\n<br />\nThis regards the manuscript &quot;{$submissionTitle},&quot; which is under consideration by {$contextName}.<br />\n<br />\nFollowing the review of the previous version of the manuscript, the authors have now submitted a revised version of their paper. We would appreciate it if you could help evaluate it.<br />\n<br />\nPlease log into the journal web site by {$responseDueDate} to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation. The web site is {$contextUrl}<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nIf you do not have your username and password for the journal\'s web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}','This email from the Section Editor to a Reviewer requests that the reviewer accept or decline the task of reviewing a submission for a second or greater round of review. It provides information about the submission such as the title and abstract, a review due date, and how to access the submission itself. This message is used when the Standard Review Process is selected in Management > Settings > Workflow > Review. (Otherwise see REVIEW_REQUEST_ATTACHED_SUBSEQUENT.)'),('REVIEW_REQUEST_SUBSEQUENT','es_ES','Solicitud de revisión de artículo','{$reviewerName}:<br />\n<br />\nEste correo es en referencia al manuscrito &quot;{$submissionTitle},&quot;, que {$contextName} está considerando.<br />\n<br />\nDespués de la revisión de la versión previa del manuscrito, los autores/as han enviado una versión revisada de su artículo. Le agradeceríamos mucho si pudiera ayudarnos a evaluarla.<br />\n<br />\nInicie sesión en el sitio web de la revista antes del {$responseDueDate} para indicar si llevará a cabo la revisión o no, además de para obtener acceso al envío y registrar su revisión y recomendación. El sitio web es {$contextUrl}<br />\n<br />\nLa fecha límite para entregar la revisión es el {$reviewDueDate}.<br />\n<br />\nSi no dispone de un nombre de usuario/a y contraseña para el sitio web de la revista, puede hacer clic en este enlace para restablecer su contraseña (se la enviaremos junto con su nombre de usuario/a). {$passwordResetUrl}<br />\n<br />\nURL del envío: {$submissionReviewUrl}<br />\n<br />\nGracias por considerar esta solicitud.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}','Este correo electrónico del editor/a de sección a un revisor/a solicita que el revisor/a acepte o rechace la tarea de revisar un envío para una ronda de revisión adicional. Además, proporciona información sobre el envío como el título, el resumen, la fecha de entrega de la revisión y cómo obtener acceso al propio envío. Este mensaje se usa cuando se selecciona el proceso de revisión estándar en el paso 2 de la configuración de la revista. (Por lo demás, vea SOLICITUD_DE_REVISIÓN_POSTERIOR _ADJUNTA).'),('REVIEW_REQUEST_SUBSEQUENT','pt_BR','Solicitação de avaliação de artigo','{$reviewerName}:<br />\n<br />\nEsta mensagem está relacionada ao trabalho &quot;{$submissionTitle},&quot; que está em processo de avaliação na publicação {$contextName}.<br />\n<br />\nSeguindo o processo de de avaliação da versão anterior, os autores encaminharam uma versão revisada. Nos seria de grande valia se pudesse ajudar a avaliar essa nova versão.<br />\n<br />\nPara tanto, acesse o sistema da revista até {$responseDueDate} para indicar se aceita ou não assumir a avaliação, bem como acessar os dados da submissão e registrar sua avaliação e recomendação. O site da revista é {$contextUrl}<br />\n<br />\nA avaliação deve ser concluída até{$reviewDueDate}.<br />\n<br />\nCaso não possua seu login e senha para acesso, use o link a seguir para criar uma nova senha (que será encaminha via e-mail junto com seu login). {$passwordResetUrl}<br />\n<br />\nURL da submissão: {$submissionReviewUrl}<br />\n<br />\nAgradecendo antecipadamente sua consideração em aceitar esta responsabilidade,<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}','Este e-mail a partir do Editor de Seção a um Viajante solicita que o usuário aceitar ou recusar a tarefa de rever uma submissão por um segundo ou maior rodada de avaliação. Ele fornece informações sobre a apresentação, como o título e resumo, uma revisão data de vencimento, e como acessar a própria apresentação. Esta mensagem é usada quando o Processo de Revisão Padrão é selecionado no programa de configuração Journal, Passo 2. (Otherwise see REVIEW_REQUEST_ATTACHED_SUBSEQUENT.)'),('REVISED_VERSION_NOTIFY','en_US','Revised Version Uploaded','Editors:<br />\n<br />\nA revised version of &quot;{$submissionTitle}&quot; has been uploaded by the author {$authorName}.<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\n<br />\n{$editorialContactSignature}','This email is automatically sent to the assigned editor when author uploads a revised version of an article.'),('REVISED_VERSION_NOTIFY','es_ES','Versión revisada cargada','Editores/as:<br />\n<br />\nEl autor {$authorName} ha cargado un versión revisada de &quot;{$submissionTitle}&quot;.<br />\n<br />\nURL del envío: {$submissionUrl}<br />\n<br />\n{$editorialContactSignature}','Este correo electrónico se envía de forma automática al editor/a asignado cuando el autor/a carga una versión revisada de un artículo.'),('REVISED_VERSION_NOTIFY','pt_BR','Envio de versão atualizada','{$editorialContactName},<br />\n<br />\nUma versão atualizada de &quot;{$submissionTitle}&quot; foi enviada pelo autor {$authorName}.<br />\n<br />\nURL da submissão: {$submissionUrl}<br />\n<br />\n{$editorialContactSignature}','This email is automatically sent to the assigned editor when author uploads a revised version of an article.'),('SUBMISSION_ACK','en_US','Submission Acknowledgement','{$authorName}:<br />\n<br />\nThank you for submitting the manuscript, &quot;{$submissionTitle}&quot; to {$contextName}. With the online journal management system that we are using, you will be able to track its progress through the editorial process by logging in to the journal web site:<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$authorUsername}<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this journal as a venue for your work.<br />\n<br />\n{$editorialContactSignature}','This email, when enabled, is automatically sent to an author when he or she completes the process of submitting a manuscript to the journal. It provides information about tracking the submission through the process and thanks the author for the submission.'),('SUBMISSION_ACK','es_ES','Acuse de recibo del envío','{$authorName}:<br />\n<br />\nGracias por enviar el manuscrito &quot;{$submissionTitle}&quot; a {$contextName}. Con el sistema de gestión de publicaciones en línea que utilizamos podrá seguir el progreso a través del proceso editorial tras iniciar sesión en el sitio web de la publicación:<br />\n<br />\nURL del manuscrito: {$submissionUrl}<br />\nNombre de usuario/a: {$authorUsername}<br />\n<br />\nSi tiene alguna duda puede ponerse en contacto conmigo. Gracias por elegir esta editorial para mostrar su trabajo.<br />\n<br />\n{$editorialContactSignature}','Este correo electrónico, si está activado, se envía automáticamente a un autor/a cuando completa el proceso de envío de un manuscrito a la editorial. Proporciona información sobre el seguimiento del envío en el proceso y agradece al autor/a el envío.'),('SUBMISSION_ACK','pt_BR','Agradecimento pela submissão','{$authorName},<br />\n<br />\nAgradecemos a submissão do trabalho &quot;{$submissionTitle}&quot; para a revista {$contextName}.<br />\nAcompanhe o progresso da sua submissão por meio da interface de administração do sistema, disponível em:<br />\n<br />\nURL da submissão: {$submissionUrl}<br />\nLogin: {$authorUsername}<br />\n<br />\nEm caso de dúvidas,  entre em contato via e-mail.<br />\n<br />\nAgradecemos mais uma vez considerar nossa revista como meio de compartilhar seu trabalho.<br />\n<br />\n{$editorialContactSignature}','Mensagem enviada automaticamente pelo sistema ao autor, quando habilitada, ao ser concluído o processo de submissão de um trabalho à revista. Oferece informações sobre os mecanismos para acompanhamento do trabalho durante o processo editorial, e serve como registro e confirmação da submissão.'),('SUBMISSION_ACK_NOT_USER','en_US','Submission Acknowledgement','Hello,<br />\n<br />\n{$submitterName} has submitted the manuscript, &quot;{$submissionTitle}&quot; to {$contextName}. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this journal as a venue for your work.<br />\n<br />\n{$editorialContactSignature}','This email, when enabled, is automatically sent to the other authors who are not users within OJS specified during the submission process.'),('SUBMISSION_ACK_NOT_USER','es_ES','Acuse de recibo del envío','Hola,<br />\n<br />\n{$submitterName} ha enviado el manuscrito &quot;{$submissionTitle}&quot; a {$contextName}. <br />\n<br />\nSi tiene cualquier pregunta no dude en contactarme. Le agradecemos que haya elegido esta revista para dar a conocer su obra.<br />\n<br />\n{$editorialContactSignature}','Este correo electrónico, si está activado, se envía automáticamente a los autores/as que no son usuarios/as del OJS especificado durante el proceso de envío.'),('SUBMISSION_ACK_NOT_USER','pt_BR','Agradecimento pela submissão','Olá,<br />\n<br />\n{$submitterName} submeteu o manuscrito &quot;{$submissionTitle}&quot; à editora {$contextName}. <br />\n<br />\nEm caso de dúvidas, entre em contato. Agradecemos por considerar nossa editora como um veículo para seus trabalhos.<br />\n<br />\n{$editorialContactSignature}','Quando habilitada, esta mensagem é enviada automaticamente aos coautores informados durante o processo de submissão, que não estão cadastrados no OMP.'),('SUBMISSION_COMMENT','pt_BR','Comentário sobre a submissão','{$name},<br />\n<br />\n{$commentName} enviou um comentário sobre a submissão &quot;{$submissionTitle}&quot; em {$contextName}:<br />\n<br />\n{$comments}','Mensagem notifica várias pessoas envolvidas no processo de edição de uma submissão que um comentário foi enviado.'),('SUBMISSION_DECISION_REVIEWERS','pt_BR','Decisão sobre \"{$submissionTitle}\"','Como avaliador designado para a avaliação da submissão &quot;{$submissionTitle}&quot; a {$contextName}, encaminho aqui as avaliações e a decisão editorial enviadas ao autor deste trabalho.<br />\n<br />\nAgradecemos sua contribuição, fundamental para garantir a qualidade deste processo.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n{$comments}','Mensagem notifica os avaliadores de uma submissão que o processo de avaliação foi concluído. Inclui informações sobre o artigo e a decisão tomada, além de agradecer pela contribuição.'),('SUBSCRIPTION_AFTER_EXPIRY','en_US','Subscription Expired','{$subscriberName}:<br />\n<br />\nYour {$contextName} subscription has expired.<br />\n<br />\n{$subscriptionType}<br />\nExpiry date: {$expiryDate}<br />\n<br />\nTo renew your subscription, please go to the journal website. You are able to log in to the system with your username, &quot;{$username}&quot;.<br />\n<br />\nIf you have any questions, please feel free to contact me.<br />\n<br />\n{$subscriptionContactSignature}','This email notifies a subscriber that their subscription has expired. It provides the journal\'s URL along with instructions for access.'),('SUBSCRIPTION_AFTER_EXPIRY','es_ES','Subscripción expirada','{$subscriberName}:<br />\n<br />\n	Su subscripción a {$contextName} ha expirado.<br />\n<br />\n	{$subscriptionType}<br />\n	Fecha de expiración: {$expiryDate}<br />\n<br />\n	Para renovar su suscripción entre en la página web de la revista.  Puede acceder al sistema con su nombre de usuario, &quot;{$username}&quot;.<br />\n<br />\n	Si tiene cualquier pregunta no dude en contactarme.<br />\n<br />\n	{$subscriptionContactSignature}','Este correo notifica al suscriptor que su subscripción ha expirado.  También proporciona el URL de la revista con las instrucciones para acceder.'),('SUBSCRIPTION_AFTER_EXPIRY','pt_BR','Expiração de assinatura','{$subscriberName},<br />\n<br />\nSua assinatura de {$contextName} expirou.<br />\n<br />\n{$subscriptionType}<br />\nData de expiração: {$expiryDate}<br />\n<br />\nPara renovar sua assinatura, acesse o sistema com seu login &quot;{$username}&quot;.<br />\n<br />\nEm caso de dúvidas, entre em contato via e-mail.<br />\n<br />\n{$subscriptionContactSignature}','Esta mensagem avisa o assinante da expiração da assinatura. Informa a URL da revista e instruções de acesso.'),('SUBSCRIPTION_AFTER_EXPIRY_LAST','en_US','Subscription Expired - Final Reminder','{$subscriberName}:<br />\n<br />\nYour {$contextName} subscription has expired.<br />\nPlease note that this is the final reminder that will be emailed to you.<br />\n<br />\n{$subscriptionType}<br />\nExpiry date: {$expiryDate}<br />\n<br />\nTo renew your subscription, please go to the journal website. You are able to log in to the system with your username, &quot;{$username}&quot;.<br />\n<br />\nIf you have any questions, please feel free to contact me.<br />\n<br />\n{$subscriptionContactSignature}','This email notifies a subscriber that their subscription has expired. It provides the journal\'s URL along with instructions for access.'),('SUBSCRIPTION_AFTER_EXPIRY_LAST','es_ES','Suscripción expirada - Último recordatorio','{$subscriberName}:<br />\n<br />\n	Su suscripción a {$contextName} ha expirado.<br />\n	Tenga en cuenta que este es el último correo que recibirá para recordárselo.<br />\n<br />\n	{$subscriptionType}<br />\n	Fecha de expiración: {$expiryDate}<br />\n<br />\n	Para renovar su suscripción entre en la página web de la revista.  Puede acceder al sistema con su nombre de usuario/a, &quot;{$username}&quot;.<br />\n<br />\n	Si tiene cualquier pregunta no dude en contactarme.<br />\n<br />\n	{$subscriptionContactSignature}','Este correo notifica al suscriptor que su subscripción ha expirado.  También proporciona el URL de la revista con las instrucciones para acceder.'),('SUBSCRIPTION_AFTER_EXPIRY_LAST','pt_BR','Expiração de assinatura - Lembrete final','{$subscriberName},<br />\n<br />\nSua assinatura da revista {$contextName} expirou.<br />\nEste é o lembrete final que será enviado pelo sistema.<br />\n<br />\n{$subscriptionType}<br />\nData de expiração: {$expiryDate}<br />\n<br />\nPara renovar sua assinatura, acesse o sistema, com seu login &quot;{$username}&quot;.<br />\n<br />\nEm caso de dúvidas, entre em contato via e-mail.<br />\n<br />\n{$subscriptionContactSignature}','Esta mensagem é o último aviso ao assinante da expiração da assinatura. Informa a URL da revista e instruções de acesso.'),('SUBSCRIPTION_BEFORE_EXPIRY','en_US','Notice of Subscription Expiry','{$subscriberName}:<br />\n<br />\nYour {$contextName} subscription is about to expire.<br />\n<br />\n{$subscriptionType}<br />\nExpiry date: {$expiryDate}<br />\n<br />\nTo ensure the continuity of your access to this journal, please go to the journal website and renew your subscription. You are able to log in to the system with your username, &quot;{$username}&quot;.<br />\n<br />\nIf you have any questions, please feel free to contact me.<br />\n<br />\n{$subscriptionContactSignature}','This email notifies a subscriber that their subscription will soon expire. It provides the journal\'s URL along with instructions for access.'),('SUBSCRIPTION_BEFORE_EXPIRY','es_ES','Notificación de expiración de suscripción','{$subscriberName}:<br />\n<br />\n	Su suscripción a {$contextName} está a punto de expirar.<br />\n<br />\n	{$subscriptionType}<br />\n	Fecha de expiración: {$expiryDate}<br />\n<br />\n	Para asegurarse de que continúa teniendo acceso a la revista entre en la página web de la revista y renueve su suscripción.  Puede acceder al sistema con su nombre de usuario/a, &quot;{$username}&quot;.<br />\n<br />\n	Si tiene cualquier pregunta no dude en contactarme.<br />\n<br />\n	{$subscriptionContactSignature}','Este correo notifica al suscriptor que su susscripción va a expirar pronto.  También proporciona el URL de la revista e instrucciones para acceder.'),('SUBSCRIPTION_BEFORE_EXPIRY','pt_BR','Aviso de expiração de assinatura','{$subscriberName},<br />\n<br />\nSua assinatura da revista {$contextName} está prestes a expirar.<br />\n<br />\n{$subscriptionType}<br />\nData de expiração: {$expiryDate}<br />\n<br />\nPara garantir a continuidade de acesso à revista, acesse o sistema com o seu login &quot;{$username}&quot; e renove sua assinatura.<br />\n<br />\nEm caso de dúvidas, entre em contato via e-mail.<br />\n<br />\n{$subscriptionContactSignature}','Esta mensagem avisa o assinante da proximidade do término da assinatura. Informa a URL da revista e instruções de acesso.'),('SUBSCRIPTION_NOTIFY','en_US','Subscription Notification','{$subscriberName}:<br />\n<br />\nYou have now been registered as a subscriber in our online journal management system for {$contextName}, with the following subscription:<br />\n<br />\n{$subscriptionType}<br />\n<br />\nTo access content that is available only to subscribers, simply log in to the system with your username, &quot;{$username}&quot;.<br />\n<br />\nOnce you have logged in to the system you can change your profile details and password at any point.<br />\n<br />\nPlease note that if you have an institutional subscription, there is no need for users at your institution to log in, since requests for subscription content will be automatically authenticated by the system.<br />\n<br />\nIf you have any questions, please feel free to contact me.<br />\n<br />\n{$subscriptionContactSignature}','This email notifies a registered reader that the Manager has created a subscription for them. It provides the journal\'s URL along with instructions for access.'),('SUBSCRIPTION_NOTIFY','es_ES','Notificación de suscripción','{$subscriberName}:<br />\n<br />\nAcaba de registrarse como suscriptor/a en nuestro sistema de gestión de revistas online para la revista {$contextName}, a continuación le mostramos los datos de su suscripción:<br />\n<br />\n{$subscriptionType}<br />\n<br />\nPara acceder al contenido exclusivo para suscriptores/as, simplemente tiene que identificarse con su nombre de usuaria/o, &quot;{$username}&quot;.<br />\n<br />\nUna vez se haya identificado en el sistema puede cambiar los detalles de su perfil y su contraseña en cualquier momento.<br />\n<br />\nTenga en cuenta que si se trata de una suscripción institucional no es necesario que los/as usuarios/as de su institución se identifiquen, ya que las peticiones de contenido bajo suscripción serán autentificadas automáticamente por el sistema.<br />\n<br />\nSi tiene cualquier pregunta no dude en contactar con nosotros/as.<br />\n<br />\n{$subscriptionContactSignature}','Este correo notifica a un/a lector/a registrado/a que el/la Gestor/a les ha creado una suscripción. Proporciona la URL de la revista junto con instrucciones para acceder a ella.'),('SUBSCRIPTION_NOTIFY','pt_BR','Confirmação de assinatura','{$subscriberName},<br />\n<br />\nVocê se tornou assinante da revista {$contextName}, que possui um sistema de gerenciamento online, com os seguintes dados:<br />\n<br />\nTipo de assinatura:<br />\n{$subscriptionType}<br />\n<br />\nPara acessar o conteúdo exclusivo a assinantes basta entrar no sistema com seu login &quot;{$username}&quot; e senha.<br />\n<br />\nUma vez logado no sistema é possível modificar os dados do seu perfil e sua senha a qualquer momento.<br />\n<br />\nEm caso de assinatura institucional, não há necessidade de usuários acessando a partir da instituição logarem no sistema, já que o acesso ao conteúdo para assinantes é autenticado automaticamente.<br />\n<br />\nEm caso de dúvidas, entre em contato via e-mail.<br />\n<br />\n{$subscriptionContactSignature}','Mensagem notifica o leitor cadastrado que o Editor criou sua Assinatura. Proporciona todas as informações necessárias para acesso ao conteúdo.'),('SUBSCRIPTION_PURCHASE_INDL','en_US','Subscription Purchase: Individual','An individual subscription has been purchased online for {$contextName} with the following details.<br />\n<br />\nSubscription Type:<br />\n{$subscriptionType}<br />\n<br />\nUser:<br />\n{$userDetails}<br />\n<br />\nMembership Information (if provided):<br />\n{$membership}<br />\n<br />\nTo view or edit this subscription, please use the following URL.<br />\n<br />\nSubscription URL: {$subscriptionUrl}<br />\n','This email notifies the Subscription Manager that an individual subscription has been purchased online. It provides summary information about the subscription and a quick access link to the purchased subscription.'),('SUBSCRIPTION_PURCHASE_INDL','es_ES','Compra de suscripción: Individual','Se ha adquirido en línea una suscripción individual para {$contextName} con los detalles siguientes:<br />\n<br />\nTipo de suscripción:<br />\n{$subscriptionType}<br />\n<br />\nUsuario/a:<br />\n{$userDetails}<br />\n<br />\nInformación de membresía (si se proporciona):<br />\n{$membership}<br />\n<br />\nPara ver o editar esta suscripción, use la siguiente URL.<br />\n<br />\nURL de la suscripción: {$subscriptionUrl}','Este correo notifica al administrador/a de suscripciones que una suscripción individual ha sido adquirida online. Proporciona un resumen de la información sobre la suscripción y un enlace de acceso rápido a la suscripción adquirida.'),('SUBSCRIPTION_PURCHASE_INDL','pt_BR','Aquisição de Assinatura: Individual','Uma assinatura individual para a revista {$contextName} foi adquirida online, detalhada a seguir.<br />\n<br />\nTipo de assinatura:<br />\n{$subscriptionType}<br />\n<br />\nUsuário:<br />\n{$userDetails}<br />\n<br />\nRegistro em entidade de classe (caso informado):<br />\n{$membership}<br />\n<br />\nPara visualizar ou editar esta assinatura, acesse a URL a seguir.<br />\n<br />\nURL da assinatura: {$subscriptionUrl}','Esta mensagem notifica o Gerente de Assinaturas que uma assinatura individual foi adquirida online. Oferece informações sobre a assinatura e um link para acesso rápido à mesma.'),('SUBSCRIPTION_PURCHASE_INSTL','en_US','Subscription Purchase: Institutional','An institutional subscription has been purchased online for {$contextName} with the following details. To activate this subscription, please use the provided Subscription URL and set the subscription status to \'Active\'.<br />\n<br />\nSubscription Type:<br />\n{$subscriptionType}<br />\n<br />\nInstitution:<br />\n{$institutionName}<br />\n{$institutionMailingAddress}<br />\n<br />\nDomain (if provided):<br />\n{$domain}<br />\n<br />\nIP Ranges (if provided):<br />\n{$ipRanges}<br />\n<br />\nContact Person:<br />\n{$userDetails}<br />\n<br />\nMembership Information (if provided):<br />\n{$membership}<br />\n<br />\nTo view or edit this subscription, please use the following URL.<br />\n<br />\nSubscription URL: {$subscriptionUrl}<br />\n','This email notifies the Subscription Manager that an institutional subscription has been purchased online. It provides summary information about the subscription and a quick access link to the purchased subscription.'),('SUBSCRIPTION_PURCHASE_INSTL','es_ES','Compra de suscripción: Institucional','Se ha adquirido en línea una suscripción institucional para {$contextName} con los siguientes detalles. Para activar la suscripción, use el enlace proporcionado y configure el estado de la suscripción como \'Activo\'.<br />\n<br />\nTipo de suscripción:<br />\n{$subscriptionType}<br />\n<br />\nInstitución:<br />\n{$institutionName}<br />\n{$institutionMailingAddress}<br />\n<br />\nDominio (si se proporciona):<br />\n{$domain}<br />\n<br />\nRangos de IP (si se proporcionan):<br />\n{$ipRanges}<br />\n<br />\nPersona de contacto:<br />\n{$userDetails}<br />\n<br />\nInformación de membresía (si se proporciona):<br />\n{$membership}<br />\n<br />\nPara ver o editar esta suscripción, use el siguiente enlace.<br />\n<br />\nEnlace de la suscripción: {$subscriptionUrl}','Este correo notifica al administrador/a de suscripciones que una suscripción institucional ha sido adquirida en línea. Proporciona información resumida sobre la suscripción y un enlace de acceso rápido a la suscripción adquirida.'),('SUBSCRIPTION_PURCHASE_INSTL','pt_BR','Aquisição de Assinatura: Institucional','Uma assinatura institucional para a revista {$contextName} foi adquirida online, detalhada a seguir.<br />\nPara ativar esta assinatura, clique na URL da assinatura e define a situação para \'Ativo\'.<br />\n<br />\nTipo de assinatura:<br />\n{$subscriptionType}<br />\n<br />\nInstituição:<br />\n{$institutionName}<br />\n{$institutionMailingAddress}<br />\n<br />\nDomínio (caso informado):<br />\n{$domain}<br />\n<br />\nFaixas de IP (caso informado):<br />\n{$ipRanges}<br />\n<br />\nContato:<br />\n{$userDetails}<br />\n<br />\nRegistro em entidade de classe (caso informado):<br />\n{$membership}<br />\n<br />\nPara visualizar ou editar esta assinatura, acesse a URL a seguir.<br />\n<br />\nURL da assinatura: {$subscriptionUrl}','Esta mensagem notifica o Editor Gerente que uma assinatura institucional foi adquirida online. Oferece informações sobre a assinatura e um link para acesso rápido à mesma.'),('SUBSCRIPTION_RENEW_INDL','en_US','Subscription Renewal: Individual','An individual subscription has been renewed online for {$contextName} with the following details.<br />\n<br />\nSubscription Type:<br />\n{$subscriptionType}<br />\n<br />\nUser:<br />\n{$userDetails}<br />\n<br />\nMembership Information (if provided):<br />\n{$membership}<br />\n<br />\nTo view or edit this subscription, please use the following URL.<br />\n<br />\nSubscription URL: {$subscriptionUrl}<br />\n','This email notifies the Subscription Manager that an individual subscription has been renewed online. It provides summary information about the subscription and a quick access link to the renewed subscription.'),('SUBSCRIPTION_RENEW_INDL','es_ES','Renovación de suscripción: Individual','Una suscripción individual ha sido renovada en línea para {$contextName} con los siguientes detalles.<br />\n<br />\nTipo de suscripción:<br />\n{$subscriptionType}<br />\n<br />\nUsuario/a:<br />\n{$userDetails}<br />\n<br />\nInformación de membresía (si se proporciona):<br />\n{$membership}<br />\n<br />\nPara ver o editar esta suscripción use la siguiente URL:<br />\n<br />\nURL para gestionar la suscripción: {$subscriptionUrl}','Este correo notifica al administrador/a de suscripciones que una suscripción individual se ha renovado en línea. Proporciona información resumida sobre la suscripción y  un enlace de acceso rápido a la suscripción renovada.'),('SUBSCRIPTION_RENEW_INDL','pt_BR','Renovação de Assinatura Individual','Uma assinatura individual para a revista {$contextName} foi renovada online, detalhada a seguir.<br />\n<br />\nTipo de assinatura:<br />\n{$subscriptionType}<br />\n<br />\nUsuário:<br />\n{$userDetails}<br />\n<br />\nRegistro em entidade de classe (caso informado):<br />\n{$membership}<br />\n<br />\nPara visualizar ou editar esta assinatura, acesse a URL a seguir.<br />\n<br />\nURL: {$subscriptionUrl}','Esta mensagem notifica o Editor Gerente que uma assinatura individual foi renovada online. Oferece informações sobre a assinatura e um link para acesso rápido à mesma.'),('SUBSCRIPTION_RENEW_INSTL','en_US','Subscription Renewal: Institutional','An institutional subscription has been renewed online for {$contextName} with the following details.<br />\n<br />\nSubscription Type:<br />\n{$subscriptionType}<br />\n<br />\nInstitution:<br />\n{$institutionName}<br />\n{$institutionMailingAddress}<br />\n<br />\nDomain (if provided):<br />\n{$domain}<br />\n<br />\nIP Ranges (if provided):<br />\n{$ipRanges}<br />\n<br />\nContact Person:<br />\n{$userDetails}<br />\n<br />\nMembership Information (if provided):<br />\n{$membership}<br />\n<br />\nTo view or edit this subscription, please use the following URL.<br />\n<br />\nSubscription URL: {$subscriptionUrl}<br />\n','This email notifies the Subscription Manager that an institutional subscription has been renewed online. It provides summary information about the subscription and a quick access link to the renewed subscription.'),('SUBSCRIPTION_RENEW_INSTL','es_ES','Renovación de suscripción: Institucional','Se ha renovado en línea una suscripción institucional para {$contextName} con los detalles siguientes.<br />\n<br />\nTipo de suscripción:<br />\n{$subscriptionType}<br />\n<br />\nInstitución:<br />\n{$institutionName}<br />\n{$institutionMailingAddress}<br />\n<br />\nDominio (si se proporciona):<br />\n{$domain}<br />\n<br />\nRangos IP (si se proporcionan):<br />\n{$ipRanges}<br />\n<br />\nPersona de contacto:<br />\n{$userDetails}<br />\n<br />\nInformación de membresía (si se proporciona):<br />\n{$membership}<br />\n<br />\nPara ver o editar esta suscripción use la siguiente URL:<br />\n<br />\nURL para gestionar la suscripción: {$subscriptionUrl}','Este correo notifica al administrador/a de suscripciones que una suscripción institucional ha sido renovada en línea. Proporciona información resumida de la suscripción y un enlace de acceso rápido a la suscripción renovada.'),('SUBSCRIPTION_RENEW_INSTL','pt_BR','Renovação de Assinatura Institucional','Uma assinatura institucional para a revista {$contextName} foi renovada online, detalhada a seguir.<br />\n<br />\nTipo de assinatura:<br />\n{$subscriptionType}<br />\n<br />\nInstituição:<br />\n{$institutionName}<br />\n{$institutionMailingAddress}<br />\n<br />\nDomínio (caso informado):<br />\n{$domain}<br />\n<br />\nFaixas de IP (caso informado):<br />\n{$ipRanges}<br />\n<br />\nContato:<br />\n{$userDetails}<br />\n<br />\nRegistro em entidade de classe (caso informado):<br />\n{$membership}<br />\n<br />\nPara visualizar ou editar esta assinatura, acesse a URL a seguir.<br />\n<br />\nURL: {$subscriptionUrl}','Esta mensagem notifica o Editor Gerente que uma assinatura institucional foi renovada online. Oferece informações sobre a assinatura e um link para acesso rápido à mesma.'),('USER_REGISTER','en_US','Journal Registration','{$userFullName}<br />\n<br />\nYou have now been registered as a user with {$contextName}. We have included your username and password in this email, which are needed for all work with this journal through its website. At any point, you can ask to be removed from the journal\'s list of users by contacting me.<br />\n<br />\nUsername: {$username}<br />\nPassword: {$password}<br />\n<br />\nThank you,<br />\n{$principalContactSignature}','This email is sent to a newly registered user to welcome them to the system and provide them with a record of their username and password.'),('USER_REGISTER','es_ES','Nuevo registro de usuaria/o','Gracias por registrarse como usuaria/o en {$contextName}. Por favor, guarde en lugar seguro su nombre de usuaria/o y contraseña, ya que son necesarios para trabajar con la revista.<br />\n<br />\nNombre de usuario/a: {$username}<br />\nContraseña: {$password}<br />\n<br />\nGracias,<br />\n{$principalContactSignature}','Este correo se envía a un/a usuario/a que se acaba de registrar para darle la bienvenida al sistema y proporcionarle sus datos de acceso.'),('USER_REGISTER','pt_BR','Novo usuário cadastrado','{$userFullName},<br />\n<br />\nAgradecemos o seu cadastro no sistema da revista {$contextName}. Guarde o login e a senha, pois serão necessários para todos os trabalhos junto à revista. Caso deseje ser removido do sistema, entre em contato.<br />\n<br />\nLogin: {$username}<br />\nSenha: {$password}<br />\n<br />\nAgradecendo desde já a atenção dispensada,<br />\n{$principalContactSignature}','Mensagem enviada aos usuários recém-cadastrados no sistema, para acolhê-los e proporcionar um registro pessoal do login e da senha.'),('USER_VALIDATE','en_US','Validate Your Account','{$userFullName}<br />\n<br />\nYou have created an account with {$contextName}, but before you can start using it, you need to validate your email account. To do this, simply follow the link below:<br />\n<br />\n{$activateUrl}<br />\n<br />\nThank you,<br />\n{$principalContactSignature}','This email is sent to a newly registered user to validate their email account.'),('USER_VALIDATE','es_ES','Activación de cuenta','Estimada/o {$userFullName}<br />\n<br />\nSe ha recibido una solicitud de cuenta de usuario para la revista {$contextName} utilizando su dirección de correo. Si desea activar su cuenta en {$contextName}, pulse por favor sobre el vínculo siguiente:<br />\n<br />\n{$activateUrl}<br />\n<br />\nMuchas gracias por su interés.',NULL),('USER_VALIDATE','pt_BR','Validação de cadastro','{$userFullName},<br />\n<br />\nSeu cadastro foi criado na revista {$contextName}, porém é necessário validar o endereço de e-mail para finalizar o processo.<br />\nPara validar seu cadastro e acessar o sistema e seus recursos, acesse a URL a seguir:<br />\n<br />\n{$activateUrl}<br />\n<br />\nAtenciosamente,<br />\n<br />\n{$principalContactSignature}','Mensagem de boas-vindas enviada a novo usuário cadastrado, para ativação de cadastro.');
/*!40000 ALTER TABLE `email_templates_default_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_log`
--

DROP TABLE IF EXISTS `event_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  `date_logged` datetime NOT NULL,
  `ip_address` varchar(39) NOT NULL,
  `event_type` bigint(20) DEFAULT NULL,
  `message` text,
  `is_translated` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `event_log_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_log`
--

LOCK TABLES `event_log` WRITE;
/*!40000 ALTER TABLE `event_log` DISABLE KEYS */;
INSERT INTO `event_log` VALUES (1,515,1,6,'2019-10-28 16:14:09','190.108.84.115',1342177281,'submission.event.fileUploaded',0),(2,1048585,1,6,'2019-10-28 16:14:31','190.108.84.115',1342177281,'submission.event.fileUploaded',0),(3,1048585,1,6,'2019-10-28 16:18:00','190.108.84.115',1342177281,'submission.event.fileUploaded',0),(4,1048585,1,6,'2019-10-28 16:26:41','190.108.84.115',268435457,'submission.event.submissionSubmitted',0),(5,1048585,1,6,'2019-10-28 16:39:36','190.108.84.115',805306371,'log.editor.decision',0),(6,1048585,1,6,'2019-10-28 16:39:55','190.108.84.115',805306371,'log.editor.decision',0),(7,1048585,1,6,'2019-10-28 16:40:44','190.108.84.115',268435464,'submission.event.issueMetadataUpdated',0),(8,515,3,6,'2019-10-29 14:47:53','181.176.107.252',1342177281,'submission.event.fileUploaded',0),(9,1048585,1,6,'2019-10-29 14:50:31','181.176.107.252',1342177281,'submission.event.fileUploaded',0),(10,1048585,1,6,'2019-10-29 15:01:59','181.176.107.252',268435458,'submission.event.general.metadataUpdated',0);
/*!40000 ALTER TABLE `event_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_log_settings`
--

DROP TABLE IF EXISTS `event_log_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_log_settings` (
  `log_id` bigint(20) NOT NULL,
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `event_log_settings_pkey` (`log_id`,`setting_name`),
  KEY `event_log_settings_log_id` (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_log_settings`
--

LOCK TABLES `event_log_settings` WRITE;
/*!40000 ALTER TABLE `event_log_settings` DISABLE KEYS */;
INSERT INTO `event_log_settings` VALUES (1,'fileId','1','int'),(1,'fileRevision','1','int'),(1,'fileStage','2','int'),(1,'originalFileName','ARTICULO1-RC-2016.pdf','string'),(1,'revisedFileId',NULL,'string'),(1,'submissionId','1','int'),(1,'username','abarturen','string'),(2,'fileId','1','int'),(2,'fileRevision','1','int'),(2,'fileStage','2','int'),(2,'name','abarturen, ARTICULO1-RC-2016.pdf','string'),(2,'originalFileName','ARTICULO1-RC-2016.pdf','string'),(2,'submissionId','1','int'),(2,'username','abarturen','string'),(3,'fileId','1','int'),(3,'fileRevision','1','int'),(3,'fileStage','2','int'),(3,'name','Diversidad de la Familia Solanaceae en dos áreas naturales protegidas del Perú','string'),(3,'originalFileName','ARTICULO1-RC-2016.pdf','string'),(3,'submissionId','1','int'),(3,'username','abarturen','string'),(5,'decision','Aceptar y omitir la revisión','string'),(5,'editorName','Ada Patricia Barturén Quispe','string'),(5,'submissionId','1','string'),(6,'decision','Enviar a producción','string'),(6,'editorName','Ada Patricia Barturén Quispe','string'),(6,'submissionId','1','string'),(8,'fileId','3','int'),(8,'fileRevision','1','int'),(8,'fileStage','10','int'),(8,'originalFileName','ARTICULO1-RC-2016.pdf','string'),(8,'revisedFileId',NULL,'string'),(8,'submissionId','1','int'),(8,'username','abarturen','string'),(9,'fileId','3','int'),(9,'fileRevision','1','int'),(9,'fileStage','10','int'),(9,'name','Diversidad de la Familia Solanaceae en dos áreas naturales protegidas del Perú','string'),(9,'originalFileName','ARTICULO1-RC-2016.pdf','string'),(9,'submissionId','1','int'),(9,'username','abarturen','string');
/*!40000 ALTER TABLE `event_log_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filter_groups`
--

DROP TABLE IF EXISTS `filter_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filter_groups` (
  `filter_group_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `symbolic` varchar(255) DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `input_type` varchar(255) DEFAULT NULL,
  `output_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`filter_group_id`),
  UNIQUE KEY `filter_groups_symbolic` (`symbolic`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filter_groups`
--

LOCK TABLES `filter_groups` WRITE;
/*!40000 ALTER TABLE `filter_groups` DISABLE KEYS */;
INSERT INTO `filter_groups` VALUES (1,'mods34=>mods34-xml','plugins.metadata.mods34.mods34XmlOutput.displayName','plugins.metadata.mods34.mods34XmlOutput.description','metadata::plugins.metadata.mods34.schema.Mods34Schema(*)','xml::schema(lib/pkp/plugins/metadata/mods34/filter/mods34.xsd)'),(2,'article=>mods34','plugins.metadata.mods34.articleAdapter.displayName','plugins.metadata.mods34.articleAdapter.description','class::classes.article.Article','metadata::plugins.metadata.mods34.schema.Mods34Schema(ARTICLE)'),(3,'mods34=>article','plugins.metadata.mods34.articleAdapter.displayName','plugins.metadata.mods34.articleAdapter.description','metadata::plugins.metadata.mods34.schema.Mods34Schema(ARTICLE)','class::classes.article.Article'),(4,'article=>dc11','plugins.metadata.dc11.articleAdapter.displayName','plugins.metadata.dc11.articleAdapter.description','class::classes.article.Article','metadata::plugins.metadata.dc11.schema.Dc11Schema(ARTICLE)'),(5,'article=>doaj-xml','plugins.importexport.doaj.displayName','plugins.importexport.doaj.description','class::classes.article.Article[]','xml::schema(plugins/importexport/doaj/doajArticles.xsd)'),(6,'article=>doaj-json','plugins.importexport.doaj.displayName','plugins.importexport.doaj.description','class::classes.article.Article','primitive::string'),(7,'issue=>crossref-xml','plugins.importexport.crossref.displayName','plugins.importexport.crossref.description','class::classes.issue.Issue[]','xml::schema(https://www.crossref.org/schemas/crossref4.3.6.xsd)'),(8,'article=>crossref-xml','plugins.importexport.crossref.displayName','plugins.importexport.crossref.description','class::classes.article.Article[]','xml::schema(https://www.crossref.org/schemas/crossref4.3.6.xsd)'),(9,'issue=>medra-xml','plugins.importexport.medra.displayName','plugins.importexport.medra.description','class::classes.issue.Issue[]','xml::schema(http://www.medra.org/schema/onix/DOIMetadata/2.0/ONIX_DOIMetadata_2.0.xsd)'),(10,'article=>medra-xml','plugins.importexport.medra.displayName','plugins.importexport.medra.description','class::classes.article.Article[]','xml::schema(http://www.medra.org/schema/onix/DOIMetadata/2.0/ONIX_DOIMetadata_2.0.xsd)'),(11,'galley=>medra-xml','plugins.importexport.medra.displayName','plugins.importexport.medra.description','class::classes.article.ArticleGalley[]','xml::schema(http://www.medra.org/schema/onix/DOIMetadata/2.0/ONIX_DOIMetadata_2.0.xsd)'),(12,'issue=>datacite-xml','plugins.importexport.datacite.displayName','plugins.importexport.datacite.description','class::classes.issue.Issue','xml::schema(http://schema.datacite.org/meta/kernel-4/metadata.xsd)'),(13,'article=>datacite-xml','plugins.importexport.datacite.displayName','plugins.importexport.datacite.description','class::classes.article.Article','xml::schema(http://schema.datacite.org/meta/kernel-4/metadata.xsd)'),(14,'galley=>datacite-xml','plugins.importexport.datacite.displayName','plugins.importexport.datacite.description','class::classes.article.ArticleGalley','xml::schema(http://schema.datacite.org/meta/kernel-4/metadata.xsd)'),(15,'user=>user-xml','plugins.importexport.users.displayName','plugins.importexport.users.description','class::lib.pkp.classes.user.User[]','xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)'),(16,'user-xml=>user','plugins.importexport.users.displayName','plugins.importexport.users.description','xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)','class::classes.users.User[]'),(17,'usergroup=>user-xml','plugins.importexport.users.displayName','plugins.importexport.users.description','class::lib.pkp.classes.security.UserGroup[]','xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)'),(18,'user-xml=>usergroup','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)','class::lib.pkp.classes.security.UserGroup[]'),(19,'article=>pubmed-xml','plugins.importexport.pubmed.displayName','plugins.importexport.pubmed.description','class::classes.article.Article[]','xml::dtd'),(20,'article=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.article.Article[]','xml::schema(plugins/importexport/native/native.xsd)'),(21,'native-xml=>article','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.article.Article[]'),(22,'issue=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.issue.Issue[]','xml::schema(plugins/importexport/native/native.xsd)'),(23,'native-xml=>issue','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.issue.Issue[]'),(24,'issuegalley=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.issue.IssueGalley[]','xml::schema(plugins/importexport/native/native.xsd)'),(25,'native-xml=>issuegalley','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.issue.IssueGalley[]'),(26,'author=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.article.Author[]','xml::schema(plugins/importexport/native/native.xsd)'),(27,'native-xml=>author','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.article.Author[]'),(28,'SubmissionFile=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::lib.pkp.classes.submission.SubmissionFile','xml::schema(plugins/importexport/native/native.xsd)'),(29,'SubmissionArtworkFile=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::lib.pkp.classes.submission.SubmissionArtworkFile','xml::schema(plugins/importexport/native/native.xsd)'),(30,'SupplementaryFile=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::lib.pkp.classes.submission.SupplementaryFile','xml::schema(plugins/importexport/native/native.xsd)'),(31,'native-xml=>SubmissionFile','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::lib.pkp.classes.submission.SubmissionFile'),(32,'native-xml=>SubmissionArtworkFile','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::lib.pkp.classes.submission.SubmissionArtworkFile'),(33,'native-xml=>SupplementaryFile','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::lib.pkp.classes.submission.SupplementaryFile'),(34,'article-galley=>native-xml','plugins.importexport.native.displayName','plugins.importexport.native.description','class::classes.article.ArticleGalley','xml::schema(plugins/importexport/native/native.xsd)'),(35,'native-xml=>ArticleGalley','plugins.importexport.native.displayName','plugins.importexport.native.description','xml::schema(plugins/importexport/native/native.xsd)','class::classes.article.ArticleGalley[]');
/*!40000 ALTER TABLE `filter_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filter_settings`
--

DROP TABLE IF EXISTS `filter_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filter_settings` (
  `filter_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `filter_settings_pkey` (`filter_id`,`locale`,`setting_name`),
  KEY `filter_settings_id` (`filter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filters` (
  `filter_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `filter_group_id` bigint(20) NOT NULL DEFAULT '0',
  `context_id` bigint(20) NOT NULL DEFAULT '0',
  `display_name` varchar(255) DEFAULT NULL,
  `class_name` varchar(255) DEFAULT NULL,
  `is_template` tinyint(4) NOT NULL DEFAULT '0',
  `parent_filter_id` bigint(20) NOT NULL DEFAULT '0',
  `seq` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`filter_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filters`
--

LOCK TABLES `filters` WRITE;
/*!40000 ALTER TABLE `filters` DISABLE KEYS */;
INSERT INTO `filters` VALUES (1,1,0,'MODS 3.4','lib.pkp.plugins.metadata.mods34.filter.Mods34DescriptionXmlFilter',0,0,0),(2,2,0,'Extract metadata from a(n) Article','plugins.metadata.mods34.filter.Mods34SchemaArticleAdapter',0,0,0),(3,3,0,'Inject metadata into a(n) Article','plugins.metadata.mods34.filter.Mods34SchemaArticleAdapter',0,0,0),(4,4,0,'Extract metadata from a(n) Article','plugins.metadata.dc11.filter.Dc11SchemaArticleAdapter',0,0,0),(5,5,0,'DOAJ XML export','plugins.importexport.doaj.filter.DOAJXmlFilter',0,0,0),(6,6,0,'DOAJ JSON export','plugins.importexport.doaj.filter.DOAJJsonFilter',0,0,0),(7,7,0,'Crossref XML issue export','plugins.importexport.crossref.filter.IssueCrossrefXmlFilter',0,0,0),(8,8,0,'Crossref XML issue export','plugins.importexport.crossref.filter.ArticleCrossrefXmlFilter',0,0,0),(9,9,0,'mEDRA XML issue export','plugins.importexport.medra.filter.IssueMedraXmlFilter',0,0,0),(10,10,0,'mEDRA XML article export','plugins.importexport.medra.filter.ArticleMedraXmlFilter',0,0,0),(11,11,0,'mEDRA XML article export','plugins.importexport.medra.filter.GalleyMedraXmlFilter',0,0,0),(12,12,0,'DataCite XML export','plugins.importexport.datacite.filter.DataciteXmlFilter',0,0,0),(13,13,0,'DataCite XML export','plugins.importexport.datacite.filter.DataciteXmlFilter',0,0,0),(14,14,0,'DataCite XML export','plugins.importexport.datacite.filter.DataciteXmlFilter',0,0,0),(15,15,0,'User XML user export','lib.pkp.plugins.importexport.users.filter.PKPUserUserXmlFilter',0,0,0),(16,16,0,'User XML user import','lib.pkp.plugins.importexport.users.filter.UserXmlPKPUserFilter',0,0,0),(17,17,0,'Native XML user group export','lib.pkp.plugins.importexport.users.filter.UserGroupNativeXmlFilter',0,0,0),(18,18,0,'Native XML user group import','lib.pkp.plugins.importexport.users.filter.NativeXmlUserGroupFilter',0,0,0),(19,19,0,'ArticlePubMedXmlFilter','plugins.importexport.pubmed.filter.ArticlePubMedXmlFilter',0,0,0),(20,20,0,'Native XML submission export','plugins.importexport.native.filter.ArticleNativeXmlFilter',0,0,0),(21,21,0,'Native XML submission import','plugins.importexport.native.filter.NativeXmlArticleFilter',0,0,0),(22,22,0,'Native XML issue export','plugins.importexport.native.filter.IssueNativeXmlFilter',0,0,0),(23,23,0,'Native XML issue import','plugins.importexport.native.filter.NativeXmlIssueFilter',0,0,0),(24,24,0,'Native XML issue galley export','plugins.importexport.native.filter.IssueGalleyNativeXmlFilter',0,0,0),(25,25,0,'Native XML issue galley import','plugins.importexport.native.filter.NativeXmlIssueGalleyFilter',0,0,0),(26,26,0,'Native XML author export','plugins.importexport.native.filter.AuthorNativeXmlFilter',0,0,0),(27,27,0,'Native XML author import','plugins.importexport.native.filter.NativeXmlAuthorFilter',0,0,0),(28,31,0,'Native XML submission file import','plugins.importexport.native.filter.NativeXmlArticleFileFilter',0,0,0),(29,32,0,'Native XML submission file import','plugins.importexport.native.filter.NativeXmlArtworkFileFilter',0,0,0),(30,33,0,'Native XML submission file import','plugins.importexport.native.filter.NativeXmlSupplementaryFileFilter',0,0,0),(31,28,0,'Native XML submission file export','lib.pkp.plugins.importexport.native.filter.SubmissionFileNativeXmlFilter',0,0,0),(32,29,0,'Native XML submission file export','plugins.importexport.native.filter.ArtworkFileNativeXmlFilter',0,0,0),(33,30,0,'Native XML submission file export','plugins.importexport.native.filter.SupplementaryFileNativeXmlFilter',0,0,0),(34,34,0,'Native XML representation export','plugins.importexport.native.filter.ArticleGalleyNativeXmlFilter',0,0,0),(35,35,0,'Native XML representation import','plugins.importexport.native.filter.NativeXmlArticleGalleyFilter',0,0,0);
/*!40000 ALTER TABLE `filters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre_settings`
--

DROP TABLE IF EXISTS `genre_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genre_settings` (
  `genre_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `genre_settings_pkey` (`genre_id`,`locale`,`setting_name`),
  KEY `genre_settings_genre_id` (`genre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre_settings`
--

LOCK TABLES `genre_settings` WRITE;
/*!40000 ALTER TABLE `genre_settings` DISABLE KEYS */;
INSERT INTO `genre_settings` VALUES (1,'en_US','name','Article Text','string'),(1,'es_ES','name','Texto del artículo','string'),(1,'pt_BR','name','Texto do artigo','string'),(2,'en_US','name','Research Instrument','string'),(2,'es_ES','name','Instrumento de investigación','string'),(2,'pt_BR','name','Instrumento de pesquisa','string'),(3,'en_US','name','Research Materials','string'),(3,'es_ES','name','Materiales de investigación','string'),(3,'pt_BR','name','Materiais de pesquisa','string'),(4,'en_US','name','Research Results','string'),(4,'es_ES','name','Resultados de la investigación','string'),(4,'pt_BR','name','Resultados de pesquisa','string'),(5,'en_US','name','Transcripts','string'),(5,'es_ES','name','Transcripciones','string'),(5,'pt_BR','name','Transcrições','string'),(6,'en_US','name','Data Analysis','string'),(6,'es_ES','name','Análisis de datos','string'),(6,'pt_BR','name','Análise de dados','string'),(7,'en_US','name','Data Set','string'),(7,'es_ES','name','Conjunto de datos','string'),(7,'pt_BR','name','Conjunto de dados','string'),(8,'en_US','name','Source Texts','string'),(8,'es_ES','name','Textos fuente','string'),(8,'pt_BR','name','Textos fonte','string'),(9,'en_US','name','Multimedia','string'),(9,'es_ES','name','Multimedia','string'),(9,'pt_BR','name','Multimedia','string'),(10,'en_US','name','Image','string'),(10,'es_ES','name','Imagen','string'),(10,'pt_BR','name','Imagem','string'),(11,'en_US','name','HTML Stylesheet','string'),(11,'es_ES','name','Hoja de estilo HTML','string'),(11,'pt_BR','name','Folha de Estilos','string'),(12,'en_US','name','Other','string'),(12,'es_ES','name','Otro','string'),(12,'pt_BR','name','Outros','string'),(13,'en_US','name','Article Text','string'),(13,'es_ES','name','Texto del artículo','string'),(13,'pt_BR','name','Texto do artigo','string'),(14,'en_US','name','Research Instrument','string'),(14,'es_ES','name','Instrumento de investigación','string'),(14,'pt_BR','name','Instrumento de pesquisa','string'),(15,'en_US','name','Research Materials','string'),(15,'es_ES','name','Materiales de investigación','string'),(15,'pt_BR','name','Materiais de pesquisa','string'),(16,'en_US','name','Research Results','string'),(16,'es_ES','name','Resultados de la investigación','string'),(16,'pt_BR','name','Resultados de pesquisa','string'),(17,'en_US','name','Transcripts','string'),(17,'es_ES','name','Transcripciones','string'),(17,'pt_BR','name','Transcrições','string'),(18,'en_US','name','Data Analysis','string'),(18,'es_ES','name','Análisis de datos','string'),(18,'pt_BR','name','Análise de dados','string'),(19,'en_US','name','Data Set','string'),(19,'es_ES','name','Conjunto de datos','string'),(19,'pt_BR','name','Conjunto de dados','string'),(20,'en_US','name','Source Texts','string'),(20,'es_ES','name','Textos fuente','string'),(20,'pt_BR','name','Textos fonte','string'),(21,'en_US','name','Multimedia','string'),(21,'es_ES','name','Multimedia','string'),(21,'pt_BR','name','Multimedia','string'),(22,'en_US','name','Image','string'),(22,'es_ES','name','Imagen','string'),(22,'pt_BR','name','Imagem','string'),(23,'en_US','name','HTML Stylesheet','string'),(23,'es_ES','name','Hoja de estilo HTML','string'),(23,'pt_BR','name','Folha de Estilos','string'),(24,'en_US','name','Other','string'),(24,'es_ES','name','Otro','string'),(24,'pt_BR','name','Outros','string'),(25,'en_US','name','Article Text','string'),(25,'es_ES','name','Texto del artículo','string'),(25,'pt_BR','name','Texto do artigo','string'),(26,'en_US','name','Research Instrument','string'),(26,'es_ES','name','Instrumento de investigación','string'),(26,'pt_BR','name','Instrumento de pesquisa','string'),(27,'en_US','name','Research Materials','string'),(27,'es_ES','name','Materiales de investigación','string'),(27,'pt_BR','name','Materiais de pesquisa','string'),(28,'en_US','name','Research Results','string'),(28,'es_ES','name','Resultados de la investigación','string'),(28,'pt_BR','name','Resultados de pesquisa','string'),(29,'en_US','name','Transcripts','string'),(29,'es_ES','name','Transcripciones','string'),(29,'pt_BR','name','Transcrições','string'),(30,'en_US','name','Data Analysis','string'),(30,'es_ES','name','Análisis de datos','string'),(30,'pt_BR','name','Análise de dados','string'),(31,'en_US','name','Data Set','string'),(31,'es_ES','name','Conjunto de datos','string'),(31,'pt_BR','name','Conjunto de dados','string'),(32,'en_US','name','Source Texts','string'),(32,'es_ES','name','Textos fuente','string'),(32,'pt_BR','name','Textos fonte','string'),(33,'en_US','name','Multimedia','string'),(33,'es_ES','name','Multimedia','string'),(33,'pt_BR','name','Multimedia','string'),(34,'en_US','name','Image','string'),(34,'es_ES','name','Imagen','string'),(34,'pt_BR','name','Imagem','string'),(35,'en_US','name','HTML Stylesheet','string'),(35,'es_ES','name','Hoja de estilo HTML','string'),(35,'pt_BR','name','Folha de Estilos','string'),(36,'en_US','name','Other','string'),(36,'es_ES','name','Otro','string'),(36,'pt_BR','name','Outros','string'),(37,'en_US','name','Article Text','string'),(37,'es_ES','name','Texto del artículo','string'),(37,'pt_BR','name','Texto do artigo','string'),(38,'en_US','name','Research Instrument','string'),(38,'es_ES','name','Instrumento de investigación','string'),(38,'pt_BR','name','Instrumento de pesquisa','string'),(39,'en_US','name','Research Materials','string'),(39,'es_ES','name','Materiales de investigación','string'),(39,'pt_BR','name','Materiais de pesquisa','string'),(40,'en_US','name','Research Results','string'),(40,'es_ES','name','Resultados de la investigación','string'),(40,'pt_BR','name','Resultados de pesquisa','string'),(41,'en_US','name','Transcripts','string'),(41,'es_ES','name','Transcripciones','string'),(41,'pt_BR','name','Transcrições','string'),(42,'en_US','name','Data Analysis','string'),(42,'es_ES','name','Análisis de datos','string'),(42,'pt_BR','name','Análise de dados','string'),(43,'en_US','name','Data Set','string'),(43,'es_ES','name','Conjunto de datos','string'),(43,'pt_BR','name','Conjunto de dados','string'),(44,'en_US','name','Source Texts','string'),(44,'es_ES','name','Textos fuente','string'),(44,'pt_BR','name','Textos fonte','string'),(45,'en_US','name','Multimedia','string'),(45,'es_ES','name','Multimedia','string'),(45,'pt_BR','name','Multimedia','string'),(46,'en_US','name','Image','string'),(46,'es_ES','name','Imagen','string'),(46,'pt_BR','name','Imagem','string'),(47,'en_US','name','HTML Stylesheet','string'),(47,'es_ES','name','Hoja de estilo HTML','string'),(47,'pt_BR','name','Folha de Estilos','string'),(48,'en_US','name','Other','string'),(48,'es_ES','name','Otro','string'),(48,'pt_BR','name','Outros','string'),(49,'es_ES','name','Ciencias Biológicas','string');
/*!40000 ALTER TABLE `genre_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genres` (
  `genre_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `seq` bigint(20) DEFAULT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `category` bigint(20) NOT NULL DEFAULT '1',
  `dependent` tinyint(4) NOT NULL DEFAULT '0',
  `supplementary` tinyint(4) DEFAULT '0',
  `entry_key` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`genre_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (1,1,0,1,1,0,0,'SUBMISSION'),(2,1,1,1,3,0,1,'RESEARCHINSTRUMENT'),(3,1,2,1,3,0,1,'RESEARCHMATERIALS'),(4,1,3,1,3,0,1,'RESEARCHRESULTS'),(5,1,4,1,3,0,1,'TRANSCRIPTS'),(6,1,5,1,3,0,1,'DATAANALYSIS'),(7,1,6,1,3,0,1,'DATASET'),(8,1,7,1,3,0,1,'SOURCETEXTS'),(9,1,8,1,1,1,1,'MULTIMEDIA'),(10,1,9,1,2,1,0,'IMAGE'),(11,1,10,1,1,1,0,'STYLE'),(12,1,11,1,3,0,1,'OTHER'),(13,2,0,1,1,0,0,'SUBMISSION'),(14,2,1,1,3,0,1,'RESEARCHINSTRUMENT'),(15,2,2,1,3,0,1,'RESEARCHMATERIALS'),(16,2,3,1,3,0,1,'RESEARCHRESULTS'),(17,2,4,1,3,0,1,'TRANSCRIPTS'),(18,2,5,1,3,0,1,'DATAANALYSIS'),(19,2,6,1,3,0,1,'DATASET'),(20,2,7,1,3,0,1,'SOURCETEXTS'),(21,2,8,1,1,1,1,'MULTIMEDIA'),(22,2,9,1,2,1,0,'IMAGE'),(23,2,10,1,1,1,0,'STYLE'),(24,2,11,1,3,0,1,'OTHER'),(25,3,0,1,1,0,0,'SUBMISSION'),(26,3,1,1,3,0,1,'RESEARCHINSTRUMENT'),(27,3,2,1,3,0,1,'RESEARCHMATERIALS'),(28,3,3,1,3,0,1,'RESEARCHRESULTS'),(29,3,4,1,3,0,1,'TRANSCRIPTS'),(30,3,5,1,3,0,1,'DATAANALYSIS'),(31,3,6,1,3,0,1,'DATASET'),(32,3,7,1,3,0,1,'SOURCETEXTS'),(33,3,8,1,1,1,1,'MULTIMEDIA'),(34,3,9,1,2,1,0,'IMAGE'),(35,3,10,1,1,1,0,'STYLE'),(36,3,11,1,3,0,1,'OTHER'),(37,4,0,1,1,0,0,'SUBMISSION'),(38,4,1,1,3,0,1,'RESEARCHINSTRUMENT'),(39,4,2,1,3,0,1,'RESEARCHMATERIALS'),(40,4,3,1,3,0,1,'RESEARCHRESULTS'),(41,4,4,1,3,0,1,'TRANSCRIPTS'),(42,4,5,1,3,0,1,'DATAANALYSIS'),(43,4,6,1,3,0,1,'DATASET'),(44,4,7,1,3,0,1,'SOURCETEXTS'),(45,4,8,1,1,1,1,'MULTIMEDIA'),(46,4,9,1,2,1,0,'IMAGE'),(47,4,10,1,1,1,0,'STYLE'),(48,4,11,1,3,0,1,'OTHER'),(49,4,0,1,1,0,0,'');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institutional_subscription_ip`
--

DROP TABLE IF EXISTS `institutional_subscription_ip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `institutional_subscription_ip` (
  `institutional_subscription_ip_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subscription_id` bigint(20) NOT NULL,
  `ip_string` varchar(40) NOT NULL,
  `ip_start` bigint(20) NOT NULL,
  `ip_end` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`institutional_subscription_ip_id`),
  KEY `institutional_subscription_ip_subscription_id` (`subscription_id`),
  KEY `institutional_subscription_ip_start` (`ip_start`),
  KEY `institutional_subscription_ip_end` (`ip_end`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institutional_subscription_ip`
--

LOCK TABLES `institutional_subscription_ip` WRITE;
/*!40000 ALTER TABLE `institutional_subscription_ip` DISABLE KEYS */;
/*!40000 ALTER TABLE `institutional_subscription_ip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institutional_subscriptions`
--

DROP TABLE IF EXISTS `institutional_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `institutional_subscriptions` (
  `institutional_subscription_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subscription_id` bigint(20) NOT NULL,
  `institution_name` varchar(255) NOT NULL,
  `mailing_address` varchar(255) DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`institutional_subscription_id`),
  KEY `institutional_subscriptions_subscription_id` (`subscription_id`),
  KEY `institutional_subscriptions_domain` (`domain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institutional_subscriptions`
--

LOCK TABLES `institutional_subscriptions` WRITE;
/*!40000 ALTER TABLE `institutional_subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `institutional_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_files`
--

DROP TABLE IF EXISTS `issue_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_files` (
  `file_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `issue_id` bigint(20) NOT NULL,
  `file_name` varchar(90) NOT NULL,
  `file_type` varchar(255) NOT NULL,
  `file_size` bigint(20) NOT NULL,
  `content_type` bigint(20) NOT NULL,
  `original_file_name` varchar(127) DEFAULT NULL,
  `date_uploaded` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`file_id`),
  KEY `issue_files_issue_id` (`issue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_files`
--

LOCK TABLES `issue_files` WRITE;
/*!40000 ALTER TABLE `issue_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `issue_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_galley_settings`
--

DROP TABLE IF EXISTS `issue_galley_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_galley_settings` (
  `galley_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `issue_galley_settings_pkey` (`galley_id`,`locale`,`setting_name`),
  KEY `issue_galley_settings_galley_id` (`galley_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_galley_settings`
--

LOCK TABLES `issue_galley_settings` WRITE;
/*!40000 ALTER TABLE `issue_galley_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `issue_galley_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_galleys`
--

DROP TABLE IF EXISTS `issue_galleys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_galleys` (
  `galley_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `locale` varchar(14) DEFAULT NULL,
  `issue_id` bigint(20) NOT NULL,
  `file_id` bigint(20) NOT NULL,
  `label` varchar(32) DEFAULT NULL,
  `seq` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`galley_id`),
  KEY `issue_galleys_issue_id` (`issue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_galleys`
--

LOCK TABLES `issue_galleys` WRITE;
/*!40000 ALTER TABLE `issue_galleys` DISABLE KEYS */;
/*!40000 ALTER TABLE `issue_galleys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_settings`
--

DROP TABLE IF EXISTS `issue_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_settings` (
  `issue_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `issue_settings_pkey` (`issue_id`,`locale`,`setting_name`),
  KEY `issue_settings_issue_id` (`issue_id`),
  KEY `issue_settings_name_value` (`setting_name`(50),`setting_value`(150))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_settings`
--

LOCK TABLES `issue_settings` WRITE;
/*!40000 ALTER TABLE `issue_settings` DISABLE KEYS */;
INSERT INTO `issue_settings` VALUES (1,'es_ES','coverImage','cover_issue_1_es_ES.jpg','string'),(1,'es_ES','description','','string'),(1,'es_ES','title','Functional Food Science and Technology Journal','string'),(3,'','pub-id::publisher-id','','string'),(3,'es_ES','coverImage','cover_issue_3_es_ES.jpg','string'),(3,'es_ES','coverImageAltText','','string'),(3,'es_ES','description','<p><strong>Vol.7-Núm.1-2016</strong></p>','string'),(3,'es_ES','title','REVISTA CIENTÍFICA','string');
/*!40000 ALTER TABLE `issue_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issues`
--

DROP TABLE IF EXISTS `issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issues` (
  `issue_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `journal_id` bigint(20) NOT NULL,
  `volume` smallint(6) DEFAULT NULL,
  `number` varchar(10) DEFAULT NULL,
  `year` smallint(6) DEFAULT NULL,
  `published` tinyint(4) NOT NULL DEFAULT '0',
  `current` tinyint(4) NOT NULL DEFAULT '0',
  `date_published` datetime DEFAULT NULL,
  `date_notified` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `access_status` tinyint(4) NOT NULL DEFAULT '1',
  `open_access_date` datetime DEFAULT NULL,
  `show_volume` tinyint(4) NOT NULL DEFAULT '0',
  `show_number` tinyint(4) NOT NULL DEFAULT '0',
  `show_year` tinyint(4) NOT NULL DEFAULT '0',
  `show_title` tinyint(4) NOT NULL DEFAULT '0',
  `style_file_name` varchar(90) DEFAULT NULL,
  `original_style_file_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`issue_id`),
  KEY `issues_journal_id` (`journal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issues`
--

LOCK TABLES `issues` WRITE;
/*!40000 ALTER TABLE `issues` DISABLE KEYS */;
INSERT INTO `issues` VALUES (1,1,1,'1',2019,1,1,'2019-10-24 23:49:58',NULL,'2019-10-24 23:49:58',1,NULL,1,1,1,1,NULL,NULL),(3,4,7,'1',2016,1,1,'2016-07-01 00:00:00',NULL,'2019-10-28 16:10:09',1,NULL,1,1,1,1,NULL,NULL);
/*!40000 ALTER TABLE `issues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_views`
--

DROP TABLE IF EXISTS `item_views`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_views` (
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` varchar(32) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `date_last_viewed` datetime DEFAULT NULL,
  UNIQUE KEY `item_views_pkey` (`assoc_type`,`assoc_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_views`
--

LOCK TABLES `item_views` WRITE;
/*!40000 ALTER TABLE `item_views` DISABLE KEYS */;
INSERT INTO `item_views` VALUES (515,'1-1',6,'2019-10-28 16:35:29'),(515,'3-1',6,'2019-10-29 14:51:34');
/*!40000 ALTER TABLE `item_views` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journal_settings`
--

DROP TABLE IF EXISTS `journal_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `journal_settings` (
  `journal_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `journal_settings_pkey` (`journal_id`,`locale`,`setting_name`),
  KEY `journal_settings_journal_id` (`journal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journal_settings`
--

LOCK TABLES `journal_settings` WRITE;
/*!40000 ALTER TABLE `journal_settings` DISABLE KEYS */;
INSERT INTO `journal_settings` VALUES (1,'','agenciesEnabledSubmission','0','bool'),(1,'','agenciesEnabledWorkflow','0','bool'),(1,'','agenciesRequired','0','bool'),(1,'','citationsEnabledSubmission','0','bool'),(1,'','citationsEnabledWorkflow','0','bool'),(1,'','citationsRequired','0','bool'),(1,'','contactEmail','nleonr@unprg.edu.pe','string'),(1,'','contactName','Noemí León Roque','string'),(1,'','contactPhone','+51-979003085','string'),(1,'','copyrightYearBasis','issue','string'),(1,'','copySubmissionAckAddress','nleonr@unprg.edu.pe','string'),(1,'','copySubmissionAckPrimaryContact','1','bool'),(1,'','coverageEnabledSubmission','0','bool'),(1,'','coverageEnabledWorkflow','0','bool'),(1,'','coverageRequired','0','bool'),(1,'','defaultReviewMode','2','int'),(1,'','disciplinesEnabledSubmission','0','bool'),(1,'','disciplinesEnabledWorkflow','0','bool'),(1,'','disciplinesRequired','0','bool'),(1,'','emailSignature','<br/>\n________________________________________________________________________<br/>\n<a href=\"{$contextUrl}\">{$contextName}</a>','string'),(1,'','enableOai','1','bool'),(1,'','itemsPerPage','25','int'),(1,'','keywordsEnabledSubmission','1','bool'),(1,'','keywordsEnabledWorkflow','1','bool'),(1,'','keywordsRequired','0','bool'),(1,'','languagesEnabledSubmission','0','bool'),(1,'','languagesEnabledWorkflow','0','bool'),(1,'','languagesRequired','0','bool'),(1,'','mailingAddress','Dirección: Calle Juan XXIII N°391 – Ciudad Universitaria.\r\nCódigo postal: 14013-Lambayeque.\r\nPaís: Perú.','string'),(1,'','membershipFee','0','int'),(1,'','navItems','N;','object'),(1,'','numPageLinks','10','int'),(1,'','numWeeksPerReview','4','int'),(1,'','onlineIssn','','string'),(1,'','printIssn','','string'),(1,'','publicationFee','0','int'),(1,'','publisherInstitution','Facultad de Ingeniería Química e Industrias Alimentarias de la Universidad Nacional Pedro Ruiz Gallo - UNPRG','string'),(1,'','purchaseArticleFee','0','int'),(1,'','reviewerAccessKeysEnabled','1','bool'),(1,'','rightsEnabledSubmission','0','bool'),(1,'','rightsEnabledWorkflow','0','bool'),(1,'','rightsRequired','0','bool'),(1,'','sourceEnabledSubmission','0','bool'),(1,'','sourceEnabledWorkflow','0','bool'),(1,'','sourceRequired','0','bool'),(1,'','subjectsEnabledSubmission','0','bool'),(1,'','subjectsEnabledWorkflow','0','bool'),(1,'','subjectsRequired','0','bool'),(1,'','supportedFormLocales','a:1:{i:0;s:5:\"es_ES\";}','object'),(1,'','supportedLocales','a:3:{i:0;s:5:\"en_US\";i:1;s:5:\"pt_BR\";i:2;s:5:\"es_ES\";}','object'),(1,'','supportedSubmissionLocales','a:1:{i:0;s:5:\"es_ES\";}','object'),(1,'','supportEmail','noemileon26@hotmail.com','string'),(1,'','supportName','Noemí León Roque','string'),(1,'','supportPhone','979003085','string'),(1,'','themePluginPath','default','string'),(1,'','typeEnabledSubmission','0','bool'),(1,'','typeEnabledWorkflow','0','bool'),(1,'','typeRequired','0','bool'),(1,'es_ES','abbreviation','cytaf','string'),(1,'es_ES','about','<h2>POLÍTICAS DE LA EDITORIAL</h2>\r\n<h3>ENFOQUE Y ALCANCE</h3>\r\n<p><strong>Functional Food Science and Technology Journal&nbsp;</strong>(Revista en Ciencia y Tecnologia de Alimentos Funcionales&nbsp; – CyTAF) es una revista que tiene como objetivo reunir los resultados más destacados de las investigaciones&nbsp;en el campo de los alimentos funcionales, (es decir, aquellas contribuciones y descubrimientos científicos que identifiquen alimentos, grupos funcionales y substancias que adicionen beneficios a la salud y prevención de enfermedades).</p>\r\n<p>La revista publica manuscritos originales e inéditos, comunicación corta, artículos de revisión y comentarios científicos que contribuyan a la comunidad cientifica, académica, estudiantes y grupos de interes en la sociedad. en este sentido, la revista contribuirá con la divulgación en los&nbsp;idiomas español, portugués e inglés.</p>\r\n<p><strong>Functional Food Science and Technology Journal ,&nbsp;</strong>tiene una periodicidad semestral de publicación, se publica en el mes de junio (para el número enero-junio) y diciembre (para el número julio-diciembre) que corresponde a cada año. La revista recibe artículos en forma permanente en cualquier momento, para definir cuales son los artículos que deben incluirse en cada número, las fechas de cierre deben estar dentro del periodo de evaluación para cada edición de la revista</p>\r\n<h3>POLÍTICAS DE SECCIÓN</h3>\r\n<h4>ARTÍCULOS</h4>\r\n<table width=\"60%\">\r\n<tbody>\r\n<tr>\r\n<td width=\"33%\"><img src=\"http://revistas.unprg.edu.pe/openjournal/lib/pkp/templates/images/icons/checked.gif\" alt=\"Comprobado\" width=\"16\" height=\"14\">&nbsp;Abrir envíos</td>\r\n<td width=\"33%\"><img src=\"http://revistas.unprg.edu.pe/openjournal/lib/pkp/templates/images/icons/checked.gif\" alt=\"Comprobado\" width=\"16\" height=\"14\">&nbsp;Indizado</td>\r\n<td width=\"34%\"><img src=\"http://revistas.unprg.edu.pe/openjournal/lib/pkp/templates/images/icons/checked.gif\" alt=\"Comprobado\" width=\"16\" height=\"14\">&nbsp;Evaluado por pares</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>ARTICULOS ORIGINALES</h4>\r\n<table width=\"60%\">\r\n<tbody>\r\n<tr>\r\n<td width=\"33%\"><img src=\"http://revistas.unprg.edu.pe/openjournal/lib/pkp/templates/images/icons/checked.gif\" alt=\"Comprobado\" width=\"16\" height=\"14\">&nbsp;Abrir envíos</td>\r\n<td width=\"33%\"><img src=\"http://revistas.unprg.edu.pe/openjournal/lib/pkp/templates/images/icons/checked.gif\" alt=\"Comprobado\" width=\"16\" height=\"14\">&nbsp;Indizado</td>\r\n<td width=\"34%\"><img src=\"http://revistas.unprg.edu.pe/openjournal/lib/pkp/templates/images/icons/checked.gif\" alt=\"Comprobado\" width=\"16\" height=\"14\">&nbsp;Evaluado por pares</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h4>ARTÍCULOS DE REVISIÓN</h4>\r\n<table width=\"60%\">\r\n<tbody>\r\n<tr>\r\n<td width=\"33%\"><img src=\"http://revistas.unprg.edu.pe/openjournal/lib/pkp/templates/images/icons/checked.gif\" alt=\"Comprobado\" width=\"16\" height=\"14\">&nbsp;Abrir envíos</td>\r\n<td width=\"33%\"><img src=\"http://revistas.unprg.edu.pe/openjournal/lib/pkp/templates/images/icons/checked.gif\" alt=\"Comprobado\" width=\"16\" height=\"14\">&nbsp;Indizado</td>\r\n<td width=\"34%\"><img src=\"http://revistas.unprg.edu.pe/openjournal/lib/pkp/templates/images/icons/checked.gif\" alt=\"Comprobado\" width=\"16\" height=\"14\">&nbsp;Evaluado por pares</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<h3>PROCESO DE EVALUACIÓN POR PARES</h3>\r\n<p>El Editor verifica si el manuscrito enviado&nbsp;se ajuste a los objetivos y al alcance de la revista, luego verifica si cumple con el estilo establecido por la revista.</p>\r\n<p>Si es conforme, cada artículo es enviado a un grupo de pares evaluadores. El número mínimo de revisores es de dos (2) revisores o evaluadores externos, el plazo habitual establecido para las revisiones es de cuatro (4) semanas, desde el momento que hayan aceptado la revisión.</p>\r\n<p>La evaluación sigue el procedimiento de \"doble ciego\" en el cual ni los autores ni los evaluadores se conocen.</p>\r\n<p>Los evaluadores son académicos con publicaciones en revistas científicas de alto impacto en los dos ultimos años.&nbsp;</p>\r\n<h3>POLÍTICA DE ACCESO ABIERTO</h3>\r\n<p>Esta revista proporciona un acceso abierto inmediato a su contenido, basado en el principio de que ofrecer al público un acceso libre a las investigaciones ayuda a un mayor intercambio global de conocimiento.</p>\r\n<h3>ARCHIVO DE LA REVISTA</h3>\r\n<p>Open Journal Systems soporta el sistema&nbsp;<a href=\"http://www.lockss.org/\" target=\"_blank\" rel=\"noopener\">LOCKSS</a>&nbsp;(Lots of Copies Keep Stuff Safe) para asegurar seguridad y preservación permanente de su revista. Tiene múltiples opciones para incluir su revista en una red LOCKSS:</p>\r\n<p>Open Journal Systems es compatible con el sistema&nbsp;<a href=\"http://lockss.org/\" target=\"_blank\" rel=\"noopener\">LOCKSS</a>&nbsp;(Lots of Copies Keep Stuff Safe) que garantiza a la revista un archivo permanente y seguro. LOCKSS es un programa de código abierto desarrollado por la Biblioteca de la Universidad de Stanford y que permite a las bibliotecas conservar revistas web seleccionadas buscando regularmente en revistas registradas para recopilar el nuevo contenido publicado y archivarlo. Cada archivo es validado continuamente con registros de otras bibliotecas, así que cualquier contenido dañado o perdido se puede restaurar utilizando esos registros o la misma revista.&nbsp;</p>\r\n<p>&nbsp;</p>','string'),(1,'es_ES','acronym','cytaf','string'),(1,'es_ES','authorGuidelines','<p><strong>Functional Food Science and Technology Journal&nbsp;</strong>(Revista en Ciencia y Tecnologia de Alimentos Funcionales – CyTAF) es una revista de la Facultad de Ingeniería Química e Industrias Alimentarias de la Universidad Nacional Pedro Ruiz Gallo, Lambayeque – Perú, de publicación continua-semestral, que sirve de medio de divulgación&nbsp;en el campo de los alimentos funcionales&nbsp;es decir, aquellos alimentos con beneficio a la salud, y prevención de enfermedades. Que incluye temas de desarrollo y comercialización en productos alimenticios, cubriendo los campos de los compuestos bioactivos de los vegetales; antioxidantes y envejecimiento; fibra dietética, prebióticos y almidones funcionales; alimentos probióticos funcionales; lípidos funcionales, péptidos bioactivos; vitaminas, minerales y productos botánicos y otros suplementos dietéticos; bebidas funcionales y productos alimenticios como suplementos, premezclas, efectos del procesamiento (incluido el envasado, almacenamiento, etc.) en la funcionalidad y mejora de la calidad del producto; Verificación, control de calidad y trazabilidad de materiales naturales y sintéticos, además incluirá temas relevantes a prevención de enfermedades.</p>\r\n<p>La revista publica manuscritos originales e inéditos, comunicación corta, artículos de revisión y comentarios científicos en tres (03) idiomas español, portugués e inglés cuya calidad haya sido certificada y evaluada por pares.</p>\r\n<p>La revista contiene los siguientes tipos de artículos:</p>\r\n<p><strong>Artículos Originales</strong></p>\r\n<p>Son artículos inéditos de resultados de trabajos de investigación culminados y constituyen aportes al conocimiento científico. &nbsp;Un artículo de investigación original&nbsp;<strong>completo</strong>&nbsp;debe tener una extensión máxima de 20 páginas, incluye tablas, figuras y la referencia, en caracteres de 12 puntos, estilo Times New Roman a espacio doble. Una&nbsp;<strong>comunicación corta</strong>&nbsp;debe tener una extensión máxima de 12 páginas, incluye tablas, figuras y la referencia, en el mismo formato anteriormente indicado.</p>\r\n<p><strong>Artículos de Revisión (reviews)</strong></p>\r\n<p>Son trabajos de investigadores reconocidos que constituyen una exhaustiva revisión bibliográfica sobre tema de su especialidad, estos deben ser previamente autorizado por el Editor de la revista enviando previamente un resumen y título tentativo a&nbsp;<a href=\"mailto:cytaf@unprg.edu.pe\">cytaf@unprg.edu.pe</a>&nbsp;debe tener mínimo 50 referencias de fuente bibliográfica primaria; su finalidad es examinar la bibliografía publicada y situarla en cierta perspectiva. Debe tener una extensión máxima de 50 páginas, incluye tablas, figuras y la referencia.</p>\r\n<p><strong>Comentarios Científicos</strong></p>\r\n<p>Son artículos donde se discute y exponen temas de interés para la comunidad científica. Se incluye en este espacio los ensayos de opinión.</p>','string'),(1,'es_ES','authorInformation','¿Está interesado en publicar en la revista? Se recomienda revisar la página <a href=\"http://vrinv.unprg.edu.pe/ojs/index.php/cytaf/about\">Acerca de la revista</a> para consultar las políticas de sección de la revista, así como las <a href=\"http://vrinv.unprg.edu.pe/ojs/index.php/cytaf/about/submissions#authorGuidelines\">Directrices del autor/a</a>. Los autores/as deben <a href=\"http://vrinv.unprg.edu.pe/ojs/index.php/cytaf/user/register\">registrarse</a> en la revista antes de publicar o, si ya están registrados, pueden simplemente <a href=\"http://vrinv.unprg.edu.pe/ojs/index.php/index/login\">iniciar sesión</a> y comenzar el proceso de cinco pasos.','string'),(1,'es_ES','authorSelfArchivePolicy','Esta revista permite y anima a los autores/as a publicar artículos enviados a la revista en sus sitios web personales o en depósitos institucionales, tanto antes como después de su publicación en esta revista, siempre y cuando proporcionen información bibliográfica que acredite, si procede, su publicación en ella.','string'),(1,'es_ES','clockssLicense','Esta revista utiliza el sistema CLOCKSS para crear un sistema de archivos distribuido entre las bibliotecas participantes y permite a estas bibliotecas crear archivos permanentes de la revista con finalidad de preservación y restauración. <a href=\"https://clockss.org/\">Saber más...</a>','string'),(1,'es_ES','contactAffiliation','Universidad Nacional Pedro Ruiz Gallo','string'),(1,'es_ES','contactTitle','Editor Jefe','string'),(1,'es_ES','copyeditInstructions','La fase de corrección tiene el propósito de mejorar la fluidez, claridad, gramática, vocabulario y formato del artículo. Supone la última oportunidad para el autor/a de realizar cualquier cambio importante en el texto, puesto que la siguiente fase se limita a las correcciones tipográficas y de formato. El archivo para corregir se encuentra en formato Word o .rtf y, por lo tanto, puede editarse fácilmente como un documento de procesador de textos. Las instrucciones expuestas aquí plantean dos enfoques de corrección. La primera está basada en la función Control de cambios de Microsoft Word y requiere que tanto el corrector/a como el editor/a y el autor/a tengan acceso a este programa. La segunda propuesta, que no depende de un software concreto, se tomó prestada, con el debido permiso, de la Harvard Educational Review. El editor/a de la revista tiene la posibilidad de modificar estas instrucciones, por lo que pueden hacerse sugerencias con el fin de mejorar el proceso de la revista. <h4>Sistemas de corrección</h4> <strong>1. Control de cambios de Microsoft Word</strong> Situado en el menú Herramientas en la barra de menús, la función Control de cambios permite al corrector/a insertar (el texto aparece en color) y suprimir contenido (el texto aparece tachado en color o al margen como eliminado). El corrector/a puede incluir consultas tanto al autor/a (Consultas al autor/a) como al editor/a (Consultas al editor/a) escribiéndolas entre corchetes. Una vez cargada la versión corregida, se le notifica al editor/a. El editor/a revisa entonces el texto y lo notifica al autor/a. El editor/a y el autor/a deben dejar los cambios que consideren pertinentes. Si es necesario realizar más cambios, el editor/a y el autor/a pueden realizarlos en las inserciones o supresiones iniciales, así como realizar nuevas inserciones o supresiones en cualquier parte del texto. Los autores/as y editores/as deben responder a cada una de las consultas recibidas, con respuestas incluidas entre los corchetes. Una vez que el editor/a y el autor/a hayan revisado el texto, el corrector realizará un repaso final del texto y aceptará los cambios como preparación para la fase de maquetación y de galerada. <strong>2. Harvard Educational Review </strong> <strong>Instrucciones para realizar revisiones electrónicas en el manuscrito</strong> Siga el siguiente protocolo para realizar revisiones electrónicas en su manuscrito: <strong>Responder a cambios sugeridos.</strong> &nbsp; Para cada cambio sugerido que acepte, elimine la negrita del texto. &nbsp; Para cada cambio sugerido que no acepte, vuelva a introducir el texto original y resáltelo en <strong>negrita</strong>. <strong>Realizar inserciones y supresiones.</strong> &nbsp; Indique las inserciones resaltando el texto nuevo en <strong>negrita</strong>. &nbsp; Reemplace las secciones eliminadas con <strong>[texto eliminado]</strong>. &nbsp; Si elimina una o más oraciones, indíquelo con una nota, p. ej., <strong>[2 oraciones eliminadas]</strong>. <strong>Responder a consultas al autor (QAs).</strong> &nbsp; Mantenga todas las consultas al autor intactas y en negrita dentro del texto. No las elimine. &nbsp; Para responder a una consulta al autor, añada un comentario tras ella. Los comentarios deben delimitarse con: <strong>[Comentario:]</strong> &nbsp; p. ej., <strong>[Comentario: Discusión de la metodología ampliada como se sugirió]</strong>. <strong>Realizar comentarios.</strong> &nbsp; Utilice comentarios para explicar cambios en la organización o revisiones graves &nbsp; p. ej., <strong>[Comentario: El párrafo anterior se ha movido de la pág. 5 a la pág. 7].</strong> &nbsp; Nota: Si hace referencia a números de página, utilice los números de página de la versión impresa del manuscrito que se le envió. Este punto es importante puesto que los números de página pueden cambiar si el documento se revisa de manera electrónica. <h4>Ejemplo de una revisión electrónica</h4> <ol> <li><strong>Corrección inici\nal.</strong> El corrector/a de la revista editará el texto para mejorar la fluidez, claridad, gramática, vocabulario y formato del artículo, así como para incluir consultas al autor si es necesario. Una vez que la edición inicial se haya completado, el corrector/a cargará el documento revisado a través del sitio web de la revista y notificará al autor/a que el manuscrito editado está disponible para revisión.</li> <li><strong>Corrección del autor/a.</strong> Antes de realizar cambios radicales en la estructura y organización del manuscrito editado, los autores/as deben comprobarlos con los editores/as que codirigen la pieza. Los autores/as deben aceptar/rechazar cualquier cambio realizado durante la corrección inicial, según convenga, y responder a todas las consultas. Cuando se finalicen las revisiones, los autores/as deben cambiar el nombre del archivo de NombreAutorQA.doc a NombreAutorQAR.doc (p. ej., de LeeQA.doc a LeeQAR.doc) y cargar el documento revisado a través del sitio web de la revista siguiendo las instrucciones.</li> <li><strong>Corrección final.</strong> El corrector/a de la revista comprobará los cambios realizados por el autor/a e incorporará las respuestas a las consultas al autor para crear un manuscrito final. Cuando termine, el corrector/a cargará el documento final a través del sitio web de la revista y enviará una alerta al maquetista para completar el formateado.</li> </ol>','string'),(1,'es_ES','description','<div id=\"journalDescription\">\r\n<p style=\"text-align: justify;\"><strong><em><img style=\"float: left;\" src=\"/ojs/public/site/images/adminopenjs/journalThumbnail_es_ES.jpg\" width=\"101\" height=\"145\"></em></strong></p>\r\n<p style=\"text-align: justify;\"><strong><em>Revista en Ciencia y Tecnología de Alimentos</em></strong>&nbsp;<strong><em>Funcionales - CyTAF</em></strong>, es una Revista de la Facultad de Ingeniería Química e Industrias Alimentarias de la Universidad Nacional Pedro Ruiz Gallo (UNPRG), de publicación continua-semestral, que publica artículos más destacados de las investigaciones en el campo de los alimentos funcionales</p>\r\n</div>','string'),(1,'es_ES','editorialTeam','<p><strong>Dra. Noemí León Roque</strong><br>Editor Jefe<br><img src=\"/ojs/public/site/images/nleon/foto_noemi.jpg\"></p>\r\n<p><strong>EDITORES ASOCIADOS</strong></p>\r\n<p><strong>Dr. Wilson Manuel Castro Silupu</strong></p>\r\n<p>Universidad Privada del Norte, Sede - Cajamarca, Perú.</p>\r\n<p><strong>Dr. Guillermo Eduardo Delgado Paredes</strong></p>\r\n<p>Universidad Nacional Pedro Ruíz Gallo - Lambayeque, Perú.</p>\r\n<p>&nbsp;</p>\r\n<p><strong>COMITÉ CONSULTIVO EXTERNO</strong></p>\r\n<p><strong>Dr. Felix Martín Carbajal Gamarra</strong></p>\r\n<p>Energy Engineering Department, FGA-University of Brasilia-Brasil.</p>\r\n<p><strong>&nbsp;</strong><strong>Dra. Édira Castello Branco de Andrade Gonçalves</strong></p>\r\n<p>Universidad Federal do Estado do Río de Janeiro-UNIRIO, Brasil.</p>\r\n<p><strong>Dr. Elmer Alberto Ccopa Rivera</strong></p>\r\n<p>Centro Nacional de Pesquisa em Energia e Materiais - &nbsp;Brasil.</p>\r\n<p><strong>Dr. Davy William Hidalgo Chávez</strong></p>\r\n<p>Universidade Federal Rural do Rio de Janeiro – Brasil.</p>\r\n<p><strong>PhD. Luis Alberto Condezo Hoyos</strong></p>\r\n<p>SCIENTIFIC ANALYST &amp; CONSULTANT E.I.R.L. – Perú.</p>\r\n<p><strong>Dra. Bettit Karim Salva Ruiz</strong></p>\r\n<p>Universidad Nacional Agraria La Molina, Lima – Perú.</p>\r\n<p><strong>Dr. Wilson Manuel Castro Silupu, </strong></p>\r\n<p>Universidad Privada del Norte, Sede – Cajamarca, Perú.</p>\r\n<p><strong>Dr. Pedro Pablo Peláez Sánchez.</strong></p>\r\n<p>Universidad Nacional Agraria de la Selva - Huánuco, Perú.</p>\r\n<p><strong>&nbsp;</strong></p>','string'),(1,'es_ES','homepageImage','a:6:{s:4:\"name\";s:30:\"homeHeaderTitleImage_es_ES.jpg\";s:10:\"uploadName\";s:23:\"homepageImage_es_ES.jpg\";s:5:\"width\";i:1338;s:6:\"height\";i:171;s:12:\"dateUploaded\";s:19:\"2019-10-17 16:22:33\";s:7:\"altText\";s:0:\"\";}','object'),(1,'es_ES','librarianInformation','Se recomienda a los investigadores/as bibliotecarios/as que incluyan esta revista en su listado de revistas electrónicas. Asimismo, cabría destacar que el sistema de publicación de código abierto de esta revista es apto para bibliotecas con personal docente que desee editar sus propias revistas (ver <a href=\"http://pkp.sfu.ca/ojs\">Open Journal Systems</a>).','string'),(1,'es_ES','lockssLicense','Esta revista utiliza el sistema LOCKSS para crear un sistema de archivo distribuido entre bibliotecas colaboradoras, a las que permite crear archivos permanentes de la revista con fines de conservación y restauración. <a href=\"https://lockss.org/\">Más...</a>','string'),(1,'es_ES','name','FUNCTIONAL FOOD SCIENCE AND TECHNOLOGY JOURNAL','string'),(1,'es_ES','openAccessPolicy','Esta revista proporciona un acceso abierto inmediato a su contenido, basado en el principio de ofrecer al público un acceso libre a las investigaciones ayuda a un mayor intercambio global de conocimiento.','string'),(1,'es_ES','pageHeaderLogoImage','a:6:{s:4:\"name\";s:30:\"homeHeaderTitleImage_es_ES.jpg\";s:10:\"uploadName\";s:29:\"pageHeaderLogoImage_es_ES.jpg\";s:5:\"width\";i:1338;s:6:\"height\";i:171;s:12:\"dateUploaded\";s:19:\"2019-10-17 16:24:27\";s:7:\"altText\";s:0:\"\";}','object'),(1,'es_ES','privacyStatement','<p>Los nombres y las direcciones de correo electrónico introducidos en esta revista se usarán exclusivamente para los fines establecidos en ella y no se proporcionarán a terceros o para su uso con otros fines.</p>','string'),(1,'es_ES','proofInstructions','<p>La fase de corrección de pruebas tiene el propósito de detectar errores ortográficos en la galerada, así como gramaticales y de formato. En esta fase no se realizan más cambios importantes, a menos que se haya acordado con el editor/a de sección. En Maquetación, haga clic en VER PRUEBA para ver los HTML, PDF y otros formatos de archivo disponibles utilizados en la edición de este elemento.</p> <h4>Para errores ortográficos y gramaticales</h4> <p>Copie la palabra o grupo de palabras problemáticas y péguelas en el cuadro de correciones de pruebas con instrucciones al editor/a \"CAMBIAR-POR\" como sigue:</p> <pre>1. CAMBIAR... entonces los otras POR... entonces los otros</pre> <br /> <pre>2. CAMBIAR... Malinowsky POR... Malinowski</pre> <br /> <h4>Para errores de formato</h4> <p>Describa la ubicación y naturaleza del problema en el cuadro de correcciones de pruebas después de escribir en el título \"FORMATO\" como sigue:</p> <br /> <pre>3. FORMATO Los números de la Tabla 3 no están alineados en la tercera columna.</pre> <br /> <pre>4. FORMATO El párrafo que comienza con \"Este último tema...\" no está sangrado.</pre>','string'),(1,'es_ES','readerInformation','Animamos a los lectores/as a registrarse en el servicio de notificación de publicaciones de la revista. Utilice el enlace <a href=\"http://vrinv.unprg.edu.pe/ojs/index.php/cytaf/user/register\">Registro</a> de la parte superior de la página de inicio de la revista. Como resultado del registro, el lector/a recibirá por correo electrónico la Tabla de contenidos de cada número de la revista. Esta lista también permite que se le atribuya a la revista un cierto nivel de apoyo o número de lectores/as. Consulte la <a href=\"http://vrinv.unprg.edu.pe/ojs/index.php/cytaf/about/submissions#privacyStatement\">Declaración de privacidad</a> de la revista, que garantiza a los lectores/as que sus nombres y direcciones de correo electrónico no se usarán con otros fines.','string'),(1,'es_ES','refLinkInstructions','<h4>Añadir enlaces de referencia en el proceso de maquetación</h4> <p>Al convertir un envío a HTML o PDF, asegúrese de que todos los hipervínculos del envío están activos.</p> <h4>A. Si el autor/a proporciona un enlace con la referencia</h4> <ol> <li>Mientras el envío se encuentre todavía en formato de procesador de textos (p. ej., Word), añada la frase VER ELEMENTO al final de la referencia con la dirección URL.</li> <li>Convierta esa frase en un hipervínculo seleccionándola y utilizando la herramienta de Word Insertar hipervínculo y la dirección URL previa.</li> </ol> <h4>B. Permitir a los lectores/as buscar referencias en Google Académico</h4> <ol> <li>Mientras el envío se encuentre todavía en formato de procesador de textos (p. ej., Word), copie el título del trabajo referenciado en la lista de referencias (si el título es muy común —p. ej., \"Paz\"— copie también el autor).</li> <li>Pegue el título de la referencia entre los dos símbolos %22 y coloque un símbolo + entre cada palabra: https://scholar.google.com/sc?q=%22PEGAR+TÍTULO+AQUÍ%22</li> <li>Añada la frase BÚSQUEDA GOOGLE ACADÉMICO al final de cada cita en la lista de referencias del envío.</li> <li>Convierta esa frase en un hipervínculo seleccionándola y utilizando la herramienta de Word Insertar hipervínculo y la dirección URL preparada en el apartado nº 2.</li> </ol> <h4>C. Permitir a los lectores/as buscar referencias con un DOI</h4> <ol> <li>Mientras el envío se encuentre todavía en Word, copie un lote de referencias en el texto de consulta CrossRef https://www.crossref.org/freeTextQuery/.</li> <li>Pegue cada DOI que le proporcione la consulta en la siguiente dirección URL (entre = y &amp;): http://www.cmaj.ca/cgi/external_ref?access_num=PEGAR DOI#AQUÍ&amp;link_type=DOI.</li> <li>Añada la frase CrossRef al final de cada cita en la lista de referencias del envío.</li> <li>Convierta esa frase en un hipervínculo seleccionándola y utilizando la herramienta de Word Insertar hipervínculo y la dirección URL preparada en el apartado nº 2.</li> </ol>','string'),(1,'es_ES','submissionChecklist','a:6:{i:0;a:2:{s:7:\"content\";s:187:\"El envío no ha sido publicado previamente ni se ha sometido a consideración por ninguna otra revista (o se ha proporcionado una explicación al respecto en los Comentarios al editor/a).\";s:5:\"order\";s:1:\"1\";}i:1;a:2:{s:7:\"content\";s:84:\"El archivo de envío está en formato OpenOffice, Microsoft Word, RTF o WordPerfect.\";s:5:\"order\";s:1:\"2\";}i:2;a:2:{s:7:\"content\";s:78:\"Siempre que sea posible, se proporcionan direcciones URL para las referencias.\";s:5:\"order\";s:1:\"3\";}i:3;a:2:{s:7:\"content\";s:269:\"El texto tiene interlineado sencillo; 12 puntos de tamaño de fuente; se utiliza cursiva en lugar de subrayado (excepto en las direcciones URL); y todas las ilustraciones, figuras y tablas se encuentran colocadas en los lugares del texto apropiados, en vez de al final.\";s:5:\"order\";s:1:\"4\";}i:4;a:2:{s:7:\"content\";s:257:\"El texto se adhiere a los requisitos estilísticos y bibliográficos resumidos en las <a href=\"http://vrinv.unprg.edu.pe/ojs/index.php/cytaf/about/submissions#authorGuidelines\" target=\"_new\">Directrices del autor/a</a>, que aparecen en Acerca de la revista.\";s:5:\"order\";s:1:\"5\";}i:5;a:2:{s:7:\"content\";s:17:\"ENVÍOS EN LÍNEA\";s:5:\"order\";i:6;}}','object'),(2,'','agenciesEnabledSubmission','0','bool'),(2,'','agenciesEnabledWorkflow','0','bool'),(2,'','agenciesRequired','0','bool'),(2,'','citationsEnabledSubmission','0','bool'),(2,'','citationsEnabledWorkflow','0','bool'),(2,'','citationsRequired','0','bool'),(2,'','contactEmail','sergiohg128@gmail.com','string'),(2,'','contactName','Sergio Huaman','string'),(2,'','contactPhone','935395044','string'),(2,'','copyrightYearBasis','issue','string'),(2,'','copySubmissionAckAddress','','string'),(2,'','copySubmissionAckPrimaryContact','0','bool'),(2,'','coverageEnabledSubmission','0','bool'),(2,'','coverageEnabledWorkflow','0','bool'),(2,'','coverageRequired','0','bool'),(2,'','defaultReviewMode','2','int'),(2,'','disciplinesEnabledSubmission','0','bool'),(2,'','disciplinesEnabledWorkflow','0','bool'),(2,'','disciplinesRequired','0','bool'),(2,'','emailSignature','<br/>\n________________________________________________________________________<br/>\n<a href=\"{$contextUrl}\">{$contextName}</a>','string'),(2,'','enableOai','1','bool'),(2,'','itemsPerPage','25','int'),(2,'','keywordsEnabledSubmission','1','bool'),(2,'','keywordsEnabledWorkflow','1','bool'),(2,'','keywordsRequired','0','bool'),(2,'','languagesEnabledSubmission','0','bool'),(2,'','languagesEnabledWorkflow','0','bool'),(2,'','languagesRequired','0','bool'),(2,'','mailingAddress',NULL,'string'),(2,'','membershipFee','0','int'),(2,'','navItems','N;','object'),(2,'','numPageLinks','10','int'),(2,'','numWeeksPerReview','4','int'),(2,'','onlineIssn','','string'),(2,'','printIssn','','string'),(2,'','publicationFee','0','int'),(2,'','publisherInstitution','','string'),(2,'','purchaseArticleFee','0','int'),(2,'','reviewerAccessKeysEnabled','1','bool'),(2,'','rightsEnabledSubmission','0','bool'),(2,'','rightsEnabledWorkflow','0','bool'),(2,'','rightsRequired','0','bool'),(2,'','sourceEnabledSubmission','0','bool'),(2,'','sourceEnabledWorkflow','0','bool'),(2,'','sourceRequired','0','bool'),(2,'','subjectsEnabledSubmission','0','bool'),(2,'','subjectsEnabledWorkflow','0','bool'),(2,'','subjectsRequired','0','bool'),(2,'','supportedFormLocales','a:1:{i:0;s:5:\"es_ES\";}','object'),(2,'','supportedLocales','a:3:{i:0;s:5:\"en_US\";i:1;s:5:\"pt_BR\";i:2;s:5:\"es_ES\";}','object'),(2,'','supportedSubmissionLocales','a:1:{i:0;s:5:\"es_ES\";}','object'),(2,'','supportEmail',NULL,'string'),(2,'','supportName',NULL,'string'),(2,'','supportPhone',NULL,'string'),(2,'','themePluginPath','default','string'),(2,'','typeEnabledSubmission','0','bool'),(2,'','typeEnabledWorkflow','0','bool'),(2,'','typeRequired','0','bool'),(2,'es_ES','acronym','prueba','string'),(2,'es_ES','authorInformation','¿Está interesado en publicar en la revista? Se recomienda revisar la página <a href=\"http://vrinv.unprg.edu.pe/ojs/index.php/prueba/about\">Acerca de la revista</a> para consultar las políticas de sección de la revista, así como las <a href=\"http://vrinv.unprg.edu.pe/ojs/index.php/prueba/about/submissions#authorGuidelines\">Directrices del autor/a</a>. Los autores/as deben <a href=\"http://vrinv.unprg.edu.pe/ojs/index.php/prueba/user/register\">registrarse</a> en la revista antes de publicar o, si ya están registrados, pueden simplemente <a href=\"http://vrinv.unprg.edu.pe/ojs/index.php/index/login\">iniciar sesión</a> y comenzar el proceso de cinco pasos.','string'),(2,'es_ES','authorSelfArchivePolicy','Esta revista permite y anima a los autores/as a publicar artículos enviados a la revista en sus sitios web personales o en depósitos institucionales, tanto antes como después de su publicación en esta revista, siempre y cuando proporcionen información bibliográfica que acredite, si procede, su publicación en ella.','string'),(2,'es_ES','clockssLicense','Esta revista utiliza el sistema CLOCKSS para crear un sistema de archivos distribuido entre las bibliotecas participantes y permite a estas bibliotecas crear archivos permanentes de la revista con finalidad de preservación y restauración. <a href=\"https://clockss.org/\">Saber más...</a>','string'),(2,'es_ES','copyeditInstructions','La fase de corrección tiene el propósito de mejorar la fluidez, claridad, gramática, vocabulario y formato del artículo. Supone la última oportunidad para el autor/a de realizar cualquier cambio importante en el texto, puesto que la siguiente fase se limita a las correcciones tipográficas y de formato. El archivo para corregir se encuentra en formato Word o .rtf y, por lo tanto, puede editarse fácilmente como un documento de procesador de textos. Las instrucciones expuestas aquí plantean dos enfoques de corrección. La primera está basada en la función Control de cambios de Microsoft Word y requiere que tanto el corrector/a como el editor/a y el autor/a tengan acceso a este programa. La segunda propuesta, que no depende de un software concreto, se tomó prestada, con el debido permiso, de la Harvard Educational Review. El editor/a de la revista tiene la posibilidad de modificar estas instrucciones, por lo que pueden hacerse sugerencias con el fin de mejorar el proceso de la revista. <h4>Sistemas de corrección</h4> <strong>1. Control de cambios de Microsoft Word</strong> Situado en el menú Herramientas en la barra de menús, la función Control de cambios permite al corrector/a insertar (el texto aparece en color) y suprimir contenido (el texto aparece tachado en color o al margen como eliminado). El corrector/a puede incluir consultas tanto al autor/a (Consultas al autor/a) como al editor/a (Consultas al editor/a) escribiéndolas entre corchetes. Una vez cargada la versión corregida, se le notifica al editor/a. El editor/a revisa entonces el texto y lo notifica al autor/a. El editor/a y el autor/a deben dejar los cambios que consideren pertinentes. Si es necesario realizar más cambios, el editor/a y el autor/a pueden realizarlos en las inserciones o supresiones iniciales, así como realizar nuevas inserciones o supresiones en cualquier parte del texto. Los autores/as y editores/as deben responder a cada una de las consultas recibidas, con respuestas incluidas entre los corchetes. Una vez que el editor/a y el autor/a hayan revisado el texto, el corrector realizará un repaso final del texto y aceptará los cambios como preparación para la fase de maquetación y de galerada. <strong>2. Harvard Educational Review </strong> <strong>Instrucciones para realizar revisiones electrónicas en el manuscrito</strong> Siga el siguiente protocolo para realizar revisiones electrónicas en su manuscrito: <strong>Responder a cambios sugeridos.</strong> &nbsp; Para cada cambio sugerido que acepte, elimine la negrita del texto. &nbsp; Para cada cambio sugerido que no acepte, vuelva a introducir el texto original y resáltelo en <strong>negrita</strong>. <strong>Realizar inserciones y supresiones.</strong> &nbsp; Indique las inserciones resaltando el texto nuevo en <strong>negrita</strong>. &nbsp; Reemplace las secciones eliminadas con <strong>[texto eliminado]</strong>. &nbsp; Si elimina una o más oraciones, indíquelo con una nota, p. ej., <strong>[2 oraciones eliminadas]</strong>. <strong>Responder a consultas al autor (QAs).</strong> &nbsp; Mantenga todas las consultas al autor intactas y en negrita dentro del texto. No las elimine. &nbsp; Para responder a una consulta al autor, añada un comentario tras ella. Los comentarios deben delimitarse con: <strong>[Comentario:]</strong> &nbsp; p. ej., <strong>[Comentario: Discusión de la metodología ampliada como se sugirió]</strong>. <strong>Realizar comentarios.</strong> &nbsp; Utilice comentarios para explicar cambios en la organización o revisiones graves &nbsp; p. ej., <strong>[Comentario: El párrafo anterior se ha movido de la pág. 5 a la pág. 7].</strong> &nbsp; Nota: Si hace referencia a números de página, utilice los números de página de la versión impresa del manuscrito que se le envió. Este punto es importante puesto que los números de página pueden cambiar si el documento se revisa de manera electrónica. <h4>Ejemplo de una revisión electrónica</h4> <ol> <li><strong>Corrección inici\nal.</strong> El corrector/a de la revista editará el texto para mejorar la fluidez, claridad, gramática, vocabulario y formato del artículo, así como para incluir consultas al autor si es necesario. Una vez que la edición inicial se haya completado, el corrector/a cargará el documento revisado a través del sitio web de la revista y notificará al autor/a que el manuscrito editado está disponible para revisión.</li> <li><strong>Corrección del autor/a.</strong> Antes de realizar cambios radicales en la estructura y organización del manuscrito editado, los autores/as deben comprobarlos con los editores/as que codirigen la pieza. Los autores/as deben aceptar/rechazar cualquier cambio realizado durante la corrección inicial, según convenga, y responder a todas las consultas. Cuando se finalicen las revisiones, los autores/as deben cambiar el nombre del archivo de NombreAutorQA.doc a NombreAutorQAR.doc (p. ej., de LeeQA.doc a LeeQAR.doc) y cargar el documento revisado a través del sitio web de la revista siguiendo las instrucciones.</li> <li><strong>Corrección final.</strong> El corrector/a de la revista comprobará los cambios realizados por el autor/a e incorporará las respuestas a las consultas al autor para crear un manuscrito final. Cuando termine, el corrector/a cargará el documento final a través del sitio web de la revista y enviará una alerta al maquetista para completar el formateado.</li> </ol>','string'),(2,'es_ES','librarianInformation','Se recomienda a los investigadores/as bibliotecarios/as que incluyan esta revista en su listado de revistas electrónicas. Asimismo, cabría destacar que el sistema de publicación de código abierto de esta revista es apto para bibliotecas con personal docente que desee editar sus propias revistas (ver <a href=\"http://pkp.sfu.ca/ojs\">Open Journal Systems</a>).','string'),(2,'es_ES','lockssLicense','Esta revista utiliza el sistema LOCKSS para crear un sistema de archivo distribuido entre bibliotecas colaboradoras, a las que permite crear archivos permanentes de la revista con fines de conservación y restauración. <a href=\"https://lockss.org/\">Más...</a>','string'),(2,'es_ES','name','Prueba','string'),(2,'es_ES','openAccessPolicy','Esta revista proporciona un acceso abierto inmediato a su contenido, basado en el principio de ofrecer al público un acceso libre a las investigaciones ayuda a un mayor intercambio global de conocimiento.','string'),(2,'es_ES','privacyStatement','<p>Los nombres y las direcciones de correo electrónico introducidos en esta revista se usarán exclusivamente para los fines establecidos en ella y no se proporcionarán a terceros o para su uso con otros fines.</p>','string'),(2,'es_ES','proofInstructions','<p>La fase de corrección de pruebas tiene el propósito de detectar errores ortográficos en la galerada, así como gramaticales y de formato. En esta fase no se realizan más cambios importantes, a menos que se haya acordado con el editor/a de sección. En Maquetación, haga clic en VER PRUEBA para ver los HTML, PDF y otros formatos de archivo disponibles utilizados en la edición de este elemento.</p> <h4>Para errores ortográficos y gramaticales</h4> <p>Copie la palabra o grupo de palabras problemáticas y péguelas en el cuadro de correciones de pruebas con instrucciones al editor/a \"CAMBIAR-POR\" como sigue:</p> <pre>1. CAMBIAR... entonces los otras POR... entonces los otros</pre> <br /> <pre>2. CAMBIAR... Malinowsky POR... Malinowski</pre> <br /> <h4>Para errores de formato</h4> <p>Describa la ubicación y naturaleza del problema en el cuadro de correcciones de pruebas después de escribir en el título \"FORMATO\" como sigue:</p> <br /> <pre>3. FORMATO Los números de la Tabla 3 no están alineados en la tercera columna.</pre> <br /> <pre>4. FORMATO El párrafo que comienza con \"Este último tema...\" no está sangrado.</pre>','string'),(2,'es_ES','readerInformation','Animamos a los lectores/as a registrarse en el servicio de notificación de publicaciones de la revista. Utilice el enlace <a href=\"http://vrinv.unprg.edu.pe/ojs/index.php/prueba/user/register\">Registro</a> de la parte superior de la página de inicio de la revista. Como resultado del registro, el lector/a recibirá por correo electrónico la Tabla de contenidos de cada número de la revista. Esta lista también permite que se le atribuya a la revista un cierto nivel de apoyo o número de lectores/as. Consulte la <a href=\"http://vrinv.unprg.edu.pe/ojs/index.php/prueba/about/submissions#privacyStatement\">Declaración de privacidad</a> de la revista, que garantiza a los lectores/as que sus nombres y direcciones de correo electrónico no se usarán con otros fines.','string'),(2,'es_ES','refLinkInstructions','<h4>Añadir enlaces de referencia en el proceso de maquetación</h4> <p>Al convertir un envío a HTML o PDF, asegúrese de que todos los hipervínculos del envío están activos.</p> <h4>A. Si el autor/a proporciona un enlace con la referencia</h4> <ol> <li>Mientras el envío se encuentre todavía en formato de procesador de textos (p. ej., Word), añada la frase VER ELEMENTO al final de la referencia con la dirección URL.</li> <li>Convierta esa frase en un hipervínculo seleccionándola y utilizando la herramienta de Word Insertar hipervínculo y la dirección URL previa.</li> </ol> <h4>B. Permitir a los lectores/as buscar referencias en Google Académico</h4> <ol> <li>Mientras el envío se encuentre todavía en formato de procesador de textos (p. ej., Word), copie el título del trabajo referenciado en la lista de referencias (si el título es muy común —p. ej., \"Paz\"— copie también el autor).</li> <li>Pegue el título de la referencia entre los dos símbolos %22 y coloque un símbolo + entre cada palabra: https://scholar.google.com/sc?q=%22PEGAR+TÍTULO+AQUÍ%22</li> <li>Añada la frase BÚSQUEDA GOOGLE ACADÉMICO al final de cada cita en la lista de referencias del envío.</li> <li>Convierta esa frase en un hipervínculo seleccionándola y utilizando la herramienta de Word Insertar hipervínculo y la dirección URL preparada en el apartado nº 2.</li> </ol> <h4>C. Permitir a los lectores/as buscar referencias con un DOI</h4> <ol> <li>Mientras el envío se encuentre todavía en Word, copie un lote de referencias en el texto de consulta CrossRef https://www.crossref.org/freeTextQuery/.</li> <li>Pegue cada DOI que le proporcione la consulta en la siguiente dirección URL (entre = y &amp;): http://www.cmaj.ca/cgi/external_ref?access_num=PEGAR DOI#AQUÍ&amp;link_type=DOI.</li> <li>Añada la frase CrossRef al final de cada cita en la lista de referencias del envío.</li> <li>Convierta esa frase en un hipervínculo seleccionándola y utilizando la herramienta de Word Insertar hipervínculo y la dirección URL preparada en el apartado nº 2.</li> </ol>','string'),(2,'es_ES','submissionChecklist','a:5:{i:0;a:2:{s:7:\"content\";s:187:\"El envío no ha sido publicado previamente ni se ha sometido a consideración por ninguna otra revista (o se ha proporcionado una explicación al respecto en los Comentarios al editor/a).\";s:5:\"order\";s:1:\"1\";}i:1;a:2:{s:7:\"content\";s:84:\"El archivo de envío está en formato OpenOffice, Microsoft Word, RTF o WordPerfect.\";s:5:\"order\";s:1:\"2\";}i:2;a:2:{s:7:\"content\";s:78:\"Siempre que sea posible, se proporcionan direcciones URL para las referencias.\";s:5:\"order\";s:1:\"3\";}i:3;a:2:{s:7:\"content\";s:269:\"El texto tiene interlineado sencillo; 12 puntos de tamaño de fuente; se utiliza cursiva en lugar de subrayado (excepto en las direcciones URL); y todas las ilustraciones, figuras y tablas se encuentran colocadas en los lugares del texto apropiados, en vez de al final.\";s:5:\"order\";s:1:\"4\";}i:4;a:2:{s:7:\"content\";s:258:\"El texto se adhiere a los requisitos estilísticos y bibliográficos resumidos en las <a href=\"http://vrinv.unprg.edu.pe/ojs/index.php/prueba/about/submissions#authorGuidelines\" target=\"_new\">Directrices del autor/a</a>, que aparecen en Acerca de la revista.\";s:5:\"order\";s:1:\"5\";}}','object'),(3,'','agenciesEnabledSubmission','0','bool'),(3,'','agenciesEnabledWorkflow','0','bool'),(3,'','agenciesRequired','0','bool'),(3,'','citationsEnabledSubmission','0','bool'),(3,'','citationsEnabledWorkflow','0','bool'),(3,'','citationsRequired','0','bool'),(3,'','contactEmail','emanayay@unprg.edu.pe','string'),(3,'','contactName','Elmer Milton Manayay Tafur','string'),(3,'','contactPhone','945288599','string'),(3,'','copyrightYearBasis','issue','string'),(3,'','copySubmissionAckAddress','','string'),(3,'','copySubmissionAckPrimaryContact','0','bool'),(3,'','coverageEnabledSubmission','0','bool'),(3,'','coverageEnabledWorkflow','0','bool'),(3,'','coverageRequired','0','bool'),(3,'','defaultReviewMode','2','int'),(3,'','disciplinesEnabledSubmission','0','bool'),(3,'','disciplinesEnabledWorkflow','0','bool'),(3,'','disciplinesRequired','0','bool'),(3,'','emailSignature','<br/>\n________________________________________________________________________<br/>\n<a href=\"{$contextUrl}\">{$contextName}</a>','string'),(3,'','enableOai','1','bool'),(3,'','itemsPerPage','30','int'),(3,'','keywordsEnabledSubmission','1','bool'),(3,'','keywordsEnabledWorkflow','1','bool'),(3,'','keywordsRequired','0','bool'),(3,'','languagesEnabledSubmission','0','bool'),(3,'','languagesEnabledWorkflow','0','bool'),(3,'','languagesRequired','0','bool'),(3,'','mailingAddress',NULL,'string'),(3,'','membershipFee','0','int'),(3,'','navItems','N;','object'),(3,'','numPageLinks','30','int'),(3,'','numWeeksPerReview','4','int'),(3,'','onlineIssn','','string'),(3,'','printIssn','2306-3718','string'),(3,'','publicationFee','0','int'),(3,'','publisherInstitution','COMITÉ CINETIFICO','string'),(3,'','purchaseArticleFee','0','int'),(3,'','reviewerAccessKeysEnabled','1','bool'),(3,'','rightsEnabledSubmission','0','bool'),(3,'','rightsEnabledWorkflow','0','bool'),(3,'','rightsRequired','0','bool'),(3,'','sourceEnabledSubmission','0','bool'),(3,'','sourceEnabledWorkflow','0','bool'),(3,'','sourceRequired','0','bool'),(3,'','subjectsEnabledSubmission','0','bool'),(3,'','subjectsEnabledWorkflow','0','bool'),(3,'','subjectsRequired','0','bool'),(3,'','supportedFormLocales','a:1:{i:0;s:5:\"es_ES\";}','object'),(3,'','supportedLocales','a:3:{i:0;s:5:\"en_US\";i:1;s:5:\"pt_BR\";i:2;s:5:\"es_ES\";}','object'),(3,'','supportedSubmissionLocales','a:1:{i:0;s:5:\"es_ES\";}','object'),(3,'','supportEmail',NULL,'string'),(3,'','supportName',NULL,'string'),(3,'','supportPhone',NULL,'string'),(3,'','themePluginPath','default','string'),(3,'','typeEnabledSubmission','0','bool'),(3,'','typeEnabledWorkflow','0','bool'),(3,'','typeRequired','0','bool'),(3,'es_ES','abbreviation','UMBRAL','string'),(3,'es_ES','about','<p>OBJETO Y ALCANCE DE LA REVISTA</p>\r\n<p>Umbral, nueva etapa. Revista de Investigaciones Socioeducativas, es una publicación del&nbsp;Fondo Editorial de la Facultad de Ciencias Histórico Sociales y Educación, FACHSE, de la&nbsp;Universidad Nacional Pedro Ruiz Gallo de Lambayeque, Perú. Su periodicidad será semestral&nbsp;y tiene el propósito de divulgar la producción y transformación del conocimiento&nbsp;en las áreas de humanidades, educación, sociología, ciencias de la comunicación, arqueología,&nbsp;psicología y arte, con sus respectivas áreas afines e interdisciplinas. Es una publicación&nbsp;dirigida a los investigadores, docentes y estudiantes que indagan en las comunidades&nbsp;académicas.</p>\r\n<p>&nbsp;</p>','string'),(3,'es_ES','acronym','U,NE','string'),(3,'es_ES','authorInformation','¿Está interesado en publicar en la revista? Se recomienda revisar la página <a href=\"http://vrinv.unprg.edu.pe/ojs/index.php/UMBRAL/about\">Acerca de la revista</a> para consultar las políticas de sección de la revista, así como las <a href=\"http://vrinv.unprg.edu.pe/ojs/index.php/UMBRAL/about/submissions#authorGuidelines\">Directrices del autor/a</a>. Los autores/as deben <a href=\"http://vrinv.unprg.edu.pe/ojs/index.php/UMBRAL/user/register\">registrarse</a> en la revista antes de publicar o, si ya están registrados, pueden simplemente <a href=\"http://vrinv.unprg.edu.pe/ojs/index.php/index/login\">iniciar sesión</a> y comenzar el proceso de cinco pasos.','string'),(3,'es_ES','authorSelfArchivePolicy','Esta revista permite y anima a los autores/as a publicar artículos enviados a la revista en sus sitios web personales o en depósitos institucionales, tanto antes como después de su publicación en esta revista, siempre y cuando proporcionen información bibliográfica que acredite, si procede, su publicación en ella.','string'),(3,'es_ES','clockssLicense','Esta revista utiliza el sistema CLOCKSS para crear un sistema de archivos distribuido entre las bibliotecas participantes y permite a estas bibliotecas crear archivos permanentes de la revista con finalidad de preservación y restauración. <a href=\"https://clockss.org/\">Saber más...</a>','string'),(3,'es_ES','contactTitle','Editor General','string'),(3,'es_ES','copyeditInstructions','La fase de corrección tiene el propósito de mejorar la fluidez, claridad, gramática, vocabulario y formato del artículo. Supone la última oportunidad para el autor/a de realizar cualquier cambio importante en el texto, puesto que la siguiente fase se limita a las correcciones tipográficas y de formato. El archivo para corregir se encuentra en formato Word o .rtf y, por lo tanto, puede editarse fácilmente como un documento de procesador de textos. Las instrucciones expuestas aquí plantean dos enfoques de corrección. La primera está basada en la función Control de cambios de Microsoft Word y requiere que tanto el corrector/a como el editor/a y el autor/a tengan acceso a este programa. La segunda propuesta, que no depende de un software concreto, se tomó prestada, con el debido permiso, de la Harvard Educational Review. El editor/a de la revista tiene la posibilidad de modificar estas instrucciones, por lo que pueden hacerse sugerencias con el fin de mejorar el proceso de la revista. <h4>Sistemas de corrección</h4> <strong>1. Control de cambios de Microsoft Word</strong> Situado en el menú Herramientas en la barra de menús, la función Control de cambios permite al corrector/a insertar (el texto aparece en color) y suprimir contenido (el texto aparece tachado en color o al margen como eliminado). El corrector/a puede incluir consultas tanto al autor/a (Consultas al autor/a) como al editor/a (Consultas al editor/a) escribiéndolas entre corchetes. Una vez cargada la versión corregida, se le notifica al editor/a. El editor/a revisa entonces el texto y lo notifica al autor/a. El editor/a y el autor/a deben dejar los cambios que consideren pertinentes. Si es necesario realizar más cambios, el editor/a y el autor/a pueden realizarlos en las inserciones o supresiones iniciales, así como realizar nuevas inserciones o supresiones en cualquier parte del texto. Los autores/as y editores/as deben responder a cada una de las consultas recibidas, con respuestas incluidas entre los corchetes. Una vez que el editor/a y el autor/a hayan revisado el texto, el corrector realizará un repaso final del texto y aceptará los cambios como preparación para la fase de maquetación y de galerada. <strong>2. Harvard Educational Review </strong> <strong>Instrucciones para realizar revisiones electrónicas en el manuscrito</strong> Siga el siguiente protocolo para realizar revisiones electrónicas en su manuscrito: <strong>Responder a cambios sugeridos.</strong> &nbsp; Para cada cambio sugerido que acepte, elimine la negrita del texto. &nbsp; Para cada cambio sugerido que no acepte, vuelva a introducir el texto original y resáltelo en <strong>negrita</strong>. <strong>Realizar inserciones y supresiones.</strong> &nbsp; Indique las inserciones resaltando el texto nuevo en <strong>negrita</strong>. &nbsp; Reemplace las secciones eliminadas con <strong>[texto eliminado]</strong>. &nbsp; Si elimina una o más oraciones, indíquelo con una nota, p. ej., <strong>[2 oraciones eliminadas]</strong>. <strong>Responder a consultas al autor (QAs).</strong> &nbsp; Mantenga todas las consultas al autor intactas y en negrita dentro del texto. No las elimine. &nbsp; Para responder a una consulta al autor, añada un comentario tras ella. Los comentarios deben delimitarse con: <strong>[Comentario:]</strong> &nbsp; p. ej., <strong>[Comentario: Discusión de la metodología ampliada como se sugirió]</strong>. <strong>Realizar comentarios.</strong> &nbsp; Utilice comentarios para explicar cambios en la organización o revisiones graves &nbsp; p. ej., <strong>[Comentario: El párrafo anterior se ha movido de la pág. 5 a la pág. 7].</strong> &nbsp; Nota: Si hace referencia a números de página, utilice los números de página de la versión impresa del manuscrito que se le envió. Este punto es importante puesto que los números de página pueden cambiar si el documento se revisa de manera electrónica. <h4>Ejemplo de una revisión electrónica</h4> <ol> <li><strong>Corrección inici\nal.</strong> El corrector/a de la revista editará el texto para mejorar la fluidez, claridad, gramática, vocabulario y formato del artículo, así como para incluir consultas al autor si es necesario. Una vez que la edición inicial se haya completado, el corrector/a cargará el documento revisado a través del sitio web de la revista y notificará al autor/a que el manuscrito editado está disponible para revisión.</li> <li><strong>Corrección del autor/a.</strong> Antes de realizar cambios radicales en la estructura y organización del manuscrito editado, los autores/as deben comprobarlos con los editores/as que codirigen la pieza. Los autores/as deben aceptar/rechazar cualquier cambio realizado durante la corrección inicial, según convenga, y responder a todas las consultas. Cuando se finalicen las revisiones, los autores/as deben cambiar el nombre del archivo de NombreAutorQA.doc a NombreAutorQAR.doc (p. ej., de LeeQA.doc a LeeQAR.doc) y cargar el documento revisado a través del sitio web de la revista siguiendo las instrucciones.</li> <li><strong>Corrección final.</strong> El corrector/a de la revista comprobará los cambios realizados por el autor/a e incorporará las respuestas a las consultas al autor para crear un manuscrito final. Cuando termine, el corrector/a cargará el documento final a través del sitio web de la revista y enviará una alerta al maquetista para completar el formateado.</li> </ol>','string'),(3,'es_ES','description','<p><img style=\"float: left;\" src=\"/ojs/public/site/images/adminopenjs/umbral.jpg\" width=\"74\" height=\"102\"><strong><em>Umbral, Nueva Etapa</em></strong><br>Revista de Investigaciones Socioeducativas</p>','string'),(3,'es_ES','editorialTeam','<p>Editor General:</p>\r\n<p>- Elmer Milton Manayay Tafur</p>','string'),(3,'es_ES','homepageImage','a:6:{s:4:\"name\";s:18:\"REVISTA UMBRAL.JPG\";s:10:\"uploadName\";s:23:\"homepageImage_es_ES.jpg\";s:5:\"width\";i:504;s:6:\"height\";i:687;s:12:\"dateUploaded\";s:19:\"2019-10-18 20:37:35\";s:7:\"altText\";s:0:\"\";}','object'),(3,'es_ES','librarianInformation','Se recomienda a los investigadores/as bibliotecarios/as que incluyan esta revista en su listado de revistas electrónicas. Asimismo, cabría destacar que el sistema de publicación de código abierto de esta revista es apto para bibliotecas con personal docente que desee editar sus propias revistas (ver <a href=\"http://pkp.sfu.ca/ojs\">Open Journal Systems</a>).','string'),(3,'es_ES','lockssLicense','Esta revista utiliza el sistema LOCKSS para crear un sistema de archivo distribuido entre bibliotecas colaboradoras, a las que permite crear archivos permanentes de la revista con fines de conservación y restauración. <a href=\"https://lockss.org/\">Más...</a>','string'),(3,'es_ES','name','UMBRAL, NUEVA ETAPA','string'),(3,'es_ES','openAccessPolicy','Esta revista proporciona un acceso abierto inmediato a su contenido, basado en el principio de ofrecer al público un acceso libre a las investigaciones ayuda a un mayor intercambio global de conocimiento.','string'),(3,'es_ES','pageHeaderLogoImage','a:6:{s:4:\"name\";s:18:\"REVISTA UMBRAL.JPG\";s:10:\"uploadName\";s:29:\"pageHeaderLogoImage_es_ES.jpg\";s:5:\"width\";i:504;s:6:\"height\";i:687;s:12:\"dateUploaded\";s:19:\"2019-10-18 20:34:19\";s:7:\"altText\";s:0:\"\";}','object'),(3,'es_ES','privacyStatement','<p>Los nombres y las direcciones de correo electrónico introducidos en esta revista se usarán exclusivamente para los fines establecidos en ella y no se proporcionarán a terceros o para su uso con otros fines.</p>','string'),(3,'es_ES','proofInstructions','<p>La fase de corrección de pruebas tiene el propósito de detectar errores ortográficos en la galerada, así como gramaticales y de formato. En esta fase no se realizan más cambios importantes, a menos que se haya acordado con el editor/a de sección. En Maquetación, haga clic en VER PRUEBA para ver los HTML, PDF y otros formatos de archivo disponibles utilizados en la edición de este elemento.</p> <h4>Para errores ortográficos y gramaticales</h4> <p>Copie la palabra o grupo de palabras problemáticas y péguelas en el cuadro de correciones de pruebas con instrucciones al editor/a \"CAMBIAR-POR\" como sigue:</p> <pre>1. CAMBIAR... entonces los otras POR... entonces los otros</pre> <br /> <pre>2. CAMBIAR... Malinowsky POR... Malinowski</pre> <br /> <h4>Para errores de formato</h4> <p>Describa la ubicación y naturaleza del problema en el cuadro de correcciones de pruebas después de escribir en el título \"FORMATO\" como sigue:</p> <br /> <pre>3. FORMATO Los números de la Tabla 3 no están alineados en la tercera columna.</pre> <br /> <pre>4. FORMATO El párrafo que comienza con \"Este último tema...\" no está sangrado.</pre>','string'),(3,'es_ES','readerInformation','Animamos a los lectores/as a registrarse en el servicio de notificación de publicaciones de la revista. Utilice el enlace <a href=\"http://vrinv.unprg.edu.pe/ojs/index.php/UMBRAL/user/register\">Registro</a> de la parte superior de la página de inicio de la revista. Como resultado del registro, el lector/a recibirá por correo electrónico la Tabla de contenidos de cada número de la revista. Esta lista también permite que se le atribuya a la revista un cierto nivel de apoyo o número de lectores/as. Consulte la <a href=\"http://vrinv.unprg.edu.pe/ojs/index.php/UMBRAL/about/submissions#privacyStatement\">Declaración de privacidad</a> de la revista, que garantiza a los lectores/as que sus nombres y direcciones de correo electrónico no se usarán con otros fines.','string'),(3,'es_ES','refLinkInstructions','<h4>Añadir enlaces de referencia en el proceso de maquetación</h4> <p>Al convertir un envío a HTML o PDF, asegúrese de que todos los hipervínculos del envío están activos.</p> <h4>A. Si el autor/a proporciona un enlace con la referencia</h4> <ol> <li>Mientras el envío se encuentre todavía en formato de procesador de textos (p. ej., Word), añada la frase VER ELEMENTO al final de la referencia con la dirección URL.</li> <li>Convierta esa frase en un hipervínculo seleccionándola y utilizando la herramienta de Word Insertar hipervínculo y la dirección URL previa.</li> </ol> <h4>B. Permitir a los lectores/as buscar referencias en Google Académico</h4> <ol> <li>Mientras el envío se encuentre todavía en formato de procesador de textos (p. ej., Word), copie el título del trabajo referenciado en la lista de referencias (si el título es muy común —p. ej., \"Paz\"— copie también el autor).</li> <li>Pegue el título de la referencia entre los dos símbolos %22 y coloque un símbolo + entre cada palabra: https://scholar.google.com/sc?q=%22PEGAR+TÍTULO+AQUÍ%22</li> <li>Añada la frase BÚSQUEDA GOOGLE ACADÉMICO al final de cada cita en la lista de referencias del envío.</li> <li>Convierta esa frase en un hipervínculo seleccionándola y utilizando la herramienta de Word Insertar hipervínculo y la dirección URL preparada en el apartado nº 2.</li> </ol> <h4>C. Permitir a los lectores/as buscar referencias con un DOI</h4> <ol> <li>Mientras el envío se encuentre todavía en Word, copie un lote de referencias en el texto de consulta CrossRef https://www.crossref.org/freeTextQuery/.</li> <li>Pegue cada DOI que le proporcione la consulta en la siguiente dirección URL (entre = y &amp;): http://www.cmaj.ca/cgi/external_ref?access_num=PEGAR DOI#AQUÍ&amp;link_type=DOI.</li> <li>Añada la frase CrossRef al final de cada cita en la lista de referencias del envío.</li> <li>Convierta esa frase en un hipervínculo seleccionándola y utilizando la herramienta de Word Insertar hipervínculo y la dirección URL preparada en el apartado nº 2.</li> </ol>','string'),(3,'es_ES','submissionChecklist','a:5:{i:0;a:2:{s:7:\"content\";s:187:\"El envío no ha sido publicado previamente ni se ha sometido a consideración por ninguna otra revista (o se ha proporcionado una explicación al respecto en los Comentarios al editor/a).\";s:5:\"order\";s:1:\"1\";}i:1;a:2:{s:7:\"content\";s:84:\"El archivo de envío está en formato OpenOffice, Microsoft Word, RTF o WordPerfect.\";s:5:\"order\";s:1:\"2\";}i:2;a:2:{s:7:\"content\";s:78:\"Siempre que sea posible, se proporcionan direcciones URL para las referencias.\";s:5:\"order\";s:1:\"3\";}i:3;a:2:{s:7:\"content\";s:269:\"El texto tiene interlineado sencillo; 12 puntos de tamaño de fuente; se utiliza cursiva en lugar de subrayado (excepto en las direcciones URL); y todas las ilustraciones, figuras y tablas se encuentran colocadas en los lugares del texto apropiados, en vez de al final.\";s:5:\"order\";s:1:\"4\";}i:4;a:2:{s:7:\"content\";s:258:\"El texto se adhiere a los requisitos estilísticos y bibliográficos resumidos en las <a href=\"http://vrinv.unprg.edu.pe/ojs/index.php/UMBRAL/about/submissions#authorGuidelines\" target=\"_new\">Directrices del autor/a</a>, que aparecen en Acerca de la revista.\";s:5:\"order\";s:1:\"5\";}}','object'),(4,'','agenciesEnabledSubmission','0','bool'),(4,'','agenciesEnabledWorkflow','0','bool'),(4,'','agenciesRequired','0','bool'),(4,'','citationsEnabledSubmission','0','bool'),(4,'','citationsEnabledWorkflow','0','bool'),(4,'','citationsRequired','0','bool'),(4,'','contactEmail','adapatricia33@hotmail.com','string'),(4,'','contactName','Ada Patricia Barturén Quispe','string'),(4,'','contactPhone','+51- 977301137','string'),(4,'','copyrightYearBasis','issue','string'),(4,'','copySubmissionAckAddress','adapatricia33@hotmail.com','string'),(4,'','copySubmissionAckPrimaryContact','1','bool'),(4,'','coverageEnabledSubmission','0','bool'),(4,'','coverageEnabledWorkflow','0','bool'),(4,'','coverageRequired','0','bool'),(4,'','defaultReviewMode','2','int'),(4,'','disciplinesEnabledSubmission','0','bool'),(4,'','disciplinesEnabledWorkflow','0','bool'),(4,'','disciplinesRequired','0','bool'),(4,'','emailSignature','<br/>\n________________________________________________________________________<br/>\n<a href=\"{$contextUrl}\">{$contextName}</a>','string'),(4,'','enableOai','1','bool'),(4,'','itemsPerPage','25','int'),(4,'','keywordsEnabledSubmission','1','bool'),(4,'','keywordsEnabledWorkflow','1','bool'),(4,'','keywordsRequired','0','bool'),(4,'','languagesEnabledSubmission','0','bool'),(4,'','languagesEnabledWorkflow','0','bool'),(4,'','languagesRequired','0','bool'),(4,'','mailingAddress',NULL,'string'),(4,'','membershipFee','0','int'),(4,'','numPageLinks','10','int'),(4,'','numWeeksPerReview','4','int'),(4,'','onlineIssn','','string'),(4,'','printIssn','2221-5921','string'),(4,'','publicationFee','0','int'),(4,'','publisherInstitution','Editorial Universitaria','string'),(4,'','purchaseArticleFee','0','int'),(4,'','reviewerAccessKeysEnabled','1','bool'),(4,'','rightsEnabledSubmission','0','bool'),(4,'','rightsEnabledWorkflow','0','bool'),(4,'','rightsRequired','0','bool'),(4,'','sourceEnabledSubmission','0','bool'),(4,'','sourceEnabledWorkflow','0','bool'),(4,'','sourceRequired','0','bool'),(4,'','subjectsEnabledSubmission','0','bool'),(4,'','subjectsEnabledWorkflow','0','bool'),(4,'','subjectsRequired','0','bool'),(4,'','supportedFormLocales','a:1:{i:0;s:5:\"es_ES\";}','object'),(4,'','supportedLocales','a:3:{i:0;s:5:\"en_US\";i:1;s:5:\"pt_BR\";i:2;s:5:\"es_ES\";}','object'),(4,'','supportedSubmissionLocales','a:1:{i:0;s:5:\"es_ES\";}','object'),(4,'','supportEmail',NULL,'string'),(4,'','supportName',NULL,'string'),(4,'','supportPhone',NULL,'string'),(4,'','themePluginPath','default','string'),(4,'','typeEnabledSubmission','0','bool'),(4,'','typeEnabledWorkflow','0','bool'),(4,'','typeRequired','0','bool'),(4,'es_ES','abbreviation','RC','string'),(4,'es_ES','about','<p>EL&nbsp;<strong>VICERRECTORADO DE INVESTIGACIÓN</strong>&nbsp;DE LA UNIVERSIDAD NACIONAL PEDRO RUIZ GALLO, MEDIANTE LA&nbsp;<strong>OFICINA GENERAL EDITORIAL UNIVERSITARIA</strong>&nbsp;PROMUEVE LA PUBLICACIÓN DE ARTÍCULOS CIENTÍFICOS EN SU REVISTA MULTIDISCIPLINARIA (<strong>REVISTA CIENTÍFICA</strong>&nbsp;\"<em>Ciencia Tecnología y Humanidades</em>\").</p>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<img style=\"float: left;\" src=\"/openjournal/public/site/images/abarturen/UNPRG1.jpg\" alt=\"\" width=\"414\" height=\"213\"></p>','string'),(4,'es_ES','acronym','RC','string'),(4,'es_ES','authorInformation','¿Está interesado en publicar en la revista? Se recomienda revisar la página <a href=\"http://vrinv.unprg.edu.pe/ojs/index.php/RC/about\">Acerca de la revista</a> para consultar las políticas de sección de la revista, así como las <a href=\"http://vrinv.unprg.edu.pe/ojs/index.php/RC/about/submissions#authorGuidelines\">Directrices del autor/a</a>. Los autores/as deben <a href=\"http://vrinv.unprg.edu.pe/ojs/index.php/RC/user/register\">registrarse</a> en la revista antes de publicar o, si ya están registrados, pueden simplemente <a href=\"http://vrinv.unprg.edu.pe/ojs/index.php/index/login\">iniciar sesión</a> y comenzar el proceso de cinco pasos.','string'),(4,'es_ES','authorSelfArchivePolicy','Esta revista permite y anima a los autores/as a publicar artículos enviados a la revista en sus sitios web personales o en depósitos institucionales, tanto antes como después de su publicación en esta revista, siempre y cuando proporcionen información bibliográfica que acredite, si procede, su publicación en ella.','string'),(4,'es_ES','clockssLicense','Esta revista utiliza el sistema CLOCKSS para crear un sistema de archivos distribuido entre las bibliotecas participantes y permite a estas bibliotecas crear archivos permanentes de la revista con finalidad de preservación y restauración. <a href=\"https://clockss.org/\">Saber más...</a>','string'),(4,'es_ES','contactAffiliation','Universidad Nacional Pedro Ruiz Gallo','string'),(4,'es_ES','contactTitle','Editor Jefe','string'),(4,'es_ES','copyeditInstructions','La fase de corrección tiene el propósito de mejorar la fluidez, claridad, gramática, vocabulario y formato del artículo. Supone la última oportunidad para el autor/a de realizar cualquier cambio importante en el texto, puesto que la siguiente fase se limita a las correcciones tipográficas y de formato. El archivo para corregir se encuentra en formato Word o .rtf y, por lo tanto, puede editarse fácilmente como un documento de procesador de textos. Las instrucciones expuestas aquí plantean dos enfoques de corrección. La primera está basada en la función Control de cambios de Microsoft Word y requiere que tanto el corrector/a como el editor/a y el autor/a tengan acceso a este programa. La segunda propuesta, que no depende de un software concreto, se tomó prestada, con el debido permiso, de la Harvard Educational Review. El editor/a de la revista tiene la posibilidad de modificar estas instrucciones, por lo que pueden hacerse sugerencias con el fin de mejorar el proceso de la revista. <h4>Sistemas de corrección</h4> <strong>1. Control de cambios de Microsoft Word</strong> Situado en el menú Herramientas en la barra de menús, la función Control de cambios permite al corrector/a insertar (el texto aparece en color) y suprimir contenido (el texto aparece tachado en color o al margen como eliminado). El corrector/a puede incluir consultas tanto al autor/a (Consultas al autor/a) como al editor/a (Consultas al editor/a) escribiéndolas entre corchetes. Una vez cargada la versión corregida, se le notifica al editor/a. El editor/a revisa entonces el texto y lo notifica al autor/a. El editor/a y el autor/a deben dejar los cambios que consideren pertinentes. Si es necesario realizar más cambios, el editor/a y el autor/a pueden realizarlos en las inserciones o supresiones iniciales, así como realizar nuevas inserciones o supresiones en cualquier parte del texto. Los autores/as y editores/as deben responder a cada una de las consultas recibidas, con respuestas incluidas entre los corchetes. Una vez que el editor/a y el autor/a hayan revisado el texto, el corrector realizará un repaso final del texto y aceptará los cambios como preparación para la fase de maquetación y de galerada. <strong>2. Harvard Educational Review </strong> <strong>Instrucciones para realizar revisiones electrónicas en el manuscrito</strong> Siga el siguiente protocolo para realizar revisiones electrónicas en su manuscrito: <strong>Responder a cambios sugeridos.</strong> &nbsp; Para cada cambio sugerido que acepte, elimine la negrita del texto. &nbsp; Para cada cambio sugerido que no acepte, vuelva a introducir el texto original y resáltelo en <strong>negrita</strong>. <strong>Realizar inserciones y supresiones.</strong> &nbsp; Indique las inserciones resaltando el texto nuevo en <strong>negrita</strong>. &nbsp; Reemplace las secciones eliminadas con <strong>[texto eliminado]</strong>. &nbsp; Si elimina una o más oraciones, indíquelo con una nota, p. ej., <strong>[2 oraciones eliminadas]</strong>. <strong>Responder a consultas al autor (QAs).</strong> &nbsp; Mantenga todas las consultas al autor intactas y en negrita dentro del texto. No las elimine. &nbsp; Para responder a una consulta al autor, añada un comentario tras ella. Los comentarios deben delimitarse con: <strong>[Comentario:]</strong> &nbsp; p. ej., <strong>[Comentario: Discusión de la metodología ampliada como se sugirió]</strong>. <strong>Realizar comentarios.</strong> &nbsp; Utilice comentarios para explicar cambios en la organización o revisiones graves &nbsp; p. ej., <strong>[Comentario: El párrafo anterior se ha movido de la pág. 5 a la pág. 7].</strong> &nbsp; Nota: Si hace referencia a números de página, utilice los números de página de la versión impresa del manuscrito que se le envió. Este punto es importante puesto que los números de página pueden cambiar si el documento se revisa de manera electrónica. <h4>Ejemplo de una revisión electrónica</h4> <ol> <li><strong>Corrección inici\nal.</strong> El corrector/a de la revista editará el texto para mejorar la fluidez, claridad, gramática, vocabulario y formato del artículo, así como para incluir consultas al autor si es necesario. Una vez que la edición inicial se haya completado, el corrector/a cargará el documento revisado a través del sitio web de la revista y notificará al autor/a que el manuscrito editado está disponible para revisión.</li> <li><strong>Corrección del autor/a.</strong> Antes de realizar cambios radicales en la estructura y organización del manuscrito editado, los autores/as deben comprobarlos con los editores/as que codirigen la pieza. Los autores/as deben aceptar/rechazar cualquier cambio realizado durante la corrección inicial, según convenga, y responder a todas las consultas. Cuando se finalicen las revisiones, los autores/as deben cambiar el nombre del archivo de NombreAutorQA.doc a NombreAutorQAR.doc (p. ej., de LeeQA.doc a LeeQAR.doc) y cargar el documento revisado a través del sitio web de la revista siguiendo las instrucciones.</li> <li><strong>Corrección final.</strong> El corrector/a de la revista comprobará los cambios realizados por el autor/a e incorporará las respuestas a las consultas al autor para crear un manuscrito final. Cuando termine, el corrector/a cargará el documento final a través del sitio web de la revista y enviará una alerta al maquetista para completar el formateado.</li> </ol>','string'),(4,'es_ES','description','<p><img style=\"float: left;\" src=\"/ojs/public/site/images/adminopenjs/REVISTA_CIENCIA_TECNOLOGÌA_Y_HUMANIDADES.JPG\" width=\"104\" height=\"148\"><strong>REVISTA CIENTÍFICA<br><em>Ciencia, Tecnología y Humanidades</em><br><em>ISSN:</em></strong><em> 2221- 5921 (impreso)</em><br><em><strong>Revista científica</strong> es ua&nbsp; revista multidiciplinaria, que abarca diferentes áreas del saber científico. El alcance de la revista es Nacional e Internacional.</em></p>','string'),(4,'es_ES','editorialTeam','<p>Mg. Ada Patricia Barturén Quispe<br>Editor Jefe</p>\r\n<p><img src=\"/openjournal/public/site/images/abarturen/ADA2.jpg\" alt=\"\"></p>\r\n<p>&nbsp;</p>','string'),(4,'es_ES','homepageImage','a:6:{s:4:\"name\";s:45:\"REVISTA CIENCIA TECNOLOGÌA Y HUMANIDADES.JPG\";s:10:\"uploadName\";s:23:\"homepageImage_es_ES.jpg\";s:5:\"width\";i:529;s:6:\"height\";i:751;s:12:\"dateUploaded\";s:19:\"2019-10-28 15:25:25\";s:7:\"altText\";s:0:\"\";}','object'),(4,'es_ES','librarianInformation','Se recomienda a los investigadores/as bibliotecarios/as que incluyan esta revista en su listado de revistas electrónicas. Asimismo, cabría destacar que el sistema de publicación de código abierto de esta revista es apto para bibliotecas con personal docente que desee editar sus propias revistas (ver <a href=\"http://pkp.sfu.ca/ojs\">Open Journal Systems</a>).','string'),(4,'es_ES','lockssLicense','Esta revista utiliza el sistema LOCKSS para crear un sistema de archivo distribuido entre bibliotecas colaboradoras, a las que permite crear archivos permanentes de la revista con fines de conservación y restauración. <a href=\"https://lockss.org/\">Más...</a>','string'),(4,'es_ES','name','REVISTA CIENTÍFICA','string'),(4,'es_ES','openAccessPolicy','Esta revista proporciona un acceso abierto inmediato a su contenido, basado en el principio de ofrecer al público un acceso libre a las investigaciones ayuda a un mayor intercambio global de conocimiento.','string'),(4,'es_ES','pageHeaderLogoImage','a:6:{s:4:\"name\";s:16:\"logo revista.JPG\";s:10:\"uploadName\";s:29:\"pageHeaderLogoImage_es_ES.jpg\";s:5:\"width\";i:1282;s:6:\"height\";i:172;s:12:\"dateUploaded\";s:19:\"2019-10-28 15:24:22\";s:7:\"altText\";s:0:\"\";}','object'),(4,'es_ES','privacyStatement','<p>Los nombres y las direcciones de correo electrónico introducidos en esta revista se usarán exclusivamente para los fines establecidos en ella y no se proporcionarán a terceros o para su uso con otros fines.</p>','string'),(4,'es_ES','proofInstructions','<p>La fase de corrección de pruebas tiene el propósito de detectar errores ortográficos en la galerada, así como gramaticales y de formato. En esta fase no se realizan más cambios importantes, a menos que se haya acordado con el editor/a de sección. En Maquetación, haga clic en VER PRUEBA para ver los HTML, PDF y otros formatos de archivo disponibles utilizados en la edición de este elemento.</p> <h4>Para errores ortográficos y gramaticales</h4> <p>Copie la palabra o grupo de palabras problemáticas y péguelas en el cuadro de correciones de pruebas con instrucciones al editor/a \"CAMBIAR-POR\" como sigue:</p> <pre>1. CAMBIAR... entonces los otras POR... entonces los otros</pre> <br /> <pre>2. CAMBIAR... Malinowsky POR... Malinowski</pre> <br /> <h4>Para errores de formato</h4> <p>Describa la ubicación y naturaleza del problema en el cuadro de correcciones de pruebas después de escribir en el título \"FORMATO\" como sigue:</p> <br /> <pre>3. FORMATO Los números de la Tabla 3 no están alineados en la tercera columna.</pre> <br /> <pre>4. FORMATO El párrafo que comienza con \"Este último tema...\" no está sangrado.</pre>','string'),(4,'es_ES','readerInformation','Animamos a los lectores/as a registrarse en el servicio de notificación de publicaciones de la revista. Utilice el enlace <a href=\"http://vrinv.unprg.edu.pe/ojs/index.php/RC/user/register\">Registro</a> de la parte superior de la página de inicio de la revista. Como resultado del registro, el lector/a recibirá por correo electrónico la Tabla de contenidos de cada número de la revista. Esta lista también permite que se le atribuya a la revista un cierto nivel de apoyo o número de lectores/as. Consulte la <a href=\"http://vrinv.unprg.edu.pe/ojs/index.php/RC/about/submissions#privacyStatement\">Declaración de privacidad</a> de la revista, que garantiza a los lectores/as que sus nombres y direcciones de correo electrónico no se usarán con otros fines.','string'),(4,'es_ES','refLinkInstructions','<h4>Añadir enlaces de referencia en el proceso de maquetación</h4> <p>Al convertir un envío a HTML o PDF, asegúrese de que todos los hipervínculos del envío están activos.</p> <h4>A. Si el autor/a proporciona un enlace con la referencia</h4> <ol> <li>Mientras el envío se encuentre todavía en formato de procesador de textos (p. ej., Word), añada la frase VER ELEMENTO al final de la referencia con la dirección URL.</li> <li>Convierta esa frase en un hipervínculo seleccionándola y utilizando la herramienta de Word Insertar hipervínculo y la dirección URL previa.</li> </ol> <h4>B. Permitir a los lectores/as buscar referencias en Google Académico</h4> <ol> <li>Mientras el envío se encuentre todavía en formato de procesador de textos (p. ej., Word), copie el título del trabajo referenciado en la lista de referencias (si el título es muy común —p. ej., \"Paz\"— copie también el autor).</li> <li>Pegue el título de la referencia entre los dos símbolos %22 y coloque un símbolo + entre cada palabra: https://scholar.google.com/sc?q=%22PEGAR+TÍTULO+AQUÍ%22</li> <li>Añada la frase BÚSQUEDA GOOGLE ACADÉMICO al final de cada cita en la lista de referencias del envío.</li> <li>Convierta esa frase en un hipervínculo seleccionándola y utilizando la herramienta de Word Insertar hipervínculo y la dirección URL preparada en el apartado nº 2.</li> </ol> <h4>C. Permitir a los lectores/as buscar referencias con un DOI</h4> <ol> <li>Mientras el envío se encuentre todavía en Word, copie un lote de referencias en el texto de consulta CrossRef https://www.crossref.org/freeTextQuery/.</li> <li>Pegue cada DOI que le proporcione la consulta en la siguiente dirección URL (entre = y &amp;): http://www.cmaj.ca/cgi/external_ref?access_num=PEGAR DOI#AQUÍ&amp;link_type=DOI.</li> <li>Añada la frase CrossRef al final de cada cita en la lista de referencias del envío.</li> <li>Convierta esa frase en un hipervínculo seleccionándola y utilizando la herramienta de Word Insertar hipervínculo y la dirección URL preparada en el apartado nº 2.</li> </ol>','string'),(4,'es_ES','submissionChecklist','a:5:{i:0;a:2:{s:7:\"content\";s:187:\"El envío no ha sido publicado previamente ni se ha sometido a consideración por ninguna otra revista (o se ha proporcionado una explicación al respecto en los Comentarios al editor/a).\";s:5:\"order\";s:1:\"1\";}i:1;a:2:{s:7:\"content\";s:84:\"El archivo de envío está en formato OpenOffice, Microsoft Word, RTF o WordPerfect.\";s:5:\"order\";s:1:\"2\";}i:2;a:2:{s:7:\"content\";s:78:\"Siempre que sea posible, se proporcionan direcciones URL para las referencias.\";s:5:\"order\";s:1:\"3\";}i:3;a:2:{s:7:\"content\";s:269:\"El texto tiene interlineado sencillo; 12 puntos de tamaño de fuente; se utiliza cursiva en lugar de subrayado (excepto en las direcciones URL); y todas las ilustraciones, figuras y tablas se encuentran colocadas en los lugares del texto apropiados, en vez de al final.\";s:5:\"order\";s:1:\"4\";}i:4;a:2:{s:7:\"content\";s:254:\"El texto se adhiere a los requisitos estilísticos y bibliográficos resumidos en las <a href=\"http://vrinv.unprg.edu.pe/ojs/index.php/RC/about/submissions#authorGuidelines\" target=\"_new\">Directrices del autor/a</a>, que aparecen en Acerca de la revista.\";s:5:\"order\";s:1:\"5\";}}','object');
/*!40000 ALTER TABLE `journal_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journals`
--

DROP TABLE IF EXISTS `journals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `journals` (
  `journal_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `path` varchar(32) NOT NULL,
  `seq` double NOT NULL DEFAULT '0',
  `primary_locale` varchar(14) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`journal_id`),
  UNIQUE KEY `journals_path` (`path`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journals`
--

LOCK TABLES `journals` WRITE;
/*!40000 ALTER TABLE `journals` DISABLE KEYS */;
INSERT INTO `journals` VALUES (1,'cytaf',7,'es_ES',1),(2,'prueba',5,'es_ES',1),(3,'UMBRAL',3,'es_ES',1),(4,'RC',1,'es_ES',1);
/*!40000 ALTER TABLE `journals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `library_file_settings`
--

DROP TABLE IF EXISTS `library_file_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `library_file_settings` (
  `file_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `library_file_settings_pkey` (`file_id`,`locale`,`setting_name`),
  KEY `library_file_settings_id` (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `library_files` (
  `file_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `original_file_name` varchar(255) NOT NULL,
  `file_type` varchar(255) NOT NULL,
  `file_size` bigint(20) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `date_uploaded` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `public_access` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`file_id`),
  KEY `library_files_submission_id` (`submission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `library_files`
--

LOCK TABLES `library_files` WRITE;
/*!40000 ALTER TABLE `library_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `library_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metadata_description_settings`
--

DROP TABLE IF EXISTS `metadata_description_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metadata_description_settings` (
  `metadata_description_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `metadata_descripton_settings_pkey` (`metadata_description_id`,`locale`,`setting_name`),
  KEY `metadata_description_settings_id` (`metadata_description_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metadata_description_settings`
--

LOCK TABLES `metadata_description_settings` WRITE;
/*!40000 ALTER TABLE `metadata_description_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `metadata_description_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metadata_descriptions`
--

DROP TABLE IF EXISTS `metadata_descriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metadata_descriptions` (
  `metadata_description_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint(20) NOT NULL DEFAULT '0',
  `assoc_id` bigint(20) NOT NULL DEFAULT '0',
  `schema_namespace` varchar(255) NOT NULL,
  `schema_name` varchar(255) NOT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `seq` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`metadata_description_id`),
  KEY `metadata_descriptions_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metadata_descriptions`
--

LOCK TABLES `metadata_descriptions` WRITE;
/*!40000 ALTER TABLE `metadata_descriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `metadata_descriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metrics`
--

DROP TABLE IF EXISTS `metrics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metrics` (
  `load_id` varchar(255) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `pkp_section_id` bigint(20) DEFAULT NULL,
  `assoc_object_type` bigint(20) DEFAULT NULL,
  `assoc_object_id` bigint(20) DEFAULT NULL,
  `submission_id` bigint(20) DEFAULT NULL,
  `representation_id` bigint(20) DEFAULT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `day` varchar(8) DEFAULT NULL,
  `month` varchar(6) DEFAULT NULL,
  `file_type` tinyint(4) DEFAULT NULL,
  `country_id` varchar(2) DEFAULT NULL,
  `region` varchar(2) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `metric_type` varchar(255) NOT NULL,
  `metric` int(11) NOT NULL,
  KEY `metrics_load_id` (`load_id`),
  KEY `metrics_metric_type_context_id` (`metric_type`,`context_id`),
  KEY `metrics_metric_type_submission_id_assoc_type` (`metric_type`,`submission_id`,`assoc_type`),
  KEY `metrics_metric_type_submission_id_assoc` (`metric_type`,`context_id`,`assoc_type`,`assoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metrics`
--

LOCK TABLES `metrics` WRITE;
/*!40000 ALTER TABLE `metrics` DISABLE KEYS */;
INSERT INTO `metrics` VALUES ('usage_events_20191017.log',1,NULL,NULL,NULL,NULL,NULL,256,1,'20191017','201910',NULL,NULL,NULL,NULL,'ojs::counter',18),('usage_events_20191018.log',1,NULL,NULL,NULL,NULL,NULL,256,1,'20191018','201910',NULL,NULL,NULL,NULL,'ojs::counter',3),('usage_events_20191018.log',3,NULL,NULL,NULL,NULL,NULL,256,3,'20191018','201910',NULL,NULL,NULL,NULL,'ojs::counter',3),('usage_events_20191022.log',3,NULL,NULL,NULL,NULL,NULL,256,3,'20191022','201910',NULL,NULL,NULL,NULL,'ojs::counter',6),('usage_events_20191025.log',1,NULL,NULL,NULL,NULL,NULL,256,1,'20191025','201910',NULL,NULL,NULL,NULL,'ojs::counter',1),('usage_events_20191025.log',1,NULL,NULL,NULL,NULL,NULL,259,1,'20191025','201910',NULL,NULL,NULL,NULL,'ojs::counter',3),('usage_events_20191024.log',1,NULL,NULL,NULL,NULL,NULL,256,1,'20191024','201910',NULL,NULL,NULL,NULL,'ojs::counter',8),('usage_events_20191024.log',3,NULL,NULL,NULL,NULL,NULL,256,3,'20191024','201910',NULL,NULL,NULL,NULL,'ojs::counter',1),('usage_events_20191024.log',1,NULL,NULL,NULL,NULL,NULL,259,1,'20191024','201910',NULL,NULL,NULL,NULL,'ojs::counter',4),('usage_events_20191027.log',1,NULL,NULL,NULL,NULL,NULL,256,1,'20191027','201910',NULL,NULL,NULL,NULL,'ojs::counter',2),('usage_events_20191027.log',2,NULL,NULL,NULL,NULL,NULL,256,2,'20191027','201910',NULL,NULL,NULL,NULL,'ojs::counter',1),('usage_events_20191027.log',3,NULL,NULL,NULL,NULL,NULL,256,3,'20191027','201910',NULL,NULL,NULL,NULL,'ojs::counter',2),('usage_events_20191027.log',1,NULL,NULL,NULL,NULL,NULL,259,1,'20191027','201910',NULL,NULL,NULL,NULL,'ojs::counter',1),('usage_events_20191028.log',1,NULL,NULL,NULL,NULL,NULL,256,1,'20191028','201910',NULL,NULL,NULL,NULL,'ojs::counter',2),('usage_events_20191028.log',4,NULL,NULL,NULL,NULL,NULL,259,3,'20191028','201910',NULL,NULL,NULL,NULL,'ojs::counter',7),('usage_events_20191028.log',4,5,259,3,1,NULL,1048585,1,'20191028','201910',NULL,NULL,NULL,NULL,'ojs::counter',2);
/*!40000 ALTER TABLE `metrics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navigation_menu_item_assignment_settings`
--

DROP TABLE IF EXISTS `navigation_menu_item_assignment_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `navigation_menu_item_assignment_settings` (
  `navigation_menu_item_assignment_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `navigation_menu_item_assignment_settings_pkey` (`navigation_menu_item_assignment_id`,`locale`,`setting_name`),
  KEY `assignment_settings_navigation_menu_item_assignment_id` (`navigation_menu_item_assignment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `navigation_menu_item_assignments` (
  `navigation_menu_item_assignment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `navigation_menu_id` bigint(20) NOT NULL,
  `navigation_menu_item_id` bigint(20) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `seq` bigint(20) DEFAULT '0',
  PRIMARY KEY (`navigation_menu_item_assignment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigation_menu_item_assignments`
--

LOCK TABLES `navigation_menu_item_assignments` WRITE;
/*!40000 ALTER TABLE `navigation_menu_item_assignments` DISABLE KEYS */;
INSERT INTO `navigation_menu_item_assignments` VALUES (1,1,1,0,0),(2,1,2,0,1),(3,1,3,0,2),(4,1,4,3,0),(5,1,5,3,1),(6,1,6,3,2),(7,1,7,3,3),(8,2,8,0,0),(9,2,9,0,1),(10,2,10,0,2),(11,2,11,10,0),(12,2,12,10,1),(13,2,13,10,2),(14,2,14,10,3),(15,3,15,0,0),(16,3,16,0,1),(17,3,17,0,2),(18,3,18,0,3),(19,3,19,18,0),(20,3,20,18,1),(21,3,21,18,2),(22,3,22,18,3),(23,3,23,18,4),(24,4,25,0,0),(25,4,26,0,1),(26,4,27,0,2),(27,4,28,27,0),(28,4,29,27,1),(29,4,30,27,2),(30,4,31,27,3),(31,5,32,0,0),(32,5,33,0,1),(33,5,34,0,2),(34,5,35,0,3),(35,5,36,35,0),(36,5,37,35,1),(37,5,38,35,2),(38,5,39,35,3),(39,5,40,35,4),(40,6,42,0,0),(41,6,43,0,1),(42,6,44,0,2),(43,6,45,44,0),(44,6,46,44,1),(45,6,47,44,2),(46,6,48,44,3),(47,7,49,0,0),(48,7,50,0,1),(49,7,51,0,2),(50,7,52,0,3),(51,7,53,52,0),(52,7,54,52,1),(53,7,55,52,2),(54,7,56,52,3),(55,7,57,52,4),(56,8,59,0,0),(57,8,60,0,1),(58,8,61,0,2),(59,8,62,61,0),(60,8,63,61,1),(61,8,64,61,2),(62,8,65,61,3),(63,9,66,0,0),(64,9,67,0,1),(65,9,68,0,2),(66,9,69,0,3),(67,9,70,69,0),(68,9,71,69,1),(69,9,72,69,2),(70,9,73,69,3),(71,9,74,69,4);
/*!40000 ALTER TABLE `navigation_menu_item_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navigation_menu_item_settings`
--

DROP TABLE IF EXISTS `navigation_menu_item_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `navigation_menu_item_settings` (
  `navigation_menu_item_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `navigation_menu_item_settings_pkey` (`navigation_menu_item_id`,`locale`,`setting_name`),
  KEY `navigation_menu_item_settings_navigation_menu_id` (`navigation_menu_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigation_menu_item_settings`
--

LOCK TABLES `navigation_menu_item_settings` WRITE;
/*!40000 ALTER TABLE `navigation_menu_item_settings` DISABLE KEYS */;
INSERT INTO `navigation_menu_item_settings` VALUES (1,'','titleLocaleKey','navigation.register','string'),(2,'','titleLocaleKey','navigation.login','string'),(3,'','titleLocaleKey','{$loggedInUsername}','string'),(4,'','titleLocaleKey','navigation.dashboard','string'),(5,'','titleLocaleKey','common.viewProfile','string'),(6,'','titleLocaleKey','navigation.admin','string'),(7,'','titleLocaleKey','user.logOut','string'),(8,'','titleLocaleKey','navigation.register','string'),(9,'','titleLocaleKey','navigation.login','string'),(10,'','titleLocaleKey','{$loggedInUsername}','string'),(11,'','titleLocaleKey','navigation.dashboard','string'),(12,'','titleLocaleKey','common.viewProfile','string'),(13,'','titleLocaleKey','navigation.admin','string'),(14,'','titleLocaleKey','user.logOut','string'),(15,'','titleLocaleKey','navigation.current','string'),(16,'','titleLocaleKey','navigation.archives','string'),(17,'','titleLocaleKey','manager.announcements','string'),(18,'','titleLocaleKey','navigation.about','string'),(19,'','titleLocaleKey','about.aboutContext','string'),(20,'','titleLocaleKey','about.submissions','string'),(21,'','titleLocaleKey','about.editorialTeam','string'),(22,'','titleLocaleKey','manager.setup.privacyStatement','string'),(23,'','titleLocaleKey','about.contact','string'),(24,'','titleLocaleKey','common.search','string'),(25,'','titleLocaleKey','navigation.register','string'),(26,'','titleLocaleKey','navigation.login','string'),(27,'','titleLocaleKey','{$loggedInUsername}','string'),(28,'','titleLocaleKey','navigation.dashboard','string'),(29,'','titleLocaleKey','common.viewProfile','string'),(30,'','titleLocaleKey','navigation.admin','string'),(31,'','titleLocaleKey','user.logOut','string'),(32,'','titleLocaleKey','navigation.current','string'),(33,'','titleLocaleKey','navigation.archives','string'),(34,'','titleLocaleKey','manager.announcements','string'),(35,'','titleLocaleKey','navigation.about','string'),(36,'','titleLocaleKey','about.aboutContext','string'),(37,'','titleLocaleKey','about.submissions','string'),(38,'','titleLocaleKey','about.editorialTeam','string'),(39,'','titleLocaleKey','manager.setup.privacyStatement','string'),(40,'','titleLocaleKey','about.contact','string'),(41,'','titleLocaleKey','common.search','string'),(42,'','titleLocaleKey','navigation.register','string'),(43,'','titleLocaleKey','navigation.login','string'),(44,'','titleLocaleKey','{$loggedInUsername}','string'),(45,'','titleLocaleKey','navigation.dashboard','string'),(46,'','titleLocaleKey','common.viewProfile','string'),(47,'','titleLocaleKey','navigation.admin','string'),(48,'','titleLocaleKey','user.logOut','string'),(49,'','titleLocaleKey','navigation.current','string'),(50,'','titleLocaleKey','navigation.archives','string'),(51,'','titleLocaleKey','manager.announcements','string'),(52,'','titleLocaleKey','navigation.about','string'),(53,'','titleLocaleKey','about.aboutContext','string'),(54,'','titleLocaleKey','about.submissions','string'),(55,'','titleLocaleKey','about.editorialTeam','string'),(56,'','titleLocaleKey','manager.setup.privacyStatement','string'),(57,'','titleLocaleKey','about.contact','string'),(58,'','titleLocaleKey','common.search','string'),(59,'','titleLocaleKey','navigation.register','string'),(60,'','titleLocaleKey','navigation.login','string'),(61,'','titleLocaleKey','{$loggedInUsername}','string'),(62,'','titleLocaleKey','navigation.dashboard','string'),(63,'','titleLocaleKey','common.viewProfile','string'),(64,'','titleLocaleKey','navigation.admin','string'),(65,'','titleLocaleKey','user.logOut','string'),(66,'','titleLocaleKey','navigation.current','string'),(67,'','titleLocaleKey','navigation.archives','string'),(68,'','titleLocaleKey','manager.announcements','string'),(69,'','titleLocaleKey','navigation.about','string'),(70,'','titleLocaleKey','about.aboutContext','string'),(71,'','titleLocaleKey','about.submissions','string'),(72,'','titleLocaleKey','about.editorialTeam','string'),(73,'','titleLocaleKey','manager.setup.privacyStatement','string'),(74,'','titleLocaleKey','about.contact','string'),(75,'','titleLocaleKey','common.search','string');
/*!40000 ALTER TABLE `navigation_menu_item_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navigation_menu_items`
--

DROP TABLE IF EXISTS `navigation_menu_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `navigation_menu_items` (
  `navigation_menu_item_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `url` varchar(255) DEFAULT '',
  `path` varchar(255) DEFAULT '',
  `type` varchar(255) DEFAULT '',
  PRIMARY KEY (`navigation_menu_item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigation_menu_items`
--

LOCK TABLES `navigation_menu_items` WRITE;
/*!40000 ALTER TABLE `navigation_menu_items` DISABLE KEYS */;
INSERT INTO `navigation_menu_items` VALUES (1,0,NULL,NULL,'NMI_TYPE_USER_REGISTER'),(2,0,NULL,NULL,'NMI_TYPE_USER_LOGIN'),(3,0,NULL,NULL,'NMI_TYPE_USER_DASHBOARD'),(4,0,NULL,NULL,'NMI_TYPE_USER_DASHBOARD'),(5,0,NULL,NULL,'NMI_TYPE_USER_PROFILE'),(6,0,NULL,NULL,'NMI_TYPE_ADMINISTRATION'),(7,0,NULL,NULL,'NMI_TYPE_USER_LOGOUT'),(8,1,NULL,NULL,'NMI_TYPE_USER_REGISTER'),(9,1,NULL,NULL,'NMI_TYPE_USER_LOGIN'),(10,1,NULL,NULL,'NMI_TYPE_USER_DASHBOARD'),(11,1,NULL,NULL,'NMI_TYPE_USER_DASHBOARD'),(12,1,NULL,NULL,'NMI_TYPE_USER_PROFILE'),(13,1,NULL,NULL,'NMI_TYPE_ADMINISTRATION'),(14,1,NULL,NULL,'NMI_TYPE_USER_LOGOUT'),(15,1,NULL,NULL,'NMI_TYPE_CURRENT'),(16,1,NULL,NULL,'NMI_TYPE_ARCHIVES'),(17,1,NULL,NULL,'NMI_TYPE_ANNOUNCEMENTS'),(18,1,NULL,NULL,'NMI_TYPE_ABOUT'),(19,1,NULL,NULL,'NMI_TYPE_ABOUT'),(20,1,NULL,NULL,'NMI_TYPE_SUBMISSIONS'),(21,1,NULL,NULL,'NMI_TYPE_EDITORIAL_TEAM'),(22,1,NULL,NULL,'NMI_TYPE_PRIVACY'),(23,1,NULL,NULL,'NMI_TYPE_CONTACT'),(24,1,NULL,NULL,'NMI_TYPE_SEARCH'),(25,2,NULL,NULL,'NMI_TYPE_USER_REGISTER'),(26,2,NULL,NULL,'NMI_TYPE_USER_LOGIN'),(27,2,NULL,NULL,'NMI_TYPE_USER_DASHBOARD'),(28,2,NULL,NULL,'NMI_TYPE_USER_DASHBOARD'),(29,2,NULL,NULL,'NMI_TYPE_USER_PROFILE'),(30,2,NULL,NULL,'NMI_TYPE_ADMINISTRATION'),(31,2,NULL,NULL,'NMI_TYPE_USER_LOGOUT'),(32,2,NULL,NULL,'NMI_TYPE_CURRENT'),(33,2,NULL,NULL,'NMI_TYPE_ARCHIVES'),(34,2,NULL,NULL,'NMI_TYPE_ANNOUNCEMENTS'),(35,2,NULL,NULL,'NMI_TYPE_ABOUT'),(36,2,NULL,NULL,'NMI_TYPE_ABOUT'),(37,2,NULL,NULL,'NMI_TYPE_SUBMISSIONS'),(38,2,NULL,NULL,'NMI_TYPE_EDITORIAL_TEAM'),(39,2,NULL,NULL,'NMI_TYPE_PRIVACY'),(40,2,NULL,NULL,'NMI_TYPE_CONTACT'),(41,2,NULL,NULL,'NMI_TYPE_SEARCH'),(42,3,NULL,NULL,'NMI_TYPE_USER_REGISTER'),(43,3,NULL,NULL,'NMI_TYPE_USER_LOGIN'),(44,3,NULL,NULL,'NMI_TYPE_USER_DASHBOARD'),(45,3,NULL,NULL,'NMI_TYPE_USER_DASHBOARD'),(46,3,NULL,NULL,'NMI_TYPE_USER_PROFILE'),(47,3,NULL,NULL,'NMI_TYPE_ADMINISTRATION'),(48,3,NULL,NULL,'NMI_TYPE_USER_LOGOUT'),(49,3,NULL,NULL,'NMI_TYPE_CURRENT'),(50,3,NULL,NULL,'NMI_TYPE_ARCHIVES'),(51,3,NULL,NULL,'NMI_TYPE_ANNOUNCEMENTS'),(52,3,NULL,NULL,'NMI_TYPE_ABOUT'),(53,3,NULL,NULL,'NMI_TYPE_ABOUT'),(54,3,NULL,NULL,'NMI_TYPE_SUBMISSIONS'),(55,3,NULL,NULL,'NMI_TYPE_EDITORIAL_TEAM'),(56,3,NULL,NULL,'NMI_TYPE_PRIVACY'),(57,3,NULL,NULL,'NMI_TYPE_CONTACT'),(58,3,NULL,NULL,'NMI_TYPE_SEARCH'),(59,4,NULL,NULL,'NMI_TYPE_USER_REGISTER'),(60,4,NULL,NULL,'NMI_TYPE_USER_LOGIN'),(61,4,NULL,NULL,'NMI_TYPE_USER_DASHBOARD'),(62,4,NULL,NULL,'NMI_TYPE_USER_DASHBOARD'),(63,4,NULL,NULL,'NMI_TYPE_USER_PROFILE'),(64,4,NULL,NULL,'NMI_TYPE_ADMINISTRATION'),(65,4,NULL,NULL,'NMI_TYPE_USER_LOGOUT'),(66,4,NULL,NULL,'NMI_TYPE_CURRENT'),(67,4,NULL,NULL,'NMI_TYPE_ARCHIVES'),(68,4,NULL,NULL,'NMI_TYPE_ANNOUNCEMENTS'),(69,4,NULL,NULL,'NMI_TYPE_ABOUT'),(70,4,NULL,NULL,'NMI_TYPE_ABOUT'),(71,4,NULL,NULL,'NMI_TYPE_SUBMISSIONS'),(72,4,NULL,NULL,'NMI_TYPE_EDITORIAL_TEAM'),(73,4,NULL,NULL,'NMI_TYPE_PRIVACY'),(74,4,NULL,NULL,'NMI_TYPE_CONTACT'),(75,4,NULL,NULL,'NMI_TYPE_SEARCH');
/*!40000 ALTER TABLE `navigation_menu_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navigation_menus`
--

DROP TABLE IF EXISTS `navigation_menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `navigation_menus` (
  `navigation_menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `area_name` varchar(255) DEFAULT '',
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`navigation_menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigation_menus`
--

LOCK TABLES `navigation_menus` WRITE;
/*!40000 ALTER TABLE `navigation_menus` DISABLE KEYS */;
INSERT INTO `navigation_menus` VALUES (1,0,'user','User Navigation Menu'),(2,1,'user','User Navigation Menu'),(3,1,'primary','Primary Navigation Menu'),(4,2,'user','User Navigation Menu'),(5,2,'primary','Primary Navigation Menu'),(6,3,'user','User Navigation Menu'),(7,3,'primary','Primary Navigation Menu'),(8,4,'user','User Navigation Menu'),(9,4,'primary','Primary Navigation Menu');
/*!40000 ALTER TABLE `navigation_menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notes` (
  `note_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `contents` text,
  PRIMARY KEY (`note_id`),
  KEY `notes_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_mail_list`
--

DROP TABLE IF EXISTS `notification_mail_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_mail_list` (
  `notification_mail_list_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(90) NOT NULL,
  `confirmed` tinyint(4) NOT NULL DEFAULT '0',
  `token` varchar(40) NOT NULL,
  `context` bigint(20) NOT NULL,
  PRIMARY KEY (`notification_mail_list_id`),
  UNIQUE KEY `notification_mail_list_email_context` (`email`,`context`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_mail_list`
--

LOCK TABLES `notification_mail_list` WRITE;
/*!40000 ALTER TABLE `notification_mail_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification_mail_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_settings`
--

DROP TABLE IF EXISTS `notification_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_settings` (
  `notification_id` bigint(20) NOT NULL,
  `locale` varchar(14) DEFAULT NULL,
  `setting_name` varchar(64) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `notification_settings_pkey` (`notification_id`,`locale`,`setting_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_subscription_settings` (
  `setting_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `setting_name` varchar(64) NOT NULL,
  `setting_value` text,
  `user_id` bigint(20) NOT NULL,
  `context` bigint(20) NOT NULL,
  `setting_type` varchar(6) NOT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_subscription_settings`
--

LOCK TABLES `notification_subscription_settings` WRITE;
/*!40000 ALTER TABLE `notification_subscription_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification_subscription_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `notification_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `level` bigint(20) NOT NULL,
  `type` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_read` datetime DEFAULT NULL,
  `assoc_type` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`notification_id`),
  KEY `notifications_context_id_user_id` (`context_id`,`user_id`,`level`),
  KEY `notifications_context_id` (`context_id`,`level`),
  KEY `notifications_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (2,1,0,2,16777244,'2019-10-17 15:56:26',NULL,256,1),(10,2,0,2,16777244,'2019-10-17 16:17:41',NULL,256,2),(21,3,0,2,16777244,'2019-10-18 20:22:22',NULL,256,3),(41,1,1,2,268435477,'2019-10-24 23:49:58',NULL,0,0),(42,1,3,2,268435477,'2019-10-24 23:50:00',NULL,0,0),(43,1,2,2,268435477,'2019-10-24 23:50:01',NULL,0,0),(51,4,0,2,16777244,'2019-10-28 15:07:05',NULL,256,4),(59,4,1,2,268435477,'2019-10-28 16:06:06',NULL,0,0),(60,4,6,2,268435477,'2019-10-28 16:06:09',NULL,0,0),(64,4,6,2,16777217,'2019-10-28 16:26:37',NULL,1048585,1),(65,4,0,2,16777243,'2019-10-28 16:26:39',NULL,1048585,1),(66,4,0,2,16777245,'2019-10-28 16:26:39',NULL,1048585,1),(69,4,6,2,16777235,'2019-10-28 16:39:55',NULL,1048585,1),(72,4,6,2,268435478,'2019-10-28 16:40:44','2019-10-28 16:40:45',1048585,1);
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oai_resumption_tokens`
--

DROP TABLE IF EXISTS `oai_resumption_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oai_resumption_tokens` (
  `token` varchar(32) NOT NULL,
  `expire` bigint(20) NOT NULL,
  `record_offset` int(11) NOT NULL,
  `params` text,
  UNIQUE KEY `oai_resumption_tokens_pkey` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugin_settings` (
  `plugin_name` varchar(80) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `setting_name` varchar(80) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `plugin_settings_pkey` (`plugin_name`,`context_id`,`setting_name`),
  KEY `plugin_settings_plugin_name` (`plugin_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_settings`
--

LOCK TABLES `plugin_settings` WRITE;
/*!40000 ALTER TABLE `plugin_settings` DISABLE KEYS */;
INSERT INTO `plugin_settings` VALUES ('acronplugin',0,'crontab','a:27:{i:0;a:3:{s:9:\"className\";s:43:\"plugins.generic.usageStats.UsageStatsLoader\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:1:{i:0;s:9:\"autoStage\";}}i:1;a:3:{s:9:\"className\";s:43:\"plugins.generic.usageStats.UsageStatsLoader\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:1:{i:0;s:9:\"autoStage\";}}i:2;a:3:{s:9:\"className\";s:40:\"plugins.importexport.doaj.DOAJInfoSender\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:3;a:3:{s:9:\"className\";s:48:\"plugins.importexport.crossref.CrossrefInfoSender\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:4;a:3:{s:9:\"className\";s:42:\"plugins.importexport.medra.MedraInfoSender\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:5;a:3:{s:9:\"className\";s:48:\"plugins.importexport.datacite.DataciteInfoSender\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:6;a:3:{s:9:\"className\";s:43:\"plugins.generic.usageStats.UsageStatsLoader\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:1:{i:0;s:9:\"autoStage\";}}i:7;a:3:{s:9:\"className\";s:40:\"plugins.importexport.doaj.DOAJInfoSender\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:8;a:3:{s:9:\"className\";s:48:\"plugins.importexport.crossref.CrossrefInfoSender\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:9;a:3:{s:9:\"className\";s:42:\"plugins.importexport.medra.MedraInfoSender\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:10;a:3:{s:9:\"className\";s:48:\"plugins.importexport.datacite.DataciteInfoSender\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:11;a:3:{s:9:\"className\";s:43:\"plugins.generic.usageStats.UsageStatsLoader\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:1:{i:0;s:9:\"autoStage\";}}i:12;a:3:{s:9:\"className\";s:40:\"plugins.importexport.doaj.DOAJInfoSender\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:13;a:3:{s:9:\"className\";s:48:\"plugins.importexport.crossref.CrossrefInfoSender\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:14;a:3:{s:9:\"className\";s:42:\"plugins.importexport.medra.MedraInfoSender\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:15;a:3:{s:9:\"className\";s:48:\"plugins.importexport.datacite.DataciteInfoSender\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:16;a:3:{s:9:\"className\";s:43:\"plugins.generic.usageStats.UsageStatsLoader\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:1:{i:0;s:9:\"autoStage\";}}i:17;a:3:{s:9:\"className\";s:40:\"plugins.importexport.doaj.DOAJInfoSender\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:18;a:3:{s:9:\"className\";s:48:\"plugins.importexport.crossref.CrossrefInfoSender\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:19;a:3:{s:9:\"className\";s:42:\"plugins.importexport.medra.MedraInfoSender\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:20;a:3:{s:9:\"className\";s:48:\"plugins.importexport.datacite.DataciteInfoSender\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:21;a:3:{s:9:\"className\";s:43:\"plugins.generic.usageStats.UsageStatsLoader\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:1:{i:0;s:9:\"autoStage\";}}i:22;a:3:{s:9:\"className\";s:40:\"plugins.importexport.doaj.DOAJInfoSender\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:23;a:3:{s:9:\"className\";s:48:\"plugins.importexport.crossref.CrossrefInfoSender\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:24;a:3:{s:9:\"className\";s:42:\"plugins.importexport.medra.MedraInfoSender\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:25;a:3:{s:9:\"className\";s:48:\"plugins.importexport.datacite.DataciteInfoSender\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}i:26;a:3:{s:9:\"className\";s:35:\"lib.pkp.classes.task.ReviewReminder\";s:9:\"frequency\";a:1:{s:4:\"hour\";i:24;}s:4:\"args\";a:0:{}}}','object'),('acronplugin',0,'enabled','1','bool'),('defaultthemeplugin',0,'enabled','1','bool'),('defaultthemeplugin',1,'baseColour','#1e6292','text'),('defaultthemeplugin',1,'enabled','1','bool'),('defaultthemeplugin',2,'baseColour','#1e6292','text'),('defaultthemeplugin',2,'enabled','1','bool'),('defaultthemeplugin',3,'baseColour','#1e6292','text'),('defaultthemeplugin',3,'enabled','1','bool'),('defaultthemeplugin',4,'enabled','1','bool'),('developedbyblockplugin',0,'context','1','int'),('developedbyblockplugin',0,'enabled','0','bool'),('developedbyblockplugin',0,'seq','0','int'),('developedbyblockplugin',1,'context','1','int'),('developedbyblockplugin',1,'enabled','0','bool'),('developedbyblockplugin',1,'seq','0','int'),('developedbyblockplugin',2,'context','1','int'),('developedbyblockplugin',2,'enabled','0','bool'),('developedbyblockplugin',2,'seq','0','int'),('developedbyblockplugin',3,'context','1','int'),('developedbyblockplugin',3,'enabled','0','bool'),('developedbyblockplugin',3,'seq','0','int'),('developedbyblockplugin',4,'context','1','int'),('developedbyblockplugin',4,'enabled','0','bool'),('developedbyblockplugin',4,'seq','0','int'),('dublincoremetaplugin',1,'enabled','1','bool'),('dublincoremetaplugin',2,'enabled','1','bool'),('dublincoremetaplugin',3,'enabled','1','bool'),('dublincoremetaplugin',4,'enabled','1','bool'),('googlescholarplugin',1,'enabled','1','bool'),('googlescholarplugin',2,'enabled','1','bool'),('googlescholarplugin',3,'enabled','1','bool'),('googlescholarplugin',4,'enabled','1','bool'),('htmlarticlegalleyplugin',1,'enabled','1','bool'),('htmlarticlegalleyplugin',2,'enabled','1','bool'),('htmlarticlegalleyplugin',3,'enabled','1','bool'),('htmlarticlegalleyplugin',4,'enabled','1','bool'),('informationblockplugin',1,'context','1','int'),('informationblockplugin',1,'enabled','1','bool'),('informationblockplugin',1,'seq','7','int'),('informationblockplugin',2,'context','1','int'),('informationblockplugin',2,'enabled','1','bool'),('informationblockplugin',2,'seq','7','int'),('informationblockplugin',3,'context','1','int'),('informationblockplugin',3,'enabled','1','bool'),('informationblockplugin',3,'seq','7','int'),('informationblockplugin',4,'context','1','int'),('informationblockplugin',4,'enabled','1','bool'),('informationblockplugin',4,'seq','7','int'),('languagetoggleblockplugin',0,'context','1','int'),('languagetoggleblockplugin',0,'enabled','1','bool'),('languagetoggleblockplugin',0,'seq','4','int'),('languagetoggleblockplugin',1,'context','1','int'),('languagetoggleblockplugin',1,'enabled','1','bool'),('languagetoggleblockplugin',1,'seq','4','int'),('languagetoggleblockplugin',2,'context','1','int'),('languagetoggleblockplugin',2,'enabled','1','bool'),('languagetoggleblockplugin',2,'seq','4','int'),('languagetoggleblockplugin',3,'context','1','int'),('languagetoggleblockplugin',3,'enabled','1','bool'),('languagetoggleblockplugin',3,'seq','4','int'),('languagetoggleblockplugin',4,'context','1','int'),('languagetoggleblockplugin',4,'enabled','1','bool'),('languagetoggleblockplugin',4,'seq','4','int'),('lensgalleyplugin',1,'enabled','1','bool'),('lensgalleyplugin',2,'enabled','1','bool'),('lensgalleyplugin',3,'enabled','1','bool'),('lensgalleyplugin',4,'enabled','1','bool'),('pdfjsviewerplugin',1,'enabled','1','bool'),('pdfjsviewerplugin',2,'enabled','1','bool'),('pdfjsviewerplugin',3,'enabled','1','bool'),('pdfjsviewerplugin',4,'enabled','1','bool'),('resolverplugin',1,'enabled','1','bool'),('resolverplugin',2,'enabled','1','bool'),('resolverplugin',3,'enabled','1','bool'),('resolverplugin',4,'enabled','1','bool'),('subscriptionblockplugin',1,'context','1','int'),('subscriptionblockplugin',1,'enabled','1','bool'),('subscriptionblockplugin',1,'seq','2','int'),('subscriptionblockplugin',2,'context','1','int'),('subscriptionblockplugin',2,'enabled','1','bool'),('subscriptionblockplugin',2,'seq','2','int'),('subscriptionblockplugin',3,'context','1','int'),('subscriptionblockplugin',3,'enabled','1','bool'),('subscriptionblockplugin',3,'seq','2','int'),('subscriptionblockplugin',4,'context','1','int'),('subscriptionblockplugin',4,'enabled','1','bool'),('subscriptionblockplugin',4,'seq','2','int'),('tinymceplugin',0,'enabled','1','bool'),('tinymceplugin',1,'enabled','1','bool'),('tinymceplugin',2,'enabled','1','bool'),('tinymceplugin',3,'enabled','1','bool'),('tinymceplugin',4,'enabled','1','bool'),('usageeventplugin',0,'enabled','1','bool'),('usageeventplugin',0,'uniqueSiteId','5da892eeee105','string'),('usagestatsplugin',0,'accessLogFileParseRegex','/^(?P<ip>\\S+) \\S+ \\S+ \\[(?P<date>.*?)\\] \"\\S+ (?P<url>\\S+).*?\" (?P<returnCode>\\S+) \\S+ \".*?\" \"(?P<userAgent>.*?)\"/','string'),('usagestatsplugin',0,'chartType','bar','string'),('usagestatsplugin',0,'createLogFiles','1','bool'),('usagestatsplugin',0,'datasetMaxCount','4','string'),('usagestatsplugin',0,'enabled','1','bool'),('usagestatsplugin',0,'optionalColumns','a:2:{i:0;s:4:\"city\";i:1;s:6:\"region\";}','object'),('webfeedplugin',1,'displayItems','1','bool'),('webfeedplugin',1,'displayPage','homepage','string'),('webfeedplugin',1,'enabled','1','bool'),('webfeedplugin',2,'displayItems','1','bool'),('webfeedplugin',2,'displayPage','homepage','string'),('webfeedplugin',2,'enabled','1','bool'),('webfeedplugin',3,'displayItems','1','bool'),('webfeedplugin',3,'displayPage','homepage','string'),('webfeedplugin',3,'enabled','1','bool'),('webfeedplugin',4,'displayItems','1','bool'),('webfeedplugin',4,'displayPage','homepage','string'),('webfeedplugin',4,'enabled','1','bool');
/*!40000 ALTER TABLE `plugin_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `published_submissions`
--

DROP TABLE IF EXISTS `published_submissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `published_submissions` (
  `published_submission_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `issue_id` bigint(20) NOT NULL,
  `date_published` datetime DEFAULT NULL,
  `seq` double NOT NULL DEFAULT '0',
  `access_status` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`published_submission_id`),
  UNIQUE KEY `published_submissions_submission_id` (`submission_id`),
  KEY `published_submissions_issue_id` (`issue_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `published_submissions`
--

LOCK TABLES `published_submissions` WRITE;
/*!40000 ALTER TABLE `published_submissions` DISABLE KEYS */;
INSERT INTO `published_submissions` VALUES (1,1,3,'2019-10-28 16:40:44',1,0);
/*!40000 ALTER TABLE `published_submissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queries`
--

DROP TABLE IF EXISTS `queries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queries` (
  `query_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `stage_id` tinyint(4) NOT NULL DEFAULT '1',
  `seq` double NOT NULL DEFAULT '0',
  `date_posted` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `closed` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`query_id`),
  KEY `queries_assoc_id` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `query_participants` (
  `query_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  UNIQUE KEY `query_participants_pkey` (`query_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `query_participants`
--

LOCK TABLES `query_participants` WRITE;
/*!40000 ALTER TABLE `query_participants` DISABLE KEYS */;
/*!40000 ALTER TABLE `query_participants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queued_payments`
--

DROP TABLE IF EXISTS `queued_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queued_payments` (
  `queued_payment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_created` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `expiry_date` date DEFAULT NULL,
  `payment_data` text,
  PRIMARY KEY (`queued_payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queued_payments`
--

LOCK TABLES `queued_payments` WRITE;
/*!40000 ALTER TABLE `queued_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `queued_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_assignments`
--

DROP TABLE IF EXISTS `review_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_assignments` (
  `review_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `reviewer_id` bigint(20) NOT NULL,
  `competing_interests` text,
  `recommendation` tinyint(4) DEFAULT NULL,
  `date_assigned` datetime DEFAULT NULL,
  `date_notified` datetime DEFAULT NULL,
  `date_confirmed` datetime DEFAULT NULL,
  `date_completed` datetime DEFAULT NULL,
  `date_acknowledged` datetime DEFAULT NULL,
  `date_due` datetime DEFAULT NULL,
  `date_response_due` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `reminder_was_automatic` tinyint(4) NOT NULL DEFAULT '0',
  `declined` tinyint(4) NOT NULL DEFAULT '0',
  `replaced` tinyint(4) NOT NULL DEFAULT '0',
  `reviewer_file_id` bigint(20) DEFAULT NULL,
  `date_rated` datetime DEFAULT NULL,
  `date_reminded` datetime DEFAULT NULL,
  `quality` tinyint(4) DEFAULT NULL,
  `review_round_id` bigint(20) DEFAULT NULL,
  `stage_id` tinyint(4) NOT NULL DEFAULT '1',
  `review_method` tinyint(4) NOT NULL DEFAULT '1',
  `round` tinyint(4) NOT NULL DEFAULT '1',
  `step` tinyint(4) NOT NULL DEFAULT '1',
  `review_form_id` bigint(20) DEFAULT NULL,
  `unconsidered` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`review_id`),
  KEY `review_assignments_submission_id` (`submission_id`),
  KEY `review_assignments_reviewer_id` (`reviewer_id`),
  KEY `review_assignments_form_id` (`review_form_id`),
  KEY `review_assignments_reviewer_review` (`reviewer_id`,`review_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_files` (
  `review_id` bigint(20) NOT NULL,
  `file_id` bigint(20) NOT NULL,
  UNIQUE KEY `review_files_pkey` (`review_id`,`file_id`),
  KEY `review_files_review_id` (`review_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_form_element_settings` (
  `review_form_element_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `review_form_element_settings_pkey` (`review_form_element_id`,`locale`,`setting_name`),
  KEY `review_form_element_settings_review_form_element_id` (`review_form_element_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_form_elements` (
  `review_form_element_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `review_form_id` bigint(20) NOT NULL,
  `seq` double DEFAULT NULL,
  `element_type` bigint(20) DEFAULT NULL,
  `required` tinyint(4) DEFAULT NULL,
  `included` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`review_form_element_id`),
  KEY `review_form_elements_review_form_id` (`review_form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_form_responses` (
  `review_form_element_id` bigint(20) NOT NULL,
  `review_id` bigint(20) NOT NULL,
  `response_type` varchar(6) DEFAULT NULL,
  `response_value` text,
  KEY `review_form_responses_pkey` (`review_form_element_id`,`review_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_form_settings` (
  `review_form_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `review_form_settings_pkey` (`review_form_id`,`locale`,`setting_name`),
  KEY `review_form_settings_review_form_id` (`review_form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_forms` (
  `review_form_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  `seq` double DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`review_form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_round_files` (
  `submission_id` bigint(20) NOT NULL,
  `review_round_id` bigint(20) NOT NULL,
  `stage_id` tinyint(4) NOT NULL,
  `file_id` bigint(20) NOT NULL,
  `revision` bigint(20) NOT NULL DEFAULT '1',
  UNIQUE KEY `review_round_files_pkey` (`submission_id`,`review_round_id`,`file_id`,`revision`),
  KEY `review_round_files_submission_id` (`submission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_rounds` (
  `review_round_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `stage_id` bigint(20) DEFAULT NULL,
  `round` tinyint(4) NOT NULL,
  `review_revision` bigint(20) DEFAULT NULL,
  `status` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`review_round_id`),
  UNIQUE KEY `review_rounds_submission_id_stage_id_round_pkey` (`submission_id`,`stage_id`,`round`),
  KEY `review_rounds_submission_id` (`submission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_rounds`
--

LOCK TABLES `review_rounds` WRITE;
/*!40000 ALTER TABLE `review_rounds` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_rounds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rt_contexts`
--

DROP TABLE IF EXISTS `rt_contexts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rt_contexts` (
  `context_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version_id` bigint(20) NOT NULL,
  `title` varchar(120) NOT NULL,
  `abbrev` varchar(32) NOT NULL,
  `description` text,
  `cited_by` tinyint(4) NOT NULL DEFAULT '0',
  `author_terms` tinyint(4) NOT NULL DEFAULT '0',
  `define_terms` tinyint(4) NOT NULL DEFAULT '0',
  `geo_terms` tinyint(4) NOT NULL DEFAULT '0',
  `seq` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`context_id`),
  KEY `rt_contexts_version_id` (`version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rt_contexts`
--

LOCK TABLES `rt_contexts` WRITE;
/*!40000 ALTER TABLE `rt_contexts` DISABLE KEYS */;
/*!40000 ALTER TABLE `rt_contexts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rt_searches`
--

DROP TABLE IF EXISTS `rt_searches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rt_searches` (
  `search_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `title` varchar(120) NOT NULL,
  `description` text,
  `url` text,
  `search_url` text,
  `search_post` text,
  `seq` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`search_id`),
  KEY `rt_searches_context_id` (`context_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rt_searches`
--

LOCK TABLES `rt_searches` WRITE;
/*!40000 ALTER TABLE `rt_searches` DISABLE KEYS */;
/*!40000 ALTER TABLE `rt_searches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rt_versions`
--

DROP TABLE IF EXISTS `rt_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rt_versions` (
  `version_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `journal_id` bigint(20) NOT NULL,
  `version_key` varchar(40) NOT NULL,
  `locale` varchar(14) DEFAULT 'en_US',
  `title` varchar(120) NOT NULL,
  `description` text,
  PRIMARY KEY (`version_id`),
  KEY `rt_versions_journal_id` (`journal_id`),
  KEY `rt_versions_version_key` (`version_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rt_versions`
--

LOCK TABLES `rt_versions` WRITE;
/*!40000 ALTER TABLE `rt_versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `rt_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scheduled_tasks`
--

DROP TABLE IF EXISTS `scheduled_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scheduled_tasks` (
  `class_name` varchar(255) NOT NULL,
  `last_run` datetime DEFAULT NULL,
  UNIQUE KEY `scheduled_tasks_pkey` (`class_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scheduled_tasks`
--

LOCK TABLES `scheduled_tasks` WRITE;
/*!40000 ALTER TABLE `scheduled_tasks` DISABLE KEYS */;
INSERT INTO `scheduled_tasks` VALUES ('lib.pkp.classes.task.ReviewReminder','2019-10-29 14:46:24'),('plugins.generic.usageStats.UsageStatsLoader','2019-10-29 14:46:24'),('plugins.importexport.crossref.CrossrefInfoSender','2019-10-29 14:46:24'),('plugins.importexport.datacite.DataciteInfoSender','2019-10-29 14:46:24'),('plugins.importexport.doaj.DOAJInfoSender','2019-10-29 14:46:24'),('plugins.importexport.medra.MedraInfoSender','2019-10-29 14:46:24');
/*!40000 ALTER TABLE `scheduled_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section_editors`
--

DROP TABLE IF EXISTS `section_editors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `section_editors` (
  `context_id` bigint(20) NOT NULL,
  `section_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  UNIQUE KEY `section_editors_pkey` (`context_id`,`section_id`,`user_id`),
  KEY `section_editors_context_id` (`context_id`),
  KEY `section_editors_section_id` (`section_id`),
  KEY `section_editors_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section_editors`
--

LOCK TABLES `section_editors` WRITE;
/*!40000 ALTER TABLE `section_editors` DISABLE KEYS */;
INSERT INTO `section_editors` VALUES (1,1,2);
/*!40000 ALTER TABLE `section_editors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section_settings`
--

DROP TABLE IF EXISTS `section_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `section_settings` (
  `section_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `section_settings_pkey` (`section_id`,`locale`,`setting_name`),
  KEY `section_settings_section_id` (`section_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section_settings`
--

LOCK TABLES `section_settings` WRITE;
/*!40000 ALTER TABLE `section_settings` DISABLE KEYS */;
INSERT INTO `section_settings` VALUES (1,'es_ES','abbrev','ART','string'),(1,'es_ES','identifyType','','string'),(1,'es_ES','policy','','string'),(1,'es_ES','title','Artículos','string'),(2,'es_ES','abbrev','ART','string'),(2,'es_ES','policy','','string'),(2,'es_ES','title','Artículos','string'),(3,'es_ES','abbrev','ART','string'),(3,'es_ES','policy','','string'),(3,'es_ES','title','Artículos','string'),(5,'es_ES','abbrev','ART','string'),(5,'es_ES','identifyType','','string'),(5,'es_ES','policy','','string'),(5,'es_ES','title','ARTÍCULOS','string'),(6,'es_ES','abbrev','CIENBIO','string'),(6,'es_ES','identifyType','','string'),(6,'es_ES','policy','','string'),(6,'es_ES','title','CIENCIAS BIOLÓGICAS','string'),(7,'es_ES','abbrev','CIENMAT','string'),(7,'es_ES','identifyType','','string'),(7,'es_ES','policy','','string'),(7,'es_ES','title','CIENCIAS MATEMATICAS','string'),(8,'es_ES','abbrev','CIENAGRO','string'),(8,'es_ES','identifyType','','string'),(8,'es_ES','policy','','string'),(8,'es_ES','title','CIENCIAS AGROPECUARIAS','string'),(9,'es_ES','abbrev','CIENMED','string'),(9,'es_ES','identifyType','','string'),(9,'es_ES','policy','','string'),(9,'es_ES','title','CIENCIAS MÉDICAS','string'),(10,'es_ES','abbrev','CIENECO','string'),(10,'es_ES','identifyType','','string'),(10,'es_ES','policy','','string'),(10,'es_ES','title','CIENCIAS ECONÓMICAS','string'),(11,'es_ES','abbrev','CARTEDI','string'),(11,'es_ES','identifyType','','string'),(11,'es_ES','policy','','string'),(11,'es_ES','title','CARTAS AL EDITOR','string'),(12,'es_ES','abbrev','CIENADM','string'),(12,'es_ES','identifyType','','string'),(12,'es_ES','policy','','string'),(12,'es_ES','title','CIENCIAS ADMINISTRATIVAS','string'),(13,'es_ES','abbrev','ARQ','string'),(13,'es_ES','identifyType','','string'),(13,'es_ES','policy','','string'),(13,'es_ES','title','ARQUITECTURA','string'),(14,'es_ES','abbrev','ING','string'),(14,'es_ES','identifyType','','string'),(14,'es_ES','policy','','string'),(14,'es_ES','title','INGENIERÍA','string'),(15,'es_ES','abbrev','CIENSOC','string'),(15,'es_ES','identifyType','','string'),(15,'es_ES','policy','','string'),(15,'es_ES','title','CIENCIAS SOCIALES','string');
/*!40000 ALTER TABLE `section_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections` (
  `section_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `journal_id` bigint(20) NOT NULL,
  `review_form_id` bigint(20) DEFAULT NULL,
  `seq` double NOT NULL DEFAULT '0',
  `editor_restricted` tinyint(4) NOT NULL DEFAULT '0',
  `meta_indexed` tinyint(4) NOT NULL DEFAULT '0',
  `meta_reviewed` tinyint(4) NOT NULL DEFAULT '1',
  `abstracts_not_required` tinyint(4) NOT NULL DEFAULT '0',
  `hide_title` tinyint(4) NOT NULL DEFAULT '0',
  `hide_author` tinyint(4) NOT NULL DEFAULT '0',
  `abstract_word_count` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`section_id`),
  KEY `sections_journal_id` (`journal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
INSERT INTO `sections` VALUES (1,1,0,1,0,1,1,0,0,0,NULL),(2,2,0,0,0,1,1,0,0,0,0),(3,3,0,0,0,1,1,0,0,0,0),(5,4,0,1,0,1,1,0,0,0,NULL),(6,4,0,3,0,1,1,0,0,0,NULL),(7,4,0,4,0,1,1,0,0,0,NULL),(8,4,0,2,0,1,1,0,0,0,NULL),(9,4,0,5,0,1,1,0,0,0,0),(10,4,0,6,0,1,1,0,0,0,0),(11,4,0,7,0,1,1,0,0,0,0),(12,4,0,8,0,1,1,0,0,0,0),(13,4,0,9,0,1,1,0,0,0,0),(14,4,0,10,0,1,1,0,0,0,0),(15,4,0,11,0,1,1,0,0,0,0);
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `session_id` varchar(128) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `ip_address` varchar(39) NOT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `created` bigint(20) NOT NULL DEFAULT '0',
  `last_used` bigint(20) NOT NULL DEFAULT '0',
  `remember` tinyint(4) NOT NULL DEFAULT '0',
  `data` text,
  `domain` varchar(255) DEFAULT NULL,
  UNIQUE KEY `sessions_pkey` (`session_id`),
  KEY `sessions_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('1spp2dsmmh1fntfg0qjtce75d1',NULL,'132.157.131.205','Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36',1572367942,1572367942,0,'','vrinv.unprg.edu.pe'),('80p1s92t2l94i6hu4m6a3n3uht',2,'201.240.121.191','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36',1571958921,1571960471,1,'csrf|a:2:{s:9:\"timestamp\";i:1571960471;s:5:\"token\";s:32:\"298cba98f2c99f560f0ba5f48416c94b\";}userId|i:2;username|s:5:\"nleon\";signedInAs|s:1:\"1\";','vrinv.unprg.edu.pe'),('8t19vvhp4pu5qatovs28ujheal',NULL,'179.6.47.19','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36',1572206733,1572217852,0,'csrf|a:2:{s:9:\"timestamp\";i:1572217852;s:5:\"token\";s:32:\"d17a3c74a5d2b7b38475b99df0e79189\";}','vrinv.unprg.edu.pe'),('avem9rqo7ii723425t6ohtjnft',NULL,'181.176.113.9','Mozilla/5.0 (Linux; U; Android 9; es-us; Redmi Note 5 Build/PKQ1.180904.001) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/71.0.3578.141 Mobile Safari/537.36 XiaoMi/MiuiBrowser/11.1.7-g',1572286350,1572288914,0,'csrf|a:2:{s:9:\"timestamp\";i:1572288914;s:5:\"token\";s:32:\"967427e93dcd4374f4d1a2fafc93ff83\";}','vrinv.unprg.edu.pe'),('n2fjadformmmrc2ahs2aage3j4',NULL,'190.237.178.163','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36',1572365436,1572365436,0,'','vrinv.unprg.edu.pe'),('nlr04n7i6bu5hdclgf4cmfk4sh',1,'190.108.84.115','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36',1571753851,1571755316,1,'csrf|a:2:{s:9:\"timestamp\";i:1571755316;s:5:\"token\";s:32:\"73abad82b9cfe2ad75624b0c222e6e40\";}username|s:11:\"adminopenjs\";userId|s:1:\"1\";','vrinv.unprg.edu.pe'),('vc2nrhoq4mqbsedl3ocdptegq2',1,'190.108.94.98','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36',1572368851,1572369060,1,'csrf|a:2:{s:9:\"timestamp\";i:1572369060;s:5:\"token\";s:32:\"a9c052cbb01b59dd3b94bddbe4d732e5\";}userId|s:1:\"1\";username|s:11:\"adminopenjs\";','vrinv.unprg.edu.pe');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site`
--

DROP TABLE IF EXISTS `site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site` (
  `redirect` bigint(20) NOT NULL DEFAULT '0',
  `primary_locale` varchar(14) NOT NULL,
  `min_password_length` tinyint(4) NOT NULL DEFAULT '6',
  `installed_locales` varchar(255) NOT NULL DEFAULT 'en_US',
  `supported_locales` varchar(255) DEFAULT NULL,
  `original_style_file_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site`
--

LOCK TABLES `site` WRITE;
/*!40000 ALTER TABLE `site` DISABLE KEYS */;
INSERT INTO `site` VALUES (0,'es_ES',6,'en_US:pt_BR:es_ES','en_US:pt_BR:es_ES',NULL);
/*!40000 ALTER TABLE `site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_settings`
--

DROP TABLE IF EXISTS `site_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_settings` (
  `setting_name` varchar(255) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `site_settings_pkey` (`setting_name`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_settings`
--

LOCK TABLES `site_settings` WRITE;
/*!40000 ALTER TABLE `site_settings` DISABLE KEYS */;
INSERT INTO `site_settings` VALUES ('contactEmail','en_US','revistacientifica@unprg.edu.pe','string'),('contactName','en_US','Open Journal Systems','string'),('pageHeaderTitleImage','es_ES','a:6:{s:16:\"originalFilename\";s:30:\"pageHeaderTitleImage_es_ES.png\";s:10:\"uploadName\";s:30:\"pageHeaderTitleImage_es_ES.png\";s:5:\"width\";i:1337;s:6:\"height\";i:170;s:12:\"dateUploaded\";s:19:\"2019-10-17 16:20:16\";s:7:\"altText\";s:0:\"\";}','object'),('showDescription','','1','bool'),('showThumbnail','','1','bool'),('showTitle','','1','bool'),('themePluginPath','','default','string');
/*!40000 ALTER TABLE `site_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stage_assignments`
--

DROP TABLE IF EXISTS `stage_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stage_assignments` (
  `stage_assignment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `user_group_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `date_assigned` datetime NOT NULL,
  `recommend_only` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`stage_assignment_id`),
  UNIQUE KEY `stage_assignment` (`submission_id`,`user_group_id`,`user_id`),
  KEY `stage_assignments_submission_id` (`submission_id`),
  KEY `stage_assignments_user_group_id` (`user_group_id`),
  KEY `stage_assignments_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stage_assignments`
--

LOCK TABLES `stage_assignments` WRITE;
/*!40000 ALTER TABLE `stage_assignments` DISABLE KEYS */;
INSERT INTO `stage_assignments` VALUES (1,1,65,6,'2019-10-28 16:13:06',0),(2,1,54,6,'2019-10-28 16:26:37',0);
/*!40000 ALTER TABLE `stage_assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `static_page_settings`
--

DROP TABLE IF EXISTS `static_page_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `static_page_settings` (
  `static_page_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` longtext,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `static_page_settings_pkey` (`static_page_id`,`locale`,`setting_name`),
  KEY `static_page_settings_static_page_id` (`static_page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `static_page_settings`
--

LOCK TABLES `static_page_settings` WRITE;
/*!40000 ALTER TABLE `static_page_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `static_page_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `static_pages`
--

DROP TABLE IF EXISTS `static_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `static_pages` (
  `static_page_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `path` varchar(255) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  PRIMARY KEY (`static_page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `static_pages`
--

LOCK TABLES `static_pages` WRITE;
/*!40000 ALTER TABLE `static_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `static_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_artwork_files`
--

DROP TABLE IF EXISTS `submission_artwork_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submission_artwork_files` (
  `file_id` bigint(20) NOT NULL,
  `revision` bigint(20) NOT NULL,
  `caption` text,
  `credit` varchar(255) DEFAULT NULL,
  `copyright_owner` varchar(255) DEFAULT NULL,
  `copyright_owner_contact` text,
  `permission_terms` text,
  `permission_file_id` bigint(20) DEFAULT NULL,
  `chapter_id` bigint(20) DEFAULT NULL,
  `contact_author` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`file_id`,`revision`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_artwork_files`
--

LOCK TABLES `submission_artwork_files` WRITE;
/*!40000 ALTER TABLE `submission_artwork_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `submission_artwork_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_categories`
--

DROP TABLE IF EXISTS `submission_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submission_categories` (
  `submission_id` bigint(20) NOT NULL,
  `category_id` bigint(20) NOT NULL,
  UNIQUE KEY `submission_categories_id` (`submission_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_categories`
--

LOCK TABLES `submission_categories` WRITE;
/*!40000 ALTER TABLE `submission_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `submission_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_comments`
--

DROP TABLE IF EXISTS `submission_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submission_comments` (
  `comment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comment_type` bigint(20) DEFAULT NULL,
  `role_id` bigint(20) NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `author_id` bigint(20) NOT NULL,
  `comment_title` text,
  `comments` text,
  `date_posted` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `viewable` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `submission_comments_submission_id` (`submission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_comments`
--

LOCK TABLES `submission_comments` WRITE;
/*!40000 ALTER TABLE `submission_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `submission_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_file_settings`
--

DROP TABLE IF EXISTS `submission_file_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submission_file_settings` (
  `file_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `submission_file_settings_pkey` (`file_id`,`locale`,`setting_name`),
  KEY `submission_file_settings_id` (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_file_settings`
--

LOCK TABLES `submission_file_settings` WRITE;
/*!40000 ALTER TABLE `submission_file_settings` DISABLE KEYS */;
INSERT INTO `submission_file_settings` VALUES (1,'es_ES','name','Diversidad de la Familia Solanaceae en dos áreas naturales protegidas del Perú','string'),(2,'es_ES','name','Diversidad de la Familia Solanaceae en dos áreas naturales protegidas del Perú','string'),(3,'es_ES','name','Diversidad de la Familia Solanaceae en dos áreas naturales protegidas del Perú','string');
/*!40000 ALTER TABLE `submission_file_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_files`
--

DROP TABLE IF EXISTS `submission_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submission_files` (
  `file_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `revision` bigint(20) NOT NULL,
  `source_file_id` bigint(20) DEFAULT NULL,
  `source_revision` bigint(20) DEFAULT NULL,
  `submission_id` bigint(20) NOT NULL,
  `file_type` varchar(255) NOT NULL,
  `genre_id` bigint(20) DEFAULT NULL,
  `file_size` bigint(20) NOT NULL,
  `original_file_name` varchar(127) DEFAULT NULL,
  `file_stage` bigint(20) NOT NULL,
  `direct_sales_price` varchar(255) DEFAULT NULL,
  `sales_type` varchar(255) DEFAULT NULL,
  `viewable` tinyint(4) DEFAULT NULL,
  `date_uploaded` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `uploader_user_id` bigint(20) DEFAULT NULL,
  `assoc_type` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`file_id`,`revision`),
  KEY `submission_files_submission_id` (`submission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_files`
--

LOCK TABLES `submission_files` WRITE;
/*!40000 ALTER TABLE `submission_files` DISABLE KEYS */;
INSERT INTO `submission_files` VALUES (1,1,NULL,NULL,1,'application/pdf',37,985900,'ARTICULO1-RC-2016.pdf',2,NULL,NULL,1,'2019-10-28 16:14:09','2019-10-28 16:14:09',6,NULL,NULL),(2,1,1,1,1,'application/pdf',37,985900,'ARTICULO1-RC-2016.pdf',6,NULL,NULL,1,'2019-10-28 16:14:09','2019-10-28 16:39:36',6,NULL,NULL),(3,1,NULL,NULL,1,'application/pdf',37,985900,'ARTICULO1-RC-2016.pdf',10,NULL,NULL,0,'2019-10-29 14:47:53','2019-10-29 14:47:53',6,521,1);
/*!40000 ALTER TABLE `submission_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_galley_settings`
--

DROP TABLE IF EXISTS `submission_galley_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submission_galley_settings` (
  `galley_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `submission_galley_settings_pkey` (`galley_id`,`locale`,`setting_name`),
  KEY `submission_galley_settings_galley_id` (`galley_id`),
  KEY `submission_galley_settings_name_value` (`setting_name`(50),`setting_value`(150))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_galley_settings`
--

LOCK TABLES `submission_galley_settings` WRITE;
/*!40000 ALTER TABLE `submission_galley_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `submission_galley_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_galleys`
--

DROP TABLE IF EXISTS `submission_galleys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submission_galleys` (
  `galley_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `locale` varchar(14) DEFAULT NULL,
  `submission_id` bigint(20) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `file_id` bigint(20) DEFAULT NULL,
  `seq` double NOT NULL DEFAULT '0',
  `remote_url` varchar(2047) DEFAULT NULL,
  `is_approved` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`galley_id`),
  KEY `submission_galleys_submission_id` (`submission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_galleys`
--

LOCK TABLES `submission_galleys` WRITE;
/*!40000 ALTER TABLE `submission_galleys` DISABLE KEYS */;
INSERT INTO `submission_galleys` VALUES (1,'es_ES',1,'PDF',3,0,'',0);
/*!40000 ALTER TABLE `submission_galleys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_search_keyword_list`
--

DROP TABLE IF EXISTS `submission_search_keyword_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submission_search_keyword_list` (
  `keyword_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `keyword_text` varchar(60) NOT NULL,
  PRIMARY KEY (`keyword_id`),
  UNIQUE KEY `submission_search_keyword_text` (`keyword_text`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_search_keyword_list`
--

LOCK TABLES `submission_search_keyword_list` WRITE;
/*!40000 ALTER TABLE `submission_search_keyword_list` DISABLE KEYS */;
INSERT INTO `submission_search_keyword_list` VALUES (21,'acerca'),(48,'ambos'),(39,'amortiguamiento'),(13,'áreas'),(27,'bosque'),(31,'carlos'),(47,'cestrum'),(49,'compartieron'),(35,'con'),(16,'del'),(55,'descripciones'),(56,'diagnósticas'),(9,'diversidad'),(12,'dos'),(45,'ecosistemas'),(23,'especies'),(25,'están'),(10,'familia'),(57,'fotografías'),(8,'gallo'),(40,'género'),(34,'hermosa'),(20,'informa'),(22,'las'),(53,'lista'),(44,'los'),(1,'luis'),(42,'más'),(30,'matías'),(5,'nacional'),(14,'naturales'),(33,'pampa'),(6,'pedro'),(17,'perú'),(51,'presenta'),(18,'presente'),(26,'presentes'),(28,'protección'),(15,'protegidas'),(54,'registradas'),(43,'representativo'),(37,'respectivas'),(7,'ruiz'),(29,'san'),(32,'santuario'),(46,'seguido'),(3,'silva'),(50,'similitud'),(11,'solanaceae'),(24,'solanáceas'),(41,'solanum'),(36,'sus'),(19,'trabajo'),(52,'una'),(4,'universidad'),(38,'zonas'),(2,'zuñe');
/*!40000 ALTER TABLE `submission_search_keyword_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_search_object_keywords`
--

DROP TABLE IF EXISTS `submission_search_object_keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submission_search_object_keywords` (
  `object_id` bigint(20) NOT NULL,
  `keyword_id` bigint(20) NOT NULL,
  `pos` int(11) NOT NULL,
  UNIQUE KEY `submission_search_object_keywords_pkey` (`object_id`,`pos`),
  KEY `submission_search_object_keywords_keyword_id` (`keyword_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_search_object_keywords`
--

LOCK TABLES `submission_search_object_keywords` WRITE;
/*!40000 ALTER TABLE `submission_search_object_keywords` DISABLE KEYS */;
INSERT INTO `submission_search_object_keywords` VALUES (1,1,0),(1,2,1),(1,3,2),(1,4,3),(1,5,4),(3,5,22),(1,6,5),(1,7,6),(1,8,7),(2,9,0),(2,10,1),(2,11,2),(2,12,3),(3,12,9),(3,12,37),(2,13,4),(3,13,10),(2,14,5),(3,14,11),(2,15,6),(3,15,12),(2,16,7),(3,16,13),(2,17,8),(3,17,14),(3,18,0),(3,19,1),(3,20,2),(3,21,3),(3,22,4),(3,22,50),(3,23,5),(3,23,35),(3,23,42),(3,23,51),(3,24,6),(3,25,7),(3,26,8),(3,27,15),(3,28,16),(3,29,17),(3,29,19),(3,30,18),(3,31,20),(3,32,21),(3,33,23),(3,34,24),(3,35,25),(3,35,34),(3,35,41),(3,35,53),(3,36,26),(3,36,54),(3,37,27),(3,37,55),(3,38,28),(3,39,29),(3,40,30),(3,41,31),(3,42,32),(3,43,33),(3,44,36),(3,45,38),(3,45,44),(3,46,39),(3,47,40),(3,48,43),(3,49,45),(3,50,46),(3,51,47),(3,52,48),(3,53,49),(3,54,52),(3,55,56),(3,56,57),(3,57,58);
/*!40000 ALTER TABLE `submission_search_object_keywords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_search_objects`
--

DROP TABLE IF EXISTS `submission_search_objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submission_search_objects` (
  `object_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `type` int(11) NOT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`object_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_search_objects`
--

LOCK TABLES `submission_search_objects` WRITE;
/*!40000 ALTER TABLE `submission_search_objects` DISABLE KEYS */;
INSERT INTO `submission_search_objects` VALUES (1,1,1,0),(2,1,2,0),(3,1,4,0),(4,1,8,0),(5,1,16,0),(6,1,32,0),(7,1,64,0);
/*!40000 ALTER TABLE `submission_search_objects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_settings`
--

DROP TABLE IF EXISTS `submission_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submission_settings` (
  `submission_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `submission_settings_pkey` (`submission_id`,`locale`,`setting_name`),
  KEY `submission_settings_submission_id` (`submission_id`),
  KEY `submission_settings_name_value` (`setting_name`(50),`setting_value`(150))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_settings`
--

LOCK TABLES `submission_settings` WRITE;
/*!40000 ALTER TABLE `submission_settings` DISABLE KEYS */;
INSERT INTO `submission_settings` VALUES (1,'','copyrightYear','2016','string'),(1,'','licenseURL','','string'),(1,'es_ES','abstract','<p>El presente trabajo informa acerca de las especies de Solanáceas que están presentes<br>en dos Áreas Naturales Protegidas del Perú: Bosque de Protección San Matías San Carlos<br>y Santuario Nacional Pampa Hermosa con sus respectivas zonas de amortiguamiento. El<br>género Solanum es el más representativo con 30 especies en los dos ecosistemas, seguido de<br>Cestrum con 7 especies. Ambos ecosistemas compartieron 4% de similitud. Se presenta una<br>lista de las especies registradas con sus respectivas descripciones diagnósticas y fotografías.</p>','string'),(1,'es_ES','cleanTitle','Diversidad de la Familia Solanaceae en dos áreas naturales protegidas del Perú','string'),(1,'es_ES','copyrightHolder','Revista Científica','string'),(1,'es_ES','prefix','','string'),(1,'es_ES','subtitle','','string'),(1,'es_ES','title','Diversidad de la Familia Solanaceae en dos áreas naturales protegidas del Perú','string');
/*!40000 ALTER TABLE `submission_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_supplementary_files`
--

DROP TABLE IF EXISTS `submission_supplementary_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submission_supplementary_files` (
  `file_id` bigint(20) NOT NULL,
  `revision` bigint(20) NOT NULL,
  PRIMARY KEY (`file_id`,`revision`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_supplementary_files`
--

LOCK TABLES `submission_supplementary_files` WRITE;
/*!40000 ALTER TABLE `submission_supplementary_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `submission_supplementary_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission_tombstones`
--

DROP TABLE IF EXISTS `submission_tombstones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submission_tombstones` (
  `tombstone_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `date_deleted` datetime NOT NULL,
  `journal_id` bigint(20) NOT NULL,
  `section_id` bigint(20) NOT NULL,
  `set_spec` varchar(255) NOT NULL,
  `set_name` varchar(255) NOT NULL,
  `oai_identifier` varchar(255) NOT NULL,
  PRIMARY KEY (`tombstone_id`),
  KEY `submission_tombstones_journal_id` (`journal_id`),
  KEY `submission_tombstones_submission_id` (`submission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission_tombstones`
--

LOCK TABLES `submission_tombstones` WRITE;
/*!40000 ALTER TABLE `submission_tombstones` DISABLE KEYS */;
/*!40000 ALTER TABLE `submission_tombstones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submissions`
--

DROP TABLE IF EXISTS `submissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submissions` (
  `submission_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `locale` varchar(14) DEFAULT NULL,
  `context_id` bigint(20) NOT NULL,
  `section_id` bigint(20) DEFAULT NULL,
  `language` varchar(10) DEFAULT 'en',
  `citations` text,
  `date_submitted` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `date_status_modified` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `submission_progress` tinyint(4) NOT NULL DEFAULT '1',
  `pages` varchar(255) DEFAULT NULL,
  `hide_author` tinyint(4) NOT NULL DEFAULT '0',
  `stage_id` bigint(20) NOT NULL DEFAULT '1',
  PRIMARY KEY (`submission_id`),
  KEY `submissions_section_id` (`section_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submissions`
--

LOCK TABLES `submissions` WRITE;
/*!40000 ALTER TABLE `submissions` DISABLE KEYS */;
INSERT INTO `submissions` VALUES (1,'es_ES',4,6,'es',NULL,'2019-10-28 16:26:37','2019-10-29 15:02:00','2019-10-29 15:01:59',3,0,'11-24',0,5);
/*!40000 ALTER TABLE `submissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription_type_settings`
--

DROP TABLE IF EXISTS `subscription_type_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscription_type_settings` (
  `type_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `subscription_type_settings_pkey` (`type_id`,`locale`,`setting_name`),
  KEY `subscription_type_settings_type_id` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription_type_settings`
--

LOCK TABLES `subscription_type_settings` WRITE;
/*!40000 ALTER TABLE `subscription_type_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscription_type_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription_types`
--

DROP TABLE IF EXISTS `subscription_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscription_types` (
  `type_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `journal_id` bigint(20) NOT NULL,
  `cost` double NOT NULL,
  `currency_code_alpha` varchar(3) NOT NULL,
  `non_expiring` tinyint(4) NOT NULL DEFAULT '0',
  `duration` smallint(6) DEFAULT NULL,
  `format` smallint(6) NOT NULL,
  `institutional` tinyint(4) NOT NULL DEFAULT '0',
  `membership` tinyint(4) NOT NULL DEFAULT '0',
  `disable_public_display` tinyint(4) NOT NULL,
  `seq` double NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription_types`
--

LOCK TABLES `subscription_types` WRITE;
/*!40000 ALTER TABLE `subscription_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscription_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscriptions` (
  `subscription_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `journal_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `type_id` bigint(20) NOT NULL,
  `date_start` date DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `membership` varchar(40) DEFAULT NULL,
  `reference_number` varchar(40) DEFAULT NULL,
  `notes` text,
  PRIMARY KEY (`subscription_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriptions`
--

LOCK TABLES `subscriptions` WRITE;
/*!40000 ALTER TABLE `subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temporary_files`
--

DROP TABLE IF EXISTS `temporary_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temporary_files` (
  `file_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `file_name` varchar(90) NOT NULL,
  `file_type` varchar(255) DEFAULT NULL,
  `file_size` bigint(20) NOT NULL,
  `original_file_name` varchar(127) DEFAULT NULL,
  `date_uploaded` datetime NOT NULL,
  PRIMARY KEY (`file_id`),
  KEY `temporary_files_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temporary_files`
--

LOCK TABLES `temporary_files` WRITE;
/*!40000 ALTER TABLE `temporary_files` DISABLE KEYS */;
INSERT INTO `temporary_files` VALUES (8,2,'jpgSNcXWs','image/jpeg',3338554,'REVISTACIENTIFICA - FIQIA CyTAF - PORTADA.jpg','2019-10-24 18:28:53'),(9,2,'jpgE9BNT5','image/jpeg',3338554,'REVISTACIENTIFICA - FIQIA CyTAF - PORTADA.jpg','2019-10-24 23:51:43'),(12,6,'jpgoOxYsq','image/jpeg',550315,'RC-2016-VOL7-N1.jpg','2019-10-28 16:04:26'),(13,6,'jpgGp0WgP','image/jpeg',550315,'RC-2016-VOL7-N1.jpg','2019-10-28 16:07:03');
/*!40000 ALTER TABLE `temporary_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usage_stats_temporary_records`
--

DROP TABLE IF EXISTS `usage_stats_temporary_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usage_stats_temporary_records` (
  `assoc_id` bigint(20) NOT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `day` bigint(20) NOT NULL,
  `entry_time` bigint(20) NOT NULL,
  `metric` bigint(20) NOT NULL DEFAULT '1',
  `country_id` varchar(2) DEFAULT NULL,
  `region` varchar(2) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `load_id` varchar(255) NOT NULL,
  `file_type` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usage_stats_temporary_records`
--

LOCK TABLES `usage_stats_temporary_records` WRITE;
/*!40000 ALTER TABLE `usage_stats_temporary_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `usage_stats_temporary_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group_settings`
--

DROP TABLE IF EXISTS `user_group_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_group_settings` (
  `user_group_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `user_group_settings_pkey` (`user_group_id`,`locale`,`setting_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group_settings`
--

LOCK TABLES `user_group_settings` WRITE;
/*!40000 ALTER TABLE `user_group_settings` DISABLE KEYS */;
INSERT INTO `user_group_settings` VALUES (1,'en_US','name','Site Admin','string'),(1,'es_ES','name','##default.groups.name.siteAdmin##','string'),(1,'pt_BR','name','##default.groups.name.siteAdmin##','string'),(2,'','abbrevLocaleKey','default.groups.abbrev.manager','string'),(2,'','nameLocaleKey','default.groups.name.manager','string'),(2,'en_US','abbrev','JM','string'),(2,'en_US','name','Journal manager','string'),(2,'es_ES','abbrev','GR','string'),(2,'es_ES','name','Gestor/a de la revista','string'),(2,'pt_BR','abbrev','GR','string'),(2,'pt_BR','name','Gerente da revista','string'),(3,'','abbrevLocaleKey','default.groups.abbrev.editor','string'),(3,'','nameLocaleKey','default.groups.name.editor','string'),(3,'en_US','abbrev','JE','string'),(3,'en_US','name','Journal editor','string'),(3,'es_ES','abbrev','ER','string'),(3,'es_ES','name','Editor/a de la revista','string'),(3,'pt_BR','abbrev','ER','string'),(3,'pt_BR','name','Editor da revista','string'),(4,'','abbrevLocaleKey','default.groups.abbrev.productionEditor','string'),(4,'','nameLocaleKey','default.groups.name.productionEditor','string'),(4,'en_US','abbrev','ProdE','string'),(4,'en_US','name','Production editor','string'),(4,'es_ES','abbrev','CoProd','string'),(4,'es_ES','name','Coordinador/a de producción','string'),(4,'pt_BR','abbrev','EP','string'),(4,'pt_BR','name','Editor de Leiaute','string'),(5,'','abbrevLocaleKey','default.groups.abbrev.sectionEditor','string'),(5,'','nameLocaleKey','default.groups.name.sectionEditor','string'),(5,'en_US','abbrev','SecE','string'),(5,'en_US','name','Section editor','string'),(5,'es_ES','abbrev','ESec','string'),(5,'es_ES','name','Editor/a de sección','string'),(5,'pt_BR','abbrev','ESeç','string'),(5,'pt_BR','name','Editor de seção','string'),(6,'','abbrevLocaleKey','default.groups.abbrev.guestEditor','string'),(6,'','nameLocaleKey','default.groups.name.guestEditor','string'),(6,'en_US','abbrev','GE','string'),(6,'en_US','name','Guest editor','string'),(6,'es_ES','abbrev','EI','string'),(6,'es_ES','name','Editor/a invitado/a','string'),(6,'pt_BR','abbrev','EConv','string'),(6,'pt_BR','name','Editor convidado','string'),(7,'','abbrevLocaleKey','default.groups.abbrev.copyeditor','string'),(7,'','nameLocaleKey','default.groups.name.copyeditor','string'),(7,'en_US','abbrev','CE','string'),(7,'en_US','name','Copyeditor','string'),(7,'es_ES','abbrev','CE','string'),(7,'es_ES','name','Corrector/a de estilo','string'),(7,'pt_BR','abbrev','ET','string'),(7,'pt_BR','name','Editor de texto','string'),(8,'','abbrevLocaleKey','default.groups.abbrev.designer','string'),(8,'','nameLocaleKey','default.groups.name.designer','string'),(8,'en_US','abbrev','Design','string'),(8,'en_US','name','Designer','string'),(8,'es_ES','abbrev','Diseño','string'),(8,'es_ES','name','Diseñador/a','string'),(8,'pt_BR','abbrev','DE','string'),(8,'pt_BR','name','Designer','string'),(9,'','abbrevLocaleKey','default.groups.abbrev.funding','string'),(9,'','nameLocaleKey','default.groups.name.funding','string'),(9,'en_US','abbrev','FC','string'),(9,'en_US','name','Funding coordinator','string'),(9,'es_ES','abbrev','CF','string'),(9,'es_ES','name','Coordinador/a de financiación','string'),(9,'pt_BR','abbrev','CF','string'),(9,'pt_BR','name','Coordenador de Financiamento','string'),(10,'','abbrevLocaleKey','default.groups.abbrev.indexer','string'),(10,'','nameLocaleKey','default.groups.name.indexer','string'),(10,'en_US','abbrev','IND','string'),(10,'en_US','name','Indexer','string'),(10,'es_ES','abbrev','DOC','string'),(10,'es_ES','name','Documentalista','string'),(10,'pt_BR','abbrev','IND','string'),(10,'pt_BR','name','Indexador','string'),(11,'','abbrevLocaleKey','default.groups.abbrev.layoutEditor','string'),(11,'','nameLocaleKey','default.groups.name.layoutEditor','string'),(11,'en_US','abbrev','LE','string'),(11,'en_US','name','Layout Editor','string'),(11,'es_ES','abbrev','MAQ','string'),(11,'es_ES','name','Maquetador/a','string'),(11,'pt_BR','abbrev','EL','string'),(11,'pt_BR','name','Editor de Leiaute','string'),(12,'','abbrevLocaleKey','default.groups.abbrev.marketing','string'),(12,'','nameLocaleKey','default.groups.name.marketing','string'),(12,'en_US','abbrev','MS','string'),(12,'en_US','name','Marketing and sales coordinator','string'),(12,'es_ES','abbrev','MV','string'),(12,'es_ES','name','Coordinador/a de marketing y ventas','string'),(12,'pt_BR','abbrev','CVM','string'),(12,'pt_BR','name','Coordenador de Vendas e Marketing','string'),(13,'','abbrevLocaleKey','default.groups.abbrev.proofreader','string'),(13,'','nameLocaleKey','default.groups.name.proofreader','string'),(13,'en_US','abbrev','PR','string'),(13,'en_US','name','Proofreader','string'),(13,'es_ES','abbrev','CP','string'),(13,'es_ES','name','Corrector/a de pruebas','string'),(13,'pt_BR','abbrev','LP','string'),(13,'pt_BR','name','Leitor de Prova','string'),(14,'','abbrevLocaleKey','default.groups.abbrev.author','string'),(14,'','nameLocaleKey','default.groups.name.author','string'),(14,'en_US','abbrev','AU','string'),(14,'en_US','name','Author','string'),(14,'es_ES','abbrev','AU','string'),(14,'es_ES','name','Autor/a','string'),(14,'pt_BR','abbrev','AU','string'),(14,'pt_BR','name','Autor','string'),(15,'','abbrevLocaleKey','default.groups.abbrev.translator','string'),(15,'','nameLocaleKey','default.groups.name.translator','string'),(15,'en_US','abbrev','Trans','string'),(15,'en_US','name','Translator','string'),(15,'es_ES','abbrev','Trad','string'),(15,'es_ES','name','Traductor/a','string'),(15,'pt_BR','abbrev','TR','string'),(15,'pt_BR','name','Tradutor','string'),(16,'','abbrevLocaleKey','default.groups.abbrev.externalReviewer','string'),(16,'','nameLocaleKey','default.groups.name.externalReviewer','string'),(16,'en_US','abbrev','R','string'),(16,'en_US','name','Reviewer','string'),(16,'es_ES','abbrev','RE','string'),(16,'es_ES','name','Revisor/a externo','string'),(16,'pt_BR','abbrev','A','string'),(16,'pt_BR','name','Avaliador','string'),(17,'','abbrevLocaleKey','default.groups.abbrev.reader','string'),(17,'','nameLocaleKey','default.groups.name.reader','string'),(17,'en_US','abbrev','Read','string'),(17,'en_US','name','Reader','string'),(17,'es_ES','abbrev','Lect','string'),(17,'es_ES','name','Lector/a','string'),(17,'pt_BR','abbrev','LE','string'),(17,'pt_BR','name','Leitor','string'),(18,'','abbrevLocaleKey','default.groups.abbrev.subscriptionManager','string'),(18,'','nameLocaleKey','default.groups.name.subscriptionManager','string'),(18,'en_US','abbrev','SubM','string'),(18,'en_US','name','Subscription Manager','string'),(18,'es_ES','abbrev','GSus','string'),(18,'es_ES','name','Gestor/a de suscripción','string'),(18,'pt_BR','abbrev','GAssin','string'),(18,'pt_BR','name','Gerente de assinatura','string'),(19,'','abbrevLocaleKey','default.groups.abbrev.manager','string'),(19,'','nameLocaleKey','default.groups.name.manager','string'),(19,'en_US','abbrev','JM','string'),(19,'en_US','name','Journal manager','string'),(19,'es_ES','abbrev','GR','string'),(19,'es_ES','name','Gestor/a de la revista','string'),(19,'pt_BR','abbrev','GR','string'),(19,'pt_BR','name','Gerente da revista','string'),(20,'','abbrevLocaleKey','default.groups.abbrev.editor','string'),(20,'','nameLocaleKey','default.groups.name.editor','string'),(20,'en_US','abbrev','JE','string'),(20,'en_US','name','Journal editor','string'),(20,'es_ES','abbrev','ER','string'),(20,'es_ES','name','Editor/a de la revista','string'),(20,'pt_BR','abbrev','ER','string'),(20,'pt_BR','name','Editor da revista','string'),(21,'','abbrevLocaleKey','default.groups.abbrev.productionEditor','string'),(21,'','nameLocaleKey','default.groups.name.productionEditor','string'),(21,'en_US','abbrev','ProdE','string'),(21,'en_US','name','Production editor','string'),(21,'es_ES','abbrev','CoProd','string'),(21,'es_ES','name','Coordinador/a de producción','string'),(21,'pt_BR','abbrev','EP','string'),(21,'pt_BR','name','Editor de Leiaute','string'),(22,'','abbrevLocaleKey','default.groups.abbrev.sectionEditor','string'),(22,'','nameLocaleKey','default.groups.name.sectionEditor','string'),(22,'en_US','abbrev','SecE','string'),(22,'en_US','name','Section editor','string'),(22,'es_ES','abbrev','ESec','string'),(22,'es_ES','name','Editor/a de sección','string'),(22,'pt_BR','abbrev','ESeç','string'),(22,'pt_BR','name','Editor de seção','string'),(23,'','abbrevLocaleKey','default.groups.abbrev.guestEditor','string'),(23,'','nameLocaleKey','default.groups.name.guestEditor','string'),(23,'en_US','abbrev','GE','string'),(23,'en_US','name','Guest editor','string'),(23,'es_ES','abbrev','EI','string'),(23,'es_ES','name','Editor/a invitado/a','string'),(23,'pt_BR','abbrev','EConv','string'),(23,'pt_BR','name','Editor convidado','string'),(24,'','abbrevLocaleKey','default.groups.abbrev.copyeditor','string'),(24,'','nameLocaleKey','default.groups.name.copyeditor','string'),(24,'en_US','abbrev','CE','string'),(24,'en_US','name','Copyeditor','string'),(24,'es_ES','abbrev','CE','string'),(24,'es_ES','name','Corrector/a de estilo','string'),(24,'pt_BR','abbrev','ET','string'),(24,'pt_BR','name','Editor de texto','string'),(25,'','abbrevLocaleKey','default.groups.abbrev.designer','string'),(25,'','nameLocaleKey','default.groups.name.designer','string'),(25,'en_US','abbrev','Design','string'),(25,'en_US','name','Designer','string'),(25,'es_ES','abbrev','Diseño','string'),(25,'es_ES','name','Diseñador/a','string'),(25,'pt_BR','abbrev','DE','string'),(25,'pt_BR','name','Designer','string'),(26,'','abbrevLocaleKey','default.groups.abbrev.funding','string'),(26,'','nameLocaleKey','default.groups.name.funding','string'),(26,'en_US','abbrev','FC','string'),(26,'en_US','name','Funding coordinator','string'),(26,'es_ES','abbrev','CF','string'),(26,'es_ES','name','Coordinador/a de financiación','string'),(26,'pt_BR','abbrev','CF','string'),(26,'pt_BR','name','Coordenador de Financiamento','string'),(27,'','abbrevLocaleKey','default.groups.abbrev.indexer','string'),(27,'','nameLocaleKey','default.groups.name.indexer','string'),(27,'en_US','abbrev','IND','string'),(27,'en_US','name','Indexer','string'),(27,'es_ES','abbrev','DOC','string'),(27,'es_ES','name','Documentalista','string'),(27,'pt_BR','abbrev','IND','string'),(27,'pt_BR','name','Indexador','string'),(28,'','abbrevLocaleKey','default.groups.abbrev.layoutEditor','string'),(28,'','nameLocaleKey','default.groups.name.layoutEditor','string'),(28,'en_US','abbrev','LE','string'),(28,'en_US','name','Layout Editor','string'),(28,'es_ES','abbrev','MAQ','string'),(28,'es_ES','name','Maquetador/a','string'),(28,'pt_BR','abbrev','EL','string'),(28,'pt_BR','name','Editor de Leiaute','string'),(29,'','abbrevLocaleKey','default.groups.abbrev.marketing','string'),(29,'','nameLocaleKey','default.groups.name.marketing','string'),(29,'en_US','abbrev','MS','string'),(29,'en_US','name','Marketing and sales coordinator','string'),(29,'es_ES','abbrev','MV','string'),(29,'es_ES','name','Coordinador/a de marketing y ventas','string'),(29,'pt_BR','abbrev','CVM','string'),(29,'pt_BR','name','Coordenador de Vendas e Marketing','string'),(30,'','abbrevLocaleKey','default.groups.abbrev.proofreader','string'),(30,'','nameLocaleKey','default.groups.name.proofreader','string'),(30,'en_US','abbrev','PR','string'),(30,'en_US','name','Proofreader','string'),(30,'es_ES','abbrev','CP','string'),(30,'es_ES','name','Corrector/a de pruebas','string'),(30,'pt_BR','abbrev','LP','string'),(30,'pt_BR','name','Leitor de Prova','string'),(31,'','abbrevLocaleKey','default.groups.abbrev.author','string'),(31,'','nameLocaleKey','default.groups.name.author','string'),(31,'en_US','abbrev','AU','string'),(31,'en_US','name','Author','string'),(31,'es_ES','abbrev','AU','string'),(31,'es_ES','name','Autor/a','string'),(31,'pt_BR','abbrev','AU','string'),(31,'pt_BR','name','Autor','string'),(32,'','abbrevLocaleKey','default.groups.abbrev.translator','string'),(32,'','nameLocaleKey','default.groups.name.translator','string'),(32,'en_US','abbrev','Trans','string'),(32,'en_US','name','Translator','string'),(32,'es_ES','abbrev','Trad','string'),(32,'es_ES','name','Traductor/a','string'),(32,'pt_BR','abbrev','TR','string'),(32,'pt_BR','name','Tradutor','string'),(33,'','abbrevLocaleKey','default.groups.abbrev.externalReviewer','string'),(33,'','nameLocaleKey','default.groups.name.externalReviewer','string'),(33,'en_US','abbrev','R','string'),(33,'en_US','name','Reviewer','string'),(33,'es_ES','abbrev','RE','string'),(33,'es_ES','name','Revisor/a externo','string'),(33,'pt_BR','abbrev','A','string'),(33,'pt_BR','name','Avaliador','string'),(34,'','abbrevLocaleKey','default.groups.abbrev.reader','string'),(34,'','nameLocaleKey','default.groups.name.reader','string'),(34,'en_US','abbrev','Read','string'),(34,'en_US','name','Reader','string'),(34,'es_ES','abbrev','Lect','string'),(34,'es_ES','name','Lector/a','string'),(34,'pt_BR','abbrev','LE','string'),(34,'pt_BR','name','Leitor','string'),(35,'','abbrevLocaleKey','default.groups.abbrev.subscriptionManager','string'),(35,'','nameLocaleKey','default.groups.name.subscriptionManager','string'),(35,'en_US','abbrev','SubM','string'),(35,'en_US','name','Subscription Manager','string'),(35,'es_ES','abbrev','GSus','string'),(35,'es_ES','name','Gestor/a de suscripción','string'),(35,'pt_BR','abbrev','GAssin','string'),(35,'pt_BR','name','Gerente de assinatura','string'),(36,'','abbrevLocaleKey','default.groups.abbrev.manager','string'),(36,'','nameLocaleKey','default.groups.name.manager','string'),(36,'en_US','abbrev','JM','string'),(36,'en_US','name','Journal manager','string'),(36,'es_ES','abbrev','GR','string'),(36,'es_ES','name','Gestor/a de la revista','string'),(36,'pt_BR','abbrev','GR','string'),(36,'pt_BR','name','Gerente da revista','string'),(37,'','abbrevLocaleKey','default.groups.abbrev.editor','string'),(37,'','nameLocaleKey','default.groups.name.editor','string'),(37,'en_US','abbrev','JE','string'),(37,'en_US','name','Journal editor','string'),(37,'es_ES','abbrev','ER','string'),(37,'es_ES','name','Editor/a de la revista','string'),(37,'pt_BR','abbrev','ER','string'),(37,'pt_BR','name','Editor da revista','string'),(38,'','abbrevLocaleKey','default.groups.abbrev.productionEditor','string'),(38,'','nameLocaleKey','default.groups.name.productionEditor','string'),(38,'en_US','abbrev','ProdE','string'),(38,'en_US','name','Production editor','string'),(38,'es_ES','abbrev','CoProd','string'),(38,'es_ES','name','Coordinador/a de producción','string'),(38,'pt_BR','abbrev','EP','string'),(38,'pt_BR','name','Editor de Leiaute','string'),(39,'','abbrevLocaleKey','default.groups.abbrev.sectionEditor','string'),(39,'','nameLocaleKey','default.groups.name.sectionEditor','string'),(39,'en_US','abbrev','SecE','string'),(39,'en_US','name','Section editor','string'),(39,'es_ES','abbrev','ESec','string'),(39,'es_ES','name','Editor/a de sección','string'),(39,'pt_BR','abbrev','ESeç','string'),(39,'pt_BR','name','Editor de seção','string'),(40,'','abbrevLocaleKey','default.groups.abbrev.guestEditor','string'),(40,'','nameLocaleKey','default.groups.name.guestEditor','string'),(40,'en_US','abbrev','GE','string'),(40,'en_US','name','Guest editor','string'),(40,'es_ES','abbrev','EI','string'),(40,'es_ES','name','Editor/a invitado/a','string'),(40,'pt_BR','abbrev','EConv','string'),(40,'pt_BR','name','Editor convidado','string'),(41,'','abbrevLocaleKey','default.groups.abbrev.copyeditor','string'),(41,'','nameLocaleKey','default.groups.name.copyeditor','string'),(41,'en_US','abbrev','CE','string'),(41,'en_US','name','Copyeditor','string'),(41,'es_ES','abbrev','CE','string'),(41,'es_ES','name','Corrector/a de estilo','string'),(41,'pt_BR','abbrev','ET','string'),(41,'pt_BR','name','Editor de texto','string'),(42,'','abbrevLocaleKey','default.groups.abbrev.designer','string'),(42,'','nameLocaleKey','default.groups.name.designer','string'),(42,'en_US','abbrev','Design','string'),(42,'en_US','name','Designer','string'),(42,'es_ES','abbrev','Diseño','string'),(42,'es_ES','name','Diseñador/a','string'),(42,'pt_BR','abbrev','DE','string'),(42,'pt_BR','name','Designer','string'),(43,'','abbrevLocaleKey','default.groups.abbrev.funding','string'),(43,'','nameLocaleKey','default.groups.name.funding','string'),(43,'en_US','abbrev','FC','string'),(43,'en_US','name','Funding coordinator','string'),(43,'es_ES','abbrev','CF','string'),(43,'es_ES','name','Coordinador/a de financiación','string'),(43,'pt_BR','abbrev','CF','string'),(43,'pt_BR','name','Coordenador de Financiamento','string'),(44,'','abbrevLocaleKey','default.groups.abbrev.indexer','string'),(44,'','nameLocaleKey','default.groups.name.indexer','string'),(44,'en_US','abbrev','IND','string'),(44,'en_US','name','Indexer','string'),(44,'es_ES','abbrev','DOC','string'),(44,'es_ES','name','Documentalista','string'),(44,'pt_BR','abbrev','IND','string'),(44,'pt_BR','name','Indexador','string'),(45,'','abbrevLocaleKey','default.groups.abbrev.layoutEditor','string'),(45,'','nameLocaleKey','default.groups.name.layoutEditor','string'),(45,'en_US','abbrev','LE','string'),(45,'en_US','name','Layout Editor','string'),(45,'es_ES','abbrev','MAQ','string'),(45,'es_ES','name','Maquetador/a','string'),(45,'pt_BR','abbrev','EL','string'),(45,'pt_BR','name','Editor de Leiaute','string'),(46,'','abbrevLocaleKey','default.groups.abbrev.marketing','string'),(46,'','nameLocaleKey','default.groups.name.marketing','string'),(46,'en_US','abbrev','MS','string'),(46,'en_US','name','Marketing and sales coordinator','string'),(46,'es_ES','abbrev','MV','string'),(46,'es_ES','name','Coordinador/a de marketing y ventas','string'),(46,'pt_BR','abbrev','CVM','string'),(46,'pt_BR','name','Coordenador de Vendas e Marketing','string'),(47,'','abbrevLocaleKey','default.groups.abbrev.proofreader','string'),(47,'','nameLocaleKey','default.groups.name.proofreader','string'),(47,'en_US','abbrev','PR','string'),(47,'en_US','name','Proofreader','string'),(47,'es_ES','abbrev','CP','string'),(47,'es_ES','name','Corrector/a de pruebas','string'),(47,'pt_BR','abbrev','LP','string'),(47,'pt_BR','name','Leitor de Prova','string'),(48,'','abbrevLocaleKey','default.groups.abbrev.author','string'),(48,'','nameLocaleKey','default.groups.name.author','string'),(48,'en_US','abbrev','AU','string'),(48,'en_US','name','Author','string'),(48,'es_ES','abbrev','AU','string'),(48,'es_ES','name','Autor/a','string'),(48,'pt_BR','abbrev','AU','string'),(48,'pt_BR','name','Autor','string'),(49,'','abbrevLocaleKey','default.groups.abbrev.translator','string'),(49,'','nameLocaleKey','default.groups.name.translator','string'),(49,'en_US','abbrev','Trans','string'),(49,'en_US','name','Translator','string'),(49,'es_ES','abbrev','Trad','string'),(49,'es_ES','name','Traductor/a','string'),(49,'pt_BR','abbrev','TR','string'),(49,'pt_BR','name','Tradutor','string'),(50,'','abbrevLocaleKey','default.groups.abbrev.externalReviewer','string'),(50,'','nameLocaleKey','default.groups.name.externalReviewer','string'),(50,'en_US','abbrev','R','string'),(50,'en_US','name','Reviewer','string'),(50,'es_ES','abbrev','RE','string'),(50,'es_ES','name','Revisor/a externo','string'),(50,'pt_BR','abbrev','A','string'),(50,'pt_BR','name','Avaliador','string'),(51,'','abbrevLocaleKey','default.groups.abbrev.reader','string'),(51,'','nameLocaleKey','default.groups.name.reader','string'),(51,'en_US','abbrev','Read','string'),(51,'en_US','name','Reader','string'),(51,'es_ES','abbrev','Lect','string'),(51,'es_ES','name','Lector/a','string'),(51,'pt_BR','abbrev','LE','string'),(51,'pt_BR','name','Leitor','string'),(52,'','abbrevLocaleKey','default.groups.abbrev.subscriptionManager','string'),(52,'','nameLocaleKey','default.groups.name.subscriptionManager','string'),(52,'en_US','abbrev','SubM','string'),(52,'en_US','name','Subscription Manager','string'),(52,'es_ES','abbrev','GSus','string'),(52,'es_ES','name','Gestor/a de suscripción','string'),(52,'pt_BR','abbrev','GAssin','string'),(52,'pt_BR','name','Gerente de assinatura','string'),(53,'','abbrevLocaleKey','default.groups.abbrev.manager','string'),(53,'','nameLocaleKey','default.groups.name.manager','string'),(53,'en_US','abbrev','JM','string'),(53,'en_US','name','Journal manager','string'),(53,'es_ES','abbrev','GR','string'),(53,'es_ES','name','Gestor/a de la revista','string'),(53,'pt_BR','abbrev','GR','string'),(53,'pt_BR','name','Gerente da revista','string'),(54,'','abbrevLocaleKey','default.groups.abbrev.editor','string'),(54,'','nameLocaleKey','default.groups.name.editor','string'),(54,'en_US','abbrev','JE','string'),(54,'en_US','name','Journal editor','string'),(54,'es_ES','abbrev','ER','string'),(54,'es_ES','name','Editor/a de la revista','string'),(54,'pt_BR','abbrev','ER','string'),(54,'pt_BR','name','Editor da revista','string'),(55,'','abbrevLocaleKey','default.groups.abbrev.productionEditor','string'),(55,'','nameLocaleKey','default.groups.name.productionEditor','string'),(55,'en_US','abbrev','ProdE','string'),(55,'en_US','name','Production editor','string'),(55,'es_ES','abbrev','CoProd','string'),(55,'es_ES','name','Coordinador/a de producción','string'),(55,'pt_BR','abbrev','EP','string'),(55,'pt_BR','name','Editor de Leiaute','string'),(56,'','abbrevLocaleKey','default.groups.abbrev.sectionEditor','string'),(56,'','nameLocaleKey','default.groups.name.sectionEditor','string'),(56,'en_US','abbrev','SecE','string'),(56,'en_US','name','Section editor','string'),(56,'es_ES','abbrev','ESec','string'),(56,'es_ES','name','Editor/a de sección','string'),(56,'pt_BR','abbrev','ESeç','string'),(56,'pt_BR','name','Editor de seção','string'),(57,'','abbrevLocaleKey','default.groups.abbrev.guestEditor','string'),(57,'','nameLocaleKey','default.groups.name.guestEditor','string'),(57,'en_US','abbrev','GE','string'),(57,'en_US','name','Guest editor','string'),(57,'es_ES','abbrev','EI','string'),(57,'es_ES','name','Editor/a invitado/a','string'),(57,'pt_BR','abbrev','EConv','string'),(57,'pt_BR','name','Editor convidado','string'),(58,'','abbrevLocaleKey','default.groups.abbrev.copyeditor','string'),(58,'','nameLocaleKey','default.groups.name.copyeditor','string'),(58,'en_US','abbrev','CE','string'),(58,'en_US','name','Copyeditor','string'),(58,'es_ES','abbrev','CE','string'),(58,'es_ES','name','Corrector/a de estilo','string'),(58,'pt_BR','abbrev','ET','string'),(58,'pt_BR','name','Editor de texto','string'),(59,'','abbrevLocaleKey','default.groups.abbrev.designer','string'),(59,'','nameLocaleKey','default.groups.name.designer','string'),(59,'en_US','abbrev','Design','string'),(59,'en_US','name','Designer','string'),(59,'es_ES','abbrev','Diseño','string'),(59,'es_ES','name','Diseñador/a','string'),(59,'pt_BR','abbrev','DE','string'),(59,'pt_BR','name','Designer','string'),(60,'','abbrevLocaleKey','default.groups.abbrev.funding','string'),(60,'','nameLocaleKey','default.groups.name.funding','string'),(60,'en_US','abbrev','FC','string'),(60,'en_US','name','Funding coordinator','string'),(60,'es_ES','abbrev','CF','string'),(60,'es_ES','name','Coordinador/a de financiación','string'),(60,'pt_BR','abbrev','CF','string'),(60,'pt_BR','name','Coordenador de Financiamento','string'),(61,'','abbrevLocaleKey','default.groups.abbrev.indexer','string'),(61,'','nameLocaleKey','default.groups.name.indexer','string'),(61,'en_US','abbrev','IND','string'),(61,'en_US','name','Indexer','string'),(61,'es_ES','abbrev','DOC','string'),(61,'es_ES','name','Documentalista','string'),(61,'pt_BR','abbrev','IND','string'),(61,'pt_BR','name','Indexador','string'),(62,'','abbrevLocaleKey','default.groups.abbrev.layoutEditor','string'),(62,'','nameLocaleKey','default.groups.name.layoutEditor','string'),(62,'en_US','abbrev','LE','string'),(62,'en_US','name','Layout Editor','string'),(62,'es_ES','abbrev','MAQ','string'),(62,'es_ES','name','Maquetador/a','string'),(62,'pt_BR','abbrev','EL','string'),(62,'pt_BR','name','Editor de Leiaute','string'),(63,'','abbrevLocaleKey','default.groups.abbrev.marketing','string'),(63,'','nameLocaleKey','default.groups.name.marketing','string'),(63,'en_US','abbrev','MS','string'),(63,'en_US','name','Marketing and sales coordinator','string'),(63,'es_ES','abbrev','MV','string'),(63,'es_ES','name','Coordinador/a de marketing y ventas','string'),(63,'pt_BR','abbrev','CVM','string'),(63,'pt_BR','name','Coordenador de Vendas e Marketing','string'),(64,'','abbrevLocaleKey','default.groups.abbrev.proofreader','string'),(64,'','nameLocaleKey','default.groups.name.proofreader','string'),(64,'en_US','abbrev','PR','string'),(64,'en_US','name','Proofreader','string'),(64,'es_ES','abbrev','CP','string'),(64,'es_ES','name','Corrector/a de pruebas','string'),(64,'pt_BR','abbrev','LP','string'),(64,'pt_BR','name','Leitor de Prova','string'),(65,'','abbrevLocaleKey','default.groups.abbrev.author','string'),(65,'','nameLocaleKey','default.groups.name.author','string'),(65,'en_US','abbrev','AU','string'),(65,'en_US','name','Author','string'),(65,'es_ES','abbrev','AU','string'),(65,'es_ES','name','Autor/a','string'),(65,'pt_BR','abbrev','AU','string'),(65,'pt_BR','name','Autor','string'),(66,'','abbrevLocaleKey','default.groups.abbrev.translator','string'),(66,'','nameLocaleKey','default.groups.name.translator','string'),(66,'en_US','abbrev','Trans','string'),(66,'en_US','name','Translator','string'),(66,'es_ES','abbrev','Trad','string'),(66,'es_ES','name','Traductor/a','string'),(66,'pt_BR','abbrev','TR','string'),(66,'pt_BR','name','Tradutor','string'),(67,'','abbrevLocaleKey','default.groups.abbrev.externalReviewer','string'),(67,'','nameLocaleKey','default.groups.name.externalReviewer','string'),(67,'en_US','abbrev','R','string'),(67,'en_US','name','Reviewer','string'),(67,'es_ES','abbrev','RE','string'),(67,'es_ES','name','Revisor/a externo','string'),(67,'pt_BR','abbrev','A','string'),(67,'pt_BR','name','Avaliador','string'),(68,'','abbrevLocaleKey','default.groups.abbrev.reader','string'),(68,'','nameLocaleKey','default.groups.name.reader','string'),(68,'en_US','abbrev','Read','string'),(68,'en_US','name','Reader','string'),(68,'es_ES','abbrev','Lect','string'),(68,'es_ES','name','Lector/a','string'),(68,'pt_BR','abbrev','LE','string'),(68,'pt_BR','name','Leitor','string'),(69,'','abbrevLocaleKey','default.groups.abbrev.subscriptionManager','string'),(69,'','nameLocaleKey','default.groups.name.subscriptionManager','string'),(69,'en_US','abbrev','SubM','string'),(69,'en_US','name','Subscription Manager','string'),(69,'es_ES','abbrev','GSus','string'),(69,'es_ES','name','Gestor/a de suscripción','string'),(69,'pt_BR','abbrev','GAssin','string'),(69,'pt_BR','name','Gerente de assinatura','string');
/*!40000 ALTER TABLE `user_group_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group_stage`
--

DROP TABLE IF EXISTS `user_group_stage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_group_stage` (
  `context_id` bigint(20) NOT NULL,
  `user_group_id` bigint(20) NOT NULL,
  `stage_id` bigint(20) NOT NULL,
  UNIQUE KEY `user_group_stage_pkey` (`context_id`,`user_group_id`,`stage_id`),
  KEY `user_group_stage_context_id` (`context_id`),
  KEY `user_group_stage_user_group_id` (`user_group_id`),
  KEY `user_group_stage_stage_id` (`stage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group_stage`
--

LOCK TABLES `user_group_stage` WRITE;
/*!40000 ALTER TABLE `user_group_stage` DISABLE KEYS */;
INSERT INTO `user_group_stage` VALUES (1,3,1),(1,3,3),(1,3,4),(1,3,5),(1,4,4),(1,4,5),(1,5,1),(1,5,3),(1,5,4),(1,5,5),(1,6,1),(1,6,3),(1,6,4),(1,6,5),(1,7,4),(1,8,5),(1,9,1),(1,9,3),(1,10,5),(1,11,5),(1,12,4),(1,13,5),(1,14,1),(1,14,3),(1,14,4),(1,14,5),(1,15,1),(1,15,3),(1,15,4),(1,15,5),(1,16,3),(2,20,1),(2,20,3),(2,20,4),(2,20,5),(2,21,4),(2,21,5),(2,22,1),(2,22,3),(2,22,4),(2,22,5),(2,23,1),(2,23,3),(2,23,4),(2,23,5),(2,24,4),(2,25,5),(2,26,1),(2,26,3),(2,27,5),(2,28,5),(2,29,4),(2,30,5),(2,31,1),(2,31,3),(2,31,4),(2,31,5),(2,32,1),(2,32,3),(2,32,4),(2,32,5),(2,33,3),(3,37,1),(3,37,3),(3,37,4),(3,37,5),(3,38,4),(3,38,5),(3,39,1),(3,39,3),(3,39,4),(3,39,5),(3,40,1),(3,40,3),(3,40,4),(3,40,5),(3,41,4),(3,42,5),(3,43,1),(3,43,3),(3,44,5),(3,45,5),(3,46,4),(3,47,5),(3,48,1),(3,48,3),(3,48,4),(3,48,5),(3,49,1),(3,49,3),(3,49,4),(3,49,5),(3,50,3),(4,54,1),(4,54,3),(4,54,4),(4,54,5),(4,55,4),(4,55,5),(4,56,1),(4,56,3),(4,56,4),(4,56,5),(4,57,1),(4,57,3),(4,57,4),(4,57,5),(4,58,4),(4,59,5),(4,60,1),(4,60,3),(4,61,5),(4,62,5),(4,63,4),(4,64,5),(4,65,1),(4,65,3),(4,65,4),(4,65,5),(4,66,1),(4,66,3),(4,66,4),(4,66,5),(4,67,3);
/*!40000 ALTER TABLE `user_group_stage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_groups`
--

DROP TABLE IF EXISTS `user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_groups` (
  `user_group_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  `is_default` tinyint(4) NOT NULL DEFAULT '0',
  `show_title` tinyint(4) NOT NULL DEFAULT '1',
  `permit_self_registration` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_group_id`),
  KEY `user_groups_user_group_id` (`user_group_id`),
  KEY `user_groups_context_id` (`context_id`),
  KEY `user_groups_role_id` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_groups`
--

LOCK TABLES `user_groups` WRITE;
/*!40000 ALTER TABLE `user_groups` DISABLE KEYS */;
INSERT INTO `user_groups` VALUES (1,0,1,1,0,0),(2,1,16,1,0,0),(3,1,16,1,0,0),(4,1,16,1,0,0),(5,1,17,1,0,0),(6,1,17,1,0,0),(7,1,4097,1,0,0),(8,1,4097,1,0,0),(9,1,4097,1,0,0),(10,1,4097,1,0,0),(11,1,4097,1,0,0),(12,1,4097,1,0,0),(13,1,4097,1,0,0),(14,1,65536,1,0,1),(15,1,65536,1,0,0),(16,1,4096,1,0,1),(17,1,1048576,1,0,1),(18,1,2097152,1,0,0),(19,2,16,1,0,0),(20,2,16,1,0,0),(21,2,16,1,0,0),(22,2,17,1,0,0),(23,2,17,1,0,0),(24,2,4097,1,0,0),(25,2,4097,1,0,0),(26,2,4097,1,0,0),(27,2,4097,1,0,0),(28,2,4097,1,0,0),(29,2,4097,1,0,0),(30,2,4097,1,0,0),(31,2,65536,1,0,1),(32,2,65536,1,0,0),(33,2,4096,1,0,1),(34,2,1048576,1,0,1),(35,2,2097152,1,0,0),(36,3,16,1,0,0),(37,3,16,1,0,0),(38,3,16,1,0,0),(39,3,17,1,0,0),(40,3,17,1,0,0),(41,3,4097,1,0,0),(42,3,4097,1,0,0),(43,3,4097,1,0,0),(44,3,4097,1,0,0),(45,3,4097,1,0,0),(46,3,4097,1,0,0),(47,3,4097,1,0,0),(48,3,65536,1,0,1),(49,3,65536,1,0,0),(50,3,4096,1,0,1),(51,3,1048576,1,0,1),(52,3,2097152,1,0,0),(53,4,16,1,0,0),(54,4,16,1,0,0),(55,4,16,1,0,0),(56,4,17,1,0,0),(57,4,17,1,0,0),(58,4,4097,1,0,0),(59,4,4097,1,0,0),(60,4,4097,1,0,0),(61,4,4097,1,0,0),(62,4,4097,1,0,0),(63,4,4097,1,0,0),(64,4,4097,1,0,0),(65,4,65536,1,0,1),(66,4,65536,1,0,0),(67,4,4096,1,0,1),(68,4,1048576,1,0,1),(69,4,2097152,1,0,0);
/*!40000 ALTER TABLE `user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_interests`
--

DROP TABLE IF EXISTS `user_interests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_interests` (
  `user_id` bigint(20) NOT NULL,
  `controlled_vocab_entry_id` bigint(20) NOT NULL,
  UNIQUE KEY `u_e_pkey` (`user_id`,`controlled_vocab_entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_settings` (
  `user_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `assoc_type` bigint(20) DEFAULT '0',
  `assoc_id` bigint(20) DEFAULT '0',
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `user_settings_pkey` (`user_id`,`locale`,`setting_name`,`assoc_type`,`assoc_id`),
  KEY `user_settings_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_settings`
--

LOCK TABLES `user_settings` WRITE;
/*!40000 ALTER TABLE `user_settings` DISABLE KEYS */;
INSERT INTO `user_settings` VALUES (1,'es_ES','givenName',0,0,'adminopenjs','string'),(1,'es_ES','familyName',0,0,'adminopenjs','string'),(2,'es_ES','biography',0,0,'','string'),(2,'es_ES','signature',0,0,'','string'),(2,'es_ES','affiliation',0,0,'','string'),(2,'es_ES','givenName',0,0,'Noemí','string'),(2,'es_ES','familyName',0,0,'León Roque','string'),(2,'es_ES','preferredPublicName',0,0,'','string'),(2,'','orcid',0,0,'','string'),(3,'es_ES','affiliation',0,0,'unprg','string'),(3,'es_ES','givenName',0,0,'sergio','string'),(3,'es_ES','familyName',0,0,'huaman','string'),(4,'es_ES','affiliation',0,0,'Universidad Nacional Pedro Ruiz Gallo','string'),(4,'es_ES','givenName',0,0,'Yajaira','string'),(4,'es_ES','familyName',0,0,'Terrones Idrogo','string'),(5,'es_ES','affiliation',0,0,'Universidad Nacional Pedro Ruiz Gallo','string'),(5,'es_ES','givenName',0,0,'Elmer Milton','string'),(5,'es_ES','familyName',0,0,'Manayay Tafur','string'),(5,'es_ES','biography',0,0,'','string'),(5,'es_ES','signature',0,0,'','string'),(5,'es_ES','preferredPublicName',0,0,'','string'),(5,'','orcid',0,0,'','string'),(3,'es_ES','biography',0,0,'','string'),(3,'es_ES','signature',0,0,'','string'),(3,'es_ES','preferredPublicName',0,0,'','string'),(3,'','orcid',0,0,'','string'),(6,'es_ES','affiliation',0,0,'Universidad Nacional Pedro Ruiz Gallo','string'),(6,'es_ES','givenName',0,0,'Ada Patricia','string'),(6,'es_ES','familyName',0,0,'Barturén Quispe','string'),(6,'es_ES','biography',0,0,'','string'),(6,'es_ES','signature',0,0,'','string'),(6,'es_ES','preferredPublicName',0,0,'','string'),(6,'','orcid',0,0,'','string');
/*!40000 ALTER TABLE `user_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_user_groups`
--

DROP TABLE IF EXISTS `user_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_user_groups` (
  `user_group_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  UNIQUE KEY `user_user_groups_pkey` (`user_group_id`,`user_id`),
  KEY `user_user_groups_user_group_id` (`user_group_id`),
  KEY `user_user_groups_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_user_groups`
--

LOCK TABLES `user_user_groups` WRITE;
/*!40000 ALTER TABLE `user_user_groups` DISABLE KEYS */;
INSERT INTO `user_user_groups` VALUES (1,1),(2,1),(2,2),(2,3),(3,2),(3,3),(4,2),(5,2),(7,2),(8,2),(9,2),(10,2),(11,2),(12,2),(13,2),(14,2),(15,2),(18,2),(19,1),(36,1),(36,5),(37,5),(48,4),(48,5),(51,4),(53,1),(53,6),(54,6),(65,6),(68,6);
/*!40000 ALTER TABLE `user_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `url` varchar(2047) DEFAULT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `mailing_address` varchar(255) DEFAULT NULL,
  `billing_address` varchar(255) DEFAULT NULL,
  `country` varchar(90) DEFAULT NULL,
  `locales` varchar(255) DEFAULT NULL,
  `gossip` text,
  `date_last_email` datetime DEFAULT NULL,
  `date_registered` datetime NOT NULL,
  `date_validated` datetime DEFAULT NULL,
  `date_last_login` datetime NOT NULL,
  `must_change_password` tinyint(4) DEFAULT NULL,
  `auth_id` bigint(20) DEFAULT NULL,
  `auth_str` varchar(255) DEFAULT NULL,
  `disabled` tinyint(4) NOT NULL DEFAULT '0',
  `disabled_reason` text,
  `inline_help` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `users_username` (`username`),
  UNIQUE KEY `users_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'adminopenjs','$2y$10$ySuzMYtBIgQvsmgJOJc/PeSZPXkYyjT27Ww7ywcHJQG.YIF/LY9am','revistacientifica@unprg.edu.pe',NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,'2019-10-17 15:50:24',NULL,'2019-10-29 17:07:37',0,NULL,NULL,0,NULL,1),(2,'nleon','$2y$10$JToEMOnIJ0tkJjYalj7GU.LHLJq6UvLzdAe.iacU5MDDc5DSwngjC','nleonr@unprg.edu.pe','','','',NULL,'PE','',NULL,NULL,'2019-10-17 16:09:27',NULL,'2019-10-25 00:51:02',0,NULL,NULL,0,NULL,1),(3,'sergio128','$2y$10$a/IGxBZwjhwBUu0G09eBKOtqQysiI.UElzVBGO7XAPcMRo3JE3.qe','sergiohg128@gmail.com','','','',NULL,'PE','','',NULL,'2019-10-17 16:14:50',NULL,'2019-10-17 17:08:23',0,NULL,NULL,0,NULL,1),(4,'yajaira_terrones','$2y$10$WVn0K//umB3YXQh.aTsd2OZzlrrZp3mAgIXZKqe4DEigMIYBTjIWO','yajaira_216@hotmail.com',NULL,NULL,NULL,NULL,'PE','',NULL,NULL,'2019-10-22 14:32:07',NULL,'2019-10-22 14:32:07',0,NULL,NULL,0,NULL,1),(5,'elmer_manayay','$2y$10$G9k15SUGgAhJ/ytRnaA0F.l/qDNM/pq8IzCSuQ.h8xjNodzAPv7ay','emanayay@unprg.edu.pe','','','',NULL,'PE','','',NULL,'2019-10-22 14:37:43',NULL,'2019-10-24 23:27:10',0,NULL,NULL,0,NULL,1),(6,'abarturen','$2y$10$O2zGfXrXIZjPAA3aXCJlFu1FGZwS1eHDM/vvUGfpGvPcnn3CocIPS','adapatricia33@hotmail.com','','','',NULL,'PE','',NULL,NULL,'2019-10-28 15:51:35',NULL,'2019-10-29 14:26:35',0,NULL,NULL,0,NULL,1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `versions`
--

DROP TABLE IF EXISTS `versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `versions` (
  `major` int(11) NOT NULL DEFAULT '0',
  `minor` int(11) NOT NULL DEFAULT '0',
  `revision` int(11) NOT NULL DEFAULT '0',
  `build` int(11) NOT NULL DEFAULT '0',
  `date_installed` datetime NOT NULL,
  `current` tinyint(4) NOT NULL DEFAULT '0',
  `product_type` varchar(30) DEFAULT NULL,
  `product` varchar(30) DEFAULT NULL,
  `product_class_name` varchar(80) DEFAULT NULL,
  `lazy_load` tinyint(4) NOT NULL DEFAULT '0',
  `sitewide` tinyint(4) NOT NULL DEFAULT '0',
  UNIQUE KEY `versions_pkey` (`product_type`,`product`,`major`,`minor`,`revision`,`build`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `versions`
--

LOCK TABLES `versions` WRITE;
/*!40000 ALTER TABLE `versions` DISABLE KEYS */;
INSERT INTO `versions` VALUES (1,0,0,0,'2019-10-17 15:50:25',1,'plugins.metadata','mods34','',0,0),(1,0,0,0,'2019-10-17 15:50:25',1,'plugins.metadata','openurl10','',0,0),(1,0,0,0,'2019-10-17 15:50:25',1,'plugins.metadata','dc11','',0,0),(1,0,0,0,'2019-10-17 15:50:25',1,'plugins.blocks','browse','BrowseBlockPlugin',1,0),(1,1,0,0,'2019-10-17 15:50:25',1,'plugins.blocks','subscription','SubscriptionBlockPlugin',1,0),(1,0,0,0,'2019-10-17 15:50:25',1,'plugins.blocks','makeSubmission','MakeSubmissionBlockPlugin',1,0),(1,0,0,0,'2019-10-17 15:50:25',1,'plugins.blocks','information','InformationBlockPlugin',1,0),(1,0,0,0,'2019-10-17 15:50:25',1,'plugins.blocks','developedBy','DevelopedByBlockPlugin',1,0),(1,0,0,0,'2019-10-17 15:50:25',1,'plugins.blocks','languageToggle','LanguageToggleBlockPlugin',1,0),(1,0,0,0,'2019-10-17 15:50:25',1,'plugins.gateways','resolver','',0,0),(1,0,0,0,'2019-10-17 15:50:25',1,'plugins.generic','htmlArticleGalley','HtmlArticleGalleyPlugin',1,0),(1,0,0,0,'2019-10-17 15:50:25',1,'plugins.generic','recommendByAuthor','RecommendByAuthorPlugin',1,1),(1,2,0,0,'2019-10-17 15:50:25',1,'plugins.generic','customBlockManager','CustomBlockManagerPlugin',1,0),(1,2,0,0,'2019-10-17 15:50:25',1,'plugins.generic','acron','AcronPlugin',1,1),(1,0,0,0,'2019-10-17 15:50:25',1,'plugins.generic','usageStats','UsageStatsPlugin',0,1),(1,0,0,0,'2019-10-17 15:50:25',1,'plugins.generic','lensGalley','LensGalleyPlugin',1,0),(1,0,0,0,'2019-10-17 15:50:25',1,'plugins.generic','googleAnalytics','GoogleAnalyticsPlugin',1,0),(1,1,1,1,'2019-10-17 15:50:25',1,'plugins.generic','orcidProfile','OrcidProfilePlugin',1,0),(1,0,0,0,'2019-10-17 15:50:25',1,'plugins.generic','tinymce','TinyMCEPlugin',1,0),(1,0,0,0,'2019-10-17 15:50:25',1,'plugins.generic','usageEvent','',0,0),(1,0,1,0,'2019-10-17 15:50:25',1,'plugins.generic','pdfJsViewer','PdfJsViewerPlugin',1,0),(1,2,0,0,'2019-10-17 15:50:25',1,'plugins.generic','openAIRE','OpenAIREPlugin',1,0),(0,1,0,0,'2019-10-17 15:50:25',1,'plugins.generic','citationStyleLanguage','CitationStyleLanguagePlugin',1,0),(1,0,0,0,'2019-10-17 15:50:25',1,'plugins.generic','webFeed','WebFeedPlugin',1,0),(1,2,0,0,'2019-10-17 15:50:25',1,'plugins.generic','staticPages','StaticPagesPlugin',1,0),(1,0,0,0,'2019-10-17 15:50:25',1,'plugins.generic','dublinCoreMeta','DublinCoreMetaPlugin',1,0),(1,0,0,0,'2019-10-17 15:50:25',1,'plugins.generic','googleScholar','GoogleScholarPlugin',1,0),(1,0,0,0,'2019-10-17 15:50:25',1,'plugins.generic','driver','DRIVERPlugin',1,0),(1,1,0,0,'2019-10-17 15:50:25',1,'plugins.importexport','doaj','',0,0),(2,1,0,0,'2019-10-17 15:50:25',1,'plugins.importexport','crossref','',0,0),(2,0,0,0,'2019-10-17 15:50:25',1,'plugins.importexport','medra','',0,0),(2,0,0,0,'2019-10-17 15:50:25',1,'plugins.importexport','datacite','',0,0),(1,0,0,0,'2019-10-17 15:50:25',1,'plugins.importexport','users','',0,0),(1,0,0,0,'2019-10-17 15:50:25',1,'plugins.importexport','pubmed','',0,0),(1,0,0,0,'2019-10-17 15:50:25',1,'plugins.importexport','native','',0,0),(1,0,0,0,'2019-10-17 15:50:25',1,'plugins.oaiMetadataFormats','dc','',0,0),(1,0,0,0,'2019-10-17 15:50:25',1,'plugins.oaiMetadataFormats','marc','',0,0),(1,0,0,0,'2019-10-17 15:50:25',1,'plugins.oaiMetadataFormats','rfc1807','',0,0),(1,0,0,0,'2019-10-17 15:50:25',1,'plugins.oaiMetadataFormats','marcxml','',0,0),(1,0,0,0,'2019-10-17 15:50:25',1,'plugins.paymethod','paypal','',0,0),(1,0,0,0,'2019-10-17 15:50:25',1,'plugins.paymethod','manual','',0,0),(1,0,0,0,'2019-10-17 15:50:25',1,'plugins.pubIds','urn','URNPubIdPlugin',1,0),(1,0,0,0,'2019-10-17 15:50:25',1,'plugins.pubIds','doi','DOIPubIdPlugin',1,0),(1,0,0,0,'2019-10-17 15:50:25',1,'plugins.reports','articles','',0,0),(1,1,0,0,'2019-10-17 15:50:25',1,'plugins.reports','counterReport','',0,0),(2,0,0,0,'2019-10-17 15:50:25',1,'plugins.reports','reviewReport','',0,0),(1,0,0,0,'2019-10-17 15:50:25',1,'plugins.reports','views','',0,0),(1,0,0,0,'2019-10-17 15:50:25',1,'plugins.themes','default','DefaultThemePlugin',1,0),(3,1,2,1,'2019-10-17 15:50:17',1,'core','ojs2','',0,1);
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

-- Dump completed on 2019-10-29 17:46:43
