-- MySQL dump 10.13  Distrib 8.1.0, for macos12.6 (arm64)
--
-- Host: 127.0.0.1    Database: xoj
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `migrations`
--

GRANT ALL PRIVILEGES ON *.* TO 'root'@'%';
GRANT ALL PRIVILEGES ON xoj.* TO 'xojuser'@'%';
FLUSH PRIVILEGES;

use xoj;

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `title` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标题',
  `content` text COLLATE utf8mb4_unicode_ci COMMENT '内容',
  `tags` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标签列表（json 数组）',
  `answer` text COLLATE utf8mb4_unicode_ci COMMENT '题目答案',
  `submitNum` int NOT NULL DEFAULT '0' COMMENT '题目提交数',
  `acceptedNum` int NOT NULL DEFAULT '0' COMMENT '题目通过数',
  `judgeCase` text COLLATE utf8mb4_unicode_ci COMMENT '判题用例（json 数组）',
  `judgeConfig` text COLLATE utf8mb4_unicode_ci COMMENT '判题配置（json 对象）',
  `thumbNum` int NOT NULL DEFAULT '0' COMMENT '点赞数',
  `favourNum` int NOT NULL DEFAULT '0' COMMENT '收藏数',
  `userId` bigint NOT NULL COMMENT '创建用户 id',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `isDelete` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`),
  KEY `idx_userId` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='题目';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (1,'两数之和','算出A+B的和','[\"简单\",\"数学\"]','1+1=2\n2+3=5',13,7,'[{\"input\":\"1 2\",\"output\":\"3\"},{\"input\":\"3 4\",\"output\":\"7\"},{\"input\":\"5 6\",\"output\":\"11\"},{\"input\":\"7 8\",\"output\":\"15\"}]','{\"timeLimit\":100,\"memoryLimit\":100,\"stackLimit\":1000}',0,0,1,'2023-09-27 14:53:10','2023-10-11 09:05:08',0),(2,'排序算法','abcdefg','[\"中等\",\"排序\"]','a+b=c',0,0,'[{\"input\":\"1\",\"output\":\"2\"},{\"input\":\"3\",\"output\":\"4\"}]','{\"timeLimit\":100,\"memoryLimit\":100,\"stackLimit\":100}',0,0,2,'2023-09-27 14:56:02','2023-10-10 09:50:02',0),(3,'a+3','abcdefg','[\"堆\",\"简单\"]','a+b=c',0,0,'[{\"input\":\"1\",\"output\":\"2\"},{\"input\":\"3\",\"output\":\"4\"}]','{\"timeLimit\":100,\"memoryLimit\":100,\"stackLimit\":100}',0,0,3,'2023-09-27 17:21:18','2023-09-29 00:11:54',0),(4,'b+4','abcdefg','[\"二叉树\",\"困难\"]','a+b=c',0,0,'[{\"input\":\"100\",\"output\":\"200\"},{\"input\":\"300\",\"output\":\"400\"}]','{\"timeLimit\":100,\"memoryLimit\":100,\"stackLimit\":100}',0,0,6,'2023-09-27 17:29:11','2023-10-10 11:01:03',0),(5,'b+5','abcdefg','[\"堆\",\"简单\"]','a+b=c',0,0,'[{\"input\":\"1\",\"output\":\"2\"},{\"input\":\"3\",\"output\":\"4\"}]','{\"timeLimit\":100,\"memoryLimit\":100,\"stackLimit\":100}',0,0,2,'2023-09-27 17:30:14','2023-09-29 00:11:54',0),(6,'b+6','abcdefg','[\"堆\",\"困难\"]','a+b=c',0,0,'[{\"input\":\"1\",\"output\":\"2\"},{\"input\":\"3\",\"output\":\"4\"}]','{\"timeLimit\":100,\"memoryLimit\":100,\"stackLimit\":100}',0,0,3,'2023-09-27 17:34:17','2023-10-10 11:27:34',0),(7,'b+7','abcdefg','[\"二叉树\",\"困难\"]','a+b=c',0,0,'[{\"input\":\"100\",\"output\":\"200\"},{\"input\":\"300\",\"output\":\"400\"}]','{\"timeLimit\":100,\"memoryLimit\":100,\"stackLimit\":100}',0,0,3,'2023-09-27 17:37:32','2023-10-10 09:52:59',1),(8,'问题标题','问题内容','[\"标签1\",\"标签2\"]','问题答案',0,0,'[]','{\"timeLimit\":0,\"memoryLimit\":0,\"stackLimit\":0}',0,0,6,'2023-09-29 13:31:47','2023-09-29 13:31:59',1),(9,'题目9','## 内容\n给你一个字符串表达式 s ，请你实现一个基本计算器来计算并返回它的值。\n\n整数除法仅保留整数部分。\n\n你可以假设给定的表达式总是有效的。所有中间结果将在 [-231, 231 - 1] 的范围内。\n\n注意：不允许使用任何将字符串作为数学表达式计算的内置函数，比如 eval() 。\n\n \n\n### 示例 1：\n\n> 输入：s = \"3+2*2\"\n输出：7\n\n### 示例 2：\n\n> 输入：s = \" 3/2 \"\n输出：1\n\n### 示例 3：\n\n> 输入：s = \" 3+5 / 2 \"\n输出：5\n \n\n提示：\n\n* 1 <= s.length <= 3 * 105\n* s 由整数和算符 (\'+\', \'-\', \'*\', \'/\') 组成，中间由一些空格隔开\n* s 表示一个 有效表达式\n* 表达式中的所有整数都是非负整数，且在范围 [0, 231 - 1] 内\n* 题目数据保证答案是一个 32-bit 整数','[\"二叉树\",\"简单\"]','答案',0,0,'[{\"input\":\"\\\"3+2*2\\\"\",\"output\":\"7\"},{\"input\":\"s = \\\" 3/2 \\\"\",\"output\":\"1\"},{\"input\":\"s = \\\" 3+5 / 2 \\\"\",\"output\":\"5\"}]','{\"timeLimit\":1000,\"memoryLimit\":2000,\"stackLimit\":1000}',0,0,12,'2023-09-30 15:42:29','2023-10-01 09:59:10',0);
/*!40000 ALTER TABLE `question` ENABLE KEYS */;

--
-- Table structure for table `question_submit`
--

DROP TABLE IF EXISTS `question_submit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question_submit` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `language` varchar(128) NOT NULL COMMENT '编程语言',
  `code` text NOT NULL COMMENT '用户代码',
  `judgeInfo` text COMMENT '判题信息（json 对象）',
  `status` int NOT NULL DEFAULT '0' COMMENT '判题状态（0 - 待判题、1 - 判题中、2 - 成功、3 - 失败）',
  `questionId` bigint NOT NULL COMMENT '题目 id',
  `userId` bigint NOT NULL COMMENT '创建用户 id',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `isDelete` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`),
  KEY `idx_questionId` (`questionId`),
  KEY `idx_userId` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='题目提交';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_submit`
--

/*!40000 ALTER TABLE `question_submit` DISABLE KEYS */;
INSERT INTO `question_submit` VALUES (1,'go','a+b=2','{\"message\":\"\",\"memory\":1404,\"time\":0}',0,4,6,'2023-09-29 14:55:17','2023-10-10 21:16:09',0),(2,'go','a+b=2','{\"message\":\"Wrong Answer\",\"memory\":10000,\"time\":100}',2,4,6,'2023-09-29 15:12:05','2023-10-10 21:16:12',0),(3,'go','func main() {\n\n    fmt.Printf(\"ok\")\n}','{\"message\":\"Compile Error\",\"memory\":203,\"time\":0}',2,9,12,'2023-10-01 10:01:13','2023-10-10 21:16:16',0),(4,'go','package main\n\nimport (\n	\"fmt\"\n	\"os\"\n)\n\nfunc main() {\n	a, _ := os.Args[1]\n	b, _ := os.Args[2]\n	fmt.Printf(\"%d\", a+b)\n}','{\"message\":\"Compile Error\",\"memory\":5000,\"time\":0}',2,1,12,'2023-10-09 10:19:51','2023-10-10 21:16:21',0),(5,'go','package main\n\nimport (\n	\"fmt\"\n	\"os\"\n	\"strconv\"\n)\n\nfunc main() {\n	targs := os.Args[1:]\n	a, _ := strconv.Atoi(args[0])\n	b, _ := strconv.Atoi(args[1])\n	fmt.Printf(\"%d\", a+b)\n}\n','{}',3,1,12,'2023-10-09 10:52:06','2023-10-09 21:44:05',0),(6,'go','package main\n\nimport (\n	\"fmt\"\n	\"os\"\n	\"strconv\"\n)\n\nfunc main() {\n	args := os.Args[1:]\n	a, _ := strconv.Atoi(args[0])\n	b, _ := strconv.Atoi(args[1])\n	fmt.Printf(\"%d\", a+b)\n}\n','{\"message\":\"Accepted\",\"memory\":1250,\"time\":403}',1,1,12,'2023-10-09 10:57:19','2023-10-10 21:16:30',0),(7,'go','package main\n\nimport (\n	\"fmt\"\n	\"os\"\n	\"strconv\"\n)\n\nfunc main() {\n	targs := os.Args[1:]\n	a, _ := strconv.Atoi(args[0])\n	b, _ := strconv.Atoi(args[1])\n	fmt.Printf(\"%d\", a+b)\n}\n','{\"message\":\"Compile Error\",\"memory\":12241024,\"time\":0}',2,1,12,'2023-10-09 11:13:38','2023-10-10 21:16:43',0),(8,'go','package main\n\nimport (\n	\"fmt\"\n	\"os\"\n	\"strconv\"\n)\n\nfunc main() {\n	args := os.Args[1:]\n	a, _ := strconv.Atoi(args[0])\n	b, _ := strconv.Atoi(args[1])\n	fmt.Printf(\"%d\", a+b)\n}\n','{\"message\":\"Time Limit Exceeded\",\"memory\":5360,\"time\":650}',2,1,12,'2023-10-09 11:14:44','2023-10-10 21:16:54',0),(9,'go','package main\n\nimport (\n	\"fmt\"\n	\"os\"\n	\"strconv\"\n)\n\nfunc main() {\n	args := os.Args[1:]\n	a, _ := strconv.Atoi(args[0])\n	b, _ := strconv.Atoi(args[1])\n	fmt.Printf(\"%d\", a+b)\n}\n','{\"message\":\"Memory Limit Exceeded\",\"memory\":1785856,\"time\":31}',2,1,12,'2023-10-09 11:16:00','2023-10-09 12:19:02',0),(10,'go','package main\n\nimport (\n	\"fmt\"\n	\"os\"\n	\"strconv\"\n)\n\nfunc main() {\n	args := os.Args[1:]\n	a, _ := strconv.Atoi(args[0])\n	b, _ := strconv.Atoi(args[1])\n	fmt.Printf(\"%d\", a+b)\n}\n','{\"message\":\"Accepted\",\"memory\":0,\"time\":60001}',2,1,12,'2023-10-10 08:21:03','2023-10-10 21:33:17',0),(11,'go','','{\"message\":\"Compile Error\",\"memory\":0,\"time\":0}',2,1,12,'2023-10-10 08:38:13','2023-10-10 08:38:25',0),(12,'go','package main\n\nimport (\n	\"fmt\"\n	\"os\"\n	\"strconv\"\n)\n\nfunc main() {\n	args := os.Args[1:]\n	a, _ := strconv.Atoi(args[0])\n	b, _ := strconv.Atoi(args[1])\n	fmt.Printf(\"%d\", a+b)\n}\n','{\"message\":\"Accepted\",\"memory\":1200,\"time\":10000}',2,1,12,'2023-10-10 12:28:15','2023-10-10 21:23:49',0),(13,'go','package main\n\nimport (\n	\"fmt\"\n	\"os\"\n	\"strconv\"\n)\n\nfunc main() {\n	args := os.Args[1:]\n	a, _ := strconv.Atoi(args[0])\n	b, _ := strconv.Atoi(args[1])\n	fmt.Printf(\"%d\", a+b)\n}\n','{\"message\":\"Accepted\",\"memory\":500,\"time\":11}',2,1,12,'2023-10-10 12:32:54','2023-10-10 21:17:29',0),(14,'go','serfasd','{\"message\":\"Compile Error\",\"memory\":0,\"time\":0}',2,1,12,'2023-10-10 12:55:18','2023-10-10 12:55:32',0),(15,'go','dfgsad','{\"message\":\"Compile Error\",\"memory\":0,\"time\":0}',2,1,12,'2023-10-10 13:43:47','2023-10-10 13:44:01',0),(16,'go','package main\n\nimport (\n	\"fmt\"\n	\"os\"\n	\"strconv\"\n)\n\nfunc main() {\n	args := os.Args[1:]\n	a, _ := strconv.Atoi(args[0])\n	b, _ := strconv.Atoi(args[1])\n	fmt.Printf(\"%d\", a+b)\n}\n','{\"message\":\"Accepted\",\"memory\":0,\"time\":9}',2,1,12,'2023-10-10 13:45:34','2023-10-10 13:46:07',0),(17,'go','package main\n\nimport (\n	\"fmt\"\n	\"os\"\n	\"strconv\"\n)\n\nfunc main() {\n	args := os.Args[1:]\n	a, _ := strconv.Atoi(args[0])\n	b, _ := strconv.Atoi(args[1])\n	fmt.Printf(\"%d\", a+b)\n}\n','{\"message\":\"Accepted\",\"memory\":0,\"time\":6}',2,1,12,'2023-10-10 13:50:43','2023-10-10 13:51:17',0),(18,'go','package main\n\nimport (\n	\"fmt\"\n	\"os\"\n	\"strconv\"\n)\n\nfunc main() {\n	args := os.Args[1:]\n	a, _ := strconv.Atoi(args[0])\n	b, _ := strconv.Atoi(args[1])\n	fmt.Printf(\"%d\", a+b)\n}\n','{\"message\":\"Accepted\",\"memory\":0,\"time\":44}',2,1,12,'2023-10-10 15:26:40','2023-10-10 15:27:15',0),(19,'go','package main\n\nimport (\n	\"fmt\"\n	\"os\"\n	\"strconv\"\n)\n\nfunc main() {\n	args := os.Args[1:]\n	a, _ := strconv.Atoi(args[0])\n	b, _ := strconv.Atoi(args[1])\n	fmt.Printf(\"%d\", a+b)\n}\n','{\"message\":\"Accepted\",\"memory\":0,\"time\":5}',2,1,12,'2023-10-10 15:37:22','2023-10-10 15:37:55',0),(20,'go','sdfasd','{\"message\":\"Compile Error\",\"memory\":0,\"time\":0}',2,1,12,'2023-10-10 15:38:29','2023-10-10 15:38:41',0),(21,'go','asdafsds','{\"message\":\"Compile Error\",\"memory\":0,\"time\":0}',2,1,12,'2023-10-11 04:15:26','2023-10-11 04:15:40',0),(22,'go','sdafsd','{\"message\":\"Compile Error\",\"memory\":0,\"time\":0}',2,1,12,'2023-10-11 09:05:08','2023-10-11 09:05:09',0);
/*!40000 ALTER TABLE `question_submit` ENABLE KEYS */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `userAccount` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '账号',
  `userPassword` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `unionId` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '微信开放平台id',
  `mpOpenId` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '公众号openId',
  `userName` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户昵称',
  `userAvatar` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户头像',
  `userProfile` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户简介',
  `gender` tinyint DEFAULT NULL COMMENT '性别',
  `userRole` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user' COMMENT '用户角色：user/admin/ban',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `isDelete` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uni_userAccount` (`userAccount`),
  KEY `idx_unionId` (`unionId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

--
-- Dumping routines for database 'xoj'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-12 11:32:40
