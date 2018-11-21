-- MySQL dump 10.13  Distrib 8.0.12, for macos10.13 (x86_64)
--
-- Host: 127.0.0.1    Database: kalaitzidis18202780
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Applicant`
--

DROP TABLE IF EXISTS `Applicant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Applicant` (
  `applicantid` int(11) NOT NULL,
  `firstname` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) NOT NULL,
  `address` varchar(45) DEFAULT NULL COMMENT 'The address of the applicant.',
  `telephone_number` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`applicantid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Applicant`
--

LOCK TABLES `Applicant` WRITE;
/*!40000 ALTER TABLE `Applicant` DISABLE KEYS */;
INSERT INTO `Applicant` VALUES (1000,'Jeff','Bezos','Merville 1','1234567890'),(1001,'Bill','Gates','Blackrock 2','2345678909'),(1010,'Larry','Elison','Glendale 3','3456789098'),(1100,'Sergey','Brin','Mesa 4','4567890987'),(1101,'Elon ','Musk','One Tesla Way','5678909876'),(1110,'Mark','Zuckerberg','Facemash 33','6789098765'),(1111,'Richard','Branson ','Virgin Galactic Avenue 1','7890987654'),(2111,'Larry ','Page','Android Avenue 7','8909876543'),(2121,'Steve','Jobs','Infinity Loop 1','0511201100'),(2211,'Jack ','Ma','Alibaba street 22','9098765432');
/*!40000 ALTER TABLE `Applicant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `applicant_has_skills`
--

