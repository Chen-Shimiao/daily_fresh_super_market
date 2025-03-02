-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: shop_site
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add 购物车',7,'add_cartinfo'),(20,'Can change 购物车',7,'change_cartinfo'),(21,'Can delete 购物车',7,'delete_cartinfo'),(22,'Can add 商品',8,'add_goodsinfo'),(23,'Can change 商品',8,'change_goodsinfo'),(24,'Can delete 商品',8,'delete_goodsinfo'),(25,'Can add 商品类型',9,'add_typeinfo'),(26,'Can change 商品类型',9,'change_typeinfo'),(27,'Can delete 商品类型',9,'delete_typeinfo'),(28,'Can add 用户浏览记录',10,'add_goodsbrowser'),(29,'Can change 用户浏览记录',10,'change_goodsbrowser'),(30,'Can delete 用户浏览记录',10,'delete_goodsbrowser'),(31,'Can add 用户信息',11,'add_userinfo'),(32,'Can change 用户信息',11,'change_userinfo'),(33,'Can delete 用户信息',11,'delete_userinfo'),(34,'Can add logistics',12,'add_logistics'),(35,'Can change logistics',12,'change_logistics'),(36,'Can delete logistics',12,'delete_logistics'),(37,'Can add 订单详情',13,'add_orderdetailinfo'),(38,'Can change 订单详情',13,'change_orderdetailinfo'),(39,'Can delete 订单详情',13,'delete_orderdetailinfo'),(40,'Can add 订单',14,'add_orderinfo'),(41,'Can change 订单',14,'change_orderinfo'),(42,'Can delete 订单',14,'delete_orderinfo'),(43,'Can view log entry',1,'view_logentry'),(44,'Can view permission',2,'view_permission'),(45,'Can view group',3,'view_group'),(46,'Can view user',4,'view_user'),(47,'Can view content type',5,'view_contenttype'),(48,'Can view session',6,'view_session'),(49,'Can view 购物车',7,'view_cartinfo'),(50,'Can view 商品',8,'view_goodsinfo'),(51,'Can view 商品类型',9,'view_typeinfo'),(52,'Can view 用户浏览记录',10,'view_goodsbrowser'),(53,'Can view 用户信息',11,'view_userinfo'),(54,'Can view logistics',12,'view_logistics'),(55,'Can view 订单详情',13,'view_orderdetailinfo'),(56,'Can view 订单',14,'view_orderinfo'),(57,'Can add 售后申请',15,'add_aftersalerequest'),(58,'Can change 售后申请',15,'change_aftersalerequest'),(59,'Can delete 售后申请',15,'delete_aftersalerequest'),(60,'Can view 售后申请',15,'view_aftersalerequest');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$260000$L7Js4eBUUIPmVZyFWcsxsl$JgOoR93KVJu7JV0LHhwel8KwT42lAXrg55JCX2gKih8=','2025-01-16 21:03:51.543289',1,'admin','','','',1,1,'2025-01-15 19:49:04.211847');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `df_cart_cartinfo`
--

DROP TABLE IF EXISTS `df_cart_cartinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `df_cart_cartinfo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `count` int NOT NULL,
  `goods_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `df_cart_cartinfo_goods_id_4357294f_fk_df_goods_goodsinfo_id` (`goods_id`),
  KEY `df_cart_cartinfo_user_id_db76e708_fk_df_user_userinfo_id` (`user_id`),
  CONSTRAINT `df_cart_cartinfo_goods_id_4357294f_fk_df_goods_goodsinfo_id` FOREIGN KEY (`goods_id`) REFERENCES `df_goods_goodsinfo` (`id`),
  CONSTRAINT `df_cart_cartinfo_user_id_db76e708_fk_df_user_userinfo_id` FOREIGN KEY (`user_id`) REFERENCES `df_user_userinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `df_cart_cartinfo`
--

