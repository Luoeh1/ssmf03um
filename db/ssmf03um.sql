/*
 Navicat Premium Dump SQL

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80019 (8.0.19)
 Source Host           : localhost:3306
 Source Schema         : ssmf03um

 Target Server Type    : MySQL
 Target Server Version : 80019 (8.0.19)
 File Encoding         : 65001

 Date: 07/03/2026 02:16:19
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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '配置文件' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config
-- ----------------------------
INSERT INTO `config` VALUES (1, 'picture1', 'upload/picture1.jpg');
INSERT INTO `config` VALUES (2, 'picture2', 'upload/picture2.jpg');
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
) ENGINE = InnoDB AUTO_INCREMENT = 107 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '电子病例' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dianzibingli
-- ----------------------------
INSERT INTO `dianzibingli` VALUES (101, '2022-03-16 20:18:45', '1111111111', '出去玩摔了，手一直很疼。', '骨折', '手部发力剧烈疼痛', '2022-03-16', '医生工号1', '医生姓名1', '1', '落病人');
INSERT INTO `dianzibingli` VALUES (102, '2022-03-16 20:18:45', '2222222222', '病情详述2', '检查诊断2', '症状2', '2022-03-16', '医生工号2', '医生姓名2', '用户账号2', '用户姓名2');
INSERT INTO `dianzibingli` VALUES (103, '2022-03-16 20:18:45', '3333333333', '病情详述3', '检查诊断3', '症状3', '2022-03-16', '医生工号3', '医生姓名3', '用户账号3', '用户姓名3');
INSERT INTO `dianzibingli` VALUES (104, '2022-03-16 20:18:45', '4444444444', '病情详述4', '检查诊断4', '症状4', '2022-03-16', '医生工号4', '医生姓名4', '用户账号4', '用户姓名4');
INSERT INTO `dianzibingli` VALUES (105, '2022-03-16 20:18:45', '5555555555', '病情详述5', '检查诊断5', '症状5', '2022-03-16', '医生工号5', '医生姓名5', '用户账号5', '用户姓名5');
INSERT INTO `dianzibingli` VALUES (106, '2022-03-16 20:18:45', '6666666666', '病情详述6', '检查诊断6', '症状6', '2022-03-16', '医生工号6', '医生姓名6', '用户账号6', '用户姓名6');

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
) ENGINE = InnoDB AUTO_INCREMENT = 77 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '检查报告' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jianchabaogao
-- ----------------------------
INSERT INTO `jianchabaogao` VALUES (71, '2022-03-16 20:18:45', '1111111111', '项目名称1', '项目分类1', '诊断结果1', '2022-03-16', '医生工号1', '医生姓名1', '用户账号1', '用户姓名1');
INSERT INTO `jianchabaogao` VALUES (72, '2022-03-16 20:18:45', '2222222222', '项目名称2', '项目分类2', '诊断结果2', '2022-03-16', '医生工号2', '医生姓名2', '用户账号2', '用户姓名2');
INSERT INTO `jianchabaogao` VALUES (73, '2022-03-16 20:18:45', '3333333333', '项目名称3', '项目分类3', '诊断结果3', '2022-03-16', '医生工号3', '医生姓名3', '用户账号3', '用户姓名3');
INSERT INTO `jianchabaogao` VALUES (74, '2022-03-16 20:18:45', '4444444444', '项目名称4', '项目分类4', '诊断结果4', '2022-03-16', '医生工号4', '医生姓名4', '用户账号4', '用户姓名4');
INSERT INTO `jianchabaogao` VALUES (75, '2022-03-16 20:18:45', '5555555555', '项目名称5', '项目分类5', '诊断结果5', '2022-03-16', '医生工号5', '医生姓名5', '用户账号5', '用户姓名5');
INSERT INTO `jianchabaogao` VALUES (76, '2022-03-16 20:18:45', '6666666666', '项目名称6', '项目分类6', '诊断结果6', '2022-03-16', '医生工号6', '医生姓名6', '用户账号6', '用户姓名6');

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
) ENGINE = InnoDB AUTO_INCREMENT = 67 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '检查信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jianchaxinxi
-- ----------------------------
INSERT INTO `jianchaxinxi` VALUES (61, '2022-03-16 20:18:45', '1111111111', '项目名称1', '项目分类1', '2022-03-16', '医生工号1', '医生姓名1', '用户账号1', '用户姓名1');
INSERT INTO `jianchaxinxi` VALUES (62, '2022-03-16 20:18:45', '2222222222', '项目名称2', '项目分类2', '2022-03-16', '医生工号2', '医生姓名2', '用户账号2', '用户姓名2');
INSERT INTO `jianchaxinxi` VALUES (63, '2022-03-16 20:18:45', '3333333333', '项目名称3', '项目分类3', '2022-03-16', '医生工号3', '医生姓名3', '用户账号3', '用户姓名3');
INSERT INTO `jianchaxinxi` VALUES (64, '2022-03-16 20:18:45', '4444444444', '项目名称4', '项目分类4', '2022-03-16', '医生工号4', '医生姓名4', '用户账号4', '用户姓名4');
INSERT INTO `jianchaxinxi` VALUES (65, '2022-03-16 20:18:45', '5555555555', '项目名称5', '项目分类5', '2022-03-16', '医生工号5', '医生姓名5', '用户账号5', '用户姓名5');
INSERT INTO `jianchaxinxi` VALUES (66, '2022-03-16 20:18:45', '6666666666', '项目名称6', '项目分类6', '2022-03-16', '医生工号6', '医生姓名6', '用户账号6', '用户姓名6');

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
) ENGINE = InnoDB AUTO_INCREMENT = 117 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '医院公告' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES (111, '2022-03-16 20:18:45', '有梦想，就要努力去实现', '不管你想要怎样的生活，你都要去努力争取，不多尝试一些事情怎么知道自己适合什么、不适合什么呢?你说你喜欢读书，让我给你列书单，你还问我哪里有那么多时间看书;你说自己梦想的职业是广告文案，问我如何成为一个文案，应该具备哪些素质;你说你计划晨跑，但总是因为学习、工作辛苦或者身体不舒服第二天起不了床;你说你一直梦想一个人去长途旅行，但是没钱，父母觉得危险。', 'upload/news_picture1.jpg', '<p>不管你想要怎样的生活，你都要去努力争取，不多尝试一些事情怎么知道自己适合什么、不适合什么呢?</p><p>你说你喜欢读书，让我给你列书单，你还问我哪里有那么多时间看书;你说自己梦想的职业是广告文案，问我如何成为一个文案，应该具备哪些素质;你说你计划晨跑，但总是因为学习、工作辛苦或者身体不舒服第二天起不了床;你说你一直梦想一个人去长途旅行，但是没钱，父母觉得危险。其实，我已经厌倦了你这样说说而已的把戏，我觉得就算我告诉你如何去做，你也不会照做，因为你根本什么都不做。</p><p>真正有行动力的人不需要别人告诉他如何做，因为他已经在做了。就算碰到问题，他也会自己想办法，自己动手去解决或者主动寻求可以帮助他的人，而不是等着别人为自己解决问题。</p><p>首先要学习独立思考。花一点时间想一下自己喜欢什么，梦想是什么，不要别人说想环游世界，你就说你的梦想是环游世界。</p><p>很多人说现实束缚了自己，其实在这个世界上，我们一直都可以有很多选择，生活的决定权也—直都在自己手上，只是我们缺乏行动力而已。</p><p><br></p>');
INSERT INTO `news` VALUES (112, '2022-03-16 20:18:45', '又是一年毕业季', '又是一年毕业季，感慨万千，还记的自己刚进学校那时候的情景，我拖着沉重的行李箱站在偌大的教学楼前面，感叹自己未来的日子即将在这个陌生的校园里度过，而如今斗转星移，浮光掠影，弹指之间，那些青葱岁月如同白驹过隙般悄然从指缝溜走。过去的种种在胸口交集纠结，像打翻的五味瓶，甜蜜，酸楚，苦涩，一并涌上心头。', 'upload/news_picture2.jpg', '<p>又是一年毕业季，感慨万千，还记的自己刚进学校那时候的情景，我拖着沉重的行李箱站在偌大的教学楼前面，感叹自己未来的日子即将在这个陌生的校园里度过，而如今斗转星移，浮光掠影，弹指之间，那些青葱岁月如同白驹过隙般悄然从指缝溜走。</p><p>过去的种种在胸口交集纠结，像打翻的五味瓶，甜蜜，酸楚，苦涩，一并涌上心头。一直都是晚会的忠实参与者，无论是台前还是幕后，忽然间，角色转变，那种感觉确实难以用语言表达。</p><p>	过去的三年，总是默默地期盼着这个好雨时节，因为这时候，会有灿烂的阳光，会有满目的百花争艳，会有香甜的冰激凌，这是个毕业的季节，当时不经世事的我们会殷切地期待学校那一大堆的活动，期待穿上绚丽的演出服或者礼仪服，站在大礼堂镁光灯下尽情挥洒我们的澎拜的激情。</p><p>百感交集，隔岸观火与身临其境的感觉竟是如此不同。从来没想过一场晚会送走的是我们自己的时候会是怎样的感情，毕业就真的意味着结束吗?倔强的我们不愿意承认，谢谢学弟学妹们慷慨的将这次的主题定为“我们在这里”。我知道，这可能是他们对我们这些过来人的尊敬和施舍。</p><p>没有为这场晚会排练、奔波，没有为班级、学生会、文学院出点力，还真有点不习惯，百般无奈中，用“工作忙”个万能的借口来搪塞自己，欺骗别人。其实自己心里明白，那只是在逃避，只是不愿面对繁华落幕后的萧条和落寞。大四了，大家各奔东西，想凑齐班上的人真的是难上加难，敏燕从越南回来，刚落地就匆匆回了学校，那么恋家的人也启程回来了，睿睿学姐也是从家赶来跟我们团圆。大家—如既往的寒暄、打趣、调侃对方，似乎一切又回到了当初的单纯美好。</p><p>看着舞台上活泼可爱的学弟学妹们，如同一群机灵的小精灵，清澈的眼神，稚嫩的肢体，轻快地步伐，用他们那热情洋溢的舞姿渲染着在场的每一个人，我知道，我不应该羡慕嫉妒他们，不应该顾自怜惜逝去的青春，不应该感叹夕阳无限好，曾经，我们也拥有过，曾经，我们也年轻过，曾经，我们也灿烂过。我深深地告诉自己，人生的每个阶段都是美的，年轻有年轻的活力，成熟也有成熟的魅力。多—份稳重、淡然、优雅，也是漫漫时光掠影遗留下的.珍贵赏赐。</p>');
INSERT INTO `news` VALUES (113, '2022-03-16 20:18:45', '挫折路上，坚持常在心间', '回头看看，你会不会发现，曾经的你在这里摔倒过;回头看看，你是否发现，一次次地重复着，却从没爬起过。而如今，让我们把视线转向前方，那一道道金色的弧线，是流星飞逝的痕迹，或是成功运行的轨道。今天的你，是否要扬帆起航，让幸福来敲门?清晨的太阳撒向大地，神奇的宇宙赋予它神奇的色彩，大自然沐浴着春光，世界因太阳的照射而精彩，林中百鸟啾啾，河水轻轻流淌，汇成清宁的山间小调。', 'upload/news_picture3.jpg', '<p>回头看看，你会不会发现，曾经的你在这里摔倒过;回头看看，你是否发现，一次次地重复着，却从没爬起过。而如今，让我们把视线转向前方，那一道道金色的弧线，是流星飞逝的痕迹，或是成功运行的轨道。今天的你，是否要扬帆起航，让幸福来敲门?</p><p>清晨的太阳撒向大地，神奇的宇宙赋予它神奇的色彩，大自然沐浴着春光，世界因太阳的照射而精彩，林中百鸟啾啾，河水轻轻流淌，汇成清宁的山间小调。</p><p>是的，面对道途上那无情的嘲讽，面对步伐中那重复的摔跤，面对激流与硬石之间猛烈的碰撞，我们必须选择那富于阴雨，却最终见到彩虹的荆棘路。也许，经历了那暴风雨的洗礼，我们便会变得自信，幸福也随之而来。</p><p>司马迁屡遭羞辱，却依然在狱中撰写《史记》，作为一名史学家，不因王权而极度赞赏，也不因卑微而极度批判，然而他在坚持自己操守的同时，却依然要受统治阶级的阻碍，他似乎无权选择自己的本职。但是，他不顾于此，只是在面对道途的阻隔之时，他依然选择了走下去的信念。终于一部开山巨作《史记》诞生，为后人留下一份馈赠，也许在他完成毕生的杰作之时，他微微地笑了，没有什么比梦想实现更快乐的了......</p><p>	或许正如“长风破浪会有时，直挂云帆济沧海”一般，欣欣然地走向看似深渊的崎岖路，而在一番耕耘之后，便会发现这里另有一番天地。也许这就是困难与快乐的交融。</p><p>也许在形形色色的社会中，我们常能看到一份坚持，一份自信，但这里却还有一类人。这类人在暴风雨来临之际，只会闪躲，从未懂得这也是一种历炼，这何尝不是一份快乐。在阴暗的角落里，总是独自在哭，带着伤愁，看不到一点希望。</p><p>我们不能堕落于此，而要像海燕那般，在苍茫的大海上，高傲地飞翔，任何事物都无法阻挡，任何事都是幸福快乐的。</p>');
INSERT INTO `news` VALUES (114, '2022-03-16 20:18:45', '挫折是另一个生命的开端', '当遇到挫折或失败，你是看见失败还是看见机会?挫折是我们每个人成长的必经之路，它不是你想有就有，想没有就没有的。有句名言说的好，如果你想一生摆脱苦难，你就得是神或者是死尸。这句话形象地说明了挫折是伴随着人生的，是谁都逃不掉的。', 'upload/news_picture4.jpg', '<p>当遇到挫折或失败，你是看见失败还是看见机会?</p><p>挫折是我们每个人成长的必经之路，它不是你想有就有，想没有就没有的。有句名言说的好，如果你想一生摆脱苦难，你就得是神或者是死尸。这句话形象地说明了挫折是伴随着人生的，是谁都逃不掉的。</p><p>人生在世，从古到今，不分天子平民，机遇虽有不同，但总不免有身陷困境或遭遇难题之处，这时候唯有通权达变，才能使人转危为安，甚至反败为胜。</p><p>大部分的人，一生当中，最痛苦的经验是失去所爱的人，其次是丢掉一份工作。其实，经得起考验的人，就算是被开除也不会惊慌，要学会面对。</p><p>“塞翁失马，焉知非福。”人生的道路，并不是每一步都迈向成功，这就是追求的意义。我们还要认识到一点，挫折作为一种情绪状态和一种个人体验，各人的耐受性是大不相同的，有的人经历了一次次挫折，就能够坚忍不拔，百折不挠;有的人稍遇挫折便意志消沉，一蹶不振。所以，挫折感是一种主观感受，因为人的目的和需要不同，成功标准不同，所以同一种活动对于不同的人可能会造成不同的挫折感受。</p><p><br></p>');
INSERT INTO `news` VALUES (115, '2022-03-16 20:18:45', '你要去相信，没有到不了的明天', '有梦想就去努力，因为在这一辈子里面，现在不去勇敢的努力，也许就再也没有机会了。你要去相信，一定要相信，没有到不了的明天。不要被命运打败，让自己变得更强大。不管你现在是一个人走在异乡的街道上始终没有找到一丝归属感，还是你在跟朋友们一起吃饭开心址笑着的时候闪过一丝落寞。', 'upload/news_picture5.jpg', '<p>有梦想就去努力，因为在这一辈子里面，现在不去勇敢的努力，也许就再也没有机会了。你要去相信，一定要相信，没有到不了的明天。不要被命运打败，让自己变得更强大。</p><p>不管你现在是一个人走在异乡的街道上始终没有找到一丝归属感，还是你在跟朋友们一起吃饭开心址笑着的时候闪过一丝落寞。</p><p>不管你现在是在图书馆里背着怎么也看不进去的英语单词，还是你现在迷茫地看不清未来的方向不知道要往哪走。</p><p>不管你现在是在努力着去实现梦想却没能拉近与梦想的距离，还是你已经慢慢地找不到自己的梦想了。</p><p>你都要去相信，没有到不了的明天。</p><p>有的时候你的梦想太大，别人说你的梦想根本不可能实现;有的时候你的梦想又太小，又有人说你胸无大志;有的时候你对死党说着将来要去环游世界的梦想，却换来他的不屑一顾，于是你再也不提自己的梦想;有的时候你突然说起将来要开个小店的愿望，却发现你讲述的那个人，并没有听到你在说什么。</p>');
INSERT INTO `news` VALUES (116, '2022-03-16 20:18:45', '离开是一种痛苦，是一种勇气，但同样也是一个考验，是一个新的开端', '无穷无尽是离愁，天涯海角遍寻思。当离别在即之时，当面对着相濡以沫兄弟般的朋友时，当面对着经历了四年的磨合而形成的真挚友谊之时，我内心激动无语，说一声再见，道一声珍重都很难出口。回想自己四年大学的风风雨雨，回想我们曾经共同经历的岁月流年，我感谢大家的相扶相依，感谢朋友们的莫大支持与帮助。虽然舍不得，但离别的脚步却不因我们的挚情而停滞。', 'upload/news_picture6.jpg', '<p>无穷无尽是离愁，天涯海角遍寻思。当离别在即之时，当面对着相濡以沫兄弟般的朋友时，当面对着经历了四年的磨合而形成的真挚友谊之时，我内心激动无语，说一声再见，道一声珍重都很难出口。回想自己四年大学的风风雨雨，回想我们曾经共同经历的岁月流年，我感谢大家的相扶相依，感谢朋友们的莫大支持与帮助。虽然舍不得，但离别的脚步却不因我们的挚情而停滞。离别的确是一种痛苦，但同样也是我们走入社会，走向新环境、新领域的一个开端，希望大家在以后新的工作岗位上能够确定自己的新起点，坚持不懈，向着更新、更高的目标前进，因为人生最美好的东西永远都在最前方!</p><p>忆往昔峥嵘岁月，看今朝潮起潮落，望未来任重而道远。作为新时代的我们，就应在失败时，能拼搏奋起，去谱写人生的辉煌。在成功时，亦能居安思危，不沉湎于一时的荣耀、鲜花和掌声中，时时刻刻怀着一颗积极寻找自己新的奶酪的心，处变不惊、成败不渝，始终踏着自己坚实的步伐，从零开始，不断向前迈进，这样才能在这风起云涌、变幻莫测的社会大潮中成为真正的弄潮儿!</p>');

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
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'token表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of token
-- ----------------------------
INSERT INTO `token` VALUES (1, 1647433250381, '111', 'yonghu', '用户', 'n63j8rig8q54gy1d0iiycaq55k7uj552', '2022-03-16 20:20:55', '2022-03-16 21:20:56');
INSERT INTO `token` VALUES (2, 11, '用户账号1', 'yonghu', '用户', 'demcqdu6i035b18k8451p5ygc5l1h255', '2022-03-16 20:22:40', '2022-03-16 21:22:40');
INSERT INTO `token` VALUES (3, 1772007054137, '1', 'yisheng', '医生', 'xh6datpirste8xoygx20pyajr94nfp3c', '2026-02-25 16:11:28', '2026-03-06 21:43:59');
INSERT INTO `token` VALUES (4, 1772007209822, '1', 'yonghu', '用户', 'aqgc4dp5v6fc69v8uy4rj7ove60s4tk7', '2026-02-25 16:13:36', '2026-03-07 03:11:00');
INSERT INTO `token` VALUES (5, 1, 'admin', 'users', '管理员', 'jl7erk8kx81gchfumclbygp8h4c1i531', '2026-03-03 20:55:53', '2026-03-07 03:03:45');
INSERT INTO `token` VALUES (6, 21, '医生工号1', 'yisheng', '医生', 'sco9k2sjj6qucwgfw6xf447mfj04o3td', '2026-03-03 23:13:54', '2026-03-07 02:53:10');

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '项目分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xiangmufenlei
-- ----------------------------
INSERT INTO `xiangmufenlei` VALUES (31, '2022-03-16 20:18:45', '外科');
INSERT INTO `xiangmufenlei` VALUES (32, '2022-03-16 20:18:45', '内科');
INSERT INTO `xiangmufenlei` VALUES (33, '2022-03-16 20:18:45', '男科');
INSERT INTO `xiangmufenlei` VALUES (34, '2022-03-16 20:18:45', '妇科');
INSERT INTO `xiangmufenlei` VALUES (35, '2022-03-16 20:18:45', '牙科');
INSERT INTO `xiangmufenlei` VALUES (36, '2022-03-16 20:18:45', '骨科');

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
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '项目信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xiangmuxinxi
-- ----------------------------
INSERT INTO `xiangmuxinxi` VALUES (41, '2022-03-16 20:18:45', '1111111111', '腿打断', '外科', 'upload/xiangmuxinxi_tupian1.jpg', 10, '都是装的，腿打断就好了', '阳光学院', '1', '落');
INSERT INTO `xiangmuxinxi` VALUES (42, '2022-03-16 20:18:45', '2222222222', '打出内伤', '内科', 'upload/xiangmuxinxi_tupian2.jpg', 20, '项目介绍2', '内科01', '医生工号2', '医生姓名2');
INSERT INTO `xiangmuxinxi` VALUES (43, '2022-03-16 20:18:45', '3333333333', '项目名称3', '项目分类3', 'upload/xiangmuxinxi_tupian3.jpg', 3, '项目介绍3', '项目位置3', '医生工号3', '医生姓名3');
INSERT INTO `xiangmuxinxi` VALUES (44, '2022-03-16 20:18:45', '4444444444', '项目名称4', '项目分类4', 'upload/xiangmuxinxi_tupian4.jpg', 4, '项目介绍4', '项目位置4', '医生工号4', '医生姓名4');
INSERT INTO `xiangmuxinxi` VALUES (45, '2022-03-16 20:18:45', '5555555555', '项目名称5', '项目分类5', 'upload/xiangmuxinxi_tupian5.jpg', 5, '项目介绍5', '项目位置5', '医生工号5', '医生姓名5');
INSERT INTO `xiangmuxinxi` VALUES (46, '2022-03-16 20:18:45', '6666666666', '项目名称6', '项目分类6', 'upload/xiangmuxinxi_tupian6.jpg', 6, '项目介绍6', '项目位置6', '医生工号6', '医生姓名6');

-- ----------------------------
-- Table structure for yaopinfenlei
-- ----------------------------
DROP TABLE IF EXISTS `yaopinfenlei`;
CREATE TABLE `yaopinfenlei`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yaopinfenlei` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '药品分类',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 87 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '药品分类' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1772816930362 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '药品信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yaopinxinxi
-- ----------------------------
INSERT INTO `yaopinxinxi` VALUES (91, '2022-03-16 20:18:45', '1111111111', '药品名称1', '消炎药', '颗粒', 1, '2022-03-16', '医生工号1', '医生姓名1', '用户账号1', '用户姓名1', '未支付', '不是很好吃');
INSERT INTO `yaopinxinxi` VALUES (92, '2022-03-16 20:18:45', '2222222222', '药品名称2', '药品分类2', '颗粒', 2, '2022-03-16', '医生工号2', '医生姓名2', '用户账号2', '用户姓名2', '未支付', NULL);
INSERT INTO `yaopinxinxi` VALUES (93, '2022-03-16 20:18:45', '3333333333', '药品名称3', '药品分类3', '颗粒', 3, '2022-03-16', '医生工号3', '医生姓名3', '用户账号3', '用户姓名3', '未支付', NULL);
INSERT INTO `yaopinxinxi` VALUES (94, '2022-03-16 20:18:45', '4444444444', '药品名称4', '药品分类4', '颗粒', 4, '2022-03-16', '医生工号4', '医生姓名4', '用户账号4', '用户姓名4', '未支付', NULL);
INSERT INTO `yaopinxinxi` VALUES (95, '2022-03-16 20:18:45', '5555555555', '药品名称5', '药品分类5', '颗粒', 5, '2022-03-16', '医生工号5', '医生姓名5', '用户账号5', '用户姓名5', '未支付', NULL);
INSERT INTO `yaopinxinxi` VALUES (96, '2022-03-16 20:18:45', '6666666666', '药品名称6', '药品分类6', '颗粒', 6, '2022-03-16', '医生工号6', '医生姓名6', '用户账号6', '用户姓名6', '未支付', NULL);
INSERT INTO `yaopinxinxi` VALUES (1772800687385, '2026-03-06 20:38:06', '1772800671693', 'mabo', '消炎药', '颗粒', NULL, '2026-03-06', '医生工号1', '医生姓名1', '用户账号1', '用户姓名1', '未支付', NULL);
INSERT INTO `yaopinxinxi` VALUES (1772816930361, '2026-03-07 01:08:50', '1772816912296', '好吃的', '消炎药', '胶囊', NULL, NULL, NULL, NULL, NULL, NULL, '未支付', '');

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
) ENGINE = InnoDB AUTO_INCREMENT = 1772818870046 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '医生' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yisheng
-- ----------------------------
INSERT INTO `yisheng` VALUES (21, '2022-03-16 20:18:45', '1', '医生1', '123', '男', 'upload/yisheng_touxiang1.jpg', '外科', '13823888881');
INSERT INTO `yisheng` VALUES (22, '2022-03-16 20:18:45', '医生工号2', '医生姓名2', '123456', '男', 'upload/yisheng_touxiang2.jpg', '内科', '13823888882');
INSERT INTO `yisheng` VALUES (23, '2022-03-16 20:18:45', '医生工号3', '医生姓名3', '123456', '男', 'upload/yisheng_touxiang3.jpg', '男科', '13823888883');
INSERT INTO `yisheng` VALUES (24, '2022-03-16 20:18:45', '医生工号4', '医生姓名4', '123456', '男', 'upload/yisheng_touxiang4.jpg', '妇科', '13823888884');
INSERT INTO `yisheng` VALUES (25, '2022-03-16 20:18:45', '医生工号5', '医生姓名5', '123456', '男', 'upload/yisheng_touxiang5.jpg', '骨科', '13823888885');
INSERT INTO `yisheng` VALUES (26, '2022-03-16 20:18:45', '医生工号6', '医生姓名6', '123456', '男', 'upload/yisheng_touxiang6.jpg', '外科', '13823888886');
INSERT INTO `yisheng` VALUES (1772007054137, '2026-02-25 16:10:54', '3', '落', '123', NULL, NULL, '骨科', '12312312312');
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
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `yonghuzhanghao`(`yonghuzhanghao` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1772007209823 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yonghu
-- ----------------------------
INSERT INTO `yonghu` VALUES (11, '2022-03-16 20:18:45', '用户账号1', '用户姓名1', '123456', '男', 'upload/yonghu_touxiang1.jpg', '13823888881', '13823888881', '血型1', '禁忌1');
INSERT INTO `yonghu` VALUES (12, '2022-03-16 20:18:45', '用户账号2', '用户姓名2', '123456', '男', 'upload/yonghu_touxiang2.jpg', '13823888882', '13823888882', '血型2', '禁忌2');
INSERT INTO `yonghu` VALUES (13, '2022-03-16 20:18:45', '用户账号3', '用户姓名3', '123456', '男', 'upload/yonghu_touxiang3.jpg', '13823888883', '13823888883', '血型3', '禁忌3');
INSERT INTO `yonghu` VALUES (14, '2022-03-16 20:18:45', '用户账号4', '用户姓名4', '123456', '男', 'upload/yonghu_touxiang4.jpg', '13823888884', '13823888884', '血型4', '禁忌4');
INSERT INTO `yonghu` VALUES (15, '2022-03-16 20:18:45', '用户账号5', '用户姓名5', '123456', '男', 'upload/yonghu_touxiang5.jpg', '13823888885', '13823888885', '血型5', '禁忌5');
INSERT INTO `yonghu` VALUES (16, '2022-03-16 20:18:45', '用户账号6', '用户姓名6', '123456', '男', 'upload/yonghu_touxiang6.jpg', '13823888886', '13823888886', '血型6', '禁忌6');
INSERT INTO `yonghu` VALUES (1647433250381, '2022-03-16 20:20:50', '111', '111', '111', NULL, NULL, '', '', '', '');
INSERT INTO `yonghu` VALUES (1772007209822, '2026-02-25 16:13:29', '1', '落病人', '123', NULL, NULL, '11111111111', '11111111111', '未知', '无');

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
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `yuyuebianhao`(`yuyuebianhao` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1772637692036 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '预约信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yuyuexinxi
-- ----------------------------
INSERT INTO `yuyuexinxi` VALUES (51, '2022-03-16 20:18:45', '1111111111', '项目名称1', '项目分类1', '2022-03-16', '用户账号1', 1, '用户姓名1', '医生工号1', '医生姓名1', '否', '钱太少了', '未支付', NULL);
INSERT INTO `yuyuexinxi` VALUES (52, '2022-03-16 20:18:45', '2222222222', '项目名称2', '项目分类2', '2022-03-16', '用户账号2', 2, '用户姓名2', '医生工号2', '医生姓名2', '是', '', '未支付', NULL);
INSERT INTO `yuyuexinxi` VALUES (53, '2022-03-16 20:18:45', '3333333333', '项目名称3', '项目分类3', '2022-03-16', '用户账号3', 3, '用户姓名3', '医生工号3', '医生姓名3', '是', '', '未支付', NULL);
INSERT INTO `yuyuexinxi` VALUES (54, '2022-03-16 20:18:45', '4444444444', '项目名称4', '项目分类4', '2022-03-16', '用户账号4', 4, '用户姓名4', '医生工号4', '医生姓名4', '是', '', '未支付', NULL);
INSERT INTO `yuyuexinxi` VALUES (55, '2022-03-16 20:18:45', '5555555555', '项目名称5', '项目分类5', '2022-03-16', '用户账号5', 5, '用户姓名5', '医生工号5', '医生姓名5', '是', '', '未支付', NULL);
INSERT INTO `yuyuexinxi` VALUES (56, '2022-03-16 20:18:45', '6666666666', '项目名称6', '项目分类6', '2022-03-16', '用户账号6', 6, '用户姓名6', '医生工号6', '医生姓名6', '是', '', '未支付', NULL);
INSERT INTO `yuyuexinxi` VALUES (1772515937280, '2026-03-03 13:32:16', '20263313321445588019', '项目名称1', '项目分类1', '2026-03-03', '1', 1, '落病人', '医生工号1', '医生姓名1', '是', NULL, '已支付', NULL);
INSERT INTO `yuyuexinxi` VALUES (1772551704833, '2026-03-03 23:28:24', '20263323273886324733', '项目名称1', NULL, '2026-03-04', NULL, NULL, NULL, NULL, NULL, '否', NULL, '未支付', NULL);
INSERT INTO `yuyuexinxi` VALUES (1772551977891, '2026-03-03 23:32:57', '20263323315326389493', '项目名称1', NULL, '2026-03-06', NULL, NULL, NULL, NULL, NULL, '否', NULL, '未支付', NULL);
INSERT INTO `yuyuexinxi` VALUES (1772552565012, '2026-03-03 23:42:44', '20263323412298345414', '123', '1123', '2026-03-04', '1', NULL, '落病人', '1', '1', '否', NULL, '未支付', NULL);
INSERT INTO `yuyuexinxi` VALUES (1772637692035, '2026-03-04 23:21:32', '20263423201779389452', '1', '1', '2026-03-04', '1', 666, '落病人', '医生工号1', '1', '是', NULL, '未支付', NULL);

SET FOREIGN_KEY_CHECKS = 1;
