-- MariaDB dump 10.19  Distrib 10.5.11-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: bucks
-- ------------------------------------------------------
-- Server version	10.5.11-MariaDB

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
-- Table structure for table `campaign`
--

DROP TABLE IF EXISTS `campaign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaign` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `thumbnail` varchar(100) NOT NULL,
  `content` varchar(200) NOT NULL,
  `startdate` date NOT NULL,
  `enddate` date NOT NULL,
  `writeday` date DEFAULT NULL,
  `viewcnt` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaign`
--

LOCK TABLES `campaign` WRITE;
/*!40000 ALTER TABLE `campaign` DISABLE KEYS */;
INSERT INTO `campaign` VALUES (8,0,'만원당 별 적립 이벤트','WEB_THUM_20211231080741168.jpg','wn_10000wonstar_220524.jpg','2022-01-01','2022-12-31','2022-09-27',0),(9,0,'온라인 스토어 별 2배 적립 혜택','WEB_THUM_20220630082548567.jpg','wn_Giftstar2_web_220920.jpg','2022-07-01','2022-12-31','2022-09-27',0),(10,0,'9월 e-Gift Item 보너스 스타','WEB_THUM_20220831080700403.jpg','wn_9_egiftitem_220829_web.jpg','2022-09-01','2022-09-30','2022-09-27',1),(11,0,'스타벅스 현대카드 9월 한정 혜택','WEB_THUM_20220914111141607.jpg','PlccEvent_20220901_01.jpg','2022-09-01','2022-09-30','2022-09-27',0),(12,0,'S.I.VILLAGE 제휴 프로모션','WEB_THUM_20220830100520706.jpg','wn_SIVILLAGE_detail_01_220826.jpg','2022-09-01','2022-10-31','2022-09-27',1),(14,0,'오트 밀크 커스텀 런칭 1주년 이벤트','WEB_THUM_20220901084718438.jpg','wn_oatmilkevent_220901.jpg','2022-09-02','2022-10-10','2022-09-27',1),(15,0,'Autumn 프로모션','WEB_THUM_20220901080312150.jpg','wn_Autumnpro_220829_01.jpg','2022-09-02','2022-10-10','2022-09-27',2),(16,0,'AUTUMN BARISTA FAVORITES','WEB_THUM_20220901091855499.jpg','wn_AUTUMN_BARISTA_FAVORITES_20220901.jpg','2022-09-02','2022-10-10','2022-09-27',2);
/*!40000 ALTER TABLE `campaign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` int(11) DEFAULT 0,
  `userid` varchar(20) DEFAULT NULL,
  `code` char(8) DEFAULT NULL,
  `unit` int(11) DEFAULT NULL,
  `prod_cost` int(11) DEFAULT NULL,
  `total_cost` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `writeday` date DEFAULT NULL,
  `orderday` date DEFAULT NULL,
  `ordertime` time DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,9,'hong','01010123',1,5000,5000,NULL,'2022-08-03',NULL,NULL),(2,9,'hong','01040122',1,6300,6300,NULL,'2022-08-03',NULL,NULL),(3,1,'spider','01060112',2,4500,9000,NULL,'2022-08-03','2022-08-04',NULL),(4,1,'spider','01060212',2,5700,11400,NULL,'2022-08-03','2022-08-04',NULL),(5,9,'spider','01010324',2,6500,13000,NULL,'2022-08-03',NULL,NULL),(6,9,'hong','01050123',2,6400,12800,NULL,'2022-08-03',NULL,NULL),(7,9,'hong','01010324',4,6500,26000,NULL,'2022-08-26',NULL,NULL),(8,9,'spider','01010113',1,5000,5000,NULL,'2022-08-26',NULL,NULL),(9,1,'spider','01010122',14,4500,63000,NULL,'2022-08-26','2022-09-21',NULL),(10,0,'star','01010122',20,4500,90000,NULL,'2022-08-26',NULL,NULL),(11,0,'star','01040122',10,6300,63000,NULL,'2022-08-30',NULL,NULL),(12,1,'hong','01010122',2,4500,9000,NULL,'2022-09-19','2022-09-21',NULL),(13,1,'spider','01040123',1,6800,6800,NULL,'2022-09-19','2022-09-21',NULL),(14,9,'hong','01010123',1,5000,5000,NULL,'2022-09-20',NULL,NULL),(15,1,'hong','01010323',1,6000,6000,NULL,'2022-09-20','2022-09-21',NULL),(16,1,'spider','01010123',1,5000,5000,NULL,'2022-09-21','2022-09-21',NULL),(17,1,'hong','01010323',1,6000,6000,NULL,'2022-09-21','2022-09-21',NULL),(18,1,'hong','01060211',1,5200,5200,NULL,'2022-09-21','2022-09-22','09:24:48'),(19,1,'hong','01040124',1,7300,7300,NULL,'2022-09-21','2022-09-22','09:24:48'),(20,1,'hong','01030123',1,6000,6000,NULL,'2022-09-22','2022-09-22','09:24:48'),(21,0,'hong','01010322',1,5500,5500,NULL,'2022-09-22',NULL,NULL),(22,1,'spider','01010322',1,5500,5500,NULL,'2022-09-23','2022-09-23','15:12:27');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_220802`
