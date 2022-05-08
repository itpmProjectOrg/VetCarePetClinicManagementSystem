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
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ownerID` int DEFAULT NULL,
  `aDate` date NOT NULL,
  `aTime` time NOT NULL,
  `payment` double DEFAULT NULL,
  `paymentStatus` varchar(30) DEFAULT NULL,
  `appointmentNo` int NOT NULL,
  `veterinarian` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ownerID_1` (`ownerID`),
  KEY `fk_veterinarian_2` (`veterinarian`),
  CONSTRAINT `fk_ownerID_1` FOREIGN KEY (`ownerID`) REFERENCES `petowner` (`ownerID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_veterinarian_2` FOREIGN KEY (`veterinarian`) REFERENCES `veterinarian` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
INSERT INTO `appointment` VALUES (3,2,'2022-03-12','18:00:00',0,'pending',1,'Kasun Ekanayak'),(4,3,'2022-03-12','18:15:00',0,'pending',2,'Kasun Ekanayak'),(5,5,'2022-02-17','17:45:00',1200,'completed',3,'Indika Herath'),(6,1,'2022-03-07','06:30:00',1200,'completed',4,'Amal Karunayak'),(7,2,'2022-03-07','06:35:00',1500,'completed',5,'Amal Karunayak'),(8,1,'2022-03-17','18:30:00',500,'completed',1,'Indika Herath'),(9,2,'2022-02-17','18:30:00',0,'pending',4,'Indika Herath'),(10,1,'2022-03-12','18:25:00',0,'pending',3,'Kasun Ekanayak'),(18,1,'2022-03-17','18:45:00',0,'pending',2,'Indika Herath'),(21,5,'2022-03-07','07:00:00',1200,'completed',6,'Amal Karunayak'),(25,1,'2022-03-12','18:30:00',1800,'completed',4,'Kasun Ekanayak'),(73,3,'2022-03-07','07:05:00',1200,'completed',7,'Amal Karunayak'),(75,4,'2022-03-07','07:10:00',1200,'completed',8,'Amal Karunayak');
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-08 16:33:19
