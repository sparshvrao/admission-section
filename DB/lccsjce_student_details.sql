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
-- Table structure for table `student_details`
--

DROP TABLE IF EXISTS `student_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_details` (
  `stu_id` int unsigned NOT NULL AUTO_INCREMENT,
  `stu_name` varchar(45) DEFAULT NULL,
  `stu_dob` varchar(45) DEFAULT NULL,
  `stu_gender` varchar(45) DEFAULT NULL,
  `stu_bloodgroup` varchar(45) DEFAULT NULL,
  `stu_landline` varchar(45) DEFAULT NULL,
  `stu_mobile` varchar(45) DEFAULT NULL,
  `stu_email` varchar(45) DEFAULT NULL,
  `stu_pan` varchar(45) DEFAULT NULL,
  `stu_aadhar` varchar(45) DEFAULT NULL,
  `stu_driving` varchar(45) DEFAULT NULL,
  `stu_passport` varchar(45) DEFAULT NULL,
  `stu_country` varchar(45) DEFAULT NULL,
  `stu_mothertongue` varchar(45) DEFAULT NULL,
  `stu_religion` varchar(45) DEFAULT NULL,
  `stu_caste` varchar(45) DEFAULT NULL,
  `stu_idmark` varchar(45) DEFAULT NULL,
  `stu_diffable` varchar(45) DEFAULT NULL,
  `stu_birthcountry` varchar(45) DEFAULT NULL,
  `stu_birthstate` varchar(45) DEFAULT NULL,
  `stu_birthplace` varchar(45) DEFAULT NULL,
  `stu_fathertitle` varchar(45) DEFAULT NULL,
  `stu_fathername` varchar(45) DEFAULT NULL,
  `stu_fatheroccupation` varchar(45) DEFAULT NULL,
  `stu_fatheremail` varchar(45) DEFAULT NULL,
  `stu_fathermobile` varchar(45) DEFAULT NULL,
  `stu_fatherincome` varchar(45) DEFAULT NULL,
  `stu_mothertitle` varchar(45) DEFAULT NULL,
  `stu_mothername` varchar(45) DEFAULT NULL,
  `stu_motheroccupation` varchar(45) DEFAULT NULL,
  `stu_mothermobile` varchar(45) DEFAULT NULL,
  `stu_motheremail` varchar(45) DEFAULT NULL,
  `stu_motherincome` varchar(45) DEFAULT NULL,
  `stu_guardian` varchar(45) DEFAULT NULL,
  `stu_degree` varchar(45) DEFAULT NULL,
  `stu_department` varchar(45) DEFAULT NULL,
  `stu_modeofadmission` varchar(45) DEFAULT NULL,
  `stu_admissioncategory` varchar(45) DEFAULT NULL,
  `stu_specialcategory` varchar(45) DEFAULT NULL,
  `stu_academicyear` varchar(45) DEFAULT NULL,
  `stu_basiccategory` varchar(45) DEFAULT NULL,
  `stu_lateral` varchar(45) DEFAULT NULL,
  `stu_joiningyear` varchar(45) DEFAULT NULL,
  `stu_degreeyear` varchar(45) DEFAULT NULL,
  `stu_termnumber` varchar(45) DEFAULT NULL,
  `stu_usn` varchar(45) DEFAULT NULL,
  `stu_status` varchar(45) DEFAULT NULL,
  `stu_batch` varchar(45) DEFAULT NULL,
  `stu_transportation` varchar(45) DEFAULT NULL,
  `stu_locker` varchar(45) DEFAULT NULL,
  `stu_admissiondate` varchar(45) DEFAULT NULL,
  `stu_admissionnumber` varchar(45) DEFAULT NULL,
  `stu_entrance` varchar(45) DEFAULT NULL,
  `stu_bank` varchar(45) DEFAULT NULL,
  `stu_pa_house` varchar(45) DEFAULT NULL,
  `stu_pa_area` varchar(45) DEFAULT NULL,
  `stu_pa_country` varchar(45) DEFAULT NULL,
  `stu_pa_state` varchar(45) DEFAULT NULL,
  `stu_pa_city` varchar(45) DEFAULT NULL,
  `stu_pa_post` varchar(45) DEFAULT NULL,
  `stu_pa_pincode` varchar(45) DEFAULT NULL,
  `stu_pa_taluk` varchar(45) DEFAULT NULL,
  `stu_local` varchar(45) DEFAULT NULL,
  `stu_puord` varchar(45) DEFAULT NULL,
  `stu_pucresulttype` varchar(45) DEFAULT NULL,
  `stu_pucstream` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`stu_id`),
  UNIQUE KEY `stu_id_UNIQUE` (`stu_id`),
  UNIQUE KEY `stu_admissionnumber_UNIQUE` (`stu_admissionnumber`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_details`
--

LOCK TABLES `student_details` WRITE;
/*!40000 ALTER TABLE `student_details` DISABLE KEYS */;
INSERT INTO `student_details` VALUES (35,'sparshrao1','0455-03-24','Other','A+','','','','','','','','in','','HINDU','ACHARI','','No','India','Andaman and Nicobar Islands','AD','','','','','','','','','ada','','','dad','No','BE','ACCOUNTS','CET','GM','','2020-21','GM','No','2020-21','1','1','qwqw','REGULAR','REGULAR','No','','','5301','No','No','','','India','Andaman and Nicobar Islands','','','','','Yes','puc','marks','Science'),(60,'New user','','Male','A+','','','','','','','','in','','HINDU','ACHARI','','No','India','Andaman and Nicobar Islands','','','','','','','','','','','','','','No','MSc','ACCOUNTS','CET','GM','','2020-21','GM','No','2020-21','1','1','','REGULAR','REGULAR','No','','','51','No','No','','','India','Andaman and Nicobar Islands','','','','','Yes','puc','marks','Science'),(61,'new guy','','Male','A+','','','','','','','','in','','HINDU','ACHARI','','No','India','Andaman and Nicobar Islands','','','','','','','','','','','','','','No','BE','ACCOUNTS','CET','GM','','2020-21','GM','No','2020-21','1','1','','REGULAR','REGULAR','No','','','123','No','No','','','India','Andaman and Nicobar Islands','','','','','Yes','puc','marks','Science'),(62,'Sparsh Venkappa Rao','','Male','A+','','+917619391823','','','','','','in','','HINDU','ACHARI','','No','India','Andaman and Nicobar Islands','','','','','','','','','','','','','','No','BE','ACCOUNTS','CET','GM','','2020-21','GM','No','2020-21','1','1','','REGULAR','REGULAR','No','','','1234','No','No','','','India','Andaman and Nicobar Islands','','','','','Yes','puc','marks','Science'),(63,'Sparsh Venkappa Rao','','Male','A+','','+917619391823','','','','','','in','','HINDU','ACHARI','','No','India','Andaman and Nicobar Islands','','','','','','','','','','','','','','No','BE','ACCOUNTS','CET','GM','','2020-21','GM','No','2020-21','1','1','','REGULAR','REGULAR','No','','','1','No','No','','','India','Andaman and Nicobar Islands','','','','','Yes','puc','marks','Science'),(64,'xavier','','Male','A+','','','','','','','','in','','HINDU','ACHARI','','No','India','Andaman and Nicobar Islands','','','','','','','','','','','','','','No','PhD','ACCOUNTS','CET','GM','','2020-21','GM','No','2020-21','1','1','','REGULAR','REGULAR','No','','','12345678','No','No','','','India','Andaman and Nicobar Islands','','','','','Yes','puc','marks','Science'),(66,'mba check','','Male','A+','','','','','','','','in','','HINDU','ACHARI','','No','India','Andaman and Nicobar Islands','','','','','','','','','','','','','','No','MBA','ACCOUNTS','CET','GM','','2020-21','GM','No','2020-21','1','1','','REGULAR','REGULAR','No','','','555','No','No','','','India','Andaman and Nicobar Islands','','','','','Yes','puc','marks','Science'),(67,'mba check','','Male','A+','','','','','','','','in','','HINDU','ACHARI','','No','India','Andaman and Nicobar Islands','','','','','','','','','','','','','','No','MBA','ACCOUNTS','CET','GM','','2020-21','GM','No','2020-21','1','1','','REGULAR','REGULAR','No','','','666','No','No','','','India','Andaman and Nicobar Islands','','','','','Yes','puc','marks','Science'),(68,'mba check','','Male','A+','','','','','','','','in','','HINDU','ACHARI','','No','India','Andaman and Nicobar Islands','','','','','','','','','','','','','','No','MBA','ACCOUNTS','CET','GM','','2020-21','GM','No','2020-21','1','1','','REGULAR','REGULAR','No','','','777','No','No','','','India','Andaman and Nicobar Islands','','','','','Yes','puc','marks','Science'),(69,'mba check','','Male','A+','','','','','','','','in','','HINDU','ACHARI','','No','India','Andaman and Nicobar Islands','','','','','','','','','','','','','','No','MBA','ACCOUNTS','CET','GM','','2020-21','GM','No','2020-21','1','1','','REGULAR','REGULAR','No','','','999','No','No','','','India','Andaman and Nicobar Islands','','','','','Yes','puc','marks','Science'),(70,'Sparsh Venkappa Rao','','Male','A+','','+917619391823','','','','','','in','','HINDU','ACHARI','','No','India','Andaman and Nicobar Islands','','','','','','','','','','','','','','No','BE','ACCOUNTS','CET','GM','','2020-21','GM','No','2020-21','1','1','','REGULAR','REGULAR','No','','','650','No','No','','','India','Andaman and Nicobar Islands','','','','','Yes','puc','marks','Science'),(71,'Sparsh Venkappa Rao','','Male','A+','','+917619391823','','','','','','in','','HINDU','ACHARI','','No','India','Andaman and Nicobar Islands','','','','','','','','','','','','','','No','BE','ACCOUNTS','CET','GM','','2020-21','GM','No','2020-21','1','1','','REGULAR','REGULAR','No','','','600','No','No','','','India','Andaman and Nicobar Islands','','','','','Yes','puc','marks','Science'),(72,'Sparsh Venkappa Rao','','Male','A+','','+917619391823','','','','','','in','','HINDU','ACHARI','','No','India','Andaman and Nicobar Islands','','','','','','','','','','','','','','No','BE','ACCOUNTS','CET','GM','','2020-21','GM','No','2020-21','1','1','','REGULAR','REGULAR','No','','','500','No','No','','','India','Andaman and Nicobar Islands','','','','','Yes','puc','marks','Science'),(74,'Sparsh Venkappa Rao','','Male','A+','22','076 1939 1823','sparshrao1@gmail.com','22','','','','in','','HINDU','ACHARI','','No','India','Andaman and Nicobar Islands','','','','','','','','','','','','','','No','BE','ACCOUNTS','CET','GM','','2020-21','GM','No','2020-21','1','1','','REGULAR','REGULAR','No','','','1234567890','No','No','','','India','Andaman and Nicobar Islands','','','','','Yes','puc','marks','Science');
/*!40000 ALTER TABLE `student_details` ENABLE KEYS */;
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
