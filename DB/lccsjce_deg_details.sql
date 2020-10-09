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
-- Table structure for table `deg_details`
--

DROP TABLE IF EXISTS `deg_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deg_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `stu_admissionnumber` varchar(45) DEFAULT NULL,
  `deg_degree` varchar(45) DEFAULT NULL,
  `deg_wise` varchar(45) DEFAULT NULL,
  `deg_terms` varchar(45) DEFAULT NULL,
  `deg_resulttype` varchar(45) DEFAULT NULL,
  `deg_obtainedmarks` varchar(45) DEFAULT NULL,
  `deg_totalmarks` varchar(45) DEFAULT NULL,
  `deg_overallpercentage` varchar(45) DEFAULT NULL,
  `deg_obtainedgrade` varchar(45) DEFAULT NULL,
  `deg_totalgrade` varchar(45) DEFAULT NULL,
  `deg_obtainedcgpa` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `for_degree_idx` (`stu_admissionnumber`),
  CONSTRAINT `for_degree` FOREIGN KEY (`stu_admissionnumber`) REFERENCES `student_details` (`stu_admissionnumber`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=545 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deg_details`
--

LOCK TABLES `deg_details` WRITE;
/*!40000 ALTER TABLE `deg_details` DISABLE KEYS */;
INSERT INTO `deg_details` VALUES (240,'5301','x','','','marks','','','','A','A',''),(241,'5301','puc','','overall','marks','','','',NULL,NULL,NULL),(242,'5301','puc','','physics','marks','','',NULL,NULL,NULL,NULL),(243,'5301','puc','','chemistry','marks','','',NULL,NULL,NULL,NULL),(244,'5301','puc','','mathematics','marks','','',NULL,NULL,NULL,NULL),(245,'5301','puc','','bussiness','marks','','',NULL,NULL,NULL,NULL),(246,'5301','puc','','philosophy','marks','','',NULL,NULL,NULL,NULL),(432,'51','x','','','marks','','','','A','A',''),(433,'51','puc','','overall','marks','','','',NULL,NULL,NULL),(434,'51','puc','','physics','marks','','',NULL,NULL,NULL,NULL),(435,'51','puc','','chemistry','marks','','',NULL,NULL,NULL,NULL),(436,'51','puc','','mathematics','marks','','',NULL,NULL,NULL,NULL),(437,'51','puc','','bussiness','marks','','',NULL,NULL,NULL,NULL),(438,'51','puc','','philosophy','marks','','',NULL,NULL,NULL,NULL),(439,'51','ug','','overall','marks','','','','A','A',''),(440,'123','x','','','marks','','','','A','A',''),(441,'123','puc','','overall','marks','','','',NULL,NULL,NULL),(442,'123','puc','','physics','marks','','',NULL,NULL,NULL,NULL),(443,'123','puc','','chemistry','marks','','',NULL,NULL,NULL,NULL),(444,'123','puc','','mathematics','marks','','',NULL,NULL,NULL,NULL),(445,'123','puc','','bussiness','marks','','',NULL,NULL,NULL,NULL),(446,'123','puc','','philosophy','marks','','',NULL,NULL,NULL,NULL),(447,'1234','x','','','marks','','','','A','A',''),(448,'1234','puc','','overall','marks','','','',NULL,NULL,NULL),(449,'1234','puc','','physics','marks','','',NULL,NULL,NULL,NULL),(450,'1234','puc','','chemistry','marks','','',NULL,NULL,NULL,NULL),(451,'1234','puc','','mathematics','marks','','',NULL,NULL,NULL,NULL),(452,'1234','puc','','bussiness','marks','','',NULL,NULL,NULL,NULL),(453,'1234','puc','','philosophy','marks','','',NULL,NULL,NULL,NULL),(454,'1','x','','','marks','','','','A','A',''),(455,'1','puc','','overall','marks','','','',NULL,NULL,NULL),(456,'1','puc','','physics','marks','','',NULL,NULL,NULL,NULL),(457,'1','puc','','chemistry','marks','','',NULL,NULL,NULL,NULL),(458,'1','puc','','mathematics','marks','','',NULL,NULL,NULL,NULL),(459,'1','puc','','bussiness','marks','','',NULL,NULL,NULL,NULL),(460,'1','puc','','philosophy','marks','','',NULL,NULL,NULL,NULL),(461,'12345678','x','','','marks','','','','A','A',''),(462,'12345678','puc','','overall','marks','','','',NULL,NULL,NULL),(463,'12345678','puc','','physics','marks','','',NULL,NULL,NULL,NULL),(464,'12345678','puc','','chemistry','marks','','',NULL,NULL,NULL,NULL),(465,'12345678','puc','','mathematics','marks','','',NULL,NULL,NULL,NULL),(466,'12345678','puc','','bussiness','marks','','',NULL,NULL,NULL,NULL),(467,'12345678','puc','','philosophy','marks','','',NULL,NULL,NULL,NULL),(468,'12345678','ug','','overall','marks','','','','A','A',''),(469,'12345678','pg','','overall','marks','','','','A','A',''),(478,'555','x','','','marks','','','','A','A',''),(479,'555','puc','','overall','marks','','','',NULL,NULL,NULL),(480,'555','puc','','physics','marks','','',NULL,NULL,NULL,NULL),(481,'555','puc','','chemistry','marks','','',NULL,NULL,NULL,NULL),(482,'555','puc','','mathematics','marks','','',NULL,NULL,NULL,NULL),(483,'555','puc','','bussiness','marks','','',NULL,NULL,NULL,NULL),(484,'555','puc','','philosophy','marks','','',NULL,NULL,NULL,NULL),(485,'555','ug','','overall','marks','','','','A','A',''),(486,'666','x','','','marks','','','','A','A',''),(487,'666','puc','','overall','marks','','','',NULL,NULL,NULL),(488,'666','puc','','physics','marks','','',NULL,NULL,NULL,NULL),(489,'666','puc','','chemistry','marks','','',NULL,NULL,NULL,NULL),(490,'666','puc','','mathematics','marks','','',NULL,NULL,NULL,NULL),(491,'666','puc','','bussiness','marks','','',NULL,NULL,NULL,NULL),(492,'666','puc','','philosophy','marks','','',NULL,NULL,NULL,NULL),(493,'666','ug','','overall','marks','','','','A','A',''),(494,'777','x','','','marks','','','','A','A',''),(495,'777','puc','','overall','marks','','','',NULL,NULL,NULL),(496,'777','puc','','physics','marks','','',NULL,NULL,NULL,NULL),(497,'777','puc','','chemistry','marks','','',NULL,NULL,NULL,NULL),(498,'777','puc','','mathematics','marks','','',NULL,NULL,NULL,NULL),(499,'777','puc','','bussiness','marks','','',NULL,NULL,NULL,NULL),(500,'777','puc','','philosophy','marks','','',NULL,NULL,NULL,NULL),(501,'777','ug','','overall','marks','','','','A','A',''),(502,'999','x','','','marks','','','','A','A',''),(503,'999','puc','','overall','marks','','','',NULL,NULL,NULL),(504,'999','puc','','physics','marks','','',NULL,NULL,NULL,NULL),(505,'999','puc','','chemistry','marks','','',NULL,NULL,NULL,NULL),(506,'999','puc','','mathematics','marks','','',NULL,NULL,NULL,NULL),(507,'999','puc','','bussiness','marks','','',NULL,NULL,NULL,NULL),(508,'999','puc','','philosophy','marks','','',NULL,NULL,NULL,NULL),(509,'999','ug','','overall','marks','','','','A','A',''),(510,'650','x','','','marks','','','','A','A',''),(511,'650','puc','','overall','marks','','','',NULL,NULL,NULL),(512,'650','puc','','physics','marks','','',NULL,NULL,NULL,NULL),(513,'650','puc','','chemistry','marks','','',NULL,NULL,NULL,NULL),(514,'650','puc','','mathematics','marks','','',NULL,NULL,NULL,NULL),(515,'650','puc','','bussiness','marks','','',NULL,NULL,NULL,NULL),(516,'650','puc','','philosophy','marks','','',NULL,NULL,NULL,NULL),(517,'600','x','','','marks','','','','A','A',''),(518,'600','puc','','overall','marks','','','',NULL,NULL,NULL),(519,'600','puc','','physics','marks','','',NULL,NULL,NULL,NULL),(520,'600','puc','','chemistry','marks','','',NULL,NULL,NULL,NULL),(521,'600','puc','','mathematics','marks','','',NULL,NULL,NULL,NULL),(522,'600','puc','','bussiness','marks','','',NULL,NULL,NULL,NULL),(523,'600','puc','','philosophy','marks','','',NULL,NULL,NULL,NULL),(524,'500','x','','','marks','','','','A','A',''),(525,'500','puc','','overall','marks','','','',NULL,NULL,NULL),(526,'500','puc','','physics','marks','','',NULL,NULL,NULL,NULL),(527,'500','puc','','chemistry','marks','','',NULL,NULL,NULL,NULL),(528,'500','puc','','mathematics','marks','','',NULL,NULL,NULL,NULL),(529,'500','puc','','bussiness','marks','','',NULL,NULL,NULL,NULL),(530,'500','puc','','philosophy','marks','','',NULL,NULL,NULL,NULL),(538,'1234567890','x','','','marks','','','','A','A',''),(539,'1234567890','puc','','overall','marks','','','',NULL,NULL,NULL),(540,'1234567890','puc','','physics','marks','','',NULL,NULL,NULL,NULL),(541,'1234567890','puc','','chemistry','marks','','',NULL,NULL,NULL,NULL),(542,'1234567890','puc','','mathematics','marks','','',NULL,NULL,NULL,NULL),(543,'1234567890','puc','','bussiness','marks','','',NULL,NULL,NULL,NULL),(544,'1234567890','puc','','philosophy','marks','','',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `deg_details` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-09 17:28:26
