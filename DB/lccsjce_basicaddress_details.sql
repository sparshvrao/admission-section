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
-- Table structure for table `basicaddress_details`
--

DROP TABLE IF EXISTS `basicaddress_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `basicaddress_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `stu_admissionnumber` varchar(45) DEFAULT NULL,
  `ad_degree` varchar(45) DEFAULT NULL,
  `ad_institution` varchar(45) DEFAULT NULL,
  `ad_board` varchar(70) DEFAULT NULL,
  `ad_passingyear` varchar(45) DEFAULT NULL,
  `ad_passingmonth` varchar(45) DEFAULT NULL,
  `ad_registernumber` varchar(45) DEFAULT NULL,
  `ad_medium` varchar(45) DEFAULT NULL,
  `ad_area` varchar(45) DEFAULT NULL,
  `ad_country` varchar(45) DEFAULT NULL,
  `ad_state` varchar(45) DEFAULT NULL,
  `ad_post` varchar(45) DEFAULT NULL,
  `ad_pincode` varchar(45) DEFAULT NULL,
  `ad_city` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `for_addresses_idx` (`stu_admissionnumber`),
  CONSTRAINT `for_addresses` FOREIGN KEY (`stu_admissionnumber`) REFERENCES `student_details` (`stu_admissionnumber`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=180 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basicaddress_details`
--

LOCK TABLES `basicaddress_details` WRITE;
/*!40000 ALTER TABLE `basicaddress_details` DISABLE KEYS */;
INSERT INTO `basicaddress_details` VALUES (75,'5301','x','','Andhra Pradesh Board of Intermediate Education','1950','JANUARY','','','','India','Andaman and Nicobar Islands','','',''),(76,'5301','puc','','Andhra Pradesh Board of Intermediate Education','1950','JANUARY','','ENGLISH','','India','Andaman and Nicobar Islands','','',''),(142,'51','x','','Andhra Pradesh Board of Intermediate Education','1950','JANUARY','','','','India','Andaman and Nicobar Islands','','',''),(143,'51','puc','','Andhra Pradesh Board of Intermediate Education','1950','JANUARY','','ENGLISH','','India','Andaman and Nicobar Islands','','',''),(144,'51','ug','','Andhra Pradesh Board of Intermediate Education','1950','JANUARY','','ENGLISH','','India','Andaman and Nicobar Islands','','',''),(145,'123','x','','Andhra Pradesh Board of Intermediate Education','1950','JANUARY','','','','India','Andaman and Nicobar Islands','','',''),(146,'123','puc','','Andhra Pradesh Board of Intermediate Education','1950','JANUARY','','ENGLISH','','India','Andaman and Nicobar Islands','','',''),(147,'1234','x','','Andhra Pradesh Board of Intermediate Education','1950','JANUARY','','','','India','Andaman and Nicobar Islands','','',''),(148,'1234','puc','','Andhra Pradesh Board of Intermediate Education','1950','JANUARY','','ENGLISH','','India','Andaman and Nicobar Islands','','',''),(149,'1','x','','Andhra Pradesh Board of Intermediate Education','1950','JANUARY','','','','India','Andaman and Nicobar Islands','','',''),(150,'1','puc','','Andhra Pradesh Board of Intermediate Education','1950','JANUARY','','ENGLISH','','India','Andaman and Nicobar Islands','','',''),(151,'12345678','x','','Andhra Pradesh Board of Intermediate Education','1950','JANUARY','','','','India','Andaman and Nicobar Islands','','',''),(152,'12345678','puc','','Andhra Pradesh Board of Intermediate Education','1950','JANUARY','','ENGLISH','','India','Andaman and Nicobar Islands','','',''),(153,'12345678','ug','','Andhra Pradesh Board of Intermediate Education','1950','JANUARY','','ENGLISH','','India','Andaman and Nicobar Islands','','',''),(154,'12345678','pg','','Andhra Pradesh Board of Intermediate Education','1950','JANUARY','','ENGLISH','','India','Andaman and Nicobar Islands','','',''),(158,'555','x','','Andhra Pradesh Board of Intermediate Education','1950','JANUARY','','','','India','Andaman and Nicobar Islands','','',''),(159,'555','puc','','Andhra Pradesh Board of Intermediate Education','1950','JANUARY','','ENGLISH','','India','Andaman and Nicobar Islands','','',''),(160,'555','ug','','Andhra Pradesh Board of Intermediate Education','1950','JANUARY','','ENGLISH','','India','Andaman and Nicobar Islands','','',''),(161,'666','x','','Andhra Pradesh Board of Intermediate Education','1950','JANUARY','','','','India','Andaman and Nicobar Islands','','',''),(162,'666','puc','','Andhra Pradesh Board of Intermediate Education','1950','JANUARY','','ENGLISH','','India','Andaman and Nicobar Islands','','',''),(163,'666','ug','','Andhra Pradesh Board of Intermediate Education','1950','JANUARY','','ENGLISH','','India','Andaman and Nicobar Islands','','',''),(164,'777','x','','Andhra Pradesh Board of Intermediate Education','1950','JANUARY','','','','India','Andaman and Nicobar Islands','','',''),(165,'777','puc','','Andhra Pradesh Board of Intermediate Education','1950','JANUARY','','ENGLISH','','India','Andaman and Nicobar Islands','','',''),(166,'777','ug','','Andhra Pradesh Board of Intermediate Education','1950','JANUARY','','ENGLISH','','India','Andaman and Nicobar Islands','','',''),(167,'999','x','','Andhra Pradesh Board of Intermediate Education','1950','JANUARY','','','','India','Andaman and Nicobar Islands','','',''),(168,'999','puc','','Andhra Pradesh Board of Intermediate Education','1950','JANUARY','','ENGLISH','','India','Andaman and Nicobar Islands','','',''),(169,'999','ug','','Andhra Pradesh Board of Intermediate Education','1950','JANUARY','','ENGLISH','','India','Andaman and Nicobar Islands','','',''),(170,'650','x','','Andhra Pradesh Board of Intermediate Education','1950','JANUARY','','','','India','Andaman and Nicobar Islands','','',''),(171,'650','puc','','Andhra Pradesh Board of Intermediate Education','1950','JANUARY','','ENGLISH','','India','Andaman and Nicobar Islands','','',''),(172,'600','x','','Andhra Pradesh Board of Intermediate Education','1950','JANUARY','','','','India','Andaman and Nicobar Islands','','',''),(173,'600','puc','','Andhra Pradesh Board of Intermediate Education','1950','JANUARY','','ENGLISH','','India','Andaman and Nicobar Islands','','',''),(174,'500','x','','Andhra Pradesh Board of Intermediate Education','1950','JANUARY','','','','India','Andaman and Nicobar Islands','','',''),(175,'500','puc','','Andhra Pradesh Board of Intermediate Education','1950','JANUARY','','ENGLISH','','India','Andaman and Nicobar Islands','','',''),(178,'1234567890','x','','Andhra Pradesh Board of Intermediate Education','1950','JANUARY','','','','India','Andaman and Nicobar Islands','','',''),(179,'1234567890','puc','','Andhra Pradesh Board of Intermediate Education','1950','JANUARY','','ENGLISH','','India','Andaman and Nicobar Islands','','','');
/*!40000 ALTER TABLE `basicaddress_details` ENABLE KEYS */;
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
