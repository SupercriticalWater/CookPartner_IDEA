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

 Date: 16/07/2024 15:56:01
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `adminid` bigint NOT NULL AUTO_INCREMENT COMMENT '管理员编号',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '管理员用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '密码',
  PRIMARY KEY (`adminid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', '123456');

-- ----------------------------
-- Table structure for food
-- ----------------------------
DROP TABLE IF EXISTS `food`;
CREATE TABLE `food`  (
  `f_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜品编号',
  `f_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '菜品名称',
  `f_pic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜品图片',
  `f_th_pic` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '缩略图',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `f_category` int NULL DEFAULT NULL COMMENT '菜品类别',
  `f_description` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '暂无简介' COMMENT '菜品简介',
  `num_make` bigint NULL DEFAULT 0 COMMENT '制作用户数',
  `num_like` bigint NULL DEFAULT 0 COMMENT '收藏用户数',
  `f_score` int NULL DEFAULT 0 COMMENT '菜品积分',
  `f_recommend` tinyint NULL DEFAULT 0 COMMENT '是否推荐',
  `material` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '食材(JSON数组）',
  `steps` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '制作步骤（JSON数组）',
  PRIMARY KEY (`f_id`) USING BTREE,
  INDEX `f_category`(`f_category`) USING BTREE,
  CONSTRAINT `tpye` FOREIGN KEY (`f_category`) REFERENCES `type` (`tid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of food
-- ----------------------------
INSERT INTO `food` VALUES (1, '蒜香莲藕虾', '/files/1-1.jpg', '/files/1-2.jpg', '2024-01-01 20:00:00', 1, '虾:护肝、增强免疫力、延缓衰老\n酱油:补血、护齿、保护骨骼\n白糖:低蛋白质', 30, 28, 100, 1, '[{\"name\":\"虾“, \"value\":\"400g\"}, {\"name\":\"蒜\",\"value\":\"5g\"}]', NULL);
INSERT INTO `food` VALUES (2, '青椒炒香干', '/files/2-1.jpg', '/files/2-2.jpg', '2023-03-15 21:11:04', 2, '青椒:增强免疫力、抗氧化、抗癌防癌\r\n胡椒粉:补血、护齿、保护骨骼\r\n白糖:低蛋白质', 20, 31, 90, 1, '[{\"name\":\"香干“, \"value\":\"200g\"}, {\"name\":\"青椒\",\"value\":\"8g\"}]', NULL);
INSERT INTO `food` VALUES (3, '皮蛋拌豆腐', '/files/3-1.jpg', '/files/3-2.jpg', '2022-06-16 21:13:29', 5, '姜:降逆止呕、化痰止咳、散寒解表\r\n香菜:透疹\r\n醋:补血、低蛋白质', 100, 102, 80, 0, NULL, NULL);
INSERT INTO `food` VALUES (4, '年年有余馒头\r\n年年有余馒头\r\n年年有余馒头\r\n年年有余馒头\r\n年年有余馒头', '/files/4-1.jpg', '/files/4-2.jpg', '2024-05-08 21:21:22', 9, '暂无简介', 894, 893, 101, 1, NULL, NULL);
INSERT INTO `food` VALUES (5, '炸茼蒿丸子', '/files/5-1.jpg', '/files/5-2.jpg', '2024-06-04 21:18:42', 4, '茼蒿:安神', 101, 100, 100, 0, NULL, NULL);
INSERT INTO `food` VALUES (6, '咖喱虾', '/files/6-1.jpg', '/files/6-2.jpg', '2024-06-25 21:12:05', 1, '来自新加坡的风味', 15, 10, 60, 0, NULL, NULL);

-- ----------------------------
-- Table structure for food_like
-- ----------------------------
DROP TABLE IF EXISTS `food_like`;
CREATE TABLE `food_like`  (
  `l_id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `u_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户号',
  `f_id` bigint NOT NULL COMMENT '菜品编号',
  `l_time` timestamp NULL DEFAULT NULL COMMENT '关注时间',
  PRIMARY KEY (`l_id`) USING BTREE,
  INDEX `f_id`(`f_id`) USING BTREE,
  INDEX `uid`(`u_id`) USING BTREE,
  CONSTRAINT `fid` FOREIGN KEY (`f_id`) REFERENCES `food` (`f_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `uid` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of food_like
-- ----------------------------
INSERT INTO `food_like` VALUES (1, 'test', 1, '2024-06-19 23:06:41');
INSERT INTO `food_like` VALUES (2, 'test', 2, '2024-06-24 23:07:31');
INSERT INTO `food_like` VALUES (12, 'test1', 3, '2024-06-26 02:17:56');
INSERT INTO `food_like` VALUES (14, 'test1', 4, '2024-06-26 15:58:02');

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
  `m_recommendation` float(255, 0) NOT NULL DEFAULT 0 COMMENT '推荐程度',
  `m_create_time` timestamp NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`m_id`) USING BTREE,
  INDEX `u_id`(`u_id`) USING BTREE,
  INDEX `f_id`(`f_id`) USING BTREE,
  CONSTRAINT `moment_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `moment_ibfk_2` FOREIGN KEY (`f_id`) REFERENCES `food` (`f_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of moment
-- ----------------------------
INSERT INTO `moment` VALUES (1, 'test', 1, '好吃', 16, 100, 5, '2024-01-25 21:06:19');

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type`  (
  `tid` int NOT NULL AUTO_INCREMENT COMMENT '类别编号',
  `tname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '类别名称',
  PRIMARY KEY (`tid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES (1, '家常菜');
INSERT INTO `type` VALUES (2, '素菜');
INSERT INTO `type` VALUES (3, '荤菜');
INSERT INTO `type` VALUES (4, '炒菜');
INSERT INTO `type` VALUES (5, '凉菜');
INSERT INTO `type` VALUES (6, '西餐');
INSERT INTO `type` VALUES (7, '日料');
INSERT INTO `type` VALUES (8, '甜品');
INSERT INTO `type` VALUES (9, '酒水');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `u_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户号',
  `u_pwd` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户密码（仅安卓端使用）',
  `u_url` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '头像',
  `u_nickname` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '未命名用户' COMMENT '昵称',
  `u_gender` int NULL DEFAULT 2 COMMENT '性别',
  `u_hobby` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '未设置' COMMENT '偏好',
  `u_score` int NULL DEFAULT 0 COMMENT '积分',
  `u_level` int NULL DEFAULT 1 COMMENT '等级',
  `u_signature` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '无' COMMENT '个性签名',
  PRIMARY KEY (`u_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('test', 'test', 'avatarhh', 'Alina', 2, '未设置', 0, 1, '无');
INSERT INTO `user` VALUES ('test1', 'test1', 'avatar', 'Water', 2, '未设置', 0, 1, '无');
INSERT INTO `user` VALUES ('test1111111', 'testandroid', 'avatar_android', 'WaterAn', 2, '未设置', 0, 1, '无');
INSERT INTO `user` VALUES ('testsign111', 'testsignpwd', NULL, '未命名用户', 2, '未设置', 0, 1, '无');
INSERT INTO `user` VALUES ('wechat', NULL, NULL, '未命名用户', 2, '未设置', 0, 1, '无');

-- ----------------------------
-- Table structure for user_food
-- ----------------------------
DROP TABLE IF EXISTS `user_food`;
CREATE TABLE `user_food`  (
  `m_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `u_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户号',
  `f_id` bigint NOT NULL COMMENT '菜品编号',
  `u_maketime` datetime NOT NULL COMMENT '制作时间',
  PRIMARY KEY (`m_id`) USING BTREE,
  INDEX `f_id`(`f_id`) USING BTREE,
  INDEX `uid1`(`u_id`) USING BTREE,
  CONSTRAINT `fid1` FOREIGN KEY (`f_id`) REFERENCES `food` (`f_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `uid1` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_food
-- ----------------------------
INSERT INTO `user_food` VALUES (1, 'test', 1, '2024-01-26 21:04:38');
INSERT INTO `user_food` VALUES (2, 'test1111111', 3, '2024-06-05 21:15:42');
INSERT INTO `user_food` VALUES (3, 'test', 4, '2024-07-16 15:13:49');
INSERT INTO `user_food` VALUES (5, 'test', 5, '2024-07-16 15:34:28');

-- ----------------------------
-- Triggers structure for table food_like
-- ----------------------------
DROP TRIGGER IF EXISTS `check_unique_u_id_f_id`;
delimiter ;;
CREATE TRIGGER `check_unique_u_id_f_id` BEFORE INSERT ON `food_like` FOR EACH ROW BEGIN
    DECLARE existing_count INT;
    SELECT COUNT(*) INTO existing_count
    FROM food_like
    WHERE u_id = NEW.u_id AND f_id = NEW.f_id;
    
    IF existing_count > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Duplicate u_id and f_id combination not allowed';
    END IF;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