DROP TABLE IF EXISTS `applicant_has_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `applicant_has_skills` (
  `applicantid` int(11) DEFAULT NULL,
  `skillsid` int(11) DEFAULT NULL,
  `applicant_has_skills_id` int(11) NOT NULL,
  PRIMARY KEY (`applicant_has_skills_id`),
  KEY `applicantid_idx` (`applicantid`),
  KEY `skillsid_idx` (`skillsid`),
  CONSTRAINT `applicantid` FOREIGN KEY (`applicantid`) REFERENCES `applicant` (`applicantid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `skillsid` FOREIGN KEY (`skillsid`) REFERENCES `skills` (`skillsid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applicant_has_skills`
--

LOCK TABLES `applicant_has_skills` WRITE;
/*!40000 ALTER TABLE `applicant_has_skills` DISABLE KEYS */;
INSERT INTO `applicant_has_skills` VALUES (1000,5111,6111),(1000,5121,6121),(1000,5221,6211),(2121,5322,6212),(2121,5223,6221),(2121,5212,6222),(1101,5111,6223),(1101,5112,6232),(1101,5211,6322),(1110,5222,6323);
/*!40000 ALTER TABLE `applicant_has_skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_info`
--

DROP TABLE IF EXISTS `job_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `job_info` (
  `jobid` int(11) NOT NULL,
  `type_of_job` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`jobid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_info`
--

LOCK TABLES `job_info` WRITE;
/*!40000 ALTER TABLE `job_info` DISABLE KEYS */;
INSERT INTO `job_info` VALUES (4111,'Information security engineer'),(4211,'DevOps engineer'),(4212,'Enterprise architect'),(4221,'Technical program manager'),(4222,'Software architect'),(4223,'Applications architect'),(4232,'Infrastructure architect'),(4322,'Software development manager'),(4323,'Data warehouse architect'),(4332,'Software engineering manager');
/*!40000 ALTER TABLE `job_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_requires_skills`
--

DROP TABLE IF EXISTS `job_requires_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `job_requires_skills` (
  `jobid` int(11) DEFAULT NULL,
  `skillsid` int(11) DEFAULT NULL,
  `job_requires_skills_id` int(11) NOT NULL,
  PRIMARY KEY (`job_requires_skills_id`),
  KEY `jobid_idx` (`jobid`),
  KEY `skillsid_idx` (`skillsid`),
  CONSTRAINT `jobid` FOREIGN KEY (`jobid`) REFERENCES `job_info` (`jobid`),
  CONSTRAINT `skillid` FOREIGN KEY (`skillsid`) REFERENCES `skills` (`skillsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_requires_skills`
--

LOCK TABLES `job_requires_skills` WRITE;
/*!40000 ALTER TABLE `job_requires_skills` DISABLE KEYS */;
INSERT INTO `job_requires_skills` VALUES (4111,5112,7111),(4111,5121,7112),(4111,5211,7121),(4223,5222,7211),(4223,5232,7212),(4223,5322,7221),(4322,5223,7222),(4322,5111,7223),(4322,5112,7232),(4221,5211,7322),(4222,5323,7323);
/*!40000 ALTER TABLE `job_requires_skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skills`
--

DROP TABLE IF EXISTS `skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `skills` (
  `skillsid` int(11) NOT NULL,
  `skill_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`skillsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skills`
--

LOCK TABLES `skills` WRITE;
/*!40000 ALTER TABLE `skills` DISABLE KEYS */;
INSERT INTO `skills` VALUES (5111,'Strong Work Ethic'),(5112,'Positive Attitude'),(5121,'Good Communication Skills'),(5211,'Time Management Abilities'),(5212,'Problem-Solving Skills'),(5221,'Team Player'),(5222,'Self-Confidence'),(5223,'Adaptable'),(5232,'Quick Learner'),(5322,'Good under pressure'),(5323,'Research Skills');
/*!40000 ALTER TABLE `skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `university`
--

DROP TABLE IF EXISTS `university`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `university` (
  `universityid` int(20) NOT NULL,
  `university_name` varchar(100) NOT NULL,
  `university_address` varchar(45) DEFAULT NULL,
  `university_number` int(22) DEFAULT NULL,
  PRIMARY KEY (`universityid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `university`
--

LOCK TABLES `university` WRITE;
/*!40000 ALTER TABLE `university` DISABLE KEYS */;
INSERT INTO `university` VALUES (3111,'MIT','MIT 1',12345678),(3121,'Stanford University','Stanford Place 1',23456789),(3211,'Harvard University','Harvard 1',34567890),(3212,'CalTech','California 66',45678909),(3221,'University of Cambridge','Cambridge 12',56789098),(3222,'University of Oxford','Oxford 23',67890987),(3223,'University College London','London Eye 2',78909876),(3232,'Imperial College London','Imperial 6',89098765),(3322,'University of Chicago','Sears Road 5',90987654),(3323,'ETH Zurich','Einstein Avenue 1905',9876543);
/*!40000 ALTER TABLE `university` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `university_hires_applicant`
--

DROP TABLE IF EXISTS `university_hires_applicant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `university_hires_applicant` (
  `universityid` int(11) DEFAULT NULL,
  `applicantid` int(11) DEFAULT NULL,
  `jobid` int(11) DEFAULT NULL,
  `university_hires_applicant_id` int(11) NOT NULL,
  `offers_job` varchar(45) DEFAULT 'WAITING',
  PRIMARY KEY (`university_hires_applicant_id`),
  KEY `universityid_idx` (`universityid`),
  KEY `jobid_idx` (`jobid`),
  KEY `applicanthasid_idx` (`applicantid`),
  CONSTRAINT `applicanthasid` FOREIGN KEY (`applicantid`) REFERENCES `applicant` (`applicantid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `jobhasid` FOREIGN KEY (`jobid`) REFERENCES `job_info` (`jobid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `universityhasid` FOREIGN KEY (`universityid`) REFERENCES `university` (`universityid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `university_hires_applicant`
--

LOCK TABLES `university_hires_applicant` WRITE;
/*!40000 ALTER TABLE `university_hires_applicant` DISABLE KEYS */;
INSERT INTO `university_hires_applicant` VALUES (3111,1100,4323,8112,'WAITING'),(3111,1110,4223,8121,'WAITING'),(3211,1110,4322,8212,'WAITING'),(3211,2211,4212,8221,'WAITING'),(3323,1010,4232,8222,'WAITING'),(3323,1000,4323,8223,'WAITING'),(3323,1101,4221,8232,'WAITING'),(3111,1111,4211,8322,'WAITING'),(3223,2111,4332,8323,'WAITING'),(3211,2121,4323,8332,'WAITING');
/*!40000 ALTER TABLE `university_hires_applicant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `university_interviews_applicant`
--

DROP TABLE IF EXISTS `university_interviews_applicant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `university_interviews_applicant` (
  `universityid` int(11) DEFAULT NULL,
  `jobid` int(11) DEFAULT NULL,
  `applicantid` int(11) DEFAULT NULL,
  `date_of_interview` date DEFAULT NULL,
  `university_interviews_applicant_id` int(11) NOT NULL,
  PRIMARY KEY (`university_interviews_applicant_id`),
  KEY `jobid_idx` (`jobid`),
  KEY `universityid_idx` (`universityid`),
  KEY `applicantid_idx` (`applicantid`),
  CONSTRAINT `applicantsid` FOREIGN KEY (`applicantid`) REFERENCES `applicant` (`applicantid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `jobsid` FOREIGN KEY (`jobid`) REFERENCES `job_info` (`jobid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `universityid` FOREIGN KEY (`universityid`) REFERENCES `university` (`universityid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `university_interviews_applicant`
--

LOCK TABLES `university_interviews_applicant` WRITE;
/*!40000 ALTER TABLE `university_interviews_applicant` DISABLE KEYS */;
INSERT INTO `university_interviews_applicant` VALUES (3121,4111,1000,'2017-01-01',9111),(3121,4211,1001,'2017-02-09',9112),(3121,4212,1010,'2017-04-05',9121),(3212,4221,1100,'2017-09-17',9221),(3212,4222,1101,'2017-04-03',9222),(3212,4223,1110,'2017-08-12',9223),(3222,4232,1111,'2017-01-01',9232),(3222,4322,2111,'2017-02-11',9322),(3222,4323,2121,'2017-03-12',9323),(3322,4332,2211,'2017-08-13',9332),(3323,4322,2211,'2017-09-10',9333);
/*!40000 ALTER TABLE `university_interviews_applicant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `University_offers_job`
--

DROP TABLE IF EXISTS `University_offers_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `University_offers_job` (
  `university_offers_job_id` int(11) NOT NULL AUTO_INCREMENT,
  `universityid` int(11) DEFAULT NULL,
  `jobid` int(11) DEFAULT NULL,
  PRIMARY KEY (`university_offers_job_id`),
  KEY `universityid_idx` (`universityid`),
  KEY `job_id_idx` (`jobid`),
  CONSTRAINT `job_id` FOREIGN KEY (`jobid`) REFERENCES `job_info` (`jobid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `university_id` FOREIGN KEY (`universityid`) REFERENCES `university` (`universityid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `University_offers_job`
--

LOCK TABLES `University_offers_job` WRITE;
/*!40000 ALTER TABLE `University_offers_job` DISABLE KEYS */;
INSERT INTO `University_offers_job` VALUES (11111,3121,4111),(11112,3121,4222),(11113,3111,4111),(11114,3111,4222),(11115,3212,4323),(11116,3212,4332),(11117,3221,4322),(11118,3212,4111),(11119,3232,4222),(11120,3232,4223);
/*!40000 ALTER TABLE `University_offers_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'kalaitzidis18202780'
--
/*!50003 DROP PROCEDURE IF EXISTS `applicants_Q8` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `applicants_Q8`()
BEGIN

	SELECT COUNT(*)
    FROM university_hires_applicant;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `applicant_has_skills_STEP3` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `applicant_has_skills_STEP3`(IN applicant_id INT, IN skills_id INT)
BEGIN
INSERT INTO applicant_has_skills(applicantid,skillsid)
VALUES (applicant_id,skills_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Applicant_Q11` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Applicant_Q11`()
BEGIN
	SELECT applicantid
    FROM university_interviews_applicant
    GROUP BY applicantid
    HAVING COUNT(applicantid) >= 2;
    
    #I HAD TO MANUALLY SHOW THE APPLICANT WHO HAS BEEN INVITED FOR INTERVIEW TWICE
    
    SELECT firstname,lastname
    FROM Applicant
    WHERE applicantid = '2211';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `applicant_Q3` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `applicant_Q3`(IN last_name VARCHAR(45))
BEGIN
SELECT * FROM applicant WHERE last_name = lastname;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `applicant_Q4` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `applicant_Q4`(IN applicant_id INT)
BEGIN
SELECT * FROM applicant WHERE applicant_id = applicantid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `applicant_Q5` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `applicant_Q5`(IN job_id INT)
BEGIN

SELECT * 
FROM Applicant
WHERE applicantid IN (
	SELECT applicantid
    FROM applicant_has_skills
    WHERE skillsid IN (
		SELECT skillsid
        FROM job_requires_skills 
		WHERE jobid = job_id
    )
);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `applicant_STEP3` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `applicant_STEP3`(IN applicant_id INT, IN first_name VARCHAR(45), IN last_name VARCHAR(45), IN address_applicant VARCHAR(45), IN telephonenumber VARCHAR(20))
BEGIN
INSERT INTO applicant(applicantid,firstname,lastname,address,telephone_number)
VALUES (applicant_id,first_name,last_name,address_applicant,telephonenumber);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `interview_Q10` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `interview_Q10`(IN dateofinterview DATE)
BEGIN

SELECT university_interviews_applicant_id
FROM university_interviews_applicant 
WHERE date_of_interview = dateofinterview;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `job_info_Q6` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `job_info_Q6`(IN skills_id INT)
BEGIN

SELECT * 
FROM job_info
WHERE jobid IN (
	SELECT jobid
    FROM job_requires_skills
    WHERE skillsid IN (
		SELECT skillsid
        FROM job_requires_skills 
		WHERE skillsid = skills_id
    )
);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `job_info_Q7` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `job_info_Q7`()
BEGIN

SELECT type_of_job
FROM job_info
WHERE jobid IN (
	SELECT jobid
    FROM University_offers_job
    ORDER BY universityid
);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `job_info_Q9` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `job_info_Q9`()
BEGIN
	SELECT COUNT(*)
    FROM job_requires_skills 
	WHERE skillsid IN (
		SELECT skillsid
        FROM skills
        WHERE skill_name = 'Research Skills'
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `job_info_STEP3` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `job_info_STEP3`(IN job_id INT, IN typeofjob VARCHAR(45))
BEGIN
INSERT INTO applicant_has_skills(jobid, type_of_job)
VALUES (job_id,typeofjob);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `job_requires_skills_STEP3` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `job_requires_skills_STEP3`(IN job_id INT, IN skills_id INT)
BEGIN
INSERT INTO applicant_has_skills(jobid, skillsid)
VALUES (job_id,skills_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `skills_STEP3` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `skills_STEP3`(IN skills_id INT, IN skillsname INT)
BEGIN
INSERT INTO applicant_has_skills(skillsid, skills_name)
VALUES (skills_id,skillsname);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `univerisity_hires_applicant_STEP3` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `univerisity_hires_applicant_STEP3`(IN university_id INT, IN applicant_id INT, IN job_id INT)
BEGIN
INSERT INTO applicant_has_skills(universityid,applicantid,jobid)
VALUES (university_id,applicant_id,job_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `univerisity_interviews_applicant_STEP3` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `univerisity_interviews_applicant_STEP3`(IN university_id INT, IN job_id INT, IN applicant_id INT, IN dateofinterview DATE)
BEGIN
INSERT INTO applicant_has_skills(universityid,jobid,applicantid,date_of_interview)
VALUES (university_id,job_id,applicant_id,dateofinterview);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `univerisity_Q1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `univerisity_Q1`(IN universityname VARCHAR(45))
BEGIN
SELECT * FROM university WHERE university_name = universityname;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `univerisity_Q2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `univerisity_Q2`(IN university_id INT)
BEGIN
SELECT * FROM university WHERE university_id  = universityid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `university_STEP3` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `university_STEP3`(IN university_id INT, IN universityname VARCHAR(45), IN universityaddress VARCHAR(45), IN universitynumber INT)
BEGIN
INSERT INTO university(universityid,university_name,university_address,university_number)
VALUES (university_id,universityname, universityaddress,universitynumber);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-16 15:10:12
