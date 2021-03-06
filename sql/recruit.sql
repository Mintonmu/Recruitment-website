/*
 Navicat Premium Data Transfer

 Source Server         : localdb
 Source Server Type    : MySQL
 Source Server Version : 80022
 Source Host           : localhost:3306
 Source Schema         : recruit

 Target Server Type    : MySQL
 Target Server Version : 80022
 File Encoding         : 65001

 Date: 29/12/2020 14:34:49
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `userid` bigint NOT NULL,
  `mobile` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`userid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='管理员信息';

-- ----------------------------
-- Records of admin
-- ----------------------------
BEGIN;
INSERT INTO `admin` VALUES (19980208, '17812345678', '9136f8f230e20ca9afc410d14c826586', '管理员', 'babycoder@163.com');
COMMIT;

-- ----------------------------
-- Table structure for application
-- ----------------------------
DROP TABLE IF EXISTS `application`;
CREATE TABLE `application` (
  `applicationId` int NOT NULL AUTO_INCREMENT,
  `state` int DEFAULT NULL,
  `recentTime` datetime DEFAULT NULL,
  `resumeId` int NOT NULL,
  `positionId` int NOT NULL,
  `hrId` int DEFAULT NULL,
  PRIMARY KEY (`applicationId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of application
-- ----------------------------
BEGIN;
INSERT INTO `application` VALUES (1, 1, NULL, 1, 1, 1);
INSERT INTO `application` VALUES (2, 1, NULL, 2, 5, 2);
INSERT INTO `application` VALUES (3, 1, NULL, 2, 11, 2);
INSERT INTO `application` VALUES (4, 1, NULL, 2, 15, 3);
INSERT INTO `application` VALUES (5, 1, NULL, 6, 11, 5);
INSERT INTO `application` VALUES (6, 1, NULL, 5, 3, 3);
INSERT INTO `application` VALUES (7, 1, NULL, 6, 18, 1);
INSERT INTO `application` VALUES (8, 1, NULL, 4, 5, 1);
INSERT INTO `application` VALUES (9, 1, NULL, 4, 13, 6);
INSERT INTO `application` VALUES (12, 0, '2017-11-17 11:32:47', 24, 14, NULL);
INSERT INTO `application` VALUES (13, 0, '2017-11-17 20:36:09', 25, 15, NULL);
INSERT INTO `application` VALUES (14, 0, '2020-11-30 11:17:00', 29, 8, NULL);
INSERT INTO `application` VALUES (15, 0, '2020-12-28 23:31:26', 32, 4, NULL);
COMMIT;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `categoryId` int NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  PRIMARY KEY (`categoryId`) USING BTREE,
  UNIQUE KEY `categoryName_UNIQUE` (`categoryName`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of category
-- ----------------------------
BEGIN;
INSERT INTO `category` VALUES (1, 'Java', 'Java开发');
INSERT INTO `category` VALUES (2, 'C++', 'C++开发');
INSERT INTO `category` VALUES (3, 'PHP', 'PHP开发');
INSERT INTO `category` VALUES (4, '.NET', '.NET开发');
INSERT INTO `category` VALUES (5, 'Python', 'Python开发');
INSERT INTO `category` VALUES (6, '数据挖掘', '数据挖掘');
COMMIT;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `commentId` int NOT NULL AUTO_INCREMENT,
  `type` int DEFAULT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `releaseTime` datetime DEFAULT NULL,
  `userId` int NOT NULL,
  `positionId` int NOT NULL,
  PRIMARY KEY (`commentId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of comment
-- ----------------------------
BEGIN;
INSERT INTO `comment` VALUES (1, 3, 'C++是C语言的继承，它既可以进行C语言的过程化程序设计，又可以进行以抽象数据类型为特点的基于对象的程序设计，还可以进行以继承和多态为特点的面向对象的程序设计', '2017-11-14 22:47:42', 1, 5);
INSERT INTO `comment` VALUES (2, 2, 'Java是一门面向对象编程语言，不仅吸收了C++语言的各种优点，还摒弃了C++里难以理解的多继承、指针等概念', '2017-11-14 22:47:42', 1, 17);
INSERT INTO `comment` VALUES (3, 1, 'Python是纯粹的自由软件， 源代码和解释器CPython遵循 GPL(GNU General Public License)协议', '2017-11-14 22:47:42', 2, 11);
INSERT INTO `comment` VALUES (4, 3, 'C++不仅拥有计算机高效运行的实用性特征，同时还致力于提高大规模程序的编程质量与程序设计语言的问题描述能力', '2017-11-14 22:47:42', 3, 18);
INSERT INTO `comment` VALUES (5, 3, '这是一些关于Java工程师的评论，这个职位需要丰富的阅历的和工作经验', '2017-11-14 22:47:42', 5, 2);
INSERT INTO `comment` VALUES (6, 2, '又要写测试评论，写点啥呢？布吉岛', '2017-11-14 22:47:42', 6, 8);
INSERT INTO `comment` VALUES (7, 3, '数据挖掘一般是指从大量的数据中通过算法搜索隐藏于其中信息的过程', '2017-11-14 22:47:42', 6, 14);
INSERT INTO `comment` VALUES (8, 3, 'Java具有简单性、面向对象、分布式、健壮性、安全性、平台独立与可移植性、多线程、动态性等特点', '2017-11-14 22:47:42', 6, 17);
INSERT INTO `comment` VALUES (9, 2, 'Python 已经成为最受欢迎的程序设计语言之一', '2017-11-14 22:47:42', 1, 10);
INSERT INTO `comment` VALUES (10, 3, '<p>.NET是 Microsoft XML Web services 平台</p>', '2017-11-14 22:47:42', 2, 9);
INSERT INTO `comment` VALUES (19, 3, 'IndexRecruit大透明弱弱地评论一句~', '2017-11-16 22:37:26', 7, 13);
INSERT INTO `comment` VALUES (21, 3, '学习数据挖掘小白应该从哪个方面入手？萌新小白求教~', '2017-11-17 11:32:32', 24, 14);
INSERT INTO `comment` VALUES (23, 3, '<p><span><u><b>XML Web services 允许应用程序通过 Internet 进行通讯和共享数据，而不管所采用的是哪种操作系统、设备或编程语言</b></u></span></p>', '2017-11-17 21:45:42', 25, 9);
INSERT INTO `comment` VALUES (24, 3, '<i>阿里今年双十一赚大发了。。。</i>', '2017-11-17 21:56:58', 25, 1);
INSERT INTO `comment` VALUES (25, 2, 'aaaa', '2020-11-30 12:11:17', 29, 16);
INSERT INTO `comment` VALUES (26, 2, 'wwwww', '2020-12-28 23:02:54', 29, 16);
INSERT INTO `comment` VALUES (27, 3, 'Python才是世界上最好的语言', '2020-12-28 23:11:47', 30, 10);
INSERT INTO `comment` VALUES (28, 2, '现在JAVA岗位可真的多啊，真的是比较好找工作', '2020-12-28 23:28:53', 31, 4);
INSERT INTO `comment` VALUES (29, 3, '<b><i><u>C++才是世界上最好的语言，没有之一</u></i></b>', '2020-12-28 23:29:41', 31, 18);
COMMIT;

-- ----------------------------
-- Table structure for company
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `companyId` int NOT NULL AUTO_INCREMENT,
  `companyName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `companyLogo` int DEFAULT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `state` int DEFAULT NULL,
  `companyCode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`companyId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of company
-- ----------------------------
BEGIN;
INSERT INTO `company` VALUES (1, '阿里巴巴', 1, '阿里巴巴网络技术有限公司（简称：阿里巴巴集团）是以曾担任英语教师的马云为首的18人于1999年在浙江杭州创立', 1, 'AL85685');
INSERT INTO `company` VALUES (2, '滴滴出行', 2, '滴滴出行是涵盖出租车、专车、 快车、顺风车、代驾及 大巴等多项业务在内的一站式出行平台，2015年9月9日由“滴滴打车”更名而来', 1, 'DD36526');
INSERT INTO `company` VALUES (3, '搜狐媒体', 3, '搜狐公司是中国领先的互联网品牌，是中国最主要的新闻提供商，搜狐的网络资产给众多用户在信息、娱乐以及交流方面提供了广泛的选择', 1, 'SH74524');
INSERT INTO `company` VALUES (4, '京东', 4, '京东致力于成为一家为社会创造最大价值的公司。经过13年砥砺前行，京东在商业领域一次又一次突破创新，取得了跨越式发展', 1, 'JD86635');
INSERT INTO `company` VALUES (5, '网易', 5, '网易公司（NASDAQ: NTES）是中国的互联网公司，利用互联网技术，加强人与人之间信息的交流和共享，实现“网聚人的力量”', 1, 'WY53265');
INSERT INTO `company` VALUES (6, '爱奇艺', 6, '自成立伊始，爱奇艺坚持“悦享品质”的公司理念，以“用户体验”为生命，专注为用户提供清晰、流畅、界面友好的观映体验', 1, 'AQ86532');
INSERT INTO `company` VALUES (9, '百度', 7, '百度', 1, 'BD12342');
COMMIT;

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `departmentId` int NOT NULL AUTO_INCREMENT,
  `departmentName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `companyId` int NOT NULL,
  PRIMARY KEY (`departmentId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of department
-- ----------------------------
BEGIN;
INSERT INTO `department` VALUES (1, '技术部', '负责对新产品的设计和开发的控制，编制各类技术文件', 1);
INSERT INTO `department` VALUES (2, '行政部', '负责行政事务和办公事务', 1);
INSERT INTO `department` VALUES (3, '市场部', '对销售预测，提出未来市场的分析、发展方向和规划', 1);
INSERT INTO `department` VALUES (4, '技术部', '负责对新产品的设计和开发的控制，编制各类技术文件', 2);
INSERT INTO `department` VALUES (5, '行政部', '负责行政事务和办公事务', 2);
INSERT INTO `department` VALUES (6, '市场部', '对销售预测，提出未来市场的分析、发展方向和规划', 2);
INSERT INTO `department` VALUES (7, '技术部', '负责对新产品的设计和开发的控制，编制各类技术文件', 3);
INSERT INTO `department` VALUES (8, '行政部', '负责行政事务和办公事务', 3);
INSERT INTO `department` VALUES (9, '市场部', '对销售预测，提出未来市场的分析、发展方向和规划', 3);
INSERT INTO `department` VALUES (10, '技术部', '负责对新产品的设计和开发的控制，编制各类技术文件', 4);
INSERT INTO `department` VALUES (11, '行政部', '负责行政事务和办公事务', 4);
INSERT INTO `department` VALUES (12, '市场部', '对销售预测，提出未来市场的分析、发展方向和规划', 4);
INSERT INTO `department` VALUES (13, '技术部', '负责对新产品的设计和开发的控制，编制各类技术文件', 5);
INSERT INTO `department` VALUES (14, '行政部', '负责行政事务和办公事务', 5);
INSERT INTO `department` VALUES (15, '市场部', '对销售预测，提出未来市场的分析、发展方向和规划', 5);
INSERT INTO `department` VALUES (16, '技术部', '负责对新产品的设计和开发的控制，编制各类技术文件', 6);
INSERT INTO `department` VALUES (17, '行政部', '负责行政事务和办公事务', 6);
INSERT INTO `department` VALUES (18, '市场部', '对销售预测，提出未来市场的分析、发展方向和规划', 6);
COMMIT;

-- ----------------------------
-- Table structure for favor
-- ----------------------------
DROP TABLE IF EXISTS `favor`;
CREATE TABLE `favor` (
  `favorId` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `positionId` int NOT NULL,
  PRIMARY KEY (`favorId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of favor
-- ----------------------------
BEGIN;
INSERT INTO `favor` VALUES (1, 1, 16);
INSERT INTO `favor` VALUES (2, 1, 2);
INSERT INTO `favor` VALUES (3, 1, 8);
INSERT INTO `favor` VALUES (4, 2, 2);
INSERT INTO `favor` VALUES (5, 2, 15);
INSERT INTO `favor` VALUES (6, 2, 3);
INSERT INTO `favor` VALUES (7, 2, 5);
INSERT INTO `favor` VALUES (8, 3, 1);
INSERT INTO `favor` VALUES (9, 4, 6);
INSERT INTO `favor` VALUES (10, 4, 8);
INSERT INTO `favor` VALUES (11, 4, 8);
INSERT INTO `favor` VALUES (12, 6, 10);
INSERT INTO `favor` VALUES (13, 6, 11);
INSERT INTO `favor` VALUES (14, 6, 18);
INSERT INTO `favor` VALUES (17, 24, 2);
INSERT INTO `favor` VALUES (18, 29, 16);
INSERT INTO `favor` VALUES (19, 30, 10);
INSERT INTO `favor` VALUES (20, 31, 4);
INSERT INTO `favor` VALUES (21, 31, 18);
COMMIT;

-- ----------------------------
-- Table structure for hr
-- ----------------------------
DROP TABLE IF EXISTS `hr`;
CREATE TABLE `hr` (
  `hrId` int NOT NULL AUTO_INCREMENT,
  `hrMobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `hrPassword` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `hrName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `hrEmail` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `departmentId` int NOT NULL,
  PRIMARY KEY (`hrId`) USING BTREE,
  UNIQUE KEY `mobile_UNIQUE` (`hrMobile`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of hr
-- ----------------------------
BEGIN;
INSERT INTO `hr` VALUES (1, '15786586352', '4QrcOUm6Wau+VuBX8g+IPg==', '董一鸣', 'dongyiming@163.com', NULL, 0);
INSERT INTO `hr` VALUES (2, '13685653625', 'e10adc3949ba59abbe56e057f20f883e', '张帆', 'zhangfan@163.com', '行政部HR', 5);
INSERT INTO `hr` VALUES (3, '18596475235', 'e10adc3949ba59abbe56e057f20f883e', '李斌', 'libin@163.com', '行政部HR', 8);
INSERT INTO `hr` VALUES (4, '16785253625', 'e10adc3949ba59abbe56e057f20f883e', '王语意', 'wangyuyi@163.com', '行政部HR', 11);
INSERT INTO `hr` VALUES (5, '17865253625', 'e10adc3949ba59abbe56e057f20f883e', '李星泽', 'lixingze@163.com', '行政部HR', 14);
INSERT INTO `hr` VALUES (6, '13958726395', 'e10adc3949ba59abbe56e057f20f883e', '程瑜', 'chengyu@163.com', '行政部HR', 17);
INSERT INTO `hr` VALUES (7, '15724564983', 'be95d9559fdf9295af7437f8f167e196', 'mintonmu', NULL, NULL, 15);
INSERT INTO `hr` VALUES (8, '13099255091', 'C6944Nyt1RJfu2rlBRSz5w==', 'user00', NULL, NULL, 0);
INSERT INTO `hr` VALUES (9, '13099255092', '4QrcOUm6Wau+VuBX8g+IPg==', 'testhr01', NULL, NULL, 0);
INSERT INTO `hr` VALUES (10, '15724564982', '4QrcOUm6Wau+VuBX8g+IPg==', 'testhr02', NULL, NULL, 0);
INSERT INTO `hr` VALUES (11, '15293175401', 'java01', 'testhr', 'testhr@hr.com', NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for position
-- ----------------------------
DROP TABLE IF EXISTS `position`;
CREATE TABLE `position` (
  `positionId` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `requirement` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `quantity` int DEFAULT NULL,
  `workCity` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `salaryUp` int DEFAULT NULL,
  `salaryDown` int DEFAULT NULL,
  `releaseDate` date DEFAULT NULL,
  `validDate` date DEFAULT NULL,
  `statePub` int DEFAULT NULL,
  `hits` int DEFAULT '0',
  `categoryId` int NOT NULL,
  `departmentId` int NOT NULL,
  `hrIdPub` int NOT NULL,
  PRIMARY KEY (`positionId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of position
-- ----------------------------
BEGIN;
INSERT INTO `position` VALUES (1, 'Java工程师', '熟练使用RPC框架，具备相关的分布式开发经验', 3, '北京市', 12000, 7000, '2017-10-27', NULL, 1, 143, 1, 1, 1);
INSERT INTO `position` VALUES (2, 'Java工程师', '接收应届实习生，实习期满应聘上岗接收应届实习生，实习期满应聘上岗收应届实习生，实习期满应聘上岗', 5, '上海市', 16000, 11000, '2017-11-07', NULL, 1, 121, 1, 4, 2);
INSERT INTO `position` VALUES (3, 'Java工程师', '有扎实的java基础，熟悉分布式、缓存、异步消息等原理和应用', 15, '天津市', 13000, 10000, '2017-09-30', NULL, 1, 3, 1, 7, 3);
INSERT INTO `position` VALUES (4, 'Java工程师', 'JAVA WEB方向2年+经验', 2, '南京市', 16000, 12000, '2017-09-25', NULL, 1, 13, 1, 10, 4);
INSERT INTO `position` VALUES (5, 'C++工程师', '可接收计算机相关专业应届生，表现优秀者加薪转正', 30, '南京市', 8000, 5000, '2017-10-16', NULL, 1, 13, 2, 10, 4);
INSERT INTO `position` VALUES (6, 'C++工程师', '3-5年工作经验，计算机相关专业毕业', 1, '上海市', 16000, 8000, '2017-11-03', NULL, 1, 5, 2, 4, 2);
INSERT INTO `position` VALUES (7, 'PHP工程师', '一年以上PHP开发经验 （项目经验丰富的，也可以升级为高级开发工程师）', 10, '上海市', 11000, 8000, '2017-11-10', NULL, 1, 82, 3, 4, 2);
INSERT INTO `position` VALUES (8, 'PHP工程师', '熟悉LNMP/WNMP开发环境 , 熟练使用Yaf, Yii, ThinkPHP等一种或多种框架', 5, '上海市', 12000, 7000, '2017-11-01', NULL, 1, 2, 3, 4, 2);
INSERT INTO `position` VALUES (11, 'Python开发', '4年以上互联网产品后台研发经验，2年以上后台构架经验', 2, '北京市', 22000, 18000, '2017-09-23', NULL, 1, 1, 5, 1, 1);
INSERT INTO `position` VALUES (12, 'Python开发', '精通Python，2年或以上Python项目经验', 3, '天津市', 16000, 14000, '2017-07-27', NULL, 1, 35, 5, 7, 3);
INSERT INTO `position` VALUES (13, '数据挖掘工程师', '熟悉 Linux平台上的编程环境，精通Java开发，精通 Python/Shell等脚本语言', 12, '天津市', 22000, 15000, '2017-11-05', NULL, 1, 4, 6, 7, 3);
INSERT INTO `position` VALUES (15, '数据挖掘工程师', '精通Python，熟悉PHP/GO/Java/C++/C等语言中的一种或几种', 2, '杭州市', 26000, 14000, '2017-11-08', NULL, 1, 20, 6, 13, 5);
INSERT INTO `position` VALUES (16, 'Java工程师', '熟悉Spring、Freemark、Struts、Hibernate 等开源框架', 13, '杭州市', 18000, 15000, '2017-11-11', NULL, 1, 11, 1, 17, 6);
INSERT INTO `position` VALUES (17, 'Java后端开发', '熟练使用Mybatis，SpringMVC，SpringCloud等框架', 5, '杭州市', 21000, 18000, '2017-10-23', NULL, 1, 3, 1, 13, 5);
INSERT INTO `position` VALUES (18, 'C++后端开发', '熟练linux系统操作，熟练gcc,gdb,vim, eclipse等开发工具', 5, '北京市', 12000, 9000, '2017-10-28', NULL, 1, 4, 2, 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for resume
-- ----------------------------
DROP TABLE IF EXISTS `resume`;
CREATE TABLE `resume` (
  `resumeId` int NOT NULL AUTO_INCREMENT,
  `ability` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `internship` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `workExperience` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `certificate` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `jobDesire` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `userId` int NOT NULL,
  PRIMARY KEY (`resumeId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of resume
-- ----------------------------
BEGIN;
INSERT INTO `resume` VALUES (1, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `resume` VALUES (2, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO `resume` VALUES (3, NULL, NULL, NULL, NULL, NULL, 3);
INSERT INTO `resume` VALUES (4, NULL, NULL, NULL, NULL, NULL, 4);
INSERT INTO `resume` VALUES (5, NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO `resume` VALUES (6, NULL, NULL, NULL, NULL, NULL, 6);
INSERT INTO `resume` VALUES (7, NULL, NULL, NULL, NULL, NULL, 7);
INSERT INTO `resume` VALUES (8, NULL, NULL, NULL, NULL, NULL, 8);
INSERT INTO `resume` VALUES (9, NULL, NULL, NULL, NULL, NULL, 9);
INSERT INTO `resume` VALUES (10, NULL, NULL, NULL, NULL, NULL, 10);
INSERT INTO `resume` VALUES (11, NULL, NULL, NULL, NULL, NULL, 11);
INSERT INTO `resume` VALUES (12, NULL, NULL, NULL, NULL, NULL, 12);
INSERT INTO `resume` VALUES (13, NULL, NULL, NULL, NULL, NULL, 13);
INSERT INTO `resume` VALUES (14, NULL, NULL, NULL, NULL, NULL, 14);
INSERT INTO `resume` VALUES (17, NULL, NULL, NULL, NULL, NULL, 17);
INSERT INTO `resume` VALUES (21, NULL, NULL, NULL, NULL, NULL, 21);
INSERT INTO `resume` VALUES (24, '写点什么。。。', '写点什么。。。', '写点什么。。。', '写点什么。。。', '写点什么。。。', 24);
INSERT INTO `resume` VALUES (25, '专业能力么。。。也就能悄悄代码', '还没毕业，也没啥实习经历~', '无实际工作经历~', '拿过几次奖学金吧', '有一份别太累稳定的工作就好。。。', 25);
INSERT INTO `resume` VALUES (26, NULL, NULL, NULL, NULL, NULL, 26);
INSERT INTO `resume` VALUES (27, NULL, NULL, NULL, NULL, NULL, 27);
INSERT INTO `resume` VALUES (28, NULL, NULL, NULL, NULL, NULL, 28);
INSERT INTO `resume` VALUES (29, 'dfgdsG', '11111', 'awda414', 'awdw', 'awd', 29);
INSERT INTO `resume` VALUES (30, NULL, NULL, NULL, NULL, NULL, 30);
INSERT INTO `resume` VALUES (31, NULL, NULL, NULL, NULL, NULL, 30);
INSERT INTO `resume` VALUES (32, '能够熟练使用C++、JAVA等编程语言', '在百度和腾讯实习经验', '目前在字节跳动任职', '获得ACM全国金牌', '希望能多开点工资', 31);
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `gender` int DEFAULT NULL,
  `birthYear` int DEFAULT NULL,
  `nickname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `province` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `city` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `eduDegree` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `graduation` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `graYear` int DEFAULT NULL,
  `major` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `dirDesire` int DEFAULT NULL,
  PRIMARY KEY (`userId`) USING BTREE,
  UNIQUE KEY `user_id_UNIQUE` (`userId`) USING BTREE,
  UNIQUE KEY `user_mobile_UNIQUE` (`mobile`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES (1, '13754258565', '4QrcOUm6Wau+VuBX8g+IPg==', '夏高兴', 0, NULL, '云淡天高', 'xiagaoxin@163.com', '北京市', '北京市', '硕士', '中南财经政法大学', NULL, NULL, 3);
INSERT INTO `user` VALUES (2, '16873315255', '4QrcOUm6Wau+VuBX8g+IPg==', '沈茂德', 0, NULL, '冷酷的云', 'shenmaode@163.com', '北京市', '北京市', '本科', '湖南师范大学', NULL, NULL, 3);
INSERT INTO `user` VALUES (3, '16535356412', '4QrcOUm6Wau+VuBX8g+IPg==', '杜文瑞', 0, NULL, '我心寂寞', 'duwenrui@163.com', '上海市', '上海市', '本科', '东北财经大学', NULL, NULL, 1);
INSERT INTO `user` VALUES (4, '15785658371', '4QrcOUm6Wau+VuBX8g+IPg==', '彭友卉', 0, NULL, '尘封记忆', 'pengyouhui@163.com', '上海市', '上海市', '本科', '西南大学', NULL, NULL, 2);
INSERT INTO `user` VALUES (5, '16735259632', '4QrcOUm6Wau+VuBX8g+IPg==', '崔谷槐', 0, NULL, '飘雪无垠', 'cuiguhuai@163.com', '上海市', '上海市', '本科', '苏州大学', NULL, NULL, 2);
INSERT INTO `user` VALUES (6, '17898763255', '4QrcOUm6Wau+VuBX8g+IPg==', '魏茂材', 0, NULL, '风过无痕', 'weimaocai@163.com', '广东省', '广州市', '本科', '西北大学', NULL, NULL, 6);
INSERT INTO `user` VALUES (7, '17563522636', '4QrcOUm6Wau+VuBX8g+IPg==', '侯成文', 0, 1997, '星月相随', 'huochengwen', '湖北省', '武汉市', '硕士', '上海财经大学', 2019, '国际金融', 3);
INSERT INTO `user` VALUES (8, '18936258863', '4QrcOUm6Wau+VuBX8g+IPg==', '邵夜云', 1, NULL, '低调沉默者', 'shaoyeyun@163.com', '北京市', '北京市', '本科', '江苏大学', NULL, NULL, 2);
INSERT INTO `user` VALUES (9, '13752533625', '4QrcOUm6Wau+VuBX8g+IPg==', '方彭湃', 1, NULL, '梦醒童话', 'fangpengpai@163.com', '天津市', '天津市', '硕士', '西南政法大学', NULL, NULL, 4);
INSERT INTO `user` VALUES (10, '15763968252', '4QrcOUm6Wau+VuBX8g+IPg==', '熊新觉', 1, NULL, '咖啡的味道', 'xiongxinjue@163.com', '广东省', '广州市', '本科', '重庆医科大学', NULL, NULL, 3);
INSERT INTO `user` VALUES (11, '13685259986', '4QrcOUm6Wau+VuBX8g+IPg==', '肖又香', 1, NULL, '悬世尘埃', 'xiaoyouxiang@163.com', '浙江省', '杭州市', '大专', '福建师范大学', NULL, NULL, 2);
INSERT INTO `user` VALUES (12, '15788875236', '4QrcOUm6Wau+VuBX8g+IPg==', '严经纶', 0, NULL, '冰封夕阳', 'yanjinlun@163.com', '浙江省', '杭州市', '本科', '广州中医药大学', NULL, NULL, 6);
INSERT INTO `user` VALUES (13, '18766635865', '4QrcOUm6Wau+VuBX8g+IPg==', '邓和豫', 1, NULL, '隐水酣龙', 'dengheyu@163.com', '浙江省', '杭州市', '本科', '哈尔滨工程大学', NULL, NULL, 1);
INSERT INTO `user` VALUES (14, '15623527861', '4QrcOUm6Wau+VuBX8g+IPg==', '邓雪风', 0, NULL, '一顿小皮锤', 'dengxuefeng@163.com', '江苏省', '南京市', '本科', '暨南大学', NULL, NULL, 4);
INSERT INTO `user` VALUES (17, '15726928003', '4QrcOUm6Wau+VuBX8g+IPg==', '龟龟', 0, NULL, '龟龟', 'guigui@163.com', '广东省', '中山市', '本科', '华东理工大学', NULL, NULL, 0);
INSERT INTO `user` VALUES (21, '13957336750', '4QrcOUm6Wau+VuBX8g+IPg==', '木木', 0, NULL, '木木', 'mumu@163.com', '湖北省', '武汉市', '本科', '天津科技大学', NULL, NULL, 0);
INSERT INTO `user` VALUES (24, '17863954768', '4QrcOUm6Wau+VuBX8g+IPg==', '轩', 0, 1997, '轩', 'xuan@163.com', '山东省', '青岛市', '本科', '青岛科技大学', 2019, '软件工程', 2);
INSERT INTO `user` VALUES (25, '17812345687', '4QrcOUm6Wau+VuBX8g+IPg==', '青柠', 0, 1997, '青柠', 'babycoder@foxmail.com', '浙江省', '杭州市', '本科', '青岛科技大学', 2019, '软件', 1);
INSERT INTO `user` VALUES (29, '15724564983', 'C6944Nyt1RJfu2rlBRSz5w==', 'user00', 0, 1986, 'user00', 'user00', '河北省', '', '大专', '', 1987, '', 3);
INSERT INTO `user` VALUES (30, '15293175408', '4QrcOUm6Wau+VuBX8g+IPg==', 'user01', 0, 0, 'user01', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0);
INSERT INTO `user` VALUES (31, '13099255092', '4QrcOUm6Wau+VuBX8g+IPg==', 'test', 0, 0, 'test', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
