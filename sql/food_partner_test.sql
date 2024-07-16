/*
 Navicat Premium Data Transfer

 Source Server         : c_mysql
 Source Server Type    : MySQL
 Source Server Version : 80037
 Source Host           : localhost:3306
 Source Schema         : food_partner

 Target Server Type    : MySQL
 Target Server Version : 80037
 File Encoding         : 65001

 Date: 23/06/2024 21:42:09
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
  INDEX `f_category`(`f_category` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of food
-- ----------------------------
INSERT INTO `food` VALUES (1, '蒜香莲藕虾', '../recipepic/1-1.webp', '../recipepic/1-2.webp', '2024-01-01 20:00:00', '家常菜', '虾:护肝、增强免疫力、延缓衰老\n酱油:补血、护齿、保护骨骼\n白糖:低蛋白质', 30, 28, 100, 1);
INSERT INTO `food` VALUES (19, '青椒炒香干', '../recipepic/19-1.webp', '../recipepic/19-2.webp', '2023-03-15 21:11:04', '素菜', '青椒:增强免疫力、抗氧化、抗癌防癌\r\n胡椒粉:补血、护齿、保护骨骼\r\n白糖:低蛋白质', 20, 30, 90, 1);
INSERT INTO `food` VALUES (37, '皮蛋拌豆腐', '../recipepic/37-1.webp', '../recipepic/37-2.webp', '2022-06-16 21:13:29', '凉菜', '姜:降逆止呕、化痰止咳、散寒解表\r\n香菜:透疹\r\n醋:补血、低蛋白质', 100, 100, 80, 0);
INSERT INTO `food` VALUES (211, '年年有余馒头\r\n年年有余馒头\r\n年年有余馒头\r\n年年有余馒头\r\n年年有余馒头', '../recipepic/211-1.webp', '../recipepic/211-2.webp', '2024-05-08 21:21:22', '酒水', '暂无简介', 1920, 891, 101, 1);
INSERT INTO `food` VALUES (229, '炸茼蒿丸子', '../recipepic/229-1.webp', '../recipepic/229-2.webp', '2024-06-04 21:18:42', '丸子', '茼蒿:安神', 1000, 100, 100, 0);

-- ----------------------------
-- Table structure for food_like
-- ----------------------------
DROP TABLE IF EXISTS `food_like`;
CREATE TABLE `food_like`  (
  `u_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户号',
  `f_id` bigint NOT NULL COMMENT '菜品编号',
  `l_time` timestamp NOT NULL COMMENT '关注时间',
  PRIMARY KEY (`u_id`, `f_id`) USING BTREE,
  INDEX `f_id`(`f_id` ASC) USING BTREE,
  CONSTRAINT `food_like_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `food_like_ibfk_2` FOREIGN KEY (`f_id`) REFERENCES `food` (`f_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of food_like
-- ----------------------------
INSERT INTO `food_like` VALUES ('test', 1, '2024-01-02 20:58:19');
INSERT INTO `food_like` VALUES ('test1', 19, '2024-04-09 21:16:49');

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
  INDEX `u_id`(`u_id` ASC) USING BTREE,
  INDEX `f_id`(`f_id` ASC) USING BTREE,
  CONSTRAINT `moment_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `moment_ibfk_2` FOREIGN KEY (`f_id`) REFERENCES `food` (`f_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of moment
-- ----------------------------
INSERT INTO `moment` VALUES (1, 'test', 1, '好吃', 16, 100, 5, '2024-01-25 21:06:19');
INSERT INTO `moment` VALUES (2, 'test1111111', 37, '难吃。', 100, 13600, 98, '2024-06-29 21:16:26');

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
  INDEX `f_id`(`f_id` ASC) USING BTREE,
  INDEX `f_category`(`f_category` ASC) USING BTREE,
  CONSTRAINT `user_food_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_food_ibfk_2` FOREIGN KEY (`f_id`) REFERENCES `food` (`f_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_food_ibfk_3` FOREIGN KEY (`f_category`) REFERENCES `food` (`f_category`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_food
-- ----------------------------
INSERT INTO `user_food` VALUES ('test', 1, '家常菜', '2024-01-26 21:04:38');
INSERT INTO `user_food` VALUES ('test1111111', 37, '凉菜', '2024-06-05 21:15:42');

SET FOREIGN_KEY_CHECKS = 1;
