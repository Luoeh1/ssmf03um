/*
 Navicat Premium Dump SQL

 Source Server         : 47.92.38.125（（8）
 Source Server Type    : MySQL
 Source Server Version : 80023 (8.0.23)
 Source Host           : 47.92.38.125:3307
 Source Schema         : ssmf03um

 Target Server Type    : MySQL
 Target Server Version : 80023 (8.0.23)
 File Encoding         : 65001

 Date: 08/04/2026 12:23:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for config
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '配置文件' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of config
-- ----------------------------
INSERT INTO `config` VALUES (1, 'picture1', 'upload/picture1.jpg');
INSERT INTO `config` VALUES (2, 'picture2', 'upload/1775493178337.jpg');
INSERT INTO `config` VALUES (3, 'picture3', 'upload/picture3.jpg');

-- ----------------------------
-- Table structure for dianzibingli
-- ----------------------------
DROP TABLE IF EXISTS `dianzibingli`;
CREATE TABLE `dianzibingli`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `binglibianhao` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '病例编号',
  `bingqingxiangshu` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '病情详述',
  `jianchazhenduan` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '检查诊断',
  `zhengzhuang` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '症状',
  `zhidingshijian` date NULL DEFAULT NULL COMMENT '制定时间',
  `yishenggonghao` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '医生工号',
  `yishengxingming` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '医生姓名',
  `yonghuzhanghao` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户账号',
  `yonghuxingming` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户姓名',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `binglibianhao`(`binglibianhao` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1773237969976 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '电子病例' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of dianzibingli
-- ----------------------------
INSERT INTO `dianzibingli` VALUES (101, '2022-03-16 20:18:45', '1111111111', '出去玩摔了，手一直很疼。', '骨折', '手部发力剧烈疼痛', '2022-03-16', '医生工号1', '医生姓名1', '1', '落病人');
INSERT INTO `dianzibingli` VALUES (102, '2022-03-16 20:18:45', '2222222222', '病情详述2', '检查诊断2', '症状2', '2022-03-16', '医生工号2', '医生姓名2', '用户账号2', '用户姓名2');
INSERT INTO `dianzibingli` VALUES (103, '2022-03-16 20:18:45', '3333333333', '病情详述3', '检查诊断3', '症状3', '2022-03-16', '医生工号3', '医生姓名3', '用户账号3', '用户姓名3');
INSERT INTO `dianzibingli` VALUES (104, '2022-03-16 20:18:45', '4444444444', '病情详述4', '检查诊断4', '症状4', '2022-03-16', '医生工号4', '医生姓名4', '用户账号4', '用户姓名4');
INSERT INTO `dianzibingli` VALUES (105, '2022-03-16 20:18:45', '5555555555', '病情详述5', '检查诊断5', '症状5', '2022-03-16', '医生工号5', '医生姓名5', '用户账号5', '用户姓名5');
INSERT INTO `dianzibingli` VALUES (106, '2022-03-16 20:18:45', '6666666666', '病情详述6', '检查诊断6', '症状6', '2022-03-16', '医生工号6', '医生姓名6', '用户账号6', '用户姓名6');
INSERT INTO `dianzibingli` VALUES (1773237969975, '2026-03-11 22:06:09', '1773237941919', '很健康', '没病', '症状好', '2026-03-11', '4', '超声波医生', '1', '落病人');

-- ----------------------------
-- Table structure for jianchabaogao
-- ----------------------------
DROP TABLE IF EXISTS `jianchabaogao`;
CREATE TABLE `jianchabaogao`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `baogaobianhao` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报告编号',
  `xiangmumingcheng` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目名称',
  `xiangmufenlei` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目分类',
  `zhenduanjieguo` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '诊断结果',
  `zhenduanshijian` date NULL DEFAULT NULL COMMENT '诊断时间',
  `yishenggonghao` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '医生工号',
  `yishengxingming` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '医生姓名',
  `yonghuzhanghao` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户账号',
  `yonghuxingming` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户姓名',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `baogaobianhao`(`baogaobianhao` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1773237900420 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '检查报告' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jianchabaogao
-- ----------------------------
INSERT INTO `jianchabaogao` VALUES (71, '2022-03-16 20:18:45', '1111111111', '血常规', '血检', '正常', '2022-03-16', '1', '医生姓名1', '1', '落病人');
INSERT INTO `jianchabaogao` VALUES (72, '2022-03-16 20:18:45', '2222222222', '项目名称2', '项目分类2', '诊断结果2', '2022-03-16', '医生工号2', '医生姓名2', '用户账号2', '用户姓名2');
INSERT INTO `jianchabaogao` VALUES (73, '2022-03-16 20:18:45', '3333333333', '项目名称3', '项目分类3', '诊断结果3', '2022-03-16', '医生工号3', '医生姓名3', '用户账号3', '用户姓名3');
INSERT INTO `jianchabaogao` VALUES (74, '2022-03-16 20:18:45', '4444444444', '项目名称4', '项目分类4', '诊断结果4', '2022-03-16', '医生工号4', '医生姓名4', '用户账号4', '用户姓名4');
INSERT INTO `jianchabaogao` VALUES (75, '2022-03-16 20:18:45', '5555555555', '项目名称5', '项目分类5', '诊断结果5', '2022-03-16', '医生工号5', '医生姓名5', '用户账号5', '用户姓名5');
INSERT INTO `jianchabaogao` VALUES (76, '2022-03-16 20:18:45', '6666666666', '项目名称6', '项目分类6', '诊断结果6', '2022-03-16', '医生工号6', '医生姓名6', '用户账号6', '用户姓名6');
INSERT INTO `jianchabaogao` VALUES (1772824014428, '2026-03-07 03:06:53', '1772824002676', '项目名称1', '项目分类1', '', '2026-03-07', '1', '医生1', '1', '');
INSERT INTO `jianchabaogao` VALUES (1773237900419, '2026-03-11 22:05:00', '1773237889949', '彩色多音勒超声检查类', '彩色多音勒超声检查类', '很健康', '2026-03-11', '4', '超声波医生', '1', '落病人');

-- ----------------------------
-- Table structure for jianchaxinxi
-- ----------------------------
DROP TABLE IF EXISTS `jianchaxinxi`;
CREATE TABLE `jianchaxinxi`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `jianchabianhao` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '检查编号',
  `xiangmumingcheng` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目名称',
  `xiangmufenlei` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目分类',
  `jianchashijian` date NULL DEFAULT NULL COMMENT '检查时间',
  `yishenggonghao` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '医生工号',
  `yishengxingming` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '医生姓名',
  `yonghuzhanghao` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户账号',
  `yonghuxingming` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户姓名',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `jianchabianhao`(`jianchabianhao` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1773237785049 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '检查信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jianchaxinxi
-- ----------------------------
INSERT INTO `jianchaxinxi` VALUES (61, '2022-03-16 20:18:45', '1111111111', '血常规', '抽血', '2022-03-16', '医生工号1', '医生姓名1', '1', '落病人');
INSERT INTO `jianchaxinxi` VALUES (62, '2022-03-16 20:18:45', '2222222222', '项目名称', '项目分类2', '2022-03-16', '医生工号2', '医生姓名2', '用户账号2', '用户姓名2');
INSERT INTO `jianchaxinxi` VALUES (63, '2022-03-16 20:18:45', '3333333333', '项目名称3', '项目分类3', '2022-03-16', '医生工号3', '医生姓名3', '用户账号3', '用户姓名3');
INSERT INTO `jianchaxinxi` VALUES (64, '2022-03-16 20:18:45', '4444444444', '项目名称4', '项目分类4', '2022-03-16', '医生工号4', '医生姓名4', '用户账号4', '用户姓名4');
INSERT INTO `jianchaxinxi` VALUES (65, '2022-03-16 20:18:45', '5555555555', '项目名称5', '项目分类5', '2022-03-16', '医生工号5', '医生姓名5', '用户账号5', '用户姓名5');
INSERT INTO `jianchaxinxi` VALUES (66, '2022-03-16 20:18:45', '6666666666', '项目名称6', '项目分类6', '2022-03-16', '医生工号6', '医生姓名6', '用户账号6', '用户姓名6');
INSERT INTO `jianchaxinxi` VALUES (1773237785048, '2026-03-11 22:03:04', '1773237782517', '彩色多音勒超声检查类', '彩色多音勒超声检查类', '2026-03-11', '4', '超声波医生', '1', '落病人');

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `introduction` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '简介',
  `picture` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9005 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '社区公告' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES (9001, '2026-04-06 16:30:25', '社区健康讲座：春季慢病管理专场', '本周六上午开展社区健康讲座，围绕高血压、糖尿病日常管理进行科普。', 'upload/news_picture1.jpg', '<p>社区卫生服务中心将于本周六上午 9:30 在社区活动室开展健康讲座，主题为“春季慢病管理专场”。</p><p>讲座内容包括高血压、糖尿病日常饮食、运动建议、居家监测和复诊提醒，欢迎居民按时参加。</p>');
INSERT INTO `news` VALUES (9002, '2026-04-06 16:30:25', '疫苗接种通知：老年流感疫苗本周开放预约', '社区本周开放老年居民流感疫苗接种预约，请携带身份证按时登记。', 'upload/news_picture2.jpg', '<p>为进一步保障老年居民健康，社区卫生服务中心本周开放流感疫苗接种预约。</p><p>请 60 岁及以上居民携带身份证前往社区服务站登记，也可通过系统预约上门健康咨询。</p>');
INSERT INTO `news` VALUES (9003, '2026-04-06 16:30:25', '社区义诊通知：周日开展免费问诊服务', '本周日社区将开展免费义诊，提供血压血糖测量、健康咨询和慢病指导。', 'upload/news_picture3.jpg', '<p>本周日上午 8:30 至 11:30，社区将联合全科、内科医生开展义诊服务。</p><p>现场提供血压血糖检测、健康咨询、用药指导和慢病随访建议，欢迎居民积极参加。</p>');
INSERT INTO `news` VALUES (9004, '2026-04-06 16:30:25', '儿童预防接种提醒：请及时核对接种时间', '请有适龄儿童的家庭及时核对免疫规划接种时间，避免漏种延种。', 'upload/news_picture4.jpg', '<p>社区卫生服务中心提醒各位家长，儿童预防接种请以免疫接种证登记时间为准，按时完成接种。</p><p>如近期出现发热、咳嗽等情况，请先咨询社区医生后再安排接种。</p>');

-- ----------------------------
-- Table structure for token
-- ----------------------------
DROP TABLE IF EXISTS `token`;
CREATE TABLE `token`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint NOT NULL COMMENT '用户id',
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `tablename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表名',
  `role` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色',
  `token` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'token表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of token
-- ----------------------------
INSERT INTO `token` VALUES (8, 1772007209822, '1', 'yonghu', '用户', '8cd1etutpz8osl7j0emgj317jza5n53w', '2026-03-11 17:09:43', '2026-04-08 13:18:54');
INSERT INTO `token` VALUES (9, 21, '1', 'yisheng', '医生', 'wtf217v8wwtd5xsb8wii55m0e68zgkhk', '2026-03-11 17:09:50', '2026-04-07 22:31:22');
INSERT INTO `token` VALUES (10, 1, 'admin', 'users', '管理员', 'xwkqi1i4nkg0kowwlmfu4n41fypgikrl', '2026-03-11 20:34:58', '2026-04-07 23:00:01');
INSERT INTO `token` VALUES (11, 24, '4', 'yisheng', '医生', 'aojtxw7759lnnfseon3dh3euwvan7jqy', '2026-03-11 22:02:52', '2026-03-11 23:04:41');
INSERT INTO `token` VALUES (12, 11, '用户账号1', 'yonghu', '用户', 'sstfjz8f3hz7jtfbkszidpg02qc7rlma', '2026-04-06 16:31:27', '2026-04-08 01:04:41');
INSERT INTO `token` VALUES (13, 22, '2', 'yisheng', '医生', 'ohrg04iw30d3lucss71dsnknbofe07hz', '2026-04-07 16:05:24', '2026-04-08 01:05:24');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `role` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'admin', 'admin', '管理员', '2022-03-16 20:18:45');

-- ----------------------------
-- Table structure for xiangmufenlei
-- ----------------------------
DROP TABLE IF EXISTS `xiangmufenlei`;
CREATE TABLE `xiangmufenlei`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `xiangmufenlei` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '项目分类',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '项目分类' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of xiangmufenlei
-- ----------------------------
INSERT INTO `xiangmufenlei` VALUES (31, '2022-03-16 20:18:45', '体检类');
INSERT INTO `xiangmufenlei` VALUES (32, '2022-03-16 20:18:45', '口腔类');
INSERT INTO `xiangmufenlei` VALUES (33, '2022-03-16 20:18:45', '儿童类');
INSERT INTO `xiangmufenlei` VALUES (34, '2022-03-16 20:18:45', '彩色多音勒超声检查类');
INSERT INTO `xiangmufenlei` VALUES (35, '2022-03-16 20:18:45', '心电图血压类');
INSERT INTO `xiangmufenlei` VALUES (36, '2022-03-16 20:18:45', '放射类');

-- ----------------------------
-- Table structure for xiangmuxinxi
-- ----------------------------
DROP TABLE IF EXISTS `xiangmuxinxi`;
CREATE TABLE `xiangmuxinxi`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `xiangmubianhao` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目编号',
  `xiangmumingcheng` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '项目名称',
  `xiangmufenlei` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目分类',
  `tupian` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片',
  `feiyong` int NULL DEFAULT NULL COMMENT '费用',
  `xiangmujieshao` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '项目介绍',
  `xiangmuweizhi` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目位置',
  `yishenggonghao` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '医生工号',
  `yishengxingming` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '医生姓名',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `xiangmubianhao`(`xiangmubianhao` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '项目信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of xiangmuxinxi
-- ----------------------------
INSERT INTO `xiangmuxinxi` VALUES (41, '2022-03-16 20:18:45', '1111111111', '体检', '体检类', 'upload/xiangmuxinxi_tupian1.jpg', 10, '血常规、血压、血脂、心肌酶、肝功、肾功、反应蛋白测定、血糖', '体检科室', '1', '体检医生');
INSERT INTO `xiangmuxinxi` VALUES (42, '2022-03-16 20:18:45', '2222222222', '口腔科', '口腔类', 'upload/xiangmuxinxi_tupian2.jpg', 20, '口腔问题', '口腔科室', '2', '口腔医生');
INSERT INTO `xiangmuxinxi` VALUES (43, '2022-03-16 20:18:45', '3333333333', '彩色多音勒超声检查类', '彩色多音勒超声检查类', 'upload/xiangmuxinxi_tupian3.jpg', 110, '腹部常规检查、泌尿系检查、妇科常规检查浅表器官检查、胸部常规检查、单脏器检查、心脏彩超、左心功能测定、室壁运动分析、颈动脉血管彩超、', '超声科室', '4', '超声波医生');
INSERT INTO `xiangmuxinxi` VALUES (44, '2022-03-16 20:18:45', '4444444444', '儿童类', '儿童类', 'upload/xiangmuxinxi_tupian4.jpg', 4, '儿童生长发育、儿童智力、儿童听力、儿童预防接种', '儿科', '3', '儿童医生');
INSERT INTO `xiangmuxinxi` VALUES (45, '2022-03-16 20:18:45', '5555555555', '心电图血压类', '心电图血压类', 'upload/xiangmuxinxi_tupian5.jpg', 5, '项目介绍5', '心电科室', '5', '心电医生');
INSERT INTO `xiangmuxinxi` VALUES (46, '2022-03-16 20:18:45', '6666666666', '放射类', '放射类', 'upload/xiangmuxinxi_tupian6.jpg', 6, '项目介绍6', '放射科室', '6', '放射医生');

-- ----------------------------
-- Table structure for yaopinfenlei
-- ----------------------------
DROP TABLE IF EXISTS `yaopinfenlei`;
CREATE TABLE `yaopinfenlei`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yaopinfenlei` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '药品分类',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 87 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '药品分类' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of yaopinfenlei
-- ----------------------------
INSERT INTO `yaopinfenlei` VALUES (81, '2022-03-16 20:18:45', '消炎药');
INSERT INTO `yaopinfenlei` VALUES (82, '2022-03-16 20:18:45', '促消化药');
INSERT INTO `yaopinfenlei` VALUES (83, '2022-03-16 20:18:45', '止咳药');
INSERT INTO `yaopinfenlei` VALUES (84, '2022-03-16 20:18:45', '止痛药');
INSERT INTO `yaopinfenlei` VALUES (85, '2022-03-16 20:18:45', '祛痰药');
INSERT INTO `yaopinfenlei` VALUES (86, '2022-03-16 20:18:45', '心血管系统用药');

-- ----------------------------
-- Table structure for yaopinxinxi
-- ----------------------------
DROP TABLE IF EXISTS `yaopinxinxi`;
CREATE TABLE `yaopinxinxi`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yaopinbianhao` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '药品编号',
  `yaopinmingcheng` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '药品名称',
  `yaopinfenlei` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '药品分类',
  `jixing` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '剂型',
  `feiyong` int NULL DEFAULT NULL COMMENT '费用',
  `kaiyaoshijian` date NULL DEFAULT NULL COMMENT '开药时间',
  `yishenggonghao` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '医生工号',
  `yishengxingming` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '医生姓名',
  `yonghuzhanghao` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户账号',
  `yonghuxingming` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户姓名',
  `ispay` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '未支付' COMMENT '是否支付',
  `xiangxijieshao` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '详细介绍',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `yaopinbianhao`(`yaopinbianhao` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1773237933961 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '药品信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of yaopinxinxi
-- ----------------------------
INSERT INTO `yaopinxinxi` VALUES (91, '2022-03-16 20:18:45', '1111111111', '布洛芬', '止痛药', '胶囊', 1, '2022-03-16', '医生工号1', '医生姓名1', '用户账号1', '用户姓名1', '未支付', '不是很好吃');
INSERT INTO `yaopinxinxi` VALUES (92, '2022-03-16 20:18:45', '2222222222', '药品名称2', '药品分类2', '颗粒', 2, '2022-03-16', '医生工号2', '医生姓名2', '用户账号2', '用户姓名2', '未支付', NULL);
INSERT INTO `yaopinxinxi` VALUES (93, '2022-03-16 20:18:45', '3333333333', '药品名称3', '药品分类3', '颗粒', 3, '2022-03-16', '医生工号3', '医生姓名3', '用户账号3', '用户姓名3', '未支付', NULL);
INSERT INTO `yaopinxinxi` VALUES (94, '2022-03-16 20:18:45', '4444444444', '药品名称4', '药品分类4', '颗粒', 4, '2022-03-16', '医生工号4', '医生姓名4', '用户账号4', '用户姓名4', '未支付', NULL);
INSERT INTO `yaopinxinxi` VALUES (95, '2022-03-16 20:18:45', '5555555555', '药品名称5', '药品分类5', '颗粒', 5, '2022-03-16', '医生工号5', '医生姓名5', '用户账号5', '用户姓名5', '未支付', NULL);
INSERT INTO `yaopinxinxi` VALUES (96, '2022-03-16 20:18:45', '6666666666', '药品名称6', '药品分类6', '颗粒', 6, '2022-03-16', '医生工号6', '医生姓名6', '用户账号6', '用户姓名6', '未支付', NULL);
INSERT INTO `yaopinxinxi` VALUES (1772800687385, '2026-03-06 20:38:06', '1772800671693', 'mabo', '消炎药', '颗粒', NULL, '2026-03-06', '医生工号1', '医生姓名1', '用户账号1', '用户姓名1', '未支付', NULL);
INSERT INTO `yaopinxinxi` VALUES (1772816930361, '2026-03-07 01:08:50', '1772816912296', '好吃的', '消炎药', '胶囊', NULL, NULL, NULL, NULL, NULL, NULL, '未支付', '');
INSERT INTO `yaopinxinxi` VALUES (1773237933960, '2026-03-11 22:05:33', '1773237905476', '健康药', '消炎药', '颗粒', 50, NULL, NULL, NULL, NULL, NULL, '未支付', '一天两次');

-- ----------------------------
-- Table structure for yisheng
-- ----------------------------
DROP TABLE IF EXISTS `yisheng`;
CREATE TABLE `yisheng`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yishenggonghao` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '医生工号',
  `yishengxingming` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '医生姓名',
  `mima` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `xingbie` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `touxiang` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `keshi` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '科室',
  `dianhuahaoma` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话号码',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `yishenggonghao`(`yishenggonghao` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1772818870046 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '医生' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of yisheng
-- ----------------------------
INSERT INTO `yisheng` VALUES (21, '2022-03-16 20:18:45', '1', '陈医生', '123', '男', 'upload/yisheng_touxiang1.jpg', '体检类', '13823888881');
INSERT INTO `yisheng` VALUES (22, '2022-03-16 20:18:45', '2', '口腔医生', '123', '男', 'upload/yisheng_touxiang2.jpg', '口腔类', '13823888882');
INSERT INTO `yisheng` VALUES (23, '2022-03-16 20:18:45', '3', '儿童医生', '123', '男', 'upload/yisheng_touxiang3.jpg', '儿童类', '13823888883');
INSERT INTO `yisheng` VALUES (24, '2022-03-16 20:18:45', '4', '超声波医生', '123', '男', 'upload/yisheng_touxiang4.jpg', '彩色多音勒超声检查类', '13823888884');
INSERT INTO `yisheng` VALUES (25, '2022-03-16 20:18:45', '5', '心电医生', '123', '男', 'upload/yisheng_touxiang5.jpg', '心电图血压类', '13823888885');
INSERT INTO `yisheng` VALUES (26, '2022-03-16 20:18:45', '6', '放射医生', '123', '男', 'upload/yisheng_touxiang6.jpg', '放射类', '13823888886');
INSERT INTO `yisheng` VALUES (1772007054137, '2026-02-25 16:10:54', '66', '落', '123', NULL, NULL, '骨科', '12312312312');
INSERT INTO `yisheng` VALUES (1772818870045, '2026-03-07 01:41:10', '666', '老六', '123', '男', '', '外科', '');

-- ----------------------------
-- Table structure for yonghu
-- ----------------------------
DROP TABLE IF EXISTS `yonghu`;
CREATE TABLE `yonghu`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yonghuzhanghao` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `yonghuxingming` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户姓名',
  `mima` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `xingbie` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `touxiang` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `dianhuahaoma` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话号码',
  `jinjilianxiren` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '紧急联系人',
  `xuexing` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '血型',
  `jinji` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '禁忌',
  `yinjiuqingkuang` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '饮酒情况',
  `xiyanqingkuang` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '吸烟情况',
  `yundongpinlv` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '运动频率',
  `jingshenyali` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '精神压力',
  `shuimianqingkuang` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '睡眠情况',
  `shengao` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身高',
  `tizhong` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '体重',
  `bmi` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'BMI',
  `xiongwei` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '胸围',
  `yaowei` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '腰围',
  `tunwei` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '臀围',
  `yuejingqingkuang` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '月经情况',
  `jibingshi` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '疾病史',
  `yaopinbaojianpinshiyongqingkuang` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '药品保健品使用情况',
  `yichuanbingshi` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '遗传病史',
  `guominshi` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '过敏史',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `yonghuzhanghao`(`yonghuzhanghao` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1772007209823 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of yonghu
-- ----------------------------
INSERT INTO `yonghu` VALUES (11, '2022-03-16 20:18:45', '用户账号1', '用户姓名1', '123456', '男', 'upload/yonghu_touxiang1.jpg', '13823888881', '13823888881', '血型1', '禁忌1', '从不饮酒', '从不吸烟', '几乎不运动', '低', '', '', '', '', '', '', '', '', '嗯嗯', '对的', '', '');
INSERT INTO `yonghu` VALUES (12, '2022-03-16 20:18:45', '用户账号2', '用户姓名2', '123456', '男', 'upload/yonghu_touxiang2.jpg', '13823888882', '13823888882', '血型2', '禁忌2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `yonghu` VALUES (13, '2022-03-16 20:18:45', '用户账号3', '用户姓名3', '123456', '男', 'upload/yonghu_touxiang3.jpg', '13823888883', '13823888883', '血型3', '禁忌3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `yonghu` VALUES (14, '2022-03-16 20:18:45', '用户账号4', '用户姓名4', '123456', '男', 'upload/yonghu_touxiang4.jpg', '13823888884', '13823888884', '血型4', '禁忌4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `yonghu` VALUES (15, '2022-03-16 20:18:45', '用户账号5', '用户姓名5', '123456', '男', 'upload/yonghu_touxiang5.jpg', '13823888885', '13823888885', '血型5', '禁忌5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `yonghu` VALUES (16, '2022-03-16 20:18:45', '用户账号6', '用户姓名6', '123456', '男', 'upload/yonghu_touxiang6.jpg', '13823888886', '13823888886', '血型6', '禁忌6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `yonghu` VALUES (1647433250381, '2022-03-16 20:20:50', '111', '111', '111', NULL, NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `yonghu` VALUES (1772007209822, '2026-02-25 16:13:29', '1', '落病人', '123', NULL, NULL, '11111111111', '11111111111', '未知', '无', '偶尔饮酒', '从不吸烟', '每周3-5次', '中', '良好', '165', '58', '21.3', NULL, NULL, NULL, NULL, '有高血压家族史，暂无重大手术史。', '日常服用钙片和复合维生素。', '父母有高血压病史。', '青霉素过敏');

-- ----------------------------
-- Table structure for yuyuexinxi
-- ----------------------------
DROP TABLE IF EXISTS `yuyuexinxi`;
CREATE TABLE `yuyuexinxi`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yuyuebianhao` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预约编号',
  `xiangmumingcheng` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目名称',
  `xiangmufenlei` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目分类',
  `yuyueshijian` date NULL DEFAULT NULL COMMENT '预约时间',
  `yonghuzhanghao` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户账号',
  `feiyong` int NULL DEFAULT NULL COMMENT '费用',
  `yonghuxingming` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户姓名',
  `yishenggonghao` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '医生工号',
  `yishengxingming` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '医生姓名',
  `sfsh` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '否' COMMENT '是否审核',
  `shhf` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '审核回复',
  `ispay` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '未支付' COMMENT '是否支付',
  `xiangmuweizhi` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '诊疗位置',
  `fuwuleixing` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务类型',
  `shangmendizhi` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上门地址',
  `shouji` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `yuyueneirong` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '预约内容',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `yuyuebianhao`(`yuyuebianhao` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1775577906254 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '预约信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of yuyuexinxi
-- ----------------------------
INSERT INTO `yuyuexinxi` VALUES (1773237725757, '2026-03-11 22:02:05', '20263112215682052769', '彩色多音勒超声检查类', '彩色多音勒超声检查类', '2026-03-11', '1', 110, '落病人', '4', '超声波医生', '是', '', '已支付', '超声科室', '彩色多音勒超声检查类', '超声科室', NULL, NULL);
INSERT INTO `yuyuexinxi` VALUES (1773237833102, '2026-03-11 22:03:52', '20263112234294215407', '体检', '体检类', '2026-03-11', '1', 10, '落病人', '1', '陈医生', '否', '', '未支付', '体检科室', '体检', '体检科室', NULL, NULL);
INSERT INTO `yuyuexinxi` VALUES (1775577559497, '2026-04-07 15:59:19', '20264723584416188397', '老年人健康体检', '预约上门', '2026-04-07', '用户账号1', 120, '用户姓名1', '2', '口腔医生', '待审核', '', '未支付', '顶顶顶顶顶', '老年人健康体检', '顶顶顶顶顶', '13823888881', '');
INSERT INTO `yuyuexinxi` VALUES (1775577906253, '2026-04-07 16:05:05', '202648044253239094', '老年人健康体检', '预约上门', '2026-04-08', '用户账号1', 120, '用户姓名1', '2', '口腔医生', '待审核', '', '未支付', '胡奴打谁啊混蛋', '老年人健康体检', '胡奴打谁啊混蛋', '13823888881', '牙痛');

SET FOREIGN_KEY_CHECKS = 1;