LOCK TABLES `df_cart_cartinfo` WRITE;
/*!40000 ALTER TABLE `df_cart_cartinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `df_cart_cartinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `df_goods_goodsinfo`
--

DROP TABLE IF EXISTS `df_goods_goodsinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `df_goods_goodsinfo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `isDelete` tinyint(1) NOT NULL,
  `gtitle` varchar(20) NOT NULL,
  `gpic` varchar(100) DEFAULT NULL,
  `gprice` decimal(5,2) NOT NULL,
  `gunit` varchar(20) NOT NULL,
  `gclick` int NOT NULL,
  `gjianjie` varchar(200) NOT NULL,
  `gkucun` int NOT NULL,
  `gcontent` longtext NOT NULL,
  `gtype_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `gtitle` (`gtitle`),
  KEY `df_goods_goodsinfo_gtype_id_63a02cef_fk_df_goods_typeinfo_id` (`gtype_id`),
  CONSTRAINT `df_goods_goodsinfo_gtype_id_63a02cef_fk_df_goods_typeinfo_id` FOREIGN KEY (`gtype_id`) REFERENCES `df_goods_typeinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `df_goods_goodsinfo`
--

LOCK TABLES `df_goods_goodsinfo` WRITE;
/*!40000 ALTER TABLE `df_goods_goodsinfo` DISABLE KEYS */;
INSERT INTO `df_goods_goodsinfo` VALUES (1,0,'柠檬','df_goods/image/2025/01/goods001.jpg',12.00,'500g',3,'柠檬',46,'<p>柠檬</p>',1),(2,0,'葡萄','df_goods/image/2025/01/goods002.jpg',20.00,'500g',7,'葡萄',398,'<p>葡萄</p>',1),(3,0,'扇贝','df_goods/image/2025/01/goods019.jpg',40.00,'500g',18,'扇贝',499,'<p>扇贝</p>',2),(4,0,'黑虎虾','df_goods/image/2025/01/goods021.jpg',60.00,'500g',1,'虾',98,'<p>虾</p>',2),(5,0,'刀鱼','df_goods/image/2025/01/goods020.jpg',20.00,'500g',0,'刀鱼',25,'<p>刀鱼</p>',2);
/*!40000 ALTER TABLE `df_goods_goodsinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `df_goods_typeinfo`
--

DROP TABLE IF EXISTS `df_goods_typeinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `df_goods_typeinfo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `isDelete` tinyint(1) NOT NULL,
  `ttitle` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `df_goods_typeinfo`
--

LOCK TABLES `df_goods_typeinfo` WRITE;
/*!40000 ALTER TABLE `df_goods_typeinfo` DISABLE KEYS */;
INSERT INTO `df_goods_typeinfo` VALUES (1,0,'新鲜水果'),(2,0,'海鲜水产'),(3,0,'猪羊牛肉'),(4,0,'禽类蛋品'),(5,0,'新鲜蔬菜'),(6,0,'速冻食品');
/*!40000 ALTER TABLE `df_goods_typeinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `df_order_aftersalerequest`
--

DROP TABLE IF EXISTS `df_order_aftersalerequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `df_order_aftersalerequest` (
  `id` int NOT NULL AUTO_INCREMENT,
  `request_type` varchar(20) NOT NULL,
  `description` longtext NOT NULL,
  `images` varchar(100) DEFAULT NULL,
  `status` varchar(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `order_id` varchar(20) NOT NULL,
  `order_item_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `df_order_aftersalere_order_id_04d8f97d_fk_df_order_` (`order_id`),
  KEY `df_order_aftersalere_order_item_id_9302ae09_fk_df_order_` (`order_item_id`),
  KEY `df_order_aftersalerequest_user_id_6410fcb4_fk_auth_user_id` (`user_id`),
  CONSTRAINT `df_order_aftersalere_order_id_04d8f97d_fk_df_order_` FOREIGN KEY (`order_id`) REFERENCES `df_order_orderinfo` (`oid`),
  CONSTRAINT `df_order_aftersalere_order_item_id_9302ae09_fk_df_order_` FOREIGN KEY (`order_item_id`) REFERENCES `df_order_orderdetailinfo` (`id`),
  CONSTRAINT `df_order_aftersalerequest_user_id_6410fcb4_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `df_order_aftersalerequest`
--

LOCK TABLES `df_order_aftersalerequest` WRITE;
/*!40000 ALTER TABLE `df_order_aftersalerequest` DISABLE KEYS */;
INSERT INTO `df_order_aftersalerequest` VALUES (1,'return','退货','','pending','2025-01-16 21:37:23.557140','2025-01-16 21:37:23.557140','202501162115121',4,1),(2,'return','退货','','pending','2025-01-16 21:39:01.680004','2025-01-16 21:39:01.680004','202501162115121',4,1);
/*!40000 ALTER TABLE `df_order_aftersalerequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `df_order_logistics`
--

DROP TABLE IF EXISTS `df_order_logistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `df_order_logistics` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tracking_number` varchar(100) NOT NULL,
  `current_status` varchar(100) NOT NULL,
  `last_updated` datetime(6) NOT NULL,
  `estimated_delivery_date` date NOT NULL,
  `order_id` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tracking_number` (`tracking_number`),
  UNIQUE KEY `order_id` (`order_id`),
  CONSTRAINT `df_order_logistics_order_id_2db98d73_fk_df_order_orderinfo_oid` FOREIGN KEY (`order_id`) REFERENCES `df_order_orderinfo` (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `df_order_logistics`
--

LOCK TABLES `df_order_logistics` WRITE;
/*!40000 ALTER TABLE `df_order_logistics` DISABLE KEYS */;
INSERT INTO `df_order_logistics` VALUES (1,'123','已发货','2025-01-16 21:08:00.958759','2025-01-17','202501152005331');
/*!40000 ALTER TABLE `df_order_logistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `df_order_orderdetailinfo`
--

DROP TABLE IF EXISTS `df_order_orderdetailinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `df_order_orderdetailinfo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `price` decimal(6,2) NOT NULL,
  `count` int NOT NULL,
  `goods_id` int NOT NULL,
  `order_id` varchar(20) NOT NULL,
  `comment` longtext,
  `rating` smallint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `df_order_orderdetail_goods_id_d0acef4d_fk_df_goods_` (`goods_id`),
  KEY `df_order_orderdetail_order_id_b91dcf67_fk_df_order_` (`order_id`),
  CONSTRAINT `df_order_orderdetail_goods_id_d0acef4d_fk_df_goods_` FOREIGN KEY (`goods_id`) REFERENCES `df_goods_goodsinfo` (`id`),
  CONSTRAINT `df_order_orderdetail_order_id_b91dcf67_fk_df_order_` FOREIGN KEY (`order_id`) REFERENCES `df_order_orderinfo` (`oid`),
  CONSTRAINT `df_order_orderdetailinfo_chk_1` CHECK ((`rating` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `df_order_orderdetailinfo`
--

LOCK TABLES `df_order_orderdetailinfo` WRITE;
/*!40000 ALTER TABLE `df_order_orderdetailinfo` DISABLE KEYS */;
INSERT INTO `df_order_orderdetailinfo` VALUES (1,12.00,2,1,'202501152005331',NULL,NULL),(2,12.00,2,1,'202501152045451',NULL,NULL),(3,60.00,2,4,'202501162032001',NULL,NULL),(4,40.00,1,3,'202501162115121','Good',3),(5,20.00,2,2,'202501162115121',NULL,NULL);
/*!40000 ALTER TABLE `df_order_orderdetailinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `df_order_orderinfo`
--

DROP TABLE IF EXISTS `df_order_orderinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `df_order_orderinfo` (
  `oid` varchar(20) NOT NULL,
  `odate` datetime(6) NOT NULL,
  `oIsPay` tinyint(1) NOT NULL,
  `ototal` decimal(8,2) NOT NULL,
  `oaddress` varchar(150) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`oid`),
  KEY `df_order_orderinfo_user_id_2d705949_fk_df_user_userinfo_id` (`user_id`),
  CONSTRAINT `df_order_orderinfo_user_id_2d705949_fk_df_user_userinfo_id` FOREIGN KEY (`user_id`) REFERENCES `df_user_userinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `df_order_orderinfo`
--

LOCK TABLES `df_order_orderinfo` WRITE;
/*!40000 ALTER TABLE `df_order_orderinfo` DISABLE KEYS */;
INSERT INTO `df_order_orderinfo` VALUES ('202501152005331','2025-01-15 20:05:33.962980',1,34.00,'',1),('202501152045451','2025-01-15 20:45:45.646984',1,34.00,'',1),('202501162032001','2025-01-16 20:32:00.385588',1,130.00,'',1),('202501162115121','2025-01-16 21:15:12.258194',1,90.00,'',1);
/*!40000 ALTER TABLE `df_order_orderinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `df_user_goodsbrowser`
--

DROP TABLE IF EXISTS `df_user_goodsbrowser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `df_user_goodsbrowser` (
  `id` int NOT NULL AUTO_INCREMENT,
  `browser_time` datetime(6) NOT NULL,
  `good_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `df_user_goodsbrowser_good_id_81bbd6f5_fk_df_goods_goodsinfo_id` (`good_id`),
  KEY `df_user_goodsbrowser_user_id_b7a661a4_fk_df_user_userinfo_id` (`user_id`),
  CONSTRAINT `df_user_goodsbrowser_good_id_81bbd6f5_fk_df_goods_goodsinfo_id` FOREIGN KEY (`good_id`) REFERENCES `df_goods_goodsinfo` (`id`),
  CONSTRAINT `df_user_goodsbrowser_user_id_b7a661a4_fk_df_user_userinfo_id` FOREIGN KEY (`user_id`) REFERENCES `df_user_userinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `df_user_goodsbrowser`
--

LOCK TABLES `df_user_goodsbrowser` WRITE;
/*!40000 ALTER TABLE `df_user_goodsbrowser` DISABLE KEYS */;
INSERT INTO `df_user_goodsbrowser` VALUES (1,'2025-01-15 20:39:28.132332',1,1),(2,'2025-01-19 16:48:38.638213',2,1),(3,'2025-01-16 20:31:48.868590',4,1),(4,'2025-01-19 16:50:44.088845',3,1);
/*!40000 ALTER TABLE `df_user_goodsbrowser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `df_user_userinfo`
--

DROP TABLE IF EXISTS `df_user_userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `df_user_userinfo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uname` varchar(20) NOT NULL,
  `upwd` varchar(40) NOT NULL,
  `uemail` varchar(254) NOT NULL,
  `ushou` varchar(20) NOT NULL,
  `uaddress` varchar(100) NOT NULL,
  `uyoubian` varchar(6) NOT NULL,
  `uphone` varchar(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uname` (`uname`),
  UNIQUE KEY `uemail` (`uemail`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `df_user_userinfo`
--

LOCK TABLES `df_user_userinfo` WRITE;
/*!40000 ALTER TABLE `df_user_userinfo` DISABLE KEYS */;
INSERT INTO `df_user_userinfo` VALUES (1,'supermarket1','eda07d054d396444937436b7d974c763baa97004','supermarket1@qq.com','supermarket1','滨湖新区洞庭湖路3366号','230601','13111111111');
/*!40000 ALTER TABLE `df_user_userinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2025-01-15 20:00:48.134014','1','柠檬',1,'[{\"added\": {}}]',8,1),(2,'2025-01-15 20:01:18.319277','2','葡萄',1,'[{\"added\": {}}]',8,1),(3,'2025-01-15 20:02:19.661614','3','扇贝',1,'[{\"added\": {}}]',8,1),(4,'2025-01-15 20:02:56.952725','4','黑虎虾',1,'[{\"added\": {}}]',8,1),(5,'2025-01-15 20:03:21.195695','5','刀鱼',1,'[{\"added\": {}}]',8,1),(6,'2025-01-16 21:08:00.959720','1','Logistics object (1)',1,'[{\"added\": {}}]',12,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'df_cart','cartinfo'),(8,'df_goods','goodsinfo'),(9,'df_goods','typeinfo'),(15,'df_order','aftersalerequest'),(12,'df_order','logistics'),(13,'df_order','orderdetailinfo'),(14,'df_order','orderinfo'),(10,'df_user','goodsbrowser'),(11,'df_user','userinfo'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-01-15 19:47:52.263428'),(2,'auth','0001_initial','2025-01-15 19:47:53.917463'),(3,'admin','0001_initial','2025-01-15 19:47:54.259950'),(4,'admin','0002_logentry_remove_auto_add','2025-01-15 19:47:54.279521'),(5,'contenttypes','0002_remove_content_type_name','2025-01-15 19:47:54.449548'),(6,'auth','0002_alter_permission_name_max_length','2025-01-15 19:47:54.589614'),(7,'auth','0003_alter_user_email_max_length','2025-01-15 19:47:54.632381'),(8,'auth','0004_alter_user_username_opts','2025-01-15 19:47:54.649383'),(9,'auth','0005_alter_user_last_login_null','2025-01-15 19:47:54.776519'),(10,'auth','0006_require_contenttypes_0002','2025-01-15 19:47:54.785517'),(11,'auth','0007_alter_validators_add_error_messages','2025-01-15 19:47:54.803357'),(12,'auth','0008_alter_user_username_max_length','2025-01-15 19:47:54.950618'),(13,'auth','0009_alter_user_last_name_max_length','2025-01-15 19:47:55.089410'),(14,'df_goods','0001_initial','2025-01-15 19:47:55.378444'),(15,'df_user','0001_initial','2025-01-15 19:47:55.802733'),(16,'df_cart','0001_initial','2025-01-15 19:47:56.108144'),(17,'df_order','0001_initial','2025-01-15 19:47:56.990210'),(18,'sessions','0001_initial','2025-01-15 19:47:57.078213'),(19,'admin','0003_logentry_add_action_flag_choices','2025-01-16 20:14:59.498411'),(20,'auth','0010_alter_group_name_max_length','2025-01-16 20:14:59.569172'),(21,'auth','0011_update_proxy_permissions','2025-01-16 20:14:59.591787'),(22,'auth','0012_alter_user_first_name_max_length','2025-01-16 20:14:59.772002'),(23,'df_order','0002_auto_20250116_2134','2025-01-16 21:34:41.415518'),(24,'df_order','0003_alter_aftersalerequest_request_type','2025-01-16 21:36:56.854492'),(25,'df_order','0004_auto_20250119_1551','2025-01-19 15:51:36.422707');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('ocrzd8ffhihuanjan16po94vm66c9l7h','eyJ1c2VyX2lkIjoxLCJ1c2VyX25hbWUiOiJzdXBlcm1hcmtldDEifQ:1tZQHP:6u0ixeyS8-pxoJl9VNTeOrOKrlVlHCxNtBFZgg1IZJQ','2025-02-02 16:03:35.344180');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-11 16:56:55
