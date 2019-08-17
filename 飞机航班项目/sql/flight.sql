/*
 Navicat MySQL Data Transfer

 Source Server         : connection01
 Source Server Type    : MySQL
 Source Server Version : 50727
 Source Host           : localhost:3306
 Source Schema         : flight

 Target Server Type    : MySQL
 Target Server Version : 50727
 File Encoding         : 65001

 Date: 17/08/2019 21:49:39
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for airport
-- ----------------------------
DROP TABLE IF EXISTS `airport`;
CREATE TABLE `airport`  (
  `airport_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '机场编号',
  `airport_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机场名称',
  `airport_address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机场所在地',
  PRIMARY KEY (`airport_id`) USING BTREE,
  UNIQUE INDEX `airport_name`(`airport_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of airport
-- ----------------------------
INSERT INTO `airport` VALUES (1, '浦东国际机场T1', '上海');
INSERT INTO `airport` VALUES (2, '虹桥国际机场T2\r\n', '上海');
INSERT INTO `airport` VALUES (3, '天河国际机场T3', '武汉');
INSERT INTO `airport` VALUES (4, '首都国际机场T2', '北京');
INSERT INTO `airport` VALUES (5, '南苑机场', '北京');

-- ----------------------------
-- Table structure for plane
-- ----------------------------
DROP TABLE IF EXISTS `plane`;
CREATE TABLE `plane`  (
  `plane_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '飞机ID',
  `plane_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '飞机名称',
  `plane_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '飞机类型',
  PRIMARY KEY (`plane_id`) USING BTREE,
  UNIQUE INDEX `plane_name`(`plane_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of plane
-- ----------------------------
INSERT INTO `plane` VALUES (1, '东方航空MU5269', '波音737(中型)');
INSERT INTO `plane` VALUES (3, '东方航空MU2544', '波音737(中型)');
INSERT INTO `plane` VALUES (4, '上海航空FM9363', '波音737(中型)');
INSERT INTO `plane` VALUES (5, '南方航空CZ6171', '波音738(中型)');
INSERT INTO `plane` VALUES (6, '南方航空CZ6197', '波音738(中型)');
INSERT INTO `plane` VALUES (7, '东方航空MU5270', '空客319(中型)');
INSERT INTO `plane` VALUES (8, '中国国航CA155', '空客738(中型)');
INSERT INTO `plane` VALUES (9, '中国国航CA1557', '全新空客 A350-900');

-- ----------------------------
-- Table structure for shuttle
-- ----------------------------
DROP TABLE IF EXISTS `shuttle`;
CREATE TABLE `shuttle`  (
  `shuttle_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '航班编号',
  `plane_id` int(11) NULL DEFAULT NULL COMMENT '飞机编号',
  `startairport_id` int(11) NULL DEFAULT NULL COMMENT '起飞机场编号',
  `stopairport_id` int(11) NULL DEFAULT NULL COMMENT '降落机场编号',
  `time` int(11) NULL DEFAULT NULL COMMENT '飞行时长',
  `price` double(8, 2) NULL DEFAULT NULL COMMENT '价格',
  PRIMARY KEY (`shuttle_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shuttle
-- ----------------------------
INSERT INTO `shuttle` VALUES (1, 1, 1, 3, 120, 500.00);
INSERT INTO `shuttle` VALUES (2, 7, 4, 7, 120, 1000.00);
INSERT INTO `shuttle` VALUES (3, 9, 5, 1, 180, 1200.00);
INSERT INTO `shuttle` VALUES (4, 3, 3, 1, 180, 1200.00);
INSERT INTO `shuttle` VALUES (5, 4, 3, 1, 180, 1200.00);
INSERT INTO `shuttle` VALUES (6, 5, 3, 1, 180, 1200.00);

SET FOREIGN_KEY_CHECKS = 1;
