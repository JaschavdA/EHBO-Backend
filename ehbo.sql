-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: ehbo
-- ------------------------------------------------------
-- Server version	10.4.24-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `competency`
--

DROP TABLE IF EXISTS `competency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `competency` (
  `ID` int(11) NOT NULL,
  `Name` int(11) NOT NULL,
  `Description` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `AK_Name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `competency`
--

LOCK TABLES `competency` WRITE;
/*!40000 ALTER TABLE `competency` DISABLE KEYS */;
/*!40000 ALTER TABLE `competency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `competency_lesson`
--

DROP TABLE IF EXISTS `competency_lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `competency_lesson` (
  `CompetencyID` int(11) NOT NULL,
  `LessonID` int(11) NOT NULL,
  PRIMARY KEY (`CompetencyID`,`LessonID`),
  KEY `LessonID` (`LessonID`),
  CONSTRAINT `competency_lesson_ibfk_1` FOREIGN KEY (`LessonID`) REFERENCES `lesson` (`LessonID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `competency_lesson_ibfk_2` FOREIGN KEY (`CompetencyID`) REFERENCES `competency` (`ID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `competency_lesson`
--

LOCK TABLES `competency_lesson` WRITE;
/*!40000 ALTER TABLE `competency_lesson` DISABLE KEYS */;
/*!40000 ALTER TABLE `competency_lesson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diploma`
--

DROP TABLE IF EXISTS `diploma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diploma` (
  `UserID` int(11) NOT NULL,
  `ValidUntill` date NOT NULL,
  PRIMARY KEY (`UserID`),
  CONSTRAINT `diploma_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`ID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diploma`
--

LOCK TABLES `diploma` WRITE;
/*!40000 ALTER TABLE `diploma` DISABLE KEYS */;
/*!40000 ALTER TABLE `diploma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diploma_competency`
--

DROP TABLE IF EXISTS `diploma_competency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diploma_competency` (
  `CompetencyID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `DateObtained` date NOT NULL,
  PRIMARY KEY (`CompetencyID`,`UserID`),
  KEY `UserID` (`UserID`),
  CONSTRAINT `diploma_competency_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `diploma` (`UserID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `diploma_competency_ibfk_2` FOREIGN KEY (`CompetencyID`) REFERENCES `competency` (`ID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diploma_competency`
--

LOCK TABLES `diploma_competency` WRITE;
/*!40000 ALTER TABLE `diploma_competency` DISABLE KEYS */;
/*!40000 ALTER TABLE `diploma_competency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructor_lesson`
--

DROP TABLE IF EXISTS `instructor_lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instructor_lesson` (
  `InstructorID` int(11) NOT NULL,
  `LessonID` int(11) NOT NULL,
  PRIMARY KEY (`InstructorID`,`LessonID`),
  KEY `LessonID` (`LessonID`),
  CONSTRAINT `instructor_lesson_ibfk_1` FOREIGN KEY (`LessonID`) REFERENCES `lesson` (`LessonID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `instructor_lesson_ibfk_2` FOREIGN KEY (`InstructorID`) REFERENCES `user` (`ID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructor_lesson`
--

LOCK TABLES `instructor_lesson` WRITE;
/*!40000 ALTER TABLE `instructor_lesson` DISABLE KEYS */;
INSERT INTO `instructor_lesson` VALUES (4,2);
/*!40000 ALTER TABLE `instructor_lesson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lesson`
--

DROP TABLE IF EXISTS `lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lesson` (
  `LessonID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `DateTime` datetime NOT NULL,
  `Description` varchar(255) NOT NULL,
  PRIMARY KEY (`LessonID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lesson`
--

LOCK TABLES `lesson` WRITE;
/*!40000 ALTER TABLE `lesson` DISABLE KEYS */;
INSERT INTO `lesson` VALUES (1,'Pleisters plakken','2022-05-31 21:15:31','dit is een test les'),(2,'Reanimatie les','2022-05-31 21:17:20','Dit is ook een test les');
/*!40000 ALTER TABLE `lesson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material`
--

DROP TABLE IF EXISTS `material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `material` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `Description` varchar(400) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material`
--

LOCK TABLES `material` WRITE;
/*!40000 ALTER TABLE `material` DISABLE KEYS */;
/*!40000 ALTER TABLE `material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_item`
--

DROP TABLE IF EXISTS `order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_item` (
  `OrderID` int(11) NOT NULL,
  `ItemID` int(11) NOT NULL,
  `Amount` int(11) NOT NULL,
  PRIMARY KEY (`OrderID`,`ItemID`),
  KEY `ItemID` (`ItemID`),
  CONSTRAINT `order_item_ibfk_1` FOREIGN KEY (`ItemID`) REFERENCES `material` (`ID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `order_item_ibfk_2` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item`
--

LOCK TABLES `order_item` WRITE;
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `OrderID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) NOT NULL,
  `Date` date NOT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `FK_USER_ORDERS` (`UserID`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`ID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shift`
--

DROP TABLE IF EXISTS `shift`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shift` (
  `ShiftID` int(11) NOT NULL AUTO_INCREMENT,
  `CoordinatorID` int(11) NOT NULL,
  `DateTime` datetime NOT NULL,
  `Description` varchar(255) NOT NULL,
  PRIMARY KEY (`ShiftID`),
  KEY `FK_Coordinator_Shift` (`CoordinatorID`),
  CONSTRAINT `shift_ibfk_1` FOREIGN KEY (`CoordinatorID`) REFERENCES `user` (`ID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shift`
--

LOCK TABLES `shift` WRITE;
/*!40000 ALTER TABLE `shift` DISABLE KEYS */;
/*!40000 ALTER TABLE `shift` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `IsFirstLogin` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Henk','henk@test.nl','$2b$10$oda.EJkMSolBXcCTtCsnye4lgSQ38.Z2d3JsTzY7NxUVS5Vq74iRy','\0'),(4,'Marieke','marieke@test.nl','$2b$10$DSn4Rv7pv5UK8kVmSsPYgO5RdpN0jzpA8RRAwpT.zqN1v4y4D2qYu','\0');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_lesson`
--

DROP TABLE IF EXISTS `user_lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_lesson` (
  `UserID` int(11) NOT NULL,
  `LessonID` int(11) NOT NULL,
  PRIMARY KEY (`UserID`,`LessonID`),
  KEY `LessonID` (`LessonID`),
  CONSTRAINT `user_lesson_ibfk_1` FOREIGN KEY (`LessonID`) REFERENCES `lesson` (`LessonID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `user_lesson_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `user` (`ID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_lesson`
--

LOCK TABLES `user_lesson` WRITE;
/*!40000 ALTER TABLE `user_lesson` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_lesson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_shift`
--

DROP TABLE IF EXISTS `user_shift`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_shift` (
  `UserID` int(11) NOT NULL,
  `ShiftID` int(11) NOT NULL,
  PRIMARY KEY (`UserID`,`ShiftID`),
  KEY `ShiftID` (`ShiftID`),
  CONSTRAINT `user_shift_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`ID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `user_shift_ibfk_2` FOREIGN KEY (`ShiftID`) REFERENCES `shift` (`ShiftID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_shift`
--

LOCK TABLES `user_shift` WRITE;
/*!40000 ALTER TABLE `user_shift` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_shift` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-31 22:10:22