--

DROP TABLE IF EXISTS `cart_220802`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_220802` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` int(11) DEFAULT 0,
  `userid` varchar(20) DEFAULT NULL,
  `prod_code` char(100) DEFAULT NULL,
  `prod_unit` char(100) DEFAULT NULL,
  `total_unit` int(11) DEFAULT NULL,
  `total_cost` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `writeday` date DEFAULT NULL,
  `prod_size` char(100) DEFAULT NULL,
  `prod_cost` char(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_220802`
--

LOCK TABLES `cart_220802` WRITE;
/*!40000 ALTER TABLE `cart_220802` DISABLE KEYS */;
INSERT INTO `cart_220802` VALUES (1,0,'hong','아이스 카페 아메리카노','1',1,4500,NULL,'2022-08-02','2','4500'),(2,0,'hong','01010122','1',NULL,4500,NULL,'2022-08-03',NULL,'4500');
/*!40000 ALTER TABLE `cart_220802` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(20) DEFAULT NULL,
  `pwd` varchar(20) DEFAULT NULL,
  `username` varchar(40) DEFAULT NULL,
  `nickname` char(10) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `phone` char(13) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `star` int(11) DEFAULT 0,
  `level` int(11) DEFAULT 0,
  `state` int(11) DEFAULT 0,
  `writeday` date DEFAULT NULL,
  `sbcard` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userid` (`userid`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,'admin','123','관리자',NULL,NULL,NULL,NULL,0,0,0,'2022-08-01',0),(2,'starbucks','123','스타벅스','스타벅스','2022-01-01','01012341234','starbucks@starbucks.com',0,0,0,'2022-08-01',0),(3,'star',NULL,NULL,NULL,NULL,NULL,NULL,0,0,9,'2022-08-01',0),(4,'hong','123','홍길동','홍길동','1892-01-01','010','hong@kong.com',0,0,0,'2022-08-01',24000),(5,'spider','123','피터파커','스파이더맨','2000-12-30','10319948111','peter@avangers.com',6,1,0,'2022-08-01',99500),(6,'test1',NULL,NULL,NULL,NULL,NULL,NULL,0,0,9,'2022-08-24',0),(7,'test2',NULL,NULL,NULL,NULL,NULL,NULL,0,0,9,'2022-09-23',0);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cate1` char(2) DEFAULT NULL,
  `cate2` char(2) DEFAULT NULL,
  `code` char(8) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `price` char(5) DEFAULT NULL,
  `writeday` date DEFAULT NULL,
  `state` int(11) DEFAULT 1,
  `img` char(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'01','01','01010111','카페 아메리카노',1,1,'4000','2022-08-02',1,'카페 아메리카노.jpg'),(2,'01','01','01010112','카페 아메리카노',1,2,'4500','2022-08-02',1,'카페 아메리카노.jpg'),(4,'01','01','01010113','카페 아메리카노',1,3,'5000','2022-08-02',1,'카페 아메리카노.jpg'),(5,'01','01','01010114','카페 아메리카노',1,4,'5500','2022-08-02',1,'카페 아메리카노.jpg'),(6,'01','01','01010122','아이스 카페 아메리카노',2,2,'4500','2022-08-02',1,'아이스 카페 아메리카노.jpg'),(7,'01','01','01010123','아이스 카페 아메리카노',2,3,'5000','2022-08-02',1,'아이스 카페 아메리카노.jpg'),(8,'01','01','01010124','아이스 카페 아메리카노',2,4,'5500','2022-08-02',1,'아이스 카페 아메리카노.jpg'),(9,'01','01','01010211','카페 라떼',1,1,'4500','2022-08-02',1,'카페 라떼.jpg'),(10,'01','01','01010212','카페 라떼',1,2,'5000','2022-08-02',1,'카페 라떼.jpg'),(11,'01','01','01010213','카페 라떼',1,3,'5500','2022-08-02',1,'카페 라떼.jpg'),(12,'01','01','01010214','카페 라떼',1,4,'6000','2022-08-02',1,'카페 라떼.jpg'),(13,'01','01','01010222','아이스 카페 라떼',2,2,'5000','2022-08-02',1,'아이스 카페 라떼.jpg'),(14,'01','01','01010223','아이스 카페 라떼',2,3,'5500','2022-08-02',1,'아이스 카페 라떼.jpg'),(15,'01','01','01010224','아이스 카페 라떼',2,4,'6000','2022-08-02',1,'아이스 카페 라떼.jpg'),(16,'01','01','01010311','카페 모카',1,1,'5000','2022-08-02',1,'카페 모카.jpg'),(17,'01','01','01010312','카페 모카',1,2,'5500','2022-08-02',1,'카페 모카.jpg'),(18,'01','01','01010313','카페 모카',1,3,'6000','2022-08-02',1,'카페 모카.jpg'),(19,'01','01','01010314','카페 모카',1,4,'6500','2022-08-02',1,'카페 모카.jpg'),(20,'01','01','01010322','아이스 카페 모카',2,2,'5500','2022-08-02',1,'아이스 카페 모카.jpg'),(21,'01','01','01010323','아이스 카페 모카',2,3,'6000','2022-08-02',1,'아이스 카페 모카.jpg'),(22,'01','01','01010324','아이스 카페 모카',2,4,'6500','2022-08-02',1,'아이스 카페 모카.jpg'),(23,'01','02','01020122','콜드 브루',2,2,'4900','2022-08-02',1,'콜드 브루.jpg'),(24,'01','02','01020123','콜드 브루',2,3,'5400','2022-08-02',1,'콜드 브루.jpg'),(25,'01','02','01020124','콜드 브루',2,4,'5900','2022-08-02',1,'콜드 브루.jpg'),(26,'01','03','01030122','에스프레소 프라푸치노',2,2,'5500','2022-08-02',1,'에스프레소 프라푸치노.jpg'),(27,'01','03','01030123','에스프레소 프라푸치노',2,3,'6000','2022-08-02',1,'에스프레소 프라푸치노.jpg'),(28,'01','03','01030124','에스프레소 프라푸치노',2,4,'6500','2022-08-02',1,'에스프레소 프라푸치노.jpg'),(29,'01','04','01040122','딸기 딜라이트 요거트 블렌디드',2,2,'6300','2022-08-02',1,'딸기 딜라이트 요거트 블렌디드.jpg'),(30,'01','04','01040123','딸기 딜라이트 요거트 블렌디드',2,3,'6800','2022-08-02',1,'딸기 딜라이트 요거트 블렌디드.jpg'),(31,'01','04','01040124','딸기 딜라이트 요거트 블렌디드',2,4,'7300','2022-08-02',1,'딸기 딜라이트 요거트 블렌디드.jpg'),(32,'01','05','01050122','쿨 라임 피지오',2,2,'5900','2022-08-02',1,'쿨 라임 피지오.jpg'),(33,'01','05','01050123','쿨 라임 피지오',2,3,'6400','2022-08-02',1,'쿨 라임 피지오.jpg'),(34,'01','05','01050124','쿨 라임 피지오',2,4,'6900','2022-08-02',1,'쿨 라임 피지오.jpg'),(35,'01','06','01060112','얼 그레이 티',1,2,'4500','2022-08-02',1,'얼 그레이 티.jpg'),(36,'01','06','01060114','얼 그레이 티',1,4,'5500','2022-08-02',1,'얼 그레이 티.jpg'),(37,'01','06','01060122','아이스 얼 그레이 티',2,2,'4500','2022-08-02',1,'아이스 얼 그레이 티.jpg'),(38,'01','06','01060124','아이스 얼 그레이 티',2,4,'5500','2022-08-02',1,'아이스 얼 그레이 티.jpg'),(39,'01','06','01060211','자몽 허니 블랙 티',1,1,'5200','2022-08-02',1,'자몽 허니 블랙 티.jpg'),(40,'01','06','01060212','자몽 허니 블랙 티',1,2,'5700','2022-08-02',1,'자몽 허니 블랙 티.jpg'),(41,'01','06','01060213','자몽 허니 블랙 티',1,3,'6200','2022-08-02',1,'자몽 허니 블랙 티.jpg'),(42,'01','06','01060214','자몽 허니 블랙 티',1,4,'6700','2022-08-02',1,'자몽 허니 블랙 티.jpg'),(43,'01','06','01060222','아이스 자몽 허니 블랙 티',2,2,'5700','2022-08-02',1,'아이스 자몽 허니 블랙 티.jpg'),(44,'01','06','01060223','아이스 자몽 허니 블랙 티',2,3,'6200','2022-08-02',1,'아이스 자몽 허니 블랙 티.jpg'),(45,'01','06','01060224','아이스 자몽 허니 블랙 티',2,4,'6700','2022-08-02',1,'아이스 자몽 허니 블랙 티.jpg'),(56,'01','01','01010411','에스프레소 콘 파나',1,1,'4200','2022-09-29',1,'에스프레소 콘 파나13.jpg'),(57,'01','01','01010412','에스프레소 콘 파나',1,2,'4700','2022-09-29',1,'에스프레소 콘 파나13.jpg'),(59,'01','04','01040222','민트 초콜릿 칩 블렌디드',2,2,'6300','2022-09-29',1,'민크 초콜릿 칩 블렌디드2.jpg'),(60,'01','04','01040224','민트 초콜릿 칩 블렌디드',2,4,'7300','2022-09-29',1,'민크 초콜릿 칩 블렌디드2.jpg'),(61,'01','04','01040223','민트 초콜릿 칩 블렌디드',2,3,'6800','2022-09-29',1,'민크 초콜릿 칩 블렌디드2.jpg');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_cate`
--

DROP TABLE IF EXISTS `menu_cate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cate1` char(2) DEFAULT NULL,
  `cate2` char(2) DEFAULT NULL,
  `catename` varchar(100) DEFAULT NULL,
  `writeday` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_cate`
--

LOCK TABLES `menu_cate` WRITE;
/*!40000 ALTER TABLE `menu_cate` DISABLE KEYS */;
INSERT INTO `menu_cate` VALUES (1,'01','01','에스프레소','2022-08-02'),(2,'01','02','콜드브루','2022-08-02'),(3,'01','03','프라푸치노','2022-08-02'),(4,'01','04','블렌디드','2022-08-02'),(5,'01','05','피지오','2022-08-02'),(6,'01','06','티(티바나)','2022-08-02');
/*!40000 ALTER TABLE `menu_cate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rank` int(11) DEFAULT NULL,
  `writeday` date DEFAULT NULL,
  `viewcnt` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (2,1,'사과문','sorry.jfif','sorry_con1.jpg,sorry_con2.jpg,sorry_con3.jpg,sorry_con4.jpg,',1,'2022-09-13',11),(17,2,'서머 캐리백 택배 수거 접수 종료','A0wUXa_WEB_THUM_20220922131644803.jpg','wn_carryDeli_220922.jpg,',1,'2022-09-27',0),(18,1,'서머 캐리백 자발적 리콜 안내','t9k5nY_WEB_THUM_20220927130618950.jpg','wn_bagrecall_220811_02.jpg,',1,'2022-09-27',0),(19,3,'[참여종료] 9월 스타벅스 일회용컵 없는 날 캠페인','bdbPSh_WEB_THUM_20220908092432955.jpg','wn_nocup9_220908.jpg,',0,'2022-09-27',2),(20,1,'9월 20일, 2022 하반기 제주 특화 음료/푸드 출시','DKmAqT_WEB_THUM_20220919082226798.jpg','wn_jeju_winter_web_1_220913.jpg,wn_jeju_winter_web_2_220913.jpg,wn_jeju_winter_web_3_220913.jpg,wn_jeju_winter_web_4_220913.jpg,',0,'2022-09-27',1),(21,1,'9월 27일, 티바나 동절기 특화 음료 3종 출시','JiZCTj_WEB_THUM_20220926080631976.jpg','wn_teavana_20220920.jpg,',0,'2022-09-27',1),(22,1,'시그니처 더 블랙 콜드브루를 매장에서 주문하고 받아보세요.','LHXppU_WEB_THUM_20220926083649534.jpg','wn_signature_the_black_220926.jpg,',0,'2022-09-27',1),(23,1,'9월 27일, 클렌즈 주스 음료 3종 출시 ','LHXppU_WEB_THUM_20220926090320690.jpg','wn_juice_cleanse_2209212.jpg,',0,'2022-09-27',1);
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `viewcnt` int(11) DEFAULT 0,
  `writeday` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice`
--

LOCK TABLES `notice` WRITE;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
INSERT INTO `notice` VALUES (1,'시스템 개선 및 점검 안내 ','안녕하세요. 스타벅스 코리아입니다.\r\n\r\n보다 나은 서비스를 제공하고자 아래와 같이 시스템 서버 작업을 진행합니다.\r\n\r\n \r\n\r\n- 일자 및 시간: 2022년 7월 21일(목) 00시~05시(5시간)\r\n\r\n- 대상 서비스 : 홈페이지 / APP / Bixby / 삼성카드 스타벅스 오더 / 신한PayFAN 스타벅스오더 / 네이버 주문 / 스타벅스 현대카드 발급 서비스\r\n\r\n- 점검 내용: 시스템 서버 작업\r\n\r\n \r\n\r\n해당 점검 시간 중 웹/앱 및 외부 채널 서비스 이용이 제한되오니 양해 부탁드리겠습니다.\r\n\r\n감사합니다.',20,'2022-09-09'),(4,'시스템 개선 및 서비스 점검 안내','안녕하세요. 스타벅스 코리아입니다.\r\n보다 나은 서비스를 제공하고자 아래와 같이 서비스 업데이트 및 점검 작업을 진행합니다.\r\n \r\n- 일자 및 시간 : 2022년 9월 22일(목) 00시 00분 ~ 9월 22일(목) 08시 00분\r\n- 대상 서비스 : Gift 배송하기 서비스 전체\r\n \r\n해당 점검 시간 중 Gift 배송하기 서비스의 이용이 일시 중단되는 점 양해 부탁드립니다.\r\n감사합니다.',0,'2022-09-27'),(5,'고객의 소리 답변 운영 기준 변경 안내','안녕하세요, 스타벅스 커피 코리아입니다.\r\n\r\n당사에서 운영하는 “고객의 소리”의 답변 운영 기준이 아래와 같이 변경될 예정임을 안내 드립니다.\r\n\r\n \r\n\r\n- 시행일 : 2022년 9월 22일(목)\r\n\r\n- 변경내용 : 고객의 소리 문의 시, 이메일 답변 중지\r\n\r\n- 답변 확인 방법 : 답변 완료 시, APP PUSH 알림\r\n\r\n                 (APP) 스타벅스 앱 > Other > 고객지원 > 고객의 소리 > 나의 고객의 소리\r\n\r\n                 (WEB) 스타벅스 홈페이지 > Sign in > My Starbucks > My 고객의 소리\r\n\r\n \r\n\r\n보다 나은 서비스를 제공해 드리고자 노력하겠습니다.\r\n\r\n감사합니다.',1,'2022-09-27'),(6,'추석 연휴 스타벅스 딜리버스 운영 안내 ','안녕하세요. 스타벅스 코리아입니다.\r\n\r\n\r\n추석 연휴 기간 동안 스타벅스 딜리버스 서비스 운영 시간이 변경되오니 이용 시 참고해 주시기 바랍니다.\r\n\r\n\r\n추석 연휴 기간(9/09 - 9/12) 중 딜리버스 운영 여부 및 운영 시간은 매장에 따라 상이할 수 있어 아래 메뉴에서 확인해 주시기 바랍니다.\r\n\r\n\r\n(스타벅스 APP > Other > 매장정보 메뉴에서 \'딜리버스\' 옵션 선택 후 확인 가능)\r\n\r\n\r\n스타벅스와 함께 즐거운 추석 연휴 보내시기 바랍니다.\r\n\r\n감사합니다.',1,'2022-09-27'),(7,'신세계 기프트 카드 등 결제 제휴 종료 안내','안녕하세요. 스타벅스 코리아입니다.\r\n\r\n \r\n\r\n아래의 결제 제휴 종료로 인하여 하기와 같은 일정으로 서비스를 종료합니다.\r\n\r\n신세계 기프트 카드\r\n직불 카드(IC 카드 제외)\r\n신세계 모바일 상품권(MMS)\r\n\r\n\r\n□ 종료 예정일\r\n\r\n - 2022년 10월 5일 (22년 10월 4일까지 정상 서비스 예정)\r\n\r\n \r\n\r\n스타벅스 코리아는 앞으로도 더욱 편리한 서비스를 제공하기 위해 노력하겠습니다.\r\n\r\n\r\n\r\n감사합니다.',1,'2022-09-27');
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase`
--

DROP TABLE IF EXISTS `purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_code` char(20) DEFAULT NULL,
  `userid` char(20) DEFAULT NULL,
  `prod_code` char(8) DEFAULT NULL,
  `unit` int(11) DEFAULT NULL,
  `writeday` date DEFAULT NULL,
  `state` int(11) DEFAULT 1,
  `store_id` int(11) DEFAULT NULL,
  `writetime` time DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase`
--

LOCK TABLES `purchase` WRITE;
/*!40000 ALTER TABLE `purchase` DISABLE KEYS */;
INSERT INTO `purchase` VALUES (1,'202208030001','hong','01010123',1,'2022-08-03',1,NULL,NULL),(2,'202208030002','hong','01040122',1,'2022-08-03',1,NULL,NULL),(3,'202208030003','hong','01010123',1,'2022-08-03',1,NULL,NULL),(4,'202208030003','hong','01040122',1,'2022-08-03',1,NULL,NULL),(5,'202208030003','hong','01050123',2,'2022-08-03',1,NULL,NULL),(6,'202208030004','spider','01060112',2,'2022-08-03',1,NULL,NULL),(7,'202208030004','spider','01060212',2,'2022-08-03',1,NULL,NULL),(8,'1','hong','01010122',2,'2022-09-21',3,10,'16:11:07'),(9,'1','hong','01010323',1,'2022-09-21',3,10,NULL),(10,'202209210001','spider','01010122',14,'2022-09-21',2,13,NULL),(11,'202209210001','spider','01040123',1,'2022-09-21',2,13,NULL),(12,'202209210002','spider','01010123',1,'2022-09-21',3,19,NULL),(13,'202209210003','hong','01010323',1,'2022-09-21',3,17,NULL),(14,'202209220001','hong','01060211',1,'2022-09-22',2,15,'09:24:48'),(15,'202209220001','hong','01040124',1,'2022-09-22',2,15,'09:24:48'),(16,'202209220001','hong','01030123',1,'2022-09-22',2,15,'09:24:48'),(17,'202209230001','spider','01010322',1,'2022-09-23',1,10,'15:12:27');
/*!40000 ALTER TABLE `purchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store`
--

DROP TABLE IF EXISTS `store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `storename` char(20) DEFAULT NULL,
  `storeimg` char(50) DEFAULT NULL,
  `zip` char(6) DEFAULT NULL,
  `addr1` varchar(200) DEFAULT NULL,
  `addr2` varchar(200) DEFAULT NULL,
  `lat` char(20) DEFAULT NULL,
  `lng` char(20) DEFAULT NULL,
  `writeday` date DEFAULT NULL,
  `state` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store`
--

LOCK TABLES `store` WRITE;
/*!40000 ALTER TABLE `store` DISABLE KEYS */;
INSERT INTO `store` VALUES (2,'마두역',NULL,NULL,'경기 고양시 일산동구 중앙로 1191','장항동','37.652929566286','126.776700276323','2022-09-01',-1),(3,'일산백마',NULL,NULL,'경기 고양시 일산동구 일산로 237','마두동','37.6571164293343','126.788083476822','2022-09-01',-1),(4,'대화역',NULL,NULL,'경기 고양시 일산서구 중앙로 1559','대화동','37.675418007671','126.74820446417','2022-09-01',-1),(5,'문촌사거리',NULL,NULL,'경기 고양시 일산서구 중앙로 1470','주엽동','37.6724166539713','126.75757055587','2022-09-01',-1),(6,'주엽강선',NULL,NULL,'경기 고양시 일산서구 중앙로 1371','주엽동, 강선마을13단지아파트','37.6671243360506','126.765471646111','2022-09-01',-1),(7,'현대킨텍스',NULL,NULL,'경기 고양시 일산서구 호수로 817','대화동','37.6679852145335','126.751647571454','2022-09-01',-1),(8,'일산가로수길R',NULL,NULL,'경기 고양시 일산서구 주엽로 80','대화동','37.6660625103382','126.756435827812','2022-09-01',-1),(9,'일산주엽',NULL,NULL,'경기 고양시 일산서구 중앙로 1420','주엽동','37.6699153737834','126.762672380349','2022-09-01',-1),(10,'일산주엽','일산주엽.jpg',NULL,'경기 고양시 일산서구 중앙로 1420','주엽동','37.6699153737834','126.762672380349','2022-09-05',2),(11,'매장테스트1','일산주엽2.jpg',NULL,'서울 은평구 통일로83길 18','갈현동','37.6209053566644','126.918008719126','2022-09-01',-1),(12,'주엽강선','주엽강선.jpg',NULL,'경기 고양시 일산서구 중앙로 1371','주엽동','37.6671243360506','126.765471646111','2022-09-05',2),(13,'일산후곡','일산후곡.jpg',NULL,'경기 고양시 일산서구 일산로 541','일산동','37.6774295763602','126.767583493766','2022-09-05',2),(14,'일산탄현동','일산탄현동.jpg',NULL,'경기 고양시 일산서구 일현로 91','탄현동','37.6951944697371','126.764583098824','2022-09-08',2),(15,'문촌사거리','문촌사거리.jpg',NULL,'경기 고양시 일산서구 중앙로 1470','주엽동','37.6724166539713','126.75757055587','2022-09-08',2),(16,'현대킨텍스','현대킨텍스.jpg',NULL,'경기 고양시 일산서구 호수로 817','대화동','37.6679852145335','126.751647571454','2022-09-08',2),(17,'대화역','대화역.jpg',NULL,'경기 고양시 일산서구 중앙로 1559','대화동','37.675418007671','126.74820446417','2022-09-08',2),(18,'일산탄현제니스','일산탄현제니스.jpg',NULL,'경기 고양시 일산서구 일현로 97-11','일산 위브더제니스스퀘어1동147-151','37.6952127333096','126.76201157783','2022-09-08',2),(19,'킨텍스이마트','킨텍스이마트.jpg',NULL,'경기 고양시 일산서구 킨텍스로 171','대화동','37.6615831401235','126.744065435785','2022-09-08',2),(20,'일산덕이DT','일산덕이DT.jpg',NULL,'경기 고양시 일산서구 탄중로 106','덕이동','37.6919107497693','126.75697444563','2022-09-08',2),(21,'일산가구단지','일산가구단지.jpg',NULL,'경기 고양시 일산서구 하이파크2로 67','덕이동','37.6995607176941','126.756701146606','2022-09-08',2),(22,'일산가로수길R','일산가로수길R.jpg',NULL,'경기 고양시 일산서구 주엽로 80','대화동','37.6660625103382','126.756435827812','2022-09-08',2);
/*!40000 ALTER TABLE `store` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-30  0:40:33
