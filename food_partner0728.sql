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

 Date: 28/07/2024 19:43:37
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for moment
-- ----------------------------
DROP TABLE IF EXISTS `moment`;
CREATE TABLE `moment`  (
  `m_id` bigint NOT NULL AUTO_INCREMENT COMMENT '评论号',
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
  CONSTRAINT `FID2` FOREIGN KEY (`f_id`) REFERENCES `food` (`f_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `moment_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of moment
-- ----------------------------
INSERT INTO `moment` VALUES (1, 'test', 1, '好吃', 16, 100, 5, '2024-01-25 21:06:19');
INSERT INTO `moment` VALUES (2, 'test', 2, '尝试了一下，很不错哦', 17, 98, 0, '2024-07-24 00:56:23');
INSERT INTO `moment` VALUES (3, 'test1', 1, '还不错，但对我来说有一定难度', 5, 80, 0, '2024-07-16 01:12:05');
INSERT INTO `moment` VALUES (5, 'test1', 4, '还不错', 0, 0, 0, '2024-07-20 16:11:01');

SET FOREIGN_KEY_CHECKS = 1;
