-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: lccsjce
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
-- Table structure for table `admission_details`
--

DROP TABLE IF EXISTS `admission_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admission_details` (
  `ad_degree` varchar(45) DEFAULT NULL,
  `ad_department` varchar(45) DEFAULT NULL,
  `ad_mode` varchar(45) DEFAULT NULL,
  `ad_category` varchar(45) DEFAULT NULL,
  `ad_special` varchar(45) DEFAULT NULL,
  `ad_year` varchar(45) DEFAULT NULL,
  `ad_basiccategory` varchar(45) DEFAULT NULL,
  `ad_lateral` varchar(45) DEFAULT NULL,
  `ad_joiningyear` varchar(45) DEFAULT NULL,
  `ad_degreeyear` varchar(45) DEFAULT NULL,
  `ad_termnumber` varchar(45) DEFAULT NULL,
  `ad_usn` varchar(45) DEFAULT NULL,
  `ad_section` varchar(45) DEFAULT NULL,
  `ad_status` varchar(45) DEFAULT NULL,
  `ad_batch` varchar(45) DEFAULT NULL,
  `ad_scheme` varchar(45) DEFAULT NULL,
  `ad_transportation` varchar(45) DEFAULT NULL,
  `ad_hostel` varchar(45) DEFAULT NULL,
  `ad_locker` varchar(45) DEFAULT NULL,
  `ad_specialization` varchar(45) DEFAULT NULL,
  `ad_firstlanuage` varchar(45) DEFAULT NULL,
  `ad_admissiondate` varchar(45) DEFAULT NULL,
  `ad_admissionnumber` varchar(45) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`email`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admission_details`
--

LOCK TABLES `admission_details` WRITE;
/*!40000 ALTER TABLE `admission_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `admission_details` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-09 17:28:25
