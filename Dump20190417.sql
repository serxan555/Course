CREATE DATABASE  IF NOT EXISTS `555` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `555`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: localhost    Database: 555
-- ------------------------------------------------------
-- Server version	5.5.37

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupName` varchar(45) NOT NULL,
  PRIMARY KEY (`id`,`groupName`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,'A'),(2,'B'),(3,'C'),(4,'D'),(5,'E');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sectors`
--

DROP TABLE IF EXISTS `sectors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sectors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sector` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sectors`
--

LOCK TABLES `sectors` WRITE;
/*!40000 ALTER TABLE `sectors` DISABLE KEYS */;
INSERT INTO `sectors` VALUES (1,'Az'),(2,'Ru'),(3,'En'),(4,'Tr');
/*!40000 ALTER TABLE `sectors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sgt`
--

DROP TABLE IF EXISTS `sgt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sgt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `studentId` int(11) DEFAULT NULL,
  `payment` double DEFAULT NULL,
  `groupId` int(11) DEFAULT NULL,
  `lessonDate` varchar(45) DEFAULT NULL,
  `lessonTime` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_user_ibfk_1_idx` (`studentId`,`userId`),
  KEY `student_user_ibfk_2_idx` (`userId`),
  KEY `sgt_ibfk_4_idx` (`groupId`),
  CONSTRAINT `sgt_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sgt_ibfk_3` FOREIGN KEY (`studentId`) REFERENCES `students` (`id`),
  CONSTRAINT `sgt_ibfk_4` FOREIGN KEY (`groupId`) REFERENCES `groups` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sgt`
--

