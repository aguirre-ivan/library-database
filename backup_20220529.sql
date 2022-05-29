-- MySQL dump 10.13  Distrib 8.0.25, for Linux (x86_64)
--
-- Host: localhost    Database: library
-- ------------------------------------------------------
-- Server version	8.0.29-0ubuntu0.22.04.2

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

/*

Only data backup from all tables excepting log tables (log_statement, log_loan, log_deleted_book_return)

Date: 2022/05/29

*/

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES (1,'Kaylyn','Tournay',41),(2,'Carree','Ruselin',23),(3,'Norma','Ivison',7),(4,'Margalit','Asple',25),(5,'Rickard','Campion',35),(6,'Lu','Sessuns',17),(7,'Tamera','Orgill',13),(8,'Felix','Oxer',27),(9,'Bonnie','Capeloff',10),(10,'Cirilo','De la Perrelle',12),(11,'Carolina','Found',10),(12,'Kayley','Scutchin',20),(13,'Rochelle','Mushet',16),(14,'Sigfried','Hartell',12),(15,'Lorettalorna','McRonald',30),(16,'Dominique','Esilmon',28),(17,'Gilligan','Bohden',25),(18,'Darius','Braunes',39),(19,'Renell','Mapowder',32),(20,'Heida','Gianinotti',30);
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (1,16,'Gone in 60 Seconds','Fusce posuere felis sed lacus.','1975-11-12',40),(2,15,'Eight Men Out','Pellentesque at NULL,a.','1998-05-12',43),(3,4,'Turbulence','Morbi non quam nec dui luctus rutrum.','1991-12-02',40),(4,11,'Kimjongilia','Phasellus sit amet erat.','1999-07-19',8),(5,15,'Hold Back the Dawn','Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci.','1945-05-08',45),(6,7,'Happy Campers','Proin risus.','2007-02-12',18),(7,8,'Heidi','In congue.','1998-01-01',46),(8,12,'Seize the Day','Vestibulum ac est lacinia nisi venenatis tristique.','1946-03-05',33),(9,7,'Rundown, The','Quisque porta volutpat erat.','1932-04-06',31),(10,7,'Ransom','Aliquam sit amet diam in magna bibendum imperdiet.','1998-09-03',46),(11,21,'Devil\'s Double, The','Cras non velit nec nisi vulputate nonummy.','1960-01-10',49),(12,1,'You\'re Next','Mauris lacinia sapien quis libero.','1980-09-15',30),(13,11,'Adam\'s Apples (Adams æbler)','Cras non velit nec nisi vulputate nonummy.','1951-08-08',39),(14,8,'Expect No Mercy','Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue.','1962-03-17',12),(15,24,'Snows of Kilimanjaro','Suspendisse potenti.','1963-12-19',20),(16,6,'Executive Action','Aenean sit amet justo.','1954-08-08',27),(17,23,'Goodbye, Mr. Chips','Donec vitae nisi.','1990-08-02',29),(18,19,'Little Women','Curabitur gravida nisi at nibh.','1997-05-22',23),(19,21,'Beast of Yucca Flats, The','Nullam varius.','1937-08-27',16),(20,12,'Rhyme & Reason','Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.','1935-02-09',8);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `book_author`
--

