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
-- Table structure for table `local_address`
--

DROP TABLE IF EXISTS `local_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `local_address` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `stu_admissionnumber` varchar(45) DEFAULT NULL,
  `la_house` varchar(45) DEFAULT NULL,
  `la_area` varchar(45) DEFAULT NULL,
  `la_country` varchar(45) DEFAULT NULL,
  `la_state` varchar(45) DEFAULT NULL,
  `la_city` varchar(45) DEFAULT NULL,
  `la_post` varchar(45) DEFAULT NULL,
  `la_pincode` varchar(45) DEFAULT NULL,
  `la_taluk` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `stu_admissionnumber_UNIQUE` (`stu_admissionnumber`),
  CONSTRAINT `for_local` FOREIGN KEY (`stu_admissionnumber`) REFERENCES `student_details` (`stu_admissionnumber`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `local_address`
--

LOCK TABLES `local_address` WRITE;
/*!40000 ALTER TABLE `local_address` DISABLE KEYS */;
INSERT INTO `local_address` VALUES (35,'5301','','','India','Andaman and Nicobar Islands','','','',''),(60,'51','','','India','Andaman and Nicobar Islands','','','',''),(61,'123','','','India','Andaman and Nicobar Islands','','','',''),(62,'1234','','','India','Andaman and Nicobar Islands','','','',''),(63,'1','','','India','Andaman and Nicobar Islands','','','',''),(64,'12345678','','','India','Andaman and Nicobar Islands','','','',''),(66,'555','','','India','Andaman and Nicobar Islands','','','',''),(67,'666','','','India','Andaman and Nicobar Islands','','','',''),(68,'777','','','India','Andaman and Nicobar Islands','','','',''),(69,'999','','','India','Andaman and Nicobar Islands','','','',''),(70,'650','','','India','Andaman and Nicobar Islands','','','',''),(71,'600','','','India','Andaman and Nicobar Islands','','','',''),(72,'500','','','India','Andaman and Nicobar Islands','','','',''),(74,'1234567890','','','India','Andaman and Nicobar Islands','','','','');
/*!40000 ALTER TABLE `local_address` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-09 17:28:27
