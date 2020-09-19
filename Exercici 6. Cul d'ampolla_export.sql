-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: modelatge_bbdd
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `adress`
--

DROP TABLE IF EXISTS `adress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adress` (
  `adress_id` int NOT NULL AUTO_INCREMENT,
  `street` varchar(45) COLLATE utf8_bin NOT NULL,
  `number` int NOT NULL,
  `door` varchar(3) COLLATE utf8_bin NOT NULL,
  `city` varchar(45) COLLATE utf8_bin NOT NULL,
  `postal_code` int NOT NULL,
  PRIMARY KEY (`adress_id`),
  UNIQUE KEY `Adress_id_UNIQUE` (`adress_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adress`
--

LOCK TABLES `adress` WRITE;
/*!40000 ALTER TABLE `adress` DISABLE KEYS */;
INSERT INTO `adress` VALUES (1,'Aribau',12,'2a','Barcelona',8011),(2,'Muntaner',25,'5a','Barcelona',8012);
/*!40000 ALTER TABLE `adress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brand` (
  `brand_id` int NOT NULL,
  `brand_name` varchar(45) COLLATE utf8_bin NOT NULL,
  `Supplier_supplier_id` int NOT NULL,
  PRIMARY KEY (`brand_id`),
  KEY `fk_Brand_Supplier1_idx` (`Supplier_supplier_id`),
  CONSTRAINT `fk_Brand_Supplier1` FOREIGN KEY (`Supplier_supplier_id`) REFERENCES `supplier` (`supplier_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (1,'Munich',1),(2,'Rayban',1),(3,'Dior',2);
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `clients_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_bin NOT NULL,
  `postal_adress` varchar(45) COLLATE utf8_bin NOT NULL,
  `telephone` int NOT NULL,
  `email` varchar(45) COLLATE utf8_bin NOT NULL,
  `register_date` date NOT NULL,
  `Client_clients_id` int DEFAULT NULL COMMENT 'client que li ha recomanat l''establiment',
  PRIMARY KEY (`clients_id`),
  UNIQUE KEY `clients_id_UNIQUE` (`clients_id`),
  KEY `fk_Client_Client1_idx` (`Client_clients_id`),
  CONSTRAINT `fk_Client_Client1` FOREIGN KEY (`Client_clients_id`) REFERENCES `client` (`clients_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'Pere','02145',98745632,'sdg@gmail.com','2020-02-02',NULL),(2,'Joan','25413',6541233,'sdfsdg@gmail.com','2020-03-08',1);
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glass`
--

DROP TABLE IF EXISTS `glass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glass` (
  `glass_id` int NOT NULL AUTO_INCREMENT,
  `graduation` float NOT NULL,
  `muntura` varchar(45) COLLATE utf8_bin NOT NULL,
  `color_muntura` varchar(45) COLLATE utf8_bin NOT NULL,
  `color_vidre` varchar(45) COLLATE utf8_bin NOT NULL,
  `price` int NOT NULL,
  `Brand_brand_id` int NOT NULL,
  PRIMARY KEY (`glass_id`),
  UNIQUE KEY `glasses_id_UNIQUE` (`glass_id`),
  KEY `fk_Glasses_Brand1_idx` (`Brand_brand_id`),
  CONSTRAINT `fk_Glasses_Brand1` FOREIGN KEY (`Brand_brand_id`) REFERENCES `brand` (`brand_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glass`
--

LOCK TABLES `glass` WRITE;
/*!40000 ALTER TABLE `glass` DISABLE KEYS */;
INSERT INTO `glass` VALUES (1,1.25,'flotant','verd','groc',100,1),(2,6.5,'pasta','plata','transparent',250,3);
/*!40000 ALTER TABLE `glass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `supplier_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_bin NOT NULL,
  `telephone` int NOT NULL,
  `fax` int NOT NULL,
  `NIF` varchar(15) COLLATE utf8_bin NOT NULL,
  `Adress_adress_id` int NOT NULL,
  PRIMARY KEY (`supplier_id`),
  UNIQUE KEY `supplier_id_UNIQUE` (`supplier_id`),
  KEY `fk_Supplier_Adress1_idx` (`Adress_adress_id`),
  CONSTRAINT `fk_Supplier_Adress1` FOREIGN KEY (`Adress_adress_id`) REFERENCES `adress` (`adress_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,'Ulleres PEre',547896321,32165489,'safsdfsd5',1),(2,'Gafas PEPE',56432189,164891,'dsgdsg5',2);
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction` (
  `transaction_id` int unsigned NOT NULL AUTO_INCREMENT,
  `Clients_clients_id` int NOT NULL,
  `Worker_worker_id` int NOT NULL,
  `Glass_glass_id` int NOT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `fk_Venta_Clients1_idx` (`Clients_clients_id`),
  KEY `fk_Venta_Worker1_idx` (`Worker_worker_id`),
  KEY `fk_Transaction_Glass1_idx` (`Glass_glass_id`),
  CONSTRAINT `fk_Transaction_Glass1` FOREIGN KEY (`Glass_glass_id`) REFERENCES `glass` (`glass_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Venta_Clients1` FOREIGN KEY (`Clients_clients_id`) REFERENCES `client` (`clients_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Venta_Worker1` FOREIGN KEY (`Worker_worker_id`) REFERENCES `worker` (`worker_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES (1,1,2,2),(2,2,1,1);
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `worker`
--

DROP TABLE IF EXISTS `worker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `worker` (
  `worker_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`worker_id`),
  UNIQUE KEY `worker_id_UNIQUE` (`worker_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worker`
--

LOCK TABLES `worker` WRITE;
/*!40000 ALTER TABLE `worker` DISABLE KEYS */;
INSERT INTO `worker` VALUES (1,'Marc'),(2,'Toni');
/*!40000 ALTER TABLE `worker` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-19 15:56:08