LOCK TABLES `book_author` WRITE;
/*!40000 ALTER TABLE `book_author` DISABLE KEYS */;
INSERT INTO `book_author` VALUES (8,1),(7,2),(6,3),(5,4),(14,5),(13,6),(12,7),(11,8),(12,9),(13,10),(13,11),(13,12),(14,13),(15,14),(16,15),(18,16),(18,17),(19,18),(20,19);
/*!40000 ALTER TABLE `book_author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `book_category`
--

LOCK TABLES `book_category` WRITE;
/*!40000 ALTER TABLE `book_category` DISABLE KEYS */;
INSERT INTO `book_category` VALUES (18,1),(13,2),(15,3),(17,4),(2,5),(1,6),(2,7),(9,8),(16,9),(11,10),(1,11),(3,12),(7,13),(13,14),(22,15),(14,16),(10,17),(6,18),(3,19);
/*!40000 ALTER TABLE `book_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `book_inventory`
--

LOCK TABLES `book_inventory` WRITE;
/*!40000 ALTER TABLE `book_inventory` DISABLE KEYS */;
INSERT INTO `book_inventory` VALUES (1,13,4),(2,15,4),(3,20,4),(4,17,4),(5,12,4),(6,5,4),(7,13,4),(8,17,4),(9,11,4),(10,13,4),(11,6,1),(12,16,1),(13,8,1),(14,7,1),(15,17,1),(16,14,1),(17,9,3),(18,16,1),(19,15,1),(20,17,1),(21,18,1),(22,2,1),(23,5,1),(24,3,1),(25,9,1),(26,16,1),(27,7,1),(28,5,1),(29,3,3),(30,8,2),(31,18,2),(32,8,2),(33,6,2),(34,5,2),(35,15,2),(36,7,2),(37,3,2),(38,11,2),(39,10,2),(40,5,2),(41,8,1),(42,1,1),(43,8,1),(44,2,1),(45,10,1),(46,1,3),(47,2,1),(48,17,1),(49,16,1),(50,5,1),(51,15,1),(52,5,3),(53,10,1),(54,8,1),(55,2,1),(56,15,1),(57,8,1),(58,19,1),(59,4,1),(60,12,1),(61,13,1),(62,8,1),(63,4,1),(64,3,3),(65,17,3),(66,6,3),(67,2,1),(68,14,1),(69,6,3),(70,3,1),(71,13,3),(72,12,3),(73,2,3),(74,12,3),(75,7,1),(76,7,1),(77,3,1),(78,17,1),(79,15,1),(80,12,1),(81,7,1),(82,19,1),(83,1,1),(84,5,3),(85,1,3),(86,1,1),(87,16,3),(88,9,1),(89,18,3),(90,15,1),(91,5,1),(92,7,1),(93,15,1),(94,8,1),(95,4,3),(96,4,1),(97,17,3),(98,8,1),(99,8,3),(100,7,1);
/*!40000 ALTER TABLE `book_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `book_language`
--

LOCK TABLES `book_language` WRITE;
/*!40000 ALTER TABLE `book_language` DISABLE KEYS */;
INSERT INTO `book_language` VALUES (1,'Maltese'),(2,'Tsonga'),(3,'Kurdish'),(4,'Nepali'),(5,'Somali'),(6,'Afrikaans'),(7,'Filipino'),(8,'Amharic'),(9,'Bengali'),(10,'Czech'),(11,'Gujarati'),(12,'Kazakh'),(13,'Swati'),(14,'Aymara'),(15,'Māori'),(16,'Fijian'),(17,'Mongolian'),(18,'Yiddish'),(19,'Macedonian'),(20,'Lao'),(21,'Polish'),(22,'Bislama'),(23,'Guaraní'),(24,'Dutch'),(25,'Bosnian'),(26,'Indonesian'),(27,'Norwegian'),(28,'Marathi'),(29,'Catalan'),(30,'Khmer'),(31,'Tswana'),(32,'Burmese'),(33,'Bulgarian'),(34,'Croatian'),(35,'Finnish'),(36,'Swedish'),(37,'Northern Sotho'),(38,'Hungarian'),(39,'Estonian'),(40,'Malagasy'),(41,'Montenegrin'),(42,'Swahili'),(43,'Spanish'),(44,'Telugu'),(45,'Kyrgyz'),(46,'Kashmiri'),(47,'Latvian'),(48,'Gagauz'),(49,'Oriya'),(50,'Papiamento'),(51,'Italian'),(52,'Albanian'),(53,'Dhivehi'),(54,'Portuguese'),(55,'Pashto'),(56,'Tetum'),(57,'German'),(58,'Armenian'),(59,'West Frisian'),(60,'Chinese'),(61,'Danish');
/*!40000 ALTER TABLE `book_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `book_return`
--

LOCK TABLES `book_return` WRITE;
/*!40000 ALTER TABLE `book_return` DISABLE KEYS */;
INSERT INTO `book_return` VALUES (1,1,'2022-01-04 00:00:00'),(2,2,'2022-01-05 00:00:00'),(3,3,'2022-01-06 00:00:00'),(4,4,'2022-01-07 00:00:00'),(5,5,'2022-01-08 00:00:00'),(6,6,'2022-01-09 00:00:00'),(7,7,'2022-01-10 00:00:00'),(8,8,'2022-01-11 00:00:00'),(9,9,'2022-01-12 00:00:00'),(10,10,'2022-01-13 00:00:00'),(11,11,'2022-01-14 00:00:00'),(12,12,'2022-01-15 00:00:00'),(13,13,'2022-01-16 00:00:00'),(14,14,'2022-01-17 00:00:00'),(15,15,'2022-01-18 00:00:00'),(16,16,'2022-01-19 00:00:00'),(17,17,'2022-01-20 00:00:00'),(18,18,'2022-01-21 00:00:00'),(19,19,'2022-01-22 00:00:00'),(20,20,'2022-01-23 00:00:00'),(21,21,'2022-01-24 00:00:00'),(22,22,'2022-01-25 00:00:00'),(23,23,'2022-01-26 00:00:00'),(24,24,'2022-01-27 00:00:00'),(25,25,'2022-01-28 00:00:00'),(26,26,'2022-01-29 00:00:00'),(27,27,'2022-01-30 00:00:00'),(28,28,'2022-01-31 00:00:00'),(29,29,'2022-02-01 00:00:00'),(30,30,'2022-02-02 00:00:00'),(31,31,'2022-02-03 00:00:00'),(32,32,'2022-02-04 00:00:00'),(33,33,'2022-02-05 00:00:00'),(34,34,'2022-02-06 00:00:00'),(35,35,'2022-02-07 00:00:00'),(36,36,'2022-02-08 00:00:00'),(37,37,'2022-02-09 00:00:00'),(38,38,'2022-02-10 00:00:00'),(39,39,'2022-02-11 00:00:00'),(40,40,'2022-02-12 00:00:00'),(41,41,'2022-02-13 00:00:00'),(42,42,'2022-02-14 00:00:00'),(43,43,'2022-02-15 00:00:00'),(44,44,'2022-02-16 00:00:00'),(45,45,'2022-02-17 00:00:00'),(46,46,'2022-02-18 00:00:00'),(47,47,'2022-02-19 00:00:00'),(48,48,'2022-02-20 00:00:00'),(49,49,'2022-02-21 00:00:00'),(50,50,'2022-02-22 00:00:00'),(51,51,'2022-02-23 00:00:00'),(52,52,'2022-02-24 00:00:00'),(53,53,'2022-02-25 00:00:00'),(54,54,'2022-02-26 00:00:00'),(55,55,'2022-02-27 00:00:00'),(56,56,'2022-02-28 00:00:00'),(57,57,'2022-03-01 00:00:00'),(58,58,'2022-03-02 00:00:00'),(59,59,'2022-03-03 00:00:00'),(60,60,'2022-03-04 00:00:00'),(61,61,'2022-03-05 00:00:00'),(62,62,'2022-03-06 00:00:00'),(63,63,'2022-03-07 00:00:00'),(64,64,'2022-03-08 00:00:00'),(65,65,'2022-03-09 00:00:00'),(66,66,'2022-03-10 00:00:00'),(67,67,'2022-03-11 00:00:00'),(68,68,'2022-03-12 00:00:00'),(69,69,'2022-03-13 00:00:00'),(70,70,'2022-03-14 00:00:00'),(71,71,'2022-03-15 00:00:00'),(72,72,'2022-03-16 00:00:00'),(73,73,'2022-03-17 00:00:00'),(74,74,'2022-03-18 00:00:00'),(75,75,'2022-03-19 00:00:00'),(76,76,'2022-03-20 00:00:00'),(77,77,'2022-03-21 00:00:00'),(78,78,'2022-03-22 00:00:00'),(79,79,'2022-03-23 00:00:00'),(80,80,'2022-03-24 00:00:00'),(81,81,'2022-03-25 00:00:00'),(82,82,'2022-03-26 00:00:00'),(83,83,'2022-03-27 00:00:00');
/*!40000 ALTER TABLE `book_return` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `book_status`
--

LOCK TABLES `book_status` WRITE;
/*!40000 ALTER TABLE `book_status` DISABLE KEYS */;
INSERT INTO `book_status` VALUES (1,'Stock'),(2,'Lost'),(3,'Destroyed'),(4,'Borrowed');
/*!40000 ALTER TABLE `book_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Adventure'),(2,'Manga'),(3,'Documentary'),(4,'Comedy'),(5,'Classic'),(6,'Western'),(7,'Superhero'),(8,'Fantasy'),(9,'Children'),(10,'Drama'),(11,'Horror'),(12,'Mystery'),(13,'Crime'),(14,'Fairytale'),(15,'Romantic'),(16,'Supernatural'),(17,'Lovecraftian'),(18,'Feminist'),(19,'Gothic'),(20,'Military'),(21,'Math'),(22,'Paranormal'),(23,'Bibliography'),(24,'Sports'),(25,'Travel'),(26,'Academic');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'Ukraine'),(2,'Portugal'),(3,'Philippines'),(4,'Czech Republic'),(5,'Sweden'),(6,'Indonesia'),(7,'China'),(8,'Peru'),(9,'United States'),(10,'Afghanistan'),(11,'Austria'),(12,'Poland'),(13,'Colombia'),(14,'Finland'),(15,'Azerbaijan'),(16,'Japan'),(17,'Russia'),(18,'Chad'),(19,'France'),(20,'Mexico'),(21,'Uruguay'),(22,'Norway'),(23,'Syria'),(24,'Croatia'),(25,'Kuwait'),(26,'Brazil'),(27,'Argentina'),(28,'Honduras'),(29,'Slovakia'),(30,'Pakistan'),(31,'Belarus'),(32,'Namibia'),(33,'Spain'),(34,'Guam'),(35,'Greece'),(36,'Cuba'),(37,'Iran'),(38,'Myanmar'),(39,'Mongolia'),(40,'Australia'),(41,'United Kingdom'),(42,'South Africa');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Luis','Bortolussi',45052263,'5716627961','lbortolussi0@creativecommons.org','1950-12-03'),(2,'Lenette','Kamien',48808333,'9833704792','lkamien1@ow.ly','1961-06-03'),(3,'Quinta','Scrimgeour',38931774,'2775502630','qscrimgeour2@theglobeandmail.com','1946-03-08'),(4,'Morganica','Pedden',46617101,'7709991932','mpedden3@w3.org','2001-01-10'),(5,'Urban','Farlane',40643709,'5641304618','ufarlane4@exblog.jp','1986-05-30'),(6,'Andres','Osant',31631991,'8362105839','aosant5@theglobeandmail.com','1945-09-30'),(7,'Chicky','Forstall',45465031,'5246940213','cforstall6@rambler.ru','1974-03-28'),(8,'Cassondra','Cotgrave',31844893,'2251940018','ccotgrave7@yellowpages.com','1955-06-07'),(9,'Keene','Klimentov',40988252,'9722038773','kklimentov8@google.com.au','1976-05-28'),(10,'Cori','McNeill',38730144,'6118738893','cmcneill9@columbia.edu','1999-12-02'),(11,'Wynny','Gloy',47364655,'3083067387','wgloya@usatoday.com','1961-07-04'),(12,'Elsinore','Wybrow',40635577,'7296748783','ewybrowc@instagram.com','1961-08-23'),(13,'Nada','Ledford',39792687,'8965986794','nledfordd@indiatimes.com','1940-10-17'),(14,'Hilde','Scarfe',30245423,'4354674240','hscarfee@vk.com','1989-03-20'),(15,'Rorie','Benettelli',42368235,'8304418456','rbenettellif@yolasite.com','1949-08-15'),(16,'Arie','Glanville',41528188,'7138361044','aglanvilleg@virginia.edu','1986-12-27'),(17,'Mela','Bangle',34541293,'9085095187','mbangleh@tmall.com','1988-01-16'),(18,'Olvan','Forkan',34743549,'7329898345','oforkani@altervista.org','1973-06-28'),(19,'Tessy','Fitter',44946439,'1122901626','tfitterj@exblog.jp','1962-05-11'),(20,'Cathyleen','Novello',42593410,'8109124656','cnovellok@theguardian.com','1979-01-09'),(21,'Rodolphe','Larmouth',37797317,'8342452115','rlarmouthm@blog.com','1980-12-30'),(22,'Linn','Iacovacci',38256811,'9549761296','liacovaccin@mlb.com','1941-02-08'),(23,'Nicol','Szwarc',40722439,'7299837030','nszwarco@theguardian.com','1979-05-30'),(24,'Brant','Gelder',47965235,'8914491933','bgelderp@g.co','1987-11-14'),(25,'Emera','Eefting',47102539,'5435975340','eeeftingq@spiegel.de','1995-07-14'),(26,'Lefty','Knok',32932989,'1936680322','lknoks@cbslocal.com','1944-02-26'),(27,'Sheila-kathryn','Spencer',38025908,'4816945827','sspencert@omniture.com','1990-01-06'),(28,'Winnah','Beevens',45395195,'9667160351','wbeevensu@walmart.com','1960-12-06'),(29,'Margot','Lovstrom',44087268,'1123142729','mlovstromv@netvibes.com','1979-01-19'),(30,'Sascha','McConnal',46588134,'3416726962','smcconnalw@surveymonkey.com','1980-12-17'),(31,'Danny','Selcraig',40692788,'2868471870','dselcraigx@weebly.com','1967-05-20'),(32,'Emalee','Wilbore',43055430,'2786437709','ewilborey@odnoklassniki.ru','1998-08-17'),(33,'Leoine','Langfat',32209120,'7646485114','llangfatz@eventbrite.com','1997-03-01'),(34,'Miranda','Grover',37619656,'2084987834','mgrover10@yellowbook.com','1942-12-16'),(35,'Genvieve','Hartzenberg',47347407,'3115035506','ghartzenberg11@telegraph.co.uk','1976-08-18'),(36,'Bendick','Ockwell',42806477,'3423908320','bockwell12@businessweek.com','1970-09-03'),(37,'Pandora','Londors',44827735,'5595914462','plondors13@gravatar.com','1985-01-14'),(38,'Sari','Grogor',44568826,'8578406432','sgrogor14@yahoo.co.jp','1946-07-08'),(39,'Corene','Maykin',43783993,'2211321077','cmaykin15@wiley.com','1995-07-27'),(40,'Cal','Flancinbaum',34960913,'7631016256','cflancinbaum16@nba.com','1949-05-02'),(41,'Leia','Cham',38566893,'5996100075','lcham18@storify.com','2000-02-28'),(42,'Venus','Hinder',35300610,'6016195310','vhinder19@jimdo.com','1957-12-16'),(43,'Dorrie','Livens',39140593,'5497499786','dlivens1a@indiatimes.com','1997-11-08'),(44,'Dehlia','Monsey',45782268,'4392296558','dmonsey1b@tripadvisor.com','1995-06-10'),(45,'Walther','Abbatini',47902554,'3505138085','wabbatini1c@mac.com','1972-06-10'),(46,'Berton','Teasdale-Markie',39084373,'4703349301','bteasdalemarkie1d@ehow.com','1973-12-01'),(47,'Kurt','Augie',39713589,'6291553062','kaugie1e@xinhuanet.com','1995-08-30'),(48,'Carmelina','Tustin',35612213,'5197613604','ctustin1f@fastcompany.com','1980-09-06'),(49,'Virginie','Ebourne',32975589,'9794143885','vebourne1g@mozilla.org','1965-06-13'),(50,'Dottie','Fireman',47271186,'9083482924','dfireman1h@bbb.org','1946-06-18'),(51,'Gaylene','Skoyles',41839785,'1905820208','gskoyles1j@canalblog.com','1995-12-01'),(52,'Ollie','Flagg',47743092,'9922042795','oflagg1k@scribd.com','1950-08-10'),(53,'Carmine','Stones',48221334,'7717812998','cstones1l@aboutads.info','1967-09-14'),(54,'Elwyn','Petteford',44690199,'5364040903','epetteford1m@psu.edu','1983-01-17'),(55,'Mitchell','Suttaby',32832899,'2845018018','msuttaby1n@washington.edu','1988-11-10'),(56,'Elisabeth','Garvan',30195266,'5795063290','egarvan1o@dmoz.org','1965-04-15'),(57,'Alvis','Silverlock',37052294,'2077232284','asilverlock1p@yelp.com','1969-10-09'),(58,'Karrie','Coope',33817879,'2568524319','kcoope1q@salon.com','1993-08-09'),(59,'Isaak','Labb',48265881,'8656846376','ilabb1r@freewebs.com','1950-12-01'),(60,'Gordon','Glasby',44250876,'9305168423','gglasby1s@blogspot.com','1981-04-19'),(61,'Maurise','Iacobo',44949901,'1146907299','miacobo1t@yellowpages.com','2001-07-10'),(62,'Janean','Wisby',45195412,'6565798252','jwisby1u@youtu.be','1953-04-22'),(63,'Emalia','Demangeon',48168820,'5192817210','edemangeon1v@blogger.com','1981-05-23'),(64,'Dyanne','Janous',39309302,'7129611977','djanous1w@pcworld.com','2004-01-11'),(65,'Staci','Clemmens',42864463,'8632476222','sclemmens1x@ebay.co.uk','1958-02-12'),(66,'Dorene','Waddy',30228534,'1102959767','dwaddy1y@google.fr','1949-12-19'),(67,'Roxane','Leslie',42256321,'4213567225','rleslie1z@redcross.org','1954-06-08'),(68,'Berri','Balint',44390296,'4494617445','bbalint20@timesonline.co.uk','1979-03-14'),(69,'Samara','Chartres',41600607,'5442027870','schartres21@macromedia.com','1970-12-27'),(70,'Barde','Ciottoi',45673339,'6015967701','bciottoi22@google.cn','1983-03-17'),(71,'Davy','Tobin',44430162,'9578015049','dtobin23@github.io','1959-07-05'),(72,'Shannon','Daens',44554924,'9627072996','sdaens24@google.pl','1973-01-04'),(73,'Ahmad','Cutsforth',47681999,'4728906954','acutsforth25@myspace.com','1996-12-18'),(74,'Percy','Jannequin',40852143,'3451165372','pjannequin26@netvibes.com','1963-02-22'),(75,'Eleonora','Elijah',47264261,'3852977855','eelijah27@apache.org','1976-05-16'),(76,'Lambert','Nucator',41419910,'8064623628','lnucator28@gravatar.com','1995-07-03'),(77,'Holt','Schuler',34709824,'5014670351','hschuler29@posterous.com','1982-08-19'),(78,'Kaela','Ambridge',48879915,'7417455223','kambridge2a@oakley.com','1970-03-16'),(79,'Leanora','Axston',40971901,'2818266802','laxston2b@symantec.com','1942-03-29'),(80,'Teddi','Boch',48814300,'6035303187','tboch2c@barnesandnoble.com','1987-10-27'),(81,'Alvy','McCullock',48321341,'4594162325','amccullock2d@etsy.com','1980-12-05'),(82,'Rhianon','Emes',46693585,'2924825938','remes2e@whitehouse.gov','1969-12-10'),(83,'Stillman','Dalling',35683668,'4648073740','sdalling2f@japanpost.jp','2002-09-18'),(84,'Shellysheldon','Bissatt',32496790,'4516409508','sbissatt2g@wikispaces.com','1978-09-18'),(85,'Barton','Berdale',47189723,'3449568525','bberdale2h@issuu.com','1953-05-24'),(86,'Orazio','Guion',46358112,'5006822753','oguion2i@wp.com','1973-04-23'),(87,'Charla','Novkovic',38990860,'6302734439','cnovkovic2j@rambler.ru','1998-08-05'),(88,'Doralyn','Gendrich',35837179,'7515065514','dgendrich2k@symantec.com','1986-06-18'),(89,'Nissy','Drohun',37898394,'2082146961','ndrohun2l@craigslist.org','1966-02-01'),(90,'Alvira','Diggell',43885105,'9226171317','adiggell2m@youtu.be','1992-12-28'),(91,'Paula','Behninck',32303363,'7612820567','pbehninck2n@sciencedirect.com','1946-01-30'),(92,'Griff','Priscott',47000325,'7916369317','gpriscott2o@unicef.org','2002-01-22'),(93,'Gabie','Skeggs',47990242,'1426168883','gskeggs2p@blinklist.com','2002-07-22'),(94,'Abran','Broadway',32087627,'1169911030','abroadway2q@usatoday.com','1963-06-28'),(95,'Cristie','Garrad',48478845,'7268082334','cgarrad2r@tumblr.com','1974-10-02');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `loan`
--

LOCK TABLES `loan` WRITE;
/*!40000 ALTER TABLE `loan` DISABLE KEYS */;
INSERT INTO `loan` VALUES (1,17,40,'2022-01-01 00:00:00','2022-01-08 00:00:00'),(2,6,50,'2022-01-02 00:00:00','2022-01-09 00:00:00'),(3,3,43,'2022-01-03 00:00:00','2022-01-10 00:00:00'),(4,9,44,'2022-01-04 00:00:00','2022-01-11 00:00:00'),(5,13,45,'2022-01-05 00:00:00','2022-01-12 00:00:00'),(6,10,30,'2022-01-06 00:00:00','2022-01-13 00:00:00'),(7,9,20,'2022-01-07 00:00:00','2022-01-14 00:00:00'),(8,6,11,'2022-01-08 00:00:00','2022-01-15 00:00:00'),(9,3,13,'2022-01-09 00:00:00','2022-01-16 00:00:00'),(10,16,10,'2022-01-10 00:00:00','2022-01-17 00:00:00'),(11,15,88,'2022-01-11 00:00:00','2022-01-18 00:00:00'),(12,7,31,'2022-01-12 00:00:00','2022-01-19 00:00:00'),(13,15,40,'2022-01-13 00:00:00','2022-01-20 00:00:00'),(14,4,78,'2022-01-14 00:00:00','2022-01-21 00:00:00'),(15,11,80,'2022-01-15 00:00:00','2022-01-22 00:00:00'),(16,1,41,'2022-01-16 00:00:00','2022-01-23 00:00:00'),(17,19,28,'2022-01-17 00:00:00','2022-01-24 00:00:00'),(18,5,19,'2022-01-18 00:00:00','2022-01-25 00:00:00'),(19,14,41,'2022-01-19 00:00:00','2022-01-26 00:00:00'),(20,7,40,'2022-01-20 00:00:00','2022-01-27 00:00:00'),(21,18,21,'2022-01-21 00:00:00','2022-01-28 00:00:00'),(22,1,81,'2022-01-22 00:00:00','2022-01-29 00:00:00'),(23,1,67,'2022-01-23 00:00:00','2022-01-30 00:00:00'),(24,18,28,'2022-01-24 00:00:00','2022-01-31 00:00:00'),(25,11,67,'2022-01-25 00:00:00','2022-02-01 00:00:00'),(26,4,27,'2022-01-26 00:00:00','2022-02-02 00:00:00'),(27,7,14,'2022-01-27 00:00:00','2022-02-03 00:00:00'),(28,11,53,'2022-01-28 00:00:00','2022-02-04 00:00:00'),(29,13,76,'2022-01-29 00:00:00','2022-02-05 00:00:00'),(30,9,29,'2022-01-30 00:00:00','2022-02-06 00:00:00'),(31,5,42,'2022-01-31 00:00:00','2022-02-07 00:00:00'),(32,1,31,'2022-02-01 00:00:00','2022-02-08 00:00:00'),(33,3,65,'2022-02-02 00:00:00','2022-02-09 00:00:00'),(34,16,46,'2022-02-03 00:00:00','2022-02-10 00:00:00'),(35,19,40,'2022-02-04 00:00:00','2022-02-11 00:00:00'),(36,3,12,'2022-02-05 00:00:00','2022-02-12 00:00:00'),(37,15,57,'2022-02-06 00:00:00','2022-02-13 00:00:00'),(38,6,37,'2022-02-07 00:00:00','2022-02-14 00:00:00'),(39,19,45,'2022-02-08 00:00:00','2022-02-15 00:00:00'),(40,2,11,'2022-02-09 00:00:00','2022-02-16 00:00:00'),(41,18,82,'2022-02-10 00:00:00','2022-02-17 00:00:00'),(42,7,18,'2022-02-11 00:00:00','2022-02-18 00:00:00'),(43,17,13,'2022-02-12 00:00:00','2022-02-19 00:00:00'),(44,8,27,'2022-02-13 00:00:00','2022-02-20 00:00:00'),(45,13,67,'2022-02-14 00:00:00','2022-02-21 00:00:00'),(46,16,18,'2022-02-15 00:00:00','2022-02-22 00:00:00'),(47,3,13,'2022-02-16 00:00:00','2022-02-23 00:00:00'),(48,1,58,'2022-02-17 00:00:00','2022-02-24 00:00:00'),(49,2,38,'2022-02-18 00:00:00','2022-02-25 00:00:00'),(50,6,58,'2022-02-19 00:00:00','2022-02-26 00:00:00'),(51,4,45,'2022-02-20 00:00:00','2022-02-27 00:00:00'),(52,8,93,'2022-02-21 00:00:00','2022-02-28 00:00:00'),(53,15,68,'2022-02-22 00:00:00','2022-03-01 00:00:00'),(54,19,35,'2022-02-23 00:00:00','2022-03-02 00:00:00'),(55,7,72,'2022-02-24 00:00:00','2022-03-03 00:00:00'),(56,9,91,'2022-02-25 00:00:00','2022-03-04 00:00:00'),(57,19,91,'2022-02-26 00:00:00','2022-03-05 00:00:00'),(58,12,39,'2022-02-27 00:00:00','2022-03-06 00:00:00'),(59,3,68,'2022-02-28 00:00:00','2022-03-07 00:00:00'),(60,10,60,'2022-03-01 00:00:00','2022-03-08 00:00:00'),(61,18,41,'2022-03-02 00:00:00','2022-03-09 00:00:00'),(62,16,69,'2022-03-03 00:00:00','2022-03-10 00:00:00'),(63,12,75,'2022-03-04 00:00:00','2022-03-11 00:00:00'),(64,6,62,'2022-03-05 00:00:00','2022-03-12 00:00:00'),(65,6,63,'2022-03-06 00:00:00','2022-03-13 00:00:00'),(66,5,98,'2022-03-07 00:00:00','2022-03-14 00:00:00'),(67,15,44,'2022-03-08 00:00:00','2022-03-15 00:00:00'),(68,6,29,'2022-03-09 00:00:00','2022-03-16 00:00:00'),(69,15,39,'2022-03-10 00:00:00','2022-03-17 00:00:00'),(70,18,37,'2022-03-11 00:00:00','2022-03-18 00:00:00'),(71,6,48,'2022-03-12 00:00:00','2022-03-19 00:00:00'),(72,4,19,'2022-03-13 00:00:00','2022-03-20 00:00:00'),(73,16,69,'2022-03-14 00:00:00','2022-03-21 00:00:00'),(74,9,95,'2022-03-15 00:00:00','2022-03-22 00:00:00'),(75,1,41,'2022-03-16 00:00:00','2022-03-23 00:00:00'),(76,7,56,'2022-03-17 00:00:00','2022-03-24 00:00:00'),(77,15,66,'2022-03-18 00:00:00','2022-03-25 00:00:00'),(78,8,18,'2022-03-19 00:00:00','2022-03-26 00:00:00'),(79,8,96,'2022-03-20 00:00:00','2022-03-27 00:00:00'),(80,15,98,'2022-03-21 00:00:00','2022-03-28 00:00:00'),(81,17,14,'2022-03-22 00:00:00','2022-03-29 00:00:00'),(82,3,32,'2022-03-23 00:00:00','2022-03-30 00:00:00'),(83,9,40,'2022-03-24 00:00:00','2022-03-31 00:00:00'),(84,8,1,'2022-03-25 00:00:00','2022-04-01 00:00:00'),(85,14,2,'2022-03-26 00:00:00','2022-04-02 00:00:00'),(86,6,3,'2022-03-27 00:00:00','2022-04-03 00:00:00'),(87,17,4,'2022-03-28 00:00:00','2022-04-04 00:00:00'),(88,8,5,'2022-03-29 00:00:00','2022-04-05 00:00:00'),(89,2,6,'2022-03-30 00:00:00','2022-04-06 00:00:00'),(90,3,7,'2022-03-31 00:00:00','2022-04-07 00:00:00'),(91,14,8,'2022-04-01 00:00:00','2022-04-08 00:00:00'),(92,8,9,'2022-04-02 00:00:00','2022-04-09 00:00:00'),(93,11,10,'2022-04-03 00:00:00','2022-04-10 00:00:00');
/*!40000 ALTER TABLE `loan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `publisher`
--

LOCK TABLES `publisher` WRITE;
/*!40000 ALTER TABLE `publisher` DISABLE KEYS */;
INSERT INTO `publisher` VALUES (1,'WALGREENS'),(2,'Digoxin'),(3,'Urea'),(4,'Lornamead'),(5,'Morphine Sulfate'),(6,'Se-Care Chewable'),(7,'Indomethacin'),(8,'Rabeprazole Sodium'),(9,'Cramergesic'),(10,'ibuprofen'),(11,'OFFBite and Itch Rel'),(12,'REMERONSOLTAB'),(13,'Levofloxacin'),(14,'Ketoconazole'),(15,'Lisinopril'),(16,'Pleo Art A'),(17,'STOOL SOFTENER'),(18,'Methimazole'),(19,'Amino Acids'),(20,'Oxygen'),(21,'Paricalcitol'),(22,'DELFLEX'),(23,'Amoeba Tox'),(24,'Lovastatin'),(25,'Lidocoll'),(26,'Inflammation'),(27,'Trilipix'),(28,'PROCORT'),(29,'Secret Roll-On');
/*!40000 ALTER TABLE `publisher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `storage_location`
--

LOCK TABLES `storage_location` WRITE;
/*!40000 ALTER TABLE `storage_location` DISABLE KEYS */;
INSERT INTO `storage_location` VALUES (1,21,1),(2,14,47),(3,39,56),(4,9,51),(5,34,19),(8,3,33),(9,29,33),(10,35,1),(11,12,30),(13,20,20),(14,22,4),(15,23,44),(16,32,19),(18,24,4),(20,17,13),(21,6,8),(24,30,3),(25,18,44),(26,8,23),(28,33,15),(30,36,47),(31,37,45),(32,1,13),(37,15,28),(40,4,20),(41,16,24),(43,25,50),(44,26,44),(46,28,49),(57,2,26),(59,38,13),(68,5,33),(80,19,26),(84,31,47),(85,10,15),(99,11,16);
/*!40000 ALTER TABLE `storage_location` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-29  4:43:31
