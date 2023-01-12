-- MySQL dump 10.13  Distrib 8.0.28, for Linux (x86_64)
--
-- Host: localhost    Database: parkour
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `adventures`
--

DROP TABLE IF EXISTS `adventures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adventures` (
  `name` varchar(32) NOT NULL,
  `course` int DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adventures`
--

LOCK TABLES `adventures` WRITE;
/*!40000 ALTER TABLE `adventures` DISABLE KEYS */;
/*!40000 ALTER TABLE `adventures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courseheads`
--

DROP TABLE IF EXISTS `courseheads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courseheads` (
  `world_name` varchar(32) DEFAULT NULL,
  `x` int DEFAULT NULL,
  `y` int DEFAULT NULL,
  `z` int DEFAULT NULL,
  `course_id` int DEFAULT NULL,
  `skull_type_name` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courseheads`
--

LOCK TABLES `courseheads` WRITE;
/*!40000 ALTER TABLE `courseheads` DISABLE KEYS */;
/*!40000 ALTER TABLE `courseheads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `id` int NOT NULL,
  `x` double DEFAULT NULL,
  `y` double DEFAULT NULL,
  `z` double DEFAULT NULL,
  `pitch` double DEFAULT NULL,
  `yaw` double DEFAULT NULL,
  `world` text,
  `detection` int DEFAULT NULL,
  `mode` enum('normal','guildwar','adventure','vip','hidden','event','custom','thematic') NOT NULL DEFAULT 'normal',
  `difficulty` enum('easy','medium','hard','veryhard') NOT NULL DEFAULT 'easy',
  `name` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,1.5,228,1028.0013705093006,14.701786,0.029950118,'world',3,'normal','easy','Gorzasta Dolina '),(2,23.499599352707527,217,1017.6312626199925,1.3153028,90.09938,'world',3,'normal','easy','Drewniany Tunel '),(3,16.45340804518264,199,996.6836144657867,14.849558,-0.17295511,'world',2,'normal','easy','Opuszczona Kopalnia '),(4,-0.698024485130507,181,1023.0249569087662,15.299633,-91.37165,'world',2,'normal','easy','Patriotyczne Skoki '),(5,-9.57248951648265,226,1061.876759966337,3.007285,-89.25195,'world',2,'normal','easy','Kolorowy Swiderek '),(6,18.5,153,992.5,9.609858,0.042121235,'world',3,'normal','easy','Starozytny Korytarz '),(7,22.489370583366544,99,1030.5161497154606,0.29990095,48.728634,'world',2,'normal','easy','Drewniana Wieza '),(8,19.412582385031055,86,1031.699999988079,11.399696,0.28222656,'world',2,'normal','easy','Zniszczona Aleja '),(9,34.5,71,1052.5,20.861885,0.03918491,'world',2,'normal','easy','Zielony Korytarz '),(10,101.0384454374792,236,1029.2792273485416,6.772473,89.52769,'world',3,'normal','easy','Lodowa Jaskinia '),(11,37.37633153576834,47,1025.0111663429946,0.7507539,-0.00016114116,'world',5,'normal','easy','CUNT '),(12,50.5,241,1051.5,-2.6985338,-90.03857,'world',2,'normal','easy','Ruina Tunelow '),(13,137.42843268603593,219,1175.4312166580914,11.258505,89.71131,'world',2,'normal','easy','Junglowa Przestrzen '),(14,153.877550612879,232,958.7267278592651,12.11646,1.6589123,'world',3,'normal','easy','Lodowe Wspomnienie '),(15,83.69999998807907,225,986.4963170310365,5.2280064,89.92634,'world',2,'normal','easy','Lodowy Dolek '),(16,42.9997952310441,29,1042.5003607921408,18.758423,179.99113,'world',2,'normal','easy','Mala Kopalnia '),(17,-12.499940341556695,221,1103.300000011921,11.839161,0.015864257,'world',2,'normal','easy','Stary Qkoxa '),(18,36.999874426635785,204,984.7495796302239,-0.04437931,0.030932441,'world',2,'normal','easy','Zapomniana Droga '),(20,54.00045161555479,139,999.3000000119209,17.584793,0.02911377,'world',2,'normal','easy','Stare Metro '),(21,58.5,118,1070.5,27.5565,179.99274,'world',2,'normal','easy','Quartz Przestrzen '),(22,53.55880018777889,95,1033.000439785987,13.338337,90.03896,'world',2,'normal','easy','Dookola Kwadratu '),(23,84.5992200850323,103,1017.0006546467056,23.408274,89.956024,'world',3,'normal','easy','Quartz Aleja '),(24,-14.573489584693368,222,1003.4298462229191,22.186829,134.56299,'world',3,'normal','easy','Zniszczony Domek '),(25,-3.582685081074778,198,960.3000000119209,6.7138186,-0.52777576,'world',3,'normal','easy','Zapomniana Komnata '),(26,57.5,202,977.5,20.0638,135.11357,'world',2,'normal','easy','Piaskowa Grota '),(27,0.9991976958865904,231,887.1916933988313,15.504492,0.021911621,'world',2,'normal','easy','Wiosenny Las '),(28,87.68486736177843,226,926.4998927966598,24.799454,-90.011284,'world',2,'normal','easy','Piaskowy Krajobraz '),(29,-53.30000001192093,241,1040.9925358971013,7.516922,89.77523,'world',8,'normal','easy','Kwitnaca Rzeka '),(30,-101.43605603833892,222,831.614609435792,9.3352995,-45.49932,'world',2,'normal','easy','Magiczna Polana '),(31,-60.67214897630581,225,929.0379722211086,17.546303,128.3244,'world',3,'normal','easy','Zwirowa Zaglada '),(100,-29.493122914127962,190,968.5539915065888,10.908429,0.42310303,'world',3,'normal','medium','Czarna Otchlan '),(101,-43.02020733902352,168,1027.2294808660142,5.8500276,-179.84598,'world',2,'normal','medium','Pomaranczowy Tor '),(102,-44.00004898259672,150,1057.1943192709277,27.168716,179.99446,'world',5,'normal','medium','Ruiny Zamku '),(103,-32.5,117,1009.9996117780023,18.386486,-89.998886,'world',2,'normal','medium','Kolorowe Pudelko '),(104,-82.5,233,1139.5,16.321564,-135.11693,'world',4,'normal','medium','Magiczny Las '),(105,-111.5,233,1085.5,21.149223,0.011779785,'world',3,'normal','medium','Pozytywne Scieki '),(106,19.5,71,1035.5,21.808628,89.97228,'world',2,'normal','medium','Pomaranczowy Korytarz '),(107,-58.5,213,1062.5,19.520182,135.02379,'world',2,'normal','medium','Kawowa Mieszanka '),(108,-39.5,231,1051.5,9.126785,-89.992256,'world',2,'normal','medium','Kontrastowa Fabryka '),(109,-42.66874253590837,230,1077.300000011921,11.869066,-6.658686,'world',3,'normal','medium','Pistonowa Zbrojownia '),(110,-36.30000001192093,203,1056.0002673624215,1.2189605,89.99796,'world',2,'normal','medium','Szara Rzeczywistosc '),(111,20.35900251197981,101,1047.5001951359334,21.241465,-90.022514,'world',2,'normal','medium','Magiczna Pozytywka '),(112,-117.0385780512702,226,970.6957327716326,7.84935,178.60612,'world',2,'normal','medium','Nawiedzony Cmentarz '),(113,-81.5,199,1014.9995932595315,14.143353,89.98298,'world',2,'normal','medium','Ognista Twierdza '),(114,-63.43931253629403,180,975.999588912422,28.528513,90.02299,'world',4,'normal','medium','Piekielna Droga '),(115,-76.5,148,1000.5,13.337626,0.0150599405,'world',9,'normal','medium','Rzymskie Wykopaliska '),(116,-129.5,235,1063.5,19.567259,89.99735,'world',5,'normal','medium','Patriotyczna Aleja '),(117,-101.5,216,1070.5,16.890493,179.97794,'world',3,'normal','medium','Drewniany Kanal '),(118,-7.5,230,1166.5,17.042795,90.01348,'world',2,'normal','medium','Gorska Siedziba '),(119,-85.72409622153317,223,1254.7244943471692,21.10662,-135.05281,'world',2,'normal','medium','Mroczny Kanion '),(120,134.2392978327963,230,1258.699999988079,15.916134,-139.61192,'world',3,'normal','medium','Zimowe Wzgorza '),(121,18.99982568904621,231,890.3000000119209,23.423513,0.02932633,'world',2,'normal','medium','Letni Las '),(122,58.69999998807907,211,888.0002095549239,5.343967,89.95714,'world',3,'normal','medium','Zaginiona Kopalnia '),(123,-174.5,210,815.5,9.582497,-45.41812,'world',2,'normal','medium','Mroczny Staw '),(200,74.00022035308734,230,834.6117270648244,28.319,0.02262885,'world',4,'normal','hard','Nierealna Kraina '),(201,-20.5,217,903.5,9.393879,0.030067027,'world',3,'normal','hard','Drewniane Wyskoki '),(202,-60.5,203,983.5,5.2602873,-179.93826,'world',2,'normal','hard','Kawowa Aleja '),(203,-227.00000147729966,244,968.9996356667446,26.90869,0.036987305,'world',3,'normal','hard','Kosmiczny Statek '),(204,-55.5,130,1019.5,32.12462,90.01332,'world',2,'normal','hard','Teczowy Pokoj '),(205,-182.08474472840544,218,982.6999999880791,13.323487,179.1221,'world',4,'normal','hard','Chujowa Aleja '),(206,34.5,71,1014.5,14.551178,179.88208,'world',2,'normal','hard','Czerwony Korytarz '),(207,-258.4134806794947,228,903.9441863906063,10.294268,-90.98985,'world',2,'normal','hard','Skalisty Las '),(208,128.5,199,892.5,19.523361,0.023380246,'world',3,'normal','hard','Mroczne Kanalizacje '),(209,35.00135942668108,61,1007.493916951188,9.5996895,-92.39975,'world',2,'normal','hard','WALLCUMSHOT '),(210,-177.5,204,1026.5,11.73199,-134.78963,'world',3,'normal','hard','Tajemnicze Pudelko '),(211,-148.30000001192093,190,1007.7048399259218,12.394213,90.55185,'world',2,'normal','hard','Peelowy Tunel '),(212,-166.50149272010512,168,1008.3000592044048,1.5571977,0.042092487,'world',2,'normal','hard','Peelowa Spirala '),(213,-116.5,146,1052.5,21.408405,179.98656,'world',6,'normal','hard','Ruda Atmosfera '),(214,-119.00885210619103,114,1028.115493901081,25.207626,179.98161,'world',2,'normal','hard','Czarne Laczenia '),(215,-81.5,239,1279.5,20.76746,0.030449243,'world',7,'normal','hard','Piaskowa Przestrzen '),(216,-110.50036079214135,93,1038.9991377167146,25.237484,179.99368,'world',2,'normal','hard','Turniejowy Tunel '),(217,-122.5415369317357,65,997.7321884463238,-1.9724413,-0.084909156,'world',3,'normal','hard','Enderowa Wieza '),(218,30.6975004312615,231,893.3024995687385,24.087633,45.010906,'world',2,'normal','hard','Jesienny Las '),(219,-45.73260304134406,210,833.6999999880791,7.269844,-179.80017,'world',9,'normal','hard','Zapomniana Kopalnia '),(220,-37.401276960993286,138,858.6535566550731,3.4636288,179.27551,'world',5,'normal','hard','Basniowa Kraina '),(300,12.300000011920929,195,1253.0052560210486,7.799472,-89.87074,'world',2,'normal','veryhard','Plotkowa Masakra '),(301,40.397893529763124,159,1228.0229322546875,10.4854145,-0.69457525,'world',2,'normal','veryhard','Qwartzowa Szlachta '),(302,27.69999998807907,128,1190.300000011921,8.249481,19.177902,'world',2,'normal','veryhard','Lodowe Grotta '),(303,-50.9995418325103,245,1237.699999988079,18.529907,179.98807,'world',2,'normal','veryhard','Brazowa Szarosc '),(304,-64.5,187,842.5,1.441473,-90.03583,'world',3,'normal','veryhard','Opuszczona Kanalizacja '),(400,997.9999235810966,225,3.300000011920929,15.249536,-0.004308109,'world',2,'thematic','easy','Jesienny Park '),(401,1010.6999999880791,215,24.69999998807907,15.567988,135.0648,'world',2,'thematic','medium','Zabojcza Kuznia '),(402,1005.6999999880791,185,-4.500002104023646,15.327132,90.013794,'world',3,'thematic','easy','Rastaman Atakuje '),(403,1006.6999999880791,159,-1.4997884753693316,13.234327,89.98462,'world',3,'thematic','easy','Skrzynia Reggea '),(404,1005.0124999880791,229,70.9996980615143,19.311497,89.99526,'world',2,'thematic','medium','Zniszczone Cmentarzysko '),(405,999.999936918116,163,137.69999998807907,15.342795,179.95712,'world',6,'thematic','hard','Podziemna Swiatynia '),(406,1000.9996185075048,145,112.30000001192093,16.772324,0.026105264,'world',2,'thematic','medium','Nielegalna FarmaWooy '),(500,647.6999999880791,107,163.00043326342703,13.182835,90.009995,'world',2,'thematic','medium','Powrot Do Przeszlosci #1 '),(501,635.4996606228427,118,161.38279735858717,18.39888,179.97781,'world',2,'thematic','medium','Powrot Do Przeszlosci #2 '),(502,690.8175684845418,120,118.49966149969173,30.34135,-90.04671,'world',2,'thematic','medium','Powrot Do Przeszlosci #3 '),(503,785.0046247815844,132,116.00042641980495,21.665716,0.009776239,'world',2,'thematic','medium','Powrot Do Przeszlosci #4 '),(504,721.8686527192566,125,121.49986829562242,27.370686,-89.97998,'world',2,'thematic','medium','Powrot Do Przeszlosci #5 '),(505,750.6999999880791,129,125.01461921113315,25.209618,89.97881,'world',2,'thematic','medium','Powrot Do Przeszlosci #6 '),(506,750.4072025932012,129,97.99292579065676,25.046597,89.966705,'world',2,'thematic','medium','Powrot Do Przeszlosci #7 '),(507,732.0119338024008,134,100.36071479911938,21.21613,179.99887,'world',2,'thematic','medium','Powrot Do Przeszlosci #8 '),(508,733.3000000119209,134,109.30000001192093,18.934101,-35.390503,'world',2,'thematic','medium','Powrot Do Przeszlosci #9 '),(509,747.3000000119209,134,118.69999998807907,21.866207,-151.1726,'world',2,'thematic','medium','Powrot Do Przeszlosci#10 '),(600,-1031.5001916327424,202,-37.69999998807907,3.8463674,0.007542312,'world',2,'custom','medium','Lodowa Siec '),(601,-1088.5,234,-7.00078228721255,24.190037,0.033405766,'world',2,'custom','medium','Sonic Explorer '),(602,-1024.5,184,-9.999001125252079,20.126238,90.03284,'world',2,'custom','easy','Kolorowy Zjazd '),(603,-1045.5,149,29.5,17.077827,179.96053,'world',2,'custom','easy','Predkosc Swiatla '),(604,-1038.5,104,-43.5,15.58286,0.009096828,'world',2,'custom','easy','Fioletowe LSD '),(605,-1049.9996354593745,213,-81.49954900982331,24.76151,179.96237,'world',2,'custom','easy','Pomaranczowy Pudink '),(606,-988.5,143,-50.5,14.144821,-90.01963,'world',3,'custom','medium','Pistonowy Wagon '),(1401,943.6441057245725,223,-94.16040670282047,36.89414,-33.403683,'world',4,'thematic','hard','Mroczne Scieki '),(1402,928.5,216,-65.5,0.7442789,0.18419155,'world',4,'thematic','easy','Starozytne Koloseum '),(1403,735.4635563291091,216,-94.5469870635782,17.064514,-44.939552,'world',3,'thematic','medium','Anielska Wieza '),(1404,513.4176344058861,140,-1457.699999988079,19.499804,0.41948557,'world',5,'thematic','veryhard','Kosmiczna Otchlan '),(2000,376.30000001192093,171,-1143.699999988079,12.887962,-41.574413,'world',2,'adventure','easy','Pustynna Swiatynia EP1 '),(2001,457.52243855494817,160,-1133.4550552643732,4.847953,-90.42695,'world',2,'adventure','easy','Pustynna Swiatynia EP2 '),(2002,468.8748739669178,152,-1189.7919354600199,12.394409,88.93036,'world',2,'adventure','easy','Pustynna Swiatynia EP3 '),(2003,454.4892768682815,115,-1240.493954038428,0.348486,-90.19656,'world',4,'adventure','easy','Pustynna Swiatynia EP4 '),(2010,259.49975875809923,150,-1022.3000000119209,12.998619,179.9864,'world',2,'adventure','medium','Opuszczona Wioska #1 '),(2011,238.0196476290199,151,-1112.0906980336226,23.023304,-134.15466,'world',4,'adventure','medium','Opuszczona Wioska #2 '),(2012,184.72043073704765,144,-1142.300000011921,9.792857,134.7295,'world',2,'adventure','medium','Opuszczona Wioska #3 '),(2013,162.30000001192093,150,-1072.8526553563142,24.022038,-30.488434,'world',3,'adventure','easy','Opuszczona Wioska #4 '),(2014,272.2244913798509,154,-1091.000329882074,14.566349,-89.97547,'world',3,'adventure','medium','Opuszczona Wioska #5 '),(2020,370.75591811338256,162,-1481.7517410852263,20.298916,-135.06744,'world',32,'adventure','medium','Zerwany Pomost EP.1 '),(2021,511.5,165,-1474.9988891107514,29.653223,-89.986626,'world',32,'adventure','medium','Zerwany Pomost EP.2 '),(2022,620.000098885051,166,-1503.5004343976009,12.315282,179.98212,'world',32,'adventure','medium','Zerwany Pomost EP.3 '),(2030,-158.5,131,-1112.5,2.5621948,-0.4242801,'world',2,'adventure','easy','Z Piekla Do Nieba EP1 '),(2031,-130.0576225967139,154,-1107.5394739342262,9.028677,0.5188904,'world',2,'adventure','easy','Z piekla Do Nieba EP2 '),(2032,-168.40181668751302,158,-1090.6106456397004,-0.14784876,178.79709,'world',2,'adventure','easy','Z piekla Do Nieba EP3 ');
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom`
--

DROP TABLE IF EXISTS `custom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom` (
  `id` int NOT NULL AUTO_INCREMENT,
  `effects` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=607 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom`
--

LOCK TABLES `custom` WRITE;
/*!40000 ALTER TABLE `custom` DISABLE KEYS */;
INSERT INTO `custom` VALUES (601,'JUMP:3;SPEED:3;'),(603,'SPEED:3;'),(604,'JUMP:2;'),(606,'JUMP:5;');
/*!40000 ALTER TABLE `custom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events` (
  `id` int NOT NULL,
  `type` enum('TIME_RUSH','POSITION_RUSH','PLAYS_RUSH','DISTANCE_RUSH') NOT NULL DEFAULT 'TIME_RUSH',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (1,'TIME_RUSH'),(108,'TIME_RUSH'),(2137,'TIME_RUSH');
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experience`
--

DROP TABLE IF EXISTS `experience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `experience` (
  `uuid` varchar(255) NOT NULL,
  `player` varchar(16) DEFAULT NULL,
  `xp` int DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experience`
--

LOCK TABLES `experience` WRITE;
/*!40000 ALTER TABLE `experience` DISABLE KEYS */;
INSERT INTO `experience` VALUES ('05ac44cc-4b42-4000-a4f3-9fcf7869646f','Xamyr',104260),('3c82958c-49ea-46b7-867c-581b23699b81','Desire_PvP',100331),('53c5ea72-a2b3-4374-9ba6-ffd7dcc9092f','Ibanez',13046),('5b317a41-b01a-42c9-a804-1b88aa3ef408','Navi___',4576),('70a58636-0545-44cc-b6e1-1fe7362544c6','xpawelekk_',3827),('76307eb4-df62-4305-bb61-ddec06f24911','niedoczekanie111',20382),('85f6c69b-d6d8-4adb-a1ee-f99e38358936','fredoo',12632),('8a03e238-95fc-4e05-a4ac-cfeff5337324','Hastik241',3852),('e8fa0d08-b114-45dc-a0b5-8351ab90faf4','ThisTexanDuck',438),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',40750);
/*!40000 ALTER TABLE `experience` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorites`
--

DROP TABLE IF EXISTS `favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorites` (
  `player` varchar(16) NOT NULL,
  `favorites` text NOT NULL,
  PRIMARY KEY (`player`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites`
--

LOCK TABLES `favorites` WRITE;
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;
INSERT INTO `favorites` VALUES ('Desire_PvP','1,'),('Hastik241','25,'),('Parkourowiecc','7,105,110,304,401,405,'),('Xamyr','2000,'),('xpawelekk_','23,');
/*!40000 ALTER TABLE `favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gameresults`
--

DROP TABLE IF EXISTS `gameresults`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gameresults` (
  `time` timestamp NULL DEFAULT NULL,
  `type` enum('duel','guildwar') DEFAULT NULL,
  `uuidwin` varchar(255) DEFAULT NULL,
  `winner` varchar(16) DEFAULT NULL,
  `uuidloss` varchar(255) DEFAULT NULL,
  `loser` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gameresults`
--

LOCK TABLES `gameresults` WRITE;
/*!40000 ALTER TABLE `gameresults` DISABLE KEYS */;
INSERT INTO `gameresults` VALUES ('2022-02-10 19:51:57','duel','53c5ea72-a2b3-4374-9ba6-ffd7dcc9092f','Ibanez','05ac44cc-4b42-4000-a4f3-9fcf7869646f','Xamyr'),('2022-02-11 15:17:51','duel','76307eb4-df62-4305-bb61-ddec06f24911','niedoczekanie111','05ac44cc-4b42-4000-a4f3-9fcf7869646f','Xamyr'),('2022-02-11 15:19:40','duel','76307eb4-df62-4305-bb61-ddec06f24911','niedoczekanie111','05ac44cc-4b42-4000-a4f3-9fcf7869646f','Xamyr'),('2022-02-11 22:12:40','duel','53c5ea72-a2b3-4374-9ba6-ffd7dcc9092f','Ibanez','85f6c69b-d6d8-4adb-a1ee-f99e38358936','fredoo'),('2022-02-11 22:56:40','duel','53c5ea72-a2b3-4374-9ba6-ffd7dcc9092f','Ibanez','85f6c69b-d6d8-4adb-a1ee-f99e38358936','fredoo'),('2022-02-11 22:57:45','duel','85f6c69b-d6d8-4adb-a1ee-f99e38358936','fredoo','53c5ea72-a2b3-4374-9ba6-ffd7dcc9092f','Ibanez'),('2022-02-21 20:51:51','duel','3c82958c-49ea-46b7-867c-581b23699b81','Desire_PvP','05ac44cc-4b42-4000-a4f3-9fcf7869646f','Xamyr');
/*!40000 ALTER TABLE `gameresults` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guildplayers`
--

DROP TABLE IF EXISTS `guildplayers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guildplayers` (
  `uuid` varchar(255) NOT NULL,
  `player` varchar(16) DEFAULT NULL,
  `guild` varchar(5) DEFAULT NULL,
  `rank` enum('default','officer','leader') NOT NULL DEFAULT 'default',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guildplayers`
--

LOCK TABLES `guildplayers` WRITE;
/*!40000 ALTER TABLE `guildplayers` DISABLE KEYS */;
INSERT INTO `guildplayers` VALUES ('05ac44cc-4b42-4000-a4f3-9fcf7869646f','Xamyr','PIS','leader'),('53c5ea72-a2b3-4374-9ba6-ffd7dcc9092f','Ibanez','kasd','leader'),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc','1337','leader');
/*!40000 ALTER TABLE `guildplayers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guilds`
--

DROP TABLE IF EXISTS `guilds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guilds` (
  `tag` varchar(5) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guilds`
--

LOCK TABLES `guilds` WRITE;
/*!40000 ALTER TABLE `guilds` DISABLE KEYS */;
INSERT INTO `guilds` VALUES ('1337','1337'),('kasd','asd'),('PIS','PISDA');
/*!40000 ALTER TABLE `guilds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `highscores`
--

DROP TABLE IF EXISTS `highscores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `highscores` (
  `uuid` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `player` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `course` int DEFAULT NULL,
  `time` bigint DEFAULT NULL,
  `plays` int DEFAULT NULL,
  UNIQUE KEY `player` (`player`,`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `highscores`
--

LOCK TABLES `highscores` WRITE;
/*!40000 ALTER TABLE `highscores` DISABLE KEYS */;
INSERT INTO `highscores` VALUES ('05ac44cc-4b42-4000-a4f3-9fcf7869646f','Xamyr',1,17203,27),('53c5ea72-a2b3-4374-9ba6-ffd7dcc9092f','Ibanez',1,4744,17),('05ac44cc-4b42-4000-a4f3-9fcf7869646f','Xamyr',101,-1,1),('05ac44cc-4b42-4000-a4f3-9fcf7869646f','Xamyr',11,9053,2),('53c5ea72-a2b3-4374-9ba6-ffd7dcc9092f','Ibanez',209,-1,1),('8a03e238-95fc-4e05-a4ac-cfeff5337324','Hastik241',209,3656,12),('8a03e238-95fc-4e05-a4ac-cfeff5337324','Hastik241',1,15998,6),('8a03e238-95fc-4e05-a4ac-cfeff5337324','Hastik241',11,8171,3),('8a03e238-95fc-4e05-a4ac-cfeff5337324','Hastik241',101,29399,3),('05ac44cc-4b42-4000-a4f3-9fcf7869646f','Xamyr',1401,-1,1),('8a03e238-95fc-4e05-a4ac-cfeff5337324','Hastik241',1401,25916,3),('8a03e238-95fc-4e05-a4ac-cfeff5337324','Hastik241',205,17043,4),('5b317a41-b01a-42c9-a804-1b88aa3ef408','Navi___',205,17250,3),('05ac44cc-4b42-4000-a4f3-9fcf7869646f','Xamyr',205,-1,3),('5b317a41-b01a-42c9-a804-1b88aa3ef408','Navi___',212,-1,1),('05ac44cc-4b42-4000-a4f3-9fcf7869646f','Xamyr',212,-1,1),('8a03e238-95fc-4e05-a4ac-cfeff5337324','Hastik241',212,7753,2),('8a03e238-95fc-4e05-a4ac-cfeff5337324','Hastik241',29,13648,4),('5b317a41-b01a-42c9-a804-1b88aa3ef408','Navi___',29,30754,2),('8a03e238-95fc-4e05-a4ac-cfeff5337324','Hastik241',211,14433,1),('8a03e238-95fc-4e05-a4ac-cfeff5337324','Hastik241',2,10009,3),('8a03e238-95fc-4e05-a4ac-cfeff5337324','Hastik241',5,6598,12),('5b317a41-b01a-42c9-a804-1b88aa3ef408','Navi___',2030,-1,5),('5b317a41-b01a-42c9-a804-1b88aa3ef408','Navi___',2031,42502,4),('8a03e238-95fc-4e05-a4ac-cfeff5337324','Hastik241',2031,43400,1),('8a03e238-95fc-4e05-a4ac-cfeff5337324','Hastik241',2032,36600,1),('8a03e238-95fc-4e05-a4ac-cfeff5337324','Hastik241',2030,-1,1),('8a03e238-95fc-4e05-a4ac-cfeff5337324','Hastik241',1402,14397,6),('5b317a41-b01a-42c9-a804-1b88aa3ef408','Navi___',1402,14448,16),('5b317a41-b01a-42c9-a804-1b88aa3ef408','Navi___',13,-1,1),('5b317a41-b01a-42c9-a804-1b88aa3ef408','Navi___',207,16366,3),('5b317a41-b01a-42c9-a804-1b88aa3ef408','Navi___',219,12919,9),('5b317a41-b01a-42c9-a804-1b88aa3ef408','Navi___',2000,13800,5),('5b317a41-b01a-42c9-a804-1b88aa3ef408','Navi___',2001,13715,6),('5b317a41-b01a-42c9-a804-1b88aa3ef408','Navi___',2002,22446,4),('5b317a41-b01a-42c9-a804-1b88aa3ef408','Navi___',2003,20850,3),('5b317a41-b01a-42c9-a804-1b88aa3ef408','Navi___',109,18934,6),('5b317a41-b01a-42c9-a804-1b88aa3ef408','Navi___',14,-1,1),('5b317a41-b01a-42c9-a804-1b88aa3ef408','Navi___',10,11008,5),('05ac44cc-4b42-4000-a4f3-9fcf7869646f','Xamyr',10,11951,3),('5b317a41-b01a-42c9-a804-1b88aa3ef408','Navi___',1,16600,4),('76307eb4-df62-4305-bb61-ddec06f24911','niedoczekanie111',1,1496,4),('5b317a41-b01a-42c9-a804-1b88aa3ef408','Navi___',25,12648,3),('76307eb4-df62-4305-bb61-ddec06f24911','niedoczekanie111',2,746,68),('5b317a41-b01a-42c9-a804-1b88aa3ef408','Navi___',15,14264,2),('05ac44cc-4b42-4000-a4f3-9fcf7869646f','Xamyr',2,11255,26),('5b317a41-b01a-42c9-a804-1b88aa3ef408','Navi___',100,32049,5),('76307eb4-df62-4305-bb61-ddec06f24911','niedoczekanie111',219,13050,1),('5b317a41-b01a-42c9-a804-1b88aa3ef408','Navi___',220,37664,4),('5b317a41-b01a-42c9-a804-1b88aa3ef408','Navi___',30,-1,1),('05ac44cc-4b42-4000-a4f3-9fcf7869646f','Xamyr',109,-1,2),('76307eb4-df62-4305-bb61-ddec06f24911','niedoczekanie111',220,35555,1),('5b317a41-b01a-42c9-a804-1b88aa3ef408','Navi___',112,44502,2),('76307eb4-df62-4305-bb61-ddec06f24911','niedoczekanie111',1402,15400,1),('76307eb4-df62-4305-bb61-ddec06f24911','niedoczekanie111',212,7846,2),('76307eb4-df62-4305-bb61-ddec06f24911','niedoczekanie111',209,3490,9),('76307eb4-df62-4305-bb61-ddec06f24911','niedoczekanie111',205,17401,1),('76307eb4-df62-4305-bb61-ddec06f24911','niedoczekanie111',202,19256,1),('76307eb4-df62-4305-bb61-ddec06f24911','niedoczekanie111',5,6697,7),('5b317a41-b01a-42c9-a804-1b88aa3ef408','Navi___',2032,36300,4),('5b317a41-b01a-42c9-a804-1b88aa3ef408','Navi___',5,6603,14),('76307eb4-df62-4305-bb61-ddec06f24911','niedoczekanie111',101,31304,1),('76307eb4-df62-4305-bb61-ddec06f24911','niedoczekanie111',100,32148,3),('76307eb4-df62-4305-bb61-ddec06f24911','niedoczekanie111',2000,-1,1),('76307eb4-df62-4305-bb61-ddec06f24911','niedoczekanie111',2001,13451,2),('76307eb4-df62-4305-bb61-ddec06f24911','niedoczekanie111',112,42546,2),('76307eb4-df62-4305-bb61-ddec06f24911','niedoczekanie111',109,-1,1),('76307eb4-df62-4305-bb61-ddec06f24911','niedoczekanie111',15,13555,3),('76307eb4-df62-4305-bb61-ddec06f24911','niedoczekanie111',211,14154,1),('5b317a41-b01a-42c9-a804-1b88aa3ef408','Navi___',2,7106,3),('53c5ea72-a2b3-4374-9ba6-ffd7dcc9092f','Ibanez',2,3695,11),('53c5ea72-a2b3-4374-9ba6-ffd7dcc9092f','Ibanez',30,23525,2),('76307eb4-df62-4305-bb61-ddec06f24911','niedoczekanie111',1401,25975,1),('76307eb4-df62-4305-bb61-ddec06f24911','niedoczekanie111',207,16148,2),('76307eb4-df62-4305-bb61-ddec06f24911','niedoczekanie111',30,-1,1),('85f6c69b-d6d8-4adb-a1ee-f99e38358936','fredoo',2001,16200,1),('85f6c69b-d6d8-4adb-a1ee-f99e38358936','fredoo',2002,15344,1),('53c5ea72-a2b3-4374-9ba6-ffd7dcc9092f','Ibanez',2002,12254,1),('85f6c69b-d6d8-4adb-a1ee-f99e38358936','fredoo',101,33204,5),('53c5ea72-a2b3-4374-9ba6-ffd7dcc9092f','Ibanez',101,33344,4),('53c5ea72-a2b3-4374-9ba6-ffd7dcc9092f','Ibanez',10,12001,2),('53c5ea72-a2b3-4374-9ba6-ffd7dcc9092f','Ibanez',8,12043,29),('53c5ea72-a2b3-4374-9ba6-ffd7dcc9092f','Ibanez',4,12853,7),('85f6c69b-d6d8-4adb-a1ee-f99e38358936','fredoo',4,12256,3),('85f6c69b-d6d8-4adb-a1ee-f99e38358936','fredoo',3,17042,12),('53c5ea72-a2b3-4374-9ba6-ffd7dcc9092f','Ibanez',3,16986,4),('53c5ea72-a2b3-4374-9ba6-ffd7dcc9092f','Ibanez',2000,16046,1),('85f6c69b-d6d8-4adb-a1ee-f99e38358936','fredoo',2000,24600,1),('85f6c69b-d6d8-4adb-a1ee-f99e38358936','fredoo',8,12042,41),('53c5ea72-a2b3-4374-9ba6-ffd7dcc9092f','Ibanez',11,8508,2),('85f6c69b-d6d8-4adb-a1ee-f99e38358936','fredoo',11,8250,4),('85f6c69b-d6d8-4adb-a1ee-f99e38358936','fredoo',13,49598,1),('85f6c69b-d6d8-4adb-a1ee-f99e38358936','fredoo',30,22343,1),('85f6c69b-d6d8-4adb-a1ee-f99e38358936','fredoo',25,12551,14),('53c5ea72-a2b3-4374-9ba6-ffd7dcc9092f','Ibanez',25,12510,14),('85f6c69b-d6d8-4adb-a1ee-f99e38358936','fredoo',109,20065,4),('53c5ea72-a2b3-4374-9ba6-ffd7dcc9092f','Ibanez',109,20359,3),('85f6c69b-d6d8-4adb-a1ee-f99e38358936','fredoo',2003,21906,1),('53c5ea72-a2b3-4374-9ba6-ffd7dcc9092f','Ibanez',2003,21750,2),('05ac44cc-4b42-4000-a4f3-9fcf7869646f','Xamyr',2003,51455,6),('3c82958c-49ea-46b7-867c-581b23699b81','Desire_PvP',1,19201,2),('3c82958c-49ea-46b7-867c-581b23699b81','Desire_PvP',2,12097,1),('3c82958c-49ea-46b7-867c-581b23699b81','Desire_PvP',3,17951,6),('05ac44cc-4b42-4000-a4f3-9fcf7869646f','Xamyr',3,16857,2),('05ac44cc-4b42-4000-a4f3-9fcf7869646f','Xamyr',4,12787,7),('3c82958c-49ea-46b7-867c-581b23699b81','Desire_PvP',4,12799,11),('05ac44cc-4b42-4000-a4f3-9fcf7869646f','Xamyr',5,7188,7),('05ac44cc-4b42-4000-a4f3-9fcf7869646f','Xamyr',8,12302,5),('3c82958c-49ea-46b7-867c-581b23699b81','Desire_PvP',5,7799,4),('05ac44cc-4b42-4000-a4f3-9fcf7869646f','Xamyr',15,14099,12),('8a03e238-95fc-4e05-a4ac-cfeff5337324','Hastik241',25,12491,3),('8a03e238-95fc-4e05-a4ac-cfeff5337324','Hastik241',100,31086,4),('8a03e238-95fc-4e05-a4ac-cfeff5337324','Hastik241',14,13841,1),('5b317a41-b01a-42c9-a804-1b88aa3ef408','Navi___',4,12136,1),('8a03e238-95fc-4e05-a4ac-cfeff5337324','Hastik241',4,11157,3),('8a03e238-95fc-4e05-a4ac-cfeff5337324','Hastik241',3,16490,3),('8a03e238-95fc-4e05-a4ac-cfeff5337324','Hastik241',207,16108,7),('8a03e238-95fc-4e05-a4ac-cfeff5337324','Hastik241',8,11845,11),('8a03e238-95fc-4e05-a4ac-cfeff5337324','Hastik241',7,23729,2),('8a03e238-95fc-4e05-a4ac-cfeff5337324','Hastik241',13,38766,1),('8a03e238-95fc-4e05-a4ac-cfeff5337324','Hastik241',15,12808,4),('8a03e238-95fc-4e05-a4ac-cfeff5337324','Hastik241',2000,14231,1),('8a03e238-95fc-4e05-a4ac-cfeff5337324','Hastik241',2001,14111,1),('8a03e238-95fc-4e05-a4ac-cfeff5337324','Hastik241',2002,23158,1),('8a03e238-95fc-4e05-a4ac-cfeff5337324','Hastik241',2003,20078,1),('8a03e238-95fc-4e05-a4ac-cfeff5337324','Hastik241',109,19509,1),('8a03e238-95fc-4e05-a4ac-cfeff5337324','Hastik241',112,42340,4),('8a03e238-95fc-4e05-a4ac-cfeff5337324','Hastik241',10,10942,1),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',1,15869,8),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',2,9847,6),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',3,16052,7),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',4,11150,7),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',5,6532,16),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',7,17651,4),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',8,11697,7),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',10,10553,4),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',11,7803,5),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',13,31049,4),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',14,13350,5),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',15,12152,4),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',25,12449,11),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',29,27996,10),('05ac44cc-4b42-4000-a4f3-9fcf7869646f','Xamyr',30,21796,2),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',2003,20146,10),('5b317a41-b01a-42c9-a804-1b88aa3ef408','Navi___',12,17842,3),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',12,17302,10),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',121,16302,4),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',218,13052,2),('5b317a41-b01a-42c9-a804-1b88aa3ef408','Navi___',200,18312,2),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',200,17951,6),('5b317a41-b01a-42c9-a804-1b88aa3ef408','Navi___',28,16850,4),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',28,16701,7),('05ac44cc-4b42-4000-a4f3-9fcf7869646f','Xamyr',28,18049,3),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',114,15650,5),('05ac44cc-4b42-4000-a4f3-9fcf7869646f','Xamyr',114,20100,1),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',217,20702,6),('5b317a41-b01a-42c9-a804-1b88aa3ef408','Navi___',217,-1,2),('05ac44cc-4b42-4000-a4f3-9fcf7869646f','Xamyr',217,-1,3),('05ac44cc-4b42-4000-a4f3-9fcf7869646f','Xamyr',12,19400,1),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',304,15907,4),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',108,22101,2),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',35,36699,1),('e8fa0d08-b114-45dc-a0b5-8351ab90faf4','ThisTexanDuck',1,16553,2),('5b317a41-b01a-42c9-a804-1b88aa3ef408','Navi___',35,5486,3),('e8fa0d08-b114-45dc-a0b5-8351ab90faf4','ThisTexanDuck',2,10251,3),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',104,27101,5),('e8fa0d08-b114-45dc-a0b5-8351ab90faf4','ThisTexanDuck',4,12283,1),('e8fa0d08-b114-45dc-a0b5-8351ab90faf4','ThisTexanDuck',5,7145,3),('e8fa0d08-b114-45dc-a0b5-8351ab90faf4','ThisTexanDuck',12,18851,1),('e8fa0d08-b114-45dc-a0b5-8351ab90faf4','ThisTexanDuck',14,16350,1),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',122,15750,6),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',26,7800,6),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',110,17504,8),('5b317a41-b01a-42c9-a804-1b88aa3ef408','Navi___',110,18320,1),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',18,14854,5),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',209,4003,8),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',207,15841,10),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',123,9653,5),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',2032,35550,10),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',211,13900,4),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',220,35253,8),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',219,12452,11),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',212,7598,7),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',205,16953,7),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',202,19149,5),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',2000,13654,16),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',2001,13397,16),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',2002,22300,9),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',2030,73499,9),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',2031,42603,7),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',1402,14695,7),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',1401,26153,5),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',112,41305,5),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',100,29999,5),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',101,28999,2),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',30,18550,4),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',27,23799,4),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',109,18651,4),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',31,29596,3),('05ac44cc-4b42-4000-a4f3-9fcf7869646f','Xamyr',1402,16754,1),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',17,15652,4),('05ac44cc-4b42-4000-a4f3-9fcf7869646f','Xamyr',17,17386,5),('05ac44cc-4b42-4000-a4f3-9fcf7869646f','Xamyr',600,-1,1),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',600,27152,4),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',1403,25751,5),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',1404,73052,5),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',400,14702,7),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',401,12704,8),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',402,7389,9),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',403,11252,8),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',404,27200,7),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',405,43250,5),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',406,37599,7),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',2010,31701,4),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',2011,23838,4),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',2012,27399,4),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',2013,44152,6),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',2014,43148,5),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',500,48351,6),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',501,18853,6),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',502,24699,6),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',503,19791,6),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',504,22100,6),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',505,33300,6),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',506,20146,5),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',507,23298,5),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',508,25345,5),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',509,12951,5),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',102,15954,3),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',303,8300,9),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',119,22551,3),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',105,20000,3),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',116,14699,3),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',215,23354,4),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',120,57698,4),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',21,21353,6),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',22,9348,4),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',111,12750,5),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',23,13000,6),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',20,12099,6),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',9,8547,5),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',106,12150,3),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',206,14898,7),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',216,27244,2),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',214,22650,4),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',213,19147,4),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',115,10851,4),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',204,5951,19),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',103,15254,4),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',210,14951,5),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',113,19449,4),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',117,24956,4),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',107,17149,3),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',118,12451,5),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',208,29401,6),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',16,12999,6),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',2020,55803,5),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',2021,54156,5),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',2022,29701,7),('e8fa0d08-b114-45dc-a0b5-8351ab90faf4','ThisTexanDuck',10,12191,1),('e8fa0d08-b114-45dc-a0b5-8351ab90faf4','ThisTexanDuck',16,14400,1),('e8fa0d08-b114-45dc-a0b5-8351ab90faf4','ThisTexanDuck',26,9344,1),('e8fa0d08-b114-45dc-a0b5-8351ab90faf4','ThisTexanDuck',400,15406,1),('e8fa0d08-b114-45dc-a0b5-8351ab90faf4','ThisTexanDuck',1402,15796,1),('e8fa0d08-b114-45dc-a0b5-8351ab90faf4','ThisTexanDuck',11,8804,2),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',602,13098,3),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',605,11198,3),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',203,27201,2),('05ac44cc-4b42-4000-a4f3-9fcf7869646f','Xamyr',16,14744,1),('05ac44cc-4b42-4000-a4f3-9fcf7869646f','Xamyr',26,9099,2),('3c82958c-49ea-46b7-867c-581b23699b81','Desire_PvP',7,27047,2),('05ac44cc-4b42-4000-a4f3-9fcf7869646f','Xamyr',7,27050,1),('05ac44cc-4b42-4000-a4f3-9fcf7869646f','Xamyr',304,61889,2),('3c82958c-49ea-46b7-867c-581b23699b81','Desire_PvP',304,96395,1),('05ac44cc-4b42-4000-a4f3-9fcf7869646f','Xamyr',100,56251,1),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',201,30896,4),('70a58636-0545-44cc-b6e1-1fe7362544c6','xpawelekk_',1,17351,3),('70a58636-0545-44cc-b6e1-1fe7362544c6','xpawelekk_',25,12849,4),('70a58636-0545-44cc-b6e1-1fe7362544c6','xpawelekk_',16,14947,1),('70a58636-0545-44cc-b6e1-1fe7362544c6','xpawelekk_',17,18494,3),('70a58636-0545-44cc-b6e1-1fe7362544c6','xpawelekk_',21,26001,1),('70a58636-0545-44cc-b6e1-1fe7362544c6','xpawelekk_',2000,15099,3),('05ac44cc-4b42-4000-a4f3-9fcf7869646f','Xamyr',2000,14845,1),('70a58636-0545-44cc-b6e1-1fe7362544c6','xpawelekk_',2001,16154,2),('05ac44cc-4b42-4000-a4f3-9fcf7869646f','Xamyr',2001,14795,1),('70a58636-0545-44cc-b6e1-1fe7362544c6','xpawelekk_',2031,48004,3),('70a58636-0545-44cc-b6e1-1fe7362544c6','xpawelekk_',602,14551,3),('70a58636-0545-44cc-b6e1-1fe7362544c6','xpawelekk_',605,12599,2),('70a58636-0545-44cc-b6e1-1fe7362544c6','xpawelekk_',30,22497,1),('70a58636-0545-44cc-b6e1-1fe7362544c6','xpawelekk_',604,11148,2),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',604,10850,2),('05ac44cc-4b42-4000-a4f3-9fcf7869646f','Xamyr',605,12300,3),('70a58636-0545-44cc-b6e1-1fe7362544c6','xpawelekk_',28,18152,5),('70a58636-0545-44cc-b6e1-1fe7362544c6','xpawelekk_',22,10900,1),('70a58636-0545-44cc-b6e1-1fe7362544c6','xpawelekk_',9,8848,7),('70a58636-0545-44cc-b6e1-1fe7362544c6','xpawelekk_',8,12893,3),('70a58636-0545-44cc-b6e1-1fe7362544c6','xpawelekk_',29,32902,1),('70a58636-0545-44cc-b6e1-1fe7362544c6','xpawelekk_',26,8903,3),('70a58636-0545-44cc-b6e1-1fe7362544c6','xpawelekk_',400,16249,1),('05ac44cc-4b42-4000-a4f3-9fcf7869646f','Xamyr',401,14551,1),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',601,9298,5),('05ac44cc-4b42-4000-a4f3-9fcf7869646f','Xamyr',601,9750,3),('70a58636-0545-44cc-b6e1-1fe7362544c6','xpawelekk_',601,11202,2),('05ac44cc-4b42-4000-a4f3-9fcf7869646f','Xamyr',606,23394,1),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',606,23549,2),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',603,18349,2),('70a58636-0545-44cc-b6e1-1fe7362544c6','xpawelekk_',101,38397,1),('70a58636-0545-44cc-b6e1-1fe7362544c6','xpawelekk_',104,34498,2),('70a58636-0545-44cc-b6e1-1fe7362544c6','xpawelekk_',112,48855,1),('70a58636-0545-44cc-b6e1-1fe7362544c6','xpawelekk_',2010,40851,1),('70a58636-0545-44cc-b6e1-1fe7362544c6','xpawelekk_',2011,33352,1),('70a58636-0545-44cc-b6e1-1fe7362544c6','xpawelekk_',501,24103,1),('70a58636-0545-44cc-b6e1-1fe7362544c6','xpawelekk_',2022,35099,1),('70a58636-0545-44cc-b6e1-1fe7362544c6','xpawelekk_',2030,82449,1),('70a58636-0545-44cc-b6e1-1fe7362544c6','xpawelekk_',100,49895,1),('70a58636-0545-44cc-b6e1-1fe7362544c6','xpawelekk_',23,23700,1),('70a58636-0545-44cc-b6e1-1fe7362544c6','xpawelekk_',2,10754,3),('70a58636-0545-44cc-b6e1-1fe7362544c6','xpawelekk_',3,17448,2),('70a58636-0545-44cc-b6e1-1fe7362544c6','xpawelekk_',4,13400,1),('70a58636-0545-44cc-b6e1-1fe7362544c6','xpawelekk_',5,8749,1),('70a58636-0545-44cc-b6e1-1fe7362544c6','xpawelekk_',11,9649,1),('70a58636-0545-44cc-b6e1-1fe7362544c6','xpawelekk_',103,16500,1),('70a58636-0545-44cc-b6e1-1fe7362544c6','xpawelekk_',106,12947,1),('70a58636-0545-44cc-b6e1-1fe7362544c6','xpawelekk_',123,13150,1),('70a58636-0545-44cc-b6e1-1fe7362544c6','xpawelekk_',2002,26047,1),('70a58636-0545-44cc-b6e1-1fe7362544c6','xpawelekk_',2003,22101,2),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',6,13997,11),('70a58636-0545-44cc-b6e1-1fe7362544c6','xpawelekk_',6,15898,4),('05ac44cc-4b42-4000-a4f3-9fcf7869646f','Xamyr',6,15350,18),('05ac44cc-4b42-4000-a4f3-9fcf7869646f','Xamyr',2010,35779,1),('05ac44cc-4b42-4000-a4f3-9fcf7869646f','Xamyr',2011,35550,1),('05ac44cc-4b42-4000-a4f3-9fcf7869646f','Xamyr',2012,29854,1),('05ac44cc-4b42-4000-a4f3-9fcf7869646f','Xamyr',2013,47656,1),('05ac44cc-4b42-4000-a4f3-9fcf7869646f','Xamyr',2014,47041,1),('5b317a41-b01a-42c9-a804-1b88aa3ef408','Navi___',16,14359,1),('5b317a41-b01a-42c9-a804-1b88aa3ef408','Navi___',400,15199,1),('5b317a41-b01a-42c9-a804-1b88aa3ef408','Navi___',403,11651,2),('5b317a41-b01a-42c9-a804-1b88aa3ef408','Navi___',6,15895,3),('5b317a41-b01a-42c9-a804-1b88aa3ef408','Navi___',21,22840,1),('5b317a41-b01a-42c9-a804-1b88aa3ef408','Navi___',206,15650,1),('5b317a41-b01a-42c9-a804-1b88aa3ef408','Navi___',115,12105,2),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',24,14701,5),('5b317a41-b01a-42c9-a804-1b88aa3ef408','Navi___',11,8246,3),('5b317a41-b01a-42c9-a804-1b88aa3ef408','Navi___',9,8649,7),('5b317a41-b01a-42c9-a804-1b88aa3ef408','Navi___',8,12250,1),('5b317a41-b01a-42c9-a804-1b88aa3ef408','Navi___',1403,26661,1),('5b317a41-b01a-42c9-a804-1b88aa3ef408','Navi___',509,13298,1),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',300,15155,2),('8a03e238-95fc-4e05-a4ac-cfeff5337324','Hastik241',21,21800,2),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',301,21605,2),('8a03e238-95fc-4e05-a4ac-cfeff5337324','Hastik241',6,14766,5),('05ac44cc-4b42-4000-a4f3-9fcf7869646f','Xamyr',31,36498,1),('05ac44cc-4b42-4000-a4f3-9fcf7869646f','Xamyr',603,21645,1),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc',302,41402,3),('05ac44cc-4b42-4000-a4f3-9fcf7869646f','Xamyr',2002,25293,1);
/*!40000 ALTER TABLE `highscores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playerachievements`
--

DROP TABLE IF EXISTS `playerachievements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playerachievements` (
  `uuid` varchar(255) NOT NULL,
  `player` varchar(16) NOT NULL,
  `completed` text NOT NULL,
  `progress` mediumtext NOT NULL,
  `milestones` text NOT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playerachievements`
--

LOCK TABLES `playerachievements` WRITE;
/*!40000 ALTER TABLE `playerachievements` DISABLE KEYS */;
INSERT INTO `playerachievements` VALUES ('05ac44cc-4b42-4000-a4f3-9fcf7869646f','Xamyr','1,','','1,'),('3c82958c-49ea-46b7-867c-581b23699b81','Desire_PvP','1,','','1,'),('53c5ea72-a2b3-4374-9ba6-ffd7dcc9092f','Ibanez','1,','','1,'),('5b317a41-b01a-42c9-a804-1b88aa3ef408','Navi___','1,','','1,'),('68a53dac-cf3e-421f-ab52-986441e932ec','Nietgezondytt','','',''),('70a58636-0545-44cc-b6e1-1fe7362544c6','xpawelekk_','1,','','1,'),('76307eb4-df62-4305-bb61-ddec06f24911','niedoczekanie111','','',''),('85f6c69b-d6d8-4adb-a1ee-f99e38358936','fredoo','','',''),('8a03e238-95fc-4e05-a4ac-cfeff5337324','Hastik241','','',''),('e8fa0d08-b114-45dc-a0b5-8351ab90faf4','ThisTexanDuck','1,','','1,'),('f3363094-ff55-453b-9dec-d7b46ef2234e','Parkourowiecc','1,','','1,');
/*!40000 ALTER TABLE `playerachievements` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-24 10:38:23
