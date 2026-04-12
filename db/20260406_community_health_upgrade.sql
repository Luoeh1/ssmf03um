SET NAMES utf8mb4;

-- 患者健康档案扩展字段
ALTER TABLE `yonghu`
  ADD COLUMN `yinjiuqingkuang` varchar(200) DEFAULT NULL COMMENT '饮酒情况' AFTER `jinji`,
  ADD COLUMN `xiyanqingkuang` varchar(200) DEFAULT NULL COMMENT '吸烟情况' AFTER `yinjiuqingkuang`,
  ADD COLUMN `yundongpinlv` varchar(200) DEFAULT NULL COMMENT '运动频率' AFTER `xiyanqingkuang`,
  ADD COLUMN `jingshenyali` varchar(200) DEFAULT NULL COMMENT '精神压力' AFTER `yundongpinlv`,
  ADD COLUMN `shuimianqingkuang` varchar(200) DEFAULT NULL COMMENT '睡眠情况' AFTER `jingshenyali`,
  ADD COLUMN `shengao` varchar(50) DEFAULT NULL COMMENT '身高' AFTER `shuimianqingkuang`,
  ADD COLUMN `tizhong` varchar(50) DEFAULT NULL COMMENT '体重' AFTER `shengao`,
  ADD COLUMN `bmi` varchar(50) DEFAULT NULL COMMENT 'BMI' AFTER `tizhong`,
  ADD COLUMN `xiongwei` varchar(50) DEFAULT NULL COMMENT '胸围' AFTER `bmi`,
  ADD COLUMN `yaowei` varchar(50) DEFAULT NULL COMMENT '腰围' AFTER `xiongwei`,
  ADD COLUMN `tunwei` varchar(50) DEFAULT NULL COMMENT '臀围' AFTER `yaowei`,
  ADD COLUMN `yuejingqingkuang` longtext COMMENT '月经情况' AFTER `tunwei`,
  ADD COLUMN `jibingshi` longtext COMMENT '疾病史' AFTER `yuejingqingkuang`,
  ADD COLUMN `yaopinbaojianpinshiyongqingkuang` longtext COMMENT '药品保健品使用情况' AFTER `jibingshi`,
  ADD COLUMN `yichuanbingshi` longtext COMMENT '遗传病史' AFTER `yaopinbaojianpinshiyongqingkuang`,
  ADD COLUMN `guominshi` longtext COMMENT '过敏史' AFTER `yichuanbingshi`;

-- 预约上门扩展字段
ALTER TABLE `yuyuexinxi`
  ADD COLUMN `fuwuleixing` varchar(200) DEFAULT NULL COMMENT '服务类型' AFTER `xiangmuweizhi`,
  ADD COLUMN `shangmendizhi` varchar(255) DEFAULT NULL COMMENT '上门地址' AFTER `fuwuleixing`,
  ADD COLUMN `shouji` varchar(50) DEFAULT NULL COMMENT '联系电话' AFTER `shangmendizhi`,
  ADD COLUMN `yuyueneirong` longtext COMMENT '预约内容' AFTER `shouji`;

-- 历史预约数据兼容迁移
UPDATE `yuyuexinxi`
SET
  `fuwuleixing` = CASE
    WHEN `fuwuleixing` IS NULL OR `fuwuleixing` = '' THEN `xiangmumingcheng`
    ELSE `fuwuleixing`
  END,
  `shangmendizhi` = CASE
    WHEN `shangmendizhi` IS NULL OR `shangmendizhi` = '' THEN `xiangmuweizhi`
    ELSE `shangmendizhi`
  END,
  `xiangmufenlei` = CASE
    WHEN `xiangmufenlei` IS NULL OR `xiangmufenlei` = '' THEN '预约上门'
    ELSE `xiangmufenlei`
  END;

-- 示例健康档案数据
UPDATE `yonghu`
SET
  `yinjiuqingkuang` = '偶尔饮酒',
  `xiyanqingkuang` = '从不吸烟',
  `yundongpinlv` = '每周3-5次',
  `jingshenyali` = '中',
  `shuimianqingkuang` = '良好',
  `shengao` = '165',
  `tizhong` = '58',
  `bmi` = '21.3',
  `jibingshi` = '有高血压家族史，暂无重大手术史。',
  `yaopinbaojianpinshiyongqingkuang` = '日常服用钙片和复合维生素。',
  `yichuanbingshi` = '父母有高血压病史。',
  `guominshi` = '青霉素过敏'
WHERE `yonghuzhanghao` = '1';

-- 社区公告示例数据
DELETE FROM `news` WHERE `id` IN (9001, 9002, 9003, 9004);

INSERT INTO `news` (`id`, `addtime`, `title`, `introduction`, `picture`, `content`) VALUES
(9001, NOW(), '社区健康讲座：春季慢病管理专场', '本周六上午开展社区健康讲座，围绕高血压、糖尿病日常管理进行科普。', 'upload/news_picture1.jpg', '<p>社区卫生服务中心将于本周六上午 9:30 在社区活动室开展健康讲座，主题为“春季慢病管理专场”。</p><p>讲座内容包括高血压、糖尿病日常饮食、运动建议、居家监测和复诊提醒，欢迎居民按时参加。</p>'),
(9002, NOW(), '疫苗接种通知：老年流感疫苗本周开放预约', '社区本周开放老年居民流感疫苗接种预约，请携带身份证按时登记。', 'upload/news_picture2.jpg', '<p>为进一步保障老年居民健康，社区卫生服务中心本周开放流感疫苗接种预约。</p><p>请 60 岁及以上居民携带身份证前往社区服务站登记，也可通过系统预约上门健康咨询。</p>'),
(9003, NOW(), '社区义诊通知：周日开展免费问诊服务', '本周日社区将开展免费义诊，提供血压血糖测量、健康咨询和慢病指导。', 'upload/news_picture3.jpg', '<p>本周日上午 8:30 至 11:30，社区将联合全科、内科医生开展义诊服务。</p><p>现场提供血压血糖检测、健康咨询、用药指导和慢病随访建议，欢迎居民积极参加。</p>'),
(9004, NOW(), '儿童预防接种提醒：请及时核对接种时间', '请有适龄儿童的家庭及时核对免疫规划接种时间，避免漏种延种。', 'upload/news_picture4.jpg', '<p>社区卫生服务中心提醒各位家长，儿童预防接种请以免疫接种证登记时间为准，按时完成接种。</p><p>如近期出现发热、咳嗽等情况，请先咨询社区医生后再安排接种。</p>');
