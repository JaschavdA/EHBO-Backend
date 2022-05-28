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
-- Table structure for table `competency-lesson`
--

DROP TABLE IF EXISTS `competency-lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `competency-lesson` (
  `CompetencyID` int(11) NOT NULL,
  `LessonID` int(11) NOT NULL,
  PRIMARY KEY (`CompetencyID`,`LessonID`),
  KEY `LessonID` (`LessonID`),
  CONSTRAINT `competency-lesson_ibfk_1` FOREIGN KEY (`LessonID`) REFERENCES `lesson` (`LessonID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `competency-lesson_ibfk_2` FOREIGN KEY (`CompetencyID`) REFERENCES `competency` (`ID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `competency-lesson`
--

LOCK TABLES `competency-lesson` WRITE;
/*!40000 ALTER TABLE `competency-lesson` DISABLE KEYS */;
/*!40000 ALTER TABLE `competency-lesson` ENABLE KEYS */;
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
-- Table structure for table `diploma-competency`
--

DROP TABLE IF EXISTS `diploma-competency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diploma-competency` (
  `CompetencyID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `DateObtained` date NOT NULL,
  PRIMARY KEY (`CompetencyID`,`UserID`),
  KEY `UserID` (`UserID`),
  CONSTRAINT `diploma-competency_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `diploma` (`UserID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `diploma-competency_ibfk_2` FOREIGN KEY (`CompetencyID`) REFERENCES `competency` (`ID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diploma-competency`
--

LOCK TABLES `diploma-competency` WRITE;
/*!40000 ALTER TABLE `diploma-competency` DISABLE KEYS */;
/*!40000 ALTER TABLE `diploma-competency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructor-lesson`
--

DROP TABLE IF EXISTS `instructor-lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instructor-lesson` (
  `InstructorID` int(11) NOT NULL,
  `LessonID` int(11) NOT NULL,
  PRIMARY KEY (`InstructorID`,`LessonID`),
  KEY `LessonID` (`LessonID`),
  CONSTRAINT `instructor-lesson_ibfk_1` FOREIGN KEY (`LessonID`) REFERENCES `lesson` (`LessonID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `instructor-lesson_ibfk_2` FOREIGN KEY (`InstructorID`) REFERENCES `user` (`ID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructor-lesson`
--

LOCK TABLES `instructor-lesson` WRITE;
/*!40000 ALTER TABLE `instructor-lesson` DISABLE KEYS */;
/*!40000 ALTER TABLE `instructor-lesson` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lesson`
--

LOCK TABLES `lesson` WRITE;
/*!40000 ALTER TABLE `lesson` DISABLE KEYS */;
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
-- Table structure for table `order-item`
--

DROP TABLE IF EXISTS `order-item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order-item` (
  `OrderID` int(11) NOT NULL,
  `ItemID` int(11) NOT NULL,
  `Amount` int(11) NOT NULL,
  PRIMARY KEY (`OrderID`,`ItemID`),
  KEY `ItemID` (`ItemID`),
  CONSTRAINT `order-item_ibfk_1` FOREIGN KEY (`ItemID`) REFERENCES `material` (`ID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `order-item_ibfk_2` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order-item`
--

LOCK TABLES `order-item` WRITE;
/*!40000 ALTER TABLE `order-item` DISABLE KEYS */;
/*!40000 ALTER TABLE `order-item` ENABLE KEYS */;
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
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user-lesson`
--

DROP TABLE IF EXISTS `user-lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user-lesson` (
  `UserID` int(11) NOT NULL,
  `LessonID` int(11) NOT NULL,
  PRIMARY KEY (`UserID`,`LessonID`),
  KEY `LessonID` (`LessonID`),
  CONSTRAINT `user-lesson_ibfk_1` FOREIGN KEY (`LessonID`) REFERENCES `lesson` (`LessonID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `user-lesson_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `user` (`ID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user-lesson`
--

LOCK TABLES `user-lesson` WRITE;
/*!40000 ALTER TABLE `user-lesson` DISABLE KEYS */;
/*!40000 ALTER TABLE `user-lesson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user-shift`
--

DROP TABLE IF EXISTS `user-shift`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user-shift` (
  `UserID` int(11) NOT NULL,
  `ShiftID` int(11) NOT NULL,
  PRIMARY KEY (`UserID`,`ShiftID`),
  KEY `ShiftID` (`ShiftID`),
  CONSTRAINT `user-shift_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`ID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `user-shift_ibfk_2` FOREIGN KEY (`ShiftID`) REFERENCES `shift` (`ShiftID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user-shift`
--

LOCK TABLES `user-shift` WRITE;
/*!40000 ALTER TABLE `user-shift` DISABLE KEYS */;
/*!40000 ALTER TABLE `user-shift` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-28 11:09:38
