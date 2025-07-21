/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50737
 Source Host           : localhost:3306
 Source Schema         : fieji_shoupiao

 Target Server Type    : MySQL
 Target Server Version : 50737
 File Encoding         : 65001

 Date: 02/12/2023 20:37:07
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dept_inf
-- ----------------------------
DROP TABLE IF EXISTS `dept_inf`;
CREATE TABLE `dept_inf`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dept_inf
-- ----------------------------
INSERT INTO `dept_inf` VALUES (1, '技术部', '技术部');
INSERT INTO `dept_inf` VALUES (2, '运营部', '运营部');
INSERT INTO `dept_inf` VALUES (3, '财务部', '财务部');
INSERT INTO `dept_inf` VALUES (5, '总公办', '总公办');
INSERT INTO `dept_inf` VALUES (6, '市场部', '市场部');
INSERT INTO `dept_inf` VALUES (7, '教学部', '教学部');
INSERT INTO `dept_inf` VALUES (28, '123', '123');
INSERT INTO `dept_inf` VALUES (29, '1', '1');

-- ----------------------------
-- Table structure for document_inf
-- ----------------------------
DROP TABLE IF EXISTS `document_inf`;
CREATE TABLE `document_inf`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `filename` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_date` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of document_inf
-- ----------------------------
INSERT INTO `document_inf` VALUES (1, '2,2', '01.jpg', '11', NULL, NULL);
INSERT INTO `document_inf` VALUES (2, '2,2', '01.jpg', NULL, NULL, NULL);
INSERT INTO `document_inf` VALUES (3, '4', '2.jpg', '4', NULL, NULL);
INSERT INTO `document_inf` VALUES (4, '1', '1.jpg', '1', NULL, NULL);
INSERT INTO `document_inf` VALUES (5, '2', '1.jpg', '2', NULL, NULL);
INSERT INTO `document_inf` VALUES (6, '2', '1.jpg', '2', NULL, NULL);
INSERT INTO `document_inf` VALUES (7, '3', '5.jpg', '3', NULL, NULL);
INSERT INTO `document_inf` VALUES (8, '2', '5.jpg', '2', NULL, NULL);

-- ----------------------------
-- Table structure for employee_inf
-- ----------------------------
DROP TABLE IF EXISTS `employee_inf`;
CREATE TABLE `employee_inf`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_id` int(11) NULL DEFAULT NULL,
  `job_id` int(11) NULL DEFAULT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `card_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `post_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `qq_num` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` int(11) NULL DEFAULT NULL,
  `party` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `birthday` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `race` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `education` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `speciality` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hobby` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_date` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of employee_inf
-- ----------------------------
INSERT INTO `employee_inf` VALUES (1, 1, 8, 'test', '4328011988', '广州天河', '510000', '020-77777777', '13902001111', '36750066', '251425887@qq.com', 0, '党员', '1980-01-01 00:00:00', '满', '本科', '美声', '唱歌', '四大天王', '2016-03-14 11:35:18', '123456');
INSERT INTO `employee_inf` VALUES (2, 3, 1, 'test2', '22623', '43234', '42427424', '42242', '4247242', '42424', '251425887@qq.com', 2, NULL, NULL, NULL, '1', NULL, NULL, NULL, '2016-03-14 11:35:18', '123456');
INSERT INTO `employee_inf` VALUES (3, 1, 2, 'test3', '432801197711251038', '广州', '510000', '020-99999999', '13907351532', '36750064', '36750064@qq.com', 1, '党员', '1977-11-25 00:00:00', '汉', '本科', '计算机', '爬山', '无', '2016-07-14 09:54:52', '123456');
INSERT INTO `employee_inf` VALUES (4, NULL, NULL, 'test4', '2', '7', NULL, NULL, '6', NULL, '5', 3, NULL, NULL, NULL, '4', NULL, NULL, NULL, NULL, '123456');
INSERT INTO `employee_inf` VALUES (5, 1, 1, 'test5', '1', '1', NULL, NULL, '1', NULL, '1', 1, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, '123456');

-- ----------------------------
-- Table structure for feiji
-- ----------------------------
DROP TABLE IF EXISTS `feiji`;
CREATE TABLE `feiji`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fei_ji_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `chu_fa_di` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mu_di_di` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `qi_fei_time` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dao_da_time` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `zuo_wei_total` int(6) NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'UN_PASS',
  `sheng_yu_total` int(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of feiji
-- ----------------------------
INSERT INTO `feiji` VALUES (2, 'aircraft one', 'asd', 'asd', 'asd', 'asd', 312, 'PASS', 311);
INSERT INTO `feiji` VALUES (3, 'aircraft two', 'asd', 'asd', 'asd', 'asd', 123, 'PASS', 122);
INSERT INTO `feiji` VALUES (5, 'aircraft four', 'fsdgdfg', 'dfgdfg', 'dfgdfg', 'fg', 123, 'PASS', 123);
INSERT INTO `feiji` VALUES (10, 'feiji hapi1', 'whe', 'gx', '10:20', '12:20', 180, 'PASS', 179);

-- ----------------------------
-- Table structure for feiji_pass
-- ----------------------------
DROP TABLE IF EXISTS `feiji_pass`;
CREATE TABLE `feiji_pass`  (
  `id` int(11) NOT NULL,
  `feiji_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `chu_fa_di` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mu_di_di` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `qi_fei_time` datetime NULL DEFAULT NULL,
  `dao_da_time` datetime NULL DEFAULT NULL,
  `tou_deng_number` int(11) NULL DEFAULT NULL,
  `tou_deng_price` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `shang_ye_number` int(11) NULL DEFAULT NULL,
  `shang_ye_price` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `jing_ji_price` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `jing_ji_number` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of feiji_pass
-- ----------------------------

-- ----------------------------
-- Table structure for feiji_zuo_wei
-- ----------------------------
DROP TABLE IF EXISTS `feiji_zuo_wei`;
CREATE TABLE `feiji_zuo_wei`  (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `fei_ji_id` int(6) NULL DEFAULT NULL,
  `row` int(6) NULL DEFAULT NULL,
  `col` int(6) NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'UN_BUY',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of feiji_zuo_wei
-- ----------------------------
INSERT INTO `feiji_zuo_wei` VALUES (2, 3, 2, 1, 'TOUDENG', '1', 'BUY');
INSERT INTO `feiji_zuo_wei` VALUES (3, 5, 2, 1, 'SHANGYE', '31', 'UN_BUY');
INSERT INTO `feiji_zuo_wei` VALUES (4, 5, 1, 3, 'TOUDENG', '31', 'UN_BUY');
INSERT INTO `feiji_zuo_wei` VALUES (5, 2, 1, 2, 'TOUDENG', '10', 'BUY');
INSERT INTO `feiji_zuo_wei` VALUES (6, 2, 1, 2, 'TOUDENG', '10', 'UN_BUY');
INSERT INTO `feiji_zuo_wei` VALUES (14, 10, 1, 2, 'TOUDENG', '100', 'BUY');
INSERT INTO `feiji_zuo_wei` VALUES (15, 10, 1, 3, 'SHANGYE', '90', 'UN_BUY');
INSERT INTO `feiji_zuo_wei` VALUES (16, 10, 1, 1, 'JINGJI', '70', 'UN_BUY');

-- ----------------------------
-- Table structure for job_inf
-- ----------------------------
DROP TABLE IF EXISTS `job_inf`;
CREATE TABLE `job_inf`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of job_inf
-- ----------------------------
INSERT INTO `job_inf` VALUES (1, '职员1', '职员');
INSERT INTO `job_inf` VALUES (2, 'Java开发工程师', 'Java开发工程师');
INSERT INTO `job_inf` VALUES (3, 'Java中级开发工程师', 'Java中级开发工程师');
INSERT INTO `job_inf` VALUES (4, 'Java高级开发工程师', 'Java高级开发工程师');
INSERT INTO `job_inf` VALUES (6, '架构师', '架构师');
INSERT INTO `job_inf` VALUES (7, '主管', '主管');
INSERT INTO `job_inf` VALUES (8, '经理', '经理');
INSERT INTO `job_inf` VALUES (9, '总经理', '总经理');
INSERT INTO `job_inf` VALUES (10, '2', '2');
INSERT INTO `job_inf` VALUES (11, '1', '2,3,4,5,6,7');

-- ----------------------------
-- Table structure for notice_inf
-- ----------------------------
DROP TABLE IF EXISTS `notice_inf`;
CREATE TABLE `notice_inf`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `create_date` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notice_inf
-- ----------------------------
INSERT INTO `notice_inf` VALUES (1, '1112', '132323', NULL, NULL);
INSERT INTO `notice_inf` VALUES (2, '444', '4444', NULL, NULL);

-- ----------------------------
-- Table structure for user_inf
-- ----------------------------
DROP TABLE IF EXISTS `user_inf`;
CREATE TABLE `user_inf`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loginname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `createdate` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_inf
-- ----------------------------
INSERT INTO `user_inf` VALUES (1, 'admin', '123456', 2, '2016-03-12 09:34:28', '超级管理员1', '1272473330@qq.com', '1');
INSERT INTO `user_inf` VALUES (2, 'root', '123', 2, NULL, 'root', '2838214663@qq.com', '1');
INSERT INTO `user_inf` VALUES (6, 'test', 'test', 2, NULL, 'test', '2838214663@qq.com', '3');
INSERT INTO `user_inf` VALUES (7, 'adminuser', 'adminuser', 2, NULL, 'adminuser', NULL, '3');

SET FOREIGN_KEY_CHECKS = 1;
