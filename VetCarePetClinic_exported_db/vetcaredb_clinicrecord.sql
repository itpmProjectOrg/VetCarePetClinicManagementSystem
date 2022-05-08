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
-- Table structure for table `clinicrecord`
--

DROP TABLE IF EXISTS `clinicrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clinicrecord` (
  `CR_ID` int DEFAULT NULL,
  `DFE` date DEFAULT NULL,
  `duration` varchar(20) DEFAULT NULL,
  `diagnosis` varchar(10) DEFAULT NULL,
  `investiagtion_performed` varchar(20) DEFAULT NULL,
  `speciality_referral` varchar(20) DEFAULT NULL,
  `allergies` varchar(10) DEFAULT NULL,
  `petID` int DEFAULT NULL,
  `veterinarian` varchar(70) DEFAULT NULL,
  KEY `fk_petID1` (`petID`),
  KEY `fk_veterinarian_4` (`veterinarian`),
  CONSTRAINT `fk_petID1` FOREIGN KEY (`petID`) REFERENCES `pet` (`petID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_veterinarian_4` FOREIGN KEY (`veterinarian`) REFERENCES `veterinarian` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clinicrecord`
--

LOCK TABLES `clinicrecord` WRITE;
/*!40000 ALTER TABLE `clinicrecord` DISABLE KEYS */;
INSERT INTO `clinicrecord` VALUES (1,'2022-03-08','6 month','oral exam','x-ray','none','none',4,'Amal Karunayak'),(1,'2022-03-08','6 month','oral exam','x-ray','none','none',4,'Amal Karunayak'),(2,'2022-03-22','1 week','health-ck','blood-test','none','none',2,'Indika Herath'),(3,'2022-03-14','1 week','health-ck','blood-test','none','none',1,'Indika Herath'),(4,'2022-03-07','1 month','antibiotic','none','none','none',3,'Kasun Ekanayak');
/*!40000 ALTER TABLE `clinicrecord` ENABLE KEYS */;
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
