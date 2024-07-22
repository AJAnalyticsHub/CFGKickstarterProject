-- MySQL dump 10.13  Distrib 8.0.38, for macos13.6 (x86_64)
--
-- Host: localhost    Database: MoonPigeon
-- ------------------------------------------------------
-- Server version	8.0.38

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ADTargeting`
--

DROP TABLE IF EXISTS `ADTargeting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ADTargeting` (
  `adtarget_id` int NOT NULL AUTO_INCREMENT,
  `adtarget` varchar(55) NOT NULL,
  PRIMARY KEY (`adtarget_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ADTargeting`
--

LOCK TABLES `ADTargeting` WRITE;
/*!40000 ALTER TABLE `ADTargeting` DISABLE KEYS */;
INSERT INTO `ADTargeting` VALUES (1,'Email'),(2,'Google'),(3,'Postal'),(4,'Search Engine');
/*!40000 ALTER TABLE `ADTargeting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Balance`
--

DROP TABLE IF EXISTS `Balance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Balance` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `pp_account` tinyint(1) DEFAULT NULL,
  `balance` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Balance`
--

LOCK TABLES `Balance` WRITE;
/*!40000 ALTER TABLE `Balance` DISABLE KEYS */;
INSERT INTO `Balance` VALUES (1,1,49.45),(2,0,NULL),(3,1,33.33),(4,0,NULL),(5,0,NULL),(6,0,NULL),(7,0,NULL),(8,1,43.50),(9,0,NULL),(10,0,NULL),(11,1,1.77),(12,1,49.83),(13,1,34.81),(14,1,2.62),(15,1,25.15),(16,0,NULL),(17,1,4.24),(18,0,NULL),(19,1,25.98),(20,1,37.48),(21,1,15.94),(22,1,40.92),(23,1,8.05),(24,1,8.28),(25,1,32.02),(26,0,NULL),(27,1,27.30),(28,0,NULL),(29,0,NULL),(30,1,41.01),(31,1,19.98),(32,0,NULL),(33,0,NULL),(34,1,1.60),(35,1,26.51),(36,0,NULL),(37,0,NULL),(38,1,49.66),(39,0,NULL),(40,1,10.23),(41,1,26.56),(42,0,NULL),(43,1,25.29),(44,1,48.34),(45,0,NULL),(46,0,NULL),(47,0,NULL),(48,0,NULL),(49,1,8.92),(50,1,21.62),(51,1,32.56),(52,0,NULL),(53,1,40.36),(54,0,NULL),(55,1,45.39),(56,1,9.39),(57,0,NULL),(58,1,14.94),(59,0,NULL),(60,0,NULL),(61,1,43.64),(62,0,NULL),(63,1,40.03),(64,0,NULL),(65,1,41.92),(66,1,26.37),(67,0,NULL),(68,0,NULL),(69,1,14.49),(70,1,43.09),(71,1,13.80),(72,0,NULL),(73,1,34.73),(74,0,NULL),(75,0,NULL),(76,1,37.07),(77,0,NULL),(78,1,37.73),(79,0,NULL),(80,0,NULL),(81,0,NULL),(82,1,0.04),(83,0,NULL),(84,1,4.69),(85,1,0.23),(86,0,NULL),(87,0,NULL),(88,0,NULL),(89,1,49.41),(90,0,NULL),(91,1,6.29),(92,1,6.22),(93,0,NULL),(94,0,NULL),(95,1,1.43),(96,1,9.49),(97,1,31.31),(98,0,NULL),(99,0,NULL),(100,0,NULL);
/*!40000 ALTER TABLE `Balance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CardOccasion`
--

DROP TABLE IF EXISTS `CardOccasion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CardOccasion` (
  `cardoccasion_id` int NOT NULL AUTO_INCREMENT,
  `occasion` varchar(55) NOT NULL,
  `cardsentiment_id` int NOT NULL,
  PRIMARY KEY (`cardoccasion_id`),
  KEY `fk_cardsentiment_id` (`cardsentiment_id`),
  CONSTRAINT `fk_cardsentiment_id` FOREIGN KEY (`cardsentiment_id`) REFERENCES `CardSentiment` (`cardsentiment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CardOccasion`
--

LOCK TABLES `CardOccasion` WRITE;
/*!40000 ALTER TABLE `CardOccasion` DISABLE KEYS */;
INSERT INTO `CardOccasion` VALUES (1,'Anniversary',1),(2,'Birthday',1),(3,'Chinese New Year',4),(4,'Christmas',4),(5,'Congratulations',1),(6,'Easter',4),(7,'Engagement',3),(8,'Fathers Day',4),(9,'Get Well Soon',5),(10,'Good Luck',3),(11,'Graduation',3),(12,'Leaving',3),(13,'New Baby',3),(14,'New Home',3),(15,'New Job',3),(16,'New Year',4),(17,'Mothers Day',4),(18,'Retirement',3),(19,'Sympathy',5),(20,'Thank You',2),(21,'Thinking of You',5),(22,'Thank You Teacher',2),(23,'Valentines Day',4),(24,'Wedding',1);
/*!40000 ALTER TABLE `CardOccasion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CardSentiment`
--

DROP TABLE IF EXISTS `CardSentiment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CardSentiment` (
  `cardsentiment_id` int NOT NULL AUTO_INCREMENT,
  `cardsentiment` varchar(55) NOT NULL,
  PRIMARY KEY (`cardsentiment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CardSentiment`
--

LOCK TABLES `CardSentiment` WRITE;
/*!40000 ALTER TABLE `CardSentiment` DISABLE KEYS */;
INSERT INTO `CardSentiment` VALUES (1,'Celebration'),(2,'Gratitude'),(3,'New Beginnings'),(4,'Seasonal'),(5,'Sympathy');
/*!40000 ALTER TABLE `CardSentiment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CardSize`
--

DROP TABLE IF EXISTS `CardSize`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CardSize` (
  `cardsize_id` int NOT NULL AUTO_INCREMENT,
  `cardsize` varchar(55) NOT NULL,
  `papersize` varchar(4) NOT NULL,
  `cardprice` decimal(4,2) NOT NULL,
  PRIMARY KEY (`cardsize_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CardSize`
--

LOCK TABLES `CardSize` WRITE;
/*!40000 ALTER TABLE `CardSize` DISABLE KEYS */;
INSERT INTO `CardSize` VALUES (1,'Small','A6',2.69),(2,'Standard','A5',3.99),(3,'Large','A4',5.99),(4,'Giant','A3',9.99);
/*!40000 ALTER TABLE `CardSize` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CardTheme`
--

DROP TABLE IF EXISTS `CardTheme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CardTheme` (
  `cardtheme_id` int NOT NULL AUTO_INCREMENT,
  `cardtheme` varchar(55) NOT NULL,
  PRIMARY KEY (`cardtheme_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CardTheme`
--

LOCK TABLES `CardTheme` WRITE;
/*!40000 ALTER TABLE `CardTheme` DISABLE KEYS */;
INSERT INTO `CardTheme` VALUES (1,'Adult'),(2,'Celebrity'),(3,'Character'),(4,'Funny'),(5,'Photo Customisation'),(6,'Text Customisation'),(7,'Traditional');
/*!40000 ALTER TABLE `CardTheme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customers`
--

DROP TABLE IF EXISTS `Customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customers` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(55) NOT NULL,
  `last_name` varchar(55) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `house_number` int NOT NULL,
  `street` varchar(255) NOT NULL,
  `town` varchar(255) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `latitude` decimal(6,4) DEFAULT NULL,
  `longtitude` decimal(6,4) DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  CONSTRAINT `fk_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `Balance` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customers`
--

LOCK TABLES `Customers` WRITE;
/*!40000 ALTER TABLE `Customers` DISABLE KEYS */;
INSERT INTO `Customers` VALUES (1,'Oliver','Smith','oliver.smith@example.com',12,'Baker Street','London','NW1 6XE',51.5072,-0.1275),(2,'Amelia','Jones','amelia.jones@example.com',34,'High Street','Oxford','OX1 4AX',51.7519,-1.2578),(3,'Harry','Taylor','harry.taylor@example.com',56,'Station Road','Cambridge','CB1 2JD',52.2081,0.1225),(4,'Isabella','Brown','isabella.brown@example.com',78,'Church Lane','Manchester','M1 4AN',53.4667,-2.2333),(5,'George','Wilson','george.wilson@example.com',90,'Park Avenue','Leeds','LS1 5HQ',53.7975,-1.5436),(6,'Emily','Davies','emily.davies@example.com',21,'Mill Road','Bristol','BS1 2EL',51.4545,-2.5879),(7,'James','Evans','james.evans@example.com',43,'King Street','Edinburgh','EH1 1BB',55.9533,-3.1892),(8,'Sophia','Thomas','sophia.thomas@example.com',65,'Queen Street','Glasgow','G1 2HL',55.8611,-4.2500),(9,'Michael','Roberts','michael.roberts@example.com',87,'Victoria Road','Liverpool','L1 3BT',53.4075,-2.9919),(10,'Charlotte','Johnson','charlotte.johnson@example.com',109,'New Street','Birmingham','B1 1AA',52.4800,-1.9025),(11,'Jack','Walker','jack.walker@example.com',112,'Main Street','York','YO1 7QR',53.9500,-1.0833),(12,'Mia','Harris','mia.harris@example.com',58,'Broad Street','Bath, Somerset','BA1 5LR',51.3814,-2.3586),(13,'Charlie','Clark','charlie.clark@example.com',74,'Market Street','Nottingham','NG1 6FG',52.9550,-1.1492),(14,'Poppy','Lewis','poppy.lewis@example.com',89,'Bridge Street','Chester','CH1 2NH',53.2000,-2.8833),(15,'Thomas','Robinson','thomas.robinson@example.com',27,'South Street','Brighton','BN1 3AF',50.8208,-0.1375),(16,'Ava','Scott','ava.scott@example.com',36,'North Road','Plymouth','PL1 4FF',50.3714,-4.1422),(17,'Daniel','Adams','daniel.adams@example.com',45,'West Street','Norwich','NR2 3DU',52.6286,1.2928),(18,'Ella','Hill','ella.hill@example.com',59,'East Street','Exeter','EX4 3NW',50.7256,-3.5269),(19,'William','Green','william.green@example.com',70,'College Road','Durham, England','DH1 3LZ',54.7833,-1.5667),(20,'Grace','Baker','grace.baker@example.com',81,'London Road','Sheffield','S1 2PP',53.3808,-1.4703),(21,'Henry','King','henry.king@example.com',93,'Church Street','Newcastle upon Tyne','NE1 1XE',54.9778,-1.6133),(22,'Freya','Wright','freya.wright@example.com',104,'Queens Road','Southampton','SO1 3DP',50.9067,-1.4044),(23,'Alexander','Turner','alexander.turner@example.com',29,'Victoria Street','Portsmouth','PO1 5HA',50.8058,-1.0872),(24,'Emily','Collins','emily.collins@example.com',38,'Oxford Street','Reading, Berkshire','RG1 7LY',51.4542,-0.9731),(25,'Jacob','Stewart','jacob.stewart@example.com',47,'Richmond Road','Coventry','CV1 2JH',52.4167,-1.5167),(26,'Jessica','Morris','jessica.morris@example.com',56,'Regent Street','Cardiff','CF10 2HE',51.4817,-3.1792),(27,'Oscar','Cook','oscar.cook@example.com',65,'York Road','Aberdeen','AB10 1AN',57.1500,-2.1000),(28,'Lily','Bailey','lily.bailey@example.com',74,'Park Road','Swansea','SA1 4AA',51.6167,-3.9500),(29,'Joshua','Hughes','joshua.hughes@example.com',83,'Market Place','Leicester','LE1 5GG',52.6333,-1.1333),(30,'Megan','Morgan','megan.morgan@example.com',92,'Mill Street','Derby','DE1 3AY',52.9217,-1.4767),(31,'Ethan','Bell','ethan.bell@example.com',37,'Castle Street','Lincoln, England','LN1 3DP',53.2500,-0.5500),(32,'Isla','Foster','isla.foster@example.com',24,'Duke Street','Winchester','SO23 8UH',51.0633,-1.3086),(33,'Leo','Carter','leo.carter@example.com',51,'Crown Street','Worcester','WR1 3JY',52.1941,-2.2191),(34,'Sophie','Allen','sophie.allen@example.com',68,'Kingston Road','Guildford','GU1 3PT',51.2354,-0.5746),(35,'Alfie','Wood','alfie.wood@example.com',75,'Chester Road','Preston, Lancashire','PR1 3LT',53.7594,-2.6981),(36,'Chloe','Perry','chloe.perry@example.com',19,'Windmill Street','Sunderland','SR1 3HA',54.9000,-1.3803),(37,'Benjamin','Martin','benjamin.martin@example.com',83,'Church Road','Kingston upon Hull','HU1 1SP',53.7444,-0.3325),(38,'Hannah','Edwards','hannah.edwards@example.com',47,'Green Lane','Stoke-on-Trent','ST1 5GH',53.0000,-2.1833),(39,'Mason','Murray','mason.murray@example.com',52,'Silver Street','Blackpool','FY1 3DE',53.8167,-3.0500),(40,'Evie','Clarke','evie.clarke@example.com',61,'Bridge Road','Luton','LU1 2LN',51.8783,-0.4147),(41,'Lucas','White','lucas.white@example.com',15,'Highfield Road','Bradford','BD1 2QR',53.7940,-1.7510),(42,'Holly','Harrison','holly.harrison@example.com',30,'Elm Street','Middlesbrough','TS1 3BX',54.5742,-1.2356),(43,'Edward','Phillips','edward.phillips@example.com',72,'Cedar Avenue','Wolverhampton','WV1 3YY',52.5833,-2.1333),(44,'Lucy','Campbell','lucy.campbell@example.com',48,'Maple Street','Ipswich','IP1 1BZ',52.0592,1.1551),(45,'Isaac','Mitchell','isaac.mitchell@example.com',94,'Willow Road','Dudley','DY1 1HJ',52.5086,-2.0875),(46,'Erin','Patel','erin.patel@example.com',85,'Ash Lane','Woking','GU21 6ND',51.3167,-0.5600),(47,'Joseph','Adams','joseph.adams@example.com',59,'Birch Close','Stockton-on-Tees','TS18 3DD',54.5667,-1.2833),(48,'Florence','Evans','florence.evans@example.com',46,'Pine Street','Newport','NP20 1FJ',51.5877,-2.9984),(49,'Theodore','Bennett','theodore.bennett@example.com',27,'Cypress Road','Warrington','WA1 1AD',53.3920,-2.5860),(50,'Harriet','Parker','harriet.parker@example.com',10,'Poplar Street','Southend-on-Sea','SS1 1XY',51.5378,0.7142),(51,'Olivia','Wright','olivia.wright@example.com',32,'Park Avenue','Leicester','LE1 4PH',52.6333,-1.1333),(52,'Arthur','Scott','arthur.scott@example.com',54,'Station Road','Cambridge','CB1 3DF',52.2081,0.1225),(53,'Aria','Mitchell','aria.mitchell@example.com',76,'High Street','Oxford','OX1 5JW',51.7519,-1.2578),(54,'Logan','Webb','logan.webb@example.com',98,'Queen Street','Glasgow','G1 1SL',55.8611,-4.2500),(55,'Layla','Green','layla.green@example.com',45,'Main Street','York','YO1 6LX',53.9500,-1.0833),(56,'Elijah','King','elijah.king@example.com',67,'Broad Street','Bath, Somerset','BA1 6UD',51.3814,-2.3586),(57,'Amelia','Young','amelia.young@example.com',89,'Market Street','Nottingham','NG1 7PT',52.9550,-1.1492),(58,'Aiden','Hill','aiden.hill@example.com',21,'Bridge Street','Chester','CH1 4JG',53.2000,-2.8833),(59,'Penelope','Mitchell','penelope.mitchell@example.com',43,'South Street','Brighton','BN1 4HP',50.8208,-0.1375),(60,'Mateo','Parker','mateo.parker@example.com',65,'North Road','Plymouth','PL1 5PY',50.3714,-4.1422),(61,'Ella','Coleman','ella.coleman@example.com',87,'West Street','Norwich','NR2 4XT',52.6286,1.2928),(62,'Grayson','Lloyd','grayson.lloyd@example.com',19,'East Street','Exeter','EX4 4GL',50.7256,-3.5269),(63,'Scarlett','Foster','scarlett.foster@example.com',32,'College Road','Durham, England','DH1 4RL',54.7833,-1.5667),(64,'Lucas','Owen','lucas.owen@example.com',54,'London Road','Sheffield','S1 3JY',53.3808,-1.4703),(65,'Stella','Bishop','stella.bishop@example.com',76,'Church Street','Newcastle upon Tyne','NE1 2UD',54.9778,-1.6133),(66,'Jackson','Dixon','jackson.dixon@example.com',98,'Queens Road','Southampton','SO1 4RF',50.9067,-1.4044),(67,'Nora','Grant','nora.grant@example.com',21,'Victoria Street','Portsmouth','PO1 6EJ',50.8058,-1.0872),(68,'Levi','Rose','levi.rose@example.com',43,'Oxford Street','Reading, Berkshire','RG1 8UG',51.4542,-0.9731),(69,'Mila','Stone','mila.stone@example.com',65,'Richmond Road','Coventry','CV1 3TT',52.4167,-1.5167),(70,'Asher','Ferguson','asher.ferguson@example.com',87,'Regent Street','Cardiff','CF10 4PZ',51.4817,-3.1792),(71,'Elizabeth','Walsh','elizabeth.walsh@example.com',32,'York Road','Aberdeen','AB10 2GW',57.1500,-2.1000),(72,'Owen','Mills','owen.mills@example.com',54,'Park Road','Swansea','SA1 5TP',51.6167,-3.9500),(73,'Luna','Nicholson','luna.nicholson@example.com',76,'Market Place','Leicester','LE1 6PQ',52.6333,-1.1333),(74,'Carter','Parker','carter.parker@example.com',98,'Mill Street','Derby','DE1 4AB',52.9217,-1.4767),(75,'Nova','Flynn','nova.flynn@example.com',21,'Castle Street','Lincoln, England','LN1 4XT',53.2500,-0.5500),(76,'Hunter','Newton','hunter.newton@example.com',43,'Duke Street','Winchester','SO23 9DN',51.0633,-1.3086),(77,'Riley','Woods','riley.woods@example.com',65,'Crown Street','Worcester','WR1 4NY',52.1941,-2.2191),(78,'Zoe','Barnes','zoe.barnes@example.com',87,'Kingston Road','Guildford','GU1 4TF',51.2354,-0.5746),(79,'Axel','Fuller','axel.fuller@example.com',19,'Chester Road','Preston, Lancashire','PR1 4YA',53.7594,-2.6981),(80,'Ivy','Hunter','ivy.hunter@example.com',32,'Windmill Street','Sunderland','SR1 4JW',54.9000,-1.3803),(81,'Zachary','Mills','zachary.mills@example.com',54,'Church Road','Kingston upon Hull','HU1 2WD',53.7444,-0.3325),(82,'Madelyn','Ross','madelyn.ross@example.com',76,'Green Lane','Stoke-on-Trent','ST1 6TP',53.0000,-2.1833),(83,'Gavin','Rose','gavin.rose@example.com',98,'Silver Street','Blackpool','FY1 4PY',53.8167,-3.0500),(84,'Hudson','Newton','hudson.newton@example.com',21,'Bridge Road','Luton','LU1 4DZ',51.8783,-0.4147),(85,'Claire','Chapman','claire.chapman@example.com',43,'Highfield Road','Bradford','BD1 3TX',53.7940,-1.7510),(86,'Bentley','Baker','bentley.baker@example.com',65,'Elm Street','Middlesbrough','TS1 4AB',54.5742,-1.2356),(87,'Zara','Barnes','zara.barnes@example.com',87,'Cedar Avenue','Wolverhampton','WV1 4YF',52.5833,-2.1333),(88,'Kai','Hayes','kai.hayes@example.com',19,'Maple Street','Ipswich','IP1 2WQ',52.0592,1.1551),(89,'Piper','Mills','piper.mills@example.com',32,'Willow Road','Dudley','DY1 2DF',52.5086,-2.0875),(90,'Bryson','Rogers','bryson.rogers@example.com',54,'Ash Lane','Woking','GU21 4ND',51.3167,-0.5600),(91,'Emery','Adams','emery.adams@example.com',76,'Birch Close','Stockton-on-Tees','TS18 4RF',54.5667,-1.2833),(92,'Anastasia','Evans','anastasia.evans@example.com',98,'Pine Street','Newport','NP20 2QW',51.5877,-2.9984),(93,'Ezekiel','Bennett','ezekiel.bennett@example.com',21,'Cypress Road','Warrington','WA1 2BN',53.3920,-2.5860),(94,'Adeline','Parker','adeline.parker@example.com',43,'Poplar Street','Southend-on-Sea','SS1 2XY',51.5378,0.7142),(95,'Harrison','Wright','harrison.wright@example.com',65,'Park Avenue','Leicester','LE1 5PH',52.6333,-1.1333),(96,'Aubrey','Scott','aubrey.scott@example.com',87,'Station Road','Cambridge','CB1 4DF',52.2081,0.1225),(97,'Brooklyn','Mitchell','brooklyn.mitchell@example.com',19,'High Street','Oxford','OX1 6JW',51.7519,-1.2578),(98,'Eli','Webb','eli.webb@example.com',32,'Queen Street','Glasgow','G1 2SL',55.8611,-4.2500),(99,'Alyssa','Green','alyssa.green@example.com',54,'Main Street','York','YO1 7LX',53.9500,-1.0833),(100,'Hayden','King','hayden.king@example.com',76,'Broad Street','Bath, Somerset','BA1 7UD',51.3814,-2.3586);
/*!40000 ALTER TABLE `Customers` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `CustomerInformationCompliance` BEFORE INSERT ON `customers` FOR EACH ROW BEGIN
	SET NEW.first_name = CONCAT(UPPER(SUBSTRING(NEW.first_name,1,1)),
						LOWER(SUBSTRING(NEW.first_name FROM 2)));
	SET NEW.last_name = CONCAT(UPPER(SUBSTRING(NEW.last_name,1,1)),
						LOWER(SUBSTRING(NEW.last_name FROM 2)));
	SET NEW.email = LOWER(NEW.email);
	SET NEW.postcode = UPPER(NEW.postcode);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `DailySalesReport`
--

DROP TABLE IF EXISTS `DailySalesReport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DailySalesReport` (
  `dsr_id` int NOT NULL AUTO_INCREMENT,
  `reportdate` date NOT NULL,
  `salescount` int DEFAULT NULL,
  `salesrevenue` int DEFAULT NULL,
  PRIMARY KEY (`dsr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DailySalesReport`
--

LOCK TABLES `DailySalesReport` WRITE;
/*!40000 ALTER TABLE `DailySalesReport` DISABLE KEYS */;
INSERT INTO `DailySalesReport` VALUES (1,'2024-07-21',0,NULL);
/*!40000 ALTER TABLE `DailySalesReport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Gift`
--

DROP TABLE IF EXISTS `Gift`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Gift` (
  `gift_id` int NOT NULL AUTO_INCREMENT,
  `giftsection` varchar(55) NOT NULL,
  `gifttype` varchar(55) NOT NULL,
  `giftsize` varchar(55) NOT NULL,
  `giftprice` decimal(4,2) NOT NULL,
  PRIMARY KEY (`gift_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Gift`
--

LOCK TABLES `Gift` WRITE;
/*!40000 ALTER TABLE `Gift` DISABLE KEYS */;
INSERT INTO `Gift` VALUES (1,'Alcohol','Beer Pack','Large',15.00),(2,'Alcohol','Wine','Medium',17.00),(3,'Balloons','Bunch','Large',30.00),(4,'Balloons','Large','Medium',15.00),(5,'Balloons','Small','Small',10.00),(6,'Chocolate','Bar','Small',4.00),(7,'Chocolate','Box','Medium',12.00),(8,'Flowers','Large Bouquet','Medium',40.00),(9,'Flowers','Small Bouquet','Medium',25.00);
/*!40000 ALTER TABLE `Gift` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Postage`
--

DROP TABLE IF EXISTS `Postage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Postage` (
  `postage_id` int NOT NULL AUTO_INCREMENT,
  `postage` varchar(55) NOT NULL,
  `postageprice` decimal(4,2) NOT NULL,
  PRIMARY KEY (`postage_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Postage`
--

LOCK TABLES `Postage` WRITE;
/*!40000 ALTER TABLE `Postage` DISABLE KEYS */;
INSERT INTO `Postage` VALUES (1,'1st Class',1.35),(2,'2nd Class',0.85),(3,'Small Parcel',3.99),(4,'Medium Parcel',5.49),(5,'Large Parcel',7.19);
/*!40000 ALTER TABLE `Postage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sales`
--

DROP TABLE IF EXISTS `Sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sales` (
  `sales_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `cardsize_id` int NOT NULL,
  `cardoccasion_id` int NOT NULL,
  `cardtheme_id` int NOT NULL,
  `gift_id` int DEFAULT NULL,
  `postage_id` int NOT NULL,
  `adtarget_id` int NOT NULL,
  `timestamp` date NOT NULL,
  PRIMARY KEY (`sales_id`),
  KEY `fk_customer_id2` (`customer_id`),
  KEY `fk_cardsize_id` (`cardsize_id`),
  KEY `fk_cardoccasion_id` (`cardoccasion_id`),
  KEY `fk_cardtheme_id` (`cardtheme_id`),
  KEY `fk_gift_id` (`gift_id`),
  KEY `fk_postage_id` (`postage_id`),
  KEY `fk_adtarget_id` (`adtarget_id`),
  CONSTRAINT `fk_adtarget_id` FOREIGN KEY (`adtarget_id`) REFERENCES `ADTargeting` (`adtarget_id`),
  CONSTRAINT `fk_cardoccasion_id` FOREIGN KEY (`cardoccasion_id`) REFERENCES `CardOccasion` (`cardoccasion_id`),
  CONSTRAINT `fk_cardsize_id` FOREIGN KEY (`cardsize_id`) REFERENCES `CardSize` (`cardsize_id`),
  CONSTRAINT `fk_cardtheme_id` FOREIGN KEY (`cardtheme_id`) REFERENCES `CardTheme` (`cardtheme_id`),
  CONSTRAINT `fk_customer_id2` FOREIGN KEY (`customer_id`) REFERENCES `Customers` (`customer_id`),
  CONSTRAINT `fk_gift_id` FOREIGN KEY (`gift_id`) REFERENCES `Gift` (`gift_id`),
  CONSTRAINT `fk_postage_id` FOREIGN KEY (`postage_id`) REFERENCES `Postage` (`postage_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sales`
--

LOCK TABLES `Sales` WRITE;
/*!40000 ALTER TABLE `Sales` DISABLE KEYS */;
INSERT INTO `Sales` VALUES (1,87,3,10,7,7,4,4,'2024-01-01'),(2,16,2,4,7,1,5,2,'2024-01-01'),(3,44,2,17,2,2,4,3,'2024-01-01'),(4,46,1,22,5,7,4,1,'2024-01-01'),(5,76,3,23,1,1,5,2,'2024-01-01'),(6,61,3,7,5,4,4,1,'2024-01-01'),(7,13,4,20,2,5,3,3,'2024-01-01'),(8,53,4,13,7,6,3,2,'2024-01-01'),(9,74,2,21,4,4,4,3,'2024-01-02'),(10,46,3,8,1,NULL,1,2,'2024-01-02'),(11,32,1,18,4,6,3,2,'2024-01-02'),(12,23,2,11,7,3,5,3,'2024-01-02'),(13,26,3,16,7,3,5,3,'2024-01-02'),(14,48,1,4,7,2,4,3,'2024-01-02'),(15,19,4,4,2,8,4,3,'2024-01-03'),(16,42,3,17,6,7,4,1,'2024-01-03'),(17,83,4,5,5,2,4,1,'2024-01-03'),(18,34,2,21,4,4,4,2,'2024-01-03'),(19,83,4,24,5,4,4,2,'2024-01-04'),(20,54,2,12,6,4,4,3,'2024-01-04'),(21,100,3,15,5,2,4,3,'2024-01-04'),(22,42,4,11,5,7,4,2,'2024-01-04'),(23,11,2,13,5,9,4,1,'2024-01-04'),(24,11,2,9,7,5,3,3,'2024-01-04'),(25,38,3,2,6,9,4,2,'2024-01-04'),(26,27,3,11,5,NULL,2,4,'2024-01-04'),(27,37,4,24,3,5,3,4,'2024-01-05'),(28,49,3,15,2,NULL,1,2,'2024-01-05'),(29,16,2,1,7,6,3,2,'2024-01-05'),(30,86,4,21,6,NULL,1,1,'2024-01-05'),(31,66,3,14,7,2,4,1,'2024-01-05'),(32,18,2,24,2,6,3,3,'2024-01-05'),(33,11,1,12,1,8,4,1,'2024-01-05'),(34,22,2,2,7,NULL,2,1,'2024-01-06'),(35,22,4,22,5,9,4,3,'2024-01-06'),(36,16,4,22,1,5,3,1,'2024-01-06'),(37,70,3,24,6,9,4,1,'2024-01-06'),(38,90,1,11,2,1,5,3,'2024-01-06'),(39,2,2,18,2,NULL,2,4,'2024-01-06'),(40,72,4,14,5,NULL,1,4,'2024-01-06'),(41,20,2,19,7,5,3,2,'2024-01-07'),(42,21,2,6,3,1,5,2,'2024-01-07'),(43,17,2,2,4,2,4,3,'2024-01-07'),(44,14,1,9,1,2,4,3,'2024-01-07'),(45,55,2,2,7,8,4,3,'2024-01-08'),(46,34,1,10,5,2,4,2,'2024-01-08'),(47,16,3,1,2,1,5,4,'2024-01-08'),(48,16,3,20,7,3,5,3,'2024-01-08'),(49,88,1,1,1,5,3,4,'2024-01-08'),(50,45,2,12,1,1,5,2,'2024-01-09'),(51,61,4,7,4,1,5,4,'2024-01-09'),(52,60,3,11,6,8,4,1,'2024-01-09'),(53,39,1,17,3,NULL,1,3,'2024-01-10'),(54,47,2,23,6,9,4,3,'2024-01-10'),(55,40,3,22,7,3,5,1,'2024-01-10'),(56,33,4,21,6,NULL,1,3,'2024-01-10'),(57,100,1,15,1,7,4,1,'2024-01-10'),(58,17,2,19,3,5,3,1,'2024-01-10'),(59,53,1,13,2,4,4,3,'2024-01-11'),(60,66,2,8,1,2,4,4,'2024-01-11'),(61,84,3,18,2,NULL,1,4,'2024-01-11'),(62,85,3,11,2,2,4,4,'2024-01-11'),(63,97,2,13,5,5,3,2,'2024-01-11'),(64,99,4,10,4,2,4,2,'2024-01-11'),(65,73,1,5,7,5,3,1,'2024-01-12'),(66,98,2,17,3,8,4,1,'2024-01-12'),(67,87,4,8,6,1,5,1,'2024-01-12'),(68,60,3,8,5,6,3,2,'2024-01-12'),(69,2,2,5,6,3,5,4,'2024-01-12'),(70,54,2,21,1,1,5,1,'2024-01-12'),(71,62,1,4,4,3,5,3,'2024-01-12'),(72,29,4,24,7,6,3,4,'2024-01-14'),(73,7,3,1,2,7,4,1,'2024-01-14'),(74,85,2,4,5,1,5,1,'2024-01-14'),(75,49,2,14,4,7,4,1,'2024-01-14'),(76,7,2,18,2,7,4,2,'2024-01-14'),(77,78,4,11,6,1,5,3,'2024-01-14'),(78,82,3,18,6,5,3,4,'2024-01-15'),(79,88,1,1,4,1,5,2,'2024-01-15'),(80,74,1,5,3,4,4,3,'2024-01-15'),(81,89,2,2,7,NULL,1,1,'2024-01-15'),(82,97,1,8,1,1,5,2,'2024-01-15'),(83,61,2,3,4,5,3,4,'2024-01-15'),(84,93,4,22,5,9,4,1,'2024-01-16'),(85,20,3,15,5,1,5,4,'2024-01-16'),(86,41,3,7,6,6,3,1,'2024-01-17'),(87,90,1,16,4,8,4,1,'2024-01-17'),(88,31,2,17,7,1,5,1,'2024-01-17'),(89,74,3,16,7,2,4,1,'2024-01-17'),(90,1,3,18,5,4,4,1,'2024-01-17'),(91,34,3,11,7,3,5,2,'2024-01-17'),(92,90,3,6,3,8,4,3,'2024-01-17'),(93,86,2,23,5,9,4,4,'2024-01-18'),(94,16,1,22,2,2,4,4,'2024-01-18'),(95,7,4,20,1,NULL,2,1,'2024-01-18'),(96,58,1,6,3,7,4,4,'2024-01-18'),(97,70,3,17,2,8,4,4,'2024-01-19'),(98,71,1,24,4,7,4,3,'2024-01-19'),(99,93,1,6,4,5,3,1,'2024-01-19'),(100,49,2,21,5,3,5,1,'2024-01-19'),(101,12,1,3,7,NULL,2,2,'2024-01-20'),(102,53,4,22,1,8,4,4,'2024-01-20'),(103,98,3,5,5,9,4,3,'2024-01-20'),(104,33,1,22,6,8,4,2,'2024-01-20'),(105,48,1,6,1,1,5,2,'2024-01-20'),(106,91,4,1,3,1,5,4,'2024-01-20'),(107,85,1,23,3,2,4,1,'2024-01-21'),(108,74,3,15,4,8,4,3,'2024-01-21'),(109,14,2,9,4,3,5,1,'2024-01-21'),(110,76,4,1,1,3,5,1,'2024-01-21'),(111,75,4,23,7,7,4,2,'2024-01-21'),(112,31,4,16,3,1,5,2,'2024-01-21'),(113,79,2,5,1,5,3,1,'2024-01-21'),(114,4,3,17,7,6,3,2,'2024-01-21'),(115,68,2,24,7,9,4,1,'2024-01-22'),(116,65,3,24,3,2,4,1,'2024-01-22'),(117,99,4,2,5,6,3,4,'2024-01-22'),(118,11,2,3,5,NULL,1,3,'2024-01-22'),(119,28,3,22,2,3,5,2,'2024-01-22'),(120,29,4,10,2,9,4,2,'2024-01-22'),(121,65,3,4,7,6,3,3,'2024-01-22'),(122,13,2,6,3,NULL,1,1,'2024-01-22'),(123,96,1,24,5,2,4,3,'2024-01-23'),(124,11,4,20,4,2,4,2,'2024-01-23'),(125,8,4,17,6,3,5,2,'2024-01-23'),(126,84,4,5,5,5,3,4,'2024-01-23'),(127,3,1,12,5,9,4,2,'2024-01-23'),(128,50,3,5,2,1,5,3,'2024-01-23'),(129,97,1,20,4,5,3,3,'2024-01-24'),(130,34,1,17,7,7,4,1,'2024-01-24'),(131,9,3,1,6,3,5,3,'2024-01-24'),(132,88,1,10,7,NULL,2,2,'2024-01-24'),(133,91,3,8,5,7,4,4,'2024-01-25'),(134,36,4,10,7,3,5,1,'2024-01-25'),(135,18,4,23,5,4,4,3,'2024-01-25'),(136,96,2,18,4,6,3,2,'2024-01-25'),(137,95,2,22,7,NULL,2,2,'2024-01-25'),(138,53,3,10,3,NULL,1,4,'2024-01-26'),(139,61,4,12,2,6,3,1,'2024-01-26'),(140,83,4,21,3,8,4,4,'2024-01-26'),(141,48,4,19,3,6,3,3,'2024-01-26'),(142,90,2,17,6,8,4,1,'2024-01-26'),(143,64,1,19,6,4,4,1,'2024-01-26'),(144,78,3,12,7,9,4,2,'2024-01-27'),(145,48,1,22,2,4,4,2,'2024-01-27'),(146,14,3,19,4,1,5,3,'2024-01-27'),(147,71,3,15,7,8,4,3,'2024-01-27'),(148,20,3,20,5,3,5,1,'2024-01-27'),(149,95,4,23,1,1,5,3,'2024-01-27'),(150,36,1,3,2,NULL,1,4,'2024-01-28'),(151,13,1,23,4,6,3,4,'2024-01-28'),(152,84,2,18,4,9,4,3,'2024-01-28'),(153,69,1,13,4,3,5,1,'2024-01-28'),(154,59,2,16,3,3,5,4,'2024-01-29'),(155,56,2,23,2,NULL,1,1,'2024-01-29'),(156,75,2,14,2,NULL,2,1,'2024-01-29'),(157,21,4,13,2,2,4,3,'2024-01-29'),(158,41,1,9,5,9,4,3,'2024-01-29'),(159,37,3,11,6,8,4,1,'2024-01-29'),(160,51,2,17,1,4,4,1,'2024-01-29'),(161,13,4,20,4,3,5,4,'2024-01-29'),(162,12,2,20,2,3,5,4,'2024-01-30'),(163,60,2,9,7,NULL,1,3,'2024-01-30'),(164,14,4,20,2,NULL,2,2,'2024-01-30'),(165,67,4,21,1,9,4,2,'2024-01-30'),(166,13,3,5,6,NULL,1,1,'2024-01-30'),(167,12,2,19,7,4,4,2,'2024-01-30'),(168,4,2,10,2,9,4,2,'2024-01-30'),(169,59,4,17,6,1,5,3,'2024-01-30'),(170,23,1,15,4,5,3,1,'2024-01-31'),(171,50,4,5,4,7,4,1,'2024-01-31'),(172,53,4,2,5,4,4,3,'2024-01-31'),(173,81,2,2,7,5,3,2,'2024-02-01'),(174,59,1,15,7,9,4,2,'2024-02-01'),(175,84,1,21,5,2,4,3,'2024-02-01'),(176,85,4,8,1,NULL,2,4,'2024-02-01'),(177,61,2,4,4,4,4,2,'2024-02-01'),(178,10,4,9,6,5,3,4,'2024-02-02'),(179,26,2,14,7,5,3,2,'2024-02-02'),(180,9,3,19,4,2,4,2,'2024-02-02'),(181,59,2,15,1,4,4,3,'2024-02-02'),(182,97,1,23,3,1,5,3,'2024-02-02'),(183,55,3,10,5,2,4,2,'2024-02-02'),(184,69,3,9,7,3,5,3,'2024-02-03'),(185,95,2,17,4,2,4,1,'2024-02-03'),(186,75,4,22,3,7,4,4,'2024-02-03'),(187,83,2,19,7,3,5,3,'2024-02-03'),(188,10,2,20,6,4,4,1,'2024-02-04'),(189,100,2,19,2,1,5,1,'2024-02-04'),(190,82,3,19,6,NULL,2,2,'2024-02-04'),(191,56,2,19,5,8,4,3,'2024-02-05'),(192,69,2,18,4,NULL,2,4,'2024-02-05'),(193,74,4,2,5,3,5,1,'2024-02-05'),(194,40,2,3,3,5,3,4,'2024-02-05'),(195,8,4,11,3,7,4,1,'2024-02-05'),(196,5,2,1,3,4,4,2,'2024-02-06'),(197,27,1,13,3,6,3,1,'2024-02-06'),(198,87,3,13,1,1,5,2,'2024-02-06'),(199,33,4,3,1,5,3,3,'2024-02-06'),(200,95,4,14,3,NULL,2,4,'2024-02-06'),(201,4,3,20,5,6,3,4,'2024-02-06'),(202,45,2,18,1,3,5,1,'2024-02-06'),(203,33,1,8,7,7,4,3,'2024-02-07'),(204,99,3,6,7,NULL,1,1,'2024-02-07'),(205,84,2,5,6,6,3,4,'2024-02-07'),(206,86,3,22,3,8,4,2,'2024-02-08'),(207,3,4,18,6,2,4,4,'2024-02-08'),(208,28,4,3,6,1,5,1,'2024-02-08'),(209,38,2,7,5,NULL,1,2,'2024-02-08'),(210,37,2,10,1,7,4,3,'2024-02-09'),(211,91,2,20,4,9,4,2,'2024-02-09'),(212,3,1,9,6,5,3,2,'2024-02-10'),(213,28,3,22,3,8,4,3,'2024-02-10'),(214,86,2,12,1,7,4,3,'2024-02-10'),(215,33,4,13,3,7,4,3,'2024-02-10'),(216,19,2,18,7,5,3,2,'2024-02-10'),(217,75,2,3,1,3,5,3,'2024-02-11'),(218,48,3,15,1,5,3,2,'2024-02-11'),(219,94,4,18,1,1,5,1,'2024-02-11'),(220,45,3,1,1,6,3,1,'2024-02-11'),(221,26,3,7,2,8,4,2,'2024-02-11'),(222,72,4,11,3,3,5,2,'2024-02-11'),(223,76,2,5,7,NULL,2,2,'2024-02-11'),(224,82,4,9,1,4,4,2,'2024-02-11'),(225,97,2,15,1,5,3,4,'2024-02-11'),(226,75,1,3,3,NULL,1,1,'2024-02-11'),(227,75,4,4,3,6,3,2,'2024-02-12'),(228,51,3,23,4,9,4,3,'2024-02-12'),(229,100,3,12,2,NULL,1,3,'2024-02-12'),(230,21,1,13,6,6,3,2,'2024-02-12'),(231,13,2,2,7,2,4,3,'2024-02-12'),(232,36,4,1,4,2,4,2,'2024-02-12'),(233,54,4,21,7,7,4,2,'2024-02-12'),(234,54,1,1,7,1,5,1,'2024-02-13'),(235,18,4,16,6,6,3,1,'2024-02-13'),(236,87,4,23,4,2,4,1,'2024-02-13'),(237,50,4,21,3,4,4,2,'2024-02-13'),(238,30,1,11,4,NULL,2,2,'2024-02-13'),(239,60,3,8,3,8,4,1,'2024-02-14'),(240,66,1,3,3,3,5,4,'2024-02-14'),(241,18,3,11,4,8,4,3,'2024-02-14'),(242,21,2,20,6,5,3,1,'2024-02-14'),(243,47,4,13,3,2,4,2,'2024-02-14'),(244,10,4,12,2,4,4,4,'2024-02-14'),(245,37,2,14,6,9,4,3,'2024-02-14'),(246,60,2,18,1,5,3,4,'2024-02-14'),(247,9,4,23,4,1,5,4,'2024-02-14'),(248,53,3,3,4,2,4,1,'2024-02-15'),(249,89,1,11,5,9,4,1,'2024-02-15'),(250,82,2,4,4,9,4,4,'2024-02-15'),(251,99,1,12,3,NULL,2,4,'2024-02-15'),(252,32,4,9,5,6,3,2,'2024-02-15'),(253,5,2,8,4,7,4,3,'2024-02-15'),(254,51,4,10,2,1,5,4,'2024-02-15'),(255,74,2,17,4,1,5,4,'2024-02-15'),(256,67,3,11,1,4,4,1,'2024-02-15'),(257,73,4,17,7,3,5,3,'2024-02-15'),(258,51,4,21,1,4,4,2,'2024-02-15'),(259,20,3,17,5,7,4,3,'2024-02-15'),(260,78,1,4,2,6,3,4,'2024-02-16'),(261,4,3,19,4,NULL,2,4,'2024-02-16'),(262,74,4,14,5,2,4,4,'2024-02-16'),(263,43,1,9,3,1,5,4,'2024-02-16'),(264,51,4,14,4,8,4,4,'2024-02-16'),(265,21,3,24,7,2,4,3,'2024-02-16'),(266,87,2,23,5,6,3,2,'2024-02-16'),(267,3,4,7,6,8,4,4,'2024-02-16'),(268,6,3,14,4,1,5,1,'2024-02-17'),(269,18,2,1,4,6,3,2,'2024-02-17'),(270,82,2,13,6,9,4,3,'2024-02-18'),(271,37,1,12,6,6,3,1,'2024-02-18'),(272,15,4,5,1,6,3,1,'2024-02-18'),(273,56,3,12,2,9,4,1,'2024-02-18'),(274,96,2,1,6,3,5,4,'2024-02-18'),(275,94,2,1,2,7,4,3,'2024-02-19'),(276,74,1,6,1,NULL,1,1,'2024-02-19'),(277,29,2,21,4,4,4,4,'2024-02-19'),(278,12,3,1,4,8,4,1,'2024-02-19'),(279,92,2,10,4,6,3,2,'2024-02-19'),(280,93,3,21,1,5,3,3,'2024-02-20'),(281,4,3,16,4,2,4,1,'2024-02-20'),(282,75,2,18,4,1,5,1,'2024-02-20'),(283,48,2,12,4,6,3,3,'2024-02-20'),(284,64,1,19,4,8,4,1,'2024-02-20'),(285,27,1,23,6,2,4,3,'2024-02-21'),(286,10,2,21,6,8,4,3,'2024-02-22'),(287,69,3,14,2,8,4,4,'2024-02-22'),(288,78,2,6,3,4,4,4,'2024-02-22'),(289,97,2,21,1,6,3,1,'2024-02-22'),(290,15,3,7,5,2,4,3,'2024-02-22'),(291,100,2,9,6,8,4,2,'2024-02-22'),(292,81,2,21,2,5,3,1,'2024-02-23'),(293,76,2,19,4,2,4,4,'2024-02-23'),(294,23,2,2,5,7,4,4,'2024-02-23'),(295,40,1,9,4,1,5,2,'2024-02-24'),(296,93,2,20,2,6,3,3,'2024-02-24'),(297,82,3,6,5,5,3,4,'2024-02-24'),(298,9,3,1,5,2,4,3,'2024-02-24'),(299,9,1,23,7,3,5,4,'2024-02-24'),(300,48,1,7,6,4,4,2,'2024-02-24'),(301,41,1,3,3,NULL,1,3,'2024-02-24'),(302,36,4,6,2,5,3,3,'2024-02-24'),(303,17,2,13,6,5,3,1,'2024-02-24'),(304,23,4,6,7,7,4,3,'2024-02-25'),(305,23,4,15,7,9,4,2,'2024-02-25'),(306,83,3,6,6,3,5,4,'2024-02-25'),(307,65,1,6,4,6,3,2,'2024-02-25'),(308,38,4,14,4,9,4,3,'2024-02-25'),(309,52,4,8,4,5,3,4,'2024-02-25'),(310,29,1,7,4,5,3,1,'2024-02-25'),(311,35,4,4,2,1,5,2,'2024-02-25'),(312,84,4,20,1,2,4,1,'2024-02-25'),(313,59,3,6,2,3,5,1,'2024-02-25'),(314,72,3,21,1,NULL,2,2,'2024-02-25'),(315,1,4,8,2,6,3,4,'2024-02-25'),(316,71,1,12,1,3,5,1,'2024-02-26'),(317,18,4,8,7,7,4,4,'2024-02-26'),(318,35,2,9,6,1,5,2,'2024-02-26'),(319,7,2,20,3,1,5,1,'2024-02-26'),(320,23,4,14,1,1,5,2,'2024-02-26'),(321,46,2,8,5,7,4,4,'2024-02-26'),(322,15,2,3,3,4,4,1,'2024-02-27'),(323,97,3,1,5,5,3,1,'2024-02-27'),(324,64,4,20,7,9,4,3,'2024-02-27'),(325,85,4,9,7,3,5,3,'2024-02-27'),(326,55,3,17,2,6,3,4,'2024-02-27'),(327,48,1,13,3,9,4,2,'2024-02-28'),(328,27,4,12,3,4,4,2,'2024-02-28'),(329,6,2,16,1,6,3,2,'2024-02-28'),(330,45,2,16,1,9,4,1,'2024-02-28'),(331,9,1,19,3,6,3,4,'2024-02-28'),(332,40,3,2,1,4,4,2,'2024-02-28'),(333,38,2,13,2,3,5,4,'2024-02-28'),(334,26,3,2,5,3,5,1,'2024-02-29'),(335,66,2,2,4,4,4,2,'2024-03-01'),(336,81,4,3,6,6,3,2,'2024-03-01'),(337,90,3,8,2,7,4,2,'2024-03-01'),(338,35,4,6,5,7,4,1,'2024-03-01'),(339,7,4,3,6,2,4,3,'2024-03-02'),(340,98,2,18,4,3,5,3,'2024-03-02'),(341,72,3,10,6,4,4,2,'2024-03-02'),(342,79,3,11,4,8,4,1,'2024-03-02'),(343,85,2,10,6,NULL,1,1,'2024-03-02'),(344,98,4,16,7,4,4,3,'2024-03-02'),(345,52,3,9,6,NULL,2,2,'2024-03-02'),(346,5,1,9,3,9,4,1,'2024-03-02'),(347,36,2,18,7,1,5,1,'2024-03-03'),(348,72,1,23,2,9,4,1,'2024-03-03'),(349,66,4,12,6,8,4,4,'2024-03-03'),(350,79,3,6,1,4,4,1,'2024-03-03'),(351,44,3,9,1,6,3,3,'2024-03-04'),(352,49,2,17,7,NULL,1,2,'2024-03-04'),(353,57,3,4,5,3,5,1,'2024-03-04'),(354,52,4,7,1,NULL,2,4,'2024-03-04'),(355,21,3,24,1,5,3,1,'2024-03-05'),(356,5,3,18,2,NULL,1,2,'2024-03-05'),(357,31,3,16,7,2,4,3,'2024-03-05'),(358,38,1,13,4,NULL,1,1,'2024-03-06'),(359,50,2,12,5,1,5,3,'2024-03-06'),(360,48,2,1,6,8,4,4,'2024-03-06'),(361,15,4,12,3,2,4,1,'2024-03-06'),(362,75,2,20,4,1,5,2,'2024-03-06'),(363,8,3,3,7,2,4,4,'2024-03-07'),(364,1,2,1,7,9,4,3,'2024-03-07'),(365,69,1,18,7,3,5,2,'2024-03-07'),(366,10,4,14,6,6,3,2,'2024-03-08'),(367,96,3,6,4,5,3,2,'2024-03-08'),(368,75,1,10,4,5,3,2,'2024-03-08'),(369,16,3,13,7,4,4,4,'2024-03-09'),(370,39,2,9,4,4,4,3,'2024-03-09'),(371,91,3,12,4,8,4,2,'2024-03-10'),(372,70,3,24,7,3,5,4,'2024-03-10'),(373,1,3,17,4,6,3,3,'2024-03-10'),(374,78,4,22,7,NULL,1,4,'2024-03-10'),(375,82,4,21,7,1,5,4,'2024-03-10'),(376,84,4,10,4,3,5,2,'2024-03-10'),(377,72,4,10,7,7,4,1,'2024-03-11'),(378,73,3,16,2,2,4,1,'2024-03-11'),(379,59,1,2,5,6,3,1,'2024-03-11'),(380,39,4,9,3,1,5,3,'2024-03-11'),(381,50,2,12,7,7,4,3,'2024-03-11'),(382,34,4,11,3,3,5,2,'2024-03-11'),(383,53,3,7,4,NULL,2,3,'2024-03-11'),(384,13,3,2,4,5,3,3,'2024-03-11'),(385,58,4,11,1,NULL,2,3,'2024-03-11'),(386,25,1,16,7,1,5,2,'2024-03-12'),(387,59,2,24,4,7,4,2,'2024-03-12'),(388,84,3,17,2,9,4,2,'2024-03-12'),(389,18,3,24,1,9,4,3,'2024-03-12'),(390,18,4,22,6,NULL,2,2,'2024-03-12'),(391,60,3,24,5,6,3,1,'2024-03-13'),(392,59,4,4,6,8,4,2,'2024-03-13'),(393,97,3,24,6,5,3,2,'2024-03-13'),(394,77,3,9,6,2,4,1,'2024-03-14'),(395,22,2,6,7,3,5,2,'2024-03-15'),(396,37,2,5,7,9,4,3,'2024-03-15'),(397,25,4,4,3,3,5,4,'2024-03-15'),(398,27,3,14,4,9,4,3,'2024-03-15'),(399,39,4,21,5,8,4,1,'2024-03-15'),(400,42,4,10,4,1,5,4,'2024-03-15'),(401,52,4,16,3,6,3,1,'2024-03-15'),(402,25,1,8,5,5,3,1,'2024-03-15'),(403,94,1,5,2,6,3,2,'2024-03-15'),(404,28,3,23,1,4,4,3,'2024-03-16'),(405,33,1,14,1,8,4,2,'2024-03-17'),(406,3,3,24,1,2,4,2,'2024-03-17'),(407,73,2,4,1,5,3,2,'2024-03-17'),(408,71,2,10,4,2,4,1,'2024-03-17'),(409,62,4,10,5,NULL,1,2,'2024-03-18'),(410,36,4,3,1,3,5,2,'2024-03-18'),(411,70,4,19,6,8,4,2,'2024-03-18'),(412,76,1,20,7,8,4,2,'2024-03-18'),(413,23,4,14,7,2,4,2,'2024-03-18'),(414,74,1,21,7,2,4,3,'2024-03-18'),(415,83,3,13,4,8,4,2,'2024-03-18'),(416,51,1,12,1,3,5,4,'2024-03-18'),(417,73,2,19,5,8,4,4,'2024-03-19'),(418,24,4,13,4,9,4,2,'2024-03-19'),(419,8,2,21,3,2,4,2,'2024-03-19'),(420,37,3,24,5,9,4,2,'2024-03-20'),(421,78,1,3,1,8,4,4,'2024-03-20'),(422,42,3,3,3,8,4,3,'2024-03-20'),(423,85,3,1,6,8,4,1,'2024-03-21'),(424,36,3,6,6,NULL,2,3,'2024-03-21'),(425,72,3,9,3,3,5,4,'2024-03-21'),(426,55,4,23,5,5,3,2,'2024-03-22'),(427,83,1,17,4,9,4,3,'2024-03-22'),(428,26,4,14,6,4,4,2,'2024-03-22'),(429,81,4,4,6,1,5,2,'2024-03-23'),(430,77,1,7,1,1,5,2,'2024-03-23'),(431,96,2,19,5,1,5,4,'2024-03-23'),(432,37,4,19,7,1,5,4,'2024-03-23'),(433,20,1,1,6,5,3,2,'2024-03-24'),(434,98,2,13,2,6,3,4,'2024-03-24'),(435,38,1,17,7,8,4,3,'2024-03-24'),(436,23,3,11,1,5,3,3,'2024-03-24'),(437,63,3,13,7,5,3,4,'2024-03-24'),(438,53,2,22,2,8,4,4,'2024-03-24'),(439,78,3,10,5,5,3,4,'2024-03-25'),(440,94,2,14,5,5,3,1,'2024-03-25'),(441,61,2,19,6,8,4,3,'2024-03-25'),(442,45,4,6,3,NULL,2,4,'2024-03-25'),(443,2,3,17,7,8,4,3,'2024-03-25'),(444,90,4,5,4,4,4,2,'2024-03-26'),(445,96,3,18,7,6,3,3,'2024-03-26'),(446,61,2,11,1,9,4,2,'2024-03-26'),(447,94,4,11,1,4,4,4,'2024-03-26'),(448,31,1,9,1,7,4,3,'2024-03-26'),(449,2,4,20,7,2,4,2,'2024-03-27'),(450,3,4,15,1,3,5,1,'2024-03-27'),(451,93,4,7,5,1,5,4,'2024-03-27'),(452,20,4,11,2,5,3,4,'2024-03-28'),(453,17,4,4,5,1,5,2,'2024-03-28'),(454,96,2,9,1,6,3,4,'2024-03-28'),(455,50,3,12,3,6,3,3,'2024-03-28'),(456,38,2,16,2,8,4,3,'2024-03-28'),(457,52,4,12,3,3,5,2,'2024-03-28'),(458,18,2,23,6,5,3,4,'2024-03-28'),(459,40,2,16,2,2,4,2,'2024-03-28'),(460,87,1,21,1,5,3,1,'2024-03-29'),(461,79,2,5,2,1,5,4,'2024-03-29'),(462,65,3,16,2,6,3,1,'2024-03-30'),(463,12,1,2,5,4,4,4,'2024-03-30'),(464,60,3,3,1,1,5,4,'2024-03-30'),(465,19,2,8,6,8,4,3,'2024-03-30'),(466,38,2,12,5,6,3,2,'2024-03-30'),(467,10,1,18,5,8,4,3,'2024-03-30'),(468,17,3,4,4,3,5,4,'2024-03-31'),(469,92,4,16,3,8,4,1,'2024-03-31'),(470,77,3,23,1,9,4,2,'2024-03-31'),(471,20,2,19,5,8,4,3,'2024-03-31'),(472,33,4,20,2,NULL,2,2,'2024-03-31'),(473,56,1,20,1,6,3,4,'2024-03-31'),(474,13,4,1,1,6,3,2,'2024-04-01'),(475,9,1,15,5,1,5,2,'2024-04-01'),(476,80,3,5,3,9,4,4,'2024-04-01'),(477,98,1,12,6,4,4,2,'2024-04-01'),(478,89,4,23,5,7,4,2,'2024-04-01'),(479,6,4,19,3,7,4,3,'2024-04-01'),(480,95,1,1,4,7,4,2,'2024-04-01'),(481,57,3,21,1,1,5,2,'2024-04-01'),(482,42,2,13,7,2,4,4,'2024-04-02'),(483,89,2,23,7,6,3,4,'2024-04-02'),(484,61,1,8,5,1,5,4,'2024-04-02'),(485,99,4,11,3,9,4,4,'2024-04-02'),(486,4,3,5,5,1,5,4,'2024-04-02'),(487,77,1,2,5,5,3,1,'2024-04-02'),(488,66,1,18,6,8,4,3,'2024-04-02'),(489,44,2,7,3,1,5,3,'2024-04-02'),(490,95,3,3,3,6,3,2,'2024-04-02'),(491,39,2,6,5,NULL,2,2,'2024-04-03'),(492,25,1,9,5,5,3,4,'2024-04-03'),(493,3,4,11,3,NULL,2,4,'2024-04-03'),(494,84,2,6,2,3,5,1,'2024-04-03'),(495,58,1,11,6,4,4,2,'2024-04-03'),(496,68,2,17,4,3,5,3,'2024-04-04'),(497,10,4,21,3,8,4,3,'2024-04-04'),(498,76,4,19,7,9,4,2,'2024-04-04'),(499,54,2,2,5,9,4,2,'2024-04-04'),(500,24,1,13,4,3,5,4,'2024-04-04'),(501,87,1,19,6,6,3,3,'2024-04-05'),(502,21,3,20,4,7,4,1,'2024-04-05'),(503,43,4,5,1,6,3,4,'2024-04-05'),(504,35,4,24,2,6,3,1,'2024-04-05'),(505,33,3,14,7,5,3,3,'2024-04-05'),(506,81,2,18,2,6,3,1,'2024-04-05'),(507,38,4,23,5,1,5,1,'2024-04-06'),(508,31,3,11,5,3,5,3,'2024-04-06'),(509,14,1,20,3,1,5,4,'2024-04-06'),(510,53,2,16,1,1,5,1,'2024-04-06'),(511,71,2,7,6,3,5,4,'2024-04-06'),(512,18,4,21,3,7,4,1,'2024-04-06'),(513,44,2,7,5,6,3,2,'2024-04-06'),(514,22,3,5,6,3,5,3,'2024-04-07'),(515,14,2,18,6,7,4,2,'2024-04-07'),(516,50,3,21,1,8,4,2,'2024-04-07'),(517,22,2,16,7,7,4,4,'2024-04-07'),(518,11,3,4,3,5,3,1,'2024-04-07'),(519,3,4,21,6,8,4,1,'2024-04-08'),(520,96,2,17,5,5,3,1,'2024-04-08'),(521,10,3,11,5,2,4,3,'2024-04-08'),(522,5,4,11,1,6,3,2,'2024-04-08'),(523,16,4,10,4,2,4,3,'2024-04-08'),(524,92,1,13,7,3,5,4,'2024-04-09'),(525,56,4,1,6,2,4,4,'2024-04-09'),(526,8,2,20,3,3,5,1,'2024-04-09'),(527,44,4,10,5,5,3,3,'2024-04-09'),(528,50,1,12,4,6,3,2,'2024-04-10'),(529,38,2,17,5,8,4,1,'2024-04-10'),(530,95,2,1,6,6,3,4,'2024-04-10'),(531,45,2,13,5,6,3,1,'2024-04-10'),(532,6,1,12,1,2,4,2,'2024-04-11'),(533,38,4,19,6,6,3,3,'2024-04-11'),(534,18,2,10,4,2,4,4,'2024-04-12'),(535,95,4,12,3,1,5,3,'2024-04-12'),(536,38,1,7,4,2,4,3,'2024-04-12'),(537,20,1,5,7,7,4,1,'2024-04-12'),(538,64,3,9,3,2,4,2,'2024-04-12'),(539,12,2,15,1,1,5,3,'2024-04-12'),(540,70,4,20,7,6,3,1,'2024-04-12'),(541,51,1,1,2,4,4,4,'2024-04-12'),(542,77,3,20,3,NULL,1,4,'2024-04-13'),(543,8,4,18,3,6,3,2,'2024-04-13'),(544,24,3,15,3,6,3,4,'2024-04-13'),(545,71,2,6,4,3,5,2,'2024-04-13'),(546,9,4,5,4,2,4,4,'2024-04-13'),(547,58,4,24,1,NULL,1,2,'2024-04-13'),(548,83,4,4,3,1,5,4,'2024-04-13'),(549,18,1,11,1,5,3,1,'2024-04-13'),(550,7,3,7,7,7,4,3,'2024-04-13'),(551,14,3,22,3,4,4,3,'2024-04-13'),(552,20,3,2,6,1,5,2,'2024-04-13'),(553,81,1,24,2,6,3,4,'2024-04-14'),(554,3,2,2,4,6,3,1,'2024-04-14'),(555,27,1,9,4,9,4,2,'2024-04-14'),(556,98,4,15,5,8,4,2,'2024-04-14'),(557,37,2,14,5,3,5,4,'2024-04-15'),(558,85,1,16,7,4,4,2,'2024-04-15'),(559,1,1,3,6,6,3,3,'2024-04-15'),(560,17,1,4,4,2,4,3,'2024-04-15'),(561,47,2,16,1,5,3,1,'2024-04-15'),(562,50,2,22,6,2,4,1,'2024-04-15'),(563,39,3,23,5,5,3,2,'2024-04-15'),(564,50,4,22,5,7,4,2,'2024-04-16'),(565,87,1,5,5,NULL,1,3,'2024-04-16'),(566,71,3,15,7,2,4,1,'2024-04-16'),(567,21,4,6,7,1,5,4,'2024-04-16'),(568,78,3,12,3,5,3,2,'2024-04-16'),(569,25,1,22,5,4,4,1,'2024-04-16'),(570,3,1,6,7,1,5,2,'2024-04-17'),(571,39,3,5,4,5,3,4,'2024-04-17'),(572,87,4,24,6,NULL,1,4,'2024-04-17'),(573,1,4,12,1,4,4,1,'2024-04-17'),(574,94,3,8,5,8,4,3,'2024-04-17'),(575,2,3,1,7,5,3,3,'2024-04-17'),(576,75,1,7,7,8,4,1,'2024-04-18'),(577,87,4,4,6,2,4,4,'2024-04-18'),(578,28,4,18,2,9,4,3,'2024-04-18'),(579,5,3,4,7,8,4,3,'2024-04-18'),(580,90,3,17,7,4,4,2,'2024-04-18'),(581,57,3,18,7,4,4,4,'2024-04-18'),(582,39,3,20,5,4,4,4,'2024-04-19'),(583,14,4,8,5,2,4,4,'2024-04-19'),(584,14,1,15,1,8,4,3,'2024-04-19'),(585,25,1,10,5,2,4,1,'2024-04-19'),(586,34,4,6,7,NULL,1,1,'2024-04-19'),(587,93,2,1,3,8,4,2,'2024-04-19'),(588,62,3,20,1,3,5,2,'2024-04-19'),(589,98,1,4,7,NULL,2,3,'2024-04-19'),(590,76,4,20,4,4,4,2,'2024-04-19'),(591,58,1,17,1,7,4,3,'2024-04-20'),(592,59,2,7,3,5,3,1,'2024-04-20'),(593,42,4,19,3,8,4,3,'2024-04-20'),(594,25,2,21,1,NULL,1,1,'2024-04-20'),(595,82,2,11,4,3,5,1,'2024-04-20'),(596,27,3,2,6,2,4,4,'2024-04-20'),(597,59,3,7,2,6,3,4,'2024-04-20'),(598,46,1,9,7,1,5,4,'2024-04-21'),(599,69,3,23,2,2,4,2,'2024-04-21'),(600,89,1,24,7,9,4,2,'2024-04-22'),(601,96,1,4,7,7,4,4,'2024-04-22'),(602,74,2,12,2,NULL,2,1,'2024-04-22'),(603,72,1,16,1,5,3,3,'2024-04-22'),(604,60,1,12,1,NULL,1,2,'2024-04-22'),(605,92,1,24,2,9,4,3,'2024-04-22'),(606,65,1,19,6,7,4,1,'2024-04-22'),(607,17,3,20,7,2,4,3,'2024-04-22'),(608,13,4,15,3,NULL,1,1,'2024-04-22'),(609,76,4,4,6,2,4,2,'2024-04-23'),(610,73,1,3,1,7,4,2,'2024-04-23'),(611,65,4,18,2,7,4,1,'2024-04-23'),(612,30,2,3,6,6,3,2,'2024-04-23'),(613,67,4,5,7,4,4,4,'2024-04-23'),(614,27,3,9,4,4,4,2,'2024-04-23'),(615,29,4,2,1,4,4,3,'2024-04-24'),(616,80,3,15,7,9,4,1,'2024-04-24'),(617,70,2,21,4,3,5,3,'2024-04-24'),(618,92,1,10,6,9,4,2,'2024-04-24'),(619,80,2,21,3,7,4,4,'2024-04-24'),(620,89,4,23,3,9,4,2,'2024-04-24'),(621,93,4,2,6,9,4,1,'2024-04-26'),(622,9,3,2,6,6,3,3,'2024-04-26'),(623,47,1,10,1,3,5,1,'2024-04-26'),(624,33,2,21,6,6,3,2,'2024-04-26'),(625,9,2,10,5,1,5,1,'2024-04-26'),(626,55,2,4,6,4,4,4,'2024-04-27'),(627,12,4,13,6,NULL,1,1,'2024-04-27'),(628,79,1,8,4,7,4,2,'2024-04-27'),(629,49,2,17,2,4,4,1,'2024-04-27'),(630,83,2,9,3,3,5,4,'2024-04-27'),(631,36,4,18,6,3,5,1,'2024-04-27'),(632,14,2,5,1,7,4,4,'2024-04-27'),(633,56,2,11,4,9,4,4,'2024-04-28'),(634,58,3,19,7,NULL,2,1,'2024-04-28'),(635,76,4,3,7,7,4,4,'2024-04-28'),(636,64,1,4,4,5,3,1,'2024-04-28'),(637,7,4,17,4,8,4,1,'2024-04-28'),(638,65,3,5,4,2,4,1,'2024-04-29'),(639,42,3,10,1,9,4,4,'2024-04-30'),(640,58,3,23,2,7,4,3,'2024-04-30'),(641,86,1,2,1,5,3,3,'2024-04-30'),(642,68,4,13,4,4,4,1,'2024-04-30'),(643,3,4,22,5,8,4,2,'2024-04-30'),(644,79,1,14,6,NULL,2,4,'2024-04-30'),(645,47,2,1,7,1,5,3,'2024-04-30'),(646,44,1,22,7,9,4,2,'2024-05-01'),(647,27,3,7,4,3,5,2,'2024-05-01'),(648,2,2,12,6,9,4,4,'2024-05-01'),(649,42,1,20,2,5,3,1,'2024-05-01'),(650,15,1,7,6,9,4,2,'2024-05-01'),(651,36,2,7,1,6,3,4,'2024-05-01'),(652,20,3,24,2,3,5,1,'2024-05-01'),(653,90,3,16,7,5,3,1,'2024-05-01'),(654,25,2,14,1,4,4,4,'2024-05-01'),(655,7,3,19,6,5,3,3,'2024-05-01'),(656,42,1,4,1,4,4,3,'2024-05-01'),(657,26,3,6,3,3,5,4,'2024-05-01'),(658,15,1,1,6,1,5,2,'2024-05-01'),(659,71,4,7,7,NULL,1,2,'2024-05-01'),(660,67,3,24,4,1,5,1,'2024-05-02'),(661,79,2,13,1,6,3,3,'2024-05-02'),(662,42,1,12,6,5,3,1,'2024-05-02'),(663,75,3,1,3,NULL,1,1,'2024-05-03'),(664,11,2,7,4,NULL,1,4,'2024-05-03'),(665,82,4,14,4,8,4,3,'2024-05-03'),(666,9,2,15,7,5,3,4,'2024-05-03'),(667,94,2,5,1,4,4,1,'2024-05-03'),(668,48,2,13,7,5,3,3,'2024-05-03'),(669,27,3,12,1,3,5,3,'2024-05-03'),(670,24,3,2,7,1,5,1,'2024-05-03'),(671,56,4,10,1,7,4,3,'2024-05-03'),(672,68,3,12,1,5,3,4,'2024-05-03'),(673,92,2,12,4,9,4,3,'2024-05-03'),(674,3,3,6,3,3,5,4,'2024-05-04'),(675,4,3,11,4,7,4,4,'2024-05-04'),(676,23,4,19,7,5,3,3,'2024-05-04'),(677,35,4,13,1,5,3,1,'2024-05-04'),(678,49,4,7,5,2,4,2,'2024-05-04'),(679,61,4,9,2,NULL,2,3,'2024-05-04'),(680,92,2,6,4,7,4,4,'2024-05-04'),(681,50,4,5,4,4,4,2,'2024-05-04'),(682,32,1,12,3,9,4,1,'2024-05-04'),(683,99,4,3,2,9,4,1,'2024-05-05'),(684,97,4,11,4,5,3,4,'2024-05-05'),(685,42,1,12,2,1,5,3,'2024-05-05'),(686,59,1,18,6,3,5,3,'2024-05-05'),(687,83,1,13,7,1,5,3,'2024-05-05'),(688,71,2,24,7,5,3,4,'2024-05-06'),(689,34,2,16,3,7,4,4,'2024-05-06'),(690,50,2,7,5,8,4,2,'2024-05-06'),(691,39,3,23,3,NULL,2,2,'2024-05-06'),(692,28,1,5,2,8,4,2,'2024-05-06'),(693,46,2,18,6,8,4,4,'2024-05-07'),(694,49,3,23,7,3,5,3,'2024-05-07'),(695,46,4,23,1,3,5,2,'2024-05-07'),(696,81,3,21,6,9,4,2,'2024-05-07'),(697,44,3,13,5,3,5,2,'2024-05-07'),(698,57,2,15,6,4,4,3,'2024-05-07'),(699,12,2,15,1,1,5,4,'2024-05-07'),(700,87,2,1,4,8,4,4,'2024-05-07'),(701,82,4,19,5,2,4,1,'2024-05-08'),(702,91,1,14,4,3,5,4,'2024-05-08'),(703,64,1,22,1,NULL,2,1,'2024-05-08'),(704,25,4,8,1,6,3,2,'2024-05-08'),(705,45,4,6,5,8,4,1,'2024-05-08'),(706,7,3,16,1,3,5,2,'2024-05-09'),(707,97,2,6,2,NULL,1,3,'2024-05-09'),(708,59,1,17,3,2,4,2,'2024-05-10'),(709,1,2,13,3,2,4,2,'2024-05-10'),(710,22,2,16,7,5,3,1,'2024-05-11'),(711,86,2,6,5,5,3,2,'2024-05-11'),(712,44,3,21,5,8,4,3,'2024-05-11'),(713,61,3,4,2,5,3,1,'2024-05-12'),(714,77,3,6,3,4,4,2,'2024-05-12'),(715,98,2,22,6,4,4,1,'2024-05-12'),(716,14,4,16,7,8,4,2,'2024-05-13'),(717,66,3,11,2,1,5,4,'2024-05-13'),(718,78,1,18,6,1,5,1,'2024-05-13'),(719,84,3,5,1,4,4,4,'2024-05-13'),(720,59,2,10,2,3,5,3,'2024-05-14'),(721,83,4,21,6,NULL,2,3,'2024-05-14'),(722,81,4,20,3,8,4,3,'2024-05-14'),(723,39,2,8,2,7,4,1,'2024-05-14'),(724,66,1,4,6,7,4,2,'2024-05-14'),(725,24,1,3,4,1,5,4,'2024-05-14'),(726,60,3,23,1,2,4,2,'2024-05-14'),(727,2,1,1,7,3,5,1,'2024-05-14'),(728,10,3,13,2,2,4,3,'2024-05-15'),(729,68,1,20,6,5,3,4,'2024-05-15'),(730,100,2,11,7,2,4,3,'2024-05-15'),(731,54,2,16,7,3,5,1,'2024-05-15'),(732,47,1,6,3,8,4,4,'2024-05-15'),(733,53,3,10,6,9,4,2,'2024-05-15'),(734,51,1,8,3,6,3,4,'2024-05-15'),(735,30,2,3,1,5,3,4,'2024-05-15'),(736,94,3,19,2,7,4,3,'2024-05-15'),(737,72,4,21,6,6,3,4,'2024-05-16'),(738,71,2,8,5,NULL,2,2,'2024-05-16'),(739,25,4,2,7,2,4,2,'2024-05-16'),(740,90,2,19,1,6,3,4,'2024-05-16'),(741,38,2,1,4,9,4,2,'2024-05-16'),(742,87,2,14,7,NULL,1,1,'2024-05-17'),(743,73,3,1,4,3,5,2,'2024-05-17'),(744,68,1,18,3,7,4,3,'2024-05-17'),(745,81,1,11,4,1,5,1,'2024-05-17'),(746,75,2,13,7,NULL,1,3,'2024-05-17'),(747,4,4,4,4,6,3,3,'2024-05-17'),(748,88,2,13,7,1,5,3,'2024-05-17'),(749,42,3,22,5,4,4,1,'2024-05-17'),(750,82,2,23,6,4,4,1,'2024-05-17'),(751,9,4,6,5,8,4,1,'2024-05-17'),(752,91,1,6,6,2,4,2,'2024-05-17'),(753,38,2,10,4,2,4,4,'2024-05-17'),(754,60,4,23,3,NULL,1,4,'2024-05-17'),(755,55,4,10,1,5,3,4,'2024-05-18'),(756,31,4,18,6,7,4,1,'2024-05-18'),(757,44,1,3,6,7,4,4,'2024-05-18'),(758,55,2,3,2,7,4,4,'2024-05-18'),(759,61,3,19,4,6,3,4,'2024-05-18'),(760,5,3,23,6,NULL,2,2,'2024-05-18'),(761,16,4,8,3,7,4,2,'2024-05-18'),(762,51,1,12,7,3,5,3,'2024-05-18'),(763,71,3,8,4,1,5,4,'2024-05-18'),(764,27,1,8,2,3,5,2,'2024-05-18'),(765,40,2,2,1,1,5,4,'2024-05-18'),(766,32,4,1,3,NULL,1,2,'2024-05-18'),(767,87,4,15,1,2,4,2,'2024-05-19'),(768,10,4,4,6,2,4,3,'2024-05-19'),(769,93,2,12,3,1,5,1,'2024-05-19'),(770,78,1,13,6,2,4,3,'2024-05-20'),(771,90,2,20,3,NULL,1,2,'2024-05-20'),(772,1,3,19,5,7,4,2,'2024-05-20'),(773,55,3,1,7,9,4,1,'2024-05-21'),(774,16,4,23,2,NULL,1,1,'2024-05-21'),(775,73,2,21,2,4,4,1,'2024-05-21'),(776,28,4,14,4,3,5,4,'2024-05-21'),(777,47,3,24,1,2,4,3,'2024-05-22'),(778,65,3,9,5,5,3,3,'2024-05-22'),(779,23,4,7,4,3,5,4,'2024-05-22'),(780,94,4,3,4,8,4,3,'2024-05-22'),(781,67,1,16,5,7,4,1,'2024-05-22'),(782,33,4,19,3,5,3,3,'2024-05-22'),(783,72,3,2,2,7,4,3,'2024-05-22'),(784,47,3,21,6,9,4,3,'2024-05-22'),(785,31,1,4,6,6,3,3,'2024-05-23'),(786,85,2,9,6,4,4,1,'2024-05-23'),(787,3,3,19,2,4,4,4,'2024-05-23'),(788,51,3,14,2,4,4,1,'2024-05-23'),(789,4,1,11,4,NULL,2,3,'2024-05-23'),(790,72,1,23,1,5,3,2,'2024-05-23'),(791,82,2,7,6,5,3,1,'2024-05-23'),(792,74,2,23,3,5,3,2,'2024-05-23'),(793,18,3,10,1,3,5,1,'2024-05-24'),(794,46,1,10,2,5,3,2,'2024-05-25'),(795,41,4,11,2,4,4,1,'2024-05-25'),(796,80,3,14,4,3,5,2,'2024-05-25'),(797,84,4,12,3,7,4,1,'2024-05-25'),(798,89,1,20,6,4,4,1,'2024-05-25'),(799,55,1,16,2,4,4,1,'2024-05-26'),(800,43,2,17,6,5,3,1,'2024-05-26'),(801,98,2,5,7,6,3,2,'2024-05-26'),(802,42,4,7,7,NULL,2,3,'2024-05-26'),(803,1,3,9,1,6,3,1,'2024-05-26'),(804,12,3,13,3,6,3,2,'2024-05-26'),(805,16,2,13,3,1,5,2,'2024-05-26'),(806,4,3,10,2,4,4,4,'2024-05-26'),(807,32,4,21,3,3,5,4,'2024-05-26'),(808,3,4,23,6,6,3,1,'2024-05-27'),(809,17,4,12,5,3,5,1,'2024-05-27'),(810,51,2,14,2,6,3,4,'2024-05-27'),(811,1,4,11,6,7,4,4,'2024-05-27'),(812,73,4,10,2,8,4,4,'2024-05-27'),(813,21,3,9,2,9,4,1,'2024-05-27'),(814,48,1,10,7,1,5,3,'2024-05-28'),(815,19,4,15,6,1,5,3,'2024-05-28'),(816,91,1,1,1,8,4,3,'2024-05-28'),(817,56,1,22,7,5,3,3,'2024-05-29'),(818,59,2,23,2,9,4,3,'2024-05-29'),(819,57,2,5,1,9,4,1,'2024-05-30'),(820,33,1,14,7,1,5,4,'2024-05-30'),(821,73,4,10,4,7,4,4,'2024-05-30'),(822,72,4,24,5,5,3,2,'2024-05-30'),(823,80,2,19,7,7,4,1,'2024-05-30'),(824,25,1,4,7,4,4,4,'2024-05-30'),(825,76,1,19,4,4,4,3,'2024-05-31'),(826,74,1,18,5,1,5,2,'2024-05-31'),(827,73,1,17,3,8,4,1,'2024-05-31'),(828,96,3,7,1,6,3,1,'2024-05-31'),(829,30,1,1,5,6,3,3,'2024-05-31'),(830,26,4,4,7,9,4,2,'2024-05-31'),(831,32,1,19,6,8,4,4,'2024-05-31'),(832,27,4,3,6,7,4,2,'2024-05-31'),(833,16,1,14,2,9,4,4,'2024-06-01'),(834,46,2,4,7,5,3,4,'2024-06-01'),(835,5,3,1,1,NULL,2,1,'2024-06-01'),(836,34,3,17,1,4,4,1,'2024-06-01'),(837,59,4,1,5,1,5,2,'2024-06-01'),(838,91,3,10,6,9,4,3,'2024-06-01'),(839,93,4,12,3,3,5,1,'2024-06-01'),(840,68,2,17,3,3,5,4,'2024-06-01'),(841,25,2,8,7,NULL,2,4,'2024-06-02'),(842,40,1,15,5,3,5,4,'2024-06-02'),(843,92,3,2,5,8,4,2,'2024-06-02'),(844,78,4,18,5,9,4,2,'2024-06-02'),(845,78,4,15,4,6,3,4,'2024-06-02'),(846,43,2,16,5,9,4,1,'2024-06-02'),(847,64,4,3,1,4,4,2,'2024-06-02'),(848,97,2,11,6,8,4,1,'2024-06-02'),(849,88,4,3,4,NULL,2,4,'2024-06-02'),(850,71,2,5,5,8,4,1,'2024-06-03'),(851,92,3,7,6,2,4,1,'2024-06-03'),(852,37,3,14,1,5,3,2,'2024-06-03'),(853,95,2,4,4,2,4,4,'2024-06-03'),(854,66,4,19,7,4,4,1,'2024-06-03'),(855,47,1,4,2,8,4,4,'2024-06-03'),(856,17,3,4,7,2,4,3,'2024-06-03'),(857,58,4,15,4,6,3,3,'2024-06-04'),(858,76,4,1,1,4,4,1,'2024-06-04'),(859,24,1,10,3,3,5,2,'2024-06-04'),(860,16,3,14,3,2,4,1,'2024-06-04'),(861,79,2,21,7,6,3,3,'2024-06-05'),(862,49,3,7,6,6,3,3,'2024-06-05'),(863,73,1,11,6,1,5,2,'2024-06-05'),(864,67,2,2,4,3,5,2,'2024-06-05'),(865,64,1,13,3,2,4,3,'2024-06-05'),(866,40,3,9,7,8,4,2,'2024-06-05'),(867,38,3,4,7,4,4,2,'2024-06-05'),(868,74,2,12,1,8,4,3,'2024-06-05'),(869,54,4,11,3,5,3,1,'2024-06-05'),(870,41,3,18,1,5,3,2,'2024-06-05'),(871,95,1,13,1,5,3,3,'2024-06-05'),(872,4,2,6,4,NULL,2,4,'2024-06-06'),(873,65,4,15,6,3,5,4,'2024-06-06'),(874,12,2,5,2,9,4,4,'2024-06-06'),(875,68,4,3,3,5,3,1,'2024-06-06'),(876,25,3,15,3,9,4,4,'2024-06-06'),(877,81,1,5,1,3,5,2,'2024-06-07'),(878,23,4,12,2,4,4,2,'2024-06-07'),(879,19,1,3,6,5,3,2,'2024-06-07'),(880,71,4,1,4,3,5,1,'2024-06-07'),(881,11,3,22,1,5,3,3,'2024-06-07'),(882,73,2,9,2,5,3,3,'2024-06-08'),(883,54,4,6,4,NULL,2,2,'2024-06-08'),(884,83,2,13,4,9,4,1,'2024-06-08'),(885,50,4,7,4,6,3,4,'2024-06-08'),(886,58,4,2,1,6,3,1,'2024-06-08'),(887,67,1,10,3,6,3,1,'2024-06-08'),(888,82,3,8,5,8,4,2,'2024-06-08'),(889,30,2,11,3,7,4,1,'2024-06-08'),(890,81,4,2,4,9,4,4,'2024-06-09'),(891,50,1,15,5,4,4,1,'2024-06-09'),(892,31,2,4,2,7,4,1,'2024-06-09'),(893,95,1,6,3,5,3,2,'2024-06-09'),(894,98,1,10,5,1,5,3,'2024-06-09'),(895,45,4,1,6,4,4,2,'2024-06-09'),(896,86,1,11,3,7,4,4,'2024-06-09'),(897,40,1,17,7,6,3,4,'2024-06-09'),(898,26,2,19,2,1,5,4,'2024-06-09'),(899,100,1,14,7,3,5,4,'2024-06-10'),(900,78,2,2,3,7,4,3,'2024-06-10'),(901,95,1,22,6,9,4,2,'2024-06-10'),(902,61,3,19,1,3,5,1,'2024-06-11'),(903,9,3,9,2,7,4,3,'2024-06-12'),(904,72,1,7,1,5,3,1,'2024-06-12'),(905,88,1,20,4,2,4,2,'2024-06-12'),(906,58,2,17,4,8,4,3,'2024-06-12'),(907,80,1,9,4,NULL,2,2,'2024-06-12'),(908,33,4,9,6,2,4,4,'2024-06-12'),(909,84,3,10,7,7,4,1,'2024-06-13'),(910,5,4,7,6,NULL,1,2,'2024-06-13'),(911,28,2,1,7,NULL,2,2,'2024-06-13'),(912,78,3,3,2,3,5,3,'2024-06-13'),(913,74,2,20,1,7,4,3,'2024-06-14'),(914,58,2,17,6,8,4,2,'2024-06-14'),(915,42,1,19,7,7,4,4,'2024-06-14'),(916,15,1,16,2,5,3,1,'2024-06-14'),(917,39,2,9,5,4,4,4,'2024-06-14'),(918,18,3,18,5,6,3,3,'2024-06-14'),(919,34,1,21,2,9,4,1,'2024-06-14'),(920,89,2,11,7,3,5,1,'2024-06-14'),(921,16,4,3,6,6,3,2,'2024-06-15'),(922,85,4,18,3,6,3,4,'2024-06-15'),(923,16,3,18,5,3,5,1,'2024-06-15'),(924,8,2,16,3,1,5,3,'2024-06-15'),(925,26,2,15,2,9,4,3,'2024-06-16'),(926,95,1,22,3,2,4,3,'2024-06-16'),(927,33,4,24,6,8,4,1,'2024-06-16'),(928,9,1,1,3,5,3,2,'2024-06-16'),(929,21,3,20,1,1,5,3,'2024-06-16'),(930,48,2,16,1,5,3,4,'2024-06-17'),(931,98,3,7,3,1,5,1,'2024-06-17'),(932,99,3,14,5,3,5,4,'2024-06-17'),(933,81,3,16,1,1,5,3,'2024-06-17'),(934,27,3,23,5,5,3,3,'2024-06-17'),(935,15,2,8,5,7,4,1,'2024-06-17'),(936,43,3,23,3,9,4,1,'2024-06-17'),(937,23,2,1,3,NULL,2,2,'2024-06-18'),(938,62,1,3,4,8,4,2,'2024-06-18'),(939,76,2,20,6,9,4,1,'2024-06-19'),(940,6,4,11,7,9,4,1,'2024-06-19'),(941,100,1,6,4,4,4,2,'2024-06-19'),(942,48,3,18,5,4,4,4,'2024-06-19'),(943,97,2,17,1,8,4,3,'2024-06-20'),(944,29,4,7,5,6,3,4,'2024-06-20'),(945,54,1,16,5,4,4,4,'2024-06-20'),(946,26,3,13,4,8,4,2,'2024-06-20'),(947,8,1,6,6,1,5,1,'2024-06-21'),(948,45,3,7,3,4,4,2,'2024-06-21'),(949,90,4,15,5,6,3,1,'2024-06-21'),(950,68,3,16,3,5,3,4,'2024-06-22'),(951,60,3,6,2,3,5,2,'2024-06-22'),(952,95,3,10,7,9,4,2,'2024-06-22'),(953,82,1,11,3,7,4,3,'2024-06-22'),(954,54,3,15,1,6,3,4,'2024-06-22'),(955,26,4,15,3,7,4,2,'2024-06-22'),(956,24,1,8,7,4,4,4,'2024-06-23'),(957,99,1,24,2,9,4,3,'2024-06-23'),(958,52,1,14,5,1,5,2,'2024-06-23'),(959,92,1,5,1,5,3,3,'2024-06-23'),(960,43,1,2,4,7,4,2,'2024-06-23'),(961,10,4,17,1,1,5,3,'2024-06-23'),(962,23,2,18,2,2,4,4,'2024-06-24'),(963,78,1,17,5,2,4,1,'2024-06-24'),(964,100,3,16,6,5,3,2,'2024-06-24'),(965,64,1,5,2,4,4,1,'2024-06-24'),(966,73,1,16,1,1,5,2,'2024-06-24'),(967,95,4,8,6,7,4,3,'2024-06-24'),(968,91,2,16,4,5,3,2,'2024-06-25'),(969,35,4,9,1,2,4,2,'2024-06-25'),(970,78,3,13,3,4,4,4,'2024-06-25'),(971,77,2,6,7,7,4,3,'2024-06-25'),(972,56,1,23,6,3,5,4,'2024-06-25'),(973,53,3,23,7,4,4,3,'2024-06-25'),(974,49,2,14,1,8,4,3,'2024-06-26'),(975,53,4,9,4,1,5,2,'2024-06-26'),(976,84,3,17,4,6,3,1,'2024-06-26'),(977,98,2,11,1,6,3,4,'2024-06-26'),(978,58,4,14,6,7,4,4,'2024-06-26'),(979,41,3,16,1,4,4,2,'2024-06-26'),(980,72,2,3,5,3,5,3,'2024-06-26'),(981,43,3,6,1,1,5,4,'2024-06-26'),(982,59,2,22,4,7,4,1,'2024-06-26'),(983,15,2,4,3,9,4,3,'2024-06-27'),(984,91,3,8,7,4,4,2,'2024-06-27'),(985,35,1,4,7,4,4,4,'2024-06-27'),(986,4,3,23,6,2,4,2,'2024-06-28'),(987,91,2,1,2,8,4,4,'2024-06-28'),(988,30,2,14,6,4,4,1,'2024-06-28'),(989,100,3,11,3,7,4,4,'2024-06-28'),(990,93,3,10,1,7,4,3,'2024-06-29'),(991,54,2,4,5,1,5,1,'2024-06-29'),(992,36,4,9,3,3,5,1,'2024-06-29'),(993,66,1,12,3,NULL,1,2,'2024-06-29'),(994,31,4,5,1,9,4,4,'2024-06-29'),(995,32,3,13,4,9,4,3,'2024-06-30'),(996,41,1,15,6,5,3,3,'2024-06-30'),(997,27,4,12,3,1,5,3,'2024-06-30'),(998,38,1,3,2,NULL,1,1,'2024-06-30'),(999,40,3,22,3,3,5,1,'2024-06-30'),(1000,10,4,17,4,7,4,4,'2024-06-30');
/*!40000 ALTER TABLE `Sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_cardpaymentneeded`
--

DROP TABLE IF EXISTS `vw_cardpaymentneeded`;
/*!50001 DROP VIEW IF EXISTS `vw_cardpaymentneeded`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_cardpaymentneeded` AS SELECT 
 1 AS `customer_id`,
 1 AS `OrderDifference`,
 1 AS `CardPaymentNeeded`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_giftpackage_address`
--

DROP TABLE IF EXISTS `vw_giftpackage_address`;
/*!50001 DROP VIEW IF EXISTS `vw_giftpackage_address`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_giftpackage_address` AS SELECT 
 1 AS `sales_id`,
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `house_number`,
 1 AS `street`,
 1 AS `town`,
 1 AS `postcode`,
 1 AS `giftsection`,
 1 AS `gifttype`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_mostrecentsale`
--

DROP TABLE IF EXISTS `vw_mostrecentsale`;
/*!50001 DROP VIEW IF EXISTS `vw_mostrecentsale`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_mostrecentsale` AS SELECT 
 1 AS `customer_id`,
 1 AS `OrderTotal`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_ppcustomer`
--

DROP TABLE IF EXISTS `vw_ppcustomer`;
/*!50001 DROP VIEW IF EXISTS `vw_ppcustomer`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_ppcustomer` AS SELECT 
 1 AS `customer_id`,
 1 AS `balance`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'MoonPigeon'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `DailySales` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `DailySales` ON SCHEDULE EVERY 1 DAY STARTS '2024-07-22 00:00:00' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
	INSERT INTO DailySalesReport(reportdate, salescount, salesrevenue)
    SELECT 
        CURDATE() - INTERVAL 1 DAY AS reportdate,
        COUNT(*) AS salescount, 
        SUM(cs.cardprice + IFNULL(g.giftprice, 0)) AS salesrevenue
    FROM Sales AS s
    JOIN CardSize AS cs 
    ON s.cardsize_id = cs.cardsize_id
    LEFT JOIN Gift AS g 
    ON s.gift_id = g.gift_id
    WHERE DATE(s.timestamp) = CURDATE() - INTERVAL 1 DAY;
END */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'MoonPigeon'
--
/*!50003 DROP FUNCTION IF EXISTS `EstimatedDelivery` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `EstimatedDelivery`(postage_id INT, timestamp TIMESTAMP ) RETURNS date
    DETERMINISTIC
BEGIN
DECLARE deliverytime DATE;
SET deliverytime = CASE
WHEN postage_id = 1 THEN timestamp + INTERVAL 2 DAY
WHEN postage_id = 2 THEN timestamp + INTERVAL 3 DAY
WHEN postage_id = 3 THEN timestamp + INTERVAL 4 DAY
WHEN postage_id = 4 THEN timestamp + INTERVAL 4 DAY
WHEN postage_id = 5 THEN timestamp + INTERVAL 4 DAY
ELSE NULL
END;
RETURN deliverytime;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CustomerHistory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CustomerHistory`(IN customerId INT)
BEGIN
    SELECT s.timestamp, 
           s.sales_id, 
           s.customer_id, 
           (cs.cardprice + IFNULL(g.giftprice, 0) + p.postageprice) AS OrderTotal
    FROM Sales AS s
    JOIN CardSize AS cs ON s.cardsize_id = cs.cardsize_id
    LEFT JOIN Gift AS g ON s.gift_id = g.gift_id
    JOIN postage AS p ON s.postage_id = p.postage_id
    WHERE s.customer_id = customerId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_cardpaymentneeded`
--

/*!50001 DROP VIEW IF EXISTS `vw_cardpaymentneeded`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_cardpaymentneeded` AS select `p`.`customer_id` AS `customer_id`,(`p`.`balance` - `m`.`OrderTotal`) AS `OrderDifference`,(case when ((`p`.`balance` - `m`.`OrderTotal`) < 0) then 'YES' when ((`p`.`balance` - `m`.`OrderTotal`) >= 0) then 'NO' else 'Error' end) AS `CardPaymentNeeded` from (`vw_ppcustomer` `p` join `vw_mostrecentsale` `m` on((`p`.`customer_id` = `m`.`customer_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_giftpackage_address`
--

/*!50001 DROP VIEW IF EXISTS `vw_giftpackage_address`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_giftpackage_address` AS select `s`.`sales_id` AS `sales_id`,`c`.`first_name` AS `first_name`,`c`.`last_name` AS `last_name`,`c`.`house_number` AS `house_number`,`c`.`street` AS `street`,`c`.`town` AS `town`,`c`.`postcode` AS `postcode`,`g`.`giftsection` AS `giftsection`,`g`.`gifttype` AS `gifttype` from ((`sales` `s` join `customers` `c` on((`s`.`customer_id` = `c`.`customer_id`))) join `gift` `g` on((`s`.`gift_id` = `g`.`gift_id`))) order by `s`.`sales_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_mostrecentsale`
--

/*!50001 DROP VIEW IF EXISTS `vw_mostrecentsale`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_mostrecentsale` AS select `s`.`customer_id` AS `customer_id`,((`cs`.`cardprice` + ifnull(`g`.`giftprice`,0)) + `p`.`postageprice`) AS `OrderTotal` from ((((`sales` `s` join `cardsize` `cs` on((`s`.`cardsize_id` = `cs`.`cardsize_id`))) left join `gift` `g` on((`s`.`gift_id` = `g`.`gift_id`))) join `postage` `p` on((`s`.`postage_id` = `p`.`postage_id`))) join (select `sales`.`customer_id` AS `customer_id`,max(`sales`.`timestamp`) AS `MostRecentOrder` from `sales` group by `sales`.`customer_id`) `LatestOrders` on(((`s`.`customer_id` = `latestorders`.`customer_id`) and (`s`.`timestamp` = `latestorders`.`MostRecentOrder`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_ppcustomer`
--

/*!50001 DROP VIEW IF EXISTS `vw_ppcustomer`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_ppcustomer` AS select `balance`.`customer_id` AS `customer_id`,`balance`.`balance` AS `balance` from `balance` where (`balance`.`pp_account` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-22 18:22:35