-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: planner
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `restrnt`
--

DROP TABLE IF EXISTS `restrnt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restrnt` (
  `in_no` int NOT NULL,
  `city_no` varchar(3) COLLATE utf8mb3_bin NOT NULL,
  `rest_addr` varchar(30) COLLATE utf8mb3_bin NOT NULL,
  `rest_name` varchar(30) COLLATE utf8mb3_bin NOT NULL,
  `rest_ename` varchar(30) COLLATE utf8mb3_bin NOT NULL,
  `rest_title` varchar(255) COLLATE utf8mb3_bin NOT NULL,
  `rest_detail` text COLLATE utf8mb3_bin,
  `rest_open` int NOT NULL,
  `rest_close` int NOT NULL,
  `rest_table` int NOT NULL,
  PRIMARY KEY (`in_no`),
  KEY `rest_city_no` (`city_no`),
  CONSTRAINT `rest_city_no` FOREIGN KEY (`city_no`) REFERENCES `city` (`city_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restrnt`
--

LOCK TABLES `restrnt` WRITE;
/*!40000 ALTER TABLE `restrnt` DISABLE KEYS */;
/*!40000 ALTER TABLE `restrnt` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-26 10:15:51
