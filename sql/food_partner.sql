/*
 Navicat Premium Data Transfer

 Source Server         : mySQL
 Source Server Type    : MySQL
 Source Server Version : 80200
 Source Host           : localhost:3306
 Source Schema         : food_partner

 Target Server Type    : MySQL
 Target Server Version : 80200
 File Encoding         : 65001

 Date: 23/06/2024 17:39:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for food
-- ----------------------------
DROP TABLE IF EXISTS `food`;
CREATE TABLE `food`  (
  `f_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜品编号',
  `f_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜品名称',
  `f_pic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜品图片',
  `f_th_pic` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '缩略图',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `f_category` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜品类别',
  `f_description` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '暂无简介' COMMENT '菜品简介',
  `num_make` bigint NOT NULL COMMENT '制作用户数',
  `num_like` bigint NOT NULL COMMENT '收藏用户数',
  `f_score` int NOT NULL COMMENT '菜品积分',
  `f_recommend` tinyint NOT NULL COMMENT '是否推荐',
  PRIMARY KEY (`f_id`) USING BTREE,
  INDEX `f_category`(`f_category`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of food
-- ----------------------------

-- ----------------------------
-- Table structure for food_like
-- ----------------------------
DROP TABLE IF EXISTS `food_like`;
CREATE TABLE `food_like`  (
  `u_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户号',
  `f_id` bigint NOT NULL COMMENT '菜品编号',
  `l_time` timestamp NOT NULL COMMENT '关注时间',
  PRIMARY KEY (`u_id`, `f_id`) USING BTREE,
  INDEX `f_id`(`f_id`) USING BTREE,
  CONSTRAINT `food_like_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `food_like_ibfk_2` FOREIGN KEY (`f_id`) REFERENCES `food` (`f_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of food_like
-- ----------------------------

-- ----------------------------
-- Table structure for moment
-- ----------------------------
DROP TABLE IF EXISTS `moment`;
CREATE TABLE `moment`  (
  `m_id` int NOT NULL AUTO_INCREMENT COMMENT '评论号',
  `u_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户号',
  `f_id` bigint NOT NULL COMMENT '菜品编号',
  `m_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '评论内容',
  `m_like_num` int NOT NULL DEFAULT 0 COMMENT '点赞数',
  `m_browse_num` int NOT NULL DEFAULT 0 COMMENT '浏览次数',
  `m_recommendation` float(255, 0) NOT NULL COMMENT '推荐程度',
  `m_create_time` timestamp NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`m_id`) USING BTREE,
  INDEX `u_id`(`u_id`) USING BTREE,
  INDEX `f_id`(`f_id`) USING BTREE,
  CONSTRAINT `moment_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `moment_ibfk_2` FOREIGN KEY (`f_id`) REFERENCES `food` (`f_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of moment
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `u_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户号',
  `u_pwd` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户密码（仅安卓端使用）',
  `u_url` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '头像',
  `u_nickname` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '未命名用户' COMMENT '昵称',
  `u_gender` int NOT NULL DEFAULT 2 COMMENT '性别',
  `u_hobby` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '未设置' COMMENT '偏好',
  `u_score` int NOT NULL DEFAULT 0 COMMENT '积分',
  `u_level` int NOT NULL DEFAULT 1 COMMENT '等级',
  `u_signature` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '无' COMMENT '个性签名',
  PRIMARY KEY (`u_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('test', 'test', 'avatarhh', 'Alina', 2, '未设置', 0, 1, '无');
INSERT INTO `user` VALUES ('test1', 'test1', 'avatar', 'Water', 2, '未设置', 0, 1, '无');
INSERT INTO `user` VALUES ('test1111111', 'testandroid', 'avatar_android', 'WaterAn', 2, '未设置', 0, 1, '无');
INSERT INTO `user` VALUES ('testsign111', 'testsignpwd', NULL, '未命名用户', 2, '未设置', 0, 1, '无');

-- ----------------------------
-- Table structure for user_food
-- ----------------------------
DROP TABLE IF EXISTS `user_food`;
CREATE TABLE `user_food`  (
  `u_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户号',
  `f_id` bigint NOT NULL COMMENT '菜品编号',
  `f_category` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜品类别',
  `u_maketime` datetime NOT NULL COMMENT '制作时间',
  PRIMARY KEY (`u_id`, `f_id`) USING BTREE,
  INDEX `f_id`(`f_id`) USING BTREE,
  INDEX `f_category`(`f_category`) USING BTREE,
  CONSTRAINT `user_food_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_food_ibfk_2` FOREIGN KEY (`f_id`) REFERENCES `food` (`f_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_food_ibfk_3` FOREIGN KEY (`f_category`) REFERENCES `food` (`f_category`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_food
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
