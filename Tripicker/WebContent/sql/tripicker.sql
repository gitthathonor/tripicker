-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: tripicker
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `area`
--

DROP TABLE IF EXISTS `area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `area` (
  `areaCode` int NOT NULL,
  `cat1` int NOT NULL,
  `cat2` int NOT NULL,
  `cat3` int NOT NULL,
  `areaName` varchar(100) NOT NULL,
  `contentID` int NOT NULL,
  `contentType` int NOT NULL,
  `tel` varchar(50) DEFAULT NULL,
  `addr1` varchar(150) DEFAULT NULL,
  `addr2` varchar(200) DEFAULT NULL,
  `overview` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`areaCode`),
  UNIQUE KEY `contentID_UNIQUE` (`contentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area`
--

LOCK TABLES `area` WRITE;
/*!40000 ALTER TABLE `area` DISABLE KEYS */;
/*!40000 ALTER TABLE `area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board` (
  `boardNum` int NOT NULL AUTO_INCREMENT,
  `boardPass` varchar(45) NOT NULL,
  `nickname` varchar(50) NOT NULL,
  `boardTitle` varchar(80) DEFAULT NULL,
  `boardContent` varchar(2000) DEFAULT NULL,
  `boardFile` varchar(120) DEFAULT NULL,
  `tag` varchar(500) DEFAULT NULL,
  `likeCount` int DEFAULT '0',
  `readCount` int DEFAULT '0',
  `bReg_date` date DEFAULT NULL,
  PRIMARY KEY (`boardNum`),
  KEY `nickname_idx` (`nickname`),
  CONSTRAINT `b_nickname_fk` FOREIGN KEY (`nickname`) REFERENCES `user` (`nickname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `cityCode` int NOT NULL,
  `cityName` varchar(50) DEFAULT NULL,
  `cityEngName` varchar(50) DEFAULT NULL,
  `cityInfo` varchar(1000) DEFAULT NULL,
  `cityImgUrl` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`cityCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `commentNum` int NOT NULL,
  `id` varchar(50) NOT NULL,
  `boardNum` int NOT NULL,
  `comment` varchar(1000) NOT NULL,
  PRIMARY KEY (`commentNum`),
  KEY `c_id_fk_idx` (`id`),
  KEY `c_boardNum_fk_idx` (`boardNum`),
  CONSTRAINT `c_boardNum_fk` FOREIGN KEY (`boardNum`) REFERENCES `board` (`boardNum`),
  CONSTRAINT `c_id_fk` FOREIGN KEY (`id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notice` (
  `nNum` int NOT NULL AUTO_INCREMENT,
  `nTitle` varchar(80) NOT NULL,
  `nContent` varchar(1000) NOT NULL,
  `nReadCount` int DEFAULT NULL,
  `nReg_date` date DEFAULT NULL,
  PRIMARY KEY (`nNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice`
--

LOCK TABLES `notice` WRITE;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plan`
--

DROP TABLE IF EXISTS `plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plan` (
  `planNum` int NOT NULL,
  `id` varchar(50) NOT NULL,
  `startDate` date NOT NULL,
  `lastDate` date NOT NULL,
  `period` varchar(20) DEFAULT NULL,
  `pCityName` varchar(50) DEFAULT NULL,
  `pSpotName` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`planNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan`
--

LOCK TABLES `plan` WRITE;
/*!40000 ALTER TABLE `plan` DISABLE KEYS */;
/*!40000 ALTER TABLE `plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qnaboard`
--

DROP TABLE IF EXISTS `qnaboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qnaboard` (
  `qNum` int NOT NULL AUTO_INCREMENT,
  `qTitle` varchar(80) NOT NULL,
  `nickname` varchar(50) NOT NULL,
  `qPass` varchar(50) NOT NULL,
  `qContent` varchar(1000) DEFAULT NULL,
  `qReadCount` int DEFAULT NULL,
  `qRef` int DEFAULT NULL,
  `qLev` int DEFAULT NULL,
  `qSeq` int DEFAULT NULL,
  `qReg_date` date DEFAULT NULL,
  PRIMARY KEY (`qNum`),
  KEY `nickname_idx` (`nickname`),
  CONSTRAINT `q_nickname_fk` FOREIGN KEY (`nickname`) REFERENCES `user` (`nickname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qnaboard`
--

LOCK TABLES `qnaboard` WRITE;
/*!40000 ALTER TABLE `qnaboard` DISABLE KEYS */;
/*!40000 ALTER TABLE `qnaboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rank`
--

DROP TABLE IF EXISTS `rank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rank` (
  `rankNum` int NOT NULL,
  `rankName` varchar(50) NOT NULL,
  `rankInfo` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`rankNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rank`
--

LOCK TABLES `rank` WRITE;
/*!40000 ALTER TABLE `rank` DISABLE KEYS */;
/*!40000 ALTER TABLE `rank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subplan`
--

DROP TABLE IF EXISTS `subplan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subplan` (
  `planNum` int DEFAULT NULL,
  `id` varchar(50) DEFAULT NULL,
  `tripDate` varchar(50) DEFAULT NULL,
  `tripNum` int DEFAULT NULL,
  `tripPlace` varchar(100) DEFAULT NULL,
  KEY `sub_planNum_fk_idx` (`planNum`),
  KEY `sub_id_fk_idx` (`id`),
  CONSTRAINT `sub_id_fk` FOREIGN KEY (`id`) REFERENCES `user` (`id`),
  CONSTRAINT `sub_planNum_fk` FOREIGN KEY (`planNum`) REFERENCES `plan` (`planNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subplan`
--

LOCK TABLES `subplan` WRITE;
/*!40000 ALTER TABLE `subplan` DISABLE KEYS */;
/*!40000 ALTER TABLE `subplan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag` (
  `tagNum` int NOT NULL,
  `tagName` varchar(50) NOT NULL,
  `tagInfo` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`tagNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` varchar(50) NOT NULL,
  `pass` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `nickname` varchar(50) NOT NULL,
  `age` int DEFAULT NULL,
  `gender` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `addr` varchar(150) DEFAULT NULL,
  `rank` int DEFAULT '1',
  `reg_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nickname_UNIQUE` (`nickname`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-02 12:30:13
