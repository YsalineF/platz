-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: platz
-- ------------------------------------------------------
-- Server version	5.7.24

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  `icone` varchar(45) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'photoshop','icon-psd.svg','2021-02-19 13:30:25',NULL),(2,'illustrator','icon-ai.svg','2021-02-19 13:38:54',NULL),(3,'photo','icon-photo.svg','2021-02-19 13:38:54',NULL),(4,'themes','icon-themes.svg','2021-02-19 13:38:54',NULL),(5,'font','icon-font.svg','2021-02-19 13:38:54',NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commentaires`
--

DROP TABLE IF EXISTS `commentaires`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commentaires` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `ressource_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_commentaires_users1_idx` (`user_id`),
  KEY `fk_commentaires_ressources1_idx` (`ressource_id`),
  CONSTRAINT `fk_commentaires_ressources1` FOREIGN KEY (`ressource_id`) REFERENCES `ressources` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_commentaires_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commentaires`
--

LOCK TABLES `commentaires` WRITE;
/*!40000 ALTER TABLE `commentaires` DISABLE KEYS */;
INSERT INTO `commentaires` VALUES (1,'un commentaire','2021-03-08 10:47:25',NULL,1,35),(2,'Awesome mockup, I like it very much !  It will help me for my website as I was looking for since few days.  Thank you alot','2021-03-18 09:45:10',NULL,1,35),(3,'Well done ! I like the way you did it.  Awesome !','2021-03-18 09:46:15',NULL,1,35),(4,'test','2021-03-22 02:07:06',NULL,30,36),(5,'test 2','2021-03-22 02:07:58',NULL,30,36),(6,'An amazing font','2021-03-22 02:10:00',NULL,22,36);
/*!40000 ALTER TABLE `commentaires` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2019_12_14_000001_create_personal_access_tokens_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;

/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ressources`
--

DROP TABLE IF EXISTS `ressources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ressources` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `image` varchar(45) NOT NULL,
  `fichier` varchar(45) DEFAULT NULL,
  `categorie_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `size` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_ressources_categories_idx` (`categorie_id`),
  KEY `fk_ressources_users1_idx` (`user_id`),
  CONSTRAINT `fk_ressources_categories` FOREIGN KEY (`categorie_id`) REFERENCES `categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ressources_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ressources`
--

LOCK TABLES `ressources` WRITE;
/*!40000 ALTER TABLE `ressources` DISABLE KEYS */;
INSERT INTO `ressources` VALUES (1,'Ipad Pro Mockup','2021-02-19 14:11:49',NULL,'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.  Aenean commodo ligula eget dolor.  Aenean massa.  Cum sociis natoque penatibus et magnis dis parturient montes, nascetur riduculus mus.  Donec quam felis, ultricies nec, pellentesque eu, ','psd-4.jpg','filesillustratorloupRouge.ai',1,36,32.00),(2,'Free font','2021-02-19 14:18:33',NULL,'Bavro is a minimal free font best suitable for posters and headlines.  Designed and released by Marcelo Mel','font-1.jpg','filesillustrator	odzi.ai',5,35,20.00),(3,'PSD Goodies','2021-02-19 14:18:33',NULL,'A set of high resolution iPhone 6 and Nexus 5 mockups created with smart objects.  Free PSD released by Ghani Pradita','psd-1.jpg','filesphotosautomn.jpg',1,35,10.00),(4,'PSD Goodies','2021-02-19 14:18:33',NULL,'A set of 4 free photorealistic Nexus 5 mockups providing smart objects.  Free PSD released by Craftwork','psd-2.jpg','filesphotosporshe.jpg',1,36,7.50),(5,'Illustrator freebies','2021-02-19 14:18:33',NULL,'A set of 6 outline beer icons created with adobe illustrator.  Free Ai designed and released by Justas Galaburda','ai-1.jpg','filesphotoshopdoubleExpo.psd',2,37,3.00),(6,'Html theme','2021-02-19 14:18:33',NULL,'Symphony is a responsive one page website template designed with sketches and coded with html5 and php.  Freebie released by Lacoste Xavier','theme-2.jpg','filesphotoshop\rolls.psd',4,38,0.50),(7,'PSD goodies','2021-02-19 14:19:26',NULL,'A set of 9 high-quality Apple Watch mockups created with Photoshop smart objects.  Free PSD released by Samuel Medvedowsky','psd-3.jpg','filesillustrator	odzi.ai',1,35,25.00),(8,'Free font','2021-02-19 14:19:26',NULL,'Beyno is a free uppercase font with a futuristic feel and look.  Designed and released by Fabian Korn','font-2.jpg','filesphotosautomn.jpg',5,35,40.00),(9,'Wordpress theme','2021-02-19 14:19:26',NULL,'Symphony is a responsive one page website template designed with sketchese and coded with html5 and php.  Freebie released by Lacoste Xavier','font-3.jpg','filesphotosporshe.jpg',5,36,31.00),(10,'Illustrator icons','2021-02-19 14:19:26',NULL,'A set of 16 outline space icons created with Adobe Illustrator.  Free Ai designed and released by Justas Galaburda','ai-2.jpg','filesphotoshopdoubleExpo.psd',2,37,18.00),(11,'PSD icons','2021-02-19 14:19:26',NULL,'Grap is a set of 9 simple but coloured icons created with Photoshop.  Free PSD released by kamran bhatti','icons-1.jpg','filesphotoshop\rolls.psd',2,38,15.00),(12,'UI design','2021-03-08 08:27:25',NULL,'Access to our largest database of web about the ui and look into a ton of professional tools','ui-1.jpg','ui.psd',1,36,4.30),(13,'Free font','2021-03-08 09:29:35',NULL,'A set of 6 outline beer icons created with Adobe Illustrator.  Free Ai designed and released by Justas Galaburda','font-5.jpg','font.jpg',5,37,7.90),(14,'Html theme','2021-03-08 09:31:20',NULL,'Symphony is a responsive one page website template designed with sketches and coded with html5 and php.  Freebie released by Lacoste Xavier','theme-2.jpg','theme2.jpg',4,38,25.00),(15,'PSD mockup','2021-03-08 09:32:40',NULL,'A very detailed Macbook Air mockup created with Photoshop and providing smart objects.  Free PSD released by Barin Christian','psd-5.jpg','file.psd',1,35,12.00),(16,'PSD icons','2021-03-08 09:34:10',NULL,'A set of 16 hand gestures icons you may find useful for your projects.  Free PSD released by Rovane Durso','icons-3.jpg','icons.psd',1,36,1.00),(17,'Free font','2021-03-08 09:35:10',NULL,'Julep is an elegant and modern free font released in vector formatis (Ai, EPS and PDF).  Designed and released by Jeremy Ross','font-4.jpg','font.jpg',5,38,2.00),(18,'HTML theme','2021-03-08 09:38:30',NULL,'Gorgo is a free HTML portfolio template for freelancers, photographers, agencies, designers and other creative fields.  Designed and released by Aristothemes','theme-3.jpg','theme.jpg',4,35,8.00),(19,'Free font','2021-03-08 09:40:00',NULL,'REEF is a rounded font free for commercial and personal use.  It\'s strength lies in simplicity and construction','font-6.jpg','font.jpg',5,36,6.60),(20,'HTML theme','2021-03-08 09:41:10',NULL,'ActiveBox is a free responsive HTML template featured cy clean and minimalistic design.  Designed and coded by Kamal Chaneman','theme-4.jpg','theme.jpg',4,37,5.10),(21,'Premium ui','2021-03-18 09:47:10',NULL,'Access to our largest database of the web about the ui and look into a ton of professional tools','ui-1.jpg','ui.db',3,36,50.10),(22,'Free font','2021-03-18 09:49:20',NULL,'Bravo is a minimal free font best suitable for posters and headlines.  Designed and release by Marcelo Melo','font-1.jpg','font1.jpg',5,37,5.00),(23,'Photo gallery','2021-03-18 09:51:30',NULL,'A free gallery of pictures you can use for your own designs','psd-5.jpg','gallery.zip',3,38,55.30),(30,'test edit','2021-03-21 22:11:52','2021-03-22 09:20:19','Ceci est un test d\'un edit !','AFPY.png',NULL,5,36,14.00),(32,'test reload','2021-03-22 09:28:10','2021-03-22 09:28:10','test reload','AFPY.png',NULL,3,36,4.00),(36,'test edit','2021-03-22 13:03:57','2021-03-22 13:42:43','test','AFPY.png',NULL,2,36,9.00),(38,'test','2021-03-22 13:45:25','2021-03-22 13:45:25','test','AFPY.png',NULL,4,36,13.00),(39,'test','2021-03-22 13:48:20','2021-03-22 13:48:20','test','AFPY.png',NULL,3,36,25.00);
/*!40000 ALTER TABLE `ressources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (35,'user14','user14@test.be',NULL,'$2y$10$tEMFy0Zj03Lpj0fz2.Slr.yaUYX3fqYcHhDNCwYjnADM61rGjSTQS',NULL,'2021-03-21 20:05:07','2021-03-21 20:05:07'),(36,'Mezz','ysaline.franquet@gmail.com',NULL,'$2y$10$i96bpYePvIveqtd.ksmKwO2ILdyVB60nJdYOjIWQ2g/IcZKgnwtBS',NULL,'2021-03-21 20:13:42','2021-03-21 20:13:42'),(37,'Marco','marco@test.be',NULL,'$2y$10$8IdanxUSnnXX3bwVgQPgpecjJKhbwHQ09QsY8bSnMLeNe8ZH.YPue',NULL,'2021-03-21 20:15:37','2021-03-21 20:15:37'),(38,'Marie','marie@test.be',NULL,'$2y$10$X374VF7W9fNR7kJ4HI09Suj.zym62yTUA2Q200t0/RBHjbE4o6O5q',NULL,'2021-03-21 20:16:13','2021-03-21 20:16:13');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utilisateurs`
--

DROP TABLE IF EXISTS `utilisateurs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utilisateurs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) DEFAULT NULL,
  `pseudo` varchar(45) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `avatar` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateurs`
--

LOCK TABLES `utilisateurs` WRITE;
/*!40000 ALTER TABLE `utilisateurs` DISABLE KEYS */;
INSERT INTO `utilisateurs` VALUES (1,'Ysaline','Mézz','2021-02-19 13:46:43',NULL,'avatar.png'),(2,'Gisèle','doyle','2021-02-19 13:48:43',NULL,'avatar-2.png'),(3,'Jean','aiko','2021-02-19 13:48:43',NULL,NULL),(4,'Jacques','thebest','2021-02-19 13:48:43',NULL,NULL);
/*!40000 ALTER TABLE `utilisateurs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-22 15:10:29