LOCK TABLES `sgt` WRITE;
/*!40000 ALTER TABLE `sgt` DISABLE KEYS */;
INSERT INTO `sgt` VALUES (25,1,1,120,1,'1-5','19:00-19:00','Active'),(28,42,1,97,1,'2-5','18:00-18:00','Active'),(36,1,2,60,1,'1-5','19:00-19:00','Active'),(54,1,141,70,1,'1-5','19:00-19:00','Passive'),(55,1,142,96,1,'1-5','19:00-19:00','Active'),(56,1,143,84,1,'1-5','19:00-19:00','Active'),(57,1,144,135,2,'6-7','13:00-11:00','Active'),(58,1,145,135,2,'6-7','13:00-11:00','Active'),(59,1,146,88,2,'6-7','13:00-11:00','Passive'),(60,1,147,120,2,'6-7','13:00-11:00','Active'),(61,1,148,128,2,'6-7','13:00-11:00','Active'),(62,1,149,80,2,'6-7','13:00-11:00','Active'),(63,1,150,85,2,'6-7','13:00-11:00','Active'),(64,1,151,85,2,'6-7','13:00-11:00','Active'),(65,1,152,100,2,'6-7','13:00-11:00','Active'),(66,1,153,100,3,'2-6','19:00','Active'),(67,1,154,60,3,'2-6','17:00','Active'),(68,1,155,60,3,'2-6','17:00','Active'),(69,1,156,135,4,'2-7','17:00-14:00','Active'),(70,1,157,128,4,'2-7','17:00-14:00','Active'),(71,1,158,160,4,'2-7','17:00-14:00','Passive'),(72,1,159,120,4,'2-7','17:00-14:00','Active'),(73,1,160,135,4,'2-7','17:00-14:00','Active'),(74,1,161,160,4,'2-7','17:00-14:00','Active'),(75,1,162,160,4,'2-7','17:00-14:00','Active');
/*!40000 ALTER TABLE `sgt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `students` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `surname` varchar(45) DEFAULT NULL,
  `parent` varchar(45) DEFAULT NULL,
  `birthDate` date DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `gmail` varchar(45) DEFAULT NULL,
  `gmailCode` varchar(45) DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `groupNameId` int(11) DEFAULT NULL,
  `sectorId` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=192 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'Tərgül','Həsən','Eldəniz-Günay','2007-05-27','051-702-47-49','tergul000h2135@gmail.com','Dea783,.D','Female',1,1,1),(2,'Hüseyn','Hüseynli','Tural','2007-10-23','050-220-86-23','huseyn00h1843@gmail.com','Dea783,.D','Male',1,1,1),(141,'Əfruz','Mirzəzadə','Əbülfəz','2007-06-17','050-356-68-17','efruz00m2009@gmail.com','Dea783,.D','Female',1,3,0),(142,'Hüseyn','Nemətli','Gülnarə','2007-04-22','070-550-93-02','huseyn00n2209@gmail.com','Dea783,.D','Male',1,1,1),(143,'Zəhra','Əliyeva','Elnurə','2006-05-19','055-676-71-87','zehra00e2197@gmail.com','Dea783,.D','Female',1,1,1),(144,'Gülbəniz','Əliyeva','Gülmirə','2008-07-07','051-809-33-99','gulbeniz000e1831@gmail.com','Dea783,.D','Female',2,1,1),(145,'Cansu','Əliyeva','Mərcanə','2007-12-17','051-809-33-99','cansu00e2671@gmail.com','Dea783,.D','Female',2,1,1),(146,'Vüqar','Abbasov','Gülmirə','2007-03-25','051-686-53-73','vuqar000a2697@gmail.com','Dea783,.D','Male',2,1,0),(147,'Ələkbər','Rəcəbov','Arifə','2005-12-12','055-914-01-16','racabovaafa@gmail.com',NULL,'Male',2,1,1),(148,'Fərid','İsmayılzadə','Ramin','2007-01-01','050-213-59-29','ferid.ismayilzade.07@mail.ru',NULL,'Male',2,1,1),(149,'Uğur','İbadzadə','Natiqə','2008-07-05','070-681-16-36','ayan.ibadova.07@gmail.com',NULL,'Male',2,1,1),(150,'Ayan','İbadzadə','Natiqə','2007-05-18','070-681-16-36','ayan.ibadova.07@gmail.com','null','Female',2,1,1),(151,'Adil','Ibadov','Natiqə','2002-12-27','070-681-16-36','ayan.ibadova.07@gmail.com','null','Male',2,1,1),(152,'Nurdan','Nəsirli','Günel','2009-11-14','055-800-39-15','nurdan00n3297@gmail.com',NULL,'Female',2,1,1),(153,'Nəzrin','Cavadova','Kənan','2006-11-11','055-250-04-15','nezrinc2743@gmail.com','developia555','Female',1,1,1),(154,'Cavidan','Cavadov','Kənan','2007-10-29','055-250-04-15','cavidanc2742@gmail.com','developia555','Male',1,1,1),(155,'Önər','Yusifov','Səma-Tural','2007-09-07','051-750-90-77','onery2711@gmail.com','developia555','Male',1,1,1),(156,'Zəhranur','Fərəzli','Aynur','2006-01-01','070-381-95-96','zehranur000f@gmail.com','developia555','Female',4,1,1),(157,'Tofiq','Fərəcli','Aynur','2009-01-01','070-381-95-96','zehranur000f@gmail.com','developia555','Male',4,1,1),(158,'Ayxan ','Mövsümov',NULL,'2006-01-01',NULL,'movsumovayxan49@gmail.com','developia555','Male',4,1,0),(159,'Ləman','Məmmədova','Almaz','2005-01-01','055-990-33-25','leman000m@gmail.com','developia555','Female',4,1,1),(160,'İsmayıl','Məmmədov','Aysel','2010-01-01','null','mismayil2010@gmail.com',NULL,'Male',4,1,1),(161,'Vaqif','Heybətzadə','Nüşabə','2004-01-01','055-338-02-20','vaqif000h@gmail.com','developia555','Male',4,1,1),(162,'Fuad','Abdullazadə','Arzu','2003-01-01','050-254-56-76','fuad000abdul@gmail.com','Avdu77azadeFuad','Male',4,1,1),(172,'Samuran','Semedbeyli','Cesaret','1993-04-05','077-338-00-38','ssmdbyli555@gmail.com','555','Male',NULL,1,1),(181,'Serxan','Semedbeyli','Cesaret','1995-05-07','055-808-13-29','ssmdbyli@gmail.com','555','Male',5,1,1),(184,'AAA','AAA','AAA','2019-01-08',' 994-(055) 808-1329','serxansemedbeyli@gmail.com','555ss777ss','Male',NULL,1,0),(185,'BBB','BBB','BBB','2001-01-13',' 994-(055) 808-1329','serxansemedbeyli@mail.ru','555ss777ss','Male',NULL,1,0),(186,'Serxan','Semedbeyli',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(187,'Semedbeyli','Serxan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(188,'Natiq','Natiq',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(189,'Raul','Semedbeyli','Cesaret','1995-05-07','055-808-13-29','ssmdbyli@gmail.com','555ss777ss','Male',NULL,NULL,1),(190,'Raul','Semed','Cesaret','1995-05-07','055-808-13-29','ssmdbyli@gmail.com','555ss777ss','Male',NULL,NULL,1),(191,'q','q','q','2019-03-03','q','q','q','Female',NULL,NULL,1);
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `types`
--

DROP TABLE IF EXISTS `types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `types`
--

LOCK TABLES `types` WRITE;
/*!40000 ALTER TABLE `types` DISABLE KEYS */;
INSERT INTO `types` VALUES (1,'administrator'),(2,'director'),(3,'teacher'),(4,'reception'),(5,'marketing'),(6,'student');
/*!40000 ALTER TABLE `types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(45) DEFAULT NULL,
  `user_surname` varchar(45) DEFAULT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(225) NOT NULL,
  `birthdate` date DEFAULT NULL,
  `user_email` varchar(45) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `typeId` int(11) DEFAULT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Sərxan','Səmədbəyli','SS.555','c3d90dc1f2b4b1091c7855b434b5181f79ee124ea99770f5f8b29666f23cb251','1995-05-07','ssmdbyli@gmail.com',1,1),(7,'Pərviz','Heydərov','perviz555','c3d90dc1f2b4b1091c7855b434b5181f79ee124ea99770f5f8b29666f23cb251','1900-01-01','serxan555@mail.ru',1,3),(42,'Samir','Həsənov','samir555','c3d90dc1f2b4b1091c7855b434b5181f79ee124ea99770f5f8b29666f23cb251','1900-01-01','serxansemedbeyli555@mail.ru',1,3),(47,'Reşad','Iskəndərov','roş555','c3d90dc1f2b4b1091c7855b434b5181f79ee124ea99770f5f8b29666f23cb251','1900-01-01','d',1,3),(48,'Yusif','Əlizadə','yusif555','c3d90dc1f2b4b1091c7855b434b5181f79ee124ea99770f5f8b29666f23cb251','1900-01-01','elsadkerimov@gmail.com',0,3),(50,'Şəhriyyar','Məmmədov','shehriyyar555','c3d90dc1f2b4b1091c7855b434b5181f79ee124ea99770f5f8b29666f23cb251','1900-01-01','elsadkerimov100@gmail.com',0,3),(52,'Ser','Xan','ser555','c3d90dc1f2b4b1091c7855b434b5181f79ee124ea99770f5f8b29666f23cb251','2018-12-02','Cesaret',1,6),(53,'Ülviyyə','Qocayeva','ulya','9cd657f725d4b523910ed24e7a35fb94d94d2abaf05fa2a8dbdee01f13fb2d83','1988-02-15','ulviyyeqocayeva88@mail.ru',1,4),(81,'e','e','e','3f79bb7b435b05321651daefd374cdc681dc06faa65e374e38337b88ca046dea','2019-01-14','e',1,2),(82,'r','r','r','454349e422f05297191ead13e21d3db520e5abef52055e4964b82fb213f593a1','2019-01-14','r',1,2);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-17 10:06:55
