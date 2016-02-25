-- MySQL dump 10.13  Distrib 5.7.9, for osx10.9 (x86_64)
--
-- Host: localhost    Database: exam
-- ------------------------------------------------------
-- Server version	5.7.9

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
-- Table structure for table `Administrators`
--

DROP TABLE IF EXISTS `Administrators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Administrators` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user` varchar(20) NOT NULL,
  `passwords` varchar(50) NOT NULL,
  `department` varchar(200) NOT NULL,
  `unread` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Administrators`
--

LOCK TABLES `Administrators` WRITE;
/*!40000 ALTER TABLE `Administrators` DISABLE KEYS */;
INSERT INTO `Administrators` VALUES (1,'F7684885','HJKL:','PSD_NPI_TDE_SMT_FA','0'),(2,'F7684095','HJKL:','PSD_NPI_TDE_SMT_TDL','0'),(3,'F7683330','xxx','PSD_NPI_TDE_SMT_ST','0');
/*!40000 ALTER TABLE `Administrators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Administrators_Configuration`
--

DROP TABLE IF EXISTS `Administrators_Configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Administrators_Configuration` (
  `department` varchar(100) NOT NULL,
  `judge` int(10) unsigned NOT NULL,
  `judge_score` int(10) unsigned NOT NULL,
  `single` int(10) unsigned NOT NULL,
  `single_score` int(10) unsigned NOT NULL,
  `multiple` int(10) unsigned NOT NULL,
  `multiple_score` int(10) unsigned NOT NULL,
  `analysis` varchar(30) NOT NULL,
  `analysis_score` varchar(30) NOT NULL,
  `time` varchar(30) NOT NULL,
  `unread` varchar(30) NOT NULL,
  PRIMARY KEY (`department`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Administrators_Configuration`
--

LOCK TABLES `Administrators_Configuration` WRITE;
/*!40000 ALTER TABLE `Administrators_Configuration` DISABLE KEYS */;
INSERT INTO `Administrators_Configuration` VALUES ('PSD_NPI_TDE_SMT_FA',3,5,2,5,3,5,'3','20','120','6'),('PSD_NPI_TDE_SMT_ST',34,3,2,2,20,2,'2','2','2','0');
/*!40000 ALTER TABLE `Administrators_Configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `F1012885_20160120135623`
--

DROP TABLE IF EXISTS `F1012885_20160120135623`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `F1012885_20160120135623` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `score` varchar(20) NOT NULL,
  `title` varchar(500) NOT NULL,
  `answer` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `F1012885_20160120135623`
--

LOCK TABLES `F1012885_20160120135623` WRITE;
/*!40000 ALTER TABLE `F1012885_20160120135623` DISABLE KEYS */;
INSERT INTO `F1012885_20160120135623` VALUES (1,'2','浅谈DFU工站的Wifi固件root包中prm文件的内容的理解。','第三方'),(2,'2','请简析SoC工站各种模式之间的差异和联系。','都是法国和地方'),(3,'2','Scenario 603的fail如何展开FA工作，请从原理解析。','撒的发生');
/*!40000 ALTER TABLE `F1012885_20160120135623` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `F1012885_20160120135741`
--

DROP TABLE IF EXISTS `F1012885_20160120135741`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `F1012885_20160120135741` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `score` varchar(20) NOT NULL,
  `title` varchar(500) NOT NULL,
  `answer` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `F1012885_20160120135741`
--

LOCK TABLES `F1012885_20160120135741` WRITE;
/*!40000 ALTER TABLE `F1012885_20160120135741` DISABLE KEYS */;
INSERT INTO `F1012885_20160120135741` VALUES (1,'2','Scenario 603的fail如何展开FA工作，请从原理解析。','的方式送达'),(2,'2','谈谈DFU工站在整个SMT测试线的地位及与前后各工站的关联。','都是发的撒打算个梵蒂冈'),(3,'2','请简析SoC工站各种模式之间的差异和联系。','工地发生跟对方是个');
/*!40000 ALTER TABLE `F1012885_20160120135741` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `F1012885_20160120140148`
--

DROP TABLE IF EXISTS `F1012885_20160120140148`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `F1012885_20160120140148` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `score` varchar(20) NOT NULL,
  `title` varchar(500) NOT NULL,
  `answer` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `F1012885_20160120140148`
--

LOCK TABLES `F1012885_20160120140148` WRITE;
/*!40000 ALTER TABLE `F1012885_20160120140148` DISABLE KEYS */;
INSERT INTO `F1012885_20160120140148` VALUES (1,'2','浅谈DFU工站的Wifi固件root包中prm文件的内容的理解。','的所发生的'),(2,'2','请简析SoC工站各种模式之间的差异和联系。','都是法国'),(3,'2','Scenario 603的fail如何展开FA工作，请从原理解析。','的撒发生');
/*!40000 ALTER TABLE `F1012885_20160120140148` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `F1012885_20160120140729`
--

DROP TABLE IF EXISTS `F1012885_20160120140729`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `F1012885_20160120140729` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `score` varchar(20) NOT NULL,
  `title` varchar(500) NOT NULL,
  `answer` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `F1012885_20160120140729`
--

LOCK TABLES `F1012885_20160120140729` WRITE;
/*!40000 ALTER TABLE `F1012885_20160120140729` DISABLE KEYS */;
INSERT INTO `F1012885_20160120140729` VALUES (1,'2','Scenario 603的fail如何展开FA工作，请从原理解析。','对方是广东省'),(2,'2','谈谈DFU工站在整个SMT测试线的地位及与前后各工站的关联。','的撒范德萨'),(3,'2','请简析SoC工站各种模式之间的差异和联系。','东方故事的');
/*!40000 ALTER TABLE `F1012885_20160120140729` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `F1012885_20160120210206`
--

DROP TABLE IF EXISTS `F1012885_20160120210206`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `F1012885_20160120210206` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `score` varchar(20) NOT NULL,
  `title` varchar(500) NOT NULL,
  `answer` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `F1012885_20160120210206`
--

LOCK TABLES `F1012885_20160120210206` WRITE;
/*!40000 ALTER TABLE `F1012885_20160120210206` DISABLE KEYS */;
INSERT INTO `F1012885_20160120210206` VALUES (1,'2','Scenario 603的fail如何展开FA工作，请从原理解析。','但是飞洒地方'),(2,'2','请简析SoC工站各种模式之间的差异和联系。','多少公分的很多技能'),(3,'2','浅谈DFU工站的Wifi固件root包中prm文件的内容的理解。','是的噶电饭锅电饭锅');
/*!40000 ALTER TABLE `F1012885_20160120210206` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `F1012885_201601220100129`
--

DROP TABLE IF EXISTS `F1012885_201601220100129`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `F1012885_201601220100129` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `score` varchar(20) NOT NULL,
  `title` varchar(500) NOT NULL,
  `answer` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `F1012885_201601220100129`
--

LOCK TABLES `F1012885_201601220100129` WRITE;
/*!40000 ALTER TABLE `F1012885_201601220100129` DISABLE KEYS */;
INSERT INTO `F1012885_201601220100129` VALUES (1,'2','谈谈DFU工站在整个SMT测试线的地位及与前后各工站的关联。','1.DownLoad activated Nand, all post DFU station is able to load resources from DFU station.\n2.Check all CB before DFU station, make sure all process before was normal.'),(2,'2','Scenario 603的fail如何展开FA工作，请从原理解析。','1.Check fail address,bit to confirm failure type.\n2.X-ray connection.\n3.Reproduce failure.'),(3,'2','请简析SoC工站各种模式之间的差异和联系。','1.sdfjadlsfjdslkfjadlsfjadlsfkj\n2.dsakljlfkjdsalfj.\n3.dslafjdslkfjdskl');
/*!40000 ALTER TABLE `F1012885_201601220100129` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PSD_NPI_TDE_SMT_FA_analysis`
--

DROP TABLE IF EXISTS `PSD_NPI_TDE_SMT_FA_analysis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PSD_NPI_TDE_SMT_FA_analysis` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PSD_NPI_TDE_SMT_FA_analysis`
--

LOCK TABLES `PSD_NPI_TDE_SMT_FA_analysis` WRITE;
/*!40000 ALTER TABLE `PSD_NPI_TDE_SMT_FA_analysis` DISABLE KEYS */;
INSERT INTO `PSD_NPI_TDE_SMT_FA_analysis` VALUES (1,'请简析SoC工站各种模式之间的差异和联系。'),(2,'浅谈DFU工站的Wifi固件root包中prm文件的内容的理解。'),(3,'Scenario 603的fail如何展开FA工作，请从原理解析。'),(4,'谈谈DFU工站在整个SMT测试线的地位及与前后各工站的关联。');
/*!40000 ALTER TABLE `PSD_NPI_TDE_SMT_FA_analysis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PSD_NPI_TDE_SMT_FA_judge`
--

DROP TABLE IF EXISTS `PSD_NPI_TDE_SMT_FA_judge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PSD_NPI_TDE_SMT_FA_judge` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(300) NOT NULL,
  `answer` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PSD_NPI_TDE_SMT_FA_judge`
--

LOCK TABLES `PSD_NPI_TDE_SMT_FA_judge` WRITE;
/*!40000 ALTER TABLE `PSD_NPI_TDE_SMT_FA_judge` DISABLE KEYS */;
INSERT INTO `PSD_NPI_TDE_SMT_FA_judge` VALUES (1,' 目前的 SoC 測試主要包含PERTOS測試和RBM測試兩大部分。                      ','T'),(2,' 在PERTOS中，我們可以使用“help”獲取更多的命令信息。                     ','T'),(3,' 在FA使用mobile_restore做SoC測試時，“-D”的參數可使用SoC.pr，也可以用 DFU.pr。','T'),(4,'不同SoC revision的unit，通常需要使用不同的PERTOS和RBM image來測試。          ','T'),(5,' Kernel Panic的fail都是software的問題。                                          ','F'),(6,'Swap test是一種證明物料問題的好方法。                                        ','T'),(7,' 在FA重測“smokey Pad_DFU --run”的命令必須要先重新restore。                    ','T'),(8,'DFU測試時需要連接PDCA網路，SoC測試則不需要。                              ','T'),(9,'在Diag中turn on bluetooth只需要進diags然後輸入“bluetooth --on”回車就可以了 。    ','F'),(10,'CB 只有三种状态，分别是：Pass, Fail, Incomplete.                                 ','F'),(11,' 目前的 SoC 測試主要包含PERTOS測試和RBM測試兩大部分。                      ','T'),(12,' 在PERTOS中，我們可以使用“help”獲取更多的命令信息。                     ','T'),(13,' 在FA使用mobile_restore做SoC測試時，“-D”的參數可使用SoC.pr，也可以用 DFU.pr。','T'),(14,'不同SoC revision的unit，通常需要使用不同的PERTOS和RBM image來測試。          ','T'),(15,' Kernel Panic的fail都是software的問題。                                          ','F'),(16,'Swap test是一種證明物料問題的好方法。                                        ','T'),(17,' 在FA重測“smokey Pad_DFU --run”的命令必須要先重新restore。                    ','T'),(18,'DFU測試時需要連接PDCA網路，SoC測試則不需要。                              ','T'),(19,'在Diag中turn on bluetooth只需要進diags然後輸入“bluetooth --on”回車就可以了 。    ','F'),(20,'CB 只有三种状态，分别是：Pass, Fail, Incomplete.                                 ','F'),(21,' 目前的 SoC 測試主要包含PERTOS測試和RBM測試兩大部分。                      ','T'),(22,' 在PERTOS中，我們可以使用“help”獲取更多的命令信息。                     ','T'),(23,' 在FA使用mobile_restore做SoC測試時，“-D”的參數可使用SoC.pr，也可以用 DFU.pr。','T'),(24,'不同SoC revision的unit，通常需要使用不同的PERTOS和RBM image來測試。          ','T'),(25,' Kernel Panic的fail都是software的問題。                                          ','F'),(26,'Swap test是一種證明物料問題的好方法。                                        ','T'),(27,' 在FA重測“smokey Pad_DFU --run”的命令必須要先重新restore。                    ','T'),(28,'DFU測試時需要連接PDCA網路，SoC測試則不需要。                              ','T'),(29,'在Diag中turn on bluetooth只需要進diags然後輸入“bluetooth --on”回車就可以了 。    ','F'),(30,'CB 只有三种状态，分别是：Pass, Fail, Incomplete.                                 ','F'),(31,' 目前的 SoC 測試主要包含PERTOS測試和RBM測試兩大部分。                      ','T'),(32,' 在PERTOS中，我們可以使用“help”獲取更多的命令信息。                     ','T'),(33,' 在FA使用mobile_restore做SoC測試時，“-D”的參數可使用SoC.pr，也可以用 DFU.pr。','T'),(34,'不同SoC revision的unit，通常需要使用不同的PERTOS和RBM image來測試。          ','T'),(35,' Kernel Panic的fail都是software的問題。                                          ','F'),(36,'Swap test是一種證明物料問題的好方法。                                        ','T'),(37,' 在FA重測“smokey Pad_DFU --run”的命令必須要先重新restore。                    ','T'),(38,'DFU測試時需要連接PDCA網路，SoC測試則不需要。                              ','T'),(39,'在Diag中turn on bluetooth只需要進diags然後輸入“bluetooth --on”回車就可以了 。    ','F'),(40,'CB 只有三种状态，分别是：Pass, Fail, Incomplete.                                 ','F');
/*!40000 ALTER TABLE `PSD_NPI_TDE_SMT_FA_judge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PSD_NPI_TDE_SMT_FA_multiple`
--

DROP TABLE IF EXISTS `PSD_NPI_TDE_SMT_FA_multiple`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PSD_NPI_TDE_SMT_FA_multiple` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(300) NOT NULL,
  `optionA` varchar(100) NOT NULL,
  `optionB` varchar(100) NOT NULL,
  `optionC` varchar(100) NOT NULL,
  `optionD` varchar(100) NOT NULL,
  `answer` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PSD_NPI_TDE_SMT_FA_multiple`
--

LOCK TABLES `PSD_NPI_TDE_SMT_FA_multiple` WRITE;
/*!40000 ALTER TABLE `PSD_NPI_TDE_SMT_FA_multiple` DISABLE KEYS */;
INSERT INTO `PSD_NPI_TDE_SMT_FA_multiple` VALUES (1,'那些是太阳的卫星','水星','木星','火星','月球','ABC'),(2,' 以下哪些參數是在FA使用mobile_restore時必需的',' variant',' usb address',' timeout',' bundle','ABD'),(3,' 在使用mobile_restore 讓unit進入PERTOS時，下列組合中的哪些是可以使用的',' -T ［PathToFile］',' -T PERTOS',' -F PERTOS',' -F ［PathToFile］','BD'),(4,' 以下SoC测试中，偏重于测试DDR的是哪些',' sc run 603',' sc run 46（gpu)',' ddr margin test 0x303 50',' sc run 54','ACD'),(5,' RBM测试中，我們通過修改命令中哪個參數的值來控制最長測試時間',' -time',' -wait',' -waittime',' -tout','D'),(6,' Unit處於哪些mode時可以正常使用mobile_restore',' DFU',' iBoot',' OS',' Diag','ABC'),(7,' 以下哪些PERTOS命令可以show出DDR vendor',' ddr cal',' ddr print info',' ddr calw nocheck',' fuse config','BC'),(8,' 分析ddr margin test的fail时，需要读出以下那些的margin值輔助判断',' CK',' CA',' RD',' WR','BCD'),(9,' SoC測試fail主要可能涉及以下哪些物料的問題',' Memory',' Nand',' Charger IC',' SoC','AD'),(10,' Device處於哪些mode時可以在PurpleRestore3界面看到信息',' DFU',' iBoot',' OS',' Diag','ABC'),(11,' 以下哪些參數是在FA使用mobile_restore時必需的',' variant',' usb address',' timeout',' bundle','ABD'),(12,' 在使用mobile_restore 讓unit進入PERTOS時，下列組合中的哪些是可以使用的',' -T ［PathToFile］',' -T PERTOS',' -F PERTOS',' -F ［PathToFile］','BD'),(13,' 以下SoC测试中，偏重于测试DDR的是哪些',' sc run 603',' sc run 46（gpu)',' ddr margin test 0x303 50',' sc run 54','ACD'),(14,' RBM测试中，我們通過修改命令中哪個參數的值來控制最長測試時間',' -time',' -wait',' -waittime',' -tout','D'),(15,' Unit處於哪些mode時可以正常使用mobile_restore',' DFU',' iBoot',' OS',' Diag','ABC'),(16,' 以下哪些PERTOS命令可以show出DDR vendor',' ddr cal',' ddr print info',' ddr calw nocheck',' fuse config','BC'),(17,' 分析ddr margin test的fail时，需要读出以下那些的margin值輔助判断',' CK',' CA',' RD',' WR','BCD'),(18,' SoC測試fail主要可能涉及以下哪些物料的問題',' Memory',' Nand',' Charger IC',' SoC','AD'),(19,' Device處於哪些mode時可以在PurpleRestore3界面看到信息',' DFU',' iBoot',' OS',' Diag','ABC'),(20,' 以下哪些參數是在FA使用mobile_restore時必需的',' variant',' usb address',' timeout',' bundle','ABD'),(21,' 在使用mobile_restore 讓unit進入PERTOS時，下列組合中的哪些是可以使用的',' -T ［PathToFile］',' -T PERTOS',' -F PERTOS',' -F ［PathToFile］','BD'),(22,' 以下SoC测试中，偏重于测试DDR的是哪些',' sc run 603',' sc run 46（gpu)',' ddr margin test 0x303 50',' sc run 54','ACD'),(23,' RBM测试中，我們通過修改命令中哪個參數的值來控制最長測試時間',' -time',' -wait',' -waittime',' -tout','D'),(24,' Unit處於哪些mode時可以正常使用mobile_restore',' DFU',' iBoot',' OS',' Diag','ABC'),(25,' 以下哪些PERTOS命令可以show出DDR vendor',' ddr cal',' ddr print info',' ddr calw nocheck',' fuse config','BC'),(26,' 分析ddr margin test的fail时，需要读出以下那些的margin值輔助判断',' CK',' CA',' RD',' WR','BCD'),(27,' SoC測試fail主要可能涉及以下哪些物料的問題',' Memory',' Nand',' Charger IC',' SoC','AD'),(28,' Device處於哪些mode時可以在PurpleRestore3界面看到信息',' DFU',' iBoot',' OS',' Diag','ABC'),(29,' 以下哪些參數是在FA使用mobile_restore時必需的',' variant',' usb address',' timeout',' bundle','ABD'),(30,' 在使用mobile_restore 讓unit進入PERTOS時，下列組合中的哪些是可以使用的',' -T ［PathToFile］',' -T PERTOS',' -F PERTOS',' -F ［PathToFile］','BD'),(31,' 以下SoC测试中，偏重于测试DDR的是哪些',' sc run 603',' sc run 46（gpu)',' ddr margin test 0x303 50',' sc run 54','ACD'),(32,' RBM测试中，我們通過修改命令中哪個參數的值來控制最長測試時間',' -time',' -wait',' -waittime',' -tout','D'),(33,' Unit處於哪些mode時可以正常使用mobile_restore',' DFU',' iBoot',' OS',' Diag','ABC'),(34,' 以下哪些PERTOS命令可以show出DDR vendor',' ddr cal',' ddr print info',' ddr calw nocheck',' fuse config','BC'),(35,' 分析ddr margin test的fail时，需要读出以下那些的margin值輔助判断',' CK',' CA',' RD',' WR','BCD'),(36,' SoC測試fail主要可能涉及以下哪些物料的問題',' Memory',' Nand',' Charger IC',' SoC','AD'),(37,' Device處於哪些mode時可以在PurpleRestore3界面看到信息',' DFU',' iBoot',' OS',' Diag','ABC'),(38,' 以下哪些參數是在FA使用mobile_restore時必需的',' variant',' usb address',' timeout',' bundle','ABD'),(39,' 在使用mobile_restore 讓unit進入PERTOS時，下列組合中的哪些是可以使用的',' -T ［PathToFile］',' -T PERTOS',' -F PERTOS',' -F ［PathToFile］','BD'),(40,' 以下SoC测试中，偏重于测试DDR的是哪些',' sc run 603',' sc run 46（gpu)',' ddr margin test 0x303 50',' sc run 54','ACD'),(41,' RBM测试中，我們通過修改命令中哪個參數的值來控制最長測試時間',' -time',' -wait',' -waittime',' -tout','D'),(42,' Unit處於哪些mode時可以正常使用mobile_restore',' DFU',' iBoot',' OS',' Diag','ABC'),(43,' 以下哪些PERTOS命令可以show出DDR vendor',' ddr cal',' ddr print info',' ddr calw nocheck',' fuse config','BC'),(44,' 分析ddr margin test的fail时，需要读出以下那些的margin值輔助判断',' CK',' CA',' RD',' WR','BCD'),(45,' SoC測試fail主要可能涉及以下哪些物料的問題',' Memory',' Nand',' Charger IC',' SoC','AD'),(46,' Device處於哪些mode時可以在PurpleRestore3界面看到信息',' DFU',' iBoot',' OS',' Diag','ABC'),(47,' 以下哪些參數是在FA使用mobile_restore時必需的',' variant',' usb address',' timeout',' bundle','ABD'),(48,' 在使用mobile_restore 讓unit進入PERTOS時，下列組合中的哪些是可以使用的',' -T ［PathToFile］',' -T PERTOS',' -F PERTOS',' -F ［PathToFile］','BD'),(49,' 以下SoC测试中，偏重于测试DDR的是哪些',' sc run 603',' sc run 46（gpu)',' ddr margin test 0x303 50',' sc run 54','ACD'),(50,' RBM测试中，我們通過修改命令中哪個參數的值來控制最長測試時間',' -time',' -wait',' -waittime',' -tout','D'),(51,' Unit處於哪些mode時可以正常使用mobile_restore',' DFU',' iBoot',' OS',' Diag','ABC'),(52,' 以下哪些PERTOS命令可以show出DDR vendor',' ddr cal',' ddr print info',' ddr calw nocheck',' fuse config','BC'),(53,' 分析ddr margin test的fail时，需要读出以下那些的margin值輔助判断',' CK',' CA',' RD',' WR','BCD'),(54,' SoC測試fail主要可能涉及以下哪些物料的問題',' Memory',' Nand',' Charger IC',' SoC','AD'),(55,' Device處於哪些mode時可以在PurpleRestore3界面看到信息',' DFU',' iBoot',' OS',' Diag','ABC'),(56,' 以下哪些參數是在FA使用mobile_restore時必需的',' variant',' usb address',' timeout',' bundle','ABD'),(57,' 在使用mobile_restore 讓unit進入PERTOS時，下列組合中的哪些是可以使用的',' -T ［PathToFile］',' -T PERTOS',' -F PERTOS',' -F ［PathToFile］','BD'),(58,' 以下SoC测试中，偏重于测试DDR的是哪些',' sc run 603',' sc run 46（gpu)',' ddr margin test 0x303 50',' sc run 54','ACD'),(59,' RBM测试中，我們通過修改命令中哪個參數的值來控制最長測試時間',' -time',' -wait',' -waittime',' -tout','D'),(60,' Unit處於哪些mode時可以正常使用mobile_restore',' DFU',' iBoot',' OS',' Diag','ABC'),(61,' 以下哪些PERTOS命令可以show出DDR vendor',' ddr cal',' ddr print info',' ddr calw nocheck',' fuse config','BC'),(62,' 分析ddr margin test的fail时，需要读出以下那些的margin值輔助判断',' CK',' CA',' RD',' WR','BCD'),(63,' SoC測試fail主要可能涉及以下哪些物料的問題',' Memory',' Nand',' Charger IC',' SoC','AD'),(64,' Device處於哪些mode時可以在PurpleRestore3界面看到信息',' DFU',' iBoot',' OS',' Diag','ABC'),(65,' 以下哪些參數是在FA使用mobile_restore時必需的',' variant',' usb address',' timeout',' bundle','ABD'),(66,' 在使用mobile_restore 讓unit進入PERTOS時，下列組合中的哪些是可以使用的',' -T ［PathToFile］',' -T PERTOS',' -F PERTOS',' -F ［PathToFile］','BD'),(67,' 以下SoC测试中，偏重于测试DDR的是哪些',' sc run 603',' sc run 46（gpu)',' ddr margin test 0x303 50',' sc run 54','ACD'),(68,' RBM测试中，我們通過修改命令中哪個參數的值來控制最長測試時間',' -time',' -wait',' -waittime',' -tout','D'),(69,' Unit處於哪些mode時可以正常使用mobile_restore',' DFU',' iBoot',' OS',' Diag','ABC'),(70,' 以下哪些PERTOS命令可以show出DDR vendor',' ddr cal',' ddr print info',' ddr calw nocheck',' fuse config','BC'),(71,' 分析ddr margin test的fail时，需要读出以下那些的margin值輔助判断',' CK',' CA',' RD',' WR','BCD'),(72,' SoC測試fail主要可能涉及以下哪些物料的問題',' Memory',' Nand',' Charger IC',' SoC','AD'),(73,' Device處於哪些mode時可以在PurpleRestore3界面看到信息',' DFU',' iBoot',' OS',' Diag','ABC');
/*!40000 ALTER TABLE `PSD_NPI_TDE_SMT_FA_multiple` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PSD_NPI_TDE_SMT_FA_single`
--

DROP TABLE IF EXISTS `PSD_NPI_TDE_SMT_FA_single`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PSD_NPI_TDE_SMT_FA_single` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(300) NOT NULL,
  `optionA` varchar(100) NOT NULL,
  `optionB` varchar(100) NOT NULL,
  `optionC` varchar(100) NOT NULL,
  `optionD` varchar(100) NOT NULL,
  `answer` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PSD_NPI_TDE_SMT_FA_single`
--

LOCK TABLES `PSD_NPI_TDE_SMT_FA_single` WRITE;
/*!40000 ALTER TABLE `PSD_NPI_TDE_SMT_FA_single` DISABLE KEYS */;
INSERT INTO `PSD_NPI_TDE_SMT_FA_single` VALUES (1,'12306的槽点。','服务器脆弱','网页界面丑陋','反人类的验证码','是国企','ABC'),(2,' 以下哪些不是第一次write cb之前可能需要先輸入的命令',' cbini  （init control bit',' nandinit',' rtc –set (rtc set time)',' syscfg init','D'),(3,' 我們在FA處理Kernel Panic的fail時，若遇到panic信息混亂無法識別時，可以使用下面哪些方法獲取清晰的信息',' 测试很多次，直到能够看出清晰的信息',' 在pr setting的 “Restore Boot-Args”中加入“cpus=1”的參數',' 在terminal里输“astrisctl isPanic”，同時需要使用特定的cable',' 換不同的cable進行測試','B'),(4,' 通常情況下，以下哪些chip相關的fail是ICT, FCT cover不到，會在DFU抓到的',' SEP EEPROM',' Tristar   (開關)',' Compass （指南針',' Nand','D'),(5,' Pad_DFU的smokey测试包含以下哪些部分',' BBDFU',' BTDFU',' SHDFU',' WLDFU','C'),(6,' 一般來說，下列哪些部門是我們在FA過程中需要經常聯繫的',' SQE 材料問題(切板，寄料)',' DFM/ME   （CT掃描切料',' OPM   寄板子',' IE','D'),(7,' SoC和baseband的fuse類型有哪',' production fuse  量產階段',' secure fuse',' development fuse  npi 階段',' root fuse','C'),(8,' 以下问题属于SMA问题的是',' Solder open',' Solder bridge',' Foreign material under chip',' Incorrect material polarity','A'),(9,' 以下哪些是用來檢查測試fail有沒有SMA 问题的方法',' 目檢',' X-Ray',' CT-Scan',' Cross section','A'),(10,' 以下哪些不是第一次write cb之前可能需要先輸入的命令',' cbini  （init control bit',' nandinit',' rtc –set (rtc set time)',' syscfg init','D'),(11,' 我們在FA處理Kernel Panic的fail時，若遇到panic信息混亂無法識別時，可以使用下面哪些方法獲取清晰的信息',' 测试很多次，直到能够看出清晰的信息',' 在pr setting的 “Restore Boot-Args”中加入“cpus=1”的參數',' 在terminal里输“astrisctl isPanic”，同時需要使用特定的cable',' 換不同的cable進行測試','B'),(12,' 通常情況下，以下哪些chip相關的fail是ICT, FCT cover不到，會在DFU抓到的',' SEP EEPROM',' Tristar   (開關)',' Compass （指南針',' Nand','D'),(13,' Pad_DFU的smokey测试包含以下哪些部分',' BBDFU',' BTDFU',' SHDFU',' WLDFU','C'),(14,' 一般來說，下列哪些部門是我們在FA過程中需要經常聯繫的',' SQE 材料問題(切板，寄料)',' DFM/ME   （CT掃描切料',' OPM   寄板子',' IE','D'),(15,' SoC和baseband的fuse類型有哪',' production fuse  量產階段',' secure fuse',' development fuse  npi 階段',' root fuse','C'),(16,' 以下问题属于SMA问题的是',' Solder open',' Solder bridge',' Foreign material under chip',' Incorrect material polarity','A'),(17,' 以下哪些是用來檢查測試fail有沒有SMA 问题的方法',' 目檢',' X-Ray',' CT-Scan',' Cross section','A'),(18,' 以下哪些不是第一次write cb之前可能需要先輸入的命令',' cbini  （init control bit',' nandinit',' rtc –set (rtc set time)',' syscfg init','D'),(19,' 我們在FA處理Kernel Panic的fail時，若遇到panic信息混亂無法識別時，可以使用下面哪些方法獲取清晰的信息',' 测试很多次，直到能够看出清晰的信息',' 在pr setting的 “Restore Boot-Args”中加入“cpus=1”的參數',' 在terminal里输“astrisctl isPanic”，同時需要使用特定的cable',' 換不同的cable進行測試','B'),(20,' 通常情況下，以下哪些chip相關的fail是ICT, FCT cover不到，會在DFU抓到的',' SEP EEPROM',' Tristar   (開關)',' Compass （指南針',' Nand','D'),(21,' Pad_DFU的smokey测试包含以下哪些部分',' BBDFU',' BTDFU',' SHDFU',' WLDFU','C'),(22,' 一般來說，下列哪些部門是我們在FA過程中需要經常聯繫的',' SQE 材料問題(切板，寄料)',' DFM/ME   （CT掃描切料',' OPM   寄板子',' IE','D'),(23,' SoC和baseband的fuse類型有哪',' production fuse  量產階段',' secure fuse',' development fuse  npi 階段',' root fuse','C'),(24,' 以下问题属于SMA问题的是',' Solder open',' Solder bridge',' Foreign material under chip',' Incorrect material polarity','A'),(25,' 以下哪些是用來檢查測試fail有沒有SMA 问题的方法',' 目檢',' X-Ray',' CT-Scan',' Cross section','A'),(26,' 以下哪些不是第一次write cb之前可能需要先輸入的命令',' cbini  （init control bit',' nandinit',' rtc –set (rtc set time)',' syscfg init','D'),(27,' 我們在FA處理Kernel Panic的fail時，若遇到panic信息混亂無法識別時，可以使用下面哪些方法獲取清晰的信息',' 测试很多次，直到能够看出清晰的信息',' 在pr setting的 “Restore Boot-Args”中加入“cpus=1”的參數',' 在terminal里输“astrisctl isPanic”，同時需要使用特定的cable',' 換不同的cable進行測試','B'),(28,' 通常情況下，以下哪些chip相關的fail是ICT, FCT cover不到，會在DFU抓到的',' SEP EEPROM',' Tristar   (開關)',' Compass （指南針',' Nand','D'),(29,' Pad_DFU的smokey测试包含以下哪些部分',' BBDFU',' BTDFU',' SHDFU',' WLDFU','C'),(30,' 一般來說，下列哪些部門是我們在FA過程中需要經常聯繫的',' SQE 材料問題(切板，寄料)',' DFM/ME   （CT掃描切料',' OPM   寄板子',' IE','D'),(31,' SoC和baseband的fuse類型有哪',' production fuse  量產階段',' secure fuse',' development fuse  npi 階段',' root fuse','C'),(32,' 以下问题属于SMA问题的是',' Solder open',' Solder bridge',' Foreign material under chip',' Incorrect material polarity','A'),(33,' 以下哪些是用來檢查測試fail有沒有SMA 问题的方法',' 目檢',' X-Ray',' CT-Scan',' Cross section','A'),(34,' 以下哪些不是第一次write cb之前可能需要先輸入的命令',' cbini  （init control bit',' nandinit',' rtc –set (rtc set time)',' syscfg init','D'),(35,' 我們在FA處理Kernel Panic的fail時，若遇到panic信息混亂無法識別時，可以使用下面哪些方法獲取清晰的信息',' 测试很多次，直到能够看出清晰的信息',' 在pr setting的 “Restore Boot-Args”中加入“cpus=1”的參數',' 在terminal里输“astrisctl isPanic”，同時需要使用特定的cable',' 換不同的cable進行測試','B'),(36,' 通常情況下，以下哪些chip相關的fail是ICT, FCT cover不到，會在DFU抓到的',' SEP EEPROM',' Tristar   (開關)',' Compass （指南針',' Nand','D'),(37,' Pad_DFU的smokey测试包含以下哪些部分',' BBDFU',' BTDFU',' SHDFU',' WLDFU','C'),(38,' 一般來說，下列哪些部門是我們在FA過程中需要經常聯繫的',' SQE 材料問題(切板，寄料)',' DFM/ME   （CT掃描切料',' OPM   寄板子',' IE','D'),(39,' SoC和baseband的fuse類型有哪',' production fuse  量產階段',' secure fuse',' development fuse  npi 階段',' root fuse','C'),(40,' 以下问题属于SMA问题的是',' Solder open',' Solder bridge',' Foreign material under chip',' Incorrect material polarity','A'),(41,' 以下哪些是用來檢查測試fail有沒有SMA 问题的方法',' 目檢',' X-Ray',' CT-Scan',' Cross section','A'),(42,' 以下哪些不是第一次write cb之前可能需要先輸入的命令',' cbini  （init control bit',' nandinit',' rtc –set (rtc set time)',' syscfg init','D'),(43,' 我們在FA處理Kernel Panic的fail時，若遇到panic信息混亂無法識別時，可以使用下面哪些方法獲取清晰的信息',' 测试很多次，直到能够看出清晰的信息',' 在pr setting的 “Restore Boot-Args”中加入“cpus=1”的參數',' 在terminal里输“astrisctl isPanic”，同時需要使用特定的cable',' 換不同的cable進行測試','B'),(44,' 通常情況下，以下哪些chip相關的fail是ICT, FCT cover不到，會在DFU抓到的',' SEP EEPROM',' Tristar   (開關)',' Compass （指南針',' Nand','D'),(45,' Pad_DFU的smokey测试包含以下哪些部分',' BBDFU',' BTDFU',' SHDFU',' WLDFU','C'),(46,' 一般來說，下列哪些部門是我們在FA過程中需要經常聯繫的',' SQE 材料問題(切板，寄料)',' DFM/ME   （CT掃描切料',' OPM   寄板子',' IE','D'),(47,' SoC和baseband的fuse類型有哪',' production fuse  量產階段',' secure fuse',' development fuse  npi 階段',' root fuse','C'),(48,' 以下问题属于SMA问题的是',' Solder open',' Solder bridge',' Foreign material under chip',' Incorrect material polarity','A'),(49,' 以下哪些是用來檢查測試fail有沒有SMA 问题的方法',' 目檢',' X-Ray',' CT-Scan',' Cross section','A'),(50,' 以下哪些不是第一次write cb之前可能需要先輸入的命令',' cbini  （init control bit',' nandinit',' rtc –set (rtc set time)',' syscfg init','D'),(51,' 我們在FA處理Kernel Panic的fail時，若遇到panic信息混亂無法識別時，可以使用下面哪些方法獲取清晰的信息',' 测试很多次，直到能够看出清晰的信息',' 在pr setting的 “Restore Boot-Args”中加入“cpus=1”的參數',' 在terminal里输“astrisctl isPanic”，同時需要使用特定的cable',' 換不同的cable進行測試','B'),(52,' 通常情況下，以下哪些chip相關的fail是ICT, FCT cover不到，會在DFU抓到的',' SEP EEPROM',' Tristar   (開關)',' Compass （指南針',' Nand','D'),(53,' Pad_DFU的smokey测试包含以下哪些部分',' BBDFU',' BTDFU',' SHDFU',' WLDFU','C'),(54,' 一般來說，下列哪些部門是我們在FA過程中需要經常聯繫的',' SQE 材料問題(切板，寄料)',' DFM/ME   （CT掃描切料',' OPM   寄板子',' IE','D'),(55,' SoC和baseband的fuse類型有哪',' production fuse  量產階段',' secure fuse',' development fuse  npi 階段',' root fuse','C'),(56,' 以下问题属于SMA问题的是',' Solder open',' Solder bridge',' Foreign material under chip',' Incorrect material polarity','A'),(57,' 以下哪些是用來檢查測試fail有沒有SMA 问题的方法',' 目檢',' X-Ray',' CT-Scan',' Cross section','A'),(58,' 以下哪些不是第一次write cb之前可能需要先輸入的命令',' cbini  （init control bit',' nandinit',' rtc –set (rtc set time)',' syscfg init','D'),(59,' 我們在FA處理Kernel Panic的fail時，若遇到panic信息混亂無法識別時，可以使用下面哪些方法獲取清晰的信息',' 测试很多次，直到能够看出清晰的信息',' 在pr setting的 “Restore Boot-Args”中加入“cpus=1”的參數',' 在terminal里输“astrisctl isPanic”，同時需要使用特定的cable',' 換不同的cable進行測試','B'),(60,' 通常情況下，以下哪些chip相關的fail是ICT, FCT cover不到，會在DFU抓到的',' SEP EEPROM',' Tristar   (開關)',' Compass （指南針',' Nand','D'),(61,' Pad_DFU的smokey测试包含以下哪些部分',' BBDFU',' BTDFU',' SHDFU',' WLDFU','C'),(62,' 一般來說，下列哪些部門是我們在FA過程中需要經常聯繫的',' SQE 材料問題(切板，寄料)',' DFM/ME   （CT掃描切料',' OPM   寄板子',' IE','D'),(63,' SoC和baseband的fuse類型有哪',' production fuse  量產階段',' secure fuse',' development fuse  npi 階段',' root fuse','C'),(64,' 以下问题属于SMA问题的是',' Solder open',' Solder bridge',' Foreign material under chip',' Incorrect material polarity','A'),(65,' 以下哪些是用來檢查測試fail有沒有SMA 问题的方法',' 目檢',' X-Ray',' CT-Scan',' Cross section','A');
/*!40000 ALTER TABLE `PSD_NPI_TDE_SMT_FA_single` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PSD_NPI_TDE_SMT_analysis`
--

DROP TABLE IF EXISTS `PSD_NPI_TDE_SMT_analysis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PSD_NPI_TDE_SMT_analysis` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PSD_NPI_TDE_SMT_analysis`
--

LOCK TABLES `PSD_NPI_TDE_SMT_analysis` WRITE;
/*!40000 ALTER TABLE `PSD_NPI_TDE_SMT_analysis` DISABLE KEYS */;
INSERT INTO `PSD_NPI_TDE_SMT_analysis` VALUES (1,' 请解析DFU工站的测试流程。');
/*!40000 ALTER TABLE `PSD_NPI_TDE_SMT_analysis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Testers`
--

DROP TABLE IF EXISTS `Testers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Testers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user` varchar(50) NOT NULL,
  `passwords` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `department` varchar(100) NOT NULL,
  `unread` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Testers`
--

LOCK TABLES `Testers` WRITE;
/*!40000 ALTER TABLE `Testers` DISABLE KEYS */;
INSERT INTO `Testers` VALUES (1,'F1012885','HJKL;','超级管理员','PSD_NPI_TDE_SMT_FA','6'),(2,'F7686117','2015','隔壁老王','PSD_NPI_TDE_SMT_FA','0');
/*!40000 ALTER TABLE `Testers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Testers_Record`
--

DROP TABLE IF EXISTS `Testers_Record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Testers_Record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `time` varchar(30) NOT NULL,
  `cost` varchar(30) NOT NULL,
  `sum` varchar(30) NOT NULL,
  `score_obj` varchar(30) NOT NULL,
  `timeStamp` varchar(50) DEFAULT NULL,
  `unread` varchar(30) NOT NULL,
  `score` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Testers_Record`
--

LOCK TABLES `Testers_Record` WRITE;
/*!40000 ALTER TABLE `Testers_Record` DISABLE KEYS */;
INSERT INTO `Testers_Record` VALUES (1,'F1012885','Super man','120','30','150','90','201512120000','N','96'),(2,'F7686117','超级管理员','120','150','37','24','2015/12/12 00:00','N','0'),(3,'F7686117','超级管理员','120','150','37','24','2015/12/12 00:00','N','0'),(4,'F7686117','超级管理员','120','150','37','48','2015/12/12 00:00','N','0'),(5,'F7686117','超级管理员','120','150','37','48','2015/12/12 00:00','N','0'),(6,'F1012885','超级管理员','120','0','9','2','201512120001','N','0'),(7,'F1012885','超级管理员','120','0','9','2','201512120001','N','0'),(8,'F1012885','超级管理员','2','0','26','0','20160118202923','N','0'),(9,'F1012885','超级管理员','120','0','34','19','20160120120922','N','0'),(10,'F1012885','超级管理员','120','0','34','11','20160120134938','N','17'),(11,'F1012885','超级管理员','120','0','34','4','20160120135623','Y','0'),(12,'F1012885','超级管理员','120','0','34','12','20160120135741','Y','0'),(13,'F1012885','超级管理员','120','0','34','8','20160120140148','Y','0'),(14,'F1012885','超级管理员','120','0','34','19','20160120140729','Y','0'),(15,'F1012885','超级管理员','120','0','34','4','20160120210206','Y','0'),(16,'F1012885','超级管理员','120','0','34','15','201601220100129','Y','0');
/*!40000 ALTER TABLE `Testers_Record` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-01-22 10:03:28
