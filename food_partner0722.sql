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

 Date: 22/07/2024 16:32:29
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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

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
  `material` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '食材JSON',
  `steps` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '步骤JSON',
  PRIMARY KEY (`f_id`) USING BTREE,
  INDEX `f_category`(`f_category`) USING BTREE,
  CONSTRAINT `tpye` FOREIGN KEY (`f_category`) REFERENCES `type` (`tid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 229 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of food
-- ----------------------------
INSERT INTO `food` VALUES (1, '蒜香莲藕虾', '/files/1-1.jpg', '/files/1-1.jpg', '2024-06-26 12:23:00', 1, '健康功效虾:补肾壮阳酱油:活血化瘀白糖:活血化瘀', 92750, 112236, 97, 1, '[{\"name\":\"莲藕“,”value\":\"1根\"},{\"name\":\"虾“,”value\":\"8个\"},{\"name\":\"蒜“,”value\":\"5瓣\"}]', '[{\"img\":\"https://s4.cdn.jiaonizuocai.com/caipu/201905/2717/271738545410.jpg/MjUwX2MyOjEvM15yYjI6MS84XzE4MA.webp“,”text\":\"准备好食材\"},{\"img\":\"https://s4.cdn.jiaonizuocai.com/caipu/201905/2717/27173855591.jpg/MjUwX2MyOjEvM15yYjI6MS84XzE4MA.webp“,”text\":\"将莲藕削皮切成片，放于盘中\"},{\"img\":\"https://s4.cdn.jiaonizuocai.com/caipu/201905/2717/271738555307.jpg/MjUwX2MyOjEvM15yYjI6MS84XzE4MA.webp“,”text\":\"锅中倒入适量水，将莲藕放于蒸格中，水开后，转小火\"}]');
INSERT INTO `food` VALUES (2, '小炒金钱肚', '/files/2-1.jpg', '/files/2-1.jpg', '2024-06-26 12:23:00', 1, '健康功效青椒:下气胡萝卜:活血化瘀洋葱:润肠', 154540, 228481, 87, 1, NULL, NULL);
INSERT INTO `food` VALUES (3, '手抓牛肉', '/files/3-1.jpg', '/files/3-1.jpg', '2024-06-26 12:23:00', 1, '健康功效牛肉:补脾胃、强筋骨、益气血胡萝卜:活血化瘀豆角:活血化瘀', 84518, 89653, 62, 1, NULL, NULL);
INSERT INTO `food` VALUES (4, '茯苓姬松茸排骨汤', '/files/4-1.jpg', '/files/4-1.jpg', '2024-06-26 12:23:00', 1, '健康功效莲子:止泻百合:活血化瘀茯苓:活血化瘀', 100154, 177489, 78, 1, NULL, NULL);
INSERT INTO `food` VALUES (5, '凉拌娃娃菜', '/files/5-1.jpg', '/files/5-1.jpg', '2024-06-26 12:23:00', 1, '健康功效娃娃菜:养胃', 38744, 42566, 76, 1, NULL, NULL);
INSERT INTO `food` VALUES (6, '枸杞菠菜', '/files/6-1.jpg', '/files/6-1.jpg', '2024-06-26 12:23:00', 1, '健康功效菠菜:养血', 20475, 59546, 96, 1, NULL, NULL);
INSERT INTO `food` VALUES (7, '苹果燕麦小米粥', '/files/7-1.jpg', '/files/7-1.jpg', '2024-06-26 12:23:00', 1, '健康功效苹果:养胃燕麦片:增强免疫力小米:清热', 125804, 243833, 65, 1, NULL, NULL);
INSERT INTO `food` VALUES (8, '梅菜扣肉', '/files/8-1.jpg', '/files/8-1.jpg', '2024-06-26 12:23:00', 1, '健康功效五花肉:养血姜:降逆止呕、化痰止咳、散寒解表料酒:活血化瘀', 23052, 27122, 60, 0, NULL, NULL);
INSERT INTO `food` VALUES (9, '平菇豆腐', '/files/9-1.jpg', '/files/9-1.jpg', '2024-06-26 12:23:00', 1, '健康功效豆腐:解毒平菇:活血化瘀酱油:活血化瘀', 39246, 24527, 86, 1, NULL, NULL);
INSERT INTO `food` VALUES (10, '胡萝卜里脊肉丁', '/files/10-1.jpg', '/files/10-1.jpg', '2024-06-26 12:23:00', 1, '健康功效胡萝卜:活血化瘀', 20319, 50784, 90, 1, NULL, NULL);
INSERT INTO `food` VALUES (11, '青菜香菇包子', '/files/11-1.jpg', '/files/11-1.jpg', '2024-06-26 12:23:00', 1, '健康功效香菇:活血化瘀', 27806, 43158, 61, 1, NULL, NULL);
INSERT INTO `food` VALUES (12, '西红柿鸡蛋手擀面', '/files/12-1.jpg', '/files/12-1.jpg', '2024-06-26 12:23:00', 1, '健康功效鸡蛋:养血西红柿:活血化瘀胡椒粉:补血、护齿、保护骨骼', 17195, 14592, 56, 0, NULL, NULL);
INSERT INTO `food` VALUES (13, '木耳拌花菜', '/files/13-1.jpg', '/files/13-1.jpg', '2024-06-26 12:23:00', 1, '暂无简介', 156286, 228786, 95, 1, NULL, NULL);
INSERT INTO `food` VALUES (14, '五指毛桃鸡汤', '/files/14-1.jpg', '/files/14-1.jpg', '2024-06-26 12:23:00', 1, '健康功效五指毛桃:健脾', 23893, 59430, 54, 0, NULL, NULL);
INSERT INTO `food` VALUES (15, '宫保鸡丁（粤菜版）', '/files/15-1.jpg', '/files/15-1.jpg', '2024-06-26 12:23:00', 1, '健康功效白糖:活血化瘀', 23241, 36102, 90, 1, NULL, NULL);
INSERT INTO `food` VALUES (16, '清炒四季豆', '/files/16-1.jpg', '/files/16-1.jpg', '2024-06-26 12:23:00', 1, '健康功效四季豆:活血化瘀', 262549, 363253, 87, 1, NULL, NULL);
INSERT INTO `food` VALUES (17, '蛤蜊炒芹菜', '/files/17-1.jpg', '/files/17-1.jpg', '2024-06-26 12:23:00', 1, '健康功效蛤蜊:利水芹菜:活血化瘀姜:降逆止呕、化痰止咳、散寒解表', 107282, 245899, 72, 1, NULL, NULL);
INSERT INTO `food` VALUES (18, '酱黄瓜', '/files/18-1.jpg', '/files/18-1.jpg', '2024-06-26 12:23:00', 1, '健康功效黄瓜:利水白糖:活血化瘀八角:理气、止痛、散寒', 124443, 116484, 75, 1, NULL, NULL);
INSERT INTO `food` VALUES (19, '青椒炒香干', '/files/19-1.jpg', '/files/19-1.jpg', '2024-06-26 12:23:00', 2, '健康功效青椒:下气胡椒粉:补血、护齿、保护骨骼白糖:活血化瘀', 1095509, 1535321, 82, 1, NULL, NULL);
INSERT INTO `food` VALUES (20, '凉拌黄豆芽', '/files/20-1.jpg', '/files/20-1.jpg', '2024-06-26 12:23:00', 2, '健康功效黄豆芽:清热利湿香菜:活血化瘀醋:活血化瘀', 1897539, 1951402, 81, 1, NULL, NULL);
INSERT INTO `food` VALUES (21, '虎皮青椒', '/files/21-1.jpg', '/files/21-1.jpg', '2024-06-26 12:23:00', 2, '健康功效青椒:下气醋:活血化瘀', 10044770, 10485152, 62, 1, NULL, NULL);
INSERT INTO `food` VALUES (22, '番茄炒西兰花', '/files/22-1.jpg', '/files/22-1.jpg', '2024-06-26 12:23:00', 2, '健康功效西红柿:活血化瘀西兰花:活血化瘀姜:降逆止呕、化痰止咳、散寒解表', 5278529, 5608475, 57, 0, NULL, NULL);
INSERT INTO `food` VALUES (23, '清炒茭白', '/files/23-1.jpg', '/files/23-1.jpg', '2024-06-26 12:23:00', 2, '健康功效茭白:利水', 2135768, 2686718, 73, 1, NULL, NULL);
INSERT INTO `food` VALUES (24, '红豆薏米水', '/files/24-1.jpg', '/files/24-1.jpg', '2024-06-26 12:23:00', 2, '健康功效薏米:清热红豆:活血绿豆:利水', 645255, 997029, 64, 1, NULL, NULL);
INSERT INTO `food` VALUES (25, '清炒山药西兰花', '/files/25-1.jpg', '/files/25-1.jpg', '2024-06-26 12:23:00', 2, '健康功效山药:活血化瘀姜:降逆止呕、化痰止咳、散寒解表红椒:开胃、消食', 1237831, 1956055, 63, 1, NULL, NULL);
INSERT INTO `food` VALUES (26, '泡菜饼', '/files/26-1.jpg', '/files/26-1.jpg', '2024-06-26 12:23:00', 2, '暂无简介', 409161, 513845, 97, 1, NULL, NULL);
INSERT INTO `food` VALUES (27, '莴笋炒鸡蛋', '/files/27-1.jpg', '/files/27-1.jpg', '2024-06-26 12:23:00', 2, '健康功效莴笋:利尿鸡蛋:养血红椒:开胃、消食', 996710, 1088445, 100, 1, NULL, NULL);
INSERT INTO `food` VALUES (28, '葱油爽脆南瓜', '/files/28-1.jpg', '/files/28-1.jpg', '2024-06-26 12:23:00', 2, '健康功效南瓜:活血化瘀', 555913, 685477, 71, 1, NULL, NULL);
INSERT INTO `food` VALUES (29, '番茄菜花', '/files/29-1.jpg', '/files/29-1.jpg', '2024-06-26 12:23:00', 2, '健康功效西红柿:活血化瘀姜:降逆止呕、化痰止咳、散寒解表料酒:活血化瘀', 4517325, 5004554, 62, 1, NULL, NULL);
INSERT INTO `food` VALUES (30, '番茄豆腐', '/files/30-1.jpg', '/files/30-1.jpg', '2024-06-26 12:23:00', 2, '健康功效豆腐:解毒', 1518558, 1753436, 69, 1, NULL, NULL);
INSERT INTO `food` VALUES (31, '荷塘小炒', '/files/31-1.jpg', '/files/31-1.jpg', '2024-06-26 12:23:00', 2, '健康功效荷兰豆:利水藕:养血、养胃胡萝卜:活血化瘀', 1073267, 1235888, 63, 1, NULL, NULL);
INSERT INTO `food` VALUES (32, '韭菜鸡蛋', '/files/32-1.jpg', '/files/32-1.jpg', '2024-06-26 12:23:00', 2, '健康功效鸡蛋:养血韭菜:活血化瘀虾皮:补肾壮阳', 774467, 951619, 70, 1, NULL, NULL);
INSERT INTO `food` VALUES (33, '酸辣土豆丝', '/files/33-1.jpg', '/files/33-1.jpg', '2024-06-26 12:23:00', 2, '健康功效土豆:活血化瘀青椒:下气红椒:开胃、消食', 20635274, 39968000, 54, 0, NULL, NULL);
INSERT INTO `food` VALUES (34, '红烧茄子', '/files/34-1.jpg', '/files/34-1.jpg', '2024-06-26 12:23:00', 2, '健康功效茄子:活血化瘀青椒:下气西红柿:活血化瘀', 34555813, 42130630, 75, 1, NULL, NULL);
INSERT INTO `food` VALUES (35, '丝瓜炒蛋', '/files/35-1.jpg', '/files/35-1.jpg', '2024-06-26 12:23:00', 2, '健康功效丝瓜:活血化瘀鸡蛋:养血花生油:延缓衰老、抗氧化、抗癌防癌', 1258625, 1190489, 79, 1, NULL, NULL);
INSERT INTO `food` VALUES (36, '地三鲜', '/files/36-1.jpg', '/files/36-1.jpg', '2024-06-26 12:23:00', 2, '健康功效土豆:活血化瘀茄子:活血化瘀青椒:下气', 3530624, 3632600, 54, 0, NULL, NULL);
INSERT INTO `food` VALUES (37, '皮蛋拌豆腐', '/files/37-1.jpg', '/files/37-1.jpg', '2024-06-26 12:23:00', 3, '健康功效白糖:活血化瘀胡椒粉:补血、护齿、保护骨骼', 5272791, 5279150, 60, 0, NULL, NULL);
INSERT INTO `food` VALUES (38, '凉拌海带丝', '/files/38-1.jpg', '/files/38-1.jpg', '2024-06-26 12:23:00', 3, '健康功效香菜:活血化瘀', 7653655, 10201966, 94, 1, NULL, NULL);
INSERT INTO `food` VALUES (39, '凉拌芹菜', '/files/39-1.jpg', '/files/39-1.jpg', '2024-06-26 12:23:00', 3, '健康功效芹菜:活血化瘀胡萝卜:活血化瘀木耳:养血', 2507683, 2308680, 54, 0, NULL, NULL);
INSERT INTO `food` VALUES (40, '凉拌黄豆芽', '/files/40-1.jpg', '/files/40-1.jpg', '2024-06-26 12:23:00', 3, '健康功效黄豆芽:清热利湿香菜:活血化瘀醋:活血化瘀', 1897537, 1154579, 58, 0, NULL, NULL);
INSERT INTO `food` VALUES (41, '凉拌藕片', '/files/41-1.jpg', '/files/41-1.jpg', '2024-06-26 12:23:00', 3, '健康功效藕:养血、养胃花椒:除湿', 3229630, 3838818, 70, 1, NULL, NULL);
INSERT INTO `food` VALUES (42, '玫瑰山药', '/files/42-1.jpg', '/files/42-1.jpg', '2024-06-26 12:23:00', 3, '健康功效白糖:活血化瘀', 519105, 595025, 78, 1, NULL, NULL);
INSERT INTO `food` VALUES (43, '凉拌黑木耳', '/files/43-1.jpg', '/files/43-1.jpg', '2024-06-26 12:23:00', 3, '健康功效香菜:活血化瘀', 1886637, 1850007, 54, 0, NULL, NULL);
INSERT INTO `food` VALUES (44, '生椒凉拌黑木耳', '/files/44-1.jpg', '/files/44-1.jpg', '2024-06-26 12:23:00', 3, '健康功效胡萝卜:活血化瘀', 809406, 1215193, 89, 1, NULL, NULL);
INSERT INTO `food` VALUES (45, '凉拌豆角', '/files/45-1.jpg', '/files/45-1.jpg', '2024-06-26 12:23:00', 3, '暂无简介', 3480830, 3990114, 90, 1, NULL, NULL);
INSERT INTO `food` VALUES (46, '秘制老醋花生', '/files/46-1.jpg', '/files/46-1.jpg', '2024-06-26 12:23:00', 3, '健康功效白糖:活血化瘀', 995148, 1116423, 72, 1, NULL, NULL);
INSERT INTO `food` VALUES (47, '蒜泥白肉', '/files/47-1.jpg', '/files/47-1.jpg', '2024-06-26 12:23:00', 3, '健康功效五花肉:养血大葱:活血化瘀', 2155391, 2337115, 79, 1, NULL, NULL);
INSERT INTO `food` VALUES (48, '东北大拌菜', '/files/48-1.jpg', '/files/48-1.jpg', '2024-06-26 12:23:00', 3, '暂无简介', 1280886, 1605600, 77, 1, NULL, NULL);
INSERT INTO `food` VALUES (49, '凉拌鸡爪', '/files/49-1.jpg', '/files/49-1.jpg', '2024-06-26 12:23:00', 3, '健康功效酱油:活血化瘀芝麻油:延缓衰老、抗氧化、抗癌防癌八角:理气、止痛、散寒', 1576174, 1434830, 92, 1, NULL, NULL);
INSERT INTO `food` VALUES (50, '凉拌海蜇', '/files/50-1.jpg', '/files/50-1.jpg', '2024-06-26 12:23:00', 3, '健康功效海蜇头:护肝、增强免疫力、延缓衰老胡萝卜:活血化瘀白萝卜:下气', 1917538, 2649835, 91, 1, NULL, NULL);
INSERT INTO `food` VALUES (51, '凉拌木耳', '/files/51-1.jpg', '/files/51-1.jpg', '2024-06-26 12:23:00', 3, '健康功效木耳:养血洋葱:润肠香菜:活血化瘀', 8786003, 10966413, 67, 1, NULL, NULL);
INSERT INTO `food` VALUES (52, '麻辣腌黄瓜', '/files/52-1.jpg', '/files/52-1.jpg', '2024-06-26 12:23:00', 3, '健康功效黄瓜:利水花椒:除湿', 408918, 476288, 87, 1, NULL, NULL);
INSERT INTO `food` VALUES (53, '白灼虾', '/files/53-1.jpg', '/files/53-1.jpg', '2024-06-26 12:23:00', 3, '健康功效虾:补肾壮阳花椒:除湿', 1755971, 1007601, 62, 1, NULL, NULL);
INSERT INTO `food` VALUES (54, '香辣牛肉', '/files/54-1.jpg', '/files/54-1.jpg', '2024-06-26 12:23:00', 4, '健康功效牛肉:补脾胃、强筋骨、益气血姜:降逆止呕、化痰止咳、散寒解表花生油:延缓衰老、抗氧化、抗癌防癌', 1638864, 1470200, 53, 0, NULL, NULL);
INSERT INTO `food` VALUES (55, '麻婆豆腐', '/files/55-1.jpg', '/files/55-1.jpg', '2024-06-26 12:23:00', 4, '健康功效牛肉:补脾胃、强筋骨、益气血', 22294429, 29855104, 99, 1, NULL, NULL);
INSERT INTO `food` VALUES (56, '宫保鸡丁', '/files/56-1.jpg', '/files/56-1.jpg', '2024-06-26 12:23:00', 4, '健康功效鸡蛋:养血姜:降逆止呕、化痰止咳、散寒解表料酒:活血化瘀', 21220583, 36872660, 97, 1, NULL, NULL);
INSERT INTO `food` VALUES (57, '土豆炖排骨', '/files/57-1.jpg', '/files/57-1.jpg', '2024-06-26 12:23:00', 4, '健康功效土豆:活血化瘀排骨:养血白糖:活血化瘀', 10920048, 13896850, 89, 1, NULL, NULL);
INSERT INTO `food` VALUES (58, '虎皮青椒', '/files/58-1.jpg', '/files/58-1.jpg', '2024-06-26 12:23:00', 4, '健康功效青椒:下气醋:活血化瘀', 10044770, 14678733, 70, 1, NULL, NULL);
INSERT INTO `food` VALUES (59, '菠萝咕噜肉', '/files/59-1.jpg', '/files/59-1.jpg', '2024-06-26 12:23:00', 4, '健康功效猪里脊肉:养血鸡蛋:养血醋:活血化瘀', 4496402, 4708037, 64, 1, NULL, NULL);
INSERT INTO `food` VALUES (60, '秘制红焖羊肉', '/files/60-1.jpg', '/files/60-1.jpg', '2024-06-26 12:23:00', 4, '健康功效姜:降逆止呕、化痰止咳、散寒解表香菜:活血化瘀料酒:活血化瘀', 2575526, 3855577, 98, 1, NULL, NULL);
INSERT INTO `food` VALUES (61, '蒜苔炒腊肉', '/files/61-1.jpg', '/files/61-1.jpg', '2024-06-26 12:23:00', 4, '健康功效蒜苗:活血化瘀腊肉:保护神经系统姜:降逆止呕、化痰止咳、散寒解表', 3788781, 4554849, 68, 1, NULL, NULL);
INSERT INTO `food` VALUES (62, '红烧鱼块', '/files/62-1.jpg', '/files/62-1.jpg', '2024-06-26 12:23:00', 4, '健康功效草鱼:平肝熄风、和胃、温中五花肉:养血冬笋:消痰', 10502583, 10822879, 73, 1, NULL, NULL);
INSERT INTO `food` VALUES (63, '青椒炒肉丝', '/files/63-1.jpg', '/files/63-1.jpg', '2024-06-26 12:23:00', 4, '健康功效胡萝卜:活血化瘀青椒:下气料酒:活血化瘀', 1195807, 1021763, 71, 1, NULL, NULL);
INSERT INTO `food` VALUES (64, '回锅肉', '/files/64-1.jpg', '/files/64-1.jpg', '2024-06-26 12:23:00', 4, '健康功效五花肉:养血蒜苗:活血化瘀白糖:活血化瘀', 9405285, 12822105, 58, 0, NULL, NULL);
INSERT INTO `food` VALUES (65, '西芹百合炒腰果', '/files/65-1.jpg', '/files/65-1.jpg', '2024-06-26 12:23:00', 4, '健康功效腰果:除烦西芹:活血化瘀', 436934, 323588, 66, 1, NULL, NULL);
INSERT INTO `food` VALUES (66, '麻辣鱼', '/files/66-1.jpg', '/files/66-1.jpg', '2024-06-26 12:23:00', 4, '健康功效草鱼:平肝熄风、和胃、温中花椒:除湿白糖:活血化瘀', 3236436, 3439091, 75, 1, NULL, NULL);
INSERT INTO `food` VALUES (67, '水煮牛肉', '/files/67-1.jpg', '/files/67-1.jpg', '2024-06-26 12:23:00', 4, '健康功效蒜苗:活血化瘀', 4892836, 5928821, 93, 1, NULL, NULL);
INSERT INTO `food` VALUES (68, '可乐排骨', '/files/68-1.jpg', '/files/68-1.jpg', '2024-06-26 12:23:00', 4, '健康功效排骨:养血酱油:活血化瘀', 3046987, 3432740, 74, 1, NULL, NULL);
INSERT INTO `food` VALUES (69, '蚝油生菜', '/files/69-1.jpg', '/files/69-1.jpg', '2024-06-26 12:23:00', 4, '健康功效红椒:开胃、消食', 1686094, 1235087, 72, 1, NULL, NULL);
INSERT INTO `food` VALUES (70, '白切鸡', '/files/70-1.jpg', '/files/70-1.jpg', '2024-06-26 12:23:00', 4, '健康功效姜:降逆止呕、化痰止咳、散寒解表', 5531217, 7951348, 67, 1, NULL, NULL);
INSERT INTO `food` VALUES (71, '豆角焖面', '/files/71-1.jpg', '/files/71-1.jpg', '2024-06-26 12:23:00', 5, '健康功效扁豆:活血化瘀姜:降逆止呕、化痰止咳、散寒解表五花肉:养血', 9861262, 13471897, 62, 1, NULL, NULL);
INSERT INTO `food` VALUES (72, '葱油饼', '/files/72-1.jpg', '/files/72-1.jpg', '2024-06-26 12:23:00', 5, '暂无简介', 4310884, 4069126, 61, 1, NULL, NULL);
INSERT INTO `food` VALUES (73, '油泼面', '/files/73-1.jpg', '/files/73-1.jpg', '2024-06-26 12:23:00', 5, '健康功效香菜:活血化瘀姜:降逆止呕、化痰止咳、散寒解表', 10868587, 16154362, 94, 1, NULL, NULL);
INSERT INTO `food` VALUES (74, '韭菜盒子', '/files/74-1.jpg', '/files/74-1.jpg', '2024-06-26 12:23:00', 5, '健康功效韭菜:活血化瘀鸡蛋:养血虾皮:补肾壮阳', 2115228, 2706296, 77, 1, NULL, NULL);
INSERT INTO `food` VALUES (75, '阳春面', '/files/75-1.jpg', '/files/75-1.jpg', '2024-06-26 12:23:00', 5, '健康功效猪油:延缓衰老、抗氧化、抗癌防癌', 963419, 1490220, 76, 1, NULL, NULL);
INSERT INTO `food` VALUES (76, '海鲜意大利面', '/files/76-1.jpg', '/files/76-1.jpg', '2024-06-26 12:23:00', 5, '健康功效洋葱:润肠虾:补肾壮阳', 1933431, 2920026, 85, 1, NULL, NULL);
INSERT INTO `food` VALUES (77, '南瓜馒头', '/files/77-1.jpg', '/files/77-1.jpg', '2024-06-26 12:23:00', 5, '健康功效南瓜:活血化瘀', 1735241, 1176692, 89, 1, NULL, NULL);
INSERT INTO `food` VALUES (78, '旺仔小馒头', '/files/78-1.jpg', '/files/78-1.jpg', '2024-06-26 12:23:00', 5, '健康功效鸡蛋:养血', 701208, 954086, 93, 1, NULL, NULL);
INSERT INTO `food` VALUES (79, '红糖馒头', '/files/79-1.jpg', '/files/79-1.jpg', '2024-06-26 12:23:00', 5, '暂无简介', 2359726, 2240090, 100, 1, NULL, NULL);
INSERT INTO `food` VALUES (80, '牛奶刀切馒头', '/files/80-1.jpg', '/files/80-1.jpg', '2024-06-26 12:23:00', 5, '暂无简介', 409354, 330685, 77, 1, NULL, NULL);
INSERT INTO `food` VALUES (81, '豆渣馒头', '/files/81-1.jpg', '/files/81-1.jpg', '2024-06-26 12:23:00', 5, '健康功效鸡蛋:养血', 338433, 514254, 64, 1, NULL, NULL);
INSERT INTO `food` VALUES (82, '紫薯开花馒头', '/files/82-1.jpg', '/files/82-1.jpg', '2024-06-26 12:23:00', 5, '健康功效紫薯:补脾、益气', 644380, 609857, 96, 1, NULL, NULL);
INSERT INTO `food` VALUES (83, '白面馒头', '/files/83-1.jpg', '/files/83-1.jpg', '2024-06-26 12:23:00', 5, '暂无简介', 343377, 471030, 75, 1, NULL, NULL);
INSERT INTO `food` VALUES (84, '油条', '/files/84-1.jpg', '/files/84-1.jpg', '2024-06-26 12:23:00', 5, '暂无简介', 3984495, 4593847, 68, 1, NULL, NULL);
INSERT INTO `food` VALUES (85, '炸酱面', '/files/85-1.jpg', '/files/85-1.jpg', '2024-06-26 12:23:00', 5, '健康功效芹菜:活血化瘀黄瓜:利水胡萝卜:活血化瘀', 12283635, 15104075, 62, 1, NULL, NULL);
INSERT INTO `food` VALUES (86, '杂粮馒头', '/files/86-1.jpg', '/files/86-1.jpg', '2024-06-26 12:23:00', 5, '健康功效白糖:活血化瘀', 264527, 150648, 74, 1, NULL, NULL);
INSERT INTO `food` VALUES (87, '玫瑰花馒头', '/files/87-1.jpg', '/files/87-1.jpg', '2024-06-26 12:23:00', 5, '健康功效枸杞子:活血化瘀', 291223, 160135, 90, 1, NULL, NULL);
INSERT INTO `food` VALUES (88, '红烧牛肉面', '/files/88-1.jpg', '/files/88-1.jpg', '2024-06-26 12:23:00', 5, '健康功效牛肉:补脾胃、强筋骨、益气血白萝卜:下气冰糖:健脾', 632358, 992288, 69, 1, NULL, NULL);
INSERT INTO `food` VALUES (89, '蛋白薄脆饼干', '/files/89-1.jpg', '/files/89-1.jpg', '2024-06-26 12:23:00', 6, '暂无简介', 260430, 296739, 74, 1, NULL, NULL);
INSERT INTO `food` VALUES (90, '冻草莓', '/files/90-1.jpg', '/files/90-1.jpg', '2024-06-26 12:23:00', 6, '健康功效草莓:止咳白糖:活血化瘀', 367710, 404880, 63, 1, NULL, NULL);
INSERT INTO `food` VALUES (91, '自制菠萝罐头', '/files/91-1.jpg', '/files/91-1.jpg', '2024-06-26 12:23:00', 6, '健康功效菠萝:利水', 237266, 120829, 79, 1, NULL, NULL);
INSERT INTO `food` VALUES (92, '自制美味薯条', '/files/92-1.jpg', '/files/92-1.jpg', '2024-06-26 12:23:00', 6, '健康功效土豆:活血化瘀', 92101, 115543, 64, 1, NULL, NULL);
INSERT INTO `food` VALUES (93, '砂糖饼干', '/files/93-1.jpg', '/files/93-1.jpg', '2024-06-26 12:23:00', 6, '健康功效黄油:活血化瘀', 82161, 129091, 75, 1, NULL, NULL);
INSERT INTO `food` VALUES (94, '咖啡杏仁饼干', '/files/94-1.jpg', '/files/94-1.jpg', '2024-06-26 12:23:00', 6, '健康功效黄油:活血化瘀', 134214, 115683, 79, 1, NULL, NULL);
INSERT INTO `food` VALUES (95, '香酥小蛋卷', '/files/95-1.jpg', '/files/95-1.jpg', '2024-06-26 12:23:00', 6, '健康功效鸡蛋:养血黄油:活血化瘀', 102182, 101335, 69, 1, NULL, NULL);
INSERT INTO `food` VALUES (96, '巧克力夹心饼干', '/files/96-1.jpg', '/files/96-1.jpg', '2024-06-26 12:23:00', 6, '健康功效黄油:活血化瘀巧克力:活血化瘀', 52691, 69660, 80, 1, NULL, NULL);
INSERT INTO `food` VALUES (97, '蝴蝶饼干', '/files/97-1.jpg', '/files/97-1.jpg', '2024-06-26 12:23:00', 6, '健康功效黄油:活血化瘀', 34992, 29874, 88, 1, NULL, NULL);
INSERT INTO `food` VALUES (98, '草莓罐头', '/files/98-1.jpg', '/files/98-1.jpg', '2024-06-26 12:23:00', 6, '健康功效草莓:止咳冰糖:健脾', 381109, 558846, 60, 0, NULL, NULL);
INSERT INTO `food` VALUES (99, '蛋白饼干', '/files/99-1.jpg', '/files/99-1.jpg', '2024-06-26 12:23:00', 6, '暂无简介', 140081, 106020, 81, 1, NULL, NULL);
INSERT INTO `food` VALUES (100, '锅巴', '/files/100-1.jpg', '/files/100-1.jpg', '2024-06-26 12:23:00', 6, '健康功效糯米:养胃', 300577, 304290, 99, 1, NULL, NULL);
INSERT INTO `food` VALUES (101, '糖渍橙皮小饼干', '/files/101-1.jpg', '/files/101-1.jpg', '2024-06-26 12:23:00', 6, '健康功效黄油:活血化瘀', 140273, 287359, 80, 1, NULL, NULL);
INSERT INTO `food` VALUES (102, '五香瓜子', '/files/102-1.jpg', '/files/102-1.jpg', '2024-06-26 12:23:00', 6, '健康功效草果:祛痰', 292886, 336414, 63, 1, NULL, NULL);
INSERT INTO `food` VALUES (103, '酥饼干', '/files/103-1.jpg', '/files/103-1.jpg', '2024-06-26 12:23:00', 6, '健康功效黄油:活血化瘀', 85014, 98439, 62, 1, NULL, NULL);
INSERT INTO `food` VALUES (104, '娃娃饼干', '/files/104-1.jpg', '/files/104-1.jpg', '2024-06-26 12:23:00', 6, '健康功效黄油:活血化瘀鸡蛋:养血', 57765, 73280, 73, 1, NULL, NULL);
INSERT INTO `food` VALUES (105, '双色饼干', '/files/105-1.jpg', '/files/105-1.jpg', '2024-06-26 12:23:00', 6, '健康功效巧克力:活血化瘀', 39719, 56499, 61, 1, NULL, NULL);
INSERT INTO `food` VALUES (106, '红枣葡萄干味原味（沙琪玛）家庭版自制小吃', '/files/106-1.jpg', '/files/106-1.jpg', '2024-06-26 12:23:00', 6, '暂无简介', 12649, 11170, 59, 0, NULL, NULL);
INSERT INTO `food` VALUES (107, '超级鲜美的鸡汤豆腐串 最后连烧烤和鸡汤都有了', '/files/107-1.jpg', '/files/107-1.jpg', '2024-06-26 12:23:00', 7, '暂无简介', 22716, 40596, 72, 1, NULL, NULL);
INSERT INTO `food` VALUES (108, '鲍鱼鸡汤', '/files/108-1.jpg', '/files/108-1.jpg', '2024-06-26 12:23:00', 7, '健康功效鲍鱼:清热', 60809, 52683, 90, 1, NULL, NULL);
INSERT INTO `food` VALUES (109, '番茄鱼片汤', '/files/109-1.jpg', '/files/109-1.jpg', '2024-06-26 12:23:00', 7, '健康功效胡椒粉:补血、护齿、保护骨骼', 17689, 14668, 83, 1, NULL, NULL);
INSERT INTO `food` VALUES (110, '木瓜银耳羹', '/files/110-1.jpg', '/files/110-1.jpg', '2024-06-26 12:23:00', 7, '健康功效木瓜:活血化瘀银耳:养胃红枣:利尿', 13255, 19865, 52, 0, NULL, NULL);
INSERT INTO `food` VALUES (111, '超嫩鸡蛋羹 挑食的宝宝也爱吃', '/files/111-1.jpg', '/files/111-1.jpg', '2024-06-26 12:23:00', 7, '健康功效鸡蛋:养血', 17022, 19472, 94, 1, NULL, NULL);
INSERT INTO `food` VALUES (112, '酸辣草鱼汤', '/files/112-1.jpg', '/files/112-1.jpg', '2024-06-26 12:23:00', 7, '健康功效草鱼:平肝熄风、和胃、温中花生油:延缓衰老、抗氧化、抗癌防癌', 21173, 56366, 62, 1, NULL, NULL);
INSERT INTO `food` VALUES (113, '惊蛰蛋', '/files/113-1.jpg', '/files/113-1.jpg', '2024-06-26 12:23:00', 7, '健康功效鸡蛋:养血红枣:利尿葡萄干:活血化瘀', 13806, 19997, 65, 1, NULL, NULL);
INSERT INTO `food` VALUES (114, '牛奶桃胶银耳羹', '/files/114-1.jpg', '/files/114-1.jpg', '2024-06-26 12:23:00', 7, '健康功效银耳:养胃冰糖:健脾', 13349, 10127, 75, 1, NULL, NULL);
INSERT INTO `food` VALUES (115, '正宗俄式罗宋汤', '/files/115-1.jpg', '/files/115-1.jpg', '2024-06-26 12:23:00', 7, '健康功效西红柿:活血化瘀土豆:活血化瘀洋葱:润肠', 22886, 41503, 76, 1, NULL, NULL);
INSERT INTO `food` VALUES (116, '辣鲫鱼汤', '/files/116-1.jpg', '/files/116-1.jpg', '2024-06-26 12:23:00', 7, '健康功效青椒:下气', 15866, 19077, 91, 1, NULL, NULL);
INSERT INTO `food` VALUES (117, '西红柿蟹菇汤', '/files/117-1.jpg', '/files/117-1.jpg', '2024-06-26 12:23:00', 7, '健康功效西红柿:活血化瘀', 13233, 20684, 77, 1, NULL, NULL);
INSERT INTO `food` VALUES (118, '芒果西米露', '/files/118-1.jpg', '/files/118-1.jpg', '2024-06-26 12:23:00', 7, '健康功效芒果:利尿', 12729, 24871, 65, 1, NULL, NULL);
INSERT INTO `food` VALUES (119, '农家黄花菜粉汤', '/files/119-1.jpg', '/files/119-1.jpg', '2024-06-26 12:23:00', 7, '健康功效黄花菜:活血化瘀豆腐:解毒胡椒粉:补血、护齿、保护骨骼', 14641, 17832, 60, 0, NULL, NULL);
INSERT INTO `food` VALUES (120, '花椰菜洋葱浓汤', '/files/120-1.jpg', '/files/120-1.jpg', '2024-06-26 12:23:00', 7, '健康功效洋葱:润肠黄油:活血化瘀', 14241, 11055, 69, 1, NULL, NULL);
INSERT INTO `food` VALUES (121, '宝宝做噩梦清热汤', '/files/121-1.jpg', '/files/121-1.jpg', '2024-06-26 12:23:00', 7, '暂无简介', 11701, 12083, 72, 1, NULL, NULL);
INSERT INTO `food` VALUES (122, '杨枝甘露热饮做法(小兔奔跑8培训)', '/files/122-1.jpg', '/files/122-1.jpg', '2024-06-26 12:23:00', 8, '暂无简介', 11761, 10110, 81, 1, NULL, NULL);
INSERT INTO `food` VALUES (123, '防疫8l罗汉果雪梨蜂蜜水', '/files/123-1.jpg', '/files/123-1.jpg', '2024-06-26 12:23:00', 8, '健康功效陈皮:延缓衰老、抗氧化、抗癌防癌枸杞子:活血化瘀蜂蜜:润肤', 7587, 8193, 91, 1, NULL, NULL);
INSERT INTO `food` VALUES (124, '鹿角巷同款小鹿出抹的做法(小兔奔跑8培训)', '/files/124-1.jpg', '/files/124-1.jpg', '2024-06-26 12:23:00', 8, '暂无简介', 7150, 10403, 89, 1, NULL, NULL);
INSERT INTO `food` VALUES (125, '柠檬脆波波的做法(小兔奔跑8培训)', '/files/125-1.jpg', '/files/125-1.jpg', '2024-06-26 12:23:00', 8, '暂无简介', 7888, 9016, 92, 1, NULL, NULL);
INSERT INTO `food` VALUES (126, '喜茶同款｜橙香草莓果茶', '/files/126-1.jpg', '/files/126-1.jpg', '2024-06-26 12:23:00', 8, '健康功效草莓:止咳', 15311, 13752, 65, 1, NULL, NULL);
INSERT INTO `food` VALUES (127, 'coco同款奶茶三兄弟的做法(小兔奔跑8培训)', '/files/127-1.jpg', '/files/127-1.jpg', '2024-06-26 12:23:00', 8, '暂无简介', 6131, 8783, 68, 1, NULL, NULL);
INSERT INTO `food` VALUES (128, '珍珠奶茶（家庭版）', '/files/128-1.jpg', '/files/128-1.jpg', '2024-06-26 12:23:00', 8, '健康功效红茶:护肝、增强免疫力、延缓衰老白糖:活血化瘀', 7293, 8412, 72, 1, NULL, NULL);
INSERT INTO `food` VALUES (129, '蜂蜜百香果', '/files/129-1.jpg', '/files/129-1.jpg', '2024-06-26 12:23:00', 8, '健康功效百香果:活血化瘀', 8462, 9724, 100, 1, NULL, NULL);
INSERT INTO `food` VALUES (130, '喜茶同款奶茶波波双拼的做法(小兔奔跑8培训)', '/files/130-1.jpg', '/files/130-1.jpg', '2024-06-26 12:23:00', 8, '暂无简介', 5645, 7053, 67, 0, NULL, NULL);
INSERT INTO `food` VALUES (131, '燕麦核桃浆', '/files/131-1.jpg', '/files/131-1.jpg', '2024-06-26 12:23:00', 8, '健康功效核桃:平喘、润肠燕麦:止血冰糖:健脾', 6570, 8283, 78, 1, NULL, NULL);
INSERT INTO `food` VALUES (132, '自制芋圆', '/files/132-1.jpg', '/files/132-1.jpg', '2024-06-26 12:23:00', 8, '健康功效红薯:补中益气、宽肠通便、易产气', 6345, 6180, 89, 1, NULL, NULL);
INSERT INTO `food` VALUES (133, '喜茶同款满杯红柚的做法(小兔奔跑8培训)', '/files/133-1.jpg', '/files/133-1.jpg', '2024-06-26 12:23:00', 8, '暂无简介', 6094, 7769, 92, 1, NULL, NULL);
INSERT INTO `food` VALUES (134, '家庭版奶酪棒', '/files/134-1.jpg', '/files/134-1.jpg', '2024-06-26 12:23:00', 8, '暂无简介', 118898, 190945, 61, 1, NULL, NULL);
INSERT INTO `food` VALUES (135, '红颜火龙果的做法(小兔奔跑8培训)', '/files/135-1.jpg', '/files/135-1.jpg', '2024-06-26 12:23:00', 8, '暂无简介', 5098, 6924, 65, 0, NULL, NULL);
INSERT INTO `food` VALUES (136, 'coco同款百香果双响炮', '/files/136-1.jpg', '/files/136-1.jpg', '2024-06-26 12:23:00', 8, '暂无简介', 13926, 11368, 97, 1, NULL, NULL);
INSERT INTO `food` VALUES (137, '防疫新品青桔柠檬哆哆', '/files/137-1.jpg', '/files/137-1.jpg', '2024-06-26 12:23:00', 8, '暂无简介', 5605, 6146, 69, 0, NULL, NULL);
INSERT INTO `food` VALUES (138, '鹿角巷同款黑糖鹿丸鲜奶的做法(小兔奔跑8培训)', '/files/138-1.jpg', '/files/138-1.jpg', '2024-06-26 12:23:00', 8, '暂无简介', 5733, 8635, 73, 0, NULL, NULL);
INSERT INTO `food` VALUES (139, '喜茶同款多肉葡萄的做法(小兔奔跑8培训)', '/files/139-1.jpg', '/files/139-1.jpg', '2024-06-26 12:23:00', 8, '暂无简介', 16016, 24860, 74, 1, NULL, NULL);
INSERT INTO `food` VALUES (140, '五花肉炖土豆', '/files/140-1.jpg', '/files/140-1.jpg', '2024-06-26 12:23:00', 9, '健康功效五花肉:养血土豆:活血化瘀', 339452, 351517, 72, 1, NULL, NULL);
INSERT INTO `food` VALUES (141, '盐水虾', '/files/141-1.jpg', '/files/141-1.jpg', '2024-06-26 12:23:00', 9, '健康功效姜:降逆止呕、化痰止咳、散寒解表芥末:化痰开窍、开窍、化痰', 477401, 418720, 68, 1, NULL, NULL);
INSERT INTO `food` VALUES (142, '鱼香杏鲍菇', '/files/142-1.jpg', '/files/142-1.jpg', '2024-06-26 12:23:00', 9, '健康功效杏鲍菇:活血化瘀胡萝卜:活血化瘀青椒:下气', 859718, 1175200, 61, 1, NULL, NULL);
INSERT INTO `food` VALUES (143, '拔丝鸡蛋', '/files/143-1.jpg', '/files/143-1.jpg', '2024-06-26 12:23:00', 9, '健康功效鸡蛋:养血', 1230140, 1202566, 100, 1, NULL, NULL);
INSERT INTO `food` VALUES (144, '西红柿炖牛腩', '/files/144-1.jpg', '/files/144-1.jpg', '2024-06-26 12:23:00', 9, '健康功效西红柿:活血化瘀丁香:活血化瘀料酒:活血化瘀', 1639907, 1078494, 77, 1, NULL, NULL);
INSERT INTO `food` VALUES (145, '山药炒木耳', '/files/145-1.jpg', '/files/145-1.jpg', '2024-06-26 12:23:00', 9, '健康功效山药:活血化瘀木耳:养血胡萝卜:活血化瘀', 787547, 903330, 54, 0, NULL, NULL);
INSERT INTO `food` VALUES (146, '蒜蓉茼蒿', '/files/146-1.jpg', '/files/146-1.jpg', '2024-06-26 12:23:00', 9, '健康功效茼蒿:活血化瘀', 354828, 502128, 63, 1, NULL, NULL);
INSERT INTO `food` VALUES (147, '茄汁大虾', '/files/147-1.jpg', '/files/147-1.jpg', '2024-06-26 12:23:00', 9, '健康功效虾:补肾壮阳姜:降逆止呕、化痰止咳、散寒解表番茄酱:活血化瘀', 513448, 655787, 70, 1, NULL, NULL);
INSERT INTO `food` VALUES (148, '糖醋鱼', '/files/148-1.jpg', '/files/148-1.jpg', '2024-06-26 12:23:00', 9, '健康功效鲤鱼:利水、通乳番茄酱:活血化瘀', 2068748, 2221789, 72, 1, NULL, NULL);
INSERT INTO `food` VALUES (149, '辣子鸡', '/files/149-1.jpg', '/files/149-1.jpg', '2024-06-26 12:23:00', 9, '健康功效姜:降逆止呕、化痰止咳、散寒解表料酒:活血化瘀', 15471507, 16278011, 60, 0, NULL, NULL);
INSERT INTO `food` VALUES (150, '口水鸡', '/files/150-1.jpg', '/files/150-1.jpg', '2024-06-26 12:23:00', 9, '健康功效红椒:开胃、消食黄酒:活血化瘀', 2263676, 2727394, 83, 1, NULL, NULL);
INSERT INTO `food` VALUES (151, '豉油鸡翅', '/files/151-1.jpg', '/files/151-1.jpg', '2024-06-26 12:23:00', 9, '健康功效八角:理气、止痛、散寒', 79723, 113446, 95, 1, NULL, NULL);
INSERT INTO `food` VALUES (152, '蚝油杏鲍菇', '/files/152-1.jpg', '/files/152-1.jpg', '2024-06-26 12:23:00', 9, '健康功效杏鲍菇:活血化瘀鸡蛋:养血青椒:下气', 798771, 720734, 86, 1, NULL, NULL);
INSERT INTO `food` VALUES (153, '啤酒鸡', '/files/153-1.jpg', '/files/153-1.jpg', '2024-06-26 12:23:00', 9, '健康功效八角:理气、止痛、散寒花椒:除湿', 1953578, 2296822, 86, 1, NULL, NULL);
INSERT INTO `food` VALUES (154, '微波炉煮玉米', '/files/154-1.jpg', '/files/154-1.jpg', '2024-06-26 12:23:00', 9, '健康功效玉米:利水', 757532, 737534, 62, 1, NULL, NULL);
INSERT INTO `food` VALUES (155, '洋葱炒鸡蛋', '/files/155-1.jpg', '/files/155-1.jpg', '2024-06-26 12:23:00', 9, '健康功效洋葱:润肠鸡蛋:养血', 333451, 348593, 84, 1, NULL, NULL);
INSERT INTO `food` VALUES (156, '麻辣小龙虾', '/files/156-1.jpg', '/files/156-1.jpg', '2024-06-26 12:23:00', 9, '健康功效小龙虾:延缓衰老、抗氧化、抗癌防癌香菜:活血化瘀', 7319560, 9238363, 91, 1, NULL, NULL);
INSERT INTO `food` VALUES (157, '家常烧带鱼', '/files/157-1.jpg', '/files/157-1.jpg', '2024-06-26 12:23:00', 9, '健康功效带鱼:止血鸡蛋:养血花椒:除湿', 353549, 464502, 79, 1, NULL, NULL);

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
  CONSTRAINT `FID` FOREIGN KEY (`f_id`) REFERENCES `food` (`f_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `uid` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

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

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type`  (
  `tid` int NOT NULL AUTO_INCREMENT COMMENT '类别编号',
  `tname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '类别名称',
  PRIMARY KEY (`tid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES (1, '家常菜');
INSERT INTO `type` VALUES (2, '素菜');
INSERT INTO `type` VALUES (3, '凉菜');
INSERT INTO `type` VALUES (4, '下饭菜');
INSERT INTO `type` VALUES (5, '面食');
INSERT INTO `type` VALUES (6, '零食');
INSERT INTO `type` VALUES (7, '汤羹');
INSERT INTO `type` VALUES (8, '饮品');
INSERT INTO `type` VALUES (9, '热菜');
INSERT INTO `type` VALUES (10, '荤菜');
INSERT INTO `type` VALUES (11, '水产海鲜');
INSERT INTO `type` VALUES (12, '酒水');
INSERT INTO `type` VALUES (13, '丸子');

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
INSERT INTO `user` VALUES ('oPRyI5Rn2sW91BJcUz1cnqEltHJs', NULL, 'http://localhost:8080/img/avatar/oPRyI5Rn2sW91BJcUz1cnqEltHJs1721184277729.jpg', '自由人', 2, '未设置', 0, 1, '无');
INSERT INTO `user` VALUES ('test', 'test', 'http://localhost:8080/img/avatar/clove.jpg', 'Alina', 2, '未设置', 0, 1, '无');
INSERT INTO `user` VALUES ('test1', 'test1', 'http://localhost:8080/img/avatar/c.jpg', 'Water', 2, '未设置', 0, 1, '无');
INSERT INTO `user` VALUES ('test1111111', 'testandroid', 'http://localhost:8080/img/avatar/d.jpg', 'WaterAn', 2, '未设置', 0, 1, '无');
INSERT INTO `user` VALUES ('testsign111', 'testsignpwd', 'http://localhost:8080/img/avatar/a.jpg', '未命名用户', 2, '未设置', 0, 1, '无');
INSERT INTO `user` VALUES ('wechat', NULL, 'http://localhost:8080/img/avatar/b.jpg', '未命名用户', 2, '未设置', 0, 1, '无');

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
  CONSTRAINT `FID1` FOREIGN KEY (`f_id`) REFERENCES `food` (`f_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `uid1` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

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
