-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: localhost    Database: vetcaredb
-- ------------------------------------------------------
-- Server version	8.0.24

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
-- Table structure for table `prescription`
--

DROP TABLE IF EXISTS `prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescription` (
  `presID` int NOT NULL AUTO_INCREMENT,
  `pallor` varchar(5) DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `medication` varchar(100) DEFAULT NULL,
  `othersign` varchar(50) DEFAULT NULL,
  `symptoms` varchar(50) DEFAULT NULL,
  `last_date` date DEFAULT NULL,
  `petID` int DEFAULT NULL,
  `veterinarian` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`presID`),
  KEY `fk_petID` (`petID`),
  KEY `fk_veterinarian_3` (`veterinarian`),
  CONSTRAINT `fk_petID` FOREIGN KEY (`petID`) REFERENCES `pet` (`petID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_veterinarian_3` FOREIGN KEY (`veterinarian`) REFERENCES `veterinarian` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescription`
--

LOCK TABLES `prescription` WRITE;
/*!40000 ALTER TABLE `prescription` DISABLE KEYS */;
INSERT INTO `prescription` VALUES (1,'yes',30,'Clavulanate','','diarrhea , vomiting','2022-03-14',1,'Indika Herath'),(2,'no',8,'Amoxicillin','no other sign','indigestion and lack of appetite','2022-03-20',2,'Indika Herath'),(3,'no',25,'Miconazole','no other sign','intense itchiness, flaky or crusty skin','2022-03-07',3,'Kasun Ekanayak'),(4,'no',36,'oral health assessment and treatment','excessive drooling','chewing more slowly than usual.','2022-03-07',4,'Amal Karunayak');
/*!40000 ALTER TABLE `prescription` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-08 16:33:18
